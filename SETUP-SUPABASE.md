# Ligar a plataforma ao banco online (Supabase) — ~10 minutos

Sem isso, o site funciona em **modo local**: cada aparelho guarda só os próprios dados.
Com isso, as respostas dos alunos chegam à professora e o conteúdo que ela adiciona aparece para todos.

## 1. Criar o projeto
1. Acesse **supabase.com** → *Start your project* → entre com a conta GitHub ou e-mail.
2. *New project* → nome `farmacologia-clinica`, crie uma senha do banco (guarde), região **South America (São Paulo)** → *Create*.

## 2. Criar as tabelas
1. Menu lateral → **SQL Editor** → *New query*.
2. Cole todo o conteúdo de `supabase-setup.sql`, **troque o e-mail da última linha** pelo e-mail da professora → *Run*.

## 3. Ativar o acesso dos alunos sem login
1. **Authentication → Sign In / Providers** → ative **Allow anonymous sign-ins** → *Save*.
2. **Authentication → Rate Limits** → aumente o limite de *anonymous sign-ins* (o padrão é baixo: uma turma inteira no mesmo Wi-Fi pode esbarrar nele). Algo como 300 por hora atende bem.

## 4. Criar a conta da professora
**Authentication → Users → Add user → Create new user** → mesmo e-mail cadastrado no passo 2, uma senha, e marque *Auto Confirm User*.

## 5. Ligar o site ao banco
**Project Settings → API** (ou *Data API*): copie
- **Project URL** (ex.: `https://abcdefgh.supabase.co`)
- **anon public key** (chave longa que começa com `eyJ…`)

No `index.html`, preencha:
```js
const CONFIG = {
  SUPABASE_URL: "https://abcdefgh.supabase.co",
  SUPABASE_ANON_KEY: "eyJ..."
};
```
A chave *anon* é pública por natureza — a proteção dos dados é feita pelas regras de segurança criadas no passo 2. **Nunca** use a chave *service_role* no site.

## Como fica o uso
- **Aluno:** abre o link, informa o nome na primeira resposta e pronto. A identidade fica no aparelho dele.
- **Professora:** aba *Professora* → e-mail e senha → corrige as respostas e adiciona conteúdo para a turma.
- O rodapé da tela inicial mostra **"● Conectado à turma"** quando está tudo certo.
