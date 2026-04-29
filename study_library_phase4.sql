-- =====================================================
-- DEUTSCH HUB - Phase 4 Study Library
-- Curated short lessons extracted/adapted from the study files.
-- Run after previous SQL files.
-- =====================================================

create table if not exists study_modules (
  id uuid default gen_random_uuid() primary key,
  slug text unique not null,
  level text not null check (level in ('A1', 'A2', 'B1')),
  chapter_number integer not null,
  title_pt text not null,
  title_de text,
  focus text not null,
  sort_order integer not null,
  active boolean default true,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists study_lessons (
  id uuid default gen_random_uuid() primary key,
  module_slug text not null references study_modules(slug) on delete cascade,
  slug text unique not null,
  level text not null check (level in ('A1', 'A2', 'B1')),
  title_pt text not null,
  summary_pt text not null,
  quick_rule_pt text not null,
  examples jsonb not null default '[]',
  key_phrases jsonb not null default '[]',
  mini_notes jsonb not null default '[]',
  source_refs text[] default '{}',
  sort_order integer not null,
  active boolean default true,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists study_exercises (
  id uuid default gen_random_uuid() primary key,
  lesson_slug text not null references study_lessons(slug) on delete cascade,
  slug text unique not null,
  exercise_type text not null check (exercise_type in ('fill_blank', 'translate_to_de', 'choose_option', 'free_answer')),
  prompt_pt text not null,
  prompt_de text,
  options jsonb default '[]',
  answer text not null,
  explanation_pt text not null,
  xp_reward integer default 10,
  sort_order integer not null,
  active boolean default true,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

alter table study_modules enable row level security;
alter table study_lessons enable row level security;
alter table study_exercises enable row level security;

do $$
begin
  if not exists (select 1 from pg_policies where schemaname = 'public' and tablename = 'study_modules' and policyname = 'allow all') then
    create policy "allow all" on study_modules for all using (true) with check (true);
  end if;
  if not exists (select 1 from pg_policies where schemaname = 'public' and tablename = 'study_lessons' and policyname = 'allow all') then
    create policy "allow all" on study_lessons for all using (true) with check (true);
  end if;
  if not exists (select 1 from pg_policies where schemaname = 'public' and tablename = 'study_exercises' and policyname = 'allow all') then
    create policy "allow all" on study_exercises for all using (true) with check (true);
  end if;
end $$;

insert into study_modules
(slug, level, chapter_number, title_pt, title_de, focus, sort_order)
values
('a1-cap-01-cumprimentos', 'A1', 1, 'Cumprimentos e apresentações', 'Begrüßungen und Vorstellungen', 'Começar conversas simples, dizer quem você é e entender formal/informal.', 101),
('a2-cap-13-casos', 'A2', 13, 'Acusativo e dativo sem drama', 'Akkusativ und Dativ', 'Entender quem recebe a ação e para quem algo acontece.', 213),
('b1-cap-23-conectivos', 'B1', 23, 'Conectivos para falar melhor', 'Konnektoren: weil, dass, ob, wenn', 'Ligar ideias, justificar opinião e construir respostas de nível B1.', 323)
on conflict (slug) do update set
  title_pt = excluded.title_pt,
  title_de = excluded.title_de,
  focus = excluded.focus,
  active = true,
  updated_at = now();

insert into study_lessons
(module_slug, slug, level, title_pt, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, source_refs, sort_order)
values
(
  'a1-cap-01-cumprimentos',
  'a1-l01-cumprimentos-apresentacao',
  'A1',
  'Como iniciar uma conversa simples',
  'Você precisa conseguir cumprimentar, dizer seu nome, sua origem e perguntar como a pessoa está. O segredo do A1 é falar pouco, mas falar certo.',
  'A1 usa blocos prontos. Memorize a frase inteira primeiro; depois troque nome, cidade e profissão.',
  '[
    {"de":"Hallo! Ich heiße Rebeca.","pt":"Oi! Eu me chamo Rebeca.","note":"Ich heiße = meu nome é / eu me chamo."},
    {"de":"Ich komme aus Brasilien.","pt":"Eu sou do Brasil.","note":"Alemão diz literalmente: venho do Brasil."},
    {"de":"Wie geht es dir?","pt":"Como você está?","note":"Use dir com pessoas próximas."},
    {"de":"Wie geht es Ihnen?","pt":"Como o senhor/a senhora está?","note":"Use Ihnen em situação formal."}
  ]'::jsonb,
  '[
    {"de":"Guten Morgen!","pt":"Bom dia!"},
    {"de":"Guten Tag!","pt":"Boa tarde/olá formal!"},
    {"de":"Tschüss!","pt":"Tchau!"},
    {"de":"Bis bald!","pt":"Até breve!"}
  ]'::jsonb,
  '[
    "du = informal; Sie = formal.",
    "Em alemão, o verbo aparece cedo: Ich heiße, Ich komme, Ich wohne.",
    "Não traduza tudo palavra por palavra. Use frases prontas."
  ]'::jsonb,
  array['Alemao_A1_ao_B1_Bruna.docx','Meu Alemão do Zero ao B1.pdf'],
  1
),
(
  'a2-cap-13-casos',
  'a2-l13-acusativo-dativo',
  'A2',
  'Acusativo e dativo do jeito útil',
  'Pense assim: acusativo é o alvo direto da ação. Dativo é para quem ou onde algo fica/acontece em muitas estruturas comuns.',
  'Pergunte: “o quê/quem?” para acusativo. Pergunte: “para quem?” para dativo. Depois observe o artigo.',
  '[
    {"de":"Ich kaufe einen Kaffee.","pt":"Eu compro um café.","note":"Café é o alvo comprado: acusativo. der Kaffee -> einen Kaffee."},
    {"de":"Ich helfe meiner Mutter.","pt":"Eu ajudo minha mãe.","note":"helfen pede dativo: meine Mutter -> meiner Mutter."},
    {"de":"Ich gebe dem Kind ein Buch.","pt":"Eu dou um livro à criança.","note":"dem Kind = para quem; ein Buch = o quê."},
    {"de":"Ich bin in der Schule.","pt":"Estou na escola.","note":"Localização parada costuma usar dativo."}
  ]'::jsonb,
  '[
    {"de":"Ich brauche einen Termin.","pt":"Preciso de um horário."},
    {"de":"Ich spreche mit der Lehrerin.","pt":"Eu falo com a professora."},
    {"de":"Das gehört meinem Sohn.","pt":"Isso pertence ao meu filho."}
  ]'::jsonb,
  '[
    "Acusativo muda der -> den/einen.",
    "Dativo muda der/das -> dem/einem e die -> der/einer.",
    "Mit quase sempre puxa dativo: mit der Karte, mit dem Zug."
  ]'::jsonb,
  array['Meu Alemão do Zero ao B1.pdf','alemao-b1-revisado-150p.pdf'],
  1
),
(
  'b1-cap-23-conectivos',
  'b1-l23-weil-dass-ob-wenn',
  'B1',
  'Weil, dass, ob, wenn para respostas B1',
  'No B1 você precisa ligar ideias. Essas palavras deixam sua fala mais madura: você explica motivo, opinião, dúvida e condição.',
  'Com weil/dass/ob/wenn, o verbo conjugado vai para o final da oração subordinada.',
  '[
    {"de":"Ich lerne Deutsch, weil ich in Deutschland arbeiten möchte.","pt":"Eu estudo alemão porque quero trabalhar na Alemanha.","note":"weil explica motivo; möchte vai ao final."},
    {"de":"Ich denke, dass Deutsch wichtig ist.","pt":"Eu acho que alemão é importante.","note":"dass introduz opinião/ideia; ist vai ao final."},
    {"de":"Ich weiß nicht, ob der Termin heute ist.","pt":"Eu não sei se o compromisso é hoje.","note":"ob = se, quando é dúvida indireta."},
    {"de":"Wenn ich Zeit habe, lerne ich Deutsch.","pt":"Quando/se eu tenho tempo, estudo alemão.","note":"wenn pode ser quando ou se; habe vai ao final da primeira parte."}
  ]'::jsonb,
  '[
    {"de":"Ich glaube, dass...","pt":"Eu acredito que..."},
    {"de":"Das ist wichtig, weil...","pt":"Isso é importante porque..."},
    {"de":"Ich bin nicht sicher, ob...","pt":"Não tenho certeza se..."},
    {"de":"Wenn möglich,...","pt":"Se possível,..."}
  ]'::jsonb,
  '[
    "Regra: conector subordinado joga o verbo para o fim.",
    "Para Goethe B1, use weil e dass para justificar opiniões.",
    "Evite frases soltas demais: conecte ideia + motivo."
  ]'::jsonb,
  array['Meu Alemão do Zero ao B1.pdf','alemao-b1-revisado-150p.pdf','Alemao_A1_ao_B1_Bruna.docx'],
  1
)
on conflict (slug) do update set
  title_pt = excluded.title_pt,
  summary_pt = excluded.summary_pt,
  quick_rule_pt = excluded.quick_rule_pt,
  examples = excluded.examples,
  key_phrases = excluded.key_phrases,
  mini_notes = excluded.mini_notes,
  source_refs = excluded.source_refs,
  active = true,
  updated_at = now();

insert into study_exercises
(lesson_slug, slug, exercise_type, prompt_pt, prompt_de, options, answer, explanation_pt, xp_reward, sort_order)
values
('a1-l01-cumprimentos-apresentacao','a1-l01-ex01','translate_to_de','Traduza: Oi! Eu me chamo Rebeca.',null,'[]'::jsonb,'Hallo! Ich heiße Rebeca.','Use Ich heiße para dizer seu nome.',10,1),
('a1-l01-cumprimentos-apresentacao','a1-l01-ex02','choose_option','Qual frase é formal?',null,'["Wie geht es dir?","Wie geht es Ihnen?","Wie heißt du?"]'::jsonb,'Wie geht es Ihnen?','Ihnen/Sie é a forma formal.',10,2),
('a1-l01-cumprimentos-apresentacao','a1-l01-ex03','fill_blank','Complete: Ich komme ___ Brasilien.',null,'[]'::jsonb,'aus','Origem usa aus: Ich komme aus Brasilien.',10,3),
('a2-l13-acusativo-dativo','a2-l13-ex01','fill_blank','Complete: Ich kaufe ___ Kaffee.',null,'[]'::jsonb,'einen','der Kaffee vira einen Kaffee no acusativo.',12,1),
('a2-l13-acusativo-dativo','a2-l13-ex02','choose_option','Qual opção usa dativo corretamente com mit?',null,'["mit die Karte","mit der Karte","mit den Karte"]'::jsonb,'mit der Karte','Mit pede dativo: die Karte -> der Karte.',12,2),
('a2-l13-acusativo-dativo','a2-l13-ex03','translate_to_de','Traduza: Eu ajudo minha mãe.',null,'[]'::jsonb,'Ich helfe meiner Mutter.','helfen pede dativo: meine Mutter -> meiner Mutter.',12,3),
('b1-l23-weil-dass-ob-wenn','b1-l23-ex01','fill_blank','Complete: Ich lerne Deutsch, weil ich in Deutschland arbeiten ___.',null,'[]'::jsonb,'möchte','Com weil, o verbo conjugado vai ao final.',15,1),
('b1-l23-weil-dass-ob-wenn','b1-l23-ex02','choose_option','Qual frase tem ordem B1 correta?',null,'["Ich denke, dass Deutsch ist wichtig.","Ich denke, dass Deutsch wichtig ist.","Ich denke, Deutsch dass wichtig ist."]'::jsonb,'Ich denke, dass Deutsch wichtig ist.','Depois de dass, o verbo conjugado vai ao fim.',15,2),
('b1-l23-weil-dass-ob-wenn','b1-l23-ex03','free_answer','Escreva uma frase com weil explicando por que você aprende alemão.','Schreiben Sie einen Satz mit weil.','[]'::jsonb,'weil','Resposta livre: precisa usar weil e verbo no final.',15,3)
on conflict (slug) do update set
  prompt_pt = excluded.prompt_pt,
  prompt_de = excluded.prompt_de,
  options = excluded.options,
  answer = excluded.answer,
  explanation_pt = excluded.explanation_pt,
  xp_reward = excluded.xp_reward,
  active = true,
  updated_at = now();
