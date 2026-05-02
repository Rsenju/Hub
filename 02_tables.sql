-- =====================================================
-- DEUTSCH HUB — 02_tables.sql
-- Criação de todas as tabelas do projeto.
-- Execute após 01_setup.sql.
-- Ordem: tabelas sem dependência → tabelas com FK.
-- =====================================================


-- ══════════════════════════════════════════════════
-- BLOCO 1 — Progresso e perfil do usuário
-- ══════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS profiles (
  user_id        TEXT PRIMARY KEY,
  display_name   TEXT DEFAULT 'Rebeca',
  current_level  TEXT NOT NULL DEFAULT 'A1',
  total_xp       INTEGER NOT NULL DEFAULT 0,
  streak         INTEGER NOT NULL DEFAULT 0,
  last_study_date DATE,
  voice_premium  BOOLEAN NOT NULL DEFAULT false,
  active_character TEXT NOT NULL DEFAULT 'hans',
  created_at     TIMESTAMPTZ DEFAULT now(),
  updated_at     TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS user_progress (
  id             UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id        TEXT NOT NULL,
  level          TEXT NOT NULL DEFAULT 'A1',
  xp             INTEGER NOT NULL DEFAULT 0,
  xp_to_next     INTEGER NOT NULL DEFAULT 500,
  level_complete BOOLEAN NOT NULL DEFAULT false,
  boss_defeated  BOOLEAN NOT NULL DEFAULT false,
  created_at     TIMESTAMPTZ DEFAULT now(),
  updated_at     TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS user_api_keys (
  id             UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id        TEXT NOT NULL,
  provider       TEXT NOT NULL,
  api_key        TEXT NOT NULL,
  is_valid       BOOLEAN DEFAULT false,
  last_tested_at TIMESTAMPTZ,
  created_at     TIMESTAMPTZ DEFAULT now(),
  updated_at     TIMESTAMPTZ DEFAULT now(),
  UNIQUE (user_id, provider)
);


-- ══════════════════════════════════════════════════
-- BLOCO 2 — Logs e histórico
-- ══════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS xp_log (
  id         UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id    TEXT NOT NULL,
  amount     INTEGER NOT NULL,
  reason     TEXT NOT NULL,
  character  TEXT,
  level      TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS grammar_errors (
  id             UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id        TEXT NOT NULL,
  original_text  TEXT NOT NULL,
  error_message  TEXT NOT NULL,
  error_type     TEXT,
  suggestion     TEXT,
  context        TEXT,
  character      TEXT,
  level          TEXT,
  reviewed       BOOLEAN DEFAULT false,
  created_at     TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS chat_history (
  id               UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id          TEXT NOT NULL,
  character        TEXT NOT NULL,
  role             TEXT NOT NULL CHECK (role IN ('user', 'assistant', 'system')),
  content          TEXT NOT NULL,
  grammar_feedback JSONB,
  xp_awarded       INTEGER DEFAULT 0,
  created_at       TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS chat_history_user_character_created_idx
  ON chat_history (user_id, character, created_at DESC);


-- ══════════════════════════════════════════════════
-- BLOCO 3 — Sessões e conquistas
-- ══════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS shadowing_sessions (
  id         UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id    TEXT NOT NULL,
  phrase     TEXT NOT NULL,
  accuracy   NUMERIC(5,2),
  level      TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS boss_fights (
  id         UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id    TEXT NOT NULL,
  level      TEXT NOT NULL,
  score      INTEGER,
  passed     BOOLEAN DEFAULT false,
  details    JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS achievements (
  id          UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id     TEXT NOT NULL,
  code        TEXT NOT NULL,
  title       TEXT NOT NULL,
  description TEXT,
  xp_reward   INTEGER DEFAULT 0,
  unlocked_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE (user_id, code)
);


-- ══════════════════════════════════════════════════
-- BLOCO 4 — SRS e flashcards
-- ══════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS srs_progress (
  id               UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id          TEXT NOT NULL,
  card_id          TEXT NOT NULL,
  rating           TEXT,
  interval_days    NUMERIC NOT NULL DEFAULT 1,
  ease             NUMERIC NOT NULL DEFAULT 2.5,
  reps             INTEGER NOT NULL DEFAULT 0,
  due_at           TIMESTAMPTZ NOT NULL DEFAULT now(),
  last_reviewed_at TIMESTAMPTZ,
  created_at       TIMESTAMPTZ DEFAULT now(),
  updated_at       TIMESTAMPTZ DEFAULT now(),
  UNIQUE (user_id, card_id)
);

CREATE TABLE IF NOT EXISTS flashcard_media (
  id           UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id      TEXT NOT NULL,
  card_id      TEXT NOT NULL,
  term         TEXT NOT NULL,
  image_url    TEXT,
  photographer TEXT,
  pexels_url   TEXT,
  created_at   TIMESTAMPTZ DEFAULT now(),
  UNIQUE (user_id, card_id)
);

CREATE TABLE IF NOT EXISTS flashcards_v2 (
  id                 UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  slug               TEXT UNIQUE NOT NULL,
  level              TEXT NOT NULL CHECK (level IN ('A1', 'A2', 'B1')),
  theme              TEXT NOT NULL,
  card_type          TEXT NOT NULL DEFAULT 'phrase',
  front_de           TEXT NOT NULL,
  back_pt            TEXT NOT NULL,
  explanation_pt     TEXT NOT NULL,
  grammar_note       TEXT,
  example_de         TEXT,
  example_pt         TEXT,
  tags               JSONB DEFAULT '[]',
  source_style       TEXT DEFAULT 'original_dw_inspired',
  validation_sources TEXT[] DEFAULT '{}',
  curated            BOOLEAN DEFAULT true,
  active             BOOLEAN DEFAULT true,
  created_at         TIMESTAMPTZ DEFAULT now(),
  updated_at         TIMESTAMPTZ DEFAULT now()
);

-- Migração: garante que tags seja JSONB (idempotente)
ALTER TABLE flashcards_v2 ALTER COLUMN tags DROP DEFAULT;
ALTER TABLE flashcards_v2 ALTER COLUMN tags TYPE JSONB USING to_jsonb(tags);
ALTER TABLE flashcards_v2 ALTER COLUMN tags SET DEFAULT '[]'::jsonb;


-- ══════════════════════════════════════════════════
-- BLOCO 5 — Conteúdo de estudo (sem FK cruzada)
-- ══════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS study_modules (
  id             UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  slug           TEXT UNIQUE NOT NULL,
  level          TEXT NOT NULL CHECK (level IN ('A1', 'A2', 'B1')),
  chapter_number INTEGER NOT NULL DEFAULT 0,
  title_pt       TEXT NOT NULL,
  title_de       TEXT,
  focus          TEXT NOT NULL,
  sort_order     INTEGER NOT NULL,
  active         BOOLEAN DEFAULT true,
  created_at     TIMESTAMPTZ DEFAULT now() NOT NULL,
  updated_at     TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS study_lessons (
  id             UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  module_slug    TEXT NOT NULL REFERENCES study_modules(slug) ON DELETE CASCADE,
  slug           TEXT UNIQUE NOT NULL,
  level          TEXT NOT NULL CHECK (level IN ('A1', 'A2', 'B1')),
  title_pt       TEXT NOT NULL,
  title_de       TEXT,
  summary_pt     TEXT NOT NULL,
  quick_rule_pt  TEXT NOT NULL,
  examples       JSONB NOT NULL DEFAULT '[]',
  key_phrases    JSONB NOT NULL DEFAULT '[]',
  mini_notes     JSONB NOT NULL DEFAULT '[]',
  source_refs    TEXT[] DEFAULT '{}',
  sort_order     INTEGER NOT NULL,
  active         BOOLEAN DEFAULT true,
  created_at     TIMESTAMPTZ DEFAULT now(),
  updated_at     TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS study_exercises (
  id             UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  lesson_slug    TEXT NOT NULL REFERENCES study_lessons(slug) ON DELETE CASCADE,
  slug           TEXT UNIQUE NOT NULL,
  module_slug    TEXT,
  level          TEXT CHECK (level IN ('A1', 'A2', 'B1')),
  exercise_type  TEXT NOT NULL CHECK (exercise_type IN ('fill_blank', 'translate_to_de', 'choose_option', 'free_answer')),
  prompt_pt      TEXT NOT NULL,
  prompt_de      TEXT,
  options        JSONB DEFAULT '[]',
  answer         TEXT NOT NULL,
  explanation_pt TEXT NOT NULL,
  xp_reward      INTEGER DEFAULT 10,
  sort_order     INTEGER NOT NULL,
  active         BOOLEAN DEFAULT true,
  created_at     TIMESTAMPTZ DEFAULT now(),
  updated_at     TIMESTAMPTZ DEFAULT now()
);


-- ══════════════════════════════════════════════════
-- BLOCO 6 — Desafios e notas
-- ══════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS deutsch_challenges (
  id               UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  slug             TEXT UNIQUE NOT NULL,
  level            TEXT NOT NULL CHECK (level IN ('A1', 'A2', 'B1')),
  theme            TEXT NOT NULL,
  title_pt         TEXT NOT NULL,
  scenario_pt      TEXT NOT NULL,
  character_key    TEXT CHECK (character_key IN ('hans', 'lukas', 'heidi', 'petra')),
  user_goal_pt     TEXT NOT NULL,
  opening_line_de  TEXT NOT NULL,
  support_phrases  JSONB DEFAULT '[]',
  success_criteria JSONB DEFAULT '[]',
  xp_reward        INTEGER DEFAULT 100,
  active           BOOLEAN DEFAULT true,
  created_at       TIMESTAMPTZ DEFAULT now(),
  updated_at       TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS notes (
  id         UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id    TEXT NOT NULL,
  bucket     TEXT NOT NULL,
  content    TEXT NOT NULL DEFAULT '',
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE (user_id, bucket)
);


-- ══════════════════════════════════════════════════
-- BLOCO 7 — Triggers de updated_at
-- ══════════════════════════════════════════════════
-- Aplica a função set_updated_at() (criada em 01_setup.sql)
-- em todas as tabelas que têm essa coluna.

DO $$
DECLARE
  tbl TEXT;
BEGIN
  FOREACH tbl IN ARRAY ARRAY[
    'profiles', 'user_progress', 'user_api_keys',
    'srs_progress', 'flashcards_v2',
    'study_modules', 'study_lessons', 'study_exercises',
    'deutsch_challenges', 'notes'
  ]
  LOOP
    EXECUTE format(
      'DROP TRIGGER IF EXISTS trg_set_updated_at ON public.%I;
       CREATE TRIGGER trg_set_updated_at
         BEFORE UPDATE ON public.%I
         FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();',
      tbl, tbl
    );
  END LOOP;
END $$;
