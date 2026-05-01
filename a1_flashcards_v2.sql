-- ============================================================
-- DEUTSCH HUB — FLASHCARDS CURADOS A1 (flashcards_v2)
-- Complemento do arquivo a1_study_library.sql
-- Roda no Supabase SQL Editor
-- ============================================================

INSERT INTO flashcards_v2 (slug, level, theme, front_de, back_pt, explanation_pt, grammar_note, example_de, example_pt, tags, curated, active)
VALUES

-- ==============================
-- TEMA: dia-a-dia (Cap. 1)
-- ==============================
('a1-dia-guten-morgen', 'A1', 'dia-a-dia',
 'Guten Morgen!', 'Bom dia!',
 'Cumprimento formal usado pela manhã. Informal: Morgen!',
 'Substantivos em alemão têm maiúscula. Morgen (manhã) → Guten Morgen.',
 'Guten Morgen, Frau Müller!', 'Bom dia, senhora Müller!',
 '["cumprimentos","formal","manhã"]', true, true),

('a1-dia-hallo', 'A1', 'dia-a-dia',
 'Hallo! Wie geht''s?', 'Oi! Como vai?',
 'Wie geht''s? = forma curta de "Wie geht es dir?". Resposta: Gut, danke!',
 'Geht''s = geht + es (contraído). Só em contexto informal.',
 'Hallo Lukas! Wie geht''s dir?', 'Oi Lukas! Como você vai?',
 '["cumprimentos","informal","conversa"]', true, true),

('a1-dia-ich-heisse', 'A1', 'dia-a-dia',
 'Ich heiße... / Mein Name ist...', 'Meu nome é...',
 'Ambas as formas estão corretas. "Ich heiße" é mais casual; "Mein Name ist" é um pouco mais formal.',
 'heißen = chamar-se. ich heiße, du heißt, er/sie heißt.',
 'Ich heiße Rebeca. Und Sie?', 'Meu nome é Rebeca. E o senhor/a senhora?',
 '["apresentação","essencial"]', true, true),

('a1-dia-freut-mich', 'A1', 'dia-a-dia',
 'Freut mich! / Freut mich auch!', 'Muito prazer! / Igualmente!',
 'Freut mich = me agrada conhecer você. Freut mich auch = me agrada também.',
 'freuen (alegrar) + mich (me). Reflexivo com acusativo.',
 'Ich heiße Hans. — Freut mich! Ich bin Rebeca.', 'Me chamo Hans. — Muito prazer! Eu sou Rebeca.',
 '["apresentação","essencial"]', true, true),

('a1-dia-tschuess', 'A1', 'dia-a-dia',
 'Tschüss! / Auf Wiedersehen!', 'Tchau! / Até logo!',
 'Tschüss = informal. Auf Wiedersehen = formal. Bis bald = até logo (breve). Bis morgen = até amanhã.',
 'Wiedersehen = voltar a ver. Auf = em (sentido de "de volta a").',
 'Tschüss, bis morgen!', 'Tchau, até amanhã!',
 '["despedida","essencial"]', true, true),

('a1-dia-entschuldigung', 'A1', 'dia-a-dia',
 'Entschuldigung! / Verzeihung!', 'Com licença! / Desculpe!',
 'Entschuldigung = com licença para passar OU desculpe por um erro. Serve para os dois casos.',
 'Entschuldigung vem de "entschuldigen" = desculpar. Substantivo feminino: die Entschuldigung.',
 'Entschuldigung, wo ist die Toilette?', 'Com licença, onde fica o banheiro?',
 '["essencial","sobrevivência"]', true, true),

('a1-dia-bitte-danke', 'A1', 'dia-a-dia',
 'Bitte / Danke / Bitte sehr!', 'Por favor / Obrigado(a) / De nada!',
 'Bitte = por favor (pedido). Bitte? = como disse? Bitte sehr = de nada (resposta ao obrigado). Danke schön = muito obrigado.',
 'Bitte é a palavra mais versátil do alemão — aprenda todos os contextos.',
 'Einen Kaffee, bitte! — Bitte sehr! — Danke!', 'Um café, por favor! — Aqui está! — Obrigada!',
 '["essencial","educação"]', true, true),

('a1-dia-ich-verstehe-nicht', 'A1', 'dia-a-dia',
 'Ich verstehe nicht.', 'Eu não entendo.',
 'Uma das frases mais importantes para iniciantes. Salva você em qualquer situação difícil.',
 'verstehen = entender. ich verstehe, du verstehst, er versteht. Prefixo inseparável ver-.',
 'Ich verstehe nicht. Können Sie das wiederholen?', 'Eu não entendo. Pode repetir?',
 '["sobrevivência","essencial"]', true, true),

('a1-dia-wie-bitte', 'A1', 'dia-a-dia',
 'Wie bitte?', 'Como disse? / Como, por favor?',
 'A forma mais educada de pedir repetição. Mais formal que "Was?" ou "Hä?".',
 'Wie = como. Bitte = por favor. Juntos formam a expressão de cortesia para repetição.',
 'Der Zug fährt um... — Wie bitte? Ich habe nicht verstanden.', 'O trem parte às... — Como disse? Não entendi.',
 '["sobrevivência","educação"]', true, true),

('a1-dia-langsamer', 'A1', 'dia-a-dia',
 'Langsamer, bitte! / Sprechen Sie langsamer, bitte!', 'Mais devagar, por favor!',
 'Langsamer = comparativo de langsam (devagar). Fundamental para quem está aprendendo.',
 'langsam (devagar) → langsamer (mais devagar). Comparativo regular com -er.',
 'Ich lerne noch Deutsch. Sprechen Sie bitte langsamer!', 'Ainda estou aprendendo alemão. Por favor fale mais devagar!',
 '["sobrevivência","essencial"]', true, true),

-- ==============================
-- TEMA: números (Cap. 2)
-- ==============================
('a1-num-eins-zehn', 'A1', 'dia-a-dia',
 'eins, zwei, drei, vier, fünf', '1, 2, 3, 4, 5',
 'Os primeiros cinco números. Atenção: "eins" sozinho, mas "ein" antes de substantivo.',
 'eins = número isolado. ein Mann = um homem. uma = eine (feminino).',
 'Ich habe zwei Kinder — einen Sohn und eine Tochter.', 'Eu tenho dois filhos — um filho e uma filha.',
 '["números","essencial"]', true, true),

('a1-num-sechs-zehn', 'A1', 'dia-a-dia',
 'sechs, sieben, acht, neun, zehn', '6, 7, 8, 9, 10',
 'Atenção especial: sechzehn (16) perde o s, siebzehn (17) perde o en.',
 'Armadilha: 16 = sechzehn (NÃO sechszehn). 17 = siebzehn (NÃO siebenzehn).',
 'Das kostet sechs Euro und zehn Cent.', 'Isso custa 6 euros e 10 centavos.',
 '["números","essencial"]', true, true),

('a1-num-zwanzig-hundert', 'A1', 'dia-a-dia',
 'zwanzig, dreißig, vierzig... hundert', '20, 30, 40... 100',
 'Regra invertida: 21 = einundzwanzig (um-e-vinte). Unidade + und + dezena.',
 'Compostos: unidade + und + dezena. Ex: 45 = fünfundvierzig.',
 'Ich bin dreißig Jahre alt. Das kostet neunundneunzig Euro.', 'Tenho 30 anos. Isso custa 99 euros.',
 '["números","regra-invertida"]', true, true),

-- ==============================
-- TEMA: gramática (Cap. 3–5)
-- ==============================
('a1-gram-sein-conj', 'A1', 'dia-a-dia',
 'sein: bin / bist / ist / sind / seid / sind', 'ser/estar: sou / és / é / somos / sois / são',
 'sein cobre SER e ESTAR. É o verbo mais importante e o mais irregular do alemão.',
 'Irregular total: não segue nenhum padrão. Precisa decorar as 6 formas.',
 'Ich bin müde. Du bist nett. Wir sind zu Hause.', 'Estou cansada. Você é simpático. Estamos em casa.',
 '["sein","gramática","essencial"]', true, true),

('a1-gram-haben-conj', 'A1', 'dia-a-dia',
 'haben: habe / hast / hat / haben / habt / haben', 'ter: tenho / tens / tem / temos / tendes / têm',
 'haben = ter. Irregular em du (hast) e er/sie/es (hat). Essencial para o Perfekt depois.',
 'Irregular: du hast (não habest), er hat (não habet). Resto é quase regular.',
 'Ich habe zwei Kinder. Hast du Zeit?', 'Tenho dois filhos. Você tem tempo?',
 '["haben","gramática","essencial"]', true, true),

('a1-gram-der-die-das', 'A1', 'dia-a-dia',
 'der (masc.) / die (fem.) / das (neut.)', 'o (masc.) / a (fem.) / o/a (neutro)',
 'Todo substantivo alemão tem um gênero. Aprenda sempre: o artigo + o substantivo juntos.',
 'Regras: -ung/-heit/-keit = die. -chen/-lein = das. -er (agente) = der. Dias/meses = der.',
 'der Mann, die Frau, das Kind — drei Geschlechter!', 'o homem, a mulher, a criança — três gêneros!',
 '["artigos","gramática","essencial"]', true, true),

('a1-gram-kein-keine', 'A1', 'dia-a-dia',
 'kein / keine / kein', 'nenhum / nenhuma / nenhum',
 'kein/keine = negação de substantivos com artigo indefinido. Segue o mesmo padrão de ein/eine.',
 'ein → kein (masc/neutro). eine → keine (fem/plural). Kein Problem! = Sem problema!',
 'Ich habe keine Zeit und kein Geld.', 'Não tenho tempo nem dinheiro.',
 '["negação","gramática"]', true, true),

('a1-gram-separavel', 'A1', 'dia-a-dia',
 'aufstehen → Ich stehe... auf.', 'levantar-se → Eu me levanto...',
 'Verbos separáveis: o prefixo vai para o FINAL da frase na forma conjugada.',
 'Prefixos separáveis: auf-, an-, ein-, aus-, mit-, ab-, zurück-, vor-, zu-.',
 'Ich stehe um 7 Uhr auf. Ich kaufe im Supermarkt ein.', 'Levanto às 7h. Faço compras no supermercado.',
 '["separáveis","gramática","rotina"]', true, true),

-- ==============================
-- TEMA: família (Cap. 6)
-- ==============================
('a1-fam-mutter-vater', 'A1', 'dia-a-dia',
 'die Mutter / der Vater / die Eltern', 'a mãe / o pai / os pais',
 'Eltern (pais) é sempre plural. Não existe "die Elter" no singular.',
 'Eltern = plural tantum (só existe no plural). die Eltern = os pais.',
 'Meine Mutter wohnt in Deutschland. Meine Eltern sind geschieden.', 'Minha mãe mora na Alemanha. Meus pais são divorciados.',
 '["família","vocabulário"]', true, true),

('a1-fam-sohn-tochter', 'A1', 'dia-a-dia',
 'der Sohn / die Tochter / das Kind', 'o filho / a filha / a criança',
 'Kind (criança) é neutro — das Kind. Para especificar: der Sohn (filho) / die Tochter (filha).',
 'das Kind = neutro. Plural: die Kinder. "Ich habe zwei Kinder" = forma geral.',
 'Mein Sohn ist zwölf und meine Tochter ist sechs Jahre alt.', 'Meu filho tem 12 e minha filha tem 6 anos.',
 '["família","vocabulário","essencial"]', true, true),

('a1-fam-mein-meine', 'A1', 'dia-a-dia',
 'mein (masc/neut) / meine (fem/plural)', 'meu / minha / meus / minhas',
 'Possessivos seguem o gênero do OBJETO possuído. mein = ein, meine = eine.',
 'Macete: possessivo = artigo indefinido. mein Sohn (der), meine Tochter (die), mein Kind (das).',
 'Mein Sohn, meine Tochter, mein Kind, meine Kinder.', 'Meu filho, minha filha, minha criança, meus filhos.',
 '["possessivos","gramática","família"]', true, true),

('a1-fam-katze-madalena', 'A1', 'dia-a-dia',
 'die Katze / der Kater', 'a gata (gênero feminino) / o gato (macho)',
 'die Katze = gato em geral / gata. der Kater = gato macho especificamente.',
 'Katze é feminino gramaticalmente, mesmo para gatos machos no uso comum.',
 'Meine Katze heißt Madalena. Sie ist schwarz und faul.', 'Minha gata se chama Madalena. Ela é preta e preguiçosa.',
 '["animais","família","vocabulário"]', true, true),

-- ==============================
-- TEMA: horas e rotina (Cap. 7)
-- ==============================
('a1-rot-halb', 'A1', 'dia-a-dia',
 'halb zehn = 9:30 (NÃO 10:30!)', 'meia hora antes das dez = 9h30',
 'halb + próxima hora = meia hora antes. É a maior armadilha das horas em alemão!',
 'halb = metade. halb zehn = metade do caminho até as 10h = 9h30.',
 'Der Kurs beginnt um halb neun. (8:30)', 'O curso começa às 8h30.',
 '["horas","armadilha","essencial"]', true, true),

('a1-rot-viertel', 'A1', 'dia-a-dia',
 'Viertel nach acht (8:15) / Viertel vor neun (8:45)', 'oito e quinze / oito e quarenta e cinco',
 'Viertel nach = e quinze (um quarto depois). Viertel vor = menos quinze (um quarto antes).',
 'Viertel = um quarto. nach = depois. vor = antes. Referência sempre à hora mais próxima.',
 'Es ist Viertel nach acht. Der Zug fährt um Viertel vor neun ab.', 'São oito e quinze. O trem parte às oito e quarenta e cinco.',
 '["horas","vocabulário"]', true, true),

('a1-rot-aufstehen', 'A1', 'dia-a-dia',
 'Ich stehe um 6:30 auf.', 'Eu me levanto às 6h30.',
 'aufstehen = levantar-se (separável). aufwachen = acordar (separável). Diferentes!',
 'aufwachen = acordar (abrir os olhos). aufstehen = levantar da cama. Dois momentos distintos.',
 'Ich wache um 6 Uhr auf und stehe um 6:30 auf.', 'Acordo às 6h e me levanto às 6h30.',
 '["rotina","separáveis","verbos"]', true, true),

-- ==============================
-- TEMA: casa e comida (Cap. 8)
-- ==============================
('a1-casa-wohnzimmer', 'A1', 'dia-a-dia',
 'das Wohnzimmer / die Küche / das Schlafzimmer', 'a sala / a cozinha / o quarto',
 'Cômodos com -zimmer são sempre das (neutro). Exceção: die Küche (cozinha).',
 '-zimmer = neutro sempre. das Bad(ezimmer), das Arbeitszimmer, das Kinderzimmer.',
 'Im Wohnzimmer gibt es ein Sofa und einen Fernseher.', 'Na sala tem um sofá e uma televisão.',
 '["casa","vocabulário"]', true, true),

('a1-casa-kuehlschrank', 'A1', 'dia-a-dia',
 'der Kühlschrank / die Tastatur / der Bildschirm', 'a geladeira / o teclado / o monitor',
 'Palavras compostas: o último elemento define o gênero. Schrank (der) → Kühlschrank (der).',
 'Kühl (frio) + Schrank (armário) = Kühlschrank (geladeira). Sistema de composição alemão.',
 'Meine Tastatur und mein Bildschirm sind neu.', 'Meu teclado e meu monitor são novos.',
 '["casa","tech","vocabulário"]', true, true),

('a1-com-moechte', 'A1', 'pedidos',
 'Ich möchte einen Kaffee, bitte.', 'Eu gostaria de um café, por favor.',
 'möchte = gostaria (Konjunktiv II de mögen). Forma mais educada que "ich will" para pedidos.',
 'möchte não muda com ich e er/sie: ich möchte, du möchtest, er möchte.',
 'Ich möchte ein Wasser und einen Tee, bitte.', 'Eu gostaria de uma água e um chá, por favor.',
 '["pedidos","restaurante","essencial"]', true, true),

('a1-com-rechnung', 'A1', 'pedidos',
 'Die Rechnung, bitte! / Zahlen, bitte!', 'A conta, por favor!',
 'Duas formas igualmente corretas de pedir a conta no restaurante. Zahlen, bitte! é mais direto.',
 'die Rechnung = a conta (substantivo). zahlen = pagar (verbo no imperativo implícito).',
 'Entschuldigung! Die Rechnung, bitte!', 'Com licença! A conta, por favor!',
 '["restaurante","pedidos","essencial"]', true, true),

('a1-com-lecker', 'A1', 'pedidos',
 'Lecker! / Es hat gut geschmeckt!', 'Gostoso! / Estava delicioso!',
 'lecker = gostoso (adjetivo). gut schmecken = ter bom sabor. Essenciais para elogiar comida.',
 'schmecken = ter sabor. Das schmeckt gut. = Isso tem bom sabor. / Está gostoso.',
 'Das war sehr lecker! Hat es geschmeckt?', 'Estava muito gostoso! Gostou?',
 '["restaurante","vocabulário"]', true, true),

-- ==============================
-- TEMA: perguntas (Cap. 9)
-- ==============================
('a1-perg-wo-wohin-woher', 'A1', 'dia-a-dia',
 'Wo? / Wohin? / Woher?', 'Onde? / Para onde? / De onde?',
 'Os três "wo": wo = estático, wohin = movimento saindo, woher = origem/procedência.',
 'Wo = posição (Dativ). Wohin = destino (Akkusativ). Woher = origem.',
 'Wo wohnst du? Wohin gehst du? Woher kommst du?', 'Onde você mora? Para onde vai? De onde você é?',
 '["perguntas","essencial","gramática"]', true, true),

('a1-perg-wie-viel', 'A1', 'pedidos',
 'Wie viel kostet das? / Was kostet das?', 'Quanto custa isso?',
 'Duas formas corretas. wie viel = quanto. was kostet = quanto custa (literal: o que custa).',
 'kosten = custar. Das kostet... = isso custa... Euro. Alles zusammen = tudo junto.',
 'Wie viel kostet das Ticket nach München?', 'Quanto custa a passagem para Munique?',
 '["perguntas","compras","essencial"]', true, true),

('a1-perg-warum', 'A1', 'dia-a-dia',
 'Warum lernst du Deutsch?', 'Por que você aprende alemão?',
 'warum = por quê. Resposta com "weil" (porque): Ich lerne Deutsch, weil meine Mutter in Deutschland wohnt.',
 'warum (por quê) + weil (porque). weil manda o verbo para o final da frase subordinada.',
 'Warum lernst du Deutsch? — Weil meine Mutter in Deutschland wohnt.', 'Por que você aprende alemão? — Porque minha mãe mora na Alemanha.',
 '["perguntas","weil","gramática"]', true, true),

-- ==============================
-- TEMA: viagem / sobrevivência (bônus A1)
-- ==============================
('a1-via-bahnhof', 'A1', 'viagem',
 'Wo ist der Bahnhof?', 'Onde fica a estação de trem?',
 'Fundamental para qualquer viagem na Alemanha. Bahnhof = estação de trem.',
 'der Bahnhof (masculino). die U-Bahn (metrô). die Haltestelle (parada de ônibus/bonde).',
 'Entschuldigung, wo ist der nächste Bahnhof?', 'Com licença, onde fica a estação de trem mais próxima?',
 '["viagem","sobrevivência","essencial"]', true, true),

('a1-via-ticket', 'A1', 'viagem',
 'Ein Ticket nach München, bitte.', 'Uma passagem para Munique, por favor.',
 'Estrutura: ein Ticket + nach + cidade. Hin und zurück = ida e volta. Nur hin = só ida.',
 'nach + cidade (sem artigo). Exceção: in die USA, in die Schweiz (países com artigo).',
 'Einmal nach Berlin, hin und zurück, bitte. Wie viel kostet das?', 'Uma vez para Berlim, ida e volta, por favor. Quanto custa?',
 '["viagem","trem","pedidos"]', true, true),

('a1-via-toilette', 'A1', 'viagem',
 'Wo ist die Toilette? / Gibt es hier ein WC?', 'Onde fica o banheiro?',
 'die Toilette ou das WC — ambos funcionam. Em restaurantes e lugares públicos.',
 'WC = water closet (anglicismo). Toilette = versão formal. Klo = informal/gíria.',
 'Entschuldigung, wo ist die Toilette, bitte?', 'Com licença, onde fica o banheiro, por favor?',
 '["viagem","sobrevivência","essencial"]', true, true),

('a1-via-hilfe', 'A1', 'viagem',
 'Können Sie mir helfen? / Ich brauche Hilfe.', 'Pode me ajudar? / Eu preciso de ajuda.',
 'helfen = ajudar (verbo com dativo). mir = a mim (dativo de ich). Brauchen = precisar.',
 'helfen + Dativ: Ich helfe dir (te ajudo). Du hilfst mir (você me ajuda).',
 'Entschuldigung, können Sie mir helfen? Ich bin neu hier.', 'Com licença, pode me ajudar? Sou nova aqui.',
 '["viagem","sobrevivência","essencial"]', true, true),

-- ==============================
-- TEMA: gírias / coloquial A1
-- ==============================
('a1-giria-alles-klar', 'A1', 'girias',
 'Alles klar!', 'Entendido! / Tudo certo! / Beleza!',
 'A expressão mais versátil do alemão coloquial. Serve como confirmação, resposta e cumprimento.',
 'alles = tudo. klar = claro/certo. Juntos formam uma expressão fixa muito comum.',
 'Wir treffen uns um 8 Uhr. — Alles klar!', 'Nos encontramos às 8h. — Beleza!',
 '["gírias","coloquial","essencial"]', true, true),

('a1-giria-krass', 'A1', 'girias',
 'krass / voll krass!', 'absurdo / demais / surreal (gíria)',
 'krass = muito intenso, impressionante (positivo ou negativo). Voll = muito (gíria, como "super").',
 'voll = cheio → virou intensificador gírio. "Das ist voll krass!" = isso é demais!',
 'Hast du das gesehen? Das ist voll krass!', 'Você viu isso? Isso é demais!',
 '["gírias","2026","jovem"]', true, true),

('a1-giria-moin', 'A1', 'girias',
 'Moin! / Moin moin!', 'Oi! / Olá! (Norte da Alemanha)',
 'Usado em Hamburgo e no norte da Alemanha qualquer hora do dia. Vem de ''Moin'' (manhã em dialeto).',
 'Regional: norte da Alemanha. Não usar no sul (Baviera) onde usam ''Servus'' ou ''Grüß Gott''.',
 'Moin! Wie läuft''s so?', 'Oi! Como tá as coisas?',
 '["gírias","regional","hamburgos"]', true, true),

('a1-giria-digga', 'A1', 'girias',
 'Digga / Alter!', 'cara / mano (gíria)',
 'Digga = forma muito berlinense/norte-alemã. Alter = mais geral. Equivale a "cara" em português.',
 'Digga vem de ''Dicker'' (gordo, usado afetivamente). Alter = velho (usado afetivamente).',
 'Digga, was machst du hier?', 'Cara, o que você tá fazendo aqui?',
 '["gírias","berlin","jovem"]', true, true),

('a1-giria-kein-bock', 'A1', 'girias',
 'Ich habe keinen Bock.', 'Não estou a fim. / Não tenho vontade.',
 'Bock haben = estar a fim. Keinen Bock haben = não estar com vontade. Super comum entre jovens.',
 'Bock = bode (animal) → virou gíria para "vontade/energia". Bock haben auf = estar a fim de.',
 'Hast du Bock auf Pizza? — Nee, keinen Bock heute.', 'Tá a fim de pizza? — Não, sem energia hoje.',
 '["gírias","jovem","coloquial"]', true, true)

ON CONFLICT (slug) DO UPDATE SET
  back_pt = EXCLUDED.back_pt,
  explanation_pt = EXCLUDED.explanation_pt,
  grammar_note = EXCLUDED.grammar_note,
  example_de = EXCLUDED.example_de,
  example_pt = EXCLUDED.example_pt,
  tags = EXCLUDED.tags,
  curated = true,
  active = true;

-- ============================================================
-- FIM — Total: 40 flashcards curados A1
-- Temas: dia-a-dia, pedidos, viagem, gírias
-- ============================================================
