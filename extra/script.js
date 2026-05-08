// ==================== SUPABASE CONFIG ====================
// 🔑 SUBSTITUA PELAS SUAS CREDENCIAIS DO SUPABASE
const SUPABASE_URL = 'https://SEU-PROJETO.supabase.co'; 
const SUPABASE_ANON_KEY = 'SUA-CHAVE-ANON-AQUI';

const supabase = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// ==================== STATE & STATIC DATA ====================
let currentPage = 'dashboard';
let currentLevel = 'A1';
let currentCardIndex = 0;
let currentShadowIndex = 0;
let currentChar = 'anna';
let xp = 2450;
let streak = 12;
let editingNoteId = null;

let lessonState = {
  level: 'A1', module: null, lessons: [], currentIndex: 0, currentTab: 'dialogue'
};

// Dados que NÃO estão no SQL fornecido (mantidos estáticos localmente)
const shadowPhrases = [
  {german:'Guten Morgen, wie geht es Ihnen?',translation:'Bom dia, como vai? (formal)'},
  {german:'Ich heiße Anna. Und du?',translation:'Eu me chamo Anna. E você?'},
  {german:'Ich komme aus Berlin.',translation:'Eu sou de Berlim.'},
  {german:'Wie heißt du?',translation:'Como você se chama?'},
  {german:'Ich spreche Deutsch.',translation:'Eu falo alemão.'},
  {german:'Freut mich!',translation:'Prazer!'},
  {german:'Auf Wiedersehen!',translation:'Adeus!'},
  {german:'Tschüss, bis morgen!',translation:'Tchau, até amanhã!'},
  {german:'Danke, gut! Und dir?',translation:'Obrigado, bem! E você?'},
  {german:'Ja, ein bisschen.',translation:'Sim, um pouco.'}
];

const characters = {
  anna:{name:'Anna',role:'Professora',color:'#f97316',systemMsg:'Você é Anna, professora de alemão.'},
  lukas:{name:'Lukas',role:'Colega',color:'#3b82f6',systemMsg:'Você é Lukas, colega amigável.'},
  herr_mueller:{name:'Herr Müller',role:'Formal',color:'#22c55e',systemMsg:'Você é Herr Müller, formal e educado.'},
  lisa:{name:'Lisa',role:'Amiga',color:'#a855f7',systemMsg:'Você é Lisa, amiga jovem e descontraída.'}
};

const botResponses = {
  anna:['Sehr gut! 🎉','Das ist richtig!','Fast perfekt! Achte auf den Artikel.','Wunderbar!','Gut gemacht!'],
  lukas:['Hey, alles klar!','Cool!','Ja, genau!','Haha, das ist lustig!','Komm, wir üben zusammen. 💪'],
  herr_mueller:['Guten Tag.','Sehr korrekt.','Ausgezeichnet.','Ihr Deutsch ist gut.','Weiter so.'],
  lisa:['Hey!! Wie geht\'s? 😍','Omg das ist so cool! ✨','Haha ja genau!','Alter, du sprichst gut! 🔥','Komm, wir gehen trinken! 🎉']
};

const notesData = [
  {id:1,title:'Artigos - Dica rápida',content:'Der = masculino, Das = neutro, Die = feminino.',date:'2026-05-04'},
  {id:2,title:'Verbos separáveis',content:'Prefixos como ab-, auf-, an- se separam no presente.',date:'2026-05-03'},
  {id:3,title:'Dúvida - Akkusativ',content:'Preciso revisar quando usar Akkusativ vs. Dativ.',date:'2026-05-02'}
];
let notes = [...notesData];

// Containers dinâmicos (preenchidos pelo Supabase)
let modulesData = {};
let lessonsData = {};
let flashcardsData = [];

// ==================== CORE DATA LOADER ====================
async function loadLevelData(level) {
  const moduleList = document.getElementById('moduleList');
  moduleList.innerHTML = '<p style="color:var(--text-muted);text-align:center;padding:40px;">🔄 Carregando módulos do Supabase…</p>';

  try {
    // Busca paralela: Módulos + Lições + Flashcards
    const [{ data: modules, error: modErr }, { data: lessons, error: lessErr }, { data: cards, error: cardErr }] = await Promise.all([
      supabase.from('study_modules').select('slug, title_de, title_pt, sort_order, active').eq('level', level).eq('active', true).order('sort_order', { ascending: true }),
      supabase.from('study_lessons').select('slug, module_slug, title_pt, title_de, summary_pt, quick_rule_pt, examples, key_phrases, mini_notes, active').eq('level', level).eq('active', true).order('sort_order', { ascending: true }),
      supabase.from('flashcards_v2').select('front_de, back_pt, example_de, theme, active').eq('level', level).eq('curated', true).eq('active', true).order('theme', { ascending: true })
    ]);

    if (modErr) throw new Error('Módulos: ' + modErr.message);
    if (lessErr) throw new Error('Lições: ' + lessErr.message);
    if (cardErr) throw new Error('Flashcards: ' + cardErr.message);

    // 1. Transformar Lições para objeto indexado por slug
    lessonsData = {};
    lessons.forEach(l => {
      lessonsData[l.slug] = {
        module: l.module_slug,
        title_pt: l.title_pt,
        title_de: l.title_de,
        summary_pt: l.summary_pt,
        quick_rule: l.quick_rule_pt || '',
        examples: Array.isArray(l.examples) ? l.examples : [],
        key_phrases: Array.isArray(l.key_phrases) ? l.key_phrases : [],
        mini_notes: Array.isArray(l.mini_notes) ? l.mini_notes : []
      };
    });

    // 2. Transformar Flashcards
    flashcardsData = cards.map(c => ({
      word: c.front_de,
      translation: c.back_pt,
      example: c.example_de || ''
    }));
    currentCardIndex = 0; // Resetar índice

    // 3. Transformar Módulos (agrupar lições em "chapters")
    modulesData[level] = modules.map(m => {
      const modLessons = lessons.filter(l => l.module_slug === m.slug);
      const lessonSlugs = modLessons.map(l => l.slug);
      return {
        id: Math.round(m.sort_order / 10),
        slug: m.slug,
        title: m.title_de || m.slug,
        translation: m.title_pt || '',
        status: 'current', // Simplificado. Ideal: vir de tabela user_progress
        chapters: [{
          name: m.title_de,
          type: 'lesson',
          done: false,
          lessons: lessonSlugs.length > 0 ? lessonSlugs : ['']
        }]
      };
    });

    // Renderizar interface atualizada
    renderModules();
    if (currentPage === 'flashcards') renderFlashcard();
    if (currentPage === 'lesson') renderLesson();

  } catch (err) {
    console.error('❌ Erro ao carregar dados:', err);
    moduleList.innerHTML = `<p style="color:var(--error);text-align:center;padding:40px;">Erro ao conectar com Supabase:<br><small>${err.message}</small></p>`;
  }
}

// ==================== RENDER FUNCTIONS ====================
function renderModules() {
  const list = document.getElementById('moduleList');
  const modules = modulesData[currentLevel] || []; 
  if (!modules.length) {
    list.innerHTML = '<p style="color:var(--text-muted);text-align:center;padding:40px;">Nenhum módulo encontrado para este nível.</p>';
    return;
  }

  list.innerHTML = modules.map(m => `
    <div class="module-card">
      <div class="module-header" onclick="toggleModule(this)">
        <div class="module-header-left">
          <div class="module-num">${m.id}</div>
          <div>
            <div class="module-title">${m.title}</div>
            <div class="module-sub">${m.translation}</div>
          </div>
        </div>
      </div>
      <span class="module-status status-${m.status}">
        ${m.status==='done'?'✓ Concluído':m.status==='current'?'● Atual':'🔒 Bloqueado'}
      </span>
    </div>
    <div class="module-chapters">
      ${m.chapters.map(c => `
        <div class="chapter-item">
          <div class="chapter-check ${c.done?'done':''}" onclick="event.stopPropagation();this.classList.toggle('done')">${c.done?'✓':''}</div>
          <span class="chapter-name" onclick="openLesson('${currentLevel}','${m.slug}','${c.lessons[0]}')">${c.name}</span>
          <span class="chapter-type">${c.type}</span>
        </div>
      `).join('')}
    </div>
  `).join('');
}

function toggleModule(header) {
  const chapters = header.parentElement.querySelector('.module-chapters');
  chapters.classList.toggle('open');
}

// ==================== LESSON VIEW ====================
function openLesson(level, moduleSlug, lessonSlug) {
  const module = modulesData[level]?.find(m => m.slug === moduleSlug);
  if (!module) return;

  const allLessons = [];
  const seen = new Set();
  module.chapters.forEach(c => {
    c.lessons.forEach(l => {
      if (l && !seen.has(l)) { seen.add(l); allLessons.push(l); }
    });
  });

  const idx = allLessons.indexOf(lessonSlug);
  lessonState = {
    level, module: moduleSlug, lessons: allLessons,
    currentIndex: Math.max(0, idx), currentTab: 'dialogue'
  };
  
  renderLesson();
  navigateTo('lesson');
}

function renderLesson() {
  const lessonSlug = lessonState.lessons[lessonState.currentIndex];
  const lesson = lessonsData[lessonSlug];
  const module = modulesData[lessonState.level]?.find(m => m.slug === lessonState.module);

  document.getElementById('lessonBreadcrumbModule').textContent = lessonState.level;
  document.getElementById('lessonBreadcrumbChapter').textContent = module ? module.title : lessonState.module;
  document.getElementById('lessonTitle').textContent = lesson ? lesson.title_pt : 'Carregando lição…';
  document.getElementById('lessonSubtitle').textContent = lesson ? lesson.title_de : '';
  document.getElementById('lessonCounter').textContent = `Lição ${lessonState.currentIndex + 1} de ${lessonState.lessons.length}`;

  lessonState.currentTab = 'dialogue';
  document.querySelectorAll('.lesson-tab').forEach(t => t.classList.toggle('active', t.dataset.tab === 'dialogue'));
  document.querySelectorAll('.lesson-section').forEach(s => s.classList.toggle('active', s.id === 'tab-dialogue'));

  if (lesson) {
    const parts = lesson.summary_pt.split(/\n(?=[A-Z][a-z]+:)/);
    let dePart = '', ptPart = '';
    let inDe = false, inPt = false;
    parts.forEach(p => {
      if (p.startsWith('DIÁLOGO')) inDe = true;
      else if (p.startsWith('TRADUÇÃO')) { inDe = false; inPt = true; }
      else if (inDe) dePart += p + '\n';
      else if (inPt) ptPart += p + '\n';
    });
    document.getElementById('dialogueDe').innerHTML = formatDialogue(dePart, false);
    document.getElementById('dialoguePt').innerHTML = formatDialogue(ptPart, true);
    document.getElementById('grammarText').innerHTML = lesson.quick_rule;
    
    document.getElementById('grammarExamples').innerHTML = `
      <div class="examples-grid">
        ${lesson.examples.map(e => `
          <div class="example-card">
            <div class="de">"${e.de}"</div>
            <div class="pt">${e.pt}</div>
            <span class="note">${e.note}</span>
          </div>
        `).join('')}
      </div>
    `;
    document.getElementById('vocabGrid').innerHTML = lesson.key_phrases.map(v => `
      <div class="vocab-item"><div class="de">${v.de}</div><div class="pt">${v.pt}</div></div>
    `).join('');
    document.getElementById('cultureNotes').innerHTML = lesson.mini_notes.map(n => `
      <div class="note-item"><p>${n.replace(/^• /, '')}</p></div>
    `).join('');
  } else {
    document.getElementById('dialogueDe').innerHTML = '<p style="color:var(--text-muted)">Conteúdo indisponível.</p>';
    document.getElementById('dialoguePt').innerHTML = '';
    document.getElementById('grammarText').innerHTML = '';
    document.getElementById('grammarExamples').innerHTML = '';
    document.getElementById('vocabGrid').innerHTML = '';
    document.getElementById('cultureNotes').innerHTML = '';
  }

  document.getElementById('btnPrevLesson').disabled = lessonState.currentIndex === 0;
  document.getElementById('btnPrevLesson').style.opacity = lessonState.currentIndex === 0 ? '.5' : '1';
  document.getElementById('btnNextLesson').disabled = lessonState.currentIndex === lessonState.lessons.length - 1;
  document.getElementById('btnNextLesson').style.opacity = lessonState.currentIndex === lessonState.lessons.length - 1 ? '.5' : '1';
}

function formatDialogue(text, isPt) {
  const speakerClass = isPt ? 'speaker' : 'speaker';
  return text.trim().split('\n').filter(l => l.trim()).map(line => {
    const match = line.match(/^(\w+):\s*(.+)$/);
    return match 
      ? `<p><span class="${speakerClass}">${match[1]}:</span> ${match[2]}</p>`
      : `<p>${line}</p>`;
  }).join('');
}

// ==================== FLASHCARDS & SHADOWING ====================
function renderFlashcard() {
  if (!flashcardsData.length) {
    document.getElementById('fcWord').textContent = '—';
    document.getElementById('fcTranslation').textContent = 'Nenhum flashcard';
    document.getElementById('fcExample').textContent = '';
    document.getElementById('fcProgress').textContent = '0 / 0';
    return;
  }
  const card = flashcardsData[currentCardIndex];
  document.getElementById('fcWord').textContent = card.word;
  document.getElementById('fcTranslation').textContent = card.translation;
  document.getElementById('fcExample').textContent = `"${card.example}"`;
  document.getElementById('fcProgress').textContent = `${currentCardIndex + 1} / ${flashcardsData.length}`;
  document.getElementById('fcLevel').textContent = `Nível ${currentLevel}`;
  document.getElementById('flashcard').classList.remove('flipped');
}
function flipCard() { document.getElementById('flashcard').classList.toggle('flipped'); }
function nextCard() { currentCardIndex = (currentCardIndex + 1) % flashcardsData.length; renderFlashcard(); addXP(5); }
function cardAction(action) { if (action === 'like') addXP(10); else addXP(2); nextCard(); }

function renderShadowPhrase() {
  const phrase = shadowPhrases[currentShadowIndex];
  document.getElementById('shadowGerman').textContent = phrase.german;
  document.getElementById('shadowTranslation').textContent = phrase.translation;
  document.getElementById('shadowProgress').textContent = `Frase ${currentShadowIndex + 1} de ${shadowPhrases.length}`;
}
function playShadowAudio() {
  const phrase = shadowPhrases[currentShadowIndex].german;
  if ('speechSynthesis' in window) {
    const u = new SpeechSynthesisUtterance(phrase);
    u.lang = 'de-DE'; u.rate = 0.85;
    speechSynthesis.speak(u);
  }
  addXP(3);
}
function nextShadowPhrase() { currentShadowIndex = (currentShadowIndex + 1) % shadowPhrases.length; renderShadowPhrase(); addXP(5); }

// ==================== CHATBOT (MOCK) ====================
function initChatbot() {
  document.querySelectorAll('.char-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      document.querySelectorAll('.char-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      currentChar = btn.dataset.char;
      const char = characters[currentChar];
      document.getElementById('chatMessages').innerHTML = `
        <div class="chat-msg bot">
          <div class="msg-avatar">${char.name[0]}</div>
          <div class="msg-bubble">Hallo! Ich bin ${char.name}. Wie kann ich dir helfen? 😊</div>
        </div>`;
    });
  });
}
function sendMessage() {
  const input = document.getElementById('chatInput');
  const text = input.value.trim();
  if (!text) return;
  input.value = '';
  const msgs = document.getElementById('chatMessages');
  msgs.innerHTML += `<div class="chat-msg user"><div class="msg-avatar">US</div><div class="msg-bubble">${escapeHtml(text)}</div></div>`;
  msgs.scrollTop = msgs.scrollHeight;
  addXP(8);

  const char = characters[currentChar];
  const typingId = 'typing-' + Date.now();
  msgs.innerHTML += `<div class="chat-msg bot" id="${typingId}">
    <div class="msg-avatar">${char.name[0]}</div>
    <div class="msg-bubble"><div class="typing-indicator"><span></span><span></span><span></span></div></div>
  </div>`;
  msgs.scrollTop = msgs.scrollHeight;

  setTimeout(() => {
    const typingEl = document.getElementById(typingId);
    if (typingEl) {
      const responses = botResponses[currentChar];
      typingEl.querySelector('.msg-bubble').textContent = responses[Math.floor(Math.random() * responses.length)];
    }
    msgs.scrollTop = msgs.scrollHeight;
  }, 1200 + Math.random() * 800);
}
function escapeHtml(str) { const d = document.createElement('div'); d.textContent = str; return d.innerHTML; }

// ==================== NOTES & REVIEW ====================
function renderNotes() {
  const grid = document.getElementById('notesGrid');
  if (notes.length === 0) { grid.innerHTML = '<p style="color:var(--text-muted);text-align:center;padding:40px;">Nenhuma anotação ainda.</p>'; return; }
  grid.innerHTML = notes.map(n => `
    <div class="note-card">
      <h4>${escapeHtml(n.title)}</h4>
      <p>${escapeHtml(n.content)}</p>
      <div class="note-date">${n.date}</div>
      <div class="note-actions">
        <button onclick="editNote(${n.id})">Editar</button>
        <button class="del" onclick="deleteNote(${n.id})">Excluir</button>
      </div>
    </div>`).join('');
}
function openNoteModal(id) {
  editingNoteId = id || null;
  const modal = document.getElementById('noteModal');
  modal.classList.remove('hidden');
  if (id) {
    const note = notes.find(n => n.id === id);
    document.getElementById('noteModalTitle').textContent = 'Editar Anotação';
    document.getElementById('noteTitle').value = note.title;
    document.getElementById('noteContent').value = note.content;
  } else {
    document.getElementById('noteModalTitle').textContent = 'Nova Anotação';
    document.getElementById('noteTitle').value = '';
    document.getElementById('noteContent').value = '';
  }
}
function closeNoteModal() { document.getElementById('noteModal').classList.add('hidden'); editingNoteId = null; }
function saveNote() {
  const title = document.getElementById('noteTitle').value.trim();
  const content = document.getElementById('noteContent').value.trim();
  if (!title || !content) return;
  if (editingNoteId) {
    const note = notes.find(n => n.id === editingNoteId);
    note.title = title; note.content = content;
  } else {
    notes.unshift({id:Date.now(),title,content,date:new Date().toISOString().split('T')[0]});
  }
  closeNoteModal(); renderNotes(); addXP(10);
}
function editNote(id) { openNoteModal(id); }
function deleteNote(id) { notes = notes.filter(n => n.id !== id); renderNotes(); }

// ==================== NAVIGATION & XP ====================
function navigateTo(page) {
  currentPage = page;
  document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
  document.getElementById('page-' + page)?.classList.add('active');
  document.querySelectorAll('.sidebar-item').forEach(item => item.classList.toggle('active', item.dataset.page === page));
  
  const titles = {dashboard:'Dashboard',modules:'Módulos',lesson:'Lição',flashcards:'Flashcards',shadowing:'Shadowing',chatbot:'Chatbot',notes:'Anotações',review:'Revisão'};
  document.getElementById('topbarTitle').textContent = titles[page] || page;
  
  if(page === 'modules') renderModules();
  if(page === 'flashcards') renderFlashcard();
  if(page === 'shadowing') renderShadowPhrase();
  if(page === 'notes') renderNotes();
  closeSidebar();
}

function addXP(amount) {
  xp = Math.min(xp + amount, 3000);
  const pct = (xp / 3000) * 100;
  document.getElementById('xpFill').style.width = pct + '%';
  document.getElementById('xpText').textContent = `${xp.toLocaleString('pt-BR')} / 3.000`;
  document.getElementById('metricProgress').textContent = Math.round(pct) + '%';
}

// ==================== INIT & EVENTS ====================
document.addEventListener('DOMContentLoaded', () => {
  updateGreeting();
  loadLevelData('A1');
  initChatbot();
  renderShadowPhrase();
  renderNotes();
  addXP(0); // Inicializar barra
});

function updateGreeting() {
  const h = new Date().getHours();
  let greeting = 'Willkommen zurück! 👋';
  if(h < 12) greeting = 'Guten Morgen! ☀️';
  else if(h < 18) greeting = 'Guten Tag! 🌤️';
  else greeting = 'Guten Abend! 🌙';
  document.getElementById('greetingText').textContent = greeting;
}

document.querySelectorAll('.sidebar-item').forEach(item => item.addEventListener('click', () => navigateTo(item.dataset.page)));
document.querySelectorAll('.level-tab').forEach(tab => {
  tab.addEventListener('click', () => {
    document.querySelectorAll('.level-tab').forEach(t => t.classList.remove('active'));
    tab.classList.add('active');
    currentLevel = tab.dataset.level;
    loadLevelData(currentLevel);
  });
});
document.querySelectorAll('.lesson-tab').forEach(tab => {
  tab.addEventListener('click', () => {
    lessonState.currentTab = tab.dataset.tab;
    document.querySelectorAll('.lesson-tab').forEach(t => t.classList.remove('active'));
    tab.classList.add('active');
    document.querySelectorAll('.lesson-section').forEach(s => s.classList.remove('active'));
    document.getElementById('tab-' + tab.dataset.tab)?.classList.add('active');
  });
});

function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); document.getElementById('overlay').classList.toggle('active'); }
function closeSidebar() { document.getElementById('sidebar').classList.remove('open'); document.getElementById('overlay').classList.remove('active'); }
document.getElementById('overlay').addEventListener('click', closeSidebar);

function prevLesson() { if(lessonState.currentIndex > 0) { lessonState.currentIndex--; renderLesson(); } }
function nextLesson() { if(lessonState.currentIndex < lessonState.lessons.length - 1) { lessonState.currentIndex++; renderLesson(); } }
function completeLesson() {
  addXP(10);
  document.getElementById('metricChapters').textContent = parseInt(document.getElementById('metricChapters').textContent) + 1;
  const btn = event.target;
  btn.textContent = '✓ Concluído!'; btn.style.background = 'var(--success)';
  setTimeout(() => {
    btn.textContent = '✓ Concluir'; btn.style.background = '';
    if(lessonState.currentIndex < lessonState.lessons.length - 1) nextLesson();
  }, 1200);
}