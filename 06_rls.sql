-- =====================================================
-- DEUTSCH HUB — 06_rls.sql (Ajustado)
-- =====================================================
-- 1. Habilitar RLS em todas as tabelas
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

-- 2. Limpeza segura de políticas antigas
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
  EXECUTE format('DROP POLICY IF EXISTS "public_read_%1$s" ON public.%1$I', tbl);
  EXECUTE format('DROP POLICY IF EXISTS "user_isolation_%1$s" ON public.%1$I', tbl);
END LOOP;
END $$;

-- 3. Políticas de Leitura (Conteúdo Estático)
-- 🔒 Apenas usuários AUTENTICADOS podem ler lições, flashcards e exercícios
CREATE POLICY "public_read_flashcards"   ON flashcards_v2   FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "public_read_modules"      ON study_modules   FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "public_read_lessons"      ON study_lessons   FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "public_read_exercises"    ON study_exercises FOR SELECT USING (auth.role() = 'authenticated');

-- 💡 SE QUISER ACESSO PÚBLICO (SEM LOGIN), troque `auth.role() = 'authenticated'` por `true`

-- 4. Políticas de Isolamento (Dados do Usuário)
-- 🛡️ Usuário só visualiza, insere, atualiza ou exclui SEUS próprios registros
CREATE POLICY "user_isolation_profiles"      ON profiles      FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE POLICY "user_isolation_progress"      ON user_progress FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE POLICY "user_isolation_xp"            ON xp_log        FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE POLICY "user_isolation_chat"          ON chat_history  FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE POLICY "user_isolation_errors"        ON grammar_errors FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE POLICY "user_isolation_notes"         ON notes         FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);