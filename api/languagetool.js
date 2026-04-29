export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ error: 'method-not-allowed' });
  const endpoint = process.env.LANGUAGETOOL_ENDPOINT || 'https://api.languagetoolplus.com/v2/check';

  try {
    const { text, language = 'de-DE' } = req.body || {};
    if (!text) return res.status(400).json({ error: 'missing-text' });
    const params = new URLSearchParams({ text, language });
    const upstream = await fetch(endpoint, {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: params.toString()
    });
    const data = await upstream.json();
    return res.status(upstream.status).json(data);
  } catch (error) {
    return res.status(500).json({ error: 'languagetool-proxy-error' });
  }
}
