# Queens: Neighborhood Coverage

**Status:** approved design, ready for planning
**Date:** 2026-08-31
**Predecessors:** `docs/superpowers/specs/2026-08-30-bronx-neighborhoods-design.md`,
`docs/superpowers/specs/2026-08-28-brooklyn-neighborhoods-design.md`,
`docs/site-builder.md`

## Goal

Cover Queens neighborhood by neighborhood, to the standard Brooklyn, Manhattan
and (in progress) the Bronx meet: history, getting there, parks, eateries,
lodging, and the places a traveler would actually go.

This is the fourth borough and the fifth run of a pattern that has a written
form. The spec names only what is different about Queens.

## Scope of this spec — read this first

**This spec covers the scaffolding only. It commissions no research.**

The deliverable is the roster, the gate, the seeder, the release test, and the
runbook entry. `priv/seed_data/queens/` ends this work holding nothing but
`.gitkeep`.

Research waves queue **behind the Bronx's remaining 65 neighborhoods**, by the
owner's explicit sequencing decision of 2026-08-31. The reason to write the
scaffolding now rather than alongside the research is that the Flushing overlap
(below) is a decision best made while the evidence is in front of us, and it is
exactly the kind of decision that gets skipped under research pressure.

Two costs of that ordering, booked here so they are not discovered later:

- The gate sits in the tree **excluded and running nothing** for as long as the
  Bronx takes. See "The gate" for why it cannot simply run.
- The roster books a ~100-neighborhood research commitment against capacity that
  is currently rate-limited. Booking it does not create the capacity.

## What already exists, and what it means

**Queens is occupied, and differently than the Bronx was.**

`lib/ethos/seeds/citi_field_guide.ex` carries `destination: "Flushing, New
York"`, `state: "New York"`, `county: "Queens"`.
`lib/ethos/seeds/citi_field_places.ex` holds eight places split across
`town: "Flushing"` and `town: "Corona"` — real town names, not flattened to the
borough, which is the same slot a neighborhood guide occupies.

So `/destinations/new-york/queens` is already serving, and **Flushing already
exists as a destination**.

**The Flushing overlap is a merge, not a shadow.** Both the Citi Field guide and
a future Flushing neighborhood guide would carry the same destination string,
derive the same `destination_slug`, and co-list under one destination. That is
the correct outcome — a destination page exists to group the guides that share
it.

This is worth stating precisely because it resembles a defect that has already
bitten this project once and is **not** the same thing. The
`/destinations/washington` collision was a *state hub* silently shadowed by a
*town* of the same name, across two different states; `Guides.list_guides_shadowed_by_state/1`
exists because of it. Two town-level destinations in the same state do not
shadow — they merge. Correct-today and asserted are different states, so the
gate asserts it.

**No other collision exists.** A scan of all 273 destination strings across
`priv/seed_data/` found zero matches against the Queens neighborhood name set —
including the names most likely to collide nationally (Corona, Astoria, Glendale,
Ridgewood, Elmhurst, Richmond Hill, St. Albans, Springfield Gardens, Floral
Park). The only overlap in the whole corpus is the code-defined Flushing guide.

**A new seed directory inherits the corpus-wide gates for free.**
`SeedDataHelpers.all_seed_files/0` globs `priv/seed_data/*/*.json` excluding
`destinations/`, so `priv/seed_data/queens/` picks up global slug uniqueness, the
banned-prose scan, and loader plus changeset validation the moment its first file
lands. It inherits no per-directory gate; that has to be written.

**Borough-as-county is established and unchanged.** `county: "Queens"`, never
`"Queens County"` — the legal name would derive `queens-county` and split the
borough hub away from its neighbours. Note that Queens is the one borough where
the two names differ only by the suffix, which makes the wrong one look more
plausible than `"Kings"` did for Brooklyn. The gate asserts the county value.

## Design

### The roster

`priv/seed_data/queens_roster.json`, in Brooklyn's and the Bronx's exact shape:

```json
{"borough": "Queens",
 "source": "NYC Department of City Planning Neighborhood Tabulation Areas, ...",
 "neighborhoods": [{"slug": "...", "name": "...", "community_district": 0, "wave": 0}]}
```

No `tier` field. Committed before any research, so nothing is silently skipped.

Queens has **14 community districts** and runs to roughly 100 neighborhoods. The
exact count is deliberately not asserted here: the DCP tabulation areas and the
commonly-used neighborhood list disagree at the edges, and reconciling them is
the roster task's actual work. The roster task pins the number; this spec does
not pre-commit to one it has not verified.

Its test asserts membership, uniqueness, **and the attribution fields** — that
each entry names the right community district and wave, not merely that entries
exist. The field a wave dispatches on is the field that must not drift; the
bare-places roster cost a mutation test to learn that.

### Two tiers, decided after research

A neighborhood earns a full guide when **six or more verified places survive**
its research; otherwise it ships as a `tier: "town-page"` orientation page.

**The tier is an outcome, not an input.** Set after the verifier reports, never
assigned in the roster.

Queens should skew toward guides more than the Bronx will. Jackson Heights,
Flushing, Astoria, Elmhurst, Long Island City, Richmond Hill, Sunnyside,
Woodside, Corona and Jamaica are dense commercial neighborhoods with deep and
well-documented food scenes. The Rockaways and the eastern edge will skew
town-page. Brooklyn ended 37 guides to 32 orientation pages; Queens should land
above that ratio. That is an expectation, not a target — a target would be an
argument for padding, which is the defect this project has spent the most effort
removing.

### Getting there

One unified section per neighborhood covering **subway, LIRR, bus, ferry and
AirTrain**.

The weighting genuinely differs from both prior boroughs:

- **The LIRR is not a footnote in Queens.** Jamaica is the LIRR's own hub, and
  for the eastern and southern neighborhoods it is the primary regional link.
- **NYC Ferry** serves Astoria, Long Island City and the Rockaways — the
  Rockaway route is the longest in the system and materially changes how a
  visitor reaches the peninsula.
- **Both airports sit inside the borough**, and they are reached differently.
  JFK connects by AirTrain from Jamaica and Howard Beach; **LaGuardia has no
  AirTrain** — that project was cancelled in 2023 — and is reached by bus, the
  Q70 and the M60 among them. Both are transit facts for the neighborhoods around
  them, and the asymmetry is the sort of detail a guide gets wrong by symmetry.

A section that led with the subway everywhere would be accurate for the western
neighborhoods and wrong for the eastern half.

Stations, lines, landings and route numbers are named. **Trip durations are
banned outright**, including the vague form "a short walk", and are gated.

### The gate

`test/ethos/seeds/queens_seed_data_test.exs`, scoped to `seed_files("queens")`.

**Port from `test/ethos/seeds/bronx_seed_data_test.exs`.** Named explicitly
because there are now several copies of these patterns and they are not of equal
strength. The Bronx copy is the strongest: it already merged the eleven
trip-duration patterns *with* the `@trip_duration_specimens` that prove each one
individually load-bearing, the ballpark programme's nine vague-proximity patterns
with their must-pass list of sourced spatial claims, and Brooklyn's remainder.
**Do not port from `brooklyn_seed_data_test.exs`** — its own comment records that
its fixture fires only patterns 1, 2 and 3, so patterns 4 through 11 could be
deleted or quietly weakened there and the suite would stay green.

Carried over unchanged: licence allowlist, photo labels globally unique, every
referenced photo present on disk, manifest provenance matching the published
credit, roster equality failing in both directions, and the non-vacuity floors.

Two additions specific to Queens:

- **A no-re-creation assertion** naming the eight Citi Field place slugs
  literally: `citi-field`, `unisphere`, `queens-museum`,
  `new-york-hall-of-science`, `queens-zoo`,
  `usta-billie-jean-king-national-tennis-center`, `new-york-state-pavilion`,
  `queens-theatre`. Global slug uniqueness already catches the exact-slug case
  mechanically; this assertion exists so that a **rename** cannot slip past as a
  new place, and it fails loudly if any of the eight ever disappears from
  `citi_field_places.ex`, which would mean the list it guards has gone stale.
  The research contract's address check covers the remaining case — the same
  business proposed under a different name.
- **A Flushing destination-string assertion.** Kept a pure data assertion so it
  needs no database: when `priv/seed_data/queens/flushing.json` exists, assert
  its guide's `destination` string is byte-identical to
  `Ethos.Seeds.CitiFieldGuide.data().destination` — `"Flushing, New York"`.
  Identical strings derive identical `destination_slug`s, which is what makes the
  two guides co-list rather than compete. This assertion carries
  `@tag :pending_queens`; it cannot pass before Flushing is researched.

#### Staging: what runs when

`priv/seed_data/queens/` is empty for the whole of this work, and the gate's
non-vacuity floors (`assert files != []` and friends) **fail by construction over
an empty directory**. So:

- **This spec's gate task** gives the module a whole-file `@moduletag
  :pending_queens`. Nothing in it runs. A gate that is red because there is
  nothing to check yet is noise a later implementer cannot distinguish from their
  own regression — the Bronx gate's moduledoc records this reasoning and the
  Bronx made the same call at its Task 2.
- **The first Queens research wave** lands the first seed file and deletes the
  `@moduletag` line. Every corpus-scanning test becomes meaningful at that
  moment.
- **The final wave** deletes the remaining `@tag :pending_queens` lines — on
  roster equality, marquee, and the Flushing destination-string assertion — and
  the `:pending_queens` entry in `test/test_helper.exs`. The tags go; the tests
  stay and start running.

Be honest about what this buys: **the gate is written and reviewed, not
enforcing.** Its value is that the decisions are captured while the evidence is
fresh. It is not coverage, and nothing should be described as gated until the
moduletag comes off. The trip-duration specimens remain live throughout via the
existing `destination_seed_data_test.exs` and `bronx_seed_data_test.exs` copies,
which run today; the Queens copy adds no liveness while dormant.

#### The tag, and the ExUnit hazard

`:pending_queens` is a **third** tag, deliberately distinct from `:pending_bronx`
and `:pending_wave`. `:pending_wave` belongs to the place-research backlog, which
still owes 320 places; `:pending_bronx` belongs to a programme that is mid-flight.
Sharing a tag across programmes means whichever finishes first either cannot
delete it or, deleting it, un-excludes an unrelated gate that fails on defects it
never touched.

**`ExUnit.configure(exclude:)` replaces the list rather than appending to it.**
`:pending_queens` must be added to the single existing call in
`test/test_helper.exs`, producing `exclude: [:pending_wave, :pending_bronx,
:pending_queens]`. A second `ExUnit.configure` call would silently re-enable both
existing exclusions and turn the suite red on pre-existing defects. This project
has already paid for this lesson once; the comment above that call records it.

### The overlap rule

**Neighborhood guides reference the eight existing Citi Field places by slug and
never re-create them.** Flushing and Corona are the affected neighborhoods.

The Flushing guide additionally overlaps the Citi Field guide in *subject*, not
only in places: both cover Flushing Meadows–Corona Park. The neighborhood guide
covers the neighborhood and points at the ballpark guide for the park and the
World's Fair remnants; it does not restate them. Two guides on one destination
are useful only if they are about different things.

### Seeder, release test, runbook

`Ethos.Release.seed_queens/1`, mirroring `seed_bronx/1`, with a release test in
`test/ethos/release_test.exs` in the shape of the existing `seed_bronx/1` test —
including its assertion that the function names a **directory that exists**,
which exists because a seeder pointed at a missing directory is a silent no-op.

Runbook order becomes `seed_manhattan` → `seed_connecticut` →
`seed_connecticut_expansion` → `seed_brooklyn` → `seed_bronx` → `seed_queens`.

**`docs/runbooks/seeding.md` currently documents no Bronx entry** — a known
outstanding Bronx close-out item, not introduced here. The Queens work adds its
own entry and should add the missing `seed_bronx` line at the same time, since
leaving one hole while writing the line below it is how the hole becomes
permanent.

### Photos

Deferred to the research phase, exactly as the Bronx deferred them.
`priv/seed_data/queens_photo_manifest.json` is created empty now so the manifest
path exists and the gate's provenance test has a target.

When photos do land: Wikimedia Commons only, licences restricted to
`Public domain`, `CC0`, `CC BY x.y`, `CC BY-SA x.y`, manifest pinning each label
to its Commons file URL and the sha256 of the download.

**The optimizer is deferred with them, and when written must delegate to
`Ethos.PhotoManifest`.** There are already eight near-duplicate
`ethos.optimize_*_photos` tasks; a ninth copied wholesale is a recorded
follow-up this programme should not worsen.

**Open each image and confirm it depicts what the candidate claims** — fourteen
candidates across the Brooklyn programme did not. A neighborhood shipping with no
photo is an expected and acceptable outcome.

### The research contract

`docs/site-builder.md` §4 binds unchanged when the waves eventually run: finder
plus **independent** adversarial verifier, the finder never writing verdicts,
`searched` recorded per place, closure requiring positive evidence, a business's
own site unable to establish an award or that it is still trading, and no minimum
length.

The rulings the Bronx programme added carry forward:

- **Verdicts gate publication; `searched` gates completeness accounting.** A
  throttled place with a confirmed verdict still ships.
- **Uncertain identity blocks publication; uncertain trading does not.**
  `status: "open"` renders nothing, so uncertainty constrains the verb, not the
  inclusion.
- **A verdict decides the name, and the slug follows the name.**
- **A `confirmed` verdict vouches only for what its own `item` text restates.**

## Sequencing

1. **Roster** — needs no search.
2. **Gate** — needs no search; ships excluded.
3. **Seeder, release test, runbook** — needs no search.
4. *(Deferred, behind the Bronx)* One neighborhood end to end as a checkpoint,
   reviewed, contract amended before the rest. Every prior programme's checkpoint
   returned findings that would otherwise have compounded across the whole
   corpus; the ballpark checkpoint returned twelve off a single site, five
   critical.
5. *(Deferred)* Waves, sized to whatever search budget exists.

Steps 1–3 are this spec's plan. Steps 4–5 get their own plan when the Bronx
closes.

## Risks

**Search access is the binding constraint**, as on every recent wave. The
ballpark programme's agents had `WebSearch 200/200` exhausted before their first
query and still produced 698 confirmed verdicts by falling back to municipal open
data. New York City publishes DOHMH restaurant inspections and DCWP business
licence data, and Belmont proved that fallback works in this borough's data
environment — 208 verdicts with web search exhausted before the first query.

A diagnosis worth not repeating: the 82% throttling rate was once attributed to
agent concurrency and re-run at a quarter of the agents, which did not help. The
limit is session-cumulative or source-side, and scheduling around concurrency
buys nothing.

**Inspection records license existence, never description.** DOHMH data is good
evidence a place is still trading and may support a status verdict. It may never
appear in prose. Twenty Brooklyn summaries read as boilerplate because that rule
did not exist when they were written, and removing it took a dedicated cleanup of
55 fields.

**Neighborhood boundaries in Queens are contested**, as in Brooklyn and the
Bronx, and Queens carries an extra wrinkle: it is the only borough where the USPS
postal names (Flushing, Jamaica, Astoria, Far Rockaway) cover far more ground
than the neighborhoods of the same name, so an address in "Flushing, NY 11355" is
not evidence that a place is in Flushing the neighborhood. Boundary language
stays hedged; no guide asserts a definitive line; postal city names are never
treated as neighborhood evidence.

**This gate does not run.** Stated again under risks because a dormant gate reads
in a file listing exactly like an active one, and the interval before the first
Queens wave is expected to be long.

## Success criteria

**For this spec's work (steps 1–3):**

- `queens_roster.json` exists, reconciled against DCP, with membership,
  uniqueness and attribution all asserted.
- The gate exists, ported from the Bronx copy, carrying both Queens-specific
  additions, whole-module excluded, with its staging documented in its own
  moduledoc.
- `:pending_queens` added to the **existing** `ExUnit.configure` call, with
  `:pending_wave` and `:pending_bronx` still present.
- `Ethos.Release.seed_queens/1` exists with a release test that would fail on a
  missing or wrong directory.
- Runbook documents `seed_queens`, and the missing `seed_bronx` entry alongside.
- Full suite green.

**For the deferred research phase:**

- Every roster neighborhood has a page, tiered by what research found.
- Every published claim traces to a verifier's verdict.
- No place slug collides with the existing corpus, and no Citi Field place is
  duplicated under a new name.
- The Flushing guide and the Citi Field guide co-list under one destination and
  do not restate each other.
- The moduletag and all three pending tags are gone.
