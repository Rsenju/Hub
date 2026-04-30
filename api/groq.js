const MAX_TEXT_LEN = 4000;
const MAX_MSGS = 20;

function setCorsHeaders(res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
}

export default async function handler(req, res) {
  if (req.method === 'OPTIONS') { setCorsHeaders(res); return res.status(200).end(); }
  setCorsHeaders(res);
  if (req.method !== 'POST') return res.status(405).json({ error: 'method-not-allowed' });
  const apiKey = process.env.GROQ_API_KEY;
  if (!apiKey) return res.status(500).json({ error: 'missing-groq-key' });

  try {
    const body = req.body || {};
    const messages = Array.isArray(body.messages) ? body.messages.slice(0, MAX_MSGS) : [];
    for (const m of messages) {
      if (typeof m.content === 'string' && m.content.length > MAX_TEXT_LEN) m.content = m.content.slice(0, MAX_TEXT_LEN);
    }
    const upstream = await fetch('https://api.groq.com/openai/v1/chat/completions', {
      method: 'POST',
      headers: { 'Authorization': `Bearer ${apiKey}`, 'Content-Type': 'application/json' },
      body: JSON.stringify({
        model: body.model || 'llama3-8b-8192',
        messages,
        max_tokens: Math.min(Number(body.max_tokens) || 800, 2000),
        temperature: Math.max(0, Math.min(Number(body.temperature) ?? 0.7, 1))
      })
    });
    const data = await upstream.json();
    return res.status(upstream.status).json(data);
  } catch {
    return res.status(500).json({ error: 'groq-proxy-error' });
  }
}
