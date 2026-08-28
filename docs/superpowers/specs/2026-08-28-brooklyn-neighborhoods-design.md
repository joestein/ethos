# Brooklyn: Every Neighborhood

**Status:** approved design, ready for planning
**Date:** 2026-08-28
**Predecessors:** `docs/superpowers/specs/2026-08-22-manhattan-neighborhoods-design.md`,
`docs/superpowers/specs/2026-08-23-connecticut-completion-design.md`

## Goal

Cover Brooklyn neighborhood by neighborhood at the depth the Manhattan guides
already reach — history, transit, parks, eateries, hotels, and a dense link
graph — so New York State reads as a real destination on ethosguides.com
rather than one borough plus a gap.

## Where we are

The site publishes 38 Manhattan neighborhood guides and 170 Connecticut town
pages. Brooklyn has none.

Everything structural that Brooklyn needs is already built and live:

- The `Guide` `tier` column (`"guide"` | `"town-page"`) and the orientation
  template at `lib/ethos_web/controllers/guide_html/town_page.html.heex`.
- County hubs that split full guides from orientation pages
  (`/destinations/new-york/brooklyn` works the moment guides carry
  `county: "Brooklyn"`, exactly as Manhattan does).
- Photos served from `priv/photos` by a dedicated `Plug.Static`, with the
  sha256 provenance manifest pattern.
- Search, `page_links`, collections, `sitemap.xml`, breadcrumbs.

This is a content program with three small code additions, not a subsystem
build.

## Roster

Brooklyn's neighborhood boundaries are contested and no single list is
authoritative. The spine is NYC Department of City Planning Neighborhood
Tabulation Areas, cross-checked against the 18 Community District profiles,
because those are published, stable, and give natural wave boundaries.

The provisional roster is **69 neighborhoods**, finalized in Task 1 of the
plan — the plan's first task produces the committed roster file, and the
validation test asserts the shipped file count matches it.

| Wave | Area | Community Districts | Neighborhoods |
|---|---|---|---|
| 1 | East Brooklyn | 5, 16, 18 | East New York, Cypress Hills, City Line, New Lots, Starrett City, Highland Park, Brownsville, Ocean Hill, Canarsie, Flatlands, Marine Park, Mill Basin, Bergen Beach, Georgetown |
| 2 | North Brooklyn | 1, 4 | Greenpoint, Williamsburg, South Williamsburg, East Williamsburg, Bushwick |
| 3 | Downtown & brownstone north | 2 | Brooklyn Heights, Dumbo, Vinegar Hill, Downtown Brooklyn, Navy Yard, Fort Greene, Clinton Hill, Boerum Hill, Cobble Hill |
| 4 | Gowanus basin & the Slope | 6 | Carroll Gardens, Columbia Street Waterfront District, Red Hook, Gowanus, Park Slope, Windsor Terrace, Greenwood |
| 5 | Central Brooklyn | 3, 8, 9 | Bedford-Stuyvesant, Stuyvesant Heights, Crown Heights, Prospect Heights, Weeksville, Prospect Lefferts Gardens, Wingate |
| 6 | Flatbush belt | 14, 17 | Flatbush, Ditmas Park, Prospect Park South, Midwood, Kensington, East Flatbush, Remsen Village, Rugby, Farragut |
| 7 | Southwest | 7, 10, 12 | Sunset Park, Borough Park, Bay Ridge, Fort Hamilton, Dyker Heights, Bath Beach, Bensonhurst, Mapleton |
| 8 | South shore | 11, 13, 15 | Gravesend, Coney Island, Brighton Beach, Sea Gate, Sheepshead Bay, Manhattan Beach, Gerritsen Beach, Homecrest, Madison, Plumb Beach |

Wave 1 is deliberately first. It is the thinnest traveler material in the
borough, so the orientation tier gets exercised immediately, and it carries the
LIRR's East New York station, so the new transit section is proven on an
awkward case before Dumbo and Williamsburg.

## Design

### Two tiers, decided by evidence

Identical to the Connecticut rule, and for the same reason. Every neighborhood
gets a finder pass and an adversarial verifier issuing per-item `confirmed` /
`refuted` / `uncertain` verdicts. After verdict filtering:

- **6 or more surviving verified places → full guide.**
- **Fewer than 6 → orientation page.**

The tier is decided *after* research, from what survived. Reputation does not
decide it in either direction: a neighborhood nobody profiles can earn a full
guide, and a famous one whose listings will not verify does not get padded into
one. The author records the surviving count and the resulting tier in its
report so a reviewer can check the call.

Brooklyn will produce more orientation pages than Manhattan did and fewer than
Connecticut did. Marine Park, Georgetown, Plumb Beach and Mapleton are
residential in the way Union and Scotland are residential.

### The transit section

Manhattan uses a uniform `"Getting there by subway"` heading across all 38
guides. Brooklyn breaks that assumption, so Brooklyn guides use a single
**`"Getting there"`** section covering whichever modes actually serve the
neighborhood:

- **Subway** — lines and station names, as Manhattan does.
- **NYC Ferry** — the landing and its route, where one exists. This is the
  primary arrival for Red Hook and a genuine option for Dumbo, Greenpoint,
  North Williamsburg, Sunset Park and Bay Ridge.
- **LIRR** — Atlantic Terminal, Nostrand Avenue, East New York.
- **Bus** — named only where it is the realistic answer rather than a
  completist listing, which is chiefly Red Hook, Marine Park, Mill Basin,
  Bergen Beach and Sea Gate.

Red Hook has no subway. Under a subway-only heading that reads as a hole in the
page; under `"Getting there"` it reads as the accurate answer.

**No trip-duration claims.** Station names and line designations are published
and stable; "twenty minutes to Midtown" is not, and it is the same class of
invented, decaying specific that drive times were in Connecticut — where 66 of
them had to be removed from live pages after the fact. This is banned in the
authoring rules and enforced mechanically (see Quality gates).

Service caveats are stated only where the MTA has published them, and are
sourced in the research artifact like any other claim.

### Lodging

A guide lists hotels only when verified hotels are physically in that
neighborhood. Brooklyn's lodging is concentrated in Downtown Brooklyn, Dumbo,
Williamsburg and Gowanus; most of the borough has none, and inventing coverage
by importing a neighboring neighborhood's hotels would put a false
neighborhood on a real place record.

Everywhere else gets a short **"Where to stay"** note naming the nearest
verified option and linking to that neighborhood's guide. This is the Manhattan
precedent (five guides already carry such a section) and it strengthens the
link graph rather than diluting the place data.

### What an orientation page contains

Unchanged from the Connecticut design, adapted to a borough:

- **History intro**, 90-130 words, from verified history facts only.
- **Getting there**, per the section above.
- **What's here** — every verified place, however few. Omitted entirely rather
  than rendered empty if a neighborhood yields zero.
- **Nearby** — built from the link graph, with adjacency stated in checkable
  terms ("borders Marine Park", "the next stop on the B train"). No trip
  durations.
- **FAQ**, 2-3 entries, including "How do I get to {Neighborhood}?".
- **One photo** if a free-licensed one exists, otherwise none.

### Floor: what does not ship

An orientation page must clear both a real, unique history intro of at least 90
words **and** at least 3 outbound links to neighboring covered neighborhoods. A
neighborhood that cannot clear the floor is **omitted**, and the omission is
recorded in the wave report. The failure mode is omission, never a stub.

### Place kinds

`Place` validates `kind` against a closed set: `museum theater restaurant cafe
brewery hotel bnb park historic-site amusement-park attraction`. Brooklyn needs
no additions — Coney Island's beach and the Riegelmann Boardwalk map to `park`
and `attraction`, Luna Park to `amusement-park`, bakeries and delis to `cafe`
or `restaurant`. Authors use the existing set; a new kind fails changeset
validation at seed time.

### Link graph

Per-file `links` arrays in the seed JSON, the Connecticut approach — not a
hardcoded module. `BackfillLinks` carries 71 Manhattan adjacency pairs in
Elixir; Brooklyn's adjacency is larger and belongs beside the content it
describes, where the wave author who established the relationship writes it and
the wave reviewer checks it.

Edge kinds already in use: `nearby` (shares a border), `shared-history`,
`same-region`, `see-also`. Cross-borough `see-also` edges are authored only
where a real, named connection exists — Brooklyn Heights and Dumbo to the
Financial District over the Brooklyn Bridge, Williamsburg to the Lower East
Side over the Williamsburg Bridge, Greenpoint to Long Island City is out of
scope because Queens is not seeded.

Manhattan guides are already live, so cross-borough link targets resolve.
`Links.resolve!/1` raises on an unknown target and aborts the whole link pass,
so every cross-borough target must name an existing Manhattan slug.

### Photos

Wikimedia Commons only; Public domain, CC0, CC BY or CC BY-SA. Paths
`/photos/ny/brooklyn/{slug}/{label}.jpg` and `..._thumb.jpg`, source images
under `images/brooklyn/`, optimized by a new
`mix ethos.optimize_brooklyn_photos` task modeled on the Connecticut one.

`priv/seed_data/brooklyn_photo_manifest.json` pins every label to its Commons
file URL and the sha256 of the image downloaded from it, and the optimizer
verifies the hash before publishing. Connecticut adopted this only after a
photo shipped carrying another image's author and licence; Brooklyn starts with
it from wave 1.

Each wave owns its own photo pipeline — fetch, verify, optimize, manifest —
because the validation test requires photos on disk, so a wave cannot go green
with its images deferred to a later task.

### Code changes

Three additions, all small:

1. `Ethos.Release.seed_brooklyn/1` — walks `priv/seed_data/brooklyn/*.json` in
   the same three passes as `seed_connecticut_expansion/1` (places, guides,
   links).
2. `Mix.Tasks.Ethos.OptimizeBrooklynPhotos` — modeled on
   `ethos.optimize_connecticut_photos`, reading `images/brooklyn/` and writing
   `priv/photos/ny/brooklyn/{slug}/`, with manifest provenance verification.
3. `test/ethos/seeds/brooklyn_seed_data_test.exs` — the gate, below.

No migration. No schema change. No new routes.

### Quality gates

The Connecticut gate ported, plus one fix and one new ban.

**Fix — global place-slug ownership.** `places` carries
`unique_index(:places, [:slug])`, so slugs are unique across the entire site.
But `manhattan_seed_data_test.exs` and `connecticut_seed_data_test.exs` each
check ownership only *within their own directory*. A Brooklyn place slug
colliding with an existing Manhattan or Connecticut slug would pass every test
and then fail at seed time in production, partway through a run that is not
transactional. The Brooklyn gate checks slug ownership across `brooklyn/`,
`manhattan/` and `connecticut/` together. Real collision candidates exist:
Brooklyn has a Sunset Park, a Marine Park and a Washington Park.

**New — trip-duration ban.** A scan over the Brooklyn seed JSON and the Elixir
seed modules rejecting minute- and hour-based transit duration claims, keyed on
matched phrase with an explicit allowlist, exactly as the drive-time gate
works. Connecticut's version is the reason 66 decaying claims were found rather
than shipped.

Carried over unchanged: roster count; licence allowlist; tier-versus-place-count
invariants (a `"guide"` with too few places fails, a `"town-page"` with 6+
fails); the orientation floor of 90 words and 3 outbound links; photo-label
uniqueness within a neighborhood; every photo present on disk; manifest
provenance for every label.

Also carried over: the per-wave fact-fidelity review tracing every claim in
every file back to the research artifacts, and an authoring-rules document
(`docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md`) that binds every
content wave, modeled on the Manhattan and Connecticut rules files.

### Seeding and rollout

The existing runbook order holds, with Brooklyn added after Manhattan and
before links:

1. `seed_manhattan`
2. `seed_connecticut`
3. `seed_connecticut_expansion`
4. `seed_brooklyn`
5. `seed_collections`
6. `seed_links` — **last**, because `Links.replace_outgoing_links!/2` deletes a
   source guide's outgoing edges before reinserting, so any seeder running
   after it silently clobbers `BackfillLinks` edges.

`docs/runbooks/connecticut-seeding.md` is generalized into a seeding runbook
covering all destinations, with the Brooklyn step and its Manhattan dependency
recorded.

Deployment is one Fly release at the end of the program, not per wave.

## Risks

**Neighborhood boundaries are contested.** Bushwick/East Williamsburg,
Ocean Hill/Bed-Stuy, Gravesend/Homecrest and the Flatbush sub-neighborhoods all
have disputed edges, and residents disagree with the city's lines. The roster
follows DCP for consistency and says so on the page where it matters; guides
describe boundaries as commonly understood rather than asserting a definitive
line.

**Volume.** 72 neighborhoods times a finder, a verifier, a photo scout, an
author and a wave reviewer is roughly two-thirds of the Connecticut program.

**Photo coverage is uneven.** Brooklyn's landmark neighborhoods are
well-photographed on Commons; the eastern and southern residential ones are
not. Expect orientation pages to ship imageless, which is correct.

**Homonyms across the site.** Sunset Park, Marine Park, Washington Park and
Prospect Park all name both places and neighborhoods, and Manhattan Beach is in
Brooklyn. Slugs disambiguate explicitly and the new global uniqueness check is
the backstop.

**Chain and closure churn.** Brooklyn restaurant turnover is high. The verifier
pass excludes anything not confirmed open, and guides favor institutions with
history over the current opening.

## Success criteria

- Every neighborhood on the committed roster is reachable from the site, or its
  omission is recorded with a reason.
- `/destinations/new-york/brooklyn` lists the full roster, full guides first.
- Every published claim traces to a verified research item.
- No trip-duration claims anywhere in the Brooklyn corpus, enforced by test.
- No place slug collides with an existing Manhattan or Connecticut slug.
- Full test suite green, including the ported and new assertions.
- Sitemap, canonical URLs and breadcrumbs correct on ethosguides.com after
  deploy.
