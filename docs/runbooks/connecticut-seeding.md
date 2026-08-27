# Connecticut seeding runbook

Seeding tasks live in `Ethos.Release` and are invoked via `bin/ethos rpc` (or
`fly ssh console -C "/app/bin/ethos rpc '...'"` on Fly) since Mix is not
available in the release image.

## Seed order

Run in this exact order:

1. `Ethos.Release.seed_manhattan(email)`
2. `Ethos.Release.seed_connecticut(email)` (the CT-5 code-module guides:
   Waterbury, Middlebury, Danbury, Southbury, Woodbury)
3. `Ethos.Release.seed_connecticut_expansion(email)` (the 165 JSON town/guide
   files)
4. **Verify the guide count here — see "Post-expansion verification" below —
   before proceeding.**
5. `Ethos.Release.seed_collections()`
6. `Ethos.Release.seed_links()`

`seed_links` **must run last.** `Links.replace_outgoing_links!/2` deletes a
source guide's outgoing edges before reinserting the new set. Any seeder that
runs after `seed_links` and re-authors links for the same source guides would
silently clobber `BackfillLinks`' edges. On a fresh database, Manhattan and
the CT-5 code guides are also the *targets* of `BackfillLinks` edges (see
below), so they must exist before `seed_links` runs, and `seed_collections`
(which does not touch links) is safe to run either side of `seed_links` but
is ordered before it here for consistency with the original deploy plan.

## Post-expansion verification (before `seed_collections`)

After step 3 (`seed_connecticut_expansion`) and **before** step 5
(`seed_collections`), verify the published Connecticut guide count:

```
/app/bin/ethos rpc 'Ethos.Guides.list_published_guides() |> Enum.count(&(&1.state == "Connecticut")) |> IO.inspect()'
```

Expect **170** — 165 JSON town/guide files, plus the 5 CT-5 code-module
guides (Waterbury, Middlebury, Danbury, Southbury, Woodbury). (169 towns plus
Mystic, a village, are represented across those 165 JSON files.)

Seeding is **not transactional across the whole run** — `seed_connecticut_expansion`
loops over all 165 files with no run-level transaction, and
`GuideRunner.find_or_insert_guide!/2` commits its insert outside the
per-guide transaction. A raise partway through (a bad place slug, a DB blip,
a machine stopped mid-run because `min_machines_running = 0`) leaves earlier
files fully published, the failing file as an orphan **draft** row, and later
files unseeded — a partial state, not a corrupt one.

**If the count is not 170, do not proceed to `seed_collections`.** The
seeders are idempotent by slug — simply re-run
`Ethos.Release.seed_connecticut_expansion(email)`. Re-running heals orphaned
drafts and picks up any unseeded files without duplicating anything already
published.

## Hard dependency on the Manhattan seed set

`seed_connecticut_expansion` has a hard dependency on the Manhattan seed set.
Thirteen Connecticut JSON files (`bridgeport`, `fairfield`, `greenwich`,
`milford`, `mystic`, `new-haven`, `new-london`, `norwalk`, `old-saybrook`,
`stamford`, `wallingford`, `west-haven`, `westport`) declare a link to
`guide:midtown-manhattan-guide`. Link resolution (`Links.resolve!/1`) raises
`ArgumentError` on an unknown target, which aborts the whole link-upsert pass.

On a **fresh database**, Manhattan must be seeded (`seed_manhattan`) before
Connecticut's link-upsert pass runs, or pass 3 of
`seed_connecticut_expansion` aborts with
`page link references unknown guide midtown-manhattan-guide` — **after all
165 guides have already been published** (passes 1 and 2 — place upsert and
guide upsert — complete first). That leaves a live-looking site with a
half-replaced link graph. Re-running `seed_connecticut_expansion` after
`seed_manhattan` heals this, since the run is idempotent by slug.

The CT-5 code guides are likewise link targets from the JSON corpus: 7 files
link to `danbury`, 6 to `waterbury`, 5 to `woodbury`, 3 to `southbury`, 2 to
`middlebury`. They must also exist before `seed_connecticut_expansion`'s link
pass — which the seed order above already guarantees (step 2 runs before
step 3).

On the current production database, Manhattan and the CT-5 guides are
already live, so a re-deploy of this branch is unaffected. This dependency
only bites when rebuilding a database from scratch (a new staging
environment, or a restore).
