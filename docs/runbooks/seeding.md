# Seeding runbook

How to populate an Ethos database — a fresh one (new staging environment, a
restore, a local dev box) or an existing one after a content change. Written
for someone who has never seen this repo.

Seeding tasks live in `Ethos.Release` (`lib/ethos/release.ex`) and are invoked
via `bin/ethos rpc`, because Mix is not available in the release image:

```
/app/bin/ethos rpc 'Ethos.Release.seed_manhattan(~s(you@example.com))'
```

On Fly, wrap that in `fly ssh console -C`. **`fly ssh console -C` strips
double quotes** before the command reaches the machine, so a `"..."` string
inside the rpc expression arrives as a bare atom-less fragment and the call
fails with a confusing syntax or `CompileError`. Use the `~s(...)` sigil for
every string argument:

```bash
fly ssh console -C "/app/bin/ethos rpc 'Ethos.Release.seed_manhattan(~s(you@example.com))'"
```

The email argument is the author account guides are attributed to; it must
already exist as a user.

Locally, the same functions run under `mix run -e '...'` with ordinary quotes.

## Seed order

Run in this exact order. Every step depends on the ones above it, except
`seed_destinations` (step 7), which depends on nothing and nothing depends on
it — see its entry below.

1. `Ethos.Release.seed_manhattan(email)` — 38 JSON files, `priv/seed_data/manhattan/`
2. `Ethos.Release.seed_connecticut(email)` — the CT-5 **code-module** guides
   (Waterbury, Middlebury, Danbury, Southbury, Woodbury) plus
   `Ethos.Seeds.ConnecticutPlaces`
3. `Ethos.Release.seed_connecticut_expansion(email)` — 165 JSON town/guide
   files, `priv/seed_data/connecticut/`
4. `Ethos.Release.seed_brooklyn(email)` — 69 JSON files, `priv/seed_data/brooklyn/`
5. `Ethos.Release.seed_bronx(email)` — JSON files in `priv/seed_data/bronx/`.
   The programme narrowed on 2026-08-31 to **14 in-scope neighborhoods**, not
   the full 66-row roster. One has shipped so far; the remaining 13 are in
   progress. The other 52 roster rows are deferred, not abandoned — see
   `docs/superpowers/specs/2026-08-31-narrowed-nyc-scope-design.md`.
6. `Ethos.Release.seed_queens(email)` — JSON files in `priv/seed_data/queens/`.
   **The directory is empty.** The scaffolding shipped ahead of the research,
   so this call currently seeds nothing and reports `Seeded 0 files`. That is
   the expected output, not a failure. Run it anyway: it is in the order so
   that the day the first wave lands, nobody has to remember to add it.
7. `Ethos.Release.seed_destinations()` — 13 JSON files, `priv/seed_data/destinations/`.
   **Takes no email argument** — unlike every seeder above it, a destination
   page has no author. It is listed here, after `seed_brooklyn` and the Bronx
   and Queens seeders, and before `seed_collections`, for consistency with the
   rest of this list rather than because it must run at this point: it writes
   only its own `destinations` table, references no place and resolves no
   link, so it is safe to run before, after, or between any of the other
   steps.
8. `Ethos.Release.seed_ballparks(email)` — 236 places and **30 guides**, the
   whole MLB set, as **code modules** rather than JSON: one places module and
   one guide module per ballpark. It takes both lists from `Ethos.Seeds.Catalog`
   (region `"ballparks"`) and seeds **places before guides**, which is the one
   ordering constraint inside the step. Each guide's entries resolve by
   `place_slug` through `Ethos.Places.get_place_by_slug!/1`
   (`lib/ethos/seeds/guide_runner.ex`), which **raises** on a place nothing has
   seeded — so the reverse order does not produce a thin guide, it aborts the
   run partway through and leaves the state described in "Seeding is not
   transactional across a run" below. Adding a ballpark is one line in the
   catalog and no change here.

   It has no dependency on steps 1-7 and none of them depends on it, so it may
   run at any point before step 9. It is listed here because step 9 **does**
   depend on it: `Ethos.Seeds.MlbBallparksCollection` names all thirty ballpark
   guides, and `seed_collections` run before this step raises
   `collection mlb-ballparks references unknown guide <slug>`.
9. `Ethos.Release.seed_collections()` — three collections: The Burys of
   Connecticut (steps 2 and 3), Antique Trail of CT (step 2) and Major League
   Ballparks (step 8). After **every** guide step, never between them.
10. `Ethos.Release.seed_links()`

Verify the published count after each content step before moving on — see
"Expected published counts" below. `seed_destinations` writes to a separate
`destinations` table rather than `guides`, so it has no row in that table;
verify it instead with
`Ethos.Destinations.list_destinations() |> Enum.count()`, which should read
**13** after a fresh run.

`Ethos.Release.seed_rome(email)` seeds one standalone guide
(`three-days-in-rome-real-trip-guide`). It has no dependencies and nothing
depends on it, so run it whenever; it is deliberately not part of the chain.

### Why `seed_links` runs last

`seed_links` calls `Ethos.Seeds.BackfillLinks.upsert_all!/0`, which authors
edges *out of* Manhattan and CT-5 guides — the same source guides whose seed
files also declare their own outgoing links.

`Ethos.Links.replace_outgoing_links!/2` (`lib/ethos/links.ex`) makes a source's
outgoing edges *exactly* the set the seed file declares: it `delete_all`s every
outgoing edge for that source inside a transaction, then reinserts. That is
correct on its own — re-seeding a corrected file has to retire the edge it
corrected — but it means **any seeder run after `seed_links` silently wipes
`BackfillLinks`' edges** for the guides it touches. No error, no warning: the
Manhattan adjacency graph and the CT-5 history edges simply vanish, and the
pages render with fewer related links than they should.

So: content seeders first, `seed_links` last. If you re-run any content seeder
for any reason, **re-run `seed_links` afterwards.**

`seed_collections` does not touch links and is safe on either side of
`seed_links`, but is ordered before it here for consistency.

`BackfillLinks` skips edges whose endpoints do not exist yet rather than
raising, so running it early does not fail loudly — it just quietly produces a
thinner graph. That is another reason to run it once, at the end.

### Why Manhattan is first

Guides in other destinations declare cross-borough link targets *into*
Manhattan:

- **Thirteen Connecticut files** (`bridgeport`, `fairfield`, `greenwich`,
  `milford`, `mystic`, `new-haven`, `new-london`, `norwalk`, `old-saybrook`,
  `stamford`, `wallingford`, `west-haven`, `westport`) link to
  `guide:midtown-manhattan-guide`.
- **Four Brooklyn files** link across the river: `brooklyn-heights` and `dumbo`
  to `guide:financial-district-manhattan-guide`, `williamsburg` and
  `south-williamsburg` to `guide:lower-east-side-manhattan-guide`.

`Ethos.Links.resolve!/1` raises `ArgumentError`
(`page link references unknown guide <slug>`) on a target that is not in the
database, and that aborts the **whole link pass** for the run.

The damage is in the timing. `seed_directory/2` runs three passes over the
directory — all places, then all guides, then all links — so by the time the
link pass raises, **every guide in that directory has already been published.**
You are left with a live-looking site carrying a half-replaced link graph:
files processed before the failure have their new edges, the rest have
whatever they had before (on a fresh database, nothing).

The CT-5 code-module guides are likewise link targets from the Connecticut JSON
corpus — 7 files link to `danbury`, 6 to `waterbury`, 5 to `woodbury`, 3 to
`southbury`, 2 to `middlebury` — which is why step 2 runs before step 3.

`Ethos.Collections` raises the same way on a collection item pointing at an
unknown guide slug, which is why `seed_collections` comes after all the guide
steps: "The Burys of Connecticut" pulls five guides from the CT-5 code modules
and five (Salisbury, Roxbury, Simsbury, Glastonbury, Canterbury) from the
Connecticut JSON corpus, and "Major League Ballparks" pulls all thirty ballpark
guides from step 8. Between them the collections now depend on three separate
guide steps, so `seed_collections` is not satisfiable by any subset of them.

On the current production database Manhattan and the CT-5 guides are already
live, so a re-deploy of an existing branch is unaffected. These dependencies
bite when rebuilding from scratch.

### Code-module guides are not JSON

This one has already cost us a live page with a stale claim, so read it twice.

`seed_connecticut_expansion` walks `priv/seed_data/connecticut/*.json` **and
nothing else.** The five CT-5 guides — **Waterbury, Middlebury, Danbury,
Southbury, Woodbury** — are not JSON files. They are Elixir modules
(`lib/ethos/seeds/waterbury_guide.ex` and siblings) seeded by
`seed_connecticut`.

If you fix content in one of those five, `seed_connecticut_expansion` will not
pick it up, no matter how many times you run it, and it will not tell you it
skipped anything. The correct sequence for a CT-5 content fix is:

```
Ethos.Release.seed_connecticut(email)
Ethos.Release.seed_collections()
Ethos.Release.seed_links()
```

(Collections because a CT-5 guide's title or summary may be denormalized into
the collection; links because `seed_connecticut`'s guide upsert replaces those
guides' outgoing edges, clobbering `BackfillLinks`' CT history edges — see
"Why `seed_links` runs last".)

Rule of thumb: **if the guide is not a file under `priv/seed_data/`, the
directory seeders cannot see it.** Check before assuming a re-run fixed
anything.

## Expected published counts

Verify between steps. Guides carry `state` and `county`, so each destination is
countable independently:

| After step | Destination | Expected published guides | Check |
| --- | --- | --- | --- |
| 1 | Manhattan | **38** | `Ethos.Guides.list_published_guides() \|> Enum.count(&(&1.county == ~s(Manhattan)))` |
| 2 | Connecticut (CT-5 only) | **5** | `Ethos.Guides.list_published_guides() \|> Enum.count(&(&1.state == ~s(Connecticut)))` |
| 3 | Connecticut (full) | **170** | same as above |
| 4 | Brooklyn | **69** | `Ethos.Guides.list_published_guides() \|> Enum.count(&(&1.county == ~s(Brooklyn)))` |
| 8 | MLB ballparks | **30** | `Ethos.Seeds.Catalog.guide_modules(~s(ballparks)) \|> Enum.count(fn {m, _} -> Ethos.Guides.get_published_guide_by_slug(m.data().slug) end)` |

Full rebuild total, excluding Rome: **308** — the four rows above (38 + 170 +
69 + 30 = 307) plus the one Bronx guide that has shipped so far,
`priv/seed_data/bronx/belmont.json`.

The Bronx and Queens seeders have no row of their own here because both are
still in flight: the count moves with every wave, so any number written in this
table would be stale before the next one lands. The total still has to add up,
so the one shipped Bronx guide is counted in it — re-derive that addend from
`ls priv/seed_data/bronx/*.json | wc -l` rather than trusting this paragraph.

Their **terminal** counts are now knowable, which they were not when this
paragraph was first written. Both programmes narrowed on 2026-08-31 from their
full rosters to an in-scope core: **14 Bronx** guides (of 66 rostered) and
**21 Queens** (of 111). When each programme's last in-scope wave lands, add its
row here and the full rebuild total becomes 307 + 14 + 21 = **342**.

Count those two by **seed file**, not by county:
`Ethos.Guides.list_published_guides() |> Enum.count(&(&1.county == ~s(Bronx)))`
also picks up the code-module Yankee Stadium guide, and the `~s(Queens)` form
picks up Citi Field — both already counted in the MLB ballparks row of 30. The
neighborhood corpus is `priv/seed_data/bronx/*.json` and
`priv/seed_data/queens/*.json`, one guide per file, and
`test/ethos/seeds/bronx_seed_data_test.exs` asserts that set equals the in-scope
roster exactly once its `:pending_bronx` tag comes off. See
`docs/superpowers/specs/2026-08-31-narrowed-nyc-scope-design.md`.

Where the numbers come from:

- **Manhattan 38** — one guide per file in `priv/seed_data/manhattan/`
  (`seed_directory/2` calls `upsert_guide!/2` exactly once per file), and all 38
  carry `county: "Manhattan"`.
- **Connecticut 170** — 165 JSON files in `priv/seed_data/connecticut/` plus the
  5 CT-5 code-module guides. (169 towns plus Mystic, a village, are represented
  across those 165 files.)
- **Brooklyn 69** — determined from the committed corpus, not from a plan
  document: `priv/seed_data/brooklyn/` holds 69 `.json` files, one guide each,
  all with `county: "Brooklyn"`; and
  `priv/seed_data/brooklyn_roster.json` lists 69 neighborhood slugs which match
  the filenames exactly, with nothing missing and nothing extra. That equality
  is asserted mechanically in
  `test/ethos/seeds/brooklyn_seed_data_test.exs` — if a seed file is ever
  deleted or added, that test fails and this number is wrong; re-derive it from
  the file count rather than editing it to match.

  Of the 69, 37 are full guides (`tier: "guide"`, four or more places) and 32
  are orientation pages (`tier: "town-page"`). Both tiers publish as guides, so
  both are inside the 69; the hub splits them into two groups, full guides
  first (`EthosWeb.DestinationController`), and the two tiers render from
  different templates (`EthosWeb.GuideController.template_for/1`).

- **MLB ballparks 30** — one guide module per ballpark in
  `Ethos.Seeds.Catalog.guide_modules("ballparks")`, which is also where the
  count in the check comes from, so it cannot drift from the catalog. That the
  catalog holds exactly thirty, matching the thirty clubs on the roster and the
  thirty `stadium` places, is asserted in
  `test/ethos/seeds/mlb_clubs_roster_test.exs`; that all thirty are items of the
  `mlb-ballparks` collection is asserted in
  `test/ethos/seeds/mlb_ballparks_collection_test.exs`. Re-derive this number
  from the catalog rather than editing it to match a live database.

If a count is short, **do not proceed to the next step.** Re-run the same
seeder (see below) and re-check.

After step 9, `/c/mlb-ballparks` should list thirty guides, and each ballpark
guide page should carry a *"Part of Major League Ballparks"* line under its
title. If the collection page is short, the guide it dropped shows no such
line and nothing else reports it — re-run steps 8 and 9 in that order.

## Seeding is not transactional across a run

There is no run-level transaction. `seed_directory/2` loops over every file,
and `GuideRunner.find_or_insert_guide!/2` commits its insert outside the
per-guide transaction.

A raise partway through — a bad place slug, a DB blip, a machine stopped
mid-run because `min_machines_running = 0` — leaves:

- earlier files **fully published**,
- the failing file as an orphan **draft** row,
- later files **unseeded**.

That is a partial state, not a corrupt one. Every seeder is **idempotent by
slug**, so simply re-running the same seeder heals it: orphan drafts are picked
up and published, unseeded files are seeded, and anything already published is
updated in place rather than duplicated. Re-run until the expected count
matches.

Two consequences worth internalizing:

- A failed seed run can leave the site looking fine while being incomplete.
  Always verify counts; never infer success from the absence of a stack trace
  you happened to see.
- Because place slugs carry a global `unique_index(:places, [:slug])`, a slug
  collision between two destinations fails at seed time, partway through. The
  test suite checks global slug uniqueness across every seed directory
  (`Ethos.SeedDataHelpers.assert_place_slugs_globally_unique!/0`) so this is
  caught before deploy — run `mix test` before seeding anything.

## After seeding

- Re-check each count above.
- Spot-check one page per destination, and one photo per destination
  (`/photos/ny/brooklyn/{slug}/{label}.jpg` should return `200 image/jpeg`).
  Photos are served from `priv/photos` by their own `Plug.Static`, not from
  `priv/static` — see `EthosWeb.Endpoint`.
- Check `sitemap.xml` and resubmit it in Google Search Console
  (see `docs/runbooks/google-search-console.md`).
