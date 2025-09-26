# OSM Mail Templates

This repository contains HTML templates for emails, forms, and calendar notifications used in the "Endlich Zuhause" OSM system.

## Project Overview

The repository is organized by template type and usage context. It contains only HTML files with inline styles, designed for maximum compatibility with email clients. There is no backend code or build system.

## Directory Structure

- `Vorlagen Kalender/`: Calendar-related HTML templates for internal and customer notifications.
- `Formulare/`: HTML forms for internal and customer use (e.g., contact, career, appointment forms).
- `Follow up/`: HTML templates for follow-up communications.
- `PDF/`: Reference PDFs for notification and confirmation content.
- `Webseiten Widget/`: HTML for web widget forms.

## Key Patterns & Conventions

- **Prefixes**: `INT_` (internal) and `KND_` (customer) indicate the audience.
- **Suffixes**: Describe the template purpose (e.g., `bestaetigung`, `reminder`, `storno`).
- **Styling**: Templates are standalone HTML files with inline styles for email client compatibility.
- **Language**: Most content is in German. Please maintain language consistency.

## Merge Fields

This project uses GoHighLevel merge fields to personalize templates.

- The central reference for all available fields is the `.github/merge-fields.md` file.
- Fields are written without spaces inside the curly braces (e.g., `{{contact.first_name}}`).

### Example

```html
<p>Hallo {{contact.first_name}}, Ihr Termin ist am {{appointment.start_time}}.</p>
<a href="{{appointment.cancellation_link}}">Termin absagen</a>
```

## Developer Workflow

1. **Edit**: Directly edit the HTML files for content or layout changes.
2. **Preview**: Open the HTML files in a browser or use an email testing tool to validate the appearance.
3. **Commit**: There are no automated build or deployment scripts. Manual validation is required before committing changes.

## PDF Export & Printing

The workflow now uses Playwright (Chromium) for pixel-perfect PDF rendering matching the email look.
All PDFs are saved in the `PDF/` directory, using the original template filenames. The `PDF/` folder is ignored by git and can be used for printing or sharing.

### Setup (one-time)

1. **Create and activate a Python virtual environment** (recommended):
   ```sh
   python3 -m venv venv_pdf
   source venv_pdf/bin/activate
   ```
2. **Install dependencies**:
   ```sh
   pip install playwright
   python -m playwright install chromium
   ```

### Usage

1. **Run the conversion script**:
   ```sh
   python html2pdf.py
   ```
   - All HTML templates in the main folders will be converted automatically.
   - PDFs are saved in `PDF/` with matching filenames.

### Troubleshooting

- If you see errors about missing Chromium, rerun:
  ```sh
  python -m playwright install chromium
  ```
- For best results, ensure all HTML templates use inline styles and are designed for email clients.
- If layout issues persist, adjust the HTML or CSS and rerun the script.

**Note:** The script deletes old PDFs before each run to avoid stale files.
