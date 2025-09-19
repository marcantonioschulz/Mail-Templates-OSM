# Copilot Instructions for AI Coding Agents

## Project Overview
This repository contains HTML templates for emails, forms, and calendar notifications used in the "Endlich Zuhause" OSM system. The structure is organized by template type and usage context, with no backend code or build system present.

## Directory Structure
- `Vorlagen Kalender/`: Calendar-related HTML templates for internal and customer notifications.
- `Formulare/`: HTML forms for internal and customer use (e.g., contact, career, appointment forms).
- `Follow up/`: HTML templates for follow-up communications.
- `PDF/`: Reference PDFs for notification and confirmation content.
- `Webseiten Widget/`: HTML for web widget forms.

## Key Patterns & Conventions
  - Prefixes like `INT_` (internal) and `KND_` (customer) indicate the audience.
  - Suffixes describe the template purpose (e.g., `bestaetigung`, `reminder`, `storno`).
  - Templates are standalone HTML files, often with inline styles and minimal scripting.
  - Content is tailored for email clients (tables, inline CSS, limited JS).
  - Similar templates exist for internal and customer flows; use these as references for new templates.
  - Most content is in German; maintain language consistency when updating or creating templates.

## Developer Workflow
  - Directly edit HTML files for content changes.
  - Preview changes in a browser or email client for formatting validation.
  - There are no automated build, test, or deployment scripts. Manual validation is required.

## Integration Points
  - Templates are likely integrated into CRM, calendar, or web widget systems. Ensure placeholders and IDs remain consistent for downstream systems.


## Examples
- To create a new customer reminder template, copy an existing file from `Vorlagen Kalender/` with `KND_` prefix and update content as needed.
## Additional Notes
- No backend, JavaScript frameworks, or package management detected.
- If adding new template types, follow the established naming and folder conventions.

---

## Merge Fields
- Für alle Templates müssen GoHighLevel-Merge-Fields und projektbezogene Custom Fields verwendet werden.
- Die zentrale Referenz für alle verfügbaren Felder ist die Datei `.github/merge-fields.md` im Projekt.
- Felder werden ohne Leerzeichen in den Klammern geschrieben (z.B. `{{contact.first_name}}`).
- Beispiel:
  ```html
  <p>Hallo {{contact.first_name}}, Ihr Termin ist am {{appointment.start_time}}.</p>
  <a href="{{appointment.cancellation_link}}">Termin absagen</a>
  ```
- Für Fallback-Werte nutze GoHighLevel-Workflows (siehe CRM-Dokumentation).

---
For questions or unclear conventions, ask for clarification or examples from existing templates.
