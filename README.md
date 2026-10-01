# Budget OS v3.1 — Appearance + Cloud Sync Fix

This is an updated version of Budget OS v3. It keeps the appearance/icon presets and adds a more reliable Supabase Cloud Sync flow.

## What changed
- Cloud Sync now explicitly creates and verifies a Supabase Auth session before Upload/Download.
- Connect no longer automatically downloads/replaces your local data.
- Supabase browser sessions are configured to persist and auto-refresh.
- Upload and Download give the actual Supabase error instead of a generic failure message.
- Added a Sign out button.
- Cloud Sync field now calls the browser-safe key a **Supabase publishable key**. A legacy `anon` key also works.
- Updated SQL includes the required `authenticated` Data API table grants while RLS still restricts each user to their own row.

## Supabase setup
1. Open your Supabase project.
2. Open **SQL Editor** and run the complete `supabase-setup.sql` included with this ZIP.
   - If you previously ran the older SQL, run this updated SQL again. It is safe to rerun.
3. In **Authentication → Users**, create the email/password user you want Budget OS to use.
4. In **Settings → API Keys**, copy the **Publishable key** (`sb_publishable_...`). Do not use the Secret key.
5. In Budget OS → **Settings → Cloud Sync**, enter:
   - Project URL: `https://YOUR-PROJECT-REF.supabase.co`
   - Publishable key: `sb_publishable_...`
   - The same email/password as the Supabase Auth user
6. Click **Connect**. You should see: **Connected — signed in as ... Upload or download is ready.**
7. On the device containing your current budget, click **Upload current data**.
8. On another device, enter the same Supabase details, click **Connect**, then click **Download cloud data**.

## Important
- Never put a Supabase `sb_secret_...` key in Budget OS, GitHub, or any browser/client app.
- Cloud Sync does not connect to bank accounts and does not store bank credentials.
- The current sync model stores one JSON record per authenticated user.
- The app still supports JSON backup/restore and CSV export.

## GitHub Pages
Replace the files in your existing `personal-budget-os` GitHub repository with the files from this ZIP. GitHub Pages can continue serving the app from the repository root.


## v3.2 Dashboard/cache fix
- Bumped the service-worker cache version so GitHub Pages/PWA installs fetch the updated app.
- Dashboard month calculations now use the device's local calendar date rather than UTC.
- Dashboard income/expense totals explicitly filter current-month transactions.


## v3.3 Full audit fixes
- Local month calculations no longer depend on UTC conversion.
- Forecast month keys use local calendar months.
- Future forecast months can use scheduled paycheck frequencies.
- Existing/legacy data is normalized so missing arrays do not break rendering.
- Cloud Sync recreates its Supabase client when URL/key changes.
- Automatic background sync now verifies a real session and does not throw user-facing alerts when no session exists.
- Cloud downloads validate and normalize the returned backup before replacing local data.
- Service-worker cache version bumped again to force the new code to load.
