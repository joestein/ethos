# Glendale, Queens — FINDER dossier (wave 4, Community District 5)

**Role: FINDER only.** Nothing below is adjudicated, confirmed, or verified. Every item is a
**candidate**. Verdicts belong to the verifier. Where sources disagree I record *both* and resolve
*neither*.

**Quotation convention (read before using anything below):**
- Text inside `"…"` after the marker **QUOTE:** is copied verbatim from the cited source.
- Text after **PARAPHRASE:** is my own wording. It is NOT a quote and must never be presented as one.
- Where a source contradicts itself I quote **both** conflicting strings rather than picking one.
- **DERIVED:** marks a result I computed from open data (geocode + point-in-polygon), not a sentence
  any source wrote. It is evidence, not a quotation.

**Counts: 286 candidate facts (F1–F286) across 61 candidate places (P1–P59, P61, P62).**
(Numbering is contiguous except P60, which was dropped during drafting and deliberately not reused.)

---

## 0. METHOD AND LIMITATION DISCLOSURE

This session's WebSearch budget was **already exhausted (200/200) before my first search call**. The
one WebSearch I attempted returned the budget error. Everything below was therefore retrieved by
**direct HTTP fetch with a browser user-agent** against specific URLs, plus:

- the **Wikipedia action API** (`action=query&prop=extracts&explaintext=1`, and `action=parse`
  for wikitext),
- the **NYC Open Data / Socrata API** (Parks Properties `enfh-gkve`; 2020 NTAs `9nt8-h7nd`;
  PLUTO `64uk-42ks`; LPC Individual Landmark Sites `buis-pvji`; DOHMH restaurant inspections
  `43nn-pn8j`),
- the **NYC DCP GeoSearch** geocoder (`geosearch.planninglabs.nyc/v2/search`).

**Consequence: coverage is deep on government/institutional sources and thin on press.** The
*New York Times* Glendale coverage (1986, 2011) that Wikipedia quotes is behind a paywall and I
could **not** retrieve the originals; those appear below only as *Wikipedia quoting the NYT*, and
are flagged as such. Local outlets (QNS, Queens Chronicle, Times Newsweekly) could not be searched
without WebSearch.

**Failed retrievals, recorded so the verifier does not repeat them:**
- **F1.** The three NPS/NRHP nomination PDFs (refnums 83001764, 83001761, 83001765) at
  `https://npgallery.nps.gov/NRHP/GetAsset/NRHP/<refnum>_text` each returned an **identical
  21,330-byte stub PDF**, not the nomination. The primary nomination text is therefore **not in
  evidence** for any of Glendale's three historic districts. Anything below about those districts
  comes from the Wikipedia NRHP listing table or the individual Wikipedia articles.
- **F2.** `theshopsatatlaspark.com` now resolves to a **squatted domain serving Thai-language
  smartwatch spam**. `shopsatatlaspark.com` and `atlasparkmall.com` do not resolve at all. **There
  is no retrievable official website for The Shops at Atlas Park.** Do not cite one.
- **F3.** `stpancrasglendale.org` and `www.stpancrasglendale.org` do not resolve.

### 0.1 The geocode + NTA resolver used throughout

Because this wave's central hazard is the Glendale/Maspeth/Ridgewood boundary, I built a
reproducible test and ran every candidate address through it:

1. geocode the street address with **DCP GeoSearch**, taking the returned point and BBL;
2. test that point against the **DCP 2020 Neighborhood Tabulation Area** polygons for Queens and
   Brooklyn (`9nt8-h7nd`), point-in-polygon with hole handling.

Results are labelled **DERIVED (NTA)**. This is the only *official, geometric* Glendale line I
found and it is the tool I recommend the verifier use for section 15. It is **not** a source
sentence and must not be quoted as one.

**Note a systematic quirk of the geocoder that will otherwise mislead readers:** GeoSearch's
human-readable `label` field carries a Who's-On-First neighborhood name, and for essentially every
Glendale address it returns **"Fresh Pond"**, never "Glendale" — e.g. `69-46 MYRTLE AVENUE, Fresh
Pond, NY, USA`. For the Cypress Hills Street cemeteries it returns **"Forest Park"**. WOF is an
aggregator layer; I record this only because it is one more source that declines to say "Glendale."

---

## 1. MANDATORY WAVE RULES — read before using anything below

### 1.1 Flushing Meadows Corona Park (`Ethos.Seeds.CitiFieldPlaces`)

- **F4.** Glendale contains **no part** of Flushing Meadows Corona Park and does not border it.
  Glendale is in Community District 5; the park is in the CD4/CD6/CD7 area, several miles east
  beyond Middle Village, Rego Park and Forest Hills. **DERIVED** from the NTA geometry and from the
  boundary description in F10–F13.
- **F5.** The eight `CitiFieldPlaces` holdings (Citi Field, the Unisphere, the Queens Museum, the
  New York Hall of Science, the Queens Zoo, the USTA Billie Jean King National Tennis Center, the
  New York State Pavilion, the Queens Theatre) **do not appear anywhere in this dossier** and
  nothing in Glendale gives a page any reason to reach for them. There is no Glendale World's Fair
  hook. **Do not manufacture one.** If a routing sentence is genuinely warranted, link to
  `/g/citi-field-guide`; do not narrate.

### 1.2 The Ridgewood Savings Bank name collision

- **F6.** Nothing in this dossier is the Ridgewood Savings Bank building at 107-55 Queens
  Boulevard, which was assigned to **Forest Hills** in wave 3. No Glendale candidate below carries
  that address or that institution. Recorded so the verifier can confirm the collision was avoided.

### 1.3 The Brooklyn county line

- **F7.** Glendale's southern/western border runs through the cemeteries **and along the Brooklyn
  borough line** (see F11). Several candidate places below sit on or across that line, and my
  resolver returned **Brooklyn NTAs** for some addresses that a careless reader would assume are
  Queens (F196, F197). Glendale's county is **Queens** throughout.

---

## 2. THE NEIGHBORHOOD ITSELF — boundaries and administrative geography

**P1. Glendale (the neighborhood)**

- **F8.** QUOTE (Wikipedia, *Glendale, Queens*): "Glendale is a neighborhood in the west-central
  portion of the New York City borough of Queens. It is bounded by Forest Hills to the east,
  Ridgewood to the west, Woodhaven to the south, and Middle Village to the north."
  Source: https://en.wikipedia.org/wiki/Glendale,_Queens
- **F9.** A DIFFERENT and wider neighbor list, from the **same article**, three sections later.
  QUOTE (Wikipedia, *Glendale, Queens*, "Neighborhood"): "Glendale, a part of Queens Community
  Board 5, is a working to middle class neighborhood surrounded by Forest Hills, Ridgewood,
  Woodhaven, Middle Village, and Kew Gardens."
  → Note the conflict with F8: the second list adds **Kew Gardens**. Same article, same source.
  **Do not reconcile — verifier's call.** Source: as F8.
- **F10.** QUOTE (Wikipedia): "Glendale is bordered to the north by a section of the Montauk Branch
  of the Long Island Rail Road (LIRR) in the western portion (Lower and Middle Glendale), and by
  Cooper and Metropolitan Avenues in the eastern portion (Upper Glendale)."  Source: as F8.
- **F11.** QUOTE (Wikipedia, continuing): "To the east, the border is the Rockaway Beach Branch of
  the LIRR, as well as Woodhaven Boulevard. Forest Park, along with the Jackie Robinson Parkway and
  a number of contiguous cemeteries, creates the southern and western borders; the borough line
  with Brooklyn runs through the cemeteries on the western part of the southern border. Glendale's
  borders are completed from the southwest (from Cooper and Wyckoff Avenues) by the Bay Ridge
  Branch of the LIRR and Fresh Pond Road from Myrtle Avenue to the BMT Myrtle Avenue Line
  right-of-way."  Source: as F8.
- **F12.** QUOTE (Wikipedia): "Glendale is located in Queens Community District 5 and its ZIP Code
  is 11385. It is patrolled by the New York City Police Department's 104th Precinct. Politically,
  Glendale is represented by the New York City Council's 30th District."  Source: as F8.
  → CAUTION: NYC Parks property pages for Glendale parks currently name **three different** council
  members — "Phil Wong" on Mafera Park and Drumm Triangle, "Joann Ariola" on Pinocchio Playground
  and Glendale Veterans Triangle, and "Lynn Schulman, Joann Ariola" on Forest Park (all retrieved
  2026-09-02 from nycgovparks.org). None of them says "30th District." Council districts are a
  moving target; treat as low-value and do not publish a district number.
- **F13.** QUOTE (Wikipedia): "Glendale's land area is long on its east-west axis and narrow on its
  north-south axis. The area is surrounded mainly by cemeteries, although the neighborhood also
  contains several large parks, including part of Forest Park."  Source: as F8.
- **F14.** QUOTE (Wikipedia): "Compared to most other Queens neighborhoods, Glendale is long and
  narrow since it is essentially sandwiched by cemeteries and Forest Park. As a result, it is
  considered to have three areas: from east to west, they are Upper Glendale, Middle Glendale, and
  Lower Glendale. Each area has its own unique attributes."  Source: as F8.
- **F15.** QUOTE (Wikipedia): "The easternmost portion near the Shops at Atlas Park is known as
  Upper Glendale and in general has more expensive homes and slightly higher income levels than the
  rest of Glendale."  Source: as F8.
- **F16.** QUOTE (Wikipedia): "The middle portion of Glendale that straddles Myrtle Avenue is the
  primary business district and has a mix of semi-detached, wood frame, single-family houses as
  well as a number of multi-family dwellings and townhomes."  Source: as F8.
- **F17.** QUOTE (Wikipedia): "The western or 'lower' part of Glendale has three national historic
  districts and includes the neighborhoods of Evergreen (near and around Evergreen Park) and
  Liberty Park, which is bordered by Cypress Hills Street, Cooper Avenue, 61st Street and
  cemeteries to the south."  Source: as F8.
- **F18.** A CONFLICTING treatment of those two sections. QUOTE (Wikipedia, *Queens Community
  Board 5*): "The Queens Community Board 5 is a local government in the New York City borough of
  Queens, encompassing the neighborhoods of Ridgewood, Glendale, Middle Village, Maspeth, Fresh
  Pond, and Liberty Park."
  Source: https://en.wikipedia.org/wiki/Queens_Community_Board_5
  → This treats **Fresh Pond and Liberty Park as neighborhoods coordinate with Glendale**, where
  F17 treats Liberty Park (and Evergreen) as *sections of* Glendale. Flagging, not resolving.
- **F19.** QUOTE (same, *Queens Community Board 5*): "It is delimited by Maurice Avenue and the
  Long Island Expressway to the north, the Brooklyn borough line to the west and south, and
  Woodhaven Boulevard to the east."  Source: as F18.

### 2.1 The official DCP geography — the strongest boundary evidence I found

- **F20.** DCP's **2020 Neighborhood Tabulation Areas** give Queens CD5 four neighborhood NTAs and
  four cemetery NTAs. Retrieved verbatim from the dataset:
  `QN0501 | Maspeth`, `QN0502 | Ridgewood`, **`QN0503 | Glendale`**, `QN0504 | Middle Village`,
  and (ntatype 7) `QN0571 | Mount Olivet & All Faiths Cemeteries`, `QN0572 | Middle Village
  Cemetery`, `QN0573 | St. John Cemetery`, `QN0574 | Highland Park-Cypress Hills Cemeteries
  (North)`. All eight carry `cdtaname` = `QN05 Ridgewood-Maspeth-Middle Village (CD 5
  Approximation)`.
  Source: https://data.cityofnewyork.us/resource/9nt8-h7nd.json (2020 Neighborhood Tabulation Areas)
  → **Glendale has its own NTA, QN0503.** This is the single most useful adjudication tool in this
  dossier. It is also worth the verifier noticing that DCP's *name* for the whole district —
  "Ridgewood-Maspeth-Middle Village" — **omits Glendale**, which is consistent with the
  neighborhood's documented complaint about being erased into Ridgewood (F60–F65).
- **F21.** **STRUCTURAL FINDING, and a direct parallel to wave 3's Flushing Meadows ruling.**
  DCP assigns Forest Park its own **Joint Interest Area**: `QN8291 | Forest Park`, in
  `QN82 Forest Park (JIA 82 Approximation)` — the same construction as Flushing Meadows Corona
  Park's `QN8191` under `QN81`. **Forest Park sits in no neighborhood NTA at all, and in no
  community district.** Source: as F20.
  → I am not adjudicating this. I am recording that the exact structure that made Flushing Meadows
  belong to no neighborhood file in wave 3 exists again here, and that Glendale, Woodhaven, Richmond
  Hill, Kew Gardens and Forest Hills all abut it. See §5.
- **F22.** SIMILARLY: the Cemetery Belt cemeteries are **their own type-7 NTAs**, not part of
  QN0503 Glendale. Every Cypress Hills Street / Myrtle Avenue cemetery address I tested resolves to
  `QN0574 Highland Park-Cypress Hills Cemeteries (North)`, and All Faiths resolves to
  `QN0571 Mount Olivet & All Faiths Cemeteries`. See §4 for the per-cemetery results.
  **DERIVED (NTA).**
- **F23.** PLUTO confirms Community District for the core Glendale addresses tested: every one
  returned `cd = 405` (Queens CB5). The **All in the Family** house at 89-70 Cooper Avenue returned
  `cd = 405` but **`zipcode = 11374`** — a Rego Park ZIP. Source:
  https://data.cityofnewyork.us/resource/64uk-42ks.json (PLUTO).

### 2.2 Demographics

- **F24.** QUOTE (Wikipedia): "Based on data from the 2010 United States census, the population of
  Glendale was 32,496."  Source: as F8.
- **F25.** PARAPHRASE (Wikipedia, Demographics): the 2010 racial makeup is given as 61.4% (19,793)
  White, 1.2% (384) African American, 0.2% (67) Native American, 3.1% (1,004) Asian, 1.0% (5)
  Pacific Islander, 0.2% (78) from other races and 0.9% (310) from two or more races, with Hispanic
  or Latino of any race 33.4% (10,855).  Source: as F8.
  → CAUTION: the article's own numbers are internally impossible — "1.0% (5) Pacific Islander"
  cannot be 1.0% of 32,496. Flagging, not resolving.
- **F26.** QUOTE (Wikipedia): "The entirety of Community Board 5, which comprises Maspeth,
  Ridgewood, Middle Village, and Glendale, had 166,924 inhabitants as of NYC Health's 2018
  Community Health Profile, with an average life expectancy of 81.4 years."  Source: as F8.
  → Note this CB5 neighborhood list **omits Fresh Pond and Liberty Park**, which F18 includes.
- **F27.** QUOTE (Wikipedia): "As of 2017, the median household income in Community Board 5 was
  $71,234."  Source: as F8.
- **F28.** QUOTE (Wikipedia): "Based on this calculation, as of 2018, Maspeth, Ridgewood, Middle
  Village, and Glendale are considered to be high-income relative to the rest of the city and not
  gentrifying."  Source: as F8.
  → All CB5-level health, income, education and crime statistics in the Wikipedia article are for
  **"Glendale, Ridgewood, and Maspeth" together**, never Glendale alone. Any page using them must
  say so. I have not itemized them; they are a district statistic, not a neighborhood one.

---

## 3. HISTORY

### 3.1 Origins and the name

- **F29.** QUOTE (Wikipedia): "The land comprising present-day Glendale was originally named Fresh
  Pond, a swampy area that was part of a 74,000-acre (30,000 ha) area collectively called Newtown.
  The town of Newtown had been chartered to the Reverend Francis Doughty by the Dutch West India
  Company in 1642."  Source: as F8.
- **F30.** QUOTE (Wikipedia): "In turn, Fresh Pond was originally named for two freshwater ponds
  that, in the early 1900s, were filled in."  Source: as F8.
- **F31.** A COMPETING original name. QUOTE (NYC Parks, Dry Harbor Playground historical sign):
  "This playground gets its name from the original name for Glendale: Dry Harbor. A description of
  the area from the 1700s, looking from Cooper Avenue across the valley to Forest Park, said that
  the houses, which appeared to be sitting atop the crests of trees and hills resembled a harbor
  with no water. In 1869, area residents changed the neighborhood name to Glendale, but Dry Harbor
  Road and Dry Harbor Playground preserve the original name."
  Source: https://www.nycgovparks.org/parks/forest-park/highlights/11285
- **F32.** A THIRD account that reconciles F29 and F31, and should be read alongside them.
  QUOTE (Forgotten New York, "GLENDALE AND FOREST HILLS," Kevin Walsh, January 28, 2024): "The
  eastern end of Fresh Ponds , where Forest Park is today, was called “Dry Harbor” because it was
  said that houses there appeared to be sitting atop the crests of trees and hills, resembling a
  harbor without water. Today’s 80th Street was originally an extension of Dry Harbor Road, named
  after this part of the community."
  Source: https://forgotten-ny.com/2024/01/glendale-and-forest-hills/
  (spacing before the comma is the source's own)
- **F33.** A FOURTH, from a parish primary source. QUOTE (Sacred Heart R.C. Church, Glendale,
  "Parish History"): "Glendale was originally part of Newtown, and our section was known as Fresh
  Ponds."  Source: https://sacredheartrccglendale.org/parish-history/
- **F34.** **THE FOUNDER'S MIDDLE INITIAL IS DISPUTED ACROSS FOUR SOURCES. Do not pick one.**
  - QUOTE (Wikipedia): "In 1860, developer **George C. Schott** was given a large amount of land in
    Fresh Pond as repayment for a debt. Schott renamed Fresh Pond after his native Glendale, Ohio."
    Source: as F8.
  - QUOTE (NYC Parks, "Uncle" Vito F. Maranzano Glendale Playground sign): "In 1860, **George S.
    Schott** acquired property in the area known as Fresh Pond and renamed it for his birthplace in
    Glendale, Ohio."
    Source: https://www.nycgovparks.org/parks/uncle-vito-f-maranzano-glendale-playground/history
  - QUOTE (Forgotten New York, 2024): "In the early 1860’s, developer **George S. Schott** acquired
    a considerable amount of land in Fresh Ponds as repayment of a debt owed him. As the Civil War
    drew to a close, he founded what is today known as Glendale, which he named after his hometown
    of Glendale, Ohio."  Source: as F32.
  - QUOTE (Sacred Heart parish history): "**George S. Schott** named Glendale in the early 1860’s.
    He owned a considerable portion of the land in the section, which he acquired as payment for a
    debt (he came from a town in Ohio called Glendale)."  Source: as F33.
  → Three of four say **S**; Wikipedia alone says **C**. The naming date is also given variously as
  **1860** (Wikipedia, Parks), **"the early 1860's"** (Forgotten NY, Sacred Heart) and **1869**
  (Parks' Dry Harbor sign, F31, which credits "area residents" rather than Schott). All four are
  recorded. **Verifier's call.**
- **F35.** QUOTE (Wikipedia): "Nine years later, John C. Schooley, a real estate agent, bought a
  substantial amount of property and also called it Glendale. Schooley laid out streets and divided
  his property into 469 lots, measuring 25 by 100 feet (7.6 m × 30.5 m), which he then sold off for
  $300 each."  Source: as F8.
- **F36.** QUOTE (Wikipedia): "The area became a thriving German farming community in the 19th
  century."  Source: as F8.
- **F37.** QUOTE (Sacred Heart parish history): "After the Civil War, German farmers began moving
  to Glendale where they acquired land."  Source: as F33.
- **F38.** QUOTE (NYC Parks, Maranzano sign): "With the arrival of the South Side Railroad in 1867
  and steam-powered transportation in 1893, row houses and single-family residences gradually
  displaced local farms. During the first half of the 20th century, the neighborhood attracted a
  substantial German immigrant population and new industries, such as breweries, textile factories,
  and film studios. More recently, immigrants from Eastern and Central Europe, the Caribbean, and
  Asia have settled in the area."  Source: as F34 (Maranzano).
  → **"film studios" is a claim I could not corroborate anywhere else.** Recorded as a candidate;
  it needs its own check.
- **F39.** A CONFLICTING railroad date. QUOTE (Wikipedia): "In 1869, a railroad stop at 73rd Street
  (then named Wyckoff Avenue) was opened by the South Side Railroad, which was sold in 1874 to the
  North Side Railroad, which then was merged into the Long Island Rail Road (LIRR) in 1876,
  becoming part of the Montauk Branch. In 1927, the station burned down and was never replaced."
  Source: as F8.
  → F38 says South Side Railroad **1867**; F39 says the stop opened **1869**; F164 (the LIRR station
  article) says "around June 1869 (although some sources claim it was built in 1868)". And F39's
  "In 1927, the station burned down and was never replaced" **directly contradicts** F164, which
  says the LIRR razed it in January 1927 and that a Glendale station existed on the Montauk Branch
  again by 1928 and closed in 1998. **Wikipedia contradicts Wikipedia here.** Do not reconcile.

### 3.2 The beer gardens and picnic parks

- **F40.** QUOTE (Wikipedia): "Between the 1880s and World War I, Glendale also had many sources of
  entertainment. It had a bowling alley at Myrtle Avenue and 73rd Street;  Herman's Saloon;
  Liberty; Louis Hellen's Saloon and picnic grove at Cooper Avenue and 73rd Street; and a trolleys
  along Union Turnpike that ran to Schutzen Park."  Source: as F8. (The double space and "a
  trolleys" are the source's own.)
- **F41.** QUOTE (Wikipedia): "Owing to the English transliteration options from the original German
  name, Schutzen Park was also previously known as both 'Schuetzen Park' and 'Scheutzen Park'."
  Source: as F8.  → Sacred Heart (F44) spells it "Schützen Park." Four spellings in evidence.
- **F42.** QUOTE (Wikipedia): "In the 1890s, on the north side of Myrtle Avenue from what is now
  83rd Street to Woodhaven Boulevard, Schmidt's Woods, Glendale Schuetzen Park, Greater New York
  Park and Casino, and Tivoli Park—all picnic parks—opened. On the south side of Myrtle Avenue from
  88th Place to Woodhaven Boulevard were El Dorado Park, Emerald Park and Florida Park."
  Source: as F8.
- **F43.** QUOTE (Wikipedia): "These parks drew large crowds, not only from Glendale but from
  Eastern Brooklyn, where there were no proper parks at the time. One of the sections of Glendale,
  now known as 'Liberty Park', is located on the site of a former beer garden of the same name.
  Another section of Glendale, adjacent to the LIRR Fresh Pond/Fremont Yards, was named after the
  Ivanhoe Park beer garden at that location."  Source: as F8.
- **F44.** QUOTE (Sacred Heart parish history): "Schützen Park was probably the largest of the
  picnic groves. It ran east, almost to Trotting Course Lane (now Woodhaven Blvd.)."
  Source: as F33.
- **F45.** QUOTE (Sacred Heart parish history): "On the south side of Myrtle Avenue, at what is now
  Seneca Avenue, was the entrance to the Ridgewood Park, which had private picnic grounds and
  baseball fields. Each year the brewers from Brooklyn held a picnic there. In 1906, Liberty Park,
  a private picnic ground, opened."  Source: as F33.
- **F46.** QUOTE (Wikipedia): "'Doddies', located at Cooper Avenue and 74th Street, was the last of
  the beer gardens, surviving into the late 1960s with an outdoor picnic area and the first
  neighborhood bar to have a television in the late 1940s or early 1950s. Redeemer Lutheran School
  occupies the site of 'Hoffman Hall', a beer garden and dance hall. In the mid-1920s, the parks
  closed because they were unable to financially weather Prohibition."  Source: as F8.
- **F47.** QUOTE (Forgotten New York, 2024): "In the late 1800’s, picnic grounds and beer gardens
  flourished due to an influx of German immigrants into the area."  Source: as F32.

### 3.3 Myrtle Avenue, the stagecoach and the trolleys

- **F48.** QUOTE (Sacred Heart parish history): "In 1835, Myrtle Avenue ran from Brooklyn to
  Jamaica, with a tollgate at Cypress Avenue to collect tariffs for the use of the road. A
  stagecoach line transported people from Brooklyn to Jamaica."  Source: as F33.
- **F49.** QUOTE (Sacred Heart parish history): "Eventually horse-drawn streetcars operated by the
  Brooklyn City Railroad replaced the stagecoach line, and Myrtle Avenue was paved with
  cobblestones. These were later replaced by electric-powered trolley cars. By the 1890’s, the
  center of 'Glendale Village,' as it had become known, was at the intersection of Cooper and
  Myrtle Avenues."  Source: as F33. (Source uses curly quotes around Glendale Village.)
- **F50.** QUOTE (Wikipedia): "Development began along Myrtle Avenue, Glendale's main thoroughfare,
  as many family-run stores began opening and steam powered trolleys were introduced on 'The
  Avenue' in 1891."  Source: as F8.
- **F51.** QUOTE (Sacred Heart parish history, on street renaming): "Our present-day numbered
  streets all had names. For example, 71 Street was known first as Webster Avenue, then Olmsted
  Place; and 73d Street was first Wyckoff Avenue and later McComb Place."  Source: as F33.
- **F52.** PARAPHRASE (Forgotten New York, "GLENDALE '22," Kevin Walsh, December 4, 2013): the post
  reproduces a portion of a 1922 Hagstrom map of Queens showing Glendale, and Walsh notes that
  Queens street renumbering began in 1915 but proceeded neighborhood by neighborhood, speculating
  Glendale may have been among the last to switch.
  Source: https://forgotten-ny.com/2013/12/glendale-22/
  → CAUTION: the richest street-name detail on that page (Indiana Avenue, Luther Road, Edsall
  Avenue, Margaret Place, Hannah/Isabella = 88th/89th Streets, and the lists of surviving named
  streets by quadrant) is in **reader comments**, not in Walsh's own text. Comments are
  user-generated and are **not** a citable source. Recorded here only so the verifier knows why the
  page looks richer than it is.
- **F53.** QUOTE (Forgotten New York, 2013, Walsh's own body text — the whole substantive body):
  "Here’s a piece of a 1922 Hagstrom map of Queens, showing Glendale. Though the numbering of Queens
  streets began in 1915, it happened neighborhood by neighborhood in a gradual process. It could be
  that Glendale was the last to make the switch."  Source: as F52.

### 3.4 Industry, the wars, and the parkway

- **F54.** QUOTE (Wikipedia): "After World War I, Glendale's economic base shifted from farming to
  textiles and breweries. The largest employer was the Atlas Terminal, a vast industrial park,
  consisting of 16 factories."  Source: as F8.
- **F55.** QUOTE (Wikipedia): "Because of the skilled work force living in the area and the many
  small machine shops located here, Glendale played a big part in the war effort during World War II
  and, especially in the Manhattan Project, which produced the first atomic bombs. During World War
  II, most of the aircraft and military equipment made on Long Island was shipped by rail through
  this area."  Source: as F8.
  → **STRONGEST CAUTION IN THIS DOSSIER.** The Manhattan Project sentence is a large claim carried
  by a single unsourced Wikipedia line. I found **no corroboration whatever** in any other source I
  retrieved. Treat as unverified until an independent source is produced.
- **F56.** QUOTE (Wikipedia): "Meanwhile, new housing was being developed in the area as well; by
  1937, the neighborhood's sole extant farm was being developed as housing."  Source: as F8.
- **F57.** QUOTE (Wikipedia): "Between 1933 and 1936, the Interborough (now Jackie Robinson)
  Parkway, designed by New York City parks commissioner Robert Moses, was built through Glendale,
  displacing hundreds of bodies buried in the Cypress Hills Cemetery. The parkway, strongly opposed
  by residents of neighborhoods surrounding Forest Park, displaced Riebling's Greater New York Park
  and Casino, and necessitated the redesign of the Forest Park Golf Course."  Source: as F8.
  → Note "Riebling's Greater New York Park and Casino" here versus plain "Greater New York Park and
  Casino" in F42, same article.
- **F58.** QUOTE (Sacred Heart parish history): "Forest Park Golf Course came down to Myrtle Avenue
  because the parkway had not yet been built. The spot where the parkway crosses Myrtle Avenue,
  just east of 88″ Street, was the location of a beer garden and bar where, as noted earlier, the
  young parish gathered."  Source: as F33. (The `88″` typo is the source's.)
- **F59.** QUOTE (Wikipedia): "By the 1980s, Glendale was known as one of the quieter neighborhoods
  in New York City."  Source: as F8.

### 3.5 The ZIP code fight — the best-documented Glendale-specific story in the corpus

- **F60.** **Wikipedia contradicts itself on the shared Bushwick ZIP code, in two places, and the
  verifier must not silently pick one:**
  - QUOTE (Wikipedia, "History" §20th century): "Originally, Ridgewood and Glendale (although in
    Queens) shared ZIP Code **11237** with Bushwick, Brooklyn."
  - QUOTE (Wikipedia, "ZIP Code changes"): "The neighborhoods' ZIP Code of **11227** was shared with
    Bushwick, Brooklyn, as well as with Wyckoff Heights on the border of the two boroughs."
  Source (both): as F8.
- **F61.** QUOTE (Wikipedia): "Since at least 1898, when the boroughs of Brooklyn and Queens were
  created as part of the City of Greater New York, Glendale and Ridgewood's postal mail had been
  routed through the main Brooklyn post office in Williamsburg, rather than the main post office in
  Flushing, because they are located closer to Williamsburg. When ZIP Codes were assigned in 1963,
  the neighborhoods were assigned Brooklyn ZIP Codes with the 112 prefix, along with all areas whose
  mail was routed through a Brooklyn post office. This gave Glendale and Ridgewood a Brooklyn
  mailing address despite actually being located in Queens."  Source: as F8.
- **F62.** QUOTE (Wikipedia): "After the 1977 New York City blackout, newspapers around the country
  published UPI and Associated Press' photos of Bushwick residents with stolen items and a police
  officer beating a suspected looter, and Bushwick became known for riots and looting. Afterward,
  the communities of Ridgewood and Glendale expressed a desire to disassociate themselves from
  Bushwick."  Source: as F8.
- **F63.** QUOTE (Wikipedia): "Following complaints from residents, Postmaster General William
  Bolger proposed that the ZIP Codes would be changed if United States Representative Geraldine
  Ferraro could produce evidence that 70% of residents supported it. After Ferraro's office
  distributed ballots to residents, 93 percent of the returned ballots voted for the change. The
  change to ZIP Code 11385 was made effective January 13, 1980."  Source: as F8.
  → A DIFFERENT vote figure appears earlier in the same article. QUOTE: "Residents voted on a
  proposal to create a new ZIP Code, and a majority of votes were cast in favor of the proposal. The
  communities were given the ZIP Code 11385 in 1980." Same source. "A majority" vs "93 percent."
- **F64.** QUOTE (Wikipedia): "In 2007, there was a movement by Glendale residents to obtain their
  own ZIP Code since sharing a zip code with Ridgewood has caused many problems due to auto-fill
  features programmed into most computer databases. As a result, most Glendale residents receive
  mail addressed 'Ridgewood' and have difficulties when arranging deliveries or hiring plumbers,
  electricians or contractors.  The incorrect, misleading Ridgewood address causes many of them to
  go to the wrong location, since numbered roads in Queens are often broken into separate segments
  by barriers like railroad tracks, highways and cemeteries."  Source: as F8.
- **F65.** QUOTE (Wikipedia): "In 2012, the quest to obtain a unique ZIP Code for Glendale was again
  brought to the forefront by Congressman Bob Turner and Assemblyman Mike Miller; the unused 11384
  was suggested. This request was again denied by the Postal Service, although a compromise was
  offered under which the USPS modified its software to include 'Glendale' as a preferred community
  name for the identified area."  Source: as F8.
- **F66.** QUOTE (Wikipedia): "As of 2014, this software modification by the USPS has not yet been
  updated in the City Map web site at NYC.gov, the city's official website, which still displays
  Queens community names based solely on names associated with ZIP Codes. As a result, addresses
  several miles away from Ridgewood, such as 80-00 Cooper Avenue (The Shops at Atlas Park at 80th
  Street), 72-25 Woodhaven Boulevard (a Trader Joe's, Staples, and Michael's location at
  Metropolitan Avenue) and 75-11 Woodhaven Boulevard (a Home Depot location behind 72-25 Woodhaven
  Boulevard) are listed by City Map as being in Ridgewood despite being located in Glendale, in Rego
  Park, or in Forest Hills."  Source: as F8.
  → **THIS IS THE KEY TO THIS WHOLE WAVE.** Wikipedia is stating, in its own words, that the
  official city map systematically mislabels Glendale addresses as Ridgewood. That is precisely the
  failure mode the arbitration must guard against. It also means **any source that assigns a
  Glendale address to Ridgewood may simply be echoing the ZIP code**, and should be weighed
  accordingly. I am not resolving that — I am flagging it as the mechanism.
- **F67.** QUOTE (a reader of Forgotten New York, comment by "Constance Watz," April 12, 2021, on
  the boundary confusion — **user-generated, not citable, recorded only as colour**): "I live in the
  section that is east of Fresh Pond Road, South of the M train, in between 68th Ave & Catalpa Ave.
  I was told this area was Glendale. However, it appears that in the future, it will become
  Ridgewood, especially if the new zip code comes through for Glendale. My address is no longer
  listed in the boundaries of Glendale. Confused."  Source: as F52.
  → **Do not publish. Comment, not source.** Recorded because it independently corroborates F66's
  mechanism from a resident's point of view.
- **F68.** DERIVED (NTA), testing F66's example directly: **80-00 Cooper Avenue geocodes into
  `QN0503 Glendale`**, with `zipcode 11385`, `cd 405`, owner `QUEENS LIFESTYLE CENTER LLC`. So
  DCP's geometry agrees with Wikipedia and against the City Map ZIP-based label.
  Sources: geosearch.planninglabs.nyc; https://data.cityofnewyork.us/resource/64uk-42ks.json
- **F69.** QUOTE (Wikipedia): "Glendale is covered by ZIP Code 11385. The United States Post Office
  operates the Glendale Station at 69-36 Myrtle Avenue."  Source: as F8. **(P38)**
- **F70.** DERIVED (NTA): **69-36 Myrtle Avenue → `QN0503 Glendale`**, zip 11385, cd 405. PLUTO
  owner of record is `FARID INVESTORS GLENDALE LLC`, `bldgclass S2`, `yearbuilt 1931`.
  → CAUTION: PLUTO's owner is a **private LLC, not USPS**, so the post office appears to be a leased
  storefront. And `yearbuilt 1931` recurs on a suspiciously large number of Glendale lots in PLUTO
  (69-44 Myrtle, 66-44 Myrtle, 78-60 73 Place, 70-01 Myrtle, and every Cypress Hills Street
  cemetery) — **1931 is very likely a PLUTO placeholder here, not a real construction year.** Do not
  publish any of those build dates.

### 3.6 21st century

- **F71.** QUOTE (Wikipedia): "At the beginning of the 21st century, some of Glendale's industrial
  buildings were redeveloped. Atlas Terminal was demolished in 2004 and replaced by a shopping
  center called The Shops at Atlas Park, which opened in April 2006. In other parts of Glendale,
  companies such as Trader Joe's and Chili's took over former industrial buildings."  Source: as F8.
  → Conflicts with F66, which places the Trader Joe's at 72-25 Woodhaven Boulevard **in Rego Park**,
  not Glendale. Same article. Flagging.
- **F72.** QUOTE (Wikipedia): "In 2012, all passenger service on the Lower Montauk Branch was
  discontinued. However, freight trains still operate, although in recent years, controversy over
  trains transporting radioactive waste through the community has arisen."  Source: as F8.
  → Conflicts with F164/F167, which date the end of Lower Montauk **passenger station** service to
  March 1998. The 2012 date refers to the last through service. Both recorded.
- **F73.** QUOTE (Wikipedia): "All goods shipped by rail with a destination on Long Island
  (Brooklyn, Queens and Nassau and Suffolk counties), must come through the Fresh Pond/Fremont
  Yards, located in Glendale, which is the crossroads of the LIRR Montauk Branch, the Bay Ridge
  Branch (which serves the docks and float barges in Sunset Park, Brooklyn), the Bushwick Branch and
  the New York Connecting Railroad, which connects them all to the rest of the country by traveling
  north to Selkirk, New York, and across the Hudson River to New Jersey and west. The biggest
  product currently shipped from here is municipal waste and construction and demolition debris."
  Source: as F8.  **(P48)**
  → **CONTESTED.** Wikipedia says Fresh Pond Yard is "located in Glendale." Wikipedia's *Fresh Pond
  Road station* article (F161) says the Fresh Pond Bus Depot and yard are adjacent to a station it
  places **in Ridgewood**. See §15.

---

## 4. THE CEMETERY BELT

**Read §15 first.** Every cemetery below resolves to a **cemetery NTA, not the Glendale NTA**, while
several of them **self-identify as Glendale in their own words**. This is the largest contested
block in the dossier.

- **F74.** QUOTE (Wikipedia): "In 1847, New York State's Rural Cemetery Act ended the creation of
  any new cemeteries in Manhattan. Cemetery owners were encouraged to build in Brooklyn and Queens.
  Glendale quickly became almost encircled by cemeteries being located in what is called the
  'Cemetery Belt'."  Source: as F8.
- **F75.** A CONFLICTING date and law. QUOTE (Sacred Heart parish history): "The surrounding
  cemeteries date back to 1852, when New York City passed a law prohibiting any more development of
  cemeteries in the city."  Source: as F33.
  → Wikipedia says **1847, New York State, Rural Cemetery Act**; Sacred Heart says **1852, New York
  City**. NYC Parks (F86) says **1847, New York State**. Forgotten NY (F87) says **1847**.
- **F76.** QUOTE (Wikipedia): "Within Glendale's Cemetery Belt, there are numerous cemeteries that
  surround Glendale. The New York Times wrote in 1986 that 'there are more tombstones in Glendale
  [...] than living residents,' with 40,000 graves at the time. In 2011, the Times described the
  cemeteries as 'a natural fence' that helped retain Glendale's middle-class reputation."
  Source: as F8.
  → **I could not retrieve either NYT article.** These are **Wikipedia quoting the NYT**, not the
  NYT. If a page wants them it must either source the originals or attribute them as second-hand.
  Note also that "40,000 graves" is wildly smaller than the interment counts the cemeteries
  themselves publish (F79: 135,000+ at Mount Carmel alone; F89: 540,000+ at All Faiths), which makes
  the Wikipedia rendering of the 1986 figure suspect on its face.
- **F77.** QUOTE (Wikipedia): "The cemeteries include Cypress Hills, Lutheran All Faiths, Salem
  Fields, Mount Lebanon, Mount Carmel, New Mount Carmel, Beth El (New Union Field), Mount Neboh, and
  Union Field."  Source: as F8.
- **F78.** QUOTE (Wikipedia): "Some of these cemeteries are the resting places of many famous people,
  including Jackie Robinson, Mae West, and Harry Houdini, at whose tomb devotees gather each year on
  Halloween to see if he can pull off the ultimate escape trick and return from the grave. Cypress
  Hills Cemetery is the site of the New York City Police 'Arlington' and also contains the graves of
  Confederate soldiers who died in local prisons and hospitals. It also was one of the earliest
  military cemeteries and its most unusual resident is a circus elephant."  Source: as F8.
  → CAUTION: Jackie Robinson and Mae West are buried at **Cypress Hills Cemetery**, whose own site
  gives its address as Brooklyn (F91). Do not let F78's list imply Glendale burials.

**P19. Mount Carmel Cemetery — the strongest Glendale self-identification in the corpus**

- **F79.** QUOTE (Mount Carmel Cemetery, own website, homepage): "Mount Carmel Cemetery has provided
  a century of service to the Jewish community. Our first interment took place on December 28, 1906.
  To date we have more than 135,000 interments in Sections 1 through 5 of the cemetery. Mount Carmel
  Cemetery is governed by and acts in accordance with the Not-For-Profit Corporation Laws of the
  State of New York."  Source: https://www.mountcarmelcemetery.com/
- **F80.** QUOTE (same page, heading block): "Mount Carmel Cemetery / Glendale, NY".
  Alongside: `Acres 130+ | First Burial 1906 | Interments 135,000+`.  Source: as F79.
- **F81.** QUOTE (same page): "Named after the mountain of Bible lore, Mount Carmel Cemetery spreads
  over 100 acres near the border of Queens and Brooklyn."  Source: as F79.
  → Note the internal conflict: the stat block says **"130+"** acres, the prose says **"over 100
  acres."** Same page.
- **F82.** **The cemetery's own section-by-section addresses, verbatim** (site footer / directions):
  - "Mailing Address / Mount Carmel Cemetery Association / P.O. Box 860093 / **Ridgewood NY 11386**"
  - "Main Office / **83-45 Cypress Hills Street / Glendale NY 11385**"
  - "Section 1 (Old Mount Carmel) / **83-45 Cypress Hills Street / Glendale NY 11385**"
  - "Sections 2 and 3 (New Mount Carmel) / **66-02 Cooper Avenue / Glendale NY 11385**"
  - "Section 4 (former Hungarian Union Field) / **82-99 Cypress Avenue and Cypress Hills Street /
    Glendale NY 11385**"
  - "Section 5 (former Knollwood Park) / Knollwood Park Section / **57-80 Cooper Avenue /
    Ridgewood NY 11386**"
  - "Section 6 (former Mount Neboh) / **82-07 Cypress Hills St**"
  Source: https://www.mountcarmelcemetery.com/ (footer) and
  https://www.mountcarmelcemetery.com/directions
  → **This single institution assigns its own sections to two different neighborhoods** — Glendale
  for sections 1–4 and 6, Ridgewood for section 5 — and uses a ZIP (11386) that is neither 11385 nor
  a Glendale ZIP. **(P24 Knollwood Park section; P23 Mount Neboh section)**
- **F83.** QUOTE (Mount Carmel directions page): "Main Office Physical Address / 83-45 Cypress Hills
  St, Glendale NY 11385".  Source: as F82 (directions).
- **F84.** DERIVED (NTA): **83-45 Cypress Hills Street → `QN0574 Highland Park-Cypress Hills
  Cemeteries (North)`**, zip 11385, cd 405. PLUTO owner `MT CARMEL CEMETERY`, bbl 4037500655.
  → DCP puts it in the cemetery NTA; the cemetery puts itself in Glendale. **Contested. §15.**

**P20. Machpelah Cemetery — Houdini**

- **F85.** QUOTE (Wikipedia, Notable people): "Harry Houdini (1874–1926), magician, buried in
  Machpelah Cemetery".  Source: as F8.
- **F86.** DERIVED (NTA): **82-30 Cypress Hills Street → `QN0574 Highland Park-Cypress Hills
  Cemeteries (North)`**, zip 11385, cd 405. PLUTO owner `MACHPELAH CEMETERY`, bbl 4037320235.
  → I found **no Machpelah-operated website** in this pass, so there is no self-assignment to weigh
  against DCP. **Contested/unresolved. §15.** Note also that Wikipedia's Glendale cemetery list
  (F77) **does not include Machpelah**, even though it names Houdini in the same section — so
  Wikipedia both claims Houdini for Glendale and omits his cemetery from Glendale's list.

**P21. Mount Lebanon Cemetery**

- **F87.** DERIVED (NTA): **78-00 Myrtle Avenue → `QN0574 Highland Park-Cypress Hills Cemeteries
  (North)`**, zip 11385, cd 405. PLUTO record returns address `73-01 MYRTLE AVENUE`, owner
  `MT LEBANON CEMETARY` (misspelling is PLUTO's), bbl 4037500060.
- **F88.** `mtlebanoncemetery.com` resolves to a **Mount Lebanon Cemetery in Pittsburgh,
  Pennsylvania** ("For over 150 years… a place of reflection and celebration for Pittsburgh
  families. Located near Dormont Park on Washington Road"). **Wrong Mount Lebanon. Do not cite it.**
  Source: https://www.mtlebanoncemetery.com/

**P22. Union Field Cemetery — self-assigns to RIDGEWOOD**

- **F89.** QUOTE (Union Field Cemetery, own website): "Chartered by Congregation Rodeph Sholom in
  1846, Union Field Cemetery consists of 63 acres on the Brooklyn/Queens border."
  Source: https://www.unionfieldcemetery.com/
- **F90.** QUOTE (same, contact block): "8211 Cypress Avenue, **Ridgewood, NY 11385**".
  Source: as F89.
- **F91.** DERIVED (NTA): **82-11 Cypress Hills Street → `QN0574 Highland Park-Cypress Hills
  Cemeteries (North)`**, zip 11385, cd 405. PLUTO returns address `82-07 CYPRESS HILLS STREET`,
  owner `SPRUNG FAMILY CEMETERY SOCIETY INC`, bbl 4037500705.
  → **Union Field and Mount Carmel are adjacent, on the same street, and self-assign to different
  neighborhoods.** Union Field says Ridgewood; Mount Carmel says Glendale. Both are in the same
  cemetery NTA. **This is the single clearest illustration of the wave's hazard. §15.**

**P25. All Faiths Cemetery (formerly Lutheran Cemetery) — MIDDLE VILLAGE**

- **F92.** QUOTE (All Faiths Cemetery, own website, header): "67-29 Metropolitan Avenue, **Middle
  Village, NY 11379** / All Faiths Cemetery Non-Sectarian, Established 1852".
  Source: https://allfaithscemetery.org/
- **F93.** QUOTE (same): "The All Faiths Cemetery is located in Central Western Queens and lies
  between the Long Island Expressway on the North, Maurice Ave. Exit and the Inter-Borough Parkway
  (Jackie Robinson), Metropolitan Ave. Exit on the South."  Source: as F92.
- **F94.** QUOTE (same): "Situated on 225 Acres with 19 miles of roadways, the All Faiths Cemetery
  is slightly larger than ¼ the size of NYC's Central Park. We are the final resting place of more
  than 540,000 New Yorkers, many of which were born during the early beginnings of our country from
  1775 to 1797, and of multiple religious denominations."  Source: as F92.
- **F95.** DERIVED (NTA): **67-29 Metropolitan Avenue → `QN0571 Mount Olivet & All Faiths
  Cemeteries`**, zip 11379, cd 405. PLUTO owner `LUTHERAN CEMETERY`, bbl 4027900001.
- **F96.** QUOTE (Forgotten New York, 2024): "A law was passed in 1847 that banned future cemeteries
  from being opened in Manhattan. As a result, Lutheran Cemetery was founded in **Middle Village** in
  1852 by German churches located in Kleindeutschland , Manhattan. Many of the victims of the
  General Slocum tragedy were laid to rest here."  Source: as F32.
- **F97.** QUOTE (Forgotten New York, 2024): "The Lutheran Cemetery Slocum monument was unveiled in
  1905, exactly one year after the fire, by the youngest survivor, two-year old Adella Liebenow, who
  lived until January 2004 when she was 100. The inscription on the front of the stone is repeated
  in German on the back."  Source: as F32.
- **F98.** QUOTE (Forgotten New York, 2024): "Though All-Faith’s “star power” can’t match Green-Wood,
  Woodlawn or Evergreens, here is interred actor Carrie Nye (Dick Cavett’s wife) and numerous members
  of Donald Trump’s family including his father and grandfather (both Frederick Trumps) as well as
  his grandmother Elizabeth, mother Mary and brother Fred Jr."  Source: as F32.
  → **All Faiths is Middle Village by its own address, by DCP, and by Forgotten NY.** It is **not
  Glendale's**, notwithstanding Wikipedia's inclusion of "Lutheran All Faiths" in Glendale's belt
  list (F77). Recorded under §15. Middle Village is not one of this wave's three files, so the
  practical effect is that **no wave-4 file should claim it.**

**P26. Cypress Hills Cemetery**

- **F99.** QUOTE (Cypress Hills Cemetery, own website): "Visit Us: / 833 Jamaica Ave., / **Brooklyn,
  NY 11208**".  Source: https://www.cypresshillscemetery.org/history/
  → The history page itself rendered as navigation chrome only; I could not extract narrative text
  from it. The address is the usable fact.
- **F100.** Wikipedia places Cypress Hills Cemetery in Glendale's belt (F77) and says the parkway
  displaced "hundreds of bodies buried in the Cypress Hills Cemetery" (F57), while the cemetery
  gives a **Brooklyn** address. **Contested. §15.**

**P27. Cemetery of the Evergreens**

- **F101.** QUOTE (NYC Parks, Evergreen Park historical sign): "This parkland draws its name from
  the nearby Cemetery of the Evergreens, which was founded in 1849. The Cemetery of the Evergreens,
  located along Bushwick Avenue on the Brooklyn-Queens border, is one of the many cemeteries that
  sprung up in Queens County in the 19th century."
  Source: https://www.nycgovparks.org/parks/evergreen-park/history
- **F102.** QUOTE (same sign): "In 1847, New York State had enacted the Rural Cemetery Act, and the
  Cemetery of the Evergreens was one of the first properties to be incorporated under the law as a
  non-sectarian, quasi-public institution. Some of the top architects, horticulturists, and engineers
  of the day designed the cemetery with both function and beauty in mind. Among the designing
  engineers were Major John Y. Culyer (1839-1924), who was chief engineer for Prospect Park in
  Brooklyn, and Calvert Vaux (1824-1895), who co-designed Central and Prospect Parks, and whose other
  design accomplishments include the Metropolitan Museum of Art."  Source: as F101.
- **F103.** QUOTE (same sign): "Like the adjoining Highland Park, the Cemetery of the Evergreens is
  an arboretum and bird sanctuary. There are several monuments in the cemetery, including the
  Seaman’s Monument and the Actor’s Fund Memorial and Plot. The cemetery is the resting place for
  many New York celebrities, including dancer Bill “Bojangles” Robinson (1878-1949). Also buried in
  the Cemetery of the Evergreens are many of the victims of the 1911 Triangle Shirtwaist Factory
  fire."  Source: as F101.
- **F104.** The Wikipedia NRHP listing table records `Evergreens Cemetery | 1629 Bushwick Ave. |
  Ridgewood`. Source:
  https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens,_New_York
  → Not Glendale in any source. Recorded because Evergreen **Park** (P15) is claimed for Glendale
  by Wikipedia and for Ridgewood by NYC Parks. §15.

**P28. St. John's Cemetery**

- **F105.** DCP gives it its own NTA: `QN0573 | St. John Cemetery`. Source: as F20.
- **F106.** QUOTE (Forgotten New York, "ARCHIE BUNKER'S PLACE, Glendale," Kevin Walsh, July 30,
  2020): "St. John’s Cemetery, meanwhile, has become famed as a mobster repository, since John Gotti
  and a host of other wiseguys are there."
  Source: https://forgotten-ny.com/2020/07/archie-bunkers-place-glendale/
  → St. John's is **Middle Village**, not Glendale. Recorded only because F106 sits inside an article
  titled "…, Glendale" and could easily be miscarried into a Glendale page.

---

## 5. FOREST PARK — and the JIA question

**P2. Forest Park**

**Before anything else: F21.** DCP classes Forest Park as `QN8291`, a **Joint Interest Area** under
`QN82`, in **no neighborhood NTA and no community district** — structurally identical to Flushing
Meadows Corona Park's QN8191/QN81, which wave 3 ruled belongs to no neighborhood file. I am **not**
adjudicating. I am flagging that the same instrument appears again, and that at least five
neighborhoods abut this park.

- **F107.** NYC Parks property record: `Forest Park | Myrtle Ave, Union Tpke, Park Lane S |
  80-30 PARK LANE | ZIP 11375, 11385, 11415, 11421 | 506.86 acres | Flagship Park | Community Board
  305405406409`. Source: https://data.cityofnewyork.us/resource/enfh-gkve.json
  → Its mailing address, **80-30 Park Lane**, is a **Kew Gardens** address, not a Glendale one.
- **F108.** NYC Parks' own page gives a different CB and ZIP set: "Zip Code: 11375, 11385, 11415,
  11418, 11421 / Community Board: 5, 6, 9 / Park ID: Q015 / Acreage: 506.86".
  Source: https://www.nycgovparks.org/parks/forest-park/highlights/11069
  → The dataset says CBs 3, 5, 6, 9; the web page says 5, 6, 9. Conflict within NYC Parks.
- **F109.** A THIRD acreage. QUOTE (Wikipedia): "From August 9, 1895 until 1898, one hundred and
  twenty-four parcels were bought for the new 538-acre (218 ha) Forest Park".  Source: as F8.
  NYC Parks says **506.86**. NYC Parks' own Jackson Pond Playground blurb also says "Forest Park, a
  538-acre park". Three figures, two agencies. Do not publish a single acreage without flagging.
- **F110.** QUOTE (NYC Parks, Forest Park historical sign): "One of New York City’s natural
  treasures, Forest Park’s topography was created by the Wisconsin glacier 20,000 years ago and
  includes the Harbor Hill Moraine, a series of small hills known as “knob and kettle” terrain. The
  area was inhabited by the Rockaway, Lenape, and Delaware tribes until the Dutch West India Company
  settled the area in 1635."
  Source: https://www.nycgovparks.org/parks/forest-park/history
- **F111.** QUOTE (same sign): "In 1892, the New York State Legislature authorized an initiative by
  Brooklyn officials to establish a large public park. The Brooklyn Parks Department purchased the
  first parcel of what was called Brooklyn Forest Park on August 9, 1895, with additional
  acquisitions continuing until 1898. The park and Forest Park Drive were designed by the firm of
  Olmsted, Olmsted, and Elliot. The park was acquired by the City of New York in 1898, with the
  consolidation of Greater New York. It was managed by the Brooklyn Parks Department, which also
  managed all of Queens’ parks until an independent Queens Parks Department was established in
  1911."  Source: as F110.
- **F112.** QUOTE (Wikipedia, on the same acquisition): "Since Brooklyn and Queens were incorporated
  into New York City by the time all of the park's land was procured, the park's name was shortened
  from the original moniker of 'Brooklyn Forest Park'."  Source: as F8.
- **F113.** QUOTE (NYC Parks sign): "Forest Park is named for its many trees, including the northern
  red oak, scarlet oak, tulip tree, shagbark hickory, white oak, wild black cherry, dogwood,
  Virginia creeper, sassafras, and corktree. The park contains a pine grove that was planted in 1914
  to replace more than 15,000 trees lost to a fungus known as chestnut blight in 1912. Among these
  trees, there are some specimens that survived and date back to 1909. The park also contains the
  largest continuous oak forest in Queens and a stand of memorial trees planted along Forest Parkway
  in 1919 to commemorate fallen World War I soldiers."  Source: as F110.
- **F114.** QUOTE (NYC Parks, Forest Park main page): "With a “knob and kettle” terrain (a series of
  small hills) and 165 acres of trees, the park is an agrarian delight."
  Source: https://www.nycgovparks.org/parks/forest-park
- **F115.** QUOTE (Wikipedia): "Forest Park Drive, which runs throughout the park, is closed to
  vehicles from Woodhaven Boulevard to Metropolitan Avenue, making it a popular spot for skaters."
  Source: as F8.
- **F116.** QUOTE (Sacred Heart parish history): "Forest Park was established in the 1880’s, and was
  located where it is today. After World War I, a portion of the park was converted into an athletic
  field – now known as Victory Field."  Source: as F33.  **(P9 Victory Field)**
  → "the 1880's" conflicts with the 1892/1895 dates in F109–F111. Flagging.

**P7. Forest Park Golf Course · P6. Oak Ridge**

- **F117.** QUOTE (NYC Parks, Oak Ridge historical sign): "Standing in a grove of red and black oaks,
  Oak Ridge is located on the crest of the Harbor Hill Moraine (a mass of rock formed by glacial
  movement) at the southwestern corner of Forest Park, overlooking Jamaica Plains. A turn-of-the-
  century golf house, Oak Ridge now serves as the Forest Park administration headquarters, the home
  of the Queens Council for the Arts, and a community center."
  Source: https://www.nycgovparks.org/parks/forest-park/highlights/12555
- **F118.** QUOTE (same sign): "During the acquisition of Forest Park in 1895, landowner David
  Leggett sold this parcel to the Brooklyn Department of Parks. This two-story structure was built
  in 1905 in a Dutch Colonial Revival style as a facility for the Forest Park Links. It was designed
  by the firm of Helmle, Huberty, & Hudswell, who also designed the landmark Williamsburgh Savings
  Bank (now home to HSBC bank) in Brooklyn."  Source: as F117.
- **F119.** QUOTE (same sign): "The Forest Park Links opened as a 9-hole golf course in 1901, and
  expanded to 18 holes in 1905. In the early days after its expansion, professional golfers used the
  course, caddies earned 25 cents per game, and many of the numbered holes had names such as
  “Camelback,” “Cabbage Patch,” “Bunker Hill,” “Lover’s Lane,” “Old Glory,” and “San Juan Hill,”
  named for Teddy Roosevelt’s erroneously attributed charge in the Spanish-American War (1898-99).
  San Juan Hill, the eighth hole, also became popular as a site for sledding in the winter. The
  110-acre, par 67 course was modeled after Scottish links and is still known as one of the City’s
  most challenging golf courses."  Source: as F117.
- **F120.** QUOTE (NYC Parks Forest Park sign, describing the same building differently): "Forest
  Park is home to Oak Ridge, an exquisite example of Dutch Colonial architecture, Oak Ridge was
  built in 1905 by the architectural firm of Helmle, Huberty & Hudswell… Originally built as the
  golf course clubhouse, it is now the administration building for Forest Park staff."
  Source: as F110.
  → F117 adds "home of the Queens Council for the Arts, and a community center"; F120 says only
  administration building. Two NYC Parks signs, two descriptions.
- **F121.** QUOTE (NYC Parks Forest Park sign): "The Overlook was completed in 1912 and houses NYC
  Parks’ Queens borough operations. The park’s greenhouse, built in 1910, grows trees and plants for
  many city parks."  Source: as F110.

**P3. Dry Harbor Playground / P4. Lawrence Linekin Children's Playground**

- **F122.** QUOTE (NYC Parks, Dry Harbor Playground sign): "When the Brooklyn Parks Department began
  acquiring parcels for Forest Park in 1895, a local Frenchman named **Edward Bourcier sold 15 of
  his 17 acres**, keeping the last two which held his home. Bourcier died in 1906 and **James
  Strain** bought the house from Bourcier’s heirs and turned it into a private clubhouse for the
  Brooklyn Forest Park Golf Club. On **November 31, 1924**, the City of New York acquired the
  two-acre site of the house, and current playground, by condemnation for park purposes."
  Source: as F31.
  → **November 31 is not a date.** Recorded verbatim; do not repeat it.
- **F123.** A CONTRADICTORY account of the same man, from a **different NYC Parks sign**: QUOTE
  (Oak Ridge sign): "In 1906, a second, more exclusive golf house opened near Myrtle Avenue and 80th
  Street at the house of wealthy French landowner Edward Bourcier. Bourcier had sold all but two
  acres of his land to the Brooklyn Parks Department several years before. At his death, his house,
  which now stood at the edge of Forest Park, was sold not to Parks, but to a private owner named
  **Charles Strain**, who transformed it into a private clubhouse for the elite Brooklyn Forest Park
  Golf Club. The City of New York rightfully acquired that property in 1924, and the house is now a
  part of Dry Harbor Playground on the north side of Forest Park."  Source: as F117.
  → **James Strain (F122) vs Charles Strain (F123), on two NYC Parks signs.** Do not resolve.
- **F124.** A THIRD account. QUOTE (Wikipedia): "Dry Harbor Playground, at Myrtle Avenue and 80th
  Street, opened in 1934. It has swings, seesaws, a wavy slide, a flagpole, and a school gym. It was
  created when **Edward Bourcier gave away 17 acres (6.9 ha) of his land** as part of Forest Park.
  The playground also consists of an attached one-story house."  Source: as F8.
  → Parks says Bourcier **sold 15 of 17** acres; Wikipedia says he **gave away 17**. Three accounts.
- **F125.** QUOTE (Dry Harbor sign): "Dry Harbor Playground was constructed in 1934 with swings,
  see-saws, a wavy slide, a flagpole, and a schoolyard gymnasium. A 1983 renovation brought the
  playground to its present state: basketball courts, benches, a wading pool with a spray head,
  shuffleboard, a jungle gym, slides with safety surfacing, drinking fountains, horseshoe courts, a
  flagpole with a yardarm, bocci ball courts, timberform play equipment, and a baseball field."
  Source: as F31.
- **F126.** QUOTE (Dry Harbor sign): "The Dry Harbor nursery school house dates back to the 19th
  century and the birth of Forest Park."  Source: as F31.
- **F127.** QUOTE (Dry Harbor sign): "The playground is located near the corner of Myrtle Avenue and
  80th Street in Forest Park".  Source: as F31.
  → **Inside Forest Park, i.e. inside the JIA.** See F21. **§15.**
- **F128.** QUOTE (NYC Parks, Lawrence Linekin Children's Playground sign): "This playground, located
  in Forest Park near the corner of Myrtle Avenue and 80th Street, honors Lawrence G. Linekin
  (1931-1996), a local community activist who created the Friends of Forest Park in 1976 and served
  as its chairman until 1990."
  Source: https://www.nycgovparks.org/parks/forest-park/highlights/19561
- **F129.** QUOTE (same sign): "Among them were the Executive Board of the Parks Council of New York
  City and Planning Board 5 Parks Committee. Linekin was selected as a candidate for New York State
  Assembly in 1970 and for the New York City Council in 1981. His work in Forest Park was especially
  notable. In the depths of the fiscal crisis of the 1970’s, he organized the Friends of Forest Park
  to galvanize the community in aid of the park."  Source: as F128.
- **F130.** QUOTE (same sign): "In 1979, Parks planted an evergreen tree near the playground where
  Linekin started an annual Community Tree Lighting ceremony that continues to the present day. In
  1999 Parks Commissioner Henry J. Stern dedicated this tree in Linekin’s name. … Today, Lawrence
  Linekin Children’s Playground sits within the larger Dry Harbor Playground."  Source: as F128.

**P5. George Seuffert, Sr. Bandshell**

- **F131.** QUOTE (NYC Parks, Seuffert Bandshell sign): "Born in Brooklyn to Bavarian immigrants,
  George Seuffert, Sr. (1875-1964) received his only formal music training from the violinist Joseph
  Zoellner. Seuffert became a music teacher and concert violinist before establishing the Concordia
  Military Band in 1894, later becoming the Seuffert Band. They performed on a bandstand on this spot
  until 1920, when the bandshell was built to replace it."
  Source: https://www.nycgovparks.org/parks/forest-park/highlights/12782
- **F132.** QUOTE (same sign): "Seuffert worked as a bank executive and personally knew John Philip
  Sousa (1854-1932), the famous Marine Band leader. Sousa had a large influence on Seuffert’s son,
  George Seuffert, Jr., who took his father’s place as bandleader in 1931. Seuffert retired in 1945
  and **died in Ridgewood, Queens**, on November 9, 1964. The bandshell was named for him by local
  law in 1979."  Source: as F131.
- **F133.** QUOTE (same sign): "He also served on the advisory board of the Lighthouse Music School,
  the New York Association for the Blind, and taught music in Bushwick and Grover Cleveland High
  Schools, serving as the chair of the music department. … In 1966, Mayor John V. Lindsay (1921-2000)
  appointed Seuffert the City’s music consultant. Seuffert reportedly knew all the world’s national
  anthems, and was responsible for performing them at diplomatic functions for the city."
  Source: as F131.
- **F134.** QUOTE (same sign): "By the time Seuffert died on May 9, 1995 in Narragansett, Rhode
  Island, the Seuffert Band was one of the last concert bands in the city. After Seuffert’s death,
  the Queens Symphony Orchestra began performing in the bandshell, continuing the tradition of free
  concerts."  Source: as F131.
- **F135.** QUOTE (same sign): "Set in the lush environs of Forest Park, the bandshell accommodates
  **3,500 people** and was renovated in 1977 with $204,751 in state and federal funds. In January of
  1999, the bandshell was closed for an extensive, $3.4 million renovation funded by Borough
  President Claire Shulman. It reopened on June 11, 2000".  Source: as F131.
- **F136.** A CONFLICTING capacity. QUOTE (NYC Parks, Forest Park main page): "The George Seuffert,
  Sr. Bandshell, which can accommodate **2,800 people**, hosts free concerts throughout the warm
  season."  Source: as F114.  → **3,500 vs 2,800, both NYC Parks.**
- **F137.** A THIRD account of the Seufferts. QUOTE (Wikipedia): "A bandstand built in Forest Park in
  1898 preceded a bandshell built in 1920; for almost a century, George Seuffert Sr.—and later, his
  son, Dr. George F. Seuffert—played free concerts at the bandshell every weekend until the latter
  died in 1995. The bandshell is now for public use."  Source: as F8.
  → Wikipedia gives the son's middle initial as **F**; NYC Parks calls him **George Seuffert, Jr.**

**P8. Forest Park Carousel — NOT LISTED AS GLENDALE'S BY ANY SOURCE I FOUND**

- **F138.** The Wikipedia NRHP listing table records: `Forest Park Carousel | refnum 04000706 |
  Woodhaven Blvd. and Myrtle Ave. | city = **Woodhaven** | listed 2004-07-16`.
  Source: as F104.
- **F139.** QUOTE (NYC Parks, Forest Park main page, "Featured Monument"): "The Carousel / Lions and
  tigers and chariots ! Oh my! Learn about this century-old merry-go-round, one of only five within
  the Parks Department, before hopping on to take a spin."  Source: as F114.
  → **The carousel is NRHP-listed under Woodhaven and sits inside the Forest Park JIA. No source I
  retrieved calls it Glendale's.** Flagged so no one reaches for it. §15.

**Other Forest Park features (all inside the JIA), recorded for completeness only**

- **F140.** NYC Parks lists these Forest Park "Highlights": DeVoy Playground, Dry Harbor Playground,
  George Seuffert, Sr. Bandshell, Jackson Pond Playground, Jayne Carlson Triangle, Lawrence Linekin
  Children's Playground, Marco Giovanelli Playground, Mary Whalen Playground, Oak Ridge, PFC
  Lawrence Strack Meadow (page 1 of 2).
  Source: https://www.nycgovparks.org/parks/forest-park/highlights
- **F141.** QUOTE (NYC Parks, DeVoy Playground blurb): "Located on Union Turnpike at 71st Avenue in
  Forest Park, this playground is named after Joseph E. DeVoy (1926-2000), an active member of the
  **Forest Hills**…"  Source: as F140.
- **F142.** QUOTE (NYC Parks, PFC Lawrence Strack Meadow blurb): "This meadow honors Private First
  Class Lawrence George E. Strack (1948-1967), the first **Woodhaven** resident to die serving in the
  Vietnam War."  Source: as F140.
  → F141 and F142 show NYC Parks itself attaching Forest Park features to **Forest Hills** and
  **Woodhaven**, not Glendale. Recorded as evidence for the §15 / JIA question.
- **F143.** QUOTE (NYC Parks Forest Park sign): "Forest Park also offers a wide array of recreational
  facilities, such as the Carousel, 110-acre Forest Park Golf Course George Seuffert, Sr. Bandshell,
  a bridle path for horses, tennis courts, playgrounds, Victory Field, areas for bird watching, and
  over five miles of walking trails. The park also contains several monuments, including the
  Richmond Hill War Memorial. The Forest Park Trust, a private-public partnership, provides
  additional support for the park."  Source: as F110. (Missing comma after "Golf Course" is the
  source's.)
- **F144.** QUOTE (Wikipedia): "Forest Park also has a public golf course, as well as horse riding
  trails (stables are located nearby, off the park grounds)."  Source: as F8.
- **F145.** NYC Parks lists "Forest Park Visitor Center / Forest Park Nature Center is currently
  closed to the public."  Source: as F108. → **A page must not send a visitor to a closed facility.**

---

## 6. GLENDALE'S OWN PARKS

Complete NYC Parks inventory for Queens Community Board 405 (36 properties) was retrieved from
`enfh-gkve`. The ones in or adjoining Glendale:

**P10. "Uncle" Vito F. Maranzano Glendale Playground — unambiguously Glendale**

- **F146.** NYC Parks property record: `"Uncle" Vito F. Maranzano Glendale Playground | Central Ave.
  bet. 70 St. and 71 St. | 2869 CENTRAL AVENUE | 11385 | 1.15 acres | Playground | CB 405 | Park ID
  Q289`. Sources: https://data.cityofnewyork.us/resource/enfh-gkve.json and
  https://www.nycgovparks.org/parks/uncle-vito-f-maranzano-glendale-playground/history
- **F147.** DERIVED (NTA): **2869 Central Avenue → `QN0503 Glendale`**, zip 11385, cd 405, PLUTO
  owner `NYC DEPARTMENT OF PARKS AND RECREATION`, bbl 4036610001. **No conflict from any source.**
- **F148.** QUOTE (NYC Parks, Maranzano sign): "This area was farmland for much of the 19th century.
  In 1885, the Newtown Board of Education opened School No. 13, the Glendale Union Free School. A
  larger school building was erected on the site in 1893. When the five boroughs were incorporated in
  1898, the school came under the jurisdiction of the City of New York Board of Education and was
  renamed P.S. 67. Its principal from 1893 to 1915 was John Wesley Drumm (1862-1930), for whom nearby
  Drumm Triangle is named. After P.S. 91 was built a few blocks to the east in 1915, the P.S. 67
  building provided facilities for students with disabilities and later served as an annex for
  Bushwick and Grover Cleveland High Schools."  Source: as F34 (Maranzano).
- **F149.** QUOTE (same sign): "In 1940-41 Parks acquired the school property and an adjacent parcel
  for a new playground, which opened in 1942 as Glendale Playground. On the cleared site, laborers
  from the Federal Works Progress Administration built handball and basketball courts, a softball
  diamond, play equipment, and a public restroom. A renovation in 1996 installed maritime-themed play
  equipment at the playground including whale, dolphin, and fish figures mounted on a wall, a
  concrete whale play sculpture and a spray shower."  Source: as F34.
- **F150.** QUOTE (same sign): "In 2001, the playground’s ball field was named in honor of Richard
  Koehler. Koehler was active in many of Glendale’s civic groups and coached local children at the
  Ridgewood Glendale Middle Village Maspeth Little League for more than two decades before his death
  in 2000. In 2007, the playground was renamed “Uncle” Vito F. Maranzano Glendale Playground."
  Source: as F34.
- **F151.** QUOTE (same sign): "This playground honors Vito Frank Maranzano (1923-2006), longtime
  Glendale resident and neighborhood activist. Born in Italy, Maranzano immigrated with his family to
  Bushwick, Brooklyn. He served in the Navy during World War II and moved to Glendale afterward. He
  was a member of multiple organizations in the neighborhood, including as president of Glendale
  Property Owners Association, Greater Ridgewood Restoration Corporation and the Ridgewood Local
  Development Corporation. He was also active in the Kiwanis Group of Glendale, the Glendale/104th
  Precinct Civilian Observation Patrol (GCOP), UNICO International and had served as chairman of the
  Community Board 5 Public Safety Services Committee."  Source: as F34.
- **F152.** A CONFLICTING opening date. QUOTE (Wikipedia): "In 1940–1, the property of PS 67, as well
  as an adjoining lot, became the location of the Glendale Playground at Central Avenue and 70th
  Street. The playground opened in 1942."  Source: as F8. (This one agrees with Parks; recorded for
  the cross-check.)

**P11. Drumm Triangle**

- **F153.** QUOTE (NYC Parks, Drumm Triangle sign): "This triangular site, at the intersection of
  Cooper Avenue, Cypress Hills Street, and 65th Place, was named for John Wesley Drumm (1862-1930) on
  April 19, 1932 by the Board of Aldermen."
  Source: https://www.nycgovparks.org/parks/drumm-triangle/history
- **F154.** QUOTE (same sign): "Drumm was a pioneering Queens educator who broadened the knowledge
  and horizons of generations of neighborhood children. His 37-year career as a principal in Queens
  public schools began in 1893 at the Glendale Union Free School #13, located in what was then part
  of Newtown. After the five boroughs of New York City were incorporated in 1898, the school was
  renamed Public School 67 with Drumm remaining as its principal until 1915. From 1915 to 1929 Drumm
  presided over Public School 91 on Central Avenue and 69th Street."  Source: as F153.
- **F155.** QUOTE (same sign): "Drumm passed away on June 8, 1930, at the close of his first year as
  principal of Public School 119. On May 21, 1932 this site, which is located near his home on
  Cypress Hills Street, was dedicated in his honor. The memorial plaque set on a boulder was donated
  by the Alumni Association of P.S. 91."  Source: as F153.
  → Note: named **April 19, 1932** by the Board of Aldermen, dedicated **May 21, 1932**. Same sign.
- **F156.** QUOTE (same sign): "This site was acquired by Parks on February 4, 1926. It was restored
  under a $204,000 capital project funded by Councilmember Ognibene in 1997. The renovation
  transformed Drumm Triangle into **a sanctuary for Glendale residents** with new shrubs and
  groundcover, decorative pavement, and World’s Fair benches."  Source: as F153.
  → NYC Parks calls it Glendale's in its own words. Record: `Zip Code: 11385 | Community Board: 5 |
  Park ID: Q139 | Acreage: 0.17`. (The dataset says 0.166; the page says 0.17.)

**P12. Glendale Veterans Triangle · P13. Glendale War Memorial**

- **F157.** NYC Parks property record: `Glendale Veterans Triangle | Myrtle Ave., Cooper Ave., 70 St.
  | 11385 | 0.005 acres | Triangle/Plaza | Park ID Q075`. Sources: `enfh-gkve` and
  https://www.nycgovparks.org/parks/glendale-veterans-triangle/monuments
  → The Parks page gives acreage as **0.01**; the dataset gives **0.005**. Conflict.
- **F158.** QUOTE (NYC Parks, Glendale War Memorial monument page): "A gift of the people of
  Glendale, this war memorial, dedicated in 1921, honors 21 Glendale residents who died in combat
  during World War I. Sculptor Anton Schaaf (1869-1943) created the bronze bas-relief of a female
  figure holding a torch in her hand set within a granite stele designed by the architectural firm of
  Helmle and Corbett. Schaaf also collaborated with Helmle and Corbett on the Ridgewood War Memorial
  in Queens."  Source: as F157.
- **F159.** Monument record fields, verbatim: `Artist: Anton Schaaf | Dedicated: 1921 | Location:
  Myrtle and Cooper Avenues | Architect: Helmle and Corbett | Materials: Plaque--bronze;
  Stele--Georgia granite, | Dimensions: Total dimensions H: 13'6" W: 11' D: 7' | Donor: People of
  Glendale | Cast: 1921`.  Source: as F157.
- **F160.** The inscription, QUOTED verbatim from the NYC Parks record: "ERECTED BY THE PEOPLE OF
  GLENDALE / IN GRATEFUL REMEMBRANCE / OF THOSE OF THEIR NUMBER WHO / SERVED IN THE WORLD WAR /
  1917-1918 / THE NAMES OF THOSE WHO / LOST THEIR LIVES ARE / HERE INSCRIBED / P.D. BODAMER ---
  J.J. MCCOURTY / S. BIRNEY --- F.E. PAYNTON / J.V. DETTLING --- G.G. POWELL / C. FREY --- J.E. RAUTH
  / J.E. GRAUMANN --- C. ROESCH / C. KAYSER --- P.J. SCHEIBEL / A. KNIPPER --- C.J. SCHMIDT / O. KOCH
  --- W. SCHULTZ / C.T. LEONARD --- E.V. SULLIVAN / J.F. MATHIS --- F. WINTER / A.R. WALKER / PRO
  PATRIA /".  Source: as F157.
- **F161.** A DETAIL NYC PARKS DOES NOT MENTION. QUOTE (Sacred Heart parish history): "World War I
  came and went, and after the war, a monument to the war dead was erected at the intersection of
  Cooper and Myrtle Avenues. A German cannon captured by a Glendale Marine, Andrew J. Hergenrother,
  who lived on Brush Street (79th), is placed at the memorial."  Source: as F33.
  → The captured German cannon appears **only** in the parish source; NYC Parks' monument record does
  not mention it, and I could not confirm the cannon is still present. Needs its own check.

**P14. Mafera Park — NYC PARKS ITSELF CALLS IT THE GLENDALE/RIDGEWOOD BOUNDARY**

- **F162.** QUOTE (NYC Parks, Mafera Park sign): "For many years, this site has been called “Farmers
  Oval” in tribute to the Glendale Farmers Base Ball Club, a semi-professional team that was active
  from the early 1900's through the 1950's. The Glendale Farmers played ball on this site for almost
  half a century. In 1948 the City of New York acquired the site bounded by Lutheran Cemetery Branch
  of the Brooklyn-Manhattan Transit line, the Manhattan Beach Division of the Long Island Railroad,
  the New York Connecting Railroad, and 65th Place."
  Source: https://www.nycgovparks.org/parks/mafera-park/history
- **F163.** QUOTE (same sign): "Mayor William O’Dwyer, Queens Borough President James A. Burke, and
  Parks Commissioner Robert Moses participated in the groundbreaking ceremony on June 28, 1949. One
  year later, **the children of Ridgewood** were able to enjoy the play equipment and the many
  athletic facilities."  Source: as F162.
- **F164.** QUOTE (same sign): "During its early years, the park was known variously as Farmers Oval,
  Ridgewood Park, and Glen Ridge Park. **The latter name refers to the park’s location on the
  boundary between Glendale and Ridgewood.** In 1967 the official name was changed by law from
  Glenridge Park to Joseph F. Mafera Park in memory of the Queens Democrat."  Source: as F162.
- **F165.** QUOTE (same sign): "**A long-time Ridgewood resident**, Mafera (1895-1967) served in the
  American Expeditionary Forces during World War I. He launched his career in the public service as
  secretary and later superintendent of the Queens Parks Department from 1925 to 1932. … After the
  death of Borough President Maurice A. Fitzgerald in August 1951, Mafera was chosen interim Queens
  Borough President. He was an executive member of the Ridgewood Democratic Club, and from 1951 to
  1961, he served on the New York City Tax Commission. Mafera died on February 12, 1967."
  Source: as F162.
- **F166.** DERIVED (NTA): **65-15 Shaler Avenue (the PLUTO address behind the park's `65 PLACE AND
  SHALER AVENUE`) → `QN0502 Ridgewood`**, zip 11385, cd 405.
  NYC Parks lists `Zip Code: 11379, 11385 | Park ID: Q305 | Acreage: 5.40`.
- **F167.** A CONFLICTING account. QUOTE (Wikipedia): "In 1949, a former Minor League Baseball field
  at 65th Place named Farmers' Oval after the Glendale Farmers Base Ball Club team, which had played
  at the field for half a century prior, was the site of a groundbreaking for a new park. In 1967,
  the park was officially renamed the Joseph F. Mafera Park, memorializing the late Queens borough
  president. At Mafera Park, roller hockey can be played on the rink there."  Source: as F8.
  → Wikipedia files Mafera Park under **Glendale**'s Parks section. Parks says Ridgewood/boundary.
  DCP geometry says Ridgewood. **Contested. §15.** Also note Parks calls the team "semi-professional"
  and Wikipedia calls the field "a former Minor League Baseball field."

**P15. Evergreen Park — NYC PARKS SAYS RIDGEWOOD, DCP GEOMETRY SAYS GLENDALE**

- **F168.** QUOTE (NYC Parks, Evergreen Park sign): "**Evergreen Park is located in the Queens
  neighborhood of Ridgewood**, bounded by Metropolitan Avenue and Evergreen Cemetery. It is the
  Queens extension of the Brooklyn neighborhood of the same name."  Source: as F101.
- **F169.** QUOTE (same sign): "The City of New York acquired the property for this park in January
  1941. At that time, the park was divided by 60th Street, which cut through the property. The City
  then assigned Evergreen Park to the Board of Education and Parks in the spring of 1942. In order to
  expand the parkland and unify the two sections, the City closed 60th Street and gave the area to
  Parks. Part of the park is jointly operated with the adjacent P.S. 68. The playground opened
  officially on January 11, 1943."  Source: as F101.
- **F170.** QUOTE (same sign): "Between 1999 and 2000, Mayor Giuliani contributed nearly $212,000 for
  renovations of Evergreen Park."  Source: as F101.
- **F171.** DERIVED (NTA): **60-09 / 60-24 Saint Felix Avenue → `QN0503 Glendale`**, zip 11385,
  cd 405. NYC Parks record: `Evergreen Park | St Felix Ave. bet. Seneca Ave. and 60 Pl. | 60-09 Saint
  Felix Avenue | 11385 | 3.32 acres | Jointly Operated Playground`.
- **F172.** And Wikipedia claims the surrounding section for Glendale — see **F17**: "…includes the
  neighborhoods of **Evergreen (near and around Evergreen Park)** and Liberty Park".
  → **NYC Parks says Ridgewood in so many words; DCP geometry and Wikipedia say Glendale.
  Contested. §15.**  **(P54 Evergreen section; P53 Liberty Park section)**

**P16. Pinocchio Playground · other CB5 properties**

- **F173.** NYC Parks record: `Pinocchio Playground | 74 St., 75 St. bet. Cooper Ave. and 78 Ave. |
  74-01 78 AVENUE | 11385 | 1.016 acres | Jointly Operated Playground | Park ID Q289`. The Parks page
  carries **no historical sign text at all** — only "This text is part of Parks' Historical Signs
  Project…" followed by nothing. Sources: `enfh-gkve`;
  https://www.nycgovparks.org/parks/pinocchio-playground/history
  → **There is no Pinocchio Playground history to write.** Recorded so nobody invents one.
- **F174.** Same for **Glendale Veterans Triangle**: the `/highlights` and `/history` pages have the
  boilerplate line and no body text. The **monument** page (F158–F160) is where the content is.
- **F175.** Other CB5 Parks properties with ZIP 11385 that are **Ridgewood's**, listed so this file
  does not reach for them: `Starr Playground (210 Onderdonk Avenue)`, `Rosemary's Playground (751
  Woodward Avenue)`, `Benninger Playground (60-45 Madison Street)`, `Grover Cleveland Playground
  (3-96 Grandview Avenue)`, `Clemens Triangle`, `Myrtle Avenue Clemens Triangle`. Source: `enfh-gkve`.
- **F176.** Other CB5 properties that are **Maspeth's or Middle Village's**: `Frank Principe Park`,
  `Frontera Park`, `Reiff Playground (59-25 Fresh Pond Road)`, `Hull Triangle`, `Garlinge Triangle`,
  `Federalist Triangle`, `Luke J. Lang Square`, `Peter Chahales Park`, `Quick Brown Fox Triangle`,
  `Technical Sergeant Thomas J. Davey Triangle`, `Whitefish Triangle`, `Juniper Valley Park (71-01
  Juniper Blvd South)`, `Middle Village Playground (78-38 68 Road)`, `Middle Village Veterans
  Triangle`. Source: `enfh-gkve`.

**P17. Highland Park / Ridgewood Reservoir · P18. Jackie Robinson Parkway**

- **F177.** NYC Parks records: `Highland Park | Highland Blvd, Jamaica Ave, Jackie Robinson Pkwy |
  58-02 VERMONT AVENUE | 11207, 11208, 11385 | 101.28 acres | CB 305405`; and `Jackie Robinson
  Parkway | 11207, 11375, 11385, 11415 | 72.75 acres | Parkway | CB 304305405406`. Source: `enfh-gkve`.
- **F178.** QUOTE (Wikipedia): "South of the Liberty Park section of Glendale (and separated by
  cemeteries as well as the Jackie Robinson Parkway) is Ridgewood Reservoir, a naturalistic part of
  Highland Park. The New York City government renovated it in 2013 by adding new period lighting and
  fences."  Source: as F8.
  → Wikipedia's own sentence places the reservoir **south of Glendale and separated from it** by
  cemeteries and a parkway. Its Vermont Avenue address is **Brooklyn (11207/11208)**. It is named
  *Ridgewood* Reservoir. **This is not Glendale's and the name is a trap. §15.**

**P52. Seither Stadium**

- **F179.** QUOTE (Wikipedia): "On the easternmost edge of Glendale, on the site between the train
  tracks of the Rockaway Beach and Montauk Branches of the LIRR where an old ice house once stood, is
  Seither Stadium, the home field of the Ridgewood, Glendale, Middle Village and Maspeth Little
  League."  Source: as F8.
  → **Seither Stadium appears in NO NYC Parks record** — it is not in the 36-property CB5 inventory
  and not in the ZIP-11385 query. It is presumably private/league-owned. Wikipedia is the **only**
  source I have for it, and the league it names spans all four CD5 neighborhoods. Weak; flag.

---

## 7. ARCHITECTURE AND THE THREE NATIONAL REGISTER HISTORIC DISTRICTS

**This is the sharpest documented conflict in the dossier.** All three districts are described by
their own Wikipedia articles as "in Glendale, Queens," and all three are filed by the NRHP listing
table under **city = Ridgewood**.

- **F180.** QUOTE (Wikipedia, *Glendale, Queens*): "In the lower portion of Glendale, three national
  historic districts were listed on the National Register of Historic Places in 1983. These are the
  75th Avenue-61st Street Historic District, Central Avenue Historic District and Cooper Avenue Row
  Historic District. Each of these districts contains significant numbers of early 20th century
  buildings made with the distinctive yellow Kreischer brick."  Source: as F8.
- **F181.** QUOTE (Wikipedia): "The housing stock here often dates back to the late 1800s/early 1900s
  and as a result, a significant number of them are made of yellow Kreischer brick much like similar,
  landmarked buildings in neighboring Ridgewood."  Source: as F8.
  → Note Wikipedia's own framing: the Kreischer brick rowhouses are the **Ridgewood** landmark type,
  and Glendale's are described as *like* them. Relevant to §15.

**P29. 75th Avenue–61st Street Historic District**

- **F182.** QUOTE (Wikipedia, *75th Avenue–61st Street Historic District*): "75th Avenue–61st Street
  Historic District is a national historic district in **Glendale**, Queens, New York.  It includes
  183 contributing buildings built between 1910 and 1925.  They consist mainly of two story brick row
  houses with one apartment per floor.  Building features include round and box front dwellings, cast
  stone detailing, brownstone stoops, pressed metal cornices, and covered porches."
  Source: https://en.wikipedia.org/wiki/75th_Avenue%E2%80%9361st_Street_Historic_District
- **F183.** The same article lists the constituent addresses verbatim: `60th Lane 75-02 to 75-50 /
  75-01 to 75-49`; `61st St 72-28 to 72-72 / 72-31 to 72-69 / 75-02 to 75-50 / 75-01 to 75-49`;
  `62nd St 75-02 to 75-34 / 75-15 to 75-29 / 74-18 to 74-46`. It was "listed on the National Register
  of Historic Places in 1983."  Source: as F182.
- **F184.** THE CONFLICT. The Wikipedia NRHP listing table for Queens records: `75th Avenue-61st
  Street Historic District | refnum 83001764 | address "60th Lane, 60th and 62nd Sts. bounded by St.
  Felix, Myrtle, and Cooper Aves." | city = **Ridgewood** | listed 1983-09-30 | lat 40.698611
  lon -73.894722`.  Source: as F104.
  → Note the table's address says **60th and 62nd Sts** where the article says **61st St** and
  **62nd St**. Also, the table's own file photo is named `RIDGEWOOD-GLENDALE-FRESH POND 081.JPG` —
  the photographer could not choose either.
- **F185.** DERIVED (NTA): **75-02 61 Street → `QN0503 Glendale`**, zip 11385, cd 405. DCP geometry
  agrees with the article and against the NRHP table's city field.

**P30. Central Avenue Historic District**

- **F186.** QUOTE (Wikipedia, *Central Avenue Historic District (Queens)*): "Central Avenue Historic
  District is a national historic district in **Glendale**, Queens, New York.  It includes 104
  contributing buildings built in 1916.  They consist of three story brick tenements with two
  apartments per floor.  Buildings feature front facades and amber iron-spot brick. It was listed on
  the National Register of Historic Places in 1983."
  Source: https://en.wikipedia.org/wiki/Central_Avenue_Historic_District_(Queens)
- **F187.** THE CONFLICT: `Central Avenue Historic District | refnum 83001761 | "Roughly bounded by
  Myrtle and 70th Ave., and 65th and 66th Sts." | city = **Ridgewood** | listed 1983-09-30 |
  lat 40.702778 lon -73.890278`.  Source: as F104.
- **F188.** DERIVED (NTA): **68-10 Central Avenue → `QN0503 Glendale`**, zip 11385, cd 405.
  → CAUTION: the NRHP boundary (65th–66th Streets) and the address I could resolve (68-10) are not
  the same block. The district's own bounds sit **west** of the Maranzano playground at 2869 Central
  Avenue. A verifier should test a 65th/66th Street Central Avenue address specifically; I did not
  get a clean geocode for one.

**P31. Cooper Avenue Row Historic District**

- **F189.** QUOTE (Wikipedia, *Cooper Avenue Row Historic District*): "Cooper Avenue Row Historic
  District is a national historic district in **Glendale**, Queens, New York.  It includes seven
  contributing buildings built in 1915.  They consist of two story, flat front brick rowhouse
  dwellings with one apartment per floor.  They are constructed of yellow brick with burnt orange
  brick details.  They feature some of Glendale's most striking and elaborate brickwork."
  Source: https://en.wikipedia.org/wiki/Cooper_Avenue_Row_Historic_District
- **F190.** THE CONFLICT: `Cooper Avenue Row Historic District | refnum 83001765 | **6434-6446 Cooper
  Ave.** | city = **Ridgewood** | listed 1983-09-30 | lat 40.698056 lon -73.890833`.  Source: as F104.
- **F191.** DERIVED (NTA): **64-34 Cooper Avenue → `QN0503 Glendale`**, zip 11385, cd 405. PLUTO:
  `bldgclass B1`, `yearbuilt 1910`, owner `DIONICIO, ROSE P`, bbl 4037180004.
  → PLUTO says **1910**; the Wikipedia article says the seven buildings were **built in 1915**.
  Recorded; PLUTO build years in this area are unreliable (see F70).

**P32-adjacent. NYC (LPC) landmark status — a clean NEGATIVE finding**

- **F192.** I queried the LPC **Individual Landmark Sites** dataset for all of Queens Community
  District 405. It returns exactly **two** records, **both in NTA QN0502 (Ridgewood)**:
  `Ridgewood Theater Building | 55-27 Myrtle Avenue | LP-02325 | designated 1/12/2010 | QN0502` and
  `Adrian and Ann Wyckoff Onderdonk House | 1820 Flushing Avenue | LP-01923 | designated 3/21/1995 |
  QN0502`. Source: https://data.cityofnewyork.us/resource/buis-pvji.json
  → **There is no New York City–designated individual landmark in Glendale.** Glendale's protected
  architecture is National Register only, and that listing files it under Ridgewood (F184, F187,
  F190). Both LPC landmarks belong to the **Ridgewood** page; neither may be claimed here.
- **F193.** The Wikipedia NRHP Queens table contains **no entry whose `city` field reads "Glendale."
  Zero.** Every district in the Ridgewood/Glendale/Middle Village belt is filed under Ridgewood or
  Middle Village: 68th Avenue-64th Place HD, Central Ridgewood HD, Cornelia-Putnam HD, Cypress Avenue
  East HD, Cypress Avenue West HD, Fresh Pond-Traffic HD, Madison-Putnam-60th Place HD, Ridgewood
  Fresh Pond Road-Myrtle Avenue HD, Seneca Avenue East HD, Stockholm-DeKalb-Hart HD, Summerfield
  Street Row HD, St. Matthias RC Church Complex, Evergreens Cemetery, Vander Ende-Onderdonk House
  Site (all "Ridgewood"); Forest-Norman HD, Grove-Linden-St. John's HD, Seneca-Onderdonk-Woodward HD,
  Woodbine-Palmetto-Gates HD (all "Middle Village"). Source: as F104.
  → **This is the fact the arbiter most needs.** It is also the reason the three "Glendale" districts
  must not be silently taken: the register itself never says Glendale.
- **F194.** For the Ridgewood author's benefit and to prevent a collision: the **Vander
  Ende-Onderdonk House / Adrian and Ann Wyckoff Onderdonk House, 1820 Flushing Avenue**, is
  Ridgewood's in both NRHP and LPC records (F192, F193). **It is not Glendale's.**

---

## 8. CHURCHES, PARISHES AND SCHOOLS

**P34. St. Pancras Roman Catholic Church**

- **F195.** DERIVED (NTA): **72-22 / 72-30 68 Street → `QN0503 Glendale`**, zip 11385, cd 405. PLUTO
  owner `ST PANCRAS R C CHURCH`, `bldgclass M1`, bbl 4037020033.
  → **Unambiguously in the Glendale NTA.** But its own website does not resolve (F3), and I have no
  narrative source for it beyond F196.
- **F196.** QUOTE (Sacred Heart parish history, on St. Pancras as the mother parish): "Sacred Heart
  Parish was founded in June 1929 by Father George D. Sherman, who was appointed Rector, when the
  accelerated growth and development of East Glendale made a new Catholic church necessary in that
  community. **The extensive territory of St. Pancras Parish was divided**".  Source: as F33.

**P32. Sacred Heart R.C. Church · P33. Sacred Heart Catholic Academy**

- **F197.** DERIVED (NTA): **83-17 78 Avenue → `QN0503 Glendale`**, zip 11385, cd 405. PLUTO owner
  `R C DIOCESE OF BKLYN`, `bldgclass M3`, bbl 4038220051.
- **F198.** QUOTE (Sacred Heart parish history): "the boundary of the new parish was officially
  designated as follows: Beginning at the southeast corner of 78″ Avenue and 75 Street, along the
  south side of 78th Avenue to the south side of Metropolitan Avenue, along Metropolitan Ave., to the
  west side of the Rockaway division of the Long Island Railroad; then along L.I.R.R. to the northern
  boundary of Forest Park and Cypress Hill Cemetery to the east side of 75th Street, along 75th
  Street to the south side of 78 Avenue. It was Father Sherman’s request to the Bishop that the new
  parish be named after the Sacred Heart of Jesus."  Source: as F33.
  → **A dated, explicit, primary-source boundary description for East Glendale.** Strong candidate.
- **F199.** QUOTE (same): "The parish “center,” where Masses would be celebrated, was the Emerald
  Park Dance Hall located on Myrtle Avenue – where St. John’s Lutheran Church now stands. Every week,
  after the dancers departed, Father Sherman had to set up for Mass, confessions, etc. The first Mass
  was offered on June 29; the parish had 300 congregants."  Source: as F33.  **(P35 St. John's
  Lutheran Church)**
  → Ties directly to the beer-garden history: Emerald Park is one of the picnic parks named in F42.
- **F200.** QUOTE (same): "So despite the post-Depression economy, and to accommodate the growing
  number of parishioners, land was purchased for a new church with the permission of Most Rev. Thomas
  E. Malloy (the contract was awarded to the Michael Zummo Construction Co. of Jamaica). Mr. A. F.
  Meissner of Jamaica prepared plans for this and all the parish buildings. The contract price of the
  church was $64,710, excluding the land. It is interesting to note that Father Sherman intended this
  to be “temporary,” to be replaced perhaps in better times – it never was."  Source: as F33.
- **F201.** QUOTE (same): "A year later, on February 14, 1930, ground was broken. The first Mass was
  held on June 27, the feast of the Sacred Heart, in the auditorium of the new church. The cornerstone
  was laid on August 10. The first Mass in the completed church was celebrated by the pastor, on
  September 14, 1930, the feast of the Exaltation of the Holy Cross. … The new church was dedicated
  to the service of God and the honor of the Sacred Heart on Sunday, October 19, after which
  ceremonies the sacrament of Confirmation was administered by Bishop Malloy to 65 children and six
  adults. The parish was legally incorporated on January 19, 1931."  Source: as F33.
- **F202.** QUOTE (same): "Monsignor George D. Sherman / Our Founder and First Pastor / June 29, 1929
  - April 29, 1957 / Seventy-Five Years of History".  Source: as F33.
  → The "Seventy-Five Years" heading dates this text to roughly 2004; it is not being updated.
- **F203.** QUOTE (Sacred Heart Catholic Academy, own site): "Our mission is to motivate, educate,
  and empower academically, spiritually and socially, the students of Sacred Heart Catholic Academy
  for the challenges of tomorrow with the support of the Sacred Heart community."
  Source: https://www.sacredheartglendale.org/
- **F204.** QUOTE (same): "The Sacred Heart Youth Program offers basketball, baseball, softball,
  cheerleading, and volleyball."  Source: as F203.

**P36. Redeemer Lutheran School · P55–P56. Public schools**

- **F205.** QUOTE (Wikipedia): "Redeemer Lutheran School occupies the site of 'Hoffman Hall', a beer
  garden and dance hall."  Source: as F8. (Same sentence as F46.)
- **F206.** QUOTE (Wikipedia): "Glendale has seven schools: P.S. 68 Elementary, P.S. 91 Elementary,
  P.S. 113 Elementary, Glendale Intermediate School, Sacred Heart Elementary, Central Queens Academy
  Charter and Elm Community Charter."  Source: as F8.
  → CAUTION: "Sacred Heart Elementary" is called **Sacred Heart Catholic Academy** by the school
  itself (F203). And **Central Queens Academy Charter** is, to my knowledge, an Elmhurst/Corona
  school — I could not verify a Glendale campus and it may be a Wikipedia error. Flag, do not carry.
- **F207.** QUOTE (Wikipedia, Notable people): "Richard Arkwright (1732–1792), a pioneer in the
  spinning industry, which revolutionized the knitwear industry. **PS 91 in Glendale is named after
  him.**"  Source: as F8.
  → Arkwright never set foot in Queens; Wikipedia files an 18th-century Lancashire industrialist
  under Glendale's "Notable current and former residents." **The school-naming fact may be usable;
  the "resident" framing is plainly wrong.** Do not carry the framing.
- **F208.** QUOTE (NYC Parks, Drumm sign): "From 1915 to 1929 Drumm presided over Public School 91 on
  Central Avenue and 69th Street."  Source: as F153. (Independent corroboration that P.S. 91 is on
  Central Avenue in Glendale.)
- **F209.** QUOTE (NYC Parks, Evergreen Park sign): "Part of the park is jointly operated with the
  adjacent P.S. 68."  Source: as F101. → Places P.S. 68 at St. Felix Avenue, in the Glendale NTA
  (F171) but in the park NYC Parks calls Ridgewood (F168). §15.

**P37. Queens Public Library, Glendale Branch**

- **F210.** QUOTE (Wikipedia): "The Queens Public Library's Glendale branch is located at 78-60 73rd
  Place.  It also has an annex at The Shops at Atlas Park."  Source: as F8.
- **F211.** DERIVED (NTA): **78-60 73 Place → `QN0503 Glendale`**, zip 11385, cd 405. PLUTO returns
  address `73-15 MYRTLE AVENUE`, owner **`QUEENS PUBLIC LIBRARY`**, `bldgclass P8`, bbl 4036960047.
  → Note PLUTO's address for the tax lot (**73-15 Myrtle Avenue**) differs from the branch's street
  address (**78-60 73rd Place**). Corner lot. Both are in evidence; publish the branch address.

**P62. Christ the King Regional High School — MIDDLE VILLAGE, not Glendale**

- **F212.** QUOTE (Forgotten New York, 2024): "Christ the King Regional High School, just to the east
  of the station, was instituted by the Catholic Diocese of Brooklyn (which also included Queens) in
  1962. Classes were held at Mater Christi High School in Astoria until the new building seen here
  **in Middle Village** was opened in April 1964. The school is best known for its basketball program,
  which has produced NBA and WNBA stars such as Lamar Odom, Jayson Williams, Chamique Holdsclaw, Sue
  Bird and Tina Charles."  Source: as F32.
  → Recorded as a **do-not-claim**: it is the most famous school in CD5 and it is Middle Village's.

---

## 9. PUBLIC SAFETY

**P40. NYPD 104th Precinct — the station house is in RIDGEWOOD**

- **F213.** QUOTE (Wikipedia): "Maspeth, Ridgewood, Middle Village, and Glendale are patrolled by the
  104th Precinct of the NYPD, located at 64-02 Catalpa Avenue."  Source: as F8.
- **F214.** DERIVED (NTA): **64-02 Catalpa Avenue → `QN0502 Ridgewood`**, zip 11385, cd 405. PLUTO
  owner `NYC POLICE DEPARTMENT`, `bldgclass Y2`, `yearbuilt 1925`, bbl 4036320001.
  → Glendale is *patrolled by* the 104th; the **station house is a Ridgewood building**. A Glendale
  page may say the former; it may not claim the building. §15.
- **F215.** QUOTE (Wikipedia): "The 104th Precinct ranked 21st safest out of 69 patrol areas for
  per-capita crime in 2010. However, the precinct covers a large diamond-shaped area, and Maspeth and
  Middle Village are generally seen as safer than Ridgewood."  Source: as F8.
  → Note this is a **precinct**-level statistic covering all four neighborhoods, and its own
  editorializing sentence compares the neighborhoods against each other. Attribute carefully.

**P39. FDNY Engine Co. 286 / Ladder Co. 135 — unambiguously Glendale**

- **F216.** QUOTE (Wikipedia): "Glendale contains a New York City Fire Department (FDNY) fire station,
  Engine Co. 286/Ladder Co. 135, at 66-44 Myrtle Avenue."  Source: as F8.
- **F217.** DERIVED (NTA): **66-44 Myrtle Avenue → `QN0503 Glendale`**, zip 11385, cd 405. PLUTO
  owner **`FIRE DEPARTMENT OF NEW YORK`**, `bldgclass Y1`, bbl 4037000021. **No conflict.**
- **F218.** QUOTE (Wikipedia): "In 1896, Glendale's first fire department, the Ivanhoe Park Hose
  Company, a volunteer fire company, was established. It was funded by Henry Meyer, a wealthy
  businessman, who owned a cigar factory, a lucrative holding of stocks, and a sizable amount of land,
  part of which would become the neighborhood of Liberty Park. The fire department's uniforms, a hose
  cart and the hose were subsidized by Meyer. He also undertook several construction projects, such as
  building pumping stations, to ensure water would be available anywhere along the major streets (i.e.,
  Myrtle Avenue and Cypress Hills Street). Later that year, the first company was expanded with a hook
  and ladder and renamed Ivanhoe Fire Hook and Ladder Company and two months later became Company 10
  in the Newtown Fire Department."  Source: as F8.
  → Excellent Glendale-specific material and it ties Henry Meyer to the Liberty Park section (F43).

---

## 10. TRANSPORTATION

### 10.1 The subway — Glendale has NO station of its own

- **F219.** QUOTE (Wikipedia, *Fresh Pond Road station*): "The Fresh Pond Road station is a station on
  the BMT Myrtle Avenue Line of the New York City Subway, along Fresh Pond Road between 67th and
  Putnam Avenues **in Ridgewood**. The station is served by the M train at all times. The station
  opened in 1915 as part of the Dual Contracts."
  Source: https://en.wikipedia.org/wiki/Fresh_Pond_Road_station  **(P57)**
- **F220.** QUOTE (same): "This station was opened on February 22, 1915 by the Brooklyn Rapid Transit
  Company as part of a project to elevate a portion of the Myrtle Avenue Line, which had run at street
  level."  Source: as F219.
- **F221.** QUOTE (same): "The platform is wider than those in most other stations in the system
  because the station was formerly a major transfer point to the Flushing–Ridgewood streetcar line to
  Flushing. This service was replaced by the Q58 bus on July 17, 1949."  Source: as F219.
- **F222.** QUOTE (same): "Below the station is an MTA-owned lot commonly used for storing buses based
  out of the adjacent Fresh Pond Bus Depot. To the east of the station is the Fresh Pond Yard. However,
  it can only be accessed from Middle Village–Metropolitan Avenue, the next station east (railroad
  south)."  Source: as F219.
  → **Contradicts F73**, which says the Fresh Pond/Fremont Yards are "located in Glendale." §15.
- **F223.** QUOTE (Wikipedia, *Forest Avenue station*): "The Forest Avenue station is a station on the
  BMT Myrtle Avenue Line of the New York City Subway. Located on a private right-of-way **in
  Ridgewood, Queens**, the station is served by the M train at all times."
  Source: https://en.wikipedia.org/wiki/Forest_Avenue_station  **(P58)**
- **F224.** QUOTE (Wikipedia, *Middle Village–Metropolitan Avenue station*): "It is located at the
  intersection of Metropolitan Avenue and Rentar Plaza **in the neighborhood of Middle Village,
  Queens**. The station is served by the M train at all times."
  Source: https://en.wikipedia.org/wiki/Metropolitan_Avenue_station_(BMT_Myrtle_Avenue_Line)  **(P59)**
- **F225.** QUOTE (same): "The station originally opened on September 3, 1881, as the terminus of the
  Lutheran Cemetery Line, a former steam dummy surface line. On October 1, 1906, the Lutheran line was
  connected to the BMT Myrtle Avenue Line via ramp at the Wyckoff Avenue. A second station, just west
  of the original facility, opened on August 9, 1915… On July 16, 1974, a fire completely destroyed the
  original wooden platform and station house along with three R27 cars and one R30 car… and the station
  had to be completely rebuilt. It reopened in 1980 with the current concrete platform and brick
  stationhouse."  Source: as F224.
- **F226.** QUOTE (Forgotten New York, 2024, on the same terminal): "There has been a surface railroad
  traveling to this spot on Metropolitan Avenue east of the Rentar Plaza shopping center and
  Lutheran/All-Faiths Cemetery since 1906, when a steam train line was founded to bring passengers from
  Myrtle Avenue to what was then simply Lutheran Cemetery. By 1915, the tracks were reinforced for
  heavier rail and electrified, with a wooden stationhouse constructed. In 1974 a fire claimed the
  stationhouse, as well as a few subway cars, and the current brick stationhouse opened in 1980."
  Source: as F32.
  → Forgotten NY dates the surface line to **1906**; Wikipedia to **1881**, with the 1906 date being
  the connection to the Myrtle Avenue Line. Both recorded.
- **F227.** **THE CONFLICT WORTH FLAGGING.** Wikipedia's Glendale article says, QUOTE: "The
  neighborhood is somewhat suburban in feel although **it still is served by the subway** and buses."
  Source: as F8. But the same article's **Transportation** section lists **nine bus routes and no
  subway station at all**, and every nearby M-train station is placed by its own article in Ridgewood
  or Middle Village (F219, F223, F224). **No subway station is in Glendale.** Do not write that one is.

### 10.2 Buses

- **F228.** QUOTE (Wikipedia, Transportation): "The following MTA Regional Bus Operations bus routes
  serve Glendale: B13: to DeKalb Avenue (L train) or Gateway Center via 61st and 62nd Streets, Cooper
  Avenue and Cypress Hills Street / Q11: to Woodhaven Boulevard (Elmhurst) (M and ​R trains) or Howard
  Beach via Woodhaven Boulevard / Q29: to 82nd Street–Jackson Heights (7 train) via 80th Street / Q39:
  to Long Island City via Forest Avenue / Q47: to East Elmhurst via 80th Street / Q52 SBS: to Woodhaven
  Boulevard (Elmhurst) (M and ​R trains) or Edgemere via Woodhaven Boulevard / Q53 SBS: to 61st
  Street–Woodside (7 and <7>​ trains)/Woodside LIRR or Rockaway Park–Beach 116th Street (A and ​S
  trains) via Woodhaven Boulevard / Q54: to Williamsburg Bridge Plaza Bus Terminal or Jamaica
  Center–Parsons/Archer (E​, ​J, and ​Z trains) via Metropolitan Avenue / Q55: to Myrtle–Wyckoff Avenues
  (L​ and M trains) or 121st Street (J and ​Z trains) via Myrtle Avenue"  Source: as F8.
  → CAUTION: MTA has rebuilt the Queens bus network since these route descriptions were written. I
  could **not** reach `new.mta.info` to verify current routings. **Do not publish route destinations
  without a current MTA check.**

### 10.3 The Long Island Rail Road

**P47. Glendale station (LIRR), closed 1998**

- **F229.** QUOTE (Wikipedia, *Glendale station (LIRR)*): "Glendale was a Long Island Rail Road station
  along the Lower Montauk Branch, located **in Glendale, Queens at Edsall Avenue and 73rd Street, near
  Central Avenue, at the All Faiths Monuments factory for the All Faiths Cemetery**. This station had a
  sign indicating its location, and two tracks."
  Source: https://en.wikipedia.org/wiki/Glendale_station_(LIRR)
- **F230.** QUOTE (same): "The station opened around June 1869 (although some sources claim it was
  built in 1868) and contained a small station house along the eastbound tracks. Nearby freight service
  included such companies as American Grass Twine Works, and Prairie Grass Furniture Company. Trains
  from the Rockaway Beach Branch also served the station prior to that line's connection with the LIRR
  Main Line."  Source: as F229.
- **F231.** QUOTE (same): "In January 1927, due to decreasing ridership, the LIRR razed the station,
  and on September 27, 1927, the name was moved to a new station at Metropolitan Avenue on the Rockaway
  Beach Branch. The name had lasted only for slightly more than a month until it was changed to
  Parkside Station on October 23, 1927, and Glendale was returned to the Montauk Branch as a wooden
  sheltered shed along the westbound tracks by 1928. The wooden shed was replaced by corrugated iron
  during World War II."  Source: as F229.
  → **Directly contradicts F39** ("In 1927, the station burned down and was never replaced").
  Wikipedia against Wikipedia. Also note F231 says **razed**, F39 says **burned down**.
- **F232.** QUOTE (same): "This station closed on March 16, 1998 along with the other remaining
  stations on the Lower Montauk branch, due to low ridership and inability to accommodate the C3
  bi-level coaches, which can stop only at stations with high level platforms. This station had only
  two riders daily at the time of its closure."  Source: as F229.
  → A THIRD closing date is in play: the *Montauk Branch* article (F233) says **March 13, 1998**;
  the Glendale station article and the Glendale neighborhood article both say **March 16, 1998**.
- **F233.** QUOTE (Wikipedia, *Montauk Branch*): "The Lower Montauk Branch had nine stations, four of
  which were closed by 1940. The remaining five stations (Richmond Hill, Glendale, Fresh Pond,
  Haberman, and Penny Bridge) were closed on March 13, 1998, due to low ridership and incompatibility
  with then-new C3 bi-level coach cars that can only use high platforms (only Richmond Hill had an
  actual platform; the other four stations' platforms were just pavement strips beside the tracks)."
  Source: https://en.wikipedia.org/wiki/Montauk_Branch  **(P49)**
- **F234.** QUOTE (Forgotten New York, 2024): "The quiet neighborhood of Glendale contains a number of
  anachronisms, including the passage of the Long Island Rail Road Montauk spur from west to east. This
  sleepy line now carries freight only, but it’s only been a decade or so since at least one daily
  passenger train plied the tracks here. And, until March 1998 Glendale had its very own LIRR station,
  which in its final years consisted of a bare spot in the weeds alongside the tracks."
  Source: as F32.
- **F235.** QUOTE (Forgotten New York, 2024): "This clearing by the side of the tracks is pretty much
  all there was to the Glendale LIRR station… Edsall Avenue, meanwhile runs along the south side of the
  tracks for a few blocks; **it never got a number when most Queens streets were changed from names to
  numbers during the 1920s**. If I didn’t tell you this was Queens, it could be a rail siding anywhere
  in the country."  Source: as F32.
- **F236.** QUOTE (Wikipedia, *Rockaway Beach Branch*): "The line left the Main Line at Whitepot
  Junction in Rego Park heading south via Ozone Park and across Jamaica Bay to Hammels in the Rockaways,
  turning west there to a terminal at Rockaway Park. Along the way it connected with the Montauk Branch
  **near Glendale**, the Atlantic Branch near Woodhaven, and the Far Rockaway Branch at Hammels."
  Source: https://en.wikipedia.org/wiki/Rockaway_Beach_Branch  **(P50)**
- **F237.** QUOTE (same): "After a 1950 fire, the Jamaica Bay bridge was closed and the line south of
  Ozone Park sold to the city, which rehabilitated the portion south of Liberty Avenue and connected it
  to the New York City Subway system as the IND Rockaway Line. The portion north of the subway
  connection was closed in 1962, and two proposals exist for the reuse of the line."  Source: as F236.
- **F238.** The **QueensWay** appears in NYC Parks' CB5 property list as `Queensway | Union Turnpike
  bet. Woodhaven Blvd. and Pedestrian Way, Trotting Course Lane and 73 Ave. | 73 Avenue AND Trotting
  Course Lane | 11385 | 0.032 acres | **Undeveloped** | CB 406`. Source: `enfh-gkve`.
  → Note NYC Parks assigns this parcel to **CB 406 (Forest Hills / Rego Park)**, not CB5, despite the
  11385 ZIP. Wikipedia has **no QueensWay article** (the title returned no extract). This is thin;
  treat with care.

**P45. Woods Inn · P46. George Gundolff's Hotel — the two surviving LIRR-era buildings**

- **F239.** QUOTE (Forgotten New York, 2024): "If you think you’re seeing the same pair of houses on
  these two photos from about 1910 and 2024, your eyes aren’t deceiving you. Both the buildings shown
  here on Edsall Avenue were at one time hotels serving travellers exiting at Glendale: **The former
  Woods Inn, or Kirschmann’s saloon (1906)**, on the left and the even older **George Gundolff’s Hotel
  (1830s)** on the right. Now they are private homes and the residents may have no idea of the
  buildings’ former use. Both have been resurfaced and no longer look very much as they were when
  built."  Source: as F32.
- **F240.** A DIFFERENT SPELLING AND LOCATION for the same saloon. QUOTE (Sacred Heart parish history):
  "The Long Island Railroad’s Glendale station was situated at what is now 73d Street, at the rear
  entrance to Lutheran Cemetery. There was a bar called **Gundorf’s Saloon** across the street from the
  station."  Source: as F33.
  → **Gundolff (Forgotten NY) vs Gundorf (Sacred Heart)**, and "Hotel" vs "Saloon." Do not reconcile.
- **F241.** **CRITICAL CAUTION ON THE WOODS INN.** Wikipedia says, QUOTE: "A Stranger Is Watching
  (1982) starring Rip Torn was filmed **in a Glendale bar, the Woods Inn**, and most of the crew ate
  lunch with the owner at that time, John Virga. Part of an episode of NYPD Blue was also filmed at the
  Woods Inn in the late 1990s."  Source: as F8. But Forgotten NY (F239) says the Woods Inn building on
  Edsall Avenue is **now a private home**. Whether these are the same establishment, and whether it
  operated as a bar into the 1990s, is **unresolved**. **These are private residences today; a page
  must not send visitors to them.**

---

## 11. COMMERCE, RESTAURANTS AND BARS

**Per the wave brief, I state explicitly for each whether a DOHMH/DCWP inspection dataset is the
only source.**

**P41. The Shops at Atlas Park (and the Atlas Terminal that preceded it)**

- **F242.** QUOTE (Wikipedia): "Atlas Terminal was demolished in 2004 and replaced by a shopping center
  called The Shops at Atlas Park, which opened in April 2006."  Source: as F8. (Same as F71.)
- **F243.** QUOTE (Wikipedia): "The largest employer was the Atlas Terminal, a vast industrial park,
  consisting of 16 factories."  Source: as F8. (Same as F54.)
- **F244.** NYC Parks/PLUTO record: **80-00 Cooper Avenue**, bbl 4038100350, owner **`QUEENS LIFESTYLE
  CENTER LLC`**, `bldgclass K6` (department store / shopping center), **`yearbuilt 1922`**, `landuse
  5`, zip 11385, cd 405. Source: https://data.cityofnewyork.us/resource/64uk-42ks.json
  → **PLUTO's `yearbuilt 1922` is the Atlas Terminal industrial fabric, not the 2006 mall** — which is
  consistent with a redevelopment that reused buildings. Interesting, but do not publish "built 1922"
  for the mall without a second source.
- **F245.** DERIVED (NTA): **80-00 Cooper Avenue → `QN0503 Glendale`**. (Same as F68.) **No neighborhood
  conflict** — except against the NYC City Map ZIP-based label Wikipedia complains about in F66.
- **F246.** **SOURCING WARNING (F2 restated):** there is **no working official website**. Do not link
  one, and do not write current tenant lists, hours or store counts — I have no current source for any
  of them. The Queens Public Library annex there (F210) is the only tenant in evidence.

**P42. Zum Stammtisch — the strongest business candidate, with a genuine primary source**

- **F247.** QUOTE (Zum Stammtisch, own website, homepage): "Welcome to Zum Stammtisch. Since 1972,
  we've been the pride of Queens: a Bavarian-style pub, serving tall and frosty steins and all your
  favorite hearty German meals."  Source: https://www.zumstammtisch.com/
- **F248.** QUOTE (same, contact block): "info@zumstammtisch.com / (718) 386-3014 / **69-46 Myrtle
  Avenue, / Glendale, NY 11385**".  Source: as F247. The site's header reads "EST. 1972".
- **F249.** QUOTE (Zum Stammtisch, "OUR STORY"): "Zum Stammtisch was founded in November of 1972 by
  John Lehner and two other partners. Before immigrating to the United States in the 1950’s John Lehner
  was a coppersmith in Freising, Bavaria Germany. His father had a small bar/restaurant in town and it
  was always John’s dream to open his own German Bar/Restaurant. Shortly upon arriving in the United
  States, John was drafted into the U.S. Army. After serving two years, he came back to New York and
  met his future wife Erna. They were married shortly thereafter and had two children... Werner, born
  in 1967, and Hans, born in 1973."  Source: https://www.zumstammtisch.com/history
- **F250.** QUOTE (same): "The two partners John started out with were bought out within the first ten
  years, and from that point forward, John ran the day to day operations. Zum Stammtisch was expanded
  in 1988 when the neighboring building became available."  Source: as F249.
- **F251.** QUOTE (same): "After falling ill, John Lehner passed away in October of 1993. Hans and
  Werner took over and have been running the business ever since, maintaining the strict standards set
  by their father while fusing their own ideas to keep things authentic and true to the original
  concept John Lehner brought to this country so many years ago."  Source: as F249.
- **F252.** QUOTE (same): "After enjoying years of success with Zum Stammtisch, Hans and Werner decided
  to take the next step and expand the Stammtisch name by opening a German pork store right next door.
  For 13 wonderful years, Stammtisch Pork Store & Imports proudly served the community with authentic
  German meats and delicacies. **Although the Pork Store has now closed its doors**, Zum Stammtisch
  remains committed to providing their guests with the finest German cuisine."  Source: as F249.
  → **The Stammtisch Pork Store is CLOSED.** The site's own nav still lists "OUR PORK STORE." Do not
  send anyone to it.
- **F253.** QUOTE (same, "Our Achievements"): "“...one of the last standing, old school German
  restaurants in Queens, New York, with a reputation for serving the best Jagershnitzel and bratwurst
  this side of Munich.” / Featured on the Food Network’s “Dining Around” with Kelly Choi and “The Best
  Thing I Ever Ate” / Featured in an interview with Elle McLogan on CBS New York’s “The Dig” / Awarded
  “Top 100 Restaurants in New York City” for two consecutive years, 2023 & 2024".  Source: as F247.
  → The quoted blurb is **unattributed on the restaurant's own site** — it does not say who said it.
  Do not present it as a review from a named outlet. The "Top 100" award is likewise unattributed.
- **F254.** QUOTE (same): "Zum Stammtisch has also received high ratings from ZAGAT (24 Food, 20 Decor,
  22 Service)."  Source: as F249. → Self-reported and undated. Zagat's NYC print guide is defunct.
- **F255.** The site credits a photograph to "Lanna Apisukh for **The New York Times**," indicating NYT
  coverage exists, but **I could not retrieve the article** and have no headline, date or URL.
  Source: as F249.
- **F256.** **DOHMH cross-check:** `ZUM STAMMTISCH | 69-46 | MYRTLE AVENUE | 11385 | German | Queens`
  appears in the DOHMH restaurant inspection dataset. Source:
  https://data.cityofnewyork.us/resource/43nn-pn8j.json
  → **The DOHMH record is NOT the only source.** The restaurant's own website (F247–F254) is primary
  and substantial. **This business is safe to write about at length.**
- **F257.** PLUTO for the address: bbl 4037050001, address `69-44 MYRTLE AVENUE`, owner **`STAMMTISCH
  PROPERTIES LLC`**, `bldgclass S2`, zip 11385, cd 405. DERIVED (NTA): **`QN0503 Glendale`**. The owner
  name independently corroborates the business's tenure at the address.

**P43. Yer Man's Irish Pub (formerly Cooper's Ale House) — DOHMH-ONLY for its address**

- **F258.** QUOTE (Wikipedia): "Cooper's Ale House (now 'Yer Man's Irish Pub') is featured in the show
  The King of Queens as a local bar."  Source: as F8.
- **F259.** **DOHMH is the ONLY source I have for this business's address:** `YER MAN'S IRISH PUB |
  70-26 | 88 STREET | 11385 | Irish | Queens`. Source: as F256.
  → **STATED EXPLICITLY PER THE BRIEF: apart from the one Wikipedia sentence in F258, the DOHMH
  inspection dataset is the sole source. No website, no press, no founding date, no ownership history.**
  A page may say almost nothing here. Do not embellish.
- **F260.** DERIVED (NTA): **70-26 88 Street → `QN0503 Glendale`**, zip 11385. No neighborhood conflict.

**P44. The Assembly (the "Trees Lounge" bar) — SINGLE-SOURCE, NO ADDRESS, STATUS UNKNOWN**

- **F261.** QUOTE (Wikipedia): "Another of Glendale's bars, The Assembly, figured prominently in the
  1996 film Trees Lounge, written, directed, and starring Steve Buscemi. It served as the set for the
  fictional bar for which the movie is named."  Source: as F8.
  → **I found no address, no website, and no DOHMH record** (my DOHMH query for `%ASSEMBLY%` in ZIP
  11385 returned nothing). **I cannot establish that this bar still exists.** Treat as a historical
  film-location claim on a single Wikipedia sentence, or drop it.

**Other commerce**

- **F262.** QUOTE (Wikipedia): "In other parts of Glendale, companies such as Trader Joe's and Chili's
  took over former industrial buildings."  Source: as F8. → But F66, same article, puts the Trader
  Joe's at 72-25 Woodhaven Boulevard in **Rego Park**. Conflicting. And chain-store tenancy is volatile;
  I have no current verification for either. **Do not publish.**
- **F263.** QUOTE (Wikipedia): "For every supermarket in Glendale, Ridgewood, and Maspeth, there are 5
  bodegas."  Source: as F8. → A three-neighborhood NYC Health statistic, not a Glendale one.
- **F264.** Historic businesses named only in the Sacred Heart parish history, all **long gone**, useful
  as texture and nothing more. QUOTE: "Among the farms was the Evans Family Farm, which raised peacocks.
  It was located on Tompkins Avenue (now 70h St.). There was Schmidt’s Bakery on Olmsted Place and
  Myrtle Avenue (the baker there home-delivered fresh rolls, bread, and buns early each morning). There
  was a 21-acre dairy farm from Montague St. (74th) to Thompson Ave. (79th). It was owned by Charles
  Lempke who sold milk for four cents a quart."  Source: as F33. ("70h" is the source's typo.)
- **F265.** QUOTE (Sacred Heart parish history): "A short time after, Morris Chain opened his hardware
  and paint store and Otto Hermann opened his hardware store."  Source: as F33.
- **F266.** QUOTE (Sacred Heart parish history): "Across the street, where the Parkway Barbershop is
  located, there was Kemper’s Bakery. Garfield’s Drug Store was on the corner of 88 St. and Myrtle Ave.,"
  Source: as F33. (Sentence ends mid-clause in the source.)
- **F267.** A Forgotten NY reader reports a "Pfundstein & Sons" tailor shop "est 1896" at 1705 Myrtle
  Avenue with the family at 71-44 67th St, and another reader replies that **1705 Myrtle Avenue was in
  Ridgewood**, not Glendale ("From a 1929 map I found 1705 Myrtle Avenue, just east of Cypress Avenue in
  Ridgewood. Around 67th Street, the old numbers on Myrtle would be in the 2700 range").
  Source: as F52. → **Reader comments. NOT CITABLE. Do not publish.** Recorded only because it is a
  concrete illustration of the old-vs-new Myrtle Avenue numbering trap.

---

## 12. POPULAR CULTURE

**P51. 89-70 Cooper Avenue — the *All in the Family* house**

- **F268.** QUOTE (Wikipedia): "In 1971, the sitcom All in the Family premiered. The house seen in the
  opening of the show is at 89-70 Cooper Avenue."  Source: as F8.
- **F269.** QUOTE (Forgotten New York, "ARCHIE BUNKER'S PLACE, Glendale," 2020): "When the producers of
  the TV comedy All in the Family were looking around for a closing shot representing Archie’s place
  that would appear behind the credits while the closing theme “Remembering You” played… Ultimately they
  settled on a row of attached homes on the south side of Cooper Avenue, two of which appear here. The
  Bunkers’ address was given as 704 Hauser (pronounced Howser, as in MLB manager Dick Howser) in
  Astoria; however, that was an entirely fictional address."  Source: as F106.
  → Note Wikipedia says **the opening**; Forgotten NY says **the closing shot / closing credits**.
- **F270.** **AND FORGOTTEN NY EXPLICITLY REFUSES TO ASSIGN THE NEIGHBORHOOD.** QUOTE: "Several New
  York City neighborhoods come together in the triangle of territory opposite St. John’s Cemetery formed
  by Cooper Avenue, Metropolitan Avenue, and Woodhaven Boulevard. **I have to pick one, so I’ll make it
  Glendale; but just east of here, you’re in Forest Hills, north of here you’re in Rego Park, and west
  of here it’s definitely Glendale. People get manic if you misidentify their neighborhoods, so I’ll
  profusely apologize in advance.**"  Source: as F106.
  → This is a source *telling you it is guessing*. Quote it as such or not at all.
- **F271.** DERIVED (NTA): **89-70 Cooper Avenue → `QN0503 Glendale`**, but **`zipcode 11374`** (a Rego
  Park ZIP), `cd 405`, PLUTO `bldgclass A5`, `yearbuilt 1930`, `landuse 1` (one-family). DCP geometry
  says Glendale; the ZIP says Rego Park. **Contested. §15.**
- **F272.** **PRIVACY CAUTION.** PLUTO gives the owner of 89-70 Cooper Avenue as a **named private
  individual's living trust**. It is a **private single-family home**. Do not publish the owner name,
  and think hard before directing readers to a private residence.
- **F273.** A reader anecdote about the location fee (owner "offered something like $25 per episode or a
  flat fee of $200… The owner took the $200") is a **Forgotten NY comment**, user-generated and
  uncorroborated. **Not citable.** Source: as F106.

**Film and TV, other**

- **F274.** QUOTE (Wikipedia): "A Stranger Is Watching (1982) starring Rip Torn was filmed in a Glendale
  bar, the Woods Inn, and most of the crew ate lunch with the owner at that time, John Virga."
  Source: as F8. (See F241 for the caution.)
- **F275.** QUOTE (Wikipedia): "Part of an episode of NYPD Blue was also filmed at the Woods Inn in the
  late 1990s."  Source: as F8. → No episode title, no date, no second source.
- **F276.** QUOTE (Wikipedia, See also): the article's only "See also" link is "Irish Americans in New
  York City."  Source: as F8. → Recorded because it is the sole editorial signal in the article that
  Glendale's later demography is Irish as well as German, and it is **not supported by any body text**.

---

## 13. NOTABLE PEOPLE

- **F277.** QUOTE (Wikipedia, header): "Notable current and former residents of Glendale include:"
  followed by: "Richard Arkwright (1732–1792)… / Big Cass (born 1986), professional wrestler formerly
  with WWE. / Daniel Daly (1873–1937), the most decorated hero of the United States Marine Corps and
  Medal of Honor recipient, lived out his final years after World War I in Glendale. / Harry Houdini
  (1874–1926), magician, buried in Machpelah Cemetery / Rafael Ramos (1974–2014), slain NYPD officer,
  who lived in Glendale before moving to Cypress Hills / Phil Rizzuto (1917–2007), shortstop who spent
  his entire 13-year baseball career with the New York Yankees. / Dan Schneider (born 1965), writer /
  Cree Cicchino (born 2002), actress"  Source: as F8.
  → **This list is unreliable on its face and must be triaged, not carried:**
  - **Richard Arkwright** (F207) died in Lancashire in 1792 and was never a Glendale resident; the
    usable fact is that **P.S. 91 is named for him**, which is corroborated indirectly by F154/F208
    placing P.S. 91 on Central Avenue.
  - **Harry Houdini** is listed as a *resident* but the entry itself says only that he is **buried** in
    Machpelah — and Machpelah is in the cemetery NTA, not the Glendale NTA (F86), and is **absent from
    Wikipedia's own Glendale cemetery list** (F77).
  - **Rafael Ramos**'s entry says he **moved away** to Cypress Hills.
  - **Phil Rizzuto**'s entry gives no Glendale connection at all — only his Yankees career. (He is
    generally associated with Ridgewood/Brooklyn and later New Jersey; I could not source a Glendale
    residence.)
  - **Big Cass**, **Dan Schneider** and **Cree Cicchino** have **no sourced Glendale detail whatever**
    in the article — just a name, a year and an occupation.
  - Only **Daniel Daly** carries an actual, specific Glendale residence claim ("lived out his final
    years after World War I in Glendale"), and even that has no citation I could follow.
  **Recommend: publish none of these without independent sourcing. Daly is the one worth chasing.**
- **F278.** Independently sourced Glendale figures that are **better** than the Wikipedia list, all from
  NYC Parks historical signs: **Vito Frank Maranzano** (1923–2006), "longtime Glendale resident and
  neighborhood activist" (F151); **John Wesley Drumm** (1862–1930), principal of the Glendale Union Free
  School and P.S. 67 and P.S. 91, who lived on Cypress Hills Street (F154–F155); **Lawrence G. Linekin**
  (1931–1996), founder of Friends of Forest Park (F128–F130); **Richard Koehler** (d. 2000), Little
  League coach (F150); **Joseph F. Mafera** (1895–1967), interim Queens Borough President — but Parks
  calls him "**a long-time Ridgewood resident**" (F165).
  → These five are agency-sourced with dates and specifics. They are the honest Glendale biographies.

---

## 14. WHAT GLENDALE DOES NOT HAVE — negative findings, recorded so nobody invents them

- **F279.** **No waterfront.** Glendale is entirely inland. The wave brief's "waterfront" prompt has no
  Glendale answer. The only water in the record is the two vanished freshwater ponds of F30, "filled in"
  in the early 1900s.
- **F280.** **No museum and no cultural institution of its own.** Nothing in any source I retrieved
  identifies a museum, theater, gallery or performing-arts institution in Glendale. The nearest are the
  **George Seuffert, Sr. Bandshell** (inside the Forest Park JIA, F21/F131) and the **Queens Council for
  the Arts**, which NYC Parks places in **Oak Ridge**, also inside the JIA and at the park's
  *southwestern* corner (F117) — i.e. the Richmond Hill/Woodhaven end, not the Glendale end.
- **F281.** **No historic house museum.** No Glendale equivalent of the Onderdonk House (which is
  Ridgewood's, F194). No landmarked or publicly accessible historic residence surfaced.
- **F282.** **No NYC-designated landmark** (F192). **No NRHP listing filed under the name "Glendale"**
  (F193).
- **F283.** **No subway station** (F227). **No operating LIRR station** since 1998 (F232). QUOTE
  (Wikipedia): "The nearest operating LIRR stations are in Kew Gardens and Forest Hills."  Source: as F8.
- **F284.** **No hospital.** QUOTE (Wikipedia): "The nearest major hospital is Elmhurst Hospital Center
  in Elmhurst."  Source: as F8.
- **F285.** **No Flushing Meadows connection of any kind** (F4, F5).
- **F286.** QUOTE (Wikipedia, on the 1980s): "The area was mostly middle-class with well-maintained
  housing stock and had one of the lowest crime rates in New York City, but **lacked a major community
  hub**."  Source: as F8.
  → Wikipedia itself says the neighborhood had no center. That is the honest shape of this page:
  **a residential neighborhood defined by what rings it — cemeteries, a park, and rail — rather than by
  monuments inside it.** Glendale will read thinner than Ridgewood or Forest Hills. That is structural.

---

## 15. CONTESTED NEIGHBORHOOD ASSIGNMENTS — the required list

**I do not resolve any of these.** Each row records what each source says and the street address, per
the wave brief. "NTA" is my DERIVED point-in-polygon result against DCP 2020 NTAs, offered as the
official geometry and not as a source sentence.

| # | Place | Street address | Source A says | Source B says | DCP NTA |
|---|---|---|---|---|---|
| C1 | **75th Avenue–61st Street Historic District** (P29) | 60th Lane / 61st St / 62nd St; NRHP: "60th Lane, 60th and 62nd Sts. bounded by St. Felix, Myrtle, and Cooper Aves." | Wikipedia article: "in **Glendale**, Queens" (F182) | NRHP listing table: city = **Ridgewood** (F184) | **QN0503 Glendale** (F185) |
| C2 | **Central Avenue Historic District** (P30) | "Roughly bounded by Myrtle and 70th Ave., and 65th and 66th Sts." | Wikipedia article: "in **Glendale**, Queens" (F186) | NRHP listing table: city = **Ridgewood** (F187) | **QN0503 Glendale** at 68-10 Central Ave (F188) — but see the caveat: that is not the 65th/66th St block |
| C3 | **Cooper Avenue Row Historic District** (P31) | 6434–6446 Cooper Avenue | Wikipedia article: "in **Glendale**, Queens" (F189) | NRHP listing table: city = **Ridgewood** (F190) | **QN0503 Glendale** (F191) |
| C4 | **Evergreen Park** (P15) | 60-09 Saint Felix Avenue | Wikipedia: "Evergreen (near and around Evergreen Park)" is a section of lower **Glendale** (F17, F172) | NYC Parks sign: "Evergreen Park is located in the Queens neighborhood of **Ridgewood**" (F168) | **QN0503 Glendale** (F171) |
| C5 | **Mafera Park** (P14) | 65 Place and Shaler Avenue | Wikipedia files it under **Glendale**'s Parks section (F167) | NYC Parks sign: named for "the park's location **on the boundary between Glendale and Ridgewood**," and "the children of **Ridgewood**" (F163–F164) | **QN0502 Ridgewood** (F166) |
| C6 | **Mount Carmel Cemetery**, Sections 1–4 and 6 (P19, P23) | 83-45 Cypress Hills St; 66-02 Cooper Ave; 82-99 Cypress Ave; 82-07 Cypress Hills St | Cemetery's own site: "**Glendale NY 11385**" for all of these (F82) | Its own mailing address is "**Ridgewood NY 11386**" (F82); Wikipedia lists it in the belt "surrounding" Glendale (F77) | **QN0574 Highland Park-Cypress Hills Cemeteries (North)** (F84) |
| C7 | **Knollwood Park section of Mount Carmel** (P24) | 57-80 Cooper Avenue | — | Cemetery's own site: "**Ridgewood NY 11386**" (F82) | not tested |
| C8 | **Union Field Cemetery** (P22) | 8211 Cypress Avenue / 82-11 Cypress Hills St | Wikipedia lists "Union Field" in Glendale's Cemetery Belt (F77) | Cemetery's own site: "**Ridgewood, NY 11385**" (F90) | **QN0574** cemetery NTA (F91) |
| C9 | **Machpelah Cemetery / Houdini's grave** (P20) | 82-30 Cypress Hills Street | Wikipedia's Glendale "Notable people" claims Houdini, "buried in Machpelah Cemetery" (F85) | Wikipedia's own Glendale Cemetery Belt list (F77) **omits Machpelah**; no cemetery website found | **QN0574** cemetery NTA (F86) |
| C10 | **Mount Lebanon Cemetery** (P21) | 78-00 / 73-01 Myrtle Avenue | Wikipedia lists it in Glendale's belt (F77) | no operating website found; `mtlebanoncemetery.com` is a **Pittsburgh** cemetery (F88) | **QN0574** cemetery NTA (F87) |
| C11 | **Cypress Hills Cemetery** (P26) | 833 Jamaica Avenue | Wikipedia lists it in Glendale's belt (F77) and says the parkway displaced its graves (F57) | Cemetery's own site: "**Brooklyn, NY 11208**" (F99) | not tested; Brooklyn address |
| C12 | **All Faiths / Lutheran Cemetery** (P25) | 67-29 Metropolitan Avenue | Wikipedia lists "Lutheran All Faiths" in Glendale's belt (F77) | Cemetery's own site: "**Middle Village, NY 11379**" (F92); Forgotten NY: "founded in **Middle Village** in 1852" (F96) | **QN0571 Mount Olivet & All Faiths Cemeteries** (F95) |
| C13 | **Fresh Pond / Fremont Yards** (P48) | east of Fresh Pond Road station | Wikipedia's Glendale article: the yards are "**located in Glendale**" (F73) | Wikipedia's *Fresh Pond Road station* article puts the station and adjacent depot **in Ridgewood** and the yard east of it (F219, F222) | not tested |
| C14 | **NYPD 104th Precinct station house** (P40) | 64-02 Catalpa Avenue | Wikipedia's Glendale article names it as Glendale's patrolling precinct (F213) | — | **QN0502 Ridgewood** (F214) — the building is Ridgewood's |
| C15 | **89-70 Cooper Avenue, the *All in the Family* house** (P51) | 89-70 Cooper Avenue | Wikipedia: the house "is at 89-70 Cooper Avenue," in the Glendale article (F268) | Forgotten NY: "**I have to pick one, so I'll make it Glendale**"; names Forest Hills and Rego Park as the other candidates (F270). **ZIP is 11374 (Rego Park)** (F271) | **QN0503 Glendale** (F271) |
| C16 | **Forest Park** and every feature in it — the Carousel (P8), Dry Harbor Playground (P3), Linekin Playground (P4), Seuffert Bandshell (P5), Oak Ridge (P6), the golf course (P7), Victory Field (P9) | 80-30 Park Lane (a **Kew Gardens** address) | Wikipedia: Forest Park is "partially within" Glendale (F13) | NRHP files the Carousel under **Woodhaven** (F138); NYC Parks attaches DeVoy Playground to **Forest Hills** and the Strack Meadow to **Woodhaven** (F141, F142); Parks lists CBs 5, 6 and 9 (F108) | **QN8291 Forest Park — a Joint Interest Area, in NO neighborhood NTA and NO community district** (F21) |
| C17 | **Highland Park / Ridgewood Reservoir** (P17) | 58-02 Vermont Avenue | Wikipedia's Glendale article describes the reservoir's position relative to Glendale (F178) | Its own address is **Brooklyn 11207/11208**; Wikipedia's own sentence puts it **south of** Glendale and **separated** from it; it is named **Ridgewood** Reservoir (F177, F178) | Highland Park spans CB 305 and 405 |
| C18 | **78-16 Cooper Avenue** (P61) — a site persistently described in local civic argument as "Glendale" | 78-16 Cooper Avenue | (no source retrieved in this pass; recorded because the address recurs in CD5 civic disputes) | — | **QN0504 Middle Village** — DERIVED. **If any file wants this address, it is not Glendale's by DCP geometry.** |
| C19 | **P.S. 68** (P56) | adjacent to Evergreen Park, St. Felix Avenue | NYC Parks: jointly operates the park it calls **Ridgewood**'s (F168, F209) | Wikipedia lists P.S. 68 among "Glendale has seven schools" (F206) | **QN0503 Glendale** (F171, same parcel) |
| C20 | **Christ the King Regional High School** (P62) | Metropolitan Avenue, east of the M terminal | — | Forgotten NY: "the new building seen here **in Middle Village**" (F212) | Middle Village — **do not claim** |
| C21 | **St. John's Cemetery** (P28) | Metropolitan Avenue | — | Its own DCP NTA, `QN0573 St. John Cemetery`; discussed inside a Forgotten NY post titled "…, Glendale" (F105, F106) | **QN0573** — **do not claim** |
| C22 | **Seither Stadium** (P52) | "between the train tracks of the Rockaway Beach and Montauk Branches" | Wikipedia: "On the easternmost edge of **Glendale**" (F179) | The league it serves is "the **Ridgewood, Glendale, Middle Village and Maspeth** Little League" (F179); **no NYC Parks record exists** | not locatable to an address |
| C23 | **"Liberty Park" and "Evergreen" and "Fresh Pond"** as place-names (P53, P54) | — | Wikipedia's *Glendale* article: sections **of** Glendale (F17, F43) | Wikipedia's *Queens Community Board 5* article: **Fresh Pond and Liberty Park are neighborhoods coordinate with Glendale** (F18) | the whole area is QN0503 Glendale |
| C24 | **Every Glendale address, in the geocoder's own label** | all of them | the addresses' ZIP is 11385, which USPS reads as **Ridgewood** (F64, F66) | DCP GeoSearch's WOF label returns "**Fresh Pond**" for essentially every Glendale address and "**Forest Park**" for the Cypress Hills Street cemeteries (§0.1) | QN0503 Glendale |

**A note the arbiter will want.** The pattern across C1–C3, C14, C24 and F66 is consistent and has one
mechanism behind it: **Glendale shares ZIP 11385 with Ridgewood, and source after source resolves the
neighborhood from the ZIP.** The National Register, the NYC City Map, USPS and the geocoder's
neighborhood layer all do it. Wikipedia complains about it in Glendale's own article (F64–F66). I am
**not** ruling that this makes the Ridgewood assignments wrong — Mafera Park (C5) is a case where the
DCP geometry sides with Ridgewood, so the mechanism does not explain everything. But the arbiter should
know that "a source says Ridgewood" is much weaker evidence here than it would be anywhere else in the
borough.

---

## 16. GAPS — what I could not source, and where the next pass should go

- **G1.** **The two New York Times Glendale features (1986 and 2011)** quoted at F76. Paywalled; I have
  only Wikipedia's rendering, and the "40,000 graves" figure looks wrong against the cemeteries' own
  numbers. Anyone with NYT access should pull them; they are likely the best prose on Glendale's
  self-conception that exists.
- **G2.** **The three NRHP nomination PDFs** (F1). These would settle C1–C3 outright, because the
  nomination form has a "city or town" field filled in by the preparer. **This is the single highest-
  value missing document in the dossier.** Try NY SHPO's CRIS, or the National Archives catalog.
- **G3.** **Local press entirely.** QNS, the Queens Chronicle, the Ridgewood Times / Times Newsweekly
  (which Wikipedia lists as an external link) — none searchable without WebSearch. Glendale's civic life
  (the Glendale Property Owners Association, the Kiwanis, GCOP, the Community Board 5 fights, the Cooper
  Avenue shelter dispute) lives almost entirely in those outlets.
- **G4.** **St. Pancras R.C. Church** (P34) — in the Glendale NTA (F195) and the mother parish of Sacred
  Heart (F196), but its website does not resolve and I have **no founding date, no architect, no
  building history**. The Diocese of Brooklyn parish directory page I fetched rendered as navigation
  only. Worth another attempt.
- **G5.** **Redeemer Lutheran School and St. John's Lutheran Church** (P35, P36) — both named in good
  sources (F46, F199) with real historical hooks (Hoffman Hall; the Emerald Park Dance Hall) but neither
  has any address, date or website in evidence.
- **G6.** **Current MTA bus routings** (F228). `new.mta.info` was not reachable.
- **G7.** **The Manhattan Project claim** (F55). One unsourced Wikipedia sentence carrying a very large
  assertion. Either corroborate it or drop it.
- **G8.** **"Film studios" in Glendale** (F38) — asserted by an NYC Parks sign, corroborated nowhere.
- **G9.** **The German cannon at the Glendale War Memorial** (F161) — in the parish history only, absent
  from NYC Parks' monument record, present-day status unknown.
- **G10.** **Phil Rizzuto's Glendale connection** (F277) — asserted by Wikipedia with no detail at all.
- **G11.** **The Assembly bar** (F261) — no address, no DOHMH record, existence today unverified.
- **G12.** **Whether the Forest Park JIA question is settled.** Wave 3 ruled that Flushing Meadows'
  identical structure meant no neighborhood file could claim it. **Forest Park is `QN8291`, JIA 82**
  (F21). Glendale, Woodhaven, Richmond Hill, Kew Gardens and Forest Hills all abut it, and Forest Hills
  already shipped in wave 3. **The arbiter must rule on this before any wave-4 file writes a Forest Park
  place record** — and should check what, if anything, the shipped Forest Hills page already claims
  inside the park.
