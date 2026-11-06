# WinrothMusic: next version

## Publish using GitHub + Cloudflare Pages
1. Unzip the package. Upload **index.html**, **assets/**, **audio/**, **functions/** and **schema.sql** to the root of `winrothmusic-prog/winrothmusic` on the `main` branch. Replace the old `index.html`. Preserve folder names and avoid filename spaces.
2. Cloudflare Pages automatically deploys. Framework: None; build command: blank; output directory: `/`.
3. Verify `https://winrothmusic.pages.dev`.

## What works immediately
- Song archive with All / Released / Projects filters, existing external listening links.
- HTML5 player (plays **only when you add your own audio** to `/audio` and configure `songData.audio`).
- Adopt a Lyric preview, with 12,000 SEK goal per provisional song. **No checkout, no reservation, no payment.** The 0 SEK counters are placeholders, not real transaction data.
- Twitch and YouTube links. Live status is not inferred or polled.
- The Unfinished Room, with honest demo placeholders until recordings are supplied.

## Activate Through Your Eyes (free Cloudflare D1 tier)
1. Cloudflare dashboard → Storage & databases → D1 → Create database, name it `winrothmusic-community`.
2. In D1 database console, execute the SQL in `schema.sql`.
3. Cloudflare dashboard → Workers & Pages → `winrothmusic` → Settings → Bindings → Add D1 database binding. Variable name **DB**; select the new database. Configure production and preview if you use both.
4. Settings → Variables and Secrets → add a secret named **MODERATION_TOKEN** with a long random secret value. Never put this token in GitHub or public JavaScript.
5. Redeploy after binding changes. Messages will be stored pending moderation and public messages will only appear when approved.
6. To review pending messages, make an authenticated GET request to `/api/moderate` with `Authorization: Bearer <MODERATION_TOKEN>`; approve via POST JSON `{"id":123,"action":"approve"}` with the same Authorization header. `reject` or `delete` also work. For now this requires an API client; a private moderation dashboard can be added later.

**Important**: The simple public form has a honeypot but no rate limiter or bot challenge yet. Before promoting widely, enable Cloudflare Turnstile and enforce server-side verification and rate limits. Do not collect sensitive personal information. Establish a privacy notice and retention/deletion process before public launch.

## Adoption payments
Not active. Do not show confirmed donations, claim exclusive ownership, or accept funds until a server-side checkout with verified provider webhooks, transaction IDs, and atomic line reservations is implemented. Swish business integration may require a bank/provider agreement; PayPal/card processors may charge transaction fees. The sample lyric lines are not a complete inventory, and their sum does not fund 12,000 SEK by itself.

## Content
Edit `songData` in `index.html` for your songs and audio paths. Update fundraising eligibility if a song already has a finished studio version. Only include lyrics that you own and wish to offer symbolically.


## Watch & Listen (November 2026)
Added six user-selected YouTube video embeds, channel link, thumbnails and privacy-friendly click-to-play. Five video titles were not independently verified, so they are temporarily labeled YouTube performance 1–5. The sixth is the previously identified What Could Have Been cover. YouTube embedding can be restricted by a video's owner. No API key or paid service is required.
