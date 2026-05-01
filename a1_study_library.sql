-- ============================================================
-- DEUTSCH HUB — BIBLIOTECA A1 COMPLETA (10 Capítulos)
-- Fonte: "Meu Alemão do Zero ao B1" (eBook personalizado)
-- Roda no Supabase SQL Editor
-- ============================================================

-- ============================================================
-- CAP. 1 — Cumprimentos e Apresentações
-- ============================================================

INSERT INTO study_modules (slug, level, chapter_number, title_pt, title_de, focus, active, sort_order)
VALUES (
  'a1-cap1-cumprimentos', 'A1', 1,
  'Cumprimentos e Apresentações',
  'Begrüßungen und Vorstellungen',
  'Saudações formais e informais, apresentar-se, du vs. Sie',
  true, 10
) ON CONFLICT (slug) DO UPDATE SET
  title_pt = EXCLUDED.title_pt, focus = EXCLUDED.focus, active = true;

INSERT INTO study_lessons (slug, module_slug, level, sort_order, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, active)
VALUES (
  'a1-cap1-l1-saudacoes', 'a1-cap1-cumprimentos', 'A1', 1,
  'Saudações: formal vs informal',
  'Begrüßungen: formell vs. informell',
  'Em alemão, a formalidade muda completamente o cumprimento. Com amigos, use a versão curta; com desconhecidos, a versão completa.',
  'Formal = completo (Guten Tag!). Informal = curto (Tag!). Nunca troque os dois no contexto errado.',
  '[
    {"de": "Guten Morgen!", "pt": "Bom dia!", "note": "Formal — manhã"},
    {"de": "Morgen!", "pt": "Bom dia! (curto)", "note": "Informal — entre amigos"},
    {"de": "Guten Tag!", "pt": "Boa tarde / Olá!", "note": "Formal — dia todo"},
    {"de": "Guten Abend!", "pt": "Boa noite! (chegando)", "note": "Formal — a partir das 18h"},
    {"de": "Hallo!", "pt": "Oi!", "note": "Informal — qualquer hora"},
    {"de": "Auf Wiedersehen!", "pt": "Até logo!", "note": "Formal — despedida"},
    {"de": "Tschüss!", "pt": "Tchau!", "note": "Informal — despedida"},
    {"de": "Gute Nacht!", "pt": "Boa noite! (ao dormir)", "note": "Formal e informal"},
    {"de": "Bis bald!", "pt": "Até logo!", "note": "Informal"},
    {"de": "Bis morgen!", "pt": "Até amanhã!", "note": "Formal e informal"}
  ]'::jsonb,
  '[
    {"de": "Guten Tag!", "pt": "Olá! (formal)"},
    {"de": "Hallo!", "pt": "Oi! (informal)"},
    {"de": "Auf Wiedersehen!", "pt": "Até logo! (formal)"},
    {"de": "Tschüss!", "pt": "Tchau! (informal)"},
    {"de": "Wie geht es Ihnen?", "pt": "Como o senhor/a senhora está? (formal)"},
    {"de": "Wie geht''s?", "pt": "Como vai? (informal)"}
  ]'::jsonb,
  '["Formal = roupa de trabalho (completo). Informal = pijama (curto).", "''Guten Tag'' funciona manhã E tarde — é o cumprimento formal mais seguro.", "Quando em dúvida, sempre use a versão formal. Alemães preferem excesso de formalidade a informalidade inesperada."]'::jsonb,
  true
),
(
  'a1-cap1-l2-apresentacao', 'a1-cap1-cumprimentos', 'A1', 2,
  'Apresentando-se',
  'Sich vorstellen',
  'Como dizer seu nome, idade, origem, profissão e família em alemão.',
  'Em alemão profissões mudam conforme o gênero: -er (masc) → -erin (fem). Ex: Entwickler → Entwicklerin.',
  '[
    {"de": "Ich heiße Rebeca.", "pt": "Meu nome é Rebeca.", "note": "Forma casual e natural"},
    {"de": "Mein Name ist Rebeca.", "pt": "Meu nome é Rebeca.", "note": "Um pouco mais formal"},
    {"de": "Ich bin 30 Jahre alt.", "pt": "Eu tenho 30 anos.", "note": "Literal: ''Eu sou 30 anos de idade''"},
    {"de": "Ich komme aus Brasilien.", "pt": "Eu sou do Brasil.", "note": "Literal: ''Eu venho do Brasil''"},
    {"de": "Ich bin Webentwicklerin.", "pt": "Eu sou desenvolvedora web.", "note": "Sem artigo após ''sein'' com profissão"},
    {"de": "Ich wohne in Salvador.", "pt": "Eu moro em Salvador.", "note": "Wohnen = morar"},
    {"de": "Ich habe zwei Kinder.", "pt": "Eu tenho dois filhos.", "note": "Kinder = crianças (plural de Kind)"},
    {"de": "Meine Katze heißt Madalena.", "pt": "Minha gata se chama Madalena.", "note": "Heißen = chamar-se"}
  ]'::jsonb,
  '[
    {"de": "Wie heißen Sie?", "pt": "Qual é o seu nome? (formal)"},
    {"de": "Wie heißt du?", "pt": "Qual é o seu nome? (informal)"},
    {"de": "Ich heiße...", "pt": "Meu nome é..."},
    {"de": "Woher kommen Sie?", "pt": "De onde o senhor/a senhora é?"},
    {"de": "Ich komme aus...", "pt": "Eu sou de..."},
    {"de": "Freut mich!", "pt": "Muito prazer!"},
    {"de": "Freut mich auch!", "pt": "Igualmente!"}
  ]'::jsonb,
  '["Nunca use artigo ao dizer sua profissão: ''Ich bin Webentwicklerin'' (NÃO: ''Ich bin eine Webentwicklerin'').", "Brasilianerin (feminino) / Brasilianer (masculino) — a nacionalidade também tem gênero.", "Heißen = chamar-se. Funciona para pessoas E animais: ''Meine Katze heißt Madalena.''"]'::jsonb,
  true
),
(
  'a1-cap1-l3-du-sie', 'a1-cap1-cumprimentos', 'A1', 3,
  'Du vs. Sie — a diferença que importa',
  'Du vs. Sie',
  'Alemão tem duas formas de ''você'': du (informal) e Sie (formal). Usar a errada pode soar rude ou estranho.',
  'Du = amigos, família, crianças, internet. Sie (sempre maiúsculo!) = desconhecidos, chefes, médicos. Na dúvida: use Sie.',
  '[
    {"de": "Wie heißt du?", "pt": "Qual é o seu nome? (amigo)", "note": "Informal"},
    {"de": "Wie heißen Sie?", "pt": "Qual é o seu nome? (desconhecido)", "note": "Formal"},
    {"de": "Wo wohnst du?", "pt": "Onde você mora? (amigo)", "note": "Informal"},
    {"de": "Wo wohnen Sie?", "pt": "Onde o senhor/a senhora mora?", "note": "Formal"},
    {"de": "Woher kommst du?", "pt": "De onde você é? (amigo)", "note": "Informal"},
    {"de": "Woher kommen Sie?", "pt": "De onde o senhor/a senhora é?", "note": "Formal"}
  ]'::jsonb,
  '[
    {"de": "Darf ich Sie duzen?", "pt": "Posso te chamar de ''du''?"},
    {"de": "Bitte nennen Sie mich Rebeca.", "pt": "Por favor, me chame de Rebeca."}
  ]'::jsonb,
  '["Sie (formal) é sempre escrito com S maiúsculo — mesmo no meio da frase.", "''Ich'' (eu) é a única exceção: é sempre minúsculo, mesmo no início de frase em textos informais.", "No ambiente tech e startups alemães, o ''du'' é quase universal — mas espere o alemão/a alemã dar o primeiro passo."]'::jsonb,
  true
)
ON CONFLICT (slug) DO UPDATE SET
  summary_pt = EXCLUDED.summary_pt,
  quick_rule_pt = EXCLUDED.quick_rule_pt,
  examples = EXCLUDED.examples,
  key_phrases = EXCLUDED.key_phrases,
  mini_notes = EXCLUDED.mini_notes,
  active = true;

INSERT INTO study_exercises (slug, lesson_slug, module_slug, level, sort_order, exercise_type, prompt_pt, answer, options, explanation_pt, xp_reward, active)
VALUES
('a1-cap1-ex1', 'a1-cap1-l1-saudacoes', 'a1-cap1-cumprimentos', 'A1', 1, 'choose_option',
 'Você entra numa farmácia alemã. Qual cumprimento usar?',
 'Guten Tag!', '["Hallo!", "Guten Tag!", "Hey!", "Moin!"]',
 'Em locais formais (farmácia, banco, médico), sempre use Guten Tag! — é o cumprimento formal e seguro.',
 10, true),

('a1-cap1-ex2', 'a1-cap1-l1-saudacoes', 'a1-cap1-cumprimentos', 'A1', 2, 'choose_option',
 'Você encontra uma amiga alemã no parque. Qual é a forma mais natural de cumprimentar?',
 'Hallo!', '["Guten Abend!", "Auf Wiedersehen!", "Hallo!", "Guten Morgen!"]',
 'Entre amigos, Hallo! é o cumprimento mais natural e versátil — funciona qualquer hora do dia.',
 10, true),

('a1-cap1-ex3', 'a1-cap1-l2-apresentacao', 'a1-cap1-cumprimentos', 'A1', 3, 'free_answer',
 'Complete: "Meu nome é Rebeca. Eu sou do Brasil." — Traduza para alemão.',
 'Ich heiße Rebeca. Ich komme aus Brasilien.',
 null,
 'Heiße = me chamo (de heißen). Komme aus = sou de / venho de. Ambas as formas são corretas para nome: Ich heiße / Mein Name ist.',
 15, true),

('a1-cap1-ex4', 'a1-cap1-l3-du-sie', 'a1-cap1-cumprimentos', 'A1', 4, 'choose_option',
 'Seu chefe alemão te pergunta algo. Você responde usando qual pronome?',
 'Sie', '["du", "ihr", "Sie", "wir"]',
 'Sie (formal, sempre maiúsculo) é obrigatório com chefes, clientes e desconhecidos. Nunca inicie o "du" sem que o alemão/a alemã sugira.',
 10, true),

('a1-cap1-ex5', 'a1-cap1-l2-apresentacao', 'a1-cap1-cumprimentos', 'A1', 5, 'free_answer',
 'Como você diz "Eu sou desenvolvedora web" em alemão? (sem artigo!)',
 'Ich bin Webentwicklerin.',
 null,
 'Profissões após "sein" (ser) nunca levam artigo em alemão. Webentwicklerin = desenvolvedora web (forma feminina).',
 15, true)
ON CONFLICT (slug) DO UPDATE SET
  prompt_pt = EXCLUDED.prompt_pt,
  answer = EXCLUDED.answer,
  options = EXCLUDED.options,
  explanation_pt = EXCLUDED.explanation_pt,
  active = true;

-- ============================================================
-- CAP. 2 — Números, Alfabeto e Sons
-- ============================================================

INSERT INTO study_modules (slug, level, chapter_number, title_pt, title_de, focus, active, sort_order)
VALUES (
  'a1-cap2-numeros', 'A1', 2,
  'Números, Alfabeto e Sons',
  'Zahlen, Alphabet und Laute',
  'Números 0-100, regra invertida, sons especiais (ü, ö, ä, sch, ch)',
  true, 20
) ON CONFLICT (slug) DO UPDATE SET
  title_pt = EXCLUDED.title_pt, focus = EXCLUDED.focus, active = true;

INSERT INTO study_lessons (slug, module_slug, level, sort_order, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, active)
VALUES (
  'a1-cap2-l1-numeros0a20', 'a1-cap2-numeros', 'A1', 1,
  'Números de 0 a 20',
  'Zahlen von 0 bis 20',
  'Os números de 0 a 20 precisam ser decorados individualmente. Atenção especial para 16 (sechzehn, não sechszehn) e 17 (siebzehn, não siebenzehn).',
  'Atenção: 16 = sechzehn (sem o ''s'' final do sechs) e 17 = siebzehn (sem o ''en'' do sieben). O alemão ''encurta'' para facilitar a pronúncia.',
  '[
    {"de": "null", "pt": "0", "note": "Como ''nul'' em português"},
    {"de": "eins", "pt": "1", "note": "''áins''"},
    {"de": "zwei", "pt": "2", "note": "''tsvai''"},
    {"de": "drei", "pt": "3", "note": "''drair''"},
    {"de": "vier", "pt": "4", "note": "''fír''"},
    {"de": "fünf", "pt": "5", "note": "''fünf'' — ü = u com boca de i"},
    {"de": "sechs", "pt": "6", "note": "''zéks''"},
    {"de": "sieben", "pt": "7", "note": "''zíben''"},
    {"de": "acht", "pt": "8", "note": "''ájt''"},
    {"de": "neun", "pt": "9", "note": "''noin''"},
    {"de": "zehn", "pt": "10", "note": "''tsén''"},
    {"de": "elf", "pt": "11", "note": "''élf''"},
    {"de": "zwölf", "pt": "12", "note": "''tsvölf'' — ö = e com boca de o"},
    {"de": "dreizehn", "pt": "13", "note": "3+10"},
    {"de": "sechzehn", "pt": "16", "note": "Atenção: sem o s final!"},
    {"de": "siebzehn", "pt": "17", "note": "Atenção: sem ''en''!"},
    {"de": "zwanzig", "pt": "20", "note": "''tsván-tsig''"}
  ]'::jsonb,
  '[
    {"de": "Ich bin dreißig Jahre alt.", "pt": "Eu tenho 30 anos."},
    {"de": "Das kostet fünf Euro.", "pt": "Isso custa 5 euros."},
    {"de": "Meine Tochter ist sechs Jahre alt.", "pt": "Minha filha tem 6 anos."},
    {"de": "Mein Sohn ist zwölf Jahre alt.", "pt": "Meu filho tem 12 anos."}
  ]'::jsonb,
  '["Armadilha: sechzehn (16) NÃO é sechszehn. O ''s'' some.", "Armadilha: siebzehn (17) NÃO é siebenzehn. O ''en'' some.", "Dica de telefone: alemães dizem o número invertido aos pares. Ouça o final primeiro para saber a dezena."]'::jsonb,
  true
),
(
  'a1-cap2-l2-numeros21a100', 'a1-cap2-numeros', 'A1', 2,
  'Números de 21 a 100 — a regra invertida',
  'Zahlen 21–100',
  'Em alemão, os números compostos são ditos ao contrário: primeiro a unidade, depois a dezena, unidas por ''und''. Einundzwanzig = um-e-vinte = 21.',
  'REGRA INVERTIDA: unidade + und + dezena. 21 = einundzwanzig (um+e+vinte). É o contrário do português!',
  '[
    {"de": "einundzwanzig", "pt": "21", "note": "ein (1) + und + zwanzig (20)"},
    {"de": "zweiundzwanzig", "pt": "22", "note": "zwei (2) + und + zwanzig (20)"},
    {"de": "dreißig", "pt": "30", "note": "''draisig'' — atenção ao ß"},
    {"de": "vierzig", "pt": "40", "note": "''firtsig''"},
    {"de": "fünfzig", "pt": "50", "note": "''fünftsig''"},
    {"de": "sechzig", "pt": "60", "note": "''zéj-tsig'' — sem o s!"},
    {"de": "siebzig", "pt": "70", "note": "''zíp-tsig'' — sem en!"},
    {"de": "achtzig", "pt": "80", "note": "''áj-tsig''"},
    {"de": "neunzig", "pt": "90", "note": "''noin-tsig''"},
    {"de": "hundert", "pt": "100", "note": "''rúndert''"}
  ]'::jsonb,
  '[
    {"de": "Ich wohne in der Nummer fünfundvierzig.", "pt": "Eu moro no número 45."},
    {"de": "Der Kurs kostet neunundneunzig Euro.", "pt": "O curso custa 99 euros."},
    {"de": "Sie ist einunddreißig Jahre alt.", "pt": "Ela tem 31 anos."}
  ]'::jsonb,
  '["Mnemônico: pense que o alemão ''fala de trás para frente'' nos números compostos.", "60 = sechzig (não sechszig) e 70 = siebzig (não siebenzig) — mesma armadilha do 16 e 17.", "100 = hundert. 1000 = tausend. 1.000.000 = eine Million."]'::jsonb,
  true
),
(
  'a1-cap2-l3-sons', 'a1-cap2-numeros', 'A1', 3,
  'Sons especiais do alemão',
  'Besondere Laute',
  'O alemão tem sons que não existem em português: ü, ö, ä e as combinações sch, ch, st, sp. Praticar esses sons é fundamental para ser entendido.',
  'ü = diga "i" e arredonde os lábios. ö = diga "e" e arredonde os lábios. ä = "é" aberto. sch = "x" (shoe). ch = som gutural (garganta).',
  '[
    {"de": "fünf", "pt": "cinco", "note": "ü = u com boca de i"},
    {"de": "schön", "pt": "bonito/a", "note": "sch = x, ö = e com boca de o"},
    {"de": "Mädchen", "pt": "menina", "note": "ä = é aberto"},
    {"de": "Ich", "pt": "eu", "note": "ch após i = sopro suave na garganta"},
    {"de": "Buch", "pt": "livro", "note": "ch após u = r espanhol forte"},
    {"de": "Schule", "pt": "escola", "note": "sch = x"},
    {"de": "Stadt", "pt": "cidade", "note": "st no início = xt"},
    {"de": "Spiel", "pt": "jogo", "note": "sp no início = xp"},
    {"de": "Straße", "pt": "rua", "note": "ß = ss longo"},
    {"de": "groß", "pt": "grande", "note": "ß = ss longo"}
  ]'::jsonb,
  '[
    {"de": "Wie bitte?", "pt": "Como disse? / Pode repetir?"},
    {"de": "Können Sie langsamer sprechen?", "pt": "Pode falar mais devagar?"},
    {"de": "Wie schreibt man das?", "pt": "Como se escreve isso?"}
  ]'::jsonb,
  '["ß (Eszett) = ss longo. Só existe em alemão. Após vogal longa ou ditongo.", "O r alemão é gutural (vem da garganta), não o r brasileiro vibrante.", "V em alemão soa como F: Vater (pai) = ''fáter''. W soa como V: Wasser (água) = ''váser''."]'::jsonb,
  true
)
ON CONFLICT (slug) DO UPDATE SET
  summary_pt = EXCLUDED.summary_pt,
  quick_rule_pt = EXCLUDED.quick_rule_pt,
  examples = EXCLUDED.examples,
  key_phrases = EXCLUDED.key_phrases,
  mini_notes = EXCLUDED.mini_notes,
  active = true;

INSERT INTO study_exercises (slug, lesson_slug, module_slug, level, sort_order, exercise_type, prompt_pt, answer, options, explanation_pt, xp_reward, active)
VALUES
('a1-cap2-ex1', 'a1-cap2-l1-numeros0a20', 'a1-cap2-numeros', 'A1', 1, 'choose_option',
 'Como se escreve o número 17 em alemão?',
 'siebzehn', '["siebenzehn", "siebzehn", "siebenzehn", "sibzehn"]',
 'siebzehn — o "en" de sieben some. Mesma lógica do 16 (sechzehn, não sechszehn).',
 10, true),

('a1-cap2-ex2', 'a1-cap2-l2-numeros21a100', 'a1-cap2-numeros', 'A1', 2, 'free_answer',
 'Escreva "45" em alemão (lembre da regra invertida):',
 'fünfundvierzig',
 null,
 'fünf (5) + und (e) + vierzig (40) = fünfundvierzig. Unidade primeiro, depois dezena, unidos por "und".',
 15, true),

('a1-cap2-ex3', 'a1-cap2-l2-numeros21a100', 'a1-cap2-numeros', 'A1', 3, 'choose_option',
 'Qual é o número 60 em alemão?',
 'sechzig', '["sechszig", "sechzig", "sechzehn", "seczig"]',
 'sechzig — sem o "s" final do "sechs". Mesmo padrão de 16 (sechzehn) e 70 (siebzig).',
 10, true),

('a1-cap2-ex4', 'a1-cap2-l3-sons', 'a1-cap2-numeros', 'A1', 4, 'choose_option',
 'O símbolo ß em alemão soa como:',
 'ss longo', '["z", "sh", "ss longo", "tz"]',
 'ß (Eszett) = ss longo. Aparece após vogal longa. Straße (rua), groß (grande), Fuß (pé).',
 10, true),

('a1-cap2-ex5', 'a1-cap2-l1-numeros0a20', 'a1-cap2-numeros', 'A1', 5, 'free_answer',
 'Escreva em alemão: "Minha filha tem 6 anos e meu filho tem 12 anos."',
 'Meine Tochter ist sechs Jahre alt und mein Sohn ist zwölf Jahre alt.',
 null,
 'Tochter = filha, Sohn = filho. Jahre alt = anos de idade. sechs = 6, zwölf = 12.',
 20, true)
ON CONFLICT (slug) DO UPDATE SET
  prompt_pt = EXCLUDED.prompt_pt, answer = EXCLUDED.answer,
  options = EXCLUDED.options, explanation_pt = EXCLUDED.explanation_pt, active = true;

-- ============================================================
-- CAP. 3 — Pronomes e Verbo sein
-- ============================================================

INSERT INTO study_modules (slug, level, chapter_number, title_pt, title_de, focus, active, sort_order)
VALUES (
  'a1-cap3-pronomes-sein', 'A1', 3,
  'Pronomes e Verbo sein (Ser/Estar)',
  'Pronomen und sein',
  'Pronomes pessoais nominativos, conjugação completa de sein, usos de ser e estar',
  true, 30
) ON CONFLICT (slug) DO UPDATE SET
  title_pt = EXCLUDED.title_pt, focus = EXCLUDED.focus, active = true;

INSERT INTO study_lessons (slug, module_slug, level, sort_order, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, active)
VALUES
(
  'a1-cap3-l1-pronomes', 'a1-cap3-pronomes-sein', 'A1', 1,
  'Pronomes Pessoais',
  'Persönliche Pronomen',
  'Os pronomes pessoais são as peças-chave das frases. Em alemão, ''sie'' pode ser ela, eles/elas ou você formal — o contexto e o verbo diferenciam.',
  'sie (minúsculo) = ela ou eles/elas. Sie (MAIÚSCULO) = você formal. ich = sempre minúsculo (exceto no início de frase).',
  '[
    {"de": "ich", "pt": "eu", "note": "sempre minúsculo"},
    {"de": "du", "pt": "você (informal)", "note": "amigos, família"},
    {"de": "er", "pt": "ele", "note": "para substantivos masculinos"},
    {"de": "sie", "pt": "ela", "note": "para substantivos femininos"},
    {"de": "es", "pt": "isso / ele / ela (neutro)", "note": "para substantivos neutros"},
    {"de": "wir", "pt": "nós", "note": ""},
    {"de": "ihr", "pt": "vocês (informal)", "note": "grupo de amigos"},
    {"de": "sie", "pt": "eles / elas", "note": "minúsculo, verbo plural"},
    {"de": "Sie", "pt": "você / o senhor / a senhora (formal)", "note": "SEMPRE maiúsculo"}
  ]'::jsonb,
  '[
    {"de": "Sie ist Lehrerin.", "pt": "Ela é professora."},
    {"de": "Sie sind nett.", "pt": "Eles são simpáticos. / O senhor é simpático."},
    {"de": "Wir sind glücklich.", "pt": "Nós estamos felizes."},
    {"de": "Ich bin müde.", "pt": "Eu estou cansado/a."}
  ]'::jsonb,
  '["''sie ist'' (verbo singular) = ela. ''sie sind'' (verbo plural) = eles/elas ou você formal.", "ihr = vocês para um grupo informal. Sie = o senhor/a senhora/vocês (formal).", "Das Kind (criança) é neutro → usa ''es'': Das Kind, es schläft."]'::jsonb,
  true
),
(
  'a1-cap3-l2-sein', 'a1-cap3-pronomes-sein', 'A1', 2,
  'O Verbo sein — ser e estar',
  'Das Verb sein',
  'Sein é o verbo mais importante do alemão. Ele cobre tanto "ser" quanto "estar" do português. É irregular — precisa decorar.',
  'Sein cobre SER e ESTAR. Não existe separação em alemão. Conjugação: bin / bist / ist / sind / seid / sind.',
  '[
    {"de": "Ich bin Webentwicklerin.", "pt": "Eu sou desenvolvedora web.", "note": "identidade"},
    {"de": "Ich bin 30 Jahre alt.", "pt": "Eu tenho 30 anos.", "note": "idade"},
    {"de": "Ich bin aus Brasilien.", "pt": "Eu sou do Brasil.", "note": "origem"},
    {"de": "Ich bin zu Hause.", "pt": "Eu estou em casa.", "note": "localização"},
    {"de": "Ich bin müde.", "pt": "Eu estou cansada.", "note": "estado"},
    {"de": "Es ist Montag.", "pt": "É segunda-feira.", "note": "dia / hora"},
    {"de": "Es ist sonnig.", "pt": "Está ensolarado.", "note": "clima"},
    {"de": "Meine Kinder sind in der Schule.", "pt": "Meus filhos estão na escola.", "note": "localização"},
    {"de": "Du bist sehr nett.", "pt": "Você é muito simpático/a.", "note": "qualidade"}
  ]'::jsonb,
  '[
    {"de": "ich bin", "pt": "eu sou / estou"},
    {"de": "du bist", "pt": "você é / está"},
    {"de": "er/sie/es ist", "pt": "ele/ela é / está"},
    {"de": "wir sind", "pt": "nós somos / estamos"},
    {"de": "ihr seid", "pt": "vocês são / estão"},
    {"de": "sie/Sie sind", "pt": "eles são / o senhor é"}
  ]'::jsonb,
  '["Música mental: ''ich bin, du bist, er ist... wir sind, ihr seid, sie sind''. Rima ajuda a memorizar.", "sein cobre SER e ESTAR — esqueça essa distinção que existe em português.", "Atenção: ''zu Hause'' = em casa (estático). ''nach Hause'' = para casa (movimento)."]'::jsonb,
  true
)
ON CONFLICT (slug) DO UPDATE SET
  summary_pt = EXCLUDED.summary_pt, quick_rule_pt = EXCLUDED.quick_rule_pt,
  examples = EXCLUDED.examples, key_phrases = EXCLUDED.key_phrases,
  mini_notes = EXCLUDED.mini_notes, active = true;

INSERT INTO study_exercises (slug, lesson_slug, module_slug, level, sort_order, exercise_type, prompt_pt, answer, options, explanation_pt, xp_reward, active)
VALUES
('a1-cap3-ex1', 'a1-cap3-l2-sein', 'a1-cap3-pronomes-sein', 'A1', 1, 'choose_option',
 'Complete: "Wir ___ glücklich." (nós estamos felizes)',
 'sind', '["seid", "sind", "bin", "ist"]',
 'wir sind = nós somos/estamos. Conjugação: ich bin, du bist, er/sie/es ist, wir sind, ihr seid, sie/Sie sind.',
 10, true),

('a1-cap3-ex2', 'a1-cap3-l2-sein', 'a1-cap3-pronomes-sein', 'A1', 2, 'free_answer',
 'Traduza: "Eu sou brasileira. Estou em casa com Madalena."',
 'Ich bin Brasilianerin. Ich bin zu Hause mit Madalena.',
 null,
 'sein cobre ser E estar. "zu Hause" = em casa. Mit = com. Brasilianerin = brasileira (forma feminina).',
 20, true),

('a1-cap3-ex3', 'a1-cap3-l1-pronomes', 'a1-cap3-pronomes-sein', 'A1', 3, 'choose_option',
 '"sie sind" pode significar:',
 'Ambos: eles são E o senhor/a senhora é (formal)', '["Apenas: ela é", "Apenas: eles são", "Ambos: eles são E o senhor/a senhora é (formal)", "Apenas: vocês são"]',
 'sie sind (minúsculo) = eles/elas são. Sie sind (maiúsculo) = o senhor/a senhora são. O contexto e a maiúscula diferenciam.',
 15, true),

('a1-cap3-ex4', 'a1-cap3-l2-sein', 'a1-cap3-pronomes-sein', 'A1', 4, 'choose_option',
 'Qual frase está CORRETA?',
 'Ich bin müde.', '["Ich bin eine Webentwicklerin.", "Ich bin müde.", "Ich sein krank.", "Du bin nett."]',
 '"Ich bin müde" está correta. Profissões após sein não levam artigo: "Ich bin Webentwicklerin" (sem "eine").',
 15, true)
ON CONFLICT (slug) DO UPDATE SET
  prompt_pt = EXCLUDED.prompt_pt, answer = EXCLUDED.answer,
  options = EXCLUDED.options, explanation_pt = EXCLUDED.explanation_pt, active = true;

-- ============================================================
-- CAP. 4 — Artigos e Substantivos
-- ============================================================

INSERT INTO study_modules (slug, level, chapter_number, title_pt, title_de, focus, active, sort_order)
VALUES (
  'a1-cap4-artigos', 'A1', 4,
  'Artigos e Substantivos (der/die/das)',
  'Artikel und Substantive',
  'Gêneros gramaticais, artigos definidos e indefinidos, falsos amigos, padrões de terminação',
  true, 40
) ON CONFLICT (slug) DO UPDATE SET
  title_pt = EXCLUDED.title_pt, focus = EXCLUDED.focus, active = true;

INSERT INTO study_lessons (slug, module_slug, level, sort_order, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, active)
VALUES
(
  'a1-cap4-l1-generos', 'a1-cap4-artigos', 'A1', 1,
  'Os três gêneros — der, die, das',
  'Die drei Geschlechter',
  'Todo substantivo alemão tem um gênero: masculino (der), feminino (die) ou neutro (das). Não segue a lógica do português — precisa aprender com o artigo.',
  'Aprenda SEMPRE o artigo junto com o substantivo. Nunca: "Haus". Sempre: "das Haus". O artigo faz parte da palavra.',
  '[
    {"de": "der Mann", "pt": "o homem", "note": "masculino — der"},
    {"de": "die Frau", "pt": "a mulher", "note": "feminino — die"},
    {"de": "das Kind", "pt": "a criança", "note": "neutro — das. Criança é NEUTRO!"},
    {"de": "das Mädchen", "pt": "a menina", "note": "neutro — terminação -chen = neutro sempre"},
    {"de": "die Katze", "pt": "a gata", "note": "feminino — terminação -e = 80% feminino"},
    {"de": "das Auto", "pt": "o carro", "note": "neutro — terminação -o = neutro"},
    {"de": "die Wohnung", "pt": "o apartamento", "note": "feminino — terminação -ung = sempre feminino"},
    {"de": "der Computer", "pt": "o computador", "note": "masculino — terminação -er (agente) = masculino"},
    {"de": "das Buch", "pt": "o livro", "note": "neutro"},
    {"de": "die Schule", "pt": "a escola", "note": "feminino — termina em -e"}
  ]'::jsonb,
  '[
    {"de": "Wo ist der Bahnhof?", "pt": "Onde fica a estação?"},
    {"de": "Ich habe eine Katze.", "pt": "Eu tenho uma gata."},
    {"de": "Das ist mein Computer.", "pt": "Esse é meu computador."},
    {"de": "Die Wohnung ist groß.", "pt": "O apartamento é grande."}
  ]'::jsonb,
  '["Regras de terminação: -ung/-heit/-keit/-schaft/-tion = die (feminino). -chen/-lein = das (neutro). -er (profissão/agente) = der (masculino). Dias da semana e meses = der.", "Falsos amigos: das Handy = celular (não ''acessível''), das Gift = veneno (não ''presente''), der Rat = conselho (não ''rato'').", "Dica: quando em dúvida, chute ''der'' — é o gênero mais comum em textos alemães."]'::jsonb,
  true
),
(
  'a1-cap4-l2-artigos-indef', 'a1-cap4-artigos', 'A1', 2,
  'Artigos definidos e indefinidos',
  'Bestimmte und unbestimmte Artikel',
  'O artigo definido é der/die/das (o/a). O indefinido é ein/eine (um/uma). O negativo é kein/keine (nenhum/nenhuma).',
  'ein = masculino e neutro. eine = feminino. Pense: o feminino é especial, tem letra extra (-e).',
  '[
    {"de": "der Mann → ein Mann", "pt": "o homem → um homem", "note": "masculino: der → ein"},
    {"de": "die Frau → eine Frau", "pt": "a mulher → uma mulher", "note": "feminino: die → eine"},
    {"de": "das Kind → ein Kind", "pt": "a criança → uma criança", "note": "neutro: das → ein"},
    {"de": "Ich habe keine Zeit.", "pt": "Eu não tenho tempo.", "note": "kein/keine = nenhum/sem"},
    {"de": "Das ist kein Problem.", "pt": "Isso não é um problema.", "note": "kein para neutro"},
    {"de": "Ich habe einen Computer.", "pt": "Eu tenho um computador.", "note": "acusativo masculino: einen"}
  ]'::jsonb,
  '[
    {"de": "Haben Sie eine Frage?", "pt": "O senhor/a senhora tem uma pergunta?"},
    {"de": "Ich brauche einen Termin.", "pt": "Eu preciso de um horário."},
    {"de": "Kein Problem!", "pt": "Sem problema!"},
    {"de": "Ich habe keine Ahnung.", "pt": "Não tenho ideia. (expressão comum)"}
  ]'::jsonb,
  '["ein/eine seguem o mesmo padrão dos artigos — feminino sempre tem o -e extra.", "kein/keine = versão negativa de ein/eine. Usa-se para negar substantivos.", "''Keine Ahnung!'' = ''Sem ideia!'' — uma das expressões mais usadas no alemão cotidiano."]'::jsonb,
  true
)
ON CONFLICT (slug) DO UPDATE SET
  summary_pt = EXCLUDED.summary_pt, quick_rule_pt = EXCLUDED.quick_rule_pt,
  examples = EXCLUDED.examples, key_phrases = EXCLUDED.key_phrases,
  mini_notes = EXCLUDED.mini_notes, active = true;

INSERT INTO study_exercises (slug, lesson_slug, module_slug, level, sort_order, exercise_type, prompt_pt, answer, options, explanation_pt, xp_reward, active)
VALUES
('a1-cap4-ex1', 'a1-cap4-l1-generos', 'a1-cap4-artigos', 'A1', 1, 'choose_option',
 'Qual é o artigo correto para "Mädchen" (menina)?',
 'das', '["der", "die", "das", "ein"]',
 'das Mädchen — terminações em -chen e -lein são SEMPRE neutras (das), mesmo que o significado seja feminino biologicamente.',
 10, true),

('a1-cap4-ex2', 'a1-cap4-l1-generos', 'a1-cap4-artigos', 'A1', 2, 'choose_option',
 'A terminação "-ung" indica qual gênero?',
 'feminino (die)', '["masculino (der)", "feminino (die)", "neutro (das)", "depende da palavra"]',
 'Terminações -ung, -heit, -keit, -schaft, -tion são SEMPRE femininas: die Wohnung, die Gesundheit, die Möglichkeit.',
 10, true),

('a1-cap4-ex3', 'a1-cap4-l2-artigos-indef', 'a1-cap4-artigos', 'A1', 3, 'free_answer',
 'Traduza: "Eu tenho um computador e uma gata." (use ein/eine)',
 'Ich habe einen Computer und eine Katze.',
 null,
 'Computer (der) → einen no acusativo. Katze (die) → eine. A distinção acusativo aparece só no masculino (der → den/einen).',
 20, true),

('a1-cap4-ex4', 'a1-cap4-l1-generos', 'a1-cap4-artigos', 'A1', 4, 'choose_option',
 'O que significa "das Gift" em alemão?',
 'veneno', '["presente", "veneno", "dom/talento", "oferta"]',
 'FALSO AMIGO! das Gift = veneno (não presente!). Presente em alemão é das Geschenk.',
 15, true),

('a1-cap4-ex5', 'a1-cap4-l2-artigos-indef', 'a1-cap4-artigos', 'A1', 5, 'free_answer',
 'Complete com kein ou keine: "Ich habe ___ Zeit und ___ Ahnung."',
 'Ich habe keine Zeit und keine Ahnung.',
 null,
 'Zeit (die) → keine. Ahnung (die) → keine. kein = masculino/neutro, keine = feminino e plural.',
 15, true)
ON CONFLICT (slug) DO UPDATE SET
  prompt_pt = EXCLUDED.prompt_pt, answer = EXCLUDED.answer,
  options = EXCLUDED.options, explanation_pt = EXCLUDED.explanation_pt, active = true;

-- ============================================================
-- CAP. 5 — Verbos no Presente
-- ============================================================

INSERT INTO study_modules (slug, level, chapter_number, title_pt, title_de, focus, active, sort_order)
VALUES (
  'a1-cap5-verbos-presente', 'A1', 5,
  'Verbos no Presente',
  'Verben im Präsens',
  'Conjugação regular, verbos irregulares essenciais, verbos separáveis',
  true, 50
) ON CONFLICT (slug) DO UPDATE SET
  title_pt = EXCLUDED.title_pt, focus = EXCLUDED.focus, active = true;

INSERT INTO study_lessons (slug, module_slug, level, sort_order, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, active)
VALUES
(
  'a1-cap5-l1-regulares', 'a1-cap5-verbos-presente', 'A1', 1,
  'Verbos regulares — a regra do tronco',
  'Regelmäßige Verben',
  'A maioria dos verbos alemães é regular. Pega o tronco (infinitivo sem -en) e adiciona as terminações conforme o pronome.',
  'Tronco + terminação: -e (ich), -st (du), -t (er/sie/es), -en (wir/sie/Sie), -t (ihr). Simples assim!',
  '[
    {"de": "ich spiele", "pt": "eu jogo/brinco", "note": "spielen — jogar"},
    {"de": "du spielst", "pt": "você joga", "note": ""},
    {"de": "er/sie spielt", "pt": "ele/ela joga", "note": ""},
    {"de": "wir spielen", "pt": "nós jogamos", "note": ""},
    {"de": "ihr spielt", "pt": "vocês jogam", "note": ""},
    {"de": "sie spielen", "pt": "eles jogam", "note": ""},
    {"de": "ich lerne", "pt": "eu estudo/aprendo", "note": "lernen — estudar"},
    {"de": "ich arbeite", "pt": "eu trabalho", "note": "arbeiten — tronco em -t → -e- extra: arbeit-e-st"},
    {"de": "ich wohne", "pt": "eu moro", "note": "wohnen — morar"}
  ]'::jsonb,
  '[
    {"de": "Ich spiele The Sims 4.", "pt": "Eu jogo The Sims 4."},
    {"de": "Ich arbeite als Webentwicklerin.", "pt": "Eu trabalho como desenvolvedora web."},
    {"de": "Wir lernen zusammen Deutsch.", "pt": "Nós aprendemos alemão juntos."},
    {"de": "Sie wohnt in München.", "pt": "Ela mora em Munique."}
  ]'::jsonb,
  '["Troncos em -d, -t, -m, -n ganham -e- extra (''colchão'') para facilitar a pronúncia: arbeit → arbeitest (não arbeitstt).", "Dica: o -en do infinitivo é quase sempre igual à conjugação de wir/sie/Sie — economiza memória!", "spielen, lernen, wohnen, kochen, kaufen são todos regulares — a maioria dos verbos do dia a dia."]'::jsonb,
  true
),
(
  'a1-cap5-l2-irregulares', 'a1-cap5-verbos-presente', 'A1', 2,
  'Verbos irregulares essenciais',
  'Unregelmäßige Verben',
  'Alguns verbos mudam o tronco nas formas du e er/sie/es. São os mais usados — vale decorar.',
  'haben (ter): habe/hast/hat. essen (comer): esse/isst/isst. fahren (dirigir): fahre/fährst/fährt. Mudança ocorre em du e er/sie/es.',
  '[
    {"de": "ich habe / du hast / er hat", "pt": "eu tenho / você tem / ele tem", "note": "haben — ter"},
    {"de": "ich esse / du isst / er isst", "pt": "eu como / você come / ele come", "note": "essen — comer"},
    {"de": "ich lese / du liest / er liest", "pt": "eu leio / você lê / ele lê", "note": "lesen — ler"},
    {"de": "ich spreche / du sprichst / er spricht", "pt": "eu falo / você fala / ele fala", "note": "sprechen — falar"},
    {"de": "ich fahre / du fährst / er fährt", "pt": "eu dirijo / você dirige / ele dirige", "note": "fahren — dirigir/ir"},
    {"de": "ich nehme / du nimmst / er nimmt", "pt": "eu pego / você pega / ele pega", "note": "nehmen — pegar/tomar"},
    {"de": "ich gehe / du gehst / er geht", "pt": "eu vou / você vai / ele vai", "note": "gehen — ir"},
    {"de": "ich komme / du kommst / er kommt", "pt": "eu venho / você vem / ele vem", "note": "kommen — vir"}
  ]'::jsonb,
  '[
    {"de": "Hast du Hunger?", "pt": "Você está com fome?"},
    {"de": "Er spricht sehr gut Deutsch.", "pt": "Ele fala alemão muito bem."},
    {"de": "Ich nehme den Bus.", "pt": "Eu pego o ônibus."},
    {"de": "Was isst du zum Frühstück?", "pt": "O que você come no café da manhã?"}
  ]'::jsonb,
  '["wissen (saber informação): weiß/weißt/weiß — forma irregular única!", "kennen (conhecer pessoas/lugares) é regular: kenne/kennst/kennt.", "mögen (gostar): mag/magst/mag — irregular e muito útil: ''Ich mag Kaffee.'' = Eu gosto de café."]'::jsonb,
  true
),
(
  'a1-cap5-l3-separaveis', 'a1-cap5-verbos-presente', 'A1', 3,
  'Verbos separáveis — o canguru',
  'Trennbare Verben',
  'Alguns verbos têm um prefixo que SALTA para o final da frase no presente. São os verbos separáveis — como um canguru que carrega o filhote no final.',
  'Prefixo separável vai para o FINAL da frase. Prefixos: auf-, an-, ein-, aus-, mit-, zurück-, ab-, vor-, zu-.',
  '[
    {"de": "Ich stehe um 7 Uhr auf.", "pt": "Eu me levanto às 7h.", "note": "aufstehen — levantar-se"},
    {"de": "Wann kommst du an?", "pt": "Quando você chega?", "note": "ankommen — chegar"},
    {"de": "Ich kaufe im Supermarkt ein.", "pt": "Eu faço compras no supermercado.", "note": "einkaufen — fazer compras"},
    {"de": "Er sieht jeden Abend fern.", "pt": "Ele assiste TV toda noite.", "note": "fernsehen — assistir TV"},
    {"de": "Wann fährt der Zug ab?", "pt": "Quando o trem parte?", "note": "abfahren — partir"},
    {"de": "Ich bringe den Kuchen mit.", "pt": "Eu trago o bolo.", "note": "mitbringen — trazer junto"},
    {"de": "Ich hole meine Kinder ab.", "pt": "Eu busco meus filhos.", "note": "abholen — buscar/pegar"}
  ]'::jsonb,
  '[
    {"de": "Ich wache um 6 Uhr auf.", "pt": "Eu acordo às 6h. (aufwachen)"},
    {"de": "Ich ziehe mich an.", "pt": "Eu me visto. (sich anziehen)"},
    {"de": "Sie ruft mich an.", "pt": "Ela me liga. (anrufen)"},
    {"de": "Ich mache den Computer aus.", "pt": "Eu desligo o computador. (ausmachen)"}
  ]'::jsonb,
  '["No infinitivo, prefixo e verbo ficam juntos: aufstehen, einkaufen. Na frase conjugada, o prefixo vai para o FIM.", "Como reconhecer separáveis? Prefixos: ab-, an-, auf-, aus-, ein-, mit-, nach-, vor-, zu-, zurück-, hin-, her-, frei-, los-.", "Inseparáveis (NUNCA separam): be-, er-, ver-, ent-, emp-, miss-, zer-. Ex: besuchen → ich besuche (nunca ''besuche ich...che'')."]'::jsonb,
  true
)
ON CONFLICT (slug) DO UPDATE SET
  summary_pt = EXCLUDED.summary_pt, quick_rule_pt = EXCLUDED.quick_rule_pt,
  examples = EXCLUDED.examples, key_phrases = EXCLUDED.key_phrases,
  mini_notes = EXCLUDED.mini_notes, active = true;

INSERT INTO study_exercises (slug, lesson_slug, module_slug, level, sort_order, exercise_type, prompt_pt, answer, options, explanation_pt, xp_reward, active)
VALUES
('a1-cap5-ex1', 'a1-cap5-l1-regulares', 'a1-cap5-verbos-presente', 'A1', 1, 'choose_option',
 'Complete: "Du ___ sehr gut Deutsch." (falar = sprechen)',
 'sprichst', '["sprechst", "sprichst", "sprechen", "sprecht"]',
 'sprechen é irregular: ich spreche, du sprichst, er spricht. O tronco muda de "sprech" para "sprich" em du e er/sie.',
 10, true),

('a1-cap5-ex2', 'a1-cap5-l2-irregulares', 'a1-cap5-verbos-presente', 'A1', 2, 'free_answer',
 'Conjugue "haben" para: ich, du, er, wir',
 'ich habe, du hast, er hat, wir haben',
 null,
 'haben é irregular nas formas du (hast) e er/sie/es (hat). wir haben volta ao padrão regular.',
 15, true),

('a1-cap5-ex3', 'a1-cap5-l3-separaveis', 'a1-cap5-verbos-presente', 'A1', 3, 'free_answer',
 'Reescreva corretamente: "Ich aufstehe um 6 Uhr."',
 'Ich stehe um 6 Uhr auf.',
 null,
 'Verbo separável: o prefixo "auf" vai para o FINAL. stehe fica na 2ª posição, auf vai para o fim da frase.',
 20, true),

('a1-cap5-ex4', 'a1-cap5-l3-separaveis', 'a1-cap5-verbos-presente', 'A1', 4, 'choose_option',
 'Como fica "einkaufen" (fazer compras) na frase: "Eu faço compras no Aldi."?',
 'Ich kaufe im Aldi ein.', '["Ich einkaufe im Aldi.", "Ich kaufe ein im Aldi.", "Ich kaufe im Aldi ein.", "Ich kaufe im ein Aldi."]',
 'Separável: "kaufe" fica na 2ª posição, "ein" vai para o final. A posição do prefixo é sempre o último elemento.',
 15, true),

('a1-cap5-ex5', 'a1-cap5-l2-irregulares', 'a1-cap5-verbos-presente', 'A1', 5, 'free_answer',
 'Traduza: "Eu como pizza e bebo café todo dia."',
 'Ich esse jeden Tag Pizza und trinke Kaffee.',
 null,
 'essen: ich esse (irregular). trinken: ich trinke (regular). jeden Tag = todo dia. Ordem: verbo na 2ª posição.',
 20, true)
ON CONFLICT (slug) DO UPDATE SET
  prompt_pt = EXCLUDED.prompt_pt, answer = EXCLUDED.answer,
  options = EXCLUDED.options, explanation_pt = EXCLUDED.explanation_pt, active = true;

-- ============================================================
-- CAP. 6 — Família e Relações
-- ============================================================

INSERT INTO study_modules (slug, level, chapter_number, title_pt, title_de, focus, active, sort_order)
VALUES (
  'a1-cap6-familia', 'A1', 6,
  'Família e Relações',
  'Familie und Beziehungen',
  'Vocabulário de família, possessivos (mein/meine), descrição de pessoas',
  true, 60
) ON CONFLICT (slug) DO UPDATE SET
  title_pt = EXCLUDED.title_pt, focus = EXCLUDED.focus, active = true;

INSERT INTO study_lessons (slug, module_slug, level, sort_order, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, active)
VALUES
(
  'a1-cap6-l1-vocabulario', 'a1-cap6-familia', 'A1', 1,
  'Vocabulário de família',
  'Familienwortschatz',
  'Aprenda o vocabulário de família com os artigos — eles são essenciais para usar os possessivos corretamente depois.',
  'Família em alemão: die Mutter (mãe), der Vater (pai), das Kind (criança/filho), der Sohn (filho), die Tochter (filha).',
  '[
    {"de": "die Mutter", "pt": "a mãe", "note": ""},
    {"de": "der Vater", "pt": "o pai", "note": ""},
    {"de": "die Eltern", "pt": "os pais", "note": "plural — sempre use ''die Eltern''"},
    {"de": "das Kind", "pt": "a criança / o filho", "note": "neutro!"},
    {"de": "der Sohn", "pt": "o filho (menino)", "note": "masculino"},
    {"de": "die Tochter", "pt": "a filha", "note": "feminino"},
    {"de": "der Bruder", "pt": "o irmão", "note": ""},
    {"de": "die Schwester", "pt": "a irmã", "note": ""},
    {"de": "die Großmutter / Oma", "pt": "a avó", "note": "Oma = informal"},
    {"de": "der Großvater / Opa", "pt": "o avô", "note": "Opa = informal"},
    {"de": "die Tante", "pt": "a tia", "note": ""},
    {"de": "der Onkel", "pt": "o tio", "note": ""},
    {"de": "der Ehemann / Mann", "pt": "o marido", "note": ""},
    {"de": "die Ehefrau / Frau", "pt": "a esposa", "note": ""},
    {"de": "der Freund", "pt": "o namorado / amigo (masc.)", "note": "contexto define"},
    {"de": "die Freundin", "pt": "a namorada / amiga (fem.)", "note": "contexto define"},
    {"de": "der Kater", "pt": "o gato (macho)", "note": ""},
    {"de": "die Katze", "pt": "a gata / o gato", "note": "gênero gramatical feminino"}
  ]'::jsonb,
  '[
    {"de": "Meine Mutter wohnt in Deutschland.", "pt": "Minha mãe mora na Alemanha."},
    {"de": "Ich habe zwei Kinder.", "pt": "Eu tenho dois filhos."},
    {"de": "Mein Sohn ist zwölf Jahre alt.", "pt": "Meu filho tem 12 anos."},
    {"de": "Meine Tochter ist sechs Jahre alt.", "pt": "Minha filha tem 6 anos."},
    {"de": "Meine Katze heißt Madalena.", "pt": "Minha gata se chama Madalena."}
  ]'::jsonb,
  '["Freund/Freundin podem significar amigo(a) OU namorado(a) — contexto é tudo. ''Mein Freund'' em contexto romântico = meu namorado.", "Enkel = neto/a. Großeltern = avós (plural). As Eltern (pais) sempre no plural.", "Kind = criança/filho(a) genérico. Sohn = filho (masc.). Tochter = filha (fem.)."]'::jsonb,
  true
),
(
  'a1-cap6-l2-possessivos', 'a1-cap6-familia', 'A1', 2,
  'Possessivos — mein, dein, sein, ihr...',
  'Possessivartikel',
  'Os possessivos (meu, seu, nosso) funcionam como o artigo indefinido ein/eine. Seguem o mesmo padrão de terminações.',
  'mein = ein, meine = eine. O possessivo segue o gênero do objeto possuído, NÃO do possuidor. "Mein Sohn" (der Sohn), "Meine Tochter" (die Tochter).',
  '[
    {"de": "mein Sohn", "pt": "meu filho", "note": "der Sohn → mein (masculino)"},
    {"de": "meine Tochter", "pt": "minha filha", "note": "die Tochter → meine (feminino)"},
    {"de": "mein Kind", "pt": "meu/minha filho(a)", "note": "das Kind → mein (neutro)"},
    {"de": "meine Kinder", "pt": "meus filhos", "note": "plural → meine"},
    {"de": "sein Auto", "pt": "o carro dele", "note": "sein = dele (masc/neutro)"},
    {"de": "seine Mutter", "pt": "a mãe dele", "note": "seine = dele (feminino)"},
    {"de": "ihr Bruder", "pt": "o irmão dela", "note": "ihr = dela (masc/neutro)"},
    {"de": "ihre Schwester", "pt": "a irmã dela", "note": "ihre = dela (feminino)"},
    {"de": "unser Haus", "pt": "nossa casa", "note": "neutro"},
    {"de": "unsere Wohnung", "pt": "nosso apartamento", "note": "feminino"}
  ]'::jsonb,
  '[
    {"de": "Meine Mutter ist sehr stark.", "pt": "Minha mãe é muito forte."},
    {"de": "Sein Sohn spielt Fußball.", "pt": "O filho dele joga futebol."},
    {"de": "Ihre Tochter heißt Lena.", "pt": "A filha dela se chama Lena."},
    {"de": "Unser Opa wohnt in München.", "pt": "Nosso avô mora em Munique."}
  ]'::jsonb,
  '["Macete: possessivo = artigo. mein = ein (masc/neutro), meine = eine (fem/plural).", "sein (dele) e ihr (dela) — confusos! Ihr também é ''o senhor/a senhora'' (formal). Contexto resolve.", "dein = seu (informal). Ihr = seu (formal, maiúsculo). unser = nosso. euer = de vocês."]'::jsonb,
  true
)
ON CONFLICT (slug) DO UPDATE SET
  summary_pt = EXCLUDED.summary_pt, quick_rule_pt = EXCLUDED.quick_rule_pt,
  examples = EXCLUDED.examples, key_phrases = EXCLUDED.key_phrases,
  mini_notes = EXCLUDED.mini_notes, active = true;

INSERT INTO study_exercises (slug, lesson_slug, module_slug, level, sort_order, exercise_type, prompt_pt, answer, options, explanation_pt, xp_reward, active)
VALUES
('a1-cap6-ex1', 'a1-cap6-l2-possessivos', 'a1-cap6-familia', 'A1', 1, 'choose_option',
 'Complete: "___ Katze heißt Madalena." (minha gata — die Katze)',
 'Meine', '["Mein", "Meine", "Meiner", "Meinen"]',
 'die Katze é feminino → meine (como "eine"). Regra: possessivo segue o gênero do objeto. Meine Katze, mein Hund, mein Kind.',
 10, true),

('a1-cap6-ex2', 'a1-cap6-l1-vocabulario', 'a1-cap6-familia', 'A1', 2, 'free_answer',
 'Traduza: "Minha mãe mora na Alemanha há mais de 20 anos."',
 'Meine Mutter wohnt seit über 20 Jahren in Deutschland.',
 null,
 'seit = há (tempo). über = mais de. Jahren = anos (dativo plural). wohnt = mora (3ª pessoa singular de wohnen).',
 25, true),

('a1-cap6-ex3', 'a1-cap6-l2-possessivos', 'a1-cap6-familia', 'A1', 3, 'choose_option',
 'Como dizer "o irmão dela" em alemão?',
 'ihr Bruder', '["sein Bruder", "ihr Bruder", "ihre Bruder", "ihrem Bruder"]',
 'ihr = dela (possessivo feminino). der Bruder é masculino → ihr (sem -e). Se fosse feminino: ihre Schwester.',
 10, true),

('a1-cap6-ex4', 'a1-cap6-l1-vocabulario', 'a1-cap6-familia', 'A1', 4, 'free_answer',
 'Escreva em alemão: "Eu tenho dois filhos. Meu filho tem 12 anos e minha filha tem 6 anos."',
 'Ich habe zwei Kinder. Mein Sohn ist zwölf Jahre alt und meine Tochter ist sechs Jahre alt.',
 null,
 'Kinder = filhos/crianças (plural). Sohn (der) → mein. Tochter (die) → meine. zwölf = 12, sechs = 6.',
 25, true)
ON CONFLICT (slug) DO UPDATE SET
  prompt_pt = EXCLUDED.prompt_pt, answer = EXCLUDED.answer,
  options = EXCLUDED.options, explanation_pt = EXCLUDED.explanation_pt, active = true;

-- ============================================================
-- CAP. 7 — Rotina Diária e Horas
-- ============================================================

INSERT INTO study_modules (slug, level, chapter_number, title_pt, title_de, focus, active, sort_order)
VALUES (
  'a1-cap7-rotina-horas', 'A1', 7,
  'Rotina Diária e Horas',
  'Tagesroutine und Uhrzeit',
  'Horas (halb, Viertel, nach, vor), partes do dia, verbos de rotina, verbos separáveis na prática',
  true, 70
) ON CONFLICT (slug) DO UPDATE SET
  title_pt = EXCLUDED.title_pt, focus = EXCLUDED.focus, active = true;

INSERT INTO study_lessons (slug, module_slug, level, sort_order, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, active)
VALUES
(
  'a1-cap7-l1-horas', 'a1-cap7-rotina-horas', 'A1', 1,
  'Dizendo as horas em alemão',
  'Die Uhrzeit',
  'As horas em alemão têm lógica própria. Atenção especial: "halb zehn" = 9:30 (metade a caminho das dez), NÃO meia-das-nove!',
  'CUIDADO: halb zehn = 9:30 (não 10:30!). Pense: "já passou metade do caminho ATÉ as 10h". Viertel nach = e quinze. Viertel vor = menos quinze.',
  '[
    {"de": "Es ist ein Uhr.", "pt": "É uma hora.", "note": "hora exata"},
    {"de": "Es ist Viertel nach acht.", "pt": "São oito e quinze. (8:15)", "note": "nach = depois"},
    {"de": "Es ist halb zehn.", "pt": "São nove e meia. (9:30)", "note": "ATENÇÃO: metade a caminho das 10!"},
    {"de": "Es ist Viertel vor elf.", "pt": "São dez e quarenta e cinco. (10:45)", "note": "vor = antes"},
    {"de": "Es ist zwanzig nach zwei.", "pt": "São duas e vinte. (2:20)", "note": ""},
    {"de": "Es ist zwanzig vor sechs.", "pt": "São cinco e quarenta. (5:40)", "note": ""},
    {"de": "Es ist achtzehn Uhr.", "pt": "São 18h.", "note": "formato 24h — formal/escrito"},
    {"de": "Wie spät ist es?", "pt": "Que horas são?", "note": "pergunta"},
    {"de": "Wann?", "pt": "Quando?", "note": "pergunta de tempo"}
  ]'::jsonb,
  '[
    {"de": "Wie spät ist es?", "pt": "Que horas são?"},
    {"de": "Um wie viel Uhr...?", "pt": "A que horas...?"},
    {"de": "Der Zug fährt um 14:30 ab.", "pt": "O trem parte às 14h30."},
    {"de": "Ich bin um 9 Uhr bei der Arbeit.", "pt": "Estou no trabalho às 9h."}
  ]'::jsonb,
  '["halb zehn = 9:30. Tradução literal: ''metade (do caminho) das dez''. É a maior armadilha das horas!", "Para horários formais (transporte, reuniões), alemães usam o formato 24h: ''vierzehn Uhr dreißig'' (14:30).", "''Um'' antes de hora = às: ''um acht Uhr'' = às 8h."]'::jsonb,
  true
),
(
  'a1-cap7-l2-rotina', 'a1-cap7-rotina-horas', 'A1', 2,
  'Verbos de rotina e partes do dia',
  'Verben der Tagesroutine',
  'Verbos essenciais para descrever sua rotina diária — muitos são separáveis.',
  'Rotina usa muitos verbos separáveis: aufwachen (acordar), aufstehen (levantar), anziehen (vestir), einkaufen (comprar). Prefixo vai pro final!',
  '[
    {"de": "Ich wache um 6 Uhr auf.", "pt": "Eu acordo às 6h.", "note": "aufwachen — separável"},
    {"de": "Ich stehe um 6:30 auf.", "pt": "Eu me levanto às 6h30.", "note": "aufstehen — separável"},
    {"de": "Ich frühstücke um 7 Uhr.", "pt": "Eu tomo café às 7h.", "note": "frühstücken — regular"},
    {"de": "Ich bringe meine Kinder zur Schule.", "pt": "Eu levo meus filhos à escola.", "note": "bringen — levar"},
    {"de": "Ich fange um 9 Uhr an zu arbeiten.", "pt": "Eu começo a trabalhar às 9h.", "note": "anfangen — separável"},
    {"de": "Ich esse um 12 Uhr zu Mittag.", "pt": "Eu almoço ao meio-dia.", "note": "zu Mittag essen"},
    {"de": "Ich hole meine Kinder von der Schule ab.", "pt": "Eu busco meus filhos na escola.", "note": "abholen — separável"},
    {"de": "Ich koche das Abendessen.", "pt": "Eu preparo o jantar.", "note": "kochen — cozinhar"},
    {"de": "Ich gehe um 22:30 schlafen.", "pt": "Eu durmo às 22h30.", "note": "schlafen gehen"}
  ]'::jsonb,
  '[
    {"de": "Morgen", "pt": "manhã / amanhã"},
    {"de": "Mittag", "pt": "meio-dia"},
    {"de": "Nachmittag", "pt": "tarde"},
    {"de": "Abend", "pt": "noite (início)"},
    {"de": "Nacht", "pt": "madrugada / noite (tarde)"},
    {"de": "heute", "pt": "hoje"},
    {"de": "morgen", "pt": "amanhã"},
    {"de": "gestern", "pt": "ontem"},
    {"de": "jeden Tag", "pt": "todos os dias"}
  ]'::jsonb,
  '["Morgen = manhã E amanhã — contexto diferencia. ''Guten Morgen'' = bom dia. ''Bis morgen'' = até amanhã.", "zur Schule (ir para a escola, movimento) vs. in der Schule (estar na escola, estático) — preposição muda!", "zu Mittag essen = almoçar. zu Abend essen = jantar. frühstücken = tomar café da manhã."]'::jsonb,
  true
)
ON CONFLICT (slug) DO UPDATE SET
  summary_pt = EXCLUDED.summary_pt, quick_rule_pt = EXCLUDED.quick_rule_pt,
  examples = EXCLUDED.examples, key_phrases = EXCLUDED.key_phrases,
  mini_notes = EXCLUDED.mini_notes, active = true;

INSERT INTO study_exercises (slug, lesson_slug, module_slug, level, sort_order, exercise_type, prompt_pt, answer, options, explanation_pt, xp_reward, active)
VALUES
('a1-cap7-ex1', 'a1-cap7-l1-horas', 'a1-cap7-rotina-horas', 'A1', 1, 'choose_option',
 '"halb zehn" em alemão significa:',
 '9:30', '["10:30", "10:15", "9:30", "9:45"]',
 'halb zehn = 9:30. "Metade do caminho até as 10". Esta é a maior armadilha das horas alemãs! Halb + próxima hora, não a hora atual.',
 10, true),

('a1-cap7-ex2', 'a1-cap7-l1-horas', 'a1-cap7-rotina-horas', 'A1', 2, 'free_answer',
 'Como se diz "São oito e quinze" em alemão?',
 'Es ist Viertel nach acht.',
 null,
 'Viertel nach = e quinze (um quarto depois). Viertel vor = menos quinze. nach = depois de, vor = antes de.',
 15, true),

('a1-cap7-ex3', 'a1-cap7-l2-rotina', 'a1-cap7-rotina-horas', 'A1', 3, 'free_answer',
 'Traduza sua rotina: "Eu acordo às 6h. Eu levo meus filhos à escola às 8h."',
 'Ich wache um 6 Uhr auf. Ich bringe meine Kinder um 8 Uhr zur Schule.',
 null,
 'aufwachen (separável): wache... auf. bringen: bringe (regular). zur Schule = à escola (zur = zu + der, dativo).',
 25, true),

('a1-cap7-ex4', 'a1-cap7-l2-rotina', 'a1-cap7-rotina-horas', 'A1', 4, 'choose_option',
 'Como se diz "Eu busco meus filhos na escola" (abholen)?',
 'Ich hole meine Kinder von der Schule ab.',
 '["Ich abhole meine Kinder von der Schule.", "Ich hole ab meine Kinder von der Schule.", "Ich hole meine Kinder von der Schule ab.", "Ich hole meine Kinder ab von der Schule."]',
 'Separável: "hole" fica na 2ª posição, "ab" vai para o FINAL. von der Schule = da escola (dativo).',
 15, true)
ON CONFLICT (slug) DO UPDATE SET
  prompt_pt = EXCLUDED.prompt_pt, answer = EXCLUDED.answer,
  options = EXCLUDED.options, explanation_pt = EXCLUDED.explanation_pt, active = true;

-- ============================================================
-- CAP. 8 — Casa, Comida e Bebida
-- ============================================================

INSERT INTO study_modules (slug, level, chapter_number, title_pt, title_de, focus, active, sort_order)
VALUES (
  'a1-cap8-casa-comida', 'A1', 8,
  'Casa, Comida e Bebida',
  'Haus, Essen und Trinken',
  'Cômodos, móveis, alimentos essenciais, verbos de cozinha, pedir comida',
  true, 80
) ON CONFLICT (slug) DO UPDATE SET
  title_pt = EXCLUDED.title_pt, focus = EXCLUDED.focus, active = true;

INSERT INTO study_lessons (slug, module_slug, level, sort_order, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, active)
VALUES
(
  'a1-cap8-l1-comodos', 'a1-cap8-casa-comida', 'A1', 1,
  'Cômodos e móveis da casa',
  'Zimmer und Möbel',
  'Em alemão, os nomes de cômodos são palavras compostas com -zimmer (quarto/sala). O gênero é sempre das (neutro) para os -zimmer.',
  'Cômodos com -zimmer são sempre das (neutro): das Wohnzimmer, das Schlafzimmer, das Kinderzimmer. Exceção: die Küche (cozinha).',
  '[
    {"de": "das Wohnzimmer", "pt": "a sala de estar", "note": "wohn = morar + zimmer = quarto"},
    {"de": "die Küche", "pt": "a cozinha", "note": "feminino — exceção"},
    {"de": "das Schlafzimmer", "pt": "o quarto de dormir", "note": "schlafen = dormir"},
    {"de": "das Badezimmer / Bad", "pt": "o banheiro", "note": ""},
    {"de": "das Arbeitszimmer", "pt": "o escritório", "note": "Arbeit = trabalho"},
    {"de": "das Kinderzimmer", "pt": "o quarto das crianças", "note": "Kind = criança"},
    {"de": "der Balkon", "pt": "a varanda", "note": "masculino"},
    {"de": "das Sofa / die Couch", "pt": "o sofá", "note": ""},
    {"de": "der Kühlschrank", "pt": "a geladeira", "note": "kühl = frio + Schrank = armário"},
    {"de": "die Tastatur", "pt": "o teclado", "note": ""},
    {"de": "der Bildschirm", "pt": "o monitor", "note": "Bild = imagem + Schirm = tela"}
  ]'::jsonb,
  '[
    {"de": "Im Wohnzimmer ist das Sofa.", "pt": "Na sala está o sofá."},
    {"de": "Ich arbeite im Arbeitszimmer.", "pt": "Eu trabalho no escritório."},
    {"de": "Mein Computer ist im Arbeitszimmer.", "pt": "Meu computador está no escritório."},
    {"de": "Die Küche ist sehr groß.", "pt": "A cozinha é muito grande."}
  ]'::jsonb,
  '["Palavras compostas: o ÚLTIMO elemento define o gênero. Kühlschrank (der Schrank = armário) → der Kühlschrank.", "im = in + dem (dativo): estático. ''Im Zimmer'' = no quarto (estou lá). ''Ins Zimmer'' = para o quarto (vou até lá).", "Maus (die) = mouse do computador E rato (animal) — mesma palavra, mesmo artigo!"]'::jsonb,
  true
),
(
  'a1-cap8-l2-comida', 'a1-cap8-casa-comida', 'A1', 2,
  'Comida, bebida e verbos de cozinha',
  'Essen, Trinken und Kochen',
  'Vocabulário essencial de comidas e bebidas para supermercado, restaurante e cozinha em casa.',
  'Pedir comida: "Ich möchte..." (gostaria de). No restaurante: "Die Rechnung, bitte!" (A conta, por favor!). "Zahlen, bitte!" (Quero pagar!)',
  '[
    {"de": "das Wasser", "pt": "a água", "note": "neutro"},
    {"de": "die Milch", "pt": "o leite", "note": "feminino"},
    {"de": "der Kaffee", "pt": "o café", "note": "masculino"},
    {"de": "das Brot", "pt": "o pão", "note": "neutro"},
    {"de": "der Käse", "pt": "o queijo", "note": "masculino"},
    {"de": "das Ei", "pt": "o ovo", "note": "neutro — plural: die Eier"},
    {"de": "der Reis", "pt": "o arroz", "note": "masculino"},
    {"de": "die Nudeln", "pt": "o macarrão", "note": "feminino, plural"},
    {"de": "das Hähnchen", "pt": "o frango", "note": "neutro — -chen = neutro"},
    {"de": "Ich koche das Abendessen.", "pt": "Eu preparo o jantar.", "note": "kochen = cozinhar"},
    {"de": "Ich schneide die Zwiebel.", "pt": "Eu corto a cebola.", "note": "schneiden = cortar"},
    {"de": "Ich backe einen Kuchen.", "pt": "Eu asso um bolo.", "note": "backen = assar"}
  ]'::jsonb,
  '[
    {"de": "Ich möchte einen Kaffee, bitte.", "pt": "Eu gostaria de um café, por favor."},
    {"de": "Die Rechnung, bitte!", "pt": "A conta, por favor!"},
    {"de": "Was empfehlen Sie?", "pt": "O que o senhor/a senhora recomenda?"},
    {"de": "Ich bin Vegetarierin.", "pt": "Eu sou vegetariana."},
    {"de": "Ohne Zwiebeln, bitte.", "pt": "Sem cebola, por favor."},
    {"de": "Es hat gut geschmeckt!", "pt": "Estava delicioso!"}
  ]'::jsonb,
  '["Pão: das Brot (pão inteiro). das Brötchen (pãozinho) — -chen = neutro sempre!", "Zahlen, bitte! = forma mais direta para pedir a conta. Mais informal que ''Die Rechnung, bitte!''", "Lecker! = gostoso/delicioso — palavra mais usada pelos alemães para elogiar comida."]'::jsonb,
  true
)
ON CONFLICT (slug) DO UPDATE SET
  summary_pt = EXCLUDED.summary_pt, quick_rule_pt = EXCLUDED.quick_rule_pt,
  examples = EXCLUDED.examples, key_phrases = EXCLUDED.key_phrases,
  mini_notes = EXCLUDED.mini_notes, active = true;

INSERT INTO study_exercises (slug, lesson_slug, module_slug, level, sort_order, exercise_type, prompt_pt, answer, options, explanation_pt, xp_reward, active)
VALUES
('a1-cap8-ex1', 'a1-cap8-l1-comodos', 'a1-cap8-casa-comida', 'A1', 1, 'choose_option',
 'Qual é o artigo de "Schlafzimmer" (quarto de dormir)?',
 'das', '["der", "die", "das", "ein"]',
 'Cômodos com -zimmer são SEMPRE das (neutro): das Wohnzimmer, das Schlafzimmer, das Kinderzimmer, das Badezimmer.',
 10, true),

('a1-cap8-ex2', 'a1-cap8-l2-comida', 'a1-cap8-casa-comida', 'A1', 2, 'free_answer',
 'Você está no restaurante. Peça: um café sem leite e a conta.',
 'Ich möchte einen Kaffee ohne Milch, bitte. Die Rechnung, bitte!',
 null,
 'möchte = gostaria (polido). einen Kaffee (acusativo masculino). ohne + acusativo = sem. Die Rechnung = a conta.',
 20, true),

('a1-cap8-ex3', 'a1-cap8-l1-comodos', 'a1-cap8-casa-comida', 'A1', 3, 'choose_option',
 '"Kühlschrank" (geladeira) é formado por:',
 'kühl (frio) + Schrank (armário)', '["Küche + Schrank", "kühl (frio) + Schrank (armário)", "kalt (frio) + Schrank", "Kühl + Zimmer"]',
 'Kühlschrank = kühl (frio/fresco) + Schrank (armário). O alemão adora criar palavras compostas descritivas assim!',
 10, true),

('a1-cap8-ex4', 'a1-cap8-l2-comida', 'a1-cap8-casa-comida', 'A1', 4, 'free_answer',
 'Liste 3 alimentos que você gosta usando "Ich mag...": pão, café e queijo.',
 'Ich mag Brot, Kaffee und Käse.',
 null,
 'mögen (gostar): ich mag (irregular). Após "mag", substantivos sem artigo. Brot, Kaffee, Käse são os alimentos.',
 15, true)
ON CONFLICT (slug) DO UPDATE SET
  prompt_pt = EXCLUDED.prompt_pt, answer = EXCLUDED.answer,
  options = EXCLUDED.options, explanation_pt = EXCLUDED.explanation_pt, active = true;

-- ============================================================
-- CAP. 9 — Perguntas Simples e Respostas
-- ============================================================

INSERT INTO study_modules (slug, level, chapter_number, title_pt, title_de, focus, active, sort_order)
VALUES (
  'a1-cap9-perguntas', 'A1', 9,
  'Perguntas Simples e Respostas',
  'Einfache Fragen und Antworten',
  'Palavras interrogativas (W-Fragen), perguntas sim/não, respostas úteis para sobrevivência',
  true, 90
) ON CONFLICT (slug) DO UPDATE SET
  title_pt = EXCLUDED.title_pt, focus = EXCLUDED.focus, active = true;

INSERT INTO study_lessons (slug, module_slug, level, sort_order, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, active)
VALUES
(
  'a1-cap9-l1-wfragen', 'a1-cap9-perguntas', 'A1', 1,
  'As perguntas-W (Fragewörter)',
  'W-Fragen',
  'As perguntas com palavras interrogativas (W-Fragen) começam com wer, was, wo, wann, warum, wie, welcher... O verbo sempre vem logo depois.',
  'Ordem nas perguntas-W: Palavra interrogativa + VERBO + sujeito + resto. "Wo wohnst du?" NÃO "Wo du wohnst?"',
  '[
    {"de": "Wer ist das?", "pt": "Quem é esse/essa?", "note": "wer = quem"},
    {"de": "Was ist das?", "pt": "O que é isso?", "note": "was = o quê"},
    {"de": "Wo wohnst du?", "pt": "Onde você mora?", "note": "wo = onde (estático)"},
    {"de": "Wohin gehst du?", "pt": "Para onde você vai?", "note": "wohin = para onde (movimento)"},
    {"de": "Woher kommst du?", "pt": "De onde você é?", "note": "woher = de onde"},
    {"de": "Wann kommst du?", "pt": "Quando você vem?", "note": "wann = quando"},
    {"de": "Warum lernst du Deutsch?", "pt": "Por que você aprende alemão?", "note": "warum = por quê"},
    {"de": "Wie geht es dir?", "pt": "Como você está?", "note": "wie = como"},
    {"de": "Wie viel kostet das?", "pt": "Quanto custa isso?", "note": "wie viel = quanto"},
    {"de": "Wie viele Kinder hast du?", "pt": "Quantos filhos você tem?", "note": "wie viele = quantos"}
  ]'::jsonb,
  '[
    {"de": "Wo ist die Toilette?", "pt": "Onde fica o banheiro?"},
    {"de": "Wann fährt der nächste Zug?", "pt": "Quando parte o próximo trem?"},
    {"de": "Warum lernen Sie Deutsch?", "pt": "Por que o senhor/a senhora aprende alemão?"},
    {"de": "Was machen Sie beruflich?", "pt": "O que o senhor/a senhora faz profissionalmente?"}
  ]'::jsonb,
  '["Wo = onde estático. Wohin = para onde (movimento). Woher = de onde (origem). Os três vêm de ''wo'' (onde).", "Wessen = de quem (possessão). Welcher/welche/welches = qual (concordam com o substantivo).", "wie viel (não contável): Wie viel Milch? / wie viele (contável): Wie viele Kinder?"]'::jsonb,
  true
),
(
  'a1-cap9-l2-simnao', 'a1-cap9-perguntas', 'A1', 2,
  'Perguntas Sim/Não e respostas de sobrevivência',
  'Ja/Nein-Fragen und Überlebensantworten',
  'Perguntas de sim/não invertem a ordem: verbo vem antes do sujeito. São essenciais para situações reais.',
  'Pergunta sim/não: VERBO + sujeito + resto. "Bist du müde?" (Você está cansado?). Afirmação: sujeito + verbo + resto.',
  '[
    {"de": "Sprichst du Deutsch?", "pt": "Você fala alemão?", "note": "Sim: Ja, ich spreche Deutsch. Não: Nein."},
    {"de": "Haben Sie ein Zimmer frei?", "pt": "Tem um quarto disponível?", "note": "hotel"},
    {"de": "Nehmen Sie Karte?", "pt": "Aceitam cartão?", "note": "pagamento"},
    {"de": "Ist das vegetarisch?", "pt": "Isso é vegetariano?", "note": "restaurante"},
    {"de": "Kann ich helfen?", "pt": "Posso ajudar?", "note": "oferta de ajuda"},
    {"de": "Ich verstehe nicht.", "pt": "Eu não entendo.", "note": "essencial!"},
    {"de": "Können Sie das wiederholen?", "pt": "Pode repetir?", "note": "formal"},
    {"de": "Langsamer, bitte!", "pt": "Mais devagar, por favor!", "note": ""},
    {"de": "Wie sagt man das auf Deutsch?", "pt": "Como se diz isso em alemão?", "note": ""},
    {"de": "Ich lerne noch Deutsch.", "pt": "Eu ainda estou aprendendo alemão.", "note": ""}
  ]'::jsonb,
  '[
    {"de": "Ja. / Genau! / Richtig!", "pt": "Sim. / Exatamente! / Correto!"},
    {"de": "Nein. / Leider nicht.", "pt": "Não. / Infelizmente não."},
    {"de": "Vielleicht.", "pt": "Talvez."},
    {"de": "Ich weiß nicht.", "pt": "Eu não sei."},
    {"de": "Keine Ahnung!", "pt": "Sem ideia!"},
    {"de": "Wie bitte?", "pt": "Como disse? (pedir repetição, educado)"}
  ]'::jsonb,
  '["''Wie bitte?'' é a forma mais educada de pedir uma repetição — literalmente ''Como, por favor?''", "''Leider'' (infelizmente) é muito usado em respostas negativas educadas em e-mails e conversas formais.", "Dica de ouro: ''Ich spreche noch nicht so gut Deutsch'' (Ainda não falo alemão tão bem) abre portas — alemães adoram quando você tenta!"]'::jsonb,
  true
)
ON CONFLICT (slug) DO UPDATE SET
  summary_pt = EXCLUDED.summary_pt, quick_rule_pt = EXCLUDED.quick_rule_pt,
  examples = EXCLUDED.examples, key_phrases = EXCLUDED.key_phrases,
  mini_notes = EXCLUDED.mini_notes, active = true;

INSERT INTO study_exercises (slug, lesson_slug, module_slug, level, sort_order, exercise_type, prompt_pt, answer, options, explanation_pt, xp_reward, active)
VALUES
('a1-cap9-ex1', 'a1-cap9-l1-wfragen', 'a1-cap9-perguntas', 'A1', 1, 'choose_option',
 'Qual palavra usar para "de onde?":',
 'Woher', '["Wo", "Wohin", "Woher", "Wann"]',
 'Wo = onde (estático). Wohin = para onde (movimento). Woher = de onde (origem). "Woher kommst du?" = De onde você é?',
 10, true),

('a1-cap9-ex2', 'a1-cap9-l2-simnao', 'a1-cap9-perguntas', 'A1', 2, 'free_answer',
 'Transforme em pergunta: "Du heißt Rebeca." → ?',
 'Heißt du Rebeca?',
 null,
 'Pergunta sim/não: verbo vai para o início. "Du heißt" → "Heißt du?" O sujeito vai depois do verbo.',
 15, true),

('a1-cap9-ex3', 'a1-cap9-l1-wfragen', 'a1-cap9-perguntas', 'A1', 3, 'free_answer',
 'Forme 3 perguntas usando: wer, was, wo — sobre você mesma.',
 'Wer bist du? Was machst du beruflich? Wo wohnst du?',
 null,
 'Qualquer pergunta válida com as 3 palavras é correta. Estrutura: W-Wort + Verb + Subjekt.',
 25, true),

('a1-cap9-ex4', 'a1-cap9-l2-simnao', 'a1-cap9-perguntas', 'A1', 4, 'choose_option',
 'Como pedir educadamente para repetir algo em alemão?',
 'Wie bitte?', '["Was?", "Hä?", "Wie bitte?", "Nochmal!"]',
 '"Wie bitte?" é a forma mais educada de pedir repetição. "Hä?" e "Was?" são muito informais/rudes em contextos formais.',
 10, true),

('a1-cap9-ex5', 'a1-cap9-l2-simnao', 'a1-cap9-perguntas', 'A1', 5, 'free_answer',
 'Escreva em alemão: "Eu não entendo. Pode falar mais devagar, por favor?"',
 'Ich verstehe nicht. Können Sie langsamer sprechen, bitte?',
 null,
 'Ich verstehe nicht = eu não entendo. Können Sie = pode o senhor/a senhora (modal formal). langsamer = mais devagar.',
 20, true)
ON CONFLICT (slug) DO UPDATE SET
  prompt_pt = EXCLUDED.prompt_pt, answer = EXCLUDED.answer,
  options = EXCLUDED.options, explanation_pt = EXCLUDED.explanation_pt, active = true;

-- ============================================================
-- CAP. 10 — Revisão A1 + Simulado
-- ============================================================

INSERT INTO study_modules (slug, level, chapter_number, title_pt, title_de, focus, active, sort_order)
VALUES (
  'a1-cap10-revisao', 'A1', 10,
  'Revisão A1 + Simulado',
  'A1 Wiederholung und Prüfung',
  'Revisão completa de todos os tópicos A1, autoavaliação e simulado de prova',
  true, 100
) ON CONFLICT (slug) DO UPDATE SET
  title_pt = EXCLUDED.title_pt, focus = EXCLUDED.focus, active = true;

INSERT INTO study_lessons (slug, module_slug, level, sort_order, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, active)
VALUES
(
  'a1-cap10-l1-revisao', 'a1-cap10-revisao', 'A1', 1,
  'Revisão completa do nível A1',
  'Vollständige A1 Wiederholung',
  'Resumo de tudo que você precisa saber para passar no A1: cumprimentos, números, pronomes, sein, artigos, verbos, família, horas, casa e perguntas.',
  'Para o A1 você precisa: apresentar-se, contar até 100, conjugar sein e haben, usar artigos, descrever rotina e fazer perguntas básicas.',
  '[
    {"de": "Ich heiße Rebeca. Ich bin Webentwicklerin aus Brasilien.", "pt": "Apresentação completa.", "note": "Cap. 1"},
    {"de": "Ich bin dreißig Jahre alt und habe zwei Kinder.", "pt": "Idade e família.", "note": "Cap. 2 e 6"},
    {"de": "Mein Sohn ist zwölf und meine Tochter ist sechs.", "pt": "Números na vida real.", "note": "Cap. 2"},
    {"de": "Ich stehe um 6:30 auf und frühstücke mit meinen Kindern.", "pt": "Rotina com separáveis.", "note": "Cap. 5 e 7"},
    {"de": "Wo ist der Bahnhof? — Er ist geradeaus.", "pt": "Perguntar e responder direções.", "note": "Cap. 9"},
    {"de": "Ich möchte einen Kaffee ohne Milch, bitte.", "pt": "Pedido no restaurante/café.", "note": "Cap. 8 e 9"},
    {"de": "Meine Katze heißt Madalena. Sie ist schwarz und faul.", "pt": "Descrever animais de estimação.", "note": "Cap. 4 e 6"}
  ]'::jsonb,
  '[
    {"de": "Ich bin...", "pt": "Eu sou/estou... (sein)"},
    {"de": "Ich habe...", "pt": "Eu tenho... (haben)"},
    {"de": "Ich möchte...", "pt": "Eu gostaria de... (pedido educado)"},
    {"de": "Können Sie...?", "pt": "Pode o senhor/a senhora...? (modal formal)"},
    {"de": "Wie viel kostet...?", "pt": "Quanto custa...?"},
    {"de": "Wo ist...?", "pt": "Onde fica...?"}
  ]'::jsonb,
  '["CHECKLIST A1: 1) Apresentar-se em 1 minuto ✓ 2) Contar 1–100 ✓ 3) sein e haben conjugados ✓ 4) Artigos de 20 substantivos ✓ 5) Rotina diária ✓ 6) Perguntas básicas ✓", "Se você marcou 4+ sim na autoavaliação: PRONTO PARA O A2!", "Dica final: mude seu jogo favorito para alemão. The Sims 4 em alemão = schlafen, hunger, arbeit, duschen no contexto real!"]'::jsonb,
  true
)
ON CONFLICT (slug) DO UPDATE SET
  summary_pt = EXCLUDED.summary_pt, quick_rule_pt = EXCLUDED.quick_rule_pt,
  examples = EXCLUDED.examples, key_phrases = EXCLUDED.key_phrases,
  mini_notes = EXCLUDED.mini_notes, active = true;

INSERT INTO study_exercises (slug, lesson_slug, module_slug, level, sort_order, exercise_type, prompt_pt, answer, options, explanation_pt, xp_reward, active)
VALUES
('a1-cap10-ex1', 'a1-cap10-l1-revisao', 'a1-cap10-revisao', 'A1', 1, 'free_answer',
 'SIMULADO — Texto: Leia e responda: "Ich heiße Laura und ich bin 28 Jahre alt. Ich komme aus Brasilien, aber ich wohne jetzt in Berlin. Ich bin Webentwicklerin. Ich habe eine Tochter. Sie ist 5 Jahre alt." — Quantos anos tem a filha de Laura?',
 'Sie ist fünf Jahre alt. / 5 Jahre alt.',
 null,
 'A resposta está no texto: "Sie ist 5 Jahre alt." = Ela tem 5 anos. fünf = 5.',
 15, true),

('a1-cap10-ex2', 'a1-cap10-l1-revisao', 'a1-cap10-revisao', 'A1', 2, 'choose_option',
 'SIMULADO — "Ich möchte ___ Ticket nach München kaufen." (um = masculino, acusativo)',
 'ein', '["ein", "eine", "einen", "der"]',
 'Ticket = das (neutro) → acusativo neutro = ein (sem mudança). Se fosse der Zug: einen Zug.',
 10, true),

('a1-cap10-ex3', 'a1-cap10-l1-revisao', 'a1-cap10-revisao', 'A1', 3, 'free_answer',
 'SIMULADO ESCRITA — Escreva 5 frases se apresentando: nome, idade, origem, profissão e família.',
 'Ich heiße Rebeca. Ich bin dreißig Jahre alt. Ich komme aus Brasilien. Ich bin Webentwicklerin. Ich habe zwei Kinder.',
 null,
 'Apresentação A1 padrão. Qualquer variação válida conta. Verifique: sem artigo após sein + profissão, komme aus + país.',
 30, true),

('a1-cap10-ex4', 'a1-cap10-l1-revisao', 'a1-cap10-revisao', 'A1', 4, 'choose_option',
 'SIMULADO — Qual frase está ERRADA?',
 'Ich bin eine Brasilianerin.', '["Ich wohne in Salvador.", "Ich bin eine Brasilianerin.", "Meine Katze heißt Madalena.", "Haben Sie ein Zimmer frei?"]',
 'ERRADO: "Ich bin eine Brasilianerin." — profissões e nacionalidades após sein NÃO levam artigo. Correto: "Ich bin Brasilianerin."',
 15, true),

('a1-cap10-ex5', 'a1-cap10-l1-revisao', 'a1-cap10-revisao', 'A1', 5, 'free_answer',
 'SIMULADO FINAL — Descreva seu dia típico em 4 frases usando verbos separáveis e horas.',
 'Ich stehe um 6:30 auf. Ich bringe meine Kinder um 8 Uhr zur Schule. Ich fange um 9 Uhr an zu arbeiten. Ich gehe um 22:30 schlafen.',
 null,
 'Qualquer rotina válida com verbos separáveis corretos. Verifique o prefixo no final: auf, ab, an, ein devem ir para o fim da frase.',
 35, true)
ON CONFLICT (slug) DO UPDATE SET
  prompt_pt = EXCLUDED.prompt_pt, answer = EXCLUDED.answer,
  options = EXCLUDED.options, explanation_pt = EXCLUDED.explanation_pt, active = true;

-- ============================================================
-- FIM DO ARQUIVO
-- Total: 10 módulos, 23 lições, 40 exercícios
-- ============================================================
