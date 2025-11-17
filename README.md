# 📧 OSM Mail Templates – Der Einsteigerguide

Willkommen! Dieses Repository enthält alle E-Mail-Vorlagen für "Endlich zu Hause". Diese Anleitung hilft dir, die Vorlagen zu verstehen und richtig einzusetzen – auch wenn du noch nie mit HTML-E-Mails oder GitHub gearbeitet hast.

---

## 📚 Inhaltsverzeichnis

1. [Was ist dieses Repository?](#-was-ist-dieses-repository)
2. [Wie funktionieren E-Mail-Templates bei uns?](#-wie-funktionieren-e-mail-templates-bei-uns)
3. [Wie öffne und kopiere ich eine Vorlage?](#-wie-öffne-und-kopiere-ich-eine-vorlage)
4. [Merge Fields – Die Platzhalter erklärt](#-merge-fields--die-platzhalter-erklärt)
5. [Termin-Bestätigung verstehen](#-termin-bestätigung-verstehen)
6. [Häufige Probleme & Lösungen](#-häufige-probleme--lösungen)
7. [Ordnerstruktur im Überblick](#-ordnerstruktur-im-überblick)
8. [PDF-Export (für Fortgeschrittene)](#-pdf-export-für-fortgeschrittene)

---

## 🤔 Was ist dieses Repository?

Dieses Repository ist wie ein **digitaler Ordner**, in dem alle HTML-Vorlagen für E-Mails gespeichert sind, die wir bei "Endlich zu Hause" versenden.

**Was bedeutet das konkret?**
- Hier findest du Vorlagen für Terminbestätigungen, Erinnerungen, Absagen, Formulare und mehr.
- Die Vorlagen sind in **HTML** geschrieben – das ist die Sprache, die E-Mail-Programme verstehen.
- Die Vorlagen werden in **GoHighLevel** (GHL) oder **Selly** verwendet, um automatisch personalisierte E-Mails zu versenden.

**Für wen ist das gedacht?**
- Teammitglieder, die E-Mail-Vorlagen verstehen und nutzen wollen
- Alle, die wissen möchten, wie Kundennamen, Terminzeiten etc. automatisch in E-Mails eingefügt werden
- Neue Mitarbeiter, die das CRM-System kennenlernen

---

## 🎯 Wie funktionieren E-Mail-Templates bei uns?

### Warum HTML?

E-Mails sind nicht einfach nur Text – sie können Farben, Logos, Buttons und Links enthalten. Damit das funktioniert, werden E-Mails in **HTML** geschrieben. HTML ist eine einfache "Sprache", die jedem E-Mail-Programm sagt, wie die E-Mail aussehen soll.

**Du musst kein HTML können**, um die Vorlagen zu nutzen! Du musst sie nur kopieren und in GHL einfügen.

### Wie nutzen wir die Templates?

1. **Vorlage auswählen**: Du suchst dir eine passende Vorlage aus (z. B. "Terminbestätigung")
2. **HTML kopieren**: Du öffnest die Vorlage und kopierst den gesamten Code
3. **In GHL einfügen**: Du fügst den Code in einen Workflow oder eine E-Mail-Benachrichtigung in GoHighLevel ein
4. **Automatik**: GHL ersetzt automatisch die Platzhalter (z. B. `{{contact.first_name}}`) mit echten Daten (z. B. "Max")

**Beispiel-Workflow:**

```
Kunde bucht Termin
    ↓
GHL löst Workflow aus
    ↓
E-Mail mit Template "KND_01_bestaetigung" wird versendet
    ↓
Kunde erhält personalisierte Bestätigung mit seinem Namen und Termin
```

---

## 📂 Wie öffne und kopiere ich eine Vorlage?

### Schritt-für-Schritt-Anleitung

**1. Datei finden**

- Öffne GitHub im Browser
- Navigiere zu dem Ordner, der die Vorlage enthält (z. B. `Vorlagen Kalender/`)
- Klicke auf die gewünschte Datei (z. B. `KND_01_bestaetigung.html`)

**2. HTML-Code ansehen**

Wenn du die Datei öffnest, siehst du den HTML-Code mit Syntax-Hervorhebung. Das sieht vielleicht kompliziert aus, aber du musst es nicht verstehen!

**3. "Raw" anklicken**

- Oben rechts über dem Code findest du den Button **"Raw"**
- Klicke darauf – jetzt wird der pure HTML-Code ohne Formatierung angezeigt

**4. Alles kopieren**

- Drücke `Strg + A` (Windows) oder `Cmd + A` (Mac), um alles zu markieren
- Drücke `Strg + C` (Windows) oder `Cmd + C` (Mac), um zu kopieren

**5. In GHL einfügen**

- Gehe zu GoHighLevel
- Öffne den Workflow oder die E-Mail-Vorlage
- Füge den Code mit `Strg + V` (Windows) oder `Cmd + V` (Mac) ein

**Fertig!** 🎉

---

## 🔖 Merge Fields – Die Platzhalter erklärt

### Was sind Merge Fields?

**Merge Fields** sind Platzhalter, die automatisch durch echte Daten ersetzt werden. Sie sehen so aus:

```
{{contact.first_name}}
{{appointment.start_time}}
{{location.name}}
```

**Beispiel:**

Du schreibst in der Vorlage:
```
Hallo {{contact.first_name}}, Ihr Termin ist am {{appointment.start_time}}.
```

Der Kunde sieht:
```
Hallo Max, Ihr Termin ist am 20.11.2025 um 14:00 Uhr.
```

### Wie funktionieren Merge Fields?

GoHighLevel/Selly **kennt** die Daten des Kunden (Name, E-Mail, Telefon, gebuchter Termin etc.). Wenn eine E-Mail versendet wird, sucht das System nach allen `{{...}}` Platzhaltern und ersetzt sie automatisch.

### Die wichtigsten Merge Fields

#### **Kontaktdaten**

| Merge Field | Bedeutung | Beispiel |
|------------|-----------|----------|
| `{{contact.first_name}}` | Vorname | Max |
| `{{contact.last_name}}` | Nachname | Mustermann |
| `{{contact.name}}` | Vollständiger Name | Max Mustermann |
| `{{contact.email}}` | E-Mail-Adresse | max@beispiel.de |
| `{{contact.phone}}` | Telefonnummer | 040 1234567 |

#### **Termininformationen**

| Merge Field | Bedeutung | Beispiel |
|------------|-----------|----------|
| `{{appointment.title}}` | Termintyp | Erstgespräch |
| `{{appointment.start_time}}` | Datum & Uhrzeit (komplett) | 20.11.2025 um 14:00 Uhr |
| `{{appointment.only_start_date}}` | Nur das Datum | 20.11.2025 |
| `{{appointment.only_start_time}}` | Nur die Uhrzeit | 14:00 Uhr |
| `{{appointment.meeting_location}}` | Ort (z. B. Videocall, Büro) | Google Meet |

#### **Termin-Links (wichtig!)**

| Merge Field | Bedeutung | Verwendung |
|------------|-----------|-----------|
| `{{appointment.reschedule_link}}` | Link zum Verschieben | Kunde kann Termin neu buchen |
| `{{appointment.cancellation_link}}` | Link zum Absagen | Kunde kann Termin stornieren |
| `{{appointment.add_to_google_calendar}}` | Zum Google-Kalender hinzufügen | Erleichtert Kunden die Planung |
| `{{appointment.add_to_ical_outlook}}` | Zum Outlook/iCal hinzufügen | Erleichtert Kunden die Planung |

#### **Interner Berater**

| Merge Field | Bedeutung | Beispiel |
|------------|-----------|----------|
| `{{appointment.user.name}}` | Name des zugewiesenen Beraters | Sabine Schulz |
| `{{appointment.user.email}}` | E-Mail des Beraters | sabine@endlichzuhause.com |

#### **Firmeninformationen**

| Merge Field | Bedeutung | Beispiel |
|------------|-----------|----------|
| `{{location.name}}` | Firmenname | Endlich zu Hause |
| `{{location.phone}}` | Firmentelefon | 040 72 77 94 0 |
| `{{location.email}}` | Firmen-E-Mail | info@endlichzuhause.com |

### Wo finde ich ALLE verfügbaren Merge Fields?

Die **vollständige Liste** aller Merge Fields findest du hier im Repository:

📄 **[.github/instructions/merge-fields.md](.github/instructions/merge-fields.md)**

Dort sind auch **projektspezifische Custom Fields** dokumentiert (z. B. aus Formularen wie `{{contact.kaufpreis}}`, `{{contact.eigenkapital}}`).

### Wie füge ich Merge Fields in eine Vorlage ein?

**Ganz einfach:** Schreibe den Platzhalter genau so, wie er in der Dokumentation steht – **ohne Leerzeichen** zwischen den geschweiften Klammern!

✅ **Richtig:**
```html
{{contact.first_name}}
```

❌ **Falsch:**
```html
{{ contact.first_name }}
```

---

## ✅ Termin-Bestätigung verstehen

### Wie funktioniert eine Terminbestätigung?

Wenn ein Kunde einen Termin bucht, läuft folgendes ab:

1. **Kunde bucht Termin** über die Webseite oder den Kalender-Link
2. **GHL registriert die Buchung** und speichert alle Daten (Name, Termin, zugewiesener Berater etc.)
3. **Workflow wird ausgelöst** (z. B. "Termin gebucht → E-Mail senden")
4. **E-Mail-Template wird geladen** (z. B. `KND_01_bestaetigung.html`)
5. **Merge Fields werden ersetzt** ({{contact.first_name}} wird zu "Max")
6. **E-Mail wird versendet** an die E-Mail-Adresse des Kunden

### Beispiel: Terminbestätigungs-E-Mail

Schauen wir uns die Datei `Vorlagen Kalender/KND_01_bestaetigung.html` an:

**Wichtigste Elemente:**

```html
<p>Hallo {{contact.first_name}},</p>
```
→ Personalisierte Anrede

```html
<ul>
  <li><strong>Gesprächstyp:</strong> {{appointment.title}}</li>
  <li><strong>Datum & Uhrzeit:</strong> {{appointment.start_time}}</li>
  <li><strong>Ort / Kontaktart:</strong> {{appointment.meeting_location}}</li>
</ul>
```
→ Termindetails werden automatisch eingefügt

```html
<a href="{{appointment.reschedule_link}}">Termin anpassen</a>
```
→ Link zum Verschieben des Termins

```html
<a href="{{appointment.cancellation_link}}">absagen</a>
```
→ Link zum Stornieren des Termins

### Was passiert, wenn der Kunde auf "Termin anpassen" klickt?

- Der Kunde wird zu einer **Buchungsseite** weitergeleitet
- Er kann einen neuen Zeitpunkt wählen
- GHL aktualisiert den Termin automatisch
- Optional: Eine neue Bestätigungs-E-Mail wird versendet

### Was passiert, wenn der Kunde auf "absagen" klickt?

- Der Termin wird **storniert**
- GHL kann einen Workflow auslösen (z. B. interne Benachrichtigung)
- Optional: Der Kunde erhält eine Bestätigung der Absage

### Terminbestätigung durch den Kunden (manuell)

⚠️ **Wichtig**: GoHighLevel hat **keine native Funktion** für "Termin bestätigen". Die Links `reschedule` und `cancellation` sind Standard, aber **keine Bestätigungs-Funktion**.

**Wenn du eine Bestätigung brauchst**, gibt es zwei Möglichkeiten:

**Option 1: Bestätigung via Reschedule-Link**
- Der Kunde klickt auf "Termin bestätigen" (verlinkt auf `{{appointment.reschedule_link}}`)
- Wenn er keine Änderung vornimmt und den gleichen Termin erneut auswählt, gilt das als Bestätigung

**Option 2: Custom Workflow mit Button**
- Du erstellst einen Button in der E-Mail, der zu einer **Custom URL** führt
- Die URL löst einen Webhook oder ein Custom Field Update aus (z. B. `Termin_bestätigt = Ja`)
- Ein Workflow reagiert darauf und markiert den Termin als bestätigt

**Beispiel-Code für Custom-Button:**

```html
<a href="https://hooks.zapier.com/hooks/catch/123456/abcdef/?contact_id={{contact.id}}&appointment_id={{appointment.id}}"
   style="background:#4CAF50;color:#fff;padding:12px 24px;text-decoration:none;border-radius:4px;display:inline-block;">
   Termin bestätigen
</a>
```

→ Dieser Link würde einen Webhook auslösen, der die Bestätigung registriert.

---

## ❓ Häufige Probleme & Lösungen

### Problem 1: "Der Name wird nicht angezeigt – nur {{contact.first_name}}"

**Ursache:** Das Merge Field wurde nicht ersetzt. Das kann passieren, wenn:

- Das Merge Field falsch geschrieben ist (z. B. mit Leerzeichen: `{{ contact.first_name }}`)
- Der Kontakt keinen Vornamen im CRM hat
- Die E-Mail nicht über GHL versendet wurde (sondern z. B. direkt per Outlook)

**Lösung:**

1. Prüfe, ob das Merge Field korrekt geschrieben ist: `{{contact.first_name}}` (ohne Leerzeichen)
2. Prüfe im CRM, ob der Kontakt einen Vornamen hat
3. Stelle sicher, dass die E-Mail über einen GHL-Workflow versendet wird

### Problem 2: "Wie kommen die Daten automatisch in die Mail?"

**Antwort:**

Die Daten kommen aus dem **CRM (GoHighLevel/Selly)**. Wenn ein Kontakt erstellt wird oder einen Termin bucht, werden alle Daten (Name, E-Mail, Termin etc.) automatisch gespeichert.

**So funktioniert es:**

```
Kunde füllt Formular aus oder bucht Termin
    ↓
Daten werden im CRM gespeichert
    ↓
Workflow wird ausgelöst (z. B. "Termin gebucht")
    ↓
E-Mail-Template wird geladen
    ↓
GHL ersetzt {{Merge Fields}} mit echten Daten aus dem CRM
    ↓
E-Mail wird versendet
```

**Du musst nichts manuell eingeben** – das passiert alles automatisch!

### Problem 3: "Welcher Link bestätigt meinen Termin?"

**Antwort:**

GoHighLevel hat **standardmäßig keinen Bestätigungslink**. Die Standardlinks sind:

- `{{appointment.reschedule_link}}` – Termin verschieben
- `{{appointment.cancellation_link}}` – Termin absagen

Für eine **manuelle Bestätigung** musst du einen **Custom Workflow** einrichten (siehe Abschnitt "Terminbestätigung durch den Kunden" oben).

### Problem 4: "Welche Merge Fields kann ich überhaupt nutzen?"

**Antwort:**

Die vollständige Liste findest du hier:

📄 **[.github/instructions/merge-fields.md](.github/instructions/merge-fields.md)**

**Die wichtigsten Kategorien:**

- **Kontaktdaten**: `{{contact.first_name}}`, `{{contact.email}}`, `{{contact.phone}}`, etc.
- **Termindaten**: `{{appointment.start_time}}`, `{{appointment.title}}`, `{{appointment.meeting_location}}`, etc.
- **Berater**: `{{appointment.user.name}}`, `{{user.email}}`, etc.
- **Firmeninfos**: `{{location.name}}`, `{{location.phone}}`, etc.

### Problem 5: "Die E-Mail sieht in Outlook/Gmail anders aus als erwartet"

**Ursache:**

Verschiedene E-Mail-Programme (Outlook, Gmail, Apple Mail, etc.) interpretieren HTML unterschiedlich. Deshalb nutzen wir **Inline-Styles** (Styles direkt im HTML-Code), um maximale Kompatibilität zu gewährleisten.

**Lösung:**

- Die Vorlagen in diesem Repository sind bereits optimiert für maximale Kompatibilität
- Wenn du Änderungen vornimmst, teste die E-Mail in verschiedenen Programmen (GHL hat eine Vorschaufunktion)

### Problem 6: "Ich habe eine Vorlage verändert, aber die Änderung wird nicht angezeigt"

**Ursache:**

Wenn du eine Vorlage hier in GitHub änderst, musst du sie **neu in GHL einfügen**. GitHub ist nur die "Quelle" – GHL hat eine eigene Kopie der Vorlage.

**Lösung:**

1. Vorlage in GitHub ändern
2. "Raw"-Code kopieren
3. In GHL die alte Vorlage ersetzen
4. Speichern und testen

---

## 📁 Ordnerstruktur im Überblick

### Was bedeuten die Ordner?

| Ordner | Inhalt | Beispiele |
|--------|--------|-----------|
| **Vorlagen Kalender/** | E-Mail-Vorlagen für Terminbenachrichtigungen | Bestätigung, Erinnerung, Absage, Verschiebung |
| **Formulare/** | HTML-Formulare für Webseite und interne Nutzung | Kontaktformular, Karriere-Formular, Terminbuchung |
| **Follow up/** | E-Mail-Vorlagen für Nachfassaktionen | Follow-up nach Erstgespräch, Follow-up bei Inaktivität |
| **Kampagne Vermögensaufbau 3/** | Spezielle Kampagnen-E-Mails | Jubiläumseinladung, Newsletter |
| **Webseiten Widget/** | Widgets für die Webseite | Chat-Formular, Pop-up-Formulare |
| **PDF/** | Referenz-PDFs (automatisch generiert) | PDF-Versionen der E-Mail-Vorlagen |

### Dateinamen verstehen

**Präfixe:**

- `KND_` → **Kunden-E-Mail** (geht an Kunden)
- `INT_` → **Interne E-Mail** (geht an Team/Berater)

**Nummern:**

- `01`, `02`, `03`, etc. → Reihenfolge im Workflow

**Beispiel:**

- `KND_01_bestaetigung.html` = **Kunden-E-Mail**, **erste** im Workflow, Inhalt: **Terminbestätigung**
- `INT_02_reminder.html` = **Interne E-Mail**, **zweite** im Workflow, Inhalt: **Erinnerung für Berater**

---

## 🖨️ PDF-Export (für Fortgeschrittene)

⚠️ **Dieser Abschnitt ist optional** – nur relevant, wenn du E-Mail-Vorlagen als PDF ausdrucken möchtest (z. B. für Dokumentation).

### Warum PDFs?

Manchmal möchte man eine E-Mail-Vorlage als PDF speichern, z. B. für:

- Interne Dokumentation
- Ausdruck für Präsentationen
- Archivierung

### So funktioniert der PDF-Export

Das Repository enthält ein Python-Skript (`html2pdf.py`), das alle HTML-Vorlagen automatisch in PDFs umwandelt.

**Setup (einmalig):**

1. Python installieren (falls noch nicht vorhanden)
2. Terminal öffnen und in den Ordner navigieren:
   ```bash
   cd /Pfad/zum/Repository
   ```
3. Virtuelle Umgebung erstellen:
   ```bash
   python3 -m venv venv_pdf
   source venv_pdf/bin/activate  # Mac/Linux
   venv_pdf\Scripts\activate     # Windows
   ```
4. Abhängigkeiten installieren:
   ```bash
   pip install playwright
   python -m playwright install chromium
   ```

**PDFs erstellen:**

```bash
python html2pdf.py
```

Alle PDFs werden im Ordner `PDF/` gespeichert.

**Hinweis:** Der `PDF/`-Ordner wird **nicht in Git gespeichert** (steht in `.gitignore`). PDFs sind nur lokal verfügbar.

---

## 🎓 Zusammenfassung für Einsteiger

### Checkliste: So nutzt du die Vorlagen

- [ ] **Richtige Vorlage finden** (z. B. `KND_01_bestaetigung.html`)
- [ ] **HTML-Code kopieren** (Button "Raw" → Alles markieren → Kopieren)
- [ ] **In GHL einfügen** (Workflow oder E-Mail-Vorlage)
- [ ] **Merge Fields prüfen** (Stehen die richtigen Platzhalter drin?)
- [ ] **Testen** (Test-E-Mail versenden und prüfen, ob alle Daten korrekt sind)
- [ ] **Fertig!** 🎉

### Die wichtigsten Merge Fields (nochmal zum Merken)

```
{{contact.first_name}}          → Vorname des Kunden
{{contact.email}}               → E-Mail des Kunden
{{appointment.start_time}}      → Termin Datum + Uhrzeit
{{appointment.reschedule_link}} → Link zum Verschieben
{{appointment.cancellation_link}} → Link zum Absagen
{{appointment.user.name}}       → Name des Beraters
```

### Wo finde ich Hilfe?

- **Merge Fields Dokumentation**: [.github/instructions/merge-fields.md](.github/instructions/merge-fields.md)
- **GoHighLevel Support**: [https://help.gohighlevel.com](https://help.gohighlevel.com)
- **Team fragen**: Wenn du unsicher bist, frag einfach im Team nach!

---

## 🚀 Nächste Schritte

Jetzt weißt du, wie du E-Mail-Vorlagen nutzt! Probiere es aus:

1. Öffne eine Vorlage (z. B. `Vorlagen Kalender/KND_01_bestaetigung.html`)
2. Kopiere den HTML-Code
3. Füge ihn in einen GHL-Workflow ein
4. Teste die E-Mail

**Viel Erfolg!** 💪

---

**Hinweis:** Diese README wurde speziell für Einsteiger erstellt. Wenn du Vorschläge für Verbesserungen hast, sprich gerne das Team an!
