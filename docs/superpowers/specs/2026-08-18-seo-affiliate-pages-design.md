# Ethos — SEO Guide Pages + Affiliate Booking Links: Design Spec

Date: 2026-08-18
Status: Approved design, pre-implementation
Builds on: `2026-08-17-ethos-travel-guides-design.md` (v1, deployed at https://ethos.fly.dev)

## 1. Goal

Turn published guides into SEO-ranking, revenue-earning pages, seeded with the
founder's real 3-day Rome trip as the flagship guide. Affiliate booking links
render as native in-content CTAs that help rather than hurt the page (no banner
ads), matching monetization recommendation #1 from the 2026-08-18 research
(affiliate commissions first; subscriptions later).

### Content policy (binding)

- No fabricated first-person experiences. All experiential content is the
  founder's true story, edited for clarity and enriched with verified real-world
  names/facts (hotel, walls, monuments, dates).
- Companion/FAQ content is factual and verifiable (logistics, history, prices
  described qualitatively), written to be genuinely useful — per Google's
  helpful-content and scaled-content-abuse policies.
- Pages containing any affiliate link show a disclosure line (FTC).

## 2. Data model changes

- `guides` new columns:
  - `intro` — text, markdown. Rendered above the entries; first ~160 chars
    (stripped) become the meta description.
  - `sections` — jsonb, `[{"heading": string, "body": string(markdown)}]`.
  - `faq` — jsonb, `[{"question": string, "answer": string}]`.
  - `destination_slug` — string, indexed; derived on insert/update from
    `destination` (first comma-segment, downcased, non-alphanumerics → `-`,
    e.g. "Rome, Italy" → `rome`). Backfill migration for existing rows.
- `entries` new columns:
  - `booking_url` — string. Rendered only when it passes the existing
    `EthosWeb.Url.safe_http?/1` check.
  - `booking_label` — string, default label "Book this" when blank but URL set.
- Markdown rendered server-side with `{:earmark, "~> 1.4"}`; output passed
  through `Phoenix.HTML` raw only after Earmark's default escaping; no raw
  user HTML honored (`escape: true` semantics — Earmark escapes by default).

## 3. Editing

- `GuideLive.Edit` gains: intro textarea, sections editor (add/remove
  heading+body rows), FAQ editor (add/remove question+answer rows), and
  `booking_url`/`booking_label` inputs on the entry form (add + per-entry
  edit for these two fields).
- All web-path params flow through the existing non-privileged changesets;
  `booking_url` validated http/https at changeset level (reject others).

## 4. Public rendering & SEO surfaces

### Guide page (`/g/:slug`) additions
- Render order: title/header → intro (markdown) → day-by-day entries →
  companion sections → FAQ → footer CTAs.
- Entry booking CTA: a visually distinct but in-flow card inside the entry —
  label + outbound link with `rel="sponsored nofollow noopener"`,
  `target="_blank"`.
- Disclosure line (shown iff any rendered entry has a booking_url):
  "Some booking links on this page earn Ethos a commission at no extra cost
  to you."
- JSON-LD in `<head>` (one `<script type="application/ld+json">` per block):
  - `Article` (headline, description, datePublished/Modified, author as
    Person with no email leakage — use "An Ethos traveler" unless a public
    display name exists later).
  - `FAQPage` iff `faq` non-empty.
  - `BreadcrumbList` (Home → Destinations → {Destination} → {Guide}).
- Canonical `<link rel="canonical">` and `meta description` from intro;
  existing OG tags unchanged.

### Destination hubs
- `GET /destinations` — all `destination_slug`s having ≥1 published guide,
  with guide counts. Server-rendered controller page.
- `GET /destinations/:slug` — hub page: destination name, short intro
  (derived, e.g. "Real trip guides for {Name} — places, verdicts, and tips
  from travelers who went"), cards linking to each published guide
  (title, entry count, view count ordering). `BreadcrumbList` JSON-LD.
  404 for slugs with no published guides.

### Sitemap
- `GET /sitemap.xml` — controller-generated XML: landing page, `/destinations`,
  each destination hub, each published guide (`lastmod` = guide `updated_at`).
  No caching layer in v1 (page is cheap); `Cache-Control: max-age=3600`.

## 5. Flagship Rome guide (seed content)

- Task: `mix ethos.seed_rome` reading `OWNER_EMAIL` from `--owner` arg;
  production owner is `cryptcom@gmail.com` (already registered on the live
  site — the guide attaches to that existing account). Idempotent (keyed on
  fixed slug `three-days-in-rome-real-trip-guide`); re-running updates
  content in place. In dev only, creates the account (random password) if
  the email is absent.
- Guide: title "3 Days in Rome: Colosseum Arena Floor, the Vatican, and the
  Back Streets of Monti"; destination "Rome, Italy"; published.
- Entries (day-tagged, real story, verdicts): Anantara Palazzo Naiadi (stay,
  loved); Vatican & Sistine Chapel skip-the-line tour (tour, loved,
  booking_url = the Viator product link, untagged for now); lunch by the
  Leonine Wall (food, good); Colosseum arena floor + Forum + Palatine (tour,
  loved, booking_url = founder's GetYourGuide link with partner_id=ZA4AIMF;
  companion Roman Guy arena-floor link in enrichment links); Monti dinner
  spot (food, loved); Spanish Steps → Trinità dei Monti → Villa Borghese →
  Trevi → Pantheon → Piazza Navona walk (walk, loved); Santa Maria in
  Trastevere (sight, loved); SEEN rooftop dinner (food, loved — sushi, quail
  egg, soft-shell crab).
- Intro (~200 words) + 4 companion sections (arena-floor access options;
  Vatican skip-the-line logistics; where to eat in Monti; the 3-day walking
  logistics incl. Termini base) + 6 FAQs ("Is the Colosseum arena floor tour
  worth it?", "How many days do you need in Rome?", etc.). All factual,
  written at authorship time (content lives in the seed module as data).

## 6. Testing

- Context tests: slug derivation/backfill, changeset URL validation,
  sections/faq round-trip.
- Controller tests: guide page renders intro/sections/FAQ/CTA/disclosure and
  all three JSON-LD blocks; no disclosure when no booking links; destination
  index + hub + 404; sitemap XML lists expected URLs.
- Seed task test: runs twice idempotently; guide published with expected
  entry/booking data.

## 7. Rollout

1. Tests green → commit → push to main.
2. `fly deploy`.
3. `fly ssh console -C "/app/bin/ethos eval 'Ethos.Release.seed_rome(\"<owner-email>\")'"`
   (release wrapper around the mix task logic — mix isn't available in
   releases, so the seeding logic lives in `Ethos.Release` and the mix task
   delegates to it).
4. Verify live: guide page, destination hub, sitemap.xml, CTA links carry
   the partner ID.
5. Hand founder the Google Search Console steps (verify domain, submit
   sitemap) — requires their Google account.

## Out of scope

- Viator/RomanGuy affiliate enrollment (links embedded untagged until founder
  has IDs — fields make retagging a UI edit).
- Automatic affiliate-tagging of enrichment links (future: GYG/Viator link
  rewriting per monetization plan #1 at scale).
- Public display names for credit/authorship (post-launch, per R20).
