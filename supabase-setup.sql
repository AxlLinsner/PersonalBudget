-- Budget v3 cloud sync setup for Supabase
-- Run this once in Supabase SQL Editor.

create table if not exists public.budget_os_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.budget_os_data enable row level security;

drop policy if exists "Users can read their own budget data" on public.budget_os_data;
create policy "Users can read their own budget data"
on public.budget_os_data for select
using (auth.uid() = user_id);

drop policy if exists "Users can insert their own budget data" on public.budget_os_data;
create policy "Users can insert their own budget data"
on public.budget_os_data for insert
with check (auth.uid() = user_id);

drop policy if exists "Users can update their own budget data" on public.budget_os_data;
create policy "Users can update their own budget data"
on public.budget_os_data for update
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

create index if not exists budget_os_data_updated_at_idx
on public.budget_os_data(updated_at);

-- Required Data API table grants for signed-in browser clients. RLS still restricts rows to auth.uid().
grant select, insert, update, delete on public.budget_os_data to authenticated;
