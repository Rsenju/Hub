export default async function handler(req, res) {
  if (req.method !== 'GET') return res.status(405).json({ error: 'method-not-allowed' });
  const apiKey = process.env.PEXELS_API_KEY;
  if (!apiKey) return res.status(500).json({ error: 'missing-pexels-key' });

  try {
    const query = String(req.query.query || '').trim();
    if (!query) return res.status(400).json({ error: 'missing-query' });
    const perPage = Math.min(Number(req.query.per_page || 1), 5);
    const url = new URL('https://api.pexels.com/v1/search');
    url.searchParams.set('query', query);
    url.searchParams.set('per_page', String(perPage));
    url.searchParams.set('orientation', String(req.query.orientation || 'landscape'));

    const upstream = await fetch(url, { headers: { Authorization: apiKey } });
    const data = await upstream.json();
    res.setHeader('Cache-Control', 's-maxage=86400, stale-while-revalidate=604800');
    return res.status(upstream.status).json(data);
  } catch (error) {
    return res.status(500).json({ error: 'pexels-proxy-error' });
  }
}
