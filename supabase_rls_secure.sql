-- =====================================================
-- DEUTSCH HUB — RLS Seguro (Substitui políticas abertas)
--
-- INSTRUÇÕES:
-- 1. Execute este SQL no SQL Editor do Supabase
-- 2. No Dashboard > Authentication > Providers, ative
--    "Anonymous Sign-Ins" (temporário) ou email/password
-- 3. As políticas abaixo usam auth.uid() para isolar
--    os dados de cada usuário. Sem auth, ninguém acessa.
--
-- PARA PRODUÇÃO: desative Anonymous Sign-Ins e use
-- autenticação real (email, OAuth, etc).
-- =====================================================

-- ======================================================
-- 1. DROP das políticas antigas "allow all"
-- ======================================================
DO $$
DECLARE
  tbl text;
BEGIN
  FOREACH tbl IN ARRAY ARRAY[
    'user_progress', 'xp_log', 'grammar_errors',
    'shadowing_sessions', 'boss_fights',
    'profiles', 'chat_history', 'srs_progress',
    'achievements', 'notes', 'flashcard_media',
    'user_api_keys'
  ]
  LOOP
    -- Drop todas as políticas de cada tabela (se existirem)
    EXECUTE format(
      'DROP POLICY IF EXISTS "allow all" ON public.%I',
      tbl
    );
    EXECUTE format(
      'DROP POLICY IF EXISTS "user_isolation" ON public.%I',
      tbl
    );
  END LOOP;
END $$;

-- ======================================================
-- 2. Criação da tabela user_api_keys (faltava nos scripts anteriores)
-- ======================================================
CREATE TABLE IF NOT EXISTS user_api_keys (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id text NOT NULL,
  provider text NOT NULL,
  api_key text NOT NULL,
  is_valid boolean DEFAULT false,
  last_tested_at timestamptz,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE (user_id, provider)
);

ALTER TABLE user_api_keys ENABLE ROW LEVEL SECURITY;

-- ======================================================
-- 3. Políticas de isolamento por usuário
--    Cada usuário só vê/edita seus próprios dados.
-- ======================================================

-- user_progress
CREATE POLICY "user_isolation" ON user_progress FOR ALL
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

-- xp_log
CREATE POLICY "user_isolation" ON xp_log FOR ALL
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

-- grammar_errors
CREATE POLICY "user_isolation" ON grammar_errors FOR ALL
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

-- shadowing_sessions
CREATE POLICY "user_isolation" ON shadowing_sessions FOR ALL
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

-- boss_fights
CREATE POLICY "user_isolation" ON boss_fights FOR ALL
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

-- profiles
CREATE POLICY "user_isolation" ON profiles FOR ALL
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

-- chat_history
CREATE POLICY "user_isolation" ON chat_history FOR ALL
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

-- srs_progress
CREATE POLICY "user_isolation" ON srs_progress FOR ALL
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

-- achievements
CREATE POLICY "user_isolation" ON achievements FOR ALL
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

-- notes
CREATE POLICY "user_isolation" ON notes FOR ALL
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

-- flashcard_media
CREATE POLICY "user_isolation" ON flashcard_media FOR ALL
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

-- user_api_keys
CREATE POLICY "user_isolation" ON user_api_keys FOR ALL
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);
