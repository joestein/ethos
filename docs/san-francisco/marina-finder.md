# Marina District, San Francisco — FINDER

Zone slug `marina`; roster destination string `Marina District, California`.
Research date 2026-09-03. Author: finder agent. **Nothing here is a shipping decision.**
The verifier adjudicates each candidate; the arbitrator rules ownership across all twelve zones.

Pre-flight: `python3 .superpowers/taken_slugs.py` was run. **It is stale** — its glob is
`priv/seed_data/rome/*.json` only, so it reports 1279 places when the corpus holds 3921 across
333 files. I re-ran the check across `priv/seed_data/**/*.json` myself. No slug or name below
collides with anything committed. `priv/seed_data/san_francisco/` holds only `.gitkeep`.
The seven Oracle Park code-seed places are all in Mission Bay/Mission Rock; none is claimed here.

---

## 1. HOW THE BOUNDARY WAS ESTABLISHED

Two independent DataSF layers were downloaded and every candidate was point-in-polygon tested
against both. They disagree, and the disagreement is the whole story of this zone.

| Layer | Dataset | Count | What it calls the Marina |
|---|---|---|---|
| Analysis Neighborhoods | `j2bu-swwd` | 41 | **"Marina"** — a large unit that swallows Cow Hollow, Union Street and the Green/Vallejo blocks, running south to Pacific Ave and east to Van Ness |
| SF Find Neighborhoods | `gfpk-269f` | 117 | **"Marina"** — a much tighter unit; separate polygons exist for **"Cow Hollow"**, **"Union Street"**, **"Aquatic Park / Ft. Mason"** and **"Pacific Heights"** |

DataSF's Rec & Park properties table (`gtr9-ntp6`) carries **four** neighborhood columns per row
and they do not agree with each other either. Cow Hollow Playground, 1 Miley St, is filed as
`analysis_neighborhood=Marina`, `planning_neighborhood=Marina`, `mons_neighborhood=Cow Hollow`,
`realtor_neighborhood=Cow Hollow`. Allyne Park, 2609 Gough St, is `analysis=Marina`,
`planning=Marina`, `mons=Union Street`, `realtor=Cow Hollow`.

Wikipedia's stated boundary is narrower than either city layer: "bounded to the east by Van Ness
Avenue and Fort Mason; on the west by Lyon Street and the Presidio National Park; on the south by
Cow Hollow and Lombard St."
<https://en.wikipedia.org/wiki/Marina_District,_San_Francisco>

**Nominatim was rate-limited (429) throughout this session and returned nothing.** The two DataSF
polygon layers plus the four RPD columns are the boundary evidence used instead. This is a
provenance note and must not reach reader-facing prose.

Working rule adopted for this file, offered to the arbitrator rather than imposed: a candidate is
listed as **Marina core** only when BOTH layers say Marina. Everything else is flagged.

---

## 2. DESIGNATION NUMBERS FOUND — 19 identifiers

The brief said a landmark with a number is worth more than three without one. These are the
numbers, and they carry the register they came from.

### 2a. Article 10 (San Francisco Landmark numbers)
Source for every row: DataSF *Landmarks Listed in Article 10 of the San Francisco Planning Code*,
`https://data.sfgov.org/resource/97yj-54sx.json` (370 rows, fetched 2026-09-03). Each row also
carries a designation PDF at `sfplanninggis.org/docs/landmarks_and_districts/LM<n>.pdf`.

| LM No. | Name (as the register spells it) | Address | Designated | AN layer | SF Find layer |
|---|---|---|---|---|---|
| **88** | Palace Of Fine Arts | 3301 Lyon Street | 1977 | Marina | **Marina** |
| **262** | Marina Branch Library | 1890 Chestnut Street | 2010 | Marina | **Marina** |
| **320** | Ladies' Protection and Relief Society | 3400 Laguna Street | 2024 | Marina | **Marina** |
| **58** | Merryvale Antiques (S.F. Gas Light Co.) | 3640 Buchanan Street | 1974 | Marina | **Marina** |
| **218** | North End Police Station and Garage | 2475 Greenwich Street | 1996 | Marina | Cow Hollow |
| **261** | Metro Theater | 2055 Union Street | 2009 | Marina | Union Street |
| **17** | Colonial Dames Octagon House | 2645 Gough Street | 1969 | Marina | Union Street |
| **49** | Sherman House | 2160 Green Street | 1972 | Marina | Union Street |
| **300** | Golden Gate Valley Carnegie Library | 1801 Green Street | 2022 | Marina | Pacific Heights |
| **31** | Burr House | 1772 Vallejo Street | 1970 | Marina | Pacific Heights |

Publishable sentence forms, already checked against the gate's `@designation_citation` regex:
- "San Francisco Landmark No. 88, designated in 1977."
- "Designated under Article 10 of the Planning Code as San Francisco Landmark No. 262 in 2010."

### 2b. National Register reference numbers
Source: NPS National Register map service, layers 0 and 1, envelope query over
`-122.470,37.790,-122.410,37.818`:
`https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer`
Each row also carries a NARA catalog URL for the nomination file.

| NRHP ref | Name | NPS-recorded address | Certified | NHL? |
|---|---|---|---|---|
| **04000659** | Palace of Fine Arts (district) | 3301 Lyon St. | 05 Dec 2005 | no |
| **72000109** | Fort Mason Historic District | Portion of Fort Mason N and E of Franklin St. and McArthur Ave. | 25 Apr 1972 | no |
| **79000530** | Fort Mason Historic District (Boundary Increase) | Bounded by Van Ness Ave., Bay and Laguna Sts. | 23 Apr 1979 | no |
| **85002433** | San Francisco Port of Embarkation, US Army | Ft. Mason | 04 Feb 1985 | **NHL** (14 contributing buildings) |
| **78003405** | SS Jeremiah O'Brien | Pier 3, Fort Mason Center | 07 Jun 1978 | **NHL** |
| **01000281** | San Francisco Maritime National Historic Site | Fort Mason, Bldg. 201 | 27 Jun 1988 | no |
| **72000250** | McElroy Octagon House | 2645 Gough St. | 23 Feb 1972 | no |
| **14000967** | Burr House | 1772 Vallejo St. | 08 Jun 2015 | no |
| **76000177** | Pumping Station No. 2, SFFD Auxiliary Water Supply System | N end of Van Ness Ave | 13 May 1976 | no |

### 2c. NEGATIVE FINDING — do not confuse "eligible" with "designated"
DataSF *Historic Districts* (`63x5-g3m4`) carries a `cr`/`nr`/`a10` status per district. Several
Marina districts are **Eligible only** — no register has listed them and no identifier exists.
A page must not describe any of these as designated, listed or landmarked:

- **Marina Historic District** (1930–1940) — Eligible; case nos. 2015-010161ENV et al., no NR listing
- **Marina Corporation Residential Historic District** (1922–1939) — Eligible, case 2016-013786ENV
- **Marina Corporation Residential Historic District Extension** (1922–1939) — Eligible, 2019-014071ENV
- **Baker Street Historic District** (1926–1940) — Eligible, 2016-002430ENV
- **Baker Street Period Revival Bungalows Historic District** (1927–1928) — Eligible, 2021-008228ENV
- **Cow Hollow First Bay Tradition Historic District** (1888–1914) — Eligible, 2013.0433E
- **Lombard Street Historic District** (1922–1951) — Eligible, 2016-009258ENV

Listed districts in or touching the envelope, with identifiers, are only: Fort Mason (72000109,
79000530), San Francisco Port of Embarkation (85002433), Palace of Fine Arts (04000659),
Aquatic Park (84001183, NHL), and the three Russian Hill districts.

---

## 3. CANDIDATES

**58 candidates.** Numbered continuously. Every fact carries its URL. Where a fact comes only
from an operator's own site it is marked **[OWN-SITE]** and, per the brief, a founding year from
such a source is a trading-duration claim that does not publish — those are marked
**[FOUNDING-YEAR NOT PUBLISHABLE FROM THIS SOURCE]**.

### 3a. MARINA CORE — both layers agree (17)

**1. Palace of Fine Arts** — kind: `historic-site` (or `attraction`)
3301 Lyon Street / 3601 Lyon Street. The Article 10 register and the NRHP both use 3301 Lyon;
DataSF Rec & Park uses 3601 Lyon for the grounds.
- San Francisco Landmark No. 88, designated 1977 — DataSF `97yj-54sx`; ordinance at
  <https://sfplanninggis.org/docs/landmarks_and_districts/LM88.pdf> (file no. 90-77-7, approved by
  City Planning Commission Resolution No. 7660; legal description "East side of Baker Street ...
  being Lot 2 in Assessor's Block 916")
- Listed on the National Register of Historic Places, reference number 04000659, 5 December 2005 —
  NPS map service, nomination at <https://catalog.archives.gov/id/123861242>
- Designed by Bernard Maybeck for the 1915 Panama-Pacific International Exposition; colonnade and
  rotunda originally framed in wood and covered with staff (plaster and fibre); rebuilt 1964–1974
  in poured-in-place concrete with steel I-beams for the dome —
  <https://en.wikipedia.org/wiki/Palace_of_Fine_Arts>
- Rec & Park property no. 111, 19.74 acres, type "Civic Plaza or Square" — DataSF `gtr9-ntp6`
- PHOTO NOTE: a building under 17 USC 120(a). Freely photographable. Wave Organ and the Bufano
  pieces nearby are NOT.

**2. Palace of Fine Arts Theatre** — kind: `theater`
3301 Lyon Street. OSM node at 37.80233,-122.44923. Opened 1970 with 966 seats —
<https://en.wikipedia.org/wiki/Palace_of_Fine_Arts>. Distinct from the rotunda; sits in the
former exhibition hall block. Hours/programme not sourced.

**3. The Exploratorium's former home (Palace of Fine Arts exhibition hall)** — kind: `historic-site`
Not a live museum. The Exploratorium opened in 1969, founded by Frank Oppenheimer —
<https://www.exploratorium.edu/about/our-story> — occupied the Palace exhibition hall and closed
there in January 2013 to move to the Embarcadero —
<https://en.wikipedia.org/wiki/Palace_of_Fine_Arts>. **Risk:** as a *place* this is the same
building as #1/#2. Recommend it be written as history inside the Palace entry rather than as its
own place. Flagged for the verifier.

**4. Wave Organ** — kind: `attraction`
On the jetty forming the small Boat Harbor, Marina district. Civic Art Collection accession
**1111.2**; artists recorded as "Richards, George and Gonzalez, Peter"; creation date 1986;
dimensions 216 × 600 × 420 in.; credit line "Commissioned by the Exploratorium for San Francisco"
— DataSF `r7bn-7v9c`. Both layers: Marina.
The Exploratorium's account: concept by **Peter Richards**, installed in collaboration with
sculptor and master stone mason **George Gonzalez**; inspired by Bill Fontana's recordings from a
vent pipe of a floating dock in Sydney; Richards received a National Endowment for the Arts
planning grant in 1980; a prototype was shown as part of the New Music '81 Festival; construction
began September 1985, seven months after Frank Oppenheimer's death; completed May 1986 and
dedicated in June to Oppenheimer's memory. The jetty was built with material from a demolished
cemetery, giving carved granite and marble used in the piece. **25 organ pipes** of PVC and
concrete at varying elevations; sound depends on the tide.
<https://www.exploratorium.edu/visit/wave-organ>
- **PHOTO: BLOCKED.** A sculpture, not a building. Both artists appear to be living; 17 USC 120(a)
  does not reach it. Emit `"photos": []` — which is the wave-1 rule anyway — and record here that
  it must stay empty even in the photo wave unless licensing is cleared.

**5. Marina Green** — kind: `park`
Rec & Park property no. 112, filed jointly as **"Yacht Harbor and Marina Green"**, type "Regional
Park", 165.47 acres in the properties table and 78.03 acres in the parks polygon layer — DataSF
`gtr9-ntp6` and `3nje-yn2u`. The Wikipedia description: "the Marina Green, a park adjacent to the
municipal boat marina from which the neighborhood takes its name" —
<https://en.wikipedia.org/wiki/Marina_District,_San_Francisco>. No street address is published in
either dataset. No hours sourced.

**6. Little Marina Green** — kind: `park`
Separate OSM park at 37.80580,-122.44790, west of the yacht harbour, adjoining the Palace of Fine
Arts block. Not a separate Rec & Park property_id — it falls inside property 112. **Low
confidence as a standalone place.**

**7. San Francisco Marina Yacht Harbor (West Harbor and East Harbor)** — kind: `attraction`
Two OSM marina polygons: "Yacht Harbor" 37.80677,-122.44365 and "East Harbor" 37.80689,-122.43399.
Both inside Rec & Park property 112. The neighbourhood takes its name from it (Wikipedia, above).
Gashouse Cove is the East Harbor's older name — **unsourced, do not write it without a source.**

**8. Marina Branch Library** — kind: `attraction` (no `library` kind exists in the schema)
1890 Chestnut Street. **San Francisco Landmark No. 262, designated 2010** — DataSF `97yj-54sx`;
ordinance <https://sfplanninggis.org/docs/landmarks_and_districts/LM262.pdf> (scanned images, no
extractable text — architect and build year NOT sourced). SFPL location page
<https://sfpl.org/locations/marina> resolves but its body is JavaScript-rendered and no hours were
extracted. Write the address and the landmark number; give no hours.

**9. Moscone Recreation Center** — kind: `park`
1800 Chestnut Street. Rec & Park property no. 132, 12.73 acres, type "Neighborhood Park or
Playground", complex "Marina Complex" — DataSF `gtr9-ntp6`. Both layers: Marina. A dog play area
is separately mapped at 1895 Chestnut Street (OSM).
Public art on site, all from DataSF `r7bn-7v9c`:
- *Passage*, Kent Roberts, 2010, accession 2010.7, commissioned by the SF Arts Commission for
  Moscone Recreation Center
- *Leatherback Sea Turtle*, Jonathan Beery, 2002, accession 2002.8, gift from the Friends of
  Moscone Park and Recreation Center
- a second Beery piece, 2002, accession 2002.9 (title truncated in the API response as "The Pink
  Short-spined Star…")
- **PHOTO: BLOCKED** on all three. Living artists, sculptures not buildings.

**10. Ladies' Protection and Relief Society building** — kind: `historic-site`
3400 Laguna Street. **San Francisco Landmark No. 320, designated 2024** — DataSF `97yj-54sx`;
ordinance <https://files.sfplanning.org/documents/preservation/LM320.pdf>. Both layers: Marina.
Architect and build year NOT sourced. A recent designation and the most interesting *undercovered*
find in this zone.

**11. Merryvale Antiques building (San Francisco Gas Light Company)** — kind: `historic-site`
3640 Buchanan Street. **San Francisco Landmark No. 58, designated 1974** — DataSF `97yj-54sx`;
ordinance <https://sfplanninggis.org/docs/landmarks_and_districts/LM58.pdf>. Both layers: Marina.
The register's name preserves a defunct tenant; the building is the S.F. Gas Light Co. structure at
Buchanan and Bay, the edge of the Fort Mason block. **Current occupant NOT sourced — do not write
it as a shop.** Write it as a landmark building.

**12. Chestnut Street (the commercial corridor)** — kind: `attraction`, or better, a `walk` entry
"Stretching from Fillmore Street down to Lyon Street, Chestnut is lined with a collection of
stores, restaurants, bakeries, coffee shops and bars" —
<https://en.wikipedia.org/wiki/Marina_District,_San_Francisco>. Named-street orientation is
permitted by the gate; neighborhood-scale orientation is not.

**13. Marina Theatre** — kind: `theater`
OSM cinema at 37.80038,-122.43855, which is the 2149 Chestnut Street block. **Operator and current
status NOT sourced** — cinemasf.com/marina 404s. LOW CONFIDENCE; may be closed.

**14. Presidio Theater, 2340 Chestnut Street** — kind: `theater`
OSM cinema tagged "Presidio Theater", `addr:street=Chestnut Street`, 37.800321,-122.441971.
**NOT to be confused with the Presidio Theatre at 99 Moraga Avenue inside the Presidio**, which
belongs to the Presidio page. **Current status NOT sourced.** LOW CONFIDENCE.

**15. Marina Safeway** — kind: `shop`
15 Marina Boulevard — OSM, corroborated by
<https://local.safeway.com/safeway/ca/san-francisco/15-marina-blvd.html>. A 1959 store with a
social reputation; **the reputation and the 1959 date are NOT sourced here.** Without a source the
only publishable content is "a supermarket at 15 Marina Boulevard", which is thin. LOW CONFIDENCE.

**16. Marina Middle School** — kind: none of the thirteen fits. NOT a candidate place; recorded so
the verifier does not re-find it. 3500 Fillmore Street (OSM, unverified).

**17. Marina Air Field memorial** — kind: `historic-site`
OSM memorial node at 37.80619,-122.44056, on Marina Green. Commemorates the airfield on the
Exposition ground. **No source beyond OSM.** LOW CONFIDENCE — needs the plaque text.

### 3b. FORT MASON — STRADDLER BLOCK (19)

**This entire block is flagged.** The Analysis Neighborhood layer puts Fort Mason in **Marina**.
The SF Find layer puts it in a polygon named **"Aquatic Park / Ft. Mason"**, which also contains
Ghirardelli Square and the Bufano sculptures — and the roster gives Ghirardelli Square to
Fisherman's Wharf. So SF Find's unit spans two rostered zones and cannot settle it.
Fort Mason Center's own site says it is "in the Marina District along the northern waterfront"
(<https://fortmason.org/venues/>). NPS administers it as part of GGNRA — which is the same
argument the roster used to give the Presidio its own page, though Fort Mason is not on the
roster as a page. **The arbitrator rules. Do not resolve here.**

**18. Fort Mason (the post)** — kind: `historic-site`
201 Fort Mason, San Francisco, CA 94123 — <https://www.nps.gov/goga/learn/historyculture/fort-mason.htm>
- Listed on the National Register of Historic Places as the Fort Mason Historic District,
  reference number 72000109, 25 April 1972; boundary increase, reference number 79000530,
  23 April 1979 — NPS map service
- Black Point was a civilian neighbourhood in the 1850s; residents included John Fremont, Jessie
  Benton Fremont and Leonides Haskell; "The outbreak of the Civil War forced the army to take back
  possession of Black Point, evict the civilian residents, and re-establish the original name,
  *Point San Jose*"; renamed in 1882 for Colonel Richard Barnes Mason; "In 1864, the army fortified
  *Point San Jose* with more guns"; three of the Black Point houses survive as Quarters 3 and
  Quarters 4 — NPS, above
- Spanish names *Punta Medanos* and *Punta de San José*; the 1864 work was "a breast-high wall of
  brick and mounts for six 10-inch Rodman cannons and six 42-pounder guns" —
  <https://en.wikipedia.org/wiki/Fort_Mason>

**19. San Francisco Port of Embarkation, U.S. Army** — kind: `historic-site`
At Fort Mason. **A National Historic Landmark, National Register reference number 85002433,
designated 4 February 1985**, with 14 contributing buildings — NPS map service, nomination at
<https://catalog.archives.gov/id/123858076>. Established 6 May 1932; the principal Pacific
shipping hub in the Second World War, handling roughly 1.6 million passengers and 23 million tons
of cargo — <https://en.wikipedia.org/wiki/Fort_Mason>.

**20. Fort Mason Center for Arts & Culture** — kind: `attraction`
2 Marina Blvd, Landmark Building C, Suite 260, San Francisco, CA 94123. "FMCAC is the nonprofit
steward of the former San Francisco Port of Embarkation"; a 13-acre campus with 11–12 venues from
500 to 50,000 sq ft and over 100,000 sq ft of rentable space; more than 500 on-site parking spaces;
"opened to the public in 1977" — <https://fortmason.org/about/> and <https://fortmason.org/venues/>
[OWN-SITE for the 1977 date; Wikipedia gives 1976 for the founding of the nonprofit, so the two
sources DISAGREE — write neither, or write the disagreement as a fact about the sources.]

**21. Festival Pavilion** — 50,000 sq ft, capacity up to 3,840 — <https://fortmason.org/venues/>
**22. Gateway Pavilion** — 40,000 sq ft, capacity up to 2,000 — same source
**23. Cowell Theater** — kind: `theater` — 437 seats, proscenium stage — same source
**24. Gallery 308** — kind: `attraction` — 2 Marina Boulevard (OSM) — same source
**25. The Firehouse at Fort Mason** — kind: `attraction` — OSM 37.80772,-122.42954; listed as a
venue with Alcatraz views — same source
**26. The Store House** — same source
(21–26 are venues inside #20 and may be better as one entry. Flagged.)

**27. Greens Restaurant** — kind: `restaurant`
"Fort Mason Center, Landmark Building A, 2 Marina Boulevard, San Francisco, CA 94123". Hours:
Lunch Tue–Fri 11.30am–2.30pm; Brunch Sat–Sun 10.30am–2.30pm; Dinner Tue–Sun 5.00pm–9.00pm.
Vegetarian; menus tied to Green Gulch farm and local growers. "Greens Restaurant was established
by the San Francisco Zen Center in 1979." — <https://greensrestaurant.com/>
**[OWN-SITE. The 1979 founding year is a trading-duration claim and DOES NOT PUBLISH from this
source.]** Fortmason.org names Greens among its residents, which corroborates tenancy but not the
year. Address and hours publish.

**28. The Interval at Long Now** — kind: `cafe` (or `restaurant`)
"The Interval is located in Fort Mason Center in San Francisco. We're at 2 Marina Boulevard, right
next to Greens Restaurant." Hours: Mon 5pm–10pm; Tue–Fri 10am–11pm; Sat 5pm–11pm; Sun 3pm–10pm.
Indoor and outdoor seating; no reservations. Operated by The Long Now Foundation.
— <https://theinterval.org/about> [OWN-SITE, but identity/location/hours publish.]

**29. Magic Theatre** — kind: `theater`
"Fort Mason Center for Arts & Culture, Landmark Building D, 2 Marina Boulevard, San Francisco, CA
94123". Founded 1967 by Berkeley graduate students; a centre for new American plays.
— <https://www.magictheatre.org/about/> **[OWN-SITE: the 1967 founding year does not publish from
here. Needs a third-party source.]**

**30. Museo Italo Americano** — kind: `museum`
2 Marina Boulevard (OSM), Fort Mason Center. Site <https://www.museoitaloamericano.org/> resolves
but the About page returned only navigation; **no founding year, hours or admission sourced.**

**31. BATS Improv (Bayfront Theater)** — kind: `theater`
OSM theatre at 37.80651,-122.43177, Fort Mason. **No detail sourced beyond the OSM node.** LOW
CONFIDENCE.

**32. Southside Theater** — kind: `theater` — OSM 37.80702,-122.43085, Fort Mason. Unsourced beyond OSM.
**33. Young Performers Theatre** — kind: `theater` — OSM 37.80657,-122.43134. Unsourced beyond OSM.
**34. San Francisco Children's Art Center** — kind: `attraction` — OSM 37.80683,-122.43143. Unsourced beyond OSM.

**35. Maritime Research Center** — kind: `attraction`
2 Marina Boulevard (OSM), Fort Mason. This is the library of San Francisco Maritime National
Historical Park. **San Francisco Maritime National Historic Site is on the National Register,
reference number 01000281, at "Fort Mason, Bldg. 201"** — NPS map service. Note the NPS
headquarters address for Fort Mason is also 201 Fort Mason.

**36. Fort Mason Chapel** — kind: `historic-site`
OSM place_of_worship at 37.80585,-122.42745. Inside the Fort Mason Historic District boundary
(NRHP 72000109). **No independent source.**

**37. Black Point Fortifications / Battery at Point San Jose** — kind: `historic-site`
OSM "Black Point Fortifications", 37.80761,-122.42828. The 1864 brick battery with six 10-inch
Rodman cannons and six 42-pounder guns — <https://en.wikipedia.org/wiki/Fort_Mason>. What survives
on the ground is NOT sourced.

**38. The Great Meadow, Fort Mason** — kind: `park`
Named in the brief as a likely subject. **NOT FOUND in any dataset queried, and the NPS Fort Mason
page does not name it.** OSM has a generic "Fort Mason" park polygon at 37.80633,-122.42900.
LOW CONFIDENCE — needs a source before it is written.

**39. Phillip Burton statue, Fort Mason** — kind: n/a
OSM artwork at 37.80511,-122.42956. **PHOTO: BLOCKED** (sculpture, sculptor and death year not
established). Sculptor NOT sourced. Writeable as a place only weakly.

**40. Fort Mason Farmers' Market** — OSM marketplace at 37.80617,-122.43157. Unsourced beyond OSM.

**41. SS Jeremiah O'Brien** — kind: `attraction`
**A National Historic Landmark, National Register reference number 78003405, listed 7 June 1978.**
The NPS register records the address as **"Pier 3, Fort Mason Center"** — NPS map service,
<https://catalog.archives.gov/id/123858076> family. **CAUTION: the ship's present berth is widely
reported as Pier 45, which is Fisherman's Wharf.** ssjeremiahobrien.org failed TLS validation
(certificate served for `*.cloudwaysapps.com`) so the present berth is NOT sourced.
**STRADDLER between Marina/Fort Mason and Fisherman's Wharf. Flagged for the arbitrator. Do not
write a berth until one is sourced.**

**42. San Francisco Sea Scout Base** — OSM museum node, 37.80747,-122.42618, Fort Mason. Unsourced beyond OSM.
**43. Black Point Pier** — OSM pier, 37.80845,-122.42747, Fort Mason. Unsourced beyond OSM.

**44. City College of San Francisco, Fort Mason Art Campus** — kind: n/a for the schema.
2 Marina Boulevard, Building B (OSM). Recorded so it is not re-found.

**45. Goody Cafe / Equator Coffees / Radhaus** — kind: `cafe`, `cafe`, `restaurant`
All at 2 Marina Boulevard, Fort Mason Center. Goody Cafe is listed as an FMCAC resident
(<https://fortmason.org/resident/goody-cafe/>); Equator at
<https://www.equatorcoffees.com/blogs/cafes/fort-mason>; Radhaus at <https://radhaussf.com/>
(German). All [OWN-SITE]; identity, address and hours would publish, none fetched in detail.

### 3c. COW HOLLOW / UNION STREET STRADDLERS (11) — ALL FLAGGED

The Analysis Neighborhood layer assigns every one of these to **Marina**. SF Find assigns them to
**Cow Hollow**, **Union Street** or **Pacific Heights**. Cow Hollow is **not a rostered zone** —
it is not among the twenty neighbourhoods nor among the seven declined candidates — so if the
arbitrator does not give these to the Marina they fall to nobody, which the Marina page cannot
mention (the self-reference ban) but the arbitrator should know.

**46. Colonial Dames Octagon House / McElroy Octagon House** — kind: `museum`
2645 Gough Street. **San Francisco Landmark No. 17, designated 1969** (DataSF `97yj-54sx`) and
**listed on the National Register of Historic Places, reference number 72000250, 23 February 1972**
(NPS map service). Two registers, two identifiers — the strongest straddler in the zone.
AN=Marina, SF Find=Union Street.

**47. Metro Theater** — kind: `theater`
2055 Union Street. **San Francisco Landmark No. 261, designated 2009.** AN=Marina, SF Find=Union
Street. Current use NOT sourced (long closed as a cinema).

**48. Sherman House** — kind: `historic-site` (a hotel historically; current use NOT sourced)
2160 Green Street. **San Francisco Landmark No. 49, designated 1972.** AN=Marina, SF Find=Union St.

**49. North End Police Station and Garage** — kind: `historic-site`
2475 Greenwich Street. **San Francisco Landmark No. 218, designated 1996.** AN=Marina,
SF Find=Cow Hollow. Current use NOT sourced.

**50. Golden Gate Valley Carnegie Library** — kind: `attraction`
1801 Green Street. **San Francisco Landmark No. 300, designated 2022.** AN=Marina, SF
Find=Pacific Heights. Architect NOT sourced. **Note: Pacific Heights is a rostered zone and will
also find this.** Hard collision — flag.

**51. Burr House** — kind: `historic-site`
1772 Vallejo Street. **San Francisco Landmark No. 31, designated 1970** and **NRHP reference
number 14000967, listed 8 June 2015.** AN=Marina, SF Find=Pacific Heights. Same hard collision.

**52. Allyne Park** — kind: `park`
2609 Gough Street. Rec & Park property no. 131, 0.88 acres, complex "Marina Complex" —
`gtr9-ntp6`. AN=Marina, planning=Marina, mons=Union Street, realtor=Cow Hollow.

**53. Cow Hollow Playground** — kind: `park`
1 Miley St. Rec & Park property no. 110, 0.15 acres, "Mini Park", complex "Marina Complex".
AN=Marina, mons and realtor both Cow Hollow. The name argues against the Marina; the city's own
complex assignment argues for it.

**54. Liverpool Lil's** — kind: `restaurant`
2940–2942 Lyon Street (OSM), tagged `pub`. SF Find=Cow Hollow, adjoining the Presidio wall.
No founding year sourced from any third party.

**55. Balboa Cafe** — kind: `restaurant`
3199 Fillmore Street (OSM). SF Find=Union Street. <https://www.balboacafesf.com/> [OWN-SITE].
Any founding year from that site does not publish.

**56. Perry's** — kind: `restaurant`
1944 Union Street (OSM). <https://www.perryssf.com/location/union-street/> [OWN-SITE].
SF Find=Union Street.

### 3d. PRESIDIO EDGE — NOT THE MARINA'S (recorded so the verifier does not re-find them)

Everything west of Lyon Street classified as `Presidio National Park` by SF Find and belongs to the
Presidio page per the roster and the brief. Found and **not claimed**: Crissy Field Center
(1199 East Beach Road), Presidio Tunnel Tops (210 Lincoln Boulevard), Building 201 Halleck Street,
Field Station (601 Mason Street), Yoda Fountain, Eadweard Muybridge and Philo T. Farnsworth
memorials, Presidio Dance Theatre, Piccino Presidio, Presidio Theatre at 99 Moraga Avenue.

### 3e. AQUATIC PARK EDGE — probably Fisherman's Wharf's (recorded, not claimed)

Ghirardelli Square (SF Landmark No. 30, 1970; NRHP 82002249 as "Pioneer Woolen Mills and D.
Ghirardelli Company"), Haslett Warehouse (SF Landmark No. 59, 1974; NRHP 75000172), Aquatic Park
Historic District (NRHP 84001183, NHL), Municipal Pier, National Maritime Museum, the Bufano *Seal*
(accession 1942.2) and *Frog* (accession 1942.4). All fall in SF Find's "Aquatic Park / Ft. Mason"
polygon, the same polygon as Fort Mason — which is exactly why that polygon cannot settle Fort
Mason either.

### 3f. CHESTNUT STREET FOOD AND RETAIL — sourced only to OSM addresses (candidate pool)

Recorded with addresses so the verifier can choose; none has a third-party founding year and none
was individually fetched. All SF Find = Marina.

**57. Lucca Delicatessen**, 2120 Chestnut Street — <https://www.luccadeli.com>. An Italian deli of
long standing; **no third-party founding year sourced.** The single strongest Chestnut Street
candidate on reputation, and the one most in need of a source the gate will accept.

**58. Books Inc., Marina** — <https://www.booksinc.net/SFMarina>, Chestnut Street.

Also mapped on Chestnut with addresses (OSM), for the verifier's shortlist: A16 (2355), Tacolicious
(2250), delarosa (2175), Pacific Catch (2027), Mamacita (2317), Blackwood (2150), Dragon Well
(2142), California Wine Merchant (2113), Marina Lounge (2138–2146), Réveille (2268), SusieCakes
(2109), The Chestnut Bakery (2359), Over the Moon (2144), We Olive (2379), Mezes (2373), Morella
(2001), United Dumplings (2015), Bonita (2257), Squat & Gobble (2263), Asa Sushi (2365), Tipsy Pig
(2231), Marina Supermarket (2323), Peet's (2080).
Lombard Street motels (Marina Inn 1688, Redwood Inn 1530, Town House 1650, Travelodge 1450, Days
Inn 2358, Infinity 2322) are mapped but generic.

---

## 4. STRADDLERS — the explicit list for the arbitrator

1. **The whole Fort Mason block (#18–#45).** AN says Marina; SF Find says "Aquatic Park / Ft.
   Mason", a polygon shared with Ghirardelli Square, which the roster gave to Fisherman's Wharf.
   Fort Mason Center's own site says Marina District. NPS administers it as GGNRA.
2. **SS Jeremiah O'Brien (#41).** NRHP records Pier 3, Fort Mason Center; the present berth is
   commonly reported as Pier 45, Fisherman's Wharf. Marina vs Fisherman's Wharf.
3. **Golden Gate Valley Carnegie Library, LM 300 (#50)** and **Burr House, LM 31 / NRHP 14000967
   (#51).** AN=Marina, SF Find=Pacific Heights. Pacific Heights is a rostered zone and will find
   both. Hard collision.
4. **Octagon House (#46), Metro Theater (#47), Sherman House (#48), Allyne Park (#52).**
   AN=Marina, SF Find=Union Street. Union Street/Cow Hollow is not a rostered zone.
5. **North End Police Station LM 218 (#49)** and **Cow Hollow Playground (#53).** AN=Marina,
   SF Find=Cow Hollow, Rec & Park complex "Marina Complex".
6. **Liverpool Lil's (#54), Balboa Cafe (#55), Perry's (#56).** Cow Hollow / Union Street by SF
   Find; Marina by AN.
7. **Palace of Fine Arts (#1) is NOT a straddler.** Both layers say Marina and it is east of Lyon
   Street, so the Presidio's western boundary does not reach it. Recorded because the brief warned
   about the Presidio line.

---

## 5. PHOTO NOTES (for the photo wave; wave 1 emits `"photos": []`)

- Free under 17 USC 120(a): Palace of Fine Arts rotunda and colonnade, the Palace of Fine Arts
  Theatre, Marina Branch Library, the Ladies' Protection and Relief Society building, the S.F. Gas
  Light Co. building, the Fort Mason piers and Landmark Buildings A–E, the Octagon House, the Metro
  Theater facade, the Golden Gate Valley library.
- **BLOCKED — sculptures, not buildings:** the **Wave Organ** (Peter Richards and George Gonzalez,
  both apparently living), the Phillip Burton statue at Fort Mason, and the three Moscone
  Recreation Center pieces (Kent Roberts 2010; Jonathan Beery 2002 ×2). Bufano's *Seal* and *Frog*
  sit in the Aquatic Park block and are not this page's problem, but Bufano died in 1970 so they
  are not automatically clear either.

---

## 6. PROVENANCE — what answered and what did not

Reachable and used: DataSF Socrata (`97yj-54sx` Article 10 landmarks, `63x5-g3m4` historic
districts, `j2bu-swwd` analysis neighborhoods, `gfpk-269f` SF Find neighborhoods, `gtr9-ntp6` and
`3nje-yn2u` Rec & Park, `r7bn-7v9c` civic art), the Socrata catalog API, the NPS National Register
map service at mapservices.nps.gov, sfplanninggis.org designation PDFs, nps.gov/goga, fortmason.org,
greensrestaurant.com, theinterval.org, magictheatre.org, exploratorium.edu, Overpass (overpass-api.de).

Did not yield: **Nominatim returned 429 for every request** (shared-IP rate limiting), so the
brief's suggested reverse-geocode boundary check was unavailable and the two DataSF polygon layers
carried the boundary work instead. **NPGallery's NRHP search returns its entire 100,414-item
corpus for any query** and is useless for lookup — the NPS map service is the working substitute.
sfrecpark.org facility URLs could not be resolved to the Marina properties. sfosb.org's Legacy
Business Registry has been folded into sf.gov and no listing page was found, which is why no
Chestnut Street business has a citable founding year. ssjeremiahobrien.org fails TLS hostname
validation. sfpl.org and museoitaloamericano.org render their bodies in JavaScript.

**None of this paragraph may appear in reader-facing prose** — the gate's `@method_patterns` bans
HTTP codes, "did not resolve", "could not be reached" and "for this guide". A page with no hours
writes "No source states its opening hours, so none are given here."

---

## 7. FINDER'S OWN CONFIDENCE

Least confident, in order: **#38 the Great Meadow** (named in the brief, found in no dataset and
not on the NPS page); **#13/#14 the two Chestnut Street cinemas** (OSM nodes with no operator or
status, and one shares a name with a Presidio venue); **#15 the Marina Safeway** (everything
interesting about it is unsourced, and what is sourced is that a supermarket exists);
**#57 Lucca Delicatessen** (the best Chestnut Street candidate and the one whose central fact —
how long it has traded — has no source the gate accepts).

Most confident: the ten Article 10 numbers and the nine NRHP reference numbers in section 2, every
one of which came from a register with an identifier attached.
