# Haight-Ashbury — finder's report

Zone: `haight-ashbury`, San Francisco, California. Roster entry at
`priv/seed_data/san_francisco_roster.json`, in scope, destination string
`Haight-Ashbury, California`.

Research run 2026-09-03. Every fact below carries the URL it came from. Nothing
here is reader-facing prose; the provenance arguments live in this file by
design, and the gate at `test/ethos/seeds/san_francisco_seed_data_test.exs` bans
them from the page itself.

**55 candidates. 14 designation identifiers across 11 distinct properties**
(7 Article 10 landmark numbers, 6 National Register reference numbers, and 1
Article 10 landmark-district appendix; three properties carry both a City and a
federal identifier). My judgement: **town-page**, not a guide. Reasoning in
"Shape of the page" below.

---

## 0. Two corrections to the brief, before anything else

### 0.1 `.superpowers/taken_slugs.py` is stale and reads only Rome

The script I was told to run globs exactly one directory:

```python
for f in sorted(glob.glob("priv/seed_data/rome/*.json")):
```

It reports **1279 places across 31 files**. The real corpus is **3936 places
across 350 files** — the script is blind to Connecticut, Manhattan, Brooklyn,
Queens, the Bronx, destinations, ballparks and San Francisco, i.e. to 2657
places, 67 percent of everything committed. Its own docstring claims it prints
"every place slug and place name already owned", and the brief repeats that
claim ("nearly 4,000 places are already committed"), so the number in the brief
is right and the tool that is supposed to produce it is wrong.

I wrote a corpus-wide replacement and checked every candidate through it. Working
copy: `/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/taken_all.py`.
It walks `priv/seed_data/*/*.json` and also greps `lib/**/*.ex` so the Oracle Park
code seed is visible. **This should be fixed before the next zone runs**, because
a finder trusting the shipped script would believe a Manhattan or Queens slug was
free.

Result of the check: **no candidate in this report collides with a committed
slug.** Two name-fragment hits, both harmless and both in other regions —
`phelps-hatheway-house-garden` (Suffield, CT) and
`simsbury-historical-society-phelps-tavern-museum` against my Abner Phelps
House, and several NY `firehouse-engine-*` slugs against Hose Company #30. Slug
mine `abner-phelps-house-san-francisco` and `hose-company-30-firehouse` and there
is no conflict.

### 0.2 The DataSF landmark dataset IDs in circulation are all wrong

The roster records that "two landmark dataset IDs returned 404" and concludes
they were "wrong resource identifiers rather than a dead host". That is correct,
and I found the right ones. Every landmark-named dataset returned by the
unscoped Socrata catalog belongs to Chicago, Denver, Cincinnati or NYC — the
catalog at `api.us.socrata.com/api/catalog/v1` **federates across all Socrata
domains and the `domains=` parameter silently does nothing**. I probed fourteen
plausible IDs against `data.sfgov.org/resource/<id>.json` and all fourteen 404'd.

The parameter that actually scopes is `search_context`:

```
https://data.sfgov.org/api/catalog/v1?search_context=data.sfgov.org&q=landmark
```

The three San Francisco datasets that matter, all HTTP 200 and all verified by
retrieving rows:

| id | dataset | what it carries |
|---|---|---|
| `97yj-54sx` | Landmarks Listed in Article 10 of the SF Planning Code | landmark number, address, year designated, designation-ordinance PDF |
| `rzic-39gi` | Landmarks | architect, style, year built, significance criteria, NRHP flag |
| `knm6-5ej6` | Landmark Districts | district name, Article 10 appendix letter, date listed |

Boundary datasets: `j2bu-swwd` (Analysis Neighborhoods — has real `nhood` and
geometry) and `gtr9-ntp6` (Rec & Park Properties — carries an
`analysis_neighborhood` column already joined). **Note `p5b7-5n3h`, also called
"Analysis Neighborhoods", returns 41 rows of empty objects with no geometry and
no `nhood`** — it is a stub. Use `j2bu-swwd`.

---

## 1. The boundary problem, which dominates this zone

Haight-Ashbury has two boundary definitions in wide use and **they disagree by
about eight blocks**. This is not a nuance; it decides ownership of five
designated landmarks.

**Definition A — DataSF Analysis Neighborhood "Haight Ashbury"** (`j2bu-swwd`).
Computed bounding box from the polygon: longitude −122.45390 to −122.43157,
latitude 37.76148 to 37.77376. Its eastern edge runs to roughly Steiner/Fillmore
and its southern edge takes in Cole Valley and Ashbury Heights.

**Definition B — the vernacular district**, per San Francisco Travel and cited in
the Wikipedia article: "bounded by Stanyan Street and Golden Gate Park on the
west, Oak Street and the Golden Gate Park Panhandle on the north, Baker Street
and Buena Vista Park to the east, and Frederick Street and the Ashbury Heights
and Cole Valley neighborhoods to the south."
<https://www.sftravel.com/explore/neighborhoods/haight-ashbury>,
<https://en.wikipedia.org/wiki/Haight-Ashbury>

Definition A is materially larger. It absorbs Cole Valley, part of Lower Haight,
and the NoPa/Alamo Square fringe. I ran every candidate through a point-in-polygon
test against Definition A and then checked it against Definition B by hand, and I
report both. **I have not resolved a single straddler — see section 4.**

A third check, Nominatim reverse geocoding, was suggested in the brief and I
recommend against relying on it. Its `neighbourhood` field called Amoeba Music
"Cole Valley", Buena Vista Park "Mission", and Alvord Lake "Richmond District" —
three answers, three errors. The scoping note that Nominatim "returns a
neighborhood in the address block" is true and the value is not trustworthy in
San Francisco. Use the DataSF polygon.

---

## 2. Designation-backed candidates

Eleven distinct properties carry a citable identifier. Article 10 numbers from
`97yj-54sx` and `rzic-39gi`; NRHP reference numbers **verified directly against
the National Park Service**, not from Wikipedia, at
`https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0/query`
— all six returned `STATUS: Listed`.

### 2.1 Inside both definitions — safe to claim

**Doolan-Larson Building** (SF Planning: "Richard Doolan/Norman Larson Residence
and Storefronts"; NPS: "Doolan, Richard P., Residence and Storefronts")
- 557 Ashbury Street / 1500–1512 Haight Street, the corner of Haight and Ashbury
- **San Francisco Landmark No. 253, designated 2006**. APN 1231/009.
- **National Register reference number 09001201, listed 11 May 2011.**
- Built 1903, Colonial Revival; architect/builder Charles J. U. Koenig and Frank
  T. Doolan. Raised in 1907, the year after the earthquake and fire, to put
  retail underneath, and the row of storefronts to the west added at the same
  time. Holcombe Jewelers held the corner space 1937–1988. Between 1965 and 1968
  1510 Haight Street housed the clothing boutique Mnasidika.
- Significance criteria 1 (events) and 3 (architecture); "sigperson: Janis
  Joplin"; cultural context recorded as "Counter Culture".
- Norm Larson gifted the property to San Francisco Heritage in 2017. As of the
  organisation's own site the building is **not open to visitors**: SF Heritage
  issued a Request for Proposals on 6 February 2026, received three proposals on
  12 June 2026, and "intends to select a partner in summer 2026".
- Sources: `97yj-54sx`; `rzic-39gi`; NPS ArcGIS query above; designation report
  <https://sfplanninggis.org/docs/landmarks_and_districts/LM253.pdf>;
  <https://www.haightandashbury.org/>
- Kind: `historic-site`. **Do not write it as visitable.**

**Firehouse: Hose Company #30**
- 1757 Waller Street. Block/Lot 1250/029, parcel 6,350 sq ft, zoned Haight Street NCD.
- **San Francisco Landmark No. 328, designated 2026.** Ordinance No. 66-26, File
  No. 260157, adopted by the Board of Supervisors 21 April 2026 and enacted
  30 April 2026.
- Built 1895; architect unknown; granite and wood; Italianate. Period of
  significance 1895. Criteria 1 (events) and 3 (architecture).
- Housed Engine Company Number 30 and operated as a firehouse until 1959. The
  company numbered 27 firemen and was disbanded in 1918, when Chemical Company
  Number 5 moved in. Truck Company Number 12 was resident 1912–1956, its district
  running to the Pacific. The City sold the building at public auction in 1956;
  it was restored as a private residence and is now offices.
- Character-defining features include first-storey molded panels lettered
  "Chemical 5", "S.F.F.D." and "Truck 12" — a good, concrete visual detail.
- Source: designation ordinance PDF via `97yj-54sx` `designationdocument.url`
  (Board of Supervisors packet, extracted with `pdftotext`).
- Kind: `historic-site`. Offices — **exterior only**.

**American Indian Historical Society / Chautauqua House**
- 1451 Masonic Avenue. Block/Lot 1270/002, parcel 5,300 sq ft, zoned RH-2.
- **San Francisco Landmark No. 324, designated 2026.** File No. 260153, same
  Board action of 21 April 2026, enacted 30 April 2026.
- Built c. 1900, architect unknown. Period of significance 1967–1986. Criteria 1
  (events) and 2 (persons).
- The American Indian Historical Society was founded in 1964 by Rupert Costo
  (Cahuilla), Jeannette Henry-Costo (Eastern Cherokee) and thirteen other
  California American Indians. It moved from the Costos' residence to this
  building in 1967 and named it Chautauqua House. It held gallery space for
  American Indian artists (the Museum of Indian Art) and published the quarterly
  journal *The Indian Historian*. Richard Oakes (Mohawk) led an educational
  committee that met here; the Alcatraz occupation began in November 1969. The
  Society ceased operations in 1986.
- Source: designation ordinance PDF via `97yj-54sx`.
- Kind: `historic-site`. Zoned residential — **exterior only**.

**Park View Hotel — trading as the Stanyan Park Hotel**
- 750 Stanyan Street, San Francisco, CA 94117.
- **National Register reference number 83001235, listed 11 August 1983**
  (NPS `RESNAME` "Park View Hotel"). No Article 10 number.
- The operator's own site confirms identity and address:
  <https://www.stanyanpark.com/> — HTTP 200, address in the page footer.
- Sources: NPS ArcGIS query; operator site for address only.
- Kind: `hotel`. **The site's "Featured in Oprah's O Magazine" line is an award
  claim from the operator's own site and does not publish.** No founding year is
  established by anything I could reach.

**John A. Whelan House**
- 1315 Waller Street.
- **National Register reference number 100005794, listed 20 November 2020**
  (NPS gives 11/20/20; Wikipedia says 2020-11-16 and is wrong — prefer NPS).
- No Article 10 number. No architect or build year established; the NPGallery
  nomination PDF endpoint timed out repeatedly and I did not get the narrative.
- Source: NPS ArcGIS query.
- Kind: `historic-site`. Private house — **exterior only**, and thin.

### 2.2 Designated, but the boundary is contested — see section 4

**Abner Phelps House** — 1111 Oak Street. **SF Landmark No. 32, designated 1970**
(APN 1218/050); **NRHP reference number 71000187, listed 23 May 1979**. Built
1850, Gothic Revival. Criteria 1 and 3; significant person Abner Phelps.
<https://sfplanninggis.org/docs/landmarks_and_districts/LM32.pdf>

**Old Mish House** (NPS: "Mish House") — 1153 Oak Street. **SF Landmark No. 62,
designated 1974** (APN 1218/029); **NRHP reference number 79000534, listed
21 May 1979**. Built 1885, Eastlake, architect McDougall & Sons. Criteria 2 and 3;
significant persons Sarah and Phenes Mish. Recorded potential context "women's
history; Jewish History".
<https://sfplanninggis.org/docs/landmarks_and_districts/LM62.pdf>

**Charles L. Hinkel House and Carriage House** — 280 Divisadero Street.
**SF Landmark No. 190, designated 1988** (APN 1238/023). Built 1885, Second
Empire, architect/builder Charles L. Hinkel. Criteria 2 and 3; recorded cultural
context "German American".
<https://sfplanninggis.org/docs/landmarks_and_districts/LM190.pdf>

**John Spencer House** — 1080 Haight Street. **NRHP reference number 05000273,
listed 14 April 2005.** No Article 10 number.

**Maud's** — 929–941 Cole Street. **SF Landmark No. 331, designated 2026.**
Ordinance No. 69-26, File No. 260160, enacted 30 April 2026. Period of
significance 1967–1986; criteria 1 and 2; Block/Lot 1272/003, parcel 7,496 sq ft.
Associated with Rikki Streicher. The bar occupied the middle two storefronts and
**closed in 1989** — it is a historic site, not a going concern. The ordinance
locates it "on the west side of Cole Street between Parnassus Avenue and Carl
Street", which is a permitted locator under the proximity rule.
*Address discrepancy inside one document:* the ordinance body says 929–941 Cole
Street and the attached Fact Sheet heading says 925–941 Cole Street. Flagging
rather than picking.

**Duboce Park Landmark District** — **Article 10, Appendix N of the Planning
Code, listed 13 July 2013** (`knm6-5ej6`). There is **no Haight-Ashbury landmark
district**; I checked all twenty in the dataset.

---

## 3. Candidates with no designation

### 3.1 Anchors

**Amoeba Music** — 1855 Haight Street. Opened **15 November 1997** in the former
24,000 sq ft Park Bowl bowling alley. Two independent sources agree on the date:
SF Weekly (Joe Kukura, "Amoeba Music Records 20 Years On Haight Street",
17 Nov 2017), cited at <https://en.wikipedia.org/wiki/Amoeba_Music>, and the
City's own business register, which gives `location_start_date` 1997-11-15 at
1855 Haight St (`kvj8-g7jh`). That agreement is unusually strong for a shop.
amoeba.com returned HTTP 403 to me. Kind: `shop`.

**Buena Vista Park** — 1293 Haight Street. **38.35 acres** (1,670,320 sq ft),
`propertytype` "Regional Park", `analysis_neighborhood` and
`planning_neighborhood` both "Haight Ashbury", ownership Recreation & Park
(`gtr9-ntp6`). Established **1867 as Hill Park**, later renamed; the hill peaks
at 575 feet; bounded by Haight Street to the north and Buena Vista Avenue West
and East (<https://en.wikipedia.org/wiki/Buena_Vista_Park>). Kind: `park`.
**Wikipedia's "oldest official park in San Francisco" is a ranking and must not
be written.** "Established in 1867" is a date and publishes.

**The Red Victorian** — 1665 Haight Street. Registered at that address in the
City business register as "Red Victorian LLC" (`kvj8-g7jh`). Wikipedia has only a
one-line stub calling it "a historic hotel on Haight Street". No build year, no
architect, no founding date established. Kind: `hotel`. Thin — see 5.2.

**710 Ashbury Street** — the Grateful Dead house. **Weakly sourced and I could
not fix it.** No Wikipedia article; the address appears nowhere in the Grateful
Dead article; it is in no landmark dataset and no NRHP record. Geocodes cleanly
into the polygon at (−122.44641, 37.76869). It is a private residence either way.
See 5.1.

**Richard Spreckels Mansion** — 737 Buena Vista Avenue West. Geocodes into the
polygon at (−122.44398, 37.76815). No Wikipedia article, no Article 10 number, no
NRHP record. **See the name-collision warning at 4.6 — this is not the building
the roster assigned to Pacific Heights.** See 5.3.

### 3.2 Haight Street commercial strip

All from the City's Registered/Active Business Locations dataset `kvj8-g7jh`,
polygon-filtered. **`location_start_date` is a registration date, not a founding
date** — the Booksmith's 2021 row reflects a change of registration, not its
arrival on Haight Street — so it establishes current trading at an address and
nothing about duration.

| business | address | registered from |
|---|---|---|
| Mendel's / Far-Out Fabrics | 1556 Haight St | 1979-07-01 |
| Piedmont Boutique | 1452 Haight St | 1981-04-01 |
| Escape From New York Pizza | 1737 Haight St | 1986-08-29 |
| Held Over | 1543 Haight St | 1991-05-01 |
| Buffalo Exchange | 1555 Haight St | 1992-01-01 |
| Wasteland | 1660 Haight St | 1994-01-01 |
| Goodwill | 1700 Haight St | 1996-03-28 |
| John Fluevog Shoes | 1697 Haight St | 1997-09-15 |
| Haight Street Market | 1530 Haight St | 1998-10-15 |
| Aub Zam Zam ("Zam Zam") | 1633 Haight St | 2000-10-15 |
| Pork Store Cafe | 1451 Haight St | 2000-07-01 |
| Bound Together (anarchist collective bookstore) | 1369 Haight St | 2004-01-01 |
| Ben & Jerry's (Haight/Ashbury corner) | 1480 Haight St | 2005-04-01 |
| Milk Bar | 1840 Haight St | 2007-06-01 |
| Parada 22 | 1805 Haight St | 2009-11-01 |
| Gold Cane Cocktail Lounge | 1569 Haight St | 2010-06-01 |
| Decades of Fashion | 1653 Haight St | 2011-11-11 |
| Hobson's Choice | 1601 Haight St | 2015-05-07 |
| Love on Haight | 1400 Haight St | 2017-01-11 |
| The Alembic | 1725 Haight St | 2018-04-02 |
| Relic Vintage | 1475 Haight St | 2021-11-01 |
| The Booksmith | 1727 Haight St | 2021-03-30 |
| Coffee to the People | 1206 Masonic Ave | 2019-12-23 |
| Magnolia Brewing | 1398 Haight St | 2024-08-22 |
| Cha Cha Cha | 1801 Haight St | 2024-05-09 |

**Magnolia Brewing**, 1398 Haight Street at Masonic, is the only one whose own
site gave usable material: <https://magnoliabrewing.com/> states hours (12pm–12am
Sun–Thu, 12pm–1am Fri–Sat, kitchen to 10pm) — **hours publish from an operator's
own site**. The same page's "cornerstone of Haight and Masonic for over 20 years"
is a trading-duration claim from the operator and **does not publish**. Its
"Built in 1903 … early days as Schumate's Pharmacy … 1960s as the Drogstore Cafe"
is history from an interested party and wants a second source before it is
written. booksmith.com returned HTTP 403; redvic.net and aubzamzam.com did not
resolve at all.

### 3.3 Other in-zone

**Haight Ashbury Free Clinic** — operated **7 June 1967 to July 2019**; merged
with an addiction-treatment organisation in 2011 and rebranded as HealthRIGHT 360
the following year; the building still belongs to HealthRIGHT
(<https://en.wikipedia.org/wiki/Haight_Ashbury_Free_Clinic>). I did **not**
independently source the 558 Clayton Street address — do not write it without
one. Its Wikipedia claim to be "the first of more than 600 free clinics" is a
ranking and does not publish. Kind: `historic-site`, and it is closed.

**Society for Individual Rights** — 529 Clayton Street. Present in both landmark
datasets but with **`landmarkno` absent, `yeardesignated` 0.0, `status` "Work
Program"** and `description` "Coming Soon!". **It is under study and is not
designated.** Any designation sentence about it fails the gate and would also be
false. Recording it so a later wave can pick it up when the number lands.

**Mount Olympus** — 480 Upper Terrace. Rec & Park mini park, 0.21 acres,
`analysis_neighborhood` "Haight Ashbury" (`gtr9-ntp6`). Site of the *Triumph of
Light* statue given by Adolph Sutro; the statue is lost and only its pedestal
remains; the view is obstructed by trees and buildings
(<https://en.wikipedia.org/wiki/Mount_Olympus_(San_Francisco)>). Wikipedia places
it in "the Buena Vista neighborhood" against DataSF's Haight Ashbury — minor
straddle. The lost statue is a sculpture, so the photo refinement would apply if
anything of it survived to photograph; the bare pedestal is not an artwork
question. Kind: `attraction`.

**Grattan Playground** — 1180 Stanyan Street, 1.87 acres, Rec & Park,
`analysis_neighborhood` and `planning_neighborhood` both "Haight Ashbury"
(`gtr9-ntp6`). But it sits at latitude 37.7626, **south of Frederick Street**, so
Definition B puts it in Cole Valley. Kind: `park`.

**All Saints Episcopal Church** — 1350 Waller Street, in the register from
1976-07-20 (`kvj8-g7jh`). No designation, no build date sourced. Note the schema
has **no church kind**; it would have to ship as `historic-site` or not at all.

**Cole Valley cluster**, all inside Definition A and outside Definition B: Cole
Street Hardware (956 Cole, registered 1968-10-01), Zazie (941 Cole, 2005-02-01),
The Ice Cream Bar (815 Cole, 2010-12-29), Say Cheese (856 Cole, 1994-07-01), Cole
Valley Tavern (900 Cole, 1989-08-21).

---

## 4. Straddlers — **all unresolved, for the arbitrator**

I have resolved none of these. Each is stated with the evidence on both sides.

**4.1 Alvord Lake, Hippie Hill, Kezar Stadium and the Panhandle are in Golden
Gate Park, not Haight-Ashbury.** The brief's suggested subjects "Alvord Lake and
the park panhandle edge" are, on the City's own boundary, outside this zone. All
four point-in-polygon into the Golden Gate Park analysis neighborhood:
Alvord Lake (−122.45447, 37.76912), Kezar Stadium (−122.45601, 37.76687), the
Panhandle (−122.44696, 37.77240). Hippie Hill is described by Wikipedia as
"within Golden Gate Park … between the Conservatory of Flowers and Haight
Street". The roster rules Golden Gate Park a standalone page "claimed by no
neighborhood", so on the roster's own logic **Haight-Ashbury may not claim them**.
Facts gathered in case the arbitrator rules the other way: the **Alvord Lake
Bridge was built in 1889 by Ernest L. Ransome**, a single arch 64 feet wide with
a 20-foot span, its face scored to resemble sandstone
(<https://en.wikipedia.org/wiki/Alvord_Lake_Bridge>). Wikipedia's "first
reinforced concrete bridge built in America" is a ranking — **and note the gate's
superlative regex does not catch it**, because its comparison-class alternation
lists "San Francisco", "California", "the Bay Area", "the Mission", "the
district" but not "America". The rule bans it even though the regex misses it.

**4.2 Golden Gate Park Section 1 straddles by the City's own record.** In
`gtr9-ntp6` its `analysis_neighborhood` is "Golden Gate Park" but its
`planning_neighborhood` is **"Golden Gate Park, Haight Ashbury"** — two City
columns, one row, disagreeing. Sections 2–5 and 7 are Golden Gate Park alone.

**4.3 Three designated landmarks sit east of Baker Street.** Abner Phelps House
(1111 Oak, −122.43805), Old Mish House (1153 Oak, −122.43822) and the Charles L.
Hinkel House (280 Divisadero, −122.43668) are all inside Definition A and all
**outside Definition B**, whose eastern limit is Baker Street at roughly
−122.4415. Locally this ground reads as NoPa / Alamo Square / Western Addition.
These are three of the seven Article 10 numbers in the zone, so the ruling is
expensive either way.

**4.4 Maud's is placed in Cole Valley by the City that designated it.** The
designation ordinance says in terms: "Located in Cole Valley, near the
Haight-Ashbury neighborhood". Its centroid (−122.45015, 37.76528) is south of
Frederick Street, i.e. outside Definition B, while Definition A includes it. Two
independent sources put it out; one puts it in.

**4.5 Duboce Park has three City answers.** `analysis_neighborhood` "Haight
Ashbury", `planning_neighborhood` "Western Addition" (`gtr9-ntp6`), and locally it
is Duboce Triangle. It carries a real designation — Duboce Park Landmark
District, Article 10 Appendix N, listed 13 July 2013 — so whoever gets it gets an
identifier. 4.79 acres, 50 Scott Street.

**4.6 NAME COLLISION — two different Spreckels mansions, and the roster assigns
the other one.** The roster's Pacific Heights draw lists "the Spreckels Mansion",
which is the Adolph Spreckels house at 2080 Washington Street. My brief lists
"the Spreckels Mansion on Buena Vista", which is the **Richard** Spreckels
Mansion at 737 Buena Vista Avenue West — a different building, different person,
different neighborhood, three kilometres apart. They must not be merged, and
whichever ships needs its forename in the name field to keep them apart.

**4.7 John Spencer House** (1080 Haight, −122.4402) sits within a block or so of
the Baker Street line and I cannot call it. Wikipedia's NRHP table labels it
Haight-Ashbury; the coordinate is marginal.

**4.8 Grattan Playground and Mount Olympus** are both south of Frederick Street
(Cole Valley and Ashbury Heights respectively) but both are labelled "Haight
Ashbury" by DataSF. Note the roster's own draw for this zone names "the Victorians
of Ashbury Heights", which reads as the roster intending Ashbury Heights to be in
scope — that would pull Mount Olympus in and is the arbitrator's call, not mine.

---

## 5. Least confident candidates

**5.1 710 Ashbury Street.** The single most famous address in the zone and the
one I have the least paper on. Not in Article 10, not in the National Register,
absent from the Grateful Dead article, no Wikipedia page of its own. Everything I
can find is travel-blog repetition. A guide can say a private house stands at 710
Ashbury Street and little else honestly. **Recommend: do not ship until a finder
produces a real source** — a Planning historic context statement, a *Chronicle*
piece, or the Sixties counterculture HCS that `rzic-39gi` alludes to in its
"Counter-culture HCS" context field.

**5.2 The Red Victorian, 1665 Haight Street.** Wikipedia gives one sentence and
no facts; its own domain did not resolve; the business register confirms only
that "Red Victorian LLC" is registered there. I have no build year, no architect,
no founding date, and no confirmation of what it currently operates as — hotel,
hostel, or co-living have all been true of it at different times. Shipping it as
a `hotel` asserts a trading status I have not established.

**5.3 Richard Spreckels Mansion, 737 Buena Vista Avenue West.** No designation of
any kind, no Wikipedia article, nothing but a geocode. Given 4.6, the risk is not
only thinness but active confusion with a building another zone is writing about.
If it ships it needs a real source and an unambiguous name.

Honourable mention: **John A. Whelan House** has an impeccable identifier (NRHP
100005794) and almost no content — a private house with a reference number and no
narrative, because the NPGallery nomination PDF endpoint timed out on every
attempt. It would pass the designation gate and bore the reader.

---

## 6. Shape of the page: town-page, not a guide

The designated material here is overwhelmingly **private houses and offices you
can only look at from the pavement**: the Chautauqua House is zoned RH-2, Hose
Company #30 is offices, the Phelps, Mish, Hinkel, Whelan and Spencer houses are
residences, Maud's closed in 1989, the Free Clinic closed in 2019, and the
Doolan-Larson Building is mid-RFP with no public access. Of the whole
designated set, exactly one property — the Stanyan Park Hotel — is somewhere a
visitor can go inside, and its identifier is for the building rather than the
business.

What a visitor actually does here is walk one commercial street and go into
shops. That is a town-page shape: a place list with entries, anchored on Amoeba
Music, Buena Vista Park and the Haight/Ashbury corner, with the designated
houses as `historic-site` entries written for the pavement. A guide with tours
and walks would have to invent itineraries between buildings nobody can enter,
and the proximity ban removes most of the connective language a walking route
needs. **Recommend town-page.**

---

## 7. Gate notes for whoever authors this

Traps I hit while reading `san_francisco_seed_data_test.exs`:

- `@designation_claim` fires on the bare words **`landmark`, `listed`,
  `designated`, `registered`, `nominated` anywhere in a string**, and any string
  that matches must also match `@designation_citation`. So an innocent sentence
  like "the shop is listed in the neighbourhood directory" or "a landmark of the
  counterculture" — the phrase SF Heritage's own site uses about Doolan-Larson —
  **fails the build**. Rephrase around the word or add the number.
- The superlative regex's comparison-class list does not include "America",
  "the United States", "the West Coast" or "the world". Several true, sourced
  claims in my material are rankings that the regex would let through: Alvord
  Lake Bridge "first in America", the Free Clinic "first of more than 600", Cole
  Valley "smallest neighborhood in the city" (this one *is* caught), Maud's "one
  of San Francisco's most popular and longest running lesbian bars" (caught by
  the `one of the most` pattern). **The ban is on the practice; do not lean on
  the regex.**
- The 2026 designation ordinances are written in exactly the superlative register
  the gate forbids. Quote their facts, never their adjectives.
- `"photos": []` everywhere. For the record: Article 10 supplies a photograph for
  every landmark at `https://sfplanninggis.org/Preservation/Landmarks/Large/<no>.jpg`
  — 32, 62, 190, 253, 324, 328, 331 all exist. These are City-produced images of
  **buildings**, so 17 USC 120(a) is not the obstacle; their licence is, and I did
  not establish it. Flagged for the photo wave, not resolved.
- Street-name origin is **contested between two Wikipedia articles**: the
  Haight-Ashbury article says Haight Street commemorates **Henry** Haight,
  "pioneer and exchange banker", citing the Museum of the City of San Francisco;
  the Haight Street article says it is named for **Weltha** Haight, "who for
  decades helped run the San Francisco Protestant Orphan Asylum". Both cannot be
  right. Ashbury is uncontested: **Munroe Ashbury, a member of the Board of
  Supervisors from 1864 to 1870** (Loewenstein, *Streets of San Francisco*, 1984,
  p. 5). **Do not write the Haight etymology without resolving it.**

## 8. Sources that answered, and that did not

Answered: DataSF Socrata (`data.sfgov.org`, with `search_context`), SF Planning
GIS (`sfplanninggis.org`), the Board of Supervisors designation PDFs via
`citypln-m-extnl.sfgov.org`, the NPS ArcGIS NRHP service
(`mapservices.nps.gov`), Wikipedia (rate-limited, works in batches via
`action=query`, not the per-page REST summary endpoint), Nominatim (rate-limited,
and its SF neighbourhood labels are wrong), `stanyanpark.com`,
`magnoliabrewing.com`, `haightandashbury.org`.

Did not: `amoeba.com` and `booksmith.com` (HTTP 403), `redvic.net` and
`aubzamzam.com` (no resolution), NPGallery nomination-document downloads
(`npgallery.nps.gov/NRHP/GetAsset/...` — one 2.4 MB PDF succeeded in 90s, the
next three timed out at 180s), `sfheritage.org/doolan-larson/` (404 — the live
page is `haightandashbury.org`).
