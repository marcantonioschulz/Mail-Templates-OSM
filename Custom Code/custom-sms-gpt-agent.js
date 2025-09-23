// custom-sms-gpt-agent.js
// Sends a daily SMS for 30 days, each message is context-aware and uses GPT agent logic.
// Usage: Place in Custom Code action in GoHighLevel workflow. Input: inputData (see CRM docs)

/**
 * inputData: {
 *   contact: { first_name, ... },
 *   chatHistory: [ { text: string, timestamp: string }, ... ],
 *   day: number // 1-30
 * }
 * Output: { smsText: string, nextDay: number, stop: boolean }
 */

const CTA_ROULETTE = [
  'Welche Uhrzeit passt dir?',
  'Schick mir einfach eine Zeit!',
  '15 Min reichen – wann dir?',
  'Sag kurz, wann es dir passt.'
];

function getRandomCTA(lastCTA) {
  let options = CTA_ROULETTE.filter(cta => cta !== lastCTA);
  return options[Math.floor(Math.random() * options.length)];
}

function getLastCTA(chatHistory) {
  for (let i = chatHistory.length - 1; i >= 0; i--) {
    let match = CTA_ROULETTE.find(cta => chatHistory[i].text && chatHistory[i].text.includes(cta));
    if (match) return match;
  }
  return null;
}

function getRecentHooks(chatHistory) {
  // Extract last 4 hooks (simple heuristic: first sentence or emoji)
  return chatHistory.slice(-4).map(msg => msg.text.split(/[.!?]/)[0].trim());
}

function pickHook(day, usedHooks) {
  // Rotate hooks: Nutzen-Fact, Social Proof, Mini-Fakt, Dringlichkeit
  const hooks = [
    'Kaufen ist billiger als Mieten – individuell, transparent, unabhängig.',
    'Schon 4,9★ auf Trustpilot!',
    'Mit Eigenkapital senkst du die Zinsen.',
    'Jetzt ist ein guter Zeitpunkt für den nächsten Schritt.'
  ];
  let available = hooks.filter(h => !usedHooks.includes(h));
  return available[day % available.length] || hooks[0];
}

function buildSMS({ contact, chatHistory, day }) {
  if (day > 30) return { smsText: '', nextDay: day, stop: true };
  const firstName = contact.first_name || 'Hallo';
  const lastCTA = getLastCTA(chatHistory);
  const cta = getRandomCTA(lastCTA);
  const usedHooks = getRecentHooks(chatHistory);
  const hook = pickHook(day, usedHooks);
  // Optional emoji
  const emoji = day % 5 === 0 ? '🏡' : '';
  let sms = `${firstName}, ${hook} ${emoji} ${cta}`.trim();
  // Ensure ≤160 chars
  if (sms.length > 160) sms = sms.slice(0, 157) + '…';
  return { smsText: sms, nextDay: day + 1, stop: day >= 30 };
}

// Main entry
return buildSMS(inputData);
