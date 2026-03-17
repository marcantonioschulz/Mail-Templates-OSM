#!/usr/bin/env python3
"""Render HTML mail templates to PDFs using headless Chromium (Playwright).

Why this converter looks closer to real emails:
- Uses real browser rendering (Chromium)
- Forces screen media (not print CSS fallback)
- Keeps background colors/images in PDF output
- Resolves local relative assets via file:// URLs
"""

from pathlib import Path
import argparse
from playwright.sync_api import sync_playwright


DEFAULT_TEMPLATE_DIRS = [
    'Formulare',
    'Follow up',
    'Vorlagen Kalender',
    'Webseiten Widget',
    'Webinar_12.04.',
]


def collect_html_files(base_dir: Path, input_dirs: list[str]) -> list[Path]:
    html_files: list[Path] = []
    for folder in input_dirs:
        folder_path = base_dir / folder
        if not folder_path.exists():
            continue
        html_files.extend(sorted(folder_path.glob('*.html')))
    return html_files


def ensure_output_dir(path: Path, clean: bool) -> None:
    path.mkdir(parents=True, exist_ok=True)
    if clean:
        for old_pdf in path.glob('*.pdf'):
            old_pdf.unlink()


def main() -> None:
    parser = argparse.ArgumentParser(description='Convert HTML templates to PDF with Playwright.')
    parser.add_argument(
        '--input-dir',
        action='append',
        dest='input_dirs',
        help='Template folder relative to repo root. Can be used multiple times.',
    )
    parser.add_argument(
        '--output-dir',
        default='PDF',
        help='Output folder relative to repo root (default: PDF).',
    )
    parser.add_argument(
        '--clean',
        action='store_true',
        help='Delete existing PDFs in output folder before conversion.',
    )
    parser.add_argument(
        '--fit-one-page',
        action='store_true',
        help='Shrink each template to fit on a single A4 page.',
    )
    parser.add_argument(
        '--fit-readable',
        action='store_true',
        help='Readable fit: shrink when needed but never below 85%% scale.',
    )
    parser.add_argument(
        '--min-scale',
        type=float,
        default=0.1,
        help='Minimum scale for fit mode (0.1 to 1.0). Default: 0.1',
    )
    args = parser.parse_args()

    base_dir = Path(__file__).resolve().parent
    input_dirs = args.input_dirs if args.input_dirs else DEFAULT_TEMPLATE_DIRS
    output_dir = base_dir / args.output_dir

    ensure_output_dir(output_dir, clean=args.clean)
    html_files = collect_html_files(base_dir, input_dirs)

    min_scale = max(0.1, min(1.0, args.min_scale))
    if args.fit_readable and args.min_scale == 0.1:
        min_scale = 0.85

    if not html_files:
        print('Keine HTML-Dateien gefunden.')
        return

    converted = 0
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page(viewport={'width': 1280, 'height': 1800})
        page.emulate_media(media='screen')

        # A4 height in CSS px at 96 DPI (11.69in * 96)
        target_height_px = 1122.0

        for html_file in html_files:
            pdf_path = output_dir / f'{html_file.stem}.pdf'
            print(f'Converting {html_file.relative_to(base_dir)} -> {pdf_path.relative_to(base_dir)}')
            page.goto(html_file.resolve().as_uri(), wait_until='networkidle')

            scale = 1.0
            if args.fit_one_page or args.fit_readable:
                # Measure content with a tiny viewport so scrollHeight reflects real content,
                # not the current viewport height floor.
                page.set_viewport_size({'width': 1280, 'height': 100})
                content_height = page.evaluate(
                    "Math.max(document.body.scrollHeight, document.documentElement.scrollHeight)"
                )
                page.set_viewport_size({'width': 1280, 'height': 1800})

                if content_height and content_height > 0:
                    scale = min(1.0, target_height_px / float(content_height))
                    # Playwright requires scale in [0.1, 2]
                    scale = max(min_scale, scale)

            page.pdf(
                path=str(pdf_path),
                format='A4',
                print_background=True,
                prefer_css_page_size=True,
                scale=scale,
                margin={'top': '0mm', 'right': '0mm', 'bottom': '0mm', 'left': '0mm'},
            )
            converted += 1

        browser.close()

    print(f'Fertig: {converted} PDF(s) gespeichert in {output_dir.relative_to(base_dir)}')


if __name__ == '__main__':
    main()
