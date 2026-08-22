# Manhattan Neighborhood Guides & Data-Driven Seeds — Design

Date: 2026-08-22
Status: Approved in chat (scope "everything ~35-40 neighborhoods" chosen by Joe)

## Goal

Build out New York State starting with Manhattan: one published guide per
Manhattan neighborhood (~40), each with verified history, parks, landmarks,
restaurants, places to stay where they exist, subway access, and attributed
Wikimedia Commons photos — all live on ethosguides.com. Introduce the
**data-driven seed subsystem** (JSON seed files + one generic loader) that
every future city and state will use, and a **generic town-explorer badge
rule** so new destinations need zero badge code.

## Non-goals

- No changes to the CT seeds (they stay as code modules).
- No maps/geocoding; no per-station subway data model (subway access is
  editorial content in guide sections and place summaries).
- No new gamification beyond the generic town-explorer rule.
- No admin UI; seed JSONs are authored in-repo.

## Content policy (unchanged, binding)

Editorial destination-guide voice; no fabricated experiences; every fact
(dates, closures, "oldest X" claims, addresses, operating status) verified
against sources in the research program below or excluded. Neighborhoods
with no verifiable hotels say so honestly and point to adjacent options.
Images: Wikimedia Commons PD/CC0/CC-BY/CC-BY-SA only, attribution stored
and rendered, never hotlinked.

## 1. Geography

- State hub: `/destinations/new-york` ("New York").
- County hub: `/destinations/new-york/manhattan` — county field is
  **"Manhattan"** (New York County is coterminous with the borough;
  travelers know "Manhattan").
- Each neighborhood is a town-level `destination`: `"SoHo, New York"`,
  `"Harlem, New York"` → `destination_slug` "soho", "harlem".
- Guide slugs: `{neighborhood-slug}-manhattan-guide`.
- Place `town` = the neighborhood name (e.g. town "SoHo", state "New York",
  county "Manhattan"). Existing schema unchanged.

### Neighborhood list (this round, 38)

Financial District, Battery Park City, Tribeca, Chinatown, Little Italy,
NoLIta, Lower East Side, Two Bridges, SoHo, NoHo, Greenwich Village,
West Village, East Village, Alphabet City, Union Square, Flatiron District,
Gramercy, Chelsea, Meatpacking District, Hudson Yards, Garment District,
Koreatown, Murray Hill, Kips Bay, NoMad, Midtown, Theater District,
Hell's Kitchen, Upper West Side, Upper East Side, Yorkville, Carnegie Hill,
Morningside Heights, Harlem, East Harlem, Hamilton Heights,
Washington Heights, Inwood.

(Roosevelt Island, Marble Hill, and micro-districts are deferred; slugs must
be unique after `derive_destination_slug/1` — verified: all 38 derive
distinct slugs.)

## 2. Data-driven seed subsystem

### Seed file format — `priv/seed_data/manhattan/{slug}.json`

One JSON file per neighborhood:

```json
{
  "guide": {
    "slug": "soho-manhattan-guide",
    "title": "SoHo, Manhattan: Cast Iron, Galleries, and Where to Eat",
    "destination": "SoHo, New York",
    "state": "New York",
    "county": "Manhattan",
    "intro": "markdown …",
    "sections": [{"heading": "…", "body": "markdown …"}],
    "faq": [{"question": "…", "answer": "…"}],
    "photos": [ {photo map, same 7 keys} ]
  },
  "places": [
    {
      "slug": "washington-square-park",
      "name": "Washington Square Park",
      "kind": "park",
      "address": "…", "official_url": "…", "booking_url": null,
      "summary": "markdown …", "history": "markdown … (optional)",
      "status": "open",
      "photos": [ {7-key photo map} ]
    }
  ],
  "entries": [
    {"kind": "sight", "name": "…", "place_slug": "…", "note": "…"}
  ]
}
```

Photo maps use the established 7 keys (`src thumb title description author
license source_url`); `src`/`thumb` under `/photos/ny/manhattan/{town_slug}/`.

### Loader — `Ethos.Seeds.DataGuide`

- `upsert_from_file!(path, email)`: decode JSON → validate shape
  (required keys, entries' `place_slug`s all present among this file's or
  previously seeded places) → upsert places via `Places.upsert_place!/1`
  → upsert guide + entries + seo + photos + publish via the same
  transaction pattern as `Ethos.Seeds.CtGuideRunner` (owner resolution
  reused: extract CtGuideRunner's `find_owner!` into the shared module or
  delegate to it — one implementation, not two).
- Malformed file → raise with the file path and reason (seeds are
  developer-run; fail loud).
- `Ethos.Release.seed_manhattan(email)`: **two-pass** over sorted
  `Path.wildcard("priv/seed_data/manhattan/*.json")` — pass 1 upserts
  every file's places; pass 2 upserts every file's guide + entries. This
  makes cross-file place references (e.g. Central Park owned by the Upper
  West Side file, referenced by the Upper East Side guide) order-independent.
  Prints each guide slug. Idempotent: re-running updates in place (same
  slug-keyed upserts as CT). `DataGuide` exposes `upsert_places!/1` and
  `upsert_guide!/2` (path, email) to support the two passes;
  `upsert_from_file!/2` composes both for single-file use (tests).

## 3. Generic town-explorer badges

Replace the five hardcoded CT `explorer-*` entries' *mechanism* (keep the
badge keys and names for continuity) with a data-driven rule source:

- `Ethos.Badges.definitions/0` gains dynamic town badges: for every town
  that has ≥3 open places, emit key `explorer-{town_slug}` with rule
  `{:town, town_slug, threshold}`. Default threshold = min(5, open-place
  count); a small overrides map carries the five CT towns' existing names
  AND thresholds verbatim (Brass City Explorer/5, Hat City Explorer/5,
  Middlebury Explorer/3, Southbury Explorer/3, Woodbury Explorer/3 — the
  small CT towns keep 3 even though they have ≥5 open places, so no
  user-facing change). Manhattan towns get default names "{Town} Explorer".
- The five CT static entries are removed from `@static_defs`; a test
  asserts the same five keys/names/thresholds still emerge dynamically
  (no user-facing regression; earned rows keyed by badge_key are
  unaffected).
- `first-steps`, `foodie`, `historian`, and county-complete stay as-is.
  Manhattan therefore ships ~38 explorer badges + "Manhattan Complete"
  automatically.

## 4. Research program

Two-agent pipeline per neighborhood, executed in waves (~8 neighborhoods
per workflow run, 5 runs), plus 3 Commons photo-scout agents (Downtown /
Midtown / Uptown landmark lists):

- **Researcher** (structured schema): history facts with source URLs
  (settlement/naming, defining era, one signature story), subway lines and
  stations serving the neighborhood, 3-5 parks/landmarks/museums, 3-5
  currently-operating restaurants/cafes (evidence bar: official site or
  2025-2026 signals), 0-3 hotels with evidence, closed_or_unverified list.
- **Verifier** (adversarial): refute operating-status and historical
  claims; verdicts confirmed/refuted/uncertain. Only `confirmed` content
  ships; `uncertain` is dropped or reworded to remove the unverified claim.
- Output persisted to scratch JSON per neighborhood, then transformed
  mechanically into the seed JSON files (no manual transcription).
- Photo scouts return Commons file page + direct URL + license + author
  for landmark shots; target 2-4 photos per neighborhood, PD/CC only.

## 5. Photos

Same pipeline as CT: download originals to git-ignored `images/ny/`, one
mix task `ethos.optimize_ny_photos` (mapping generated from the seed
JSONs' photo lists rather than hardcoded — it scans
`priv/seed_data/manhattan/*.json`, derives {town_slug, label, source file}
from each photo's `src`, and expects `images/ny/{label}.{ext}`), outputs
committed JPEG pairs under `priv/static/photos/ny/manhattan/{town_slug}/`.
Budget ≈ 120-150 photos ≈ 30 MB committed.

## 6. SEO

Nothing new required — hubs, typed place JSON-LD, sitemap, canonicals,
copy-links, and gallery attribution all apply automatically. Guide titles
follow "{Neighborhood}, Manhattan: {hook}" for search intent; FAQ includes
"How do I get to {neighborhood} by subway?" on every guide.

## 7. Testing

- `DataGuide` loader: valid file round-trip (places+guide+entries created,
  idempotent re-run), malformed JSON raises with path, unknown place_slug
  in entries raises, cross-file place reference resolves.
- A fixture seed JSON lives under `test/support/fixtures/seed_data/`.
- Badge dynamization: five CT keys/names/thresholds unchanged; a town with
  3 open places gets threshold 3; town with ≥5 gets 5; towns with <3 open
  places emit no badge.
- Seed-data validation test: every committed
  `priv/seed_data/manhattan/*.json` loads in a sandbox transaction —
  run-twice idempotency across the full set; every photo src/thumb
  resolves to a committed file; every license in the allowlist.
- Existing suite (270) stays green.

## 8. Rollout

Spec → plan → subagent-driven execution: (1) DataGuide loader + badge
dynamization + mix task, (2) research waves, (3) JSON authoring +
photos in batches (Downtown → Midtown → Uptown), (4) full-set validation,
(5) merge, deploy, `Ethos.Release.seed_manhattan("cryptcom@gmail.com")`,
verify live on ethosguides.com, push.

## Global constraints

- Phoenix 1.7.14 conventions; zero AI/API calls in all shipped code.
- Content policy and image licensing rules above.
- Public changesets never cast privileged fields (place_id, source,
  credited_user_id, state/county remain as-is per prior rulings).
- All external URLs behind `EthosWeb.Url.safe_http?/1`; photo source_urls
  validated at write time (guide + place changesets, both already enforced).
- `mix format` clean, full suite green before every commit.
