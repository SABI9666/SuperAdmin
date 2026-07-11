# 👑 Super Admin — Personal Command Center

Your own private dashboard to **launch, manage and monitor every application you own** (SteelConnect web, SteelConnect admin, Laxora web, Laxora admin — and anything you add later), plus a built-in **personal secretary** with notes and reminders.

No build step, no server needed — it is a single `index.html` file.

## ✨ Features

- **🚀 My Applications** — add any app with a name, URL, category and color. One-click "Open" launches it in a new tab. Search and filter by category. The four apps you mentioned (SteelConnect Web/Admin, Laxora Web/Admin) are pre-added — just click **Set URL** on each card.
- **📡 Monitoring** — check whether each app is reachable (online/offline + response time), manually or automatically every 1–60 minutes. Status is shown on every app card and in a monitoring table.
- **📝 Notes** — quick private notes with pinning, editing and search-friendly cards.
- **⏰ Reminders** — set date & time; overdue items turn red and fire a browser notification. Pending count shows as a badge in the sidebar.
- **🏠 Dashboard** — greeting, live clock, quick-launch bar, stats, upcoming reminders and pinned notes at a glance.
- **☁️ Supabase backend (optional)** — connect your free Supabase project to sync everything across devices. Until then, data is saved in your browser (localStorage).
- **💾 Backup** — export/import all data as JSON anytime.

## 🚀 How to use

**Option 1 — just open it:** download `index.html` and double-click it. Done.

**Option 2 — GitHub Pages (recommended):**
1. In this repository go to **Settings → Pages**
2. Source: *Deploy from a branch*, pick your branch, folder `/ (root)`, save
3. Your dashboard will be live at `https://<your-username>.github.io/SuperAdmin/`

## ☁️ Connect Supabase (optional, for sync across devices)

1. Create a free project at [supabase.com](https://supabase.com)
2. Open **SQL Editor → New query**, paste the contents of [`supabase/schema.sql`](supabase/schema.sql) and run it
3. In Supabase go to **Project Settings → API** and copy the **Project URL** and **anon public key**
4. In the dashboard open **Settings → Supabase backend**, paste both values and click **Save & connect**
5. Click **⤴ Upload local data to Supabase** to move your existing local data to the cloud

> ⚠️ This is a single-user personal setup — anyone with your project URL + anon key can read your data, so keep them private (don't share the link with the keys filled in).

## 📌 Notes on monitoring

Checks run from your browser. "Online" means the server answered the request; browser security (CORS) prevents reading exact status codes cross-origin, so a site serving an error page may still show as online — but downtime, DNS failures and unreachable servers are detected reliably.
