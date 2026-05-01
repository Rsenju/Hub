import os
import pdfplumber
import json
from groq import Groq
from supabase import create_client

# As chaves são puxadas automaticamente do ambiente (Vercel ou local)
client_groq = Groq(api_key=os.getenv("GROQ_API_KEY"))
supabase = create_client(os.getenv("SUPABASE_URL"), os.getenv("SUPABASE_KEY"))

def extrair_e_formatar(caminho_pdf):
    with pdfplumber.open(caminho_pdf) as pdf:
        # Loop pelos capítulos (ajuste o range de páginas conforme necessário)
        for i in range(1, 11): 
            # Extrai o texto da página correspondente ao capítulo
            texto_pagina = pdf.pages[i+2].extract_text() # +2 para pular sumário/intro

            prompt = f"""
            Converta o texto do Capítulo {i} de alemão para este formato JSON:
            {{
              "chapter": "{i}",
              "title": "Título do Capítulo",
              "level": "A1",
              "content": {{
                "{i}.1": "Conteúdo do tópico",
                "{i}.2": "Conteúdo do tópico",
                "{i}.3": "Conteúdo do tópico",
                "{i}.4": "Conteúdo do tópico",
                "Atividade {i}.1": "Exercício prático",
                "Atividade {i}.2": "Exercício prático"
              }}
            }}
            Texto: {texto_pagina}
            """

            completion = client_groq.chat.completions.create(
                messages=[{"role": "user", "content": prompt}],
                model="llama3-8b-8192",
                response_format={"type": "json_object"}
            )
            
            dados = json.loads(completion.choices[0].message.content)
            
            # Envia direto para o Supabase
            supabase.table("study_modules").insert(dados).execute()
            print(f"✅ Capítulo {i} enviado com sucesso!")

if __name__ == "__main__":
    extrair_e_formatar("Meu Alemão do Zero ao B1.pdf")