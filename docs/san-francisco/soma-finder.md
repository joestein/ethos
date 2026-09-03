# SoMa, San Francisco — FINDER file

Wave 1, San Francisco programme. Research date **2026-09-03**. This is **evidence, not adjudication**.
I am not deciding what ships. A verifier adjudicates; one arbitrator rules ownership of straddlers
across all twelve zones.

**Rulings observed.**

1. *Designation claims publish, with a citation.* Every protection claim below carries a register
   and an identifier — an Article 10 landmark number, an NRHP reference number, an NHL date, or a
   California Historical Landmark number. Where I could not find an identifier I say so and the
   claim must be dropped rather than softened. **§4 separates the designated from the merely
   eligible, and that distinction is the single most dangerous trap in this zone** (§4.4).
2. *No photographs.* `"photos": []` everywhere. I named and linked no image. SoMa is unusually
   dense with public artworks — I found **36** inside the zone — and 17 USC 120(a) does not cover
   any of them. Photo leads and the artwork hazard list are quarantined in §10.
3. *No superlatives, no trip durations, no orientation by impression, no research method in
   reader-facing text, no page self-narration.* Nothing below is drafted prose; it is source
   material. The verifier should read §9 before drafting, because several facts I found are true
   but unwritable in the form the source states them.

---

## 1. Headline numbers

| | |
|---|---|
| Named candidates harvested inside the SoMa family of neighborhoods | **441** |
| — guide-kind candidates (museums, galleries, parks, venues, hotels, worship, artworks…) | 164 |
| — Article 10 landmark records not already in that set | 27 |
| — food and drink candidates for the verifier to triage | 250 |
| Named POIs harvested in the padded bounding box before filtering | 1,400 |
| **Designation identifiers found** | **47** |
| — Article 10 landmark numbers | 20 |
| — NRHP reference numbers | 26 |
| — California Historical Landmark numbers | 1 |
| — of those properties, also National Historic Landmarks | 2 |
| **Straddlers — flagged, NOT resolved by me** | **31** |
| Places the brief expected in SoMa that are closed, gone, or elsewhere | **5** (§6) |

My judgement: **SoMa is a guide, not a town page.** See §8.

The brief anticipated SFMOMA, Yerba Buena Gardens and the MLK Memorial, the Contemporary Jewish
Museum, the Museum of the African Diaspora, the Cartoon Art Museum, South Park and the Old Mint.
**Exactly one of those eight — the Old Mint — is unambiguously in SoMa on every method I ran, open
in a form a visitor can use, and carries a designation identifier.** That is the headline finding
and §5 and §6 are the working.

Per the brief's warning that a high confirmation rate is a warning sign, I over-collected at the
edges deliberately. I expect a large share of the 441 to be rejected: the 250 food-and-drink
candidates are mostly ordinary, the 36 artworks are mostly unphotographable and thinly sourced,
and roughly two dozen of the hotels are single-room-occupancy residential hotels rather than
visitor accommodation (§7.6).

---

## 2. Method

### 2.1 Four independent boundary methods, because SoMa has no agreed edge

The brief warned that SoMa's boundaries are contested and that the arbitration barrier exists for
this. That is an understatement. I ran four methods and **they disagree with each other on the
zone's most famous places**:

| # | Method | Source | What it is |
|---|---|---|---|
| A | **Analysis Neighborhoods** (41 units) | DataSF `j2bu-swwd` | the city's statistical geography |
| B | **SF Find Neighborhoods** (117 units) | DataSF `gfpk-269f` | the city's finer wayfinding geography |
| C | **OSM / Nominatim** | nominatim.openstreetmap.org | the vernacular, as mapped |
| D | **SF Planning's own `neighborhood` attribute** | DataSF `63x5-g3m4` | what the Planning Department calls each historic district |

Methods A and B are **published by the same authority from the same portal** and they contradict
each other. That is not my inference; it is reproducible:

```
                                         A: Analysis Nbhd            B: SF Find
SFMOMA, 151 Third St                 Financial District/South Beach  South of Market
Yerba Buena Gardens, 750 Howard      Financial District/South Beach  South of Market
Contemporary Jewish Museum           Financial District/South Beach  South of Market
Museum of the African Diaspora       Financial District/South Beach  South of Market
Moscone Center, 747 Howard           Financial District/South Beach  South of Market
Yerba Buena Center for the Arts      Financial District/South Beach  South of Market
Children's Creativity Museum         Financial District/South Beach  South of Market
St Patrick's Church, 756 Mission     Financial District/South Beach  South of Market
Salesforce Park, 425 Mission         Financial District/South Beach  South of Market
Old U.S. Mint, 88 Fifth St           South of Market                 South of Market
```

**The DataSF "South of Market" analysis polygon stops short of Yerba Buena entirely.** Its bounding
box is lon −122.41870…−122.39275, lat 37.76924…37.78574 — 111 vertices, one ring. Everything north
and east of that, including the whole museum cluster the brief calls SoMa's marquee, falls into a
composite unit named **"Financial District/South Beach"**. Method B, from the same portal, puts all
of it in South of Market and reserves separate units for **South Beach**, **Rincon Hill** and
**Mission Bay**.

Method C agrees with B in structure but not in labelling. Nominatim nests its districts, and its
`display_name` strings put *Financial District* **inside** *South of Market*:

- Yerba Buena Gardens → `Yerba Buena Gardens, 750, Financial District, South of Market, San Francisco`
- Salesforce Park → `Salesforce Park, Financial District, South of Market, San Francisco`
- Rincon Center → `Rincon Center, Financial District, South of Market, San Francisco`
- Strand Theatre → `Strand Theatre, 1127, Market Street, West SoMa, Civic Center, South of Market`
- Hotel Utah → `Hotel Utah Saloon, 500, 4th Street, Mission Bay, South of Market`
- Oracle Park → `Oracle Park, 24, Willie Mays Plaza, South Beach, Mission Bay`

Its `neighbourhood` field, though, returns the *finest* unit, and for the Yerba Buena museums that
is **Union Square** — a third answer again for CJM, MoAD, YBCA and the California Historical
Society building.

Method D is the tie-breaker I trust most for the historic fabric, because it is SF Planning
describing its own designations in prose. It labels the **South End Historic District** —
whose polygon tests 82% Financial District/South Beach under method A — as
`"neighborhood": "South of Market"`.

**I have not resolved this. The arbitrator must, with all twelve zones in front of it.** §5 lists
every affected place with all four readings.

### 2.2 Geometry, not centroids

For every polygon feature I tested **every vertex** and report the share falling in each unit, not
just the centroid. Where a feature is a point I say so. The Article 10 landmark layer ships
MultiPolygon parcel geometry, so shares are real; the NPS point layer ships one point per listing
and its placement is unreliable (§2.4).

Ray-casting point-in-polygon locally against both DataSF layers: no rate limit, no network per
lookup, deterministic.

### 2.3 A sign error I caught, and how

My first pass cut the vernacular SoMa boundary along Market Street with a half-plane test through
the street's two endpoints. It classified **Union Square, Grant Avenue and Sutter Street** — all
plainly north of Market — as SoMa, and the count of "SoMa" candidates came out plausible. The
inequality was inverted. I caught it only because I printed the classification for a named place I
already knew the answer for. Anyone repeating this should sanity-check against a known point before
trusting a run; the failure mode is a clean, plausible-looking, wholly wrong answer.

### 2.4 The NPS point layer places things in the wrong neighborhood

`nrhp_locations/MapServer/0` returned 72 points in my bounding box. Its coordinates are generalised
and several are simply wrong: the **Coffin–Redington Building** (301 Folsom St) and the **Folger
Coffee Company Building** (101 Howard St) both plot into **Nob Hill**, about two kilometres from
their addresses. **I assigned NRHP listings by street address, not by NPS point geometry**, and the
verifier should do the same. The polygon layer (`MapServer/1`) is reliable and is where the
districts and the two National Historic Landmarks live — the Old Mint is absent from the point
layer entirely and would be missed by a points-only search.

### 2.5 Sources that answered

| Source | Result |
|---|---|
| DataSF Socrata API (`data.sfgov.org`) | 200 — all datasets below returned |
| Socrata discovery API (`api.us.socrata.com`) | 200 — needs `search_context`, not `domains`, or it returns zero |
| NPS `mapservices.nps.gov` NRHP layers 0 and 1 | 200 |
| Nominatim | 200, then 429 after ~35 requests |
| Overpass (`overpass-api.de`) | 504 twice, then 200 |
| en.wikipedia.org API | 200 in 20-title batches; 429 on single-title loops |
| sfmoma.org, thecjm.org, moadsf.org, ybca.org, cartoonart.org, yerbabuenagardens.org, streetcar.org, bookbindersmuseum.org, somarts.org, moscone.com, sf-eagle.com, localbrewingco.com, creativity.org, pier24.org | 200 |
| `californiahistoricalsociety.org` | **NXDOMAIN — the domain does not resolve.** Do not cite it. See §6.4 |
| `creativity.org/visit/`, `pier24.org/visit/` | 404 — content found at the site root and `/about/` |

DataSF datasets used: `97yj-54sx` (Article 10 landmarks, 370 records), `rzic-39gi` (Landmarks,
richer: architect, year built, style, criteria, NR status, 362 records), `63x5-g3m4` (Historic
Districts, 200 records), `knm6-5ej6` (Landmark Districts), `j2bu-swwd` (Analysis Neighborhoods),
`gfpk-269f` (SF Find Neighborhoods), `3mea-di5p` (EAS addresses).

**The two landmark dataset IDs the roster records as 404s are wrong identifiers, not a dead host.**
The working ones are above.

### 2.6 A Wikipedia redirect trap

`Strand Theatre (San Francisco)` **redirects to `American Conservatory Theater`**, whose infobox
describes the **Geary Theater at 415 Geary Street** — San Francisco Landmark No. 82, NRHP-added
27 May 1975, Bliss & Faville, 1910. That building is in the **Tenderloin**. The Strand at
**1127 Market Street** is a different building that A.C.T. also operates. Anyone reading the
redirect target's infobox will attach the Geary Theater's landmark number and architect to the
Strand. **They are not the same building and the Strand carries no landmark number at all** (§4.4).

---

## 3. What is already taken — checked, no conflict

I ran the corpus census before claiming anything. `.superpowers/taken_slugs.py` **only globs
`priv/seed_data/rome/*.json`** and reports Rome alone, so it does not answer the corpus-wide
question its docstring claims; I scanned all eight seed directories directly instead.

```
bronx     13 files   136    brooklyn  69 files   434    connecticut 165 files 1352
manhattan 38 files   322    queens    21 files   398    rome         31 files 1279
destinations 13 files   0    san_francisco 0 files   0            TOTAL 3921
```

`priv/seed_data/san_francisco/` holds only `.gitkeep`. I tested **98 candidate slugs** for this
zone against all 3,921 owned slugs and against owned place *names*: **zero collisions**.

The Oracle Park code seed (`lib/ethos/seeds/oracle_park_places.ex`) owns exactly the seven slugs
the brief names — `oracle-park`, `reds-java-house`, `momos-san-francisco`,
`flour-and-water-pizza-shop-mission-rock`, `arsicault-bakery-mission-rock`,
`blue-bottle-coffee-mission-rock`, `china-basin-park`, all with `town: "San Francisco"`. I verified
this by reading the module, not by trusting the brief. **I claim none of them.** One adjacent place
is *not* in that list and is therefore unclaimed — the **Third Street Bridge** (§5.4).

---

## 4. Designation identifiers — 48 found

### 4.1 Article 10 landmarks with numbers, in the SoMa family (19)

Every row here can carry a publishable designation sentence. `find` is method B, `analysis` is
method A. Source for all: DataSF `97yj-54sx` and `rzic-39gi`.

| LM | Name | Address | Designated | Built | Architect / style | B | A |
|---|---|---|---|---|---|---|---|
| **236** | The Old U.S. Mint | 88 Fifth St | 2003 | 1869–1874 | Alfred B. Mullett; Greek Revival | SoMa | SoMa |
| **120** | St. Joseph's Catholic Church | 1401 Howard St & 240 10th St | 1980 | 1913 | John J. Foley; Gothic Revival | SoMa | SoMa |
| **199** | Jackson Brewery Co. Complex | 1475 Folsom St & 315–333 14th | 1991 | 1912 | James T. Ludlow; Kaufman & Edwards; Romanesque Revival | SoMa | SoMa |
| **246** | James Lick Baths / People's Laundry | 165 Tenth St | 2004 | 1906 | Wright & Sanders; Richardsonian Romanesque | SoMa | SoMa |
| **280** | New Pullman Hotel | 228–248 Townsend St | 2018 | 1909 | — ; Classical Revival | SoMa | SoMa |
| **282** | Hotel Utah | 500–504 Fourth St | 2018 | 1908 | — ; Classical Revival / Edwardian | SoMa | SoMa |
| **321** | Mint Mall and Hall | 951–957 Mission St | 2025 | — | — | SoMa | SoMa |
| **295** | San Francisco Eagle Bar | 396–398 Twelfth St | 2021 | 1906 | Unknown; Commercial | SoMa | **Mission** |
| **248** | Juvenile Court and Detention Center | 150 Otis St | 2006 | 1914 | Louis Mullgardt; American Renaissance | SoMa | **Mission** |
| **4** | Saint Patrick's Church | 748 Mission St | 1968 | 1872 | — ; Gothic Revival | SoMa | **FD/SB** |
| **87** | Jessie St. Substation | 220–226 Jessie St | 1977 | 1907 | Willis Polk; Classical Revival | SoMa | **FD/SB** |
| **18** | Palace Hotel, Garden Courtyard | 633–665 Market St | 1969 | 1909 | Trowbridge & Livingston; George Kelham | SoMa | **FD/SB** |
| **278** | Phillips Building | 234–246 First St | 2018 | 1930 | Henry H. Meyers & George R. Klinkhardt; Art Deco | SoMa | **FD/SB** |
| **101** | Oriental Warehouse | 620–650 First St | 1977 | 1867 | — ; Brick Vernacular Warehouse | **South Beach** | FD/SB |
| **281** | Piledrivers, Bridge & Structural Ironworkers | 457 Bryant St | 2018 | 1909 | — ; Classical Revival | **South Beach** | FD/SB |
| **194** | Third Street Bridge | Third St over Mission Channel | 1989 | 1931 | Strauss Engineering Corp. (Joseph Strauss) | **South Beach** | **Mission Bay** |
| **229** | Garcia and Maggini Warehouse | 128 King St | 2002 | 1913 | Unknown; Utilitarian | **South Beach** | **Mission Bay** |
| **157** | Hills Brothers Coffee Plant | 2 Harrison St | 1982 | 1924 | George Kelham; Romanesque Revival | **Rincon Hill** | FD/SB |
| **149** | F.V. Wilbert Tool Manufacturing Shop | 443–449 Folsom St | 1982 | 1911 | — ; Mission Revival | **Rincon Hill** | FD/SB |

`LM 200 Path of Gold Light Standards` (designated 1991, 1908, Beaux Arts) is listed at
"1–2490 Market Street" and its geometry runs the whole length of Market: **Financial District/South
Beach 31% / Castro-Upper Market 24% / Tenderloin 13% / Mission 13% / South of Market 10% / Hayes
Valley 9%.** It is a shared linear feature belonging to no single zone. Not counted above.

### 4.2 National Register reference numbers (24)

Assigned by street address, per §2.4. Source: NPS `nrhp_locations` layers 0 and 1.

**Inside SoMa on method B:**

| NRHP ref | Name | Address | Note |
|---|---|---|---|
| **66000231** | Old U.S. Mint | Fifth and Mission Sts | **National Historic Landmark**, designated 4 July 1961; NRHP listed 15 Oct 1966 |
| **71000188** | U.S. Post Office and Courthouse | NE corner Seventh and Mission Sts | **National Historic Landmark** |
| **74000555** | Jessie Street Substation | 222–226 Jessie St | = the CJM's historic core; SF Landmark 87 |
| **82002250** | St. Joseph's Church and Complex | 1401–1415 Howard St | SF Landmark 120 |
| **93000284** | Jackson Brewing Company | 1475–1489 Folsom St, 319– | SF Landmark 199 |
| **00001622** | Haas Candy Factory | 54 Mint St | |
| **86003492** | Hale Brothers Department Store | 901 Market St | |
| **01000490** | Hale Brothers Department Store (Boundary Increase) | 36 Fifth St, 423–27 & 429 Stevenson St | |
| **83001233** | National Carbon Company Building | 599 Eighth St | |
| **99000581** | Building at 465 Tenth St | 465 Tenth St | |
| **100009717** | Western Manufacturing Company Building | — | address not populated in the NPS record |
| **11000182** | San Francisco Juvenile Court and Detention Home | 150 Otis St | SF Landmark 248 |
| **99000894** | Second and Howard Streets District | 121–198 2nd, 579–612 Howard, 116 Natoma, 111–163 New Montgomery | district |
| **86000729** | Market Street Theatre and Loft District | 982–1112 & 973–1105 Market, 1 Jones, 1–35 Taylor | district; straddler (§5.3) |

**On the SoMa/Financial District and SoMa/South Beach seams:**

| NRHP ref | Name | Address |
|---|---|---|
| **79000528** | Audiffred Building | 1–21 Mission St (SF Landmark 7) |
| **79000537** | Rincon Annex | 101–199 Mission St (SF Landmark 107) |
| **96000679** | Folger Coffee Company Building | 101 Howard St |
| **01000028** | Coffin–Redington Building | 301 Folsom St / 300 Beale St |
| **10001108** | Rialto Building | 116 New Montgomery St |
| **100006911** | Hobart Building | 582–592 Market St (SF Landmark 162) |
| **13001107** | Mutual Savings Bank Building | 700 Market St |
| **04000327** | Building at 735 Market Street | 735 Market St |
| **100004869** | Gran Oriente Filipino Hotel | — (SF Find: South Beach) |
| **05000001** | Baker and Hamilton | 601 Townsend St |

Also intersecting the zone: **00000525** San Francisco–Oakland Bay Bridge, and **06000372** Port of
San Francisco Embarcadero Historic District.

### 4.3 Other registers

**California Historical Landmark No. 875** — the Old San Francisco Mint. This is a fourth register
for the same building, which therefore supports the strongest designation sentence available in the
zone: Article 10 landmark number, NRHP reference number, NHL date and CHL number, all citable.

### 4.4 THE TRAP — eligible is not designated, and number 0 is not a number

Two separate hazards, and both produce sentences that read like designation claims and would fail
the gate or, worse, pass it while being false.

**(a) `landmarkno = 0` means the property is not an Article 10 landmark.** The layer is named
"Landmarks Listed in Article 10" but carries candidate and survey records with `landmarkno` 0 and
`yeardesignated` 0.0. The list includes the Alcoa Building, the Fillmore Auditorium and the Peace
Pagoda — none of which is an Article 10 landmark. **Eight such records fall in the SoMa family:**

| Name | Address | Status |
|---|---|---|
| Delta House / Bayanihan House | 88 Sixth St | **not designated** |
| Strand Theater | 1127 Market St | **not designated** |
| SF Galvanizing Works | 1170–1180 Harrison St | **not designated** |
| Southern Police Station | 360 Fourth St | **not designated** |
| Mattachine Society Headquarters | 188 Minna St | **not designated** |
| Sailor's Union of the Pacific Hall | 450 Harrison St | **not designated** |
| Gran Oriente Filipino Complex | — | **not designated** (but the *Hotel* is NRHP 100004869) |
| Orders of Foresters / Baha'i Temple | 170 Valencia St | **not designated** |

**No designation sentence may be written for any of these eight.** The Mattachine Society
headquarters and Delta House are exactly the kind of place a writer will reach for a landmark claim
about, and there is none to make.

**(b) Historic districts marked `Eligible` are not listed.** DataSF `63x5-g3m4` carries `cr`
(California Register), `nr` (National Register) and `a10` (Article 10) status separately. In SoMa:

| District | a10 | nr | cr | Period | Publishable? |
|---|---|---|---|---|---|
| **South End Historic District** | **Listed** (Ord. 104-90, adopted 23 Mar 1990) | Listed | Listed | 1867–1935 | **Article 10 claim only** — see below |
| **Clyde and Crooks Historic District** | **Listed** | No | Eligible | 1906–1935 | Article 10 claim; 100% SoMa on method A |
| **Market Street Masonry Historic District** | **Listed** (2011.0705) | No | Eligible | 1911–1925 | Article 10 claim |
| Market Street Theatre and Loft HD | No | **Listed** | Listed | 1889–1930 | NRHP **86000729** |
| Second and Howard Streets HD | No | **Listed** | Listed | 1906–1912 | NRHP **99000894** |
| **SoMa LGBTQ Historic District** | No | **No** | Eligible | c.1950s–c.1990s | **NO designation claim** |
| South Park Historic District | No | **Eligible** | Eligible | 1854–1935 | **NO designation claim** |
| South End Historic District Addition | No | Eligible | Eligible | 1906–1935 | **NO designation claim** |
| Western SoMa Light Industrial and Residential HD | No | Eligible | Eligible | 1906–1936 | **NO designation claim** |
| Sixth Street Lodging House HD | No | Eligible | Eligible | 1870–1947 | **NO designation claim** |
| New Montgomery–Mission–Second Street Conservation District | Article **11**, not 10 | No | No | 1906–1929 | conservation district, not a landmark district |

**A conflict the verifier must not paper over.** DataSF says the South End Historic District is
`nr = "Listed"`. **The NPS National Register dataset contains no such district** — I queried both
the point and polygon layers over a tight box around South Park and got only the Port of San
Francisco Embarcadero HD, the Second and Howard Streets District and the Bay Bridge. So the
National Register claim for South End is **unconfirmed against the National Register itself**.
The Article 10 claim is solid — Ordinance 104-90, adopted 23 March 1990, 78 properties of which 56
contributing — and that is the one to write. Do not write "listed on the National Register" for
South End on DataSF's word alone.

Likewise **South Park Historic District is Eligible only, on both registers.** The brief names
South Park as a likely subject; the *place* is writable, the *designation* is not.

---

## 5. STRADDLERS — 31, flagged and NOT resolved

The arbitrator decides. B = SF Find (117 units), A = Analysis Neighborhoods (41 units),
C = Nominatim `neighbourhood`.

### 5.1 The Yerba Buena cluster — nine places, and the two city layers disagree on every one

This is the central boundary question of the zone and it is not a marginal one: it is the entire
museum quarter the brief calls SoMa's marquee.

| Place | Address | B | A | C |
|---|---|---|---|---|
| San Francisco Museum of Modern Art | 151 Third St | **South of Market** | FD/South Beach | — |
| Yerba Buena Gardens | 750 Howard St | **South of Market** | FD/South Beach | Financial District |
| Contemporary Jewish Museum | 736 Mission St | **South of Market** | FD/South Beach | Union Square |
| Museum of the African Diaspora | 685 Mission St | **South of Market** | FD/South Beach | Union Square |
| Yerba Buena Center for the Arts | 701 Mission / 700 Howard | **South of Market** | FD/South Beach | Union Square |
| Moscone Center | 747 Howard St | **South of Market** | FD/South Beach | Financial District |
| Children's Creativity Museum | 221 Fourth St | **South of Market** | FD/South Beach | Union Square |
| Saint Patrick's Church (SF Landmark 4) | 748 Mission St | **South of Market** | FD/South Beach | — |
| Martin Luther King Jr. Memorial | in Yerba Buena Gardens | **South of Market** | FD/South Beach | — |

**One campus is split down the middle by method A.** The Yerba Buena Ice Skating Center and the
Yerba Buena Bowling Center sit on the Moscone roof deck inside Yerba Buena Gardens. Method A puts
those two in **South of Market** and the gardens they stand in, sixty metres away, in **Financial
District/South Beach**. Method B puts all three in South of Market. Whatever the arbitrator rules,
it should not be a rule that separates the ice rink from the garden it is built on.

The roster's own `draw` for `soma` names SFMOMA, Yerba Buena Gardens, the Contemporary Jewish
Museum, the Museum of the African Diaspora and South Park. That is method B's reading exactly, and
it is also the reading the `financial-district` roster entry supports by *not* naming any of them —
its draw is the Transamerica Pyramid, the Ferry Building, Jackson Square, the Wells Fargo History
Museum and Embarcadero Plaza, all north of Market. I record that as evidence of intent. **It is
still not my call.**

### 5.2 The South Beach seam — six places both city layers keep out of "South of Market"

| Place | Address | B | A |
|---|---|---|---|
| **South Park** | between Second, Third, Bryant, Brannan | **South Beach** | FD/South Beach |
| Oriental Warehouse (SF Landmark 101) | 620–650 First St / 650 Delancey St | **South Beach** | FD/South Beach |
| Piledrivers & Structural Ironworkers (SF Landmark 281) | 457 Bryant St | **South Beach** | FD/South Beach |
| Gran Oriente Filipino Masonic Temple / Hotel (NRHP 100004869) | 95 Jack London Alley | **South Beach** | FD/South Beach |
| 21st Amendment Brewery | 563 Second St | **South Beach** | FD/South Beach |
| South End Historic District (Art. 10, Ord. 104-90) | 2nd/Townsend/South Park | 82% FD/SB by geometry | **SF Planning calls it "South of Market"** |

**South Park is the sharpest single case in the zone.** The brief names it as a SoMa subject. Both
DataSF layers place it outside the "South of Market" polygon — method B calls it South Beach.
Nominatim, however, returns `South Park, South of Market, San Francisco`. Method D calls the
historic district around it South of Market. Three of four say SoMa; the city's statistical layer
says otherwise. There is no `south-beach` zone in the roster, so if South Park is not SoMa's it is
nobody's.

### 5.3 The Market Street seam — the zone's north edge is a street, and streets have two sides

| Feature | Evidence | Contested with |
|---|---|---|
| **Market Street Theatre and Loft HD** (NRHP 86000729) | geometry **Tenderloin 60% / South of Market 40%** | Tenderloin — which is not a roster zone at all |
| **Path of Gold Light Standards** (SF Landmark 200) | six-way split, no majority | five other zones |
| Strand Theater, 1127 Market St | A: SoMa; C: `West SoMa, Civic Center, South of Market` | Civic Center / Tenderloin |
| Palace Hotel (SF Landmark 18), 633–665 Market St | B: SoMa; A: FD/South Beach | Financial District |
| Hobart Building (NRHP 100006911), 582–592 Market St | south side of Market | Financial District |
| Mutual Savings Bank (NRHP 13001107), 700 Market St | south side of Market | Financial District / Union Square |
| Building at 735 Market Street (NRHP 04000327) | south side of Market | Financial District / Union Square |
| Hale Brothers Department Store (NRHP 86003492), 901 Market St | A: SoMa | Union Square |
| Four Seasons, 757 Market St | B: SoMa | Union Square |
| Yerba Buena Lane, Mint Plaza | pedestrian cuts between Market and Mission | Union Square |

**The Tenderloin is not a roster zone.** Neither is South Beach, Rincon Hill, Civic Center or Mid-
Market. Every place that method A assigns to the Tenderloin — including the whole 60% majority of
the Market Street Theatre and Loft Historic District — has no page to belong to unless SoMa or
Union Square takes it. That is a coordination problem above my level and I flag it rather than
solve it.

### 5.4 The Mission Bay and Mission seams

| Place | B | A | Note |
|---|---|---|---|
| **Third Street Bridge** (SF Landmark 194, Strauss, 1931) | South Beach | **Mission Bay** | stands at Oracle Park's door; **not** one of the seven code-seed slugs, so unclaimed |
| Garcia and Maggini Warehouse (SF Landmark 229) | South Beach | **Mission Bay** | 128 King St |
| New Pullman Hotel (SF Landmark 280) | SoMa | SoMa | but Nominatim returns Mission Bay for 228 Townsend |
| Hotel Utah (SF Landmark 282) | SoMa | SoMa | Nominatim returns `Mission Bay, South of Market` |
| **San Francisco Eagle Bar** (SF Landmark 295) | **South of Market** | **Mission** | 398 12th St; A says Mission, B says SoMa |
| Juvenile Court & Detention Center (SF Landmark 248, NRHP 11000182) | **South of Market** | **Mission** | 150 Otis St |
| Jackson Brewery Co. (SF Landmark 199, NRHP 93000284) | SoMa | SoMa | but NPS point plots it into Mission |
| DNA Lounge, 375 Eleventh St | SoMa | SoMa | Nominatim: `West SoMa`; 11th St is the Mission seam |
| SoMa LGBTQ Historic District | — | **SoMa 70% / Mission 24% / FD-SB 5%** | eligible only, no claim |
| Western SoMa Light Industrial HD | — | **SoMa 72% / Mission 28%** | eligible only, no claim |

### 5.5 The Rincon Hill / Embarcadero seam

Hills Brothers Coffee Plant (SF Landmark 157), F.V. Wilbert Tool Manufacturing Shop (SF Landmark
149), Salesforce Tower, Salesforce Park, Rincon Center / Rincon Annex (SF Landmark 107, NRHP
79000537), the Audiffred Building (SF Landmark 7, NRHP 79000528), the San Francisco Railway Museum
and Rincon Park with Cupid's Span. Method B splits these between **Rincon Hill** and **Financial
District**; method C nests both inside South of Market; method A calls them all FD/South Beach.
Rincon Hill is not a roster zone.

---

## 6. Places the brief expected in SoMa that are closed, gone, or elsewhere

**These are the most consequential findings in this file.** Four institutions the brief or the
roster points at are not operating, and the OSM data still lists all of them. A writer working from
the map alone would publish four museums that a visitor cannot enter.

### 6.1 The Contemporary Jewish Museum is closed

`thecjm.org` front page: **"THE CJM IS TEMPORARILY CLOSED."** The visit page carries no hours and
states the museum is temporarily closed as of **15 December 2024**. No reopening date is given.
Wikipedia's infobox corroborates: `established = 1984 (On hiatus December 15, 2024)`.

The building at 736 Mission Street is Daniel Libeskind's 2008 addition wrapped around the **Jessie
Street Substation** — Willis Polk, 1907, **San Francisco Landmark No. 87** (designated 1977),
**NRHP 74000555**. So the *building* is fully citable and the *museum* is shut. The verifier must
decide whether a closed museum is a place; if it is written at all, it must be written as a
building with a designation, not as a visitable museum, and no hours may be given.

### 6.2 The Cartoon Art Museum is closed and was never in SoMa

`cartoonart.org/visit`: **"Our last day will be Sunday, August 2, 2026"**, and the location "will be
closed as of August 3, 2026", with "Stay tuned as we figure out our next steps." Today is
3 September 2026, so it is **closed with no successor address**.

It is also **not in SoMa**. Its address was **781 Beach Street, San Francisco 94109** — method A
returns **Russian Hill**, Nominatim returns **Fisherman's Wharf**. It left its 655 Mission Street
premises years before. **Two independent disqualifications.** It should not appear in any San
Francisco file, and Fisherman's Wharf should be told it is gone rather than discovering the empty
unit.

### 6.3 Pier 24 Photography is permanently closed

`pier24.org/about/`: **"As of February 1, 2025, Pier 24 Photography is permanently closed to the
public."** OSM still carries it as a museum at Pier 24, The Embarcadero, 94105. Method B places it
in **Rincon Hill**, not South of Market, so it is a straddler as well as a closure.

### 6.4 The California Historical Society has dissolved

Its own domain, `californiahistoricalsociety.org`, **does not resolve — NXDOMAIN**. It must not be
cited as a source or linked as a website, and OSM still carries that URL against the building at
678 Mission Street. Wikipedia records that in **January 2025 it announced it was closing** and that
**Stanford University would acquire its collections**, administered as the California History
Collection at Stanford in association with the Bill Lane Center for the American West; and that in
**June 2024 the 20,000-square-foot headquarters at 678 Mission Street was sold** for nearly
$6.7 million. The society was established in **1871**.

**This has a knock-on effect on the Old Mint.** The California Historical Society was the body that
in **April 2016 agreed to undertake restoration of the Old Mint and its preservation as a public
space**. With the society dissolved, the Old Mint has no museum operator: "Until a new tenant is
found, the Old Mint will continue to be used for special events, some open to the public."
**The Old Mint is not a museum a visitor can walk into**, and no hours exist to publish.

### 6.5 Local Brewing Co. has left its listed address

`localbrewingco.com`: **"We were forced out of our Bluxome St. brewery due to building fire in
2022."** No current address is given on the site. The OSM record at 69 Bluxome Street is stale.
It was the only `brewery`-tagged POI in the zone.

### 6.6 One that survives the check, and is genuinely open

**The Museum of the African Diaspora** is temporarily closed for exhibition installation **through
29 September 2026 and reopens 30 September 2026** — within weeks of this file. Hours on reopening:
Mon closed; Tue–Wed, Fri–Sun 11am–5pm; Thu 12pm–8pm. Admission $15 adult, $7 senior/student/
educator, under-12 free, free to all on the second Saturday of each month. Address **685 Mission
Street (at Third), San Francisco 94105**, on the ground floor of the St. Regis.

---

## 7. The candidate register

Status column: **OPEN** verified this session against the operator's own site; **CLOSED** likewise;
*(unverified)* means I harvested it but did not confirm current operation.

### 7.1 Museums and public collections (8 harvested, 4 usable)

| Name | Address | Status | Facts and sources |
|---|---|---|---|
| **San Francisco Museum of Modern Art** | 151 Third St, 94103 | **OPEN** | Mon–Tue 10–5, Wed closed, Thu 12–8, Fri–Sun 10–5. $30 adult, $25 senior 65+, $23 student, 18 and under free. `sfmoma.org/visit`. Architects **Mario Botta, 1995** and **Snøhetta, 2016**; established 1935 (en.wikipedia). **Straddler §5.1** |
| **Museum of the African Diaspora** | 685 Mission St, 94105 | **OPEN 30 Sep 2026** | hours and prices §6.6. `moadsf.org/visit`. **Straddler §5.1.** See §9.2 on its founding year |
| **Children's Creativity Museum** | 221 Fourth St, 94103 | **OPEN** | Wed–Sun 10am–4pm. `creativity.org`. In Yerba Buena Gardens; the **LeRoy King Carousel** is a separate OSM feature under the same operator. **Straddler §5.1** |
| **American Bookbinders Museum** | 355 Clementina St, 94103 | **OPEN** | Tue–Sat 10am–4pm. $15 adult, $12 senior 62+ and youth 10–17, under 10 free. Self-guided audio tour, wheelchair accessible. `bookbindersmuseum.org/visit`. **Method A and B both say South of Market — one of the few clean ones** |
| Contemporary Jewish Museum | 736 Mission St | **CLOSED** §6.1 | building: SF Landmark 87, NRHP 74000555, Willis Polk 1907, Libeskind 2008 |
| Pier 24 Photography | Pier 24, The Embarcadero | **CLOSED** §6.3 | |
| California Historical Society | 678 Mission St | **DISSOLVED** §6.4 | |
| International Art Museum of America | 1025 Market St | *(unverified)* | Q18325665 |

### 7.2 Arts centres, galleries and theatres

| Name | Address | Status | Note |
|---|---|---|---|
| **Yerba Buena Center for the Arts** | 701 Mission St (galleries) / 700 Howard St (theatre), 94103 | **OPEN** | Wed 11–8, Thu–Sun 11–5, Mon–Tue closed. Free members and under-18, $10 adult, $5 student/senior, free to all Wednesdays. **Gallery & Forum by Fumihiko Maki; theatre by James Polshek and Todd Schliemann** (`ybca.org/visit`). Established 1993 (en.wikipedia). **Straddler §5.1** |
| **SOMArts Cultural Center** | 934 Brannan St, 94103 | **OPEN** | Thu 3–7, Fri 12–7, Sat–Sun 12–5, Mon–Wed closed. 26,000 sq ft, city-owned. Roots in the **Neighborhood Arts Program created by the San Francisco Arts Commission in 1967**; independent 501(c)(3) from August 1979. `somarts.org` |
| **Crown Point Press** | 20 Hawthorne St | *(unverified)* | Q60740068, `crownpoint.com`; printmaking workshop and gallery |
| **Luggage Store Gallery** | 1007 Market St | *(unverified)* | `luggagestoregallerysf.org` |
| **Strand Theater** | 1127 Market St | *(unverified)* | operated by A.C.T. (`act-sf.org`). **No landmark number** — §2.6 and §4.4 |
| 111 Minna | 111 Minna St | *(unverified)* | gallery and bar |
| Berggruen Gallery | 10 Hawthorne St | *(unverified)* | |
| Andrea Schwartz Gallery | 545 Fourth St | *(unverified)* | |
| Balay Kreative Studios | 863 Mission St | *(unverified)* | Filipino-American arts, SoMa Pilipinas |
| arc gallery & studios | 1246 Folsom St | *(unverified)* | |
| Alter Space · Siy Gallery · Langton Labs · 63 Bluxome Gallery · Clayroom · The Fuzzy Place | Howard/Folsom/Langton/Bluxome/9th | *(unverified)* | thin; verifier should triage |
| Blue Shield of California Theater at YBCA · Esplanade Main Stage · Salesforce Park Amphitheater | Yerba Buena / 425 Mission | *(unverified)* | venues within larger places |
| Chorus Hall | 30 Otis St | *(unverified)* | on the Mission seam |

### 7.3 Historic buildings and sites with citable designations

All of §4.1 and §4.2. The strongest single entry in the zone:

**The Old San Francisco Mint**, 88 Fifth Street, 94103. Architect **Alfred B. Mullett**;
construction **1 April 1869 – November 1874**; Greek Revival. **San Francisco Landmark No. 236**,
designated 2003. **NRHP reference 66000231**, listed 15 October 1966. **National Historic Landmark**,
designated 4 July 1961. **California Historical Landmark No. 875.** In 2003 the federal government
sold the building to the City of San Francisco for one dollar — an 1879 silver dollar struck at the
mint. **Not open as a museum** (§6.4); used for special events, some open to the public. No hours
exist, so none may be given.

**U.S. Post Office and Courthouse**, NE corner Seventh and Mission Streets. **National Historic
Landmark** (`Is_NHL = X`), **NRHP reference 71000188**, certified **14 October 1971**, resource type
building, recorded extant. 100% South of Market on method A. **A second National Historic Landmark
in the zone, and one the brief did not anticipate.** I re-queried this record by reference number
rather than relying on the bounding-box pass, because it is the strongest unanticipated find in the
file. It is the building now occupied by the U.S. Court of Appeals for the Ninth Circuit; the
verifier should establish the current occupant name and any public access from a federal source
before writing it, since the NPS record speaks only to the designation.

### 7.4 Parks, gardens and public space

| Name | Address | Note |
|---|---|---|
| **Yerba Buena Gardens** | 750 Howard St, 94103 | daily 6am–10pm; public restrooms 9am–5pm (`yerbabuenagardens.org`). **Straddler §5.1** |
| **Martin Luther King Jr. Memorial** | within Yerba Buena Gardens | **an ARTWORK** — see §10. The gardens' own site records it was **vandalized in February 2026** and has since been fully restored |
| **South Park** | between Second, Third, Bryant and Brannan | **Straddler §5.2.** Historic district is **Eligible only — no designation claim** (§4.4) |
| **Victoria Manalo Draves Park** | 900 Folsom St | `sfrecpark.org`; named for the diver, a SoMa-born Filipina-American; adjoining community garden and Bessie Carmichael School |
| Yerba Buena Ice Skating Center; Yerba Buena Bowling Center | Moscone roof deck | `skatebowl.com` returned only a JS loading shell — **no hours confirmed**. Method A splits these from the gardens they sit on (§5.1) |
| Rincon Park | The Embarcadero | holds **Cupid's Span** — artwork, §10. Method B: Financial District |
| The Commons · The Parks at 5M · Annie Street Plaza · Ecker Square · Emerald Park · Rincon Place · PG&E Plaza · Rooftop Park (100 First St) · The Crossing at East Cut · South Beach Park | scattered | privately owned public open spaces and parklets; thin individually |
| Salesforce Park | atop 425 Mission St | rooftop park with amphitheatre, children's reading room and a cable-car feature |
| Sister City Gardens · East Garden · Learning Garden · Howard & Langton Mini Park Community Garden | Yerba Buena / Howard | components of larger places |

### 7.5 Nightlife, music and the leather district

SoMa's nightlife is the densest concentration in the city and is the material the **SoMa LGBTQ
Historic District** and the **Leather and LGBTQ Cultural District** describe — but the historic
district is **Eligible only and carries no designation claim** (§4.4).

| Name | Address | Note |
|---|---|---|
| **San Francisco Eagle Bar** | 398 Twelfth St, 94103 | **OPEN.** Mon 6pm–12am, Tue closed, Wed–Thu 6pm–12am, Fri–Sat 2pm–2am, Sun 1pm–12am (`sf-eagle.com`). **San Francisco Landmark No. 295, designated 2021**; built 1906. **Straddler with Mission (§5.4).** See §9.1 — its own site's "Opened 1981" does not publish |
| **DNA Lounge** | 375 Eleventh St | Q5205728, `dnalounge.com`; opened 22 Nov 1985 per en.wikipedia (third-party, so writable) |
| **The Endup** | 401 Sixth St | Q7732041, `theendupsf.com` |
| Oasis · Halcyon · Monarch · Mezzanine · Temple · Cat Club · F8 · The Grand · The Budda · Calle-11 · Dawn Club | 6th/11th/Folsom/Howard/Jessie/4th | *(unverified)*; **Dawn Club** is a historic jazz name worth checking |
| **Folsom Street Fair** | Folsom St | an event, not a place; first held 1984 (en.wikipedia). Not a `kind` the schema accepts |

### 7.6 Hotels — 33 harvested, and most are not visitor accommodation

Visitor hotels: **The St. Regis San Francisco** (125 Third St — MoAD occupies its ground floor),
**W San Francisco** (181 Third St), **Four Seasons** (757 Market St), **InterContinental San
Francisco** (888 Howard St), **Hyatt Regency San Francisco Downtown SoMa** (50 Third St),
**The Clancy, Autograph Collection** (299 Second St), **Hotel Zetta** (55 Fifth St), **Hotel Zelos**
(12 Fourth St), **The Mosser** (54 Fourth St), **The Pickwick Hotel** (85 Fifth St), **YOTEL San
Francisco** (1095 Market St), **Hotel VIA** (138 King St), **Hyatt Place** (701 Third St),
**Hampton Inn** (942 Mission St), **Inn on Folsom** (1188 Folsom St), **Hotel Madrid** (22 South
Park), **Signature Hotel** (259 Seventh St), **Carriage Inn** (140 Seventh St), **City Center Inn &
Suites** (240 Seventh St), **The Utah Inn** (504 Fourth St), **San Francisco Inn** (385 Ninth St),
**European Hostel** (761 Minna St).

**The remainder are single-room-occupancy residential hotels on Sixth Street and Mission Street** —
Hotel Alder (175 6th), Minna Hotel (138 6th), Sunnyside Hotel (135 6th), Seneca Hotel (36 6th),
The Rose (125 6th), Kean Hotel (1018 Mission), Raman Hotel (1011 Howard), Ram's Hotel (80 9th),
Pontiac Hotel (509 Minna), Hotel 964 (952 Howard), Sunset Hotel. **These are people's homes, not
accommodation a guide sends a visitor to.** They should not be written as hotels. I record them so
the verifier rejects them deliberately rather than a later wave rediscovering them as a gap.

**New Pullman Hotel** (228–248 Townsend St, SF Landmark 280) and **Hotel Utah** (500–504 Fourth St,
SF Landmark 282) are designated landmarks; the Utah operates as the **Hotel Utah Saloon** and
**The Utah Inn** is a separate listing at 504 Fourth St. The verifier should establish which is
which before writing either.

### 7.7 Places of worship

**Saint Patrick Catholic Church**, 756 Mission St (the Article 10 record gives 748 Mission St) —
**San Francisco Landmark No. 4, designated 1968**; built 1872; Gothic Revival. `stpatricksf.org`.
Straddler §5.1.

**St. Joseph's**, 1401 Howard St & 240 Tenth St — **San Francisco Landmark No. 120, designated
1980**; **NRHP 82002250**; built 1913; **John J. Foley**; Gothic Revival. Deconsecrated; the OSM
record and Nominatim return **Saint Joseph's Arts Society** at 1401 Howard, so the building is in
secular arts use. Verify current access before writing it as visitable.

**Gran Oriente Filipino Masonic Temple**, 95 Jack London Alley (South Beach) — the associated
**Gran Oriente Filipino Hotel is NRHP 100004869**; the Article 10 "complex" record is `landmarkno 0`
and carries **no** Article 10 claim (§4.4).

Also: Ukrainian Orthodox Church of Saint Michael (345 Seventh St), Quaker Meeting House (65 Ninth
St), Epic Church, Templo Calvario.

### 7.8 Food and drink — 250 harvested

Only five carry a Wikidata identifier: **Benu** (22 Hawthorne St, Q28226396), **Saison**
(Q18749173, South Beach), **21st Amendment Brewery** (563 Second St, Q4631029, South Beach),
**Waterbar** (Q108866936, Rincon Hill), **SF Eagle** (398 Twelfth St, Q57083776). **Boulevard**
(1 Mission St, Q21188146) sits on the Audiffred Building and is Financial District on method B.

The other ~245 are ordinary cafés, lunch counters and chain outlets. I have not verified any of
them and I recommend the verifier require an operator's own site for address and hours before any
is written, because §6 shows how stale the OSM layer is in this zone.

### 7.9 Libraries and civic

**Prelinger Library**, 301 Eighth Street — an appropriation-friendly private research library, open
by posted hours; duplicated in OSM with a malformed second URL. Bayanihan Community Center,
Bessie Carmichael School, Gene Friend Recreation Center, Erik Erikson Library.

### 7.10 Streets, alleys and pedestrian cuts

SoMa's alley grid is the surviving trace of its nineteenth-century subdivision and several alleys
carry the zone's Filipino-American and leather histories: **Minna**, **Natoma**, **Clementina**,
**Tehama**, **Shipley**, **Langton**, **Bluxome**, **Jessie**, **Hawthorne**, **Jack London Alley**,
**Ringold Alley**, **Russ Street**, **Harriet Street**, **Rausch**, **Dore**, **Moss**, **Lafayette**.
Pedestrian cuts between Market and Mission: **Yerba Buena Lane**, **Mint Plaza**, **Annie Street**,
**Stevenson Street**. I did not test each for straddling; several run to the Mission and Tenderloin
seams and would need the same treatment as §5.3 if any is written as a place.

---

## 8. Guide or town page — my judgement

**A guide.** SoMa is not a town and has no separate municipal identity; it is a district of San
Francisco and the roster already models it as one of twenty neighborhood zones with
`destination: "SoMa, California"`. The corpus precedent is the rioni and the New York
neighborhoods, all of which are guides.

Two supporting observations:

- **`derive_destination_slug("SoMa, California")` yields `soma`, and it is free.** I derived the
  first comma-segment of every committed seed file's `guide.destination` — **336 distinct
  destination slugs**, matching the roster's stated figure — and neither `soma` nor `south-of-market`
  is among them. The same run reproduces the roster's three Manhattan collisions exactly
  (`chinatown`, `financial-district`, `union-square`), which is a check on the method as well as
  the result. **This zone needs no destination-string disambiguation.**
- The zone has enough marquee material for a guide **only if the Yerba Buena cluster is ruled to
  it** (§5.1). Stripped of Yerba Buena and South Park, what remains inside the strict method-A
  polygon is the Old Mint, the U.S. Post Office and Courthouse, St. Joseph's, the Jackson Brewery,
  the James Lick Baths, Hotel Utah, the New Pullman, the SF Eagle, SOMArts, the American Bookbinders
  Museum and the nightlife strip — a real page, but a much smaller one, and one that would leave
  SFMOMA to a Financial District page whose own roster entry does not mention it.

---

## 9. Facts that are true but not writable as the source states them

The verifier should read these before drafting.

**9.1 Trading-duration claims from operators' own sites.** `sf-eagle.com` states "Opened 1981 on
12th & Harrison. Forty years of pride…". Under the standing rule a founding year from an operator's
own site is a trading-duration claim and does not publish. The **building** date (1906) and the
**landmark number** (San Francisco Landmark No. 295, designated 2021) come from DataSF and do
publish. Same shape: `moadsf.org` "We opened in 2005", `bookbindersmuseum.org`, `21st-amendment.com`.
Where en.wikipedia states the same year independently — DNA Lounge 1985, YBCA 1993, SFMOMA 1935,
California Historical Society 1871 — that is a third-party source and the constraint does not bite.

**9.2 MoAD's founding year** is stated only by MoAD on `moadsf.org` in the material I gathered.
Wikipedia has an article on the museum; the verifier should take the year from there or drop it.

**9.3 Superlatives lurking in the source data.** SF Planning's district descriptions and several
operator sites use ranking language — Moscone calls itself "San Francisco's Premier Convention
Center". None of it may be carried over, attributed or not. Note also that "the only surviving…",
which appears in warehouse-district material, is banned by pattern.

**9.4 A sentence that will read as designation and must not.** The eight `landmarkno = 0` records in
§4.4 and the six Eligible-only districts will tempt phrasing like "recognised as historically
significant". If it makes a protection claim it needs a register and an identifier; if it cannot
have one, the claim goes.

**9.5 Closures are facts about the place, not about the page.** The permitted form is about the
world — the museum is closed, no source states reopening hours. The banned form is about the guide.

---

## 10. Photographs — quarantined, and SoMa is the worst zone for this

`"photos": []` everywhere. Wave 2's problem, but the artwork hazard is unusually severe here and
affects what may be *written* about as much as what may be shot.

**36 public artworks** fall inside the SoMa family in my harvest. 17 USC 120(a) covers architectural
works only; none of these is a building. Named and identified:

- **Cupid's Span**, Rincon Park — Claes Oldenburg d. 2022, Coosje van Bruggen d. 2009. Already on
  the gate's blocklist.
- **Martin Luther King Jr. Memorial**, Yerba Buena Gardens (Q118533599) — the brief names it. It is
  a memorial with a waterfall and inscribed texts, **not** a building. Vandalized February 2026 and
  since restored, per the gardens' own site.
- **Ruth Asawa's San Francisco Fountain** (Q17026805) — Ruth Asawa d. 2013.
- **Shaking Man** (Q60748270), **Aurora** (Q28451422), **Geneses** (Christine Corday), **Urge**
  (Amorphic Robot Works), **Untitled by Joel Shapiro (1999)** — Shapiro is living.
- The Oracle Park statuary that tests South Beach — **Willie Mays**, **Juan Marichal**,
  **Orlando Cepeda**, **Gaylord Perry**, **Seals Sculpture**. These sit with the code seed's
  territory and I claim none of them.
- A further twenty-odd untitled or thinly-attributed works along Folsom, Howard and the Embarcadero
  whose artists I did not establish. **Assume live copyright unless proven otherwise.**

Buildings that are free to photograph from public land and would carry the zone: the Old Mint, the
U.S. Post Office and Courthouse, St. Patrick's, St. Joseph's, the Jackson Brewery, the James Lick
Baths, the Oriental Warehouse, the Hills Brothers Coffee Plant, the Audiffred Building, the Rincon
Annex, SFMOMA's Botta façade and Snøhetta addition, and the Libeskind volume at 736 Mission.

**One warning for wave 2.** SFMOMA, YBCA and the Yerba Buena Gardens contain sculpture and murals in
their public spaces; a photograph framed on the *building* publishes, a photograph framed on the
*art* does not, and several obvious exterior views of 736 Mission include the substation façade
(fine, a building) alongside site-specific artwork (not fine).

---

## 11. What I would tell the arbitrator in one paragraph

SoMa's edge is not merely vernacular — the city publishes two official neighborhood geographies from
the same portal that place SFMOMA, Yerba Buena Gardens, the Contemporary Jewish Museum, the Museum
of the African Diaspora, Moscone, YBCA, the Children's Creativity Museum and St Patrick's Church in
**different neighborhoods**, and the finer of the two agrees with the roster's own stated draw for
`soma` while the coarser hands them to a Financial District page whose roster entry does not mention
them. Method A additionally severs the Yerba Buena ice rink and bowling centre from the garden they
are built on. Separately, **the Tenderloin, South Beach, Rincon Hill and Civic Center are not roster
zones**, so a strict method-A ruling orphans the 60% Tenderloin majority of the Market Street
Theatre and Loft Historic District (NRHP 86000729), South Park, the Oriental Warehouse (SF Landmark
101), the Hills Brothers Coffee Plant (SF Landmark 157) and the Gran Oriente Filipino Hotel (NRHP
100004869) with no page to fall to. Whichever way it goes, the ruling should be one line applied to
all twelve zones, and it should not split a single campus.
