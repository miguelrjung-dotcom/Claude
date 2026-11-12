-- =========================================================
-- Farmacologia Clínica — estrutura do banco (Supabase)
-- Cole tudo no SQL Editor do Supabase e clique em "Run".
-- Antes de rodar, troque o e-mail na última linha.
-- =========================================================

-- Professoras autorizadas (pode haver mais de uma)
create table if not exists public.teachers (
  email text primary key
);

-- Conteúdo adicionado pela professora (módulos, questões, flashcards…)
create table if not exists public.content (
  id         text primary key,
  kind       text not null,
  mid        text,
  data       jsonb not null,
  created_at timestamptz not null default now()
);

-- Respostas discursivas dos alunos
create table if not exists public.submissions (
  id          uuid primary key default gen_random_uuid(),
  created_at  timestamptz not null default now(),
  user_id     uuid not null default auth.uid() references auth.users on delete cascade,
  student     text not null check (char_length(student) between 1 and 80),
  mid         text,
  mod_title   text,
  qid         text,
  level       text,
  case_text   text,
  question    text,
  answer      text not null check (char_length(answer) between 1 and 10000),
  status      text not null default 'pendente' check (status in ('pendente','corrigida')),
  feedback    text not null default '',
  feedback_at timestamptz
);

-- Quem está logado é professora?
create or replace function public.is_teacher()
returns boolean language sql stable security definer set search_path = public as $$
  select exists (select 1 from public.teachers where email = (auth.jwt() ->> 'email'));
$$;

alter table public.teachers    enable row level security;
alter table public.content     enable row level security;
alter table public.submissions enable row level security;

-- Conteúdo: todos leem; só professora escreve
drop policy if exists content_read  on public.content;
drop policy if exists content_write on public.content;
create policy content_read  on public.content for select to anon, authenticated using (true);
create policy content_write on public.content for all    to authenticated using (public.is_teacher()) with check (public.is_teacher());

-- Respostas: aluno envia e vê só as próprias; professora vê e corrige todas
drop policy if exists sub_insert on public.submissions;
drop policy if exists sub_select on public.submissions;
drop policy if exists sub_update on public.submissions;
drop policy if exists sub_delete on public.submissions;
create policy sub_insert on public.submissions for insert to authenticated
  with check (user_id = auth.uid() and status = 'pendente' and feedback = '');
create policy sub_select on public.submissions for select to authenticated
  using (user_id = auth.uid() or public.is_teacher());
create policy sub_update on public.submissions for update to authenticated
  using (public.is_teacher()) with check (public.is_teacher());
create policy sub_delete on public.submissions for delete to authenticated
  using (public.is_teacher());

-- >>> TROQUE PELO E-MAIL DA PROFESSORA <<<
insert into public.teachers (email) values ('professora@exemplo.com') on conflict do nothing;
