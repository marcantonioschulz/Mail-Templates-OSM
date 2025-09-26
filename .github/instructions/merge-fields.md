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

## Projektbezogene Custom Fields

### Formularfelder

- `{{contact.kaufpreis}}`, `{{contact.haushaltsnetto_in_zahlen}}`, `{{contact.eigenkapital}}`, `{{contact.zeitraum}}`, `{{contact.schufa}}`, `{{contact.your_message}}`, `{{contact.finanzierungsart}}`, `{{contact.aktuelle_miete}}`, `{{contact.arbeitsverhltnis}}`, `{{contact.immobilie_im_blick}}`, `{{contact.wunschrate}}`, `{{contact.was_ist_aktuell_das_grte_hindernis_auf_dem_weg_ins_eigenheim}}`

### EZH Webseite Erstgespräch

- `{{contact.wofr_interessiert_sie_sich}}`, `{{contact.wo_stehen_sie_aktuell}}`, `{{contact.was_bremst_sie}}`, `{{contact.wann_starten_sie}}`

### Vertriebler

- `{{contact.was_ist_dein_aktueller_berufsstatus}}`, `{{contact.was_wre_dir_in_einer_neuen_stelle_am_wichtigsten}}`, `{{contact.welches_adjektiv_beschreibt_dich_am_besten}}`, `{{contact.bist_du_oder_warst_du_in_der_finanzbranche_ttig}}`, `{{contact.beherrschst_du_die_deutsche_sprache_in_wort_und_schrift}}`, `{{contact.warum_sollten_wir_gerade_dir_die_chance_geben_bei_uns_karriere_zu_machen}}`

### EZH Webseite Karriere

- `{{contact.beruflicher_status}}`, `{{contact.womit_kennst_du_dich_schon_aus}}`, `{{contact.was_motiviert_dich_am_meisten}}`, `{{contact.hast_du_erfahrung_in}}`, `{{contact.was_traust_du_dir_aktuell_zu}}`, `{{contact.warum_sollten_wir_dich_kennenlernen}}`

---

## Beispiel-Usage

```html
<p>Hallo {{contact.first_name}}, Ihr Termin ist am {{appointment.start_time}}.</p>
<a href="{{appointment.cancellation_link}}">Termin absagen</a>
```

---

## Fallback-Werte mit Workflows

Wenn ein Feld leer ist, kann per Workflow ein Fallback-Wert gesetzt werden:

1. Custom Value in den Einstellungen anlegen (z.B. `First_Name_Fallback`)
2. Im Workflow If/Else-Bedingung für das Feld prüfen
3. Fallback-Wert im Template nutzen, falls das Feld leer ist

Mehr Infos:  
<https://help.gohighlevel.com/support/solutions/articles/48001180266>

---

## Links & Referenzen

- GoHighLevel Merge Fields: <https://help.gohighlevel.com/support/solutions/articles/48001078171-list-of-merge-fields>
- Kontakt-Detail-Link:  
  `<https://desk.selly-ki.de/v2/location/{{location.id}}/contacts/detail/{{contact.id}}>`

---

**Diese Datei ist die zentrale Referenz für alle Merge Fields im Projekt. Ergänze neue Custom Fields hier und nutze die Felder konsistent in allen Templates.**
