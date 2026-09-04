# Noe Valley — Finder's Research File

Zone: `noe-valley` · destination `Noe Valley, California` · town `San Francisco`
Roster draw: "24th Street, the Noe Valley Town Square, Billy Goat Hill, the Victorians of Liberty
Hill, the Noe Valley Ministry, Douglass Playground."

Compiled 2026-09-03. Everything below is candidate material for a verifier and an arbitrator.
Nothing here is an ownership ruling. Two of the six subjects named in my own roster draw turn out
not to be in Noe Valley on any locator I could find. That is the headline.

---

## 0. RESERVATION CHECK — and the tooling defect that makes the prescribed check useless

The brief says to run `python3 .superpowers/taken_slugs.py`. **It does not scan the corpus.** Its
only glob is `priv/seed_data/rome/*.json`. It loaded 1,747 Rome places and zero San Francisco ones.
Searching it for `noe`, `24th`, `douglass`, `sanchez`, `billy goat`, `liberty`, `dolores` returns
Rome rows and nothing else. The Hayes Valley finder flagged this in wave 1; it is still broken.

The check that actually works is `python3 .superpowers/vf_taken_all.py <needles…>`, which globs
`priv/seed_data/**/*.json` recursively — **4,389 places across 349 files**. Run against every name
in this file it returns:

| Needle | Corpus hits | Collision? |
|---|---|---|
| `noe` | `noe-beaver-mini-park-castro` (Castro) | No — different park, see §5 |
| `24th` | `24th-and-york-mini-park-mission-district` | No — Mission's 24th Street |
| `sanchez` | `casa-sanchez-building-mission-district` | No |
| `dolores` | 2 Castro cottages, 2 Mission places | No |
| `lyon`, `st paul`, `philip`, `bethany`, `james lick`, `martha`, `bakery`, `douglass`, `billy goat`, `clipper`, `duncan`, `portola`, `ministry`, `omnivore`, `lovejoy`, `firefly`, `drewes`, `ciccia`, `folio` | Rome / Connecticut / New York only, or none | No |

**No candidate in this file collides with any of the 468 shipped San Francisco places or the seven
reserved Oracle Park slugs.** Two Castro-owned places carry "Noe" in their name (`noe-beaver-mini-
park-castro`, `castro-farmers-market` at 270 Noe Street) — both sit at the Market Street end of Noe
Street, inside Castro/Upper Market. They are not mine and I am not asking for them.

---

## 1. HOW I ESTABLISHED WHICH ZONE EACH PLACE IS IN

Three independent locators, recorded separately so the arbitrator can see where they part.

**(a) DataSF Enterprise Addressing System — `3mea-di5p`.** Per-address, parcel-exact, carries the
city's own Analysis Neighborhood in `nhood`. This is the authoritative one.
`https://data.sfgov.org/resource/3mea-di5p.json?address_number=451&$where=upper(street_full_street_name) like 'JERSEY%'`

**(b) DataSF Analysis Neighborhoods polygon — `j2bu-swwd`,** with my own ray-casting
point-in-polygon test, for geometries with no street address (parks, landmark district shapes,
NRHP points). The Noe Valley MultiPolygon is a **single ring of 182 vertices**, bounding box
lon −122.447399 … −122.421328, lat 37.741534 … 37.756631.

**(c) Nominatim** reverse geocode at zoom 16, which returns the *vernacular* name. Its
disagreements with (a) are the most useful signal in this file.

### What the polygon actually encloses

Probing EAS along the edges:

| Probe address | DataSF `nhood` |
|---|---|
| 3800 21st Street | **Castro/Upper Market** |
| 3800 22nd Street | Noe Valley |
| 3900 22nd Street | Noe Valley |
| 1100 Dolores Street | Noe Valley |
| 900 Noe Street | Noe Valley |
| 1600 Diamond Street | Noe Valley |
| 300 30th Street | Noe Valley |
| 291 30th Street | **Glen Park** |
| 1 Grand View Terrace | **Twin Peaks** |
| 15 Liberty Street | **Mission** |
| 188 Liberty Street | **Mission** |

So the north edge falls between 21st and 22nd Streets; the east edge takes in Dolores Street; the
south edge runs through 30th Street with parcels on both sides of it landing in different zones;
the west edge stops before Grand View Terrace.

---

## 2. THE STRADDLERS — I am not resolving these

**Flagged for the arbitrator, with all eleven zones in front of it. I resolve none of them.**

### 2.1 BILLY GOAT HILL — named in my roster draw, and it is not in Noe Valley

Every locator agrees, and they agree *against* the roster:

- DataSF Rec & Park `gtr9-ntp6`, property_id 5, 294 Beacon Street, 3.6688939 acres,
  `analysis_neighborhood` = **Glen Park**.
- Point-in-polygon over the park's own shape: **0 of 224 boundary vertices** fall inside the Noe
  Valley polygon. The park's northernmost vertex is at lat 37.74211; Noe Valley's southernmost is
  37.741534, but the polygon narrows there and the park sits west of the notch.
- Nominatim reverse at (37.74141, −122.43321): neighbourhood = **Glen Park**, road = 30th Street.

This is not a close call and it is not a disagreement between sources. If Billy Goat Hill ships at
all it belongs to Glen Park, which is not one of the eleven zones. **Recommend it ships nowhere in
this wave.** I flag it rather than dropping it because it was handed to me by name.

Same picture for its neighbours: **Walter Haas Playground** (300 Addison St, 4.626 ac) and **Topaz
Open Space** (100 Topaz Way, 0.916 ac) are Glen Park on both locators, 0 vertices inside.
**George Christopher Playground** (5210 Diamond Heights Blvd) is Glen Park. **Glen Canyon Park**
(70 Elk St, 70.7 ac) is "Glen Park, West of Twin Peaks".

### 2.2 LIBERTY HILL — also named in my roster draw, also not in Noe Valley

- Article 10 landmark districts, `knm6-5ej6`: district `LIBERTY HILL`, **Appendix F**, `datelisted`
  **1985-10-25**. Point-in-polygon: **0 vertices inside Noe Valley**.
- The survey dataset `m22e-6hkz` gives Liberty Hill Historic District `neighborhood` = **Mission**,
  `a10` = **Listed**.
- National Register: **Liberty Street Historic District**, NRIS refnum **83001230**, certified
  **09/15/1983**, "Roughly 15-188 Liberty St.", 51 contributing buildings. Point at
  (−122.42325, 37.75759) — outside the Noe Valley polygon, north of its 37.756631 ceiling.
- EAS: 15 Liberty Street → Mission. 188 Liberty Street → Mission.

Liberty Hill is a Mission place. `mission.json` does not own it (69 places, no Liberty Hill row).
**It is unclaimed and it is not mine.** The arbitrator should decide whether the Mission page is
reopened for it or whether it stays unowned. Its two designations — Article 10 Appendix F listed
25 October 1985, and NRHP 83001230 listed 15 September 1983 — are the strongest unclaimed pair of
identifiers I turned up anywhere in this research.

### 2.3 PORTOLA OPEN SPACE — DataSF itself gives it two neighbourhoods

`gtr9-ntp6` property_id 37264, 0.8120188 acres, no street address, `analysis_neighborhood` =
**"Noe Valley, Twin Peaks"** — the field carries both names. My point-in-polygon: **157 of 226
boundary vertices inside Noe Valley**, 69 outside. Nominatim: Noe Valley, road = Portola Drive.
A genuine 70/30 split parcel. Twin Peaks is not one of the eleven zones.

### 2.4 LA CICCIA, 291 30th Street — the two locators disagree outright

- EAS `3mea-di5p`: 291 30TH ST → `nhood` = **Glen Park**.
- Nominatim reverse at (37.74259, −122.42663): neighbourhood = **Noe Valley**, road = Church Street.

The restaurant's own site gives "291 30th St, San Francisco, CA 94131". 30th Street is the
vernacular southern edge of Noe Valley and the official line runs through it. This is the cleanest
official-versus-colloquial split in the zone.

### 2.5 The Mission's east flank

Already owned by `mission.json`, sitting against Noe Valley's eastern boundary, listed so the
arbitrator can see the seam: `mission-folk-victorian-home-mission-district` (361 San Jose Ave,
SF Landmark No. 332), `juri-commons-mission-district` (324 San Jose Ave), `frank-edwards-house-
mission-district` (1366 Guerrero St, SF Landmark No. 189, NRHP 82000986). No conflict — noting the
edge, not contesting it.

### 2.6 Castro's "Noe"-named places

`noe-beaver-mini-park-castro` (1 Beaver St — DataSF Rec & Park confirms Castro/Upper Market) and
`castro-farmers-market` (270 Noe St). Both Castro's, both correctly assigned. Named here only so
nobody double-takes on the word "Noe".

---

## 3. DESIGNATION NUMBERS — four, all Article 10, all verified against the register

**I found four designated landmarks inside Noe Valley and I am not going to tell you how many
that is anywhere in the shipped prose.** Each is named with its number below.

Method: fetched all 370 rows of `97yj-54sx` (Landmarks Listed in Article 10 of the San Francisco
Planning Code), computed a centroid per geometry, ran point-in-polygon against the Noe Valley ring.

### 3.1 Axford House — San Francisco Landmark No. 133

- **Address:** 1190 Noe Street, at 25th Street. EAS: Noe Valley, 94114, (37.749972, −122.431957).
- **APN** 6538048. `97yj-54sx`: `landmarkno` 133, `yeardesignated` 1981.
- **Ordinance:** noehill.com gives Ordinance/Resolution **8943, 14 May 1981**. *This is a secondary
  source.* The designation PDF at
  `https://sfplanninggis.org/docs/landmarks_and_districts/LM133.pdf` is a scan of the reverse side
  of the case-report sheet — `pdftotext` yields 149 characters, all bibliography. A verifier who
  wants the ordinance number in shipped prose must get it from the Board of Supervisors, not from
  me and not from that PDF.
- **Built:** noehill gives **1877**, Stick style, with a carriage house, iron fence and a hay lift
  in the carriage-house gable. **The assessor disagrees**: `3tsw-4idn` apn 6538048 gives
  `yearbuilt` **1900**. See §7 on why the assessor's 1900s are worthless.
- **Builder:** William Axford, owner of the Mission Iron Works (noehill).
- CEQA status: `ceqacode` A, reason "Article 10 Individual Landmark, Historic Survey Result".
- Sources: `https://data.sfgov.org/resource/97yj-54sx.json?$limit=1000` ·
  `http://noehill.com/sf/landmarks/sf133.asp` ·
  `https://data.sfgov.org/resource/3tsw-4idn.json?apn=6538048`

### 3.2 David Lewis House — San Francisco Landmark No. 186

- **Address:** 4143 23rd Street, between Castro and Diamond. EAS: Noe Valley, 94114,
  (37.752591, −122.435189).
- **APN** 2804040. `97yj-54sx`: `landmarkno` 186, `yeardesignated` **1988**.
- **Date conflict to resolve before shipping:** noehill cites a Final Case Report dated
  **2 September 1987**; DataSF says designated 1988. The two are consistent only if the Board acted
  the following year. **Do not ship a designation year until one of them is confirmed against the
  ordinance.** The PDF (`LM186.pdf`) extracts to four characters — another reverse-side scan.
- **Built:** noehill gives **1892**, Queen Anne. Assessor `yearbuilt` **1910**. Conflict.
- **Owner:** David Lewis, a cabinetmaker whose firm did cabinet-making and stair-building; noehill
  states the house retains its custom cabinetry.
- CEQA: `ceqacode` A, "Article 10 Individual Landmark, California Register Historic District".
- Sources: as above, plus `http://noehill.com/sf/landmarks/sf186.asp`

### 3.3 Carnegie Noe Valley / Sally Brunn Branch Library — San Francisco Landmark No. 259

The strongest documented candidate in the zone. The designation PDF is machine-readable — 51,191
characters of ordinance and case report — so every fact below comes from the primary document.

- **Address:** 451 Jersey Street. EAS: Noe Valley, 94114, (37.750293, −122.435107).
- **Ordinance:** Board of Supervisors **File No. 080189**, "Landmark Designation of 451 Jersey
  Street (Carnegie Noe Valley/Sally Brunn Branch Library)". Passed on first reading **26 February
  2008**. The ordinance number itself OCRs as "3D-DZ" and is not legible; **use the file number, or
  confirm the ordinance number independently.**
- **Parcel:** the ordinance says **Assessor's Block 6539, Lot 034**, five times. `97yj-54sx` carries
  `apn` **"0857001A"** for this row. **The dataset's APN is wrong.** `3tsw-4idn` agrees with the
  ordinance: apn 6539034. Flagging because wave 1's reviewers found exactly this class of error.
- **Architect: John Reid, Jr.** — named in the ordinance findings ("Association with the work of a
  master architect, John Reid, Jr.") and in the DPR 523 form ("Architect: John Reid Jr.").
- **Built:** the DPR form reads "Built 1915". `3tsw-4idn` gives `yearbuilt` **1916**. Conflict; the
  DPR form is the better source.
- **Interior features named in the designation** (useful, concrete, non-superlative): the ornamental
  ceiling of the Main Reading Room; the glazed and panelled partition between the Main Reading Room
  and the Children's Room; a deck and garden at the rear.
- **National Register status:** the Landmarks Preservation Advisory Board found the building
  *eligible* under Criteria A and C. **Eligible is not listed.** It is not on the National Register
  and no NRHP claim may be made for it.
- **Current hours** (sfpl.org): Sun 1–5, Mon 11–6, Tue 10–8, Wed 12–8, Thu 10–6, Fri 1–6,
  Sat 10–6.
- Sources: `https://sfplanninggis.org/docs/landmarks_and_districts/LM259.pdf` ·
  `https://sfpl.org/locations/noe-valley` ·
  `https://data.sfgov.org/resource/3tsw-4idn.json?apn=6539034`

### 3.4 Lyon-Martin House — San Francisco Landmark No. 292

Also machine-readable — 148,051 characters, ordinance plus the full Landmark Designation Fact Sheet.

- **Address:** 651 Duncan Street. EAS: Noe Valley, 94131, (37.745392, −122.434504).
- **Ordinance No. 74-21**, Board of Supervisors **File No. 210286**, "Planning Code — Landmark
  Designation — Lyon-Martin House, 651 Duncan Street". **Assessor's Block 6604, Lot 036.**
  Both the ordinance number and the file number are legible and unambiguous — this is the cleanest
  citation in the zone.
- Initiated by Board Resolution **507-20**, adopted 20 October 2020, approved by the Mayor 30
  October 2020, which identified the property as 649-651 Duncan Street, Block 6604, Lots 036 and
  037. Recommended by Historic Preservation Commission **Resolution No. 1170**; Fact Sheet revised
  at the HPC hearing of **17 February 2021**. Planning Department Docket No. **2020-011305DES**.
- **Built:** the Fact Sheet's history section: "The first building on the 651 Duncan Street parcel
  was constructed in 1907-1908." The permit was issued to owner Charles L. Duning to build a
  "one-story cottage" costing $300, measuring **20 feet by 20 feet**, clad with rustic siding.
  The present building's footprint "appears to have been constructed sometime between 1914 and
  1938". **Architect: Unknown** — the Fact Sheet says so explicitly. Assessor `yearbuilt` 1908.
- **Period of significance: 1955 to 2020** — "the date that Phyllis Lyon and Del Martin purchased
  the property and extends through their 65-year residence at same."
- **Significance, in the ordinance's own words:** association with "the Daughters of Bilitis, the
  first lesbian-rights organization in the United States, and as the longtime home of pioneering
  lesbian-rights activists, Phyllis Lyon and Del Martin."
- Datable facts from the Fact Sheet, all sequence rather than superlative: DOB founded in San
  Francisco in 1955 by four couples including Lyon and Martin; Martin elected DOB's first president
  in 1955, national president 1957–1960, editor of *The Ladder* 1960–1962; Lyon first secretary in
  1955, editor of *The Ladder* 1956–1960; *The Ladder* began publication in 1956; Lyon and Martin
  met in Seattle in 1950.
- **Superlative caution for the writer:** "first lesbian-rights organization in the United States"
  is the ordinance's phrasing and reads as sequence, not rank. "Internationally known", which also
  appears in the Fact Sheet, does not. **The verifier should rule on the "first".**
- CEQA: `ceqacode` A, "Article 10 Individual Landmark".
- Sources: `https://sfplanninggis.org/docs/landmarks_and_districts/LM292.pdf`

### 3.5 A landmark row that is NOT a landmark

`97yj-54sx` contains rows with `landmarkno` = "0" and `yeardesignated` = "0.0" — these are
initiated-but-not-designated properties. One of them, **"Diamond Heights Safety Wall"**, has a
geometry that falls inside the Noe Valley polygon and *looks* like a landmark in a naive query.
**It carries no landmark number and no designation year. It is not designated. Do not claim it.**
(Others in this class citywide: Glide Memorial Church, Kezar Stadium, the Strand Theater, the Far
East Cafe.)

---

## 4. WHAT NOE VALLEY DOES NOT HAVE — three negative findings that matter

**(a) No National Register listing.** I queried the NPS `nrhp_locations` MapServer over the envelope
−122.452, 37.736 to −122.416, 37.762 — a box larger than the zone on all four sides — across layers
0, 1 and 2. Layer 0 returned 8 features; layers 1 and 2 returned none. **Every one of the 8 falls
outside the Noe Valley polygon**: Frank G. Edwards House (82000986), Girls Club (79000531),
John McMullen House (83001231), New Mission Theater (01001206), Mission Cultural Center (100005987),
The Women's Building (100002359), Timothy L. Pflueger House (100008228), Liberty Street Historic
District (83001230). All Mission or Castro, and all seven of the buildings are already shipped in
`mission.json`.

**No page in this zone may carry a National Register claim.**
Query: `https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0/query?geometry=-122.452,37.736,-122.416,37.762&geometryType=esriGeometryEnvelope&inSR=4326&outFields=*&f=json`

**(b) No Article 10 landmark district.** `knm6-5ej6` holds 20 rows covering appendices B through O.
Point-in-polygon against Noe Valley: **zero vertices from any district**. The nearest are Liberty
Hill (Appendix F, 1985-10-25, Mission) and Duboce Park (Appendix N, 2013-07-13).

**(c) Six "historic districts" that are eligible, not designated — the trap in this zone.**
`m22e-6hkz` returns six districts whose `neighborhood` field reads **Noe Valley**. Every one has
`a10` = No, `nr` = No, `cr` = **Eligible**:

| District | Period of significance | Origin case | Architect/builder named |
|---|---|---|---|
| 24th Street Commercial Corridor HD | 1880s–1920s | 2015-000391ENV | — |
| Diamond & Elizabeth Streets HD | 1878–1915 | Noe Valley Context / 2014-001671ENV | — |
| Noe & Alvarado Streets HD | 1885–1915 | Noe Valley Context / 2015-015050ENV | Fernando Nelson; John Anderson |
| Clipper Street HD | 1880–1914 | 2011.1354E / 2011.1345E | Bernhard Schapiro |
| 27th Street HD | 1880–1899 / 1890–1913 | 2013.1590E / 2013.1488E | Charles Monson, builder |
| Jersey Street HD | 1890–1891 | 2019-005226ENV | — |

Two discontiguous thematic districts also clip the zone: **Midcentury Recreation Historic District**
(8 vertices inside; it is why Upper Noe Rec Center carries `ceqacode` A) and the **San Francisco
1952 Firehouse Bond Act Thematic District** (11 vertices inside). Both `cr` = Eligible.

**My reading, for the verifier to overrule if it wants:** "eligible for the California Register"
names a register but supplies no identifier — no listing number, no certification date, nothing a
reader could look up. Under the rule as written ("A claim must name its register and carry an
identifier") these do not publish as designation claims. They are excellent *sources* for build
dates and builder names, which is how I have used them. **A page that says "the Jersey Street
Historic District" as though it were a designation will be wrong.**

---

## 5. PARKS AND OPEN SPACE — DataSF `gtr9-ntp6`, verified twice

Every row below was confirmed two ways: the dataset's own `analysis_neighborhood` field, and my
point-in-polygon test over the property's full `shape` geometry. The "vertices" column is the
second test.

| Place | Address | Type | Acres | Sq ft | property_id | `analysis_neighborhood` | Vertices inside |
|---|---|---|---|---|---|---|---|
| **Noe Valley Town Square** | 3861 24th Street | Mini Park | 0.27605287 | 12,024.91 | 957227 | Noe Valley | 14/14 |
| **Douglass Playground** | 1098 Douglass Street | Neighborhood Park or Playground | 7.88730383 | 343,572.33 | 8 | Noe Valley | 420/420 |
| **Upper Noe Recreation Center** | 295 Day Street | Neighborhood Park or Playground | 2.91807067 | 127,111.67 | 22 | Noe Valley | 193/193 |
| **Noe Valley Courts** | 780 Douglass Street | Neighborhood Park or Playground | 1.10423261 | 48,100.56 | 72 | Noe Valley | 32/32 |
| **Duncan & Castro Open Space** | 592 Duncan Street | Neighborhood Park or Playground | 0.65081602 | 28,349.66 | 178 | Noe Valley | 23/23 |
| **29th & Diamond Open Space** | 1701 Diamond Street | Neighborhood Park or Playground | 0.93141186 | 40,572.46 | 194 | Noe Valley | 104/104 |
| **Clipper Terrace Community Garden** | 855 Clipper Terrace | Community Garden | 0.46778950 | 20,376.99 | 135193 | Noe Valley | 227/227 |
| **Portola Open Space** | *none recorded* | Neighborhood Park or Playground | 0.81201880 | 35,371.68 | 37264 | **Noe Valley, Twin Peaks** | **157/226** |

All eight are `ownership` = Recreation & Park except **Clipper Terrace Community Garden, which
`gtr9-ntp6` records as owned by Public Works** — worth a sentence, and worth not calling it a
Rec & Park property.

Notes for whoever writes these:
- **Noe Valley Town Square** parcel APN 6509040, `3tsw-4idn` `yearbuilt` 1960, `ceqacode` B. Its
  zoning in `acdm-wktn` is **P (Public)** — the only P parcel on 24th Street in the zone. The Noe
  Valley Association runs programming there "in coordination with the San Francisco Recreation and
  Parks Department" (noevalleytownsquare.com); the site's mailing address is 4104 24th Street.
- **Upper Noe Recreation Center** building `yearbuilt` **1957**, APN 6638007, `ceqacode` A,
  reason "California Register Historic District" — i.e. the Midcentury Recreation district in §4(c).
- **Douglass Playground** is the largest single Rec & Park holding wholly inside the zone at
  343,572.33 square feet. Give the measurement, not a ranking.
- Sources: `https://data.sfgov.org/resource/gtr9-ntp6.json?$limit=3000`

---

## 6. PUBLIC ART — three accessioned works and one mural, all with identifiers

From the Civic Art Collection `r7bn-7v9c`, 1,038 rows, 11 falling inside the Noe Valley polygon
(the eleven are six catalogue entries for one commission plus the summary rows).

**"Garden Guardians"** — Wowhaus, 2016, **bronze**, accession **2017.2.a-b** (individual elements
2017.2.a at 36 × 24 × 16 in. and 2017.2.b at 28 × 18 × 12 in.). Facility: Noe Valley Town Square,
3861 24th Street. Credit line: "Collection of the City and County of San Francisco."

**"Noe Valley Natives"** — Troy Corliss, 2008, **stainless steel and glass** (individual pieces
catalogued as "forged and fabricated steel"), accession **2008.13.1-6**, six elements at the park
and playground entrances of the Upper Noe Recreation Center, 295 Day Street. Element dimensions:
2008.13.1 is 66 × 30 × 36 in.; .2 is 60 × 36 × 36 in.; .3 is 108 × 51 × 51 in.; .4 is 36 × 18 × 24
in.; .5 is 60 × 36 × 30 in.; .6 is 15 × 7 × 6 in. Credit line: commissioned by the San Francisco
Arts Commission for the Upper Noe Recreation Center.

**"Outdoor Wall Mosaic"** — Lois Anderson, 1988, accession **1988.3**, **36½ × 32 × 2½ inches**,
medium "Tiles, glass, metal, buttons, jewelry on fiber-glassed plywood", on the exterior of the
Douglass Playground Fieldhouse at Douglass Street and 26th Street. Commissioned by the San
Francisco Arts Commission for the fieldhouse.

**StreetSmArts mural**, 4049 24th Street — artist **Shawn Bullen**, year **2014/15**, dataset
`wg8w-68vc`, `analysis_neighborhood` Noe Valley, supervisor district 08. No title recorded.

All four are sculptures or murals rather than buildings. Describe them by material and measurement.

Sources: `https://data.sfgov.org/resource/r7bn-7v9c.json?$limit=6000` ·
`https://data.sfgov.org/resource/wg8w-68vc.json?$limit=3000`

---

## 7. BUILD DATES — a warning before anyone uses the assessor

`3tsw-4idn` ("Historic Resource Status by Parcel") carries a `yearbuilt` field, and it is tempting
because it is per-parcel and citable. **It reports exactly 1900 for a great many Noe Valley
parcels**, including two of the four landmarks whose real dates are known to be 1877 and 1892. 1900
is a placeholder for "before the records start", not a construction date.

Parcels reading exactly 1900 in my sample: 1190 Noe (Axford, actually 1877), 3885 Cesar Chavez,
1351 Church, 3893 24th, 4288 24th, 1199 Church, 1300 Church, 1550 Church, 1706 Church, 3961 24th,
3870 24th, 1201 Sanchez, 1500 Church.

**Rule I would apply: use `yearbuilt` only when it is not 1900.** The non-1900 values look real and
several are corroborated:

| Address | `yearbuilt` | APN | `ceqacode` / reason |
|---|---|---|---|
| 1021 Sanchez St (Noe Valley Ministry) | **1880** | 3652033 | A — Historic Resource Evaluation Response |
| 651 Duncan St (Lyon-Martin) | 1908 | 6604036 | A — Article 10 Individual Landmark |
| 221 Valley St (St Paul's Church) | **1909** | 6619031 | A — Historic Survey Result |
| 4143 23rd St (David Lewis House) | 1910 | 2804040 | A — Article 10 Individual Landmark, Cal Register HD |
| 4001 24th St | 1912 | 6507001 | A — Historic Survey Result |
| 725 Diamond St (St Philip the Apostle) | **1913** | 2831022 | A — California Register Historic District |
| 1690 Church St (St Paul's School) | **1914** | — | B — no evaluation and 45 years or older |
| 451 Jersey St (library) | 1916 | 6539034 | A — Article 10 Individual Landmark |
| 4104 24th St | 1917 | — | C — Historic Survey Result |
| 625 Douglass St (Alvarado Elementary) | **1924** | — | B — Historic Survey Result and 45 years or older |
| 1101 Church St | 1926 | — | B |
| 3957 24th St | 1926 | 6508031A | C — Historic Survey Result |
| 1220 Noe St (James Lick Middle School) | **1934** | — | B — no evaluation and 45 years or older |
| 100 30th St | 1955 | — | B |
| 295 Day St (Upper Noe Rec Center) | 1957 | 6638007 | A — California Register Historic District |
| 3861 24th St (Town Square) | 1960 | 6509040 | B |
| 4073 24th St (Noe Valley Bakery building) | 1902 | 6507020 | A — Cal Register HD, Historic Survey Result |
| 3979 24th St | 1904 | — | C — Historic Survey Result |
| 1050 Sanchez St | 1907 | 3654001 | B — Historic Survey Result and 45 years or older |
| 1798 Church St | 1908 | — | C — Historic Survey Result |
| 300 30th St | 1908 | — | C — Historic Survey Result |
| 100 Clipper St | 1908 | 6549004 | C — Historic Survey Result |
| 1399 Church St | 1910 | — | B |
| 4054 24th St | 1911 | — | C — Historic Survey Result |
| 1000 Diamond St | 1910 | — | A — California Register Historic District |
| 1435 Church St | 1923 | 6566023 | B |

Source: `https://data.sfgov.org/resource/3tsw-4idn.json?apn=<apn>`

---

## 8. INSTITUTIONS

### 8.1 Noe Valley Ministry / Noe Valley Church — 1021 Sanchez Street

Named in the roster draw and it *is* in Noe Valley (EAS: Noe Valley, 94114, 37.752824,
−122.429429). APN 3652033, `yearbuilt` **1880**, `ceqacode` **A**, reason "Historic Resource
Evaluation Response" — meaning Planning has evaluated it and found it a historic resource. **It is
not an Article 10 landmark; it does not appear in `97yj-54sx`.** No designation claim available.

Facts from the church's own site (`noevalleyministry.org/space-rental` and `/home`), which
establishes identity, location and facilities:
- Sanctuary seats **110**. Sanctuary and Labyrinth Hall combined measure **2,941 square feet** and
  hold 200 with auditorium seating or 80 at banquet tables. Labyrinth Hall alone holds 40.
- The sanctuary has "stained glass window and elevated stage with a Steinway D concert grand."
- Other rooms: a conference room of **156 square feet** (8–10 people); a meditation room of **106
  square feet** (6 people); a library/mezzanine of **298 square feet** (15 people) that opens to
  the sanctuary. A kitchen that is not commercial-grade.
- Phone (415) 282-2317. It describes itself as "a neighborhood church in the heart of a vibrant
  city."
- **The site does not state the denomination, a founding year, an architect, or a construction
  date.** I could not reach a history page — `/about`, `/about-us/our-history/` and `/about` all
  404, and the sitemap lists only nine pages, none historical. **Anything about 1888, which is the
  date commonly repeated for this building, is unsourced as far as this file is concerned.**

**Noe Music** (formerly Noe Valley Chamber Music) presents concerts at **1021 Sanchez Street, San
Francisco, CA 94114**; phone (415) 648-5236 (`noemusic.org/about`). It is a distinct organisation
from the church and could be a separate candidate or a paragraph inside the church's page — the
arbitrator's call, not mine.

### 8.2 Noe Valley / Sally Brunn Branch Library — 451 Jersey Street

See §3.3. SF Landmark No. 259. Architect John Reid, Jr. Hours from sfpl.org.

### 8.3 St Paul's Catholic Church — 221 Valley Street

EAS: Noe Valley, 94131, (37.744192, −122.427742). APN 6619031, `yearbuilt` **1909**, `ceqacode`
**A**, reason "Historic Survey Result". Not an Article 10 landmark.
**Confidence problem:** the parish's own domain `stpaulsf.net` 301-redirects to the *school's*
site, so I have no page from the parish itself. The church is well known as the location used in
a 1992 feature film; **I could not source that from any primary or institutional page and I am not
asserting it.** A verifier chasing this should look for the parish's own site under a different
domain.

### 8.4 St Paul's School — 1690 Church Street

EAS: Noe Valley. `yearbuilt` **1914**. From `stpaulschoolsf.org/about-us`: the school is "at 29th
and Church Streets in San Francisco's Noe Valley neighborhood" — **the institution places itself in
the zone in its own words**, which is the cleanest kind of boundary evidence in this file. Nine
regular classrooms, one per grade K–8, plus art, science, extended care, a technology/library
centre and a gym/parish centre.

### 8.5 St Philip the Apostle — 725 Diamond Street

EAS: Noe Valley, 94114, (37.751632, −122.436017). APN 2831022, `yearbuilt` **1913**, `ceqacode`
**A**, reason "California Register Historic District" — it is a contributor to one of the eligible
districts in §4(c), not a designated landmark. I did not reach its own site.

### 8.6 Bethany United Methodist Church — 1268 Sanchez Street

EAS: Noe Valley, 94114, (37.748803, −122.429528). **EAS returned no `parcel_number` for this
address, so I have no `yearbuilt` and no CEQA status, and I did not fetch the church's own site.**
This is one of my least confident candidates. Real building, real address, almost no sourced fact.

### 8.7 James Lick Middle School — 1220 Noe Street

EAS: Noe Valley. `yearbuilt` **1934**, `ceqacode` B ("No evaluation and 45 years or older"). The
building is well known for New Deal–era interior murals; **I could not source the artist, the
programme or the date — `jameslick.org` does not resolve and I had no web-search budget left.**
Candidate, but everything interesting about it is currently unsourced.

### 8.8 Alvarado Elementary School — 625 Douglass Street

EAS: Noe Valley. `yearbuilt` **1924**, `ceqacode` B, reason "Historic Survey Result and 45 years or
older". Same problem: the school's association with Ruth Asawa and the Alvarado Arts Workshop is
the reason a guide would write about it, and I have no source for it in this file.

---

## 9. 24TH STREET — the commercial spine

### 9.1 The street as a place

**Zoning is the one hard identifier here.** `acdm-wktn` returns **204 parcels on 24th Street inside
Noe Valley zoned NCD, district name "24TH STREET- NOE VALLEY NEIGHBORHOOD COMMERCIAL"** — a named
Planning Code district. Other 24th Street parcels in the zone: 103 RH-2, 17 RM-1, 5 RH-3, 3 NC-1
(4288-4298, 4291-4299 and 4301, at the Douglass end) and 1 P (the Town Square, 3861-3865).

The **24th Street Commercial Corridor Historic District** (§4(c)) is California-Register *eligible*,
period of significance 1880s–1920s, case 2015-000391ENV. Not a designation.

EAS confirms the whole corridor as Noe Valley: 3854, 3861, 3870, 3893, 3906, 3927, 3957, 3961,
3966, 3979, 4001, 4045, 4054, 4073, 4104 and 4288 24th Street all return `nhood` = Noe Valley.

Source: `https://data.sfgov.org/resource/acdm-wktn.json?$limit=6000&$where=upper(street_name)='24TH'`

### 9.2 Businesses with facts I could actually source

Each below is confirmed in Noe Valley by EAS. **A founding year taken from an operator's own site
is a trading-duration claim and does not publish** — I record them so the verifier can see what I
deliberately did not turn into prose.

**Noe Valley Bakery** — 4073 24th Street, 94114. Building `yearbuilt` 1902, APN 6507020.
Weekdays 07:00–19:00, weekends 07:00–18:00. Sells cakes, cupcakes, cookies, breakfast pastries,
bread, desserts, pies and lunch items. A second location at 28 W Portal Ave is outside the zone.
Its site claims **San Francisco Legacy Business status** — *that is a real register with numbered
applications, and I could not verify it.* The Legacy Business Registry is not on DataSF (I searched
the Socrata catalogue for "legacy", "business registry" and "small business" — no such dataset),
`sfosb.org/legacy-business-registry-listings` 301s to a generic sf.gov department page, and
`sf.gov/legacy-business-registry` 404s. **A verifier with search budget should chase the registry
number; with one, this becomes a designation claim.** Its "Since 1995" line does not publish.
Source: `https://www.noevalleybakery.com/`

**Omnivore Books on Food** — 3885A Cesar Chavez Street, 94131. EAS: Noe Valley (both 3885 and
3885 A return Noe Valley). Building `yearbuilt` 1900, APN 6578030, `ceqacode` C. New and vintage
books on food and drink; also vintage menus, risographs, aprons and kitchen moulds. Mon–Sat
11:00–18:00, Sun 12:00–17:00, (415) 282-4712. Occupies a former butcher shop. Founded by Celia
Sack, a former rare-book specialist. **"The Bay Area's only dedicated culinary bookshop" is a
superlative from the shop's own copy and must not be reproduced. "Founder … established the shop in
2008" is a trading-duration claim and must not be reproduced.**
Source: `https://omnivorebooks.myshopify.com/pages/about-us`

**Lovejoy's Tea Room** — 1351 Church Street, 94114. Building `yearbuilt` 1900, APN 6551027A.
"Open Thursday ~ Sunday; 11~5pm (our last seating 3pm)". Reservations by phone (415) 648-5895 or
online; walk-ups welcome; indoor and outdoor dining. Mismatched vintage china and furnishings,
handmade tea cosies. Serves scones, tea sandwiches and pots of tea.
Source: `https://www.lovejoystearoom.com/`

**Firefly** — 4288 24th Street, 94114. Building `yearbuilt` 1900, APN 2830025. "Tuesday - Saturday
5:30 to 8:30pm". The site does not state a cuisine.
Source: `https://www.fireflysf.com/`

**Drewes Bros. Meats** — 1706 Church Street. EAS: **Noe Valley**. Building `yearbuilt` 1900,
`ceqacode` C. Mon–Fri 09:30–19:30, Sat 09:00–18:30, Sun 10:00–18:00. A full-service butcher.
**"Providing quality, all natural, free-range meats for over 100 years" is a trading-duration claim
from the shop's own site and does not publish.**
Source: `https://www.drewesbros.com/`

**La Ciccia** — 291 30th Street, 94131. **STRADDLER, see §2.4** — EAS says Glen Park, Nominatim says
Noe Valley. Sardinian cooking; Tue–Thu 17:30–21:45, Fri–Sat 17:30–22:00, closed Sun–Mon.
Source: `https://www.laciccia.com/`

**Martha & Bros Coffee** — the company's own site lists locations named "Noe Valley #1", "Bernal
Heights" and "Noe Valley #2" but **gives no addresses and no hours on the page I could reach.**
Two Noe Valley shops exist by the operator's own naming; I cannot place either on a parcel.
Source: `https://www.marthabros.com/`

### 9.3 Candidates I could not stand up — listed so nobody re-does the work

- **Charlie's Corner** (children's bookshop, 4102 24th Street): `charliescorner.com` 307-redirects
  to a GoDaddy for-sale parking page. **Almost certainly closed. Do not ship.**
- **Folio Books**, 3957 24th Street: `foliosf.com` returns HTTP 403. Building `yearbuilt` 1926,
  APN 6508031A. Address confirmed Noe Valley by EAS; nothing else confirmed.
- **Just For Fun**, 3961 24th Street: EAS Noe Valley, building `yearbuilt` 1900, `ceqacode` C.
  No site fetched. Trading status unknown.
- **Noe Valley Voice** (neighbourhood newspaper): `noevalleyvoice.com` serves only a "Redirecting…"
  stub to the fetcher. It would be a good secondary source for the whole zone; someone with a
  working fetch of it will find more than I did.

---

## 10. FULL CANDIDATE ROSTER

**Forty-two candidates.** Zone column: NV = Noe Valley on both locators; ✱ = straddler flagged in
§2 and not resolved here.

| # | Candidate | Kind | Address | Zone | Strongest identifier |
|---|---|---|---|---|---|
| 1 | Axford House | house | 1190 Noe St | NV | SF Landmark No. 133 |
| 2 | David Lewis House | house | 4143 23rd St | NV | SF Landmark No. 186 |
| 3 | Carnegie Noe Valley / Sally Brunn Branch Library | library | 451 Jersey St | NV | SF Landmark No. 259; File 080189 |
| 4 | Lyon-Martin House | house | 651 Duncan St | NV | SF Landmark No. 292; Ordinance 74-21 |
| 5 | Noe Valley Town Square | park | 3861 24th St | NV | Rec&Park property_id 957227 |
| 6 | Douglass Playground | park | 1098 Douglass St | NV | property_id 8; 343,572.33 sq ft |
| 7 | Upper Noe Recreation Center | rec centre | 295 Day St | NV | property_id 22; built 1957 |
| 8 | Noe Valley Courts | park | 780 Douglass St | NV | property_id 72 |
| 9 | Duncan & Castro Open Space | open space | 592 Duncan St | NV | property_id 178 |
| 10 | 29th & Diamond Open Space | open space | 1701 Diamond St | NV | property_id 194 |
| 11 | Clipper Terrace Community Garden | garden | 855 Clipper Terrace | NV | property_id 135193; Public Works |
| 12 | Portola Open Space | open space | — | ✱ | property_id 37264; 157/226 in NV |
| 13 | "Garden Guardians" (Wowhaus) | sculpture | 3861 24th St | NV | accession 2017.2.a-b |
| 14 | "Noe Valley Natives" (Troy Corliss) | sculpture | 295 Day St | NV | accession 2008.13.1-6 |
| 15 | "Outdoor Wall Mosaic" (Lois Anderson) | mosaic | Douglass & 26th | NV | accession 1988.3 |
| 16 | StreetSmArts mural (Shawn Bullen) | mural | 4049 24th St | NV | `wg8w-68vc`, 2014/15 |
| 17 | Noe Valley Ministry / Noe Valley Church | church | 1021 Sanchez St | NV | APN 3652033; built 1880 |
| 18 | Noe Music | concert series | 1021 Sanchez St | NV | own site |
| 19 | St Paul's Catholic Church | church | 221 Valley St | NV | APN 6619031; built 1909 |
| 20 | St Paul's School | school | 1690 Church St | NV | built 1914; self-placed in NV |
| 21 | St Philip the Apostle | church | 725 Diamond St | NV | APN 2831022; built 1913 |
| 22 | Bethany United Methodist Church | church | 1268 Sanchez St | NV | EAS only |
| 23 | James Lick Middle School | school | 1220 Noe St | NV | built 1934 |
| 24 | Alvarado Elementary School | school | 625 Douglass St | NV | built 1924 |
| 25 | 24th Street–Noe Valley Neighborhood Commercial District | street | 24th St | NV | Planning Code NCD; 204 parcels |
| 26 | Noe Valley Bakery | bakery | 4073 24th St | NV | building 1902; Legacy status unverified |
| 27 | Omnivore Books on Food | bookshop | 3885A Cesar Chavez St | NV | EAS; APN 6578030 |
| 28 | Lovejoy's Tea Room | tea room | 1351 Church St | NV | APN 6551027A |
| 29 | Firefly | restaurant | 4288 24th St | NV | APN 2830025 |
| 30 | Drewes Bros. Meats | butcher | 1706 Church St | NV | EAS |
| 31 | La Ciccia | restaurant | 291 30th St | ✱ | EAS Glen Park / Nominatim NV |
| 32 | Martha & Bros Coffee (Noe Valley) | café | — | NV? | own site names two NV shops, no addresses |
| 33 | Folio Books | bookshop | 3957 24th St | NV | EAS; site 403 |
| 34 | Just For Fun | gift shop | 3961 24th St | NV | EAS only |
| 35 | 24th Street Commercial Corridor HD | eligible district | 24th St | NV | Cal Register eligible, 2015-000391ENV |
| 36 | Diamond & Elizabeth Streets HD | eligible district | — | NV | 2014-001671ENV; 1878–1915 |
| 37 | Noe & Alvarado Streets HD | eligible district | — | NV | 2015-015050ENV; Fernando Nelson |
| 38 | Clipper Street HD | eligible district | — | NV | 2011.1354E; Bernhard Schapiro |
| 39 | 27th Street HD | eligible district | — | NV | 2013.1590E; Charles Monson |
| 40 | Jersey Street HD | eligible district | — | NV | 2019-005226ENV; 1890–1891 |
| 41 | **Billy Goat Hill** | park | 294 Beacon St | ✱ | **Glen Park on all three locators** |
| 42 | **Liberty Hill Historic District** | district | Liberty St | ✱ | **Mission; A10 App. F 1985-10-25; NRHP 83001230** |

Candidates 35–40 are almost certainly *material* for other pages rather than pages of their own, and
under my reading of the designation rule (§4c) they cannot carry a protection claim at all.

---

## 11. RULE-COMPLIANCE NOTES FOR THE WRITER

- **Do not count anything.** There are four landmark numbers and six eligible districts in this
  file. Neither number goes in the prose. Name the buildings; cite the numbers.
- **No National Register claim anywhere in this zone** (§4a). The library is *eligible*, which is
  not listed.
- **No Article 10 district claim anywhere in this zone** (§4b).
- The eligible-district rows are build-date sources, not designations (§4c).
- Candidates 13–16 are sculptures, mosaics and a mural. Describe material and measurement. Say
  nothing about photographs or why there are none.
- Watch these superlatives already sitting in my sources: "the Bay Area's only dedicated culinary
  bookshop" (Omnivore's own copy); "internationally known" (LM292 Fact Sheet); "world-class",
  "internationally acclaimed" (Noe Music). All must be dropped.
- Watch these trading-duration claims: "Since 1995" (Noe Valley Bakery), "over 100 years" (Drewes
  Bros.), "established the shop in 2008" (Omnivore). All from operators' own sites. None publish.
- The assessor's `yearbuilt` = 1900 is a placeholder, not a date (§7).

---

## 12. MY THREE LEAST CONFIDENT CANDIDATES

1. **Bethany United Methodist Church (1268 Sanchez Street).** EAS puts it in Noe Valley and that is
   the entire evidentiary record. No parcel number came back, so no build year, no CEQA status; I
   fetched no site. It is a real church at a real address and I know nothing else about it.
2. **James Lick Middle School (1220 Noe Street) and Alvarado Elementary (625 Douglass Street).**
   Both firmly in the zone with sourced build years (1934, 1924). But the reason a travel guide
   would write about either — Lick's New Deal murals, Alvarado's Ruth Asawa arts workshop — is
   entirely unsourced in this file. Ship them on the build year alone or not at all.
3. **The 1877 and 1892 build dates for Landmarks 133 and 186.** Both come from `noehill.com`, a
   secondary. Both designation PDFs are scans of the reverse sides of their case-report sheets
   (149 characters and 4 characters of extractable text). The assessor contradicts both. And LM186
   has a live date conflict — DataSF says designated 1988, noehill cites a Final Case Report of
   2 September 1987. **Wave 1's reviewers found one wrong certification date by re-fetching. This is
   where the next one is.**
