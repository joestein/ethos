# Union Square, San Francisco — FINDER

Compiled 2026-09-03. Zone slug `union-square`, destination string **`Union Square San Francisco,
California`** per `priv/seed_data/san_francisco_roster.json` — the first comma-segment is
`Union Square San Francisco`, which derives `union-square-san-francisco` and does NOT collide
with Manhattan's `union-square`. **The disambiguation is load-bearing and already live in the
roster; do not "clean it up" to "Union Square, California".**

This file is the research record, not reader-facing prose. Superlatives quoted from sources,
provenance arguments, failed fetches and editorial reasoning all live here and must not cross
into a seed file.

---

## 0. COLLISION CHECK — RUN FIRST, RESULT RECORDED

`python3 .superpowers/taken_slugs.py` only reads `priv/seed_data/rome/*.json`. The corpus-wide
scan is `python3 .superpowers/vf_taken_all.py <needles>`, which reads
`priv/seed_data/**/*.json` — **4,389 places across 349 files**. Both were run.

Searched: `union square`, `powell`, `geary`, `maiden`, `westin`, `st. francis`, `stockton`,
`post street`, `sutter`, `kearny`, `grant`, `cable car`, `theat`, `dewey`, `market street`,
`hotel`, `macy`, `neiman`, `gump`, `john's grill`, `sears fine`, `flood`, `chinatown gate`,
`hallidie`.

**Live collisions that constrain this zone:**

| owned slug | file | why it matters |
|---|---|---|
| `union-square-park` | `manhattan/union-square.json` | Manhattan's square. Our square must NOT take slug `union-square-park`. Propose `union-square-sf` or `union-square-plaza-san-francisco`. |
| `union-square-greenmarket`, `union-square-cafe`, `w-new-york-union-square` | `manhattan/union-square.json` | name-collision hazard only |
| `fishermans-wharf-powell-hyde-turntable` | `san_francisco/fishermans-wharf.json` | the **north** terminus at Hyde & Beach |
| `fishermans-wharf-powell-mason-turntable` | `san_francisco/fishermans-wharf.json` | the **north** terminus at Bay & Taylor |
| `chinatown-grant-avenue`, `chinatown-stockton-street`, `chinatown-stockton-street-tunnel` | `san_francisco/chinatown.json` | Grant Ave and Stockton St **as streets** are Chinatown's. Union Square may write individual BUILDINGS on Grant and Stockton but may not claim either street as a place. |
| `soma-735-market-street` | `san_francisco/soma.json` | 735 Market (NRHP 04000327) is taken |
| `market-street-masonry-district-hayes-valley` | `san_francisco/hayes-valley.json` | a Market Street district is already claimed elsewhere |
| `nob-hill/cable-car-museum-nob-hill`, `california-street-cable-car-line-nob-hill` | `san_francisco/nob-hill.json` | the Cable Car Museum and the California line are Nob Hill's |
| `flood-mansion-pacific-union-club-nob-hill` | `san_francisco/nob-hill.json` | name-collides with the **James Flood Building** at 870 Market. Different building, different Flood asset — use a slug and name that cannot be confused, e.g. `james-flood-building-union-square`. |

**The Powell & Market turntable is FREE.** Both existing turntable places are explicitly the
*north* termini; both summaries already say "SFMTA states that the line starts at Powell and
Market" without claiming the south terminus as a place. Union Square can take it.

The seven Oracle Park code-seed slugs are all Mission Bay / Mission Rock and touch nothing here.

---

## 1. JUDGEMENT: **GUIDE**, not a town page.

Union Square carries at least sixteen Article 10 landmark numbers inside the vernacular
boundary and eight more on its disputed rim; ten National Register reference numbers; a
2.6-acre Rec & Park civic plaza with two catalogued Arts Commission works standing on it; a
National Historic Landmark cable-car terminus; two operating theatres on one block; a
Frank Lloyd Wright interior; a 172-year-old subscription library with published hours; and
enough restaurants, hotels, galleries and shops to fill `sight`, `stay`, `food`, `shop` and
`walk`. Material density is high and most of it is citable to a register with an identifier.

The hazard is the opposite of thinness: **almost everything here has a designation, and it is
very easy to write a tally.** Do not. Name the buildings, cite their numbers, never count them.

---

## 2. HOW ZONE MEMBERSHIP WAS ESTABLISHED — AND WHY IT DOES NOT SETTLE

**Union Square is not an SF Planning Analysis Neighborhood.** The 41-unit official layer
(`j2bu-swwd`) has no Union Square polygon at all; the ground splits between *Financial
District/South Beach*, *Tenderloin* and *Nob Hill*. Three independent readings were taken.

| # | source | dataset / URL | unit name here |
|---|---|---|---|
| 1 | DataSF SF Find Neighborhoods (117 vernacular units) | `gfpk-269f` — https://data.sfgov.org/resource/gfpk-269f.json | **`Downtown / Union Square`** — exists, and is the only layer that names the zone |
| 2 | DataSF Analysis Neighborhoods (41 official units) | `j2bu-swwd` — https://data.sfgov.org/resource/j2bu-swwd.json | **no Union Square.** Splits to `Financial District/South Beach`, `Tenderloin`, `Nob Hill` |
| 3 | DataSF Community Benefit Districts | `c28a-f6gs` — https://data.sfgov.org/resource/c28a-f6gs.json | **`Union Square Business Improvement District`** — established 1999, renewed 2004 and 2019, expires 2034-06-01, revenue $6,858,146. Also carries `Downtown`, `Tenderloin`, `Mid Market`, `Yerba Buena` polygons that abut. |

Point-in-polygon was run for every candidate against all three. `Downtown / Union Square`
bounding box: lon −122.41043 to −122.40196, lat 37.78329 to 37.79097.

### The three readings for every candidate (full table — the arbitrator's working set)

| candidate | gfpk-269f (117) | j2bu-swwd (41) | CBD |
|---|---|---|---|
| Union Square plaza / Dewey Monument | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| Westin St. Francis, 335 Powell | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| 140 Maiden Lane (V.C. Morris) | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| **Geary Theater, 415 Geary** | **Tenderloin** | **Tenderloin** | Union Square BID |
| **Curran Theatre, 445 Geary** | **Tenderloin** | **Tenderloin** | Union Square BID |
| **Clift, 495 Geary** | **Tenderloin** | **Tenderloin** | Union Square BID |
| **Powell/Market turntable** | Downtown / Union Square | **Tenderloin** | Union Square BID |
| **Hallidie Plaza** | Downtown / Union Square | **Tenderloin** | Union Square BID |
| **Mechanics' Institute, 57 Post** | Downtown / Union Square | Financial District/South Beach | **Downtown** |
| Hallidie Building, 130 Sutter | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| Hammersmith Building, 303 Sutter | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| 450 Sutter Building | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| Neiman Marcus / City of Paris, 150 Stockton | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| Macy's, 170 O'Farrell | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| **Lotta's Fountain** | Downtown / Union Square | Financial District/South Beach | **Downtown** |
| **James Flood Building, 870 Market** | Downtown / Union Square | **Tenderloin** | Union Square BID |
| Phelan Building, 760 Market | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| Chronicle Building, 690 Market | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| Wells Fargo Union Trust, 744 Market | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| 1 Grant Avenue | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| Home Telephone Co., 327–333 Grant | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| **Notre Dame des Victoires, 564–566 Bush** | **Chinatown** | Financial District/South Beach | — (outside every CBD) |
| **Fire Station 2, 460 Bush** | **Chinatown** | Financial District/South Beach | — |
| **Met Life, 600 Stockton** | **Nob Hill** | **Nob Hill** | — |
| **First Congregational, 432 Mason / 491 Post** | Downtown / Union Square | **Tenderloin** | Union Square BID |
| **Marines' Memorial, 609 Sutter** | **Lower Nob Hill** | **Nob Hill** | — |
| **Metropolitan Club (Woman's Athletic Club), 640 Sutter** | **Lower Nob Hill** | **Nob Hill** | — |
| **Bohemian Club, 624 Taylor** | **Lower Nob Hill** | **Nob Hill** | — |
| **Olympic Club, 524 Post** | Downtown / Union Square | **Nob Hill** | Union Square BID |
| **Kensington Park Hotel (Elks Bldg), 450 Post** | Downtown / Union Square | **Nob Hill** | Union Square BID |
| John's Grill, 63 Ellis | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| **Sears Fine Food, 439 Powell** | Downtown / Union Square | **Nob Hill** | Union Square BID |
| Gump's, 250 Post | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| Britex Fabrics, 117 Post | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| Apple Union Square, 300 Post | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| Saks Fifth Avenue, 384 Post | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| Grand Hyatt, 345 Stockton | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| **Hilton Union Square, 333 O'Farrell** | **Tenderloin** | **Tenderloin** | **Tenderloin** |
| **Alcazar Theater (Islam Temple), 650 Geary** | **Tenderloin** | **Tenderloin** | — |
| I. Magnin Building, 233–259 Geary | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| Samuel's Clock, 856 Market | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| Powell Street Station | Downtown / Union Square | **Tenderloin** | Union Square BID |
| **One Montgomery Street** | Downtown / Union Square | Financial District/South Beach | **Downtown** |
| Union Square Garage, 333 Post | Downtown / Union Square | Financial District/South Beach | Union Square BID |
| **Emporium dome / 865 Market** | **South of Market** | **South of Market** | **Yerba Buena** |
| **Golden Gate Theatre, 1 Taylor** | **Tenderloin** | **Tenderloin** | **Tenderloin** |
| **Warfield, 982 Market** | **South of Market** | **South of Market** | **Mid Market** |

Point-in-polygon script: `scratchpad/us/s22.py`. Polygons cached in `scratchpad/us/`.

---

## 3. STRADDLERS — FLAGGED, NOT RESOLVED

**A. The Geary Street theatre block is the single biggest straddler.** Both DataSF neighborhood
layers put 415 Geary (Geary Theater / A.C.T.), 445 Geary (Curran) and 495 Geary (Clift) in
**Tenderloin**. The Union Square BID includes all three. The roster brief for this zone names
"the theatres of the Geary Street block" as a draw. **The Tenderloin is not a zone in this
wave** — the roster's twenty neighbourhoods do not include it — so nobody else can claim
these. That is an argument from absence, not from data, and the arbitrator should say so out
loud rather than let it happen silently.

**B. Market Street's north side, Fifth to Montgomery.** The 117-layer calls it Downtown /
Union Square; the 41-layer alternates Financial District/South Beach and Tenderloin; the CBD
alternates Union Square BID and Downtown. **Contested with `financial-district` and `soma`,
both live in this wave.** Affected: Flood Building (LM 154), Phelan (LM 156), Chronicle
(LM 243), Wells Fargo Union Trust (LM 131), Samuel's Clock (LM 77), Dressler/Garfield
(LM 244), Lotta's Fountain (LM 73), One Montgomery (LM 297), 1 Grant Avenue (LM 132),
Mechanics' Institute (LM 134).

**C. Bush Street, Grant to Stockton.** Notre Dame des Victoires (LM 173) and Fire Station 2
(LM 143) read **Chinatown** on the 117 layer and Financial District/South Beach on the 41 layer,
and fall outside every CBD. **Contested with `chinatown` (SHIPPED) and `financial-district`.**
Chinatown already owns `chinatown-grant-avenue` and the Dragon Gate at Grant & Bush.

**D. Sutter/Post/Taylor west of Powell.** Marines' Memorial (609 Sutter), the Metropolitan Club
(640 Sutter, NRHP 04000955), the Bohemian Club (624 Taylor), the Olympic Club (524 Post) and
the Kensington Park Hotel (450 Post) all read **Nob Hill** or **Lower Nob Hill** on at least one
layer. **Nob Hill is SHIPPED.** Check `priv/seed_data/san_francisco/nob-hill.json` before
claiming any of these; the shipped file does not currently own them by slug, but the
containment argument is live.

**E. 600 Stockton (Met Life, LM 167).** Both neighbourhood layers say **Nob Hill**; outside all
CBDs. Almost certainly not Union Square's. Listed for completeness only.

**F. Hallidie Plaza / Powell Street Station / the Powell & Market turntable.** 117-layer:
Downtown / Union Square. 41-layer: **Tenderloin**. CBD: Union Square BID. The turntable is the
one item the roster brief explicitly assigns to this zone.

**G. Excluded on all three readings, do not claim:** the Emporium dome at 865 Market (SoMa /
Yerba Buena), the Warfield at 982 Market (SoMa / Mid Market), the Golden Gate Theatre at
1 Taylor (Tenderloin), the Alcazar Theater / Islam Temple at 650 Geary, LM 195 (Tenderloin,
outside all CBDs), the Hilton Union Square at 333 O'Farrell (Tenderloin on all three, despite
its trading name).

---

## 4. THE DESIGNATION REGISTER — every number found, with its source

### 4a. Article 10 individual landmarks, geometry inside `Downtown / Union Square`

Source for all: DataSF **`97yj-54sx`** — https://data.sfgov.org/resource/97yj-54sx.json?$limit=1000
(HTTP 200, 370 rows, fetched 2026-09-03). Fields used: `landmarkno`, `name`, `address`,
`yeardesignated`, `the_geom`. Cross-checked against DataSF **`3tsw-4idn`** *Historic Resource
Status by Parcel* (`ceqacodereason` contains "Article 10 Individual Landmark") and matched by
APN where possible.

| LM No. | name in the register | address | designated |
|---|---|---|---|
| 37 | Hallidie Building | 130–150 Sutter Street | 1971 |
| 72 | V. C. Morris Building | 140 Maiden Lane | 1975 |
| 73 | Lotta's Fountain | Geary/Market/Kearny Streets | 1975 |
| 77 | Samuel's Clock | 856 Market Street | 1975 |
| 117 | Hammersmith Building | 303 Sutter Street | 1980 |
| 131 | Wells Fargo Union Trust Branch | 744 Market Street | 1981 |
| 132 | Savings Union Branch of Sec. Pac. Natl Bank | 1 Grant Avenue | 1981 |
| 134 | The Mechanics Institute | 57–65 Post Street | 1981 |
| 141 | Home Telephone Company | 333 Grant Avenue | 1981 |
| 154 | James Flood Building | 870–898 Market Street | 1982 |
| 156 | Phelan Building | 760–784 Market Street | 1982 |
| 177 | First Congregational Church | 432 Mason Street | 1985 |
| 233 | The Golden Triangle Light Standards | "Along the streets bounded by Market, and Sutter Streets" | 2003 |
| 243 | Chronicle Building | 690 Market Street | 2007 |
| 244 | Dressler or Garfield Building | 938–942 Market Street | 2004 |
| 297 | One Montgomery Street (Crocker National Bank Building) | 1–25 Montgomery Street | 2022 |

### 4b. Article 10 landmarks on the disputed rim

| LM No. | name | address | designated | reads as |
|---|---|---|---|---|
| 82 | Geary Theater | 415 Geary Blvd & 333 Mason St | 1976 | Tenderloin (both layers), Union Square BID |
| 113 | S.F. Curb Mining Exchange | 350 Bush Street | 1980 | Financial District |
| 143 | Fire Station 2 | 460 Bush Street | 1981 | Chinatown / FiDi |
| 162 | The Hobart Building | 582–592 Market Street | 1983 | Financial District |
| 167 | Met Life–Pacific Coast Head Office | 600 Stockton Street | 1984 | Nob Hill |
| 173 | Notre Dame des Victoires Church & Rectory | 564–566 Bush Street | 1984 | Chinatown / FiDi |
| 183 | Crown Zellerbach Building | 1 Bush Street | 1987 | Financial District |
| 195 | Islam Temple (Alcazar Theater) | 650 Geary Blvd | 1989 | Tenderloin / Lower Nob Hill |

### 4c. National Register reference numbers

Source: NPS **nrhp_locations** MapServer, layers 0 (points) and 1 (polygons) —
`https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0/query`
with an envelope of −122.418,37.780,−122.398,37.795 (HTTP 200, 32 point features, 11 polygon
features). **The reference-number field is `NRIS_Refnum`, not `REFNUM`** — a query on `REFNUM`
returns nulls and looks like the data is missing. It is not.

| resource | address | ref no. | certified | reads as |
|---|---|---|---|---|
| Hallidie Building | 130 Sutter St. | **71000185** | 1971-11-19 | Downtown / Union Square |
| City of Paris Building | 181–199 Geary St. | **75000471** | 1975-01-23 | Downtown / Union Square |
| Geary Theatre | 415 Geary St. | **75000472** | 1975-05-27 | Tenderloin |
| Lotta Crabtree Fountain | Market, Geary, Kearny Sts. | **75000475** | 1975-06-20 | Downtown / Union Square |
| Hunter–Dulin Building | 111 Sutter St. | **97000348** | 1997-04-17 | Downtown / Union Square |
| Woman's Athletic Club of San Francisco | 640 Sutter St. | **04000955** | 2004-09-10 | Lower Nob Hill |
| Four Fifty Sutter Building | 450 Sutter St. | **09001118** | 2009-12-22 | Downtown / Union Square |
| Mutual Savings Bank Building | 700 Market St. | **13001107** | 2014-01-22 | Downtown / Union Square |
| San Francisco Fire Department Engine Co. No. 2 | 460 Bush St. | **02000371** | 2002-04-17 | Chinatown |
| Hobart Building | 582–592 Market St. | **100006911** | 2021-09-17 | Financial District |
| Building at 735 Market Street | 735 Market St. | 04000327 | 2004-07-27 | **TAKEN by SoMa** |
| **San Francisco Cable Cars** (NHL) | 1390 Washington St. | **66000233** | 1966-10-15, `Is_NHL = X` | district; covers the Powell lines |
| Lower Nob Hill Apartment Hotel District | roughly 590–1209 Bush, 680–… | **91000957** | 1991-07-31 | district, straddles §3D |
| Market Street Theatre and Loft District | 982–1112 Market, 973–1105 Market | **86000729** | 1986-04-10 | district, SoMa/Mid-Market side |

### 4d. Districts touching the zone (DataSF `m22e-6hkz`, Historic Districts)

Intersection test in `scratchpad/us/s6.py`. Four districts have vertices inside the
`Downtown / Union Square` polygon:

| district | NR status | CR status | Article 10 | Article 11 | vertices inside |
|---|---|---|---|---|---|
| San Francisco Cable Car Historic District | Listed | Listed | No | No | 53 / 800 |
| Lower Nob Hill Apartment Hotel Historic District | Listed | Listed | No | No | 34 / 238 |
| Uptown Tenderloin Historic District | Listed | Listed | No | No | 5 / 143 |
| Chinatown Historic District | Eligible | Eligible | No | No | 3 / 248 |

**"Eligible" is not "listed" and does not publish as a designation claim.** The Chinatown
Historic District row is Eligible only.

### 4e. Article 11 — a real designation, and its name is NOT sourced

DataSF `3tsw-4idn` `ceqacodereason` returns the literal strings **"Article 11 Conservation
District"** and **"Article 11 Individual"** for nearly every parcel between Market, Bush,
Kearny and Mason. That is a Planning Code designation and it is per-parcel verifiable at
https://data.sfgov.org/resource/3tsw-4idn.json.

**BUT the dataset never names WHICH conservation district.** The commonly-cited name is the
Kearny–Market–Mason–Sutter Conservation District. I could not confirm that name from a primary
source: `sfplanning.org/project/article-10-landmarks` → 404,
`sfplanning.org/preservation-bulletins` → 404, `sfplanning.org/resource/article-11` → 404,
`codelibrary.amlegal.com/.../sf_planning/0-0-0-16041` → 403. `sfplanning.org/preservation`
returned 200 but names no districts. **Do not write the district's name until someone fetches
the Article 11 appendix.** "Article 11 Conservation District" with no name and no number is
a bare claim and fails the gate. Either find the appendix or drop Article 11 entirely and
lean on the Article 10 and NRHP numbers, which are plentiful.

The only Article 11 row in `m22e-6hkz` with `a11 != No` is "Mint-Mission Conservation
District" — which is not this one.

### 4f. THE TRAP: "LM 0" IS NOT A LANDMARK NUMBER

`97yj-54sx` contains ~40 rows with `landmarkno = "0"` and `yeardesignated = "0.0"`. These are
candidates under consideration, not designations. **The I. Magnin & Company Building,
251–259 Geary St, is one of them.** So are the Strand Theater, Glide Memorial Church, the
Fillmore Auditorium and Kezar Stadium. Any sentence of the form "San Francisco Landmark No. 0"
is nonsense, and any designation claim for I. Magnin fails. The I. Magnin building's real,
citable status is `Article 11 Individual, Article 11 Conservation District` per `3tsw-4idn`,
and the block it stands on carries NRHP **75000471** as the *City of Paris Building*, which is
a different building on the other side of the Stockton/Geary corner. **Do not merge them.**

Landmark numbers now run to **LM 335** (St. Nicholas Cathedral, 2005 15th St, 2026). The register
gains rows. Never tally it.

---

## 5. CANDIDATES

Format: **name** — kind | address | what it is | dates/makers if sourced | designation | zone
reading | source URLs.

### 5.1 THE SQUARE AND ITS FURNITURE

**Union Square (the plaza)** — `park` | 333 Post St, San Francisco, CA 94108
- DataSF Rec & Park Properties `gtr9-ntp6` (https://data.sfgov.org/resource/gtr9-ntp6.json,
  HTTP 200, 255 rows): `property_id` 135, `property_name` "Union Square",
  `propertytype` **"Civic Plaza or Square"**, `ownership` **"Recreation & Park"**,
  `acres` **2.6001148800000005**, `squarefeet` **113261.45717332**,
  `perimeterlength` **1373.70024941**, centroid −122.40751369 / 37.78793628,
  `analysis_neighborhood` "Financial District/South Beach",
  `mons_neighborhood` "Downtown / Union Square", `supdist` 3, `zipcode` 94108.
- Bounded by Geary, Powell, Post and Stockton. All four are named streets, so "the side of a
  named street or square" is permitted orientation; "on the eastern edge" is not.
- **Slug warning:** `union-square-park` is Manhattan's. Use something else.
- **No hours found.** sfrecpark.org's facility list is JS-rendered; the search endpoint returns
  only the first five alphabetical results regardless of query, and guessing detail-page IDs
  produced Grandview Park and a Dogpatch community garden. If a Rec & Park page for Union
  Square is ever fetched, it will carry a park-hours line; until then write nothing about hours.
- Kind: schema has `park`. `Civic Plaza or Square` is the city's word, not a schema kind.

**The Dewey Monument** — `attraction` | centre of Union Square, 333 Post St
- DataSF Civic Art Collection `r7bn-7v9c` (https://data.sfgov.org/resource/r7bn-7v9c.json,
  HTTP 200, 1,038 rows), accession **1902.1**:
  `display_title` "The Dewey Monument (Admiral George Dewey, 1837-1917)",
  `artist` **"Aitken, Robert Ingersoll"**, `creation_date` **"1901"**,
  `medium` "Bronze figure on granite base",
  `display_dimensions` **"1265 x 135 x 135 in."** (1,265 in = 105 ft 5 in),
  `credit_line` "Collection of the City and County of San Francisco; Funds raised by public
  subscription", `facility` "Union Square", `location_description` "Center Of Plaza",
  `street_address_or_intersection` "333 Post Street", `current_location` "Public Display".
- **DATE CONFLICT, UNRESOLVED.** The Arts Commission record says `creation_date` 1901. The
  monument is widely dated to its 1903 dedication. Only 1901 is sourced. Write "1901" citing
  the Arts Commission, or write no date. Do not write 1903 without a second source.
- **PHOTO:** a bronze figure on a granite column is a SCULPTURE, not architecture. 17 USC 120(a)
  does not reach it. Aitken died 1949, so US copyright on a 1901 work has expired anyway — but
  photographs are a separate wave and this file emits `"photos": []`. Say nothing about why.
- Physical description that is safe: bronze figure on a granite column, 1,265 inches to the top
  per the Arts Commission dimension field.

**Union Square Colonnade** — `attraction` (or fold into the square) | south side of the plaza
- `r7bn-7v9c`, accessions **2003.1.1** through **2003.1.4** and the set record 2003.1.1-4.
  `artist` **"Fischer, R. M."**, `creation_date` "1999-2002",
  `medium` "stainless steel, polycarbonate, aluminum" on granite,
  `display_title` "Union Square Colonnade" / "…Colonnade 'B'" / "'C'" / "'D'",
  `display_dimensions` "Four columns with light fixtures, each 1-2 stories h",
  individual heights 240 in, 180 in, 180 in, 240 in;
  `location_description` "South Side" / "South Side, Towards Stockton St." /
  "South Side, Towards Powell St." / "South Side Second Closest To Powell St.",
  `street_address_or_intersection` "333 Post Street".
- Four columns is a count of ordinary things and is allowed. R. M. Fischer is living: the
  photo refinement bites. Prose is fine.

**Union Square Garage** — `attraction` (schema has no `parking` kind; consider omitting) |
333 Post St, San Francisco, CA 94108
- SFMTA garages list (https://www.sfmta.com/garages-lots-list, HTTP 200): "Union Square
  Garage", 333 Post Street, 94108, phone 415-765-9069, hours **"Monday - Sunday: 5:00am -
  11:00pm"**, detail path `/garages-lots/union-square-garage`.
- Business registry `g8m3-pdis`: **LAZ Parking**, 333 Post St, location start 2018-01-04, no
  end date — the operator on the ground.
- The garage's 1942 opening and Timothy Pflueger's involvement are **not sourced here** and the
  usual framing ("the first underground parking garage in the United States") is a superlative
  and is banned. Either find a register citation or write the garage as a plain fact with its
  hours, or leave it out. It is the weakest of the square's four assets.

**Powell & Market cable car turntable** — `attraction` | Powell St at Market St
- SFMTA (https://www.sfmta.com/getting-around/muni/cable-cars, HTTP 200): three lines —
  California (California & Market to Van Ness Ave), Powell/Hyde and Powell/Mason, both of which
  **"Starts at Powell and Market"**. "To board cable cars at Powell & Market, Bay & Taylor and
  Hyde & Beach Streets, you must purchase your fare in advance (applies 8 a.m. to 8 p.m.
  daily)." You board "at the cable car turntables (the beginning or end of each route) or look
  for the brown-and-white cable car sign post."
- SFMTA also says the cable cars were **"Invented here 150 years ago and named a National
  Historic Landmark in 1964."**
- NPS nrhp_locations layer 1: **San Francisco Cable Cars**, NRHP ref **66000233**,
  `CertDate` **1966-10-15**, `Is_NHL = X`, address given as 1390 Washington St.
- **DATE CONFLICT, FLAG IT.** SFMTA says NHL 1964; NPS's certification date is 1966-10-15.
  Both are probably true of different acts (NHL designation vs. automatic National Register
  listing), but only the NPS field is a register record with an identifier. **Cite
  "National Register of Historic Places reference number 66000233" and the NPS date, or cite
  nothing.** Do not write "1964" on SFMTA's word alone, and do not write "150 years ago" —
  that is a trading-duration claim from an operator.
- The two existing Wharf turntable places already restate the SFMTA advance-purchase sentence
  almost verbatim. Vary the wording or the corpus will read as boilerplate.
- 41-layer reads **Tenderloin**. Straddler §3F.

**Hallidie Plaza** — `attraction` | Powell St at Market St, above Powell Street Station
- Union Square Alliance names it as a place it works on: "Examples can be seen at Hallidie
  Plaza, Maiden Lane, and Union Square Park" (https://www.unionsquarealliance.com/about,
  HTTP 200).
- No dimensions, no designation, no hours sourced. Thin. Probably a sentence inside the
  turntable entry rather than its own place.

**Lotta's Fountain** — `attraction` | Market, Geary and Kearny Streets
- Article 10 **Landmark No. 73**, designated **1975** (`97yj-54sx`).
- NRHP as **"Lotta Crabtree Fountain"**, ref **75000475**, certified **1975-06-20**
  (NPS layer 0). Point at −122.40314015 / 37.78795801.
- DataSF Civic Art `r7bn-7v9c` accession **1875.1**: `artist` **"Anonymous"**,
  `creation_date` **1875**, `medium` "cast iron, bronze, glass",
  `display_dimensions` **"226 x 76 x 76 in."**, `credit_line` "Gift to the City of San
  Francisco by Lotta Crabtree in 1875", `location_description` "On sidewalk, North East Corner
  of Market and Kearney Streets, boarded on the backside by Geary Street".
- **CBD reads `Downtown`, not Union Square BID.** Straddler §3B. Financial District has a
  strong claim.

### 5.2 MAIDEN LANE

**Maiden Lane** — `walk` | between Stockton and Kearny, parallel to Geary and Post
- Union Square Alliance runs weekly programming on it: "Afternoons On Maiden Lane… Starting
  Friday, January 9th, join us for FREE, weekly programming on the Eastern block of Maiden
  Lane in Union Square" (https://www.unionsquarealliance.com/things-to-do, HTTP 200).
- Parcels on the lane, DataSF `3tsw-4idn`: 16 (built 1906), 34–40 (1908), 50–58 (1908),
  60 (1908), 69 (1920), 118–120 (2001), 134 (1910), 140 (1909), 170 (1909), 177 (1907).
  Every one is `A*` with `Article 11 Conservation District` in `ceqacodereason`.
- **Do not write "a short walk", "one street over from Union Square", or any orientation by
  impression.** "Between Stockton and Kearny Streets" is a named-street fact and is fine.

**V. C. Morris Building (Frank Lloyd Wright), 140 Maiden Lane** — `shop` or `historic-site`
- Article 10 **Landmark No. 72**, designated **1975** (`97yj-54sx`, name "V. C. Morris
  Building", address "140 Maiden Lane"). Parcel APN 0309019, `yearbuilt` **1909**,
  `ceqacodea10a11` `A*`, reason "Article 10 Individual Landmark, Article 11 Conservation
  District" (`3tsw-4idn`).
- **NOTE the 1909 in the parcel record is the shell.** Wright's remodelling is 1948–49 and is
  NOT sourced in any dataset fetched here. If you write Wright, you must find a citation; the
  Article 10 designation document link in `97yj-54sx` (`designationdocument.url`) is the place
  to look and was not opened.
- **THE BRIEF IS OUT OF DATE. Xanadu Gallery is gone.** DataSF Registered Business Locations
  `g8m3-pdis`: "Xanadu Gallery LLC", 140 Maiden Lane, `location_start_date` 2009-07-02,
  **`location_end_date` 2015-08-21**. The currently-registered occupant at "140 Maiden Lane" is
  **Isaia Corp**, start **2017-08-22**, no end date. At the "140 Maiden Ln" address string the
  only live registration is "Downtown Properties Vi, LLC" (start 2016-03-18), the landlord.
- So: the building publishes on its landmark number and its architecture. **A named gallery
  tenant does not publish.** Whether Isaia is trading in 2026 is not established by a
  registration record alone — registrations lapse late and start early. See §7.
- Next door, 134 Maiden Lane: "134 Maiden Lane Building" (2005) and **Maison Margiela**
  (start 2017-10-01), both currently registered.

### 5.3 HOTELS

**The Westin St. Francis** — `hotel` | 335 Powell St, San Francisco, CA 94102
- DataSF `3tsw-4idn`, parcel 300–330 GEARY ST, APN 0307001: `yearbuilt` **1904**,
  `ceqacodea10a11` **`A*`**, reason "Article 11 Individual, Article 11 Conservation District,
  Historic Survey Result". **No Article 10 number. No NRHP reference number.** It is not in
  `97yj-54sx` and it is not in the NPS point layer for this envelope. Its only citable
  designation is Article 11, whose district name is unsourced (§4e).
- Business registry `g8m3-pdis`, 335 Powell St, currently registered: "The Westin St Francis"
  (start 1997-12-31), "Westin St Francis (Main)", "(Victor)", "(Oak Room)", "(Bourbon)",
  "(Pastry)", "(Cafe Rito)" (start 2021-04-01), "Westin St Francis Grand Ballrm",
  **"The Clock Bar"** (start 2008-07-01), Chateau Montelena Winery (2016-07-01),
  Victoria's Secret #500, FedEx Office. "(Caruso)" ended 2021-04-01.
- **marriott.com and westinstfrancis.com both return HTTP 403 / redirect to a 403.** No room
  count, no architect, no history from the operator. The Magneta clock, the tower, Bliss &
  Faville — none of it is sourced here.
- What can be written now: the address, the 1904 parcel construction year from DataSF, the
  Article 11 status if §4e is resolved, and that the ground floor carries a Victoria's Secret
  and a FedEx Office. That is a thin entry for the zone's marquee hotel. **Someone should
  retry the operator site from a different agent.**

**Beacon Grand** — `hotel` | 450 Powell St, San Francisco, CA 94102
- Own site (https://www.beacongrand.com/, HTTP 200): address "450 Powell St. San Francisco, CA
  94102"; the **Starlite Room** "atop the hotel", "curated curiosities", cocktails by
  Scott Baird, DJ entertainment. No room count, no architect, no year given.
- DataSF `3tsw-4idn`, 432–462 POWELL ST, APN 0295008: `yearbuilt` **1930**, `A*`,
  "Article 11 Individual, Article 11 Conservation District, Historic Survey Result".
- Business registry: **"Sir Francis Drake Hotel"**, 450 Powell St, ended **2021-03-29**;
  **"Beacon Grand"**, 450 Powell St, start **2022-03-04**, no end date. A second row
  "Sir Francis Drake" runs 2022-02-20 to 2026-06-30.
- The former name is established by the city's own registry, not by folklore. Safe to write.
  **The Beefeater doormen are not sourced.**

**The Clift Royal Sonesta San Francisco** — `hotel` | 495 Geary St, San Francisco, CA 94102
- Own site (https://www.sonesta.com/royal-sonesta/ca/san-francisco/clift-royal-sonesta-hotel,
  HTTP 200): "The Clift Royal Sonesta San Francisco was originally constructed in San
  Francisco's Union Square for the Panama-Pacific International Exposition in 1915" and names
  **"the glamorous Redwood Room"** as a dining venue. No room count, no architect.
- **"originally constructed … for the Panama-Pacific International Exposition in 1915" is an
  operator's history claim about its own building, not a trading-duration claim about the
  business.** It is a construction date, so it is closer to publishable than "since 1908" —
  but it is uncorroborated and the Clift is generally dated 1913. DataSF has no parcel row
  under 495 Geary in the pull made here. **Low confidence. Prefer to omit the year.**
- **Reads Tenderloin on both neighbourhood layers.** Straddler §3A.
- Registry: "Clift", 495 Geary St, start 2001-07-31, **end 2018-05-17** — the pre-Sonesta
  entity. Not evidence of closure; the hotel is trading under a new registration.

**Marines' Memorial Club & Hotel** — `hotel` | 609 Sutter St, San Francisco
- Own site (https://www.marinesmemorial.org/, HTTP 200): **138 guest rooms and suites**;
  **Chesty's Bar & Grill** (rooftop restaurant); the **Marines' Memorial Theatre, 564 seats**;
  a library and museum with military artifacts; ballrooms; swimming pool; gym.
  Founded **1946**. "Marines' Memorial Club is… open to all former, active duty and Veterans
  who served honorably in all branches of the United States Armed Forces." Non-members may
  visit the dining facilities, theatre and hotel as guests.
- Registry: "Marines Memorial Foundation", 609 Sutter St Ste 2m, start 2016-07-01, no end.
- **Reads Lower Nob Hill / Nob Hill and is outside every CBD.** Straddler §3D.
- 138 rooms and 564 seats are counts of ordinary things and publish. "Founded 1946" is a
  trading-duration claim from the operator's own site and **does not publish**.

**Chancellor Hotel on Union Square** — `hotel` | 433 Powell St
- Alliance directory (https://www.unionsquarealliance.com/accommodations, HTTP 200):
  "Chancellor Hotel is one of the few family owned and operated hotels in San Francisco."
- DataSF `3tsw-4idn`, 433 POWELL ST, APN 0296005: `yearbuilt` **1914**, `A*`, "Article 11
  Individual, Article 11 Conservation District, Historic Survey Result".
- Registry: "Chancellor Hotel", 433 Powell St, start **1968-10-01**, no end date.
- 41-layer reads **Nob Hill**. Straddler §3D-adjacent.

**Others from the Alliance accommodations list** (https://www.unionsquarealliance.com/accommodations),
all with address only — thin unless someone fetches the operator sites:
- **Axiom Hotel**, 28 Cyril Magnin Street — "located in a century-old San Francisco building".
  Parcel 25 Cyril Magnin, APN unlisted here; 138 Cyril Magnin is 1908, `A*`, Article 11 CD.
- **citizenM San Francisco Union Square**, 72 Ellis Street. Parcel 72–76 ELLIS,
  `yearbuilt` **2022**, `A*`, "Article 11 Conservation District" — a new building inside the
  conservation district, which is a genuinely interesting fact and is citable.
- **Club Donatello**, 501 Post St — "45 Suites are on the 11th, 12th & 14th Floors".
- **Grand Hyatt San Francisco Union Square**, 345 Stockton St. Parcel APN 0307013 / 0294-block,
  `yearbuilt` **1972**, `A*`, "Article 11 Conservation District". hyatt.com returns HTTP 403.
  **The Ruth Asawa fountain in its plaza is NOT in the SFAC civic art dataset** (it was a
  private commission) — do not assert it without a source. Asawa died 2013; if it is ever
  written about, the photo refinement applies.
- **Kensington Park Hotel**, 450 Post St — parcel APN 0296009, `yearbuilt` **1924**, `A*`,
  "Article 11 Individual, Article 11 Conservation District, Historic Survey Result". The
  building is the old Elks Building; **not sourced here.** 41-layer reads Nob Hill.
- **Handlery Union Square**, 351 Geary St — not fetched.
- **Hotel Nikko**, 222 Mason St — parcel 222 MASON, `yearbuilt` 1987/1988, CEQA `C`
  ("Not 45 years or older"). Not fetched.
- **Hilton Union Square**, 333 O'Farrell — **Tenderloin on all three readings**. §3G. Excluded.

### 5.4 THEATRES AND VENUES

**The Toni Rembe Theater (Geary Theater), A.C.T.** — `theater` | 415 Geary St, San Francisco,
CA 94102
- A.C.T.'s own site (https://www.act-sf.org/your-visit/our-venues, HTTP 200) gives the name
  "The Toni Rembe Theater" and the address "415 Geary Street, San Francisco, CA 94102", and
  lists a second venue, "The Strand Theater, 1127 Market Street, San Francisco, CA 94103", plus
  "30 Grant Studio". **The page gives no capacity, no architect, no year, no landmark claim.**
- Article 10 **Landmark No. 82** as "Geary Theater", designated **1976**, address in the
  register "415 Geary Boulevard & 333 Mason Street" (`97yj-54sx`).
- NRHP as **"Geary Theatre"**, 415 Geary St., ref **75000472**, certified **1975-05-27**
  (NPS layer 0). Note the NRHP listing predates the city landmarking by a year — a sequence, not
  a superlative, and safe to state.
- DataSF `3tsw-4idn`, 415 GEARY ST, APN 0316001A: `yearbuilt` **1909**, `A*`, reason
  "Article 10 Individual Landmark, Article 11 Individual, Article 11 Conservation District,
  **National Register Individual**, Historic Survey Result" — three registers agreeing on one
  parcel row, which is as clean as this material gets.
- Registry: "American Conservatory Theater", 415 Geary St, start **1966-01-01**, no end date;
  also at 30 Grant Ave (1966-01-01) and 1127 Market St (2015-02-20).
- **The Strand at 1127 Market is `LM 0` in `97yj-54sx` — a candidate, not a landmark — and its
  parcel reads South of Market on both layers. Do not claim it.**
- Straddler §3A: both neighbourhood layers read Tenderloin.

**Curran Theatre** — `theater` | 445 Geary St, San Francisco, CA 94102
- DataSF `3tsw-4idn`, 445 GEARY ST, APN 0316018A: `yearbuilt` **1922**, `A*`, reason
  "Article 11 Individual, Article 11 Conservation District, Historic Survey Result".
  **There is NO "National Register Individual" flag and no Article 10 number.** The Curran is
  absent from `97yj-54sx` and absent from the NPS point layer for this envelope.
  **Do not write an NRHP claim for the Curran.** This contradicts a widely repeated belief and
  is exactly the kind of thing wave 1's re-fetch discipline exists to catch — but it should be
  re-checked once more before shipping, because a negative from two datasets is weaker than a
  positive from one.
- Adjacent parcel 459 GEARY, APN 0316018, also 1922, same flags — the theatre's block.
- Now programmed by ATG Tickets / BroadwaySF: `sfcurran.com` redirects into an ATG events site
  which lists the Curran alongside the Golden Gate and Orpheum Theatres and shows a live
  calendar into late 2026 (Chelsea Wolfe 2026-09-16, Laurie Anderson 2026-09-25, Coraline in
  Concert 2026-10-10). **Status: open.** `https://www.sfcurran.com/plan-your-visit/` fails TLS
  handshake; `http://sfcurran.com/` resolves.
- Registry: "Curran Theatre", 445 Geary St, ended 2014-12-31; **"Csh Curran LLC"**, 445 Geary
  St, start 2014-07-29, no end date.
- Straddler §3A.

**Marines' Memorial Theatre** — `theater` | 609 Sutter St | 564 seats (operator's site). Inside
the Marines' Memorial Club. Straddler §3D.

**August Hall** — `theater` or `attraction` | 420 Mason St
- Alliance directory (https://www.unionsquarealliance.com/theaters-galleries, HTTP 200):
  "Live music and entertainment with special events, three full bars, and food by Fifth Arrow…
  August Hall & Fifth Arrow house three distinct rooms and **three lanes of bowling**."
  Phone (415) 872-5745.
- Registry: "August Hall", 420 Mason St, start **2023-08-01**, no end date.
- Three bars, three rooms, three bowling lanes — counts of ordinary things, all publishable.

**Biscuits and Blues** — `restaurant` (live music) | 401 Mason St | (415) 292-2583
- Alliance directory. Registry: "Biscuits And Blues", 401 Mason St, start **1995-01-30**, no
  end date.

### 5.5 THE LANDMARKED COMMERCIAL FABRIC

**Hallidie Building** — `historic-site` | 130–150 Sutter St
- Article 10 **Landmark No. 37**, designated **1971**.
- NRHP ref **71000185**, certified **1971-11-19**.
- `3tsw-4idn`, APN 0288027, `yearbuilt` **1917**, `A*`, "Article 10 Individual Landmark,
  Article 11 Individual, **National Register Individual**, Historic Survey Result".
- **Willis Polk and the glass curtain wall are NOT sourced here.** The usual line — "the first
  glass curtain wall building in the United States" — is a superlative and is banned outright,
  attributed or not. Write the two register numbers and the 1917 construction year and stop.
- Currently registered at 130 Sutter: "130-150 Sutter Bldg" (1974-04-26) and CircleCI
  (2025-01-01).

**Hammersmith Building** — `historic-site` | 303 Sutter St
- Article 10 **Landmark No. 117**, designated **1980**. `3tsw-4idn` APN 0294001,
  `yearbuilt` **1907**, `A*`, "Article 10 Individual Landmark, Article 11 Individual,
  Article 11 Conservation District, Historic Survey Result".
- Registry at 303 Sutter St: **zero currently-registered businesses** (2 historical rows, both
  ended). Vacant ground floor is likely. Do not assert a tenant.

**Four Fifty Sutter Building** — `historic-site` | 450 Sutter St
- NRHP ref **09001118**, certified **2009-12-22** (NPS layer 0, name "Four Fifty Sutter
  Building"). `3tsw-4idn` APN — 450–464 SUTTER, `yearbuilt` **1929**, `A*`,
  "Article 11 Individual, Article 11 Conservation District, **National Register Individual**,
  Historic Survey Result". **No Article 10 number.**
- Timothy Pflueger and the Maya-derived ornament are NOT sourced here. Currently a medical and
  dental building: registry shows Golden State Dermatology Associates (2023-06-19),
  James P Const DDS (1992-08-17), ABM Parking Services, Marchetti Group.
- The Alliance directory lists a **"450 Sutter Garage"**, 450 Sutter Street, 415.421.4444.

**Mechanics' Institute** — `attraction` (library, members' institution) | 57 Post St,
San Francisco, CA 94104
- Article 10 **Landmark No. 134** as "The Mechanics Institute", 57–65 Post Street,
  designated **1981**. `3tsw-4idn` APN 0311013, `yearbuilt` **1909**, `A*`, "Article 10
  Individual Landmark, Article 11 Individual, Historic Survey Result".
- Own site (https://www.milibrary.org/about, HTTP 200): address 57 Post Street, San Francisco,
  CA 94104; **founded 1854**; describes the building as **Beaux Arts**; a chess programme with
  tournaments, scholastic chess, classes and a Grandmaster-in-Residence; a nonprofit public
  benefit corporation, EIN 94-1254644.
  **Hours — Library:** Mon–Fri 10am–6pm (Tue & Thu until 8pm), Sat 10am–5pm, Sun closed.
  **Chess:** Mon–Fri 8:15am–6pm (Tue & Thu until 8pm), Sat 9:30am–5:30pm, Sun closed.
- **BANNED FROM THIS ENTRY:** the site's own phrase "one of the oldest institutions on the West
  Coast" is a superlative. And "founded 1854" from the institution's own site is a
  trading-duration claim: **it does not publish.** The hours and the landmark number do.
- **CBD reads `Downtown`, not Union Square BID.** Straddler §3B — Financial District has a real
  claim at 57 Post.
- Registry: "Mechanics' Institute", 57 Post St, start 1986-05-30, no end date.

**James Flood Building** — `historic-site` | 870–898 Market St
- Article 10 **Landmark No. 154**, designated **1982**. `3tsw-4idn` APN 0329005,
  `yearbuilt` **1907**, `A*`, "Article 10 Individual Landmark, Article 11 Individual,
  Article 11 Conservation District, Historic Survey Result".
- **NAME COLLISION HAZARD:** `flood-mansion-pacific-union-club-nob-hill` is live in the Nob
  Hill file. Different building. Slug and name must not be confusable.
- 41-layer reads **Tenderloin**; CBD reads Union Square BID. Straddler §3B.
- 38 registered business rows at 870 Market, 12 currently live — a working office block, not a
  monument. Longest-running live registration: "Annie's Hot Dogs" (1983-08-10).

**Phelan Building** — `historic-site` | 760–784 Market St | Article 10 **Landmark No. 156**,
designated **1982**. `3tsw-4idn` APN 0328001, `yearbuilt` **1908**, `A*`, "Article 10
Individual Landmark, Article 11 Individual, Article 11 Conservation District, Historic Survey
Result". Straddler §3B.

**Chronicle Building** — `historic-site` | 690 Market St | Article 10 **Landmark No. 243**,
designated **2007**. `3tsw-4idn` APN 0311016 gives `yearbuilt` **2007**, `A*`, "Article 10
Individual Landmark, Article 11 Individual" — **the 2007 is the conversion, not the building.**
Burnham & Root and 1889 are not sourced here. **Write the landmark number, not a year, unless
someone opens the designation document.** Straddler §3B.

**Wells Fargo Union Trust Branch** — `historic-site` | 744 Market St | Article 10
**Landmark No. 131**, designated **1981**. Parcel APN 0312006, `yearbuilt` **1910**, `A*`,
"Article 10 Individual Landmark, Article 11 Individual, Article 11 Conservation District,
Historic Survey Result". Straddler §3B.

**Mutual Savings Bank Building** — `historic-site` | 700 Market St | NRHP ref **13001107**,
certified **2014-01-22** (NPS layer 0). No Article 10 number. Reads Downtown / Union Square on
the 117 layer, Financial District/South Beach on the 41. Straddler §3B.

**Savings Union Bank branch, 1 Grant Avenue** — `historic-site` | Article 10
**Landmark No. 132** ("Savings Union Branch Of Sec.Pac.Natl Bnk"), designated **1981**.
Parcel APN 0313008, `yearbuilt` **1910**, `A*`, "Article 10 Individual Landmark, Article 11
Conservation District, Historic Survey Result". At the corner of Grant and Market. Straddler §3B.
**Chinatown owns `chinatown-grant-avenue` as a street; this is a building, not the street.**

**Home Telephone Company Building** — `historic-site` | 333 Grant Ave (register address);
DataSF's Article 10 parcel is **327 GRANT AVE**, APN 0286026, `yearbuilt` **1908**, `A*`.
Article 10 **Landmark No. 141**, designated **1981**. **The two addresses disagree by six
numbers; write the register's own address (333 Grant Avenue) since that is what carries the
number.**

**Samuel's Clock** — `attraction` | 856 Market St | Article 10 **Landmark No. 77**, designated
**1975**. Parcel APN 0329004, `yearbuilt` **1909**, `A*`, "Article 10 Individual Landmark,
Article 11 Conservation District". A street clock; it is a designed object, and freedom of
panorama arguments do not reach it. Prose only. Straddler §3B.

**The Golden Triangle Light Standards** — `attraction` | Article 10 **Landmark No. 233**,
designated **2003**, register address **"Along the streets bounded by Market, and Sutter
Streets"**. The register's own boundary text is truncated and vague; quote it or paraphrase
minimally. A street-furniture landmark covering the whole retail core — a genuinely good
Union Square subject and one nobody else can claim.

**Dressler or Garfield Building** — `historic-site` | 938–942 Market St | Article 10
**Landmark No. 244**, designated **2004**. 41-layer reads **Tenderloin**. Parcel 944–948 MARKET,
`yearbuilt` 1907, `A*`, "Article 11 Individual, Article 11 Conservation District". Straddler §3B,
and the weakest of the Market Street set for this zone.

**One Montgomery Street (Crocker National Bank Building)** — `historic-site` | 1–25 Montgomery St |
Article 10 **Landmark No. 297**, designated **2022**. Parcels 1 MONTGOMERY (APN 0308-block,
`yearbuilt` 1908) and 25 MONTGOMERY (`yearbuilt` 1921), both `A*` with "Article 10 Individual
Landmark". **CBD reads `Downtown`.** Financial District has the better claim. §3B.

**First Congregational Church** — `historic-site` | 432 Mason St (register) / 491 Post St (parcel)
- Article 10 **Landmark No. 177**, designated **1985**. Parcel APN **0307009**, addressed
  **491 POST ST**, `yearbuilt` **1913**, `A*`, "Article 10 Individual Landmark, Article 11
  Individual, Article 11 Conservation District, Historic Survey Result". APN match confirms the
  two addresses are the same corner building.
- **Registry shows zero business rows at 432 Mason St** — a church, not a business. Expect no
  hours from a city dataset. Do not assert service times without the congregation's own site,
  which was not fetched.
- 41-layer reads **Tenderloin**. Straddler §3A/3F.

**Hunter–Dulin Building** — `historic-site` | 111 Sutter St | NRHP ref **97000348**, certified
**1997-04-17**. No Article 10 number. Reads Downtown / Union Square on the 117 layer,
Financial District/South Beach on the 41. Straddler §3B. Not named in the roster brief; a real
find.

**City of Paris Building** — `historic-site` | 181–199 Geary St | NRHP ref **75000471**,
certified **1975-01-23**. **This is the Neiman Marcus site**, and the NRHP entry is for the
building that stood there; the rotunda was retained in the 1982 replacement. **The relationship
between the NRHP listing and the building standing today is NOT established by anything fetched
here.** See §7 — this is one of the two things most likely to be got wrong.

### 5.6 SHOPS AND DEPARTMENT STORES

**Neiman Marcus San Francisco** — `shop` | 150 Stockton St (registry) / 199 Geary St (registry)
- Registry `g8m3-pdis`, currently registered at **150 Stockton St**: "Neiman-Marcus"
  (start 1982-11-04), "Nm On The Square Cafe" (1982-11-04), **"Nm San Francisco Fee LLC"**
  (start **2025-12-08**), Prada San Francisco (2013-08-08), Chanel, Inc. (2019-11-22).
  At **199 Geary St**: "Neiman-Marcus" and **"Neiman-Marcus/Rotunda"**, both 1982-11-04, no end
  dates.
- The **Rotunda** is named by the city's own business registry, which is a usefully hard source
  for a thing usually cited to travel writing.
- **STATUS RISK.** The 2025-12-08 registration of "Nm San Francisco Fee LLC" at the same address
  is a property-holding entity appearing very recently. No closure is recorded in the registry.
  **Do not write "closing" and do not write "still trading" — write the address and the
  registered names, or leave the store out and write the City of Paris Building instead.**
- Philip Johnson and 1982 are NOT sourced here.

**Macy's Union Square** — `shop` | 170 O'Farrell St
- Registry: "Macy's", 170 O'Farrell St, start **2020-05-29**, no end date; "Macy's Wine Bar"
  (2023-06-22, no end); "Macy's Starbucks" (2020-05-29, no end); "Macys.Com, LLC",
  "Macy's Corporate Services, LLC" — all live. Older rows ("Macys", "Macys West") ended
  2021-09-01, which is a re-registration, not a closure.
- At **251 Geary St** (the men's-store side): **"Cheesecake Factory The"**, start 1999-11-01, no
  end date; "Macys West - Starbucks Coffee" (2020-05-29). "Macys West Stores Inc" at
  120 Stockton St ended 2020-12-30.
- **macys.com returns HTTP 403.** No hours. **STATUS RISK, same shape as Neiman Marcus.**

**I. Magnin & Company Building** — `historic-site` | 251–259 Geary St (register) /
233 Geary St (registry addresses)
- **`97yj-54sx` gives `landmarkno` "0" and `yeardesignated` "0.0". NOT A DESIGNATION.** §4f.
- Parcel status is the citable part. Currently registered at 233 Geary St: **Louis Vuitton**
  (start 2012-01-01, no end) and **Loro Piana San Francisco** (2015-08-14, no end).
- The white-marble cladding is a physical fact anyone can state from the pavement, but this
  file records no source for it. Do not write it.

**Gump's** — `shop` | 250 Post St, San Francisco, CA
- Own site (https://www.gumps.com/, HTTP 200): address "250 Post Street, San Francisco, CA".
  Merchandise: fine jewellery (gold, pearls, diamonds, jade, gemstones), home décor (pillows,
  vases, decorative objects, lamps, faux florals), tabletop and barware, gifts, collectibles,
  estate jewellery. **No hours. No founding statement on the page fetched.**
  `gumps.com/pages/our-story` returns 404.
- Registry: "Gump's", 250 Post St, start **2019-07-31**, no end date. "Gump's Corporation",
  135 Post St, start 1993-07-12, no end date. "Gumps By Mail Inc", 135 Post St, ended
  2022-06-29.
- Parcel 246–250 POST ST, APN 0294009, `yearbuilt` **1908**, `A*`, "Article 11 Individual,
  Article 11 Conservation District, Historic Survey Result".

**Britex Fabrics** — `shop` | 117 Post St / Union Square, San Francisco, CA 94108
- Own site (https://www.britexfabrics.com/pages/about-us, HTTP 200): address "117 Post
  Street/Union Square, San Francisco, CA 94108"; phone 415.392.2910;
  **hours Mon–Fri 11am–4pm PST, first Saturday of each month 11am–4pm PST**;
  stock includes wools, silks, laces, brocades, linens, cottons, rayons, denims,
  **75,000 button styles**, ribbons, trims, silk flowers and appliques; family-owned;
  moved to San Francisco in **1952** by Martin and Lucy Spector after starting "in the garment
  center in New York".
- **BANNED:** "for over 70 years" and "a one of a kind sensory experience" are the site's own
  words and are respectively a trading-duration claim and a superlative. The 1952 relocation is
  also an operator's trading-history claim — **it does not publish.** The hours, the address and
  the 75,000 button styles do.
- Registry confirms the move independently: "Britex Fabrics", **146 Geary St**, start
  1968-10-01, **end 2018-01-01**; "Britex Fabrics", **117 Post St**, start 1968-10-01, no end
  date. The address in the roster brief's era (146 Geary) is stale.

**Apple Union Square** — `shop` | 300 Post St, San Francisco, CA 94108
- Own site (https://www.apple.com/retail/unionsquare/, HTTP 200): "Apple Union Square",
  300 Post Street, San Francisco, CA 94108; hours **10:00 a.m.–8:00 p.m.** weekdays and
  Saturday, **11:00 a.m.–7:00 p.m.** Sunday; free "Today at Apple" sessions bookable online.
  **No architect, no opening year, nothing about the plaza on the page.** Foster + Partners
  and 2016 are not sourced.
- Registry: "Apple Inc", 300 Post St, start **2016-05-21**, no end date; the predecessor
  "Apple Computer", **One Stockton St**, start 2009-01-01, ended **2016-05-21** — the two rows
  hand off on the same day, which is a clean, citable relocation.

**Saks Fifth Avenue, 384 Post St** — **CLOSED.** Registry: "Saks Fifth Avenue", 384 Post St,
start 2014-02-01, **`location_end_date` 2025-05-10**. The 901 Market St row ends the same day.
Currently registered at 384 Post St: "San Fran Post Street Lp" (2022-01-01), **Gucci**
(2011-01-01), ABM Onsite Services-West. Parcel 384–398 POST, APN 0295007, `yearbuilt` 1980,
`A*`, "Article 11 Conservation District, Historic Survey Result".
**Do not write Saks as an open shop.**

**Other live retail rows worth a line, all from `g8m3-pdis`:**
- **Tiffany & Co**, 350 Post St, start 2017-02-01, no end (the earlier "Tiffany And Company" at
  350 Post ran 1968-10-01 to 2017-01-31 — a re-registration, not a move).
- **Burberry Limited**, 110 Geary St Ste 2, start 2024-10-31, no end. The 225 Post St row ended
  2024-08-14 — a move within the zone.
- **Maison Margiela**, 134 Maiden Lane, start 2017-10-01, no end.
- **Acne Studios**, 18–24 Geary Street, (628) 444-3238 (Alliance directory).
- **A. Lange & Söhne Salon**, 140 Geary Street 3rd Floor, (415) 228-9915 — "Appointments are
  strongly recommended" (Alliance directory).
- **Alexander McQueen**, 58 Geary St, ended 2023-06-30. **Closed.**
- **Bloomingdale's** (835/845 Market) ended **2025-04-12**; **Nordstrom** (865 Market) ended
  **2023-08-26**; **Nordstrom Rack** (901 Market) ended 2023-06-30. All three are outside the
  zone on every reading (§3G) and all three are **closed**. Useful negative knowledge.

### 5.7 FOOD AND DRINK

**Sears Fine Food** — `restaurant` | 439 Powell St, San Francisco, CA 94102
- Own site (https://www.searsfinefood.com/, HTTP 200): 439 Powell Street, San Francisco, CA
  94102; **open 7 days a week, 7am–3pm and 5pm–9pm daily**; phone (415) 986-0700.
  Menu: **18 Swedish pancakes**, omelets, eggs Florentine, grilled Angus steak,
  San Francisco cioppino, steamed mussels with garlic toast.
  "Sears was founded in 1938 by Wilbur and Ben Sears."
- **BANNED:** the site's own "World Famous 18 Swedish Pancakes" — "world famous" is a
  superlative. **"Founded in 1938" is a trading-duration claim from the operator: it does not
  publish.** The hours, the address and "eighteen Swedish pancakes to an order" do.
- Registry: "Sears Fine Food", 439 Powell St, start 2004-03-01, no end date.
- 41-layer reads **Nob Hill**. Straddler §3D.

**John's Grill** — `restaurant` | 63 Ellis St, San Francisco, CA 94102
- Own site (https://www.johnsgrill.com/, HTTP 200): "63 Ellis St, San Francisco, CA 94102";
  "Historic San Francisco Steakhouse with Live Jazz Since 1908"; "steaks, seafood, and classic
  cocktails in a historic multi floor dining room with nightly live jazz". **No hours on the
  page fetched. Nothing about Dashiell Hammett or The Maltese Falcon on the page fetched** —
  the Hammett connection everybody repeats is unsourced here.
- **BANNED:** "Since 1908" (trading duration, operator's own site) and "one of the city's most
  iconic destinations" (superlative). "Nightly live jazz" and the address publish.
- **Registry disagreement:** "Johns Grill", 63 Ellis St, start 1974-04-01,
  **`location_end_date` 2012-01-01**. The restaurant's own live site contradicts that. **A
  business-registry end date is NOT proof of closure** — registrations lapse and re-file under
  new entity names. Treat the operator's live site as authority for status and the registry as
  authority only for a *start* or a *name change*. This is the general rule for §5.6 and §5.7.
- Parcel 61–63 ELLIS ST, APN 0329006, `yearbuilt` **1910**, `A*`, "Article 11 Individual,
  Article 11 Conservation District".

**Morton's The Steakhouse** — `restaurant` | 400 Post St. Registry: "Morton's Of
Chicago-Steakhouse", 400 Post St, start 2006-01-03, no end date; "Mortons The Steakhouse",
same address, start 2011-05-01, no end date. Parcel 400 POST, APN 0296006, `yearbuilt` **1909**,
`A*`, "Article 11 Individual, Article 11 Conservation District, Historic Survey Result".

**Alexander's Steakhouse** — `restaurant` | 165 O'Farrell, 3rd Floor | 415-495-1111 (Alliance).
Registry: start **2024-11-07**, no end date. Parcel 165 O'FARRELL, `yearbuilt` **1908**, `A*`,
"Article 11 Conservation District".

**Kin Khao** — `restaurant` | 55 Cyril Magnin St. Registry start **2013-09-17**, no end date.
Parcel 55 CYRIL MAGNIN, `yearbuilt` 1983, CEQA `C`.

**AB Steak** — `restaurant` | 124 Ellis Street | 415-421-9014 (Alliance directory): Korean
steakhouse, in-house dry-aging room, smokeless grills at every table.

**Akiko's Sushi Bar** — `restaurant` | 542A Mason Street | (415) 989-8218 (Alliance).
Parcel 542 MASON, `yearbuilt` **1914**, `A*`, "Article 11 Individual, Article 11 Conservation
District".

**Al Pastor Papi** — `restaurant` | 232 O'Farrell Street (Alliance).
**Amorino Gelato** — `cafe` | 338 Grant Ave | (415) 429-2722 (Alliance).
**Asha Tea House** — `cafe` | 17 Kearny St | (415) 549-3688 (Alliance).
**One65** — `cafe`/`restaurant` | six floors including "One65 bistro, Michelin-starred O' by
Claude Le Tohic, and Elements Bar & Lounge" (Alliance things-to-do page). **"Michelin-starred"
is an award claim from a third party, not the operator's identity — it needs the Michelin Guide
itself as a source, which was not fetched. Do not publish it on the Alliance's word.**
**Tratto at The Marker** — `restaurant` (Alliance things-to-do).
**Roxanne Café** — `restaurant` (Alliance things-to-do).

**Farallon, 450 Post St Fl 4** — registry ends **2020-03-16**. **Closed.** Do not write it.
**Lefty O'Doul's, 333 Geary St** — registry ends **2017-02-01**. **Closed** at that address.

### 5.8 GALLERIES

All from https://www.unionsquarealliance.com/theaters-galleries (HTTP 200), addresses and
phone numbers as the Alliance publishes them; registry status added from `g8m3-pdis`.

- **Caldwell Snyder Gallery** — 341 Sutter St, (415) 392-2299. Alliance: "Founded by Oliver
  Caldwell and Susan Snyder in San Francisco in 1983… representing a roster of over 50 artists
  from the U.S., Europe, and Latin America." Registry: "Caldwell-Snyder Gallery", 341 Sutter St,
  start **1999-09-03**, no end date. Parcel 341 SUTTER, `yearbuilt` 1971, `A*`, Article 11 CD.
- **CK Contemporary** — 246 Powell St, (415) 397-0114. Registry: start 2013-02-15, no end date.
  (The 357 Geary St row ended 2020-03-16.) Alliance's own copy calls the district "historic",
  which is their word, not ours.
- **Christopher-Clark Fine Art** — 272 Post, (415) 397-7781. Alliance: "Specialists in
  paintings, drawings and original prints by artists ranging from Rembrandt to Picasso."
  Parcel 272 POST, `yearbuilt` **1909**, `A*`, Article 11 Individual + CD.
- **Adeeni Design Group** — 391 Sutter, Suite 400, 415-928-4685.

### 5.9 CLUBS — probably not visitable, listed so the arbitrator can rule

- **The Olympic Club**, 524 Post St. Registry: "Olympic Club The", start **1971-01-01**, no end;
  "Olympic Club Cafe The", start 2006-07-01, no end. Parcel 524 SUTTER-block; 41-layer reads
  **Nob Hill**. Private.
- **Bohemian Club**, 624 Taylor St. Registry: "Bohemian Club", start **1985-01-01**, no end date
  (a second row 2017-08-01 to 2019-05-31). Parcel 624 TAYLOR, APN 0297007, `yearbuilt` **1934**,
  `A*`, "Article 11 Individual, Article 11 Conservation District, Historic Survey Result".
  Reads **Lower Nob Hill / Nob Hill**, outside all CBDs. Private, no public access, no hours.
- **Metropolitan Club**, 640 Sutter St. **NRHP ref 04000955** as "Woman's Athletic Club of San
  Francisco", certified **2004-09-10**. Parcel 640–650 SUTTER, APN 0283022, `yearbuilt` **1916**,
  `A*`, "Article 11 Individual, Article 11 Conservation District, **National Register
  Individual**, Historic Survey Result". Registry: "Metropolitan Club", start **1973-11-30**, no
  end date. Reads **Lower Nob Hill / Nob Hill**, outside all CBDs. Straddler §3D.
  A National Register number with no other claimant in this wave — worth a fight.

### 5.10 TRANSIT

**Powell Street Station** — `attraction` | Powell St at Market St. 117-layer Downtown / Union
Square; **41-layer Tenderloin**; Union Square BID. Serves BART and Muni Metro. **No source
fetched for platform counts, opening year or hours.** Thin. Fold into the turntable entry or
find a BART page.

**Sutter–Stockton Garage** — 444 Stockton St, 94108, phone 415-956-8002 / 628-219-3906,
"Always open", bike parking (https://www.sfmta.com/garages-lots-list).
**Ellis–O'Farrell Garage** — 123 O'Farrell St, 94102, 415-765-9069, Mon–Sun 6:00am–10:00pm,
bike parking (same source).
**433 Mason Garage** — 433 Mason Street (Alliance directory; "near the Theatre District").

---

## 6. WHAT I EXPLICITLY COULD NOT GET

Recorded here because a verifier should not repeat the work, and because none of it may appear
in reader-facing prose in any form.

| target | URL | result |
|---|---|---|
| Westin St. Francis operator facts | marriott.com, westinstfrancis.com | **403** (both; westinstfrancis.com 301s to a modules.marriott.com URL which 301s back to the 403) |
| Grand Hyatt Union Square | hyatt.com | **403** |
| Macy's store page | macys.com | **403** |
| Neiman Marcus store page | neimanmarcus.com | **403** |
| SF Travel Union Square | sftravel.com | **403** / 404 |
| Rec & Park Union Square facility page | sfrecpark.org | facility search returns only the first five alphabetical results regardless of query; detail-page IDs are not guessable (338 → Grandview Park, 296 → a Dogpatch community garden) |
| SF Planning Article 10 / Article 11 pages | sfplanning.org/project/article-10-landmarks, /preservation-bulletins, /resource/article-11 | **404** ×3 |
| SF Planning Code Article 11 appendix | codelibrary.amlegal.com | **403** |
| SF Heritage Union Square | sfheritage.org/news/union-square/ | **404** |
| Curran Theatre operator page | sfcurran.com (https), broadwaysf.com/venues/… | **TLS handshake failure** on https; the ATG events site resolves over http but carries no capacity, architect or year |
| A.C.T. venue detail | act-sf.org/about/our-theaters, /visit | **404** ×2; /your-visit/our-venues resolves but gives only names and addresses |
| Union Square Alliance public art & full directory | unionsquarealliance.com | resolves in Python but **fails WebFetch certificate verification**; the directory is JS-paginated and exposes no wp-json or admin-ajax endpoint, so only the first five entries per category are reachable |
| Article 10 designation documents | `designationdocument.url` in `97yj-54sx` | **not opened** — these are the citypln-m-extnl.sfgov.org PDFs and they are where the architects, construction years and boundary descriptions actually live. **The single highest-value unopened source for this zone.** |
| Web search | — | session budget exhausted (200/200) before any Union Square query. All discovery above is direct-URL, DataSF, or NPS. |

---

## 7. LEAST CONFIDENT — in order

1. **140 Maiden Lane's current occupant and whether anyone can walk in.** The roster brief names
   "the Xanadu Gallery in the Frank Lloyd Wright building". The city's business registry says
   Xanadu Gallery LLC ended **2015-08-21** and Isaia Corp has been registered there since
   **2017-08-22**. A live registration is not proof a shop is open — see the John's Grill
   inversion in §5.7, where the registry says closed and the operator says open. **Whatever
   ships must be written about the BUILDING and its landmark number, not about a gallery.**
   This is the finding most likely to embarrass the corpus if ignored.

2. **The Curran Theatre's National Register status.** DataSF's per-parcel record for 445 Geary
   carries "Article 11 Individual, Article 11 Conservation District, Historic Survey Result" and
   **no** "National Register Individual" flag, and the Curran is absent from the NPS point layer
   for a bbox that catches its neighbours at 415 and 495 Geary. Two datasets agree it is not
   individually listed, which contradicts a very widely repeated claim. Two silent datasets are
   weaker evidence than one speaking one. **Re-check before writing anything either way.**

3. **The City of Paris Building / Neiman Marcus relationship.** NRHP **75000471** is certified
   to "City of Paris Building, 181-199 Geary St." in 1975. The store standing there now is
   Neiman Marcus, registered since 1982, with a separate registry row literally named
   "Neiman-Marcus/Rotunda". What survives of the listed building, whether the listing was ever
   amended or delisted, and whether the rotunda is the listed fabric — **none of that is
   established here.** Writing "Neiman Marcus is listed on the National Register" on this
   evidence would be wrong. Write the two as separate facts or write neither.

Also uncertain, one rank down: the Article 11 conservation district's **name** (§4e), and the
Dewey Monument's **1901 vs 1903** date (§5.1).
