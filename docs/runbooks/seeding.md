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

## Deploying: the site has no geography until you seed it

Read this before you deploy, not after. It is a planned window, not a surprise,
but it is a window in which the site is visibly degraded and only a human ends
it.

`fly.toml` runs `bin/migrate` as the deploy's `release_command`, before the new
release takes traffic. `20260905140000_drop_legacy_geo_columns` ends with
`DELETE FROM destinations WHERE kind IS NULL`, and on a database that predates
the tree **every** row matches — `kind` was added nullable and nothing
backfills it. So the release command leaves `destinations` empty. Nothing in
the deploy re-seeds it: the seed order below is run by hand.

**Between the release command finishing and someone running that order, every
guide and every place has `destination_id = NULL`** (the foreign keys are
`nilify_all`, so the delete nils them rather than blocking).

What that looks like to a visitor: guides, places, search, reactions and
collections all work. Breadcrumb trails, hub links and the house ad are absent,
and `/destinations` lists nothing. **Nothing 500s.** That was verified, not
assumed:

- `EthosWeb.GuideBreadcrumb.destination_node/1`
  (`lib/ethos_web/components/guide_breadcrumb.ex`) returns `nil` for a guide
  with no node, and the component renders no crumb rather than raising on an
  unloaded association.
- `EthosWeb.PlaceController`'s ancestry
  (`lib/ethos_web/controllers/place_controller.ex`) is `[]` for a place with no
  node; the visible `<nav>`, the `BreadcrumbList` and the `PostalAddress` all
  take the empty trail.
- `EthosWeb.HouseAd`'s `subject/1` (`lib/ethos_web/components/house_ad.ex`)
  matches on the node and falls through to `nil`, so the ad is simply omitted.

**So: run the seed order immediately after the deploy reports healthy.** Every
step is idempotent, so there is no reason to wait for a quiet moment, and no
alarm will tell you the window is still open — a site with no geography looks
healthy to every check that is not a human reading a page. If you cannot run
the seed order right after the deploy, do not deploy yet.

## Seed order

Run in this exact order. Every step depends on the ones above it, except
`seed_destinations` (step 13), which depends on nothing and nothing depends on
it — see its entry below.

Every JSON corpus publishes exactly one guide per `.json` file, so each file
count below is checkable with `ls priv/seed_data/<dir>/*.json | wc -l`.
Re-derive them that way rather than trusting the numbers here; they are the
committed corpus as of this writing and content lands continuously.

1. `Ethos.Release.seed_manhattan(email)` — 38 JSON files, `priv/seed_data/manhattan/`
2. `Ethos.Release.seed_connecticut(email)` — the CT-5 **code-module** guides
   (Waterbury, Middlebury, Danbury, Southbury, Woodbury) plus
   `Ethos.Seeds.ConnecticutPlaces`
3. `Ethos.Release.seed_connecticut_expansion(email)` — 165 JSON town/guide
   files, `priv/seed_data/connecticut/`
4. `Ethos.Release.seed_brooklyn(email)` — 69 JSON files, `priv/seed_data/brooklyn/`
5. `Ethos.Release.seed_bronx(email)` — 13 JSON files in `priv/seed_data/bronx/`.
   The programme narrowed on 2026-08-31 to **14 in-scope neighborhoods**, not
   the full 66-row roster; 13 of the 14 have shipped and one is outstanding.
   The other 52 roster rows are deferred, not abandoned — see
   `docs/superpowers/specs/2026-08-31-narrowed-nyc-scope-design.md`.
6. `Ethos.Release.seed_queens(email)` — 21 JSON files in `priv/seed_data/queens/`.
   The in-scope programme is **complete**: 21 of the 111-row roster, the set
   the same 2026-08-31 narrowing chose. (This entry used to say the directory
   was empty. It has not been since the waves landed.)
7. `Ethos.Release.seed_ballparks(email)` — 236 places and **30 guides**, the
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

   It has no dependency on steps 1-6 and none of them depends on it, but two
   later steps do, which is why it is here rather than lower down. Step 8 needs
   it (Oracle Park's places), and step 14 needs it:
   `Ethos.Seeds.MlbBallparksCollection` names all thirty ballpark guides, so
   `seed_collections` run before this raises
   `collection mlb-ballparks references unknown guide <slug>`.
8. `Ethos.Release.seed_san_francisco(email)` — 23 JSON files,
   `priv/seed_data/san_francisco/`. **Calls `seed_ballparks/1` itself** before
   the directory pass, so step 7 is a precondition it enforces rather than
   assumes: `Ethos.Seeds.OracleParkPlaces` owns seven San Francisco places the
   Mission Bay file links to instead of restating, and `Links.resolve!/1`
   raises on an unknown target.
9. `Ethos.Release.seed_london(email)` — 33 JSON files, `priv/seed_data/london/`.
   No precondition: nothing in `lib/ethos/seeds/` owns a London place or guide,
   so every target a London file names is inside the same directory.
10. `Ethos.Release.seed_rome_zones(email)` — 31 JSON files,
    `priv/seed_data/rome/`. **Calls `seed_rome/1` itself** first, because the
    zone files link to `three-days-in-rome-real-trip-guide`, which is a code
    module rather than a file in that directory. `seed_rome/1` alone seeds only
    that one flagship guide and creates no places; it is not a substitute for
    this step, and this step is not a substitute for it.
11. `Ethos.Release.seed_korean_bbq(email)` — 10 JSON files,
    `priv/seed_data/korean_bbq/`. **MUST run after steps 1, 4, 6, 8 and 9.**
    These ten guides reach places owned by the Manhattan, Brooklyn, Queens, San
    Francisco and London corpora by entry rather than restating them, and
    `GuideRunner.replace_entries!/2` resolves each entry through
    `Places.get_place_by_slug!/1`, which **raises** on a place nothing has
    seeded. That ordering cannot be enforced from `Ethos.Release` — calling all
    five would re-seed a thousand guides on every run — so it is stated here
    and asserted in `test/ethos/seeds/korean_bbq_seed_data_test.exs`.

    Step 14 depends on this one: `Ethos.Seeds.KoreanBbqCollection` names all
    ten guides.
12. `Ethos.Release.seed_steakhouse(email)` — 11 JSON files,
    `priv/seed_data/steakhouse/`, one per `build` city on the roster, carrying
    196 places between them. **MUST run after steps 1, 4, 5, 6, 8 and 11.**

    The hazard is **not** `GuideRunner.replace_entries!/2`. Every steakhouse
    entry names a `place_slug` its own file defines — no steakhouse entry
    reaches outside its own file, and
    `test/ethos/seeds/steakhouse_seed_data_test.exs` pins that as
    *every entry resolves to a place in its own file*. The seeder cannot raise
    on a missing place.

    What raises is `Links.resolve!/1`. The corpus declares **14 top-level
    `"links"` edges to 13 guides in six other corpora**, and `resolve!/1`
    raises `page link references unknown guide <slug>` on a target nothing has
    seeded. Those 13 targets are what fixes the ordering:

    - step 1 (Manhattan) — `garment-district`, `financial-district`,
      `meatpacking-district`, `murray-hill` and `flatiron-district` (Keens,
      Delmonico's, Old Homestead, Wolfgang's Park Avenue and COTE are published
      there; `flatiron-district` is named twice, by Manhattan and by Miami);
    - step 4 (Brooklyn) — `south-williamsburg` and `downtown-brooklyn` (Peter
      Luger and Gage & Tollner);
    - step 5 (Bronx) — `riverdale` and `throgs-neck`, which the Manhattan
      steakhouse page links because the Bronx rooms were folded into it.
      **Step 11 does not need step 5; this step does**, so the precondition set
      here is one wider than step 11's, not the same one;
    - step 6 (Queens) — `rego-park` (Iron Age Korean Steakhouse);
    - step 8 (San Francisco) — `union-square` (Morton's, Alexander's
      Steakhouse, ABSteak by Akira Back);
    - step 11 (Korean BBQ) — `manhattan-korean-bbq-guide` and
      `chicago-korean-bbq-guide` (COTE again, and Iron Age Wicker Park,
      Perilla Steakhouse and Shinhwa Korean Steakhouse).

    Running immediately after step 11 satisfies all six preconditions at once.

    Step 14 depends on this one: `Ethos.Seeds.SteakhouseCollection` names all
    eleven guides.

    This task also adds five destination nodes the corpus needs —
    `united-states/california/beverly-hills`,
    `united-states/california/west-hollywood`,
    `united-states/florida/miami-beach`, `united-states/florida/coral-gables`
    and `united-states/florida/aventura` — because, following
    `korean_bbq/puget-sound.json`, the Los Angeles and Miami guides sit on one
    node while each room carries the municipality it is actually in.
13. `Ethos.Release.seed_destinations()` — 15 JSON files, `priv/seed_data/destinations/`.
    **Takes no email argument** — unlike every seeder above it, a destination
    page has no author. Each file is an overlay: it is keyed on a destination
    node's path and adds that hub's intro and photos to the row the roster
    already owns. It seeds the roster itself first, the way every other seeder
    does, so it still runs safely before, after or between any other step — it
    references no place and resolves no link. It is listed here, after every
    guide corpus and before `seed_collections`, for consistency with the rest
    of this list.
14. `Ethos.Release.seed_collections()` — nine collections: The Burys of
    Connecticut (steps 2 and 3), Antique Trail of CT (step 2), Major League
    Ballparks (step 7), Korean BBQ (step 11), Steakhouses (step 12), and the
    four scenic-byway collections (Merritt Parkway, Route 169, Route 207,
    Route 7 in the north-west — all twenty of their town guides come from
    step 3). After **every** guide step, never between them.
15. `Ethos.Release.seed_links()`
16. `Ethos.Release.adjacency_links()` — writes the 446 town-adjacency `nearby`
    edges. Runs after `seed_links` (step 15), not before: `BackfillLinks`
    writes two of the CT-5 `nearby` edges (`waterbury`↔`middlebury`,
    `woodbury`↔`southbury`) in the reverse of the direction this step itself
    writes, and running this step first leaves those two pairs permanently
    duplicated — re-running `adjacency_links` afterward updates its own
    canonical-direction row but never touches or removes the reversed one
    `seed_links` already wrote. Also **re-run this step after any content
    seeder**, for the same reason given below for `seed_links`:
    `upsert_links!/1` deletes every outgoing edge of the guides it touches,
    and all 446 adjacency edges are CT-guide→CT-guide.
17. `Ethos.Release.foliage_links()` — writes the foliage route link edges and
    logs any route stop whose guide is unpublished or renamed. No ordering
    conflict with `seed_links` the way `adjacency_links` has — it writes a
    different edge kind (`same-region`) that `BackfillLinks` never touches —
    but it shares the same delete-all hazard: **re-run this step after any
    content seeder** too, or a re-seeded Connecticut guide's foliage edges
    silently disappear along with its adjacency edges.

Verify the published count after each content step before moving on — see
"Expected published counts" below. `seed_destinations` writes to the
`destinations` table rather than `guides`, so it has no row in that table.
It creates no rows at all now: each of the fifteen files is keyed on a node
path and overlays an intro and photos onto a row the roster already owns, so
`Ethos.Destinations.list_destinations() |> Enum.count()` reads the roster's
size (**757**) both before and after it, not 15. That number is the length of
`priv/seed_data/destination_tree.json` and is asserted against this runbook in
`test/ethos/seeds/destination_tree_test.exs` — when the roster grows, that test
fails and this paragraph is what it is telling you to update. What confirms
`seed_destinations` ran is the prose:
`Ethos.Destinations.get_by_path("united-states/connecticut").intro` should be
the long Connecticut history, not the stub "Connecticut, county by county."

A count of **772** — the roster plus fifteen — means the pre-Task-13 keys are
back. Those extra rows have no `kind` and no `parent_id`; they shadow fifteen
hubs, disable their redirects, enter the sitemap, and list Connecticut, New
York and Rome on `/destinations` beside the countries.

### `add_tree_to_destinations` was renumbered from 120000 to 123000

Read this if `mix ecto.migrate` fails with *"migration version 20260905123000
is duplicated"*, or if a box that ran this branch before the merge later
reports a duplicate column.

`add_tree_to_destinations` was authored as `20260905120000`. Main authored
`20260905120000_add_usernames_and_moderation_fields_to_users` at the same
timestamp, and Ecto refuses to run a migration set with two of the same
version. Only one could move, and it had to be this one: main's is already
applied in production, so renaming it would make Postgres try to add columns
that exist. This branch has never been deployed, so renaming it costs
production nothing.

The one place it does cost something is a **dev or staging box that ran this
branch before the merge**. It recorded `20260905120000` and will now see
`20260905123000` as a new migration, re-run it, and fail on
`column "kind" of relation "destinations" already exists`. The fix is to
either drop and recreate that database, or insert the new version by hand:

    INSERT INTO schema_migrations (version, inserted_at)
    VALUES (20260905123000, now());

This is the same hazard class as the note below about `20260905140000`: a
migration file that changed identity after someone had already run it.

### The migration deletes every `kind IS NULL` destination row

Read this before restoring a backup or standing up staging from a database that
predates the tree.

`20260905140000_drop_legacy_geo_columns` runs
`DELETE FROM destinations WHERE kind IS NULL` immediately before it tightens
`destinations.kind` to `NOT NULL`. It is not a tidy-up; without it the
migration cannot run at all on a database with content, and the rows it removes
are ones no seeder can:

- `kind` was added nullable by `20260905123000` and nothing backfills it, so
  the `SET NOT NULL` aborts with `column "kind" contains null values` on any
  database carrying pre-tree destination rows. `fly.toml` runs migrations as
  the deploy's `release_command`, **before any seeding**, so that abort rolls
  the whole deploy back. This is invisible to the test suite, which migrates an
  empty `destinations` table.
- The rows in question are the fifteen pre-Task-13 curated hub records
  described just above — keyed on `connecticut`, `rome`,
  `new-york/manhattan` and friends, which are now `legacy_paths` of real nodes.
  `Ethos.Seeds.DestinationTree.upsert_all!/0` upserts by `path` and never
  deletes, so re-seeding leaves them exactly where they are. Deleting them here
  is the only thing that retires them from a live database.

Nothing is orphaned by the delete: `guides.destination_id` and
`places.destination_id` are `nilify_all`, and at release-command time — before
any seeder runs — they are still NULL anyway.

**Nothing is lost, but you must re-seed.** Every row comes back from the roster
— `Ethos.Release.seed_destination_tree()`, which every seeder below also runs
first — and step 13's fifteen overlay files put the curated prose and photos
back on top. Run the full seed order after the migration, exactly as for a
fresh database, and confirm the count reads 757 and
`get_by_path("united-states/connecticut").intro` is the long history rather
than the stub.

Rolling the migration back restores the column's nullability, not the deleted
rows.

`Ethos.Release.seed_rome(email)` seeds one standalone guide
(`three-days-in-rome-real-trip-guide`) and no places. It has no dependencies,
so it may be run on its own at any time — but it is not optional overall:
step 10 (`seed_rome_zones/1`) calls it, because the zone corpus links to that
guide and `Links.resolve!/1` raises on an unknown target.

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
guides from step 7, and "Korean BBQ" pulls all ten from step 11. Between them
the collections now depend on four separate guide steps, so `seed_collections`
is not satisfiable by any subset of them.

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

Verify between steps.

**`guides.state` and `guides.county` are gone.** `20260905140000` dropped both
columns and the schema fields with them, so the `&(&1.county == ~s(Manhattan))`
form this table used to carry now raises `KeyError` on a release console. A
guide's geography is the node it points at, and a destination is a *subtree* of
the tree, so the counting form is `Destinations.under?/2` over the node:

```elixir
count = fn path ->
  Ethos.Guides.list_published_guides()
  |> Ethos.Repo.preload(:destination_node)
  |> Enum.count(&Ethos.Destinations.under?(&1.destination_node, path))
end
```

`under?/2` is `false` for a guide with no node, so this never raises during the
seed window described at the top of this runbook — it just returns 0.

| After step | Destination | Expected published guides | Check |
| --- | --- | --- | --- |
| 1 | Manhattan | **38** | `count.(~s(united-states/new-york/new-york-city/manhattan))` |
| 2 | Connecticut (CT-5 only) | **5** | `count.(~s(united-states/connecticut))` |
| 3 | Connecticut (full) | **171** | same as above |
| 4 | Brooklyn | **69** | `count.(~s(united-states/new-york/new-york-city/brooklyn))` |
| 5 | Bronx | **13** | `count.(~s(united-states/new-york/new-york-city/bronx))` |
| 6 | Queens | **21** | `count.(~s(united-states/new-york/new-york-city/queens))` |
| 7 | MLB ballparks | **30** | `Ethos.Seeds.Catalog.guide_modules(~s(ballparks)) \|> Enum.count(fn {m, _} -> Ethos.Guides.get_published_guide_by_slug(m.data().slug) end)` |
| 8 | San Francisco | **24** | `count.(~s(united-states/california/san-francisco))` |
| 9 | London | **33** | `count.(~s(united-kingdom/england/london))` |
| 10 | Rome | **31** | `count.(~s(italy/lazio/rome))` |
| 11 | Korean BBQ | **10** | the seeder's own last line, `Seeded 10 files from priv/seed_data/korean_bbq` (these ten file on five different nodes, so no single subtree counts them) |
| 12 | Steakhouses | **11** | the seeder's own last line, `Seeded 11 files from priv/seed_data/steakhouse` (these eleven file on eleven different nodes, six of which no earlier step touches, so no single subtree counts them) |

**Read the rows in order, and only after the step they name.** These are
subtree counts, and four rows need spelling out:

- **Connecticut (full) is 171, not 170.** 165 JSON files plus the five CT-5
  code-module guides is 170. The 171st is `antique-trail-of-connecticut`
  (`Ethos.Seeds.AntiqueTrailGuide`), a sixth code module that step 2 seeds
  alongside the CT-5 and that files under `united-states/connecticut`.
- **San Francisco is 24, not 23.** 23 JSON files plus the code-module Oracle
  Park guide, which `destination_path`s to
  `united-states/california/san-francisco` and which step 8 seeds itself by
  calling `seed_ballparks/1`. Counted once here and once in the ballparks row
  of 30; it is the same guide.
- **Rome is 31, not 32.** 31 zone files plus the flagship
  `three-days-in-rome-real-trip-guide` is 32 guides, but only 31 of them sit in
  this subtree. `vatican-city-rome-guide` files on the `vatican-city` root —
  Vatican City is its own sovereign node in the tree, not a child of
  `italy/lazio/rome` — so it is outside every count taken here. The flagship,
  which step 10 seeds itself by calling `seed_rome/1`, does sit on
  `italy/lazio/rome` and is counted.
- **The Bronx and Queens rows are the neighbourhood corpora only, and only
  before step 7.** Yankee Stadium sits on the Bronx node and Citi Field under
  Queens, so after the ballparks step those two subtrees read 14 and 22. Both
  ballpark guides are already inside the row of 30.

  Step 11 adds one more to each of Manhattan, Brooklyn, Queens, London and San
  Francisco: the Korean BBQ guides file on those nodes. After step 11 Manhattan
  reads 39, Brooklyn 70, Queens 23, London 34 and San Francisco 25.

  Step 12 adds one more to those same five, for the same reason — the
  Manhattan, Brooklyn, Queens, London and San Francisco steakhouse guides file
  on those nodes. **After a full rebuild Manhattan reads 40, Brooklyn 71,
  Queens 24, London 35 and San Francisco 26.** The other six steakhouse guides
  open subtrees no earlier step touches and each reads 1: Chicago
  (`united-states/illinois/chicago`), Los Angeles
  (`united-states/california/los-angeles`), Seattle
  (`united-states/washington/seattle`), Boston
  (`united-states/massachusetts/boston`), Miami
  (`united-states/florida/miami`) and Washington
  (`united-states/district-of-columbia/washington`). Miami and Los Angeles read
  1 and not more even though their rooms sit on the Miami Beach, Coral Gables,
  Aventura, Beverly Hills and West Hollywood nodes — those nodes carry places,
  not guides, and this table counts guides.

The Bronx and Queens programmes both narrowed on 2026-08-31 from their full
rosters to an in-scope core: **14 Bronx** guides (of 66 rostered) and
**21 Queens** (of 111). Queens is complete. The Bronx has shipped 13 of its 14;
`test/ethos/seeds/bronx_seed_data_test.exs` asserts the set equals the in-scope
roster once its `:pending_bronx` tag comes off, and that is what will tell you
the fourteenth landed. See
`docs/superpowers/specs/2026-08-31-narrowed-nyc-scope-design.md`.

**Full rebuild total: 450 published guides.** Derived, not counted off a live
database: 38 Manhattan + 5 CT-5 + 165 Connecticut + 69 Brooklyn + 13 Bronx +
21 Queens + 30 ballparks + 23 San Francisco + 33 London + 31 Rome zones + 1
Rome flagship + 10 Korean BBQ + 11 steakhouses. Every JSON addend is
`ls priv/seed_data/<dir>/*.json | wc -l`; re-derive them that way rather than
trusting this sum, which moves with every content wave. Check it with
`Ethos.Guides.list_published_guides() |> length()`.

Where the numbers come from:

- **Manhattan 38** — one guide per file in `priv/seed_data/manhattan/`
  (`seed_directory/2` calls `upsert_guide!/2` exactly once per file), and all 38
  file on nodes under `united-states/new-york/new-york-city/manhattan`.
- **Connecticut 170** — 165 JSON files in `priv/seed_data/connecticut/` plus the
  5 CT-5 code-module guides. (169 towns plus Mystic, a village, are represented
  across those 165 files.)
- **Brooklyn 69** — determined from the committed corpus, not from a plan
  document: `priv/seed_data/brooklyn/` holds 69 `.json` files, one guide each,
  all under the Brooklyn node; and
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

After step 14, `/c/mlb-ballparks` should list thirty guides and `/c/korean-bbq`
ten, and each of those guide pages should carry a *"Part of …"* line under its
title. If a collection page is short, the guide it dropped shows no such line
and nothing else reports it — re-run the guide step it came from (7 for a
ballpark, 11 for a Korean BBQ guide) and then step 14, in that order.

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
