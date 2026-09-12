# Publishing the ski corpus to production

Run after deploying `b12b7a3` (PR #24). Seven commands, **in this order**.

Replace `cryptcom@gmail.com` if your production author account differs — the
runbook requires an email that already exists as a user.

The `~s(...)` sigil is not optional: `fly ssh console` strips ordinary quotes,
so `"cryptcom@gmail.com"` arrives as a bare atom and the call fails.

## Why seven and not one

This deploy changes three Connecticut files as well as adding the ski corpus,
and `upsert_links!/1` **deletes every outgoing edge of the guides it touches**.
Re-seeding Connecticut therefore wipes its adjacency and foliage edges, which
is why steps 17 and 18 are in this list rather than skipped as unrelated.

```bash
# Step 3 — re-seed Connecticut. Picks up the three migrated files: Mohawk,
# Mount Southington and Ski Sundown removed as places, and Ski Sundown's
# opening year corrected from 1963 to 1964. Without this, production keeps the
# old places and the wrong date.
fly ssh console --app ethos -C "/app/bin/ethos rpc 'Ethos.Release.seed_connecticut_expansion(~s(cryptcom@gmail.com))'"

# Step 13 — the 82 ski guides. Expect its last line to read
# "Seeded 82 files from priv/seed_data/ski". If it reads fewer, STOP: seeding
# is not transactional and a short count means a partial corpus.
fly ssh console --app ethos -C "/app/bin/ethos rpc 'Ethos.Release.seed_ski(~s(cryptcom@gmail.com))'"

# Step 15 — eleven collections, including the two new ski ones. This RAISES if
# any of the 82 guides above is missing, so it doubles as a check on step 13.
fly ssh console --app ethos -C "/app/bin/ethos rpc 'Ethos.Release.seed_collections()'"

# Step 16 — page links, including the eight new Connecticut town <-> ski
# guide edges written by BackfillLinks.
fly ssh console --app ethos -C "/app/bin/ethos rpc 'Ethos.Release.seed_links()'"

# Step 17 — the 446 town-adjacency edges, deleted by step 3 above.
fly ssh console --app ethos -C "/app/bin/ethos rpc 'Ethos.Release.adjacency_links()'"

# Step 18 — foliage route edges, deleted by step 3 above.
fly ssh console --app ethos -C "/app/bin/ethos rpc 'Ethos.Release.foliage_links()'"

# Step 19 — retires the two renamed Connecticut place slugs. Without this,
# /p/mohawk-mountain-ski-area and /p/mount-southington-ski-area stay live
# beside the new pages for the same two mountains, carrying the unsourced
# statistics the migration removed.
fly ssh console --app ethos -C "/app/bin/ethos rpc 'Ethos.Release.prune_deleted_places()'"
```

## Verify

```bash
# Should be 200 — the guide, its collection, and a migrated town page.
curl -o /dev/null -s -w "%{http_code}\n" https://ethos.fly.dev/g/mohawk-mountain-ski-guide
curl -o /dev/null -s -w "%{http_code}\n" https://ethos.fly.dev/c/skiing-new-england
curl -o /dev/null -s -w "%{http_code}\n" https://ethos.fly.dev/p/mohawk-mountain

# Should be 404 — the two retired slugs. A 200 here means step 19 did not run.
curl -o /dev/null -s -w "%{http_code}\n" https://ethos.fly.dev/p/mohawk-mountain-ski-area
curl -o /dev/null -s -w "%{http_code}\n" https://ethos.fly.dev/p/mount-southington-ski-area
```

Then confirm the published-guide count rose by exactly 82:

```bash
fly ssh console --app ethos -C "/app/bin/ethos rpc 'Ethos.Guides.list_published_guides() |> length() |> IO.inspect()'"
```

A full rebuild from empty totals **532**. Production should land there if every
corpus is seeded; if it lands elsewhere, the gap is an unrelated corpus, not
ski — compare against `docs/runbooks/seeding.md`'s "Expected published counts"
table, which now has a row for step 13.
