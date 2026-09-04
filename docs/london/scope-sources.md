# London — Source Hierarchy Research (Angle 5)

Scoping-wave input for the London boroughs spec. **Evidence, not adjudication.** A later step decides.

Probe date: 2026-09-04. Every HTTP status below was observed by me in this environment with
`python3` + `urllib`, not assumed and not recalled. Probe script:
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/a5lonsrc_probe.py`.

---

## 0. Environment notes (read first)

**(a) Bash was unavailable for the first ~10 minutes** — the same
`claude-sonnet-5[1m] is temporarily unavailable, so auto mode cannot determine the safety of Bash`
failure the Rome Angle-4 agent hit for its entire session. It cleared on the fourth retry. Two
probes in that window went through WebFetch instead; both were later re-run through urllib and the
statuses agreed, so nothing in this document rests on a WebFetch summary. If a future wave finds
Bash down for the whole session, the Rome precedent applies: WebFetch reports statuses faithfully
but paraphrases bodies, and it corrupted a number by 100× in that wave. **Do not verify numeric
claims through WebFetch.**

**(b) WebSearch was never needed.** I worked entirely from URLs nameable in advance, as briefed. I
did not consume a search budget, so I cannot report whether one was exhausted. The one thing this
cost me is in §3: I could not discover the correct conservation-area URL for two borough sites by
search, so those are recorded as "path not found", not "not published".

**(c) Something else's stdout is leaking into my shell.** Every Bash call in this session, before
my own output, printed:

    places 42 entries 14
    unresolved entries []
    ...
    state/county California San Francisco | dest 'North Beach, California'
    done

That is a **San Francisco** seed check, not mine — I ran no such script and touched no seed file.
It is a hook or a sibling agent writing to the shared stream. It did not corrupt my results (my
probe output is separately framed), but a wave that parses Bash stdout programmatically will eat
those six lines. Flagging it because the isolation contract asked about exactly this class of
cross-agent bleed.

---

## 1. The headline: yes, London out-sources San Francisco — and it is not close

DataSF gave San Francisco one Socrata API over a city-scale catalogue, plus the National Register
as a PDF-and-HTML register with no query interface. London gives all of that **and** a national
statutory register exposed as a live, queryable, OGL-licensed geospatial API, **and** a transit API
that answers the exact question every previous programme failed to answer.

The single most important discovery: **the National Heritage List for England is a queryable
ArcGIS FeatureServer**, not a website to be scraped. It carries the list entry number and the grade
as first-class indexed fields — precisely the two things the spec's designation gate demands. Rome
had to ban designation claims outright because its registers refused the socket. London can *query*
its register and get back `{"ListEntry": 1217742, "Name": "Royal Albert Hall", "Grade": "I"}`.

That is the inversion of the Rome position, and it is stronger than the San Francisco position too.

---

## 2. Ranked hierarchy, with observed statuses

Ranked by what a verdict can safely cite, best first.

### TIER 1 — statutory, machine-readable, verified reachable

#### 1. Historic England NHLE via ArcGIS Feature Service — **200**

The find of this wave. Historic England's own website is Cloudflare-blocked, but its open-data
ArcGIS org is wide open.

| URL | Status |
|---|---|
| `https://historicengland.org.uk/listing/the-list/` | **403** (Cloudflare "Just a moment…" interstitial) |
| `https://historicengland.org.uk/listing/the-list/list-entry/1217742` | **403** (same, with a browser UA) |
| `https://opendata-historicengland.hub.arcgis.com/` | **200** |
| `https://services-eu1.arcgis.com/ZOdPfBS3aqqDYPUQ/arcgis/rest/services?f=json` | **200**, 250 feature services |
| `.../National_Heritage_List_for_England_NHLE_v02_VIEW/FeatureServer?f=json` | **200** |

VERIFIED — the NHLE FeatureServer exposes **eleven layers**:

    0  Listed Building points          6  Scheduled Monuments
    1  Building Preservation Notice    7  Parks and Gardens
    2  Certificate of Immunity         8  Battlefields
    3  Listed Building polygons        9  Protected Wreck Sites
    4  BPN polygons                   10  World Heritage Sites
    5  CoI polygons

Layer 0's field schema, read from the service, verbatim:

    ListEntry     Integer  alias "List Entry Number"
                  desc: "Unique reference number from the National Heritage List for England"
    Name          String   alias "List Entry Name"
    Grade         String   desc: "Grade of building; in descending order of importance: I, II*,II"
    ListDate      Date     desc: "Date on which the building was added to the Statutory List"
    AmendDate     Date     hyperlink String  alias "NHLE link"
    NGR, Easting, Northing, CaptureScale

Licence, quoted from the service's own `copyrightText`:

> © Crown Copyright 2026. Contains Ordnance Survey data © Crown copyright and database right 2026.
> Released under OGL.

**Counts I observed** (`returnCountOnly=true`): **379,682** listed-building points nationally;
**9,344** at Grade I.

**A live query, run and reproduced verbatim** —
`.../FeatureServer/0/query?where=Name LIKE '%ROYAL ALBERT HALL%'&outFields=ListEntry,Name,Grade,ListDate,hyperlink&f=json`:

    {"ListEntry": 1217742, "Name": "Royal Albert Hall", "Grade": "I",
     "ListDate": -374025600000,
     "hyperlink": "https://historicengland.org.uk/listing/the-list/list-entry/1217742"}

**What a verdict can cite it for:** the exact sentence the spec's gate wants — *"Grade I listed,
NHLE list entry 1217742."* The `hyperlink` field is the canonical human-facing citation URL, and it
is machine-generated by the register itself, so a verifier composing that URL by hand cannot
mistype it.

**Two traps, both verified:**

- **`ListDate` is epoch milliseconds, and often negative.** Royal Albert Hall's `-374025600000`
  is **1958-02-24**. `117936000000` (Tower Bridge Approach, NHLE 1065833, Grade I) is **1973-09-27**.
  An author who pastes the raw integer, or who feeds a negative number to a seconds-based
  converter, publishes a wrong year. The spec's GOOD example *"Listed Grade II\* in 1970"* puts a
  date in prose, so this is on the live path.
- **`Name LIKE '%TOWER BRIDGE%'` returns four rows and the famous one is not first.** It returns a
  moat revetment wall, `TOWER BRIDGE APPROACH`, another revetment, and `TOWER BRIDGE OVER RIPLEY
  BECK` — which is **in North Yorkshire**, not London. Name matching alone will attach a Yorkshire
  beck bridge to a Southwark page. Verdicts must constrain by geometry or Easting/Northing, not by
  name. This is a concrete false-positive mechanism, not a hypothetical.

#### 2. Transport for London unified API — **200**, no key required

Covered in full in §5. It is Tier 1 and it is the second-most consequential finding here.

#### 3. OpenStreetMap / Nominatim / Overpass — **200** across the board

| Probe | Status | Result |
|---|---|---|
| Nominatim search `London Borough of Southwark` | **200** | `osm_type: relation, osm_id: 8450265, addresstype: city_district`, bbox returned |
| Nominatim **reverse** `51.5045,-0.0865` | **200** | see below |
| Overpass `relation[boundary=administrative][admin_level=8]` | **200** | full tag set |

**Reverse geocoding returns the borough — CONFIRMED.** The reverse call on the Shard's coordinates
returned, verbatim:

    "city_district": "London Borough of Southwark",
    "ISO3166-2-lvl8": "GB-SWK",
    "suburb": "The Borough", "quarter": "Bermondsey Village",
    "city": "Greater London", "state": "England",
    "postcode": "SE1 9SG", "country_code": "gb"

Three things matter for the spec. The borough arrives in **`city_district`**, not `city` — `city`
is `"Greater London"`. `state` is `"England"`, which independently matches the spec's routing
decision in §"Routing and identity". And a **UK postcode comes back in its own field**, which is a
free cross-check on the `@uk` parser branch the spec is adding (Angle 4's territory, but the data
is here).

Overpass returned the borough relation with its GSS code:

    "ref:gss": "E09000028", "ons_code": "00BE", "ISO3166-2": "GB-SWK",
    "designation": "inner_london_borough", "wikidata": "Q730706",
    "website": "https://www.southwark.gov.uk/"

Licence on both: `Data © OpenStreetMap contributors, ODbL 1.0`.

**Caveat:** OSM is a volunteer aggregator. Per the corpus's existing practice it should be used for
*geometry and identifier crosswalks* — is this point inside this borough — and attributed rather
than stated for anything editorial.

### TIER 2 — official, machine-readable, but with a real defect

#### 4. data.london.gov.uk (the London Datastore) — **200, and it has a broken search API**

**This is the finding most likely to burn a research wave, so it leads.**

The Datastore presents a CKAN-compatible endpoint at `/api/action/package_search`. It returns
**200** and `application/json`. **It ignores the `q` parameter entirely.** VERIFIED by control:

| Query | Status | `result.count` | First result title |
|---|---|---|---|
| `?q=borough&rows=3` | 200 | **1295** | Archway Campus planning application documents |
| `?q=cultural+infrastructure&rows=4` | 200 | **1295** | Archway Campus planning application documents |
| `?q=listed+buildings&rows=4` | 200 | **1295** | Archway Campus planning application documents |
| `?q=conservation+area&rows=4` | 200 | **1295** | Archway Campus planning application documents |
| **`?q=zzzzqqxnonsense&rows=1`** | 200 | **1295** | Archway Campus planning application documents |
| `?q=title:cultural&fq=title:cultural` | 200 | **1295** | Archway Campus planning application documents |

Every query returns the entire catalogue in the same order. A nonsense string returns 1295 hits. An
agent that searches this API and reports "the Datastore has no listed-buildings dataset" will be
**wrong**, and it will be wrong with a 200 and well-formed JSON in hand — the exact shape of the
San Francisco transit failure the gate now bans. `resource_search` returns **410 Deprecated Route**
and names the replacement:

> `{"error":{"message":"Please use the new API endpoints at /api/v3/datasets/export.json and
> /api/v3/dataset/:id.","__type":"Deprecated Route"}}`

**The working method — VERIFIED.** `https://data.london.gov.uk/api/v3/datasets/export.json` returns
**200** and a JSON array of **all 1295 datasets** with `title`, `id`, `description`, `licence`,
`resources`, `topics`, `webpage`. **Fetch it once and filter locally.** Doing that, the catalogue
does carry what a guide needs:

| Filter | Hits | Examples found |
|---|---|---|
| `boundar` | 12 | **Statistical GIS Boundary Files for London** (`20od9`), Inner/Outer London Boundaries |
| `cultural` | 6 | **Cultural Infrastructure Map 2025** (`2rj5o`), 2024, 2023 |
| `conservation` | 2 | **Conservation Areas** (`emqwg`), Conservation Areas in the LB of Southwark |
| `listed` | 2 | Listed Buildings in LB Southwark (`2gq0r`), Southwark Council Local List |
| `open space` | 3 | **Designated Open Space** (`e195k`), Access to Public Open Space by Ward |
| `green` | 17 | London Green and Blue Cover, Green Infrastructure Focus Map |
| `tourism` | 7 | Tourism Trips Borough, London Tourism Forecasts |

So the answer to the brief's question — boundaries, cultural infrastructure, listed buildings,
parks — is **yes to all four**, but only via `export.json`.

**Licensing, counted over all 1295:** OGL v2 **476**, OGL v3 **395**, none stated **315**, CC-BY
**68**, All Rights Reserved **13**, ODC-BY 7, Public Domain 5, ODbL 5. Roughly **two-thirds
OGL**. Note `Cultural Infrastructure Map 2025` has `"licence": null` — an author must not assume
OGL from the portal alone.

**Downloads work.** I fetched the Conservation Areas resource end-to-end:
`https://data.london.gov.uk/download/emqwg/b38eae6d-10db-4c79-afdd-dd97ae367b8b/Conservation_Areas.gpkg`
→ **200**, `application/octet-stream`, **8,495,104 bytes**. Licence on that dataset is OGL v3.
`Statistical GIS Boundary Files for London` is OGL v2 and ships `statistical-gis-boundaries-london.zip`.

**Dead ends, for the record:** `api.london.gov.uk` **does not resolve** (`nodename nor servname
provided`) — there is no such host, do not cite it. `/api/datasets/` → **404**.
`/api/action/package_show?id=<name>` → **404** (it wants the short opaque id, e.g. `20od9`, not the
slug). `/api/v3/dataset/20od9.json` → **404**; I could not determine the correct single-dataset v3
path, and since `export.json` returns everything anyway, **I did not need to** — but I am recording
it as unestablished rather than claiming the endpoint is absent.

### TIER 3 — operator sites, for hours and tickets

Same role the operator sites already play in the corpus. **Six of eight reachable.**

| Site | Status |
|---|---|
| `tate.org.uk/visit/tate-modern` | **200** |
| `royalparks.org.uk/visit/parks/hyde-park` | **200** |
| `nationaltrust.org.uk/visit/london` | **200** |
| `english-heritage.org.uk/visit/places/eltham-palace-and-gardens/` | **200** |
| `nhm.ac.uk/visit.html` | **200** |
| `nationalgallery.org.uk/visiting` | **200** → redirects to `/visiting/plan-your-visit` |
| **`britishmuseum.org/visit`** | **403** — Cloudflare. Retried with a full browser UA + Accept headers: **still 403** |
| **`hrp.org.uk/tower-of-london/`** | **403** — same, browser UA did not help |

The brief asked for at least four; I checked eight. **The two 403s are the two that matter most.**
The British Museum is the marquee institution of Bloomsbury/Camden and Historic Royal Palaces is
the operator for the Tower of London, Hampton Court, Kensington Palace and the Banqueting House —
between them they cover marquee places in at least four boroughs, and the spec's assertion 14
("marquee institutions in exactly one file") is about exactly these.

**This is a finding, stated plainly: hours and admission for the British Museum and for every
Historic Royal Palaces site cannot be verified from this environment by direct fetch.** The
corpus's usual method fails on them. Options a later step must choose between: route those facts
through WebFetch (which renders JS and may pass the challenge, but paraphrases), source them from
the institutions' Wikipedia/Wikidata records with attribution, or write those pages without
hours. I am not adjudicating that — but a wave that assumes it can `curl` the British Museum will
lose time.

### TIER 4 — borough websites: **the weakest link, and the surprise of this wave**

The brief predicted these would be a solid tier. They are not. Spot-check of four, including the
two named and two outer boroughs:

| Borough | URL tried | Status |
|---|---|---|
| Westminster | `/planning-building-and-environmental-regulations/conservation-areas` | **404** |
| Westminster | `/planning/conservation-areas` | **404** |
| Westminster | `/conservation-areas` | **200**, but **redirects away** to `/planning-building-control-and-environmental-regulation` — a section index, not a conservation-area list |
| Southwark | `/planning-and-building-control/design-and-conservation/conservation-areas` | **202** |
| Southwark | `/` (root) | **202** |
| Hillingdon (outer) | `/conservation-areas` | **200** → redirects to `pre.hillingdon.gov.uk/conservation-heritage-assets/conservation-areas` |
| Bromley (outer) | `/conservation-areas` | **404** |

Two distinct problems. **Southwark returns HTTP 202 Accepted for every path including its
homepage** — that is a bot-mitigation holding response, not content; a naive `status == 200` check
fails it and a naive `status < 400` check passes it while receiving no data. **Westminster and
Bromley 404 on the obvious paths**, and without WebSearch I could not discover the real ones.

I want to be exact about what this does and does not show. It shows **I could not reach a
conservation-area list on three of four borough sites by URL guessing.** It does **not** show the
boroughs fail to publish them — Hillingdon plainly does, and the London Datastore separately
carries `Conservation Areas` London-wide (OGL v3, 8.5 MB, fetched) plus Southwark-specific listed
and conservation datasets. Borough-level dataset counts in the Datastore are thin, though:
Southwark 4, Camden 2, Hackney 2, Hillingdon 2, Barnet 2, Westminster 1, Croydon 1, Bromley 1.

**INFERRED (marked as inference):** 33 borough sites will have 33 different information
architectures, several behind bot mitigation, and a per-borough scrape is not a reliable plan.
**The GLA-level `Conservation Areas` dataset is the better route for conservation areas**, because
it is one OGL-licensed file covering all boroughs rather than 33 site structures. The spec already
anticipates conservation areas needing no national number; this gives them a single citable source.

### TIER 5 — aggregators, attributed not stated

#### 7. Wikidata — **200**, and it round-trips against the NHLE

Wikidata's NHLE property is **P1216** ("National Heritage List for England number"). VERIFIED:

- `Special:EntityData/Q188617.json` → **200**; Kew Gardens carries `P1216 = "1000102"` and
  `"1000830"` (two entries), plus `P625` coordinates and `P131`.
- SPARQL endpoint `query.wikidata.org/sparql` → **200**.
- **Global count of P1216 statements: 401,458.** Compare Historic England's own 379,682 listed
  points — the same order of magnitude, as expected, since P1216 also covers scheduled monuments,
  parks and gardens, and battlefields.
- **The round-trip works.** Querying Wikidata for `P1216 = "1217742"` — the number Historic England
  returned for the Royal Albert Hall — returns `Q193639`, label **"Royal Albert Hall"**. Two
  independent registers agree on the identifier. That is a genuine cross-check a verifier can run.
- Per-borough coverage via direct `P131`: Camden **1,982** items with P1216, Southwark **927**.
  (Direct `P131` only; transitive `P131*` traversal timed out into a much lower figure, so treat
  these as floors, not totals.)

**What it can be cited for:** as an aggregator, per existing corpus practice — attributed, not
stated. Its real value is as a **crosswalk and a verification oracle**: NHLE number ↔ Wikidata item
↔ coordinates ↔ Wikipedia article. A verifier can confirm an author's list entry number names the
building the author thinks it names, in one query.

#### 8. Wikipedia — not separately probed. Standard corpus treatment applies (attribute, never
state). Overpass returns `wikipedia: "en:London Borough of Southwark"` per borough, so the
article-to-borough mapping is available mechanically.

---

## 5. Transport for London — what London can do that no predecessor could

**`api.tfl.gov.uk` returned 200 on every endpoint I tried, with no API key.** The spec's framing is
right: this is the fix for the banned transit-negative pattern.

Recall the failure being prevented. San Francisco produced **fifteen** instances of *"No source
states a bus route or a rail station"*, false in every case, and it is now a banned regex in the
gate. The ban stops the sentence from publishing; it does not give the author the fact. **TfL
gives the author the fact.**

| Endpoint | Status | What it returns |
|---|---|---|
| `/StopPoint/Search/Southwark` | **200** | 10 matches, tube + bus, with ids and coordinates |
| `/StopPoint/940GZZLUSWK` | **200** | full stop detail (note: **fails with `?f=json` appended — 404**) |
| `/StopPoint?lat=&lon=&stopTypes=&radius=` | **200** | **geospatial nearest-stop query** |
| `/Line/Mode/tube/Route?f=json` | **200** | every tube line with named route sections |
| `/Line/jubilee/StopPoints` | **200** | every stop on a line |
| `/StopPoint/Mode/tube?page=1` | **200** | paginated full stop list |
| `/Line/Meta/Modes` | **200** | bus, cable-car, coach, cycle, tube, … with `isTflService` flags |
| **`/Place/Meta/PlaceTypes`** | **200** | includes **`Boroughs`**, `Wards`, `CentralActivityZone`, `BikePoint` |
| **`/Place/Type/Boroughs`** | **200** | **exactly 33 boroughs**, with lat/lon and ONS codes |

**The decisive capability.** For any place with coordinates, one call —

    https://api.tfl.gov.uk/StopPoint?lat=51.5081&lon=-0.1281&stopTypes=NaptanMetroStation,NaptanRailStation&radius=500

— returns **200** and, verbatim from the response, `"naptanId":"940GZZLUCHX"`, `"modes":["tube"]`,
`"stopType":"NaptanMetroStation"`, `"hubNaptanCode":"HUBCHX"`, and a `lines` array naming
`{"id":"bakerloo","name":"Bakerloo"}` and its siblings. And the reverse:
`/StopPoint/940GZZLUSWK` → **200**, `"modes":["tube"]`, `lines: [{"id":"jubilee","name":"Jubilee"}]`.

So an author can state, **with a citable API URL as the source**, that a given place is 500 m from
Charing Cross Underground Station, served by the Bakerloo line. Not hedged, not omitted, not the
banned negative sentence. **No previous Ethos programme could do this** — not Manhattan, not
Brooklyn, not the Bronx, not Queens, not Rome, and emphatically not San Francisco, where the
absence of exactly this capability produced fifteen false claims.

**One incidental corroboration relevant to Angle 1:** `/Place/Type/Boroughs` returns **exactly 33**
`commonName` values, and the set matches the spec's roster one-for-one, including `City of London`.
TfL's naming differs from the spec's slugs in three places — TfL says `Kingston` (spec:
Kingston upon Thames), `City of Westminster` (spec: Westminster), and `Richmond upon Thames`
(spec: richmond-upon-thames, agreeing). That the GLA list and TfL's independent operational
geography agree on the count and the membership is a real, if indirect, check on the roster.

**Traps, verified:** appending `?f=json` to `/StopPoint/{id}` produces a **404
`EntityNotFoundException`** while the bare path returns 200 — a verifier could easily conclude a
station does not exist. And TfL publishes a rate limit for unregistered use; a wave making
thousands of calls should register an app key even though none is needed for correctness.

---

## 6. Direct answers to the brief

**Does London out-source San Francisco?** **Yes, decisively, on every axis but one.** DataSF gave
one municipal Socrata catalogue plus a National Register with no query API. London gives a
**national statutory register as a live queryable geospatial API under OGL** with list entry number
and grade as indexed fields (SF had no equivalent — the National Register is documents), a **fully
open transit API** (SF had none that the wave used, and paid for it fifteen times), a **1,295-dataset
GLA catalogue** two-thirds OGL, and **OSM/Wikidata crosswalks** that round-trip against the
statutory register. The ranking across three jurisdictions is unambiguous:
**London > San Francisco > New York > Rome.**

**The one axis where London is worse than San Francisco:** the *municipal* tier. DataSF was a
single competent city portal. London's borough websites are 33 separate estates, and three of the
four I checked would not yield a conservation-area list — one 404, one redirecting to a section
index, one answering 202 to everything including its homepage. The GLA Datastore partly covers for
this, and its own search API is broken in a way that will produce false negatives if trusted.

**What TfL makes possible that no predecessor could:** state the actual nearest station, its
NaPTAN id, its mode, and the named lines serving it, for any place with coordinates, from a single
citable API call returning 200 — turning the corpus's worst recurring failure from a banned
sentence into a sourced fact.

---

## 7. Things I could not establish, stated plainly

1. **Hours and admission for the British Museum and Historic Royal Palaces sites** (Tower of
   London, Hampton Court, Kensington Palace, Banqueting House). Both hosts return **403** behind
   Cloudflare and a full browser user-agent did not defeat it. Not "hard" — **not possible by
   direct fetch from here.**
2. **The correct conservation-area URLs for Westminster and Bromley.** Both 404 on the obvious
   paths. Without WebSearch I could not discover the real ones. This is a gap in my method, not
   evidence the pages do not exist.
3. **The correct `/api/v3/dataset/:id` path shape** on the London Datastore. Both forms I tried
   404. Moot in practice because `export.json` returns the whole catalogue, but unestablished.
4. **Whether the Datastore's broken `q` parameter is a permanent design property or a transient
   regression.** I verified the behaviour six ways on one day. It could be fixed tomorrow. **A
   wave should re-run the nonsense-query control before relying on either the bug or its absence.**
5. **Historic England's `hyperlink` field points at a host that 403s us.** The URL is certainly
   correct and is the right thing to cite for a human reader — but a link-checking gate that fetches
   citation URLs will mark every NHLE citation broken. Whoever writes that gate needs to know.
