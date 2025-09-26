# Merge Fields Reference

Diese Datei listet alle relevanten Merge Fields für die OSM Mail-Templates auf, inklusive GoHighLevel-Standardfelder und projektbezogener Custom Fields. Felder werden ohne Leerzeichen in den Klammern dargestellt.

## Was sind Merge Fields?

Merge Fields ermöglichen die dynamische Personalisierung von E-Mails, SMS, Webseiten, Workflows und Dokumenten. Sie werden automatisch mit den jeweiligen Daten aus dem CRM, Kalender, Kampagnen, Rechnungen usw. ersetzt.

## Hinweise zur Nutzung

- Felder immer ohne Leerzeichen in den Klammern verwenden: z.B. `{{contact.first_name}}`
- Für internationale Telefonnummern nutze die Raw-Formate (z.B. `{{contact.phone_raw}}`).
- Für Fallback-Werte nutze GoHighLevel-Workflows (siehe unten).

## Standard GoHighLevel Merge Fields

### CONTACT

- `{{contact.name}}` – Vollständiger Name
- `{{contact.first_name}}` – Vorname
- `{{contact.last_name}}` – Nachname
- `{{contact.email}}` – E-Mail-Adresse
- `{{contact.phone}}` – Telefonnummer
- `{{contact.phone_raw}}` – Telefonnummer (ohne Formatierung)
- `{{contact.company_name}}` – Firmenname
- `{{contact.full_address}}` – Vollständige Adresse
- `{{contact.address1}}` – Adresse 1
- `{{contact.city}}` – Stadt
- `{{contact.state}}` – Bundesland
- `{{contact.postal_code}}` – Postleitzahl
- `{{contact.timezone}}` – Zeitzone
- `{{contact.date_of_birth}}` – Geburtsdatum
- `{{contact.source}}` – Quelle
- `{{contact.website}}` – Webseite
- `{{contact.id}}` – Kontakt-ID
- Attribution: `{{contact.attributionSource.sessionSource}}`, `{{contact.attributionSource.url}}`, ...
- Latest Attribution: `{{contact.lastAttributionSource.sessionSource}}`, ...


# Merge Fields Reference

**Zentrale Referenz für alle Merge Fields in OSM Mail-Templates.**  
Enthält GoHighLevel-Standardfelder und projektbezogene Custom Fields.  
Felder werden immer ohne Leerzeichen in den Klammern geschrieben: `{{contact.first_name}}`

---

## Was sind Merge Fields?

Merge Fields ermöglichen die dynamische Personalisierung von E-Mails, SMS, Webseiten, Workflows und Dokumenten. Sie werden automatisch mit Daten aus CRM, Kalender, Kampagnen, Rechnungen usw. ersetzt.

---

## Nutzungshinweise

- Felder immer ohne Leerzeichen: `{{contact.first_name}}`
- Für internationale Nummern: Raw-Formate nutzen (`{{contact.phone_raw}}`)
- Fallback-Werte: Über GoHighLevel-Workflows setzen (siehe unten)

---

## Standard GoHighLevel Merge Fields

### Kontakt (`contact`)
- `{{contact.name}}` – Vollständiger Name
- `{{contact.first_name}}` – Vorname
- `{{contact.last_name}}` – Nachname
- `{{contact.email}}` – E-Mail-Adresse
- `{{contact.phone}}` / `{{contact.phone_raw}}` – Telefonnummer (formatiert/roh)
- `{{contact.company_name}}` – Firmenname
- `{{contact.full_address}}`, `{{contact.address1}}`, `{{contact.city}}`, `{{contact.state}}`, `{{contact.postal_code}}`
- `{{contact.timezone}}`, `{{contact.date_of_birth}}`, `{{contact.source}}`, `{{contact.website}}`, `{{contact.id}}`
- Attribution: `{{contact.attributionSource.sessionSource}}`, `{{contact.attributionSource.url}}`
- Latest Attribution: `{{contact.lastAttributionSource.sessionSource}}`

### Benutzer (`user`)
- `{{user.name}}`, `{{user.first_name}}`, `{{user.last_name}}`
- `{{user.email}}`, `{{user.phone}}`, `{{user.phone_raw}}`
- `{{user.email_signature}}`, `{{user.calendar_link}}`
- `{{user.twilio_phone_number}}`, `{{user.twilio_phone_number_raw}}`

### Termin (`appointment`)
- `{{appointment.title}}`, `{{appointment.start_time}}`, `{{appointment.only_start_date}}`, `{{appointment.only_start_time}}`, `{{appointment.end_time}}`
- `{{appointment.cancellation_link}}`, `{{appointment.reschedule_link}}`
- `{{appointment.meeting_location}}`, `{{appointment.notes}}`
- `{{appointment.add_to_google_calendar}}`, `{{appointment.add_to_ical_outlook}}`
- `{{appointment.day_of_week}}`, `{{appointment.month}}`, `{{appointment.timezone}}`
- Wiederkehrend: `{{appointment.recurring.repeats}}`
- Zugewiesener Nutzer: `{{appointment.user.name}}`, `{{appointment.user.email}}`

### Kalender (`calendar`)
- `{{calendar.name}}`

### Kampagne (`campaign`)
- `{{campaign.event_date_time}}`, `{{campaign.event_date}}`, `{{campaign.event_time}}`

### Nachricht (`message`)
- `{{message.body}}`, `{{message.subject}}`

### Standort/Account (`location`)
- `{{location.name}}`, `{{location.full_address}}`, `{{location.address}}`, `{{location.city}}`, `{{location.state}}`, `{{location.country}}`, `{{location.postal_code}}`
- `{{location.email}}`, `{{location.phone}}`, `{{location.phone_raw}}`, `{{location.website}}`, `{{location.logo_url}}`
- Besitzer: `{{location_owner.first_name}}`
- `{{location.id}}`

### Zeitstempel (`right_now`)
- `{{right_now.second}}`, `{{right_now.minute}}`, `{{right_now.hour}}`, `{{right_now.day_of_week}}`, `{{right_now.month_name}}`, `{{right_now.year}}`

### Rechnung (`invoice`)
- `{{invoice.name}}`, `{{invoice.number}}`, `{{invoice.issue_date}}`
- Firma: `{{invoice.company.name}}`
- Kunde: `{{invoice.customer.name}}`
- Absender: `{{invoice.sender.name}}`
- Karte: `{{invoice.card.brand}}`

---

# Merge Fields Reference

**Zentrale Referenz für alle Merge Fields in OSM Mail-Templates.**
Enthält GoHighLevel-Standardfelder und projektbezogene Custom Fields.
Felder werden immer ohne Leerzeichen in den Klammern geschrieben: `{{contact.first_name}}`

---

## Was sind Merge Fields?

Merge Fields ermöglichen die dynamische Personalisierung von E-Mails, SMS, Webseiten, Workflows und Dokumenten. Sie werden automatisch mit Daten aus CRM, Kalender, Kampagnen, Rechnungen usw. ersetzt.

---

## Nutzungshinweise

- Felder immer ohne Leerzeichen: `{{contact.first_name}}`
- Für internationale Nummern: Raw-Formate nutzen (`{{contact.phone_raw}}`)
- Fallback-Werte: Über GoHighLevel-Workflows setzen (siehe unten)

---

## Standard GoHighLevel Merge Fields

### Kontakt (`contact`)

- `{{contact.name}}` – Vollständiger Name
- `{{contact.first_name}}` – Vorname
- `{{contact.last_name}}` – Nachname
- `{{contact.email}}` – E-Mail-Adresse
- `{{contact.phone}}` / `{{contact.phone_raw}}` – Telefonnummer (formatiert/roh)
- `{{contact.company_name}}` – Firmenname
- `{{contact.full_address}}`, `{{contact.address1}}`, `{{contact.city}}`, `{{contact.state}}`, `{{contact.postal_code}}`
- `{{contact.timezone}}`, `{{contact.date_of_birth}}`, `{{contact.source}}`, `{{contact.website}}`, `{{contact.id}}`
- Attribution: `{{contact.attributionSource.sessionSource}}`, `{{contact.attributionSource.url}}`
- Latest Attribution: `{{contact.lastAttributionSource.sessionSource}}`

### Benutzer (`user`)

- `{{user.name}}`, `{{user.first_name}}`, `{{user.last_name}}`
- `{{user.email}}`, `{{user.phone}}`, `{{user.phone_raw}}`
- `{{user.email_signature}}`, `{{user.calendar_link}}`
- `{{user.twilio_phone_number}}`, `{{user.twilio_phone_number_raw}}`

### Termin (`appointment`)

- `{{appointment.title}}`, `{{appointment.start_time}}`, `{{appointment.only_start_date}}`, `{{appointment.only_start_time}}`, `{{appointment.end_time}}`
- `{{appointment.cancellation_link}}`, `{{appointment.reschedule_link}}`
- `{{appointment.meeting_location}}`, `{{appointment.notes}}`
- `{{appointment.add_to_google_calendar}}`, `{{appointment.add_to_ical_outlook}}`
- `{{appointment.day_of_week}}`, `{{appointment.month}}`, `{{appointment.timezone}}`
- Wiederkehrend: `{{appointment.recurring.repeats}}`
- Zugewiesener Nutzer: `{{appointment.user.name}}`, `{{appointment.user.email}}`

### Kalender (`calendar`)

- `{{calendar.name}}`

### Kampagne (`campaign`)

- `{{campaign.event_date_time}}`, `{{campaign.event_date}}`, `{{campaign.event_time}}`

### Nachricht (`message`)

- `{{message.body}}`, `{{message.subject}}`

### Standort/Account (`location`)

- `{{location.name}}`, `{{location.full_address}}`, `{{location.address}}`, `{{location.city}}`, `{{location.state}}`, `{{location.country}}`, `{{location.postal_code}}`
- `{{location.email}}`, `{{location.phone}}`, `{{location.phone_raw}}`, `{{location.website}}`, `{{location.logo_url}}`
- Besitzer: `{{location_owner.first_name}}`
- `{{location.id}}`

### Zeitstempel (`right_now`)

- `{{right_now.second}}`, `{{right_now.minute}}`, `{{right_now.hour}}`, `{{right_now.day_of_week}}`, `{{right_now.month_name}}`, `{{right_now.year}}`

### Rechnung (`invoice`)

- `{{invoice.name}}`, `{{invoice.number}}`, `{{invoice.issue_date}}`
- Firma: `{{invoice.company.name}}`
- Kunde: `{{invoice.customer.name}}`
- Absender: `{{invoice.sender.name}}`
- Karte: `{{invoice.card.brand}}`

---
...existing code up to line 117...
 
## Projektbezogene Custom Fields
