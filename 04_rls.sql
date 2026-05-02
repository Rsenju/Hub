-- =====================================================
-- DEUTSCH HUB — 04_rls.sql
-- Row Level Security: habilita RLS e cria políticas.
-- Execute após 02_tables.sql.
-- =====================================================


-- ══════════════════════════════════════════════════
-- BLOCO 1 — Habilitar RLS em todas as tabelas
-- ══════════════════════════════════════════════════

ALTER TABLE profiles           ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_progress      ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_api_keys      ENABLE ROW LEVEL SECURITY;
ALTER TABLE xp_log             ENABLE ROW LEVEL SECURITY;
ALTER TABLE grammar_errors     ENABLE ROW LEVEL SECURITY;
ALTER TABLE chat_history       ENABLE ROW LEVEL SECURITY;
ALTER TABLE shadowing_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE boss_fights        ENABLE ROW LEVEL SECURITY;
ALTER TABLE achievements       ENABLE ROW LEVEL SECURITY;
ALTER TABLE srs_progress       ENABLE ROW LEVEL SECURITY;
ALTER TABLE flashcard_media    ENABLE ROW LEVEL SECURITY;
ALTER TABLE flashcards_v2      ENABLE ROW LEVEL SECURITY;
ALTER TABLE study_modules      ENABLE ROW LEVEL SECURITY;
ALTER TABLE study_lessons      ENABLE ROW LEVEL SECURITY;
ALTER TABLE study_exercises    ENABLE ROW LEVEL SECURITY;
ALTER TABLE deutsch_challenges ENABLE ROW LEVEL SECURITY;
ALTER TABLE notes              ENABLE ROW LEVEL SECURITY;


-- ══════════════════════════════════════════════════
-- BLOCO 2 — Limpar políticas antigas (idempotente)
-- ══════════════════════════════════════════════════
-- Remove qualquer política "allow all" ou "user_isolation"
-- que possa ter sobrado de execuções anteriores.

DO $$
DECLARE
  tbl TEXT;
BEGIN
  FOREACH tbl IN ARRAY ARRAY[
    'profiles', 'user_progress', 'user_api_keys',
    'xp_log', 'grammar_errors', 'chat_history',
    'shadowing_sessions', 'boss_fights', 'achievements',
    'srs_progress', 'flashcard_media', 'flashcards_v2',
    'study_modules', 'study_lessons', 'study_exercises',
    'deutsch_challenges', 'notes'
  ]
  LOOP
    EXECUTE format('DROP POLICY IF EXISTS "allow all"            ON public.%I', tbl);
    EXECUTE format('DROP POLICY IF EXISTS "user_isolation"        ON public.%I', tbl);
    EXECUTE format('DROP POLICY IF EXISTS "Allow public read access" ON public.%I', tbl);
    EXECUTE format('DROP POLICY IF EXISTS "public_read"           ON public.%I', tbl);
  END LOOP;
END $$;


-- ══════════════════════════════════════════════════
-- BLOCO 3 — Tabelas de conteúdo: leitura pública
-- Flashcards, módulos, lições, exercícios e desafios
-- são conteúdo compartilhado — qualquer usuário lê,
-- ninguém escreve (apenas o admin via service role).
-- ══════════════════════════════════════════════════

CREATE POLICY "public_read" ON flashcards_v2
  FOR SELECT USING (true);

CREATE POLICY "public_read" ON study_modules
  FOR SELECT USING (true);

CREATE POLICY "public_read" ON study_lessons
  FOR SELECT USING (true);

CREATE POLICY "public_read" ON study_exercises
  FOR SELECT USING (true);

CREATE POLICY "public_read" ON deutsch_challenges
  FOR SELECT USING (true);


-- ══════════════════════════════════════════════════
-- BLOCO 4 — Tabelas de usuário: isolamento por user_id
-- Cada usuário só acessa seus próprios dados.
-- ══════════════════════════════════════════════════

CREATE POLICY "user_isolation" ON profiles FOR ALL
  USING      (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "user_isolation" ON user_progress FOR ALL
  USING      (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "user_isolation" ON user_api_keys FOR ALL
  USING      (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "user_isolation" ON xp_log FOR ALL
  USING      (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "user_isolation" ON grammar_errors FOR ALL
  USING      (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "user_isolation" ON chat_history FOR ALL
  USING      (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "user_isolation" ON shadowing_sessions FOR ALL
  USING      (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "user_isolation" ON boss_fights FOR ALL
  USING      (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "user_isolation" ON achievements FOR ALL
  USING      (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "user_isolation" ON srs_progress FOR ALL
  USING      (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "user_isolation" ON flashcard_media FOR ALL
  USING      (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "user_isolation" ON notes FOR ALL
  USING      (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);


-- ══════════════════════════════════════════════════
-- NOTAS DE PRODUÇÃO
-- ══════════════════════════════════════════════════
--
-- 1. AUTENTICAÇÃO
--    As políticas "user_isolation" dependem de auth.uid().
--    Ative um provider em: Dashboard > Authentication > Providers
--    (email/password, Google, GitHub, etc.)
--
-- 2. ANONYMOUS SIGN-IN (opcional para dev)
--    Ative em: Dashboard > Authentication > Providers > Anonymous
--    Permite testar sem criar conta. Desative em produção.
--
-- 3. INSERÇÃO DE CONTEÚDO (flashcards, módulos etc.)
--    As tabelas de conteúdo têm só SELECT público.
--    Para inserir/atualizar via migrations, use a
--    service_role key (nunca exposta no frontend).
--
-- 4. VERIFICAR POLÍTICAS ATIVAS
--    SELECT tablename, policyname, cmd
--    FROM pg_policies
--    WHERE schemaname = 'public'
--    ORDER BY tablename, policyname;