# Farmacologia Clínica — Medicina · Estudo guiado

Plataforma de estudos de Farmacologia para estudantes de Medicina, em um único arquivo (`index.html`), sem instalação.

## Módulos
- **Anti-hipertensivos** (piloto completo): resumo visual, tabela comparativa, 13 flashcards, 6 questões objetivas e 3 casos clínicos.
- **Drogas vasoativas**: resumo, tabela, 6 flashcards, 3 objetivas e 1 caso clínico.

## Funcionalidades
- Dashboard com progresso por módulo (resumo, flashcards, questões).
- Flashcards com virada animada e repetição espaçada (Errei / Quase / Acertei).
- Questões objetivas com feedback por alternativa.
- Casos clínicos discursivos com envio para correção e status visual.
- Área da Professora (PIN inicial `1234`): corrigir respostas com feedback, adicionar módulos, questões, flashcards, destaques e linhas de tabela; backup em JSON.

## Como usar
Abra `index.html` no navegador, ou publique pelo GitHub Pages (Settings → Pages → branch `main`, pasta `/`).

## Banco de dados online
Sem configuração, o site roda em **modo local** (cada aparelho guarda só os próprios dados).
Para as respostas dos alunos chegarem à professora e o conteúdo novo aparecer para todos, ligue ao Supabase: siga **SETUP-SUPABASE.md** (≈10 min) e rode `supabase-setup.sql`.

- Aluno: acesso sem login (identidade anônima no aparelho); vê só as próprias respostas.
- Professora: login por e-mail e senha; vê e corrige todas as respostas e adiciona conteúdo.
