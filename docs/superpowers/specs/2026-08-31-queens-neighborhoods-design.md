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
bitten this project once. The `/destinations/washington` collision was a *state
hub* silently shadowed by a *town* of the same name, across two different
states; `Guides.list_guides_shadowed_by_state/1` exists because of it. **For
Flushing specifically, that shape is not in play**: two town-level destinations
in the same state do not shadow — they merge, and merging is the outcome we
want. Correct-today and asserted are different states, so the gate asserts it.

An earlier draft of this paragraph went further and claimed the
`/destinations/washington` shape "cannot recur here". **That claim was wrong and
is withdrawn.** It held only for Flushing, and only because Flushing's twin is
in the same state. Queens carries three cross-corpus name matches, two of them
cross-state, and those are exactly the shape that bit Washington. See the
corrected collision scan below.

**Correction: other collisions do exist, and the original scan could not see
them.** This spec previously read "No other collision exists", on the strength
of a scan of all 273 destination *strings* across `priv/seed_data/` that found
zero matches against the Queens neighborhood name set — including the names most
likely to collide nationally (Corona, Astoria, Glendale, Ridgewood, Elmhurst,
Richmond Hill, St. Albans, Springfield Gardens, Floral Park).

**That scan compared the wrong thing.** It compared full destination strings,
when what determines co-listing is the *derived slug*.
`Ethos.Guides.Guide.derive_destination_slug/1` (`lib/ethos/guides/guide.ex:74`)
splits the destination on a comma and keeps only the first part — **the state is
discarded**. So `"Newtown, New York"` and `"Newtown, Connecticut"` are two
distinct strings that both derive `newtown` and land on one destination page. A
string comparison reports them as no match; a slug comparison reports the
collision that will actually happen.

Re-run comparing derived slugs against all 273 seed destinations, the Queens
roster carries three:

| Roster row | Derived slug | Collides with |
| --- | --- | --- |
| Murray Hill | `murray-hill` | `priv/seed_data/manhattan/murray-hill.json` — "Murray Hill, New York" |
| Newtown | `newtown` | `priv/seed_data/connecticut/newtown.json` — "Newtown, Connecticut" |
| Roxbury | `roxbury` | `priv/seed_data/connecticut/roxbury.json` — "Roxbury, Connecticut" |

Murray Hill is the same-state merge shape, and the roster task already flagged
it as a naming concern. Newtown and Roxbury are **cross-state**, which is the
shape this spec wrongly said could not recur.

The same scan found a live instance nobody had caught, unrelated to Queens:
`priv/seed_data/brooklyn/madison.json` ("Madison, New York") and
`priv/seed_data/connecticut/madison.json` ("Madison, Connecticut") derive the
same `madison` slug and co-list on one destination page today. It is recorded in
`docs/content-defects.md`.

The gate carries a **Queens-scoped** derived-slug collision assertion — each
Queens seed file's derived destination slug against every non-Queens seed file's.
It is deliberately not corpus-wide: a corpus-wide check fails immediately on the
pre-existing `madison` collision, which this programme never touched, and a gate
that is red on someone else's defect gets excluded.

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

### Known roster uncertainties

The roster was built on 2026-08-31 from Wikipedia's fourteen Queens Community
Board articles — each board's own coverage list — reconciled against Wikipedia's
List of Queens neighborhoods. **Web search was unavailable for that pass**, so
the NYC Department of City Planning Neighborhood Tabulation Areas and community
district profiles, which are the underlying authority those pages cite, were
**not consulted directly**. The roster's `source` string says exactly that.

**A later editor must not "upgrade" that `source` string to claim NYC DCP
without actually re-verifying every assignment against DCP.** The string is
currently an honest account of what was read; making it claim an authority
nobody consulted would convert a known-approximate roster into a
falsely-authoritative one, and nothing downstream would report the change.

The assignments below **ship as they are**. Nothing reads `community_district`
except wave grouping: a wrong value batches a neighborhood into the wrong
research wave, but it never reaches the site and never drops the neighborhood
from the programme. They are itemized here — rather than left in a git-ignored
SDD workspace, which is how the Brooklyn research artifacts were lost — so the
re-check has a list to work from.

**Genuinely split across two districts — the assignment is a choice, not a
fact:**

- `long-island-city` (**1**) — split at Queens Plaza; CB1 and CB2 both list it.
- `dutch-kills` (**1**) — sits on the Queens Plaza boundary itself. NTA groups
  it with Queensbridge–Ravenswood (CD 1); the LIC article could support CD 2.
- `maspeth` (**5**) — CB2's coverage list also names Maspeth. The bulk is CD 5.
- `ozone-park` (**9**) and `south-richmond-hill` (**10**) — both names appear on
  CB9's *and* CB10's lists. The 9/10 split is a reading, not a citation.
- `springfield-gardens` (**12**) — on CB12's list, but extends into CD 13.
- `fresh-meadows` (**8**) — on CB8's list; part of the area is served by CD 11
  in practice.
- `wyckoff-heights` (**5**) — straddles the Brooklyn line into Bushwick
  (Brooklyn CD 4).
- `the-hole` (**10**) — straddles the Brooklyn line into East New York; on no
  board's list.

(`flushing-meadows-corona-park` was in this bucket, assigned **4** with CB4
claiming the park and CD 7 and CD 6 taking its ends. That row has since been
removed for the reason recorded under "The overlap rule".)

**Two sources disagree, and the community board's own list was taken:**

- `bay-terrace` (**7**) — CB7 claims it; the neighborhood list files it under
  Bayside, which is CD 11. **The single most contested entry in the roster.**
- `east-flushing` (**11**) — on CB11's list despite the name pointing at CD 7.
- `holliswood` (**8**) and `hollis-hills` (**11**) — CB8 and CB11 respectively
  claim them; the neighborhood list files both under Hollis, CD 12.
- `pomonok` (**8**) and `utopia` (**8**) — the neighborhood list files Pomonok
  under Flushing (CD 7) as well as Kew Gardens Hills (CD 8). CB8 was taken.
- `astoria-heights` (**1**) — filed under *both* Astoria (CD 1) and East
  Elmhurst (CD 3).
- `willets-point` (**7**) — on CB7's list; the neighborhood list groups it with
  northwestern Queens.

**Named on no board list — the CD was inferred from a parent neighborhood.**
Almost certainly right, but nothing read asserts them:

`court-square` (**2**, from Hunters Point), `old-astoria` and `hallets-point`
(**1**, from Astoria), `north-beach` (**3**, from East Elmhurst),
`downtown-flushing` and `broadway-flushing` (**7**, from Flushing),
`parkway-village` (**8**, from Kew Gardens Hills), `addisleigh-park` (**12**,
from St. Albans), `bellaire` (**13**, from Queens Village), `north-shore-towers`
(**13**, from Glen Oaks), `douglas-manor` (**11**, from Douglaston),
`bayside-hills` (**11**, from Bayside), `corona-heights` (**4**, from Corona),
and the Howard Beach sub-areas `old-howard-beach`, `hamilton-beach` and
`rockwood-park` (**10** — only `lindenwood` and `tudor-village` are on CB10's
own list).

**Confident, for contrast:** all of CD 14 (the Rockaway article states the whole
peninsula is CD 14), the CD 5 core (Ridgewood, Glendale, Middle Village, Fresh
Pond, Liberty Park), CD 6, CD 12's core, and CD 13's `meadowmere` and
`brookville` — each named explicitly on its own board's coverage list.

**Not a district concern, but flagged for the naming wave:** `murray-hill`
(**7**). The district is not in doubt; the *slug* collides with Manhattan's
Murray Hill. See the corrected collision scan above — this is one of the three
derived-slug collisions, and the roster task flagged it before that scan was
re-run.

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

Three additions specific to Queens:

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
  `@tag :pending_queens`; it cannot pass before Flushing is researched. **Its
  tag comes off in the wave that lands `flushing.json` — wave 5 of 12, not the
  final wave.** The co-listing invariant is this spec's stated reason for
  writing the scaffolding early, and leaving it unverified for seven waves after
  its subject has shipped would defeat that.
- **A derived-slug collision assertion, scoped to Queens.** For each Queens seed
  file, derive its guide's destination slug through the real
  `Guide.derive_destination_slug/1` and assert no *non-Queens* seed file derives
  the same one. This is the assertion the corrected collision scan above
  requires; it fires on `murray-hill`, `newtown` and `roxbury` when those waves
  land. Queens-scoped deliberately — corpus-wide it would go red immediately on
  the pre-existing `madison` collision, which is recorded in
  `docs/content-defects.md` and which this programme did not introduce. It
  carries no `@tag` of its own and activates with the moduletag.

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
- **The wave that lands `flushing.json`** — wave 5 of 12 on the current roster —
  deletes the `@tag :pending_queens` on the Flushing destination-string
  assertion. Not the final wave. The test self-guards on `File.exists?`, so it
  cannot pass before that wave and has nothing left to wait for after it, and
  the co-listing invariant is the reason this scaffolding was written early.
- **The final wave** deletes the remaining `@tag :pending_queens` lines — on
  roster equality and marquee, both of which genuinely need the whole corpus —
  and the `:pending_queens` entry in `test/test_helper.exs`. The tags go; the
  tests stay and start running.

Be honest about what this buys: **the gate is written and reviewed, not
enforcing.** Its value is that the decisions are captured while the evidence is
fresh. It is not coverage, and nothing should be described as gated until the
moduletag comes off. The trip-duration specimens remain live throughout via the
existing `destination_seed_data_test.exs` and `bronx_seed_data_test.exs` copies,
which run today; the Queens copy adds no liveness while dormant — with one
exception worth naming, since "adds nothing" is the kind of claim that stops
being true quietly. The Citi Field place-list accuracy test has no seed-directory
dependency and would pass today; the whole-module tag switches it off along with
everything else. That is a real, if small, cost of the blanket tag, accepted
because splitting one test into its own file to buy it back is not worth the
second file.

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

**The `flushing-meadows-corona-park` roster row is removed, and the Bronx
precedent does not transfer.** The roster originally carried a row for the park
itself, on the precedent of the Bronx roster's `bronx-park`,
`van-cortlandt-park` and `pelham-bay-park`. That precedent does not hold here,
and the difference is ownership: **the Bronx's park institutions are
seed-owned**, so a Bronx park row commissions a file that can hold real place
records. **Queens' are code-owned.** Every visitable institution in Flushing
Meadows–Corona Park is one of the eight `Ethos.Seeds.CitiFieldPlaces` slugs, the
gate forbids any Queens seed file from containing them, and the overlap rule
above assigns the park's subject matter to the Citi Field guide outright. The
row therefore commissioned a file that could only be an empty shell about a
subject it was not allowed to restate. Removing it loses no coverage —
`/g/citi-field-guide` already covers the park.

`willets-point` is **kept**. It has the same shape in milder form: it is a real
neighborhood with residents and streets, its own content does not reduce to the
eight code-owned places, and a wave can write it without restating the ballpark
guide.

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
