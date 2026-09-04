# Inner Sunset, San Francisco — VERIFIER verdicts

Adjudication of `docs/san-francisco/inner-sunset-finder.md`. Verification date **2026-09-03**.
I did not gather the finder's evidence and I owe it no loyalty. Every ruling is PUBLISH, REWRITE
or DROP with a reason. REWRITE rows carry exact replacement wording; the author uses it verbatim.

**Ledger: 57 PUBLISH · 12 REWRITE · 22 DROP · 6 ESCALATED.**

**Tier: GUIDE, on 19 surviving places.** The finder ruled town-page and is **wrong**. See §7.
Even on the most hostile straddler reading the count is 11, still a guide. A town-page is the
short form — under six places — and Inner Sunset is not close to it.

**Designation identifiers: 8 claimed, 8 survived re-fetching.** Four Article 10 numbers exact on
name, address, APN and year; four Legacy Business nomination numbers exact on number and
certification date. One of the four landmarks (No. 289) survives as a *number* and dies as a
*place*: see §2.4.

---

## 0. What I re-fetched

| Source | Result |
|---|---|
| DataSF `97yj-54sx`, `$where=landmarkno in(29,239,265,289)` | **4/4 confirmed** — names, addresses, APNs, years all exact |
| DataSF `97yj-54sx`, **full 370-row sweep + point-in-polygon** on the Inner Sunset polygon | **finder's four are complete.** Only other hit is the `landmarkno: "0"` work-programme row it correctly rejected |
| DataSF `rzic-39gi`, same four numbers | Confirmed — and **contradicts the finder on LM 29** (§2.1) |
| DataSF `j2bu-swwd` Analysis Neighborhoods | 41 rows. Inner Sunset bbox recomputed: **−122.47731..−122.44634, 37.74865..37.76637 — the finder's figures to five decimals** |
| DataSF `knm6-5ej6` landmark districts, 20 rows + polygon test | **Zero in Inner Sunset. Confirmed** |
| DataSF `63x5-g3m4` historic districts, 204 rows + polygon test | Irving/15th status fields exact — **and a second district the finder missed** (§2.5) |
| DataSF `gtr9-ntp6` Rec & Park, 255 rows | **9/9 acreages confirmed to eight decimals.** The City's own `analysis_neighborhood` column assigns **all nine to Inner Sunset** (§3) |
| NPS `nrhp_locations` layer 0, envelope query over the polygon | **Zero listings inside. Confirmed.** The three nearby are all north of the polygon and all already shipped in Haight-Ashbury |
| ArcGIS `legacy_biz` FeatureServer/0, 544 rows + polygon test | **4/4 nomination numbers and certification dates exact** — and one straddle the finder missed (§2.3) |
| `sfpl.org/locations/sunset` + `/sunset-library-history` | 200 — every figure confirmed; hours are vaguer in the finder than on the page (§2.2) |
| `sfwomenartists.org` | 200 — address and hours confirmed; superlative confirmed present and banned |
| `sutrostewards.org/mount-sutro/` | 200 — 61/20 acres and 5.5 miles confirmed; **the Rotary Meadow grant, the eucalyptus share and the 355-step stairway are NOT on this page** (§4) |
| `ucsf.edu/about/locations` | 200 — 61-acre reserve confirmed, and it gives **different trail and elevation figures** from Sutro Stewards |
| `greenapplebooks.com` | 200 — the two stores are separately named on their own site |
| `hiddengardensteps.org`, `innersunsetfarmersmarket.com`, `stanne.com` | Tree service in Texas; DNS failure; the school, not the parish. **All three of the finder's warnings are correct** |
| Recursive scan of `priv/seed_data/**/*.json` + shipped `haight-ashbury.json` read in full | **No candidate collides with any shipped slug.** Finder's tooling report is correct (§1) |

---

## 1. The taken-slug tooling — finder is RIGHT

`taken_slugs.py` globs `priv/seed_data/rome/*.json` only and reports zero for every San Francisco
term. The finder is correct that this is false and dangerous, and correct to have used
`vf_taken_all.py` instead. **The defect is still unfixed and a third wave will hit it.**

I read shipped `haight-ashbury.json` in full rather than trusting the report. **No collision.**
The five slugs the finder polygon-tested are all Haight-Ashbury's and none is inside the Inner
Sunset polygon. One bookkeeping slip: the finder names "Cole Hardware" among the five it tested;
there is no Cole Hardware place in the shipped file. The conclusion is unaffected.

---

## 2. DESIGNATIONS

### 2.1 Old Fire House — LM 29 — PUBLISH, and the finder's "gap" is FALSE

Register row, verbatim: `name` **Old Fire House**, `address` **1348 10th Avenue**, `apn`
**1764031**, `landmarkno` **29**, `yeardesignated` **1970.0**, `status` **Adopted**,
`yearbuilt` **1898**, `proptype` **Government**, `style` **Altered Shingle**, criteria 1 and 3.
All PUBLISH. Citation form: **"San Francisco Landmark No. 29, designated in 1970."**

- **The finder says "SF Planning's `description` field is empty for this record" and tells the
  verifier to establish present use. That is wrong.** `rzic-39gi` carries a full paragraph. The
  finder queried the dataset and did not read the field. Everything below is newly available and
  the writer should use it:
  - Architect **Charles Wilson**. It originally housed **Chemical Engine No. 2**.
  - **In 1900, Engine 22 was transferred here.**
  - After the 1906 earthquake the company **"spent 45 hours assisting in the evacuation of
    patients from Park Emergency Hospital"** — which is the shipped Haight-Ashbury place at 811
    Stanyan Street, and a genuine cross-link.
  - It **"also served as a food distribution center in the disaster's aftermath."**
  - **"Though it ceased operating in 1962"** — this answers the present-use question the finder
    escalated: it has not been a fire house since 1962.
  - Describable fabric: **"the building's wide double doors and tall hose drying tower."**
- **DROP.** The register's own opening clause is *"this was the first fire house in the Sunset
  District."* That is a ranking against a comparison class and is banned from any source. Use
  **"It opened in 1898 and housed Chemical Engine No. 2."**
- **REWRITE.** The register's context string ends `Events: 1906 Fire & Burn Areas?` — with a
  question mark the finder dropped. Do not quote the context string at all; write the facts.

### 2.2 Sunset Branch Library — LM 239 — PUBLISH

Register row: **Sunset Branch Library**, **1301-1305 18th Avenue**, APN **1773001**,
`yeardesignated` **2004.0**, `yearbuilt` **1917**, `style` **Italian Renaissance**, criteria 1
and 3, status Adopted. `description` is genuinely **"Coming Soon!"** — here the finder's gap
report is right. All PUBLISH.

From SFPL's own history page, all confirmed verbatim and all PUBLISH:
**"Sunset Branch opened on March 25, 1918 and was the eighth branch in the San Francisco Public
Library system"** (a sequence, not a ranking — publishes); **cost $43,955**; **"designed by
architect G. Albert Lansburgh"**; **"two story structure, Italianate in design, built of concrete
frame and reinforced masonry"**; **"closed in 1992 for seismic retrofitting and to add a ramp and
an elevator"**; **"In September of 2005 it became the third branch to be renovated under the
Branch Library Improvement Program. The branch reopened in March 2007."**

- **REWRITE.** The finder gives hours as "Monday–Thursday 10–6 or 10–8", which is not a fact.
  SFPL's page is exact. Write: **"SFPL gives opening hours of 1pm to 5pm Sunday, 10am to 6pm
  Monday, 10am to 8pm Tuesday to Thursday, 1pm to 6pm Friday and 10am to 6pm Saturday. The phone
  number is 415-355-2808 and the mailing address is 1305 18th Avenue."**
- **REWRITE.** Two sources disagree on style: SF Planning records **Italian Renaissance**, SFPL's
  own page says **"Italianate in design"**. Attribute rather than merge: **"SF Planning records
  the style as Italian Renaissance; the library's own history calls the building Italianate."**
- **The finder is wrong that SF Planning's context string is the only place "Carnegie" appears.**
  SFPL's history page calls it **"a Carnegie building"**. That much publishes. The finder's real
  ruling still stands and I affirm it: **no source gives a grant figure, so no grant figure is
  written. The $43,955 is a construction cost and must be labelled as one.**

### 2.3 Doelger Building — LM 265 — PUBLISH

Register row confirmed exactly: **Doelger Building**, **320-326 Judah Street**, APN **1762020**,
`yeardesignated` **2013.0**, `yearbuilt` **1932**, `style` **Art Deco; Streamline Moderne**,
`archbuild` **"Charles O. Clausen (architect) + Henry Doelger Inc."**, `sigperson` **Henry
Doelger**, criteria 1, 2 and 3, `proptype` **Commercial**. All PUBLISH.

The register description is confirmed word for word. PUBLISH the fabric — **"its stepped tower
entrance, glass block windows, and speedline canopy"** — and the firm's role, **"headquarters for
Henry Doelger Builder Inc."** Also available and PUBLISH: the tracts were **"affectionately called
Doelgerville and Doelger City."**

- **DROP, and the finder called this right.** *"the poor man's Frank Lloyd Wright"* and *"a master
  builder"* are rankings by attribution and do not travel.
- **DROP.** The register's *"transformed the Sunset District from windswept sand dunes"* is the
  register's rhetoric. Write the fact: **"The firm built tract housing across the Sunset District."**

### 2.4 UC Hall frescoes — LM 289 — number PUBLISHES, place DROPS

Register row confirmed exactly: **"History of Medicine in California" Frescoes at UC Hall**,
**533 Parnassus Avenue**, APN **2634A011**, `yeardesignated` **2020.0**, `yearbuilt` **1938**,
`proptype` **Object/Educational**, `cultural_1` **Y**, status Adopted. The number is real and
current. The finder's detail is exact and confirmed against the register description: painted
**1936–1938** by **Bernard Zakheim** with assistant **Phyllis Wrightson**, partly funded through
the **Works Progress Administration's Federal Art Project**, **"12 panels (10 pictorial and 2
descriptive)"**.

**DROP as a place.** Wikipedia's Zakheim article states the murals *"were removed from the
building so that it could be torn down"* in 2021 and that *"UCSF is working to identify a new
location for display of the murals."* No UCSF page confirming the removal, the demolition or the
present location could be obtained — four candidate URLs 404. A reader sent to 533 Parnassus
Avenue would find neither the frescoes nor UC Hall. **The finder flagged this hard and was right
to; the ruling it asked for is DROP.** The landmark number may be cited in prose about the
frescoes as objects; it may not anchor a visitable place at that address.

- **DROP four superlatives the finder did not flag.** LM 289's register description contains
  *"an excellent example"*, *"master artist"*, *"the largest, most immersive fresco buono work of
  Zakheim's career"* and *"the last fresco commission the artist completed in San Francisco"*.
  The finder flagged Doelger's two and missed all four of these. None travels.
- **PUBLISH the finder's copyright handling.** A fresco cycle is not covered by 17 USC 120(a).
  It may be written about and not photographed, and **the page says nothing about why**.

### 2.5 Legacy Business Registry — 4/4 numbers survive

Re-queried the `legacy_biz` layer: **544 rows**, matching the finder. Four inside the polygon,
all `Status: "Legacy Business: Active"`. Every number and date exact:

| Business | Location address | Nomination no. | Certified |
|---|---|---|---|
| Green Apple Books | 1231 9th Ave. | **LBR-2015-16-022** | **2016-10-03** |
| Ambiance | 756 Irving St. | **LBR-2019-20-025** | **2020-09-28** |
| San Francisco Women Artists | 647 Irving St. | **LBR-2023-24-017** | **2023-12-11** |
| Peasant Pies | 1039 Irving St. | **LBR-2024-25-043** | **2025-07-28** |

**PUBLISH** the `Known_For` strings for three: Green Apple *"New and used books"*, Ambiance
*"Women's clothing and accessories"*, Peasant Pies *"Hand-held savory pies and sweet pies"*.
**DROP** San Francisco Women Artists' `Known_For`, which reads *"Beautiful Gallery ~ Incredible
Artworks!"* — that is the applicant's advertising copy, not a fact.

**PUBLISH** from `sfwomenartists.org`: **"647 Irving Street at 8th Avenue San Francisco, CA
94122"** and **"10:30am to 5:30pm Tuesday – Saturday"**. Phone (415) 566-8550 from the registry.
**PUBLISH** Peasant Pies' phone **(415) 731-1978**.

- **DROP.** *"One of the oldest arts organizations in California"* on sfwomenartists.org. The
  finder flagged it; confirmed present, confirmed banned, and it also trips the gate's regex.
- **DROP — the finder missed this one.** Ambiance's own registry description reads *"Ambiance is
  proud of our multiple awards for 'Best Boutique'"*. An award sourced to the business's own
  submission. It does not travel, and neither does the *"Founded in 1983"* in the same field.
- **DROP.** `peasantpies.com` headlines *"Hand-Held Savory & Sweet Pies Since 1993"*. A founding
  year from the operator's own site is a trading-duration claim and does not publish.

**THE RULING THE FINDER ASKED FOR, on `Established_Date`.** The finder is right that these are
not the operator's own site: they are fields in a City register a business must document to be
certified, and they arrive attached to a nomination number. **They PUBLISH only when cited to the
registry with the nomination number in the same sentence, and never bare.** Form:
**"The Legacy Business Registry certified it on 3 October 2016 under nomination number
LBR-2015-16-022 and records the business as established in 1967."** A bare *"since 1967"* DROPS.
The four dates so licensed: Green Apple **1967**, Ambiance **1983**, San Francisco Women Artists
**8 January 1925**, Peasant Pies **December 1993**.

### 2.6 The eligibility findings — DROP as designations, and the finder missed one

**Irving Street and 15th Avenue Neighborhood Commerical Historic District** — status fields
re-read and exact: `cr: "Eligible"`, `nr: "No"`, `a10: "No"`, `a11: "No"`, period of significance
**1926**, origin San Francisco Citywide Cultural Resources Survey, centroid −122.47270/37.76402.
The register's own description says it **"appears eligible for listing in the California
Register."** **The finder's ruling is correct and I affirm it: eligible is not listed, there is no
identifier, and it must not be written as a designation.** (The register misspells "Commerical";
do not reproduce the typo, and do not name the district at all in a designation sentence.)

- **The finder missed a second one.** `63x5-g3m4` also places the **San Francisco 1952 Firehouse
  Bond Act Thematic District (Discontiguous)** inside the polygon, with identical status —
  `cr: Eligible`, `nr: No`, `a10: No`, `a11: No`. It does not publish as a designation either, and
  its description carries *"the largest firehouse building campaign undertaken by the City"*,
  which does not travel. **DROP.**
- **DROP, and it is a superlative.** The finder writes that Irving Street's is *"the only formal
  recognition the Irving Street commercial strip carries."* It is not the only eligibility finding
  in the zone, and the sentence is a ranking regardless.

### 2.7 Records correctly refused — PUBLISH the refusals

- **"Residence at 2 Claredon Avenue"**, `landmarkno: "0"`, `yeardesignated: "0.0"`, `status:
  "Work Program"`. My full 370-row sweep found this exact row and no other inside the polygon.
  **The finder is right: not a designation. DROP.**
- **Zero National Register listings.** Confirmed by envelope query. The three listings near the
  polygon — Park View Hotel `83001235` (08/11/83), Doolan Residence `09001201` (05/11/11), Whelan
  House `100005794` (11/20/20) — are all north of the maximum latitude and **all three are already
  shipped in Haight-Ashbury**. **The finder's clean zero is confirmed.** The page must not imply
  federal recognition, and must also not announce the absence — that is editorial self-reference.
- **Zero Article 10 landmark districts.** Confirmed against all 20 rows. DROP any district claim.

### DO NOT COUNT THE LANDMARKS
The finder's headline reads **"9 designation identifiers across 8 distinct properties — four
Article 10 landmark numbers, four Legacy Business Registry nomination numbers."** That is a tally
and the standing ban applies. It is fine in the finder's report; **it must not reach the page in
any form.** Name Old Fire House, the Sunset Branch Library and the Doelger Building and cite each
number. Never total them.

---

## 3. PARKS — 9 acreages claimed, 9 confirmed, and the straddle collapses

Every figure matches `gtr9-ntp6`. All PUBLISH.

| Property | Address | Acres (register) | Type | `analysis_neighborhood` |
|---|---|---|---|---|
| Grand View Park | 1730 15th Ave | 4.1444643 | Neighborhood Park or Playground | **Inner Sunset** |
| Grand View Open Space | — | 0.79391061 | Neighborhood Park or Playground | **Inner Sunset** |
| Golden Gate Heights Park | 2041 12th Ave | 6.96123790 | Neighborhood Park or Playground | **Inner Sunset** |
| Rocky Outcrop | 1800 14th Ave | 1.67139883 | Neighborhood Park or Playground | **Inner Sunset** |
| 15th Avenue Steps | 1060 Kirkham St | 0.50806563 | **Mini Park** | **Inner Sunset** |
| J.P. Murphy Playground | 1960 9th Ave | 1.33077004 | Neighborhood Park or Playground | **Inner Sunset** |
| White Crane Springs Community Garden | 1620 7th Ave | 0.46140910 | **Community Garden** | **Inner Sunset** |
| Tank Hill | 100 Twin Peaks Blvd | 3.02368704 | Neighborhood Park or Playground | **Inner Sunset** |
| Interior Greenbelt | — | 21.37444821 | Neighborhood Park or Playground | **Inner Sunset, Twin Peaks** |

**This is the finding that overturns the finder's tier.** The finder flagged six of these as lost
to "Golden Gate Heights", one to "Forest Hill", one to "Forest Knolls" and one to "Ashbury
Heights". **The City's own joined column puts every one of them in Inner Sunset**, and only the
Interior Greenbelt is dual-coded. See §7 for why the SF Find layer cannot take them anyway.

### Grand View Park — PUBLISH with corrections
- **REWRITE.** Two acreages exist: Wikipedia's **3.98** and the register's **4.1444643**. The
  finder says carry the City figure; I affirm. Write **"a Recreation and Park property of 4.14
  acres at 1730 15th Avenue."**
- **PUBLISH.** Summit **"about 666 feet (203 m)"**; bounded by **14th and 15th Avenues and
  Noriega Street**; hours **5am to midnight**.
- **PUBLISH.** Geology: **"an outcrop of chert, which is part of the heterogeneous assemblage
  known as the Franciscan Formation"**, under a thin layer of sand.
- **PUBLISH.** Plants: **endangered Franciscan wallflower and dune tansy**, plus bush lupin,
  beach strawberry, bush monkey flower and coyote bush; the summit **"crowned with Monterey
  cypress trees."**
- **PUBLISH the finder's caution.** "Turtle Hill" is a residents' name, not the register's.
  Write **"Grand View Park"**, which is also the register's spelling — note Wikipedia's article
  runs "Grandview Park" as one word and the City's two-word form is the one to carry.

### Grand View Open Space and Interior Greenbelt — REWRITE
Both carry **no street address** in the register. **REWRITE:** a place with no sourced address
gets none — do not borrow a neighbouring park's. Write the acreage and the register name only.

---

## 4. MOUNT SUTRO AND THE STAIRWAYS

### Mount Sutro Open Space Reserve — PUBLISH
- **PUBLISH**, from `sutrostewards.org`, confirmed verbatim: **"UCSF owns and manages 61 acres of
  Mount Sutro and San Francisco Recreation & Parks manages 20 acres on the east side"** and
  **"Mount Sutro Open Space currently has over 5.5 miles of multi-use trail."**
- **PUBLISH**, from `ucsf.edu/about/locations`, confirmed verbatim: **"a vibrant, 61-acre open
  space reserve owned by UCSF as well as campus housing nestled amongst the trees."**
- **REWRITE — the two sources give different trail and height figures.** UCSF's own page says
  **"more than 5 miles of public, multi-use trails, with a 900-foot elevation gain"**; Sutro
  Stewards says **"over 5.5 miles"**; the finder took **911 ft** elevation from Wikipedia. Do not
  merge three numbers into one. Write: **"Sutro Stewards gives the trail network as over 5.5
  miles; UCSF's own site gives more than 5 miles and a 900-foot elevation gain."**
- **DROP.** The **80% eucalyptus share**, the **Arbor Day** planting, the **Rotary Meadow $100,000
  Rotary Club grant** and the **"355-step public stairway from Warren Drive to Crestmont Drive"**
  are **not on the Sutro Stewards page** I fetched. The finder's bullet list runs them together
  with the quotes that are on it. Each needs its own source or it does not ship.
- **PUBLISH the finder's two cautions.** Write **Mount Sutro**, not "Mount Parnassus". And
  **"cloud forest"** stays off the page — the finder could not source it and neither could I.

### 16th Avenue Tiled Steps — PUBLISH
Confirmed: artists **Aileen Barr and Colette Crutcher**; built **July–August 2005**; **"Opened
August 27, 2005"**; **"163 steps stretching 90 feet (27 m) high"**; **"Moraga St. between 15th &
16th Ave."**; originated by residents **Jessie Audette and Alice Yee Xavier** in 2003; funded by
**"over 220 sponsored/named tiles"** and the **Mayor's Neighborhood Beautification Fund**.

- **REWRITE.** The finder writes *"approximately 75,000 glass fragments"*. The source says
  **"over 2,000 unique tiles from over 75,000 glass fragments"** — over, not approximately. Use
  the source's wording.
- **PUBLISH** the 90-foot height, which the finder dropped and which is a sourced measurement.
- **PUBLISH.** A mosaic is not covered by 17 USC 120(a): written about, not photographed, and
  **the page says nothing about why**.
- On the step count: the finder asked whether 163 survives with `tiledsteps.org` dead. **PUBLISH
  it** — it is a count of ordinary things carried with its 90-foot measurement, and the rules bar
  tallies of *designations*, not of steps. Attribute nothing to the dead domain.

### Hidden Garden Steps — DROP
`hiddengardensteps.org` resolves to a tree-service company in Longview, Texas. Confirmed. **No
citable fact exists. DROP entirely** — the finder was right not to ship it, and the page must not
mention that it was considered.

### 15th Avenue Steps — PUBLISH
A **Mini Park** of **0.50806563 acres at 1060 Kirkham Street**, a distinct City property from
either mosaic stairway. Confirmed. Write **0.51 acres**.

---

## 5. UCSF PARNASSUS HEIGHTS

- **PUBLISH**, from UCSF's own site, confirmed verbatim: **"The original UCSF campus located at
  Parnassus Heights is made up of a tight network of buildings where faculty, staff, students and
  others are engaged in patient care, research and education activities. Covering almost six
  blocks, the campus serves as headquarters for UCSF leaders."** The **"almost six blocks"** is
  new — the finder missed it, and it is the one sourced size figure for the campus.
- **PUBLISH** the campus chronology, confirmed: Adolph Sutro's donation of **13 acres**; the
  Affiliated Colleges buildings **opened in the fall of 1898**; **UC Hospital 1917, 225 beds**;
  **Clinics Building 1934**; **Langley Porter Clinic 1942**; **Herbert C. Moffitt Hospital 1955**;
  **Guy S. Millberry Union 1958**; **Kalmanovitz Library 1990**.
- **DROP the address 505 Parnassus Avenue.** The finder states plainly that it comes from
  geocoding and not from UCSF, and I could not get it from a UCSF page either — the locations page
  gives no street addresses at all. An address is exactly the fact a reader acts on. **No address,
  or no place.**
- **DROP the seven sub-places** — UCSF Medical Center, Moffitt, Long, Millberry Union, Kalmanovitz
  Library, UC Hall, Aldea San Miguel. Not one has a sourced street address, and UC Hall is
  demolished (§2.4). **The campus ships as ONE place with no street address, or not at all.**

---

## 6. STRADDLERS — 6 escalated, 5 resolved here

I resolve what the roster already decides and escalate only what it does not.

| # | Straddle | Ruling |
|---|---|---|
| **E1** | **Green Apple Books** — one nomination number, **LBR-2015-16-022, covers TWO location rows**: 506 Clement St. (Inner Richmond) and 1231 9th Ave. (Sunset). **The finder did not flag this**, and `inner-richmond`'s roster draw names "the Green Apple Books block". | **ESCALATE.** Their own site names the stores separately — "Green Apple Books on Clement" and "Books on the Park on 9th Avenue" at 1231 9th Ave. My recommendation: Inner Sunset takes **Books on the Park, 1231 9th Avenue** as its own slug and restates nothing about Clement Street; both zones may cite the shared number. The arbitrator must confirm before Inner Richmond ships. |
| **E2** | **Tank Hill**, 3.02 acres, mailing address 100 Twin Peaks Blvd | **ESCALATE.** City column says Inner Sunset; the finder says Ashbury Heights. Shipped Haight-Ashbury does **not** own it and its roster draw stops at "the Victorians of Ashbury Heights". Recommend **Inner Sunset**. |
| **E3** | **Interior Greenbelt**, 21.37 acres, `analysis_neighborhood: "Inner Sunset, Twin Peaks"` | **ESCALATE, but there is no rival.** Twin Peaks is in the roster's **declined** list and has no page. Recommend **Inner Sunset**. |
| **E4** | **Mount Sutro and the UCSF Parnassus campus** | **ESCALATE for confirmation only.** The roster's `inner-sunset` draw names **"Mount Sutro, the UCSF Parnassus campus"** in terms. That is an editorial ruling already made and it beats the SF Find layer. Recommend **Inner Sunset**. |
| **E5** | **Kezar Stadium and Kezar Pavilion** | **RESOLVED — not Inner Sunset's.** Both DataSF datasets say Golden Gate Park, which is its own in-scope page. The finder conceded correctly. |
| **E6** | **The six Golden Gate Heights properties** (Grand View Park, Grand View Open Space, 16th Avenue Tiled Steps, Rocky Outcrop, Golden Gate Heights Park, 15th Avenue Steps) | **RESOLVED — Inner Sunset's.** See §7. |

**RESOLVED and not escalated:** Sutro Tower (Twin Peaks/Clarendon Heights under both datasets, and
Twin Peaks is declined — **DROP**, it is nobody's, and "the thing you see from Grand View Park" is
orientation by impression besides); Golden Gate Park's south edge and the de Young, Academy of
Sciences and Conservatory (**DROP**, Golden Gate Park's own page); the Cole Valley fringe
(**DROP** — no shipped Haight place is inside the polygon, so there is nothing to contest, and
Inner Sunset should not reach into the 1200 block of Stanyan for material it has no source for);
Herbert Hoover Middle School, Sunset Recreation Center, Sunset Reservoir, Lucca, Wah Mei, Other
Avenues and Win Long (**DROP**, all Sunset/Parkside or West of Twin Peaks — the finder checked and
rejected these correctly).

---

## 7. TIER — the finder is WRONG. This is a GUIDE.

**Ruling: GUIDE, on 19 surviving places.**

The finder's town-page verdict rests on one premise: that Mount Sutro, the UCSF campus, Grand View
Park and the Moraga Steps are all straddlers that may be lost. **That premise fails on three
independent grounds.**

**First, the competing neighbourhoods do not exist as pages.** The roster names 23 zones.
**Golden Gate Heights, Parnassus Heights, Forest Knolls, Forest Hill, Ashbury Heights and
Clarendon Heights are not among them, and Twin Peaks is explicitly declined.** The finder treated
the SF Find layer's 117 polygons as competing ownership claims. They are not. The roster says so
in its own words: SF Planning publishes 41 analysis neighborhoods and SF Find carries 117, and
*"neither matches the units a visitor uses."* **Nothing can be lost to a polygon that has no page.**

**Second, the roster has already awarded the two biggest straddlers to Inner Sunset.** Its
`inner-sunset` draw reads: *"Irving Street, Mount Sutro, the UCSF Parnassus campus, the 9th and
Irving block."* That is the editorial ruling the finder was waiting for, and it was in the roster
the whole time.

**Third, the City's own data contradicts the finder.** `gtr9-ntp6` joins an
`analysis_neighborhood` column, and **all nine parks come back Inner Sunset** — including the six
the finder gave away to Golden Gate Heights and the two it gave to Forest Hill and Forest Knolls.

**A correction to the boundary arithmetic, too.** The finder computes 2nd Avenue at longitude
−122.4585 and rules UCSF outside Definition C on a geocode of −122.4574. **SF Planning's own
parcel centroid for 533 Parnassus Avenue is −122.46019** — west of the finder's own line, and
therefore *inside* Definition C. The Definition C exclusion rests on a geocode the register
contradicts.

**The 19 surviving places:** Old Fire House; Sunset Branch Library; Doelger Building; Books on the
Park; Ambiance; San Francisco Women Artists; Peasant Pies; Grand View Park; Grand View Open Space;
Golden Gate Heights Park; Rocky Outcrop; 15th Avenue Steps; J.P. Murphy Playground; White Crane
Springs Community Garden; Tank Hill; Interior Greenbelt; 16th Avenue Tiled Steps; Mount Sutro Open
Space Reserve; UCSF Parnassus Heights campus.

**On the most hostile reading** — arbitrator strips Mount Sutro, UCSF and all six Golden Gate
Heights properties — **11 places remain.** Still a guide. There is no reading of this zone that
reaches the under-six town-page form.

The guide form therefore binds: **at least four places, a 100–160 word intro, four to six FAQ
entries, and a section headed exactly "Getting there".**

---

## 8. THE BUSINESS TAIL — DROP as sourced, with a remedy

The finder lists **San Tung, Wishbone, Andronico's, Irving Subs and Cheese Shop, Nopalito, Park
Chow, Ebisu, Arizmendi Bakery, Pacific Catch, The Little Shamrock** and a run of bare street
numbers on Irving Street and 9th Avenue.

**DROP all of them as presented.** The finder states it used Nominatim for lat/lon only and that
these are "candidates, not confirmations", with no first-party page and no hours for most. A
Nominatim POI record does not establish that a named business trades at a named address.

**The remedy is cheap and the writer should take it.** Shipped `haight-ashbury.json` populates its
entire Haight Street strip from **"the City's business record"** — a registered-business dataset
the finder never queried for Inner Sunset. Pull it for the Irving Street and 9th Avenue corridors
and these return with a sourced address each, shipping in Haight-Ashbury's proven form: name,
address, and **"No source states a history of the business."**

- **DROP.** **The Little Shamrock**, 807 Lincoln Way. Not in the registry — the finder checked all
  544 rows and so did I. Any trading-duration claim about it is unsourced.
- **DROP.** **Inner Sunset Farmers Market.** `innersunsetfarmersmarket.com` does not resolve —
  confirmed, DNS failure. No day, no hours, no operator. Not shippable, and the page must not
  mention the market's existence unsourced.
- **DROP.** **St. Anne of the Sunset Church**, 850 Judah Street. `stanne.com` serves **St. Anne
  School at 1320 14th Avenue** — confirmed, a different institution at a different address. No
  architect, date or style for the parish exists in any source obtained.
- **DROP.** **St. John of God / Newman Center**, 1290 5th Avenue. The finder marks it
  unresearched. Nothing to verify.

---

## 9. PROSE HAZARDS THE WRITER MUST CLEAR

The finder's report is full of provenance argument by design, and **none of it may cross into the
page.** Specifically:

- **No boundary discussion.** Not the three definitions, not the polygon disagreement, not "the
  two boundary readings disagree". The page states where things are and stops.
- **No absence announcements.** "There is no National Register listing here", "no monument", "this
  page carries no…" are editorial self-reference and fail the gate. The zero is a research finding
  and stays in this document.
- **No trip durations or impression-orientation.** The finder's *"the thing you see from Grand
  View Park"*, *"one hill east of anything else on this list"* and *"the northern lip of Forest
  Hill"* are all banned. Keep: the side of a named street, a sourced measurement, two things that
  physically adjoin.
- **No tallies of designations**, per §2.7.
- **No photo-policy reasoning** anywhere, for the frescoes or the mosaic. Emit `"photos": []`.
- **Kinds:** there is no `library`, `church`, `garden` or `monument` kind. Use `historic-site`,
  `park`, `attraction`, `shop`, `restaurant`, `cafe`.
- **Destination string** is **"Inner Sunset, California"** — no collision with the 336 committed
  destination slugs.

---

## 10. SUMMARY OF WHAT THE FINDER GOT WRONG

1. **The tier.** Town-page is wrong; 19 places survive and the form is a guide.
2. **Treated the SF Find layer as competing ownership.** Golden Gate Heights, Parnassus Heights,
   Forest Knolls, Forest Hill and Ashbury Heights have no pages; Twin Peaks is declined.
3. **Missed that the roster already awards Mount Sutro and UCSF Parnassus to Inner Sunset.**
4. **Missed that the City's Rec & Park column assigns all nine parks to Inner Sunset.**
5. **Declared LM 29's SF Planning description empty.** It is a full paragraph giving the architect,
   the 1900 Engine 22 transfer, the 1906 role and the 1962 closure — the very present-use question
   it escalated.
6. **Missed a second eligible historic district**, and called the one it found "the only formal
   recognition" — a miss and a superlative in one sentence.
7. **Missed the Green Apple Books straddle with Inner Richmond** under a shared nomination number.
8. **Missed the "Best Boutique" awards** in Ambiance's registry description.
9. **Missed four superlatives** in LM 289's register description, having caught Doelger's two.
10. **Definition C arithmetic** contradicted by SF Planning's own parcel centroid for 533 Parnassus.
11. **Wrong that "Carnegie" appears only in SF Planning's context string** — SFPL's own history page
    says "a Carnegie building".
12. **Attributed the Rotary Meadow grant, the eucalyptus share and the 355-step stairway to a page
    that does not carry them.**
13. **Misquoted "approximately 75,000" for "over 75,000"** glass fragments, and dropped the sourced
    90-foot height.
14. **Vague library hours** where the source is exact.

**What it got right, and it is a lot:** all four Article 10 numbers exact including APNs; all four
Legacy Business numbers and certification dates exact; the bounding box to five decimals; nine
acreages; the clean National Register zero; the `landmarkno: "0"` trap; the eligibility-is-not-
designation ruling; the taken-slug tooling defect; the Nominatim neighbourhood-field warning; and
the three dead-source warnings, every one of which I reproduced. **Its designation work is
accurate. Its ownership reasoning is what failed.**
