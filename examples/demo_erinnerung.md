# ⏰ Demo: Terminerinnerungs-E-Mail

**Zweck:** Diese E-Mail wird automatisch 24 Stunden vor dem Termin versendet.

**Zielgruppe:** Kunde (KND)

**Echte Vorlage:** `Vorlagen Kalender/KND_02_erinnerung.html`

---

## 📝 E-Mail-Inhalt (vereinfacht)

```
Betreff: Erinnerung: Ihr Termin morgen – Endlich zu Hause

---

[Logo: Endlich zu Hause]

---

Hallo {{contact.first_name}},

wir freuen uns auf Ihr Gespräch morgen!

Hier nochmal alle Details:

• Gesprächstyp: {{appointment.title}}
• Datum & Uhrzeit: {{appointment.start_time}}
• Ort / Kontaktart: {{appointment.meeting_location}}

{{appointment.user.name}} bereitet sich bereits auf das Gespräch vor.

Falls Sie den Termin verschieben oder absagen möchten:
[Termin anpassen] oder [absagen]

Wir freuen uns auf Sie!

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
- **Beispiel:** "Lisa"
- **Zweck:** Persönliche Ansprache

---

### **{{appointment.title}}**
- **Beispiel:** "Erstgespräch Baufinanzierung"
- **Zweck:** Kunde wird erinnert, worum es im Termin geht

---

### **{{appointment.start_time}}**
- **Beispiel:** "20. November 2025 um 14:00 Uhr"
- **Zweck:** Klare Angabe von Datum und Uhrzeit

---

### **{{appointment.meeting_location}}**
- **Beispiel:** "Google Meet"
- **Zweck:** Kunde weiß, wie/wo der Termin stattfindet

---

### **{{appointment.user.name}}**
- **Beispiel:** "Sabine Schulz"
- **Zweck:** Persönliche Verbindung zum Berater herstellen

---

### **{{appointment.reschedule_link}}**
- **Zweck:** Kunde kann kurzfristig noch umbuchen

---

### **{{appointment.cancellation_link}}**
- **Zweck:** Kunde kann kurzfristig noch absagen

---

## 🎯 Workflow-Übersicht

```
1. Termin ist gebucht und bestätigt
   ↓
2. GHL prüft automatisch: Termin in 24 Stunden?
   ↓
3. Workflow "Terminerinnerung" wird ausgelöst
   ↓
4. E-Mail-Template "KND_02_erinnerung" wird geladen
   ↓
5. Merge Fields werden ersetzt
   ↓
6. E-Mail wird an {{contact.email}} versendet
   ↓
7. Kunde erhält Erinnerung
```

---

## ✅ Warum ist diese E-Mail wichtig?

- **Reduziert No-Shows:** Kunden vergessen Termine seltener
- **Gibt letzte Chance zum Umbuchen:** Falls sich etwas geändert hat
- **Zeigt Professionalität:** Kunde fühlt sich gut betreut
- **Bereitet vor:** Kunde kann sich mental auf den Termin einstellen

---

## 🚀 Nächster Schritt

Schaue dir die **echte HTML-Vorlage** an:

`Vorlagen Kalender/KND_02_erinnerung.html`

---

**Hinweis:** Dies ist nur eine Demo-Version. Nutze für den echten Einsatz die HTML-Vorlage!
