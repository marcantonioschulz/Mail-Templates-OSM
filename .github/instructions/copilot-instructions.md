
# Copilot Instructions for AI Coding Agents

## Project Overview
This repository contains HTML templates for emails, forms, and calendar notifications used in the "Endlich Zuhause" OSM system. All files are standalone HTML, organized by template type and usage context. There is no backend code, build system, or package management.

## Directory Structure
- `Vorlagen Kalender/`: Calendar notification templates (internal/customer).
- `Formulare/`: HTML forms for internal/customer use (contact, career, appointment).
- `Follow up/`: Follow-up email templates.
- `PDF/`: Reference PDFs for notification/confirmation.
- `Webseiten Widget/`: Web widget form HTML.

## Key Patterns & Conventions
- **Prefixes**: `INT_` (internal) and `KND_` (customer) indicate audience.
- **Suffixes**: Describe template purpose (e.g., `bestaetigung`, `reminder`, `storno`).
- **Styling**: Inline CSS for email compatibility; minimal JS.
- **Language**: Most content is in German—maintain consistency.
- **Merge Fields**: Use GoHighLevel merge fields and custom fields (see `.github/merge-fields.md`). Fields use double curly braces, no spaces (e.g., `{{contact.first_name}}`).

## Developer Workflow
- Directly edit HTML files for changes.
- Preview in browser or email client for formatting.
- No automated build/test/deploy; manual validation required.
- Reference similar templates for new ones (e.g., copy a `KND_` file for a new customer template).

## Integration Points
- Templates are integrated into CRM, calendar, or widget systems. Keep placeholders/IDs consistent for downstream use.
- For fallback values, use GoHighLevel workflows (see CRM documentation).

## Example Merge Fields
```html
<p>Hallo {{contact.first_name}}, Ihr Termin ist am {{appointment.start_time}}.</p>
<a href="{{appointment.cancellation_link}}">Termin absagen</a>
```

## Additional Notes
- No backend, frameworks, or package management.
- When adding new template types, follow naming/folder conventions.
- For questions or unclear conventions, ask for clarification or reference existing templates.

---
