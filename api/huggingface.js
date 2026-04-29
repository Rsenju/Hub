export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ error: 'method-not-allowed' });
  const apiKey = process.env.HUGGINGFACE_API_KEY;
  if (!apiKey) return res.status(500).json({ error: 'missing-huggingface-key' });

  try {
    const body = req.body || {};
    const upstream = await fetch('https://api-inference.huggingface.co/models/mistralai/Mistral-7B-Instruct-v0.1', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${apiKey}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        inputs: body.inputs || '',
        parameters: body.parameters || { max_new_tokens: 600, temperature: 0.7 }
      })
    });
    const data = await upstream.json();
    return res.status(upstream.status).json(data);
  } catch (error) {
    return res.status(500).json({ error: 'huggingface-proxy-error' });
  }
}
