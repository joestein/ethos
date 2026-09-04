# Financial District, San Francisco — VERDICTS

Adjudicated against the finder at `docs/san-francisco/financial-district-finder.md`.
Every designation number below was re-fetched live today. Ownership was re-checked corpus-wide
against all 4,389 committed places, not against the finder's own script output.

**Counts: 79 designation citations PUBLISH · 21 items REWRITE · 19 items DROP.**
**Tier: `guide`, on 34 surviving places.**

---

## 0. THE OWNERSHIP CHECK THE FINDER GOT WRONG

`.superpowers/taken_slugs.py` does only glob `priv/seed_data/rome/*.json`, so the finder was right
that it answers "0" for San Francisco. It was wrong to stop there: `.superpowers/vf_taken_all.py`
already exists, globs `priv/seed_data/**/*.json` recursively, and reports **4,389 places across the
whole corpus** — not 468 across twelve San Francisco files. Running the corpus-wide scan turns up
two collisions the finder missed and one it could not have seen:

### DROP — **Bix, 56 Gold Street.**
Already owned by **north-beach** as `bix-north-beach`, name "Bix", address "56 Gold Street, San
Francisco, CA". The finder works Bix up twice — as an operating business in §4 and again in the §6
table — and flags neither. This is the single worst defect in the document, because §4 is the
Jackson Square section and Bix was being offered as the cluster's anchor tenant. It is North
Beach's and cannot be restated.

### DROP — **California Street cable car line.**
Already owned by **nob-hill** as `california-street-cable-car-line-nob-hill`. §8 proposes the
line's Financial District end as a subject. The line is one place and it is taken. The Ferry
Building page may say the California Street cable car line reaches the building, because
`ferrybuildingmarketplace.com/visit/` says so in its own transit list — that is a fact about the
Ferry Building, not a second claim on the line.

### DROP — **Path of Gold Light Standards (No. 200)** and **The Golden Triangle Light Standards
(No. 233).**
The finder asks the arbitrator to decide; the answer is already decided. No. 200 runs 1–2490
Market and crosses SoMa, Hayes Valley and Castro, all shipped. A corridor landmark is not a place
in any one neighbourhood, and claiming it here asserts a containment that is false the moment a
reader walks two blocks. No. 233 has the same defect at smaller scale. Neither publishes.

### Confirmed clean
The twelve collisions the finder *did* list are real and correctly excluded. The Manhattan
`financial-district` seed file exists and owns `the-battery` and `trinity-church-wall-street` under
bare slugs. **Every place slug on this page must carry a `-financial-district` or
`-sf-financial-district` suffix** or `assert_place_slugs_globally_unique!/0` fails the build. The
roster already resolves the destination-string half of this with "San Francisco Financial District,
California"; it does not resolve the slug half, and the finder does not mention it.

---

## 1. DESIGNATION NUMBERS — RE-FETCHED, ALL 79 SURVIVE

### 1a. Article 10 landmark numbers — 52 of 52 exact. PUBLISH.

Re-fetched `https://data.sfgov.org/resource/97yj-54sx.json?$limit=1000`, 370 rows, keyed on
`landmarkno`, diffed on name, address and `yeardesignated`. **Every number, name and year the
finder claims matches the live record.** Wave 1's verifier found a wrong certification date doing
exactly this; there is no equivalent error here.

Surviving and publishable: **3** Bank of California 400 California 1968 · **7** Audiffred Building
1–21 Mission 1968 · **9** Langerman's/Belli 722 Montgomery 1969 · **10** Genella/Belli Annex
728–730 Montgomery 1969 · **11** Hotaling Stables 32–42 Hotaling Place 1969 · **12** Hotaling
Building 451–461 Jackson 1969 · **13** Hotaling Annex-East 443–445 Jackson 1969 · **14**
Medico-Dental 435–441 Jackson 1969 · **15** Old Ghirardelli 415–431 Jackson 1969 · **16** Regency
House – Ghirardelli Annex 407 Jackson 1969 · **19** Golden Era 730 Montgomery 1969 · **20**
Hotaling Annex West 463–473 Jackson 1969 · **22** Solari Building East 468–470 Jackson 1970 ·
**23** Solari Building West 472 Jackson 1970 · **24** Yeon 432 Jackson 1970 · **25** Moulinie
458–460 Jackson 1970 · **26** Bank of Lucas, Turner & Company 800–802 Montgomery 1970 · **27**
Grogan-Atherton-Lent 701 Sansome 1970 · **34** U.S. Mint & Subtreasury 608–610 Commercial 1970 ·
**37** Hallidie 130–150 Sutter 1971 · **72** V. C. Morris 140 Maiden Lane 1975 · **73** Lotta's
Fountain 1975 · **76** Mills Building & Tower 220–232 Montgomery 1975 · **90** Ferry Building 1977
· **91** Gibb-Sanborn/Trinidad Bean 855 Front 1977 · **92** Gibb-Sanborn/North Pelican Paper
901–925 Front 1977 · **107** Rincon Annex Post Office 1980 · **109** A. Borel & Company 440
Montgomery 1980 · **110** Italian American Bank 460 Montgomery 1980 · **113** S.F. Curb Mining
Exchange 350 Bush 1980 · **117** Hammersmith 303 Sutter 1980 · **131** Wells Fargo Union Trust
Branch 744 Market 1981 · **134** The Mechanics Institute 57–65 Post 1981 · **142** PG&E Old Station
J 565–569 Commercial 1981 · **143** Fire Station 2 460 Bush 1981 · **145** Buich Building/Tadich
Grill 240–242 California 1981 · **146** Jack's Restaurant Building 615 Sacramento 1981 · **155**
Flatiron 540–548 Market 1982 · **156** Phelan 760–784 Market 1982 · **158** Federal Reserve Bank
400 Sansome 1983 · **160** Royal Globe Insurance 210 Sansome 1983 · **161** The Kohl Building 400
Montgomery 1983 · **173** Notre Dame des Victoires Church & Rectory 564–566 Bush 1984 · **183**
Crown Zellerbach 1 Bush **1987** · **212** Columbia Savings Bank 2000 · **243** Chronicle Building
690 Market 2007 · **297** One Montgomery Street 2022 · **298** "The Allegory of California" Mural
155 Sansome 2022 · **299** Jones-Thierbach Coffee Company 447 Battery 2022.

The finder's self-correction on **183 = 1987, not 1983** is confirmed correct against the full
record. Keep it.

**REWRITE — Landmark No. 107 address.** The finder writes "99–199 Mission Street" in §5. The live
Article 10 record reads **99 Mission Street**; the National Register record for the same building
reads 101–199 Mission St. Use: *"Rincon Annex Post Office, San Francisco Landmark No. 107,
designated in 1980, at 99 Mission Street."*

**REWRITE — the designation-PDF path.** §2a gives
`https://sfplanninggis.org/docs/landmarks_and_districts/LM<n>.pdf`. The live
`designationdocument` field is **`https://files.sfplanning.org/documents/preservation/LM<n>.pdf`**.
Research-facing only, but a later wave will follow the wrong one.

### 1b. National Register references — 27 of 27 exact. PUBLISH.

Re-fetched the NPS `nrhp_locations` MapServer over a Financial District envelope, layers 0 and 1,
49 + 11 features. **The reference-number field is `NRIS_Refnum`, not `REFNUM`** — a direct
`REFNUM IN (...)` query 400s, which is how a verifier gets a false "not listed". Every number and
certification date the finder claims matches:

71000185 Hallidie 11/19/71 · 77000334 Mills 04/13/77 · 75000476 U.S. Customhouse 01/29/75 ·
13000590 U.S. Appraisers Stores and Immigration Station 08/13/13 · 89000009 Federal Reserve Bank of
San Francisco 07/31/89 · 78000754 Bank of Italy 06/02/78 · 97000348 Hunter–Dulin 04/17/97 ·
09001118 Four Fifty Sutter 12/22/09 · 86003514 PG&E Substation J 12/29/86 · 02000371 SFFD Engine
Co. No. 2 04/17/02 · 75000475 Lotta Crabtree Fountain 06/20/75 · 78000760 Union Ferry Depot
12/01/78 · 97001189 Gibb, Daniel, & Co. Warehouse 10/10/97 · 91000561 APOLLO (Storeship) 05/16/91 ·
91000563 NIANTIC (Storeship) 05/16/91 · 79000535 Old Ohio Street Houses 05/31/79 · 98001551 Pier
One 01/05/99 · 79000528 Audiffred 05/10/79 · 79000537 Rincon Annex 11/16/79 · 95001384 Matson
11/29/95 · 95001385 PG&E General Office 11/29/95 · 78000756 Ferry Station Post Office 12/01/78 ·
71000186 Jackson Square Historic District 11/18/71 · 02001390 Central Embarcadero Piers Historic
District 11/20/02 · 06000372 Port of San Francisco Embarcadero Historic District 05/12/06 ·
66000233 San Francisco Cable Cars 10/15/66 · 00000525 San Francisco–Oakland Bay Bridge 01/07/22.

**PUBLISH, addition the finder missed.** The NPS record for **Bank of Italy, 552 Montgomery
(78000754)** carries `Is_NHL = X`. It is a National Historic Landmark as well as a National
Register listing. That is a citable designation the finder left on the table.

**DROP — "named a National Historic Landmark in 1964"** for the cable cars. `Is_NHL = X` is in the
record; **the 1964 date is not**, and no source in the finder carries it. Cite NR 66000233,
certified 15 October 1966, and say nothing about 1964 unless someone sources it.

### 1c. Jackson Square's register status — the finder's "three tables, three answers" is wrong

§2b and §9.1 report a contradiction across three City tables and rate Jackson Square low-confidence.
Re-fetching `63x5-g3m4` shows **two rows for Jackson Square Historic District, not one**:

| row | `a10` | `nr` | `cr` | `origin` |
|---|---|---|---|---|
| Jackson Square Historic District | **Listed** | No | No | **Ord. 221-72** |
| Jackson Square Historic District | No | **Listed** | Listed | — |

These are the same district recorded once per register, which is what `m22e-6hkz` also shows. There
is no contradiction to resolve and no low-confidence flag to carry. Both citations stand and both
publish:

> *Jackson Square Historic District, designated under Article 10 of the Planning Code by Ordinance
> 221-72, with a period of significance of 1850 to 1911.*

> *Listed on the National Register of Historic Places in 1971, reference number 71000186.*

Northeast Waterfront Historic District confirms as `a10 = Listed`, `origin = Ord. 171-83`, `nr =
No`. **DROP any National Register claim for Northeast Waterfront** — the finder does not make one,
and nobody downstream should.

### 1d. Article 11 — publishes, but the gate will kill three wordings out of four

`6m3x-8fu4`, 786 rows, distribution I:217 II:40 III:53 IV:175 V:301. Spot-checked twenty of the
finder's claims; all correct, including **MERCHANT'S EXCHANGE, 465 California, Category I** (it is
spelled with an apostrophe, which is why a naive substring search misses it — the finder's claim is
good).

**DROP — "Crown Zellerbach Building … Article 11 rated."** There is no row for 1 Bush Street and
none whose name contains Zellerbach. The Landmark No. 183 citation is sound; the Article 11
sentence is not.

**REWRITE, and this is a build-breaker.** The gate's citation regex accepts
`Article\s*10\b`. **"Article 11" does not match it.** So any sentence containing *designated*,
*listed*, *landmark*, *registered* or *nominated* alongside an Article 11 category **fails
`test "every designation claim names its register and identifier"`**. The finder's suggested
wording happens to survive because it uses none of those five words. Make that explicit and
mandatory:

> SAFE: *"The Merchants Exchange at 465 California Street carries Category I under Article 11 of
> the San Francisco Planning Code."*
> FAILS THE BUILD: *"…is listed as Category I under Article 11…"* / *"…was designated Category
> I…"*

---

## 2. THE FIVE SOURCES LEANED ON HARDEST — RE-FETCHED

### 2.1 `thepyramidsf.com` — **DROP the source, and three facts with it**

The domain **no longer belongs to the building**. It 301s cross-host to
`shvo.com/portfolio/transamerica-pyramid-center/`, a developer's portfolio page whose own last line
reads "SHVO sold its interest in the property in 2026." The finder cites it as "Owner's site". It
is not one.

What the page still states, and what publishes as ordinary fact: designed by **William Pereira**,
**completed 1972**; **white quartz** cladding; **over 3,000 windows**; remastering with **Foster +
Partners completed in 2024**; address **600 Montgomery**.

**DROP — "853 feet."** The page says "**over 850 feet**". 853 is a precision the source does not
carry. Either write *"the tower stands over 850 feet"* or drop the height.
**DROP — "763,000 square feet"** for the Pyramid, **"362 feet, 191,000 square feet"** for Two
Transamerica, and **"112 feet, 55,000 square feet"** and **"Willis Polk & Co., 1930"** for Three
Transamerica. None of these is on the page as it now resolves. The finder attributes all of them to
"owner's site above". Assessor build years 1981 and 1930 are a separate, weaker source and §9.2
already says an assessor `yearbuilt` must not be promoted to prose on its own.
**PUBLISH** the finder's own quarantine of "second tallest building in San Francisco" and "most
recognizable landmark on the San Francisco skyline" — both are on the page and both are banned.
Add "one of the most sought-after global gateway cities in the world", which is on it too.

### 2.2 `ferrybuildingmarketplace.com/visit/` — **PUBLISH, unchanged**

Every claim confirmed verbatim: located along the Embarcadero at the foot of Market Street; open
**daily 6:00am to 10:00pm**; hours for individual businesses vary; **closed Thanksgiving Day and
Christmas Day**; the F Market historic streetcars **stop directly in front**; reachable by several
ferry lines, all BART lines, many MUNI lines, the F Market Streetcar and the California Street
cable car line; **validated parking at the ProPark lot at Embarcadero & Washington**. The finder's
refusal of "nearly 50 local artisan food merchants" as volatile is right.

**REWRITE — the 1955/freeway/2003/2024 history paragraph in §3.2.** The finder sources it to
`/about/`; `/visit/` does not carry it and `/about/` was not re-checkable in the same pull. Keep
Landmark No. 90 (1977), NR 78000760 (1 Dec 1978) and **opened 13 July 1898**; hold the interior-loss
and freeway narrative until one fetch shows it.

### 2.3 `foodwise.org` — **PUBLISH**

Confirmed exactly: **Ferry Building, Embarcadero and Market Streets**; **Saturday 8am–2pm and
Tuesday & Thursday 10am–2pm, year round**. The finder's refusal of "Since 1993" as an operator
trading-duration claim is correct. Also refuse the per-day vendor counts now on the page (100+
Saturday, about 20 Tuesday, 10–15 Thursday) — volatile.

### 2.4 `milibrary.org` — **REWRITE, the finder has the chess room wrong**

`/explore-visit-us` and `/visit` both 404; the hours live on **`/about-us`**, which renders three
separate columns. Live:

| | Library | Chess | Building |
|---|---|---|---|
| Sun | Closed | Closed | Closed |
| Mon | 10am–6pm | 10am–6pm | 8:15am–6pm |
| Tue | **10am–8pm** | **10am–6pm** | 8:15am–8pm |
| Wed | 10am–6pm | 10am–6pm | 8:15am–6pm |
| Thu | **10am–8pm** | **10am–6pm** | 8:15am–8pm |
| Fri | 10am–6pm | 10am–6pm | 8:15am–6pm |
| Sat | 10am–5pm | 10am–5pm | 9:30am–5:30pm |

The finder writes "**Library and chess room**: Monday–Friday 10am–6pm (**Tuesday and Thursday until
8pm**)". The Tuesday/Thursday extension applies to the **library only**. The chess room closes at
6pm every weekday. Exact replacement:

> *The library opens Monday to Friday from 10am to 6pm, until 8pm on Tuesday and Thursday, and
> Saturday from 10am to 5pm. The chess room opens Monday to Friday from 10am to 6pm and Saturday
> from 10am to 5pm. The building opens Monday to Friday from 8.15am, until 6pm and until 8pm on
> Tuesday and Thursday, and Saturday from 9.30am to 5.30pm. Both are closed on Sunday.*

Building hours as the finder gave them are correct. **PUBLISH** 57–65 Post Street, Landmark No. 134
(1981), (415) 393-0101, a Beaux Arts library of over 100,000 books, a chess club with a
Grandmaster-in-Residence programme, meeting rooms on the 3rd and 4th floors, registered nonprofit
EIN 94-1254644. **DROP** all three of its own superlatives, as the finder already rules.

### 2.5 `tadichgrillsf.com` — **PUBLISH the hours, DROP the rest**

Hours are on the homepage after all and match the finder exactly: **Monday–Friday dining room and
counter 11:00am to 9:00pm, Saturday 4:00pm–9:00pm, Sunday closed**; **240 California Street, San
Francisco, CA 94111**; (415) 391-1849. Publish with **Buich Building, San Francisco Landmark No.
145, designated in 1981**.
**DROP** "the oldest, continuously run restaurant in California, and third oldest in the United
States", "Serving San Francisco since 1849", "A Worldwide Dining Destination", "legendary", "One of
the World's 10 Great Classic Restaurants", and the whole 1849/1871/1882 Coffee Stand history —
superlative, trading-duration, or both, all from the operator. The finder quarantines these; the
quarantine holds.

---

## 3. OPERATING PLACES — REVERIFIED ONE BY ONE

**PUBLISH — Sam's Grill & Seafood.** 374 Bush Street, SF 94104, (415) 421-0594; **Monday to Friday
11:00 AM to 9:00 PM, Saturday 5:30 PM to 9:00 PM, closed Sundays and major holidays**. Private
booths and mesquite-grilled fresh fish are on the page. **Sam's Tavern, 368 Bush Street, (415)
796-2052, Monday–Friday kitchen 9:30 AM to 9:00 PM with the bar until 10pm, Saturday and Sunday
10:00 AM to 5:00 PM** — the finder said only that the tavern "keeps separate hours"; here they are.
**DROP** "over the past 75 years" and "one of the GOOD EATING PLACES of 'Old San Francisco'".

**PUBLISH — Perbacco.** 230 California Street, SF 94111, (415) 955-0663; **Tuesday to Friday
11:30 am to 9:00 pm, Saturday 5:30 pm to 9:00 pm, closed Sunday**. Confirmed. The Hind Building
carries Category II under Article 11 — confirmed, 230 California, Cat II. **DROP** the site's
"OPENING MONDAYS IN DECEMBER" as volatile.

**REWRITE — Wayfare Tavern.** The finder captured "the address block only". Hours are published:
**Sunday to Wednesday 11:30 am to 9:00 pm, Thursday to Saturday 11:30 am to 10:00 pm**, at **201
Pine Street, San Francisco, CA 94104**. The interior description is confirmed and improves: *"marble
floors, tufted leather booths, a gold leaf mural honouring the Barbary Coast, and a green
serpentine stone bar."* **DROP "Relocated — no longer at 558 Sacramento."** No fetched page says
it. Give the address and stop.

**REWRITE — Cotogna. The finder's flag clears.** `cotognasf.com` resolves and states **490 Pacific
Avenue, San Francisco, CA 94133** with hours: **Monday and Tuesday dinner 4:30 PM to 9:00 PM,
Wednesday and Thursday 11:30 AM to 9:00 PM, Friday and Saturday 11:30 AM to 9:30 PM, closed
Sunday**. The §9.5 low-confidence entry is discharged. It remains a Jackson Square straddler.

**REWRITE — Quince.** Lunch **Friday and Saturday 11:30am to 1:00pm** confirmed, the Bolinas Bar
confirmed as a bar and salon serving a four-course California Coast & Valleys menu, the Gastronomy
Menu confirmed as the main dining room's. **DROP** "Founded in 2003" and "award-winning", as the
finder rules. **Useful for the boundary question:** Quince's own site places itself in "San
Francisco's historic Jackson Square Neighborhood".

**REWRITE — Schroeder's.** 240 Front St, San Francisco, CA 94111 and 415-421-4778 confirmed; hours
are still not on the page fetched, so the finder's "not published" stands and no hours may be
written. **DROP** "Originally founded in 1893", "for the past 120 years", and the 1906
destruction-and-reopening narrative — all operator-sourced duration claims of the same species the
rules bar.

**PUBLISH — Punch Line Comedy Club.** 444 Battery Street, San Francisco, CA 94111, 415.397.7573,
operated by Live Nation, schedule per show. Confirmed.

**DROP — Wells Fargo History Museum.** `wellsfargohistory.com/museums/` now 301s to
`history.wf.com`, which carries Our Story, Early History, Change Makers, Historic Moments,
Stagecoach Resources, Collection Highlights and the Wiltsee Collection, and **no museum listing, no
address and no hours anywhere**. The roster's `draw` field names it as a marquee subject for this
zone; it cannot be written. Flag to the arbitrator that the roster draw is stale.

**DROP — Kokkari Estiatorio.** 403 again. Nothing verified.

**DROP — Old Ship Saloon.** `oldshipsaloon.com` now resolves 200 but renders no address, no hours
and no trading statement. Status still unestablished. Nothing about it publishes, including its
history.

**DROP — Harrington's Bar & Grill.** Confirmed gone; the finder already drops it.

**REWRITE — Embarcadero Center.** Confirmed verbatim: **four buildings spanning four blocks**;
**built in phases over 15 years, development began in 1968 and concluded in 1983**; **construction
of each of the four buildings completed over a ten-year span between 1971 and 1981**; luxury office
space, hundreds of shops, restaurants, services and a multiplex cinema; the complex has earned LEED
certification. **The owner is stated on the page as "Boston Properties", not "BXP"** — use the
page's words. **DROP** "one of the largest mixed-use complexes in the Western United States",
"award-winning architectural design", "one of the most sought-after commercial destinations in San
Francisco" and "more than 16,000 people each day", as the finder rules.

---

## 4. PUBLIC SPACE AND PUBLIC ART — DATASETS RE-QUERIED

`65ik-7wqd` (81 rows), `gtr9-ntp6` and `cf6e-9e4j` (65 rows) all re-queried.

**PUBLISH exactly as written:** Redwood Park (535 Washington, 1972, hours not posted and closes
before 6pm, many redwood trees, 100+ linear seats on boxes and room for 30+ on steps, no food
service, no restrooms; the record's own words are "redwood trees at the foot of the Transamerica
Pyramid … a tall water fountain, sculptures, and ample seating"); Empire Park (642 Commercial,
1988, daylight hours, 15 chairs with tables and 8 bench seats in the park and 8 along Commercial);
101 California (1982, open at all times, ~1,000 linear feet of terraced-step seating with cushions,
food service); 350 Bush (2019, 7AM–6PM M–F, restrooms, indoor park at 350 Bush, snippets at 465
Pine, view terrace at 500 Pine); Trinity Alley at 333 Bush (1983, open at all times, ~50 linear
seats with movable tables, food all along the alley, a living plant wall); 456 Montgomery (1983,
open at all times, 72′ linear seating with 8 movable chairs and 2 tables, escalator access, flowers
and small water fountains); Rincon Center at 121 Spear (1989, open at all times, 78 bench and chair
seats, a café); 1 Market (1976, plaza and atrium, several restaurants and cafés, restrooms at the
Mission Street entrance); Embarcadero Center West 1, 2 & 3 (1985, ground and 2nd levels, 30 tables
and 107 chairs, open at all times); 1 Bush (1959, open at all times, willow trees, seating limited
to the steps); 555 California (1969, open at all times, 24 small wooden bench seats at the elevated
plaza's eastern edge, central pool); 345 California (1986, plaza and two snippets, sandwich shop
and café); 343 Sansome (1990, 15th-floor terrace, 10AM–5PM M–F, restroom key from the lobby
attendant); Citigroup Center at 1 Sansome (1983, ground-floor atrium, marble and glass, café/deli,
restrooms). Rec & Park acreages confirm: Embarcadero Plaza 4.14 at 10 Market, Maritime Plaza 2.01
at 285 Washington, Sue Bierman Park 4.47 at 143 The Embarcadero.

**REWRITE — Crocker Galleria.** The finder writes "Sun-terrace POPOS **on the roof**". The record's
`location` is "**Third floor of shopping center, down dark hallway**". Write: *"A sun terrace on the
third floor, open 6am to 7pm Monday to Saturday, with twenty-four benches each 7 feet 8 inches
long, restrooms, and eight large planters with trees."*

**REWRITE — 150 California.** "Six storeys above the street" is an interpretation; the record says
`location: 6th Floor`. Write *"on the sixth floor"*.

**REWRITE — 345 California.** **DROP "the west snippet is entered from Sansome Street."** The record
says only "Two snippets on either side of building main entrance, connected by walkway."

**REWRITE — 343 Sansome's artworks, which the finder misplaces.** `cf6e-9e4j` puts Joan Brown's
tiled obelisk **"Four Seasons" in the roof garden** and Pol Bury's stainless-steel-and-marble water
sculpture **"L'Octagon" in the Sacramento Street lobby**, both accessible 9–5. The finder puts both
on the fifteenth-floor view terrace. Write: *"Joan Brown's tiled obelisk 'Four Seasons' stands in
the roof garden and Pol Bury's stainless steel and marble water sculpture 'L'Octagon' in the
Sacramento Street lobby."*

**PUBLISH — the art attributions the finder got right, all confirmed in `cf6e-9e4j`:** Masayuki
Nagare's black granite **"Transcendence"** at 555 California, on the west side of the elevated
plaza, always accessible; Stirling Calder's bronze **"Star Maiden"** at 1 Sansome, north side of
the ground-floor atrium, accessible business hours; Arman's bronze **"Hermes and Dionysus –
Monument to Analysis"** at 400 Sansome, on the front steps at the sidewalk along Sansome Street,
always accessible; at 325 Battery, bronzes by **Fritz Koenig** (untitled, at the spiral staircase
on Commercial Street), **Dimitri Hadzi ("Creazione")** and **Arman ("The Universality of Wisdom",
at the Federal Reserve steps on Battery Street)**; **"The General Harrison" by Curtis Hollenback
and Topher Delaney** at 425 Battery, unearthed ship parts set into the public right-of-way in front
of the building, always accessible, approved under case 2000.613X. **David Tolerton's bronze
fountain at 1 Bush** is confirmed — the finder was right, it sits on the west side of the sunken
POPOS along the Sansome Street frontage.

**PUBLISH the finder's refusal on the Vaillancourt Fountain.** It returns zero rows in
`cf6e-9e4j`, and the SF Arts Commission page 404s. There is no sourced material or measurement.
Embarcadero Plaza may be written from the Rec & Park record; the fountain may be named and nothing
more. And per the photo rule, say nothing whatsoever about why there is no photograph.

**DROP — the Refregier murals detail at Rincon Annex.** Zero rows in `cf6e-9e4j`, no other source
in the finder. Landmark No. 107 covers the building, not the murals by name.

**REWRITE — the Alcoa Building.** The finder is right that landmark number `0` means work-programme,
not designated, and right that no number may be claimed. Maritime Plaza publishes from Rec & Park;
the Alcoa Building publishes only as a building that adjoins it, with no designation sentence.

**Trap for the writer:** Rec & Park stamps Embarcadero Plaza, Maritime Plaza, Sue Bierman Park and
St. Mary's Square with `complex: "North Beach Complex"`. That is an operations grouping, not a
neighbourhood. Nobody may read it as one.

---

## 5. THE COUNTS — THE FINDER REPEATED WAVE 1'S DEFECT

The rule is not in the regex and still binds: **do not count the landmarks.** The finder says its
tables are working material rather than prose, and that is the right instinct, but the counts are
wrong on their own terms and will propagate:

- §4's heading says "**SIXTEEN NUMBERED LANDMARKS**" and §1 repeats "sixteen Article 10 landmarks".
  **The table beneath it has seventeen rows.** This is Castro's defect exactly — nineteen claimed,
  twenty-two named.
- §2 says "**49 San Francisco Article 10 landmark numbers**" and the §2a table has 49 rows, but the
  document goes on to cite **No. 7 (Audiffred)** and **No. 107 (Rincon Annex)** in §5, neither of
  which is in the table. The real figure is 51 there and 52 with No. 162, which is SoMa's.
- §2 says "**77 designation identifiers**". 49 + 2 + 26 = 77 only if the two districts and the four
  district/system listings are counted the way §2 counts them in one place and not the other.

**Strike every tally.** Name the buildings and cite their numbers. No page, no section heading and
no FAQ answer may carry a count of designations.

---

## 6. STRADDLERS ESCALATED TO THE ARBITRATOR

The finder is right that the boundary is genuinely two-valued and right that none of that reasoning
may reach the page. It ruled correctly by refusing to decide. Escalating six groups:

1. **The Transamerica block** — Pyramid, Redwood Park, Two and Three Transamerica. Reading A
   assigns them to Chinatown, which is shipped with fourteen places and does not contain them.
   Rule for the Financial District or the corpus asserts a containment no reader recognises.
2. **Jackson Square** — seventeen Article 10 numbers plus Ordinance 221-72 and NR 71000186. Reading
   A says Chinatown, Reading B says North Beach; **both are shipped and neither took any of it.**
   Quince's own site calls its address "San Francisco's historic Jackson Square Neighborhood", which
   is evidence about the name rather than about the polygon. The largest unclaimed concentration
   left. Note Bix inside it is North Beach's already.
3. **The Sutter / Post / Bush / Maiden Lane group** — Hallidie, Hunter-Dulin, Hammersmith, 450
   Sutter, V. C. Morris, the Mechanics' Institute, Crocker Galleria, Sam's Grill, 111 Sutter.
   Reading B calls this "Downtown / Union Square", and **`union-square` is an in-scope roster zone
   that has not shipped yet.** This is the sharpest straddle in the document and the finder
   under-weights it: it collides with a sibling page that can still be written, not with a fait
   accompli. The arbitrator should split this before either page drafts.
4. **The Market Street group** — Flatiron (155), Chronicle (243), Wells Fargo Union Trust (131),
   Phelan (156), Chancery, Finance, Bankers Investment, Lotta's Fountain (73 / NR 75000475). SoMa
   set the precedent by taking 582 and 700 on the north side.
5. **The southern waterfront edge** — Audiffred (7 / NR 79000528), Rincon Annex (107 / NR 79000537),
   Matson (NR 95001384), PG&E General Office (NR 95001385), Southern Pacific Building at 1 Market.
   SoMa and the unshipped South Beach ground both press on these.
6. **The northern edge** — U.S. Appraisers Stores (NR 13000590), Jones-Thierbach (299), Old Ohio
   Street Houses (NR 79000535), the two Gibb-Sanborn warehouses (91, 92), Sue Bierman Park, U.S.
   Customhouse (NR 75000476), Bank of Italy (NR 78000754, NHL), Old Ship Saloon's parcel.

**Ruled here, not escalated:** Empire Park DROPS (both readings say Chinatown, which is shipped).
St. Mary's Square DROPS. Union Square DROPS (its own in-scope zone). The two light-standard
corridors DROP. Bix and the California Street cable car line DROP as already owned.

---

## 7. TIER

**`guide`. Not a town-page.**

The gate defines town-page as **fewer than six places**, a 90-word intro floor and two outbound
links, and `guide` as **at least four places**, a 100–160 word intro, four to six FAQ entries and a
section headed exactly "Getting there".

Counting only what survives this adjudication and excluding every straddler in §6 and every drop in
§0 — that is, the material no other page can contest — the Financial District still holds **34
places**: the Ferry Building and its Marketplace, the Ferry Plaza Farmers Market, Embarcadero
Plaza, Maritime Plaza, Pier One, the Central Embarcadero Piers Historic District, Bank of
California, the Kohl Building, A. Borel & Company, Italian American Bank, Mills Building & Tower,
Royal Globe Insurance, the Federal Reserve Bank Building, the Pacific Coast Stock Exchange Tower
with the Allegory of California mural, the Pacific Coast Stock Exchange Trading Room, Merchants
Exchange, the Russ Building, the Shell Building, Crown Zellerbach and its sunken plaza, the S.F.
Curb Mining Exchange with the 350 Bush POPOS, 555 California with Transcendence, 101 California,
345 California, 150 California, 343 Sansome, Citigroup Center, 325 Battery, 425 Battery, the
U.S. Mint & Subtreasury Building, PG&E Old Station J, 456 Montgomery, Tadich Grill in the Buich
Building, Perbacco, Wayfare Tavern, Schroeder's, Punch Line and Embarcadero Center. The APOLLO and
NIANTIC storeship sites are legitimate subjects and add two more.

Thirty-four is nearly six times the town-page ceiling. If the arbitrator awards even one of the six
straddler groups the count runs past sixty. Wave 1 shipped two files marked "town-page" carrying 41
and 26 places and the gate now fails that; this one is not close to the boundary in either
direction.

**Requirements that follow:** intro of 100–160 words, four to six FAQ entries, a section headed
exactly `Getting there`, at least four places, `"tier": "guide"`, `"state": "California"`,
`"county": "San Francisco"`, destination `"San Francisco Financial District, California"`,
non-empty `entries` whose `place_slug` values all resolve, every link carrying a valid `kind` and a
note of 160 characters or fewer, a title of 120 characters or fewer, `"photos": []` throughout, and
**every place slug suffixed** so it cannot collide with Manhattan's `financial-district` file.

---

## 8. WHAT THE FINDER GOT WRONG — SUMMARY

1. **Missed that Bix is already North Beach's**, and built the Jackson Square section around it.
2. **Missed that the California Street cable car line is already Nob Hill's.**
3. **Cited `thepyramidsf.com` as the owner's site.** It redirects to a former owner's portfolio
   page, and three of the dimensions attributed to it are not on it. "853 feet" is not sourced.
4. **Got the Mechanics' Institute chess-room hours wrong** by merging two of the site's three
   columns.
5. **Read two Jackson Square rows as a contradiction** and downgraded a sound citation to
   low-confidence when the two rows are simply two registers.
6. **Claimed Article 11 for Crown Zellerbach**, which has no row.
7. **Misplaced both 343 Sansome artworks** onto the view terrace.
8. **Put Crocker Galleria's terrace on the roof** when the record says third floor, and invented a
   Sansome Street entrance for the 345 California west snippet.
9. **Counted the landmarks** — sixteen against a seventeen-row table, 49 against a set it then
   cites 51 of, and 77 against a sum that only works one way.
10. **Gave the wrong designation-PDF host**, and would have sent the next wave to a dead path.
11. **Under-weighted the Union Square straddle**, which is a live unshipped sibling rather than a
    settled boundary.
12. **Missed that Bank of Italy is a National Historic Landmark**, a citation available for free.
13. **Left the slug-collision risk with Manhattan's `financial-district` file unmentioned.**

What it got right, and it is most of the document: **every one of the 79 designation identifiers it
claims survives re-fetching against the live registers, exactly.** That is the part a verifier is
here to break, and it did not break.
