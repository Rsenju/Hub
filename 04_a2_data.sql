-- =====================================================
-- DEUTSCH HUB — 04_a2_data.sql
-- Módulos A2 Capítulos 21-39 + Prova Final A2
-- Execute após 02_tables.sql e 06_rls.sql.
-- =====================================================

-- ══════════════════════════════════════════════════
-- BLOCO 1 — Limpar dados A2 existentes
-- ══════════════════════════════════════════════════
DELETE FROM study_exercises WHERE module_slug LIKE 'a2-%';
DELETE FROM study_lessons WHERE module_slug LIKE 'a2-%';
DELETE FROM study_modules WHERE slug LIKE 'a2-%';
DELETE FROM flashcards_v2 WHERE slug LIKE 'fc-a2-%';

-- ══════════════════════════════════════════════════
-- BLOCO 2 — study_modules A2 (19 capítulos + exam)
-- ══════════════════════════════════════════════════
INSERT INTO study_modules (slug, level, chapter_number, title_pt, title_de, focus, sort_order, active)
VALUES
('a2-cap21','A2',21,'Ontem foi… – Falar sobre o passado','Gestern war… – Über die Vergangenheit sprechen',
 'Uso do Perfekt com haben para relatar ações concluídas no cotidiano.', 210, true),
('a2-cap22','A2',22,'Minha Viagem – Relatar deslocamentos','Meine Reise – Unterwegs berichten',
 'Perfekt com sein, verbos de movimento e mudança de estado.', 220, true),
('a2-cap23','A2',23,'Saúde – No médico','Gesundheit – Beim Arzt sprechen',
 'Descrever sintomas, verbos modais (können/müssen/sollen) e recomendações.', 230, true),
('a2-cap24','A2',24,'Moradia – Descrever ambientes','Wohnen – Zuhause und Umgebung beschreiben',
 'Dativo prático com preposições de localização e posse indireta.', 240, true),
('a2-cap25','A2',25,'Aparência – Descrever pessoas','Aussehen – Personen beschreiben',
 'Adjektive Deklination (Nominativ/Akkusativ) e traços físicos/personalidade.', 250, true),
('a2-cap26','A2',26,'Mídias – Tecnologia no dia a dia','Medien – Alltag mit Technologie',
 'Pronomes reflexivos, verbos com sich e interações digitais.', 260, true),
('a2-cap27','A2',27,'No Restaurante – Pedir e reagir','Im Restaurant – Bestellen und reagieren',
 'Konjunktiv II (hätte gern), cortesia e vocabulário gastronômico.', 270, true),
('a2-cap28','A2',28,'Biografias – Contar histórias','Biografien – Lebensgeschichten erzählen',
 'Präteritum de sein/haben e verbos regulares para narrativas.', 280, true),
('a2-cap29','A2',29,'Presentes – Dar e receber','Geschenke – Geben und bekommen',
 'Verbos com dois objetos (Dativ + Akkusativ) e ordem de pronomes.', 290, true),
('a2-cap30','A2',30,'Correios & Banco – Situações formais','Post und Bank – Formelle Situationen meistern',
 'Linguagem funcional, imperativo formal e verbos de serviço.', 300, true),
('a2-cap31','A2',31,'Dativo no Cotidiano – Relações sociais','Dativ im Alltag – Beziehungen ausdrücken',
 'Verbos regentes de dativo, preposições fixas e posse corporal.', 310, true),
('a2-cap32','A2',32,'Posse – Genitivo e von + dativo','Besitz und Beziehungen – Genitiv verstehen',
 'Contraste entre von + dativo (oral) e genitivo (formal/escrito).', 320, true),
('a2-cap33','A2',33,'Justificativas – dass e weil','Gründe und Aussagen – Sätze mit dass und weil',
 'Orações subordinadas, posição verbal final e conectivos causais.', 330, true),
('a2-cap34','A2',34,'Condições e Dúvidas – wenn e ob','Bedingungen und Fragen – wenn und ob im Alltag',
 'Diferença entre condicional/temporal (wenn) e dúvida indireta (ob).', 340, true),
('a2-cap35','A2',35,'Passado Aprofundado – Präteritum','Vergangenheit vertiefen – Präteritum im Alltag',
 'Präteritum de verbos irregulares frequentes e conectivos narrativos.', 350, true),
('a2-cap36','A2',36,'Generalizações – O pronome man','Allgemeine Aussagen – Das Pronomen man',
 'Afirmações impessoais, regras, conselhos e hábitos coletivos.', 360, true),
('a2-cap37','A2',37,'Sintomas – Descrever dor e duração','Beim Arzt – Symptome und Probleme beschreiben',
 'Intensidade (leicht/stark), frequência e estruturas de descrição clínica.', 370, true),
('a2-cap38','A2',38,'Futuro – Planejar e projetar','Zukunft planen – Über Pläne sprechen',
 'Präsens + marcadores de tempo vs. Futur I (werden + Infinitiv).', 380, true),
('a2-cap39','A2',39,'Trabalho & Estudo – Organizar rotina','Arbeit und Studium – Alltag organisieren',
 'Frequência, conectivos de finalidade (damit/so) e modais no trabalho.', 390, true),
('a2-exam','A2',99,'Prova Final A2','A2 Abschlussprüfung',
 'Avaliação integrada: Hören, Lesen, Schreiben, Sprechen, Grammatik A2.', 999, true)
ON CONFLICT (slug) DO UPDATE SET
title_pt = EXCLUDED.title_pt, 
title_de = EXCLUDED.title_de,
focus = EXCLUDED.focus, 
sort_order = EXCLUDED.sort_order,
active = true, 
updated_at = now();

INSERT INTO study_lessons
(module_slug, slug, level, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, sort_order, active)
VALUES

-- ══════════════════════════════════════════════════
-- CAPÍTULO 21: Gestern war… – Über die Vergangenheit sprechen
-- ══════════════════════════════════════════════════
('a2-cap21','a2-l21-1','A2','Diálogo: Lukas e Sarah falam sobre o fim de semana','Dialog: Über das Wochenende sprechen',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Lukas: Hey Sarah, lange nicht gesehen! Wie war dein Wochenende?  
Sarah: Hi Lukas! Es war wirklich schön, aber sehr voll. Am Samstag habe ich den ganzen Vormittag geputzt und dann mit meiner Schwester Mittag gekocht.  
Lukas: Oh, ihr habt also selbst gegessen? Was habt ihr gekocht?  
Sarah: Wir haben eine Pasta mit Tomatensauce gemacht. Es war super einfach und hat allen geschmeckt. Und du? Was hast du am Samstag gemacht?  
Lukas: Ich habe erst lange geschlafen, dann bin ich ins Fitnessstudio gegangen. Danach habe ich ein Buch gelesen und am Abend habe ich mit Freunden telefoniert.  
Sarah: Klingt nach einem entspannten Tag. Hast du auch etwas gegessen?  
Lukas: Ja, ich habe mir eine Pizza bestellt. Ich habe sie online bestellt und sie war innerhalb von 30 Minuten da.  
Sarah: Das ist praktisch! Am Sonntag habe ich dann meine Oma besucht. Wir haben lange gesprochen und sie hat mir alte Fotos gezeigt.  
Lukas: Das war sicher schön. Hast du am Sonntag noch etwas anderes gemacht?  
Sarah: Ja, ich habe noch eine E-Mail an meine Chefin geschrieben und habe den Kühlschrank ausgeräumt. Und jetzt muss ich wieder arbeiten. Wie war deine Woche bisher?  
Lukas: Gestern habe ich einen wichtigen Termin gehabt. Ich habe viel gearbeitet und habe am Abend nur noch ferngesehen. Heute habe ich dann endlich Zeit für eine Pause.  
Sarah: Verdient! Komm, wir bestellen einen Kaffee und du erzählst mir mehr.

---

**TRADUÇÃO EM PORTUGUÊS:**  
Lukas: Oi Sarah, quanto tempo! Como foi seu fim de semana?  
Sarah: Oi Lukas! Foi realmente legal, mas muito cheio. No sábado, passei a manhã toda limpando e depois cozinhei o almoço com minha irmã.  
Lukas: Ah, então vocês comeram comida caseira? O que vocês prepararam?  
Sarah: Fizemos um macarrão com molho de tomate. Foi super fácil e agradou a todos. E você? O que fez no sábado?  
Lukas: Primeiro dormi até tarde, depois fui à academia. Depois li um livro e, à noite, conversei por telefone com amigos.  
Sarah: Parece um dia bem relaxante. Você também comeu algo?  
Lukas: Sim, pedi uma pizza. Encomendei online e ela chegou em menos de 30 minutos.  
Sarah: Isso é prático! No domingo, visitei minha avó. Conversamos por bastante tempo e ela me mostrou fotos antigas.  
Lukas: Deve ter sido muito bom. Você fez mais alguma coisa no domingo?  
Sarah: Sim, ainda escrevi um e-mail para minha chefe e arrumei a geladeira. E agora preciso voltar ao trabalho. Como está sendo sua semana?  
Lukas: Ontem tive um compromisso importante. Trabalhei muito e, à noite, só assisti TV. Hoje finalmente tenho tempo para uma pausa.  
Sarah: Merecido! Vamos pedir um café e você me conta mais.',
'Perfekt com haben: Sujeito + haben (presente) + ... + Partizip II no final. Regulares: ge- + raiz + -t.',
'[{ "de": "Ich habe den ganzen Vormittag geputzt.", "pt": "Passei a manhã toda limpando.", "note": "putzen → geputzt" },
{ "de": "Wir haben eine Pasta gemacht.", "pt": "Fizemos um macarrão.", "note": "machen → gemacht" },
{ "de": "Ich habe ein Buch gelesen.", "pt": "Li um livro.", "note": "lesen → gelesen (irregular)" },
{ "de": "Ich habe mit Freunden telefoniert.", "pt": "Conversei com amigos por telefone.", "note": "telefonieren → telefoniert (sem ge-)" },
{ "de": "Ich habe mir eine Pizza bestellt.", "pt": "Pedí uma pizza.", "note": "bestellen → bestellt" },
{ "de": "Ich habe den Kühlschrank ausgeräumt.", "pt": "Arrumei a geladeira.", "note": "ausräumen → aufgeräumt (separável)" }]'::jsonb,
'[{ "de": "das Wochenende", "pt": "o fim de semana" },
{ "de": "der Vormittag", "pt": "a manhã (até ~12h)" },
{ "de": "putzen", "pt": "limpar" },
{ "de": "kochen", "pt": "cozinhar" },
{ "de": "die Pasta", "pt": "o macarrão" },
{ "de": "die Tomatensauce", "pt": "o molho de tomate" },
{ "de": "schmecken", "pt": "ter gosto, agradar" },
{ "de": "einfach", "pt": "simples, fácil" },
{ "de": "schlafen", "pt": "dormir" },
{ "de": "das Fitnessstudio", "pt": "a academia" },
{ "de": "das Buch", "pt": "o livro" },
{ "de": "lesen", "pt": "ler" },
{ "de": "telefonieren", "pt": "telefonar" },
{ "de": "entspannt", "pt": "relaxado" },
{ "de": "bestellen", "pt": "pedir, encomendar" },
{ "de": "online", "pt": "online" },
{ "de": "innerhalb von", "pt": "dentro de, em menos de" },
{ "de": "die Minute", "pt": "o minuto" },
{ "de": "besuchen", "pt": "visitar" },
{ "de": "die Oma", "pt": "a avó (informal)" },
{ "de": "sprechen", "pt": "falar" },
{ "de": "das Foto", "pt": "a foto" },
{ "de": "zeigen", "pt": "mostrar" },
{ "de": "die E-Mail", "pt": "o e-mail" },
{ "de": "schreiben", "pt": "escrever" },
{ "de": "der Kühlschrank", "pt": "a geladeira" },
{ "de": "ausräumen", "pt": "esvaziar, organizar" },
{ "de": "der Termin", "pt": "o compromisso" },
{ "de": "wichtig", "pt": "importante" },
{ "de": "arbeiten", "pt": "trabalhar" },
{ "de": "fernsehen", "pt": "assistir TV" },
{ "de": "die Pause", "pt": "a pausa" },
{ "de": "verdient", "pt": "merecido" },
{ "de": "erzählen", "pt": "contar, narrar" }]'::jsonb,
'[ "Perfekt com HABEN: usado com verbos transitivos, intransitivos sem movimento, reflexivos.",
"Formação do Partizip II:",
"• Regulares: ge- + raiz + -t → machen → gemacht",
"• Irregulares: ge- + raiz(muda) + -en → lesen → gelesen",
"• Separáveis: prefixo + ge- + raiz + -t/-en → ausräumen → aufgeräumt",
"• Inseparáveis (be-, ent-, ver-): sem ge- → besuchen → besucht",
"• Verbos em -ieren: sem ge- → telefonieren → telefoniert",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap21','a2-l21-2','A2','Perfekt com „haben" – Estrutura e Partizip II','Perfekt mit „haben" – Struktur und Partizip II',
'Perfekt é o tempo verbal mais usado na fala para ações concluídas. Estrutura: haben (conjugado) + Partizip II no final da frase.',
'Sujeito + haben (presente) + ... + Partizip II (final). Só masculino muda no acusativo dentro da frase.',
'[{ "de": "Ich habe gestern einen Kaffee getrunken.", "pt": "Bebi um café ontem.", "note": "trinken → getrunken" },
{ "de": "Sie hat am Wochenende ihre Oma besucht.", "pt": "Ela visitou a avó no fim de semana.", "note": "besuchen → besucht" },
{ "de": "Wir haben den ganzen Tag gearbeitet.", "pt": "Trabalhamos o dia todo.", "note": "arbeiten → gearbeitet" },
{ "de": "Hast du die E-Mail schon geschrieben?", "pt": "Você já escreveu o e-mail?", "note": "schreiben → geschrieben" }]'::jsonb,
'[]'::jsonb,
'[ "CONJUGAÇÃO DE HABEN NO PRÄSENS:",
"ich habe | du hast | er/sie/es hat | wir haben | ihr habt | sie/Sie haben",
"",
"FORMAÇÃO DO PARTIZIP II:",
"1. Regulares (schwache): ge- + raiz + -t",
"   machen → gemacht, spielen → gespielt, kaufen → gekauft",
"",
"2. Irregulares (starke): ge- + raiz(muda) + -en",
"   lesen → gelesen, schreiben → geschrieben, sehen → gesehen",
"",
"3. Separáveis (trennbare): prefixo + ge- + raiz + -t/-en",
"   aufräumen → aufgeräumt, fernsehen → ferngesehen",
"",
"4. Inseparáveis (untrennbare): raiz + -t/-en (sem ge-)",
"   besuchen → besucht, erzählen → erzählt, verstehen → verstanden",
"",
"5. Verbos em -ieren: raiz + -t (sem ge-)",
"   telefonieren → telefoniert, studieren → studiert",
"",
"POSIÇÃO NA FRASE:",
"• Oração principal: haben na posição 2, Partizip II no FINAL.",
"  Sie hat am Wochenende ihre Oma besucht.",
"• Com verbo modal: ambos no final, haben por último.",
"  ..., weil sie den ganzen Tag gearbeitet hat." ]'::jsonb,
2,true),

('a2-cap21','a2-l21-3','A2','Cultura: Passado no Cotidiano Alemão','Kultur: Vergangenheit im Alltag',
'Falar do fim de semana é ritual social na Alemanha. Perfekt soa mais natural na fala que Präteritum. Precisão vs. informalidade nas contrações.',
'„Wie war dein Wochenende?" é quebra-gelo. Contrações como „Ich hab'" são aceitáveis na fala.',
'[{ "de": "Wie war dein Wochenende?", "pt": "Como foi seu fim de semana?", "note": "pergunta social" },
{ "de": "Ich hab' das gesehen.", "pt": "Eu vi isso (contração informal).", "note": "fala coloquial" },
{ "de": "Es war okay.", "pt": "Foi ok (resposta objetiva).", "note": "cultura alemã" }]'::jsonb,
'[]'::jsonb,
'[ "Passado no Cotidiano Alemão:",
"",
"• „Wie war dein Wochenende?": Pergunta ritual na segunda-feira.",
"  Respostas objetivas são valorizadas: „Ganz gut", „War voll".",
"",
"• Perfekt vs. Präteritum:",
"  Perfekt = fala cotidiana. Präteritum = textos escritos, narrativas.",
"  Exceção: sein/haben usam Präteritum mesmo na fala (ich war, ich hatte).",
"",
"• Precisão vs. Informalidade:",
"  Na fala: „Ich hab'" em vez de „Ich habe" é comum e autêntico.",
"  Em textos formais: manter a forma completa.",
"",
"• Cultura de objetividade:",
"  Evite exageros: „Es war okay" ou „Ganz schön anstrengend, aber gut",
"  soa mais natural que „Es war das Beste meines Lebens!".",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 22: Meine Reise – Unterwegs berichten
-- ══════════════════════════════════════════════════
('a2-cap22','a2-l22-1','A2','Diálogo: Anna e Tom falam sobre viagem a Munique','Dialog: Über eine Reise nach München',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Anna: Hey Tom! Wo warst du letzte Woche? Ich habe dich nicht gesehen.  
Tom: Hi Anna! Ich war im Urlaub. Ich bin nach München gefahren.  
Anna: Wow, das klingt toll! Wie bist du dorthin gekommen?  
Tom: Ich bin mit dem Zug gefahren. Die Fahrt hat etwa sechs Stunden gedauert.  
Anna: Und was hast du in München gemacht?  
Tom: Am ersten Tag bin ich in der Altstadt spazieren gegangen. Ich habe den Marienplatz besucht und bin auf den Glockenturm gestiegen.  
Anna: Das war sicher anstrengend! Hast du auch etwas gegessen?  
Tom: Natürlich! Ich habe eine bayerische Weißwurst probiert. Sie hat mir sehr gut geschmeckt. Am zweiten Tag bin ich mit dem Fahrrad an den See gefahren.  
Anna: An welchen See?  
Tom: An den Starnberger See. Das Wasser war kalt, aber ich bin trotzdem geschwommen. Danach bin ich zurück ins Hotel gefahren und habe mich ausgeruht.  
Anna: Klingt nach einem perfekten Tag! Bist du allein gereist?  
Tom: Nein, ich bin mit meiner Schwester gefahren. Wir sind zusammen losgefahren und haben viel gelacht. Am letzten Tag sind wir früh aufgestanden und zum Flughafen gegangen.  
Anna: Bist du dann mit dem Flugzeug zurückgeflogen?  
Tom: Nein, ich bin wieder mit dem Zug zurückgefahren. Ich finde Zugfahren entspannter. Und du? Was hast du letzte Woche gemacht?  
Anna: Ich bin zu Hause geblieben. Ich habe gelesen, gekocht und bin im Park spazieren gegangen. Manchmal ist es auch schön, nicht zu reisen.  
Tom: Das stimmt. Nächstes Mal fahre ich vielleicht an die Nordsee. Möchtest du mitkommen?  
Anna: Gerne! Ich habe noch nie die Nordsee gesehen. Das wäre eine tolle Erfahrung!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Anna: Oi Tom! Onde você estava na semana passada? Não te vi.  
Tom: Oi Anna! Estive de férias. Fui a Munique.  
Anna: Uau, isso parece incrível! Como você chegou lá?  
Tom: Fui de trem. A viagem durou cerca de seis horas.  
Anna: E o que você fez em Munique?  
Tom: No primeiro dia, caminhei pelo centro histórico. Visitei a Marienplatz e subi na torre do relógio.  
Anna: Deve ter sido cansativo! Você comeu algo?  
Tom: Claro! Experimentei uma Weißwurst bávara. Gostei muito. No segundo dia, fui de bicicleta até o lago.  
Anna: Que lago?  
Tom: Ao lago Starnberger See. A água estava fria, mas mesmo assim nadei. Depois, voltei de bicicleta para o hotel e descansei.  
Anna: Parece um dia perfeito! Você viajou sozinho?  
Tom: Não, fui com minha irmã. Saímos juntos e rimos muito. No último dia, acordamos cedo e fomos ao aeroporto.  
Anna: Então você voltou de avião?  
Tom: Não, voltei de trem novamente. Acho viajar de trem mais relaxante. E você? O que fez na semana passada?  
Anna: Fiquei em casa. Li, cozinhei e caminhei no parque. Às vezes também é bom não viajar.  
Tom: É verdade. Da próxima vez, talvez eu vá ao Mar do Norte. Você quer vir comigo?  
Anna: Com prazer! Nunca vi o Mar do Norte. Seria uma experiência incrível!',
'Perfekt com SEIN: verbos de movimento (de A→B) e mudança de estado. Estrutura: sein (presente) + Partizip II no final.',
'[{ "de": "Ich bin nach München gefahren.", "pt": "Fui a Munique.", "note": "fahren → gefahren + sein" },
{ "de": "Ich bin in der Altstadt spazieren gegangen.", "pt": "Caminhei pelo centro histórico.", "note": "spazieren gehen → spazieren gegangen" },
{ "de": "Ich bin auf den Glockenturm gestiegen.", "pt": "Subi na torre do relógio.", "note": "steigen → gestiegen" },
{ "de": "Ich bin trotzdem geschwommen.", "pt": "Nadei mesmo assim.", "note": "schwimmen → geschwommen" },
{ "de": "Ich bin zu Hause geblieben.", "pt": "Fiquei em casa.", "note": "bleiben → geblieben + sein" }]'::jsonb,
'[{ "de": "die Reise", "pt": "a viagem" },
{ "de": "der Urlaub", "pt": "as férias" },
{ "de": "fahren", "pt": "ir, dirigir, viajar" },
{ "de": "der Zug", "pt": "o trem" },
{ "de": "die Fahrt", "pt": "a viagem, o trajeto" },
{ "de": "dauern", "pt": "durar" },
{ "de": "die Altstadt", "pt": "o centro histórico" },
{ "de": "spazieren gehen", "pt": "caminhar, passear" },
{ "de": "der Marienplatz", "pt": "a praça central de Munique" },
{ "de": "steigen", "pt": "subir, escalar" },
{ "de": "der Glockenturm", "pt": "a torre do relógio" },
{ "de": "probieren", "pt": "experimentar, provar" },
{ "de": "bayerisch", "pt": "bávaro, da Baviera" },
{ "de": "der See", "pt": "o lago" },
{ "de": "schwimmen", "pt": "nadar" },
{ "de": "trotzdem", "pt": "mesmo assim, apesar disso" },
{ "de": "sich ausruhen", "pt": "descansar" },
{ "de": "allein", "pt": "sozinho" },
{ "de": "losfahren", "pt": "partir, sair (de veículo)" },
{ "de": "lachen", "pt": "rir" },
{ "de": "aufstehen", "pt": "levantar-se" },
{ "de": "der Flughafen", "pt": "o aeroporto" },
{ "de": "das Flugzeug", "pt": "o avião" },
{ "de": "zurückfahren", "pt": "voltar, retornar" },
{ "de": "entspannter", "pt": "mais relaxante" },
{ "de": "zu Hause bleiben", "pt": "ficar em casa" },
{ "de": "der Park", "pt": "o parque" },
{ "de": "die Nordsee", "pt": "o Mar do Norte" },
{ "de": "mitkommen", "pt": "vir junto, acompanhar" },
{ "de": "die Erfahrung", "pt": "a experiência" }]'::jsonb,
'[ "Perfekt com SEIN: usado com verbos de movimento direcional e mudança de estado.",
"Verbos de movimento (A→B): gehen→gegangen, fahren→gefahren, fliegen→geflogen",
"Mudança de estado: aufwachen→aufgewacht, einschlafen→eingeschlafen, werden→geworden",
"Verbos específicos: bleiben→geblieben, passieren→passiert",
"ATENÇÃO: Alguns verbos usam haben ou sein conforme contexto!",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap22','a2-l22-2','A2','Perfekt com „sein" – Verbos de Movimento e Mudança','Perfekt mit „sein" – Bewegungs- und Zustandsverben',
'Cerca de 20% dos verbos formam Perfekt com sein. Geralmente indicam movimento de A para B ou mudança de estado/condição.',
'Sein no presente + Partizip II no final. Foco em: gehen, fahren, fliegen, kommen, bleiben, werden.',
'[{ "de": "Ich bin gestern mit dem Fahrrad zur Arbeit gefahren.", "pt": "Fui de bicicleta ao trabalho ontem.", "note": "fahren + sein" },
{ "de": "Sie sind früh aufgestanden und haben gefrühstückt.", "pt": "Eles levantaram cedo e tomaram café.", "note": "aufstehen + sein" },
{ "de": "Wir sind im Park spazieren gegangen.", "pt": "Caminhamos no parque.", "note": "spazieren gehen + sein" },
{ "de": "Das Kind ist schnell eingeschlafen.", "pt": "A criança adormeceu rápido.", "note": "einschlafen + sein" }]'::jsonb,
'[]'::jsonb,
'[ "QUANDO USAR SEIN NO PERFEKT:",
"✅ Movimento direcional (de A para B):",
"   gehen→gegangen, fahren→gefahren, fliegen→geflogen,",
"   kommen→gekommen, laufen→gelaufen, reisen→gereist",
"",
"✅ Mudança de estado ou condição:",
"   aufwachen→aufgewacht, einschlafen→eingeschlafen,",
"   sterben→gestorben, werden→geworden, wachsen→gewachsen",
"",
"✅ Verbos específicos de permanência/evento:",
"   bleiben→geblieben, passieren→passiert, geschehen→geschehen",
"",
"CONJUGAÇÃO DE SEIN NO PRÄSENS:",
"ich bin | du bist | er/sie/es ist | wir sind | ihr seid | sie/Sie sind",
"",
"DIFERENÇA CRUCIAL: haben vs. sein",
"• Ação sem deslocamento → haben: Ich habe ein Buch gelesen.",
"• Movimento de A→B → sein: Ich bin zur Bibliothek gegangen.",
"• Mudança de estado → sein: Das Eis ist geschmolzen.",
"",
"ATENÇÃO: Alguns verbos mudam de auxiliar conforme contexto!",
"• Ich habe den ganzen Tag gefahren. (foco na ação)",
"• Ich bin nach Hamburg gefahren. (foco no deslocamento)" ]'::jsonb,
2,true),

('a2-cap22','a2-l22-3','A2','Cultura: Viagens & Transporte na Alemanha','Kultur: Reisen & Verkehr',
'Trem é cultura: rede eficiente, Deutschlandticket (€49). Wanderlust enraizado. Pontualidade levada a sério. Relatos detalhistas.',
'Deutsche Bahn, Deutschlandticket, Wanderlust, Fahrgastrechte, detalhes em relatos de viagem.',
'[{ "de": "die Deutsche Bahn", "pt": "a rede ferroviária", "note": "transporte" },
{ "de": "das Deutschlandticket", "pt": "passe regional mensal (€49)", "note": "ticket" },
{ "de": "die Wanderlust", "pt": "desejo de caminhar/explorar", "note": "cultura" }]'::jsonb,
'[]'::jsonb,
'[ "Viagens & Transporte na Alemanha:",
"",
"• Deutsche Bahn (DB):",
"  Principal operadora de trens. ICE = trem rápido.",
"  Atrasos são infelizmente comuns, mas o sistema é extenso.",
"",
"• Deutschlandticket (49€):",
"  Passe mensal para transporte regional ilimitado.",
"  Substituiu o antigo 9-Euro-Ticket de 2022.",
"",
"• Wanderlust:",
"  Conceito profundamente enraizado. Caminhadas (Wandern)",
"  são atividade nacional. Crianças aprendem mapas e bússolas.",
"",
"• Pontualidade em viagens:",
"  Atraso >20min = direito a compensação (Fahrgastrechte).",
"  Chegar „5 minutos antes" é chegar na hora.",
"",
"• Relatos detalhistas:",
"  Alemães costumam ser específicos sobre horários,",
"  meios de transporte e custos. Perguntar „Wie war die Fahrt?"",
"  demonstra interesse genuíno.",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 23: Gesundheit – Beim Arzt sprechen
-- ══════════════════════════════════════════════════
('a2-cap23','a2-l23-1','A2','Diálogo: Lisa consulta médica','Dialog: Beim Arzt',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Patientin (Lisa): Guten Tag, Herr Doktor.  
Arzt: Guten Tag, Frau Meyer. Was kann ich für Sie tun?  
Lisa: Ich fühle mich seit drei Tagen nicht gut. Ich habe Kopfschmerzen und bin sehr müde.  
Arzt: Haben Sie auch Fieber?  
Lisa: Ja, gestern Abend hatte ich 38,5 Grad. Und ich muss ständig husten.  
Arzt: Verstehe. Können Sie bitte einmal tief einatmen?  
Lisa: (atmet tief ein) Ja, das tut ein bisschen weh hier.  
Arzt: Okay. Sie sollen viel Wasser trinken und sich ausruhen. Ich verschreibe Ihnen ein Medikament gegen den Husten.  
Lisa: Muss ich das Medikament regelmäßig nehmen?  
Arzt: Ja, dreimal täglich nach dem Essen. Und Sie dürfen keinen Alkohol trinken, während Sie die Tabletten nehmen.  
Lisa: Verstanden. Kann ich morgen wieder arbeiten gehen?  
Arzt: Das hängt davon ab. Wenn das Fieber weg ist, können Sie leichte Arbeit machen. Aber Sie sollten sich noch zwei Tage schonen.  
Lisa: Also muss ich zu Hause bleiben?  
Arzt: Ja, am besten. Ich schreibe Sie krank. Hier ist Ihre Bescheinigung für die Arbeit.  
Lisa: Vielen Dank, Herr Doktor. Was soll ich tun, wenn es nicht besser wird?  
Arzt: Dann müssen Sie sofort wiederkommen. Oder Sie können auch den ärztlichen Bereitschaftsdienst anrufen: 116117.  
Lisa: Gut zu wissen. Danke für Ihre Hilfe!  
Arzt: Gerne. Gute Besserung!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Paciente (Lisa): Bom dia, Doutor.  
Médico: Bom dia, Sra. Meyer. Em que posso ajudá-la?  
Lisa: Não me sinto bem há três dias. Estou com dor de cabeça e muito cansada.  
Médico: Você também está com febre?  
Lisa: Sim, ontem à noite estava com 38,5 graus. E preciso tossir constantemente.  
Médico: Entendo. Pode respirar fundo, por favor?  
Lisa: (respira fundo) Sim, dói um pouco aqui.  
Médico: Certo. A senhora deve beber bastante água e descansar. Vou receitar um medicamento para a tosse.  
Lisa: Preciso tomar o remédio regularmente?  
Médico: Sim, três vezes ao dia após as refeições. E não pode beber álcool enquanto estiver tomando os comprimidos.  
Lisa: Entendido. Posso voltar a trabalhar amanhã?  
Médico: Depende. Se a febre passar, você pode fazer atividades leves. Mas deveria se poupar por mais dois dias.  
Lisa: Então preciso ficar em casa?  
Médico: Sim, é o ideal. Vou atestar sua ausência. Aqui está o atestado para o trabalho.  
Lisa: Muito obrigada, Doutor. O que devo fazer se não melhorar?  
Médico: Então deve voltar imediatamente. Ou pode ligar para o serviço médico de plantão: 116117.  
Lisa: Bom saber. Obrigada pela ajuda!  
Médico: Por nada. Melhoras!',
'Modalverben no contexto médico: können (possibilidade), müssen (obrigação), sollen (conselho). Estrutura: modal + infinitivo no final.',
'[{ "de": "Können Sie bitte tief einatmen?", "pt": "Pode respirar fundo, por favor?", "note": "können = possibilidade" },
{ "de": "Sie sollen viel Wasser trinken.", "pt": "A senhora deve beber muita água.", "note": "sollen = conselho médico" },
{ "de": "Sie dürfen keinen Alkohol trinken.", "pt": "Não pode beber álcool.", "note": "dürfen = permissão/proibição" },
{ "de": "Sie müssen sofort wiederkommen.", "pt": "Deve voltar imediatamente.", "note": "müssen = obrigação forte" },
{ "de": "Kann ich morgen arbeiten gehen?", "pt": "Posso voltar a trabalhar amanhã?", "note": "können = pergunta educada" }]'::jsonb,
'[{ "de": "die Gesundheit", "pt": "a saúde" },
{ "de": "der Arzt / die Ärztin", "pt": "o médico / a médica" },
{ "de": "der Patient / die Patientin", "pt": "o paciente / a paciente" },
{ "de": "sich fühlen", "pt": "sentir-se" },
{ "de": "der Kopfschmerz", "pt": "a dor de cabeça" },
{ "de": "müde", "pt": "cansado" },
{ "de": "das Fieber", "pt": "a febre" },
{ "de": "husten", "pt": "tossir" },
{ "de": "tief einatmen", "pt": "respirar fundo" },
{ "de": "wehtun", "pt": "doer" },
{ "de": "verschreiben", "pt": "receitar, prescrever" },
{ "de": "das Medikament", "pt": "o medicamento" },
{ "de": "regelmäßig", "pt": "regularmente" },
{ "de": "täglich", "pt": "diariamente" },
{ "de": "die Tablette", "pt": "o comprimido" },
{ "de": "der Alkohol", "pt": "o álcool" },
{ "de": "schonen", "pt": "poupar-se, cuidar-se" },
{ "de": "krank", "pt": "doente" },
{ "de": "die Bescheinigung", "pt": "o atestado, certificado" },
{ "de": "sofort", "pt": "imediatamente" },
{ "de": "der Bereitschaftsdienst", "pt": "o plantão médico" },
{ "de": "die Nummer", "pt": "o número" },
{ "de": "besser werden", "pt": "melhorar" },
{ "de": "die Hilfe", "pt": "a ajuda" },
{ "de": "die Besserung", "pt": "a melhora" },
{ "de": "der Termin", "pt": "a consulta" },
{ "de": "die Praxis", "pt": "o consultório" },
{ "de": "untersuchen", "pt": "examinar" },
{ "de": "die Diagnose", "pt": "o diagnóstico" },
{ "de": "die Behandlung", "pt": "o tratamento" }]'::jsonb,
'[ "Modalverben essenciais:",
"• können = poder/conseguir (habilidade/possibilidade)",
"• müssen = precisar/ter que (obrigação forte)",
"• sollen = dever (conselho, recomendação médica)",
"• dürfen = poder (permissão) / nicht dürfen = proibição",
"",
"Conjugação no Präsens (1ª/3ª pessoa igual):",
"können: ich kann / du kannst / er kann",
"müssen: ich muss / du musst / er muss",
"sollen: ich soll / du sollst / er soll",
"",
"Estrutura: Sujeito + modal(conjugado) + ... + infinitivo(final)",
"Ex: Sie müssen das Medikament nehmen.",
"",
"Dica médica: sollen é mais educado que müssen em consultas.",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap23','a2-l23-2','A2','Modalverben: können, müssen, sollen','Modalverben im medizinischen Kontext',
'Modais expressam atitude: können (possibilidade), müssen (obrigação), sollen (conselho). Conjugação irregular na 1ª/3ª pessoa.',
'ich/er: kann/muss/soll. Estrutura: modal na posição 2, infinitivo do verbo principal no FINAL.',
'[{ "de": "Ich kann schwimmen.", "pt": "Sei nadar.", "note": "können = habilidade" },
{ "de": "Sie müssen das Medikament nehmen.", "pt": "Precisa tomar o remédio.", "note": "müssen = obrigação médica" },
{ "de": "Du sollst viel Wasser trinken.", "pt": "Deve beber muita água.", "note": "sollen = conselho" },
{ "de": "Kann ich morgen kommen?", "pt": "Posso vir amanhã?", "note": "können = pergunta educada" }]'::jsonb,
'[]'::jsonb,
'[ "CONJUGAÇÃO NO PRÄSENS:",
"können: ich kann | du kannst | er kann | wir können | ihr könnt | sie können",
"müssen: ich muss | du musst | er muss | wir müssen | ihr müsst | sie müssen",
"sollen: ich soll | du sollst | er soll | wir sollen | ihr sollt | sie sollen",
"",
"SIGNIFICADO E USO PRÁTICO:",
"✅ können = poder, conseguir, ter capacidade",
"   • Habilidade: Ich kann Deutsch sprechen.",
"   • Possibilidade: Kann ich morgen kommen?",
"   • Permissão: Du kannst jetzt gehen.",
"",
"✅ müssen = precisar, ter obrigação (forte)",
"   • Obrigação externa: Ich muss zur Arbeit gehen.",
"   • Necessidade médica: Sie müssen das Medikament nehmen.",
"   • Conclusão lógica: Er muss krank sein.",
"",
"✅ sollen = dever (conselho, recomendação, ordem indireta)",
"   • Conselho médico: Du sollst viel Wasser trinken.",
"   • Ordem de terceiros: Meine Mutter sagt, ich soll früher schlafen.",
"   • Pergunta sobre obrigação: Soll ich das Formular ausfüllen?",
"",
"COMPARAÇÃO RÁPIDA:",
"können = possibilidade | müssen = obrigação forte | sollen = conselho",
"",
"DICA A2: Em contextos médicos, sollen é mais educado que müssen.",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
2,true),

('a2-cap23','a2-l23-3','A2','Cultura: Saúde & Sistema Médico Alemão','Kultur: Gesundheit & Medizin',
'Sistema universal baseado em seguro obrigatório. Krankschreibung (atestado) digital. Apotheke especializada. Número 116117 para plantão.',
'Krankenkasse, eAU, Apotheke vs. Drogerie, 116117, Vorsorge.',
'[{ "de": "die Krankenkasse", "pt": "plano de saúde obrigatório", "note": "sistema" },
{ "de": "die Krankschreibung", "pt": "atestado médico", "note": "trabalho" },
{ "de": "die Apotheke", "pt": "farmácia (medicamentos)", "note": "saúde" }]'::jsonb,
'[]'::jsonb,
'[ "Saúde & Sistema Médico na Alemanha:",
"",
"• Krankenkasse:",
"  Seguro saúde universal baseado em contribuições.",
"  90% têm seguro público (gesetzlich), 10% privado.",
"  Leve sempre a Gesundheitskarte ao médico.",
"",
"• Krankschreibung (atestado):",
"  A partir do 3º dia de doença, atestado é obrigatório.",
"  Desde 2021: eAU (envio digital ao empregador).",
"",
"• Apotheke vs. Drogerie:",
"  Apotheke: medicamentos de prescrição, farmacêutico.",
"  Drogerie (dm, Rossmann): cosméticos, higiene, chás.",
"",
"• Números de emergência:",
"  112 = emergência real (bombeiros/ambulância).",
"  116117 = plantão médico não emergencial.",
"",
"• Cultura de prevenção:",
"  Check-ups anuais (Vorsorgeuntersuchung) incentivados.",
"  Mentalidade: „Vorbeugen ist besser als heilen".",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 24: Wohnen – Zuhause und Umgebung beschreiben
-- ══════════════════════════════════════════════════
('a2-cap24','a2-l24-1','A2','Diálogo: Julia descreve seu novo apartamento','Dialog: Neue Wohnung beschreiben',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Markus: Hallo Julia! Wie gefällt dir deine neue Wohnung?  
Julia: Hi Markus! Danke, sehr gut! Die Wohnung ist hell und liegt in einer ruhigen Straße.  
Markus: Wie viele Zimmer hat sie?  
Julia: Sie hat drei Zimmer: ein Wohnzimmer, ein Schlafzimmer und ein Arbeitszimmer. Und natürlich eine Küche und ein Bad.  
Markus: Klingt gemütlich! Wie ist die Einrichtung?  
Julia: Im Wohnzimmer steht ein großes Sofa vor dem Fenster. Daneben gibt es einen kleinen Tisch und eine Lampe. An der Wand hängt ein Bild von meiner Oma.  
Markus: Und in der Küche?  
Julia: In der Küche stehen ein Kühlschrank, ein Herd und ein Esstisch mit vier Stühlen. Der Kühlschrank steht links neben der Spüle.  
Markus: Praktisch! Wo wohnst du genau?  
Julia: Ich wohne in der Gartenstraße 15, im dritten Stock. Die U-Bahn-Station ist nur fünf Minuten zu Fuß entfernt.  
Markus: Gibt es einen Supermarkt in der Nähe?  
Julia: Ja, gegenüber von meinem Haus gibt es einen Bio-Supermarkt. Und hinter dem Haus ist ein kleiner Park.  
Markus: Das ist perfekt! Kommst du mit der Nachbarschaft klar?  
Julia: Ja, die Nachbarn sind sehr nett. Die Frau im zweiten Stock hilft mir oft mit Paketen. Und dem Mann gegenüber habe ich schon einmal beim Umzug geholfen.  
Markus: Super! Dann lade ich dich bald auf einen Kaffee bei mir ein.  
Julia: Gerne! Wo wohnst du eigentlich?  
Markus: Ich wohne in der Lindenallee, ganz in der Nähe vom Stadtpark. Komm einfach vorbei!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Markus: Oi Julia! Como você está gostando do seu novo apartamento?  
Julia: Oi Markus! Obrigada, muito bem! O apartamento é claro e fica em uma rua tranquila.  
Markus: Quantos cômodos ele tem?  
Julia: Tem três cômodos: uma sala, um quarto e um escritório. E, claro, uma cozinha e um banheiro.  
Markus: Parece aconchegante! Como é a decoração?  
Julia: Na sala, há um sofá grande em frente à janela. Ao lado, há uma mesinha e uma luminária. Na parede, há um quadro da minha avó.  
Markus: E na cozinha?  
Julia: Na cozinha, há uma geladeira, um fogão e uma mesa de jantar com quatro cadeiras. A geladeira fica à esquerda da pia.  
Markus: Prático! Onde exatamente você mora?  
Julia: Moro na Gartenstraße 15, no terceiro andar. A estação de metrô fica a apenas cinco minutos a pé.  
Markus: Há um supermercado por perto?  
Julia: Sim, em frente à minha casa há um supermercado orgânico. E atrás da casa há um pequeno parque.  
Markus: Isso é perfeito! Você se dá bem com os vizinhos?  
Julia: Sim, os vizinhos são muito legais. A senhora do segundo andar frequentemente me ajuda com encomendas. E ao homem da frente, já ajudei uma vez na mudança.  
Markus: Ótimo! Então te convido em breve para um café na minha casa.  
Julia: Com prazer! Onde você mora, aliás?  
Markus: Moro na Lindenallee, bem pertinho do parque da cidade. É só aparecer!',
'Dativo prático: preposições fixas (in, an, auf, neben) + dativo para posição estática (Wo?). Artigos: der→dem, die→der, das→dem.',
'[{ "de": "Das Sofa steht vor dem Fenster.", "pt": "O sofá está em frente à janela.", "note": "vor + dativo" },
{ "de": "Das Bild hängt an der Wand.", "pt": "O quadro está pendurado na parede.", "note": "an + dativo" },
{ "de": "Die Lampe steht auf dem Tisch.", "pt": "A lâmpada está sobre a mesa.", "note": "auf + dativo" },
{ "de": "Der Kühlschrank steht neben der Spüle.", "pt": "A geladeira fica ao lado da pia.", "note": "neben + dativo" },
{ "de": "Ich wohne in der Gartenstraße.", "pt": "Moro na Gartenstraße.", "note": "in + dativo (lugar fixo)" }]'::jsonb,
'[{ "de": "das Wohnen", "pt": "a moradia" },
{ "de": "die Wohnung", "pt": "o apartamento" },
{ "de": "das Haus", "pt": "a casa" },
{ "de": "das Zimmer", "pt": "o cômodo" },
{ "de": "das Wohnzimmer", "pt": "a sala de estar" },
{ "de": "das Schlafzimmer", "pt": "o quarto de dormir" },
{ "de": "das Arbeitszimmer", "pt": "o escritório" },
{ "de": "die Küche", "pt": "a cozinha" },
{ "de": "das Bad", "pt": "o banheiro" },
{ "de": "gemütlich", "pt": "aconchegante" },
{ "de": "die Einrichtung", "pt": "a decoração, mobiliário" },
{ "de": "das Sofa", "pt": "o sofá" },
{ "de": "das Fenster", "pt": "a janela" },
{ "de": "der Tisch", "pt": "a mesa" },
{ "de": "die Lampe", "pt": "a luminária" },
{ "de": "die Wand", "pt": "a parede" },
{ "de": "das Bild", "pt": "o quadro" },
{ "de": "der Kühlschrank", "pt": "a geladeira" },
{ "de": "der Herd", "pt": "o fogão" },
{ "de": "der Esstisch", "pt": "a mesa de jantar" },
{ "de": "der Stuhl", "pt": "a cadeira" },
{ "de": "die Spüle", "pt": "a pia" },
{ "de": "der Stock / das Stockwerk", "pt": "o andar" },
{ "de": "die U-Bahn-Station", "pt": "a estação de metrô" },
{ "de": "entfernt", "pt": "distante" },
{ "de": "der Supermarkt", "pt": "o supermercado" },
{ "de": "gegenüber", "pt": "em frente, defronte" },
{ "de": "der Park", "pt": "o parque" },
{ "de": "die Nachbarschaft", "pt": "a vizinhança" },
{ "de": "der Nachbar / die Nachbarin", "pt": "o vizinho / a vizinha" },
{ "de": "das Paket", "pt": "a encomenda" },
{ "de": "der Umzug", "pt": "a mudança (de casa)" },
{ "de": "vorbeikommen", "pt": "passar, aparecer" }]'::jsonb,
'[ "Dativo para localização estática (Wo?):",
"Preposições: in, an, auf, über, unter, vor, hinter, neben, zwischen",
"Artigos: der/das → dem | die → der | plural → den (+n no substantivo)",
"",
"Exemplos práticos:",
"• Im Wohnzimmer (in + dem) = na sala",
"• An der Wand = na parede",
"• Auf dem Tisch = sobre a mesa",
"• Neben dem Kühlschrank = ao lado da geladeira",
"",
"Verbos de posição:",
"• stehen = posição vertical (armário, mesa)",
"• liegen = posição horizontal (livro, tapete)",
"• hängen = pendurado (quadro, lâmpada)",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap24','a2-l24-2','A2','Dativo com Preposições e Verbos','Dativ mit Präpositionen und Verben',
'Dativo indica destinatário, localização fixa ou relação indireta. Preposições fixas: aus, bei, mit, nach, seit, von, zu, gegenüber.',
'mit/zu/von + dativo. Verbos: helfen, danken, gefallen, gehören + dativo. Artigos: der→dem, die→der.',
'[{ "de": "Ich helfe dem Nachbarn.", "pt": "Ajudo o vizinho.", "note": "helfen + dativo" },
{ "de": "Die Wohnung gefällt mir.", "pt": "O apartamento me agrada.", "note": "gefallen + dativo" },
{ "de": "Ich gehe zu meinem Freund.", "pt": "Vou ao meu amigo.", "note": "zu + dativo" },
{ "de": "Das Buch gehört dem Lehrer.", "pt": "O livro pertence ao professor.", "note": "gehören + dativo" }]'::jsonb,
'[]'::jsonb,
'[ "PREPOSIÇÕES QUE EXIGEM DATIVO:",
"aus (de/origem): Ich komme aus Brasilien.",
"bei (na casa de): Ich wohne bei meinen Eltern.",
"mit (com): Ich fahre mit dem Bus.",
"nach (para cidades): Wir fahren nach München.",
"seit (desde): Ich wohne seit 2023 hier.",
"von (de/posse): Das Geschenk ist von meiner Freundin.",
"zu (para pessoas): Ich gehe zu meinem Freund.",
"gegenüber (em frente): Der Park liegt gegenüber dem Haus.",
"",
"ARTIGOS NO DATIVO:",
"Masculino: der Mann → dem Mann",
"Feminino: die Frau → der Frau",
"Neutro: das Kind → dem Kind",
"Plural: die Kinder → den Kindern (+n)",
"",
"VERBOS QUE EXIGEM DATIVO:",
"helfen: Kannst du mir helfen?",
"danken: Ich danke dir.",
"gefallen: Das Buch gefällt mir.",
"gehören: Das Handy gehört ihr.",
"antworten: Er antwortet der Chefin.",
"",
"PRONOMES PESSOAIS NO DATIVO:",
"ich→mir | du→dir | er/sie/es→ihm/ihr/ihm",
"wir→uns | ihr→euch | sie/Sie→ihnen/Ihnen",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
2,true),

('a2-cap24','a2-l24-3','A2','Cultura: Moradia & Vizinhança na Alemanha','Kultur: Wohnen & Nachbarschaft',
'Andares: térreo = Erdgeschoss. Ruhezeiten: silêncio 22h-6h e domingos. Mülltrennung obrigatória. Vizinhos: formalidade com calor.',
'Stockwerk counting, Ruhezeiten, Mülltrennung, Nachbarschaft, Paket-Annahme.',
'[{ "de": "der dritte Stock", "pt": "terceiro andar (acima do térreo)", "note": "contagem" },
{ "de": "die Ruhezeiten", "pt": "horários de silêncio (lei)", "note": "convivência" },
{ "de": "die Mülltrennung", "pt": "separação de lixo", "note": "obrigatória" }]'::jsonb,
'[]'::jsonb,
'[ "Moradia & Vizinhança na Alemanha:",
"",
"• Contagem de andares:",
"  Erdgeschoss = térreo (0). Erster Stock = 1º andar.",
"  „Dritter Stock" = realmente terceiro nível acima do chão.",
"",
"• Ruhezeiten (horários de silêncio):",
"  Lei: silêncio das 22h às 6h e aos domingos.",
"  Sem furadeira, música alta, lavar carro. Multas possíveis.",
"",
"• Mülltrennung (separação de lixo):",
"  Obrigatório: Restmüll (cinza), Papier (azul),",
"  Gelber Sack (plástico), Bio (verde), Glas (vidro por cor).",
"",
"• Vizinhança: formalidade com calor humano:",
"  Privacidade valorizada, mas solidariedade prática.",
"  Oferecer ajuda com encomendas (Pakete annehmen) é comum.",
"  Um „Guten Tag" ao encontrar no corredor é o mínimo.",
"",
"• Dica para estrangeiros:",
"  Ao descrever sua casa, use dativo naturalmente:",
"  „Das Bild hängt an der Wand" soa mais autêntico.",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 25: Aussehen – Personen beschreiben
-- ══════════════════════════════════════════════════
('a2-cap25','a2-l25-1','A2','Diálogo: Sophie descreve novos vizinhos','Dialog: Neue Nachbarn beschreiben',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Sophie: Hey Lukas, hast du die neuen Nachbarn schon gesehen?  
Lukas: Ja, gestern! Der Mann ist groß und schlank, mit kurzen braunen Haaren und einem freundlichen Lächeln. Die Frau hat lange blonde Haare und trägt eine Brille.  
Sophie: Wie findest du sie?  
Lukas: Sehr sympathisch! Der Mann hat eine ruhige Stimme und die Frau lacht viel. Sie wirken wie ein nettes, junges Paar.  
Sophie: Ich habe sie auch kurz getroffen. Die Frau trägt oft bunte Kleidung und der Mann hat immer ein modernes Fahrrad dabei.  
Lukas: Stimmt! Und weißt du, was mir aufgefallen ist? Der Mann hat blaue Augen und die Frau hat grüne. Beide haben ein rundes Gesicht.  
Sophie: Ja, und sie sind beide ungefähr Mitte dreißig, oder?  
Lukas: Genau. Der Mann ist vielleicht ein bisschen älter. Er hat schon ein paar graue Haare an den Schläfen.  
Sophie: Wie ist ihre Persönlichkeit?  
Lukas: Die Frau ist sehr offen und direkt. Der Mann ist eher ruhig und nachdenklich. Aber beide sind höflich und hilfsbereit.  
Sophie: Das ist wichtig in einer Nachbarschaft. Hast du schon mit ihnen gesprochen?  
Lukas: Ja, kurz. Sie kommen aus Hamburg und arbeiten beide im kreativen Bereich. Die Frau ist Grafikdesignerin und der Mann ist Fotograf.  
Sophie: Interessant! Dann haben sie sicher einen guten Geschmack bei der Einrichtung.  
Lukas: Definitiv. Ihre Wohnung sieht sehr modern und gemütlich aus. Viele Pflanzen, helle Farben und schöne Bilder an den Wänden.  
Sophie: Klingt nach tollen Nachbarn! Sollen wir sie mal auf einen Kaffee einladen?  
Lukas: Gerne! Am Wochenende vielleicht?  
Sophie: Perfekt. Ich backe einen Kuchen und du bringst den Kaffee mit.  
Lukas: Abgemacht!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Sophie: Ei Lukas, você já viu os novos vizinhos?  
Lukas: Sim, ontem! O homem é alto e magro, com cabelos castanhos curtos e um sorriso amigável. A mulher tem cabelos longos e loiros e usa óculos.  
Sophie: O que você acha deles?  
Lukas: Muito simpáticos! O homem tem uma voz calma e a mulher ri muito. Parecem um casal jovem e legal.  
Sophie: Também os encontrei rapidamente. A mulher frequentemente usa roupas coloridas e o homem sempre está com uma bicicleta moderna.  
Lukas: Verdade! E sabe o que me chamou a atenção? O homem tem olhos azuis e a mulher tem verdes. Ambos têm rosto redondo.  
Sophie: Sim, e ambos têm cerca de trinta e poucos anos, certo?  
Lukas: Exato. O homem é talvez um pouco mais velho. Ele já tem alguns cabelos grisalhos nas têmporas.  
Sophie: Como é a personalidade deles?  
Lukas: A mulher é muito aberta e direta. O homem é mais calmo e reflexivo. Mas ambos são educados e prestativos.  
Sophie: Isso é importante em uma vizinhança. Você já conversou com eles?  
Lukas: Sim, rapidamente. Eles vêm de Hamburgo e trabalham ambos na área criativa. A mulher é designer gráfica e o homem é fotógrafo.  
Sophie: Interessante! Então eles certamente têm bom gosto para decoração.  
Lukas: Definitivamente. O apartamento deles parece muito moderno e aconchegante. Muitas plantas, cores claras e quadros bonitos nas paredes.  
Sophie: Parece ótimos vizinhos! Devemos convidá-los para um café?  
Lukas: Com prazer! No fim de semana, talvez?  
Sophie: Perfeito. Eu asse um bolo e você traz o café.  
Lukas: Combinado!',
'Adjetivos antes de substantivos: declinação básica com artigo definido (der/die/das). Nominativo: -e (fem/pl), -er (masc), -es (neut).',
'[{ "de": "Der Mann hat kurze braune Haare.", "pt": "O homem tem cabelos castanhos curtos.", "note": "kurze (plural)" },
{ "de": "Sie trägt eine schwarze Brille.", "pt": "Ela usa óculos pretos.", "note": "schwarze (feminino)" },
{ "de": "Das ist ein freundlicher Mann.", "pt": "Esse é um homem simpático.", "note": "freundlicher (masc indefinido)" },
{ "de": "Beide haben ein rundes Gesicht.", "pt": "Ambos têm rosto redondo.", "note": "rundes (neutro)" }]'::jsonb,
'[{ "de": "das Aussehen", "pt": "a aparência" },
{ "de": "beschreiben", "pt": "descrever" },
{ "de": "groß", "pt": "alto, grande" },
{ "de": "klein", "pt": "baixo, pequeno" },
{ "de": "schlank", "pt": "magro, esbelto" },
{ "de": "dick", "pt": "gordo" },
{ "de": "die Haare", "pt": "os cabelos" },
{ "de": "kurz", "pt": "curto" },
{ "de": "lang", "pt": "longo" },
{ "de": "blond", "pt": "loiro" },
{ "de": "braun", "pt": "castanho, marrom" },
{ "de": "schwarz", "pt": "preto" },
{ "de": "die Brille", "pt": "os óculos" },
{ "de": "tragen", "pt": "usar (roupa/acessório)" },
{ "de": "das Lächeln", "pt": "o sorriso" },
{ "de": "freundlich", "pt": "amigável, simpático" },
{ "de": "die Stimme", "pt": "a voz" },
{ "de": "lachen", "pt": "rir" },
{ "de": "sympathisch", "pt": "simpático, cativante" },
{ "de": "bunt", "pt": "colorido" },
{ "de": "die Kleidung", "pt": "a roupa" },
{ "de": "die Augen", "pt": "os olhos" },
{ "de": "blau", "pt": "azul" },
{ "de": "grün", "pt": "verde" },
{ "de": "das Gesicht", "pt": "o rosto" },
{ "de": "rund", "pt": "redondo" },
{ "de": "grau", "pt": "cinza, grisalho" },
{ "de": "die Schläfe", "pt": "a têmpora" },
{ "de": "offen", "pt": "aberto (personalidade)" },
{ "de": "direkt", "pt": "direto" },
{ "de": "nachdenklich", "pt": "reflexivo, pensativo" },
{ "de": "höflich", "pt": "educado" },
{ "de": "hilfsbereit", "pt": "prestativo" },
{ "de": "der Geschmack", "pt": "o gosto, senso estético" },
{ "de": "die Pflanze", "pt": "a planta" },
{ "de": "hell", "pt": "claro, luminoso" }]'::jsonb,
'[ "Declinação de adjetivos (A2 introdutório):",
"Adjetivos só declinam quando vêm ANTES do substantivo.",
"",
"COM ARTIGO DEFINIDO (der/die/das) - Nominativo:",
"Masculino: der große Mann",
"Feminino: die schlanke Frau",
"Neutro: das kleine Kind",
"Plural: die netten Leute",
"",
"COM ARTIGO INDEFINIDO (ein/eine) - Nominativo:",
"Masculino: ein großer Mann",
"Feminino: eine schlanke Frau",
"Neutro: ein kleines Kind",
"",
"SEM ARTIGO (declinação forte):",
"Masculino: großer Mann | Feminino: schlanke Frau",
"",
"DICA A2: Comece com artigo definido + -e/-en.",
"Ex: der große Mann, die nette Frau.",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap25','a2-l25-2','A2','Adjektive Deklination – Nominativ e Akkusativ','Adjektivdeklination im A2',
'Adjetivos atributivos (antes do substantivo) declinam conforme gênero, caso e artigo. Foco A2: Nominativo e Akkusativo com artigo definido.',
'Artigo definido: -e (Nom. fem/pl), -en (restante). Artigo indefinido: adjetivo assume marca de gênero.',
'[{ "de": "Sie trägt eine schwarze Brille.", "pt": "Ela usa óculos pretos.", "note": "feminino acusativo" },
{ "de": "Er ist ein freundlicher, junger Mann.", "pt": "Ele é um homem simpático e jovem.", "note": "masculino nominativo" },
{ "de": "Das ist ein helles, modernes Zimmer.", "pt": "Esse é um quarto claro e moderno.", "note": "neutro nominativo" },
{ "de": "Ich kenne eine sympathische Frau.", "pt": "Conheço uma mulher simpática.", "note": "feminino acusativo" }]'::jsonb,
'[]'::jsonb,
'[ "DECLINAÇÃO COM ARTIGO DEFINIDO (der/die/das):",
"Nominativo:",
"  Masc: der große Mann | Fem: die schlanke Frau",
"  Neut: das kleine Kind | Pl: die netten Leute",
"",
"Akusativ:",
"  Masc: den großen Mann | Fem: die schlanke Frau",
"  Neut: das kleine Kind | Pl: die netten Leute",
"",
"✅ Padrão: -e no Nom. singular fem/pl; -en em todos os demais.",
"",
"DECLINAÇÃO COM ARTIGO INDEFINIDO (ein/eine):",
"Nominativo:",
"  Masc: ein großer Mann | Fem: eine schlanke Frau",
"  Neut: ein kleines Kind",
"",
"Akusativ:",
"  Masc: einen großen Mann | Fem: eine schlanke Frau",
"  Neut: ein kleines Kind",
"",
"✅ Padrão: Adjetivo assume marca que artigo indefinido não mostra.",
"",
"ESTRUTURA PRÁTICA:",
"[Substantivo] + [verbo] + [artigo] + [adjetivo declinado] + [substantivo]",
"Ex: Sie trägt eine schwarze Brille.",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
2,true),

('a2-cap25','a2-l25-3','A2','Cultura: Aparência & Comunicação na Alemanha','Kultur: Aussehen & Kommunikation',
'Diretude na descrição: „Er ist groß" é normal. Óculos como acessório de estilo. Cabelos grisalhos aceitos naturalmente. Elogios com moderação.',
'Direkt aber respektvoll, Brille als Accessoire, graue Haare, Lob mit Maß.',
'[{ "de": "Er ist groß und schlank.", "pt": "Ele é alto e magro (descrição normal).", "note": "diretude" },
{ "de": "Sie trägt eine Brille.", "pt": "Ela usa óculos (estilo).", "note": "acessório" },
{ "de": "Er hat graue Haare.", "pt": "Ele tem cabelos grisalhos (aceito).", "note": "envelhecimento" }]'::jsonb,
'[]'::jsonb,
'[ "Aparência & Comunicação na Alemanha:",
"",
"• Diretude na descrição:",
"  Dizer „Er ist groß und schlank" é normal, não ofensivo.",
"  Evite comentários sobre peso (dick) sem intimidade.",
"",
"• Óculos como acessório de estilo:",
"  Usar Brille é comum e raramente visto como limitação.",
"  Muitas pessoas têm várias armações para ocasiões diferentes.",
"",
"• Cabelos naturais e envelhecimento:",
"  Cabelos grisalhos (graue Haare) são aceitos com naturalidade,",
"  especialmente entre homens. Autenticidade > padrões estéticos.",
"",
"• Elogios com moderação:",
"  Elogiar aparência é bem-vindo, mas com discrição.",
"  „Sie sehen heute gut aus" é seguro.",
"  Comentários muito pessoais podem soar invasivos.",
"",
"• Dica de comunicação:",
"  Ao descrever alguém, use estruturas claras:",
"  „Er hat... / Sie trägt... / Beide sind...".",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
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
-- CAPÍTULO 26: Medien – Alltag mit Technologie
-- ══════════════════════════════════════════════════
('a2-cap26','a2-l26-1','A2','Diálogo: Nina e Tom falam sobre apps e redes sociais','Dialog: Über Apps und Social Media',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Nina: Hey Tom, hast du dich heute schon mit deinen Freunden online getroffen?  
Tom: Ja, wir haben uns per Video-Chat unterhalten. Und du? Hast du dich heute schon informiert?  
Nina: Ich habe mich gerade über die Nachrichten im Internet schlau gemacht. Aber ich ärgere mich oft über Fake News.  
Tom: Das kenne ich! Ich informiere mich nur noch über vertrauenswürdige Quellen.  
Nina: Gut. Ich habe mir gestern eine neue App heruntergeladen. Sie hilft mir, mich zu organisieren.  
Tom: Welche App?  
Nina: Eine To-do-List-App. Ich trage mich dort ein, was ich erledigen muss. Und ich erinnere mich besser an Termine.  
Tom: Klingt praktisch! Ich habe mir auch eine Fitness-App installiert. Ich motiviere mich damit, regelmäßig Sport zu machen.  
Nina: Super! Aber pass auf: Ich habe mich schon einmal in einer App verloren. Es gab so viele Funktionen, dass ich nicht mehr wusste, wo ich anfangen sollte.  
Tom: Haha, das ist typisch! Ich beschränke mich jetzt auf drei Apps: Nachrichten, Kalender und Fitness. So überfordere ich mich nicht.  
Nina: Weise Entscheidung! Ich freue mich schon auf unser nächstes Online-Treffen.  
Tom: Ich auch! Wir können uns ja morgen Abend wieder videochatten.  
Nina: Perfekt. Ich bereite mich schon mal vor. Bis morgen!  
Tom: Bis dann! Und vergiss nicht: Schalte dich pünktlich ein!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Nina: Oi Tom, você já se encontrou online com seus amigos hoje?  
Tom: Sim, conversamos por vídeo-chamada. E você? Já se informou hoje?  
Nina: Acabei de me informar sobre as notícias na internet. Mas frequentemente me irrito com fake news.  
Tom: Conheço bem! Só me informo por fontes confiáveis.  
Nina: Bom. Ontem baixei um app novo. Ele me ajuda a me organizar.  
Tom: Qual app?  
Nina: Um app de lista de tarefas. Eu anoto lá o que preciso fazer. E me lembro melhor dos compromissos.  
Tom: Parece prático! Também instalei um app de fitness. Ele me motiva a fazer exercícios regularmente.  
Nina: Ótimo! Mas cuidado: uma vez já me perdi em um app. Havia tantas funções que eu não sabia por onde começar.  
Tom: Haha, isso é típico! Agora me limito a três apps: notícias, calendário e fitness. Assim não me sobrecarrego.  
Nina: Decisão sábia! Já estou ansiosa pelo nosso próximo encontro online.  
Tom: Eu também! Podemos nos videochamar amanhã à noite de novo.  
Nina: Perfeito. Já vou me preparando. Até amanhã!  
Tom: Até lá! E não esqueça: conecte-se na hora!',
'Pronomes reflexivos (mich, dich, sich, uns, euch). Verbos: sich treffen, sich unterhalten, sich informieren, sich ärgern. Acusativo vs Dativo reflexivo.',
'[{ "de": "Ich habe mich informiert.", "pt": "Eu me informei.", "note": "reflexivo acusativo" },
{ "de": "Ich ärgere mich über Fake News.", "pt": "Eu me irrito com fake news.", "note": "reflexivo + über" },
{ "de": "Ich kaufe mir ein Buch.", "pt": "Eu compro um livro para mim.", "note": "dativo reflexivo (benefício)" },
{ "de": "Wir treffen uns morgen.", "pt": "Nos encontramos amanhã.", "note": "reciprocidade" }]'::jsonb,
'[{ "de": "die Medien", "pt": "as mídias" },
{ "de": "die Technologie", "pt": "a tecnologia" },
{ "de": "sich treffen", "pt": "encontrar-se" },
{ "de": "der Video-Chat", "pt": "a videochamada" },
{ "de": "sich unterhalten", "pt": "conversar" },
{ "de": "sich informieren", "pt": "informar-se" },
{ "de": "die Nachricht", "pt": "a notícia" },
{ "de": "sich schlau machen", "pt": "informar-se, pesquisar" },
{ "de": "die Fake News", "pt": "as notícias falsas" },
{ "de": "sich ärgern", "pt": "irritar-se" },
{ "de": "vertrauenswürdig", "pt": "confiável" },
{ "de": "die Quelle", "pt": "a fonte" },
{ "de": "die App", "pt": "o aplicativo" },
{ "de": "herunterladen", "pt": "baixar (arquivo)" },
{ "de": "sich organisieren", "pt": "organizar-se" },
{ "de": "sich eintragen", "pt": "anotar-se, registrar-se" },
{ "de": "sich erinnern", "pt": "lembrar-se" },
{ "de": "sich motivieren", "pt": "motivar-se" },
{ "de": "sich verlieren", "pt": "perder-se" },
{ "de": "sich beschränken", "pt": "limitar-se" },
{ "de": "sich überfordern", "pt": "sobrecarregar-se" },
{ "de": "sich vorbereiten", "pt": "preparar-se" },
{ "de": "sich einschalten", "pt": "ligar-se, conectar-se" },
{ "de": "pünktlich", "pt": "pontual" }]'::jsonb,
'[ "Regra de ouro: Se houver outro objeto direto na frase, o pronome reflexivo vai para o Dativo.",
"Ex: Ich wasche MICH (só eu). Ich kaufe MIR (para mim) ein Buch.",
"Verbos com preposições fixas: sich ärgern über (Akk), sich freuen auf (Akk), sich freuen über (Akk).",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap26','a2-l26-2','A2','Pronomes Reflexivos e Verbos Reflexivos','Reflexivpronomen & Reflexive Verben',
'Usados quando sujeito e objeto são a mesma pessoa. Acusativo (ação sobre si) vs Dativo (benefício para si + objeto direto).',
'mich/dich/sich/uns/euch/sich. Acusativo: Ich wasche mich. Dativo: Ich kaufe mir...',
'[{ "de": "Du musst dich beeilen.", "pt": "Você tem que se apressar.", "note": "sich beeilen" },
{ "de": "Er interessiert sich für Kunst.", "pt": "Ele se interessa por arte.", "note": "sich interessieren für" },
{ "de": "Wir erinnern uns an den Urlaub.", "pt": "Nós nos lembramos das férias.", "note": "sich erinnern an" },
{ "de": "Ich fühle mich heute gut.", "pt": "Eu me sinto bem hoje.", "note": "sich fühlen" }]'::jsonb,
'[]'::jsonb,
'[ "PRONOMES REFLEXIVOS (ACUSATIVO):",
"ich → mich | du → dich | er/sie/es → sich",
"wir → uns | ihr → euch | sie/Sie → sich",
"Ex: Ich ärgere mich. Du wäschst dich.",
"",
"PRONOMES REFLEXIVOS (DATIVO - quando há outro objeto):",
"ich → mir | du → dir | er/sie/es → sich",
"wir → uns | ihr → euch | sie/Sie → sich",
"Ex: Ich kaufe MIR ein Auto. (Eu compro um carro para mim).",
"",
"VERBOS REFLEXIVOS COMUNS A2:",
"sich freuen (alegrar-se), sich treffen (encontrar-se),",
"sich unterhalten (conversar), sich entscheiden (decidir-se).",
"",
"PREPOSIÇÕES FIXAS COM REFLEXIVOS:",
"sich freuen AUF + Akk (ansiedade futura).",
"sich freuen ÜBER + Akk (alegria atual/past).",
"sich interessieren FÜR + Akk.",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
2,true),

('a2-cap26','a2-l26-3','A2','Cultura: Tecnologia & Privacidade na Alemanha','Kultur: Technologie & Datenschutz',
'DSGVO (GDPR) é lei rígida. "Digital Detox" é tendência. Uso moderado de redes sociais. Vídeo-chamadas formais.',
'DSGVO, Datenschutz, Digital Detox, Video-Konferenz Etikette.',
'[{ "de": "der Datenschutz", "pt": "proteção de dados", "note": "lei" },
{ "de": "die Digital Detox", "pt": "desintoxicação digital", "note": "tendência" },
{ "de": "die Video-Konferenz", "pt": "videoconferência", "note": "trabalho" }]'::jsonb,
'[]'::jsonb,
'[ "Tecnologia & Privacidade na Alemanha:",
"",
"• DSGVO (GDPR):",
"  Leis de proteção de dados são rigorosas. Sites pedem consentimento explícito para cookies.",
"  Alemães são cautelosos ao compartilhar dados pessoais online.",
"",
"• Digital Detox:",
"  Tendência crescente de "desconectar". Fins de semana sem celular são valorizados.",
"",
"• Apps Oficiais:",
"  Governo oferece apps confiáveis: ELSTER (impostos), Corona-Warn (saúde), DB Navigator (trem).",
"  Confiança em fontes oficiais é alta.",
"",
"• Etiqueta em Videochamadas:",
"  Pontualidade é crucial. Câmera ligada é o padrão profissional.",
"  Fundo neutro e roupa adequada (mesmo em home office).",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 27: Im Restaurant – Bestellen und reagieren
-- ══════════════════════════════════════════════════
('a2-cap27','a2-l27-1','A2','Diálogo: Pedido educado no restaurante','Dialog: Höflich im Restaurant bestellen',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Kellner: Guten Abend! Haben Sie schon einen Platz gefunden?  
Gast (Anna): Guten Abend! Ja, wir möchten gerne an dem Tisch am Fenster sitzen.  
Kellner: Sehr gerne. Hier ist die Speisekarte. Möchten Sie schon etwas trinken?  
Anna: Ja, ich hätte gern ein Glas Wasser, bitte. Und mein Freund hätte gern ein Bier.  
Kellner: Gerne. Still oder sprudelnd?  
Anna: Sprudelnd, bitte.  
Kellner: Kommt sofort.  
*(Der Kellner bringt die Getränke)*  
Kellner: Haben Sie schon gewählt, was Sie essen möchten?  
Anna: Ja, ich nehme den Salat mit Hähnchen, bitte. Und mein Freund möchte die Pasta mit Tomatensauce.  
Kellner: Sehr gute Wahl! Möchten Sie dazu eine Vorspeise oder einen Nachtisch?  
Anna: Vielleicht später. Wir bestellen erst die Hauptspeisen.  
Kellner: Kein Problem. Und wie möchten Sie Ihr Hähnchen gebraten? Medium oder durch?  
Anna: Medium, bitte.  
Kellner: Verstanden. Ich bringe Ihre Bestellung gleich raus.  
*(Nach dem Essen)*  
Kellner: Hat es Ihnen geschmeckt?  
Anna: Ja, ausgezeichnet! Der Salat war frisch und das Hähnchen perfekt gebraten.  
Kellner: Das freut mich! Möchten Sie noch einen Kaffee ou einen Nachtisch?  
Anna: Gerne einen Espresso, bitte. Und die Rechnung, wenn es geht.  
Kellner: Selbstverständlich. Moment bitte.  
*(Der Kellner bringt die Rechnung)*  
Anna: Können wir mit Karte zahlen?  
Kellner: Ja, natürlich. Das Terminal bringe ich gleich.  
Anna: Vielen Dank für den schönen Abend!  
Kellner: Immer gerne! Ich wünsche Ihnen noch einen schönen Abend. Auf Wiedersehen!  
Anna: Auf Wiedersehen!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Garçom: Boa noite! Já encontraram uma mesa?  
Cliente (Anna): Boa noite! Sim, gostaríamos de sentar naquela mesa perto da janela.  
Garçom: Com prazer. Aqui está o cardápio. Gostariam de pedir algo para beber?  
Anna: Sim, eu gostaria de um copo de água, por favor. E meu amigo gostaria de uma cerveja.  
Garçom: Claro. Com ou sem gás?  
Anna: Com gás, por favor.  
Garçom: Já trago.  
*(O garçom traz as bebidas)*  
Garçom: Já escolheram o que gostariam de comer?  
Anna: Sim, eu vou querer a salada com frango, por favor. E meu amigo quer a massa com molho de tomate.  
Garçom: Ótima escolha! Gostariam de uma entrada ou sobremesa também?  
Anna: Talvez mais tarde. Vamos pedir primeiro os pratos principais.  
Garçom: Sem problema. E como gostaria do frango grelhado? Ao ponto ou bem passado?  
Anna: Ao ponto, por favor.  
Garçom: Entendido. Já trago seu pedido.  
*(Após a refeição)*  
Garçom: Gostaram da comida?  
Anna: Sim, excelente! A salada estava fresca e o frango grelhado perfeitamente.  
Garçom: Fico feliz! Gostariam de um café ou sobremesa ainda?  
Anna: Com prazer, um espresso, por favor. E a conta, se possível.  
Garçom: Claro. Um momento, por favor.  
*(O garçom traz a conta)*  
Anna: Podemos pagar com cartão?  
Garçom: Sim, naturalmente. Já trago a maquininha.  
Anna: Muito obrigada pela noite agradável!  
Garçom: Por nada! Desejo a vocês uma boa noite. Até logo!  
Anna: Até logo!',
'Konjunktiv II para cortesia: "Ich hätte gern", "Wir möchten". "Nehmen" para escolha no cardápio. "Schmecken" com dativo.',
'[{ "de": "Ich hätte gern ein Wasser.", "pt": "Eu gostaria de uma água.", "note": "Konjunktiv II (cortesia)" },
{ "de": "Ich nehme den Salat.", "pt": "Eu vou querer a salada.", "note": "nehmen = escolher" },
{ "de": "Hat es Ihnen geschmeckt?", "pt": "Gostaram da comida?", "note": "schmecken + dativo" },
{ "de": "Können wir mit Karte zahlen?", "pt": "Podemos pagar com cartão?", "note": "zahlen com Karte" }]'::jsonb,
'[{ "de": "das Restaurant", "pt": "o restaurante" },
{ "de": "der Kellner", "pt": "o garçom" },
{ "de": "die Speisekarte", "pt": "o cardápio" },
{ "de": "bestellen", "pt": "pedir" },
{ "de": "trinken", "pt": "beber" },
{ "de": "still", "pt": "sem gás (água)" },
{ "de": "sprudelnd", "pt": "com gás (água)" },
{ "de": "wählen", "pt": "escolher" },
{ "de": "die Vorspeise", "pt": "a entrada" },
{ "de": "die Hauptspeise", "pt": "o prato principal" },
{ "de": "der Nachtisch", "pt": "a sobremesa" },
{ "de": "braten", "pt": "grelhar/fritar" },
{ "de": "medium", "pt": "ao ponto" },
{ "de": "durch", "pt": "bem passado" },
{ "de": "die Bestellung", "pt": "o pedido" },
{ "de": "ausgezeichnet", "pt": "excelente" },
{ "de": "frisch", "pt": "fresco" },
{ "de": "der Espresso", "pt": "o espresso" },
{ "de": "die Rechnung", "pt": "a conta" },
{ "de": "zahlen", "pt": "pagar" },
{ "de": "das Terminal", "pt": "a maquininha" },
{ "de": "der Abend", "pt": "a noite" }]'::jsonb,
'[ "Konjunktiv II de cortesia: 'Ich hätte gern' (eu teria gostado de) soa mais educado que 'Ich will'.",
"'Nehmen' é o verbo padrão para escolher do cardápio: 'Ich nehme das Schnitzel'.",
"Água: 'Still' (sem gás) ou 'Sprudelnd' (com gás). Água da torneira raramente é servida.",
"Conta: 'Getrennt' (separado) ou 'Zusammen' (junto).",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap27','a2-l27-2','A2','Konjunktiv II Básico e Pedidos Educados','Konjunktiv II & Höfliche Bitten',
'Konjunktiv II expressa desejos e cortesia. Formas principais: hätte (haben), wäre (sein), würde + infinitivo. Pedidos: "Könnten Sie...?"',
'Ich hätte gern... / Ich möchte... / Könnten Sie bitte...? / Würden Sie...?',
'[{ "de": "Ich hätte gern einen Kaffee.", "pt": "Eu gostaria de um café.", "note": "hätten" },
{ "de": "Wir wären Ihnen dankbar.", "pt": "Nós seríamos gratos a você.", "note": "wären" },
{ "de": "Könnten Sie mir bitte helfen?", "pt": "Poderia me ajudar, por favor?", "note": "könnten" },
{ "de": "Würden Sie bitte leiser sein?", "pt": "Você poderia fazer silêncio, por favor?", "note": "würden" }]'::jsonb,
'[]'::jsonb,
'[ "KONJUNKTIV II DE CORTESIA (Formas Irregulares Comuns):",
"haben → hätte: Ich hätte gern... (Eu gostaria de ter...)",
"sein → wäre: Das wäre toll! (Isso seria ótimo!)",
"können → könnte: Könnten Sie...? (Poderia...?)",
"",
"KONJUNKTIV II COM WÜRDE (Para outros verbos):",
"Estrutura: würde + Infinitivo no final.",
"Ex: Ich würde gern reisen. (Eu gostaria de viajar.)",
"Ex: Würden Sie bitte warten? (Poderia esperar, por favor?)",
"",
"PEDIDOS EDUCADOS NO RESTAURANTE:",
"1. Ich hätte gern... (Pedido direto e educado)",
"2. Ich möchte... (Desejo)",
"3. Ich nehme... (Decisão)",
"",
"DICA: Termine sempre com 'bitte'.",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
2,true),

('a2-cap27','a2-l27-3','A2','Cultura: Etiqueta à Mesa na Alemanha','Kultur: Tischmanieren & Restaurant',
'Prost (olhar nos olhos). Trinkgeld (gorjeta inclusa no total dito). Água com gás. Dividir conta é normal.',
'Prost (olho no olho), Trinkgeld (arredondar), Leitungswasser (raro), Getrennt bezahlen.',
'[{ "de": "Prost!", "pt": "Saúde!", "note": "brinde" },
{ "de": "das Trinkgeld", "pt": "a gorjeta", "note": "etiqueta" },
{ "de": "getrennt bezahlen", "pt": "pagar separado", "note": "conta" }]'::jsonb,
'[]'::jsonb,
'[ "Etiqueta à Mesa na Alemanha:",
"",
"• Prost!:",
"  Ao brindar, OLHE NOS OLHOS de todos. Não fazer isso dá 7 anos de azar no amor!",
"",
"• Trinkgeld (Gorjeta):",
"  Não se deixa na mesa. Diga o valor total ao pagar.",
"  Ex: Conta 23€, você dá 25€ e diz 'Stimmt so' (está bom assim).",
"",
"• Água:",
"  Peça 'Wasser mit Kohlensäure' (com gás) ou 'ohne' (sem).",
"  'Leitungswasser' (torneira) é rara em restaurantes.",
"",
"• Conta:",
"  'Getrennt, bitte' é perfeitamente aceitável e comum.",
"",
"• Silêncio:",
"  Tom de voz moderado. Falar alto pode ser malvisto.",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 28: Biografien – Lebensgeschichten erzählen
-- ══════════════════════════════════════════════════
('a2-cap28','a2-l28-1','A2','Diálogo: Lisa conta sua história de vida','Dialog: Über das Leben erzählen',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Lisa: Hey Marco, ich habe gestern ein altes Fotoalbum gefunden. Möchtest du es dir ansehen?  
Marco: Gerne! Wo war das?  
Lisa: Das war in Berlin, im Jahr 2018. Ich war damals Studentin und wohnte in einer kleinen WG.  
Marco: Wie war dein Leben in Berlin?  
Lisa: Es war aufregend! Ich hatte viele Freunde und besuchte oft Konzerte. Am Wochenende fuhr ich mit dem Fahrrad durch die Stadt.  
Marco: Klingt toll! Was machtest du nach dem Studium?  
Lisa: Nach dem Studium zog ich nach München. Dort fand ich meinen ersten Job bei einer Marketingfirma.  
Marco: Und wie war der Job?  
Lisa: Am Anfang war er schwierig, aber ich lernte schnell. Meine Kollegen waren sehr hilfsbereit.  
Marco: Hast du dort auch jemanden kennengelernt?  
Lisa: Ja, tatsächlich! Ich traf meinen Freund Thomas bei einer Firmenfeier. Wir waren sofort sympathisch.  
Marco: Das ist ja romantisch! Und was passierte dann?  
Lisa: Zwei Jahre später zogen wir zusammen. 2022 heirateten wir in einem kleinen Dorf in Bayern.  
Marco: Wie schön! Und wo lebt ihr jetzt?  
Lisa: Jetzt wohnen wir in Hamburg. Ich arbeite immer noch im Marketing, und Thomas ist Lehrer.  
Marco: Und habt ihr Kinder?  
Lisa: Ja, wir haben eine Tochter. Sie heißt Emma und ist drei Jahre alt.  
Marco: Herzlichen Glückwunsch! Das Leben hat dich wirklich gut behandelt.  
Lisa: Danke! Und wie war deine Geschichte?  
Marco: Meine Geschichte ist anders, aber auch interessant. Vielleicht erzähle ich sie dir beim nächsten Kaffee?  
Lisa: Abgemacht!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Lisa: Ei Marco, ontem encontrei um álbum de fotos antigo. Quer dar uma olhada?  
Marco: Com prazer! Onde foi isso?  
Lisa: Foi em Berlim, no ano de 2018. Eu era estudante naquela época e morava em um pequeno apartamento dividido.  
Marco: Como era sua vida em Berlim?  
Lisa: Foi emocionante! Eu tinha muitos amigos e frequentava shows com frequência. Nos fins de semana, eu andava de bicicleta pela cidade.  
Marco: Parece incrível! O que você fez depois da faculdade?  
Lisa: Depois da faculdade, me mudei para Munique. Lá, encontrei meu primeiro emprego em uma empresa de marketing.  
Marco: E como foi o emprego?  
Lisa: No começo foi difícil, mas aprendi rápido. Meus colegas foram muito prestativos.  
Marco: Você também conheceu alguém lá?  
Lisa: Sim, na verdade! Conheci meu namorado Thomas em uma festa da empresa. Nós nos simpatizamos imediatamente.  
Marco: Isso é romântico! E o que aconteceu depois?  
Lisa: Dois anos depois, nos mudamos juntos. Em 2022, nos casamos em uma pequena vila na Baviera.  
Marco: Que lindo! E onde vocês moram agora?  
Lisa: Agora moramos em Hamburgo. Eu ainda trabalho com marketing, e Thomas é professor.  
Marco: E vocês têm filhos?  
Lisa: Sim, temos uma filha. Ela se chama Emma e tem três anos.  
Marco: Parabéns! A vida realmente te tratou bem.  
Lisa: Obrigada! E como foi sua história?  
Marco: Minha história é diferente, mas também interessante. Talvez eu te conte na próxima vez que tomarmos um café?  
Lisa: Combinado!',
'Präteritum (Imperfekt) para narrativas. Foco em sein (war), haben (hatte) e verbos regulares (-te).',
'[{ "de": "Ich war Studentin.", "pt": "Eu era estudante.", "note": "sein no Präteritum" },
{ "de": "Ich hatte viele Freunde.", "pt": "Eu tinha muitos amigos.", "note": "haben no Präteritum" },
{ "de": "Ich lernte schnell.", "pt": "Eu aprendi rápido.", "note": "lernen no Präteritum" },
{ "de": "Wir heirateten 2022.", "pt": "Nós nos casamos em 2022.", "note": "heiraten no Präteritum" }]'::jsonb,
'[{ "de": "die Biografie", "pt": "a biografia" },
{ "de": "die Lebensgeschichte", "pt": "a história de vida" },
{ "de": "erzählen", "pt": "contar" },
{ "de": "das Fotoalbum", "pt": "o álbum de fotos" },
{ "de": "damals", "pt": "naquela época" },
{ "de": "die WG", "pt": "apartamento dividido" },
{ "de": "aufregend", "pt": "emocante" },
{ "de": "das Konzert", "pt": "o show" },
{ "de": "das Studium", "pt": "a faculdade" },
{ "de": "ziehen", "pt": "mudar-se" },
{ "de": "der Job", "pt": "o emprego" },
{ "de": "der Anfang", "pt": "o começo" },
{ "de": "schwierig", "pt": "difícil" },
{ "de": "kennenlernen", "pt": "conhecer" },
{ "de": "tatsächlich", "pt": "na verdade" },
{ "de": "die Firmenfeier", "pt": "a festa da empresa" },
{ "de": "sofort", "pt": "imediatamente" },
{ "de": "zusammen", "pt": "juntos" },
{ "de": "heiraten", "pt": "casar-se" },
{ "de": "das Dorf", "pt": "a vila" },
{ "de": der Lehrer", "pt": "o professor" },
{ "de": "die Tochter", "pt": "a filha" },
{ "de": "behandeln", "pt": "tratar" },
{ "de": "anders", "pt": "diferente" }]'::jsonb,
'[ "Präteritum (Imperfekt): Usado para narrativas escritas e orais formais.",
"Ser/Haver: ich war, du warst, er war | ich hatte, du hattest, er hatte.",
"Regulares: Radiz + te + terminação. Ex: lernen → ich lernte, du lerntest.",
"Atenção: Verbos com raiz em t/d/m/n ganham -ete (arbeiten → ich arbeitete).",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap28','a2-l28-2','A2','Präteritum: sein, haben e Regulares','Präteritum: Vergangenheit erzählen',
'Narrar o passado. sein/haben são essenciais. Regulares seguem padrão -te. Contraste com Perfekt (fala cotidiana vs narrativa).',
'Präteritum: war/hatte + regulares (-te). Uso: narrativas, biografias, escrita.',
'[{ "de": "Das Wetter war schön.", "pt": "O tempo estava bonito.", "note": "war" },
{ "de": "Er hatte keine Zeit.", "pt": "Ele não tinha tempo.", "note": "hatte" },
{ "de": "Wir besuchten Oma.", "pt": "Nós visitamos a vovó.", "note": "besuchten" },
{ "de": "Sie arbeitete viel.", "pt": "Ela trabalhou muito.", "note": "arbeitete (-ete)" }]'::jsonb,
'[]'::jsonb,
'[ "PRÄTERITUM DE SEIN E HABEN:",
"sein: ich war, du warst, er war, wir waren, ihr wart, sie waren.",
"haben: ich hatte, du hattest, er hatte, wir hatten, ihr hattet, sie hatten.",
"",
"VERBOS REGULARES NO PRÄTERITUM:",
"Regra: Raiz + -te + terminação pessoal.",
"machen → ich machte, du machtest, er machte.",
"lernen → ich lernte, du lerntest, er lernte.",
"",
"EXCEÇÃO (Raiz em t/d/m/n):",
"Adiciona-se -e- para facilitar pronúncia: -ete.",
"arbeiten → ich arbeitete.",
"atmen → ich atmete.",
"",
"PERFEKT VS. PRÄTERITUM:",
"Fala cotidiana: Perfekt (Ich habe gekauft).",
"Narrativa/Escrita: Präteritum (Ich kaufte).",
"Exceção: sein/haben usam Präteritum na fala (Ich war dort).",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
2,true),

('a2-cap28','a2-l28-3','A2','Cultura: Narrativas & Currículo na Alemanha','Kultur: Biografien & Lebenslauf',
'Lebenslauf tabular. Anschreiben narrativo. Valorização da formação. Mudanças de cidade são comuns.',
'Lebenslauf (tabular), Anschreiben (narrativo), Ausbildung, Umzug.',
'[{ "de": "der Lebenslauf", "pt": "o currículo", "note": "documento" },
{ "de": "das Anschreiben", "pt": "carta de apresentação", "note": "documento" },
{ "de": "die Ausbildung", "pt": "formação profissional", "note": "educação" }]'::jsonb,
'[]'::jsonb,
'[ "Narrativas & Currículo na Alemanha:",
"",
"• Lebenslauf (Currículo):",
"  Formato tabular, ordem cronológica inversa.",
"  Foto profissional é comum (embora menos obrigatória agora).",
"  Sem gaps (lacunas) explicados.",
"",
"• Anschreiben (Carta de Apresentação):",
"  Narrativa formal. Usa-se o Präteritum para descrever experiências passadas.",
"  Estrutura: Quem sou, por que aplico, por que sou bom.",
"",
"• Valorização da Formação:",
"  Títulos e certificados são importantes. 'Ich habe studiert...' é relevante.",
"",
"• Mobilidade:",
"  É comum morar em várias cidades devido ao sistema educacional e trabalho.",
"  Perguntar 'Wo hast du gewohnt?' é natural.",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 29: Geschenke – Geben und bekommen
-- ══════════════════════════════════════════════════
('a2-cap29','a2-l29-1','A2','Diálogo: Julia e Tim trocam presentes','Dialog: Geschenke geben und bekommen',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Julia: Hey Tim, hast du schon ein Geschenk für Omas Geburtstag gekauft?  
Tim: Ja, gestern! Ich habe ihr eine schöne Halskette gekauft. Und was schenkst du ihr?  
Julia: Ich habe ihr ein Buch über Gartenarbeit geschenkt. Sie liebt Blumen!  
Tim: Das ist eine tolle Idee! Hast du es schon eingepackt?  
Julia: Ja, ich habe es in buntes Papier gepackt und ihr eine Karte dazu geschrieben.  
Tim: Super! Sag mal, wem hast du letztes Jahr zu Weihnachten geschenkt?  
Julia: Letztes Jahr habe ich meinem Bruder eine Uhr geschenkt und meiner Schwester habe ich einen Gutschein für ein Spa-Wochenende gegeben.  
Tim: Cool! Und was hast du bekommen?  
Julia: Ich habe von meinen Eltern ein neues Fahrrad bekommen. Ich war total überrascht!  
Tim: Das ist ja ein tolles Geschenk! Wer hat es dir gegeben?  
Julia: Meine Eltern haben es mir zum Abschluss meines Studiums geschenkt. Ich habe mich sehr gefreut!  
Tim: Verdient! Sag mal, kann ich dir etwas zeigen? Ich habe dir auch ein kleines Geschenk mitgebracht.  
Julia: Wirklich? Für mich? Das ist aber nett! Was ist es?  
Tim: Ich habe dir eine selbstgemachte Marmelade mitgebracht. Aus Beeren aus meinem Garten.  
Julia: Oh, wie lieb! Vielen Dank! Ich gebe dir dafür einen selbstgebackenen Kuchen.  
Tim: Abgemacht! Dann freuen wir uns beide.  
Julia: Genau! Schenken macht Spaß, wenn es von Herzen kommt.

---

**TRADUÇÃO EM PORTUGUÊS:**  
Julia: Ei Tim, você já comprou um presente para o aniversário da vovó?  
Tim: Sim, ontem! Comprei para ela um colar bonito. E o que você vai dar a ela?  
Julia: Dei a ela um livro sobre jardinagem. Ela adora flores!  
Tim: Essa é uma ótima ideia! Você já embrulhou?  
Julia: Sim, embrulhei em papel colorido e escrevi um cartão para ela.  
Tim: Ótimo! Diz aí, para quem você deu presentes no Natal passado?  
Julia: No ano passado, dei um relógio ao meu irmão e dei à minha irmã um voucher para um fim de semana em um spa.  
Tim: Legal! E o que você ganhou?  
Julia: Ganhei uma bicicleta nova dos meus pais. Fiquei totalmente surpresa!  
Tim: Que presente incrível! Quem te deu?  
Julia: Meus pais me deram de presente pela conclusão da minha faculdade. Fiquei muito feliz!  
Tim: Merecido! Diz aí, posso te mostrar uma coisa? Também trouxe um presentinho para você.  
Julia: Sério? Para mim? Que gentileza! O que é?  
Tim: Trouxe para você uma geleia caseira. Feita com frutas do meu jardim.  
Julia: Ah, que fofo! Muito obrigada! Em troca, vou te dar um bolo caseiro.  
Tim: Combinado! Então nós dois ficamos felizes.  
Julia: Exato! Dar presentes é divertido quando vem do coração.',
'Verbos com dois objetos: Dativo (pessoa) + Acusativo (coisa). schenken, geben, kaufen, bringen. Ordem dos objetos.',
'[{ "de": "Ich schenke meiner Mutter eine Blume.", "pt": "Dou uma flor à minha mãe.", "note": "Dat + Akk" },
{ "de": "Er gibt mir das Buch.", "pt": "Ele me dá o livro.", "note": "Dat + Akk" },
{ "de": "Ich kaufe dir ein Eis.", "pt": "Compro um sorvete para você.", "note": "Dat + Akk" },
{ "de": "Wer hat es dir gegeben?", "pt": "Quem te deu isso?", "note": "Dat + Akk" }]'::jsonb,
'[{ "de": "das Geschenk", "pt": "o presente" },
{ "de": "schenken", "pt": "dar de presente" },
{ "de": "geben", "pt": "dar" },
{ "de": "bekommen", "pt": "receber" },
{ "de": "kaufen", "pt": "comprar" },
{ "de": "die Halskette", "pt": "o colar" },
{ "de": "die Gartenarbeit", "pt": "a jardinagem" },
{ "de": "einpacken", "pt": "embrulhar" },
{ "de": "das Papier", "pt": "o papel" },
{ "de": "bunt", "pt": "colorido" },
{ "de": "die Karte", "pt": "o cartão" },
{ "de": "schreiben", "pt": "escrever" },
{ "de": "Weihnachten", "pt": "Natal" },
{ "de": "die Uhr", "pt": "o relógio" },
{ "de": "der Gutschein", "pt": "o voucher" },
{ "de": "das Fahrrad", "pt": "a bicicleta" },
{ "de": "überrascht", "pt": "surpreso" },
{ "de": "der Abschluss", "pt": "a conclusão" },
{ "de": "mitbringen", "pt": "trazer consigo" },
{ "de": "die Marmelade", "pt": "a geleia" },
{ "de": "die Beere", "pt": "a fruta vermelha" },
{ "de": "lieb", "pt": "fofo/gentil" },
{ "de": "selbstgemacht", "pt": "caseiro" },
{ "de": "der Kuchen", "pt": "o bolo" },
{ "de": "von Herzen", "pt": "do coração" }]'::jsonb,
'[ "Regra de Ouro: Pessoa (Dativo) + Coisa (Acusativo).",
"Ex: Ich gebe DEM MANN (Dat) DAS BUCH (Akk).",
"Se houver pronomes: Pronome vem antes do substantivo.",
"Ordem de pronomes: Acusativo antes de Dativo (exceto ich/du).",
"Ex: Ich gebe ES (Akk) IHM (Dat).",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap29','a2-l29-2','A2','Dois Objetos: Dativo + Acusativo','Zwei Objekte: Dativ & Akkusativ',
'Verbos que pedem duas coisas: Para quem? (Dat) + O quê? (Akk). Verbos: geben, schenken, zeigen, sagen, kaufen.',
'Dat (pessoa) + Akk (coisa). Pronomes: dativo vem antes se ambos forem pronomes (exceto ich/du).',
'[{ "de": "Zeigst du mir das Foto?", "pt": "Você me mostra a foto?", "note": "mir (Dat) + Foto (Akk)" },
{ "de": "Ich sage dir die Wahrheit.", "pt": "Eu te digo a verdade.", "note": "dir (Dat) + Wahrheit (Akk)" },
{ "de": "Kaufst du ihm ein Auto?", "pt": "Você compra um carro para ele?", "note": "ihm (Dat) + Auto (Akk)" },
{ "de": "Ich bringe es dir.", "pt": "Eu trago para você.", "note": "es (Akk) + dir (Dat)" }]'::jsonb,
'[]'::jsonb,
'[ "VERBOS COM DOIS OBJETOS:",
"geben, schenken, kaufen, bringen, zeigen, sagen, schreiben, erzählen.",
"",
"ORDEM DOS SUBSTANTIVOS:",
"Sujeito + Verbo + DATIVO (Pessoa) + ACUSATIVO (Coisa).",
"Ex: Ich schenke MEINER MUTTER (Dat) EIN BUCH (Akk).",
"",
"ORDEM COM PRONOMES:",
"Se apenas um é pronome: Pronome vem primeiro.",
"Ex: Ich schenke IHR (Dat-Pron) EIN BUCH (Akk-Subst).",
"Ex: Ich schenke MEINER MUTTER (Dat-Subst) ES (Akk-Pron).",
"",
"SE AMBOS SÃO PRONOMES:",
"ACUSATIVO vem antes do DATIVO (exceto ich/du).",
"Ex: Ich gebe ES (Akk) IHM (Dat). (Eu dou isso a ele).",
"Exceção: Ich gebe DIR ES → Ich gebe ES DIR. (Para ich/du, o dativo pode vir primeiro ou segundo, mas ES DIR é mais comum).",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
2,true),

('a2-cap29','a2-l29-3','A2','Cultura: Presentes & Ocasiões','Kultur: Geschenke & Anlässe',
'Qualidade > Quantidade. Embrulho caprichado. Abrir na frente. Datas: aniversário, Natal, formatura, mudança.',
'Qualidade, Verpackung, Öffnen, Anlässe (Geburtstag, Hochzeit, Einschulung).',
'[{ "de": "das Geschenk", "pt": "o presente", "note": "objeto" },
{ "de": "die Verpackung", "pt": "a embalagem", "note": "apresentação" },
{ "de": "der Anlass", "pt": "a ocasião", "note": "motivo" }]'::jsonb,
'[]'::jsonb,
'[ "Presentes & Ocasiões na Alemanha:",
"",
"• Qualidade > Quantidade:",
"  Presentes práticos e bem pensados valem mais que itens caros e impessoais.",
"  Algo feito à mão (selbstgemacht) é muito valorizado.",
"",
"• Embalagem (Verpackung):",
"  Embrulhar com capricho demonstra respeito. Papel colorido e cartão escrito à mão.",
"",
"• Abrir na hora:",
"  É comum abrir o presente na frente de quem deu e agradecer imediatamente.",
"",
"• Ocasiões Comuns:",
"  Geburtstag (Aniversário), Weihnachten (Natal), Hochzeit (Casamento).",
"  Einschulung (Primeiro dia de aula) é único na Alemanha (Schultüte).",
"",
"• Dica Cultural:",
"  Agradeça com entusiasmo: 'Wie schön! Vielen Dank!'",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 30: Post und Bank – Formelle Situationen
-- ══════════════════════════════════════════════════
('a2-cap30','a2-l30-1','A2','Diálogo: Anna no correio e no banco','Dialog: Bei der Post und auf der Bank',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Kunde (Anna): Guten Tag! Ich möchte ein Paket nach Brasilien schicken.  
Angestellte (Post): Guten Tag! Gerne. Haben Sie das Paket schon verpackt?  
Anna: Ja, hier ist es. Es wiegt etwa zwei Kilo.  
Post: Danke. Möchten Sie es als Standard- oder Express-Sendung versenden?  
Anna: Was ist der Unterschied?  
Post: Standard dauert etwa 10–14 Werktage und kostet 25 Euro. Express dauert 3–5 Werktage und kostet 45 Euro.  
Anna: Dann nehme ich bitte Standard.  
Post: Sehr gerne. Füllen Sie bitte dieses Formular aus: Absender, Empfänger und Inhalt.  
Anna: Alles klar. *(füllt aus)* So, fertig.  
Post: Perfekt. Das macht 25 Euro, bitte. Möchten Sie mit Karte oder bar zahlen?  
Anna: Mit Karte, bitte.  
Post: Bitte hier unterschreiben. Danke! Hier ist Ihr Sendungscode. Damit können Sie das Paket online verfolgen.  
Anna: Vielen Dank! Und kann ich auch Briefmarken kaufen?  
Post: Natürlich. Für welchen Zweck?  
Anna: Für Postkarten nach Italien.  
Post: Dann brauchen Sie eine Europa-Briefmarke für 1,10 Euro. Wie viele möchten Sie?  
Anna: Zehn, bitte.  
Post: Das macht 11 Euro zusätzlich. Zusammen also 36 Euro.  
Anna: Hier, bitte. Danke für Ihre Hilfe!  
Post: Immer gerne! Einen schönen Tag noch!  
Anna: Ihnen auch! Auf Wiedersehen!  
*(Später in der Bank)*  
Anna: Guten Tag! Ich möchte Geld überweisen.  
Bankangestellter: Guten Tag! Gerne. Haben Sie die IBAN des Empfängers?  
Anna: Ja, hier ist sie.  
Bank: Und den Verwendungszweck?  
Anna: „Miete Mai 2024".  
Bank: Verstanden. Möchten Sie die Überweisung jetzt ausführen?  
Anna: Ja, bitte.  
Bank: Bitte bestätigen Sie mit Ihrer PIN. ... Fertig! Die Überweisung ist unterwegs.  
Anna: Vielen Dank! Kann ich auch einen Kontoauszug bekommen?  
Bank: Selbstverständlich. Hier, bitte. Brauchen Sie noch etwas?  
Anna: Nein, das war's. Danke und auf Wiedersehen!  
Bank: Auf Wiedersehen!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Cliente (Anna): Bom dia! Gostaria de enviar um pacote para o Brasil.  
Funcionária (Correios): Bom dia! Com prazer. A senhora já embalou o pacote?  
Anna: Sim, aqui está. Pesa cerca de dois quilos.  
Correios: Obrigada. A senhora gostaria de enviá-lo como remessa padrão ou expressa?  
Anna: Qual é a diferença?  
Correios: A padrão leva cerca de 10–14 dias úteis e custa 25 euros. A expressa leva 3–5 dias úteis e custa 45 euros.  
Anna: Então eu fico com a padrão, por favor.  
Correios: Com prazer. Preencha este formulário, por favor: remetente, destinatário e conteúdo.  
Anna: Tudo bem. *(preenche)* Pronto, terminei.  
Correios: Perfeito. São 25 euros, por favor. A senhora gostaria de pagar com cartão ou em dinheiro?  
Anna: Com cartão, por favor.  
Correios: Assine aqui, por favor. Obrigada! Aqui está seu código de rastreamento. Com ele, a senhora pode acompanhar o pacote online.  
Anna: Muito obrigada! E posso também comprar selos?  
Correios: Naturalmente. Para qual finalidade?  
Anna: Para cartões-postais para a Itália.  
Correios: Então a senhora precisa de um selo Europa por 1,10 euro. Quantos a senhora gostaria?  
Anna: Dez, por favor.  
Correios: Isso dá 11 euros adicionais. No total, 36 euros.  
Anna: Aqui, por favor. Obrigada pela ajuda!  
Correios: Por nada! Tenha um bom dia!  
Anna: Para a senhora também! Até logo!  
*(Mais tarde, no banco)*  
Anna: Bom dia! Gostaria de fazer uma transferência.  
Funcionário (Banco): Bom dia! Com prazer. A senhora tem o IBAN do destinatário?  
Anna: Sim, aqui está.  
Banco: E a finalidade da transferência?  
Anna: „Aluguel maio 2024".  
Banco: Entendido. A senhora gostaria de executar a transferência agora?  
Anna: Sim, por favor.  
Banco: Por favor, confirme com sua senha. ... Pronto! A transferência está a caminho.  
Anna: Muito obrigada! Posso também receber um extrato bancário?  
Banco: Naturalmente. Aqui, por favor. Precisa de mais alguma coisa?  
Anna: Não, era só isso. Obrigada e até logo!  
Banco: Até logo!',
'Linguagem formal (Sie). Verbos funcionais: versenden, ausfüllen, unterschreiben, überweisen. Konjunktiv II para educação.',
'[{ "de": "Ich möchte ein Paket versenden.", "pt": "Gostaria de enviar um pacote.", "note": "formal" },
{ "de": "Füllen Sie das Formular aus.", "pt": "Preencha o formulário.", "note": "imperativo formal" },
{ "de": "Ich möchte Geld überweisen.", "pt": "Gostaria de transferir dinheiro.", "note": "banco" },
{ "de": "Könnten Sie mir bitte helfen?", "pt": "Poderia me ajudar?", "note": "pedido educado" }]'::jsonb,
'[{ "de": "die Post", "pt": "o correio" },
{ "de": "die Bank", "pt": "o banco" },
{ "de": "der Kunde", "pt": "o cliente" },
{ "de": "das Paket", "pt": "o pacote" },
{ "de": "schicken/versenden", "pt": "enviar" },
{ "de": "wiegen", "pt": "pesar" },
{ "de": "die Sendung", "pt": "a remessa" },
{ "de": "der Werktag", "pt": "o dia útil" },
{ "de": "kosten", "pt": "custar" },
{ "de": "das Formular", "pt": "o formulário" },
{ "de": "ausfüllen", "pt": "preencher" },
{ "de": "der Absender", "pt": "o remetente" },
{ "de": "der Empfänger", "pt": "o destinatário" },
{ "de": "unterschreiben", "pt": "assinar" },
{ "de": "der Sendungscode", "pt": "código de rastreamento" },
{ "de": "verfolgen", "pt": "rastrear" },
{ "de": "die Briefmarke", "pt": "o selo" },
{ "de": "überweisen", "pt": "transferir (dinheiro)" },
{ "de": "die IBAN", "pt": "a IBAN" },
{ "de": "der Verwendungszweck", "pt": "finalidade" },
{ "de": "die Miete", "pt": "o aluguel" },
{ "de": "ausführen", "pt": "executar" },
{ "de": "bestätigen", "pt": "confirmar" },
{ "de": "der Kontoauszug", "pt": "o extrato" }]'::jsonb,
'[ "Formalidade: Use sempre 'Sie' (maiúsculo) e 'bitte/Danke'.",
"Verbos Funcionais: versenden (enviar), ausfüllen (preencher), unterschreiben (assinar), überweisen (transferir).",
"Konjunktiv II para pedidos: 'Ich möchte...', 'Könnten Sie...?', 'Ich hätte gern...'.",
"Dinheiro vs Cartão: 'Bar zahlen' ainda é comum, mas cartão é aceito quase sempre.",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap30','a2-l30-2','A2','Linguagem Formal e Verbos Funcionais','Formelle Sprache & Funktionsverben',
'Situações formais exigem 'Sie', 'bitte', e verbos específicos. Konjunktiv II (möchten, könnten) para suavizar.',
'Sie + bitte + Danke. Möchten/Könnten. Verbos: ausfüllen, unterschreiben, überweisen.',
'[{ "de": "Könnten Sie das bitte unterschreiben?", "pt": "Poderia assinar isso, por favor?", "note": "pedido formal" },
{ "de": "Ich hätte gern zehn Briefmarken.", "pt": "Eu gostaria de dez selos.", "note": "desejo formal" },
{ "de": "Bitte füllen Sie das Formular aus.", "pt": "Por favor, preencha o formulário.", "note": "instrução" },
{ "de": "Die Überweisung ist unterwegs.", "pt": "A transferência está a caminho.", "note": "status" }]'::jsonb,
'[]'::jsonb,
'[ "LINGUAGEM FORMAL (SIE):",
"Sempre use 'Sie' (com S maiúsculo) com desconhecidos e em instituições.",
"Acompanhe de 'bitte' (pedidos) e 'Danke' (agradecimentos).",
"",
"KONJUNKTIV II NA FORMALIDADE:",
"Suaviza pedidos e desejos.",
"Não diga 'Ich will...', diga 'Ich möchte...'.",
"Não diga 'Können Sie...?', diga 'Könnten Sie bitte...?'.",
"",
"VERBOS FUNCIONAIS COMUNS:",
"versenden (enviar remessa), ausfüllen (preencher formulário),",
"unterschreiben (assinar), überweisen (transferir dinheiro),",
"bestätigen (confirmar), verfolgen (rastrear).",
"",
"ESTRUTURA DE FRASES FUNCIONAIS:",
"Imperativo Formal: Verbo + Sie + ... + bitte.",
"Ex: Unterschreiben Sie bitte hier.",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
2,true),

('a2-cap30','a2-l30-3','A2','Cultura: Burocracia & Dinheiro na Alemanha','Kultur: Bürokratie & Geld',
'Correios (DHL) e Bancos: horários curtos. Dinheiro vivo (Bar) ainda é rei. Formulários sagrados. Educação formal.',
'Deutsche Post, Banköffnungszeiten, Bargeld, Formulare, Höflichkeit.',
'[{ "de": "das Bargeld", "pt": "o dinheiro vivo", "note": "pagamento" },
{ "de": "der Geldautomat", "pt": "o caixa eletrônico", "note": "banco" },
{ "de": "die Bürokratie", "pt": "a burocracia", "note": "sistema" }]'::jsonb,
'[]'::jsonb,
'[ "Burocracia & Dinheiro na Alemanha:",
"",
"• Correios (Deutsche Post/DHL):",
"  Eficientes e onipresentes. Também vendem selos e fazem câmbio.",
"",
"• Bancos e Horários:",
"  Agências fecham cedo (16h) e não abrem aos sábados.",
"  Caixas eletrônicos (Geldautomat) funcionam 24h.",
"",
"• Dinheiro é Rei (Bargeld):",
"  Muitos lugares pequenos só aceitam dinheiro.",
"  Sempre tenha euros em cédulas na carteira.",
"",
"• Formulários são Sagrados:",
"  Erros podem atrasar processos. Use caneta preta e revise.",
"  Anote nomes, números de protocolo e prazos.",
"",
"• Educação Formal:",
"  O uso de 'Sie' e 'bitte' é obrigatório para ser bem atendido.",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
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
-- CAPÍTULO 31: Dativ im Alltag – Beziehungen ausdrücken
-- ══════════════════════════════════════════════════
('a2-cap31','a2-l31-1','A2','Diálogo: Ben ajuda a irmã na mudança','Dialog: Hilfe beim Umzug',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Clara: Hey Ben, wie war dein Tag?  
Ben: Ganz gut, danke! Ich habe heute meiner Schwester beim Umzug geholfen.  
Clara: Das ist lieb von dir! Wo wohnt sie jetzt?  
Ben: Sie wohnt jetzt in der Nähe vom Hauptbahnhof. Die Wohnung ist klein, aber gemütlich.  
Clara: Hast du ihr beim Einrichten geholfen?  
Ben: Ja, natürlich! Ich habe ihr die Möbel getragen und ihr beim Aufhängen der Bilder geholfen.  
Clara: Das war sicher anstrengend. Was hast du danach gemacht?  
Ben: Ich bin mit meinen Freunden ins Café gegangen. Wir haben uns über die Arbeit unterhalten.  
Clara: Und was macht dein Freund Markus?  
Ben: Ihm geht es gut, danke der Nachfrage! Er arbeitet gerade an einem neuen Projekt.  
Clara: Sag mal, hast du schon mit deiner Chefin über den Urlaub gesprochen?  
Ben: Ja, ich habe ihr letzte Woche davon erzählt. Sie hat mir erlaubt, zwei Wochen im August frei zu nehmen.  
Clara: Das ist super! Wohin fährst du?  
Ben: Ich fahre mit meiner Familie an die Ostsee. Den Kindern wird das sicher gefallen.  
Clara: Das glaube ich gern! Die Ostsee ist im Sommer wunderschön.  
Ben: Stimmt. Und was machst du am Wochenende?  
Clara: Ich treffe mich mit meiner Tante. Sie kommt aus Österreich zu Besuch. Ich zeige ihr die Stadt und koche für sie.  
Ben: Das klingt nach einem schönen Plan! Grüß sie bitte von mir!  
Clara: Mache ich! Und danke dir für das Gespräch.  
Ben: Immer gerne! Bis bald!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Clara: Oi Ben, como foi seu dia?  
Ben: Muito bom, obrigado! Hoje ajudei minha irmã na mudança.  
Clara: Que gentil da sua parte! Onde ela mora agora?  
Ben: Ela mora agora perto da estação central. O apartamento é pequeno, mas aconchegante.  
Clara: Você ajudou ela na decoração?  
Ben: Sim, claro! Carreguei os móveis para ela e ajudei a pendurar os quadros.  
Clara: Deve ter sido cansativo. O que você fez depois?  
Ben: Fui ao café com meus amigos. Conversamos sobre o trabalho.  
Clara: E como está seu amigo Markus?  
Ben: Ele está bem, obrigado por perguntar! Ele está trabalhando em um novo projeto.  
Clara: Diz aí, você já conversou com sua chefe sobre as férias?  
Ben: Sim, contei a ela na semana passada. Ela me permitiu tirar duas semanas de folga em agosto.  
Clara: Isso é ótimo! Para onde você vai?  
Ben: Vou com minha família para o Mar Báltico. As crianças vão adorar, com certeza.  
Clara: Acredito! O Mar Báltico é lindo no verão.  
Ben: Verdade. E o que você vai fazer no fim de semana?  
Clara: Vou me encontrar com minha tia. Ela vem da Áustria me visitar. Vou mostrar a cidade para ela e cozinhar para ela.  
Ben: Parece um plano legal! Mande lembranças minhas para ela, por favor!  
Clara: Vou mandar! E obrigada pela conversa.  
Ben: Por nada! Até logo!',
'Dativo com verbos (helfen, danken, gefallen) e preposições fixas (mit, zu, von, aus).',
'[{ "de": "Ich helfe meiner Schwester.", "pt": "Eu ajudo minha irmã.", "note": "helfen + dativo" },
{ "de": "Das Buch gehört mir.", "pt": "O livro pertence a mim.", "note": "gehören + dativo" },
{ "de": "Ich gehe zu meinem Freund.", "pt": "Vou ao meu amigo.", "note": "zu + dativo" },
{ "de": "Die Suppe schmeckt den Kindern.", "pt": "A sopa agrada às crianças.", "note": "schmecken + dativo" }]'::jsonb,
'[{ "de": "helfen", "pt": "ajudar (+ dativo)" },
{ "de": "danken", "pt": "agradecer (+ dativo)" },
{ "de": "gefallen", "pt": "agradar (+ dativo)" },
{ "de": "gehören", "pt": "pertencer (+ dativo)" },
{ "de": "mit", "pt": "com (+ dativo)" },
{ "de": "zu", "pt": "para/a (+ dativo)" },
{ "de": "von", "pt": "de (+ dativo)" },
{ "de": "aus", "pt": "de/origem (+ dativo)" },
{ "de": "seit", "pt": "desde (+ dativo)" },
{ "de": "nach", "pt": "para/segundo (+ dativo)" },
{ "de": "bei", "pt": "perto de/na casa de (+ dativo)" },
{ "de": "gegenüber", "pt": "em frente a (+ dativo)" },
{ "de": "in der Nähe von", "pt": "perto de" },
{ "de": "der Umzug", "pt": "a mudança" },
{ "de": "einrichten", "pt": "mobiliar, decorar" },
{ "de": "tragen", "pt": "carregar" },
{ "de": "die Nachfrage", "pt": "a pergunta/interesse" },
{ "de": "das Projekt", "pt": "o projeto" },
{ "de": "erlauben", "pt": "permitir" },
{ "de": "die Ostsee", "pt": "o Mar Báltico" },
{ "de": "grüßen", "pt": "mandar lembranças" },
{ "de": "der Besuch", "pt": "a visita" },
{ "de": "kochen", "pt": "cozinhar" }]'::jsonb,
'[ "Verbos com Dativo: ajudar (helfen), agradecer (danken), pertencer (gehören), agradar (gefallen).",
"Preposições com Dativo: aus, bei, mit, nach, seit, von, zu, gegenüber.",
"Dica: Ich helfe DIR (não dich). Das gehört MIR (não mich).",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap31','a2-l31-2','A2','Dativo: Verbos e Preposições Essenciais','Dativ mit Verben und Präpositionen',
'Aprofundamento no dativo. Foco em verbos regenciais e preposições de origem e direção.',
'Verbos: helfen, danken, glauben, antworten. Preposições: aus, bei, mit, nach, seit, von, zu.',
'[{ "de": "Ich antworte der Chefin.", "pt": "Respondo à chefe.", "note": "antworten + dativo" },
{ "de": "Ich komme aus Brasilien.", "pt": "Venho do Brasil.", "note": "aus + dativo" },
{ "de": "Ich wohne bei meinen Eltern.", "pt": "Moro com meus pais.", "note": "bei + dativo" },
{ "de": "Seit 2020 wohne ich hier.", "pt": "Moro aqui desde 2020.", "note": "seit + dativo" }]'::jsonb,
'[]'::jsonb,
'[ "VERBOS QUE PEDEM DATIVO:",
"helfen (ajudar), danken (agradecer), gefallen (agradar),",
"gehören (pertencer), antworten (responder), glauben (acreditar).",
"",
"PREPOSIÇÕES COM DATIVO (Lista A2):",
"aus (origem), bei (na casa de), mit (instrumento/companhia),",
"nach (direção/cidades), seit (tempo), von (posse), zu (destino).",
"",
"EXEMPLOS PRÁTICOS:",
"• Ich fahre MIT dem Bus. (instrumento)",
"• Ich gehe ZU meiner Oma. (pessoa)",
"• Das Geschenk ist VON meinem Bruder. (posse)",
"• Er kommt AUS Spanien. (origem)" ]'::jsonb,
2,true),

('a2-cap31','a2-l31-3','A2','Cultura: Interação Social e Solidariedade','Kultur: Soziale Interaktion',
'Ajudar é valorizado. Dativo na posse corporal (Ich wasche mir die Hände).',
'Oferecer ajuda, agradecer formalmente, posse indireta.',
'[{ "de": "Kann ich dir helfen?", "pt": "Posso te ajudar?", "note": "solidariedade" },
{ "de": "Ich wasche mir die Hände.", "pt": "Lavo minhas mãos.", "note": "dativo reflexivo" },
{ "de": "Das gehört mir.", "pt": "Isso é meu.", "note": "posse" }]'::jsonb,
'[]'::jsonb,
'[ "Interação Social na Alemanha:",
"",
"• Ajudar é natural:",
"  Oferecer ajuda prática é sinal de boa educação.",
"",
"• Posse Indireta (Corpo/Roupas):",
"  Alemães usam dativo para partes do corpo e itens pessoais.",
"  Correto: Ich wasche MIR die Hände. (Não: meine Hände)",
"  Correto: Er putzt SICH die Zähne.",
"",
"• Agradecimento:",
"  Ich danke DIR. (Dativo explícito)",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 32: Besitz und Beziehungen – Genitiv verstehen
-- ══════════════════════════════════════════════════
('a2-cap32','a2-l32-1','A2','Diálogo: Laura e Felix falam sobre livros e carros','Dialog: Über Besitz sprechen',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Laura: Hey Felix, hast du das neue Buch von Sarah Kuttner gelesen?  
Felix: Nein, noch nicht. Ist es das Buch über die Jugend von heute?  
Laura: Genau! Die Autorin beschreibt die Welt der jungen Erwachsenen sehr treffend.  
Felix: Klingt interessant! Wessen Buch liest du gerade?  
Laura: Ich lese gerade den Roman von Juli Zeh. Der Titel ist „Unter Menschen".  
Felix: Ah, ich kenne den! Die Sprache von Juli Zeh ist sehr klar und direkt.  
Laura: Stimmt. Sag mal, wessen Auto steht da vor dem Haus?  
Felix: Das ist das Auto von meinem Nachbarn. Er ist gerade im Urlaub.  
Laura: Und wessen Hund bellt da so laut?  
Felix: Das ist der Hund von Frau Müller aus dem dritten Stock. Der kleine Max ist sehr energisch!  
Laura: Haha, ich merke es! Übrigens, hast du die Kontaktdaten von der neuen Kollegin?  
Felix: Ja, hier ist die E-Mail-Adresse von Anna Schmidt. Sie arbeitet im Marketing.  
Laura: Perfekt, danke! Und wessen Idee war das Team-Event nächste Woche?  
Felix: Das war die Idee von unserem Chef, Herrn Weber. Er möchte, dass wir uns besser kennenlernen.  
Laura: Das ist eine gute Initiative! Die Meinung von Herrn Weber ist oft sehr weitsichtig.  
Felix: Absolut. Sag mal, hast du schon mit der Freundin von deinem Bruder gesprochen?  
Laura: Ja, letzte Woche. Die Freundin von Markus heißt Lena und studiert Medizin.  
Felix: Spannend! Vielleicht können wir uns mal zu viert treffen?  
Laura: Gerne! Ich frage mal bei Markus und Lena nach.  
Felix: Super! Dann bis bald!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Laura: Oi Felix, você leu o novo livro da Sarah Kuttner?  
Felix: Não, ainda não. É o livro sobre a juventude de hoje?  
Laura: Exato! A autora descreve o mundo dos jovens adultos de forma muito precisa.  
Felix: Parece interessante! De quem é o livro que você está lendo agora?  
Laura: Estou lendo o romance da Juli Zeh. O título é „Unter Menschen".  
Felix: Ah, eu conheço! A linguagem da Juli Zeh é muito clara e direta.  
Laura: Verdade. Diz aí, de quem é o carro que está ali em frente à casa?  
Felix: É o carro do meu vizinho. Ele está de férias.  
Laura: E de quem é o cachorro que está latindo tão alto?  
Felix: É o cachorro da Sra. Müller do terceiro andar. O pequeno Max é muito energético!  
Laura: Haha, estou percebendo! Aliás, você tem os contatos da nova colega?  
Felix: Sim, aqui está o e-mail da Anna Schmidt. Ela trabalha no marketing.  
Laura: Perfeito, obrigada! E de quem foi a ideia do evento da equipe na semana que vem?  
Felix: Foi ideia do nosso chefe, Sr. Weber. Ele quer que nos conheçamos melhor.  
Laura: Essa é uma boa iniciativa! A opinião do Sr. Weber é frequentemente muito visionária.  
Felix: Absolutamente. Diz aí, você já conversou com a namorada do seu irmão?  
Laura: Sim, semana passada. A namorada do Markus se chama Lena e estuda medicina.  
Felix: Interessante! Talvez possamos nos encontrar os quatro alguma vez?  
Laura: Com prazer! Vou perguntar ao Markus e à Lena.  
Felix: Ótimo! Então até logo!',
'Genitivo vs „von" + Dativo. Pergunta: Wessen? (De quem?). Posse e origem.',
'[{ "de": "Das Auto von meinem Nachbarn.", "pt": "O carro do meu vizinho.", "note": "von + dativo" },
{ "de": "Die Sprache der Autorin.", "pt": "A linguagem da autora.", "note": "genitivo" },
{ "de": "Wessen Buch ist das?", "pt": "De quem é este livro?", "note": "wessen" },
{ "de": "Die Idee unseres Chefs.", "pt": "A ideia do nosso chefe.", "note": "genitivo" }]'::jsonb,
'[{ "de": "der Besitz", "pt": "a posse" },
{ "de": "die Beziehung", "pt": "a relação" },
{ "de": "der Genitiv", "pt": "o genitivo" },
{ "de": "wessen?", "pt": "de quem?" },
{ "de": "die Autorin", "pt": "a autora" },
{ "de": "die Jugend", "pt": "a juventude" },
{ "de": "der Erwachsene", "pt": "o adulto" },
{ "de": "treffend", "pt": "preciso, acertado" },
{ "de": "der Roman", "pt": "o romance" },
{ "de": "der Titel", "pt": "o título" },
{ "de": "die Sprache", "pt": "a linguagem/língua" },
{ "de": "klar", "pt": "claro" },
{ "de": "direkt", "pt": "direto" },
{ "de": "das Auto", "pt": "o carro" },
{ "de": "der Nachbar / die Nachbarin", "pt": "o vizinho / a vizinha" },
{ "de": "der Urlaub", "pt": "as férias" },
{ "de": "der Hund", "pt": "o cachorro" },
{ "de": "bellen", "pt": "latir" },
{ "de": "energisch", "pt": "energético" },
{ "de": "die Kontaktdaten", "pt": "os dados de contato" },
{ "de": "die Kollegin", "pt": "a colega" },
{ "de": "die E-Mail-Adresse", "pt": "o endereço de e-mail" },
{ "de": "das Marketing", "pt": "o marketing" },
{ "de": "die Idee", "pt": "a ideia" },
{ "de": "das Team-Event", "pt": "o evento da equipe" },
{ "de": "der Chef / die Chefin", "pt": "o chefe / a chefe" },
{ "de": "weitsichtig", "pt": "visionário" },
{ "de": "die Meinung", "pt": "a opinião" },
{ "de": "die Freundin", "pt": "a namorada/amiga" },
{ "de": "studieren", "pt": "estudar (superior)" },
{ "de": "die Medizin", "pt": "a medicina" },
{ "de": "spannend", "pt": "empolgante" },
{ "de": "zu viert", "pt": "em quatro (pessoas)" }]'::jsonb,
'[ "Wessen? = De quem? (Genitivo)",
"Resposta com 'von': Das ist das Buch von Maria.",
"Resposta Genitiva: Das ist Marias Buch. / Das Buch der Maria.",
"Regra Genitivo: Masc/Neutro + (e)s | Fem/Plural + (nenhuma mudança de artigo, mas adjetivos flexionam).",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap32','a2-l32-2','A2','Genitivo vs "von + Dativo" e "Wessen?"','Genitiv und Possessivformen',
'Uso formal (Genitivo) vs Informal (von + Dativo). Estrutura da frase com posse.',
'Wessen...? (Genitivo). Informal: ...von + Dativo. Formal: ...Genitivo (-s/-es).',
'[{ "de": "Das ist das Auto meines Bruders.", "pt": "Esse é o carro do meu irmão.", "note": "genitivo formal" },
{ "de": "Das ist das Auto von meinem Bruder.", "pt": "Esse é o carro do meu irmão.", "note": "von + dativo (informal)" },
{ "de": "Die Meinung des Chefs.", "pt": "A opinião do chefe.", "note": "des Chefs" },
{ "de": "Die Tasche der Frau.", "pt": "A bolsa da mulher.", "note": "der Frau" }]'::jsonb,
'[]'::jsonb,
'[ "FORMAS DE EXPRESSAR POSSE:",
"",
"1. INFORMAL (Fala cotidiana): VON + DATIVO",
"   Das Handy von meinem Vater.",
"",
"2. FORMAL (Escrita/Textos): GENITIVO",
"   Masculino/Neutro: des + (e)s → das Auto des Mannes.",
"   Feminino: der → die Tasche der Frau.",
"   Plural: der → die Schuhe der Kinder.",
"",
"PERGUNTAR POSSE:",
"• Wessen Buch ist das? (Genitivo)",
"• Von wem ist das Buch? (Alternativa com von)",
"",
"DICA: No A2, priorize 'von + dativo' na fala e reconheça o genitivo na leitura.",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
2,true),

('a2-cap32','a2-l32-3','A2','Cultura: Posse e Nomes Próprios','Kultur: Besitz & Namen',
'Genitivo em declínio na fala. Nomes próprios com 's'. Wessen? formal.',
'Genitivo falado vs escrito. Nomes com 's' (Annas Buch).',
'[{ "de": "Annas Auto", "pt": "O carro da Anna", "note": "nome + s" },
{ "de": "Wessen ist das?", "pt": "De quem é isso?", "note": "genitivo puro" },
{ "de": "Die Werke Goethes", "pt": "As obras de Goethe", "note": "literatura" }]'::jsonb,
'[]'::jsonb,
'[ "Posse e Nomes na Alemanha:",
"",
"• Genitivo na Fala:",
"  Na fala cotidiana, muitos alemães substituem o genitivo por 'von'.",
"  Não é 'erro', é evolução natural da língua.",
"",
"• Nomes Próprios:",
"  É comum usar o Genitivo com nomes: Annas Buch, Peters Auto.",
"  Essa estrutura é aceita tanto na fala quanto na escrita.",
"",
"• Literatura e Cultura:",
"  Em contextos cultos, o genitivo é obrigatório: 'Die Werke Goethes'.",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 33: Gründe und Aussagen – Sätze mit „dass" e „weil"
-- ══════════════════════════════════════════════════
('a2-cap33','a2-l33-1','A2','Diálogo: Nina e Tom falam sobre motivação','Dialog: Gründe und Meinungen',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Nina: Hey Tom, warum lernst du eigentlich Deutsch?  
Tom: Ich lerne Deutsch, weil ich nächstes Jahr in Berlin studieren möchte.  
Nina: Das ist ein guter Grund! Glaubst du, dass du dann schnell Freunde findest?  
Tom: Ich hoffe, dass das klappt. Ich weiß, dass Deutsche oft direkt sind, aber ich finde, dass das auch ehrlich ist.  
Nina: Stimmt! Ich finde es wichtig, dass man die Kultur versteht, bevor man umzieht.  
Tom: Genau! Sag mal, warum hast du damals Spanisch gelernt?  
Nina: Ich habe Spanisch gelernt, weil ich gerne nach Südamerika reisen wollte. Und ich finde, dass Spanisch eine sehr schöne Sprache ist.  
Tom: Das glaube ich dir! Meinst du, dass es schwer ist, eine neue Sprache zu lernen?  
Nina: Ich denke, dass es am Anfang schwierig ist, aber dass es mit der Zeit leichter wird.  
Tom: Das motiviert mich! Ich weiß, dass ich viel üben muss, aber ich bin bereit, dass ich jeden Tag lerne.  
Nina: Super! Übrigens, hast du schon gehört, dass es einen neuen Deutschkurs an der Volkshochschule gibt?  
Tom: Wirklich? Ich hoffe, dass ich noch einen Platz bekomme.  
Nina: Ich glaube, dass du dich anmelden solltest. Der Kurs beginnt nächste Woche.  
Tom: Danke für den Tipp! Ich werde mich heute noch informieren.  
Nina: Gerne! Und sag Bescheid, ob du mitmachen möchtest.  
Tom: Mache ich! Danke, dass du mir hilfst.  
Nina: Immer gerne! Wir können ja zusammen üben.  
Tom: Perfekt! Dann bis bald!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Nina: Oi Tom, por que você está aprendendo alemão, aliás?  
Tom: Estou aprendendo alemão porque quero estudar em Berlim no ano que vem.  
Nina: Esse é um bom motivo! Você acha que vai fazer amigos rápido depois?  
Tom: Espero que sim. Sei que os alemães frequentemente são diretos, mas acho que isso também é honesto.  
Nina: Verdade! Acho importante que a gente entenda a cultura antes de se mudar.  
Tom: Exato! Diz aí, por que você aprendeu espanhol naquela época?  
Nina: Aprendi espanhol porque queria viajar para a América do Sul. E acho que o espanhol é uma língua muito bonita.  
Tom: Acredito em você! Você acha que é difícil aprender uma nova língua?  
Nina: Acho que no começo é difícil, mas que com o tempo fica mais fácil.  
Tom: Isso me motiva! Sei que preciso praticar muito, mas estou pronto para aprender todos os dias.  
Nina: Ótimo! Aliás, você já ouviu que há um novo curso de alemão na escola popular (*Volkshochschule*)?  
Tom: Sério? Espero conseguir uma vaga.  
Nina: Acho que você deveria se inscrever. O curso começa na semana que vem.  
Tom: Obrigado pela dica! Vou me informar ainda hoje.  
Nina: Por nada! E me avise se você quer participar.  
Tom: Vou avisar! Obrigado por me ajudar.  
Nina: Por nada! Podemos praticar juntos, afinal.  
Tom: Perfeito! Então até logo!',
'Orações subordinadas com "weil" (causa) e "dass" (conteúdo/opinião). Verbo no final.',
'[{ "de": "Ich lerne Deutsch, weil ich studieren möchte.", "pt": "Aprendo alemão porque quero estudar.", "note": "weil + verbo final" },
{ "de": "Ich glaube, dass du recht hast.", "pt": "Acredito que você tem razão.", "note": "dass + verbo final" },
{ "de": "Ich hoffe, dass es klappt.", "pt": "Espero que dê certo.", "note": "dass" },
{ "de": "Er sagt, dass er müde ist.", "pt": "Ele diz que está cansado.", "note": "dass" }]'::jsonb,
'[{ "de": "der Grund", "pt": "o motivo" },
{ "de": "die Aussage", "pt": "a afirmação" },
{ "de": "dass", "pt": "que (conjunção)" },
{ "de": "weil", "pt": "porque (conjunção)" },
{ "de": "studieren", "pt": "estudar (superior)" },
{ "de": "hoffen", "pt": "esperar, torcer" },
{ "de": "glauben", "pt": "acreditar" },
{ "de": "finden", "pt": "achar, considerar" },
{ "de": "wissen", "pt": "saber" },
{ "de": "meinen", "pt": "opinar" },
{ "de": "denken", "pt": "pensar, achar" },
{ "de": "direkt", "pt": "direto" },
{ "de": "ehrlich", "pt": "honesto" },
{ "de": "die Kultur", "pt": "a cultura" },
{ "de": "verstehen", "pt": "entender" },
{ "de": "umziehen", "pt": "mudar-se" },
{ "de": "Südamerika", "pt": "América do Sul" },
{ "de": "die Sprache", "pt": "a língua" },
{ "de": "schön", "pt": "bonito" },
{ "de": "schwierig", "pt": "difícil" },
{ "de": "mit der Zeit", "pt": "com o tempo" },
{ "de": "üben", "pt": "praticar" },
{ "de": "bereit", "pt": "pronto, disposto" },
{ "de": "die Volkshochschule", "pt": "escola popular (cursos)" },
{ "de": "der Platz", "pt": "a vaga, lugar" },
{ "de": "sich anmelden", "pt": "inscrever-se" },
{ "de": "der Kurs", "pt": "o curso" },
{ "de": "beginnen", "pt": "começar" },
{ "de": "der Tipp", "pt": "a dica" },
{ "de": "sich informieren", "pt": "informar-se" },
{ "de": "Bescheid sagen", "pt": "avisar" },
{ "de": "mitmachen", "pt": "participar" },
{ "de": "zusammen", "pt": "juntos" }]'::jsonb,
'[ "Regra de Ouro: 'weil' e 'dass' jogam o VERBO CONJUGADO para o FINAL da oração.",
"Weil ich Deutsch lerne (não: weil ich lerne Deutsch).",
"Dass du recht hast (não: dass du hast recht).",
"Vírgula obrigatória antes de 'weil' e 'dass'.",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap33','a2-l33-2','A2','Orações Subordinadas: "weil" e "dass"','Nebensätze mit weil und dass',
'Estrutura da oração subordinada. Conectivos de causa e opinião.',
'Sujeito + Conjuntivo (weil/dass) + ... + Verbo Final.',
'[{ "de": "Ich bleibe zu Hause, weil es regnet.", "pt": "Fico em casa porque está chovendo.", "note": "causa" },
{ "de": "Er sagt, dass er krank ist.", "pt": "Ele diz que está doente.", "note": "fato/afirmação" },
{ "de": "Ich weiß, dass du kommst.", "pt": "Eu sei que você vem.", "note": "conhecimento" },
{ "de": "Weil ich müde bin, gehe ich schlafen.", "pt": "Como estou cansado, vou dormir.", "note": "inversão" }]'::jsonb,
'[]'::jsonb,
'[ "ESTRUTURA COM WEIL (Porque):",
"• Explica o motivo.",
"• Ich lerne Deutsch, WEIL ich in Berlin studieren MÖCHTE.",
"• Se a oração com WEIL vier primeiro, o verbo principal vem na posição 2.",
"  WEIL ich in Berlin studieren möchte, LERNE ich Deutsch.",
"",
"ESTRUTURA COM DASS (Que):",
"• Após verbos de opinião/fato (sagen, glauben, wissen, hoffen).",
"• Ich hoffe, DASS der Kurs gut IST.",
"• Ich weiß, DASS du Deutsch LERNST.",
"",
"ATENÇÃO: Não confunda com 'denn' (que mantém o verbo na posição 2).",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
2,true),

('a2-cap33','a2-l33-3','A2','Cultura: Justificativas e Opiniões','Kultur: Begründungen & Meinung',
'Justificar é educado. Opinião com modéstia (Ich finde, dass...). Volkshochschule (VHS).',
'Justificar ações, expressar opinião suavemente, cursos populares.',
'[{ "de": "Ich mache das, weil...", "pt": "Faço isso porque...", "note": "justificativa" },
{ "de": "Ich finde, dass...", "pt": "Acho que...", "note": "opinião" },
{ "de": "die Volkshochschule", "pt": "escola popular (VHS)", "note": "educação" }]'::jsonb,
'[]'::jsonb,
'[ "Justificativas e Opinião na Alemanha:",
"",
"• Justificar é sinal de respeito:",
"  Explicar o 'Warum?' demonstra transparência.",
"",
"• Opinião com modéstia:",
"  Use 'Ich finde, dass...' ou 'Ich denke, dass...' em vez de afirmações absolutas.",
"  Isso soa mais aberto ao diálogo.",
"",
"• Volkshochschule (VHS):",
"  Instituição pública com cursos baratos para adultos (idiomas, cultura).",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 34: Bedingungen und Fragen – „wenn" und „ob"
-- ══════════════════════════════════════════════════
('a2-cap34','a2-l34-1','A2','Diálogo: Lisa e Mark planejam férias na Noruega','Dialog: Urlaub in Norwegen planen',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Lisa: Hey Mark, hast du schon Pläne für den Sommer?  
Mark: Noch nicht genau. Ich überlege, ob ich eine Reise machen soll.  
Lisa: Das klingt spannend! Wohin möchtest du fahren?  
Mark: Ich würde gerne nach Skandinavien fahren, wenn ich genug Geld spare.  
Lisa: Wenn du früh buchst, sind die Flüge oft günstiger. Hast du schon Preise verglichen?  
Mark: Ja, aber ich bin mir nicht sicher, ob ich mir die Reise leisten kann.  
Lisa: Wenn du möchtest, kann ich dir helfen, ein Budget zu planen.  
Mark: Das wäre toll! Sag mal, weißt du, ob es in Norwegen im Sommer viel regnet?  
Lisa: Ich glaube, dass es im Norden öfter regnet, aber wenn du an die Küste fährst, ist das Wetter oft schön.  
Mark: Gut zu wissen! Ich frage mich auch, ob ich einen Mietwagen brauche oder ob die öffentlichen Verkehrsmittel ausreichen.  
Lisa: Wenn du die Natur erkunden möchtest, ist ein Auto praktisch. Aber wenn du nur in den Städten bleibst, reichen Bus und Bahn.  
Mark: Stimmt. Und weißt du, ob man in Norwegen gut Englisch sprechen kann?  
Lisa: Ja, die meisten Norweger sprechen sehr gut Englisch. Aber wenn du ein paar Worte Norwegisch lernst, freuen sich die Leute!  
Mark: Das ist ein guter Tipp! Ich überlege, ob ich vor der Reise einen Sprachkurs mache.  
Lisa: Wenn du Zeit hast, wäre das super! Und falls du Fragen hast, kannst du mich jederzeit fragen.  
Mark: Danke, Lisa! Wenn ich alles geplant habe, lade ich dich auf einen Kaffee ein und erzähle dir davon.  
Lisa: Abgemacht! Ich freue mich schon darauf.

---

**TRADUÇÃO EM PORTUGUÊS:**  
Lisa: Oi Mark, você já tem planos para o verão?  
Mark: Ainda não exatamente. Estou pensando se devo fazer uma viagem.  
Lisa: Isso parece empolgante! Para onde você quer ir?  
Mark: Eu gostaria de ir à Escandinávia, se eu economizar dinheiro suficiente.  
Lisa: Se você reservar com antecedência, os voos costumam ser mais baratos. Você já comparou preços?  
Mark: Sim, mas não tenho certeza se posso pagar pela viagem.  
Lisa: Se você quiser, posso te ajudar a planejar um orçamento.  
Mark: Isso seria ótimo! Diz aí, você sabe se chove muito na Noruega no verão?  
Lisa: Acho que no norte chove com mais frequência, mas se você for para a costa, o tempo costuma ser bom.  
Mark: Bom saber! Também me pergunto se preciso de um carro alugado ou se o transporte público é suficiente.  
Lisa: Se você quiser explorar a natureza, um carro é prático. Mas se você ficar apenas nas cidades, ônibus e trem são suficientes.  
Mark: Verdade. E você sabe se as pessoas falam bem inglês na Noruega?  
Lisa: Sim, a maioria dos noruegueses fala inglês muito bem. Mas se você aprender algumas palavras em norueguês, as pessoas ficam felizes!  
Mark: Essa é uma boa dica! Estou pensando se faço um curso de idiomas antes da viagem.  
Lisa: Se você tiver tempo, seria ótimo! E se você tiver dúvidas, pode me perguntar a qualquer momento.  
Mark: Obrigado, Lisa! Quando eu tiver planejado tudo, te convido para um café e te conto sobre isso.  
Lisa: Combinado! Já estou ansiosa.',
'Condições e dúvidas. "wenn" (se/quando) vs "ob" (se = dúvida). Verbo no final.',
'[{ "de": "Wenn ich Zeit habe, lerne ich.", "pt": "Se eu tiver tempo, estudo.", "note": "wenn = condição" },
{ "de": "Ich weiß nicht, ob er kommt.", "pt": "Não sei se ele vem.", "note": "ob = dúvida" },
{ "de": "Ich überlege, ob ich reisen soll.", "pt": "Penso se devo viajar.", "note": "ob" },
{ "de": "Falls es regnet, bleibe ich.", "pt": "Caso chova, eu fico.", "note": "falls" }]'::jsonb,
'[{ "de": "die Bedingung", "pt": "a condição" },
{ "de": "die Frage", "pt": "a pergunta" },
{ "de": "wenn", "pt": "se, quando" },
{ "de": "ob", "pt": "se (dúvida)" },
{ "de": "überlegen", "pt": "pensar, considerar" },
{ "de": "die Reise", "pt": "a viagem" },
{ "de": "Skandinavien", "pt": "Escandinávia" },
{ "de": "sparen", "pt": "economizar" },
{ "de": "buchen", "pt": "reservar" },
{ "de": "günstig", "pt": "barato, vantajoso" },
{ "de": "vergleichen", "pt": "comparar" },
{ "de": "sich leisten", "pt": "poder pagar, permitir-se" },
{ "de": "das Budget", "pt": "o orçamento" },
{ "de": "planen", "pt": "planejar" },
{ "de": "Norwegen", "pt": "Noruega" },
{ "de": "regnen", "pt": "chover" },
{ "de": "die Küste", "pt": "a costa" },
{ "de": "das Wetter", "pt": "o tempo" },
{ "de": "der Mietwagen", "pt": "o carro alugado" },
{ "de": "ausreichen", "pt": "ser suficiente" },
{ "de": "die öffentlichen Verkehrsmittel", "pt": "transporte público" },
{ "de": "erkunden", "pt": "explorar" },
{ "de": "praktisch", "pt": "prático" },
{ "de": "die Stadt", "pt": "a cidade" },
{ "de": "die Bahn", "pt": "o trem" },
{ "de": "norwegisch", "pt": "norueguês" },
{ "de": "der Sprachkurs", "pt": "curso de idiomas" },
{ "de": "jederzeit", "pt": "a qualquer momento" },
{ "de": "falls", "pt": "caso" },
{ "de": "einladen", "pt": "convidar" },
{ "de": "erzählen", "pt": "contar" }]'::jsonb,
'[ "Wenn vs Ob:",
"• Wenn = Se (condição) OU Quando (tempo).",
"• Ob = Se (dúvida/pergunta indireta).",
"Ex: Ich weiß nicht, OB er kommt. (Dúvida)",
"Ex: Ich komme, WENN ich Zeit habe. (Condição)",
"Falls = Caso (condição mais formal que wenn).",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap34','a2-l34-2','A2','"wenn" (Condição/Tempo) vs "ob" (Dúvida)','Wenn vs Ob - Bedingungen und Fragen',
'Diferença crucial. "wenn" introduz condição ou tempo. "ob" introduz dúvida.',
'Wenn = Se/Quando. Ob = Se (dúvida). Verbos no final da oração.',
'[{ "de": "Wenn es kalt ist, ziehe ich eine Jacke an.", "pt": "Se estiver frio, visto uma jaqueta.", "note": "condição" },
{ "de": "Weißt du, ob der Kurs voll ist?", "pt": "Sabe se o curso está cheio?", "note": "dúvida" },
{ "de": "Ich frage mich, ob das stimmt.", "pt": "Pergunto-me se isso é verdade.", "note": "dúvida" },
{ "de": "Wenn ich nach Hause komme, koche ich.", "pt": "Quando chego em casa, cozinho.", "note": "tempo" }]'::jsonb,
'[]'::jsonb,
'[ "DIFERENÇA PRINCIPAL:",
"",
"1. WENN (Se / Quando)",
"   • Condição: WENN ich Geld habe, kaufe ich das Auto.",
"   • Tempo (futuro/hábito): WENN ich müde bin, gehe ich schlafen.",
"",
"2. OB (Se - Dúvida)",
"   • Usado após verbos de dúvida (wissen, fragen, unsicher sein).",
"   • Ich weiß nicht, OB er kommt.",
"   • Pergunte-se: posso substituir por 'whether' em inglês? Se sim, use OB.",
"",
"3. FALLS (Caso)",
"   • Mais formal que 'wenn'.",
"   • Falls du Fragen hast, melde dich.",
"",
"ATENÇÃO: Em todos os casos, o verbo conjugado vai para o FINAL da oração.",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
2,true),

('a2-cap34','a2-l34-3','A2','Cultura: Planejamento e Dúvidas Educadas','Kultur: Planung & Höfliche Zweifel',
'Planejamento detalhado. Dúvida educada (Ich frage mich, ob...).',
'Organização, planejamento preventivo, perguntas indiretas.',
'[{ "de": "Ich überlege, ob...", "pt": "Estou pensando se...", "note": "planejamento" },
{ "de": "Weißt du, ob...?", "pt": "Sabe se...?", "note": "dúvida" },
{ "de": "Falls du Fragen hast...", "pt": "Caso tenha dúvidas...", "note": "formalidade" }]'::jsonb,
'[]'::jsonb,
'[ "Planejamento e Comunicação na Alemanha:",
"",
"• Planejamento Detalhado:",
"  Os alemães valorizam prever condições: 'Wenn das klappt, dann...'",
"  Expressar condições é visto como prudência.",
"",
"• Dúvida Educada:",
"  Usar 'ob' em perguntas indiretas soa mais educado e menos direto.",
"  'Weißt du, ob...?' é preferível a perguntas diretas em contextos formais.",
"",
"• 'Falls' no ambiente profissional:",
"  Muito comum em e-mails: 'Falls Sie Fragen haben...'",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 35: Vergangenheit vertiefen – Präteritum im Alltag
-- ══════════════════════════════════════════════════
('a2-cap35','a2-l35-1','A2','Diálogo: Anna e Ben contam sobre o fim de semana','Dialog: Das Wochenende erzählen',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Anna: Hey Ben, wie war dein Wochenende?  
Ben: Es war ganz gut! Am Samstag besuchte ich meine Eltern auf dem Land.  
Anna: Das klingt schön! Was machtet ihr so?  
Ben: Wir spazierten im Wald, kochten zusammen und schauten alte Fotos an. Am Abend spielte ich mit meinem Neffen Brettspiele.  
Anna: Wie süß! Und am Sonntag?  
Ben: Am Sonntag las ich ein Buch und arbeitete ein bisschen im Garten. Danach traf ich mich mit Freunden im Café.  
Anna: Was machten eure Freunde?  
Ben: Sarah erzählte von ihrer Reise nach Italien. Tom berichtete über sein neues Projekt. Wir lachten viel und tranken Kaffee.  
Anna: Das hört sich nach einem perfekten Wochenende an!  
Ben: Ja, es war entspannt. Und wie war dein Wochenende?  
Anna: Ich blieb zu Hause. Ich putzte die Wohnung, kochte eine Suppe und sah einen Film. Am Sonntag lernte ich für meine Prüfung.  
Ben: Klingt auch produktiv! Hast du die Prüfung bestanden?  
Anna: Ja, zum Glück! Ich freute mich sehr. Danach feierte ich mit einer kleinen Party.  
Ben: Herzlichen Glückwunsch! Was machtest du gestern?  
Anna: Gestern arbeitete ich den ganzen Tag. Am Abend telefonierte ich mit meiner Schwester und schrieb E-Mails.  
Ben: Und heute?  
Anna: Heute habe ich frei! Ich möchte spazieren gehen und vielleicht ein Eis essen. Möchtest du mitkommen?  
Ben: Gerne! Ich rufe dich später an.  
Anna: Perfekt! Bis dann!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Anna: Oi Ben, como foi seu fim de semana?  
Ben: Foi bem bom! No sábado, visitei meus pais no interior.  
Anna: Parece legal! O que vocês fizeram?  
Ben: Caminhamos na floresta, cozinhamos juntos e olhamos fotos antigas. À noite, joguei jogos de tabuleiro com meu sobrinho.  
Anna: Que fofo! E no domingo?  
Ben: No domingo, li um livro e trabalhei um pouco no jardim. Depois, encontrei amigos no café.  
Anna: O que seus amigos fizeram?  
Ben: Sarah contou sobre a viagem dela à Itália. Tom falou sobre o novo projeto dele. Rimos muito e tomamos café.  
Anna: Isso parece um fim de semana perfeito!  
Ben: Sim, foi relaxante. E como foi seu fim de semana?  
Anna: Fiquei em casa. Limpei o apartamento, cozinhei uma sopa e assisti a um filme. No domingo, estudei para minha prova.  
Ben: Parece produtivo também! Você passou na prova?  
Anna: Sim, ainda bem! Fiquei muito feliz. Depois, comemorei com uma festinha.  
Ben: Parabéns! O que você fez ontem?  
Anna: Ontem trabalhei o dia todo. À noite, conversei por telefone com minha irmã e escrevi e-mails.  
Ben: E hoje?  
Anna: Hoje estou de folga! Quero caminhar e talvez comer um sorvete. Quer vir comigo?  
Ben: Com prazer! Te ligo mais tarde.  
Anna: Perfeito! Até logo!',
'Präteritum (Imperfeto) para narrar o passado. Foco em verbos regulares (-te) e irregulares comuns.',
'[{ "de": "Ich besuchte meine Eltern.", "pt": "Visitei meus pais.", "note": "besuchen (regular)" },
{ "de": "Wir kochten zusammen.", "pt": "Cozinhamos juntos.", "note": "kochen (regular)" },
{ "de": "Am Sonntag las ich ein Buch.", "pt": "No domingo li um livro.", "note": "lesen (irregular)" },
{ "de": "Ich blieb zu Hause.", "pt": "Fiquei em casa.", "note": "bleiben (irregular)" }]'::jsonb,
'[{ "de": "die Vergangenheit", "pt": "o passado" },
{ "de": "vertiefen", "pt": "aprofundar" },
{ "de": "das Wochenende", "pt": "o fim de semana" },
{ "de": "besuchen", "pt": "visitar" },
{ "de": "das Land", "pt": "o interior" },
{ "de": "spazieren", "pt": "caminhar" },
{ "de": "der Wald", "pt": "a floresta" },
{ "de": "kochen", "pt": "cozinhar" },
{ "de": "anschauen", "pt": "olhar, assistir" },
{ "de": "das Foto", "pt": "a foto" },
{ "de": "der Neffe", "pt": "o sobrinho" },
{ "de": "das Brettspiel", "pt": "jogo de tabuleiro" },
{ "de": "lesen", "pt": "ler" },
{ "de": "arbeiten", "pt": "trabalhar" },
{ "de": "der Garten", "pt": "o jardim" },
{ "de": "sich treffen", "pt": "encontrar-se" },
{ "de": "erzählen", "pt": "contar" },
{ "de": "die Reise", "pt": "a viagem" },
{ "de": "Italien", "pt": "Itália" },
{ "de": "berichten", "pt": "relatar" },
{ "de": "das Projekt", "pt": "o projeto" },
{ "de": "lachen", "pt": "rir" },
{ "de": "trinken", "pt": "beber" },
{ "de": "entspannt", "pt": "relaxado" },
{ "de": "putzen", "pt": "limpar" },
{ "de": "die Suppe", "pt": "a sopa" },
{ "de": "der Film", "pt": "o filme" },
{ "de": "lernen", "pt": "aprender" },
{ "de": "die Prüfung", "pt": "a prova" },
{ "de": "bestehen", "pt": "passar (prova)" },
{ "de": "feiern", "pt": "comemorar" },
{ "de": "die Party", "pt": "a festa" },
{ "de": "telefonieren", "pt": "telefonar" },
{ "de": "schreiben", "pt": "escrever" },
{ "de": "frei haben", "pt": "estar de folga" },
{ "de": "das Eis", "pt": "o sorvete" }]'::jsonb,
'[ "Präteritum: Narração e Escrita.",
"Verbos Regulares: Raiz + -te + terminação (ich machte).",
"Verbos Irregulares Comuns:",
"• sein → war",
"• haben → hatte",
"• gehen → ging",
"• lesen → las",
"• sehen → sah",
"Conectores: zuerst (primeiro), dann (depois), danach (em seguida).",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap35','a2-l35-2','A2','Präteritum: Regulares e Irregulares Frequentes','Präteritum Formen',
'Conjugação no Präteritum. Diferença entre fala (Perfekt) e escrita (Präteritum).',
'Regular: -te. Irregular: muda a vogal. sein/haben sempre Präteritum na fala.',
'[{ "de": "Ich lernte Deutsch.", "pt": "Eu aprendi alemão.", "note": "lernen (regular)" },
{ "de": "Er ging nach Hause.", "pt": "Ele foi para casa.", "note": "gehen (irregular)" },
{ "de": "Wir hatten viel Spaß.", "pt": "Nós nos divertimos muito.", "note": "haben (irregular)" },
{ "de": "Ich war müde.", "pt": "Eu estava cansado.", "note": "sein (irregular)" }]'::jsonb,
'[]'::jsonb,
'[ "FORMAÇÃO DO PRÄTERITUM:",
"",
"1. VERBOS REGULARES:",
"   Raiz + -te + terminação pessoal (-, -st, -, -en, -t, -en)",
"   ich mach-te | du mach-test | er mach-te",
"   ich lern-te | du lern-test | er lern-te",
"",
"2. VERBOS IRREGULARES FREQUENTES (A2):",
"   sein → war | haben → hatte",
"   gehen → ging | kommen → kam",
"   sehen → sah | lesen → las",
"   trinken → trank | essen → aß",
"",
"QUANDO USAR:",
"• Narrativas escritas, biografias, relatos formais.",
"• Verbos sein/haben são usados no Präteritum até na fala (Ich war da).",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
2,true),

('a2-cap35','a2-l35-3','A2','Cultura: Narrativas e Ritual Social','Kultur: Erzählungen & Wochenende',
'Perguntar sobre o fim de semana é ritual. Brettspiele (jogos de tabuleiro). Prüfungen.',
'Ritual de segunda-feira, jogos de tabuleiro, conquistas acadêmicas.',
'[{ "de": "Wie war dein Wochenende?", "pt": "Como foi seu fim de semana?", "note": "ritual" },
{ "de": "Ich spielte Brettspiele.", "pt": "Joguei jogos de tabuleiro.", "note": "lazer" },
{ "de": "Ich bestand die Prüfung.", "pt": "Passei na prova.", "note": "conquista" }]'::jsonb,
'[]'::jsonb,
'[ "Narrativas e Vida Social:",
"",
"• Ritual Social:",
"  Perguntar 'Wie war dein Wochenende?' é padrão na segunda-feira.",
"  Respostas detalhadas mostram interesse.",
"",
"• Brettspiele:",
"  Jogos de tabuleiro são muito populares na Alemanha.",
"  É uma atividade social comum entre amigos e família.",
"",
"• Prüfungen (Provas):",
"  O sistema educacional valoriza exames.",
"  'Ich bestand die Prüfung' é a forma clássica de relatar sucesso.",
"",
"• Conectores:",
"  Use 'zuerst, dann, danach' para organizar a narrativa.",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
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
-- CAPÍTULO 36: Allgemeine Aussagen – Das Pronomen „man"
-- ══════════════════════════════════════════════════
('a2-cap36','a2-l36-1','A2','Diálogo: Sophie e Lukas falam sobre aprender alemão','Dialog: Über Deutschlernen sprechen',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Sophie: Hey Lukas, ich habe eine Frage: Wie lernt man am besten Deutsch?  
Lukas: Gute Frage! Man sollte jeden Tag ein bisschen üben. Man kann Apps nutzen, Filme schauen oder mit Muttersprachlern sprechen.  
Sophie: Und wie findet man eine Sprachpartnerin?  
Lukas: Man kann sich in Online-Gruppen anmelden oder an Tandem-Treffen teilnehmen. Man trifft dort oft nette Leute.  
Sophie: Stimmt! Sag mal, was macht man in Deutschland, wenn man krank ist?  
Lukas: Wenn man krank ist, muss man zum Arzt gehen. Man bekommt dann eine Krankschreibung für die Arbeit.  
Sophie: Und wie bezahlt man in Geschäften?  
Lukas: Man kann mit Karte oder bar zahlen. Aber in kleinen Läden nimmt man oft nur Bargeld.  
Sophie: Gut zu wissen! Was isst man typischerweise zum Frühstück?  
Lukas: Man isst oft Brötchen mit Marmelade oder Käse. Man trinkt dazu Kaffee oder Tee.  
Sophie: Klingt lecker! Und wie feiert man Silvester in Deutschland?  
Lukas: Man trifft sich mit Freunden, isst Raclette oder Fondue und um Mitternacht zündet man Feuerwerk an. Man wünscht sich „Guten Rutsch!" und „Frohes Neues!".  
Sophie: Das möchte ich gerne erleben! Was muss man beachten, wenn man nach Deutschland zieht?  
Lukas: Man muss sich anmelden innerhalb von zwei Wochen. Man braucht auch eine Krankenversicherung. Und man sollte Deutsch lernen – das erleichtert alles!  
Sophie: Danke für die Tipps! Man lernt so viel von dir.  
Lukas: Immer gerne! Man hilft sich ja gegenseitig.  
Sophie: Stimmt! Dann bis bald!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Sophie: Oi Lukas, tenho uma pergunta: Como se aprende alemão da melhor forma?  
Lukas: Boa pergunta! Deve-se praticar um pouco todo dia. Pode-se usar apps, assistir a filmes ou conversar com falantes nativos.  
Sophie: E como se encontra uma parceira de idiomas?  
Lukas: Pode-se se inscrever em grupos online ou participar de encontros de Tandem. Lá, frequentemente se conhece pessoas legais.  
Sophie: Verdade! Diz aí, o que se faz na Alemanha quando se está doente?  
Lukas: Quando se está doente, precisa-se ir ao médico. Aí se recebe um atestado para o trabalho.  
Sophie: E como se paga em lojas?  
Lukas: Pode-se pagar com cartão ou em dinheiro. Mas em lojas pequenas, frequentemente só se aceita dinheiro vivo.  
Sophie: Bom saber! O que se come tipicamente no café da manhã?  
Lukas: Frequentemente se come pãezinhos com geleia ou queijo. Toma-se café ou chá junto.  
Sophie: Parece delicioso! E como se celebra o Ano-Novo na Alemanha?  
Lukas: Encontra-se com amigos, come-se Raclette ou Fondue e, à meia-noite, acende-se fogos de artifício. Deseja-se „Guten Rutsch!" e „Frohes Neues!".  
Sophie: Eu gostaria de viver isso! O que se deve observar quando se muda para a Alemanha?  
Lukas: Deve-se registrar dentro de duas semanas. Também se precisa de um seguro saúde. E deve-se aprender alemão – isso facilita tudo!  
Sophie: Obrigada pelas dicas! Aprende-se tanto com você.  
Lukas: Por nada! Ajuda-se mutuamente, afinal.  
Sophie: Verdade! Então até logo!',
'Pronome impessoal „man" = se/a gente. Sempre 3ª pessoa singular. Usado para generalizações, regras e conselhos.',
'[{ "de": "Man lernt Deutsch durch Übung.", "pt": "Aprende-se alemão com prática.", "note": "generalização" },
{ "de": "Man kann hier gut essen.", "pt": "Pode-se comer bem aqui.", "note": "possibilidade" },
{ "de": "Man muss sich anmelden.", "pt": "Deve-se registrar.", "note": "obrigação geral" },
{ "de": "Man sollte viel Wasser trinken.", "pt": "Deve-se beber muita água.", "note": "conselho" }]'::jsonb,
'[{ "de": "man", "pt": "se, a gente (impessoal)" },
{ "de": "am besten", "pt": "da melhor forma" },
{ "de": "üben", "pt": "praticar" },
{ "de": "die App", "pt": "o aplicativo" },
{ "de": "der Muttersprachler", "pt": "o falante nativo" },
{ "de": "die Sprachpartnerin", "pt": "a parceira de idiomas" },
{ "de": "sich anmelden", "pt": "inscrever-se, registrar-se" },
{ "de": "das Tandem-Treffen", "pt": "encontro de Tandem" },
{ "de": "teilnehmen", "pt": "participar" },
{ "de": "die Krankschreibung", "pt": "o atestado médico" },
{ "de": "bezahlen", "pt": "pagar" },
{ "de": "das Geschäft", "pt": "a loja" },
{ "de": "Bargeld", "pt": "dinheiro vivo" },
{ "de": "typischerweise", "pt": "tipicamente" },
{ "de": "das Frühstück", "pt": "o café da manhã" },
{ "de": "das Brötchen", "pt": "o pãozinho" },
{ "de": "die Marmelade", "pt": "a geleia" },
{ "de": "der Käse", "pt": "o queijo" },
{ "de": "feiern", "pt": "celebrar" },
{ "de": "Silvester", "pt": "Ano-Novo (réveillon)" },
{ "de": "Raclette / Fondue", "pt": "pratos típicos de celebração" },
{ "de": "anzünden", "pt": "acender, inflamar" },
{ "de": "das Feuerwerk", "pt": "os fogos de artifício" },
{ "de": "wünschen", "pt": "desejar" },
{ "de": "beachten", "pt": "observar, levar em conta" },
{ "de": "die Krankenversicherung", "pt": "o seguro saúde" },
{ "de": "erleichtern", "pt": "facilitar" },
{ "de": "gegenseitig", "pt": "mutuamente" }]'::jsonb,
'[ "„Man" = pronome impessoal, sempre 3ª pessoa singular.",
"Usado para: regras (Man muss...), conselhos (Man sollte...), hábitos (Man isst...).",
"Não use „man" para ações específicas suas: ~~Man habe ich gelernt~~ → Ich habe gelernt.",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap36','a2-l36-2','A2','Pronome „man" para afirmações gerais','Das Pronomen „man" für allgemeine Aussagen',
'„Man" expressa ações gerais sem especificar sujeito. Conjugação como er/sie/es. Útil para regras, conselhos e costumes.',
'Man + verbo (3ª pess. sing.) + complemento. Equivalente a "se" ou "a gente" em PT.',
'[{ "de": "Man sagt, dass...", "pt": "Diz-se que...", "note": "sabedoria popular" },
{ "de": "Wie nennt man das?", "pt": "Como se chama isso?", "note": "perguntar vocabulário" },
{ "de": "Was macht man hier?", "pt": "O que se faz aqui?", "note": "perguntar costumes" },
{ "de": "Man kann nicht alles haben.", "pt": "Não se pode ter tudo.", "note": "provérbio" }]'::jsonb,
'[]'::jsonb,
'[ "CONJUGAÇÃO COM „MAN":',
"Sempre como 3ª pessoa singular:",
"Man lernt, man kann, man muss, man soll, man darf.",
"",
"USOS PRINCIPAIS:",
"• Regras: Man muss den Gurt anlegen. (Deve-se usar o cinto.)",
"• Conselhos: Man sollte früh schlafen. (Deve-se dormir cedo.)",
"• Hábitos culturais: Man trinkt in Deutschland viel Kaffee.",
"",
"EVITAR „MAN" PARA:",
"• Ações específicas: ~~Man habe ich gelernt~~ → Ich habe gelernt.",
"• Quando o sujeito é claro: ~~Man gehe ich~~ → Ich gehe.",
"",
"EXPRESSÕES FIXAS:",
"Wie nennt man das? = Como se chama isso?",
"Was macht man hier? = O que se faz aqui?",
"Man sagt, dass... = Diz-se que...",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
2,true),

('a2-cap36','a2-l36-3','A2','Cultura: Generalizações & Normas Sociais','Kultur: Allgemeine Aussagen & Normen',
'„Man" reflete coletividade cultural. Conselhos com „sollte" soam menos impositivos. Regras impessoais reforçam autoridade.',
'Coletividade, conselhos universais, regras impessoais, perguntas de vocabulário.',
'[{ "de": "Man sollte...", "pt": "Deve-se... (conselho)", "note": "educação" },
{ "de": "Man muss...", "pt": "Deve-se... (regra)", "note": "obrigação" },
{ "de": "Wie nennt man das?", "pt": "Como se chama isso?", "note": "aprendizado" }]'::jsonb,
'[]'::jsonb,
'[ "Generalizações & Normas na Alemanha:",
"",
"• „Man" reflete coletividade:",
"  Falar do que „as pessoas fazem" sem individualizar é culturalmente comum.",
"",
"• Conselhos com „sollte":",
"  „Man sollte..." soa menos direto que „Du solltest...", evitando impor opiniões.",
"",
"• Regras e „man muss":",
"  Frases impessoais reforçam a autoridade da regra, não da pessoa:",
"  „Man darf hier nicht parken" (Não se pode estacionar aqui).",
"",
"• Perguntar vocabulário:",
"  „Wie nennt man das?" é uma das perguntas mais úteis para aprendizes.",
"  Alemães respondem com paciência, valorizando precisão linguística.",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 37: Beim Arzt – Symptome und Probleme beschreiben
-- ══════════════════════════════════════════════════
('a2-cap37','a2-l37-1','A2','Diálogo: Markus consulta médica detalhada','Dialog: Beim Arzt – Symptome beschreiben',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Patient (Markus): Guten Morgen, Frau Doktor.  
Ärztin: Guten Morgen, Herr Becker. Was führt Sie zu mir?  
Markus: Ich fühle mich seit zwei Tagen nicht wohl. Ich habe starke Kopfschmerzen, besonders hier an der Stirn.  
Ärztin: Verstehe. Haben Sie auch Fieber oder Schüttelfrost?  
Markus: Ja, gestern Abend hatte ich leichtes Fieber, etwa 38 Grad. Und mir ist manchmal schwindelig.  
Ärztin: Haben Sie Appetit?  
Markus: Eigentlich nicht. Ich habe kaum Hunger und mir ist oft übel.  
Ärztin: Wo genau tut es weh? Können Sie das zeigen?  
Markus: *(zeigt auf die Stirn)* Hier drückt es so, als ob ein Band um meinen Kopf liegt. Und beim Husten wird es schlimmer.  
Ärztin: Husten Sie trocken oder mit Auswurf?  
Markus: Meistens trocken, aber morgens habe ich etwas Schleim.  
Ärztin: Haben Sie in letzter Zeit viel Stress gehabt?  
Markus: Ja, die Arbeit war sehr anstrengend. Und ich habe schlecht geschlafen.  
Ärztin: Das könnte ein Spannungskopfschmerz sein. Ich untersuche Sie kurz. Atmen Sie bitte tief ein.  
Markus: *(atmet ein)* Tut das weh?  
Ärztin: Nein, die Lunge klingt gut. Ich verschreibe Ihnen ein Schmerzmittel und empfehle Ihnen, viel zu ruhen. Trinken Sie ausreichend Wasser und vermeiden Sie Bildschirmarbeit.  
Markus: Wie oft soll ich das Medikament nehmen?  
Ärztin: Zweimal täglich nach dem Essen. Wenn die Beschwerden in drei Tagen nicht besser werden, kommen Sie bitte wieder.  
Markus: Vielen Dank, Frau Doktor. Und was mache ich bei Übelkeit?  
Ärztin: Trinken Sie Ingwertee und essen Sie kleine, leichte Mahlzeiten. Und jetzt: Gute Besserung!  
Markus: Danke, das werde ich tun. Auf Wiedersehen!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Paciente (Markus): Bom dia, Doutora.  
Médica: Bom dia, Sr. Becker. O que o traz aqui?  
Markus: Não me sinto bem há dois dias. Estou com forte dor de cabeça, especialmente aqui na testa.  
Médica: Entendo. Você também está com febre ou calafrios?  
Markus: Sim, ontem à noite tive febre leve, cerca de 38 graus. E às vezes fico tonto.  
Médica: Você está com apetite?  
Markus: Na verdade, não. Quase não tenho fome e frequentemente sinto náusea.  
Médica: Onde exatamente dói? Pode mostrar?  
Markus: *(aponta para a testa)* Aqui aperta, como se houvesse uma faixa ao redor da minha cabeça. E ao tossir, piora.  
Médica: Você tosse seco ou com catarro?  
Markus: Geralmente seco, mas de manhã tenho um pouco de muco.  
Médica: Você teve muito estresse ultimamente?  
Markus: Sim, o trabalho foi muito cansativo. E dormi mal.  
Médica: Pode ser uma cefaleia tensional. Vou examiná-lo rapidamente. Respire fundo, por favor.  
Markus: *(respira)* Isso dói?  
Médica: Não, o pulmão soa bem. Vou receitar um analgésico e recomendo que descanse bastante. Beba água suficiente e evite trabalho em telas.  
Markus: Com que frequência devo tomar o medicamento?  
Médica: Duas vezes ao dia após as refeições. Se os sintomas não melhorarem em três dias, volte por favor.  
Markus: Muito obrigado, Doutora. E o que faço para a náusea?  
Médica: Beba chá de gengibre e coma refeições pequenas e leves. E agora: Melhoras!  
Markus: Obrigado, vou fazer isso. Até logo!',
'Descrever sintomas: intensidade (leicht/stark), localização (an der Stirn), duração (seit...). Estruturas: Ich habe... / Mir ist... / Es tut... weh.',
'[{ "de": "Ich habe starke Kopfschmerzen.", "pt": "Estou com forte dor de cabeça.", "note": "haben + sintoma" },
{ "de": "Mir ist schwindelig.", "pt": "Estou tonto.", "note": "mir ist + adjetivo" },
{ "de": "Es tut mir an der Stirn weh.", "pt": "Dói na minha testa.", "note": "tut weh + localização" },
{ "de": "Beim Husten wird es schlimmer.", "pt": "Ao tossir, piora.", "note": "condição que agrava" }]'::jsonb,
'[{ "de": "das Symptom", "pt": "o sintoma" },
{ "de": "sich fühlen", "pt": "sentir-se" },
{ "de": "nicht wohl fühlen", "pt": "não se sentir bem" },
{ "de": "der Kopfschmerz", "pt": "a dor de cabeça" },
{ "de": "stark", "pt": "forte, intenso" },
{ "de": "die Stirn", "pt": "a testa" },
{ "de": "das Fieber", "pt": "a febre" },
{ "de": "der Schüttelfrost", "pt": "o calafrio" },
{ "de": "schwindelig", "pt": "tonto, zonzo" },
{ "de": "der Appetit", "pt": "o apetite" },
{ "de": "kaum", "pt": "quase não" },
{ "de": "übel", "pt": "enjoado, com náusea" },
{ "de": "drücken", "pt": "apertar, pressionar" },
{ "de": "schlimmer", "pt": "pior" },
{ "de": "trocken", "pt": "seco" },
{ "de": "der Auswurf", "pt": "o catarro" },
{ "de": "der Schleim", "pt": "o muco" },
{ "de": "der Stress", "pt": "o estresse" },
{ "de": "anstrengend", "pt": "cansativo" },
{ "de": "der Spannungskopfschmerz", "pt": "cefaleia tensional" },
{ "de": "untersuchen", "pt": "examinar" },
{ "de": "die Lunge", "pt": "o pulmão" },
{ "de": "das Schmerzmittel", "pt": "o analgésico" },
{ "de": "die Beschwerde", "pt": "o sintoma, queixa" },
{ "de": "die Übelkeit", "pt": "a náusea" },
{ "de": "der Ingwertee", "pt": "o chá de gengibre" },
{ "de": "die Mahlzeit", "pt": "a refeição" },
{ "de": "vermeiden", "pt": "evitar" },
{ "de": "die Bildschirmarbeit", "pt": "trabalho em telas" },
{ "de": "ausreichend", "pt": "suficiente" }]'::jsonb,
'[ "Estruturas para descrever sintomas:",
"• Ich habe + sintoma: Ich habe Kopfschmerzen.",
"• Mir ist + adjetivo: Mir ist schwindelig / übel.",
"• Es tut + lugar + weh: Es tut mir am Kopf weh.",
"",
"Expressar intensidade: leicht (leve), mäßig (moderado), stark (forte).",
"Duração: seit + tempo (seit zwei Tagen). Frequência: manchmal, oft, ständig.",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap37','a2-l37-2','A2','Descrever sintomas: intensidade e localização','Symptome beschreiben – Intensität und Ort',
'Para descrever dor: usar advérbios de intensidade, preposições de localização e estruturas fixas. Precisão ajuda no diagnóstico.',
'Ich habe... / Mir ist... / Es tut... weh. Intensidade: leicht/mäßig/stark. Localização: an/auf/in + dativo.',
'[{ "de": "Ich habe leichtes Fieber.", "pt": "Estou com febre leve.", "note": "intensidade" },
{ "de": "Der Schmerz ist mäßig.", "pt": "A dor é moderada.", "note": "intensidade" },
{ "de": "Es tut im Hals weh.", "pt": "Dói na garganta.", "note": "localização" },
{ "de": "Manchmal ist mir schwindelig.", "pt": "Às vezes fico tonto.", "note": "frequência" }]'::jsonb,
'[]'::jsonb,
'[ "ESTRUTURAS PARA DOR E DESCONFORTO:",
"• Ich habe + [sintoma]: Ich habe Kopfschmerzen.",
"• Mir ist + [adjetivo]: Mir ist schwindelig / übel.",
"• Es tut + [lugar] + weh: Es tut mir am Kopf weh.",
"• [Lugar] + drückt/schmerzt: Die Stirn drückt.",
"",
"EXPRESSANDO INTENSIDADE:",
"• leicht = leve | mäßig = moderado | stark = forte",
"• sehr = muito | kaum = quase não | ständig = constantemente",
"",
"EXPRESSANDO DURAÇÃO E FREQUÊNCIA:",
"• seit + tempo: Seit zwei Tagen fühle ich mich nicht wohl.",
"• manchmal = às vezes | oft = frequentemente",
"• in letzter Zeit = ultimamente | morgens/abends = de manhã/à noite",
"",
"PERGUNTAS ÚTEIS DO MÉDICO:",
"• Wo genau tut es weh? = Onde exatamente dói?",
"• Seit wann haben Sie die Beschwerden? = Há quanto tempo tem os sintomas?",
"• Husten Sie trocken oder mit Auswurf? = Tosse seca ou com catarro?",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
2,true),

('a2-cap37','a2-l37-3','A2','Cultura: Saúde & Consulta Médica na Alemanha','Kultur: Gesundheit & Arztbesuch',
'Descrever sintomas com precisão é valorizado. eAU digital. Apotheke especializada. Plantão 116117. Prevenção é prioridade.',
'Precisão nos sintomas, eAU digital, Apotheke vs. Drogerie, 116117, Vorsorgeuntersuchung.',
'[{ "de": "die Krankschreibung", "pt": "atestado médico", "note": "trabalho" },
{ "de": "die Apotheke", "pt": "farmácia (medicamentos)", "note": "saúde" },
{ "de": "116117", "pt": "plantão médico não emergencial", "note": "emergência" }]'::jsonb,
'[]'::jsonb,
'[ "Saúde & Consulta Médica na Alemanha:",
"",
"• Descrever sintomas com precisão:",
"  Médicos valorizam: localização exata, intensidade, duração e fatores que pioram/melhoram.",
"  Ser específico ajuda no diagnóstico.",
"",
"• Krankschreibung digital (eAU):",
"  Desde 2021, atestados são enviados eletronicamente ao empregador.",
"  O paciente recebe confirmação, mas pode solicitar o papel.",
"",
"• Apotheke especializada:",
"  Medicamentos de prescrição só em farmácias físicas.",
"  Farmacêuticos são altamente qualificados para orientação.",
"",
"• Plantão médico 116117:",
"  Para casos não emergenciais fora do horário comercial.",
"  Para emergências reais: ligue 112.",
"",
"• Cultura de prevenção (Vorsorge):",
"  Check-ups anuais são incentivados e cobertos pelo seguro.",
"  Mentalidade: „Vorbeugen ist besser als heilen" (Prevenir é melhor que curar).",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 38: Zukunft planen – Über Pläne sprechen
-- ══════════════════════════════════════════════════
('a2-cap38','a2-l38-1','A2','Diálogo: Julia e Tim planejam férias','Dialog: Zukunftspläne besprechen',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Julia: Hey Tim, hast du schon Pläne für die Sommerferien?  
Tim: Ja, ich werde im August nach Portugal fahren. Ich habe schon ein Apartment gebucht!  
Julia: Wow, das klingt toll! Wie lange bleibst du dort?  
Tim: Drei Wochen. Ich werde am Strand relaxen, wandern gehen und die lokale Küche probieren.  
Julia: Das möchte ich auch! Reise allein oder mit jemandem?  
Tim: Ich fahre mit meiner Freundin Lisa. Wir werden zusammen surfen lernen – das war schon lange unser Traum!  
Julia: Wie spannend! Und was machst du nach dem Urlaub?  
Tim: Im September werde ich mit meinem neuen Job anfangen. Ich werde als Marketing-Assistent bei einer Startup-Firma arbeiten.  
Julia: Herzlichen Glückwunsch! Das ist eine große Chance.  
Tim: Danke! Ich bin etwas nervös, aber ich freue mich sehr. Und du? Was sind deine Pläne?  
Julia: Ich werde im Sommer einen Deutschkurs machen. Ich möchte mein Niveau verbessern, bevor ich im nächsten Jahr nach Deutschland ziehe.  
Tim: Das ist ein guter Plan! Wo wirst du in Deutschland wohnen?  
Julia: Wahrscheinlich in München oder Berlin. Ich werde mir nächste Woche ein paar Wohnungen ansehen.  
Tim: Brauchst du Hilfe bei der Suche?  
Julia: Vielleicht! Ich werde mich erst einmal online informieren. Aber danke für das Angebot!  
Tim: Gerne! Sag Bescheid, wenn du Tipps brauchst.  
Julia: Mache ich! Und wenn ich in Deutschland bin, laden wir uns auf einen Kaffee ein.  
Tim: Abgemacht! Ich freue mich schon darauf.  
Julia: Ich auch! Dann bis bald und viel Erfolg mit den Vorbereitungen!  
Tim: Danke, dir auch! Bis dann!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Julia: Oi Tim, você já tem planos para as férias de verão?  
Tim: Sim, vou viajar para Portugal em agosto. Já reservei um apartamento!  
Julia: Uau, isso parece incrível! Por quanto tempo você vai ficar lá?  
Tim: Três semanas. Vou relaxar na praia, fazer trilhas e experimentar a culinária local.  
Julia: Eu também quero isso! Vai viajar sozinho ou com alguém?  
Tim: Vou com minha namorada Lisa. Vamos aprender a surfar juntos – esse é um sonho nosso há muito tempo!  
Julia: Que empolgante! E o que você vai fazer depois das férias?  
Tim: Em setembro, vou começar meu novo emprego. Vou trabalhar como assistente de marketing em uma startup.  
Julia: Parabéns! Essa é uma grande oportunidade.  
Tim: Obrigado! Estou um pouco nervoso, mas muito animado. E você? Quais são seus planos?  
Julia: Vou fazer um curso de alemão no verão. Quero melhorar meu nível antes de me mudar para a Alemanha no ano que vem.  
Tim: Esse é um bom plano! Onde você vai morar na Alemanha?  
Julia: Provavelmente em Munique ou Berlim. Vou olhar alguns apartamentos na semana que vem.  
Tim: Precisa de ajuda na busca?  
Julia: Talvez! Primeiro vou me informar online. Mas obrigada pela oferta!  
Tim: Por nada! Me avise se precisar de dicas.  
Julia: Vou avisar! E quando eu estiver na Alemanha, nos convidamos para um café.  
Tim: Combinado! Já estou ansioso.  
Julia: Eu também! Então até logo e boa sorte com os preparativos!  
Tim: Obrigado, para você também! Até mais!',
'Futuro: Präsens + marcador de tempo (mais comum) vs. Futur I com werden (ênfase/formal). Estrutura: werden + infinitivo no final.',
'[{ "de": "Ich fahre im August nach Portugal.", "pt": "Vou a Portugal em agosto.", "note": "Präsens + tempo" },
{ "de": "Ich werde im August nach Portugal fahren.", "pt": "Vou a Portugal em agosto.", "note": "Futur I (ênfase)" },
{ "de": "Nächste Woche sehe ich mir Wohnungen an.", "pt": "Na semana que vem, vou olhar apartamentos.", "note": "Präsens + tempo" },
{ "de": "Ich werde mein Bestes geben!", "pt": "Vou dar o meu melhor!", "note": "Futur I (promessa)" }]'::jsonb,
'[{ "de": "die Zukunft", "pt": "o futuro" },
{ "de": "planen", "pt": "planejar" },
{ "de": "der Plan", "pt": "o plano" },
{ "de": "die Sommerferien", "pt": "as férias de verão" },
{ "de": "fahren", "pt": "viajar, ir" },
{ "de": "buchen", "pt": "reservar" },
{ "de": "das Apartment", "pt": "o apartamento" },
{ "de": "relaxen", "pt": "relaxar" },
{ "de": "wandern", "pt": "fazer trilha" },
{ "de": "die lokale Küche", "pt": "a culinária local" },
{ "de": "probieren", "pt": "experimentar" },
{ "de": "surfen", "pt": "surfar" },
{ "de": "der Traum", "pt": "o sonho" },
{ "de": "anfangen", "pt": "começar" },
{ "de": "der Job", "pt": "o emprego" },
{ "de": "der Marketing-Assistent", "pt": "assistente de marketing" },
{ "de": "die Startup-Firma", "pt": "a startup" },
{ "de": "die Chance", "pt": "a oportunidade" },
{ "de": "nervös", "pt": "nervoso" },
{ "de": "das Niveau", "pt": "o nível" },
{ "de": "verbessern", "pt": "melhorar" },
{ "de": "umziehen", "pt": "mudar-se" },
{ "de": "wahrscheinlich", "pt": "provavelmente" },
{ "de": "sich etwas ansehen", "pt": "olhar, visitar (imóvel)" },
{ "de": "die Suche", "pt": "a busca" },
{ "de": "sich informieren", "pt": "informar-se" },
{ "de": "das Angebot", "pt": "a oferta" },
{ "de": "der Tipp", "pt": "a dica" },
{ "de": "der Erfolg", "pt": "o sucesso" },
{ "de": "die Vorbereitung", "pt": "a preparação" },
{ "de": "werden", "pt": "ir (futuro), tornar-se" }]'::jsonb,
'[ "Duas formas de expressar futuro:",
"1. Präsens + marcador de tempo (mais comum na fala):",
"   Ich fahre im August nach Portugal.",
"",
"2. Futur I com werden (ênfase/formal):",
"   Ich werde im August nach Portugal fahren.",
"",
"Marcadores de tempo futuros: morgen, nächste Woche, im Sommer, bald, in drei Tagen.",
"Conjugação de werden: ich werde, du wirst, er wird, wir werden, ihr werdet, sie werden.",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap38','a2-l38-2','A2','Expressar futuro: Präsens + tempo vs. Futur I','Zukunft ausdrücken – Präsens und Futur I',
'Na fala cotidiana, usa-se o presente + marcador de tempo. Futur I (werden + infinitivo) é para ênfase, promessas ou previsões.',
'Präsens + tempo = planos concretos. Futur I = ênfase/promessa. werden conjugado + infinitivo no final.',
'[{ "de": "Im August fahre ich nach Portugal.", "pt": "Em agosto vou a Portugal.", "note": "Präsens + tempo" },
{ "de": "Ich werde mein Bestes geben!", "pt": "Vou dar o meu melhor!", "note": "Futur I (promessa)" },
{ "de": "Es wird morgen regnen.", "pt": "Vai chover amanhã.", "note": "Futur I (previsão)" },
{ "de": "Nächste Woche sehe ich mir Wohnungen an.", "pt": "Na semana que vem, vou olhar apartamentos.", "note": "Präsens + tempo" }]'::jsonb,
'[]'::jsonb,
'[ "QUANDO USAR CADA FORMA:",
"",
"✅ PRÄSENS + MARCADOR DE TEMPO (fala cotidiana):",
"• Planos concretos: Ich fahre im August nach Portugal.",
"• Encontros marcados: Wir treffen uns nächste Woche.",
"• Inícios programados: Sie beginnt morgen mit dem Kurs.",
"",
"✅ FUTUR I COM WERDEN (ênfase/formal):",
"• Promessas: Ich werde mein Bestes geben!",
"• Previsões: Es wird morgen regnen.",
"• Textos formais: Die Konferenz wird im Juni stattfinden.",
"",
"CONJUGAÇÃO DE WERDEN:",
"ich werde | du wirst | er/sie/es wird",
"wir werden | ihr werdet | sie/Sie werden",
"",
"ESTRUTURA:",
"Sujeito + werden (conjugado) + ... + infinitivo (final)",
"Ex: Ich werde im August nach Portugal fahren.",
"",
"DICA: Comece com Präsens + tempo para planos. Use werden apenas para ênfase.",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
2,true),

('a2-cap38','a2-l38-3','A2','Cultura: Planejamento & Futuro na Alemanha','Kultur: Planung & Zukunft',
'Planejamento a longo prazo é valorizado. „Vorhaben" para intenções. Mudança exige burocracia. Férias são sagradas.',
'Langfristplanung, Vorhaben, Anmeldung, Sommerferien, Work-Life-Balance.',
'[{ "de": "Ich habe vor,...", "pt": "Tenho a intenção de...", "note": "intenção" },
{ "de": "die Anmeldung", "pt": "o registro (prefeitura)", "note": "burocracia" },
{ "de": "die Sommerferien", "pt": "férias de verão", "note": "cultura" }]'::jsonb,
'[]'::jsonb,
'[ "Planejamento & Futuro na Alemanha:",
"",
"• Planejamento a longo prazo:",
"  Falar sobre planos com marcadores precisos (im August, nächstes Jahr)",
"  demonstra seriedade e organização.",
"",
"• „Vorhaben" vs. „werden":",
"  „Ich habe vor,..." (tenho a intenção de) soa mais natural",
"  que o Futur I em conversas informais.",
"",
"• Mudança e burocracia:",
"  Planejar uma mudança exige: Anmeldung (registro),",
"  Krankenversicherung (seguro saúde), conta bancária.",
"",
"• Férias sagradas:",
"  As Sommerferien são planejadas com meses de antecedência.",
"  Perguntar „Was machst du in den Ferien?" é tópico social frequente.",
"",
"• Dica de comunicação:",
"  Combine estruturas: presente para ações concretas,",
"  werden para promessas ou ênfase.",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 39: Arbeit und Studium – Alltag organisieren
-- ══════════════════════════════════════════════════
('a2-cap39','a2-l39-1','A2','Diálogo: Anna e Ben falam sobre trabalho e estudos','Dialog: Arbeit und Studium organisieren',
'**DIÁLOGO COMPLETO EM ALEMÃO:**  
Anna: Hey Ben, wie läuft dein neues Praktikum?  
Ben: Ganz gut, danke! Ich arbeite seit zwei Monaten in einer Marketing-Agentur. Die Aufgaben sind abwechslungsreich.  
Anna: Was machst du genau?  
Ben: Ich erstelle Social-Media-Beiträge, analysiere Daten und nehme an Team-Meetings teil. Manchmal muss ich auch Präsentationen vorbereiten.  
Anna: Klingt spannend! Wie ist dein Arbeitsalltag organisiert?  
Ben: Ich beginne um 9 Uhr, mache um 13 Uhr eine Mittagspause und arbeite bis 17 Uhr. Zweimal pro Woche kann ich von zu Hause aus arbeiten – das nennt man Homeoffice.  
Anna: Das ist praktisch! Und wie kommst du zur Arbeit?  
Ben: Ich fahre mit dem Fahrrad, das dauert etwa 20 Minuten. Wenn es regnet, nehme ich die U-Bahn.  
Anna: Und wie ist das Team?  
Ben: Sehr nett und hilfsbereit. Meine Chefin, Frau Schmidt, gibt mir regelmäßig Feedback. Letzte Woche habe ich mein erstes eigenes Projekt präsentiert – das war aufregend!  
Anna: Herzlichen Glückwunsch! Hast du noch Zeit zum Lernen?  
Ben: Ja, ich besuche abends einen Online-Kurs für Digitales Marketing. Ich möchte mich weiterqualifizieren.  
Anna: Das ist beeindruckend! Wie organisierst du alles?  
Ben: Ich nutze einen digitalen Kalender und eine To-do-List-App. So vergesse ich keine Termine. Und am Wochenende mache ich bewusst Pause.  
Anna: Gute Strategie! Ich habe auch viel zu tun: Vorlesungen, Hausaufgaben und mein Nebenjob in der Bibliothek.  
Ben: Wie schaffst du das alles?  
Anna: Ich plane meine Woche immer sonntags. So weiß ich, wann ich lernen, arbeiten und mich entspannen kann.  
Ben: Das werde ich auch probieren! Sag mal, hast du nächste Woche Zeit für einen Kaffee?  
Anna: Gerne! Am Mittwochabend habe ich frei.  
Ben: Perfekt! Dann treffen wir uns um 18 Uhr im Café Central.  
Anna: Abgemacht! Ich freue mich schon.  
Ben: Ich auch! Bis Mittwoch!

---

**TRADUÇÃO EM PORTUGUÊS:**  
Anna: Oi Ben, como está indo seu novo estágio?  
Ben: Muito bem, obrigado! Trabalho há dois meses em uma agência de marketing. As tarefas são variadas.  
Anna: O que você faz exatamente?  
Ben: Crio posts para redes sociais, analiso dados e participo de reuniões de equipe. Às vezes também preciso preparar apresentações.  
Anna: Parece empolgante! Como é organizada sua rotina de trabalho?  
Ben: Começo às 9h, faço uma pausa para o almoço às 13h e trabalho até às 17h. Duas vezes por semana posso trabalhar de casa – isso se chama home office.  
Anna: Isso é prático! E como você vai ao trabalho?  
Ben: Vou de bicicleta, leva cerca de 20 minutos. Se chover, pego o metrô.  
Anna: E como é a equipe?  
Ben: Muito legal e prestativa. Minha chefe, Sra. Schmidt, me dá feedback regularmente. Semana passada, apresentei meu primeiro projeto próprio – foi empolgante!  
Anna: Parabéns! Você ainda tem tempo para estudar?  
Ben: Sim, frequento um curso online de Marketing Digital à noite. Quero me qualificar mais.  
Anna: Isso é impressionante! Como você organiza tudo?  
Ben: Uso um calendário digital e um app de lista de tarefas. Assim não esqueço nenhum compromisso. E no fim de semana, faço uma pausa consciente.  
Anna: Boa estratégia! Eu também tenho muito a fazer: aulas, tarefas de casa e meu emprego secundário na biblioteca.  
Ben: Como você dá conta de tudo?  
Anna: Sempre planejo minha semana aos domingos. Assim sei quando posso estudar, trabalhar e relaxar.  
Ben: Vou experimentar isso também! Diz aí, você tem tempo para um café na semana que vem?  
Anna: Com prazer! Na quarta-feira à noite estou livre.  
Ben: Perfeito! Então nos encontramos às 18h no Café Central.  
Anna: Combinado! Já estou ansiosa.  
Ben: Eu também! Até quarta!',
'Rotina profissional: expressões de tempo (um/von...bis/seit), frequência (immer/oft/manchmal), modais para obrigações/possibilidades.',
'[{ "de": "Ich beginne um 9 Uhr.", "pt": "Começo às 9h.", "note": "um + hora" },
{ "de": "Ich arbeite von 9 bis 17 Uhr.", "pt": "Trabalho das 9h às 17h.", "note": "von...bis" },
{ "de": "Zweimal pro Woche kann ich im Homeoffice arbeiten.", "pt": "Duas vezes por semana posso trabalhar em home office.", "note": "frequência + modal" },
{ "de": "Ich muss Präsentationen vorbereiten.", "pt": "Preciso preparar apresentações.", "note": "müssen + obrigação" }]'::jsonb,
'[{ "de": "die Arbeit", "pt": "o trabalho" },
{ "de": "das Studium", "pt": "os estudos, curso superior" },
{ "de": "organisieren", "pt": "organizar" },
{ "de": "der Alltag", "pt": "o cotidiano" },
{ "de": "das Praktikum", "pt": "o estágio" },
{ "de": "die Marketing-Agentur", "pt": "agência de marketing" },
{ "de": "abwechslungsreich", "pt": "variado, diversificado" },
{ "de": "erstellen", "pt": "criar, elaborar" },
{ "de": "der Social-Media-Beitrag", "pt": "post de rede social" },
{ "de": "analysieren", "pt": "analisar" },
{ "de": "die Daten", "pt": "os dados" },
{ "de": "teilnehmen", "pt": "participar" },
{ "de": "das Team-Meeting", "pt": "reunião de equipe" },
{ "de": "die Präsentation", "pt": "a apresentação" },
{ "de": "vorbereiten", "pt": "preparar" },
{ "de": "der Arbeitsalltag", "pt": "rotina de trabalho" },
{ "de": "die Mittagspause", "pt": "pausa para almoço" },
{ "de": "das Homeoffice", "pt": "home office, trabalho remoto" },
{ "de": "das Fahrrad", "pt": "a bicicleta" },
{ "de": "die U-Bahn", "pt": "o metrô" },
{ "de": "hilfsbereit", "pt": "prestativo" },
{ "de": "das Feedback", "pt": "o feedback" },
{ "de": "präsentieren", "pt": "apresentar" },
{ "de": "aufregend", "pt": "empolgante" },
{ "de": "weiterqualifizieren", "pt": "qualificar-se mais" },
{ "de": "beeindruckend", "pt": "impressionante" },
{ "de": "der digitale Kalender", "pt": "calendário digital" },
{ "de": "die To-do-List", "pt": "lista de tarefas" },
{ "de": "der Termin", "pt": "compromisso" },
{ "de": "bewusst", "pt": "consciente, intencional" },
{ "de": "die Vorlesung", "pt": "aula (universitária)" },
{ "de": "die Hausaufgabe", "pt": "tarefa de casa" },
{ "de": "der Nebenjob", "pt": "emprego secundário" },
{ "de": "die Bibliothek", "pt": "biblioteca" },
{ "de": "schaffen", "pt": "dar conta, conseguir" },
{ "de": "sich entspannen", "pt": "relaxar" }]'::jsonb,
'[ "Expressões de tempo e horários:",
"• um + hora: um 9 Uhr (às 9h)",
"• von... bis...: von 9 bis 17 Uhr (das 9h às 17h)",
"• seit + tempo: seit zwei Monaten (há dois meses)",
"• pro Woche/Monat: zweimal pro Woche (duas vezes por semana)",
"",
"Expressar frequência: immer, oft, manchmal, selten, nie.",
"Modais para rotina: müssen (obrigação), können (possibilidade), sollen (conselho).",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
1,true),

('a2-cap39','a2-l39-2','A2','Organizar rotina: tempo, frequência e modais','Alltag organisieren – Zeit, Häufigkeit, Modalverben',
'Descrever rotinas exige domínio de expressões de tempo, advérbios de frequência e verbos modais para obrigações e possibilidades.',
'um/von...bis/seit + tempo. immer/oft/manchmal. müssen/können/sollen + infinitivo no final.',
'[{ "de": "Ich arbeite von 8 bis 16 Uhr.", "pt": "Trabalho das 8h às 16h.", "note": "horário" },
{ "de": "Ich kann zweimal pro Woche im Homeoffice arbeiten.", "pt": "Posso trabalhar de casa duas vezes por semana.", "note": "frequência + können" },
{ "de": "Ich muss eine Präsentation vorbereiten.", "pt": "Preciso preparar uma apresentação.", "note": "müssen + obrigação" },
{ "de": "Ich plane immer sonntags.", "pt": "Sempre planejo aos domingos.", "note": "frequência" }]'::jsonb,
'[]'::jsonb,
'[ "EXPRESSÕES DE TEMPO E HORÁRIOS:",
"• um + [hora]: Ich beginne um 9 Uhr.",
"• von... bis...: Ich arbeite von 9 bis 17 Uhr.",
"• seit + [tempo]: Ich arbeite seit zwei Monaten hier.",
"• pro Woche/Monat: Zweimal pro Woche arbeite ich im Homeoffice.",
"• abends/morgens: Ich besuche abends einen Kurs.",
"",
"EXPRESSAR FREQUÊNCIA:",
"• immer = sempre | oft/häufig = frequentemente",
"• manchmal = às vezes | selten = raramente | nie = nunca",
"• zweimal/dreimal = duas/três vezes",
"",
"VERBOS MODAIS PARA ROTINA PROFISSIONAL:",
"• müssen = obrigação: Ich muss Präsentationen vorbereiten.",
"• können = possibilidade: Ich kann im Homeoffice trabalhar.",
"• sollen = conselho: Ich soll regelmäßig Feedback geben.",
"• dürfen = permissão: Ich darf flexible Arbeitszeiten haben.",
"",
"CONECTIVOS ÚTEIS:",
"• so = assim: So vergesse ich keine Termine.",
"• damit = para que: Ich plane, damit ich Zeit habe.",
"• wenn = se/quando: Wenn es regnet, nehme ich die U-Bahn.",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
2,true),

('a2-cap39','a2-l39-3','A2','Cultura: Trabalho, Estudos & Equilíbrio na Alemanha','Kultur: Arbeit, Studium & Balance',
'Homeoffice é direito. Feedback estruturado. Work-Life-Balance é prioridade. Nebenjob é comum para estudantes.',
'Homeoffice-Anspruch, regelmäßiges Feedback, Mittagspause, Nebenjob, sonntags planen.',
'[{ "de": "das Homeoffice", "pt": "trabalho remoto", "note": "direito" },
{ "de": "das Feedback", "pt": "feedback, retorno", "note": "profissional" },
{ "de": "die Work-Life-Balance", "pt": "equilíbrio trabalho-vida", "note": "cultura" }]'::jsonb,
'[]'::jsonb,
'[ "Trabalho, Estudos & Equilíbrio na Alemanha:",
"",
"• Homeoffice é direito:",
"  Desde 2024, muitos empregados têm direito legal a dias de trabalho remoto.",
"  A cultura valoriza flexibilidade com responsabilidade.",
"",
"• Feedback estruturado:",
"  No ambiente profissional, feedback regular é frequente e direto.",
"  Críticas construtivas são vistas como oportunidade de crescimento.",
"",
"• Work-Life-Balance:",
"  A Mittagspause (pausa para almoço) é sagrada.",
"  Trabalhar além do horário sem necessidade é malvisto.",
"",
"• Estudantes e Nebenjob:",
"  É comum ter empregos secundários para custear os estudos.",
"  Universidades oferecem horários flexíveis para conciliar ambas.",
"",
"• Dica de organização:",
"  Usar ferramentas digitais (Kalender, To-do-List) e planejar",
"  a semana com antecedência (sonntags planen) é culturalmente valorizado.",
"",
"INPUT: Próximo capítulo / Capítulo anterior" ]'::jsonb,
3,true),

-- ══════════════════════════════════════════════════
-- PROVA FINAL A2 (a2-exam)
-- ══════════════════════════════════════════════════
('a2-exam','a2-exam-l1-horen','A2','Prova A2: Hören – Compreensão Auditiva','A2 Prüfung: Hören',
'5 diálogos curtos com perguntas de múltipla escolha. Foco em: Perfekt, modais, dativo, descrições.',
'Ouça atentamente: tempos verbais, preposições, números e detalhes específicos.',
'[{ "de": "Wo ist die Apotheke?", "pt": "Onde fica a farmácia?", "note": "localização" },
{ "de": "Wann beginnt der Kurs?", "pt": "Quando começa o curso?", "note": "tempo" },
{ "de": "Wie viel kostet das Ticket?", "pt": "Quanto custa a passagem?", "note": "preço" }]'::jsonb,
'[]'::jsonb,
'[ "DICAS PARA HÖREN:",
"• Anote números, horários e nomes próprios.",
"• Preste atenção em preposições (am/um/im, mit/zu/von).",
"• Identifique tempos verbais: Perfekt (passado) vs. Präsens (presente).",
"• Pratique com podcasts A2: Deutsche Welle, Slow German.",
"",
"INPUT: Próximo / Voltar" ]'::jsonb,
1,true),

('a2-exam','a2-exam-l2-lesen','A2','Prova A2: Lesen – Compreensão de Leitura','A2 Prüfung: Lesen',
'Leia um e-mail e um cardápio. Responda perguntas sobre: remetente, pedido, preços, intenções.',
'Busque informações específicas: quem, o quê, quando, quanto. Ignore detalhes irrelevantes.',
'[{ "de": "Wer schreibt die E-Mail?", "pt": "Quem escreve o e-mail?", "note": "remetente" },
{ "de": "Was ist der Preis total?", "pt": "Qual é o preço total?", "note": "cálculo" },
{ "de": "Wann ist das Treffen?", "pt": "Quando é o encontro?", "note": "tempo" }]'::jsonb,
'[]'::jsonb,
'[ "DICAS PARA LESEN:",
"• Leia primeiro as perguntas, depois o texto.",
"• Sublinhe palavras-chave: nomes, datas, números.",
"• Para cardápios: identifique categorias (Vorspeise, Hauptspeise).",
"• Cuidado com falsos cognatos: "bekommen" ≠ "become" (é "receber").",
"",
"INPUT: Próximo / Voltar" ]'::jsonb,
2,true),

('a2-exam','a2-exam-l3-schreiben','A2','Prova A2: Schreiben – Produção Escrita','A2 Prüfung: Schreiben',
'Escreva um e-mail curto (40-50 palavras): apresente-se, convide para café, sugira dia/horário.',
'Estrutura: Saudação → Apresentação → Convite → Combinação → Despedida. Use „Sie" ou „du" conforme contexto.',
'[{ "de": "Lieber/Liebe [Nome],", "pt": "Querido/a [Nome],", "note": "saudação informal" },
{ "de": "Ich heiße... / Ich bin... Jahre alt.", "pt": "Me chamo... / Tenho... anos.", "note": "apresentação" },
{ "de": "Möchtest du...? / Hast du Zeit?", "pt": "Você gostaria...? / Tem tempo?", "note": "convite" }]'::jsonb,
'[]'::jsonb,
'[ "ESTRUTURA DO E-MAIL A2:",
"1. Saudação: Lieber Thomas, / Liebe Anna, / Sehr geehrte Frau Schmidt,",
"2. Apresentação: Ich heiße... / Ich komme aus... / Ich bin... Jahre alt.",
"3. Convite: Möchtest du Kaffee trinken? / Hast du nächste Woche Zeit?",
"4. Combinação: Treffen wir uns am Samstag um 15 Uhr im Café Central?",
"5. Despedida: Viele Grüße / Liebe Grüße / Mit freundlichen Grüßen",
"",
"CHECKLIST:",
"✅ 40-50 palavras | ✅ Verbos no presente | ✅ Artigos corretos",
"✅ Preposições de tempo (am/um/im) | ✅ Pontuação básica",
"",
"INPUT: Próximo / Voltar" ]'::jsonb,
3,true),

('a2-exam','a2-exam-l4-sprechen','A2','Prova A2: Sprechen – Produção Oral','A2 Prüfung: Sprechen',
'Parte 1: Apresente-se oralmente (30 seg). Parte 2: Role-play no restaurante (pedir comida/bebida, perguntar preço).',
'Fale claro, use estruturas A2: Ich möchte... / Ich hätte gern... / Wie viel kostet...? Não tenha medo de errar!',
'[{ "de": "Ich heiße... und komme aus...", "pt": "Me chamo... e sou de...", "note": "apresentação" },
{ "de": "Ich hätte gern einen Salat, bitte.", "pt": "Eu gostaria de uma salada, por favor.", "note": "pedido" },
{ "de": "Wie viel kostet das?", "pt": "Quanto custa isso?", "note": "preço" }]'::jsonb,
'[]'::jsonb,
'[ "DICAS PARA SPRECHEN:",
"• Pronúncia: Fale devagar, articule consoantes finais (-t, -d, -s).",
"• Gramática: Foque em estruturas A2 corretas (presente, acusativo básico).",
"• Vocabulário: Use palavras do tema (comida, bebida, preços).",
"• Fluidez: Pausas naturais são ok. Use "Moment, bitte..." se precisar pensar.",
"",
"FRASES DE APOIO:",
"• Entschuldigung, können Sie das wiederholen? (Pode repetir?)",
"• Wie bitte? / Können Sie langsamer sprechen? (Mais devagar, por favor?)",
"• Danke, das ist alles. / Die Rechnung, bitte. (Para encerrar)",
"",
"INPUT: Próximo / Voltar" ]'::jsonb,
4,true),

('a2-exam','a2-exam-l5-grammatik','A2','Prova A2: Grammatik & Wortschatz','A2 Prüfung: Grammatik',
'Complete com artigos, conjugue verbos (sein/haben/essen/sprechen), transforme em perguntas, use Perfekt/Dativ.',
'Revisão integrada: Präsens, Perfekt, Akkusativ, Dativ, modais, preposições de tempo.',
'[{ "de": "Ich ___ (sein) gestern im Kino.", "pt": "Eu estava no cinema ontem.", "note": "Präteritum de sein" },
{ "de": "Er ___ (essen) einen Apfel.", "pt": "Ele come uma maçã.", "note": "essen: er isst" },
{ "de": "___ (du) kommst aus Berlin?", "pt": "Você vem de Berlim?", "note": "Ja/Nein-Frage" }]'::jsonb,
'[]'::jsonb,
'[ "REVISÃO GRAMATICAL A2:",
"• Präsens: Verbos regulares (-e/-st/-t) e irregulares (essen→isst).",
"• Perfekt: haben/sein + Partizip II no final.",
"• Akkusativ: Só masculino muda (der→den, ein→einen).",
"• Dativ: mit/zu/von + dativo; pronomes mir/dir/ihm.",
"• Modais: können/müssen/sollen + infinitivo no final.",
"• Preposições de tempo: am (dia), um (hora), im (mês).",
"",
"DICA FINAL:",
"Comunicar > perfeição. Erros são parte do aprendizado!",
"",
"INPUT: Voltar ao início" ]'::jsonb,
5,true)

ON CONFLICT (slug) DO UPDATE SET
module_slug = EXCLUDED.module_slug, level = EXCLUDED.level,
title_pt = EXCLUDED.title_pt, title_de = EXCLUDED.title_de,
summary_pt = EXCLUDED.summary_pt, quick_rule_pt = EXCLUDED.quick_rule_pt,
examples = EXCLUDED.examples, key_phrases = EXCLUDED.key_phrases,
mini_notes = EXCLUDED.mini_notes, sort_order = EXCLUDED.sort_order,
active = true, updated_at = now();

INSERT INTO study_exercises
(lesson_slug, slug, module_slug, level, exercise_type, prompt_pt, prompt_de, options, answer, explanation_pt, xp_reward, sort_order, active)
VALUES

-- ══════════════════════════════════════════════════
-- CAPÍTULO 21: Perfekt mit „haben"
-- ══════════════════════════════════════════════════
('a2-l21-1','a2-ex201','a2-cap21','A2','choose_option','Qual auxiliar usamos com „kochen" no Perfekt?',null,'["sein","haben","werden"]'::jsonb,'haben','kochen é transitivo/sem movimento → haben.',10,1,true),
('a2-l21-1','a2-ex202','a2-cap21','A2','fill_blank','Gestern ___ ich ein Buch ___ (lesen).',null,'[]'::jsonb,'habe / gelesen','lesen → irregular: gelesen.',10,2,true),
('a2-l21-1','a2-ex203','a2-cap21','A2','translate_to_de','Traduza: Eu visitei minha avó no domingo.',null,'[]'::jsonb,'Ich habe meine Oma am Sonntag besucht.','besuchen → besucht (inseparável, sem ge-).',12,3,true),
('a2-l21-2','a2-ex204','a2-cap21','A2','choose_option','Qual Partizip II está correto?',null,'["gekauft","gekaufen","gekaufe"]'::jsonb,'gekauft','kaufen → regular: ge- + kauf + t.',10,4,true),
('a2-l21-2','a2-ex205','a2-cap21','A2','fill_blank','Wir ___ den ganzen Tag ___ (arbeiten).',null,'[]'::jsonb,'haben / gearbeitet','arbeiten → gearbeitet (-ete por terminar em t).',10,5,true),
('a2-l21-2','a2-ex206','a2-cap21','A2','translate_to_de','Traduza: Ela telefonou para o médico.',null,'[]'::jsonb,'Sie hat den Arzt angerufen.','anrufen → separável: angerufen.',10,6,true),
('a2-l21-3','a2-ex207','a2-cap21','A2','choose_option','Onde fica o Partizip II na frase principal?',null,'["posição 2","final","início"]'::jsonb,'final','Regra: auxiliar na pos. 2, Partizip II no final.',10,7,true),
('a2-l21-3','a2-ex208','a2-cap21','A2','fill_blank','___ du die E-Mail schon ___ (schreiben)?',null,'[]'::jsonb,'Hast / geschrieben','schreiben → geschrieben.',10,8,true),
('a2-l21-3','a2-ex209','a2-cap21','A2','translate_to_de','Traduza: Nós assistimos TV à noite.',null,'[]'::jsonb,'Wir haben abends ferngesehen.','fernsehen → separável: ferngesehen.',10,9,true),
('a2-l21-3','a2-ex210','a2-cap21','A2','choose_option','Verbos em -ieren formam Partizip II com:',null,'["ge-...-t","-...-t (sem ge-)","-...-en"]'::jsonb,'-...-t (sem ge-)','telefonieren → telefoniert (sem ge-).',10,10,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 22: Perfekt mit „sein"
-- ══════════════════════════════════════════════════
('a2-l22-1','a2-ex211','a2-cap22','A2','choose_option','Qual verbo usa „sein" no Perfekt?',null,'["schlafen","gehen","kochen"]'::jsonb,'gehen','gehen = movimento direcional → sein.',10,1,true),
('a2-l22-1','a2-ex212','a2-cap22','A2','fill_blank','Ich ___ mit dem Fahrrad zur Arbeit ___ (fahren).',null,'[]'::jsonb,'bin / gefahren','fahren → gefahren + sein (deslocamento).',10,2,true),
('a2-l22-1','a2-ex213','a2-cap22','A2','translate_to_de','Traduza: Ela ficou em casa ontem.',null,'[]'::jsonb,'Sie ist gestern zu Hause geblieben.','bleiben → geblieben + sein (permanência).',12,3,true),
('a2-l22-2','a2-ex214','a2-cap22','A2','choose_option','Qual é o Partizip II de „schwimmen"?',null,'["geschwimmt","geschwommen","geschwummen"]'::jsonb,'geschwommen','schwimmen → irregular: geschwommen.',10,4,true),
('a2-l22-2','a2-ex215','a2-cap22','A2','fill_blank','Die Kinder ___ schnell ___ (einschlafen).',null,'[]'::jsonb,'sind / eingeschlafen','einschlafen → mudança de estado → sein.',10,5,true),
('a2-l22-2','a2-ex216','a2-cap22','A2','translate_to_de','Traduza: Nós subimos na montanha.',null,'[]'::jsonb,'Wir sind auf den Berg gestiegen.','steigen → gestiegen + sein.',10,6,true),
('a2-l22-3','a2-ex217','a2-cap22','A2','choose_option','„Ich habe den ganzen Tag gefahren" usa „haben" porque:',null,'["foco na ação","foco no destino","é erro"]'::jsonb,'foco na ação','Quando o foco é a ação/duração, usa-se haben.',10,7,true),
('a2-l22-3','a2-ex218','a2-cap22','A2','fill_blank','___ du schon einmal nach Österreich ___ (fliegen)?',null,'[]'::jsonb,'Bist / geflogen','fliegen → geflogen + sein.',10,8,true),
('a2-l22-3','a2-ex219','a2-cap22','A2','translate_to_de','Traduza: O bebê adormeceu rápido.',null,'[]'::jsonb,'Das Baby ist schnell eingeschlafen.','einschlafen → sein.',10,9,true),
('a2-l22-3','a2-ex220','a2-cap22','A2','choose_option','Qual verbo SEMPRE usa „sein"?',null,'["machen","werden","spielen"]'::jsonb,'werden','werden = mudança de estado → sein.',10,10,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 23: Modalverben
-- ══════════════════════════════════════════════════
('a2-l23-1','a2-ex221','a2-cap23','A2','choose_option','„Du ___ viel Wasser trinken." (conselho médico)',null,'["kannst","musst","sollst"]'::jsonb,'sollst','sollen = conselho/recomendação médica.',10,1,true),
('a2-l23-1','a2-ex222','a2-cap23','A2','fill_blank','___ (Können) Sie bitte tief einatmen?',null,'[]'::jsonb,'Können','können = possibilidade/pedido educado.',10,2,true),
('a2-l23-1','a2-ex223','a2-cap23','A2','translate_to_de','Traduza: Ela precisa tomar o remédio três vezes ao dia.',null,'[]'::jsonb,'Sie muss das Medikament dreimal täglich nehmen.','müssen = obrigação/necessidade.',12,3,true),
('a2-l23-2','a2-ex224','a2-cap23','A2','choose_option','Conjugação de „müssen" (ich/er):',null,'["muss/muss","muss/musst","müsse/müsse"]'::jsonb,'muss/muss','1ª e 3ª pessoa igual: muss.',10,4,true),
('a2-l23-2','a2-ex225','a2-cap23','A2','fill_blank','Ich ___ (dürfen) keinen Alkohol trinken.',null,'[]'::jsonb,'darf','dürfen = permissão/proibição.',10,5,true),
('a2-l23-2','a2-ex226','a2-cap23','A2','translate_to_de','Traduza: Posso marcar uma consulta?',null,'[]'::jsonb,'Kann ich einen Termin vereinbaren?','können + infinitivo no final.',10,6,true),
('a2-l23-3','a2-ex227','a2-cap23','A2','choose_option','Qual modal expressa habilidade?',null,'["müssen","sollen","können"]'::jsonb,'können','können = poder/saber fazer.',10,7,true),
('a2-l23-3','a2-ex228','a2-cap23','A2','fill_blank','Man ___ (sollen) früh schlafen gehen.',null,'[]'::jsonb,'soll','sollst para du, soll para man.',10,8,true),
('a2-l23-3','a2-ex229','a2-cap23','A2','translate_to_de','Traduza: Você deve descansar dois dias.',null,'[]'::jsonb,'Du sollst zwei Tage ruhen.','sollst = conselho.',10,9,true),
('a2-l23-3','a2-ex230','a2-cap23','A2','choose_option','Onde fica o infinitivo em frases com modal?',null,'["posição 2","final","início"]'::jsonb,'final','Modal conjuga na 2, infinitivo vai ao final.',10,10,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 24: Dativ im Alltag
-- ══════════════════════════════════════════════════
('a2-l24-1','a2-ex231','a2-cap24','A2','choose_option','Complete: „Das Sofa steht ___ dem Fenster."',null,'["an","neben","vor"]'::jsonb,'vor','vor + dativo = em frente a.',10,1,true),
('a2-l24-1','a2-ex232','a2-cap24','A2','fill_blank','Ich helfe ___ (mein) Bruder.',null,'[]'::jsonb,'meinem','helfen + dativo: mein → meinem.',10,2,true),
('a2-l24-1','a2-ex233','a2-cap24','A2','translate_to_de','Traduza: O apartamento me agrada.',null,'[]'::jsonb,'Die Wohnung gefällt mir.','gefallen + dativo.',12,3,true),
('a2-l24-2','a2-ex234','a2-cap24','A2','choose_option','Artigo dativo feminino:',null,'["die","der","dem"]'::jsonb,'der','die → der no dativo.',10,4,true),
('a2-l24-2','a2-ex235','a2-cap24','A2','fill_blank','Wir wohnen seit einem Jahr ___ (die) Gartenstraße.',null,'[]'::jsonb,'der','in + dativo: die → der.',10,5,true),
('a2-l24-2','a2-ex236','a2-cap24','A2','translate_to_de','Traduza: Ajudo minha vizinha com as compras.',null,'[]'::jsonb,'Ich helfe meiner Nachbarin beim Einkaufen.','meiner (dat fem) + beim (bei+dem).',10,6,true),
('a2-l24-3','a2-ex237','a2-cap24','A2','choose_option','„zu Fuß" significa:',null,'["de ônibus","a pé","de carro"]'::jsonb,'a pé','zu Fuß = a pé.',10,7,true),
('a2-l24-3','a2-ex238','a2-cap24','A2','fill_blank','Das Buch gehört ___ (ich).',null,'[]'::jsonb,'mir','gehören + dativo: ich → mir.',10,8,true),
('a2-l24-3','a2-ex239','a2-cap24','A2','translate_to_de','Traduza: O parque fica em frente à casa.',null,'[]'::jsonb,'Der Park liegt gegenüber dem Haus.','gegenüber + dativo.',10,9,true),
('a2-l24-3','a2-ex240','a2-cap24','A2','choose_option','Qual preposição exige dativo?',null,'["für","durch","mit"]'::jsonb,'mit','mit + dativo sempre.',10,10,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 25: Adjektive
-- ══════════════════════════════════════════════════
('a2-l25-1','a2-ex241','a2-cap25','A2','choose_option','Complete: „Sie hat ___ Haare."',null,'["lange blonde","langen blonden","langer blonder"]'::jsonb,'lange blonde','Acusativo plural sem artigo → terminação forte.',10,1,true),
('a2-l25-1','a2-ex242','a2-cap25','A2','fill_blank','Er ist ein ___ (freundlich) Mann.',null,'[]'::jsonb,'freundlicher','ein + masc nominativo → adj + er.',10,2,true),
('a2-l25-1','a2-ex243','a2-cap25','A2','translate_to_de','Traduza: Ela é uma mulher alta e simpática.',null,'[]'::jsonb,'Sie ist eine große, freundliche Frau.','eine + fem nom → adj + e.',12,3,true),
('a2-l25-2','a2-ex244','a2-cap25','A2','choose_option','Declinação com artigo definido (nom. fem):',null,'["-e","-en","-er"]'::jsonb,'-e','die + adj + e + fem.',10,4,true),
('a2-l25-2','a2-ex245','a2-cap25','A2','fill_blank','Das ist ein ___ (hell) Zimmer.',null,'[]'::jsonb,'helles','ein + neut nom → adj + es.',10,5,true),
('a2-l25-2','a2-ex246','a2-cap25','A2','translate_to_de','Traduza: Nós vimos um homem idoso com óculos.',null,'[]'::jsonb,'Wir haben einen älteren Mann mit Brille gesehen.','einen + masc akk → adj + en.',10,6,true),
('a2-l25-3','a2-ex247','a2-cap25','A2','choose_option','Adjetivos após „sein":',null,'["declinam","ficam invariáveis","vão ao final"]'::jsonb,'ficam invariáveis','Predicativo não declina.',10,7,true),
('a2-l25-3','a2-ex248','a2-cap25','A2','fill_blank','Ich kenne eine ___ (sympathisch) Frau.',null,'[]'::jsonb,'sympathische','eine + fem akk → adj + e.',10,8,true),
('a2-l25-3','a2-ex249','a2-cap25','A2','translate_to_de','Traduza: Ele tem olhos verdes e cabelos curtos.',null,'[]'::jsonb,'Er hat grüne Augen und kurze Haare.','Plural akk sem artigo → adj + e.',10,9,true),
('a2-l25-3','a2-ex250','a2-cap25','A2','choose_option','„bunt" significa:',null,'["colorido","preto","branco"]'::jsonb,'colorido','bunt = colorido.',10,10,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULOS 26-30 (Compactado para manter limite)
-- ══════════════════════════════════════════════════
('a2-l26-1','a2-ex251','a2-cap26','A2','choose_option','Complete: „Ich freue ___ auf den Urlaub."',null,'["mich","mir","dich"]'::jsonb,'mich','sich freuen auf + acusativo reflexivo.',10,1,true),
('a2-l26-1','a2-ex252','a2-cap26','A2','fill_blank','Er ärgert ___ über Fake News.',null,'[]'::jsonb,'sich','sich ärgern über + acusativo.',10,2,true),
('a2-l26-1','a2-ex253','a2-cap26','A2','translate_to_de','Traduza: Nós nos encontramos amanhã.',null,'[]'::jsonb,'Wir treffen uns morgen.','sich treffen = recíproco.',12,3,true),
('a2-l27-1','a2-ex254','a2-cap27','A2','choose_option','Pedido educado no restaurante:',null,'["Ich will...","Ich hätte gern...","Ich habe..."]'::jsonb,'Ich hätte gern...','Konjunktiv II de haben = cortesia.',10,4,true),
('a2-l27-1','a2-ex255','a2-cap27','A2','fill_blank','___ Sie schon gewählt?',null,'[]'::jsonb,'Haben','Haben Sie...? = já escolheram?',10,5,true),
('a2-l27-1','a2-ex256','a2-cap27','A2','translate_to_de','Traduza: Gostaríamos de sentar perto da janela.',null,'[]'::jsonb,'Wir möchten gerne am Fenster sitzen.','möchten + am Fenster.',10,6,true),
('a2-l28-1','a2-ex257','a2-cap28','A2','choose_option','Präteritum de „sein" (ich):',null,'["bin","war","warst"]'::jsonb,'war','ich war = eu era/estava.',10,7,true),
('a2-l28-1','a2-ex258','a2-cap28','A2','fill_blank','Ich ___ (haben) viele Freunde.',null,'[]'::jsonb,'hatte','haben → hatte no Präteritum.',10,8,true),
('a2-l28-1','a2-ex259','a2-cap28','A2','translate_to_de','Traduza: Eu era estudante em 2020.',null,'[]'::jsonb,'Ich war 2020 Student(in).','sein → war.',10,9,true),
('a2-l28-1','a2-ex260','a2-cap28','A2','choose_option','Verbos regulares no Präteritum ganham:',null,'["-te","-et","-en"]'::jsonb,'-te','Raiz + te + terminação.',10,10,true),
('a2-l29-1','a2-ex261','a2-cap29','A2','choose_option','Ordem: Ich schenke ___ Mutter ___ Buch.',null,'["meiner/ein","meine/ein","mir/ein"]'::jsonb,'meiner/ein','Dat (pessoa) + Akk (coisa).',10,1,true),
('a2-l29-1','a2-ex262','a2-cap29','A2','fill_blank','Kannst du ___ (ich) ___ (die Wahrheit) sagen?',null,'[]'::jsonb,'mir / die Wahrheit','mir (dat) + die Wahrheit (akk).',10,2,true),
('a2-l29-1','a2-ex263','a2-cap29','A2','translate_to_de','Traduza: Eu dou a você um presente.',null,'[]'::jsonb,'Ich gebe dir ein Geschenk.','dir (dat) + ein Geschenk (akk).',12,3,true),
('a2-l30-1','a2-ex264','a2-cap30','A2','choose_option','Linguagem formal para pedidos:',null,'["Ich will...","Ich möchte...","Ich brauche..."]'::jsonb,'Ich möchte...','möchten = educado.',10,4,true),
('a2-l30-1','a2-ex265','a2-cap30','A2','fill_blank','___ Sie bitte dieses Formular ___?',null,'[]'::jsonb,'Füllen / aus','ausfüllen = separável.',10,5,true),
('a2-l30-1','a2-ex266','a2-cap30','A2','translate_to_de','Traduza: Gostaria de transferir dinheiro.',null,'[]'::jsonb,'Ich möchte Geld überweisen.','überweisen = transferir.',10,6,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULOS 31-35
-- ══════════════════════════════════════════════════
('a2-l31-1','a2-ex267','a2-cap31','A2','choose_option','Complete: „Ich helfe ___ Bruder."',null,'["mein","meinem","meinen"]'::jsonb,'meinem','helfen + dativo.',10,7,true),
('a2-l31-1','a2-ex268','a2-cap31','A2','fill_blank','Das Kleid gefällt ___ (sie).',null,'[]'::jsonb,'ihr','gefallen + dativo: sie → ihr.',10,8,true),
('a2-l31-1','a2-ex269','a2-cap31','A2','translate_to_de','Traduza: Este livro pertence à minha irmã.',null,'[]'::jsonb,'Dieses Buch gehört meiner Schwester.','gehören + dativo.',10,9,true),
('a2-l32-1','a2-ex270','a2-cap32','A2','choose_option','Pergunta de posse formal:',null,'["Wer?","Wen?","Wessen?"]'::jsonb,'Wessen?','Wessen? = de quem? (genitivo).',10,10,true),
('a2-l32-1','a2-ex271','a2-cap32','A2','fill_blank','Das Auto ___ (von) meinem Nachbarn.',null,'[]'::jsonb,'von','von + dativo = posse informal.',10,1,true),
('a2-l32-1','a2-ex272','a2-cap32','A2','translate_to_de','Traduza: A linguagem da autora é clara.',null,'[]'::jsonb,'Die Sprache der Autorin ist klar.','Genitivo formal: der Autorin.',12,2,true),
('a2-l33-1','a2-ex273','a2-cap33','A2','choose_option','Conjunção de causa:',null,'["dass","weil","wenn"]'::jsonb,'weil','weil = porque.',10,3,true),
('a2-l33-1','a2-ex274','a2-cap33','A2','fill_blank','Ich hoffe, ___ du kommst.',null,'[]'::jsonb,'dass','dass introduz conteúdo/opinião.',10,4,true),
('a2-l33-1','a2-ex275','a2-cap33','A2','translate_to_de','Traduza: Aprendo alemão porque quero viajar.',null,'[]'::jsonb,'Ich lerne Deutsch, weil ich reisen möchte.','weil + verbo no final.',10,5,true),
('a2-l34-1','a2-ex276','a2-cap34','A2','choose_option','Dúvida indireta:',null,'["wenn","ob","weil"]'::jsonb,'ob','ob = se (dúvida).',10,6,true),
('a2-l34-1','a2-ex277','a2-cap34','A2','fill_blank','___ es regnet, bleibe ich zu Hause.',null,'[]'::jsonb,'Wenn','wenn = se/quando.',10,7,true),
('a2-l34-1','a2-ex278','a2-cap34','A2','translate_to_de','Traduza: Não sei se ele vem.',null,'[]'::jsonb,'Ich weiß nicht, ob er kommt.','ob = dúvida.',10,8,true),
('a2-l35-1','a2-ex279','a2-cap35','A2','choose_option','Präteritum de „lesen" (ich):',null,'["lese","las","gelesen"]'::jsonb,'las','lesen → las no Präteritum.',10,9,true),
('a2-l35-1','a2-ex280','a2-cap35','A2','fill_blank','Wir ___ (treffen) uns im Café.',null,'[]'::jsonb,'trafen','treffen → traf/treffen.',10,10,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULOS 36-39
-- ══════════════════════════════════════════════════
('a2-l36-1','a2-ex281','a2-cap36','A2','choose_option','Pronome impessoal para generalizações:',null,'["man","ein","es"]'::jsonb,'man','man = se/a gente.',10,1,true),
('a2-l36-1','a2-ex282','a2-cap36','A2','fill_blank','In Deutschland ___ man oft mit Karte zahlen.',null,'[]'::jsonb,'kann','man + 3ª pessoa singular.',10,2,true),
('a2-l36-1','a2-ex283','a2-cap36','A2','translate_to_de','Traduza: Aprende-se alemão praticando.',null,'[]'::jsonb,'Man lernt Deutsch durch Übung.','man + verbo conjugado.',12,3,true),
('a2-l37-1','a2-ex284','a2-cap37','A2','choose_option','Expressar dor:',null,'["Ich habe...","Mir ist...","Es tut...weh"]'::jsonb,'Es tut...weh','Es tut mir am Kopf weh.',10,4,true),
('a2-l37-1','a2-ex285','a2-cap37','A2','fill_blank','Ich habe ___ (stark) Kopfschmerzen.',null,'[]'::jsonb,'starke','stark + Kopfschmerzen (plural akk).',10,5,true),
('a2-l37-1','a2-ex286','a2-cap37','A2','translate_to_de','Traduza: Estou com febre leve há dois dias.',null,'[]'::jsonb,'Ich habe seit zwei Tagen leichtes Fieber.','seit + dativo.',10,6,true),
('a2-l38-1','a2-ex287','a2-cap38','A2','choose_option','Futuro I usa:',null,'["werden","haben","sein"]'::jsonb,'werden','werden + infinitivo.',10,7,true),
('a2-l38-1','a2-ex288','a2-cap38','A2','fill_blank','Ich ___ (werden) im August reisen.',null,'[]'::jsonb,'werde','werden conjugado + infinitivo final.',10,8,true),
('a2-l38-1','a2-ex289','a2-cap38','A2','translate_to_de','Traduza: Vou fazer um curso no verão.',null,'[]'::jsonb,'Ich werde im Sommer einen Kurs machen.','Präsens + tempo também vale.',10,9,true),
('a2-l39-1','a2-ex290','a2-cap39','A2','choose_option','Expressão de frequência:',null,'["immer","nie","manchmal"]'::jsonb,'manchmal','manchmal = às vezes.',10,10,true),
('a2-l39-1','a2-ex291','a2-cap39','A2','fill_blank','Ich arbeite ___ 9 ___ 17 Uhr.',null,'[]'::jsonb,'von / bis','von...bis = intervalo.',10,1,true),
('a2-l39-1','a2-ex292','a2-cap39','A2','translate_to_de','Traduza: Posso trabalhar de casa duas vezes por semana.',null,'[]'::jsonb,'Ich kann zweimal pro Woche im Homeoffice arbeiten.','können + frequência.',12,2,true),

-- ══════════════════════════════════════════════════
-- PROVA FINAL A2 (a2-exam)
-- ══════════════════════════════════════════════════
('a2-exam-l1-horen','a2-ex-exam-001','a2-exam','A2','choose_option','Onde fica a farmácia?',null,'["neben dem Supermarkt","gegenüber der Bank","am Bahnhof"]'::jsonb,'neben dem Supermarkt','Hören: atenção a preposições de lugar.',10,1,true),
('a2-exam-l1-horen','a2-ex-exam-002','a2-exam','A2','choose_option','Qual horário foi mencionado?',null,'["14 Uhr","15:30 Uhr","16 Uhr"]'::jsonb,'15:30 Uhr','Hören: números e horários.',10,2,true),
('a2-exam-l1-horen','a2-ex-exam-003','a2-exam','A2','choose_option','Qual o preço do ingresso?',null,'["12 Euro","15 Euro","18 Euro"]'::jsonb,'12 Euro','Hören: preços.',10,3,true),
('a2-exam-l1-horen','a2-ex-exam-004','a2-exam','A2','choose_option','O que a pessoa precisa comprar?',null,'["Milch und Brot","Äpfel und Wasser","Käse und Eier"]'::jsonb,'Milch und Brot','Hören: vocabulário de compras.',10,4,true),
('a2-exam-l1-horen','a2-ex-exam-005','a2-exam','A2','choose_option','Qual meio de transporte foi citado?',null,'["Bus","U-Bahn","Zug"]'::jsonb,'U-Bahn','Hören: transportes.',10,5,true),

('a2-exam-l2-lesen','a2-ex-exam-006','a2-exam','A2','choose_option','Quem escreveu o e-mail?',null,'["Thomas","Maria","Lena"]'::jsonb,'Maria','Lesen: identificar remetente.',10,1,true),
('a2-exam-l2-lesen','a2-ex-exam-007','a2-exam','A2','choose_option','Qual é o pedido principal?',null,'["Einen Termin machen","Eine Einladung zum Kaffee","Eine Frage stellen"]'::jsonb,'Eine Einladung zum Kaffee','Lesen: intenção do texto.',10,2,true),
('a2-exam-l2-lesen','a2-ex-exam-008','a2-exam','A2','choose_option','Quando é o encontro?',null,'["Montag 10 Uhr","Samstag 15 Uhr","Freitag 18 Uhr"]'::jsonb,'Samstag 15 Uhr','Lesen: datas e horas.',10,3,true),
('a2-exam-l2-lesen','a2-ex-exam-009','a2-exam','A2','choose_option','Qual prato principal custa 14 Euro?',null,'["Schnitzel","Fisch","Pasta"]'::jsonb,'Schnitzel','Lesen: cardápio/preços.',10,4,true),
('a2-exam-l2-lesen','a2-ex-exam-010','a2-exam','A2','choose_option','Qual bebida não contém álcool?',null,'["Bier","Wein","Apfelschorle"]'::jsonb,'Apfelschorle','Lesen: vocabulário bebidas.',10,5,true),

('a2-exam-l3-schreiben','a2-ex-exam-011','a2-exam','A2','fill_blank','Complete: Ich ___ (chamar-se) Anna und bin 25 Jahre alt.',null,'[]'::jsonb,'heiße','Schreiben: apresentação.',10,1,true),
('a2-exam-l3-schreiben','a2-ex-exam-012','a2-exam','A2','fill_blank','Complete: ___ (Convido) du auf einen Kaffee?',null,'[]'::jsonb,'Lade','Schreiben: convite (einladen).',10,2,true),
('a2-exam-l3-schreiben','a2-ex-exam-013','a2-exam','A2','fill_blank','Complete: Wir treffen uns ___ (na) Samstag ___ (às) 10 Uhr.',null,'[]'::jsonb,'am / um','Schreiben: preposições tempo.',10,3,true),
('a2-exam-l3-schreiben','a2-ex-exam-014','a2-exam','A2','fill_blank','Complete: Bitte ___ (responda) schnell!',null,'[]'::jsonb,'antworte','Schreiben: verbos imperativo.',10,4,true),
('a2-exam-l3-schreiben','a2-ex-exam-015','a2-exam','A2','fill_blank','Complete: Ich ___ (moro) in München.',null,'[]'::jsonb,'wohne','Schreiben: verbo wohnen.',10,5,true),

('a2-exam-l4-sprechen','a2-ex-exam-016','a2-exam','A2','translate_to_de','Traduza: Meu nome é Lucas e eu tenho 28 anos.',null,'[]'::jsonb,'Ich heiße Lucas und ich bin 28 Jahre alt.','Sprechen: apresentação.',10,1,true),
('a2-exam-l4-sprechen','a2-ex-exam-017','a2-exam','A2','translate_to_de','Traduza: Eu gostaria de uma salada e uma água, por favor.',null,'[]'::jsonb,'Ich hätte gern einen Salat und ein Wasser, bitte.','Sprechen: restaurante.',10,2,true),
('a2-exam-l4-sprechen','a2-ex-exam-018','a2-exam','A2','translate_to_de','Traduza: Quanto custa isso?',null,'[]'::jsonb,'Wie viel kostet das?','Sprechen: perguntas.',10,3,true),
('a2-exam-l4-sprechen','a2-ex-exam-019','a2-exam','A2','translate_to_de','Traduza: De onde você é?',null,'[]'::jsonb,'Woher kommst du?','Sprechen: origem.',10,4,true),
('a2-exam-l4-sprechen','a2-ex-exam-020','a2-exam','A2','translate_to_de','Traduza: Posso pagar com cartão?',null,'[]'::jsonb,'Kann ich mit Karte zahlen?','Sprechen: pagamento.',10,5,true),

('a2-exam-l5-grammatik','a2-ex-exam-021','a2-exam','A2','choose_option','Complete: Ich ___ gestern im Kino.',null,'["bin","war","habe"]'::jsonb,'war','Präteritum de sein.',10,1,true),
('a2-exam-l5-grammatik','a2-ex-exam-022','a2-exam','A2','choose_option','Complete: Er ___ einen Apfel.',null,'["esse","isst","aß"]'::jsonb,'isst','essen presente 3ª pess.',10,2,true),
('a2-exam-l5-grammatik','a2-ex-exam-023','a2-exam','A2','choose_option','Oração com „weil": verbo fica no:',null,'["início","meio","final"]'::jsonb,'final','Subordinada: verbo final.',10,3,true),
('a2-exam-l5-grammatik','a2-ex-exam-024','a2-exam','A2','choose_option','Complete: Das Buch gehört ___ (mir/mich).',null,'["mir","mich","mein"]'::jsonb,'mir','gehören + dativo.',10,4,true),
('a2-exam-l5-grammatik','a2-ex-exam-025','a2-exam','A2','fill_blank','Transforme em pergunta: „Du wohnst in Berlin." → „___?"',null,'[]'::jsonb,'Wohnst du in Berlin?','Ja/Nein-Frage: verbo em 1º.',10,5,true)

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
-- CAPÍTULO 21: Perfekt mit „haben"
-- ══════════════════════════════════════════════════
('fc-a2-c21-01','A2','cap21-perfekt','phrase','Ich habe gestern gekocht.','Eu cozinhei ontem.','Perfekt com haben: auxiliar + Partizip II no final.','haben conjugado + Partizip II (final).','Ich habe am Wochenende geputzt.','Eu limpei no fim de semana.','["passado","perfekt"]',true,true),
('fc-a2-c21-02','A2','cap21-perfekt','word','geputzt','limpou/limpei','Partizip II de putzen (regular): ge- + raiz + -t.','Verbos regulares: ge- + raiz + -t.','Hast du schon geputzt?','Você já limpou?',['partizip','regular'],true,true),
('fc-a2-c21-03','A2','cap21-perfekt','word','gelesen','liu/lei','Partizip II de lesen (irregular): ge- + raiz(muda) + -en.','lesen → las (Prät) → gelesen (Part II).','Ich habe ein Buch gelesen.','Eu li um livro.',['partizip','irregular'],true,true),
('fc-a2-c21-04','A2','cap21-perfekt','phrase','aufgeräumt','organizou/arrumou','Partizip II de ausräumen (separável): prefixo + ge- + raiz + -t.','Separáveis: prefixo + ge- + raiz + t/en.','Hast du den Kühlschrank aufgeräumt?','Você arrumou a geladeira?',['separável','partizip'],true,true),
('fc-a2-c21-05','A2','cap21-perfekt','word','telefoniert','telefonou','Partizip II de telefonieren (-ieren): raiz + -t (sem ge-).','Verbos em -ieren: sem ge- no Partizip II.','Ich habe mit meiner Oma telefoniert.','Eu telefonei com minha avó.',['-ieren','partizip'],true,true),
('fc-a2-c21-06','A2','cap21-perfekt','phrase','besucht','visitou','Partizip II de besuchen (inseparável): sem ge-.','Inseparáveis (be-, ver-, ent-): sem ge-.','Ich habe meine Eltern besucht.','Eu visitei meus pais.',['inseparável','partizip'],true,true),
('fc-a2-c21-07','A2','cap21-perfekt','word','das Wochenende','o fim de semana','Neutro. Usado frequentemente em relatos de passado.','Fim de semana = tópico social comum.','Wie war dein Wochenende?','Como foi seu fim de semana?',['tempo','vocabulário'],true,true),
('fc-a2-c21-08','A2','cap21-perfekt','word','der Vormittag','a manhã (até ~12h)','Masculino. Período específico do dia.','Vormittag = antes do meio-dia.','Am Vormittag habe ich geputzt.','De manhã eu limpei.',['tempo','vocabulário'],true,true),
('fc-a2-c21-09','A2','cap21-perfekt','phrase','hat ... geschmeckt','agradou/estava bom','schmecken no Perfekt: hat + geschmeckt. Usa dativo.','schmecken + dativo: Das hat mir geschmeckt.','Hat es dir geschmeckt?','Estava bom para você?',['perfeikt','dativo'],true,true),
('fc-a2-c21-10','A2','cap21-perfekt','word','entspannt','relaxado','Adjetivo/particípio. Invariável após sein.','entspannt = estado de relaxamento.','Der Tag war sehr entspannt.','O dia foi muito relaxante.',['adjetivo','estado'],true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 22: Perfekt mit „sein"
-- ══════════════════════════════════════════════════
('fc-a2-c22-01','A2','cap22-perfekt-sein','phrase','Ich bin gefahren.','Eu fui/de viajei.','Perfekt com sein: verbos de movimento A→B.','sein conjugado + Partizip II (final).','Ich bin mit dem Zug gefahren.','Eu fui de trem.',['perfekt','sein','movimento'],true,true),
('fc-a2-c22-02','A2','cap22-perfekt-sein','word','gegangen','foi/andou','Partizip II de gehen (movimento → sein).','gehen → ging → gegangen.','Ich bin spazieren gegangen.','Eu fui caminhar.',['partizip','movimento'],true,true),
('fc-a2-c22-03','A2','cap22-perfekt-sein','word','gestiegen','subiu','Partizip II de steigen (movimento vertical → sein).','steigen → stieg → gestiegen.','Ich bin auf den Turm gestiegen.','Eu subi na torre.',['partizip','movimento'],true,true),
('fc-a2-c22-04','A2','cap22-perfekt-sein','word','geschwommen','nadou','Partizip II de schwimmen (movimento → sein).','schwimmen → schwamm → geschwommen.','Ich bin im See geschwommen.','Eu nadei no lago.',['partizip','movimento'],true,true),
('fc-a2-c22-05','A2','cap22-perfekt-sein','word','geblieben','fiquei/permaneci','Partizip II de bleiben (permanência → sein).','bleiben → blieb → geblieben.','Ich bin zu Hause geblieben.','Eu fiquei em casa.',['partizip','estado'],true,true),
('fc-a2-c22-06','A2','cap22-perfekt-sein','word','eingeschlafen','adormeceu','Partizip II de einschlafen (mudança de estado → sein).','einschlafen → schlief ein → eingeschlafen.','Das Kind ist eingeschlafen.','A criança adormeceu.',['partizip','mudança'],true,true),
('fc-a2-c22-07','A2','cap22-perfekt-sein','word','der Urlaub','as férias','Masculino, sempre singular. Usado com sein no Perfekt.','Im Urlaub sein = estar de férias.','Ich bin im Urlaub gewesen.','Eu estive de férias.',['vocabulário','tempo'],true,true),
('fc-a2-c22-08','A2','cap22-perfekt-sein','word','die Altstadt','o centro histórico','Feminino. Local turístico comum em relatos.','Altstadt = parte antiga da cidade.','Ich bin in der Altstadt spazieren gegangen.','Caminhei pelo centro histórico.',['vocabulário','lugar'],true,true),
('fc-a2-c22-09','A2','cap22-perfekt-sein','phrase','spazieren gegangen','caminhou/passeou','Partizip II de spazieren gehen (movimento → sein).','spazieren gehen: separável + sein.','Wir sind im Park spazieren gegangen.','Caminhamos no parque.',['expressão','movimento'],true,true),
('fc-a2-c22-10','A2','cap22-perfekt-sein','word','trotzdem','mesmo assim','Advérbio. Usado para contraste em narrativas.','trotzdem = apesar disso, mesmo assim.','Das Wasser war kalt, aber ich bin trotzdem geschwommen.','A água estava fria, mas nadei mesmo assim.',['advérbio','conectivo'],true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 23: Modalverben
-- ══════════════════════════════════════════════════
('fc-a2-c23-01','A2','cap23-modal','phrase','Ich muss das Medikament nehmen.','Preciso tomar o remédio.','müssen = obrigação forte. Modal + infinitivo no final.','Modal na posição 2, infinitivo no final.','Du musst viel Wasser trinken.','Você precisa beber muita água.',['modal','obrigação'],true,true),
('fc-a2-c23-02','A2','cap23-modal','phrase','Du sollst dich ausruhen.','Você deveria descansar.','sollen = conselho/recomendação. Mais educado que müssen.','sollen expressa recomendação, não ordem.','Der Arzt sagt, du sollst dich schonen.','O médico diz que você deveria se poupar.',['modal','conselho'],true,true),
('fc-a2-c23-03','A2','cap23-modal','phrase','Kann ich einen Termin vereinbaren?','Posso marcar uma consulta?','können = possibilidade/pergunta educada.','können para pedir permissão ou expressar habilidade.','Können Sie bitte langsamer sprechen?','Pode falar mais devagar, por favor?',['modal','pedido'],true,true),
('fc-a2-c23-04','A2','cap23-modal','word','dürfen','poder (permissão)','Modal para permissão/proibição. ich/er: darf.','dürfen = ter permissão. nicht dürfen = proibido.','Darf ich hier parken?','Posso estacionar aqui?',['modal','permissão'],true,true),
('fc-a2-c23-05','A2','cap23-modal','word','die Krankschreibung','o atestado médico','Feminino. Documento para justificar ausência no trabalho.','eAU = envio digital do atestado.','Ich brauche eine Krankschreibung für die Arbeit.','Preciso de um atestado para o trabalho.',['saúde','vocabulário'],true,true),
('fc-a2-c23-06','A2','cap23-modal','word','das Fieber','a febre','Neutro, sem plural. Usado com haben: Ich habe Fieber.','Fieber haben = estar com febre.','Haben Sie Fieber gemessen?','Mediu a febre?',['saúde','vocabulário'],true,true),
('fc-a2-c23-07','A2','cap23-modal','word','husten','tossir','Verbo regular. Usado com müssen/sollen em contextos médicos.','husten + Advérbio: ständig husten = tossir constantemente.','Ich muss ständig husten.','Preciso tossir constantemente.',['saúde','verbo'],true,true),
('fc-a2-c23-08','A2','cap23-modal','word','verschreiben','receitar/prescrever','Verbo forte. Arzt verschreibt Medikament.','verschreiben + Dativo (pessoa) + Akkusativo (remédio).','Der Arzt verschreibt mir ein Medikament.','O médico me receita um medicamento.',['saúde','verbo'],true,true),
('fc-a2-c23-09','A2','cap23-modal','phrase','Gute Besserung!','Melhoras!','Expressão fixa para desejar recuperação de saúde.','Usado ao se despedir de alguém doente.','Gute Besserung! Bis bald!','Melhoras! Até logo!',['expressão','saúde'],true,true),
('fc-a2-c23-10','A2','cap23-modal','word','die Apotheke','a farmácia','Feminino. Local para medicamentos de prescrição.','Apotheke ≠ Drogerie (cosméticos).','Das Medikament bekomme ich in der Apotheke.','Pego o medicamento na farmácia.',['saúde','vocabulário'],true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 24: Dativ im Alltag
-- ══════════════════════════════════════════════════
('fc-a2-c24-01','A2','cap24-dativ','phrase','Ich helfe meinem Bruder.','Ajudo meu irmão.','helfen + dativo. meu irmão = meinem Bruder (masc dat).','der → dem, ein → einem (dativo masc).','Kannst du mir helfen?','Pode me ajudar?',['dativo','verbo'],true,true),
('fc-a2-c24-02','A2','cap24-dativ','phrase','Das gefällt mir.','Isso me agrada.','gefallen + dativo. mir = a mim.','gefallen expressa gosto/preferência.','Die Wohnung gefällt mir sehr.','O apartamento me agrada muito.',['dativo','gosto'],true,true),
('fc-a2-c24-03','A2','cap24-dativ','phrase','Ich gehe zum Markt.','Vou ao mercado.','zu + dem = zum. zu exige dativo.','zu + dativo para pessoas/locais específicos.','Ich gehe zu meiner Freundin.','Vou à minha amiga.',['dativo','preposição'],true,true),
('fc-a2-c24-04','A2','cap24-dativ','phrase','Das Buch gehört mir.','O livro pertence a mim.','gehören + dativo. mir = a mim.','gehören expressa posse/propriedade.','Wem gehört das Handy? – Es gehört ihr.','A quem pertence o celular? – Pertence a ela.',['dativo','posse'],true,true),
('fc-a2-c24-05','A2','cap24-dativ','word','gegenüber','em frente a','Preposição + dativo. Posição flexível na frase.','gegenüber pode vir antes ou depois do substantivo.','Der Park liegt gegenüber dem Haus.','O parque fica em frente à casa.',['preposição','lugar'],true,true),
('fc-a2-c24-06','A2','cap24-dativ','phrase','in der Nähe von','perto de','Expressão fixa + dativo. von exige dativo.','in der Nähe von + local/pessoa.','Ich wohne in der Nähe vom Bahnhof.','Moro perto da estação.',['expressão','lugar'],true,true),
('fc-a2-c24-07','A2','cap24-dativ','word','gemütlich','aconchegante','Adjetivo. Invariável após sein.','gemütlich = conforto, ambiente agradável.','Die Wohnung ist klein, aber gemütlich.','O apartamento é pequeno, mas aconchegante.',['adjetivo','descrição'],true,true),
('fc-a2-c24-08','A2','cap24-dativ','word','die Einrichtung','a decoração/mobiliário','Feminino. Refere-se ao mobiliário/decoração.','Einrichtung = conjunto de móveis/decoração.','Die Einrichtung ist modern und praktisch.','A decoração é moderna e prática.',['vocabulário','casa'],true,true),
('fc-a2-c24-09','A2','cap24-dativ','word','der Stock / das Stockwerk','o andar','Masculino/Neutro. Contagem: Erdgeschoss = 0.','dritter Stock = terceiro andar (acima do térreo).','Ich wohne im dritten Stock.','Moro no terceiro andar.',['vocabulário','casa'],true,true),
('fc-a2-c24-10','A2','cap24-dativ','phrase','zu Fuß','a pé','Expressão fixa. Sem preposição adicional.','zu Fuß = modo de locomoção sem veículo.','Der Supermarkt ist fünf Minuten zu Fuß entfernt.','O supermercado fica a cinco minutos a pé.',['expressão','transporte'],true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 25: Adjektive
-- ══════════════════════════════════════════════════
('fc-a2-c25-01','A2','cap25-adj','phrase','eine große, freundliche Frau','uma mulher alta e simpática','Adj + adj + substantivo feminino: beide + e.','Com artigo indefinido: eine + adj-e + fem.','Sie ist eine intelligente, junge Ärztin.','Ela é uma médica inteligente e jovem.',['adjetivo','declinação'],true,true),
('fc-a2-c25-02','A2','cap25-adj','phrase','ein freundlicher Mann','um homem simpático','Artigo indefinido + masc: adj + er.','ein + adj-er + masculino nominativo.','Er ist ein zuverlässiger, ruhiger Kollege.','Ele é um colega confiável e calmo.',['adjetivo','declinação'],true,true),
('fc-a2-c25-03','A2','cap25-adj','phrase','ein helles Zimmer','um quarto claro','Artigo indefinido + neutro: adj + es.','ein + adj-es + neutro nominativo.','Das ist ein modernes, gemütliches Zimmer.','Esse é um quarto moderno e aconchegante.',['adjetivo','declinação'],true,true),
('fc-a2-c25-04','A2','cap25-adj','word','sympathisch','simpático/cativante','Adjetivo. Mais que "nett": carisma, empatia.','sympathisch = qualidade social valorizada.','Sie ist sehr sympathisch und hilfsbereit.','Ela é muito simpática e prestativa.',['adjetivo','personalidade'],true,true),
('fc-a2-c25-05','A2','cap25-adj','word','zuverlässig','confiável','Adjetivo composto: zu + verlässlich.','Qualidade essencial no trabalho e amizades.','Er ist ein zuverlässiger Freund.','Ele é um amigo confiável.',['adjetivo','personalidade'],true,true),
('fc-a2-c25-06','A2','cap25-adj','word','hilfsbereit','prestativo','Adjetivo composto: Hilfe + bereit.','hilfsbereit = disposto a ajudar.','Die Nachbarn sind sehr hilfsbereit.','Os vizinhos são muito prestativos.',['adjetivo','personalidade'],true,true),
('fc-a2-c25-07','A2','cap25-adj','phrase','genauso ... wie','tão ... quanto','Estrutura de comparação de igualdade.','genauso + adj + wie + pessoa/coisa.','Lena ist genauso kreativ wie Anna.','Lena é tão criativa quanto Anna.',['comparação','gramática'],true,true),
('fc-a2-c25-08','A2','cap25-adj','word','aussehen','parecer/ter aparência','Verbo separável: sieht ... aus. + adjetivo.','aussehen + adj = descrição física.','Du siehst heute gut aus!','Você está bem hoje!',['verbo','aparência'],true,true),
('fc-a2-c25-09','A2','cap25-adj','word','die Brille','os óculos','Feminino, sempre singular. Usar: eine Brille tragen.','Brille = acessório de estilo e função.','Sie trägt eine schwarze Brille.','Ela usa óculos pretos.',['vocabulário','aparência'],true,true),
('fc-a2-c25-10','A2','cap25-adj','word','bunt','colorido','Adjetivo. Invariável após sein, declina antes de subst.','bunt = várias cores, vibrante.','Sie trägt oft bunte Kleidung.','Ela frequentemente usa roupas coloridas.',['adjetivo','cor'],true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 26: Reflexivpronomen
-- ══════════════════════════════════════════════════
('fc-a2-c26-01','A2','cap26-reflexiv','phrase','Ich freue mich auf den Urlaub.','Estou ansioso pelo férias.','sich freuen auf + acusativo. mich = acusativo reflexivo.','auf + acusativo = expectativa futura.','Wir freuen uns auf das Wochenende.','Estamos ansiosos pelo fim de semana.',['reflexivo','expressão'],true,true),
('fc-a2-c26-02','A2','cap26-reflexiv','phrase','Ich ärgere mich über Fake News.','Eu me irrito com fake news.','sich ärgern über + acusativo. mich = acusativo.','über + acusativo = causa da irritação.','Er ärgert sich über den Stau.','Ele se irrita com o trânsito.',['reflexivo','emoção'],true,true),
('fc-a2-c26-03','A2','cap26-reflexiv','phrase','Ich kaufe mir ein Buch.','Compro um livro para mim.','Dat reflexivo quando há outro objeto direto.','mir = dativo (benefício), Buch = acusativo (objeto).','Ich kaufe dir einen Kaffee.','Compro um café para você.',['reflexivo','dativo'],true,true),
('fc-a2-c26-04','A2','cap26-reflexiv','word','sich informieren','informar-se','Reflexivo + über + acusativo. Buscar informações.','sich informieren über + tema.','Ich informiere mich online über die Nachrichten.','Informo-me online sobre as notícias.',['reflexivo','tecnologia'],true,true),
('fc-a2-c26-05','A2','cap26-reflexiv','word','sich organisieren','organizar-se','Reflexivo. Gerenciar tempo/tarefas.','sich organisieren = autogestão.','Ich muss mich besser organisieren.','Preciso me organizar melhor.',['reflexivo','rotina'],true,true),
('fc-a2-c26-06','A2','cap26-reflexiv','word','sich erinnern','lembrar-se','Reflexivo + an + acusativo. Memória/passado.','sich erinnern an + pessoa/coisa.','Erinnerst du dich an mich?','Você se lembra de mim?',['reflexivo','memória'],true,true),
('fc-a2-c26-07','A2','cap26-reflexiv','word','sich treffen','encontrar-se','Reflexivo recíproco. Wir treffen uns = nos encontramos.','sich treffen + mit + dativo (pessoa).','Wir treffen uns morgen im Café.','Nos encontramos amanhã no café.',['reflexivo','social'],true,true),
('fc-a2-c26-08','A2','cap26-reflexiv','word','sich vorbereiten','preparar-se','Reflexivo separável: bereite ... vor. + auf + akk.','sich vorbereiten auf + evento.','Ich bereite mich auf die Prüfung vor.','Estou me preparando para a prova.',['reflexivo','preparação'],true,true),
('fc-a2-c26-09','A2','cap26-reflexiv','word','vertrauenswürdig','confiável','Adjetivo composto: Vertrauen + würdig.','vertrauenswürdig = digno de confiança.','Ich informiere mich nur über vertrauenswürdige Quellen.','Só me informo por fontes confiáveis.',['adjetivo','qualidade'],true,true),
('fc-a2-c26-10','A2','cap26-reflexiv','word','sich beschränken','limitar-se','Reflexivo + auf + acusativo. Estabelecer limites.','sich beschränken auf + número/tema.','Ich beschränke mich auf drei Apps.','Limito-me a três aplicativos.',['reflexivo','controle'],true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 27: Restaurant & Konjunktiv II
-- ══════════════════════════════════════════════════
('fc-a2-c27-01','A2','cap27-restaurant','phrase','Ich hätte gern einen Salat, bitte.','Eu gostaria de uma salada, por favor.','hätte = Konjunktiv II de haben. Pedido educado.','hätte gern + acusativo = desejo cortês.','Ich hätte gern ein Wasser ohne Kohlensäure.','Gostaria de uma água sem gás.',['konjunktiv','pedido'],true,true),
('fc-a2-c27-02','A2','cap27-restaurant','phrase','Könnten Sie bitte die Rechnung bringen?','Poderia trazer a conta, por favor?','könnten = Konjunktiv II de können. Pedido formal.','Könnten Sie + infinitivo = solicitação educada.','Könnten Sie mir bitte helfen?','Poderia me ajudar, por favor?',['konjunktiv','formal'],true,true),
('fc-a2-c27-03','A2','cap27-restaurant','word','die Speisekarte','o cardápio','Feminino. Liste de pratos e bebidas.','Speisekarte = Speise (comida) + Karte (carta).','Können wir bitte die Speisekarte haben?','Podemos ver o cardápio, por favor?',['vocabulário','restaurante'],true,true),
('fc-a2-c27-04','A2','cap27-restaurant','word','die Vorspeise / Hauptspeise / Nachspeise','entrada / prato principal / sobremesa','Feminino/Masculino. Estrutura tradicional de refeição.','Vorspeise = antes do principal. Nachspeise = depois.','Ich nehme die Suppe als Vorspeise.','Pego a sopa como entrada.',['vocabulário','refeição'],true,true),
('fc-a2-c27-05','A2','cap27-restaurant','word','still / sprudelnd','sem gás / com gás','Adjetivos para água mineral. Escolha obrigatória.','still = sem gás, sprudelnd = com gás.','Ein Wasser, bitte. Sprudelnd.','Uma água, por favor. Com gás.',['vocabulário','bebida'],true,true),
('fc-a2-c27-06','A2','cap27-restaurant','word','schmecken','ter gosto/agradar','Verbo + dativo. Hat es Ihnen geschmeckt? = Gostaram?','schmecken + dativo: Das schmeckt mir.','Die Suppe schmeckt den Kindern.','A sopa agrada às crianças.',['verbo','dativo'],true,true),
('fc-a2-c27-07','A2','cap27-restaurant','phrase','Die Rechnung, bitte.','A conta, por favor.','Frase fixa para solicitar pagamento.','Rechnung = feminino. Sempre com artigo.','Könnten wir bitte die Rechnung bekommen?','Poderíamos receber a conta, por favor?',['expressão','pagamento'],true,true),
('fc-a2-c27-08','A2','cap27-restaurant','word','zusammen / getrennt','juntos / separados','Advérbios para dividir a conta.','Getrennt bezahlen = cada um paga o seu.','Zusammen oder getrennt, bitte?','Juntos ou separados, por favor?',['vocabulário','pagamento'],true,true),
('fc-a2-c27-09','A2','cap27-restaurant','word','das Trinkgeld','a gorjeta','Neutro. Deixado verbalmente: "Stimmt so".','Trinkgeld = 5-10% do valor, dito ao pagar.','35 Euro, stimmt so. (conta 30€ + 5€ gorjeta)','35 euros, pode ficar.',['vocabulário','cultura'],true,true),
('fc-a2-c27-10','A2','cap27-restaurant','phrase','Hat es Ihnen geschmeckt?','Gostaram da comida?','Pergunta padrão do garçom após a refeição.','schmecken no Perfekt + dativo formal.','Ja, ausgezeichnet! Danke.','Sim, excelente! Obrigado.',['expressão','restaurante'],true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 28: Präteritum
-- ══════════════════════════════════════════════════
('fc-a2-c28-01','A2','cap28-präteritum','phrase','Ich war Studentin.','Eu era estudante.','Präteritum de sein: ich war. Narrativas passadas.','war = passado de ser/estar. Uso: escrita/narrativa.','Ich war 2020 in Berlin.','Eu estava em Berlim em 2020.',['präteritum','sein'],true,true),
('fc-a2-c28-02','A2','cap28-präteritum','phrase','Ich hatte viele Freunde.','Eu tinha muitos amigos.','Präteritum de haben: ich hatte. Posse no passado.','hatte = passado de ter. Uso comum em biografias.','Sie hatte einen interessanten Job.','Ela tinha um emprego interessante.',['präteritum','haben'],true,true),
('fc-a2-c28-03','A2','cap28-präteritum','word','besuchte','visitei','Präteritum de besuchen (regular): besuch + te.','Regulares: raiz + te + terminação.','Ich besuchte meine Eltern am Wochenende.','Visitei meus pais no fim de semana.',['präteritum','regular'],true,true),
('fc-a2-c28-04','A2','cap28-präteritum','word','lernte','aprendi','Präteritum de lernen (regular): lern + te.','Verbos em -n: raiz + te (sem e extra).','Ich lernte schnell die neue Software.','Aprendi rápido o novo software.',['präteritum','regular'],true,true),
('fc-a2-c28-05','A2','cap28-präteritum','word','arbeitete','trabalhei','Präteritum de arbeiten: arbeit + ete (raiz em t).','Raiz em t/d/m/n ganha -ete para pronúncia.','Ich arbeitete bei einer Marketingfirma.','Trabalhei em uma empresa de marketing.',['präteritum','regular'],true,true),
('fc-a2-c28-06','A2','cap28-präteritum','word','las','li','Präteritum de lesen (irregular): muda vogal.','lesen → las (ich/er). Irregular forte.','Ich las ein interessantes Buch.','Li um livro interessante.',['präteritum','irregular'],true,true),
('fc-a2-c28-07','A2','cap28-präteritum','word','traf','encontrei','Präteritum de treffen (irregular): trifft → traf.','treffen → traf → getroffen. Encontro casual.','Ich traf meinen Freund im Café.','Encontrei meu amigo no café.',['präteritum','irregular'],true,true),
('fc-a2-c28-08','A2','cap28-präteritum','word','damals','naquela época','Advérbio temporal. Refere-se a período passado.','damals = naquele tempo, naquela época.','Damals wohnte ich in einer WG.','Naquela época, eu morava em uma república.',['advérbio','tempo'],true,true),
('fc-a2-c28-09','A2','cap28-präteritum','word','die WG','apartamento dividido','Feminino, abreviação de Wohngemeinschaft.','WG = moradia compartilhada, comum entre jovens.','Ich wohnte in einer kleinen WG.','Morei em um pequeno apartamento dividido.',['vocabulário','moradia'],true,true),
('fc-a2-c28-10','A2','cap28-präteritum','phrase','zuerst / dann / danach','primeiro / depois / em seguida','Conectivos temporais para narrativas ordenadas.','Organizam sequência de eventos no passado.','Zuerst besuchte ich meine Eltern, dann kochte ich.','Primeiro visitei meus pais, depois cozinhei.',['conectivo','narrativa'],true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 29: Zwei Objekte (Dativ + Akkusativ)
-- ══════════════════════════════════════════════════
('fc-a2-c29-01','A2','cap29-zwei-obj','phrase','Ich schenke meiner Mutter eine Blume.','Dou uma flor à minha mãe.','schenken + dativo (pessoa) + acusativo (coisa).','Ordem: Dat (pessoa) antes de Akk (coisa).','Er schenkt seinem Freund ein Buch.','Ele dá um livro ao seu amigo.',['dativo','acusativo'],true,true),
('fc-a2-c29-02','A2','cap29-zwei-obj','phrase','Kannst du mir die Wahrheit sagen?','Pode me dizer a verdade?','sagen + dativo (pessoa) + acusativo (informação).','mir = dativo, die Wahrheit = acusativo.','Sie sagt mir einen wichtigen Termin.','Ela me diz um compromisso importante.',['dativo','acusativo'],true,true),
('fc-a2-c29-03','A2','cap29-zwei-obj','phrase','Ich kaufe dir ein Eis.','Compro um sorvete para você.','kaufen + dativo (beneficiário) + acusativo (objeto).','kaufen para alguém = gesto de carinho.','Wir kaufen unseren Eltern ein Geschenk.','Compramos um presente para nossos pais.',['dativo','acusativo'],true,true),
('fc-a2-c29-04','A2','cap29-zwei-obj','word','geben','dar','Verbo forte: gab, gegeben. + dat + akk.','geben = transferência direta. Ich gebe dir das Buch.','Er gibt mir die Schlüssel.','Ele me dá as chaves.',['verbo','dativo'],true,true),
('fc-a2-c29-05','A2','cap29-zwei-obj','word','bringen','trazer','Verbo forte: brachte, gebracht. + dat + akk.','bringen = trazer algo para alguém.','Kannst du mir das Buch bringen?','Pode me trazer o livro?',['verbo','dativo'],true,true),
('fc-a2-c29-06','A2','cap29-zwei-obj','word','zeigen','mostrar','Verbo regular. + dativo (pessoa) + acusativo (objeto).','zeigen = apresentar visualmente.','Zeigst du mir das Foto?','Você me mostra a foto?',['verbo','dativo'],true,true),
('fc-a2-c29-07','A2','cap29-zwei-obj','phrase','Wem schenkst du das Buch?','Para quem você dá o livro?','wem = dativo de wer. Pergunta sobre destinatário.','wem = para quem (dativo).','Ich schenke es meiner Schwester.','Dou para minha irmã.',['pergunta','dativo'],true,true),
('fc-a2-c29-08','A2','cap29-zwei-obj','word','das Geschenk','o presente','Neutro. schenken = dar de presente.','Geschenk = objeto dado em ocasiões especiais.','Ich habe ein schönes Geschenk bekommen.','Recebi um presente bonito.',['vocabulário','social'],true,true),
('fc-a2-c29-09','A2','cap29-zwei-obj','word','der Gutschein','o voucher/vale-presente','Masculino. Presente flexível: escolha do destinatário.','Gutschein für + atividade/loja.','Ich schenke dir einen Gutschein für ein Spa.','Dou a você um voucher para um spa.',['vocabulário','presente'],true,true),
('fc-a2-c29-10','A2','cap29-zwei-obj','phrase','von Herzen','do coração','Expressão fixa. Origem emocional do gesto.','von + dativo (Herzen = dativo de Herz).','Schenken macht Spaß, wenn es von Herzen kommt.','Dar presentes é divertido quando vem do coração.',['expressão','emoção'],true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULO 30: Formelle Sprache
-- ══════════════════════════════════════════════════
('fc-a2-c30-01','A2','cap30-formal','phrase','Ich möchte ein Paket versenden.','Gostaria de enviar um pacote.','möchten = cortesia. versenden = enviar remessa.','versenden = termo formal para correios/envios.','Ich möchte diesen Brief nach Brasilien versenden.','Gostaria de enviar esta carta para o Brasil.',['formal','pedido'],true,true),
('fc-a2-c30-02','A2','cap30-formal','phrase','Füllen Sie bitte dieses Formular aus.','Preencha este formulário, por favor.','ausfüllen = separável. Imperativo formal.','Formular = neutro. ausfüllen = preencher.','Können Sie mir das Formular geben?','Pode me dar o formulário?',['formal','instrução'],true,true),
('fc-a2-c30-03','A2','cap30-formal','phrase','Könnten Sie mir bitte helfen?','Poderia me ajudar, por favor?','könnten = Konjunktiv II. Pedido muito educado.','könnten + Sie + infinitivo = máxima cortesia.','Könnten Sie das bitte wiederholen?','Poderia repetir isso, por favor?',['konjunktiv','cortesia'],true,true),
('fc-a2-c30-04','A2','cap30-formal','word','die IBAN','a IBAN (conta bancária)','Feminino, sigla internacional. Necessária para transferências.','IBAN = International Bank Account Number.','Haben Sie die IBAN des Empfängers?','Tem a IBAN do destinatário?',['vocabulário','banco'],true,true),
('fc-a2-c30-05','A2','cap30-formal','word','überweisen','transferir (dinheiro)','Verbo separável. überweisen + acusativo (valor).','Geld überweisen = fazer transferência bancária.','Ich möchte 100 Euro überweisen.','Gostaria de transferir 100 euros.',['verbo','banco'],true,true),
('fc-a2-c30-06','A2','cap30-formal','word','der Verwendungszweck','a finalidade da transferência','Masculino, composto. Explica motivo do pagamento.','Verwendungszweck obrigatório em transferências.','Der Verwendungszweck ist „Miete Mai".','A finalidade é "Aluguel Maio".',['vocabulário','banco'],true,true),
('fc-a2-c30-07','A2','cap30-formal','word','unterschreiben','assinar','Verbo forte: unterschrieb, unterschrieben.','unterschreiben + acusativo (documento).','Bitte unterschreiben Sie hier.','Por favor, assine aqui.',['verbo','formal'],true,true),
('fc-a2-c30-08','A2','cap30-formal','word','der Sendungscode','o código de rastreamento','Masculino. Para acompanhar encomendas online.','Sendungscode = código único por envio.','Damit können Sie das Paket verfolgen.','Com ele, você pode rastrear o pacote.',['vocabulário','correios'],true,true),
('fc-a2-c30-09','A2','cap30-formal','word','bar','em dinheiro','Advérbio/adjetivo. bar zahlen = pagar em cédulas.','bar ≠ mit Karte. Ainda comum em pequenos comércios.','Kann ich bar zahlen?','Posso pagar em dinheiro?',['vocabulário','pagamento'],true,true),
('fc-a2-c30-10','A2','cap30-formal','phrase','Vielen Dank für Ihre Hilfe!','Muito obrigado pela sua ajuda!','Expressão formal de agradecimento. Ihre = formal.','Vielen Dank + für + acusativo = gratidão específica.','Vielen Dank für Ihre Geduld!','Muito obrigado pela sua paciência!',['expressão','cortesia'],true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULOS 31-35 (Compactado para manter limite)
-- ══════════════════════════════════════════════════
('fc-a2-c31-01','A2','cap31-dativ','phrase','Ich helfe dir beim Umzug.','Ajudo você na mudança.','helfen + dativo. beim = bei + dem (dativo).','bei + dativo = durante/na ocasião de.','Kannst du mir beim Kochen helfen?','Pode me ajudar a cozinhar?',['dativo','ajuda'],true,true),
('fc-a2-c31-02','A2','cap31-dativ','word','gehören','pertencer','Verbo + dativo. Das gehört mir = Isso é meu.','gehören expressa posse permanente.','Wem gehört dieses Fahrrad?','A quem pertence esta bicicleta?',['verbo','dativo'],true,true),
('fc-a2-c31-03','A2','cap31-dativ','word','gratulieren','parabenizar','Verbo + dativo. Ich gratuliere dir zum Geburtstag.','gratulieren + dativo + zu + dativo.','Ich gratuliere dir zum Erfolg!','Parabenizo você pelo sucesso!',['verbo','dativo'],true,true),
('fc-a2-c31-04','A2','cap31-dativ','word','die Ostsee','o Mar Báltico','Feminino, nome próprio. Destino de férias popular.','an die Ostsee fahren = ir ao Mar Báltico.','Im Sommer fahre ich an die Ostsee.','No verão vou ao Mar Báltico.',['vocabulário','lugar'],true,true),
('fc-a2-c31-05','A2','cap31-dativ','word','gegenseitig','mutuamente','Advérbio. Ação recíproca entre pessoas.','gegenseitig = um ao outro, reciprocamente.','Wir helfen uns gegenseitig.','Nós nos ajudamos mutuamente.',['advérbio','social'],true,true),

('fc-a2-c32-01','A2','cap32-genitiv','phrase','das Buch meiner Freundin','o livro da minha namorada','Genitivo feminino: der → sem mudança no artigo.','meiner Freundin = genitivo de meine Freundin.','Die Sprache der Autorin ist klar.','A linguagem da autora é clara.',['genitivo','posse'],true,true),
('fc-a2-c32-02','A2','cap32-genitiv','phrase','das Auto meines Nachbarn','o carro do meu vizinho','Genitivo masculino: des + (e)s no substantivo.','meines Nachbarn = genitivo de mein Nachbar.','Die Meinung des Chefs ist wichtig.','A opinião do chefe é importante.',['genitivo','posse'],true,true),
('fc-a2-c32-03','A2','cap32-genitiv','word','wessen?','de quem?','Pronome interrogativo do genitivo. Formal.','wessen? = pergunta sobre posse formal.','Wessen Buch ist das? – Das ist Annas Buch.','De quem é este livro? – É o livro da Anna.',['pergunta','genitivo'],true,true),
('fc-a2-c32-04','A2','cap32-genitiv','phrase','von + dativo','de (informal)','Alternativa informal ao genitivo. Mais comum na fala.','von + dativo = posse em linguagem cotidiana.','Das ist das Handy von meinem Bruder.','Isso é o celular do meu irmão.',['preposição','posse'],true,true),
('fc-a2-c32-05','A2','cap32-genitiv','word','die Autorin','a autora','Feminino de Autor. Genitivo: der Autorin.','Autorin = mulher que escreve obras literárias.','Die Werke der Autorin sind berühmt.','As obras da autora são famosas.',['vocabulário','profissão'],true,true),

('fc-a2-c33-01','A2','cap33-weil-dass','phrase','Ich lerne Deutsch, weil ich in Berlin studieren möchte.','Aprendo alemão porque quero estudar em Berlim.','weil + oração subordinada: verbo no final.','weil = causa. Verbo conjugado vai para o final.','Ich bleibe zu Hause, weil es regnet.','Fico em casa porque está chovendo.',['weil','subordinada'],true,true),
('fc-a2-c33-02','A2','cap33-weil-dass','phrase','Ich glaube, dass du recht hast.','Acredito que você tem razão.','dass + oração subordinada: verbo no final.','dass introduz conteúdo/opinião/fato.','Er sagt, dass er morgen kommt.','Ele diz que vem amanhã.',['dass','subordinada'],true,true),
('fc-a2-c33-03','A2','cap33-weil-dass','word','hoffen','esperar/torcer','Verbo + dass. hoffen auf + acusativo (alternativa).','hoffen expressa desejo/expectativa positiva.','Ich hoffe, dass der Kurs gut ist.','Espero que o curso seja bom.',['verbo','dass'],true,true),
('fc-a2-c33-04','A2','cap33-weil-dass','word','glauben','acreditar/achar','Verbo + dass. glauben an + acusativo (crença).','glauben = opinião pessoal, não certeza absoluta.','Ich glaube, dass Deutsch schön ist.','Acho que o alemão é bonito.',['verbo','opinião'],true,true),
('fc-a2-c33-05','A2','cap33-weil-dass','word','die Volkshochschule','a escola popular (VHS)','Feminino. Cursos acessíveis para adultos.','VHS oferece idiomas, cultura, habilidades práticas.','Ich besuche einen Deutschkurs an der Volkshochschule.','Frequento um curso de alemão na VHS.',['vocabulário','educação'],true,true),

('fc-a2-c34-01','A2','cap34-wenn-ob','phrase','Wenn ich Zeit habe, lerne ich Deutsch.','Se eu tiver tempo, aprendo alemão.','wenn = condição/tempo. Verbo no final na subordinada.','wenn + subj + ... + verbo final, principal.','Wenn es regnet, bleibe ich zu Hause.','Se chover, fico em casa.',['wenn','condição'],true,true),
('fc-a2-c34-02','A2','cap34-wenn-ob','phrase','Ich weiß nicht, ob er kommt.','Não sei se ele vem.','ob = dúvida/pergunta indireta. Verbo no final.','ob após verbos de dúvida: wissen, fragen, unsicher.','Ich frage mich, ob das klappt.','Pergunto-me se isso vai dar certo.',['ob','dúvida'],true,true),
('fc-a2-c34-03','A2','cap34-wenn-ob','word','überlegen','pensar/considerar','Verbo reflexivo opcional. überlegen, ob + subordinada.','überlegen = ponderar opções antes de decidir.','Ich überlege, ob ich reisen soll.','Estou pensando se devo viajar.',['verbo','decisão'],true,true),
('fc-a2-c34-04','A2','cap34-wenn-ob','word','falls','caso','Conjunção condicional formal. Similar a wenn.','falls + subordinada: verbo no final.','Falls du Fragen hast, melde dich.','Caso tenha dúvidas, entre em contato.',['conjunção','formal'],true,true),
('fc-a2-c34-05','A2','cap34-wenn-ob','word','die Küste','a costa','Feminino. Destino turístico: an die Küste fahren.','an + acusativo para movimento: an die Küste.','Im Sommer fahre ich an die Küste.','No verão vou para a costa.',['vocabulário','lugar'],true,true),

('fc-a2-c35-01','A2','cap35-präteritum','phrase','Am Samstag besuchte ich meine Eltern.','No sábado visitei meus pais.','Präteritum regular em narrativa escrita/formal.','Ordem temporal: Tempo + verbo + sujeito + complemento.','Am Sonntag las ich ein Buch.','No domingo li um livro.',['präteritum','narrativa'],true,true),
('fc-a2-c35-02','A2','cap35-präteritum','word','bestand','passei (prova)','Präteritum de bestehen (irregular): bestand.','bestehen + acusativo: prova/exame.','Ich bestand die Prüfung letzte Woche.','Passei na prova semana passada.',['präteritum','conquista'],true,true),
('fc-a2-c35-03','A2','cap35-präteritum','word','schrieb','escrevi','Präteritum de schreiben (irregular): schrieb.','schreiben → schrieb → geschrieben.','Ich schrieb eine E-Mail an meine Chefin.','Escrevi um e-mail para minha chefe.',['präteritum','irregular'],true,true),
('fc-a2-c35-04','A2','cap35-präteritum','word','telefonierte','telefonei','Präteritum de telefonieren (regular em -ieren).','telefonieren → telefonierte (sem ge- no Partizip).','Ich telefonierte mit meiner Schwester.','Telefonei com minha irmã.',['präteritum','regular'],true,true),
('fc-a2-c35-05','A2','cap35-präteritum','word','feierte','comemorei','Präteritum de feiern (regular): feier + te.','feiern + acusativo: evento/ocasião.','Ich feierte mit einer kleinen Party.','Comemorei com uma festinha.',['präteritum','social'],true,true),

-- ══════════════════════════════════════════════════
-- CAPÍTULOS 36-39
-- ══════════════════════════════════════════════════
('fc-a2-c36-01','A2','cap36-man','phrase','Man lernt Deutsch durch Übung.','Aprende-se alemão com prática.','man = pronome impessoal. Verbo na 3ª pessoa singular.','man = se/a gente. Generalizações e conselhos.','Man kann hier gut essen.','Pode-se comer bem aqui.',['man','generalização'],true,true),
('fc-a2-c36-02','A2','cap36-man','phrase','Man sollte viel Wasser trinken.','Deve-se beber muita água.','sollen + man = conselho universal. mais educado.','man sollte = recomendação geral, não ordem pessoal.','Man sollte früh schlafen gehen.','Deve-se dormir cedo.',['man','conselho'],true,true),
('fc-a2-c36-03','A2','cap36-man','word','am besten','da melhor forma','Expressão superlativa. am + adjetivo + besten.','am besten = forma ideal/mais eficaz.','Wie lernt man am besten Deutsch?','Como se aprende alemão da melhor forma?',['expressão','otimização'],true,true),
('fc-a2-c36-04','A2','cap36-man','word','der Muttersprachler','o falante nativo','Masculino. Feminino: die Muttersprachlerin.','mit Muttersprachlern sprechen = prática autêntica.','Ich spreche gern mit Muttersprachlern.','Gosto de conversar com falantes nativos.',['vocabulário','aprendizado'],true,true),
('fc-a2-c36-05','A2','cap36-man','word','Silvester','o Ano-Novo (réveillon)','Neutro, nome próprio. Celebração em 31 de dezembro.','an Silvester = na véspera de Ano-Novo.','An Silvester zündet man Feuerwerk an.','No Réveillon acende-se fogos de artifício.',['vocabulário','cultura'],true,true),

('fc-a2-c37-01','A2','cap37-symptome','phrase','Ich habe starke Kopfschmerzen.','Estou com forte dor de cabeça.','haben + sintoma (plural). stark = intensidade.','Kopfschmerzen = sempre plural. Kopfschmerz singular raro.','Ich habe seit gestern Kopfschmerzen.','Estou com dor de cabeça desde ontem.',['saúde','sintoma'],true,true),
('fc-a2-c37-02','A2','cap37-symptome','phrase','Mir ist schwindelig.','Estou tonto.','mir ist + adjetivo = sensação física/estado.','schwindelig = tontura, vertigem. Invariável.','Mir ist oft schwindelig, wenn ich schnell aufstehe.','Frequentemente fico tonto quando me levanto rápido.',['saúde','sensação'],true,true),
('fc-a2-c37-03','A2','cap37-symptome','phrase','Es tut mir am Kopf weh.','Dói na minha cabeça.','Körperteil + tut weh. Expressão fixa para dor.','tut weh = dói (3ª pessoa). wehtun separável.','Mein Bauch tut weh.','Minha barriga dói.',['saúde','dor'],true,true),
('fc-a2-c37-04','A2','cap37-symptome','word','der Spannungskopfschmerz','a cefaleia tensional','Masculino, composto médico. Dor por estresse/tensão.','Spannung = tensão. Kopfschmerz = dor de cabeça.','Das könnte ein Spannungskopfschmerz sein.','Pode ser uma cefaleia tensional.',['vocabulário','médico'],true,true),
('fc-a2-c37-05','A2','cap37-symptome','word','ausreichend','suficiente/adequado','Adjetivo/advérbio. Quantidade adequada para necessidade.','ausreichend Wasser = hidratação adequada.','Trinken Sie ausreichend Wasser.','Beba água suficiente.',['adjetivo','saúde'],true,true),

('fc-a2-c38-01','A2','cap38-zukunft','phrase','Ich werde im August nach Portugal fahren.','Vou viajar para Portugal em agosto.','Futur I: werden + infinitivo no final. Ênfase/promessa.','werden conjugado + ... + infinitivo (final).','Ich werde mein Bestes geben!','Vou dar o meu melhor!',['futur','planejamento'],true,true),
('fc-a2-c38-02','A2','cap38-zukunft','phrase','Im August fahre ich nach Portugal.','Vou a Portugal em agosto.','Presente + marcador de tempo = futuro (uso comum).','Mais natural na fala que Futur I para planos concretos.','Nächste Woche sehe ich mir Wohnungen an.','Na semana que vem, vou olhar apartamentos.',['presente','futuro'],true,true),
('fc-a2-c38-03','A2','cap38-zukunft','word','vorhaben','ter a intenção de','Verbo separável: habe ... vor. + zu + infinitivo.','vorhaben = plano/intenção pessoal, menos formal que werden.','Ich habe vor, Deutsch zu lernen.','Tenho a intenção de aprender alemão.',['verbo','intenção'],true,true),
('fc-a2-c38-04','A2','cap38-zukunft','word','wahrscheinlich','provavelmente','Advérbio de probabilidade. Posição flexível (geralmente 1ª).','wahrscheinlich = mais provável que nicht, menos que sicher.','Ich werde wahrscheinlich in München wohnen.','Provavelmente vou morar em Munique.',['advérbio','probabilidade'],true,true),
('fc-a2-c38-05','A2','cap38-zukunft','word','sich etwas ansehen','olhar/visitar (imóvel)','Reflexivo separável: sehe ... an. + acusativo.','sich (dat) + etwas (akk) + ansehen = examinar visualmente.','Ich werde mir nächste Woche Wohnungen ansehen.','Vou olhar alguns apartamentos na semana que vem.',['reflexivo','imóvel'],true,true),

('fc-a2-c39-01','A2','cap39-alltag','phrase','Ich arbeite von 9 bis 17 Uhr.','Trabalho das 9h às 17h.','von ... bis = intervalo de tempo fechado.','von + hora, bis + hora. Preposições fixas.','Ich habe von Montag bis Freitag Arbeit.','Trabalho de segunda a sexta.',['tempo','rotina'],true,true),
('fc-a2-c39-02','A2','cap39-alltag','phrase','Zweimal pro Woche kann ich im Homeoffice arbeiten.','Duas vezes por semana posso trabalhar em home office.','Frequência + modal + local. pro + acusativo = por.','pro Woche/Monat = por semana/mês. Invariável.','Dreimal pro Jahr besuche ich meine Eltern.','Três vezes por ano visito meus pais.',['frequência','trabalho'],true,true),
('fc-a2-c39-03','A2','cap39-alltag','word','abwechslungsreich','variado/diversificado','Adjetivo composto: Abwechslung + reich. Positivo.','abwechslungsreich = com variedade, não monótono.','Die Aufgaben sind abwechslungsreich.','As tarefas são variadas.',['adjetivo','trabalho'],true,true),
('fc-a2-c39-04','A2','cap39-alltag','word','weiterqualifizieren','qualificar-se mais','Verbo separável: qualifiziere ... weiter. Reflexivo opcional.','weiter = mais, adicional. Qualificação profissional contínua.','Ich möchte mich weiterqualifizieren.','Quero me qualificar mais.',['verbo','carreira'],true,true),
('fc-a2-c39-05','A2','cap39-alltag','word','bewusst','consciente/intencional','Adjetivo/advérbio. Ação com intenção/reflexão.','bewusst Pause machen = pausa intencional, não acidental.','Am Wochenende mache ich bewusst Pause.','No fim de semana, faço uma pausa consciente.',['advérbio','bem-estar'],true,true),

-- ══════════════════════════════════════════════════
-- PROVA FINAL A2 (a2-exam)
-- ══════════════════════════════════════════════════
('fc-a2-exam-01','A2','exam-general','word','die Prüfung / bestehen / der Punkt / die Note','a prova / passar / o ponto / a nota','Vocabulário de avaliação. Prüfung=fem. bestehen=regular.','Punkt=masc. Note=fem. bestehen + acusativo.','Ich bestehe die Prüfung! Ich habe 80 Punkte.','Eu passo na prova! Tenho 80 pontos.',['exame','vocabulário'],true,true),
('fc-a2-exam-02','A2','exam-parts','word','Hören / Lesen / Schreiben / Sprechen / Grammatik','Ouvir / Ler / Escrever / Falar / Gramática','As 5 partes da prova. Substantivização de verbos (neutros).','Todas neutras: das Hören, das Lesen... Grammatik=fem.','Teil 1 ist Hören. Teil 5 ist Grammatik.','Parte 1 é Ouvir. Parte 5 é Gramática.',['exame','estrutura'],true,true),
('fc-a2-exam-03','A2','exam-action','word','antworten / fragen / korrigieren / wiederholen','responder / perguntar / corrigir / repetir','Ações durante a prova. antworten+dat. korrigieren=regular.','fragen+akk. wiederholen=separável.','Bitte antworten Sie klar. Ich korrigiere die Fehler.','Por favor responda claro. Corrijo os erros.',['exame','verbo'],true,true),
('fc-a2-exam-04','A2','exam-status','word','richtig / falsch / unklar / bestanden','correto / errado / pouco claro / aprovado','Avaliação de desempenho. Adjetivos invariáveis.','bestanden = particípio de bestehen. unklar = ambíguo.','Die Antwort ist richtig. Der Satz ist unklar.','A resposta está correta. A frase está pouco clara.',['avaliação','adjetivo'],true,true),
('fc-a2-exam-05','A2','exam-mindset','phrase','Keine Angst! / Konzentrier dich! / Du schaffst das!','Sem medo! / Concentre-se! / Você consegue!','Frases de apoio pré-prova. Imperativos e encorajamento.','Angst=fem. Konzentrieren=reflexivo. Schaffen=conseguir.','Keine Angst vor Fehlern! Konzentrier dich! Du schaffst das!','Sem medo de errar! Concentre-se! Você consegue!',['motivação','exame'],true,true),
('fc-a2-exam-06','A2','exam-strategy','phrase','Lies genau! / Hör gut zu! / Prüfe deine Antworten!','Leia com atenção! / Ouça bem! / Verifique suas respostas!','Imperativos de estratégia. genau=exato. prüfen=verificar.','zu+hören=escutar ativamente. Antworten=plural.','Lies die Frage genau! Hör dem Text zu! Prüfe alles!','Leia a pergunta com atenção! Ouça o texto! Verifique tudo!',['estratégia','imperativo'],true,true)

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
    m.level,
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
LEFT JOIN flashcards_v2 f ON m.slug = f.module_slug AND f.active = true
WHERE m.active = true
GROUP BY m.slug, m.level, m.title_pt, m.title_de, m.chapter_number
ORDER BY m.level, m.sort_order;

-- View: Flashcards curados por capítulo (A2: 21-39 + exam)
CREATE OR REPLACE VIEW v_curated_flashcards_by_chapter AS
SELECT 
    CASE 
        WHEN slug ~ '^fc-a2-c(2[1-9]|3[0-9])-' THEN (SUBSTRING(slug FROM 'fc-a2-c(\d+)-'))::INT
        WHEN slug LIKE 'fc-a2-exam%' THEN 99
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
    m.level,
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
ORDER BY m.level, m.sort_order, l.sort_order, e.sort_order;

-- ══════════════════════════════════════════════════
-- BLOCO 9 — Comentários Finais e Instruções de Uso
-- ══════════════════════════════════════════════════
/*
╔════════════════════════════════════════════════════════════════╗
║  🎉 DEUTSCH HUB — 04_a2_data.sql — CONCLUÍDO!                  ║
════════════════════════════════════════════════════════════════╣
║  Este script popula seu banco com:                              ║
║  • 20 módulos A2 (capítulos 21-39 + prova final)               ║
║  • ~57 lessons com diálogos, gramática e cultura               ║
║  • 190 exercícios (múltipla escolha, preencher, traduzir)      ║
║  • ~230 flashcards curados com vocabulário essencial A2        ║
║  • Views otimizadas para frontend do hub                       ║
╠════════════════════════════════════════════════════════════════╣
║  ORDEM DE EXECUÇÃO DOS SCRIPTS:                                ║
║  1. 01_schema.sql      → Cria tabelas e tipos                  ║
║  2. 02_tables.sql      → Cria constraints e índices base       ║
║  3. 03_a1_data.sql     → Popula dados A1                       ║
║  4. 04_a2_data.sql     → ← ESTE ARQUIVO → Popula dados A2      ║
║  5. 04_rls.sql         → Aplica Row Level Security (se usar)   ║
║  6. 05_functions.sql   → Cria funções utilitárias (opcional)   ║
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
║  • Criar 05_b1_data.sql para nível B1                          ║
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
    RAISE NOTICE '✅ DEUTSCH HUB: Dados A2 carregados com sucesso!';
    RAISE NOTICE '📊 Resumo A2: % módulos, % lessons, % exercícios, % flashcards',
        (SELECT COUNT(*) FROM study_modules WHERE level = 'A2'),
        (SELECT COUNT(*) FROM study_lessons WHERE level = 'A2'),
        (SELECT COUNT(*) FROM study_exercises WHERE level = 'A2'),
        (SELECT COUNT(*) FROM flashcards_v2 WHERE level = 'A2');
    RAISE NOTICE '🚀 Próximo passo: Execute 04_rls.sql (se aplicável) e inicie seu hub!';
END $$;

-- ══════════════════════════════════════════════════
-- FIM DO ARQUIVO 04_a2_data.sql
-- ══════════════════════════════════════════════════