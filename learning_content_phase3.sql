-- =====================================================
-- DEUTSCH HUB - Phase 3 curated learning content
-- Original DW/Nico's Weg-inspired structure, not copied content.
-- Run after supabase_setup.sql and supabase_phase2.sql.
-- =====================================================

create table if not exists flashcards_v2 (
  id uuid default gen_random_uuid() primary key,
  slug text unique not null,
  level text not null check (level in ('A1', 'A2', 'B1')),
  theme text not null,
  card_type text not null default 'phrase',
  front_de text not null,
  back_pt text not null,
  explanation_pt text not null,
  grammar_note text,
  example_de text,
  example_pt text,
  tags jsonb default '[]',
  source_style text default 'original_dw_inspired',
  validation_sources text[] default '{}',
  curated boolean default true,
  active boolean default true,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists deutsch_challenges (
  id uuid default gen_random_uuid() primary key,
  slug text unique not null,
  level text not null check (level in ('A1', 'A2', 'B1')),
  theme text not null,
  title_pt text not null,
  scenario_pt text not null,
  character_key text check (character_key in ('hans', 'lukas', 'heidi', 'petra')),
  user_goal_pt text not null,
  opening_line_de text not null,
  support_phrases jsonb default '[]',
  success_criteria jsonb default '[]',
  xp_reward integer default 100,
  active boolean default true,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

alter table flashcards_v2 enable row level security;
alter table deutsch_challenges enable row level security;

do $$
begin
  if not exists (select 1 from pg_policies where schemaname = 'public' and tablename = 'flashcards_v2' and policyname = 'allow all') then
    create policy "allow all" on flashcards_v2 for all using (true) with check (true);
  end if;
  if not exists (select 1 from pg_policies where schemaname = 'public' and tablename = 'deutsch_challenges' and policyname = 'allow all') then
    create policy "allow all" on deutsch_challenges for all using (true) with check (true);
  end if;
end $$;

insert into flashcards_v2
(slug, level, theme, card_type, front_de, back_pt, explanation_pt, grammar_note, example_de, example_pt, tags, validation_sources)
values
('a1-cafe-001','A1','pedidos','phrase','Ich möchte einen Kaffee, bitte.','Eu queria um café, por favor.','Em alemão, "ich möchte" soa educado. Em PT-BR fica natural como "eu queria".','mochte_pedido','Ich möchte ein Wasser, bitte.','Eu queria uma água, por favor.','["cafe","pedido","formal"]',array['LanguageTool','manual']),
('a1-padaria-002','A1','pedidos','phrase','Ich nehme zwei Brötchen.','Vou levar dois pãezinhos.','"Ich nehme" é o jeito simples de escolher algo numa loja. Não traduza como "eu tomo" aqui.','nehmen_compra','Ich nehme das Brot.','Vou levar o pão.','["padaria","compra","comida"]',array['LanguageTool','manual']),
('a1-preco-003','A1','pedidos','phrase','Was kostet das?','Quanto custa isso?','Alemão usa "was kostet..." para perguntar preço. Em PT-BR dizemos "quanto custa".','frage_was_kostet','Was kostet der Kaffee?','Quanto custa o café?','["preco","loja","pergunta"]',array['LanguageTool','manual']),
('a1-conta-004','A1','pedidos','phrase','Die Rechnung, bitte.','A conta, por favor.','Frase curta e perfeita para restaurante. Em alemão, "Rechnung" é feminino: die Rechnung.','artigo_die','Die Rechnung kommt sofort.','A conta vem já.','["restaurante","conta"]',array['LanguageTool','Wiktionary','manual']),
('a1-agua-005','A1','pedidos','phrase','Haben Sie stilles Wasser?','Vocês têm água sem gás?','"Haben Sie...?" é formal. "Stilles Wasser" é água sem gás.','formal_sie','Haben Sie Kaffee?','Vocês têm café?','["restaurante","agua","formal"]',array['LanguageTool','manual']),
('a1-metro-006','A1','viagem','phrase','Wo ist die U-Bahn?','Onde fica o metrô?','Para perguntar localização, use "Wo ist...?". Em Berlim, metrô é "die U-Bahn".','wo_ist','Wo ist der Bahnhof?','Onde fica a estação de trem?','["metro","berlim","direcao"]',array['LanguageTool','Wiktionary','manual']),
('a1-bilhete-007','A1','viagem','phrase','Ein Ticket nach Berlin, bitte.','Uma passagem para Berlim, por favor.','Em pedidos rápidos, dá para omitir o verbo. É natural no balcão.','pedido_sem_verbo','Ein Wasser, bitte.','Uma água, por favor.','["trem","ticket","viagem"]',array['LanguageTool','manual']),
('a1-plataforma-008','A1','viagem','phrase','Auf welchem Gleis fährt der Zug?','De qual plataforma sai o trem?','"Gleis" é plataforma/trilho de trem. A frase é útil em estação.','welchem_dativ','Auf welchem Gleis ist der Zug?','Em qual plataforma está o trem?','["trem","estacao","pergunta"]',array['LanguageTool','manual']),
('a1-ajuda-009','A1','survival','phrase','Können Sie mir helfen?','O senhor/a senhora pode me ajudar?','"Können Sie..." é formal e seguro para falar com desconhecidos.','formal_sie_modal','Können Sie das wiederholen?','Pode repetir isso?','["ajuda","formal","sobrevivencia"]',array['LanguageTool','manual']),
('a1-nao-entendo-010','A1','survival','phrase','Ich verstehe das nicht.','Eu não entendo isso.','Em alemão, o "nicht" geralmente vem perto do final da ideia.','negacao_nicht','Ich verstehe Deutsch nicht gut.','Eu não entendo alemão muito bem.','["sobrevivencia","negacao"]',array['LanguageTool','manual']),
('a1-devagar-011','A1','survival','phrase','Sprechen Sie bitte langsamer.','Fale mais devagar, por favor.','"Langsamer" = mais devagar. É mais completo que só dizer "langsam".','comparativo','Bitte sprechen Sie langsam.','Por favor, fale devagar.','["fala","sobrevivencia","formal"]',array['LanguageTool','manual']),
('a1-repetir-012','A1','survival','phrase','Können Sie das bitte wiederholen?','Pode repetir isso, por favor?','Frase essencial. "Wiederholen" significa repetir.','modal_konnen','Bitte wiederholen Sie das.','Por favor, repita isso.','["fala","formal","sobrevivencia"]',array['LanguageTool','manual']),
('a1-apresentacao-013','A1','dia-a-dia','phrase','Ich heiße Rebeca.','Eu me chamo Rebeca.','"Ich heiße" é a forma padrão de dizer seu nome. Em PT-BR também dizemos "meu nome é".','heissen','Ich heiße Ana.','Eu me chamo Ana.','["apresentacao","nome"]',array['LanguageTool','manual']),
('a1-origem-014','A1','dia-a-dia','phrase','Ich komme aus Brasilien.','Eu sou do Brasil.','Alemão diz literalmente "eu venho do Brasil". Em português natural: "sou do Brasil".','kommen_aus','Ich komme aus Bahia.','Eu sou da Bahia.','["origem","apresentacao"]',array['LanguageTool','manual']),
('a1-morar-015','A1','dia-a-dia','phrase','Ich wohne in Salvador.','Eu moro em Salvador.','Use "wohnen" para morar. Para cidade, use "in".','wohnen_in','Ich wohne in Berlin.','Eu moro em Berlim.','["moradia","cidade"]',array['LanguageTool','manual']),
('a1-trabalho-016','A1','trabalho','phrase','Ich arbeite als Webentwicklerin.','Eu trabalho como desenvolvedora web.','"Als" aqui significa "como" profissão. Para mulher: Webentwicklerin.','als_beruf','Ich arbeite als Lehrerin.','Eu trabalho como professora.','["trabalho","tech","profissao"]',array['LanguageTool','manual']),
('a1-estudo-017','A1','dia-a-dia','phrase','Ich lerne jeden Tag Deutsch.','Eu estudo alemão todos os dias.','"Jeden Tag" = todos os dias. O objeto "Deutsch" vem depois do verbo.','tempo_jeden_tag','Ich trinke jeden Tag Kaffee.','Eu tomo café todos os dias.','["rotina","estudo"]',array['LanguageTool','manual']),
('a1-cansada-018','A1','dia-a-dia','phrase','Ich bin müde.','Estou cansada.','Em alemão, estados usam muito "ich bin". Em PT-BR omitimos o "eu" com naturalidade.','sein_estado','Ich bin krank.','Estou doente.','["estado","rotina"]',array['LanguageTool','manual']),
('a1-horario-019','A1','dia-a-dia','phrase','Wie spät ist es?','Que horas são?','Pergunta fixa para horário. Não traduza palavra por palavra.','frage_hora','Es ist acht Uhr.','São oito horas.','["hora","pergunta"]',array['LanguageTool','manual']),
('a1-consulta-020','A1','saude','phrase','Ich habe einen Termin.','Eu tenho um horário marcado.','"Termin" é compromisso/consulta. Em PT-BR, "horário marcado" soa natural.','akkusativ_einen','Ich habe heute einen Termin.','Tenho um horário marcado hoje.','["consulta","burocracia"]',array['LanguageTool','manual']),
('a1-doente-021','A1','saude','phrase','Mir ist schlecht.','Estou passando mal.','Alemão diz "para mim está ruim". Em PT-BR natural: "estou passando mal".','mir_ist','Mir ist kalt.','Estou com frio.','["saude","emergencia"]',array['LanguageTool','manual']),
('a1-farmacia-022','A1','saude','phrase','Wo ist die Apotheke?','Onde fica a farmácia?','Farmácia em alemão é "die Apotheke", não "Farmacie".','artigo_die','Die Apotheke ist hier links.','A farmácia fica aqui à esquerda.','["saude","farmacia","direcao"]',array['LanguageTool','Wiktionary','manual']),
('a1-aluguel-023','A1','moradia','phrase','Ich suche eine Wohnung.','Estou procurando um apartamento.','"Ich suche" = estou procurando. "Wohnung" é feminino: eine Wohnung.','akkusativ_eine','Ich suche ein Zimmer.','Estou procurando um quarto.','["moradia","aluguel"]',array['LanguageTool','Wiktionary','manual']),
('a1-endereco-024','A1','burocracia','phrase','Meine Adresse ist hier.','Meu endereço é este aqui.','"Meine Adresse" é feminino. Útil em formulários e atendimento.','possessivo_meine','Meine Telefonnummer ist hier.','Meu telefone está aqui.','["endereco","documentos"]',array['LanguageTool','manual']),
('a1-documento-025','A1','burocracia','phrase','Ich brauche ein Formular.','Eu preciso de um formulário.','"Ich brauche" é direto e útil. "Ein Formular" = um formulário.','brauchen','Ich brauche Hilfe.','Eu preciso de ajuda.','["burocracia","documentos"]',array['LanguageTool','manual']),
('a1-email-026','A1','trabalho','phrase','Ich schreibe eine E-Mail.','Estou escrevendo um e-mail.','Em alemão simples, presente também pode expressar ação acontecendo agora.','prasens','Ich schreibe eine Nachricht.','Estou escrevendo uma mensagem.','["trabalho","email"]',array['LanguageTool','manual']),
('a1-reuniao-027','A1','trabalho','phrase','Ich habe um zehn Uhr ein Meeting.','Tenho uma reunião às dez horas.','Para hora exata, use "um". "Meeting" é comum no trabalho tech.','zeit_um','Ich habe um neun Uhr einen Termin.','Tenho um compromisso às nove horas.','["trabalho","reuniao","tech"]',array['LanguageTool','manual']),
('a1-bug-028','A1','trabalho','phrase','Der Code funktioniert nicht.','O código não funciona.','"Funktioniert nicht" é uma forma simples de dizer que algo não funciona.','negacao_nicht','Das Internet funktioniert nicht.','A internet não funciona.','["tech","bug","trabalho"]',array['LanguageTool','manual']),
('a1-duvida-029','A1','trabalho','phrase','Ich habe eine Frage.','Tenho uma pergunta.','Frase educada para interromper ou pedir explicação. "Frage" é feminino.','akkusativ_eine','Ich habe eine Idee.','Tenho uma ideia.','["trabalho","pergunta"]',array['LanguageTool','manual']),
('a1-reuniao-online-030','A1','trabalho','phrase','Ich bin im Online-Meeting.','Estou na reunião online.','"Im" = in dem. Use com lugares/situações como reunião.','in_dem','Ich bin im Büro.','Estou no escritório.','["trabalho","online","tech"]',array['LanguageTool','manual']),
('a1-mercado-031','A1','compras','phrase','Ich kaufe Obst und Brot.','Eu compro frutas e pão.','"Obst" é coletivo para frutas. Não precisa plural no básico.','vocab_obst','Ich kaufe Milch und Käse.','Eu compro leite e queijo.','["mercado","comida"]',array['LanguageTool','manual']),
('a1-sacola-032','A1','compras','phrase','Brauchen Sie eine Tüte?','Você precisa de uma sacola?','Pergunta comum no caixa. "Tüte" é sacola.','brauchen_frage','Ich brauche keine Tüte.','Não preciso de sacola.','["mercado","caixa"]',array['LanguageTool','manual']),
('a1-cartao-033','A1','compras','phrase','Kann ich mit Karte zahlen?','Posso pagar com cartão?','"Mit Karte zahlen" = pagar com cartão. Muito útil em loja.','modal_kann','Kann ich bar zahlen?','Posso pagar em dinheiro?','["pagamento","loja"]',array['LanguageTool','manual']),
('a1-localizacao-034','A1','viagem','phrase','Ich bin hier neu.','Sou nova aqui.','Frase natural para explicar que você não conhece o lugar.','adverb_hier','Ich bin neu in Berlin.','Sou nova em Berlim.','["viagem","cidade"]',array['LanguageTool','manual']),
('a1-atraso-035','A1','viagem','phrase','Der Zug hat Verspätung.','O trem está atrasado.','Alemão diz que o trem "tem atraso". Em PT-BR: "está atrasado".','haben_verspatung','Der Bus hat Verspätung.','O ônibus está atrasado.','["trem","atraso"]',array['LanguageTool','manual']),
('a1-familia-036','A1','dia-a-dia','phrase','Meine Tochter ist zu Hause.','Minha filha está em casa.','"Meine" porque "Tochter" é feminino. "Zu Hause" = em casa.','possessivo_meine','Mein Sohn ist zu Hause.','Meu filho está em casa.','["familia","casa"]',array['LanguageTool','manual']),
('a1-escola-037','A1','familia','phrase','Meine Tochter geht zur Schule.','Minha filha vai para a escola.','"Zur" = zu der. É usado com escola nesse contexto.','zu_der','Mein Kind geht zur Schule.','Meu filho/minha filha vai para a escola.','["familia","escola"]',array['LanguageTool','manual']),
('a1-clima-038','A1','dia-a-dia','phrase','Heute ist es kalt.','Hoje está frio.','Para clima, alemão usa "es ist". Em PT-BR não precisamos de sujeito.','es_ist_wetter','Heute ist es warm.','Hoje está quente.','["clima","rotina"]',array['LanguageTool','manual']),
('a1-convite-039','A1','dia-a-dia','phrase','Hast du heute Zeit?','Você tem tempo hoje?','Informal com "du". Use com amigos/colegas próximos.','du_frage','Haben Sie heute Zeit?','O senhor/a senhora tem tempo hoje?','["social","convite"]',array['LanguageTool','manual']),
('a1-confirmar-040','A1','dia-a-dia','phrase','Ja, das passt gut.','Sim, está bom para mim.','"Das passt" significa que algo combina/serve/funciona. Em PT-BR: "está bom".','passen','Der Termin passt gut.','O horário está bom.','["social","confirmacao"]',array['LanguageTool','manual'])
on conflict (slug) do update set
  level = excluded.level,
  theme = excluded.theme,
  card_type = excluded.card_type,
  front_de = excluded.front_de,
  back_pt = excluded.back_pt,
  explanation_pt = excluded.explanation_pt,
  grammar_note = excluded.grammar_note,
  example_de = excluded.example_de,
  example_pt = excluded.example_pt,
  tags = excluded.tags,
  validation_sources = excluded.validation_sources,
  curated = true,
  active = true,
  updated_at = now();

insert into deutsch_challenges
(slug, level, theme, title_pt, scenario_pt, character_key, user_goal_pt, opening_line_de, support_phrases, success_criteria, xp_reward)
values
('a1-heidi-padaria','A1','pedidos','Padaria de bairro','Você está numa padaria e quer pedir café e pão sem travar.','heidi','Pedir 2 itens, perguntar o preço e agradecer.','Guten Morgen! Was möchten Sie heute?','[{"de":"Ich möchte ... bitte.","pt":"Eu queria ... por favor."},{"de":"Was kostet das?","pt":"Quanto custa isso?"},{"de":"Danke schön.","pt":"Muito obrigada."}]','["Pediu pelo menos um item em alemão","Perguntou preço ou confirmou pagamento","Usou bitte/danke"]',100),
('a1-heidi-metro','A1','viagem','Perdida no metrô','Você está em Berlim e precisa achar a estação certa.','heidi','Perguntar onde fica o metrô e pedir para repetir devagar.','Hallo! Du siehst ein bisschen verloren aus. Wohin möchtest du?','[{"de":"Wo ist die U-Bahn?","pt":"Onde fica o metrô?"},{"de":"Sprechen Sie bitte langsamer.","pt":"Fale mais devagar, por favor."},{"de":"Ich verstehe das nicht.","pt":"Eu não entendo isso."}]','["Perguntou localização","Pediu repetição ou fala lenta","Respondeu com destino"]',100),
('a1-heidi-hotel','A1','viagem','Check-in no hotel','Você chegou ao hotel e precisa confirmar sua reserva.','heidi','Dizer que tem uma reserva e perguntar pelo quarto.','Guten Abend! Willkommen im Hotel. Haben Sie eine Reservierung?','[{"de":"Ich habe eine Reservierung.","pt":"Tenho uma reserva."},{"de":"Mein Name ist ...","pt":"Meu nome é ..."},{"de":"Wo ist mein Zimmer?","pt":"Onde fica meu quarto?"}]','["Informou nome","Disse que tem reserva","Fez uma pergunta simples"]',100),
('a1-heidi-farmacia','A1','saude','Farmácia urgente','Você está passando mal e precisa comprar algo na farmácia.','heidi','Explicar que está passando mal e pedir ajuda.','Guten Tag. Wie kann ich Ihnen helfen?','[{"de":"Mir ist schlecht.","pt":"Estou passando mal."},{"de":"Ich brauche Hilfe.","pt":"Preciso de ajuda."},{"de":"Haben Sie etwas dagegen?","pt":"Vocês têm algo para isso?"}]','["Explicou o problema","Pediu ajuda","Usou frase educada"]',100),
('a1-lukas-code','A1','trabalho','Bug no código','Você está numa call rápida e precisa dizer que o código não funciona.','lukas','Explicar o problema de forma simples e pedir ajuda.','Hey Rebeca, was ist los mit dem Code?','[{"de":"Der Code funktioniert nicht.","pt":"O código não funciona."},{"de":"Ich habe eine Frage.","pt":"Tenho uma pergunta."},{"de":"Kannst du mir helfen?","pt":"Você pode me ajudar?"}]','["Descreveu o problema","Pediu ajuda","Usou vocabulário tech"]',120),
('a1-lukas-meeting','A1','trabalho','Reunião online','Você precisa avisar que está numa reunião e marcar outro horário.','lukas','Dizer que está em meeting e perguntar se a pessoa tem tempo depois.','Hey, hast du kurz Zeit?','[{"de":"Ich bin im Online-Meeting.","pt":"Estou na reunião online."},{"de":"Hast du später Zeit?","pt":"Você tem tempo mais tarde?"},{"de":"Um zehn Uhr passt gut.","pt":"Às dez está bom."}]','["Avisou indisponibilidade","Sugeriu ou aceitou horário","Usou tom informal"]',120),
('a1-lukas-interview','A1','trabalho','Mini entrevista tech','Você está numa entrevista simples e precisa se apresentar.','lukas','Dizer nome, origem e profissão.','Willkommen! Erzähl kurz etwas über dich.','[{"de":"Ich heiße Rebeca.","pt":"Eu me chamo Rebeca."},{"de":"Ich komme aus Brasilien.","pt":"Sou do Brasil."},{"de":"Ich arbeite als Webentwicklerin.","pt":"Trabalho como desenvolvedora web."}]','["Disse nome","Disse origem","Disse profissão"]',120),
('a1-hans-formal','A1','formal','Primeira conversa formal','Você precisa falar com uma pessoa desconhecida de forma educada.','hans','Usar Sie, pedir repetição e agradecer.','Guten Tag. Wie kann ich Ihnen helfen?','[{"de":"Können Sie mir helfen?","pt":"Pode me ajudar?"},{"de":"Können Sie das bitte wiederholen?","pt":"Pode repetir isso, por favor?"},{"de":"Danke für Ihre Hilfe.","pt":"Obrigado pela ajuda."}]','["Usou forma formal Sie","Pediu repetição","Agradeceu"]',100),
('a1-hans-termin','A1','burocracia','Marcar um horário','Você precisa explicar que tem/quer um horário marcado.','hans','Usar Termin corretamente e confirmar horário.','Guten Tag. Haben Sie einen Termin?','[{"de":"Ich habe einen Termin.","pt":"Tenho um horário marcado."},{"de":"Ich möchte einen Termin machen.","pt":"Gostaria de marcar um horário."},{"de":"Um zehn Uhr passt gut.","pt":"Às dez está bom."}]','["Usou Termin","Confirmou horário","Manteve tom educado"]',120),
('a1-petra-formular','A1','burocracia','Formulário no balcão','Você está no atendimento e precisa pedir um formulário.','petra','Pedir formulário, informar endereço e pedir ajuda.','Guten Tag. Welches Formular brauchen Sie?','[{"de":"Ich brauche ein Formular.","pt":"Preciso de um formulário."},{"de":"Meine Adresse ist hier.","pt":"Meu endereço é este aqui."},{"de":"Können Sie mir helfen?","pt":"Pode me ajudar?"}]','["Pediu formulário","Informou endereço","Pediu ajuda formalmente"]',120),
('a1-petra-revisao','A1','gramatica','Petra corrige sua frase','Você vai escrever uma frase simples e Petra vai corrigir com rigor.','petra','Escrever apresentação curta com nome, origem e cidade.','Schreiben Sie bitte drei einfache Sätze über sich. Ohne drama.','[{"de":"Ich heiße ...","pt":"Eu me chamo ..."},{"de":"Ich komme aus ...","pt":"Sou de ..."},{"de":"Ich wohne in ...","pt":"Moro em ..."}]','["Escreveu 2 ou mais frases","Usou verbos heißen/kommen/wohnen","Aceitou correção"]',100),
('a1-petra-reclamacao','A1','vida_real','Problema simples','Você precisa dizer que algo não funciona, sem enrolar.','petra','Informar o problema e pedir solução.','Was genau funktioniert nicht? Bitte präzise.','[{"de":"Das Internet funktioniert nicht.","pt":"A internet não funciona."},{"de":"Ich brauche Hilfe.","pt":"Preciso de ajuda."},{"de":"Danke für Ihre Hilfe.","pt":"Obrigado pela ajuda."}]','["Descreveu problema","Pediu ajuda","Finalizou educadamente"]',120)
on conflict (slug) do update set
  level = excluded.level,
  theme = excluded.theme,
  title_pt = excluded.title_pt,
  scenario_pt = excluded.scenario_pt,
  character_key = excluded.character_key,
  user_goal_pt = excluded.user_goal_pt,
  opening_line_de = excluded.opening_line_de,
  support_phrases = excluded.support_phrases,
  success_criteria = excluded.success_criteria,
  xp_reward = excluded.xp_reward,
  active = true,
  updated_at = now();
