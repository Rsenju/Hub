-- Criar a tabela para o Hub de Alemão
CREATE TABLE IF NOT EXISTS study_modules (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    chapter TEXT NOT NULL,
    title TEXT NOT NULL,
    level TEXT NOT NULL,
    content JSONB NOT NULL
);

-- Ativar RLS (Segurança)
ALTER TABLE study_modules ENABLE ROW LEVEL SECURITY;

-- Política para você conseguir ler os dados no seu App (evita erro 42710)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'study_modules' 
    AND policyname = 'Allow public read access'
  ) THEN
    CREATE POLICY "Allow public read access" ON study_modules
      FOR SELECT USING (true);
  END IF;
END $$;