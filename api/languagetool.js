const MAX_TEXT_LEN = 2000;

function setCorsHeaders(res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
}

export default async function handler(req, res) {
  if (req.method === 'OPTIONS') { setCorsHeaders(res); return res.status(200).end(); }
  setCorsHeaders(res);
  if (req.method !== 'POST') return res.status(405).json({ error: 'method-not-allowed' });
  const endpoint = process.env.LANGUAGETOOL_ENDPOINT || 'https://api.languagetoolplus.com/v2/check';

  try {
    const { text, language = 'de-DE' } = req.body || {};
    if (!text || typeof text !== 'string') return res.status(400).json({ error: 'missing-text' });
    const safeText = text.length > MAX_TEXT_LEN ? text.slice(0, MAX_TEXT_LEN) : text;
    const safeLang = ['de-DE','en-US','pt-BR'].includes(language) ? language : 'de-DE';
    const params = new URLSearchParams({ text: safeText, language: safeLang });
    const upstream = await fetch(endpoint, {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: params.toString()
    });
    const data = await upstream.json();
    return res.status(upstream.status).json(data);
  } catch {
    return res.status(500).json({ error: 'languagetool-proxy-error' });
  }
}
