# San Francisco WAVE 1 — ARBITRATION

One arbitrator, twelve zones, ruled 2026-09-03 against all twelve finder files and all twelve
verdict files. **Authors follow this file. Where it differs from a verdicts file, this file wins,
and every such override is named in §9 so nobody follows the looser document.**

Zones ruled: `mission`, `north-beach`, `chinatown`, `haight-ashbury`, `castro`, `marina`, `soma`,
`fishermans-wharf`, `nob-hill`, `russian-hill`, `pacific-heights`, `hayes-valley`.

---

## 0. THE THREE PRINCIPLES I RULED BY

Stated first because every ruling below follows from them, and because a wave-2 arbitrator should
inherit them.

**P1 — The roster's `draw` string beats every boundary layer.** `priv/seed_data/san_francisco_roster.json`
is the document that creates the zones. A place named in a zone's `draw` is that zone's, and no
point-in-polygon result unmakes it. Three verifiers reached this independently (Fisherman's Wharf
§0, Russian Hill §4, Chinatown §3) and one finder wasted its largest section fighting it.

**P2 — Where the roster is silent, the city's per-address assignment governs, and the register's own
name is evidence.** DataSF's Enterprise Addressing System `nhood` (identical to the Analysis
Neighborhood, served per parcel) is the instrument. Where a federal register has named the resource
after a neighbourhood — "Russian Hill–Vallejo Street Crest District" — the register wins against a
polygon that says otherwise.

**P3 — Never split a campus, a block face or a single structure.** The Yerba Buena ice rink does not
leave the garden it stands on. The Oak Street landmarks do not face each other from two pages.

Nominatim's `neighbourhood` field is not an instrument in San Francisco and no ruling below rests on
it: it returned "South of Market" for Chinatown and for 261 Columbus Avenue, "Mission" for Buena
Vista Park, "Cole Valley" for Amoeba, "Richmond" for Alvord Lake. Four finders proved it wrong
independently. Do not use it, and do not cite it.

---

## 1. OWNERSHIP TABLE — every place claimed by two files

Assigned to exactly one zone, with the evidence. Hosting is not containment.

### 1.1 The Dolores seam — Mission ↔ Castro (9 places)

Both finders flagged all of it and neither grabbed it. That was correct and it is the cleanest
contest in the wave.

| Place | Identifier | Ruling | Evidence |
|---|---|---|---|
| Mission San Francisco de Asís **+ the Basilica + the Cemetery, as ONE place** | LM 1 (1968); NRHP 72000251 (16 Mar 1972) | **MISSION** | Roster's `mission` draw names "Mission Dolores" (P1). The parish's hours cover the Old Mission, gift shop, museum, cemetery and Basilica as one visitor complex. |
| Mission Dolores Park, 646 Dolores St, 15.99 ac | — | **MISSION** | Roster's `mission` draw names "Dolores Park" (P1), against Rec & Park's `analysis` and `planning` both reading Castro/Upper Market. |
| Mission High School, 3750 18th St | LM 255 (2007) | **CASTRO** | Not roster-named. `3750 18TH ST` → Castro/Upper Market on EAS, confirmed by both verifiers (P2). The Mission finder claimed it with no boundary check at all; its verifier caught that and called it the file's most serious error. |
| Tanforan Cottages, 214 and 220 Dolores St | LM 67, LM 68 (both 1975) | **CASTRO** | Both addresses → Castro/Upper Market, confirmed independently by both zones. |
| St. Nicholas Cathedral, 2005 15th St | LM 335 (2026), Ordinance 73-26 | **CASTRO** | `2005 15TH ST` → Castro/Upper Market. Ships as Castro's A19; the Castro finder missed it and its verifier restored it. Kind `attraction` — a working church a visitor can enter. |

**St. Matthew's Church, 3281 16th St (LM 334)** — the Mission's S4 dissolves. `3281 16TH ST` →
Mission. **MISSION**, no straddle.

**Ceded to the Castro without contest, and the Mission's own exclusion list agrees:** Saint Francis
Lutheran Church (LM 39), Swedish American Hall (LM 267 / NRHP 100004413), New Era Hall (LM 277), the
José Theater (LM 241), the McCormick House (LM 208), the Bob Ross House (LM 322), Thorough Bread and
Pastry (248 Church St). Duboce Triangle is not a rostered zone; there is no rival page. Stop calling
these contested.

### 1.2 Mission ↔ SoMa (4 places)

| Place | Ruling | Evidence |
|---|---|---|
| SOMA West Dog Park (0.62 ac) and SOMA West Skate Park (0.87 ac) | **MISSION** | Rec & Park `analysis_neighborhood: Mission`; `planning_neighborhood` reads "South of Market, Mission" and "Mission, South of Market" — the city records them as both. SoMa's finder never mentions them and SoMa's verifier raised them only to say so. The name is not evidence; the city's attribute is. |
| Zeitgeist, 199 Valencia St | **MISSION** | `199 VALENCIA ST` → Mission on EAS, re-queried by the Mission's verifier. The ZIP 94103 misled the finder; ZIP is not the neighborhood layer. Kind **`restaurant`** (§7.3). |
| Orders of Foresters / Baháʼí Temple, 170 Valencia St | **MISSION** | Both finders listed it; `170 VALENCIA ST` → Mission. `landmarkno = 0` — **no designation claim from either zone, ever.** |

### 1.3 North Beach ↔ Chinatown (10 places)

Both official layers put the lower Columbus blocks in Chinatown. The boundary runs along Columbus
Avenue itself, so Tosca at 242 is North Beach and City Lights at 261 is Chinatown. That is a real
finding and it does not survive P1 and P3.

| Place | Identifier | Ruling |
|---|---|---|
| City Lights Booksellers, 261–271 Columbus Ave | LM 228 (2001) | **NORTH BEACH** — roster's `north-beach` draw names it. Not arguable, and Chinatown's verifier says so. |
| Vesuvio Cafe, 255 Columbus Ave | — | **NORTH BEACH** — same doorway as City Lights, across Jack Kerouac Alley. P3. Chinatown claims it nowhere. |
| Jack Kerouac Alley | — | **NORTH BEACH** — its own definition is that it joins Grant to Columbus and continues as William Saroyan Alley. It is the appendix to the page that owns City Lights. |
| Comstock Saloon, 155 Columbus Ave | — | **NORTH BEACH** — Chinatown claims it nowhere. Its own site naming four neighbourhoods at once is honest and is not authority. |
| Sentinel Building / Columbus Tower, 916–920 Kearny St | LM 33 (1970) | **NORTH BEACH** — SF Find says North Beach; Chinatown recommends North Beach. |
| Transamerica / Old Fugazi Bank Building, 4 Columbus Ave | LM 52 (1973) | **NORTH BEACH** — SF Find North Beach. |
| Club Fugazi, 678 Green St | — | **NORTH BEACH** — SF Find North Beach; live operator site with a current production. |
| Molinari Delicatessen, 373 Columbus Ave; Bix, 56 Gold St | — | **NORTH BEACH** — SF Find North Beach; both have live operator sites. |
| China Live, 644 Broadway | — | **NORTH BEACH** — Chinatown's own recommendation. It ships only if its author fetches `chinalivesf.com`; it is not counted in North Beach's tier. |
| Language of the Birds, Columbus at Broadway | Civic Art T2009.1 | **NORTH BEACH**, as prose inside Jack Kerouac Alley. Never a place. Artists living — photo-blocked. |

**Caffè Greco, Mara's Italian Pastry, Kenneth Rexroth Place** — ruled North Beach's, but North Beach's
verifier dropped all three for OSM-only sourcing and that drop stands. Recorded so a later wave knows
the zone, not the status.

### 1.4 North Beach ↔ Telegraph Hill, Fisherman's Wharf, Nob Hill, Russian Hill

| Place | Identifier | Ruling |
|---|---|---|
| Coit Tower | LM 165 (1984); NRHP 07001468 (29 Jan 2008) | **NORTH BEACH** — §2. |
| Filbert Steps, Greenwich Steps, Grace Marchant Garden, Julius Castle (LM 121), House at 1254–1256 Montgomery (NRHP 79000532), Bob Kaufman Alley, Pioneer Park | | **NORTH BEACH** — Telegraph Hill is a declined zone. If North Beach does not take them nobody can. Grace Marchant Garden takes kind `attraction`, not `park` — it is private land with no operator hours. |
| Otis Elevator Company Building, 1 Beach St | NRHP 99001265 (21 Oct 1999) | **NORTH BEACH** — the Analysis layer says North Beach and North Beach holds the reference number. Fisherman's Wharf never claimed it. |
| Piazza Pellegrini, 659 Columbus Ave | — | **NORTH BEACH** — the EAS coordinate 37.800980/−122.411503 is correct and sits on Washington Square, which is North Beach's. The `analysis_neighborhood` string on that one row is wrong. |
| Our Lady of Guadalupe Church, 906 Broadway | LM 204 (1993) | **NOB HILL** — analysis says Nob Hill; North Beach hands it over; Russian Hill declines it. An Article 10 landmark three zones tried to give away. Nob Hill takes it. |
| Bimbo's 365 Club, 1025 Columbus Ave | — | **RUSSIAN HILL** — both layers Russian Hill. Ships only if its author fetches `bimbos365club.com`; not counted in Russian Hill's tier. |
| Everything the Analysis polygon puts in "North Beach" north of Bay Street — Pier 39, the Aquarium, the Musée Mécanique, Ripley's, the SkyStar Wheel, Boudin, Scoma's | | **FISHERMAN'S WHARF.** North Beach declines them in writing. |

### 1.5 Fisherman's Wharf ↔ Russian Hill (13 places)

Russian Hill's verifier returned the whole block, correctly. Confirmed and closed.

Ghirardelli Square (LM 30 / NRHP 82002249) · Haslett Warehouse and the Argonaut (LM 59 / NRHP
75000172) · The Cannery · Hyde Street Pier and all six ships · the Maritime Museum / Aquatic Park
Bathhouse · Aquatic Park Historic District (NRHP 84001183) · Aquatic Park Cove · Victorian Park ·
Buena Vista Cafe · the Powell–Hyde turntable at Hyde & Beach · the Dolphin Club · the Park Visitor
Center · Joseph Conrad Square — **all FISHERMAN'S WHARF**, on P1: the roster's `fishermans-wharf`
draw names Ghirardelli Square, the Hyde Street Pier ships and Aquatic Park in terms.

Russian Hill writes exactly one sentence off this block, inside Lombard Street: the Powell–Hyde cable
car stops at Hyde and Lombard Streets, at the top of the crooked block.

### 1.6 Marina ↔ Fisherman's Wharf ↔ Pacific Heights

| Place | Identifier | Ruling |
|---|---|---|
| The Fort Mason block — Fort Mason the post, the Port of Embarkation, Fort Mason Center for Arts & Culture, Cowell Theater, Greens, The Interval, Magic Theatre, the Black Point fortifications | NRHP 72000109, 79000530, 85002433 (NHL) | **MARINA** — §3c. |
| Golden Gate Valley Carnegie Library, 1801 Green St | LM 300 (2022) | **MARINA** — Analysis/EAS = Marina; SF Find = Pacific Heights. Pacific Heights' own finder lists it as "Marina's, on the official reading" and then claims it back. The concession is the honest half of that file. |
| Burr House, 1772 Vallejo St | LM 31 (1970); NRHP 14000967 (8 Jun 2015) | **MARINA** — `1772 VALLEJO ST` → Marina on EAS, confirmed independently by the Marina and Russian Hill files. West of Van Ness. |
| Casebolt House, 2727 Pierce St | LM 51 (5 Mar 1973) | **PACIFIC HEIGHTS** — both DataSF layers say Pacific Heights. Cow Hollow is not a rostered zone and the Marina does not claim it. Sinclair's book calling it Cow Hollow does not create a page. |
| Octagon House (LM 17 / NRHP 72000250), Sherman House (LM 49), Metro Theater (LM 261), North End Police Station (LM 218), Allyne Park, Cow Hollow Playground, Liverpool Lil's, Balboa Cafe, Perry's | | **MARINA** — Union Street and Cow Hollow are not rostered zones; Pacific Heights concedes them. (The last three were dropped by the Marina's verifier for want of sourcing; the zone ruling stands regardless.) |
| Albert Wilford Houses | NRHP 85001914 | **MARINA.** |
| Vedanta New Temple, both Vedanta temples, the former Russian consulate | | **MARINA** — Pacific Heights cedes; none survives its own sourcing test, so nothing ships. |
| Palace of Fine Arts, 3301 Lyon St | LM 88 (1977); NRHP 04000659 (5 Dec 2005) | **MARINA** — §3c. |

### 1.7 Chinatown ↔ Nob Hill (4 places)

| Place | Identifier | Ruling |
|---|---|---|
| Donaldina Cameron House, 920 Sacramento St | LM 44 (1971) | **CHINATOWN** — Nob Hill concurs. |
| Clay Street Center / CHSA, 965 Clay St | LM 122 (1981) | **CHINATOWN** — Nob Hill concurs. Nob Hill's verifier could not re-fetch `chsa.org` (403), so **Chinatown's author re-fetches the hours rather than inheriting them.** |
| Chinatown / Him Mark Lai Branch Library, 1135 Powell St | LM 235 (2002) | **CHINATOWN** — Nob Hill concurs. |
| Woh Hei Yuen Park, 922 Jackson St, 0.356 ac | — | **NOB HILL** — `mons`, `planning` and `realtor` all say Nob Hill against `analysis` alone. Three to one. |

### 1.8 Nob Hill ↔ Russian Hill (7 places)

Nob Hill concurs in full; Russian Hill's verifier asked that these be ruled as one question. They are.
**All seven: RUSSIAN HILL.** The federal register named three districts "Russian Hill"; a district the
United States registered as *Russian Hill–Vallejo Street Crest* cannot sit on Nob Hill's page under
that name (P2).

Feusier Octagon House, 1067 Green St (LM 36, 1970; NRHP 74000554) · House of the Flag / Old
Sheppard-Dakin House, 1652–1656 Taylor St (LM 46, 1972) · Atkinson-Escher House, 1032 Broadway (LM 97,
1977) · Russian Hill–Vallejo Street Crest District (NRHP 87002289, 22 Jan 1988; OHP N1549) · Russian
Hill–Paris Block Architectural District (NRHP 87002288, 7 Jan 1988; OHP N1543) · Russian Hill–Macondray
Lane District (NRHP 87002286, 7 Jan 1988; OHP N1542) · Ina Coolbrith Park, 1700 Taylor St.

**Engine Company No. 31 Fire House, 1088 Green St (LM 220, 1998; NRHP 87002290)** — not a straddler.
Both layers return Russian Hill. Nob Hill listed it in error.

**Washington & Hyde Mini Park, 1470 Washington St** — **RUSSIAN HILL.** EAS and `analysis` both Russian
Hill against `mons` alone. Write no hours: the facility page prints "5 to 11:45 a.m.", which is a typo,
and a page does not explain why it is silent.

**The Broadway Tunnel (Robert C. Levy Tunnel)** — **RUSSIAN HILL.** Chinatown fetched no source for it
and dropped it; Nob Hill and North Beach do not claim it. It runs under the hill it is named for.
Kind `attraction`.

**Bob's Donuts, 1621 Polk St** — **NOB HILL** (`1621 POLK` → Nob Hill). Nob Hill's verifier excluded it
from its thirteen; it may be added or left, and is not counted in either tier.

### 1.9 Castro ↔ Haight-Ashbury ↔ Twin Peaks

| Place | Identifier | Ruling |
|---|---|---|
| Kite Hill, 10 Stanton St, 2.87 ac; Seward Mini Park, 70 Corwin St, 0.42 ac | — | **CASTRO**, on `planning_neighborhood = Castro/Upper Market` against `analysis_neighborhood = Twin Peaks`. Twin Peaks is a declined zone: on the analysis reading both parks belong to no page at all. The Castro finder's Nominatim argument is discarded; the planning column is the reason. |
| Duboce Park, 50 Scott St, 4.79 ac, **and the Duboce Park Landmark District** | Article 10 **Appendix N, listed 13 July 2013** | **HAIGHT-ASHBURY** — Rec & Park `analysis_neighborhood: Haight Ashbury`; the Castro cedes it on both columns. Haight-Ashbury gains an Article 10 district identifier its own finder never found. |
| Buena Vista Park, 1293 Haight St, 38.35 ac | — | **HAIGHT-ASHBURY** — both columns. Corona Heights adjoins it and may say so; it may not claim it. |
| Delane House, 70 Buena Vista Terrace | NRHP 82000984 (29 Oct 1982) | **HAIGHT-ASHBURY.** Note the register spelling is **Delane**, not Delano. Hayes Valley's finder read a Castro/Upper Market EAS value for this address and dropped it; the Castro's verifier re-fetched the number and hands it to the Haight. Haight-Ashbury re-queries the address before writing it. |
| St. Joseph's Hospital, 355 Buena Vista Ave East | NRHP 85001016 (9 May 1985) | **HAIGHT-ASHBURY.** |
| Maud's, 929–941 Cole St | LM 331 (2026), Ordinance 69-26 | **HAIGHT-ASHBURY** — the Castro ceded it and deserves credit for not grabbing a landmark from its own 2026 LGBTQ-heritage batch. Kind `historic-site`, status closed; the bar closed in 1989. |
| Society for Individual Rights, 529 Clayton St | — | **HAIGHT-ASHBURY** geographically; **not designated** (`status: Work Program`, no `landmarkno`). No claim from any zone. |
| Mount Olympus, 480 Upper Terrace | — | **HAIGHT-ASHBURY.** The roster's draw names "the Victorians of Ashbury Heights", so Ashbury Heights is in scope. |

### 1.10 Haight-Ashbury ↔ Hayes Valley — the Oak/Divisadero block (5 places)

**All five: HAYES VALLEY.** This is the one place I split a group differently from both files, and P3 is
the reason: 1111, 1152 and 1153 Oak Street face each other across one street. They cannot sit on two
pages.

Abner Phelps House, 1111 Oak St (LM 32, 1970; NRHP 71000187) · Old Mish House, 1153 Oak St (LM 62,
1974; NRHP 79000534) · Charles L. Hinkel House and Carriage House, 280 Divisadero St (LM 190, 1988) ·
Firehouse Engine Co. #2, Truck #6, 1152 Oak St (LM 89, 1977) · Theodore Green Apothecary, 500–502
Divisadero St (LM 182, 1986).

Hayes Valley's verifier re-queried forty-nine EAS addresses one at a time and got forty-nine matches,
including 1152 Oak and 500 Divisadero. Haight-Ashbury's own verifier says the ground reads
NoPa / Alamo Square / Western Addition and that "if Haight-Ashbury does not take these three, only
Hayes Valley can". It can, and it does. Haight-Ashbury falls from 34 surviving places to 31 and its
tier does not move (§7).

**John Spencer House, 1080 Haight St (NRHP 05000273)** — **HAIGHT-ASHBURY.** It is on Haight Street.
**Park Emergency Hospital, 811 Stanyan St (LM 201, 1991)** — **HAIGHT-ASHBURY.** East side of Stanyan,
outside Golden Gate Park. The Haight finder missed it entirely; it is a real Article 10 number.
**Grattan Playground, 1180 Stanyan St, 1.87 ac** — **HAIGHT-ASHBURY.** Cole Valley is not a zone.
**McMorry-Lagan Building, 188–198 Haight St (LM 164, 1983)** — **HAYES VALLEY.** Lower Haight, inside
the Hayes Valley polygon, and Hayes Valley already holds it.

### 1.11 Hayes Valley ↔ Mission ↔ SoMa

| Place | Identifier | Ruling |
|---|---|---|
| Zuni Café, 1658 Market St | — | **HAYES VALLEY** — EAS Hayes Valley, re-confirmed; neither the Mission nor SoMa claims it. |
| US Mint (1937), 155 Hermann St | NRHP 88000026 (18 Feb 1988) | **HAYES VALLEY.** **This is not the Old Mint at Fifth and Mission.** Two distinct buildings, two distinct listings, two different pages. Any sentence conflating them is a fabrication. |
| Sacred Heart Parish Complex, 546–548 and 554 Fillmore St, 735 Fell St, 660 Oak St | LM 316 (2024); NRHP 100001665 (28 Sep 2017) | **HAYES VALLEY** — EAS on all four parcels. One place, two registers, four parcels. |
| Market Street Masonry Historic District | Article 10 **Appendix M, listed 17 May 2013** | **HAYES VALLEY** — the Mission claims no part of it. (The finder's "2011.0705" is a Planning case number and is not a designation identifier; do not write it.) |
| Alamo Square, 1081 Fulton St, 13.649 ac, and the Painted Ladies at 710 Steiner St | Article 10 **Appendix E, listed 6 July 1984** | **HAYES VALLEY** — §3b. |

---

## 2. THE MARQUEE RULE — sixteen names, sixteen files, now and forever

| Marquee | Zone | Citation it carries |
|---|---|---|
| Mission Dolores | **mission** | LM 1, designated 1968; NRHP 72000251, listed 1972. CHL 327-1 only in the same field as one of those two. |
| Coit Tower | **north-beach** | LM 165, designated 1984; NRHP 07001468, listed 2008. |
| City Lights | **north-beach** | LM 228, designated 2001. |
| The Dragon Gate | **chinatown** | None. It carries no designation. Do not invent one. |
| The Castro Theatre | **castro** | LM 100, designated 1977; designation amended by Ordinance 109-23 in 2023, naming the property 429–431 Castro Street. |
| The Palace of Fine Arts | **marina** | LM 88, designated 1977; NRHP 04000659, listed 2005. |
| SFMOMA | **soma** | None. |
| Yerba Buena Gardens | **soma** | None. Absorbs the Martin Luther King Jr. Memorial, the ice rink and the bowling centre. |
| Pier 39 | **fishermans-wharf** | None. |
| The Hyde Street Pier ships | **fishermans-wharf** | *Balclutha* 76000178 · *Eureka* 73000229 · *C. A. Thayer* 66000229 · *Alma* 75000179 · *Hercules* **75000225** (the finder said no number existed; it does). |
| Ghirardelli Square | **fishermans-wharf** | LM 30, designated 1970; NRHP 82002249, listed 1982, as Pioneer Woolen Mills and D. Ghirardelli Company. |
| Grace Cathedral | **nob-hill** | LM 170, designated 1984. Double-sourced against the cathedral's own architecture page. |
| The Cable Car Museum | **nob-hill** | LM 43, designated 1971; NRHP 66000233, listed 15 October 1966, National Historic Landmark. |
| Lombard Street's crooked block | **russian-hill** | None. |
| The Haas-Lilienthal House | **pacific-heights** | LM 69, designated 4 January 1975; NRHP 73000438, listed 2 July 1973. |
| The War Memorial Opera House | **hayes-valley** | LM 84, designated 1977 — which covers the Opera House **and** the Veterans Building on one parcel (APN 0786A001) and **nothing else**. |

**The cable-car designation is Nob Hill's alone.** NRHP 66000233 spans four zones and the register's
own address of record is 1390 Washington Street, the museum. Chinatown may write that the California
Street line crosses Grant Avenue; Russian Hill may write that the Powell–Hyde line stops at Hyde and
Lombard; Fisherman's Wharf may write the two turntables. **None of the three attaches a designation
sentence to a cable car.** Russian Hill's "National Historic Landmark, designated 29 January 1964" is
killed; Nob Hill's layer-1 re-fetch returning `Is_NHL: X` on a 15 October 1966 listing is the record.

---

## 3. THE THREE CONTESTED EDGES

### 3a. SoMa against Yerba Buena, the Financial District and Mission Bay

**Ruled: the Yerba Buena cluster is SoMa's, entire.** SFMOMA (151 Third) · Yerba Buena Gardens (750
Howard) · the Contemporary Jewish Museum (736 Mission) · the Museum of the African Diaspora (685
Mission) · Yerba Buena Center for the Arts (701 Mission / 700 Howard) · Moscone Center (747 Howard) ·
the Children's Creativity Museum (221 Fourth) · Saint Patrick's Church (LM 4, 1968) · the Martin
Luther King Jr. Memorial · the Yerba Buena Ice Skating Center and Bowling Center.

Two city layers from one portal contradict each other on all of it. **SF Find (117 units) wins over
Analysis Neighborhoods (41 units)** for three reasons: it is the finer geography and this is a
block-scale question; it agrees exactly with the roster's stated `soma` draw, which names SFMOMA,
Yerba Buena Gardens, the CJM, MoAD and South Park; and the Analysis layer folds all of it into a
composite unit called "Financial District/South Beach" whose own roster entry names not one of them,
so the coarse reading would orphan the museum quarter on a wave-2 page that never asked for it.
Method A also severs the ice rink from the garden it is built on, which P3 forbids outright.

**Also SoMa's**, on the same ruling: South Park · the South End Historic District (Article 10 Appendix
I, Ordinance 104-90, adopted 23 March 1990) · the Oriental Warehouse (LM 101) · the Piledrivers,
Bridge and Structural Ironworkers Local No. 77 Union Hall (LM 281) · the Gran Oriente Filipino Hotel
(NRHP 100004869) · 21st Amendment Brewery · the Clyde and Crooks Historic District (Article 10
Appendix O, listed 3 December 2018) · the San Francisco Eagle Bar (LM 295) · the Juvenile Court and
Detention Center (LM 248 / NRHP 11000182) · DNA Lounge · the Old Mint (LM 236, NRHP 66000231) · the
James R. Browning United States Court of Appeals Building (NRHP 71000188).

**The Market Street south side is SoMa's from Fifth Street to Second Street**: the Palace Hotel (LM 18),
the Hobart Building (LM 162 / NRHP 100006911), the Mutual Savings Bank Building (NRHP 13001107), 735
Market Street (NRHP 04000327), Hale Brothers (NRHP 86003492 and 01000490), the Four Seasons, Yerba
Buena Lane and Mint Plaza. A street has two sides and SoMa gets the south one.

**Ruled OUT of SoMa and out of wave 1** — see §4: everything east of First Street and everything at
Rincon Hill; the Third Street Bridge and the Garcia and Maggini Warehouse; the Market Street Theatre
and Loft Historic District (NRHP 86000729, 60% Tenderloin by geometry, no page in any wave).

**Path of Gold Light Standards (LM 200)** — a linear feature the length of Market Street with a six-way
split and no majority. **It is nobody's place.** SoMa alone may name it in prose about Market Street.
No other zone mentions it.

### 3b. Hayes Valley against the Civic Center and the Western Addition

**Ruled: the performing-arts complex on the west side of Van Ness Avenue is Hayes Valley's.** The War
Memorial Opera House (301 Van Ness) · the Veterans Building and Herbst Theatre (401 Van Ness) · Louise
M. Davies Symphony Hall (201 Van Ness) · the Harold L. Zellerbach Rehearsal Hall (300 Franklin) ·
SFJAZZ Center (201 Franklin) · the High School of Commerce (LM 140, 135 Van Ness) and the Sydney
Goldstein Theater (275 Hayes, inside that landmark's own parcel 0815001).

EAS returns Hayes Valley for every one, per parcel. Against that stood Nominatim (not an instrument,
§0) and the War Memorial's own marketing line "Bordered by the Hayes Valley neighborhood". An
institution's self-placement in promotional copy is not a boundary source. Decisive: **Civic Center is
not a DataSF Analysis Neighborhood at all, and neither Civic Center nor the Tenderloin is a zone in
any wave.** Ruling against Hayes Valley would orphan Landmark No. 84 and five performing-arts venues
on a page that does not exist. Hayes Valley's tier stays **GUIDE** on this ruling (§7).

**Alamo Square is Hayes Valley's.** The roster declined it as a zone with the words "the Painted Ladies
are its single draw and sit at the edge of Hayes Valley's reach", and EAS puts 1081 Fulton and 710
Steiner in Hayes Valley. **No designation identifier attaches to 710 Steiner Street itself** — the
Painted Ladies publish only inside the Alamo Square district citation, never as "a landmarked row of
houses".

**The Civic Center group east of Van Ness is OUT of wave 1** — §4.

**The Divisadero and Laguna/Buchanan edges are Hayes Valley's.** The Independent (628 Divisadero),
LM 182, LM 89, LM 164, LM 223, the Nightingale House (LM 47), Richardson Hall (LM 256 / NRHP 07001391),
Woods Hall (LM 257) and Woods Hall Annex (LM 258). Duboce Triangle, NoPa and Lower Haight are not
zones; the vernacular has no page to take them to. Note DataSF's survey layer calls the 55 Laguna
group "Western Addition" — a third name from the city's own data. **EAS governs and the page asserts
no neighbourhood name in prose.**

### 3c. The Marina against the Presidio — the line wave 2 inherits

**Ruled: Lyon Street is the line, and Fort Mason is inside it.**

**Marina's, in wave 1:** the Palace of Fine Arts (LM 88 / NRHP 04000659), the Palace of Fine Arts
Theatre, the Wave Organ, Marina Green and the Yacht Harbor, Moscone Recreation Center, the Marina
Branch Library (LM 262), the Ladies' Protection and Relief Society (LM 320), the S.F. Gas Light Co.
building (LM 58), Chestnut Street, and the whole Fort Mason block.

**Fort Mason is the Marina's, and I reject the GGNRA argument.** The Marina's verifier asked whether
the principle that gave the Presidio its own page should give Fort Mason none. It should not. The
roster gave the Presidio a page and gave Fort Mason none, and the roster is the document that creates
pages (P1). Fisherman's Wharf's finder releases Fort Mason to the Marina in writing. Fort Mason
Center's own site places itself in the Marina District. **Wave 2's Presidio page does not restate Fort
Mason.**

**Not the Marina's, and out of wave 1 — the Presidio page (wave 2) takes them:** Crissy Field and the
Crissy Field Center (1199 East Beach Rd) · Presidio Tunnel Tops (210 Lincoln Blvd) · Building 201
Halleck Street · Field Station (601 Mason St) · the Yoda Fountain · the Muybridge and Farnsworth
memorials · Presidio Dance Theatre · Piccino Presidio · **the Presidio Theatre at 99 Moraga Avenue**.

**Two warnings wave 2 must inherit.**
1. **Rec & Park property 111, the Palace of Fine Arts grounds, carries `analysis_neighborhood: "Marina,
   Presidio"` — the 19.74-acre parcel crosses the line.** The Marina writes the **building**, which
   tests Marina on both polygon layers. It must not write the acreage as though the whole parcel were
   the Marina's. The Presidio page does not restate the Palace.
2. **There are two Presidio Theatres.** The OSM node at 2340 Chestnut Street tagged "Presidio Theater"
   is a different building from the Presidio Theatre at 99 Moraga Avenue. The Marina's verifier dropped
   the Chestnut Street node for want of any source; that drop stands, and wave 2 must not resurrect it
   as the Moraga Avenue venue.

**The Lyon Street Steps** — **PACIFIC HEIGHTS**, as one place anchored at Lyon and Broadway. The
Broadway end tests Pacific Heights on both layers; the Washington end tests Presidio / Presidio
Heights. Wave 2's Presidio page does not restate them.

**The Swedenborgian Church, 2107 Lyon Street at Washington (NRHP 04001154, certified 18 August 2004,
National Historic Landmark)** — **PACIFIC HEIGHTS.** Both DataSF layers say Presidio Heights, which is
a zone in **no wave**; Wikipedia's first sentence says Pacific Heights. An open National Historic
Landmark with a published weekly tour time is not left orphaned on a technicality. **Binding
condition: the entry states its address and never states which neighbourhood it is in.** The
superlatives on that article — "one of California's earliest pure Arts and Crafts buildings" and any
"Maybeck's only" formulation — do not publish, and the second matches the gate's proper-noun-plus-only
pattern directly.

---

## 4. RULED OUT OF WAVE 1 — say it plainly so wave 2 can pick it up

Nothing in this section may appear in any wave-1 file. Each row names the wave-2 owner where one
exists, and says "no page in any wave" where none does. Every identifier is recorded so the receiving
author does not re-derive it.

### 4a. Financial District (wave 2)
The **Jackson Square cluster**, entire: LM 9, 10, 11, 12, 13, 14, 15, 16, 19, 20, 22, 23, 24, 25, 26,
27 and **212 (Columbia Savings Bank Building** — not part of the Hotaling group, as the Chinatown
finder tabulated it). Plus the **Jackson Square Historic District** (Article 10 Appendix B, listed 9
August 1972; NRHP 71000186, listed 18 November 1971) · **Old Ohio Street Houses**, 17–55 Osgood Place
(NRHP 79000535) · **Drexler / Colombo Building**, 1–33 Columbus Ave (LM 237, 2002; NRHP 07001469,
certified 31 January 2008).

Also: **Commercial Street** and the Commercial-Leidesdorff Conservation District (`a11 = Listed`) ·
**San Francisco Historical Society Museum / U.S. Mint & Subtreasury Building**, 608–610 Commercial
(LM 34, 1970) · **PG&E Old Station J**, 565–569 Commercial (LM 142, 1981; NRHP 86003514) · **Federal
Reserve Bank**, 400 Sansome (LM 158, 1983; NRHP 89000009) · **NIANTIC storeship** (NRHP 91000563) ·
**Jones-Thierbach Coffee Company Building**, 447 Battery (LM 299, 2022) · **Hilton San Francisco
Financial District**, 750 Kearny · **Levi's Plaza** · **Transamerica Redwood Park**.

**The Embarcadero / Northeast Waterfront**, all of it: the Northeast Waterfront Historic District
(Article 10, Ordinance 171-83, adopted 8 April 1983) · LM 91, 92, 102, 104 and **114 (Belt Line
Railroad Roundhouse Complex, 1980 — the city twin of NRHP 86000207, which North Beach cited alone)** ·
NRHP 97001189, 01001101, 09001117, 09001300 · the **Port of San Francisco Embarcadero Historic
District** (NRHP 06000372). **Caution for wave 2: that district touches Red's Java House, an Oracle
Park code seed. Do not re-claim it.**

**Rincon Hill and the eastern seam**, all of it: Hills Brothers Coffee Plant (LM 157) · F.V. Wilbert
Tool Manufacturing Shop (LM 149) · Rincon Center / Rincon Annex (LM 107, address of record **99 Mission
Street** on the Article 10 register and 101–199 Mission on the National Register; NRHP 79000537, 1979) ·
the Audiffred Building (LM 7; NRHP 79000528) · the Folger Coffee Company Building (NRHP 96000679) · the
Coffin–Redington Building (NRHP 01000028) · the Rialto Building (NRHP 10001108) · Baker and Hamilton
(NRHP 05000001) · Salesforce Tower and Salesforce Park · the San Francisco Railway Museum · Rincon
Park and Cupid's Span · Boulevard · Waterbar · **Pier 24 Photography, permanently closed 1 February
2025**. Note both NPS point-layer coordinates for the Coffin–Redington and Folger buildings plot into
Nob Hill and are wrong by two kilometres; assign by street address.

**SS *Jeremiah O'Brien*.** Three berths in three sources — the register froze "Pier 3, Fort Mason
Center", the infobox says Pier 35, and Pier 45 is captioned as former. **No wave-1 file writes it.**
Whoever takes it separates the NRHP listing (7 June 1978, ref 78003405) from the NHL designation (14
January 1986) — the Fisherman's Wharf finder put *Pampanito*'s NHL date on it.

### 4b. Union Square (wave 2)
Notre-Dame-des-Victoires, 564–566 Bush St (**LM 173, 1984**) · Met Life – Pacific Coast Head Office,
600 Stockton St (**LM 167, 1984**) · Fire Station 2, 460 Bush St (**LM 143, 1981**) · San Francisco
Playhouse · Un-Scripted Theater, 533 Sutter · Gallery 444, 444 Post · Kensington Park Hotel, 450–460
Post · Chancellor Hotel, 433 Powell · the Powell and Market turntable (already the roster's).

### 4c. Japantown (wave 2)
Cottage Row Mini Park · the **Bush Street–Cottage Row Historic District** (Article 10; DataSF's own
prose places it in the Western Addition and Wikipedia's table places it in Japantown — **only the
analysis polygon says Pacific Heights**) · Kinmon Gakuen (**LM 288, 2019**; its NRHP 100012857 does not
verify and must not be written) · the Japanese YWCA / Issei Women's Building · Stanyan House · Ohabai
Shalome / Bush Street Temple (**LM 81, 1976**) · **Building at 1735–1737 Webster Street, NRHP 73000444,
certified 8 March 1973** — the reference number is **good**; Pacific Heights' finder called it
unconfirmed and its verifier proved otherwise · Sweet Maple · the Peace Pagoda (`landmarkno = 0`, no
designation) · the Boom Boom Room / Fillmore Heritage · Marcus Books.

### 4d. Mission Bay (wave 2)
**Third Street Bridge**, Third Street over Mission Channel (**LM 194, 1989**, Strauss Engineering
Corporation, 1931) · **Garcia and Maggini Warehouse**, 128 King St (**LM 229, 2002**). Both are Mission
Bay on the Analysis layer. **Neither is one of the seven Oracle Park slugs** — I checked the module —
so both are unclaimed and wave 2 may take them.

### 4e. Noe Valley (wave 2)
Axford House, 1190 Noe St (**LM 133, 1981**) · David Lewis House, 4143 23rd St (**LM 186, 1988**) ·
Carnegie Noe Valley / Sally Brunn Branch Library, 451–455 Jersey St (**LM 259, 2008**) · Lyon-Martin
House (**LM 292**).

**Liberty Hill Historic District** (Article 10 **Appendix F, listed 25 October 1985**, `multigeom`) and
**Liberty Street Historic District** (**NRHP 83001230, listed 15 September 1983**, "Roughly 15–188
Liberty St.") — **BOTH OUT OF WAVE 1.** The roster gives "the Victorians of Liberty Hill" to Noe
Valley; EAS returns Mission for 50 and 150 Liberty Street. **P1 governs: the roster wins, and Noe
Valley takes both districts in wave 2.** The Mission claimed Liberty Hill without noticing the roster
entry and must not write either. Neither district's boundary may be asserted from the Liberty Hill
appendix, which nobody has read; the Liberty **Street** district's extent is in the NPS record and may
be stated.

### 4f. Golden Gate Park, the Presidio and the park pages (wave 2)
Alvord Lake and the Alvord Lake Bridge · Hippie Hill · Kezar Stadium (`landmarkno = 0`) · the Panhandle
· Golden Gate Park Section 1 · the AIDS Memorial Grove. The roster makes Golden Gate Park a standalone
page "claimed by no neighborhood"; a `planning_neighborhood` of "Golden Gate Park, Haight Ashbury"
does not override it. The Presidio inventory is at §3c.

### 4g. No page in any wave — the roster gaps, stated so they are not lost
These carry real identifiers and have nowhere to go. **No wave-1 file writes any of them.**

- **The Civic Center group.** San Francisco City Hall (**LM 21, 1970**) · the **San Francisco Civic
  Center Historic District, NRHP 78000757, listed 10 October 1978, a National Historic Landmark
  district** — note **78000751 is a different building in San Diego** and a query on it returns
  cleanly, which is more dangerous than a 404 · the **Civic Center Article 10 district, Appendix J,
  listed 23 December 1994** · the Asian Art Museum · the Main Library · Bill Graham Civic Auditorium ·
  United Nations Plaza · Civic Center Plaza · the Federal Office Building, 50 UN Plaza (**NRHP
  100001018**). All EAS **Tenderloin**; Tenderloin and Civic Center appear in neither `zones` nor
  `declined`.
- **Lower Nob Hill and the Tenderloin.** Gaylord Hotel, 620 Jones St (**LM 159, 1983**) · Islam Temple
  / Alcazar Theater, 650 Geary Blvd (**LM 195, 1989**) · the Bohemian Club, 624 Taylor St · the
  **Lower Nob Hill Apartment Hotel Historic District, NRHP 91000957, listed 31 July 1991** (its
  *Addition* is `cr: Eligible, nr: No` — **no claim**). Nob Hill may name the district in prose with
  its reference number; **it may not claim to contain it, and no zone claims the two landmarks.**
- **Polk Gulch.** Old First Presbyterian Church · St Luke's Episcopal Church (**NRHP 100009644 is a
  null record — address, city, county and certification date all empty. It must not be cited by
  anyone**) · Hi-Lo Club · Encore Karaoke · Providence · St George and Kidanemheret Ethiopian Orthodox
  Church · the SFMTA Bush & Polk Garage.
- **Audium, 1616 Bush Street at Franklin.** No wave-1 zone contains Bush and Franklin, and the address
  is Lower Nob Hill / Cathedral Hill. **OUT.** Its material is fully sourced (176 speakers, 49 seats,
  performed in darkness) and is worth a later wave's time.
- **Market Street Theatre and Loft Historic District, NRHP 86000729** — geometry is Tenderloin 60% /
  South of Market 40%. **No zone owns it.** SoMa does not claim a district whose majority is on a page
  that does not exist.
- **South Beach and Rincon Hill** are not zones. Everything I ruled to SoMa in §3a I ruled there because
  the roster names it or because the alternative was orphaning; nothing else from those units enters
  wave 1.
- **The International Hotel / Manilatown Center, 868 Kearny Street** — the roster has no Manilatown.
  Point-in-polygon says Chinatown and no zone in either wave rivals it. **Ruled to CHINATOWN**, as a
  place at 868 Kearny Street with **no neighbourhood named in the prose**. The 4 August 1977 eviction,
  the 1981 demolition and the 2005 reopening are strong sourced history and should not be lost to a
  roster gap. Flagged to the coordinator as the clearest roster defect in the wave.
- **Twin Peaks, Bernal Heights, Potrero Hill, Alamo Square, Cole Valley, Duboce Triangle, NoPa,
  Western Addition, Presidio Heights, Manilatown** — declined or absent. Precita Park and Coso &
  Precita Mini Park (Bernal Heights), the Royal Baking Company (LM 290, Excelsior) and the S.F. & San
  Mateo Railroad Co. Office Building (LM 180, Glen Park) are recorded as excluded and are nobody's.

### 4h. Dead, gone or unwritable — not a boundary question
- **The Cartoon Art Museum.** Closed 3 August 2026 with no successor address, and its last address,
  781 Beach Street, is not SoMa. **Two independent disqualifications. It appears in no file.**
  Fisherman's Wharf is hereby told rather than discovering the empty unit.
- **Pier 24 Photography** — permanently closed 1 February 2025.
- **The California Historical Society** — dissolved; `californiahistoricalsociety.org` does not
  resolve. It must not be cited or linked by anyone. **SoMa writes no operator narrative for it** —
  the publishable residue is that no source states opening hours for the Old Mint.
- **Local Brewing Co.** — no current address on its own site.
- **Madame Tussauds San Francisco and the San Francisco Dungeon** — both operator sites confirm
  neither location exists. The Wikipedia zone article listing Tussauds is stale.
- **The Real Food Company, 2140 Polk St** — its own site says "We are now closed." Russian Hill nearly
  shipped a shuttered grocer. Bi-Rite Market Polk is a "coming soon" and does not ship either.
- **South End Rowing Club** — `south-end.org` 301s off-host to a gambling site. Do not cite the obvious
  domain. **`15romolo.com`, `leopoldssf.com`, `swanoysterdepot.us`, `browserbooks.com`,
  `janeonfillmore.com`, `theelitecafe.com`** are all squatted, parked or hijacked. None is a source.
- **The Portsmouth Square pedestrian bridge** — demolished, completion confirmed 14 August 2026. It
  must not appear as an existing place and "China Banks" must not be written in the present tense.
- **Portsmouth Square itself is closed for renovation through mid-2028**, and that is the most
  important operational fact in Chinatown.

---

## 5. ORACLE PARK — confirmed clean

I read `lib/ethos/seeds/oracle_park_places.ex` rather than trusting the brief. It owns exactly seven
slugs, all `town: "San Francisco"`: `oracle-park`, `reds-java-house`, `momos-san-francisco`,
`flour-and-water-pizza-shop-mission-rock`, `arsicault-bakery-mission-rock`,
`blue-bottle-coffee-mission-rock`, `china-basin-park`.

**No wave-1 file claims any of the seven.** All twelve finders checked and all twelve came back clean;
I re-checked the list against every candidate in all twenty-four files and found no collision by slug
or by name.

Four consequences the authors must carry:

1. **`flour-and-water-pizza-shop-mission-rock` is taken. Flour + Water at 2401 Harrison Street is a
   different restaurant** (`2401 HARRISON ST` → Mission) and needs a distinct slug if the Mission
   claims it. Do not conflate the two.
2. **`blue-bottle-coffee-mission-rock` is taken.** Hayes Valley's Blue Bottle at 315 Linden Street
   (`315 LINDEN ST` → Hayes Valley, confirmed) is a different location and takes
   `blue-bottle-coffee-linden` or similar.
3. **Two more global slug collisions, outside San Francisco, caught by North Beach's verifier and
   binding on its author:** `washington-square-park` is owned by `manhattan/greenwich-village.json`
   → use **`washington-square-north-beach`**; `tosca-restaurant-suffield` exists in
   `connecticut/suffield.json` → use **`tosca-cafe-north-beach`**. (Tosca Cafe is dropped for a dead
   host in any case; the slug ruling stands for whenever it returns.)
4. **`.superpowers/taken_slugs.py` globs `priv/seed_data/rome/*.json` only.** Eleven of the twelve
   finders caught this independently and the brief is wrong about it. The corpus is **3,921 places
   across 333 files carrying places**, and the tool sees 1,279 of them. It also cannot see the Oracle
   Park code seed, because that lives in `lib/`, not `priv/`. **Escalated to the coordinator: fix the
   glob to `priv/seed_data/**/*.json` and append the code-seed slugs before wave 2 runs.** Two of the
   three collisions in point 3 were nearly missed because of it.

---

## 6. DESIGNATION CLAIMS — the register, the identifier, and the eleven that die

### 6a. The gate mechanic every author must know before writing a sentence

`@designation_claim` fires on the bare words **designated, listed, landmark, registered, nominated**.
`@designation_citation` accepts **only** four things: `San Francisco Landmark No. <digits>`,
`Article 10`, `National Register` / `NRHP` / `NR reference`, or the literal `reference number`
followed by six or more digits.

`prose/1` tests each `summary`, `history` and entry `note` **as a whole string**. So a claim and its
citation must live in the **same field**. Splitting a designation paragraph across `summary` and
`history` re-breaks it.

**Three registers that do NOT satisfy the citation pattern and therefore cannot stand alone:**

- **"National Historic Landmark"** — trips the claim regex, matches no citation.
- **"California Historical Landmark No. <n>"** — same.
- **"National Historic Treasure"** and any National Trust programme label — not a statutory register
  at all, and printing it beside two real identifiers reads as a third. Haight-Ashbury's verifier
  caught this; it binds everyone.

Each publishes **only in the same field as an SF Landmark number, an Article 10 citation or an NRHP
reference number.** Cleared forms:

> The Old San Francisco Mint stands at 88 Fifth Street. … It is San Francisco Landmark No. 236,
> designated in 2003, and was listed on the National Register of Historic Places in 1966, reference
> number 66000231. It was designated a National Historic Landmark in 1961 and is California
> Historical Landmark No. 875.

> Mission San Francisco de Asís is San Francisco Landmark No. 1, designated in 1968, and was listed
> on the National Register of Historic Places in 1972, reference number 72000251. California State
> Parks records the site of the original chapel and the Laguna de los Dolores as California
> Historical Landmark No. 327-1.

> Old St Mary's is San Francisco Landmark No. 2, designated in 1968, and the site is also California
> Historical Landmark No. 810, listed on 30 December 1965.

> The Aquatic Park Historic District was listed on the National Register of Historic Places in 1984,
> reference number 84001183, and designated a National Historic Landmark district on 28 May 1987. It
> is also California Historical Landmark No. 236, designated in 1936.

### 6b. Killed — bare, false or unverifiable claims that survived a verifier or a finder

| # | Claim | Ruling |
|---|---|---|
| 1 | **NRHP 82002247, "Fillmore-Pine Building", 1946 Fillmore Street** | **FABRICATED.** Zero features on both NPS layers by refnum, zero in a wider envelope, and no listing at that address under any name in the 191-row city list. The finder called it "confirmed twice". **The building is deleted from Pacific Heights entirely.** The worst thing in the wave, because a reference number reads as authority. |
| 2 | **NRHP 11000501 attached to the library at 850 Columbus Avenue** | **KILLED.** The listed building is at **2000 Mason Street**; 850 Columbus **opened 10 May 2014** and cannot be a 2011 listing. The parcel's stale `ceqacodereason` of "National Register Individual" is the trap. North Beach writes the branch with its architects (Leddy Maytum Stacy) and **no register claim**. |
| 3 | **NRHP 11000944, "Sinton House", 1020 Francisco Street** | **KILLED.** The NPS record returns a **District of Columbia** location, no listing date and no tie to the address; the noehill mirror 404s. Russian Hill drops the place. |
| 4 | **NRHP 100009644, St Luke's Episcopal Church** | **KILLED.** Address, city, county and certification date all null. |
| 5 | **NRHP 100012857, Kinmon Gakuen** | **KILLED.** Zero features by refnum and zero by name across California. LM 288 (2019) is solid; the place is Japantown's (§4c). |
| 6 | **The Huntington Hotel's National Register status** | **KILLED.** The parcel reason says "National Register Individual"; both NPS layers return nothing for Huntington in San Francisco County and no reference number exists. |
| 7 | **NRHP for the *Eppleton Hall*** | **KILLED.** No record exists under any spelling. The finder's "27 June 1988" is **01000281**, the San Francisco Maritime National Historic Site record at Fort Mason Bldg 201 — a different resource. And **01000281 itself carries an incoherent date** (a certification of 27 June 1988 on an `01…`-series number): **no date publishes for that listing at all.** |
| 8 | **"South End Historic District is listed on the National Register"** | **KILLED.** DataSF says `nr: Listed`; the National Register does not know the district. SoMa writes the Article 10 sentence — Appendix I, Ordinance 104-90, adopted 23 March 1990 — and no federal sentence. |
| 9 | **NRHP 100009717, Western Manufacturing Company Building** | **KILLED.** A stub with no address; it cannot be placed inside any boundary. |
| 10 | **California Historical Landmark No. 192** (Jenny Lind Theatre / first City Hall, under the Hilton) | **KILLED.** Not in the OHP San Francisco county list; neither "Jenny Lind" nor "City Hall" appears. |
| 11 | **San Francisco Landmark No. 65 for Trinity Presbyterian Church** | **KILLED as a number.** The city's row is a transcription error and the true number (probably 166) rests on a filename convention plus a gap in the sequence — inference, not citation. **The ordinance is better than the number and publishes:** "Trinity Presbyterian Church at 3261 23rd Street was designated under Article 10 of the City Planning Code by Ordinance No. 82-84, approved on 28 February 1984. It was listed on the National Register of Historic Places in 1982, reference number 82002252." |

**Additionally killed as a *place*, not as a number:** the Lambert Apartments' membership of NRHP
91000957. The parcel names no district and Jones Street is outside the listed range; "intersecting
cross street" is an inference. **No designation sentence.**

### 6c. `landmarkno = 0` — the citywide trap, forty rows, and it is not landmark number zero

Confirmed by four independent verifiers. `97yj-54sx` is titled "Landmarks Listed in Article 10" and
carries survey and under-consideration rows with `landmarkno = 0`, `yeardesignated = 0.0` and
`designationdocument = None`. **A row with `landmarkno = 0` is not a landmark.** No designation
sentence for any of them, in any zone, ever:

Far East Cafe (631–645 Grant) · Delta House / Bayanihan House (88 Sixth) · Strand Theater (1127
Market) · SF Galvanizing Works · Southern Police Station (360 Fourth) · **Mattachine Society
Headquarters (188 Minna)** · Sailor's Union of the Pacific Hall (450 Harrison) · Gran Oriente Filipino
Complex · Orders of Foresters / Baháʼí Temple (170 Valencia) · Zuckerberg San Francisco General
Hospital · Eureka Valley branch library · First Baptist Church · Society for Individual Rights (529
Clayton) · 2 Clarendon Avenue · Momo's 440 Club (438–440 Broadway) · the Alcoa Building · the Fillmore
Auditorium · Glide Memorial Church · Kezar Stadium · the Peace Pagoda · the I. Magnin Building ·
Wolski House (3655 Clay) · Russell House (3778 Washington) · National Urban League SF Chapter (2015
Steiner) · the Office of Dr. Carlton B. Goodlett (1843–1849 Fillmore) · Congregation Emanu-El School
Buildings (1337 Sutter).

**The Mattachine Society headquarters, Delta House and the Far East Cafe are exactly the places a
writer reaches for a landmark claim about, and there is none to make.** The Far East Cafe ships as a
Grant Avenue restaurant in a 1908 building and **no sentence in the Chinatown file may contain
"landmark", "designated", "listed" or "registered" in connection with it.**

### 6d. "Eligible" is not "listed" — no protection claim, anywhere

`63x5-g3m4` carries `cr`, `nr` and `a10` separately. Only `Listed` is a designation. **No register
word attaches to any of these:**

- **Chinatown Historic District** — `a10 No, a11 No, cr Eligible, nr Eligible`, origin note "Local and
  NR, neither have been formalized officially". **No Chinatown building may be written as listed on
  the National Register.** The honest sentence names the district as *eligible*, and "eligible" does
  not trip the claim regex. Not one NRHP listing sits in vernacular Chinatown.
- **Hayes Valley Residential Historic District** — `cr Listed, nr Eligible, a10 No`. Writing "listed on
  the National Register" here would **satisfy the citation regex and be false**. The gate checks form,
  not truth. Hayes Valley's finder saw this and it is the best catch in its file.
- **SoMa** — the SoMa LGBTQ Historic District, South Park Historic District, the South End Historic
  District Addition, the Western SoMa Light Industrial and Residential HD, the Sixth Street Lodging
  House HD. The New Montgomery–Mission–Second Street district is **Article 11**, a conservation
  district, not a landmark district.
- **Marina** — Marina HD, Marina Corporation Residential HD and its Extension, Baker Street HD, Baker
  Street Period Revival Bungalows HD, Cow Hollow First Bay Tradition HD, Lombard Street HD. All seven
  `cr Eligible, nr No, a10 No`.
- **Castro** — Eureka Valley Commercial & Castro Village LGBTQ+, Upper Market Street Commercial and its
  Extension, Hartford Street, 19th and Noe, L. Arthur 18th Street Flats, Dorland Street Bungalows,
  Duboce Triangle and its Extension, Castro & Liberty Streets. The Castro finder's generalisation that
  *every* district in `63x5-g3m4` is eligible-only is false — Duboce Park is `a10 Listed` and Liberty
  Street is `nr Listed` — but its rule is right and stands.
- **North Beach** — Washington Square HD, Upper Grant Avenue HD, Southeast Telegraph Hill HD, Gardner
  Dailey/Telegraph Hill HD, North Point Sewage Treatment Plant HD, Jackson Square HD **Extension**
  (distinct from the listed district and easy to conflate).
- **Pacific Heights** — Pacific Heights HD, Upper Fillmore Neighborhood Commercial, Raycliff Terrace,
  Normandie Terrace, Japantown Community & Cultural, Presidio Heights, California Street.
- **Mission** — 25th Street HD, Fair Oaks Street HD.
- **Nob Hill** — the Auxiliary Water Supply System district (`cr Eligible, nr Eligible`). The brick
  cisterns at Taylor & Clay, Powell & Bush, Mason & California and Jones & Jackson are good walk
  material and publish as street fabric with **no designation sentence**.

Also: SF Planning's parcel `ceqacodereason` strings — "National Register Historic District",
"California Register Historic District", "Historic Survey Result", "Article 10 Individual Landmark
Work Program" — are **CEQA screening categories, not designations**. Only `ceqacodea10a11 = A*` with
reason "Article 10 Individual Landmark" corresponds to a real listing.

### 6e. Identifiers a verifier recovered — record them, because the author cites verbatim

- **Article 10 district appendices and dates**, which two finders omitted: South End **Appendix I,
  Ordinance 104-90, 23 March 1990** · Clyde and Crooks **Appendix O, 3 December 2018** · Market Street
  Masonry **Appendix M, 17 May 2013** (not "2011.0705", which is a case number) · Alamo Square
  **Appendix E, 6 July 1984** · Duboce Park **Appendix N, 13 July 2013** · Liberty Hill **Appendix F,
  25 October 1985** · Jackson Square **Appendix B, 9 August 1972** · Civic Center **Appendix J,
  23 December 1994** · Telegraph Hill **Appendix G, Ordinance 442-86, 13 November 1986** · Northeast
  Waterfront **Ordinance 171-83, 8 April 1983** · Webster Street **Ordinance 166-81, 8 April 1981**
  (Wikipedia's "District No. 2" is unsupported by DataSF — **do not write the district number without
  the ordinance**).
- ***Hercules*, NRHP 75000225, certified 17 January 1975.** The Fisherman's Wharf finder declared it
  unfindable and instructed that the ship carry no designation sentence. It exists. Restored.
- **Aquatic Park, California Historical Landmark No. 236, designated 1936** — subject to §6a: it
  publishes only beside NRHP 84001183.
- **Belt Line Railroad Roundhouse Complex, LM 114 (1980)** — the city twin of NRHP 86000207. Both
  belong to wave 2 (§4a), and the wave-2 author cites both.
- **Colombo Building, NRHP 07001469, certified 31 January 2008** — the federal twin of LM 237. Wave 2.
- **Park Emergency Hospital, LM 201 (1991)** and **McMorry-Lagan Building, LM 164 (1983)** — two
  Article 10 numbers the Haight-Ashbury finder missed. Ruled at §1.10.
- **The 2026 designation batch is COMPLETE and publishes.** The Mission finder rated LM 327, 330, 332,
  334, 335 its least-confident item on the theory that a `citypln-m-extnl.sfgov.org` document URL is
  what an *initiated* designation looks like. It is not — the URL reflects which vault the PDF was
  filed in. The Castro's verifier extracted enacted **ordinance numbers** for every one: LM 322 →
  60-26 · 323 → 61-26 · 325 → 63-26 · 326 → 64-26 · 329 → 67-26 · 331 → 69-26 · 333 → 71-26 · 335 →
  73-26, all carrying a Board of Supervisors memorandum dated 15 May 2026. **The 2026 numbers publish
  citywide.**
- **The Calle 24 legislative instruments**, the Mission finder's highest-value open question, answered
  from the Board of Supervisors API: **Resolution No. 168-14 (file 140421), enacted 28 May 2014** ·
  **Resolution No. 201-14 (file 140659), enacted 19 June 2014** · **Ordinance No. 085-17 (file 170028),
  enacted 31 March 2017**, creating the Calle 24 Special Use District "generally bounded by 22nd
  Street, Potrero Avenue, Cesar Chavez Street, and Capp Street, as well as 24th Street to Bartlett
  Street". **None of the three matches `@designation_citation`, and none needs to: `@designation_claim`
  does not fire on "established" or "created".** The cleared wording is in the Mission's verdicts §6
  and the author uses it verbatim. **Do not write "designated" anywhere in that paragraph** and drop
  the organisation's 1999 founding year.
- **The James R. Browning United States Court of Appeals Building**, 95 Seventh Street, James Knox
  Taylor, built 1897–1905, **NRHP 71000188, National Historic Landmark**. A second NHL in SoMa that the
  brief did not anticipate. Do not write that it is open to the public.

### 6f. Two register-name and address corrections that must not be lost

- **LM 199, Jackson Brewery Co. Complex** — the cross street is **Eleventh**, not Fourteenth. Two
  registers agree against the finder: 1475–1489 Folsom Street and 319–351 Eleventh Street.
- **LM 107, Rincon Annex** — the Article 10 address is **99 Mission Street**; 101–199 Mission is the
  National Register's address for the same building. Attribute each to the register that states it.
- **Normalise the city's typographical errors:** write "Piledrivers, Bridge and Structural Ironworkers
  Local No. 77 Union Hall" (the dataset says "Inonworkers") and "San Francisco Eagle Bar" (the dataset
  says "San Francsico"). Write "Russell Warren House", not the register's inverted "Warren, Russell,
  House". Write "Delane House", which is the register's spelling. LM 309 is registered as "Church for
  the Fellowship of All **People**"; the congregation styles itself "All Peoples" — the register's
  spelling in the citation, the congregation's in the name.
- **LM 316 covers four parcels**: 546–548 and 554 Fillmore Street, 735 Fell Street and 660 Oak Street.
- **Never state a count of landmarks in reader-facing prose.** North Beach's verifier ruled this for
  one file; I extend it to all twelve. Every count in every finder file is wrong in at least one
  direction — SoMa stated its identifier total three different ways in one document — and a count
  invites a superlative.

---

## 7. TIER RULINGS

**Ten guides, two town pages.** Confirmed against surviving counts *after* every ruling in this file.

| Zone | Tier | Surviving | Note |
|---|---|---|---|
| `mission` | **guide** | 66 → **75** with the Dolores complex and Dolores Park, minus Mission High, the Tanforan Cottages, St Nicholas and Liberty Hill/Liberty Street | Not hostage to any ruling here; 66 was already clear. Ships Mission Dolores, the Basilica and the Cemetery as **one place**. |
| `north-beach` | **guide** | 26 unambiguous **+ 5 Telegraph Hill + 6 Columbus** = 37 | Clears before any ruling is applied. |
| `chinatown` | **guide** | 41, **+ the Stockton Street Tunnel and the International Hotel** = 43 | Excludes all 17 escalations, so the count survives every ruling against it. |
| `castro` | **guide** | 41 **+ Mission High, the two Tanforan Cottages, Kite Hill, Seward Mini Park** = 46 | Its verifier is right that the tier never depended on the Dolores seam. |
| `soma` | **guide** | 55 with Yerba Buena and the seams; 28 on the strict polygon | Guide on either. |
| `fishermans-wharf` | **guide** | 31 | Uncontested after §1.5. |
| `nob-hill` | **guide** | 13 **+ the Dennis T. Sullivan Memorial Home, Woh Hei Yuen Park, Our Lady of Guadalupe** = 16 | All thirteen sit inside both Nob Hill polygons; none depends on a ruling. Build the page on the **SF Find** polygon, not the analysis polygon. |
| `marina` | **guide** | 25 **+ Golden Gate Valley Carnegie Library and Burr House** = 27; 17 without Fort Mason | Guide on either. |
| `pacific-heights` | **guide** | 39 **+ Casebolt, the Lyon Street Steps, the Swedenborgian Church, the Health Sciences Library (LM 115, restored by its verifier)**, minus the Japantown eight = 42 | |
| `hayes-valley` | **guide** | 34 **+ Alamo Square, the five Oak/Divisadero landmarks, Zuni Café, the US Mint, Sacred Heart, the Market Street Masonry district** = 44 | **The condition its verifier set is resolved in its favour** (§3b). The performing-arts complex stays, so the fallback to town-page does not trigger. |
| `haight-ashbury` | **town-page** | 34 − 3 to Hayes Valley + Duboce Park, Buena Vista Park, Maud's, Park Emergency Hospital, Grattan, Delane, St Joseph's, the Spencer House = **~39** | **Tier unchanged, and the shape is the reason, not the count.** Twenty-five of its survivors are shops carrying a name, an address and a kind, whose single richest fact — the registration date — is barred from becoming a founding date. A guide would assert depth this material does not have. |
| `russian-hill` | **town-page** | 26 including all seven crest escalations, now awarded | No dominant anchor. A crooked street, three National Register districts that do not contain one another, a closed art school, a 2022 park, a motor tunnel and a short commercial spine. Nothing subsumes the rest. |

### 7.1 The two-link floor, solved here and not in the author's lap

Both town pages need two `guide:` links. Ruled:

- **`russian-hill`** → **`guide:fishermans-wharf-guide`** (Ghirardelli Square, the Haslett Warehouse,
  Aquatic Park and the Hyde Street Pier, all at the foot of the hill and all ruled away from Russian
  Hill at §1.5) and **`guide:nob-hill-guide`** (the Cable Car Museum and the cable-car designation,
  ruled Nob Hill's at §2).
- **`haight-ashbury`** → **`guide:hayes-valley-guide`** (the five Oak and Divisadero landmarks ruled to
  Hayes Valley at §1.10, and Alamo Square) and **`guide:castro-guide`** (Corona Heights adjoining Buena
  Vista Park, and the 2026 LGBTQ-heritage designation batch that runs across both zones).

**Neither link note may say why.** "These places belong to X's page" is banned by
`@self_reference_patterns`, which fires on `\bbelongs? to \w+(?:'s)? (?:page|guide)\b` and on
`\bon this page\b`. The link is the mechanism; it needs no narration.

### 7.2 Kinds — ruled once, corpus-wide, because five files asked

The schema is a closed list of thirteen that the gate reads directly from
`Ethos.Places.Place.kinds/0`: `museum theater restaurant cafe brewery hotel bnb park historic-site
amusement-park shop stadium attraction`. **There is no `bar`, `nightclub`, `church`, `library`,
`school`, `plaza`, `square`, `monument`, `bridge`, `hostel` or `ship`. Do not invent one — Rome
shipped three invented kinds and the changeset rejected them at seed time.**

| Case | Kind | Applies to |
|---|---|---|
| A bar or nightclub trading and serving the public on premises | **`restaurant`** | SF Eagle, DNA Lounge, The Endup, Zeitgeist, Twin Peaks Tavern, Li Po Cocktail Lounge, Vesuvio, The Saloon, Comstock Saloon, The Café, Beaux, Midnight Sun, Frascati |
| A bar or venue that has closed | **`historic-site`** | Maud's, Paper Doll Bar, the Alhambra Theater, the Old Spaghetti Factory Cafe building, the Metro Theater |
| A brewery that actually brews | **`brewery`** | Magnolia Brewing. **Not Zeitgeist**, which does not brew — `brewery` there is a false statement. |
| A working church a visitor can enter | **`attraction`** | Most Holy Redeemer, St. Nicholas Cathedral, Saint Francis Lutheran |
| A church or temple written from the pavement | **`historic-site`** | Old St Mary's, St Joseph's, Tin How, Kong Chow, Ma-Tsu, Sts Peter and Paul, the National Shrine, St Brigid's, Calvary, Sherith Israel, St Dominic's, Church for the Fellowship of All Peoples |
| A library | **`attraction`** | Marina Branch, Chinatown/Him Mark Lai, North Beach Branch, Eureka Valley, Golden Gate Valley |
| A convention centre, a plaza, a memorial, a walk, a tunnel, a street, a turntable, a public artwork designated as a landmark | **`attraction`** | Moscone Center, Harvey Milk Plaza (absorbing LM 319), Pink Triangle Park, the Rainbow Honor Walk (absorbing the Castro Street History Walk), the Broadway Tunnel, Chestnut Street, Grant Avenue, the two cable-car turntables, the Chata Gutiérrez and Carnaval Murals, Balmy Alley, Clarion Alley, Calle 24, the Wave Organ, the Filbert and Greenwich Steps, Grace Marchant Garden, Mount Olympus, the Lyon Street Steps |
| A bridge, a designated house, a fire house, a private residence | **`historic-site`** | the Third Street Bridge (wave 2), and every numbered house in every zone |
| A hostel | **`attraction`** or drop | Green Tortoise. `hotel` misdescribes it. |
| A school, an operating hospital, a working office | **no kind fits — not a place** | Marina Middle School, Harvey Milk Civil Rights Academy, Gordon J. Lau Elementary, Nam Kue, Cathedral School for Boys, CCSF Fort Mason Art Campus, Zuckerberg SF General. Their history may go in guide prose. |

**Do not create a second place record for an artwork that is inside a place you are already writing.**
Rivera's *The Making of a Fresco* (LM 294) folds into the San Francisco Art Institute; the Martin
Luther King Jr. Memorial folds into Yerba Buena Gardens; the Haring altarpiece and both labyrinths fold
into Grace Cathedral; the Sun Yat-sen statue and the Column of Strength ride with St Mary's Square out
of the wave; Take Root folds into the Chinatown library. Shipping the fresco separately would put 800
Chestnut Street in the corpus twice.

---

## 8. PROSE — what survived a verifier and must not reach an author

`"photos": []` everywhere, in every zone, without exception. Nobody has sourced, named or linked an
image and nobody may.

### 8.1 Regex facts every author needs, transcribed from the gate

1. **`\b[A-Z][a-z]+(?:'s|s')\s+only\b` fires on any proper noun.** "Maybeck's only", "Libeskind's
   only", "Polk's only", "Mullett's only", "Strauss's only", "Pflueger's only". This wave is
   architect-heavy and walks straight into it.
2. **`\bsteps (?:from|away)\b` is case-insensitive**, so *any* sentence putting the word "Steps"
   immediately before "from" fails the build. **"the Filbert Steps from Telegraph Hill Boulevard" is a
   build failure.** Write "The Filbert Steps run down the east face of Telegraph Hill between Telegraph
   Hill Boulevard and Sansome Street."
3. **`(?:southern|northern|eastern|western)most` is banned.**
4. **The word "vertices" is banned outright**, as are `tests wholly/cleanly/inside` and
   `boundary research|geometry|method`. Every point-in-polygon result, every HTTP status, every
   Nominatim rate-limit narrative, every DNS note and every hand-built quadrilateral **stops at the
   edge of the research files.**
5. **`\bon this page\b` and `belongs to X's page` are banned.** A page with no restaurants does not
   list restaurants and does not announce that it has none.
6. **"Landmark" is itself a claim word.** "a landmark of the neighborhood", "a landmark venue", "genuine
   Mission landmarks in the vernacular sense", "Listed features:" — all demand a register and an
   identifier they cannot supply. Reword; do not cite.
7. **The superlative regex is narrower than the rule and three files proved it.** Its comparison-class
   list omits "the United States", "America" and "the world"; `one of the (most|best|finest|largest|
   oldest|greatest)` omits "grandest"; and `one of San Francisco's most…` matches nothing at all.
   **The ban is on the practice, not on what the regex catches.** Several true, sourced, checked
   rankings in these files would ship. They still do not publish.

### 8.2 Superlatives that survived a verifier — corrected here

- **"California Historical Landmark No. 236 … clears the gate."** Fisherman's Wharf's verifier wrote
  this and it is wrong (§6a, §9).
- **"one of the grandest civic complexes in the United States"** and TIME's **"the most attractive and
  practical building of its kind in the U.S."** — both on `sfwarmemorial.org`, both missed by the
  Hayes Valley finder, both caught by its verifier. An attributed superlative is still a superlative.
- **"one of four Rivera frescoes in the Bay Area"** — passed through unflagged by the Russian Hill
  finder. "In the Bay Area" is the comparison class.
- **"one of only three octagon houses in the city"** → write **"one of three octagon houses in San
  Francisco."** Strip "only".
- **"the oldest surviving house in the district is 982 Green Street"** → write **"982 Green Street was
  built in 1878."**
- **"one of the newest Article 10 landmarks in the city"** (Church for the Fellowship of All Peoples) —
  a superlative *and* false; the register contains LM 321, designated 2025.
- **Rec & Park's footer boilerplate, on every single facility page**: *"In 2017, San Francisco became
  the first city where every resident lives within a 10-minute walk of a park."* A ranking **and** a
  proximity claim. Nine zones quote Rec & Park pages; every one of their authors will lift this by
  accident. **Do not.**
- **Rec & Park's page copy**: "one of San Francisco's most significant historic, cultural, and civic
  spaces" (Portsmouth Square) · "serves one of San Francisco's densest and most culturally celebrated
  neighborhoods" (Willie Wong) · "some of the best views in San Francisco" and "the most challenging
  section" and "the only host plant for the callippe silverspot butterfly" (Corona Heights) · "the
  neighborhood's most famous (and noisiest) residents" (Coit Tower) · "some of the city's most
  spectacular vistas" (Alice Marble) · "the largest public park to open in the city's urban core since
  1983" (Francisco Park) · "one of the city's most prominent political leaders" (Bill Kraus).
- **Operators**: Moscone "San Francisco's Premier Convention Center" · Hotel Drisco "#1 Hotel in San
  Francisco" · Scoma's five separate rankings and awards · the Argonaut's "award-winning", "AAA Four
  Diamond" and "the only AAA 4 diamond hotel in Fisherman's Wharf" · Stanford Court "Ranked Top 10 San
  Francisco Hotel" and its TripAdvisor certificate · the Fairmont's "best panoramic views in the City"
  · Top of the Mark's "San Francisco's favorite penthouse cocktail lounge" · SPQR's Michelin, Food &
  Wine and James Beard claims · Frances's Michelin · the Stanyan Park Hotel's **four** award claims,
  not one · the Russian Hill Bookstore's "one of the few independently-owned…" · the SkyStar Wheel's
  "the city's only observation wheel" · the Musée's "one of the world's largest privately owned
  collections" · SFJAZZ's "the first stand-alone structure in the country built specifically for jazz"
  · Vesuvio's "world-renowned San Francisco saloon" · Condor's "San Francisco's Original Topless
  Club" · Caffe Trieste's "the first Espresso coffee house on the West Coast" and "the finest in
  Italian Style coffee" · Ghirardelli's "A BAYSIDE LANDMARK SINCE 1862" (a superlative *and* a bare
  designation claim *and* a trading duration, all in six words).
- **Sources**: Mission Dolores parish's "the oldest original intact Mission in California" and "the
  oldest building in San Francisco" · Wikipedia's "It is the oldest intact structure in San Francisco",
  which sits **immediately after** the 1791 sentence an author is meant to lift · the Roxie's "one of
  the oldest continuously operated cinemas in the United States" · Foreign Cinema's "one of the most
  romantic and beautiful restaurants in San Francisco" · Ghirardelli Square's "the first major adaptive
  re-use project in the United States" · the *Eureka*'s "the last intact wooden-hulled side-wheel
  steamer afloat in the continental United States" · the *Eppleton Hall*'s "the only intact example of
  a Tyne-built paddle tug" · the Great Star's "the last Chinese theater in any Chinatown in the United
  States" · Tin How's "the oldest extant Taoist temple" · Ross Alley's "the oldest alley in San
  Francisco" · the Chinese Hospital's "the only Chinese hospital in the United States" · Twin Peaks
  Tavern's "the first gay bar in the city … with plate glass windows" · the GLBT Museum's "the first
  full-scale, stand-alone museum of LGBT history in the United States" · Pink Triangle Park's "the
  first LGBTQ+ Holocaust memorial in the United States" · Buena Vista Park's "the oldest official park
  in San Francisco" · the Free Clinic's "the first of more than 600" · the Alvord Lake Bridge's "the
  first reinforced concrete bridge built in America" · SF Planning's "The San Francisco Cable Car
  Historic District are the only ones still operating in a United States City" · SF Heritage's "one of
  the most expensive and wealthiest neighborhoods in San Francisco" · Grace Cathedral's "the third
  largest Episcopal Cathedral in the nation" and its "Modern Labyrinth Movement" primacy claims · the
  Flood Mansion's "the only remaining pre-earthquake structures on Nob Hill" · Ping Yuen's "the largest
  murals in Chinatown" · the Palace of Fine Arts' "the only structure from the exposition that
  survives on site" and "one of San Francisco's most recognizable landmarks" · the Port of
  Embarkation's "the principal Pacific shipping hub" · the Festival Pavilion's "Fort Mason Center's
  largest rental venue".

**Safe substitutes that carry the same information and publish**: "the sixth of the twenty-one Alta
California missions" · "the adobe chapel was completed in 1791" · "grave markers date between 1830 and
1898" · Clarion Alley's "560 ft long and 15 ft. wide" · the Stockton Street Tunnel's 18 percent, 12
percent and 4.29 percent grades · Fillmore's 24.54 percent counterbalance grade · the Vallejo Street
Crest's 16, 23 and 40 percent grades · Lombard's 27 percent grade and 600 feet · Grace Cathedral's 329
feet by 162 feet, its 91-foot nave vaulting, its 9°15′ bearing south of due west and its 299.5-foot
sanctuary floor · Sherith Israel's 140 feet above California Street, 60-foot dome, 20,000 square feet,
3,500 organ pipes and 1,385 seats · every Rec & Park acreage · every seat count · every dated opening.

### 8.3 Trading duration and founding years — the line, ruled once for all twelve zones

**A dated event in a *structure's* history publishes. A founding year or a duration for an
*organisation or a business*, taken from that body's own site, does not.** Hayes Valley's verifier drew
this line and asked the arbitrator to restate it. Restated and binding.

"The War Memorial Opera House opened on 15 October 1932" publishes. "The SFJAZZ Center opened in
January 2013" publishes. "SFJAZZ was founded in 1983" does not. "Serving San Francisco since 1932"
does not.

A third-party source rescues the fact, but **only if the author names and fetches the article**. SoMa's
finder argued four Wikipedia founding years escape the rule without citing an article for any of them;
its verifier refused all four and I uphold the refusal. Fort Mason Center's 1976 is the model of what
does work: Wikipedia is not the operator, the sentence is written as "Wikipedia records that…", and the
1977 on `fortmason.org` stays out.

**Dropped, every one confirmed present at source:** SF Eagle "Opened 1981 … Forty years of pride" ·
Greens "Celebrating Vegetables Since 1979" · Magic Theatre 1967 · Lucca "since 1929" · MoAD 2005 ·
American Bookbinders · 21st Amendment · Cliff's Variety "Since our founding in 1936" (its Chronicle-
sourced 1971 **occupancy** publishes, written as a date and never as a duration) · Midnight Sun's 1981
move · 826 Valencia's 2002 and its founders · The Marsh's 1989 · Brava's "40 Years" and "100 Years of
the Historic Theater" · Creativity Explored's "over 40 years" · Precita Eyes' "Since 1977" and "45th
Anniversary Gala" · the Roxie's "over one hundred years" · Calle 24's 1999 · Cameron House's "Founded
in 1874" · Buddha's Universal Church's "Since 1966" · the Great Star's "A Century of Cultural Heritage
(1925–2025)" — its 1925 survives **only** because SF Planning's parcel record independently gives
`yearbuilt = 1925`, which is a claim about the building · the Golden Gate Fortune Cookie Factory's
"Handmade In San Francisco Since 1962" · R&G Lounge's "serving our patrons since 1985" · Sam Wo's 1912
as a founding year (1912 survives only as the Clay Street building's construction year) · Vesuvio's
1948 and "first established in 1948" · Comstock's 1907 · Condor's 1964 · Caffe Trieste's "Over 50
years" and "Celebrating 65 Years" · the Beat Museum's "the space we've occupied for 20 years" · the
Russian Hill Bookstore's "established in 1974" and "50+ years" · Magnolia's "a cornerstone of Haight
and Masonic for over 20 years" · Top of the Mark's "Since 1939" and "For 86 years" · the Tonga Room's
"A San Francisco institution since 1945" · Sherith Israel's 1851 · the Dolphin Club's 1877 · Scoma's
"Founded in 1965", "three generations" and "For more than 60 years" · Pompei's Grotto's "opened on
February 1, 1946" · the Church for the Fellowship's 1944 **from the church's own site** — cite the
Wikipedia article instead, and drop "legendary" · Cameron House's, Fort Mason's and Fort Mason
Center's operator years.

**A `location_start_date` in the business register is a registration date.** It must not be written, in
any form, as a founding date or a trading duration. This binds all twenty-five Haight Street shops.

### 8.4 Proximity, orientation and research-method leaks that survived a verifier

Banned and confirmed present: Nob Hill Cafe's "only a block from Grace Cathedral" and "just down the
street" · Stanford Court's "steps from" · the Argonaut's "mere steps to next door Ghirardelli Square" ·
the War Memorial's "within walking distance" · SFJAZZ's "in the heart of San Francisco's cultural
corridor" and "easily accessible from Muni Metro" · Proxy's "in the heart of" · City Arts' "in the
heart of San Francisco's performing arts district" · Fay Park's "Just a block from Lombard Street's
famous crooked block" and "hidden gem" · SFPL's "around the corner on Valencia Street" · the Robert
Louis Stevenson article's "just around the corner" · Michelangelo Playground's "tucked away between
the North Beach and Russian Hill neighborhoods" · Washington & Hyde's "nestled in a tranquil setting"
and "an escape from downtown's busy atmosphere" · Hyde & Vallejo's **entire description**, which is
another park's copy, in another neighbourhood, with a contradicting acreage · Hamlin School's "near
Pacific Heights" · Precita Eyes' "1.5 hours" · the GLBT Museum's 35-minute audioguide, which was never
re-verified.

**Permitted and encouraged:** the side of a named street · a block between two named cross streets ·
two structures that physically adjoin where a source states it (the basilica and the adobe chapel; the
Randall Museum inside Corona Heights Park; Hang Ah Alley wholly inside Willie Wong Playground; the
Sydney Goldstein Theater on parcel 0815001 with the High School of Commerce; the Alice Marble Courts
over the Lombard Reservoir; Eastern Bakery's Commercial Street side entrance at Sullivan's Grotto,
776 Commercial) · a sourced measurement (SF Heritage's "approximately 15 blocks (0.8 miles)").

**The sanctioned form for a silent source is always about the world, never about the page:**
> No source states its opening hours, so none are given here.

Not "no hours are named on this page". The test is the subject of the sentence.

### 8.5 Live-status facts an author must not write past

Portsmouth Square closed for renovation through mid-2028 · Hyde Street Pier closed and the five NPS
ships berthed at the Mare Island Coal Sheds, Vallejo, while it is rebuilt — **use the single sanctioned
sentence in the Fisherman's Wharf verdicts §2, and do not put it on *Pampanito*, which is not an NPS
vessel** · the Contemporary Jewish Museum temporarily closed with no sourced date, written as a
building with a designation and no hours · the Museum of the African Diaspora reopening 30 September
2026 · the Mission Branch Library closed for renovation with service at 1234 Valencia Street · the Beat
Museum vacated for a seismic retrofit with no announced reopening · the Clay Theatre closed since
January 2020 with a June 2025 reopening plan · Municipal Pier closed since 2022 · the Old Mint not open
as a museum · the Christopher Columbus statue removed in 2020 and **not to be written as present** ·
Galería de la Raza no longer at 24th and Bryant.

---

## 9. WHERE I AM STRICTER THAN A VERIFIER — read this twice

In every previous programme the Criticals were authors following the looser document. These are the
looser documents. **Where a verdicts file says one thing and this section says another, this section
governs.**

1. **Fisherman's Wharf §1d is wrong about the gate.** It writes: *"California Historical Landmark:
   'Entrance of the San Carlos into San Francisco Bay', designated 1936, Reference no. 236. Register
   named, identifier present — **it clears the gate**."* **It does not.** `@designation_citation`
   recognises only an SF Landmark number, `Article 10`, `National Register` / `NRHP` / `NR reference`,
   or `reference number` + six or more digits. "California Historical Landmark No. 236" matches none of
   them, and "designated" fires the claim regex. **The sentence as that file supplies it is a build
   failure.** CHL 236 publishes only in the same field as NRHP 84001183. The cleared form is at §6a.

2. **The same file's standalone NHL sentences fail for the same reason.** "designated a National
   Historic Landmark" is a bare claim. Every NHL in the wave — Aquatic Park, the Old Mint, the James R.
   Browning Building, the Flood Mansion, the cable cars, the Port of Embarkation, the Swedenborgian
   Church, the Civic Center district — must carry its NRHP reference number **in the same field**.

3. **SoMa's twenty-two visitor hotels do not ship "pending". They DROP.** Its verifier ruled them
   REWRITE-to-pending; none has a verified address or rate from its own site, and "pending" is not a
   state a seed file has. Zero hotels ship from SoMa in wave 1.

4. **Nob Hill's nomination-sourced attributions DROP.** Its verifier ruled the Fairmont's National
   Register nomination "publishable, but attribute it in-sentence", while stating in the same paragraph
   that it **could not re-fetch the nomination text** — npgallery served a 1,965-byte placeholder and
   the NARA API returned non-JSON. A verifier that could not open a source has not verified it.
   **Augustus Laver, Willis Polk's 1909 conversion, the Reid Brothers, Julia Morgan, the 1907–1945
   period of significance, the lobby-level room list and the Plunge-to-Tonga-Room fact all DROP**
   unless the author opens the nomination itself. The 1911 parcel date for the Flood Mansion and the
   1926 parcel date for the Mark Hopkins survive; they came from a dataset that answered.

5. **Pacific Heights' Calvary Presbyterian chronology DROPS unless re-read.** Its verifier wrote "I did
   not re-read line by line — the author must, before writing it", and then left it in the PUBLISH
   column. Unverified material does not ship on a verifier's promise that somebody else will check it.
   The two designation identifiers stand; the founding date, the three addresses, the 1906 sheltering
   and the "one million bricks" do not, until read.

6. **Mission Dolores, the Basilica and the Cemetery ship as ONE place.** The Mission's verifier
   *recommended* it; I make it binding. The parish publishes one set of hours for the Old Mission, gift
   shop, museum, cemetery and Basilica together, and three records would assert three sets of hours
   that do not exist.

7. **No zone states a count of its landmarks in prose.** North Beach's verifier ruled this for one
   file. It binds all twelve. Every count in the wave is wrong in at least one direction.

8. **Chinatown re-fetches the CHSA hours; it does not inherit them.** Nob Hill's verifier could not
   reach `chsa.org` (403). Chinatown's verifier reached it through WebFetch and got "Wed & Sat
   10am–5pm". The author uses the operator's, fetched fresh, and never OSM's `We-Su 11:00-16:00`.

9. **Where two files disagree on a fetch, the one that got a response wins, and the failure is not
   recorded as a fact about the world.** Four finders reported sources dead that were alive:
   `sspeterpaulsf.org` and `salesiansspp.org` (Saints Peter and Paul, fully sourced — the finder called
   it "the highest-risk entry in the file" after a failed hostname guess) · `sfblues.net` → the Saloon ·
   `matsuusa.org` and `hangahtearoom.com` · SFPL's Marina and Chinatown hours, both in the HTML ·
   `315 LINDEN ST` and `432 OCTAVIA ST` in the EAS · Rec & Park's `1 Marina Green Dr` · Civic Art
   accession 2002.9's full title. Each cost a publishable fact, and each was a claim about the research
   rather than about the world.

10. **Three claims sourced to pages that do not carry them DROP**, and I name them because they were
    presented with URLs: Proxy "built on former freeway parcels" · Patricia's Green "where the Central
    Freeway ramp stood" · the Port of Embarkation's "established 6 May 1932" and its "1.6 million
    passengers and 23 million tons of cargo". Also the Musée Mécanique's "the National Park Service
    moved it to Fisherman's Wharf in 2002", the bathhouse's "has housed the maritime museum since
    1951", Lombard Street's visitor counts (their SFCTA source 404s), Francisco Park's 900,000-gallon
    catchment figure and its reservoir-wall paving, the Haas-Lilienthal House's 11,500 square feet, and
    Fort Mason's "three of the Black Point houses" where NPS names two.

11. **Two dates a verifier accepted that I will not.** The San Francisco Art Institute's NRHP listing
    year — NPS prints no listing date for 15000950 and the only date source is an unopened weekly-list
    PDF. **Write the reference number and no year.** And Russian Hill's cable-car "NHL designated 29
    January 1964" — killed (§2).

12. **The Strand Theatre redirect trap, restated because it is the most citable-looking error in the
    wave.** `Strand Theatre (San Francisco)` **redirects to `American Conservatory Theater`**, whose
    infobox describes the **Geary Theater at 415 Geary Street** — San Francisco Landmark No. 82, NRHP
    27 May 1975, Bliss & Faville, 1910, **in the Tenderloin**. The Strand at 1127 Market Street is a
    different building that A.C.T. also operates, and it carries `landmarkno = 0`. Attaching LM 82 or
    Bliss & Faville to 1127 Market would be a fabricated citation that passes the gate.

---

## 10. WHAT WAVE 2 INHERITS

Six rulings that bind later waves, so no wave-2 arbitrator re-opens them:

1. **Lyon Street is the Marina/Presidio line, and Fort Mason is inside it** (§3c). The Presidio page
   restates neither Fort Mason nor the Palace of Fine Arts, and must be told that Rec & Park property
   111 crosses the line.
2. **The Yerba Buena cluster is SoMa's** (§3a). The Financial District page does not restate SFMOMA,
   Yerba Buena Gardens, the CJM, MoAD, YBCA, Moscone, the Children's Creativity Museum or St Patrick's.
3. **The Jackson Square cluster, the Embarcadero and Rincon Hill are the Financial District's**, entire,
   with the identifiers listed at §4a. No wave-1 file touches them.
4. **Both Liberty districts are Noe Valley's** (§4e), on the roster's own draw, against the city's
   address layer.
5. **Mission Bay's page links to `guide:oracle-park-guide` and does not restate the seven code-seed
   places.** It may take the Third Street Bridge (LM 194) and the Garcia and Maggini Warehouse
   (LM 229), neither of which is a code-seed slug.
6. **The roster gaps are real and cost the corpus five Article 10 numbers and two National Historic
   Landmark records** (§4g). Civic Center, the Tenderloin, Lower Nob Hill, Polk Gulch, Manilatown,
   South Beach, Rincon Hill and Presidio Heights are in no wave. City Hall (LM 21), the Civic Center
   NHL district (NRHP 78000757), the Gaylord Hotel (LM 159) and the Islam Temple (LM 195) have nowhere
   to go. **This should be fixed in the roster, not solved by a neighbouring page annexing them.**
