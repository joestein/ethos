# Russian Hill, San Francisco — VERIFIER verdicts

Adjudicating `docs/san-francisco/russian-hill-finder.md`. Ruling date 2026-09-03.
I did not gather the finder's evidence and I owe it no loyalty. Every ruling below is mine.

---

## 0. What I re-fetched

| Source | Result |
|---|---|
| DataSF Article 10 landmarks `97yj-54sx` | 200, **370 rows**. All 12 claimed landmark numbers pulled and compared field by field |
| DataSF Article 10 districts `knm6-5ej6` | 200, **20 rows**. Enumerated all 20 |
| DataSF EAS address points `ramy-di5m` | 200. **38 addresses re-queried individually** |
| DataSF Rec & Park properties `gtr9-ntp6` | 200, **255 rows**. Acreage, ownership, `analysis_neighborhood`, `mons_neighborhood` pulled per park |
| NPS NPGallery `AssetDetail/NRIS/<ref>` | 200 for 9 of the 11 claimed NRHP numbers |
| CA OHP `ListedResources/Detail/N1542`, `N1543`, `N1549` | 200, all three |
| SF Rec & Park facility pages (9) | 200 each |
| Wikipedia: Lombard Street, Macondray Lane, both districts, Alhambra, SFAI, Broadway Tunnel | 200 each |
| noehill `nat1987002289` | 200 |
| Operator sites: cheeseplus, frascatisf, zapizzasf, realfoodco, russianhillbookstore, fellowshipsf, franciscopark, thebuenavista, bobsdonutssf | 200 each |
| SFMTA stop 5078 | 200 |
| **SFCTA Lombard report PDF** | **HTTP 404 — the finder cited a dead URL** |
| SF Parks Alliance George Sterling Park | HTTP 403, as the finder said |

**The finder's zoning instrumentation is sound.** I re-queried all 38 EAS addresses independently and
**every single `nhood` value the finder reported came back identical**, including the counter-intuitive
ones (1067 Green = Nob Hill; 1621 Polk = Nob Hill; 900 North Point = Russian Hill; 1772 Vallejo =
Marina). The boundary problem in §2 of the finder report is real and is not an artefact.

---

## 1. DESIGNATION NUMBERS — re-fetched one at a time

### Article 10 — **12 of 12 survive**, names, addresses and years all matching `97yj-54sx`

| No. | Register `name` | Register `address` | `yeardesignated` | Verdict |
|---|---|---|---|---|
| 30 | Ghirardelli Square | 900 North Point Street | 1970 | number correct |
| 36 | Feusier Octagon House/Kenny Residence | 1067 Green Street | 1970 | number correct |
| 46 | House Of The Flag; Old Sheppard-Dakin Hs | 1652-1656 Taylor Street | 1972 | number correct |
| 59 | Haslett Warehouse Building | 680 Beach Street | 1974 | number correct |
| 85 | S.F. Art Institute | 800 Chestnut Street | 1977 | number correct |
| 97 | Atkinson-Escher House | 1032 Broadway Street | 1977 | number correct |
| 188 | Engine Co. #8, Truck Co. #4 | 1648 Pacific Avenue | 1988 | number correct |
| 217 | Alhambra Theater | 2320-2336 Polk Street | 1996 | number correct |
| 220 | Engine Company Number 31 Fire House | 1088 Green Street | 1998 | number correct |
| 232 | Filbert Street Cottages | 1338 Filbert Street | 2003 | number correct |
| 294 | The Making of a Fresco Showing the Building of a City | 800 Chestnut Street | 2021 | number correct |
| 309 | Church for the Fellowship of All People | 2041 Larkin Street | 2023 | number correct |

**All twelve PUBLISH.** Every citation must carry the year only, never a day-and-month — the register
column is a year and the day-level dates the finder found in Wikipedia and the printed landmark list
disagree with each other for LM 36, LM 46 and LM 217.

**Register-name correction, mandatory:** the register spells LM 309 **"Church for the Fellowship of All
People"** (singular). The congregation styles itself "All Peoples". When citing the landmark, the
register's spelling. When naming the place, the congregation's.

**Negative finding CONFIRMED.** I enumerated all 20 rows of `knm6-5ej6`: Alamo Square, Northeast
Waterfront, Telegraph Hill, Jackson Square, Clyde and Crooks, Liberty Hill, Blackstone Court, Bush
Street–Cottage Row, Civic Center, Dogpatch, South End, Webster St, Market Street Masonry, Duboce Park.
**No Russian Hill district.** "Designated under Article 10" must not be written of any of the three
Russian Hill districts. The finder was right and this matters.

### NRHP — **10 of 11 survive as identifiers, 1 fails**

| Ref. | NPS returned | Verdict |
|---|---|---|
| 87002286 | Russian Hill--Macondray Lane District, listed 1/7/1988, roughly 900–982 Green, 1918–1960 Jones, 15–84 Macondray & 1801–1809 Taylor | **PUBLISH** |
| 87002288 | Russian Hill--Paris Block Architectural District, listed 1/7/1988, roughly 1017–1067 Green St. | **PUBLISH** |
| 87002289 | Russian Hill--Vallejo Street Crest District, listed 1/22/1988, address range exactly as the finder gave it | **PUBLISH** |
| 87002290 | Engine House No. 31, listed 1/7/1988, 1088 Green Street | **PUBLISH** |
| 74000554 | Feusier Octagon House, listed 3/24/1974, 1067 Green St. | **PUBLISH** |
| 15000950 | San Francisco Art Institute, San Francisco CA; architects Bakewell and Brown, Keatinge-Clay | **PUBLISH the number and the register; the NPS record does not print a listing date.** See §2.5 |
| 82002249 | Pioneer Woolen Mills and D. Ghirardelli Company, listed 4/29/1982, 900 N. Point Street | number correct — but not Russian Hill's, §4 |
| 75000172 | Haslett Warehouse, listed 3/28/1975, 680 Beach St. | number correct — but not Russian Hill's, §4 |
| 14000967 | Burr House, San Francisco; Edmund M. Wharf, Italianate/Second Empire | number correct — but not Russian Hill's, §4 |
| 66000233 | **San Francisco Cable Cars, listed 10/15/1966, "1390 Washington St."** | **the number survives; the finder's attached facts do not.** See below |
| **11000944** | Name "Sinton House" matched, but the record returned **location "Washington, District of Columbia"**, no listing date, and no tie to 1020 Francisco Street | **DROP.** See §3.6 |

CA OHP corroboration re-fetched and confirmed: **N1542** = Russian Hill--Macondray Lane District,
registered 1/7/1988; **N1543** = Russian Hill--Paris Block Architectural District, 1/7/1988;
**N1549** = Russian Hill--Vallejo Street Crest District, 1/22/1988. All three PUBLISH as corroboration.

**66000233 — the finder overreached.** It wrote "National Historic Landmark, designated 29 January
1964". The NPS record I pulled says **listed 10/15/1966** and **does not state NHL status**. The claim
"National Historic Landmark, designated 29 January 1964" **DROPS**. The reference number 66000233 with
the register named survives. The record's own address, **1390 Washington Street**, is the Cable Car
Museum — which the roster assigns to Nob Hill. See §4.

**Designation identifiers surviving: 22 of 23** (12 Article 10 + 10 NRHP), plus the three OHP
identifiers as corroboration. One NRHP number (11000944) fails for want of a verifiable address link.

---

## 2. MARQUEE TIER — rulings

### 2.1 Lombard Street crooked block — **PUBLISH as `attraction`**

Zone clean: 949 and 1000 Lombard both re-returned `nhood = Russian Hill`.

| Claim | Verdict |
|---|---|
| Eight hairpin turns; one-way downhill; between Hyde and Leavenworth; red brick | **PUBLISH** — re-fetched, all four on Wikipedia |
| Built 1922; switchback design suggested by property owner Carl Henry; the hill's 27 percent grade | **PUBLISH** — a date, a name and a measurement |
| About 600 ft long, 412.5 ft in straight line | **PUBLISH** — a measurement |
| "the sign at the top **posts** 5 mph" | **REWRITE** → **"A sign at the top of the block recommends 5 miles per hour."** The source says *recommends*, which is a different legal fact from *posts*. |
| Average daily traffic 2,630 in 2013 | **PUBLISH**, and the year must stay attached: **"Average daily traffic on the block was 2,630 vehicles in 2013."** |
| ~250 vehicles per hour | **PUBLISH** as **"The block normally carries around 250 vehicles an hour."** |
| **~2 million visitors a year, up to 17,000 per day on busy summer weekends, as of 2015** | **DROP.** The finder's primary source for these — the SFCTA *Lombard Study* PDF at `sfcta.org/sites/default/files/content/Programming/NTIP/Lombard/Lombard_final_report_021517.pdf` — **returns HTTP 404**. I could not fetch it. An eleven-year-old visitor estimate that survives only as a secondhand restatement of an unfetchable report is exactly the claim the programme drops. |
| **SFCTA report as a cited source** | **DROP the URL.** 404. Cite Wikipedia's Lombard Street article for the figures that survive. |
| "the crookedest street in the world"; "one of the most visited" | **DROP** — the finder already forbade both and it was right. Not to appear quoted, attributed or hedged. |
| Powell–Hyde cable car stops at the top of the block on Hyde Street, SFMTA stop 5078 | **REWRITE.** The stop re-fetched as **"Hyde St & Lombard St (#15078)"**, served by the Powell/Hyde cable car, service 7 a.m. to 11 p.m. daily. Use: **"The Powell–Hyde cable car stops at Hyde and Lombard Streets, at the top of the block."** Do not print the bare number 5078; the page prints 15078. |

### 2.2 Macondray Lane — **PUBLISH as `attraction`**

Zone clean: 15 Macondray Ln and 982 Green St both re-returned Russian Hill.

| Claim | Verdict |
|---|---|
| Runs two blocks east–west between Leavenworth and Taylor Streets, parallel to Union and Green | **PUBLISH** |
| Wooden steps descend to Taylor Street | **REWRITE** → **"A set of wooden steps descends from the lane to Taylor Street."** Wikipedia calls this the *western* terminus, which is geographically incoherent for Taylor Street. Drop the compass word and the sentence is true either way. |
| Views north to Alcatraz Island and San Francisco Bay | **PUBLISH** |
| Contributing site of NRHP district 87002286, listed 7 January 1988 | **PUBLISH** — re-fetched, verbatim match |
| 1.6 acres; 12 contributing buildings and one contributing site | **PUBLISH** — counts and a measurement, both confirmed |
| District covers roughly 900–982 Green, 1918–1960 Jones, 15–84 Macondray, 1801–1809 Taylor | **PUBLISH** — matches the NPS location string word for word |
| Only four houses in the district survived the 1906 earthquake and fire | **PUBLISH** — a count |
| "the **oldest surviving** house is 982 Green Street, built 1878" | **REWRITE.** "Oldest in the district" is a ranking against a named comparison class. Use: **"982 Green Street was built in 1878."** |
| Armistead Maupin confirmed Macondray Lane as the model for Barbary Lane in the 2017 documentary *The Untold Tales of Armistead Maupin* | **PUBLISH** — attribution to a named person in a named work, not a superlative and not a trading claim |

### 2.3 Russian Hill–Vallejo Street Crest District — **PUBLISH as `historic-site`, ZONE ESCALATED**

| Claim | Verdict |
|---|---|
| NRHP 87002289, listed 22 January 1988; CA OHP N1549 | **PUBLISH** — both re-fetched and exact |
| Address range 1020–1032 Broadway, 1–49 Florence, 1728–1742 Jones, 1–7 Russian Hill Pl., 1629–1715 Taylor, 1000–1085 Vallejo | **PUBLISH** — matches NPS verbatim |
| **Acreage — "4 acres" (Wikipedia) vs "forty-acre" (noehill)** | **DROP both.** I re-fetched both. The disagreement is a factor of ten and neither is the nomination itself. A ten-fold conflict does not publish in either direction. Write no acreage. |
| **27 vs 26 contributing buildings** | **REWRITE.** noehill returned "twenty-six contributing buildings, two contributing sites and five contributing structures"; Wikipedia returned 27/2/5. The two sites and five structures agree; the buildings do not. Use: **"The listing included two contributing sites and five contributing structures."** Drop the building count. |
| Grades of 16 percent, 23 percent and 40 percent, managed by retaining walls, ramps and walkways | **PUBLISH** — I re-fetched noehill and the three figures are there, reading off the nomination. Measurements publish. |
| Architects Willis Polk, Charles F. Whittlesey, Julia Morgan, Albert Farr, Charles W. McCall, and the amateur architect Joseph Worcester | **PUBLISH** — both sources agree. noehill adds Myron Hunt and Anshen & Allen; the author may add them or not. |
| Residents named in the nomination | **PUBLISH** — a list of names, no ranking |
| "the enclave escaped the 1906 fire" | **PUBLISH** |
| **ZONE** | **ESCALATE.** 1 Russian Hill Place, 1 Florence St and 1032 Broadway all re-returned `nhood = Nob Hill`; the register names the district "Russian Hill". Arbitrator. |

### 2.4 Russian Hill–Paris Block Architectural District — **PUBLISH as `historic-site`, ZONE ESCALATED**

NRHP 87002288, listed 7 January 1988, "Roughly 1017--1067 Green St." — re-fetched, exact. CA OHP N1543
re-fetched, exact. 1.5 acres, eleven dwellings in eleven styles, front-yard setbacks, north-side houses
backing onto Macondray Lane: **PUBLISH**. The "Paris Block" name first in print no earlier than 1964
and the nomination's speculation about the Bos Apartments at 1050 Green by Lewis P. Hobart, 1891:
**PUBLISH, but only as speculation attributed to the nomination** — write "the nomination suggests",
never "the name refers to".

**ZONE: ESCALATE.** Re-confirmed: 1050 Green = Russian Hill, 1067 Green = Nob Hill. The district
straddles the official line inside one block.

### 2.5 San Francisco Art Institute, 800 Chestnut Street — **PUBLISH as `historic-site`**

Zone clean: 800 Chestnut re-returned Russian Hill.

| Claim | Verdict |
|---|---|
| San Francisco Landmark No. 85, designated 1977 | **PUBLISH** — register match |
| Listed on the NRHP, reference number 15000950 | **PUBLISH the number.** **REWRITE the date.** The NPS record does not print a listing date and the finder's only date source is a weekly-list PDF I did not open. Use: **"San Francisco Landmark No. 85, designated in 1977, and listed on the National Register of Historic Places under reference number 15000950."** No listing year unless the author fetches the weekly list itself. |
| Spanish Colonial Revival buildings, 1926, by Bakewell & Brown | **PUBLISH** — NPS independently names "Bakewell and Brown" as architects; Wikipedia gives the 1926 move. Note NPS records a significant year of 1927; write 1926 as the year the school moved to 800 Chestnut, not as a completion date. |
| Addition by Paffard Keatinge-Clay; 22,500 sq ft of studio space, a theater/lecture hall, an outdoor amphitheatre formed by the lecture hall's stepped roof, galleries and a cafe | **PUBLISH the architect and the contents** — NPS independently names Keatinge-Clay. **DROP the year.** Wikipedia says 1969, noehill says 1963, and the finder flagged the conflict itself. Write "a later addition by Paffard Keatinge-Clay". |
| Founded 1871 as the San Francisco Art Association; California School of Fine Arts 1916; San Francisco Art Institute 1961 | **PUBLISH** — a sequence of dated renamings from a third-party source, not a trading-duration claim from an operator. Wikipedia's fuller chain (California School of Design 1874, Mark Hopkins Institute of Art 1893, San Francisco Institute of Art 1906) is available if the author wants it. |
| Closed 2022; Chapter 7 filing April 2023; late-February 2024 purchase by a nonprofit backed by Laurene Powell Jobs for about $30 million | **PUBLISH** — re-fetched. Wikipedia gives the closure as July 2022 and the filing as 26 April 2023; use those. |
| "No source states current public opening hours" | **REWRITE.** As written it is a sentence about the research, not the place. Use: **"No source states opening hours for the campus, so none are given."** That is about the fact. Never "no hours are named on this page". |

### 2.6 *The Making of a Fresco Showing the Building of a City* — **REWRITE: fold into 2.5, do not ship as a place**

The finder recommended this itself and it is right. The schema has thirteen kinds and none of them is an
artwork; `historic-site` for a mural inside a building whose own `historic-site` record already exists
would put 800 Chestnut Street in the corpus twice. Fold it in. The material that survives inside the
SFAI entry:

- **PUBLISH:** "San Francisco Landmark No. 294, designated in 2021" — verified against the register,
  including the full work title as the register spells it. A landmark designation of a fresco rather
  than a building is unusual and is worth the sentence.
- **PUBLISH:** painted 1931; transferred with the campus in the 2024 sale; the Diego Rivera Gallery
  that housed it closed when the school closed in 2022.
- **PUBLISH:** the January 2021 proposal to sell it to the Lucas Museum of Narrative Art, dropped after
  objections.
- **DROP:** "one of four Rivera frescoes in the Bay Area" — the finder passed this through unflagged and
  should not have. "One of four **in the Bay Area**" names its comparison class. It is a ranking.
- **PHOTO:** correct and upheld. A mural is not an architectural work; 17 USC 120(a) does not reach it;
  Rivera died 1957. Write about it, never photograph it. `"photos": []` regardless, this wave.

### 2.7 Francisco Park — **PUBLISH as `park`**

Zone unanimous: 2745 Larkin re-returned Russian Hill on EAS, `analysis_neighborhood` and
`mons_neighborhood` alike.

| Claim | Verdict |
|---|---|
| 801 Bay Street (facility page) / 2745 Larkin Street (properties dataset) | **PUBLISH 801 Bay Street** as the address; both re-fetched. |
| Bordered by Francisco, Larkin, Bay and Hyde streets | **PUBLISH** — named streets, not orientation by impression |
| **4.5 acres vs 4.89328892 acres** | **REWRITE.** I pulled both: the facility page says 4.5 acres, the dataset says 4.89. Use the operator's figure: **"4.5 acres."** One number, cited to Rec & Park. |
| Opened April 2022; hours 5 a.m. to midnight | **PUBLISH** — both re-fetched verbatim |
| Francisco Reservoir constructed 1859, shut down 1940 after the Lombard Reservoir opened a block away, fenced off since | **PUBLISH** — all re-fetched on the Rec & Park page |
| $9.9 million land purchase; $27.5 million raised by the Francisco Park Conservancy | **REWRITE.** Both figures are on the Rec & Park page. **The year "2014" is not**, and franciscopark.org does not carry it either — I fetched the site and it has none of the finder's detail. Write the sums without the year: **"Recreation and Parks bought the land for $9.9 million, and the Francisco Park Conservancy raised $27.5 million to build the park."** |
| **Rainwater catchment "saves nearly 900,000 gallons a year"** | **DROP.** Not on the Rec & Park page and not on franciscopark.org, which I fetched. The catchment system itself **PUBLISHES** — Rec & Park lists "a sustainable rainwater catchment system" among the features. The gallonage does not. |
| **Section of historic reservoir wall and brick floor near the Hyde Street entrance; reservoir outline marked in the pathway paving** | **DROP.** Neither source carries it. I fetched franciscopark.org expressly for this and it is not there. |
| **Maria Manetti Shrem Community Garden; Bev & Greg James and Larsen/Lam picnic areas; 5 tables / 3 tables; reservable 9 a.m.–1 p.m. or 2 p.m.–6 p.m.** | **DROP, all of it.** Unsourced against either page I could fetch. A **community garden**, a **children's playground and nature exploration area**, a **fenced dog run**, **ADA-accessible pathways**, and **native plants and trees** all survive — those are on the Rec & Park page verbatim. |
| Views from the terraces to the Golden Gate Bridge, Ghirardelli Square, Alcatraz and the Palace of Fine Arts | **PUBLISH** — on the Rec & Park page; named landmarks, not impressions |
| "the largest public park to open in the city's urban core since 1983" | **DROP.** The finder flagged it and I uphold the flag. Comparison class "the city's urban core", time bound "since 1983". Textbook superlative. Not attributable, not hedgeable. |

### 2.8 Fay Park — **PUBLISH as `park`**

Zone clean on all three instruments; dataset confirms Rec & Park ownership, Mini Park, Russian Hill /
Russian Hill.

| Claim | Verdict |
|---|---|
| 2366 Leavenworth Street, at Chestnut | **PUBLISH** |
| **0.33 acres (dataset) vs "1/4-acre" (Rec & Park)** | **REWRITE.** I pulled the dataset value: **0.32959382 acres**. The operator's "1/4-acre" is loose. Use **"about a third of an acre"**, or the dataset figure rounded to **0.33 acres**. Do not print "1/4-acre". |
| **Hours 10 a.m. to 4 p.m.** | **PUBLISH** — re-fetched and confirmed. Genuinely short and genuinely sourced. |
| Three terraces connected by stairs and ramps, stone balustrades and retaining walls, ornamental planting beds and boxwood hedges, two latticed wooden gazebos, a bay overlook at the top | **PUBLISH** — the terraces, stairs and ramps, ornamental plantings, stone walls, the two latticed wooden gazebos and the overlook with views of San Francisco Bay all re-fetched verbatim |
| "climbing the hillside for **half a city block**" | **PUBLISH** — a measurement of extent, not a trip duration |
| Family built the first house 1869, current house 1912; bequest by Mary Fay Berrigan; Brigadier General Paul Berrigan commissioned Thomas Church in 1957; city accepted on his death in 1998; opened to the public 2006; the house is not open to the public | **PUBLISH** — every date re-fetched. **REWRITE one word:** the page says the general "commissioned" Church, not that the couple "hired" him. And **DROP "renowned"** from "renowned landscape architect Thomas Church" — the operator's adjective, not a fact. |
| Facilities dataset lists "Fay House" as Structure, Historic: Bldg-Other | **PUBLISH** if wanted; it adds little |
| "Just a block from Lombard Street's **famous** crooked block"; "hidden gem" | **DROP both**, as the finder said. The first is orientation by impression *and* carries "famous"; the second is pure evaluation. Adjacency only as named cross streets: **"at Leavenworth and Chestnut Streets."** |

### 2.9 Ina Coolbrith Park — **PUBLISH as `park` — and I RESOLVE the zone rather than escalate it**

The finder called this "one of the sharpest" straddles and sent it up. It should not go up. **The roster's
own draw line for `russian-hill` names "Ina Coolbrith Park" explicitly.** The zone question is already
answered by the document that defines the zone. The finder read the roster for the Oracle Park ruling and
did not read it for its own draw line. **Russian Hill's. No escalation.**

The evidence agrees anyway: I re-fetched the Rec & Park page and it says, in the operator's own words,
"a little 0.8-acre park **in Russian Hill**"; `mons_neighborhood` = Russian Hill. Only
`analysis_neighborhood` says Nob Hill, and that is the same 41-unit boundary that puts Russian Hill Place
in Nob Hill.

| Claim | Verdict |
|---|---|
| Vallejo and Taylor Streets, 94133 | **PUBLISH** |
| **0.87 vs "0.8-acre"** | **REWRITE** → **0.87 acres** (dataset value 0.86687177, address of record 1700 Taylor St). The operator's "0.8" is the same number rounded down. |
| Hours 5 a.m. to midnight; restroom 8 a.m. to 8 p.m. | **PUBLISH** — re-fetched verbatim |
| Named for Ina Coolbrith, writer and librarian, named in the NRHP nomination for 87002286 | **PUBLISH** |
| "If you love exploring and discovering little pockets of the **hidden** San Francisco"; "the **stunning** views"; "if the steep hills don't **take your breath away**" | **DROP all three.** This is the whole of the operator's description and none of it is usable. The park's steepness may be stated as a fact; nothing in that sentence may be quoted. |

### 2.10 George Sterling Park — **DROP as a place; the NAME survives inside Alice Marble Courts**

The finder recommended dropping and was right, but for a slightly wrong reason, and it missed the one
city source that exists.

- Re-confirmed: **"sterling" returns 0 rows** in the 255-row Rec & Park properties dataset. There is no
  facility page. The City Lands record for the site is **"LOMBARD RESERVOIR WATER FACILITIES", 1200
  Greenwich St, SFPUC** — water-utility land, not a park. The SF Parks Alliance page **re-fetched at
  HTTP 403**, exactly as the finder found.
- **But** the Rec & Park facility page for Alice Marble Courts, which I fetched, states the courts sit
  "atop Russian Hill and **George Sterling Park**". That is a city source for the name — the finder
  looked in the properties dataset and the facility list and never looked at the adjoining facility's
  own page.

**Ruling:** it does not ship as a place. There is no address of record under that name, no acreage, no
hours, no ownership row, and the land belongs to the Public Utilities Commission. **It ships as one
sourced sentence inside the Alice Marble Courts entry.** The Sterling bench and plaque history
(dedicated 25 June 1928; plaque stolen in the 1970s; replacement quoting "The Cool, Grey City of Love"
installed 10 July 1982 at a ceremony attended by Herb Caen, Lawrence Ferlinghetti and Philip Lamantia;
later moved to the northwest corner) rests on one Wikipedia list article citing a 1928 utility
newsletter. **Optional, and only if the author cites that article.** I would leave it out.

### 2.11 Alice Marble Courts — **PUBLISH as `park`**

Zone unanimous, re-verified: 1200 Greenwich = Russian Hill on EAS, `analysis_neighborhood` and
`mons_neighborhood`. Dataset: Rec & Park ownership, 0.83992372 acres.

| Claim | Verdict |
|---|---|
| 1200 Greenwich Street; "Greenwich and Hyde" on the facility page | **PUBLISH** |
| 0.84 acres | **PUBLISH** |
| Hours 5 a.m. to midnight | **PUBLISH** |
| Four tennis courts, a full-court outdoor basketball court, a practice wall, accessible hard courts | **PUBLISH** — re-fetched |
| Named for tennis player Alice Marble | **PUBLISH** |
| **"Alice Marble (1913–1940)"** on the operator's page | **DROP.** That is the operator's error — 1940 is the last year of her Grand Slam run, not her death. Print no dates for her. |
| "**dominant** women's tennis champion"; "18 Grand Slam titles between 1936 and 1940" | **REWRITE.** Drop "dominant". The count survives: **"Alice Marble won eighteen Grand Slam titles between 1936 and 1940."** |
| "This **Marina** facility" | **DROP.** The operator's page miscategorises the courts as Marina. Do not repeat it, and do not cite the page for the neighbourhood. |
| "some of the city's **most spectacular vistas**" | **DROP.** Superlative with comparison class. |
| The courts sit over the Lombard Reservoir, PUC land at 1200 Greenwich | **PUBLISH** — two structures that physically coincide, sourced to City Lands. This is exactly the kind of adjacency the rules permit. |

---

## 3. DESIGNATED-BUILDING TIER — rulings

### 3.1 Engine Company No. 31 Fire House — **PUBLISH as `historic-site`**
1088 Green Street, between Hyde and Leavenworth. Built 1908. **San Francisco Landmark No. 220, designated
in 1998** and **listed on the National Register of Historic Places in 1988, reference number 87002290** —
both re-fetched, both exact, the NPS record naming 1088 Green Street. Zone re-confirmed Russian Hill.
Two registers with two identifiers on one building is the strongest citation in the zone.
"No source states its opening hours, so none are given." **PUBLISH** — that sentence is about the fact.

### 3.2 Alhambra Theater — **PUBLISH as `historic-site`. KIND RULED.**
The finder asked and I answer: **`historic-site`, not `theater`.** The schema's `theater` describes an
operating venue and this one closed as a cinema on 22 February 1998. `shop` is worse. Re-fetched and
confirmed: 2320–2336 Polk Street on the register, 2330 Polk in the Wikipedia infobox; opened
**5 November 1926**; **1,625 seats**; cost **$500,000**; Moorish Revival; two twin turrets; kaleidoscope
domed ceiling; **Miller & Pflueger (Timothy L. Pflueger)**; twinned 1976, single screen 1988; now a
**Crunch Fitness** gym with the original marquee restored and films still shown. All **PUBLISH**.
Zone re-confirmed: 2330 Polk = Russian Hill. (2320 Polk has no EAS row; use 2330.)

**Designation — REWRITE.** Three sources give three dates: 21 February 1996 (Wikipedia), 3 March 1996
(landmark list), 1996 (register). Use the register: **"San Francisco Landmark No. 217, designated in
1996."** The finder reached the same conclusion; I confirm it against the register itself.

**Pflueger also designed the Castro Theatre and the Paramount in Oakland** — **PUBLISH**, it is a list of
his works, not a ranking. Do not follow it with any claim about their relative importance.

### 3.3 Filbert Street Cottages — **PUBLISH as `historic-site`, thin and knowingly so**
1338 Filbert Street; **San Francisco Landmark No. 232, designated in 2003**; register name confirmed;
also known in the landmark record as the Bush Cottages and the School of Basic Design and Color. Zone
re-confirmed Russian Hill. The finder is honest that it found no architect and no build date. A place
with a verified address and a verified landmark number clears the bar; it ships short.

### 3.4 Church for the Fellowship of All Peoples — **PUBLISH as `historic-site`**
2041 Larkin Street, zone re-confirmed Russian Hill on all instruments. **San Francisco Landmark No. 309,
designated in 2023** — register match, register spelling "All People".

| Claim | Verdict |
|---|---|
| Founded 1944 by Howard Thurman and Alfred Fisk | **REWRITE the citation.** I fetched fellowshipsf.org: "co-founded in 1944 by Rev. Dr. Alfred Fisk and the legendary theologian Rev. Dr. Howard Thurman." A founding year from the operator's own site does not publish under the programme's rule. **Cite the Wikipedia article the finder already listed, not the church's site, for the 1944 date.** And **DROP "legendary"**. |
| Thurman left a tenured post at Howard University to help the Fellowship of Reconciliation establish the congregation | **PUBLISH** if carried by Wikipedia; the church's own site does not state it and must not be the source |
| Intercultural, interracial, interfaith and interdenominational | **PUBLISH** — the congregation's self-description of what it is, which its own site does establish |
| Off-white stucco façade, three street-level arched inset doors, leaning bell tower | **PUBLISH** |
| Annual Convocation each October, open to the public, presents the Howard Thurman Award | **PUBLISH** — re-fetched on the church's own site |
| "one of the **newest** Article 10 landmarks in the city" | **DROP.** Superlative, and false besides: the register I pulled contains LM 321, designated 2025. |

### 3.5 Engine Co. No. 8 / Truck Co. No. 4 — **PUBLISH as `historic-site`, soft flag upheld**
1648 Pacific Avenue; **San Francisco Landmark No. 188, designated in 1988**; register match. Zone
re-confirmed: EAS and `analysis_neighborhood` both Russian Hill. The finder's own instinct that a
guidebook would call this Polk Gulch is worth recording, but **Polk Gulch is not one of the roster's
twenty-three zones**, so there is no rival claimant and nothing to escalate. Russian Hill's. Thin: no
build date and no architect. Ships short.

### 3.6 Sinton House — **DROP**
Two independent reasons, either sufficient.

1. **The designation does not verify to the address.** I fetched the NPS record for 11000944. The name
   "Sinton House" matched; the record returned **location "Washington, District of Columbia"**, no
   listing date, and nothing tying it to **1020 Francisco Street, San Francisco**. The noehill mirror
   for that reference number **404s**. The finder's source was "the NRHP listing table" and a Wikipedia
   neighbourhood article — neither is a register record. A landmark number that looks citable but points
   somewhere else is the precise failure the programme warns about.
2. It is a **private residence** with no public access, carrying nothing but a designation.

The Alma de Bretteville Spreckels material — an 1901 *San Francisco Examiner* item placing her family at
1024 Francisco — is a separate house, sourced to a newspaper the finder did not fetch. **DROP** with it.

### 3.7 Feusier Octagon House — **PUBLISH as `historic-site`, ZONE ESCALATED**
1067 Green Street. **San Francisco Landmark No. 36, designated in 1970** (register name "Feusier Octagon
House/Kenny Residence") and **listed on the National Register of Historic Places in 1974, reference
number 74000554** — NPS returned "Feusier Octagon House, listed 3/24/1974, 1067 Green St.", exact.
Contributor to district 87002288. Built c. 1857–58 by George Kenny, sold 1870 to Louis Feusier, later
given a third storey, mansard roof and cupola: **PUBLISH**. Use the year 1970 only; the day-level dates
conflict.

"One of only three octagon houses in the city, with the McElroy Octagon House and the Land's End Marine
Exchange Lookout" — **REWRITE to the bare count**: **"One of three octagon houses in San Francisco."**
The finder's own analysis was right that a count is not a ranking, but "one of **only** three" leans on
the scarcity and reads as one. Strip "only". "The last remaining" **DROPS**, as the finder said.

Private residence, so no hours; the 2018 rental and 2021 sale offering add nothing and should be left
out. **ZONE: ESCALATE** — 1067 Green re-returned Nob Hill while the district containing it is named
"Russian Hill–Paris Block".

### 3.8 Atkinson House (Atkinson-Escher House) — **PUBLISH as `historic-site`, ZONE ESCALATED**
1032 Broadway. **San Francisco Landmark No. 97, designated in 1977** — register match, register name
"Atkinson-Escher House". Contributor to district 87002289. Built 1853 by the partnership of architect
William H. Ranlett, contractor Charles Homer and mason Joseph H. Atkinson, who built three houses on
what is now the Vallejo Street Crest in 1853–54; survived the 1906 earthquake. **PUBLISH.**

"One of the oldest houses still standing in San Francisco" and "possibly one of the first examples of
Italianate" — **DROP both**, as the finder said. The 1853 date carries everything the ranking was
reaching for. The Wiley *National Trust Guide* citation is a book I did not fetch; anything resting on
it alone should not ship. **ZONE: ESCALATE** — 1032 Broadway re-returned Nob Hill.

### 3.9 House of the Flag (Old Sheppard-Dakin House) — **PUBLISH as `historic-site`, ZONE ESCALATED**
1652–1656 Taylor Street. **San Francisco Landmark No. 46, designated in 1972** — register match,
register name "House Of The Flag; Old Sheppard-Dakin Hs". No build date from any register; ships on the
designation alone. **ZONE: ESCALATE** — 1652 Taylor re-returned Nob Hill, and the finder measured it
~0.0012° from the Russian Hill polygon. Genuinely on the line.

---

## 4. THE PLACES RUSSIAN HILL DOES NOT GET — the roster already ruled

The finder sent nine items to the arbitrator that the roster settles on its face. It read the roster for
the Oracle Park ruling and did not read the `draw` strings. **All of these DROP from Russian Hill.**

| Place | Finder's position | Ruling |
|---|---|---|
| **Ghirardelli Square**, 900 North Point (LM 30, NRHP 82002249) | "the single biggest ownership question in my zone" | **DROP.** The roster's `fishermans-wharf` draw names **"Ghirardelli Square"** in so many words. DataSF's polygon disagreeing with the roster is not an open question; the roster is the document that defines the zones. Not an escalation. |
| **Haslett Warehouse / Argonaut**, 680 Beach (LM 59, NRHP 75000172) | "same conflict" | **DROP.** The roster's Fisherman's Wharf draw names "the Hyde Street Pier historic ships" and "Aquatic Park"; 680 Beach is inside that. Fisherman's Wharf's. |
| **The Buena Vista**, 2765 Hyde | straddler | **DROP.** Aquatic Park is named in the Fisherman's Wharf draw. |
| **Joseph Conrad Square**, 601 Beach | "three answers, three zones" | **DROP.** `mons_neighborhood` Fisherman's Wharf; Rec & Park's own copy says "the North Beach/Wharf area". Not Russian Hill's. |
| **Dolphin Club / South End Rowing Club**, 500 Jefferson | straddler | **DROP.** Aquatic Park. Fisherman's Wharf's. |
| **Hyde & Beach cable car turntable** | straddler | **DROP.** Fisherman's Wharf's. |
| **Burr House**, 1772 Vallejo (LM 31, NRHP 14000967) | "I believe this is NOT Russian Hill's" | **DROP, and I agree.** I re-queried 1772 Vallejo: EAS returns **Marina**. West of Van Ness. The Marina's or Pacific Heights'. The finder was right and did not need to hedge. |
| **Glazer-Keating House** 1110 Taylor (LM 251); **Our Lady of Guadalupe** 906 Broadway (LM 204); **Bauer & Schweitzer** 530–550 Chestnut (LM 129) | flagged, not pursued | **DROP.** Correctly not pursued. Both landmark numbers verify against the register; they are Nob Hill's, Chinatown's and North Beach's business. |
| **Bob's Donuts**, 1621 Polk | "do not claim without a ruling" | **DROP.** 1621 Polk re-returned `nhood = Nob Hill`. Nob Hill's to claim. |

### 4.1 Powell–Hyde cable car line / San Francisco cable car system — **DROP**
The finder recommended Russian Hill not claim it and I make that a ruling rather than an escalation. The
roster gives **the Cable Car Museum to Nob Hill** and **the Powell and Market turntable to Union
Square**. The NPS record for **66000233** carries the address **1390 Washington Street** — the museum,
in Nob Hill. Russian Hill owns a length of track and one stop. And the finder's headline framing —
"National Historic Landmark, designated 29 January 1964" — **is not what the register returned**: NPS
gave **listed 10/15/1966** and stated no NHL status. Russian Hill does not claim it.

**What survives for Russian Hill's page:** the Powell–Hyde cable car stops at Hyde and Lombard Streets,
at the top of the crooked block. That is a sourced fact about Lombard Street, written inside the Lombard
Street entry. Nothing more.

---

## 5. EVERYDAY TIER — rulings

### 5.1 Michelangelo Playground — **PUBLISH as `park`**
1055 Greenwich Street; dataset re-pulled: **0.48377232 acres**, Rec & Park ownership, Russian Hill on both
neighbourhood fields, EAS Russian Hill. **REWRITE the acreage** to **0.48 acres**; the operator's
".44-acre" conflicts with its own dataset and loses. Hours 5 a.m.–midnight; restrooms 8 a.m.–8 p.m.
spring/summer, 8 a.m.–5:30 p.m. fall/winter: **PUBLISH**. Playground, basketball court, community garden,
picnic area, restrooms, grassy area: **PUBLISH**. **DROP "tucked away between the North Beach and
Russian Hill neighborhoods"** — "tucked away" is evaluative and the neighbourhood straddle is the
operator's prose, not a fact about the park. All three instruments say Russian Hill. **No escalation.**

### 5.2 Helen Wills Playground — **PUBLISH as `park`. I RESOLVE rather than escalate.**
1401 Broadway. Dataset re-pulled: 0.91679834 acres, Rec & Park, `analysis_neighborhood` **Russian Hill**,
`mons_neighborhood` **Polk Gulch**. **Polk Gulch is not one of the roster's twenty-three zones.** There is
no rival page and nothing for an arbitrator to decide. Russian Hill's. **REWRITE 0.92 acres.** Hours,
tennis courts, basketball courts, children's play area, paved playfields, clubhouse, and the naming for
tennis player Helen Wills all **PUBLISH**.

### 5.3 Hyde & Vallejo Mini Park — **PUBLISH as `park`, with the finder's caution upheld and hardened**
1825 Hyde Street; dataset **0.1128114 acres** → **0.11 acres**; Rec & Park ownership; Russian Hill on both
neighbourhood fields. Hours 5 a.m.–midnight. **PUBLISH** name, address, acreage, hours and nothing else.

I re-fetched the page and **the finder's catch is exactly right**: the description under "Hyde & Vallejo
Mini Park" begins "**Washington-Hyde Mini Park** is a postage stamp-size jewel tucked away in the City's
**Nob Hill** neighborhood. The **.15-acre** park…". That is another park's copy, and its acreage
contradicts the 0.11 in the city's own dataset. **DROP the entire description.** Do not take "postage
stamp-size jewel", "one of the city's more charming and unique spots", "Old World town", "one of San
Francisco's best-kept secrets" — the last two are a superlative and an evaluation even if they belonged
to this park, which they do not. Good finding; it would have put a Nob Hill sentence on a Russian Hill
page.

### 5.4 Washington & Hyde Mini Park — **PUBLISH as `park`, ZONE ESCALATED**
1470 Washington Street; dataset **0.16129288 acres** → **0.16 acres**; EAS `nhood` Russian Hill;
`analysis_neighborhood` Russian Hill; `mons_neighborhood` **Nob Hill**. Nob Hill **is** a roster zone, so
this one genuinely escalates. Modern playground styled as a colourful child-size city with soft rubber
flooring: **PUBLISH**. **DROP "nestled in a tranquil setting"** and **"an escape from downtown's busy
atmosphere"** — evaluative, and the second is orientation by impression.

**Hours: DROP.** I re-fetched and the page prints "**Park Hours: 5 to 11:45 a.m.**" exactly as the finder
reported. It is transparently a typo for 11:45 p.m. and the finder was right to refuse it. Write no hours,
and write nothing about why.

### 5.5 Broadway Tunnel West Mini Park — **DROP**
1201 Broadway; 0.1245258 acres; the dataset's own `mons_neighborhood` reads "Russian Hill, Nob Hill".
The facility page carries no features and no description — "landscaped and hardscaped areas" is a land-use
category, not a description of a place. An eighth of an acre with nothing to say about it, straddling two
zones, is below the bar. The finder said "probably below the bar" and I make that the ruling.

### 5.6 Russian Hill Open Space — **DROP**
The finder called it "thin and jurisdictionally odd" and stopped there. I fetched the page and it is worse
than thin: the address is **"Hyde and Bay"**, there is **no acreage**, **no features**, **no description**,
it does **not appear in the properties dataset**, and the only image on the page is captioned
**"Francisco Reservoir"**. Hyde and Bay is the north-east corner of Francisco Park, which occupies the
Francisco Reservoir site. This is a legacy record for land the corpus is already shipping as Francisco
Park. Shipping both would put one site in the file twice. **DROP.**

### 5.7 The Broadway Tunnel (Robert C. Levy Tunnel) — **PUBLISH as `attraction`, ZONE ESCALATED**
Re-fetched and confirmed: officially the **Robert C. Levy Tunnel**; opened **21 December 1952**;
**1,616 ft**; two bores of two lanes each; funded by a **$5 million bond** approved by voters in **1948**;
west portal just east of the Hyde Street overpass, east portal just east of the Mason Street overpass;
runs under Russian Hill. All **PUBLISH** — dates, a measurement, a sum, and portals located by named
overpasses rather than by impression.

The 1863 Assembly grant **PUBLISHES**, and Wikipedia gives the statutory text naming Abner Doble,
I.T. Pennel, Joseph M. Wood and I.W. Cudworth and the line "through Russian Hill, on the line of
Broadway street, from Mason street to Hyde or Larkin street". **REWRITE:** the finder's date "22 April
1863" was not on the page I fetched — write "granted by the California State Assembly in 1863" unless the
author can source the day. The Bion J. Arnold March 1913 report **PUBLISHES**.

**DROP "carries Broadway uninterrupted for six blocks"** unless sourced — I did not see it. **PHOTO:**
the finder's ruling is correct and upheld — the Patti Bowler bronze dragon relief (1969) over the eastern
portal is a sculpture, outside 17 USC 120(a), and the eastern portal is not in this zone anyway.

**ZONE: ESCALATE.** A 1,616-ft structure under four neighbourhoods. My recommendation to the arbitrator:
Russian Hill, on the hill it pierces and the 1863 grant that names it.

---

## 6. COMMERCIAL TIER — rulings

| Candidate | Verdict |
|---|---|
| **Cheese Plus**, 2001 Polk St | **PUBLISH** as `shop`. Re-fetched: "2001 Polk Street @ Pacific Ave San Francisco CA 94109", phone 415 921 2001, **Mon–Fri 10 a.m.–7:30 p.m., Sat 9 a.m.–7:30 p.m., Sun 9 a.m.–7 p.m.** Cheese, charcuterie, specialty foods, sandwiches, salads, wine. Identity, location and hours from the operator's own site — precisely what a business site does establish. EAS Russian Hill re-confirmed. |
| **Frascati**, 1901 Hyde St | **PUBLISH** as `restaurant`. Re-fetched: 1901 Hyde Street, (415) 928-1406. EAS Russian Hill re-confirmed. **DROP** the site's testimonial "eased into my Bay Area Top Five restaurants" — a ranking with a comparison class, and a customer's at that. **DROP** "on the Hyde cable car line" as written; if the author wants the relation, state the fact: Frascati is at Hyde and Green, and the Powell–Hyde line runs on Hyde Street. |
| **Za Pizza**, 1919 Hyde St | **PUBLISH** as `restaurant`. Re-fetched: "1919 Hyde St @ Green", 415-771-3100, daily 12 p.m.–8 p.m. Thin-crust pizza, salads, wine and beer. EAS Russian Hill re-confirmed. |
| **Real Food Company**, 2140 Polk St | **DROP — the business is closed.** I fetched realfoodco.com and it states: "**We are now closed. Bi-Rite Market Polk Coming Soon.**" The finder passed it through as a live grocer. This is the finder's most consequential factual error: it would have shipped a shuttered shop. Bi-Rite Market Polk is a "coming soon" and does not ship either. |
| **Russian Hill Bookstore**, 2162 Polk St | **PUBLISH** as `shop`, restricted. Re-fetched: 2162 Polk St., San Francisco, CA 94109, (415) 929-0997; used and new books, note cards, gifts, children's toys, board games. EAS Russian Hill re-confirmed. **The finder's restraint here is correct and I uphold it in full:** "established in 1974" and "in continual operation for the past 50+ years" are trading-duration claims from the operator's own site and **DROP**; "one of the few independently-owned used and new bookstores still operating in San Francisco" is a superlative and **DROPS** twice over. **DROP** the word "incredible" from "incredible note cards". |
| **Crunch Polk Street** | **DROP** as a place. Ships as the current occupant inside the Alhambra entry (§3.2), which is where the finder pointed. The address never resolved on crunch.com in any case. |
| **The Buena Vista**, 2765 Hyde St | **DROP** — Fisherman's Wharf's, §4. |
| **Bob's Donuts**, 1621 Polk St | **DROP** — Nob Hill's, §4. |
| **Swensen's**, 1999 Hyde St | **DROP.** EAS confirms 1999 Hyde = Russian Hill and that is the sum of what is known. No reachable site, no hours, nothing but an address. The finder recorded it and claimed nothing; correct. |
| Failed domains: unionlarder, zarzuelasf, ristorantemilanosf, hydestreetseafood, thebelltowersf, swensensicecream.net | **DROP** — the finder claimed nothing from any of them, which is the right call. |
| leopoldssf.com, swanoysterdepot.us resolving to squatted sites | **DROP, and the warning is valuable.** Do not cite either under any circumstances. |

---

## 7. TIER RULING

**TOWN PAGE. Not a guide.** I concur with the finder, and the surviving count supports it more strongly
than the finder's own estimate of "fifteen to twenty".

**Surviving places: 26.** Seven of those twenty-six are zone-escalated; if the arbitrator rules every one
of them against Russian Hill, the floor is **19**. Either number is a full neighbourhood page.

The test for a guide is a single dominant anchor that the other places orbit and that would otherwise be
restated across several pages — the Oracle Park shape. Russian Hill has no such anchor. It has a crooked
street, three separate National Register districts that do not contain one another, a closed art school,
a 4.5-acre park opened in 2022, a Thomas Church garden with four-hour opening, hilltop tennis courts, a
motor tunnel and a short commercial spine on Polk and Hyde. Not one of them subsumes the rest. Town page.

**The 26 surviving places**

*Clean — 19*
Lombard Street crooked block · Macondray Lane · San Francisco Art Institute (Rivera fresco folded in) ·
Francisco Park · Fay Park · Ina Coolbrith Park · Alice Marble Courts · Engine Company No. 31 Fire House ·
Alhambra Theater · Filbert Street Cottages · Church for the Fellowship of All Peoples · Engine Co. No. 8 /
Truck Co. No. 4 · Michelangelo Playground · Helen Wills Playground · Hyde & Vallejo Mini Park ·
Cheese Plus · Frascati · Za Pizza · Russian Hill Bookstore

*Escalated to the arbitrator — 7*
Russian Hill–Vallejo Street Crest District · Russian Hill–Paris Block Architectural District ·
Feusier Octagon House · Atkinson House · House of the Flag · Washington & Hyde Mini Park ·
The Broadway Tunnel

---

## 8. STRADDLERS I ESCALATE — and the ones I refuse to escalate

**Escalated (7).** Six against **Nob Hill**, all of them one problem wearing six hats: DataSF's 41-unit
Analysis Neighborhood boundary places the historic crest of Russian Hill inside Nob Hill. I re-queried
every address and the boundary really does say that — 1 Russian Hill Place, 1 Florence Street, 1032
Broadway, 1067 Green and 1652 Taylor all return Nob Hill. Against that stand three National Register
districts whose registered names begin "Russian Hill". **My recommendation: the register wins.** A
district the federal government registered as "Russian Hill–Vallejo Street Crest" cannot sit on Nob
Hill's page under that name. The arbitrator should rule the six as one question, not six.

The seventh is **the Broadway Tunnel**, against Nob Hill, Chinatown and North Beach at once.
Recommendation: Russian Hill.

**Refused escalations (4).** The finder sent up four questions that are already answered and I return
them:
1. **Ina Coolbrith Park** — the roster's `russian-hill` draw line names it. Russian Hill's.
2. **Helen Wills Playground** — the rival is Polk Gulch, which is not a zone in this roster.
3. **Michelangelo Playground** — all three instruments say Russian Hill; the operator's prose is not an
   instrument.
4. **Ghirardelli Square and the Haslett Warehouse** — the finder called this "the single biggest
   ownership question in my zone". It is not a question. The roster's `fishermans-wharf` draw names
   Ghirardelli Square explicitly. An arbitrator does not need to be asked whether a roster means what it
   says.

**Also returned, ruled rather than escalated:** the Powell–Hyde cable car line (§4.1), Burr House, Bob's
Donuts, the Buena Vista, Joseph Conrad Square, the Dolphin Club and the Hyde & Beach turntable.

---

## 9. WHAT THE FINDER GOT WRONG

1. **The Real Food Company is closed.** Its own site says "We are now closed." The finder listed it as a
   live grocer. A shuttered shop on a shipped page is the worst class of error in this corpus.
2. **It never read the roster's `draw` strings.** It read the roster for the Oracle Park ruling and for
   the destination string, then escalated Ghirardelli Square as "the single biggest ownership question in
   my zone" when the roster names Ghirardelli Square in Fisherman's Wharf's draw. Same failure sent Ina
   Coolbrith Park to the arbitrator, when Russian Hill's own draw line names it.
3. **It escalated against a zone that does not exist.** Helen Wills Playground was flagged against Polk
   Gulch, which is not one of the roster's twenty-three.
4. **It cited a dead URL without saying so.** The SFCTA *Lombard Study* PDF returns HTTP 404. The
   Lombard visitor counts rest on it and drop.
5. **It overreached on 66000233.** "National Historic Landmark, designated 29 January 1964" is not what
   the register returned — NPS gave a listing date of 10/15/1966 and asserted no NHL status. The number
   was right and the sentence around it was not.
6. **11000944 does not verify to 1020 Francisco Street.** The finder sourced it to "the NRHP listing
   table" rather than a register record. The NPS record returns a District of Columbia location and the
   noehill mirror 404s.
7. **It passed two superlatives through unflagged** while catching a dozen others: "one of four Rivera
   frescoes in the Bay Area" (§4.6) and "the oldest surviving house in the district is 982 Green Street"
   (§4.2). It also let "one of the newest Article 10 landmarks in the city" stand in §5.4, which is both
   a superlative and false — the register contains a 2025 designation.
8. **It missed the one city source for George Sterling Park.** It searched the properties dataset and the
   facility list and found nothing, correctly; it never opened the adjoining Alice Marble Courts page,
   which says the courts sit "atop Russian Hill and George Sterling Park".
9. **Russian Hill Open Space is Francisco Park.** The finder called it "jurisdictionally odd" and left it
   in. The page's only image is captioned "Francisco Reservoir" and its address is the corner of the park
   the corpus is already shipping.
10. **It printed SFMTA stop 5078.** The stop page prints #15078.

**What it got right, and got right well:** every one of the twelve Article 10 numbers verified against the
register, field for field. Every one of thirty-eight EAS neighbourhood assignments re-queried identically.
The negative finding that no Article 10 district exists in Russian Hill is correct and I confirmed it
across all twenty rows. The catch that Rec & Park's Hyde & Vallejo page displays another park's copy would
have put a Nob Hill sentence on this page. The refusal to pass through the bookstore's founding year, its
50-year claim and its "one of the few" was exactly right without being asked. And the boundary problem in
§2 is real, correctly diagnosed, and the most useful thing in the report.
