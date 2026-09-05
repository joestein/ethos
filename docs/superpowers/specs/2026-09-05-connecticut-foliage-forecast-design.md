# Connecticut Foliage Forecast — design

Date: 2026-09-05
Status: approved for planning
Scope: the foliage artifact and the static-data foundation it needs.
Out of scope: collection trail maps, the 90-minute planner. Both are addressed
only in "Decisions that constrain later tools".

## 1. Summary

Ethos publishes a Connecticut Foliage Forecast: a per-town, per-week foliage
estimate **derived from CT DEEP's own published foliage map**, resolved to all
169 towns, and hung on the seven official state foliage driving routes. Each
route page lists the towns the route passes through and links to the existing
Ethos guide for each. The map is server-rendered inline SVG with no basemap
vendor, no API key, and no JavaScript requirement. An embeddable version with
an attribution link is the link-earning mechanism.

The numeric content is frozen and attributed. What changes during the season is
a dated editorial field note written in the site's voice.

## 2. What was verified

Every claim below was checked against live services on 2026-09-05, not assumed.

**CT DEEP publishes no live foliage data.** The "CT DEEP Fall Foliage Report" is
an ArcGIS StoryMap (item `37fd12fa3a7e46b0ba0da404496cb0ea`) wrapping web map
`6cdb962224a84628874ece2d30d8429c`. That web map contains nine layers,
`FallFoliage_Week1_Sept16_22` through `FallFoliage_Week9_PastPeak`, each an
`ArcGISTiledMapServiceLayer` — pre-rendered raster tiles, `capabilities:
Map,TilesOnly,Tilemap`, `exportTilesAllowed: false`. There are no attributes and
no query endpoint.

**The tiles are three seasons stale.** Item timestamps:

| Item | created | modified |
|---|---|---|
| `FallFoliage_Week9_PastPeak` | 2023-09-27 | 2023-09-27 |
| `Property_FallFoliage_Scenic` | 2023-10-02 | 2023-10-02 |
| `Fall Foliage Driving Routes` | 2023-09-18 | 2023-10-02 |
| `KeyCities_CT` | 2023-09-28 | 2023-10-02 |

Nothing has been modified since October 2023. The portal page is re-dated each
autumn; the map underneath is not. What DEEP publishes is a **climatological
normal**, not a current-season forecast. This is the single most important fact
in this document and it must be stated on every page that shows a number.

**The tiles are samplable and the result is coherent.** Sampling the nine week
services at z=12 at five known locations reproduces DEEP's own published
regional peak windows:

| | Sep16 | Sep23 | Sep30 | Oct7 | Oct14 | Oct21 | Oct28 | Nov4 |
|---|---|---|---|---|---|---|---|---|
| Salisbury (NW) | green | yellow | orange | **red** | **red** | past | past | past |
| Norfolk (NW hills) | green | yellow | orange | **red** | **red** | past | past | past |
| Hartford (centre) | green | green | yel-grn | yel-grn | orange | **red** | past | past |
| Old Saybrook (shore) | green | green | green | green | yel-grn | yellow | orange | **red** |
| Greenwich (SW) | green | green | green | green | green | yellow | yellow | **orange** |

Monotonic per town, spatially coherent, and consistent with DEEP's stated
windows (NW Oct 7–13, mid-state Oct 14–20, shoreline Oct 28–Nov 3, SW Nov 4–10).

**The legend is a continuous ramp, not named classes.** The StoryMap symbology
resource (`_GGdivJPeNf9KrJr6Hy2t.png`) is a smooth green → yellow → orange → red
→ dark-red gradient. DEEP names no discrete stages. Any stage vocabulary is
therefore **Ethos's editorial binning of the state's ramp**, and the page says
exactly that.

**Town geometry is free and open.** `Connecticut_Towns_NoLabels/FeatureServer/1`
(owner `deepgis`, licence `CC0`) — polygons with `TOWN`, `COUNTY`, `FIPS_COD`,
`AREA_SQMI`. 785 rows covering 169 CT towns once filtered to `STATE_COD='CT'`
with a non-blank `COUNTY` and dissolved on `TOWN`.

**The routes exist and join cleanly to the corpus.**
`Fall_Foliage_Driving_Routes/FeatureServer/0` — seven polylines with `ROUTENAME`
and a state `URL`: Traditional New England, Scenic Fairfield, Hartford West,
Yankee Roots, Connecticut Heritage, Connecticut River Gateway, New Haven &
Neighborhood. An ArcGIS `esriSpatialRelIntersects` query of the town layer
against the Hartford West polyline returns 11 towns — Avon, Barkhamsted, Canton,
East Granby, Granby, Hartford, Hartland, New Hartford, West Hartford, Windsor,
Windsor Locks — and **all 11 have published Ethos guides**.

**Corpus coverage is complete.** 169 towns; 165 have a JSON seed under
`priv/seed_data/connecticut/`; the remaining six (Danbury, Mansfield,
Middlebury, Southbury, Waterbury, Woodbury) are covered by Elixir seed modules
and the Burys collection. `mystic` and `storrs` are village-level guides, not
towns. The resolver therefore reads the `guides` table, not the seed files.

**Ethos has no geospatial data.** `places` has no lat/lng columns at all.
`entries` has nullable `:lat`/`:lng` and no seed module in the catalog populates
them. There is nothing to build on and nothing to reuse.

## 3. Premises this design rejects

Recorded so the plan does not quietly reintroduce them.

- **"Live tracker."** There is no live input. The word does not appear in the
  product, the URL, the title, or the OG card.
- **"User-submitted reports as the differentiator."** Cut entirely from v1. A
  visible empty state advertises a dead site to the exact reader — reporter,
  librarian, tourism officer — whose link is the goal. The market-leading
  foliage map added user reports in 2022, nine years after launch, once it had
  an audience.
- **"Rank for foliage queries this season."** The press cycle runs mid-August to
  mid-September and the domain has no backlinks. This will not rank in 2026.
  The deadline is a **pitch** deadline, not an SEO deadline, and the design is
  optimised for a human being pointed at the page.
- **"169 `/foliage/:town` pages."** Rejected. Pages differing only by town name
  and a colour band are near-duplicate thin content aimed at the site's weakest
  flank. Town-level foliage content attaches to the guide that already exists.
- **"Shared geospatial foundation up front."** There is nothing shared to build.
  A town table does not serve the 90-minute planner, which needs place-level
  coordinates that do not exist. Build the town table only.
- **"MapLibre plus a tile vendor."** Unnecessary for 169 static polygons and
  seven polylines over a fixed extent. No vendor, no key, no bundle.

## 4. Architecture

Two kinds of data, deliberately stored differently.

**Static derived data — files, not tables.** Town geometry, the 169 × 9 stage
matrix, and route/town joins are frozen outputs of an offline build. They ship
as JSON under `priv/foliage/`, loaded once at boot into `:persistent_term`.
No migration, no production seeding, no runtime dependency on ArcGIS, and the
site keeps working unchanged if DEEP takes the map down.

**Editorial data — one table.** Field notes change during the season and are
written by a human. One Ecto schema, admin-authored through the existing
`:require_admin_user` pipeline.

```
lib/ethos/foliage.ex                  # context: read API over persistent_term + notes
lib/ethos/foliage/town.ex             # struct (not Ecto)
lib/ethos/foliage/route.ex            # struct (not Ecto)
lib/ethos/foliage/week.ex             # struct (not Ecto)
lib/ethos/foliage/note.ex             # Ecto schema — the only table
lib/ethos/foliage/dataset.ex          # boot loader, persistent_term, validation on load
lib/ethos/foliage/svg.ex              # polygon/polyline -> SVG path projection
lib/mix/tasks/ethos.foliage.build.ex  # offline derivation, never runs in prod
priv/foliage/towns.json               # geometry + centroid + guide_slug + stages
priv/foliage/routes.json              # geometry + town list + DEEP url
priv/foliage/weeks.json               # week index, date ranges, labels
```

`Ethos.Foliage` is the only module the web layer talks to.

## 5. The derivation pipeline

`mix ethos.foliage.build` runs on a developer machine, writes `priv/foliage/*.json`,
and the output is committed. It is never invoked in production.

It requires a locally seeded database, because step 8 resolves town names to
published guide slugs by querying `guides` rather than by reading seed files —
the six code-seeded towns (Danbury, Middlebury, Southbury, Waterbury, Woodbury,
and Mansfield via Storrs) have no JSON file to read.

1. **Fetch town polygons.** Query `Connecticut_Towns_NoLabels/1` where
   `STATE_COD='CT'` and `COUNTY <> ' '`, `outSR=4326`. Dissolve multipart
   geometry on `TOWN`. Expect exactly 169 towns; fail otherwise.
2. **Simplify.** Douglas–Peucker to a tolerance that keeps each town visually
   distinct at 800px wide. Target under 250KB total for all 169.
3. **Sample points.** For each town, deterministic seeded rejection sampling to
   25 interior points. Deterministic so builds are reproducible.
4. **Fetch tiles.** For each of the nine week services, fetch the z=12 tiles
   covering the CT bounding box, cached to disk. Roughly 280 tiles per week,
   about 2,500 fetches once.
5. **Classify.** For each town × week, look up each sample point's pixel,
   match to the nearest ramp colour in RGB, reject matches beyond a distance
   threshold (this discards road, border, and label pixels), and take the modal
   stage. A town whose valid sample count falls below a floor fails the build
   rather than guessing.
6. **Bin to stages.** Five Ethos stage names over DEEP's continuous ramp:
   `green`, `turning`, `near_peak`, `peak`, `past_peak`.
7. **Derive peak week.** The first week holding the town's maximum
   non-`past_peak` stage, expressed as its date range. Not "the first `:peak`
   week" — see *Peak week, and why it is not the red band* below.
8. **Join routes.** For each of the seven routes, spatial-intersect the town
   layer, order the towns along the polyline, and resolve each to a published
   guide slug from the `guides` table.
9. **Validate, then write.** See §10.

### Peak week, and why it is not the red band

The first derivation defined a town's peak as its first `:peak` week and gated
the build on every town reaching one. Running it against the real tiles proved
that assumption false: **36 of the 169 towns never show `:peak` at all.**

The cause is in DEEP's data, not in the classification. Their map carries eight
real weeks plus a ninth blanket "Past Peak" fill that is a uniform statewide
layer rather than an observation. The shoreline and the south-west corner turn
late enough that the eight real weeks run out before those towns reach the red
band — Greenwich goes `near_peak` straight to `past_peak`, with no red between.

So peak week is defined as **the first week holding the town's maximum
non-`past_peak` stage**. For the 133 towns that do reach `:peak` this returns
exactly the first `:peak` week, so it is a strict generalisation rather than a
change of meaning. It reproduces all four of DEEP's published regional windows,
Greenwich included, and it never lands on week 9.

The honest consequence, and the pages must not obscure it: for those 36
late-turning towns the published window names **the week the town is most
advanced**, not a verified red peak. That is the strongest claim DEEP's data
supports for them.

The rejected alternative was widening the `:peak` colour band to absorb the
orange-red anchor. It passes the validation towns but still leaves 12 towns
with no peak week, and it means moving a bin boundary on a continuous ramp to
make a gate go green — precisely the fake precision this design exists to
avoid.

### Why offline

The site must not depend on a stale third-party service at request time, must
not need a key, and must not be able to change what it says without a commit.
Committing the output makes the dataset reviewable in a diff — which matters,
because it is the thing being represented as derived from a state agency.

## 6. Attribution

Every page carrying a number states, in the site's own voice and not in a
footnote:

> Derived from the Connecticut DEEP fall foliage map. DEEP's map is a
> climatological estimate last published in 2023; it describes a normal year,
> not this one. Stage names are ours.

Route pages additionally link the DEEP route URL. This is a claim about
provenance that must remain true; if the derivation changes, the sentence
changes with it.

## 7. Routes and pages

```
GET /foliage                 statewide map, week selector, county summary, 7 routes
GET /foliage/:route_slug     one of 7 route pages
GET /foliage/embed           self-contained iframe map with attribution link
```

Nine new URLs. Not 169.

**`/foliage`** — the SVG choropleth for the selected week, a week selector, the
current statewide field note, a county-by-county peak table, and cards for the
seven routes.

**`/foliage/:route_slug`** — the route drawn over the town map with only its
towns coloured; the towns in order with each one's estimated peak window and a
link to its Ethos guide; the route's own field note; a link to DEEP's page for
the route. These seven pages are the artifact: they say something no other site
can say, and they are what the outreach points at.

**Town-level content** attaches to the existing guide at `/g/:slug`. For any
published guide with `state_slug == "connecticut"` and `tier == "town-page"`,
render a foliage panel: estimated peak window, current stage, the route it sits
on if any, and a link to `/foliage`. Seasonal — rendered only between Sept 1 and
Nov 30 — so the guides are not permanently carrying an out-of-season block.

**Week selection without JavaScript.** The week is a query parameter —
`/foliage?week=5`, `/foliage/hartford-west?week=5` — and the selector is a row
of ordinary links. The server renders that week's fills. A small
progressive-enhancement script swaps `fill` attributes client-side to avoid the
round trip; with JS off, the links still work. This is the whole reason for the
SVG approach and it should not be traded away.

The parameter is validated to 1..9 and falls back to the week containing the
current date, or to week 1 outside the season. `/foliage` with no parameter is
the canonical URL; every `?week=` variant carries `<link rel="canonical">` back
to it, so the nine states of one page do not enter the index as nine pages.

## 8. Rendering

`Ethos.Foliage.Svg` projects WGS84 to a fixed-extent Web Mercator viewBox and
emits paths. No runtime projection library; the projection is about fifteen
lines and the extent never changes.

- 169 `<path>` elements with `fill` from the week's stage and a
  `data-town` attribute.
- 7 route `<path>` elements, hidden or highlighted per page.
- `<title>` inside each town path, so the map is readable by screen readers and
  gives a native hover tooltip with no JavaScript.
- Colours are Ethos's palette binned from DEEP's ramp, checked for contrast in
  both themes rather than copied from the raster.

The same renderer serves `/foliage`, the route pages, the embed, and — at a
different size — the OG card through the existing `vix` pipeline.

## 9. Field notes

```
foliage_notes
  id
  scope        :string   # "statewide" | "route" | "town"
  ref          :string   # nil | route_slug | town_slug
  published_on :date
  body         :text
  inserted_at, updated_at
```

Admin-authored under `/admin/foliage/notes` behind the existing
`:require_admin_user` pipeline. The most recent note for a scope renders on the
matching page with its date. A page with no note renders no note block — there
is no placeholder and no empty state.

The note is the only part of this that competitors cannot copy, and it is the
part that makes the pages worth revisiting.

## 10. Validation gates

The build fails rather than publishing something wrong. Consistent with the
existing gate culture in `Ethos.Seeds.Catalog` and the corpus tests.

Build-time:
- Exactly 169 towns, each with a non-empty simplified polygon.
- Every town's stage sequence is monotonic across the nine weeks — no town goes
  backwards from `peak` to `turning`.
- Every town has a usable peak week, in 1..8. Week 9 is the blanket past-peak
  layer and can never legitimately be a peak.
- The four DEEP-published regional windows are reproduced by the towns those
  regions contain. A mismatch means the sampling drifted and the build stops.
- Every route resolves to at least three towns, and every route town resolves to
  a published guide slug.
- Sample validity rate per town above a floor.

Boot-time, in `Dataset`:
- The JSON files parse, carry the expected counts, and every `guide_slug`
  referenced still exists in `guides`. A dangling slug logs loudly, consistent
  with the existing dangling-link logging.

Test suite:
- Renderer produces well-formed SVG with 169 paths for every week.
- `/foliage`, `/foliage/:route_slug`, and `/foliage/embed` return 200 and
  contain the attribution sentence.
- The week selector works with JavaScript disabled — assert on the rendered
  fills for `?week=1` versus `?week=5`.
- The guide panel appears for a CT town-page guide in season and is absent out
  of season and absent for a non-CT guide.
- Sitemap includes the nine URLs.
- The count of guide links on a route page equals its town count. (Guides link
  places; an empty list silently orphans the page while still returning 200.)

## 11. SEO surface

- Nine URLs in `sitemap.xml` with `lastmod` from the most recent field note.
  `?week=` variants are never listed; they canonicalise to their base URL.
- `/foliage` — `WebPage` plus `Dataset` structured data naming DEEP as source.
- `/foliage/:route_slug` — `TouristTrip` with an `itemListElement` per town,
  each pointing at the guide URL.
- Page links written through the existing `Ethos.Links` graph: each route page
  links its town guides with kind `same-region`, so the guides gain inbound
  links from the route pages through `ConnectedPages` without new plumbing.
- Homepage gets a single link. Not a widget, not a hero. The site remains a
  guide publisher whose homepage lists guides.

## 12. Distribution

`/foliage/embed` serves a self-contained page — inline SVG, inline CSS, no
script — sized for an iframe, ending in a followed link back to `/foliage`
reading "Connecticut Foliage Forecast · Ethos". A copy-paste snippet sits on
`/foliage`.

The outreach, which the design exists to enable:
1. CT DEEP forestry — lead with the derivation. "We resolved your published map
   to all 169 towns and joined it to a guide for each. Your 2023 tiles are the
   source and we say so. Is this useful to you, and would you like it to be
   accurate for 2026?" That last question is the one that could turn a scraped
   raster into a supplied dataset.
2. Connecticut Office of Tourism — the seven route pages plus whatever search
   data exists by then.
3. Town libraries and historical societies on the routes — a link to the page
   about the route through their town.

## 13. Build order

Roughly ten days of solo work; the pitch is the deadline, not October 10.

1. **Data.** Mix task, sampling, classification, validation gates, committed
   JSON. Nothing renders yet. This is the risky part and it goes first.
2. **Render.** `Svg`, `/foliage`, week selector working with JS off.
3. **Routes.** The seven route pages, guide joins, `Ethos.Links` edges.
4. **Integrate.** Guide panel, sitemap, structured data, OG card, homepage link.
5. **Distribute.** Field notes admin, `/foliage/embed`, snippet. Then send the
   DEEP email.

Phases 1–3 are the artifact. If the calendar tightens, 4 and 5 can slip a week
without invalidating the pitch; 1–3 cannot.

## 14. Decisions that constrain later tools

Flagged, not designed.

- **Trail maps (Antique Trail).** `Ethos.Foliage.Svg` is written against a fixed
  Connecticut extent. The Antique Trail is fifteen dealers on one street in
  Woodbury and needs a street-level basemap, which SVG-without-a-basemap cannot
  provide. **Do not generalise the SVG renderer into "the map layer."** It is a
  choropleth renderer for one state-sized extent. The trail map is a different
  tool and will likely want MapLibre with Protomaps. Keeping them separate now
  costs nothing; merging them now would produce an abstraction that serves
  neither.
- **The 90-minute planner.** Needs place-level coordinates that do not exist —
  `places` has no lat/lng column. The 169 town centroids this project produces
  are a genuine but small head start: they make a town-to-town drive-time matrix
  possible (169 × 169, precomputable, well under the size where a live routing
  API is justified) without solving place-level geocoding. **Store centroids as
  `lat`/`lng` floats in `towns.json` even though the foliage map does not use
  them** — that is the one piece of forward compatibility worth paying for, and
  it costs one line.
- **Do not add lat/lng to `places` as part of this work.** That is the planner's
  project and it needs its own decisions about geocoding source and accuracy.

## 15. Risks

- **Sampling drift.** JPEG artefacts and overlay pixels could bias a small
  town's mode. Mitigated by 25 points, a distance threshold, a validity floor,
  and the regional-window assertion. A town smaller than the sampling footprint
  is the realistic failure and the build will surface it.
- **DEEP takes the map down.** Does not affect the site — the data is committed.
  It would affect the attribution sentence, which would need rewording to past
  tense.
- **DEEP objects.** Low risk: public state-agency work, no licence asserted,
  their own town layer is CC0, and the use is derivative and attributed. If it
  happens, the honest response is to take it down, and the outreach in §12 is
  what makes that conversation unlikely to start adversarially.
- **The estimate is wrong for 2026.** It is a normal-year estimate and the page
  says so in the first paragraph. The field note is where reality gets recorded.

## 16. Open questions

- Exact ramp-to-stage bin boundaries. Determine empirically in phase 1 by
  clustering the observed colours, then check the five validation locations.
- Whether route towns order cleanly along each polyline, or whether some routes
  double back and need manual ordering. Seven routes; hand-check.
- Whether the guide panel needs county-level fallback for a town whose sampling
  failed. Defer until the build reports whether any town fails.
