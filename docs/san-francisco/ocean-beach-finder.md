# Ocean Beach, San Francisco — FINDER

Zone slug `ocean-beach`. Research date 2026-09-03. Author: finder agent.
**Nothing here is a shipping decision.** The verifier adjudicates each candidate; the arbitrator
rules ownership across all eleven zones with all eleven files in front of it.

---

## 0. PRE-FLIGHT — WHAT IS ALREADY OWNED

`python3 .superpowers/taken_slugs.py` was run. **Its glob is `priv/seed_data/rome/*.json` only** — it
reported 468 places across 31 Rome files and is blind to San Francisco. The check was redone
corpus-wide with `python3 .superpowers/vf_taken_all.py`, which globs
`priv/seed_data/**/*.json` recursively: **4,389 places across 349 files.**

Result: **not one Ocean Beach candidate is owned by a shipped file.** The twelve live San Francisco
files (`priv/seed_data/san_francisco/*.json` — castro, chinatown, fishermans-wharf, haight-ashbury,
hayes-valley, marina, mission, nob-hill, north-beach, pacific-heights, russian-hill, soma) contain
468 places and none of them is west of 32nd Avenue.

Two collisions to be aware of, neither of them a real conflict but both worth naming:

| Term searched | What came back | Verdict |
|---|---|---|
| `ocean beach` | **`ocean-beach-park-new-london`** — "Ocean Beach Park", owned by `connecticut/new-london.json` | **SLUG-SPACE WARNING.** A different beach in a different state. No place conflict, but a bare `ocean-beach-*` slug stem is already in use in the corpus. Every slug written for this zone should carry the `-san-francisco` or `-ocean-beach` disambiguator that wave 1 used. |
| `cliff` | `cliffs-variety-castro` — "Cliff's Variety" | Name-fragment collision only. A Castro hardware store, not the Cliff House. |
| `camera` | `castro-camera-harvey-milk-residence` | Name-fragment collision only. Harvey Milk's shop, not the Camera Obscura. |

The seven Oracle Park code-seed places are all Mission Bay / Mission Rock. None is claimed here.

---

## 1. THE BOUNDARY IS THE WHOLE PROBLEM, AND THE DATA SAYS SO OUT LOUD

The brief is right that the edges are the real question here, and the finding is sharper than
"the edges are fuzzy."

**Neither of the city's two neighborhood layers contains a unit called "Ocean Beach."**

| Layer | Dataset | Units | Does it have an "Ocean Beach"? |
|---|---|---|---|
| Analysis Neighborhoods | `j2bu-swwd` | 41 | **No.** The 41 names were dumped in full. |
| SF Find Neighborhoods | `gfpk-269f` | 117 | **No.** The 117 names were dumped in full. |

Both layers were downloaded whole and every candidate was point-in-polygon tested against both,
using an even-odd ray cast with hole handling (`ob_fetch.in_geom`). The full run is reproducible at
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/ob_pip.py`
and `ob_pip2.py`.

### 1.1 The strand itself crosses four analysis neighborhoods

Points taken on the sand, north to south:

| Point on the sand | A: `j2bu-swwd` | B: `gfpk-269f` |
|---|---|---|
| At Cabrillo / Balboa (north end) | Outer Richmond | Outer Richmond |
| Off Fulton St | Outer Richmond | Outer Richmond |
| Off the Beach Chalet (Stairwell 15 area) | **Golden Gate Park** | **Golden Gate Park** |
| Off Lincoln Way | Sunset/Parkside | Outer Sunset |
| Off Judah St | Sunset/Parkside | Outer Sunset |
| At Ortega St (the King Philip wreck) | Sunset/Parkside | Outer Sunset |
| At Taraval St | Sunset/Parkside | Outer Sunset |
| At Sloat Blvd (south end) | **Lakeshore** | **Lakeshore** |

**The polygons do not stop at the shoreline here** — unlike the Presidio's over-water artifacts, the
San Francisco polygons extend across the sand to the waterline. So the sand is not "outside every
polygon"; it is *inside four different ones*, and one of those four is **Golden Gate Park, which is
another zone in this wave.** A guide that says "Ocean Beach is in the Outer Sunset" is asserting a
containment the city's own data contradicts at both ends.

### 1.2 The Sutro / Lands End cluster is where the two layers actually fight

| Candidate | A: `j2bu-swwd` | B: `gfpk-269f` | Agree? |
|---|---|---|---|
| Cliff House, 1090 Point Lobos Ave | Outer Richmond | **Sutro Heights** | no |
| Camera Obscura, 1096 Point Lobos Ave | Outer Richmond | **Sutro Heights** | no |
| Sutro Heights Park | Outer Richmond | **Sutro Heights** | no |
| Sutro Baths ruins | Outer Richmond | **Lincoln Park / Ft. Miley** | no |
| Merrie Way parking lot | Outer Richmond | **Lincoln Park / Ft. Miley** | no |
| **Lands End Lookout, 680 Point Lobos Ave** (NPS's own coordinate) | Outer Richmond | **Lincoln Park / Ft. Miley** | **no** |
| West Fort Miley batteries | Outer Richmond *(one probe)* / Lincoln Park *(NRHP centroid)* | Lincoln Park / Ft. Miley | unstable |
| Mile Rock Beach | Lincoln Park | Lincoln Park / Ft. Miley | roughly |
| Lands End Labyrinth / Eagle's Point | Lincoln Park | Lincoln Park / Ft. Miley | roughly |
| USS San Francisco Memorial | Lincoln Park | Lincoln Park / Ft. Miley | roughly |
| Legion of Honor / Lincoln Park Golf Course | Lincoln Park | Lincoln Park / Ft. Miley | yes |

`gfpk-269f` carries a unit literally named **"Sutro Heights"** and another named **"Lincoln Park /
Ft. Miley"**; `j2bu-swwd` has neither and folds the lot into **Outer Richmond** and **Lincoln Park**.
The two layers disagree on *every single* Sutro-cluster point. There is no reading of the city data
under which Cliff House, Sutro Baths and Lands End are "in Ocean Beach" — they are in a promontory
that both layers treat as its own thing, and that the National Park Service treats as its own thing
too (§2.4).

### 1.3 Two structural facts that fix the zone's real shape

* **The Great Highway is Golden Gate Park's western boundary, by register text.** The Golden Gate
  Park National Register district is described as "Bounded by Fulton St., Stanyan St., Fell St.,
  Baker St., Oak St., Lincoln Way and **The Great Highway**."
  <https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/1/query?where=NRIS_Refnum%3D%2704001137%27&outFields=*&returnGeometry=false&f=json>
  Everything east of the Great Highway between Fulton and Lincoln belongs to that district.
* **The Sutro nomination puts Ocean Beach *outside* the Sutro district.** NPS's own text: the
  district "is approximately 78 acres and is roughly bounded on the north by the Pacific Ocean, the
  east by Fort Miley, 48th Avenue, and the Outer Richmond residential neighborhood, **on the south by
  a vacant lot and Ocean Beach**, and the west by the Pacific Ocean. It contains several distinct
  areas — Sutro Heights Park, Cliff House, Sutro Baths Site, and Lands End."
  <https://www.nps.gov/goga/historyculture/upload/sutro_history.pdf> (p. 2)

So the federal documents draw **two adjacent things**: a 78-acre headland district (Sutro Heights /
Cliff House / Sutro Baths / Lands End) and, south of it, the strand. The zone brief names subjects
from both. **That is the arbitrator's call and it is not made here.**

### 1.4 What could NOT be established — say so plainly

The NPS Land Resources Division tract-and-boundary map service, which is the authoritative polygon
for what is and is not GGNRA, returned HTTP 404 on every layer and every id tried
(`LandResourcesDivisionTractAndBoundaryService`, both MapServer and FeatureServer, layers 0–5).
**No GGNRA polygon was obtained, so no point-in-polygon test of "is this federal land" was run.**
Every GGNRA claim in this file rests on documentary text, not on geometry. A later pass that needs
the polygon must find a working endpoint.

---

## 2. THE DESIGNATION NUMBERS — FIFTEEN, EACH RE-FETCHED

Three registers were queried independently and cross-checked against each other.

* **DataSF Article 10 landmarks `97yj-54sx`** — all 370 rows downloaded, filtered west of −122.48
  and by keyword.
* **NPS `nrhp_locations` MapServer** — points layer 0 and polygons layer 1, envelope
  `-122.55,37.70,-122.44,37.80`, plus targeted `RESNAME LIKE` queries.
* **California Office of Historic Preservation listed-resources register**, San Francisco county
  (`criteria=38`) — 224 rows parsed. <https://ohp.parks.ca.gov/ListedResources/?view=county&criteria=38>

**Note on `County='San Francisco' AND State='California'` against the NPS layer: it returns ZERO
features.** The `State` field does not hold the string "California". Use an envelope query or drop
the `State` clause; a verifier who repeats the county-and-state query will wrongly conclude the
whole west side is unlisted.

### 2.1 National Register — nine, with reference numbers

| Name | NRHP ref | Certification date | Address on the record | Cross-check |
|---|---|---|---|---|
| **King Philip (ship) and Reporter (schooner) Shipwreck Site** | **86001014** | **05/08/1986** | Address Restricted | OHP row `N1441`, registration date 5/8/1986 |
| **Point Lobos Archeological Sites** | **76000176** | **11/07/1976** | Address Restricted | OHP row `N445`, registration date 11/7/1976 |
| **Camera Obscura** | **01000522** | **05/23/2001** | 1096 Point Lobos Ave. | OHP row `N2132`, 5/23/2001; NPS layer 0 |
| **Beach Chalet** | **81000172** | **07/22/1981** | 1000 Great Hwy. | OHP row `N964`, 7/22/1981; NPS layer 0 |
| **Moss Flats Building** | **83001232** | **02/24/1983** | 1626 Great Hwy. | OHP row `N1180`, 2/24/1983; NPS layer 0 |
| **Fort Miley Military Reservation** | **80000371** | **05/23/1980** | Off CA 1 | OHP row `N862`, 5/23/1980; NPS layer 1 (district) |
| **Veterans Affairs Medical Center — San Francisco, California** | **05001112** | **04/20/2009** | 4150 Clement St. | NPS layer 1 (district) |
| **Golden Gate Park** | **04001137** | **10/15/2004** | Bounded by Fulton, Stanyan, Fell, Baker, Oak, Lincoln Way and The Great Highway | OHP row `N2271`, 10/15/2004; NPS layer 1 (district) |
| **Delia Fleishhacker Memorial Building** | **79000529** | **12/31/1979** | Zoo Rd. and Sloat Blvd. | NPS layer 0 |

Live NPS query used for the mapped ones (substitute the refnum):
<https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0/query?where=NRIS_Refnum%3D%2701000522%27&outFields=*&returnGeometry=false&f=json>

**Caveat the verifier must carry on two of these.** King Philip (86001014) and Point Lobos
Archeological Sites (76000176) are **absent from the NPS map service entirely** — both layers return
zero for `RESNAME LIKE '%King Philip%'` and `'%Point Lobos%'` in San Francisco, because
address-restricted archaeological and submerged sites are withheld from public mapping. Their
existence and dates were confirmed on the **California OHP register**, and the reference numbers
resolve against NPGallery
(`https://npgallery.nps.gov/NRHP/GetAsset/NRHP/86001014_text` returns a live NPS document that reads
"The PDF file for this National Register record has not yet been digitized" — i.e. the record exists
and is not digitised, not that the number is wrong). **Two registers agree on the dates; the
reference numbers have one confirming source apiece.** If the verifier wants a third, the NRHP
weekly list for those weeks is the place.

### 2.2 San Francisco Article 10 landmarks — six, with numbers

Straight from `97yj-54sx`, with the dataset's own `landmarkno` and `yeardesignated`:

| Name (as the dataset writes it) | Landmark No. | Year designated | Address on the record | lon, lat |
|---|---|---|---|---|
| **Dutch Windmill (North Windmill)** | **147** | **1981** | Golden Gate Park | −122.50940, 37.77055 |
| **Beach Chalet** | **179** | **1985** | 1000 Great Highway | −122.50991, 37.76894 |
| **Murphy Windmill and Millwright's Cottage** | **210** | **2000** | M.L. King Drive & Golden Gate Park | −122.50857, 37.76532 |
| **Doggie Diner Sign** | **254** | **2006** | Sloat Blvd | −122.50296, 37.73548 |
| **Mother's Building** | **304** | **2022** | 1 Zoo Road | −122.50370, 37.73493 |
| **City Cemetery** | **306** | **2022** | 90–100 34th Ave | −122.49346, 37.78361 |

<https://data.sfgov.org/resource/97yj-54sx.json?$limit=1000>

The Golden Gate Park National Register nomination independently corroborates three of these in its
resource inventory, in its own words: "Dutch Windmill structure 1902 … **City Landmark #147**";
"Beach Chalet structure 1925 … **City Landmark #179, listed on National Register**"; "Murphy's
Windmill structure 1905 … **City Landmark #210**"; "Millwright's House structure 1909 … **City
Landmark #210**." That is two registers agreeing on four landmark numbers.

### 2.3 There is NO National Historic Landmark in this zone

GGNRA's own page names its five NHLs: the Presidio of San Francisco, Fort Point National Historic
Site, San Francisco Port of Embarkation, Alcatraz Island, and the San Francisco Bay Discovery Site.
<https://www.nps.gov/goga/learn/historyculture/national-historic-landmarks.htm>
None is anywhere near Ocean Beach. **A writer who reaches for "National Historic Landmark" here will
invent one.**

### 2.4 THE BIG NEGATIVE: THE ADOLPH SUTRO HISTORIC DISTRICT IS NOT LISTED

This is the single most dangerous trap in the zone and it will catch anyone who reads only nps.gov.

NPS pages for the Cliff House, Sutro Baths, Sutro Heights and Lands End all link a PDF titled
**"The History and Significance of the Adolph Sutro Historic District: excerpts from the National
Register of Historic Places Nomination Form prepared in 2000."**
<https://www.nps.gov/goga/historyculture/upload/sutro_history.pdf>

A *nomination form* is not a listing. Three checks, all negative:

1. NPS `nrhp_locations`, both layers: `RESNAME LIKE '%Sutro%'` → **0 rows nationwide.**
   `RESNAME LIKE '%Adolph%'` → 22 rows nationwide, **none in California.**
2. California OHP's 224-row San Francisco register: **no Sutro entry of any kind.**
3. NPS layer 0/1, `RESNAME LIKE '%Cliff House%'` → 2 rows nationwide, in **Newport, Oregon** and
   **Manitou Springs, Colorado**. **The San Francisco Cliff House is not on the National Register.**

**Therefore: the Cliff House, Sutro Baths, Sutro Heights Park and Lands End carry NO designation
number.** The only listed thing on that headland is the Camera Obscura (01000522) and, offshore and
underground, the Point Lobos Archeological Sites (76000176). Anything a draft says about the Sutro
district being "listed", "designated" or "on the National Register" fails the build and is also
false. The nomination text is a **fine source of facts**; it is not a designation.

### 2.5 California Historical Landmarks — none in this zone

The OHP San Francisco register was parsed for plaque numbers without the `N` (National Register)
prefix — those are California Historical Landmarks and Points of Historical Interest. The full
non-`N` list was read. **Nothing on it is in the Ocean Beach zone.** The nearest are
`GOLDEN GATE PARK CONSERVATORY (841)`, which is at the far east end of the park, and
`GOLDEN GATE BRIDGE (974)`. **No CHL claim may ship for this zone.**

### 2.6 One recent listing worth flagging to the neighbouring zone

**George Washington High School, 600 32nd Avenue, NRHP ref 100013126, listed 2026-06-11.** It also
appears in `97yj-54sx` with `landmarkno "0"` and `yeardesignated "0.0"`, which is the Article 10
dataset's null, **not** a landmark number zero. It is at −122.49177, 37.77628 — Outer Richmond, well
east of anything here. **Not claimed. Flagged so nobody writes "Landmark No. 0."**

---

## 3. STRADDLERS — FLAGGED, NOT RESOLVED

**Seven groups. The arbitrator resolves these, not this file.**

1. **The Beach Chalet, the Park Chalet and the Golden Gate Park windmills.** The brief names "the
   Golden Gate Park windmills at its edge" as an Ocean Beach subject. Both layers put the Beach
   Chalet, the Park Chalet, the Dutch Windmill, the Queen Wilhelmina Tulip Garden, the Murphy
   Windmill, the Millwright's House, the Roald Amundsen monument and the Beach Chalet Soccer Fields
   **inside Golden Gate Park**, which is a separate zone in this wave. The Golden Gate Park National
   Register nomination lists every one of them as a contributing resource of district 04001137.
   Against that: the Beach Chalet's register address is **1000 Great Highway**, it faces the strand,
   and its own nomination locates it "at the western extreme of Golden Gate Park, overlooking the
   Pacific Ocean … The glass and wood frame facade overlooks a spectacular view of the ocean, and the
   Ocean Beach area north to the Cliff House." **Both readings are defensible. Neither is settled
   here.** These are the richest candidates in the file and the Golden Gate Park finder will have
   claimed them too.

2. **The whole Sutro / Lands End headland** — Cliff House, Camera Obscura, Sutro Baths, Sutro Heights
   Park, Merrie Way, Lands End Lookout, the Coastal Trail, Mile Rock Beach, the Labyrinth, Eagle's
   Point, the USS San Francisco Memorial. The layers disagree with each other on every point (§1.2);
   `gfpk-269f` gives them to **Sutro Heights** and **Lincoln Park / Ft. Miley**, `j2bu-swwd` to
   **Outer Richmond** and **Lincoln Park**; and the Sutro nomination puts Ocean Beach *outside* the
   district. The zone brief nonetheless names them as Ocean Beach subjects. **This is the largest
   single ownership question in the file.**

3. **The south end at Sloat Boulevard.** Ocean Beach's sand at Sloat tests **Lakeshore / Lakeshore**
   — a fifth neighborhood, and the same unit that holds Fort Funston and the Zoo. The **Doggie Diner
   Sign (Landmark No. 254)** tests `A=Lakeshore, B=Parkside`; the **Mother's Building (Landmark No.
   304, NRHP 79000529)** tests `A=Lakeshore, B=Lakeshore`. 36 CFR 7.97(d) makes Sloat Boulevard the
   southern terminus of the Ocean Beach Snowy Plover Protection Area, so a federal regulation
   *does* draw a line there — but it draws it for plovers, not for guides.

4. **Fort Miley, the VA Medical Center, Lincoln Park, the Legion of Honor and City Cemetery.** All
   test Lincoln Park in both layers. Two of them carry National Register district numbers (80000371,
   05001112) and one carries Landmark No. 306. The Fort Miley nomination is explicit that the two
   are separate ground: "**The Lands End area, outside the boundary and west of Fort Miley** … Lands
   End is separated from West Fort Miley by a paved road and a significantly lower elevation" and
   "Lincoln Park, adjacent to but **outside** Fort Miley on the north and east." **Not claimed here.
   Flagged because West Fort Miley's batteries are reached from the Coastal Trail and every visitor
   walks between the two without noticing a line.**

5. **The Great Highway roadway and Sunset Dunes.** Rec & Park property `163`, **"Sunset Dunes"**,
   propertytype **Parkway**, **50.60 acres**, centroid −122.50849, 37.74993, ownership "Recreation &
   Park", complex "Stern Grove Complex".
   <https://data.sfgov.org/resource/gtr9-ntp6.json?$limit=3000>
   This is *city* parkland occupying the former roadway, immediately inland of *federal* sand. It
   tests `A=Sunset/Parkside, B=Outer Sunset` in both layers. A page about Ocean Beach that ignores
   it describes a beach with nothing behind it; a page that claims it annexes a city park to a
   federal zone. **Flagged.**

6. **Balboa Natural Area.** Rec & Park property `174`, **1.84 acres**, centroid −122.51105,
   37.77592, no street address in the dataset. It is the dune ground at the north end of the strand
   and tests `A=Outer Richmond, B=Sutro Heights` — i.e. it straddles the seam between the strand and
   the Sutro headland. **Flagged.**

7. **The Outer Sunset beachfront trade.** Java Beach Cafe (1396 La Playa), Outerlands (4001 Judah),
   Mollusk Surf Shop, Aqua Surf Shop, Hook Fish Co, Other Avenues, Pitt's Pub, Beach'N SF, Black
   Bird Bookstore, Palm City Wines, Andytown-adjacent Judah/Noriega trade. Every one tests
   **Outer Sunset** in both layers; every one exists because of the beach. If an Outer Sunset zone
   ships in a later wave these are plainly its; in this wave nothing else claims them. **Flagged, not
   claimed.** See §5 for why almost none of the sf.gov copy about them is usable.

---

## 4. THE CANDIDATES

63 candidates. Each carries what was sourced and the URL for every fact. Where a fact was not
sourced it says so.

### 4.A THE STRAND ITSELF — 12 candidates

**A1. Ocean Beach** — beach, GGNRA.
* NPS: "a 3.5-mile stretch of white beach … on the westernmost border of San Francisco, adjacent to
  Golden Gate Park." **"3.5-mile" is a measurement and publishes; "westernmost" is a superlative and
  does not.** <https://www.nps.gov/goga/planyourvisit/oceanbeach.htm>
* **CONFLICT TO RESOLVE:** the Adolph Sutro nomination calls it "the **five mile long** Ocean Beach
  strand." <https://www.nps.gov/goga/historyculture/upload/sutro_history.pdf> Two federal documents,
  two lengths. A draft must pick one and cite it, or give neither.
* Hours: "Open 24/7" per the Golden Gate National Parks Conservancy.
  <https://www.parksconservancy.org/parks/ocean-beach>
* Nature: the Western Snowy Plover (*Charadrius alexandrinus nivosus*), a threatened species, rests
  here in winter. Same two sources.

**A2. The Esplanade at Ocean Beach** — promenade.
* NPS names it as a thing to do: "Walk the Esplanade at Ocean Beach."
  <https://www.nps.gov/goga/planyourvisit/things2do.htm>
* NPS: "GGNRA has constructed accessible routes which led from the parking lots to the Promenade."
  <https://www.nps.gov/goga/planyourvisit/oceanbeach.htm>
* **NOT SOURCED:** who built it, when, its length, its material. The Esplanade and the seawall (A6)
  are probably the same structure under two names and this was not resolved.

**A3. Ocean Beach fire rings** — facility.
* "Fires permitted March 1 – October 31 (NO FIRES permitted November 1 – end of February) … Fires
  are allowed only in provided fire rings **between Stairwells 15 and 20**."
  <https://www.nps.gov/goga/planyourvisit/oceanbeach.htm> and
  <https://www.parksconservancy.org/parks/ocean-beach>
* Two sources, identical wording. A season and a pair of numbered stairwells: a fact about the
  place, not about us.

**A4. Ocean Beach Snowy Plover Protection Area** — protected area, federal regulation.
* **36 CFR 7.97(d):** "Dog walking restricted to on-leash only in the area which encompasses the
  shoreline and beach area **west of the GGNRA boundary, between Stairwell 21 to Sloat Boulevard**,
  including all tidelands and submerged lands to **1,000 feet offshore**." Leash of not more than six
  feet, **July 1 to May 15**. Verified against the live eCFR text.
  <https://www.ecfr.gov/current/title-36/chapter-I/part-7/section-7.97>
* Rulemaking history on the same page: 38 FR 32931, Nov. 29, 1973, as amended.
* This is a named federal instrument with a citation. It is the closest thing the strand has to a
  designation and it is almost always missed.

**A5. King Philip (ship) and Reporter (schooner) Shipwreck Site** — archaeological site.
* **NRHP reference number 86001014, listed May 8, 1986.** Address restricted on the record.
  California OHP row `N1441`, registration date 5/8/1986.
  <https://ohp.parks.ca.gov/ListedResources/Detail/N1441>
* Location, from the Parks Conservancy: "**At the foot of Ortega Street** at very low tides, you can
  see the worn ribs of the hull of the ship *King Philip* sticking out of the sand."
  <https://www.parksconservancy.org/parks/ocean-beach>
* Same source: "Between 1850 and 1926, 20 ships came to grief on Ocean Beach." A count of ordinary
  things over a date range — allowed, and not a landmark tally.
* **This is the strongest candidate that belongs to the strand and to nothing else.** It is not in
  Golden Gate Park, not in the Sutro district, not in Lincoln Park. Point-tests
  `A=Sunset/Parkside, B=Outer Sunset` at Ortega.

**A6. The Ocean Beach seawall** — structure. **LOW CONFIDENCE — see §7.**
* SPUR led an interagency process producing the **Ocean Beach Master Plan**, "made possible by the
  State Coastal Conservancy, the San Francisco Public Utilities Commission and the National Park
  Service." <https://www.spur.org/oceanbeach>
* **NOT SOURCED:** the seawall's construction date, its engineer, its length, its material, and
  whether "seawall", "Esplanade" and "promenade" name one structure or three. The commonly repeated
  attribution to City Engineer Michael O'Shaughnessy was **not confirmed against any primary source
  in this session.** No dated claim about the seawall may ship on what is in this file.

**A7. Sunset Dunes** — city park (Parkway) on the former Great Highway roadway.
* Rec & Park property `163`, propertytype **Parkway**, **50.60 acres**, 2,204,242 sq ft, perimeter
  21,225 ft, centroid −122.50849 / 37.74993, ownership "Recreation & Park", supervisorial complex
  "Stern Grove Complex", mailing address 501 Stanyan St (Rec & Park HQ, not a site address).
  <https://data.sfgov.org/resource/gtr9-ntp6.json?$limit=3000>
* sf.gov runs a campaign page naming its access streets: **Irving, Judah, Lawton, Noriega, Taraval,
  Sloat.** <https://www.sf.gov/sunset-dunes>
* **NOT SOURCED:** the date it opened as a park, the ballot measure that created it, its official
  hours. `sfrecpark.org` facility URLs are keyed to internal CMS ids that do not match
  `property_id`; every slug guessed returned an unrelated park (e.g. `/details/163` renders Dorothy
  Erskine Park). A verifier must find the real Rec & Park page before any date ships.

**A8. Balboa Natural Area** — city natural area at the north end of the strand.
* Rec & Park property `174`, **1.84 acres**, 80,292 sq ft, centroid −122.51105 / 37.77592,
  propertytype "Neighborhood Park or Playground", ownership "Recreation & Park", complex "Richmond
  Complex", **no street address in the dataset**.
  <https://data.sfgov.org/resource/gtr9-ntp6.json?$limit=3000>
* Straddler — see §3.6.

**A9. The Great Highway** — roadway.
* Named as Golden Gate Park's western boundary in the park's National Register district record.
  <https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/1/query?where=NRIS_Refnum%3D%2704001137%27&outFields=*&returnGeometry=false&f=json>
* The Beach Chalet nomination describes its predecessor's setting: the 1900 chalet "was located just
  across the highway, **which was then a wide dirt track**." NRHP 81000172, retrieved as
  <https://npgallery.nps.gov/NRHP/GetAsset/NRHP/81000172_text>
* **NOT SOURCED:** when it was paved, its length, its closures.

**A10. Roald Amundsen monument** — monument, 1929.
* From the Golden Gate Park National Register nomination (ref 04001137): Roald Amundsen "completed
  the first crossing of the … Northwest Passage in 1906 … Amundsen made the voyage around the top of
  North America in a small sloop, the *Gjøa*, completing the journey in San Francisco. The crew was
  honored by the city, and the **Gjøa was placed at Ocean Beach. The monument, located just north of
  the Beach Chalet, was dedicated in 1929.** Gjøa remained at the monument **until 1972** when it was
  returned to Norway where it resides today at an Oslo museum."
  <https://npgallery.nps.gov/NRHP/GetAsset/NRHP/04001137_text>
* Listed in the same nomination's resource inventory as "Roald Amundsen monument 1929 1 object."
* **PHOTO NOTE FOR A LATER WAVE, not for prose:** a monument is a sculptural work, not a building.
* Straddler with Golden Gate Park (§3.1) — it tests `Golden Gate Park` in both layers.

**A11. Moss Flats Building, 1626 Great Highway** — apartment building.
* **NRHP reference number 83001232, listed February 24, 1983.** Register address "1626 Great Hwy."
  California OHP row `N1180`, 2/24/1983.
  <https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0/query?where=NRIS_Refnum%3D%2783001232%27&outFields=*&f=json>
  and <https://ohp.parks.ca.gov/ListedResources/?view=county&criteria=38>
* −122.50874 / 37.75618; tests `A=Sunset/Parkside, B=Outer Sunset`.
* **NOT SOURCED:** architect, date built, what it looks like. The nomination PDF download timed out
  and was not obtained. This is a listed building directly facing the strand that nobody writes
  about — worth the verifier's time.

**A12. Ocean Beach stairwells** — access structures.
* NPS and 36 CFR 7.97(d) both address the beach by numbered stairwell: fire rings between 15 and 20,
  plover area from 21 south. <https://www.nps.gov/goga/planyourvisit/oceanbeach.htm>,
  <https://www.ecfr.gov/current/title-36/chapter-I/part-7/section-7.97>
* **NOT SOURCED:** how many there are, where each one is, when they were built. **Do not count them.**

### 4.B THE SUTRO HEADLAND AND LANDS END — 22 candidates, all straddlers per §3.2

**B1. Cliff House, 1090 Point Lobos Avenue** — building, 1909.
Everything below is from <https://www.nps.gov/goga/learn/historyculture/cliff-house.htm> unless noted.
* First Cliff House constructed **1863**, "a modest one-story wood-frame structure … on top of the
  cliff overlooking Seal Rocks." Reached by a private road built for the purpose, **Point Lobos
  Avenue**, and from the 1860s by a Sunday horse-drawn stagecoach from downtown.
* **Adolph Sutro bought it in 1881.** Fire destroyed the wood-frame building on **Christmas Day,
  1894**.
* Second Cliff House opened **1896**, cost **$75,000**, "eight-story tall castle-like structure with
  turrets, decorative spires, fanciful roof dormers and an observation tower." It survived the 1906
  earthquake; **fire destroyed it in September 1907.**
* Third Cliff House, in reinforced concrete, **opened to the public in 1909**. The Sutro nomination
  dates the reopening precisely and names the architects: "The Cliff House, **reopened … on July 1,
  1909**, was a significant example of their work" — **the Reid Brothers**.
  <https://www.nps.gov/goga/historyculture/upload/sutro_history.pdf>
* Sutro family sold it in **1937**. **NPS acquired the property in 1977.** NPS "rehabilitated the
  historic Cliff House in 2005 to return it to its original neoclassical design. Architects added an
  adjacent **Sutro Wing**."
* **NO DESIGNATION. See §2.4.** Not on the National Register, not an Article 10 landmark, not a CHL.
* **OPERATING STATUS NOT ESTABLISHED — see §7.** NPS's current things-to-do page does not mention
  the Cliff House at all. Whether a restaurant trades there in 2026 was not determined. **Do not
  write hours, do not write "closed", do not write "reopened."**

**B2. Camera Obscura, 1096 Point Lobos Avenue** — building/apparatus, 1946.
All from the nomination, <https://npgallery.nps.gov/NRHP/GetAsset/NRHP/01000522_text>, unless noted.
* **NRHP reference number 01000522, listed May 23, 2001.** Cross-checked at California OHP row
  `N2132`, 5/23/2001. <https://ohp.parks.ca.gov/ListedResources/Detail/N2132>
* Nomination header: Area of Significance **ENGINEERING**; Period of Significance **1946**;
  Significant Dates "**1946 constructed; 1957 exterior remodeled**"; **Architect/Builder: Floyd
  Jennings (Builder)**.
* As built in 1946 the housing was "approximately **17.5 feet by 17.5 feet**," a square wood frame
  structure with horizontal redwood tongue-in-groove siding on a six-inch concrete pad.
* Apparatus, unchanged since installation in 1946: "a circular **parabolic** dish made of shaped
  plywood surfaced with white enamel," anchored to the concrete floor by a metal frame and a rod that
  "penetrates the floor and is anchored to the native rock of the site." "The **6-foot** parabolic
  projection table is located centrally in the room." The lens and mirror sit **150 inches** above
  it, in a rotating metal hood turned by an electric motor.
* 1957: "the external appearance of the camera obscura housing was altered to resemble a '**giant
  camera**' following the wishes of [then] Cliff House owner **George K. Whitney, Sr.**"
* Origin: Whitney "was approached with the idea of placing a camera obscura behind the Cliff House,
  facing the sea, by businessman **Floyd Jennings**, who had been fascinated with the concept …
  Experimenting at home, Jennings built a crude, modern device that worked."
* **BANNED FROM THE PAGE:** the nomination's own claim that it "appears to be the last example of a
  camera obscura in the United States that is contained in a free standing building and is older
  than 50 years of age" is a superlative and does not publish, attributed or not.
* **OPERATING STATUS NOT ESTABLISHED — see §7.**

**B3. Sutro Baths ruins** — ruins, 1894–1896.
From <https://www.nps.gov/goga/learn/historyculture/sutro-baths.htm> unless noted.
* Adolph Sutro "developed the amazing Sutro Baths in **1894** … he constructed an ocean pool aquarium
  among the rocks north of the Cliff House," then "a massive public bathhouse that covered **three
  acres**."
* "A classic Greek portal opened to a massive glass enclosure containing **seven swimming pools at
  various temperatures**. There were slides, trapezes, springboards and a high dive."
* "The power of the Pacific Ocean during high tide could fill the **1.7 million gallons** of water
  required for all the pools **in just one hour**."
* "The Baths could accommodate **10,000 people** at one time and offered **20,000 bathing suits and
  40,000 towels** for rent."
* Front entrance held natural history exhibits and galleries of sculpture, painting, tapestry and
  artifacts from Mexico, China, Asia and the Middle East.
* Sutro died **1898**. The baths ran under Emma Merritt and then Gustav Sutro "**until 1937**," when
  part was converted to an ice rink (Sutro nomination). Sold to the Whitneys in **1952** (Sutro
  nomination). "In **1964**, developers … bought the site and began demolition … In **1966**, a fire
  destroyed what was left."
* **DATE CONFLICT TO RESOLVE:** the Sutro Baths page says the ruins "have been part of the Golden
  Gate National Recreation Area **since 1973**"; the Adolph Sutro nomination says "**Since 1976**,
  the area has been part of the Golden Gate National Recreation Area."
  <https://www.nps.gov/goga/historyculture/upload/sutro_history.pdf> Two NPS documents, two years.
  **A draft must not split the difference.**
* **NO DESIGNATION. See §2.4.**

**B4. Sutro Heights Park, 846 Point Lobos Avenue** — public garden, 1885.
From <https://www.nps.gov/goga/learn/historyculture/sutro-heights.htm> unless noted.
* "In **1885**, self-made millionaire Adolph Sutro created the Sutro Heights Park, an elegant and
  formal public garden that covered **over twenty acres**."
* "a fantastic collection of flower beds, forests, elegant wide walkways, hedge mazes and
  'parterres'."
* "he imported **over 200 concrete replicas** of Greek and Roman statuary **from Belgium**."
* "Sutro maintained a full-time staff of **17 gardeners, machinist and drivers**."
* Structures named: an **observation platform plaza** overlooking the Cliff House; the **Dolce far
  Niente balcony**, "a long terrace-like structure on the cliff overlooking Ocean Beach"; a
  "glass-paned conservatory"; garden sheds.
* Two **octagonal wood-frame gatekeeper's houses** built around 1885–1886, one at the main gate and
  one at the lower gate, "clad in horizontal tongue in groove siding, with pointed roofs and metal
  weathervanes in the shape of roosters" (Sutro nomination).
* **Hours: open 6 a.m. until one hour after sunset**, per GGNRA's hours page, which lists Sutro
  Heights Park by name among the San Francisco County areas on that schedule.
  <https://www.nps.gov/goga/planyourvisit/hours.htm>
* **NOT SOURCED:** the 846 Point Lobos street number was not confirmed against an NPS or city record
  in this session. **Do not ship the number without one.**

**B5. The Parapet at Sutro Heights** — structure.
* Sutro nomination: "There are still views of the ocean and surrounding coast from the
  **semi-circular parapet** located at the western end of the site."
  <https://www.nps.gov/goga/historyculture/upload/sutro_history.pdf>
* Same source: "Until well into the 1920s, the gallery operated as a photograph and souvenir
  concession; visitors could have their picture taken with the panoramic view of the parapet in the
  background, rent special glasses with which to view Seal Rock, and purchase postcards."

**B6. The well house, Sutro Heights** — building, c. 1885.
* Sutro nomination: "The well house, built **around 1885**, is the last surviving building from the
  Sutro era remaining at Sutro Heights. Built on an elevated foundation of **cut and dressed
  sandstone**, this small wood-frame structure originally featured carved wooden posts, iron
  grillwork doors on the north and south facades, decorative shingles, and finials."
  <https://www.nps.gov/goga/historyculture/upload/sutro_history.pdf>
* **"the last surviving building" is a superlative.** Rewrite as a fact — it is a wood-frame building
  on a dressed-sandstone foundation, built around 1885 — or drop the claim.

**B7. The lion statues and main gate, Sutro Heights** — objects.
* An NPS caption dates them: "Front public entrance of Sutro Heights, **flanked by reclining lion
  statues; circa 1885**." <https://www.nps.gov/goga/learn/historyculture/sutro-heights.htm>
* Sculptures, not architecture, for photo purposes in a later wave.

**B8. Merrie Way / the Sutro Pleasure Grounds site** — parking lot and site.
* NPS: "Wheelchair-accessible trails begin from the trailhead at **Merrie Way parking lot**."
  <https://www.nps.gov/goga/planyourvisit/landsend.htm>
* NPS links a page titled "History: Merrie Way — Learn about the former **Sutro Pleasure Grounds** at
  Merrie Way" from the same page; the target URL guessed for it 404'd and the page was not read.
* Tests `A=Outer Richmond, B=Lincoln Park / Ft. Miley`.

**B9. Lands End Lookout Visitor Center, 680 Point Lobos Avenue, San Francisco CA 94121** —
visitor centre.
* Address, phone, coordinates and hours from GGNRA's own structured data:
  `"streetAddress": "680 Point Lobos Ave", "postalCode": "94121"`, `"telephone": "4154265240"`,
  `longitude -122.511611527, latitude 37.7797300961`, `opens 09:00:00 / closes 17:00:00`,
  description "**Lands End Lookout is open 7 days a week 9am to 5pm.**"
  <https://www.nps.gov/goga/goga_linked_data.json> (note: the file is served with a UTF-8 BOM)
* NPS also gives the phone in prose: "Contact for more information: Lands End Lookout (415) 426-5240."
  <https://www.nps.gov/goga/planyourvisit/landsend.htm>
* **A hard boundary artifact:** at NPS's own coordinate this tests `A=Outer Richmond,
  B=Lincoln Park / Ft. Miley` — the two layers disagree about the visitor centre for the whole area.

**B10. The Coastal Trail, Lands End** — trail.
* NPS: "Walk north along the edge of the city — and the continent — on the Coastal Trail."
  <https://www.nps.gov/goga/planyourvisit/landsend.htm> **That phrasing is orientation by impression
  and must be paraphrased to a fact.**
* Same page: "Lands End's trails wind their way around rocky cliffs above the ocean, moving through
  shady stands of cypress and eucalyptus."
* GGNRA hours page lists **Lands End** among the areas "open from 6 a.m. until 1 hour after sunset."
  <https://www.nps.gov/goga/planyourvisit/hours.htm>
* **NOT SOURCED:** the trail's length, its surface, its trailheads other than Merrie Way.

**B11. El Camino del Mar Trail** — trail.
* NPS: "Scan San Francisco from the Legion of Honor overlook and return via the El Camino Del Mar
  Trail." <https://www.nps.gov/goga/planyourvisit/landsend.htm>
* **NOT SOURCED:** anything else.

**B12. Mile Rock Beach** — beach.
* Tests `A=Lincoln Park, B=Lincoln Park / Ft. Miley`.
* **NOT SOURCED.** Named on NPS's downloadable Lands End map, which was not retrieved. No NPS prose
  page for it was found. **A candidate the verifier must source or drop.**

**B13. Lands End Labyrinth** — artwork.
* **NOT SOURCED** in this session. The commonly cited creator (Eduardo Aguilera) and date were not
  confirmed against any primary source. Tests `A=Lincoln Park, B=Lincoln Park / Ft. Miley`.
* **PHOTO NOTE FOR A LATER WAVE, not for prose:** an installed artwork, not a building.

**B14. Eagle's Point overlook, El Camino del Mar** — overlook.
* **NOT SOURCED.** Tests `A=Lincoln Park, B=Lincoln Park / Ft. Miley`.

**B15. USS San Francisco Memorial** — memorial.
* NPS: "Check out the memorial to the USS San Francisco — a WWII cruiser that sustained **45 hits and
  25 fires** during the **Battle of Guadalcanal in 1942** — and the newly improved adjacent
  overlook." <https://www.nps.gov/goga/planyourvisit/landsend.htm>
* Located on El Camino del Mar; tests `A=Lincoln Park, B=Lincoln Park / Ft. Miley`.
* **NOT SOURCED:** what the memorial physically is (the bridge wing of the ship), when it was
  dedicated. Two candidate NPS URLs 404'd.

**B16. Point Lobos Archeological Sites** — archaeological district.
* **NRHP reference number 76000176, listed November 7, 1976.** Address Restricted.
  California OHP row `N445`, registration date 11/7/1976.
  <https://ohp.parks.ca.gov/ListedResources/Detail/N445>
* Absent from the NPS map service by design (§2.1).
* Context from NPS: "Long before Europeans arrived in North America, the **Yelamu Ohlone** tribe
  lived at Lands End in seasonal settlements … they fished and hunted for otters, sea lions, and sea
  birds. Spanish settlement of San Francisco, which began in **1776**, ended the Yelamu's
  traditional life at Lands End."
  <https://www.nps.gov/goga/learn/historyculture/lands-end.htm>
* **The listing publishes with its number and date. The site locations do not, and NPS withholds
  them; a page must not attempt to place them.**

**B17. Seal Rocks** — rocks, offshore.
* Sutro nomination: "Directly offshore are the **Seal Rocks**, which in **1887**, at Adolph Sutro's
  urging, were designated a wildlife preserve by the **United States Congress**, to protect the
  colony of sea lions residing there."
  <https://www.nps.gov/goga/historyculture/upload/sutro_history.pdf>
* **This is a designation claim with a named authority and a year but NO identifier** — no public law
  number, no statute citation. **As written it fails the rule.** Either the act is found and cited,
  or the claim is dropped. Flagged for the verifier because it is a genuinely unusual designation and
  worth the chase.
* The rocks test **OUTSIDE both layers** — they are past the waterline.

**B18. Point Lobos, the headland** — landform.
* NPS: "The Spanish named Lands End's westernmost promontory 'Point Lobos,' for the many *lobos
  marinos* (sea wolves, a.k.a. sea lions) that once hauled up on the rocks offshore."
  <https://www.nps.gov/goga/planyourvisit/landsend.htm> **"westernmost" is a superlative.**
* Under Mexican rule "this rugged section of coastline was part of a large land grant called
  **Rancho Punta de Lobos**." <https://www.nps.gov/goga/learn/historyculture/lands-end.htm>
* Fort Miley nomination: Point Lobos is "one of the outer headlands on the southern side of the
  Golden Gate," at "an elevation of approximately **350 feet**."
  <https://npgallery.nps.gov/NRHP/GetAsset/NRHP/80000371_text>

**B19. Adolph Sutro (as a subject of the Sutro Heights / Cliff House pages)** — person, not a place.
* Listed here only so nobody makes a place of him. NPS has a dedicated page,
  <https://www.nps.gov/goga/learn/historyculture/adolph-sutro.htm>, which was fetched (HTTP 200) but
  not read in full.

**B20. Site of the Harris v. Sutro case** — no physical place; do not make one.
* NPS: "In **1897**, John Harris, an African American, challenged Sutro Bath's 'whites only' policy in
  court and won his case. *Harris vs. Sutro* placed San Francisco at the heart for the fight against
  separate but equal during the Jim Crow Era."
  <https://www.nps.gov/goga/learn/historyculture/lands-end.htm> and a dedicated NPS page,
  <https://www.nps.gov/goga/learn/historyculture/john-harris-civil-rights.htm> (fetched HTTP 200, not
  read in full).
* **This is history that belongs in the Sutro Baths entry (B3), not a candidate of its own.** NPS's
  own gloss "predates the National Civil Rights Act by 67 years" should be checked before reuse.

**B21. Sutro Baths cave / tunnel** — feature.
* **NOT SOURCED.** No NPS page for it was found. Verifier must source or drop.

**B22. Giant Camera gift shop / Louis' Restaurant, 902 Point Lobos Avenue** — businesses.
* **NOT SOURCED and NOT VERIFIED as trading.** Named here only so a later pass knows they were
  considered and not confirmed. **A founding year from an operator's own site is a trading-duration
  claim and does not publish; do not go looking for one.**

### 4.C GOLDEN GATE PARK'S WESTERN EDGE — 10 candidates, all straddlers per §3.1

**C1. Beach Chalet, 1000 Great Highway** — building, 1925.
All from the nomination, <https://npgallery.nps.gov/NRHP/GetAsset/NRHP/81000172_text>, unless noted.
* **NRHP reference number 81000172, listed July 22, 1981.** Also **San Francisco Landmark No. 179,
  designated in 1985** (`97yj-54sx`). California OHP row `N964`, 7/22/1981. **Three registers.**
* "The Beach Chalet stands at 1000 Great Highway, at the western extreme of Golden Gate Park,
  overlooking the Pacific Ocean. It was built in **1925** as a modified Spanish-Moorish style
  pavilion to house a municipal restaurant."
* Predecessor: "a wooden Victorian style building, often referred to as the 'Swiss Chalet,'
  constructed by architect **W. Q. Banks in 1900** … located just across the highway."
* "The existing structure, measuring **58' x 104'**, was commissioned by the Recreation and Park
  Department of San Francisco … for **$60,000**. Designed by **Willis Polk**."
* "A white stucco building roofed with handwrought, terra cotta barrel tiles … a **ground floor
  arcade with eight pairs of doric columns, defining seven interior bays**."
* "The exterior front porch is decorated with a **6' diameter mosaic of the Seal of the Park
  Commission**, which was incorporated into Polk's original design."
* Opened **June 1925**; upstairs restaurant seating **200** diners; ground floor a "commodious rest
  room" for bathers, with arched Moorish-style windows and a beamed ceiling of hewn timber.
* "taken over in **1930** by two sisters, **Hattie and Minnie Mooser**, and run as a tearoom. During
  World War II, the Army converted the Beach Chalet into **coastal defense headquarters**."
* "In **1947**, under the instigation of **William McCarthy** … the chalet was reopened. Rented by
  the **V.F.W.**"
* Acreage of nominated property **.8767 acres**; the parcel "extend[s] back **144 feet** into the
  dunes … approximately **575 feet** south of Kennedy Drive … and extending directly south **276
  feet**."
* **HANDLE WITH CARE:** the nomination says the Beach Chalet "was the **last** design of noted San
  Francisco architect Willis Polk, who died in **1924**, before the completion of the structure," and
  the Golden Gate Park nomination repeats it as "the **last commission**." A verifier may read "last"
  as a sequence rather than a superlative; the safe rewrite is the plain fact — **Polk designed it
  and died in 1924, before it was finished.**

**C2. The Beach Chalet frescoes** — artworks, 1936.
* Nomination: "On the ground floor, **1,500 square feet** of walls, ceiling and stair well were
  decorated with frescos in **1936** by **Lucien Labaudt**. The murals are framed with mosaic work,
  designed by Labaudt and executed by **Primo Caredio**. Several support columns and the stair
  railings were embellished with **Michael von Meyer's** sculpture."
  <https://npgallery.nps.gov/NRHP/GetAsset/NRHP/81000172_text>
* **PHOTO NOTE FOR A LATER WAVE, not for prose:** frescoes and mosaics are artworks, not
  architecture. **Say nothing about why.**

**C3. Park Chalet** — restaurant, rear of the Beach Chalet building.
* The operator's site resolves (HTTP 200): <https://www.parkchalet.com/> and
  <https://www.beachchalet.com/>. **Not read in this session; nothing from them is asserted here.**
  Their own site establishes identity, location and hours and nothing else.

**C4. Golden Gate Park Senior Center / the Beach Chalet ground floor** — facility.
* **NOT SOURCED.** Named only because the nomination records a V.F.W. tenancy on the ground floor
  from 1947 and the current occupant was not established.

**C5. Dutch Windmill (North Windmill), Golden Gate Park** — structure, 1902.
* **San Francisco Landmark No. 147, designated in 1981** (`97yj-54sx`, `landmarkno "147"`,
  `yeardesignated "1981.0"`). Corroborated in the Golden Gate Park nomination's inventory as "Dutch
  Windmill structure 1902 1 structure **City Landmark #147**."
* From the nomination: "built in **1902** to pump water from wells near the windmill to the reservoir
  on Strawberry Hill. The Park Commission approved development of a '**windmill of the Holland
  type**' … It was designed by **Alpheus Bull, Jr., a mechanical engineer from the Union Iron
  Works**, and had a capacity of **30,000 gallons per hour**. The structure is **75 feet tall**, and
  has a **5-foot thick concrete foundation with a diameter of 33 feet**. The tower is a wood frame
  structure covered with **wood shingles**. The pumps were electrified in **1913**."
  <https://npgallery.nps.gov/NRHP/GetAsset/NRHP/04001137_text>

**C6. Queen Wilhelmina Tulip Garden** — garden.
* Golden Gate Park nomination: "the tulips and the windmill share their Dutch origins. **Queen
  Wilhelmina of the Netherlands** reportedly visited the site at some time. **Upon her death in 1962,
  the garden was named in her honor.**" Inventory entry: "Queen Wilhelmina Tulip Garden horticultural
  feature **unknown** 1 site" — i.e. **the register itself does not know when it was made.**
  <https://npgallery.nps.gov/NRHP/GetAsset/NRHP/04001137_text>

**C7. Murphy Windmill (South Windmill), Golden Gate Park** — structure.
* **San Francisco Landmark No. 210, designated in 2000**, as "Murphy Windmill and Millwright's
  Cottage" (`97yj-54sx`), register address "M.L. King Drive & Golden Gate Park."
* **DATE CONFLICT TO RESOLVE.** The Golden Gate Park National Register nomination says **1905**,
  twice: "Murphy's Windmill structure **1905**" in the inventory and "a larger windmill with a
  capacity of **40,000 gallons per hour**, was built in **1905** at the southwest corner of the
  park." The year 1908 is widely repeated elsewhere. **This file has only the 1905 source. A draft
  must use 1905 with this citation, or find a second register that says otherwise.**
* Also from the nomination: "With funds donated by **Samuel Murphy** … At **95 feet tall and a span
  of 114 feet** … The structure has a massive concrete foundation supporting a wood-framed tower that
  is covered with **slate roofing shingles**. It was said to be designed after English style
  windmills and is sometimes referred to as the **English Windmill**. The windmill was not used for
  pumping water after **1913**."
  <https://npgallery.nps.gov/NRHP/GetAsset/NRHP/04001137_text>
* **BANNED:** the nomination's "it was the largest windmill of its kind in the world" is a
  superlative and does not publish.

**C8. Millwright's House, Golden Gate Park** — building, 1909.
* Part of **San Francisco Landmark No. 210, designated in 2000** (the Article 10 record names it
  "Millwright's Cottage"; the National Register nomination calls it the "Millwright's House" — **the
  two registers use different names for the same building**).
* "A millwright's house was constructed in **1909**, just east of the Murphy's Windmill. The house is
  a small, **two story brick building with a slate shingle roof**. The house, designed by the **Reid
  Brothers** architects…"
  <https://npgallery.nps.gov/NRHP/GetAsset/NRHP/04001137_text>

**C9. Beach Chalet Soccer Fields** — recreation feature.
* Golden Gate Park nomination inventory: "Beach Chalet Soccer Fields recreation feature **unknown**
  1 site" and "Beach Chalet Soccer Fields restroom structure **1930's** 1 building."
  <https://npgallery.nps.gov/NRHP/GetAsset/NRHP/04001137_text>
* Tests `Golden Gate Park` in both layers.

**C10. Golden Gate Park (the National Register district itself)** — district, and a warning.
* **NRHP reference number 04001137, listed October 15, 2004.** 1,017 acres. Nomination prepared by
  **Douglas Nelson, Landscape Architect, Royston Hanamoto Alley & Abey**, July 2003, revised June
  2004. <https://npgallery.nps.gov/NRHP/GetAsset/NRHP/04001137_text>
* **DO NOT COUNT.** The nomination's inventory ends with a total contributing / non-contributing
  tally. That number is exactly the kind of tally the wave-1 arbitrator banned. It is recorded
  nowhere in this file and must not reach prose in any form — not as a figure, not as "over a
  hundred", not as "dozens of".
* This is the Golden Gate Park zone's district, named here only because its western boundary is the
  Great Highway and it therefore defines this zone's eastern edge.

### 4.D FORT MILEY AND LINCOLN PARK — 6 candidates, all straddlers per §3.4

**D1. Fort Miley Military Reservation** — historic district.
* **NRHP reference number 80000371, listed May 23, 1980.** Register address "Off CA 1"; historic name
  "Fort Miley Military Reservation; (**Point Lobos Military Reservation**)"; other names "Fort Miley;
  East Fort Miley, West Fort Miley." California OHP row `N862`, 5/23/1980.
* Nomination facts: "acquired by the U.S. Army **by condemnation from the City and County of San
  Francisco in 1893**. The reservation contained **54 1/20 acres** and was located on top of the
  headland at an elevation of approximately **350 feet**." Acreage of the *nominated* property:
  "**approx. 27.5**", marked "ACREAGE NOT VERIFIED" on the form itself.
  <https://npgallery.nps.gov/NRHP/GetAsset/NRHP/80000371_text>
* Street description on the form: "On Point Lobos bordered by Clement Street and Lincoln Park
  between 40th to 48th Avenues."

**D2. Battery James Chester, West Fort Miley** — battery.
* From the same nomination: the plan "called for a battery of **two 12-inch rifles on 'disappearing'
  carriages** and a battery of sixteen 12-inch mortars. Construction of the gun battery was in
  progress by the autumn of **1899** … The rifled gun battery (FI-2) … was completed in **1901**. In
  **1903**, a third 12-inch gun, mounted on a (non-disappearing) barbette carriage, was added … The
  complete work was **named Battery James Chester in 1904**."
* "Battery Chester continued to be armed and to play a role in San Francisco's defenses until the
  middle of World War II. Late in **1942**, the 12-inch gun on the barbette carriage … was declared
  obsolete and ordered salvaged. By the summer of **1943** … the two 12-inch rifles on the
  'disappearing' carriages were no longer needed."
* NPS visitor framing: "The West Fort Miley batteries offer a grassy picnic area among three
  turn-of-the-century gun emplacements." <https://www.nps.gov/goga/planyourvisit/landsend.htm>
* **The nomination explicitly separates this from Lands End:** "The Lands End area, **outside the
  boundary and west of Fort Miley** … Lands End is separated from West Fort Miley by a paved road and
  a significantly lower elevation."

**D3. Veterans Affairs Medical Center — San Francisco, California, 4150 Clement Street** — district.
* **NRHP reference number 05001112, listed April 20, 2009.** NPS polygon layer 1, centroid
  −122.50548 / 37.78456. Tests `A=Lincoln Park, B=Lincoln Park / Ft. Miley`.
  <https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/1/query?where=NRIS_Refnum%3D%2705001112%27&outFields=*&returnGeometry=false&f=json>
* **NOT SOURCED:** anything about what it is. A working hospital campus; probably not a guide subject
  at all. Recorded so the number is not lost.

**D4. Lincoln Park** — city regional park.
* Rec & Park property `103`, **112.82 acres**, address **100 34th Ave**, ownership "Recreation &
  Park", complex "Richmond Complex", centroid −122.49833 / 37.78424.
  <https://data.sfgov.org/resource/gtr9-ntp6.json?$limit=3000>

**D5. City Cemetery, 90–100 34th Avenue** — site.
* **San Francisco Landmark No. 306, designated in 2022** (`97yj-54sx`, `landmarkno "306"`,
  `yeardesignated "2022.0"`, apn 1313029). −122.49346 / 37.78361 — the Lincoln Park golf course
  ground. **NOT SOURCED** beyond the register row. A very recent designation almost nobody knows
  about; worth the verifier's time if Lincoln Park lands in any zone.

**D6. Legion of Honor, 100 34th Avenue** — museum.
* Tests `A=Lincoln Park, B=Lincoln Park / Ft. Miley` — outside the Ocean Beach reading under both
  layers. **NOT SOURCED.** Named because NPS routes Lands End walkers past it: "Scan San Francisco
  from the Legion of Honor overlook." <https://www.nps.gov/goga/planyourvisit/landsend.htm>
* **PHOTO NOTE FOR A LATER WAVE, not for prose:** whatever sculpture stands on its grounds is
  sculpture.

### 4.E THE SOUTH END AT SLOAT — 3 candidates, straddlers per §3.3

**E1. Doggie Diner Sign, Sloat Boulevard** — object.
* **San Francisco Landmark No. 254, designated in 2006** (`97yj-54sx`, register address "Sloat
  Blvd"). −122.50296 / 37.73548. Tests `A=Lakeshore, B=Parkside` — **the two layers disagree.**
* **NOT SOURCED:** its height, its material, its date, how it came to stand there. A rotating
  fibreglass sign is an object, not a building.

**E2. Mother's Building / Delia Fleishhacker Memorial Building, 1 Zoo Road** — building.
* **Two registers.** **San Francisco Landmark No. 304, designated in 2022** (`97yj-54sx`, apn
  7281006). **NRHP reference number 79000529, listed December 31, 1979**, register name "Fleishhacker,
  Delia, Memorial Building," register address "Zoo Rd. and Sloat Blvd."
  <https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0/query?where=NRIS_Refnum%3D%2779000529%27&outFields=*&f=json>
* Tests `A=Lakeshore, B=Lakeshore`. Almost certainly not this zone's; recorded because the numbers
  are real and easy to lose.

**E3. San Francisco Zoo, 1 Zoo Road** — zoo.
* Rec & Park property `12`, **131.54 acres**, propertytype "Zoological Garden", ownership
  "Recreation & Park", complex "Lake Merced Complex", centroid −122.50382 / 37.73159.
  <https://data.sfgov.org/resource/gtr9-ntp6.json?$limit=3000>
* Tests Lakeshore in both layers. **Not this zone's.**

### 4.F THE BEACHFRONT TRADE — 10 candidates, straddlers per §3.7

Every one tests **`A=Sunset/Parkside, B=Outer Sunset`**. All are named on sf.gov's "Perfect Day by
Sunset Dunes Park" campaign page, <https://www.sf.gov/sunset-dunes>, which establishes **that they
exist and roughly where** and nothing else.

**F1. Java Beach Cafe, 1396 La Playa** — cafe. Its own site returned **HTTP 403** and was not read.
**F2. Outerlands, 4001 Judah Street** — restaurant. Its own site resolves (HTTP 200), not read.
**F3. Mollusk Surf Shop** — surf shop.
**F4. Aqua Surf Shop** — surf shop.
**F5. Hook Fish Co** — restaurant.
**F6. Other Avenues** — grocery co-operative.
**F7. Pitt's Pub** — bar.
**F8. Beach'N SF** — restaurant.
**F9. Black Bird Bookstore** — bookshop.
**F10. Palm City Wines** — wine bar and sandwich shop.

**READ THIS BEFORE USING ANY OF THAT PAGE.** The sf.gov copy is promotional and is packed with
exactly what the rules forbid: "one of the most beautiful parklets in the city", "iconic",
"longstanding", "A San Francisco institution … for decades", "continuously running cooperative since
1974", "opened in 1971", "for almost 20 years", "began its long story in 1960". **Superlatives and
trading-duration claims, every one.** The page is usable for a name, a street and a kind. Nothing
else on it may be paraphrased into a draft.

---

## 5. WHAT THIS ZONE DOES NOT HAVE — read before drafting

* **No National Historic Landmark.** (§2.3)
* **No California Historical Landmark.** (§2.5)
* **No Article 10 landmark on the Sutro headland or on the strand.** Every Article 10 number in this
  file is in Golden Gate Park, in Lincoln Park, or at the Zoo. **The workhorse citation of wave 1 —
  "San Francisco Landmark No. N, designated in YYYY" — is available here only for straddlers.**
* **No National Register listing for the Cliff House, Sutro Baths, Sutro Heights or Lands End.**
  (§2.4) The listed things are the Camera Obscura, the Point Lobos Archeological Sites, the King
  Philip and Reporter wreck site, the Beach Chalet, Moss Flats, Fort Miley, the VA campus and Golden
  Gate Park.
* **No neighborhood polygon.** (§1) The zone exists as a place people go and as federal
  administrative ground; it does not exist as a unit of San Francisco's own geography.
* **No GGNRA polygon was obtained.** (§1.4)

---

## 6. TRAPS THE RULES WILL CATCH

Phrases lifted verbatim from the sources above that **must not survive into prose**:

| Source phrase | Source | Why it fails |
|---|---|---|
| "on the **westernmost** border of San Francisco" | NPS Ocean Beach | superlative |
| "Lands End's **westernmost** promontory" | NPS Lands End | superlative |
| "the **largest** windmill of its kind in the world" | GGP nomination | superlative |
| "the **largest** camera obscura west of Chicago" | Sutro nomination, quoting an 1896 newspaper | superlative, attributed or not |
| "appears to be the **last** example of a camera obscura in the United States…" | Camera Obscura nomination | superlative |
| "the **last** surviving building from the Sutro era" | Sutro nomination | superlative |
| "the **most significant** and enduring" (of Sutro's works) | Sutro nomination | superlative |
| "**one of the gems** of the San Francisco landscape" | SPUR | superlative |
| "lies nearly hidden at the **southern edge**" pattern | NPS house style | orientation by impression |
| "Walk north along **the edge of the city — and the continent**" | NPS Lands End | orientation by impression |
| "at the **northwestern corner** of San Francisco" | NPS Lands End | orientation by impression |
| the GGP nomination's contributing-resource total | GGP nomination | **a tally. Do not count.** |
| "Adolph Sutro Historic District" described as listed | any draft | **false, and a bare designation claim** |
| "the **first** city where every resident lives within a 10-minute walk of a park" | sfrecpark.org boilerplate | superlative, and about the city not the place |

Two more, about method rather than superlatives:

* **Nothing about the NPS boundary service returning 404** may appear in reader-facing text. It is
  recorded in §1.4 for the verifier. A page that says "the federal boundary could not be retrieved"
  is narrating our fetching.
* **Nothing about the two neighborhood layers disagreeing** may appear in reader-facing text either.
  "The two boundary readings disagree" is on the banned list by name. The disagreement is the
  arbitrator's input, not the reader's.

---

## 7. LEAST CONFIDENT — the verifier should start here

1. **Cliff House and Camera Obscura operating status.** Neither appears on GGNRA's current
   things-to-do page. The NPS history pages describe the Cliff House in the present tense but were
   last updated 2023 and 2015. **No source obtained states whether either is open in 2026.** A draft
   that gives hours, or that says "closed", is inventing. This is the most likely place for a false
   fact to enter the page.
2. **The Ocean Beach seawall.** (A6) Undated, unattributed, and possibly not distinct from the
   Esplanade. The O'Shaughnessy attribution is unverified. **Nothing dated about it may ship.**
3. **Murphy Windmill, 1905 vs 1908.** (C7) The only source in this file says 1905, twice. The widely
   repeated year is 1908. One register against common repetition — the register wins, but a second
   register would settle it.
4. **Ocean Beach's length, 3.5 miles vs five miles.** (A1) Two NPS documents disagree.
5. **GGNRA acquisition of the Sutro area, 1973 vs 1976.** (B3) Two NPS documents disagree.
6. **King Philip refnum 86001014 and Point Lobos refnum 76000176.** (§2.1) Dates confirmed on two
   registers; the reference numbers themselves rest on one confirming source each, because the NPS
   map service withholds address-restricted records.
7. **Sutro Heights Park's street number (846 Point Lobos Ave).** (B4) Not confirmed against any
   record in this session.
8. **Mile Rock Beach, the Lands End Labyrinth, Eagle's Point and the Sutro Baths cave.** (B12–B14,
   B21) Four named features with **no source at all**. Source them or drop them.
9. **Sunset Dunes' opening date and hours.** (A7) The park is real and in the city's property
   register; nothing about when it opened was sourced.

---

## 8. SCRIPTS — reproducible

All under
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/`:

| Script | What it does |
|---|---|
| `ob_fetch.py` | cached fetch + point-in-polygon with hole handling |
| `ob_hoods.py` | dumps all 41 `j2bu-swwd` and all 117 `gfpk-269f` unit names |
| `ob_pip.py`, `ob_pip2.py` | 60 candidate points tested against both layers |
| `ob_desig.py` | all 370 Article 10 rows + the 175-row district survey |
| `ob_nrhp.py`, `ob_nrhp2.py`, `ob_nrhp3.py` | NPS `nrhp_locations`, county / envelope / name queries |
| `ob_ohp.py` | parses California OHP's 224-row San Francisco register |
| `ob_recpark.py` | Rec & Park property register `gtr9-ntp6` |
| `ob_nrpdf.py`, `ob_nrpdf2.py` | NPGallery nomination-PDF retrieval by reference number |
| `ob_web.py`, `ob_probe.py` | HTML-to-text fetch and URL liveness probe |

Nomination PDFs retrieved and text-extracted: `nrx_01000522.pdf` (Camera Obscura),
`nrx_81000172.pdf` (Beach Chalet), `nrx_04001137.pdf` (Golden Gate Park), `nrx_80000371.pdf`
(Fort Miley), `sutro_history.pdf` (Adolph Sutro district, nomination excerpts).
`nrx_86001014.pdf` and `nrx_76000176.pdf` are the NPS "not yet been digitized" notices.

---

## 9. PHOTOS

**Emit `"photos": []` everywhere.** Photographs are a separate wave.

For prose only: the United States has freedom of panorama for **buildings** under 17 USC 120(a). It
does not cover sculptures, murals or installed artworks. In this zone that distinction touches the
**Beach Chalet frescoes and mosaics** (C2), the **Sutro Heights lion statues and the imported
statuary** (B7, B4), the **Roald Amundsen monument** (A10), the **USS San Francisco Memorial** (B15),
the **Lands End Labyrinth** (B13) and the **Doggie Diner Sign** (E1). Every one of them may be
**written about**. **Say nothing about why any of them is or is not photographed.** Describe the
thing: the projection table is six feet across; the windmill tower is seventy-five feet tall.
