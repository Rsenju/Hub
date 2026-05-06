// 🔑 CONFIGURAÇÃO
const SUPABASE_URL = 'https://htefiqaxilufnewmycut.supabase.co';
const SUPABASE_KEY = 'sb_publishable__1bxoDUtOWsghhgfOpSz2A_qlwCtTo0';
const LT_ENDPOINT = '/api/languagetool';
const PEXELS_ENDPOINT = '/api/pexels';

// 🌐 INIT SUPABASE CLIENT
let supabaseClient = null;
function getSupabase() {
  if (!supabaseClient) {
    supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_KEY);
  }
  return supabaseClient;
}

// 📦 STATE GLOBAL
let state = {
  user: null,
  xp: 0,
  streak: 0,
  level: 'A1',
  srsProgress: {},
  activePersona: 'hans',
  chatHistory: [],
  flashcards: [],
  modules: [],
  lessons: [],
  exercises: [],
  bossState: { active: false, round: 0, score: 0, phrases: [], total: 5 },
  shadowState: { active: false, phrase: '', recognition: null }
};

// 🖼️ CACHE DE DOM
const DOM = {
  xpNum: document.getElementById('xp-num'),
  streakNum: document.getElementById('streak-num'),
  levelLabel: document.getElementById('levelLabel'),
  progressBar: document.getElementById('levelProgressBar'),
  flashcardGrid: document.getElementById('flashcardGrid'),
  chatMessages: document.getElementById('chatMessages'),
  chatInput: document.getElementById('chatInput'),
  sendBtn: document.getElementById('chatSendBtn'),
  libraryGrid: document.getElementById('studyLibraryGrid'),
  bossModal: document.getElementById('bossFightModal'),
  shadowModal: document.getElementById('shadowModal')
};

// 🛠️ SUPABASE HELPERS
async function sbFetch(path, opts = {}) {
  try {
    const client = getSupabase();
    const { data, error } = await client.from(path.split('?')[0]).select('*').eq('active', true);
    if (error) throw error;
    return data || [];
  } catch (e) {
    console.warn(`[SB] Fallback local para: ${path}`, e);
    return null;
  }
}

async function sbUpsert(table, record) {
  try {
    const client = getSupabase();
    const { error } = await client.from(table).upsert(record, { onConflict: 'id' });
    if (error) console.warn(`[SB] Upsert falhou: ${table}`, error);
  } catch (e) {
    console.warn(`[SB] Fallback local para upsert: ${table}`, e);
  }
}

// ===================================================
// FLASHCARDS & SRS (Repetição Espaçada)
// ===================================================
const FALLBACK_CARDS = [
  { id: 'a1-01', level: 'A1', front_de: 'Guten Morgen!', back_pt: 'Bom dia!', tags: ['cumprimentos'] },
  { id: 'a1-02', level: 'A1', front_de: 'Wie heißt du?', back_pt: 'Como você se chama?', tags: ['apresentação'] },
  { id: 'a1-03', level: 'A1', front_de: 'Ich heiße...', back_pt: 'Eu me chamo...', tags: ['apresentação'] },
  { id: 'a2-01', level: 'A2', front_de: 'Ich habe gestern gearbeitet.', back_pt: 'Eu trabalhei ontem.', tags: ['passado'] },
  { id: 'b1-01', level: 'B1', front_de: 'Obwohl es regnet, gehe ich spazieren.', back_pt: 'Embora esteja chovendo, vou caminhar.', tags: ['concessivo'] }
];

const SRS = {
  get: () => JSON.parse(localStorage.getItem('dh-srs') || '{}'),
  set: (data) => localStorage.setItem('dh-srs', JSON.stringify(data)),
  cardDue: (id) => {
    const srs = SRS.get();
    return !srs[id] || srs[id].next <= Date.now();
  },
  evaluate: (id, rating) => {
    const srs = SRS.get();
    const c = srs[id] || { interval: 1, ease: 2.5 };
    const day = 86400000;
    if (rating === 'easy') { c.interval = Math.min(c.interval * 2.5, 30); c.ease = Math.min(c.ease + 0.2, 3); }
    else if (rating === 'medium') { c.interval = Math.min(c.interval * 1.5, 14); }
    else { c.interval = 1; c.ease = Math.max(c.ease - 0.3, 1.3); }
    c.next = Date.now() + c.interval * day;
    srs[id] = c;
    SRS.set(srs);
  }
};

async function loadFlashcards() {
  const sbData = await sbFetch('flashcards_v2');
  state.flashcards = sbData || FALLBACK_CARDS;
  renderFlashcards();
}

function renderFlashcards(filter = 'all') {
  if (!DOM.flashcardGrid) return;
  let cards = state.flashcards;
  if (filter !== 'all') cards = cards.filter(c => c.level === filter);
  cards = cards.filter(c => SRS.cardDue(c.id));

  if (!cards.length) {
    DOM.flashcardGrid.innerHTML = `<div style="grid-column:1/-1;text-align:center;padding:60px 20px;color:var(--muted);">🎉 Todos revisados! <br><br><button class="btn-secondary" onclick="resetSRS()">Ver todos novamente</button></div>`;
    return;
  }

  DOM.flashcardGrid.innerHTML = cards.map(card => `
    <div class="flashcard" data-id="${card.id}" data-text="${encodeURIComponent(card.front_de)}">
      <div class="fc-tag">${card.level} · ${card.tags?.join(', ') || 'geral'}</div>
      <div class="fc-front">${card.front_de}</div>
      <div class="fc-audio-btns">
        <button class="fc-audio-btn" onclick="event.stopPropagation();speak('${card.front_de}', false)">🔊 Normal</button>
        <button class="fc-audio-btn" onclick="event.stopPropagation();speak('${card.front_de}', true)">🐢 Devagar</button>
      </div>
      <div class="fc-back">${card.back_pt}</div>
      <div class="fc-leigo">💡 ${card.explanation_pt || ''}</div>
      <div class="srs-btns">
        <button class="srs-btn easy" onclick="event.stopPropagation();rateCard('${card.id}','easy')">Fácil ✓</button>
        <button class="srs-btn medium" onclick="event.stopPropagation();rateCard('${card.id}','medium')">Médio</button>
        <button class="srs-btn hard" onclick="event.stopPropagation();rateCard('${card.id}','hard')">Difícil</button>
      </div>
    </div>
  `).join('');

  DOM.flashcardGrid.querySelectorAll('.flashcard').forEach(fc => {
    fc.addEventListener('click', () => {
      const wasOpen = fc.classList.contains('is-open');
      DOM.flashcardGrid.querySelectorAll('.flashcard').forEach(f => f.classList.remove('is-open'));
      if (!wasOpen) {
        fc.classList.add('is-open');
        speak(decodeURIComponent(fc.dataset.text), false);
      }
    });
  });
}

function rateCard(id, rating) {
  SRS.evaluate(id, rating);
  addXP(rating === 'easy' ? 3 : rating === 'medium' ? 2 : 1, `Card Review (${rating})`);
  const fc = document.querySelector(`.flashcard[data-id="${id}"]`);
  if (fc) {
    fc.style.opacity = '0'; fc.style.transform = 'scale(0.95)'; fc.style.transition = 'all 0.3s';
    setTimeout(() => fc.remove(), 300);
  }
}

function resetSRS() {
  SRS.set({});
  renderFlashcards();
}

// ===================================================
// BIBLIOTECA DE ESTUDOS (Módulos → Lições → Exercícios)
// ===================================================
const FALLBACK_MODULES = [
  { slug: 'a1-cap1', level: 'A1', chapter_number: 1, title_pt: '1. Hallo! – Begrüßungen', focus: 'Apresentações básicas' },
  { slug: 'a2-cap21', level: 'A2', chapter_number: 21, title_pt: '21. Gestern war… – Perfekt', focus: 'Passado com haben' },
  { slug: 'b1-cap40', level: 'B1', chapter_number: 40, title_pt: '40. Feste und Feiern', focus: 'Tradições e cultura' }
];

async function loadLibraryModules() {
  const sbModules = await sbFetch('study_modules');
  state.modules = sbModules || FALLBACK_MODULES;
  renderLibrary();
}

function renderLibrary() {
  if (!DOM.libraryGrid) return;
  DOM.libraryGrid.innerHTML = state.modules.map(mod => `
    <div class="module-card" onclick="openModule('${mod.slug}')">
      <div class="module-header">
        <span class="level-tag ${mod.level.toLowerCase()}">${mod.level}</span>
        <h3>${mod.title_pt}</h3>
      </div>
      <p class="module-focus">🎯 ${mod.focus || 'Estudo completo'}</p>
      <button class="btn-study">Estudar</button>
    </div>
  `).join('');
}

async function openModule(slug) {
  // Fallback visual se não houver Supabase
  const lessonData = await sbFetch(`study_lessons?module_slug=eq.${slug}`);
  if (!lessonData?.length) {
    alert(`📚 Módulo ${slug}\n\nConteúdo detalhado será carregado do Supabase.\nFallback: Estude pelo flashcard ou chatbot.`);
    return;
  }
  showPage('biblioteca');
  DOM.libraryGrid.innerHTML = lessonData.map(les => `
    <section style="border:1px solid var(--border);border-radius:12px;background:var(--surface);padding:18px;margin-bottom:12px;">
      <h4 style="font-family:'Inter Tight',sans-serif;font-weight:700;font-size:17px;margin:0 0 8px 0;">${les.title_pt}</h4>
      <p style="font-size:13px;color:var(--muted);margin:0 0 10px 0;">${les.summary_pt || ''}</p>
      ${les.quick_rule_pt ? `<div style="background:var(--bg);padding:10px;border-radius:8px;font-size:13px;margin-bottom:10px;"><strong>Regra:</strong> ${les.quick_rule_pt}</div>` : ''}
    </section>
  `).join('');
}
// ===================================================
// CHATBOT & PERSONAS (Groq → HF → Fallback)
// ===================================================
const PERSONAS = {
  hans: {
    name: 'Hans', label: 'Hans – O Mentor', chatName: 'Hans',
    desc: 'Professor rigoroso. Foca em gramática.',
    greeting: 'Guten Tag, Rebeca. Beginnen wir mit dem Wesentlichen: der deutschen Grammatik. Schreib mir einen Satz — ich höre jeden falschen Artikel. 🇩🇪',
    systemPrompt: 'Du bist Hans, ein strenger Deutschlehrer. Antworte auf Deutsch präzise. Korrigiere Fehler mit Format: ---KORREKTUR--- 🎼 [Metapher] ❌ Fehler: [...] ✅ Richtig: [...] 💡 Regel (em português): [...] XP: 10'
  },
  lukas: {
    name: 'Lukas', label: 'Lukas – O Dev', chatName: 'Lukas',
    desc: 'Estudante casual. Usa gírias.',
    greeting: 'Hey Rebeca! Lukas hier aus Kreuzberg 🧢 Lass uns quatschen — kein cringe-formales Deutsch! Was ist dein Stand, Digga? 😎🇪',
    systemPrompt: 'Du bist Lukas, 26, Dev aus Kreuzberg. Sehr informell. Slang 2026: krass, Digga, Alter, Bock, cringe. Korrigiere locker. Format: ---KORREKTUR--- 🐛 Bug in deiner Logik! ❌ Dein Code: [...] ✅ Der Fix: [...] 💡 Dica (em português): [...] XP: 10'
  },
  heidi: {
    name: 'Heidi', label: 'Heidi – A Viajante', chatName: 'Heidi',
    desc: 'Freelancer nômade. Dicas de viagem.',
    greeting: 'Hallo Rebeca! Heidi hier ✈️ Ich zeige dir, wie man auf Reisen WIRKLICH Deutsch spricht — von der Straße, nicht vom Lehrbuch. Wohin reist du heute? 🗺️',
    systemPrompt: 'Du bist Heidi, nomadische Freelance-Übersetzerin. Freundlich, praktisch, reisefokussiert. Format: ---KORREKTUR--- ✈️ Reise-Check für Rebeca: ❌ So gibt es Probleme: [...] ✅ So kommst du durch: [...] 💡 Dica de sobrevivência (em português): [...] XP: 10'
  },
  petra: {
    name: 'Petra', label: 'Petra – A Analítica', chatName: 'Petra',
    desc: 'Bibliotecária old school. Sarcasmo é carinho.',
    greeting: 'Petra hier. *nippt am Kamillentee* Ihre Akte zeigt: Anfängerin. Gut. Schreiben Sie etwas auf Deutsch, Rebeca. Ich werde... präzise sein. 📚',
    systemPrompt: 'Du bist Petra, Bibliothekarin. Präzise, leicht ironisch, warmherzig. Finde UND KATALOGISIERE jeden Fehler. Format: ---KORREKTUR--- 📚 Katalog für Rebeca: • Fehler 1: ❌ "[falsch]" → ✅ "[richtig]" | (em português): [explicação] 💡 Petra\'s Urteil (em português): [resumo sarcástico mas carinhoso] 📊 Precisão: X/10 XP: 10'
  }
};

let currentChar = 'hans';
let charHistories = { hans: [], lukas: [], heidi: [], petra: [] };

function selectChar(charKey) {
  currentChar = charKey;
  document.querySelectorAll('.char-btn').forEach(b => b.classList.toggle('active', b.dataset.char === charKey));
  const ch = PERSONAS[charKey];
  DOM.chatMessages.innerHTML = '';
  addBotMessage(ch.greeting);
  charHistories[charKey] = [];
}

async function sendChat() {
  const text = DOM.chatInput.value.trim();
  if (!text) return;
  addUserMessage(text);
  DOM.chatInput.value = '';
  DOM.sendBtn.disabled = true;

  const loadingId = addLoadingMessage();
  try {
    // Mock AI response (substitua por fetch('/api/groq') se tiver backend)
    setTimeout(() => {
      removeLoadingMessage(loadingId);
      const response = generateMockResponse(text, currentChar);
      addBotMessage(response);
      parseXPFromResponse(response);
      DOM.sendBtn.disabled = false;
    }, 1200);
  } catch (e) {
    removeLoadingMessage(loadingId);
    addBotMessage('⚠️ Verbindungsfehler. Versuche es erneut.');
    DOM.sendBtn.disabled = false;
  }
}

function addUserMessage(text) {
  const div = document.createElement('div');
  div.className = 'chat-msg user';
  div.innerHTML = `<div class="chat-bubble">${escHtml(text)}</div>`;
  DOM.chatMessages.appendChild(div);
  DOM.chatMessages.scrollTop = DOM.chatMessages.scrollHeight;
}

function addBotMessage(text) {
  const ch = PERSONAS[currentChar];
  const div = document.createElement('div');
  div.className = 'chat-msg bot';
  let main = text, corr = '';
  if (text.includes('---KORREKTUR---')) {
    const parts = text.split('---KORREKTUR---');
    main = parts[0].trim();
    corr = parts[1]?.split('---')[0]?.trim() || '';
  }
  div.innerHTML = `
    <div class="chat-name">${ch.chatName}</div>
    <div class="chat-bubble">${escHtml(main)}</div>
    ${corr ? `<div class="chat-correction"><div class="correction-label">📝 ${ch.name} corrige você</div><div class="correction-text">${escHtml(corr)}</div><button onclick="markCorrectionRead(this)" style="margin-top:8px;padding:4px 12px;border-radius:999px;border:1px solid var(--accent);background:transparent;color:var(--accent);font-size:12px;cursor:pointer;">✓ Li a correção (+XP)</button></div>` : ''}
    <div style="margin-top:6px;"><button class="fc-audio-btn" onclick="speak(\`${main.replace(/`/g, '\\`')}\`, false)">🔊 Ouvir</button></div>
  `;
  DOM.chatMessages.appendChild(div);
  DOM.chatMessages.scrollTop = DOM.chatMessages.scrollHeight;
}

function generateMockResponse(input, persona) {
  const lower = input.toLowerCase();
  if (persona === 'hans') {
    if (lower.includes('hallo')) return 'Guten Tag! Wie geht es Ihnen?';
    if (lower.includes('wie geht')) return 'Mir geht es gut, danke. Und Ihnen?';
    return 'Das ist interessant. Bitte achten Sie auf die Großschreibung der Nomen!';
  }
  if (persona === 'lukas') {
    if (lower.includes('hallo')) return 'Moin! Was geht ab?';
    if (lower.includes('lernen')) return 'Ja, Deutsch lernen ist krass! Viel Erfolg, Digga.';
    return 'Alles klar! Lass uns chillen und üben.';
  }
  if (persona === 'heidi') return 'Das klingt nach einem tollen Plan! Packen Sie Ihren Koffer!';
  if (persona === 'petra') return 'Ihr Satz ist fast perfekt. Nur ein kleiner Artikel-Fehler... korrigiere ich sofort.';
  return 'Entschuldigung, ich verstehe das nicht ganz.';
}

function parseXPFromResponse(raw) {
  const match = raw.match(/XP:\s*(\d+)/);
  if (match) addXP(parseInt(match[1]), 'Resposta do Chatbot');
}

function markCorrectionRead(btn) {
  addXP(10, 'Correção lida');
  btn.textContent = '✓ XP ganho!'; btn.disabled = true; btn.style.opacity = '0.5';
}

function escHtml(s) {
  return String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/\n/g, '<br>');
}
// ===================================================
// GAMIFICAÇÃO & XP
// ===================================================
function addXP(amount, reason) {
  state.xp += amount;
  localStorage.setItem('dh-xp', state.xp);
  updateUI();
  showToast(`+${amount} XP: ${reason}`, 'success');
}

function updateUI() {
  if (DOM.xpNum) DOM.xpNum.innerText = state.xp;
  if (DOM.streakNum) DOM.streakNum.innerText = state.streak;
  if (DOM.levelLabel) DOM.levelLabel.innerText = state.level;
  
  const progress = Math.min((state.xp % 500) / 500 * 100, 100);
  if (DOM.progressBar) DOM.progressBar.style.width = `${progress}%`;

  // ✅ NOVO: Alterna classes visuais quando XP ou Streak são 0
  const xpPanel = document.querySelector('.xp-panel');
  const streakBadge = document.querySelector('.streak-badge');
  
  xpPanel?.classList.toggle('empty', state.xp === 0);
  streakBadge?.classList.toggle('zero', state.streak === 0);
}

function showToast(msg, type = 'info') {
  const toast = document.createElement('div');
  toast.className = `toast ${type}`;
  toast.innerText = msg;
  document.body.appendChild(toast);
  setTimeout(() => toast.remove(), 3000);
}

// ===================================================
// BOSS FIGHT & SHADOWING
// ===================================================
const BOSS_PHRASES = {
  A1: [{ de: 'Ich heiße Rebeca und ich komme aus Brasilien.', pt: 'Meu nome é Rebeca e eu venho do Brasil.' }],
  A2: [{ de: 'Ich habe gestern im Restaurant gegessen.', pt: 'Eu comi no restaurante ontem.' }],
  B1: [{ de: 'Obwohl es regnet, gehe ich spazieren.', pt: 'Embora esteja chovendo, vou caminhar.' }]
};

window.startBossFight = function() {
  state.bossState = { active: true, round: 0, score: 0, phrases: BOSS_PHRASES[state.level] || BOSS_PHRASES.A1, total: 5 };
  DOM.bossModal.style.display = 'flex';
  document.getElementById('bossLevel').textContent = state.level;
  startBossRound();
};

function startBossRound() {
  const round = state.bossState.round;
  if (round >= state.bossState.total) { endBossFight(); return; }
  const phrase = state.bossState.phrases[round];
  document.getElementById('bossTranslation').textContent = phrase.pt;
  document.getElementById('bossInput').value = '';
  speak(phrase.de, false);
}

window.checkBossAnswer = function() {
  const input = document.getElementById('bossInput').value.toLowerCase();
  const phrase = state.bossState.phrases[state.bossState.round];
  const ok = input.includes(phrase.de.toLowerCase()) || input.replace(/[.,!?]/g, '') === phrase.de.toLowerCase().replace(/[.,!?]/g, '');
  document.getElementById('bossFeedback').innerHTML = ok ? '<span style="color:var(--green)">✅ Richtig! +50 XP</span>' : '<span style="color:var(--red)">❌ Falsch! Tente novamente.</span>';
  if (ok) addXP(50, 'Boss Fight Victory');
  setTimeout(() => { state.bossState.round++; startBossRound(); }, 1500);
};

function endBossFight() {
  DOM.bossModal.style.display = 'none';
  showToast('🏆 Boss Fight Concluído!', 'success');
}

window.startShadowing = function() {
  DOM.shadowModal.style.display = 'flex';
  const phrase = 'Guten Morgen, wie geht es Ihnen?';
  document.getElementById('shadow-phrase').innerText = phrase;
  speak(phrase, true);
  showToast('🎤 Modo Shadowing ativo!', 'info');
};

// ===================================================
// INIT & EVENT LISTENERS
// ===================================================
function initAuth() {
  const userId = localStorage.getItem('dh-user-id') || 'guest-' + crypto.randomUUID();
  localStorage.setItem('dh-user-id', userId);
  state.user = { id: userId };
}

function setupNavigation() {
  // ✅ Adicionado '.bottom-nav-item' para capturar cliques no mobile
  document.querySelectorAll('.sidebar-link, .nav-pill, .bottom-nav-item').forEach(btn => {
    btn.addEventListener('click', (e) => {
      const pageId = e.currentTarget.dataset.page;
      if (pageId) showPage(pageId);

      // Gerencia estado "active" exclusivo da bottom-nav
      if (btn.classList.contains('bottom-nav-item')) {
        document.querySelectorAll('.bottom-nav-item').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
      }
    });
  });
}

function showPage(pageId) {
  document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
  document.getElementById(`page-${pageId}`)?.classList.add('active');
  if (pageId === 'flashcards') renderFlashcards();
  if (pageId === 'biblioteca') loadLibraryModules();
}

window.showPage = showPage;
window.selectChar = selectChar;
window.sendChat = sendChat;
window.speak = function(text, slow) {
  if ('speechSynthesis' in window) {
    window.speechSynthesis.cancel();
    const u = new SpeechSynthesisUtterance(text);
    u.lang = 'de-DE'; u.rate = slow ? 0.5 : 0.95;
    window.speechSynthesis.speak(u);
  }
};

// 🔹 FILTROS DE FLASHCARDS (Nível: Todos, A1, A2, B1, Gírias)
window.setFilter = function(level) {

  document.querySelectorAll('.filter-chip').forEach(chip => {
    chip.classList.toggle('active', chip.dataset.filter === level);
  });

  renderFlashcards(level);
}

// 🔹 FILTROS POR TEMA (Dia a Dia, Trabalho, Viagem, Pedidos)
window.setThemeFilter = function(theme) {

  document.querySelectorAll('.category-card').forEach(card => {
    card.classList.toggle('active', card.dataset.theme === theme);
  });
  
  console.log(`🎯 Tema selecionado: ${theme}`);
}

// 🚀 INIT DOM READY
document.addEventListener('DOMContentLoaded', async () => {
  initAuth();
  setupNavigation();
  const savedXP = parseInt(localStorage.getItem('dh-xp') || '0');
  const savedStreak = parseInt(localStorage.getItem('dh-streak') || '0');
  state.xp = savedXP;
  state.streak = savedStreak;
  updateUI();
  await loadFlashcards();
  await loadLibraryModules();
  selectChar('hans');
  console.log('🇩 Deutsch Hub v2.0 iniciado!');
});