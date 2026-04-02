# ❌ Demo: Termin-Absage-Bestätigung

**Zweck:** Diese E-Mail wird automatisch versendet, wenn ein Kunde einen Termin absagt.

**Zielgruppe:** Kunde (KND)

**Echte Vorlage:** `Vorlagen Kalender/KND_04_termin_abgesagt.html`

---

## 📝 E-Mail-Inhalt (vereinfacht)

```
Betreff: Termin abgesagt – Endlich zu Hause

---

[Logo: Endlich zu Hause]

---

Hallo {{contact.first_name}} {{contact.last_name}},

wir haben Ihre Absage für folgenden Termin erhalten:

• Gesprächstyp: {{appointment.title}}
• Datum & Uhrzeit: {{appointment.start_time}}

Schade, dass es nicht geklappt hat! Aber kein Problem – Sie können jederzeit einen neuen Termin buchen.

[Neuen Termin buchen]

Falls Sie Fragen haben oder Unterstützung benötigen, melden Sie sich gerne.

Viele Grüße
Ihr Team von Endlich zu Hause

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
- **Beispiel:** "Tom"
- **Zweck:** Persönliche Ansprache auch bei Absagen

---

### **{{appointment.title}}**
- **Beispiel:** "Erstgespräch Baufinanzierung"
- **Zweck:** Kunde sieht, welcher Termin abgesagt wurde

---

### **{{appointment.start_time}}**
- **Beispiel:** "20. November 2025 um 14:00 Uhr"
- **Zweck:** Klare Referenz zum stornierten Termin

---

### **{{user.calendar_link}}** (optional)
- **Was ist das?** Link zum Kalender für Neubuchung
- **Beispiel:** `https://termin.endlichzuhause.com/sabine`
- **Zweck:** Kunde kann direkt neu buchen

---

## 🎯 Workflow-Übersicht

```
1. Kunde klickt auf {{appointment.cancellation_link}}
   ↓
2. GHL registriert die Absage und storniert den Termin
   ↓
3. Workflow "Termin abgesagt" wird ausgelöst
   ↓
4. E-Mail-Template "KND_04_termin_abgesagt" wird geladen
   ↓
5. Merge Fields werden ersetzt
   ↓
6. E-Mail wird an {{contact.email}} versendet
   ↓
7. Kunde erhält Bestätigung der Absage
   ↓
8. Optional: Interner Workflow benachrichtigt Berater (INT_04_storno)
```

---

## ✅ Warum ist diese E-Mail wichtig?

- **Bestätigung:** Kunde weiß sicher, dass die Absage registriert wurde
- **Positive Kundenbindung:** "Schade, aber kein Problem" statt Vorwürfe
- **Re-Engagement:** Link zur Neubuchung erhöht Chance auf neuen Termin
- **Professionalität:** Auch bei Absagen bleiben wir freundlich und professionell

---

## 🔄 Paralleler interner Workflow

**Zusätzlich** wird oft eine **interne E-Mail** an den Berater geschickt:

**Template:** `INT_04_storno_abgesagt.html`

**Inhalt (vereinfacht):**

```
Betreff: Termin abgesagt: {{contact.name}}

Hallo {{appointment.user.first_name}},

folgender Termin wurde soeben abgesagt:

• Kunde: {{contact.name}}
• Termin: {{appointment.title}}
• Datum: {{appointment.start_time}}

Bitte prüfe, ob ein Follow-up sinnvoll ist.

[Kontakt im CRM öffnen]

---
```

**Zweck:** Berater wird informiert und kann ggf. nachfassen.

---

## 🚀 Nächster Schritt

Schaue dir die **echten HTML-Vorlagen** an:

- Kunden-E-Mail: `Vorlagen Kalender/KND_04_termin_abgesagt.html`
- Interne E-Mail: `Vorlagen Kalender/INT_04_storno_abgesagt.html`

---

**Hinweis:** Dies ist nur eine Demo-Version. Nutze für den echten Einsatz die HTML-Vorlagen!
