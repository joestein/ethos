# Connecticut Guides, Place Pages, and Explorer Badges — Design

Date: 2026-08-22
Status: Approved in chat (structure, gamification scope, and first-class-places approach chosen by Joe)

## Goal

Grow Ethos beyond the Rome flagship with five researched Connecticut town
guides (Waterbury, Middlebury, Danbury, Southbury, Woodbury), introduce
first-class **place pages** (every site / restaurant / hotel gets its own
shareable, SEO-ranking URL), a scalable **state → county → town** geographic
hierarchy, per-item **copy-link sharing**, and **explorer badges** earned by
checking off visited places.

## Non-goals

- Contributor badges, points, levels, or streaks (explicitly deferred).
- Maps / geocoding (no lat/lng this round).
- Admin UI for badges or places (definitions and content live in code/seeds).
- AI involvement in any new feature — badges, check-offs, place pages, and
  hubs are pure Ecto/queries. The existing AI budget invariants are untouched.
- Migrating the Rome guide's entries to places (entries.place_id stays nil
  for Rome; everything keeps working).

## Content policy

These are **editorial destination guides**, not first-person trip logs. Voice
is researched-editorial ("Waterbury's brass mills once employed 50,000…"),
never fabricated personal experience. Every historical fact, attraction,
restaurant, and hotel comes from the completed deep-research run (verified,
cited) or the follow-up gap-fill research pass. Anything that cannot be
verified as currently operating is excluded or marked closed.

Verified so far (2026-08 deep research, 106 agents): Waterbury brass history
(settled 1674, town 1686, city 1853, 50k-worker peak), Palace Theater,
Mattatuck Museum (+ Button Museum, 31 CC photos on Commons), Woodbury/
Southbury 1673 Pomperaug colonial origins, Southbury 1787 charter, Danbury
Railway Museum, Quassy Amusement Park, Ethan Allen Hotel.

**Gap-fill research pass required during implementation** (exa/web, verified
before use): restaurants for all five towns; Woodbury/Southbury attractions
(Glebe House, Heritage Village, Audubon); Danbury hat-making history;
hotels and B&Bs beyond the Ethan Allen.

## 1. Geographic hierarchy

### Data

`guides` gains four nullable string columns: `state`, `state_slug`,
`county`, `county_slug`. Slugs are derived in the changeset with the same
normalization as `derive_destination_slug/1`. Rome guide leaves them nil.

Correct county assignments (CT county lines, as travelers know them):

| Town | County |
|---|---|
| Waterbury | New Haven County |
| Middlebury | New Haven County |
| Southbury | New Haven County |
| Danbury | Fairfield County |
| Woodbury | Litchfield County |

### Routes and resolution

- `GET /destinations` — states index (distinct `state`/`state_slug` among
  published guides) plus the existing town hubs for guides without a state
  (Rome keeps its current hub link).
- `GET /destinations/:slug` — resolution order: if `:slug` matches a
  `state_slug` with published guides, render the **state hub** (counties +
  guides); otherwise fall back to the existing **town hub**
  (`destination_slug` match). This keeps `/destinations/rome` working.
- `GET /destinations/:state_slug/:county_slug` — **county hub**: towns and
  guides in that county.

Hubs are derived pages — no new tables. Each hub lists child hubs and its
published guides with title/destination links, and cross-links up the tree
(county → state → all destinations) via breadcrumbs.

## 2. Places

### Schema — `places` table

| Column | Type | Notes |
|---|---|---|
| `slug` | string, unique index | e.g. `palace-theater-waterbury`; set explicitly by seeds; required |
| `name` | string | required |
| `kind` | string | required; one of `museum theater restaurant cafe brewery hotel bnb park historic-site amusement-park attraction` |
| `town` | string | required, e.g. "Waterbury" |
| `state` | string | required, e.g. "Connecticut" |
| `county` | string | required, e.g. "New Haven County" |
| `town_slug` / `state_slug` / `county_slug` | string | derived in changeset |
| `summary` | text | required; markdown, rendered via `EthosWeb.Markdown` |
| `history` | text | optional; markdown |
| `address` | string | optional |
| `official_url` | string | optional; rendered only when `EthosWeb.Url.safe_http?/1` |
| `booking_url` | string | optional; rendered with `rel="sponsored nofollow noopener"` like entry CTAs |
| `photos` | {:array, :map} | same src/thumb/title/description shape and `/photos/` path regex as guide photos, **plus required `author`, `license`, `source_url` strings** (see Images) |
| `status` | string | `open` (default) or `closed`; closed places render a notice and drop booking CTA, JSON-LD stays but pages remain (no broken share links) |
| timestamps | utc_datetime | |

`entries` gains nullable `place_id` (FK, `on_delete: :nilify_all`). The
public entry changeset **never** casts `place_id` (same mass-assignment rule
as `source`/`credited_user_id`); only the privileged path sets it.

Context: `Ethos.Places` with `get_place_by_slug!/1`, `list_places/1`
(filters: town_slug/county_slug/state_slug/kind/status), `upsert_place!/1`
(by slug, for seeds), `count_open_places_by_county/1`.

### Place page — `GET /p/:slug`

Public controller page (like guide show): hero photo, name, kind + town
badge line, summary, history section, practical info block (address,
official site link, booking CTA), photo strip with visible attribution,
"Featured in these guides" (published guides having an entry with this
`place_id`), **Copy link** button, **"I've been here"** check-off button,
breadcrumbs (state → county → town-guide → place). Closed places show a
"Permanently closed" banner instead of CTA/check-off.

OG/meta: page_title "Name — Town, State", meta description from summary,
og:image from first photo (absolute URL).

### Copy-link sharing

A small `CopyLink` Phoenix JS hook (`navigator.clipboard.writeText` with a
"Copied!" flash on the button; fallback: select-and-copy prompt). Buttons:

- Place page header: copies the canonical `/p/{slug}` URL.
- Every guide entry: copies `/p/{place-slug}` when the entry has a
  `place_id`, else `/g/{guide-slug}#entry-{id}` (anchors already exist).

## 3. Explorer badges

### Data

- `place_visits`: `user_id` (FK), `place_id` (FK), unique index on the
  pair, timestamps. Toggle semantics: `POST /p/:slug/visit` creates or
  deletes the row (authenticated pipeline; logged-out users see the button
  but clicking routes to `/users/log_in` — the signup hook).
- `user_badges`: `user_id`, `badge_key` (string), unique on the pair,
  `awarded_at`. Badges are never revoked on un-visit (kept simple; earned
  is earned).

### Definitions — `Ethos.Badges` (code, not DB)

Each badge: `key`, `name`, `emoji`, `description`, and a rule evaluated
with plain Ecto counts against the user's visits:

| Key | Name | Rule |
|---|---|---|
| `first-steps` | First Steps | 1+ total check-offs |
| `explorer-waterbury` | Brass City Explorer | 5+ places in Waterbury |
| `explorer-danbury` | Hat City Explorer | 5+ places in Danbury |
| `explorer-middlebury` | Middlebury Explorer | 3+ places in Middlebury |
| `explorer-southbury` | Southbury Explorer | 3+ places in Southbury |
| `explorer-woodbury` | Woodbury Explorer | 3+ places in Woodbury |
| `foodie` | Local Foodie | 5+ places of kind restaurant/cafe/brewery |
| `historian` | Time Traveler | 5+ places of kind museum/historic-site/theater |
| `county-complete-{county_slug}` | {County} Complete | all open places in a county checked off (dynamic key; evaluated for the county of the just-visited place) |

`Ethos.Badges.check_and_award(user)` runs synchronously after each visit
creation inside the same request, inserts any newly earned `user_badges`
rows (`on_conflict: :nothing`), and returns newly awarded badges for a
flash/toast ("🏅 Badge earned: Brass City Explorer!").

### Badges page — `GET /badges` (authenticated)

Grid of all defined badges: earned ones in color with award date, locked
ones grayed with their rule as the hint ("Check off 5 Waterbury places").
Dynamic county badges render one card per county that has open places.
Linked from the settings/account nav.

## 4. Content and images

### Guides

Five seed modules under `lib/ethos/seeds/` (one per town, mirroring
`rome_guide.ex`): idempotent `upsert!` by fixed slug inside a transaction,
owned by the cryptcom@gmail.com user in prod (same `Ethos.Release` eval
pattern), each with: history-forward `intro`, entries **linked via
`place_id`** to seeded places, `sections` (history deep-dive, getting
there, best seasons/town character), `faq` (5-6 real questions), correct
`state`/`county`. Fixed slugs: `waterbury-ct-travel-guide`,
`middlebury-ct-travel-guide`, `danbury-ct-travel-guide`,
`southbury-ct-travel-guide`, `woodbury-ct-travel-guide`.

A `places` seed module runs first: ~8–12 places per town (sites,
restaurants, hotels/B&Bs) — every fact verified per the content policy.

### Images — Wikimedia Commons only

- License allowlist: public domain, CC0, CC-BY, CC-BY-SA. **No
  hotlinking, no unlicensed scraping.** Each downloaded original recorded
  with author, license, and the Commons file page URL.
- Stored attribution renders on every surface that shows the photo (place
  page caption/credits block, photos strip) as "Photo: {author}, {license},
  via Wikimedia Commons" linking `source_url` — satisfying CC attribution.
- Pipeline: originals fetched to the git-ignored `images/ct/` dir, run
  through the existing `Ethos.PhotoOptimizer` (strip/normalize EXIF
  orientation lesson already applied), committed as JPEG pairs under
  `priv/static/photos/ct/{town_slug}/`. A mix task
  `ethos.optimize_ct_photos` mirrors the Rome one.
- Target: 1 hero + 1–3 photos for major places; it is fine for minor
  places (most restaurants) to have zero photos — the page layout must
  not require one.

## 5. SEO

- Place JSON-LD by kind: museum→`Museum`, theater→`PerformingArtsTheater`
  (fallback `TouristAttraction`), restaurant/cafe→`Restaurant`,
  brewery→`Brewery`, hotel→`Hotel`, bnb→`BedAndBreakfast`, park→`Park`,
  historic-site→`LandmarksOrHistoricalBuildings`,
  amusement-park→`AmusementPark`, attraction→`TouristAttraction`. Fields:
  name, description (summary excerpt), image (absolute), url (canonical),
  `address` as `PostalAddress` when present. Emitted through the existing
  root-layout JSON-LD mechanism (`Jason.encode!(ld, escape: :html_safe)`).
- Hubs: `CollectionPage` + `BreadcrumbList`. Place pages: `BreadcrumbList`
  (Destinations → State → County → Place).
- Guides keep their Article/FAQ JSON-LD; CT guides also get booking CTAs
  and the affiliate disclosure line like Rome.
- `sitemap.xml` adds: state hubs, county hubs, and all place pages (open
  and closed — closed pages still resolve).
- Canonical URLs on hubs and place pages.

## 6. Error handling

- Unknown place slug, unpublished-guide backlinks, unknown hub slugs → 404.
- Check-off POST for a closed place → redirect back with error flash.
- Badge awarding failure must not fail the visit: award step wrapped so a
  constraint race (`on_conflict: :nothing`) or unexpected error logs and
  continues.
- Copy-link hook degrades: if `navigator.clipboard` is unavailable
  (non-HTTPS/old browser), show the URL in a `window.prompt` for manual copy.

## 7. Testing

- Context tests: `Ethos.Places` (upsert idempotency, filters, slug
  uniqueness, photo attribution validation), `Ethos.Badges` (each rule at
  boundary counts, dynamic county-complete, idempotent re-award, un-visit
  does not revoke).
- Controller tests: place show (open/closed/404, OG tags, JSON-LD types
  per kind, attribution rendered), hubs (state/county/town resolution
  order incl. `/destinations/rome` fallback), visit toggle (auth required,
  toggle create/delete, closed rejected, badge flash on award).
- Seed test: all five town seeds + places seed run twice without error or
  duplication in a sandbox transaction.
- Existing suite (225 tests) stays green.

## 8. Build order

One plan, phased: (1) migrations + hierarchy hubs, (2) Places context +
pages + JSON-LD + sitemap, (3) copy-link hook, (4) visits + badges +
badges page, (5) gap-fill research + seeds + Commons images, (6) deploy,
prod seed, verify live. Ships to Fly (app `ethos`) with the usual commit /
push / deploy / `Ethos.Release` seed eval flow.

## Global constraints

- Phoenix 1.7.14 conventions (`current_user`, not 1.8 scopes).
- Zero AI/API calls in every feature in this spec; AI budget invariants
  unchanged.
- No fabricated experiences or unverified facts in content.
- Only PD/CC0/CC-BY/CC-BY-SA images, always attributed, never hotlinked.
- Public changesets never cast privileged fields (`place_id`,
  `source`, `credited_user_id`).
- All external URLs rendered only through `EthosWeb.Url.safe_http?/1`
  checks; affiliate/booking links get `rel="sponsored nofollow noopener"`.
