export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ error: 'method-not-allowed' });
  const restUrl = process.env.UPSTASH_REDIS_REST_URL;
  const token = process.env.UPSTASH_REDIS_REST_TOKEN;
  if (!restUrl || !token) return res.status(200).json({ skipped: true, reason: 'missing-upstash-env' });

  try {
    const { key, value, ttlSeconds = 3600 } = req.body || {};
    if (!key) return res.status(400).json({ error: 'missing-key' });
    await fetch(`${restUrl}/set/${encodeURIComponent(key)}`, {
      method: 'POST',
      headers: { Authorization: `Bearer ${token}`, 'Content-Type': 'application/json' },
      body: JSON.stringify(value)
    });
    await fetch(`${restUrl}/expire/${encodeURIComponent(key)}/${Number(ttlSeconds) || 3600}`, {
      method: 'POST',
      headers: { Authorization: `Bearer ${token}` }
    });
    return res.status(200).json({ ok: true });
  } catch (error) {
    return res.status(500).json({ error: 'upstash-proxy-error' });
  }
}
