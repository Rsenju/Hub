// 1. CONFIGURAÇÃO DO SUPABASE
const supabaseUrl = 'https://htefiqaxilufnewmycut.supabase.co';
const supabaseKey = 'sb_publishable__1bxoDUtOWsghhgfOpSz2A_qlwCtTo0'; // Sua chave pública
const client = supabase.createClient(supabaseUrl, supabaseKey);

// ===================================================
// ESTADO GLOBAL
// ===================================================
let state = {
    user: null,
    xp: 0,
    streak: 0,
    level: 'A1', // A1, A2, B1
    srsProgress: {}, // { cardId: { interval: 1, ease: 2.5, nextReview: timestamp } }
    activePersona: 'hans',
    chatHistory: []
};

// Cache de DOM
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

// ===================================================
// INICIALIZAÇÃO
// ===================================================
document.addEventListener('DOMContentLoaded', async () => {
    await loadUserProfile();
    setupNavigation();
    await loadFlashcards();
    await loadLibraryModules();
    updateUI();
});

async function loadUserProfile() {
    // Tenta buscar do Supabase, senão usa LocalStorage
    const localXP = localStorage.getItem('dh-xp') || 0;
    const localStreak = localStorage.getItem('dh-streak') || 0;
    
    state.xp = parseInt(localXP);
    state.streak = parseInt(localStreak);
    state.level = 'A1'; // Define inicial
    updateUI();
}

// ===================================================
// NAVEGAÇÃO (PÁGINAS)
// ===================================================
function setupNavigation() {
    // Sidebar links
    document.querySelectorAll('.sidebar-link, .nav-pill').forEach(btn => {
        btn.addEventListener('click', (e) => {
            const pageId = e.currentTarget.dataset.page;
            if(pageId) showPage(pageId);
        });
    });
}

function showPage(pageId) {
    document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
    document.getElementById(`page-${pageId}`)?.classList.add('active');
    
    // Atualiza estado visual
    document.querySelectorAll('.sidebar-link').forEach(l => l.classList.remove('active'));
    document.querySelector(`.sidebar-link[data-page="${pageId}"]`)?.classList.add('active');
}

// ===================================================
// GAMIFICAÇÃO (XP & STREAK)
// ===================================================
function addXP(amount, reason) {
    state.xp += amount;
    localStorage.setItem('dh-xp', state.xp);
    updateUI();
    
    // Feedback visual (Toast)
    showToast(`+${amount} XP: ${reason}`, 'success');
}

function updateUI() {
    if(DOM.xpNum) DOM.xpNum.innerText = state.xp;
    if(DOM.streakNum) DOM.streakNum.innerText = state.streak;
    if(DOM.levelLabel) DOM.levelLabel.innerText = state.level;
    
    // Barra de progresso (simulada: 1000 XP = Level Up)
    const progress = Math.min((state.xp % 500) / 500 * 100, 100);
    if(DOM.progressBar) DOM.progressBar.style.width = `${progress}%`;
}

function showToast(msg, type = 'info') {
    const toast = document.createElement('div');
    toast.className = `toast ${type}`;
    toast.innerText = msg;
    document.body.appendChild(toast);
    setTimeout(() => toast.remove(), 3000);
}

// ===================================================
// FLASHCARDS & SRS
// ===================================================
let flashcards = [];

async function loadFlashcards() {
    // 1. Tenta buscar do Supabase
    try {
        const { data, error } = await client
            .from('flashcards_v2')
            .select('*')
            .eq('active', true)
            .order('level');
            
        if (!error && data) {
            flashcards = data;
        } else {
            // Fallback para dados locais se não houver conexão
            flashcards = getFallbackFlashcards();
        }
    } catch (e) {
        flashcards = getFallbackFlashcards();
    }
    
    renderFlashcards();
}

// Dados Fallback baseados no A1 1-20 que você enviou
function getFallbackFlashcards() {
    return [
        { id: 'a1-01', level: 'A1', front_de: 'Guten Morgen!', back_pt: 'Bom dia!', tags: ['cumprimentos'] },
        { id: 'a1-02', level: 'A1', front_de: 'Wie heißt du?', back_pt: 'Como você se chama?', tags: ['apresentação'] },
        { id: 'a1-03', level: 'A1', front_de: 'Ich heiße...', back_pt: 'Eu me chamo...', tags: ['apresentação'] },
        { id: 'a1-04', level: 'A1', front_de: 'Ich komme aus Brasilien.', back_pt: 'Eu sou do Brasil.', tags: ['origem'] },
        { id: 'a1-05', level: 'A1', front_de: 'Freut mich!', back_pt: 'Prazer!', tags: ['social'] },
        { id: 'a1-06', level: 'A1', front_de: 'Was machst du gern?', back_pt: 'O que você gosta de fazer?', tags: ['hobbies'] },
        { id: 'a1-07', level: 'A1', front_de: 'Ich spiele gern Fußball.', back_pt: 'Eu gosto de jogar futebol.', tags: ['hobbies'] },
        { id: 'a1-08', level: 'A1', front_de: 'Entschuldigung, wo ist der Bahnhof?', back_pt: 'Com licença, onde fica a estação?', tags: ['direções'] },
        { id: 'a1-09', level: 'A1', front_de: 'Geradeaus und dann links.', back_pt: 'Em frente e depois à esquerda.', tags: ['direções'] },
        { id: 'a1-10', level: 'A1', front_de: 'Ich hätte gern einen Kaffee.', back_pt: 'Eu gostaria de um café.', tags: ['restaurante'] },
        { id: 'a1-11', level: 'A1', front_de: 'Die Rechnung, bitte.', back_pt: 'A conta, por favor.', tags: ['restaurante'] },
        { id: 'a1-12', level: 'A1', front_de: 'Tschüss!', back_pt: 'Tchau!', tags: ['despedida'] }
    ];
}

function renderFlashcards(filter = 'all') {
    DOM.flashcardGrid.innerHTML = '';
    
    const filtered = filter === 'all' 
        ? flashcards 
        : flashcards.filter(c => c.level === filter);

    filtered.forEach(card => {
        const el = document.createElement('div');
        el.className = 'flashcard';
        el.dataset.id = card.id;
        el.innerHTML = `
            <div class="card-face front">${card.front_de}</div>
            <div class="card-face back">
                <div class="meaning">${card.back_pt}</div>
                <div class="srs-controls">
                    <button onclick="rateCard('${card.id}', 'hard')" class="btn-hard">Hard</button>
                    <button onclick="rateCard('${card.id}', 'medium')" class="btn-med">Good</button>
                    <button onclick="rateCard('${card.id}', 'easy')" class="btn-easy">Easy</button>
                </div>
            </div>
        `;
        
        // Flip logic
        el.addEventListener('click', (e) => {
            if(!e.target.closest('.srs-controls')) {
                el.classList.toggle('flipped');
                // Audio TTS ao virar
                if(el.classList.contains('flipped')) speak(card.front_de);
            }
        });
        
        DOM.flashcardGrid.appendChild(el);
    });
}

function rateCard(cardId, difficulty) {
    const cardEl = document.querySelector(`.flashcard[data-id="${cardId}"]`);
    if(!cardEl) return;
    
    // SRS Logic (Simplified)
    let current = state.srsProgress[cardId] || { interval: 1, ease: 2.5 };
    let xpGain = 0;
    
    if(difficulty === 'hard') {
        current.interval = 1;
        current.ease = Math.max(1.3, current.ease - 0.2);
        xpGain = 5;
    } else if (difficulty === 'medium') {
        current.interval = Math.round(current.interval * current.ease);
        xpGain = 10;
    } else { // easy
        current.interval = Math.round(current.interval * current.ease * 1.5);
        current.ease += 0.15;
        xpGain = 15;
    }
    
    state.srsProgress[cardId] = current;
    
    // Animation & XP
    cardEl.style.transform = 'scale(0.9) rotateY(180deg)';
    cardEl.style.opacity = '0.5';
    addXP(xpGain, `Card Review (${difficulty})`);
    
    setTimeout(() => cardEl.remove(), 300);
}

// ===================================================
// TTS (TEXT TO SPEECH)
// ===================================================
function speak(text) {
    if ('speechSynthesis' in window) {
        window.speechSynthesis.cancel();
        const utterance = new SpeechSynthesisUtterance(text);
        utterance.lang = 'de-DE';
        utterance.rate = 0.9;
        window.speechSynthesis.speak(utterance);
    }
}

// ===================================================
// CHATBOT
// ===================================================
const personas = {
    hans: {
        name: 'Hans',
        avatar: '👨‍',
        desc: 'Professor rigoroso. Foca em gramática.',
        prompt: 'Você é Hans, um professor de alemão rigoroso mas justo. Responda apenas em alemão, corrigindo erros gramaticais do aluno se houver.'
    },
    lukas: {
        name: 'Lukas',
        avatar: '🧢',
        desc: 'Estudante casual. Usa gírias.',
        prompt: 'Você é Lukas, um amigo estudante em Berlim. Fale de forma casual, use gírias jovens e responda em alemão simples.'
    }
};

function setPersona(id) {
    state.activePersona = id;
    document.querySelectorAll('.persona-btn').forEach(b => b.classList.remove('active'));
    document.querySelector(`.persona-btn[data-id="${id}"]`)?.classList.add('active');
    
    // Limpa chat
    DOM.chatMessages.innerHTML = '';
    addBotMessage(personas[id].desc);
}

DOM.sendBtn.addEventListener('click', sendChat);
DOM.chatInput.addEventListener('keypress', (e) => { if(e.key === 'Enter') sendChat(); });

async function sendChat() {
    const text = DOM.chatInput.value.trim();
    if(!text) return;
    
    addUserMessage(text);
    DOM.chatInput.value = '';
    
    // Simula delay de "digitando..."
    const loadingId = addLoadingMessage();
    
    try {
        // Aqui você conectaria com OpenAI/Groq no backend
        // Por enquanto, simulamos uma resposta baseada na persona
        setTimeout(() => {
            removeLoadingMessage(loadingId);
            const response = generateMockResponse(text, state.activePersona);
            addBotMessage(response);
            speak(response);
        }, 1500);
    } catch (e) {
        addBotMessage("Desculpe, erro de conexão.");
    }
}

function addUserMessage(text) {
    const div = document.createElement('div');
    div.className = 'msg user';
    div.innerText = text;
    DOM.chatMessages.appendChild(div);
    DOM.chatMessages.scrollTop = DOM.chatMessages.scrollHeight;
}

function addBotMessage(text) {
    const div = document.createElement('div');
    div.className = 'msg bot';
    div.innerHTML = `<strong>${personas[state.activePersona].avatar} ${personas[state.activePersona].name}:</strong> ${text}`;
    DOM.chatMessages.appendChild(div);
    DOM.chatMessages.scrollTop = DOM.chatMessages.scrollHeight;
}

function addLoadingMessage() {
    const id = 'loading-' + Date.now();
    const div = document.createElement('div');
    div.id = id;
    div.className = 'msg bot loading';
    div.innerText = '...';
    DOM.chatMessages.appendChild(div);
    DOM.chatMessages.scrollTop = DOM.chatMessages.scrollHeight;
    return id;
}

function removeLoadingMessage(id) {
    document.getElementById(id)?.remove();
}

// Mock response generator (Para funcionar sem Backend AI por enquanto)
function generateMockResponse(input, persona) {
    const lower = input.toLowerCase();
    
    if (persona === 'hans') {
        if(lower.includes('hallo') || lower.includes('hi')) return 'Guten Tag! Wie geht es Ihnen?';
        if(lower.includes('wie geht')) return 'Mir geht es gut, danke. Und Ihnen?';
        return 'Das ist interessant. Bitte achten Sie auf die Großschreibung der Nomen!';
    }
    
    if (persona === 'lukas') {
        if(lower.includes('hallo')) return 'Moin! Was geht ab?';
        if(lower.includes('lernen')) return 'Ja, Deutsch lernen ist krass! Viel Erfolg, Digga.';
        return 'Alles klar! Lass uns chillen und üben.';
    }
    
    return 'Entschuldigung, ich verstehe das nicht ganz.';
}

// ===================================================
// BIBLIOTECA DE ESTUDOS (MÓDULOS)
// ===================================================
async function loadLibraryModules() {
    try {
        // Tenta buscar módulos do Supabase
        const { data, error } = await client
            .from('study_modules')
            .select('*')
            .order('chapter_number');
            
        if(!error && data && data.length > 0) {
            renderLibrary(data);
        } else {
            // Fallback local baseado no seu doc
            renderLibrary(getFallbackModules());
        }
    } catch (e) {
        renderLibrary(getFallbackModules());
    }
}

function getFallbackModules() {
    return [
        { slug: 'cap1', chapter_number: 1, title_pt: '1. Hallo! – Begrüßungen', level: 'A1', focus: 'Apresentações básicas' },
        { slug: 'cap2', chapter_number: 2, title_pt: '2. Wer bin ich? – Familie', level: 'A1', focus: 'Família e números' },
        { slug: 'cap3', chapter_number: 3, title_pt: '3. Hobbys und Freizeit', level: 'A1', focus: 'Hobbies e verbo möchten' },
        { slug: 'cap4', chapter_number: 4, title_pt: '4. Im Supermarkt', level: 'A1', focus: 'Compras e Acusativo' },
        { slug: 'cap5', chapter_number: 5, title_pt: '5. Mein Tag', level: 'A1', focus: 'Rotina e horas' }
    ];
}

function renderLibrary(modules) {
    DOM.libraryGrid.innerHTML = '';
    
    modules.forEach(mod => {
        const card = document.createElement('div');
        card.className = 'module-card';
        card.innerHTML = `
            <div class="module-header">
                <span class="level-tag ${mod.level}">${mod.level}</span>
                <h3>${mod.title_pt}</h3>
            </div>
            <p class="module-focus">🎯 ${mod.focus}</p>
            <button onclick="openModule('${mod.slug}')" class="btn-study">Estudar</button>
        `;
        DOM.libraryGrid.appendChild(card);
    });
}

// Função chamada ao clicar em "Estudar"
window.openModule = function(slug) {
    // Lógica para abrir detalhes do módulo ou lições
    alert(`Abrindo módulo: ${slug}\n(Aqui carregaria as lições de study_lessons)`);
};

// ===================================================
// BOSS FIGHT (Mini Game)
// ===================================================
window.startBossFight = function() {
    DOM.bossModal.style.display = 'flex';
    const words = ['der Apfel', 'die Banane', 'das Brot', 'der Kaffee'];
    const randomWord = words[Math.floor(Math.random() * words.length)];
    
    document.getElementById('boss-word').innerText = randomWord;
    document.getElementById('boss-input').value = '';
    document.getElementById('boss-feedback').innerText = '';
};

window.checkBossAnswer = function() {
    const input = document.getElementById('boss-input').value.toLowerCase();
    const target = document.getElementById('boss-word').innerText.toLowerCase();
    const feedback = document.getElementById('boss-feedback');
    
    if(input.includes(target)) {
        feedback.innerHTML = '<span style="color:var(--green)">Richtig! +50 XP</span>';
        addXP(50, 'Boss Fight Victory');
        setTimeout(() => DOM.bossModal.style.display = 'none', 1500);
    } else {
        feedback.innerHTML = '<span style="color:var(--red)">Falsch! Tente novamente.</span>';
    }
};

// ===================================================
// SHADOWING (Speech-to-Text)
// ===================================================
window.startShadowing = function() {
    if(!('webkitSpeechRecognition' in window)) {
        alert('Seu navegador não suporta reconhecimento de voz.');
        return;
    }
    
    DOM.shadowModal.style.display = 'flex';
    const phrase = 'Guten Morgen, wie geht es Ihnen?';
    document.getElementById('shadow-phrase').innerText = phrase;
    
    const recognition = new webkitSpeechRecognition();
    recognition.lang = 'de-DE';
    recognition.onresult = (event) => {
        const speechResult = event.results[0][0].transcript;
        document.getElementById('shadow-result').innerText = speechResult;
        
        if(speechResult.toLowerCase().includes('morgen') || speechResult.toLowerCase().includes('geht')) {
            document.getElementById('shadow-feedback').innerText = 'Gut gemacht! Pronúncia excelente.';
            addXP(30, 'Shadowing Practice');
        } else {
            document.getElementById('shadow-feedback').innerText = 'Tente novamente.';
        }
    };
    
    recognition.start();
};