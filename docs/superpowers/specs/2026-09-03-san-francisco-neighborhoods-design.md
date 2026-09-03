# San Francisco Neighborhoods — Design

**Date:** 2026-09-03
**Status:** approved in chat, pending spec review

## Goal

Twenty-three San Francisco pages in the Ethos corpus — twenty visitor
neighborhoods and three standalone park pages — researched, sourced, gated,
illustrated and deployed, in the shape the Manhattan, Brooklyn, Bronx, Queens
and Rome programmes already ship.

This is the sixth run of a worn pattern. The spec is deliberately short about
what transfers and long only about what differs.

## Scope

Twenty neighborhoods, chosen editorially rather than from a city list:

    mission · north-beach · chinatown · haight-ashbury · castro · marina
    soma · fishermans-wharf · nob-hill · russian-hill · pacific-heights
    hayes-valley · japantown · financial-district · union-square
    inner-richmond · inner-sunset · dogpatch · mission-bay · noe-valley

Plus three that are not neighborhoods and get standalone pages claimed by
nobody:

    presidio · golden-gate-park · ocean-beach

**Why editorial rather than official.** San Francisco has no single canonical
list: SF Planning publishes 41 Analysis Neighborhoods, DataSF's "SF Find"
layer carries 117, and neither matches how visitors talk. The roster's
`source` field will say `editorial selection` and name the alternatives it
declined, rather than dressing a hand-picked list as a city document.

The cost is a citable authority for what counts as a neighborhood. The cost is
NOT the roster-equality gate — a hand-picked list is still a roster, and the
gate still asserts shipped-set equals in-scope-set in both directions, which
is what has caught truncated output in every prior programme.

All twenty-three rows carry `in_scope: true`. The flag is not decoration: the
roster ALSO carries the candidates considered and declined, each with
`in_scope: false` and a one-line reason — Telegraph Hill and the Embarcadero
because North Beach and the Financial District absorb them in most sources,
Outer Sunset and Bernal Heights and Potrero Hill and Alamo Square and Twin
Peaks because twenty was the number chosen. That record is what makes a later
"why isn't Bernal Heights here" answerable, and it is what a future wave edits
rather than re-deriving the selection.

**Why the three parks are separate.** The Presidio is federal land under the
National Park Service and the city does not administer it. Golden Gate Park
touches the Richmond, the Sunset and Haight-Ashbury alike. Ocean Beach is
GGNRA. Folding any of them into a neighborhood would assert a containment that
is false. Rome set the precedent: Forest Park, Alley Pond Park and Flushing
Meadows Corona Park were each ruled to belong to no neighborhood and shipped
as their own pages, and the marquee gate then held them at exactly one file.

## Routing and identity

    state:  "California"
    county: "San Francisco"

routing to `/destinations/california/san-francisco`. No code change: the
destination controller already takes generic slugs, and `addressCountry`
emits `US` without work because the region map only special-cases Italy and
Vatican City.

### The three destination-slug collisions

`Guide.derive_destination_slug/1` takes only the FIRST comma-segment of the
destination string and discards the state. So `"Chinatown, California"` and
`"Chinatown, New York"` both derive `chinatown` and would co-list on one
`/destinations/chinatown` page — cross-city, which is wrong.

Measured against the 336 destination slugs already in the corpus, exactly
three of the twenty-three collide, all with Manhattan:

| Proposed | Derives | Already owned by |
|---|---|---|
| Chinatown | `chinatown` | manhattan/chinatown.json |
| Financial District | `financial-district` | manhattan/financial-district.json |
| Union Square | `union-square` | manhattan/union-square.json |

Resolved the way the Queens gate documents — by changing the destination
string so the first segment differs, never by weakening the assertion:

    "San Francisco Chinatown, California"          -> san-francisco-chinatown
    "San Francisco Financial District, California" -> san-francisco-financial-district
    "Union Square San Francisco, California"       -> union-square-san-francisco

The gate carries the same no-collision assertion, scoped to San Francisco.

Note that co-listing is sometimes DESIRED and the assertion must not forbid it
outright: Flushing and Citi Field deliberately share `/destinations/flushing`.
The San Francisco assertion excludes code-seed guides for that reason.

## What transfers unchanged

Five programmes of precedent. Inherited rather than re-derived:

- **The five-phase wave** — find → verify → arbitrate → author → review, with
  the finder never adjudicating its own results and a high confirmation rate
  treated as a warning rather than success.
- **ONE arbitrator per wave, over all its zones.** Rome ran three concurrent
  waves with an arbitrator each, separated by a hand-written reservation, and
  one collision still got through: wave 3 ruled the Quattro Fontane junction
  claimed by nobody while wave 2 had already given it to Trevi. A single
  arbitrator does not have that failure mode.
- **`taken_slugs.py`** — a mechanical reservation agents run rather than
  reasoning about what a neighbour probably owns.
- **The five bans, as gate regexes rather than reviewer instructions**:
  superlative, research-method, self-reference, vague-proximity, and
  status-agrees-with-its-own-prose. Three rounds of agents reading prose never
  converged on Rome; regexes did, and each narrowing is a regression test.
- **`entries` non-empty, 8-14 per page, every `place_slug` resolving.** Rome
  shipped twelve rioni to production with `"entries": []` and 450 places
  unreachable from their own guides. The gate now reads entry notes too.
- **Marquee uniqueness** — each named institution in exactly one seed file.
- **Photo fragments** — parallel agents write `.superpowers/sf-fragments/`,
  the coordinator merges serially. Twelve writers to one manifest clobber
  each other.

## What differs for San Francisco

### 1. Designation claims PUBLISH, with a citation

Rome banned every protection claim because no per-property register was
reachable: Vincoli in Rete and the Catalogo generale both failed from this
network, so "designated in YYYY" had no source and the ban was the only honest
answer.

San Francisco inverts that. Reachability was tested during scoping:

    DataSF Socrata API              HTTP 200
    DataSF analysis neighborhoods   HTTP 200
    SF Planning                     HTTP 200
    NPS National Register           HTTP 200
    Nominatim                       HTTP 200

The two landmark dataset IDs tried returned 404, which is a wrong resource ID
rather than a dead host; a research wave finds the right ones. So the gate
carries NO blanket designation ban. Instead a designation claim must name its
register and its identifier — Article 10 landmark number, or NRHP reference —
and the gate asserts the citation is present rather than forbidding the claim.

This makes the San Francisco corpus richer than Rome's, and it is the reason
the Rome ban was written as provenance-conditional rather than as a matter of
taste.

### 2. Photographs return to the US rule, with one refinement

Italy has no freedom of panorama, which forced Rome's four-gate rule and a
subject blocklist. The United States has it: 17 USC 120(a) permits pictorial
representation of an architectural work visible from a public place. So the
Bronx and Queens rule applies again — a CC0, PD, CC BY or CC BY-SA Commons
file of a building shot from public land publishes.

**The refinement, and it is not optional.** Section 120(a) covers BUILDINGS.
It does not cover sculptures, murals or other public artworks, which retain
full copyright. San Francisco is dense with them. So the subject check
survives from Rome in narrowed form: a photograph whose framing FEATURES a
public artwork still needs its artist and death year established; a building
does not.

Known subjects requiring the artwork check rather than the building rule:
the Cupid's Span sculpture on the Embarcadero, murals in the Mission
(Balmy Alley, Clarion Alley), and the Vaillancourt Fountain.

### 3. Oracle Park already owns seven Mission Bay places

`Ethos.Seeds.OracleParkPlaces` is a live code seed carrying `oracle-park`,
`reds-java-house`, `momos-san-francisco`, `china-basin-park` and three Mission
Rock cafés, all with `town: "San Francisco"`.

Mission Bay links to `guide:oracle-park-guide` and restates none of them. This
is the Concourse/Yankee-Stadium and Flushing/Citi-Field shape exactly, and it
makes `seed_ballparks/1` a genuine precondition of the San Francisco seeder —
`Links.resolve!/1` raises on an unknown target and aborts a run that is not
transactional.

## File structure

    priv/seed_data/san_francisco_roster.json      the 23 in scope, plus declined candidates
    priv/seed_data/san_francisco/*.json           23 seed files
    priv/seed_data/san_francisco_photo_manifest.json
    priv/photos/us/ca/san-francisco/{zone}/       optimized images
    lib/mix/tasks/ethos.optimize_sf_photos.ex
    test/ethos/seeds/san_francisco_seed_data_test.exs   the gate
    docs/san-francisco/{zone}-finder.md, {zone}-verdicts.md, wave{N}-arbitration.md

`Ethos.Release.seed_san_francisco/1` delegates to `seed_directory/2`, calling
`seed_ballparks/1` first for the Oracle Park precondition.

Note the photo path gains a state segment — `priv/photos/us/ca/` rather than
`priv/photos/ny/`. New York's tree predates the country segment and is not
being migrated; that is a known inconsistency and renaming it would move 200+
committed images for no reader benefit.

## The gate

`Ethos.Seeds.SanFranciscoSeedDataTest`, written BEFORE the corpus and landing
excluded behind `@moduletag :pending_san_francisco`, exactly as the Bronx,
Queens and Rome gates did. Over an empty directory, roster equality and every
non-vacuity floor fail by construction, and a gate that fails for want of
content is noise rather than information.

Removed in two stages: the module tag at the first wave, the roster-equality
`@tag` and the `test_helper.exs` entry at the last.

Assertions:

1. Roster equality — shipped set equals in-scope set, both directions,
   non-vacuous.
2. Every place kind in `Ethos.Places.Place.kinds/0`, read off the schema
   rather than copied. Rome shipped three places with an invented `church`
   kind because the brief listed kinds that do not exist.
3. Every entry kind in `Ethos.Guides.Entry`'s list; entries non-empty; every
   `place_slug` resolving.
4. `state == "California"`, `county == "San Francisco"`.
5. Globally unique place slugs, via `SeedDataHelpers`.
6. No destination-slug collision with a non-San-Francisco seed file.
7. The five prose bans, each with self-tests proving the pattern can fail and
   specimens proving it does not fire on prose that must publish.
8. Designation claims carry a register and an identifier.
9. Photo licences on the allowlist, with author and source URL.
10. Marquee institutions in exactly one file.
11. Status agrees with its own prose.

Every ban ships with BOTH a positive self-test and a specimen list. Rome's
bans each produced false positives — "Italy's first king" is a succession,
"the Capitolium at the north end" is architecture, a hospital that "is not a
visitor site" is open — and every narrowing became a regression test. The
specimens are how that knowledge survives.

## Wave plan

1. **Scaffolding** — roster, gate, photo task, seeder, release test. Gate dark.
2. **Wave 1** — 12 zones, one arbitrator. Module tag comes off.
3. **Wave 2** — 11 zones, one arbitrator, reading wave 1's arbitration.
4. **Fix pass** — driven by the gate's own output, not by agents hunting.
5. **Photo wave** — one image per zone, fragments merged serially.
6. **Ship** — full suite, commit, push, deploy, seed, verify live.

Live verification counts `/p/` links per guide, not just HTTP 200 and image
presence. Rome's orphaned-entries defect passed a status-and-image check
completely.

## Testing

The gate is the oracle. Agents write; the suite judges. The corpus-wide
address and structured-data censuses are updated once per wave with every
digit accounted for, in the convention those files already use.

California is the corpus's fifth region. The address parser's American branch
handles it unchanged — `"1 Ferry Building, San Francisco, CA 94111"` is the
shape it was built for — so no parser work is expected. If a San Francisco
address form defeats it, that is a finding, not a licence to loosen the
American rule.

## Risks

- **Twenty is an editorial guess.** If a wave finds a chosen neighborhood
  thin, the honest answer is a `town-page` tier or an `in_scope: false`
  ruling, not padding. Queens ruled 90 of 111 out; that was the programme
  working.
- **Vernacular boundaries are contested.** SoMa, the Mission and Dogpatch have
  no agreed edges. The arbitration barrier exists for this; "the evidence does
  not decide" is an acceptable ruling, and Rome used it.
- **The artwork/building distinction will be got wrong at least once.** It is
  subtle and it is new. The gate carries a blocklist seeded with the known
  cases and the photo brief states the rule in the agent's own terms.
