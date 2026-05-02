function setCorsHeaders(res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
}

export default async function handler(req, res) {
  if (req.method === 'OPTIONS') { setCorsHeaders(res); return res.status(200).end(); }
  setCorsHeaders(res);
  if (req.method !== 'POST') return res.status(405).json({ error: 'method-not-allowed' });
  
  const restUrl = process.env.UPSTASH_REDIS_REST_URL;
  const token = process.env.UPSTASH_REDIS_REST_TOKEN;
  if (!restUrl || !token) {
    return res.status(200).json({ skipped: true, reason: 'missing-upstash-env' });
  }

  try {
    const { key, value, ttlSeconds = 3600 } = req.body || {};
    if (!key || typeof key !== 'string') {
      return res.status(400).json({ error: 'missing-key' });
    }
    
    const safeKey = String(key).slice(0, 200);
    const safeTtl = Math.min(Number(ttlSeconds) || 3600, 86400);

    // SET com verificação
    const setRes = await fetch(`${restUrl}/set/${encodeURIComponent(safeKey)}`, {
      method: 'POST',
      headers: { 
        Authorization: `Bearer ${token}`, 
        'Content-Type': 'application/json' 
      },
      body: JSON.stringify(value)
    });
    
    if (!setRes.ok) {
      throw new Error(`Upstash SET failed: ${setRes.status}`);
    }

    // EXPIRE com verificação
    const expireRes = await fetch(`${restUrl}/expire/${encodeURIComponent(safeKey)}/${safeTtl}`, {
      method: 'POST',
      headers: { Authorization: `Bearer ${token}` }
    });
    
    if (!expireRes.ok) {
      throw new Error(`Upstash EXPIRE failed: ${expireRes.status}`);
    }

    return res.status(200).json({ ok: true, key: safeKey, ttl: safeTtl });

  } catch (err) {
    console.error('Upstash proxy error:', err.message);
    return res.status(500).json({ error: 'upstash-proxy-error', detail: err.message });
  }
}