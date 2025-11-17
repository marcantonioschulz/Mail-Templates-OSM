# 📧 Demo: Terminbestätigungs-E-Mail

**Zweck:** Diese E-Mail wird automatisch versendet, wenn ein Kunde einen Termin bucht.

**Zielgruppe:** Kunde (KND)

**Echte Vorlage:** `Vorlagen Kalender/KND_01_bestaetigung.html`

---

## 📝 E-Mail-Inhalt (vereinfacht)

```
Betreff: Ihr Termin ist bestätigt – Endlich zu Hause

---

[Logo: Endlich zu Hause]

---

Hallo {{contact.first_name}},

vielen Dank für Ihr Vertrauen! Wir bestätigen hiermit Ihren Termin:

• Gesprächstyp: {{appointment.title}}
• Datum & Uhrzeit: {{appointment.start_time}}
• Ort / Kontaktart: {{appointment.meeting_location}}

Falls sich bei Ihnen doch etwas ändert:
[Termin anpassen] oder [absagen].

Sie erhalten vor dem Termin automatisch eine Erinnerung.

Bei Fragen sind wir jederzeit gerne für Sie da.

Viele Grüße
{{appointment.user.name}}
und Ihr Team von Endlich zu Hause

---

Endlich zu Hause Finanzierungen GmbH
Bahnhofstraße 11 c, 21465 Reinbek
Tel: 040 72 77 94 0
info@endlichzuhause.com
www.endlichzuhause.com

---
```

---

## 🔖 Verwendete Merge Fields mit Erklärung

### **{{contact.first_name}}**
- **Was ist das?** Der Vorname des Kunden
- **Beispiel:** "Max"
- **Woher kommt der Wert?** Aus dem CRM-Kontaktdatensatz

---

### **{{appointment.title}}**
- **Was ist das?** Die Bezeichnung des gebuchten Termins
- **Beispiel:** "Erstgespräch Baufinanzierung"
- **Woher kommt der Wert?** Aus dem Kalender/Terminbuchungssystem

---

### **{{appointment.start_time}}**
- **Was ist das?** Datum und Uhrzeit des Termins (kombiniert)
- **Beispiel:** "20. November 2025 um 14:00 Uhr"
- **Woher kommt der Wert?** Aus dem Kalender/Terminbuchungssystem

---

### **{{appointment.meeting_location}}**
- **Was ist das?** Ort oder Art des Gesprächs
- **Beispiel:** "Google Meet" oder "Büro Reinbek" oder "Telefonat"
- **Woher kommt der Wert?** Aus den Kalendereinstellungen

---

### **{{appointment.reschedule_link}}**
- **Was ist das?** Link zum Verschieben/Umbuchen des Termins
- **Beispiel:** `https://termin.endlichzuhause.com/reschedule/abc123`
- **Was passiert beim Klick?** Der Kunde wird zur Buchungsseite weitergeleitet und kann einen neuen Termin wählen

---

### **{{appointment.cancellation_link}}**
- **Was ist das?** Link zum Stornieren des Termins
- **Beispiel:** `https://termin.endlichzuhause.com/cancel/abc123`
- **Was passiert beim Klick?** Der Termin wird storniert, optional wird ein Workflow ausgelöst

---

### **{{appointment.user.name}}**
- **Was ist das?** Name des Beraters, der den Termin durchführt
- **Beispiel:** "Sabine Schulz"
- **Woher kommt der Wert?** Aus dem CRM – der Berater, dem der Termin zugewiesen ist

---

## 🎯 Workflow-Übersicht

```
1. Kunde bucht Termin über Webseite
   ↓
2. GHL registriert Buchung und speichert Daten
   ↓
3. Workflow "Termin gebucht" wird ausgelöst
   ↓
4. E-Mail-Template "KND_01_bestaetigung" wird geladen
   ↓
5. Merge Fields werden ersetzt ({{contact.first_name}} → "Max")
   ↓
6. E-Mail wird an {{contact.email}} versendet
   ↓
7. Kunde erhält personalisierte Bestätigung
```

---

## ✅ Was du daraus lernen kannst

1. **Personalisierung:** Durch `{{contact.first_name}}` wird die E-Mail persönlich
2. **Automatisierung:** Alle Termindaten werden automatisch eingefügt
3. **Kundenkontrolle:** Die Links ermöglichen dem Kunden selbstständig Änderungen
4. **Professioneller Eindruck:** Der Berater wird namentlich erwähnt

---

## 🚀 Nächster Schritt

Schaue dir jetzt die **echte HTML-Vorlage** an:

`Vorlagen Kalender/KND_01_bestaetigung.html`

Du wirst die gleichen Merge Fields wiedererkennen – nur in HTML-Code eingebettet!

---

**Hinweis:** Dies ist nur eine Demo-Version. Nutze für den echten Einsatz die HTML-Vorlage!
