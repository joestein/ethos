# Manhattan Content Authoring Rules

Binding rules for every content-wave task in
`docs/superpowers/plans/2026-08-22-manhattan-neighborhoods.md` (Tasks 4-8).
Read this whole file before authoring any seed JSON.

## Inputs

For each neighborhood you are assigned, you receive two JSON research
artifacts (paths given in your dispatch):

- `research/manhattan/{slug}.json` — `{"neighborhood", "found": {...},
  "verify": {"verdicts": [...]}}` where `found` has `history_facts`,
  `subway`, `attractions`, `food`, `lodging`, `closed_or_unverified`.
- `research/manhattan/photos-{wave}.json` — Wikimedia Commons photo
  candidates: `{landmark, town, file_page_url, direct_image_url, license,
  author, notes}`.

## Verdict filtering (non-negotiable)

- An item whose verifier verdict is `refuted` is EXCLUDED (or, if the
  verifier gave a correction, use the corrected fact and keep it).
- An item whose verdict is `uncertain` is EXCLUDED from places/lodging.
  History facts marked uncertain may be kept ONLY by rewording to remove
  the unverified specific (e.g. drop the disputed date).
- Items the verifier did not check: keep only if the researcher's evidence
  cites an official site or 2025-2026 coverage.
- Never add facts, places, superlatives, or dates that are not in the
  research artifacts. Fewer, verified items beat more, padded ones.

## Seed JSON shape

Output file: `priv/seed_data/manhattan/{slug}.json`, exactly this shape
(all string keys):

```json
{
  "guide": {
    "slug": "{slug}-manhattan-guide",
    "title": "{Neighborhood}, Manhattan: {specific hook, 4-8 words}",
    "destination": "{Neighborhood}, New York",
    "state": "New York",
    "county": "Manhattan",
    "intro": "markdown, 100-160 words",
    "sections": [{"heading": "...", "body": "markdown"}],
    "faq": [{"question": "...", "answer": "..."}],
    "photos": [ { "src": "...", "thumb": "...", "title": "...",
      "description": "...", "author": "...", "license": "...",
      "source_url": "https://commons.wikimedia.org/wiki/File:..." } ]
  },
  "places": [
    { "slug": "...", "name": "...", "kind": "...", "town": "{Neighborhood}",
      "state": "New York", "county": "Manhattan", "address": "...",
      "official_url": "... or omit", "summary": "1-3 sentences",
      "history": "optional markdown", "status": "open",
      "photos": [ ...same 7-key maps or [] ] }
  ],
  "entries": [
    {"kind": "sight|food|stay|walk", "name": "...", "place_slug": "...",
     "note": "1-2 sentence editorial note"}
  ]
}
```

## Guide content requirements

- **Intro**: history-forward editorial voice ("SoHo's cast-iron lofts were
  the factories of…"), never first-person fake experiences, 100-160 words,
  built only from verified history_facts.
- **Sections** (2-3): one history deep-dive from history_facts (with the
  richest verified material); one **"Getting there by subway"** section
  built from the research `subway` data (lines, stations, one practical
  sentence). Optional third section where the research supports it
  (e.g. "Where to stay" honesty note when lodging is empty — name the
  nearest verified option from the research's LODGING NOTE).
- **FAQ** (4-6): must include "How do I get to {Neighborhood} by subway?"
  answered from the subway data. Others from verified material only
  (name origin, best park, is X still open, where to stay).
- **Entries** (6-12): every entry references a `place_slug` defined in
  this file (or a documented cross-file slug — only if your dispatch names
  one). kinds: attractions/parks → "sight" (or "walk" for a park/greenway
  you frame as a stroll), food → "food", lodging → "stay".
- **Places** (6-12 per neighborhood): kinds from
  `museum theater restaurant cafe brewery hotel bnb park historic-site
  amusement-park attraction`. town = neighborhood display name. Addresses
  and official_urls only from research (omit `official_url` key if none;
  never invent). status "open" (excluded items simply don't ship).

## Place slugs

- Kebab-case of the name. If the name is generic or could exist in another
  neighborhood ("corner-bistro" is fine; "the-park", "city-diner" are not),
  append `-{neighborhood slug}`.
- A slug must be defined as a place in exactly ONE file across all of
  `priv/seed_data/manhattan/` (the validation test enforces this). Check
  existing files before writing.

## Photos

- Choose 2-4 photos per neighborhood from the photo research artifact ONLY
  (license must be Public domain, CC0, or CC BY / CC BY-SA any version).
  Copy author/license/file_page_url verbatim into the photo map
  (`source_url` = the file page URL).
- `src`/`thumb` paths: `/photos/ny/manhattan/{slug}/{label}.jpg` and
  `..._thumb.jpg` where `{label}` is a short kebab label unique within the
  neighborhood. The label must match the downloadable original — record
  `{label} → direct_image_url` pairs in your report so the photo task can
  fetch them. Attach photos to the guide gallery; also attach to a place's
  `photos` when the photo depicts that specific place.
- Neighborhoods with no acceptable Commons candidates get `"photos": []`
  (guide layout tolerates it) — never substitute an unlicensed image.

## Validation before commit

Run: `mix test test/ethos/seeds/manhattan_seed_data_test.exs` — it loads
every committed seed file (structure, load-twice idempotency, global slug
ownership, license allowlist). It must pass with your files added. Also
run `mix test` (full suite) before committing.

## Copy quality bar

Write like the CT guides: concrete, specific, warm but not breathless.
No filler ("nestled in the heart of"), no unverifiable superlatives
("best pizza in NYC"), no AI-tells ("vibrant tapestry"). Titles follow
"{Neighborhood}, Manhattan: {hook}" — the hook names something real
("Cast Iron and Gallery Blocks", not "A Hidden Gem").
