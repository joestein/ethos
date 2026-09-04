# Inner Sunset — finder's report

Zone: `inner-sunset`, San Francisco, California. Research run 2026-09-03.

Every fact below carries the URL it came from. **Nothing in this file is
reader-facing prose.** The provenance arguments, the boundary arithmetic and the
"we could not confirm X" notes live here by design; the gate at
`test/ethos/seeds/san_francisco_seed_data_test.exs` bans that register from the
page itself.

**61 candidates. 9 designation identifiers across 8 distinct properties** — four
Article 10 landmark numbers, four Legacy Business Registry nomination numbers,
and one California Register *eligibility* finding that is **not** a designation
and must not be written as one. **Zero National Register listings.** My
judgement: **town-page, not a guide.** Reasoning in §7.

---

## 0. Housekeeping — the taken-slug script, again

`python3 .superpowers/taken_slugs.py` globs `priv/seed_data/rome/*.json` only. It
reports "0 places already owned" for *every* San Francisco term, which is false
and dangerous. The Haight-Ashbury finder flagged this in wave 1 and it has not
been fixed. I used `.superpowers/vf_taken_all.py`, which walks
`priv/seed_data/**/*.json` (4,389 places across 349 files).

**Result: no candidate in this report collides with a committed slug.** The only
name-fragment hits for "sunset" and "irving" are in Brooklyn (`sunset-park.json`),
Connecticut (`sunset-meadow-vineyards`), Bushwick (`irving-square-park`), Gramercy
(`irving-plaza`) and Union Square (`irving-farm-new-york`). None is in California.

I also checked the twelve shipped San Francisco files for anything sitting inside
the Inner Sunset polygon. Five Haight-Ashbury places matched on street-name
fragments — `mauds-cole-street-haight-ashbury` (937 Cole), `grattan-playground-haight-ashbury`,
`stanyan-park-hotel-haight-ashbury` (750 Stanyan), `park-emergency-hospital-haight-ashbury`,
`mount-olympus-haight-ashbury`. I ran all five through the polygon test: Maud's,
Cole Hardware and Grattan Playground fall in **Haight Ashbury**; the Stanyan Park
Hotel and Park Emergency Hospital fall in **Golden Gate Park**. **None is inside
Inner Sunset.** No collision.

---

## 1. THE BOUNDARY PROBLEM — this dominates the zone

Inner Sunset has **three** boundary definitions in wide use and they disagree
about most of the interesting places. This is not a nuance. It decides ownership
of Mount Sutro, the whole UCSF campus, Grand View Park and the Moraga Steps.

### Definition A — DataSF Analysis Neighborhood "Inner Sunset" (`j2bu-swwd`)

Verified live, 41 rows, real geometry. Computed bounding box from the polygon:
longitude **−122.47731 to −122.44634**, latitude **37.74865 to 37.76637**.
<https://data.sfgov.org/resource/j2bu-swwd.json>

This is the **largest** of the three. Its eastern edge runs past Stanyan Street
into the lower slopes below Cole Valley; it swallows Parnassus Heights, Forest
Knolls, the Interior Greenbelt, Tank Hill, the Clarendon Avenue frontage, all of
Golden Gate Heights, and the northern lip of Forest Hill.

Note the wave-1 warning still holds: `p5b7-5n3h`, also titled "Analysis
Neighborhoods", is a stub. Use `j2bu-swwd`.

### Definition B — DataSF "SF Find Neighborhoods" (`gfpk-269f`), 117 polygons

<https://data.sfgov.org/resource/gfpk-269f.json>

This dataset **splits Definition A into six named neighborhoods**, and Inner
Sunset is only one of them. Point-in-polygon results, computed:

| place | Analysis nhood (A) | SF Find (B) |
|---|---|---|
| Old Fire House, 1348 10th Ave | Inner Sunset | **Inner Sunset** |
| Sunset Branch Library, 1301 18th Ave | Inner Sunset | **Inner Sunset** |
| Doelger Building, 320 Judah St | Inner Sunset | **Inner Sunset** |
| 9th Ave & Irving St | Inner Sunset | **Inner Sunset** |
| St. Anne of the Sunset, 850 Judah St | Inner Sunset | **Inner Sunset** |
| UC Hall, 533 Parnassus Ave | Inner Sunset | **Parnassus Heights** |
| UCSF Medical Center, 505 Parnassus Ave | Inner Sunset | **Parnassus Heights** |
| Mount Sutro summit | Inner Sunset | **Parnassus Heights** |
| Interior Greenbelt centroid | Inner Sunset | **Parnassus Heights** |
| Grand View Park | Inner Sunset | **Golden Gate Heights** |
| 16th Avenue Tiled Steps | Inner Sunset | **Golden Gate Heights** |
| Golden Gate Heights Park | Inner Sunset | **Golden Gate Heights** |
| White Crane Springs garden, 1620 7th Ave | Inner Sunset | **Forest Knolls** |
| J.P. Murphy Playground, 1960 9th Ave | Inner Sunset | **Forest Hill** |
| Tank Hill | Inner Sunset | **Ashbury Heights** |
| 2 Clarendon Ave | Inner Sunset | **Ashbury Heights** |
| Sutro Tower | **Twin Peaks** | **Clarendon Heights** |
| Kezar Stadium / Kezar Pavilion | **Golden Gate Park** | **Golden Gate Park** |

### Definition C — the vernacular

Wikipedia, quoted exactly: *"The Inner Sunset is bordered by Lincoln Way to the
north, 2nd Ave to the east, Quintara Street to the south, and 19th Avenue to the
west."* It also places the commercial corridor *"along Irving Street from 5th to
12th Avenues, and along 9th Avenue from Lincoln Way to Judah Street."*
<https://en.wikipedia.org/wiki/Inner_Sunset,_San_Francisco>

The numbered-avenue grid puts 2nd Avenue at roughly longitude −122.4585
(interpolating from 9th Ave at −122.4662 and 18th Ave at −122.4761, ≈0.0011° per
avenue). **UCSF Parnassus (−122.4574) and Mount Sutro (−122.4572) are east of
that line.** Under Definition C the university and the mountain are *outside* the
Inner Sunset entirely. Definition C is also the only one that puts Grand View
Park and the Moraga Steps *inside* Inner Sunset without qualification, since
Golden Gate Heights sits between 12th and 19th Avenues.

### Definition D — the Western Neighborhoods Project

WNP treats these as sibling districts, not parent and child: the Sunset District
*"encompasses Golden Gate Heights, Inner Sunset, Outer Sunset, Parkside, and
Parnassus Heights."* <https://www.outsidelands.org/sunset.php> This corroborates
Definition B and contradicts Definition A.

**I have resolved none of these.** Every affected candidate is flagged in §6.

### A note on reverse geocoding

The brief's warning about Nominatim is correct and I re-confirmed it. Nominatim's
`display_name` neighborhood field called 533 Parnassus Avenue "Haight-Ashbury",
called 2041 12th Avenue "Inner Parkside", called 1620 7th Avenue "Forest Knolls",
and appended "Richmond District" to roughly two dozen Inner Sunset addresses that
are two miles from the Richmond. **Its coordinates are fine; its neighborhood
field is not.** I used it for lat/lon only and did every zone assignment against
the DataSF polygons.

---

## 2. DESIGNATION-BACKED CANDIDATES

### 2.1 Article 10 landmarks — four, all verified live

Retrieved from `97yj-54sx` (Landmarks Listed in Article 10 of the Planning Code,
370 rows) and cross-read against `rzic-39gi` (Landmarks, 362 rows, carries
architect / style / year built / criteria). Both fetched fresh and both agree on
number, address and year for all four.
<https://data.sfgov.org/resource/97yj-54sx.json> ·
<https://data.sfgov.org/resource/rzic-39gi.json>

I did **not** tally them anywhere in prose, per the standing rule. They are named
individually below and the writer must do the same.

---

**Old Fire House** (SF Planning name; the parcel is Engine Company 22's old
quarters)
- **1348 10th Avenue**, APN 1764/031
- **San Francisco Landmark No. 29, designated 1970.**
- Built **1898**. Property type "Government". Style recorded as *"Altered
  Shingle"*.
- Criteria 1 (events) and 3 (architecture). Context recorded as *"Gold Rush to
  Earthquake; Reconstruction Era; Gov. & Infrastructure: Muni & Fed, fire
  stations; Events: 1906 Fire & Burn Areas"*.
- Status: Adopted.
- Designation ordinance PDF:
  <https://sfplanninggis.org/docs/landmarks_and_districts/LM29.pdf>
- Parcel record: <https://sfplanninggis.org/pim?search=1764/031>
- Zone: Inner Sunset under **all three** definitions. Safe.
- **Gap:** SF Planning's `description` field is empty for this record and the
  designation PDF is a scan I could not extract text from. I have a number, an
  address, a year built and a year designated, and nothing about what the
  building is used for today. A verifier should establish present use before the
  writer describes it as anything.

---

**Sunset Branch Library**
- **1301–1305 18th Avenue** (SFPL gives the mailing address as **1305 18th
  Avenue, San Francisco, CA 94122**), APN 1773/001
- **San Francisco Landmark No. 239, designated 2004.**
- Built **1917**; **opened 25 March 1918**; *"the eighth branch in the San
  Francisco Public Library system"*; cost **$43,955**; *"designed by architect
  G. Albert Lansburgh."*
- Style recorded by SF Planning as **Italian Renaissance**. Criteria 1 and 3.
  Context: *"Government, Planning, & Infrastructure: Municipal & Federal
  Buildings, Carnegie Libraries"*.
- Seismic retrofit begun 1992. *"In September of 2005 it became the third branch
  to be renovated under the Branch Library Improvement Program. The branch
  reopened in March 2007."*
- Hours, from SFPL: Sunday 1–5; Monday–Thursday 10–6 or 10–8; Friday 1–6;
  Saturday 10–6. Phone 415-355-2808.
- <https://sfpl.org/locations/sunset> ·
  <https://sfpl.org/locations/sunset/sunset-library-history> ·
  <https://sfplanninggis.org/docs/landmarks_and_districts/LM239.pdf>
- Zone: Inner Sunset under A and B; inside Definition C (east of 19th Ave). Safe.
- **Caution for the writer:** "the eighth branch" is a *sequence*, which the rules
  allow. "The Carnegie library" is not a claim I sourced — SFPL's history page
  gives the construction cost but I did **not** find a page stating the Carnegie
  grant amount, and SF Planning's context string is the only place the word
  "Carnegie" appears. Do not write a grant figure. The $43,955 is a *cost*.

---

**Doelger Building**
- **320–326 Judah Street**, APN 1762/020
- **San Francisco Landmark No. 265, designated 2013.**
- Built **1932**. Architect **Charles O. Clausen**, builder **Henry Doelger Inc.**
  Styles: **Art Deco; Streamline Moderne**. Criteria 1, 2 and 3; significant
  person **Henry Doelger**.
- SF Planning's own description: *"Built in 1932, the Doelger Building merges Art
  Deco and Streamline Moderne styles in its stepped tower entrance, glass block
  windows, and speedline canopy. It was headquarters for Henry Doelger Builder
  Inc., a firm that transformed the Sunset District from windswept sand dunes to
  a neighborhood of mass constructed houses for the working and middle classes."*
- <https://sfplanninggis.org/docs/landmarks_and_districts/LM265.pdf> ·
  <https://sfplanninggis.org/pim?search=1762/020>
- Zone: Inner Sunset under all three. Safe.
- **Rules note:** SF Planning's own text calls Doelger *"the poor man's Frank
  Lloyd Wright"* and *"a master builder"*. Both are superlatives-by-attribution
  and are banned from the page regardless of the source. The stepped tower, the
  glass block and the speedline canopy are describable objects and are the way in.

---

**"History of Medicine in California" Frescoes at UC Hall**
- **533 Parnassus Avenue**, APN 2634A/011
- **San Francisco Landmark No. 289, designated 2020.**
- Painted **1936–1938** by **Bernard Zakheim** with assistant **Phyllis
  Wrightson**, partly funded through the Works Progress Administration's Federal
  Art Project. **Twelve panels — ten pictorial, two descriptive.** Property type
  "Object/Educational". Criteria 1 and 3; cultural association recorded as
  "Jewish".
- <https://sfplanninggis.org/docs/landmarks_and_districts/LM289.pdf> ·
  <https://data.sfgov.org/resource/rzic-39gi.json>
- **THIS ONE IS A PROBLEM AND I AM FLAGGING IT HARD.** Wikipedia's Bernard
  Zakheim article states the frescoes *"were papered over in 1948, and later
  restored by Zakheim's son Nathan"* and that *"In 2021, the murals were removed
  from the building so that it could be torn down"*, with UCSF then working to
  *"identify a new location for display of the murals."*
  <https://en.wikipedia.org/wiki/Bernard_Zakheim>
  I could not reach a UCSF page confirming the removal or the present location —
  four candidate UCSF news URLs returned 404 and the site's search is
  client-rendered. **A reader sent to 533 Parnassus Avenue may find neither the
  frescoes nor the building.** The landmark number is real and current in the
  live dataset. Whether this is a *place a traveller can visit* is unresolved and
  a verifier must settle it before it ships. This is my least confident candidate.
- Also note: a fresco cycle is an artwork, not architecture. It may be written
  about and may not be photographed. Say nothing about why.

### 2.2 Legacy Business Registry — four, each with a nomination number

The SF Legacy Business Registry is a City register and every entry carries a
nomination identifier and a Small Business Commission certification date. It is
not on DataSF; the authoritative layer backs the City's public dashboard.
Layer: <https://services.arcgis.com/Zs2aNLFN00jrS4gG/arcgis/rest/services/legacy_biz/FeatureServer/0>
Dashboard: <https://sfgov.maps.arcgis.com/apps/dashboards/471cc5798f8c486fb0f8e9ac8badaf03>
Program page: <https://www.sf.gov/legacy-business-program> ·
<https://sfplanning.org/legacy-business-registry>

544 rows retrieved. Four fall inside the Inner Sunset polygon:

| business | address | nomination no. | certified |
|---|---|---|---|
| **Green Apple Books** (the 9th Avenue store) | 1231 9th Ave. | **LBR-2015-16-022** | 2016-10-03 |
| **Ambiance** | 756 Irving St. | **LBR-2019-20-025** | 2020-09-28 |
| **San Francisco Women Artists** | 647 Irving St. | **LBR-2023-24-017** | 2023-12-11 |
| **Peasant Pies** | 1039 Irving St. | **LBR-2024-25-043** | 2025-07-28 |

Detail worth carrying:
- **San Francisco Women Artists Gallery**, 647 Irving Street at 8th Avenue, 94122.
  Hours from the organisation: *"10:30am to 5:30pm Tuesday – Saturday."*
  <https://www.sfwomenartists.org/> — **their own page also calls the group "one
  of the oldest arts organizations in California". That is a banned superlative
  and must not travel.**
- **Green Apple Books**, 1231 9th Ave.; registry "Known For" field reads *"New and
  used books"*. <https://www.greenapplebooks.com/>
- **Ambiance**, 756 Irving St.; "Known For" *"Women's clothing and accessories"*.
  <https://ambiancesf.com/>
- **Peasant Pies**, 1039 Irving St., phone (415) 731-1978; "Known For"
  *"Hand-held savory pies and sweet pies"*. <https://www.peasantpies.com/>

**A ruling I need from the verifier.** The registry carries an `Established_Date`
for each business (Green Apple 1967; Ambiance 1983; SF Women Artists 8 January
1925; Peasant Pies December 1993). The standing rule bans a founding year *taken
from the operator's own site* as an unsupported trading-duration claim. These
dates are not from the operator's site — they are fields in a City register that
a business must document to be certified, and they arrive with a nomination
number attached. I believe they publish **when cited to the registry, with the
nomination number in the same sentence**, and do not publish as a bare "since
1967". I have not assumed the answer either way; the four nomination numbers and
certification dates stand on their own without the founding years.

Near misses, for the arbitrator's map, all outside the Inner Sunset polygon:
Lucca Food & Wine Shop (1899 Irving, Sunset/Parkside, LBR-2018-19-025), Wah Mei
School (1400 Judah, Sunset/Parkside, LBR-2018-19-030), Other Avenues (3930 Judah,
Sunset/Parkside), Win Long Hardware (2244 Irving, Sunset/Parkside), and the Cole
Valley cluster already inside shipped Haight-Ashbury territory — Cole Hardware,
Zazie, Finnegans Wake, Val de Cole, Sword and Rose.

### 2.3 One survey finding that is NOT a designation

**Irving Street and 15th Avenue Neighborhood Commercial Historic District**
- From `63x5-g3m4` (Historic Districts), centroid −122.47270 / 37.76402 →
  Inner Sunset. <https://data.sfgov.org/resource/63x5-g3m4.json>
- Period of significance **1926**. Origin: San Francisco Citywide Cultural
  Resources Survey.
- Status fields, verbatim: `cr: "Eligible"`, `nr: "No"`, `a10: "No"`,
  `a11: "No"`.
- Report: <https://sfculturalheritage.org/report/b5d8dea9-e9e7-4c23-a9f0-ece44cbd5807>
- **This is an eligibility finding, not a listing, and it has no identifier.**
  "Appears eligible for listing in the California Register" is not "listed". It
  fails the citation rule and it must not be written as a designation. I include
  it because it is the only formal recognition the Irving Street commercial strip
  carries, and because a writer who saw the word "Historic District" in a dataset
  and did not read the status fields would ship a false claim.

### 2.4 One record that must NOT be claimed

**"Residence at 2 Claredon Avenue"** (SF Planning's spelling), 2 Clarendon Ave,
appears in both landmark datasets with `landmarkno: "0"`, `yeardesignated: "0.0"`
and `status: "Work Program"`. That is a survey/work-programme entry, not a
designation. It falls in Ashbury Heights under Definition B in any case. **Do not
claim it.**

### 2.5 The National Register: nothing

I queried the NPS `nrhp_locations` layer for the whole of San Francisco County —
**170 listings, distributed and checked against the polygons.**
<https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0/query>

**Zero fall inside the Inner Sunset polygon.** The nearest are the Golden Gate
Park Conservatory (ref. 71000184, certified 10/14/71) and the Beach Chalet
(ref. 81000172, certified 07/22/81), both in Golden Gate Park and both that
page's business; and the Moss Flats Building at 1626 Great Highway (ref.
83001232, certified 02/24/83) in Sunset/Parkside.

The negative is itself a finding and the writer should not paper over it by
implying federal recognition where there is none.

---

## 3. PARKS AND OPEN SPACE

All acreages and addresses from the SF Rec & Park properties dataset `gtr9-ntp6`,
which carries an `analysis_neighborhood` column already joined.
<https://data.sfgov.org/resource/gtr9-ntp6.json>

| property | address | type | acres | Definition B says |
|---|---|---|---|---|
| **Grand View Park** | 1730 15th Ave | Neighborhood park | 4.14 | Golden Gate Heights |
| **Grand View Open Space** | — | Neighborhood park | 0.79 | Golden Gate Heights |
| **Golden Gate Heights Park** | 2041 12th Ave | Neighborhood park | 6.96 | Golden Gate Heights |
| **Rocky Outcrop** | 1800 14th Ave | Neighborhood park | 1.67 | Golden Gate Heights |
| **15th Avenue Steps** | 1060 Kirkham St | Mini park | 0.51 | Golden Gate Heights |
| **J.P. Murphy Playground** | 1960 9th Ave | Neighborhood park | 1.33 | **Forest Hill** |
| **White Crane Springs Community Garden** | 1620 7th Ave | Community garden | 0.46 | **Forest Knolls** |
| **Tank Hill** | 100 Twin Peaks Blvd | Neighborhood park | 3.02 | **Ashbury Heights** |
| **Interior Greenbelt** | — | Neighborhood park | 21.37 | **Parnassus Heights** |

Note that `gtr9-ntp6` itself records the Interior Greenbelt's
`analysis_neighborhood` as **"Inner Sunset, Twin Peaks"** — the City's own data
declares it a straddler.

### Grand View Park (locally "Turtle Hill")
- Summit *"about 666 feet (203 m)"*; *"3.98 acres (1.61 ha)"* per Wikipedia
  against **4.14 acres** in the Rec & Park dataset — the two sources disagree and
  the writer should carry the City figure or neither.
- Geology: *"an outcrop of chert, which is part of the heterogeneous assemblage
  known as the Franciscan Formation"*, under a thin sand layer.
- Plants: *"endangered Franciscan wallflower and dune tansy"*, plus *"bush lupin,
  beach strawberry, bush monkey flower, and coyote bush"*; the summit is
  *"crowned with Monterey cypress trees."*
- Bounded by 14th and 15th Avenues and Noriega Street. Hours 5am to midnight.
- <https://en.wikipedia.org/wiki/Grand_View_Park> ·
  <https://data.sfgov.org/resource/gtr9-ntp6.json>
- **Do not write "Turtle Hill" as though it were official.** Wikipedia attributes
  it to local residents; it is not the Rec & Park property name.

### Tank Hill — straddler, see §6
3.02 acres, mailing address 100 Twin Peaks Boulevard. Definition A puts it in
Inner Sunset and Definition B puts it in Ashbury Heights, one hill east of
anything else on this list. I did not resolve it.

### Interior Greenbelt — straddler, see §6
21.37 acres per Rec & Park; Wikipedia's Mount Sutro article calls it *"the 19-acre
city-owned 'Interior Green Belt'"* which *"adjoins UCSF's reserve"*. Two
acreages, two sources; the City's is the one to carry.
<https://en.wikipedia.org/wiki/Mount_Sutro>

---

## 4. MOUNT SUTRO AND THE STAIRWAYS

### Mount Sutro Open Space Reserve
- Elevation **911 ft (278 m)**. UCSF owns *"a 61-acre (25 ha) parcel, including
  the summit, protected as the Mount Sutro Open Space Reserve."*
- Sutro Stewards, verbatim: *"UCSF owns and manages 61 acres of Mount Sutro and
  San Francisco Recreation & Parks manages 20 acres on the east side"* and
  *"Mount Sutro Open Space currently has over 5.5 miles of multi-use trail, cared
  for and built predominantly by volunteers"*. Sutro Stewards also run a native
  plant nursery on university land.
- Planting: *"About 80% being introduced eucalyptus trees, that was planted in
  the late 19th century"*; Adolph Sutro planted using *"annual Arbor Day
  celebrations"*.
- **Rotary Meadow**, the native plant garden at the summit, *"was funded by a
  $100,000 grant from the San Francisco Rotary Club #2 and its members in 2004."*
- Access: *"the 355-step public stairway from Warren Drive to Crestmont Drive"*,
  and by paved road from Clarendon Avenue through UCSF's **Aldea San Miguel**
  housing.
- UCSF's own locations page lists *"Mount Sutro Open Space Reserve — A 61-acre
  reserve with campus housing"* among its campuses.
- <https://en.wikipedia.org/wiki/Mount_Sutro> · <https://sutrostewards.org/mount-sutro/> ·
  <https://www.ucsf.edu/about/locations>
- **Straddler.** Definition B calls the summit Parnassus Heights; Definition C
  puts it outside Inner Sunset altogether. Not resolved.
- **Naming caution:** UCSF's history calls the hill *"Mount Parnassus (now known
  as Mount Sutro)"*. Two names, one hill; the writer should pick the current one.
- "Cloud forest" appears in the brief and in popular writing. I did not find it
  in UCSF's or Sutro Stewards' own language and I would not put it on the page as
  a claim about the ecology.

### 16th Avenue Tiled Steps (the Moraga Steps)
- Artists **Aileen Barr** and **Colette Crutcher**. Constructed July–August 2005;
  **opening ceremony 27 August 2005**, with lion dancers.
- **163 steps.** *"Moraga Street between 15th & 16th Avenue."* Mosaic of *"over
  2,000 unique tiles made from approximately 75,000 glass fragments."*
- Originated with residents **Jessie Audette** and **Alice Yee Xavier** in 2003;
  three community workshops made the panels; funded by *"over 220
  sponsored/named tiles"* and the Mayor's Neighborhood Beautification Fund.
- The steps lead up to Grand View Park.
- <https://en.wikipedia.org/wiki/16th_Avenue_Tiled_Steps> ·
  <https://en.wikipedia.org/wiki/Grand_View_Park>
- **A mosaic is an artwork, not a building. It may be written about; it may not
  be photographed. Say nothing about why.**
- **Gap:** the project's own site, `tiledsteps.org`, no longer resolves (DNS
  failure). Wikipedia's citations to it are therefore unverifiable against the
  primary source, and the 163 figure rests on Wikipedia alone. A verifier should
  find a second source for the step count or the writer should drop the number.
  Definition B places this in Golden Gate Heights — straddler.

### Hidden Garden Steps — LOW CONFIDENCE, DO NOT SHIP WITHOUT VERIFICATION
16th Avenue between Kirkham and Lawton, by the same two artists, generally dated
2013. **I could not source a single fact.** `hiddengardensteps.org` now resolves
to a tree-service company in Longview, Texas, and Wikipedia has no article at the
obvious title. It is a real, well-known object and I have nothing citable on it.
This is my second-least-confident candidate.

### 15th Avenue Steps
A 0.51-acre Rec & Park **mini park** at 1060 Kirkham Street — a distinct City
property from either mosaic stairway, and the only one of the three that is
formally a park. <https://data.sfgov.org/resource/gtr9-ntp6.json>

---

## 5. UCSF PARNASSUS HEIGHTS

- *"San Francisco Mayor Adolph Sutro donated 13 acres in Parnassus Heights at the
  base of Mount Parnassus"*; the Affiliated Colleges buildings *"opened in the
  fall of 1898."*
- UC Hospital established **1917**, 225 beds. Clinics Building **1934**. Langley
  Porter Clinic opened **1942**. **Herbert C. Moffitt Hospital** completed
  **1955**. **Guy S. Millberry Union** added **1958**. **Kalmanovitz Library**
  completed **1990**.
- UCSF describes Parnassus Heights as *"made up of a tight network of buildings
  where faculty, staff, students and others are engaged in patient care, research
  and education activities."*
- <https://en.wikipedia.org/wiki/University_of_California,_San_Francisco> ·
  <https://www.ucsf.edu/about/locations>
- **Gap:** `ucsf.edu/maps/parnassus` renders client-side and returned only a
  "Loading…" shell; `ucsf.edu/about/history` and
  `ucsf.edu/about/locations/parnassus-heights` are both 404. **I have no
  first-party UCSF page carrying the campus street address.** The medical centre
  address 505 Parnassus Avenue comes from geocoding, not from UCSF. A verifier
  should get that address from UCSF Health directly.
- **Straddler.** Definition B: Parnassus Heights. Definition C: outside Inner
  Sunset. The entire campus, the medical centre and Mount Sutro move together.

Sub-candidates a writer could use, all inside the campus and all sharing the
straddle: **UCSF Medical Center at Parnassus** (505 Parnassus Ave),
**Moffitt Hospital**, **Long Hospital**, **Millberry Union**,
**Kalmanovitz Library**, **UC Hall** (533 Parnassus Ave, and see §2.1 —
demolition), **Aldea San Miguel** housing.

---

## 6. STRADDLERS — flagged, not resolved

The arbitrator has all eleven zones in front of it. I have resolved none of
these. Each row states the conflict and the evidence.

| # | place | claim from | competing claim | evidence |
|---|---|---|---|---|
| S1 | **UCSF Parnassus campus** (7 sub-places) | Inner Sunset (Def. A) | **Parnassus Heights** (Def. B); *outside* Inner Sunset (Def. C, east of 2nd Ave) | polygon tests, §1 table; WNP lists Parnassus Heights as a sibling of Inner Sunset |
| S2 | **Mount Sutro Open Space Reserve** | Inner Sunset (Def. A) | Parnassus Heights (Def. B); outside (Def. C) | same; also UCSF-owned, not city land |
| S3 | **Interior Greenbelt** | Inner Sunset | **Twin Peaks** | `gtr9-ntp6` itself records `analysis_neighborhood: "Inner Sunset, Twin Peaks"` |
| S4 | **Tank Hill** | Inner Sunset (Def. A) | **Ashbury Heights** (Def. B) | polygon test; mailing address is 100 Twin Peaks Blvd |
| S5 | **Grand View Park, Grand View Open Space, 16th Avenue Tiled Steps, Rocky Outcrop, Golden Gate Heights Park, 15th Avenue Steps** | Inner Sunset (Def. A and C) | **Golden Gate Heights** (Def. B and D) | polygon tests; WNP lists Golden Gate Heights as a sibling district |
| S6 | **J.P. Murphy Playground** | Inner Sunset (Def. A) | **Forest Hill** (Def. B) | polygon test |
| S7 | **White Crane Springs Community Garden** | Inner Sunset (Def. A) | **Forest Knolls** (Def. B) | polygon test |
| S8 | **Kezar Stadium and Kezar Pavilion** | — | **Golden Gate Park** under both DataSF datasets | polygon test; these are the Golden Gate Park page's, and Inner Sunset must not take them |
| S9 | **Sutro Tower**, 1 La Avanzada St | — | **Twin Peaks** (Def. A) / **Clarendon Heights** (Def. B) | polygon test. Not Inner Sunset under any definition, though it is the thing you see from Grand View Park. Completed 4 July 1973; 977 ft; Sutro Tower, Inc. <https://en.wikipedia.org/wiki/Sutro_Tower> |
| S10 | **The Cole Valley fringe** (Stanyan Street south of Grattan, the 1200 block) | Inner Sunset (Def. A only) | Cole Valley, and adjoining **already-shipped Haight-Ashbury** | polygon test put 1201 Stanyan St in Inner Sunset; no shipped Haight place is inside my polygon, but the arbitrator should know the polygon reaches there |
| S11 | **Golden Gate Park's south edge along Lincoln Way** | — | Golden Gate Park page | the de Young and the Academy of Sciences are explicitly not Inner Sunset's; neither is anything else north of Lincoln Way |

---

## 7. SHAPE OF THE PAGE — town-page, not a guide

My judgement: **town-page.**

The case for it. Strip out the straddlers and Inner Sunset's undisputed core is a
commercial strip, a branch library, a fire house, an Art Deco office block and
four Legacy Business Registry entries. Four Article 10 numbers. **No National
Register listing at all** — the only San Francisco neighbourhood I checked with a
clean zero. There is no monument here, no set-piece, and nothing a traveller
crosses the city to stand in front of. The Doelger Building's own significance is
that a builder ran a tract-housing firm out of it. That is a neighbourhood where
people live, described honestly, which is what a town-page is for.

The case against, which I do not think carries. The zone's four genuinely
compelling subjects — Mount Sutro, the UCSF campus, Grand View Park and the
Moraga Steps — are **all four straddlers**, and three of the four sit in
neighbourhoods (Parnassus Heights, Golden Gate Heights) that two of the four
boundary sources treat as siblings of Inner Sunset rather than parts of it. A
guide built on them would be a guide to places the page may not own. If the
arbitrator awards all of them, the judgement is worth revisiting; if it awards
none, the town-page is the only honest form.

---

## 8. THE REST OF THE CANDIDATE LIST

Commercial and eating places along the two corridors. **These are candidates, not
confirmations.** For each I have a street address inside the Inner Sunset polygon
and, where noted, a geocode. I did **not** obtain hours or first-party pages for
most of them, and the rules mean their own sites establish identity, location and
hours only — never how long they have traded and never a superlative.

Irving Street: **San Tung** (1031 Irving, geocoded −122.46899 / 37.76367),
**Peasant Pies** (1039, §2.2), **Ambiance** (756, §2.2), **San Francisco Women
Artists** (647, §2.2), **Wishbone** (601), **Andronico's Community Market**
(1200), **Irving Subs and Cheese Shop** (1298 12th Ave at Irving), 1300, 1418,
1428 and 1530 Irving all geocode inside the polygon.

9th Avenue between Lincoln Way and Judah: **Green Apple Books on the Park**
(1231, §2.2), **Nopalito** (1224), **Park Chow** (1240), **Ebisu** (1283),
**Arizmendi Bakery** (1331), **Pacific Catch** (1200), and the 1266, 1290, 1300,
1310, 1329 and 1385 addresses all inside the polygon.

**The Little Shamrock**, 807 Lincoln Way — geocoded −122.46671 / 37.76578, inside
Inner Sunset, and Nominatim's own POI record names it. **It is not in the Legacy
Business Registry** (I checked all 544 rows). Any trading-duration claim about it
would be unsourced. Treat with care.

**Inner Sunset Farmers Market** — held Sundays on 9th Avenue between Irving and
Judah. `innersunsetfarmersmarket.com` does not resolve (DNS failure) and I have
**no citable source for the day, the hours or the operator.** Third-least
confident item on this list; a verifier needs a first-party page or it does not
ship.

Worship and schools: **St. Anne of the Sunset Church**, 850 Judah Street at
Funston Avenue — geocoded −122.47124 / 37.76213, Inner Sunset under Definitions
A and B. **I have no architect, date or style**: `stanne.com` serves St. Anne
School, not the parish, and there is no Wikipedia article at the obvious title.
**St. John of God / Newman Center**, 1290 5th Avenue (−122.46171 / 37.76450),
inside the polygon, unresearched.

Explicitly **not** Inner Sunset, checked and rejected: Herbert Hoover Middle
School, 2290 14th Avenue → **West of Twin Peaks**. Sunset Recreation Center, 2201
Lawton → **Sunset/Parkside**. Sunset Reservoir, Lucca Food & Wine, Wah Mei
School, Other Avenues, Win Long Hardware → **Sunset/Parkside**. The de Young, the
Academy of Sciences, the Conservatory of Flowers, McLaren Lodge, the Music
Concourse, Stow Lake, the Beach Chalet, the Dutch and Murphy Windmills, the Lawn
Bowling Clubhouse, the Sharon Building and the Francis Scott Key Monument → all
**Golden Gate Park**, all confirmed by polygon test, and none of them Inner
Sunset's to claim.

---

## 9. METHOD AND WORKING FILES

Scripts and cached datasets:
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/innersunset/`
— `isf.py` (fetch, polygon cache, point-in-polygon, `which(lon,lat)`),
`scan1.py`/`scan3.py` (landmark scans), `nrhp2.py` (all 170 SF National Register
rows), `recpark.py`, `legacy2.py`, `hd.py`, `sffind.py`, `geo.py`, `shipped.py`.

Datasets used, all HTTP 200 and all verified by retrieving rows:

| id | dataset |
|---|---|
| `j2bu-swwd` | Analysis Neighborhoods (41 rows, real geometry) |
| `gfpk-269f` | SF Find Neighborhoods (117 rows) |
| `97yj-54sx` | Landmarks Listed in Article 10 (370 rows) |
| `rzic-39gi` | Landmarks — architect, style, criteria (362 rows) |
| `knm6-5ej6` | Landmark Districts (20 rows; **none in Inner Sunset**) |
| `63x5-g3m4` | Historic Districts (survey statuses) |
| `gtr9-ntp6` | Rec & Park properties (255 rows, joined neighbourhood) |

The Socrata catalogue only scopes with `search_context=data.sfgov.org`; the
`domains=` parameter silently federates and returns Chicago and Denver datasets.
There is **no** Legacy Business dataset on DataSF — the catalogue search returns
nothing and the only ArcGIS feature service named for the programme at the
statewide level is a California grant programme with Los Angeles rows in it. The
City's register is the `legacy_biz` layer cited in §2.2, reached through the
dashboard's web map, and that is the one to use.

Confirmation rate is deliberately low. Of 61 candidates, **8 carry an identifier
I would defend**, four more have first-party hours or addresses and nothing else,
and the long tail of Irving Street and 9th Avenue businesses is address-and-
polygon only. The four items I would not ship without more work are the UC Hall
frescoes (§2.1), the Hidden Garden Steps (§4), the Inner Sunset Farmers Market
(§8) and St. Anne of the Sunset (§8).
