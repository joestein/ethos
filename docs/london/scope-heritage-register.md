# Scoping — The National Heritage List for England as a designation register

**Angle 2 of the London scoping wave.** Question: does the NHLE carry the evidential weight
DataSF + the National Register carried for San Francisco, such that a reviewer can re-fetch a
list entry number and catch a wrong grade or a wrong date?

**Answer, stated up front: yes, and by a clear margin.** The NHLE is the strongest designation
source any Ethos programme has had. It is better than DataSF in three respects — it is a single
national register rather than a city portal, every designation type shares one identifier space,
and there is a queryable open API returning the identifier, the name, the grade and the date of
listing in one call. The San Francisco rule (`designation claim must name its register and carry
an identifier`) transfers unchanged and can be tightened rather than loosened.

Two operational cautions, both real, both in section 1: the HTML site intermittently returns 403,
and the bulk API carries no borough field.

---

## 1. Reachability — observed status codes

All probes were made with python3 + urllib from this network on 2026-09-04, browser User-Agent,
default SSL context. Every code below was observed, not assumed.

### 1a. The HTML site — INTERMITTENT 403, succeeds on retry

`historicengland.org.uk` sits behind a WAF that rejects a fraction of requests with **HTTP 403 and
a zero-byte body**. This is not a block; it is throttling. The same URL that 403s returns 200 with
full content seconds later.

Measured, in order, same script, same UA:

| URL | First pass | Retry sequence (4s apart) | Final |
|---|---|---|---|
| `/listing/the-list/` | **403** | not retried | — |
| `/listing/the-list/list-entry/1066234` | **403** | not retried | — |
| `/listing/the-list/list-entry/1291494` | **403** | `[403, 200]` | **200**, 130,029 bytes |
| `/listing/the-list/results/?searchType=NHLE+Simple&search=Westminster+Abbey` | **403** | not retried | — |
| `/listing/the-list/data-downloads/` | **200** (117KB), later **403** | `[403, 200]` | **200**, 117,487 bytes |
| `/listing/what-is-designation/listed-buildings/` | **403** | `[403,403,403,403,200]` | **200**, 142,141 bytes |
| `/listing/what-is-designation/scheduled-monuments/` | **403** | `[403, 200]` | **200**, 140,164 bytes |
| `/listing/what-is-designation/registered-parks-and-gardens/` | **403** | `[200]` | **200**, 129,973 bytes |
| `/listing/what-is-designation/protected-wreck-sites/` | **200**, 142,611 bytes | — | **200** |
| `/advice/hpg/has/conservation-areas/` | **403** | not retried | — |

The 403 is **not** User-Agent dependent. `curl/8.4.0`, `python-urllib` and a Googlebot UA all
returned 403 on the same URL within the same second that a browser UA also returned 403.

**VERIFIED.** Worst case observed was 4 consecutive 403s before a 200. A retry loop of 6 attempts
with a 4-second gap recovered every page tried.

> **Instruction for research and verification agents:** treat a single 403 from
> `historicengland.org.uk` as a transient failure, NOT as "unreachable" and NOT as "entry does not
> exist". Retry at least 5 times with a few seconds between attempts. A finder that reports "NHLE
> unreachable" after one 403 has reported a false negative. **Prefer the API in section 3, which
> did not 403 once across every call made during this scoping.**

### 1b. The open-data API — 200 on every call, no throttling observed

| URL | Status |
|---|---|
| `https://services-eu1.arcgis.com/ZOdPfBS3aqqDYPUQ/arcgis/rest/services?f=json` | **200**, 44,758 bytes, 250 services |
| `.../National_Heritage_List_for_England_NHLE_v02_VIEW/FeatureServer?f=json` | **200**, 5,037 bytes |
| `.../Conservation_Areas/FeatureServer?f=json` | **200**, 6,873 bytes |
| `https://opendata-historicengland.hub.arcgis.com/` | **200**, 63,434 bytes |
| `https://opendata-historicengland.hub.arcgis.com/api/feed/dcat-us/1.1.json` | **200**, 465,311 bytes |
| `https://opendata-historicengland.hub.arcgis.com/api/download/v1/items/8836370be44f4916b9ba7d350df24902/csv?layers=0` | **200**, 992,136 bytes |
| `https://services.historicengland.org.uk/hosted/rest/services?f=json` | **404** (no such host path — not a dead register) |
| `https://opendata-historicengland.hub.arcgis.com/datasets/historicengland::national-heritage-list-for-england-nhle.geojson` | **500** (whole-layer GeoJSON one-shot fails; the paged `/query?f=geojson` form works — see §3) |

Dozens of `/query` calls were made against the FeatureServer during this scoping. **Not one
returned anything but 200.**

---

## 2. The identifier — "List Entry Number", seven digits

### Format

Every entry on the National Heritage List for England carries a **List Entry Number**: a
**seven-digit integer**, no prefix, no check digit, no letters. Historic England's own field label
on the entry page is literally `List Entry Number:`. In the API the field is `ListEntry`, typed
`esriFieldTypeInteger`.

The canonical permalink is:

    https://historicengland.org.uk/listing/the-list/list-entry/{ListEntry}

This URL is also carried as a `hyperlink` attribute on every feature in the API, so it is Historic
England's own construction, not one inferred here. **VERIFIED** — the value returned by the API
for Westminster Abbey is exactly `https://historicengland.org.uk/listing/the-list/list-entry/1291494`.

**Crucial structural fact, and it simplifies the gate:** ALL designation types share ONE identifier
space. Listed buildings, scheduled monuments, registered parks and gardens, registered
battlefields, protected wreck sites and World Heritage Sites all draw a List Entry Number from the
same series, and all resolve at the same `/list-entry/{n}` URL. There is no separate scheduled-
monument numbering scheme to learn. **VERIFIED** by fetching examples from six different API
layers, all returning seven-digit `ListEntry` values in overlapping ranges.

### Ranges observed (INFERRED from the sample, not a documented rule)

Listed-building numbers observed run roughly 1,0xx,xxx – 1,4xx,xxx. Scheduled monuments, parks,
battlefields and wrecks observed cluster in 1,00x,xxx. Do not gate on the range; gate on the
seven-digit shape.

### The three worked examples requested

All three fetched live from the API on 2026-09-04, then confirmed independently against the HTML
entry page where retrieval succeeded.

**GRADE I — Westminster Abbey (City of Westminster)**

| Field | Value |
|---|---|
| List Entry Number | **1291494** |
| List Entry Name | `Westminster Abbey (The Collegiate Church of St Peter)` |
| Grade | **I** |
| Date first listed | **24 February 1958** |
| Heritage Category | Listed Building |
| Statutory Address | `20, Dean's Yard, Westminster, London, SW1P 3PA` |
| County / District | `Greater London Authority` / `City of Westminster (London Borough)` |
| NGR | `TQ 30082 79490` |
| URL | https://historicengland.org.uk/listing/the-list/list-entry/1291494 |

Double-verified. The API returned `Grade "I"`, `ListDate` epoch-ms decoding to `1958-02-24`. The
HTML page independently reads, verbatim:

> `Heritage Category: Listed Building  Grade: I  List Entry Number: 1291494  Date first listed: 24-Feb-1958  List Entry Name: Westminster Abbey (The Collegiate Church of St Peter)  Statutory Address: 20, Dean's Yard, Westminster, London, SW1P 3PA`

**GRADE II* — Battersea Power Station (Wandsworth)**

| Field | Value |
|---|---|
| List Entry Number | **1357620** |
| List Entry Name | `BATTERSEA POWER STATION` |
| Grade | **II\*** |
| Date first listed | **14 October 1980** |
| URL | https://historicengland.org.uk/listing/the-list/list-entry/1357620 |

API-verified. Note the name is upper-case in the register; that is how older entries were
captured and it is NOT an error. Agents must not "correct" a register name into title case inside
a quoted citation.

**GRADE II — Abbey Road Studios (Westminster)**

| Field | Value |
|---|---|
| List Entry Number | **1393688** |
| List Entry Name | `Abbey Road Studios` |
| Grade | **II** |
| Date first listed | **23 February 2010** |
| URL | https://historicengland.org.uk/listing/the-list/list-entry/1393688 |

API-verified.

### A trap the gate should know about

A single site frequently has MANY list entries, at different grades, and a name search returns
the furniture alongside the building:

- `1242062` — Tower of London (inner curtain wall, New Armouries, King's House, Tower Green) — **Grade I**, listed 1989-11-30
- `1065834` — 8 BOLLARDS (ON PAVEMENT OUTSIDE MAIN ENTRANCE TO TOWER OF LONDON) — **Grade II**, listed 1973-09-27
- `1393921` / `1393922` — HM TOWER OF LONDON LIBERTY BOUNDARY MARKERS — **Grade II**, listed 2010-08-18

and for the Royal Albert Hall:

- `1217742` — Royal Albert Hall — **Grade I**, listed 1958-02-24
- `1221258`, `1275248`, `1275269` — three separate LAMP STANDARDs around it — **Grade II**, listed 1987-12-01

**This is the single most likely way a London page acquires a wrong fact.** An agent searching
"Royal Albert Hall" and taking the first row gets a lamp post at Grade II. An arbitrator or
fact-fidelity reviewer must confirm that the `ListEntry` cited belongs to the BUILDING named in
the prose, not to bollards, lamp standards, boundary markers, railings, gates or telephone kiosks
in its curtilage. Recommend the verifier re-fetch each cited number and compare `Name` against
the place, exactly as the San Francisco reviewers re-fetched 58 landmark numbers.

Second trap, verified: **not everything famous is listed under its famous name.** Queries for
`Tate Modern`, `Bankside Power Station` and `The Old Royal Naval College` each returned **zero
listed-building rows** (HTTP 200, `features: []` — a real empty result, not an error). Bankside
appears not to be in the listed-building point layer under that name at all; Greenwich's naval
buildings surface instead in the **scheduled monuments** layer as `Greenwich Hospital (RN College)`,
entry `1002037`. "I searched and found nothing" must mean "no claim", never "claim it anyway".

---

## 3. Bulk data — yes, and it is better than dataset 97yj-54sx

Historic England's data-downloads page states, verbatim:

> "Historic England publishes open data via its Open Data Hub where you will find the following
> resources. Download data from the National Heritage List for England (NHLE) through the Open
> Data Hub. This includes a range of formats and APIs. **GIS spatial data is published by Historic
> England and is available free under the Open Government Licence.**"

Licence, verbatim from the FeatureServer's own `copyrightText`:

> `© Crown Copyright 2026. Contains Ordnance Survey data © Crown copyright and database right 2026. Released under OGL.`

**OGL is attribution-only and permits commercial use.** This is a materially better licence
position than most heritage registers, and it means the corpus may quote register names, grades,
numbers and dates freely with attribution.

### The service

    https://services-eu1.arcgis.com/ZOdPfBS3aqqDYPUQ/arcgis/rest/services
      /National_Heritage_List_for_England_NHLE_v02_VIEW/FeatureServer

Eleven layers, ALL confirmed present via `?f=json`:

| Layer | Name | Geometry |
|---|---|---|
| **0** | **Listed Building points** | multipoint |
| 1 | Building Preservation Notice points | multipoint |
| 2 | Certificate of Immunity points | multipoint |
| 3 | Listed Building polygons | polygon |
| 4 | Building Preservation Notices polygons | polygon |
| 5 | Certificate of Immunity polygons | polygon |
| **6** | **Scheduled Monuments** | polygon |
| **7** | **Parks and Gardens** | polygon |
| **8** | **Battlefields** | polygon |
| **9** | **Protected Wreck Sites** | polygon |
| **10** | **World Heritage Sites** | polygon |

Layer 0 fields, read off the service:

    OBJECTID(OID)  ListEntry(Integer)  Name(String)  Grade(String)
    ListDate(Date)  AmendDate(Date)  CaptureScale(String)  hyperlink(String)
    NGR(String)  Easting(Double)  Northing(Double)

`maxRecordCount` is **2000** per page; `resultOffset` paginates.

### It is fetchable, demonstrated not asserted

A single call returned **every Grade I listed building in a Greater London bounding box as
GeoJSON**:

    GET .../FeatureServer/0/query
        ?where=Grade%3D%27I%27
        &geometry=-0.51,51.28,0.334,51.69
        &geometryType=esriGeometryEnvelope&inSR=4326
        &spatialRel=esriSpatialRelIntersects
        &outFields=ListEntry,Name,Grade,ListDate
        &f=geojson&resultRecordCount=2000

→ **HTTP 200, 151,891 bytes, `FeatureCollection` with 686 features.** Sample property bag:
`{"ListEntry": 1028641, "Name": "CHURCH OF ST NICHOLAS", "Grade": "I", "ListDate": -578102400000}`.

`f=json`, `f=geojson`, `returnCountOnly=true` and `where` filters all work. **This is the direct
analogue of DataSF's Socrata endpoint, and it is a superset of it** — a research agent can pull
its borough's Grade I and II\* buildings up front and author from a local file instead of hitting
the throttled website per building.

A CSV export endpoint also works: `/api/download/v1/items/8836370be44f4916b9ba7d350df24902/csv?layers=0`
returned **HTTP 200, 992,136 bytes**.

`ListDate` is **epoch milliseconds**, and can be negative for pre-1970 listings
(`-578102400000` = 1951-08-09). An agent that reads it as seconds will publish dates in 1970.
Flagging this because it is a silent, plausible-looking corruption.

### The one real gap: NO BOROUGH FIELD

**This is the most important limitation in this document and I want it unhedged.** The NHLE
listed-building layers carry **no borough, district, county or postcode attribute** — only
`Easting`/`Northing`/`NGR`. Borough attribution must come from one of:

1. a **spatial query** against a borough boundary polygon (the API supports `geometry` +
   `esriSpatialRelIntersects` with an arbitrary polygon, so this works — but it needs the GLA
   boundary file that Angle 1 of this wave is establishing);
2. the **HTML entry page**, which DOES carry it — Westminster Abbey's reads
   `County: Greater London Authority  District: City of Westminster (London Borough)` — at the
   cost of one throttled fetch per building;
3. the `Statutory Address` on the HTML page, which carries the postcode.

The bounding box used above (`-0.51,51.28` → `0.334,51.69`) is a rectangle, **not** the GLA
boundary. It demonstrably overspills: a conservation-area query with the same box returned
`Old Brickett Wood`, LPA `St. Albans`, which is Hertfordshire. **Counts derived from that box are
approximate and must not be published as borough facts.** They are given below only to size the
corpus.

---

## 4. Grades — precise meanings and real proportions

Historic England's own wording, quoted verbatim from
`https://historicengland.org.uk/listing/what-is-designation/listed-buildings/` (fetched HTTP 200
after 4 retries):

> "Buildings can be listed at Grade II, II\* or I.
> **Grade I** buildings are of **exceptional interest**. Only around **2.5%** of listed buildings are Grade I.
> **Grade II\*** buildings are **particularly important buildings of more than special interest**. Around **5.8%** of listed buildings are Grade II\*.
> **Grade II** buildings are of **special interest**. Around **91.7%** of all listed buildings are in this class and it is the most likely grade of listing for a homeowner."

### National counts, measured rather than quoted

I did not take the percentages on trust. `returnCountOnly=true` against layer 0:

| Grade | National count | Share |
|---|---|---|
| I | **9,344** | 2.5% |
| II* | **22,123** | 5.8% |
| II | **348,215** | 91.7% |
| **All** | **379,682** | 100% |

**The measured shares reproduce Historic England's published percentages to the stated precision.**
Two independent methods agreeing is the strongest single piece of evidence in this document that
the API view is the real register and not a stale or partial extract.

(Note: 379,682 is the count of rows in the **point** layer, which is roughly "list entries", not
"buildings" — a single entry can cover a terrace of thirty houses. The commonly cited figure of
"around 400,000 listed buildings" refers to entries; the true building count is higher. An agent
should say "listed **entries**" or just avoid the aggregate.)

### Greater-London-bbox counts (APPROXIMATE — see §3 caveat)

| Grade | Count in bbox |
|---|---|
| I | 686 |
| II* | 1,679 |
| II | 21,577 |

### What a research agent must NOT overstate

**Grade II is the ordinary case.** It covers 91.7% of the register and 348,215 entries nationally.
It is emphatically not a mark of distinction — Historic England itself frames it as "the most
likely grade of listing for a homeowner". Prose such as "the prestigious Grade II listing" or
"one of the few protected buildings on the street" is factually wrong in most London high streets,
where entire terraces are listed. Recommend this be handled by the **existing superlative ban**
rather than a new one: the ban already catches "prestigious", "one of the few", "rare".

Grade I at 9,344 nationally IS genuinely exceptional and prose may say so — but the claim still
needs its number.

### Grade is meaningful ONLY for some designation types

- Listed buildings — graded I / II\* / II. **VERIFIED.**
- Registered parks and gardens — graded I / II\* / II. Historic England, verbatim: *"Like listed buildings, registered parks and gardens can be registered at Grade I, II, II\*."* The API confirms it: layer 7 has a `Grade` field, and `HYDE PARK` (1000814) and `ROYAL BOTANIC GARDENS, KEW` (1000830) both return **Grade I**, registered 1987-10-01.
- Scheduled monuments — **NOT GRADED.** Layer 6 has NO `Grade` field at all. **VERIFIED** from the schema.
- Battlefields (layer 8), protected wreck sites (layer 9), World Heritage Sites (layer 10) — **NOT GRADED.** No `Grade` field on any of them. **VERIFIED.**

> "Grade I scheduled monument" is a category error and should be treated as a hard failure, not a
> style note. Same for "Grade II battlefield" and "Grade I protected wreck".

---

## 5. The other designations, and how each is identified

All are on the NHLE and all carry a seven-digit List Entry Number resolving at the same URL. Each
has its OWN date field with its OWN name — the distinction matters, because a scheduled monument
is not "listed" and a park is not "listed" either.

| Designation | API layer | Date field | Graded? | Verified example |
|---|---|---|---|---|
| **Listed building** | 0 / 3 | `ListDate` — *"Date first listed"* | I / II\* / II | 1291494 Westminster Abbey, Grade I, listed 1958-02-24 |
| **Scheduled monument** | 6 | `SchedDate` | **no** | **1002061** `Tower of London`; **1021439** `Romano-Celtic temple in Greenwich Park`, scheduled 2009-12-01; **1002036** `Royal Observatory Greenwich`; **1002037** `Greenwich Hospital (RN College)` |
| **Registered park or garden** | 7 | `RegDate` | I / II\* / II | **1000814** `HYDE PARK`, Grade I, registered 1987-10-01; **1000830** `ROYAL BOTANIC GARDENS, KEW`, Grade I, registered 1987-10-01 |
| **Registered battlefield** | 8 | `RegDate` | **no** | layer confirmed present; no London example sought |
| **Protected wreck site** | 9 | `DesigDate` | **no** | **1000043** `HMS/m A1`, designated 1998-11-04; **1000044** `YARMOUTH ROADS`, 1984-04-09 |
| **World Heritage Site** | 10 | `InscrDate` — inscribed, by UNESCO | **no** | layer confirmed present |
| Building Preservation Notice | 1 / 4 | — | — | temporary protection, not a designation to cite |
| Certificate of Immunity | 2 / 5 | — | — | the OPPOSITE of a designation — a guarantee the building will NOT be listed for 5 years. Never cite as heritage status. |

Correct verbs, and they are not interchangeable: a building is **listed**; a monument is
**scheduled**; a park or battlefield is **registered**; a wreck is **designated**; a World Heritage
Site is **inscribed**.

Scheduled-monument volume, from Historic England verbatim:

> "There are almost 20,000 entries for scheduled monuments on the National Heritage List for
> England (NHLE). Some entries on the NHLE cover multiple monuments with a relationship to each
> other, so the exact number is likely to be much higher."

Registered parks and gardens, verbatim:

> "There are over 1,700 entries for registered parks and gardens on the National Heritage List for England."

Scheduling definition, verbatim:

> "'Scheduling' is the selection of nationally important archaeological sites... monuments are added
> to the Schedule if the Secretary of State considers that they are of national importance."

**A worked example of why this section exists.** The Old Royal Naval College at Greenwich returned
**zero** rows as a listed building under that name, but appears as scheduled monument **1002037**
`Greenwich Hospital (RN College)`. A page that wrote "Grade I listed, NHLE 1002037" would carry a
correct number attached to the wrong designation type and a grade that does not exist for it. The
gate should assert type-consistency, not merely the presence of a number.

---

## 6. Conservation areas — a national layer EXISTS, and this changes the spec

The spec (§ "Designation claims publish with a citation") says conservation areas "are
borough-designated and carry no national number; they may be named as conservation areas without
one". **The first half is right. The second half is right as a floor but understates what is
available, and I recommend the spec be revised.**

### What exists

    https://services-eu1.arcgis.com/ZOdPfBS3aqqDYPUQ/arcgis/rest/services
      /Conservation_Areas/FeatureServer/0

Service description, verbatim:

> "Conservation Areas in England as designated by Local Planning Authorities and compiled by
> Historic England"

Copyright, verbatim:

> `© Historic England and Local Planning Authorities 2026. Contains Ordnance Survey data © Crown copyright and database right 2026. Released under OGL.`

Fields: `OBJECTID, UID, NAME, DATE_OF_DE, DATE_UPDAT, LPA, CAPTURE_SC, x, y, Shape__Area, Shape__Length`

**National count: 8,221.** **London-bbox count: 946** (approximate — the bbox overspills, see §3).

### It has an LPA field, so borough filtering is EXACT here

Unlike the listed-buildings layer, the conservation-areas layer carries the local planning
authority by name. `where=LPA='Southwark'` returns **HTTP 200 and 48 rows**, e.g.:

| UID | NAME | DATE_OF_DE | LPA |
|---|---|---|---|
| 7143 | Bear Gardens | 22/04/1999 | Southwark |
| 7139 | Thrale Street | 23/03/1988 | Southwark |
| 7145 | Union Street | 11/05/2000 | Southwark |
| 7052 | Trinity Church Square | 27/09/1968 | Southwark |
| 7142 | Tooley Street North and South | 06/1988 | Southwark |

and `LPA='Camden'` returns entries including `Denmark Street` (UID 308, designated 01/03/1984,
`DATE_UPDAT: 01/07/1998 extended`) and `Elsworthy` (UID 280, designated 01/10/1973).

### Findings and a recommendation for the arbitrator

1. **The spec's claim "no national number" is CORRECT in substance.** `UID` is an internal
   identifier in Historic England's compilation. It is **not** an NHLE list entry number, it is
   **not** seven digits (values seen: 280, 308, 5075, 7052, 7139–7145), and it does **not** resolve
   at `/list-entry/{n}`. It must never be cited as an NHLE number. **The spec is right that a
   conservation area may be named without a number, and the gate's citation pattern should keep
   accommodating that.**
2. **But a conservation area claim can now be VERIFIED even without a citable number**, which the
   spec does not currently anticipate. A verifier can confirm that "the Bear Gardens conservation
   area in Southwark" exists by querying `LPA='Southwark'` and matching `NAME`. Recommend the
   verification brief require this, so that conservation-area names are checked against the
   register rather than accepted on the finder's word.
3. **`DATE_OF_DE` is a genuinely citable designation date**, and it is inconsistently formatted —
   `22/04/1999` but also `06/1988` (month and year only). It is a **string**, DD/MM/YYYY, not a
   date type. An agent reading `06/1988` as a day-month will produce nonsense, and an American
   reading of `22/04/1999` gives an impossible month. If designation dates for conservation areas
   are to be published at all, recommend they be restricted to entries where `DATE_OF_DE` has a
   full unambiguous DD/MM/YYYY form. My inclination, offered to the arbitrator rather than decided
   here: **name conservation areas, do not date them.** The naming is the useful fact; the date
   carries format risk for no reader benefit.
4. `DATE_UPDAT` carries free text such as `"01/07/1998 extended"` and `"none"`. Not machine-safe.
   Do not publish it.

Historic England's own conservation-areas guidance page (`/advice/hpg/has/conservation-areas/`)
returned **403** and was not retried; the statutory definition of a conservation area is therefore
**NOT ESTABLISHED HERE** from a primary source. I could not confirm the Planning (Listed Buildings
and Conservation Areas) Act 1990 wording. If the photo or prose rule needs it, someone should
re-fetch with retries.

---

## 7. Blue plaques — a commemorative scheme, NOT a designation

### What was established

English Heritage's own wording, verbatim from
`https://www.english-heritage.org.uk/visit/blue-plaques/` (**HTTP 200**, 122,447 bytes):

> "London's famous blue plaques link the people of the past with the buildings of the present. Now
> run by English Heritage, the London blue plaques scheme was started in **1866** and is thought to
> be the oldest of its kind in the world. **More than 1,000 plaques** across the capital, on
> buildings humble and grand, honour the notable women and men who have lived or worked in them."

And from `/visit/blue-plaques/about-blue-plaques/` (**HTTP 200**, 89,878 bytes), verbatim:

> "London's blue plaques scheme, run by English Heritage, celebrates the links between notable
> figures of the past and the buildings in which they lived and worked. Founded in 1866, it has
> inspired many similar schemes in the UK and around the world."
>
> "English Heritage has run the London blue plaques scheme **since 1986**..."

### The answer to the question asked

**A blue plaque is a commemorative marker, not a designation. It confers no statutory protection
whatsoever, and it has no list entry number.** Nothing on either English Heritage page describes
it as protection, and the scheme is administered by English Heritage (the charity), which is a
different body from Historic England (the public body that maintains the NHLE). The two split in
2015; conflating them is easy and would be an error.

**Recommendation:** a London page MAY mention a blue plaque, but the gate must NOT let it satisfy,
or be phrased as, a designation claim.

    GOOD: "An English Heritage blue plaque on the house marks Jimi Hendrix's residence."
    GOOD: "A blue plaque commemorates George Orwell."
    BAD:  "Blue plaque listed."
    BAD:  "Protected by an English Heritage blue plaque."
    BAD:  "Designated with a blue plaque in 1975."

If the seven prose bans are being extended, the cheapest form is a regex that fires on
`blue plaque` within a short window of `listed|designat|protect|Grade`.

**A caution I want on the record:** blue plaques are exactly the kind of fact an agent will assert
from training data, because they are memorable and widely written about. Unlike a list entry
number, **there is no verifiable identifier for a reviewer to re-fetch.**

### What I could NOT establish

- **No machine-readable blue plaque dataset was found.** `.../blue-plaques/blue-plaques.json`
  returned **HTTP 200 but served a 404 HTML page** (3,177 bytes beginning `<!doctype html>` with
  `<link href="/404.css">`) — a soft 404. `/visit/blue-plaques/search-blue-plaques/` likewise
  returned **200 with the same 3,177-byte 404 shell**, so that is not the search URL.
  openplaques.org **failed SSL certificate verification** (`CERTIFICATE_VERIFY_FAILED`) and I did
  not disable verification to work around it.
- I did not locate a per-plaque permalink format. **Plainly: I could not establish a way for a
  reviewer to mechanically verify a blue plaque claim.** That asymmetry — plaques are highly
  assertable and not verifiable — is the reason for the recommendation above.
- Historic England separately runs a **National Blue Plaque Scheme** (visible in its site
  navigation: "National Blue Plaque Scheme / About the Scheme / The National Blue Plaques Panel /
  How to Make a Nomination"). This is distinct from English Heritage's London scheme. I did not
  fetch its pages. Not relevant to London pages, but worth knowing before an agent conflates them.

---

## 8. Verdict, and what I recommend for the gate

### Verdict

**The NHLE carries the evidential weight DataSF carried for San Francisco, and more of it.** The
San Francisco standard was: a reviewer can re-fetch a cited number against the live register and
catch a wrong certification date. Here that is not only possible, it is cheaper — a single API
call returns identifier, name, grade and date for every listed building in a borough, with no
throttling, at HTTP 200, under an attribution-only open licence, in a machine-readable format,
from one national register that covers all six designation types.

The register is not merely reachable. It is **cross-checkable**: the measured grade proportions
(2.5% / 5.8% / 91.7%) reproduce Historic England's independently published figures exactly.

**The spec's designation rule should stand as written, and can be tightened.** The three risks are
not reachability. They are (a) citing curtilage furniture instead of the building, (b) attaching a
grade to a designation type that has none, and (c) borough attribution, which the NHLE does not
supply and which must come from a spatial join or the per-entry HTML page.

### Recommended additions to gate assertion 12

Offered as evidence to the arbitrator, not as a ruling:

1. **List entry numbers are exactly seven digits.** `\b\d{7}\b`. Cheap, and catches transcription
   slips.
2. **Grade may be cited only for listed buildings and registered parks/gardens.** "Grade I
   scheduled monument" is a category error.
3. **Register-specific verbs**: listed / scheduled / registered / designated / inscribed. The
   existing status-agrees-with-prose ban is the natural home.
4. **Blue plaques may not satisfy a designation claim** — regex on `blue plaque` near
   `listed|designat|protect|Grade`.
5. **Conservation areas may be named without a number, as the spec already says** — and their
   `UID` must never be published as an NHLE number.
6. **Certificate of Immunity must never be cited as heritage status.** It is the opposite of one.
7. **`ListDate` is epoch MILLISECONDS and may be negative.** A scaffolding-time note, not a gate
   assertion, but it will silently corrupt every pre-1970 listing date if got wrong.

### Recommended addition to the verification brief

Every cited `ListEntry` should be re-fetched from
`.../National_Heritage_List_for_England_NHLE_v02_VIEW/FeatureServer/{layer}/query?where=ListEntry={n}`
and its `Name` compared against the place named in the prose. This is what caught San Francisco's
wrong certification date. It is one HTTP call per claim and it does not 403.

---

## 9. Method, and what bit

- All fetches: `python3` + `urllib.request`, browser User-Agent, default SSL context, from this
  network on 2026-09-04. Scripts under `.../scratchpad/a2_*.py` and `nhle_probe_angle2.py`
  (uniquely prefixed to avoid the sibling-agent collision the brief warns about).
- **The WebSearch budget was NOT the constraint** — but no WebSearch was used. Every URL here was
  either named in advance, or discovered by walking Historic England's own `/data-downloads/` page
  and the ArcGIS service directory. The ArcGIS organisation id `ZOdPfBS3aqqDYPUQ` was tried
  speculatively and confirmed as Historic England's by its 250-service listing and by the
  `/data-downloads/` page linking to the same Open Data Hub.
- **What bit: the intermittent 403.** My first three probes all 403'd and I nearly recorded the
  NHLE as unreachable, which would have inverted this document's conclusion and pushed London
  toward Rome's blanket ban. It took a retry loop to establish the truth. **Any agent that reports
  "NHLE unreachable" on a single 403 is reporting a false negative — see §1a.**
- Two verification methods were used wherever it was cheap: API vs HTML entry page for Westminster
  Abbey; measured counts vs published percentages for the grades. Both agreed.
- Unresolved, stated plainly: (a) the statutory definition of a conservation area, from a primary
  source — the guidance page 403'd and was not retried; (b) any machine-readable blue plaque
  dataset or per-plaque permalink; (c) exact per-borough counts, which need Angle 1's GLA boundary
  file before the bbox figures here can be replaced with real ones.
