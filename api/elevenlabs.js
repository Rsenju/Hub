export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ error: 'method-not-allowed' });
  const apiKey = process.env.ELEVENLABS_API_KEY;
  if (!apiKey) return res.status(500).json({ error: 'missing-elevenlabs-key' });

  try {
    const { voiceId, text, voice_settings } = req.body || {};
    if (!voiceId || !text) return res.status(400).json({ error: 'missing-voice-or-text' });

    const upstream = await fetch(`https://api.elevenlabs.io/v1/text-to-speech/${encodeURIComponent(voiceId)}/stream`, {
      method: 'POST',
      headers: {
        'xi-api-key': apiKey,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        text,
        model_id: 'eleven_multilingual_v2',
        voice_settings: voice_settings || { stability: 0.5, similarity_boost: 0.75 }
      })
    });

    if (!upstream.ok) {
      const errorText = await upstream.text();
      return res.status(upstream.status).json({ error: errorText || 'elevenlabs-error' });
    }

    const audio = Buffer.from(await upstream.arrayBuffer());
    res.setHeader('Content-Type', upstream.headers.get('content-type') || 'audio/mpeg');
    res.setHeader('Cache-Control', 'no-store');
    return res.status(200).send(audio);
  } catch (error) {
    return res.status(500).json({ error: 'elevenlabs-proxy-error' });
  }
}
