-- Criar a tabela para o Hub de Alemão
CREATE TABLE IF NOT EXISTS study_modules (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    chapter TEXT NOT NULL,
    title TEXT NOT NULL,
    level TEXT NOT NULL,
    content JSONB NOT NULL -- Aqui entra a mágica do 1.1, 1.2 e Atividades
);

-- Ativar RLS (Segurança)
ALTER TABLE study_modules ENABLE ROW LEVEL SECURITY;

-- Política para você conseguir ler os dados no seu App
CREATE POLICY "Allow public read access" ON study_modules
    FOR SELECT USING (true);