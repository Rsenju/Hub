
// ===================================================
// BANCO DE FLASHCARDS (expandido 2026)
// ===================================================
const CARDS = [
  // A1 – DIA A DIA
  { id:'a1-01', nivel:'A1', tema:'dia-a-dia', frente:'Wie heißt du?', verso:'Como você se chama?', leigo:'Wie = como. Heißen = chamar-se. Forma informal.' },
  { id:'a1-02', nivel:'A1', tema:'dia-a-dia', frente:'Woher kommst du?', verso:'De onde você é?', leigo:'Woher = de onde. Kommen = vir. Resposta: Ich komme aus Brasilien.' },
  { id:'a1-03', nivel:'A1', tema:'dia-a-dia', frente:'Wie geht\'s?', verso:'Como vai? (informal)', leigo:'Forma curta de "Wie geht es dir?". Resposta: Gut, danke!' },
  { id:'a1-04', nivel:'A1', tema:'dia-a-dia', frente:'Mir geht es gut.', verso:'Estou bem.', leigo:'Literal: "a mim vai bem". Mir = dativo de ich.' },
  { id:'a1-05', nivel:'A1', tema:'dia-a-dia', frente:'Entschuldigung!', verso:'Com licença! / Desculpa!', leigo:'Usado para pedir passagem ou chamar atenção de alguém.' },
  { id:'a1-06', nivel:'A1', tema:'dia-a-dia', frente:'Bitte / Danke', verso:'Por favor / Obrigado', leigo:'Bitte também significa "de nada" ao responder um agradecimento.' },
  { id:'a1-07', nivel:'A1', tema:'dia-a-dia', frente:'Guten Morgen / Abend / Nacht', verso:'Bom dia / Boa tarde-noite / Boa noite', leigo:'Tag = dia (meio-dia). Abend = a partir das 18h. Nacht = ao dormir.' },
  { id:'a1-08', nivel:'A1', tema:'dia-a-dia', frente:'Tschüss / Auf Wiedersehen', verso:'Tchau (informal) / Até logo (formal)', leigo:'Tschüss entre amigos. Auf Wiedersehen em contextos formais.' },
  { id:'a1-09', nivel:'A1', tema:'dia-a-dia', frente:'Ich verstehe nicht.', verso:'Eu não entendo.', leigo:'Muito útil! Verstehen = entender. Können Sie langsamer sprechen? = Pode falar mais devagar?' },
  { id:'a1-10', nivel:'A1', tema:'dia-a-dia', frente:'Können Sie das wiederholen?', verso:'Pode repetir?', leigo:'Formal com "Sie". Com amigos: Kannst du das wiederholen?' },
  // A1 – TRABALHO
  { id:'a1-11', nivel:'A1', tema:'trabalho', frente:'Ich bin Entwickler / Lehrerin.', verso:'Eu sou desenvolvedor / professora.', leigo:'Profissões: sem artigo depois de "sein" (ser). Feminino: -in.' },
  { id:'a1-12', nivel:'A1', tema:'trabalho', frente:'Ich arbeite bei...', verso:'Eu trabalho na/no...', leigo:'Bei = em (empresa). Ich arbeite bei Google / bei einer Schule.' },
  // A1 – VIAGEM
  { id:'a1-13', nivel:'A1', tema:'viagem', frente:'Wo ist der Bahnhof?', verso:'Onde fica a estação de trem?', leigo:'Wo = onde. Der Bahnhof = a estação. Frage típica de viagem.' },
  { id:'a1-14', nivel:'A1', tema:'viagem', frente:'Ein Ticket nach Berlin, bitte.', verso:'Uma passagem para Berlim, por favor.', leigo:'Nach + cidade. Ein Ticket (ida) / Hin- und Rückfahrt (ida e volta).' },
  { id:'a1-15', nivel:'A1', tema:'viagem', frente:'Wo ist die Toilette?', verso:'Onde fica o banheiro?', leigo:'WC também funciona. Em restaurantes: "Haben Sie eine Toilette?"' },
  // A1 – PEDIDOS
  { id:'a1-16', nivel:'A1', tema:'pedidos', frente:'Ich möchte einen Kaffee, bitte.', verso:'Eu gostaria de um café, por favor.', leigo:'Möchte = gostaria (forma educada de querer). Einen = acusativo masculino.' },
  { id:'a1-17', nivel:'A1', tema:'pedidos', frente:'Die Rechnung, bitte!', verso:'A conta, por favor!', leigo:'Em restaurantes. Também: Zahlen, bitte! (Quero pagar!)' },
  { id:'a1-18', nivel:'A1', tema:'pedidos', frente:'Was kostet das?', verso:'Quanto custa?', leigo:'Kosten = custar. Alternativa: Wie viel kostet das?' },
  // A1 – GÍRIAS
  { id:'a1-19', nivel:'A1', tema:'girias', frente:'Alles klar!', verso:'Entendido! / Tudo certo!', leigo:'Expressão super comum. Pode responder a qualquer coisa com ela.' },
  { id:'a1-20', nivel:'A1', tema:'girias', frente:'krass', verso:'absurdo / incrível / demais', leigo:'Jovens em 2026 usam muito. "Das war krass!" = Isso foi absurdo/incrível!' },
  { id:'a1-21', nivel:'A1', tema:'girias', frente:'Digga / Alter', verso:'cara / mano (gíria)', leigo:'"Digga, was machst du?" = Cara, o que você tá fazendo? Muito Berlin.' },
  { id:'a1-22', nivel:'A1', tema:'girias', frente:'Moin!', verso:'Oi! (Norte da Alemanha)', leigo:'Usado em Hamburgo e norte. Pode usar o dia todo, qualquer hora.' },
  { id:'a1-23', nivel:'A1', tema:'girias', frente:'Leider', verso:'Infelizmente', leigo:'"Leider nein" = Infelizmente não. Muito usado em e-mails formais.' },
  // A2 – DIA A DIA
  { id:'a2-01', nivel:'A2', tema:'dia-a-dia', frente:'Ich habe gestern gearbeitet.', verso:'Eu trabalhei ontem.', leigo:'Perfekt: haben + ge- + Stamm + t. Gestern = ontem.' },
  { id:'a2-02', nivel:'A2', tema:'dia-a-dia', frente:'Ich werde morgen lernen.', verso:'Eu vou estudar amanhã.', leigo:'Futuro: werden + infinitivo no final. Morgen = amanhã.' },
  { id:'a2-03', nivel:'A2', tema:'dia-a-dia', frente:'Ich freue mich darauf.', verso:'Estou animado com isso / Mal posso esperar.', leigo:'Sich freuen auf = aguardar com entusiasmo. Reflexivo.' },
  { id:'a2-04', nivel:'A2', tema:'dia-a-dia', frente:'Das macht nichts.', verso:'Não tem problema. / Não importa.', leigo:'Frase de reassurance. Muito útil no dia a dia.' },
  { id:'a2-05', nivel:'A2', tema:'dia-a-dia', frente:'Wann fängt es an?', verso:'Quando começa?', leigo:'Anfangen = começar (verbo separável). Fängt... an.' },
  // A2 – TRABALHO
  { id:'a2-06', nivel:'A2', tema:'trabalho', frente:'Können wir einen Termin machen?', verso:'Podemos marcar uma reunião?', leigo:'Termin = compromisso/reunião. Machen = fazer/marcar.' },
  { id:'a2-07', nivel:'A2', tema:'trabalho', frente:'Ich schicke Ihnen die Unterlagen.', verso:'Enviarei os documentos ao senhor.', leigo:'Schicken = enviar. Ihnen = dativo formal de Sie. Unterlagen = documentos.' },
  { id:'a2-08', nivel:'A2', tema:'trabalho', frente:'Mit freundlichen Grüßen', verso:'Atenciosamente (e-mail formal)', leigo:'Encerramento padrão de e-mail formal. Equivale ao "Best regards".' },
  { id:'a2-09', nivel:'A2', tema:'trabalho', frente:'Ich bin im Homeoffice.', verso:'Estou em home office.', leigo:'Homeoffice = trabalho remoto. Amplamente usado desde 2020.' },
  // A2 – VIAGEM
  { id:'a2-10', nivel:'A2', tema:'viagem', frente:'Haben Sie ein Zimmer frei?', verso:'Tem um quarto disponível?', leigo:'Frei = livre/disponível. Zimmer = quarto. Em hotel/pousada.' },
  { id:'a2-11', nivel:'A2', tema:'viagem', frente:'Ich habe eine Allergie gegen...', verso:'Tenho alergia a...', leigo:'Gegen = contra. Fundamental para restaurantes. Gegen Nüsse = nozes.' },
  { id:'a2-12', nivel:'A2', tema:'viagem', frente:'Können Sie mir helfen?', verso:'Pode me ajudar?', leigo:'Helfen = ajudar. Com dativo: mir (a mim). Formal com Sie.' },
  // A2 – PEDIDOS
  { id:'a2-13', nivel:'A2', tema:'pedidos', frente:'Haben Sie das auch in Größe M?', verso:'Tem também no tamanho M?', leigo:'Em lojas de roupa. Größe = tamanho. Auch = também.' },
  { id:'a2-14', nivel:'A2', tema:'pedidos', frente:'Ich nehme das.', verso:'Vou levar esse / Fico com esse.', leigo:'Nehmen = pegar/tomar. Usado em lojas e restaurantes.' },
  { id:'a2-15', nivel:'A2', tema:'pedidos', frente:'Ohne... bitte.', verso:'Sem... por favor.', leigo:'"Ohne Zwiebeln bitte" = Sem cebola por favor. Acusativo depois de ohne.' },
  // A2 – GÍRIAS
  { id:'a2-16', nivel:'A2', tema:'girias', frente:'Das ist voll krass!', verso:'Isso é demais / muito absurdo!', leigo:'Voll = muito (gíria). Substitui "sehr" no alemão informal.' },
  { id:'a2-17', nivel:'A2', tema:'girias', frente:'Bock haben auf', verso:'Estar a fim de...', leigo:'"Ich habe Bock auf Pizza." = Estou a fim de pizza. Muito jovem e informal.' },
  { id:'a2-18', nivel:'A2', tema:'girias', frente:'Ich bin so am chillen.', verso:'Estou relaxando / dando um chill.', leigo:'Am + infinitivo = ação em progresso (Verlaufsform). Super casual.' },
  // B1 – DIA A DIA
  { id:'b1-01', nivel:'B1', tema:'dia-a-dia', frente:'Ich denke, dass das wichtig ist.', verso:'Eu acho que isso é importante.', leigo:'Dass = que (conectivo). Verbo vai para o fim da oração subordinada.' },
  { id:'b1-02', nivel:'B1', tema:'dia-a-dia', frente:'Einerseits... andererseits...', verso:'Por um lado... por outro lado...', leigo:'Conectivo de contraste. Essencial para redações e opiniões.' },
  { id:'b1-03', nivel:'B1', tema:'dia-a-dia', frente:'Wenn ich mehr Zeit hätte, würde ich reisen.', verso:'Se eu tivesse mais tempo, viajaria.', leigo:'Konjunktiv II: hätte + würde. Condição irreal/hipótese.' },
  { id:'b1-04', nivel:'B1', tema:'dia-a-dia', frente:'Das wird gemacht.', verso:'Isso é feito. / Isso vai ser feito.', leigo:'Passivo: werden + Partizip II. Muito usado em contextos formais.' },
  { id:'b1-05', nivel:'B1', tema:'dia-a-dia', frente:'Meiner Meinung nach...', verso:'Na minha opinião...', leigo:'Frase de abertura para opinião. Após isso: sujeito + verbo.' },
  // B1 – TRABALHO
  { id:'b1-06', nivel:'B1', tema:'trabalho', frente:'Ich möchte mich auf die Stelle bewerben.', verso:'Gostaria de me candidatar à vaga.', leigo:'Sich bewerben auf = candidatar-se a. Stelle = vaga/posição.' },
  { id:'b1-07', nivel:'B1', tema:'trabalho', frente:'Was sind Ihre Stärken?', verso:'Quais são os seus pontos fortes?', leigo:'Entrevista de emprego. Stärken = pontos fortes. Schwächen = fraquezas.' },
  { id:'b1-08', nivel:'B1', tema:'trabalho', frente:'Ich bin für das Projekt verantwortlich.', verso:'Sou responsável pelo projeto.', leigo:'Verantwortlich sein für = ser responsável por. Für + acusativo.' },
  { id:'b1-09', nivel:'B1', tema:'trabalho', frente:'Das liegt nicht in meiner Zuständigkeit.', verso:'Isso não é da minha competência.', leigo:'Expressão formal. Zuständigkeit = competência/responsabilidade.' },
  // B1 – VIAGEM
  { id:'b1-10', nivel:'B1', tema:'viagem', frente:'Mein Gepäck ist verloren gegangen.', verso:'Minha bagagem se perdeu.', leigo:'Verloren gehen = perder-se. Perfekt com sein. Em aeroportos.' },
  { id:'b1-11', nivel:'B1', tema:'viagem', frente:'Ich fühle mich nicht wohl.', verso:'Não estou me sentindo bem.', leigo:'Sich fühlen = sentir-se. Wohl = bem. Para médico ou farmácia.' },
  { id:'b1-12', nivel:'B1', tema:'viagem', frente:'Könnten Sie mir den Weg erklären?', verso:'Poderia me explicar o caminho?', leigo:'Konjunktiv II de können = poderia (mais educado). Weg = caminho.' },
  // B1 – PEDIDOS
  { id:'b1-13', nivel:'B1', tema:'pedidos', frente:'Ich hätte gern den Salat als Vorspeise.', verso:'Gostaria da salada como entrada.', leigo:'Hätte gern = gostaria (mais educado). Vorspeise = entrada.' },
  { id:'b1-14', nivel:'B1', tema:'pedidos', frente:'Darf ich das umtauschen?', verso:'Posso trocar isso?', leigo:'Umtauschen = trocar (produto). Dürfen = ter permissão.' },
  // B1 – GÍRIAS
  { id:'b1-15', nivel:'B1', tema:'girias', frente:'Das ist nicht mein Ding.', verso:'Não é a minha praia. / Não é para mim.', leigo:'Mein Ding = minha coisa/estilo. Coloquial e muito natural.' },
  { id:'b1-16', nivel:'B1', tema:'girias', frente:'Ich bin totmüde.', verso:'Estou morto de cansado.', leigo:'Tot = morto. Compostos com "tot" intensificam. Totlachen = morrer de rir.' },
  { id:'b1-17', nivel:'B1', tema:'girias', frente:'Komm schon!', verso:'Vai lá! / Vamos! / Me poupa!', leigo:'Variável pelo contexto: incentivo, impaciência ou surpresa.' },
  { id:'b1-18', nivel:'B1', tema:'girias', frente:'Das geht so.', verso:'É mais ou menos. / Vai assim.', leigo:'Resposta neutra. "Wie war der Film?" "Das geht so." = Foi mais ou menos.' },
  { id:'b1-19', nivel:'B1', tema:'girias', frente:'cringe', verso:'vergonhoso / constrangedor (empréstimo do inglês)', leigo:'Jovens alemães usam muito em 2026. "Das ist so cringe!" = Que vergonha!' },
  { id:'b1-20', nivel:'B1', tema:'girias', frente:'flexen', verso:'se exibir / mostrar', leigo:'"Er flexed mit seinem Auto." = Ele está se exibindo com o carro. TikTok/social media.' },
];

// ===================================================
// ESTADO
// ===================================================
let currentFilter = 'all';
let currentThemeFilter = null;

// ===================================================
// SRS & PROGRESSO
// ===================================================
const Store = {
  get: k => JSON.parse(localStorage.getItem('dh-' + k) || 'null'),
  set: (k, v) => localStorage.setItem('dh-' + k, JSON.stringify(v)),
  getXP: () => Store.get('xp') || 0,
  addXP: n => { Store.set('xp', Store.getXP() + n); updateXPUI(); },
  getStreak: () => {
    const today = new Date().toDateString();
    const last = Store.get('streak-date');
    let s = Store.get('streak') || 0;
    if (last !== today) {
      const yest = new Date(); yest.setDate(yest.getDate()-1);
      s = (last === yest.toDateString()) ? s+1 : 1;
      Store.set('streak', s); Store.set('streak-date', today);
    }
    return s;
  },
  getSRS: () => Store.get('srs') || {},
  setSRS: d => Store.set('srs', d),
  cardDue: id => { const srs = Store.getSRS(); return !srs[id] || srs[id].next <= Date.now(); },
  evaluateCard: (id, rating) => {
    const srs = Store.getSRS();
    const c = srs[id] || { interval: 1, ease: 2.5 };
    const day = 86400000;
    if (rating === 'easy') { c.interval = Math.min(c.interval * 2.5, 30); c.ease = Math.min(c.ease + 0.2, 3); }
    else if (rating === 'medium') { c.interval = Math.min(c.interval * 1.5, 14); }
    else { c.interval = 1; c.ease = Math.max(c.ease - 0.3, 1.3); }
    c.next = Date.now() + c.interval * day;
    srs[id] = c; Store.setSRS(srs);
  },
  getNote: k => Store.get('note-' + k) || '',
  setNote: (k, v) => Store.set('note-' + k, v),
};

function updateXPUI() {
  const xp = Store.getXP();
  const pct = Math.min(xp / 500 * 100, 100);

  // Atualiza barra de XP na página de flashcards (se existir)
  const xpFill = document.getElementById('xp-fill');
  if (xpFill) xpFill.style.width = pct + '%';

  const xpNum = document.getElementById('xp-num');
  if (xpNum) xpNum.textContent = xp;

  // Atualiza barra no topbar (se existir)
  const levelProgressBar = document.getElementById('levelProgressBar');
  if (levelProgressBar) levelProgressBar.style.width = pct + '%';

  const levelXP = document.getElementById('levelXP');
  if (levelXP) levelXP.textContent = `${xp} / 500 XP`;

  // Atualiza streak (se existir)
  const streakNum = document.getElementById('streak-num');
  if (streakNum) streakNum.textContent = Store.getStreak();

  // Atualiza sidebar (se existir)
  const sbFill = document.getElementById('sb-xp-fill');
  if (sbFill) sbFill.style.width = pct + '%';
  const sbXpLabel = document.getElementById('sb-xp-label');
  if (sbXpLabel) sbXpLabel.textContent = `${xp} / 500 XP`;
  const sbStreak = document.getElementById('sb-streak');
  if (sbStreak) sbStreak.textContent = Store.getStreak();
}

// ===================================================
// THEME
// ===================================================


// ===================================================
// PAGES
// ===================================================
window.showPage = function(p) {
  document.querySelectorAll('.page').forEach(el => el.classList.remove('active'));
  document.querySelectorAll('.nav-pill').forEach(el => el.classList.remove('active'));
  document.getElementById('page-' + p)?.classList.add('active');
  const idx = ['home','flashcards','biblioteca','chat','notas','review'].indexOf(p);
  document.querySelectorAll('.nav-pill')[idx]?.classList.add('active');
  if (p === 'flashcards') renderFlashcards();
  if (p === 'biblioteca') loadStudyLibrary();
  if (p === 'notas') loadNotes();
  if (p === 'review') loadErrorReview();
};

// ===================================================
// FILTER
// ===================================================
window.setFilter = function(f) {
  currentFilter = f;
  currentThemeFilter = null;
  document.querySelectorAll('.filter-chip').forEach(el => el.classList.toggle('active', el.dataset.filter === f));
  document.querySelectorAll('.sidebar-link').forEach(el => el.classList.remove('active'));
  document.getElementById('sl-' + f)?.classList.add('active');
  showPage('flashcards');
}

window.setThemeFilter = function(t) {
  currentFilter = 'theme';
  currentThemeFilter = t;
  document.querySelectorAll('.filter-chip').forEach(el => el.classList.toggle('active', el.dataset.filter === t));
  showPage('flashcards');
}

function sidebarSearch(q) {
  if (!q) return;
  currentFilter = 'search';
  currentThemeFilter = null;
  showPage('flashcards');
  renderFlashcards(q.toLowerCase());
}

// ===================================================
// AUDIO (TTS)
// ===================================================
const synth = window.speechSynthesis;
function speak(text, slow) {
  synth.cancel();
  const u = new SpeechSynthesisUtterance(text);
  u.lang = 'de-DE';
  u.rate = slow ? 0.5 : 0.95;
  synth.speak(u);
}

// ===================================================
// RENDER FLASHCARDS
// ===================================================
function renderFlashcards(searchQ) {
  let cards = CARDS;
  if (searchQ) {
    cards = cards.filter(c => c.frente.toLowerCase().includes(searchQ) || c.verso.toLowerCase().includes(searchQ) || c.leigo?.toLowerCase().includes(searchQ));
  } else if (currentThemeFilter) {
    cards = cards.filter(c => c.tema === currentThemeFilter);
  } else if (currentFilter !== 'all') {
    cards = cards.filter(c => c.nivel === currentFilter);
  }
  cards = cards.filter(c => Store.cardDue(c.id));

  const grid = document.getElementById('flashcardGrid');
  if (!grid) return;

  if (!cards.length) {
    grid.innerHTML = '<div style="grid-column:1/-1;text-align:center;padding:60px 20px;color:var(--muted);">🎉 Todos os flashcards revisados! <br><br><button class="btn-secondary" onclick="resetSRS()">Ver todos novamente</button></div>';
    return;
  }

  grid.innerHTML = cards.map(card => `
    <div class="flashcard" data-id="${card.id}" data-text="${encodeURIComponent(card.frente)}">
      <div class="fc-tag">${card.nivel} · ${themeLabel(card.tema)}</div>
      <div class="fc-front">${card.frente}</div>
      <div class="fc-audio-btns">
        <button class="fc-audio-btn" onclick="event.stopPropagation();playAudio('${card.id}', false)" title="Velocidade normal">🔊 Normal</button>
        <button class="fc-audio-btn" onclick="event.stopPropagation();playAudio('${card.id}', true)" title="Devagar">🐢 Devagar</button>
      </div>
      <div class="fc-back">${card.verso}</div>
      <div class="fc-leigo">💡 ${card.leigo || ''}</div>
      <div class="srs-btns">
        <button class="srs-btn easy" onclick="event.stopPropagation();rateCard('${card.id}','easy')">Fácil ✓</button>
        <button class="srs-btn medium" onclick="event.stopPropagation();rateCard('${card.id}','medium')">Médio</button>
        <button class="srs-btn hard" onclick="event.stopPropagation();rateCard('${card.id}','hard')">Difícil</button>
      </div>
    </div>
  `).join('');

  grid.querySelectorAll('.flashcard').forEach(fc => {
    fc.addEventListener('click', () => {
      const wasOpen = fc.classList.contains('is-open');
      grid.querySelectorAll('.flashcard').forEach(f => f.classList.remove('is-open'));
      if (!wasOpen) {
        fc.classList.add('is-open');
        speak(decodeURIComponent(fc.dataset.text), false);
      }
    });
  });
}

function themeLabel(t) {
  const m = { 'dia-a-dia':'Dia a dia', 'trabalho':'Trabalho', 'viagem':'Viagem', 'pedidos':'Pedidos', 'girias':'Gírias' };
  return m[t] || t;
}

function playAudio(cardId, slow) {
  const card = CARDS.find(c => c.id === cardId);
  if (card) speak(card.frente, slow);
}

function rateCard(id, rating) {
  Store.evaluateCard(id, rating);
  Store.addXP(rating === 'easy' ? 3 : rating === 'medium' ? 2 : 1);
  const fc = document.querySelector(`.flashcard[data-id="${id}"]`);
  if (fc) { fc.style.opacity = '0'; fc.style.transform = 'scale(0.95)'; fc.style.transition = 'all 0.3s'; setTimeout(() => { fc.remove(); }, 300); }
}

function resetSRS() {
  Store.set('srs', {});
  renderFlashcards();
}


// ===================================================
// CHARACTERS CONFIG (full lore + hybrid brain)
// ===================================================
const CHAR_AVATARS = {
  hans: 'data:public/hans.png',
  lukas: 'data:public/lukas.png',
  heidi: 'data:public/heidi.png',
  petra: 'data:public/petra.png',
};

const CHARACTERS = {
  hans: {
    name: 'Hans', label: 'Hans – O Mentor', chatName: 'Hans',
    desc: 'Intelectual sério. Acorda 5h, café preto, Nietzsche. Usa metáforas musicais para gramática.',
    voiceId: 'tZPwJezAhAZUGGBZDmR0',
    callGreeting: 'Guten Morgen. Hans hier. Ich war gerade im Tiergarten. Was wollen Sie heute üben?',
    greeting: 'Guten Tag, Rebeca. *putzt die Brille* Beginnen wir mit dem Wesentlichen: der deutschen Grammatik. Schreib mir einen Satz — ich höre jeden falschen Artikel. 🇩🇪',
    systemPrompt: `Du bist Hans, ein strenger Deutschlehrer. Du liebst Nietzsche, den Tiergarten und Musikmetaphern für Grammatik ("Das Deutsche ist wie eine Symphonie — wenn ein Instrument (der Artikel) verstimmt ist, leidet das ganze Werk"). Du reinigst obsessiv deine Brille bei Deklensionsfehlern. Deine Schülerin heißt Rebeca (Brasilianerin, A1/A2).
VERHALTEN: Antworte auf Deutsch präzise. Nutze musikalische Metaphern. Wenn Rebeca Portugiesisch schreibt: 1. Übersetze 2. Erkläre EINE Regel 3. Antworte auf Deutsch (Übersetzung in Klammern).
KORREKTUR-FORMAT (IMMER am Ende wenn Fehler):
---KORREKTUR---
🎼 [Musikalische Metapher]
❌ Fehler: [falsche Form]
✅ Richtig: [korrekte Form]
💡 Regel (em português): [regra gramatical]
XP: 10
---
Wenn kein Fehler: ✅ Gut gespielt, Rebeca. Comme um perfektes Arpeggio.`
  },
  lukas: {
    name: 'Lukas', label: 'Lukas – O Dev', chatName: 'Lukas',
    desc: 'Dev de Kreuzberg. Club-Mate, Döner, Metal industrial à noite.',
    voiceId: 'IeQubAjK1ujbppIdhJw4',
    callGreeting: 'Yo Rebeca! Lukas hier. Gerade beim Co-working in Kreuzberg. Was geht ab, Digga?',
    greeting: 'Hey Rebeca! Lukas hier aus Kreuzberg 🧢 Gerade ein Club-Mate am chill. Lass uns quatschen — kein cringe-formales Deutsch! Was ist dein Stand, Digga? 😎🇩🇪',
    systemPrompt: `Du bist Lukas, 26, Dev aus Kreuzberg. Club-Mate, Döner, Industrial-Metal-Beats (Rammstein-Style) nachts. Du mischt Tech-Begriffe: "commit", "push", "bug", "fix", "deploy". Deine Schülerin heißt Rebeca.
VERHALTEN: Sehr informell. Slang 2026: "krass", "Digga", "Alter", "Bock", "cringe", "flexen", "chillen", "mega". Wenn Rebeca Portugiesisch schreibt: 1. Übersetze locker 2. Slang-Tipp 3. Antworte auf Deutsch.
KORREKTUR-FORMAT:
---KORREKTUR---
🐛 Bug in deiner Logik, Rebeca!
❌ Dein Code: [falsche Form]
✅ Der Fix: [korrekte natürliche Form]
💡 Dica (em português): [explicação]
XP: 10
---
Wenn Gíria benutzt: XP: 15
Wenn kein Fehler: ✅ Krass Rebeca, alles committed! Kein Bug! XP: 10`
  },
  heidi: {
    name: 'Heidi', label: 'Heidi – A Viajante', chatName: 'Heidi',
    desc: 'Freelancer nômade. Todos os hacks da Deutsche Bahn, café mais barato de todo aeroporto europeu.',
    voiceId: 'rAmra0SCIYOxYmRNDSm3',
    callGreeting: 'Heidi hier! Gerade am Flughafen — brauchen Sie ein Ticket oder ein Zimmer?',
    greeting: 'Hallo Rebeca! Heidi hier ✈️ *berührt ihr Amulett* Ich zeige dir, wie man auf Reisen WIRKLICH Deutsch spricht — von der Straße, nicht vom Lehrbuch. Wohin reist du heute? 🗺️',
    systemPrompt: `Du bist Heidi, nomadische Freelance-Übersetzerin. Nie länger als 2 Monate am selben Ort. Du kennst alle Deutsche-Bahn-Hacks. Du trägst ein Amulett aus jedem Land. Grimasse bei Frankreich ("Sogar deren GPS klingt arrogant"). Deine Schülerin heißt Rebeca.
VERHALTEN: Freundlich, praktisch, reisefokussiert. Wenn Rebeca Portugiesisch schreibt: 1. Übersetze 2. Reise-Tipp 3. Antworte auf Deutsch. Fokus: Hotel, Bahnhof, Flughafen, Restaurant, Notfälle.
KORREKTUR-FORMAT:
---KORREKTUR---
✈️ Reise-Check für Rebeca:
❌ So gibt es Probleme: [falsche Form]
✅ So kommst du durch: [korrekte Form]
💡 Dica de sobrevivência (em português): [correção + dica]
XP: 10
---
Wenn kein Fehler: ✅ Perfekt, Rebeca! Mit diesem Satz überlebst du jeden deutschen Bahnhof. XP: 10`
  },
  petra: {
    name: 'Petra', label: 'Petra – A Analítica', chatName: 'Petra',
    desc: 'Bibliotecária old school. Sarcasmo é carinho. Chá de camomila. Xícara "Shhh!".',
    voiceId: 'dCnu06FiOZma2KVNUoPZ',
    callGreeting: 'Petra hier. *Stille* Sprechen Sie leise. Dies ist eine Bibliothek. Was brauchen Sie?',
    greeting: 'Petra hier. *nippt am Kamillentee* Ihre Akte zeigt: Anfängerin. Gut. Schreiben Sie etwas auf Deutsch, Rebeca. Ich werde... präzise sein. 📚',
    systemPrompt: `Du bist Petra, Bibliothekarin. Labyrinthisches Archiv, Kamillentee, "Shhh!"-Tasse. Sarkastisch aber fürsorglich. Du glaubst: "Rigor ist Liebe zur deutschen Sprache." Deine Schülerin heißt Rebeca.
VERHALTEN: Präzise, leicht ironisch, warmherzig. Wenn Rebeca Portugiesisch schreibt: 1. Übersetze 2. Präziser Grammatikhinweis 3. Antworte auf Deutsch. Finde UND KATALOGISIERE jeden Fehler, auch kleine.
KORREKTUR-FORMAT (Petra findet IMMER etwas):
---KORREKTUR---
📚 Katalog für Rebeca — ihre Phrase ist fast so unorganisiert wie ein Regal nach einem Erdbeben:
• Fehler 1: ❌ "[falsch]" → ✅ "[richtig]" | (em português): [explicação]
(liste ALLE Fehler einzeln)
💡 Petra's Urteil (em português): [resumo sarcástico mas carinhoso]
📊 Precisão: X/10
XP: 10
---
Wenn WIRKLICH kein Fehler: ✅ *schaut über die Brille* Nun... akzeptabel. Nicht schlecht, Rebeca. Precisão: 10/10. XP: 10`
  }
};

let currentChar = 'hans';
let charHistories = { hans:[], lukas:[], heidi:[], petra:[] };
let currentAudio = null;
let isPremiumVoice = false;
let callActive = false;
let callRecognition = null;
let xpLog = [];
let exchangeCount = 0;

// ===================================================
// INIT STATE
// ===================================================
function initKeys() {
  const h = localStorage.getItem('dh-char-histories');
  if (h) try { charHistories = JSON.parse(h); } catch(e) {}
  const xl = localStorage.getItem('dh-xp-log');
  if (xl) try { xpLog = JSON.parse(xl); } catch(e) {}
}

// ===================================================
// VOICE TOGGLE
// ===================================================
function onVoiceToggle() {
  isPremiumVoice = document.getElementById('voicePremiumToggle').checked;
  const badge = document.getElementById('voiceBadge');
  badge.textContent = isPremiumVoice ? 'Premium ✨' : 'Normal';
  badge.style.background = isPremiumVoice ? 'var(--accent)' : 'var(--accent-soft)';
  badge.style.color = isPremiumVoice ? '#fff' : 'var(--accent)';
}

// ===================================================
// CHARACTER SELECTION (per-char history)
// ===================================================
const CHAR_PHOTOS = {
  hans: 'public/hans.png',
  lukas: 'public/lukas.png',
  heidi: 'public/heidi.png',
  petra: 'public/petra.png'
};

const CHAR_EMOJIS = {
  hans: '🧔', lukas: '🧢', heidi: '✈️', petra: '📚'
};

function selectChar(charKey) {
  currentChar = charKey;
  const ch = CHARACTERS[charKey];
  exchangeCount = 0;

  // Atualiza botões
  document.querySelectorAll('.char-btn').forEach(b => b.classList.toggle('active', b.dataset.char === charKey));
  
  // Atualiza foto/emoji na barra ativa
  const imgEl = document.getElementById('charActiveImg');
  const emojiEl = document.getElementById('charActiveEmoji');
  if (imgEl) {
    imgEl.src = CHAR_PHOTOS[charKey];
    imgEl.alt = ch.name;
    imgEl.style.display = 'block';
  }
  if (emojiEl) emojiEl.style.display = 'none';
  
  // Atualiza textos
  document.getElementById('charActiveName').textContent = ch.label;
  document.getElementById('charActiveDesc').textContent = ch.desc;

  const msgs = document.getElementById('chatMessages');
  const divider = document.createElement('div');
  divider.style.cssText = 'text-align:center;color:var(--muted);font-size:12px;padding:12px 0;border-top:1px solid var(--border);margin:8px 0;';
  divider.textContent = `— Agora conversando com ${ch.name} —`;
  msgs.appendChild(divider);

  const hist = charHistories[charKey] || [];
  if (hist.length === 0) {
    const greetDiv = document.createElement('div');
    greetDiv.className = 'chat-msg bot';
    greetDiv.innerHTML = `<div class="chat-name">${ch.chatName}</div><div class="chat-bubble">${escHtml(ch.greeting)}</div>`;
    msgs.appendChild(greetDiv);
  } else {
    hist.forEach(entry => {
      const div = document.createElement('div');
      div.className = 'chat-msg ' + entry.role;
      if (entry.role === 'bot') {
        div.innerHTML = `<div class="chat-name">${ch.chatName}</div><div class="chat-bubble">${escHtml(entry.text)}</div>`;
      } else {
        const bubble = document.createElement('div');
        bubble.className = 'chat-bubble'; bubble.textContent = entry.text;
        div.appendChild(bubble);
      }
      msgs.appendChild(div);
    });
  }
  msgs.scrollTop = msgs.scrollHeight;
}

function clearCurrentHistory() {
  charHistories[currentChar] = [];
  localStorage.setItem('dh-char-histories', JSON.stringify(charHistories));
  const msgs = document.getElementById('chatMessages');
  msgs.innerHTML = '';
  const ch = CHARACTERS[currentChar];
  const greetDiv = document.createElement('div');
  greetDiv.className = 'chat-msg bot';
  greetDiv.innerHTML = `<div class="chat-name">${ch.chatName}</div><div class="chat-bubble">${escHtml(ch.greeting)}</div>`;
  msgs.appendChild(greetDiv);
  exchangeCount = 0;
}

// ===================================================
// HYBRID BRAIN: Groq → HuggingFace → Petra error
// ===================================================
async function callGroq(messages, systemPrompt) {
  const res = await fetch('/api/groq', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      model: 'llama3-8b-8192',
      messages: [{ role:'system', content:systemPrompt }, ...messages],
      max_tokens: 800, temperature: 0.7
    })
  });
  const d = await res.json();
  if (!res.ok) throw new Error(d.error?.message || 'groq-error');
  return d.choices[0].message.content;
}

async function callHuggingFace(messages, systemPrompt) {
  const prompt = systemPrompt + '\n\n' + messages.map(m => (m.role==='user'?'User: ':'Assistant: ') + m.content).join('\n') + '\nAssistant:';
  const res = await fetch('/api/huggingface', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ inputs: prompt, parameters: { max_new_tokens: 600, temperature: 0.7 } })
  });
  const d = await res.json();
  if (!res.ok || !d[0]) throw new Error('hf-error');
  const out = d[0].generated_text || '';
  return out.split('Assistant:').pop().trim();
}

async function callAI(messages, systemPrompt) {
  try {
    return await callGroq(messages, systemPrompt);
  } catch(e1) {
    try {
      return await callHuggingFace(messages, systemPrompt);
    } catch(e2) {
      return 'Entschuldigung, Rebeca. Die Verbindung ist gerade nicht stabil. Bitte antworte trotzdem auf Deutsch!';
    }
  }
}

// ===================================================
// XP SYSTEM
// ===================================================
function awardXP(reason, amount) {
  Store.addXP(amount);
  const entry = { reason: reason, amount: amount, char: currentChar, time: new Date().toLocaleTimeString('pt-BR', {hour:'2-digit',minute:'2-digit'}) };
  xpLog.unshift(entry);
  if (xpLog.length > 100) xpLog = xpLog.slice(0,100);
  localStorage.setItem('dh-xp-log', JSON.stringify(xpLog));
}

function parseXPFromResponse(raw) {
  const match = raw.match(/XP:\s*(\d+)/);
  if (match) {
    const amount = parseInt(match[1]);
    if (amount > 0) {
      let reason = 'Frase correta em alemão ✅';
      if (amount === 15) reason = 'Gíria usada com Lukas 😎';
      if (amount === 20) reason = 'Explicação gramatical lida com Hans 📖';
      awardXP(reason, amount);
    }
  }
}

function openXPLog() {
  document.getElementById('xpModal').classList.add('open');
  document.getElementById('modalXPTotal').textContent = Store.getXP();
  const tbody = document.getElementById('xpLogBody');
  if (!xpLog.length) {
    tbody.innerHTML = '<tr><td colspan="3" style="color:var(--muted);text-align:center;padding:20px;">Nenhuma conquista ainda. Comece a estudar!</td></tr>';
    return;
  }
  tbody.innerHTML = xpLog.map(e => `<tr><td>${e.reason}</td><td class="xp-badge-val">+${e.amount}</td><td style="color:var(--muted)">${e.time}</td></tr>`).join('');
}
function closeXPLog() { document.getElementById('xpModal').classList.remove('open'); }

// ===================================================
// CHALLENGE MODE
// ===================================================
function getLocalChallengeOpening(scenario) {
  const s = (scenario || '').toLowerCase();
  if (s.includes('hotel')) return 'Guten Abend! Willkommen im Hotel. Haben Sie eine Reservierung?';
  if (s.includes('metr') || s.includes('bahn')) return 'Hallo! Wohin möchten Sie fahren? Ich helfe Ihnen.';
  if (s.includes('entrevista') || s.includes('tech')) return 'Willkommen! Erzählen Sie bitte kurz etwas über sich.';
  if (s.includes('loja') || s.includes('roupa')) return 'Guten Tag! Suchen Sie etwas Bestimmtes?';
  if (s.includes('emerg') || s.includes('méd') || s.includes('med')) return 'Guten Tag. Was ist passiert? Brauchen Sie Hilfe?';
  if (s.includes('padaria') || s.includes('café') || s.includes('cafe')) return 'Guten Morgen! Was möchten Sie heute?';
  return 'Guten Tag! Wie kann ich Ihnen helfen?';
}

function startChallenge(scenario) {
  if (!scenario.trim()) return;
  const ch = CHARACTERS[currentChar];
  showPage('chat');
  const msgs = document.getElementById('chatMessages');
  const banner = document.createElement('div');
  banner.style.cssText = 'text-align:center;padding:10px 16px;background:var(--accent-soft);border-radius:var(--radius-sm);font-size:13px;color:var(--accent);font-weight:700;margin:8px 0;';
  banner.textContent = `🎯 Desafio: "${scenario}"`;
  msgs.appendChild(banner);
  document.getElementById('challengeSearch').value = '';

  const localOpening = getLocalChallengeOpening(scenario);
  renderBotMsg(localOpening, ch);
  makeWordsHoverable(msgs);
  charHistories[currentChar].push({ role:'bot', text: localOpening });
  localStorage.setItem('dh-char-histories', JSON.stringify(charHistories));
}

function quickChallenge(scenario) { startChallenge(scenario); }

// ===================================================
// CHATBOT CORE
// ===================================================
async function sendChat() {
  const input = document.getElementById('chatInput');
  const btn = document.getElementById('chatSendBtn');
  const msg = input.value.trim();
  if (!msg) return;
  input.value = ''; btn.disabled = true;
  appendMsg('user', msg);
  exchangeCount++;
  if (exchangeCount === 10) awardXP('Conversa longa — 10+ trocas! 💬', 150);
  await sendAIMessage(msg, false, null);
  btn.disabled = false;
  document.getElementById('chatInput').focus();
}

async function sendAIMessage(userMsg, isChallenge, challengeLabel) {
  const ch = CHARACTERS[currentChar];
  const loadEl = appendLoading();
  const history = (charHistories[currentChar] || []).map(e => ({ role: e.role==='user'?'user':'assistant', content: e.text }));
  const messages = [...history, { role:'user', content: userMsg }];
  try {
    const raw = await callAI(messages, ch.systemPrompt);
    if (!isChallenge) {
      charHistories[currentChar].push({ role:'user', text: userMsg });
    }
    charHistories[currentChar].push({ role:'bot', text: raw });
    if (charHistories[currentChar].length > 40) charHistories[currentChar] = charHistories[currentChar].slice(-40);
    localStorage.setItem('dh-char-histories', JSON.stringify(charHistories));
    loadEl.remove();
    renderBotMsg(raw, ch);
    parseXPFromResponse(raw);
    if (isChallenge && challengeLabel) {
      setTimeout(() => awardXP(`Desafio concluído: "${challengeLabel}" 🎯`, 100), 20000);
    }
  } catch(e) {
    loadEl.remove();
    appendMsg('bot', '⚠️ Verbindungsfehler. Versuche es erneut.');
  }
}

function appendMsg(role, text) {
  const msgs = document.getElementById('chatMessages');
  const div = document.createElement('div');
  div.className = 'chat-msg ' + role;
  if (role === 'bot') {
    const ch = CHARACTERS[currentChar];
    div.innerHTML = `<div class="chat-name">${ch.chatName}</div>`;
  }
  const bubble = document.createElement('div');
  bubble.className = 'chat-bubble'; bubble.textContent = text;
  div.appendChild(bubble);
  msgs.appendChild(div);
  makeWordsHoverable(div);
  msgs.scrollTop = msgs.scrollHeight;
  return div;
}

function appendLoading() {
  const msgs = document.getElementById('chatMessages');
  const ch = CHARACTERS[currentChar];
  const div = document.createElement('div');
  div.className = 'chat-msg bot';
  div.innerHTML = `<div class="chat-name">${ch.chatName}</div><div class="chat-loading"><div class="chat-dot"></div><div class="chat-dot"></div><div class="chat-dot"></div></div>`;
  msgs.appendChild(div);
  msgs.scrollTop = msgs.scrollHeight;
  return div;
}

function renderBotMsg(raw, ch) {
  const msgs = document.getElementById('chatMessages');
  let main = raw, corr = '';
  if (raw.includes('---KORREKTUR---')) {
    const parts = raw.split('---KORREKTUR---');
    main = parts[0].trim();
    corr = parts[1]?.split('---')[0]?.trim() || '';
  }
  const msgId = 'msg-' + Date.now();
  const div = document.createElement('div');
  div.className = 'chat-msg bot';
  let html = `<div class="chat-name">${ch.chatName}</div>`;
  html += `<div class="chat-bubble">${escHtml(main)}</div>`;
  if (corr) {
    html += `<div class="chat-correction">
      <div class="correction-label">📝 ${ch.name} corrige você</div>
      <div class="correction-text">${escHtml(corr)}</div>
      <button onclick="markCorrectionRead(this)" style="margin-top:8px;padding:4px 12px;border-radius:999px;border:1px solid var(--accent);background:transparent;color:var(--accent);font-size:12px;cursor:pointer;font-family:inherit;">✓ Li a correção (+XP)</button>
    </div>`;
  }
  const encodedMain = encodeURIComponent(main);
  const vid = ch.voiceId;
  html += `<div style="margin-top:6px;"><button class="fc-audio-btn" onclick="playMsgAudio(this,'${encodedMain}','${vid}')">🔊 Ouvir (0.8x)</button></div>`;
  div.innerHTML = html;
  msgs.appendChild(div);
  makeWordsHoverable(div);
  msgs.scrollTop = msgs.scrollHeight;
}

function markCorrectionRead(btn) {
  if (currentChar === 'hans') awardXP('Explicação gramatical lida com Hans 📖', 20);
  else awardXP('Correção lida', 10);
  btn.textContent = '✓ XP ganho!';
  btn.disabled = true; btn.style.opacity = '0.5';
}

function playMsgAudio(btn, encodedText, voiceId) {
  const text = decodeURIComponent(encodedText);
  btn.textContent = '⏸ Pausar'; btn.classList.add('playing');
  const done = () => { btn.textContent = '🔊 Ouvir (0.8x)'; btn.classList.remove('playing'); };
  if (isPremiumVoice) {
    speakElevenLabs(text, voiceId).then(done);
  } else {
    const u = new SpeechSynthesisUtterance(text);
    u.lang = 'de-DE'; u.rate = 0.8;
    u.onend = done; u.onerror = done;
    window.speechSynthesis.cancel();
    window.speechSynthesis.speak(u);
  }
}

function escHtml(s) {
  return String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/\n/g,'<br>');
}

// ===================================================
// ELEVENLABS TTS
// ===================================================
function stopAudio() {
  if (currentAudio) { currentAudio.pause(); currentAudio = null; }
  window.speechSynthesis.cancel();
  setAudioStatus('idle');
}

function setAudioStatus(state) {
  const el = document.getElementById('audioStatus');
  const icon = document.getElementById('audioStatusIcon');
  const text = document.getElementById('audioStatusText');
  if (!el) return;
  if (state === 'loading') { el.classList.remove('playing'); icon.textContent = '⏳'; text.textContent = 'Carregando...'; }
  else if (state === 'playing') { el.classList.add('playing'); icon.innerHTML = '<span class="audio-dot"></span>'; text.textContent = 'Tocando — pausar'; }
  else { el.classList.remove('playing'); icon.textContent = '🔈'; text.textContent = 'Voz pronta'; }
}

async function speakElevenLabs(text, voiceId) {
  const cleanText = text.replace(/---KORREKTUR---[\s\S]*?---/g,'').replace(/XP:\s*\d+/g,'').trim();
  if (!cleanText) return;
  if (!isPremiumVoice) {
    const u = new SpeechSynthesisUtterance(cleanText);
    u.lang = 'de-DE'; u.rate = 0.8;
    window.speechSynthesis.cancel();
    window.speechSynthesis.speak(u);
    return;
  }
  stopAudio(); setAudioStatus('loading');
  try {
    const res = await fetch('/api/elevenlabs', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ voiceId, text: cleanText, voice_settings: { stability: 0.5, similarity_boost: 0.75 } })
    });
    if (!res.ok) { setAudioStatus('idle'); return; }
    const blob = await res.blob();
    const url = URL.createObjectURL(blob);
    currentAudio = new Audio(url);
    currentAudio.onplay = () => setAudioStatus('playing');
    currentAudio.onended = () => { setAudioStatus('idle'); URL.revokeObjectURL(url); };
    currentAudio.onerror = () => setAudioStatus('idle');
    currentAudio.play();
  } catch(e) { setAudioStatus('idle'); }
}

// ===================================================
// CALL MODE
// ===================================================
function toggleCall() { callActive ? hangUp() : startCall(); }

function startCall() {
  callActive = true;
  const ch = CHARACTERS[currentChar];
  const av = CHAR_AVATARS[currentChar];
  document.getElementById('callAvatar').src = av;
  document.getElementById('callName').textContent = ch.name;
  document.getElementById('callStatus').textContent = 'Chamando...';
  document.getElementById('callModal').classList.add('open');
  document.getElementById('callBtn').classList.add('active');
  document.getElementById('callBtn').textContent = '📵';
  setTimeout(() => {
    document.getElementById('callStatus').textContent = 'Em chamada';
    document.getElementById('callTranscript').textContent = ch.callGreeting;
    if (isPremiumVoice) {
      speakElevenLabs(ch.callGreeting, ch.voiceId);
    } else {
      const u = new SpeechSynthesisUtterance(ch.callGreeting);
      u.lang = 'de-DE'; u.rate = 0.8;
      window.speechSynthesis.speak(u);
    }
    startSpeechRecognition();
  }, 1000);
}

function hangUp() {
  callActive = false;
  document.getElementById('callModal').classList.remove('open');
  document.getElementById('callBtn').classList.remove('active');
  document.getElementById('callBtn').textContent = '📞';
  if (callRecognition) { callRecognition.stop(); callRecognition = null; }
  stopAudio();
}

function startSpeechRecognition() {
  if (!('webkitSpeechRecognition' in window || 'SpeechRecognition' in window)) {
    document.getElementById('callTranscript').textContent = 'Reconhecimento de voz não suportado neste navegador. Use Chrome.';
    return;
  }
  const SR = window.SpeechRecognition || window.webkitSpeechRecognition;
  callRecognition = new SR();
  callRecognition.lang = 'de-DE';
  callRecognition.continuous = false;
  callRecognition.interimResults = false;
  callRecognition.onresult = async (event) => {
    const final = event.results[0][0].transcript;
    if (!final) return;
    document.getElementById('callTranscript').textContent = `Você: ${final}`;
    const ch = CHARACTERS[currentChar];
    const history = (charHistories[currentChar]||[]).map(e => ({ role: e.role==='user'?'user':'assistant', content: e.text }));
    try {
      const raw = await callAI([...history, { role:'user', content: final }], ch.systemPrompt);
      const spoken = raw.split('---')[0].trim();
      document.getElementById('callTranscript').textContent = spoken.slice(0,150) + (spoken.length>150?'...':'');
      charHistories[currentChar].push({ role:'user', text:final });
      charHistories[currentChar].push({ role:'bot', text:raw });
      localStorage.setItem('dh-char-histories', JSON.stringify(charHistories));
      if (isPremiumVoice) {
        await speakElevenLabs(spoken, ch.voiceId);
      } else {
        const u = new SpeechSynthesisUtterance(spoken);
        u.lang = 'de-DE'; u.rate = 0.8;
        await new Promise(r => { u.onend = r; u.onerror = r; window.speechSynthesis.speak(u); });
      }
      if (callActive) startSpeechRecognition();
    } catch(e) { if (callActive) startSpeechRecognition(); }
  };
  callRecognition.onerror = () => { if (callActive) setTimeout(startSpeechRecognition, 1500); };
  try { callRecognition.start(); } catch(e) {}
}



// ===================================================
// NOTES
// ===================================================
function showNote(k) {
  document.querySelectorAll('.notes-tab').forEach(t => t.classList.remove('active'));
  document.querySelectorAll('.notes-pane').forEach(p => p.classList.remove('active'));
  document.getElementById('note-' + k).classList.add('active');
  event.target.classList.add('active');
}

function loadNotes() {
  ['erros','frases','vocab','livre'].forEach(k => {
    const el = document.getElementById('ta-' + k);
    if (el) { el.value = Store.getNote(k); el.oninput = () => Store.setNote(k, el.value); }
  });
}

// ===================================================
// BACKUP
// ===================================================
function exportBackup() {
  const data = { xp: Store.getXP(), streak: Store.get('streak'), srs: Store.getSRS(), notes: {}, date: new Date().toISOString() };
  ['erros','frases','vocab','livre'].forEach(k => data.notes[k] = Store.getNote(k));
  const blob = new Blob([JSON.stringify(data,null,2)], {type:'text/plain'});
  const a = document.createElement('a');
  a.href = URL.createObjectURL(blob);
  a.download = 'deutsch-hub-backup-' + new Date().toISOString().slice(0,10) + '.txt';
  a.click();
}

function importBackup(input) {
  const f = input.files[0]; if (!f) return;
  const r = new FileReader();
  r.onload = e => {
    try {
      const d = JSON.parse(e.target.result);
      if (d.xp) Store.set('xp', d.xp);
      if (d.streak) Store.set('streak', d.streak);
      if (d.srs) Store.set('srs', d.srs);
      if (d.notes) Object.entries(d.notes).forEach(([k,v]) => Store.setNote(k,v));
      location.reload();
    } catch { alert('Arquivo inválido'); }
  };
  r.readAsText(f);
}

// ===================================================
// INIT
// ===================================================
document.addEventListener('DOMContentLoaded', () => {
  window.scrollTo(0, 0);
  if (history.scrollRestoration) history.scrollRestoration = 'manual';
  initAuth();
  initKeys();
  updateXPUI();
});


// =====================================================
// CREDENTIALS & AUTH
// =====================================================
const CREDS = {
  supabaseUrl:  'https://htefiqaxilufnewmycut.supabase.co',
  supabaseKey:  'sb_publishable__1bxoDUtOWsghhgfOpSz2A_qlwCtTo0',
  pexelsKey:    '',
  ltEndpoint:   '/api/languagetool',
};

let _userId = null;
async function initAuth() {
  try {
    const client = supabase.createClient(CREDS.supabaseUrl, CREDS.supabaseKey);
    const { data: { session } } = await client.auth.getSession();
    if (!session?.user) {
      const { data } = await client.auth.signInAnonymously();
      if (data?.user) _userId = data.user.id;
      else _userId = 'guest-' + crypto.randomUUID();
    } else {
      _userId = session.user.id;
    }
    console.log('[Auth] UserID:', _userId);
  } catch(e) {
    _userId = 'guest-' + crypto.randomUUID();
  }
}

function getUserId() { return _userId || 'rebeca'; }

// =====================================================
// LEVEL SYSTEM CONFIG
// =====================================================
const LEVELS = ['A1','A2','B1','B2'];
const LEVEL_XP = { A1:500, A2:800, B1:1200, B2:2000 };
const LEVEL_COLOR = { A1:'#22c55e', A2:'#3b82f6', B1:'#a855f7', B2:'#f59e0b' };

let currentLevel = 'A1';
let currentLevelXP = 0;

// =====================================================
// SUPABASE HELPERS
// =====================================================
// Nova função para o schema study_modules_hub.sql
async function loadModuleContent(moduleSlug) {
  try {
    const data = await sbFetch(`study_modules?slug=eq.${encodeURIComponent(moduleSlug)}`);
    if (!data || data.length === 0) {
      console.warn('Nenhum módulo encontrado para:', moduleSlug);
      return null;
    }
    const module = data[0];
    const titleElement = document.getElementById('module-title');
    if (titleElement) {
      titleElement.innerText = module.title_pt;
    }
    // Fetch lessons for this module
    const lessons = await sbFetch(`study_lessons?module_slug=eq.${encodeURIComponent(moduleSlug)}&active=eq.true&order=sort_order.asc`);
    module.lessons = lessons || [];
    // Fetch exercises for lessons
    for (const lesson of module.lessons) {
      lesson.exercises = await sbFetch(`study_exercises?lesson_slug=eq.${encodeURIComponent(lesson.slug)}&active=eq.true&order=sort_order.asc`) || [];
    }
    // Render the module content
    renderStudyModuleContent(module);
    return module;
  } catch (e) {
    console.error('Erro ao buscar dados:', e);
    return null;
  }
}

function renderStudyModuleContent(module) {
  const container = document.getElementById('studyLibraryGrid');
  if (!container) return;
  const lessons = module.lessons || [];
  container.innerHTML = `
    <div style="margin-bottom:16px;">
      <button class="fc-audio-btn" onclick="renderStudyLibrary()" style="margin-bottom:12px;">← Voltar</button>
      <h3 style="font-family:'Inter Tight',sans-serif;font-weight:800;font-size:21px;margin:8px 0;">${escHtml(module.title_pt)}</h3>
      <div style="font-size:12px;color:var(--muted);">${module.level} · Cap. ${module.chapter_number}</div>
    </div>
    ${lessons.map(lesson => `
      <section style="border:1px solid var(--border);border-radius:12px;background:var(--surface);padding:18px;margin-bottom:12px;">
        <h4 style="font-family:'Inter Tight',sans-serif;font-weight:700;font-size:17px;margin:0 0 8px 0;">${escHtml(lesson.title_pt)}</h4>
        <p style="font-size:13px;color:var(--muted);margin:0 0 10px 0;">${escHtml(lesson.summary_pt || '')}</p>
        ${lesson.quick_rule_pt ? `<div style="background:var(--bg);padding:10px;border-radius:8px;font-size:13px;margin-bottom:10px;"><strong>Regra:</strong> ${escHtml(lesson.quick_rule_pt)}</div>` : ''}
        ${lesson.examples ? `<div style="font-size:13px;margin-top:8px;"><strong>Exemplos:</strong><ul style="margin:6px 0;padding-left:18px;">${JSON.parse(lesson.examples).slice(0,3).map(ex => `<li><span class="de-word">${escHtml(ex.de)}</span> — ${escHtml(ex.pt)}</li>`).join('')}</ul></div>` : ''}
        ${lesson.exercises && lesson.exercises.length ? `<div style="margin-top:12px;"><strong style="font-size:13px;">Exercícios:</strong>${lesson.exercises.map((ex,i) => `<div style="background:var(--bg);padding:8px 12px;border-radius:8px;margin-top:6px;font-size:13px;"><span style="color:var(--accent);">${i+1}.</span> ${escHtml(ex.prompt_pt)} <span style="color:var(--muted);">(${ex.exercise_type})</span></div>`).join('')}</div>` : ''}
      </section>
    `).join('')}
  `;
}
window.loadModuleContent = loadModuleContent;

async function sbFetch(path, opts = {}) {
  const res = await fetch(`${CREDS.supabaseUrl}/rest/v1/${path}`, {
    headers: {
      apikey: CREDS.supabaseKey,
      'Content-Type': 'application/json',
      'Prefer': 'return=representation',
      ...opts.headers
    },
    ...opts
  });

  if (!res.ok) {
    const e = await res.text();
    throw new Error(e);
  }

  try {
    return await res.json();
  } catch {
    return null;
  }
}

async function sbGetProgress() {
  try {
    const rows = await sbFetch(`user_progress?user_id=eq.${getUserId()}&order=created_at.asc`);
    return rows || [];
  } catch(e) { return []; }
}

async function sbUpsertXP(level, addXP) {
  try {
      const rows = await sbFetch(`user_progress?user_id=eq.${getUserId()}&level=eq.${level}`);
    if (rows && rows.length > 0) {
      const row = rows[0];
      const newXP = (row.xp || 0) + addXP;
      const needed = LEVEL_XP[level] || 500;
      const complete = newXP >= needed;
      await sbFetch(`user_progress?id=eq.${row.id}`, {
        method: 'PATCH',
        body: JSON.stringify({ xp: newXP, level_complete: complete, updated_at: new Date().toISOString() })
      });
      return { xp: newXP, complete };
    } else {
      await sbFetch('user_progress', {
        method: 'POST',
        body: JSON.stringify({ user_id: getUserId(), level, xp: addXP, xp_to_next: LEVEL_XP[level]||500 })
      });
      return { xp: addXP, complete: false };
    }
  } catch(e) { console.warn('sbUpsertXP error:', e); return null; }
}

async function sbLogXP(amount, reason, character) {
  try {
    await sbFetch('xp_log', {
      method: 'POST',
      body: JSON.stringify({ user_id: getUserId(), amount, reason, character, level: currentLevel })
    });
  } catch(e) {}
}

async function sbLogGrammarError(originalText, errorMsg, errorType, suggestion, context, character) {
  try {
    await sbFetch('grammar_errors', {
      method: 'POST',
      body: JSON.stringify({ user_id: getUserId(), original_text: originalText, error_message: errorMsg, error_type: errorType, suggestion, context, character, level: currentLevel })
    });
  } catch(e) {}
}

async function sbGetGrammarErrors() {
  try {
    const rows = await sbFetch(`grammar_errors?user_id=eq.${getUserId()}&order=created_at.desc&limit=50`);
    return rows || [];
  } catch(e) { return []; }
}

async function sbLogShadowing(phrase, accuracy) {
  try {
    await sbFetch('shadowing_sessions', {
      method: 'POST',
      body: JSON.stringify({ user_id: getUserId(), phrase, accuracy, level: currentLevel })
    });
  } catch(e) {}
}

async function sbLogBossFight(level, score, passed, details) {
  try {
    await sbFetch('boss_fights', {
      method: 'POST',
      body: JSON.stringify({ user_id: getUserId(), level, score, passed, details })
    });
    if (passed) {
    const rows = await sbFetch(`user_progress?user_id=eq.${getUserId()}&level=eq.${level}`);
      if (rows && rows.length > 0) {
        await sbFetch(`user_progress?id=eq.${rows[0].id}`, {
          method: 'PATCH',
          body: JSON.stringify({ boss_defeated: true, level_complete: true })
        });
      }
    }
  } catch(e) {}
}

// =====================================================
// LANGUAGETOOL
// =====================================================
async function checkGrammar(text, character) {
  try {
    const body = new URLSearchParams({ text, language: 'de-DE' });
    const res = await fetch(CREDS.ltEndpoint, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ text, language: 'de-DE' })
    });
    const data = await res.json();
    const matches = data.matches || [];
    // Log each error to Supabase
    for (const m of matches) {
      const suggestion = m.replacements?.[0]?.value || '';
      const context = m.context?.text || '';
      await sbLogGrammarError(text, m.message, m.rule?.issueType || 'grammar', suggestion, context, character);
    }
    return matches;
  } catch(e) { return []; }
}

// =====================================================
// PEXELS VISUAL DICTIONARY
// =====================================================
let pexelsTooltip = null;
let pexelsTimer = null;

function initVisualDictionary() {
  // Create tooltip element
  if (!document.getElementById('pexelsTooltip')) {
    const tip = document.createElement('div');
    tip.id = 'pexelsTooltip';
    tip.style.cssText = `
      position:fixed; z-index:9999; display:none;
      background:var(--bg); border:1px solid var(--accent);
      border-radius:12px; padding:8px; box-shadow:0 8px 32px rgba(0,0,0,0.4);
      pointer-events:none; transition:opacity 0.2s;
    `;
    tip.innerHTML = `
      <div id="pexelsImg" style="width:160px;height:100px;border-radius:8px;background:var(--surface);display:flex;align-items:center;justify-content:center;overflow:hidden;">
        <span style="color:var(--muted);font-size:12px;">Carregando...</span>
      </div>
      <div id="pexelsWord" style="font-size:11px;font-weight:700;color:var(--accent);margin-top:6px;text-align:center;"></div>
    `;
    document.body.appendChild(tip);
    pexelsTooltip = tip;
  }
}

async function showPexelsTooltip(word, x, y) {
  if (!pexelsTooltip) initVisualDictionary();
  pexelsTooltip.style.display = 'block';
  pexelsTooltip.style.left = (x + 16) + 'px';
  pexelsTooltip.style.top = (y - 60) + 'px';
  document.getElementById('pexelsWord').textContent = word;
  document.getElementById('pexelsImg').innerHTML = '<span style="color:var(--muted);font-size:12px;">🔍 Buscando...</span>';
  try {
    const res = await fetch(`/api/pexels?query=${encodeURIComponent(word)}&per_page=1&orientation=landscape`);
    const data = await res.json();
    const photo = data.photos?.[0];
    if (photo) {
      document.getElementById('pexelsImg').innerHTML = `<img src="${photo.src.small}" style="width:160px;height:100px;object-fit:cover;border-radius:8px;" alt="${word}">`;
    } else {
      document.getElementById('pexelsImg').innerHTML = `<span style="color:var(--muted);font-size:12px;">Sem imagem</span>`;
    }
  } catch(e) {
    document.getElementById('pexelsImg').innerHTML = `<span style="color:var(--muted);font-size:12px;">Erro</span>`;
  }
}

function hidePexelsTooltip() {
  if (pexelsTooltip) pexelsTooltip.style.display = 'none';
}

// Make German words in chat hoverable
function makeWordsHoverable(container) {
  container.querySelectorAll('.chat-bubble').forEach(bubble => {
    if (bubble.dataset.hovered) return;
    bubble.dataset.hovered = '1';
    const text = bubble.textContent;
    // Find German-looking words (capitalized nouns, common verbs)
    const words = text.split(/\s+/);
    if (words.length < 3) return;
    bubble.innerHTML = words.map(w => {
      const clean = w.replace(/[.,!?;:]/g, '');
      if (clean.length < 3) return w;
      return `<span class="de-word" style="cursor:pointer;border-bottom:1px dotted var(--accent);" data-word="${clean}">${w}</span>`;
    }).join(' ');
    bubble.querySelectorAll('.de-word').forEach(span => {
      span.addEventListener('mouseenter', e => {
        clearTimeout(pexelsTimer);
        pexelsTimer = setTimeout(() => showPexelsTooltip(span.dataset.word, e.clientX, e.clientY), 600);
      });
      span.addEventListener('mouseleave', () => { clearTimeout(pexelsTimer); hidePexelsTooltip(); });
    });
  });
}

// =====================================================
// PROGRESS BAR & LEVEL SYSTEM
// =====================================================
async function initLevelSystem() {
  const progress = await sbGetProgress();
  // Find current active level
  let activeLevel = 'A1';
  for (const lv of LEVELS) {
    const row = progress.find(r => r.level === lv);
    if (row && row.level_complete && row.boss_defeated) activeLevel = LEVELS[Math.min(LEVELS.indexOf(lv)+1, LEVELS.length-1)];
    else if (row && !row.level_complete) { activeLevel = lv; break; }
    else if (!row) { activeLevel = lv; break; }
  }
  currentLevel = activeLevel;
  updateLevelUI(progress);
}

function updateLevelUI(progress) {
  const bar = document.getElementById('levelProgressBar');
  const label = document.getElementById('levelLabel');
  const xpEl = document.getElementById('levelXP');
  if (!bar) return;

  const row = (progress || []).find(r => r.level === currentLevel) || { xp: 0 };
  const needed = LEVEL_XP[currentLevel] || 500;
  const pct = Math.min((row.xp / needed) * 100, 100);
  const color = LEVEL_COLOR[currentLevel] || 'var(--accent)';

  bar.style.width = pct + '%';
  bar.style.background = `linear-gradient(90deg, ${color}, ${color}88)`;
  if (label) label.textContent = currentLevel;
  if (xpEl) xpEl.textContent = `${row.xp} / ${needed} XP`;

  // Check boss fight trigger
  if (pct >= 100) triggerBossFight();
}

async function pushXPToSupabase(amount, reason) {
  const result = await sbUpsertXP(currentLevel, amount);
  await sbLogXP(amount, reason, currentChar || 'system');
  if (result) {
    const progress = await sbGetProgress();
    updateLevelUI(progress);
    if (result.complete) triggerBossFight();
  }
}

// =====================================================
// BOSS FIGHT SYSTEM
// =====================================================
const BOSS_PHRASES = {
  A1: [
    { de: 'Ich heiße Rebeca und ich komme aus Brasilien.', pt: 'Meu nome é Rebeca e eu venho do Brasil.' },
    { de: 'Guten Morgen! Wie geht es Ihnen?', pt: 'Bom dia! Como o senhor está?' },
    { de: 'Ich möchte einen Kaffee, bitte.', pt: 'Eu gostaria de um café, por favor.' },
    { de: 'Wo ist der Bahnhof?', pt: 'Onde fica a estação de trem?' },
    { de: 'Das kostet zehn Euro.', pt: 'Isso custa dez euros.' }
  ],
  A2: [
    { de: 'Ich habe gestern im Restaurant gegessen.', pt: 'Eu comi no restaurante ontem.' },
    { de: 'Können Sie mir helfen? Ich suche das Hotel.', pt: 'Pode me ajudar? Estou procurando o hotel.' },
    { de: 'Ich arbeite seit drei Jahren bei dieser Firma.', pt: 'Trabalho nesta empresa há três anos.' },
    { de: 'Wann fährt der nächste Zug nach Berlin?', pt: 'Quando parte o próximo trem para Berlim?' },
    { de: 'Ich würde gern einen Termin vereinbaren.', pt: 'Eu gostaria de marcar um compromisso.' }
  ],
  B1: [
    { de: 'Obwohl es regnet, gehe ich spazieren.', pt: 'Embora esteja chovendo, vou caminhar.' },
    { de: 'Es tut mir leid, dass ich so spät antworte.', pt: 'Sinto muito por responder tão tarde.' },
    { de: 'Ich denke, dass die Grammatik sehr wichtig ist.', pt: 'Acho que a gramática é muito importante.' }
  ],
  B2: [
    { de: 'Meiner Meinung nach sollte man mehr Bücher lesen.', pt: 'Na minha opinião, devemos ler mais livros.' },
    { de: 'Es wäre schön, wenn wir uns bald treffen könnten.', pt: 'Seria ótimo se pudéssemos nos encontrar em breve.' }
  ]
};

let bossState = { active: false, round: 0, score: 0, phrases: [], total: 5 };

window.triggerBossFight = function() {
  const modal = document.getElementById('bossFightModal');
  if (!modal || bossState.active) return;
  bossState = { active: true, round: 0, score: 0, phrases: (BOSS_PHRASES[currentLevel]||BOSS_PHRASES.A1).slice(0,5), total: 5 };
  document.getElementById('bossLevel').textContent = currentLevel;
  document.getElementById('bossRoundInfo').textContent = `Rodada 1 de ${bossState.total}`;
  modal.classList.add('open');
  startBossRound();
}

async function startBossRound() {
  const round = bossState.round;
  if (round >= bossState.total) { endBossFight(); return; }
  const phrase = bossState.phrases[round];
  document.getElementById('bossRoundInfo').textContent = `Rodada ${round+1} de ${bossState.total}`;
  document.getElementById('bossTranslation').textContent = phrase.pt;
  document.getElementById('bossInput').value = '';
  document.getElementById('bossFeedback').innerHTML = '';
  document.getElementById('bossInput').disabled = false;
  document.getElementById('bossSubmit').disabled = false;

  // Play audio of phrase
  const ch = CHARACTERS[currentChar || 'hans'];
  if (isPremiumVoice) {
    await speakElevenLabs(phrase.de, ch.voiceId);
  } else {
    const u = new SpeechSynthesisUtterance(phrase.de);
    u.lang = 'de-DE'; u.rate = 0.8;
    window.speechSynthesis.speak(u);
  }
}

async function submitBossAnswer() {
  const input = document.getElementById('bossInput').value.trim();
  if (!input) return;
  document.getElementById('bossInput').disabled = true;
  document.getElementById('bossSubmit').disabled = true;

  const phrase = bossState.phrases[bossState.round];
  const feedback = document.getElementById('bossFeedback');
  feedback.innerHTML = '<span style="color:var(--muted)">⏳ Verificando com LanguageTool...</span>';

  // Grammar check
  const errors = await checkGrammar(input, currentChar);

  // Compare with expected (fuzzy)
  const similarity = strSimilarity(input.toLowerCase().trim(), phrase.de.toLowerCase().trim());
  const ltOk = errors.length === 0;
  const roundScore = Math.round(similarity * 50) + (ltOk ? 50 : 0);
  bossState.score += roundScore;

  let feedbackHTML = '';
  if (similarity > 0.85 && ltOk) {
    feedbackHTML = `<div style="color:var(--green);font-weight:700">✅ Perfeito! +${roundScore} pontos</div>`;
  } else {
    feedbackHTML = `<div style="margin-bottom:8px;"><span style="color:var(--gold)">📊 Similaridade: ${Math.round(similarity*100)}%</span></div>`;
    feedbackHTML += `<div style="color:var(--muted);font-size:13px;">✅ Resposta: <strong style="color:var(--ink)">${phrase.de}</strong></div>`;
    if (errors.length > 0) {
      feedbackHTML += `<div style="color:var(--red);font-size:12px;margin-top:6px;">❌ ${errors.length} erro(s) gramatical(is) — salvo no Supabase para revisão</div>`;
    }
  }
  feedback.innerHTML = feedbackHTML;

  await new Promise(r => setTimeout(r, 2500));
  bossState.round++;
  startBossRound();
}

async function endBossFight() {
  const total = bossState.total * 100;
  const pct = Math.round((bossState.score / total) * 100);
  const passed = pct >= 70;

  document.getElementById('bossRoundInfo').textContent = 'Resultado Final';
  document.getElementById('bossTranslation').textContent = '';
  document.getElementById('bossInput').style.display = 'none';
  document.getElementById('bossSubmit').style.display = 'none';
  document.getElementById('bossFeedback').innerHTML = `
    <div style="text-align:center;padding:20px;">
      <div style="font-size:48px;margin-bottom:12px;">${passed ? '🏆' : '😤'}</div>
      <div style="font-family:'Inter Tight',sans-serif;font-weight:800;font-size:24px;margin-bottom:8px;color:${passed?'var(--green)':'var(--red)'}">
        ${passed ? 'LEVEL UP!' : 'Tente novamente'}
      </div>
      <div style="font-size:16px;color:var(--muted);margin-bottom:16px;">Pontuação: <strong style="color:var(--ink)">${pct}%</strong></div>
      ${passed ? `<div style="color:var(--green);font-size:14px;">Você dominou o nível ${currentLevel}! Próximo: ${LEVELS[Math.min(LEVELS.indexOf(currentLevel)+1,3)]}</div>` : '<div style="color:var(--muted);font-size:14px;">Você precisa de 70% para avançar. Continue praticando!</div>'}
      <button onclick="closeBossFight(${passed})" style="margin-top:20px;padding:12px 28px;border-radius:999px;background:var(--accent);color:#fff;border:none;font-size:15px;font-weight:700;cursor:pointer;">
        ${passed ? '🚀 Avançar para o próximo nível' : '💪 Voltar e praticar mais'}
      </button>
    </div>
  `;

  await sbLogBossFight(currentLevel, bossState.score, passed, { pct, rounds: bossState.total });
  if (passed) {
    await pushXPToSupabase(200, `Boss Fight vencido: nível ${currentLevel} 🏆`);
  }
  bossState.active = false;
}

function closeBossFight(levelUp) {
  document.getElementById('bossFightModal').classList.remove('open');
  document.getElementById('bossInput').style.display = '';
  document.getElementById('bossSubmit').style.display = '';
  if (levelUp) {
    const idx = LEVELS.indexOf(currentLevel);
    if (idx < LEVELS.length - 1) {
      currentLevel = LEVELS[idx + 1];
      showNotification(`🎉 Parabéns! Você avançou para o nível ${currentLevel}!`, 'success');
      initLevelSystem();
    }
  }
}

function strSimilarity(a, b) {
  if (a === b) return 1;
  if (!a || !b) return 0;
  const longer = a.length > b.length ? a : b;
  const shorter = a.length > b.length ? b : a;
  const longerLen = longer.length;
  if (longerLen === 0) return 1;
  const editDist = levenshtein(longer, shorter);
  return (longerLen - editDist) / longerLen;
}

function levenshtein(s, t) {
  const d = [];
  for (let i = 0; i <= s.length; i++) { d[i] = [i]; }
  for (let j = 0; j <= t.length; j++) { d[0][j] = j; }
  for (let i = 1; i <= s.length; i++) {
    for (let j = 1; j <= t.length; j++) {
      d[i][j] = s[i-1] === t[j-1] ? d[i-1][j-1] : Math.min(d[i-1][j]+1, d[i][j-1]+1, d[i-1][j-1]+1);
    }
  }
  return d[s.length][t.length];
}

// =====================================================
// SHADOWING MODE
// =====================================================
const SHADOWING_PHRASES = {
  A1: ['Guten Morgen!','Wie heißt du?','Ich bin Rebeca.','Danke schön!','Bitte sehr!','Wo ist die Toilette?','Ein Kaffee, bitte.'],
  A2: ['Ich habe gestern gearbeitet.','Können Sie mir helfen?','Das macht nichts.','Ich freue mich sehr.','Wann fährt der Zug?'],
  B1: ['Obwohl es spät ist, lerne ich noch.','Ich denke, dass das wichtig ist.','Es tut mir leid für die Verspätung.'],
  B2: ['Meiner Meinung nach sollte man täglich üben.','Es wäre schön, wenn wir uns treffen könnten.']
};

let shadowState = { active: false, phrase: '', recognition: null };

window.startShadowing = async function() {
  const phrases = SHADOWING_PHRASES[currentLevel] || SHADOWING_PHRASES.A1;
  const phrase = phrases[Math.floor(Math.random() * phrases.length)];
  shadowState = { active: true, phrase };

  document.getElementById('shadowPhrase').textContent = phrase;
  document.getElementById('shadowFeedback').innerHTML = '';
  document.getElementById('shadowModal').classList.add('open');

  // Play phrase at 0.8x
  const ch = CHARACTERS[currentChar || 'hans'];
  document.getElementById('shadowStatus').textContent = '🔊 Ouça e repita...';
  if (isPremiumVoice) {
    await speakElevenLabs(phrase, ch.voiceId);
  } else {
    const u = new SpeechSynthesisUtterance(phrase);
    u.lang = 'de-DE'; u.rate = 0.8;
    await new Promise(r => { u.onend = r; window.speechSynthesis.speak(u); });
  }

  // Open mic
  startShadowRecognition();
}

function startShadowRecognition() {
  if (!('webkitSpeechRecognition' in window || 'SpeechRecognition' in window)) {
    document.getElementById('shadowStatus').textContent = '❌ Reconhecimento não suportado. Use Chrome.';
    return;
  }
  const SR = window.SpeechRecognition || window.webkitSpeechRecognition;
  const rec = new SR();
  rec.lang = 'de-DE'; rec.continuous = false; rec.interimResults = false;
  shadowState.recognition = rec;

  document.getElementById('shadowStatus').textContent = '🎤 Fale agora...';

  rec.onresult = async (event) => {
    const spoken = event.results[0][0].transcript;
    const accuracy = strSimilarity(spoken.toLowerCase(), shadowState.phrase.toLowerCase()) * 100;
    const roundedAcc = Math.round(accuracy);

    await sbLogShadowing(shadowState.phrase, roundedAcc);

    let color = 'var(--red)';
    let emoji = '😤';
    if (accuracy >= 85) { color = 'var(--green)'; emoji = '🎯'; await pushXPToSupabase(15, 'Shadowing preciso 🎯'); }
    else if (accuracy >= 60) { color = 'var(--gold)'; emoji = '👍'; await pushXPToSupabase(8, 'Shadowing bom'); }

    document.getElementById('shadowStatus').textContent = 'Resultado:';
    document.getElementById('shadowFeedback').innerHTML = `
      <div style="text-align:center;padding:12px;">
        <div style="font-size:32px;margin-bottom:8px;">${emoji}</div>
        <div style="font-size:20px;font-weight:700;color:${color}">${roundedAcc}% de precisão</div>
        <div style="font-size:13px;color:var(--muted);margin-top:6px;">Você disse: "<em>${spoken}</em>"</div>
        <div style="font-size:13px;color:var(--muted);">Esperado: "<em>${shadowState.phrase}</em>"</div>
        <div style="display:flex;gap:10px;justify-content:center;margin-top:16px;">
          <button onclick="startShadowing()" style="padding:8px 20px;border-radius:999px;background:var(--accent);color:#fff;border:none;font-size:13px;cursor:pointer;">🔄 Nova frase</button>
          <button onclick="closeShadowing()" style="padding:8px 20px;border-radius:999px;border:1px solid var(--border);background:transparent;color:var(--ink);font-size:13px;cursor:pointer;">✕ Fechar</button>
        </div>
      </div>
    `;
  };
  rec.onerror = () => { document.getElementById('shadowStatus').textContent = '❌ Erro ao capturar voz. Tente novamente.'; };
  try { rec.start(); } catch(e) {}
}

function closeShadowing() {
  if (shadowState.recognition) { shadowState.recognition.stop(); shadowState.recognition = null; }
  shadowState.active = false;
  document.getElementById('shadowModal').classList.remove('open');
}

// =====================================================
// ERROR REVIEW PAGE
// =====================================================
async function loadErrorReview() {
  const tbody = document.getElementById('errorReviewBody');
  tbody.innerHTML = '<tr><td colspan="4" style="text-align:center;color:var(--muted);padding:20px;">⏳ Carregando do Supabase...</td></tr>';
  const errors = await sbGetGrammarErrors();
  if (!errors.length) {
    tbody.innerHTML = '<tr><td colspan="4" style="text-align:center;color:var(--muted);padding:20px;">🎉 Nenhum erro registrado ainda. Continue praticando!</td></tr>';
    return;
  }
  tbody.innerHTML = errors.map(e => `
    <tr>
      <td style="max-width:200px;font-size:13px;word-break:break-word;">${e.original_text}</td>
      <td style="font-size:13px;color:var(--red);">${e.error_message}</td>
      <td style="font-size:13px;color:var(--green);">${e.suggestion || '—'}</td>
      <td style="font-size:12px;color:var(--muted);">${new Date(e.created_at).toLocaleDateString('pt-BR')}</td>
    </tr>
  `).join('');
}

// =====================================================
// NOTIFICATIONS
// =====================================================
function showNotification(msg, type='info') {
  const colors = { success:'var(--green)', error:'var(--red)', info:'var(--accent)' };
  const n = document.createElement('div');
  n.style.cssText = `
    position:fixed;bottom:24px;right:24px;z-index:9999;
    padding:14px 20px;border-radius:12px;
    background:var(--bg);border:1px solid ${colors[type]};
    color:var(--ink);font-size:14px;font-weight:600;
    box-shadow:0 8px 32px rgba(0,0,0,0.3);
    animation:slideIn 0.3s ease;max-width:320px;
  `;
  n.textContent = msg;
  document.body.appendChild(n);
  setTimeout(() => n.remove(), 4000);
}

// =====================================================
// ENHANCED AWARD XP (now also pushes to Supabase)
// =====================================================
const _origAwardXP = typeof awardXP === 'function' ? awardXP : null;
function awardXPEnhanced(reason, amount) {
  // Local store
  if (typeof Store !== 'undefined') Store.addXP(amount);
  const entry = { reason: reason, amount: amount, char: currentChar, time: new Date().toLocaleTimeString('pt-BR', {hour:'2-digit',minute:'2-digit'}) };
  if (typeof xpLog !== 'undefined') { xpLog.unshift(entry); localStorage.setItem('dh-xp-log', JSON.stringify(xpLog)); }
  // Supabase push (async, non-blocking)
  pushXPToSupabase(amount, reason).catch(()=>{});
}



// ===================================================
// ENHANCED INIT (Supabase + Visual Dict)
// ===================================================
initLevelSystem();
initVisualDictionary();

// Patch awardXP to also push to Supabase
const _baseAwardXP = awardXP;
window.awardXP = function(reason, amount) {
  _baseAwardXP(reason, amount);
  pushXPToSupabase(amount, reason).catch(()=>{});
};

// Auto-run grammar check on chat send (wrap sendAIMessage)
const _baseSendAIMessage = sendAIMessage;
window.sendAIMessage = async function(userMsg, isChallenge, challengeLabel) {
  await _baseSendAIMessage(userMsg, isChallenge, challengeLabel);
  if (!isChallenge && userMsg.length > 5) {
    checkGrammar(userMsg, currentChar).catch(()=>{});
  }
  // Make new bubbles hoverable for Pexels
  setTimeout(() => makeWordsHoverable(document.getElementById('chatMessages')), 500);
};

// =====================================================
// PHASE 2 OVERLAY - persistence, preflight grammar, SRS, media
// =====================================================
var DH_V2 = {
  userId: getUserId(),
  contentLoaded: false,
  challengesLoaded: false,
  curatedChallenges: [],
  studyLoaded: false,
  studyFilter: 'all',
  studyModules: [],
  studyLessons: [],
  studyExercises: [],
  grammarCache: new Map()
};

function dhGrammarCacheKey(text, character) {
  return `${character || currentChar || 'hans'}::${text.trim()}`;
}

const dhOriginalCheckGrammar = window.checkGrammar || checkGrammar;
window.checkGrammar = async function(text, character) {
  const key = dhGrammarCacheKey(text, character);
  if (DH_V2.grammarCache.has(key)) return DH_V2.grammarCache.get(key);
  const matches = await dhOriginalCheckGrammar(text, character);
  DH_V2.grammarCache.set(key, matches);
  return matches;
};
checkGrammar = window.checkGrammar;

function dhBuildGrammarFeedback(text, matches) {
  const ordered = [...(matches || [])].sort((a, b) => (b.offset || 0) - (a.offset || 0));
  let correctedText = text;
  ordered.forEach(m => {
    const replacement = m.replacements?.[0]?.value;
    if (!replacement) return;
    const start = m.offset || 0;
    const end = start + (m.length || 0);
    correctedText = correctedText.slice(0, start) + replacement + correctedText.slice(end);
  });
  return {
    ok: !matches || matches.length === 0,
    originalText: text,
    correctedText,
    explanation: (matches || []).map(m => ({
      message: m.message,
      rule: m.rule?.id || m.rule?.issueType || 'grammar',
      suggestion: m.replacements?.[0]?.value || '',
      context: m.context?.text || ''
    }))
  };
}

function dhShowGrammarReview(feedback) {
  if (feedback.ok) return Promise.resolve('send');
  return new Promise(resolve => {
    let modal = document.getElementById('dhGrammarModal');
    if (!modal) {
      modal = document.createElement('div');
      modal.id = 'dhGrammarModal';
      modal.className = 'modal open';
      modal.innerHTML = `
        <div class="modal-card" style="max-width:620px;">
          <button class="modal-close" id="dhGrammarClose">x</button>
          <div style="font-family:'Inter Tight',sans-serif;font-weight:800;font-size:20px;margin-bottom:6px;">Revisao antes de enviar</div>
          <p style="color:var(--muted);font-size:14px;margin-bottom:14px;">A LanguageTool encontrou pontos para revisar.</p>
          <div id="dhGrammarList" style="display:grid;gap:10px;margin-bottom:14px;"></div>
          <div style="padding:12px;border:1px solid var(--border);border-radius:10px;background:var(--surface);font-size:14px;margin-bottom:16px;">
            <div style="font-weight:700;margin-bottom:6px;color:var(--green);">Sugestao corrigida</div>
            <div id="dhGrammarCorrection" style="word-break:break-word;"></div>
          </div>
          <div style="display:flex;gap:10px;justify-content:flex-end;flex-wrap:wrap;">
            <button id="dhGrammarFix" style="padding:10px 18px;border-radius:999px;border:1px solid var(--border);background:transparent;color:var(--ink);font-weight:700;cursor:pointer;">Corrigir primeiro</button>
            <button id="dhGrammarSend" style="padding:10px 18px;border-radius:999px;border:none;background:var(--accent);color:#fff;font-weight:700;cursor:pointer;">Enviar mesmo assim</button>
          </div>
        </div>
      `;
      document.body.appendChild(modal);
    }
    modal.classList.add('open');
    document.getElementById('dhGrammarCorrection').textContent = feedback.correctedText;
    document.getElementById('dhGrammarList').innerHTML = feedback.explanation.map(e => `
      <div style="padding:10px;border:1px solid var(--border);border-radius:10px;background:var(--bg);">
        <div style="font-size:13px;color:var(--red);font-weight:700;">${e.rule}</div>
        <div style="font-size:14px;margin:4px 0;">${e.message}</div>
        <div style="font-size:13px;color:var(--muted);">Correcao: <strong style="color:var(--green);">${e.suggestion || 'sem sugestao automatica'}</strong></div>
      </div>
    `).join('');
    const done = action => { modal.classList.remove('open'); resolve(action); };
    document.getElementById('dhGrammarClose').onclick = () => done('cancel');
    document.getElementById('dhGrammarFix').onclick = () => done('fix');
    document.getElementById('dhGrammarSend').onclick = () => done('send');
  });
}

async function dhProfilePatch(fields) {
  try {
    await sbFetch(`profiles?user_id=eq.${DH_V2.userId}`, {
      method: 'PATCH',
      body: JSON.stringify({ ...fields, updated_at: new Date().toISOString() })
    });
  } catch(e) {
    try {
      await sbFetch('profiles', { method: 'POST', body: JSON.stringify({ user_id: DH_V2.userId, ...fields }) });
    } catch(_) {}
  }
}

async function saveChatMessage(role, content, grammarFeedback=null, xpAwarded=0, character=currentChar) {
  try {
    await sbFetch('chat_history', {
      method: 'POST',
      body: JSON.stringify({
        user_id: DH_V2.userId,
        character: character || 'hans',
        role,
        content,
        grammar_feedback: grammarFeedback,
        xp_awarded: xpAwarded
      })
    });
  } catch(e) {}
}

async function updateXP(points, reason='Estudo concluido') {
  const amount = Number(points) || 0;
  if (!amount) return;
  try { await pushXPToSupabase(amount, reason); } catch(e) {}
  const total = Store.getXP();
  await dhProfilePatch({ total_xp: total, current_level: currentLevel, active_character: currentChar || 'hans' });
}

async function dhSyncSRS(cardId, rating) {
  const srs = Store.getSRS()[cardId];
  if (!srs) return;
  try {
    await sbFetch('srs_progress?on_conflict=user_id,card_id', {
      method: 'POST',
      headers: { Prefer: 'resolution=merge-duplicates,return=representation' },
      body: JSON.stringify({
        user_id: DH_V2.userId,
        card_id: cardId,
        rating,
        interval_days: srs.interval || 1,
        ease: srs.ease || 2.5,
        reps: 1,
        due_at: new Date(srs.next || Date.now()).toISOString(),
        last_reviewed_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
      })
    });
  } catch(e) {}
}

async function dhFetchPexelsPhoto(term) {
  const res = await fetch(`/api/pexels?query=${encodeURIComponent(term)}&per_page=1&orientation=landscape`);
  if (!res.ok) throw new Error('pexels-error');
  const data = await res.json();
  return data.photos?.[0] || null;
}

async function generatePexelsFlashcardImage(card) {
  try {
    const photo = await dhFetchPexelsPhoto(card.frente);
    if (!photo) return null;
    const payload = {
      user_id: DH_V2.userId,
      card_id: card.id,
      term: card.frente,
      image_url: photo.src?.medium || photo.src?.small,
      photographer: photo.photographer,
      pexels_url: photo.url
    };
    await sbFetch('flashcard_media?on_conflict=user_id,card_id', {
      method: 'POST',
      headers: { Prefer: 'resolution=merge-duplicates,return=representation' },
      body: JSON.stringify(payload)
    });
    return payload;
  } catch(e) { return null; }
}

async function dhEnhanceFlashcardsWithPexels() {
  const cards = Array.from(document.querySelectorAll('.flashcard'));
  cards.slice(0, 8).forEach(async el => {
    if (el.dataset.v2Media) return;
    el.dataset.v2Media = '1';
    const card = CARDS.find(c => c.id === el.dataset.id);
    if (!card) return;
    const media = await generatePexelsFlashcardImage(card);
    if (!media?.image_url || !el.isConnected) return;
    const img = document.createElement('img');
    img.src = media.image_url;
    img.alt = card.frente;
    img.loading = 'lazy';
    img.style.cssText = 'width:100%;height:88px;object-fit:cover;border-radius:8px;margin:10px 0;border:1px solid var(--border);';
    const front = el.querySelector('.fc-front');
    if (front && !front.nextElementSibling?.classList?.contains('dh-card-img')) {
      img.className = 'dh-card-img';
      front.insertAdjacentElement('afterend', img);
    }
  });
}

async function dhUpstashSet(key, value, ttlSeconds=3600) {
  try {
    await fetch('/api/upstash', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ key, value, ttlSeconds })
    });
  } catch(e) {}
}

async function handleChat() {
  const input = document.getElementById('chatInput');
  const btn = document.getElementById('chatSendBtn');
  const msg = input.value.trim();
  if (!msg) return;
  btn.disabled = true;
  try {
    const matches = await checkGrammar(msg, currentChar);
    const feedback = dhBuildGrammarFeedback(msg, matches);
    const action = await dhShowGrammarReview(feedback);
    if (action === 'cancel') return;
    if (action === 'fix') {
      input.value = feedback.correctedText;
      input.focus();
      return;
    }
    const xp = feedback.ok ? 10 : 0;
    input.value = '';
    appendMsg('user', msg);
    await saveChatMessage('user', msg, feedback, xp);
    if (xp) await updateXP(xp, 'Frase correta em alemao');
    await dhUpstashSet(`chat:${DH_V2.userId}:${currentChar}:last_user`, { text: msg, at: Date.now() }, 1800);
    exchangeCount++;
    if (exchangeCount === 10) awardXP('Conversa longa - 10+ trocas!', 150);
    await window.sendAIMessage(msg, false, null);
  } finally {
    btn.disabled = false;
    input.focus();
  }
}

const dhBaseSendAIMessageV2 = window.sendAIMessage || sendAIMessage;
window.sendAIMessage = async function(userMsg, isChallenge, challengeLabel) {
  await dhBaseSendAIMessageV2(userMsg, isChallenge, challengeLabel);
  const hist = charHistories[currentChar] || [];
  const lastBot = [...hist].reverse().find(e => e.role === 'bot');
  if (lastBot) await saveChatMessage('assistant', lastBot.text, null, 0, currentChar);
};
sendAIMessage = window.sendAIMessage;
window.handleChat = handleChat;
window.sendChat = handleChat;
sendChat = handleChat;

const dhBaseRateCardV2 = window.rateCard || rateCard;
window.rateCard = function(id, rating) {
  dhBaseRateCardV2(id, rating);
  dhSyncSRS(id, rating);
  updateXP(rating === 'easy' ? 3 : rating === 'medium' ? 2 : 1, `Flashcard ${rating}`);
};
rateCard = window.rateCard;

const dhBaseRenderFlashcardsV2 = window.renderFlashcards || renderFlashcards;
window.renderFlashcards = function(searchQ) {
  dhBaseRenderFlashcardsV2(searchQ);
  setTimeout(() => {
    dhEnhanceFlashcardsWithPexels();
    makeWordsHoverable(document.getElementById('flashcardGrid'));
  }, 200);
};
renderFlashcards = window.renderFlashcards;

function dhMapCuratedCard(row) {
  const tags = Array.isArray(row.tags) ? row.tags : [];
  const levelTheme = row.theme || 'dia-a-dia';
  return {
    id: `v2-${row.slug}`,
    nivel: row.level,
    tema: levelTheme,
    frente: row.front_de,
    verso: row.back_pt,
    leigo: row.explanation_pt,
    contexto: levelTheme,
    criado_por: 'curado',
    sourceSlug: row.slug,
    grammarNote: row.grammar_note,
    exampleDe: row.example_de,
    examplePt: row.example_pt,
    tags
  };
}

async function loadCuratedFlashcards() {
  if (DH_V2.contentLoaded) return;
  DH_V2.contentLoaded = true;
  try {
    const rows = await sbFetch('flashcards_v2?active=eq.true&curated=eq.true&order=level.asc,theme.asc,slug.asc');
    if (!Array.isArray(rows) || !rows.length) return;
    const existing = new Set(CARDS.map(c => c.id));
    rows.map(dhMapCuratedCard).forEach(card => {
      if (!existing.has(card.id)) {
        CARDS.push(card);
        existing.add(card.id);
      }
    });
    renderFlashcards();
    // showNotification(`${rows.length} flashcards curados carregados do Supabase.`, 'success');
  } catch(e) {
    console.warn('Curated flashcards unavailable:', e);
  }
}

function dhChallengeIcon(challenge) {
  const byCharacter = { heidi: '✈', lukas: '💻', hans: '🎼', petra: '📚' };
  return byCharacter[challenge.character_key] || '🎯';
}

function dhRenderCuratedChallenges() {
  const wrap = document.getElementById('challengeTags');
  if (!wrap || !DH_V2.curatedChallenges.length) return;
  const oldDynamic = wrap.querySelectorAll('[data-curated-challenge]');
  oldDynamic.forEach(el => el.remove());
  const divider = document.createElement('div');
  divider.dataset.curatedChallenge = '1';
  divider.style.cssText = 'font-size:11px;color:var(--muted);font-weight:700;margin:12px 2px 8px;text-transform:uppercase;letter-spacing:0;';
  divider.textContent = 'Curados';
  wrap.appendChild(divider);
  DH_V2.curatedChallenges.forEach(ch => {
    const tag = document.createElement('span');
    tag.className = 'challenge-tag';
    tag.dataset.curatedChallenge = '1';
    tag.title = `${ch.level} · ${ch.character_key || 'persona'} · ${ch.user_goal_pt}`;
    tag.textContent = `${dhChallengeIcon(ch)} ${ch.title_pt}`;
    tag.onclick = () => startCuratedChallenge(ch.slug);
    wrap.appendChild(tag);
  });
}

async function loadCuratedChallenges() {
  if (DH_V2.challengesLoaded) return;
  DH_V2.challengesLoaded = true;
  try {
    const rows = await sbFetch('deutsch_challenges?active=eq.true&order=level.asc,theme.asc,slug.asc');
    if (!Array.isArray(rows) || !rows.length) return;
    DH_V2.curatedChallenges = rows;
    dhRenderCuratedChallenges();
  } catch(e) {
    console.warn('Curated challenges unavailable:', e);
  }
}

function startCuratedChallenge(slug) {
  const ch = DH_V2.curatedChallenges.find(item => item.slug === slug);
  if (!ch) return;
  if (ch.character_key && CHARACTERS[ch.character_key]) {
    currentChar = ch.character_key;
    selectChar(ch.character_key);
  }
  const support = Array.isArray(ch.support_phrases)
    ? ch.support_phrases.map(p => `- ${p.de} (${p.pt})`).join('\n')
    : '';
  const criteria = Array.isArray(ch.success_criteria)
    ? ch.success_criteria.map(c => `- ${c}`).join('\n')
    : '';
  const scenario = `${ch.title_pt}: ${ch.scenario_pt}`;
  const curatedPrompt = `[DESAFIO CURADO]
Nivel: ${ch.level}
Tema: ${ch.theme}
Cenario: ${ch.scenario_pt}
Objetivo da Rebeca: ${ch.user_goal_pt}
Primeira fala obrigatoria do personagem: "${ch.opening_line_de}"
Frases de apoio para conduzir a conversa:
${support}
Criterios de sucesso:
${criteria}

Inicie o dialogo em alemao com a primeira fala obrigatoria. Seja direto, natural e conduza uma conversa curta de vida real. Corrija a Rebeca sem explicacao longa.`;
  showPage('chat');
  const msgs = document.getElementById('chatMessages');
  const banner = document.createElement('div');
  banner.style.cssText = 'text-align:center;padding:10px 16px;background:var(--accent-soft);border-radius:var(--radius-sm);font-size:13px;color:var(--accent);font-weight:700;margin:8px 0;';
  banner.textContent = `🎯 ${ch.level} · ${ch.title_pt}`;
  msgs.appendChild(banner);
  document.getElementById('challengeSearch').value = '';
  DH_V2.activeChallengePrompt = curatedPrompt;
  renderBotMsg(ch.opening_line_de, CHARACTERS[currentChar]);
  makeWordsHoverable(msgs);
  charHistories[currentChar].push({ role:'bot', text: ch.opening_line_de });
  localStorage.setItem('dh-char-histories', JSON.stringify(charHistories));
}
window.startCuratedChallenge = startCuratedChallenge;

window.loadStudyLibrary = async function() {
  console.log('loadStudyLibrary called', 'studyLoaded:', DH_V2.studyLoaded);
  if (!DH_V2.studyLoaded) {
    DH_V2.studyLoaded = true;
    try {
      const modules = await sbFetch('study_modules?order=chapter_number.asc');
      console.log('sbFetch results:', 'modules:', modules?.length);
      DH_V2.studyModules = Array.isArray(modules) ? modules : [];
    } catch(e) {
      console.error('Study library error:', e);
      DH_V2.studyLoaded = false;
    }
  }
  renderStudyLibrary();
}

function filterStudyLibrary(level) {
  DH_V2.studyFilter = level;
  document.querySelectorAll('[data-library-filter]').forEach(btn => {
    btn.classList.toggle('active', btn.dataset.libraryFilter === level);
  });
  renderStudyLibrary();
}
window.filterStudyLibrary = filterStudyLibrary;

function renderStudyLibrary() {
  try {
    const grid = document.getElementById('studyLibraryGrid');
    if (!grid) { console.error('studyLibraryGrid not found'); return; }
    console.log('renderStudyLibrary', DH_V2.studyModules.length, 'modules');
    const modules = DH_V2.studyModules.filter(m => DH_V2.studyFilter === 'all' || m.level === DH_V2.studyFilter);
    if (!modules.length) {
      grid.innerHTML = '<div style="padding:28px;border:1px solid var(--border);border-radius:12px;color:var(--muted);background:var(--surface);">Rode o SQL study_modules_hub.sql no Supabase para carregar a Biblioteca de Estudos.</div>';
      return;
    }
    grid.innerHTML = modules.map(module => {
      const contentKeys = module.content ? Object.keys(module.content) : [];
      return `
        <section style="border:1px solid var(--border);border-radius:12px;background:var(--surface);padding:18px;">
          <div style="display:flex;align-items:flex-start;justify-content:space-between;gap:12px;margin-bottom:10px;">
            <div>
              <div style="font-size:12px;font-weight:800;color:var(--accent);">${escHtml(module.level)} · Cap. ${escHtml(module.chapter_number)}</div>
              <div style="font-family:'Inter Tight',sans-serif;font-weight:800;font-size:21px;margin-top:2px;">${escHtml(module.title_pt)}</div>
            </div>
             <button class="fc-audio-btn" onclick="loadModuleContent('${escHtml(module.slug)}')">Abrir</button>
          </div>
          ${contentKeys.length ? `<div style="font-size:13px;color:var(--muted);margin-top:8px;">Seções: ${contentKeys.join(', ')}</div>` : ''}
        </section>
      `;
    }).join('');
    makeWordsHoverable(grid);
  } catch(e) {
    console.error('renderStudyLibrary error:', e);
  }
}


function renderStudyLesson(module) {
  const content = module.content || {};
  const keys = Object.keys(content);
  return `
    <article style="border:1px solid var(--border);border-radius:10px;background:var(--bg);padding:14px;">
      <div style="font-weight:800;font-size:16px;margin-bottom:6px;">${escHtml(module.title_pt)}</div>
      <div style="display:grid;gap:8px;">
        ${keys.map(k => `<div style="font-size:13px;"><strong>${escHtml(k)}:</strong> ${escHtml(content[k])}</div>`).join('')}
      </div>
    </article>
  `;
}

function renderStudyExercise(ex) {
  const options = Array.isArray(ex.options) ? ex.options : [];
  const input = ex.exercise_type === 'choose_option'
    ? `<select id="ex-${ex.slug}" style="padding:9px;border-radius:8px;border:1px solid var(--border);background:var(--surface);color:var(--ink);"><option value="">Escolha...</option>${options.map(o => `<option value="${escHtml(o)}">${escHtml(o)}</option>`).join('')}</select>`
    : `<input id="ex-${ex.slug}" style="padding:9px;border-radius:8px;border:1px solid var(--border);background:var(--surface);color:var(--ink);" placeholder="Sua resposta...">`;
  return `
    <div style="display:grid;gap:8px;border:1px solid var(--border);border-radius:10px;padding:10px;">
      <div style="font-size:14px;">${escHtml(ex.prompt_pt)}</div>
      <div style="display:flex;gap:8px;flex-wrap:wrap;align-items:center;">
        ${input}
        <button class="fc-audio-btn" onclick="checkStudyExercise('${ex.slug}')">Validar</button>
      </div>
      <div id="fb-${ex.slug}" style="font-size:13px;"></div>
    </div>
  `;
}

async function checkStudyExercise(slug) {
  const ex = DH_V2.studyExercises.find(item => item.slug === slug);
  const input = document.getElementById(`ex-${slug}`);
  const fb = document.getElementById(`fb-${slug}`);
  if (!ex || !input || !fb) return;
  const value = input.value.trim();
  if (!value) return;
  const normalized = s => s.toLowerCase().normalize('NFC').replace(/[.!?]/g,'').trim();
  const ok = ex.exercise_type === 'free_answer'
    ? normalized(value).includes(normalized(ex.answer))
    : normalized(value) === normalized(ex.answer);
  fb.innerHTML = ok
    ? `<span style="color:var(--green);font-weight:800;">Correto! +${ex.xp_reward} XP</span> <span style="color:var(--muted);">${escHtml(ex.explanation_pt)}</span>`
    : `<span style="color:var(--red);font-weight:800;">Revise:</span> <span style="color:var(--muted);">${escHtml(ex.explanation_pt)} Resposta: ${escHtml(ex.answer)}</span>`;
  if (ok) await updateXP(ex.xp_reward || 10, `Biblioteca: ${ex.prompt_pt.slice(0, 40)}`);
}
window.checkStudyExercise = checkStudyExercise;

function createFlashcardsFromModule(moduleSlug) {
  const lessons = DH_V2.studyLessons.filter(l => l.module_slug === moduleSlug);
  const created = [];
  lessons.forEach(lesson => {
    const phrases = Array.isArray(lesson.key_phrases) ? lesson.key_phrases : [];
    phrases.forEach((p, idx) => {
      if (!p.de || !p.pt) return;
      const id = `lib-${lesson.slug}-${idx}`;
      if (CARDS.some(c => c.id === id)) return;
      CARDS.push({
        id,
        nivel: lesson.level,
        tema: 'biblioteca',
        frente: p.de,
        verso: p.pt,
        leigo: lesson.quick_rule_pt
      });
      created.push(id);
    });
  });
  showNotification(`${created.length} flashcards adicionados desta aula.`, 'success');
  showPage('flashcards');
}
window.createFlashcardsFromModule = createFlashcardsFromModule;

// Replace the old image tooltip with a fast PT-BR word tooltip.
const DH_WORD_PT_V2 = {
  ich:'eu', du:'voce', sie:'o senhor/a senhora/eles', wir:'nos',
  bin:'sou/estou', bist:'e/esta', ist:'e/esta', sind:'sao/estao',
  habe:'tenho', hast:'tem', haben:'ter/tem', brauche:'preciso',
  mochte:'queria/gostaria', möchte:'queria/gostaria', nehme:'vou levar',
  kostet:'custa', rechnung:'conta', bitte:'por favor', danke:'obrigado(a)',
  kaffee:'cafe', wasser:'agua', brot:'pao', brötchen:'paezinhos',
  bahnhof:'estacao de trem', zug:'trem', 'u-bahn':'metro', gleis:'plataforma',
  wo:'onde', was:'o que/quanto', wie:'como', wann:'quando',
  hilfe:'ajuda', helfen:'ajudar', langsamer:'mais devagar',
  wiederholen:'repetir', verstehe:'entendo', nicht:'nao',
  deutsch:'alemao', lerne:'estudo/aprendo', arbeite:'trabalho',
  webentwicklerin:'desenvolvedora web', code:'codigo', funktioniert:'funciona',
  frage:'pergunta', termin:'horario/compromisso', formular:'formulario',
  adresse:'endereco', apotheke:'farmacia', wohnung:'apartamento',
  tochter:'filha', sohn:'filho', schule:'escola', heute:'hoje',
  zeit:'tempo', passt:'esta bom/serve', gut:'bom/bem',
  morgen:'manha/amanha', tag:'dia', guten:'bom/boa',
  willkommen:'bem-vindo(a)', reservierung:'reserva', erzählen:'conte/fale',
  suchen:'procurar', bestemt:'especifico', möchten:'gostaria'
};

function normalizeGermanWordV2(word) {
  return (word || '')
    .toLowerCase()
    .replace(/[“”"„]/g, '')
    .replace(/^[^\p{L}äöüÄÖÜß-]+|[^\p{L}äöüÄÖÜß-]+$/gu, '');
}

function lookupWordPtV2(word) {
  const clean = normalizeGermanWordV2(word);
  if (!clean || clean.length < 2) return '';
  if (DH_WORD_PT_V2[clean]) return DH_WORD_PT_V2[clean];
  const card = CARDS.find(c => c.frente && c.frente.toLowerCase().split(/\s+/).map(normalizeGermanWordV2).includes(clean));
  return card ? card.verso : '';
}

initVisualDictionary = function() {
  let tip = document.getElementById('pexelsTooltip');
  if (!tip) {
    tip = document.createElement('div');
    tip.id = 'pexelsTooltip';
    document.body.appendChild(tip);
  }
  tip.style.cssText = `
    position:fixed; z-index:9999; display:none;
    background:var(--bg); border:1px solid var(--accent);
    border-radius:12px; padding:10px; box-shadow:0 8px 32px rgba(0,0,0,0.22);
    pointer-events:none; max-width:220px;
  `;
  tip.innerHTML = `
    <div id="pexelsWord" style="font-size:12px;font-weight:800;color:var(--accent);margin-bottom:4px;"></div>
    <div id="pexelsImg" style="font-size:13px;line-height:1.35;color:var(--ink);"></div>
  `;
  pexelsTooltip = tip;
};

showPexelsTooltip = async function(word, x, y) {
  if (!pexelsTooltip) initVisualDictionary();
  const translation = lookupWordPtV2(word);
  if (!translation) return;
  pexelsTooltip.style.display = 'block';
  pexelsTooltip.style.left = (x + 16) + 'px';
  pexelsTooltip.style.top = (y - 60) + 'px';
  document.getElementById('pexelsWord').textContent = word;
  document.getElementById('pexelsImg').textContent = translation;
};

makeWordsHoverable = function(container) {
  if (!container) return;
  container.querySelectorAll('.chat-bubble').forEach(bubble => {
    if (bubble.dataset.hovered) return;
    bubble.dataset.hovered = '1';
    const words = bubble.textContent.split(/(\s+)/);
    if (words.length < 3) return;
    bubble.innerHTML = words.map(w => {
      if (/^\s+$/.test(w)) return w;
      const clean = normalizeGermanWordV2(w);
      if (clean.length < 3 || !lookupWordPtV2(clean)) return escHtml(w);
      return `<span class="de-word" style="cursor:pointer;border-bottom:1px dotted var(--accent);" data-word="${clean}">${escHtml(w)}</span>`;
    }).join('');
    bubble.querySelectorAll('.de-word').forEach(span => {
      span.addEventListener('mouseenter', e => {
        clearTimeout(pexelsTimer);
        pexelsTimer = setTimeout(() => showPexelsTooltip(span.dataset.word, e.clientX, e.clientY), 250);
      });
      span.addEventListener('mouseleave', () => { clearTimeout(pexelsTimer); hidePexelsTooltip(); });
    });
  });
};

function dhPickListenPhrase() {
  const pool = (BOSS_PHRASES[currentLevel] || BOSS_PHRASES.A1 || []).map(p => p.de);
  if (pool.length) return pool[Math.floor(Math.random() * pool.length)];
  const fallback = CARDS.filter(c => c.nivel === currentLevel);
  return (fallback[Math.floor(Math.random() * fallback.length)] || CARDS[0]).frente;
}

function ensureListenTypeModal() {
  let modal = document.getElementById('listenTypeModal');
  if (modal) return modal;
  modal = document.createElement('div');
  modal.id = 'listenTypeModal';
  modal.className = 'modal';
  modal.innerHTML = `
    <div class="modal-card" style="max-width:560px;">
      <button class="modal-close" onclick="document.getElementById('listenTypeModal').classList.remove('open')">x</button>
      <div style="font-family:'Inter Tight',sans-serif;font-weight:800;font-size:20px;margin-bottom:4px;">Listen and Type</div>
      <p style="color:var(--muted);font-size:14px;margin-bottom:14px;">Ouça a frase e digite exatamente o que entendeu.</p>
      <div id="listenTypeStatus" style="font-size:13px;color:var(--muted);margin-bottom:10px;">Pronto.</div>
      <input id="listenTypeAnswer" style="width:100%;padding:12px;border-radius:10px;border:1px solid var(--border);background:var(--surface);color:var(--ink);font-size:15px;" placeholder="Digite em alemao...">
      <div id="listenTypeFeedback" style="margin-top:12px;"></div>
      <div style="display:flex;gap:10px;justify-content:flex-end;margin-top:16px;flex-wrap:wrap;">
        <button id="listenTypeReplay" style="padding:9px 16px;border-radius:999px;border:1px solid var(--border);background:transparent;color:var(--ink);font-weight:700;cursor:pointer;">Tocar de novo</button>
        <button id="listenTypeSubmit" style="padding:9px 16px;border-radius:999px;border:none;background:var(--accent);color:#fff;font-weight:700;cursor:pointer;">Validar</button>
      </div>
    </div>
  `;
  document.body.appendChild(modal);
  return modal;
}

window.startListenAndType = async function() {
  const modal = ensureListenTypeModal();
  const phrase = dhPickListenPhrase();
  modal.dataset.phrase = phrase;
  modal.classList.add('open');
  document.getElementById('listenTypeAnswer').value = '';
  document.getElementById('listenTypeFeedback').innerHTML = '';
  document.getElementById('listenTypeStatus').textContent = 'Tocando...';
  const play = async () => {
    document.getElementById('listenTypeStatus').textContent = 'Tocando...';
    await speakElevenLabs(phrase, CHARACTERS[currentChar || 'hans'].voiceId);
    document.getElementById('listenTypeStatus').textContent = 'Digite o que ouviu.';
  };
  document.getElementById('listenTypeReplay').onclick = play;
  document.getElementById('listenTypeSubmit').onclick = async () => {
    const answer = document.getElementById('listenTypeAnswer').value.trim();
    if (!answer) return;
    const matches = await checkGrammar(answer, currentChar);
    const similarity = Math.round(strSimilarity(answer.toLowerCase(), phrase.toLowerCase()) * 100);
    const passed = similarity >= 80 && matches.length === 0;
    document.getElementById('listenTypeFeedback').innerHTML = `
      <div style="padding:12px;border-radius:10px;border:1px solid ${passed?'var(--green)':'var(--red)'};">
        <div style="font-weight:800;color:${passed?'var(--green)':'var(--red)'};">${passed?'Aprovado':'Revise e tente novamente'} - ${similarity}%</div>
        <div style="font-size:13px;color:var(--muted);margin-top:6px;">Resposta: <strong style="color:var(--ink)">${phrase}</strong></div>
        ${matches.length ? `<div style="font-size:13px;color:var(--red);margin-top:6px;">${matches.length} ponto(s) gramatical(is) salvo(s) para revisao.</div>` : ''}
      </div>
    `;
    await saveChatMessage('system', `Listen and Type: ${answer}`, dhBuildGrammarFeedback(answer, matches), passed ? 25 : 0, currentChar);
    if (passed) await updateXP(25, 'Listen and Type aprovado');
  };
  await play();
}
window.startListenAndType = startListenAndType;

function dhInstallListenTypeButton() {
  if (document.getElementById('listenTypeBtn')) return;
  const shadowBtn = Array.from(document.querySelectorAll('button')).find(b => (b.title || '').toLowerCase().includes('shadow'));
  const btn = document.createElement('button');
  btn.id = 'listenTypeBtn';
  btn.title = 'Listen and Type';
  btn.textContent = 'L&T';
  btn.onclick = startListenAndType;
  btn.style.cssText = 'font-size:12px;font-weight:800;background:var(--surface);border:1px solid var(--border);color:var(--ink);border-radius:999px;padding:6px 10px;cursor:pointer;';
  if (shadowBtn?.parentNode) shadowBtn.parentNode.insertBefore(btn, shadowBtn.nextSibling);
}

const dhBaseSetNote = Store.setNote;
Store.setNote = (k, v) => {
  dhBaseSetNote(k, v);
  sbFetch('notes?on_conflict=user_id,bucket', {
    method: 'POST',
    headers: { Prefer: 'resolution=merge-duplicates,return=representation' },
    body: JSON.stringify({ user_id: DH_V2.userId, bucket: k, content: v, updated_at: new Date().toISOString() })
  }).catch(()=>{});
};

document.addEventListener('DOMContentLoaded', () => {
  dhInstallListenTypeButton();
  dhProfilePatch({ current_level: currentLevel, total_xp: Store.getXP(), active_character: currentChar || 'hans' });
  loadCuratedFlashcards();
  loadCuratedChallenges();
  setTimeout(() => { if (document.getElementById('flashcardGrid')) dhEnhanceFlashcardsWithPexels(); }, 800);
});

// Função para abrir/fechar os menus (Accordion)
window.toggleAccordion = function(id) {
  const menu = document.getElementById(id);
  const arrow = document.getElementById('arrow-' + id);

  if (menu.classList.contains('hidden')) {
    menu.classList.remove('hidden');
    if (arrow) arrow.style.transform = 'rotate(180deg)';
  } else {
    menu.classList.add('hidden');
    if (arrow) arrow.style.transform = 'rotate(0deg)';
  }
};

function filterChallenges(q) {
  const tags = document.querySelectorAll('.challenge-tag');
  const term = q.toLowerCase().trim();
  tags.forEach(tag => {
    const match = !term || tag.textContent.toLowerCase().includes(term) || (tag.title && tag.title.toLowerCase().includes(term));
    tag.style.display = match ? 'inline-block' : 'none';
  });
}
function startChallengeFromInput(query) {
  if (!query || !query.trim()) return;
  
  const q = query.toLowerCase().trim();
  
  // Mapeamento de palavras-chave para títulos de challenges
  const scenarioMap = {
    'padaria': 'Padaria de bairro',
    'cafe': 'Padaria de bairro',
    'café': 'Padaria de bairro',
    'pão': 'Padaria de bairro',
    'hotel': 'Check-in no hotel',
    'check': 'Check-in no hotel',
    'metro': 'Perdida no metrô',
    'metrô': 'Perdida no metrô',
    'bahn': 'Perdida no metrô',
    'perdida': 'Perdida no metrô',
    'entrevista': 'Mini entrevista tech',
    'tech': 'Mini entrevista tech',
    'code': 'Bug no código',
    'bug': 'Bug no código',
    'codigo': 'Bug no código',
    'código': 'Bug no código',
    'reunião': 'Reunião online',
    'reuniao': 'Reunião online',
    'meeting': 'Reunião online',
    'loja': 'Loja',
    'roupa': 'Loja',
    'compra': 'Loja',
    'emergência': 'Farmácia urgente',
    'emergencia': 'Farmácia urgente',
    'farmacia': 'Farmácia urgente',
    'farmácia': 'Farmácia urgente',
    'doente': 'Farmácia urgente',
    'formulario': 'Formulário no balcão',
    'formulário': 'Formulário no balcão',
    'balcão': 'Formulário no balcão',
    'balcao': 'Formulário no balcão',
    'termin': 'Marcar um horário',
    'horario': 'Marcar um horário',
    'horário': 'Marcar um horário',
    'formal': 'Primeira conversa formal',
    'correcao': 'Petra corrige sua frase',
    'correção': 'Petra corrige sua frase',
    'petra': 'Petra corrige sua frase',
    'problema': 'Problema simples'
  };

  // Busca nos challenges curados
  const curated = (typeof DH_V2 !== 'undefined' && DH_V2.curatedChallenges) ? DH_V2.curatedChallenges : [];
  
  // 1. Tenta match direto por título/scenario
  let match = curated.find(c => 
    c.title_pt.toLowerCase().includes(q) || 
    (c.scenario_pt && c.scenario_pt.toLowerCase().includes(q)) ||
    c.theme.toLowerCase().includes(q)
  );

  // 2. Se não achou, tenta pelo mapa de keywords
  if (!match) {
    const keyword = Object.keys(scenarioMap).find(k => q.includes(k));
    if (keyword) {
      const title = scenarioMap[keyword];
      match = curated.find(c => c.title_pt === title);
    }
  }

  // 3. Se achou curated, inicia ele
  if (match && typeof startCuratedChallenge === 'function') {
    startCuratedChallenge(match.slug);
    document.getElementById('challengeSearchInput').value = '';
    return;
  }

  // 4. Se não achou nada, inicia challenge genérico com IA
  if (typeof startChallenge === 'function') {
    startChallenge(query);
    document.getElementById('challengeSearchInput').value = '';
  }
}

