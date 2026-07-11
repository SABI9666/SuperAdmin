-- ============================================================
-- Super Admin — Supabase backend schema
-- Run this once in your Supabase project: SQL Editor → New query
-- ============================================================

create table if not exists apps (
  id uuid primary key,
  name text not null,
  url text default '',
  category text default '',
  color text default '#4f8cff',
  last_status text default 'unknown',
  last_latency int,
  last_checked timestamptz,
  created_at timestamptz default now()
);

create table if not exists notes (
  id uuid primary key,
  title text not null,
  content text default '',
  pinned boolean default false,
  updated_at timestamptz default now(),
  created_at timestamptz default now()
);

create table if not exists reminders (
  id uuid primary key,
  title text not null,
  due_at timestamptz not null,
  done boolean default false,
  created_at timestamptz default now()
);

-- Special reminders: broadcast notices pushed from Super Admin to the
-- Laxora billing frontend. Every active row pops up for Laxora users and
-- stays visible until it is deleted here in Super Admin.
create table if not exists special_reminders (
  id uuid primary key,
  title text default '',
  message text not null,
  level text default 'info',        -- info | warning | urgent (controls styling)
  active boolean default true,
  created_at timestamptz default now()
);

-- Personal single-user setup: allow access with the anon key.
-- Keep your project URL + anon key private. If you ever want real
-- authentication, enable Supabase Auth and tighten these policies.
alter table apps enable row level security;
alter table notes enable row level security;
alter table reminders enable row level security;
alter table special_reminders enable row level security;

create policy "personal_all_apps" on apps for all using (true) with check (true);
create policy "personal_all_notes" on notes for all using (true) with check (true);
create policy "personal_all_reminders" on reminders for all using (true) with check (true);

-- Super Admin manages special reminders; the Laxora frontend only reads them
-- (with the public anon key), so reads are open and writes stay with this app.
create policy "special_reminders_read" on special_reminders for select using (true);
create policy "special_reminders_write" on special_reminders for all using (true) with check (true);
