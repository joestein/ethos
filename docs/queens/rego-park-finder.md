# Rego Park, Queens — FINDER dossier (wave 3)

**Role:** FINDER only. Nothing below is adjudicated, confirmed, or verified. Every item is a
**candidate**. Verdicts belong to the verifier.

**Quotation convention (read this before using anything below):**
- Text inside `"…"` immediately following the marker **QUOTE:** is copied verbatim from the cited
  source.
- Text following the marker **PARAPHRASE:** is my own wording summarizing the source. It is NOT a
  quote and must not be presented as one.
- Where a source's own wording is internally inconsistent I have quoted **both** conflicting
  strings rather than picking one.

**Research method / limitation disclosure:** This session's WebSearch budget (200/200) was already
exhausted before my first search call, and `WebFetch` returned HTTP 403 for `nycgovparks.org` and
`new.mta.info`. All retrieval below was done by direct HTTP fetch (curl with a browser UA) against
specific URLs, plus the Wikipedia API, the NYC Open Data (Socrata) API, SEC EDGAR, and NYC LPC
designation-report PDFs. General web search engines (DuckDuckGo HTML, Mojeek) returned bot
challenges and were unusable. **Consequence: coverage is deep on government/institutional sources
and thin on press coverage.** Several obvious topics (restaurant histories, Ben's Best deli closure,
Knish Nosh, Joe Abbracciamento, Bukharian institutions' founding dates) could not be sourced and are
listed under "Gaps" rather than asserted.

**Counts:** 223 candidate facts (F1–F223) across 49 candidate places (P1–P49).

---

## 0. MANDATORY WAVE RULE — Flushing Meadows Corona Park

Rego Park does **not** contain any part of Flushing Meadows Corona Park. The park lies north/east
across the Long Island Expressway and Grand Central Parkway, in Corona and Flushing.

`Ethos.Seeds.CitiFieldPlaces` already owns Citi Field, the Unisphere, the Queens Museum, the New York
Hall of Science, the Queens Zoo, the USTA Billie Jean King National Tennis Center, the New York State
Pavilion and the Queens Theatre. **None of those may be re-created in a Rego Park seed file under any
slug, and none of their history may be narrated here.** The correct move for any Rego Park page that
wants to gesture at them is a link to `/g/citi-field-guide`.

The only Rego Park-adjacent connections I found worth recording are *naming* facts, not institutional
ones: F169 (LeFrak City's building names derive from the 1964 World's Fair) and F100–F101 (the Trylon
Theater took its name from the 1939 Fair's Trylon spire). Both are about a housing complex and a movie
theater respectively — neither is a claim on any institution inside the park.

---

## 1. Boundaries, administrative geography, identity

**P1. Rego Park (the neighborhood itself)**

- **F1.** QUOTE (Wikipedia, *Rego Park*): "Rego Park is bordered to the north by Elmhurst and Corona,
  to the east and south by Forest Hills, and to the west by Middle Village."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F2.** QUOTE (same): "Rego Park's boundaries include Queens Boulevard, the Long Island Expressway,
  Woodhaven Boulevard, and Yellowstone Boulevard."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F3.** A DIFFERENT boundary description. QUOTE (Forgotten New York, "REGO PARK, Queens," by
  Christina Wilkinson, March 19, 2006): "The Rego Park of today fills a triangular piece of land
  bordered by three major Boulevards: Queens, Woodhaven and Yellowstone."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/
  → Note the conflict with F2: Wikipedia includes the Long Island Expressway in the bounding set;
  Forgotten NY names only three boulevards and omits the LIE. **Do not reconcile — verifier's call.**
- **F4.** QUOTE (Wikipedia): "Rego Park is located in Queens Community District 6 and its ZIP Code is
  11374." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F5.** NYC Department of City Planning's 2020 Neighborhood Tabulation Areas list Queens CD6 as two
  NTAs. Retrieved from the NTA dataset: `QN0601 | Rego Park | QN06 Forest Hills-Rego Park (CD 6
  Approximation)` and `QN0602 | Forest Hills | QN06 Forest Hills-Rego Park (CD 6 Approximation)`.
  Source: https://data.cityofnewyork.us/resource/9nt8-h7nd.json (2020 Neighborhood Tabulation Areas)
  → This is the only *official* Rego Park/Forest Hills line I found, and it is the tool the verifier
  should use to adjudicate section 10's contested places.
- **F6.** For comparison, the CD4 pair: `QN0401 | Elmhurst` and `QN0402 | Corona`, both in
  `QN04 Elmhurst-Corona (CD 4 Approximation)`. Same source as F5.
- **F7.** QUOTE (Wikipedia): "It is patrolled by the New York City Police Department's 112th
  Precinct." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F8.** QUOTE (Wikipedia): "Politically, Rego Park is represented by the New York City Council's
  29th District and a small part of the 24th and 25th Districts."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → CAUTION: NYC Parks property pages for Rego Park parks currently name **two different** council
  members — "James F. Gennaro" on Lost Battalion Hall / Real Good / Horace Harding, and "Phil Wong"
  on Remsen Family Cemetery / The Painter's Playground / Fleetwood Triangle (both retrieved
  2026-09-01 from nycgovparks.org). Council districts are a moving target; treat as low-value.
- **F9.** PARAPHRASE (Wikipedia, Demographics): 2010 census population 28,260, down 1,144 (3.9%) from
  29,404 in 2000; area given as 455.74 acres. Racial makeup given as 46.2% White, 31.7% Asian, 2.5%
  African American, with Hispanic or Latino of any race 16.6%.
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → Wikipedia's own infobox elsewhere says "1.95 square miles"; 455.74 acres is ~0.71 sq mi. These
  are inconsistent within the same article. Flagging, not resolving.
- **F10.** QUOTE (Wikipedia): "The entirety of Community Board 6, which comprises Rego Park and Forest
  Hills, had 115,119 inhabitants as of NYC Health's 2018 Community Health Profile, with an average
  life expectancy of 85.4 years." Underlying primary source cited by Wikipedia:
  https://www1.nyc.gov/assets/doh/downloads/pdf/data/2018chp-qn6.pdf (NYC DOHMH Community Health
  Profile, "Rego Park and Forest Hills"). **I did not fetch that PDF; the verifier should.**
- **F11.** QUOTE (Wikipedia): "Rego Park is covered by ZIP Code 11374. The United States Post Office
  operates the Rego Park Station at 9224 Queens Boulevard."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → Note the address is written without the standard Queens hyphen; it is presumably 92-24 Queens
  Blvd. Verifier should confirm against USPS.

---

## 2. History — settlement, Whitepot, the Remsens, the Real Good Construction Company

**P2. Whitepot (the colonial settlement Rego Park sits on)**

- **F12.** QUOTE (Wikipedia): "Rego Park is built on lands originally part of the Lenape Nation,
  possibly inhabited by members of the Canarsee band. By 1653, though, English and Dutch farmers
  moved into the area and founded a community called Whitepot, which was a part of the Township of
  Newtown." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F13.** QUOTE (Wikipedia): "Whitepot is believed to be so named because Dutch settlers named the
  area 'Whiteput', or 'hollow creek'; later, English settlers Anglicized the name."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F14.** The competing folk etymology, and the settler families. QUOTE (Forgotten New York): "A
  legend says that it was called Whitepot because it was purchased from the Indians for the cost of
  three white pots, but its actual original Dutch name was 'Whiteput,' which means 'hollow creek.'
  When the English took it over, the name was Anglicized."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/
- **F15.** QUOTE (Forgotten New York): "The greater area was first settled in 1653 as 'Whitepot' by
  English and Dutch farmers, including the Remsen, Furman, Springsteen and Morrell families. They
  found the land good for growing hay, straw, rye, corn, oats and various vegetables."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/
- **F16.** QUOTE (Forgotten New York): "The Hempstead Swamp once occupied a vast area of land that
  sits just east of present-day St. John's Cemetery in Queens."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/
  → Cross-reference: the LPC designation report for Remsen Cemetery (see F74) independently uses the
  name "Hempstead Swamp" for this area of Queens County.
- **F17.** QUOTE (Wikipedia): "The colonists also founded the Whitepot School, which operated until
  the late 19th century." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → CONFLICT: QUOTE (Forgotten New York): "Near the cemetery stood a school called the Whitepot
  School, built by the founding families, which served the area into the early 19th century." One
  says late 19th century, the other early 19th century. Recorded, not resolved.

**P3. The Chinese truck farms (pre-development land use)**

- **F18.** QUOTE (Wikipedia): "The original Dutch, English, and German farmers sold their produce in
  Manhattan; by the end of the 19th century, though, Chinese farmers moved in and sold their goods
  exclusively to Chinatown." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F19.** The same claim from a city agency, in stronger language. QUOTE (NYC Parks, Lost Battalion
  Hall Recreation Center history sign): "Once farmland, the area had only one road, called Remsen's
  Lane. Chinese farmers worked the soil in an exclusive enclave, selling produce only to Chinatown."
  Source: https://www.nycgovparks.org/parks/lost-battalion-hall-recreation-center/history
- **F20.** QUOTE (NYC Parks, Horace Harding Playground history sign): "Prior to development, Chinese
  farmers had owned this land and formed an exclusive farming enclave in this area, growing produce
  for sale in Manhattan's Chinatown."
  Source: https://www.nycgovparks.org/parks/horace-harding-playground/history
  → NOTE THE DISCREPANCY between agency pages: Horace Harding says the Chinese farmers **owned** the
  land; Forgotten NY says they **leased** it — QUOTE (Forgotten NY): "the colonial farm families had
  been replaced by Chinese farmers, who leased the land on which they grew their own crops to sell at
  the markets of Chinatown." Owned vs. leased is a real substantive conflict. Do not smooth it over.

**P4. The Real Good Construction Company / the naming of Rego Park**

- **F21.** QUOTE (Wikipedia): "The settlement was renamed Rego Park after the Real Good Construction
  Company, which began development of the area in 1925. 'Rego' comes from the first two letters of
  the first two words of the company's name. The company built 525 eight-room houses costing $8,000
  each." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F22.** A CONFLICTING DATE and named developers, from a city agency. QUOTE (NYC Parks, Lost
  Battalion Hall history sign): "In the 1920s, the Real Good Construction bought out these farms and
  built one-family row houses, multi-family homes, and apartment buildings. Developers Henry Schloh
  and Charles Hausmann named the area in 1923, taking the first two letters from the first two words
  in the Real Good Construction Company's name."
  Source: https://www.nycgovparks.org/parks/lost-battalion-hall-recreation-center/history
- **F23.** A THIRD date from a third NYC Parks sign. QUOTE (NYC Parks, Real Good Playground history
  sign): "The neighborhood Rego Park, where this property is located, takes its name from the Real
  Good Construction Company, which developed this area in 1920. 'Re' comes from Real, 'Go' comes from
  Good, hence Rego Park." Source: https://www.nycgovparks.org/parks/real-good-playground/history
  → So: **1920 (NYC Parks/Real Good Playground), 1923 (NYC Parks/Lost Battalion + Forgotten NY),
  1925 (Wikipedia)** are all in circulation for the founding/naming. This is the single most
  frequently mis-stated fact about the neighborhood. Verifier must pick a lane and cite it.
- **F24.** QUOTE (NYC Parks, Horace Harding Playground history sign): "In 1923, developers Henry
  Schloh and Charles Hausmann named the area 'Rego Park,' shortening the name of their construction
  company from 'REal GOod.'"
  Source: https://www.nycgovparks.org/parks/horace-harding-playground/history
- **F25.** QUOTE (Forgotten New York): "In the 1920s, the Real Good Construction Company bought up the
  land and carved out a grid of crescent shaped streets. Along these they built more than 500
  Tudor-style one-family attached and detached homes. In 1923, Rego Park was named as such by its
  developers; Rego being simply the contraction of 'Real' and 'Good.'"
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/
- **F26.** QUOTE (Wikipedia): "Stores were built in 1926 on Queens Boulevard and 63rd Drive, and
  apartment buildings were built in 1927–1928. In 1930, the Independent Subway System began work on
  eight IND Queens Boulevard Line stations in the area, at a cost of $5 million."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F27.** QUOTE (NYC Parks, Lost Battalion Hall history sign): "Between 1928 and 1935, Rego Park saw
  improvements in transportation which included the construction of a railway station, the extension
  of the Long Island Expressway, and the addition of subway service to Union Turnpike."
  Source: https://www.nycgovparks.org/parks/lost-battalion-hall-recreation-center/history
- **F28.** QUOTE (NYC Parks, Fleetwood Triangle history sign): "In 1928, a Long Island Railroad station
  opened nearby. Seven years later, the Long Island Expressway was extended to Queens, and by the end
  of 1936 subway service was established at Union Turnpike, making Rego Park a highly accessible
  neighborhood from every part of the region."
  Source: https://www.nycgovparks.org/parks/fleetwood-triangle/history
- **F29.** Immigration sequence, from a city agency. QUOTE (NYC Parks, Lost Battalion Hall history
  sign): "Originally, the neighborhood attracted Irish, German, and Italian immigrants. From 1970 on,
  the neighborhood's demographic shifted to Russian, Chinese, and Jewish residents, while new
  enclaves of Indians, Iranians, Koreans, Colombians, and Romanian immigrants have continued the
  community's tradition of diversity."
  Source: https://www.nycgovparks.org/parks/lost-battalion-hall-recreation-center/history

**P5. The Rego Park Inferno (Feb 1972 fire) and the two libraries**

- **F30.** QUOTE (Wikipedia): "The short block of 63rd Drive between Austin Street and the Long Island
  Rail Road overpass was the scene of a fire in February 1972 that claimed a row of stores and the
  neighborhood library." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F31.** QUOTE (Wikipedia, continuing): "The blistering 'Rego Park Inferno' reportedly started in the
  second store on the block from Austin Street, a shoe store, and quickly spread with the gusting
  winds to neighboring stores, including a television repair shop, toy store, pet shop and a
  pioneering Indian restaurant, and finally, the library… A similar fire had devastated the same
  block in 1959." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F32.** A much more specific account, republished by a named local preservation organization from a
  named historian's newspaper column. QUOTE (Rego-Forest Preservation Council, reprinting Ron
  Marzlock, *Queens Chronicle*, "I Have Often Walked / (Unintended) Book Burning," Feb 16, 2012):
  "With the big buildup of apartment houses in the 1940s and 1950s, Rego Park found its schools
  overcrowded, and even worse, it had only a storefront library, established in 1938, according to
  Queens Library records. Then in 1956, the community got a branch library, located at 91-34 63rd
  Drive between Austin Street and the Long Island Rail Road tracks."
  Source: https://regoforestpreservation.blogspot.com/2012/02/tale-of-2-libraries-rego-park-edition.html
- **F33.** QUOTE (same source): "Directly next to the library was a bar named The Tavern. In 1960,
  after a fire at the bar, its second in several years, the library expanded into the space it had
  occupied." Source: as F32.
- **F34.** QUOTE (same source), giving an exact date the Wikipedia account lacks: "A bigger blaze
  engulfed the entire strip of storefronts, including the library on Feb. 20, 1972, destroying it."
  Source: as F32.
- **F35.** QUOTE (same source): "After a time with only a bookmobile serving Rego Park, the city bought
  the Shell gas station across the street, a mainstay of the neighborhood since the 1930s, and erected
  a new library in its place. The old location is now home to the Shalimar Diner."
  Source: as F32.
  → NOTE the internal tension in F32/F34: the column dates the bar fire to 1960 in one sentence and
  Wikipedia refers to "the 1959 fire." Marzlock's own piece elsewhere says "the 1959 fire." Record
  both; do not average them.

---

## 3. Parks and city-owned open space (NYC Parks — primary)

I enumerated NYC parkland in ZIP 11374 from the NYC Open Data Parks Properties dataset
(https://data.cityofnewyork.us/resource/enfh-gkve.json, `zipcode like '11374'`). **That query returned
exactly six properties**, listed as P6–P11 below. This is a useful completeness check: Rego Park has
very little dedicated parkland.

**P6. Lost Battalion Hall Recreation Center** — Queens Blvd between 62nd Ave and 62nd Rd

- **F36.** NYC Parks property record: `Q401 | Lost Battalion Hall Recreation Center | Community Park |
  Queens Blvd. bet. 62 Ave. and 62 Rd. | 2.412 acres`. Zip 11374, Community Board 6.
  Sources: https://data.cityofnewyork.us/resource/enfh-gkve.json and
  https://www.nycgovparks.org/parks/lost-battalion-hall-recreation-center/history
- **F37.** QUOTE (NYC Parks history sign): "This recreational center is named for the heroism of the
  United States Army's 77th Division, honoring its service in World War I (1914-1918). Stationed in
  France, this New York division fought in the Battle of the Argonne."
  Source: https://www.nycgovparks.org/parks/lost-battalion-hall-recreation-center/history
- **F38.** QUOTE (same): "While attempting to overtake German-held land near Charlevaux, France, 301
  men from Companies A, B, C, D, E, G, H, and K became isolated from the remainder of the division.
  For five days, between October 3, 1918, and October 7, 1918, the American soldiers, down to one
  day's ration per man, managed to successfully repel the opposing German forces. Throughout the
  battle, the isolated soldiers were able to communicate with their division solely by carrier
  pigeon. In holding out against the German onslaught, the company endured the loss of roughly 107
  men." Source: as F37.
  → CONFLICT WORTH FLAGGING: NYC Parks names **eight** companies (A, B, C, D, E, G, H, K) and says
  301 men. Wikipedia's Rego Park article says QUOTE: "named after nine companies of the 77th Infantry
  Division who fought in World War I." Eight vs. nine. Record both.
- **F39.** QUOTE (NYC Parks): "Located in the Rego Park neighborhood of Queens, Lost Battalion Hall is
  bounded by 62nd Avenue, 62nd Road, and Queens Boulevard." Source: as F37.
- **F40.** QUOTE (NYC Parks): "In 1902, the City acquired this park property through a donation from
  Frank deHass Simonson. In 1939, the Works Progress Administration appropriated $100,000 to construct
  this two-story, 36,000 square foot building replete with a firing range and drill hall to be used
  for the Queens Veterans of Foreign Wars (VFW) and the American Legion. The City placed the property
  under Parks jurisdiction on December 6, 1960." Source: as F37.
  → NOTE: Wikipedia says the hall was "erected in 1939 as a hall for the Veterans of Foreign Wars and
  the American Legion." NYC Parks attributes the 1939 construction money specifically to the **WPA**
  and gives the exact Parks-jurisdiction date of December 6, 1960. Prefer the agency.
- **F41.** QUOTE (NYC Parks): "The original inhabitants occupied the building until 1962 when the
  Queens VFW moved to an upstairs office provided rent free for life (where they still reside today)
  and the American Legion moved out." Source: as F37.
- **F42.** QUOTE (NYC Parks): "On May 25, 1972, the Board of Estimate passed a resolution allowing
  American Telephone and Telegraph (AT&T) to place a telephone exchange under the grounds, but
  requiring AT&T to build a playground behind the recreation center, demolish a Department of
  Sanitation repair shop, and maintain the area for 10 years. The AT&T-built playground opened in
  October 1976." Source: as F37.
- **F43.** QUOTE (NYC Parks): "In 1995, Queens Borough President Claire Shulman contributed $350,000
  for renovations to the building. The improvements included a new gym floor, interior painting, new
  basketball backboards, the refurbishment of two historic murals, and the conversion of the old
  firing range into a fitness center." Source: as F37.
  → "two historic murals" is a concrete, checkable visitor-facing detail. Nobody has identified the
  murals' artist in any source I found. Flagged as a research lead, not a fact.
- **F44.** CURRENT STATUS as of retrieval 2026-09-01. QUOTE (NYC Parks "Know Before You Go" banner):
  "Lost Battalion Hall Recreation Center is closed due to construction. Visit our Capital Tracker
  page for updates on this project."
  Source: https://www.nycgovparks.org/parks/lost-battalion-hall-recreation-center/history
  → **This matters for a visitor-facing page.** Any copy telling a reader to visit the rec center is
  currently wrong. Verifier should re-check the banner at write time.
- **F45.** QUOTE (Wikipedia): "The site also contains a play area and a New York City Department of
  Environmental Protection water pumping station."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F46.** QUOTE (Forgotten New York, on the AT&T building nearby, not the pumping station): "Although
  the paranoid among us may fear that top secret experiments are being conducted inside this
  suspicious-looking windowless structure, in reality it's just a telephone building belonging to
  AT&T." Wikipedia locates it: QUOTE "An AT&T telephone building exists at Queens Boulevard and 62nd
  Drive." Sources: https://forgotten-ny.com/2006/03/rego-park-queens/ ;
  https://en.wikipedia.org/wiki/Rego_Park,_Queens

**P7. Real Good Playground (Real Good Park)** — Horace Harding Expwy Svc Rd S. / 62nd Ave, 99th–102nd Sts

- **F47.** NYC Parks record: `Q357B | Real Good Playground | Playground | Horace Harding Exwy. Sr. Rd.
  S., 62 Ave. bet. 99 St. and 102 St. | 1.598 acres`; zip listed as "11374, 11375"; Community Board 6.
  Sources: https://data.cityofnewyork.us/resource/enfh-gkve.json ;
  https://www.nycgovparks.org/parks/real-good-playground/history
- **F48.** QUOTE (NYC Parks): "The City acquired the property—bounded by Horace Harding Expressway,
  62nd Avenue, 99th, and 102nd Streets—on August 30, 1954 and on the same day placed the area under
  NYC Parks' jurisdiction." Source: https://www.nycgovparks.org/parks/real-good-playground/history
- **F49.** QUOTE (NYC Parks): "In June 1999, Real Good Park received a renovation and now contains a
  spray shower, playground equipment, swings, three basketball courts, new safety surfacing, and the
  shade of London plane trees." Source: as F48.
- **F50.** This is the park that carries the neighborhood's founding name. It is the most on-theme
  small park in Rego Park and the only one named for the Real Good Construction Company.
  PARAPHRASE of the naming logic in F23. Source: as F48.

**P8. Horace Harding Playground** — 62nd Dr between 97th Pl and 98th St

- **F51.** NYC Parks record: `Q428 | Horace Harding Playground | Jointly Operated Playground | 62 Dr.
  bet. 97 Pl. and 98 St. | 1.304 acres`; zip 11374; CB6.
  Sources: https://data.cityofnewyork.us/resource/enfh-gkve.json ;
  https://www.nycgovparks.org/parks/horace-harding-playground/history
- **F52.** QUOTE (NYC Parks): "Horace Harding Playground is located on 62nd Drive, between 97th and
  98th Streets in the Rego Park neighborhood of Queens."
  Source: https://www.nycgovparks.org/parks/horace-harding-playground/history
  → Minor internal conflict: the Open Data record says "97 Pl." (Place); the history sign says "97th
  … Streets." Trivial, but record it.
- **F53.** QUOTE (NYC Parks): "Parks, which acquired this property in 1961, jointly operates the
  playground with the Board of Education. The park opened as P.S. 206 Playground in 1967. In 1985,
  Parks changed the name to Horace Harding Playground in accordance with its proximity to Horace
  Harding Expressway." Source: as F52.
- **F54.** A genuinely visitor-facing detail. QUOTE (NYC Parks): "The park features several concrete
  animal sculptures including a dinosaur, a turtle, and a porpoise." Source: as F52.
  → CAUTION: the same paragraph says "Mayor Giuliani has provided $160,000 for an upcoming playground
  renovation," which dates this sign text to the late 1990s. The sculptures may or may not still be
  there. Do not assert their present existence without a current check.
- **F55.** QUOTE (NYC Parks): "This playground, located in the Queens neighborhood of Rego Park, is
  named in honor of Horace J. Harding (1863-1929), banker and businessman extraordinaire whose
  influence greatly impacted many turn-of-the-century local and national institutions."
  Source: as F52.
- **F56.** QUOTE (NYC Parks): "Harding also supported the construction of what would become Moses's
  Long Island Expressway. In 1929, New York State Road 25D, a future Long Island Expressway service
  road, was named Horace Harding Expressway in recognition of his support." Source: as F52.
- **F57.** A CONFLICTING account of who Harding was. QUOTE (NYC Parks, Horace Harding Playground):
  Harding "entered the banking world at age 20. In 1898, he married Dorothea Barney and joined her
  father's firm. He soon became a senior partner of Charles D. Barney and Company." QUOTE (Wikipedia,
  *Rego Park*): Harding was "a finance magnate who directed the New York, New Haven and Hartford
  Railroad and the New York Municipal Railways System." NYC Parks lists a long directorship roster
  that includes "New York Municipal Railways System" but **not** the New York, New Haven and Hartford
  Railroad. Record the discrepancy.
- **F58.** QUOTE (NYC Parks): "Harding was also an avid art collector and he served on the Board of
  Trustees for the Frick Collection." Source: as F52.

**P9. Fleetwood Triangle** — Woodhaven Blvd / 63rd Dr / Penelope Ave

- **F59.** NYC Parks record: `Q062 | Fleetwood Triangle | Triangle/Plaza | Woodhaven Blvd., 63 Dr.,
  Penelope Ave. | 0.027 acres`; zip 11374; CB6.
  Sources: https://data.cityofnewyork.us/resource/enfh-gkve.json ;
  https://www.nycgovparks.org/parks/fleetwood-triangle/history
- **F60.** QUOTE (NYC Parks): "Located in the Queens neighborhood of Rego Park, Fleetwood Triangle's
  name takes its name from nearby Fleet Court and Woodhaven Boulevard, and boasts the butterfly as
  its park mascot." Source: https://www.nycgovparks.org/parks/fleetwood-triangle/history
  (The doubled "name takes its name" is the agency's own text, reproduced verbatim.)
- **F61.** QUOTE (NYC Parks): "The area had previously been farmland and contained just one road
  running through it, Remsen's Lane. This originally passed straight through Fleetwood triangle,
  bisecting the district, along the path of 63rd Drive, Fleet Court, and 64th Road." Source: as F60.
- **F62.** QUOTE (NYC Parks): "In response to the City's growing need for housing, the Real Good
  Construction Company bought up farm properties and marketed the area as a 'REal GOod' place to
  raise a family, attracting residents with its new single-family row houses, apartment buildings, and
  multiple-family houses." Source: as F60.
- **F63.** QUOTE (NYC Parks): "The City of New York acquired the site from a private landowner in 1920,
  so that the Department of Transportation could extend Penelope Avenue through Woodhaven Boulevard.
  Parks constructed Fleetwood Triangle in 1938 with granite blocks and plantings of English ivy
  (Hedera helix) and London planetree (Platanus orientalis)." Source: as F60.
- **F64.** QUOTE (NYC Parks): "The triangle is jointly operated by Parks and the Department of
  Transportation who, in 1997, completed a renovation of Fleetwood Triangle. The site now features
  benches, game tables, a flagpole with a yardarm, iron bollards, a compass with astrological signs,
  and butterfly block art." Source: as F60.
  → "a compass with astrological signs" and "butterfly block art" are unusual, specific, and
  genuinely worth a visitor's detour. Strong candidate detail.
- **F65.** QUOTE (NYC Parks): "The shape of this triangle is like that of a butterfly wing, inspiring
  both the butterfly art, and the addition of new plantings that attract butterflies." Source: as F60.
- **F66.** PARAPHRASE (NYC Parks): the sign lists the triangle's plantings by botanical name —
  butterfly weed, purple coneflower, wild geranium, creeping phlox, butterfly bush, morrow
  honeysuckle, swamp azalea, common lilac, Norway maples, thornless honey-locust and sargent cherry.
  Source: as F60.

**P10. The Painter's Playground** — Alderton St between Dieterle Crescent and Elwell Crescent

- **F67.** NYC Parks record: `Q306 | The Painter's Playground | Jointly Operated Playground | Alderton
  St. bet. Dieterle Cr. and Ellwell Cr. | 1.699 acres`; zip 11374; CB6.
  Source: https://data.cityofnewyork.us/resource/enfh-gkve.json
- **F68.** IMPORTANT NEGATIVE: NYC Parks' history page for The Painter's Playground exists but
  **contains no history text** — the page renders only the boilerplate "This text is part of Parks'
  Historical Signs Project and can be found posted within the park." with nothing after it.
  Source: https://www.nycgovparks.org/parks/the-painters-playground/history
  → i.e. there is no agency narrative for this park. Anyone writing one is inventing it.
- **F69.** Note the Open Data record spells the crescent "Ellwell Cr." while Wikipedia and Forgotten NY
  both spell the street "Elwell." Sources: https://data.cityofnewyork.us/resource/enfh-gkve.json ;
  https://en.wikipedia.org/wiki/Rego_Park,_Queens ; https://forgotten-ny.com/2006/03/rego-park-queens/

**P11. Remsen Family Cemetery / Remsen Cemetery** — Trotting Course Lane at Alderton St
**⚠ CONTESTED NEIGHBORHOOD — see section 10.**

- **F70.** NYC Parks record: `Q480 | Remsen Family Cemetery | Cemetery | Trotting Course La., Alderton
  St. | 0.247 acres`; **zip 11374** (the Rego Park ZIP); CB6.
  Source: https://data.cityofnewyork.us/resource/enfh-gkve.json
- **F71.** NYC DCP assigns the cemetery's tax lot to **NTA QN0601 "Rego Park"** (not QN0602 Forest
  Hills), per the LPC Individual Landmark Sites dataset, which carries an `nta2020` field.
  Source: https://data.cityofnewyork.us/resource/buis-pvji.json (record: `Remsen Cemetery | adjacent
  to 69-43 Trotting Course Lane | LP-01177 | 5/26/1981 | Individual Landmark | QN0601 | 40.71242,
  -73.8584997`)
- **F72.** NYC LANDMARK. QUOTE (NYC Landmarks Preservation Commission, Designation Report LP-1177, May
  26, 1981, Designation List 144): "REMSEN CEMETERY, between Alderton Street and Trotting Course Lane,
  adjoining 69-43 Trotting Course Lane, Borough of Queens. Landmark Site: Borough of Queens Tax Map
  Block 3178, Lot 44." Source: http://s-media.nyc.gov/agencies/lpc/lp/1177.pdf
  → **The LPC report never names a neighborhood.** It says only "Borough of Queens." That absence is
  itself a finding for section 10.
- **F73.** QUOTE (LPC LP-1177): "The Remsen Cemetery is a tangible reminder of the colonial past of
  this section of Queens. Typical of the small private cemeteries that were favored by early settlers,
  it commemorates one of New York's earliest families and the role it played in both the French and
  Indian War and the American Revolutionary War."
  Source: http://s-media.nyc.gov/agencies/lpc/lp/1177.pdf
- **F74.** QUOTE (LPC LP-1177): "The Remsen family ancestors immigrated to America in the 17th century
  from northern Germany and eventually settled in Queens County. The founding father of the clan in
  America was Rem Jansen Van der Beeck; his sons adopted the surname Remsen. One son, Abraham Remsen,
  settled at Hempstead Swamp, as this area of Queens County was then called, and had a son named
  Jeromus." Source: as F72.
- **F75.** QUOTE (LPC LP-1177): "The younger Jeromus served during the French and Indian War of 1757
  and became active in Whig politics prior to the Revolutionary War." Source: as F72.
- **F76.** QUOTE (LPC LP-1177): "After the Continental Congress of 1774 was established the inhabitants
  of New Towne … assembled at the request of Jeromus Remsen and appointed a committee to insure
  adherence to congressional measures within the limits of the town. Jeromus Remsen was a member and
  clerk of the county committee. Later he was appointed colonel over half the militia of Kings and
  Queens counties and joined forces under the brigade of General Greene in Brooklyn. These American
  forces were routed at the Battle of Long Island and after their retreat Colonel Remsen was forced to
  flee to safety in New Jersey, where he resided until the war's end." Source: as F72.
  (Ellipsis marks an OCR artifact — the PDF renders "New Towne (Newto~" mid-sentence.)
- **F77.** QUOTE (LPC LP-1177): "The oldest known grave is that of Jeromus Remsen, from 1790. In a
  survey of 1925, the graves and gravestones of eight Remsen family members were identified."
  Source: as F72. (The PDF OCR renders "graves" as "8raves"; corrected here and flagged as an OCR
  correction, not a paraphrase.)
- **F78.** QUOTE (LPC LP-1177): "These tombstones date from 1790 through 1819." Source: as F72.
- **F79.** QUOTE (LPC LP-1177): "Recently, commemorative gravestones have been erected by the Veterans
  Administration in honor of Col. Remsen, Major Abraham Remsen, and their two brothers Aert Remsen and
  Garrett Remsen, who were also Revolutionary War officers." Source: as F72. ("Recently" = as of 1981.)
- **F80.** THE MOST VISITOR-RELEVANT DETAIL. QUOTE (LPC LP-1177): "A World War I memorial, honoring the
  community's service in that war, occupies the center of the cemetery. It consists of two doughboy
  statues flanking a flagpole." Source: as F72.
- **F81.** **NAME CONFLICT — flag hard.** LPC calls the Revolutionary officer **"Colonel Jeromus
  Remsen"** throughout LP-1177. Forgotten New York calls him **"Colonel Jacobus Remsen"** — QUOTE
  (Forgotten NY): "their burial ground, which includes the resting place of Revolutionary War veteran
  Colonel Jacobus Remsen, is still intact (left) along Alderton Street near Metropolitan Avenue."
  Sources: http://s-media.nyc.gov/agencies/lpc/lp/1177.pdf ;
  https://forgotten-ny.com/2006/03/rego-park-queens/
  → Jeromus vs. Jacobus. The LPC designation report is the primary document. Do not print "Jacobus"
  without adjudication.
- **F82.** IMPORTANT NEGATIVE: NYC Parks' history page for Remsen Family Cemetery, like The Painter's
  Playground, renders the Historical Signs boilerplate with **no history text at all**.
  Source: https://www.nycgovparks.org/parks/remsen-family-cemetery/history
  → So the LPC report (F72–F80) is the substantive city source for this place.
- **F83.** Wikipedia locates it differently again. QUOTE: "The Remsen family created a burial ground,
  which is still located on Alderton Street near Metropolitan Avenue."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens

---

## 4. Landmarked and Register-listed buildings

**Completeness check I ran:** I pulled every LPC-designated individual landmark site whose community
district is Queens CD6 from https://data.cityofnewyork.us/resource/buis-pvji.json, and cross-checked
against the "Designated and Calendared Buildings and Sites" dataset
(https://data.cityofnewyork.us/resource/ncre-qhxs.json, `cd='406'`). **Both queries returned the same
three records and nothing else.** There are, on this evidence, exactly three NYC individual landmarks
in all of Community District 6, and **no historic districts and no calendared-but-undesignated sites**.

| LPC name | Address | LP no. | Public hearing | Designated | DCP NTA |
|---|---|---|---|---|---|
| Remsen Cemetery | adjacent to 69-43 Trotting Course Lane | LP-01177 | 7/8/1980 | 5/26/1981 | QN0601 Rego Park |
| Ridgewood Savings Bank, Forest Hills Branch | 107-55 Queens Boulevard | LP-02066 | 4/25/2000 | 5/30/2000 | QN0602 Forest Hills |
| Firehouse, Engine Company 305, Hook & Ladder 151 | 111-02 Queens Boulevard | LP-02522 | 5/15/2012 | 6/12/2012 | QN0602 Forest Hills |

- **F84.** The table above, as retrieved. Sources: https://data.cityofnewyork.us/resource/buis-pvji.json
  ; https://data.cityofnewyork.us/resource/ncre-qhxs.json
- **F85.** **Consequence worth stating plainly:** Rego Park has exactly **one** NYC-designated
  individual landmark within it on DCP's own NTA boundaries — the Remsen Cemetery (P11) — and that one
  is the contested case. If a draft claims a Rego Park landmark other than Remsen Cemetery, it is
  wrong or it is using a different definition of "landmark."

**P12. Ridgewood Savings Bank, Forest Hills Branch** — 107-55 Queens Boulevard
**⚠ CONTESTED NEIGHBORHOOD — see section 10.**

- **F86.** QUOTE (LPC Designation Report LP-2066, May 30, 2000, Designation List 314): "RIDGEWOOD
  SAVINGS BANK, FOREST HILLS BRANCH, 107-55 Queens Boulevard, Queens. Built 1939-40; Halsey, McCormack
  & Helmer, architects." Source: http://s-media.nyc.gov/agencies/lpc/lp/2066.pdf
- **F87.** QUOTE (LP-2066 Summary): "The Forest Hills Branch building of the Ridgewood Savings Bank was
  constructed in 1939-40 to serve the residents of this rapidly expanding Queens neighborhood. The
  Ridgewood Savings Bank was founded in 1921 in Ridgewood, Queens, as a mutual savings bank which had
  no stockholders and distributed all profits to its depositors. The bank managers chose the Forest
  Hills location for the bank's first branch office because of its growing population and newly-opened
  subway stop." Source: as F86.
- **F88.** QUOTE (LP-2066 Summary): "Halsey, McCormack & Helmer, one of New York's leading firms
  specializing in bank architecture, designed this building as well as the home office of this bank
  (in Ridgewood), and the Williamsburgh and Dime Savings Banks (both designated New York City
  Landmarks) in downtown Brooklyn." Source: as F86.
- **F89.** QUOTE (LP-2066 Summary): "In this building, the architects employed the modem classical
  style, varying the shape of the building's perimeter with concave and convex sections, and
  alternating flat limestone surfaces with crisply incised designs and large expanses of windows. This
  distinctive building sits alone on its triangular lot, creating a unique and noteworthy presence on
  bustling Queens Boulevard." Source: as F86. ("modem" is an OCR artifact for "modern.")
- **F90.** QUOTE (LP-2066, Development of Queens and Forest Hills): "In 1906, developer Cord Meyer who
  had previously been active in the Elmhurst section of Queens, purchased 600 acres (comprising the
  land of six farms) in the area known as the Hopedale section of Whitepot. Changing the name to
  Forest Hills because of its high ground and its proximity to the beautiful terrain of Forest Park, he
  began to lay out streets, install utilities, and construct the first houses." Source: as F86.
  → Directly relevant to Rego Park: this is the primary-source account of how the *Forest Hills* name
  was carved out of the same "Whitepot" that produced Rego Park. Both names replaced Whitepot.
- **F91.** QUOTE (LP-2066): "The opening of the Independent subway line with a stop at Queens Boulevard
  and Continental Avenue in 1936 was another major improvement which stimulated growth in the area,
  reflected in new businesses opening here, such as the Ridgewood Savings Bank branch."
  Source: as F86.
- **F92.** Coordinates as recorded by LPC/DCP: 40.7220111, -73.844294, tax block 2216 lot 1.
  Sources: https://data.cityofnewyork.us/resource/buis-pvji.json ;
  http://s-media.nyc.gov/agencies/lpc/lp/2066.pdf

**P13. Rego Park Jewish Center** — 97-30 Queens Boulevard

- **F93.** Self-reported address. QUOTE (Rego Park Jewish Center official site, footer): "97-30 Queens
  Blvd, Rego Park, Queens, 11374". Source: https://www.regoparkjewishcenter.org/
- **F94.** Self-description. QUOTE (same): "The Rego Park Jewish Center is a traditional Conservative
  synagogue that balances a commitment to the time-honored traditions and ceremonies of Halakhic
  Judaism with everyday life in the modern world. The result is a spiritual home that welcomes Jews of
  every persuasion, regardless of religious background or observance level."
  Source: https://www.regoparkjewishcenter.org/
- **F95.** QUOTE (Wikipedia, *Rego Park*): "The art deco Rego Park Jewish Center, opened in 1939, is
  notable for an A. Raymond Katz-designed façade with Old Testament scenes and symbols carved into it.
  The building is listed on both the New York State and National Register of Historic Places."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F96.** DIFFERENT DATES from Wikipedia's dedicated article. PARAPHRASE (Wikipedia, *Rego Park Jewish
  Center*): congregation established 1939, building completed 1948; architect given as Frank Grad &
  Sons; style given as "Art Deco Streamline Moderne"; façade mosaic attributed to "Hungarian-born
  artist A. Raymond Katz"; NRHP listing date October 28, 2009, reference number 09000864.
  Source: https://en.wikipedia.org/wiki/Rego_Park_Jewish_Center
  → **Two different building dates (1939 vs. 1948) and two different descriptions of the Katz work
  ("carved into it" vs. "a mosaic").** Forgotten NY offers a third placement — QUOTE: "The Rego Park
  Jewish Center was founded in 1939. A colorful mosaic depicting Old Testament scenes and symbols
  lines the wall above the doorways to the sanctuary."
  (https://forgotten-ny.com/2006/03/rego-park-queens/) — which puts the mosaic **above the sanctuary
  doorways**, not on the exterior façade. Carved vs. mosaic, and exterior vs. interior, are both
  unresolved. The verifier must settle this from the NRHP nomination before any copy describes it.
- **F97.** **I could not obtain the NRHP nomination text.** NPGallery returns "The PDF file for this
  National Register record has not yet been digitized" for reference 09000864, and NYS CRIS
  (https://cris.parks.ny.gov/) requires an NY.gov sign-in. Wikipedia cites the nomination as: Virginia
  L. Bartos, National Register of Historic Places Registration (June 2009). The verifier will need
  CRIS access or a FOIL request to confirm F95/F96.
- **F98.** Recent event. PARAPHRASE (Wikipedia, *Rego Park*, citing NY Post, ABC7, The Guardian and NBC
  New York, all May 2026): in May 2026 a spree of antisemitic graffiti and swastika vandalism struck
  synagogues, homes, businesses and vehicles in Rego Park and Forest Hills, including Congregation
  Machane Chodosh and the Rego Park Jewish Center; the NYPD released video of four suspects.
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → **Handle with care.** This is recent, it is a hate crime, and the wave brief does not ask for it.
  Recorded for completeness only; I make no recommendation that it appear on a visitor page.

**P14. Trylon Theater** — 98-81 Queens Boulevard
**⚠ CONTESTED NEIGHBORHOOD — see section 10. Also: NOT landmarked. See F103.**

- **F99.** QUOTE (Wikipedia, *Rego Park*, in its "Landmarks" section): "The Trylon Theater, an art deco
  theater built around the time of the 1939 New York World's Fair, was converted to the home of the
  Education Center for Russian Jewry in 2006. After local furor over interior refurbishment, the New
  York City Landmarks Preservation Commission was considering landmarking the property. The theater,
  which closed in 2009, was repurposed into a synagogue for more than a decade…"
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → NOTE: Wikipedia here gives the closing year as **2009**. Michael Perlman's own account (F101)
  gives **December 31, 1999**. Ten-year discrepancy on a headline fact.
- **F100.** QUOTE (Rego-Forest Preservation Council, Apr 25, 2011): "This theater at 98-81 Queens Blvd,
  Forest Hills had cultural, architectural, and historical significance to the 1939 – 1940 World's
  Fair, which was held in Flushing Meadows Park, and categorized by the 700-ft spire Trylon (pyramid)
  and 180-ft Perisphere (globe) monuments. It was the 'Theater of Tomorrow,' since the theme of the
  1939 World's Fair was the 'World of Tomorrow,' where exhibits emphasized technological improvements."
  Source: https://regoforestpreservation.blogspot.com/search?q=Trylon
  → This is the *only* mention of the 1939–40 World's Fair I am recording, and it is a naming/theme
  fact about a theater, not a claim on any Flushing Meadows Corona Park institution. See section 0.
- **F101.** QUOTE (1939nyworldsfair.com, "The Trylon Theater," text by/from Michael Perlman and Cinema
  Treasures): "The Trylon Theater opened in 1939 and was named after the famous centerpice of the 1939
  World's Fair which was held in nearby Flushing Meadows. This once popular Art Deco style movie house
  closed on December 31, 1999 after its lease expired. It was purchased by the Bucharians, an orthodox
  Jewish group, for use as a cultural center."
  Source: http://www.1939nyworldsfair.com/worlds_fair/trylon_theater.htm
  (Spelling "centerpice" and "Bucharians" are the source's own.)
- **F102.** THE ARCHITECT. QUOTE (Michael Perlman, same page): "I also learned that the architect of the
  Trylon Theater was Joseph Unger, who also designed homes Queenswide and elsewhere. In summer 2006, I
  was able to track down and interview 1 of his 2 sons, Ronald Unger."
  Source: http://www.1939nyworldsfair.com/worlds_fair/trylon_theater.htm
- **F103.** **CRITICAL NEGATIVE.** The Trylon Theater was **never designated and does not appear as a
  calendared site**: my query of the LPC "Designated and Calendared Buildings and Sites" dataset for
  Queens CD6 returned only the three records in the table above. Consistent with that, QUOTE (*Queens
  Ledger*, Jan 18, 2012, "On The Record with Michael Perlman," by Heather Senison, reprinted by
  Rego-Forest Preservation Council): "The Trylon Theater's landmark application was denied, but much
  of the building's original decor is still in tact."
  Sources: https://data.cityofnewyork.us/resource/ncre-qhxs.json ;
  https://regoforestpreservation.blogspot.com/search?q=Trylon
  → Any draft saying the Trylon "is landmarked" or "is a designated landmark" is false.
- **F104.** QUOTE (Rego-Forest Preservation Council, on why the campaign failed): "In short, when former
  councilmember, Melinda Katz, did NOT support landmarking sites in Forest Hills, the Landmarks
  Preservation Commission backed off from the Trylon Theater."
  Source: https://regoforestpreservation.blogspot.com/search?q=Trylon
  → This is an advocacy organization's characterization of a public official's conduct. Attribute it
  or drop it; do not state it in the site's own voice.
- **F105.** What was destroyed. QUOTE (Rego-Forest Preservation Council, photo captions): "Art Deco
  glory! The Trylon Theater entrance pavilion after closure in Dec 1999. It features a Trylon Monument
  on the mosaic ticket booth with a central 3D mirror-image on the terrazzo floor, which is then
  accompanied by Art Deco chevrons in mosaic tiles." And: "2005: Bad enough the lobby was gutted, but
  the back-lit mosaic Trylon fountain wasn't even spared."
  Source: https://regoforestpreservation.blogspot.com/search?q=Trylon
- **F106.** QUOTE (Michael Perlman, 1939nyworldsfair.com): "Experiencing the destruction of the Trylon
  Theater's Trylon-adorned mosaic ticket booth in July 2005 was what awakened the dormant
  preservationist state within." And: "Next, Perlman founded the Rego-Forest Preservation Council in
  2006, on Forest Hills' 100th anniversary." (second quote from the *Queens Ledger* piece).
  Sources: http://www.1939nyworldsfair.com/worlds_fair/trylon_theater.htm ;
  https://regoforestpreservation.blogspot.com/search?q=Trylon
- **F107.** Contemporaneous eyewitness framing. QUOTE (Forgotten New York, March 2006): "What's been
  done to the poor Trylon Theater is a crying shame! They've destroyed the mosaics and ticket booth,
  gutted the interior, stripped the marquee… A stop work order is in effect while the Landmarks
  Preservation Commission considers landmarking for the property."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/

**P15. Drake Theater (demolished/closed)** — Woodhaven Boulevard

- **F108.** QUOTE (Wikipedia): "The Drake Theater, which opened in 1935 and closed in the 1990s, was
  used in the 1997 film Private Parts." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F109.** QUOTE (Forgotten New York): "The Drake Theater opened in 1935 and closed in the 1990s… The
  facade of the Drake was used for a scene in the 1997 Howard Stern biopic, Private Parts. Soon after,
  Joe Abbracciamento Restaurant, which opened next door in 1948, took over the Drake to use for
  catered functions." Source: https://forgotten-ny.com/2006/03/rego-park-queens/
  → **P16. Joe Abbracciamento Restaurant**, Woodhaven Blvd, opened 1948 per Forgotten NY. I could not
  source its current status; it does **not** appear in the DOHMH 11374 establishment list (section 8),
  which is consistent with it being closed, but absence from an inspection extract is not proof.
- **F110.** The 1978 riot. QUOTE (Wikipedia): "The theater was damaged in December 1978 after around 500
  people, complaining about the theater's sound system threw beer and liquor bottles at the screen and
  tearing holes in it, smashing seats and the candy counter with fire extinguishers from the walls,
  and breaking all the glass doors at the entrance."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → **PROVENANCE WARNING:** Forgotten NY presents the same story explicitly as a quotation *from
  Cinema Treasures*, a user-contributed site — QUOTE (Forgotten NY): "One anecdote from Cinematreasures
  is illuminating: In December, 1978, the Drake's interior was heavily damaged during a midnight
  screening of a Led Zeppelin concert movie…" Wikipedia has laundered a crowd-sourced anecdote into
  encyclopedic voice. Treat as unsourced until a 1978 newspaper is found.

---

## 5. Streets and street names

**P17. 63rd Drive / 63rd Road (the commercial spine)**

- **F111.** QUOTE (Wikipedia): "63rd Road and Drive, the commercial artery of Rego Park, used to be
  Remsen's Lane, which was named after the Remsen family who lived along the road."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F112.** QUOTE (Wikipedia, Commerce): "The main business thoroughfare of Rego Park is 63rd Drive. The
  main section extends from Woodhaven Boulevard in the south, to Queens Boulevard in the north, with
  the central business district of Rego Park nestled between Alderton Street (just south of the Long
  Island Rail Road overpass), and Queens Boulevard. The stretch south of Alderton is entirely
  residential. The business district is anchored by The Rego Park School PS 139Q, an elementary school
  dating from 1928 and Our Saviour Lutheran Church established in 1926 which right across Wetherole
  Street from PS 139Q. The business district is criss-crossed by four side streets: Saunders, Booth,
  Wetherole, and Austin Streets. Most of the businesses lining 63rd Drive are the original single-story
  'Taxpayers' dating from the 1930s." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  (Grammatical error "which right across" is the source's own.)
  → The "single-story 'Taxpayers' dating from the 1930s" is an excellent, specific, walkable
  observation if it can be verified.
- **F113.** QUOTE (Wikipedia): "Across Queens Boulevard to the north, 63rd Drive becomes 63rd Road, and
  its business district continues another three blocks; 63rd Drive actually shifts one block south of
  63rd Road." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens

**P18. The Crescents (Asquith, Boelsen, Cromwell, Dieterle, Elwell, Fitchett)**

- **F114.** QUOTE (Wikipedia): "The Crescents were originally composed of streets named Asquith, Boelsen,
  Cromwell, Dieterle, Elwell and Fitchett. These names were chosen when the Real Good Construction
  Company developed the area in the 1920s." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F115.** QUOTE (Forgotten New York), which supplies the organizing logic: "The semi-circular streets
  were laid out and given aristocratic-sounding alphabetized names from A through F: Asquith, Boelsen,
  Cromwell, Dieterle, Elwell and Fitchett." Source: https://forgotten-ny.com/2006/03/rego-park-queens/
- **F116.** QUOTE (Wikipedia, Housing): "There are also two and multi-family townhouses, detached
  wood-frame houses. This is especially so in an area called the Crescents, named for its semicircular
  shaped streets emanating in a concentric pattern from Alderton Street, between Woodhaven Boulevard
  and the Long Island Rail Road's Main Line. The Crescents contain many Tudor and single-family homes,
  as well as large lawns and tree plantings on the sidewalks."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F117.** Why they are crescents and not circles. QUOTE (Forgotten New York): "Two lines of the LIRR,
  the Main Line and the Rockaway Branch, border the Crescents, and prevented them from being completed
  as circles." Source: https://forgotten-ny.com/2006/03/rego-park-queens/
  → This is the best single explanatory sentence I found about Rego Park's street plan.

**P19. Woodhaven Boulevard / Trotting Course Lane**

- **F118.** QUOTE (Wikipedia): "Woodhaven Boulevard was known as Trotting Course Lane because it was
  named when horses were the main mode of transport. The lane dates back to the colonial days and used
  to run along Whitepot's border… two small parts of the original lane still exist in Forest Hills."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → Note Wikipedia places the surviving fragments **in Forest Hills**.
- **F119.** CONFLICTING placement of a surviving fragment. QUOTE (Forgotten New York): "In the 1800's,
  Trotting Course Lane was cut along the western edge of Whitepot. It was straightened, widened, and
  renamed Woodhaven Boulevard in the 1930s. A couple of pieces of the original road have survived to
  this day, one of these being a short path that runs along the western edge of the Remsen Cemetery."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/
  → Since the cemetery's own neighborhood is contested (section 10), so is this fragment's.

**P20. Queens Boulevard**

- **F120.** QUOTE (Wikipedia): "Queens Boulevard, a wide at-grade highway that stretches from Long Island
  City to Jamaica, was formerly composed of two small dirt roads: Old Jamaica Road and Hoffman
  Boulevard. In the 1910s, it was paved and widened to 12 lanes. It is sometimes called the 'Boulevard
  of Death' because of the high fatality rate of pedestrians trying to cross the 12-lane boulevard."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F121.** QUOTE (Forgotten New York, 2006, on the same stretch): "I know, I know. This is the Boulevard
  of Death. But hurried, harried New Yorkers aren't going to take the time to read these crossing
  directions!" Source: https://forgotten-ny.com/2006/03/rego-park-queens/
  → CAUTION: the "Boulevard of Death" reputation dates from the 1990s–2000s. NYC DOT's Vision Zero
  Queens Boulevard redesign has changed conditions materially since. Do not present the nickname as a
  current description without a current DOT source. I found none.

**P21. Yellowstone Boulevard / Whitepot Road**

- **F122.** QUOTE (Wikipedia): "Yellowstone Boulevard was one of a few colonial roads in the area. It was
  named after the area's original name." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → This sentence is confusing on its face (Yellowstone ≠ Whitepot).
- **F123.** A CLEARER and CONFLICTING account. QUOTE (Forgotten New York): "During colonial times, there
  were only a few roads that cut through the marsh. One of these was Whitepot Road, known as
  Yellowstone Boulevard today." And later, explicitly refusing the etymology: "Whitepot Road is gone,
  although its path can be traced along four streets: Yellowstone Boulevard (named by an early-20th
  century realtor; its derivation is unclear); Dane Place; Fleet Street; and 66th Avenue."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/
  → Forgotten NY says the derivation is **unclear** and credits an early-20th-century realtor.
  Wikipedia says it was named after Whitepot. Directly contradictory. Record both.

**P22. Horace Harding Expressway**

- **F124.** QUOTE (Wikipedia): "Horace Harding Expressway was once a turnpike called Nassau Boulevard and
  went from Elmhurst to Flushing, Bayside, and Little Neck."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → NYC Parks (F56) says NY 25D was renamed for Harding in 1929; Wikipedia says it was previously
  "Nassau Boulevard." Both can be true; neither is confirmed.

**P23. Slattery Plaza (Queens Blvd × Woodhaven Blvd)** — **⚠ Forgotten NY places this in Elmhurst.**

- **F125.** QUOTE (Forgotten New York, quoting West Point's site on John Rodolph Slattery): "The
  intersection of Queens and Woodhaven Boulevards in Queens, NY, is named Slattery Plaza in his honor."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/
- **F126.** QUOTE (Forgotten New York, immediately after, in its own voice): "We are technically just in
  Elmhurst, albeit right on its border with Rego Park."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/
  → A Rego Park page can walk to Slattery Plaza but cannot claim it. See section 10.

---

## 6. Transit

**P24. 63rd Drive–Rego Park station (IND Queens Boulevard Line)**

- **F127.** QUOTE (Wikipedia): "The 63rd Drive–Rego Park station is a local station on the IND Queens
  Boulevard Line of the New York City Subway, consisting of four tracks. Located at 63rd Drive and
  Queens Boulevard in the Rego Park neighborhood of Queens, it is served by the M train on weekdays,
  the R train at all times except nights, and the E and F trains at night."
  Source: https://en.wikipedia.org/wiki/63rd_Drive%E2%80%93Rego_Park_station
  → This is the one transit asset unambiguously assigned to Rego Park by every source.
- **F128.** QUOTE (same): "On December 31, 1936, the IND Queens Boulevard Line was extended by eight
  stops, and 3.5 miles (5.6 km), from its previous terminus at Roosevelt Avenue to Union Turnpike, and
  the 63rd Drive station opened as part of this extension." Source: as F127.
- **F129.** A charming, concrete, checkable detail. QUOTE (same): "Both platforms have a blue tile band
  with a black border and mosaic name tablets reading '63RD DRIVE' in white sans-serif lettering on a
  black background and matching blue border. A few of these tablets have modern metal signs above them
  reading 'Rego Park.'" Source: as F127.
  → i.e. the station's original 1936 tilework says only "63RD DRIVE"; "Rego Park" was bolted on later.
- **F130.** QUOTE (same): "The tile band was part of a color-coded tile system used throughout the IND.
  The tile colors were designed to facilitate navigation for travelers going away from Lower Manhattan.
  As such, the blue tiles used at the 63rd Drive station are also used at Jackson Heights–Roosevelt
  Avenue, the next express station to the west, while a different tile color is used at Forest
  Hills–71st Avenue, the next express station to the east." Source: as F127.
- **F131.** THE UNBUILT ROCKAWAY SPUR — a genuinely good "travel for it" detail. QUOTE (same): "East of
  this station, there is an unfinished signal tower on the Jamaica-bound (railroad north) platform and
  a bellmouth that diverges to the south from the local track. Another tunnel from the Manhattan-bound
  local track diverges north, then curves south under the Queens Boulevard Line to join the other
  bellmouth. These were provisions for a planned expansion in the 1930s that would have connected with
  the IND Rockaway Line… This spur would have run down 66th Avenue before joining the Rockaway Line at
  its former junction with the LIRR Main Line." Source: as F127.
- **F132.** QUOTE (same): "In July 2025, the MTA announced that it would install elevators at 12
  stations, including the 63rd Drive–Rego Park station, as part of its 2025–2029 capital program."
  Source: as F127. → i.e. the station is **not currently ADA-accessible**. Relevant for a visitor page.
- **F133.** QUOTE (same, on the 63rd Road stairs): "Prior to 2010, these entry points were exit-only.
  They were made entrances to accommodate traffic from the expansion of Rego Center." Source: as F127.

**P25. 67th Avenue station** — **⚠ Wikipedia places it ON the border.**

- **F134.** QUOTE (Wikipedia): "The 67th Avenue station is a local station on the IND Queens Boulevard
  Line of the New York City Subway. Located at the intersection of 67th Avenue and Queens Boulevard **on
  the border of Forest Hills and Rego Park** in Queens…" (emphasis mine)
  Source: https://en.wikipedia.org/wiki/67th_Avenue_station
- **F135.** QUOTE (same): "On February 5, 1962, the 67th Drive entrance to the station and a change booth
  opened. The entrance included three low turnstiles and two high exit turnstiles. This entrance had
  been built along with the rest of the station, but had not been opened until this point because the
  station's ridership had not warranted it." Source: as F134. (Wikipedia's text reads "This entrance has
  been built"; "had" is my grammatical correction and is flagged as such.)

**P26. Woodhaven Boulevard station** — **⚠ Wikipedia places it in ELMHURST, not Rego Park.**

- **F136.** QUOTE (Wikipedia): "The Woodhaven Boulevard station is a local station on the IND Queens
  Boulevard Line of the New York City Subway, consisting of four tracks. **Located in Elmhurst,
  Queens**, it is served by the M train on weekdays… The station serves the adjacent Queens Center
  Mall, as well as numerous bus lines." (emphasis mine)
  Source: https://en.wikipedia.org/wiki/Woodhaven_Boulevard_station_(IND_Queens_Boulevard_Line)
- **F137.** QUOTE (same): "Woodhaven Boulevard was opened on December 31, 1936, as Woodhaven
  Boulevard–Slattery Plaza… The plaza was demolished in the 1950s, but the name tablets displaying the
  station's original name were kept. In the 1980s, the Woodhaven Boulevard station was renamed after
  Queens Center, an adjacent shopping mall." Source: as F136.
  → The surviving "SLATTERY PLAZA" tablets are a real, findable artifact — but they are in Elmhurst.

**P27. Rego Park station (LIRR, abandoned)** — 63rd Drive at the LIRR overpass

- **F138.** QUOTE (Wikipedia): "Rego Park is a former Long Island Rail Road station. It was made of wood,
  unlike most other stations that were concrete. The station opened in May 1928 with two side platforms
  outside the two Rockaway Beach Branch tracks that bracketed the four-track Main Line, so only Rockaway
  trains stopped there." Source: https://en.wikipedia.org/wiki/Rego_Park_station_(LIRR)
- **F139.** QUOTE (same): "After the Rockaway Trestle fire in 1950, the line was closed station by
  station. The station closed on June 8, 1962, one day before the Rockaway Beach Branch was abandoned.
  Nothing remains at the site today." Source: as F138.
- **F140.** QUOTE (same): "In 1927, calls came from the Rego Park community for a new LIRR station at 63rd
  Drive (originally Penelope Street). This was contrary to the desires of the railroad, who wished to
  cease further expansion of Queens operations. Construction on the new Rego Park station began on
  January 30, 1928… the station was completed in April, and opened on May 23, 1928. Two parades were
  held in Rego Park on May 26 to commemorate the opening of the station." Source: as F138.
  → 63rd Drive's earlier name **Penelope Street** connects to Fleetwood Triangle's Penelope Avenue (F63).
- **F141.** QUOTE (same): "The 63rd Drive entrance also featured a ticket office and heated waiting room,
  with restrooms." Source: as F138.
- **F142.** THE MATAWOK STATIONS — a real historical curiosity nobody writes about. QUOTE (same): "Prior
  to the construction of the Rego Park station, two former stations near Whitepot Junction were named
  Matawok, and were located on both the Main Line and Rockaway Beach Branch. Both stations were named
  for the Matawok Land Company, which built the neighborhood surrounding the junction known at the time
  as 'Forest Hills West.'" Source: as F138.
  → **"Forest Hills West" is a documented earlier name for part of what is now Rego Park.** Directly
  relevant to section 10.
- **F143.** QUOTE (same): "The other Matawok Station was located along the main line east of Whitepot
  Junction at 66th Avenue. It was opened on June 25, 1922… The station closed on May 21, 1925, but the
  remnants of the station remained for decades." Source: as F138.
- **F144.** QUOTE (Wikipedia, *Rego Park*): "The Long Island Rail Road overpass between Austin and
  Alderton Streets was the location of the Rego Park station until its abandonment in 1962… The station
  was later dismantled, and little can be discerned of its existence now save for the flattened clearing
  beside the tracks." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens

**P28. The Rockaway Beach Branch right-of-way / QueensWay vs. QueensLink**

- **F145.** QUOTE (Wikipedia): "there are two opposing proposals for the redevelopment of the abandoned
  3.5-mile (5.6 km) Rockaway Beach Branch, which runs from Rego Park south to Ozone Park. One group,
  Friends of the Queensway, wants to turn the rail line into parkland. Another group, QueensLink,
  proposes a dual use for the corridor, with a subway extension and park space."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F146.** QueensWay's own framing. QUOTE (thequeensway.org): "The QueensWay is a community-led effort to
  transform a blighted, 3.5 mile stretch of abandoned railway in Central Queens into a family-friendly
  linear park and cultural greenway." Source: https://www.thequeensway.org/
- **F147.** QueensLink's own framing. QUOTE (queenslink.org): "The Rockaway Beach Branch has sat abandoned
  for over 60 years. Some have called for restoring rail service, while others want to see more park
  space. Now we have a unique opportunity to build BOTH rails and trails!" Source: https://queenslink.org/
- **F148.** QueensLink's Rego Park-specific plan. QUOTE (queenslink.org, "Rego Park & Forest Hills"): "The
  QueensLink would extend the existing 'M' subway line south from 63rd Dr-Rego Park to the Rockaways. A
  new tunnel would connect the Queens Blvd subway line to the Rockaway Beach Branch right-of-way, then
  running beneith the right-of-way until Metropolitan Ave."
  Source: https://queenslink.org/rego-park-forest-hills ("beneith" is the source's spelling.)
- **F149.** QUOTE (same): "Tunneling to Metropolitan Avenue would make it possible for all the land at
  White Pot Junction in Rego Park to be used for park space, community gardens, walking trails, and bike
  trails." Source: as F148.
  → Note this source calls it **"White Pot Junction"** (two words); the LIRR article (F142) calls it
  **"Whitepot Junction"** (one word). Both spellings are in use.
- **F150.** QUOTE (same): "The Forest Hills Little League could continue to use the land just north of
  Fleet Street that was once part of the right-of-way." Source: as F148.
  → **Both advocacy organizations are partisan.** Attribute; do not adopt either voice.

**P29. Bus service**

- **F151.** QUOTE (Wikipedia): "The Q11, Q14, Q23, Q29, Q38, Q52 SBS, Q53 SBS, Q54, Q59, Q60, Q72, Q88 and
  Q98 local buses serve the neighborhood, as well as the QM10, QM11, QM12, QM15, QM18, QM40, QM42 and BM5
  express buses." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F152.** A SHORTER, INSTITUTIONAL list for the library's block specifically. QUOTE (Queens Public
  Library, Rego Park branch page): "Bus: Q11, Q38, Q53, Q60, Q72" and "Subway: R and M trains to 63rd
  Drive." Source: https://www.queenslibrary.org/about-us/locations/rego-park
  → Wikipedia's 13-local-bus list is much larger than QPL's 5; Wikipedia is presumably counting routes
  that merely touch the neighborhood's edges (Woodhaven Blvd, Junction Blvd, Horace Harding). Do not
  print the long list as "buses serving Rego Park" without checking. Also note Queens' bus network was
  redesigned in 2025; several of these route letters may be stale. I found no MTA source (new.mta.info
  returned 403).

---

## 7. Commerce, retail and housing

**P30. Rego Park II shopping center (Rego Center Phase II)** — Junction Boulevard
**⚠ CONTESTED NEIGHBORHOOD — see section 10.**

The strongest source here is a **federal securities filing**, which beats every secondary account.

- **F153.** QUOTE (Alexander's, Inc. Form 10-K for FY2025, filed 2026-02-09): "Rego Park II, a 606,000
  square foot shopping center, is located on Junction Boulevard in Queens. The center is anchored by a
  145,000 square foot Costco and a 133,000 square foot Kohl's. The center also includes a 60,000 square
  foot Burlington, a 47,000 square foot Best Buy, and a 40,000 square foot Marshalls. Kohl's' store is
  currently closed but the tenant remains obligated under its lease which expires in January 2031"
  Source: https://www.sec.gov/Archives/edgar/data/3499/000000349926000005/alx-20251231.htm
- **F154.** QUOTE (same 10-K): "Rego Park I, a 338,000 square foot shopping center, is located adjacent to
  our Rego Park II shopping center. The property is now vacant since the relocation of Burlington and
  Marshalls to Rego Park II in 2025. We are currently exploring sale opportunities for the property and
  are in advanced negotiations with a potential buyer" Source: as F153.
  → **As of the FY2025 10-K, Rego Park I is VACANT and being sold.** Any page describing it as a
  functioning mall is out of date.
- **F155.** QUOTE (same 10-K): "The Alexander apartment tower, located above our Rego Park II shopping
  center, contains 312 units aggregating 255,000 square feet." Source: as F153.
- **F156.** DOHMH inspection records place multiple Rego Park II tenants at **61-35 Junction Boulevard,
  ZIP 11374** (Starbucks, Chipotle, Panera Bread, Dallas BBQ, Auntie Anne's, Champion Pizza, Gong Cha,
  Iron Age, Teriyaki One). Source: https://data.cityofnewyork.us/resource/43nn-pn8j.json (zipcode
  11374) → so the city's food-inspection address for the center is 61-35 Junction Blvd in the Rego Park
  ZIP, even though Junction Boulevard is the Corona/Elmhurst boundary street.
- **F157.** CONFLICTING SECONDARY ACCOUNT. QUOTE (Wikipedia): "Rego Park is home to some of Queens' most
  popular shopping destinations, including the 277,000-square-foot (25,700 m2), four-floor Rego Center.
  Phase I has several large retailers as well as a multilevel parking garage developed by Vornado Realty
  Trust. Phase II opened in 2010 with 950,000 square feet (88,000 m2) of retail space on 62nd Drive
  across from Rego Park Center… It contained a small format IKEA, which opened in 2021 as the first of
  its type in the U.S. but closed in December 2022."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → **Every number conflicts with the 10-K.** Wikipedia: Phase I 277,000 sf / Phase II 950,000 sf on
  62nd Drive. Alexander's 10-K: Rego Park I 338,000 sf / Rego Park II 606,000 sf on Junction Boulevard.
  **Use the 10-K.** The IKEA detail (opened 2021, closed Dec 2022) I could not independently source;
  Wikipedia cites Curbed (https://www.curbed.com/2021/01/ikea-queens-store-opening-nyc.html) for the
  opening only, not the closing.
- **F158.** QUOTE (same 10-K, risk factors): "We depend upon anchor tenants to attract shoppers at our
  Rego Park II retail property" Source: as F153.
- **F159.** QUOTE (Wikipedia, Housing): "Vornado Realty Trust built a 312-unit residential tower on top of
  Rego Center Phase II, to accommodate a surge in young professionals moving into the area. About 20% of
  the units are studio apartments, with the rest being one- and two-bedroom apartments."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens (unit count agrees with the 10-K, F155)
- **F160.** Vornado's own property pages for Rego Park returned "The page you are looking for appears to
  have been moved, deleted, or does not exist," and alx-inc.com returned Access Denied. I could not get a
  first-party marketing description. Sources: https://www.vno.com/property/rego-park-i ;
  https://www.vno.com/property/rego-park-ii ; https://www.alx-inc.com/properties/

**P31. Alexander's department store (former)** — Queens Blvd / Junction Blvd

- **F161.** QUOTE (Forgotten New York, 2006): "This was formerly a Queens branch of the department store,
  Alexander's, before the retail chain folded in the 1990s. (Alexander's, Inc. continues to operate as a
  real estate investment trust, however.) The lot behind it is gigantic and no longer used for parking
  cars… Walmart planned to build one of their stores in the empty space, but as they were deemed to be a
  politically incorrect fit for a union town such as ours, the idea was shot down."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/
  → The Walmart claim is stated in a personal, opinionated register by a volunteer contributor. Do not
  repeat without a news source.
- **F162.** QUOTE (Forgotten New York, on the Howard Johnson's that stood at Queens and Junction Blvds):
  "World famous for their orange-roofed building design as well as for their ice cream, Howard Johnson's
  had a location at Queens and Junction Blvds throughout most of the 20th century. Celebrity chef Jacques
  Pepin once worked here… It was replaced by this boxy, black, glass-covered office building in 1970."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/
  → The Jacques Pépin detail is a strong hook **if** verifiable. Forgotten NY gives no citation. Lead only.

**P32. Queens Center Mall** — **⚠ NOT Rego Park. Elmhurst. See section 10.**

- **F163.** QUOTE (Wikipedia, *Rego Park*, explicitly disclaiming it): "Across the Long Island Expressway,
  **in nearby Elmhurst**, is the Queens Center Mall. This mall opened on September 12, 1973, on land
  previously occupied by Fairyland, a supermarket, and automobile parking. The mall doubled in size from
  2002 to 2004." (emphasis mine) Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F164.** CONFLICTING OPENING YEAR. QUOTE (Forgotten New York): "At Woodhaven and Queens Blvds. you'll
  find Queens Center. Opened in 1972, its major tenants over the years have included Ohrbach's, JC
  Penney, Macy's and Sterns." Source: https://forgotten-ny.com/2006/03/rego-park-queens/
  → 1972 vs. September 12, 1973. Recorded; not resolved. **In any case this is Elmhurst's place, not
  Rego Park's.**
- **F165.** A nice detail about the mall's facade, again Elmhurst's. QUOTE (Forgotten New York): "A nice
  touch was added to the mall's new design: the names of almost every Queens neighborhood circle its
  facade." Source: https://forgotten-ny.com/2006/03/rego-park-queens/
- **F166.** **P33. Fairyland amusement park (gone).** QUOTE (Forgotten New York): "Prior to hosting the
  mall, this spot was home to an amusement park called Fairyland."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/ → Elmhurst site. Record for the Elmhurst
  finder's benefit, not for Rego Park.

**P34. LeFrak City** — **⚠ NOT Rego Park. See section 10.**

- **F167.** QUOTE (Wikipedia, *LeFrak City*): "LeFrak City (originally spelled Lefrak and pronounced
  le-FRAK) is a 4,605-apartment development **in the southernmost region of Corona and the easternmost
  part of Elmhurst**, a neighborhood in the New York City borough of Queens. It is located between
  Junction Boulevard to the west, 57th Avenue to the north, 99th Street to the east, and the Long Island
  Expressway to the south." (emphasis mine) Source: https://en.wikipedia.org/wiki/LeFrak_City
- **F168.** QUOTE (same): "The complex of twenty 17-story apartment towers covers 40 acres (16 ha) and
  houses over 14,000 people in 4,605 apartments… The development is part of Queens Community Board 4."
  Source: as F167. → **CB4, not CB6.** Decisive against a Rego Park claim.
- **F169.** QUOTE (same): "The buildings are all named after cities or countries around the world and are
  grouped in clusters of four based on their theme. This naming system came about during the 1964 New
  York World's Fair, which was located in nearby Flushing Meadows–Corona Park." Source: as F167.
  → See section 0. This is a naming fact about LeFrak City. It is **not** a licence to narrate anything
  inside Flushing Meadows Corona Park.
- **F170.** QUOTE (same): "Named for its developer, the LeFrak Organization (founded by Samuel J. LeFrak),
  LeFrak City was built in 1962–1971… The complex was built atop Horse Brook, a small stream that once
  wound through Elmhurst along the path of the LIE." Source: as F167.
- **F171.** BUT a Rego Park source claims it. QUOTE (Forgotten New York, in its Rego Park article): "The
  Lefrak Organization has definitely made its presence known in Rego Park and neighboring Corona."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/ → Contested. Record.

**P35. Housing stock generally**

- **F172.** QUOTE (Wikipedia): "Many apartment buildings, multi-family, and railroad houses make up the
  north side of Rego Park. Apartment complexes include The Carol House, Savoy Gardens, Jupiter Court, The
  Brussels, and Walden Terrace." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → Five named complexes; none independently sourced. Leads only.
- **F173.** QUOTE (Wikipedia): "However, many houses in southern Rego Park are in the colonial, English,
  and Tudor styles with slate roofs." Source: as F172.
- **F174.** The "Fedders house" phenomenon, which is genuinely a Rego Park signature. QUOTE (Wikipedia):
  "There are also many newer 'Fedders houses', so called because these newer houses are all cheaply made
  and uniform-looking, with the names of the air conditioners (usually of the Fedders brand) sticking out
  of the walls." Source: as F172. Wikipedia cites *The New York Times*, "The True Story of the 'Fedders'
  Curse," March 19, 2006: https://www.nytimes.com/2006/03/19/nyregion/19fedd.html
  → NYT is a solid citation for this if the verifier can reach it. Note the loaded adjectives ("cheaply
  made") are Wikipedia's editorializing, not the NYT's.
- **F175.** Forgotten NY's contemporaneous version, explicitly opinionated. QUOTE: "Unfortunately, Fedders
  housing has also managed to creep in… The house on the left was built from a template. The grassy lawn
  of the Tudor has been replaced by concrete ramps leading to basement garages."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/ → Attribute or omit.
- **F176.** QUOTE (Forgotten New York): "Original English-style attached homes line the quaint, tree-lined
  streets of Rego Park in a tasteful way. The design of the planned community allowed for detached homes
  as well." Source: as F175.

---

## 8. Food and drink

**MANDATORY DISCLOSURE PER THE BRIEF.** I ran the NYC DOHMH Restaurant Inspection Results dataset
(https://data.cityofnewyork.us/resource/43nn-pn8j.json) filtered to `zipcode='11374'`. It returned **94
distinct establishment/address rows**. For the great majority of those establishments, **the DOHMH
inspection dataset is the ONLY source I have.** A DOHMH row proves an inspected food-service permit at an
address at some point in the dataset's window. It does NOT establish that a business is open, notable,
good, historic, or worth a visit, and it carries no founding date, no ownership history, and no
description. Per the brief, that constrains what may be written later: **any establishment listed under
"DOHMH-ONLY" below must not be given a founding date, a history, a cuisine narrative, or a
recommendation.**

**DOHMH-ONLY (94 rows; the full list, with the caveat above applying to every one):**
Almaz Palace (90-17 63 Dr) · Ansor (94-03 63 Dr) · Aroma / Sugar N Coal (63-40 Woodhaven Blvd) · Art of
Grill (97-13 Queens Blvd) · Asia Chinese (63-104 Woodhaven Blvd) · Auntie Anne's (61-35 Junction Blvd) ·
Avellino Ristorante & Pizzeria (97-03 64 Ave) · Bagel Chef (97-17 Queens Blvd) · Bagelette (97-42 63 Rd) ·
Barosa Brick Oven (62-29 Woodhaven Blvd) · Black Sea Fish & Grill (95-36 Queens Blvd) · Burger King
(92-83 Queens Blvd) · Cafe Bora-Bora (97-08 Queens Blvd) · Chaikhana 7:40 (63-52 Booth St) ·
**Cheburechnaya (92-09 63 Dr)** · Champion Pizza · Chipotle · Cups N Cakes Cafe (62-24 Woodhaven Blvd) ·
Dallas BBQ · Domino's (95-28 Queens Blvd) · Don Alex (97-05 64 Ave, Peruvian) · Dunkin ×2 · Fatsa (95-36
Queens Blvd) · Fortune (90-21 63 Dr) · Fu Ying / Fu Ying Chinese (97-09 Queens Blvd) · Gong Cha ×2 ·
Grand Sichuan (98-108 Queens Blvd) · Gyro Grill (63-02 Woodhaven Blvd) · Haifa (94-03 63 Dr) · Haven
Grill & Sushi (63-98 Woodhaven Blvd) · Il Primo Caffe (63-55 Alderton St) · Impact Sports Club (65-75
Woodhaven Blvd) · Imperial (98-92 Queens Blvd) · Iron Age (61-35 Junction Blvd, Korean) · J&D Pizzeria
(98-51 63 Rd) · Jade Bamboo (65-07 Woodhaven Blvd) · Joya Hall (63-108 Woodhaven Blvd) · L'Chaim (94-09
63 Dr) · Lime & Salt Bar (98-102 Queens Blvd) · **London Lennie's (63-88 Woodhaven Blvd)** — see P36,
NOT DOHMH-only · Marakand (98-98 Queens Blvd) · Marani (97-26 63 Rd) · Nom Tea (93-05A 63 Dr) · Nur Thai
(63-32 Woodhaven Blvd) · Oceanic Boil (96-18 Queens Blvd) · Omakase Ramen (95-34 Queens Blvd) · Panda
Express (90-04 Metropolitan Ave) · Panera Bread · Parceros Bakery & Coffee Shop (63-54 Woodhaven Blvd) ·
Paris Baguette (96-33 Queens Blvd) · Peri Peri Original (95-16A Queens Blvd) · Pho 99 (65-37 99 St) · Pho
Thai (95-26 Queens Blvd) · Pizza Hut (96-08 Queens Blvd) · Pollos a la Brasa Mario (63-20 Woodhaven Blvd)
· Popeyes (95-06 63 Dr) · Posh Fusion (65-35 Austin St) · Prestige (91-33 63 Dr) · RB Bakery Rego Park
(96-16 Queens Blvd) · Red Mango (61-01 Junction Blvd) · **Registan Plov Center (63-24 99 St, "Eastern
European")** · Rego Bagels (95-08 63 Dr) · Rego Garden (93-03 63 Dr) · Rego Park Best Pizza & Fried
Chicken (99-10 63 Rd) · Rego Park Coffee Shop (94-14 63 Dr) · Rego Slice Pizzeria (93-21 63 Dr) · Retro
Fitness (92-77 Queens Blvd) · Salsa Pizzeria (63-118 Woodhaven Blvd) · **Shashlichnaya/Sezam (96-30
Queens Blvd)** · Skyline Coffee (63-55 Alderton St) · Spring Thai Fusion & Bar (96-40 Queens Blvd) ·
Starbucks ×3 · Subway (95-58 Queens Blvd) · Sushi 33 (63-56 Booth St) · Sushi Ya (97-11 Queens Blvd) ·
Taco Bell (9506 63rd Dr) · Tandoor Restaurant (95-24 Queens Blvd) · Tandoori Food & Bakery (99-04 63 Rd)
· Tasty and Co (94-19 63 Dr) · Teriyaki One · The Chicken Shack (95-05 63 Dr) · The Dinerbar (97-45
Queens Blvd) · The Taco Place (94-03A 63 Dr) · Tropix Bar & Lounge (95-32 Queens Blvd) · UThai (63-55
Wetherole St) · **Uyghur Lagman House (62-08 Woodhaven Blvd)** · **Versailles Palace (63-34 Austin St,
"Russian")** · Vista 65 (97-12 65 Rd) · Wendy's (90-13 Metropolitan Ave)

- **F177.** The above list as retrieved 2026-09-01.
  Source: https://data.cityofnewyork.us/resource/43nn-pn8j.json
- **F178.** A structural observation the data supports on its own: DOHMH's `cuisine_description` field
  labels **thirteen** of these establishments **"Jewish/Kosher"** (Almaz Palace, Art of Grill, Bagelette,
  Chaikhana 7:40, Cheburechnaya, Fortune, Haifa, Haven Grill & Sushi, L'Chaim, Marani, Prestige,
  Shashlichnaya/Sezam, Tandoori Food & Bakery), plus one "Eastern European" (Registan Plov Center) and one
  "Russian" (Versailles Palace). Source: as F177.
  → This is the Bukharian food scene visible in city data, and the density is itself the story. But it is
  a **count from an inspection dataset**, not a restaurant review, and must be framed that way.
- **F179.** **NOTABLE ABSENCES from the 11374 DOHMH list**, worth recording because they suggest closures:
  Ben's Best Kosher Delicatessen, Knish Nosh, Joe Abbracciamento, and Shalimar Diner (the last is
  confirmed demolished, F186). Absence from an extract is **not** proof of closure. Do not assert it.
  Source: as F177.

**P36. London Lennie's** — 63-88 Woodhaven Boulevard — **NOT DOHMH-only.**

- **F180.** First-party address and neighborhood self-assignment. QUOTE (londonlennies.com, site header):
  "63-88 Woodhaven Boulevard, Rego Park, NY 11374". Source: https://www.londonlennies.com/about
- **F181.** QUOTE (londonlennies.com, "Our Story"): "For generations, London Lennie's has been a New York
  seafood destination where tradition, quality, and hospitality come together. What began as a
  neighborhood fish market evolved into one of Queens' most beloved seafood restaurants, earning a
  reputation for serving the freshest seafood with warm, attentive service."
  Source: https://www.londonlennies.com/about
  → **Note what this text does NOT say: it gives no founding year.** The commonly repeated founding dates
  for London Lennie's are not on the restaurant's own site as of this retrieval. Do not print a year.
- **F182.** OWNERSHIP CHANGE — important and current. QUOTE (same): "Today, while honoring our rich
  history, London Lennie's is entering an exciting new chapter. **Under new ownership**, we continue to
  preserve the traditions that generations of guests have come to love while introducing thoughtful
  updates to our menu, dining experience, and hospitality." (emphasis mine)
  Source: https://www.londonlennies.com/about
  → Any copy describing London Lennie's as a family-run institution is now questionable.
- **F183.** DOHMH corroborates the address and ZIP independently: `LONDON LENNIE'S | 63-88 WOODHAVEN
  BOULEVARD | Seafood`, zipcode 11374. Source: https://data.cityofnewyork.us/resource/43nn-pn8j.json
  → So London Lennie's has **two** independent sources (its own site + DOHMH) and is not DOHMH-only.

**P37. Masbia of Queens (kosher soup kitchen)** — 98-08 Queens Boulevard

- **F184.** QUOTE (*Queens Chronicle*, "Feeding the needy, with charity to all," by Mark Lord, republished
  by Masbia, Oct 9, 2014): "the Masbia Soup Kitchen Network, which was founded just under a decade ago and
  opened its latest location, its third, at 98-08 Queens Blvd. in Rego Park in March 2010."
  Source: https://www.masbia.org/queens
- **F185.** QUOTE (same): "Tucked inauspiciously between a pharmacy and an Indian seafood restaurant, the
  kitchen could easily be mistaken for just one more restaurant in a neighborhood that overflows with
  eating establishments." Source: as F184.
  Corroborating context — QUOTE (Wikipedia): "In March 2010, the Metropolitan Council on Jewish Poverty, a
  beneficiary agency of the UJA-Federation of New York, partnered with Masbia in the opening of a kosher
  soup kitchen on Queens Boulevard. As of August 2010, the free restaurant was serving over 1,500 meals
  per month to adults, senior citizens, and families."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens

**P38. Shalimar Diner (demolished 2019)** — 63rd Drive, near Austin Street

- **F186.** QUOTE (QNS.com, "Developer tears down Rego Park's Shalimar Diner as plans to relocate eatery
  fall through," by Bill Parry, July 9, 2019): "The iconic Rego Park eatery, which served the community for
  45 years, was destroyed by its new property owner Wednesday as the efforts of two men who grew up in
  Forest Hills and hoped to move the diner to another location fell through."
  Source: https://qns.com/story/2019/07/09/developer-begins-tearing-down-rego-parks-shalimar-diner-as-plans-to-relocate-eatery-fall-through/
- **F187.** QUOTE (same): "In April, preservasionist Michael Perlman started looking for an ally that could
  save the diner and transport it to a new location. Perlman enlisted real estate attorney and entrepreneur
  Ronald Hariri who wanted to transport the structure to a parcel of land Hariri owns in the Suffolk County
  hamlet of Aquebogue." Source: as F186. ("preservasionist" is the source's spelling.)
- **F188.** QUOTE (same, quoting Hariri): "We tried but the diner would not fit in with the zoning on my
  property in Riverhead… We feel terrible but they have restrictive zoning with certain architectural
  requirements that prohibited this type of structure." Source: as F186.
- **F189.** Its origin. QUOTE (Forgotten New York, 2006): "Just down the street is the Shalimar Diner, built
  in 1972 after the 'Rego Park Inferno' destroyed a row of stores and the Rego Park branch of the public
  library which was subsequently rebuilt." Source: https://forgotten-ny.com/2006/03/rego-park-queens/
  → CONFLICT: QNS says it "served the community for 45 years" (implying c. 1974 if demolished 2019);
  Forgotten NY says "built in 1972." Rego-Forest (F35) says the diner sits on the **old library** site.
  Wikipedia says the new library was built on the **Shell gas station** site across the street. These are
  consistent with each other but the diner's build year is not settled.
- **F190.** QUOTE (Wikipedia): "The 2013 film The Wolf of Wall Street was filmed in part in Rego Park, at
  the now-demolished Shalimar Diner." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens

**P39. Jay Dee Bakery** — Queens Boulevard

- **F191.** QUOTE (Forgotten New York, 2006): "The Jay Dee Bakery has been on Queens Blvd. for decades. It's
  changed hands a few times, but the name and vintage neon sign has stayed put throughout it all. Your
  Webmaster believes the sign dates to the 1950s."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/
  → Note the source's own hedge: "**believes** the sign dates to the 1950s." That is a guess, in print, and
  must not be laundered into a fact. Also: 20 years old, and Jay Dee does not appear in the DOHMH 11374
  extract. Current status unknown.

---

## 9. Institutions, education, culture, people

**P40. Queens Public Library, Rego Park branch** — 91-41 63rd Drive — **CURRENTLY CLOSED**

- **F192.** QUOTE (Queens Public Library, Rego Park branch page): "Rego Park is closed for the construction
  of a new building." Source: https://www.queenslibrary.org/about-us/locations/rego-park
- **F193.** PARAPHRASE (same page, retrieved 2026-09-01): the branch address is given as 91-41 63 Drive,
  Rego Park, NY 11374, phone (718) 459-5140; the branch is expected to reopen in **Winter 2029–2030**; a
  Mobile Library serves the site on Thursdays 10am–5pm excluding holidays; the new three-story building
  will include dedicated children's and teen spaces, adult areas, multipurpose rooms, an elevator and a
  green roof; and patrons are directed to Elmhurst (86-07 Broadway), Forest Hills (108-19 71 Avenue) and
  North Forest Park (98-27 Metropolitan Avenue). Source: as F192.
  → **The 2029–2030 reopening flatly contradicts Wikipedia**, which says QUOTE: "The existing one-story
  7,500-square-foot (700 m2) branch, built in 1975, is planned to be replaced with a two-story,
  18,000-square-foot (1,700 m2) building between 2021 and 2024."
  (https://en.wikipedia.org/wiki/Rego_Park,_Queens). Wikipedia also says two stories; QPL now says three.
  **Use QPL.** Do not tell a reader to visit this library.
- **F194.** QUOTE (Wikipedia): "It had 189,000 visitors and a total circulation of 194,000 in 2016."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F195.** Note the address drift across sources: Rego-Forest/Marzlock gives the *pre-1972* library as
  **91-34** 63rd Drive (F32); QPL gives the current site as **91-41** 63 Drive. Consistent with the "new
  library across the street" account (F35). Sources: as F32, F192.

**P41. Schools**

- **F196.** QUOTE (Wikipedia): "P.S. 139 (Rego Park School, grades K–5) · P.S. 174 (William Sidney Mount
  School) · P.S. 175 (the Lynn Gross Discovery School) · P.S. 206 (the Horace Harding School, grades K–5)
  · P.S. 220 (Edward Mandel School)" — listed as "The following elementary schools serve Rego Park."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → "serve" ≠ "are located in." Several of these are outside the neighborhood. Do not treat as addresses.
- **F197.** QUOTE (Wikipedia): "All areas in Rego Park are zoned to J.H.S. 157 Stephen A. Halsey (6–9), in
  Rego Park, or J.H.S. 190 Russell Sage (7–9) in Forest Hills. Rego Park is not zoned to a high school
  because all New York City high schools get students by application."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F198.** QUOTE (Wikipedia): "Our Lady of the Angelus, a PK–8 private school operated by the Roman
  Catholic Diocese of Brooklyn, is located in Rego Park. Resurrection-Ascension School, another PK–8
  private school operated by the Diocese of Brooklyn, is also located in Rego Park. Our Saviour Lutheran
  School, K-8, is on Woodhaven Boulevard and is a ministry of Our Saviour Lutheran Church on 63rd Drive."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → **I could not corroborate any of the three.** raparish.org, olangelus.org and oslcregopark.org all
  returned empty; the Diocese of Brooklyn parish pages
  (https://dioceseofbrooklyn.org/parish/resurrection-ascension/ and
  https://dioceseofbrooklyn.org/parish/our-lady-of-the-angelus/) rendered navigation chrome only, with no
  parish content in the fetched HTML. No addresses obtained. **Leads, not facts.**
- **F199.** QUOTE (Wikipedia): "Private institutions include the Rego Park Jewish Center and the Jewish
  Institute of Queens (also known as the Queens Gymnasia)." Source: as F198. Uncorroborated.
- **F200.** QUOTE (Wikipedia): "Valence College Preparatory Charter school is a 5-8 grade school located in
  Rego Park. Central Queens Academy Charter school I is another school located in Rego Park from grades
  K-8." Source: as F198. Uncorroborated.

**P42. Our Saviour Lutheran Church** — 63rd Drive at Wetherole Street

- **F201.** QUOTE (Wikipedia): "Our Saviour Lutheran Church, open since the 1920s, conducts its services in
  English and Chinese." Elsewhere the same article dates it: "Our Saviour Lutheran Church established in
  1926 which right across Wetherole Street from PS 139Q."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F202.** QUOTE (Forgotten New York, 2006): "Sneaking down 63rd Drive before continuing along Queens Blvd,
  we happen upon Our Savior Lutheran Church, an institution that has been in existence for almost 80 years.
  Services are conducted in English and Chinese, reflecting the diversity of modern-day Rego Park."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/
  → "almost 80 years" in 2006 back-calculates to roughly 1926–1928, consistent with F201. Note the spelling
  varies between "Saviour" (Wikipedia) and "Savior" (Forgotten NY). No first-party source obtained.

**P43. The Bukharian Jewish community and 108th Street** — **⚠ CONTESTED. See section 10.**

- **F203.** QUOTE (Wikipedia): "Like its neighbor Forest Hills, Rego Park has long had a significant Jewish
  population, many of whom have Georgian and Russian Jewish ancestors, and consequently there are a number
  of synagogues and kosher restaurants. Many Holocaust survivors settled in Rego Park after 1945. In the
  1990s, Jewish immigrants from the former Soviet Union, especially from Central Asia, moved in. Most of
  the residents are Bukharan Jewish, and the effect of life in the Soviet Union on the population has led
  Rego Park to have a Russian feel, with many signs in Russian Cyrillic. Most of the Bukharan Jewish
  immigrants in the neighborhood come from Uzbekistan and Tajikistan, and there is also Uzbek and Tajik
  cuisine in many Rego Park restaurants." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → "Most of the residents are Bukharan Jewish" is a strong demographic claim that the 2010 census figures
  in F9 (46.2% White, 31.7% Asian, 16.6% Hispanic) do not obviously support. Flag as unverified.
- **F204.** QUOTE (Wikipedia): "Immigrant populations from Albania, Bosnia, Bulgaria, Colombia, China, Iran,
  Israel, Italy, Mongolia, Peru, Romania, South Asia, South Korea, and Ukraine are also represented in the
  neighborhood." Source: as F203.
- **F205.** THE NICKNAMES. QUOTE (Barry Popik, "Buharlem or Bukharlem (Bukhara + Harlem)," July 15, 2008):
  "Queens—specifically Rego Park and Forest Hills—is home to many Bukharan Jews from Central Asia, the
  result of emigration since the 1970s. Rego Park is sometimes given a '-stan' suffix (like the countries
  of Uzbekistan and Tajikistan) and is nicknamed 'Rego Parkistan.'"
  Source: https://www.barrypopik.com/index.php/new_york_city/entry/buharlem_or_bukharlem_bukhara_harlem/
- **F206.** QUOTE (same source, in Popik's own voice): "**108th Street in Rego Park** has been called the
  'Bukharan Broadway' or 'Bukharian Broadway.' Many Bukharian restaurants and shops can be found in the
  area." (emphasis mine) Source: as F205.
- **F207.** THE SAME PAGE, CONTRADICTING ITSELF. QUOTE (Popik, quoting Wikipedia's *Bukharan Jews* article
  on the same page): "New York City's 108th Street, often referred to as 'Buharlem' or 'Bukharian
  Broadway' **in Forest Hills, Queens**, is filled with Bukharian restaurants and gift shops." (emphasis
  mine) Source: as F205.
  → **One page, two neighborhoods, for the same street.** This is the cleanest documented instance of the
  Rego Park / Forest Hills boundary problem in this wave.
- **F208.** Also from Popik, quoting a 2005 event: "On the beginning of the Jewish New Year 5765 (2005), the
  Bukharian Jewish Community of Queens (mainly Rego Park and Forest Hills) celebrated the opening of the
  Bukharian Jewish Congress." Source: as F205.
  → **CAUTION on this source:** barrypopik.com is a lexicographer's citation-collection site. Much of the
  page consists of quoted forum and blog postings, including one crude, slur-laden passage. Popik's own
  headnote (F206) is usable; the user-generated quotations are not.
- **F209.** **P44. Fatima Kuinova**, Bukharan Jewish singer — a genuine federal-recognition fact tied to Rego
  Park. QUOTE (National Endowment for the Arts, National Heritage Fellowships): "Fatima Kuinova / Bukharan
  Jewish Singer / 1992 / NEA National Heritage Fellow / **Rego Park, New York**"
  Source: https://www.arts.gov/honors/heritage/fatima-kuinova
- **F210.** QUOTE (NEA bio): "Fatima Kuinova was born on December 28, 1920, in Samarkand, Tajikistan, in
  Soviet Central Asia, one of 10 children… Because of the widespread discrimination against Jews under
  Stalin, she took the name Kuinova to hide her true identity. Her Jewish name was Cohen, and throughout her
  life she has retained the Kuinova." Source: as F209.
  (Note: the NEA text says "Samarkand, Tajikistan"; Samarkand is in Uzbekistan. The error is the source's.)
- **F211.** QUOTE (NEA bio): "In 1948 she was named Honored Artist of the Soviet Union. In 1949 she began
  studying shashmaqam, the traditional music of her region." Source: as F209.
  → CONFLICT with Wikipedia's Rego Park notable-residents list, which describes Kuinova as "(Merited Artist
  of USSR)" and gives her dates as (1926–2021), against NEA's birth date of December 28, **1920**.
  Sources: as F209 ; https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F212.** **P45. Malika Kalontarova.** QUOTE (Wikipedia): "Malika Kalontarova (born 1950), Central Asian
  dancer known as the 'Queen of Eastern Dance' (People's Artist of USSR)."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens. Uncorroborated.

**P46. Rego Park Green Alliance**

- **F213.** QUOTE (Wikipedia): "The Rego Park Green Alliance has been active in the community planting
  flowers and trees, arranging the installation of new garbage cans, pushing for the repair of some
  sidewalks and creating a large mural celebrating the neighborhood under the LIRR overpass on 63rd Drive."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → **The mural under the LIRR overpass on 63rd Drive is a concrete, findable, photographable, free thing
  a visitor can go see.** Wikipedia's only citation is a blogspot page
  (http://regoparkgreencommittee.blogspot.com). Worth a first-party check.

**P47. Rego-Forest Preservation Council**

- **F214.** QUOTE (organization's own blog masthead): "To advocate for landmark status for architecturally &
  culturally significant sites in Rego Park, Forest Hills, & nearby Queens communities, & document local
  history." Source: https://regoforestpreservation.blogspot.com/
- **F215.** QUOTE (mission statement, same site): "Rego-Forest Preservation Council seeks to preserve and
  commemorate the architectural and cultural history of Rego Park, Forest Hills, and adjacent neighborhoods
  of Queens, NY." Founded by Chairman Michael Perlman. Source: as F214.
  → **The organization's own name pairs Rego Park and Forest Hills as one preservation constituency.** That
  is itself evidence about how locals experience the boundary.

**P48. Pop culture**

- **F216.** QUOTE (Wikipedia): "The CBS television sitcom The King of Queens is set in Rego Park and the main
  characters live at the fictional 3121 Aberdeen St."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F217.** **Art Spiegelman and *Maus*.** QUOTE (Wikipedia): "Art Spiegelman (born 1948), Pulitzer
  Prize–winning graphic artist who made Rego Park the setting for significant scenes involving his aged
  father in Maus, his graphic novel about the Holocaust." Source: as F216.
  → Combined with F203 ("Many Holocaust survivors settled in Rego Park after 1945"), this is the single
  richest cultural thread available to a Rego Park page. Neither claim is independently sourced here.
- **F218.** QUOTE (Forgotten New York, 2006): "From 1988-1992, a popular sitcom, Dear John, starring Judd
  Hirsch, was a part of NBC's lineup. In the show, the character of John, played by Hirsch, joined a support
  group for divorced and widowed people that met regularly in a Rego Park community center."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/
  → Presumably alluding to Lost Battalion Hall (P6), but the source does not say so. Do not connect them.
- **F219.** Notable residents per Wikipedia, **none independently verified by me**: Kenny Anderson, David
  Baltimore, Felix Biederman, Lili Bosse, John Brandon, Sid Caesar, Eddie Egan, Vera-Ellen, Rosco Gordon,
  June Havoc, Steve Hofstetter, August Howard, Malika Kalontarova, Fatima Kuinova, Gypsy Rose Lee, Robert
  Lipsyte, Frank Lorenzo, Joe Nichols, Tommy Ramone, Dave Rubinstein, Bobby Schayer, Fred Silverman, Art
  Spiegelman, Donald A. Wollheim. Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
- **F220.** A **different** and partly non-overlapping list from Forgotten NY. QUOTE: "Real life celebrities
  have also called Rego Park home. These include: comedians Sid Caesar and Eddie Bracken, burlesque queen
  Gypsy Rose Lee, actresses June Havoc and Alice Faye, former Miss America and city Cultural Affairs
  Commissioner Bess Myerson, TV producer Fred Silverman and former Knicks star Willis Reed."
  Source: https://forgotten-ny.com/2006/03/rego-park-queens/
  → **Eddie Bracken, Alice Faye, Bess Myerson and Willis Reed appear only in Forgotten NY; Kenny Anderson
  appears only in Wikipedia** (and Wikipedia's *LeFrak City* article separately claims Kenny Anderson as a
  LeFrak City resident — https://en.wikipedia.org/wiki/LeFrak_City). Two lists, minimal overlap, no
  citations on either. Treat every name as unverified.

**P49. Public safety facts (for completeness, low visitor value)**

- **F221.** QUOTE (Wikipedia): "Rego Park and Forest Hills are patrolled by the 112th Precinct of the NYPD,
  located at 68-40 Austin Street." Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → Forgotten NY captions a photo "112th Precinct Stationhouse at Austin Street"
  (https://forgotten-ny.com/2006/03/rego-park-queens/). 68-40 Austin Street is a **Forest Hills** address.
- **F222.** QUOTE (Wikipedia): "There are no fire stations in Rego Park itself, but the surrounding area
  contains two New York City Fire Department (FDNY) fire stations: Engine Co. 305/Ladder Co. 151 – 111-02
  Queens Boulevard, in Forest Hills; Engine Co. 319 – 78-11 67th Road, in Middle Village."
  Source: https://en.wikipedia.org/wiki/Rego_Park,_Queens
  → Engine Co. 305 / Ladder 151 at 111-02 Queens Blvd is the LPC-designated firehouse in the section 4
  table (LP-02522, designated 6/12/2012), and both Wikipedia and DCP's NTA assign it to **Forest Hills**.
  Consistent. Not contested.
- **F223.** QUOTE (Wikipedia): "The nearest large hospitals are the Elmhurst Hospital Center in Elmhurst and
  Long Island Jewish Forest Hills in Forest Hills." Source: as F222.

---

## 10. ⚠ CONTESTED NEIGHBORHOOD ASSIGNMENTS — the required list

Per the wave brief: every place any source assigns to a *different* one of Corona / Elmhurst / Forest Hills
/ Rego Park. **I have recorded the conflict and taken no position.** Sorted by how load-bearing the dispute
is.

| # | Place | Street address | Sources say Rego Park | Sources say otherwise | Official DCP NTA |
|---|---|---|---|---|---|
| C1 | **Trylon Theater** | 98-81 Queens Blvd | 1939nyworldsfair.com page header: "Rego Park section of Queens, NY" and body "Located in the Rego Park section of Queens"; Wikipedia lists it under *Rego Park* → Landmarks | **Same 1939nyworldsfair.com page**, photo caption: "Trylon Theater 98-81 Queens Blvd, **Forest Hills**, NY"; Rego-Forest Preservation Council: "This theater at 98-81 Queens Blvd, **Forest Hills**" | Not determined — no LPC record exists (F103), so no `nta2020` field. **Verifier must geocode the lot.** |
| C2 | **108th Street "Bukharian Broadway"** | 108th St, roughly 63rd Dr–70th Rd | Barry Popik, own voice: "**108th Street in Rego Park** has been called the 'Bukharan Broadway'"; Wikipedia (*Rego Park*): "Shopping districts with many smaller stores, bakeries, pharmacies and restaurants can be found along 108th Street as well." | Wikipedia (*Bukharan Jews*), quoted on the same Popik page: "New York City's 108th Street, often referred to as 'Buharlem' or 'Bukharian Broadway' **in Forest Hills, Queens**" | 108th St is the approximate QN0601/QN0602 seam. Needs lot-by-lot resolution. |
| C3 | **Remsen Cemetery / Remsen Family Cemetery** | adjacent to 69-43 Trotting Course Lane, at Alderton St | NYC Parks assigns **ZIP 11374** (the Rego Park ZIP); DCP assigns tax block 3178 lot 44 to **NTA QN0601 Rego Park** | Forgotten NY and Wikipedia both locate it "along Alderton Street **near Metropolitan Avenue**," language that reads as Forest Hills/Middle Village; NYC Parks' own "Other Parks Nearby" list for it is dominated by Forest Park and Middle Village Playground; LPC LP-1177 names **no neighborhood at all** | **QN0601 Rego Park** (F71). Strongest official signal in this table. |
| C4 | **Rego Park I & Rego Park II shopping centers / The Alexander tower** | 61-35 Junction Blvd (DOHMH); "on Junction Boulevard" (10-K) | The name itself; DOHMH ZIP **11374**; Wikipedia's *Rego Park* Commerce section | Alexander's 10-K says only "located on Junction Boulevard in Queens" — **it never says Rego Park is the neighborhood**; Junction Blvd is the conventional Corona/Elmhurst line; Wikipedia's *LeFrak City* article says "The Queens Center Mall and Rego Center are both two to three blocks away from" LeFrak City, which is in **CB4** | Needs geocoding. The ZIP says 11374; the street says Corona/Elmhurst. |
| C5 | **Ridgewood Savings Bank, Forest Hills Branch** | 107-55 Queens Blvd, block 2216 lot 1 | Its 107-xx Queens Blvd address sits immediately west of 108th St, i.e. at the Rego Park edge; no source I found actually claims it for Rego Park — **flagged for symmetry, not because a source contests it** | LPC LP-2066 names it "**FOREST HILLS** BRANCH" in the designation title and repeatedly in the text | **QN0602 Forest Hills** (F84). Probably not genuinely contested. |
| C6 | **67th Avenue subway station** | 67th Ave & Queens Blvd | Wikipedia (*Rego Park*): "The IND Queens Boulevard Line … has local stations at 63rd Drive and 67th Avenue" — claimed as Rego Park's | Wikipedia (*67th Avenue station*): "on the **border** of Forest Hills and Rego Park" | Border case by the source's own admission. |
| C7 | **Woodhaven Boulevard subway station / Slattery Plaza** | Queens Blvd & Woodhaven Blvd | Wikipedia (*Rego Park*) implies proximity; Forgotten NY tours it inside its Rego Park article | Wikipedia (*Woodhaven Boulevard station*): "**Located in Elmhurst, Queens**"; Forgotten NY, own voice: "We are technically just in **Elmhurst**, albeit right on its border with Rego Park" | **Elmhurst.** Effectively settled against Rego Park. |
| C8 | **Queens Center Mall** | 90-15 Queens Blvd area, Queens Blvd & Woodhaven Blvd | Forgotten NY covers it inside its Rego Park article; local usage often says "the Rego Park mall" | Wikipedia (*Rego Park*), explicitly: "Across the Long Island Expressway, **in nearby Elmhurst**, is the Queens Center Mall" | **Elmhurst.** Settled against Rego Park by Rego Park's own article. |
| C9 | **LeFrak City** | Junction Blvd / 57th Ave / 99th St / LIE | Forgotten NY: "The Lefrak Organization has definitely made its presence known **in Rego Park** and neighboring Corona" | Wikipedia (*LeFrak City*): "in the southernmost region of **Corona** and the easternmost part of **Elmhurst**"; "The development is part of Queens **Community Board 4**" | **CB4 / Corona–Elmhurst.** Settled against Rego Park. |
| C10 | **Real Good Playground** | Horace Harding Expwy Svc Rd S, 62nd Ave, 99th–102nd Sts | NYC Parks history sign: "The neighborhood Rego Park, where this property is located" | NYC Parks' own Open Data record lists **two ZIPs, "11374, 11375"** — 11375 is Forest Hills | CB6; Parks' text says Rego Park. Minor, but the dual ZIP is a real artifact. |
| C11 | **The Painter's Playground** | Alderton St bet. Dieterle & Elwell Crescents | Open Data ZIP **11374**, CB6 | No competing assignment found, but NYC Parks has **no history text at all** for it (F68), and its "Other Parks Nearby" are Forest Hills and Middle Village parks | Needs geocoding. |
| C12 | **112th Precinct stationhouse** | 68-40 Austin St | Wikipedia (*Rego Park*) presents it as the precinct that "patrol[s]" Rego Park | 68-40 Austin Street is a Forest Hills address; the precinct covers **both** neighborhoods | Forest Hills (address). Not really contested; listed to prevent a mis-assignment. |
| C13 | **Engine Co. 305 / Ladder Co. 151 firehouse** (LPC landmark) | 111-02 Queens Blvd | none | Wikipedia: "in **Forest Hills**"; DCP NTA **QN0602 Forest Hills** | **Forest Hills.** |
| C14 | **Whitepot Junction / "White Pot Junction"** rail junction | LIRR Main Line × Rockaway Beach Branch ROW | QueensLink: "all the land at **White Pot Junction in Rego Park**" | Wikipedia (*Rego Park station (LIRR)*) says the surrounding neighborhood was known at the time as "**Forest Hills West**" | Needs geocoding. Note also the two spellings. |
| C15 | **Joe Abbracciamento Restaurant / Drake Theater** | Woodhaven Blvd | Forgotten NY covers both inside its Rego Park article | Woodhaven Blvd is the Rego Park/Middle Village line; no source states a neighborhood outright | Undetermined. |

**Adjacency note for the arbiter:** the two adjacencies behave very differently. Rego Park ↔ Elmhurst
(C7, C8, C9) is **sharply drawn** — the Long Island Expressway and Junction Boulevard are hard edges, and
sources on both sides agree Elmhurst owns Queens Center, Slattery Plaza and LeFrak City. Rego Park ↔
Forest Hills (C1, C2, C3, C5, C6, C11, C14) is **genuinely soft** — there is no physical barrier, the two
share Community District 6, one police precinct, one health profile, one preservation organization
(F214–F215), and one continuous commercial strip along Queens Boulevard. DCP's 2020 NTA line (F5) is the
only crisp authority, and even it puts the Remsen Cemetery in Rego Park against the drift of the prose
sources.

---

## 11. Richest veins (finder's read on where the material actually is)

1. **NYC Parks' Historical Signs Project.** Four of the six Rego Park parks carry full, agency-authored
   history essays (Lost Battalion Hall, Real Good Playground, Horace Harding Playground, Fleetwood
   Triangle). They are primary, quotable, internally cross-referencing, and they cover the neighborhood's
   founding story better than any secondary source. This is the single best vein.
2. **The Remsen Cemetery LPC designation report (LP-1177, 1981).** A complete colonial-through-Revolution
   narrative with named graves, dates 1790–1819, and the two-doughboy WWI memorial — all in a primary
   city document. Rego Park's only individual landmark under DCP's own boundary.
3. **The naming story, and the fact that it is unsettled.** 1920 vs. 1923 vs. 1925; Schloh and Hausmann;
   "REal GOod"; the Chinese truck farms that preceded it (owned or leased — sources disagree); the
   alphabetized Crescents A–F that the LIRR prevented from closing into circles.
4. **The lost transit layer.** The abandoned Rego Park LIRR station (opened May 23, 1928, closed June 8,
   1962, two parades on May 26, 1928), the two vanished Matawok stations, "Forest Hills West," Whitepot
   Junction, and the unbuilt Rockaway spur bellmouths still sitting east of the 63rd Drive subway station.
   Then the live fight over the same right-of-way, QueensWay vs. QueensLink.
5. **Bukharian Rego Park.** The DOHMH data alone shows thirteen "Jewish/Kosher" establishments plus Uzbek,
   Russian and Uyghur places in a single ZIP; the NEA's 1992 National Heritage Fellowship to Fatima
   Kuinova is filed under "Rego Park, New York"; "Rego Parkistan" and "Bukharian Broadway" are documented
   nicknames. **Constraint: almost every individual restaurant is DOHMH-only.**
6. **The Art Deco layer and what happened to it.** Rego Park Jewish Center (NRHP 09000864, A. Raymond Katz)
   still standing; the Trylon Theater (architect Joseph Unger, opened 1939, named for the World's Fair
   Trylon) stripped in 2005 with its landmark application denied. A preservation story with a survivor and
   a casualty on the same boulevard.
7. **Fire as a shaping force.** The 1959/1960 Tavern fire, the Feb 20, 1972 "Rego Park Inferno" that took
   the library and a whole storefront row, the bookmobile years, the library rebuilt on a Shell station,
   the Shalimar Diner built on the old library's lot and demolished in 2019.

---

## 12. Gaps, dead ends, and things a verifier should NOT assume I checked

- **NRHP nomination for Rego Park Jewish Center (ref. 09000864) is unobtainable via NPGallery** — the
  server returns "The PDF file for this National Register record has not yet been digitized." NYS CRIS
  requires an NY.gov login. Everything in F95/F96 is therefore secondary.
- **MTA is unreachable** (`new.mta.info` → HTTP 403). No first-party confirmation of current subway
  services, bus routes, or accessibility status. The Queens bus network redesign postdates several sources.
- **No first-party source for any Rego Park church.** raparish.org, olangelus.org, oslcregopark.org all
  returned empty bodies; Diocese of Brooklyn parish pages returned navigation only.
- **Vornado and Alexander's marketing pages are unreachable** (404 / Access Denied). The SEC 10-K is the
  only first-party retail source, and it deliberately does not name neighborhoods.
- **No press archive access.** No NYT, Queens Chronicle, QNS, Eater, or Daily News search was possible.
  Consequently: **Ben's Best Kosher Delicatessen, Knish Nosh, Joe Abbracciamento, Cheburechnaya,
  Registan, Versailles Palace and Uyghur Lagman House have no narrative sourcing whatsoever** beyond
  DOHMH rows (and knishnosh.com now resolves to a domain-for-sale parking page, which suggests but does
  not prove closure: https://www.knishnosh.com/).
- **Current status unchecked** for: Horace Harding Playground's animal sculptures, Fleetwood Triangle's
  compass and butterfly art, Lost Battalion Hall's two murals, the Rego Park Green Alliance mural under
  the LIRR overpass, and Jay Dee Bakery's neon sign. All are 1990s–2000s sightings.
- **Lost Battalion Hall is closed for construction** and **the Rego Park library is closed until Winter
  2029–2030.** Both need re-checking immediately before any page ships.
- **Geocoding not performed.** Contested entries C1, C2, C4, C11 and C14 can most likely be settled by
  running their addresses through the DCP NTA boundary layer. I did not do that — resolving it is the
  verifier's job, not the finder's.
