-- =====================================================
-- DEUTSCH HUB — 03_data.sql
-- Dados iniciais (seed) de todas as tabelas.
-- Execute após 02_tables.sql.
-- Ordem: study_modules → study_lessons → study_exercises
--        → flashcards_v2 → deutsch_challenges
-- =====================================================


-- ══════════════════════════════════════════════════
-- BLOCO 1 — study_modules
-- Fonte: study_library_phase4.sql + a1_study_library.sql
--         + study_modules_rows.sql
-- ══════════════════════════════════════════════════

INSERT INTO study_modules (slug, level, chapter_number, title_pt, title_de, focus, sort_order, active)
VALUES
  -- A1 — biblioteca completa (a1_study_library)
  ('a1-cap1-cumprimentos',   'A1', 1,  'Cumprimentos e Apresentações',        'Begrüßungen und Vorstellungen',          'Saudações formais e informais, apresentar-se, du vs. Sie',                       10,  true),
  ('a1-cap2-apresentacoes',  'A1', 2,  'Apresentando-se',                     'Sich vorstellen',                        'Dizer nome, origem, onde mora e profissão',                                      20,  true),
  ('a1-cap3-verbos-basicos', 'A1', 3,  'Verbos essenciais',                   'Wichtige Verben',                        'kommen, wohnen, arbeiten, lernen, helfen',                                       30,  true),
  ('a1-cap4-numeros-horas',  'A1', 4,  'Números e horas',                     'Zahlen und Uhrzeit',                     'Contar até 100, dizer as horas, preços',                                         40,  true),
  ('a1-cap5-artigos',        'A1', 5,  'Artigos definidos e indefinidos',     'Bestimmte und unbestimmte Artikel',      'der, die, das, ein, eine + regras básicas',                                      50,  true),
  ('a1-cap6-plural',         'A1', 6,  'Plural básico',                       'Plural im Deutschen',                    'Regras simples de plural: -e, -er, -en',                                         60,  true),
  ('a1-cap7-perguntas',      'A1', 7,  'Perguntas com W',                     'Fragen mit W-Wörtern',                   'Was, Wer, Wo, Wie, Wann, Warum',                                                 70,  true),
  ('a1-cap8-negacao',        'A1', 8,  'Negativa básica',                     'Verneinung mit nicht und kein',          'Como negar frases corretamente',                                                  80,  true),
  ('a1-cap9-preposicoes',    'A1', 9,  'Preposições essenciais',              'Wichtige Präpositionen',                 'in, an, mit, für, nach, von, zu',                                                90,  true),
  ('a1-cap10-compras',       'A1', 10, 'Compras e pedidos',                   'Einkaufen und Bestellungen',             'Pedir comida, perguntar preços, pagar',                                          100, true)
ON CONFLICT (slug) DO UPDATE SET
  title_pt       = EXCLUDED.title_pt,
  title_de       = EXCLUDED.title_de,
  focus          = EXCLUDED.focus,
  chapter_number = EXCLUDED.chapter_number,
  sort_order     = EXCLUDED.sort_order,
  active         = true,
  updated_at     = now();


-- ══════════════════════════════════════════════════
-- BLOCO 2 — study_lessons
-- Fonte: study_library_phase4.sql + a1_study_library.sql
-- ══════════════════════════════════════════════════

-- ── Biblioteca A1 completa (caps 1–10) ───────────
INSERT INTO study_lessons
  (slug, module_slug, level, sort_order, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, active)
VALUES
(
  'a1-cap1-l1-saudacoes', 'a1-cap1-cumprimentos', 'A1', 1,
  'Saudações: formal vs informal', 'Begrüßungen: formell vs. informell',
  'Em alemão, a formalidade muda completamente o cumprimento.',
  'Formal = completo (Guten Tag!). Informal = curto (Tag!).',
  '[{"de":"Guten Morgen!","pt":"Bom dia!","note":"Formal — manhã"},{"de":"Morgen!","pt":"Bom dia! (curto)","note":"Informal"},{"de":"Guten Tag!","pt":"Boa tarde / Olá!","note":"Formal"},{"de":"Hallo!","pt":"Oi!","note":"Informal"},{"de":"Tschüss!","pt":"Tchau!","note":"Informal"},{"de":"Auf Wiedersehen!","pt":"Até logo!","note":"Formal"}]'::jsonb,
  '[{"de":"Guten Morgen!","pt":"Bom dia!"},{"de":"Hallo!","pt":"Oi!"},{"de":"Tschüss!","pt":"Tchau!"}]'::jsonb,
  '[{"pt":"Formal usa Sie, informal usa du"},{"pt":"Guten + time of day = formal"},{"pt":"Hallo funciona a qualquer hora"}]'::jsonb,
  true
),
(
  'a1-cap2-l1-apresentacao-basica', 'a1-cap2-apresentacoes', 'A1', 1,
  'Como dizer seu nome e origem', 'Name und Herkunft sagen',
  'Aprenda a se apresentar completamente em alemão.',
  'Use Ich heiße + nome, Ich komme aus + cidade.',
  '[{"de":"Ich heiße Rebeca.","pt":"Eu me chamo Rebeca.","note":"heißen = chamar-se"},{"de":"Ich komme aus Brasilien.","pt":"Sou do Brasil.","note":"komme aus = venho de"},{"de":"Ich wohne in Salvador.","pt":"Moro em Salvador.","note":"wohnen in + cidade"}]'::jsonb,
  '[{"de":"Ich heiße ...","pt":"Eu me chamo ..."},{"de":"Ich komme aus ...","pt":"Sou de ..."},{"de":"Ich wohne in ...","pt":"Moro em ..."}]'::jsonb,
  '[{"pt":"heißen é verbo especial"},{"pt":"aus indica origem"},{"pt":"in indica cidade"}]'::jsonb,
  true
),
(
  'a1-cap3-l1-verbos-presente', 'a1-cap3-verbos-basicos', 'A1', 1,
  'Verbos no presente', 'Verben im Präsens',
  'Aprenda os verbos mais usados no dia a dia.',
  'Verbo conjugado vai à posição 2 na frase.',
  '[{"de":"Ich lerne Deutsch.","pt":"Eu estudo alemão.","note":"lernen = estudar"},{"de":"Ich arbeite als Dev.","pt":"Trabalho como Dev.","note":"als = como profissão"},{"de":"Ich helfe dir.","pt":"Eu te ajudo.","note":"helfen pede dativo"}]'::jsonb,
  '[{"de":"Ich lerne ...","pt":"Eu estudo ..."},{"de":"Ich arbeite ...","pt":"Eu trabalho ..."},{"de":"Ich helfe ...","pt":"Eu ajudo ..."}]'::jsonb,
  '[{"pt":"Verbo na posição 2"},{"pt":"helfen usa dativo"},{"pt":"arbeiten + als = profissão"}]'::jsonb,
  true
),
(
  'a1-cap4-l1-horas', 'a1-cap4-numeros-horas', 'A1', 1,
  'Como dizer as horas', 'Uhrzeit sagen',
  'Aprenda a perguntar e dizer horas em alemão.',
  'Use "Wie spät ist es?" para perguntar horas.',
  '[{"de":"Wie spät ist es?","pt":"Que horas são?","note":"Pergunta fixa"},{"de":"Es ist acht Uhr.","pt":"São oito horas.","note":"Es ist + número + Uhr"},{"de":"Um zehn Uhr.","pt":"Às dez horas.","note":"um = às"}]'::jsonb,
  '[{"de":"Wie spät ist es?","pt":"Que horas são?"},{"de":"Es ist ... Uhr.","pt":"São ... horas."},{"de":"Um ... Uhr.","pt":"Às ... horas."}]'::jsonb,
  '[{"pt":"Wie spät = que horas"},{"pt":"Uhr = horas/relogio"},{"pt":"um = à/as (tempo)"}]'::jsonb,
  true
),
(
  'a1-cap5-l1-artigos-definidos', 'a1-cap5-artigos', 'A1', 1,
  'Os artigos definidos: der, die, das', 'Bestimmte Artikel',
  'Aprenda a usar der, die, das corretamente.',
  'der = masculino, die = feminino, das = neutro.',
  '[{"de":"der Mann","pt":"o homem","note":"masculino"},{"de":"die Frau","pt":"a mulher","note":"feminino"},{"de":"das Kind","pt":"a criança","note":"neutro"}]'::jsonb,
  '[{"de":"der ...","pt":"o (masc)"},{"de":"die ...","pt":"a (fem)"},{"de":"das ...","pt":"o/a (neutro)"}]'::jsonb,
  '[{"pt":"der = masculino"},{"pt":"die = feminino"},{"pt":"das = neutro/criança"}]'::jsonb,
  true
),
(
  'a1-cap6-l1-plural-regras', 'a1-cap6-plural', 'A1', 1,
  'Fazendo substantivos no plural', 'Substantive im Plural',
  'Aprenda as regras básicas de plural em alemão.',
  'A maioria ganha -e ou -er no plural.',
  '[{"de":"der Mann → die Männer","pt":"o homem → os homens","note":"umlaut + er"},{"de":"die Frau → die Frauen","pt":"a mulher → as mulheres","note":"termina em -en"},{"de":"das Kind → die Kinder","pt":"a criança → as crianças","note":"umlaut + er"}]'::jsonb,
  '[{"de":"die ...","pt":"os/as (plural)"},{"de":"die Männer","pt":"os homens"},{"de":"die Frauen","pt":"as mulheres"}]'::jsonb,
  '[{"pt":"Muitos plural usam umlaut"},{"pt":"-er para palavras curtas"},{"pt":"-en para palavras longas"}]'::jsonb,
  true
),
(
  'a1-cap7-l1-w-fragen', 'a1-cap7-perguntas', 'A1', 1,
  'Perguntas essenciais', 'Wichtige Fragen',
  'Aprenda a fazer perguntas com Was, Wer, Wo, Wie.',
  'Verbo vem logo após a palavra W.',
  '[{"de":"Was ist das?","pt":"O que é isso?","note":"Was = o que"},{"de":"Wo ist die U-Bahn?","pt":"Onde fica o metrô?","note":"Wo = onde"},{"de":"Wie geht es dir?","pt":"Como você está?","note":"Wie = como"}]'::jsonb,
  '[{"de":"Was ...?","pt":"O que ...?"},{"de":"Wo ...?","pt":"Onde ...?"},{"de":"Wie ...?","pt":"Como ...?"}]'::jsonb,
  '[{"pt":"W-Wort na posição 1"},{"pt":"Verbo na posição 2"},{"pt":"Was para coisas, Wer para pessoas"}]'::jsonb,
  true
),
(
  'a1-cap8-l1-nicht-kein', 'a1-cap8-negacao', 'A1', 1,
  'Usando nicht e kein', 'nicht und kein benutzen',
  'Aprenda quando usar nicht (não) e kein (não/nenhum).',
  'kein nega substantivos, nicht nega verbos/adjetivos.',
  '[{"de":"Ich habe kein Auto.","pt":"Não tenho carro.","note":"kein = nenhum"},{"de":"Ich verstehe das nicht.","pt":"Não entendo isso.","note":"nicht no final"},{"de":"Das ist nicht cool.","pt":"Isso não é legal.","note":"nicht após adjetivo"}]'::jsonb,
  '[{"de":"kein ...","pt":"nenhum/não tem"},{"de":"nicht","pt":"não"},{"de":"Ich habe kein ...","pt":"Não tenho ..."}]'::jsonb,
  '[{"pt":"kein = sem/nenhum"},{"pt":"nicht geralmente no final"},{"pt":"kein é artigo negativo"}]'::jsonb,
  true
),
(
  'a1-cap9-l1-preposicoes-basicas', 'a1-cap9-preposicoes', 'A1', 1,
  'Preposições mais usadas', 'Grundlegende Präpositionen',
  'Aprenda as preposições básicas e seus casos.',
  'in + dativo (lugar) ou acusativo (movimento).',
  '[{"de":"Ich bin in der Schule.","pt":"Estou na escola.","note":"in + dativo = lugar"},{"de":"Ich gehe in die Schule.","pt":"Vou à escola.","note":"in + acusativo = movimento"},{"de":"Ich fahre mit dem Bus.","pt":"Vou de ônibus.","note":"mit sempre dativo"}]'::jsonb,
  '[{"de":"in ...","pt":"em ..."},{"de":"mit ...","pt":"com/de ..."},{"de":"für ...","pt":"para ..."}]'::jsonb,
  '[{"pt":"in pode ser dativo ou acusativo"},{"pt":"mit sempre pede dativo"},{"pt":"für pede acusativo"}]'::jsonb,
  true
),
(
  'a1-cap10-l1-pedidos-loja', 'a1-cap10-compras', 'A1', 1,
  'Como pedir em lojas', 'Im Laden bestellen',
  'Aprenda a pedir itens, perguntar preços e pagar.',
  'Use "Ich möchte..." ou "Ich nehme..." para pedir.',
  '[{"de":"Ich möchte einen Kaffee.","pt":"Queria um café.","note":"möchte = gostaria"},{"de":"Was kostet das?","pt":"Quanto custa?","note":"Was kostet = quanto custa"},{"de":"Kann ich mit Karte zahlen?","pt":"Posso pagar com cartão?","note":"mit Karte = com cartão"}]'::jsonb,
  '[{"de":"Ich möchte ...","pt":"Queria ..."},{"de":"Was kostet ...?","pt":"Quanto custa ...?"},{"de":"Ich nehme ...","pt":"Vou levar ..."}]'::jsonb,
  '[{"pt":"möchte é educado"},{"pt":"nehmen = levar/pegar"},{"pt":"Karte = cartão"}]'::jsonb,
  true
)
ON CONFLICT (slug) DO UPDATE SET
  module_slug   = EXCLUDED.module_slug,
  level         = EXCLUDED.level,
  sort_order    = EXCLUDED.sort_order,
  title_pt      = EXCLUDED.title_pt,
  title_de      = EXCLUDED.title_de,
  summary_pt    = EXCLUDED.summary_pt,
  quick_rule_pt = EXCLUDED.quick_rule_pt,
  examples      = EXCLUDED.examples,
  key_phrases   = EXCLUDED.key_phrases,
  mini_notes    = EXCLUDED.mini_notes,
  active        = EXCLUDED.active,
  updated_at    = now();


-- ══════════════════════════════════════════════════
-- BLOCO 3 — study_exercises
-- Fonte: study_library_phase4.sql + a1_study_library.sql
-- ══════════════════════════════════════════════════

INSERT INTO study_exercises
  (lesson_slug, slug, module_slug, level, exercise_type, prompt_pt, prompt_de, options, answer, explanation_pt, xp_reward, sort_order, active)
VALUES
  -- Biblioteca A1 (caps 1–10)
  ('a1-cap1-l1-saudacoes',             'a1-cap1-ex1', 'a1-cap1-cumprimentos',   'A1', 'choose_option',   'Qual é a forma formal de cumprimentar?',                         null, '["Hallo!","Guten Tag!","Morgen!"]'::jsonb,                                           'Guten Tag!',                        'Guten Tag! é a forma formal para qualquer hora do dia.',         10, 1, true),
  ('a1-cap2-l1-apresentacao-basica',   'a1-cap2-ex1', 'a1-cap2-apresentacoes',  'A1', 'translate_to_de', 'Traduza: Eu me chamo Rebeca.',                                   null, '[]'::jsonb,                                                                          'Ich heiße Rebeca.',                 'Use Ich heiße para nome.',                                        10, 1, true),
  ('a1-cap3-l1-verbos-presente',       'a1-cap3-ex1', 'a1-cap3-verbos-basicos', 'A1', 'fill_blank',      'Complete: Ich ___ Deutsch.',                                     null, '[]'::jsonb,                                                                          'lerne',                             'Verbo lernen conjugado.',                                         10, 1, true),
  ('a1-cap4-l1-horas',                 'a1-cap4-ex1', 'a1-cap4-numeros-horas',  'A1', 'fill_blank',      'Complete: ___ spät ist es?',                                     null, '[]'::jsonb,                                                                          'Wie',                               'Wie spät = que horas.',                                           10, 1, true),
  ('a1-cap5-l1-artigos-definidos',     'a1-cap5-ex1', 'a1-cap5-artigos',        'A1', 'choose_option',   'Qual é o artigo de Mann?',                                       null, '["der","die","das"]'::jsonb,                                                         'der',                               'Mann é masculino.',                                               10, 1, true),
  ('a1-cap6-l1-plural-regras',         'a1-cap6-ex1', 'a1-cap6-plural',         'A1', 'fill_blank',      'Complete: der Mann → die ___',                                   null, '[]'::jsonb,                                                                          'Männer',                            'Plural com umlaut + er.',                                         10, 1, true),
  ('a1-cap7-l1-w-fragen',              'a1-cap7-ex1', 'a1-cap7-perguntas',      'A1', 'choose_option',   'Como perguntar "Onde fica o metrô?"',                            null, '["Was ist die U-Bahn?","Wo ist die U-Bahn?","Wie ist die U-Bahn?"]'::jsonb,          'Wo ist die U-Bahn?',                'Wo = onde.',                                                      10, 1, true),
  ('a1-cap8-l1-nicht-kein',            'a1-cap8-ex1', 'a1-cap8-negacao',        'A1', 'fill_blank',      'Complete: Ich habe ___ Auto.',                                   null, '[]'::jsonb,                                                                          'kein',                              'kein nega substantivo.',                                          10, 1, true),
  ('a1-cap9-l1-preposicoes-basicas',   'a1-cap9-ex1', 'a1-cap9-preposicoes',    'A1', 'choose_option',   'Qual está correto?',                                             null, '["Ich bin in der Schule.","Ich bin an der Schule.","Ich bin auf der Schule."]'::jsonb,'Ich bin in der Schule.',            'in + dativo para lugar.',                                         10, 1, true),
  ('a1-cap10-l1-pedidos-loja',         'a1-cap10-ex1','a1-cap10-compras',        'A1', 'translate_to_de', 'Traduza: Queria um café, por favor.',                            null, '[]'::jsonb,                                                                          'Ich möchte einen Kaffee, bitte.',   'Use Ich möchte para pedidos.',                                    10, 1, true)
ON CONFLICT (slug) DO UPDATE SET
  lesson_slug    = EXCLUDED.lesson_slug,
  module_slug    = EXCLUDED.module_slug,
  level          = EXCLUDED.level,
  exercise_type  = EXCLUDED.exercise_type,
  prompt_pt      = EXCLUDED.prompt_pt,
  prompt_de      = EXCLUDED.prompt_de,
  options        = EXCLUDED.options,
  answer         = EXCLUDED.answer,
  explanation_pt = EXCLUDED.explanation_pt,
  xp_reward      = EXCLUDED.xp_reward,
  sort_order     = EXCLUDED.sort_order,
  active         = EXCLUDED.active,
  updated_at     = now();


-- ══════════════════════════════════════════════════
-- BLOCO 4 — flashcards_v2
-- Fonte: learning_content_phase3.sql (38 cards)
--       + a1_flashcards_v2.sql (40 cards)
-- ══════════════════════════════════════════════════

-- ── Phase 3: 38 cards de frases reais ────────────
INSERT INTO flashcards_v2
  (slug, level, theme, card_type, front_de, back_pt, explanation_pt, grammar_note, example_de, example_pt, tags, validation_sources)
VALUES
('a1-cafe-001',        'A1','pedidos',  'phrase','Ich möchte einen Kaffee, bitte.','Eu queria um café, por favor.',       'Em alemão, "ich möchte" soa educado. Em PT-BR fica natural como "eu queria".','mochte_pedido',     'Ich möchte ein Wasser, bitte.',           'Eu queria uma água, por favor.',         '["cafe","pedido","formal"]',         ARRAY['LanguageTool','manual']),
('a1-padaria-002',     'A1','pedidos',  'phrase','Ich nehme zwei Brötchen.',       'Vou levar dois pãezinhos.',            '"Ich nehme" é o jeito simples de escolher algo numa loja. Não traduza como "eu tomo" aqui.','nehmen_compra','Ich nehme das Brot.',                     'Vou levar o pão.',                       '["padaria","compra","comida"]',      ARRAY['LanguageTool','manual']),
('a1-preco-003',       'A1','pedidos',  'phrase','Was kostet das?',                'Quanto custa isso?',                   'Alemão usa "was kostet..." para perguntar preço. Em PT-BR dizemos "quanto custa".','frage_was_kostet','Was kostet der Kaffee?',                  'Quanto custa o café?',                   '["preco","loja","pergunta"]',        ARRAY['LanguageTool','manual']),
('a1-conta-004',       'A1','pedidos',  'phrase','Die Rechnung, bitte.',           'A conta, por favor.',                  'Frase curta e perfeita para restaurante. Em alemão, "Rechnung" é feminino: die Rechnung.','artigo_die','Die Rechnung kommt sofort.',              'A conta vem já.',                        '["restaurante","conta"]',            ARRAY['LanguageTool','Wiktionary','manual']),
('a1-agua-005',        'A1','pedidos',  'phrase','Haben Sie stilles Wasser?',      'Vocês têm água sem gás?',              '"Haben Sie...?" é formal. "Stilles Wasser" é água sem gás.','formal_sie',        'Haben Sie Kaffee?',                       'Vocês têm café?',                        '["restaurante","agua","formal"]',    ARRAY['LanguageTool','manual']),
('a1-metro-006',       'A1','viagem',   'phrase','Wo ist die U-Bahn?',             'Onde fica o metrô?',                   'Para perguntar localização, use "Wo ist...?". Em Berlim, metrô é "die U-Bahn".','wo_ist',    'Wo ist der Bahnhof?',                     'Onde fica a estação de trem?',            '["metro","berlim","direcao"]',       ARRAY['LanguageTool','Wiktionary','manual']),
('a1-bilhete-007',     'A1','viagem',   'phrase','Ein Ticket nach Berlin, bitte.', 'Uma passagem para Berlim, por favor.', 'Em pedidos rápidos, dá para omitir o verbo. É natural no balcão.','pedido_sem_verbo','Ein Wasser, bitte.',                      'Uma água, por favor.',                   '["trem","ticket","viagem"]',         ARRAY['LanguageTool','manual']),
('a1-plataforma-008',  'A1','viagem',   'phrase','Auf welchem Gleis fährt der Zug?','De qual plataforma sai o trem?',     '"Gleis" é plataforma/trilho de trem. A frase é útil em estação.','welchem_dativ','Auf welchem Gleis ist der Zug?',          'Em qual plataforma está o trem?',        '["trem","estacao","pergunta"]',      ARRAY['LanguageTool','manual']),
('a1-ajuda-009',       'A1','survival', 'phrase','Können Sie mir helfen?',         'O senhor/a senhora pode me ajudar?',   '"Können Sie..." é formal e seguro para falar com desconhecidos.','formal_sie_modal','Können Sie das wiederholen?',             'Pode repetir isso?',                     '["ajuda","formal","sobrevivencia"]', ARRAY['LanguageTool','manual']),
('a1-nao-entendo-010', 'A1','survival', 'phrase','Ich verstehe das nicht.',        'Eu não entendo isso.',                 'Em alemão, o "nicht" geralmente vem perto do final da ideia.','negacao_nicht','Ich verstehe Deutsch nicht gut.',         'Eu não entendo alemão muito bem.',        '["sobrevivencia","negacao"]',        ARRAY['LanguageTool','manual']),
('a1-devagar-011',     'A1','survival', 'phrase','Sprechen Sie bitte langsamer.',  'Fale mais devagar, por favor.',        '"Langsamer" = mais devagar. É mais completo que só dizer "langsam".','comparativo',  'Bitte sprechen Sie langsam.',             'Por favor, fale devagar.',                '["fala","sobrevivencia","formal"]',  ARRAY['LanguageTool','manual']),
('a1-repetir-012',     'A1','survival', 'phrase','Können Sie das bitte wiederholen?','Pode repetir isso, por favor?',      'Frase essencial. "Wiederholen" significa repetir.','modal_konnen',          'Bitte wiederholen Sie das.',              'Por favor, repita isso.',                 '["fala","formal","sobrevivencia"]',  ARRAY['LanguageTool','manual']),
('a1-apresentacao-013','A1','dia-a-dia','phrase','Ich heiße Rebeca.',              'Eu me chamo Rebeca.',                  '"Ich heiße" é a forma padrão de dizer seu nome. Em PT-BR também dizemos "meu nome é".','heissen','Ich heiße Ana.',                         'Eu me chamo Ana.',                       '["apresentacao","nome"]',            ARRAY['LanguageTool','manual']),
('a1-origem-014',      'A1','dia-a-dia','phrase','Ich komme aus Brasilien.',       'Eu sou do Brasil.',                    'Alemão diz literalmente "eu venho do Brasil". Em português natural: "sou do Brasil".','kommen_aus','Ich komme aus Bahia.',                   'Eu sou da Bahia.',                       '["origem","apresentacao"]',          ARRAY['LanguageTool','manual']),
('a1-morar-015',       'A1','dia-a-dia','phrase','Ich wohne in Salvador.',         'Eu moro em Salvador.',                 'Use "wohnen" para morar. Para cidade, use "in".','wohnen_in',                'Ich wohne in Berlin.',                    'Eu moro em Berlim.',                     '["moradia","cidade"]',               ARRAY['LanguageTool','manual']),
('a1-trabalho-016',    'A1','trabalho', 'phrase','Ich arbeite als Webentwicklerin.','Eu trabalho como desenvolvedora web.','Als aqui significa como profissão. Para mulher: Webentwicklerin.','als_beruf',  'Ich arbeite als Lehrerin.',               'Eu trabalho como professora.',            '["trabalho","tech","profissao"]',    ARRAY['LanguageTool','manual']),
('a1-estudo-017',      'A1','dia-a-dia','phrase','Ich lerne jeden Tag Deutsch.',   'Eu estudo alemão todos os dias.',      '"Jeden Tag" = todos os dias. O objeto "Deutsch" vem depois do verbo.','tempo_jeden_tag','Ich trinke jeden Tag Kaffee.',           'Eu tomo café todos os dias.',             '["rotina","estudo"]',                ARRAY['LanguageTool','manual']),
('a1-cansada-018',     'A1','dia-a-dia','phrase','Ich bin müde.',                  'Estou cansada.',                       'Em alemão, estados usam muito "ich bin". Em PT-BR omitimos o "eu" com naturalidade.','sein_estado','Ich bin krank.',                       'Estou doente.',                          '["estado","rotina"]',                ARRAY['LanguageTool','manual']),
('a1-horario-019',     'A1','dia-a-dia','phrase','Wie spät ist es?',               'Que horas são?',                       'Pergunta fixa para horário. Não traduza palavra por palavra.','frage_hora',     'Es ist acht Uhr.',                        'São oito horas.',                        '["hora","pergunta"]',                ARRAY['LanguageTool','manual']),
('a1-consulta-020',    'A1','saude',    'phrase','Ich habe einen Termin.',         'Eu tenho um horário marcado.',          '"Termin" é compromisso/consulta. Em PT-BR, "horário marcado" soa natural.','akkusativ_einen','Ich habe heute einen Termin.',          'Tenho um horário marcado hoje.',          '["consulta","burocracia"]',          ARRAY['LanguageTool','manual']),
('a1-doente-021',      'A1','saude',    'phrase','Mir ist schlecht.',              'Estou passando mal.',                   'Alemão diz "para mim está ruim". Em PT-BR natural: "estou passando mal".','mir_ist',   'Mir ist kalt.',                           'Estou com frio.',                        '["saude","emergencia"]',             ARRAY['LanguageTool','manual']),
('a1-farmacia-022',    'A1','saude',    'phrase','Wo ist die Apotheke?',           'Onde fica a farmácia?',                 'Farmácia em alemão é "die Apotheke", não "Farmacie".','artigo_die',           'Die Apotheke ist hier links.',            'A farmácia fica aqui à esquerda.',        '["saude","farmacia","direcao"]',     ARRAY['LanguageTool','Wiktionary','manual']),
('a1-aluguel-023',     'A1','moradia',  'phrase','Ich suche eine Wohnung.',        'Estou procurando um apartamento.',     '"Ich suche" = estou procurando. "Wohnung" é feminino: eine Wohnung.','akkusativ_eine','Ich suche ein Zimmer.',                   'Estou procurando um quarto.',             '["moradia","aluguel"]',              ARRAY['LanguageTool','Wiktionary','manual']),
('a1-endereco-024',    'A1','burocracia','phrase','Meine Adresse ist hier.',       'Meu endereço é este aqui.',             '"Meine Adresse" é feminino. Útil em formulários e atendimento.','possessivo_meine','Meine Telefonnummer ist hier.',          'Meu telefone está aqui.',                 '["endereco","documentos"]',          ARRAY['LanguageTool','manual']),
('a1-documento-025',   'A1','burocracia','phrase','Ich brauche ein Formular.',     'Eu preciso de um formulário.',          '"Ich brauche" é direto e útil. "Ein Formular" = um formulário.','brauchen',   'Ich brauche Hilfe.',                      'Eu preciso de ajuda.',                   '["burocracia","documentos"]',        ARRAY['LanguageTool','manual']),
('a1-email-026',       'A1','trabalho', 'phrase','Ich schreibe eine E-Mail.',      'Estou escrevendo um e-mail.',           'Em alemão simples, presente também pode expressar ação acontecendo agora.','prasens','Ich schreibe eine Nachricht.',            'Estou escrevendo uma mensagem.',          '["trabalho","email"]',               ARRAY['LanguageTool','manual']),
('a1-reuniao-027',     'A1','trabalho', 'phrase','Ich habe um zehn Uhr ein Meeting.','Tenho uma reunião às dez horas.',    'Para hora exata, use "um". "Meeting" é comum no trabalho tech.','zeit_um',        'Ich habe um neun Uhr einen Termin.',      'Tenho um compromisso às nove horas.',     '["trabalho","reuniao","tech"]',      ARRAY['LanguageTool','manual']),
('a1-bug-028',         'A1','trabalho', 'phrase','Der Code funktioniert nicht.',   'O código não funciona.',                '"Funktioniert nicht" é uma forma simples de dizer que algo não funciona.','negacao_nicht','Das Internet funktioniert nicht.',       'A internet não funciona.',                '["tech","bug","trabalho"]',          ARRAY['LanguageTool','manual']),
('a1-duvida-029',      'A1','trabalho', 'phrase','Ich habe eine Frage.',           'Tenho uma pergunta.',                   'Frase educada para interromper ou pedir explicação. "Frage" é feminino.','akkusativ_eine','Ich habe eine Idee.',                    'Tenho uma ideia.',                       '["trabalho","pergunta"]',            ARRAY['LanguageTool','manual']),
('a1-reuniao-online-030','A1','trabalho','phrase','Ich bin im Online-Meeting.',    'Estou na reunião online.',              '"Im" = in dem. Use com lugares/situações como reunião.','in_dem',             'Ich bin im Büro.',                        'Estou no escritório.',                   '["trabalho","online","tech"]',       ARRAY['LanguageTool','manual']),
('a1-mercado-031',     'A1','compras',  'phrase','Ich kaufe Obst und Brot.',       'Eu compro frutas e pão.',               '"Obst" é coletivo para frutas. Não precisa plural no básico.','vocab_obst',   'Ich kaufe Milch und Käse.',               'Eu compro leite e queijo.',               '["mercado","comida"]',               ARRAY['LanguageTool','manual']),
('a1-sacola-032',      'A1','compras',  'phrase','Brauchen Sie eine Tüte?',        'Você precisa de uma sacola?',           'Pergunta comum no caixa. "Tüte" é sacola.','brauchen_frage',                 'Ich brauche keine Tüte.',                 'Não preciso de sacola.',                  '["mercado","caixa"]',                ARRAY['LanguageTool','manual']),
('a1-cartao-033',      'A1','compras',  'phrase','Kann ich mit Karte zahlen?',     'Posso pagar com cartão?',               '"Mit Karte zahlen" = pagar com cartão. Muito útil em loja.','modal_kann',     'Kann ich bar zahlen?',                    'Posso pagar em dinheiro?',                '["pagamento","loja"]',               ARRAY['LanguageTool','manual']),
('a1-localizacao-034', 'A1','viagem',   'phrase','Ich bin hier neu.',              'Sou nova aqui.',                        'Frase natural para explicar que você não conhece o lugar.','adverb_hier',   'Ich bin neu in Berlin.',                  'Sou nova em Berlim.',                    '["viagem","cidade"]',                ARRAY['LanguageTool','manual']),
('a1-atraso-035',      'A1','viagem',   'phrase','Der Zug hat Verspätung.',        'O trem está atrasado.',                 'Alemão diz que o trem "tem atraso". Em PT-BR: "está atrasado".','haben_verspatung','Der Bus hat Verspätung.',                'O ônibus está atrasado.',                 '["trem","atraso"]',                  ARRAY['LanguageTool','manual']),
('a1-familia-036',     'A1','dia-a-dia','phrase','Meine Tochter ist zu Hause.',    'Minha filha está em casa.',             '"Meine" porque "Tochter" é feminino. "Zu Hause" = em casa.','possessivo_meine','Mein Sohn ist zu Hause.',               'Meu filho está em casa.',                 '["familia","casa"]',                 ARRAY['LanguageTool','manual']),
('a1-escola-037',      'A1','familia',  'phrase','Meine Tochter geht zur Schule.', 'Minha filha vai para a escola.',        '"Zur" = zu der. É usado com escola nesse contexto.','zu_der',               'Mein Kind geht zur Schule.',              'Meu filho/minha filha vai para a escola.','["familia","escola"]',               ARRAY['LanguageTool','manual']),
('a1-clima-038',       'A1','dia-a-dia','phrase','Hoje ist es kalt.',              'Hoje está frio.',                       'Para clima, alemão usa "es ist". Em PT-BR não precisamos de sujeito.','es_ist_wetter','Hoje ist es warm.',                     'Hoje está quente.',                      '["clima","rotina"]',                 ARRAY['LanguageTool','manual']),
('a1-convite-039',     'A1','dia-a-dia','phrase','Hast du heute Zeit?',            'Você tem tempo hoje?',                  'Informal com "du". Use com amigos/colegas próximos.','du_frage',             'Haben Sie heute Zeit?',                   'O senhor/a senhora tem tempo hoje?',      '["social","convite"]',               ARRAY['LanguageTool','manual']),
('a1-confirmar-040',   'A1','dia-a-dia','phrase','Ja, das passt gut.',             'Sim, está bom para mim.',               '"Das passt" significa que algo combina/serve/funciona. Em PT-BR: "está bom".','passen','Der Termin passt gut.',                  'O horário está bom.',                    '["social","confirmacao"]',           ARRAY['LanguageTool','manual'])
ON CONFLICT (slug) DO UPDATE SET
  level              = EXCLUDED.level,
  theme              = EXCLUDED.theme,
  card_type          = EXCLUDED.card_type,
  front_de           = EXCLUDED.front_de,
  back_pt            = EXCLUDED.back_pt,
  explanation_pt     = EXCLUDED.explanation_pt,
  grammar_note       = EXCLUDED.grammar_note,
  example_de         = EXCLUDED.example_de,
  example_pt         = EXCLUDED.example_pt,
  tags               = EXCLUDED.tags,
  validation_sources = EXCLUDED.validation_sources,
  curated            = true,
  active             = true,
  updated_at         = now();

-- ── A1 Flashcards v2 curados (40 cards temáticos) ─
INSERT INTO flashcards_v2
  (slug, level, theme, front_de, back_pt, explanation_pt, grammar_note, example_de, example_pt, tags, curated, active)
VALUES
('a1-dia-guten-morgen',    'A1','dia-a-dia','Guten Morgen!',                              'Bom dia!',                           'Cumprimento formal usado pela manhã. Informal: Morgen!','Substantivos em alemão têm maiúscula. Morgen (manhã) → Guten Morgen.','Guten Morgen, Frau Müller!',          'Bom dia, senhora Müller!',               '["cumprimentos","formal","manhã"]',         true, true),
('a1-dia-hallo',           'A1','dia-a-dia','Hallo! Wie geht''s?',                        'Oi! Como vai?',                      'Wie geht''s? = forma curta de "Wie geht es dir?". Resposta: Gut, danke!','Geht''s = geht + es (contraído). Só em contexto informal.','Hallo Lukas! Wie geht''s dir?',       'Oi Lukas! Como você vai?',               '["cumprimentos","informal","conversa"]',    true, true),
('a1-dia-ich-heisse',      'A1','dia-a-dia','Ich heiße... / Mein Name ist...',            'Meu nome é...',                      'Ambas as formas estão corretas. "Ich heiße" é mais casual; "Mein Name ist" é um pouco mais formal.','heißen = chamar-se. ich heiße, du heißt, er/sie heißt.','Ich heiße Rebeca. Und Sie?',          'Meu nome é Rebeca. E o senhor/a senhora?','["apresentação","essencial"]',              true, true),
('a1-dia-freut-mich',      'A1','dia-a-dia','Freut mich! / Freut mich auch!',             'Muito prazer! / Igualmente!',        'Freut mich = me agrada conhecer você. Freut mich auch = me agrada também.','freuen (alegrar) + mich (me). Reflexivo com acusativo.','Ich heiße Hans. — Freut mich! Ich bin Rebeca.','Me chamo Hans. — Muito prazer! Eu sou Rebeca.','["apresentação","essencial"]',         true, true),
('a1-dia-tschuess',        'A1','dia-a-dia','Tschüss! / Auf Wiedersehen!',               'Tchau! / Até logo!',                 'Tschüss = informal. Auf Wiedersehen = formal. Bis bald = até logo (breve).','Wiedersehen = voltar a ver. Auf = em (sentido de "de volta a").','Tschüss, bis morgen!',               'Tchau, até amanhã!',                     '["despedida","essencial"]',                 true, true),
('a1-dia-entschuldigung',  'A1','dia-a-dia','Entschuldigung! / Verzeihung!',             'Com licença! / Desculpe!',           'Entschuldigung = com licença para passar OU desculpe por um erro.','Entschuldigung vem de "entschuldigen" = desculpar.','Entschuldigung, wo ist die Toilette?','Com licença, onde fica o banheiro?',     '["essencial","sobrevivência"]',             true, true),
('a1-dia-bitte-danke',     'A1','dia-a-dia','Bitte / Danke / Bitte sehr!',               'Por favor / Obrigado(a) / De nada!', 'Bitte = por favor (pedido). Bitte? = como disse? Bitte sehr = de nada.','Bitte é a palavra mais versátil do alemão — aprenda todos os contextos.','Einen Kaffee, bitte! — Bitte sehr! — Danke!','Um café, por favor! — Aqui está! — Obrigada!','["essencial","educação"]',          true, true),
('a1-dia-ich-verstehe-nicht','A1','dia-a-dia','Ich verstehe nicht.',                     'Eu não entendo.',                    'Uma das frases mais importantes para iniciantes. Salva você em qualquer situação difícil.','verstehen = entender. ich verstehe, du verstehst, er versteht.','Ich verstehe nicht. Können Sie das wiederholen?','Eu não entendo. Pode repetir?','["sobrevivência","essencial"]',             true, true),
('a1-dia-wie-bitte',       'A1','dia-a-dia','Wie bitte?',                                'Como disse? / Como, por favor?',     'A forma mais educada de pedir repetição. Mais formal que "Was?" ou "Hä?".','Wie = como. Bitte = por favor. Juntos formam a expressão de cortesia para repetição.','Der Zug fährt um... — Wie bitte? Ich habe nicht verstanden.','O trem parte às... — Como disse? Não entendi.','["sobrevivência","educação"]',      true, true),
('a1-dia-langsamer',       'A1','dia-a-dia','Langsamer, bitte! / Sprechen Sie langsamer, bitte!','Mais devagar, por favor!', 'Langsamer = comparativo de langsam (devagar). Fundamental para quem está aprendendo.','langsam (devagar) → langsamer (mais devagar). Comparativo regular com -er.','Ich lerne noch Deutsch. Sprechen Sie bitte langsamer!','Ainda estou aprendendo alemão. Por favor fale mais devagar!','["sobrevivência","essencial"]', true, true),
('a1-num-eins-zehn',       'A1','dia-a-dia','eins, zwei, drei, vier, fünf',              '1, 2, 3, 4, 5',                      'Os primeiros cinco números. Atenção: "eins" sozinho, mas "ein" antes de substantivo.','eins = número isolado. ein Mann = um homem. uma = eine (feminino).','Ich habe zwei Kinder — einen Sohn und eine Tochter.','Eu tenho dois filhos — um filho e uma filha.','["números","essencial"]',              true, true),
('a1-num-sechs-zehn',      'A1','dia-a-dia','sechs, sieben, acht, neun, zehn',           '6, 7, 8, 9, 10',                     'Atenção especial: sechzehn (16) perde o s, siebzehn (17) perde o en.','Armadilha: 16 = sechzehn (NÃO sechszehn). 17 = siebzehn (NÃO siebenzehn).','Das kostet sechs Euro und zehn Cent.','Isso custa 6 euros e 10 centavos.',      '["números","essencial"]',                   true, true),
('a1-num-zwanzig-hundert', 'A1','dia-a-dia','zwanzig, dreißig, vierzig... hundert',      '20, 30, 40... 100',                  'Regra invertida: 21 = einundzwanzig (um-e-vinte). Unidade + und + dezena.','Compostos: unidade + und + dezena. Ex: 45 = fünfundvierzig.','Ich bin dreißig Jahre alt. Das kostet neunundneunzig Euro.','Tenho 30 anos. Isso custa 99 euros.','["números","regra-invertida"]',             true, true),
('a1-gram-sein-conj',      'A1','dia-a-dia','sein: bin / bist / ist / sind / seid / sind','ser/estar: sou / és / é / somos / sois / são','sein cobre SER e ESTAR. É o verbo mais importante e o mais irregular do alemão.','Irregular total: não segue nenhum padrão. Precisa decorar as 6 formas.','Ich bin müde. Du bist nett. Wir sind zu Hause.','Estou cansada. Você é simpático. Estamos em casa.','["sein","gramática","essencial"]',   true, true),
('a1-gram-haben-conj',     'A1','dia-a-dia','haben: habe / hast / hat / haben / habt / haben','ter: tenho / tens / tem / temos / tendes / têm','haben = ter. Irregular em du (hast) e er/sie/es (hat). Essencial para o Perfekt depois.','Irregular: du hast (não habest), er hat (não habet). Resto é quase regular.','Ich habe zwei Kinder. Hast du Zeit?','Tenho dois filhos. Você tem tempo?','["haben","gramática","essencial"]',   true, true),
('a1-gram-der-die-das',    'A1','dia-a-dia','der (masc.) / die (fem.) / das (neut.)',     'o (masc.) / a (fem.) / o/a (neutro)','Todo substantivo alemão tem um gênero. Aprenda sempre: o artigo + o substantivo juntos.','-ung/-heit/-keit = die. -chen/-lein = das. -er (agente) = der. Dias/meses = der.','der Mann, die Frau, das Kind — drei Geschlechter!','o homem, a mulher, a criança — três gêneros!','["artigos","gramática","essencial"]',true, true),
('a1-gram-kein-keine',     'A1','dia-a-dia','kein / keine / kein',                       'nenhum / nenhuma / nenhum',          'kein/keine = negação de substantivos com artigo indefinido. Segue o mesmo padrão de ein/eine.','ein → kein (masc/neutro). eine → keine (fem/plural). Kein Problem! = Sem problema!','Ich habe keine Zeit und kein Geld.','Não tenho tempo nem dinheiro.','["negação","gramática"]',                   true, true),
('a1-gram-separavel',      'A1','dia-a-dia','aufstehen → Ich stehe... auf.',             'levantar-se → Eu me levanto...',     'Verbos separáveis: o prefixo vai para o FINAL da frase na forma conjugada.','Prefixos separáveis: auf-, an-, ein-, aus-, mit-, ab-, zurück-, vor-, zu-.','Ich stehe um 7 Uhr auf. Ich kaufe im Supermarkt ein.','Levanto às 7h. Faço compras no supermercado.','["separáveis","gramática","rotina"]', true, true),
('a1-fam-mutter-vater',    'A1','dia-a-dia','die Mutter / der Vater / die Eltern',       'a mãe / o pai / os pais',            'Eltern (pais) é sempre plural. Não existe "die Elter" no singular.','Eltern = plural tantum (só existe no plural). die Eltern = os pais.','Meine Mutter wohnt in Deutschland. Meine Eltern sind geschieden.','Minha mãe mora na Alemanha. Meus pais são divorciados.','["família","vocabulário"]',          true, true),
('a1-fam-sohn-tochter',    'A1','dia-a-dia','der Sohn / die Tochter / das Kind',         'o filho / a filha / a criança',      'Kind (criança) é neutro — das Kind. Para especificar: der Sohn / die Tochter.','das Kind = neutro. Plural: die Kinder. "Ich habe zwei Kinder" = forma geral.','Mein Sohn ist zwölf und meine Tochter ist sechs Jahre alt.','Meu filho tem 12 e minha filha tem 6 anos.','["família","vocabulário","essencial"]',true, true),
('a1-fam-mein-meine',      'A1','dia-a-dia','mein (masc/neut) / meine (fem/plural)',     'meu / minha / meus / minhas',        'Possessivos seguem o gênero do OBJETO possuído. mein = ein, meine = eine.','Macete: possessivo = artigo indefinido. mein Sohn (der), meine Tochter (die), mein Kind (das).','Mein Sohn, meine Tochter, mein Kind, meine Kinder.','Meu filho, minha filha, minha criança, meus filhos.','["possessivos","gramática","família"]', true, true),
('a1-fam-katze-madalena',  'A1','dia-a-dia','die Katze / der Kater',                    'a gata / o gato (macho)',            'die Katze = gato em geral / gata. der Kater = gato macho especificamente.','Katze é feminino gramaticalmente, mesmo para gatos machos no uso comum.','Meine Katze heißt Madalena. Sie ist schwarz und faul.','Minha gata se chama Madalena. Ela é preta e preguiçosa.','["animais","família","vocabulário"]', true, true),
('a1-rot-halb',            'A1','dia-a-dia','halb zehn = 9:30 (NÃO 10:30!)',            'meia hora antes das dez = 9h30',    'halb + próxima hora = meia hora antes. É a maior armadilha das horas em alemão!','halb = metade. halb zehn = metade do caminho até as 10h = 9h30.','Der Kurs beginnt um halb neun. (8:30)','O curso começa às 8h30.','["horas","armadilha","essencial"]',         true, true),
('a1-rot-viertel',         'A1','dia-a-dia','Viertel nach acht (8:15) / Viertel vor neun (8:45)','oito e quinze / oito e quarenta e cinco','Viertel nach = e quinze (um quarto depois). Viertel vor = menos quinze (um quarto antes).','Viertel = um quarto. nach = depois. vor = antes.','Es ist Viertel nach acht. Der Zug fährt um Viertel vor neun ab.','São oito e quinze. O trem parte às oito e quarenta e cinco.','["horas","vocabulário"]', true, true),
('a1-rot-aufstehen',       'A1','dia-a-dia','Ich stehe um 6:30 auf.',                   'Eu me levanto às 6h30.',             'aufstehen = levantar-se (separável). aufwachen = acordar (separável). Diferentes!','aufwachen = acordar (abrir os olhos). aufstehen = levantar da cama.','Ich wache um 6 Uhr auf und stehe um 6:30 auf.','Acordo às 6h e me levanto às 6h30.','["rotina","separáveis","verbos"]',          true, true),
('a1-casa-wohnzimmer',     'A1','dia-a-dia','das Wohnzimmer / die Küche / das Schlafzimmer','a sala / a cozinha / o quarto', 'Cômodos com -zimmer são sempre das (neutro). Exceção: die Küche (cozinha).','zimmer = neutro sempre. das Bad(ezimmer), das Arbeitszimmer, das Kinderzimmer.','Im Wohnzimmer gibt es ein Sofa und einen Fernseher.','Na sala tem um sofá e uma televisão.','["casa","vocabulário"]',                    true, true),
('a1-casa-kuehlschrank',   'A1','dia-a-dia','der Kühlschrank / die Tastatur / der Bildschirm','a geladeira / o teclado / o monitor','Palavras compostas: o último elemento define o gênero. Schrank (der) → Kühlschrank (der).','Kühl (frio) + Schrank (armário) = Kühlschrank (geladeira).','Meine Tastatur und mein Bildschirm sind neu.','Meu teclado e meu monitor são novos.','["casa","tech","vocabulário"]',             true, true),
('a1-com-moechte',         'A1','pedidos', 'Ich möchte einen Kaffee, bitte.',            'Eu gostaria de um café, por favor.', 'möchte = gostaria (Konjunktiv II de mögen). Forma mais educada que "ich will" para pedidos.','möchte não muda com ich e er/sie: ich möchte, du möchtest, er möchte.','Ich möchte ein Wasser und einen Tee, bitte.','Eu gostaria de uma água e um chá, por favor.','["pedidos","restaurante","essencial"]', true, true),
('a1-com-rechnung',        'A1','pedidos', 'Die Rechnung, bitte! / Zahlen, bitte!',      'A conta, por favor!',                'Duas formas igualmente corretas de pedir a conta no restaurante.','die Rechnung = a conta (substantivo). zahlen = pagar (verbo no imperativo implícito).','Entschuldigung! Die Rechnung, bitte!','Com licença! A conta, por favor!','["restaurante","pedidos","essencial"]',     true, true),
('a1-com-lecker',          'A1','pedidos', 'Lecker! / Es hat gut geschmeckt!',           'Gostoso! / Estava delicioso!',       'lecker = gostoso (adjetivo). gut schmecken = ter bom sabor.','schmecken = ter sabor. Das schmeckt gut. = Isso tem bom sabor.','Das war sehr lecker! Hat es geschmeckt?','Estava muito gostoso! Gostou?','["restaurante","vocabulário"]',             true, true),
('a1-perg-wo-wohin-woher', 'A1','dia-a-dia','Wo? / Wohin? / Woher?',                   'Onde? / Para onde? / De onde?',      'Os três "wo": wo = estático, wohin = movimento saindo, woher = origem/procedência.','Wo = posição (Dativ). Wohin = destino (Akkusativ). Woher = origem.','Wo wohnst du? Wohin gehst du? Woher kommst du?','Onde você mora? Para onde vai? De onde você é?','["perguntas","essencial","gramática"]', true, true),
('a1-perg-wie-viel',       'A1','pedidos', 'Wie viel kostet das? / Was kostet das?',    'Quanto custa isso?',                 'Duas formas corretas. wie viel = quanto. was kostet = quanto custa.','kosten = custar. Das kostet... = isso custa... Euro.','Wie viel kostet das Ticket nach München?','Quanto custa a passagem para Munique?','["perguntas","compras","essencial"]',       true, true),
('a1-perg-warum',          'A1','dia-a-dia','Warum lernst du Deutsch?',                 'Por que você aprende alemão?',       'warum = por quê. Resposta com "weil" (porque): Ich lerne Deutsch, weil meine Mutter in Deutschland wohnt.','warum (por quê) + weil (porque). weil manda o verbo para o final da frase subordinada.','Warum lernst du Deutsch? — Weil meine Mutter in Deutschland wohnt.','Por que você aprende alemão? — Porque minha mãe mora na Alemanha.','["perguntas","weil","gramática"]', true, true),
('a1-via-bahnhof',         'A1','viagem',  'Wo ist der Bahnhof?',                       'Onde fica a estação de trem?',       'Fundamental para qualquer viagem na Alemanha. Bahnhof = estação de trem.','der Bahnhof (masculino). die U-Bahn (metrô). die Haltestelle (parada de ônibus/bonde).','Entschuldigung, wo ist der nächste Bahnhof?','Com licença, onde fica a estação de trem mais próxima?','["viagem","sobrevivência","essencial"]', true, true),
('a1-via-ticket',          'A1','viagem',  'Ein Ticket nach München, bitte.',           'Uma passagem para Munique, por favor.','Estrutura: ein Ticket + nach + cidade. Hin und zurück = ida e volta.','nach + cidade (sem artigo). Exceção: in die USA, in die Schweiz (países com artigo).','Einmal nach Berlin, hin und zurück, bitte. Wie viel kostet das?','Uma vez para Berlim, ida e volta, por favor. Quanto custa?','["viagem","trem","pedidos"]',               true, true),
('a1-via-toilette',        'A1','viagem',  'Wo ist die Toilette? / Gibt es hier ein WC?','Onde fica o banheiro?',             'die Toilette ou das WC — ambos funcionam. Em restaurantes e lugares públicos.','WC = water closet (anglicismo). Toilette = versão formal. Klo = informal/gíria.','Entschuldigung, wo ist die Toilette, bitte?','Com licença, onde fica o banheiro, por favor?','["viagem","sobrevivência","essencial"]',  true, true),
('a1-via-hilfe',           'A1','viagem',  'Können Sie mir helfen? / Ich brauche Hilfe.','Pode me ajudar? / Eu preciso de ajuda.','helfen = ajudar (verbo com dativo). mir = a mim (dativo de ich). Brauchen = precisar.','helfen + Dativ: Ich helfe dir (te ajudo). Du hilfst mir (você me ajuda).','Entschuldigung, können Sie mir helfen? Ich bin neu hier.','Com licença, pode me ajudar? Sou nova aqui.','["viagem","sobrevivência","essencial"]', true, true),
('a1-giria-alles-klar',    'A1','girias',  'Alles klar!',                               'Entendido! / Tudo certo! / Beleza!', 'A expressão mais versátil do alemão coloquial. Serve como confirmação, resposta e cumprimento.','alles = tudo. klar = claro/certo. Juntos formam uma expressão fixa muito comum.','Wir treffen uns um 8 Uhr. — Alles klar!','Nos encontramos às 8h. — Beleza!','["gírias","coloquial","essencial"]',        true, true),
('a1-giria-krass',         'A1','girias',  'krass / voll krass!',                       'absurdo / demais / surreal (gíria)', 'krass = muito intenso, impressionante (positivo ou negativo). Voll = muito (gíria).','voll = cheio → virou intensificador gírio. "Das ist voll krass!" = isso é demais!','Hast du das gesehen? Das ist voll krass!','Você viu isso? Isso é demais!','["gírias","2026","jovem"]',                 true, true),
('a1-giria-moin',          'A1','girias',  'Moin! / Moin moin!',                        'Oi! / Olá! (Norte da Alemanha)',     'Usado em Hamburgo e no norte da Alemanha qualquer hora do dia.','Regional: norte da Alemanha. Não usar no sul (Baviera) onde usam "Servus" ou "Grüß Gott".','Moin! Wie läuft''s so?','Oi! Como tá as coisas?','["gírias","regional","hamburgos"]',         true, true),
('a1-giria-digga',         'A1','girias',  'Digga / Alter!',                            'cara / mano (gíria)',                'Digga = forma muito berlinense/norte-alemã. Alter = mais geral. Equivale a "cara" em português.','Digga vem de "Dicker" (gordo, usado afetivamente). Alter = velho (usado afetivamente).','Digga, was machst du hier?','Cara, o que você tá fazendo aqui?','["gírias","berlin","jovem"]',               true, true),
('a1-giria-kein-bock',     'A1','girias',  'Ich habe keinen Bock.',                     'Não estou a fim. / Não tenho vontade.','Bock haben = estar a fim. Keinen Bock haben = não estar com vontade.','Bock = bode (animal) → virou gíria para "vontade/energia". Bock haben auf = estar a fim de.','Hast du Bock auf Pizza? — Nee, keinen Bock heute.','Tá a fim de pizza? — Não, sem energia hoje.','["gírias","jovem","coloquial"]',true, true)
ON CONFLICT (slug) DO UPDATE SET
  back_pt        = EXCLUDED.back_pt,
  explanation_pt = EXCLUDED.explanation_pt,
  grammar_note   = EXCLUDED.grammar_note,
  example_de     = EXCLUDED.example_de,
  example_pt     = EXCLUDED.example_pt,
  tags           = EXCLUDED.tags,
  curated        = true,
  active         = true,
  updated_at     = now();


-- ══════════════════════════════════════════════════
-- BLOCO 5 — deutsch_challenges
-- Fonte: learning_content_phase3.sql
-- ══════════════════════════════════════════════════

INSERT INTO deutsch_challenges
  (slug, level, theme, title_pt, scenario_pt, character_key, user_goal_pt, opening_line_de, support_phrases, success_criteria, xp_reward)
VALUES
('a1-heidi-padaria',   'A1','pedidos',    'Padaria de bairro',          'Você está numa padaria e quer pedir café e pão sem travar.',                           'heidi','Pedir 2 itens, perguntar o preço e agradecer.',                       'Guten Morgen! Was möchten Sie heute?',                              '[{"de":"Ich möchte ... bitte.","pt":"Eu queria ... por favor."},{"de":"Was kostet das?","pt":"Quanto custa isso?"},{"de":"Danke schön.","pt":"Muito obrigada."}]',               '["Pediu pelo menos um item em alemão","Perguntou preço ou confirmou pagamento","Usou bitte/danke"]', 100),
('a1-heidi-metro',     'A1','viagem',     'Perdida no metrô',           'Você está em Berlim e precisa achar a estação certa.',                                 'heidi','Perguntar onde fica o metrô e pedir para repetir devagar.',           'Hallo! Du siehst ein bisschen verloren aus. Wohin möchtest du?',    '[{"de":"Wo ist die U-Bahn?","pt":"Onde fica o metrô?"},{"de":"Sprechen Sie bitte langsamer.","pt":"Fale mais devagar, por favor."},{"de":"Ich verstehe das nicht.","pt":"Eu não entendo isso."}]','["Perguntou localização","Pediu repetição ou fala lenta","Respondeu com destino"]', 100),
('a1-heidi-hotel',     'A1','viagem',     'Check-in no hotel',          'Você chegou ao hotel e precisa confirmar sua reserva.',                                 'heidi','Dizer que tem uma reserva e perguntar pelo quarto.',                  'Guten Abend! Willkommen im Hotel. Haben Sie eine Reservierung?',    '[{"de":"Ich habe eine Reservierung.","pt":"Tenho uma reserva."},{"de":"Mein Name ist ...","pt":"Meu nome é ..."},{"de":"Wo ist mein Zimmer?","pt":"Onde fica meu quarto?"}]',     '["Informou nome","Disse que tem reserva","Fez uma pergunta simples"]', 100),
('a1-heidi-farmacia',  'A1','saude',      'Farmácia urgente',           'Você está passando mal e precisa comprar algo na farmácia.',                           'heidi','Explicar que está passando mal e pedir ajuda.',                       'Guten Tag. Wie kann ich Ihnen helfen?',                             '[{"de":"Mir ist schlecht.","pt":"Estou passando mal."},{"de":"Ich brauche Hilfe.","pt":"Preciso de ajuda."},{"de":"Haben Sie etwas dagegen?","pt":"Vocês têm algo para isso?"}]', '["Explicou o problema","Pediu ajuda","Usou frase educada"]', 100),
('a1-lukas-code',      'A1','trabalho',   'Bug no código',              'Você está numa call rápida e precisa dizer que o código não funciona.',                 'lukas','Explicar o problema de forma simples e pedir ajuda.',                 'Hey Rebeca, was ist los mit dem Code?',                             '[{"de":"Der Code funktioniert nicht.","pt":"O código não funciona."},{"de":"Ich habe eine Frage.","pt":"Tenho uma pergunta."},{"de":"Kannst du mir helfen?","pt":"Você pode me ajudar?"}]','["Descreveu o problema","Pediu ajuda","Usou vocabulário tech"]', 120),
('a1-lukas-meeting',   'A1','trabalho',   'Reunião online',             'Você precisa avisar que está numa reunião e marcar outro horário.',                     'lukas','Dizer que está em meeting e perguntar se a pessoa tem tempo depois.', 'Hey, hast du kurz Zeit?',                                           '[{"de":"Ich bin im Online-Meeting.","pt":"Estou na reunião online."},{"de":"Hast du später Zeit?","pt":"Você tem tempo mais tarde?"},{"de":"Um zehn Uhr passt gut.","pt":"Às dez está bom."}]','["Avisou indisponibilidade","Sugeriu ou aceitou horário","Usou tom informal"]', 120),
('a1-lukas-interview', 'A1','trabalho',   'Mini entrevista tech',       'Você está numa entrevista simples e precisa se apresentar.',                           'lukas','Dizer nome, origem e profissão.',                                     'Willkommen! Erzähl kurz etwas über dich.',                         '[{"de":"Ich heiße Rebeca.","pt":"Eu me chamo Rebeca."},{"de":"Ich komme aus Brasilien.","pt":"Sou do Brasil."},{"de":"Ich arbeite als Webentwicklerin.","pt":"Trabalho como desenvolvedora web."}]','["Disse nome","Disse origem","Disse profissão"]', 120),
('a1-hans-formal',     'A1','formal',     'Primeira conversa formal',   'Você precisa falar com uma pessoa desconhecida de forma educada.',                     'hans', 'Usar Sie, pedir repetição e agradecer.',                              'Guten Tag. Wie kann ich Ihnen helfen?',                             '[{"de":"Können Sie mir helfen?","pt":"Pode me ajudar?"},{"de":"Können Sie das bitte wiederholen?","pt":"Pode repetir isso, por favor?"},{"de":"Danke für Ihre Hilfe.","pt":"Obrigado pela ajuda."}]','["Usou forma formal Sie","Pediu repetição","Agradeceu"]', 100),
('a1-hans-termin',     'A1','burocracia', 'Marcar um horário',          'Você precisa explicar que tem/quer um horário marcado.',                               'hans', 'Usar Termin corretamente e confirmar horário.',                       'Guten Tag. Haben Sie einen Termin?',                                '[{"de":"Ich habe einen Termin.","pt":"Tenho um horário marcado."},{"de":"Ich möchte einen Termin machen.","pt":"Gostaria de marcar um horário."},{"de":"Um zehn Uhr passt gut.","pt":"Às dez está bom."}]','["Usou Termin","Confirmou horário","Manteve tom educado"]', 120),
('a1-petra-formular',  'A1','burocracia', 'Formulário no balcão',       'Você está no atendimento e precisa pedir um formulário.',                              'petra','Pedir formulário, informar endereço e pedir ajuda.',                 'Guten Tag. Welches Formular brauchen Sie?',                         '[{"de":"Ich brauche ein Formular.","pt":"Preciso de um formulário."},{"de":"Meine Adresse ist hier.","pt":"Meu endereço é este aqui."},{"de":"Können Sie mir helfen?","pt":"Pode me ajudar?"}]','["Pediu formulário","Informou endereço","Pediu ajuda formalmente"]', 120),
('a1-petra-revisao',   'A1','gramatica',  'Petra corrige sua frase',    'Você vai escrever uma frase simples e Petra vai corrigir com rigor.',                  'petra','Escrever apresentação curta com nome, origem e cidade.',             'Schreiben Sie bitte drei einfache Sätze über sich. Ohne drama.',    '[{"de":"Ich heiße ...","pt":"Eu me chamo ..."},{"de":"Ich komme aus ...","pt":"Sou de ..."},{"de":"Ich wohne in ...","pt":"Moro em ..."}]','["Escreveu 2 ou mais frases","Usou verbos heißen/kommen/wohnen","Aceitou correção"]', 100),
('a1-petra-reclamacao','A1','vida_real',  'Problema simples',           'Você precisa dizer que algo não funciona, sem enrolar.',                               'petra','Informar o problema e pedir solução.',                               'Was genau funktioniert nicht? Bitte präzise.',                      '[{"de":"Das Internet funktioniert nicht.","pt":"A internet não funciona."},{"de":"Ich brauche Hilfe.","pt":"Preciso de ajuda."},{"de":"Danke für Ihre Hilfe.","pt":"Obrigado pela ajuda."}]','["Descreveu problema","Pediu ajuda","Finalizou educadamente"]', 120)
ON CONFLICT (slug) DO UPDATE SET
  level            = EXCLUDED.level,
  theme            = EXCLUDED.theme,
  title_pt         = EXCLUDED.title_pt,
  scenario_pt      = EXCLUDED.scenario_pt,
  character_key    = EXCLUDED.character_key,
  user_goal_pt     = EXCLUDED.user_goal_pt,
  opening_line_de  = EXCLUDED.opening_line_de,
  support_phrases  = EXCLUDED.support_phrases,
  success_criteria = EXCLUDED.success_criteria,
  xp_reward        = EXCLUDED.xp_reward,
  active           = true,
  updated_at       = now();