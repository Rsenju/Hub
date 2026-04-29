export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ error: 'method-not-allowed' });
  const apiKey = process.env.GROQ_API_KEY;
  if (!apiKey) return res.status(500).json({ error: 'missing-groq-key' });

  try {
    const body = req.body || {};
    const upstream = await fetch('https://api.groq.com/openai/v1/chat/completions', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${apiKey}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        model: body.model || 'llama3-8b-8192',
        messages: body.messages || [],
        max_tokens: body.max_tokens || 800,
        temperature: body.temperature ?? 0.7
      })
    });
    const data = await upstream.json();
    return res.status(upstream.status).json(data);
  } catch (error) {
    return res.status(500).json({ error: 'groq-proxy-error' });
  }
}
