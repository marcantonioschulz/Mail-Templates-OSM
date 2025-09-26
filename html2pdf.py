#!/usr/bin/env python3
"""
Konvertiert alle HTML-Templates in PDFs mit headless Chromium (Playwright).
Vor jedem Lauf werden alle alten PDFs im PDF-Ordner gelöscht.
Benötigt: playwright (pip install playwright) und einmalig: playwright install chromium
"""
import os
from glob import glob
from playwright.sync_api import sync_playwright

# Directories containing HTML templates
TEMPLATE_DIRS = [
    'Formulare',
    'Follow up',
    'Vorlagen Kalender',
    'Webseiten Widget'
]
OUTPUT_DIR = 'PDF'

# Lösche alle alten PDFs im Ausgabeverzeichnis
for old_pdf in glob(os.path.join(OUTPUT_DIR, '*.pdf')):
    os.remove(old_pdf)

os.makedirs(OUTPUT_DIR, exist_ok=True)

with sync_playwright() as p:
    browser = p.chromium.launch()
    page = browser.new_page()
    for folder in TEMPLATE_DIRS:
        html_files = glob(os.path.join(folder, '*.html'))
        for html_path in html_files:
            base = os.path.splitext(os.path.basename(html_path))[0]
            pdf_path = os.path.join(OUTPUT_DIR, base + '.pdf')
            print(f'Converting {html_path} -> {pdf_path}')
            with open(html_path, encoding='utf-8') as f:
                html_content = f.read()
            page.set_content(html_content, wait_until='load')
            page.pdf(path=pdf_path, format='A4', margin={'top':'0mm','bottom':'0mm','left':'0mm','right':'0mm'})
    browser.close()

print('Alle HTML-Templates wurden als PDF gespeichert.')
