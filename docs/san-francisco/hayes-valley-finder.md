# Hayes Valley — Finder's Research File

Zone: `hayes-valley` · destination `Hayes Valley, California` · town `San Francisco`
Roster draw: "Patricia's Green, the War Memorial Opera House and Davies Symphony Hall edge,
Hayes Street shops, the Proxy project."

Compiled 2026-09-03. Everything below is candidate material for a verifier and an arbitrator.
Nothing here is an ownership ruling.

---

## 0. TOOLING DEFECT FOUND FIRST — read this before trusting a reservation check

**`.superpowers/taken_slugs.py` does not do what the brief says it does.** The brief states it
"reads the shipped files" and covers "nearly 4,000 places already committed across Connecticut,
New York and Rome." It does not. Its only glob is:

    glob.glob("priv/seed_data/rome/*.json")

It reports **1,279 places across 31 Rome files** and is blind to `connecticut/` (169 files),
`brooklyn/`, `bronx/`, `queens/`, `manhattan/` and `destinations/`. Scanning every seed file
recursively gives **3,921 places in 333 files**, which is the "nearly 4,000" the brief describes.

It is also blind to the Oracle Park live code seed, which is not JSON at all — those seven
places live in `lib/ethos/seeds/oracle_park_places.ex`. So the one reservation check the brief
tells every finder to run **cannot** see the seven slugs the brief simultaneously warns are taken.

I did the reservation check a second way instead: a recursive scan of all of `priv/seed_data/`
plus the seven slugs read out of `oracle_park_places.ex`. Script kept at
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/collide.py`.

**Recommendation to the arbitrator:** fix the glob to `priv/seed_data/**/*.json` (recursive) and
append the code-seed slugs, before any wave-1 file is authored. Every other finder in this wave
has been running a check that silently passes on 2,642 places it never loaded.

Confirmed against the seven reserved Oracle Park slugs: **none of my candidates collide.** The
only corpus-wide name echoes are `sacred-heart-church-glendale` (Queens) and three New York
firehouses, all different cities under different slugs.

---

## 1. HOW I ESTABLISHED WHICH ZONE EACH PLACE IS IN

Three independent locators, and I record where they disagree rather than averaging them.

**(a) DataSF Enterprise Addressing System — `3mea-di5p`.** The authoritative one. Every SF address
carries an `nhood` field holding the city's own Analysis Neighborhood assignment. This is a
per-address lookup, not a centroid guess, so it is exact at a parcel. Queried by
`address_number` + `street_full_street_name`.

**(b) DataSF Analysis Neighborhoods polygon — `j2bu-swwd`,** with my own point-in-polygon test,
used to assign landmark and NRHP geometries that have no street address.

**(c) Nominatim** reverse lookup, which returns a *vernacular* neighborhood. Its disagreements with
DataSF are the single most useful signal in this file — they mark exactly where the official
boundary and the name a visitor uses come apart.

**Correction that matters:** method (b) put the Delane House in Hayes Valley from its polygon
centroid. Method (a) put it at 70 Buena Vista Terrace in **Castro/Upper Market**. The EAS lookup
is right and the centroid was wrong; I dropped Delane House. Two other polygon-centroid results
were similarly overridden. Do not trust a centroid where an address exists.

### The finding the arbitrator most needs

**Van Ness Avenue is the Hayes Valley / Tenderloin boundary, and it cuts the Civic Center in
half.** From the EAS, per address:

| Address | Place | DataSF `nhood` |
|---|---|---|
| 201 Van Ness Ave | Louise M. Davies Symphony Hall | **Hayes Valley** |
| 301 Van Ness Ave | War Memorial Opera House | **Hayes Valley** |
| 401 Van Ness Ave | Veterans Building / Herbst Theatre | **Hayes Valley** |
| 135 Van Ness Ave | High School of Commerce | **Hayes Valley** |
| 201 Franklin St | SFJAZZ Center | **Hayes Valley** |
| 1 Dr Carlton B Goodlett Pl | San Francisco City Hall | **Tenderloin** |
| 200 Larkin St | Asian Art Museum | **Tenderloin** |
| 100 Larkin St | Main Library | **Tenderloin** |
| 99 Grove St | Bill Graham Civic Auditorium | **Tenderloin** |

The performing-arts complex on the west side of Van Ness is Hayes Valley's. The civic buildings on
the east side are not — they are Tenderloin's.

**And "Tenderloin" is not a zone.** It appears in neither `zones` nor `declined` in
`priv/seed_data/san_francisco_roster.json`. Neither does "Civic Center". So City Hall, the Asian
Art Museum, the Main Library and Bill Graham Civic Auditorium currently belong to **no page in the
programme** — they are not mine to take and there is no neighbour to hand them to. This is a
roster gap, not a straddle, and it is the arbitrator's to rule. I have researched them in §5 so
the material exists if the ruling assigns them somewhere, but I am not claiming them.

---

## 2. DESIGNATION IDENTIFIERS — the citable core

Both registers answered. Article 10 landmarks come from DataSF **`97yj-54sx`** ("Landmarks Listed
in Article 10 of the San Francisco Planning Code"); districts from **`knm6-5ej6`**; National
Register geometry and reference numbers from the **NPS ArcGIS service**
`mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer`.

Note for whoever writes the seed: the roster says two landmark dataset IDs returned 404 during
scoping. That is because the Socrata catalogue's federated search resolves IDs belonging to *other*
cities' portals. The working SF IDs are the three above, found by scoping the catalogue query with
`search_context=data.sfgov.org`. Confirmed by querying the register directly for each number.

### San Francisco Landmarks inside the Hayes Valley analysis neighborhood

Every row verified by a direct `$where=landmarkno in (...)` query against `97yj-54sx`, not read off
a map. Designation documents are at `sfplanninggis.org/docs/landmarks_and_districts/LM<no>.pdf`.

| No. | Name | Address | Designated |
|---|---|---|---|
| 47 | Nightingale House | 201 Buchanan Street | 1972 |
| 48 | Dietle Residence | 294 Page Street | 1972 |
| 84 | **War Memorial Complex** | 401 Van Ness Avenue | 1977 |
| 89 | Firehouse Engine Co. #2, Truck #6 | 1152 Oak Street | 1977 |
| 140 | High School of Commerce | 135 Van Ness Ave & 170-135 Fell St | 1981 |
| 164 | McMorry-Lagan Building | 188-198 Haight Street | 1983 |
| 182 | Theodore Green Apothecary | 500-502 Divisadero Street | 1986 |
| 223 | Carmel Fallon Building | 1800-1806 Market Street | 1998 |
| 256 | Richardson Hall | 55 Laguna Street | 2007 |
| 257 | Woods Hall | 101 Webster Street | 2007 |
| 258 | Woods Hall Annex | 218 Buchanan Street | 2007 |
| 268 | R. (Rube) L. Goldberg Building | 182-198 Gough Street | 2015 |
| 316 | Sacred Heart Parish Complex | 660 Oak / 735 Fell / 546-554 Fillmore | 2024 |

**13 landmark numbers.** No. 84 is the marquee: it covers the Opera House and the Veterans
Building together as one designation.

Adjacent, for the arbitrator's Civic Center ruling only — **No. 21, San Francisco City Hall,
400 Van Ness Avenue, designated 1970**, which the EAS places in the Tenderloin.

### Article 10 landmark *districts* (`knm6-5ej6`)

| District | Appendix | Listed | Falls in |
|---|---|---|---|
| **Alamo Square** | E | 1984-07-06 | Hayes Valley |
| **Market Street Masonry** | M | 2013-05-17 | straddles Hayes Valley / Mission |
| Civic Center | J | 1994-12-23 | Tenderloin |

### National Register reference numbers (NPS)

| Ref. no. | Name | Address | Zone |
|---|---|---|---|
| 83003594 | Russell Warren House | 465-467 Oak St & 368 Lily St | Hayes Valley |
| 85002195 | House at 584 Page Street | 584 Page St | Hayes Valley |
| 88000026 | US Mint (1937) | 155 Hermann St | Hayes Valley (straddler, §4) |
| 07001391 | San Francisco State Teacher's College | 55 Laguna St | Hayes Valley |
| 100001665 | Sacred Heart Parish Complex | 546/554 Fillmore, 735 Fell, 660 Oak | Hayes Valley |
| 78000757 | San Francisco Civic Center Historic District — **NHL** | roughly bounded by Golden Gate Ave | Tenderloin |

`07001391` and Landmark No. 256 are the same building (55 Laguna St) under two registers — the
seed may cite either or both, but must not present them as two places.

**Count: 13 SF Landmark numbers + 3 Article 10 district citations + 6 NRHP reference numbers = 22
designation identifiers**, of which 19 attach to places inside Hayes Valley.

> **A trap the author must not fall into.** The **Hayes Valley Residential Historic District**
> (DataSF `4yr8-u35c`, adopted 2008-06-06, 671 properties, 530 contributors, period 1860-1920,
> from the Market Octavia survey) carries `NR = Eligible`, **not** Listed, and `A10 = No`. It is
> California Register listed only. Writing "listed on the National Register" of this district
> would satisfy the gate regex and still be **false**. The gate checks for a citation, not for
> truth. Either cite the California Register precisely or drop the claim.

> **I could not verify `78000751`,** a reference number I initially expected for the Civic Center
> district. The NPS asset fetch 404'd on it. The correct number from the NPS service's own
> attribute table is **`78000757`**. Cite that one.

---

## 3. CANDIDATES — Hayes Valley by EAS, high confidence

Kinds are drawn from the thirteen the schema allows. There is no `church`, `monument`, `square`
or `bar` kind; wine bars are `restaurant`, civic halls are `theater` or `historic-site`.

### Parks and public space

**Patricia's Green** · `park` · 489 Hayes St · Rec & Park property, 0.4789 acres, type
"Neighborhood Park or Playground", analysis neighborhood Hayes Valley. Occupies the block of
Octavia between Hayes and Fell where the Central Freeway ramp stood. Source: DataSF `gtr9-ntp6`.

**Hayes Valley Playground** · `park` · 689 Hayes St · 0.7532 acres. Same source.

**Koshland Park** · `park` · 363 Page St · 0.9615 acres. Same source.

**Page & Laguna Mini Park** · `park` · 281 Page St · 0.1792 acres, type "Mini Park". Same source.

**Page Street Community Garden** · `park` · 438 Page St · 0.0896 acres, type "Community Garden".
Same source. Thin on its own; a verifier may fold or drop it.

### The performing-arts complex — the marquee cluster

All three are city property: the War Memorial's own site states the centre "is a landmark cultural
institution owned and operated by the City and County of San Francisco"
(`https://sfwarmemorial.org/`). Architect **Arthur Brown, Jr.**, who also designed City Hall.
History page: `https://sfwarmemorial.org/history/`.

**War Memorial Opera House** · `theater` · 301 Van Ness Ave · Cornerstone laid **11 November
1931**; **opened 15 October 1932** with Puccini's *Tosca* conducted by Gaetano Merola. Home of San
Francisco Opera since opening, and of San Francisco Ballet. Housed the San Francisco Symphony
until September 1980. 3,006-seat auditorium. San Francisco Landmark No. 84, designated 1977.

**Veterans Building** · `historic-site` · 401 Van Ness Ave · Cornerstone laid 11 November 1931;
**opened 11 November 1932**. Fourth floor rebuilt as the Wilsey Center, opened 2015. Covered by
Landmark No. 84 with the Opera House.

**Herbst Theatre** · `theater` · 401 Van Ness Ave, inside the Veterans Building · 892 seats,
originally built as an auditorium, refurbished 1978 with a grant from the Herbst Foundation. Site
of the **signing of the United Nations Charter in 1945**. Hung with murals by **Frank Brangwyn**
depicting Air, Earth, Fire and Water, brought from the **Panama-Pacific International Exposition of
1915**.
→ *Photo note: the Brangwyn murals are ARTWORKS, not architecture. 17 USC 120(a) does not reach
them. Brangwyn died 1956. A framing that features the murals needs its own clearance; the room
does not.*

**Louise M. Davies Symphony Hall** · `theater` · 201 Van Ness Ave · **Opened September 1980.**
2,739-seat auditorium. Home of the San Francisco Symphony.

**Harold L. Zellerbach Rehearsal Hall** · `historic-site` · 300 Franklin St · Opened 1981, one
year after Davies. Minor; likely an entry rather than a place.

**SFJAZZ Center** · `theater` · 201 Franklin St, at the corner of Fell and Franklin · **Opened
January 2013.** The organisation's own site places it "in San Francisco's Hayes Valley
neighborhood" and gives box office hours Wednesday–Saturday 12:00–17:30, closed Sunday–Tuesday,
also opening 90 minutes before a performance. Houses the restaurant B-Side.
Source: `https://www.sfjazz.org/visit/`.
→ *Banned phrasing warning: SFJAZZ's own copy calls it "the first stand-alone structure in the
country built specifically for jazz." That is a superlative with a comparison class and must NOT
be reproduced, attributed or not.*

### Other institutions

**Proxy** · `attraction` · 432 Octavia St, at the corner of Hayes and Octavia · Self-describes as
"a vibrant cultural hub," featuring small businesses and free community events including the Proxy
Spring and Fall Film Festivals, Sunday SOUND concerts and the Hayes Valley Carnival.
Source: `https://proxysf.net/`. Built on former freeway parcels.

**San Francisco Conservatory of Music** · `attraction` · 50 Oak St · EAS confirms Hayes Valley.
Under-researched — see §6.

**Nourse Theater** · `theater` · 275 Hayes St · EAS confirms Hayes Valley. Adjoins the former High
School of Commerce (Landmark No. 140) at 135 Van Ness / 170 Fell — the two structures physically
adjoin, which is a permitted adjacency statement.

### Designated buildings that can carry their own entries

**Nightingale House** (LM 47, 201 Buchanan St) · **Dietle Residence** (LM 48, 294 Page St) ·
**Richardson Hall** (LM 256 / NRHP 07001391, 55 Laguna St) · **Woods Hall** (LM 257, 101 Webster
St) · **Woods Hall Annex** (LM 258, 218 Buchanan St) · **R. L. Goldberg Building** (LM 268,
182-198 Gough St) · **Russell Warren House** (NRHP 83003594, 465-467 Oak St) · **House at 584 Page
Street** (NRHP 85002195). All `historic-site`. Richardson, Woods and Woods Annex form the former
San Francisco State Teacher's College group at Laguna and Buchanan.

### Hayes Street commercial — all EAS-confirmed Hayes Valley

`restaurant` unless noted. Addresses verified; **founding years deliberately absent** — an
operator's own site does not establish trading duration, per the rules.

Hayes Street Grill (320 Hayes St) · Absinthe Brasserie (398 Hayes St) · Souvla (517 Hayes St) ·
Rich Table (199 Gough St) · Monsieur Benjamin (451 Gough St) · Robin (620 Gough St) ·
Birba (458 Grove St) · Suppenküche (525 Laguna St) · Arlequin (384 Hayes St) ·
Miette (449 Octavia St, `shop`) · Timbuk2 (506 Hayes St, `shop`) · Azalea (411 Hayes St, `shop`).

Also on the Octavia/Linden block, geocoded but not EAS-matched by number: **Blue Bottle Coffee**
(315 Linden St, `cafe`), **Ritual Coffee Roasters** and **Smitten Ice Cream** (both 432 Octavia,
the Proxy parcel).
→ **Slug warning:** `blue-bottle-coffee-mission-rock` is a reserved Oracle Park code-seed slug.
A Linden Street Blue Bottle is a *different* location and needs a distinct slug
(`blue-bottle-coffee-linden` or similar). Do not reuse, and do not assume the reserved one covers it.

---

## 4. STRADDLERS — flagged, not resolved

I am not ruling any of these. Each is a place where my three locators disagree, or where the
official boundary and the vernacular name come apart.

**1. Alamo Square and the Painted Ladies — the big one.**
DataSF puts **Alamo Square (1081 Fulton St, 13.649 acres)** in the **Hayes Valley** analysis
neighborhood, and puts **710 Steiner Street** — the Painted Ladies row — in **Hayes Valley** too.
Nominatim calls the same area "Alamo Square". The roster *declined* Alamo Square as its own zone
with the reason: "The Painted Ladies are its single draw and sit at the edge of Hayes Valley's
reach." That reads as an invitation for Hayes Valley to take it, and the city's own data supports
it. It is also an **Article 10 landmark district (Appendix E, listed 1984-07-06)**, so it publishes
with a citation. **But it is 13.6 acres and a marquee in its own right, and the arbitrator holds
all twelve zones.** Flagging rather than claiming.

**2. The Civic Center group — an orphan, not a straddle.** City Hall (LM 21), Asian Art Museum,
Main Library, Bill Graham Civic Auditorium, United Nations Plaza, Civic Center Plaza. All EAS
**Tenderloin**; Tenderloin is in neither `zones` nor `declined`. See §1. Material in §5.

**3. Zuni Café, 1658 Market St.** DataSF **Hayes Valley**; Nominatim **Mission**. Market Street is
the seam. Contested with SoMa and the Mission, both of which are wave zones.

**4. US Mint (1937), 155 Hermann St, NRHP 88000026.** DataSF **Hayes Valley**; vernacular Duboce
Triangle / Lower Haight. This is *not* the Old Mint at Fifth and Mission, which is a separate NRHP
listing in South of Market — do not conflate them. The two are distinct buildings.

**5. Sacred Heart Parish Complex, 546-554 Fillmore / 735 Fell / 660 Oak.** DataSF **Hayes Valley**;
Nominatim **Lower Haight**. Carries both LM 316 and NRHP 100001665, so it is worth resolving.

**6. The Divisadero edge.** The Independent (628 Divisadero), Theodore Green Apothecary (LM 182,
500-502 Divisadero), Firehouse Engine Co. #2 (LM 89, 1152 Oak St). All DataSF **Hayes Valley**;
Nominatim returns **Alamo Square** for this stretch and locals say NoPa. The DataSF Hayes Valley
polygon runs much further west than the name does in use.

**7. The Market Street south edge.** McMorry-Lagan Building (LM 164, 188-198 Haight St) and Carmel
Fallon Building (LM 223, 1800-1806 Market St), plus the **Market Street Masonry** Article 10
district which straddles Hayes Valley and the Mission outright.

**8. The Laguna/Buchanan south edge.** Nightingale House (201 Buchanan), Richardson Hall and the
Woods Hall group (55 Laguna, 101 Webster, 218 Buchanan). DataSF Hayes Valley; vernacular Duboce
Triangle.

**9. Veterans Building block reading.** Nominatim returns **Civic Center** for 401 Van Ness even
though EAS returns Hayes Valley. Worth noting only because it shows the Civic Center name reaches
across Van Ness in common use even though the city's boundary does not.

**Excluded after checking — for the record, so nobody re-finds them:** Delane House (70 Buena Vista
Terr → Castro/Upper Market); Rintaro (82 14th St → Mission); Atelier/Bar Crenn (3127 Fillmore →
Marina); African American Art & Culture Complex (762 Fulton → Western Addition); Boom Boom Room /
Fillmore Heritage (1601 Fillmore → Japantown).

---

## 5. CIVIC CENTER MATERIAL — researched, NOT claimed

Held here so the arbitrator has it if the ruling assigns these anywhere. All EAS **Tenderloin**.

- **San Francisco City Hall**, 1 Dr Carlton B Goodlett Pl / 400 Van Ness Ave. **San Francisco
  Landmark No. 21, designated 1970.** Architect Arthur Brown, Jr., the same architect as the War
  Memorial, working to Daniel Burnham's plan for a unified Civic Center
  (`https://sfwarmemorial.org/history/`).
- **San Francisco Civic Center Historic District**, **NRHP reference number 78000757**, flagged
  `Is_NHL = X` in the NPS data — a National Historic Landmark district. DataSF records 11
  properties, 9 contributing, period of significance 1913-1951.
- **Civic Center**, Article 10 landmark district, **Appendix J, listed 1994-12-23**.
- **Asian Art Museum**, 200 Larkin St · **Main Library**, 100 Larkin St · **Bill Graham Civic
  Auditorium**, 99 Grove St · **Federal Office Building**, 50 United Nations Plaza, **NRHP
  100001018**.

---

## 6. WHAT I AM LEAST CONFIDENT ABOUT

**San Francisco Conservatory of Music, 50 Oak St.** EAS puts it in Hayes Valley and it is plainly a
real institution with a Hayes Valley address, but I established nothing beyond the address — no
opening date, no architect, no hours from its own site. It needs a pass before it can carry a
place record, and on current evidence it can only support a name-and-street entry.

**Nourse Theater, 275 Hayes St.** Same problem in sharper form. EAS confirms the address and it
adjoins the Landmark No. 140 school building, but I have no sourced operator, capacity, opening
date or programme. I suspect it is a rentable auditorium attached to the former high school rather
than an independent venue, and if so it may be an entry under High School of Commerce rather than
a place. Unverified.

**Alamo Square.** Not low-confidence about the *facts* — the acreage, the Article 10 appendix and
the EAS assignment are all solid. Low-confidence about the *claim*. Every mechanical test I ran
says Hayes Valley owns it; every instinct about how a visitor uses the name says it is its own
thing, and the roster explicitly declined it as a zone while pointing at Hayes Valley. If the
arbitrator gives it to Hayes Valley the page gains a marquee; if it rules it unclaimed the way the
three parks are, that is equally defensible. I would not want this decided by my say-so.

**The Octavia/Linden retail trio** (Blue Bottle, Ritual, Smitten) — all three failed EAS number
matching and rest on geocoder output plus the Proxy parcel address. Addresses need confirming
before any of them ships, and the Blue Bottle slug collision in §3 must be handled.

---

## 7. SOURCE INDEX

| Source | URL / dataset | What it established |
|---|---|---|
| DataSF EAS addresses | `data.sfgov.org/resource/3mea-di5p.json` | per-address analysis neighborhood |
| DataSF Analysis Neighborhoods | `data.sfgov.org/resource/j2bu-swwd.json` | boundary polygons |
| DataSF Article 10 landmarks | `data.sfgov.org/resource/97yj-54sx.json` | 13 landmark numbers + years |
| DataSF landmark districts | `data.sfgov.org/resource/knm6-5ej6.json` | Alamo Square, Market St Masonry, Civic Center |
| DataSF historic districts | `data.sfgov.org/resource/4yr8-u35c.json` | Hayes Valley Residential HD status |
| DataSF Rec & Park properties | `data.sfgov.org/resource/gtr9-ntp6.json` | park acreages, types, neighborhoods |
| NPS NRHP ArcGIS | `mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer` | NRHP reference numbers, NHL flag |
| SF Planning designation PDFs | `sfplanninggis.org/docs/landmarks_and_districts/LM<no>.pdf` | designation documents |
| SF War Memorial | `https://sfwarmemorial.org/history/` | 1931 cornerstones, 1932 openings, 1980 Davies, seat counts, Brangwyn murals, UN Charter 1945 |
| SFJAZZ | `https://www.sfjazz.org/visit/` | January 2013 opening, address, box office hours |
| Proxy | `https://proxysf.net/` | address, corner, programme |
| Nominatim | `nominatim.openstreetmap.org/search` | vernacular neighborhood, straddler signal |
