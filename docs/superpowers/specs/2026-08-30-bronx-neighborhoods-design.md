# The Bronx: Neighborhood Coverage

**Status:** approved design, ready for planning
**Date:** 2026-08-30
**Predecessors:** `docs/superpowers/specs/2026-08-28-brooklyn-neighborhoods-design.md`,
`docs/site-builder.md`

## Goal

Cover the Bronx neighborhood by neighborhood, to the standard Brooklyn and
Manhattan already meet: history, getting there, parks, eateries, lodging, and
the places a traveler would actually go.

This is the third borough and the fourth run of a pattern that now has a written
form. The spec is short because most of the decisions are already made and
recorded — it names only what is different about the Bronx.

## What already exists, and what it means

**The Bronx is not empty.** `lib/ethos/seeds/yankee_stadium_places.ex` holds
twelve places carrying `county: "Bronx"`, and `/g/yankee-stadium-guide` is live
from the ballpark programme. `/destinations/new-york/bronx` therefore already
exists — a Bronx guide carrying `state: "New York", county: "Bronx"` slots into
a hub that is already serving.

**A new seed directory inherits the corpus-wide gates for free.**
`SeedDataHelpers.all_seed_files/0` globs `priv/seed_data/*/*.json` excluding
`destinations/`, so `priv/seed_data/bronx/` picks up global slug uniqueness, the
banned-prose scan, and the loader plus `Place.changeset`/`Guide.changeset`
validation the moment its first file lands. What it does **not** inherit is any
per-directory gate; that has to be written.

**Borough-as-county is established.** Brooklyn guides carry `county: "Brooklyn"`
and Manhattan guides `county: "Manhattan"` — never the legal county name. The
Bronx follows: `county: "Bronx"`, not `"Bronx County"`. The ballpark programme's
verifier caught a finder proposing the legal name and refuted it against this
convention, because `"Bronx County"` would derive `bronx-county` and split the
borough hub away from its neighbours.

## Design

### The roster

`priv/seed_data/bronx_roster.json`, in Brooklyn's exact shape:

```json
{"borough": "Bronx",
 "source": "NYC Department of City Planning Neighborhood Tabulation Areas, ...",
 "neighborhoods": [{"slug": "...", "name": "...", "community_district": 0, "wave": 0}]}
```

Committed before any research, so nothing is silently skipped. Its test asserts
membership, uniqueness, and the **attribution** fields — not only that entries
exist but that each names the right community district and wave, because the
field a wave dispatches on is the one that must not drift. That lesson cost a
mutation test to learn on the bare-places roster.

### Two tiers, decided after research

A neighborhood earns a full guide when **six or more verified places survive**
its research; otherwise it ships as a `tier: "town-page"` orientation page.
Brooklyn ended 37 guides to 32 orientation pages.

The Bronx will likely skew further toward orientation pages. Large stretches of
it are residential with little for a visitor, and saying so plainly is the point
— the alternative is padding, which is the defect this project has spent the
most effort removing.

**The tier is an outcome, not an input.** It is set after the verifier reports,
never assigned in the roster.

### Getting there — same structure, different weighting

One unified section per neighborhood covering **subway, Metro-North, bus and
ferry**, as Brooklyn's did.

The weighting genuinely differs. Metro-North's Harlem and Hudson lines matter
more than the subway for the northern and western neighborhoods, and NYC Ferry
serves Soundview. A section that leads with the subway everywhere would be
accurate for the South Bronx and wrong for Riverdale.

Stations, lines and landings are named. **Trip durations are banned outright**,
including the vague form "a short walk", and are gated.

### The gate — ported from the strongest copy, not from Brooklyn's

`test/ethos/seeds/bronx_seed_data_test.exs`, scoped to `seed_files("bronx")`.

**Port the duration gate from `destination_seed_data_test.exs`, not from
`brooklyn_seed_data_test.exs`.** This is the one place the Bronx should not copy
Brooklyn. `site-builder.md` ranks the three existing copies: Brooklyn's has
eleven patterns and **no specimens**, so its own comment records that patterns 4
through 11 could be deleted or quietly weakened and the suite would stay green.
The destination copy is byte-identical in patterns and adds
`@trip_duration_specimens` plus a test asserting each pattern is individually
load-bearing.

The gate also carries the **proximity ban** the ballpark programme produced —
"N blocks south", "next door", "across the street from", "steps from", "within
walking distance" — with its nine measured patterns and its must-pass list of
sourced spatial claims, so a gate that bans the checkable form does not push
authors toward vagueness.

Plus, as Brooklyn's had: licence allowlist, photo labels globally unique, every
referenced photo present on disk, manifest provenance matching the published
credit, and roster equality failing in both directions.

### The overlap rule

**Neighborhood guides reference the twelve existing Yankee Stadium places by
slug and never re-create them.** The global slug-uniqueness gate enforces this
mechanically; the research contract's **address check** catches the case no
index can — the same business proposed under a different name.

Concourse and Highbridge are the neighborhoods most likely to hit this.

### Photos

Wikimedia Commons only, licences restricted to `Public domain`, `CC0`,
`CC BY x.y`, `CC BY-SA x.y`. `priv/seed_data/bronx_photo_manifest.json` pins each
label to its Commons file URL and the sha256 of the download.
`mix ethos.optimize_bronx_photos` delegates to `Ethos.PhotoManifest` rather than
adding a fifth near-duplicate optimizer.

**Open each image and confirm it depicts what the candidate claims** — fourteen
candidates across the Brooklyn programme did not. A neighborhood shipping with
no photo is an expected and acceptable outcome.

### The research contract

`docs/site-builder.md` §4 binds unchanged: finder plus **independent**
adversarial verifier, the finder never writing verdicts, `searched` recorded per
place, closure requiring positive evidence, a business's own site unable to
establish an award or that it is still trading, and no minimum length.

Two contract items the ballpark programme added apply here directly:

- **Uncertain identity blocks publication; uncertain trading does not.** A place
  whose current name or address is unestablished has nothing left to publish.
- **A verdict decides the name, and the slug follows the name.** Nothing enters
  a URL that a verdict does not carry.

## Sequencing

1. Roster and gate — neither needs search.
2. **One neighborhood end to end as a checkpoint**, reviewed, contract amended
   before the rest. The ballpark checkpoint returned twelve findings off a single
   site, five of them critical, and every one would have compounded.
3. Waves, sized to whatever search budget exists.

## Risks

**Search access is the binding constraint, as it has been on every recent wave.**
The ballpark programme's agents had `WebSearch 200/200` exhausted before their
first query and still produced 698 confirmed verdicts, by falling back to
municipal open data queried block by block. New York City publishes DOHMH
restaurant inspections and business licence data, so that fallback exists here —
better than most of the ballpark cities had.

**Inspection records license existence, never description.** NYC DOHMH data is
good evidence a place is still trading and may support a status verdict. It may
never appear in prose. Twenty summaries in the Brooklyn corpus read as
boilerplate because that rule did not exist when they were written, and removing
that took a dedicated cleanup of 55 fields.

**Neighborhood boundaries in the Bronx are contested**, as they were in
Brooklyn. Boundary language stays hedged; no guide asserts a definitive line.

## Success criteria

- Every NYC DCP Bronx neighborhood has a page, tiered by what research found.
  *Superseded 2026-08-31 by `docs/superpowers/specs/2026-08-31-narrowed-nyc-scope-design.md`: 14 in-scope neighborhoods, not all 66.*
- Every published claim traces to a verifier's verdict.
- No place slug collides with the existing corpus, and no Yankee Stadium place
  is duplicated under a new name.
- The Bronx gate carries the specimen-backed duration patterns and the proximity
  patterns, with empty allowlists.
- Photo credits byte-identical to their Commons source; manifest reconciles with
  disk.
- Full suite green.
