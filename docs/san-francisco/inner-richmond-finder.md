# Inner Richmond — Finder's Research File

Zone: `inner-richmond` · destination `Inner Richmond, California` · town `San Francisco`
Roster draw: "Clement Street, the Columbarium of San Francisco, Temple Emanu-El, Green Apple Books,
the Internet Archive building on Funston, Presidio Heights edge, the Russian and Chinese
institutions along Geary."

Compiled 2026-09-03. Everything below is candidate material for a verifier and an arbitrator.
Nothing here is an ownership ruling. **Nothing here is publishable prose** — several entries record
phrasings that the build's regexes would reject, and they are marked.

---

## 0. RESERVATION CHECK — nothing in this zone is taken

`.superpowers/taken_slugs.py` globs `priv/seed_data/rome/*.json` only. It reports 1,747 Rome places
and is blind to the twelve shipped San Francisco files and everything in New York and Connecticut.
I used `.superpowers/vf_taken_all.py` instead, which globs `priv/seed_data/**/*.json` recursively:
**4,389 places across 349 files.**

Searched corpus-wide for `richmond`, `clement`, `geary`, `columbarium`, `emanu`, `green apple`,
`funston`, `presidio`, `golden gate park`, `ocean beach`, `sutro`, `lands end`, `arguello`,
`park presidio`. Results:

- `richmond` matches only **Richmond Hill, Queens** (12 places, different city, different slugs).
- `presidio` matches exactly one live place: `presidio-library-mini-park-pacific-heights`
  (3150 Sacramento St, Pacific Heights file). Not in this zone — EAS puts that address in Pacific
  Heights, 94115.
- `emanu` matches only Rome's Vittorio Emanuele entries. `clement` matches only Rome's San Clemente
  and Clementini. `ocean beach` matches `ocean-beach-park-new-london`, Connecticut.
- Nothing else collides.

**Zero collisions.** Every candidate below is unclaimed by slug and by name.

---

## 1. HOW I ASSIGNED ZONE — three locators, and I record the disagreements

**(a) DataSF Enterprise Addressing System, `3mea-di5p`.** Per-address, parcel-exact. Every row
carries `nhood`, the city's own Analysis Neighborhood assignment, plus `latitude`, `longitude` and
`parcel_number`. This is the authority. Note the schema quirk that costs you an hour: avenues are
zero-padded in `street_name` — `09TH`, `06TH`, `12TH` — and `street_type` separates `AVE` from `ST`,
so `450 07TH AVE` (Inner Richmond) and `450 07TH ST` (South of Market) are distinct rows.
  https://data.sfgov.org/resource/3mea-di5p.json

**(b) DataSF Analysis Neighborhoods polygon, `j2bu-swwd`,** 41 rows, with my own ray-casting
point-in-polygon. Used for landmark and NRHP geometries that carry no street address, and as an
independent check on (a). **Every single EAS `nhood` value I tested agreed with my own
point-in-polygon result** — 40+ probes, zero disagreements. That is the strongest signal in this
file: for Inner Richmond, the official line is unambiguous and the tooling is consistent.
  https://data.sfgov.org/resource/j2bu-swwd.json

**(c) The vernacular**, from Wikipedia, noehill.com, and the institutions' own copy. This is where
all the disagreement lives, and it is systematic, not random. See §3.

---

## 2. THE BOUNDARY AS DATASF DRAWS IT

The Inner Richmond polygon (MultiPolygon, 70 vertices, one ring) sits inside
`-122.47263, 37.77314` → `-122.45837, 37.78971`. Read off the ring and confirmed against EAS probes:

- **East: Arguello Boulevard.** The ring's east edge tracks -122.4584 to -122.4595. Odd-numbered
  (west-side) Arguello addresses are Inner Richmond — `201`, `325`, `397` all return Inner Richmond.
  Even-numbered (east-side) addresses are Presidio Heights — `200`, `350`, `460` all return
  Presidio Heights. The centre line of Arguello is the boundary.
- **West: Park Presidio Boulevard.** `1150/1152/1156 CLEMENT ST` are the last Inner Richmond rows;
  `1500` and `1600 CLEMENT ST` are Outer Richmond. On Geary the break is between `4800` (Inner) and
  `5000` (Outer); on California between `5000` (Inner) and `5200` (Outer); on Lake between `1000`
  (Inner) and `1200` (Outer/Seacliff); on Balboa, Cabrillo and Clement between the 1000 and 1200
  blocks; on Anza between `800` (Lone Mountain/USF) and `1000` (Inner Richmond).
- **South: Fulton Street,** the north kerb of Golden Gate Park. Ring south edge runs 37.7732–37.7742.
- **North: the Presidio boundary, not a street.** The ring's top edge is a diagonal running from
  `-122.45948, 37.78971` down to `-122.47235, 37.78723`. That is the Presidio's southern wall. On
  Funston Avenue, `2`–`63 FUNSTON AVE` return **Presidio**; `120 FUNSTON AVE` and everything above
  return **Inner Richmond**. Mountain Lake Park is inside this northern lobe.

**The vernacular boundary is different and the difference matters.** Wikipedia's Richmond District
article states Inner Richmond's boundaries as *"California St. to the north, Arguello Blvd to the
east, Fulton St. to the south, and Park Presidio Blvd. to the west."*
  https://en.wikipedia.org/wiki/Richmond_District,_San_Francisco

That north line — California Street — is **three to four blocks south of where DataSF draws it.**
Everything in the band between California Street and the Presidio wall is contested by that reading:
Temple Emanu-El, St. John's Presbyterian Church, Mountain Lake Park, the whole of Lake Street, and
the 3900–5000 blocks of California Street itself. DataSF's east and west and south lines match the
vernacular exactly. Only the north line moves. **Flagged for the arbitrator; not resolved here.**

---

## 3. THE STRADDLERS — flagged, not resolved

Eight. Ranked by how much turns on them.

**S1 — Mountain Lake Park.** Rec & Park `gtr9-ntp6` gives its `analysis_neighborhood` as the literal
string **"Inner Richmond, Presidio"** — the dataset itself declines to pick. 12.96241818 acres,
address `1 11th Ave`, propertytype "Neighborhood Park or Playground". EAS puts `1 11TH AVE` in Inner
Richmond (37.78683, -122.47017). But the *lake* is claimed by the Presidio Trust, which lists
Mountain Lake under its "Southern Wilds Region" and describes its own restoration of the water and
soil. So the city park and the federal lake are two different things sharing a name, on two sides of
a line. The Presidio is one of the eleven zones. This is the hardest call in the set.
  https://data.sfgov.org/resource/gtr9-ntp6.json
  https://www.presidio.gov/places/mountain-lake

**S2 — San Francisco Columbarium, 1 Loraine Court.** SF Landmark No. 209. EAS and my
point-in-polygon both return **Lone Mountain/USF**, and noehill's own header locates it *"Between
Stanyan and Arguello Off Anza, Lone Mountain."* But Wikipedia places it in the Inner Richmond, and
the operator's own page says it *"sits in the Richmond District."* Lone Mountain/USF is **not** one
of the eleven zones, so if the arbitrator honours DataSF this place has no home at all. It is in the
roster draw for this zone. Coordinates 37.78040, -122.45704.
  https://noehill.com/sf/landmarks/sf209.asp
  https://www.dignitymemorial.com/funeral-homes/san-francisco-ca/san-francisco-columbarium-funeral-home/8131
  https://en.wikipedia.org/wiki/San_Francisco_Columbarium_%26_Funeral_Home

**S3 — Theodore Roosevelt Middle School, 460 Arguello Boulevard.** SF Landmark No. 285. EAS returns
**Presidio Heights** (even number, east side of Arguello); point-in-polygon agrees. Its Article 10
parcel centroid also lands in Presidio Heights. Presidio Heights is not one of the eleven zones.
The school's catchment and every colloquial description put it in the Richmond.

**S4 — Angelo J. Rossi Playground, 600 Arguello Boulevard.** 7.08433275 acres, Rec & Park. EAS and
polygon both return **Lone Mountain/USF**. Same orphaning problem as S2.

**S5 — Temple Emanu-El, 2 Lake Street.** EAS returns **Inner Richmond**; my point-in-polygon agrees
(37.78703, -122.45978; parcel 1355011, the block bounded by Lake, Arguello, California and 2nd
Avenue). But under the vernacular north-boundary reading (California Street) it falls outside the
zone entirely, and popular description attaches it to Presidio Heights / Presidio Terrace. Data says
Inner Richmond, cleanly and twice. Included in the roster draw for this zone.

**S6 — "Bear and Lion", M. Earl Cummings, 1908.** Civic Art Collection accession 1908.3.a-b,
`street_address_or_intersection` = "8th Avenue & Fulton Street", `analysis_neighborhood` = **Inner
Richmond**, but `facility` = **Golden Gate Park**. The Arts Commission and Rec & Park disagree about
which side of Fulton Street the piece stands on. Golden Gate Park is one of the eleven zones.
Catalogued as three rows (the pair, plus "Bear" and "Lion" separately).
  https://data.sfgov.org/resource/r7bn-7v9c.json

**S7 — Park Presidio Boulevard, the parkway itself.** Rec & Park property, 20.38628898 acres,
`analysis_neighborhood` = **"Outer Richmond, Inner Richmond, Seacliff, Presidio"**. Four zones in one
string. It is the zone's western edge and it is also a place.

**S8 — Presidio Terrace Historic District.** SF Planning's survey-district layer `m22e-6hkz`,
objectid 98: geometry centroid lands in **Inner Richmond**, while the record's own `neighborhood`
field reads **"Presidio Heights"**. Note that this district is `cr: Eligible`, `nr: No`, `a10: No` —
see §5 for why that means no designation claim can be made about it.

---

## 4. DESIGNATION NUMBERS — six identifiers across five properties

Every one re-fetched today against the live registers. This is thin ground: the Inner Richmond is a
streetcar-suburb grid of flats, and the city has designated very few of its buildings.

| Property | Address | Register + identifier | Designated | Zone per DataSF |
|---|---|---|---|---|
| St. John's Presbyterian Church | 25 Lake St / 201 Arguello Blvd | **San Francisco Landmark No. 83** | 1976 | Inner Richmond |
| St. John's Presbyterian Church | 25 Lake St and 201 Arguello Blvd | **National Register ref. 95001555** | certified 01/22/96 | Inner Richmond |
| Campfire Girls Building | 325 Arguello Blvd | **San Francisco Landmark No. 169** | 1984 | Inner Richmond |
| Richmond Branch Carnegie Library | 351–359 9th Ave | **San Francisco Landmark No. 247** | 2005 | Inner Richmond |
| Theodore Roosevelt Middle School | 460 Arguello Blvd | **San Francisco Landmark No. 285** | 2019 | Presidio Heights (S3) |
| San Francisco Memorial Columbarium | 1 Loraine Ct | **San Francisco Landmark No. 209** | 1996 | Lone Mountain/USF (S2) |

Sources: Article 10 landmarks `97yj-54sx` (370 rows, fields `landmarkno`, `yeardesignated`, `apn`);
NPS `nrhp_locations` layer 0, queried by envelope `-122.52,37.765,-122.44,37.795` and by
`County='San Francisco'` (170 rows).
  https://data.sfgov.org/resource/97yj-54sx.json
  https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0/query

**Secondary dates worth a second look before publishing.** noehill gives LM 83 as *"April 8, 1976
(City Planning Commission Resolution 7473)"*, LM 169 as *"February 23, 1984"*, LM 285 as *"March 5,
2019"*; Wikipedia gives LM 209 as *"March 3, 1996"*. DataSF's `yeardesignated` agrees on the year in
all four cases. The day-level dates come from secondary sources — a verifier should either confirm
them against the designating ordinance or publish the year alone.
  https://noehill.com/sf/landmarks/sf083.asp · sf169.asp · sf247.asp · sf285.asp

**Parcel cross-checks that came out clean:** LM 247's APN in `97yj-54sx` is `1441007`; EAS returns
`parcel_number: 1441007` for `351 09TH AVE`. LM 169's APN is `1432003`, LM 83's is `1361001`, LM
285's is `1061049`, LM 209's is `1084002`.

**NEGATIVE FINDING, and an important one: Temple Emanu-El carries no designation.** It is not in
`97yj-54sx` under any spelling — the only `emanu` hit in the Article 10 dataset is "Congregation
Emanu-El School Buildings, 1337 SUTTER ST" with `landmarkno: 0`. It does not appear in the 170 San
Francisco rows of the National Register layer. noehill's San Francisco landmark index lists four
Richmond District landmarks and Temple Emanu-El is not among them. **Any sentence about Temple
Emanu-El's protection status fails the build. Do not write one.**

**Also `landmarkno: 0`, i.e. not designated,** in the Richmond-area rows of `97yj-54sx`: "Site of
Mel's Diner Sit Ins" (3355 Geary Blvd, Lone Mountain/USF), "George Washington High School" (682 32nd
Ave, Outer Richmond), "Wolski House" (3655 Clay St), "Russell House" (3778 Washington St). Zeroes are
survey rows, not designations.

---

## 5. THE SURVEY-DISTRICT TRAP — read before writing any "historic district" sentence

SF Planning's `m22e-6hkz` layer looks like a designation dataset and is not. Three of its polygons
sit in Inner Richmond:

- **Inner Richmond Nelson Historic District**, objectid 34, period of significance 1910–1914,
  `cr: Eligible`, `nr: No`, `a10: No`, `a11: No`, origin `2013.0670E`, criterion 3 only.
- **Richmond Heights Historic District**, objectid 97, 1910–1911, `cr: Eligible`, `nr: No`,
  `a10: No`, origin `2007.0674E`, criteria 1 and 3.
- **Presidio Terrace Historic District**, objectid 98, 1905–1915, `cr: Eligible`, `nr: No`,
  `a10: No`, origin `2016-015638ENV` — and see S8.

`Eligible` means a Planning survey judged the district *capable of* listing. `nr: No` means it is
**not on the National Register**. `a10: No` means it is **not an Article 10 district**. There is no
identifier to cite because no register has issued one. A sentence like "the Inner Richmond Nelson
Historic District" would be a bare designation claim and would fail the regex.

The nearest genuinely *listed* districts are all outside the zone: Golden Gate Park Historic District
(`Listed`), Presidio of San Francisco Historic District (`Listed`), West Fort Miley (`Listed`,
Outer Richmond), Southern Pacific Company Hospital (`Listed`, NR 89000319, Lone Mountain/USF).
  https://data.sfgov.org/resource/m22e-6hkz.json

**And per the standing rule: do not tally the designations.** Six identifiers are named above; the
prose should name buildings and cite numbers and never say how many there are.

---

## 6. CANDIDATES

Eighty-seven. Zone given is DataSF's unless marked. Founding years from operators' own sites are
recorded here for the verifier's context and are **trading-duration claims that do not publish**.

### 6.1 Designated buildings — the four with clean numbers

1. **St. John's Presbyterian Church** — church — 25 Lake Street / 201 Arguello Boulevard, 94118 —
   Inner Richmond (EAS + polygon, 37.78679, -122.45967). Built 1905; architects George Dodge and
   J. Walter Dolliver. SF Landmark No. 83; National Register ref. 95001555, certified 22 January
   1996. The NPS record's own address string is "25 Lake St. and 201 Arguello Blvd." — it occupies
   the corner. The only property in the zone carrying two registers.
   https://noehill.com/sf/landmarks/sf083.asp · NPS layer 0 · `97yj-54sx`

2. **Richmond / Senator Milton Marks Branch Library** — library — 351 9th Avenue, 94118 — Inner
   Richmond (parcel 1441007). Built 1914; architects Bliss & Faville; Classical Revival. SF Landmark
   No. 247, designated 2005. SFPL's own history page: the branch was *"the fourth branch established
   within the San Francisco Public Library system"*, first sited in 1892 at 809 Point Lobos Avenue;
   *"In 1914 a new Richmond Branch opened at the current location, the first library building in San
   Francisco constructed with Andrew Carnegie grant funds"*; *"The Richmond Renovation was completed
   on May 16, 2009."* Hours as published: Sun 1–5, Mon 10–6, Tue–Thu 10–8, Fri 1–6, Sat 10–6.
   Phone 415-355-5600. **Caution:** "the first library building in San Francisco constructed with
   Carnegie funds" and noehill's "the first of seven Carnegie branch libraries built in San
   Francisco" read as ordinal-sequence claims, but a verifier should decide whether "the first X in
   the city" trips the superlative regex. The safe form is the bare date, 1914.
   https://sfpl.org/locations/richmond/richmond-library-history · https://sfpl.org/locations/richmond
   https://noehill.com/sf/landmarks/sf247.asp

3. **Campfire Girls Building** — meeting hall — 325 Arguello Boulevard, 94118 — Inner Richmond
   (37.78459, -122.45949; APN 1432003). Built 1929; architect Henry Gutterson. SF Landmark No. 169,
   designated 1984. noehill records the address as "325 Arguello Boulevard Between California and
   Clement" and describes redwood trim, panelling and beams in trussed cathedral vaults in the
   central meeting hall. **Its current occupant and public access are unestablished** — see §8.
   https://noehill.com/sf/landmarks/sf169.asp

4. **Theodore Roosevelt Middle School** — school — 460 Arguello Boulevard, 94118 — **Presidio
   Heights per EAS and polygon (S3)**. Built 1929–1930; architect Timothy Pflueger. SF Landmark No.
   285, designated 2019. Three New Deal murals: two by Horatio Nelson Poole in the main lobby, one
   by George Wilson Walker in the auditorium. **Banned phrasings present in the source:** "the only
   known example of this avant-garde approach in San Francisco and possibly the entire United
   States", "an exceptional example". Murals are not covered by 17 USC 120(a) — write about them,
   say nothing about why there is no picture.
   https://noehill.com/sf/landmarks/sf285.asp

### 6.2 The Columbarium (straddler S2)

5. **San Francisco Columbarium & Funeral Home** — columbarium — One Loraine Court, 94118 — **Lone
   Mountain/USF per EAS and polygon**. Completed 1898; architect Bernard J. S. Cahill. SF Landmark
   No. 209, designated 1996. Neo-classical, copper dome. Operator's own copy: *"a large rotunda,
   mosaic tile floors, ornate stained-glass windows and a domed skylight"*; a 45-foot atrium
   encircled by balconies across four floors; six ground-floor rooms with stained glass, some
   attributed to Louis Comfort Tiffany and John La Farge; three main halls named Hall of Olympians,
   Hall of Titans and Hall of Heroes. Office hours Monday–Friday 9am–5pm; phone 415-771-0717. It
   stood in the Odd Fellows Cemetery; San Francisco prohibited cremation in 1910 and the cemetery's
   burials were moved out of the city; the Neptune Society of Northern California began restoration
   in 1980.
   **Two source conflicts to resolve before publishing a number:** the operator says approximately
   8,500 niches and Wikipedia agrees; noehill says *"over five thousand niches"*. Wikipedia gives the
   rotunda as 64 feet from entrance to stained-glass window, inner circle 29 feet wide, roughly 45
   feet high; the operator says only "45-foot atrium". Publish neither figure without a third source.
   **Banned phrasing present in the source:** "the only non-denominational burial place within San
   Francisco's city limits that is open to the public and has space available."
   https://www.dignitymemorial.com/funeral-homes/san-francisco-ca/san-francisco-columbarium-funeral-home/8131
   https://noehill.com/sf/landmarks/sf209.asp

### 6.3 Places of worship and religious institutions

6. **Temple Emanu-El** — synagogue — 2 Lake Street, 94118 — Inner Richmond (EAS + polygon, parcel
   1355011). Completed 1926; dedicated over three days, 16, 17 and 18 April 1926; architect Arthur
   Brown Jr. Dome height given as 150 feet. **No designation of any kind — see §4.** The
   congregation's own site returned 403 to every fetch, so the building facts here rest on
   Wikipedia's infobox and history section and **must be re-sourced by the verifier** before any of
   them publish. Straddler S5.
   https://en.wikipedia.org/wiki/Congregation_Emanu-El_(San_Francisco)
7. **Star of the Sea Church** — Catholic parish church — 4420 Geary Boulevard at 8th Avenue, 94118 —
   Inner Richmond (EAS, 37.78121, -122.46700). **Unsourced beyond the address.** `staroftheseasf.com`
   is now an unrelated Thai-language site and the Archdiocese parish page returned 403. Nothing about
   this parish should publish until someone reaches a live parish source.
8. **St. James Episcopal Church** — church — 4620 California Street, 94118 — Inner Richmond (EAS,
   37.78494, -122.46720). Address confirmed; no other fact sourced.
9. **Congregation Anshey Sfard, 1500 Clement Street** — EAS returns **Outer Richmond**. Out of zone.
10. **Congregation Beth Sholom, 301 14th Avenue** — EAS returns **Outer Richmond**. Out of zone;
    listing it here so the arbitrator sees it was checked and excluded.
11. **Holy Virgin Cathedral, 6210 Geary Boulevard** — EAS returns **Outer Richmond** (37.78033,
    -122.48634). The Russian Orthodox cathedral the roster draw gestures at is **not in this zone.**
    Neither is the Alexandria Theatre (5400 Geary, Outer Richmond) nor the 4 Star (2200 Clement,
    Outer Richmond). The "Russian institutions along Geary" are, with the exceptions at §6.6, west
    of Park Presidio.

### 6.4 The Internet Archive and Funston Avenue

12. **Internet Archive** — archive / library — 300 Funston Avenue, 94118 — Inner Richmond (EAS,
    37.78230, -122.47175). Wikipedia: *"Since 2009, its headquarters have been at 300 Funston Avenue
    in San Francisco, a former Christian Science Church"*; before that the Archive was in the
    Presidio from 1996. **Year built, architect and the church's exact former name are unsourced** —
    `archive.org/about/`, `/about/contact.php`, `help.archive.org` and the 2009 blog post all failed
    to yield them, and the common attribution (Fourth Church of Christ, Scientist, 1923) is
    unverified. Do not publish a build year or an architect. Do not publish tour or visiting hours;
    no source obtained states them and the correct sentence is about the fact, not the fetching.
    https://en.wikipedia.org/wiki/Internet_Archive
13. **Funston Avenue north of the Presidio wall** — street — the EAS break is sharp and citable:
    `2`–`63 FUNSTON AVE` return Presidio; `120 FUNSTON AVE` and above return Inner Richmond. Useful
    as a boundary fact, thin as a place.

### 6.5 Parks, public land and public art

14. **Mountain Lake Park** — park — 1 11th Avenue, 94118 — **"Inner Richmond, Presidio" per Rec &
    Park (S1)**. 12.96241818 acres. EAS puts the address in Inner Richmond at 37.78683, -122.46910.
    Hours unsourced — the Rec & Park facility detail page could not be located by id and the generic
    city park hours (5 a.m. to midnight) are attested only for other parks.
15. **10th Avenue & Clement Mini Park** — park — 351 9th Avenue, 94118 — Inner Richmond.
    0.93242788 acres per `gtr9-ntp6`, where the property is named "10th Ave & Clement Park"; Rec &
    Park's own facility page names it "10th Avenue & Clement Mini Park" — **name discrepancy, pick
    one and say why.** Park hours 5 a.m. to midnight; restroom 8 a.m. to 8 p.m. Playground with
    swings and soft rubber flooring, grass and benches. It shares its address with the Carnegie
    library and the two **physically adjoin** — which is permitted orientation.
    https://sfrecpark.org/Facilities/Facility/Details/10th-Avenue-Clement-Mini-Park-141
16. **Muriel Leff Mini Park** — park — 450 7th Avenue, 94118 — Inner Richmond (EAS confirms
    `450 07TH AVE`). 0.23791683 acres per `gtr9-ntp6`. Rec & Park's page gives the location as
    "7th Avenue and Geary"; the Arts Commission gives the sculpture's location as "7th Avenue & Anza
    Street" — **cross-street discrepancy, the park runs between them.** Park hours 5 a.m. to
    midnight. Renovated and reopened April 2023.
    https://sfrecpark.org/facilities/facility/details/Mountain-Lake-Park-192 (page served is Muriel Leff)
17. **"Red Gothic", Aristides Demetrios, 1986** — sculpture — Muriel Leff Mini Park, 7th Avenue &
    Anza Street — Inner Richmond per the Arts Commission. Painted steel on concrete, 84 × 52 × 36
    inches. Accession 1987.42, gift of the Syril Lerner Foundation. A sculpture: writable, and the
    photo question is not the reader's business.
18. **"Touching Earth", Scott Donahue, 2010** — sculpture — 351 9th Avenue — Inner Richmond. Epoxy
    bronze, porcelain enamel, concrete and steel; 36 × 50 × 50 inches. Accession 2010.5.1-2,
    commissioned by the San Francisco Arts Commission for the Richmond Branch library.
19. **"Bear and Lion", M. Earl Cummings, 1908** — sculpture — 8th Avenue & Fulton Street — **Inner
    Richmond per the Arts Commission, facility Golden Gate Park (S6)**. Bronze on cast concrete.
    Accessions 1908.3.a-b (pair), 1908.3.a ("Bear", 115 × 72 × 48 in.), 1908.3.b ("Lion", 116 × 87 ×
    64 in.). Gift of Suzanna Brown.
20. **Angelo J. Rossi Playground** — park and pool — 600 Arguello Boulevard, 94118 — **Lone
    Mountain/USF per EAS and polygon (S4)**. 7.08433275 acres, the largest Rec & Park holding
    anywhere near the zone. *(Note: "the largest" is my working note and is a banned superlative in
    prose. The publishable form is the acreage.)*
21. **Park Presidio Boulevard** — parkway — no street address in `gtr9-ntp6` — **four zones (S7)**.
    20.38628898 acres, propertytype "Parkway", centroid 37.78014, -122.47230.
22. **Golden Gate Park's north kerb along Fulton Street** — the zone's south edge. The park is its
    own zone; the 8th Avenue and 6th Avenue entrances face into the Inner Richmond grid. Recorded so
    the arbitrator knows the edge was considered, not as a candidate for this file.

### 6.6 Clement Street — the corridor and its shops

Clement Street runs from Arguello Boulevard west; EAS makes `1`–`1156` Inner Richmond and `1200`
upward Outer Richmond. Business rows below are from the city's registered business locations
dataset, filtered to `city='San Francisco'`, `business_zip='94118'`, `location_end_date IS NULL`,
address containing "Clement", numbers under 1200 — 452 raw rows, deduplicated by name and address.
`location_start_date` is a **registration** date, not a trading-duration fact, and does not publish.
  https://data.sfgov.org/resource/g8m3-pdis.json

23. **Clement Street** — commercial street — Inner Richmond. Wikipedia describes Geary Boulevard and
    Clement Street together as *"the hub of the Inner Richmond"* and as *"particularly known for
    Chinese, Thai, Korean, Burmese, and Russian cuisine"*; it also states *"The 2 bus runs on
    Clement."* Good for a street entry; needs a Muni source for the route.
24. **Green Apple Books** — bookshop — 506 Clement Street, 94118 — Inner Richmond (37.78320,
    -122.46471). Registered as "Green Apple Bookstore", 506 Clement St. The store's own site lists
    three locations — 506 Clement St; Green Apple Books on the Park, 1231 9th Ave (**Inner Sunset,
    out of zone**); and Browser Books on Fillmore Street (**out of zone**) — and states that
    "Sell Us Your Books" runs *"10am-6pm Daily. Only at Clement St."* Per-store opening hours are not
    on any page I could reach; `/about`, `/contact`, `/clement` and `/pages/locations` all 404 or
    carry only a form. **Do not publish hours.** The annex at 520 Clement Street is a separate EAS
    address (37.78319, -122.46489) and a separate shopfront.
    https://greenapplebooks.com/
25. **Clement Street Farmers Market** — market — 244 Clement Street, 94118 — Inner Richmond.
    Registered as "Clement Farmers Market" at 244 Clement St, and the **Agricultural Institute of
    Marin** holds a registration at the same address — AIM is the operator. Twenty-odd vendor
    businesses register to 244 Clement St, among them Rize Up Bakery, Volcano Kimchi, Cap'n Mike's
    Holy Smoke, The Hummus Guy, Joodooboo, Canteen Meats and Saltwater Bakeshop. **Day and hours
    unsourced** — `sfmarkets.org` does not resolve. Find AIM's own listing before publishing a time.
26. **Burma Superstar** — restaurant — 309 Clement Street, 94118 — Inner Richmond. Own site, exact:
    dine-in lunch Mon–Thu 11:30am–3:00pm, Fri–Sun 11:30am–3:30pm; dinner Sun–Thu 5:00pm–9:30pm,
    Fri–Sat 5:00pm–10:00pm; takeout lunch Mon–Thu 11:30am–2:30pm, Fri–Sun 11:30am–3:00pm; takeout
    dinner Sun–Thu 5:00pm–10:30pm, Fri–Sat 5:00pm–10:30pm. Phone (415) 387-2147. The site says the
    menu and hours are for the Clement Street location. **"the original restaurant" is the site's own
    wording and is a trading-sequence claim about the business — treat as non-publishing.**
    https://www.burmasuperstar.com/
27. **B Star** — restaurant — 127 Clement Street, 94118 — Inner Richmond. Registered as "Bstar".
    Burma Superstar's site names it as a sister restaurant without an address; the registration
    supplies the address.
28. **The Plough and Stars** — pub — 116 Clement Street at 2nd Avenue, 94118 — Inner Richmond
    (37.78337, -122.46052). Own site: *"Home of Traditional Irish Music in the Bay Area"*; live
    performances from 9pm; seisiúns Saturday and Sunday afternoons 1–4pm; set dancing; Old Time Jam
    on selected Tuesdays 7–9:30pm; board games on the first and third Mondays; cover charge Friday
    and Saturday nights. Hours as published: Sun 11am–2am; Mon–Tue 5pm–2am; Wed 3pm–2am; Thu 4pm–2am;
    Fri 3pm–2am; Sat 2pm–2am. Phone (415) 751-1122. **Banned:** the site's "voted best Irish pub by
    SF Weekly" is a superlative from an attributed source and still does not publish.
    https://www.theploughandstars.com/
29. **Park Life** — shop and gallery — 220 Clement Street, 94118 — Inner Richmond. Own site
    describes it as *"Contemporary Art and Design in San Francisco since 2006"* and lists *"Books,
    Design Objects, Editions, Apparel, Art, Stationery, Gifts, Prints, Bags, Hats, Jewelry and
    more"*; the gallery runs rotating exhibitions. **"since 2006" does not publish.** Address comes
    from the business registration, not the site. Hours not published on any page reached.
    https://www.parklifestore.com/
30. **Paper Museum Press** — publisher — 220 Clement Street — Inner Richmond. Registered at the same
    address as Park Life; the two are related. Weak as a standalone place.
31. **Schubert's Bakery** — bakery — 521 Clement Street (between 6th and 7th Avenues), 94118 —
    Inner Richmond. Own contact page, exact: Wed–Sat 9am–5pm, Sun 9am–4pm, closed Mon and Tue; phone
    415-752-5180, answered 9:00am–5:00pm Wednesday through Friday. **Their "since 1911" does not
    publish.** Note the registration's `location_start_date` of 2025-09-04 at this address — the
    business moved here; do not build a narrative on it.
    https://schubertsbakery.com/pages/contact
32. **Toy Boat by Jane** — dessert café — 401 Clement Street, 94118 — Inner Richmond. Registration
    name and address confirmed; `toyboatsf.com` does not resolve. No hours.
33. **Blue Danube Coffee House** — café — 306 Clement Street, 94118 — Inner Richmond (37.78316,
    -122.46251). Registration confirmed. No hours sourced.
34. **Wing Lee Bakery** — bakery — 503 Clement Street, 94118 — Inner Richmond (37.78280,
    -122.46459). Registered; "Wing Lee BBQ Restaurant" registers separately at 501 Clement St.
35. **Good Luck Dim Sum** — dim sum counter — 736 Clement Street, 94118 — Inner Richmond (37.78308,
    -122.46720). Registered.
36. **Richmond New May Wah Supermarket** — grocery — 707 Clement Street (registration shows
    `707 Clement St #711`, and a second registration at 719 Clement St), 94118 — Inner Richmond
    (37.78259, -122.46685). Occupies more than one shopfront.
37. **Kamei Restaurant Supply / Kamei Household Wares** — housewares — 525 and 547 Clement Street,
    94118 — Inner Richmond. Two registrations, two shopfronts.
38. **Cheung Hing Chinese Deli** — deli — 323 Clement Street — Inner Richmond.
39. **Giorgio's Pizzeria** — restaurant — 151 Clement Street — Inner Richmond.
40. **Chapeau!** — restaurant — 126 Clement Street — Inner Richmond. Registered alongside
    "Clementine Restaurant LLC" at the same address.
41. **Foggy Notion** — shop — 124 Clement Street — Inner Richmond.
42. **Woot Bear** — shop — 147 Clement Street — Inner Richmond.
43. **Standard Plumbing Ace Hardware** — hardware — 144 and 152 Clement Street — Inner Richmond.
44. **Wako Japanese Restaurant** — restaurant — 211 Clement Street — Inner Richmond.
45. **Kitchen Istanbul** — restaurant — 349 Clement Street — Inner Richmond.
46. **Pasta Supply Co.** — shop — 236 Clement Street — Inner Richmond.
47. **Genki Crepes & Mini Mart** — café and shop — 330 Clement Street — Inner Richmond.
48. **Sixth Avenue Aquarium** — aquarium shop — 425 Clement Street — Inner Richmond. Registered as
    "Sixth Ave. Aquarium"; the shop's name and its street do not agree, which is worth a sentence.
49. **Neck of the Woods** — music venue — 406 Clement Street — Inner Richmond. Registered; **check
    whether it still trades before writing it as open.**
50. **High Treason** — wine bar — 443 Clement Street — Inner Richmond. Registered with "Pivotal
    Wines Inc" and "Unco Frank's" at the same address.
51. **Mamahuhu** — restaurant — 517 Clement Street — Inner Richmond.
52. **Lost Marbles Brewpub** — brewpub — 823 Clement Street — Inner Richmond.
53. **Clement Seafood Center** — fishmonger — 831 Clement Street — Inner Richmond.
54. **Wing Hing Seafood Market** — fishmonger — 633 Clement Street — Inner Richmond.
55. **Red A Bakery / Red A Dim Sum** — bakery — 634 Clement Street — Inner Richmond.
56. **Cherry Blossom Bakery** — bakery — 844 Clement Street — Inner Richmond.
57. **Tai Hing Book Store** — bookshop — 848 Clement Street — Inner Richmond. A Chinese-language
    bookshop; pairs with Green Apple as a second bookseller on the street.
58. **Locals Cafe / Richmond Republic** — bar and café — 642 Clement Street — Inner Richmond. Three
    registrations at one address; establish which trades before writing.
59. **See's Candies** — confectioner — 754 Clement Street — Inner Richmond.
60. **Heroes Club** — bar — 840 Clement Street — Inner Richmond.
61. **Cable Car Wine and Spirits** — off-licence — 841 Clement Street — Inner Richmond.
62. **Keeva Indian Kitchen** — restaurant — 908 Clement Street — Inner Richmond.
63. **All Stars Donuts** — bakery — 901 Clement Street — Inner Richmond.
64. **Nakorn Thai** — restaurant — 639 Clement Street — Inner Richmond.
65. **Xiao Long Bao Restaurant** — restaurant — 625 Clement Street — Inner Richmond.
66. **Sakesan** — restaurant — 626 Clement Street — Inner Richmond.
67. **Taishan Taste Hot Pot** — restaurant — 354 Clement Street — Inner Richmond.
68. **Mais Vietnamese Restaurant** — restaurant — 316 Clement Street — Inner Richmond.
69. **Café Bunn Mi** — restaurant — 417 Clement Street — Inner Richmond.
70. **King's Thai Cuisine** — restaurant — 346 Clement Street — Inner Richmond.
71. **Lime Tree** — restaurant — 836 Clement Street — Inner Richmond.
72. **Tenglong Chinese Restaurant** — restaurant — 208 Clement Street — Inner Richmond.

*(Entries 38–72 are single-source: the city business registration establishes name, address and that
the location has no end date. That is enough for existence and address and nothing else. A verifier
should either reach each operator's own site or cut them. I would expect most to be cut; they are
listed so the arbitrator can see the corridor's actual composition rather than a curated six.)*

### 6.7 Off Clement — Russian and Chinese businesses in the zone

73. **Cinderella Bakery & Café** — Russian bakery and café — 436 Balboa Street, 94118 — Inner
    Richmond (EAS, 37.77746, -122.46374). Own site, exact: *"Open Daily 7am-7pm"*. Describes Napoleon
    cakes, honey cakes, piroshki, Russian pies, and Russian appetisers, entrées and side dishes;
    announces a second location in the Mission District in 2026. This is the Russian institution the
    roster draw is reaching for that is actually inside the zone.
    https://cinderellabakery.com/
74. **Katia's Russian Tea Room, 600 5th Avenue** — restaurant — EAS returned no row for
    `600 05TH AVE` and `katias.com` 404s. **Existence and address both unconfirmed. Do not publish.**
75. **7th and Clement Market** — grocery — 538 Clement Street — Inner Richmond.
76. **Clement Dung Market** — grocery — 645 Clement Street — Inner Richmond.
77. **Yong Fong Co.** — shop — 612 Clement Street — Inner Richmond.

### 6.8 Civic buildings

78. **San Francisco Police Department, Richmond Station** — police station — 461 6th Avenue, 94118 —
    Inner Richmond (EAS confirms `461 06TH AVE`). Carries three commissioned artworks, all 1991, all
    catalogued at this address by the Arts Commission: **"Untitled #1"**, Jaap (Jacob) Bongers,
    marble, granite and bronze, 72 × 72 in., accession 1991.2.1; **"Untitled #2"**, Bongers,
    sandblasted granite, 48 × 48 in., accession 1991.2.2; **"Good Luck Piece"**, Shelley Jurs, glass,
    five panels (two door, three transom), accession 1991.4. All three commissioned by the San
    Francisco Art Commission for the Richmond Police Station. The station's build year and architect
    are unsourced.
    https://data.sfgov.org/resource/r7bn-7v9c.json
79. **San Francisco Fire Department station, 441 12th Avenue** — fire station — Inner Richmond (EAS
    confirms `441 12TH AVE`). Station number, build year and architect all unsourced — the DataSF
    fire-facilities dataset I tried returned 404 and the catalogue search is not functioning. **Do
    not publish a station number.**
80. **George Peabody Elementary School, 251 6th Avenue** and **Frank McCoppin Elementary School,
    651 6th Avenue** — schools — both within the Inner Richmond run of 6th Avenue confirmed by EAS
    (`256`–`678 06TH AVE` all return Inner Richmond), but neither exact house number returned an EAS
    row. Named by Wikipedia's Richmond District article as Inner Richmond schools. Addresses need a
    second source.

### 6.9 Streets and named ground

81. **Arguello Boulevard** — street and boundary — the zone's east edge, with the odd/even split
    documented in §2. A real place and a real fact.
82. **Geary Boulevard between 3600 and 4800** — street — the Inner Richmond stretch per EAS; `3600`
    is mixed with Presidio Heights, `3800`–`4800` are clean Inner Richmond, `5000` is Outer Richmond.
83. **California Street between 3900 and 5000** — street — Inner Richmond per EAS; `3700` is Presidio
    Heights, `3800` is mixed, `5200` is Outer Richmond. Also the vernacular north boundary (§2),
    which is the single most consequential disagreement in this file.
84. **Lake Street** — street — Inner Richmond from `2` to `1000`; `1200` is Outer Richmond and
    Seacliff. Runs along the Presidio wall.
85. **Balboa Street, Cabrillo Street and Anza Street, the Inner Richmond blocks** — streets — Balboa
    and Cabrillo are Inner Richmond from the low numbers to the 1000 block; Anza is Lone Mountain/USF
    below 1000 and Inner Richmond from 1000 to 2000. Anza's split is the surprise and is worth a
    boundary sentence.
86. **Arsicault Bakery** — bakery — 397 Arguello Boulevard, 94118 — Inner Richmond (EAS, 37.78339,
    -122.45922). **Name-collision warning:** the corpus already owns `arsicault-bakery-mission-rock`
    under the Oracle Park code seed. Different address, different location, same operator. If this
    ships it needs a slug and a summary that cannot be confused with the Mission Rock branch. The
    operator's site does not expose its locations page to a fetch, so **the address here rests on
    EAS alone and the hours are unsourced.**
87. **Velo Rouge Café, 798 Arguello Boulevard** — café — EAS returns **Lone Mountain/USF** (37.77537,
    -122.45826). Out of zone by data, in the Richmond by every colloquial account. A ninth straddler
    if the arbitrator wants it; I have left it out of §3 because it is a café and the stakes are low.

---

## 7. WHAT THE ROSTER DRAW ASKED FOR AND WHAT THE DATA SAYS

- *Clement Street* — solidly in zone, and the richest single subject here.
- *The Columbarium* — **Lone Mountain/USF by DataSF (S2).** In zone only under the vernacular.
- *Temple Emanu-El* — **in zone by DataSF (S5)**, out of zone under Wikipedia's north boundary, and
  carrying **no designation at all**.
- *Green Apple Books* — in zone. Two of its three shops are not.
- *The Internet Archive building on Funston* — in zone, and almost nothing about the building itself
  is sourced.
- *Presidio Heights edge* — the edge is Arguello's centre line and it is sharp: 325 and 397 Arguello
  are Inner Richmond, 350 and 460 Arguello are Presidio Heights. Presidio Heights is not one of the
  eleven zones, which means Roosevelt Middle School (S3) may be orphaned.
- *The Russian and Chinese institutions along Geary* — **the premise is mostly wrong for this zone.**
  Holy Virgin Cathedral, the Alexandria, Moscow & Tbilisi and the rest of the Russian Geary sit west
  of Park Presidio in the Outer Richmond. Inside the zone the Russian presence is Cinderella Bakery
  on Balboa; the Chinese presence is real and is on Clement, not Geary — May Wah, Wing Hing, Good
  Luck Dim Sum, Cheung Hing, Tai Hing Books, Red A, Cherry Blossom.

---

## 8. LEAST CONFIDENT

1. **Mountain Lake Park (S1).** Rec & Park's own field says two zones. The Presidio Trust claims the
   lake. The arbitrator has both the Presidio and this zone in front of it and I have no basis for
   preferring either.
2. **Temple Emanu-El's building facts.** Every one — 1926, the three-day dedication of 16–18 April,
   Arthur Brown Jr., the 150-foot dome — comes from a Wikipedia infobox because the congregation's
   own site returned 403 on both attempts. The zone assignment is solid; the building facts are not.
3. **The Campfire Girls Building's present use.** SF Landmark No. 169 is a certainty. What is behind
   the door in 2026 is not — I found no current occupant, no hours, and no confirmation that it is
   open to anyone. It may be a landmark with nothing a traveller can do at it.
4. **The Internet Archive's build year and architect.** "Former Christian Science church" is
   sourced; "Fourth Church of Christ, Scientist, 1923" is not, and I could not reach a source that
   states it. A guide sentence naming an architect here would be invention.
5. **Thirty-five of the Clement Street shopfronts (§6.6 entries 38–72).** Single-source on a tax
   registration. Existence and address only. I expect the verifier to cut most of them and I would
   not argue.

---

## 9. SOURCES USED

- DataSF Enterprise Addressing System `3mea-di5p` — https://data.sfgov.org/resource/3mea-di5p.json
- DataSF Analysis Neighborhoods `j2bu-swwd` — https://data.sfgov.org/resource/j2bu-swwd.json
- DataSF Article 10 Landmarks `97yj-54sx` — https://data.sfgov.org/resource/97yj-54sx.json
- DataSF Historic Districts (survey) `m22e-6hkz` — https://data.sfgov.org/resource/m22e-6hkz.json
- DataSF Rec & Park Properties `gtr9-ntp6` — https://data.sfgov.org/resource/gtr9-ntp6.json
- DataSF Civic Art Collection `r7bn-7v9c` — https://data.sfgov.org/resource/r7bn-7v9c.json
- DataSF Registered Business Locations `g8m3-pdis` — https://data.sfgov.org/resource/g8m3-pdis.json
- NPS National Register locations, layer 0 —
  https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0/query
- San Francisco Public Library — https://sfpl.org/locations/richmond ·
  https://sfpl.org/locations/richmond/richmond-library-history
- San Francisco Recreation & Park —
  https://sfrecpark.org/Facilities/Facility/Details/10th-Avenue-Clement-Mini-Park-141
- noehill.com San Francisco landmarks — sf083, sf169, sf209, sf247, sf285 · http://noehill.com/sf/landmarks/default.aspx
- Presidio Trust — https://www.presidio.gov/places/mountain-lake
- Operators' own sites — greenapplebooks.com, burmasuperstar.com, theploughandstars.com,
  schubertsbakery.com, cinderellabakery.com, parklifestore.com, dignitymemorial.com (Columbarium)
- Wikipedia, used only where marked and flagged for re-sourcing —
  Richmond District, San Francisco · Internet Archive · Congregation Emanu-El (San Francisco) ·
  San Francisco Columbarium & Funeral Home

**Sources that failed and why it matters:** `emanuelsf.org` (403), `sfarchdiocese.org` parish page
(403), `staroftheseasf.com` (now an unrelated site), `katias.com` (404), `toyboatsf.com` (no DNS),
`sfmarkets.org` (no DNS), `foundsf.org/Richmond_District` (404), `archive.org/about/` and
`help.archive.org` (no address or building content). WebSearch was exhausted at 200 calls before
this zone's research began, so every URL above was reached by direct fetch or by dataset query.
Where a fact is missing below, that is why — and the guide's sentence must be about the fact, never
about the fetching.
