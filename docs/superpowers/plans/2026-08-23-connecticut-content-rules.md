# Connecticut Content Authoring Rules

Binding rules for every content-wave task in
`docs/superpowers/plans/2026-08-23-connecticut-expansion.md`. Read this
whole file before authoring any seed JSON.

## Inputs

For each town you are assigned, two research artifacts (paths in your
dispatch):

- `research/connecticut/{slug}.json` — `{"town", "found": {history_facts,
  getting_there, attractions, food, lodging, closed_or_unverified},
  "verify": {"verdicts": [...]}}`.
- `research/connecticut/photos-wave{N}.json` — Wikimedia Commons photo
  candidates: `{landmark, town, file_page_url, direct_image_url, license,
  author, notes}`.

## Verdict filtering (non-negotiable)

- REFUTED items: excluded, or corrected exactly per the verifier's
  correction.
- UNCERTAIN places/lodging: excluded. Uncertain history facts may be kept
  only by rewording to remove the disputed specific.
- Unchecked items: keep only when the researcher's evidence cites an
  official site or 2025-2026 coverage.
- Never add facts, superlatives, dates, addresses, or rail stops not in
  the research. Fewer, verified items beat padding.

## Seed JSON shape

Output file: `priv/seed_data/connecticut/{slug}.json` (all string keys):

```json
{
  "guide": {
    "slug": "{slug}-ct-travel-guide",
    "title": "{Town}, Connecticut: {specific hook, 4-8 words}",
    "destination": "{Town}, Connecticut",
    "state": "Connecticut",
    "county": "{County} County",
    "intro": "markdown, 100-155 words (hard ceiling 160 — count)",
    "sections": [{"heading": "...", "body": "markdown"}],
    "faq": [{"question": "...", "answer": "..."}],
    "photos": [ {7-key photo map} ]
  },
  "places": [ { "slug", "name", "kind", "town": "{Town}",
    "state": "Connecticut", "county": "{County} County", "address",
    "official_url (omit if none)", "summary", "history (optional)",
    "status": "open", "photos": [...] } ],
  "entries": [ {"kind": "sight|food|stay|walk", "name", "place_slug", "note"} ],
  "links": [ {"target": "guide:<slug>|place:<slug>", "kind":
    "nearby|shared-history|same-region|see-also", "note": "≤160 chars or null"} ]
}
```

County values by town are listed in the plan's wave tables — copy exactly
(e.g. "Fairfield County", "New London County").

## Guide content requirements

- **Intro**: history-forward editorial voice, 100-155 words (count them),
  built only from verified history_facts. No first-person fabrication, no
  filler ("nestled", "hidden gem", "vibrant"), no unverifiable superlatives.
- **Sections** (2-3): one history deep-dive; one **"Getting there"**
  section from the research getting_there data — highway corridors and
  ONLY research-verified rail (Metro-North New Haven Line/branches, Shore
  Line East, Amtrak, CTrail Hartford Line). Never invent a station.
  Optional third section where research supports it (beaches, antiques
  row, where-to-stay honesty note using the LODGING NOTE).
- **FAQ** (4-6): must include "How do I get to {Town}?" answered from
  getting_there. Others only from verified material.
- **Entries** (6-12): each references a place_slug defined in THIS file.
  attractions/parks → "sight" (or "walk" when framed as a stroll),
  food → "food", lodging → "stay".
- **Places** (6-12): kinds from `museum theater restaurant cafe brewery
  hotel bnb park historic-site amusement-park attraction`. Historic inns →
  "bnb" unless a large full-service hotel. Addresses/official_urls only
  from research. status "open".

## Links (the graph — required this round)

Each file's `links` array must include:
- `nearby` edges to adjacent covered towns (this wave's towns, earlier
  waves' towns, the original CT five `{waterbury,danbury,middlebury,
  southbury,woodbury}-ct-travel-guide`, and Manhattan where the dispatch
  says so). Reference ONLY slugs that exist by seed time — your dispatch
  lists which targets are safe; two-pass seeding makes same-directory
  targets safe regardless of file order.
- `shared-history` edges where the research supports a real link (with a
  ≤160-char note quoting the connection).
- Optional `see-also` for special cases named in your dispatch (e.g. New
  Haven Line towns → `guide:midtown-manhattan-guide` with a Metro-North
  note).
- One direction per pair is enough (rendering unions both directions).

## Place slugs — GLOBAL uniqueness

A place slug must be unique across: `priv/seed_data/connecticut/*.json`,
`priv/seed_data/manhattan/*.json`, AND the CT-5 code-module places in
`lib/ethos/seeds/connecticut_places.ex` (grep it). Suffix generic names
with `-{town slug}`. The validation test enforces this — check before
writing.

## Photos

- 2-3 per town, chosen ONLY from the wave's photo artifact; licenses
  limited to Public domain, CC0, CC BY x.x, CC BY-SA x.x. Copy
  author/license verbatim; `source_url` = the Commons file page URL.
- Paths: `/photos/ct/{town_slug}/{label}.jpg` + `..._thumb.jpg`. Labels
  kebab-case, unique GLOBALLY across all towns/boroughs (the optimizer
  resolves sources by label — when in doubt suffix `-{town slug}`).
  Record `{town_slug}/{label} → direct_image_url` pairs in your report.
- No acceptable candidates → `"photos": []`.

## Validation before commit

`mix test test/ethos/seeds/connecticut_seed_data_test.exs` (validates ALL
committed connecticut files + cross-source slug ownership + licenses +
load-twice idempotency) then full `mix test`. Both green.

## Copy quality bar

Concrete, specific, warm but not breathless. Titles
"{Town}, Connecticut: {hook}" where the hook names something real
("Whaling Money and a Submarine Base", not "A Coastal Gem").
