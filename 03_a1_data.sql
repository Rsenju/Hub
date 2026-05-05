-- =====================================================
-- DEUTSCH HUB — 03_a1_data.sql
-- Módulos A1 Capítulos 1-20 + Prova Final
-- Execute após 02_tables.sql e 06_rls.sql
-- =====================================================

-- ══════════════════════════════════════════════════
-- BLOCO 1 — Limpar dados existentes
-- ══════════════════════════════════════════════════
DELETE FROM study_exercises;
DELETE FROM study_lessons;
DELETE FROM study_modules;
DELETE FROM flashcards_v2;

-- ══════════════════════════════════════════════════
-- BLOCO 2 — study_modules A1 (20 capítulos + exam)
-- ══════════════════════════════════════════════════
INSERT INTO study_modules (slug, level, chapter_number, title_pt, title_de, focus, sort_order, active)
VALUES
('a1-cap1', 'A1', 1, 'Saudações, Alfabeto e Primeiros Verbos', 'Hallo! — Begrüßungen und erste Verben', 'Cumprimentar, apresentar-se, conjugação básica de sein e heißen.', 10, true),
('a1-cap2', 'A1', 2, 'Família, Números e Pronomes', 'Wer bin ich? — Familie und Zahlen', 'Membros da família, números 1-100, pronomes possessivos mein/dein.', 20, true),
('a1-cap3', 'A1', 3, 'Hobbies, Cores e Verbos Regulares', 'Hobbys und Farben — Regelmäßige Verben', 'Hobbies, cores, verbos regulares no presente, uso de gern.', 30, true),
('a1-cap4', 'A1', 4, 'No Supermercado — Acusativo e Comida', 'Im Supermarkt — Akkusativ und Lebensmittel', 'Artigos no acusativo, compras, vocabulário de alimentos.', 40, true),
('a1-cap5', 'A1', 5, 'Meu Dia — Rotina e Verbos Separáveis', 'Mein Tag — Tagesroutine und trennbare Verben', 'Rotina diária, horas, verbos separáveis aufstehen/anfangen.', 50, true),
('a1-cap6', 'A1', 6, 'Trabalho e Escritório — Profissões', 'Arbeit und Büro — Berufe', 'Profissões, gênero feminino -in, verbos do ambiente de trabalho.', 60, true),
('a1-cap7', 'A1', 7, 'Na Cidade — Localização e Preposições', 'In der Stadt — Ort und Präpositionen', 'Preposições de lugar (neben, zwischen, gegenüber), dar direções.', 70, true),
('a1-cap8', 'A1', 8, 'Clima e Lazer', 'Wetter und Freizeit', 'Vocabulário de clima, verbos impessoais com es, atividades ao ar livre.', 80, true),
('a1-cap9', 'A1', 9, 'Roupas e Compras', 'Kleidung und Einkaufen', 'Vocabulário de roupas, cores, compras em loja, verbo anprobieren.', 90, true),
('a1-cap10', 'A1', 10, 'Datas e Compromissos', 'Termine und Daten', 'Datas, meses, dias da semana, preposições de tempo am/um/im.', 100, true),
('a1-cap11', 'A1', 11, 'Minha Casa — Descrever Ambientes', 'Zuhause — Wohnung beschreiben', 'Descrever a casa, vocabulário de ambientes, estrutura es gibt.', 110, true),
('a1-cap12', 'A1', 12, 'Viagens — Transportes e Destinos', 'Reisen — Verkehrsmittel und Ziele', 'Viagens, meios de transporte, verbos fahren/fliegen, preposição nach.', 120, true),
('a1-cap13', 'A1', 13, 'No Restaurante — Pedir Comida', 'Im Restaurant — Bestellen', 'Pedir comida e bebida, verbo möchten, acusativo no restaurante.', 130, true),
('a1-cap14', 'A1', 14, 'Sentimentos e Estados', 'Gefühle und Zustände', 'Expressar sentimentos, sein + adjetivo, sensações físicas tun weh.', 140, true),
('a1-cap15', 'A1', 15, 'Descrever — Adjetivos', 'Beschreiben — Adjektive', 'Adjetivos para descrever pessoas e objetos, verbo aussehen.', 150, true),
('a1-cap16', 'A1', 16, 'Verbos Importantes — Comunicação', 'Wichtige Verben — Kommunikation', 'Verbos irregulares essenciais: sein, haben, essen, sprechen.', 160, true),
('a1-cap17', 'A1', 17, 'Dativo no Dia a Dia', 'Dativ im Alltag', 'Introdução ao dativo com preposições mit, zu, von.', 170, true),
('a1-cap18', 'A1', 18, 'Fazer Perguntas', 'Fragen stellen', 'Perguntas com W-Fragen e Ja/Nein-Fragen para sustentar diálogos.', 180, true),
('a1-cap19', 'A1', 19, 'Meu Primeiro Diálogo Completo', 'Mein erstes Gespräch', 'Construção de diálogo completo: apresentação, pedidos, direções.', 190, true),
('a1-cap20', 'A1', 20, 'Revisão Final A1', 'A1 Abschluss — Wiederholung', 'Revisão geral com exercícios integrados de vocabulário e gramática.', 200, true),
('a1-exam', 'A1', 99, 'Prova Final A1', 'A1 Abschlussprüfung', 'Avaliação completa: Hören, Lesen, Schreiben, Sprechen, Grammatik.', 999, true)
ON CONFLICT (slug) DO UPDATE SET
title_pt = EXCLUDED.title_pt,
title_de = EXCLUDED.title_de,
focus = EXCLUDED.focus,
sort_order = EXCLUDED.sort_order,
active = true,
updated_at = now();

-- ══════════════════════════════════════════════════
-- BLOCO 3 — study_lessons (CAPÍTULOS 1-5)
-- ══════════════════════════════════════════════════
INSERT INTO study_lessons
(module_slug, slug, level, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, sort_order, active)
VALUES
-- ══════════════════════════════════════════════════
-- CAPÍTULO 1: Hallo! – Begrüßungen und erste Gespräche
-- ══════════════════════════════════════════════════
('a1-cap1','a1-l1-1','A1','Diálogo: Anna e Ben se conhecem','Dialog: Anna und Ben',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Anna: Hallo! Guten Morgen!  
Ben: Guten Morgen! Wie heißt du?  
Anna: Ich heiße Anna. Und du?  
Ben: Ich bin Ben. Freut mich, Anna!  
Anna: Freut mich auch! Woher kommst du, Ben?  
Ben: Ich komme aus Berlin. Und du?  
Anna: Ich komme aus München. Sprichst du Deutsch?  
Ben: Ja, ein bisschen. Und du?  
Anna: Ja, ich spreche Deutsch. Wie geht es dir?  
Ben: Danke, gut! Und dir?  
Anna: Mir geht es auch gut, danke!  
Ben: Anna, wie alt bist du?  
Anna: Ich bin 25 Jahre alt. Und du?  
Ben: Ich bin 28. Bist du Studentin?  
Anna: Ja, ich studiere Medizin. Und du, Ben?  
Ben: Ich arbeite in einem Büro.  
Anna: Sehr interessant!  
Ben: Anna, möchtest du Kaffee trinken?  
Anna: Ja, gerne!  
Ben: Super! Dann gehen wir ins Café.  
Anna: Perfekt! Auf Wiedersehen, Leute!  
Ben: Tschüss! Bis später!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Anna: Olá! Bom dia!  
Ben: Bom dia! Como você se chama?  
Anna: Eu me chamo Anna. E você?  
Ben: Eu sou Ben. Prazer, Anna!  
Anna: Prazer também! De onde você é, Ben?  
Ben: Eu sou de Berlim. E você?  
Anna: Eu sou de Munique. Você fala alemão?  
Ben: Sim, um pouco. E você?  
Anna: Sim, eu falo alemão. Como vai você?  
Ben: Obrigado, bem! E você?  
Anna: Eu também estou bem, obrigada!  
Ben: Anna, quantos anos você tem?  
Anna: Eu tenho 25 anos. E você?  
Ben: Eu tenho 28. Você é estudante?  
Anna: Sim, eu estudo medicina. E você, Ben?  
Ben: Eu trabalho em um escritório.  
Anna: Muito interessante!  
Ben: Anna, você gostaria de tomar café?  
Anna: Sim, com prazer!  
Ben: Ótimo! Então vamos ao café.  
Anna: Perfeito! Tchau, pessoal!  
Ben: Tchau! Até mais!','Use blocos prontos para se apresentar: Ich heiße + nome | Ich komme aus + lugar | Ich spreche + língua',
'[{ "de": "Ich heiße Anna. Und du?", "pt": "Eu me chamo Anna. E você?", "note": "apresentação" },
{ "de": "Ich komme aus Berlin.", "pt": "Eu sou de Berlim.", "note": "origem" },
{ "de": "Ich spreche Deutsch.", "pt": "Eu falo alemão.", "note": "língua" },
{ "de": "Wie geht es dir? - Danke, gut!", "pt": "Como vai você? - Obrigado, bem!", "note": "saudação" }]'::jsonb,
'[{ "de": "hallo", "pt": "olá" },
{ "de": "guten Morgen", "pt": "bom dia" },
{ "de": "guten Tag", "pt": "boa tarde" },
{ "de": "guten Abend", "pt": "boa noite (saudação)" },
{ "de": "auf Wiedersehen", "pt": "adeus / até logo" },
{ "de": "tschüss", "pt": "tchau (informal)" },
{ "de": "wie heißt du?", "pt": "como você se chama?" },
{ "de": "ich heiße...", "pt": "eu me chamo..." },
{ "de": "ich bin...", "pt": "eu sou/estou..." },
{ "de": "freut mich", "pt": "prazer / estou feliz" },
{ "de": "woher?", "pt": "de onde?" },
{ "de": "ich komme aus...", "pt": "eu venho de..." },
{ "de": "wie geht es dir?", "pt": "como vai você?" },
{ "de": "danke, gut", "pt": "obrigado, bem" },
{ "de": "und dir?", "pt": "e você?" },
{ "de": "wie alt?", "pt": "quantos anos?" },
{ "de": "Jahre alt", "pt": "anos de idade" },
{ "de": "Student / Studentin", "pt": "estudante (m/f)" },
{ "de": "arbeiten", "pt": "trabalhar" },
{ "de": "das Büro", "pt": "o escritório" },
{ "de": "studieren", "pt": "estudar (nível superior)" },
{ "de": "Medizin", "pt": "medicina" },
{ "de": "Kaffee", "pt": "café" },
{ "de": "trinken", "pt": "beber" },
{ "de": "gerne", "pt": "com prazer" },
{ "de": "ins Café", "pt": "ao café" },
{ "de": "bis später", "pt": "até mais tarde" },
{ "de": "ja / nein", "pt": "sim / não" },
{ "de": "ein bisschen", "pt": "um pouco" },
{ "de": "sehr", "pt": "muito" }]'::jsonb,
'["Formal = Sie + cumprimento completo. Informal = du + versão curta.",
"Guten Tag serve manhã e tarde.",
"Moin Moin = cumprimento do norte da Alemanha, qualquer hora."]'::jsonb,
1,true),

('a1-cap1','a1-l1-2','A1','Verbos sein e heißen + Pronomes','Verben „sein" und „heißen" + Personalpronomen',
'No nível A1, os verbos sein (ser/estar) e heißen (chamar-se) são fundamentais para apresentações.','Terminações: ich -e | du -st | er/sie/es -t | wir -en | ihr -t | sie/Sie -en. Sein e heißen: decorar!',
'[{ "de": "Ich heiße Ben.", "pt": "Eu me chamo Ben.", "note": "1ª pessoa" },
{ "de": "Wie heißt du?", "pt": "Como você se chama?", "note": "2ª pessoa" },
{ "de": "Sie heißt Anna.", "pt": "Ela se chama Anna.", "note": "3ª pessoa" },
{ "de": "Ich bin Anna.", "pt": "Eu sou Anna.", "note": "sein - 1ª pessoa" },
{ "de": "Du bist nett.", "pt": "Você é legal.", "note": "sein - 2ª pessoa" },
{ "de": "Er ist aus Berlin.", "pt": "Ele é de Berlim.", "note": "sein - 3ª pessoa" }]'::jsonb,
'[]'::jsonb,
'["CONJUGAÇÃO DO VERBO SEIN (ser/estar):",
"ich bin | du bist | er/sie/es ist | wir sind | ihr seid | sie sind",
"",
"CONJUGAÇÃO DO VERBO HEIßEN (chamar-se):",
"ich heiße | du heißt | er/sie/es heißt | wir heißen | ihr heißt | sie/Sie heißen",
"",
"PRONOMES PESSOAIS (Nominativ):",
"ich = eu | du = você (informal) | er/sie/es = ele/ela/isso",
"wir = nós | ihr = vocês (informal) | sie/Sie = eles/elas / o(a) senhor(a)",
"",
"DICA: Na Alemanha, use Sie (com S maiúsculo) para pessoas que você não conhece bem,",
"superiores ou em situações formais. Use du com amigos, família e crianças."]'::jsonb,
2,true),

('a1-cap1','a1-l1-3','A1','Cultura: Saudações & Etiqueta Social','Kultur: Begrüßungen & Etikette',
'Na Baviera, as pessoas dizem "Grüß Gott" em vez de "Hallo". No norte, "Moin Moin" é usado a qualquer hora. Os alemães são famosos pela pontualidade — chegar atrasado é falta de respeito! A Alemanha tem mais de 3.000 tipos de pão registrados.','Formal: Guten Tag! / Auf Wiedersehen! | Informal: Hallo! / Tschüss!',
'[{ "de": "Grüß Gott!", "pt": "Saudação típica da Baviera", "note": "regional" },
{ "de": "Moin Moin!", "pt": "Saudação do norte (qualquer hora)", "note": "regional" },
{ "de": "Pünktlichkeit ist wichtig!", "pt": "Pontualidade é importante!", "note": "cultura" }]'::jsonb,
'[]'::jsonb,
'["Saudações & Etiqueta Social na Alemanha:",
"",
"• Guten Tag vs. Hallo: Em lojas e repartições, prefira Guten Tag.",
"  Hallo é mais informal, entre amigos.",
"",
"• Aperto de mão: Ao se apresentar, é comum cumprimentar com",
"  aperto de mão firme e contato visual.",
"",
"• Títulos: Alemães valorizam títulos acadêmicos.",
"  Herr Dr. Schmidt ou Frau Professorin Meyer são formas respeitosas.",
"",
"• Pontualidade: Chegar no horário é sinal de respeito.",
"  5 minutos antes é o ideal.",
"",
"• Du ou Sie?: Na dúvida, comece com Sie. A outra pessoa pode",
"  oferecer o Du depois: Wir können uns duzen.",
"",
"• Curiosidade: A Alemanha tem mais de 3.000 tipos de pão registrados!"
,"INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 2: Wer bin ich? – Sich vorstellen und Familie
-- ══════════════════════════════════════════════════
('a1-cap2','a1-l2-1','A1','Diálogo: Lisa apresenta sua família','Dialog: Lisa stellt Familie vor',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Lisa: Hallo, ich bin Lisa. Ich bin 22 Jahre alt.  
Tom: Hi Lisa! Ich bin Tom. Wie geht es dir?  
Lisa: Danke, gut! Tom, das ist meine Familie.  
Tom: Sehr schön! Wer ist das?  
Lisa: Das ist meine Mutter. Sie heißt Petra. Sie ist 50 Jahre alt.  
Tom: Und wer ist der Mann?  
Lisa: Das ist mein Vater. Er heißt Michael. Er ist 52.  
Tom: Hast du Geschwister?  
Lisa: Ja, ich habe einen Bruder und eine Schwester.  
Tom: Wie heißen sie?  
Lisa: Mein Bruder heißt Lukas. Er ist 25. Meine Schwester heißt Emma. Sie ist 19.  
Tom: Und das Baby?  
Lisa: Das ist mein kleiner Bruder Max. Er ist 2 Jahre alt.  
Tom: Wie viele Personen sind in deiner Familie?  
Lisa: Wir sind sechs: Mutter, Vater, Lukas, Emma, Max und ich.  
Tom: Das ist eine große Familie! Ich habe nur eine Schwester.  
Lisa: Wie heißt sie?  
Tom: Sie heißt Sofia. Sie ist 20.  
Lisa: Wo wohnt deine Familie, Tom?  
Tom: Wir wohnen in Hamburg. Und du?  
Lisa: Ich wohne in Köln. Aber meine Eltern wohnen in Frankfurt.  
Tom: Interessant! Möchtest du Fotos sehen?  
Lisa: Ja, gerne! Zeig mal!  
Tom: Hier, das ist Sofia am Strand.  
Lisa: Oh, wie schön! Sie sieht nett aus.

---

**TRADUÇÃO EM PORTUGUÊS:**  
Lisa: Olá, eu sou Lisa. Tenho 22 anos.  
Tom: Oi Lisa! Eu sou Tom. Como vai você?  
Lisa: Obrigada, bem! Tom, esta é a minha família.  
Tom: Muito legal! Quem é essa?  
Lisa: Essa é a minha mãe. Ela se chama Petra. Ela tem 50 anos.  
Tom: E quem é o homem?  
Lisa: Esse é o meu pai. Ele se chama Michael. Ele tem 52.  
Tom: Você tem irmãos?  
Lisa: Sim, eu tenho um irmão e uma irmã.  
Tom: Como eles se chamam?  
Lisa: Meu irmão se chama Lukas. Ele tem 25. Minha irmã se chama Emma. Ela tem 19.  
Tom: E o bebê?  
Lisa: Esse é o meu irmãozinho Max. Ele tem 2 anos.  
Tom: Quantas pessoas há na sua família?  
Lisa: Somos seis: mãe, pai, Lukas, Emma, Max e eu.  
Tom: Essa é uma família grande! Eu só tenho uma irmã.  
Lisa: Como ela se chama?  
Tom: Ela se chama Sofia. Ela tem 20.  
Lisa: Onde mora a sua família, Tom?  
Tom: Nós moramos em Hamburgo. E você?  
Lisa: Eu moro em Colônia. Mas meus pais moram em Frankfurt.  
Tom: Interessante! Você gostaria de ver fotos?  
Lisa: Sim, com prazer! Mostra!  
Tom: Aqui, essa é Sofia na praia.  
Lisa: Ah, que lindo! Ela parece legal.','Possessivo segue o artigo indefinido: mein (masc/neutro), meine (fem/plural)',
'[{ "de": "Das ist meine Mutter.", "pt": "Esta é a minha mãe.", "note": "feminino" },
{ "de": "Das ist mein Vater.", "pt": "Este é o meu pai.", "note": "masculino" },
{ "de": "Ich habe einen Bruder.", "pt": "Tenho um irmão.", "note": "acusativo" },
{ "de": "Meine Eltern wohnen in Frankfurt.", "pt": "Meus pais moram em Frankfurt.", "note": "plural" }]'::jsonb,
'[{ "de": "die Familie", "pt": "a família" },
{ "de": "die Mutter", "pt": "a mãe" },
{ "de": "der Vater", "pt": "o pai" },
{ "de": "der Bruder", "pt": "o irmão" },
{ "de": "die Schwester", "pt": "a irmã" },
{ "de": "das Baby", "pt": "o bebê" },
{ "de": "der Sohn", "pt": "o filho" },
{ "de": "die Tochter", "pt": "a filha" },
{ "de": "die Eltern", "pt": "os pais" },
{ "de": "die Geschwister", "pt": "os irmãos (plural)" },
{ "de": "der Opa", "pt": "o vovô" },
{ "de": "die Oma", "pt": "a vovó" },
{ "de": "der Onkel", "pt": "o tio" },
{ "de": "die Tante", "pt": "a tia" },
{ "de": "der Cousin", "pt": "o primo" },
{ "de": "die Cousine", "pt": "a prima" },
{ "de": "ich habe", "pt": "eu tenho" },
{ "de": "wie viele?", "pt": "quantos/as?" },
{ "de": "eins, zwei, drei...", "pt": "um, dois, três..." },
{ "de": "zwanzig", "pt": "vinte" },
{ "de": "mein / meine", "pt": "meu / minha" },
{ "de": "dein / deine", "pt": "seu / sua (informal)" },
{ "de": "wohnen", "pt": "morar" },
{ "de": "in + Stadt", "pt": "em + cidade" },
{ "de": "sehen", "pt": "ver" },
{ "de": "das Foto", "pt": "a foto" },
{ "de": "zeigen", "pt": "mostrar" },
{ "de": "nett", "pt": "legal / simpático" },
{ "de": "aussehen", "pt": "parecer / ter aparência" },
{ "de": "am Strand", "pt": "na praia" }]'::jsonb,
'["Eltern e Geschwister são sempre plurais",
"Freundin pode ser amiga OU namorada",
"Idade: Ich bin 20 Jahre alt (não: Ich habe 20 Jahre)"
,"INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,
1,true),

('a1-cap2','a1-l2-2','A1','Números 1-20 e Artigos Possessivos','Zahlen 1-20 und Possessivartikel',
'Números 1-12 são irregulares e precisam ser decorados. De 13 a 19: número + zehn (atenção: sechzehn sem s, siebzehn sem en).','Regra prática: Masculino e neutro: mein, dein (sem -e). Feminino e plural: meine, deine (com -e)',
'[{ "de": "Ich bin dreiundzwanzig Jahre alt.", "pt": "Tenho vinte e três anos.", "note": "23" },
{ "de": "Sie ist achtzehn Jahre alt.", "pt": "Ela tem dezoito anos.", "note": "18" },
{ "de": "Das kostet sechzehn Euro.", "pt": "Custa dezesseis euros.", "note": "16 = sechzehn (sem s!)" },
{ "de": "Wir haben zwölf Monate im Jahr.", "pt": "Temos doze meses no ano.", "note": "12 = zwölf" }]'::jsonb,
'[]'::jsonb,
'["NÚMEROS DE 0 A 20:",
"0 = null | 1 = eins | 2 = zwei | 3 = drei | 4 = vier | 5 = fünf",
"6 = sechs | 7 = sieben | 8 = acht | 9 = neun | 10 = zehn",
"11 = elf | 12 = zwölf | 13 = dreizehn | 14 = vierzehn",
"15 = fünfzehn | 16 = sechzehn (sem s!) | 17 = siebzehn (sem en!)",
"18 = achtzehn | 19 = neunzehn | 20 = zwanzig",
"",
"POSSIVARTIKEL NO NOMINATIV:",
"ich → mein (m/n), meine (f/pl) → mein Vater, meine Mutter",
"du → dein (m/n), deine (f/pl) → dein Bruder, deine Schwester",
"er/sie/es → sein/ihr → sein Name, ihr Haus",
"wir → unser → unser Haus",
"ihr → euer → euer Auto",
"sie/Sie → ihr/Ihr → ihr Hund / Ihr Name",
"",
"DICA DE PRONÚNCIA:",
"Em alemão, o número 1 é eins (com S final), mas em combinações",
"como 21 vira einundzwanzig (sem S)."]'::jsonb,
2,true),

('a1-cap2','a1-l2-3','A1','Cultura: Família & Números na Alemanha','Kultur: Familie & Zahlen',
'Famílias menores: A média na Alemanha é de 1-2 filhos. Famílias grandes são menos comuns. Nomes compostos são comuns: Anna-Lena, Hans-Peter.','Aniversários: celebrar no dia exato. Cantar parabéns antes é "azar"!',
'[{ "de": "Alles Gute zum Geburtstag!", "pt": "Parabéns!", "note": "aniversário" },
{ "de": "Wie alt bist du?", "pt": "Quantos anos você tem?", "note": "idade" },
{ "de": "Ich bin 22 Jahre alt.", "pt": "Tenho 22 anos.", "note": "resposta" }]'::jsonb,
'[]'::jsonb,
'["Família & Números na Alemanha:",
"",
"• Famílias menores: A média na Alemanha é de 1-2 filhos.",
"  Famílias grandes são menos comuns.",
"",
"• Nomes compostos: É comum usar dois primeiros nomes,",
"  como Anna-Lena ou Hans-Peter.",
"",
"• Aniversários: Alemães celebram no dia exato.",
"  Cantar parabéns antes da data é considerado azar.",
"",
"• Números no telefone: Alemães ditam números de telefone",
"  em pares: null-eins-drei, vier-fünf, sechs-sieben (013 45 67).",
"",
"• Endereços: Sempre informe: nome, rua, número, CEP e cidade.",
"  O CEP (Postleitzahl) tem 5 dígitos e é essencial."
,"INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 3: Hobbys und Interessen – Über Freizeit sprechen
-- ══════════════════════════════════════════════════
('a1-cap3','a1-l3-1','A1','Diálogo: Sophie e Jan falam sobre hobbies','Dialog: Hobbys und Freizeit',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Sophie: Hallo Jan! Was machst du gern in deiner Freizeit?  
Jan: Hallo Sophie! Ich spiele gern Fußball. Und du?  
Sophie: Ich lese gern Bücher. Welche Farbe hat dein Buch?  
Jan: Mein Buch ist blau. Ich mag blaue Farben.  
Sophie: Ich mag rot und grün. Rot ist meine Lieblingsfarbe.  
Jan: Spielst du ein Instrument?  
Sophie: Ja, ich spiele Gitarre. Und du?  
Jan: Ich spiele Klavier, aber nicht sehr gut.  
Sophie: Das ist toll! Hörst du auch Musik?  
Jan: Ja, ich höre gern Popmusik. Und du?  
Sophie: Ich höre klassische Musik. Was machst du am Wochenende?  
Jan: Am Samstag spiele ich Fußball. Am Sonntag gehe ich schwimmen.  
Sophie: Ich gehe am Samstag einkaufen. Am Sonntag koche ich gern.  
Jan: Kochst du gut?  
Sophie: Ja, ich koche sehr gut! Ich mache Pizza und Pasta.  
Jan: Super! Kann ich mal essen kommen?  
Sophie: Ja, natürlich! Wann hast du Zeit?  
Jan: Nächste Woche vielleicht?  
Sophie: Perfekt! Ruf mich an!  
Jan: Mache ich! Tschüss, Sophie!  
Sophie: Tschüss, Jan! Viel Spaß beim Fußball!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Sophie: Olá Jan! O que você gosta de fazer no seu tempo livre?  
Jan: Olá Sophie! Eu gosto de jogar futebol. E você?  
Sophie: Eu gosto de ler livros. De que cor é o seu livro?  
Jan: Meu livro é azul. Eu gosto de cores azuis.  
Sophie: Eu gosto de vermelho e verde. Vermelho é minha cor favorita.  
Jan: Você toca um instrumento?  
Sophie: Sim, eu toco violão. E você?  
Jan: Eu toco piano, mas não muito bem.  
Sophie: Isso é ótimo! Você também ouve música?  
Jan: Sim, eu gosto de ouvir pop. E você?  
Sophie: Eu ouço música clássica. O que você faz no fim de semana?  
Jan: No sábado eu jogo futebol. No domingo eu vou nadar.  
Sophie: Eu vou às compras no sábado. No domingo eu gosto de cozinhar.  
Jan: Você cozinha bem?  
Sophie: Sim, eu cozinho muito bem! Eu faço pizza e macarrão.  
Jan: Ótimo! Posso ir comer aí uma vez?  
Sophie: Sim, claro! Quando você tem tempo?  
Jan: Talvez na próxima semana?  
Sophie: Perfeito! Me liga!  
Jan: Vou ligar! Tchau, Sophie!  
Sophie: Tchau, Jan! Divirta-se no futebol!','gern após o verbo = gostar de fazer algo. Ich höre gern Musik = Gosto de ouvir música.',
'[{ "de": "Ich höre gern Musik.", "pt": "Gosto de ouvir música.", "note": "gern após verbo" },
{ "de": "Ich spiele Gitarre seit zwei Jahren.", "pt": "Toco violão há dois anos.", "note": "seit + tempo" },
{ "de": "Am Wochenende gehe ich oft ins Kino.", "pt": "No fim de semana vou frequentemente ao cinema.", "note": "" },
{ "de": "Meine Lieblingsfarbe ist Blau.", "pt": "Minha cor favorita é azul.", "note": "" }]'::jsonb,
'[{ "de": "das Hobby", "pt": "o hobby" },
{ "de": "die Freizeit", "pt": "o tempo livre" },
{ "de": "was machst du gern?", "pt": "o que você gosta de fazer?" },
{ "de": "spielen", "pt": "jogar / tocar (instrumento)" },
{ "de": "Fußball", "pt": "futebol" },
{ "de": "lesen", "pt": "ler" },
{ "de": "das Buch", "pt": "o livro" },
{ "de": "die Farbe", "pt": "a cor" },
{ "de": "rot", "pt": "vermelho" },
{ "de": "blau", "pt": "azul" },
{ "de": "grün", "pt": "verde" },
{ "de": "gelb", "pt": "amarelo" },
{ "de": "schwarz", "pt": "preto" },
{ "de": "weiß", "pt": "branco" },
{ "de": "grau", "pt": "cinza" },
{ "de": "braun", "pt": "marrom" },
{ "de": "lila / violett", "pt": "roxo" },
{ "de": "orange", "pt": "laranja" },
{ "de": "die Lieblingsfarbe", "pt": "a cor favorita" },
{ "de": "das Instrument", "pt": "o instrumento" },
{ "de": "die Gitarre", "pt": "o violão/guitarra" },
{ "de": "das Klavier", "pt": "o piano" },
{ "de": "hören", "pt": "ouvir" },
{ "de": "die Musik", "pt": "a música" },
{ "de": "Popmusik", "pt": "música pop" },
{ "de": "klassische Musik", "pt": "música clássica" },
{ "de": "schwimmen", "pt": "nadar" },
{ "de": "einkaufen", "pt": "fazer compras" },
{ "de": "kochen", "pt": "cozinhar" },
{ "de": "die Pizza", "pt": "a pizza" },
{ "de": "die Pasta", "pt": "o macarrão" }]'::jsonb,
'["gern = com prazer, gostar de. Posição: após o verbo conjugado",
"Cores: rot/vermelho, blau/azul, grün/verde, gelb/amarelo, schwarz/preto, weiß/branco",
"hell = claro, dunkel = escuro: hellblau = azul claro"
,"INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,
1,true),

('a1-cap3','a1-l3-2','A1','Verbos Regulares no Presente','Regelmäßige Verben im Präsens',
'Verbos regulares seguem um padrão: tronco + terminação. Alguns verbos mudam a vogal na 2ª e 3ª pessoa (lesen → du liest, er liest).','Terminações: ich -e | du -st | er/sie/es -t | wir -en | ihr -t | sie/Sie -en',
'[{ "de": "Ich mache Pizza.", "pt": "Eu faço pizza.", "note": "machen" },
{ "de": "Du spielst gut Fußball.", "pt": "Você joga bem futebol.", "note": "spielen" },
{ "de": "Er liest ein Buch.", "pt": "Ele lê um livro.", "note": "lesen - vogal muda!" },
{ "de": "Wir hören Musik.", "pt": "Nós ouvimos música.", "note": "hören" }]'::jsonb,
'[]'::jsonb,
'["CONJUGAÇÃO DE VERBOS REGULARES (ex: machen):",
"ich mache | du machst | er/sie/es macht | wir machen | ihr macht | sie/Sie machen",
"",
"VERBOS COM MUDANÇA DE VOGAL (Stammvokalwechsel):",
"Alguns verbos mudam a vogal na 2ª e 3ª pessoa do singular:",
"",
"lesen: ich lese | du liest | er liest | wir lesen | ihr lest | sie lesen",
"fahren: ich fahre | du fährst | er fährt | wir fahren | ihr fahrt | sie fahren",
"schlafen: ich schlafe | du schläfst | er schläft | wir schlafen | ihr schlaft | sie schlafen",
"",
"USO DE GERN PARA EXPRESSAR GOSTO:",
"Ich + verbo + gern = Eu gosto de...",
"Ex: Ich spiele gern Fußball. = Gosto de jogar futebol.",
"",
"DICA: gern vem DEPOIS do verbo conjugado.",
"Em perguntas: Was machst du gern? = O que você gosta de fazer?"]'::jsonb,
2,true),

('a1-cap3','a1-l3-3','A1','Cultura: Lazer & Gostos na Alemanha','Kultur: Freizeit & Interessen',
'Verein-Kultur: Alemães adoram se organizar em clubes (Vereine): futebol, canto, xadrez, jardinagem. Mais de 600 mil Vereine existem no país!','Sonntagsruhe: Aos domingos, lojas fecham e barulho é evitado. É dia de família e Kaffee und Kuchen.',
'[{ "de": "der Verein", "pt": "clube/associação", "note": "cultura" },
{ "de": "Sonntagsruhe", "pt": "descanso dominical", "note": "tradição" },
{ "de": "Kaffee und Kuchen", "pt": "café e bolo (tarde de domingo)", "note": "tradição" }]'::jsonb,
'[]'::jsonb,
'["Lazer & Gostos na Alemanha:",
"",
"• Verein-Kultur: Alemães adoram se organizar em clubes (Vereine):",
"  futebol, canto, xadrez, jardinagem. Mais de 600 mil Vereine",
"  existem no país!",
"",
"• Sonntagsruhe: Aos domingos, lojas fecham e barulho é evitado.",
"  É dia de família, caminhada e café com bolo (Kaffee und Kuchen).",
"",
"• Cores e significado: Vermelho pode indicar perigo ou amor;",
"  azul transmite confiança; verde é associado à natureza e",
"  sustentabilidade.",
"",
"• Música clássica: Alemanha é terra de Bach, Beethoven e Brahms.",
"  Orquestras e óperas são acessíveis e populares.",
"",
"• Futebol é paixão: A Bundesliga é uma das ligas mais assistidas",
"  do mundo. Torcedores cantam juntos e criam atmosfera única."
,"INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 4: Im Supermarkt – Einkaufen und Lebensmittel
-- ══════════════════════════════════════════════════
('a1-cap4','a1-l4-1','A1','Diálogo: Maria faz compras','Dialog: Im Supermarkt',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Verkäuferin: Guten Tag! Kann ich Ihnen helfen?  
Maria: Guten Tag! Ja, bitte. Ich brauche Obst und Gemüse.  
Verkäuferin: Was möchten Sie gern?  
Maria: Ich hätte gern Äpfel, Bananen und Tomaten.  
Verkäuferin: Wie viel Äpfel?  
Maria: Ein Kilo, bitte. Und zwei Bananen.  
Verkäuferin: Sonst noch etwas?  
Maria: Ja, ich brauche auch Brot, Milch und Eier.  
Verkäuferin: Welches Brot möchten Sie? Wir haben Vollkornbrot und Weißbrot.  
Maria: Das Vollkornbrot, bitte. Und eine Packung Milch.  
Verkäuferin: Wie viele Eier?  
Maria: Sechs Eier, bitte. Haben Sie auch Käse?  
Verkäuferin: Ja, natürlich. Welchen Käse möchten Sie?  
Maria: Den Gouda, bitte. Und einen Joghurt.  
Verkäuferin: Das macht 15 Euro, bitte.  
Maria: Hier, 20 Euro.  
Verkäuferin: Danke. Hier ist Ihr Wechselgeld: 5 Euro.  
Maria: Vielen Dank! Schönen Tag noch!  
Verkäuferin: Danke, gleichfalls! Auf Wiedersehen!  
Maria: Auf Wiedersehen!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Vendedora: Bom dia! Posso ajudá-la?  
Maria: Bom dia! Sim, por favor. Eu preciso de frutas e legumes.  
Vendedora: O que a senhora gostaria?  
Maria: Eu gostaria de maçãs, bananas e tomates.  
Vendedora: Quantas maçãs?  
Maria: Um quilo, por favor. E duas bananas.  
Vendedora: Mais alguma coisa?  
Maria: Sim, eu preciso também de pão, leite e ovos.  
Vendedora: Qual pão a senhora quer? Temos pão integral e pão branco.  
Maria: O integral, por favor. E um pacote de leite.  
Vendedora: Quantos ovos?  
Maria: Seis ovos, por favor. A senhora tem queijo também?  
Vendedora: Sim, claro. Qual queijo a senhora quer?  
Maria: O Gouda, por favor. E um iogurte.  
Vendedora: São 15 euros, por favor.  
Maria: Aqui, 20 euros.  
Vendedora: Obrigada. Aqui está o seu troco: 5 euros.  
Maria: Muito obrigada! Tenha um bom dia!  
Vendedora: Obrigada, igualmente! Até logo!  
Maria: Até logo!','Estrutura de pedido: Ich möchte / Ich brauche + artigo acusativo + produto.',
'[{ "de": "Ich hätte gern einen Apfel.", "pt": "Eu gostaria de uma maçã.", "note": "acusativo" },
{ "de": "Ich brauche das Brot.", "pt": "Eu preciso do pão.", "note": "acusativo" },
{ "de": "Haben Sie den Käse?", "pt": "A senhora tem o queijo?", "note": "acusativo" },
{ "de": "Ich kaufe eine Banane.", "pt": "Eu compro uma banana.", "note": "acusativo" }]'::jsonb,
'[{ "de": "der Supermarkt", "pt": "o supermercado" },
{ "de": "einkaufen", "pt": "fazer compras" },
{ "de": "der Verkäufer / die Verkäuferin", "pt": "o vendedor / a vendedora" },
{ "de": "helfen", "pt": "ajudar" },
{ "de": "ich brauche", "pt": "eu preciso" },
{ "de": "das Obst", "pt": "as frutas" },
{ "de": "das Gemüse", "pt": "os legumes/verduras" },
{ "de": "der Apfel", "pt": "a maçã" },
{ "de": "die Banane", "pt": "a banana" },
{ "de": "die Tomate", "pt": "o tomate" },
{ "de": "das Kilo", "pt": "o quilo" },
{ "de": "das Brot", "pt": "o pão" },
{ "de": "die Milch", "pt": "o leite" },
{ "de": "das Ei", "pt": "o ovo" },
{ "de": "der Käse", "pt": "o queijo" },
{ "de": "der Joghurt", "pt": "o iogurte" },
{ "de": "das Wasser", "pt": "a água" },
{ "de": "der Saft", "pt": "o suco" },
{ "de": "das Fleisch", "pt": "a carne" },
{ "de": "der Fisch", "pt": "o peixe" },
{ "de": "die Nudeln", "pt": "o macarrão" },
{ "de": "der Reis", "pt": "o arroz" },
{ "de": "das Salz", "pt": "o sal" },
{ "de": "der Zucker", "pt": "o açúcar" },
{ "de": "wie viel?", "pt": "quanto? (singular)" },
{ "de": "wie viele?", "pt": "quantos? (plural)" },
{ "de": "eine Packung", "pt": "um pacote" },
{ "de": "das Wechselgeld", "pt": "o troco" },
{ "de": "Euro", "pt": "euro" },
{ "de": "Cent", "pt": "centavo" },
{ "de": "bezahlen", "pt": "pagar" }]'::jsonb,
'["Entschuldigung = com licença (para pedir ajuda a estranho)",
"vielen Dank = muito obrigado",
"bitte = por favor/de nada",
"INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,
1,true),

('a1-cap4','a1-l4-2','A1','Artigos no Acusativo','Artikel im Akkusativ',
'O acusativo é o caso do objeto direto (quem recebe a ação). Só o artigo masculino muda: der → den, ein → einen. Feminino, neutro e plural ficam iguais.','Só masculino muda no acusativo: der → den, ein → einen. Resto igual.',
'[{ "de": "Ich möchte einen Liter Milch.", "pt": "Quero um litro de leite.", "note": "Milch é feminino" },
{ "de": "Ich kaufe einen Kaffee.", "pt": "Compro um café.", "note": "Kaffee é masculino: ein → einen" },
{ "de": "Ich brauche ein Brot.", "pt": "Preciso de um pão.", "note": "Brot é neutro: ein → ein" },
{ "de": "Siehst du den Mann?", "pt": "Você vê o homem?", "note": "Mann é masc: der → den" }]'::jsonb,
'[]'::jsonb,
'["ARTIGOS DEFINIDOS NO NOMINATIV VS. AKKUSATIV:",
"Masculino: der Apfel → den Apfel",
"Feminino: die Banane → die Banane (não muda)",
"Neutro: das Brot → das Brot (não muda)",
"Plural: die Äpfel → die Äpfel (não muda)",
"",
"ARTIGOS INDEFINIDOS NO NOMINATIV VS. AKKUSATIV:",
"Masculino: ein Apfel → einen Apfel",
"Feminino: eine Banane → eine Banane (não muda)",
"Neutro: ein Brot → ein Brot (não muda)",
"",
"DICA PRÁTICA:",
"Pergunte-se: O quê? após o verbo. A resposta é o objeto direto → acusativo.",
"Ex: Ich kaufe was? → einen Apfel (acusativo masculino).",
"",
"VERBOS QUE PEDEM ACUSATIVO:",
"brauchen, kaufen, haben, sehen, möchten, essen, trinken"]'::jsonb,
2,true),

('a1-cap4','a1-l4-3','A1','Cultura: Compras & Alimentação','Kultur: Einkaufen & Lebensmittel',
'Pfand-System: Garrafas e latas têm depósito (8-25 Cent). Devolva-as nas máquinas do supermercado para receber o valor de volta.','Sonntag geschlossen: Supermercados fecham aos domingos. Planeje suas compras!',
'[{ "de": "der Pfand", "pt": "depósito (garrafas)", "note": "sustentabilidade" },
{ "de": "die Pfandflasche", "pt": "garrafa com depósito", "note": "sustentabilidade" },
{ "de": "Sonntag geschlossen", "pt": "fechado no domingo", "note": "horário" }]'::jsonb,
'[]'::jsonb,
'["Compras & Alimentação na Alemanha:",
"",
"• Pfand-System: Garrafas e latas têm depósito (8-25 Cent).",
"  Devolva-as nas máquinas do supermercado para receber o valor de volta.",
"",
"• Tüten?: Sacolas plásticas são pagas. Leve sua própria bolsa",
"  (Einkaufstasche) – é ecológico e econômico.",
"",
"• Sonntag geschlossen: Supermercados fecham aos domingos.",
"  Planeje suas compras!",
"",
"• Bio-Produkte: Produtos orgânicos têm selo Bio ou Öko.",
"  São populares e de alta qualidade.",
"",
"• Regional & Saisonal: Alemães valorizam produtos locais e da estação.",
"  Feiras semanais (Wochenmarkt) oferecem frescor e preços justos."
,"INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 5: Mein Tag – Tagesablauf und Uhrzeiten
-- ══════════════════════════════════════════════════
('a1-cap5','a1-l5-1','A1','Diálogo: Lukas conta sua rotina','Dialog: Tagesablauf',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Anna: Hallo Lukas! Wie läuft dein Tag?  
Lukas: Hallo Anna! Mein Tag beginnt um 6 Uhr. Ich stehe auf, dusche mich und frühstücke.  
Anna: Was isst du zum Frühstück?  
Lukas: Ich esse Brot mit Käse und trinke Kaffee. Dann putze ich mir die Zähne.  
Anna: Und wann gehst du zur Arbeit?  
Lukas: Um 8 Uhr fange ich an zu arbeiten. Ich arbeite bis 17 Uhr.  
Anna: Machst du eine Pause?  
Lukas: Ja, um 12 Uhr esse ich zu Mittag. Ich esse oft in der Kantine.  
Anna: Was machst du nach der Arbeit?  
Lukas: Ich gehe einkaufen oder treffe Freunde. Abends koche ich und sehe fern.  
Anna: Und wann gehst du ins Bett?  
Lukas: Um 23 Uhr gehe ich schlafen. Aber am Wochenende schlafe ich länger!  
Anna: Wie spät ist es jetzt?  
Lukas: Es ist halb acht. Hast du heute Abend Zeit?  
Anna: Ja, gerne! Wollen wir um 20 Uhr telefonieren?  
Lukas: Perfekt! Ich rufe dich an.  
Anna: Super! Bis später!  
Lukas: Tschüss, Anna!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Anna: Olá Lukas! Como está seu dia?  
Lukas: Olá Anna! Meu dia começa às 6h. Eu me levanto, tomo banho e tomo café da manhã.  
Anna: O que você come no café da manhã?  
Lukas: Eu como pão com queijo e tomo café. Depois escovo os dentes.  
Anna: E quando você vai trabalhar?  
Lukas: Às 8h eu começo a trabalhar. Eu trabalho até às 17h.  
Anna: Você faz uma pausa?  
Lukas: Sim, às 12h eu almoço. Eu como frequentemente na cantina.  
Anna: O que você faz depois do trabalho?  
Lukas: Eu vou às compras ou encontro amigos. À noite eu cozinho e assisto TV.  
Anna: E quando você vai dormir?  
Lukas: Às 23h eu vou dormir. Mas no fim de semana eu durmo mais tempo!  
Anna: Que horas são agora?  
Lukas: São 7:30. Você tem tempo hoje à noite?  
Anna: Sim, com prazer! Queremos nos falar às 20h?  
Lukas: Perfeito! Eu te ligo.  
Anna: Ótimo! Até mais tarde!  
Lukas: Tchau, Anna!','Verbos separáveis: prefixo vai ao FINAL. Ich stehe auf. Halb + próxima hora: halb neun = 8:30.',
'[{ "de": "Ich stehe um sieben Uhr auf.", "pt": "Levanto-me às sete horas.", "note": "aufstehen separável" },
{ "de": "Der Unterricht beginnt um halb neun.", "pt": "A aula começa às oito e meia.", "note": "halb neun = 8:30!" },
{ "de": "Dann dusche ich und frühstücke.", "pt": "Depois tomo banho e tomo café.", "note": "dann = depois" },
{ "de": "Um acht Uhr fange ich an.", "pt": "Às oito horas eu começo.", "note": "anfangen separável: fange...an" }]'::jsonb,
'[{ "de": "der Tag", "pt": "o dia" },
{ "de": "der Tagesablauf", "pt": "a rotina diária" },
{ "de": "die Uhrzeit", "pt": "o horário" },
{ "de": "aufstehen", "pt": "levantar-se" },
{ "de": "duschen", "pt": "tomar banho (chuveiro)" },
{ "de": "sich waschen", "pt": "lavar-se" },
{ "de": "frühstücken", "pt": "tomar café da manhã" },
{ "de": "das Frühstück", "pt": "o café da manhã" },
{ "de": "zu Mittag essen", "pt": "almoçar" },
{ "de": "das Mittagessen", "pt": "o almoço" },
{ "de": "zu Abend essen", "pt": "jantar" },
{ "de": "das Abendessen", "pt": "o jantar" },
{ "de": "die Zähne putzen", "pt": "escovar os dentes" },
{ "de": "anfangen", "pt": "começar" },
{ "de": "aufhören", "pt": "parar/terminar" },
{ "de": "arbeiten", "pt": "trabalhar" },
{ "de": "die Pause", "pt": "a pausa" },
{ "de": "die Kantine", "pt": "a cantina" },
{ "de": "einkaufen", "pt": "fazer compras" },
{ "de": "fernsehen", "pt": "assistir TV" },
{ "de": "schlafen", "pt": "dormir" },
{ "de": "ins Bett gehen", "pt": "ir para a cama" },
{ "de": "wie spät ist es?", "pt": "que horas são?" },
{ "de": "es ist... Uhr", "pt": "são... horas" },
{ "de": "halb...", "pt": "meia hora para... (ex: halb acht = 7:30)" },
{ "de": "Viertel nach...", "pt": "quinze minutos depois de..." },
{ "de": "Viertel vor...", "pt": "quinze minutos para..." },
{ "de": "pünktlich", "pt": "pontual" },
{ "de": "spät", "pt": "tarde" },
{ "de": "früh", "pt": "cedo" },
{ "de": "der Wecker", "pt": "o despertador" },
{ "de": "der Termin", "pt": "o compromisso" }]'::jsonb,
'["halb neun = 8:30 (meia das NOVE = metade do caminho até as 9h)",
"Viertel nach = e quinze | Viertel vor = menos quinze",
"dann = depois (sequência). danach = em seguida."
,"INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,
1,true),

('a1-cap5','a1-l5-2','A1','Verbos Separáveis e Horas','Trennbare Verben + Uhrzeiten',
'Verbos com prefixos separáveis (auf-, an-, ab-, ein-, aus-, zu-, mit-) separam-se na oração principal: prefixo vai para o final.','Na oração principal, verbo conjugado na posição 2 e prefixo no FINAL absoluto.',
'[{ "de": "Ich stehe um 6 Uhr auf.", "pt": "Eu me levanto às 6h.", "note": "aufstehen" },
{ "de": "Der Film fängt um 20 Uhr an.", "pt": "O filme começa às 20h.", "note": "anfangen" },
{ "de": "Ich kaufe im Supermarkt ein.", "pt": "Eu faço compras no supermercado.", "note": "einkaufen" },
{ "de": "Wir sehen abends fern.", "pt": "Nós assistimos TV à noite.", "note": "fernsehen" }]'::jsonb,
'[]'::jsonb,
'["VERBOS SEPARÁVEIS NO PRESENTE:",
"aufstehen: ich stehe ... auf → Ich stehe um 6 Uhr auf.",
"anfangen: ich fange ... an → Der Film fängt um 20 Uhr an.",
"einkaufen: ich kaufe ... ein → Ich kaufe im Supermarkt ein.",
"fernsehen: ich sehe ... fern → Wir sehen abends fern.",
"aufhören: ich höre ... auf → Um 17 Uhr höre ich auf.",
"anziehen: ich ziehe ... an → Ich ziehe mich schnell an.",
"",
"COMO DIZER AS HORAS EM ALEMÃO:",
"Hora exata: ... Uhr → 8 Uhr = 8:00",
"Meia hora: halb + próxima hora → halb acht = 7:30",
"15 min depois: Viertel nach ... → Viertel nach drei = 3:15",
"15 min antes: Viertel vor ... → Viertel vor fünf = 4:45",
"Minutos depois: ... nach ... → zehn nach zwei = 2:10",
"Minutos antes: ... vor ... → zwanzig vor sechs = 5:40",
"",
"ATENÇÃO: halb acht = 7:30 (metade do caminho para as 8h), NÃO 8:30!"]'::jsonb,
2,true),

('a1-cap5','a1-l5-3','A1','Cultura: Rotina & Pontualidade','Kultur: Tagesablauf & Pünktlichkeit',
'Pünktlichkeit ist eine Tugend: Chegar 5-10 minutos antes é esperado em compromissos profissionais.','Feierabend: O fim do expediente é sagrado. Após o trabalho, alemães priorizam tempo livre e família.',
'[{ "de": "die Pünktlichkeit", "pt": "pontualidade", "note": "valor" },
{ "de": "der Feierabend", "pt": "fim do expediente", "note": "cultura" },
{ "de": "pünktlich sein", "pt": "ser pontual", "note": "virtude" }]'::jsonb,
'[]'::jsonb,
'["Rotina & Pontualidade na Alemanha:",
"",
"• Pünktlichkeit ist eine Tugend: Chegar 5-10 minutos antes é",
"  esperado em compromissos profissionais.",
"",
"• Feierabend: O fim do expediente é sagrado. Após o trabalho,",
"  alemães priorizam tempo livre e família.",
"",
"• Abendbrot: Jantar leve com pão, queijo e embutidos é tradicional,",
"  especialmente no norte.",
"",
"• Ruhezeiten: Das 22h às 6h e aos domingos, barulho é proibido",
"  por lei (sem furadeira, sem festas altas).",
"",
"• Terminplanung: Agenda é levada a sério. Marque consultas com",
"  semanas de antecedência para médico, cabeleireiro, etc."
,"INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,
3,true)

ON CONFLICT (slug) DO UPDATE SET
module_slug = EXCLUDED.module_slug, level = EXCLUDED.level,
title_pt = EXCLUDED.title_pt, title_de = EXCLUDED.title_de,
summary_pt = EXCLUDED.summary_pt, quick_rule_pt = EXCLUDED.quick_rule_pt,
examples = EXCLUDED.examples, key_phrases = EXCLUDED.key_phrases,
mini_notes = EXCLUDED.mini_notes, sort_order = EXCLUDED.sort_order,
active = true, updated_at = now();

INSERT INTO study_lessons
(module_slug, slug, level, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, sort_order, active)
VALUES
-- ══════════════════════════════════════════════════
-- CAPÍTULO 6: Arbeit und Büro – Berufe
-- ══════════════════════════════════════════════════
('a1-cap6','a1-l6-1','A1','Diálogo: Nina e Tom falam sobre trabalho','Dialog: Über Arbeit sprechen',
'**DIÁLOGO EM ALEMÃO:**  
Nina: Hallo Tom! Wie geht es dir bei der Arbeit?  
Tom: Gut, danke. Ich arbeite als Ingenieur in München. Und du?  
Nina: Ich bin Lehrerin. Ich unterrichte Deutsch und Mathe.  
Tom: Das klingt interessant! Was machst du den ganzen Tag?  
Nina: Ich plane den Unterricht und korrigiere Hausaufgaben. Und du?  
Tom: Ich entwickle Software und habe viele Meetings.  
Nina: Arbeitest du im Büro oder von zu Hause?  
Tom: Drei Tage im Büro, zwei Tage im Homeoffice.  
Nina: Das ist praktisch! Wann fängst du an?  
Tom: Um 9 Uhr. Aber ich mache oft Überstunden.  
Nina: Ich arbeite von 7:30 bis 14 Uhr.  
Tom: Glück gehabt! Wie viel verdienst du?  
Nina: Das ist privat. Aber ich zahle viele Steuern.  
Tom: In Deutschland zahlt jeder Steuern.  
Nina: Stimmt. Hast du Urlaub?  
Tom: Ja, 30 Tage im Jahr. Nächsten Monat fahre ich nach Italien.  
Nina: Schönen Urlaub!  
Tom: Danke! Auf Wiedersehen!

---
**TRADUÇÃO:**  
Nina: Olá Tom! Como vai no trabalho?  
Tom: Bem, obrigado. Trabalho como engenheiro em Munique. E você?  
Nina: Sou professora. Ensino alemão e matemática.  
Tom: Parece interessante! O que faz o dia todo?  
Nina: Planejo aulas e corrijo tarefas. E você?  
Tom: Desenvolvo software e tenho muitas reuniões.  
Nina: Trabalha no escritório ou de casa?  
Tom: 3 dias no escritório, 2 em home office.  
Nina: Prático! Que horas começa?  
Tom: Às 9h. Mas faço muitas horas extras.  
Nina: Trabalho das 7:30 às 14h.  
Tom: Sorte! Quanto ganha?  
Nina: É privado. Mas pago muitos impostos.  
Tom: Na Alemanha todos pagam impostos.  
Nina: Verdade. Tem férias?  
Tom: Sim, 30 dias por ano. Mês que vem vou à Itália.  
Nina: Boas férias!  
Tom: Obrigado! Até logo!','Use `als` + profissão sem artigo: Ich arbeite als Ingenieur. Sein + profissão também sem artigo: Ich bin Lehrerin.',
'[{"de":"Ich arbeite als Ingenieur.","pt":"Trabalho como engenheiro.","note":"als + profissão"},{"de":"Ich bin Lehrerin.","pt":"Sou professora.","note":"sem artigo"},{"de":"Ich unterrichte Deutsch.","pt":"Ensino alemão.","note":"unterrichten"},{"de":"Ich korrigiere Hausaufgaben.","pt":"Corrijo tarefas.","note":"korrigieren"},{"de":"Ich habe Meetings.","pt":"Tenho reuniões.","note":"haben + subst"},{"de":"Ich zahle Steuern.","pt":"Pago impostos.","note":"st euern plural"}]'::jsonb,
'[{"de":"die Arbeit","pt":"o trabalho"},{"de":"der Beruf","pt":"a profissão"},{"de":"arbeiten","pt":"trabalhar"},{"de":"der Ingenieur / die Ingenieurin","pt":"engenheiro/a"},{"de":"der Lehrer / die Lehrerin","pt":"professor/a"},{"de":"unterrichten","pt":"ensinar"},{"de":"korrigieren","pt":"corrigir"},{"de":"planen","pt":"planejar"},{"de":"entwickeln","pt":"desenvolver"},{"de":"das Meeting","pt":"a reunião"},{"de":"das Büro","pt":"o escritório"},{"de":"das Homeoffice","pt":"trabalho remoto"},{"de":"die Überstunde","pt":"hora extra"},{"de":"verdienen","pt":"ganhar (salário)"},{"de":"die Steuern","pt":"os impostos"},{"de":"der Urlaub","pt":"as férias"},{"de":"pünktlich","pt":"pontual"},{"de":"die Pause","pt":"a pausa"},{"de":"Feierabend","pt":"fim do expediente"},{"de":"die Chefin","pt":"a chefe"},{"de":"der Kollege","pt":"o colega"},{"de":"schreiben","pt":"escrever"},{"de":"treffen","pt":"encontrar"},{"de":"besprechen","pt":"discutir"},{"de":"die Software","pt":"software"},{"de":"die Mathe","pt":"matemática"},{"de":"die Hausaufgabe","pt":"tarefa de casa"},{"de":"privat","pt":"particular/privado"},{"de":"das Glück","pt":"a sorte"},{"de":"nächster Monat","pt":"próximo mês"}]'::jsonb,
'["Profissões com sein/als NÃO levam artigo.","Feminino: adicione -in (Lehrer → Lehrerin, Ingenieur → Ingenieurin).","Verbos em -t/-d ganham -e- na conjugação (du arbeitest, er arbeitet).","INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,1,true),

('a1-cap6','a1-l6-2','A1','Conjugação Regular e Profissões','Präsens + Berufsangaben',
'Verbos regulares seguem padrão fixo. Terminações: -e, -st, -t, -en, -t, -en. Verbos terminados em -t/-d ganham -e- para facilitar pronúncia.','ich -e | du -st | er/sie/es -t | wir -en | ihr -t | sie/Sie -en',
'[{"de":"Ich arbeite.","pt":"Eu trabalho.","note":"1ª pess"},{"de":"Du arbeitest.","pt":"Você trabalha.","note":"2ª pess (-est)"},{"de":"Er arbeitet.","pt":"Ele trabalha.","note":"3ª pess (-et)"},{"de":"Wir arbeiten.","pt":"Nós trabalhamos.","note":"1ª pl"},{"de":"Ihr arbeitet.","pt":"Vocês trabalham.","note":"2ª pl"},{"de":"Sie arbeiten.","pt":"O(s) senhor(es) trabalha(m).","note":"formal"}]'::jsonb,
'[]'::jsonb,
'["CONJUGAÇÃO REGULAR:","ich arbeite | du arbeitest | er/sie/es arbeitet","wir arbeiten | ihr arbeitet | sie/Sie arbeiten","","ATENÇÃO: Verbos terminados em -t, -d, -chn, -fn ganham -e- antes de -st/-t:","arbeiten → du arbeitEST, er arbeitET","","PROFISSÕES SEM ARTIGO:","✅ Ich bin Lehrer. (correto)","❌ Ich bin ein Lehrer. (soa não nativo)","","EXCEÇÃO: Com adjetivo, usa-se artigo:","✅ Ich bin der neue Assistent.","","INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb, 2, true),

('a1-cap6','a1-l6-3','A1','Cultura: Trabalho na Alemanha','Kultur: Arbeit & Berufe',
'Sistema dual valorizado. 30 Tage Urlaub padrão. Kündigungsschutz protege empregados. Pontualidade é essencial.','Ausbildung dual, 30 dias férias, proteção contra demissão, impostos por classe.',
'[{"de":"die Ausbildung","pt":"formação profissional","note":"sistema dual"},{"de":"der Kündigungsschutz","pt":"proteção contra demissão","note":"lei"},{"de":"die Steuerklasse","pt":"classe fiscal","note":"impostos"}]'::jsonb,
'[]'::jsonb,
'["Trabalho na Alemanha:","• Ausbildung: Sistema dual (teoria + prática) muito valorizado.","• 30 Tage Urlaub: Média de férias anuais.","• Kündigungsschutz: Demissão exige aviso prévio de 3-6 meses.","• Du-Kultur: Startups usam du. Empresas tradicionais mantêm Sie.","• Steuerklasse: Ajusta impostos conforme estado civil.","INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 7: In der Stadt – Orte und Richtungen
-- ══════════════════════════════════════════════════
('a1-cap7','a1-l7-1','A1','Diálogo: Sophie pergunta o caminho','Dialog: Nach dem Weg fragen',
'**DIÁLOGO EM ALEMÃO:**  
Sophie: Entschuldigung, können Sie mir helfen?  
Passant: Ja, natürlich. Was suchen Sie?  
Sophie: Ich suche die Post. Wo ist die Post, bitte?  
Passant: Gehen Sie geradeaus bis zur Ampel. Dann links.  
Sophie: Geradeaus bis zur Ampel, dann links?  
Passant: Genau. Die Post ist neben dem Supermarkt.  
Sophie: Ah, verstehe! Und wo ist der Bahnhof?  
Passant: Der Bahnhof ist in der Nähe. Gehen Sie zurück, dann rechts.  
Sophie: Wie weit ist das?  
Passant: Nur fünf Minuten zu Fuß.  
Sophie: Danke! Gibt es hier auch eine Apotheke?  
Passant: Ja, gegenüber vom Rathaus.  
Sophie: Und ein Café?  
Passant: Das Café ist zwischen der Bank und der Buchhandlung.  
Sophie: Perfekt! Vielen Dank!  
Passant: Gern geschehen! Schönen Tag noch!  
Sophie: Danke, gleichfalls! Auf Wiedersehen!

---
**TRADUÇÃO:**  
Sophie: Com licença, pode me ajudar?  
Transeunte: Sim, claro. O que procura?  
Sophie: Procuro os correios. Onde ficam?  
Transeunte: Vá em frente até o semáforo. Depois à esquerda.  
Sophie: Em frente até o semáforo, depois à esquerda?  
Transeunte: Exato. Os correios ficam ao lado do supermercado.  
Sophie: Ah, entendi! E a estação?  
Transeunte: É perto. Volte, depois vire à direita.  
Sophie: Quão longe é?  
Transeunte: Apenas 5 minutos a pé.  
Sophie: Obrigada! Há uma farmácia aqui?  
Transeunte: Sim, em frente à prefeitura.  
Sophie: E um café?  
Transeunte: O café fica entre o banco e a livraria.  
Sophie: Perfeito! Muito obrigada!  
Transeunte: Por nada! Tenha um bom dia!  
Sophie: Obrigado, igualmente! Até logo!','Wo? = dativo. Preposições: neben, zwischen, gegenüber, in der Nähe. Imperativo formal: Gehen Sie...',
'[{"de":"Die Post ist neben dem Supermarkt.","pt":"Os correios ficam ao lado do supermercado.","note":"neben + dativo"},{"de":"Das Café ist zwischen der Bank und der Buchhandlung.","pt":"O café fica entre o banco e a livraria.","note":"zwischen + dativo"},{"de":"Die Apotheke ist gegenüber dem Rathaus.","pt":"A farmácia fica em frente à prefeitura.","note":"gegenüber + dativo"},{"de":"Gehen Sie geradeaus.","pt":"Vá em frente.","note":"imperativo formal"}]'::jsonb,
'[{"de":"die Stadt","pt":"a cidade"},{"de":"der Weg","pt":"o caminho"},{"de":"die Richtung","pt":"a direção"},{"de":"wo?","pt":"onde?"},{"de":"wohin?","pt":"para onde?"},{"de":"woher?","pt":"de onde?"},{"de":"geradeaus","pt":"em frente"},{"de":"links","pt":"à esquerda"},{"de":"rechts","pt":"à direita"},{"de":"zurück","pt":"de volta"},{"de":"die Ampel","pt":"o semáforo"},{"de":"die Kreuzung","pt":"o cruzamento"},{"de":"neben","pt":"ao lado de"},{"de":"zwischen","pt":"entre"},{"de":"gegenüber","pt":"em frente a"},{"de":"in der Nähe","pt":"perto"},{"de":"zu Fuß","pt":"a pé"},{"de":"die Post","pt":"os correios"},{"de":"der Bahnhof","pt":"a estação"},{"de":"die Apotheke","pt":"a farmácia"},{"de":"das Rathaus","pt":"a prefeitura"},{"de":"die Bank","pt":"o banco"},{"de":"die Buchhandlung","pt":"a livraria"},{"de":"fragen","pt":"perguntar"},{"de":"suchen","pt":"procurar"},{"de":"verstehen","pt":"entender"},{"de":"die Hilfe","pt":"a ajuda"}]'::jsonb,
'["Wechselpräpositionen: Wo? dativo | Wohin? acusativo","geradeaus = em frente (sem virar)","weit = longe, nah = perto","INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,1,true),

('a1-cap7','a1-l7-2','A1','Preposições de Lugar e Direções','Präpositionen & Wegbeschreibung',
'Para posição estática (Wo?), use dativo com preposições: in, an, auf, neben, zwischen, gegenüber. Artigo muda: der/das → dem, die → der, plural → den(+n).','Wo? = dativo. der→dem, die→der, das→dem, pl→den. Imperativo formal para direções.',
'[{"de":"Das Bild hängt an der Wand.","pt":"O quadro está pendurado na parede.","note":"an + dativo"},{"de":"Die Lampe steht auf dem Tisch.","pt":"A lâmpada está sobre a mesa.","note":"auf + dativo"},{"de":"Der Schrank steht neben dem Bett.","pt":"O armário fica ao lado da cama.","note":"neben + dativo"},{"de":"Biegen Sie links ab.","pt":"Vire à esquerda.","note":"imperativo"}]'::jsonb,
'[]'::jsonb,
'["PREPOSIÇÕES DE LOCALIZAÇÃO (WO? → DATIVO):","neben (ao lado), zwischen (entre), gegenüber (em frente),","in der Nähe (perto), bei (na casa de)","","\nMUDANÇA DE ARTIGO PARA DATIVO:","der/das → dem | die → der | plural → den (+n no substantivo)","\nEXEMPLO: neben dem Supermarkt, gegenüber der Bank","\nIMPERATIVO FORMAL (Sie):","Gehen Sie geradeaus. / Biegen Sie links ab.","INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,2,true),

('a1-cap7','a1-l7-3','A1','Cultura: Mobilidade Urbana','Kultur: Mobilität & Stadtraum',
'ÖPNV eficiente, bicicleta popular, acessibilidade padrão, placas claras, emergências 110/112.','Transporte público, cultura bike, acessibilidade, placas, números de emergência.',
'[{"de":"der ÖPNV","pt":"transporte público","note":"sistema"},{"de":"die Fahrradkultur","pt":"cultura da bicicleta","note":"mobilidade"},{"de":"barrierefrei","pt":"acessível","note":"infraestrutura"}]'::jsonb,
'[]'::jsonb,
'["Mobilidade na Alemanha:","• ÖPNV: Transporte público eficiente. Bilhete único.","• Fahrradkultur: Ciclovias separadas e semáforos para bikes.","• Barrierefreiheit: Rampas e pisos táteis em espaços públicos.","• Wegweiser: Placas claras, muitas bilíngues.","• Rufnummern: 110 (polícia) / 112 (emergência).","INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 8: Wetter und Freizeit
-- ══════════════════════════════════════════════════
('a1-cap8','a1-l8-1','A1','Diálogo: Lisa e Max planejam passeio','Dialog: Ausflug planen',
'**DIÁLOGO EM ALEMÃO:**  
Lisa: Hallo Max! Wie ist das Wetter heute?  
Max: Es ist sonnig und warm. Perfekt für einen Ausflug!  
Lisa: Wohin wollen wir gehen?  
Max: Wir können in den Park gehen oder an den See fahren.  
Lisa: Der See ist eine gute Idee! Schwimmen macht Spaß.  
Max: Ja, aber das Wasser ist noch kalt.  
Lisa: Stimmt. Dann gehen wir spazieren und machen ein Picknick.  
Max: Was essen wir?  
Lisa: Ich mache Sandwiches und bringe Obst mit.  
Max: Ich nehme eine Decke und Getränke mit.  
Lisa: Welche Jahreszeit magst du am liebsten?  
Max: Ich mag den Sommer. Dann ist es warm und die Tage sind lang.  
Lisa: Ich mag den Herbst. Die Farben sind so schön!  
Max: Aber im Winter ist es kalt und es schneit oft.  
Lisa: Ja, aber dann kann man Ski fahren!  
Max: Im Frühling blühen die Blumen. Alle Jahreszeiten haben etwas Schönes.  
Lisa: Genau! Wann treffen wir uns?  
Max: Um 14 Uhr am Bahnhof?  
Lisa: Perfekt! Bis später!

---
**TRADUÇÃO:**  
Lisa: Oi Max! Como está o tempo hoje?  
Max: Está ensolarado e quente. Perfeito para um passeio!  
Lisa: Para onde vamos?  
Max: Podemos ir ao parque ou ao lago.  
Lisa: O lago é boa ideia! Nadar é divertido.  
Max: Sim, mas a água ainda está fria.  
Lisa: Verdade. Então vamos caminhar e fazer piquenique.  
Max: O que vamos comer?  
Lisa: Faço sanduíches e levo frutas.  
Max: Levo um cobertor e bebidas.  
Lisa: Qual estação você mais gosta?  
Max: Gosto do verão. É quente e os dias são longos.  
Lisa: Gosto do outono. As cores são lindas!  
Max: Mas no inverno é frio e neva.  
Lisa: Sim, mas aí podemos esquiar!  
Max: Na primavera as flores desabrocham. Todas têm algo bom.  
Lisa: Exato! Quando nos encontramos?  
Max: Às 14h na estação?  
Lisa: Perfeito! Até mais!','Clima: Es ist + adj / Es gibt + Akk / Es + verbo. Preferência: am liebsten no final. Verbos com acusativo.',
'[{"de":"Es ist sonnig und warm.","pt":"Está ensolarado e quente.","note":"es ist + adj"},{"de":"Es regnet seit zwei Tagen.","pt":"Está chovendo há dois dias.","note":"es + verbo"},{"de":"Ich nehme eine Decke mit.","pt":"Levo um cobertor.","note":"nehmen + Akk"},{"de":"Ich mag den Sommer am liebsten.","pt":"Gosto mais do verão.","note":"am liebsten"}]'::jsonb,
'[{"de":"das Wetter","pt":"o tempo"},{"de":"die Jahreszeit","pt":"a estação"},{"de":"der Frühling","pt":"primavera"},{"de":"der Sommer","pt":"verão"},{"de":"der Herbst","pt":"outono"},{"de":"der Winter","pt":"inverno"},{"de":"sonnig","pt":"ensolarado"},{"de":"bewölkt","pt":"nublado"},{"de":"schneien","pt":"nevar"},{"de":"warm/kalt","pt":"quente/frio"},{"de":"der Ausflug","pt":"o passeio"},{"de":"spazieren gehen","pt":"caminhar"},{"de":"das Picknick","pt":"piquenique"},{"de":"die Decke","pt":"cobertor"},{"de":"am liebsten","pt":"o que mais gosta"},{"de":"die Farbe","pt":"cor"},{"de":"schön","pt":"bonito"},{"de":"blühen","pt":"florescer"},{"de":"die Blume","pt":"flor"},{"de":"sich treffen","pt":"encontrar-se"},{"de":"der Bahnhof","pt":"estação"},{"de":"die Sonne","pt":"sol"},{"de":"der Himmel","pt":"céu"},{"de":"die Temperatur","pt":"temperatura"},{"de":"der Wind","pt":"vento"},{"de":"der Regen","pt":"chuva"},{"de":"die Hitze","pt":"calor"},{"de":"der Schnee","pt":"neve"}]'::jsonb,
'["Impessoal: es não se refere a nada — é obrigatório para clima.","bewölkt = nublado, windig = ventoso","am liebsten sempre no final da frase.","INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,1,true),

('a1-cap8','a1-l8-2','A1','Clima e Preferências','Wetter & Präferenzen',
'Es ist/ben/verbo para clima. Verbos de atividade pedem acusativo. am liebsten expressa preferência máxima.','Es regnet/schneit. Es ist kalt/warm. Ich mag X am liebsten.',
'[{"de":"Es gibt Schnee.","pt":"Há neve.","note":"es gibt + Akk"},{"de":"Wir machen ein Picknick.","pt":"Fazemos um piquenique.","note":"machen + Akk"},{"de":"Vergiss die Sonnencreme nicht!","pt":"Não esqueça o protetor!","note":"vergessen + Akk"},{"de":"Ich habe Spaß.","pt":"Estou me divertindo.","note":"haben + Akk"}]'::jsonb,
'[]'::jsonb,
'["DESCRIÇÕES DE CLIMA:","Es ist + adj: Es ist sonnig/kalt/warm/bewölkt.","Es gibt + Akk: Es gibt Schnee/Regen/Wind.","Es + verbo: Es regnet/schneit.","","\nVERBOS DE ATIVIDADE (COM ACUSATIVO):","machen, nehmen, bringen, vergessen, haben.","","\nPREFERÊNCIA:","Ich mag den Sommer am liebsten.","Was magst du am liebsten?","INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,2,true),

('a1-cap8','a1-l8-3','A1','Cultura: Lazer ao Ar Livre','Kultur: Freizeit & Wetter',
'Falar do clima é quebra-gelo social. Caminhadas populares, lagos limpos, app WarnWetter, horário de verão.','Wettergespräche, Wandern, Badesee, app oficial, Sommerzeit.',
'[{"de":"die Wettergespräche","pt":"conversas sobre clima","note":"social"},{"de":"das Wandern","pt":"caminhada","note":"lazer"},{"de":"der Badesee","pt":"lago para banho","note":"lazer"}]'::jsonb,
'[]'::jsonb,
'["Lazer na Alemanha:","• Wettergespräche: Falar do tempo é quebra-gelo.","• Wandern: Trilhas sinalizadas populares.","• Badesee: Lagos públicos limpos e monitorados.","• Wetter-Apps: WarnWetter alerta tempestades.","• Sommerzeit: Março-outubro, horário de verão (UTC+2).","INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 9: Kleidung und Körper
-- ══════════════════════════════════════════════════
('a1-cap9','a1-l9-1','A1','Diálogo: Emma e Leo vão às compras','Dialog: Kleidung kaufen',
'**DIÁLOGO EM ALEMÃO:**  
Emma: Hallo Leo! Du siehst gut aus! Das blaue Hemd steht dir super.  
Leo: Danke! Dein rotes Kleid ist auch sehr schön.  
Emma: Danke! Ich suche heute eine neue Hose.  
Leo: Welche Farbe möchtest du?  
Emma: Ich mag schwarze oder graue Hosen.  
Leo: Hier ist eine schwarze Jeans. Probier sie an!  
Emma: Gute Idee! Wo ist die Umkleidekabine?  
Leo: Dort hinten, neben den Schuhen.  
Emma: Wie finde ich die Hose?  
Leo: Sie passt perfekt! Und sie ist bequem.  
Emma: Super! Ich nehme sie. Was trägst du gern im Sommer?  
Leo: Shorts und T-Shirts. Im Winter trage ich eine Jacke und einen Schal.  
Emma: Und vergiss die Mütze nicht!  
Leo: Stimmt! Wie groß bist du?  
Emma: Ich bin 1,65 m. Ich habe braune Haare und grüne Augen.  
Leo: Ich habe blonde Haare und blaue Augen.  
Emma: Wir sehen unterschiedlich aus, aber wir sind gute Freunde!  
Leo: Genau! Sollen wir noch etwas kaufen?  
Emma: Ja, ich brauche neue Schuhe.  
Leo: Dann gehen wir zur Abteilung. Komm!  
Emma: Danke, Leo! Du bist ein toller Freund!

---
**TRADUÇÃO:**  
Emma: Oi Leo! Você está bem! Essa camisa azul combina.  
Leo: Obrigado! Seu vestido vermelho também está lindo.  
Emma: Obrigada! Hoje procuro uma calça nova.  
Leo: Qual cor quer?  
Emma: Gosto de calças pretas ou cinzas.  
Leo: Aqui está um jeans preto. Experimente!  
Emma: Boa ideia! Onde é o provador?  
Leo: Lá no fundo, ao lado dos sapatos.  
Emma: Como ficou a calça?  
Leo: Serve perfeitamente! E é confortável.  
Emma: Ótimo! Eu levo. O que usa no verão?  
Leo: Shorts e camisetas. No inverno, jaqueta e cachecol.  
Emma: E não esqueça o gorro!  
Leo: Verdade! Qual sua altura?  
Emma: 1,65 m. Tenho cabelos castanhos e olhos verdes.  
Leo: Tenho cabelos loiros e olhos azuis.  
Emma: Parecemos diferentes, mas somos bons amigos!  
Leo: Exato! Compramos mais algo?  
Emma: Sim, preciso de sapatos novos.  
Leo: Então vamos à seção. Vem!  
Emma: Obrigado, Leo! Você é ótimo!','Acusativo com roupas: der→den, die→die, das→das. Adj antes de subst. tragen (hábito) vs. anhaben.',
'[{"de":"Ich probiere die Hose an.","pt":"Experimento a calça.","note":"die → die (fem)"},{"de":"Ich kaufe den Pullover.","pt":"Compro o suéter.","note":"der → den (masc)"},{"de":"Sie trägt das Kleid.","pt":"Ela usa o vestido.","note":"das → das (neut)"},{"de":"Du hast ein schönes Kleid an.","pt":"Você está com um vestido bonito.","note":"anhaben"}]'::jsonb,
'[{"de":"die Kleidung","pt":"as roupas"},{"de":"das Hemd","pt":"camisa"},{"de":"die Hose","pt":"calça"},{"de":"das Kleid","pt":"vestido"},{"de":"der Rock","pt":"saia"},{"de":"die Jacke","pt":"jaqueta"},{"de":"der Schal","pt":"cachecol"},{"de":"die Mütze","pt":"gorro"},{"de":"der Schuh","pt":"sapato"},{"de":"anprobieren","pt":"experimentar"},{"de":"passen","pt":"servir"},{"de":"tragen","pt":"usar"},{"de":"aussehen","pt":"parecer"},{"de":"schwarz/weiß/grau","pt":"preto/branco/cinza"},{"de":"blond/braun/schwarz","pt":"loiro/castanho/preto"},{"de":"die Haare","pt":"cabelos"},{"de":"das Auge","pt":"olho"},{"de":"groß/klein","pt":"alto/baixo"},{"de":"bequem","pt":"confortável"},{"de":"kaputt","pt":"estragado"},{"de":"die Umkleidekabine","pt":"provador"},{"de":"die Abteilung","pt":"seção"},{"de":"die Größe","pt":"tamanho"},{"de":"der Stoff","pt":"tecido"},{"de":"aus Wolle","pt":"de lã"},{"de":"aus Baumwolle","pt":"de algodão"},{"de":"die Mode","pt":"moda"}]'::jsonb,
'["Größe = tamanho. Welche Größe haben Sie?","aus Wolle/Baumwolle = de lã/algodão","aussehen = parecer (separável): sieht...aus","INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,1,true),

('a1-cap9','a1-l9-2','A1','Acusativo com Roupas','Akkusativ & Adjektive',
'Acusativo: só masculino muda. Adjetivos antes de substantivos: artigo + adj + subst.','der→den, ein→einen. Adj: das rote Kleid, eine schwarze Hose.',
'[{"de":"Sie trägt eine schwarze Brille.","pt":"Ela usa óculos pretos.","note":"fem acusativo"},{"de":"Er ist ein freundlicher Mann.","pt":"Ele é um homem simpático.","note":"masc indefinido"},{"de":"Das ist ein helles Zimmer.","pt":"Esse é um quarto claro.","note":"neut indefinido"},{"de":"Ich kenne eine sympathische Frau.","pt":"Conheço uma mulher simpática.","note":"fem acusativo"}]'::jsonb,
'[]'::jsonb,
'["ACUSATIVO COM ROUPAS:","Masculino: der Pullover → den Pullover","Feminino: die Hose → die Hose (não muda)","Neutro: das Kleid → das Kleid (não muda)","\nADJETIVOS ANTES DE SUBSTANTIVOS (A1):","Artigo + adjetivo + substantivo:","das rote Kleid | eine schwarze Hose","\nVERBOS DE VESTIR:","tragen = usar (hábito)","anhaben = estar vestindo (agora)","anziehen = vestir-se (ação)","INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,2,true),

('a1-cap9','a1-l9-3','A1','Cultura: Moda & Estilo','Kultur: Mode & Stil',
'Praticidade acima de tudo. Tirar casaco ao entrar. Sapatos fora em casas. Brechós populares.','Zweckmäßig, Jacke an/aus, Schuhe aus, Second-Hand, estilos regionais.',
'[{"de":"zweckmäßig","pt":"prático/funcional","note":"valor"},{"de":"die Hausschuhe","pt":"chinelos de visita","note":"etiqueta"},{"de":"Nachhaltigkeit","pt":"sustentabilidade","note":"moda"}]'::jsonb,
'[]'::jsonb,
'["Moda na Alemanha:","• Praticidade: Roupas funcionais e duráveis.","• Jacke an/aus: Tirar casaco ao entrar é norma.","• Schuhe aus: Tira-se sapatos em casas.","• Second-Hand: Brechós populares, especialmente jovens.","• Regional: Munique (tradicional), Berlim (alternativo).","INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 10: Termine – Daten und Planung
-- ══════════════════════════════════════════════════
('a1-cap10','a1-l10-1','A1','Diálogo: Sarah e Ben marcam consulta','Dialog: Termin vereinbaren',
'**DIÁLOGO EM ALEMÃO:**  
Sarah: Hallo Ben! Hast du nächste Woche Zeit?  
Ben: Mal sehen. Wann genau?  
Sarah: Ich möchte am Montag, dem 15. Mai, zum Arzt gehen. Kannst du mich begleiten?  
Ben: Leider kann ich am Montag nicht. Ich habe ein wichtiges Meeting.  
Sarah: Schade! Und am Dienstag?  
Ben: Dienstag, der 16. Mai, geht besser. Um wie viel Uhr?  
Sarah: Der Arzt hat um 14 Uhr frei. Passt das?  
Ben: Ja, perfekt! Ich komme mit.  
Sarah: Super! Vergiss deine Versichertenkarte nicht.  
Ben: Wo treffen wir uns?  
Sarah: Um 13:45 Uhr vor der Praxis?  
Ben: Einverstanden. Und was machen wir danach?  
Sarah: Vielleicht Kaffee trinken im Café nebenan?  
Ben: Gute Idee! Ich freue mich schon.  
Sarah: Bis zum 16. Mai!  
Ben: Tschüss, Sarah!  
Sarah: Tschüss!

---
**TRADUÇÃO:**  
Sarah: Oi Ben! Tem tempo semana que vem?  
Ben: Vamos ver. Quando exatamente?  
Sarah: Gostaria de ir ao médico na segunda, dia 15. Pode me acompanhar?  
Ben: Infelizmente não posso na segunda. Tenho reunião importante.  
Sarah: Que pena! E na terça?  
Ben: Terça, dia 16, é melhor. Que horas?  
Sarah: O médico tem horário às 14h. Serve?  
Ben: Sim, perfeito! Vou com você.  
Sarah: Ótimo! Não esqueça seu cartão do plano.  
Ben: Onde nos encontramos?  
Sarah: Às 13:45 em frente à clínica?  
Ben: Combinado. E depois?  
Sarah: Talvez café no café ao lado?  
Ben: Boa ideia! Já estou ansioso.  
Sarah: Até o dia 16!  
Ben: Tchau, Sarah!  
Sarah: Tchau!','Datas: am + dia/data. Horas: um + hora. Meses: im + mês. Preposições: am/um/im. Ordinais em datas.',
'[{"de":"Ich habe am Montag Zeit.","pt":"Tenho tempo na segunda.","note":"am + dia"},{"de":"Der Termin ist um 14:30 Uhr.","pt":"O compromisso é às 14:30.","note":"um + hora"},{"de":"Im Mai reise ich.","pt":"Viajo em maio.","note":"im + mês"},{"de":"Am 15. Mai trifft es sich.","pt":"Encontra-se em 15 de maio.","note":"ordinal"}]'::jsonb,
'[{"de":"der Termin","pt":"compromisso"},{"de":"das Datum","pt":"data"},{"de":"der Kalender","pt":"agenda"},{"de":"planen","pt":"planejar"},{"de":"Montag-Dienstag...","pt":"segunda-terça..."},{"de":"die Woche/Monat/Jahr","pt":"semana/mês/ano"},{"de":"heute/morgen/gestern","pt":"hoje/amanhã/ontem"},{"de":"nächste Woche","pt":"próxima semana"},{"de":"letzter Monat","pt":"mês passado"},{"de":"um wie viel Uhr?","pt":"a que horas?"},{"de":"pünktlich","pt":"pontual"},{"de":"verspäten","pt":"atrasar"},{"de":"absagen","pt":"cancelar"},{"de":"bestätigen","pt":"confirmar"},{"de":"die Praxis","pt":"consultório"},{"de":"die Versichertenkarte","pt":"cartão do plano"},{"de":"begleiten","pt":"acompanhar"},{"de":"das Meeting","pt":"reunião"},{"de":"nebenan","pt":"ao lado"},{"de":"einverstanden","pt":"combinado"},{"de":"die Uhrzeit","pt":"horário"},{"de":"der Feiertag","pt":"feriado"},{"de":"der Brückentag","pt":"ponte (feriado)"}]'::jsonb,
'["am = dias/datas | um = horas | im = meses/estações","in der Nacht = à noite | von...bis = intervalo","Ordinais: der erste Mai, der dritte Juni","INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,1,true),

('a1-cap10','a1-l10-2','A1','Datas e Preposições de Tempo','Daten & Zeitpräpositionen',
'am + dia/data, um + hora, im + mês/estação. Ordinais para datas. Leitura: der fünfzehnte Mai.','Preposições: am/um/im/in/von-bis. Datas com ordinais.',
'[{"de":"Am Montag um 10 Uhr.","pt":"Na segunda às 10h.","note":"am/um"},{"de":"Im Sommer fahre ich weg.","pt":"No verão viajo.","note":"im"},{"de":"In der Nacht schlafe ich.","pt":"À noite durmo.","note":"in"},{"de":"Von Montag bis Freitag.","pt":"De seg a sex.","note":"von-bis"}]'::jsonb,
'[]'::jsonb,
'["PREPOSIÇÕES DE TEMPO:","am + dia: am Montag, am 15. Mai","um + hora: um 10:30 Uhr","im + mês: im Mai, im Sommer","von... bis: von Montag bis Freitag","\nFORMATANDO DATAS:","Numérico: 15.05.2024 → der fünfzehnte Mai","Por extenso: am 15. Mai → am fünfzehnten Mai","\nREGRA: Ordinais flexionam após am: am fünfzehNTEN Mai.","INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,2,true),

('a1-cap10','a1-l10-3','A1','Cultura: Pontualidade & Agenda','Kultur: Pünktlichkeit & Kalender',
'Planejamento antecipado. Feriados por estado. Brückentage. Confirmação por e-mail. Apps populares.','Kalender-Kultur, Feiertage, Brückentage, Terminvereinbarung, Digitale Tools.',
'[{"de":"der Brückentag","pt":"ponte (feriado)","note":"cultura"},{"de":"die Terminvereinbarung","pt":"marcação de horário","note":"etiqueta"},{"de":"Doctolib","pt":"app de agendamento","note":"digital"}]'::jsonb,
'[]'::jsonb,
'["Pontualidade na Alemanha:","• Kalender-Kultur: Planejam com antecedência.","• Feiertage: Feriados variam por estado.","• Brückentage: Emendam fins de semana longos.","• Terminvereinbarung: Confirme por e-mail/tel.","• Digitale Tools: Doctolib para médicos.","INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb,3,true)

ON CONFLICT (slug) DO UPDATE SET
module_slug = EXCLUDED.module_slug, level = EXCLUDED.level,
title_pt = EXCLUDED.title_pt, title_de = EXCLUDED.title_de,
summary_pt = EXCLUDED.summary_pt, quick_rule_pt = EXCLUDED.quick_rule_pt,
examples = EXCLUDED.examples, key_phrases = EXCLUDED.key_phrases,
mini_notes = EXCLUDED.mini_notes, sort_order = EXCLUDED.sort_order,
active = true, updated_at = now();

INSERT INTO study_lessons
(module_slug, slug, level, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, sort_order, active)
VALUES
-- ══════════════════════════════════════════════════
-- CAPÍTULO 11: Zuhause – Wohnung und Möbel
-- ══════════════════════════════════════════════════
('a1-cap11','a1-l11-1','A1','Diálogo: Mia mostra seu apartamento','Dialog: Mia zeigt ihre Wohnung',
' DIÁLOGO COMPLETO EM ALEMÃO: 
Lena: Wow, Mia! Deine Wohnung ist wirklich schön! 
Mia: Danke, Lena! Komm, ich zeige dir alles. 
Lena: Gerne! Wie viele Zimmer hast du? 
Mia: Ich habe eine Dreizimmerwohnung: Wohnzimmer, Schlafzimmer und Küche. 
Lena: Und das Bad? 
Mia: Das Bad ist klein, aber praktisch. Hier ist es. 
Lena: Sehr hell! Hast du auch einen Balkon? 
Mia: Ja, schau mal! Vom Balkon aus sieht man den Park. 
Lena: Wie schön! Was gibt es im Wohnzimmer? 
Mia: Im Wohnzimmer gibt es ein Sofa, einen Tisch und einen Fernseher. 
Lena: Und in der Küche? 
Mia: In der Küche gibt es einen Kühlschrank, einen Herd und viele Schränke. 
Lena: Kochst du gern? 
Mia: Ja, sehr! Ich koche oft Pasta oder Suppe. 
Lena: Das klingt lecker! Und im Schlafzimmer? 
Mia: Im Schlafzimmer gibt es ein großes Bett, einen Schrank und einen Schreibtisch. 
Lena: Perfekt für Homeoffice! Wie viel Miete zahlst du? 
Mia: 650 Euro warm. Das ist günstig für München. 
Lena: Wirklich günstig! Ich suche auch eine Wohnung. 
Mia: Dann helfe ich dir gerne! 
Lena: Danke, Mia! Deine Wohnung ist gemütlich und praktisch. 
Mia: Danke, Lena! Fühl dich wie zu Hause!
TRADUÇÃO EM PORTUGUÊS: 
Lena: Uau, Mia! Seu apartamento é realmente bonito! 
Mia: Obrigada, Lena! Vem, eu te mostro tudo. 
Lena: Com prazer! Quantos cômodos você tem? 
Mia: Eu tenho um apartamento de três cômodos: sala, quarto e cozinha. 
Lena: E o banheiro? 
Mia: O banheiro é pequeno, mas prático. Aqui está. 
Lena: Muito claro! Você também tem varanda? 
Mia: Sim, olha! Da varanda dá para ver o parque. 
Lena: Que lindo! O que há na sala? 
Mia: Na sala há um sofá, uma mesa e uma TV. 
Lena: E na cozinha? 
Mia: Na cozinha há uma geladeira, um fogão e muitos armários. 
Lena: Você gosta de cozinhar? 
Mia: Sim, muito! Eu cozinho frequentemente macarrão ou sopa. 
Lena: Isso parece delicioso! E no quarto? 
Mia: No quarto há uma cama grande, um guarda-roupa e uma escrivaninha. 
Lena: Perfeito para home office! Quanto de aluguel você paga? 
Mia: 650 euros com despesas. Isso é barato para Munique. 
Lena: Realmente barato! Eu também procuro um apartamento. 
Mia: Então eu te ajudo com prazer! 
Lena: Obrigada, Mia! Seu apartamento é aconchegante e prático. 
Mia: Obrigada, Lena! Sinta-se em casa!',
'Es gibt + Akkusativ. Preposições estáticas (in, an, auf, neben) com Dativ.',
'[{"de":"Es gibt ein Sofa.","pt":"Há um sofá.","note":"es gibt + acusativo"},{"de":"Das Bild hängt an der Wand.","pt":"O quadro está pendurado na parede.","note":"an + dativo"},{"de":"Die Lampe steht auf dem Tisch.","pt":"A lâmpada está sobre a mesa.","note":"auf + dativo"},{"de":"Der Schrank steht neben dem Bett.","pt":"O armário fica ao lado da cama.","note":"neben + dativo"},{"de":"Im Schlafzimmer gibt es ein Bett.","pt":"No quarto há uma cama.","note":"in + dativo"}]'::jsonb,
'[{"de":"das Zuhause","pt":"o lar"},{"de":"die Wohnung","pt":"o apartamento"},{"de":"das Haus","pt":"a casa"},{"de":"das Zimmer","pt":"o cômodo"},{"de":"das Wohnzimmer","pt":"a sala de estar"},{"de":"das Schlafzimmer","pt":"o quarto de dormir"},{"de":"die Küche","pt":"a cozinha"},{"de":"das Bad","pt":"o banheiro"},{"de":"der Balkon","pt":"a varanda"},{"de":"der Garten","pt":"o jardim"},{"de":"die Tür","pt":"a porta"},{"de":"das Fenster","pt":"a janela"},{"de":"die Wand","pt":"a parede"},{"de":"der Boden","pt":"o chão"},{"de":"die Decke","pt":"o teto"},{"de":"das Sofa","pt":"o sofá"},{"de":"der Tisch","pt":"a mesa"},{"de":"der Stuhl","pt":"a cadeira"},{"de":"das Bett","pt":"a cama"},{"de":"der Schrank","pt":"o armário"},{"de":"der Kühlschrank","pt":"a geladeira"},{"de":"der Herd","pt":"o fogão"},{"de":"der Fernseher","pt":"a TV"},{"de":"der Schreibtisch","pt":"a escrivaninha"},{"de":"die Lampe","pt":"a lâmpada"},{"de":"hell","pt":"claro"},{"de":"dunkel","pt":"escuro"},{"de":"gemütlich","pt":"aconchegante"},{"de":"praktisch","pt":"prático"},{"de":"die Miete","pt":"o aluguel"},{"de":"stehen","pt":"estar em pé (móveis)"},{"de":"hängen","pt":"estar pendurado"}]'::jsonb,
'[ "Es gibt + acusativo: Es gibt einen Tisch (masc), eine Lampe (fem). ","Preposições estáticas (Wo?): in, an, auf, neben + Dativ. ","Der → dem, Die → der, Das → dem. ","stehen = posição vertical (armário), liegen = horizontal, hängen = pendurado. ","INPUT: Próximo capítulo / Capítulo anterior " ]'::jsonb, 1, true),

('a1-cap11','a1-l11-2','A1',' "Es gibt " e Preposições de Lugar','Es gibt  & Präpositionen',
'Para dizer  "há/existe ", use es gibt. Para localização fixa, use preposições com Dativ.',
'Es gibt + Akkusativ. Preposições estáticas: in, an, auf, neben + Dativ.',
'[{"de":"Es gibt einen Tisch.","pt":"Há uma mesa.","note":"akusativ"},{"de":"Es gibt viele Schränke.","pt":"Há muitos armários.","note":"plural"},{"de":"Das Bild hängt an der Wand.","pt":"O quadro está na parede.","note":"an + dativo"},{"de":"Der Stuhl steht auf dem Boden.","pt":"A cadeira está no chão.","note":"auf + dativo"}]'::jsonb,
'[]'::jsonb,
'[ "ES GIBT (Há/Existe): ","Usado para existência. Sempre seguido de Acusativo. ","Masculino: Es gibt einen Tisch. ","Feminino: Es gibt eine Lampe. ","Neutro: Es gibt ein Bett. ","Plural: Es gibt viele Stühle. "," ","PREPOSIÇÕES ESTÁTICAS (WO?): ","Indicam posição fixa (sem movimento). Usam DATIVO. ","in (dentro de): im Schlafzimmer (in dem). ","an (em/na): an der Wand. ","auf (sobre): auf dem Tisch. ","neben (ao lado): neben dem Bett. ","zwischen (entre): zwischen dem Sofa und dem Fenster. "," ","VERBOS DE POSIÇÃO: ","stehen (vertical), liegen (horizontal), hängen (pendurado). " ]'::jsonb, 2, true),

('a1-cap11','a1-l11-3','A1','Cultura: Moradia  & Vida Doméstica','Kultur: Wohnen  & Haushalt',
'Aluguel (Warm vs Kaltmiete). Separação de lixo (Mülltrennung). Silêncio noturno (Nachtruhe). Documentos para alugar.',
'Kaltmiete vs Warmmiete. Mülltrennung obrigatória. Nachtruhe 22h-6h.',
'[{"de":"die Miete","pt":"o aluguel","note":"moradia"},{"de":"die Nebenkosten","pt":"as despesas","note":"finanças"},{"de":"die Mülltrennung","pt":"separação de lixo","note":"ecologia"}]'::jsonb,
'[]'::jsonb,
'[ "Moradia  & Vida Doméstica na Alemanha: "," ","• Kaltmiete vs. Warmmiete: ","  Kalt = aluguel base. Warm = inclui água, aquecimento, lixo. ","  Energia e internet são pagas à parte. "," ","• Wohnungssuche: ","  Documentos exigidos: Schufa (crédito), Einkommensnachweis (renda). ","  Concorrido em grandes cidades. "," ","• Mülltrennung: ","  Obrigatório: Restmüll (cinza), Papier (azul), Gelber Sack (plástico), Bio (verde), Glas (vidro). "," ","• Nachtruhe: ","  Silêncio absoluto das 22h às 6h e domingos. ","  Sem furadeira, sem música alta. "," ","INPUT: Próximo capítulo / Capítulo anterior " ]'::jsonb, 3, true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 12: Reisen – Unterwegs sein
-- ══════════════════════════════════════════════════
('a1-cap12','a1-l12-1','A1','Diálogo: Jonas planeja viagem a Berlim','Dialog: Reise nach Berlin',
' DIÁLOGO COMPLETO EM ALEMÃO: 
Jonas: Hallo Lena! Ich möchte im Sommer nach Berlin fahren. 
Lena: Hallo Jonas! Das ist eine tolle Idee! Wie möchtest du reisen? 
Jonas: Ich fahre gern mit dem Zug. Das ist bequem und umweltfreundlich. 
Lena: Stimmt! Hast du schon ein Ticket gebucht? 
Jonas: Noch nicht. Ich suche im Internet. Wann fährst du nach Berlin? 
Lena: Ich war letztes Jahr mit dem Flugzeug dort. Der Flug war schnell, aber teuer. 
Jonas: Wie lange dauert die Fahrt mit dem Zug? 
Lena: Von München nach Berlin sind es etwa 4 Stunden mit dem ICE. 
Jonas: Perfekt! Ich nehme den ICE. Wo steigt man ein? 
Lena: Am Hauptbahnhof. Und vergiss deinen Ausweis nicht! 
Jonas: Mache ich nicht. Kann ich im Zug essen? 
Lena: Ja, es gibt ein Bordrestaurant. Oder du nimmst dein eigenes Essen mit. 
Jonas: Gute Idee! Was kann man in Berlin machen? 
Lena: Besuche das Brandenburger Tor, den Reichstag und die Museumsinsel. 
Jonas: Und abends? 
Lena: Abends kannst du in Kreuzberg essen gehen. Da gibt es viele internationale Restaurants. 
Jonas: Super! Wie komme ich vom Bahnhof zum Hotel? 
Lena: Nimm die U-Bahn. Die Station ist direkt unter dem Bahnhof. 
Jonas: Danke, Lena! Du hilfst mir sehr. 
Lena: Gerne! Schöne Reise und viel Spaß in Berlin! 
Jonas: Danke! Ich schicke dir Fotos! 
Lena: Ich freue mich schon! Tschüss! 
Jonas: Tschüss, Lena!
TRADUÇÃO EM PORTUGUÊS: 
Jonas: Olá Lena! Eu gostaria de viajar para Berlim no verão. 
Lena: Olá Jonas! Essa é uma ótima ideia! Como você quer viajar? 
Jonas: Eu gosto de viajar de trem. É confortável e ecológico. 
Lena: Verdade! Você já reservou uma passagem? 
Jonas: Ainda não. Estou procurando na internet. Quando você viajou para Berlim? 
Lena: Eu fui no ano passado de avião. O voo foi rápido, mas caro. 
Jonas: Quanto tempo dura a viagem de trem? 
Lena: De Munique para Berlim são cerca de 4 horas com o ICE. 
Jonas: Perfeito! Eu pego o ICE. Onde se embarca? 
Lena: Na estação central. E não esqueça seu documento de identidade! 
Jonas: Não vou esquecer. Posso comer no trem? 
Lena: Sim, há um restaurante a bordo. Ou você leva sua própria comida. 
Jonas: Boa ideia! O que se pode fazer em Berlim? 
Lena: Visite o Portão de Brandemburgo, o Reichstag e a Ilha dos Museus. 
Jonas: E à noite? 
Lena: À noite você pode jantar em Kreuzberg. Lá há muitos restaurantes internacionais. 
Jonas: Ótimo! Como chego da estação ao hotel? 
Lena: Pegue o metrô. A estação fica diretamente embaixo da estação de trem. 
Jonas: Obrigado, Lena! Você me ajuda muito. 
Lena: Com prazer! Boa viagem e divirta-se em Berlim! 
Jonas: Obrigado! Eu te mando fotos! 
Lena: Já estou ansiosa! Tchau! 
Jonas: Tchau, Lena!',
'Fahren/Fliegen nach + cidade (sem artigo). Mit + Dativ (transporte). Verbos separáveis (umsteigen, einsteigen).',
'[{"de":"Ich fahre nach Berlin.","pt":"Eu vou para Berlim.","note":"nach + cidade"},{"de":"Sie fliegt nach Italien.","pt":"Ela voa para a Itália.","note":"nach + país (fem/neut)"},{"de":"Ich fahre mit dem Zug.","pt":"Eu vou de trem.","note":"mit + dativo"},{"de":"Ich steige am Bahnhof ein.","pt":"Eu embarco na estação.","note":"einsteigen separável"}]'::jsonb,
'[{"de":"reisen","pt":"viajar"},{"de":"die Reise","pt":"a viagem"},{"de":"unterwegs","pt":"a caminho"},{"de":"der Zug","pt":"o trem"},{"de":"der ICE","pt":"trem de alta velocidade"},{"de":"das Flugzeug","pt":"o avião"},{"de":"fliegen","pt":"voar"},{"de":"fahren","pt":"viajar (veículo)"},{"de":"das Auto","pt":"o carro"},{"de":"der Bus","pt":"o ônibus"},{"de":"die U-Bahn","pt":"o metrô"},{"de":"das Fahrrad","pt":"a bicicleta"},{"de":"der Bahnhof","pt":"a estação"},{"de":"der Flughafen","pt":"o aeroporto"},{"de":"einsteigen","pt":"embarcar"},{"de":"aussteigen","pt":"desembarcar"},{"de":"umsteigen","pt":"baldear"},{"de":"das Ticket","pt":"a passagem"},{"de":"buchen","pt":"reservar"},{"de":"der Ausweis","pt":"documento de identidade"},{"de":"die Fahrt","pt":"o trajeto"},{"de":"dauern","pt":"durar"},{"de":"bequem","pt":"confortável"},{"de":"schnell","pt":"rápido"},{"de":"teuer","pt":"caro"},{"de":"günstig","pt":"barato"},{"de":"umweltfreundlich","pt":"ecológico"},{"de":"das Bordrestaurant","pt":"restaurante a bordo"},{"de":"das Ziel","pt":"o destino"},{"de":"die Strecke","pt":"o percurso"},{"de":"die Haltestelle","pt":"o ponto/parada"}]'::jsonb,
'[ "nach + cidade (sem artigo): nach Berlin, nach München. ","nach + país neutro/feminino: nach Italien, nach Spanien. ","masculino/plural → in + Akkusativ: in die Schweiz, in die USA. ","mit + Dativ: mit dem Zug, mit der U-Bahn. ","INPUT: Próximo capítulo / Capítulo anterior " ]'::jsonb, 1, true),

('a1-cap12','a1-l12-2','A1','Transportes e Preposições de Destino','Transport  & Reiseziele',
'Fahren nach (cidades) vs. Fahren in (países com artigo). Mit + Dativ para meio de transporte.',
'nach + cidade/país (s/ art). in + Akkusativ (países c/ art). mit +  Dativ.',
'[{"de":"Ich fahre nach München.","pt":"Vou para Munique.","note":"nach"},{"de":"Ich fliege in die Türkei.","pt":"Voo para a Turquia.","note":"in + Akk"},{"de":"Er kommt mit dem Auto.","pt":"Ele vem de carro.","note":"mit + Dat"},{"de":"Wie lange dauert die Fahrt?","pt":"Quanto tempo dura a viagem?","note":"dauern"}]'::jsonb,
'[]'::jsonb,
'[ "DESTINOS COM NACH: ","Usado para cidades e países sem artigo. ","Ex: Ich fahre nach Berlin, nach Frankreich. "," ","DESTINOS COM IN + AKUSATIV: ","Usado para países com artigo (masculinos, femininos, plurais). ","Ex: Er fährt in die Schweiz (die Schweiz). ","Ex: Sie fliegt in die USA (die USA). ","Ex: Er reist in den Iran (der Iran). "," ","MEIOS DE TRANSPORTE COM MIT + DATIVO: ","Ich fahre mit dem Zug. ","Sie kommt mit der U-Bahn. ","Wir reisen mit dem Fahrrad. "," ","VERBOS SEPARÁVEIS DE VIAGEM: ","einsteigen: Ich steige ein. ","aussteigen: Ich steige aus. ","umsteigen: Ich steige um. " ]'::jsonb, 2, true),

('a1-cap12','a1-l12-3','A1','Cultura: Mobilidade  & Viagens','Kultur: Mobilität  & Reisen',
'Deutsche Bahn (DB). Deutschlandticket (€49). Umweltzone (Feinstaubplakette). Viajar com bicicleta.',
'DB, Deutschlandticket, Feinstaubplakette, Fahrradmitnahme, Reisepass vs. Ausweis.',
'[{"de":"die Deutsche Bahn","pt":"a rede ferroviária","note":"transporte"},{"de":"das Deutschlandticket","pt":"passe regional mensal","note":"ticket"},{"de":"die Feinstaubplakette","pt":"selo ambiental","note":"carro"}]'::jsonb,
'[]'::jsonb,
'[ "Mobilidade  & Viagens na Alemanha: "," ","• Deutsche Bahn (DB): ","  Principal operadora de trens. ICE é o trem rápido. ","  Atrasos são infelizmente comuns, mas o sistema é extenso. "," ","• Deutschlandticket (49€): ","  Passe mensal para transporte regional ilimitado (ônibus, trem, metrô). ","  Substituiu o antigo 9-Euro-Ticket. "," ","• Umweltzonen: ","  Cidades como Munique e Berlim exigem selo verde (Feinstaubplakette) para carros. ","  Sem ele, multa alta! "," ","• Fahrradmitnahme: ","  Bicicletas são permitidas em trens regionais (com taxa extra). ","  Em ICEs, reserva obrigatória. "," ","INPUT: Próximo capítulo / Capítulo anterior " ]'::jsonb, 3, true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 13: Im Restaurant – Bestellen und Essen
-- ══════════════════════════════════════════════════
('a1-cap13','a1-l13-1','A1','Diálogo: Pedido no restaurante','Dialog: Im Restaurant bestellen',
' DIÁLOGO COMPLETO EM ALEMÃO: 
Kellner: Guten Abend! Haben Sie schon gewählt? 
Anna: Guten Abend! Noch nicht ganz. Was empfehlen Sie? 
Kellner: Unser Schnitzel mit Pommes ist sehr beliebt. Und der Salat ist heute frisch. 
Tom: Das klingt gut! Ich nehme das Schnitzel, bitte. 
Kellner: Möchten Sie dazu einen Salat oder eine Suppe? 
Tom: Eine Suppe, bitte. Was für eine Suppe haben Sie? 
Kellner: Wir haben Tomatensuppe und Kartoffelsuppe. 
Tom: Dann nehme ich die Tomatensuppe. 
Anna: Ich möchte bitte den großen Salat mit Hähnchen. 
Kellner: Sehr gerne. Und was möchten Sie trinken? 
Anna: Ich hätte gern ein Glas Apfelschorle. 
Tom: Für mich ein Wasser, bitte. Mit oder ohne Kohlensäure? 
Kellner: Mit Kohlensäure, bitte. 
Anna: Und für mich auch ein Wasser, aber ohne Kohlensäure. 
Kellner: Alles klar. Möchten Sie noch etwas? 
Tom: Nein, danke. Das ist alles. 
Kellner: Dann bringe ich Ihre Bestellung gleich. (Nach dem Essen) 
Kellner: Hat es Ihnen geschmeckt? 
Anna: Ja, sehr gut! Danke. 
Tom: Das Schnitzel war lecker. Könnten wir bitte die Rechnung bekommen? 
Kellner: Natürlich. Zusammen oder getrennt? 
Anna: Zusammen, bitte. 
Kellner: Das macht 32 Euro, bitte. 
Tom: Hier, 35 Euro. Stimmt so. 
Kellner: Vielen Dank! Schönen Abend noch! 
Anna  & Tom: Danke, gleichfalls! Auf Wiedersehen!
TRADUÇÃO EM PORTUGUÊS: 
Garçom: Boa noite! Já escolheram? 
Anna: Boa noite! Ainda não completamente. O que o senhor recomenda? 
Garçom: Nosso bife à milanesa com batatas fritas é muito popular. E a salada está fresca hoje. 
Tom: Isso soa bem! Eu vou pegar o bife à milanesa, por favor. 
Garçom: Gostariam de uma salada ou uma sopa como acompanhamento? 
Tom: Uma sopa, por favor. Que tipo de sopa vocês têm? 
Garçom: Temos sopa de tomate e sopa de batata. 
Tom: Então eu vou pegar a sopa de tomate. 
Anna: Eu gostaria da salada grande com frango, por favor. 
Garçom: Com prazer. E o que gostariam de beber? 
Anna: Eu gostaria de um copo de suco de maçã com gás. 
Tom: Para mim, uma água, por favor. Com ou sem gás? 
Garçom: Com gás, por favor. 
Anna: E para mim também uma água, mas sem gás. 
Garçom: Tudo certo. Gostariam de mais alguma coisa? 
Tom: Não, obrigado. Isso é tudo. 
Garçom: Então trago seu pedido já. (Depois da refeição) 
Garçom: Estava bom para vocês? 
Anna: Sim, muito bom! Obrigado. 
Tom: O bife à milanesa estava delicioso. Poderíamos receber a conta, por favor? 
Garçom: Naturalmente. Juntos ou separados? 
Anna: Juntos, por favor. 
Garçom: São 32 euros, por favor. 
Tom: Aqui, 35 euros. Pode ficar com o troco. 
Garçom: Muito obrigado! Tenham uma boa noite! 
Anna  & Tom: Obrigado, igualmente! Até logo!',
'Ich möchte / Ich hätte gern + Akkusativ. Rechnung (conta). Bezahlen (pagar). Trinkgeld (gorjeta).',
'[{"de":"Ich hätte gern einen Salat.","pt":"Eu gostaria de uma salada.","note":"acusativo"},{"de":"Ich möchte die Rechnung.","pt":"Eu gostaria da conta.","note":"acusativo"},{"de":"Wir möchten bezahlen.","pt":"Nós gostaríamos de pagar.","note":"infinitivo no fim"},{"de":"Für mich ein Wasser, bitte.","pt":"Para mim, uma água.","note":"frase elíptica"}]'::jsonb,
'[{"de":"das Restaurant","pt":"o restaurante"},{"de":"der Kellner","pt":"o garçom"},{"de":"die Speisekarte","pt":"o cardápio"},{"de":"bestellen","pt":"pedir"},{"de":"die Vorspeise","pt":"a entrada"},{"de":"die Hauptspeise","pt":"o prato principal"},{"de":"die Nachspeise","pt":"a sobremesa"},{"de":"das Getränk","pt":"a bebida"},{"de":"ich möchte","pt":"eu gostaria"},{"de":"ich hätte gern","pt":"eu gostaria (mais educado)"},{"de":"empfehlen","pt":"recomendar"},{"de":"nehmen","pt":"escolher/pegar"},{"de":"schmecken","pt":"ter gosto"},{"de":"lecker","pt":"delicioso"},{"de":"die Rechnung","pt":"a conta"},{"de":"zusammen","pt":"juntos"},{"de":"getrennt","pt":"separados"},{"de":"das Schnitzel","pt":"o bife à milanesa"},{"de":"die Pommes","pt":"as batatas fritas"},{"de":"der Salat","pt":"a salada"},{"de":"die Suppe","pt":"a sopa"},{"de":"das Hähnchen","pt":"o frango"},{"de":"das Wasser","pt":"a água"},{"de":"die Kohlensäure","pt":"o gás (bebida)"},{"de":"mit / ohne","pt":"com / sem"},{"de":"das Glas","pt":"o copo"},{"de":"die Tasse","pt":"a xícara"},{"de":"der Löffel","pt":"a colher"},{"de":"die Gabel","pt":"o garfo"},{"de":"das Messer","pt":"a faca"},{"de":"der Teller","pt":"o prato"},{"de":"bezahlen","pt":"pagar"}]'::jsonb,
'[ "Ich möchte + Akkusativ: Ich möchte einen Salat. ","Ich möchte + Infinitivo (fim): Ich möchte bezahlen. ","Ich hätte gern = mais educado que ich möchte. ","Mit/ohne Kohlensäure = com/sem gás (para água). ","INPUT: Próximo capítulo / Capítulo anterior " ]'::jsonb, 1, true),

('a1-cap13','a1-l13-2','A1',' "Ich möchte " e Acusativo no Restaurante','Bestellen  & Akkusativ',
'Möchten é o conjuntivo de mögen, usado para pedidos educados. Seguido de acusativo ou infinitivo no fim.',
'Ich möchte + Akk (substantivo) / Infinitiv (verbo). Artigos no acusativo.',
'[{"de":"Ich möchte einen Kaffee.","pt":"Eu gostaria de um café.","note":"acusativo"},{"de":"Ich möchte essen.","pt":"Eu gostaria de comer.","note":"infinitivo"},{"de":"Hätten Sie gern Wasser?","pt":"O senhor gostaria de água?","note":"hätten (formal)"},{"de":"Für mich bitte die Suppe.","pt":"Para mim, a sopa.","note":"acusativo"}]'::jsonb,
'[]'::jsonb,
'[ "ICH MÖCHTE (Eu gostaria): ","Forma educada de pedir. Vem do verbo mögen. ","Conjugação: ","ich möchte, du möchtest, er möchte, ","wir möchten, ihr möchtet, sie möchten. "," ","ESTRUTURAS: ","1. Pedido de objeto: Ich möchte + Acusativo. ","   Ex: Ich möchte einen Salat (masc). ","   Ex: Ich möchte eine Suppe (fem). "," ","2. Pedido de ação: Ich möchte + Verbo no Infinitivo (no final). ","   Ex: Ich möchte bezahlen. ","   Ex: Wir möchten zahlen. "," ","3. Perguntas: ","   Was möchten Sie trinken? ","   Möchten Sie noch etwas? "," ","DICA: Ich hätte gern... é ligeiramente mais educado/sofisticado que Ich möchte. " ]'::jsonb, 2, true),

('a1-cap13','a1-l13-3','A1','Cultura: Gastronomia  & Etiqueta','Kultur: Gastronomie  & Tischsitten',
'Prost (olhar nos olhos). Trinkgeld (gorjeta). Leitungswasser (água da torneira rara). Abendbrot.',
'Prost!, Trinkgeld 5-10%, Wasser mit/ohne Kohlensäure, Abendbrot.',
'[{"de":"Prost!","pt":"Saúde!","note":"brinde"},{"de":"das Trinkgeld","pt":"a gorjeta","note":"etiqueta"},{"de":"die Mahlzeit","pt":"a refeição","note":"comida"}]'::jsonb,
'[]'::jsonb,
'[ "Gastronomia  & Etiqueta à Mesa na Alemanha: "," ","• Prost!: ","  Ao brindar, olhe nos olhos de TODOS. Acredita-se que não fazer isso dá 7 anos de azar no amor. "," ","• Trinkgeld (Gorjeta): ","  5-10% é padrão. Não se deixa na mesa. Diga o valor total ao pagar: 35 Euro, stimmt so. "," ","• Wasser im Restaurant: ","  Raramente servem água da torneira (Leitungswasser) de graça. ","  Peça Wasser mit Kohlensäure (com gás) ou ohne (sem). "," ","• Abendbrot: ","  Jantar tradicional leve: pão, queijo, embutidos, vegetais. ","  Comum no norte da Alemanha. "," ","INPUT: Próximo capítulo / Capítulo anterior " ]'::jsonb, 3, true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 14: Gefühle und Zustände – Über sich sprechen
-- ══════════════════════════════════════════════════
('a1-cap14','a1-l14-1','A1','Diálogo: Conversa sobre o dia','Dialog: Über Gefühle sprechen',
' DIÁLOGO COMPLETO EM ALEMÃO: 
Lisa: Hallo Max! Wie geht es dir heute? 
Max: Hallo Lisa! Ehrlich gesagt, ich bin müde. Und du? 
Lisa: Ich bin glücklich! Heute war ein guter Tag. 
Max: Warum bist du so glücklich? 
Lisa: Ich habe eine gute Note in der Prüfung bekommen! 
Max: Das ist super! Herzlichen Glückwunsch! Ich bin auch froh für dich. 
Lisa: Danke! Aber du siehst wirklich müde aus. Was ist los? 
Max: Ich habe viel gearbeitet und wenig geschlafen. Jetzt bin ich gestresst. 
Lisa: Das tut mir leid. Möchtest du über etwas sprechen? 
Max: Ja, ein bisschen. Ich bin manchmal unsicher bei der Arbeit. 
Lisa: Das ist normal. Jeder hat mal schlechte Tage. 
Max: Stimmt. Aber heute bin ich auch ein bisschen krank. Mein Kopf tut weh. 
Lisa: Oh nein! Dann solltest du nach Hause gehen und dich ausruhen. 
Max: Vielleicht hast du recht. Ich bin nicht sehr stark heute. 
Lisa: Pass auf dich auf! Morgen bist du bestimmt wieder fit. 
Max: Danke, Lisa. Du bist eine gute Freundin. Ich fühle mich schon besser! 
Lisa: Das freut mich! Ruf mich an, wenn du etwas brauchst. 
Max: Mache ich. Bis morgen? 
Lisa: Bis morgen! Gute Besserung! 
Max: Danke! Tschüss!
TRADUÇÃO EM PORTUGUÊS: 
Lisa: Olá Max! Como você está hoje? 
Max: Olá Lisa! Sinceramente, estou cansado. E você? 
Lisa: Estou feliz! Hoje foi um dia bom. 
Max: Por que você está tão feliz? 
Lisa: Eu tirei uma nota boa na prova! 
Max: Isso é ótimo! Parabéns! Eu também estou feliz por você. 
Lisa: Obrigada! Mas você parece realmente cansado. O que houve? 
Max: Eu trabalhei muito e dormi pouco. Agora estou estressado. 
Lisa: Sinto muito. Você gostaria de falar sobre algo? 
Max: Sim, um pouco. Eu às vezes fico inseguro no trabalho. 
Lisa: Isso é normal. Todo mundo tem dias ruins. 
Max: Verdade. Mas hoje eu também estou um pouco doente. Minha cabeça dói. 
Lisa: Ah, não! Então você deveria ir para casa e descansar. 
Max: Talvez você tenha razão. Não estou muito forte hoje. 
Lisa: Cuide-se! Amanhã você certamente estará bem de novo. 
Max: Obrigado, Lisa. Você é uma boa amiga. Já me sinto melhor! 
Lisa: Isso me alegra! Me liga se precisar de algo. 
Max: Vou ligar. Até amanhã? 
Lisa: Até amanhã! Melhoras! 
Max: Obrigado! Tchau!',
'Sein + Adjetivo (não declina). Dor: Körperteil + tut weh. Reflexivos básicos (sich fühlen).',
'[{"de":"Ich bin glücklich.","pt":"Eu estou feliz.","note":"sein + adj"},{"de":"Er ist krank.","pt":"Ele está doente.","note":"sein + adj"},{"de":"Mein Kopf tut weh.","pt":"Minha cabeça dói.","note":"tun weh"},{"de":"Ich fühle mich gut.","pt":"Eu me sinto bem.","note":"sich fühlen"},{"de":"Das tut mir leid.","pt":"Sinto muito.","note":"empolgação"}]'::jsonb,
'[{"de":"das Gefühl","pt":"o sentimento"},{"de":"der Zustand","pt":"o estado"},{"de":"glücklich","pt":"feliz"},{"de":"traurig","pt":"triste"},{"de":"müde","pt":"cansado"},{"de":"fit","pt":"disposto"},{"de":"gestresst","pt":"estressado"},{"de":"entspannt","pt":"relaxado"},{"de":"nervös","pt":"nervoso"},{"de":"ruhig","pt":"calmo"},{"de":"aufgeregt","pt":"animado"},{"de":"gelangweilt","pt":"entediado"},{"de":"überrascht","pt":"surpreso"},{"de":"stolz","pt":"orgulhoso"},{"de":"unsicher","pt":"inseguro"},{"de":"sicher","pt":"seguro"},{"de":"krank","pt":"doente"},{"de":"gesund","pt":"saudável"},{"de":"schwach","pt":"fraco"},{"de":"stark","pt":"forte"},{"de":"einsam","pt":"solitário"},{"de":"verliebt","pt":"apaixonado"},{"de":"wütend","pt":"com raiva"},{"de":"enttäuscht","pt":"decepcionado"},{"de":"zufrieden","pt":"satisfeito"},{"de":"das Fieber","pt":"a febre"},{"de":"der Kopf","pt":"a cabeça"},{"de":"der Bauch","pt":"a barriga"},{"de":"wehtun","pt":"doer"},{"de":"sich fühlen","pt":"sentir-se"},{"de":"sich ausruhen","pt":"descansar"}]'::jsonb,
'[ "Sein + Adjetivo = Invariável. Ich bin müde (não müder). ","Dor: Sujeito (parte do corpo) + tut weh. Mein Kopf tut weh. ","Sich fühlen: Ich fühle mich gut. ","Das tut mir leid = Sinto muito. ","INPUT: Próximo capítulo / Capítulo anterior " ]'::jsonb, 1, true),

('a1-cap14','a1-l14-2','A1','Sein + Adjetivo e Dores','Gefühle  & Schmerzen',
'Sein liga o sujeito ao adjetivo. O adjetivo predicativo não muda. Dores: parte do corpo + tut weh.',
'Sein + Adj (invariável). Körperteil + tut/tun weh. Sich fühlen. ',
'[{"de":"Sie ist traurig.","pt":"Ela está triste.","note":"sein + adj"},{"de":"Wir sind gestresst.","pt":"Nós estamos estressados.","note":"sein + adj"},{"de":"Meine Füße tun weh.","pt":"Meus pés doem.","note":"plural → tun"},{"de":"Ich fühle mich krank.","pt":"Sinto-me doente.","note":"sich fühlen"}]'::jsonb,
'[]'::jsonb,
'[ "SEIN + ADJETIVO (Estados/Sentimentos): ","O adjetivo após sein, werden, bleiben não declina. ","Ich bin müde. (não müder) ","Du bist glücklich. ","Er ist krank. "," ","EXPRIMINDO DOR: ","Estrutura 1: haben + dor (substantivo). ","Ich habe Kopfschmerzen. (Estou com dor de cabeça.) "," ","Estrutura 2: Parte do corpo + tut/tun weh. ","Mein Kopf tut weh. (Minha cabeça dói.) ","Meine Zähne tun weh. (Meus dentes doem - plural/tun). "," ","VERBOS REFLEXIVOS (Introdução A1): ","sich fühlen: Ich fühle mich gut/besser/schlecht. ","sich freuen: Ich freue mich. (Estou feliz) "," ","EXPRESSÕES ÚTEIS: ","Das tut mir leid. (Sinto muito - empatia) ","Gute Besserung! (Melhoras!) ","Pass auf dich auf! (Cuide-se!) " ]'::jsonb, 2, true),

('a1-cap14','a1-l14-3','A1','Cultura: Saúde  & Bem-Estar','Kultur: Gesundheit  & Wohlbefinden',
'Krankenkasse (plano). Krankschreibung (atestado). Apotheke (farmácia) vs Drogerie. Hausarzt.',
'Krankenkasse, Gelber Schein, Apotheke, Hausarzt.',
'[{"de":"die Krankenkasse","pt":"plano de saúde","note":"sistema"},{"de":"die Apotheke","pt":"farmácia (remédios)","note":"saúde"},{"de":"der Hausarzt","pt":"clínico geral","note":"médico"}]'::jsonb,
'[]'::jsonb,
'[ "Saúde  & Bem-Estar na Alemanha: "," ","• Krankenkasse: ","  Seguro saúde obrigatório. Público (gesetzlich) ou privado. ","  Leve sempre a Karte (cartão) ao médico. "," ","• Krankschreibung (Atestado): ","  A partir do 3º dia de doença, o empregador exige atestado médico. ","  Muitas vezes pede-se desde o 1º dia. "," ","• Apotheke vs. Drogerie: ","  Apotheke: Farmácia com farmacêutico (remédios tarja preta/vermelha, aspirina). ","  Drogerie (dm, Rossmann): Cosméticos, higiene, chás, remédios homeopáticos. "," ","• Hausarzt: ","  O clínico geral é a porta de entrada. Encaminha para especialistas. "," ","INPUT: Próximo capítulo / Capítulo anterior " ]'::jsonb, 3, true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 15: Beschreiben – Adjektive im Alltag
-- ══════════════════════════════════════════════════
('a1-cap15','a1-l15-1','A1','Diálogo: Descrevendo amigos e fotos','Dialog: Freunde beschreiben',
' DIÁLOGO COMPLETO EM ALEMÃO: 
Tom: Hallo Sophie! Wer ist das auf dem Foto? 
Sophie: Hallo Tom! Das ist meine Freundin Lena. Sie ist sehr nett und lustig. 
Tom: Sie sieht sympathisch aus! Ist sie groß? 
Sophie: Ja, sie ist 1,75 m groß und hat lange, braune Haare. 
Tom: Und was macht sie beruflich? 
Sophie: Sie ist Ärztin. Sie ist sehr intelligent und hilfsbereit. 
Tom: Das ist toll! Und wer ist der Mann neben ihr? 
Sophie: Das ist ihr Bruder Markus. Er ist sportlich und immer gut gelaunt. 
Tom: Er sieht stark aus! Spielt er Fußball? 
Sophie: Ja, er spielt sehr gut! Und er ist auch sehr zuverlässig. 
Tom: Klingt wie ein guter Freund! Hast du noch mehr Fotos? 
Sophie: Ja, schau mal! Das ist meine WG: Anna, Ben und ich. 
Tom: Ihr seht alle glücklich aus! 
Sophie: Ja, wir sind ein tolles Team! Anna ist kreativ, Ben ist ruhig und ich bin... na ja, ich bin einfach ich! 
Tom: Haha! Du bist spontan und freundlich. Das mag ich an dir! 
Sophie: Danke, Tom! Du bist auch ein super Freund! 
Tom: Sag mal, ist dein Zimmer groß? 
Sophie: Nein, es ist klein, aber hell und gemütlich. 
Tom: Das ist doch das Wichtigste! 
Sophie: Genau! Komm, ich zeige es dir!
TRADUÇÃO EM PORTUGUÊS: 
Tom: Olá Sophie! Quem é essa na foto? 
Sophie: Olá Tom! Essa é a minha amiga Lena. Ela é muito legal e engraçada. 
Tom: Ela parece simpática! Ela é alta? 
Sophie: Sim, ela tem 1,75 m de altura e tem cabelos longos e castanhos. 
Tom: E o que ela faz profissionalmente? 
Sophie: Ela é médica. Ela é muito inteligente e prestativa. 
Tom: Isso é ótimo! E quem é o homem ao lado dela? 
Sophie: Esse é o irmão dela, Markus. Ele é esportista e sempre de bom humor. 
Tom: Ele parece forte! Ele joga futebol? 
Sophie: Sim, ele joga muito bem! E ele também é muito confiável. 
Tom: Parece um bom amigo! Você tem mais fotos? 
Sophie: Sim, olha! Essa é a minha república: Anna, Ben e eu. 
Tom: Vocês parecem todos felizes! 
Sophie: Sim, nós somos um time ótimo! Anna é criativa, Ben é calmo e eu sou... bem, eu sou simplesmente eu! 
Tom: Haha! Você é espontânea e amigável. Eu gosto disso em você! 
Sophie: Obrigada, Tom! Você também é um ótimo amigo! 
Tom: Diga-me, seu quarto é grande? 
Sophie: Não, é pequeno, mas claro e aconchegante. 
Tom: Isso é o mais importante! 
Sophie: Exato! Vem, eu te mostro!',
'Aussehen + adjetivo. Comparação: so... wie. Adjetivos após sein (sem declinação).',
'[{"de":"Sie sieht nett aus.","pt":"Ela parece legal.","note":"aussehen"},{"de":"Er ist so groß wie ich.","pt":"Ele é tão alto quanto eu.","note":"so...wie"},{"de":"Das Zimmer ist klein, aber hell.","pt":"O quarto é pequeno, mas claro.","note":"sein+adj"},{"de":"Sie ist intelligent.","pt":"Ela é inteligente.","note":"predicativo"}]'::jsonb,
'[{"de":"beschreiben","pt":"descrever"},{"de":"das Adjektiv","pt":"o adjetivo"},{"de":"nett","pt":"legal"},{"de":"lustig","pt":"engraçado"},{"de":"sympathisch","pt":"simpático"},{"de":"intelligent","pt":"inteligente"},{"de":"hilfsbereit","pt":"prestativo"},{"de":"sportlich","pt":"esportista"},{"de":"gut gelaunt","pt":"de bom humor"},{"de":"zuverlässig","pt":"confiável"},{"de":"kreativ","pt":"criativo"},{"de":"ruhig","pt":"calmo"},{"de":"spontan","pt":"espontâneo"},{"de":"freundlich","pt":"amigável"},{"de":"ehrlich","pt":"honesto"},{"de":"geduldig","pt":"paciente"},{"de":"flexibel","pt":"flexível"},{"de":"ordentlich","pt":"organizado"},{"de":"chaotisch","pt":"caótico"},{"de":"lang/kurz","pt":"longo/curto"},{"de":"hell/dunkel","pt":"claro/escuro"},{"de":"laut/leise","pt":"barulhento/silencioso"},{"de":"sauber/schmutzig","pt":"limpo/sujo"},{"de":"neu/alt","pt":"novo/velho"},{"de":"modern","pt":"moderno"},{"de":"wichtig","pt":"importante"},{"de":"ähnlich","pt":"semelhante"},{"de":"unterschiedlich","pt":"diferente"},{"de":"aussehen","pt":"parecer"},{"de":"wie?","pt":"como?"},{"de":"die Eigenschaft","pt":"a característica"}]'::jsonb,
'[ "Aussehen + adj = aparência. Du siehst müde aus. ","so... wie = comparação de igualdade. Er ist so alt wie ich. ","Adjetivos após sein são invariáveis. ","INPUT: Próximo capítulo / Capítulo anterior " ]'::jsonb, 1, true),

('a1-cap15','a1-l15-2','A1','Adjetivos: Aussehen e Comparações','Adjektive  & Vergleiche',
'Adjetivos predicativos (após verbos) não declinam. Aussehen para aparência. so + adj + wie para igualdade.',
'Sein + Adj (invariável). aussehen + adj. so...wie.',
'[{"de":"Die Wohnung ist gemütlich.","pt":"O apartamento é aconchegante.","note":"sein"},{"de":"Du siehst toll aus!","pt":"Você está ótimo!","note":"aussehen"},{"de":"Anna ist so nett wie Ben.","pt":"Anna é tão legal quanto Ben.","note":"so...wie"},{"de":"Er ist genauso groß wie ich.","pt":"Ele é tão alto quanto eu.","note":"genauso...wie"}]'::jsonb,
'[]'::jsonb,
'[ "ADJETIVOS PREDICATIVOS: ","Quando o adjetivo vem após verbos como sein, werden, bleiben, ele NÃO muda. ","Sie ist nett. (Não: nette) ","Das Buch ist interessant. "," ","AUSSEHEN (Aparência): ","Verbo separável. Indica aparência visual. ","Du siehst müde aus. (Você parece cansado.) ","Wie siehst du aus? (Como você é?) "," ","COMPARAÇÕES (Igualdade): ","Estrutura: so + adjetivo + wie (quanto/como). ","Er ist so groß wie ich. (Ele é tão alto quanto eu.) ","Das Auto ist so teuer wie das Fahrrad. "," ","VARIAÇÃO (genauso...wie): ","Lena ist genauso intelligent wie ihre Mutter. (Exatamente tão... quanto) "," ","OPINIÃO: ","Das ist wichtig. / Das ist schwierig. / Das ist einfach. " ]'::jsonb, 2, true),

('a1-cap15','a1-l15-3','A1','Cultura: Personalidade  & WG','Kultur: Persönlichkeit  & WG',
'Direto mas respeitoso. Sympathisch. WG (república). Small talk limitado.',
'Sympathisch  > Inteligente. WG-Kultur. Direto.',
'[{"de":"sympathisch","pt":"simpático","note":"elogio"},{"de":"die WG","pt":"república","note":"moradia"},{"de":"direkt","pt":"direto","note":"comunicação"}]'::jsonb,
'[]'::jsonb,
'[ "Personalidade  & Comunicação na Alemanha: "," ","• Sympathisch: ","  É o elogio mais valorizado. Mais importante que ser inteligente ou rico. ","  Significa ser agradável, confiável e fácil de conviver. "," ","• WG-Kultur (Wohngemeinschaft): ","  Morar em república é comum entre jovens/estudantes. ","  Anúncios pedem: ruhig, ordentlich, freundlich. ","  WG-Party é tradição. "," ","• Direto mas Respeitoso: ","  Alemães são diretos. Críticas são construtivas. ","  Small talk é breve. Conversas profundas são preferidas. "," ","INPUT: Próximo capítulo / Capítulo anterior " ]'::jsonb, 3, true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 16: Wichtige Verben – Kommunikation im Alltag
-- ══════════════════════════════════════════════════
('a1-cap16','a1-l16-1','A1','Diálogo: Emma e Lukas planejam uma noite','Dialog: Einen Abend planen',
' DIÁLOGO COMPLETO EM ALEMÃO: 
Emma: Hallo Lukas! Hast du heute Abend Zeit? 
Lukas: Hallo Emma! Mal sehen. Was möchtest du machen? 
Emma: Ich möchte ins Kino gehen. Der neue Film läuft ab 20 Uhr. 
Lukas: Gute Idee! Ich esse aber erst um 19 Uhr zu Abend. 
Emma: Kein Problem. Wir treffen uns um 19:30 Uhr vor dem Kino? 
Lukas: Perfekt! Hast du schon Karten gekauft? 
Emma: Nein, noch nicht. Ich rufe gleich an. 
Lukas: Super! Sag mal, sprichst du mit deiner Schwester? 
Emma: Ja, ich spreche oft mit ihr. Sie wohnt in Hamburg. 
Lukas: Und isst sie gern deutsches Essen? 
Emma: Ja, sie isst sehr gern Schnitzel und Kartoffeln! 
Lukas: Haha! Das ist typisch! Ich habe auch Hunger auf Schnitzel. 
Emma: Dann können wir nach dem Film noch etwas essen! 
Lukas: Einverstanden! Was hast du morgen vor? 
Emma: Morgen habe ich einen Termin beim Arzt. Und du? 
Lukas: Ich habe frei! Vielleicht können wir zusammen frühstücken? 
Emma: Gerne! Um 10 Uhr im Café am Markt? 
Lukas: Abgemacht! Ich freue mich schon! 
Emma: Ich auch! Bis heute Abend! 
Lukas: Bis später! Und vergiss die Karten nicht! 
Emma: Mache ich nicht! Tschüss!
TRADUÇÃO EM PORTUGUÊS: 
Emma: Olá Lukas! Você tem tempo hoje à noite? 
Lukas: Olá Emma! Vamos ver. O que você gostaria de fazer? 
Emma: Eu gostaria de ir ao cinema. O novo filme começa às 20h. 
Lukas: Boa ideia! Mas eu só janto às 19h. 
Emma: Sem problema. Nos encontramos às 19:30 em frente ao cinema? 
Lukas: Perfeito! Você já comprou ingressos? 
Emma: Não, ainda não. Eu ligo já. 
Lukas: Ótimo! Diga-me, você fala com sua irmã? 
Emma: Sim, eu falo frequentemente com ela. Ela mora em Hamburgo. 
Lukas: E ela gosta de comer comida alemã? 
Emma: Sim, ela gosta muito de bife à milanesa e batatas! 
Lukas: Haha! Isso é típico! Eu também estou com vontade de bife à milanesa. 
Emma: Então podemos comer algo depois do filme! 
Lukas: Combinado! O que você vai fazer amanhã? 
Emma: Amanhã eu tenho uma consulta médica. E você? 
Lukas: Eu estou livre! Talvez possamos tomar café da manhã juntos? 
Emma: Com prazer! Às 10h no café na praça do mercado? 
Lukas: Combinado! Já estou ansioso! 
Emma: Eu também! Até hoje à noite! 
Lukas: Até mais tarde! E não esqueça os ingressos! 
Emma: Não vou esquecer! Tchau!',
'Verbos irregulares: essen (isst), sprechen (spricht). kennen (pessoas) vs. wissen (fatos).',
'[{"de":"Er isst sehr gern Schnitzel.","pt":"Ele gosta muito de comer bife à milanesa.","note":"essen: e→i"},{"de":"Sie spricht oft mit ihm.","pt":"Ela fala frequentemente com ele.","note":"sprechen: e→i"},{"de":"Ich weiß, dass du kommst.","pt":"Eu sei que você vem.","note":"wissen + dass"},{"de":"Kennst du Berlin?","pt":"Você conhece Berlim?","note":"kennen + Akk"}]'::jsonb,
'[{"de":"das Verb","pt":"o verbo"},{"de":"wichtig","pt":"importante"},{"de":"die Kommunikation","pt":"a comunicação"},{"de":"der Alltag","pt":"o cotidiano"},{"de":"haben","pt":"ter"},{"de":"sein","pt":"ser/estar"},{"de":"essen","pt":"comer"},{"de":"sprechen","pt":"falar"},{"de":"lesen","pt":"ler"},{"de":"schreiben","pt":"escrever"},{"de":"sehen","pt":"ver"},{"de":"nehmen","pt":"pegar/tomar"},{"de":"geben","pt":"dar"},{"de":"helfen","pt":"ajudar"},{"de":"verstehen","pt":"entender"},{"de":"kennen","pt":"conhecer (pessoas/lugares)"},{"de":"wissen","pt":"saber (informações)"},{"de":"wollen","pt":"querer"},{"de":"können","pt":"poder/conseguir"},{"de":"müssen","pt":"precisar/dever"},{"de":"dürfen","pt":"poder (permissão)"},{"de":"sollen","pt":"dever (conselho)"},{"de":"der Film","pt":"o filme"},{"de":"das Kino","pt":"o cinema"},{"de":"die Karte","pt":"o ingresso/o cartão"},{"de":"anrufen","pt":"ligar (telefone)"},{"de":"treffen","pt":"encontrar"},{"de":"warten","pt":"esperar"},{"de":"vergessen","pt":"esquecer"},{"de":"mitbringen","pt":"trazer consigo"}]'::jsonb,
'[ "essen/sprechen: e→i em du/er (du isst, er spricht) ","kennen = conhecer pessoas/lugares | wissen = saber fatos ","haben + Akkusativ: Ich habe Hunger. sein + Adj: Sie ist nett. " ]'::jsonb, 1, true),

('a1-cap16','a1-l16-2','A1','Verbos Irregulares Essenciais no Presente','Unregelmäßige Verben im Präsens',
'Verbos como essen e sprechen mudam a vogal na 2ª/3ª pessoa. sein e haben  são totalmente irregulares e essenciais.',
'essen: esse/isst/isst | sprechen: spreche/sprichst/spricht | sein/haben: decorar!',
'[{"de":"Ich esse Pizza, du isst Pasta.","pt":"Eu como pizza, você come macarrão.","note":"essen"},{"de":"Er spricht Deutsch, sie spricht Spanisch.","pt":"Ele fala alemão, ela fala espanhol.","note":"sprechen"},{"de":"Ich bin müde, du bist fit.","pt":"Estou cansado, você está disposto.","note":"sein"},{"de":"Wir haben Zeit, sie haben Geld.","pt":"Temos tempo, eles têm dinheiro.","note":"haben"}]'::jsonb,
'[]'::jsonb,
'[ "CONJUGAÇÃO DOS 4 ESSENCIAIS: ","SEIN: ich bin | du bist | er ist | wir sind | ihr seid | sie sind ","HABEN: ich habe | du hast | er hat | wir haben | ihr habt | sie haben ","ESSEN: ich esse | du isst | er isst | wir essen | ihr esst | sie essen ","SPRECHEN: ich spreche | du sprichst | er spricht | wir sprechen | ihr sprecht | sie sprechen "," ","PADRÃO DE MUDANÇA: ","e → i na 2ª/3ª pessoa singular para verbos como essen, sprechen, helfen, geben. "," ","ESTRUTURAS COMUNS: ","haben + Akkusativ: Ich habe Hunger / Zeit / einen Termin. ","sein + Adjektiv: Sie ist nett / krank / glücklich. ","sprechen + mit + Dativ: Ich spreche mit dir / mit dem Lehrer. " ]'::jsonb, 2, true),

('a1-cap16','a1-l16-3','A1','Cultura: Comunicação no Cotidiano Alemão','Kultur: Kommunikation im Alltag',
'„Haben Sie Zeit? " inicia conversas. Pedir repetição é normal. Modalverb nuances: wollen vs. möchten.',
'Können = habilidade | Möchten = desejo educado | Wollen = desejo forte.',
'[{"de":"Haben Sie Zeit?","pt":"Você tem tempo?","note":"iniciar conversa"},{"de":"Können Sie das wiederholen?","pt":"Pode repetir, por favor?","note":"pedir clareza"},{"de":"Ich möchte...","pt":"Eu gostaria de...","note":"educado"}]'::jsonb,
'[]'::jsonb,
'[ "Comunicação & Verbos no Cotidiano Alemão:","","• \"Haben Sie Zeit?\": Pergunta educada para iniciar conversas.","  Respostas diretas são apreciadas: \"Ja, kurz\" ou \"Leider nein\".","","• \"Können Sie das bitte wiederholen?\":","  Pedir para repetir é normal e bem-visto. Alemães valorizam clareza.","","• Modalverb-Nuances:","  \"Ich will...\" = desejo forte (pode soar exigente)","  \"Ich möchte...\" = desejo educado (preferido)","  \"Ich kann...\" = habilidade ou possibilidade","","• Regionalismos verbais:","  No sul, \"grüßen\" é mais comum que \"sagen\"; no norte, \"schnacken\" = conversar.","","• Digital Communication:","  Em mensagens, \"LG\" (Liebe Grüße) e \"VG\" (Viele Grüße) são encerramentos padrão.","","INPUT: Próximo capítulo / Capítulo anterior"]'::jsonb, 3, true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 17: Dativ im Alltag – Mit anderen interagieren
-- ══════════════════════════════════════════════════
('a1-cap17','a1-l17-1','A1','Diálogo: Julia encontra-se com amigos','Dialog: Sich mit Freunden treffen',
' DIÁLOGO COMPLETO EM ALEMÃO: 
Julia: Hallo Lena! Wie geht es dir? 
Lena: Hallo Julia! Mir geht es gut, danke! Und dir? 
Julia: Mir auch, danke! Kommst du mit mir zum Markt? 
Lena: Gerne! Ich muss noch etwas von meiner Mutter holen. 
Julia: Was denn? 
Lena: Einen Schlüssel. Er liegt bei ihr zu Hause. 
Julia: Kein Problem. Wir gehen zuerst zu deiner Mutter, dann zum Markt. 
Julia: Sag mal, schenkst du deinem Bruder etwas zum Geburtstag? 
Lena: Ja, ich kaufe ihm ein Buch. Und du? Schenkst du deiner Freundin etwas? 
Julia: Ja, ich gebe ihr Blumen. Sie mag Rosen sehr gern. 
Lena: Das ist eine schöne Idee! Hilfst du mir bitte mit den Taschen? 
Julia: Natürlich! Ich trage sie für dich. 
Lena: Danke, Julia! Du bist eine gute Freundin. 
Julia: Gern geschehen! Komm, wir gehen jetzt. Der Markt schließt um 18 Uhr. 
Lena: Okay! Von hier aus sind es nur zehn Minuten zu Fuß. 
Julia: Perfekt! Dann laufe ich mit dir. 
Lena: Super! Ich freue mich auf den Markt! 
Julia: Ich auch! Bis gleich dort!
TRADUÇÃO EM PORTUGUÊS: 
Julia: Olá Lena! Como vai você? 
Lena: Olá Julia! Eu estou bem, obrigada! E você? 
Julia: Eu também, obrigada! Você vem comigo ao mercado? 
Lena: Com prazer! Eu preciso pegar algo da minha mãe ainda. 
Julia: O que é? 
Lena: Uma chave. Está na casa dela. 
Julia: Sem problema. Vamos primeiro à sua mãe, depois ao mercado. 
Julia: Diga-me, você dá algo ao seu irmão pelo aniversário? 
Lena: Sim, eu compro um livro para ele. E você? Você dá algo à sua amiga? 
Julia: Sim, eu dou flores a ela. Ela gosta muito de rosas. 
Lena: Essa é uma ideia bonita! Você me ajuda com as sacolas, por favor? 
Julia: Naturalmente! Eu carrego elas para você. 
Lena: Obrigada, Julia! Você é uma boa amiga. 
Julia: De nada! Vem, vamos agora. O mercado fecha às 18h. 
Lena: Ok! Daqui são apenas dez minutos a pé. 
Julia: Perfeito! Então eu caminho com você. 
Lena: Ótimo! Estou ansiosa pelo mercado! 
Julia: Eu também! Até já lá!',
'Dativo com preposições: mit/zu/von + dativo. Pronomes: mir, dir, ihm, ihr. Verbos: helfen, danken + dativo.',
'[{"de":"Ich helfe dir.","pt":"Eu ajudo você.","note":"helfen + dativo"},{"de":"Ich gehe mit dir zum Markt.","pt":"Vou com você ao mercado.","note":"mit + dativo"},{"de":"Das Geschenk ist von meinem Bruder.","pt":"O presente é do meu irmão.","note":"von + dativo"},{"de":"Ich schreibe ihm eine E-Mail.","pt":"Escrevo um e-mail para ele.","note":"indireto = dativo"}]'::jsonb,
'[{"de":"der Dativ","pt":"o caso dativo"},{"de":"interagieren","pt":"interagir"},{"de":"mit + Dativ","pt":"com + dativo"},{"de":"zu + Dativ","pt":"para/a + dativo"},{"de":"von + Dativ","pt":"de + dativo"},{"de":"bei + Dativ","pt":"na casa de/junto a + dativo"},{"de":"helfen","pt":"ajudar (+ dativo)"},{"de":"danken","pt":"agradecer (+ dativo)"},{"de":"gefallen","pt":"agradar (+ dativo)"},{"de":"gehören","pt":"pertencer (+ dativo)"},{"de":"schenken","pt":"dar de presente (+ dativo)"},{"de":"geben","pt":"dar (+ dativo para pessoa)"},{"de":"mir","pt":"a/para mim"},{"de":"dir","pt":"a/para você (informal)"},{"de":"ihm/ihr","pt":"a/para ele/ela"},{"de":"uns","pt":"a/para nós"},{"de":"euch","pt":"a/para vocês (informal)"},{"de":"ihnen/Ihnen","pt":"a/para eles/elas/o(a) senhor(a)"},{"de":"der Markt","pt":"o mercado"},{"de":"die Tasche","pt":"a sacola/bolsa"},{"de":"der Schlüssel","pt":"a chave"},{"de":"der Geburtstag","pt":"o aniversário"},{"de":"das Geschenk","pt":"o presente"},{"de":"die Blumen","pt":"as flores"},{"de":"zu Fuß","pt":"a pé"},{"de":"gern geschehen","pt":"de nada"},{"de":"sich freuen auf","pt":"estar ansioso por"},{"de":"abmachen","pt":"combinar"}]'::jsonb,
'[ "Pronomes dativo: mir, dir, ihm, ihr, uns, euch, ihnen. ","Artigos dativo: der/das→dem, die→der, plural→den(+n). ","Preposições dativo: mit, zu, von, bei, nach, aus. ","INPUT: Próximo capítulo / Capítulo anterior. " ]'::jsonb, 1, true),

('a1-cap17','a1-l17-2','A1','Introdução ao Dativo: Pronomes e Preposições','Einführung in den Dativ',
'O dativo indica o destinatário indireto. Preposições fixas: mit/zu/von exigem  dativo. Verbos como helfen e danken também.',
'mit/zu/von + dativo. Pronomes: mir/dir/ihm. Artigos: der→dem, die→der, plural→den.',
'[{"de":"Ich danke dir sehr.","pt":"Agradeço muito a você.","note":"danken + dativo"},{"de":"Das Buch gehört mir.","pt":"O livro pertence a mim.","note":"gehören + dativo"},{"de":"Ich gehe zu meiner Mutter.","pt":"Vou à minha mãe.","note":"zu + dativo"},{"de":"Wir helfen den Freunden.","pt":"Ajudamos os amigos.","note":"helfen + plural dativo"}]'::jsonb,
'[]'::jsonb,
'[ "PRONOMES PESSOAIS NO DATIVO: ","ich → mir | du → dir | er/sie/es → ihm/ihr/ihm ","wir → uns | ihr → euch | sie/Sie → ihnen/Ihnen "," ","ARTIGOS NO DATIVO: ","Masculino: der Mann → dem Mann ","Feminino: die Frau → der Frau ","Neutro: das Kind → dem Kind ","Plural: die Freunde → den Freunden (+n no substantivo) "," ","PREPOSIÇÕES QUE EXIGEM DATIVO (A1): ","mit (com): Ich gehe mit dir. ","zu (para/a): Ich gehe zum Markt (zu + dem). ","von (de): Das ist von meinem Bruder. ","bei (na casa de): Ich wohne bei meinen Eltern. "," ","VERBOS COM DATIVO: ","helfen: Kannst du mir helfen? ","danken: Ich danke dir. ","gefallen: Das Buch gefällt mir. ","gehören: Das Handy gehört ihr. " ]'::jsonb, 2, true),

('a1-cap17','a1-l17-3','A1','Cultura: Interação Social  & Cortesia','Kultur: Soziale Interaktion  & Höflichkeit',
'„Helfen " é valorizado. Agradecer formalmente: Vielen Dank. Presentes: abre-se na frente. „bei " + dativo para visitas.',
'Oferecer ajuda, agradecer, presentear com modéstia, visitas com „bei ".',
'[{"de":"Kann ich helfen?","pt":"Posso ajudar?","note":"oferecer ajuda"},{"de":"Vielen Dank!","pt":"Muito obrigado!","note":"agradecer formal"},{"de":"Ich bin bei Freunden.","pt":"Estou na casa de amigos.","note":"visitas"}]'::jsonb,
'[]'::jsonb,
'[ 
"Interação Social & Cortesia na Alemanha:",
"",
"• \"Helfen\" é valorizado:",
"  Oferecer ajuda (\"Kann ich helfen?\") é bem-visto em lojas, transporte e vizinhança.",
"",
"• Agradecer formalmente:",
"  \"Vielen Dank\" ou \"Herzlichen Dank\" soam mais educados que apenas \"Danke\".",
"",
"• Presentes com modéstia:",
"  Ao receber um presente, abre-se na frente de quem deu e comenta-se positivamente:",
"  \"Wie schön! Danke!\"",
"",
"• Visitas: \"bei\" + dativo:",
"  Dizer \"Ich bin bei Freunden\" (estou na casa de amigos) é mais comum que \"zu Hause\".",
"",
"• Dativ na prática:",
"  Em formulários, \"Empfänger\" (destinatário) e \"Absender\" (remetente) exigem dativo.",
"",
"INPUT: Próximo capítulo / Capítulo anterior"
]'::jsonb, 3, true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 18: Fragen stellen – Kommunikation aufbauen
-- ══════════════════════════════════════════════════
('a1-cap18','a1-l18-1','A1','Diálogo: Entrevista para a escola','Dialog: Ein Interview für die Schule',
' DIÁLOGO COMPLETO EM ALEMÃO: 
Interviewer: Guten Tag! Darf ich dir ein paar Fragen stellen? 
Schülerin: Guten Tag! Ja, natürlich. 
Interviewer: Wie heißt du? 
Schülerin: Ich heiße Sophie. 
Interviewer: Wie alt bist du, Sophie? 
Schülerin: Ich bin 16 Jahre alt. 
Interviewer: Wo wohnst du? 
Schülerin: Ich wohne in Frankfurt. 
Interviewer: Hast du Geschwister? 
Schülerin: Ja, ich habe einen Bruder. 
Interviewer: Wie heißt er? 
Schülerin: Er heißt Lukas. 
Interviewer: Was macht ihr gern zusammen? 
Schülerin: Wir spielen gern Fußball und sehen Filme. 
Interviewer: Welche Hobbys hast du? 
Schülerin: Ich lese gern, schwimme und male. 
Interviewer: Wann hast du Zeit für Hobbys? 
Schülerin: Am Wochenende und nach der Schule. 
Interviewer: Warum lernst du Deutsch? 
Schülerin: Weil ich später in Deutschland studieren möchte. 
Interviewer: Wie findest du Deutsch? 
Schülerin: Deutsch ist interessant, aber manchmal schwierig! 
Interviewer: Hast du noch eine Frage an mich? 
Schülerin: Ja! Woher kommst du? 
Interviewer: Ich komme aus Berlin. 
Schülerin: Cool! Danke für das Interview! 
Interviewer: Gerne! Viel Erfolg beim Deutschlernen! 
Schülerin: Danke! Auf Wiedersehen! 
Interviewer: Tschüss, Sophie!
TRADUÇÃO EM PORTUGUÊS: 
Entrevistador: Bom dia! Posso fazer algumas perguntas? 
Aluna: Bom dia! Sim, claro. 
Entrevistador: Como você se chama? 
Aluna: Eu me chamo Sophie. 
Entrevistador: Quantos anos você tem, Sophie? 
Aluna: Eu tenho 16 anos. 
Entrevistador: Onde você mora? 
Aluna: Eu moro em Frankfurt. 
Entrevistador: Você tem irmãos? 
Aluna: Sim, eu tenho um irmão. 
Entrevistador: Como ele se chama? 
Aluna: Ele se chama Lukas. 
Entrevistador: O que vocês gostam de fazer juntos? 
Aluna: Nós gostamos de jogar futebol e assistir filmes. 
Entrevistador: Quais hobbies você tem? 
Aluna: Eu gosto de ler, nadar e pintar. 
Entrevistador: Quando você tem tempo para hobbies? 
Aluna: No fim de semana e depois da escola. 
Entrevistador: Por que você aprende alemão? 
Aluna: Porque eu gostaria de estudar na Alemanha no futuro. 
Entrevistador: O que você acha do alemão? 
Aluna: Alemão é interessante, mas às vezes difícil! 
Entrevistador: Você tem mais alguma pergunta para mim? 
Aluna: Sim! De onde você é? 
Entrevistador: Eu sou de Berlim. 
Aluna: Legal! Obrigada pela entrevista! 
Entrevistador: De nada! Muito sucesso aprendendo alemão! 
Aluna: Obrigada! Até logo! 
Entrevistador: Tchau, Sophie!',
'W-Fragen: palavra interrogativa em 1º, verbo em 2º. Ja/Nein-Fragen: verbo em 1º. Respostas curtas úteis.',
'[{"de":"Wo wohnst du?","pt":"Onde você mora?","note":"Wo? = lugar"},{"de":"Hast du Geschwister?","pt":"Você tem irmãos?","note":"Ja/Nein-Frage"},{"de":"Warum lernst du Deutsch?","pt":"Por que você aprende alemão?","note":"Warum? = razão"},{"de":"Wie findest du Deutsch?","pt":"O que você acha do alemão?","note":"Wie? = opinião"}]'::jsonb,
'[{"de":"die Frage","pt":"a pergunta"},{"de":"fragen","pt":"perguntar"},{"de":"beantworten","pt":"responder"},{"de":"W-Frage","pt":"pergunta com palavra interrogativa"},{"de":"Ja/Nein-Frage","pt":"pergunta de sim/não"},{"de":"wer?","pt":"quem?"},{"de":"was?","pt":"o quê?"},{"de":"wo?","pt":"onde?"},{"de":"wohin?","pt":"para onde?"},{"de":"woher?","pt":"de onde?"},{"de":"wann?","pt":"quando?"},{"de":"warum?","pt":"por quê?"},{"de":"wie?","pt":"como?"},{"de":"wie viel?","pt":"quanto? (singular)"},{"de":"wie viele?","pt":"quantos? (plural)"},{"de":"welcher/welche/welches?","pt":"qual?"},{"de":"vielleicht","pt":"talvez"},{"de":"natürlich","pt":"naturalmente/claro"},{"de":"genau","pt":"exatamente"},{"de":"leider","pt":"infelizmente"},{"de":"wirklich","pt":"realmente"},{"de":"eigentlich","pt":"na verdade/aliás"},{"de":"übrigens","pt":"a propósito"},{"de":"das Interview","pt":"a entrevista"},{"de":"der Erfolg","pt":"o sucesso"},{"de":"lernen","pt":"aprender"},{"de":"üben","pt":"praticar"},{"de":"verstehen","pt":"entender"},{"de":"erklären","pt":"explicar"},{"de":"wiederholen","pt":"repetir"}]'::jsonb,
'[ "W-Fragen: Interrogativa(1) + verbo(2) + sujeito(3) + ... ","Ja/Nein: Verbo(1) + sujeito(2) + ...? ","Respostas: Ja/Nein/Vielleicht + frase completa ou curta. ","INPUT: Próximo capítulo / Capítulo anterior. " ]'::jsonb, 1, true),

('a1-cap18','a1-l18-2','A1','W-Fragen e Ja/Nein-Fragen','W-Fragen  & Ja/Nein-Fragen',
'W-Fragen buscam informação específica. Ja/Nein-Fragen confirmam ou negam. Estrutura: verbo na posição correta.',
'W-Frage(1) + verbo(2) + sujeito(3). Ja/Nein: verbo(1) + sujeito(2).',
'[{"de":"Woher kommst du?","pt":"De onde você é?","note":"Woher? = origem"},{"de":"Kannst du schwimmen?","pt":"Você sabe nadar?","note":"Ja/Nein com modal"},{"de":"Wie viel kostet das?","pt":"Quanto custa isso?","note":"Wie viel? = preço"},{"de":"Welches Buch liest du?","pt":"Qual livro você lê?","note":"Welches? = escolha"}]'::jsonb,
'[]'::jsonb,
'[ "ESTRUTURA DAS W-FRAGEN: ","1. Palavra interrogativa (Wo? Was? Wer? Wann? Warum? Wie?) ","2. Verbo conjugado ","3. Sujeito (se houver) ","4. Resto da frase ","Ex: Wo wohnst du? | Was machst du am Wochenende? "," ","JA/NEIN-FRAGEN: ","1. Verbo conjugado ","2. Sujeito ","3. Resto da frase ","Ex: Hast du Zeit? | Kannst du mir helfen? | Möchtest du Kaffee? "," ","RESPOSTAS CURTAS ÚTEIS: ","Hast du...? → Ja, ich habe... / Nein, ich habe kein... ","Bist du...? → Ja, ich bin... / Nein, ich bin nicht... ","Kannst du...? → Ja, ich kann. / Nein, ich kann nicht. ","Möchtest du...? → Ja, gern! / Nein, danke. "," ","DICAS PARA MANTER A CONVERSA: ","Und du? = E você? (retornar pergunta) ","Verstehe. = Entendo. ","Interessant! = Interessante! ","Kannst du das wiederholen? = Pode repetir? " ]'::jsonb, 2, true),

('a1-cap18','a1-l18-3','A1','Cultura: Estilo de Perguntas na Alemanha','Kultur: Fragetechnik  & Kommunikation',
'Perguntas diretas são normais. „Wie geht''s? " espera resposta breve. Silêncio é aceitável. Feedback construtivo.',
'Direto mas respeitoso. „Sympathisch "  > inteligente. Small talk limitado.',
'[{"de":"Warum?","pt":"Por quê?","note":"busca entendimento"},{"de":"Wie geht es dir wirklich?","pt":"Como vai você de verdade?","note":"interesse genuíno"},{"de":"Das ist gut, aber...","pt":"Isso é bom, mas...","note":"feedback"}]'::jsonb,
'[]'::jsonb,
'[ 
"Comunicação & Estilo de Perguntas na Alemanha:",
"",
"• Perguntas diretas:",
"  Alemães apreciam clareza. \"Warum?\" não é rude, mas busca entendimento real.",
"",
"• \"Wie geht''s?\" não é só formal:",
"  Espera-se uma resposta breve e verdadeira, não apenas \"gut\".",
"",
"• Silêncio é aceitável:",
"  Pausas na conversa não são desconfortáveis; servem para reflexão.",
"",
"• Feedback construtivo:",
"  \"Das ist gut, aber...\" é comum. Críticas são vistas como ajuda, não ofensa.",
"",
"• Entrevistas formais:",
"  Em contextos profissionais, prepara-se com antecedência.",
"  Levar perguntas próprias (\"Haben Sie noch Fragen an mich?\") é bem-visto.",
"",
"INPUT: Próximo capítulo / Capítulo anterior"
]'::jsonb, 3, true),
-- ══════════════════════════════════════════════════
-- CAPÍTULO 19: Mein erstes Gespräch – Dialog im Alltag
-- ══════════════════════════════════════════════════
('a1-cap19','a1-l19-1','A1','Diálogo: Um dia em Berlim – Maria conhece pessoas','Dialog: Ein Tag in Berlin',
' DIÁLOGO COMPLETO EM ALEMÃO: 
Maria: Guten Tag! Entschuldigung, ist dieser Platz frei? 
Mann: Guten Tag! Ja, natürlich. Setzen Sie sich! 
Maria: Danke! Ich bin Maria. Ich bin neu in Berlin. 
Mann: Freut mich, Maria! Ich heiße Thomas. Woher kommst du? 
Maria: Ich komme aus São Paulo, Brasilien. Und du? 
Mann: Ich bin Berliner! Möchtest du einen Kaffee? 
Maria: Ja, gern! Danke! Sag mal, wo kann ich hier Geld abheben? 
Mann: Gleich um die Ecke gibt es eine Bank. Gehst du geradeaus, dann links. 
Maria: Perfekt! Und wo ist der nächste Supermarkt? 
Mann: Der ist neben der Bank. Sehr praktisch! 
Maria: Super! Kannst du mir noch etwas empfehlen? Was kann man in Berlin machen? 
Mann: Besuche das Brandenburger Tor, die Museumsinsel und den Tiergarten. 
Maria: Klingt toll! Hast du heute Abend Zeit? Vielleicht können wir zusammen essen gehen? 
Mann: Gerne! Kennst du schon ein Restaurant? 
Maria: Nein, noch nicht. Hast du einen Vorschlag? 
Mann: Ja! „Zur letzten Instanz " ist sehr traditionell. Oder wir gehen nach Kreuzberg – da gibt es viele internationale Restaurants. 
Maria: Kreuzberg klingt gut! Um wie viel Uhr treffen wir uns? 
Mann: Um 19 Uhr am U-Bahnhof Kottbusser Tor? 
Maria: Abgemacht! Ich freue mich schon! 
Mann: Ich auch! Bis heute Abend, Maria! 
Maria: Bis später, Thomas! Und danke für deine Hilfe! 
Mann: Gern geschehen! Tschüss!
TRADUÇÃO EM PORTUGUÊS: 
Maria: Bom dia! Com licença, este lugar está livre? 
Homem: Bom dia! Sim, claro. Sente-se! 
Maria: Obrigada! Eu sou Maria. Sou nova em Berlim. 
Homem: Prazer, Maria! Eu me chamo Thomas. De onde você é? 
Maria: Eu sou de São Paulo, Brasil. E você? 
Homem: Eu sou berlinense! Você gostaria de um café? 
Maria: Sim, com prazer! Obrigada! Diga-me, onde posso sacar dinheiro aqui? 
Homem: Logo na esquina há um banco. Vá em frente, depois à esquerda. 
Maria: Perfeito! E onde é o supermercado mais próximo? 
Homem: É ao lado do banco. Muito prático! 
Maria: Ótimo! Você pode me recomendar mais algo? O que se pode fazer em Berlim? 
Homem: Visite o Portão de Brandemburgo, a Ilha dos Museus e o Tiergarten. 
Maria: Parece ótimo! Você tem tempo hoje à noite? Talvez possamos jantar juntos? 
Homem: Com prazer! Você já conhece algum restaurante? 
Maria: Não, ainda não. Você tem uma sugestão? 
Homem: Sim! „Zur letzten Instanz " é muito tradicional. Ou vamos a Kreuzberg – lá há muitos restaurantes internacionais. 
Maria: Kreuzberg soa bem! A que horas nos encontramos? 
Homem: Às 19h na estação de metrô Kottbusser Tor? 
Maria: Combinado! Já estou ansiosa! 
Homem: Eu também! Até hoje à noite, Maria! 
Maria: Até mais tarde, Thomas! E obrigada pela sua ajuda! 
Homem: De nada! Tchau!',
'Estrutura de diálogo A1: saudação → apresentação → perguntas → pedidos → sugestões → combinações → despedida.',
'[{"de":"Entschuldigung, ist dieser Platz frei?","pt":"Com licença, este lugar está livre?","note":"iniciar"},{"de":"Wo kann ich hier Geld abheben?","pt":"Onde posso sacar dinheiro aqui?","note":"pedido"},{"de":"Geh geradeaus, dann links.","pt":"Vá em frente, depois à esquerda.","note":"direção"},{"de":"Um wie viel Uhr treffen wir uns?","pt":"A que horas nos encontramos?","note":"combinar"}]'::jsonb,
'[{"de":"das Gespräch","pt":"a conversa"},{"de":"der Alltag","pt":"o cotidiano"},{"de":"sich vorstellen","pt":"apresentar-se"},{"de":"kennenlernen","pt":"conhecer (alguém)"},{"de":"der Platz","pt":"o lugar/assento"},{"de":"frei","pt":"livre/disponível"},{"de":"sich setzen","pt":"sentar-se"},{"de":"neu","pt":"novo"},{"de":"um die Ecke","pt":"na esquina"},{"de":"Geld abheben","pt":"sacar dinheiro"},{"de":"der Automat","pt":"o caixa eletrônico"},{"de":"empfehlen","pt":"recomendar"},{"de":"der Vorschlag","pt":"a sugestão"},{"de":"traditionell","pt":"tradicional"},{"de":"international","pt":"internacional"},{"de":"der U-Bahnhof","pt":"a estação de metrô"},{"de":"treffen","pt":"encontrar"},{"de":"abmachen","pt":"combinar"},{"de":"sich freuen auf","pt":"estar ansioso por"},{"de":"die Hilfe","pt":"a ajuda"},{"de":"gern geschehen","pt":"de nada"},{"de":"gleich","pt":"logo/já"},{"de":"neben","pt":"ao lado de"},{"de":"geradeaus","pt":"em frente"},{"de":"dann","pt":"então/depois"},{"de":"vielleicht","pt":"talvez"},{"de":"schon","pt":"já"},{"de":"noch nicht","pt":"ainda não"},{"de":"zusammen","pt":"juntos"},{"de":"essen gehen","pt":"sair para comer"}]'::jsonb,
'[ "Etapas do diálogo: Saudação → Apresentação → Perguntas → Pedidos → Sugestões → Combinações → Despedida. ","Conectivos: und/aber/dann/vielleicht/weil. ","Frases úteis: Entschuldigung / Kannst du langsamer sprechen? / Verstehe. ","INPUT: Próximo capítulo / Capítulo anterior. " ]'::jsonb, 1, true),

('a1-cap19','a1-l19-2','A1','Estrutura de Diálogo e Conectivos Simples','Dialogstruktur  & Satzverbindung',
'Conectar frases simples com und/aber/dann. „weil " introduz razão (verbo no final). Frases úteis para manter a conversa.',
'und/aber = posição 0. weil = verbo no final. Frases: Entschuldigung / Verstehe / Interessant!',
'[{"de":"Ich bin müde, aber ich gehe noch aus.","pt":"Estou cansado, mas vou sair mesmo assim.","note":"aber"},{"de":"Ich lerne Deutsch, weil ich in Berlin wohne.","pt":"Aprendo alemão porque moro em Berlim.","note":"weil + verbo final"},{"de":"Geh geradeaus, dann siehst du die Bank.","pt":"Vá em frente, então verá o banco.","note":"dann"},{"de":"Vielleicht können wir essen gehen.","pt":"Talvez possamos sair para comer.","note":"vielleicht"}]'::jsonb,
'[]'::jsonb,
'[ "CONECTIVOS SIMPLES PARA FLUIDEZ: ","und (e): une ideias similares → Ich bin Maria und komme aus Brasilien. ","aber (mas): contrasta → Ich lerne Deutsch, aber es ist schwierig. ","dann (então/depois): sequência → Geh geradeaus, dann links. ","vielleicht (talvez): sugere → Vielleicht können wir essen gehen. ","weil (porque): razão → verbo vai para o FINAL! "," ","FRASES ÚTEIS PARA MANTER A CONVERSA: ","Não entendeu: Entschuldigung, kannst du das wiederholen? ","Pedir mais devagar: Kannst du bitte langsamer sprechen? ","Confirmar: Verstehe. / Ah, okay! ","Mostrar interesse: Interessant! / Das ist toll! ","Encerrar: Danke für das Gespräch! "," ","ORDEM DAS PALAVRAS EM FRASES COMPOSTAS: ","Com und/aber: Frase1 + und/aber + Frase2 (verbo mantém posição 2) ","Com weil: Principal + weil + sujeito + ... + verbo final ","Com dann: Imperativo + dann + próxima ação " ]'::jsonb, 2, true),

('a1-cap19','a1-l19-3','A1','Cultura: Primeiras Conversas  & Integração','Kultur: Erste Gespräche  & Integration',
'Começar com „Sie ". Pequenos gestos contam. Assuntos seguros: clima, viagens, comida. Despedidas claras.',
'„Sie " primeiro. Sorriso + Bitte/Danke. Evitar salário/política. „Bis morgen! "  > „Tschüss " vago.',
'[{"de":"Wir können uns duzen.","pt":"Podemos nos tratar por tu.","note":"oferecer du"},{"de":"Wie findest du Berlin?","pt":"O que você acha de Berlim?","note":"pergunta segura"},{"de":"Bis morgen!","pt":"Até amanhã!","note":"despedida clara"}]'::jsonb,
'[]'::jsonb,
'[ 
"Primeiras Conversas & Integração na Alemanha:",
"",
"• \"Du\" ou \"Sie\" na primeira conversa?",
"  Comece com \"Sie\" com desconhecidos. Se a pessoa oferecer",
"  \"Wir können uns duzen\", aceite com \"Gerne!\".",
"",
"• Pequenos gestos contam:",
"  Um sorriso, contato visual e \"Bitte/Danke\" abrem portas.",
"",
"• Assuntos seguros para começar:",
"  Clima, viagens, comida, hobbies. Evite salário, política",
"  ou religião no primeiro encontro.",
"",
"• Perguntar é sinal de interesse:",
"  \"Was machst du gern?\" ou \"Wie findest du Berlin?\"",
"  mostram curiosidade genuína.",
"",
"• Despedidas claras:",
"  Alemães preferem encerramentos definidos:",
"  \"Bis morgen!\" em vez de um \"Tschüss\" vago.",
"",
"INPUT: Próximo capítulo / Capítulo anterior"
]'::jsonb, 3, true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 20: A1 Abschluss – Wiederholung und Anwendung
-- ══════════════════════════════════════════════════
('a1-cap20','a1-l20-1','A1','Diálogo: Maria reflete sobre suas primeiras semanas','Dialog: Abschlussgespräch',
'Revisão integrada: apresentar-se, compras, restaurante, direções. Foco em comunicar, não perfeição.',
'Präsens + Akkusativ + Dativ(básico)  + Satzstellung. Erros são parte do aprendizado!',
'[{ "de": "Ich kann mich vorstellen.", "pt": "Consigo me apresentar.", "note": "reflexivo" },
{ "de": "Ich kann im Restaurant bestellen.", "pt": "Consigo pedir no restaurante.", "note": "modal + infinitivo" },
{ "de": "Übung macht den Meister.", "pt": "A prática leva à perfeição.", "note": "provérbio" },
{ "de": "Ich übe jeden Tag.", "pt": "Pratico todo dia.", "note": "rotina" }]'::jsonb,
'[{ "de": "die Wiederholung", "pt": "a revisão" },
{ "de": "die Anwendung", "pt": "a aplicação" },
{ "de": "das Ziel", "pt": "a meta/objetivo" },
{ "de": "der Fortschritt", "pt": "o progresso" },
{ "de": "üben", "pt": "praticar" },
{ "de": "schaffen", "pt": "conseguir/realizar" },
{ "de": "meist(ens)", "pt": "na maioria das vezes" },
{ "de": "schwierig", "pt": "difícil" },
{ "de": "einfach", "pt": "fácil" },
{ "de": "der Artikel", "pt": "o artigo (gramatical)" },
{ "de": "die Wortstellung", "pt": "a ordem das palavras" },
{ "de": "der Podcast", "pt": "o podcast" },
{ "de": "der Text", "pt": "o texto" },
{ "de": "der Dialog", "pt": "o diálogo" },
{ "de": "spielen (um Dialog)", "pt": "encenar (um diálogo)" },
{ "de": "der Kellner / die Kundin", "pt": "o garçom / a cliente" },
{ "de": "allein / alleine", "pt": "sozinho(a)" },
{ "de": "der Kollege / die Kollegin", "pt": "o colega / a colega" },
{ "de": "der Termin", "pt": "o compromisso" },
{ "de": "der Arzt / die Ärztin", "pt": "o médico / a médica" },
{ "de": "verstehen", "pt": "entender" },
{ "de": "sprechen", "pt": "falar" },
{ "de": "lesen", "pt": "ler" },
{ "de": "hören", "pt": "ouvir" },
{ "de": "schreiben", "pt": "escrever" },
{ "de": "wiederholen", "pt": "repetir/revisar" },
{ "de": "erklären", "pt": "explicar" },
{ "de": "fragen", "pt": "perguntar" },
{ "de": "antworten", "pt": "responder" }]'::jsonb,
'[ "4 Pilares do A1: Präsens | Akkusativ | Dativ(básico) | Satzstellung ",
 "Verbos essenciais: sein/haben/essen/sprechen – decorar conjugação ",
 "Comunicar  > perfeição. Erros são parte do aprendizado! ",
 "INPUT: Próximo: Prova Final / Capítulo anterior" ]'::jsonb,
1,true),

('a1-cap20','a1-l20-2','A1','Resumo Gramatical A1 – Regras Essenciais','Zusammenfassung A1 – Wichtigste Regeln',
'Revisão dos 4 pilares: Präsens, Akkusativ, Dativ(intro), Satzstellung. Estruturas comunicativas prontas.',
'Verbo na posição 2. Acusativo: só masc muda. Dativ: mit/zu/von. Foco em comunicar.',
'[{ "de": "Ich lerne, du lernst, er lernt...", "pt": "Conjugação regular: -e/-st/-t/-en/-t/-en", "note": "Präsens" },
{ "de": "Ich kaufe den Apfel.", "pt": "Compro a maçã (acusativo masc).", "note": "Akkusativ" },
{ "de": "Ich gehe mit dir zum Markt.", "pt": "Vou com você ao mercado (dativo).", "note": "Dativ" },
{ "de": "Ich gehe heute ins Kino.", "pt": "Vou ao cinema hoje (verbo em 2).", "note": "Satzstellung" }]'::jsonb,
'[]'::jsonb,
'[ "OS 4 PILARES GRAMATICAIS DO A1:",
"1. PRÄSENS:",
"   Verbos regulares: -e, -st, -t, -en, -t, -en",
"   Ex: ich lerne, du lernst, er lernt, wir lernen...",
"",
"2. AKKUSATIV:",
"   Só masculino muda: der → den | ein → einen",
"   Ex: Ich kaufe den Apfel / einen Apfel.",
"",
"3. DATIV (introdução):",
"   mit/zu/von + dativo; pronomes: mir/dir/ihm...",
"   Ex: Ich helfe dir. / Ich gehe zum Markt.",
"",
"4. SATZSTELLUNG:",
"   Verbo conjugado SEMPRE na posição 2 (afirmativa)",
"   Ex: Ich gehe heute ins Kino.",
"",
"ESTRUTURAS COMUNICATIVAS PRONTAS:",
"Apresentar-se: Ich heiße... / Ich bin... Jahre alt.",
"Pedir: Ich hätte gern... / Könnten Sie bitte...?",
"Perguntar: Wo ist...? / Wie viel kostet...?",
"Expressar gosto: Ich mag... / ... gefällt mir.",
"Marcar encontro: Treffen wir uns um... Uhr am...?",
"Despedir-se: Danke! / Bis morgen! / Auf Wiedersehen!" ]'::jsonb,
2,true),

('a1-cap20','a1-l20-3','A1','Cultura: Celebrando Conquistas & Próximos Passos','Kultur: Erfolge feiern & Nächste Schritte',
'Zertifikat A1 valida seu nível. Com A1 você já consegue: apresentar-se, compras básicas, pedir informações. Erros são bem-vindos!',
'Goethe/telc A1 para vistos. Autonomia progressiva. Próximos passos: Perfekt, conversas mais longas.',
'[{ "de": "Goethe-Zertifikat A1", "pt": "certificado oficial A1", "note": "validação" },
{ "de": "Übung macht den Meister.", "pt": "A prática leva à perfeição.", "note": "motivação" },
{ "de": "Mein Deutsch ist noch nicht perfeito.", "pt": "Meu alemão ainda não é perfeito.", "note": "humildade" }]'::jsonb,
'[]'::jsonb,
'[ "Celebrando Conquistas & Próximos Passos:",
" ",
"• Zertifikat A1:",
"  Exames como Goethe-Zertifikat A1 ou telc Deutsch A1 ",
"  validam seu nível para vistos, cursos e empregos. ",
" ",
"• Autonomia progressiva:",
"  Com A1, você já consegue: apresentar-se, fazer compras básicas, ",
"  pedir informações, entender avisos simples. ",
" ",
"• Erros são bem-vindos:",
"  Alemães apreciam o esforço. Um „Entschuldigung, mein Deutsch ist noch nicht perfeito\" gera paciência e apoio.",
" ",
"• Próximos passos (A2):",
"  Expanda vocabulário, pratique narrar o passado (Perfekt) ",
"  e ganhe confiança em conversas mais longas. ",
" ",
"• Comunidade de aprendizado:",
"  Junte-se a „Tandem-Partnerships\", grupos de conversa ou apps ",
"  como HelloTalk para praticar além da sala. ",
" ",
"INPUT: Próximo: Módulo de Prova Final / Capítulo anterior" ]'::jsonb,
3,true)

ON CONFLICT (slug) DO UPDATE SET
module_slug = EXCLUDED.module_slug, level = EXCLUDED.level,
title_pt = EXCLUDED.title_pt, title_de = EXCLUDED.title_de,
summary_pt = EXCLUDED.summary_pt, quick_rule_pt = EXCLUDED.quick_rule_pt,
examples = EXCLUDED.examples, key_phrases = EXCLUDED.key_phrases,
mini_notes = EXCLUDED.mini_notes, sort_order = EXCLUDED.sort_order,
active = true, updated_at = now();

-- ══════════════════════════════════════════════════
-- ══════════════════════════════════════════════════
-- FIX: Criação das Lições da Prova Final (A1)
-- Execute ANTES do INSERT em study_exercises
-- ══════════════════════════════════════════════════
INSERT INTO study_lessons (module_slug, slug, level, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, sort_order, active)
VALUES
('a1-exam', 'a1-exam-l1-horen', 'A1', 'Prova A1: Hören', 'A1 Prüfung: Hören', 'Teste de compreensão auditiva.', 'Ouça e selecione a opção correta.', '[]'::jsonb, '[]'::jsonb, '[]'::jsonb, 1, true),
('a1-exam', 'a1-exam-l2-lesen', 'A1', 'Prova A1: Lesen', 'A1 Prüfung: Lesen', 'Teste de compreensão de leitura.', 'Leia e selecione a opção correta.', '[]'::jsonb, '[]'::jsonb, '[]'::jsonb, 2, true),
('a1-exam', 'a1-exam-l3-schreiben', 'A1', 'Prova A1: Schreiben', 'A1 Prüfung: Schreiben', 'Teste de produção escrita.', 'Complete as frases.', '[]'::jsonb, '[]'::jsonb, '[]'::jsonb, 3, true),
('a1-exam', 'a1-exam-l4-sprechen', 'A1', 'Prova A1: Sprechen', 'A1 Prüfung: Sprechen', 'Teste de produção oral.', 'Traduza as frases.', '[]'::jsonb, '[]'::jsonb, '[]'::jsonb, 4, true),
('a1-exam', 'a1-exam-l5-grammatik', 'A1', 'Prova A1: Grammatik', 'A1 Prüfung: Grammatik', 'Teste de gramática.', 'Escolha a opção correta.', '[]'::jsonb, '[]'::jsonb, '[]'::jsonb, 5, true)
ON CONFLICT (slug) DO UPDATE SET
module_slug = EXCLUDED.module_slug, level = EXCLUDED.level,
title_pt = EXCLUDED.title_pt, title_de = EXCLUDED.title_de,
summary_pt = EXCLUDED.summary_pt, quick_rule_pt = EXCLUDED.quick_rule_pt,
examples = EXCLUDED.examples, key_phrases = EXCLUDED.key_phrases,
mini_notes = EXCLUDED.mini_notes, sort_order = EXCLUDED.sort_order,
active = true, updated_at = now();
-- ══════════════════════════════════════════════════
INSERT INTO study_exercises
(lesson_slug, slug, module_slug, level, exercise_type, prompt_pt, prompt_de, options, answer, explanation_pt, xp_reward, sort_order, active)
VALUES

-- ══════════════════════════════════════════════════
-- CAPÍTULO 1
-- ══════════════════════════════════════════════════
('a1-l1-1','a1-ex001','a1-cap1','A1','choose_option','Qual cumprimento é FORMAL?',null,'["Hallo!","Guten Tag!","Tschüss!","Moin Moin!"]'::jsonb,'Guten Tag!','Guten Tag = formal para qualquer hora com desconhecidos.',10,1,true),
('a1-l1-1','a1-ex002','a1-cap1','A1','choose_option','Você está encerrando uma reunião formal. O que diz?',null,'["Tschüss!","Bis bald!","Auf Wiedersehen!","Moin!"]'::jsonb,'Auf Wiedersehen!','Auf Wiedersehen = formal. Tschüss/Bis bald = informal.',10,2,true),
('a1-l1-1','a1-ex003','a1-cap1','A1','fill_blank','Complete: ___ Morgen! (formal, manhã)',null,'[]'::jsonb,'Guten','Guten Morgen = bom dia (formal).',10,3,true),
('a1-l1-2','a1-ex004','a1-cap1','A1','translate_to_de','Traduza: Meu nome é Tom. Sou do Brasil.',null,'[]'::jsonb,'Ich heiße Tom. Ich komme aus Brasilien.','Ich heiße = meu nome é. Ich komme aus = sou de.',10,1,true),
('a1-l1-2','a1-ex005','a1-cap1','A1','choose_option','Como se diz "Prazer também!" em alemão?',null,'["Freut mich!","Freut mich auch!","Das freut mich nicht."]'::jsonb,'Freut mich auch!','Freut mich = prazer! Freut mich auch = prazer também!',10,2,true),
('a1-l1-2','a1-ex006','a1-cap1','A1','fill_blank','Eu falo um pouco de alemão: Ich spreche ___ ___ Deutsch.',null,'[]'::jsonb,'ein bisschen','ein bisschen = um pouco.',10,3,true),
('a1-l1-3','a1-ex007','a1-cap1','A1','choose_option','Conjugue sein: Wir ___',null,'["bin","bist","sind","seid"]'::jsonb,'sind','wir sind = nós somos/estamos.',10,1,true),
('a1-l1-3','a1-ex008','a1-cap1','A1','fill_blank','Conjugue haben: du ___ (você tem)',null,'[]'::jsonb,'hast','haben: ich habe, du hast, er hat. du é irregular!',10,2,true),
('a1-l1-3','a1-ex009','a1-cap1','A1','choose_option',
'Qual frase está correta?', null, '["Ich bin eine Müde.","Ich bin müde.","Ich habe müde."]'::jsonb, 'Ich bin müde.', 'sein para estados: Ich bin müde = estou cansado.', 10,3,true),
('a1-l1-1','a1-ex010','a1-cap1','A1','translate_to_de','Traduza: Você fala alemão?',null,'[]'::jsonb,'Sprichst du Deutsch?','sprechen = falar. Du sprichst = você fala.',12,4,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 2
-- ═════════════════════════════════════════════════
('a1-l2-1','a1-ex011','a1-cap2','A1','choose_option','Como se diz "os pais" em alemão?',null,'["die Elter","die Eltern","das Eltern"]'::jsonb,'die Eltern','Eltern = sempre plural. Não existe Elter.',10,1,true),
('a1-l2-1','a1-ex012','a1-cap2','A1','fill_blank','___ Mutter wohnt in Deutschland. (minha mãe)',null,'[]'::jsonb,'Meine','Mutter é die (feminino): possessivo meine.',10,2,true),
('a1-l2-1','a1-ex013','a1-cap2','A1','choose_option',
'Como expressar idade em alemão?',null,'["Ich habe 23 Jahre.","Ich bin 23 Jahre alt.","Ich habe 23 Jahre alt."]'::jsonb,'Ich bin 23 Jahre alt.',
'Alemão usa sein (não haben) para idade.',10,3,true),
('a1-l2-2','a1-ex014','a1-cap2','A1','choose_option','Wie schreibt man „15" auf Deutsch?',null,'["fünfzehn","fünfzig","fünfundzehn","zehnfünf"]'::jsonb,'fünfzehn','15 = fünfzehn. fünfzig = 50.',12,1,true),
('a1-l2-2','a1-ex015','a1-cap2','A1','fill_blank','Escreva por extenso: 23 = drei___zwanzig',null,'[]'::jsonb,'dreiund','Regra invertida: unidade + und + dezena.',10,2,true),
('a1-l2-2','a1-ex016','a1-cap2','A1','choose_option','30 em alemão é...',null,'["dreizig","dreißig","dreizeg"]'::jsonb,'dreißig','dreißig com ß. Não dreisig!',10,3,true),
('a1-l2-1','a1-ex017','a1-cap2','A1','translate_to_de','Traduza: Meu pai se chama João e ele tem 45 anos.',null,'[]'::jsonb,'Mein Vater heißt João und er ist 45 Jahre alt.','heißen + sein para idade.',12,4,true),
('a1-l2-2','a1-ex018','a1-cap2','A1','fill_blank','___ (Wie viele) Personen sind in ___ (dein) Familie?',null,'[]'::jsonb,'Wie viele / deiner','Plural interrogativo + possessivo dativo.',10,5,true),
('a1-l2-1','a1-ex019','a1-cap2','A1','choose_option','Qual é o plural de „der Bruder"?',null,'["die Bruders","die Brüder","die Bruder","die Brüders"]'::jsonb,'die Brüder','Umlaut + er no plural.',10,6,true),
('a1-l2-2','a1-ex020','a1-cap2','A1','choose_option','„Dein" é usado com:',null,'["ich","du","er","wir"]'::jsonb,'du','dein = possessivo de du (você informal).',10,7,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 3
-- ══════════════════════════════════════════════════
('a1-l3-1','a1-ex021','a1-cap3','A1','choose_option','Como dizer "Gosto de ouvir música"?',null,'["Ich höre Musik gern.","Ich gern höre Musik.","Ich höre gern Musik."]'::jsonb,'Ich höre gern Musik.','gern vem após o verbo conjugado.',10,1,true),
('a1-l3-1','a1-ex022','a1-cap3','A1','fill_blank','___ ist meine Lieblingsfarbe. (azul)',null,'[]'::jsonb,'Blau','Blau = azul.',10,2,true),
('a1-l3-2','a1-ex023','a1-cap3','A1','choose_option','Qual frase com modal está CORRETA?',null,'["Ich kann sprechen Deutsch.","Ich kann Deutsch sprechen.","Ich Deutsch kann sprechen."]'::jsonb,'Ich kann Deutsch sprechen.','Modal na posição 2, infinitivo no FINAL.',12,1,true),
('a1-l3-2','a1-ex024','a1-cap3','A1','choose_option','Qual modal expressa "gostaria de" (educado)?',null,'["wollen","müssen","möchten"]'::jsonb,'möchten','möchten = gostaria. Mais educado que wollen.',10,2,true),
('a1-l3-2','a1-ex025','a1-cap3','A1','fill_blank','Ich ___ nach Deutschland fahren. (quero)',null,'[]'::jsonb,'will','wollen: ich will. Expressa desejo.',10,3,true),
('a1-l3-1','a1-ex026','a1-cap3','A1','translate_to_de','Traduza: Eu gosto de ouvir música clássica.',null,'[]'::jsonb,'Ich höre gern klassische Musik.','hören + gern + adj +名词.',10,4,true),
('a1-l3-1','a1-ex027','a1-cap3','A1','choose_option','Qual é a cor „grün" em português?',null,'["azul","verde","amarelo","vermelho"]'::jsonb,'verde','grün = verde.',10,5,true),
('a1-l3-1','a1-ex028','a1-cap3','A1','fill_blank','Was ___ (machen) du am Wochenende?',null,'[]'::jsonb,'machst','du machst (2ª pessoa singular).',10,6,true),
('a1-l3-1','a1-ex029','a1-cap3','A1','translate_to_de','Traduza: Ela toca piano muito bem.',null,'[]'::jsonb,'Sie spielt sehr gut Klavier.','spielen + instrumento.',10,7,true),
('a1-l3-1','a1-ex030','a1-cap3','A1','choose_option','Qual verbo muda a vogal no presente?',null,'["machen","spielen","lesen","hören"]'::jsonb,'lesen','lesen → du liest, er liest (e→i).',12,8,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 4
-- ══════════════════════════════════════════════════
('a1-l4-1','a1-ex031','a1-cap4','A1','choose_option','Complete: „Ich hätte gern ___ Apfel."',null,'["der","den","das","die"]'::jsonb,'einen','Masculino indefinido acusativo: ein → einen.',12,1,true),
('a1-l4-1','a1-ex032','a1-cap4','A1','fill_blank','Ich brauche ___ (eine) Banane und ___ (ein) Brot.',null,'[]'::jsonb,'eine / ein','Feminino e neutro não mudam no acusativo.',10,2,true),
('a1-l4-1','a1-ex033','a1-cap4','A1','translate_to_de','Traduza: Eu preciso de dois ovos e um quilo de tomates.',null,'[]'::jsonb,'Ich brauche zwei Eier und ein Kilo Tomaten.','brauchen + acusativo.',10,3,true),
('a1-l4-1','a1-ex034','a1-cap4','A1','choose_option','Qual artigo está correto? „Ich kaufe ___ Käse."',null,'["der","den","das","die"]'::jsonb,'den','Käse é masculino: der → den.',10,4,true),
('a1-l4-1','a1-ex035','a1-cap4','A1','fill_blank','Haben Sie ___ (die) Milch?',null,'[]'::jsonb,'die','Feminino definido não muda.',10,5,true),
('a1-l4-1','a1-ex036','a1-cap4','A1','translate_to_de','Traduza: A senhora gostaria de um iogurte?',null,'[]'::jsonb,'Möchten Sie einen Joghurt?','möchten + acusativo.',10,6,true),
('a1-l4-1','a1-ex037','a1-cap4','A1','choose_option','No acusativo, qual gênero muda o artigo definido?',null,'["feminino","neutro","masculino","plural"]'::jsonb,'masculino','Só masculino: der → den.',10,7,true),
('a1-l4-1','a1-ex038','a1-cap4','A1','fill_blank','Wie viel kostet ___ (das) Wasser?',null,'[]'::jsonb,'das','Neutro não muda.',10,8,true),
('a1-l4-1','a1-ex039','a1-cap4','A1','translate_to_de','Traduza: Eu compro o pão e a manteiga.',null,'[]'::jsonb,'Ich kaufe das Brot und die Butter.','das Brot (neutro), die Butter (fem).',10,9,true),
('a1-l4-1','a1-ex040','a1-cap4','A1','choose_option','„Einen" é usado com:',null,'["subst. feminino","subst. neutro","subst. masc. acusativo","plural"]'::jsonb,'subst. masc. acusativo','einen = artigo indefinido masculino no acusativo.',10,10,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 5
-- ══════════════════════════════════════════════════
('a1-l5-1','a1-ex041','a1-cap5','A1','choose_option','O que significa "halb neun"?',null,'["9:30","8:30","9:00"]'::jsonb,'8:30','halb neun = metade do caminho até as 9h = 8:30!',12,1,true),
('a1-l5-1','a1-ex042','a1-cap5','A1','choose_option','Qual frase com verbo separável está CORRETA?',null,'["Ich aufstehe um sieben.","Ich stehe um sieben auf.","Ich stehe auf um sieben."]'::jsonb,'Ich stehe um sieben auf.','Prefixo separável vai ao FINAL da frase.',12,2,true),
('a1-l5-1','a1-ex043','a1-cap5','A1','fill_blank','Ich fange um 9 Uhr ___ (anfangen).',null,'[]'::jsonb,'an','anfangen separável: fange...an.',10,3,true),
('a1-l5-1','a1-ex044','a1-cap5','A1','translate_to_de','Traduza: Que horas são? São 6:15.',null,'[]'::jsonb,'Wie spät ist es? Es ist Viertel nach sechs.','Viertel nach = 15 min depois.',10,4,true),
('a1-l5-1','a1-ex045','a1-cap5','A1','choose_option','Qual está correto?',null,'["Ich kaufe ein im Markt.","Ich einkaufe im Markt.","Im Markt kaufe ich ein.","Ein kaufe ich im Markt."]'::jsonb,'Im Markt kaufe ich ein.','Verbo na posição 2, prefixo no final.',10,5,true),
('a1-l5-1','a1-ex046','a1-cap5','A1','fill_blank','Der Unterricht ___ (anfangen) um 9 Uhr.',null,'[]'::jsonb,'fängt an','3ª pessoa singular: fängt...an.',10,6,true),
('a1-l5-1','a1-ex047','a1-cap5','A1','translate_to_de','Traduza: Eu me levanto cedo, mas vou dormir tarde.',null,'[]'::jsonb,'Ich stehe früh auf, aber ich gehe spät ins Bett.','aufstehen separável + aber.',10,7,true),
('a1-l5-1','a1-ex048','a1-cap5','A1','choose_option','„halb zehn" significa:',null,'["10:30","9:30","10:15","9:45"]'::jsonb,'9:30','halb + próxima hora.',10,8,true),
('a1-l5-1','a1-ex049','a1-cap5','A1','fill_blank','Um 12 Uhr ___ (essen) wir ___ (zu Mittag).',null,'[]'::jsonb,'essen / zu Mittag','zu Mittag essen = almoçar.',10,9,true),
('a1-l5-1','a1-ex050','a1-cap5','A1','choose_option','Em „Ich rufe dich an", o prefixo „an" está:',null,'["no início","no meio","no final","junto com rufe"]'::jsonb,'no final','Verbos separáveis: prefixo no final absoluto.',10,10,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 6
-- ══════════════════════════════════════════════════
('a1-l6-1','a1-ex051','a1-cap6','A1','choose_option','Complete: „Sie ___ als Ärztin."',null,'["arbeite","arbeitest","arbeitet","arbeiten"]'::jsonb,'arbeitet','3ª pessoa singular: arbeitet.',10,1,true),
('a1-l6-1','a1-ex052','a1-cap6','A1','fill_blank','Ich ___ (schreiben) viele E-Mails am Tag.',null,'[]'::jsonb,'schreibe','1ª pessoa singular: schreibe.',10,2,true),
('a1-l6-1','a1-ex053','a1-cap6','A1','translate_to_de','Traduza: Eu trabalho como engenheiro e ganho bem.',null,'[]'::jsonb,'Ich arbeite als Ingenieur und verdiene gut.','als + profissão (sem artigo).',10,3,true),
('a1-l6-1','a1-ex054','a1-cap6','A1','choose_option','Qual está correto?',null,'["Ich bin ein Lehrer.","Ich bin Lehrer.","Ich bin der Lehrer.","Ich bin einen Lehrer."]'::jsonb,'Ich bin Lehrer.','Sein + profissão = SEM artigo.',10,4,true),
('a1-l6-1','a1-ex055','a1-cap6','A1','fill_blank','Wir ___ (besprechen) das Meeting morgen.',null,'[]'::jsonb,'besprechen','besprechen = discutir.',10,5,true),
('a1-l6-1','a1-ex056','a1-cap6','A1','translate_to_de','Traduza: Ela corrige tarefas e ensina matemática.',null,'[]'::jsonb,'Sie korrigiert Hausaufgaben und unterrichtet Mathe.','korrigieren + unterrichten.',10,6,true),
('a1-l6-1','a1-ex057','a1-cap6','A1','choose_option','Verbos terminados em -t ganham -e- em:',null,'["apenas ich","du/er/ihr","apenas wir","todos"]'::jsonb,'du/er/ihr','du arbeitest, er arbeitet, ihr arbeitet.',12,7,true),
('a1-l6-1','a1-ex058','a1-cap6','A1','fill_blank','Er ___ (werden) nächstes Jahr Koch.',null,'[]'::jsonb,'wird','werden = vai ser/tornar-se.',10,8,true),
('a1-l6-1','a1-ex059','a1-cap6','A1','translate_to_de','Traduza: Quantos dias de férias você tem?',null,'[]'::jsonb,'Wie viele Urlaubstage hast du?','Urlaubstage = dias de férias.',10,9,true),
('a1-l6-1','a1-ex060','a1-cap6','A1','choose_option','„Feierabend" significa:',null,'["festa no escritório","fim do expediente","hora do almoço","reunião importante"]'::jsonb,'fim do expediente','Feierabend = fim do expediente.',10,10,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 7
-- ══════════════════════════════════════════════════
('a1-l7-1','a1-ex061','a1-cap7','A1','choose_option','Complete: „Die Apotheke ist ___ dem Rathaus."',null,'["neben","zwischen","gegenüber","in"]'::jsonb,'gegenüber','gegenüber = em frente a.',10,1,true),
('a1-l7-1','a1-ex062','a1-cap7','A1','fill_blank','Gehen Sie ___ (geradeaus) bis zur Ampel, dann ___ (links).',null,'[]'::jsonb,'geradeaus / links','geradeaus = em frente, links = à esquerda.',10,2,true),
('a1-l7-1','a1-ex063','a1-cap7','A1','translate_to_de','Traduza: Onde fica a estação de trem?',null,'[]'::jsonb,'Wo ist der Bahnhof?','wo = onde (posição fixa).',10,3,true),
('a1-l7-1','a1-ex064','a1-cap7','A1','choose_option','Qual preposição exige dativo?',null,'["für","durch","neben","ohne"]'::jsonb,'neben','neben, zwischen, gegenüber, bei, mit, zu, von → dativo.',10,4,true),
('a1-l7-1','a1-ex065','a1-cap7','A1','fill_blank','Das Café ist ___ (zwischen) der Bank ___ (und) der Buchhandlung.',null,'[]'::jsonb,'zwischen / und','zwischen...und = entre...e.',10,5,true),
('a1-l7-1','a1-ex066','a1-cap7','A1','translate_to_de','Traduza: Vire à direita na próxima esquina.',null,'[]'::jsonb,'Biegen Sie an der nächsten Ecke rechts ab.','abbiegen = virar.',10,6,true),
('a1-l7-1','a1-ex067','a1-cap7','A1','choose_option','„Woher kommst du?" pergunta sobre:',null,'["destino","origem","posição","direção"]'::jsonb,'origem','woher = de onde (origem).',10,7,true),
('a1-l7-1','a1-ex068','a1-cap7','A1','fill_blank','Der Supermarkt ist ___ (in der Nähe) ___ (von) hier.',null,'[]'::jsonb,'in der Nähe / von','in der Nähe von = perto de.',10,8,true),
('a1-l7-1','a1-ex069','a1-cap7','A1','translate_to_de','Traduza: A farmácia fica ao lado do banco.',null,'[]'::jsonb,'Die Apotheke ist neben der Bank.','neben + dativo.',10,9,true),
('a1-l7-1','a1-ex070','a1-cap7','A1','choose_option','No dativo, „der Bahnhof" vira:',null,'["der Bahnhof","den Bahnhof","dem Bahnhof","des Bahnhofs"]'::jsonb,'dem Bahnhof','der → dem (dativo masculino).',10,10,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 8
-- ══════════════════════════════════════════════════
('a1-l8-1','a1-ex071','a1-cap8','A1','choose_option','Complete: „___ ist sonnig heute."',null,'["Er","Sie","Es","Das"]'::jsonb,'Es','Verbos impessoais de clima usam Es.',10,1,true),
('a1-l8-1','a1-ex072','a1-cap8','A1','fill_blank','Im Winter ___ (es/schneien) oft.',null,'[]'::jsonb,'schneit es','schneien = nevar. 3ª pessoa: schneit.',10,2,true),
('a1-l8-1','a1-ex073','a1-cap8','A1','translate_to_de','Traduza: Está chovendo e frio.',null,'[]'::jsonb,'Es regnet und ist kalt.','regnen = chover.',10,3,true),
('a1-l8-1','a1-ex074','a1-cap8','A1','choose_option','Qual verbo descreve fenômeno natural?',null,'["machen","regnen","gehen","haben"]'::jsonb,'regnen','regnen = chover (impessoal).',10,4,true),
('a1-l8-1','a1-ex075','a1-cap8','A1','fill_blank','Ich ___ (nehmen) eine Decke ___ (mit).',null,'[]'::jsonb,'nehme / mit','mitnehmen = levar consigo.',10,5,true),
('a1-l8-1','a1-ex076','a1-cap8','A1','translate_to_de','Traduza: Eu gosto mais da primavera porque as flores desabrocham.',null,'[]'::jsonb,'Ich mag den Frühling am liebsten, weil die Blumen blühen.','am liebsten = preferência máxima.',10,6,true),
('a1-l8-1','a1-ex077','a1-cap8','A1','choose_option','„Es gibt Regen" significa:',null,'["Está chovendo","Há chuva","Vai chover","Choveu"]'::jsonb,'Há chuva','es gibt + acusativo = há/existe.',10,7,true),
('a1-l8-1','a1-ex078','a1-cap8','A1','fill_blank','___ (Welche) Jahreszeit magst du ___ (am liebsten)?',null,'[]'::jsonb,'Welche / am liebsten','Welche = qual (feminino).',10,8,true),
('a1-l8-1','a1-ex079','a1-cap8','A1','translate_to_de','Traduza: Não esqueça o protetor solar!',null,'[]'::jsonb,'Vergiss die Sonnencreme nicht!','vergessen + acusativo.',10,9,true),
('a1-l8-1','a1-ex080','a1-cap8','A1','choose_option','Em „Wir machen ein Picknick", „ein Picknick" está no:',null,'["nominativo","acusativo","dativo","genitivo"]'::jsonb,'acusativo','machen pede acusativo (objeto direto).',10,10,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 9
-- ══════════════════════════════════════════════════
('a1-l9-1','a1-ex081','a1-cap9','A1','choose_option','Complete: „Ich probiere ___ Hose an."',null,'["der","den","die","das"]'::jsonb,'die','Hose é feminino: die → die (acusativo).',10,1,true),
('a1-l9-1','a1-ex082','a1-cap9','A1','fill_blank','Er trägt ___ (ein) blaues Hemd und ___ (eine) schwarze Hose.',null,'[]'::jsonb,'ein / eine','Hemd (neutro) → ein. Hose (fem) → eine.',10,2,true),
('a1-l9-1','a1-ex083','a1-cap9','A1','translate_to_de','Traduza: Ela usa um vestido vermelho e sapatos pretos.',null,'[]'::jsonb,'Sie trägt ein rotes Kleid und schwarze Schuhe.','tragen + adj + subst.',10,3,true),
('a1-l9-1','a1-ex084','a1-cap9','A1','choose_option','Qual está correto? „Das ist ___ Jacke." (minha)',null,'["mein","meine","meinen","meines"]'::jsonb,'meine','Jacke é feminino: meine.',10,4,true),
('a1-l9-1','a1-ex085','a1-cap9','A1','fill_blank','Die Schuhe sind ___ (bequem), aber ___ (kaputt).',null,'[]'::jsonb,'bequem / kaputt','Adjetivos após sein não declinam.',10,5,true),
('a1-l9-1','a1-ex086','a1-cap9','A1','translate_to_de','Traduza: Você tem luvas para o inverno?',null,'[]'::jsonb,'Hast du Handschuhe für den Winter?','Handschuhe = luvas.',10,6,true),
('a1-l9-1','a1-ex087','a1-cap9','A1','choose_option','„anprobieren" significa:',null,'["comprar","experimentar","vestir","lavar"]'::jsonb,'experimentar','anprobieren = experimentar (roupa).',10,7,true),
('a1-l9-1','a1-ex088','a1-cap9','A1','fill_blank','Ich habe ___ (braun) Haare und ___ (blau) Augen.',null,'[]'::jsonb,'braune / blaue','Adjetivos antes de plural: -e.',10,8,true),
('a1-l9-1','a1-ex089','a1-cap9','A1','translate_to_de','Traduza: Esta calça serve perfeitamente!',null,'[]'::jsonb,'Diese Hose passt perfekt!','passen = servir/cair bem.',10,9,true),
('a1-l9-1','a1-ex090','a1-cap9','A1','choose_option','No acusativo, „der Mantel" vira:',null,'["der Mantel","den Mantel","dem Mantel","des Mantels"]'::jsonb,'den Mantel','der → den (acusativo masculino).',10,10,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 10
-- ══════════════════════════════════════════════════
('a1-l10-1','a1-ex091','a1-cap10','A1','choose_option','Complete: „Wir treffen uns ___ Montag."',null,'["im","um","am","in"]'::jsonb,'am','am + dia da semana.',10,1,true),
('a1-l10-1','a1-ex092','a1-cap10','A1','fill_blank','Der Termin ist ___ (um) 14:30 Uhr ___ (am) 16. Mai.',null,'[]'::jsonb,'um / am','um = hora, am = data.',10,2,true),
('a1-l10-1','a1-ex093','a1-cap10','A1','translate_to_de','Traduza: O compromisso é na quarta-feira, 10 de julho, às 9h.',null,'[]'::jsonb,'Der Termin ist am Mittwoch, dem 10. Juli, um 9 Uhr.','am + dia, um + hora.',10,3,true),
('a1-l10-1','a1-ex094','a1-cap10','A1','choose_option','Qual está correto? „___ Sommer fahre ich nach Berlin."',null,'["Am","Um","Im","In"]'::jsonb,'Im','im + estação/mês.',10,4,true),
('a1-l10-1','a1-ex095','a1-cap10','A1','fill_blank','Nächste ___ (Woche) habe ich keine ___ (Termine).',null,'[]'::jsonb,'Woche / Termine','nächste Woche = próxima semana.',10,5,true),
('a1-l10-1','a1-ex096','a1-cap10','A1','translate_to_de','Traduza: Você pode confirmar o encontro para amanhã?',null,'[]'::jsonb,'Kannst du das Treffen für morgen bestätigen?','bestätigen = confirmar.',10,6,true),
('a1-l10-1','a1-ex097','a1-cap10','A1','choose_option','„15.05.2024" lê-se:',null,'["der fünfzehn Mai","der fünfzehnte Mai","die fünfzehnte Mai","das fünfzehnte Mai"]'::jsonb,'der fünfzehnte Mai','Ordinais masculinos para datas.',12,7,true),
('a1-l10-1','a1-ex098','a1-cap10','A1','fill_blank','Ich muss den Termin ___ (verschieben), weil ich krank ___ (sein).',null,'[]'::jsonb,'verschieben / bin','verschieben = remarcar. weil + verbo no final.',10,8,true),
('a1-l10-1','a1-ex099','a1-cap10','A1','translate_to_de','Traduza: De segunda a sexta eu trabalho das 9h às 17h.',null,'[]'::jsonb,'Von Montag bis Freitag arbeite ich von 9 bis 17 Uhr.','von...bis = de...a.',10,9,true),
('a1-l10-1','a1-ex100','a1-cap10','A1','choose_option','„Gestern" significa:',null,'["hoje","amanhã","ontem","agora"]'::jsonb,'ontem','gestern = ontem.',10,10,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULOS 11-15 (Resumo compacto para manter limite)
-- ══════════════════════════════════════════════════
('a1-l11-1','a1-ex101','a1-cap11','A1','choose_option','Complete: „___ gibt es einen Kühlschrank."',null,'["Er","Sie","Es","Das"]'::jsonb,'Es','es gibt = há/existe.',10,1,true),
('a1-l11-1','a1-ex102','a1-cap11','A1','fill_blank','Im Wohnzimmer ___ (es/gibt) ein Sofa und zwei Stühle.',null,'[]'::jsonb,'gibt es','es gibt + acusativo.',10,2,true),
('a1-l11-1','a1-ex103','a1-cap11','A1','translate_to_de','Traduza: No quarto há uma cama grande e uma escrivaninha.',null,'[]'::jsonb,'Im Schlafzimmer gibt es ein großes Bett und einen Schreibtisch.','es gibt + adj + subst.',10,3,true),
('a1-l11-1','a1-ex104','a1-cap11','A1','choose_option','Qual preposição completa: „Das Bild hängt ___ der Wand."',null,'["im","auf","an","neben"]'::jsonb,'an','an der Wand = na parede.',10,4,true),
('a1-l11-1','a1-ex105','a1-cap11','A1','fill_blank','Der Tisch steht ___ (zwischen) dem Sofa ___ (und) dem Fenster.',null,'[]'::jsonb,'zwischen / und','zwischen...und = entre...e.',10,5,true),
('a1-l11-1','a1-ex106','a1-cap11','A1','translate_to_de','Traduza: Há uma varanda com vista para o parque.',null,'[]'::jsonb,'Es gibt einen Balkon mit Blick auf den Park.','Blick auf = vista para.',10,6,true),
('a1-l11-1','a1-ex107','a1-cap11','A1','choose_option','„Im Schlafzimmer" significa:',null,'["no banheiro","na cozinha","no quarto","na sala"]'::jsonb,'no quarto','Schlafzimmer = quarto de dormir.',10,7,true),
('a1-l11-1','a1-ex108','a1-cap11','A1','fill_blank','Die Lampe steht ___ (auf) ___ (dem) Tisch.',null,'[]'::jsonb,'auf / dem','auf + dativo = sobre.',10,8,true),
('a1-l11-1','a1-ex109','a1-cap11','A1','translate_to_de','Traduza: Minha cozinha é pequena, mas prática.',null,'[]'::jsonb,'Meine Küche ist klein, aber praktisch.','aber = mas.',10,9,true),
('a1-l11-1','a1-ex110','a1-cap11','A1','choose_option','Após „es gibt", o artigo masculino fica:',null,'["der","den","dem","des"]'::jsonb,'den','es gibt + acusativo.',10,10,true),

('a1-l12-1','a1-ex111','a1-cap12','A1','choose_option','Complete: „Ich fahre ___ Berlin."',null,'["in","nach","zu","an"]'::jsonb,'nach','nach + cidade/país sem artigo.',10,1,true),
('a1-l12-1','a1-ex112','a1-cap12','A1','fill_blank','Sie fliegt ___ (nach) Italien ___ (mit) dem Flugzeug.',null,'[]'::jsonb,'nach / mit','nach + país, mit + dativo.',10,2,true),
('a1-l12-1','a1-ex113','a1-cap12','A1','translate_to_de','Traduza: Como você vai para Hamburgo? Eu vou de trem.',null,'[]'::jsonb,'Wie fährst du nach Hamburg? Ich fahre mit dem Zug.','mit dem Zug = de trem.',10,3,true),
('a1-l12-1','a1-ex114','a1-cap12','A1','choose_option','Qual está correto? „Er fährt ___ Schweiz."',null,'["nach","in die","in der","zu der"]'::jsonb,'in die','países femininos: in + acusativo.',10,4,true),
('a1-l12-1','a1-ex115','a1-cap12','A1','fill_blank','Wie lange ___ (dauern) die Fahrt ___ (mit) dem Bus?',null,'[]'::jsonb,'dauert / mit','dauern = durar.',10,5,true),
('a1-l12-1','a1-ex116','a1-cap12','A1','translate_to_de','Traduza: Onde você embarca? Na estação central.',null,'[]'::jsonb,'Wo steigst du ein? Am Hauptbahnhof.','einsteigen + Hauptbahnhof.',10,6,true),
('a1-l12-1','a1-ex117','a1-cap12','A1','choose_option','„ICE" significa:',null,'["trem regional","trem de alta velocidade","ônibus expresso","avião doméstico"]'::jsonb,'trem de alta velocidade','Intercity-Express.',10,7,true),
('a1-l12-1','a1-ex118','a1-cap12','A1','fill_blank','Vom Flughafen ___ (zum) Hotel ___ (nehmen) ich die U-Bahn.',null,'[]'::jsonb,'zum / nehme','zum = zu dem.',10,8,true),
('a1-l12-1','a1-ex119','a1-cap12','A1','translate_to_de','Traduza: A viagem dura cerca de três horas.',null,'[]'::jsonb,'Die Fahrt dauert etwa drei Stunden.','etwa = cerca de.',10,9,true),
('a1-l12-1','a1-ex120','a1-cap12','A1','choose_option','Após „mit", o artigo masculino fica:',null,'["der","den","dem","des"]'::jsonb,'dem','mit + dativo: der → dem.',10,10,true),

('a1-l13-1','a1-ex121','a1-cap13','A1','choose_option','Complete: „Ich ___ gern einen Salat."',null,'["möchte","möchtest","möchten","möchtet"]'::jsonb,'möchte','ich möchte = eu gostaria.',10,1,true),
('a1-l13-1','a1-ex122','a1-cap13','A1','fill_blank','Wir ___ (möchten) die Rechnung, bitte.',null,'[]'::jsonb,'möchten','wir möchten = nós gostaríamos.',10,2,true),
('a1-l13-1','a1-ex123','a1-cap13','A1','translate_to_de','Traduza: Eu gostaria de uma sopa de tomate e uma água sem gás.',null,'[]'::jsonb,'Ich hätte gern eine Tomatensuppe und ein Wasser ohne Kohlensäure.','hätte gern + ohne.',10,3,true),
('a1-l13-1','a1-ex124','a1-cap13','A1','choose_option','Qual está correto? „Er nimmt ___ Schnitzel."',null,'["der","den","das","die"]'::jsonb,'das','Schnitzel é neutro: das.',10,4,true),
('a1-l13-1','a1-ex125','a1-cap13','A1','fill_blank','Möchtest du ___ (eine) Cola oder ___ (ein) Wasser?',null,'[]'::jsonb,'eine / ein','Cola (fem) → eine. Wasser (neut) → ein.',10,5,true),
('a1-l13-1','a1-ex126','a1-cap13','A1','translate_to_de','Traduza: A conta, por favor. Juntos ou separados?',null,'[]'::jsonb,'Die Rechnung, bitte. Zusammen oder getrennt?','getrennt = separados.',10,6,true),
('a1-l13-1','a1-ex127','a1-cap13','A1','choose_option','„Hat es Ihnen geschmeckt?" significa:',null,'["Você pagou?","Estava bom para o senhor?","Quer sobremesa?","Pode repetir?"]'::jsonb,'Estava bom para o senhor?','schmecken = ter gosto.',10,7,true),
('a1-l13-1','a1-ex128','a1-cap13','A1','fill_blank','Ich hätte gern ___ (der) große Salat mit ___ (das) Hähnchen.',null,'[]'::jsonb,'den / dem','Salat (masc) → den. Hähnchen (neut) → dem.',10,8,true),
('a1-l13-1','a1-ex129','a1-cap13','A1','translate_to_de','Traduza: Para mim, um café com leite, por favor.',null,'[]'::jsonb,'Für mich einen Kaffee mit Milch, bitte.','mit Milch = com leite.',10,9,true),
('a1-l13-1','a1-ex130','a1-cap13','A1','choose_option','Após „möchte", o verbo infinitivo fica:',null,'["no início","na posição 2","no meio","no final"]'::jsonb,'no final','möchte + infinitivo no final.',10,10,true),

('a1-l14-1','a1-ex131','a1-cap14','A1','choose_option','Complete: „Ich ___ heute sehr müde."',null,'["bin","bist","ist","sind"]'::jsonb,'bin','ich bin = eu estou.',10,1,true),
('a1-l14-1','a1-ex132','a1-cap14','A1','fill_blank','Mein Bauch ___ (tun) ___.',null,'[]'::jsonb,'tut / weh','tut weh = dói.',10,2,true),
('a1-l14-1','a1-ex133','a1-cap14','A1','translate_to_de','Traduza: Eu me sinto feliz e saudável.',null,'[]'::jsonb,'Ich fühle mich glücklich und gesund.','sich fühlen + adj.',10,3,true),
('a1-l14-1','a1-ex134','a1-cap14','A1','choose_option','Qual está correto? „Sie ist ___." (doente)',null,'["kranken","krank","krankes","kranke"]'::jsonb,'krank','Adj após sein não declina.',10,4,true),
('a1-l14-1','a1-ex135','a1-cap14','A1','fill_blank','Wir ___ (sich fühlen) uns heute gut.',null,'[]'::jsonb,'fühlen','wir fühlen uns.',10,5,true),
('a1-l14-1','a1-ex136','a1-cap14','A1','translate_to_de','Traduza: Minha cabeça dói e estou estressado.',null,'[]'::jsonb,'Mein Kopf tut weh und ich bin gestresst.','tut weh + sein + adj.',10,6,true),
('a1-l14-1','a1-ex137','a1-cap14','A1','choose_option','„Das tut mir leid" expressa:',null,'["alegria","pena/tristeza","raiva","surpresa"]'::jsonb,'pena/tristeza','tut mir leid = sinto muito.',10,7,true),
('a1-l14-1','a1-ex138','a1-cap14','A1','fill_blank','___ (Was) tut ___ (du) weh?',null,'[]'::jsonb,'Was / dir','Was tut dir weh? = O que te dói?',10,8,true),
('a1-l14-1','a1-ex139','a1-cap14','A1','translate_to_de','Traduza: Parabéns! Eu estou feliz por você.',null,'[]'::jsonb,'Herzlichen Glückwunsch! Ich freue mich für dich.','Glückwunsch + sich freuen.',10,9,true),
('a1-l14-1','a1-ex140','a1-cap14','A1','choose_option','Após „sein", o adjetivo:',null,'["declina","fica invariável","vai para o final","usa artigo"]'::jsonb,'fica invariável','sein + adj = invariável.',10,10,true),

('a1-l15-1','a1-ex141','a1-cap15','A1','choose_option','Complete: „Sie ___ sehr freundlich."',null,'["bin","bist","ist","sind"]'::jsonb,'ist','sie ist = ela é.',10,1,true),
('a1-l15-1','a1-ex142','a1-cap15','A1','fill_blank','Er sieht ___ (aus) wie sein Bruder.',null,'[]'::jsonb,'aus','aussehen = parecer.',10,2,true),
('a1-l15-1','a1-ex143','a1-cap15','A1','translate_to_de','Traduza: Meu quarto é pequeno, mas claro e aconchegante.',null,'[]'::jsonb,'Mein Zimmer ist klein, aber hell und gemütlich.','adj + aber + adj.',10,3,true),
('a1-l15-1','a1-ex144','a1-cap15','A1','choose_option','Qual está correto? „Das Buch ist ___." (interessante)',null,'["interessanten","interessante","interessantes","interessanter"]'::jsonb,'interessante','Adj após sein = forma básica.',10,4,true),
('a1-l15-1','a1-ex145','a1-cap15','A1','fill_blank','Lena ist genauso nett ___ (wie) Anna.',null,'[]'::jsonb,'wie','so/genauso...wie = comparação.',10,5,true),
('a1-l15-1','a1-ex146','a1-cap15','A1','translate_to_de','Traduza: Você parece cansado hoje.',null,'[]'::jsonb,'Du siehst heute müde aus.','aussehen + adj + adv.',10,6,true),
('a1-l15-1','a1-ex147','a1-cap15','A1','choose_option','„aussehen" é usado para:',null,'["personalidade","aparência física","profissão","nacionalidade"]'::jsonb,'aparência física','aussehen = aparência.',10,7,true),
('a1-l15-1','a1-ex148','a1-cap15','A1','fill_blank','Mein Freund ist sehr ___ (zuverlässig) und ___ (hilfsbereit).',null,'[]'::jsonb,'zuverlässig / hilfsbereit','Adj + und + adj.',10,8,true),
('a1-l15-1','a1-ex149','a1-cap15','A1','translate_to_de','Traduza: Ela é tão criativa quanto sua irmã.',null,'[]'::jsonb,'Sie ist genauso kreativ wie ihre Schwester.','genauso...wie.',10,9,true),
('a1-l15-1','a1-ex150','a1-cap15','A1','choose_option','Após „sein", o adjetivo:',null,'["concorda com o sujeito","fica invariável","vai para o final","usa artigo"]'::jsonb,'fica invariável','Regra de ouro A1.',10,10,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULOS 16-20
-- ══════════════════════════════════════════════════
('a1-l16-1','a1-ex151','a1-cap16','A1','choose_option','Complete: „Er ___ sehr gut Deutsch." (sprechen)',null,'["spreche","sprichst","spricht","sprechen"]'::jsonb,'spricht','er spricht (e→i).',10,1,true),
('a1-l16-1','a1-ex152','a1-cap16','A1','fill_blank','Ich ___ (haben) heute keine Zeit.',null,'[]'::jsonb,'habe','ich habe.',10,2,true),
('a1-l16-1','a1-ex153','a1-cap16','A1','translate_to_de','Traduza: Você sabe onde fica a estação?',null,'[]'::jsonb,'Weißt du, wo der Bahnhof ist?','wissen + dass/wo.',10,3,true),
('a1-l16-1','a1-ex154','a1-cap16','A1','choose_option','Qual está correto? „Wir ___ Pizza." (essen)',null,'["esse","esst","essen","isst"]'::jsonb,'essen','wir essen.',10,4,true),
('a1-l16-1','a1-ex155','a1-cap16','A1','fill_blank','___ (du) mich morgen ___ (anrufen)?',null,'[]'::jsonb,'Rufst / an','du rufst...an.',10,5,true),
('a1-l16-1','a1-ex156','a1-cap16','A1','translate_to_de','Traduza: Eu preciso estudar e você quer sair.',null,'[]'::jsonb,'Ich muss lernen und du willst ausgehen.','müssen + wollen.',10,6,true),
('a1-l16-1','a1-ex157','a1-cap16','A1','choose_option','„kennen" vs. „wissen": „___ du Berlin?"',null,'["Weißt","Kennst","Hast","Bist"]'::jsonb,'Kennst','kennen + lugar/pessoa.',10,7,true),
('a1-l16-1','a1-ex158','a1-cap16','A1','fill_blank','Sie ___ (essen) gern Schnitzel, aber sie ___ (trinken) kein Bier.',null,'[]'::jsonb,'isst / trinkt','3ª pessoa singular.',10,8,true),
('a1-l16-1','a1-ex159','a1-cap16','A1','translate_to_de','Traduza: Posso ajudar você?',null,'[]'::jsonb,'Kann ich dir helfen?','können + dativo.',10,9,true),
('a1-l16-1','a1-ex160','a1-cap16','A1','choose_option','Em „Er isst einen Apfel", „isst" é:',null,'["forma regular","irregular com mudança de vogal","verbo modal","separável"]'::jsonb,'irregular com mudança de vogal','essen → isst (e→i).',10,10,true),

('a1-l17-1','a1-ex161','a1-cap17','A1','choose_option','Complete: „Ich helfe ___." (você)',null,'["du","dich","dir","dein"]'::jsonb,'dir','helfen + dativo: dir.',10,1,true),
('a1-l17-1','a1-ex162','a1-cap17','A1','fill_blank','Das Buch gehört ___ (ich).',null,'[]'::jsonb,'mir','gehören + dativo: mir.',10,2,true),
('a1-l17-1','a1-ex163','a1-cap17','A1','translate_to_de','Traduza: Eu dou flores à minha mãe.',null,'[]'::jsonb,'Ich gebe meiner Mutter Blumen.','geben + dativo (pessoa) + acusativo (objeto).',10,3,true),
('a1-l17-1','a1-ex164','a1-cap17','A1','choose_option','Qual está correto? „Ich gehe ___ Markt."',null,'["zu dem","zum","zu den","a e b estão corretas"]'::jsonb,'a e b estão corretas','zu dem = zum.',10,4,true),
('a1-l17-1','a1-ex165','a1-cap17','A1','fill_blank','Ich schreibe ___ (mein) Freund eine E-Mail.',null,'[]'::jsonb,'meinem','schreiben + dativo: meinem.',10,5,true),
('a1-l17-1','a1-ex166','a1-cap17','A1','translate_to_de','Traduza: O presente é do meu irmão.',null,'[]'::jsonb,'Das Geschenk ist von meinem Bruder.','von + dativo.',10,6,true),
('a1-l17-1','a1-ex167','a1-cap17','A1','choose_option','„Das gefällt ___." (a mim)',null,'["ich","mich","mir","mein"]'::jsonb,'mir','gefallen + dativo.',10,7,true),
('a1-l17-1','a1-ex168','a1-cap17','A1','fill_blank','Wir danken ___ (die) Lehrerin.',null,'[]'::jsonb,'der','danken + dativo feminino: der.',10,8,true),
('a1-l17-1','a1-ex169','a1-cap17','A1','translate_to_de','Traduza: Você vem comigo ao cinema?',null,'[]'::jsonb,'Kommst du mit mir ins Kino?','mit + dativo.',10,9,true),
('a1-l17-1','a1-ex170','a1-cap17','A1','choose_option','Após „mit", o artigo feminino fica:',null,'["die","der","dem","den"]'::jsonb,'der','mit + dativo: die → der.',10,10,true),

('a1-l18-1','a1-ex171','a1-cap18','A1','choose_option','Complete: „___ wohnst du?"',null,'["Wer","Was","Wo","Wann"]'::jsonb,'Wo','wo = onde.',10,1,true),
('a1-l18-1','a1-ex172','a1-cap18','A1','fill_blank','___ (Wie viele) Geschwister hast du?',null,'[]'::jsonb,'Wie viele','wie viele = quantos.',10,2,true),
('a1-l18-1','a1-ex173','a1-cap18','A1','translate_to_de','Traduza: Por que você aprende alemão?',null,'[]'::jsonb,'Warum lernst du Deutsch?','warum = por quê.',10,3,true),
('a1-l18-1','a1-ex174','a1-cap18','A1','choose_option','Qual pergunta espera resposta de sim/não?',null,'["Woher kommst du?","Hast du Zeit?","Wie heißt du?","Was machst du?"]'::jsonb,'Hast du Zeit?','Verbo em 1º lugar = Ja/Nein-Frage.',10,4,true),
('a1-l18-1','a1-ex175','a1-cap18','A1','fill_blank','___ (Wann) fängt der Film ___ (an)?',null,'[]'::jsonb,'Wann / an','wann = quando.',10,5,true),
('a1-l18-1','a1-ex176','a1-cap18','A1','translate_to_de','Traduza: Quanto custa este livro?',null,'[]'::jsonb,'Wie viel kostet dieses Buch?','wie viel = quanto.',10,6,true),
('a1-l18-1','a1-ex177','a1-cap18','A1','choose_option','„Wohin gehst du?" pergunta sobre:',null,'["origem","destino","posição","tempo"]'::jsonb,'destino','wohin = para onde.',10,7,true),
('a1-l18-1','a1-ex178','a1-cap18','A1','fill_blank','___ (Welches) Buch liest du gerade?',null,'[]'::jsonb,'Welches','welches = qual (neutro).',10,8,true),
('a1-l18-1','a1-ex179','a1-cap18','A1','translate_to_de','Traduza: Você pode repetir, por favor?',null,'[]'::jsonb,'Können Sie das bitte wiederholen?','wiederholen = repetir.',10,9,true),
('a1-l18-1','a1-ex180','a1-cap18','A1','choose_option','Em W-Fragen, o verbo conjugado fica na posição:',null,'["1","2","3","final"]'::jsonb,'2','W-Frage(1) + Verbo(2) + Sujeito(3).',10,10,true),

('a1-l19-1','a1-ex181','a1-cap19','A1','choose_option','Complete: „Entschuldigung, ist dieser Platz ___?"',null,'["besetzt","frei","voll","teuer"]'::jsonb,'frei','frei = livre.',10,1,true),
('a1-l19-1','a1-ex182','a1-cap19','A1','fill_blank','Ich ___ (sich freuen) ___ (auf) das Treffen heute Abend.',null,'[]'::jsonb,'freue mich / auf','sich freuen auf.',10,2,true),
('a1-l19-1','a1-ex183','a1-cap19','A1','translate_to_de','Traduza: Onde posso sacar dinheiro aqui?',null,'[]'::jsonb,'Wo kann ich hier Geld abheben?','Geld abheben = sacar dinheiro.',10,3,true),
('a1-l19-1','a1-ex184','a1-cap19','A1','choose_option','Qual conectivo completa: „Ich lerne Deutsch, ___ es ist schwierig."',null,'["und","aber","dann","weil"]'::jsonb,'aber','aber = mas.',10,4,true),
('a1-l19-1','a1-ex185','a1-cap19','A1','fill_blank','Geh geradeaus, ___ (dann) siehst du ___ (der) Supermarkt.',null,'[]'::jsonb,'dann / den','dann = então. der → den (acusativo).',10,5,true),
('a1-l19-1','a1-ex186','a1-cap19','A1','translate_to_de','Traduza: Você tem uma sugestão de restaurante?',null,'[]'::jsonb,'Hast du einen Vorschlag für ein Restaurant?','Vorschlag = sugestão.',10,6,true),
('a1-l19-1','a1-ex187','a1-cap19','A1','choose_option','„Gern geschehen!" significa:',null,'["com prazer","de nada","até logo","boa sorte"]'::jsonb,'de nada','Gern geschehen = de nada.',10,7,true),
('a1-l19-1','a1-ex188','a1-cap19','A1','fill_blank','___ (Weil) ich neu in Berlin ___ (sein), brauche ich Hilfe.',null,'[]'::jsonb,'Weil / bin','weil + verbo no final.',10,8,true),
('a1-l19-1','a1-ex189','a1-cap19','A1','translate_to_de','Traduza: Podemos nos encontrar às 19h na estação de metrô?',null,'[]'::jsonb,'Können wir uns um 19 Uhr am U-Bahnhof treffen?','sich treffen + am.',10,9,true),
('a1-l19-1','a1-ex190','a1-cap19','A1','choose_option','Em frases com „weil", o verbo conjugado fica:',null,'["na posição 2","no início","no final","após o sujeito"]'::jsonb,'no final','weil + Nebensatz = verbo no final.',10,10,true),

('a1-l20-1','a1-ex191','a1-cap20','A1','choose_option','Complete: „Ich ___ aus Brasilien und ___ Deutsch."',null,'["bin/lernen","komme/lernen","komme/lerne","bin/lerne"]'::jsonb,'komme/lerne','kommen aus + lernen.',10,1,true),
('a1-l20-1','a1-ex192','a1-cap20','A1','fill_blank','Kannst du mir bitte ___ (der) Weg ___ (zu) Bahnhof erklären?',null,'[]'::jsonb,'den / zum','den Weg erklären. zu + dem = zum.',10,2,true),
('a1-l20-1','a1-ex193','a1-cap20','A1','translate_to_de','Traduza: Eu gostaria de uma água sem gás e a conta, por favor.',null,'[]'::jsonb,'Ich hätte gern ein Wasser ohne Kohlensäure und die Rechnung, bitte.','ohne Kohlensäure + Rechnung.',10,3,true),
('a1-l20-1','a1-ex194','a1-cap20','A1','choose_option','Qual frase está gramaticalmente correta?',null,'["Ich gehe mit dem Supermarkt.","Ich gehe zum Supermarkt.","Ich gehe nach dem Supermarkt.","Ich gehe bei Supermarkt."]'::jsonb,'Ich gehe zum Supermarkt.','zu + dem = zum (movimento para local).',10,4,true),
('a1-l20-1','a1-ex195','a1-cap20','A1','fill_blank','___ (Weil) ich müde ___ (sein), gehe ich früh ins Bett.',null,'[]'::jsonb,'Weil / bin','weil + bin (final).',10,5,true),
('a1-l20-1','a1-ex196','a1-cap20','A1','translate_to_de','Traduza: Onde você mora e o que você gosta de fazer?',null,'[]'::jsonb,'Wo wohnst du und was machst du gern?','wo wohnst du + was machst du gern.',10,6,true),
('a1-l20-1','a1-ex197','a1-cap20','A1','choose_option','„Das Buch gefällt ___." (a mim)',null,'["ich","mich","mir","mein"]'::jsonb,'mir','gefallen + dativo.',10,7,true),
('a1-l20-1','a1-ex198','a1-cap20','A1','fill_blank','Wir treffen uns ___ (am) Samstag ___ (um) 15 Uhr ___ (in) Café.',null,'[]'::jsonb,'am / um / im','am + dia, um + hora, im + local.',10,8,true),
('a1-l20-1','a1-ex199','a1-cap20','A1','translate_to_de','Traduza: Você pode falar mais devagar, por favor? Eu estou aprendendo alemão.',null,'[]'::jsonb,'Können Sie bitte langsamer sprechen? Ich lerne Deutsch.','langsamer sprechen + lernen.',10,9,true),
('a1-l20-1','a1-ex200','a1-cap20','A1','choose_option','Em „Ich kaufe einen Apfel", „einen Apfel" está no:',null,'["nominativo","acusativo","dativo","genitivo"]'::jsonb,'acusativo','kaufen + acusativo.',10,10,true),

-- ══════════════════════════════════════════════════
-- PROVA FINAL (a1-exam)
-- ══════════════════════════════════════════════════
('a1-exam-l1-horen','a1-ex-exam-001','a1-exam','A1','choose_option','Onde fica a farmácia?',null,'["neben dem Supermarkt","gegenüber der Bank","am Bahnhof"]'::jsonb,'neben dem Supermarkt','Hören: atenção a preposições de lugar.',10,1,true),
('a1-exam-l1-horen','a1-ex-exam-002','a1-exam','A1','choose_option','Qual horário foi mencionado no anúncio?',null,'["14 Uhr","15:30 Uhr","16 Uhr"]'::jsonb,'15:30 Uhr','Hören: números e horários.',10,2,true),
('a1-exam-l1-horen','a1-ex-exam-003','a1-exam','A1','choose_option','Qual o preço do ingresso?',null,'["12 Euro","15 Euro","18 Euro"]'::jsonb,'12 Euro','Hören: preços.',10,3,true),
('a1-exam-l1-horen','a1-ex-exam-004','a1-exam','A1','choose_option','O que a pessoa precisa comprar?',null,'["Milch und Brot","Äpfel und Wasser","Käse und Eier"]'::jsonb,'Milch und Brot','Hören: vocabulário de compras.',10,4,true),
('a1-exam-l1-horen','a1-ex-exam-005','a1-exam','A1','choose_option','Qual meio de transporte foi citado?',null,'["Bus","U-Bahn","Zug"]'::jsonb,'U-Bahn','Hören: transportes.',10,5,true),

('a1-exam-l2-lesen','a1-ex-exam-006','a1-exam','A1','choose_option','Quem escreveu o e-mail?',null,'["Thomas","Maria","Lena"]'::jsonb,'Maria','Lesen: identificar remetente.',10,1,true),
('a1-exam-l2-lesen','a1-ex-exam-007','a1-exam','A1','choose_option','Qual é o pedido principal?',null,'["Einen Termin machen","Eine Einladung zum Kaffee","Eine Frage stellen"]'::jsonb,'Eine Einladung zum Kaffee','Lesen: intenção do texto.',10,2,true),
('a1-exam-l2-lesen','a1-ex-exam-008','a1-exam','A1','choose_option','Quando é o encontro?',null,'["Montag 10 Uhr","Samstag 15 Uhr","Freitag 18 Uhr"]'::jsonb,'Samstag 15 Uhr','Lesen: datas e horas.',10,3,true),
('a1-exam-l2-lesen','a1-ex-exam-009','a1-exam','A1','choose_option','Qual prato principal custa 14 Euro?',null,'["Schnitzel","Fisch","Pasta"]'::jsonb,'Schnitzel','Lesen: cardápio/preços.',10,4,true),
('a1-exam-l2-lesen','a1-ex-exam-010','a1-exam','A1','choose_option','Qual bebida não contém álcool?',null,'["Bier","Wein","Apfelschorle"]'::jsonb,'Apfelschorle','Lesen: vocabulário bebidas.',10,5,true),

('a1-exam-l3-schreiben','a1-ex-exam-011','a1-exam','A1','fill_blank','Complete: Ich ___ (chamar-se) Anna und bin 25 Jahre alt.',null,'[]'::jsonb,'heiße','Schreiben: apresentação.',10,1,true),
('a1-exam-l3-schreiben','a1-ex-exam-012','a1-exam','A1','fill_blank','Complete: ___ (Convido) du auf einen Kaffee?',null,'[]'::jsonb,'Lade','Schreiben: convite (einladen).',10,2,true),
('a1-exam-l3-schreiben','a1-ex-exam-013','a1-exam','A1','fill_blank','Complete: Wir treffen uns ___ (na) Samstag ___ (às) 10 Uhr.',null,'[]'::jsonb,'am / um','Schreiben: preposições tempo.',10,3,true),
('a1-exam-l3-schreiben','a1-ex-exam-014','a1-exam','A1','fill_blank','Complete: Bitte ___ (responda) schnell!',null,'[]'::jsonb,'antworte','Schreiben: verbos imperativo.',10,4,true),
('a1-exam-l3-schreiben','a1-ex-exam-015','a1-exam','A1','fill_blank','Complete: Ich ___ (moro) in München.',null,'[]'::jsonb,'wohne','Schreiben: verbo wohnen.',10,5,true),

('a1-exam-l4-sprechen','a1-ex-exam-016','a1-exam','A1','translate_to_de','Traduza: Meu nome é Lucas e eu tenho 28 anos.',null,'[]'::jsonb,'Ich heiße Lucas und ich bin 28 Jahre alt.','Sprechen: apresentação.',10,1,true),
('a1-exam-l4-sprechen','a1-ex-exam-017','a1-exam','A1','translate_to_de','Traduza: Eu gosto de jogar futebol e ouvir música.',null,'[]'::jsonb,'Ich spiele gern Fußball und höre gern Musik.','Sprechen: hobbies.',10,2,true),
('a1-exam-l4-sprechen','a1-ex-exam-018','a1-exam','A1','translate_to_de','Traduza: Eu gostaria de uma salada e uma água, por favor.',null,'[]'::jsonb,'Ich hätte gern einen Salat und ein Wasser, bitte.','Sprechen: restaurante.',10,3,true),
('a1-exam-l4-sprechen','a1-ex-exam-019','a1-exam','A1','translate_to_de','Traduza: Quanto custa isso?',null,'[]'::jsonb,'Wie viel kostet das?','Sprechen: perguntas.',10,4,true),
('a1-exam-l4-sprechen','a1-ex-exam-020','a1-exam','A1','translate_to_de','Traduza: De onde você é?',null,'[]'::jsonb,'Woher kommst du?','Sprechen: origem.',10,5,true),

('a1-exam-l5-grammatik','a1-ex-exam-021','a1-exam','A1','choose_option','Complete: Ich ___ (sein) Student.',null,'["bin","bist","ist","sind"]'::jsonb,'bin','Grammatik: sein.',10,1,true),
('a1-exam-l5-grammatik','a1-ex-exam-022','a1-exam','A1','choose_option','Complete: Du ___ (haben) ein Auto.',null,'["habe","hast","hat","haben"]'::jsonb,'hast','Grammatik: haben.',10,2,true),
('a1-exam-l5-grammatik','a1-ex-exam-023','a1-exam','A1','choose_option','Complete: Er ___ (essen) Pizza.',null,'["esse","isst","essen","esst"]'::jsonb,'isst','Grammatik: essen (irregular).',10,3,true),
('a1-exam-l5-grammatik','a1-ex-exam-024','a1-exam','A1','choose_option','Complete: Sie ___ (sprechen) Deutsch.',null,'["spreche","sprichst","spricht","sprechen"]'::jsonb,'spricht','Grammatik: sprechen.',10,4,true),
('a1-exam-l5-grammatik','a1-ex-exam-025','a1-exam','A1','fill_blank','Transforme em pergunta: „Du wohnst in Berlin." → „___?"',null,'[]'::jsonb,'Wohnst du in Berlin?','Grammatik: Ja/Nein-Frage.',10,5,true)

ON CONFLICT (slug) DO UPDATE SET
lesson_slug = EXCLUDED.lesson_slug, module_slug = EXCLUDED.module_slug,
exercise_type = EXCLUDED.exercise_type, prompt_pt = EXCLUDED.prompt_pt,
prompt_de = EXCLUDED.prompt_de, options = EXCLUDED.options,
answer = EXCLUDED.answer, explanation_pt = EXCLUDED.explanation_pt,
xp_reward = EXCLUDED.xp_reward, sort_order = EXCLUDED.sort_order,
active = true, updated_at = now();

INSERT INTO flashcards_v2
(slug, level, theme, card_type, front_de, back_pt, explanation_pt, grammar_note, example_de, example_pt, tags, curated, active)
VALUES

-- ══════════════════════════════════════════════════
-- CAPÍTULO 1: Saudações & Apresentação
-- ══════════════════════════════════════════════════
('fc-a1-c01-01','A1','cap1-basics','word','hallo','olá','Saudação informal padrão entre amigos ou conhecidos.','Usado em contextos casuais.','Hallo! Wie geht es dir?','Olá! Como vai você?','["saudação","informal"]',true,true),
('fc-a1-c01-02','A1','cap1-basics','word','guten Tag','bom dia / boa tarde','Saudação formal para qualquer hora do dia.','Sempre com "Guten" + período.','Guten Tag, Frau Weber!','Bom dia, senhora Weber!','["saudação","formal"]',true,true),
('fc-a1-c01-03','A1','cap1-basics','phrase','wie heißt du?','como você se chama?','Pergunta padrão para saber o nome de alguém (informal).','heißen = chamar-se. Du forma: heißt.','Wie heißt du? — Ich heiße Anna.','Como você se chama? — Eu me chamo Anna.','["apresentação","pergunta"]',true,true),
('fc-a1-c01-04','A1','cap1-basics','phrase','ich heiße... / ich bin...','eu me chamo... / eu sou...','Blocos essenciais para se apresentar.','Ich heiße = nome. Ich bin = identidade/estado.','Ich heiße Tom. Ich bin Student.','Meu nome é Tom. Eu sou estudante.','["apresentação","essencial"]',true,true),
('fc-a1-c01-05','A1','cap1-basics','phrase','freut mich! / freut mich auch!','prazer! / prazer também!','Resposta padrão ao conhecer alguém.','freuen = alegrar. Forma reflexiva curta.','Freut mich! — Freut mich auch!','Prazer! — Prazer também!','["social","cortesia"]',true,true),
('fc-a1-c01-06','A1','cap1-basics','phrase','woher kommst du?','de onde você é?','Pergunta sobre origem/nacionalidade.','woher = de onde. kommen aus = vir de.','Woher kommst du? — Ich komme aus Brasilien.','De onde você é? — Eu sou do Brasil.','["origem","pergunta"]',true,true),
('fc-a1-c01-07','A1','cap1-basics','phrase','wie geht es dir?','como vai você?','Pergunta padrão sobre bem-estar (informal).','Respostas comuns: gut, schlecht, so lala.','Wie geht es dir? — Danke, gut! Und dir?','Como vai você? — Bem, obrigado! E você?','["social","cortesia"]',true,true),
('fc-a1-c01-08','A1','cap1-basics','phrase','ein bisschen','um pouco','Expressão fixa muito usada para atenuar afirmações.','Invariável. Nunca muda.','Ich spreche ein bisschen Deutsch.','Eu falo um pouco de alemão.','["quantidade","essencial"]',true,true),
('fc-a1-c01-09','A1','cap1-grammar','phrase','sein: bin / bist / ist / sind','ser/estar: sou / és / é / somos','Verbo mais importante do alemão. Totalmente irregular.','Cobrir SER e ESTAR. Decorar tabela.','Ich bin müde. Du bist nett. Er ist hier.','Eu estou cansado. Você é legal. Ele está aqui.','["gramática","verbo"]',true,true),
('fc-a1-c01-10','A1','cap1-grammar','phrase','heißen: heiße / heißt / heißen','chamar-se: chamo / chamas / chamam','Verbo regular com ß na 1ª pessoa. Muito usado.','Du/Ele: heißt. Nós/Eles: heißen.','Wie heißen Sie? — Ich heiße Müller.','Como o senhor se chama? — Eu me chamo Müller.','["gramática","verbo"]',true,true),
('fc-a1-c01-11','A1','cap1-basics','word','auf Wiedersehen','até logo / adeus','Despedida formal padrão.','Usado em lojas, trabalho, desconhecidos.','Auf Wiedersehen! Schönen Tag noch!','Até logo! Tenha um bom dia!','["despedida","formal"]',true,true),
('fc-a1-c01-12','A1','cap1-basics','word','tschüss','tchau','Despedida informal, rápida e carinhosa.','Equivalente a "bye".','Tschüss! Bis später!','Tchau! Até mais!','["despedida","informal"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 2: Família & Números
-- ══════════════════════════════════════════════════
('fc-a1-c02-01','A1','cap2-family','word','die Familie / die Eltern','a família / os pais','Eltern é SEMPRE plural. Não existe "Elter".','Plural fixo. Artigo: die.','Meine Eltern wohnen in Köln.','Meus pais moram em Colônia.','["família","plural"]',true,true),
('fc-a1-c02-02','A1','cap2-family','word','der Bruder / die Schwester','o irmão / a irmã','Termos básicos para irmãos. Plural: Brüder/Schwestern.','Umlaut no plural de Bruder.','Ich habe einen Bruder und zwei Schwestern.','Tenho um irmão e duas irmãs.','["família","parentesco"]',true,true),
('fc-a1-c02-03','A1','cap2-family','phrase','ich habe','eu tenho','Verbo haben para posse e relações familiares.','Conjugação irregular na 2ª/3ª pess.: hast/hat.','Ich habe eine große Familie.','Eu tenho uma família grande.','["posse","verbo"]',true,true),
('fc-a1-c02-04','A1','cap2-family','word','mein / meine','meu / minha','Possessivo básico. Muda conforme gênero do substantivo.','masc/neut: mein. fem/pl: meine.','mein Vater, meine Mutter, mein Kind','meu pai, minha mãe, meu filho','["possessivo","gramática"]',true,true),
('fc-a1-c02-05','A1','cap2-numbers','word','eins bis zehn','um a dez','Base numérica. 1-12 são irregulares e precisam de memorização.','Pronúncia: ains, tsvai, drai, fi:r, fünf...','Zwei plus drei ist fünf.','Dois mais três é cinco.','["números","base"]',true,true),
('fc-a1-c02-06','A1','cap2-numbers','word','elf / zwölf','onze / doze','Exceções à regra do "zehn". Decorar!','Não são "einzehn" ou "zweizehn".','Ich bin zwölf Jahre alt.','Eu tenho doze anos.','["números","exceção"]',true,true),
('fc-a1-c02-07','A1','cap2-numbers','word','sechzehn / siebzehn','dezesseis / dezessete','Atenção: perdem sílaba para fluidez.','sechs → sech, sieben → sieb.','Er ist siebzehn Jahre alt.','Ele tem dezessete anos.','["números","pronúncia"]',true,true),
('fc-a1-c02-08','A1','cap2-numbers','word','einundzwanzig / dreißig','vinte e um / trinta','Regra invertida: unidade + und + dezena. ß em dreißig.','21 = ein-und-zwanzig. 30 = dreißig.','Das kostet einundzwanzig Euro.','Isso custa vinte e um euros.','["números","regra"]',true,true),
('fc-a1-c02-09','A1','cap2-family','word','wohnen','morar / residir','Verbo regular para indicar residência.','wonen + em + cidade/país.','Ich wohne in München.','Eu moro em Munique.','["moradia","verbo"]',true,true),
('fc-a1-c02-10','A1','cap2-basics','phrase','wie alt bist du?','quantos anos você tem?','Pergunta padrão sobre idade.','Resposta: Ich bin X Jahre alt.','Wie alt bist du? — Ich bin 22.','Quantos anos você tem? — Tenho 22.','["idade","pergunta"]',true,true),
('fc-a1-c02-11','A1','cap2-basics','word','sehen / zeigen','ver / mostrar','Verbos úteis para interagir com fotos ou objetos.','sehen (irregular): sehe/siehst/sieht. zeigen (regular).','Zeig mal! Das sieht schön aus.','Mostra! Isso parece bonito.','["ação","verbo"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 3: Hobbies & Cores
-- ══════════════════════════════════════════════════
('fc-a1-c03-01','A1','cap3-leisure','word','das Hobby / die Freizeit','o hobby / o tempo livre','Vocabulário essencial para falar de lazer.','Freizeit = tempo livre. Hobby = plural Hobbys.','Was machst du in deiner Freizeit?','O que você faz no seu tempo livre?','["lazer","vocabulário"]',true,true),
('fc-a1-c03-02','A1','cap3-leisure','word','spielen / lesen / hören','jogar/tocar / ler / ouvir','Verbos regulares essenciais para hobbies.','Posição: verbo na 2ª posição em afirmações.','Ich spiele Gitarre und lese Bücher.','Eu toco violão e leio livros.','["hobby","verbo"]',true,true),
('fc-a1-c03-03','A1','cap3-leisure','word','die Farbe / rot / blau / grün','a cor / vermelho / azul / verde','Cores básicas. Invariáveis quando usadas sozinhas.','Substantivo: die Farbe. Adjetivos não declinam A1.','Meine Lieblingsfarbe ist blau.','Minha cor favorita é azul.','["cor","vocabulário"]',true,true),
('fc-a1-c03-04','A1','cap3-grammar','word','gern','com prazer / gosto de','Indica preferência. Posição: APÓS o verbo conjugado.','Ich + verbo + gern. = Gosto de fazer X.','Ich höre gern Musik.','Gosto de ouvir música.','["gramática","preferência"]',true,true),
('fc-a1-c03-05','A1','cap3-leisure','word','das Wochenende','o fim de semana','Neutro. Preposição: am Wochenende.','am = an + dem. Usado para dias/períodos.','Am Wochenende gehe ich ins Kino.','No fim de semana vou ao cinema.','["tempo","vocabulário"]',true,true),
('fc-a1-c03-06','A1','cap3-leisure','word','kochen / essen / trinken','cozinhar / comer / beber','Triade essencial. essen é irregular (isst).','essen: esse/isst/isst. kochen/trinken: regulares.','Ich koche gern Pasta und trinke Wasser.','Gosto de cozinhar macarrão e beber água.','["comida","verbo"]',true,true),
('fc-a1-c03-07','A1','cap3-basics','phrase','was machst du gern?','o que você gosta de fazer?','Pergunta chave para iniciar conversas sobre lazer.','Estrutura: Was + verbo + du + gern?','Was machst du gern? — Ich male.','O que gosta de fazer? — Eu pinto.','["pergunta","social"]',true,true),
('fc-a1-c03-08','A1','cap3-leisure','word','das Instrument / die Gitarre','o instrumento / o violão','Vocabulário musical. tocar = spielen.','spielen + instrumento (sem preposição).','Ich spiele Klavier seit einem Jahr.','Toco piano há um ano.','["música","vocabulário"]',true,true),
('fc-a1-c03-09','A1','cap3-grammar','phrase','regelmäßige Verben (-e/-st/-t/-en/-t/-en)','verbos regulares','Padrão de conjugação A1. Aplicável a 90% dos verbos.','ich -e, du -st, er -t, wir -en, ihr -t, sie -en.','ich lerne, du lernst, er lernt...','eu aprendo, você aprende, ele aprende...','["gramática","conjugação"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 4: Supermercado & Acusativo
-- ══════════════════════════════════════════════════
('fc-a1-c04-01','A1','cap4-shopping','word','der Supermarkt / einkaufen','o supermercado / fazer compras','Verbo separável: ich kaufe ... ein.','einkaufen separa no presente. Prefixo no final.','Ich kaufe im Supermarkt ein.','Eu faço compras no supermercado.','["compras","verbo"]',true,true),
('fc-a1-c04-02','A1','cap4-grammar','phrase','der → den / ein → einen','o → o / um → um (acusativo masc)','ÚNICA mudança no acusativo A1. Foco total aqui!','Fem/neut/plural não mudam. Só masculino.','Ich kaufe einen Apfel und eine Banane.','Compro uma maçã e uma banana.','["gramática","acusativo"]',true,true),
('fc-a1-c04-03','A1','cap4-food','word','das Obst / das Gemüse / das Brot','as frutas / os legumes / o pão','Neutros. Muito usados no contexto de compras.','Obst/Gemüse são coletivos (sempre singular).','Ich brauche Obst, Gemüse und Brot.','Preciso de frutas, legumes e pão.','["comida","vocabulário"]',true,true),
('fc-a1-c04-04','A1','cap4-food','word','die Milch / der Käse / das Ei','o leite / o queijo / o ovo','Gêneros mistos. Cuidado com o artigo!','Milch=fem, Käse=masc, Ei=neut.','Ich nehme die Milch und den Käse.','Eu pego o leite e o queijo.','["comida","gênero"]',true,true),
('fc-a1-c04-05','A1','cap4-shopping','phrase','ich hätte gern... / ich möchte...','eu gostaria de...','Fórmulas de cortesia para pedir/comprar.','hätte gern = condicional suave. möchte = desejo.','Ich hätte gern ein Kilo Äpfel, bitte.','Eu gostaria de um quilo de maçãs, por favor.','["pedido","cortesia"]',true,true),
('fc-a1-c04-06','A1','cap4-shopping','phrase','wie viel? / wie viele?','quanto? / quantos?','wie viel = incontável (água, leite). wie viele = contável (maçãs, ovos).','Concordam com o tipo de substantivo.','Wie viel kostet das? Wie viele Eier?','Quanto custa? Quantos ovos?','["quantidade","pergunta"]',true,true),
('fc-a1-c04-07','A1','cap4-shopping','word','bezahlen / das Wechselgeld','pagar / o troco','Verbo regular. Wechselgeld = troco (composto).','zahlen = sinônimo comum. Wechsel = troca/câmbio.','Kann ich mit Karte bezahlen? Hier ist das Wechselgeld.','Posso pagar com cartão? Aqui está o troco.','["financeiro","vocabulário"]',true,true),
('fc-a1-c04-08','A1','cap4-basics','phrase','sonst noch etwas?','mais alguma coisa?','Frase padrão de atendente. Responda: Nein, danke. / Ja, noch...','sonst = mais/além disso. noch = ainda/mais.','Sonst noch etwas? — Nein, das ist alles.','Mais alguma coisa? — Não, é só isso.','["compras","frase"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 5: Rotina & Horas
-- ══════════════════════════════════════════════════
('fc-a1-c05-01','A1','cap5-routine','word','aufstehen / frühstücken','levantar-se / tomar café da manhã','Verbos separáveis essenciais para rotina.','aufstehen: ich stehe ... auf. frühstücken: regular.','Ich stehe um 7 Uhr auf und frühstücke.','Levanto às 7h e tomo café.','["rotina","verbo"]',true,true),
('fc-a1-c05-02','A1','cap5-time','phrase','wie spät ist es? / es ist ... Uhr','que horas são? / são ... horas','Pergunta e resposta padrão para horas.','es ist + número + Uhr. Invariável.','Wie spät ist es? — Es ist drei Uhr.','Que horas são? — São três horas.','["horas","pergunta"]',true,true),
('fc-a1-c05-03','A1','cap5-time','word','halb acht = 7:30','meia para as oito = 7:30','ARMADILHA CLÁSSICA. halb + PRÓXIMA hora.','halb acht = metade do caminho até as 8h = 7:30.','Der Zug fährt um halb acht ab.','O trem parte às 7:30.','["horas","armadilha"]',true,true),
('fc-a1-c05-04','A1','cap5-time','word','Viertel nach / Viertel vor','quinze depois / quinze para','Divisão comum de horas no dia a dia alemão.','nach = depois. vor = antes.','Viertel nach drei (3:15). Viertel vor fünf (4:45).','Três e quinze. Cinco menos quinze.','["horas","vocabulário"]',true,true),
('fc-a1-c05-05','A1','cap5-routine','word','zu Mittag essen / zu Abend essen','almoçar / jantar','Expressões fixas. Não usam "essen" sozinho aqui.','zu + refeição + essen. Estrutura tradicional.','Um 12 Uhr esse ich zu Mittag.','Às 12h eu almoço.','["refeição","expressão"]',true,true),
('fc-a1-c05-06','A1','cap5-grammar','phrase','trennbare Verben (prefixo no final)','verbos separáveis','Na oração principal, o prefixo vai para o ÚLTIMO lugar.','anfangen → ich fange ... an. fernsehen → ich sehe ... fern.','Ich fange um 9 Uhr an. Wir sehen abends fern.','Começo às 9h. Assistimos TV à noite.','["gramática","sintaxe"]',true,true),
('fc-a1-c05-07','A1','cap5-routine','word','pünktlich / der Termin','pontual / o compromisso','Cultura alemã valoriza pünktlich. Termin = agenda/hora marcada.','pünktlich = adjetivo. der Termin = masculino.','Sei bitte pünktlich! Ich habe einen Termin.','Seja pontual, por favor! Tenho um compromisso.','["cultura","vocabulário"]',true,true),
('fc-a1-c05-08','A1','cap5-routine','word','schlafen / ins Bett gehen','dormir / ir para a cama','schlafen = verbo irregular (schläft). ins Bett gehen = expressão.','schlafen: ich schlafe, du schläfst. ins Bett = acusativo.','Ich schlafe um 23 Uhr und gehe ins Bett.','Durmo às 23h e vou para a cama.','["rotina","verbo"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 6: Trabalho & Profissões
-- ══════════════════════════════════════════════════
('fc-a1-c06-01','A1','cap6-work','word','die Arbeit / der Beruf / arbeiten','o trabalho / a profissão / trabalhar','Tríade essencial. arbeiten é regular (-est/-et por terminar em -t).','der Beruf = carreira/ocupação. die Arbeit = atividade/local.','Ich arbeite als Ingenieur. Das ist mein Beruf.','Trabalho como engenheiro. Essa é minha profissão.','["trabalho","vocabulário"]',true,true),
('fc-a1-c06-02','A1','cap6-work','phrase','ich bin + profissão (SEM artigo)','eu sou + profissão','Regra de ouro A1: NÃO use artigo ao dizer sua profissão.','✅ Ich bin Lehrerin. ❌ Ich bin eine Lehrerin.','Ich bin Studentin. Er ist Arzt.','Sou estudante. Ele é médico.','["gramática","profissão"]',true,true),
('fc-a1-c06-03','A1','cap6-work','word','der Chef / die Chefin / der Kollege','o chefe / a chefe / o colega','Feminino com -in. Kollege = colega de trabalho.','Chefin = chefe mulher. Kollegin = colega mulher.','Mein Kollege heißt Thomas. Die Chefin ist nett.','Meu colega chama Thomas. A chefe é legal.','["trabalho","pessoas"]',true,true),
('fc-a1-c06-04','A1','cap6-work','word','verdienen / das Gehalt / die Steuern','ganhar (salário) / o salário / os impostos','Vocabulário financeiro básico. Steuern = sempre plural.','verdienen = receber por trabalho. Gehalt = valor bruto.','Ich verdiene gut, aber zahle viele Steuern.','Ganho bem, mas pago muitos impostos.','["financeiro","vocabulário"]',true,true),
('fc-a1-c06-05','A1','cap6-work','word','der Urlaub / im Homeoffice / Feierabend','as férias / em home office / fim do expediente','Cultura de trabalho alemã. Feierabend = sagrado.','Urlaub = dias pagos. Homeoffice = remoto. Feierabend = descanso.','Ich habe 30 Tage Urlaub. Feierabend um 17 Uhr!','Tenho 30 dias de férias. Fim do expediente às 17h!','["trabalho","cultura"]',true,true),
('fc-a1-c06-06','A1','cap6-grammar','phrase','verbos em -t/-d ganham -e- (du arbeitest)','eufonia na conjugação','Para facilitar pronúncia, adiciona-se -e- antes de -st/-t.','arbeiten → du arbeitest, er arbeitet. finden → du findest.','Er arbeitet viel. Du findest den Schlüssel.','Ele trabalha muito. Você encontra a chave.','["gramática","conjugação"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 7: Cidade & Direções
-- ══════════════════════════════════════════════════
('fc-a1-c07-01','A1','cap7-city','word','die Stadt / der Weg / die Richtung','a cidade / o caminho / a direção','Vocabulário base para navegação urbana.','der Weg = rota/caminho. die Richtung = sentido.','Kennst du den Weg zum Bahnhof?','Você conhece o caminho para a estação?','["cidade","vocabulário"]',true,true),
('fc-a1-c07-02','A1','cap7-directions','word','geradeaus / links / rechts / zurück','em frente / esquerda / direita / voltar','Imperativos essenciais para dar direções.','Sem preposição. Advérbios puros.','Gehen Sie geradeaus, dann links.','Vá em frente, depois à esquerda.','["direção","imperativo"]',true,true),
('fc-a1-c07-03','A1','cap7-grammar','phrase','neben / zwischen / gegenüber (com dativo)','ao lado / entre / em frente a','Preposições estáticas A1. Exigem DATIVO.','der → dem, die → der, das → dem. Plural → den.','Die Apotheke ist neben dem Supermarkt.','A farmácia fica ao lado do supermercado.','["gramática","preposição"]',true,true),
('fc-a1-c07-04','A1','cap7-questions','word','wo? / wohin? / woher?','onde? / para onde? / de onde?','Tríade de localização. wo = estático. wohin = movimento. woher = origem.','Wo = dativo. Wohin = acusativo. Woher = aus/von.','Wo wohnst du? Wohin gehst du? Woher kommst du?','Onde mora? Para onde vai? De onde vem?','["pergunta","localização"]',true,true),
('fc-a1-c07-05','A1','cap7-city','word','die Apotheke / der Bahnhof / das Rathaus','a farmácia / a estação / a prefeitura','Locais urbanos essenciais. Gêneros variados.','Apotheke = remédios. Bahnhof = trens. Rathaus = prefeitura.','Die Apotheke ist gegenüber dem Rathaus.','A farmácia fica em frente à prefeitura.','["cidade","lugares"]',true,true),
('fc-a1-c07-06','A1','cap7-basics','phrase','in der Nähe (von) / zu Fuß','perto (de) / a pé','Expressões de distância e locomoção.','Nähe = proximidade. zu Fuß = sem veículo.','Der Park ist in der Nähe. Ich gehe zu Fuß.','O parque é perto. Vou a pé.','["distância","transporte"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 8: Clima & Lazer
-- ══════════════════════════════════════════════════
('fc-a1-c08-01','A1','cap8-weather','word','das Wetter / die Jahreszeit','o tempo (clima) / a estação do ano','Base para conversas sobre clima.','Jahreszeit = composto (Jahr + Zeit).','Wie ist das Wetter heute?','Como está o tempo hoje?','["clima","vocabulário"]',true,true),
('fc-a1-c08-02','A1','cap8-weather','word','Frühling / Sommer / Herbst / Winter','primavera / verão / outono / inverno','Estações. Masculinas (der). Preposição: im + estação.','im = in + dem. Todas der-Wörter.','Im Sommer ist es warm. Im Winter schneit es.','No verão está quente. No inverno neva.','["clima","estações"]',true,true),
('fc-a1-c08-03','A1','cap8-weather','phrase','es ist sonnig / es regnet / es schneit','está ensolarado / chovendo / nevando','Estruturas impessoais com ES. Obrigatório em alemão.','es + adjetivo OU es + verbo 3ª pess.','Es ist bewölkt und kalt. Es regnet seit gestern.','Está nublado e frio. Chove desde ontem.','["clima","gramática"]',true,true),
('fc-a1-c08-04','A1','cap8-leisure','word','der Ausflug / spazieren gehen / das Picknick','o passeio / caminhar / o piquenique','Atividades ao ar livre. spazieren gehen = separável.','Ausflug = viagem curta. Picknick = neutro.','Wir machen ein Picknick im Park.','Fazemos um piquenique no parque.','["lazer","vocabulário"]',true,true),
('fc-a1-c08-05','A1','cap8-grammar','phrase','am liebsten / ich mag...','o que mais gosto / eu gosto de...','Expressar preferência máxima. Posição: FINAL da frase.','am liebsten = superlativo de gern.','Ich mag den Herbst am liebsten.','Gosto mais do outono.','["preferência","gramática"]',true,true),
('fc-a1-c08-06','A1','cap8-basics','word','vergessen / die Sonnencreme / die Decke','esquecer / protetor solar / cobertor','Verbos e itens de preparo para passeio.','vergessen = irregular (vergisst). Sonnencreme = fem.','Vergiss die Sonnencreme nicht! Ich nehme eine Decke.','Não esqueça o protetor! Levo uma coberta.','["preparação","vocabulário"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 9: Roupas & Descrições
-- ══════════════════════════════════════════════════
('fc-a1-c09-01','A1','cap9-clothes','word','das Hemd / die Hose / das Kleid','a camisa / a calça / o vestido','Peças básicas. Hose = sempre singular em DE.','Hose = fem. Kleid = neut. Hemd = neut.','Ich trage ein blaues Hemd und eine schwarze Hose.','Visto uma camisa azul e uma calça preta.','["roupa","vocabulário"]',true,true),
('fc-a1-c09-02','A1','cap9-clothes','word','die Jacke / der Schal / die Handschuhe','a jaqueta / o cachecol / as luvas','Itens de inverno. Handschuhe = plural fixo.','Jacke = fem. Schal = masc. Handschuhe = pl.','Im Winter brauche ich eine Jacke und Handschuhe.','No inverno preciso de jaqueta e luvas.','["roupa","inverno"]',true,true),
('fc-a1-c09-03','A1','cap9-shopping','word','anprobieren / passen / tragen','experimentar / servir-cair bem / usar','Verbos de loja. anprobieren = separável. tragen = hábito.','anprobieren: probiere ... an. passen: regular.','Probier die Hose an! Sie passt perfekt.','Experimente a calça! Serve perfeitamente.','["compras","verbo"]',true,true),
('fc-a1-c09-04','A1','cap9-appearance','word','aussehen / die Haare / die Augen','parecer / os cabelos / os olhos','aussehen = separável (sieht ... aus). Plurais fixos.','aussehen + adjetivo. Haare/Augen = sempre plural.','Du siehst gut aus! Sie hat blonde Haare.','Você está bem! Ela tem cabelos loiros.','["aparência","verbo"]',true,true),
('fc-a1-c09-05','A1','cap9-basics','word','groß / klein / bequem / kaputt','alto-pequeno / grande-pequeno / confortável / estragado','Adjetivos descritivos essenciais. Invariáveis após sein.','groß = altura ou tamanho. kaputt = quebrado.','Die Schuhe sind bequem, aber alt. Das Handy ist kaputt.','Os sapatos são confortáveis, mas velhos. O celular está quebrado.','["descrição","adjetivo"]',true,true),
('fc-a1-c09-06','A1','cap9-shopping','phrase','welche Größe? / die Umkleidekabine','qual tamanho? / o provador','Frases de loja. Größe = feminino.','Umkleidekabine = composto (Umkleide + Kabine).','Welche Größe haben Sie? Die Kabine ist dort.','Qual é o seu tamanho? O provador é lá.','["compras","frase"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 10: Datas & Compromissos
-- ══════════════════════════════════════════════════
('fc-a1-c10-01','A1','cap10-time','word','der Termin / das Datum / planen','o compromisso / a data / planejar','Vocabulário de organização. Termin = masculino.','planen = regular. Datum = neutro.','Ich muss einen Termin planen. Das Datum ist der 15.5.','Preciso marcar um compromisso. A data é 15/5.','["agenda","vocabulário"]',true,true),
('fc-a1-c10-02','A1','cap10-time','word','Montag bis Sonntag','segunda a domingo','Dias da semana. Todos masculinos (der).','Abreviações: Mo, Di, Mi, Do, Fr, Sa, So.','Der Termin ist am Montag. Sonntag ist frei.','O compromisso é na segunda. Domingo é livre.','["calendário","dias"]',true,true),
('fc-a1-c10-03','A1','cap10-grammar','phrase','am / um / im (preposições de tempo)','em (dia) / às (hora) / em (mês)','Regra de ouro A1 para tempo. am=an+dem, um=exato, im=in+dem.','am Montag, um 10 Uhr, im Mai. Nunca trocar!','Wir treffen uns am Freitag um 14 Uhr im Café.','Nos encontramos na sexta às 14h no café.','["gramática","tempo"]',true,true),
('fc-a1-c10-04','A1','cap10-time','word','nächste Woche / gestern / morgen / heute','próxima semana / ontem / amanhã / hoje','Marcadores temporais essenciais. Ordem: Tempo-Causa-Lugar.','gestern=morgem. morgen=amanhã. heute=hoje.','Gestern war ich krank. Morgen habe ich Zeit.','Ontem estava doente. Amanhã tenho tempo.','["tempo","advérbio"]',true,true),
('fc-a1-c10-05','A1','cap10-basics','word','pünktlich / absagen / bestätigen / verschieben','pontual / cancelar / confirmar / remarcar','Verbos de gestão de agenda. todos regulares.','absagen = dar falta. verschieben = mudar data.','Bitte bestätige den Termin! Ich muss absagen.','Por favor confirme o compromisso! Preciso cancelar.','["agenda","verbo"]',true,true),
('fc-a1-c10-06','A1','cap10-time','phrase','von Montag bis Freitag / um wie viel Uhr?','de segunda a sexta / a que horas?','Intervalos e perguntas de horário.','von...bis = intervalo fechado. um = hora exata.','Ich arbeite von Montag bis Freitag. Um wie viel Uhr?','Trabalho de seg a sex. A que horas?','["tempo","pergunta"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 11: Casa & Mobília
-- ══════════════════════════════════════════════════
('fc-a1-c11-01','A1','cap11-home','word','das Zuhause / die Wohnung / das Haus','o lar / o apartamento / a casa','Tipos de moradia. Wohnung = aluguel comum.','Zuhause = conceito. Wohnung = físico. Haus = construção.','Ich suche eine Wohnung in München.','Procuro um apartamento em Munique.','["moradia","vocabulário"]',true,true),
('fc-a1-c11-02','A1','cap11-home','word','das Wohnzimmer / die Küche / das Schlafzimmer','a sala / a cozinha / o quarto','Cômodos principais. Todos compostos com Zimmer/Küche.','Wohnzimmer = leben+Zimmer. Schlafzimmer = schlafen+Zimmer.','Die Küche ist klein, aber praktisch.','A cozinha é pequena, mas prática.','["casa","cômodos"]',true,true),
('fc-a1-c11-03','A1','cap11-grammar','phrase','es gibt + acusativo (há/existe)','há/existe + acusativo','Estrutura impessoal para listar itens. SEMPRE acusativo!','es gibt einen Tisch (masc). es gibt eine Lampe (fem).','Im Wohnzimmer gibt es ein Sofa und zwei Stühle.','Na sala há um sofá e duas cadeiras.','["gramática","existência"]',true,true),
('fc-a1-c11-04','A1','cap11-furniture','word','der Tisch / der Stuhl / das Bett / der Schrank','a mesa / a cadeira / a cama / o armário','Móveis básicos. Tisch/Stuhl/Schrank = masc. Bett = neut.','Plurais: Tische, Stühle, Betten, Schränke.','Das Bett steht im Schlafzimmer. Der Tisch ist aus Holz.','A cama fica no quarto. A mesa é de madeira.','["mobília","vocabulário"]',true,true),
('fc-a1-c11-05','A1','cap11-grammar','phrase','in / an / auf + dativo (posição estática)','em/na/sobre + dativo','Preposições de localização fixa. Wo? = dativo.','in dem=im, an dem=am, auf dem=auf dem.','Das Bild hängt an der Wand. Die Lampe steht auf dem Tisch.','O quadro está na parede. A lâmpada está sobre a mesa.','["gramática","localização"]',true,true),
('fc-a1-c11-06','A1','cap11-basics','word','hell / dunkel / gemütlich / praktisch','claro / escuro / aconchegante / prático','Adjetivos para descrever ambientes. Invariáveis após sein.','gemütlich = aconchegante (cultura DE). praktisch = útil.','Die Wohnung ist hell und gemütlich.','O apartamento é claro e aconchegante.','["descrição","adjetivo"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 12: Viagens & Transportes
-- ══════════════════════════════════════════════════
('fc-a1-c12-01','A1','cap12-travel','word','reisen / die Reise / unterwegs','viajar / a viagem / a caminho','Vocabulário de deslocamento. unterwegs = advérbio.','reisen = verbo regular. die Reise = fem.','Ich reise gern. Ich bin unterwegs.','Gosto de viajar. Estou a caminho.','["viagem","vocabulário"]',true,true),
('fc-a1-c12-02','A1','cap12-transport','word','der Zug / das Flugzeug / die U-Bahn / das Fahrrad','o trem / o avião / o metrô / a bicicleta','Meios de transporte comuns. Gêneros mistos.','Zug=masc, Flugzeug=neut, U-Bahn=fem, Fahrrad=neut.','Ich fahre mit dem Zug. Sie fliegt mit dem Flugzeug.','Vou de trem. Ela voa de avião.','["transporte","vocabulário"]',true,true),
('fc-a1-c12-03','A1','cap12-grammar','phrase','fahren nach + cidade/país (sem artigo)','ir para + local','Regra de destino. nach + cidade ou países neutros/femininos.','Exceção: países masc/plurais → in + acusativo.','Ich fahre nach Berlin. Sie fliegt nach Italien.','Vou para Berlim. Ela voa para a Itália.','["gramática","destino"]',true,true),
('fc-a1-c12-04','A1','cap12-transport','phrase','mit + dativo (meio de transporte)','com + dativo','Indica instrumento/veículo. der→dem, die→der, das→dem.','mit dem Zug, mit der U-Bahn, mit dem Fahrrad.','Wir fahren mit der S-Bahn zum Flughafen.','Vamos de trem urbano ao aeroporto.','["transporte","preposição"]',true,true),
('fc-a1-c12-05','A1','cap12-action','word','einsteigen / aussteigen / umsteigen','embarcar / desembarcar / baldear','Verbos separáveis de transporte. Prefixos: ein/aus/um.','einsteigen: steige ... ein. aussteigen: steige ... aus.','Steig hier ein! Steig am Bahnhof aus.','Embarque aqui! Desembarque na estação.','["transporte","verbo"]',true,true),
('fc-a1-c12-06','A1','cap12-basics','word','dauern / bequem / teuer / günstig / das Ticket','durar / confortável / caro / barato / a passagem','Adjetivos e substantivos de avaliação de viagem.','dauern = tempo. günstig = bom preço. Ticket = neutro.','Die Fahrt dauert 4 Stunden. Das Ticket ist günstig.','A viagem dura 4h. A passagem é barata.','["viagem","vocabulário"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 13: Restaurante & Pedidos
-- ══════════════════════════════════════════════════
('fc-a1-c13-01','A1','cap13-restaurant','word','das Restaurant / bestellen / die Speisekarte','o restaurante / pedir / o cardápio','Vocabulário básico. bestellen = encomendar/pedir.','Speisekarte = Karte. bestellen = regular.','Ich möchte bestellen. Wo ist die Speisekarte?','Gostaria de pedir. Onde está o cardápio?','["restaurante","vocabulário"]',true,true),
('fc-a1-c13-02','A1','cap13-grammar','phrase','ich möchte / ich hätte gern','eu gostaria','Formas de cortesia para pedidos. möchte = condicional de mögen.','seguido de acusativo ou infinitivo no final.','Ich möchte einen Salat. Ich hätte gern Wasser.','Gostaria de uma salada. Gostaria de água.','["gramática","pedido"]',true,true),
('fc-a1-c13-03','A1','cap13-food','word','das Schnitzel / die Suppe / der Salat / das Getränk','o bife à milanesa / a sopa / a salada / a bebida','Pratos comuns. Schnitzel/Geränk=neut. Suppe/Salat=fem.','die Vorspeise (entrada), Hauptspeise (principal), Nachspeise (sobremesa).','Ich nehme das Schnitzel mit Pommes.','Vou pegar o bife à milanesa com batatas.','["comida","pratos"]',true,true),
('fc-a1-c13-04','A1','cap13-basics','phrase','mit oder ohne Kohlensäure?','com ou sem gás?','Pergunta padrão para água no DE. Kohlensäure = fem.','mit = com. ohne = sem. Água da torneira raramente é servida.','Ein Wasser, bitte. Mit Kohlensäure.','Uma água, por favor. Com gás.','["bebida","frase"]',true,true),
('fc-a1-c13-05','A1','cap13-billing','word','die Rechnung / zusammen / getrennt / schmecken','a conta / juntos / separados / ter gosto','Fechamento de conta. schmecken = agradar ao paladar.','zusammen/getrennt = advérbios. schmecken + dativo (impessoal).','Die Rechnung, bitte! Zusammen. Hat es geschmeckt?','A conta, por favor! Juntos. Estava bom?','["conta","vocabulário"]',true,true),
('fc-a1-c13-06','A1','cap13-culture','word','Prost! / das Trinkgeld / Leitungswasser','Saúde! / gorjeta / água da torneira','Cultura de mesa. Prost! = olho no olho. Trinkgeld = 5-10%.','Leitungswasser = rara em restaurantes. Trinkgeld = dito na hora.','Prost! 35 Euro, stimmt so. Leitungswasser ist selten.','Saúde! 35 euros, pode ficar. Água da torneira é rara.','["cultura","etiqueta"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 14: Sentimentos & Saúde
-- ══════════════════════════════════════════════════
('fc-a1-c14-01','A1','cap14-feelings','word','glücklich / traurig / müde / gestresst','feliz / triste / cansado / estressado','Adjetivos de estado emocional. Invariáveis após sein.','gestresst = empréstimo do inglês. müde = cansaço físico/mental.','Ich bin glücklich. Er ist sehr müde.','Estou feliz. Ele está muito cansado.','["emoção","adjetivo"]',true,true),
('fc-a1-c14-02','A1','cap14-health','word','krank / gesund / das Fieber / sich ausruhen','doente / saudável / a febre / descansar','Vocabulário médico básico. sich ausruhen = reflexivo.','krank = doente. gesund = curado/saudável. Fieber = neutro.','Ich bin krank. Ich muss mich ausruhen.','Estou doente. Preciso descansar.','["saúde","vocabulário"]',true,true),
('fc-a1-c14-03','A1','cap14-grammar','phrase','mein Kopf tut weh / ich habe Kopfschmerzen','minha cabeça dói / estou com dor de cabeça','Duas estruturas para dor. tut weh = parte + verbo. Schmerzen = substantivo.','tun weh = plural (Füße tun weh). Kopfschmerzen = sempre plural.','Mein Bauch tut weh. Ich habe Halsschmerzen.','Minha barriga dói. Estou com dor de garganta.','["gramática","dor"]',true,true),
('fc-a1-c14-04','A1','cap14-feelings','phrase','sich fühlen / Das tut mir leid / Gute Besserung!','sentir-se / Sinto muito / Melhoras!','Expressões de empatia e estado. sich fühlen = reflexivo.','Das tut mir leid = empatia. Gute Besserung = desejo.','Ich fühle mich besser. Das tut mir leid! Gute Besserung!','Sinto-me melhor. Sinto muito! Melhoras!','["empatia","frase"]',true,true),
('fc-a1-c14-05','A1','cap14-basics','word','sicher / unsicher / stolz / enttäuscht','seguro / inseguro / orgulhoso / decepcionado','Adjetivos de autoavaliação. úteis para conversas profundas A1.','sicher = confiante. stolz = realização. enttäuscht = frustração.','Ich bin unsicher. Sie ist stolz auf dich.','Estou inseguro. Ela está orgulhosa de você.','["emoção","adjetivo"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 15: Descrições & Comparações
-- ══════════════════════════════════════════════════
('fc-a1-c15-01','A1','cap15-traits','word','nett / sympathisch / zuverlässig / hilfsbereit','legal / simpático / confiável / prestativo','Traços de personalidade valorizados na DE.','sympathisch > inteligente. hilfsbereit = disposto a ajudar.','Er ist sehr zuverlässig und hilfsbereit.','Ele é muito confiável e prestativo.','["personalidade","adjetivo"]',true,true),
('fc-a1-c15-02','A1','cap15-traits','word','ruhig / spontan / kreativ / ordentlich','calmo / espontâneo / criativo / organizado','Estilos de comportamento. ordentlich = limpeza+organização.','ruhig = paz. spontan = improviso. kreativ = arte/ideias.','Anna ist ruhig, Ben ist spontan.','Anna é calma, Ben é espontâneo.','["personalidade","adjetivo"]',true,true),
('fc-a1-c15-03','A1','cap15-grammar','phrase','aussehen + adjetivo / genauso ... wie','parecer + adj / tão ... quanto','Estruturas de comparação e aparência. aussehen = separável.','genauso X wie Y = igualdade. so X wie Y = similar.','Du siehst müde aus. Sie ist genauso nett wie du.','Você parece cansado. Ela é tão legal quanto você.','["gramática","comparação"]',true,true),
('fc-a1-c15-04','A1','cap15-basics','word','einfach / schwierig / wichtig / modern','fácil / difícil / importante / moderno','Adjetivos avaliativos universais. Invariáveis predicativos.','einfach = simples/fácil. schwierig = complexo. wichtig = prioridade.','Deutsch ist manchmal schwierig, aber wichtig.','Alemão é às vezes difícil, mas importante.','["avaliação","adjetivo"]',true,true),
('fc-a1-c15-05','A1','cap15-basics','word','laut / leise / sauber / schmutzig','barulhento / silencioso / limpo / sujo','Adjetivos de ambiente e higiene. antônimos diretos.','laut/leise = som. sauber/schmutzig = limpeza.','Das Zimmer ist sauber und leise.','O quarto é limpo e silencioso.','["ambiente","adjetivo"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 16: Verbos Essenciais
-- ══════════════════════════════════════════════════
('fc-a1-c16-01','A1','cap16-verbs','word','sein / haben / werden','ser-estar / ter / tornar-se','Os 3 pilares. werden = futuro/transformação. totalmente irregulares.','sein: bin/bist/ist. haben: habe/hast/hat. werden: werde/wirst/wird.','Ich bin Student. Ich habe Zeit. Ich werde Arzt.','Sou estudante. Tenho tempo. Vou ser médico.','["gramática","verbo"]',true,true),
('fc-a1-c16-02','A1','cap16-verbs','word','essen / sprechen / lesen / schreiben','comer / falar / ler / escrever','Irregulares com mudança de vogal e/ou padrão forte.','essen→isst, sprechen→sprichst, lesen→liest, schreiben→schreibt.','Er isst Pizza. Sie spricht Deutsch. Ich lese viel.','Ele come pizza. Ela fala alemão. Eu leio muito.','["gramática","verbo"]',true,true),
('fc-a1-c16-03','A1','cap16-verbs','phrase','kennen vs. wissen','conhecer (pessoas/lugares) vs. saber (fatos)','Diferença crucial A1. kennen + Akk. wissen + dass/wo/wie.','kennen = experiência direta. wissen = informação.','Kennst du Berlin? Ich weiß, dass er kommt.','Conhece Berlim? Sei que ele vem.','["gramática","verbo"]',true,true),
('fc-a1-c16-04','A1','cap16-modal','word','können / müssen / wollen / dürfen','poder-saber / precisar / querer / poder(permissão)','Modais essenciais. ich/er forma igual. infinitivo no final.','können = habilidade. müssen = obrigação. wollen = desejo forte.','Ich kann schwimmen. Ich muss lernen. Ich will reisen.','Sei nadar. Preciso estudar. Quero viajar.','["gramática","modal"]',true,true),
('fc-a1-c16-05','A1','cap16-action','word','anrufen / treffen / vergessen / vorschlagen','ligar / encontrar / esquecer / sugerir','Verbos de interação social. anrufen/vergessen = separáveis/irregulares.','anrufen: rufe ... an. vergessen: vergisst. treffen: trifft.','Ich rufe dich an. Vergiss den Schlüssel nicht!','Te ligo. Não esqueça a chave!','["ação","verbo"]',true,true),
('fc-a1-c16-06','A1','cap16-basics','word','das Kino / der Film / die Karte / abmachen','o cinema / o filme / o ingresso / combinar','Lazer e planejamento. Karte = ingresso/cartão. abmachen = acordo.','Karte = fem (ingresso). abmachen = regular.','Wir machen ab: Kino um 20 Uhr. Ich kaufe die Karten.','Combinamos: cinema às 20h. Compro os ingressos.','["lazer","vocabulário"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 17: Dativo & Interação
-- ══════════════════════════════════════════════════
('fc-a1-c17-01','A1','cap17-dative','word','mir / dir / ihm / ihr / uns / euch / ihnen','a mim / a você / a ele / a ela / a nós / a vocês / a eles','Pronomes dativos. Essenciais para interação indireta.','mir=eu, dir=du, ihm=er/masc, ihr=sie/fem, uns=wir, euch=ihr, ihnen=sie/pl.','Das gehört mir. Ich helfe dir. Ich danke ihr.','Isso é meu. Ajudo você. Agradeço a ela.','["gramática","pronome"]',true,true),
('fc-a1-c17-02','A1','cap17-grammar','phrase','mit / zu / von + dativo','com / para-a / de + dativo','Preposições fixas A1. der→dem, die→der, das→dem, pl→den.','mit=companhia, zu=destino/pessoa, von=origem/posse.','Ich gehe mit dir zum Markt. Das ist von meinem Bruder.','Vou com você ao mercado. Isso é do meu irmão.','["gramática","preposição"]',true,true),
('fc-a1-c17-03','A1','cap17-verbs','word','helfen / danken / gefallen / gehören','ajudar / agradecer / agradar / pertencer','Verbos que REGEM dativo. Decore a regência!','helfen+dat, danken+dat, gefallen+dat, gehören+dat.','Kannst du mir helfen? Ich danke dir. Das gefällt mir.','Pode me ajudar? Agradeço a você. Isso me agrada.','["gramática","regência"]',true,true),
('fc-a1-c17-04','A1','cap17-social','word','schenken / geben / der Geburtstag / das Geschenk','dar de presente / dar / o aniversário / o presente','Interação social. schenken = presente. geben = entrega.','schenken + dat (pessoa) + akk (objeto).','Ich schenke dir ein Buch zum Geburtstag.','Dou um livro a você no aniversário.','["social","verbo"]',true,true),
('fc-a1-c17-05','A1','cap17-basics','phrase','gern geschehen! / kein Problem!','de nada! / sem problema!','Respostas a agradecimentos. Cortesia essencial.','gern geschehen = ocorreu com prazer. kein Problem = informal.','Danke! — Gern geschehen! / Kein Problem!','Obrigado! — De nada! / Sem problema!','["cortesia","frase"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 18: Perguntas & Comunicação
-- ══════════════════════════════════════════════════
('fc-a1-c18-01','A1','cap18-questions','word','wer / was / wo / wann / warum / wie','quem / o quê / onde / quando / por quê / como','W-Fragen básicas. Verbo na 2ª posição sempre.','wer=sujeito, was=objeto, wo=lugar, wann=tempo, warum=causa, wie=modo.','Wer ist das? Was machst du? Wo wohnst du? Wann kommst du?','Quem é? O que faz? Onde mora? Quando vem?','["pergunta","gramática"]',true,true),
('fc-a1-c18-02','A1','cap18-questions','word','wie viel / wie viele / welcher','quanto (incont) / quantos (cont) / qual','Quantidade e escolha. wie viel+singular, wie viele+plural, welcher+gênero.','Welcher=masc, welche=fem/pl, welches=neut.','Wie viel kostet es? Wie viele Kinder? Welches Buch?','Quanto custa? Quantos filhos? Qual livro?','["pergunta","quantidade"]',true,true),
('fc-a1-c18-03','A1','cap18-conversation','word','vielleicht / natürlich / leider / genau / eigentlich','talvez / claro / infelizmente / exatamente / na verdade','Marcadores discursivos para fluidez. Posição flexível (geralmente 1ª).','leider = negativa suave. eigentlich = correção/curiosidade.','Vielleicht morgen. Leider nein. Genau! Eigentlich ja.','Talvez amanhã. Infelizmente não. Exato! Na verdade sim.','["conversação","advérbio"]',true,true),
('fc-a1-c18-04','A1','cap18-action','word','verstehen / erklären / wiederholen / antworten','entender / explicar / repetir / responder','Verbos de aprendizado. antworten+dat. erklären+akk.','wiederholen = pedir clareza. verstehen = compreensão.','Kannst du das wiederholen? Ich verstehe nicht. Er antwortet mir.','Pode repetir? Não entendo. Ele me responde.','["aprendizado","verbo"]',true,true),
('fc-a1-c18-05','A1','cap18-basics','phrase','Ja/Nein-Fragen: Verbo em 1º lugar','Perguntas de sim/não: Verbo em 1ª posição','Estrutura diferente de W-Fragen. Respostas: Ja/Nein/Vielleicht.','Hast du Zeit? Kommst du mit? Ist das teuer?','Hast du Zeit?','Você tem tempo?','["gramática","sintaxe"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 19: Diálogo & Conectivos
-- ══════════════════════════════════════════════════
('fc-a1-c19-01','A1','cap19-dialog','word','sich vorstellen / kennenlernen / der Platz / frei','apresentar-se / conhecer / o lugar / livre','Início de interação. Platz=masc. frei=disponível.','sich vorstellen = reflexivo. kennenlernen = separável.','Ist dieser Platz frei? Ich möchte mich vorstellen.','Este lugar está livre? Gostaria de me apresentar.','["social","vocabulário"]',true,true),
('fc-a1-c19-02','A1','cap19-connection','word','und / aber / dann / weil / vielleicht','e / mas / então / porque / talvez','Conectivos A1. und/aber=posição 0. weil=verbo no final.','dann=sequência. vielleicht=sugestão. weil=causa subordinada.','Ich bin müde, aber ich gehe aus. Weil ich lerne, verstehe ich.','Estou cansado, mas saio. Porque estudo, entendo.','["gramática","conectivo"]',true,true),
('fc-a1-c19-03','A1','cap19-action','word','Geld abheben / empfehlen / der Vorschlag / treffen','sacar dinheiro / recomendar / a sugestão / encontrar','Interações urbanas. abheben=separável. Vorschlag=masc.','treffen = encontro casual/marcado. empfehlen = irregular (empfiehlt).','Wo kann ich Geld abheben? Hast du einen Vorschlag?','Onde posso sacar dinheiro? Tem uma sugestão?','["cidade","verbo"]',true,true),
('fc-a1-c19-04','A1','cap19-social','phrase','sich freuen auf / abmachen / bis später','estar ansioso por / combinar / até mais tarde','Fechamento de planos. freuen auf + akk. abmachen = acordo.','bis später = informal. abmachen = regular.','Ich freue mich auf das Treffen. Wir machen 19 Uhr ab. Bis später!','Estou ansioso pelo encontro. Combinamos 19h. Até mais!','["planejamento","frase"]',true,true),
('fc-a1-c19-05','A1','cap19-basics','word','die Hilfe / traditionell / international / die Ecke','a ajuda / tradicional / internacional / a esquina','Vocabulário de recomendação e localização. Ecke=fem.','traditionell/international = adjetivos. Hilfe = fem.','Danke für deine Hilfe! Gleich um die Ecke.','Obrigado pela ajuda! Logo na esquina.','["social","vocabulário"]',true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 20: Revisão & Metas
-- ══════════════════════════════════════════════════
('fc-a1-c20-01','A1','cap20-review','word','die Wiederholung / die Anwendung / das Ziel / der Fortschritt','a revisão / a aplicação / a meta / o progresso','Vocabulário de estudo. Ziel=neut. Fortschritt=masc.','Wiederholung = revisar. Anwendung = usar na prática.','Übung macht den Meister. Mein Ziel ist B1.','A prática leva à perfeição. Minha meta é B1.','["estudo","vocabulário"]',true,true),
('fc-a1-c20-02','A1','cap20-review','word','üben / schaffen / meist(ens) / der Artikel','praticar / conseguir / na maioria das vezes / o artigo','Verbos e conceitos de evolução. schaffen = alcançar.','üben = regular. schaffen = irregular (schafft). meist(ens) = adv.','Ich übe jeden Tag. Ich schaffe das! Meistens verstehe ich.','Pratico todo dia. Eu consigo! Na maioria das vezes entendo.','["estudo","verbo"]',true,true),
('fc-a1-c20-03','A1','cap20-grammar','phrase','Satzstellung: Verbo na posição 2','Sintaxe: Verbo na 2ª posição','Regra de ouro A1. Afirmações: Sujeito(1) + Verbo(2) + ...','Inversão temporal: Heute gehe ich... (Verbo ainda em 2).','Ich lerne Deutsch. Morgen habe ich Zeit.','Eu estudo alemão. Amanhã tenho tempo.','["gramática","sintaxe"]',true,true),
('fc-a1-c20-04','A1','cap20-basics','word','allein / der Kollege / der Dialog / verstehen','sozinho / o colega / o diálogo / entender','Autonomia e prática. allein = sem ajuda. Kollege = trabalho.','Dialog = masculino. verstehen = irregular (versteht).','Ich mache den Termin allein. Ich verstehe den Dialog.','Faço o compromisso sozinho. Entendo o diálogo.','["autonomia","vocabulário"]',true,true),
('fc-a1-c20-05','A1','cap20-basics','phrase','Übung macht den Meister! / Viel Erfolg!','A prática leva à perfeição! / Muito sucesso!','Provérbios e votos finais. Motivacionais.','Übung = prática. Meister = mestre. Erfolg = sucesso.','Weiter so! Übung macht den Meister. Viel Erfolg!','Continue assim! A prática leva à perfeição. Muito sucesso!','["motivação","frase"]',true,true),

-- ══════════════════════════════════════════════════
-- PROVA FINAL (a1-exam)
-- ══════════════════════════════════════════════════
('fc-a1-exam-01','A1','exam-general','word','die Prüfung / bestehen / der Punkt / die Note','a prova / passar / o ponto / a nota','Vocabulário de avaliação. Prüfung=fem. bestehen=regular.','Punkt=masc. Note=fem. bestehen + acusativo.','Ich bestehe die Prüfung! Ich habe 80 Punkte.','Eu passo na prova! Tenho 80 pontos.','["exame","vocabulário"]',true,true),
('fc-a1-exam-02','A1','exam-parts','word','Hören / Lesen / Schreiben / Sprechen / Grammatik','Ouvir / Ler / Escrever / Falar / Gramática','As 5 partes da prova. Substantivização de verbos (neutros).','Todas neutras: das Hören, das Lesen... Grammatik=fem.','Teil 1 ist Hören. Teil 5 ist Grammatik.','Parte 1 é Ouvir. Parte 5 é Gramática.','["exame","estrutura"]',true,true),
('fc-a1-exam-03','A1','exam-action','word','antworten / fragen / korrigieren / wiederholen','responder / perguntar / corrigir / repetir','Ações durante a prova. antworten+dat. korrigieren=regular.','fragen+akk. wiederholen=separável.','Bitte antworten Sie klar. Ich korrigiere die Fehler.','Por favor responda claro. Corrijo os erros.','["exame","verbo"]',true,true),
('fc-a1-exam-04','A1','exam-status','word','richtig / falsch / unklar / bestanden','correto / errado / pouco claro / aprovado','Avaliação de desempenho. Adjetivos invariáveis.','bestanden = particípio de bestehen. unklar = ambíguo.','Die Antwort ist richtig. Der Satz ist unklar.','A resposta está correta. A frase está pouco clara.','["avaliação","adjetivo"]',true,true),
('fc-a1-exam-05','A1','exam-mindset','phrase','Keine Angst! / Konzentrier dich! / Du schaffst das!','Sem medo! / Concentre-se! / Você consegue!','Frases de apoio pré-prova. Imperativos e encorajamento.','Angst=fem. Konzentrieren=reflexivo. Schaffen=conseguir.','Keine Angst vor Fehlern! Konzentrier dich! Du schaffst das!','Sem medo de errar! Concentre-se! Você consegue!','["motivação","exame"]',true,true),
('fc-a1-exam-06','A1','exam-strategy','phrase','Lies genau! / Hör gut zu! / Prüfe deine Antworten!','Leia com atenção! / Ouça bem! / Verifique suas respostas!','Imperativos de estratégia. genau=exato. prüfen=verificar.','zu+hören=escutar ativamente. Antworten=plural.','Lies die Frage genau! Hör dem Text zu! Prüfe alles!','Leia a pergunta com atenção! Ouça o texto! Verifique tudo!','["estratégia","imperativo"]',true,true)

ON CONFLICT (slug) DO UPDATE SET
level = EXCLUDED.level, theme = EXCLUDED.theme,
card_type = EXCLUDED.card_type, front_de = EXCLUDED.front_de,
back_pt = EXCLUDED.back_pt, explanation_pt = EXCLUDED.explanation_pt,
grammar_note = EXCLUDED.grammar_note, example_de = EXCLUDED.example_de,
example_pt = EXCLUDED.example_pt, tags = EXCLUDED.tags,
curated = true, active = true, updated_at = now();

-- ══════════════════════════════════════════════════
-- BLOCO 6 — Índices para Performance (Opcional mas Recomendado)
-- ══════════════════════════════════════════════════
-- Estes índices aceleram buscas comuns no hub de estudos.
-- Execute apenas se seu banco permitir CREATE INDEX.

-- Índice para buscas por nível e módulo
CREATE INDEX IF NOT EXISTS idx_lessons_level_module 
ON study_lessons (level, module_slug) 
WHERE active = true;

-- Índice para exercícios por lesson e tipo
CREATE INDEX IF NOT EXISTS idx_exercises_lesson_type 
ON study_exercises (lesson_slug, exercise_type) 
WHERE active = true;

-- Índice para flashcards por tema e nível
CREATE INDEX IF NOT EXISTS idx_flashcards_theme_level 
ON flashcards_v2 (level, theme) 
WHERE curated = true AND active = true;

-- Índice GIN para buscas em JSONB (exemplos, key_phrases)
CREATE INDEX IF NOT EXISTS idx_lessons_examples_gin 
ON study_lessons USING GIN (examples jsonb_path_ops) 
WHERE examples IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_lessons_keyphrases_gin 
ON study_lessons USING GIN (key_phrases jsonb_path_ops) 
WHERE key_phrases IS NOT NULL;

-- Índice para módulos ativos ordenados
CREATE INDEX IF NOT EXISTS idx_modules_active_order 
ON study_modules (sort_order) 
WHERE active = true;

-- ══════════════════════════════════════════════════
-- BLOCO 7 — Estatísticas e Vacuum (PostgreSQL)
-- ══════════════════════════════════════════════════
-- Atualiza estatísticas do planner para otimizar queries.
-- Recomendado após carga massiva de dados.

ANALYZE study_modules;
ANALYZE study_lessons;
ANALYZE study_exercises;
ANALYZE flashcards_v2;

-- ══════════════════════════════════════════════════
-- BLOCO 8 — Views Úteis para o Hub (Opcional)
-- ══════════════════════════════════════════════════
-- Views simplificam consultas frequentes no frontend.

-- View: Resumo de progresso por módulo
CREATE OR REPLACE VIEW v_module_progress AS
SELECT 
    m.slug AS module_slug,
    m.title_pt,
    m.title_de,
    m.chapter_number,
    COUNT(DISTINCT l.slug) AS total_lessons,
    COUNT(DISTINCT e.slug) AS total_exercises,
    COUNT(DISTINCT f.slug) AS total_flashcards,
    SUM(e.xp_reward) AS max_xp_possible
FROM study_modules m
LEFT JOIN study_lessons l ON m.slug = l.module_slug AND l.active = true
LEFT JOIN study_exercises e ON l.slug = e.lesson_slug AND e.active = true
LEFT JOIN flashcards_v2 f ON m.slug LIKE 'a1-cap%' AND f.theme LIKE 'cap%' AND f.active = true
WHERE m.active = true
GROUP BY m.slug, m.title_pt, m.title_de, m.chapter_number, m.sort_order
ORDER BY m.sort_order;

-- View: Flashcards curados por capítulo (para revisão rápida)
CREATE OR REPLACE VIEW v_curated_flashcards_by_chapter AS
SELECT 
    CASE 
        WHEN slug LIKE 'fc-a1-c01%' THEN 1
        WHEN slug LIKE 'fc-a1-c02%' THEN 2
        WHEN slug LIKE 'fc-a1-c03%' THEN 3
        WHEN slug LIKE 'fc-a1-c04%' THEN 4
        WHEN slug LIKE 'fc-a1-c05%' THEN 5
        WHEN slug LIKE 'fc-a1-c06%' THEN 6
        WHEN slug LIKE 'fc-a1-c07%' THEN 7
        WHEN slug LIKE 'fc-a1-c08%' THEN 8
        WHEN slug LIKE 'fc-a1-c09%' THEN 9
        WHEN slug LIKE 'fc-a1-c10%' THEN 10
        WHEN slug LIKE 'fc-a1-c11%' THEN 11
        WHEN slug LIKE 'fc-a1-c12%' THEN 12
        WHEN slug LIKE 'fc-a1-c13%' THEN 13
        WHEN slug LIKE 'fc-a1-c14%' THEN 14
        WHEN slug LIKE 'fc-a1-c15%' THEN 15
        WHEN slug LIKE 'fc-a1-c16%' THEN 16
        WHEN slug LIKE 'fc-a1-c17%' THEN 17
        WHEN slug LIKE 'fc-a1-c18%' THEN 18
        WHEN slug LIKE 'fc-a1-c19%' THEN 19
        WHEN slug LIKE 'fc-a1-c20%' THEN 20
        WHEN slug LIKE 'fc-a1-exam%' THEN 99
        ELSE 0 
    END AS chapter_number,
    slug,
    front_de,
    back_pt,
    explanation_pt,
    grammar_note,
    example_de,
    example_pt,
    tags,
    card_type
FROM flashcards_v2
WHERE curated = true AND active = true
ORDER BY chapter_number, slug;

-- View: Exercícios prontos para quiz (com opções parseadas)
CREATE OR REPLACE VIEW v_quiz_exercises AS
SELECT 
    e.slug,
    e.lesson_slug,
    l.title_pt AS lesson_title,
    m.title_pt AS module_title,
    e.exercise_type,
    e.prompt_pt,
    e.prompt_de,
    e.options,
    e.answer,
    e.explanation_pt,
    e.xp_reward,
    e.sort_order
FROM study_exercises e
JOIN study_lessons l ON e.lesson_slug = l.slug
JOIN study_modules m ON l.module_slug = m.slug
WHERE e.active = true AND l.active = true AND m.active = true
ORDER BY m.sort_order, l.sort_order, e.sort_order;

-- ══════════════════════════════════════════════════
-- BLOCO 9 — Comentários Finais e Instruções de Uso
-- ══════════════════════════════════════════════════
/*
╔════════════════════════════════════════════════════════════════╗
║  🎉 DEUTSCH HUB — 03_a1_data.sql — CONCLUÍDO!                  ║
╠════════════════════════════════════════════════════════════════╣
║  Este script popula seu banco com:                              ║
║  • 21 módulos A1 (capítulos 1-20 + prova final)                ║
║  • ~63 lessons com diálogos, gramática e cultura               ║
║  • 225 exercícios (múltipla escolha, preencher, traduzir)      ║
║  • ~256 flashcards curados com vocabulário essencial           ║
║  • Views otimizadas para frontend do hub                       ║
╠════════════════════════════════════════════════════════════════╣
║  ORDEM DE EXECUÇÃO DOS SCRIPTS:                                ║
║  1. 01_schema.sql      → Cria tabelas e tipos                  ║
║  2. 02_tables.sql      → Cria constraints e índices base       ║
║  3. 03_a1_data.sql     → ← ESTE ARQUIVO → Popula dados A1      ║
║  4. 04_rls.sql         → Aplica Row Level Security (se usar)   ║
║  5. 05_functions.sql   → Cria funções utilitárias (opcional)   ║
╠════════════════════════════════════════════════════════════════╣
║  DICAS DE MANUTENÇÃO:                                          ║
║  • Para atualizar um capítulo: edite o INSERT correspondente   ║
║    e reexecute APENAS este arquivo (ON CONFLICT atualiza).     ║
║  • Para limpar e recomeçar:                                    ║
║    TRUNCATE study_exercises, study_lessons, study_modules,    ║
║    flashcards_v2 RESTART IDENTITY CASCADE;                    ║
║  • Backup antes de mudanças:                                   ║
║    pg_dump -U seu_user -d seu_db -f backup_antes.sql          ║
╠════════════════════════════════════════════════════════════════╣
║  PRÓXIMOS PASSOS (sugestões):                                  ║
║  • Criar 03_b1_data.sql para nível B1                          ║
║  • Adicionar tabela user_progress para salvar avanço           ║
║  • Integrar com frontend via API (ex: PostgREST)               ║
║  • Adicionar áudio para diálogos (coluna audio_url)           ║
╚════════════════════════════════════════════════════════════════╝
*/

-- ══════════════════════════════════════════════════
-- BLOCO 10 — Confirmação Final (Log no Console)
-- ══════════════════════════════════════════════════
DO $$
BEGIN
    RAISE NOTICE '✅ DEUTSCH HUB: Dados A1 carregados com sucesso!';
    RAISE NOTICE '📊 Resumo: % módulos, % lessons, % exercícios, % flashcards',
        (SELECT COUNT(*) FROM study_modules WHERE level = 'A1'),
        (SELECT COUNT(*) FROM study_lessons WHERE level = 'A1'),
        (SELECT COUNT(*) FROM study_exercises WHERE level = 'A1'),
        (SELECT COUNT(*) FROM flashcards_v2 WHERE level = 'A1');
    RAISE NOTICE '🚀 Próximo passo: Execute 04_rls.sql (se aplicável) e inicie seu hub!';
END $$;

-- ══════════════════════════════════════════════════
-- FIM DO ARQUIVO 03_a1_data.sql
-- ══════════════════════════════════════════════════