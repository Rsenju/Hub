// ==================== CONFIGURAÇÃO E ESTADO ====================
const SUPABASE_URL = 'https://SEU-PROJETO.supabase.co';
const SUPABASE_KEY = 'SUA-CHAVE-ANON-AQUI';
const GROQ_API_ENDPOINT = '/api/groq'; // Endpoint da Edge Function
const ELEVENLABS_ENDPOINT = '/api/elevenlabs';
const LANGUAGETOOL_ENDPOINT = '/api/languagetool';

// Inicialização do Supabase
const supabase = window.supabase.createClient(SUPABASE_URL, SUPABASE_KEY);

// Estado Global (mistura de variáveis locais e cache de sessão)
let state = {
  currentPage: 'dashboard',
  currentLevel: 'A1',
  xp: parseInt(localStorage.getItem('dh-xp') || '2450'),
  streak: parseInt(localStorage.getItem('dh-streak') || '12'),
  user: null,
  modulesData: {},
  lessonsData: {},
  flashcardsData: [],
  lessonState: { level: 'A1', module: null, lessons: [], currentIndex: 0, currentTab: 'dialogue' },
  srsProgress: JSON.parse(localStorage.getItem('dh-srs') || '{}')
};

// Dados de Personas (Blueprint)
const PERSONAS = {
  anna: { name: 'Anna', role: 'Professora', color: '#f97316', greeting: 'Hallo! Wie kann ich dir helfen? 😊', style: 'paciente e didática' },
  lukas: { name: 'Lukas', role: 'Colega', color: '#3b82f6', greeting: 'Hey! Alles klar? 🧢', style: 'informal e gírias' },
  herr_mueller: { name: 'Herr Müller', role: 'Formal', color: '#22c55e', greeting: 'Guten Tag. Wie kann ich unterstützen?', style: 'formal e rigoroso' },
  lisa: { name: 'Lisa', role: 'Amiga', color: '#a855f7', greeting: 'Hey!! Wie geht\'s? 😍', style: 'jovem e descontraída' }
};

// ==================== DATA LOADER & PROGRESS SYNC ====================

/** Carrega Módulos, Lições e Flashcards do Supabase */
async function loadLevelData(level) {
  state.currentLevel = level;
  document.getElementById('moduleList').innerHTML = '<p class="loading">🔄 Buscando conteúdo…</p>';
  
  try {
    // Busca paralela para performance
    const [modRes, lesRes, fcRes] = await Promise.all([
      supabase.from('study_modules').select('slug, title_de, title_pt, sort_order, active').eq('level', level).eq('active', true).order('sort_order'),
      supabase.from('study_lessons').select('slug, module_slug, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, active').eq('level', level).eq('active', true).order('sort_order'),
      supabase.from('flashcards_v2').select('slug, front_de, back_pt, example_de, theme, curated').eq('level', level).eq('curated', true).eq('active', true)
    ]);

    if (modRes.error || lesRes.error) throw new Error('Erro ao buscar dados');

    // 1. Transformar Lições em Map
    state.lessonsData = {};
    lesRes.data.forEach(l => {
      state.lessonsData[l.slug] = { ...l, examples: parseJsonSafe(l.examples), key_phrases: parseJsonSafe(l.key_phrases), mini_notes: parseJsonSafe(l.mini_notes) };
    });

    // 2. Transformar Flashcards
    state.flashcardsData = fcRes.data.map(c => ({ id: c.slug, word: c.front_de, translation: c.back_pt, example: c.example_de, theme: c.theme }));

    // 3. Transformar Módulos (Agrupar lições em capítulos)
    state.modulesData[level] = modRes.data.map(m => {
      const modLessons = lesRes.data.filter(l => l.module_slug === m.slug).map(l => l.slug);
      return {
        id: Math.round(m.sort_order / 10),
        slug: m.slug,
        title: m.title_de, translation: m.title_pt,
        status: 'current', // Ideal: calcular via user_progress
        chapters: [{ name: m.title_de, type: 'lesson', done: false, lessons: modLessons.length ? modLessons : [] }]
      };
    });

    renderModules();
    updateUIState();

  } catch (err) {
    console.error('❌ Falha ao carregar dados:', err);
    document.getElementById('moduleList').innerHTML = `<p style="color:var(--error)">Erro ao conectar. Verifique console.</p>`;
  }
}

/** Sincroniza Progresso Real no Supabase */
async function saveProgress(lessonSlug, status = 'completed') {
  if (!state.user) return console.warn('Usuário não logado para salvar progresso.');
  
  try {
    await supabase.from('user_progress').upsert({
      user_id: state.user.id,
      lesson_slug: lessonSlug,
      module_slug: state.lessonState.module,
      status: status,
      completed_at: new Date().toISOString()
    }, { onConflict: 'user_id, lesson_slug' });
    console.log('✅ Progresso salvo:', lessonSlug);
  } catch (err) {
    console.error('Erro ao salvar progresso:', err);
  }
}

/** Atualiza Streak (Lógica local + preparada para sync) */
function updateStreak() {
  const last = localStorage.getItem('dh-last-active');
  const today = new Date().toISOString().split('T')[0];
  if (last !== today) {
    state.streak = (last === getYesterday()) ? state.streak + 1 : 1;
    localStorage.setItem('dh-streak', state.streak);
    localStorage.setItem('dh-last-active', today);
  }
}

// ==================== RENDER FUNCTIONS ====================

function renderModules() {
  const list = document.getElementById('moduleList');
  const modules = state.modulesData[state.currentLevel] || [];
  
  if (!modules.length) { list.innerHTML = '<p style="text-align:center;color:var(--text-muted);padding:40px;">Nenhum módulo disponível.</p>'; return; }

  list.innerHTML = modules.map(m => `
    <div class="module-card">
      <div class="module-header" onclick="toggleModule(this)">
        <div class="module-header-left">
          <div class="module-num">${m.id}</div>
          <div><div class="module-title">${m.title}</div><div class="module-sub">${m.translation}</div></div>
        </div>
      </div>
      <span class="module-status status-${m.status}">${m.status==='done'?'✓ Concluído':m.status==='current'?'● Atual':'🔒 Bloqueado'}</span>
    </div>
    <div class="module-chapters">
      ${m.chapters.map(c => `
        <div class="chapter-item">
          <div class="chapter-check ${c.done?'done':''}" onclick="event.stopPropagation();this.classList.toggle('done')">${c.done?'✓':''}</div>
          <span class="chapter-name" onclick="openLesson('${state.currentLevel}','${m.slug}','${c.lessons[0]}')">${c.name}</span>
          <span class="chapter-type">${c.type}</span>
        </div>
      `).join('')}
    </div>
  `).join('');
}

function toggleModule(header) {
  header.parentElement.querySelector('.module-chapters').classList.toggle('open');
}

function openLesson(level, moduleSlug, lessonSlug) {
  if (!lessonSlug) return;
  const module = state.modulesData[level]?.find(m => m.slug === moduleSlug);
  if (!module) return;

  const allLessons = module.chapters.flatMap(c => c.lessons).filter(Boolean);
  const idx = allLessons.indexOf(lessonSlug);

  state.lessonState = { level, module: moduleSlug, lessons: allLessons, currentIndex: Math.max(0, idx), currentTab: 'dialogue' };
  renderLesson();
  navigateTo('lesson');
}

function renderLesson() {
  const ls = state.lessonState;
  const lesson = state.lessonsData[ls.lessons[ls.currentIndex]];
  const module = state.modulesData[ls.level]?.find(m => m.slug === ls.module);

  document.getElementById('lessonBreadcrumbModule').textContent = ls.level;
  document.getElementById('lessonBreadcrumbChapter').textContent = module ? module.title : ls.module;
  document.getElementById('lessonTitle').textContent = lesson ? lesson.title_pt : 'Carregando…';
  document.getElementById('lessonSubtitle').textContent = lesson ? lesson.title_de : '';
  document.getElementById('lessonCounter').textContent = `Lição ${ls.currentIndex + 1} de ${ls.lessons.length}`;

  // Tabs reset
  ls.currentTab = 'dialogue';
  document.querySelectorAll('.lesson-tab').forEach(t => t.classList.toggle('active', t.dataset.tab === 'dialogue'));
  document.querySelectorAll('.lesson-section').forEach(s => s.classList.toggle('active', s.id === 'tab-dialogue'));

  if (lesson) {
    // Parse Dialogue
    const [dePart, ptPart] = parseDialogue(lesson.summary_pt);
    document.getElementById('dialogueDe').innerHTML = dePart ? formatDialogue(dePart) : '<p style="color:var(--text-muted)">Texto não disponível.</p>';
    document.getElementById('dialoguePt').innerHTML = ptPart ? formatDialogue(ptPart, true) : '';
    
    // Grammar & Vocab
    document.getElementById('grammarText').innerHTML = lesson.quick_rule_pt || '';
    document.getElementById('grammarExamples').innerHTML = renderExamples(lesson.examples);
    document.getElementById('vocabGrid').innerHTML = lesson.key_phrases.map(v => `<div class="vocab-item"><div class="de">${v.de}</div><div class="pt">${v.pt}</div></div>`).join('');
    document.getElementById('cultureNotes').innerHTML = lesson.mini_notes.map(n => `<div class="note-item"><p>${n.replace(/^• /, '')}</p></div>`).join('');
  }

  // Nav buttons
  document.getElementById('btnPrevLesson').disabled = ls.currentIndex === 0;
  document.getElementById('btnNextLesson').disabled = ls.currentIndex === ls.lessons.length - 1;
  document.getElementById('btnPrevLesson').style.opacity = document.getElementById('btnPrevLesson').disabled ? '.5' : '1';
  document.getElementById('btnNextLesson').style.opacity = document.getElementById('btnNextLesson').disabled ? '.5' : '1';
}

function parseDialogue(text) {
  const parts = text.split(/\n(?=[A-Z][a-z]+:)/);
  let de = '', pt = '', inDe = false;
  parts.forEach(p => {
    if (p.includes('DIÁLOGO')) inDe = true;
    else if (p.includes('TRADUÇÃO')) inDe = false;
    else if (inDe) de += p + '\n';
    else pt += p + '\n';
  });
  return [de, pt];
}

function formatDialogue(text, isPt = false) {
  const cls = isPt ? 'speaker pt' : 'speaker de';
  return text.trim().split('\n').filter(l => l.trim()).map(line => {
    const m = line.match(/^(\w[\w\s]*):\s*(.+)$/);
    return m ? `<p><span class="${cls}">${m[1]}:</span> ${m[2]}</p>` : `<p>${line}</p>`;
  }).join('');
}

function renderExamples(examples) {
  if (!Array.isArray(examples)) return '';
  return `<div class="examples-grid">${examples.map(e => `<div class="example-card"><div class="de">"${e.de}"</div><div class="pt">${e.pt}</div><span class="note">${e.note}</span></div>`).join('')}</div>`;
}

// ==================== FLASHCARDS & SRS ====================

let currentCardIndex = 0;

function renderFlashcard() {
  if (!state.flashcardsData.length) {
    document.getElementById('fcWord').textContent = '—';
    document.getElementById('fcTranslation').textContent = 'Nenhum flashcard';
    return;
  }
  
  const card = state.flashcardsData[currentCardIndex];
  document.getElementById('fcWord').textContent = card.word;
  document.getElementById('fcTranslation').textContent = card.translation;
  document.getElementById('fcExample').textContent = `"${card.example}"`;
  document.getElementById('fcProgress').textContent = `${currentCardIndex + 1} / ${state.flashcardsData.length}`;
  document.getElementById('flashcard').classList.remove('flipped');
}

function nextCard() {
  // Lógica SRS simplificada (avança e salva no localStorage)
  const card = state.flashcardsData[currentCardIndex];
  if (card && !state.srsProgress[card.id]) state.srsProgress[card.id] = { reviews: 1, due: Date.now() };
  
  currentCardIndex = (currentCardIndex + 1) % state.flashcardsData.length;
  localStorage.setItem('dh-srs', JSON.stringify(state.srsProgress));
  renderFlashcard();
  addXP(5);
}

// ==================== SHADOWING & CHATBOT ====================

let currentShadowIndex = 0;
const SHADOW_PHRASES = [
  {de:'Guten Morgen, wie geht es Ihnen?',pt:'Bom dia, como vai? (formal)'},
  {de:'Ich heiße Anna. Und du?',pt:'Eu me chamo Anna. E você?'},
  {de:'Ich komme aus Berlin.',pt:'Eu sou de Berlim.'}
];

function renderShadowPhrase() {
  const p = SHADOW_PHRASES[currentShadowIndex];
  document.getElementById('shadowGerman').textContent = p.de;
  document.getElementById('shadowTranslation').textContent = p.pt;
  document.getElementById('shadowProgress').textContent = `Frase ${currentShadowIndex + 1} de ${SHADOW_PHRASES.length}`;
}

function playShadowAudio() {
  const phrase = SHADOW_PHRASES[currentShadowIndex].de;
  const u = new SpeechSynthesisUtterance(phrase);
  u.lang = 'de-DE'; u.rate = 0.85;
  speechSynthesis.speak(u);
  addXP(3);
}

function nextShadowPhrase() {
  currentShadowIndex = (currentShadowIndex + 1) % SHADOW_PHRASES.length;
  renderShadowPhrase(); addXP(5);
}

// Chatbot Mock (Preparado para Groq API)
let currentChar = 'anna';
function initChatbot() {
  document.querySelectorAll('.char-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      document.querySelectorAll('.char-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      currentChar = btn.dataset.char;
      const msgs = document.getElementById('chatMessages');
      msgs.innerHTML = `<div class="chat-msg bot"><div class="msg-avatar">${PERSONAS[currentChar].name[0]}</div><div class="msg-bubble">${PERSONAS[currentChar].greeting}</div></div>`;
    });
  });
}

function sendMessage() {
  const input = document.getElementById('chatInput');
  const text = input.value.trim();
  if (!text) return;
  
  const msgs = document.getElementById('chatMessages');
  msgs.innerHTML += `<div class="chat-msg user"><div class="msg-avatar">US</div><div class="msg-bubble">${text}</div></div>`;
  msgs.scrollTop = msgs.scrollHeight;
  input.value = '';
  addXP(8);

  // Simulação de resposta (Aqui entraria o fetch para GROQ_API_ENDPOINT)
  const typingId = 'typing-' + Date.now();
  msgs.innerHTML += `<div class="chat-msg bot" id="${typingId}"><div class="msg-avatar">${PERSONAS[currentChar].name[0]}</div><div class="msg-bubble"><div class="typing-indicator"><span></span><span></span><span></span></div></div></div>`;
  
  setTimeout(() => {
    const el = document.getElementById(typingId);
    if (el) el.querySelector('.msg-bubble').textContent = 'Gut gemacht! 🎉'; // Resposta mock
    msgs.scrollTop = msgs.scrollHeight;
  }, 1500);
}

// ==================== UTILS, NAV & XP ====================

function navigateTo(page) {
  state.currentPage = page;
  document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
  document.getElementById('page-' + page)?.classList.add('active');
  document.querySelectorAll('.sidebar-item').forEach(item => item.classList.toggle('active', item.dataset.page === page));
  
  const titles = {dashboard:'Dashboard',modules:'Módulos',lesson:'Lição',flashcards:'Flashcards',shadowing:'Shadowing',chatbot:'Chatbot',notes:'Anotações'};
  document.getElementById('topbarTitle').textContent = titles[page] || page;

  if(page === 'modules') renderModules();
  if(page === 'flashcards') renderFlashcard();
  if(page === 'shadowing') renderShadowPhrase();
  closeSidebar();
}

function addXP(amount) {
  state.xp = Math.min(state.xp + amount, 5000);
  localStorage.setItem('dh-xp', state.xp);
  updateUIState();
  showToast(`+${amount} XP 🌟`, 'success');
}

function updateUIState() {
  const pct = (state.xp / 5000) * 100;
  document.getElementById('xpFill').style.width = pct + '%';
  document.getElementById('xpText').textContent = `${state.xp.toLocaleString('pt-BR')} / 5.000`;
  document.getElementById('streakNum').textContent = state.streak; // Atualize ID se necessário
}

function showToast(msg, type='info') {
  const t = document.createElement('div');
  t.className = `toast ${type}`;
  t.textContent = msg;
  document.body.appendChild(t);
  setTimeout(() => t.remove(), 2500);
}

function closeSidebar() { document.getElementById('sidebar').classList.remove('open'); document.getElementById('overlay').classList.remove('active'); }

// ==================== EVENT LISTENERS ====================
document.addEventListener('DOMContentLoaded', () => {
  initChatbot();
  renderShadowPhrase();
  updateStreak();
  updateUIState();
  
  // Auth Check (Mock ou Real)
  supabase.auth.getUser().then(({data}) => state.user = data.user);

  loadLevelData(state.currentLevel);
});

document.querySelectorAll('.level-tab').forEach(tab => {
  tab.addEventListener('click', () => {
    document.querySelectorAll('.level-tab').forEach(t => t.classList.remove('active'));
    tab.classList.add('active');
    loadLevelData(tab.dataset.level);
  });
});

document.querySelectorAll('.sidebar-item').forEach(item => item.addEventListener('click', () => navigateTo(item.dataset.page)));
document.getElementById('overlay').addEventListener('click', closeSidebar);

document.getElementById('btnPrevLesson').addEventListener('click', () => { if(state.lessonState.currentIndex > 0) { state.lessonState.currentIndex--; renderLesson(); } });
document.getElementById('btnNextLesson').addEventListener('click', () => { if(state.lessonState.currentIndex < state.lessonState.lessons.length - 1) { state.lessonState.currentIndex++; renderLesson(); } });
document.getElementById('btnCompleteLesson').addEventListener('click', () => {
  const slug = state.lessonState.lessons[state.lessonState.currentIndex];
  addXP(10);
  saveProgress(slug, 'completed'); // Sincronização Real!
  showToast('Lição Concluída! ✅', 'success');
});

document.getElementById('chatInput').addEventListener('keypress', e => { if(e.key === 'Enter') sendMessage(); });
document.getElementById('shadowPlay').addEventListener('click', playShadowAudio);
document.getElementById('shadowNext').addEventListener('click', nextShadowPhrase);
document.getElementById('flipCard').addEventListener('click', () => document.getElementById('flashcard').classList.toggle('flipped'));
document.getElementById('nextCardBtn').addEventListener('click', nextCard);