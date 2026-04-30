-- =====================================================
-- DEUTSCH HUB - Phase 2 Supabase additions
-- Run after the original supabase_setup.sql.
-- Keeps existing tables and adds persistence for v2 features.
-- =====================================================

create table if not exists profiles (
  user_id text primary key,
  display_name text default 'Rebeca',
  current_level text not null default 'A1',
  total_xp integer not null default 0,
  streak integer not null default 0,
  last_study_date date,
  voice_premium boolean not null default false,
  active_character text not null default 'hans',
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Seed removido. O profile é criado automaticamente pelo frontend no primeiro login.

create table if not exists chat_history (
  id uuid default gen_random_uuid() primary key,
  user_id text not null,
  character text not null,
  role text not null check (role in ('user', 'assistant', 'system')),
  content text not null,
  grammar_feedback jsonb,
  xp_awarded integer default 0,
  created_at timestamptz default now()
);

create index if not exists chat_history_user_character_created_idx
  on chat_history (user_id, character, created_at desc);

create table if not exists srs_progress (
  id uuid default gen_random_uuid() primary key,
  user_id text not null,
  card_id text not null,
  rating text,
  interval_days numeric not null default 1,
  ease numeric not null default 2.5,
  reps integer not null default 0,
  due_at timestamptz not null default now(),
  last_reviewed_at timestamptz,
  created_at timestamptz default now(),
  updated_at timestamptz default now(),
  unique (user_id, card_id)
);

create table if not exists achievements (
  id uuid default gen_random_uuid() primary key,
  user_id text not null,
  code text not null,
  title text not null,
  description text,
  xp_reward integer default 0,
  unlocked_at timestamptz default now(),
  unique (user_id, code)
);

create table if not exists notes (
  id uuid default gen_random_uuid() primary key,
  user_id text not null,
  bucket text not null,
  content text not null default '',
  created_at timestamptz default now(),
  updated_at timestamptz default now(),
  unique (user_id, bucket)
);

create table if not exists flashcard_media (
  id uuid default gen_random_uuid() primary key,
  user_id text not null,
  card_id text not null,
  term text not null,
  image_url text,
  photographer text,
  pexels_url text,
  created_at timestamptz default now(),
  unique (user_id, card_id)
);

alter table profiles enable row level security;
alter table chat_history enable row level security;
alter table srs_progress enable row level security;
alter table achievements enable row level security;
alter table notes enable row level security;
alter table flashcard_media enable row level security;

do $$
begin
  if not exists (select 1 from pg_policies where schemaname = 'public' and tablename = 'profiles' and policyname = 'allow all') then
    create policy "allow all" on profiles for all using (true) with check (true);
  end if;
  if not exists (select 1 from pg_policies where schemaname = 'public' and tablename = 'chat_history' and policyname = 'allow all') then
    create policy "allow all" on chat_history for all using (true) with check (true);
  end if;
  if not exists (select 1 from pg_policies where schemaname = 'public' and tablename = 'srs_progress' and policyname = 'allow all') then
    create policy "allow all" on srs_progress for all using (true) with check (true);
  end if;
  if not exists (select 1 from pg_policies where schemaname = 'public' and tablename = 'achievements' and policyname = 'allow all') then
    create policy "allow all" on achievements for all using (true) with check (true);
  end if;
  if not exists (select 1 from pg_policies where schemaname = 'public' and tablename = 'notes' and policyname = 'allow all') then
    create policy "allow all" on notes for all using (true) with check (true);
  end if;
  if not exists (select 1 from pg_policies where schemaname = 'public' and tablename = 'flashcard_media' and policyname = 'allow all') then
    create policy "allow all" on flashcard_media for all using (true) with check (true);
  end if;
end $$;
