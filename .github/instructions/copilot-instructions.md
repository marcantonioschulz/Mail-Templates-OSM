
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

## CRM Sync Workflow (GHL MCP)
- By default, after creating or updating an email template in this workspace, also create or update the corresponding template in GoHighLevel CRM via MCP.
- Use read-only MCP calls first (for example, list/find templates), then perform create/update calls.
- Prefer deterministic sync behavior by template name: update if existing, create if missing.
- After write operations, run a verification read (for example, fetch or list the target template) and confirm success.
- If the user explicitly requests local-only edits, skip CRM sync for that task.
- Never expose secrets or token values in messages, logs, or committed files.

### Standard MCP Runbook (Template Sync)
Use this sequence for every template create/update task unless the user requests local-only:

1. Local edit
- Create or update the HTML file in this repository first.

2. Pre-check in CRM (read-only)
- Use `template_list` (optionally with search/name filters) to find existing template/folder candidates.
- If needed, use `template_get` to confirm the exact target template.

3. Sync write
- Preferred: use `template_upsert_by_name` with final HTML and target folder.
- If strict ID-based update is required: resolve by `template_get` and then write via `template_set_content`.
- If the folder is missing, create it first with `template_create_folder`.

4. Verification (read-only)
- Re-read target via `template_get` or `template_list` and confirm name/folder/content changed as expected.

5. Report outcome
- Briefly state whether the CRM object was `created` or `updated`, and note the template ID when available.

### Naming Mapping (Local -> CRM)
- Default CRM template name is derived from the local filename without extension.
- Example mapping: `Vorlagen Kalender/INT_02_reminder.html` -> `INT_02_reminder`.
- Keep prefixes/suffixes unchanged (`INT_`, `KND_`, sequence IDs, purpose suffixes).
- Do not auto-translate or prettify names unless the user explicitly requests a different CRM display name.
- If a different CRM name is required, store and reuse that explicit mapping for subsequent updates in the same task.
- Before write operations, use `template_list` search/name filter to confirm the target name is unique; if multiple matches exist, resolve by ID via `template_get` before updating.

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
