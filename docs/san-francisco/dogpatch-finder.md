# Dogpatch — Finder's Research File

Zone: `dogpatch` · destination `Dogpatch, California` · town `San Francisco`
Roster draw: "The Minnesota Street Project, Museum of Craft and Design, the Pier 70 historic yard,
Esprit Park, the surviving workers' cottages."

Compiled 2026-09-03. Everything below is candidate material for a verifier and an arbitrator.
Nothing here is an ownership ruling. Where a fact has no URL, it has no fact.

---

## 0. RESERVATION CHECK — and the defect in the checking tool

`python3 .superpowers/taken_slugs.py dogpatch` returns **0 matches**, and `pier` returns two Rome
places. That is a true negative but a nearly worthless one, because the script only globs
`priv/seed_data/rome/*.json`:

```python
for f in sorted(glob.glob("priv/seed_data/rome/*.json")):
```

It never loads `priv/seed_data/san_francisco/*.json`, which on disk holds twelve shipped
neighborhood files (castro, chinatown, fishermans-wharf, haight-ashbury, hayes-valley, marina,
mission, nob-hill, north-beach, pacific-heights, russian-hill, soma). I therefore checked the San
Francisco files directly rather than trusting the tool.

**ONE LIVE COLLISION RISK, and it is a real one.**

`Ethos.Seeds.OracleParkPlaces` owns the slug **`arsicault-bakery-mission-rock`** with town
"San Francisco". The San Francisco business registry lists **Arsicault Bakery at 2565 3rd St
Ste 202** — inside the American Industrial Center, squarely in Dogpatch, registered from
2024-08-14 (DataSF `g8m3-pdis`). These are two locations of the same operator. A Dogpatch page
that writes up the 3rd Street bakery would put "Arsicault Bakery" in the corpus twice under
different slugs, which is the collision-by-name-wearing-a-hat case the tool's own docstring warns
about. **I am not claiming it. Flagged to the arbitrator.** If it is allowed at all it needs a
slug that says which shop it is, and the Mission Rock code seed must not be restated.

Otherwise: no candidate below collides with any shipped San Francisco slug, and the other six
Oracle Park code-seed slugs (oracle-park, reds-java-house, momos-san-francisco,
flour-and-water-pizza-shop-mission-rock, blue-bottle-coffee-mission-rock, china-basin-park) are
untouched.

---

## 1. THE BOUNDARY PROBLEM, WHICH IN DOGPATCH IS THE WHOLE PROBLEM

Dogpatch is the zone in this wave where the official layers and the vernacular disagree most
sharply, and where the disagreement changes which places exist. I used **five** locators and record
every one rather than averaging them.

**(a) DataSF Analysis Neighborhoods — `j2bu-swwd`, 41 polygons.**
**There is no Dogpatch.** I listed all 41 `nhood` values: the ground under Dogpatch is labelled
**Potrero Hill**, north of Mariposa it is Mission Bay, south of Cesar Chavez it is Bayview Hunters
Point. Every single candidate I geocoded returns `ana=Potrero Hill`. The city's principal
statistical geography does not recognise this zone at all.
https://data.sfgov.org/resource/j2bu-swwd.json

**(b) DataSF Enterprise Addressing System — `3mea-di5p`.** Per-address, exact at a parcel, carries
an `nhood` field. It uses the same 41 Analysis Neighborhoods, so it returns "Potrero Hill" for
every Dogpatch address. Useful for coordinates and address validation, useless for this zone's
identity. https://data.sfgov.org/resource/3mea-di5p.json

**(c) DataSF SF Find Neighborhoods — `gfpk-269f`, 117 polygons.** This one *does* carry a
**Dogpatch** polygon, and it is narrow: bounding box **-122.39274 / 37.75515 to -122.38707 /
37.76438**. Roughly Indiana–Illinois, 18th–25th. It is bordered on the east and south by a separate
polygon named **Central Waterfront**. https://data.sfgov.org/resource/gfpk-269f.json

**(d) The Article 10 Dogpatch Historic District polygon — SF Planning, DataSF `m22e-6hkz`.** The
legally drawn boundary, bbox **-122.39141 / 37.75615 to -122.38808 / 37.76342**. Smaller again:
essentially the Tennessee/Minnesota/22nd/Indiana residential blocks.

**(e) DataSF Recreation & Parks properties — `gtr9-ntp6`.** Carries four independent neighborhood
fields per property. Esprit Park returns `mons_neighborhood: Dogpatch`,
`realtor_neighborhood: Central Waterfront/Dogpatch`, `analysis_neighborhood: Potrero Hill`,
`planning_neighborhood: Potrero Hill` — four fields, three different answers, in one row of one
dataset. https://data.sfgov.org/resource/gtr9-ntp6.json

**Against all five, the vernacular Dogpatch is far larger:** Mariposa Street north, I-280 west,
Cesar Chavez south, the waterfront east
(https://en.wikipedia.org/wiki/Dogpatch,_San_Francisco). The Museum of Craft and Design's own
site says it sits "in the historic American Industrial Center in San Francisco's vibrant Dogpatch
neighborhood" (https://sfmcd.org/visit/); the Port of San Francisco's own Warm Water Cove page
places that park "in the Dogpatch neighborhood" (https://sfport.com/warmwatercove). Both of those
sit OUTSIDE at least one official Dogpatch polygon.

**Consequence the arbitrator must rule on: on the tightest reading (d), Dogpatch is nine
residential blocks and owns almost none of its own draw. On the widest reading, it owns Pier 70,
the Potrero Power Station, Crane Cove Park and Warm Water Cove — which Mission Bay and a
Central Waterfront that has no page would otherwise touch.** I have not resolved it. Every
straddler is flagged in §5.

---

## 2. DESIGNATIONS — verified against the live registers today

I re-fetched every number rather than copying it. **I have not tallied them anywhere in the prose
below and neither should the page.**

### 2.1 Districts

**Dogpatch Historic District** — Article 10 of the San Francisco Planning Code, **Appendix L**,
**Ordinance 66-03**, adopted **2003-04-18**. Period of significance 1867–1945. Boundary bbox as in
§1(d). SF Planning's own summary: "an approximately nine-block enclave of industrial workers'
housing located east of Potrero Hill, in San Francisco's Central Waterfront district. The
neighborhood is comprised of almost one-hundred flats and cottages, as well as several industrial,
commercial, and civic buildings, most of which were erected between 1870 and 1930."
Source: https://data.sfgov.org/resource/m22e-6hkz.json (objectid 171), code text at
https://codelibrary.amlegal.com/codes/san_francisco/latest/sf_planning/0-0-0-28614#JD_Article10AppendixL

> **CONFLICT TO RESOLVE.** Wikipedia says the district was designated **in 2002**
> (https://en.wikipedia.org/wiki/Dogpatch,_San_Francisco). SF Planning's dataset says
> **2003-04-18** and cites **Ord. 66-03**, whose numbering is consistent with 2003. I would carry
> 2003 and the ordinance number, and I would not carry the year alone.
>
> **DO NOT WRITE A CONTRIBUTOR COUNT.** The dataset carries `total_prop: 129`,
> `contributors: 97`, `non_contrib: 32`. That is a live row in a dataset that gains and loses
> properties, not a fact about the place, and it is exactly the tally wave 1's arbitrator banned.
> Name the buildings.

**Union Iron Works Historic District** — **National Register of Historic Places, reference number
14000150, listed 17 April 2014.** Address of record "E. of Illinois between 18th & 22nd Sts.",
period of significance 1884–1945. Polygon bbox -122.38779 / 37.75762 to -122.3792 / 37.76494 —
i.e. the Pier 70 yard, east of Illinois Street.
Verified three ways: the SF Planning district dataset (objectid 144, `nr: Listed`,
`origin: Ref Number: 14000150`, `dateadop: 2014-04-17`); the Wikipedia NRHP listing table for San
Francisco, which gives 17 April 2014 and #14000150; and the National Register nomination itself,
which returns HTTP 200 as a PDF at
https://npgallery.nps.gov/NRHP/GetAsset/NRHP/14000150_text (54.9 MB — too large to parse in this
session; the reference number resolves, the contents were not read).

> **NOTE for the verifier:** this district did NOT appear in the NPS `nrhp_locations` point layer
> or its polygon layer when queried by bbox and by name. Its absence from that layer is a gap in
> the NPS GIS service, not evidence against the listing — three other sources agree on the number
> and the date.

### 2.2 Individual designations

| Place | Register | Identifier | Date | Address |
|---|---|---|---|---|
| Irving Murray Scott School | NRHP | **85000714** | listed **11 April 1985** | 1060 Tennessee St |
| Irving M. Scott School ("The Potrero School") | San Francisco Landmark | **No. 138** | designated **1981** | 1060 Tennessee Street |
| Alberta Candy Factory | NRHP | **100006997** | listed **22 September 2021** | 555 19th St |
| Bethlehem Shipbuilding Corporation Hospital | NRHP | **100008498** | see conflict below | 331 Pennsylvania Ave |

Sources: NPS `nrhp_locations` layer 0 queried by bbox and by refnum
(https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0/query);
DataSF Article 10 landmarks `97yj-54sx` (landmarkno 138, name "The Potrero School", address
"1060 Tennessee Street", yeardesignated 1981, designation document
https://files.sfplanning.org/documents/preservation/LM138.pdf);
https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_San_Francisco

> **DATE CONFLICT, unresolved.** The NPS layer gives the Bethlehem Shipbuilding Corporation
> Hospital a `CertDate` of **01/06/23**. Wikipedia's NRHP table gives **29 December 2022**. Wave 1
> found exactly one wrong certification date by doing this; here are two sources that disagree by
> eight days. If this place ships, the verifier must settle it against the nomination or the
> weekly list, and until then no date should be printed. **This building is also a straddler —
> 331 Pennsylvania Ave geocodes to SF Find "Potrero Hill", not Dogpatch (§5).**

### 2.3 What is NOT a designation, and must not be dressed as one

The **Third Street Industrial District** (SF Planning survey, Central Waterfront Survey) is
`cr: Eligible`, `nr: No`, `a10: No`. Most of the Third Street businesses below sit inside its
polygon. **Eligible is not listed.** It carries no register identifier and it does not publish as a
protection claim. Same for the **Bridges and Tunnels** district (`Eligible`) and the
**SF General Hospital Historic District** (`Eligible`). Source: `m22e-6hkz`.

---

## 3. CANDIDATES — anchors

### 3.1 Museum of Craft and Design — museum
**2569 Third Street, San Francisco, CA 94107.** Between 22nd and 23rd.
Thursday–Sunday 12:00–17:00, closed Monday–Wednesday. General admission $10; students, seniors 65+
$8; children under 12 and members free. Free admission on the first Thursday of each month. The
museum occupies space "in the historic American Industrial Center". The T Third Muni Metro and
bus lines 48, 15 and 55 stop within one block.
Source (operator): https://sfmcd.org/visit/
Registered as "Museum Of Craft & Design", 2569 Third St, location start 2013-04-30, no end date —
https://data.sfgov.org/resource/g8m3-pdis.json
Locators: SF Find **Dogpatch**; Analysis Neighborhood Potrero Hill; inside the Third Street
Industrial District survey polygon (eligible only, no designation claim).
*Do not write "opened in spring 2013" from Wikipedia as a trading-duration claim; the registry
date is a registration date, not an opening date.*

### 3.2 Minnesota Street Project — attraction (gallery complex)
Three addresses on the operator's own site: **1275 Minnesota Street** (galleries), **1150 25th
Street**, **1201 Minnesota Street**. Galleries named on the site: Casemore Gallery, Themes +
Projects, Ruth Asawa Lanier Inc., Hashimoto Contemporary / Harman Projects, Municipal Bonds, Nancy
Toomey Fine Art. A separate **Studios** building at **1240 Minnesota Street**. The site publishes
no regular hours, only closure notices.
Source (operator): https://minnesotastreetproject.com/ and https://minnesotastreetproject.com/studios
Registry confirms five open locations under "Minnesota Street Project LLC": 1150 25th St
(2015-12-01), 1275 Minnesota St (2015-12-01), 1240 Minnesota St (2016-05-01), 1031 25th St
(2021-12-01), 1405 Indiana St (2022-12-01).
Individual galleries registered at 1275 Minnesota St and open: Nancy Toomey Fine Arts, Casemore
Gallery (#102), Rena Bransten Gallery (#210), Eleanor Harwood Gallery (Rm 206), Jenkins Johnson
Gallery (Ste 200).
**STRADDLER — the sharpest one in the zone.** 1275 Minnesota (-122.38938, 37.75425) and 1240
Minnesota (-122.39039, 37.75461) both geocode to SF Find **"Central Waterfront"**, NOT Dogpatch,
and both fall OUTSIDE the Article 10 Dogpatch Historic District polygon. Two of the five official
readings put the zone's marquee arts institution outside the zone. See §5.

### 3.3 Letterform Archive — museum
**2325 Third Street, Floor 4R, San Francisco, CA 94107** (the operator also gives 2339 Third St;
the entrance is 2325). Thursday 13:00–20:00, free to all; Friday 11:00–18:00; Saturday–Sunday
11:00–13:30 and 14:00–18:00; closed Monday–Wednesday. Admission $10 general; $5 students, seniors,
educators and people with disabilities; children 12 and under free; members free. A graphic-design
and typography archive with a public gallery and a reading room; collections named on the site
include Piet Zwart, W.A. Dwiggins, Emigre and Linotype master drawings.
Source (operator): https://letterformarchive.org/visit/
Registry: "Letterform Archive", 2339 3rd St Ste 70, location start 2020-10-01, open.
Locators: SF Find **Dogpatch**; inside the Third Street Industrial District survey polygon.
**This is the strongest un-briefed find in the zone** — a ticketed, hours-published cultural
institution the roster draw did not name.

### 3.4 Irving M. Scott School — historic-site
**1060 Tennessee Street.** Built 1895. **San Francisco Landmark No. 138**, designated 1981, listed
in the Article 10 dataset under the name "The Potrero School". **National Register of Historic
Places, reference number 85000714, listed 11 April 1985.** Coordinates -122.38956, 37.75840; sits
INSIDE the Article 10 Dogpatch Historic District polygon — the only one of the four individual
designations that does.
Sources: https://data.sfgov.org/resource/97yj-54sx.json (landmarkno 138);
NPS layer 0 (RESNAME "Scott, Irving Murray, School", CertDate 04/11/85, NumCBldg 1);
https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_San_Francisco
Current occupants registered at 1060 Tennessee St: Omega Boys Club (from 1987-10-01) and the Jem
Foundation.
> **BANNED PHRASING FOUND IN THE SOURCES.** Both Wikipedia's NRHP table ("Oldest surviving public
> school building in the city") and the neighborhood article ("oldest public school building in
> San Francisco") state a superlative. **It does not publish, attributed or not.** Write the date
> and the two designation numbers instead.

### 3.5 Esprit Park — park
**700 Minnesota Street, San Francisco, CA 94107.** **2.23 acres / 97,117 square feet**, perimeter
1,286 feet. Owned by San Francisco Recreation & Park; property type "Neighborhood Park or
Playground"; property_id 193; part of the Mission Bay Complex; Supervisorial District 10.
Source: https://data.sfgov.org/resource/gtr9-ntp6.json (objectid 4133)
Locators: SF Find **Dogpatch**; `mons_neighborhood` **Dogpatch**; `realtor_neighborhood`
"Central Waterfront/Dogpatch"; Analysis and Planning neighborhoods "Potrero Hill". It is the ONLY
Rec & Park property in the city whose `mons_neighborhood` reads Dogpatch. It falls OUTSIDE the
Article 10 historic district polygon (it is west of Minnesota Street).
**Weak point:** Wikipedia says the land "was donated to the city by Esprit Corp." I could not
corroborate that from Rec & Park or any city source, and sfrecpark.org's facility pages are
JavaScript-rendered and returned the wrong park for every URL pattern I tried. A gift claim needs a
city source before it publishes. The acreage and the ownership are solid; the origin story is not.

### 3.6 Pier 70 and the Union Iron Works yard — historic-site
The yard east of Illinois Street between 18th and 22nd. **National Register of Historic Places,
reference number 14000150, listed 17 April 2014**; period of significance 1884–1945; SF Planning's
record describes it as sixty-six acres at Potrero Point, bordered by San Francisco Bay, with
"buildings, piers, slips, cranes, segments of a railroad network, and landscape elements", most
"constructed of unreinforced brick masonry, concrete, and steel framing with corrugated iron or
steel cladding."
Source: https://data.sfgov.org/resource/m22e-6hkz.json (objectid 144)
Named structures I could source, all from Wikipedia and therefore **thinner than I want**:
a 1917 Bethlehem office building by Frederick Meyer in Renaissance Revival; Power House No. 1 of
1912 by Charles P. Weeks; a Union Iron Works office of 1896 by Percy & Hamilton; machine shops of
1885. https://en.wikipedia.org/wiki/Pier_70,_San_Francisco
**I could not get building numbers.** The Port of San Francisco has no live Pier 70 page — every
URL pattern I tried returned 404 — and pier70sf.com (Brookfield) publishes leasing copy with no
building numbers, no addresses and no architects. The 55 MB National Register nomination is the
place those numbers live and it exceeded every fetch limit available to me.
**Recommendation: ship the district with its reference number and its date, and ship at most the
four buildings above with architect and year, or ship none of them.** Do not invent a building
number. **STRADDLER — the whole yard is in SF Find "Central Waterfront", not Dogpatch (§5).**

### 3.7 Crane Cove Park — park
**18th Street and Illinois.** The Port of San Francisco calls it a "seven-acre bay front park";
Wikipedia gives 7 acres and says it opened in 2020. Port-published features: a beach with water
access for kayaking and paddleboarding (wading permitted in designated areas, swimming
prohibited), lawns with picnic tables, benches and grills, two children's play areas, an off-leash
dog run, a promenade and a lookout deck. Wikipedia adds two historic cranes named **Nick and
Nora**, a large sloped concrete ramp to the water carrying the outlines of ships launched there,
and an outline marking a segment of the BART Transbay Tube built and launched at the site.
Sources: https://sfport.com/cranecovepark ; https://en.wikipedia.org/wiki/Crane_Cove_Park
Locators: falls INSIDE the Union Iron Works Historic District polygon; SF Find **Central
Waterfront**. **STRADDLER (§5).**
**Weak point:** the opening year, the crane names and the Transbay Tube outline are Wikipedia-only.
The Port's own page mentions none of them. The seven acres and the amenity list are Port-sourced
and safe.

### 3.8 Warm Water Cove Park — park
**24th Street.** The Port of San Francisco describes it as within "the industrial central
waterfront", part of the Blue Greenway, with "a paved pathway that navigates through a grove of
trees, a picnic table and seating." The Port's own page places it "in the Dogpatch neighborhood."
Source: https://sfport.com/warmwatercove
Locators: outside every Dogpatch polygon I have. The operator says Dogpatch; the city's map says
Central Waterfront. **STRADDLER (§5).** No acreage published.

### 3.9 Alberta Candy Factory — historic-site
**555 19th Street.** **National Register of Historic Places, reference number 100006997, listed
22 September 2021.** Wikipedia's NRHP table assigns it the neighborhood "Dogpatch"; EAS geocodes
555 19th St to -122.38814, 37.76162, which SF Find places in **Dogpatch** — the two agree, which is
rare in this zone. Inside the Third Street Industrial District survey polygon (eligible only).
Sources: https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_San_Francisco ;
https://data.sfgov.org/resource/3mea-di5p.json
**Weak point:** I have the designation and nothing else — no construction date, no architect, no
account of what the building is now. The registry shows "Giga Ai, Inc." at 555 19th St from
2023-06-08 and a "555 19th St Bldg" record from 1969. A travel guide needs more than a reference
number. **A verifier should either find the nomination or this ships as one sentence.**
*Note the geocoding trap: querying EAS for `555 19TH` without a street type returns 555 19th
AVENUE in the Outer Richmond. The street_type filter is not optional in this dataset.*

---

## 4. CANDIDATES — the trading places

All confirmed open in the San Francisco Registered Business Locations dataset
(https://data.sfgov.org/resource/g8m3-pdis.json) with **no `location_end_date`**, and all geocoding
to SF Find **Dogpatch** unless noted. Where an operator's own site answered, its address and hours
are quoted from that site and marked (own site). Where only the registry answered, the place has a
name and an address and nothing else, and I have said so.

**Registration is not proof of trading — see the ICA SF failure in §6.** Treat a registry-only row
as a lead, not a confirmation.

### Eating and drinking
| Place | Address | What I have |
|---|---|---|
| Piccino | 1001 Minnesota St | (own site) Wed–Sun from 17:00; Wed–Fri from 11:00; Sat–Sun from 11:00. Site also prints 1003 Minnesota. Registry from 2011-05-03. https://piccinocafe.com/ |
| Long Bridge Pizza Company | 2347 3rd St | (own site) "2347 3rd Street San Francisco CA". No hours published. Registry from 2014-01-22. https://www.longbridgepizza.com/ |
| Giuliana's Just For You Cafe | 732 22nd St | (own site) "732 22nd Street in Dogpatch"; Mon–Fri from 7:30, Sat–Sun from 8:00. Two registry rows at this address, 2008 and 2023. https://www.justforyoucafe.com/ |
| Wolfsbane | 2495 3rd St | (own site) "2495 Third Street SF"; Tues–Sat from 17:30; walk-ins at the bar table. Registry from 2025-03-13. https://www.wolfsbanesf.com/ |
| Souvla | 2505 3rd St | Named as a location on the operator's own locations menu ("Dogpatch"). Registry: Souvla 2022-03-24 and Souvla Dogpatch LLC 2023-01-01. https://www.souvla.com/ |
| Butter& | 690 Indiana St | (own site) "690 Indiana St San Francisco"; Sun from 10:00, Mon closed, Tues–Sat from 10:00. Registry from 2022-06-21. https://www.butterand.com/ |
| Kin Khao Eatery | 690 Indiana St | (own site) hours published Mon–Sun from 11:30, dinner from 17:30. Registry from 2020-08-01. Shares the 690 Indiana address with Butter&. https://www.kinkhao.com/ |
| Humphry Slocombe | 699 22nd St | (own site) scoop-shop page lists 699 22nd St with hours. Registry from 2023-04-06. https://humphryslocombe.com/pages/scoop-shops |
| Wooly Pig | 2295 3rd St | (own site) "2295 3rd St San Francisco". Registry from 2018-01-30. https://www.woolypigsf.com/ |
| Dogpatch Saloon | 2496 3rd St | Registry only, from 2012-08-15. **Every domain I tried is dead.** No hours, no operator source. |
| Third Rail | 628 20th St | Registry from 2012-08-03. A live page at thirdrailbar.com gave "Monday to Saturday: 4pm / Sunday: 1pm" but published no address. Two sources, neither complete. |
| Marcella's Lasagneria e Cucina | 1099 Tennessee St | Registry from 2014-07-01; a second row "Marcellas At Dogpatch Games" from 2024-07-25. Own domain now serves placeholder text. **Inside the Article 10 district polygon.** |
| Gilberth's Latin Fusion | 2427 3rd St | Registry from 2017-05-26 (also "Habanero SF" and "GLF" at the same address). Site returned 403. |
| Ungrafted | 2419 3rd St | Registry from 2018-09-19. Site returned 403. |
| Daily Driver | 2535 3rd St | Registry from 2017-12-01. Domain dead. |
| The Cheese School | 2535 3rd St | Registry from 2023-01-01. Domain dead. |
| Domaine SF | 2331 3rd St | (own site) "2331 3rd Street San Francisco"; describes itself as artisanal wines and grazing boards, "Pick-up in Dog Patch". Registry from 2024-11-01. |
| Aura Lounge & Restaurant | 2368 3rd St | Registry only, from 2017-12-11. |
| The Sea Star | 2289 3rd St | Registry only, from 2015-07-03. Domain dead. |
| Together Lounge | 2490 3rd St | Registry only, from 2025-07-07. Occupies the address the closed Yield Wine Bar had. |
| Moshi Moshi | 2092 3rd St | Registry from 1985-06-01. **NORTH-EDGE STRADDLER (§5).** *The 1985 registry date is a registration date; it does NOT publish as a trading-duration claim.* |
| Honey Bear Boba | 801 22nd St | Registry from 2020-12-01. **Inside the Article 10 district polygon.** |
| Corgi Cafe | 680 Illinois St / 2146 3rd St | Two registry rows, both 2026-07-27. Very new; unverified. |
| Autumn's Cafe | 2071 Third St | Registry from 2025-06-04. **North-edge straddler.** |
| Reno Liquors | 728 22nd St | Registry from 2005-01-02. |
| Mainstay Markets | 655 22nd St | (own site) "655 22nd Street San Francisco". Registry from 2019-10-28. |
| Gamsaan Cocktail Co. | 2580 3rd St | Registry from 2020-06-17. Site loaded empty. |
| Bay Area Brewery Tours | 1128 Tennessee St Ste 1 | Registry from 2014-02-01. A tour operator, not a place — probably not a guide entry. |

### Making, selling, showing
| Place | Address | What I have |
|---|---|---|
| Graphic Arts Workshop | 2565 3rd St #305 | (own site) "2565 3rd St. #305 San Francisco, CA 94107. Open to the public Friday and Saturday from noon to 5 pm". Registry from 2000-01-01. A printmakers' co-operative gallery. https://www.graphicartsworkshop.org/ |
| Recchiuti Confections | 2565 3rd St Ste 225 | Registry from 2003-01-02; live corporate site publishes no Dogpatch address. Chocolate maker. |
| Velocipede Cyclery | 2405 3rd St | (own site) "2405 3rd Street San Francisco". Registry from 2024-08-01. |
| Bryr (clogs) | 1080 Illinois St | Registry from 2022-08-01; live shop site publishes no visiting address. |
| Rickshaw Bagworks | 904 22nd St | Registry from 2008-06-25. Site is a JavaScript shell. **Inside the Article 10 district polygon.** |
| Baggu | 2415 3rd St (Ste 238/239) | Three registry rows, 2017 and 2022 and 2025. No store page reachable. |
| Belinda Chocolates | 918 Minnesota St #A | Registry from 2013-07-19. **Inside the Article 10 district polygon.** |
| Volcano Kimchi | 1074 Illinois St | Registry from 2023-12-01. Site is one line of text. |
| Olivier's Butchery | 1192 Illinois St | (own site) "1192 Illinois St San Francisco CA"; Wednesday from 11:00, Thursday–Sunday from 10:00. Registry from 2026-01-01. https://www.oliviersbutchery.com/ |
| Dogpatch Boulders (Touchstone) | 2573 3rd St | (own site) "2573 3rd Street San Francisco". Registry as "Dog Patch Boulders" from 2013-03-15. Climbing gym. |
| 3rd St Gym | 2576 3rd St | Registry from 2003-01-14. Boxing gym; Wikipedia mentions "a boxing gym for local amateurs" without naming it. |
| Dogpatch Games | 1095 Tennessee St | Registry from 2021-08-02. Domain dead. **Inside the Article 10 district polygon.** |
| The Pearl / Nick & Nora / Side Hustle / School Night | 601 19th St | (own site) "601 19th Street San Francisco" — an events venue with several named rooms. Registry rows from 2014 to 2018. Venue rather than a visitor attraction; flag for the verifier. |
| American Industrial Center | 2325 / 2345 / 2415 / 2475 / 2523 / 2565 3rd St | Registered as a business 2011-04-01. The multi-block complex that houses the Museum of Craft and Design, Letterform Archive, Graphic Arts Workshop, Recchiuti, B Patisserie and dozens of studios. **I could find no sourced construction date, architect or original use.** Wikipedia has no article. It appears in the guide only as the address of things inside it unless someone sources it properly. |
| La Scuola International School | 728 20th St | (own site) "728 20th Street San Francisco". Registry from 2012-08-01. A school; almost certainly not a guide entry, recorded so nobody re-finds it. |

### Confirmed closed — do not write these
| Place | Address | Registry `location_end_date` |
|---|---|---|
| Serpentine | 2495 3rd St | 2017-04-03. The domain serpentinesf.com now serves an unrelated foreign-language blog. Wolfsbane occupies the address. |
| Neighbor Bakehouse | 2343 3rd St Ste 100 | 2022-09-11. The domain neighborsf.com now sells novelty balloons. |
| Triple Voodoo Brewery & Taproom | 2245 3rd St | 2020-12-31. |
| Workshop Residence | 833 22nd St | 2020-09-01. |
| Poquito | 2368 Third St | 2016-12-23. |
Every one of these is still listed as a Dogpatch destination by third-party guides. Each was
caught only because the registry carries an end date. **Any candidate below that rests on the
registry alone could be in the same state and simply not yet flagged.**

---

## 5. STRADDLERS — flagged, NOT resolved

The arbitrator has all eleven zones; I have one. These are the contested ones, with the evidence on
each side.

1. **Minnesota Street Project (1275 / 1240 / 1201 Minnesota, 1150 & 1031 25th, 1405 Indiana).**
   SF Find says **Central Waterfront**. Article 10 district: outside. Analysis Neighborhood:
   Potrero Hill. The roster draw names it as Dogpatch's, its street address is Minnesota Street,
   and every visitor-facing source calls it Dogpatch. **Contested against: nothing — no other zone
   in this wave claims it. Central Waterfront has no page.** If Dogpatch does not take it, nobody
   does.
2. **Pier 70, the Union Iron Works district, and Crane Cove Park.** SF Find: **Central
   Waterfront**. NRHP address of record: "E. of Illinois between 18th & 22nd Sts.", city given as
   **Potrero Point**. Wikipedia's Pier 70 article places the complex "in the Dogpatch
   neighborhood". Vernacular Dogpatch (Mariposa/I-280/Cesar Chavez/waterfront) contains it.
   **Contested against Mission Bay only at the far north; mostly it is Dogpatch or nobody.**
3. **Warm Water Cove Park (24th Street).** The Port's own page says Dogpatch. Every city polygon
   says otherwise. Sits south of the Article 10 district and outside SF Find's Dogpatch.
4. **Bethlehem Shipbuilding Corporation Hospital, 331 Pennsylvania Ave (NRHP 100008498).** SF Find
   and Wikipedia both say **Potrero Hill**. Potrero Hill was DECLINED as a zone with the reason
   "Adjacent to Dogpatch, which took the industrial-heritage material." That reason arguably hands
   this building to Dogpatch; its address and both locators argue it out. **This is the cleanest
   test of what the Potrero Hill decline actually meant, and I am not the one to decide it.**
5. **The north edge — Mariposa to 20th.** Moshi Moshi (2092 3rd St), Autumn's Cafe (2071 Third
   St), The Gantry (2121 Third St), Tercera (2152 Third St), The Cove (2002 3rd St) all geocode to
   SF Find Dogpatch but sit north of the Article 10 district and within a block or two of the
   Mission Bay line. **Contested against Mission Bay**, which is a live zone in this wave.
6. **The south edge — 25th to Cesar Chavez.** Harmonic Brewing (1050 26th St) and The Midway (900
   Marin St) both geocode to SF Find **Central Waterfront** with Analysis Neighborhood **Bayview
   Hunters Point**. Vernacular Dogpatch reaches Cesar Chavez and would include the first.
   Neither zone that would otherwise claim them has a page.
7. **Potrero Power Station / Station A, 1201 Illinois St.** SF Find: Central Waterfront. Inside the
   Third Street Industrial District survey polygon. I gathered no sourced facts about it and list
   it only so the arbitrator knows it exists on the contested ground.
8. **22nd Street Caltrain station, 1150 22nd St.** SF Find: **Potrero Hill**. It is the station
   most guides call Dogpatch's. Caltrain's own station page 404'd on every URL I tried.
9. **Arsicault Bakery, 2565 3rd St Ste 202.** Not a zone straddler but a **corpus collision** with
   the `arsicault-bakery-mission-rock` code seed. See §0.

---

## 6. WHAT I GOT WRONG BEFORE I GOT IT RIGHT — read this before trusting §4

**The Institute of Contemporary Art San Francisco is not in Dogpatch and I nearly shipped it as
Dogpatch's second museum.** The business registry lists "Institute Of Contemporary Art San
Francisco" at **901 Minnesota St**, location start 2022-06-01, **no end date**. SF Find puts 901
Minnesota inside Dogpatch AND inside the Article 10 historic district. Every locator said yes.

Its own site says otherwise: the visit page is headed "**ICA SF in Yerba Buena**", places the
museum at the **Transamerica Pyramid Center** with exhibitions on Mission Street between 4th and
5th, and states that "ICA SF is always free." https://icasf.org/visit/

The museum has left the zone; the registry has not caught up. **This is the single most important
methodological result in this file: a `location_end_date` of null means the tax registration is
open, not that the door is.** Every registry-only row in §4 carries this risk and none of them
should ship without an operator source or a verifier's own check.

Two smaller corrections, recorded so they are not repeated:
- Querying DataSF EAS for `555 19TH` without `street_type='ST'` returns **555 19th Avenue, Outer
  Richmond** — a place 5.5 km away in a different zone. Every EAS query in this file uses the
  street type.
- `taken_slugs.py` reported "0 places already owned" for Dogpatch while loading none of the twelve
  shipped San Francisco files. See §0.

---

## 7. WHAT I COULD NOT GET

Recorded so the verifier does not spend the same hours. **None of this is reader-facing text.**

- **Pier 70 building numbers, addresses and architects.** The National Register nomination
  (14000150) is a 54.9 MB PDF; the Port has no live Pier 70 page; the developer's site publishes
  leasing copy only.
- **The Article 10 Appendix L text**, including the legal boundary description and the list of
  contributing buildings. The American Legal Publishing page is a JavaScript shell; the appendix
  body is not in the static HTML. I used the SF Planning polygon instead, which gives me the
  boundary as geometry but not as street names.
- **Esprit Park's origin and its renovation.** sfrecpark.org facility pages are JavaScript-rendered
  and every URL pattern returned a different park (Golden Gate Park, SOMA West Dog Park). Only the
  DataSF property row answered.
- **The Alberta Candy Factory's building history** — construction date, architect, original firm.
- **The American Industrial Center's construction date, architect and original use.**
- **Crane Cove Park's opening date and the cranes' names from the Port**, as opposed to Wikipedia.
- **Whether the Bethlehem Shipbuilding Corporation Hospital was listed on 29 December 2022 or
  6 January 2023.**
- Web search was unavailable for the whole of this session (budget exhausted at the first call),
  so every source above was reached by direct URL, by DataSF/Socrata query, or by the NPS ArcGIS
  service. Businesses whose domains have lapsed could not be chased to a second source.

---

## 8. COUNT AND SHAPE

**Sixty-eight candidates** are recorded above: 9 anchors (§3), 44 trading places (§4, excluding the
5 confirmed-closed), 5 closed places recorded as warnings, 9 straddlers of which 1 duplicates an
anchor entry, plus the two districts.

**In my judgement this is a guide, not a town page.** Two ticketed institutions with published
hours and admission prices (Museum of Craft and Design, Letterform Archive), a gallery complex, a
Rec & Park park with a measured acreage, a National Register industrial district and a seven-acre
waterfront park is enough spine for a guide. But the spine is thinner than the count suggests: strip
the registry-only rows and the straddlers and Dogpatch's undisputed core is roughly the Article 10
district's nine residential blocks, the Scott School, Esprit Park and the Third Street shopfronts
between 20th and 23rd.

**Four designation identifiers are verified and ready to publish**, each with a register and a
number: Article 10 Ordinance 66-03 (Dogpatch Historic District, 2003-04-18), NRHP 14000150 (Union
Iron Works Historic District, 2014-04-17), NRHP 85000714 with San Francisco Landmark No. 138
(Irving M. Scott School), and NRHP 100006997 (Alberta Candy Factory, 2021-09-22). A fifth, NRHP
100008498, has a number but two conflicting dates and a contested zone.

**Least confident, in order:**
1. **Everything at Pier 70 below the district level.** I have a reference number and four buildings
   from an encyclopedia. If the verifier cannot open the nomination, the yard ships as one entry.
2. **The registry-only rows in §4** — roughly fifteen places with a name, an address and no
   operator source. ICA SF proves how that fails.
3. **The Alberta Candy Factory.** A National Register number and nothing else.
