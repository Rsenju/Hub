-- =====================================================
-- DEUTSCH HUB — 02_tables.sql
-- Criação de tabelas para A1, A2 e B1.
-- =====================================================

-- ── 1. Perfis e Progresso ─────────────────────────
CREATE TABLE IF NOT EXISTS profiles (
  user_id        TEXT PRIMARY KEY,
  display_name   TEXT DEFAULT 'Aluno',
  current_level  TEXT DEFAULT 'A1', -- A1, A2, B1...
  total_xp       INTEGER DEFAULT 0,
  streak         INTEGER DEFAULT 0,
  last_login     TIMESTAMPTZ,
  created_at     TIMESTAMPTZ DEFAULT now(),
  updated_at     TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS user_progress (
  id             UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id        TEXT NOT NULL,
  module_slug    TEXT NOT NULL,
  completed      BOOLEAN DEFAULT false,
  score          INTEGER DEFAULT 0,
  updated_at     TIMESTAMPTZ DEFAULT now()
);

-- ── 2. Log de XP ──────────────────────────────────
CREATE TABLE IF NOT EXISTS xp_log (
  id             UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id        TEXT NOT NULL,
  amount         INTEGER NOT NULL,
  reason         TEXT NOT NULL,
  created_at     TIMESTAMPTZ DEFAULT now()
);

-- ── 3. Histórico de Chat ──────────────────────────
CREATE TABLE IF NOT EXISTS chat_history (
  id             UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id        TEXT NOT NULL,
  character_key  TEXT NOT NULL, -- hans, lukas, heidi, petra
  role           TEXT NOT NULL, -- user, assistant
  content        TEXT NOT NULL,
  created_at     TIMESTAMPTZ DEFAULT now()
);

-- ── 4. Flashcards V2 (Estrutura Nova) ─────────────
CREATE TABLE IF NOT EXISTS flashcards_v2 (
  id             UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  slug           TEXT UNIQUE NOT NULL, -- ex: 'fc-a1-c01'
  level          TEXT NOT NULL CHECK (level IN ('A1', 'A2', 'B1')),
  theme          TEXT NOT NULL,
  card_type      TEXT DEFAULT 'phrase',
  front_de       TEXT NOT NULL,
  back_pt        TEXT NOT NULL,
  explanation_pt TEXT,
  grammar_note   TEXT,
  example_de     TEXT,
  example_pt     TEXT,
  tags           JSONB DEFAULT '[]'::jsonb, -- ex: ["vocabulario", "verbo"]
  active         BOOLEAN DEFAULT true,
  created_at     TIMESTAMPTZ DEFAULT now(),
  updated_at     TIMESTAMPTZ DEFAULT now()
);

-- ── 5. Conteúdo de Estudo (Módulos, Lições, Exercícios) ──
CREATE TABLE IF NOT EXISTS study_modules (
  id             UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  slug           TEXT UNIQUE NOT NULL, -- ex: 'a1-cap1'
  level          TEXT NOT NULL CHECK (level IN ('A1', 'A2', 'B1')),
  chapter_number INTEGER,
  title_pt       TEXT NOT NULL,
  title_de       TEXT,
  focus          TEXT, -- Resumo curto do foco do capítulo
  sort_order     INTEGER,
  active         BOOLEAN DEFAULT true,
  created_at     TIMESTAMPTZ DEFAULT now(),
  updated_at     TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS study_lessons (
  id             UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  module_slug    TEXT REFERENCES study_modules(slug) ON DELETE CASCADE,
  slug           TEXT UNIQUE NOT NULL, -- ex: 'a1-l1-1'
  level          TEXT NOT NULL CHECK (level IN ('A1', 'A2', 'B1')),
  title_pt       TEXT NOT NULL,
  title_de       TEXT,
  summary_pt     TEXT, -- Texto longo do diálogo/conteúdo
  quick_rule_pt  TEXT, -- Regra rápida
  examples       JSONB DEFAULT '[]'::jsonb, -- Exemplos estruturados
  key_phrases    JSONB DEFAULT '[]'::jsonb, -- Vocabulário chave
  mini_notes     JSONB DEFAULT '[]'::jsonb, -- Notas extras/Cultura
  sort_order     INTEGER,
  active         BOOLEAN DEFAULT true,
  created_at     TIMESTAMPTZ DEFAULT now(),
  updated_at     TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS study_exercises (
  id             UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  lesson_slug    TEXT REFERENCES study_lessons(slug) ON DELETE CASCADE,
  slug           TEXT UNIQUE NOT NULL, -- ex: 'a1-ex001'
  module_slug    TEXT,
  level          TEXT CHECK (level IN ('A1', 'A2', 'B1')),
  exercise_type  TEXT NOT NULL CHECK (exercise_type IN ('choose_option', 'fill_blank', 'translate_to_de', 'free_answer')),
  prompt_pt      TEXT NOT NULL,
  prompt_de      TEXT,
  options        JSONB DEFAULT '[]'::jsonb, -- Para múltipla escolha: ["opcaoA", "opcaoB"]
  answer         TEXT NOT NULL,
  explanation_pt TEXT,
  xp_reward      INTEGER DEFAULT 10,
  sort_order     INTEGER,
  active         BOOLEAN DEFAULT true,
  created_at     TIMESTAMPTZ DEFAULT now(),
  updated_at     TIMESTAMPTZ DEFAULT now()
);

-- ── 6. Erros Gramaticais ──────────────────────────
CREATE TABLE IF NOT EXISTS grammar_errors (
  id             UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id        TEXT NOT NULL,
  original_text  TEXT NOT NULL,
  correction     TEXT,
  rule           TEXT,
  fixed          BOOLEAN DEFAULT false,
  created_at     TIMESTAMPTZ DEFAULT now()
);

-- ── 7. Notas Pessoais ─────────────────────────────
CREATE TABLE IF NOT EXISTS notes (
  id             UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id        TEXT NOT NULL,
  category       TEXT NOT NULL, -- vocab, grammar, personal
  content        TEXT,
  created_at     TIMESTAMPTZ DEFAULT now(),
  updated_at     TIMESTAMPTZ DEFAULT now()
);

-- ── Triggers de updated_at ────────────────────────
-- Aplica a função set_updated_at() em tabelas com esta coluna
DO $$
DECLARE tbl TEXT;
BEGIN
  FOREACH tbl IN ARRAY ARRAY[
    'profiles', 'flashcards_v2', 'study_modules', 'study_lessons', 
    'study_exercises', 'user_progress'
  ] LOOP
    EXECUTE format(
      'DROP TRIGGER IF EXISTS trg_set_updated_at ON public.%I;
       CREATE TRIGGER trg_set_updated_at BEFORE UPDATE ON public.%I
       FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();',
      tbl, tbl
    );
  END LOOP;
END $$;