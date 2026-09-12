# A Public Course in Every State

**Status:** approved design, ready for planning
**Date:** 2026-09-05
**Predecessor:** `docs/superpowers/specs/2026-08-30-mlb-ballparks-design.md`
**Operating manual:** `docs/site-builder.md` — binding, not background

## Goal

Publish a guide for each of the fifty US states, anchored on the top-ranked
publicly accessible golf course in that state, covering the weekend a visitor
builds around a round there: where to stay, where to eat, what else is there,
and a second public course for the second day.

Golf is the fourth instance of the site-builder pattern, after Connecticut's
Antique Trail and the thirty MLB ballparks. It is the first whose "around it"
radius is neither a walk nor a park boundary, and §10 of the pattern document is
amended for what that changes.

## The request this narrows, and why

The request was "all golf courses in the US". The US has on the order of fifteen
thousand golf facilities — a figure this spec deliberately does not assert, since
no verdict establishes it (§4 rule 8). Whatever the exact number, it is three
orders of magnitude past what the research contract can carry.

The measured baseline is the ballpark run: **thirty sites, 236 places, ~68
research agents across a checkpoint and three waves**, with search throttling —
not concurrency, not design — as the binding constraint. Scaled linearly, fifteen
thousand courses is tens of thousands of research agents, and §13 records that
re-running throttled waves does not clear the flag.

A directory of fifteen thousand courses is also the exact defect the platform
spent a whole programme removing: 424 place records under 25 words, photoless and
history-less, with the backlog still standing at 320
(`docs/place-research-backlog.md`). Minting fifteen thousand address-and-a-phone
stubs would manufacture that defect on purpose, at forty times the scale.

**So the set is fifty — one course per state — done to the corpus standard, with
a roster shaped so later waves extend it** (a second course per state, then a
third) rather than a wide shallow pass that has to be rewritten.

## Four findings that shaped this

**Fifty states means fifty hubs, and none of them is built.** `/destinations/oregon`
is a `GROUP BY` over the guides table (`Guides.list_states/0`,
`lib/ethos/guides.ex:123`; counties at `:133`). A guide carrying
`state: "Oregon"` produces the hub on its next seed. The ballpark run added
eighteen jurisdictions; this set adds every state that does not already have one.
**No migration. If a plan task proposes a geographic schema, it has misread §3.**

**The state-slug shadowing trap is already solved, and golf adds no new
instance.** `DestinationController.show/2` tries the state branch first and only
falls back to the town hub, so a state whose slug matches a town's takes the URL
and that town's guides drop off the site's navigation — no error, no redirect.
The remedy on `origin/main` is additive rather than a rename:
`Guides.list_guides_shadowed_by_state/1` (`lib/ethos/guides.ex:85`) returns what
the hub hides, and `state.html.heex:24-29` renders a line pointing at it
(`destination_controller.ex:101-121`). Renaming would move an indexed page,
trading a content regression for a link regression.

The corpus has exactly **one** such pair: the Washington state hub, minted by the
T-Mobile Park guide, over `washington-ct-travel-guide`. Connecticut looks like a
second and is not — `AntiqueTrailGuide` carries `state: "Connecticut"` as well as
`destination: "Connecticut"`, so it lists on the hub as one of its own guides
rather than being hidden by it, and the query excludes that case deliberately.

Measured across all 426 destination slugs in the corpus against all fifty state
slugs, **golf introduces no new state-slug shadow.** What golf does introduce is
fifty new *destination* slugs — the basecamp cities — each a fresh chance to
collide with a town the corpus already publishes. **That check goes in the roster
gate**, because the collision that matters is the one introduced at row 37 by a
basecamp nobody thought to check, and if one does occur the existing shadowed-guide
line is the remedy rather than a rename.

**"The best course in state X" is a judgment and cannot ship.** There is no
verdict a verifier can confirm or refute against an editorial pick, and §4 rule 8
forbids identity from recollection or an unchecked list. The criterion is
therefore reduced to something re-fetchable: *the highest-ranked publicly
accessible course in state X per a named ranking at a named edition*. The guide
cites the ranking and its edition; it never asserts "the best".

**The prose that golf most wants to write is the prose the gates ban.** "A
thirty-minute drive from the airport" is the most natural sentence about a golf
resort. §12 records this corpus shipping `"within a short drive"`, `"ten minutes
east"` and `"about ten minutes away"` to production, from
`burys_collection.ex` and `middlebury_guide.ex` — both Elixir, both invisible to
the JSON gate. That is the single strongest argument for the authoring surface
chosen below.

## Design

### Authoring surface: JSON, not Elixir modules

Files live at `priv/seed_data/golf/<state-slug>.json`, one per state, in the
format all eight guide-corpus directories already use — `connecticut` (165
files), `brooklyn` (69), `manhattan` (38), `london` (33), `rome` (31),
`san_francisco` (23), `queens` (21), `bronx` (13). Only the ballparks went to
Elixir.

|  | JSON | Elixir modules |
|---|---|---|
| seed modules to write | 0 | ~100 (guide + places per state) |
| `Ethos.Seeds.Catalog` call sites | 0 | 6 |
| `Ethos.Release` | one line | region wiring + 100 registrations |
| corpus-wide prose gates | inherited | must name each module |
| proximity / duration gates | read published structure | scan raw source |

§1 states it plainly: *"Free, if your places live in JSON."* A new guide-corpus
directory is walked by every corpus-wide gate automatically, because
`SeedDataHelpers.all_seed_files/0` excludes only `destinations`
(`test/support/seed_data_helpers.ex:27-43`).

The last row is the one that decides it. A source-scanning gate cannot tell a
defect from a moduledoc *recording* a defect — §12 notes three ballpark
moduledocs that had to describe an omission in words because quoting it failed
the gate. Golf, where every author will reach for a drive time, should not opt
into that.

Two costs, stated: the JSON loader makes `county` required
(`data_guide.ex:47`), so §3's `nil`-county escape hatch is unavailable — fine
here, since every clubhouse has one address; and the collection membership gate
must assert against the directory listing rather than `Catalog` modules, which is
a rewrite of `mlb_ballparks_collection_test.exs`, not a new idea.

Wiring is one line, using the existing generic helper:

```elixir
def seed_golf(email), do: seed_directory("golf", email)
```

### A course is a guide; the basecamp is the destination

| field | value | note |
|---|---|---|
| `destination` | the **basecamp** city, e.g. `"Bandon, Oregon"` | not the course name — `derive_destination_slug/1` takes the text before the comma |
| `state` | the state | mints the hub |
| `county` | researched, never derived | §3: a county is not derivable from a state and a city |
| `slug` | `<state-slug>-golf-guide` | |

The course itself is also a place, so it gets its own page, can be badged, and
gives the guide its anchor entry — the same shape the ballparks use.

### New place kind

`golf-course`, mapping to schema.org `GolfCourse`. Two edits:
`lib/ethos/places/place.ex:7` and `lib/ethos_web/controllers/place_html.ex:6`.
The existing test asserting every kind maps to a real schema.org type covers it.

No new entry kind: the course is a `sight`, lodging is `stay`, dining is `food`.

### What "around it" means: the basecamp

Ballparks meant a walk. National parks mean gateway towns. Golf is neither, and —
this is what makes it new — **it is not consistent across the fifty**. Three
shapes recur:

- **Resort** — lodging and dining are on the property. Bandon, Pinehurst,
  Streamsong.
- **Municipal or daily-fee inside a city** — the basecamp is the surrounding
  neighbourhood, and the corpus may already publish it. Torrey Pines, Harding
  Park.
- **Remote** — the basecamp is a gateway town reached on a named road.

**The radius is the basecamp: wherever a visitor actually sleeps.** That is
checkable — a hotel is on the property or in the town, or it is not — where a
mileage figure would be both arbitrary and a per-entry research burden. Each
file's guide records which shape it is and why, the way §10 requires a national
park's county choice to be recorded.

### A second course is an entry, not a guide

A golf weekend is two rounds. Each guide carries the nearest other publicly
accessible course as an entry, and this is the first set where a guide's entries
include another instance of the site type. The dedup rule (§7):

- the second course gets a `golf-course` place record and **no guide**;
- unless it is another state's ranked course, in which case it is a `see-also`
  link and **no second record is minted**.

Some states will have no second course worth naming. They publish without one and
say so, exactly as Kauffman Stadium published a single place because no source
established a walkable district and the guide said so. **Expect the spread.** A
set of fifty is not fifty comparable guides, and a plan assuming uniform yield
reads the thin ones as failures and pads them — the one outcome §4 exists to
prevent.

### Sections

Three minimum, per §8:

1. **`Getting there`** — exactly that string, lowercase `t`, no trailing mode.
   Roads with numbers and directions, the airport served, and parking where a
   source states it. **Airports are prose, extending §8 past transit and
   parking**: golf trips are flown to, so this section carries more load than it
   did for ballparks, and a terminal is still not somewhere a visitor spends the
   day.
2. **Around the course** — the lodging, dining and sights the entries point at.
3. **The course itself** — its history, architect, and tournament record.

### Two facts golf handles that no previous set did

**Tee-time access is an identity fact.** Resort-guest priority, municipal
resident lotteries, advance-booking windows, and whether a course is publicly
accessible at all. This is verified like any other identity fact and never
assumed (§4 rule 8). **It is the worst failure this set can ship** — a page that
tells someone they can play a course they cannot is worse than a wrong date,
because it is acted on.

**Green fees are priced facts that go stale seasonally.** Publish only with the
source's own dated qualifier, or omit and name the gap — the discipline that left
Fenway's game-day parking price unpublished rather than guessed, and that left
the Dodger Stadium Express headways out entirely rather than widen a gate's
allowlist.

### A collection

**"A Public Course in Every State"**, slug `public-course-every-state`, added to
`Ethos.Release.seed_collections/0`'s list of modules. It runs **after** the
guides, because `Collections.upsert_collection!/1` raises on an item whose guide
slug has no row yet. Every member then renders *"Part of…"* under its title from
the existing template line
(`lib/ethos_web/controllers/guide_html/show.html.heex:7-9`) — no template change.

Blurbs are content and the content rules bind them. Each is drawn only from what
its guide already publishes, so it inherits that guide's verdict trace.

### Duplicate checking

Golf touches territory the corpus already publishes — San Diego, San Francisco
and New York at minimum. §7 rung (c) applies: place slugs carry a global unique
index *and* a gate assertion, but no index catches the same business under a
different name. **The research contract checks addresses, not names, before
minting a slug.**

### Links

Authored per-file in the `links` array, strictly resolved (an unknown target
raises with the offending file path). `nearby` where a basecamp is territory the
corpus already covers; `see-also` between neighbouring states and to the second
course when it belongs to another state's guide.

## The roster

`priv/seed_data/golf_courses_roster.json`, fifty rows, **committed before any
research**.

- **Identity, given:** `state`, and `slug` (the state slug — the guide's own
  slug is `<state-slug>-golf-guide`).
- **Researched, null until a confirmed verdict fills them:** `course`,
  `facility`, `city`, `county`, `access`, `ranking_source`, `ranking_edition`,
  `ranking_position`, `second_course`, `criterion`, `verified`.

"Fifty states" is a fact; "fifty courses" is an assumption. That is §2's clubs-vs-
ballparks distinction, and it binds harder here because the pick depends on a
ranking that can move, paywall, or skip a state.

`golf_courses_roster_test.exs`, ported from `mlb_clubs_roster_test.exs`:

- **exhaustion** — all fifty states present, exactly once;
- **all-or-nothing** — a row is fully resolved with `verified: true` or fully
  null. A half-filled row is someone writing down what they thought they knew,
  and nothing downstream distinguishes it from research output;
- **attribution tuple** — `{slug, course, city, state, county}` checked against
  the live place record, not slug membership. This is the mutation-testing
  finding: repointing a row's `seed_file`, setting a `region` to `"atlantis"`,
  and changing a `name` all passed the original membership assertions;
- **vacuity guard** — fails if no row is resolved, so the check cannot silently
  examine nothing;
- **collision check** — no golf guide's derived `destination_slug` collides with
  any existing corpus destination slug, and any that collides with a *state* slug
  is asserted to surface through `Guides.list_guides_shadowed_by_state/1` rather
  than dropping off navigation silently.

Fields the work is allowed to improve (`second_course`, `ranking_position`) stay
out of the tuple while still being asserted non-empty — §2's rule about which
fields identify a record and which the programme may correct.

## Research programme

Two agents per site, always: a **finder** who gathers and cites, and an
**independent verifier** who adjudicates `confirmed` / `refuted` / `uncertain`.
The finder never writes verdicts. That separation collapsed once, in Brooklyn,
and produced a 44-of-44 confirmation rate that had to be thrown out whole.

The verifier **re-fetches the cited page and confirms the fact is in it**, not
merely that the fact is true. §12 names county miscitation as the single most
transferable finding of the ballpark run — it recurred in every wave, and it is
invisible to anyone who does not re-fetch, because the claim itself checks out.

### Task 0 — pin the ranking

One finder, one verifier, **before a single roster row is filled**: which
publication, which edition, whether it is fetchable, whether it is genuinely
public-access-only, and whether it covers all fifty states.

**Contingency, decided now rather than discovered later:** if no ranking is
fetchable, or it leaves states uncovered, those states fall back to the
championship-venue criterion — the publicly accessible course in that state with
the strongest verifiable tournament record. The roster's `criterion` field
records which rule decided each row, so the set is auditable even when it is
mixed.

### Checkpoint — Bandon Dunes, Oregon, then stop

§6's ordering constraint is the one most likely to be parallelised away by
someone in a hurry, and it is the one with a reason. One site end to end:
research, author, seed, render, review, **amend `docs/site-builder.md` §10 with
what it taught** — and only then open the waves.

Bandon is the hardest useful checkpoint. It strains every new rule at once:
on-property basecamp, five courses on one property (exercising the second-course
rule and the dedup ladder), roughly twenty-five miles from Coos Bay on US-101
(the duration ban's worst temptation), and an airport that must stay prose.
Pebble Beach would be easier and teach less.

### Waves

Five waves of ten states, twenty research agents each, plus per-wave Commons
photo scouts.

**Search access is the schedule.** Measured on the ballpark run: 6% blocked at 8
concurrent agents, **82% at 24**, and re-running at 8 restored nothing — the
limit is session-cumulative or source-side. The checkpoint's own finder and
verifier opened with `WebSearch 200/200 exhausted` before their first query.

**Plan for the programme to be parked and resumed, not for it to be fast.**
Re-queued batches **extend** their existing artifact rather than starting over;
a `rate_limited` batch holds real confirmed facts and re-researching from zero
would re-spend the bottleneck.

Every site records `"searched": "complete" | "rate_limited" | "blocked"`. Verdicts
gate publication; `searched` gates completeness accounting, and the two are
almost decoupled — 60 of 73 places flagged in one wave, 64 of 73 still carrying a
confirmed verdict. **A site with at least one confirmed verdict is authored
whatever its flag says. Only a site with no confirmed verdict *and* an incomplete
search is re-queued.**

### Audit trail

`docs/golf/<state-slug>.md`, one per state, quoting each published sentence
against the verdict it rests on and recording each omission — as `docs/ballparks/`
does. `.superpowers/` is gitignored (`.gitignore:42`) and will not survive a
clone; the Brooklyn research artifacts were lost exactly that way.

## Gates to write

`test/ethos/seeds/golf_seed_data_test.exs`, modelled on
`brooklyn_seed_data_test.exs` and `ballpark_seed_data_test.exs`, **written at
step 4 — before the checkpoint is authored**, so the checkpoint is the first
thing it checks:

- heading is exactly `Getting there`. This is the most likely drift in a set, and
  the heading does not drift alone — it takes the multi-modal rule with it;
- three sections minimum;
- **nine proximity patterns and the duration ban**, empty allowlist, keyed
  `{file, json path, matched phrase}` so pardoning one phrase does not excuse the
  rest of the string;
- **the patterns are re-measured against this corpus, not copied on faith.** §8
  records four ballpark candidates rejected on measurement — bare `\d+ blocks`
  (49 hits), `across from` (16, one of them a confirmed verdict's own wording),
  `just north/south/east/west of` (18), and `nearby|close by` (474, because
  `nearby` is a link `kind`);
- **assert the publishable form too.** A gate banning the checkable form beside
  the vague one pushes authors toward vagueness, and nothing else would notice;
- exactly one ranked-course entry per guide, and at most one other `golf-course`
  place;
- every guide states whether and how the course can be played — a required
  element going missing belongs in a test, not to a reviewer;
- orphaned-entry check: every `place_slug` resolves.

`test/ethos/seeds/golf_collection_test.exs`: set equality between the
collection's items and the fifty seed files, failing in **both** directions and
naming the slugs. A collection missing one guide is silent both ways — the page
is simply short, and the dropped guide simply stops rendering its *"Part of"*
line.

Editorial ranges — word ceilings, entry counts, photo counts — belong to the
reviewer, not to a gate. A gate that fails a build over a 165-word intro is a
gate somebody eventually weakens.

## Photos

Wikimedia Commons PD/CC0/CC-BY/CC-BY-SA only, attributed, never hotlinked, under
`/photos/golf/<state-slug>/`, optimized by a new `mix ethos.optimize_golf_photos`
(a JSON-scanning task mirroring the London one).

Commons is thinner on golf courses than on cities. **States with no free photo
ship none rather than pad.**

## Wiring checklist

1. `lib/ethos/places/place.ex:7` — add `golf-course`.
2. `lib/ethos_web/controllers/place_html.ex:6` — add `"golf-course" => "GolfCourse"`.
3. `Ethos.Release.seed_golf/1` — one line, `seed_directory("golf", email)`.
4. `Ethos.Release.seed_collections/0` — add the collection module.
5. `docs/runbooks/seeding.md` — the new seed function, with its ordering
   constraint spelled out: places before guides, collection after guides.
6. `docs/site-builder.md` §10 — the golf amendment, written first and amended
   again after the checkpoint.

## Risks

**Search throttling decides the schedule.** Named above and measured. Mitigation:
small waves spread out, `searched` checked before banking a wave, stop when
throttling dominates rather than record partial work as complete.

**The ranking may be unreachable or partial.** Task 0 exists to find out before
fifty rows are committed, and the fallback criterion is decided in advance.

**Tee-time policy and green fees go stale.** Both are handled by the rules above:
access is verified as identity, prices publish only with a dated qualifier.

**Yield will not be uniform.** Ballparks ranged from 1 to 21 places per site.
Expect the same spread and publish the plainer guide rather than padding it.

**Territory overlap with the existing corpus.** Dedup by address, not name.

## Success criteria

- Fifty guides at `priv/seed_data/golf/`, one per state, seeded by
  `Ethos.Release.seed_golf/1`.
- Every published clause traces to a `confirmed` verdict, quoted in
  `docs/golf/<state-slug>.md` against the sentence it supports.
- The roster is exhausted mechanically — fifty rows, all resolved, all matching
  their live place records on the identity tuple.
- All fifty `/destinations/<state>` hubs resolve.
- The collection lists exactly the fifty guides, gated in both directions.
- `mix format` clean; the full suite green — baseline **746 tests, 0 failures**,
  expected to land around 790+.
- `docs/site-builder.md` §10 carries the golf amendment, including what the
  checkpoint changed.

## Notes for whoever runs this

**`MIX_TEST_PARTITION=_golf` is required for `mix test` in this worktree.** The
shared `ethos_test` database in the `ethos-pg` container belongs to another
branch — its `users` table carries `username`, `username_provisional`,
`trusted_at`, `banned_at` and `ban_reason`, none of which exist in any migration
on `origin/main`. Running against it fails 333 of 746 tests on a not-null
violation that has nothing to do with this work. The container already holds
`ethos_test_foliage` and `ethos_test_kbbq`, so per-worktree test databases are
the established convention.

**`docs/site-builder.md` §3 carries stale line citations.** It cites
`Ethos.Guides.list_states/0` at `lib/ethos/guides.ex:88-96` and
`list_counties_for_state/1` at `:98-108`; they are now at `:123` and `:133`, and
`:88-96` today lands inside `list_guides_shadowed_by_state/1` — a function that
did not exist when §3 was written. Trusting the citation instead of opening the
file put a wrong claim into the first draft of this spec. The §10 amendment
should refresh those two references while it is in the file.

## Deferred, not abandoned

**A place that owns entries** (§11). A golf *resort* with five courses is
precisely the shape that wants it — Bandon would rather be a place carrying five
course pages than a guide carrying five entries. It is still not built, and this
set routes around it the same way every previous one has: the site is a guide
that also has a place record. Running fifty teaches more about the right shape
than committing to one now.

**More than one course per state.** The roster's shape supports a second and
third wave without rework; that is why the criterion and edition are recorded per
row rather than assumed set-wide.

**Nothing on the shadowing front.** An earlier draft of this spec claimed two
destination hubs were shadowed and unrepaired. That was wrong on both counts, and
reading `lib/ethos/guides.ex:60-92` rather than trusting a citation inherited from
`site-builder.md` is what caught it: there is one shadowed pair, not two, and it
already has an additive remedy. The stale citation is noted above.
