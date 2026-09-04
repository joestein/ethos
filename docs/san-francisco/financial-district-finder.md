# Financial District, San Francisco — FINDER

Destination string is disambiguated from Manhattan's Financial District. Every candidate below is
in San Francisco, California.

**Not a shipping decision.** Everything here is raw material for the verifier and the arbitrator.
Where two sources disagree I have kept both. Where I could not source a claim I have said so
rather than guessing.

---

## 0. WHAT IS ALREADY OWNED (checked first)

`.superpowers/taken_slugs.py` only globs `priv/seed_data/rome/*.json` — it reports "0 places
already owned" for every San Francisco query and is useless for this task. I re-ran the same
logic against `priv/seed_data/san_francisco/*.json`:

- **468 places across 12 files** — mission, north-beach, chinatown, haight-ashbury, castro,
  marina, soma, fishermans-wharf, nob-hill, russian-hill, pacific-heights, hayes-valley.
- Script used: `/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/sf_taken.py`

**Collisions that matter for this zone — already shipped, DO NOT CLAIM:**

| Place | Address | Owned by |
|---|---|---|
| The Hobart Building | 582 Market Street | soma |
| Mutual Savings Bank Building | 700 Market Street | soma |
| Palace Hotel | 633 Market Street | soma |
| Building at 735 Market Street | 735 Market Street | soma |
| Hale Brothers Department Store | 901 Market Street | soma |
| Old St Mary's Cathedral | 660 California Street | chinatown |
| Portsmouth Square | 745 Kearny Street | chinatown |
| International Hotel / Manilatown Center | 868 Kearny Street | chinatown |
| R&G Lounge | 631 Kearny Street | chinatown |
| Sam Wo | 713 Clay Street | chinatown |
| Sentinel Building (Columbus Tower) | 916–920 Kearny Street | north-beach |
| House at 1254–1256 Montgomery Street | 1254–1256 Montgomery Street | north-beach |

**Flag for the arbitrator:** SoMa's page took **two buildings on the north side of Market Street**
— the Hobart Building (582 Market, SF Landmark No. 162, NR 100006911) and the Mutual Savings Bank
Building (700 Market, NR 13001107). Both sit in the "Financial District" polygon of DataSF's
Find Neighborhoods layer. This is settled precedent that Market Street was read as a *corridor*
rather than a *boundary* in wave 1, and it constrains what the Financial District can claim on
Market. I have listed the remaining Market Street candidates separately in §5 rather than
assuming either reading.

---

## 1. BOUNDARY WORK — THE CENTRAL PROBLEM WITH THIS ZONE

There is no single official Financial District boundary, and **the City publishes two of its own
that flatly contradict each other.** I tested every candidate against both by point-in-polygon /
address lookup rather than by eyeballing a map.

**Reading A — "Analysis Neighborhoods."** The city's Enterprise Addressing System stamps every
address with an `nhood` value from the 41-zone Analysis Neighborhoods layer.
Source: <https://data.sfgov.org/resource/3mea-di5p.json> (field `nhood`); layer
<https://data.sfgov.org/resource/p5b7-5n3h.json>. The zone is named
**"Financial District/South Beach"** — it fuses the Financial District with South Beach, and it
pushes everything north of roughly Washington/Clay and east of Kearny into **Chinatown**.

**Reading B — "SF Find Neighborhoods."** A 117-zone layer with a standalone **"Financial
District"** polygon, plus separate "Downtown / Union Square", "Chinatown", "North Beach",
"Northern Waterfront", "South Beach" and "Rincon Hill".
Source: <https://data.sfgov.org/resource/gfpk-269f.json> (field `name`).

**Where they disagree (verbatim results):**

| Place | Reading A (`nhood`) | Reading B (Find Neighborhoods) |
|---|---|---|
| Transamerica Pyramid, 600 Montgomery | **Chinatown** | Financial District |
| Redwood Park, 535 Washington | **Chinatown** | Financial District |
| Two Transamerica, 505 Sansome | **Chinatown** | Financial District |
| Three Transamerica, 545 Sansome | **Chinatown** | Financial District |
| Federal Reserve Bank Bldg, 400 Sansome | **Chinatown** | Financial District |
| U.S. Customhouse, 555 Battery | **Chinatown** | Financial District |
| Bank of Italy, 552 Montgomery | **Chinatown** | Financial District |
| PG&E Substation J, 565 Commercial | **Chinatown** | Financial District |
| Jones-Thierbach Coffee Co., 447 Battery | **Chinatown** | Northern Waterfront |
| U.S. Appraisers Stores, 630 Sansome | **Chinatown** | North Beach |
| Hotaling Building, 451 Jackson | **Chinatown** | North Beach |
| Golden Era Building, 730 Montgomery | **Chinatown** | North Beach |
| Old Ship Saloon, 298 Pacific | Financial District/South Beach | **North Beach** |
| Fire Station 2, 460 Bush | Financial District/South Beach | **Chinatown** |
| Notre Dame des Victoires, 564 Bush | Financial District/South Beach | **Chinatown** |
| Jack's Restaurant Bldg, 615 Sacramento | Financial District/South Beach | **Chinatown** |
| Empire Park, 642 Commercial | **Chinatown** | **Chinatown** (both) |
| Hallidie Building, 130 Sutter | Financial District/South Beach | **Downtown / Union Square** |
| Mechanics' Institute, 57 Post | Financial District/South Beach | **Downtown / Union Square** |
| V. C. Morris Bldg, 140 Maiden Lane | Financial District/South Beach | **Downtown / Union Square** |
| Chronicle Building, 690 Market | Financial District/South Beach | **Downtown / Union Square** |
| Lotta's Fountain | Financial District/South Beach | **Downtown / Union Square** |
| Hunter-Dulin Building, 111 Sutter | Financial District/South Beach | **Downtown / Union Square** |
| Sam's Grill, 374 Bush | Financial District/South Beach | **Downtown / Union Square** |
| 450 Sutter | Financial District/South Beach | **Downtown / Union Square** |
| Crocker Galleria, 165 Sutter | Financial District/South Beach | **Downtown / Union Square** |
| One Montgomery Street | Financial District/South Beach | **Downtown / Union Square** |
| Union Square, 333 Post | **Financial District/South Beach** | Downtown / Union Square |
| Sue Bierman Park, 143 The Embarcadero | Financial District/South Beach | **Northern Waterfront** |
| Rincon Annex, 101 Mission | Financial District/South Beach | Financial District |
| Audiffred Building, 1 Mission | Financial District/South Beach | Financial District |
| St. Mary's Square, 633 California | **Financial District/South Beach** | **Chinatown** |
| Ferry Building | *(no EAS row — pier address)* | Financial District |
| South Park | **Financial District/South Beach** | *(South Beach)* |

**Consequences the arbitrator has to rule on, not me:**

1. The **Transamerica Pyramid, Redwood Park and the whole Transamerica block** are assigned to
   **Chinatown** by the City's own address file. Chinatown is already SHIPPED with 14 places and
   does not contain them. Either the Pyramid goes to a live Financial District page against
   Reading A, or the corpus asserts a Chinatown containment that no guide and no visitor would
   recognise.
2. The **entire Jackson Square cluster** (sixteen Article 10 landmarks, §3) reads as North Beach
   under Reading B and Chinatown under Reading A. North Beach is shipped and took only two Kearny
   Street addresses; it did not take Jackson Square. This cluster is the single largest
   unclaimed concentration of numbered landmarks left in San Francisco.
3. **Union Square** is inside the "Financial District/South Beach" analysis zone. It is not a
   Financial District place by any other reading and I have not worked it up as a candidate;
   flagging only because Reading A would sweep it in.
4. The Analysis Neighborhood zone is literally named "Financial District/**South Beach**". If the
   arbitrator adopts Reading A wholesale, South Park, Rincon Hill and the South Beach waterfront
   come with it, and SoMa is already shipped over part of that ground.

**This section must not reach reader-facing prose.** No page may say the readings disagree, name a
dataset, or describe a boundary as contested. Prose gets the side of a named street or a
physical adjacency and nothing else.

---

## 2. DESIGNATION NUMBERS FOUND — SUMMARY

I chased identifiers rather than adjectives. **77 designation identifiers** for places inside or
straddling this zone, all re-fetched live today:

- **49 San Francisco Article 10 landmark numbers** (dataset `97yj-54sx`) — §2a.
- **2 Article 10 historic districts** with adopting ordinances (Jackson Square, Ord. 221-72;
  Northeast Waterfront, Ord. 171-83) — dataset `63x5-g3m4`, §2b.
- **26 National Register reference numbers with certification dates** — 22 individual listings in
  §2c plus four district/system listings in §2b (Jackson Square 71000186, Central Embarcadero
  Piers 02001390, Port of San Francisco Embarcadero 06000372, San Francisco Cable Cars 66000233).
  Source: NPS `nrhp_locations` MapServer, layers 0 and 1.

Plus a second, weaker register with a real identifier: **Article 11 of the Planning Code assigns a
Category (I–V) to individual downtown buildings** — dataset `6m3x-8fu4`. Category I = "Significant
Building". That gives citable status to Merchants Exchange, the Russ Building, the Shell Building,
450 Sutter and about fifty more that have no Article 10 number. See §7.

### 2a. Article 10 landmark numbers (SF Planning Code), live values

Dataset: <https://data.sfgov.org/resource/97yj-54sx.json>
Each row carries a designation PDF at `https://sfplanninggis.org/docs/landmarks_and_districts/LM<n>.pdf`.

| No. | Name | Address | Designated |
|---|---|---|---|
| 3 | Bank of California | 400 California Street | 1968 |
| 9 | Langerman's Building / Belli Building | 722 Montgomery Street | 1969 |
| 10 | Genella Building / Belli Annex | 728–730 Montgomery Street | 1969 |
| 11 | Hotaling Stables Building | 32–42 Hotaling Place | 1969 |
| 12 | Hotaling Building | 451–461 Jackson Street | 1969 |
| 13 | Hotaling Annex-East | 443–445 Jackson Street | 1969 |
| 14 | Medico-Dental Building | 435–441 Jackson Street | 1969 |
| 15 | Old Ghirardelli Building | 415–431 Jackson Street | 1969 |
| 16 | Regency House – Ghirardelli Annex | 407 Jackson Street | 1969 |
| 19 | Golden Era Building | 730 Montgomery Street | 1969 |
| 20 | Hotaling Annex West | 463–473 Jackson Street | 1969 |
| 22 | Solari Building East (Larco Building) | 468–470 Jackson Street | 1970 |
| 23 | Solari Building West | 472 Jackson Street | 1970 |
| 24 | Yeon Building | 432 Jackson Street | 1970 |
| 25 | Moulinie Building | 458–460 Jackson Street | 1970 |
| 26 | Bank of Lucas, Turner & Company | 800–802 Montgomery Street | 1970 |
| 27 | Grogan-Atherton-Lent Building | 701 Sansome Street | 1970 |
| 34 | U.S. Mint & Subtreasury Building | 608–610 Commercial Street | 1970 |
| 37 | Hallidie Building | 130–150 Sutter Street | 1971 |
| 72 | V. C. Morris Building | 140 Maiden Lane | 1975 |
| 73 | Lotta's Fountain | Geary / Market / Kearny Streets | 1975 |
| 76 | Mills Building & Tower | 220–232 Montgomery Street | 1975 |
| 90 | Ferry Building | The Embarcadero | 1977 |
| 91 | Gibb-Sanborn Warehouse, Trinidad Bean & Elevator | 855 Front Street | 1977 |
| 92 | Gibb-Sanborn Warehouse, North Pelican Paper | 901–925 Front Street | 1977 |
| 109 | A. Borel & Company Building | 440 Montgomery Street | 1980 |
| 110 | Italian American Bank | 460 Montgomery Street | 1980 |
| 113 | S.F. Curb Mining Exchange | 350 Bush Street | 1980 |
| 117 | Hammersmith Building | 303 Sutter Street | 1980 |
| 131 | Wells Fargo Union Trust Branch | 744 Market Street | 1981 |
| 134 | The Mechanics Institute | 57–65 Post Street | 1981 |
| 142 | PG&E Old Station J | 565–569 Commercial Street | 1981 |
| 143 | Fire Station 2 | 460 Bush Street | 1981 |
| 145 | Buich Building / Tadich Grill | 240–242 California Street | 1981 |
| 146 | Jack's Restaurant Building | 615 Sacramento Street | 1981 |
| 155 | Flatiron Building | 540–548 Market Street | 1982 |
| 156 | Phelan Building | 760–784 Market Street | 1982 |
| 158 | Federal Reserve Bank Building | 400 Sansome Street | 1983 |
| 160 | Royal Globe Insurance Building | 210 Sansome Street | 1983 |
| 161 | The Kohl Building (Alvinza Hayward Building) | 400 Montgomery Street | 1983 |
| 173 | Notre Dame des Victoires Church & Rectory | 564–566 Bush Street | 1984 |
| 183 | Crown Zellerbach Building | 1 Bush Street | 1987 |
| 200 | Path of Gold Light Standards | 1–2490 Market Street | 1991 |
| 212 | Columbia Savings Bank Building | 15 Hotaling Place / 580 Washington / 700 Montgomery | 2000 |
| 233 | The Golden Triangle Light Standards | streets bounded by Market and Sutter | 2003 |
| 243 | Chronicle Building | 690 Market Street | 2007 |
| 297 | One Montgomery Street (Crocker National Bank) | 1–25 Montgomery Street | 2022 |
| 298 | "The Allegory of California" Mural | 155 Sansome Street | 2022 |
| 299 | Jones-Thierbach Coffee Company Building | 447 Battery Street | 2022 |

(Two of the above — 162 Hobart, and 156 Phelan / 131 Wells Fargo Union Trust / 243 Chronicle on
Market — are discussed as straddlers in §5. Landmark 162 is already SoMa's.)

**Correction found while verifying.** The DataSF `yeardesignated` for Landmark 183 (Crown
Zellerbach, 1 Bush) is **1987**, not 1983 — an earlier truncated read of the same table showed
1983 and was wrong. Any writer using this table must take the value from the full record, not a
column-clipped view.

### 2b. Article 10 / National Register historic districts

| District | Register | Identifier | Period of significance |
|---|---|---|---|
| Jackson Square Historic District | SF Article 10 | **Ordinance 221-72** | 1850–1911 |
| Jackson Square Historic District | National Register | **71000186**, certified 18 Nov 1971 | — |
| Jackson Square Historic District Extension | NR-eligible only | BOS resolution 772-99 | 1865–1920 |
| Northeast Waterfront Historic District | SF Article 10 | **Ordinance 171-83** | 1848–1960s (unofficial) |
| Central Embarcadero Piers Historic District | National Register | **02001390**, certified 20 Nov 2002 | 1918–1952 |
| Port of San Francisco Embarcadero Historic District | National Register | **06000372**, certified 12 May 2006 | Pier 45 to Pier 48 |
| San Francisco Cable Cars | National Register | **66000233**, certified 15 Oct 1966 | — |

Sources: <https://data.sfgov.org/resource/63x5-g3m4.json>;
NPS polygon layer
<https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/1>.

**Low confidence, flagged:** DataSF's district table records Jackson Square as `nr = "No"` while
the NPS polygon layer carries it as listed under 71000186 with a 18 Nov 1971 certification date.
The NPS record is the National Register's own; I would cite the NPS value and the Article 10
ordinance and let the verifier re-fetch both. The SF Planning "landmark districts" table
`m22e-6hkz` disagrees again and shows `a10 = "No"` for Jackson Square, which contradicts
`63x5-g3m4`'s `a10 = "Listed"` and Ord. 221-72. **Three city tables, three answers.** Do not put a
count of districts anywhere.

### 2c. National Register individual listings in the zone

NPS point layer
<https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0>

| Resource | Address | Ref. no. | Certified |
|---|---|---|---|
| Hallidie Building | 130 Sutter Street | 71000185 | 19 Nov 1971 |
| Mills Building and Tower | 220 Montgomery St. and 220 Bush St. | 77000334 | 13 Apr 1977 |
| U.S. Customhouse | 555 Battery Street | 75000476 | 29 Jan 1975 |
| U.S. Appraisers Stores and Immigration Station | 630 Sansome Street | 13000590 | 13 Aug 2013 |
| Federal Reserve Bank of San Francisco | 400 Sansome Street | 89000009 | 31 Jul 1989 |
| Bank of Italy | 552 Montgomery Street | 78000754 | 2 Jun 1978 |
| Hunter-Dulin Building | 111 Sutter Street | 97000348 | 17 Apr 1997 |
| Four Fifty Sutter Building | 450 Sutter Street | 09001118 | 22 Dec 2009 |
| PG&E Substation J | 565 Commercial and 568 Sacramento Sts. | 86003514 | 29 Dec 1986 |
| S.F. Fire Department Engine Co. Number 2 | 460 Bush Street | 02000371 | 17 Apr 2002 |
| Lotta Crabtree Fountain | Market, Geary, and Kearny Sts. | 75000475 | 20 Jun 1975 |
| Union Ferry Depot (Ferry Building) | Embarcadero at Market St. | 78000760 | 1 Dec 1978 |
| Daniel Gibb & Co. Warehouse | 855 Front St. and 101 Vallejo St. | 97001189 | 10 Oct 1997 |
| APOLLO (Storeship) | NW corner of Sacramento and Battery Sts. | 91000561 | 16 May 1991 |
| NIANTIC (Storeship) | NW corner of Clay and Sansome Sts. | 91000563 | 16 May 1991 |
| Old Ohio Street Houses | 17–55 Osgood Place | 79000535 | 31 May 1979 |
| Pier One | Pier One, The Embarcadero at Washington St. | 98001551 | 5 Jan 1999 |
| Audiffred Building | 1–21 Mission Street | 79000528 | 10 May 1979 |
| Rincon Annex | 101–199 Mission Street | 79000537 | 16 Nov 1979 |
| Matson Building and Annex | 215 Market Street | 95001384 | 29 Nov 1995 |
| PG&E General Office Building and Annex | 245 Market Street | 95001385 | 29 Nov 1995 |
| Ferry Station Post Office Building | Embarcadero at Mission St. | 78000756 | 1 Dec 1978 |

---

## 3. CANDIDATES — CORE, BOTH READINGS AGREE OR THE CONFLICT IS ONLY A/B WITHIN THE ZONE

### 3.1 The Transamerica block *(straddler: Reading A says Chinatown)*

**Transamerica Pyramid** — office tower, 600 Montgomery Street.
Designed by William Pereira, completed 1972. 853 feet. 763,000 square feet. White quartz cladding,
over 3,000 windows. Interiors remastered by Foster + Partners, completed 2024. Owner's site:
<https://www.thepyramidsf.com/>. Assessor build year 1971 per
<https://data.sfgov.org/resource/3tsw-4idn.json> (APN 0207032) — **the two dates disagree by one
year; the owner's "completed 1972" is the better source.**
*Do not write:* "second tallest building in San Francisco", "most recognizable landmark on the
skyline" — both appear on the owner's site and both are banned superlatives.

**Redwood Park** — privately owned public open space, 535 Washington Street, at the foot of the
Pyramid. Established 1972. Redwood trees, a water fountain, sculpture, 100+ linear feet of box
seating and room for 30+ on steps. No food service, no restrooms. Hours are **not posted**;
the City's survey records it closing before 6pm.
Source: <https://data.sfgov.org/resource/65ik-7wqd.json> (Privately Owned Public Open Spaces).
*Sculpture in the park may be described but not photographed.*

**Two Transamerica** — 505 Sansome Street, fronting Redwood Park. William Pereira, 1981.
362 feet, 191,000 square feet. Source: owner's site above; assessor build year 1981 agrees.

**Three Transamerica** — 545 Sansome Street, fronting Redwood Park. Willis Polk & Co., 1930.
112 feet, 55,000 square feet. Owner's site; assessor build year 1930 agrees.

### 3.2 The Ferry Building and its waterfront

**Ferry Building** — SF Landmark No. 90, designated 1977. National Register 78000760 as
"Union Ferry Depot", certified 1 Dec 1978. The Embarcadero at the foot of Market Street.
Opened 13 July 1898. Clocktower 245 feet. Skylit nave 660 feet long. Reopened to the public in
2003 after a four-year restoration that converted the nave into the marketplace; a further
restoration was completed in 2024. The historic interior was lost in 1955 when much of the
building was converted to offices; the double-deck Embarcadero Freeway stood in front of it for
35 years until damage in the 1989 Loma Prieta earthquake led to its demolition.
Source: <https://www.ferrybuildingmarketplace.com/about/>

**Ferry Building Marketplace** — One Ferry Building, San Francisco, CA 94111. Open daily
6:00am–10:00pm; individual merchants' hours vary; closed Thanksgiving Day and Christmas Day.
Reachable by BART, Muni, several ferry lines, the F Market streetcar and the California Street
cable car. Validated parking at the ProPark lot at Embarcadero & Washington.
Source: <https://www.ferrybuildingmarketplace.com/visit/>
*The site's "nearly 50 local artisan food merchants" is a count of tenants that changes weekly —
treat as volatile, not as a fact about the building.*

**Ferry Plaza Farmers Market** — operated by Foodwise outside the Ferry Building at Embarcadero
and Market Streets. **Saturday 8am–2pm; Tuesday and Thursday 10am–2pm, year round.** A California
Certified Farmers Market. Source: <https://foodwise.org/markets/ferry-plaza-farmers-market/>
*Foodwise says "Since 1993" — that is a trading-duration claim from the operator and does not
publish.*

**Embarcadero Plaza** — 10 Market Street. 4.14 acres. SF Recreation & Parks, typed "Civic Plaza or
Square". Source: <https://data.sfgov.org/resource/gtr9-ntp6.json>
Contains the **Vaillancourt Fountain** — writable, **not photographable** (a sculpture, outside
17 USC 120(a)). I could not reach a live SF Arts Commission page for it; the artwork's dimensions
and materials are **unsourced** and must be found before any physical description is written.

**Sue Bierman Park** — 143 The Embarcadero. 4.47 acres. Rec & Parks, "Neighborhood Park or
Playground". Same source. *Straddler: Reading B puts it in Northern Waterfront.*

**Maritime Plaza** — 285 Washington Street. 2.01 acres. Rec & Parks, "Civic Plaza or Square".
Same source. Adjoins the **Alcoa Building**, 300 Clay Street, assessor build year 1967. The Alcoa
Building appears in the Article 10 table with landmark number **0** — it is on the landmark *work
program*, i.e. **proposed, not designated.** No number may be claimed for it.

**Pier One** — The Embarcadero at Washington Street. National Register 98001551, certified
5 Jan 1999.

**Central Embarcadero Piers Historic District** — Piers 1, 1½, 3 and 5, The Embarcadero.
National Register 02001390, certified 20 Nov 2002; period of significance 1918–1952.

### 3.3 Banks, exchanges and towers on Montgomery, California, Sansome and Pine

**Bank of California** — SF Landmark No. 3 (1968), 400 California Street. Article 11 Category I.

**The Kohl Building (Alvinza Hayward Building)** — SF Landmark No. 161 (1983), 400 Montgomery
Street. Assessor build year 1901.

**A. Borel & Company Building** — SF Landmark No. 109 (1980), 440 Montgomery Street.

**Italian American Bank** — SF Landmark No. 110 (1980), 460 Montgomery Street.
*Assessor build year reads 1986, which is plainly a rebuild/permit year; do not cite it.*

**Mills Building & Tower** — SF Landmark No. 76 (1975); National Register 77000334, certified
13 Apr 1977; 220–232 Montgomery Street and 220 Bush Street. Article 11 Category I.

**Royal Globe Insurance Building** — SF Landmark No. 160 (1983), 210 Sansome Street.
Article 11 Category I.

**Federal Reserve Bank Building** — SF Landmark No. 158 (1983); National Register 89000009,
certified 31 Jul 1989; 400 Sansome Street. Article 11 Category I. Carries Arman's bronze
"Hermes and Dionysus – Monument to Analysis", always accessible.
Source: <https://data.sfgov.org/resource/cf6e-9e4j.json>

**"The Allegory of California" mural** — SF Landmark No. 298, designated 2022, at 155 Sansome
Street, in the Pacific Coast Stock Exchange Tower. A **mural**: writable, **not photographable**.
The building itself is Article 11 Category I, assessor build year 1929.

**Pacific Coast Stock Exchange Trading Room** — 301 Pine Street, Article 11 Category I, assessor
build year 1909. No Article 10 number.

**One Montgomery Street (Crocker National Bank)** — SF Landmark No. 297, designated 2022,
1–25 Montgomery Street. Assessor build year 1908. *Straddler: Reading B says Downtown / Union
Square.*

**Bank of Italy** — 552 Montgomery Street. National Register 78000754, certified 2 Jun 1978.
Article 11 Category I. *Straddler: Reading A says Chinatown.*

**Merchants Exchange** — 465 California Street. **Article 11 Category I** under the Planning Code;
no Article 10 number. Assessor build year 1903.
*The widely repeated attribution to Willis Polk for the Merchants Exchange Club Room is
**unsourced in anything I fetched** and must not be written until someone has a citation.*

**Russ Building** — 235 Montgomery Street. Article 11 Category I. *Assessor build year reads
1986 and is certainly wrong for this building; do not cite it. Construction date unsourced.*

**Shell Building (Shell Oil Company Building)** — 100 Bush Street. Article 11 Category I. Build
date unsourced — the parcel returned no `yearbuilt` row.

**Crown Zellerbach Building** — SF Landmark No. **183**, designated **1987**, 1 Bush Street.
Assessor build year 1959. Article 11 rated. Its sunken plaza is a POPOS, established 1959,
open at all times, with willow trees and a bronze fountain by David Tolerton; seating is limited
to the steps.
Sources: <https://data.sfgov.org/resource/65ik-7wqd.json>, <https://data.sfgov.org/resource/cf6e-9e4j.json>

**S.F. Curb Mining Exchange** — SF Landmark No. 113 (1980), 350 Bush Street. Article 11
Category II. The 2019 development behind it carries a POPOS: indoor park at 350 Bush, snippets at
465 Pine, a view terrace at 500 Pine; 7am–6pm Monday to Friday, with restrooms.

**Bank of America Center, 555 California Street** — Article 11 Category I (listed in the table as
"BANK OF AMERICA", 315 Montgomery, APN 0259026). Assessor build year 1969. Its plaza is a POPOS,
established 1969, open at all times, 24 small wooden bench seats at the elevated plaza's eastern
edge, a central pool. Masayuki Nagare's black granite **"Transcendence"** stands there — writable,
**not photographable**.

**101 California Street** — plaza POPOS established 1982, open at all times, roughly 1,000 linear
feet of terraced-step seating with cushions available, food service on site.

**345 California Street** — plaza and two snippets, 1986, open at all times, sandwich shop and
café; the west snippet is entered from Sansome Street.

**150 California Street** — sun terrace POPOS, 2000, six storeys above the street, 9am–6pm Monday
to Friday, nine tables with 36 movable chairs.

**343 Sansome Street** — view terrace on the **fifteenth floor**, 1990, 10am–5pm Monday to Friday.
Restroom key from the lobby attendant. Holds Joan Brown's tiled obelisk **"Four Seasons"** and Pol
Bury's stainless-steel and marble water sculpture **"L'Octagon"** — both writable, neither
photographable.

**Citigroup Center, 1 Sansome Street** — atrium POPOS, 1983, marble and glass, café/deli,
restrooms. Holds Stirling Calder's bronze **"Star Maiden"**.

**325 Battery Street** — bronzes by Fritz Koenig, Dimitri Hadzi ("Creazione") and Arman
("The Universality of Wisdom"), always accessible.

**425 Battery Street** — **"The General Harrison"** by Curtis Hollenback and Topher Delaney: an
unearthed Gold Rush ship worked into the sidewalk. Always accessible. Approved under case
2000.613X. Source: <https://data.sfgov.org/resource/cf6e-9e4j.json>

**APOLLO (Storeship)** — National Register 91000561, certified 16 May 1991, northwest corner of
Sacramento and Battery Streets. A buried-ship archaeological **site**, not a visible building.
**NIANTIC (Storeship)** — National Register 91000563, certified 16 May 1991, northwest corner of
Clay and Sansome Streets. Same caveat. Both are legitimate guide subjects precisely because
nothing is above ground; a writer must not imply a visitable structure.

### 3.4 Commercial Street and the small streets

**U.S. Mint & Subtreasury Building** — SF Landmark No. 34 (1970), 608–610 Commercial Street.
*Straddler: no EAS row returned; adjacent addresses on Commercial read Chinatown under Reading A.*

**PG&E Old Station J** — SF Landmark No. 142 (1981), 565–569 Commercial Street; National Register
86003514, certified 29 Dec 1986 (listed as "Pacific Gas and Electric Company Substation J",
565 Commercial and 568 Sacramento Sts.). The Leidesdorff Street frontage (222 Leidesdorff) is
separately Article 11 Category I.

**Empire Park** — 642 Commercial Street. POPOS, established 1988, urban garden with a water
fountain, 15 chairs with tables and 8 bench seats inside the park plus 8 along Commercial Street;
daylight hours; no food service directly. The widened Commercial Street sidewalks in front of it
(entitled with 235 Pine, 1984) carry 8 public seats, 5 street trees and 14 planters, with extra
seating put out at lunchtime. Source: <https://data.sfgov.org/resource/65ik-7wqd.json>
*Straddler: BOTH readings put Empire Park in Chinatown.*

**Jack's Restaurant Building** — SF Landmark No. 146 (1981), 615 Sacramento Street. Assessor build
year 1907. *Straddler: Reading B says Chinatown.* Whether a restaurant currently trades there is
**unverified** — I found no live operator site.

**Trinity Alley, 333 Bush Street** — pedestrian-walkway POPOS, 1983, open at all times, roughly
50 linear seats with movable tables, restaurants along the alley, a living plant wall.

**456 Montgomery Street** — sunken plaza POPOS, 1983, open at all times, escalator access,
72 linear feet of seating, flowers and small water fountains.

### 3.5 Sutter, Post, Bush and Maiden Lane *(most are Reading-B "Downtown / Union Square")*

**Hallidie Building** — SF Landmark No. 37 (1971); National Register 71000185, certified
19 Nov 1971; 130–150 Sutter Street. Assessor build year 1917. Article 11 Category I. The glass
curtain wall is the reason it is on both registers; describe the wall, do not rank it.

**Hunter-Dulin Building** — 111 Sutter Street. National Register 97000348, certified 17 Apr 1997.
Article 11 Category I. Assessor build year for the adjacent French Bank Building parcel (108
Sutter) reads 1906 — **not** a source for 111 Sutter.

**Hammersmith Building** — SF Landmark No. 117 (1980), 303 Sutter Street. Article 11 Category I.
Assessor build year 1907.

**Four Fifty Sutter Building** — 450 Sutter Street. National Register 09001118, certified
22 Dec 2009. Article 11 Category I ("450 SUTTER / MEDICAL-DENTAL BUILDING"). Assessor build year
1929.

**Crocker Galleria** — 165 Sutter Street. Sun-terrace POPOS on the roof, established 1982,
6am–7pm Monday to Saturday, 24 benches each 7 ft 8 in, restrooms, eight large planters with trees.
Assessor build year 1980.

**V. C. Morris Building** — SF Landmark No. 72 (1975), 140 Maiden Lane. Assessor build year 1909.
Article 11 Category I. *No Frank Lloyd Wright attribution is written above because I did not fetch
a source for it today; it is universally reported and trivially citable, but it must be cited.*

**The Mechanics' Institute** — SF Landmark No. 134 (1981), 57–65 Post Street, San Francisco,
CA 94104. Assessor build year 1909. Article 11 Category I.
Library and chess room: Monday–Friday 10am–6pm (Tuesday and Thursday until 8pm), Saturday
10am–5pm, closed Sunday. Building: Monday–Friday 8:15am–6pm (Tuesday and Thursday until 8pm),
Saturday 9:30am–5:30pm. Phone (415) 393-0101. A Beaux Arts library of over 100,000 books; a chess
club with a Grandmaster-in-Residence programme; meeting rooms on the 3rd and 4th floors.
Registered nonprofit, EIN 94-1254644.
Source: <https://www.milibrary.org/>
*Its own site says "one of the oldest institutions on the West Coast", "one of the largest chess
collections in the U.S." and "the oldest continuously operating chess club in the U.S." — all
three are superlatives and none of them publish, attributed or not.*

**Notre Dame des Victoires Church & Rectory** — SF Landmark No. 173 (1984), 564–566 Bush Street.
Assessor build year 1907. Article 11 Category I. *Straddler: Reading B says Chinatown.*

**Fire Station 2** — SF Landmark No. 143 (1981); National Register 02000371, certified
17 Apr 2002; 460 Bush Street. Assessor build year 1915. Article 11 Category I.
*Straddler: Reading B says Chinatown.* An operating firehouse; no public interior.

---

## 4. THE JACKSON SQUARE CLUSTER — SIXTEEN NUMBERED LANDMARKS, UNCLAIMED, FULLY STRADDLED

Every building here carries an Article 10 number and sits inside the Jackson Square Historic
District (Article 10 Ord. 221-72; National Register 71000186, certified 18 Nov 1971; period of
significance 1850–1911). **Reading A assigns them to Chinatown; Reading B assigns them to North
Beach. Neither shipped page contains any of them.**

| Landmark | Address |
|---|---|
| No. 12, Hotaling Building | 451–461 Jackson Street (assessor build year 1866) |
| No. 13, Hotaling Annex-East | 443–445 Jackson Street |
| No. 20, Hotaling Annex West | 463–473 Jackson Street |
| No. 11, Hotaling Stables Building | 32–42 Hotaling Place |
| No. 212, Columbia Savings Bank Building | 15 Hotaling Place / 580 Washington / 700 Montgomery |
| No. 14, Medico-Dental Building | 435–441 Jackson Street |
| No. 15, Old Ghirardelli Building | 415–431 Jackson Street |
| No. 16, Regency House – Ghirardelli Annex | 407 Jackson Street |
| No. 24, Yeon Building | 432 Jackson Street |
| No. 25, Moulinie Building | 458–460 Jackson Street |
| No. 22, Solari Building East (Larco Building) | 468–470 Jackson Street |
| No. 23, Solari Building West | 472 Jackson Street |
| No. 9, Langerman's Building / Belli Building | 722 Montgomery Street |
| No. 10, Genella Building / Belli Annex | 728–730 Montgomery Street |
| No. 19, Golden Era Building | 730 Montgomery Street |
| No. 26, Bank of Lucas, Turner & Company | 800–802 Montgomery Street |
| No. 27, Grogan-Atherton-Lent Building | 701 Sansome Street |

**Operating businesses in and around the district (own-site sourced):**

- **Bix** — 56 Gold Street, San Francisco, CA 94133, in the alley off Montgomery between Pacific
  and Jackson Streets. Open seven days; bar opens 4:30pm Monday–Friday; live music every evening.
  A two-storey dining room with fluted columns, mahogany panelling and banquettes.
  <https://www.bixrestaurant.com/> *Its "many have called the city's best classic cocktails" is a
  superlative and does not publish.*
- **Quince** — 470 Pacific Avenue, San Francisco. (415) 775-8500. Lunch Friday and Saturday
  11:30am–1:00pm; a tasting menu in the main dining room; a bar and salon called the Bolinas Bar.
  <https://www.quincerestaurant.com/> *"Founded in 2003" is an operator trading-duration claim and
  does not publish; "award-winning" does not publish.*
- **Cotogna** — 490 Pacific Avenue (adjoining Quince; address to be re-confirmed, the site's
  contact page did not render an address in my pull). Cocktail and wine list current.
  <https://cotognasf.com/> — **address unverified, flagged.**
- **Kokkari Estiatorio** — 200 Jackson Street. **Site returned 403; nothing verified. Do not
  write from memory.**
- **Old Ship Saloon** — 298 Pacific Avenue. Every domain I tried
  (`theoldshipsaloon.com`, `oldshipsaloon.com`, `oldshipsaloonsf.com`) is dead, parked or
  self-signed. **Trading status unverified.** The parcel's Article 10 neighbour at 301–325 Battery
  has assessor build year 1924. *Straddler: Reading B says North Beach.*

**North of the district, same straddle:**

- **U.S. Appraisers Stores and Immigration Station** — 630 Sansome Street. National Register
  13000590, certified 13 Aug 2013. Assessor build year 1941. *Reading A: Chinatown. Reading B:
  North Beach.*
- **Daniel Gibb & Co. Warehouse** — 855 Front Street and 101 Vallejo Street. National Register
  97001189, certified 10 Oct 1997. Also SF Landmark No. 91 as "Gibb-Sanborn Warehouse, Trinidad
  Bean & Elevator", 855 Front Street, designated 1977. *Reading B: Northern Waterfront.*
- **Gibb-Sanborn Warehouse, North Pelican Paper** — SF Landmark No. 92 (1977), 901–925 Front
  Street. Inside the Northeast Waterfront Historic District (Article 10, Ord. 171-83).
  *Almost certainly North Beach's ground; listed for completeness.*
- **Old Ohio Street Houses** — 17–55 Osgood Place. National Register 79000535, certified
  31 May 1979.
- **Jones-Thierbach Coffee Company Building** — SF Landmark No. 299, designated 2022,
  447 Battery Street. Assessor build year 1907. *Reading A: Chinatown. Reading B: Northern
  Waterfront.*
- **U.S. Customhouse** — 555 Battery Street. National Register 75000476, certified 29 Jan 1975.
  Assessor build year 1900. *Reading A: Chinatown. Reading B: Financial District.*
- **Punch Line Comedy Club** — 444 Battery Street, San Francisco, CA 94111. (415) 397-7573.
  Operated by Live Nation; show schedule live. <https://www.punchlinecomedyclub.com/>

---

## 5. MARKET STREET — WHERE SOMA ALREADY WON GROUND

SoMa took the north side of Market at 582 and 700. These remain unclaimed and sit on the same
side of the same street:

- **Flatiron Building** — SF Landmark No. 155 (1982), 540–548 Market Street. Article 11
  Category I. Assessor build year 1913. At the Market/Sutter/Sansome wedge.
- **Chancery Building**, 562 Market Street — Article 11 Category I, no Article 10 number.
- **Finance Building**, 576 Market Street — Article 11 Category I.
- **Chronicle Building** — SF Landmark No. 243, designated 2007, 690 Market Street. Article 11
  Category II. *Reading B: Downtown / Union Square. Assessor build year reads 2007 — that is the
  conversion, not the construction; do not cite it.*
- **Wells Fargo Union Trust Branch** — SF Landmark No. 131 (1981), 744 Market Street. Article 11
  Category I. Assessor build year 1910.
- **Phelan Building** — SF Landmark No. 156 (1982), 760–784 Market Street. Article 11 Category I.
- **Bankers Investment Building**, 722 Market Street — Article 11 Category I.
- **Lotta's Fountain** — SF Landmark No. 73 (1975); National Register 75000475 as "Lotta Crabtree
  Fountain", certified 20 Jun 1975; at Geary, Market and Kearny Streets. *Reading B: Downtown /
  Union Square.*
- **Path of Gold Light Standards** — SF Landmark No. 200 (1991), 1–2490 Market Street. Runs the
  full length of Market and therefore straddles Financial District, SoMa, Hayes Valley and Castro
  — **all four of those pages are already shipped.** A whole-corridor landmark cannot belong to
  one neighbourhood; the arbitrator should decide whether it belongs anywhere.
- **The Golden Triangle Light Standards** — SF Landmark No. 233 (2003), "along the streets bounded
  by Market and Sutter Streets". Same corridor problem, smaller.

**South side of Market, adjacent, listed only so nobody mistakes them for available:** Monadnock
Building 673 Market and Hearst Building 691 Market are Article 11 Category I and are on SoMa's
side of the street; Palace Hotel (633 Market) and 735 Market are already SoMa's.

**Southern waterfront edge:**

- **Audiffred Building** — SF Landmark No. 7 (1968); National Register 79000528, certified
  10 May 1979; 1–21 Mission Street. Both readings say Financial District, but it is at the
  Embarcadero/Mission corner and SoMa's page is one block away. Flagged.
- **Rincon Annex Post Office** — SF Landmark No. 107 (1980); National Register 79000537 as
  "Rincon Annex", certified 16 Nov 1979; 99–199 Mission Street. Reading B: Financial District.
  Contains the Anton Refregier murals — writable, **not photographable**. Its interior courtyard
  (Rincon Center, 121 Spear Street) is a POPOS, 1989, open at all times, 78 bench and chair seats,
  a café. Flagged as a probable SoMa/South Beach straddle.
- **Matson Building and Annex**, 215 Market Street — National Register 95001384, certified
  29 Nov 1995. Article 11 Category I.
- **PG&E General Office Building and Annex**, 245 Market Street — National Register 95001385,
  certified 29 Nov 1995.
- **Southern Pacific Building**, 1 Market Street — Article 11 Category I. Its plaza and atrium
  are a POPOS, 1976, open at all times, several restaurants inside, restrooms at the Mission
  Street entrance.

---

## 6. OPERATING PLACES A GUIDE WOULD WRITE ABOUT — OWN-SITE SOURCED

| Place | Address | Hours (own site) | Notes |
|---|---|---|---|
| **Tadich Grill** | 240 California Street, SF 94111; (415) 391-1849 | Mon–Fri 11:00am–9:00pm dining room and counter; Sat 4:00pm–9:00pm; closed Sun | In the **Buich Building, SF Landmark No. 145 (1981)**, Article 11 Category I, assessor build year 1909. Seafood grilled over mesquite charcoal, casseroles, stews. <https://www.tadichgrillsf.com/> |
| **Sam's Grill & Seafood** | 374 Bush Street, SF 94104; (415) 421-0594 | Mon–Fri 11:00am–9:00pm; Sat 5:30pm–9:00pm; closed Sun and major holidays | Private booths; mesquite-grilled fish. **Sam's Tavern** at 368 Bush Street keeps separate hours. <https://samsgrill-sf.com/> |
| **Schroeder's** | 240 Front Street, SF 94111; (415) 421-4778 | Not published on the page I fetched | Bavarian beer hall and German restaurant. Parcel 234–240 Front, assessor build year 1927; Article 11 Category I/II under the Front-California conservation area. <https://www.schroederssf.com/> |
| **Perbacco** | 230 California Street, SF 94111; (415) 955-0663 | Tue–Fri 11:30am–9:00pm; Sat 5:30pm–9:00pm; closed Sun | Italian. Building is the **Hind Building**, Article 11 Category II. <https://perbaccosf.com/> |
| **Wayfare Tavern** | 201 Pine Street, SF 94104 | Site lists hours by day; my pull captured the address block only | **Relocated** — no longer at 558 Sacramento. Marble floors, tufted leather booths, a gold-leaf mural, a green serpentine stone bar. <https://www.wayfaretavern.com/> |
| **Bix** | 56 Gold Street, SF 94133 | Seven days; bar from 4:30pm Mon–Fri; live music nightly | See §4. |
| **Quince** | 470 Pacific Avenue, SF; (415) 775-8500 | Lunch Fri & Sat 11:30am–1:00pm | See §4. |
| **Punch Line Comedy Club** | 444 Battery Street, SF 94111; (415) 397-7573 | Per-show | See §4. |
| **Mechanics' Institute** | 57 Post Street, SF 94104 | See §3.5 | See §3.5. |
| **Embarcadero Center** | Four buildings across four blocks, Financial District | Retail hours vary | Development began 1968 and concluded 1983; the four towers were completed between 1971 and 1981. Owned and operated by BXP. Shops, restaurants, a cinema, a conference centre. <https://www.embarcaderocenter.com/about/> *"one of the largest mixed-use complexes in the Western United States", "award-winning architectural design" and "more than 16,000 people each day" are all owner's-site claims — the first two are superlatives and do not publish; the third is a traffic estimate, not a fact about the place.* Its pedestrian mall through Centers 1, 2 and 3 is a POPOS (1985): ground and second levels, an elaborate staircase system flanked by waterfalls, 30 tables and 107 chairs, open at all times. |

**Wells Fargo History Museum — DO NOT WRITE AS OPEN.** `wellsfargohistory.com/museums/` now
redirects to the Wells Fargo History home page with no museum listing, no address and no hours.
I could not establish that a museum operates at 420 Montgomery Street. It is a strong candidate
subject *if* someone can source current status; on today's evidence its status is **unknown**.

**Harrington's Bar & Grill — DROPPED.** `harringtonsbarandgrill.com` now resolves to an unrelated
gambling site. No trading status.

---

## 7. ARTICLE 11 CATEGORY I BUILDINGS WITH NO ARTICLE 10 NUMBER

Article 11 of the Planning Code assigns each building in the downtown conservation area a Category
(I "Significant" through V). Category I is a designation with an identifier and publishes as
*"Category I under Article 11 of the San Francisco Planning Code."*
Source: <https://data.sfgov.org/resource/6m3x-8fu4.json>

Unclaimed Category I buildings in the Financial District proper, beyond those already named:
Postal Telegraph Building (22 Battery), Donahue Building (99 Battery), 98 Battery, Shell Oil
Company Building (100 Bush), H. M. Heineman Building (130 Bush), Standard Oil Building (200 Bush
and 225 Bush), Alto Building (381 Bush), Pacific States Telephone Building (445 Bush), Marvin
Building (22 California, Cat II), Hind Building (230 California, Cat II), Welch Building
(244 California, Cat II), Newhall Building (260 California), Robert Dollar Building
(301 California), J. Harold Dollar Building (341 California), Insurance Exchange Building
(433 California), Merchants Exchange (465 California), D. DeBernardi & Co. Warehouse
(259 Front), Title Insurance Company (130 Montgomery), Alexander Building (149 Montgomery),
American National Bank (300 Montgomery), Lurie Building (417 Montgomery), Canton Bank
(500 Montgomery), 520 Montgomery, Old San Francisco Chamber of Commerce (333 Pine), Dividend
Building (348 Pine), Orient Building (332 Pine, Cat II), Adam Grant Building (114 Sansome),
Insurance Center Building (200 Sansome), Scottish Union / National Insurance Co. Gothenburg
(217 Sansome), T. C. Kierulff Building (231 Sansome), Fireman's Fund Insurance Building
(233 Sansome), National Building (401 Sansome), 407 Sansome, 554 and 564 Commercial, PG&E
Substation R (530 Bush, Cat II), Pacific Telephone & Telegraph (430 Bush, Cat II).

**Do not tally these anywhere in prose.** Name the ones you use and cite the category.

---

## 8. TRANSIT AND CORRIDOR SUBJECTS

- **San Francisco Cable Cars** — National Register **66000233**, certified 15 Oct 1966; named a
  National Historic Landmark in **1964**. The **California Street line** begins at California and
  Market and runs to Van Ness Avenue. Fares must be prepaid to board at Powell & Market between
  8am and 8pm. Sources: <https://www.sfmta.com/getting-around/muni/cable-cars>, NPS layer 1.
  The California line's Financial District end is the only part of the system in this zone —
  a straddler with Nob Hill and Chinatown, both shipped.
- **F Market streetcar** — stops directly in front of the Ferry Building.
  <https://www.ferrybuildingmarketplace.com/visit/>
- **San Francisco–Oakland Bay Bridge** — National Register **00000525**, certified 7 Jan 2022.
  Lands south of Market; **flagged as SoMa/Rincon Hill ground, not this zone's.**

---

## 9. LOWEST-CONFIDENCE ITEMS — WORK NEEDED BEFORE ANY OF THESE SHIP

1. **Jackson Square's register status.** Three City tables give three answers for whether it is
   Article 10 listed and whether it is National Register listed. I would cite the NPS record
   (71000186, 18 Nov 1971) plus Ordinance 221-72 from `63x5-g3m4`, and let the verifier re-fetch
   both. Anyone who cites `m22e-6hkz` will get `a10 = No` and write a wrong sentence.
2. **`yearbuilt` from `3tsw-4idn` is not a construction date.** It returned 1986 for the Russ
   Building and the Italian American Bank, 2007 for the Chronicle Building, 2018 for the S.F. Curb
   Mining Exchange, 1985 for PG&E Station J and 1987 for the Bank of Lucas, Turner & Co. Those are
   permit or conversion years. Where I quoted a build year above I quoted it *as an assessor
   value*; nobody should promote one to prose without a second source.
3. **Wells Fargo History Museum.** Named in the brief as a likely subject; I cannot confirm it
   operates. Somebody needs a current source or it must be dropped.
4. **Merchants Exchange authorship and the Old Ship Saloon.** The Willis Polk attribution for the
   Merchants Exchange Club Room and everything about the Old Ship Saloon's history are things I
   *know* are widely reported and *did not source today.* Both are unwritable as they stand.
5. **Kokkari (403) and Cotogna (address did not render).** Neither is verified.
6. **Vaillancourt Fountain's physical description.** The SF Arts Commission page 404'd. There is
   no sourced measurement or material for it in this document, and it cannot be described until
   there is.

---

## 10. HARD RULES APPLIED WHILE COMPILING THIS

- Every designation claim above names its register and carries an identifier. Bare "is a
  landmark" appears nowhere.
- **No counts of landmarks appear in any prose I have drafted.** The tables above are working
  material for the arbitrator, not sentences.
- Superlatives found on official and operator sites have been quarantined and labelled rather
  than passed through: the Pyramid's "second tallest", the Mechanics' Institute's three, Bix's
  "city's best cocktails", Embarcadero Center's "one of the largest", Tadich Grill's "oldest,
  continuously run restaurant in California".
- Founding years taken from operators' own sites (Tadich 1849/1887/1934, Schroeder's 1893,
  Quince 2003, Foodwise 1993) are trading-duration claims and are marked as non-publishing.
- Murals and sculptures — the Rivera "Allegory of California", the Refregier murals in Rincon
  Annex, the Vaillancourt Fountain, Nagare's "Transcendence", Calder's "Star Maiden", Brown's
  "Four Seasons", Bury's "L'Octagon", Arman's two bronzes, "The General Harrison" — are all
  writable and none are photographable. **No page may explain why.**
- `"photos": []` everywhere.

---

## APPENDIX — SOURCES AND SCRIPTS

**Datasets queried live today**
- SF Article 10 landmarks: <https://data.sfgov.org/resource/97yj-54sx.json> (370 rows)
- Historic districts (current): <https://data.sfgov.org/resource/63x5-g3m4.json> (204 rows)
- Landmark districts (older, conflicting): <https://data.sfgov.org/resource/m22e-6hkz.json>
- Article 11 ratings: <https://data.sfgov.org/resource/6m3x-8fu4.json> (786 rows)
- Historic Resource Status by Parcel: <https://data.sfgov.org/resource/3tsw-4idn.json>
- Privately Owned Public Open Spaces: <https://data.sfgov.org/resource/65ik-7wqd.json> (81 rows)
- Rec & Park properties: <https://data.sfgov.org/resource/gtr9-ntp6.json> (255 rows)
- Public Art (1% Art Program): <https://data.sfgov.org/resource/cf6e-9e4j.json> (65 rows)
- Addresses (EAS), for `nhood`: <https://data.sfgov.org/resource/3mea-di5p.json>
- Analysis Neighborhoods: <https://data.sfgov.org/resource/p5b7-5n3h.json>
- SF Find Neighborhoods: <https://data.sfgov.org/resource/gfpk-269f.json> (117 zones)
- NPS National Register points:
  <https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0>
- NPS National Register polygons: same service, layer 1

**Official sites fetched**
- <https://www.thepyramidsf.com/>
- <https://www.ferrybuildingmarketplace.com/about/> and `/visit/`
- <https://foodwise.org/markets/ferry-plaza-farmers-market/>
- <https://www.embarcaderocenter.com/about/>
- <https://www.milibrary.org/>
- <https://www.tadichgrillsf.com/>
- <https://samsgrill-sf.com/>
- <https://www.schroederssf.com/>
- <https://perbaccosf.com/>
- <https://www.wayfaretavern.com/>
- <https://www.bixrestaurant.com/>
- <https://www.quincerestaurant.com/>
- <https://cotognasf.com/>
- <https://www.punchlinecomedyclub.com/>
- <https://www.sfmta.com/getting-around/muni/cable-cars>

**Failed fetches, recorded so nobody assumes they were skipped**
- `wellsfargohistory.com/museums/` — redirects to home, museum listing gone
- `kokkari.com` — HTTP 403
- `theoldshipsaloon.com` / `oldshipsaloon.com` / `oldshipsaloonsf.com` — DNS failure, 404,
  and a stub page respectively
- `sfartscommission.org/collection/artwork/vaillancourt-fountain` — HTTP 404
- `sfheritage.org/news/jackson-square-historic-district/` — HTTP 403
- `harringtonsbarandgrill.com` — domain now serves unrelated content
- `sfport.com/ferry-building` — HTTP 404

**Working scripts** (scratchpad
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/`):
`sf_taken.py` (SF-corpus ownership check — replaces the Rome-only `.superpowers/taken_slugs.py`),
`lmfull.py`, `nrhp4.py`, `nrpoly.py`, `a11r2.py`, `popos2.py`, `parks2.py`, `hood4.py`, `addr.py`,
`yb3.py`.
