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
