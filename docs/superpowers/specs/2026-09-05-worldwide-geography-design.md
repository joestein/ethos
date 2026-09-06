# Worldwide Geography — Design

Date: 2026-09-05
Status: Draft for review
Branch: `worktree-worldwide-geography`

## Goal

Replace the fixed `state` / `county` / `town` ladder on guides and places
with a variable-depth geographic hierarchy, so every corpus is modelled as
what it actually is: a country above a region above a city above a
neighborhood, at whatever depth that particular place needs. Existing hub
pages, URLs, breadcrumbs, sitemap and search keep working; indexed URLs
301 to their new hierarchical paths.

This is the prerequisite project for the steakhouses vertical (a separate
spec), which needs Chicago, Seattle, Washington DC, Baltimore, Miami, Los
Angeles, Boston and Staten Island to sit correctly in the tree.

## Why now: the columns are already lying

The three columns hold different tiers in each corpus. This is not a
hypothetical future problem — it is the current contents of the 393 seed
files:

| Corpus | `state` holds | `county` holds | `town` holds |
| --- | --- | --- | --- |
| Connecticut (165) | Connecticut *(state)* | Tolland County *(county)* | Andover *(town)* |
| Manhattan (38) | New York *(state)* | Manhattan *(borough)* | Alphabet City *(neighborhood)* |
| Brooklyn (69) | New York *(state)* | Brooklyn *(borough)* | Bath Beach *(neighborhood)* |
| Queens (21) / Bronx (13) | New York *(state)* | Queens / Bronx *(borough)* | neighborhood |
| San Francisco (23) | California *(state)* | San Francisco *(city)* | The Castro *(neighborhood)* |
| Rome (31) | **Italy** *(country)* | **Rome** *(city)* | Ardeatino *(rione)* |
| London (33) | **England** *(country)* | **London** *(city)* | Barking *(town)* |

`state` already holds countries. `county` already holds cities and
boroughs. `town` already holds neighborhoods. Rome's actual hierarchy —
Italy, Lazio, Rome, Monti — cannot be expressed at all, because Lazio has
nowhere to go.

Depth genuinely varies: Connecticut needs four tiers, New York City needs
five, Rome needs four, and a city-state needs two. Any fixed-column scheme
requires a null-padding convention that every query then has to know
about.

## Non-goals

- No new content. Not one guide, place or photo is added by this project.
- No change to `/g/:slug`, `/p/:slug` or `/c/:slug` URLs.
- No collections work (that belongs to the steakhouses spec).
- No re-research or re-authoring of existing corpus text. Seed files are
  rewritten mechanically, geo keys only.

## 1. Data model

`destinations` already is a materialized-path node table — `path`, `name`,
`intro`, `photos`, with a unique index on `path`, keyed today as
`"connecticut"`, `"connecticut/fairfield-county"`, `"new-york/manhattan"`,
`"rome"`. It is missing only parentage, a tier label, and any link from
guides and places. So this project grows that table rather than adding a
rival one.

```
destinations
  id
  parent_id      references destinations(id)   -- null only for countries
  kind           country | region | county | city | borough | town | neighborhood
  name           "Litchfield County"
  slug           "litchfield-county"           -- one segment
  path           "united-states/connecticut/litchfield-county"  -- unique
  position       integer, default 0            -- sibling ordering
  intro, photos  unchanged

guides.destination_id  references destinations(id)
places.destination_id  references destinations(id)
```

`path` stays the public identifier and stays unique; it is the
`/`-join of the node's ancestor slugs. `parent_id` makes ancestry
queryable without string parsing; `path` keeps hub lookup a single indexed
read. Both are maintained together, with a test asserting they never
disagree.

`kind` is a closed vocabulary validated by `validate_inclusion`, extensible
by migration. It drives display labels ("Counties in Connecticut" vs
"Rioni in Rome") and sitemap priority. It does **not** drive structure —
ancestry does — so a corpus that skips a tier just has no node of that
kind. Nothing null-pads.

### How the existing corpora land

```
united-states                                    country
  connecticut                                    region
    litchfield-county                            county
      woodbury                                   town        (165 CT guides)
  new-york                                       region
    new-york-city                                city
      manhattan                                  borough     (38 guides)
        alphabet-city                            neighborhood
      brooklyn                                   borough     (69 guides)
      queens                                     borough     (21 guides)
      bronx                                      borough     (13 guides)
  california                                     region
    san-francisco                                city
      the-castro                                 neighborhood (23 guides)
italy                                            country
  lazio                                          region
    rome                                         city
      monti                                      neighborhood (31 rioni)
united-kingdom                                   country
  england                                        region
    london                                       city
      barking-and-dagenham                       borough      (33 guides)
```

Three tiers where three is the truth, five where five is.

Note `town` becomes a `kind`, not a column — which resolves the specific
complaint that "town" was wrong for NoHo and Monti. Woodbury is a `town`
node; Monti is a `neighborhood` node; both are just nodes.

### Transition strategy

`state`, `state_slug`, `county`, `county_slug`, `town`, `town_slug` are
**kept and backfilled** from the tree for the duration of the project, so
every existing query, template and test keeps working while call sites move
over one at a time. They are dropped in a final migration once nothing
reads them, verified by grep and a green suite. The refactor therefore
never has to be atomic across 393 files.

## 2. URL scheme and redirects

Hub URLs become the node's full path, at any depth:

```
/destinations                                              index of countries
/destinations/united-states
/destinations/united-states/connecticut
/destinations/united-states/connecticut/litchfield-county
/destinations/united-states/connecticut/litchfield-county/woodbury
/destinations/italy/lazio/rome/monti
/destinations/united-kingdom/england/london/barking-and-dagenham
```

The three current routes collapse to two:

```elixir
get "/destinations", DestinationController, :index
get "/destinations/*path", DestinationController, :show
```

`show` joins the glob, looks the node up by path, and renders a hub whose
content depends on what the node has: child nodes, guides attached to it,
and places within it. The four existing hub templates (`index`, `show`,
`state`, `county`) collapse into `index` plus one node template that varies
by `kind`.

### Redirects

Every currently indexed URL 301s to its new path. Resolution order in
`show`: exact path hit renders; otherwise a legacy lookup 301s; otherwise
404.

```
/destinations/connecticut                    -> /destinations/united-states/connecticut
/destinations/connecticut/litchfield-county  -> /destinations/united-states/connecticut/litchfield-county
/destinations/new-york/manhattan             -> /destinations/united-states/new-york/new-york-city/manhattan
/destinations/rome                           -> /destinations/italy/lazio/rome
/destinations/italy                          -> /destinations/italy/lazio/rome
/destinations/italy/rome                     -> /destinations/italy/lazio/rome
/destinations/england                        -> /destinations/united-kingdom/england
/destinations/england/london                 -> /destinations/united-kingdom/england/london
/destinations/california/san-francisco       -> /destinations/united-states/california/san-francisco
```

`/destinations/italy` is the one lossy case: today it is the Rome corpus's
state-level hub, and under the corrected tree Italy is a country whose only
content sits under Lazio. It redirects to the Rome city hub rather than to
a near-empty country page, and stops redirecting once Italy has a second
region.

Legacy paths are stored as `destinations.legacy_paths` (a string array with
a GIN index) rather than a separate table — they are an attribute of the
node that moved, they are seeded from the same roster, and a node can have
several as the tree deepens. `Destinations.get_by_legacy_path/1` backs the
redirect branch.

The sitemap emits only new paths. Google Search Console resubmission
follows the existing runbook at `docs/runbooks/google-search-console.md`.

## 3. Seed authoring format and the 393-file migration

### The tree is data

A new roster, `priv/seed_data/destinations/tree.json`, is the single
declaration of the hierarchy:

```json
[
  {"path": "united-states", "kind": "country", "name": "United States"},
  {"path": "united-states/connecticut", "kind": "region", "name": "Connecticut"},
  {"path": "united-states/connecticut/litchfield-county", "kind": "county",
   "name": "Litchfield County", "legacy_paths": ["connecticut/litchfield-county"]},
  {"path": "italy/lazio/rome/monti", "kind": "neighborhood", "name": "Monti"}
]
```

Parentage is derived from `path`, so the file cannot declare a node whose
parent is missing without the loader raising. Hub prose and photos stay in
the existing `priv/seed_data/destinations/*.json` files, matched by path.

### Guide and place seed files

The geo keys on every guide and place collapse to one:

```diff
   "guide": {
     "slug": "alphabet-city-manhattan-guide",
     "destination": "Alphabet City, New York",
-    "state": "New York",
-    "county": "Manhattan",
+    "destination_path": "united-states/new-york/new-york-city/manhattan/alphabet-city",
   },
   "places": [
     { "slug": "museum-of-reclaimed-urban-space",
-      "town": "Alphabet City", "state": "New York", "county": "Manhattan",
+      "destination_path": "united-states/new-york/new-york-city/manhattan/alphabet-city",
     }
   ]
```

`destination` stays as the human display string. Everything structural
comes from the node.

### The rewrite

`mix ethos.migrate_geo` rewrites all 393 files mechanically. Each corpus
has a deterministic mapping from its current `(state, county, town)` triple
to a path — seven small rules, one per corpus, listed in the task. The task
is idempotent, writes JSON with stable key order and two-space indent to
keep the diff readable, and fails loudly on any file whose triple matches
no rule rather than guessing. The diff is reviewed per corpus, not per
file.

Loader changes: `Ethos.Seeds.DataGuide` reads `destination_path`, resolves
the node, and sets `destination_id` on guide and places. `GuideRunner` and
`Places.upsert_place!/1` take the id through. The `seed_*` functions in
`Ethos.Release` are untouched apart from seeding the tree before anything
else.

## 4. Testing

Baseline is **746 tests, 0 failures**, and stays green at every commit.

Every run in this worktree needs `MIX_TEST_PARTITION=wwgeo` — the other
live worktrees share the `ethos_test` database, and at least one has
migrated it with a `users.username` column that does not exist on this
branch. Without the partition the suite reports ~333 spurious failures.

New tests:

- **Tree integrity** — `path` equals the `/`-join of ancestor slugs for
  every node; no cycles; `parent_id` null only for `kind: country`; paths
  unique; every `kind` in the vocabulary.
- **Seed gate** — every guide and place seed file resolves to an existing
  node; no file carries both the legacy triple and `destination_path` once
  migrated. This is the file-count guard, in the style of the existing
  London and San Francisco gates.
- **Redirects** — each legacy path shape 301s to the expected new path, and
  an unknown path 404s.
- **Depth** — a four-tier corpus (Connecticut), a five-tier corpus
  (Manhattan) and a country-skipping-a-tier case each render their hub and
  breadcrumbs correctly.

Updated: `guide_geo_test`, `destinations_test`, `destination_controller_test`,
`hub_pages_test`, `sitemap_controller_test`, `seo_indexing_test`,
`json_ld_parity_test`, `places_test` (sibling lookup moves from
`town_slug`/`state_slug` to node ancestry), `connected_pages_test`.

## 5. Rollout

1. Migration adding `parent_id`, `kind`, `position`, `legacy_paths` to
   `destinations`, and `destination_id` to `guides` and `places`.
2. Tree roster + loader + `Destinations` ancestry functions, with legacy
   columns still authoritative. Suite green.
3. `mix ethos.migrate_geo`, reviewed corpus by corpus. Legacy columns now
   backfilled *from* the tree. Suite green.
4. Routes, controller, templates, breadcrumbs, JSON-LD, sitemap move to
   paths. Redirects land with their tests.
5. Drop the legacy columns once grep is clean. Suite green.
6. Deploy, reseed, verify hubs at each depth and a sample of 301s, resubmit
   the sitemap per the GSC runbook.

Steps 1–5 are each independently committable and independently green,
which matters because four other worktrees are live and this touches every
seed file.

## Known risk: concurrent worktrees

`connecticut-expansion`, `foliage-tools`, `golf-destinations` and
`social-layer` are active, and at least one is adding corpora. Any corpus
that lands after step 3 arrives with the old geo keys and needs the mapping
task re-run over it. The decision taken is to proceed now and absorb the
conflicts rather than wait; `mix ethos.migrate_geo` being idempotent and
rule-driven is what makes re-running it over late arrivals cheap.

## Global constraints

Phoenix 1.7.14; no AI or network calls in shipped code; `mix format` clean
and the full suite green before every commit; place-slug global uniqueness
preserved; photo paths and licensing rules unchanged.
