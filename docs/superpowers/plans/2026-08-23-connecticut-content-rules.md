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
- One direction per pair is enough (rendering unions both directions), and
  direction is free: links are applied in their own seeding pass, so a file
  may link to any guide in the run regardless of file order.
- `nearby` means the two towns **share a border**. Towns that are close but
  have another town between them (New Haven and Branford, Milford and
  Bridgeport, Meriden and Waterbury) are `same-region`, not `nearby` — a
  wave-2 review caught five of these. When you are not certain two towns
  border each other, use `same-region`.
- A note attached to an edge is a factual claim like any other: it must
  trace to the research for one of the two towns. Do not characterise a
  town's region, nickname, or industry from your own knowledge.

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

## Tiers (Connecticut completion onward)

Every seed file declares `"tier"` inside its `guide` object: `"guide"` or
`"town-page"`. Omitting it means `"guide"`.

**The tier is decided by the research, after verdict filtering — never by the
town's reputation beforehand.** Count the places that survive filtering:

- **6 or more → `"guide"`.** The full format, exactly as specified above.
- **Fewer than 6 → `"town-page"`.** The orientation format below.

Record the surviving count and the resulting tier in your report so the
reviewer can check the call rather than take it on trust. A town nobody
expects much from can earn a full guide; a well-known town whose listings
will not verify does not get padded into one. The validation gate is
deliberately looser than this rule — it fails only clear mislabels (a
town-page with 6+ places, or a guide with fewer than 4). Meeting the gate is
not the same as making the right call; the per-wave reviewer checks the call
itself against your recorded count.

### The orientation format

- **Intro**: 90-130 words, history-forward, from verified `history_facts` only.
- **Sections**: a "Getting there" section, from the research's `getting_there`
  data. Optional second section only where the research genuinely supports one.
- **Entries and places**: every verified place, however few. If a town yields
  ZERO verified places, ship `"places": []` and `"entries": []` — the template
  omits the section rather than rendering it empty.
- **FAQ**: 2-3 entries, one of which is "How do I get to {Town}?".
- **Photos**: one if a free-licensed candidate exists for that town, otherwise
  `"photos": []`. Do not reach for a loosely-related image.
- **Links**: at least 3, and this is a floor the validation test enforces.

### The floor — what does not ship

An orientation page must clear BOTH:

- an intro of at least 90 words of real, town-specific history, and
- at least 3 outbound links to neighbouring covered towns.

A town that cannot clear the floor is **omitted**, and the omission is recorded
in your wave report with the reason. Never ship a stub to fill the roster.

### Proximity language

No drive times, ever — nothing in the research supports them. State proximity
in checkable terms only: "borders Canterbury", "12 miles north of Norwich on
Route 97". Distances and roads come from the research like any other fact.

**This rule is now mechanically enforced.** Restating it in every wave's
dispatch and checking for it in every review was proven insufficient — task
55 found 58 drive-time occurrences across 28 already-committed files despite
both. `test/ethos/seeds/connecticut_seed_data_test.exs` now asserts that no
committed Connecticut seed file matches a ported set of drive-time/duration
patterns (digit-minute forms, half/quarter/hour-plus-drive forms, spelled-out
numbers five through ninety, and vague "short/quick/easy drive" phrasing);
the assertion fails the build and names the offending file and text if the
ban is violated. Do not write around the gate by phrasing a duration it
happens not to catch — the ban is on the underlying claim, not the specific
wording the regex looks for.

A drive-time claim can hide in any of **six places**, and across several
waves at least one of the six survived a pass that fixed the others: the
**intro**, a **section body**, an **FAQ answer**, a **place summary**, a
**photo caption/description**, and a **link note**. When editing proximity
language, check all six for the town(s) involved, not just the "Getting
there" section — the mechanical gate checks every string in the file, and a
human review pass should too.
