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

### USER

- `{{user.name}}` – Name des Benutzers
- `{{user.first_name}}` – Vorname
- `{{user.last_name}}` – Nachname
- `{{user.email}}` – E-Mail
- `{{user.phone}}` – Telefonnummer
- `{{user.phone_raw}}` – Telefonnummer (roh)
- `{{user.email_signature}}` – E-Mail-Signatur
- `{{user.calendar_link}}` – Kalender-Link
- `{{user.twilio_phone_number}}` – Twilio Nummer
- `{{user.twilio_phone_number_raw}}` – Twilio Nummer (roh)

### APPOINTMENT

- `{{appointment.title}}` – Termin-Titel
- `{{appointment.start_time}}` – Startzeit
- `{{appointment.only_start_date}}` – Nur Datum
- `{{appointment.only_start_time}}` – Nur Uhrzeit
- `{{appointment.end_time}}` – Endzeit
- `{{appointment.cancellation_link}}` – Link zur Terminabsage
- `{{appointment.reschedule_link}}` – Link zur Terminverschiebung
- `{{appointment.meeting_location}}` – Treffpunkt
- `{{appointment.notes}}` – Notizen
- `{{appointment.add_to_google_calendar}}` – Google Kalender Link
- `{{appointment.add_to_ical_outlook}}` – iCal/Outlook Link
- `{{appointment.day_of_week}}`, `{{appointment.month}}`, `{{appointment.timezone}}`, ...
- Recurring: `{{appointment.recurring.repeats}}`, ...
- Assigned user: `{{appointment.user.name}}`, `{{appointment.user.email}}`, ...

### CALENDAR

- `{{calendar.name}}` – Kalendername

### CAMPAIGN

- `{{campaign.event_date_time}}` – Event, Datum, Uhrzeit
- `{{campaign.event_date}}` – Event Datum
- `{{campaign.event_time}}` – Event Uhrzeit

### MESSAGE

- `{{message.body}}` – Nachrichteninhalt
- `{{message.subject}}` – Betreff

### ACCOUNT/LOCATION

- `{{location.name}}` – Standortname
- `{{location.full_address}}` – Vollständige Adresse
- `{{location.address}}` – Adresse
- `{{location.city}}` – Stadt
- `{{location.state}}` – Bundesland
- `{{location.country}}` – Land
- `{{location.postal_code}}` – PLZ
- `{{location.email}}` – E-Mail
- `{{location.phone}}` – Telefonnummer
- `{{location.phone_raw}}` – Telefonnummer (roh)
- `{{location.website}}` – Webseite
- `{{location.logo_url}}` – Logo URL
- Owner: `{{location_owner.first_name}}`, ...
- `{{location.id}}` – Standort-ID

### RIGHT NOW

- `{{right_now.second}}`, `{{right_now.minute}}`, `{{right_now.hour}}`, ...
- `{{right_now.day_of_week}}`, `{{right_now.month_name}}`, `{{right_now.year}}`, ...

### ATTRIBUTION

- Attribution: `{{contact.attributionSource.sessionSource}}`, ...
- Latest Attribution: `{{contact.lastAttributionSource.sessionSource}}`, ...

### INVOICE

- `{{invoice.name}}`, `{{invoice.number}}`, `{{invoice.issue_date}}`, ...
- Company: `{{invoice.company.name}}`, ...
- Customer: `{{invoice.customer.name}}`, ...
- Sender: `{{invoice.sender.name}}`, ...
- Card: `{{invoice.card.brand}}`, ...

## Custom Fields (Projektbezogen)

### Formular Felder

- `{{contact.kaufpreis}}` – Kaufpreis
- `{{contact.haushaltsnetto_in_zahlen}}` – Haushaltsnetto in Zahlen
- `{{contact.eigenkapital}}` – Eigenkapital
- `{{contact.zeitraum}}` – Zeitraum
- `{{contact.schufa}}` – Schufa
- `{{contact.your_message}}` – Nachricht
- `{{contact.finanzierungsart}}` – Finanzierungsart
- `{{contact.aktuelle_miete}}` – Aktuelle Miete
- `{{contact.arbeitsverhltnis}}` – Arbeitsverhältnis
- `{{contact.immobilie_im_blick}}` – Immobilie im Blick
- `{{contact.wunschrate}}` – Wunschrate
- `{{contact.was_ist_aktuell_das_grte_hindernis_auf_dem_weg_ins_eigenheim}}` – Aktuelles Hindernis

### EZH Webseite Erstgespräch

- `{{contact.wofr_interessiert_sie_sich}}` – Interessensgebiet
- `{{contact.wo_stehen_sie_aktuell}}` – Aktuelle Situation
- `{{contact.was_bremst_sie}}` – Bremse
- `{{contact.wann_starten_sie}}` – Startzeitpunkt

### Vertriebler

- `{{contact.was_ist_dein_aktueller_berufsstatus}}` – Berufsstatus
- `{{contact.was_wre_dir_in_einer_neuen_stelle_am_wichtigsten}}` – Wichtigstes in neuer Stelle
- `{{contact.welches_adjektiv_beschreibt_dich_am_besten}}` – Adjektiv
- `{{contact.bist_du_oder_warst_du_in_der_finanzbranche_ttig}}` – Finanzbranche-Erfahrung
- `{{contact.beherrschst_du_die_deutsche_sprache_in_wort_und_schrift}}` – Deutschkenntnisse
- `{{contact.warum_sollten_wir_gerade_dir_die_chance_geben_bei_uns_karriere_zu_machen}}` – Warum du?

### EZH Webseite Karriere

- `{{contact.beruflicher_status}}` – Beruflicher Status
- `{{contact.womit_kennst_du_dich_schon_aus}}` – Kenntnisse
- `{{contact.was_motiviert_dich_am_meisten}}` – Motivation
- `{{contact.hast_du_erfahrung_in}}` – Erfahrung
- `{{contact.was_traust_du_dir_aktuell_zu}}` – Selbsteinschätzung
- `{{contact.warum_sollten_wir_dich_kennenlernen}}` – Warum kennenlernen?

## Beispiel-Usage

```html
<p>Hallo {{contact.first_name}}, Ihr Termin ist am {{appointment.start_time}}.</p>
<a href="{{appointment.cancellation_link}}">Termin absagen</a>
```

## Fallback-Werte mit Workflows

Wenn ein Feld leer ist, kann per Workflow ein Fallback-Wert gesetzt werden:

1. Custom Value in den Einstellungen anlegen (z.B. First_Name_Fallback)
2. Im Workflow If/Else-Bedingung für das Feld prüfen
3. Fallback-Wert im Template nutzen, falls das Feld leer ist

Mehr Infos: <https://help.gohighlevel.com/support/solutions/articles/48001180266>

## Links & Referenzen

- GoHighLevel Merge Fields: <https://help.gohighlevel.com/support/solutions/articles/48001078171-list-of-merge-fields>
- Kontakt-Detail-Link: <https://desk.selly-ki.de/v2/location/{{location.id}}/contacts/detail/{{contact.id}}>

---
Diese Datei ist die zentrale Referenz für alle Merge Fields im Projekt. Ergänze neue Custom Fields hier und nutze die Felder konsistent in allen Templates.
