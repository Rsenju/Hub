# Deploy do Deutsch Hub no GitHub + Vercel

## 1. Antes de subir para o GitHub

As chaves secretas foram movidas para rotas serverless em `api/`.
Nao coloque `.env` no GitHub. O arquivo `.gitignore` ja bloqueia `.env` e `.env.*`.

A chave `anon public` do Supabase pode ficar no HTML desde que suas policies/RLS estejam configuradas de acordo com o uso publico do app. Nunca use `service_role` no frontend.

## 2. Variaveis de ambiente na Vercel

No painel da Vercel:

1. Abra o projeto.
2. Va em **Settings > Environment Variables**.
3. Adicione as variaveis abaixo em **Production**, **Preview** e **Development**.

```txt
GROQ_API_KEY=...
HUGGINGFACE_API_KEY=...
ELEVENLABS_API_KEY=...
PEXELS_API_KEY=...
UPSTASH_REDIS_REST_URL=...
UPSTASH_REDIS_REST_TOKEN=...
LANGUAGETOOL_ENDPOINT=https://api.languagetoolplus.com/v2/check
```

Para Upstash, use o par correto do Redis REST:

- `UPSTASH_REDIS_REST_URL`: URL HTTPS do banco Redis.
- `UPSTASH_REDIS_REST_TOKEN`: token REST do banco Redis.

A key sozinha nao basta.

## 3. Subir para o GitHub

Na pasta do projeto:

```bash
git init
git add .
git commit -m "Add Deutsch Hub v2"
git branch -M main
git remote add origin URL_DO_REPOSITORIO
git push -u origin main
```

## 4. Deploy na Vercel

1. Va em **Vercel > Add New Project**.
2. Importe o repositorio do GitHub.
3. Framework preset: **Other**.
4. Build command: deixe vazio.
5. Output directory: deixe vazio.
6. Adicione as env vars.
7. Clique em **Deploy**.

O arquivo `vercel.json` redireciona `/` para `deutsch-hub-v2.html`.

## 5. Rotas usadas pelo frontend

O HTML chama somente rotas locais:

- `/api/groq`
- `/api/huggingface`
- `/api/elevenlabs`
- `/api/pexels`
- `/api/languagetool`
- `/api/upstash`

Essas rotas fazem as chamadas externas usando variaveis de ambiente da Vercel.

## 6. Recomendacao de seguranca

Como as chaves ja foram coladas durante o desenvolvimento, rotacione as chaves antes do deploy publico:

- Groq
- ElevenLabs
- Hugging Face
- Pexels
- Upstash

Depois cadastre apenas as chaves novas na Vercel.
