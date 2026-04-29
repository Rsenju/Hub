-- =====================================================
-- DEUTSCH HUB — Supabase Setup SQL
-- Execute este SQL no SQL Editor do Supabase
-- =====================================================

-- 1. Progresso do usuário por nível
CREATE TABLE IF NOT EXISTS user_progress (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id TEXT NOT NULL DEFAULT 'rebeca',
  level TEXT NOT NULL DEFAULT 'A1',         -- A1, A2, B1, B2
  xp INTEGER NOT NULL DEFAULT 0,
  xp_to_next INTEGER NOT NULL DEFAULT 500,
  level_complete BOOLEAN NOT NULL DEFAULT false,
  boss_defeated BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- Seed inicial
INSERT INTO user_progress (user_id, level, xp, xp_to_next)
VALUES ('rebeca', 'A1', 0, 500)
ON CONFLICT DO NOTHING;

-- 2. Log de XP detalhado
CREATE TABLE IF NOT EXISTS xp_log (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id TEXT NOT NULL DEFAULT 'rebeca',
  amount INTEGER NOT NULL,
  reason TEXT NOT NULL,
  character TEXT,
  level TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 3. Log de erros gramaticais (LanguageTool)
CREATE TABLE IF NOT EXISTS grammar_errors (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id TEXT NOT NULL DEFAULT 'rebeca',
  original_text TEXT NOT NULL,
  error_message TEXT NOT NULL,
  error_type TEXT,
  suggestion TEXT,
  context TEXT,
  character TEXT,
  level TEXT,
  reviewed BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 4. Sessões de Shadowing
CREATE TABLE IF NOT EXISTS shadowing_sessions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id TEXT NOT NULL DEFAULT 'rebeca',
  phrase TEXT NOT NULL,
  accuracy NUMERIC(5,2),
  level TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 5. Boss Fight results
CREATE TABLE IF NOT EXISTS boss_fights (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id TEXT NOT NULL DEFAULT 'rebeca',
  level TEXT NOT NULL,
  score INTEGER,
  passed BOOLEAN DEFAULT false,
  details JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 6. Habilitar RLS (Row Level Security) — acesso público para dev
ALTER TABLE user_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE xp_log ENABLE ROW LEVEL SECURITY;
ALTER TABLE grammar_errors ENABLE ROW LEVEL SECURITY;
ALTER TABLE shadowing_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE boss_fights ENABLE ROW LEVEL SECURITY;

-- Políticas abertas para desenvolvimento (ajuste para produção)
CREATE POLICY "allow all" ON user_progress FOR ALL USING (true);
CREATE POLICY "allow all" ON xp_log FOR ALL USING (true);
CREATE POLICY "allow all" ON grammar_errors FOR ALL USING (true);
CREATE POLICY "allow all" ON shadowing_sessions FOR ALL USING (true);
CREATE POLICY "allow all" ON boss_fights FOR ALL USING (true);
