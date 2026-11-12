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

## Limitação da versão piloto
Os dados ficam salvos no navegador de cada dispositivo (localStorage). Respostas enviadas pelo celular de um aluno não chegam automaticamente ao dispositivo da professora. Para uso real com a turma, é preciso conectar um banco de dados online — o código já isola a persistência no objeto `Store`.
