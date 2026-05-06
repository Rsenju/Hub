// ==================== CONFIG SUPABASE ====================
const SUPABASE_URL = 'https://htefiqaxilufnewmycut.supabase.co';
const SUPABASE_KEY = 'sb_publishable__1bxoDUtOWsghhgfOpSz2A_qlwCtTo0';
const LT_ENDPOINT = '/api/languagetool';
const PEXELS_ENDPOINT = '/api/pexels';

let supabaseClient = null;
function getSupabase() {
  if (!supabaseClient && window.supabase) {
    supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_KEY);
  }
  return supabaseClient;
}

// ==================== FALLBACK DATA (se Supabase falhar) ====================
const FALLBACK_MODULES = {
  A1: [
    {id:1,title:'Begrüßung',translation:'Saudações',status:'done',chapters:[
      {name:'Hallo und Tschüss',type:'vocab',done:true},{name:'Sich vorstellen',type:'gramática',done:true},{name:'Formelle und informelle Begrüßung',type:'cultura',done:true}
    ]},
    {id:2,title:'Zahlen und Farben',translation:'Números e Cores',status:'done',chapters:[
      {name:'Zahlen 1-100',type:'vocab',done:true},{name:'Farben benennen',type:'vocab',done:true},{name:'Preise verstehen',type:'prática',done:true}
    ]},
    {id:3,title:'Einkaufen und Essen',translation:'Compras e Comida',status:'current',chapters:[
      {name:'Im Supermarkt',type:'vocab',done:true},{name:'Bestellen im Restaurant',type:'prática',done:false},{name:'Lebensmittel',type:'vocab',done:false},{name:'Der Dativ',type:'gramática',done:false}
    ]},
    {id:4,title:'Familie und Freunde',translation:'Família e Amigos',status:'locked',chapters:[
      {name:'Familienmitglieder',type:'vocab',done:false},{name:'Über Familie sprechen',type:'prática',done:false},{name:'Possessivartikel',type:'gramática',done:false}
    ]},
    {id:5,title:'Alltag und Routine',translation:'Dia a Dia',status:'locked',chapters:[
      {name:'Tagesablauf',type:'vocab',done:false},{name:'Uhrzeit',type:'gramática',done:false},{name:'Trennbare Verben',type:'gramática',done:false}
    ]}
  ],
  A2: [
    {id:6,title:'Reisen und Transport',translation:'Viagem e Transporte',status:'locked',chapters:[
      {name:'Am Bahnhof',type:'vocab',done:false},{name:'Wegbeschreibung',type:'prática',done:false},{name:'Perfekt',type:'gramática',done:false}
    ]},
    {id:7,title:'Arbeit und Beruf',translation:'Trabalho e Profissão',status:'locked',chapters:[
      {name:'Berufe',type:'vocab',done:false},{name:'Im Büro',type:'vocab',done:false},{name:'Modalverben',type:'gramática',done:false}
    ]},
    {id:8,title:'Gesundheit',translation:'Saúde',status:'locked',chapters:[
      {name:'Beim Arzt',type:'prática',done:false},{name:'Körperteile',type:'vocab',done:false},{name:'Imperativ',type:'gramática',done:false}
    ]}
  ],
  B1: [
    {id:9,title:'Medien und Kommunikation',translation:'Mídia e Comunicação',status:'locked',chapters:[
      {name:'Nachrichten lesen',type:'prática',done:false},{name:'Soziale Medien',type:'vocab',done:false},{name:'Konjunktiv II',type:'gramática',done:false}
    ]},
    {id:10,title:'Umwelt und Natur',translation:'Meio Ambiente e Natureza',status:'locked',chapters:[
      {name:'Umweltschutz',type:'vocab',done:false},{name:'Diskussion führen',type:'prática',done:false},{name:'Passiv',type:'gramática',done:false}
    ]},
    {id:11,title:'Kultur und Gesellschaft',translation:'Cultura e Sociedade',status:'locked',chapters:[
      {name:'Deutsche Feste',type:'cultura',done:false},{name:'Kunst und Musik',type:'vocab',done:false},{name:'Relativsätze',type:'gramática',done:false}
    ]}
  ]
};

// Cache local para evitar requisições repetidas
let modulesData = { ...FALLBACK_MODULES };
let modulesLoaded = false;

// ==================== OUTROS DADOS (mantidos estáticos) ====================
const flashcardsData = [
  {word:'Hallo',translation:'Olá',example:'Hallo, wie geht es dir?'},
  {word:'Guten Tag',translation:'Bom dia',example:'Guten Tag, Herr Müller.'},
  {word:'Danke',translation:'Obrigado',example:'Danke schön!'},
  {word:'Bitte',translation:'Por favor',example:'Ein Wasser, bitte.'},
  {word:'Entschuldigung',translation:'Desculpe',example:'Entschuldigung, wo ist der Bahnhof?'},
  {word:'Ja',translation:'Sim',example:'Ja, ich verstehe.'},
  {word:'Nein',translation:'Não',example:'Nein, danke.'},
  {word:'Auf Wiedersehen',translation:'Adeus',example:'Auf Wiedersehen und gute Reise!'},
  {word:'Ich heiße...',translation:'Eu me chamo...',example:'Ich heiße Maria.'},
  {word:'Wie geht es Ihnen?',translation:'Como vai? (formal)',example:'Wie geht es Ihnen heute?'},
  {word:'Der Apfel',translation:'A maçã',example:'Der Apfel ist rot.'},
  {word:'Das Wasser',translation:'A água',example:'Ich möchte das Wasser.'},
  {word:'Die Milch',translation:'O leite',example:'Die Milch ist kalt.'},
  {word:'Guten Morgen',translation:'Bom dia (manhã)',example:'Guten Morgen, zusammen!'},
  {word:'Gute Nacht',translation:'Boa noite',example:'Gute Nacht, schlaf gut.'},
  {word:'Tschüss',translation:'Tchau (informal)',example:'Tschüss, bis morgen!'},
  {word:'Ich verstehe',translation:'Eu entendo',example:'Ich verstehe die Aufgabe.'},
  {word:'Ich spreche Deutsch',translation:'Eu falo alemão',example:'Ich spreche ein bisschen Deutsch.'},
  {word:'Wo ist...?',translation:'Onde fica...?',example:'Wo ist der Supermarkt?'},
  {word:'Wie viel kostet das?',translation:'Quanto custa isso?',example:'Wie viel kostet das Brot?'}
];

const shadowPhrases = [
  {german:'Guten Morgen, wie geht es Ihnen?',translation:'Bom dia, como vai? (formal)'},
  {german:'Ich möchte einen Kaffee, bitte.',translation:'Eu gostaria de um café, por favor.'},
  {german:'Wo ist der nächste Bahnhof?',translation:'Onde fica a próxima estação de trem?'},
  {german:'Das Wetter ist heute sehr schön.',translation:'O tempo está muito bonito hoje.'},
  {german:'Können Sie das bitte wiederholen?',translation:'Pode repetir isso, por favor?'},
  {german:'Ich lerne seit drei Monaten Deutsch.',translation:'Estou aprendendo alemão há três meses.'},
  {german:'Meine Familie ist sehr groß.',translation:'Minha família é muito grande.'},
  {german:'Ich arbeite in einem Büro.',translation:'Eu trabalho em um escritório.'},
  {german:'Was machst du am Wochenende?',translation:'O que você faz no fim de semana?'},
  {german:'Entschuldigung, ich habe eine Frage.',translation:'Desculpe, eu tenho uma pergunta.'}
];

const reviewData = [
  {type:'grammar',title:'Der vs. Das vs. Die',desc:'Artigos definidos em alemão têm três gêneros. Pratique a identificação correta.',icon:'📝',solved:false},
  {type:'vocab',title:'Zahlen (Números)',desc:'Números de 1 a 100 em alemão, incluindo combinações como "einundzwanzig".',icon:'🔢',solved:false},
  {type:'grammar',title:'Präteritum vs. Perfekt',desc:'Os dois tempos passados do alemão e quando usar cada um.',icon:'⏰',solved:false},
  {type:'vocab',title:'Farben (Cores)',desc:'Vocabulário de cores e como usá-las em frases.',icon:'🎨',solved:false},
  {type:'grammar',title:'Dativ - Wann und Wie',desc:'Quando usar o caso dativo e como os artigos mudam.',icon:'📖',solved:false},
  {type:'vocab',title:'Essen und Trinken',desc:'Vocabulário sobre comida e bebida no contexto de restaurante.',icon:'🍽️',solved:false}
];

const notesData = [
  {id:1,title:'Artigos - Dica rápida',content:'Der = masculino, Das = neutro, Die = feminino. Sempre aprender o artigo junto com o substantivo!',date:'2026-05-04'},
  {id:2,title:'Verbos separáveis',content:'Prefixos como ab-, auf-, an- se separam no presente. Ex: "Ich stehe um 7 Uhr auf."',date:'2026-05-03'},
  {id:3,title:'Dúvida - Akkusativ',content:'Preciso revisar quando usar Akkusativ vs. Dativ. Alguns verbos sempre pedem Akkusativ.',date:'2026-05-02'}
];

// ==================== PERSONAS & CHATBOT ====================
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

const botResponses = {
  hans: [
    'Sehr gut! Deine Aussprache verbessert sich! 🎉',
    'Das ist richtig! Achte auf die Großschreibung der Nomen.',
    'Fast perfekt! Der Artikel muss "der Tisch" sein.',
    'Wunderbar! Jetzt versuche einen vollständigen Satz.',
    'Gut gemacht! Kannst du das im Perfekt sagen?'
  ],
  lukas: [
    'Hey, alles klar! Was geht ab?',
    'Krass, Digga! Du lernst echt schnell! 🔥',
    'Ja, genau! Am besten lernst du durch Sprechen.',
    'Haha, das ist lustig! Erzähl mir mehr.',
    'Komm, wir üben zusammen. Das wird schon! 💪'
  ],
  heidi: [
    'Das klingt nach einem tollen Plan! ✈️',
    'Super Idee! Packen Sie Ihren Koffer!',
    'Ja, genau! Auf Reisen spricht man so.',
    'Interessant! Wo möchten Sie hinreisen?',
    'Komm, wir üben Deutsch für deine nächste Reise! 🌍'
  ],
  petra: [
    'Ihr Satz ist fast perfekt. Nur ein kleiner Artikel-Fehler...',
    'Ausgezeichnet. Ich katalogisiere Ihren Fortschritt. 📚',
    'Sehr korrekt. Bitte achten Sie auf die Wortstellung.',
    'Ihr Deutsch ist bereits auf einem guten Niveau.',
    'Ich schlage vor, Sie lesen deutsche Literatur. Das hilft sehr.'
  ]
};

let currentChar = 'hans';
let charHistories = { hans: [], lukas: [], heidi: [], petra: [] };

// ==================== STATE ====================
let currentPage = 'dashboard';
let currentLevel = 'A1';
let currentCardIndex = 0;
let currentShadowIndex = 0;
let chatHistory = [];
let notes = [...notesData];
let reviewItems = [...reviewData];
let xp = 2450;
let streak = 12;
let editingNoteId = null;

// DOM cache
const DOM = {
  moduleList: null,
  chatMessages: null,
  chatInput: null,
  sendBtn: null,
  xpNum: null,
  streakNum: null,
  levelLabel: null,
  progressBar: null,
  libraryGrid: null,
  bossModal: null,
  shadowModal: null
};

// ==================== SUPABASE: CARREGAR MÓDULOS ====================
async function loadModulesFromSupabase() {
  if (modulesLoaded) return modulesData;

  const client = getSupabase();
  if (!client) {
    console.warn('[Supabase] Cliente não inicializado, usando fallback');
    return modulesData;
  }

  try {
    // 1. Busca módulos ativos ordenados por nível e ordem
    const {  modules, error: modError } = await client
      .from('study_modules')
      .select('slug, level, chapter_number, title_pt, title_de, focus, sort_order')
      .eq('active', true)
      .in('level', ['A1', 'A2', 'B1'])
      .order('level', { ascending: true })
      .order('sort_order', { ascending: true });

    if (modError) throw modError;
    if (!modules || modules.length === 0) {
      console.warn('[Supabase] Nenhum módulo encontrado, usando fallback');
      return modulesData;
    }

    // 2. Busca lições (capítulos) para cada módulo
    const {  lessons, error: lessError } = await client
      .from('study_lessons')
      .select('module_slug, slug, title_pt, title_de, summary_pt, quick_rule_pt, sort_order')
      .eq('active', true)
      .order('sort_order', { ascending: true });

    if (lessError) console.warn('[Supabase] Erro ao carregar lições:', lessError);

    // 3. Transforma para o formato esperado pela UI
    const formatted = { A1: [], A2: [], B1: [] };
    
    modules.forEach(mod => {
      // Agrupa lições do módulo
      const moduleLessons = (lessons || []).filter(l => l.module_slug === mod.slug);
      
      // Mapeia lições → chapters
      const chapters = moduleLessons.map((l, idx) => {
        // Deriva tipo baseado no conteúdo
        let type = 'vocab';
        if (l.quick_rule_pt?.toLowerCase().includes('gram') || l.summary_pt?.toLowerCase().includes('gram')) {
          type = 'gramática';
        } else if (l.summary_pt?.toLowerCase().includes('prátic') || l.title_pt?.toLowerCase().includes('dialog')) {
          type = 'prática';
        } else if (l.title_pt?.toLowerCase().includes('kultur') || l.title_pt?.toLowerCase().includes('cultura')) {
          type = 'cultura';
        }
        
        // Status simples: primeiras 2 lições = done
        const done = idx < 2;
        
        return {
          name: l.title_pt || l.title_de || `Lição ${idx + 1}`,
          type,
          done,
          slug: l.slug,
          summary: l.summary_pt
        };
      });

      // Se não houver lições, cria chapters padrão
      const finalChapters = chapters.length > 0 ? chapters : [
        { name: 'Introdução', type: 'vocab', done: true },
        { name: 'Gramática Básica', type: 'gramática', done: false },
        { name: 'Prática', type: 'prática', done: false }
      ];

      // Determina status do módulo
      let status = 'locked';
      if (mod.chapter_number <= 2) status = 'done';
      else if (mod.chapter_number === 3) status = 'current';

      const module = {
        id: mod.chapter_number || mod.slug,
        slug: mod.slug,
        title: mod.title_de || mod.title_pt,
        translation: mod.title_pt,
        description: mod.focus,
        status,
        chapters: finalChapters,
        sort_order: mod.sort_order
      };

      if (formatted[mod.level]) {
        formatted[mod.level].push(module);
      }
    });

    // Ordena módulos por sort_order dentro de cada nível
    ['A1', 'A2', 'B1'].forEach(level => {
      formatted[level].sort((a, b) => (a.sort_order || 0) - (b.sort_order || 0));
    });

    // Se encontrou dados válidos, atualiza o cache
    if (Object.values(formatted).some(arr => arr.length > 0)) {
      modulesData = formatted;
      modulesLoaded = true;
      console.log('✅ Módulos carregados do Supabase:', Object.keys(formatted).map(l => `${l}:${formatted[l].length}`));
    }

    return modulesData;

  } catch (err) {
    console.error('❌ Erro ao carregar módulos do Supabase:', err);
    console.warn('⚠️ Usando dados locais como fallback');
    return modulesData;
  }
}

// ==================== HELPER PARA RENDERIZAÇÃO ====================
async function getModulesByLevel(level) {
  if (!modulesLoaded) {
    await loadModulesFromSupabase();
  }
  return modulesData[level] || [];
}

// ==================== NAVIGATION ====================
async function navigateTo(page) {
  currentPage = page;
  document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
  document.getElementById('page-' + page)?.classList.add('active');
  
  document.querySelectorAll('.sidebar-item, .sidebar-link, .nav-pill, .bottom-nav-item').forEach(item => {
    item.classList.toggle('active', item.dataset.page === page);
  });

  const titles = {
    dashboard:'Dashboard', modules:'Módulos', flashcards:'Flashcards',
    shadowing:'Shadowing', chatbot:'Chatbot', notes:'Anotações', review:'Revisão', biblioteca:'Biblioteca'
  };
  const titleEl = document.getElementById('topbarTitle');
  if (titleEl) titleEl.textContent = titles[page] || page;

  if (page === 'modules') {
    await loadModulesFromSupabase();
    renderModules();
  }
  if (page === 'flashcards') renderFlashcard();
  if (page === 'shadowing') renderShadowPhrase();
  if (page === 'notes') renderNotes();
  if (page === 'review') renderReview();
  if (page === 'biblioteca') loadLibraryModules?.();
  
  closeSidebar();
}

// ==================== SIDEBAR MOBILE ====================
function toggleSidebar() {
  document.getElementById('sidebar')?.classList.toggle('open');
  document.getElementById('overlay')?.classList.toggle('active');
}

function closeSidebar() {
  document.getElementById('sidebar')?.classList.remove('open');
  document.getElementById('overlay')?.classList.remove('active');
}

document.getElementById('overlay')?.addEventListener('click', closeSidebar);

// ==================== GREETING ====================
function updateGreeting() {
  const h = new Date().getHours();
  let greeting = 'Willkommen zurück! 👋';
  if (h < 12) greeting = 'Guten Morgen! ☀️';
  else if (h < 18) greeting = 'Guten Tag! 🌤️';
  else greeting = 'Guten Abend! 🌙';
  const el = document.getElementById('greetingText');
  if (el) el.textContent = greeting;
}

// ==================== MODULES ====================
async function renderModules() {
  const list = DOM.moduleList || document.getElementById('moduleList');
  if (!list) return;
  
  const modules = await getModulesByLevel(currentLevel);
  
  if (modules.length === 0) {
    list.innerHTML = '<p class="text-center text-gray-500 py-6">Carregando módulos...</p>';
    return;
  }
  
  list.innerHTML = modules.map(m => `
    <div class="module-card" data-slug="${m.slug || ''}">
      <div class="module-header" onclick="toggleModule(this)">
        <div class="module-header-left">
          <div class="module-num">${m.id}</div>
          <div>
            <div class="module-title">${m.title}</div>
            <div class="module-sub">${m.translation || ''}</div>
          </div>
        </div>
        <span class="module-status status-${m.status}">
          ${m.status === 'done' ? '✓ Concluído' : m.status === 'current' ? '● Atual' : '🔒 Bloqueado'}
        </span>
      </div>
      <div class="module-chapters">
        ${m.chapters.map(c => `
          <div class="chapter-item" data-slug="${c.slug || ''}">
            <div class="chapter-check ${c.done ? 'done' : ''}">${c.done ? '✓' : ''}</div>
            <span class="chapter-name">${c.name}</span>
            <span class="chapter-type">${c.type}</span>
          </div>
        `).join('')}
      </div>
    </div>
  `).join('');
}

function toggleModule(header) {
  const chapters = header.parentElement?.querySelector('.module-chapters');
  if (chapters) chapters.classList.toggle('open');
}

// Tabs de nível
document.querySelectorAll('.level-tab')?.forEach(tab => {
  tab.addEventListener('click', async () => {
    document.querySelectorAll('.level-tab').forEach(t => t.classList.remove('active'));
    tab.classList.add('active');
    currentLevel = tab.dataset.level;
    
    if (!modulesLoaded) {
      await loadModulesFromSupabase();
    }
    renderModules();
  });
});

// ==================== FLASHCARDS ====================
function renderFlashcard() {
  const card = flashcardsData[currentCardIndex];
  if (!card) return;
  
  const els = {
    word: document.getElementById('fcWord'),
    translation: document.getElementById('fcTranslation'),
    example: document.getElementById('fcExample'),
    progress: document.getElementById('fcProgress'),
    level: document.getElementById('fcLevel'),
    flashcard: document.getElementById('flashcard')
  };
  
  if (els.word) els.word.textContent = card.word;
  if (els.translation) els.translation.textContent = card.translation;
  if (els.example) els.example.textContent = `"${card.example}"`;
  if (els.progress) els.progress.textContent = `${currentCardIndex + 1} / ${flashcardsData.length}`;
  if (els.level) els.level.textContent = `Nível ${currentLevel}`;
  if (els.flashcard) els.flashcard.classList.remove('flipped');
}

function flipCard() {
  document.getElementById('flashcard')?.classList.toggle('flipped');
}

function nextCard() {
  currentCardIndex = (currentCardIndex + 1) % flashcardsData.length;
  renderFlashcard();
  addXP(5);
}

function cardAction(action) {
  if (action === 'like') addXP(10);
  else addXP(2);
  nextCard();
}

// ==================== SHADOWING ====================
function renderShadowPhrase() {
  const phrase = shadowPhrases[currentShadowIndex];
  if (!phrase) return;
  
  const els = {
    german: document.getElementById('shadowGerman'),
    translation: document.getElementById('shadowTranslation'),
    progress: document.getElementById('shadowProgress')
  };
  
  if (els.german) els.german.textContent = phrase.german;
  if (els.translation) els.translation.textContent = phrase.translation;
  if (els.progress) els.progress.textContent = `Frase ${currentShadowIndex + 1} de ${shadowPhrases.length}`;
}

function playShadowAudio() {
  const phrase = shadowPhrases[currentShadowIndex]?.german;
  if (!phrase) return;
  
  if ('speechSynthesis' in window) {
    const utterance = new SpeechSynthesisUtterance(phrase);
    utterance.lang = 'de-DE';
    utterance.rate = 0.85;
    speechSynthesis.speak(utterance);
  } else {
    alert('Seu navegador não suporta síntese de voz.');
  }
  addXP(3);
}

function nextShadowPhrase() {
  currentShadowIndex = (currentShadowIndex + 1) % shadowPhrases.length;
  renderShadowPhrase();
  addXP(5);
}

// ==================== CHATBOT ====================
function selectChar(charKey) {
  currentChar = charKey;
  document.querySelectorAll('.char-btn').forEach(b => b.classList.toggle('active', b.dataset.char === charKey));
  const ch = PERSONAS[charKey];
  const msgs = DOM.chatMessages || document.getElementById('chatMessages');
  if (msgs) {
    msgs.innerHTML = '';
    addBotMessage(ch.greeting);
  }
  charHistories[charKey] = [];
}

async function sendChat() {
  const input = DOM.chatInput || document.getElementById('chatInput');
  const text = input?.value.trim();
  if (!text) return;
  
  input.value = '';
  const msgs = DOM.chatMessages || document.getElementById('chatMessages');
  if (!msgs) return;
  
  addUserMessage(text);
  
  const sendBtn = DOM.sendBtn || document.getElementById('sendBtn');
  if (sendBtn) sendBtn.disabled = true;

  const loadingId = addLoadingMessage();
  
  try {
    // Mock AI response (substitua por fetch('/api/groq') se tiver backend)
    setTimeout(() => {
      removeLoadingMessage(loadingId);
      const response = generateMockResponse(text, currentChar);
      addBotMessage(response);
      parseXPFromResponse(response);
      if (sendBtn) sendBtn.disabled = false;
    }, 1200);
  } catch (e) {
    removeLoadingMessage(loadingId);
    addBotMessage('⚠️ Verbindungsfehler. Versuche es erneut.');
    if (sendBtn) sendBtn.disabled = false;
  }
}

function addUserMessage(text) {
  const msgs = DOM.chatMessages || document.getElementById('chatMessages');
  if (!msgs) return;
  const div = document.createElement('div');
  div.className = 'chat-msg user';
  div.innerHTML = `<div class="chat-bubble">${escHtml(text)}</div>`;
  msgs.appendChild(div);
  msgs.scrollTop = msgs.scrollHeight;
}

function addBotMessage(text) {
  const msgs = DOM.chatMessages || document.getElementById('chatMessages');
  if (!msgs) return;
  
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
  msgs.appendChild(div);
  msgs.scrollTop = msgs.scrollHeight;
}

function addLoadingMessage() {
  const msgs = DOM.chatMessages || document.getElementById('chatMessages');
  if (!msgs) return null;
  const id = 'loading-' + Date.now();
  const div = document.createElement('div');
  div.className = 'chat-msg bot';
  div.id = id;
  div.innerHTML = `<div class="chat-bubble"><div class="typing-indicator"><span></span><span></span><span></span></div></div>`;
  msgs.appendChild(div);
  msgs.scrollTop = msgs.scrollHeight;
  return id;
}

function removeLoadingMessage(id) {
  const el = document.getElementById(id);
  if (el) el.remove();
}

function generateMockResponse(input, persona) {
  const lower = input.toLowerCase();
  const responses = botResponses[persona] || botResponses.hans;
  
  if (persona === 'hans') {
    if (lower.includes('hallo') || lower.includes('olá')) return 'Guten Tag! Wie geht es Ihnen?';
    if (lower.includes('wie geht')) return 'Mir geht es gut, danke. Und Ihnen?';
    return 'Das ist interessant. Bitte achten Sie auf die Großschreibung der Nomen!';
  }
  if (persona === 'lukas') {
    if (lower.includes('hallo') || lower.includes('oi')) return 'Moin! Was geht ab?';
    if (lower.includes('lernen') || lower.includes('aprender')) return 'Ja, Deutsch lernen ist krass! Viel Erfolg, Digga.';
    return 'Alles klar! Lass uns chillen und üben.';
  }
  if (persona === 'heidi') {
    if (lower.includes('reisen') || lower.includes('viagem')) return 'Das klingt nach einem tollen Plan! Packen Sie Ihren Koffer!';
    return 'Super Idee! Auf Reisen spricht man so.';
  }
  if (persona === 'petra') {
    return 'Ihr Satz ist fast perfekt. Nur ein kleiner Artikel-Fehler... korrigiere ich sofort.';
  }
  return responses[Math.floor(Math.random() * responses.length)];
}

function parseXPFromResponse(raw) {
  const match = raw?.match(/XP:\s*(\d+)/);
  if (match) addXP(parseInt(match[1]), 'Resposta do Chatbot');
}

function markCorrectionRead(btn) {
  addXP(10, 'Correção lida');
  btn.textContent = '✓ XP ganho!'; 
  btn.disabled = true; 
  btn.style.opacity = '0.5';
}

function escHtml(s) {
  return String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/\n/g, '<br>');
}

// ==================== NOTES ====================
function renderNotes() {
  const grid = DOM.libraryGrid || document.getElementById('notesGrid');
  if (!grid) return;
  
  if (notes.length === 0) {
    grid.innerHTML = '<p style="color:var(--text-muted);text-align:center;padding:40px">Nenhuma anotação ainda. Crie sua primeira!</p>';
    return;
  }
  
  grid.innerHTML = notes.map(n => `
    <div class="note-card">
      <h4>${escHtml(n.title)}</h4>
      <p>${escHtml(n.content)}</p>
      <div class="note-date">${n.date}</div>
      <div class="note-actions">
        <button onclick="editNote(${n.id})">Editar</button>
        <button class="del" onclick="deleteNote(${n.id})">Excluir</button>
      </div>
    </div>
  `).join('');
}

function openNoteModal(id) {
  editingNoteId = id || null;
  const modal = document.getElementById('noteModal');
  if (!modal) return;
  
  modal.classList.remove('hidden');
  
  const titleInput = document.getElementById('noteTitle');
  const contentInput = document.getElementById('noteContent');
  const titleEl = document.getElementById('noteModalTitle');
  
  if (id) {
    const note = notes.find(n => n.id === id);
    if (titleEl) titleEl.textContent = 'Editar Anotação';
    if (titleInput) titleInput.value = note?.title || '';
    if (contentInput) contentInput.value = note?.content || '';
  } else {
    if (titleEl) titleEl.textContent = 'Nova Anotação';
    if (titleInput) titleInput.value = '';
    if (contentInput) contentInput.value = '';
  }
}

function closeNoteModal() {
  document.getElementById('noteModal')?.classList.add('hidden');
  editingNoteId = null;
}

function saveNote() {
  const titleInput = document.getElementById('noteTitle');
  const contentInput = document.getElementById('noteContent');
  
  const title = titleInput?.value.trim();
  const content = contentInput?.value.trim();
  
  if (!title || !content) return;
  
  if (editingNoteId) {
    const note = notes.find(n => n.id === editingNoteId);
    if (note) {
      note.title = title;
      note.content = content;
    }
  } else {
    notes.unshift({
      id: Date.now(),
      title,
      content,
      date: new Date().toISOString().split('T')[0]
    });
  }
  closeNoteModal();
  renderNotes();
  addXP(10);
}

function editNote(id) {
  openNoteModal(id);
}

function deleteNote(id) {
  notes = notes.filter(n => n.id !== id);
  renderNotes();
}

// ==================== REVIEW ====================
function renderReview() {
  const container = document.getElementById('reviewCards');
  if (!container) return;
  
  const iconColors = {
    'grammar':'rgba(249,115,22,.15)',
    'vocab':'rgba(168,85,247,.15)',
    'prática':'rgba(59,130,246,.15)'
  };
  const iconTextColors = {
    'grammar':'var(--accent)',
    'vocab':'var(--purple)',
    'prática':'var(--blue)'
  };
  
  container.innerHTML = reviewItems.map((r,i) => `
    <div class="review-card">
      <div class="review-icon" style="background:${iconColors[r.type]||'rgba(249,115,22,.15)'};color:${iconTextColors[r.type]||'var(--accent)'}">
        <span style="font-size:1.2rem">${r.icon}</span>
      </div>
      <div class="review-content">
        <h4>${r.title}</h4>
        <p>${r.desc}</p>
        <div class="review-actions">
          <button class="btn btn-primary btn-sm" onclick="markReviewDone(${i})">
            ${r.solved ? 'Revisar novamente' : 'Marcar como revisado'}
          </button>
        </div>
      </div>
    </div>
  `).join('');
}

function markReviewDone(index) {
  reviewItems[index].solved = !reviewItems[index].solved;
  renderReview();
  addXP(15);
}

// ==================== XP SYSTEM ====================
function addXP(amount, reason = 'Atividade') {
  xp = Math.min(xp + amount, 3000);
  updateUI();
  showToast(`+${amount} XP: ${reason}`, 'success');
}

function updateUI() {
  if (DOM.xpNum) DOM.xpNum.innerText = xp;
  if (DOM.streakNum) DOM.streakNum.innerText = streak;
  if (DOM.levelLabel) DOM.levelLabel.innerText = currentLevel;
  
  const progress = Math.min((xp % 500) / 500 * 100, 100);
  if (DOM.progressBar) DOM.progressBar.style.width = `${progress}%`;

  const xpPanel = document.querySelector('.xp-panel');
  const streakBadge = document.querySelector('.streak-badge');
  
  xpPanel?.classList.toggle('empty', xp === 0);
  streakBadge?.classList.toggle('zero', streak === 0);
}

function showToast(msg, type = 'info') {
  const toast = document.createElement('div');
  toast.className = `toast ${type}`;
  toast.innerText = msg;
  document.body.appendChild(toast);
  setTimeout(() => toast.remove(), 3000);
}

// ==================== BOSS FIGHT & SHADOWING MODAL ====================
const BOSS_PHRASES = {
  A1: [{ de: 'Ich heiße Rebeca und ich komme aus Brasilien.', pt: 'Meu nome é Rebeca e eu venho do Brasil.' }],
  A2: [{ de: 'Ich habe gestern im Restaurant gegessen.', pt: 'Eu comi no restaurante ontem.' }],
  B1: [{ de: 'Obwohl es regnet, gehe ich spazieren.', pt: 'Embora esteja chovendo, vou caminhar.' }]
};

window.startBossFight = function() {
  const modal = DOM.bossModal || document.getElementById('bossModal');
  if (!modal) return;
  
  const bossState = { active: true, round: 0, score: 0, phrases: BOSS_PHRASES[currentLevel] || BOSS_PHRASES.A1, total: 5 };
  modal.style.display = 'flex';
  
  document.getElementById('bossLevel')?.textContent = currentLevel;
  startBossRound(bossState);
};

function startBossRound(bossState) {
  const round = bossState.round;
  if (round >= bossState.total) { endBossFight(); return; }
  
  const phrase = bossState.phrases[round];
  document.getElementById('bossTranslation')?.textContent = phrase.pt;
  const input = document.getElementById('bossInput');
  if (input) input.value = '';
  speak(phrase.de, false);
}

window.checkBossAnswer = function() {
  const input = document.getElementById('bossInput');
  if (!input) return;
  
  const inputValue = input.value.toLowerCase();
  const phrase = BOSS_PHRASES[currentLevel]?.[0];
  if (!phrase) return;
  
  const ok = inputValue.includes(phrase.de.toLowerCase()) || 
             inputValue.replace(/[.,!?]/g, '') === phrase.de.toLowerCase().replace(/[.,!?]/g, '');
  
  const feedback = document.getElementById('bossFeedback');
  if (feedback) {
    feedback.innerHTML = ok 
      ? '<span style="color:var(--green)">✅ Richtig! +50 XP</span>' 
      : '<span style="color:var(--red)">❌ Falsch! Tente novamente.</span>';
  }
  
  if (ok) addXP(50, 'Boss Fight Victory');
  setTimeout(() => { 
    // Simple round advance for demo
  }, 1500);
};

function endBossFight() {
  const modal = DOM.bossModal || document.getElementById('bossModal');
  if (modal) modal.style.display = 'none';
  showToast('🏆 Boss Fight Concluído!', 'success');
}

window.startShadowing = function() {
  const modal = DOM.shadowModal || document.getElementById('shadowModal');
  if (modal) modal.style.display = 'flex';
  
  const phrase = 'Guten Morgen, wie geht es Ihnen?';
  document.getElementById('shadow-phrase')?.innerText = phrase;
  speak(phrase, true);
  showToast('🎤 Modo Shadowing ativo!', 'info');
};

// ==================== SPEECH ====================
window.speak = function(text, slow) {
  if ('speechSynthesis' in window) {
    window.speechSynthesis.cancel();
    const u = new SpeechSynthesisUtterance(text);
    u.lang = 'de-DE'; 
    u.rate = slow ? 0.5 : 0.95;
    window.speechSynthesis.speak(u);
  }
};

// ==================== FILTERS ====================
window.setFilter = function(level) {
  document.querySelectorAll('.filter-chip').forEach(chip => {
    chip.classList.toggle('active', chip.dataset.filter === level);
  });
  currentLevel = level;
  renderModules();
}

window.setThemeFilter = function(theme) {
  document.querySelectorAll('.category-card').forEach(card => {
    card.classList.toggle('active', card.dataset.theme === theme);
  });
  console.log(`🎯 Tema selecionado: ${theme}`);
}

// ==================== SHOW PAGE ====================
window.showPage = function(pageId) {
  document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
  document.getElementById(`page-${pageId}`)?.classList.add('active');
  if (pageId === 'flashcards') renderFlashcards?.();
  if (pageId === 'biblioteca') loadLibraryModules?.();
}

// ==================== INIT DOM & AUTH ====================
function initAuth() {
  const userId = localStorage.getItem('dh-user-id') || 'guest-' + (crypto?.randomUUID?.() || 'anon');
  localStorage.setItem('dh-user-id', userId);
}

function setupNavigation() {
  document.querySelectorAll('.sidebar-item, .sidebar-link, .nav-pill, .bottom-nav-item').forEach(btn => {
    btn.addEventListener('click', (e) => {
      const pageId = e.currentTarget?.dataset.page;
      if (pageId) navigateTo(pageId);

      if (btn.classList.contains('bottom-nav-item')) {
        document.querySelectorAll('.bottom-nav-item').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
      }
    });
  });
}

function initDOM() {
  DOM.moduleList = document.getElementById('moduleList');
  DOM.chatMessages = document.getElementById('chatMessages');
  DOM.chatInput = document.getElementById('chatInput');
  DOM.sendBtn = document.getElementById('sendBtn');
  DOM.xpNum = document.getElementById('xpNum');
  DOM.streakNum = document.getElementById('streakNum');
  DOM.levelLabel = document.getElementById('levelLabel');
  DOM.progressBar = document.getElementById('progressBar');
  DOM.libraryGrid = document.getElementById('libraryGrid');
  DOM.bossModal = document.getElementById('bossModal');
  DOM.shadowModal = document.getElementById('shadowModal');
}

// ==================== MAIN INIT ====================
document.addEventListener('DOMContentLoaded', async () => {
  initAuth();
  initDOM();
  setupNavigation();
  
  // Carrega dados salvos
  const savedXP = parseInt(localStorage.getItem('dh-xp') || '0');
  const savedStreak = parseInt(localStorage.getItem('dh-streak') || '0');
  if (savedXP) xp = savedXP;
  if (savedStreak) streak = savedStreak;
  
  // Carrega módulos do Supabase primeiro
  await loadModulesFromSupabase();
  
  // Renderiza componentes
  updateGreeting();
  updateUI();
  renderModules();
  renderFlashcard();
  renderShadowPhrase();
  selectChar('hans');
  renderNotes();
  renderReview();
  
  // Gamificação
  if (typeof loadLibraryModules === 'function') loadLibraryModules();
  
  console.log('🇩🇪 Deutsch Hub v2.0 iniciado!');
});

// Expor funções globais
window.navigateTo = navigateTo;
window.toggleSidebar = toggleSidebar;
window.flipCard = flipCard;
window.nextCard = nextCard;
window.cardAction = cardAction;
window.playShadowAudio = playShadowAudio;
window.nextShadowPhrase = nextShadowPhrase;
window.selectChar = selectChar;
window.sendChat = sendChat;
window.speak = speak;
window.openNoteModal = openNoteModal;
window.closeNoteModal = closeNoteModal;
window.saveNote = saveNote;
window.editNote = editNote;
window.deleteNote = deleteNote;
window.markReviewDone = markReviewDone;
window.setFilter = setFilter;
window.setThemeFilter = setThemeFilter;
window.showPage = showPage;
window.startBossFight = startBossFight;
window.checkBossAnswer = checkBossAnswer;
window.startShadowing = startShadowing;