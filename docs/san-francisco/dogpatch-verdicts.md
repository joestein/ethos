# Dogpatch, San Francisco — VERIFIER verdicts

Adjudication of `docs/san-francisco/dogpatch-finder.md`. Verification date **2026-09-03**.
I did not gather the finder's evidence and I owe it no loyalty. Every ruling below is PUBLISH,
REWRITE or DROP with a reason. REWRITE rows carry exact replacement wording; the author uses it
verbatim.

**Ledger: 29 PUBLISH · 7 REWRITE · 44 DROP · 7 ESCALATED.**
**Tier: GUIDE**, on **23** surviving places. Not close to the town-page line — see §6.
**Designation identifiers: 6 claimed, 4 survived re-fetching, 1 contested, 1 struck.**

---

## 0. What I re-fetched

Every designation identifier the finder claims, plus seven operator sources it leaned on hardest.
All fetched live today.

| Source | Result |
|---|---|
| DataSF `97yj-54sx`, landmark 138 | **CONFIRMED** — `name` "The Potrero School", `address` "1060 Tennessee Street", `yeardesignated` 1981.0, APN 4107006 |
| DataSF `m22e-6hkz`, districts, `$where` on `name_1` | **3/3 CONFIRMED** — objectid 171 Dogpatch HD, 144 Union Iron Works HD, 15 Third Street Industrial. Field is **`name_1`**, not `district`. 175 rows total |
| NPS `nrhp_locations` layers 0 **and 1**, by `NRIS_Refnum` and by `RESNAME` | 85000714 and 100008498 present; **14000150 and 100006997 return ZERO on both layers** |
| NPGallery `AssetDetail/NRIS/14000150` | **CONFIRMED** — "Union Iron Works Historic District", California, San Francisco County, 4/17/2014 |
| NPGallery nomination store, `GetAsset/NRHP/<ref>_text`, **with six controls** | 14000150 → 54,969,031-byte PDF; 85000714 → 420,673-byte PDF. **Store proved unreliable for the 100-series — see §1.4** |
| DataSF `3mea-di5p` EAS, 8 addresses with `street_type` | 6/8 resolve; **every one returns `nhood` "Potrero Hill"** |
| DataSF `gtr9-ntp6` Rec & Park, 255 properties | Esprit Park **confirmed to eight decimals**; only one property citywide carries `mons_neighborhood` Dogpatch |
| DataSF `g8m3-pdis` registry, 20 operator names | All finder rows confirmed, **including the stale ICA SF row** |
| `sfmcd.org/visit/` · `letterformarchive.org/visit/` · `sfport.com/cranecovepark` · `sfport.com/warmwatercove` · `minnesotastreetproject.com` · `icasf.org/visit/` · `piccino.com` | All 200. Four corrections, §5 |
| Recursive scan of `priv/seed_data/**/*.json` + `oracle_park_places.ex` | **4,389 places across 349 files.** One collision the finder missed — §3.1 |

---

## 1. DESIGNATION IDENTIFIERS — 6 claimed, 4 survived

### 1.1 PUBLISH — Article 10, Dogpatch Historic District

`m22e-6hkz` objectid 171: `a10` **Listed**, `origin` **Ord. 66-03**, `dateadop` **2003-04-18**.

- **PUBLISH** the ordinance and the date.
- **REWRITE — strike "Appendix L".** The finder asserts Appendix L and in §7 admits it never read
  the appendix, because the American Legal page is a JavaScript shell. An appendix letter it could
  not open is not a citation it may print. The ordinance is verified and is enough. Exact wording:

  > The Dogpatch Historic District was designated under Article 10 of the San Francisco Planning
  > Code by Ordinance 66-03, adopted on 18 April 2003.

- **DROP the Wikipedia year 2002.** `dateadop` is 2003-04-18 and the ordinance number 66-03 is
  consistent with 2003. The finder's instinct was right.
- **GUARD — the Dogpatch district carries `nr: No`.** It is **not** on the National Register. No
  federal sentence attaches to it, ever. The finder did not make this error; I am recording it
  because the neighbouring Union Iron Works district *is* federally listed and the two are one
  paragraph apart.
- **DROP the contributor counts.** `total_prop: 129`, `contributors: 97`, `non_contrib: 32`
  confirmed present, and confirmed banned. The finder banned them itself and was right.

### 1.2 PUBLISH — NRHP 14000150, Union Iron Works Historic District

**The finder was right and its reasoning was sound.** This number returns ZERO features on NPS
layers 0 and 1, by reference number and by resource name — the pattern on which wave 1 killed the
South End Historic District's federal claim (arbitration §6b #8). I did not accept the finder's
"gap in the GIS service" on its word. I tested it:

- **NPGallery `AssetDetail/NRIS/14000150`** returns "Union Iron Works Historic District",
  California, San Francisco County, 4/17/2014.
- **The nomination resolves**: `GetAsset/NRHP/14000150_text` → HTTP 200, `application/pdf`,
  **54,969,031 bytes**, magic `%PDF-1.6`. A nonsense control (99999999) returns a 1,623-byte
  placeholder PNG instead.
- SF Planning `m22e-6hkz` objectid 144 carries `nr: Listed` and `origin: Ref Number: 14000150`.

Three independent confirmations. This is **unlike** South End, whose DataSF row asserted `nr:
Listed` with **no reference number anywhere**. PUBLISH:

> The Union Iron Works Historic District was listed on the National Register of Historic Places on
> 17 April 2014, reference number 14000150.

**TRAP for the author.** NPS layer 0 carries **Union Iron Works Powerhouse (80000793)** and **Union
Iron Works Turbine Machine Shop (80000794)**, both at Webster Street in **Alameda**. They are a
different city and a different listing. Neither number may appear on this page.

### 1.3 PUBLISH — the Irving M. Scott School, both registers

| Register | Identifier | Register's own string | Verified |
|---|---|---|---|
| Article 10 | **San Francisco Landmark No. 138**, designated **1981** | name "The Potrero School", address "1060 Tennessee Street" | `97yj-54sx` |
| National Register | **reference number 85000714**, certified **11 April 1985** | RESNAME "Scott, Irving Murray, School", Address "1060 Tennessee St." | NPS layer 0 + 420,673-byte nomination PDF |

Both PUBLISH. Note the register's name is **"The Potrero School"** and the NPS inverted form is
"Scott, Irving Murray, School" — write the place as **Irving M. Scott School** and cite the
numbers; do not quote either register's string as the name (the wave-1 "Warren, Russell, House"
ruling).

The finder's designation-document URL is stale: `97yj-54sx` gives
`https://sfplanninggis.org/docs/landmarks_and_districts/LM138.pdf`, not `files.sfplanning.org`.
Not reader-facing; recorded so nobody re-finds it.

### 1.4 STRUCK — NRHP 100006997, Alberta Candy Factory

**The finder's stated verification is false.** §2.2 sources the individual designations to "NPS
`nrhp_locations` layer 0 queried by bbox and by refnum". I ran exactly that query.
**100006997 returns zero features on layer 0 and zero on layer 1, by reference number and by
resource name.** The source does not say what the finder says it says.

I then tried three further routes and **none can discriminate**, which is the honest result:

| Reference | Known status | Nomination store |
|---|---|---|
| 100001665 Sacred Heart | real (wave 1) | 8,541,488-byte PDF |
| 100004413 Swedish American Hall | real (wave 1) | 11,892,810-byte PDF |
| **100006911 Hobart Building** | **real (wave 1)** | **1,623-byte placeholder** |
| **100008498 Bethlehem Hospital** | **real (in NPS layer 0)** | **1,623-byte placeholder** |
| 100006997 Alberta Candy Factory | in question | 1,623-byte placeholder |
| 99999999 nonsense | fake | 1,623-byte placeholder |

Two numbers wave 1 proved real behave identically to the fake control. **The store lags for recent
100-series listings, so absence there is not evidence, and I will not kill a number on it.** The
same applies to the spatial layers, which also omit the confirmed-real 14000150.

So the number is **neither confirmed nor disproved**. It rests on the Wikipedia NRHP table alone,
which I re-fetched directly and which gives #100006997, 22 September 2021, 555 19th St, "Dogpatch"
— internally consistent, and EAS puts 555 19TH ST at -122.38814/37.76162 as the finder said.

**Ruling: DROP the finder's verification claim outright. DROP the Alberta Candy Factory as a
place** — §2.9. **ESCALATED** to the arbitrator: may an NRHP number sourced to the Wikipedia
listing table alone publish, when four federal routes can neither confirm nor deny it? Wave 1's
worst error was a fabricated reference number that "reads as authority", and this one cannot be
stood up. My recommendation is that it does not publish.

### 1.5 ESCALATED — NRHP 100008498, Bethlehem Shipbuilding Corporation Hospital

**The number is real**; I confirmed it on NPS layer 0 — RESNAME "Bethlehem Shipbuilding
Corporation Hospital", Address "331 Pennsylvania Ave.", San Francisco.

**The date conflict is real and I reproduced it.** NPS `CertDate` **01/06/23**; Wikipedia **29
December 2022**. The NPS field is MM/DD/YY — the Scott School's 04/11/85 renders as 11 April 1985,
which the finder read correctly — so 01/06/23 is **6 January 2023**, eight days after Wikipedia.
**No date publishes** until one is settled against the nomination or the weekly list. The finder
was right to withhold it.

**Zone is escalated, not resolved** — §4.1.

### 1.6 PUBLISH — the finder's "eligible is not listed" guard

`m22e-6hkz` objectid 15, Third Street Industrial District: `cr` **Eligible**, `nr` **No**, `a10`
**No**. The finder's §2.3 is correct and binds. Most of the Third Street shopfronts sit in this
polygon and **not one of them carries a protection claim**. Same for Bridges and Tunnels and the
SF General Hospital district.

---

## 2. THE ANCHORS

### 2.1 Museum of Craft and Design — PUBLISH, one REWRITE, two DROPs

Re-fetched `sfmcd.org/visit/`. Address, hours and prices confirmed verbatim: **2569 Third Street**,
Thursday–Sunday 12:00–17:00, closed Monday–Wednesday, general $10, students with ID $8, seniors 65
and older $8, museum members free, free on the first Thursday of every month. Registry row
"Museum Of Craft & Design", 2569 Third St, from 2013-04-30, open. **PUBLISH.**

- **REWRITE.** The site says "Children (through age 12): Free". The finder wrote "children under
  12". Write: **"Children through age 12 and museum members are admitted free."**
- **PUBLISH** "in the historic American Industrial Center" — the operator's own words about its own
  address.
- **DROP.** "The T Third Muni Metro and bus lines 48, 15 and 55 stop within one block." No source
  is given for it, and "within one block" is orientation by impression. If the author wants
  transit, it needs a transit-agency source and must name a stop, not a distance.
- **DROP** "opened in spring 2013". The finder flags this itself; affirmed. The 2013-04-30 registry
  row is a registration date and is not an opening date, and a founding year off an operator's own
  site is a trading-duration claim in any case.

### 2.2 Minnesota Street Project — PUBLISH, one REWRITE

Re-fetched `minnesotastreetproject.com`. Addresses **1275 Minnesota Street**, **1201 Minnesota
Street**, **1150 25th Street** confirmed. Registry confirms five open locations under "Minnesota
Street Project LLC" exactly as the finder lists them. **No opening hours are published** —
confirmed, and the publishable form is about the fact, not about the fetching: **"No source states
regular opening hours."**

- **REWRITE.** The finder's gallery list is incomplete. The site also names **Slash**. Write:
  Casemore Gallery, Themes + Projects, Ruth Asawa Lanier Inc., Hashimoto Contemporary / Harman
  Projects, Municipal Bonds, Nancy Toomey Fine Art and Slash.
- **The straddle is not escalated — it is resolved.** See §4.0.

### 2.3 Letterform Archive — PUBLISH, one REWRITE, one DROP

Re-fetched `letterformarchive.org/visit/`. **2325 Third Street, Floor 4R**; mailing address 2339
Third St. Hours Thursday 13:00–20:00, Friday 11:00–18:00, Saturday–Sunday 11:00–13:30 and
14:00–18:00, closed Monday–Wednesday. Admission general $10; student, senior, educator, people with
disabilities $5; children 12 and under free; members free. Registry "Letterform Archive", 2339 3rd
St Ste 70, from 2020-10-01, open. **PUBLISH.** The finder is right that this is the strongest find
the roster draw did not name.

- **REWRITE.** The site marks Thursday "complimentary entry", not "free to all". Write: **"Thursday
  admission is complimentary."**
- **DROP** the collection names — Piet Zwart, W.A. Dwiggins, Emigre, Linotype master drawings. They
  are not on the visit page I fetched. They may publish only from the archive's own collections
  page, fetched and quoted.

### 2.4 Irving M. Scott School — PUBLISH, two DROPs

Designations at §1.3. Built 1895. **PUBLISH.**

- **DROP** "oldest surviving public school building in the city" and "oldest public school building
  in San Francisco". The finder flags both; affirmed. A superlative does not publish attributed.
- **DROP** "the only one of the four individual designations that does". "The only" is a
  superlative and the sentence is about the finder's own polygon test. Neither reaches the reader.

### 2.5 Esprit Park — PUBLISH, two DROPs

`gtr9-ntp6` objectid 4133 confirmed to eight decimals: **2.22949667 acres**, **97,117.26 square
feet**, perimeter **1,285.70 feet**, address **700 Minnesota St**, ownership **Recreation & Park**,
propertytype **Neighborhood Park or Playground**, property_id 193, Mission Bay Complex, Supervisorial
District 10. The finder's rounding to 2.23 acres / 97,117 sq ft / 1,286 ft is accurate. **PUBLISH.**

- **DROP** "donated to the city by Esprit Corp." Wikipedia-only; no city source. The finder says so
  itself and the drop is affirmed.
- **DROP** "the ONLY Rec & Park property in the city whose `mons_neighborhood` reads Dogpatch." I
  confirmed it is true — one property in 255 — and it still does not publish. It is a superlative
  and it is a statement about a dataset field.

### 2.6 Pier 70 and the Union Iron Works yard — PUBLISH as ONE place, one REWRITE

Roster-named ("the Pier 70 historic yard"), so it is Dogpatch's under P1. NRHP 14000150 at §1.2.
SF Planning's description publishes: sixty-six acres at Potrero Point, bordered by San Francisco
Bay, with "buildings, piers, slips, cranes, segments of a railroad network, and landscape
elements", most "constructed of unreinforced brick masonry, concrete, and steel framing with
corrugated iron or steel cladding." **PUBLISH.**

- **REWRITE, permissive.** The four named structures may ship **with architect and year only, and
  with no building numbers**: the 1917 Bethlehem office building by Frederick Meyer in Renaissance
  Revival; Power House No. 1 of 1912 by Charles P. Weeks; the Union Iron Works office of 1896 by
  Percy & Hamilton; the machine shops of 1885. I re-fetched the Wikipedia article and it carries
  all four with those architects and dates. They are encyclopedia-sourced and thin, and the finder
  says so honestly. **The author invents no building number.** If the author is not comfortable
  with the sourcing, the yard ships as one entry with its reference number and the SF Planning
  description, which is the finder's own fallback and is sufficient.
- **DROP** "the huge 1885 Machine shops" as phrasing — write "the machine shops of 1885".

### 2.7 Crane Cove Park — PUBLISH, three DROPs, and the finder missed its own best evidence

Re-fetched `sfport.com/cranecovepark`. **PUBLISH**: "a seven-acre bay front park", at 18th Street
and Illinois, with a beach with bay access for kayaking, paddle boarding and wading; picnic tables,
benches, grills; two children's play areas; an off-leash dog run; a promenade connecting to a
lookout deck; public restrooms.

- **The finder missed that the Port's own page says the park is "in the Dogpatch neighborhood."**
  §3.7 flags Crane Cove as a straddler on SF Find alone and never notices that the operator source
  it cited resolves the question. See §4.0.
- **DROP "swimming prohibited".** It is not on the Port page. The page says wading; it does not
  prohibit swimming. This is the finder asserting a restriction its source does not carry, and a
  false safety statement is the worst kind of invention.
- **DROP** the opening year 2020, the cranes **Nick and Nora**, the sloped ramp with ship outlines,
  and the BART Transbay Tube outline. All Wikipedia-only; the Port's page mentions none of them.
  The finder identified this weakness correctly and then wrote the material out anyway.

### 2.8 Warm Water Cove Park — PUBLISH

Re-fetched `sfport.com/warmwatercove`. Confirmed verbatim: "a small park nestled within the
industrial central waterfront in the Dogpatch neighborhood", with "a paved pathway that navigates
through a grove of trees, a picnic table and seating"; amenities benches, picnic tables, paved
pathways; location given as 24th Street; **no acreage published**. **PUBLISH.** The operator places
it in Dogpatch and no rival zone exists — §4.0.

### 2.9 Alberta Candy Factory — DROP as a place

The designation is struck at §1.4. Beyond it the finder has **nothing**: no construction date, no
architect, no original firm, no account of what the building is now. Its own §8 lists this as its
third-least-confident item and §3.9 says "a travel guide needs more than a reference number." It is
right. **DROP.** A place whose entire content is a reference number that four federal routes cannot
stand up is not an entry.

---

## 3. THE TRADING PLACES

### 3.1 The collision the finder missed — Souvla

The finder's §0 states that apart from Arsicault "no candidate below collides with any shipped San
Francisco slug." **That is wrong.** `priv/seed_data/san_francisco/hayes-valley.json` owns
**`souvla-hayes-valley`, name "Souvla"**. The Dogpatch Souvla at 2505 3rd St is a second location
of the same operator — precisely the "collision by name wearing a hat" the finder correctly
identified for Arsicault and then failed to run against its own list.

It is resolvable, and wave 1 already resolved the identical case: Hayes Valley's Blue Bottle ships
as **`blue-bottle-coffee-linden-hayes-valley`** against the Oracle Park code seed's
`blue-bottle-coffee-mission-rock` (arbitration §5.2).

- **REWRITE.** Souvla ships as **`souvla-dogpatch`**. The registry confirms "Souvla" at 2505 Third
  St from 2022-03-24 and "Souvla Dogpatch LLC" at 2505 3rd St from 2023-01-01, both open.

I re-ran the corpus scan across all 349 files carrying places and **no other Dogpatch candidate
collides** by slug or by name. Piccino is clean today, but the arbitration assigns **Piccino
Presidio, 1 Letterman Drive** to wave 2's Presidio page and the registry confirms it open, so
Dogpatch's takes **`piccino-dogpatch`** to keep the two apart. Humphry Slocombe's Ferry Building
and Capp Street rows are open and unshipped; use **`humphry-slocombe-dogpatch`**.

### 3.2 PUBLISH — 15 places carrying an operator source

These have a name, an address and at least one fact from the operator's own site. I re-fetched
`piccino.com` and confirm the finder's row; the rest stand on the finder's fetches.

| Place | Address | Ruling |
|---|---|---|
| Piccino | 1001 Minnesota St | **PUBLISH** — REWRITE the hours, §3.3 |
| Long Bridge Pizza Company | 2347 3rd St | PUBLISH — address only; no hours published |
| Giuliana's Just For You Cafe | 732 22nd St | PUBLISH — Mon–Fri from 7:30, Sat–Sun from 8:00 |
| Wolfsbane | 2495 3rd St | PUBLISH — Tues–Sat from 17:30 |
| Souvla | 2505 3rd St | **REWRITE the slug**, §3.1 |
| Butter& | 690 Indiana St | PUBLISH — Sun from 10:00, Mon closed, Tues–Sat from 10:00 |
| Kin Khao Eatery | 690 Indiana St | PUBLISH — shares 690 Indiana with Butter& |
| Humphry Slocombe | 699 22nd St | PUBLISH — registry 2023-04-06 open, confirmed |
| Wooly Pig | 2295 3rd St | PUBLISH — address only |
| Domaine SF | 2331 3rd St | PUBLISH — address only |
| Mainstay Markets | 655 22nd St | PUBLISH — address only |
| Graphic Arts Workshop | 2565 3rd St #305 | PUBLISH — Friday and Saturday noon to 5pm |
| Velocipede Cyclery | 2405 3rd St | PUBLISH — address only |
| Olivier's Butchery | 1192 Illinois St | PUBLISH — Wed from 11:00, Thurs–Sun from 10:00 |
| Dogpatch Boulders | 2573 3rd St | PUBLISH — address only |

### 3.3 REWRITE — Piccino's hours and domain

`piccinocafe.com` **301s off-host to `piccino.com`**; the author cites the canonical host. The site
publishes meal periods, not open-from times. Exact wording:

> Piccino is at 1001 Minnesota Street. Dinner is served Wednesday to Sunday from 5pm to 9pm, lunch
> Wednesday to Friday from 11am to 2pm, and brunch Saturday and Sunday from 11am to 2pm. It is
> closed Mondays and Tuesdays. Bar Piccino adjoins the dining room at 1003 Minnesota Street.

### 3.4 DROP — 26 registry-only rows

**The finder's own §6 decides this and I am applying it rather than overriding it.** ICA SF sat in
the registry at 901 Minnesota with a null `location_end_date` while its own site said it had moved
to Yerba Buena. I re-fetched `icasf.org/visit/`: the museum is at the Transamerica Pyramid Center,
in Yerba Buena, "ICA SF is always free", and no Minnesota Street address appears. I also re-fetched
the registry: the 901 Minnesota row is **still open**. The finder's methodological catch is
confirmed exactly, and it is the best work in the file.

A null end date means the tax registration is open, not the door. Wave 1 dropped places for
OSM-only and dead-host sourcing on the same principle. **All of these DROP:**

Dogpatch Saloon · Third Rail · Marcella's Lasagneria e Cucina · Gilberth's Latin Fusion (403) ·
Ungrafted (403) · Daily Driver · The Cheese School · Aura Lounge & Restaurant · The Sea Star ·
Together Lounge · Moshi Moshi · Honey Bear Boba · Corgi Cafe · Autumn's Cafe · Reno Liquors ·
Gamsaan Cocktail Co. · Bay Area Brewery Tours · Recchiuti Confections · Bryr · Rickshaw Bagworks ·
Baggu · Belinda Chocolates · Volcano Kimchi · 3rd St Gym · Dogpatch Games · La Scuola International
School.

Two notes. **Recchiuti** is confirmed open in the registry at 2565 3rd St Ste 225 from 2003-01-02,
but its live corporate site publishes no Dogpatch address — a visitor cannot be sent to a door the
operator does not name. **3rd St Gym**: Wikipedia's "a boxing gym for local amateurs" does not name
it, so it corroborates nothing.

**American Industrial Center — DROP as a place.** No sourced construction date, architect or
original use; no Wikipedia article. It appears only as the address of things inside it, which is
what the finder recommends.

### 3.5 DROP — the five confirmed-closed

Serpentine · Neighbor Bakehouse · Triple Voodoo Brewery & Taproom · Workshop Residence · Poquito.
Each carries a registry `location_end_date`. The finder is right that third-party guides still list
them. **None is written, and no page explains that they closed.**

---

## 4. STRADDLERS

### 4.0 RESOLVED, not escalated — and the finder's largest section was wasted

**§1 of the finder file is 45 lines arguing a question wave 1 already answered.** Arbitration **P1**:
*"The roster's `draw` string beats every boundary layer. A place named in a zone's `draw` is that
zone's, and no point-in-polygon result unmakes it… one finder wasted its largest section fighting
it."* That sentence was written about wave 1. It applies again here.

The `dogpatch` draw reads: **"The Minnesota Street Project, Museum of Craft and Design, the Pier 70
historic yard, Esprit Park, the surviving workers' cottages."** So:

| Contested by the finder | Ruling |
|---|---|
| **Minnesota Street Project** | **DOGPATCH.** Roster-named. P1. Not escalated. The finder calls it "the sharpest straddler in the zone"; it is not a straddler at all |
| **Pier 70 / Union Iron Works yard** | **DOGPATCH.** Roster-named. P1 |
| **Museum of Craft and Design** | **DOGPATCH.** Roster-named, and its own site says Dogpatch |
| **Esprit Park** | **DOGPATCH.** Roster-named |
| **Crane Cove Park** | **DOGPATCH.** Not roster-named, but the **Port's own page places it "in the Dogpatch neighborhood"** — evidence in the finder's own cited source that it did not read |
| **Warm Water Cove Park** | **DOGPATCH.** Port's own page says Dogpatch; no rival zone exists |

There is a second reason the finder's five-locator exercise could not have worked. **EAS
(`3mea-di5p`) and the Analysis Neighborhoods (`j2bu-swwd`) use the same 41-unit geography, and that
geography contains no Dogpatch at all.** I confirmed it: all six resolving addresses I queried —
1275 Minnesota, 700 Minnesota, 1060 Tennessee, 555 19th, 331 Pennsylvania — return `nhood`
**"Potrero Hill"**, without exception. An instrument that can only ever return one answer cannot
adjudicate anything. Wave 1 met this exact problem and ruled in §3a that **SF Find's 117 units beat
the 41 Analysis units for a block-scale question**. Under the governing layer, the zone's core is
Dogpatch's.

**Consequence: the finder's premise that "on the tightest reading Dogpatch owns almost none of its
own draw" is not a live question.** The arbitrator does not need to rule on it.

### 4.1 ESCALATED — 7

1. **Bethlehem Shipbuilding Corporation Hospital, 331 Pennsylvania Ave (NRHP 100008498).** EAS
   "Potrero Hill"; Wikipedia "Potrero Hill". Potrero Hill was declined with the reason **"Adjacent
   to Dogpatch, which took the industrial-heritage material."** Wave 1's Telegraph Hill precedent —
   *"a declined zone. If North Beach does not take them nobody can"* — points to Dogpatch.
   **Recommend: DOGPATCH, with the reference number and NO listing date** until the 29 Dec 2022 /
   6 Jan 2023 conflict is settled. The finder was right to call this the cleanest test of what the
   Potrero Hill decline meant.
2. **22nd Street Caltrain station, 1150 22nd St.** SF Find "Potrero Hill"; Caltrain's own page 404s
   on every pattern. **Recommend DROP for want of any operator source**, independent of zone.
3. **The north edge — Moshi Moshi, Autumn's Cafe, The Gantry, Tercera, The Cove.** SF Find Dogpatch
   but within a block or two of Mission Bay, **a live zone in this wave**. This is the only genuine
   two-page contest Dogpatch has. All five are registry-only and drop on sourcing anyway (§3.4), so
   the escalation is about the boundary, not about five entries.
4. **The south edge — Harmonic Brewing (1050 26th St), The Midway (900 Marin St).** SF Find Central
   Waterfront, Analysis Bayview Hunters Point. Neither rival has a page. Vernacular Dogpatch
   reaches Cesar Chavez and would take Harmonic.
5. **Potrero Power Station / Station A, 1201 Illinois St.** The finder gathered no sourced facts.
   **Recommend DROP** — there is nothing to escalate about.
6. **Arsicault Bakery, 2565 3rd St Ste 202.** Registry confirms it open from 2024-08-14, and
   confirms Arsicault runs five San Francisco locations including 1070 Bridgeview Way, which is the
   Mission Rock shop the code seed owns. **This is already decided by precedent**: the Blue Bottle
   and Flour + Water rulings (arbitration §5.1–5.2) say a different location takes a distinct
   location-qualified slug. **Recommend: ships as `arsicault-bakery-dogpatch`, the Mission Rock
   code seed untouched and unrestated, and only if the author fetches the operator's own site.**
   The finder was right to flag it and over-cautious in refusing to claim it.
7. **The Pearl / Nick & Nora / Side Hustle / School Night, 601 19th St.** An events venue with an
   operator site. Venue or visitor attraction is a kind question, not a boundary one.

---

## 5. WHAT THE FINDER GOT WRONG

Recorded plainly. This is a strong file — its §6 is the best methodological work I have read in
this wave — and these are its defects.

1. **It missed the Souvla collision** while running the collision test correctly on Arsicault. §0's
   "no candidate below collides with any shipped San Francisco slug" is false.
2. **It claimed a federal verification it did not have.** §2.2 sources all four individual
   designations to NPS layer 0 "by bbox and by refnum". **100006997 returns zero features on both
   layers by both keys.** Presenting an unverified number as register-checked is the failure wave 1
   called the worst thing in its wave.
3. **It missed that the Port's own Crane Cove page says "in the Dogpatch neighborhood"** — the
   evidence that dissolves the straddle it spent a section flagging, in a source it cited.
4. **It invented a safety restriction.** "Swimming prohibited" is not on the Port page.
5. **It printed "Appendix L"** for the Dogpatch district while admitting in §7 that it never read
   the appendix.
6. **It spent its largest section on a question P1 had already closed**, and the arbitration
   explicitly warned against exactly this.
7. **It wrote out Wikipedia-only material it had itself marked as weak** — the crane names, the
   opening year, the Transbay Tube outline — instead of dropping it.
8. Smaller: `piccinocafe.com` 301s to `piccino.com`; the MSP gallery list omits **Slash**; MCD
   admission is "through age 12", not "under 12"; Letterform's Thursday is "complimentary entry";
   the LM 138 designation document lives on `sfplanninggis.org`.

**What it got right and should be credited for:** the ICA SF catch, which I reproduced exactly and
which should be carried into every remaining zone in this wave; the `taken_slugs.py` defect report,
which is correct and which the brief is wrong about (the tool globs `priv/seed_data/rome/*.json`
only and sees 1,279 of 4,389 places); the 555 19th Avenue geocoding trap; the contributor-count
ban; the refusal to print a contested listing date; and the honest §7 list of what it could not
get.

---

## 6. TIER — GUIDE, on 23 surviving places

Counted honestly, after every drop above.

| Group | Surviving |
|---|---|
| Anchors — MCD, Minnesota Street Project, Letterform Archive, Irving M. Scott School, Esprit Park, Pier 70 / Union Iron Works yard, Crane Cove Park, Warm Water Cove Park | **8** |
| Eating and drinking with an operator source | **11** |
| Making, selling, showing with an operator source | **4** |
| **Total** | **23** |

A town page is **under six places** with a 90-word intro floor and two links. Dogpatch survives at
**nearly four times that floor**, and it clears six on its anchors alone. **The tier is not
marginal and is not conditional on any escalation in §4.1** — every escalated item is either a
single place or a group that drops on sourcing regardless. Even if the arbitrator sends the whole
north edge to Mission Bay and refuses Bethlehem, Dogpatch ships 23.

The finder's own judgement — "this is a guide, not a town page" — is correct, though its
sixty-eight-candidate count is not the number that matters; 23 is.

**Two ticketed institutions publish full hours and admission prices** (Museum of Craft and Design,
Letterform Archive), which is the spine. The zone also carries a federally listed industrial
district with a verified reference number, an Article 10 district with a verified ordinance, a
building on two registers, and three waterfront parks with operator-sourced descriptions.

---

## 7. LEDGER

| | Count |
|---|---|
| **PUBLISH** | **29** |
| **REWRITE** | **7** |
| **DROP** | **44** |
| **ESCALATED** | **7** |
| **Tier** | **GUIDE, 23 places** |
| **Designation identifiers claimed** | 6 |
| **Survived re-fetching** | **4** — Article 10 Ord. 66-03 (2003-04-18) · NRHP 14000150 (2014-04-17) · SF Landmark No. 138 (1981) · NRHP 85000714 (11 Apr 1985) |
| **Contested** | 1 — NRHP 100008498, number real, date unsettled, zone escalated |
| **Struck** | 1 — NRHP 100006997, verification claim false, number unconfirmable |
