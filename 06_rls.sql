-- =====================================================
-- DEUTSCH HUB — 06_rls.sql
-- Row Level Security.
-- =====================================================

-- ── 1. Habilitar RLS ──────────────────────────────
ALTER TABLE profiles           ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_progress      ENABLE ROW LEVEL SECURITY;
ALTER TABLE flashcards_v2      ENABLE ROW LEVEL SECURITY;
ALTER TABLE study_modules      ENABLE ROW LEVEL SECURITY;
ALTER TABLE study_lessons      ENABLE ROW LEVEL SECURITY;
ALTER TABLE study_exercises    ENABLE ROW LEVEL SECURITY;
ALTER TABLE xp_log             ENABLE ROW LEVEL SECURITY;
ALTER TABLE chat_history       ENABLE ROW LEVEL SECURITY;
ALTER TABLE grammar_errors     ENABLE ROW LEVEL SECURITY;
ALTER TABLE notes              ENABLE ROW LEVEL SECURITY;

-- ── 2. Limpeza de Políticas Antigas ───────────────
DO $$
DECLARE tbl TEXT;
BEGIN
  FOREACH tbl IN ARRAY ARRAY[
    'profiles', 'user_progress', 'flashcards_v2',
    'study_modules', 'study_lessons', 'study_exercises',
    'xp_log', 'chat_history', 'grammar_errors', 'notes'
  ] LOOP
    EXECUTE format('DROP POLICY IF EXISTS "public_read" ON public.%I', tbl);
    EXECUTE format('DROP POLICY IF EXISTS "user_isolation" ON public.%I', tbl);
  END LOOP;
END $$;

-- ── 3. Políticas de Leitura Pública (Conteúdo) ────
-- Permite que qualquer usuário logado leia os conteúdos de estudo
CREATE POLICY "public_read" ON flashcards_v2   FOR SELECT USING (auth.uid() IS NOT NULL);
CREATE POLICY "public_read" ON study_modules   FOR SELECT USING (auth.uid() IS NOT NULL);
CREATE POLICY "public_read" ON study_lessons   FOR SELECT USING (auth.uid() IS NOT NULL);
CREATE POLICY "public_read" ON study_exercises FOR SELECT USING (auth.uid() IS NOT NULL);

-- ── 4. Políticas de Isolamento (Dados do Usuário) ─
-- O usuário só vê seus próprios dados
CREATE POLICY "user_isolation" ON profiles        FOR ALL USING (auth.uid()::text = user_id) WITH CHECK (auth.uid()::text = user_id);
CREATE POLICY "user_isolation" ON user_progress   FOR ALL USING (auth.uid()::text = user_id) WITH CHECK (auth.uid()::text = user_id);
CREATE POLICY "user_isolation" ON xp_log          FOR ALL USING (auth.uid()::text = user_id) WITH CHECK (auth.uid()::text = user_id);
CREATE POLICY "user_isolation" ON chat_history    FOR ALL USING (auth.uid()::text = user_id) WITH CHECK (auth.uid()::text = user_id);
CREATE POLICY "user_isolation" ON grammar_errors  FOR ALL USING (auth.uid()::text = user_id) WITH CHECK (auth.uid()::text = user_id);
CREATE POLICY "user_isolation" ON notes           FOR ALL USING (auth.uid()::text = user_id) WITH CHECK (auth.uid()::text = user_id);