# US Ski Areas — Design

Date: 2026-09-06
Status: Draft for review
Branch: `worktree-us-ski-areas`

## Goal

Cover every operating ski area in the United States — roughly 470 — as a guide
per mountain, built to the shape the ballparks established: the area itself as
a `sight` entry alongside what genuinely surrounds it. Group them into seven
regional collections plus a parent. Add nothing to the schema but a place kind.

The United States is the first round deliberately. The destination tree makes
countries first-class, so Canada, the Alps and Japan are later corpora and
later nodes, not a later refactor.

## Non-goals

- No new schema. One place-kind vocabulary entry, no migration (verified:
  `places.kind` has no database check constraint, unlike `destinations.kind`).
- No nested collections. They remain unbuilt; §4 says how the parent copes.
- No defunct areas. Operating only, with `status` carried per place.
- No affiliate locales in round one — decided per region afterwards.

## 1. Scope and the roster

Every **operating** lift-served area open to the public, roughly 470 across
about 37 states. That is fifteen times the ballpark project, and roughly 300 of
those areas are small community hills rather than destination resorts.

`priv/seed_data/ski_areas_roster.json` carries the scope, mirroring
`mlb_clubs_roster.json`: one row per area with `slug`, `name`, `state`,
`county`, `town` (null where unincorporated), `region`, `status` and `verified`.

The roster is what makes "all ~470" checkable rather than aspirational. The
corpus gate asserts roster and corpus agree **in both directions** — a roster
row with no seed file fails, and a seed file absent from the roster fails. A
missed mountain is a red test, not a silent gap.

**Every count in this spec is an estimate; the roster is the authority.** The
regional figures in §8 sum to about 463, which is the same "roughly 470" — do
not read the difference as missing mountains. Building the roster is the first
task of Project A, and it is what fixes the real number. Where a figure here and
the roster disagree, the roster is right and this document is stale.

## 2. Depth follows what is verifiable

Every area gets a guide with the identical shape. Depth varies with what is
genuinely there:

| Area | Entries | Sections | Photos |
| --- | --- | --- | --- |
| Vail | ~12 | 3 | 3 |
| Mad River Glen | ~8 | 2 | 2 |
| Mt. Crescent, Iowa | ~3 | 1 | 0 |

Nothing is padded and nothing is invented. Where a hill has little around it,
the page says so plainly. This follows the existing content rule that fewer
verified items beat more padded ones; it is the rule that keeps 300 small-hill
guides honest.

### What counts as "around"

**The tree node is the nearby rule.** Entries cover the ski area, anything at
its base area, and verified places within the town or county node the guide
attaches to. There is no second radius to argue about, and a hill whose town
holds nothing honestly gets few entries.

## 3. Geography

`destination_path` is the **town node where the area sits in an incorporated
town, and the county node otherwise**:

```
Vail            united-states/colorado/eagle-county/vail
Alta            united-states/utah/salt-lake-county/alta
Snowbird        united-states/utah/salt-lake-county
Mad River Glen  united-states/vermont/washington-county/fayston
```

Roughly 250-300 town nodes do not exist yet and are added to
`destination_tree.json` with their county and state parents. `DataDestination`
and the loaders now **raise** on a path no node owns, so a missing node is a
seed-time failure rather than a silent orphan.

Those new nodes need no legacy redirect paths — the towns had no pre-existing
`/destinations/:slug` URLs — but every new path must clear the roster
uniqueness gate, which forbids a legacy path that duplicates another or shadows
a node path.

Two edge cases, resolved here rather than left to a researcher:

- **Areas spanning two states** (Lost Trail on the Montana-Idaho line) attach to
  the state operating the base area, with the other named in prose.
- **Linked areas sharing terrain** (Alta and Snowbird) stay two guides joined by
  a `nearby` link, never one merged page.

## 4. Corpus shape

One file per area at `priv/seed_data/ski/{slug}.json`, loaded by the existing
two-pass `DataGuide` loader — the same authoring format as `korean_bbq`,
`london` and `manhattan`.

```json
{
  "guide": {
    "slug": "mad-river-glen-ski-guide",
    "title": "Mad River Glen, Vermont: the single chair and a co-op that owns it",
    "destination": "Fayston, Vermont",
    "destination_path": "united-states/vermont/washington-county/fayston",
    "tier": "guide",
    "intro": "…", "sections": [], "faq": [], "photos": []
  },
  "places": [
    {"slug": "mad-river-glen", "kind": "ski-area",
     "destination_path": "united-states/vermont/washington-county/fayston",
     "address": "…", "summary": "…", "history": "…", "status": "open", "photos": []}
  ],
  "entries": [
    {"kind": "sight", "name": "Mad River Glen",
     "place_slug": "mad-river-glen", "note": "…"}
  ],
  "links": [
    {"target": "guide:sugarbush-ski-guide", "kind": "nearby", "note": "…"}
  ]
}
```

`ski-area` joins the place kinds exactly as `stadium` did for ballparks.

Ballparks are hand-written Elixir modules, two per venue. At 470 that would be
940 modules, and the geography refactor had to touch all 31 existing ones by
hand. JSON is the format every corpus since Manhattan uses, and it scales.

### Collections, and the flat-collection limitation

Seven regional collections plus a parent, seeded from one
`Ethos.Seeds.SkiCollections` module — the shape `scenic_byways_collections.ex`
already uses for four collections.

```
/c/skiing-and-snowboarding-united-states   parent
/c/skiing-the-rockies          ~110    /c/skiing-the-mid-atlantic   ~45
/c/skiing-new-england           ~85    /c/skiing-the-southeast      ~18
/c/skiing-the-pacific           ~75    /c/skiing-alaska             ~10
/c/skiing-the-midwest          ~120
```

**Collections hold guides, flat.** The parent therefore cannot list the seven
regional collections. It carries an `intro` linking to all seven in markdown,
and its items are a curated 12-15 mountains spanning the range — a real page
built only from what exists today. If nested collections are built later, the
parent converts cleanly and nothing here is redone.

### What lights up without code

Every area appears on its town or county hub, its state page and
`/destinations/united-states`. Search indexes the guide, its places and the node
name. The sitemap picks up every guide, place and new node. Breadcrumbs derive
from ancestry.

`nearby` links between mountains are authored per file — the adjacency
subsystem is Connecticut town borders and does not generalise to ski areas.

## 5. Research and content rules

Two agents per area — one finds with evidence, one adversarially verifies —
writing JSON artifacts to scratchpad, with content authored **only** from
`confirmed` verdicts. `refuted` is excluded or corrected; `uncertain` is
excluded from places and lodging, and survives in history prose only by
rewording out the unverified specific. Roughly 940 research agents across the
regions, in waves of 8-12 mountains.

Ballparks carry a per-venue verification doc quoting every published sentence
against its verdict. At 470 that doubles the artifact count for diminishing
return, and the newer corpora replaced it with **automated prose gates** in the
seed tests. Those catch the same failure classes on every file forever rather
than on the files someone remembered to document. This project takes the gates
and commits the research artifacts per region as the record.

Ski-specific rules for the content doc:

- **No vertical drop, skiable acreage or lift count** without the operator or a
  named authority. These are marketing numbers and sources disagree.
- **No snowfall average** without a named source and the period it covers.
- **No pass affiliation** (Epic, Ikon) without the current season's source,
  date-stamped. Those rosters change annually and would otherwise rot silently.
- **No trail maps or logos** in photos — both copyrighted. This is the ski
  equivalent of London's Fourth Plinth exclusion.
- **No superlatives** — "best", "steepest", "most challenging".

## 6. Photos

Wikimedia Commons PD/CC0/CC-BY/CC-BY-SA only, attributed, never hotlinked —
the existing rule, unchanged. One to three photos of the mountain, base area or
lodge where Commons has them; **where it does not, the guide ships photoless**
rather than borrowing a substitute. Expect roughly 150-200 guides with photos
and 270-320 without.

`priv/seed_data/ski_photo_manifest.json` and `mix ethos.optimize_ski_photos`
follow the existing per-corpus pattern. Photos live under `/photos/ski/{slug}/`.

## 7. Gates

`test/ethos/seeds/ski_seed_data_test.exs`, following the London and San
Francisco pattern:

- **Roster ↔ corpus agreement, both directions** (§1).
- Every file valid, loading twice idempotently.
- Place slugs globally unique across all corpora.
- Every `destination_path` resolving to a real node.
- Licence allowlist for photos, with files present on disk.
- The §5 prose gates, each with a **non-vacuity assertion** so a gate cannot
  quietly stop matching anything.
- A collections test asserting seven regional collections and the parent, with
  membership counts derived from the roster rather than hardcoded.

**`MIX_TEST_PARTITION` is mandatory** for every test command while other
worktrees are live; the shared `ethos_test` database is contended.

## 8. Decomposition

Seven projects, each its own spec, plan and research waves. Each region ships
complete and publishable alone.

| Project | Region | Areas | Code? |
| --- | --- | --- | --- |
| A | Foundation + New England pilot | ~85 | yes |
| B | Rockies | ~110 | no |
| C | Midwest | ~120 | no |
| D | Pacific | ~75 | no |
| E | Mid-Atlantic | ~45 | no |
| F | Southeast | ~18 | no |
| G | Alaska | ~10 | no |

Project A carries all the code: the `ski-area` kind, the roster, the seeder
(`Ethos.Release.seed_ski/1`), the collections module, the photo task and the
gates. New England is the pilot because its depth range is the widest — Killington
and Stowe alongside genuine two-lift community hills — so the variable-depth
rule is stress-tested in round one rather than round four.

## 9. Deployment obligations

Both learned from the geography refactor:

- **`Ethos.Release.seed_ski/1` must be added to the numbered seed order in
  `docs/runbooks/seeding.md`.** `korean_bbq` was omitted from that list, and an
  operator following it would have restored production missing an entire corpus
  with nothing erroring.
- **New town nodes seed before the corpus**, since `DataDestination.upsert!/1`
  raises on a path no node owns.

## Global constraints

Phoenix 1.7.14; no AI or network calls in shipped code; place-slug global
uniqueness across every seed source; Commons licensing as in §6; `mix format`
clean and the suite green before every commit; `MIX_TEST_PARTITION` on every
test command.
