# Russian Hill, San Francisco — FINDER report

Zone slug `russian-hill`, destination string `Russian Hill, California` (per
`priv/seed_data/san_francisco_roster.json`). Research date 2026-09-03.
I am the finder. I decide nothing. A verifier adjudicates each candidate and the
arbitrator rules ownership across all twelve zones.

---

## 0. Collision check — run first, as instructed

```
python3 .superpowers/taken_slugs.py            -> 1279 places across 31 shipped files
python3 .superpowers/taken_slugs.py russian    -> no match
python3 .superpowers/taken_slugs.py lombard    -> no match
python3 .superpowers/taken_slugs.py hill       -> no match against any SF place
ls priv/seed_data/san_francisco/               -> .gitkeep only
```

The script as shipped globs `priv/seed_data/rome/*.json` only, so it reports the Rome
corpus. I checked the rest by hand: `priv/seed_data/bare_places_roster.json` (the
NY-wide roster) carries no `region: san_francisco` rows, and `priv/seed_data/san_francisco/`
is empty. **The only San Francisco slugs already owned are the seven live code-seed
places named in the roster's `oracle_park_ruling`** (oracle-park, reds-java-house,
momos-san-francisco, flour-and-water-pizza-shop-mission-rock, arsicault-bakery-mission-rock,
blue-bottle-coffee-mission-rock, china-basin-park). **None of my candidates touches any
of them.** Nothing here is in Mission Bay's reach.

---

## 1. How I established which zone a place is in

Three independent instruments, all queried directly:

| Instrument | Endpoint | What it gives |
|---|---|---|
| DataSF **Analysis Neighborhoods** (41-unit official set) | `data.sfgov.org/resource/j2bu-swwd.json` | polygon; I ran point-in-polygon in `pip.py` |
| DataSF **EAS address points** | `data.sfgov.org/resource/ramy-di5m.json` | `nhood` field per street address (the 117-unit SF Find set) |
| DataSF **Rec & Park properties / facilities** | `gtr9-ntp6` / `ib5c-xgwu` | `analysis_neighborhood` AND `mons_neighborhood` per park |

Nominatim returned **HTTP 403** to every request from this session, so the scoping note's
Nominatim path did not work for me. The three DataSF instruments above answered every
time and are better anyway, because DataSF ships two *disagreeing* official neighborhood
schemes and the disagreement is exactly the evidence the arbitrator needs.

Article 10 landmarks: `data.sfgov.org/resource/97yj-54sx.json` (370 rows, each with
`landmarkno`, `yeardesignated`, `address`, `apn`, geometry, and a `designationdocument`
PDF URL). Article 10 **districts**: `data.sfgov.org/resource/knm6-5ej6.json` (20 rows).
NRHP: the reference numbers below were taken from the NRHP listing tables and then
**independently corroborated against the California Office of Historic Preservation's own
Listed Resources database**, which returned matching names and registration dates for all
three Russian Hill districts (see §3).

---

## 2. THE HEADLINE BOUNDARY PROBLEM — read this before anything else

**DataSF's official Analysis Neighborhood boundary puts the historic core of Russian Hill
inside Nob Hill, and puts the Aquatic Park waterfront inside Russian Hill.** Both halves
of that are contrary to every guidebook, to the National Register, and to the city's own
Rec & Park copy. Verified addresses:

| Address | Place | DataSF `nhood` | Every other source says |
|---|---|---|---|
| 1 Russian Hill Place | the street literally named Russian Hill Place | **Nob Hill** | Russian Hill |
| 1 Florence Street | Florence St, in the Vallejo Street Crest | **Nob Hill** | Russian Hill |
| 1067 Green St | Feusier Octagon House | **Nob Hill** | Russian Hill (NRHP district name, Wikipedia) |
| 1032 Broadway | Atkinson House | **Nob Hill** | Russian Hill (contributor to NRHP 87002289) |
| 1652 Taylor St | House of the Flag | **Nob Hill** | Russian Hill / Nob Hill genuinely split |
| Vallejo & Taylor | Ina Coolbrith Park | **Nob Hill** (`mons_neighborhood`: Russian Hill) | SF Rec & Park's own page: "in Russian Hill" |
| 900 North Point St | Ghirardelli Square | **Russian Hill** | roster assigns Fisherman's Wharf |
| 680 Beach St | Haslett Warehouse / Argonaut | **Russian Hill** | roster assigns Fisherman's Wharf |
| 2765 Hyde St | The Buena Vista | **Russian Hill** | universally Aquatic Park / Fisherman's Wharf |
| 601 Beach St | Joseph Conrad Square | **Russian Hill** (`mons`: Fisherman's Wharf) | Fisherman's Wharf |
| 500 Jefferson St | Dolphin Club / South End Rowing Club | **Russian Hill** (`mons`: Fisherman's Wharf) | Fisherman's Wharf |
| 1401 Broadway | Helen Wills Playground | Russian Hill (`mons`: Polk Gulch) | contested |
| 1470 Washington St | Washington & Hyde Mini Park | Russian Hill (`mons`: Nob Hill) | contested |
| 1621 Polk St | Bob's Donuts | **Nob Hill** | Polk Gulch / Nob Hill |

**Every row above is a straddler and I resolve none of them.** Full list in §7.

---

## 3. DESIGNATION IDENTIFIERS FOUND — 23 total

The programme said a landmark with a number is worth more than three without one. Here they
are, with register named and identifier attached, every one traced to a machine-readable
register rather than to prose.

### Article 10 (San Francisco Landmark) numbers — core Russian Hill
| No. | Name | Address | Year designated | Register record |
|---|---|---|---|---|
| **85** | San Francisco Art Institute | 800 Chestnut St | 1977 | DataSF 97yj-54sx; https://sfplanninggis.org/docs/landmarks_and_districts/LM85.pdf |
| **294** | *The Making of a Fresco Showing the Building of a City* (Rivera fresco) | 800 Chestnut St | 2021 | DataSF 97yj-54sx; https://sfplanninggis.org/docs/landmarks_and_districts/LM294.pdf |
| **220** | Engine Company No. 31 Fire House | 1088 Green St | 1998 | .../LM220.pdf |
| **217** | Alhambra Theater | 2320–2336 Polk St | 1996 | .../LM217.pdf |
| **232** | Filbert Street Cottages | 1338 Filbert St | 2003 | .../LM232.pdf |
| **309** | Church for the Fellowship of All People | 2041 Larkin St | 2023 | .../LM309.pdf |
| **188** | Engine Co. #8, Truck Co. #4 | 1648 Pacific Ave | 1988 | .../LM188.pdf |

### Article 10 numbers — straddlers (see §7)
| No. | Name | Address | Year | DataSF `nhood` |
|---|---|---|---|---|
| **36** | Feusier Octagon House / Kenny Residence | 1067 Green St | 1970 | Nob Hill |
| **97** | Atkinson-Escher House | 1032 Broadway | 1977 | Nob Hill |
| **46** | House of the Flag (Old Sheppard-Dakin House) | 1652–1656 Taylor St | 1972 | Nob Hill |
| **30** | Ghirardelli Square | 900 North Point St | 1970 | Russian Hill |
| **59** | Haslett Warehouse Building | 680 Beach St | 1974 | Russian Hill |

### NRHP reference numbers
| Ref. | Name | Listed | Corroboration |
|---|---|---|---|
| **87002286** | Russian Hill–Macondray Lane District | 1988-01-07 | CA OHP `N1542`, registration date 1/7/1988, San Francisco — https://ohp.parks.ca.gov/ListedResources/Detail/N1542 |
| **87002288** | Russian Hill–Paris Block Architectural District | 1988-01-07 | CA OHP `N1543` — https://ohp.parks.ca.gov/ListedResources/Detail/N1543 |
| **87002289** | Russian Hill–Vallejo Street Crest District | 1988-01-22 | CA OHP `N1549`, registration date 1/22/1988 — https://ohp.parks.ca.gov/ListedResources/Detail/N1549 |
| **87002290** | Engine House No. 31, 1088 Green St | 1988-01-07 | NRHP listing table |
| **74000554** | Feusier Octagon House, 1067 Green St | 1974-03-24 | NRHP listing table |
| **15000950** | San Francisco Art Institute, 800 Chestnut St | 2016-01-05 | NPS weekly list 1/04/16–1/08/16 |
| **11000944** | Sinton House, 1020 Francisco St | 2011-12-22 | NRHP listing table |
| **66000233** | San Francisco cable cars (National Historic Landmark) | NHL 1964-01-29 | NRHP listing table |
| **82002249** | Pioneer Woolen Mills and D. Ghirardelli Company, 900 N Point St | 1982-04-29 | straddler |
| **75000172** | Haslett Warehouse, 680 Beach St | 1975-03-28 | straddler |
| **14000967** | Burr House, 1772 Vallejo St | 2015-06-08 | probably NOT Russian Hill — see §7 |

**NEGATIVE FINDING, and it matters:** the Article 10 **district** dataset (`knm6-5ej6`)
contains 20 districts and **none of them is in Russian Hill**. All three Russian Hill
districts are National Register districts only. A page must therefore write
"listed on the National Register of Historic Places in 1988, reference number 87002289"
and must **not** write "designated under Article 10" for any of the three.

---

## 4. CANDIDATES — the marquee tier

### 4.1 Lombard Street crooked block — `attraction`
- The one-way block of Lombard Street between **Hyde and Leavenworth**, on Russian Hill.
- Eight hairpin turns; one-way downhill; paved in red brick; the sign at the top posts
  **5 mph**. Block is about **600 ft** long (**412.5 ft** in straight line).
- Built **1922**; the switchback design was first suggested by property owner **Carl Henry**;
  intended to reduce the hill's natural **27 percent grade**.
- The Powell–Hyde cable car stops at the top of the block on Hyde Street (SFMTA stop 5078).
- Traffic: ~250 vehicles/hour typical; average daily traffic **2,630** in 2013; ~**2 million
  visitors a year** and up to **17,000 per day** on busy summer weekends as of 2015.
- Sources: https://en.wikipedia.org/wiki/Lombard_Street_(San_Francisco) ;
  SFCTA, *Lombard Study: Managing Access to the "Crooked Street"*, Feb 2017,
  http://www.sfcta.org/sites/default/files/content/Programming/NTIP/Lombard/Lombard_final_report_021517.pdf ;
  https://www.sfmta.com/getting-around/transit/routes-stops/stops/5078
- **WRITING WARNING.** "The crookedest street in the world" is a superlative with an explicit
  comparison class and must not appear, quoted, attributed, or hedged. Neither may "one of the
  most visited". The turn count, the grade, the brick, the 5 mph, the 1922 date and the visitor
  counts are all facts and all publish.
- Zone: unambiguous. 949 and 1000 Lombard both return `nhood = Russian Hill`.

### 4.2 Macondray Lane — `attraction`
- Pedestrian lane running two blocks east–west **between Leavenworth and Taylor Streets**,
  parallel to Union and Green. At the Taylor Street end a set of wooden steps descends to
  Taylor Street. Views north to Alcatraz Island and San Francisco Bay.
- Contributing site of the **Russian Hill–Macondray Lane District, NRHP reference number
  87002286, listed 7 January 1988**; the district covers roughly 900–982 Green, 1918–1960
  Jones, 15–84 Macondray and 1801–1809 Taylor, is **1.6 acres**, and contains **12 contributing
  buildings and one contributing site**. Only four houses in the district survived the 1906
  earthquake and fire; the oldest surviving is **982 Green Street, built 1878**.
- Armistead Maupin confirmed in the 2017 documentary *The Untold Tales of Armistead Maupin*
  that Macondray Lane was the model for "Barbary Lane" in *Tales of the City*.
- Sources: https://en.wikipedia.org/wiki/Macondray_Lane ;
  https://en.wikipedia.org/wiki/Russian_Hill%E2%80%93Macondray_Lane_District ;
  NRHP nomination by Anne Bloomfield, 1 May 1987, NPS ;
  https://noehill.com/sf/landmarks/nat1987002286.aspx ; CA OHP N1542.
- Zone: 15 Macondray Ln and 982 Green St both return `nhood = Russian Hill`. Clean.

### 4.3 Russian Hill–Vallejo Street Crest District — `historic-site`
- **NRHP reference number 87002289, listed 22 January 1988.** California OHP `N1549`.
- Roughly 1020–1032 Broadway, 1–49 Florence St, 1728–1742 Jones St, 1–7 Russian Hill Place,
  1629–1715 Taylor St, 1000–1085 Vallejo St. **4 acres** per the Wikipedia infobox; noehill's
  reading of the nomination says forty acres — **the two disagree, flag for the verifier**.
- Listing included **27 contributing buildings, 2 contributing sites, 5 contributing structures**
  (Wikipedia/noehill give 26 or 27 buildings — again a discrepancy).
- The enclave escaped the 1906 fire. Architects represented: **Willis Polk, Charles F.
  Whittlesey, Julia Morgan, Albert Farr, Charles W. McCall**, and the amateur architect
  **Joseph Worcester**. Beaux-Arts street treatment; retaining walls, ramps and walkways
  engineered to manage **grades of 16 percent, 23 percent and 40 percent** — that is a
  measurement and publishes.
- Residents named in the nomination: Katherine (Catherine) Atkinson, Maynard Dixon, Sara Bard
  Field, Dorothea Lange, Rose Wilder Lane, Horatio P. Livermore, Willis Polk, Mary Curtis
  Richardson, Dora Norton Williams, Joseph Worcester.
- Sources: https://en.wikipedia.org/wiki/Russian_Hill-Vallejo_Street_Crest_District ;
  https://noehill.com/sf/landmarks/nat1987002289.aspx ; CA OHP N1549 ; NPS nomination 87002289.
- **ZONE FLAG:** DataSF returns `Nob Hill` for 1 Russian Hill Place, 1 Florence St and
  1032 Broadway. The register calls the district "Russian Hill". Arbitrator.

### 4.4 Russian Hill–Paris Block Architectural District — `historic-site`
- **NRHP reference number 87002288, listed 7 January 1988.** CA OHP `N1543`. **1.5 acres.**
- Roughly **1017–1067 Green Street**: eleven single or multiple dwellings in eleven different
  architectural styles, all set back with front yards. The houses on the north side of Green
  back onto Macondray Lane. Includes the Feusier Octagon House.
- The name "Paris Block" appears in print no earlier than 1964; the nomination speculates it
  refers to the **Bos Apartments at 1050 Green Street**, by Beaux-Arts-trained architect
  **Lewis P. Hobart**, built 1891.
- Sources: https://en.wikipedia.org/wiki/Russian_Hill-Paris_Block_Architectural_District ;
  https://noehill.com/sf/landmarks/nat1987002288.aspx ; CA OHP N1543.
- Zone: 1050 Green returns Russian Hill; **1067 Green returns Nob Hill**. Straddler.

### 4.5 San Francisco Art Institute campus, 800 Chestnut Street — `historic-site`
- **San Francisco Landmark No. 85** (Article 10, designated 1977) and **listed on the National
  Register of Historic Places in 2016, reference number 15000950**.
- Original Spanish Colonial Revival buildings **1926, by Bakewell & Brown**. A **1969** addition
  by **Paffard Keatinge-Clay** added 22,500 sq ft of studio space, a theater/lecture hall,
  an outdoor amphitheatre formed by the lecture hall's stepped roof, galleries and a cafe.
  *(noehill dates the addition 1963, Wikipedia 1969 — DISCREPANCY, flag.)*
- The school was founded 1871 as the San Francisco Art Association; became the California
  School of Fine Arts in 1916 and the San Francisco Art Institute in 1961. It **closed in 2022**
  and filed for Chapter 7 liquidation in April 2023. In late February 2024 a nonprofit endowed
  by Laurene Powell Jobs bought the campus, including the mural, for about $30 million.
- **No source I found states current public opening hours or whether the campus is open to
  visitors in 2026.** A page must say what it can honestly say and give no hours.
- Sources: DataSF 97yj-54sx ; https://sfplanninggis.org/docs/landmarks_and_districts/LM85.pdf ;
  https://en.wikipedia.org/wiki/San_Francisco_Art_Institute ;
  https://noehill.com/sf/landmarks/sf085.asp ;
  NPS weekly list 1/04/16–1/08/16, https://www.nps.gov/subjects/nationalregister/upload/weekly-list-2016-national-register-of-historic-places.pdf
- Zone: 800 Chestnut returns `nhood = Russian Hill`. Clean.

### 4.6 *The Making of a Fresco Showing the Building of a City* (Diego Rivera, 1931) — `historic-site` or fold into 4.5
- **San Francisco Landmark No. 294**, designated 2021 — the designation is of the fresco itself,
  at 800 Chestnut Street. This is unusual and citable.
- Painted 1931; one of four Rivera frescoes in the Bay Area. In January 2021 SFAI's trustees
  proposed selling it to the Lucas Museum of Narrative Art; the plan was dropped after
  objections. It transferred with the campus in the 2024 sale.
- The **Diego Rivera Gallery, which housed it, closed permanently when SFAI closed in 2022.**
- **PHOTO RULE:** this is a MURAL, not a building. 17 USC 120(a) does not cover it. Rivera died
  1957. Do not photograph; may be written about. Noted per the programme's instruction.
- Sources: DataSF 97yj-54sx (landmarkno 294, yeardesignated 2021.0) ;
  https://sfplanninggis.org/docs/landmarks_and_districts/LM294.pdf ;
  https://en.wikipedia.org/wiki/Diego_Rivera_Gallery
- Judgement: probably should NOT be a separate place — it is a work inside 4.5, and the
  schema has no "artwork" kind. Recommend the verifier fold it into the Art Institute entry.
  Recorded separately here because its landmark number is independent and citable.

### 4.7 Francisco Park — `park`
- **801 Bay Street** (Rec & Park facility page) / **2745 Larkin Street** (Rec & Park property
  dataset). Bordered by **Francisco, Larkin, Bay and Hyde streets**. **4.5 acres** per Rec & Park's
  page; **4.89 acres** in the properties dataset — flag the discrepancy.
- **Opened April 2022.** Hours **5 a.m. to midnight**.
- On the site of the **Francisco Reservoir, constructed 1859**, shut down in **1940** after the
  Lombard Reservoir opened a block away. A section of the historic reservoir wall and brick
  reservoir floor remains near the Hyde Street entrance; the original reservoir's outline is
  marked in the park's pathway paving.
- Rec & Park bought the land from the Public Utilities Commission for **$9.9 million in 2014**;
  the Francisco Park Conservancy raised **$27.5 million** to build it. Rainwater catchment system
  saves nearly **900,000 gallons a year**.
- Features: children's play area and nature exploration area, fenced dog run, ADA pathways,
  the Maria Manetti Shrem Community Garden, restrooms, central lawn, two reservable picnic
  areas (Bev & Greg James, 5 tables; Larsen/Lam Playground, 3 tables), reservable 9 a.m.–1 p.m.
  or 2 p.m.–6 p.m.
- Sources: https://sfrecpark.org/Facilities/Facility/Details/Francisco-Park-442 ;
  DataSF `gtr9-ntp6` and `ib5c-xgwu` ; https://franciscopark.org/
- **WRITING WARNING:** Rec & Park's own copy says "the largest public park to open in the city's
  urban core since 1983". Superlative with comparison class. Must not be used.
- Zone: 2745 Larkin returns Russian Hill; `analysis_neighborhood` Russian Hill; `mons` Russian
  Hill. Clean, unanimous.

### 4.8 Fay Park — `park`
- **2366 Leavenworth Street**, at Chestnut. **0.33 acres** (dataset) / "1/4-acre" (Rec & Park copy)
  — discrepancy. Hours **10 a.m. to 4 p.m.** — unusually short, and sourced.
- Three terraces connected by stairs and ramps climbing the hillside for half a city block,
  with stone balustrades and retaining walls, ornamental planting beds and boxwood hedges;
  two latticed wooden gazebos and a bay overlook at the top.
- History, all from Rec & Park's own page: the garden and adjacent house were bequeathed to the
  city by **Mary Fay Berrigan**, whose family built the first house on the site in **1869** and the
  current house in **1912**. She and her husband, Brigadier General Paul Berrigan, hired landscape
  architect **Thomas Church** to design the garden in **1957**. The city accepted the property on
  General Berrigan's death in **1998**; it opened to the public in **2006**. **The house is not open
  to the public.**
- Facilities dataset lists "Fay House" as `Structure, Historic: Bldg-Other`.
- Source: https://sfrecpark.org/Facilities/Facility/Details/Fay-Park-167 ; DataSF `gtr9-ntp6`.
- Zone: 2366 Leavenworth returns Russian Hill on all three instruments. Clean.
- **WRITING WARNING:** Rec & Park says "Just a block from Lombard Street's famous crooked block"
  and "hidden gem". Both are banned — the first is orientation by impression, the second is
  evaluative. Adjacency may only be stated as the named cross streets.

### 4.9 Ina Coolbrith Park — `park`
- **Vallejo and Taylor Streets**, zip 94133. City Lands dataset address: "VALLEJO ST & TAYLOR ST".
  **0.87 acres** (properties dataset) / "0.8-acre" (Rec & Park copy).
- Hours **5 a.m. to midnight**; restroom **8 a.m. to 8 p.m.**
- Named for **Ina Coolbrith**, writer and librarian, who lived in the Macondray Lane district and
  is named in the NRHP nomination for 87002286.
- Sources: https://sfrecpark.org/Facilities/Facility/Details/Ina-Coolbrith-Park-175 ;
  DataSF `gtr9-ntp6` ; DataSF City Lands `gtnh-hgvs` (land owner: Recreation and Parks).
- **ZONE FLAG — one of the sharpest in the zone.** DataSF `analysis_neighborhood` = **Nob Hill**;
  DataSF `mons_neighborhood` = **Russian Hill**; SF Rec & Park's own page says "a little 0.8-acre
  park **in Russian Hill**". The operator and the vernacular say Russian Hill; the official
  41-unit boundary says Nob Hill. Arbitrator.

### 4.10 George Sterling Park — `park` — LOW CONFIDENCE, see §8
- Bordered by **Greenwich, Larkin, Hyde and Lombard Streets** atop Russian Hill.
- A stone bench was dedicated to the poet **George Sterling on 25 June 1928**, with a plaque
  carrying quotations from his "Ode to Shelley" and "Song of Friendship". The plaque was stolen
  in the 1970s; a replacement quoting "The Cool, Grey City of Love" was installed at a ceremony
  on **10 July 1982** attended by Herb Caen, Lawrence Ferlinghetti, Philip Lamantia and others.
  The plaque was later moved to the park's northwest corner.
- **THE PROBLEM:** "George Sterling Park" **does not exist in SF Rec & Park's facility list**
  (I enumerated all 341 facility IDs on sfrecpark.org) **nor in the Rec & Park properties
  dataset** (255 rows, searched for "sterling"). DataSF **City Lands** shows the site as
  **"LOMBARD RESERVOIR WATER FACILITIES", 1200 Greenwich St, San Francisco Public Utilities
  Commission**, and separately **"ALICE MARBLE TENNIS COURTS", SW Hyde and Lombard, Rec & Park**.
  So the green space is PUC land under an informal name. The SF Parks Alliance page
  (https://www.sfparksalliance.org/our-parks/parks/george-sterling-park) returned HTTP 403 to
  me and its Wayback capture rendered empty.
- Sources: https://en.wikipedia.org/wiki/List_of_memorials_to_George_Sterling (cites
  *San Francisco Water* v.7 n.3, July 1928) ; DataSF `gtnh-hgvs`.
- **Recommendation: do not ship without a city source for the name.** Or ship the adjoining
  Alice Marble Courts (§4.11) instead, which is unimpeachably sourced.

### 4.11 Alice Marble Courts — `park`
- **1200 Greenwich Street** in the properties dataset; **"Greenwich and Hyde"** on Rec & Park's
  own page; **"S W HYDE AND LOMBARD ST"** in City Lands. **0.84 acres.** Hours 5 a.m. to midnight.
- Four tennis courts, a basketball court and a practice wall, on top of Russian Hill, with views
  over the city and the Bay. Named for tennis player **Alice Marble**.
- Sources: https://sfrecpark.org/Facilities/Facility/Details/Alice-Marble-Courts-324 ;
  DataSF `gtr9-ntp6`, `ib5c-xgwu`, `gtnh-hgvs`.
- Zone: Russian Hill on all three instruments. Clean.
- Note the courts sit directly over the **Lombard Reservoir**, PUC land, 1200 Greenwich —
  a physical adjacency that is sourced and may be stated.

---

## 5. CANDIDATES — the designated-building tier

### 5.1 Engine Company No. 31 Fire House — `historic-site`
- **1088 Green Street, between Hyde and Leavenworth.** Built **1908**.
- **San Francisco Landmark No. 220** (designated 1998) AND **listed on the National Register of
  Historic Places in 1988, reference number 87002290**. Two registers, two identifiers.
- Sources: DataSF 97yj-54sx ; https://sfplanninggis.org/docs/landmarks_and_districts/LM220.pdf ;
  https://noehill.com/sf/landmarks/sf220.asp ; NRHP listing table.
- Zone: 1088 Green returns Russian Hill. Clean.
- Not verified: current use / whether the interior is accessible. **No source I found states
  opening hours.**

### 5.2 Alhambra Theater — `theater` (currently a gym; see kind note)
- **2320–2336 Polk Street** (Wikipedia infobox gives 2330 Polk). Opened **5 November 1926**,
  **1,625 seats**, cost **$500,000**. Moorish Revival; two twin turrets; interior includes a
  kaleidoscope domed ceiling. Architects **Miller & Pflueger** (Timothy L. Pflueger, who also
  designed the Castro Theatre and the Paramount in Oakland). Reinforced concrete with
  unprotected steel trusses.
- Twinned 1976; back to a single screen 1988; **closed as a cinema 22 February 1998**.
- **San Francisco Landmark No. 217**, designated 1996 (Wikipedia gives 21 February 1996; the SF
  landmark list gives 3 March 1996; DataSF gives the year only — **DISCREPANCY, use the year**).
- Now occupied by a **Crunch Fitness** gym; the original marquee is restored, most interior
  detail retained, and films are still shown on the screen. https://www.crunch.com/locations/polk-street
  resolved but did not expose the street address to me.
- Sources: DataSF 97yj-54sx ; .../LM217.pdf ; https://en.wikipedia.org/wiki/Alhambra_Theatre_(San_Francisco) ;
  https://noehill.com/sf/landmarks/sf217.asp
- Zone: 2330 Polk returns Russian Hill. Clean.
- **KIND PROBLEM for the verifier:** it is a theatre building operating as a gym. `theater` and
  `shop` both misdescribe it; `historic-site` is probably right.

### 5.3 Filbert Street Cottages — `historic-site`
- **1338 Filbert Street.** **San Francisco Landmark No. 232**, designated 2003. Also known in the
  landmark list as the **Bush Cottages and the School of Basic Design and Color**.
- Sources: DataSF 97yj-54sx ; .../LM232.pdf ; SF designated landmarks list.
- Zone: 1338 Filbert returns Russian Hill. Clean.
- Low information beyond the designation — **I did not find a description, architect or build
  date from a register.** Thin; flagged.

### 5.4 Church for the Fellowship of All Peoples — `historic-site`
- **2041 Larkin Street.** **San Francisco Landmark No. 309**, designated 2023 — one of the newest
  Article 10 landmarks in the city.
- Founded **1944**, when Baptist minister **Howard Thurman** left a tenured post at Howard
  University to help the Fellowship of Reconciliation establish an intercultural, interracial,
  interfaith and interdenominational congregation in San Francisco. Co-founder **Alfred Fisk**.
- Building: off-white stucco façade with three street-level arched inset doors, crowned with a
  leaning bell tower.
- An annual Convocation each October, **open to the public**, presents the Howard Thurman Award.
- Own site confirms name and address: https://www.fellowshipsf.org/ ("2041 Larkin St").
- Sources: DataSF 97yj-54sx ; .../LM309.pdf ;
  https://en.wikipedia.org/wiki/Church_for_the_Fellowship_of_All_Peoples ; the church's own site.
- Zone: 2041 Larkin returns Russian Hill on all instruments. Clean.

### 5.5 Engine Co. No. 8 / Truck Co. No. 4 — `historic-site`
- **1648 Pacific Avenue.** **San Francisco Landmark No. 188**, designated 1988.
- Sources: DataSF 97yj-54sx ; .../LM188.pdf.
- Zone: 1648 Pacific returns Russian Hill (`analysis_neighborhood` Russian Hill too). Clean by
  the data — but 1648 Pacific is on the Polk Gulch slope and a guidebook would likely call it
  Polk Gulch or Nob Hill. **Soft flag.**
- Thin: **I found no build date or architect from a register.**

### 5.6 Sinton House — `historic-site` — private residence
- **1020 Francisco Street.** **Listed on the National Register of Historic Places in 2011,
  reference number 11000944.**
- Neighbouring interest: **Alma de Bretteville Spreckels**' childhood home was on the 1000 block
  of Francisco Street; an 1901 *San Francisco Examiner* item places her family at 1024 Francisco.
- Sources: NRHP listing table for San Francisco ; https://en.wikipedia.org/wiki/Russian_Hill,_San_Francisco
- Zone: 1020 Francisco returns Russian Hill. Clean.
- **It is a private house.** Recommend recording the designation but shipping it only if the
  corpus is comfortable with non-enterable residences. Flag.

### 5.7 Feusier Octagon House — `historic-site` — private residence, STRADDLER
- **1067 Green Street.** Built c. **1857–58 by George Kenny**, sold **1870 to Louis Feusier**;
  later given a third storey, mansard roof and cupola.
- **San Francisco Landmark No. 36** (1970) and **listed on the National Register of Historic
  Places in 1974, reference number 74000554**. Contributor to NRHP district 87002288.
- Landmark date discrepancy: the SF designated-landmarks list says 5 December 1970; the
  Wikipedia infobox says 1 October 1970; DataSF gives 1970. **Use the year only.**
- A private rental in 2018, offered for sale in 2021.
- Sources: https://en.wikipedia.org/wiki/Feusier_Octagon_House ; DataSF 97yj-54sx ;
  https://noehill.com/sf/landmarks/sf036.asp
- **ZONE FLAG: DataSF returns Nob Hill for 1067 Green** while the NRHP district containing it is
  named "Russian Hill–Paris Block". Arbitrator.
- **WRITING WARNING:** Wikipedia says the three surviving octagon houses in the city are this
  one, the McElroy Octagon House and the Land's End Marine Exchange Lookout. "One of only three"
  is a count, not a superlative, and publishes; "the last remaining" does not.

### 5.8 Atkinson House (Atkinson-Escher House) — `historic-site` — private, STRADDLER
- **1032 Broadway.** Built **1853**, by the partnership of architect **William H. Ranlett**,
  general contractor **Charles Homer** and mason **Joseph H. Atkinson**, who built three houses
  on what is now the Vallejo Street Crest in 1853–54. It survived the 1906 earthquake.
- **San Francisco Landmark No. 97**, designated 1977. Contributor to NRHP district 87002289.
- Sources: DataSF 97yj-54sx ; https://en.wikipedia.org/wiki/Atkinson_House_(San_Francisco,_California) ;
  https://noehill.com/sf/landmarks/sf097.asp ; Wiley, *National Trust Guide / San Francisco* (2000), p. 254.
- **WRITING WARNING:** "one of the oldest houses still standing in San Francisco" and "possibly
  one of the first examples of Italianate" are both superlatives with comparison classes. The
  1853 date publishes; the ranking does not.
- **ZONE FLAG: DataSF returns Nob Hill.** Arbitrator.

### 5.9 House of the Flag (Old Sheppard-Dakin House) — `historic-site` — private, STRADDLER
- **1652–1656 Taylor Street. San Francisco Landmark No. 46**, designated 1972.
- Sources: DataSF 97yj-54sx ; SF designated landmarks list.
- **ZONE FLAG: DataSF returns Nob Hill.** Its distance to the Russian Hill polygon is ~0.0012°.
  Genuinely on the line. Arbitrator.
- Thin: no build date from a register in my sources.

---

## 6. CANDIDATES — the everyday tier

### 6.1 Michelangelo Playground — `park`
- **1055 Greenwich Street** (dataset) / **"Greenwich and Jones"** (Rec & Park page). **0.48 acres**
  (dataset) / ".44-acre" (Rec & Park copy) — discrepancy. Hours 5 a.m.–midnight; restrooms
  8 a.m.–8 p.m. spring/summer, 8 a.m.–5:30 p.m. fall/winter.
- Playground, basketball court, community garden, picnic area, restrooms, grassy area.
- Rec & Park's own copy places it "tucked away between the North Beach and Russian Hill
  neighborhoods" — an operator-stated straddle. DataSF returns Russian Hill for 1055 Greenwich
  on all three instruments. **Soft flag against North Beach.**
- Source: https://sfrecpark.org/Facilities/Facility/Details/Michelangelo-Playground-257

### 6.2 Helen Wills Playground — `park` — STRADDLER
- **1401 Broadway**, at Broadway and Larkin. **0.92 acres.** Hours 5 a.m.–midnight; restrooms
  8 a.m.–8 p.m. spring/summer, 8 a.m.–5:30 p.m. fall/winter. Tennis courts, basketball courts,
  children's play area, paved playfields, a clubhouse. Named for tennis player **Helen Wills**.
- **ZONE FLAG:** DataSF `analysis_neighborhood` Russian Hill, `mons_neighborhood` **Polk Gulch**.
- Source: https://sfrecpark.org/Facilities/Facility/Details/Helen-Wills-Playground-244 ; `gtr9-ntp6`.

### 6.3 Hyde & Vallejo Mini Park — `park`
- **1825 Hyde Street** (dataset) / "Hyde and Vallejo" (Rec & Park). **0.11 acres.** 5 a.m.–midnight.
- **CAUTION:** Rec & Park's page for this park displays copy that actually describes the
  *Washington–Hyde* mini park ("in the City's Nob Hill neighborhood", ".15-acre"). That text is
  an error on the operator's site and must not be attributed to this park. Only the name,
  address, acreage and hours are safe.
- Source: https://sfrecpark.org/Facilities/Facility/Details/Hyde-Vallejo-Mini-Park-174

### 6.4 Washington & Hyde Mini Park — `park` — STRADDLER
- **1470 Washington Street**, Washington and Hyde. **0.16 acres.** Rec & Park hours read
  "5 to 11:45 a.m." — almost certainly a typo on their page for 5 a.m. to 11:45 p.m.
  **Do not publish those hours.** Modern playground styled as a colourful child-size city,
  soft rubber flooring.
- **ZONE FLAG:** `analysis_neighborhood` Russian Hill, `mons_neighborhood` **Nob Hill**;
  1470 Washington's EAS `nhood` = Russian Hill.
- Source: https://sfrecpark.org/Facilities/Facility/Details/Washington-Hyde-Mini-Park-210

### 6.5 Broadway Tunnel West Mini Park — `park`
- **1201 Broadway.** **0.12 acres.** Park hours 5 a.m.–12 a.m. Landscaped and hardscaped areas
  only; no described features.
- `mons_neighborhood` "Russian Hill, Nob Hill" — the dataset itself declares it a straddler.
- Source: https://sfrecpark.org/Facilities/Facility/Details/Broadway-Tunnel-West-Mini-Park-327
- Very thin. Probably below the bar; recorded for completeness.

### 6.6 Russian Hill Open Space — `park`
- Rec & Park facility, **"Hyde and Bay", 94109**. Park hours **5 a.m. to midnight**. No features
  listed, no description on the operator's page, and **it does not appear in the Rec & Park
  properties dataset under that name**.
- Source: https://sfrecpark.org/Facilities/Facility/Details/Russian-Hill-Open-Space-371
- Thin and jurisdictionally odd. Flagged.

### 6.7 The Broadway Tunnel (Robert C. Levy Tunnel) — `attraction`
- Officially the **Robert C. Levy Tunnel**. Opened **21 December 1952**; **1,616 ft** long; two
  bores of two lanes each. Funded by a **$5 million bond** passed by city voters in **1948**.
  Completion was originally projected for May 1952 but loose rock required shoring.
- The **west portal is just east of the Hyde Street overpass**; the east portal just east of the
  Mason Street overpass. With the two overpasses it carries Broadway uninterrupted for six
  blocks between Powell and Larkin. It runs **under Russian Hill**, connecting Chinatown and
  North Beach on the east to Russian Hill and Van Ness on the west.
- A right to tunnel "through Russian Hill, on the line of Broadway, from Mason to Hyde or Larkin"
  was granted by the California State Assembly on **22 April 1863** to Abner Doble and associates;
  Bion J. Arnold revived the idea in a March 1913 report to the city.
- **PHOTO NOTE:** a bronze dragon relief by **Patti Bowler** has been mounted above the *eastern*
  portal since 1969 — that portal is in Chinatown/North Beach and the relief is a sculpture,
  outside 17 USC 120(a). West portal photography of the structure itself is fine.
- Source: https://en.wikipedia.org/wiki/Broadway_Tunnel_(San_Francisco)
- **ZONE FLAG:** the tunnel spans three zones. It belongs to nobody or to Russian Hill by the
  hill it pierces. Arbitrator.

### 6.8 Powell–Hyde cable car line — `attraction` — CROSS-ZONE, see §7
- The **San Francisco cable car system is a National Historic Landmark, designated 29 January
  1964, National Register reference number 66000233**; built from **1873**, promoter
  **Andrew Smith Hallidie**, engineer William Eppelsheimer.
- The **Powell–Hyde line (route 60/PH) dates from 1957** and runs **2.1 miles**. Single-ended cars,
  27 ft 6 in long. The Hyde cable is 16,000 ft; the common Powell section 9,300 ft.
- Hyde Street is the Russian Hill segment; the line stops at the top of the Lombard crooked block.
- Sources: https://en.wikipedia.org/wiki/San_Francisco_cable_car_system ;
  NHL nomination by James Dillon, NPS ; https://www.sfmta.com/getting-around/muni/cable-cars ;
  https://www.sfmta.com/getting-around/transit/routes-stops/stops/5078
- **STRADDLER OF THE WORST KIND.** The system's museum is in Nob Hill (1201 Mason), the Powell &
  Market turntable is Union Square's, the Hyde & Beach turntable is Fisherman's Wharf's. Russian
  Hill owns only track. **I recommend Russian Hill NOT claim it** and instead let the arbitrator
  place it, but I am not deciding.

---

## 7. STRADDLERS — the complete list, none resolved by me

Grouped by which zone they are contested with. I flag; the arbitrator rules.

**Against Nob Hill (the Vallejo Street Crest problem):**
1. Russian Hill–Vallejo Street Crest District (NRHP 87002289) — the register says Russian Hill, DataSF says Nob Hill for three of its addresses
2. Russian Hill Place (1–7) — DataSF `nhood` = Nob Hill
3. Florence Street (1–49) — DataSF `nhood` = Nob Hill
4. Atkinson House, 1032 Broadway (SF Landmark 97) — DataSF Nob Hill
5. Feusier Octagon House, 1067 Green (SF Landmark 36, NRHP 74000554) — DataSF Nob Hill
6. Russian Hill–Paris Block Architectural District (NRHP 87002288) — spans 1017–1067 Green; 1050 Green is Russian Hill, 1067 Green is Nob Hill
7. House of the Flag, 1652–1656 Taylor (SF Landmark 46) — DataSF Nob Hill
8. Ina Coolbrith Park — `analysis_neighborhood` Nob Hill vs `mons_neighborhood` and the operator's own copy, both Russian Hill
9. Washington & Hyde Mini Park — `mons_neighborhood` Nob Hill
10. Glazer-Keating House, 1110 Taylor (SF Landmark 251) — DataSF Nob Hill; I judge it Nob Hill's and did not pursue it
11. Our Lady of Guadalupe Church, 906 Broadway (SF Landmark 204) — DataSF Nob Hill; likely Nob Hill's or Chinatown's

**Against Fisherman's Wharf (the Aquatic Park problem — DataSF's Russian Hill polygon runs to the water):**
12. **Ghirardelli Square**, 900 North Point St — SF Landmark 30, NRHP 82002249. DataSF `nhood` AND `analysis_neighborhood` both **Russian Hill**; the roster's draw line assigns it to Fisherman's Wharf. This is the single biggest ownership question in my zone.
13. **Haslett Warehouse / Argonaut Hotel**, 680 Beach St (mailing address 495 Jefferson St) — SF Landmark 59, NRHP 75000172. Same conflict.
14. **The Buena Vista**, 2765 Hyde St — DataSF `nhood` Russian Hill; every guidebook says Aquatic Park / Fisherman's Wharf. Own site confirms 2765 Hyde St: https://www.thebuenavista.com/
15. **Joseph Conrad Square**, 601 Beach St — `analysis_neighborhood` Russian Hill, `mons_neighborhood` Fisherman's Wharf; Rec & Park's own copy says "in the North Beach/Wharf area". Three answers, three zones.
16. **Dolphin Club / South End Rowing Club**, 500 Jefferson St — `analysis_neighborhood` Russian Hill, `mons_neighborhood` Fisherman's Wharf.
17. Hyde Street cable car turntable at Hyde & Beach — the terminus is Fisherman's Wharf's, the track is Russian Hill's.

**Against North Beach:**
18. Michelangelo Playground, 1055 Greenwich — Rec & Park's own copy says "between the North Beach and Russian Hill neighborhoods"
19. Bauer & Schweitzer Malting Company, 530–550 Chestnut (SF Landmark 129) — DataSF North Beach, 0.0021° from the Russian Hill line

**Against Polk Gulch / the Marina / no zone at all:**
20. Helen Wills Playground, 1401 Broadway — `mons_neighborhood` Polk Gulch
21. Engine Co. #8 / Truck Co. #4, 1648 Pacific Ave (SF Landmark 188) — DataSF Russian Hill, vernacular Polk Gulch
22. Bob's Donuts, 1621 Polk St — DataSF `nhood` **Nob Hill**; commonly described as Russian Hill in listings. Do not claim without a ruling.
23. **Burr House, 1772 Vallejo St** — SF Landmark 31, NRHP 14000967. DataSF says **Marina**; the NRHP listing table says Pacific Heights; some sources say Russian Hill because of the street name. **I believe this is NOT Russian Hill's** (it is west of Van Ness) but it will be claimed by someone and should be ruled.
24. The Broadway Tunnel — spans Russian Hill, Nob Hill, Chinatown and North Beach
25. Powell–Hyde cable car line / San Francisco cable car system (NHL 66000233) — spans Union Square, Nob Hill, Russian Hill, Fisherman's Wharf

---

## 8. COMMERCIAL TIER — thin, and I say so plainly

Russian Hill's commercial spine is Polk Street and the Hyde Street cable car blocks. The
identity-and-address layer is easy; anything about how long a business has traded is not
publishable from its own site, and I have applied that rule below.

| Candidate | Kind | Address (verified how) | Notes |
|---|---|---|---|
| **Cheese Plus** | shop | 2001 Polk St — own site https://www.cheeseplus.com/ ; EAS `nhood` Russian Hill | cheese and provisions shop |
| **Frascati** | restaurant | 1901 Hyde St — own site https://www.frascatisf.com/ ; EAS Russian Hill | on the Hyde cable car line |
| **Za Pizza** | restaurant | 1919 Hyde St — own site https://www.zapizzasf.com/ ; EAS Russian Hill | |
| **Real Food Company** | shop | 2140 Polk St — own site https://www.realfoodco.com/ ; EAS Russian Hill | grocer |
| **Russian Hill Bookstore** | shop | 2162 Polk St, (415) 929-0997 — own site https://www.russianhillbookstore.com/ ; EAS Russian Hill | used and new books, cards, gifts, toys, board games |
| **Crunch Polk Street** (in the Alhambra) | — | 2320–2336 Polk St | see §5.2; better shipped as the Alhambra |
| **The Buena Vista** | restaurant/bar | 2765 Hyde St — own site https://www.thebuenavista.com/ | **STRADDLER**, see §7 #14 |
| **Bob's Donuts** | shop | 1621 Polk St — own site https://bobsdonutssf.com/ | **DataSF says Nob Hill.** §7 #22 |

**Trading-duration claims I found and am NOT passing through:** Russian Hill Bookstore's own
site says "established in 1974" and "in continual operation for the past 50+ years", and also
"one of the few independently-owned used and new bookstores still operating in San Francisco".
Under the programme's rule a founding year from an operator's own site is a trading-duration
claim and does not publish; the third phrase is a superlative besides. Name, address, phone and
what it sells are all fine.

**Domains that failed for me and therefore yield nothing:** unionlarder.com (timeout),
zarzuelasf.com, ristorantemilanosf.com, hydestreetseafood.com, thebelltowersf.com,
swensensicecream.net (all DNS failures). **leopoldssf.com and swanoysterdepot.us now resolve to
unrelated squatted sites** — do not cite either. swensensicecream.com is the international
franchise operation, not the Hyde Street shop; the SF shop at 1999 Hyde has no site I could
reach, so I record the address (EAS confirms 1999 Hyde = Russian Hill) and nothing more.

---

## 9. THINGS I LOOKED FOR AND DID NOT FIND — negative results, recorded on purpose

- **No Article 10 historic district anywhere in Russian Hill.** The `knm6-5ej6` dataset has 20
  districts; the nearest are Telegraph Hill (Appendix G, 1986) and Jackson Square (Appendix B,
  1972). All three Russian Hill districts are National Register only. A page must not write
  "designated under Article 10" for them.
- **No San Francisco Public Library branch in Russian Hill.** I enumerated sfpl.org/locations;
  the nearest branches are North Beach (850 Columbus), Chinatown (1135 Powell) and Golden Gate
  Valley (1801 Green, itself SF Landmark 300, in the Marina).
- **No "George Sterling Park" in any city dataset or on sfrecpark.org.** §4.10.
- **No current public opening hours for 800 Chestnut Street** after the 2024 sale.
- The Diego Rivera Gallery is **permanently closed** (2022), so the fresco is not currently
  on public view by any source I could reach.
- Nominatim returned HTTP 403 to every query from this session; I substituted the DataSF EAS
  address dataset, which is a better instrument for this question anyway.

---

## 10. PHOTOGRAPHS — noted and moved on, per the programme

Photographs are a later wave; `"photos": []` everywhere. For the record, because it constrains
what the text may lean on:

- **Buildings — covered by 17 USC 120(a), fine from public land:** the SFAI campus at 800
  Chestnut, Engine House No. 31, the Alhambra, the Feusier Octagon House, the Filbert Street
  Cottages, the Fellowship Church, Ghirardelli Square, the Haslett Warehouse.
- **NOT covered — artworks:** the **Diego Rivera fresco** at 800 Chestnut (Rivera d. 1957), and
  the **Patti Bowler bronze dragon relief** over the Broadway Tunnel's east portal (1969, artist
  status unestablished). Both may be written about; neither may be photographed under 120(a).
- **Good existing Commons images noted:** `Macondray Lane 1.jpg`; `Feusier Octagon House (San
  Francisco).JPG`; `Alhambra Theatre from Southwest.JPG`; `Engine House No. 31 (San Francisco).JPG`;
  `1338 filbert.jpg`; `2041 Larkin Street, exterior, San Francisco (March 2024) 01.jpg`;
  `1, 3, 5 & 7 Russian Hill Place, Russian Hill-Vallejo Street Crest District…JPG`;
  `1030, 1050 & 1060 Green St., Russian Hill-Paris Block Architectural District…JPG`;
  `Lombard Street 2020.jpg`; `Alice-marble-tennis-courts.jpg`.

---

## 11. TALLY AND JUDGEMENT

**Candidates recorded: 33.** Marquee tier 11 (§4), designated-building tier 9 (§5), everyday
tier 8 (§6), commercial tier 8 minus two counted elsewhere (§8). **Designation identifiers
found: 23** — 12 Article 10 landmark numbers, 11 National Register reference numbers, plus 3
California OHP identifiers (N1542, N1543, N1549) used as corroboration rather than as primary
claims. **Straddlers flagged: 25.**

**Town page, not a guide.** Russian Hill has no single dominant anchor that the rest of the
zone orbits — it has a crooked street, three separate National Register districts, a closed art
school with a landmarked fresco, a four-and-a-half-acre park opened in 2022, a Thomas Church
garden, and a hilltop tennis court, none of which subsumes the others. That is the shape of a
neighbourhood page carrying fifteen to twenty places, not a guide.

**The three candidates I am least confident about:**
1. **George Sterling Park (§4.10)** — the name appears in literary sources and on the SF Parks
   Alliance, but in no city dataset; the land is PUC water-facility land. I would drop it and
   ship Alice Marble Courts, which is unimpeachable, unless someone finds a city source.
2. **Ghirardelli Square and the Haslett Warehouse (§7 #12–13)** — DataSF's own official boundary
   puts both squarely in Russian Hill, and the roster puts both in Fisherman's Wharf. I am
   confident about the *facts* and completely unconfident about the *zone*. The arbitrator's
   answer here changes the shape of two pages.
3. **Powell–Hyde cable car line (§6.8)** — the designation is rock solid (NHL, NRHP 66000233)
   and the zoning is hopeless. Russian Hill owns a segment of track and a stop. I suspect this
   should belong to no neighbourhood at all, on the Golden Gate Park precedent, but that is the
   arbitrator's call and not mine.

Also genuinely uncertain, one tier down: the **Filbert Street Cottages** and **Engine Co. #8 /
Truck Co. #4** both carry landmark numbers and almost nothing else — no build date, no architect,
no description from any register I could reach. They are citable but nearly contentless.
