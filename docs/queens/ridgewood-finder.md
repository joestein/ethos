# Ridgewood, Queens — FINDER candidate file

**Role:** Finder. Nothing here is verified, confirmed, or adjudicated. Every line below is a
CANDIDATE awaiting a separate verifier. I record no verdicts and none should be inferred from the
ordering, from the amount of detail attached to an item, or from the fact that I bothered to chase
a source. Where two sources disagree I record both and say so; I do not pick a winner.

---

## 0. QUOTING CONVENTION — read this before using any line

- **[Q]** — text inside `"…"` that I read myself as raw source bytes: LPC designation-report PDFs
  (converted with `pdftotext -layout` and read line-by-line), JSON payloads from government
  open-data APIs, Wikipedia **wikitext** pulled from the MediaWiki `action=parse` API, and HTML I
  fetched with `urllib` (browser User-Agent) and stripped to text myself. These I can vouch for as
  character-accurate to what the fetched bytes said.
- **[Q-2nd]** — a quotation that reached me through the **WebFetch summarizing layer** rather than
  from raw source text I read directly. I have **not** compared these character-by-character
  against the source. **Treat every [Q-2nd] as paraphrase-grade until the verifier re-reads the
  source itself.**
- **[P]** — **MY PARAPHRASE.** Not the source's wording. The verifier must go to the URL for the
  actual language.

**I have not presented any paraphrase of mine as a verbatim quote.** Where I was unsure which
bucket a line belonged in, I graded it down. (A finder in an earlier wave presented four of its own
paraphrases as verbatim quotes, one of which inverted the source's meaning by inserting the word
"no". Hence the three-way grading above and the deliberate over-use of [Q-2nd].)

---

## 1. RESEARCH CONSTRAINT DISCLOSURE — material, read it

1. **The WebSearch budget for this session was exhausted (200/200) before I issued a single
   Ridgewood query.** Both of my opening searches returned
   `"Web search was not performed: this session has used its web search budget (200 of 200
   WebSearch calls)."` [Q] Every item below was obtained either by fetching a URL I could name in
   advance, or by pulling government open-data APIs. This biases the corpus **hard** toward
   institutional sources and government datasets, and means coverage of local news, oral history,
   small business, and recent (2024–2026) developments is thin-to-absent. §12 lists the gaps.
2. This is the same constraint the wave-3 Forest Hills finder hit. Unlike that pass, I had
   `nycgovparks.org` working throughout (browser User-Agent via `urllib`), so **all NYC Parks
   material below is [Q]**.
3. **Sources that refused me or are unusable:**
   - `en.wikipedia.org/wiki/Ridgewood_Theatre` and `.../Ridgewood_Theater` — **both 404**. The
     theater's post-closure fate is therefore UNSOURCED here (see §12).
   - `houdinikitchenlaboratory.com` — DNS does not resolve.
   - `rudysbakerycafe.com` — DNS does not resolve (the live site is at a *different* domain, see
     F095).
   - **`morschersporkstore.com` is now an Australian online-casino spam page** [Q] — the domain
     has lapsed and been re-registered. **Do not cite it under any circumstance.** See F098.
   - `data.cityofnewyork.us/resource/3bkj-34v2` (DOE Public School Location Information) — 403.

---

## 2. METHOD NOTE — how I established "which neighborhood" (read before §11)

The brief requires that for every candidate place I record what the source says about which
neighborhood it is in, plus its street address. Because Glendale / Maspeth / Ridgewood boundaries
are genuinely contested, I used **two independent geographic methods** and recorded both, including
where they disagree:

- **Method A — DCP GeoSearch** (`geosearch.planninglabs.nyc/v2/search`), NYC Planning's own
  geocoder. Returns a `neighbourhood` field and a postal label.
- **Method B — point-in-polygon against NTA2020** (`data.cityofnewyork.us/resource/9nt8-h7nd`,
  the official 2020 Neighborhood Tabulation Areas). I downloaded the polygons and wrote my own
  ray-casting test.

**Method A is demonstrably unreliable on hyphenated Queens house numbers.** It silently strips the
hyphen and can land in the wrong borough. Documented failures I hit:

**F001** [P] GeoSearch resolved `21-27 Himrod Street` (Grover Cleveland High School) to
`"27 HIMROD STREET, Brooklyn, NY, USA"` with `neighbourhood = Bushwick`. The DOE's own dataset and
Method B both put the school in Ridgewood (F080). **The geocoder was wrong.**

**F002** [P] GeoSearch resolved `20-12 Madison Street` (Ridgewood Library) to
`"20 MADISON STREET, Brooklyn, NY, USA"`, `neighbourhood = Bedford-Stuyvesant`. The Queens Library
dataset's own NTA field says `QN0502` (F078). **The geocoder was wrong.**

**F003** [P] GeoSearch resolved `3-96 Grandview Avenue` (Grover Cleveland Playground) to
`"96 GRANDVIEW AVENUE, Staten Island, NY, USA"`, `neighbourhood = Mariners Harbor`.

**F004** [P] GeoSearch returned `neighbourhood = "Forest Park"` for the Evergreens Cemetery at
1629 Bushwick Avenue, Brooklyn — a nonsense result; Method B returned the correct
`BK0471 The Evergreens Cemetery`.

**Consequence for the verifier:** where Method A and Method B disagree in this file, I have flagged
it and I have NOT resolved it. Where an agency's own dataset carries an NTA/borough field (DOE,
Queens Library, LPC, MTA), I treated that as a **third** reading and recorded it alongside. I also
caught myself making this error: my first hand-guessed coordinate for the Onderdonk House landed in
the Maspeth NTA; the LPC dataset's actual coordinates put it in Ridgewood (F030). **Do not trust
any coordinate in this file that I did not take from an agency dataset.**

**F005** [Q] The NTA2020 dataset gives the CD5 codes as: `QN0501 Maspeth`, `QN0502 Ridgewood`,
`QN0503 Glendale`, `QN0504 Middle Village`, all under
`"QN05 Ridgewood-Maspeth-Middle Village (CD 5 Approximation)"`. — S3

**F006** [Q] The same dataset carries four **`ntatype = 7`** areas in CD5 — `QN0571 Mount Olivet &
All Faiths Cemeteries`, `QN0572 Middle Village Cemetery`, `QN0573 St. John Cemetery`,
`QN0574 Highland Park-Cypress Hills Cemeteries (North)`. — S3
*(Finder note, NOT a verdict, but structurally important: `ntatype = 7` is the same
"joint interest area" device that put Flushing Meadows Corona Park (`QN8191`) in* no *neighborhood
NTA, which the wave-3 arbitration relied on. By that same logic CD5's big cemeteries sit in no
neighborhood NTA either. I am surfacing the parallel; the arbitrator owns whether it controls.)*

---

## 3. EXCLUSIONS I CHECKED FIRST, DELIBERATELY

### 3.1 `Ethos.Seeds.CitiFieldPlaces` — the eight Flushing Meadows holdings

**F007** [P] I searched my corpus for all eight owned places (Citi Field, the Unisphere, the Queens
Museum, the New York Hall of Science, the Queens Zoo, the USTA Billie Jean King National Tennis
Center, the New York State Pavilion, the Queens Theatre). **I am surfacing none of them as
Ridgewood candidates, and I found no source that places any of them in Ridgewood or gives any of
them a Ridgewood address.** I record the absence explicitly so the verifier does not have to wonder
whether I looked. Ridgewood is in CD5; Flushing Meadows Corona Park is not adjacent to it and is
not a live temptation on this page. **No routing sentence to `/g/citi-field-guide` is warranted
here** — unlike Corona, Ridgewood has no genuine connection to narrate or route.

### 3.2 THE NAME-COLLISION TRAP THE BRIEF WARNED ABOUT — and a second one

**F008** [Q] The wave brief warns that the **Ridgewood Savings Bank building at 107-55 Queens
Boulevard was assigned to FOREST HILLS in wave 3.** I confirm from the shipped corpus that
`priv/seed_data/queens/forest-hills.json` contains a place with
`slug = "ridgewood-savings-bank-forest-hills"`, `name = "Ridgewood Savings Bank, Forest Hills
Branch"`, `town = "Forest Hills"`, `address = "107-55 Queens Boulevard, Forest Hills, NY 11375"`.
**I am not claiming it.** — S30

**F009** [P] **BUT these are two different buildings, and the verifier must not over-correct.** The
bank's *headquarters/main office* is a separate structure at Myrtle and Forest Avenues in Ridgewood
(F072–F074). The wave brief's warning is about the *Forest Hills branch*. Ruling out the Ridgewood
main office because the Forest Hills branch is taken would be an error in the opposite direction.
I record both and resolve neither.

**F010** [P] **A SECOND, UNWARNED NAME COLLISION:** the **Ridgewood Reservoir** is named
"Ridgewood" and is **already owned by Brooklyn**. `priv/seed_data/brooklyn/highland-park.json`
contains `slug = "ridgewood-reservoir"`, `town = "Highland Park"`, address
`"Within Highland Park, near Force Tube Avenue, on the Brooklyn-Queens border, Brooklyn, NY"`, and
its guide prose already narrates it: `"The Ridgewood Reservoir was built between 1856 and 1858 to
hold drinking water, and was formally decommissioned and drained in 1989."` [Q] — S31
**This matters more than it looks, because LPC says the neighborhood is named after the reservoir
(F022). The etymology is Ridgewood's to state; the reservoir is not Ridgewood's to claim.**

**F011** [Q] `highland-park.json` also already narrates the adjacency from the Brooklyn side:
`"The park straddles the Brooklyn-Queens border, bordering Cypress Hills to the south and abutting
Glendale and Ridgewood, Queens, to the north."` — S31

**F012** [P] A **third** name-vs-location trap, surfaced for symmetry: **Middle Village Preparatory
Charter School, 68-02 Metropolitan Avenue**, sits in the **Ridgewood** NTA per the DOE's own `nta`
field and per Method B (F080). It is named Middle Village; the data says it is in Ridgewood. I do
not resolve this.

### 3.3 BROOKLYN OWNS THE OTHER SIDE OF THE LINE — 69 guides already shipped

**F013** [P] I enumerated `priv/seed_data/brooklyn/` and counted **69 `.json` neighborhood files**
(plus a `.gitkeep`), confirming the brief's figure. Files directly on Ridgewood's border:
`bushwick.json`, `east-williamsburg.json`, `cypress-hills.json`, `highland-park.json`. — S30

**F014** [Q] `bushwick.json` guide prose **already narrates the border station**: `"Myrtle-Wyckoff
Avenues is served by both the L and the M, and serves Bushwick and Ridgewood, Queens together —
Wyckoff Avenue forms the Brooklyn-Queens border at that point."` — S31
*(Finder note: this is the single most-used "Ridgewood" transit fact in the world, and Brooklyn has
already written it. See §9 — MTA assigns the station to Brooklyn too.)*

**F015** [Q] `cypress-hills.json` carries `beth-olam-cemetery`, address
`"2 Cypress Hills Street, Brooklyn, NY, straddling the Brooklyn-Queens border"`, and
`highland-park.json` carries `highland-park-brooklyn`, `"Spans the Brooklyn-Queens border along
Jamaica Avenue, Force Tube Avenue, Highland Boulevard and Vermont Place, Brooklyn, NY"`. — S30
*(Finder note: Brooklyn has already taken the border-straddling places on the southern flank.)*

---

## 4. SOURCE INVENTORY

| ID | Source | URL | How I read it |
|----|--------|-----|---------------|
| S1 | NYC LPC, *Ridgewood Theater Building* designation report, LP-2325 | https://s-media.nyc.gov/agencies/lpc/lp/2325.pdf | PDF → `pdftotext -layout` [Q] |
| S2 | NYC LPC, *Adrian and Ann Wyckoff Onderdonk House*, LP-1923 | https://s-media.nyc.gov/agencies/lpc/lp/1923.pdf | PDF → `pdftotext -layout` [Q] |
| S3 | NYC DCP, 2020 Neighborhood Tabulation Areas | https://data.cityofnewyork.us/resource/9nt8-h7nd.json | JSON + GeoJSON API [Q] |
| S4 | NYC LPC, *Stockholm Street Historic District*, LP-2081 | https://s-media.nyc.gov/agencies/lpc/lp/2081.pdf | PDF → `pdftotext -layout` [Q] |
| S5 | NYC LPC, *Ridgewood North Historic District*, LP-2319 | https://s-media.nyc.gov/agencies/lpc/lp/2319.pdf | PDF → `pdftotext -layout` [Q] |
| S6 | NYC LPC, *Ridgewood South Historic District*, LP-2348 | https://s-media.nyc.gov/agencies/lpc/lp/2348.pdf | PDF → `pdftotext -layout` [Q] |
| S7 | NYC LPC, *Central Ridgewood Historic District*, LP-2448 | https://s-media.nyc.gov/agencies/lpc/lp/2448.pdf | PDF → `pdftotext -layout` [Q] |
| S8 | NYC LPC, Individual Landmark Sites (open data) | https://data.cityofnewyork.us/resource/buis-pvji.json | JSON API [Q] |
| S9 | NYC LPC, Historic Districts (open data) | https://data.cityofnewyork.us/resource/skyk-mpzq.json | JSON API [Q] |
| S10 | NYC Parks, Rosemary's Playground history | https://www.nycgovparks.org/parks/rosemarys-playground/history | HTML via urllib [Q] |
| S11 | NYC Parks, Starr Playground history | https://www.nycgovparks.org/parks/starr-playground/history | HTML via urllib [Q] |
| S12 | NYC Parks, Grover Cleveland Playground history | https://www.nycgovparks.org/parks/grover-cleveland-playground/history | HTML via urllib [Q] |
| S13 | NYC Parks, Mafera Park history | https://www.nycgovparks.org/parks/mafera-park/history | HTML via urllib [Q] |
| S14 | NYC Parks, Benninger Playground history | https://www.nycgovparks.org/parks/benninger-playground/history | HTML via urllib [Q] |
| S15 | NYC Parks, Evergreen Park history | https://www.nycgovparks.org/parks/evergreen-park/history | HTML via urllib [Q] |
| S16 | NYC Parks, Clemens Triangle history | https://www.nycgovparks.org/parks/clemens-triangle/history | HTML via urllib [Q] |
| S17 | NYC Parks Properties (open data, incl. polygons) | https://data.cityofnewyork.us/resource/enfh-gkve.json | JSON + GeoJSON API [Q] |
| S18 | Greater Ridgewood Historical Society / Vander Ende-Onderdonk House | https://onderdonkhouse.org/ | HTML via urllib [Q]; one WebFetch pass [Q-2nd] |
| S19 | GRHS, "The Facts" | https://onderdonkhouse.org/the-facts | HTML via urllib [Q] |
| S20 | GRHS, "Plan a Visit" | https://onderdonkhouse.org/plan-a-visit | HTML via urllib [Q] |
| S21 | GRHS, "Contact" | https://onderdonkhouse.org/contact | HTML via urllib [Q] |
| S22 | Wikipedia, *Ridgewood, Queens* | https://en.wikipedia.org/wiki/Ridgewood,_Queens | **WebFetch summary only [Q-2nd]** |
| S23 | Wikipedia, NRHP listings in Queens — **raw wikitext** | MediaWiki `action=parse` API | wikitext [Q] |
| S24 | MTA, Subway Stations (data.ny.gov) | https://data.ny.gov/resource/39hk-dx4f.json | JSON API [Q] |
| S25 | NYC DOE, 2019–2020 School Locations | https://data.cityofnewyork.us/resource/wg9x-4ke6.json | JSON API [Q] |
| S26 | Queens Library Branches (open data) | https://data.cityofnewyork.us/resource/kh3d-xhq7.json | JSON API [Q] |
| S27 | NYC SBS, Directory of Business Improvement Districts | https://data.cityofnewyork.us/resource/qpm9-j523.json | JSON API [Q] |
| S28 | Myrtle Avenue BID (Ridgewood) | http://www.ridgewood-ny.com/ | HTML via urllib [Q] |
| S29 | DOHMH Restaurant Inspections | https://data.cityofnewyork.us/resource/43nn-pn8j.json | JSON API [Q] |
| S30 | **This repo's shipped corpus** (`priv/seed_data/`) | local | read directly [Q] |
| S31 | Brooklyn seed files (`bushwick`, `highland-park`, `cypress-hills`) | local | read directly [Q] |
| S32 | Gottscheer Hall | https://www.gottscheerhall.com/ , /about | HTML via urllib [Q] |
| S33 | Rudy's Bakery and Café | https://rudysbakeryandcafe.com/ | HTML via urllib [Q] |
| S34 | Rolo's | https://rolosnyc.com/ | HTML via urllib [Q] |
| S35 | Norma's | https://www.normascornershoppe.com/ , /about | HTML via urllib [Q] |
| S36 | TV Eye | https://www.tveyenyc.com/ | HTML via urllib [Q] |
| S37 | Trans-Pecos | https://www.thetranspecos.com/ | HTML via urllib [Q] |
| S38 | Wikipedia, *Ridgewood Savings Bank* | https://en.wikipedia.org/wiki/Ridgewood_Savings_Bank | **WebFetch summary only [Q-2nd]** |
| S39 | NYC Population by NTA (open data) | https://data.cityofnewyork.us/resource/swpk-hqdp.json | JSON API [Q] |
| S40 | DCP GeoSearch | https://geosearch.planninglabs.nyc/v2/search | JSON API [Q] |

---

## 5. THE COUNTY LINE — the defining subject of this page

### 5.1 That Ridgewood straddled the border

**F016** [Q] LPC's *Ridgewood Theater* report opens its history section:
`"Located in western Queens County, the town of Ridgewood originally spanned the Brooklyn-Queens
border. Part of the town was located in the eastern end of Bushwick, Brooklyn while another section
was part of the adjacent town of Newtown, one of the original three towns of Queens County."` — S1

**F017** [Q] LPC's *Central Ridgewood* report: `"Located in western Queens County, Ridgewood
originally spanned the Brooklyn-Queens border, an area that was inhabited by the Mespachtes Indians
prior to being settled by Europeans. The high, thickly wooded terrain is part of the terminal
moraine that runs through Ridgewood and continues east through the center of Long Island."` — S7

**F018** [Q] LPC's *Stockholm Street* report: `"Located in western Queens County, Ridgewood shares
much of its history and character with the adjacent neighborhood of Bushwick, Brooklyn."` — S4

**F019** [Q-2nd] Wikipedia states Ridgewood borders Maspeth (north), Middle Village (east), Glendale
(southeast), and — in Brooklyn — Bushwick (southwest) and East Williamsburg (west), and that
`"Historically, the neighborhood straddled the Queens-Brooklyn boundary."` — S22

**F020** [Q] NYC Parks' Benninger Playground sign gives an explicit boundary description:
`"Benninger Playground is located in Ridgewood, a neighborhood that straddles the Brooklyn-Queens
border near Myrtle Avenue. The community is bounded by Metropolitan Avenue to the north, the Long
Island Railroad to the east, Central Avenue to the south, and Flushing Avenue to the west."` — S14
*(Finder note: this is the only four-sided boundary definition I found from an agency source. It
does not obviously match the NTA polygon. Flagged for the verifier, not resolved.)*

### 5.2 THE ONDERDONK HOUSE COUNTY-SWITCH — three agencies, three incompatible stories

This is the sharpest source conflict in the file and it sits exactly on the wave's central hazard.

**F021a** [Q] **LPC (1995)** says the 1769 survey put the house **in Bushwick**, and that a **1937**
state action moved it to Queens:
`"reference is usually made to the survey in January of 1769 that established a boundary line
between Kings and Queens Counties in the Bushwick-Newtown area (placing the house in Bush wick)."`
and, separately, `"In 1937 a county boundary adjustment by the State of New York placed the
Onderdonk House in Queens."` and `"At that time she documented forty structures in Brooklyn,
including the Onderdonk House (which, due to a boundary change, had been placed in Queens in
1937)."` — S2
*(The `"Bush wick"` spacing is an artifact of the PDF text layer, not my transcription.)*

**F021b** [Q] **NYC Parks (Benninger sign)** says the **1769** rock settled it **for Queens**:
`"In 1769, English colonists settled the dispute by placing the 'Arbitration Rock' at the
intersection of Montrose and Onderdonk Avenues, officially defining Ridgewood as a part of
Queens."` — S14

**F021c** [Q] **GRHS (the museum)** says only that the house was a *marker* in the 1769 settlement,
taking no position on which side it fell:
`"The building was a prominent marker in the 1769 settlement of the boundary dispute between
Bushwick in Kings County and Newtown in Queens County."` — S19

**Finder note, not a verdict:** F021a and F021b **cannot both be right**. LPC says 1769 put the
house in Brooklyn and 1937 moved it to Queens; NYC Parks says 1769 itself "officially defin[ed]
Ridgewood as a part of Queens." A page that asserts either without hedging is asserting against a
city agency. **I am not resolving this.**

**F021d** [Q-2nd] Wikipedia adds a *third* boundary event, in 1925, with figures:
the boundary was `"adapted to the street grid, resulting in a zig-zag pattern"`, which reassigned
`"2,543 persons' addresses...from Queens to Brooklyn, and 135 persons' addresses...from Brooklyn to
Queens."` — S22 **[Q-2nd — the ellipses are in the tool's output, not mine; re-read before use.]**

### 5.3 THE NAME — two incompatible etymologies

**F022** [Q] **LPC (Stockholm Street, footnote 2)** derives the name from the **reservoir**:
`"Ridgewood was named for the reservoir, built in 1856-59 by the City of Brooklyn, located on the
glacial ridge formed by the Long Island terminal moraine. The reservoir was located in the
present-day Highland Park on the south side of Ridgewood."` — S4

**F023** [Q] **NYC Parks (Rosemary's Playground)** derives it from the **terrain**:
`"The English named the region for its high wooded terrain."` — S10

**F024** [Q] **NYC Parks (Evergreen Park)** agrees with the terrain reading:
`"In the early 18th century, the English settled in Ridgewood and named it after the prominent
topographical feature."` — S15

**Finder note:** F022 vs F023/F024 is a real disagreement, and F022 is the awkward one because the
reservoir it names is **Brooklyn's shipped place** (F010). The etymology can be stated; the
reservoir cannot be claimed.

**F025** [Q] NYC Parks records a period when the neighborhood went by a different name entirely:
`"From the end of the 19th century to close of World War I, the neighborhood was often known as
'Evergreen,' after the Cemetery of the Evergreens. The town opted for this name because a Long
Island community had already claimed the name Ridgewood for its own, and residents wanted to avoid
confusion about their neighborhood."` — S15

### 5.4 THE ZIP CODE 11385 STORY

**F026** [Q-2nd] Wikipedia: Ridgewood originally shared ZIP **11237** with Bushwick and sought
separation after the 1977 blackout, when `"newspapers around the country published...photos of
Bushwick residents with stolen items."` After Rep. Geraldine Ferraro's intervention residents
voted, `"93 percent of the returned ballots voted for the change,"` and **ZIP 11385 took effect
January 13, 1980.** — S22
**[Q-2nd — high-salience claim, entirely unverified, ellipsis is the tool's. The verifier must
re-read the article and its cited sources before any of this ships.]**

**F027** [P] **11385 is not a proxy for Ridgewood and must never be used as one.** In the NYC Parks
properties dataset, ZIP 11385 covers parks that Method B places in **Glendale** (`"Uncle" Vito F.
Maranzano Glendale Playground`, `Drumm Triangle`, `Glendale Veterans Triangle`, `Pinocchio
Playground`) as well as parks it places in Ridgewood. — S17
*(This is precisely the "sources use ZIP 11385 loosely" hazard the brief names.)*

**F028** [P] A pleasing corroboration of the Ferraro story that I found in a different dataset: the
DOE lists `A.C.E. Academy for Scholars at the Geraldine Ferraro Campus`, **55-20 Metropolitan
Avenue**, `nta = Ridgewood`. — S25

---

## 6. HISTORY — development, immigration, industry

**F029** [Q] LPC on the colonial farms: `"During the 17th and 18th centuries, farms in Bushwick and
Ridgewood were farmed by Dutch and British families, who grew lettuce, corn, potatoes, cauliflower,
and a variety of fruits for urban markets in Brooklyn and Manhattan."` and `"There were only five
farms in Ridgewood at the start of the American Revolution, along with a small burial ground.
During this period and for some years thereafter, some of the farmers owned slaves. After they were
freed, some of these African-American people stayed in the area and became prominent in local
affairs."` — S1

**F030** [Q] LPC connects the stone construction to slaveholding:
`"Several early scholars of eighteenth-century Dutch-American houses have made a correlation
between the use of stone and presence of slave labor, and both van Endes are known to have been
slave owners. (Kings County in the late-eighteenth century had the largest percentage of slaves
outside of the South, with the Dutch, who were mostly farmers, being the main slave owners.)"` — S2

**F031** [Q] LPC on the breweries: `"The discovery of pure ground water in Bushwick in the
mid-19th century spurred the construction of several breweries, most of which were owned by German
immigrants and staffed by a German work force. By 1880, at least eleven breweries, including
Rheingold, were operating within a fourteen block area in western Bushwick, known as 'brewer's
row,' and other industrious German immigrants opened factories and knitting mills in the area."`
— S1
*(Finder note: LPC places brewer's row in **western Bushwick, Brooklyn** — not in Ridgewood.
Wikipedia's phrasing [Q-2nd] is `"By 1880, there were 35 breweries in Brooklyn, including a 14-block
'brewer's row' within Bushwick."` — S22. The brewery heritage is adjacent context, not a Ridgewood
asset, and a draft that relocates brewer's row into Ridgewood would be asserting against LPC.)*

**F032** [Q] LPC's *Stockholm Street* variant names a second brewer and different transit dates:
`"By 1880, at least eleven breweries, including Rheingold and Schaefer, were operating within a
fourteen block area in western Bushwick, known as 'brewer's row'"`, and `"The Myrtle Avenue horsecar
line was extended east to Broadway in 1855, while the elevated rapid transit line reached Broadway
in 1879."` — S4

**F033** [Q] LPC on the old roads: `"Myrtle and Metropolitan Avenues and Fresh Pond Road are among
the oldest streets in Ridgewood, having originally been Native American trails and then used by
Long Island farmers to take their products to market. Stagecoaches and horsecars ran along Myrtle
Avenue (also called Jamaica Plank Road) which extended from the Brooklyn Bridge to Jamaica
Avenue."` — S1

**F034** [Q] LPC on the pleasure grounds: `"A number of picnic grounds, beer gardens, amusement
parks, and racetracks opened amidst Ridgewood's fields and farming villages towards the end of the
nineteenth century, catering especially to the large German population of Bushwick. These areas
provided open space for many people who otherwise spent their time in crowded tenements. German
shooting clubs also provided a popular pastime."` — S1

**F035** [Q] LPC on the turn: `"Ridgewood remained largely rural however, until after the
consolidation of the City of New York in 1898, just as the last vacant land in Bushwick was being
developed. By the turn of the century, Bushwick's builders began purchasing Ridgewood's farms,
parks, and racetracks."` — S1

**F036** [Q] LPC on the scale of the boom: `"From the turn of the century to World War I, over 5,000
new structures were constructed in Ridgewood."` — S1 (The *Stockholm Street* report words it
`"From the turn of the century to World War I, over 5,000 structures were built in Ridgewood."`
— S4)

**F037** [Q] LPC quotes the WPA Guide's verdict and records the address vote:
`"The WPA Guide called the area 'old-fashioned and respectable.' In the 1960s and 70s, as other
parts of Bushwick deteriorated, the residents of Ridgewood voted to change their address to
Queens."` — S1

**F038** [Q] LPC on why Germans moved east: `"Located adjacent to Brooklyn's Eastern District (which
contained the communities of Bushwick, Williamsburg and Greenpoint), Ridgewood became an ideal
location for upwardly mobile German-Americans to relocate, away from the over-crowding and more
recent immigrants inhabiting Bushwick and Williamsburg, as well as Lower East Side."` — S5

**F039** [Q-2nd] Wikipedia on the Gottscheers: `"After World War I, the population expanded with an
influx of Gottscheers, an ethnic German population from Slovenia."` It lists 1920s residents as
German, Austrian, Italian, Hungarian, Irish, Polish and Swedish, and later arrivals as Romanian,
Serb, Puerto Rican, Polish, Dominican, Ecuadorian, Chinese and Korean. — S22

**F040** [Q] NYC Parks on the later waves: `"More recent immigrants have included people from
Eastern and Central Europe, Asia, and Latin America."` — S10; and `"Ridgewood has remained
primarily working class, and has recently attracted large numbers of Asian and Latin American
immigrants."` — S15

---

## 7. THE HISTORIC DISTRICTS — Ridgewood's single richest vein

### 7.1 The four NYC (LPC) historic districts

**F041** [Q] From the LPC Historic Districts dataset, the four Ridgewood districts and their
LP numbers / designation dates: — S9

| District | LP number | Calendared | **Designated** |
|---|---|---|---|
| Stockholm Street Historic District | LP-02081 | 2000-09-12 | **2000-11-28** |
| Ridgewood North Historic District | LP-02319 | 2008-10-28 | **2009-09-15** |
| Ridgewood South Historic District | LP-02348 | 2009-04-14 | **2010-10-26** |
| Central Ridgewood Historic District | LP-02448 | 2010-10-26 | **2014-12-09** |

*(Finder note: these are the only four Queens LPC districts in CD5 in the dataset. The dataset's
`borough` field is `QN` for all four.)*

**F042** [Q] **Stockholm Street HD** — `"The Stockholm Street Historic District, located in the
western part of Ridgewood, Queens, is a one-block ensemble of brick row houses representing one of
the most intact, harmonious, and architecturally-distinguished enclaves of working-class dwellings
built in New York City during the early twentieth century. The historic district consists of
thirty-six houses, one former stable, and two garages, lining both sides of a brick-paved street.
Thirty-five of the houses were constructed between 1907 and 1910... The rows, which feature
full-width wooden porches with columns, projecting bays, uninterrupted cornice lines, and bricks
produced by the Kreischer Brick Manufacturing Company of Staten Island, were designed by the
architectural firm Louis Berger & Company and built by Joseph Weiss & Company. In addition, the
historic district has Ridgewood's only-extant brick street pavement."` — S4
*(Ellipsis mine, marking an omitted clause; the omitted words are
`"when Ridgewood was being developed by German-Americans and immigrants from Germany"`.)*

**F043** [Q] **Ridgewood North HD** — `"The Ridgewood North Historic District is significant as an
intact grouping of structures that reflect the development of model tenements in Ridgewood in the
early 20th century. A contiguous district in both typology and style, it is composed of 96
buildings, primarily three-story brick tenements, that encompass almost eight square acres in
southwest Queens. The tenements were constructed between 1908 and 1914, mainly by the G.X. Mathews
Company."` — S5

**F044** [Q] **Ridgewood South HD** — `"The Ridgewood South Historic District is significant as a
large, intact grouping of fully developed model tenements that reflect the development of Ridgewood
in the early 20th century. A contiguous district in both typology and style, it is composed of over
210 buildings, primarily three-story brick tenements, and the St. Matthias Roman Catholic Church
Complex. The tenements were constructed between 1911 and 1912 by the G.X. Mathews Company and were
designed by architect Louis Allmendinger."` — S6

**F045** [Q] Ridgewood South's body text gives a slightly different count and the street list:
`"The Ridgewood South Historic District comprises approximately 207 multi-family residential and
commercial buildings developed between 1900 and 1915, mainly by the G.X. Mathews Company, and the
four-building St. Matthias Roman Catholic Church complex. Located along Catalpa, Onderdonk, Putnam,
and Woodward avenues and Cornelia, Madison, and Woodbine streets, the district is located in
southwestern Ridgewood, close to the Brooklyn-Queens border."` — S6
*(Finder note: "over 210" in the summary vs "approximately 207" in the body. Same report. Record
both; do not average them.)*

**F046** [Q] **Central Ridgewood HD** — `"The Central Ridgewood Historic District is significant as
an intact grouping of approximately 990 buildings and sites, most of which are brick row houses,
representing one of the most harmonious, and architecturally-distinguished enclaves of working-class
dwellings built in New York City during the early twentieth century. The historic district is
located near the previously-designated Ridgewood South and Ridgewood North Historic Districts,
which are comprised mainly of small apartment houses. Most of the houses in the Central Ridgewood
Historic District were constructed between 1906 and the First World War by German-Americans and
immigrants from Germany."` — S7

### 7.2 The two builders and the brick — the material signature

**F047** [Q] **Gustave X. Mathews** and the "Mathews Model Flats":
`"German immigrant Gustave X. Mathews began building in Bushwick and Ridgewood in the first decade
of the 20th century. Using wider lots, large air shafts, private bathrooms, and limiting occupancy
to two families per floor, Mathews' 'cold-water flats' were a radical improvement to the
overcrowded tenement houses of Williamsburg and the Lower East Side... He built and sold over 300
tenements in Ridgewood between 1909 and 1912, receiving 25% the tenement house permits issued in
Queens in 1911. As testament to their improved design, the 'Mathews Model Flats' were exhibited by
the New York City Tenement House Department at the Panama-Pacific Fair in San Francisco in 1915."`
— S5 *(Ellipsis mine. The `"receiving 25% the"` phrasing — missing "of" — is the report's own.)*

**F048** [Q] **Louis Berger & Company** and **Paul Stier**:
`"Louis Berger & Company was the architect of record for over 5,000 buildings in the
Ridgewood-Bushwick area between 1895 and 1930. Born in 1875 in Rheinpfalz, Germany, Berger studied
architecture at Pratt Institute in Brooklyn and served as an apprentice with the firm Carrere &
Hastings before establishing his own business in Bushwick in 1895. Paul Stier, Ridgewood's biggest
builder, built over 2,000 houses in the area, including about half of the houses in the Central
Ridgewood Historic District."` — S7

**F049** [Q] **The 1905 masonry fire code and Kreischer brick**:
`"Most of the houses in the district were built after 1905 when the fire codes requiring masonry
construction for attached rows were extended into Ridgewood. The brick buildings in the historic
district have load-bearing masonry walls constructed of red-, buff-, amber- and brown-colored
Kreischer brick used in various combination from houses to house or row to row."` — S7
*(The `"from houses to house"` typo is the report's.)*

**F050** [Q] Ridgewood North on the same point: `"Built after 1905 when fire codes in Ridgewood
began requiring masonry construction for attached rows, the buildings have load-bearing masonry
walls constructed of light-colored Kreischer brick. Using mainly buff- and amber-colored brick, the
buildings have fine detailing in the Romanesque- and Renaissance-Revival styles."` — S5

**F051** [Q] The developers' pre-1905 practice: `"The developers built wood-frame houses until
1905"` — S4

### 7.3 The NRHP districts — and where the sources disagree about which neighborhood

**F052** [Q] From the **raw wikitext** of Wikipedia's Queens NRHP list, the rows whose `city` field
reads `Ridgewood, Queens`, with exact `refnum` and `date` values: — S23

| Name | Address (as printed) | Listed | Refnum |
|---|---|---|---|
| 68th Avenue-64th Place Historic District | Roughly 64th Pl. from Catalpa Ave. to 68th Ave. from 64th St. to 65th St. | 1983-09-30 | 83001763 |
| 75th Avenue-61st Street Historic District | 60th Lane, 60th and 62nd Sts. bounded by St. Felix, Myrtle, and Cooper Aves. | 1983-09-30 | 83001764 |
| Central Avenue Historic District | Roughly bounded by Myrtle and 70th Ave., and 65th and 66th Sts. | 1983-09-30 | 83001761 |
| Central Ridgewood Historic District | Roughly bounded by Fresh Pond Rd., Putnam, 68th, Forest, Catalpa, Onderdonk, and 71st Aves. | 1983-09-30 | 83001762 |
| Cooper Avenue Row Historic District | 6434-6446 Cooper Ave. | 1983-09-30 | 83001765 |
| Cornelia-Putnam Historic District | Residential rowhouses on Cornelia St. and Putnam Ave, bounded by Jefferson St., Wyckoff, and Myrtle Aves. | 1983-09-30 | 83001766 |
| Cypress Avenue East Historic District | Roughly bounded by Linden and Cornelia Sts., Seneca and St. Nicholas Aves. | 1983-09-30 | 83001767 |
| Cypress Avenue West Historic District | Roughly bounded by St. Nicholas and Seneca Aves., Linden and Stockholm Sts. | 1983-09-30 | 83001768 |
| Fresh Pond-Traffic Historic District | Roughly bounded by Fresh Pond Rd., Traffic Ave., Woodbine and Linden Sts. | 1983-09-30 | 83001770 |
| Madison-Putnam-60th Place Historic District | Roughly bounded by Woodbine St., 60th Pl., 67th and Forest Aves. | 1983-09-30 | 83001777 |
| Seneca Avenue East Historic District | Roughly Seneca Ave. E. between Hancock and Summerfield Sts. | 1983-09-30 | 83001778 |
| Stockholm-DeKalb-Hart Historic District | Roughly DeKalb and Woodward Aves., Stockholm and Hart Sts. | 1983-09-30 | 83004618 |
| Summerfield Street Row Historic District | 59-12 to 59-48 Summerfield St. | 1983-09-30 | 83001781 |
| **Ridgewood Fresh Pond Road-Myrtle Avenue Historic District** | Generally Fresh Pond Rd. and Myrtle Ave. | **2022-01-26** | 100007371 |
| **St. Matthias Roman Catholic Church Complex** | 58-15 Catalpa Ave. | **2012-9-4** | 12000599 |
| **Vander Ende-Onderdonk House Site** | 1820 Flushing Ave. | **1977-01-31** | 77000975 |
| Evergreens Cemetery | 1629 Bushwick Ave. | 2007-11-15 | 07001192 |

**F053** [P] **The 2022 listing is the freshest material on this page and is absent from every
narrative source I read.** `Ridgewood Fresh Pond Road-Myrtle Avenue Historic District`,
refnum `100007371`, listed **2022-01-26** — it does not appear in Wikipedia's *Ridgewood, Queens*
article's list of districts, nor in any LPC report (all of which predate it). Worth chasing the NPS
nomination document, which I did not have a URL for.

**F054** [P] **CONTESTED — Wikipedia's NRHP table assigns FOUR districts on classic Ridgewood
streets to `Middle Village, Queens`**, and both of my geographic methods disagree with it. Details
in §11. The four are: `Forest-Norman Historic District` (83001769),
`Grove-Linden-St. John's Historic District` (83001772),
`Seneca-Onderdonk-Woodward Historic District` (83001779),
`Woodbine-Palmetto-Gates Historic District` (83001783). — S23

**F055** [P] **The sharpest of the four:** `Woodbine-Palmetto-Gates Historic District`, which
Wikipedia places in Middle Village, covers `"Roughly bounded by Forest and Fairview Aves., Woodbine
and Linden Sts."` — the *same streets* as LPC's **Ridgewood North Historic District**, whose
building entries are `66-02 to 66-08 Forest Avenue`, `2027 to 2061 Gates Avenue`,
`652 to 658 Grandview Avenue`, `2001 to 2049 Palmetto Street`, `2001 to 2037 Woodbine Street`.
LPC calls that ground **Ridgewood**; Wikipedia's NRHP row calls it **Middle Village**. — S5, S23

**F056** [P] **CONTESTED IN THE OPPOSITE DIRECTION:** `Cooper Avenue Row Historic District`,
`6434-6446 Cooper Ave.`, which Wikipedia's table assigns to **Ridgewood**, resolves under **both**
of my methods to **Glendale** (Method A `neighbourhood = Fresh Pond`; Method B `QN0503 Glendale`).
— S23, S40, S3

**F057** [P] **CONTESTED:** `Evergreens Cemetery`, `1629 Bushwick Ave.`, is listed by Wikipedia's
NRHP table under `city = Ridgewood, Queens`. **Both my methods place it in Brooklyn** (Method B:
`BK0471 The Evergreens Cemetery`). NYC Parks describes it as `"located along Bushwick Avenue on the
Brooklyn-Queens border"` [Q] — S15. It is a Brooklyn cemetery and the Wikipedia locality field
looks simply wrong. Recorded, not resolved.

**F058** [Q] The size claim, from NYC Parks' Rosemary Gunning biography: through the Greater
Ridgewood Restoration Corporation `"she helped to place 3,982 local homes on the National Register
of Historic Places, making Ridgewood one of the largest federal historic districts in the
nation."` — S10

**F059** [Q] The BID's version of the same claim: the commercial buildings sit `"in an area that has
been designated as one of the largest Federal and State Historic Districts in the United States."`
— S27
*(Finder note: F058 and F059 are both hedged — "one of the largest". I found **no** source in this
corpus that says Ridgewood's is* the *largest NRHP district by building count. If a draft wants that
superlative it needs a source I did not find.)*

**F060** [Q] LPC cites the NRHP work as a named source: `"National Register of Historic Places,
Ridgewood Multiple Resource Area (Washington, D.C., 1983), report prepared by Donald G. Presa"` —
and Presa is also the author of LPC's own Stockholm Street report (`"Report researched and written
by Donald G. Presa"`). — S4

---

## 8. CANDIDATE PLACES

Every entry gives: the address as the source prints it, what each source says the neighborhood is,
Method A (GeoSearch), Method B (NTA2020 point-in-polygon), and any agency's own NTA field.

### 8.1 Vander Ende-Onderdonk House — the marquee subject

**F061** [Q] **LPC designation header:** `"ADRIAN AND ANN WYCKOFF ONDERDONK HOUSE, 1820-1836
Flushing Avenue, Borough of Queens. Built c. third quarter eighteenth century; reconstructed
1980-82, firm of Giorgio Cavaglieri, architects."` Landmark Site: `"Borough of Queens Tax Map Block
3412, Lot 1."` Designation List 262, **LP-1923, March 21, 1995.** — S2

**F062** [Q] **LPC open data** row: `lpc_name = "Adrian and Ann Wyckoff Onderdonk House"`,
`address = "1820 Flushing Avenue"`, `lpc_lpnumb = "LP-01923"`, `desdate = "3/21/1995"`,
`landmarkty = "Individual Landmark"`, `cd = "405"`, **`nta2020 = "QN0502"`**,
`bbl = "4034120001"`, coordinates `-73.9195883, 40.7108101`. — S8
**Method B on those exact agency coordinates: `QN0502 Ridgewood`. Method A on `1820 Flushing
Avenue`: `"1820 FLUSHING AVENUE, Ridgewood, NY, USA"`, `neighbourhood = Ridgewood`, `postalcode =
11385`. All three agree: Ridgewood.**

**F063** [Q] LPC's summary: `"The Onderdonk House, located on Flushing Avenue near the corner of
Onderdonk Avenue in an industrial section of Ridgewood, is, in part, a rare surviving
late-eighteenth-century Dutch-American farmhouse in the Borough of Queens, as well as one of the
few houses of eighteenth-century stone construction in New York City. In particular, it is one of
the city's very few eighteenth-century Dutch-American stone houses with a gambrel roof."` — S2

**F064** [Q] LPC on the near-loss and rescue: `"Nearly demolished in 1974, the one-and-a-half-story
house suffered a major fire in 1975, which destroyed most of its wooden elements. Saved through the
efforts of diligent local residents, the house was reconstructed for the Greater Ridgewood
Historical Society by the firm of Giorgio Cavaglieri in 1980-82, based largely on the recording of
the house by the Historic American Buildings Survey in 1936 and on surviving physical evidence
after the fire."` — S2

**F065** [Q] LPC on public access: `"The Onderdonk House is one of the very few Dutch-American
houses in New York City on its original site with a substantial parcel of land and with public
accessibility."` and `"it is operated as a house museum so that it is accessible to the public."`
— S2

**F066** [Q] LPC on the archaeology: `"the land around the house has yielded significant
archaeological resources of both prehistoric and historic periods."` The report lists **six**
investigations in the 1970s–80s and names a Native American find:
`"A grooved stone axe head, perhaps dating from 2500 years ago, was found near the southwestern
boundary of the Onderdonk House property."` It also notes `"historian Reginald P. Bolton in 1922
suggested that there was a village of the Rockaway tribe at this location."` — S2

**F067 — THE CONSTRUCTION DATE: FOUR SOURCES, FOUR ANSWERS.** *(Finder note: I am recording this
as a spread, not choosing.)*
- **[Q] LPC (1995):** `"Based on existing evidence, the house dates from about the third quarter of
  the eighteenth century"`; and the archaeology `"uncovered no historic artifacts or elements
  datable prior to the 1760s, with the possible exception of some chimney bricks."` — S2
- **[Q] LPC (Stockholm Street, 2000):** `"Built in the last quarter of the eighteenth century, the
  house was restored in 1980-82."` — S4 *(Note: LPC's own two reports say third quarter and last
  quarter.)*
- **[Q] GRHS (the museum):** `"The Vander Ende-Onderdonk House (c. 1709) is New York City's oldest
  Dutch fieldstone house"`; `"Built in 1709, The Vander Ende-Onderdonk House is one of the oldest
  structures in New York City"`; and `"In 1709, Paulus Vander Ende of Flatbush purchased the farm
  and began construction of the current house."` — S18, S19
- **[Q] NYC Parks (Starr Playground):** `"The Vander Ende-Onderdonk House, built by Paulus Vander
  Ende, in 1709 still stands today two blocks from this site."` — S11
- **[Q] NYC Parks (Clemens Triangle):** describes GRHS's goal as saving `"an abandoned farmhouse
  that dated to the 1600s"` — S16 **(a fifth, older date)**

**F068** [Q] What LPC actually says happened in 1709: `"The land changed hands several times prior
to 1709, when one hundred acres were purchased by Paulus van Ende and his wife, probably the former
Jannetje Hendricks, daughter of Hendrick Ryker. Born c. 1679 in Utrecht, the Netherlands, van Ende
was a descendant on his mother's side of the van Cortlandts, and was from Flatbush at the time of
the purchase."` — S2
*(Finder note: LPC treats 1709 as the* land purchase*; the museum and NYC Parks treat it as the*
construction*. That is very likely the whole origin of the disagreement, but it is the verifier's
call, not mine.)*

**F069** [Q] The earliest occupation: `"The earliest report of habitation by a Dutch settler on the
Onderdonk House tract was 1662 when Hendrick Barentse Smidt, a prosperous landowner and silversmith
whose name appears in many records of New Netherland, is recorded as having a house on his
property."` — S2. NYC Parks words it `"Around 1660, a parcel of Lenape land was granted to Hendrick
Barentz Smidt by Peter Stuyvesant."` — S11
*(Finder note: LPC says "Dutch settler"; NYC Parks says the land was **Lenape** and names Stuyvesant
as grantor. LPC elsewhere uses "Mespachtes Indians" for the area's inhabitants (F017). Three
different framings of the same ground; the "Lenape"/"Mespachtes" relationship is not explained by
any source I read.)*

**F070 — ARBITRATION ROCK IS ON THE MUSEUM'S GROUNDS.**
- **[Q] GRHS:** `"The site is also the location of Arbitration Rock."` — S18
- **[Q] GRHS, Plan a Visit:** `"Visitors can also walk the 2 acre grounds, enjoy our seasonal
  gardens, and see Arbitration Rock-the historic boundary between Brooklyn and Queens!"` — S20
- **[P]** LPC's 1995 report **does not mention Arbitration Rock at all** — I searched the full text
  for the string and found no hit. That is consistent with the rock having been moved to the site
  *after* 1995, but **I found no source that dates the relocation.** See §12; this is a real gap.
- **[Q] NYC Parks** puts the rock's *original* position at `"the intersection of Montrose and
  Onderdonk Avenues"` — S14 (F021b).

**F071 — VISITOR STATUS, AND IT IS CONTRADICTORY ON THE MUSEUM'S OWN SITE.**
- **[Q] `/plan-a-visit`:** `"Hours: Due to construction, the Museum will be temporarily closed for
  tours on Saturday and Sunday but we are open for public programming, in the back lawn and tent,
  including Harvest Festival, OHNY, Craft Workshops, Walking Tours and St. Nicholas Day."` and
  `"Tickets for Weekend Tours, are temporarily not available due to construction in the museum."`
  — S20
- **[Q] `/contact`, same site:** `"Public Hours Saturday & Sunday 12-5pm"` — S21
- **[P]** These contradict each other. The `/contact` page appears stale. **A draft must not
  publish "open Saturday and Sunday 12–5" as current.** Also `"There is an admission charge to
  enter the property (including the grounds)"` [Q] — S20, but **no price is given anywhere on the
  site.**
- **[Q] Directions, from the museum:** `"1820 Flushing Avenue, Ridgewood, Corner of Flushing and
  Onderdonk Avenues"`; `"Subway: L to Jefferson Street, then walk five blocks north along Flushing
  Avenue."`; `"Bus: Q54 to Flushing and Metropolitan Avenues. B57 to Flushing and Onderdonk
  Avenues"` — S20. Phone `(718) 456-1776` [Q] — S18.
- **[P] Note the museum directs visitors to a station in BROOKLYN (Jefferson Street, L).**

**F072** [Q] The museum's self-description of its position: `"With two acres of beautiful gardens
and historic architecture, the Vander Ende-Onderdonk House is a gem on the border of Ridgewood and
Bushwick."` and `"The Vander Ende-Onderdonk House, located in Ridgewood on the border of Queens and
Brooklyn, is the oldest Dutch Colonial stone house in New York City."` — S18, S19

**F073 — DESIGNATION DATES, and the museum contradicts the agencies twice.**
- **NRHP:** Wikipedia's raw NRHP row gives `refnum 77000975`, `date = 1977-01-31`, name
  `"Vander Ende-Onderdonk House Site"` [Q] — S23. GRHS's Facts page agrees on the year:
  `"In 1977, the House and property were listed on the National Register of Historic Places, and in
  1978, granted the same status on the New York State Register."` [Q] — S19. **But GRHS's own
  homepage says** `"The House was placed on the National Register of Historic Places in 1978"` [Q]
  — S18. *(The museum contradicts itself; NRHP's own refnum date supports 1977.)* LPC's
  bibliography cites `"'Onderdonk House Included On National Register,' Queens Ledger, Feb. 17,
  1977"` [Q] — S2, consistent with 1977.
- **NYC Landmark:** LPC's report and dataset both say **March 21, 1995** [Q] — S2, S8. **GRHS says**
  `"The House was given New York City landmark status in June of 1995."` [Q] — S19.
  *(March vs June. The agency's own designation list should win, but that is the verifier's call.)*

**F074** [Q] GRHS's founding and mission: `"The Greater Ridgewood Historical Society was established
in 1975 by a group of local residents to prevent the demolition of the Vander Ende Onderdonk House.
From 1975 until 1981, the GRHS raised funds to reconstruct the house which had been seriously
damaged by fire, and in 1976, published a history of the greater Ridgewood area, entitled Our
Community, Its History and People."` and `"With the help of Federal, State and local funds, the
Onderdonk House was opened to the public in 1982."` — S19

**F075** [Q] LPC's citation of that book gives its full subtitle, which is itself a comment on this
wave's geography: `"Walter J. Hutter et al, Our Community, Its History and People - Ridgewood,
Glendale, Maspeth, Middle Village, Liberty Park (New York: Greater Ridgewood Historical Society,
Inc., 1976)"` — S4

### 8.2 Ridgewood Theater Building

**F076** [Q] **LPC designation header:** `"RIDGEWOOD THEATER BUILDING, 55-27 Myrtle Avenue, Queens.
Built: 1916; Thomas W. Lamb, architect"`. Landmark Site `"Borough of Queens Tax Map: Block 3451,
Lot 7, in part, consisting of the front (southern) portion of the building facing on Myrtle Avenue"`.
**January 12, 2010, Designation List 425, LP-2325.** — S1

**F077** [Q] **LPC open data:** `lpc_name = "Ridgewood Theater Building"`, `address = "55-27 Myrtle
Avenue"`, `lpc_lpnumb = "LP-02325"`, `desdate = "1/12/2010"`, `cd = "405"`,
**`nta2020 = "QN0502"`**, `bbl = "4034510007"`, coordinates `-73.9074002, 40.7003955`. — S8
**Method B on those coordinates: `QN0502 Ridgewood`. Method A: `"55-27 MYRTLE AVENUE, Ridgewood,
NY, USA"`, `neighbourhood = Ridgewood`, `11385`. All three agree.**

**F078** [Q] LPC's summary: `"The Ridgewood Theater, constructed in 1916 in the rapidly developing
section of Ridgewood, was designed by prominent theater architect Thomas Lamb. The theater is
located on Myrtle Avenue, the area's major commercial thoroughfare, contributing to the creation of
a town center for the residents who were moving into the nearby rowhouse developments... This
theater showed movies continuously for more than 90 years, retaining its original use through
numerous changes in the presentation of movies and the interior environment of the theater,
including the addition of sound for 'talkies,' and in spite of the competition provided by
television and other forms of entertainment. It was one of the longest-running movie theaters in
the country when it closed in March, 2008."` — S1 *(Ellipsis mine.)*

**F079** [Q] On the façade: `"The theater's façade displays the Beaux-Arts training and skills of
architect Thomas Lamb in its straightforward design enhanced with classical and geometric elements
such as pilasters and heavily encrusted shields, created in glazed terra cotta. The building
retains a strong presence on the street as it rises above the neighboring structures, with its name
carved onto the building and its large projecting marquee advertising the wonders within."` — S1

**F080** [Q] On Lamb: `"Thomas W. Lamb (1871-1942), one of the best known of a small group of
American theater specialists and one of the world's most prolific theater architects, designed over
three hundred theater buildings in the United States and around the world, the majority of which
were movie theaters. Born in Dundee, Scotland, Lamb moved with his family by 1883 to New York
City... He enrolled in general science at the Cooper Union in 1894, graduated in 1898."` — S1
*(Ellipsis mine.)*

**F081** [Q] The 2009 hearing drew a notable coalition: `"There were sixteen speakers in favor of
designation, including the owner of the theater, a representative of Councilmember Diana Reyna,
representatives of the Queens Preservation Alliance, the Friends of Ridgewood Theater, the
Ridgewood Property Owners Association, the Ridgewood Development Corporation, the Four Borough
Preservation Alliance, the Municipal Art Society, the Historic Districts Council, the Society for
the Architecture of the City, and the Landmarks Conservancy. There were no speakers opposed to
designation. The Commission has also received several letters and emails in favor of designation,
including one from the great grandson of the architect, Thomas Lamb."` — S1

**F082** [P] **The building's current use is UNSOURCED in this file.** Both candidate Wikipedia
articles 404'd and I had no search budget. Wikipedia's *Ridgewood, Queens* article says only
[Q-2nd] that it `"operated as a 1,950-seat William Fox moviehouse until 2008"` — S22. **A draft
must not state what is in the building today.** See §12.

### 8.3 St. Matthias Roman Catholic Church Complex

**F083** [Q] **NRHP:** `name = "St. Matthias Roman Catholic Church Complex"`,
`address = "58-15 Catalpa Ave."`, `city = "Ridgewood, Queens"`, `date = "2012-9-4"`,
`refnum = "12000599"`. — S23
**Method A: `"58-15 CATALPA AVENUE, Ridgewood, NY, USA"`, `neighbourhood = Ridgewood`, `11385`.
Method B: `QN0502 Ridgewood`. Agree.**

**F084** [Q] **LPC** describes the complex inside the Ridgewood South district:
`"The St. Matthias Roman Catholic Church complex, which includes a cathedral, rectory, school and
convent, faces Catalpa Avenue at the eastern edge of the district. Constructed of pale yellow or
amber brick, these four buildings are architecturally congruous with the rest of the district and
are significant in the telling of Ridgewood's history and development. The first building, designed
by the prominent architect F.J. Berlenbach as a combined church and school, was erected on the
property in 1909 and is currently used as the school. As the congregation grew with the population
of the surrounding area, the grand cathedral—which was designed in the Italian Renaissance Revival
style—was completed in 1926."` — S6
*(Finder note: LPC calls it a "cathedral" twice. St. Matthias is a parish church, not a cathedral —
Brooklyn's cathedral is elsewhere. I record LPC's wording exactly and flag that repeating the word
"cathedral" would likely be an error. Wikipedia [Q-2nd] dates the church `1911-1912` — S22 — which
matches neither LPC date. Unresolved.)*

### 8.4 Parks — the full CB5 roster, both methods

**F085** [Q/P] Every NYC Parks property in Queens Community Board 405, with Method B run on the
**actual park polygon centroid** from the Parks GeoJSON. Parks whose polygon centroid falls in
`QN0502 Ridgewood`: — S17, S3

| Park (signname) | Address / location as Parks prints it | ZIP | Type | Acres | Method B |
|---|---|---|---|---|---|
| Rosemary's Playground | `751 WOODWARD AVENUE` / `Woodbine St., Madison St. bet. Woodward Ave. and Fairview Ave.` | 11385 | Jointly Operated Playground | 1.967 | **Ridgewood** |
| Starr Playground | `210 ONDERDONK AVENUE` / `Onderdonk Ave. bet. Starr St. and Willoughby Ave.` | 11385 | Playground | 0.9 | **Ridgewood** |
| Grover Cleveland Playground | `3-96 GRANDVIEW AVENUE` / `Stanhope St. bet. Fairvier Ave. and Grandview Ave.` | 11385 | Neighborhood Park | 5.1 | **Ridgewood** |
| Mafera Park | `65 PLACE AND SHALER AVENUE` / `65 Pl. bet. Shaler Ave. and the rail yards` | 11385 | Community Park | 5.4 | **Ridgewood** |
| Benninger Playground | `60-45 MADISON STREET` / `Madison St. bet. 60 Pl. and Fresh Pond Rd.` | 11385 | Playground | 0.574 | **Ridgewood** |
| Evergreen Park | `60-09 Saint Felix Avenue` / `St Felix Ave. bet. Seneca Ave. and 60 Pl.` | 11385 | Jointly Operated Playground | 3.32 | **Ridgewood** |
| Clemens Triangle | *(no street address)* / `Myrtle Ave., Cypress Ave., Cornelia St.` | 11385 | Triangle/Plaza | 0.01 | **Ridgewood** |
| Myrtle Avenue Clemens Triangle | *(no street address)* / `Myrtle Ave., Cypress Ave., Putnam Ave.` | 11385 | Triangle/Plaza | 0.013 | **Ridgewood** |

*(The `"Fairvier Ave."` typo in Grover Cleveland Playground's location string is the dataset's own.)*

**F086** [P] Parks in the same community board that Method B places **elsewhere**, recorded so the
verifier can see I did not cherry-pick: `"Uncle" Vito F. Maranzano Glendale Playground`,
`Drumm Triangle`, `Glendale Veterans Triangle`, `Pinocchio Playground` → **Glendale (QN0503)**;
`Reiff Playground`, `Frank Principe Park`, `Frontera Park`, `Federalist Triangle`, `Hull Triangle`,
`Luke J. Lang Square`, `Peter Chahales Park`, `Quick Brown Fox Triangle`, `Whitefish Triangle`,
`Technical Sergeant Thomas J. Davey Triangle`, `Park Slope` (sic) → **Maspeth (QN0501)**;
`Juniper Valley Park`, `Middle Village Playground`, `Middle Village Veterans Triangle` →
**Middle Village (QN0504)**. — S17, S3

**F087 — MAFERA PARK IS EXPLICITLY ON THE GLENDALE/RIDGEWOOD LINE, per NYC Parks itself.** [Q]
`"During its early years, the park was known variously as Farmers Oval, Ridgewood Park, and Glen
Ridge Park. The latter name refers to the park's location on the boundary between Glendale and
Ridgewood."` — S13 **This is the single most explicitly contested place in the file.**

**F088** [Q] Mafera Park's fuller history: `"For many years, this site has been called 'Farmers Oval'
in tribute to the Glendale Farmers Base Ball Club, a semi-professional team that was active from
the early 1900's through the 1950's. The Glendale Farmers played ball on this site for almost half
a century. In 1948 the City of New York acquired the site bounded by Lutheran Cemetery Branch of the
Brooklyn-Manhattan Transit line, the Manhattan Beach Division of the Long Island Railroad, the New
York Connecting Railroad, and 65th Place... Mayor William O'Dwyer, Queens Borough President James A.
Burke, and Parks Commissioner Robert Moses participated in the groundbreaking ceremony on June 28,
1949. One year later, the children of Ridgewood were able to enjoy the play equipment and the many
athletic facilities."` — S13 *(Ellipsis mine.)*

**F089** [Q] Mafera's namesake: `"In 1967 the official name was changed by law from Glenridge Park
to Joseph F. Mafera Park in memory of the Queens Democrat. A long-time Ridgewood resident, Mafera
(1895-1967) served in the American Expeditionary Forces during World War I... After the death of
Borough President Maurice A. Fitzgerald in August 1951, Mafera was chosen interim Queens Borough
President. He was an executive member of the Ridgewood Democratic Club."` — S13 *(Ellipsis mine.)*

**F090** [Q] **Starr Playground** — a Ridgewood park whose own sign is a Brooklyn-border story:
`"This playground is named for adjoining Starr Street, which runs from the adjacent neighborhood of
Bushwick, Brooklyn to Metropolitan Avenue a few blocks north of this playground."` Also:
`"The Vander Ende Farm stretched north to south from Flushing Avenue to Catalpa Street, running
along modern-day Onderdonk and Seneca Avenues."` and `"The City acquired this land in 1936 and
jurisdiction was transferred to Parks in two parcels between 1940 and 1942. Starr Playground opened
on Christmas Day in 1947."` and `"In 2022, renovations to the playground refurbished an existing
handball court and transformed what was a large asphalt area into a multi-purpose play area
featuring a walking circuit, high school size basketball court, two basketball half courts, an
ecuavolley court, and a community gathering area with seating."` — S11
*(Finder note: "ecuavolley" — an Ecuadorian variant of volleyball — is a nice, specific, current
detail reflecting F040's demographic shift, and it is in an agency source.)*

**F091** [Q] **Grover Cleveland Playground** — the Anawanda story:
`"In July 1924, the City acquired this land located at the intersection of Grandview and Fairview
Avenues and Stanhope Street, adjoining Linden Hill Cemetery. Developed in 1927-1928, the park
contained two playgrounds, three tennis courts, two basketball courts, and a public restroom.
Ridgewood residents knew it as Anawanda Park, a name taken from a small political organization of
Tammany Hall-style politics proponents called the Anawanda Democratic Club (c.1921-1940s)... In
December 1939, this park's name was changed to Grover Cleveland Park amidst much controversy. The
anti-reformists of the Anawanda Democratic Club protested the renaming of 'their' park after New
York reformist president Grover Cleveland and their nearby rivals, the Grover Cleveland Democratic
Club."` — S12 *(Ellipsis mine.)*

**F092** [Q] **Rosemary's Playground** and **Rosemary R. Gunning**: `"This playground is located in
the Ridgewood neighborhood on the block bounded by Woodbine, Woodward, Madison, and Fairview
Avenues. Ridgewood Intermediate School 93 (I.S. 93), directly northeast of the playground, was
built in 1917, and the playground, jointly operated by Parks and the Board of Education, opened in
1962."` and `"Rosemary's Playground is named for one of Ridgewood's brightest political leaders, who
lived much of her life at 1867 Grove Street. Born in Brooklyn on February 7, 1905, Rosemary R.
Gunning (1905-1997) graduated from Richmond Hill High School in Queens in 1922... One year after she
attended the 1967 New York Constitutional Convention, Rosemary became the first woman to be elected
to the New York State Assembly from Queens."` — S10 *(Ellipsis mine. See also F058.)*

**F093** [Q] **Benninger Playground** namesake: `"Benninger Playground is named after former Queens
Parks Commissioner Albert C. Benninger (1885-1937). Benninger was born in the town of Germany,
Canada, and moved to the United States at the age of four... In 1905, after leaving the military,
Benninger moved to the Glendale section of Queens, New York."` — S14 *(Ellipsis mine. Note the
namesake is a **Glendale** resident; the park is in Ridgewood. Not a boundary dispute, but the kind
of detail that gets miscopied.)*

**F094** [Q] **Clemens Triangle** and the **Ridgewood Times**: `"This park, located in the Queens
neighborhood of Ridgewood, is named in honor of Carl E. Clemens (1908-1989), a community leader and
former owner of the newspaper The Ridgewood Times."` `"Schubel founded The Ridgewood Times, which
throughout its history has been dedicated to community affairs, in 1908. Schubel was fascinated by
the prospects of the revolutionary medium of radio, and in 1920, he expanded the newspaper to
include the new station WHN... The station's lack of success nearly bankrupted the paper, and
eventually Schubel sold WHN to Loew's Theaters."` `"The paper was renamed The Times Newsweekly in
1989."` `"Neighborhood residents, witnessing how the community's landlords would congregate at the
triangle to complain about the high cost of owning a building, had unofficially called the park
'Landlord Square.'"` — S16 *(Ellipsis mine.)*
*(Finder note: **WHN radio was founded in Ridgewood** by the local newspaper. That is a genuinely
striking fact and it is in an agency source. LPC's Stockholm Street bibliography independently cites
`"George Schubel, A History of Greater Ridgewood (New York: Ridgewood Times Publishing Co., 1912)"`
[Q] — S4, corroborating Schubel and the paper.)*

**F095** [Q] **Evergreen Park** — Parks explicitly assigns it to Ridgewood: `"Evergreen Park is
located in the Queens neighborhood of Ridgewood, bounded by Metropolitan Avenue and Evergreen
Cemetery. It is the Queens extension of the Brooklyn neighborhood of the same name."` and
`"The City of New York acquired the property for this park in January 1941... Part of the park is
jointly operated with the adjacent P.S. 68. The playground opened officially on January 11, 1943."`
— S15 *(Ellipsis mine.)* **CONTESTED: Method A returns `neighbourhood = Fresh Pond` for
`60-09 Saint Felix Avenue`; Method B and NYC Parks both say Ridgewood.**

### 8.5 Civic institutions

**F096** [Q] **Queens Public Library, Ridgewood branch** — from the Queens Library Branches
dataset: `name = "Ridgewood"`, `address = "20-12 Madison Street"`, `city = "Ridgewood"`,
`postcode = "11385"`, `borough = "QUEENS"`, `community_board = "405"`, **`nta = "QN0502"`**,
`bbl = "4034910001"`, `bin = "4083512"`, phone `"(718) 821-4770"`, branch URL
`https://www.queenslibrary.org/about-us/locations/ridgewood`. — S26
*(The same dataset carries a separate `"Glendale"` branch at `"78-60 73 Place"`, `nta = "QN0503"` —
a clean control showing the dataset distinguishes the two neighborhoods.)*

**F097** [Q] **Schools in the Ridgewood NTA** — every DOE location whose own `nta_name` field reads
`Ridgewood`; I ran Method B on the DOE's own coordinates for each and **all twelve agreed**: — S25

| DOE code | Name | Address | DOE `nta_name` | Method B |
|---|---|---|---|---|
| Q068 | P.S. 068 Cambridge | 59-09 SAINT FELIX AVENUE | Ridgewood | Ridgewood |
| Q071 | P.S. 071 Forest | 62-85 FOREST AVENUE | Ridgewood | Ridgewood |
| Q075 | Robert E. Peary School | 16-66 HANCOCK STREET | Ridgewood | Ridgewood |
| Q077 | I.S. 077 | 976 SENECA AVENUE | Ridgewood | Ridgewood |
| Q081 | P.S. 81Q Jean Paul Richter | 559 CYPRESS AVENUE | Ridgewood | Ridgewood |
| Q088 | P.S. 088 Seneca | 60-85 CATALPA AVENUE | Ridgewood | Ridgewood |
| Q093 | I.S. 093 Ridgewood | 66-56 FOREST AVENUE | Ridgewood | Ridgewood |
| Q239 | P.S. 239 | 17-15 WEIRFIELD STREET | Ridgewood | Ridgewood |
| Q290 | A.C.E. Academy for Scholars at the Geraldine Ferraro Campus | 55-20 METROPOLITAN AVENUE | Ridgewood | Ridgewood |
| Q298 | **Middle Village Prep Charter School** | 68-02 METROPOLITAN AVENUE | **Ridgewood** | **Ridgewood** |
| Q305 | Learners and Leaders | 378 SENECA AVENUE | Ridgewood | Ridgewood |
| Q485 | **Grover Cleveland High School** | **21-27 HIMROD STREET** | **Ridgewood** | **Ridgewood** |

*(F097 resolves F001: the DOE's own NTA field and Method B both say Ridgewood for Grover Cleveland
High School; only the GeoSearch geocoder said Bushwick, Brooklyn. Q298 is the name-vs-location trap
of F012. `P.S. 81Q` is named for **Jean Paul Richter**, a German writer — a small artifact of the
neighborhood's German history that sits in a city dataset.)*

**F098** [Q] **Myrtle Avenue BID (Queens)** — the City's BID directory record, quoted in full
because it is simultaneously the best commercial-district source and a contested-assignment
specimen: `org_name = "Myrtle Avenue (Queens)"`, `org_address = "c/o Ridgewood LDC"`,
`org_address2 = "62-14 Myrtle Avenue"`, **`org_city = "Glendale"`**, `org_zip = "11385"`,
`boro_id = "Queens"`, **`org_neighborhood = "Ridgewood"`**, `org_year = "July  1988"`,
`org_blocks = "32"`, `org_businesses = "333"`, `org_website = "www.ridgewood-ny.com"`,
`org_boundary = "Myrtle Avenue from Wyckoff Avenue to Fresh Pond Road and contiguous side streets
including triangle parks"`. — S27
**The City's own single record says `city = Glendale` and `neighborhood = Ridgewood`. Method A on
`62-14 Myrtle Avenue` returns `neighbourhood = Fresh Pond`; Method B returns `QN0503 Glendale`.
Three readings, three answers, in one record.**

**F099** [Q] The BID record's market description — the best single sentence in the corpus on why
this wave is hard: `"Myrtle Avenue, a major thoroughfare, which crosses Queens and Brooklyn, is the
retail commercial center of Greater Ridgewood. The market area includes the neighborhoods of
Ridgewood, Glendale, Middle Village, and Maspeth in Queens and Ridgewood/Bushwick in Brooklyn and
serves approximately 250,000 shoppers. The over 300 retail and service establishments occupy the
ground floors of the three-story brick buildings in an area that has been designated as one of the
largest Federal and State Historic Districts in the United States. Some areas also have New York
City Landmarks designation. Original architectural features representing Romanesque and Renaissance
Revival styles abound. Tree lined streets shelter rows of well maintained brick homes and brownstone
elements and apartment buildings."` — S27
*(Note `"Ridgewood/Bushwick in Brooklyn"` — the City's own BID record uses "Ridgewood" as a name for
part of **Brooklyn**. That is the brief's hazard, stated by a city agency.)*

**F100** [Q] The BID's **own** site self-locates in Ridgewood, disagreeing with the City's `org_city`
field: `"Welcome to Myrtle Avenue Ridgewood, NY"` and `"The Myrtle Avenue Business Improvement
District (BID) was established in 1988. Our organization helps to make Myrtle Avenue, from Wyckoff
Avenue to Fresh Pond Road in Ridgewood, a great place to shop and do business by keeping the streets
clean, safe, green and lively with programs and events."` — S28

**F101** [P] **TRAP — there are two "Myrtle Avenue" BIDs and the Brooklyn one is not Ridgewood's.**
The same City directory lists `org_name = "Myrtle Avenue Brooklyn Partnership"`,
`org_address = "472 Myrtle Avenue"`, `org_city = "Brooklyn"`, `org_zip = "11205"`,
`org_website = "www.myrtleavenue.org"`, boundary `"Myrtle Avenue from Flatbush Avenue Extension to
Classon Aven[ue]"` [Q] — S27. I fetched `myrtleavenue.org` and it is the Fort Greene / Clinton Hill
organization, not Ridgewood's. **Ridgewood's BID is `ridgewood-ny.com`.** A draft that cites
`myrtleavenue.org` for Ridgewood would be citing the wrong borough's BID.

**F102** [Q-2nd] **Ridgewood Savings Bank** — main office: cornerstone **1929**, architects
`"Halsey, McCormack and Helmer, Inc."`, at the Myrtle/Forest Avenue intersection, and the article
reports the bank was founded `"June 18, 1921"` with total assets of `"$6.8 billion"`. The **Forest
Hills branch** opened 1940 at Queens Boulevard and 108th Street and was `"designated a New York City
Landmark in 2000"`; the Ridgewood main office is **not** itself a designated landmark. — S38
**[Q-2nd — every figure here is unverified. The founding date, the assets figure and the architect
attribution all need re-reading before use.]**

**F103** [Q-2nd] Wikipedia's *Ridgewood, Queens* article separately describes the bank as
`"the largest mutual savings bank in New York State"`, opening its limestone headquarters at Myrtle
and Forest Avenues in 1929. — S22 **[Q-2nd; superlative claim, unverified.]**

**F104** [P] **Method A on `71-02 Forest Avenue`** (the address I used for the main office) returns
`"71-02 FOREST AVENUE, Ridgewood, NY, USA"`, `neighbourhood = Ridgewood`, `11385`. **But I could not
confirm from any source that `71-02 Forest Avenue` is the bank's actual street number** — I
constructed it. **The verifier must establish the real address before any place record is
created.** It is absent from the LPC individual-landmark dataset (consistent with F102's "not
designated").

### 8.6 Food, drink and nightlife

**Sourcing status is stated explicitly for each, per the brief.**

**F105** [Q] **Gottscheer Hall**, `657 Fairview Ave, Ridgewood` (from the site's own footer).
Own words: `"Long-standing tavern in Ridgewood, NY serving domestic & imported beers alongside a
small menu of German pub eats."` and `"Serving Queens and the surrounding NYC area since 1924,
Gottscheer Hall knows what it takes to make our customers happy. After all, we've been doing it for
almost 100 years!"` Hours as posted: `"Monday Closed / Tuesday 4:00 PM — Close / Wednesday 4:00 PM
— Close / Thursday 4:00 PM — Close / Friday 4:00 PM — Close / Saturday 1:00 PM — Close / Sunday
1:00 PM — Close"`. It advertises a `"Beer Garden!"` that `"Opens in May"` and a banquet hall for
`"events from 15 to 300 guests"`. — S32
**SOURCING: own website AND DOHMH. NOT DOHMH-only.** DOHMH row: `dba = "GOTTSCHEER HALL"`,
`building = "657"`, `street = "FAIRVIEW AVENUE"`, `boro = "Queens"`,
`cuisine_description = "German"`. — S29
**Method A: `"657 FAIRVIEW AVENUE, Ridgewood, NY, USA"`, `neighbourhood = Ridgewood`, `11385`.**
*(Finder note: the site carries a long "A HISTORY OF GOTTSCHEE" essay tracing the Gottscheer people
to a 1247 grant by `"Patriarch Berthold, Archbishop of Aquileja"` in `"the province of Krain, today
Slovenia"` [Q] — S32. That connects directly to F039's Gottscheer migration and is the strongest
living link to it that I found.)*

**F106** [Q] **Rudy's Bakery and Café**, `905 Seneca Avenue, Ridgewood, NY 11385`, phone
`(718) 821-5890`. Own words: `"A Ridgewood landmark since 1934, Rudy's brings you old world charm
with a modern flair."`; `"Rudy's opened in 1934, and for more than 80 years we've stayed true to our
roots. We're still serving old-world favorites like Beinenstich, Strudel and our famous Black Forest
Cake"`; `"Located in the heart of Historic Ridgewood, Queens"`. Owner: `"Antonetta Binanti, or
'Toni' as she's affectionately known to her friends, was born in a small town near Naples, Italy...
When Difonzo purchased Rudy's Bakery, in Ridgewood, in the early 1980's, Toni continued to work at
his side."` — S33 *(Ellipsis mine.)*
**SOURCING: own website AND DOHMH. NOT DOHMH-only.** DOHMH: `dba = "RUDY'S BAKERY"`,
`building = "905"`, `street = "SENECA AVENUE"`, `boro = "Queens"`,
`cuisine_description = "Bakery Products/Desserts"`. — S29
**CAUTION [P]:** the site is at **`rudysbakeryandcafe.com`**; `rudysbakerycafe.com` does not
resolve. The site's footer reads `"© Rudy's Bakery & Café 2022"` and it posts **two different sets
of hours on the same page** (`"Monday through Saturday from 6:00 AM to 8:00 PM, and on Sunday from
7:00 AM to 6:00 PM"` in the body vs `"Mon – Tues from 6:00 AM to 4:00 PM / Wed – Sat from 6:00 AM to
7:00 PM / Sunday from 7:00 AM to 5:00 PM"` in the sidebar) [Q]. **Do not publish hours from this
source.**

**F107** [Q] **Rolo's**, `853 onderdonk ave ridgewood, nyc 11385`, self-described in its page title
as `"Rolo's | Neighborhood Wood-Fired Bar & Grill in Ridgewood, Queens"`. — S34
**SOURCING: own website AND DOHMH. NOT DOHMH-only.** DOHMH: `dba = "ROLO'S"`, `building = "853"`,
`street = "ONDERDONK AVENUE"`, `boro = "Queens"`, `cuisine_description = "Italian"`. — S29

**F108** [Q] **Onderdonk Cafe** — **DOHMH-ONLY.** The *only* source I have is the DOHMH inspection
dataset: `dba = "ONDERDONK CAFE"`, `building = "353"`, `street = "ONDERDONK AVENUE"`,
`boro = "Queens"`, `cuisine_description = "Coffee/Tea"`. — S29 **I found no website, no article and
no institutional page. Per the brief this constrains what may be written: existence and cuisine
category at an address, nothing more — and a DOHMH row does not prove a business is currently
open.**

**F109** [P] **Norma's — DO NOT ASSERT A RIDGEWOOD LOCATION.** The site says
`"Norma's Bakery & Cafe serving coffee, baked goods and laughs since 2012 in ridgewood & growing"`
[Q] and its origin story names founders `"Denise Plowman and Crystal River Williams"` who in 2012
`"emptied their savings accounts, maxed out their credit cards, and sawed down the old awning with
a steak knife duct taped to a broomstick"` [Q] — S35. **But the site's "choose a location" module
lists only `Wappingers Falls, 2648-2650 E Main St., Wappingers Falls, NY 12590`** [Q], gives **no
Ridgewood street address**, and **no `NORMA*` business in ZIP 11385 appears in DOHMH** — S29.
**The Ridgewood shop may have closed. A draft must not list it as an open Ridgewood business.**

**F110** [P] **Morscher's Pork Store — UNUSABLE SOURCE, DO NOT CITE.** `morschersporkstore.com`
now serves an Australian online-casino affiliate page (`"Best Online Casino Australia - Top Real
Money Casino 2026"`) [Q] — the domain has lapsed and been re-registered by a spam operator. No
`MORSCHER*` row appears in DOHMH ZIP 11385 (plausible for a retail butcher, which may fall under
DCWP rather than DOHMH). **I have no usable source for this business at all.**

**F111** [Q] **TV Eye** — self-described in its own page title as a
`"Performance & Event Venue. Funhaus, bar, venue, discotheque, gallery, & eatery on
Ridgewood/Bushwick border!"` and as `"A funhaus – venue, bar, dance club, gallery, and eatery"`.
— S36 **CONTESTED BY ITS OWN WORDS.** Method A/B on `1647 Weirfield Street`: both **Ridgewood**.
*(I did not find the address printed on the site itself — I supplied it. Verify.)*

**F112** [Q] **Trans-Pecos** — own site: `"ALL AGES VENUE AND COMMUNITY RESOURCE CENTER LOCATED ON
THE BUSHWICK x RIDGEWOOD BORDER"`, with the address printed two ways in its own footer:
`"915 Wyckoff Ave. Queens NY"` and `"915 WYCKOFF AVENUE RIDGEWOOD NY"`. — S37
**CONTESTED BY ITS OWN WORDS.** Method A/B: both **Ridgewood**.
*(Finder note: Wyckoff Avenue* is *the county line at this point per F014, so a venue addressed on
Wyckoff Avenue is definitionally a border case.)*

**F113** [P] **Nowadays**, `56-06 Cooper Avenue` — Method A and B both return **Ridgewood**, but
`nowadays.nyc` served me a near-empty navigation shell (199 characters of text; no address, no
hours) and I could **not** confirm the address or the venue's existence from its own site. **The
geocode proves the address exists, not that the business is there.** Treat as unconfirmed.

**F114** [P] **A general caution on §8.6:** for TV Eye, Trans-Pecos and Nowadays I geocoded
addresses I supplied from memory rather than reading them off a source. **Geocoding an address I
invented is not evidence that a business occupies it.** With no search budget I could not
independently establish these addresses. The verifier should treat all three addresses as
unsourced.

---

## 9. TRANSIT

**F115** [Q] From the MTA's own subway-station dataset, the stations at issue, with the MTA's own
`borough` field: — S24

| Station | Routes | MTA `borough` | Line | Method B (on MTA's coordinates) |
|---|---|---|---|---|
| Fresh Pond Rd | M | **Q** | Myrtle Av | **Ridgewood (QN0502)** |
| Forest Av | M | **Q** | Myrtle Av | **Ridgewood (QN0502)** |
| Seneca Av | M | **Q** | Myrtle Av | **Ridgewood (QN0502)** |
| Halsey St | L | **Q** | Canarsie | **Ridgewood (QN0502)** |
| Myrtle-Wyckoff Avs | M | **Bk** | Myrtle Av | Bushwick (East) (BK0402) |
| Myrtle-Wyckoff Avs | L | **Bk** | Canarsie | Bushwick (East) (BK0402) |
| Knickerbocker Av | M | Bk | Myrtle Av | Bushwick (West) (BK0401) |
| DeKalb Av | L | Bk | Canarsie | Bushwick (West) (BK0401) |
| Central Av | M | Bk | Myrtle Av | Bushwick (West) (BK0401) |

**F116** [P] **The two methods agree on every one of the nine stations.** Ridgewood's own stations
are **Fresh Pond Road, Forest Avenue and Seneca Avenue on the M, plus Halsey Street on the L.**

**F117** [P] **MYRTLE–WYCKOFF IS BROOKLYN'S BY EVERY SOURCE I HAVE, AND BROOKLYN HAS ALREADY
WRITTEN IT.** MTA's `borough` field says `Bk`; Method B says `BK0402 Bushwick (East)`; and
`bushwick.json` already narrates it in shipped prose (F014). It is nonetheless the station most
people would use to reach Ridgewood, and it is the M/L transfer. **This is a routing problem, not
an ownership one** — the same shape as the wave-3 guidance that linking routes the reader while
narrating does not.

**F118** [Q] LPC on the elevated's arrival and extension — with **three different date sets across
three reports**, which the verifier should reconcile:
- *Ridgewood Theater*: `"The elevated rapid transit line ran to Wyckoff Avenue along the
  Brooklyn/Queens border beginning in 1888 and was extended to Fresh Pond Road beginning in 1915."`
  — S1
- *Stockholm Street*: `"the arrival in 1888 of the elevated rapid transit line, which terminated at
  Wyckoff Avenue along the Brooklyn/Queens border, and the extension of the electrified trolley from
  Bushwick to Fresh Pond Road in Ridgewood in 1894."` — S4
- *Ridgewood North* and *Central Ridgewood*: `"the 'El' was extended from its original terminus at
  Myrtle and Wyckoff Avenues to Fresh Pond Road and 67th Avenue in 1915."` — S5, S7
- *Ridgewood Theater* also has `"The first railroad to reach the area, in 1878, was the New York
  Connecting Railroad Extension (once the Manhattan Beach Railroad), running from Brooklyn through
  Ridgewood to the Brooklyn seashore."` — S1

**F119** [Q] The trolley as the development trigger: `"Denser building activity had begun with the
coming of the electric trolley in 1894, and after 1898, Ridgewood was subjected to the eastward
expansion of a growing New York City."` — S5

**F120** [Q-2nd] Wikipedia lists the Ridgewood bus terminal as serving `B13, B26, B52, B54, Q55,
Q58, Q98`, plus `B20, B38, B57, Q14, Q38, Q39, Q54, Q67`, and names the **Fresh Pond Bus Depot**.
— S22 **[Q-2nd — unverified; bus route lists go stale fast and this one should be checked against
the MTA before publication.]**

**F121** [Q] Two bus routes are independently corroborated by the Onderdonk House's own directions:
`"Bus: Q54 to Flushing and Metropolitan Avenues. B57 to Flushing and Onderdonk Avenues"` — S20.
*(Note the B-prefix routes: Brooklyn buses serve Ridgewood, another artifact of the border.)*

---

## 10. DEMOGRAPHICS

**F122** [Q] NYC's population-by-NTA dataset (2010 NTA boundaries, code `QN20 Ridgewood`):
**2000 = 69,455**; **2010 = 69,317**. For comparison in the same wave: `QN19 Glendale` 31,071 →
32,496; `QN30 Maspeth` 28,916 → 30,516. — S39

**F123** [Q-2nd] Wikipedia gives 2010 population **69,317** — matching F122 exactly — with
`"49.0% Hispanic, 39.8% White, 7.7% Asian, 2.0% Black, 1.5% Other/Multiracial"` and median household
income `"$42,049"`. — S22 **[Q-2nd for the breakdown and income; the population figure is
corroborated by F122.]**

**F124** [P] **No 2020-census figure for the `QN0502` NTA is in this file.** The dataset I found
(`swpk-hqdp`) stops at 2010 and uses the older NTA codes; `rnsn-acs2` likewise only carries 2000 and
2010 columns. A 2020 number would need a source I did not reach.

---

## 11. CONTESTED NEIGHBORHOOD ASSIGNMENTS — the brief's specific ask

Every place below is one that **some source assigns to a different neighborhood** than another
source does. **I record; I do not resolve.** "A / B" = Method A (GeoSearch) / Method B (NTA
point-in-polygon).

| # | Place | Address | Source says | Conflicting source says | A / B | Fact |
|---|---|---|---|---|---|---|
| C1 | **Mafera Park** | 65 Place and Shaler Avenue, 11385 | **NYC Parks: on the Glendale/Ridgewood boundary** (`"Glen Ridge"`) | Parks also calls users `"the children of Ridgewood"` | – / **Ridgewood** | F087, F088 |
| C2 | **Evergreen Park** | 60-09 Saint Felix Avenue, 11385 | **NYC Parks: `"the Queens neighborhood of Ridgewood"`** | **GeoSearch: `Fresh Pond`** | **Fresh Pond** / **Ridgewood** | F095 |
| C3 | **Woodbine-Palmetto-Gates HD** (NRHP 83001783) | Forest & Fairview Aves., Woodbine & Linden Sts. | **Wikipedia NRHP table: `Middle Village, Queens`** | LPC's Ridgewood North HD covers the same streets | **Ridgewood** / **Ridgewood** | F054, F055 |
| C4 | **Seneca-Onderdonk-Woodward HD** (NRHP 83001779) | Woodward, Seneca, Catalpa Aves., Woodbine St. | **Wikipedia NRHP table: `Middle Village, Queens`** | streets are core Ridgewood per LPC | **Ridgewood** / **Ridgewood** | F054 |
| C5 | **Grove-Linden-St. John's HD** (NRHP 83001772) | Fairview Ave., St. John's Rd., Linden & Grove Sts. | **Wikipedia NRHP table: `Middle Village, Queens`** | — | **Ridgewood** / **Ridgewood** | F054 |
| C6 | **Forest-Norman HD** (NRHP 83001769) | Forest Ave. from Summerfield to Stephen St. | **Wikipedia NRHP table: `Middle Village, Queens`** | — | **no geocode** / – | F054 |
| C7 | **Cooper Avenue Row HD** (NRHP 83001765) | 6434-6446 Cooper Ave. | **Wikipedia NRHP table: `Ridgewood, Queens`** | both methods say Glendale | **Fresh Pond** / **Glendale** | F056 |
| C8 | **Evergreens Cemetery** (NRHP 07001192) | 1629 Bushwick Ave. | **Wikipedia NRHP table: `Ridgewood, Queens`** | NYC Parks: `"along Bushwick Avenue on the Brooklyn-Queens border"`; both methods say Brooklyn | **Forest Park** (artifact) / **BK0471 The Evergreens Cemetery** | F057 |
| C9 | **Myrtle Avenue BID office / Ridgewood LDC** | 62-14 Myrtle Avenue, 11385 | **City BID directory: `org_city = Glendale`** | **same record: `org_neighborhood = Ridgewood`**; BID's own site: `"in Ridgewood"` | **Fresh Pond** / **Glendale** | F098, F100 |
| C10 | **Grover Cleveland High School** | 21-27 Himrod Street | **GeoSearch: `Bushwick, Brooklyn`** | **DOE's own `nta_name`: Ridgewood**; Method B: Ridgewood | **Bushwick (BK)** / **Ridgewood** | F001, F097 |
| C11 | **Ridgewood Library** | 20-12 Madison Street | **GeoSearch: `Bedford-Stuyvesant, Brooklyn`** | **Queens Library dataset `nta = QN0502`** | **Bed-Stuy (BK)** / **Ridgewood** | F002, F096 |
| C12 | **Middle Village Prep Charter School** | 68-02 Metropolitan Avenue | **its own name: Middle Village** | **DOE `nta_name`: Ridgewood** | – / **Ridgewood** | F012, F097 |
| C13 | **Vander Ende-Onderdonk House** | 1820 Flushing Avenue | **LPC: in Bushwick until a 1937 state boundary change** | NYC Parks: 1769 rock `"officially defin[ed] Ridgewood as a part of Queens"`; museum: `"on the border of Ridgewood and Bushwick"` | **Ridgewood** / **Ridgewood** | F021a–c, F072 |
| C14 | **Myrtle–Wyckoff Avs station** | Myrtle & Wyckoff Aves. | **MTA `borough = Bk`**; Method B: Bushwick (East) | universally described as Ridgewood's hub; `bushwick.json` says it `"serves Bushwick and Ridgewood, Queens together"` | – / **Bushwick (East)** | F014, F115, F117 |
| C15 | **TV Eye** | 1647 Weirfield Street | **its own site: `"on Ridgewood/Bushwick border"`** | both methods: Ridgewood | **Ridgewood** / **Ridgewood** | F111 |
| C16 | **Trans-Pecos** | 915 Wyckoff Avenue | **its own site: `"BUSHWICK x RIDGEWOOD BORDER"`**, and prints both `"Queens NY"` and `"RIDGEWOOD NY"` | both methods: Ridgewood | **Ridgewood** / **Ridgewood** | F112 |
| C17 | **Ridgewood Reservoir** | in Highland Park, on the county line | **named "Ridgewood"; LPC says the neighborhood is named after it** | **already owned by `brooklyn/highland-park.json`**; Method B: Highland Park-Cypress Hills Cemeteries (South) | **Forest Park** (artifact) / **Brooklyn** | F010, F022 |
| C18 | **Ridgewood Savings Bank, Forest Hills Branch** | 107-55 Queens Boulevard | **named "Ridgewood"** | **already owned by `queens/forest-hills.json`**, town `Forest Hills` | – / – | F008 |
| C19 | **"Ridgewood" as a Brooklyn place name** | — | **City BID record: market includes `"Ridgewood/Bushwick in Brooklyn"`** | Queens NTA `QN0502 Ridgewood` is entirely in Queens | – / – | F099 |
| C20 | **Benninger Playground's stated Ridgewood boundaries** | — | **NYC Parks: bounded by Metropolitan Ave (N), the LIRR (E), Central Ave (S), Flushing Ave (W)** | does not obviously match the NTA polygon | – / – | F020 |

---

## 12. GAPS AND WEAKNESSES — what a second pass must fix

**F125** [P] **The Ridgewood Theater's current use is unknown to this file.** Both candidate
Wikipedia URLs 404'd and I had no search budget. This is a visitor-facing gap on a marquee landmark.

**F126** [P] **Arbitration Rock's relocation date is unsourced.** The museum confirms the rock is on
its grounds (F070); LPC's 1995 report never mentions it; **no source I reached says when or how it
got there**, or where it was between 1769 and now. Given that the rock is the single best physical
emblem of this page's theme, this is the most valuable gap to close.

**F127** [P] **The 2022 NRHP district (`Ridgewood Fresh Pond Road-Myrtle Avenue`, refnum 100007371)
is known to me only as a table row.** No nomination text, no building count, no boundary detail.

**F128** [P] **The Ridgewood Savings Bank main office has no confirmed street address** (F104) and
its only substantive sourcing is two **[Q-2nd]** Wikipedia summaries (F102, F103). For a building
this prominent that is the weakest evidentiary footing in the file — and it sits next to a
name-collision trap the brief explicitly warns about.

**F129** [P] **Linden Hill Cemetery is unresolved.** NYC Parks says Grover Cleveland Playground
adjoins it (F091), but I could not establish which cemetery that is: there are Linden Hill Jewish
and Linden Hill Methodist cemeteries in the Maspeth/Middle Village area, and the address I geocoded
(`323 Woodward Avenue`) returned an ordinary Ridgewood address, not a cemetery. **Do not create a
Linden Hill place record from this file.**

**F130** [P] **Church coverage is thin.** Only St. Matthias is properly sourced (F083, F084).
Wikipedia mentions `"Our Lady of the Miraculous Medal Parish"` [Q-2nd] — S22 — and nothing else
reached me. Ridgewood's German/Polish/Latino parish landscape is essentially unresearched here.

**F131** [P] **The industrial and waterfront material is weak.** Ridgewood's Flushing Avenue
industrial belt, the English Kills / Newtown Creek edge (LPC notes the Onderdonk site
`"was adjacent to the end of a branch of the English Kills section of Newtown Creek"` [Q] — S2),
the Fresh Pond rail yards and the knitting mills are all mentioned in passing by sources but none
is documented. **Ridgewood has no waterfront in the ordinary sense** — the nearest water is the
English Kills industrial channel — and the brief's "waterfront" prompt should probably be answered
that way rather than reached for.

**F132** [P] **Retail and restaurant coverage is thin and partly rotten.** One usable long-standing
business site (Rudy's), one tavern (Gottscheer Hall), one contemporary restaurant (Rolo's), one
DOHMH-only entry (Onderdonk Cafe), one probably-closed (Norma's), one dead domain turned casino spam
(Morscher's), and three venues whose addresses I could not source (F114). The BID's site
(`ridgewood-ny.com`) has a merchant directory I did not crawl — that is the obvious next step.

**F133** [P] **No 2020 census data** (F124), and no local-news layer at all — the *Times Newsweekly*
(formerly the *Ridgewood Times*, F094) is the obvious local source and I never reached it.

**F134** [P] **Two things in this file are corroborated by exactly one dataset each and should not
be treated as robust:** the BID's `org_businesses = "333"` / `org_blocks = "32"` figures (F098), and
the population figures (F122), which come from a dataset using superseded NTA boundaries.

---

## 13. COUNTS

- **Candidate facts recorded (F001–F134): 134.**
- **Candidate places recorded: 56.** Itemised so the verifier can check my arithmetic:

  | Group | Count | Detail |
  |---|---|---|
  | Individual landmarks | 2 | Vander Ende-Onderdonk House; Ridgewood Theater Building |
  | Church complex | 1 | St. Matthias RC Church Complex |
  | LPC historic districts | 4 | Stockholm Street; Ridgewood North; Ridgewood South; Central Ridgewood |
  | NRHP districts/sites | 14 | the 17 rows of F052, **less** St. Matthias, the Onderdonk House Site and Evergreens Cemetery (all counted elsewhere or Brooklyn's) |
  | Parks in the Ridgewood NTA | 8 | F085 |
  | Library | 1 | Queens Public Library, Ridgewood branch |
  | DOE schools | 12 | F097 |
  | Commercial / civic bodies | 2 | Myrtle Avenue BID (Ridgewood LDC); Ridgewood Savings Bank main office |
  | Food and drink | 5 | Gottscheer Hall; Rudy's Bakery and Café; Rolo's; Onderdonk Cafe; Norma's |
  | Venues | 3 | TV Eye; Trans-Pecos; Nowadays |
  | Subway stations | 4 | Fresh Pond Rd; Forest Av; Seneca Av; Halsey St (F115) |
  | **Total** | **56** | |

  **[P] Caveat on the NRHP count:** `Central Ridgewood Historic District` appears **twice** in this
  file under one name — once as an NRHP district (refnum 83001762, listed 1983-09-30) and once as an
  LPC district (LP-02448, designated 2014-12-09). **These are two different designations with
  different boundaries, thirty-one years apart, sharing a name.** I have counted them as two
  entries. A draft that merges them, or that attaches the 1983 NRHP date to the LPC district, would
  be making an error that this file's structure invites. The same caution applies to
  `Fresh Pond-Traffic` (NRHP 1983) versus the new `Ridgewood Fresh Pond Road-Myrtle Avenue` NRHP
  district (2022) — similar names, different listings, forty years apart.
- **Places with a contested neighborhood assignment: 20** (C1–C20, §11).
- **Places explicitly NOT claimed because another file owns them: 4** — Ridgewood Reservoir and
  Highland Park (Brooklyn), Ridgewood Savings Bank Forest Hills Branch (Forest Hills), Myrtle–Wyckoff
  Avs station (narrated by `bushwick.json`), plus Evergreens Cemetery which is Brooklyn's ground
  regardless of what Wikipedia's NRHP locality field says.
