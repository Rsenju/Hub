const MAX_INPUT_LEN = 4000;

function setCorsHeaders(res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
}

export default async function handler(req, res) {
  if (req.method === 'OPTIONS') { setCorsHeaders(res); return res.status(200).end(); }
  setCorsHeaders(res);
  if (req.method !== 'POST') return res.status(405).json({ error: 'method-not-allowed' });
  const apiKey = process.env.HUGGINGFACE_API_KEY;
  if (!apiKey) return res.status(500).json({ error: 'missing-huggingface-key' });

  try {
    const body = req.body || {};
    let inputs = String(body.inputs || '');
    if (inputs.length > MAX_INPUT_LEN) inputs = inputs.slice(0, MAX_INPUT_LEN);
    const upstream = await fetch('https://api-inference.huggingface.co/models/mistralai/Mistral-7B-Instruct-v0.1', {
      method: 'POST',
      headers: { 'Authorization': `Bearer ${apiKey}`, 'Content-Type': 'application/json' },
      body: JSON.stringify({
        inputs,
        parameters: {
          max_new_tokens: Math.min(Number(body.parameters?.max_new_tokens) || 600, 1000),
          temperature: Math.max(0, Math.min(Number(body.parameters?.temperature) ?? 0.7, 1))
        }
      })
    });
    const data = await upstream.json();
    return res.status(upstream.status).json(data);
  } catch {
    return res.status(500).json({ error: 'huggingface-proxy-error' });
  }
}
