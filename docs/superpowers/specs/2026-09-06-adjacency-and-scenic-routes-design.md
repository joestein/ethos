# Town adjacency and scenic routes — design

Date: 2026-09-06
Status: approved for planning
Scope: three changes to Connecticut's internal link structure — town-adjacency
links, the seven foliage routes on the homepage, and four scenic-byway
collections.

## 1. Summary

Guides on this site are reachable but thinly linked. Every one of the roughly
480 sits behind a hub listing up to 170 siblings, and the homepage links five
hubs and seven guides. The change that measurably improved a page like
`/g/avon-ct-travel-guide` was the foliage route pages — a neighbourhood of
eleven siblings rather than a hundred and seventy.

This does more of that, three ways, all feeding mechanisms that already exist:

1. **Town adjacency** writes `nearby` edges between guides for towns that share
   a border — 446 pairs across all 169 towns, rendered by `ConnectedPages`.
   No new pages.
2. **The seven foliage routes** get a homepage row. They already exist; the
   homepage does not mention them.
3. **Four scenic byways** become `Collection` records, so they inherit `/c/:slug`,
   `CollectionPage` structured data, the sitemap and homepage placement.

## 2. What was verified

Checked against live services and the corpus on 2026-09-06.

**Town adjacency is published, exact, and complete.**
`Connecticut_Towns_NoLabels/FeatureServer/0` (owner `deepgis`, CC0) is a
town-lines layer whose every segment carries `TOWN_LEFT` and `TOWN_RIGHT`.
Paginated in full: **1,431 rows yielding 446 undirected pairs across all 169
towns**, averaging 5.3 neighbours, minimum 1, maximum 10. Spot-checked and
correct — Andover borders Bolton, Columbia, Coventry and Hebron; Ansonia
borders Derby, Seymour and Woodbridge.

No geometry maths is needed. The adjacency is a published attribute, not
something derived from polygons.

**The "53 scenic byways" headline does not survive contact.**
`CTDOT_Roadway_Classification_and_Characteristic_Data/FeatureServer/14`
("Scenic Roads") holds **141 segments in 74 groups**, and **only four span
three or more towns.** The rest are single-town stretches. What is actually
available:

| `LOCATE_NUM` | Routes | Designated | Status | Towns |
|---|---|---|---|---|
| 15 | 15-N, 15-S | 1993 | **National** | Greenwich, Stamford, New Canaan, Norwalk, Westport, Fairfield, Trumbull, Stratford |
| 54 | 169-N, 171-E, 44-E, 138-E | 1991 | **National** | Woodstock, Pomfret, Brooklyn, Canterbury, Lisbon |
| 74 | 207-E | 2022 | state | Hebron, Lebanon, Franklin, Sprague |
| 11 | 7-N | 2002 | state | Sharon, Salisbury, Canaan |

Every segment carries `TOWN_NAME`, so no spatial join is required here either.
`SCEN_DATE` gives the designation date and `NATIONAL_SCEN` flags the two
National Scenic Byways. `START_DESCRIP` and `END_DESCRIP` give human-readable
endpoints — `RTE 128 (CORNWALL-SHARON TPKE)` to `CANAAN – NORTH CANAAN TL`.

**All 20 byway towns have published guides.** Queried directly: 8, 5, 4 and 3,
no gaps.

**The dataset contains no route names.** There is no "Merritt Parkway" field.
See §5.

**The foliage routes are absent from the homepage.** They cover 92 towns with
eleven-sibling neighbourhoods and the front page does not link them.

**No search data exists yet.** The foliage pages shipped on 2026-09-05. Every
argument here is reasoned from link structure, not measured from impressions.
That is a real limitation and it should be revisited once Search Console has
something to say.

## 3. Premises this design rejects

- **"53 byways means 53 pages."** It means four. Seventy of the seventy-four
  groups are a single town, and a page about one town's scenic road segment is
  a thin page about a fact that belongs on that town's guide.
- **`/near/:town` pages.** One hundred and sixty-nine pages differing by a town
  name and five links is the pattern the foliage design rejected for
  `/foliage/:town`, aimed at the same weak flank. Adjacency ships as links.
- **A new page type for byways.** `Collection` already provides the URL, the
  structured data, the sitemap entry and, since the homepage work, the homepage
  placement. Building a parallel mechanism would be the mistake the foliage
  routes already made once.
- **Adjacency beyond Connecticut.** The town-line data is Connecticut's. New
  York, England, Italy and California have no equivalent here and are out of
  scope.

## 4. Town adjacency

### The data

`mix ethos.adjacency.build` fetches the town-lines layer offline, paginating
until exhausted, and writes `priv/adjacency.json` as a map of town slug to a
sorted list of neighbour slugs. The output is committed, so the running
application never calls ArcGIS — the same posture as the foliage dataset, for
the same reasons: no key, no runtime dependency, and a diff a human can read.

Build-time gates, which fail rather than write:

- Exactly 169 towns present.
- Symmetry: if A lists B then B lists A.
- No town lists itself.
- Every neighbour slug is one of the 169.
- Neighbour counts within 1..12. The observed range is 1..10; a value outside
  this means the source changed shape.

### The edges

`Ethos.Adjacency.build_links!/0` walks the committed map and writes **one edge
per undirected pair** through `Ethos.Links.upsert_link!/1`.

One edge per *pair*, not per direction, and this is load-bearing.
`Ethos.Links.links_for/2` unions outgoing and incoming edges — its moduledoc
says so explicitly: "rendering unions outgoing and incoming edges, so one
stored edge connects both pages." Writing both directions would store every
border twice and list every neighbour twice in each town's Nearby block.
`upsert_link!/1` keys on `{source, target, kind}`, so A→B and B→A are distinct
rows and nothing would dedupe them.

To make that stable, the pair is canonically ordered: the alphabetically
smaller town slug is always the source. Re-running then updates the same rows
rather than adding reverses, which is what makes the operation idempotent.

`ConnectedPages` already renders `nearby` under a **"Nearby"** heading, so no
template changes.

Town-to-guide resolution reuses `Ethos.Foliage.Routes.guide_slug_for/2`,
including its single Mansfield-to-Storrs alias. A town whose guide is missing
or unpublished is skipped with a log line and never raises: this is a link
graph, not a correctness boundary, and it must not be able to fail a request.

**Expected result: 446 stored edges — one per border — covering all 169 towns.**

### The production hook

`Ethos.Release.adjacency_links/0`, alongside the existing `foliage_links/0`.
Production runs a release with no Mix, so a function is the only way to invoke
this after a deploy. The foliage branch shipped three hooks with no callable
path and the final review caught all three; this design states the requirement
rather than assuming it.

## 5. Scenic byway collections

Four `Collection` records seeded from an Elixir module in `lib/ethos/seeds/`,
following the pattern of `antique_trail_collection.ex`. Each carries a slug, a
title, an intro, and one item per town with a blurb, ordered along the route.

### Naming is ours, and the pages say so

The dataset has no name field. `LOCATE_NUM 15` is Route 15 running from the New
York state line through eight named towns; identifying that as the Merritt
Parkway is our inference from common designation, not a value the state
publishes in this layer. The same applies to Route 169's corridor.

This is the same class of claim as the foliage stage names — Ethos's vocabulary
over the state's data — and it gets the same treatment: an explicit sentence on
each page saying where the route data comes from and that the name is the
common one, not a field in the source.

### The prose is editorial work, not generated filler

Four intros and twenty blurbs. Each is anchored to something the dataset
actually contains — the designation year, whether it is a National Scenic Byway
or a state designation, the named endpoints — plus what the town's own guide
already establishes. A blurb is at most 255 characters, which the
`CollectionItem` changeset enforces for a reason recorded in its own moduledoc.

The plan must size this as writing, because it is. Twenty-four pieces of prose
in a restrained voice, each verifiable, is the bulk of the work in this section
and it cannot be produced mechanically from the fields.

## 6. Foliage routes on the homepage

A row below Collections listing all seven routes from `Ethos.Foliage.routes/0`,
each linking `/foliage/:route_slug` with its town count. The homepage already
assigns `collections`; this adds `foliage_routes`.

Separate from Collections rather than merged into it, because they are a
different kind of thing — a collection is a curated set of guides, a foliage
route is a state-published driving route — and flattening them would misrepresent
both.

## 7. Validation and testing

- Adjacency: stored-edge count equals the pair count in the committed file —
  446, not 892; symmetry holds in the source file; no self-borders; Avon's
  neighbours are exactly Bloomfield, Burlington, Canton, Farmington, Simsbury
  and West Hartford — six, verified against the fetched dataset, not five;
  `build_links!/0` is idempotent across two runs, asserted by counting rows
  before and after a second call.
- **A guide page lists each neighbour once, not twice.** This is the
  observable consequence of storing one edge per pair, and it is the
  assertion that would catch a regression to per-direction writes.
- A town whose guide is missing is skipped, and the skip is asserted rather
  than assumed.
- Byway collections: each renders at `/c/:slug`; the count of `/g/` links on
  the page equals the collection's item count; each page carries the
  provenance sentence.
- The homepage lists all seven foliage routes with their slugs.
- `Ethos.Release.adjacency_links/0` exists and is callable — asserted, not
  assumed, because that is the class of defect the last branch shipped.
- Assertions go through real HTTP requests, not only helper functions.
- Every new assertion must fail when the thing it describes is removed. Four
  vacuous assertions were written and caught during the previous two branches;
  the mutation check is what caught all four and reading them caught none.

## 8. Risks

- **The source layer changes shape.** Both datasets are third-party. The
  build-time gates fail loudly rather than writing a wrong file, and the output
  is committed so a production deploy is never at the mercy of a live service.
- **Adjacency edges crowd `ConnectedPages`.** A town with ten neighbours adds
  ten links to a block that may already carry foliage-route edges. If a page
  looks cluttered, the fix is a per-kind cap in the component, not fewer edges.
  Not doing it now; noting where it would go.
- **Byway names could be wrong.** Route 15 from the New York line through those
  eight towns is unambiguously the Merritt Parkway, and Route 169 through the
  Quiet Corner is a well-known National Scenic Byway. If either is disputed,
  the page can name the route number alone and lose nothing factual.
- **No measurement.** Everything rests on the argument that tighter link
  neighbourhoods help. That argument is sound but unmeasured here, and the
  first Search Console data should be allowed to contradict it.
