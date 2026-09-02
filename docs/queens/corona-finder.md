# Corona, Queens — FINDER candidate file

**Role:** Finder only. Nothing below is verified, confirmed, or adjudicated. Every entry is a
CANDIDATE awaiting the verifier. Where I put text between quotation marks, it is copied
character-for-character from the cited page. Where I am summarizing in my own words, the line is
marked `[PARAPHRASE]`. Where I am quoting a quotation that appeared *inside* another source (e.g. a
Met Museum sentence reproduced in a Wikipedia footnote), it is marked `[QUOTE-VIA]` and the
verifier must go to the original.

**Research constraint (disclose to verifier):** this session's WebSearch budget was exhausted before
the first Corona query ran (200/200 already used on arrival). Everything below was gathered by
direct retrieval of URLs I could name in advance — WebFetch, plus `urllib` for hosts that block or
mangle WebFetch (nycgovparks.org, s-media.nyc.gov PDFs, Socrata, ArcGIS). Source discovery was
therefore **directed, not exhaustive**. Absence of a topic below is not evidence of absence.

**Source-quality note:** LPC designation reports LP-1292, LP-1555, LP-2035, LP-2283 and LP-2657, the
LPC ArcGIS individual-landmark layer, NYC Parks Historical Signs Project pages, DCP's 2020 NTA
table, and DOHMH restaurant inspections are primary/institutional. Wikipedia is used where flagged
and should be treated by the verifier as an aggregator requiring independent confirmation. Business
websites are self-descriptions, not third-party verification.

**Counts:** **171 candidate facts** (F1–F171, numbered contiguously) across **58 candidate places**
(P1–P58).
**Contested neighborhood assignments:** **21 rows** in §L.

---

## §0 — THE OWNERSHIP FIREWALL (read before writing anything)

`Ethos.Seeds.CitiFieldPlaces` already owns eight places inside Flushing Meadows Corona Park:
Citi Field, the Unisphere, the Queens Museum, the New York Hall of Science, the Queens Zoo, the
USTA Billie Jean King National Tennis Center, the New York State Pavilion, and the Queens Theatre.
**None of them may be re-created in the Corona seed file under any slug, and their history must not
be narrated here.** The route is a link to `/g/citi-field-guide`.

Sources below repeatedly mention these institutions because Corona's own institutional sources
mention them. I have recorded those mentions **only** where they establish a fact about *Corona*
(e.g. that the park is named partly for Corona). I flag every place I found that sits inside the
park so the writer can see the boundary clearly — see §I. Corona will read thinner than its fame
suggests. That is the firewall working, not a research gap.

Two second-order traps I found:

**F1.** The Neustadt Collection of Tiffany Glass operates "The Neustadt Gallery" and locates it at
"The Neustadt Gallery at the Queens Museum / New York City Building / Flushing Meadows Corona Park /
Queens, NY 11368". Its own office/archive address is "5-26 46th Avenue / Long Island City, NY 11101."
Source: https://neustadtcollection.org/
→ **FLAG:** a gallery *inside* the Queens Museum. The Queens Museum is owned by CitiFieldPlaces.
Recommend the verifier rule this out as a Corona place. It is also arguably a Long Island City
place. Recorded, not resolved.

**F2.** The Queens Night Market's own site: "We're located behind the New York Hall of Science in
Flushing Meadow Corona Park." and "Take the 7 train to the 111th Street station. Walk south 4
blocks until you pass under an overpass. You will see the Night Market behind the New York Hall of
Science on the Left." Source: https://www.queensnightmarket.com/
→ **FLAG:** an event held on the grounds of an owned institution. See §I.

---

## §A — Boundaries and administrative geography (the contested core of this wave)

**F3.** NYC DCP's 2020 Neighborhood Tabulation Areas split Corona into **two NTAs in two different
Community District areas.** Verbatim field values from the DCP NTA table (Socrata `9nt8-h7nd`):

| nta2020 | ntaname | ntaabbrev | cdta2020 | cdtaname |
|---|---|---|---|---|
| `QN0402` | `Corona` | `Crna` | `QN04` | `QN04 Elmhurst-Corona (CD 4 Approximation)` |
| `QN0303` | `North Corona` | `NrthCrna` | `QN03` | `QN03 Jackson Heights-East Elmhurst (CD 3 Approximation)` |
| `QN0401` | `Elmhurst` | `Elmhrst` | `QN04` | `QN04 Elmhurst-Corona (CD 4 Approximation)` |
| `QN0601` | `Rego Park` | `RegoPk` | `QN06` | `QN06 Forest Hills-Rego Park (CD 6 Approximation)` |
| `QN0602` | `Forest Hills` | `FrstHls` | `QN06` | `QN06 Forest Hills-Rego Park (CD 6 Approximation)` |
| `QN0301` | `Jackson Heights` | `JcksnHts` | `QN03` | `QN03 Jackson Heights-East Elmhurst (CD 3 Approximation)` |
| `QN0302` | `East Elmhurst` | `EstElmhrst` | `QN03` | `QN03 Jackson Heights-East Elmhurst (CD 3 Approximation)` |

Source: https://data.cityofnewyork.us/resource/9nt8-h7nd.json (queried
`$where=cdta2020 in('QN04','QN06','QN03')`)
→ **This is the single most useful boundary fact in the wave.** The City does not treat "Corona" as
one unit, and it pairs Corona administratively with **Elmhurst**, not with Forest Hills or Rego
Park. Recorded, not resolved.

**F4.** Wikipedia's boundary sentence, quoted exactly: "It borders Flushing and Flushing
Meadows–Corona Park to the east, Jackson Heights and Elmhurst to the west, Forest Hills and Rego
Park to the south, and East Elmhurst to the north."
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`
→ Note this names **all four wave-3 neighborhoods** as Corona's neighbors.

**F5.** Wikipedia, quoted exactly: "Corona's main thoroughfares include Corona Avenue, Roosevelt
Avenue, Northern Boulevard, Junction Boulevard, and 108th Street."
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`

**F6.** Wikipedia: "Corona is mostly part of Queens Community District 4." and "The section north of
Roosevelt Avenue, known a[s]…" (sentence truncated in my retrieval; the article elsewhere describes
North Corona as Queens Community District 3).
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`
→ **GAP:** the verifier should re-read that sentence in full. My extraction cut it.

**F7.** `[PARAPHRASE]` Roosevelt Avenue is the dividing line Wikipedia uses: Corona south of
Roosevelt Ave = Queens CD 4; North Corona north of Roosevelt Ave = Queens CD 3.
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`
→ Corroborated indirectly by NYC Parks park records, which assign Community Board 4 to
Corona Plaza/Q172, William F Moore Park/Q029, Corona Golf Playground/Q450, Park of the Americas/Q026,
Simeone Park/Q474 and Josephine Caminiti Playground/Q046, but Community Board 3 to Louis Armstrong
Playground/Q415 and Hinton Park/Q410 (all north of Roosevelt Ave). Sources: the individual
nycgovparks.org park pages cited throughout §H.

**F8.** ZIP code: Wikipedia gives "11368" as Corona's ZIP, and notes 11369 in the COVID-19 context.
NYC Parks records for Corona Plaza, Moore Park, Corona Golf Playground, Park of the Americas,
Simeone Park, Caminiti Playground, Louis Armstrong Playground and Hinton Park **all** state
"Zip Code: 11368."
Sources: https://en.wikipedia.org/wiki/Corona,_Queens ; nycgovparks.org park pages.

**F9.** Wikipedia: "Corona is covered by ZIP Code 11368." and "The United States Post Office operates
two post offices in Corona: the Corona A Station at 103-28 Roosevelt Avenue and the Elmhurst
Station at 59-01 Junction Boulevard."
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`
→ **FLAG:** a post office serving Corona is *named* "Elmhurst Station" and sits on Junction
Boulevard, the contested Corona/Elmhurst street. Recorded, not resolved. (P54)

**F10.** Wikipedia coordinates for the neighborhood centroid: 40°44′06″N 73°51′54″W /
40.735°N 73.865°W. Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`

**F11.** Wikipedia: "Corona is patrolled by the 110th and 115th Precincts of the New York City
Police Department" — 110th at 94-41 43rd Avenue; 115th at 92-15 Northern Boulevard.
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`
→ Both precinct addresses are on the Corona/Elmhurst/Jackson Heights side. Flag in §L.

**F12.** Wikipedia lists two FDNY stations serving Corona: "Engine Co. 324/Satellite 4/Division 14"
at 108-01 Horace Harding Expressway, and "Engine Co. 289/Ladder Co. 138" at 97-28 43rd Avenue.
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`
→ 108-01 Horace Harding Expressway is on the LIE service road — the exact edge this wave contests.
Flag in §L. (P55)

**F13.** LPC (2023) locates the neighborhood: "The neighborhood of Corona is located in north-central
Queens, just west of Flushing Meadows Park."
Source: LP-2657, http://s-media.nyc.gov/agencies/lpc/lp/2657.pdf

**F14.** LPC (2008) uses nearly the same sentence with a different hyphenation: "The neighborhood of
Corona is located in north-central Queens, just west of Flushing-Meadows Park."
Source: LP-2283, http://s-media.nyc.gov/agencies/lpc/lp/2283.pdf

**F15.** LPC (2008): the Congregation Tifereth Israel site "is less than one block from" Flushing
Meadows–Corona Park. Exact wording: "the park—which is New York City's third largest, was home to
the 1964 World's Fair and hosts the annual U.S. Open tennis tournament—is less than one block from
the Congregation Tifereth Israel."
Source: LP-2283.

---

## §B — Origins, names, and 19th-century history

**F16.** LPC (2023): "Originally called 'Mespat' by indigenous Munsee-speaking people, and
'Middleburgh' by subsequent English settlers, it became part of Newtown in 1683."
Source: LP-2657.

**F17.** NYC Parks (William F. Moore Park historical sign): "The Munsee used the forests, marshes,
and meadowland around Flushing Creek as hunting grounds before Europeans arrived."
Source: https://www.nycgovparks.org/parks/william-f-moore-park/history

**F18.** NYC Parks (Flushing Meadows Corona Park historical sign): "This area was once inhabited by
the Matinecocks before the arrival of Dutch settlers in 1640."
Source: https://www.nycgovparks.org/parks/flushing-meadows-corona-park/history
→ **CONFLICT with F16/F17:** Munsee vs Matinecock naming for the same watershed. Two NYC agencies /
two NYC Parks signs. Recorded, not resolved. (See §M.)

**F19.** LPC (2008): "In the years during the Revolutionary War until approximately the middle of the
nineteenth century, the area now known as Corona remained sparsely populated with the majority of
its residents being farmers of European ancestry. These early settlers kept Africans as slaves, and
it was the hands of these laborers that largely shaped the agrarian landscape of the greater Corona
area for nearly two centuries."
Source: LP-2283.

**F20.** LPC (2023) restates it more carefully: "Many of these early settlers and estate-owners
enslaved African people, whose labor shaped the agrarian landscape of the greater Corona area."
Source: LP-2657.

**F21.** LPC (2023): "In 1827, New York State abolished slavery after a period of gradual
emancipation, but complete abolition came much later in 1841 when non-residents visiting the state
were no longer exempt and could not bring enslaved individuals with them."
Source: LP-2657.

**F22.** LPC (2023): "By 1830, the Black population of Newtown, which included a number of villages,
farms, and estates in West Flushing (renamed 'Corona' in 1872) had decreased to 206 from 585 in
1790." And: "In 1890 African Americans in Queens numbered 3,582. According to historian Gilbert
Osofsky, by 1900, however, this figure had dropped to 2,611, rising again to 3,198 in 1910."
Source: LP-2657.

**F23.** LPC (2023): "Newtown became part of Queens County in 1853, and it was not until 1872 that
the name Corona (meaning 'crown' of Queens County) came into common use for the village."
Source: LP-2657.

**F24.** LPC (2008) gives a different year for the same claim: "Residents from this period would have
said they lived in Newtown Long Island; it was not until 1873 that the name Corona (meaning 'crown'
of Queens County) came into common use."
Source: LP-2283.
→ **CONFLICT: 1872 (LP-2657) vs 1873 (LP-2283).** Same agency, two reports. Recorded, not resolved.

**F25.** NYC Parks (Corona Golf Playground sign): "The tiny village was called West Flushing in
remembrance of the Flushing Remonstrance, a landmark document drafted by Quakers 200 years earlier
that called for religious freedom in America. The town grew quickly in population and in
self-importance, and in 1872, the village decided upon a name it could claim as its own. Corona, a
Latin term for 'crown,' was chosen because the town's settlers considered their home the corona of
all Long Island municipalities."
Source: https://www.nycgovparks.org/parks/corona-golf-playground/history

**F26.** NYC Parks (Corona Plaza sign) gives a *fourth* framing: "In 1867, music publisher and land
developer Benjamin W. Hitchcock extended his influence into West Flushing by buying 1200 parcels of
land. He also saw to the opening of a Flushing Rail Road station at National Avenue. The town grew
in population and prominence and by 1872, its residents wanted a name change that would distinguish
it from Flushing, and express pride in their flourishing community. West Flushing became 'Corona,' a
Latin term for 'crown,' designating it as the 'crown' of all towns on Long Island."
Source: https://www.nycgovparks.org/parks/corona-plaza/history

**F27.** NYC Parks (FMCP sign) gives a *fifth*, Italian-immigrant framing: "To the west of the park
is Corona. Originally called West Flushing, it became known as Corona in the late 1800s. This name
is thought to have come from Italian immigrants who moved into residences developed by the Crown
Building Company."
Source: https://www.nycgovparks.org/parks/flushing-meadows-corona-park/history

**F28.** Wikipedia lists three competing naming theories: Benjamin W. Hitchcock renaming it in 1872;
Thomas Waite Howard (first postmaster 1872) petitioning to change the post office name in 1870,
"suggesting it meant 'crown of Queens County'"; and the Crown Building Company's crown emblem, with
Italian and Spanish immigrants adopting "corona."
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]` `[PARAPHRASE of the list; the
quoted fragment is exact]`
→ **The Corona name origin is genuinely unsettled across five institutional accounts. The verifier
should NOT let the writer assert one.** See §M.

**F29.** LPC (1987), on the earliest speculation: "One of the earliest investors was Benjamin W.
Hitchcock who owned the site of the Sanford house and the surrounding area, which he called the
Village of West Flushing in 1854."
Source: LP-1292, http://s-media.nyc.gov/agencies/lpc/lp/1292.pdf
→ **CONFLICT with F26** (Parks says Hitchcock arrived in 1867 and bought 1200 parcels).

**F30.** Wikipedia: Corona was established in 1854 as "a late-19th-century residential development in
the northeastern corner of the old Town of Newtown." And: "Real estate speculators from New York
started the community in 1854, the same year that the New York and Flushing Railroad began service
to the area largely to serve a newly opened race course."
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`

**F31.** NYC Parks (Corona Golf Playground sign): "The history of Corona is intimately tied to the
arrival of the Long Island Rail Road in this area in 1854. When speculators from New York City began
developing the settlement during that same year, they planned the streets in accordance with the
railroad route."
Source: https://www.nycgovparks.org/parks/corona-golf-playground/history

**F32.** LPC (2023 and 2008, near-identical wording): "The first wave of growth in the rural township
came in 1853 with the construction of the Flushing Railroad, which would bring it within a 30-minute
commute of Manhattan."
Sources: LP-2657 and LP-2283.
→ **CONFLICT: 1853 (LPC, twice) vs 1854 (NYC Parks, Wikipedia).** Recorded, not resolved.

**F33.** LPC (2023): "The next wave of development came with the arrival of fixed-rail horsecar lines
to the Brooklyn and Manhattan ferries in 1876 and trolleys in the 1890s, which further increased
Corona's appeal as a viable commuter suburb for middle- and upper-class professionals."
Source: LP-2657 (LP-2283 carries the same sentence).

**F34.** LPC (2008): "Mid to late nineteenth-century Corona was principally a neighborhood of modest
single-family homes, boasting a firehouse, several churches and a number of small businesses."
Source: LP-2283.

**F35.** NYC Parks: "Its population reached 2,500 by 1898 and 6,200 by 1910, and the introduction of
rapid transit in 1917 spurred further growth."
Source: https://www.nycgovparks.org/parks/corona-golf-playground/history
(Corona Plaza sign repeats: "Its population had reached 2,500 by 1898 and 6,200 by 1910.")

**F36.** LPC (2023): "In 1898 Corona, along with the rest of the borough of Queens, was annexed to
the newly created City of New York."
Source: LP-2657.

**F37.** LPC (1987), on the 1898 consolidation vote: "At the time of incorporation, only the three
western townships of the county voted to become part of New York City: Jamaica, Flushing, and
Newtown."
Source: LP-1292.

**F38.** LPC (2023): "A major transformation in Corona's urban development began with the 1917
opening of the elevated train service (today's Flushing Line of the IRT Division, or the number 7
line). The construction of the elevated train along Roosevelt Avenue sparked commercial and
residential development, and many of the wood-frame houses of the previous century were replaced
with multiple-family dwellings and apartment buildings."
Source: LP-2657.

### The racetrack (P2)

**F39.** NYC Parks (Corona Plaza sign): "The name of this street and plaza comes from the National
Race Course, a horse-racing track that operated here from 1854-1866." And: "In 1856, the National
Race Course was renamed Fashion Race Track, after a champion horse. The racetrack became a major
attraction, featuring the new sport of harness-racing. With the construction of lavish new tracks in
Fordham and Sheepshead Bay, however, and with a resurgence of thoroughbred racing, the track closed
down in 1866."
Source: https://www.nycgovparks.org/parks/corona-plaza/history

**F40.** LPC (2023 and 2008): "The area had likely already been made familiar to them by the popular
National Racetrack, which flourished in Corona in the 1850s and 60s and attracted amusement seekers
from other boroughs."
Sources: LP-2657, LP-2283.

**F41.** Wikipedia (Fashion Course article): "Fashion Course, formerly known as the National Race
Course, was a harness racing track located in Corona, Queens, New York City." "First known as the
National Race Course in 1854, the course was renamed in 1856 after the renowned Thoroughbred racemare
Fashion." "Situated in West Flushing (now Corona, Queens), the track was laid out between the Long
Island Rail Road tracks and Jackson Avenue (now Northern Boulevard)." "The site was about a mile and
a half from where the baseball stadium Citi Field now stands."
Source: https://en.wikipedia.org/wiki/Fashion_Course `[AGGREGATOR]`
→ Coordinates given: 40°45′12″N 73°51′52″W.
→ **NOTE for the writer:** the Citi Field reference is a *distance*, not a place. Do not use it as a
hook to narrate Citi Field. Link to /g/citi-field-guide instead.

**F42.** Wikipedia: "The one-mile oval was known as America's only racecourse measured exactly to
5,280 feet. It was enclosed by a costly brick wall, wide at the base, narrowing to a single brick at
the top, and capped with sharp shards of glass set in cement to deter climbers."
Source: https://en.wikipedia.org/wiki/Fashion_Course `[AGGREGATOR]`

**F43.** Wikipedia: "On July 20, 1858, the Fashion Course hosted its first baseball game of a
best-of-three series between all-star teams from the City of New York and Brooklyn. The Fashion
Course series marked the first all-star game, first enclosed park match, and first paid entry in the
history of professional sports." "Between 4,000 and 10,000 spectators attended the July 20 series
opener." "The second game of the historic all-star series at the Fashion Course took place on August
17, 1858. The third and final game, played September 10, 1858, introduced paid entry, using the
enclosed grounds and gated access to charge admission."
Source: https://en.wikipedia.org/wiki/Fashion_Course `[AGGREGATOR]`
→ **CONFLICT:** the Corona article says the first *admission-charging* games took place in 1858
generally; the Fashion Course article says paid entry began at the **third** game, Sept 10, 1858.
Recorded, not resolved.
→ Underlying citations named by Wikipedia and worth chasing: John Thorn, "The Fashion Race Course
Ball. Baseball in 25 Objects," mlblogs.com, May 9, 2022; John G. Zinn, "Summer 1858: The
Brooklyn-New York baseball rivalry begins," sabr.org, Oct 20, 2014. I could not fetch either (SABR
returned 404 on the URL I guessed; no search budget to find the right one). `[GAP]`

**F44.** Wikipedia (Corona article): "It was at the Fashion Course in 1858 that the first games of
baseball to charge admission took place. The games, which took place between the All Stars of
Brooklyn and the All Stars of New York, are commonly believed to be the first all-star baseball
games and in essence the birthplace of professional baseball. A trophy baseball from this tournament
sold in 2005 for nearly $500,000."
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`

**F45.** Wikipedia: "The Newtown and Flushing Railroad, laid out by Oliver Charlick in 1871, was
routed through the race track, marking the end of the Fashion Course."
Source: https://en.wikipedia.org/wiki/Fashion_Course `[AGGREGATOR]`
→ **CONFLICT with F39** (Parks: closed 1866).

**F46.** NYC Parks: "Corona continued to thrive, and the defunct racetrack site provided space for
new housing and commercial development in the heart of the neighborhood."
Source: https://www.nycgovparks.org/parks/corona-plaza/history

### The ash dumps and *The Great Gatsby* (P3)

**F47.** NYC Parks (Corona Golf Playground sign): "The land that is now Corona Golf Playground was
previously a strip of wasteland, known as the Corona Ash Dumps. In his classic novel The Great
Gatsby, F. Scott Fitzgerald described the area as 'a valley of ashes - a fantastic farm where ashes
grow like wheat into ridges and hills and grotesque gardens.'"
Source: https://www.nycgovparks.org/parks/corona-golf-playground/history

**F48.** NYC Parks (FMCP sign): "During 19th century industrialization at the turn of the century,
the wetlands and creek flowing from Flushing Bay became an ash dump, described in 1925 as a 'valley
of ashes' in F. Scott Fitzgerald's Great Gatsby."
Source: https://www.nycgovparks.org/parks/flushing-meadows-corona-park/history

**F49.** LPC (2008): the World's Fair site was "the former dumping ground of Flushing Creek."
LPC (2023) instead says "the former Flushing Creek."
Sources: LP-2283, LP-2657.

### Kettle ponds (P4)

**F50.** NYC Parks (Moore Park sign): "John H. Smith established Shady Lake Farm (also called Yankee
Smith's Farm because of northern New York origins) in 1837 around a kettle pond formed by retreating
glaciers a block south of this property. Smith harvested and sold ice from the pond in the winter
and opened it to the public for picnicking in the summer."
Source: https://www.nycgovparks.org/parks/william-f-moore-park/history

**F51.** Wikipedia names three vanished Corona kettle ponds: Linden Pond (Park of the Americas site;
removed 1947); Shady Lake (53rd Ave & Corona Ave; drained in the 20th century — "Lemon Ice King and
William F. Moore Park now occupy the site"); Backus Lake (98th Street & 31st Avenue; drained 1917).
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]` `[PARAPHRASE except the quoted
fragment]`
→ **GAP:** Backus Lake at 98th St & 31st Ave is well north of Roosevelt Ave and may be East
Elmhurst. Verifier should check.

---

## §C — Industry: Tiffany, china, portable houses

Candidate places in this section: **P5** Tiffany's Corona glass factory / Tiffany Studios site
(96-18 43rd Avenue, per F54); **P6** the American Patent Portable House Manufacturing Company works;
**P7** the French China company works. P6 and P7 are named by LPC in F52/F53 with no addresses and no
further detail — they are recorded as leads, not as writable places.

**F52.** LPC (2023): "Several different industries came to Corona in the following decades, including
a French China company, a tile works, a straw works, and the American Patent Portable House
Manufacturing Company. Tiffany Glass Company opened a major factory in Corona in 1893."
Source: LP-2657. (LP-2283 carries almost identical wording: "An assortment of industries came to
Corona in the following decades, including a French China company, a tile works, a straw works and
the American Patent Portable House Manufacturing Company. Tiffany Glass Company opened a major
factory in Corona in 1893.")

**F53.** NYC Parks: "During the latter half of the 19th century, Corona became home to many factories
producing goods as varied as portable houses, fine china, and Tiffany glass."
Source: https://www.nycgovparks.org/parks/corona-plaza/history

**F54.** Wikipedia (Tiffany glass article): "Tiffany's favrile glass was manufactured at the Tiffany
factory located at 96–18 43rd Avenue in Corona, Queens from 1901 to 1932." And: "The Louis Tiffany
School, New York City P.S. (public school) 110Q, was built on the old site."
Source: https://en.wikipedia.org/wiki/Tiffany_Studios (redirects to /wiki/Tiffany_glass)
`[AGGREGATOR]`
→ **CONFLICT: LPC says a major Tiffany factory opened in Corona in 1893; Wikipedia's Tiffany-glass
article dates the 96-18 43rd Avenue factory to 1901–1932.** These may be two different facilities
(glasshouse vs. Studios plant). Recorded, not resolved.

**F55.** `[QUOTE-VIA]` The Corona Wikipedia article's footnote reproduces this sentence and
attributes it to the Metropolitan Museum of Art's Heilbrunn Timeline essay "Louis Comfort Tiffany
(1848–1933)": "By late 1892 or early 1893, Tiffany built a glasshouse in Corona, Queens, New York,
and, with Arthur Nash, a skilled glassworker from…" (my retrieval truncates there).
Cited source URL: https://www.metmuseum.org/toah/hd/tiff/hd_tiff.htm
→ I attempted to fetch metmuseum.org directly and received **HTTP 429**. The verifier must confirm
this sentence against the Met page itself. `[GAP]`

**F56.** Wikipedia (Corona article body list): "Louis Comfort Tiffany (1848–1933) had his glass
factory and studio in Corona from 1893."
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`

**F57.** The Neustadt Collection describes itself: "The Neustadt is a premier collection of Louis C.
Tiffany's celebrated lamps, windows, metalwork, and rare archival materials. The collection also
boasts a unique Tiffany Glass Archive that includes nearly half a million pieces of original Tiffany
flat glass and glass jewels."
Source: https://neustadtcollection.org/
→ Their site has a "Tiffany in Queens" nav item; the URL I guessed
(`/learn/tiffany-in-queens`) returned 404. Verifier should find the live path — it is likely the
best primary account of the Corona factory. `[GAP]`

---

## §D — Transit (P8–P14)

**F58.** Wikipedia (Corona article): the IRT Flushing Line (7 and <7>) serves four stations relevant
to Corona: Mets–Willets Point, 111th Street, 103rd Street–Corona Plaza, Junction Boulevard.
Bus routes listed: Q14, Q23, Q58, Q63, Q66, Q72, Q88, Q90, Q98.
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]` `[PARAPHRASE]`

**F59.** Wikipedia (Corona article): "Long Island Rail Road's Corona station on Port Washington Branch
closed 1964. Nearest current LIRR station: Mets–Willets Point."
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]` `[PARAPHRASE]`
→ **GAP:** a closed LIRR Corona station is a strong candidate place; I have only this one aggregator
line. Verifier should seek a primary source. (P8)

### P9 — 103rd Street–Corona Plaza station

**F60.** Wikipedia infobox, verbatim field values: Address "103rd Street & Roosevelt Avenue"; Locale
"Corona"; Division "A (IRT)"; Line "IRT Flushing Line"; Services "7 (all times)"; Transit "NYCT Bus:
Q14"; Structure "Elevated"; Platforms "2 side platforms"; Tracks "3"; Opened "April 21, 1917";
Accessible "No; planned"; Former/other names "Alburtis Avenue", "104th Street"; Traffic 2024
"6,368,620", Rank "34 out of 423".
Source: https://en.wikipedia.org/wiki/103rd_Street%E2%80%93Corona_Plaza_station `[AGGREGATOR]`

**F61.** Wikipedia: "The 103rd Street–Corona Plaza station is a local station on the IRT Flushing Line
of the New York City Subway, located at the intersection of 103rd Street and Roosevelt Avenue. It is
served by the 7 train at all times. The <7> train skips this station when it operates."
Source: same. `[AGGREGATOR]`

**F62.** Wikipedia on the line's origins: "The 1913 Dual Contracts called for the Interborough Rapid
Transit Company (IRT) and Brooklyn Rapid Transit Company (BRT; later Brooklyn–Manhattan Transit
Corporation, or BMT) to build new lines in Brooklyn, Queens, and the Bronx." And: "When the majority
of the line was built in the early 1910s, most of the route went through undeveloped land, and
Roosevelt Avenue had not been constructed."
Source: same. `[AGGREGATOR]`

### P10 — 111th Street station (IRT Flushing Line)

**F63.** Wikipedia infobox, verbatim: Address "111th Street & Roosevelt Avenue"; Locale "Corona";
Services "7 (all times)"; Transit "MTA Bus: Q23 (at 108th Street)"; Structure "Elevated"; Platforms
"2 side platforms"; Tracks "5 (2 local in passenger service at platform level; 1 express track
above)"; Opened "October 13, 1925"; Traffic 2024 "2,137,552", Rank "157 out of 423".
Source: https://en.wikipedia.org/wiki/111th_Street_station_(IRT_Flushing_Line) `[AGGREGATOR]`
→ This is the station the Queens Night Market and the New York Hall of Science share.

### P11 — Junction Boulevard station

**F64.** Wikipedia infobox locale field, verbatim source markup:
`"locale":{"wt":"[[Corona, Queens|Corona]], [[Elmhurst, Queens|Elmhurst]], [[Jackson Heights, Queens|Jackson Heights]]"`
Source: https://en.wikipedia.org/wiki/Junction_Boulevard_station `[AGGREGATOR]`
→ **A single station assigned to THREE neighborhoods, two of them in this wave.** Row in §L.

### P12 — Mets–Willets Point

**F65.** Wikipedia's disambiguation page: "Mets–Willets Point is the name of multiple train stations
in the Flushing Meadows neighborhood of Queens, named for proximity to Willets Point, and to Citi
Field, the home stadium of the New York Mets." It disambiguates to Mets–Willets Point station (IRT
Flushing Line), "formerly Willets Point–Shea Stadium"; Mets–Willets Point station (LIRR), "formerly
Shea Stadium"; and "a proposed stop on the proposed AirTrain LaGuardia."
Source: https://en.wikipedia.org/wiki/Mets-Willets_Point_station `[AGGREGATOR]`
→ **FLAG:** Wikipedia assigns this to "Flushing Meadows," **not** Corona. It is also the station for
Citi Field, an owned place. Strong candidate for exclusion. Row in §L.

### P13 — Corona Yard

**F66.** `[GAP]` The Wikipedia URL /wiki/Corona_Yard redirects to "List of New York City Subway
yards," where Corona Yard is listed as one of the A Division maintenance yards ("The A Division's
rail yards consist of the 239th Street, 240th Street, Corona, East 180th Street, Jerome, Livonia, and
Westchester maintenance yards"). My retrieval was truncated before the Corona Yard subsection.
Source: https://en.wikipedia.org/wiki/Corona_Yard `[AGGREGATOR]`
→ The 111th Street station track-map markup names "to [[Corona Yard|Corona Yd]]", confirming the yard
connects at 111th Street. Verifier should get the yard's actual address and neighborhood — it may sit
in Corona or in Willets Point/Flushing Meadows.

### P14 — Roosevelt Avenue elevated

**F67.** Combining F38 and F62: the el along Roosevelt Avenue is the structure that made modern
Corona. LPC's exact wording (F38) is the best available quote. No separate primary source retrieved
for the viaduct itself. `[GAP]`

---

## §E — Landmarked and listed buildings

Source for the whole table: the NYC Landmarks Preservation Commission's **Individual Landmarks**
ArcGIS feature layer, queried
`BORO='Queens' AND (NEIGHBORHO LIKE '%Corona%' OR '%Elmhurst%' OR '%Forest Hills%' OR '%Rego%')`:
https://services5.arcgis.com/Oos4pNA2538iVFA1/arcgis/rest/services/Individual_Landmark_Lots_Points/FeatureServer/0

**F68.** Every LPC individual landmark whose `NEIGHBORHO` field is "Corona" or "North Corona"
(verbatim field values; DesDate converted from the layer's epoch-millis):

| LPC_NAME | LP number | Address | NEIGHBORHO | Full_Cit | Date_Comb | Style_Prim | Designated |
|---|---|---|---|---|---|---|---|
| Louis Armstrong House | LP-01555 | 34-56 107th Street | North Corona | Robert W. Johnson, 1910 | 1910 | Colonial Revival | 1988-12-13 |
| John Birks "Dizzy" Gillespie Residence | LP-02657 | 105-19 37th Avenue (aka 34-68 106th Street) | North Corona | Not determined, c. 1922 | 1922 | Colonial Revival | 2023-06-27 |
| Edward E. Sanford House | LP-01292 | 102-45 47th Avenue | Corona | c. 1871 | 1870 - 1875 | Vernacular Italianate | 1987-02-10 |
| Congregation Tifereth Israel | LP-02283 | 109-18 54th Avenue | Corona | Crescent L. Varrone, 1911 | 1911 | Gothic Revival and Moorish | 2008-02-12 |
| Fire Engine Company 289, Ladder Company 138 | LP-02035 | 97-28 43rd Avenue | Corona | Satterlee & Boyd, 1912-14 | 1912 - 1914 | French Renaissance | 1999-06-22 |
| Unisphere and Surrounding Reflecting Pool | LP-01925 | Flushing Meadows-Corona Park | Corona | Gilmore D. Clarke, landscape architect; United States Steel Company… 1963-64 | 1963 - 1964 | — | 1995-05-16 |

→ **The Unisphere row is OWNED by CitiFieldPlaces. Recorded here only to prove the query was
exhaustive. Do not create it.**

**F69.** The same query returned these neighbouring-wave landmarks, useful for §L context (verbatim):
Newtown High School, LP-02131, 48-01 90th Street, **Elmhurst**; Remsen Cemetery, LP-01177, "adjacent
to 69-43 Trotting Course Lane", **Elmhurst**; Reformed Dutch Church of Newtown and Fellowship Hall,
LP-00138, 85-15 Broadway, **Elmhurst**; Old Saint James Episcopal Church (Old Saint James Parish
Hall), LP-02593, 86-02 Broadway, **Elmhurst**; Benevolent and Protective Order of Elks, Lodge Number
878, LP-02086, 82-10 Queens Boulevard, **Elmhurst**; Firehouse, Engine Company 305 and Hook & Ladder
151, LP-02522, 111-02 Queens Boulevard, **Forest Hills**; Ridgewood Savings Bank, Forest Hills
Branch, LP-02066, 107-55 Queens Boulevard, **Forest Hills**.
→ **No LPC individual landmark in this query carries NEIGHBORHO = "Rego Park."**
→ **There is no LPC historic district in Corona in this layer.** (The layer covers individual
landmarks only; the verifier should separately confirm no Corona historic district exists.) `[GAP]`

### P15 — Louis Armstrong House

**F70.** LPC designation report header, verbatim: "Landmarks Preservation Commission / December 13,
1988; Designation List 212 / LP-1555 / THE LOUIS ARMSTRONG HOUSE, 34-56 107th Street, Borough of
Queens. Built 1910; architect, Robert W. Johnson; builder, Thomas Daly. Landmark Site: Borough of
Queens Tax Map Block 1748, Lot 36."
Source: http://s-media.nyc.gov/agencies/lpc/lp/1555.pdf

**F71.** LPC: "On November 12, 1985, the Landmarks Preservation Commission held a public hearing on
the proposed designation as a Landmark of the Louis Armstrong House (Item No. 10)… Five witnesses
spoke in favor of designation."
Source: LP-1555.

**F72.** LPC summary: "This modest brick-covered frame house, purchased in 1943 by Louis and Lucille
Armstrong, remains substantially as it was during the Armstrongs' residence. Designed by Robert
Johnson, built in 1910 by Thomas Daly, and located in Corona, Queens, a community to which the
Armstrongs developed strong ties, this house is closely associated with the famed musician,
'probably the foremost genius of American jazz,' during a significant portion of his long and
dazzlingly successful career as a trumpet player without peer."
Source: LP-1555. (The internal quotation is LPC quoting Jones & Chilton, *Louis: The Louis Armstrong
Story*.)

**F73.** LPC: "Despite his international travels, the house in Queens remained Armstrong's home base
for nearly thirty years until his death in 1971. His widow continued to occupy the house until her
death in 1983. She willed the house and its contents to the City of New York for the creation of a
museum and study center devoted to Armstrong's career and the history of American jazz, to serve as
a tangible memorial of his contributions to American culture."
Source: LP-1555.

**F74.** LPC quotes the eleventh clause of Lucille Armstrong's will verbatim in its notes: "It is my
wish that if the City of New York accepts said property, that the same be maintained, in perpetuity,
as a landmark, and in respectful memory of my deceased husband, LOUIS ARMSTRONG."
Source: LP-1555, note 29.

**F75.** LPC building description: "Designed by architect R. W. Johnson of 60 Grove Street, Corona,
and built by Thomas Daly in 1910, this three-story structure was originally a twenty by forty-eight
foot two-family, two-story frame structure with a flat roof, similar to many others in the community.
Occupying a forty by one hundred foot lot, it was built at an estimated cost of $3500. In 1925, a
garage was added to the house."
Source: LP-1555. (LPC cites Queens Building Department NB 1770-1910 and NB 5703-1925.)

**F76.** LPC: "The house retains its original bracketed cornice and frieze… Originally a frame
structure, the house was later sheathed in aluminum siding. During Armstrong's tenure, the lower two
stories were covered with brick… In addition, the third story, which has a peaked roof and is
wood-shingled, appears to have been added by the Armstrongs… The appearance of the house today is
essentially the same as when the Armstrongs lived there."
Source: LP-1555.

**F77.** LPC quotes Lucille Armstrong on the house: it "had 'qiven him a stability and a happiness he
never had before.'" and the house "from the '40s throuqh the '70s was often a 'gathering point for
Satchmo band members'". `[NOTE: the OCR of this 1988 scan renders "given" as "qiven" and "through"
as "throuqh." I am reproducing the OCR faithfully; the verifier should treat the underlying words as
"given"/"through" and re-check the PDF before any of this is quoted in copy.]`
Source: LP-1555 (quoting Jones & Chilton p.223 and John Marzulli, *Queens Daily News*, May 15, 1988).

**F78.** LPC's photo caption in the same report reads: "Facade detail: Plaque (National Historic
Landmark, 1977)".
Source: LP-1555.

**F79.** Wikipedia's infobox for the house gives, verbatim field values: "Added to NRHP May 11,
1976"; "Designated NHL May 11, 1976"; "NRHP reference number No. 76001265"; "Designated NYSRHP June
23, 1980"; "NYSRHP Number No. 08101.006403"; "Designated NYCL December 13, 1988"; "NYCL Number No.
1555"; Location "34 - 56 107th Street, Queens, New York"; Built "1910"; Architect "Robert W.
Johnson"; Coordinates 40°45′20″N 73°51′43″W.
Source: https://en.wikipedia.org/wiki/Louis_Armstrong_House `[AGGREGATOR]`
→ **CONFLICT: NHL 1976 (Wikipedia, citing the NHL summary) vs "National Historic Landmark, 1977"
(LPC's own photo caption, F78).** Recorded, not resolved. I could not reach an NPS page: both
nps.gov URLs I tried returned 404 or truncated content. `[GAP]`

**F80.** LPC (2023, Gillespie report) adds a **third** date for the NYC designation: "Lucille
Armstrong bequeathed their home to the City of New York upon her death in 1983, and it was designated
a New York City Landmark in 1985."
Source: LP-2657.
→ **CONFLICT: 1985 (LP-2657) vs 1988-12-13 (LP-1555 header and the LPC ArcGIS DesDate field).**
1985 is the year of the *public hearing* per F71. Same agency contradicting itself. Recorded, not
resolved.

**F81.** Wikipedia: "The Louis Armstrong House is a historic house museum at 34 - 56 107th Street in
the Corona neighborhood of Queens in New York City. It was the home of Louis Armstrong and his wife
Lucille Wilson from 1943 until his death in 1971."
Source: https://en.wikipedia.org/wiki/Louis_Armstrong_House `[AGGREGATOR]`

**F82.** Wikipedia: "The home is part of the Louis Armstrong House Museum, a non-profit organization
and three-building campus encompassing the historic home, the Armstrong Center and Selma's Place."
Source: same. `[AGGREGATOR]`
→ **"Selma's Place" (P16) is a candidate place I could not source directly** — the museum URL I tried
returned 404 and I have no search budget. `[GAP]`

**F83.** Wikipedia: "The Louis Armstrong House Museum is a winner of the 2024 National Medal for
Museums and Library Service from the Institute for Museum and Library Services." And: "In September
2025, the Louis Armstrong House Museum became part of the city's Cultural Institutions Group, a
partnership of cultural and educational institutions."
Source: same. `[AGGREGATOR]`
→ Both are strong, checkable claims. Verifier should confirm at imls.gov and nyc.gov/dcla.

### P17 — Louis Armstrong House Museum (visitor-facing)

**F84.** Museum's own visit page: address "34-56 107th Street, Corona, NY 11368"; hours
Thursday–Saturday 11:00 a.m.–4:00 p.m.; historic house tours hourly 11:00 a.m.–3:00 p.m.; admission
Adults $20 / Seniors, Students, Military, Disabled $14 / **Corona residents $5** / children under 5
free; exhibitions-only Adults $10 / $8 / Corona residents $5.
Source: https://www.louisarmstronghouse.org/visit/ `[PARAPHRASE of the price table; the dollar
figures are as printed]`

**F85.** Museum's transit line, quoted exactly: "Take the 7 train to 103 St-Corona Plaza, about a
ten-minute walk from our door."
Source: https://www.louisarmstronghouse.org/visit/

**F86.** Museum describes its setting as "a quiet residential neighborhood in northern Queens, where
Louis and Lucille Armstrong chose to make their home for nearly three decades."
Source: https://www.louisarmstronghouse.org/visit/

**F87.** Museum's About page: "Louis Armstrong and his wife Lucille moved to their home on 107th
Street in Corona, Queens in 1943."
Source: https://www.louisarmstronghouse.org/about/

**F88.** Museum's About page gives the museum address as **34-49 107th Street**, while the Visit page
(F84) gives **34-56 107th Street**, and LPC (F70) designates **34-56 107th Street**.
Sources: https://www.louisarmstronghouse.org/about/ vs /visit/ vs LP-1555.
→ **CONFLICT: 34-49 vs 34-56 on the museum's own site.** Most likely 34-56 is the historic house and
34-49 is the Louis Armstrong Center across the street, but **I am not resolving it.** The verifier
must pin each building to its own number before any address is written.

**F89.** Museum's About page: the Louis Armstrong Center "Opened in 2023, this 14,000-square-foot
facility" was constructed as "a cultural facility" to "honor Armstrong's deep roots in the Corona
community."
Source: https://www.louisarmstronghouse.org/about/

**F90.** Museum's About page: "the home and its contents were transferred to the City of New York"
after Lucille's death in 1983, and the historic house "opened for guided tours in 2003."
Source: https://www.louisarmstronghouse.org/about/

### P18 — Louis Armstrong Center

**F91.** Wikipedia (Louis Armstrong House article, Center section): address "34-56 107th Street,
Queens, NY 11368"; opening date "July 6, 2023"; architects Sara Caples and Everardo Jefferson
(described as a husband-and-wife team hired in March 2007); cost $26 million; contents described as
"a state of the art museum-educational center that will house portions of the archives and provide
space for exhibits and public programs"; the inaugural exhibit "Here to Stay" curated by Jason Moran.
Source: https://en.wikipedia.org/wiki/Louis_Armstrong_House `[AGGREGATOR]` `[PARAPHRASE except the
quoted passage]`
→ **NOTE the coincidence worth flagging:** Everardo Jefferson is also listed as a sitting LPC
Commissioner on the 2023 Gillespie designation report (F102). Verifier may want to check whether
that is the same person. Recorded, not resolved.

**F92.** `[GAP]` I could not retrieve the size of the Louis Armstrong Archives (number of reel-to-reel
tapes, scrapbooks, photographs). louisarmstronghouse.org/collections/ 301-redirects to
collections.louisarmstronghouse.org, which returned only the string "LAHM Media Store". This is a
significant hole — the archive is one of the strongest things about the place.

### P19 — John Birks "Dizzy" Gillespie Residence

**F93.** LPC report header, verbatim: "John Birks 'Dizzy' Gillespie Residence / 105-19 37th Avenue
(aka 34-68 106th Street), Corona, Queens / Designation List 534 / LP-2657 / Built: c. 1922 /
Architect: Unknown / Landmark Site: Borough of Queens, Tax Map Block 1747, Lot 51 / Building
Identification Number (BIN): 4043449 / Calendared: April 4, 2023 / Public Hearing: June 6, 2023 /
Designation: June 27, 2023."
Source: LP-2657.

**F94.** LPC significance statement, verbatim: "Located in Corona, Queens, this building was the home
of the unparalleled jazz trumpeter, composer, bandleader, and music trailblazer John Birks 'Dizzy'
Gillespie during the height of his influential career from 1953 until 1965."
Source: LP-2657.

**F95.** LPC summary: "The legendary jazz trumpeter, composer and bandleader, John Birks 'Dizzy'
Gillespie (1917-1993) purchased the three-story multi-family residence at 105-19 37th Avenue in
Corona, Queens in 1953. Built on the corner of 106th Street in 1922 as a single-family residence
designed in the Colonial Revival style, with simple facades of patterned red brick and cast-stone
keystones and cartouches, the building was converted to a three-family residence in c. 1940. Using
the building's 106th Street address, Gillespie lived here with his wife Lorraine (1920-2004), who
served as his personal manager, until 1965, and continued to own the building until 1985."
Source: LP-2657.

**F96.** LPC: "Of the various places he lived in New York City, Gillespie lived in Corona the longest,
during a period when he was at the height of his career."
Source: LP-2657.

**F97.** LPC: "At the time, Corona had developed a significant African American community, including
such notable musicians as Gillespie's friend Louis Armstrong, who settled on 107th Street, around the
corner, in 1943."
Source: LP-2657.

**F98.** LPC: "Many jazz musicians congregated in the basement rehearsal studio of Gillespie's 'plush'
two-story apartment. Pianist Junior Mance recalled his years in the Gillespie band from 1958 to 1961,
'probably my most profound learning experience. "I remember spending several hours at a time in his
basement studio being shown chord changes that I never knew existed."'"
`[NOTE: the nested quotation marks are as they appear in the PDF; the punctuation is LPC's.]`
Source: LP-2657.

**F99.** LPC: "while he lived in this house he released or performed on a succession of memorable
albums, such as Jazz at Massey Hall (1954), Afro (1954), World Statesman (1956), Manteca (1958), A
Portrait of Duke Ellington (1960) and Jambo Caribe (1964)."
Source: LP-2657.

**F100.** LPC: "a significant milestone was his selection by the U.S. State Department to be the
nation's first jazz ambassador in 1956… Following his return, he appeared on Edward R. Murrow's
Person to Person, a CBS interview program that was broadcast live from Gillespie's Corona apartment.
Gillespie won many national and international awards during his six-decade-long career, entering Down
Beat magazine's Hall of Fame in 1960."
Source: LP-2657.

**F101.** LPC: "Gillespie moved to New Jersey in 1965, retaining ownership of the Corona building
until 1985. Gillespie is buried in Queens, nearby in Flushing Cemetery. Aside from replacement of the
original windows, and front and side doors, there have been few changes to the exterior of 105-19
37th Avenue since Gillespie resided there."
Source: LP-2657.

**F102.** LPC: "At the June 6, 2023 hearing, representatives of the Historic Districts Council and the
Corona East Elmhurst Preservation Society, and two individuals testified in favor of designation. Two
representatives of the owner spoke in opposition. In addition to those who testified, the Commission
received written correspondence in support of designation from Assemblymember Jeffrion L. Aubry, and
the New York Landmarks Conservancy."
Source: LP-2657.
→ **"Corona East Elmhurst Preservation Society" is itself a candidate organization (P20)** and its
name is another Corona/East Elmhurst boundary artefact.

**F103.** LPC on how Gillespie bought the house: "by the spring of 1952 he and his wife Lorraine were
renting an apartment on 76th Road in Flushing, Queens. That year, he and Lorraine wanted to purchase
the property at 105-19 37th Avenue, around the corner from the home of Gillespie's friend and fellow
jazz trumpeter Louis Armstrong. Because of the difficulty in obtaining mortgage financing,
Gillespie's business manager Walter 'Foots" Thomas (1907- 1981), negotiated with Morris Levy
(1927-1990), owner of the jazz club Birdland, to provide an interest-free loan for a down payment."
`[NOTE: the mismatched quotation marks around 'Foots" are as printed in the PDF.]`
Source: LP-2657.

**F104.** LPC's building description of the two primary facades: "The three-bay-wide brick facade is
laid in a common bond pattern. The arched entrance located in the western bay has a brick lintel with
cast stone keystone… The roofline features patterned brickwork and cast stone cartouches at the
corners of the facade." (37th Avenue / south facade) and "The brick facade facing 106th Street is
similar to that of the 37th Street facade, but four bays wide, and with its arched entrance in the
northern bay." (106th Street / east facade)
Source: LP-2657.
→ **NOTE the internal slip:** LPC writes "the 37th Street facade" where it means 37th *Avenue*.
Recorded as-is.

### P21 — Edward E. Sanford House / 102-45 47th Avenue House

**F105.** LPC report header, verbatim: "Landmarks Preservation Camnission / February 10, 1987;
Designation List 187 / LP-1292 / 102-45 47th AVENUE HOUSE, Borough of Queens. Built c. 1871; architect
l.1Ilkna-m. / Landmark Site: Borough of Queens Tax Map Block 1981, Lot 37."
`[NOTE: "Camnission" and "l.1Ilkna-m" are OCR corruption of "Commission" and "unknown" in this 1987
scan. Reproduced faithfully; do not quote the corrupt strings in copy.]`
Source: http://s-media.nyc.gov/agencies/lpc/lp/1292.pdf

**F106.** LPC summary: "Built for Edward E. Sanford about 1871, this small, two-story, frame house is
one of the last intact 19th-century [buildings] remaining in what was the villcge of Newtown, one of
the oldest settlements on western Long Island. Rendered in a modified Italianate style, the house is
stylistically within an architectural tradition established in the second quarter of the 19th century
for the design of suburban and rural cottages of a type often illustrated in builders' handbooks."
`[OCR renders "buildings" as "wildings" and "village" as "villcge."]`
Source: LP-1292.

**F107.** LPC: "The house retains most of its original fabric and is particularly notable for the
decorative detailing of its porch, eaves, and property-line fence. These fancifully carved elements
display the craftsmanship of 19th-century carpenters and builders, who, using simple techniques,
could transform a humble, domestic structure into an architectural delight."
Source: LP-1292.

**F108.** LPC on the chain of title: "Daniel Sanford Duncomb (1813-1883), a Manhattan merchant, began
to invest in village real estate and, having acquired the present site of the 102-45 47th Avenue
House, sold it to Edward R. Sanford in April 1871. The house that Sanford built and which remained in
his family for over 100 years is one of the rare intact houses remaining from this period of
suburbanization."
Source: LP-1292.
→ **CONFLICT within one document: "Edward E. Sanford" in the summary (and in the LPC ArcGIS
`LPC_NAME` field) vs "Edward R. Sanford" in the history section.** Recorded, not resolved. The
ArcGIS `LPC_Altern` field reads: "designated as the 102-45 47th Avenue House."

**F109.** LPC's physical description: "The house, set back from the street behind a wooden fence of
simulated balusters, [occupies] the western half of a 50' wide lot. It rises two-and-one-half stories
with a gable roof, is three bays wide, and is sheathed in clapboards… A porch, raised above ground
level and tying the extension to the main house, shades the first story. The porch has seven squared
colonnettes on thin plinths which are crowned by capitals that carry cut-out panels supporting the
pitched roof. Between the colonnettes are parapet panels with punched-out, propeller-like cuts that
create balusters in silhouette. Along the edge of the porch roof is a cut-out skirt of exaggerated
egg-and-dart design." And: "A bull's-eye window pierces the gable."
Source: LP-1292.

**F110.** LPC on why it matters as a type: "It is unlikely that the house was designed by an architect
or by the owner… it is quite likely that Sanford hired a local carpenter from the village to erect his
new house, following the building traditions of the period." LPC names A. J. Downing's *The
Architecture of Country Houses* and Calvert Vaux's *Villas [and] Cottages* as the handbooks of the
type.
Source: LP-1292.

### P22 — Congregation Tifereth Israel

**F111.** LPC report header, verbatim: "Landmarks Preservation Commission / February 12, 2008,
Designation List 401 / LP-2283 / CONGREGATION TIFERETH ISRAEL, 109-18 54th Avenue, Borough of Queens.
Constructed 1911; Crescent L. Varrone, architect. Landmark Site: Borough of Queens Tax Map Block
2010, Lot 1 in part…"
Source: http://s-media.nyc.gov/agencies/lpc/lp/2283.pdf

**F112.** LPC summary: "The oldest active synagogue in Corona, the Congregation Tifereth Israel is a
rare survivor of the earliest Jewish synagogues built in Queens. This synagogue, whose full name is
translated as the Congregation Independent Community, Glory of Israel, People of Corona, was
constructed in 1911 to house a congregation of Jews that had relocated to Queens primarily from other
parts of New York City."
Source: LP-2283.

**F113.** LPC: "In 1918, East Queens had 18 synagogues, two of which were located in Corona. Of these
two synagogues, only the Congregation Tifereth Israel survives."
Source: LP-2283.

**F114.** LPC: "Designed by local architect C. L. Varrone, the synagogue is a two-story wood-frame
building that was originally clad with horizontal clapboard siding. Its design is typical of early
twentieth-century American synagogues, combining Gothic and Moorish design with Judaic ornament. It
has pointed-arched windows, a tripartite upper-story window with a roundel featuring a Star of David
in colored glass, and decorative ornament at its gabled parapet. The original wood stoop and railing
have been replaced with a brick porch with an iron railing, and the wood clapboard siding has been
covered with stucco."
Source: LP-2283.

**F115.** LPC: "Despite these alterations, the Congregation Tifereth Israel remains a rare survivor as
what is likely the oldest purpose-built synagogue in Queens and a striking representative of a
regional vernacular style."
Source: LP-2283.

**F116.** LPC: "The Corona settlement was among the first of these pioneering Jewish communities,
having formed as early as 1900. By 1908, Corona's Jewish population reached approximately 150."
Source: LP-2283.

**F117.** LPC: "There were said to have been two Jewish neighborhoods in Corona in the early part of
the twentieth century: an older and poorer one along Corona Avenue and a newer and more prosperous
one along Northern Boulevard. Many of Corona's Jewish residents managed shirtwaist factories, an
industry brought over from the Lower East Side, and most of these factories were located along Corona
Avenue and its adjacent side streets."
Source: LP-2283.

**F118.** LPC: "Many of the area's theaters were also managed by members of the Jewish community; the
El Dorado, Hyperion and Park Theaters were all Jewish-owned and operated."
Source: LP-2283.
→ **Three lost Corona theaters (P23) — El Dorado, Hyperion, Park.** No addresses given. `[GAP]`

**F119.** LPC: "There were two synagogues in Corona in the early part of the twentieth century: the
Anshei Emes (or Smith Street Synagogue) on 52nd Avenue, organized in 1905, and the Congregation
Tifereth Israel on 54th Avenue, organized circa 1907. At least three additional synagogues formed in
Corona during the following decade, none of which exist today. Of the first two, only the Tifereth
Israel survives; the Anshei Emes was demolished in 1936."
Source: LP-2283. → Anshei Emes / Smith Street Synagogue is a lost-place candidate (P24).

**F120.** LPC: "Its name, Congregation Independent Chevra Tyfers Israel Anshei Corona (meaning
Congregation Independent Community, Glory of Israel, People of Corona), was cumbersome in length and
soon the synagogue was fondly known as the Home Street Synagogue for the street on which it was
located. The congregation acquired the lot at 136 Home Street (changed to 54th Avenue circa 1925) in
April, 1911, and the ceremonial cornerstone laying took place on August 13th."
Source: LP-2283.

**F121.** LPC quotes a contemporary local newspaper account of the 1911 cornerstone ceremony: "A large
attendance of interested spectators witnessed the ceremonies at which Dr. Peyser, president of the
Smith Street synagogue, officiated as auctioneer in auctioning off the privileges which netted the
handsome sum of $350 for which the whole congregation unite in giving the Doctor their sincere thanks
for his efforts in making the event a complete success. The new synagogue, when completed, will be
one of the most imposing temples of worship in Corona."
Source: LP-2283 (quoting an uncited local newspaper).

**F122.** LPC: "In addition to the synagogue, over the years there would be a mikveh (on the same lot
as the synagogue), a yeshiva (nearby on 53rd Avenue) and a cemetery."
And on the yeshiva: "The yeshiva closed in the 1970s and was converted into a residence and music
studio; still standing and largely unchanged, it continues to be distinguished by large Star of David
motifs in the brick at its main façade."
Source: LP-2283. → **The former Corona yeshiva on 53rd Avenue is a strong candidate place (P25)** —
still standing, still legible from the street. No street number given. `[GAP]`

**F123.** LPC on the Estée Lauder connection: "One of the synagogue's early congregants was a young
woman named Josephine Esther Mentzer, who would grow up to become the immensely successful cosmetics
entrepreneur Estée Lauder. Born in 1908, Mentzer spent her youth in Corona and began her business
selling products door to door. Her parents, Rose and Max Mentzer, owned a hardware store two blocks
from the Tifereth Israel synagogue."
Source: LP-2283.
→ **CONFLICT: LPC says born 1908; Wikipedia's notable-residents list says "Estée Lauder (1906–2004)"
and says she was "born at home in Corona, Queens."** Recorded, not resolved. The Mentzer hardware
store is a candidate lost place (P26) with no street number. `[GAP]`

**F124.** LPC on the synagogue's late life: "A small community of Bukharan Jews from the former Soviet
Union began meeting in the synagogue in the mid-1990s, and in 1996 an appeal was made to congregants
to help restore the synagogue, which at that time was reported to be 'in dire straits, plagued by just
about every physical problem a building can have.'"
Source: LP-2283.

**F125.** LPC: "In 1999, the Queens Historical Society granted Queensmark status to the synagogue in
recognition of its historical and architectural merit and in 2002 it was placed on the National
Register of Historic Places. It continues to be used and cared for today by members of its
congregation, some of whose relatives have been attending services there since its incorporation and
others who are comparatively new to the area."
Source: LP-2283.
→ Corroborated by Wikipedia: "The Congregation Tifereth Israel was listed on the National Register of
Historic Places in 2002."

**F126.** LPC: "With a diverse congregation in a diverse city neighborhood, and as Corona's only
synagogue continuously in use since the early part of the twentieth century, it remains a vital part
of the evolving history of the neighborhood and of Queens as a whole."
Source: LP-2283.

**F127.** LPC's hearing record: "Additionally, the Commission has received letters from Queens Borough
President Helen M. Marshall, City Council Member Hiram Monserrate, **Queens Community Board 3 Chairman
Martin Maier**, and the Queens Jewish Historical Society in support of designation."
Source: LP-2283.
→ **FLAG:** 109-18 54th Avenue is south of Roosevelt Ave and NYC Parks assigns that part of Corona to
Community Board 4 — yet the CB **3** chairman wrote in support. Either an administrative quirk or a
boundary artefact. Recorded, not resolved. Row in §L.

**F128.** LPC gives two different figures for New York City's Jewish population in the **same
document**: summary — "of approximately 1.3 million Jews in the city in 1913, about 23,000 lived in
the Borough of Queens"; body — "in 1918, of New York City's estimated 1.5 million Jews, only about
23,000 lived in Queens."
Source: LP-2283.
→ Internal conflict. Recorded, not resolved.

### P27 — Fire Engine Company 289, Ladder Company 138

**F129.** LPC report header, verbatim: "Landmarks Preservation Commission / June 22, 1999; Designation
List 307 / LP-2035 / Fire Engine Company 289, Ladder Company 138, 97-28 43rd Avenue, Queens. Built
1912-14; Satterlee & Boyd, architects. Landmark Site: Borough of Queens Tax Map Block 1628, Lot 18."
Source: http://s-media.nyc.gov/agencies/lpc/lp/2035.pdf

**F130.** LPC summary: "Built in 1912-14, Fire Engine Company 289, Ladder Company 138 is one of
Corona's most prominent public buildings. Designed by the architectural firm Satterlee & Boyd, the
French Renaissance-style structure was erected as part of an ambitious campaign to bring professional
fire service to Queens following the Consolidation of Greater New York. Part of the earliest group of
station designs introduced during the automobile age, it features side-by-side apparatus bays
specifically designed for motorized vehicles."
Source: LP-2035.

**F131.** LPC: "Notable features include the use of tapestry brick, bronze and marble medallions,
decorative ironwork, and a steeply pitched mansard roof clad in gray slate. Standing amidst
single-family residences and small industrial buildings, Fire Engine Company 289, Ladder Company 138
is an outstanding example of early twentieth century civic architecture, symbolizing Greater New
York's commitment to the citizens of Corona."
Source: LP-2035.

**F132.** LPC on Corona's volunteer-era predecessor: "the Wandownock Fire, Hook & Ladder 1, founded in
Newtown (now Corona and Elmhurst) in 1843. Equipped with a single, hand-drawn firefighting apparatus,
the company was housed in a modest frame building located on public land. More than two thousand
volunteers were active in Queens by 1898, including eleven companies in Newtown alone."
`[OCR renders the company name as "W andownock" with a stray space; I have closed it.]`
Source: LP-2035.
→ **Note the parenthetical: LPC itself writes "Newtown (now Corona and Elmhurst)" — an explicit
statement that the two wave-3 neighborhoods share a single predecessor.** This is the strongest
single sentence in the corpus for the Corona/Elmhurst arbitration. Row in §L.

**F133.** LPC quotes the Greater New York Charter: "The paid fire department shall, as soon as
practical, be extended over the Boroughs of Queens and Richmond . . . there upon the present volunteer
fire departments now maintained therein shall be disbanded."
Source: LP-2035.

**F134.** LPC: "In 1910, the Art Commission of the City of New York approved an innovative plan by the
New York City Fire Department to build twenty new firehouses, including eleven in Brooklyn and
Queens."
Source: LP-2035.

**F135.** LPC's hearing record: "On January 12, 1999 the Landmarks Preservation Commission held a
public hearing… A representative of the Historic Districts Council spoke in favor of designation. The
Commission received two letters in support of designation, from the Coalition of United Residents for
a Safer Community and the Historic Districts Council."
Source: LP-2035.

---

## §F — Black Corona and the jazz Corona (the richest vein in the file)

The 2023 Gillespie designation report (LP-2657) contains a dedicated section, "History of the Black
Presence in Corona, Queens." It is by a wide margin the best primary-institutional source on the
subject that I retrieved.

**F136.** LPC: "When legendary jazz trumpeter, composer, and bandleader John Birks 'Dizzy' Gillespie
moved to Corona, Queens, in 1953, the neighborhood was home to an established African American
population with connections to Harlem and other Black communities in the city, which had begun
attracting notable jazz figures including Louis Armstrong."
Source: LP-2657.

**F137.** LPC: "After emancipation in 1827, Black residents of Corona established a thriving community
there that supported churches, schools, and benevolent societies. At the turn of the 20th century,
most Black families residing in Corona were there because of available work opportunities, better
living conditions, and possibility of home ownership, opportunities not as readily available to Black
people in other boroughs of New York because of increasing racial tensions, particularly in
Manhattan."
Source: LP-2657.

**F138.** LPC: "At that time, the neighborhood was integrated, home to first- and second-generation
immigrant families from the West Indies, Italy, Germany, Ireland, and Eastern Europe, as well as
African American families. It was also home to interracial couples who found a 'safe haven' there."
Source: LP-2657.

**F139.** LPC: "After World War I, racial tensions increased in Corona as the middle-class Black
population grew and expanded previously 'organized infrastructure of churches, clubs, fraternal
organizations, and mutual benefit societies.' Many of these provided significant services during the
Great Depression, which heavily impacted the Black [population] of Corona, especially unskilled
laborers and domestic workers. While skilled laborers were able to find work with WPA building
projects, such as the construction of LaGuardia Airport, most African Americans were
disproportionately and unfairly impacted by layoffs and restrictive hiring practices."
`[NOTE: the PDF prints "papulation" — a typo in the published report. I have bracketed the correction
rather than silently fixing it.]`
Source: LP-2657.

**F140.** LPC on redlining, verbatim: "There was no racial covenant on the property at 105-19 37th
Avenue (aka 34-68 106th Street). However by 1937, all of Corona south of Astoria Boulevard was subject
to Redlining, imposed by the Federal Housing Administration (FHA), insurance companies, and mortgage
lending agencies. In creating maps to guide lenders, the Homeowners Loan Corporation (HOLC) outlined
Corona in red and described it as 'Hazardous,' to lenders, and with a pronounced degree of an
increasing 'undesirable population,' referring to African Americans, which made up 17% of the
population at the time."
Source: LP-2657.
→ **This is the sentence a Corona page most needs and most risks getting wrong. Note the report says
"no racial covenant" on the Gillespie property specifically — this is the source's own word, not an
inserted negation. Verifier: check this one character by character; a previous wave inverted a
source's meaning by adding "no" where none existed. Here the "no" IS in the source.**

**F141.** LPC: "Racial covenants existed in Addisleigh Park (a designated New York City Historic
District) before it became a prominent African American neighborhood in the 1950s, and in some parts
of Corona, near and around prime commercial areas."
Source: LP-2657.

**F142.** LPC: "Redlining promoted segregation and unjustly tarnished Black neighborhoods, labeling
them as slums and rendering them ineligible for FHA loans. These and many other unfair practices led
Black residents of Corona to mobilize and enlist the help of Civil Rights organizations like the
NAACP, the National Urban League, and local churches to fight for the elimination of racial
discrimination in housing and hiring practices."
Source: LP-2657.

**F143.** LPC: "The Black community in Corona maintained a variety of social and cultural ties to
Harlem and other African American communities in the city, and Black entertainers and professionals
moved to the neighborhood seeking a more comfortable existence for their families. This was possible
in large part due to the lack of racial covenants in most of Corona, so families were able to find
homes on larger lots with yards for their children to play, and other suitable amenities."
Source: LP-2657.

**F144.** LPC: "Many prominent jazz musicians have called Corona home over the years, most notably
trumpeter and vocalist, Daniel Louis 'Louie' Armstrong (1901-1971), who lived with his wife Lucille
(1914-1983) at 34-56 107th Street from 1943 until his death in 1971."
Source: LP-2657.
→ Note LPC gives Lucille's dates as 1914-1983 here; LP-1555 says only that she died in 1983.

**F145.** LPC: "In addition, several jazz musicians and composers have lived at the Dorie Miller
Cooperative Houses at 11-23 Northern Boulevard. Some include Julian Edward 'Cannonball' Adderley
(1928-1975, alto saxophonist), his brother, Nathaniel Carlyle 'Nat' Adderley (1931-2000, trumpeter and
cornetist) James Edward 'Jimmy' Heath (1926-2020, saxophonist, composer, arranger), Cecil Taylor
(1929-2018, pianist), and Clark Terry Jr. (1920-2015, trumpeter)."
Source: LP-2657.
→ **ADDRESS PROBLEM (P28):** "11-23 Northern Boulevard" is an Astoria/Long Island City-range Queens
hyphenated address, not a Corona one. Corona's Northern Blvd numbers run in the 90s–110s (cf. Elmcor
at 107-20 Northern Blvd, Langston Hughes Library at 100-01 Northern Blvd). **I believe LPC has a
typographical error here, but I am not resolving it.** Verifier must establish the Dorie Miller
Apartments' real address before it is used.

**F146.** Wikipedia on Dorie Miller: "Dorie Miller Residential Cooperative, built in 1952, comprises
six buildings, containing 300 apartments, with 1,300 rooms in total. The cooperative is named after
Doris 'Dorie' Miller, a U.S. Naval hero at Pearl Harbor and the first African-American recipient of
the Navy Cross." And: "Among its original residents were jazz greats Nat Adderley & Jimmy Heath;
Kenneth and Corien Drew, publishers of Queens' first African-American newspaper, The Corona East
Elmhurst News, Thelma E. Harris founder…" (truncated in my retrieval).
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`
→ ***The Corona East Elmhurst News*, "Queens' first African-American newspaper," is a candidate
subject (P29) and another Corona/East Elmhurst compound name.** `[GAP: retrieval truncated]`

**F147.** Wikipedia refers to a sub-area: the "African-American community, sometimes referred to as
Corona Heights."
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`
→ Corroborated by NYC Parks: William F. Moore Park was "Originally known as Corona Heights Triangle"
(F157). **"Corona Heights" (P30) is a real sub-neighborhood name with two independent attestations.**

**F148.** Wikipedia's jazz/notable-resident list for Corona, verbatim names and dates: Louis Armstrong
(1901–1971); Cannonball Adderley (1928–1975); Nat Adderley (1931–2000); Dizzy Gillespie (1917–1993);
Jimmy Heath (1926–2020); Clark Terry (1920–2015); Cecil Taylor (1929–2018); Charlie Shavers
(1920–1971); Frankie Manning (1914–2009), "Lindy Hop popularizer"; Frankie Lymon (1942–1968).
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`

**F149.** Wikipedia quotes a New York Times passage in a footnote about Cecil Taylor: "Raised in
Corona, Queens, he started out as a Harlem jam-session musician in the early 1950s and talks with
intense loyalty about a line of particularly New York-identified piano players: Fats Waller, Teddy
Wilson, Thelonious Monk, Mary Lou Williams, Mal Waldron, John Hicks."
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[QUOTE-VIA — the underlying source is a NYT
article whose citation I did not fully capture]`

**F150.** Wikipedia's other notable-resident claims: Marie Maynard Daly (1921–2003), "first African
American woman in the United States to earn a Ph.D. in chemistry"; Bob Moses (1935–2021), civil
rights activist, "lived at 108-63 Ditmars Boulevard"; Calvin O. Butts (1949–2022); Helen Marshall
(1929–2017), Queens Borough President 2002–2013; Omar Minaya; Jim Valvano (1946–1993); Martin Scorsese
(b. 1942), "spent part of childhood there"; Madonna (b. 1958), "lived 1979–1980 as Breakfast Club
member"; Crockett Johnson (1906–1975), "lived Corona 1912–1924"; Donna Murphy (b. 1959); Carlos D.
Ramirez (1946–1999), El Diario La Prensa publisher; and the hip-hop figures Kool G Rap (b. 1968),
Noreaga (b. 1977), Styles P (b. 1974), Kid 'n Play, The Beatnuts, Kwamé (b. 1973).
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]` `[PARAPHRASE except quoted
fragments]`
→ **FLAG: 108-63 Ditmars Boulevard (Bob Moses) is an East Elmhurst address, not a Corona one.** Row
in §L.
→ **FLAG:** Wikipedia's own Kool G Rap footnote reads "the lyricist from Lefrak City and Corona,
Queens" — treating LeFrak City and Corona as adjacent-but-distinct. Row in §L.

**F151.** Wikipedia: "Paul Simon's 1972 song 'Me and Julio Down by the Schoolyard' mentions 'Rosie,
the queen of Corona'"; "Archie Bunker's fictional address (704 Hauser Street) in All in the Family is
Corona-located"; and books Roger Sanjek's *The Future of Us All* and Steven Gregory's *Black Corona*.
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]` `[PARAPHRASE except quoted
fragments]`

**F152.** NYC Parks corroborates the Archie Bunker claim independently: Corona "was the fictional
abode of Archie Bunker in the popular '70s television sitcom 'All In The Family.'"
Source: https://www.nycgovparks.org/parks/corona-golf-playground/history

**F153.** LPC (2008) quotes Roger Sanjek directly: "According to Sanjek, 'Elmhurst-Corona underwent
its majority-minority transition in the 1970s. The neighborhood's white population fell from 98
percent in 1960 to 67 percent in 1970, 34 percent in 1980, and 18 percent in 1990.' He continues, 'By
1990 Elmhurst-Corona was 45 percent Latin American, 26 percent Asian, and ten percent black.
Established residents of German, Irish, Polish, Italian, Jewish, and other European ancestries now
lived among African, African American, Chinese, Colombian, Cuban, Dominican, Ecuadorian, Filipino,
Haitian, Indian, Korean, Mexican, Puerto Rican, and other new neighbors.'"
Source: LP-2283, quoting Roger Sanjek, *The Future of Us All: Race and Neighborhood Politics in New
York City*.
→ **Note that Sanjek's unit of analysis is "Elmhurst-Corona," not Corona. Directly relevant to the
arbitration.** Row in §L.

**F154.** LPC (2008): "Until about 1960, Corona was a predominantly white neighborhood with 98 percent
of its residents claiming various European ancestries. It was around this time that the demographics
of Corona began to shift, so much so that in 1992 New York's Department of City Planning called the
area 'perhaps the most ethnically mixed community in the world.'"
Source: LP-2283.

**F155.** NYC Parks: "Home to a predominantly Italian and Jewish population, Corona has experienced a
huge influx of Latin American immigrants since the end of World War II. Among its most famous
residents, the great jazz musician Louis Armstrong (1901-1971) lived here from 1943 until his death."
Source: https://www.nycgovparks.org/parks/corona-plaza/history

**F156.** Wikipedia's present-day demographic sentence: "The majority Hispanic community now consists
of Dominicans, Colombians, Ecuadorians, Salvadorans, Guatemalans, Bolivians, Peruvians, Mexicans,
Venezuelans, and Chileans. There are also Asian Americans (Chinese, Indians, Koreans, Filipinos, and
Japanese) as well as Italian Americans and African Americans."
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR — the article itself tags this
passage "[citation needed]"]`
→ **The verifier should note that Wikipedia flags its own sentence as uncited.**

---

## §H — Parks and playgrounds (all NYC Parks Historical Signs Project)

### P31 — William F. Moore Park ("Spaghetti Park")

**F157.** "This triangle was mapped as parkland in 1922 and acquired by the City by condemnation in
1924. Originally known as Corona Heights Triangle, in 1929 it was renamed to commemorate Wiliam F.
Moore, reported to be the first neighborhood soldier killed in World War I."
`[The misspelling "Wiliam" is in the source.]`
Source: https://www.nycgovparks.org/parks/william-f-moore-park/history

**F158.** "The park was renovated in 1980, including a bocce court and new lights. It was unofficially
referred to as 'Spaghetti Park' by the community, which was formerly made up of Italian descendants."
Source: same.

**F159.** "William F. Moore (1897–1918) was a Marine private killed in battle during World War I
(1914-1918). A graduate of PS 17, Moore grew up nearby on the corner of 103rd Street and Corona
Avenue. Moore enlisted in the Marine Corps in April 1917 and was killed in 1918 while serving with the
47th Company, Fifth Regiment at Belleau Wood in France, in one of the bloodiest engagements fought by
the United States during the war. The flagstaff's engraved granite base commemorates Moore and his
valiant sacrifice."
Source: same.

**F160.** "Local law named the southern tip of the park Joseph Lisa Memorial Place after Joseph Lisa,
Sr. (1898–1977), Democratic District Leader from Corona from 1950 to 1976. A tablet honors his work in
the community." And: "After 1929 a 40-foot strip of land along 51st Avenue was taken from the park to
widen the street."
Source: same. → Joseph Lisa Memorial Place is a named sub-place (P32).

**F161.** Park record fields, verbatim: "Zip Code: 11368 / Community Board: 4 / Council Member: Shanel
Thomas-Henry / Park ID: Q029 / Acreage: 0.20 / Property Type: Neighborhood Park".
Source: same.

### P33 — Corona Golf Playground

**F162.** "The City of New York acquired the property for Flushing Meadows Park in two parcels: on
July 7, 1934, and May 15, 1936 -- and immediately conveyed both parcels to Parks which then built a
golf course on the property. In the late 1930s, Parks developed the land into a recreational facility
for all ages. Soon thereafter, this playground opened, equipped with an auditorium, swimming, and
wading pools, a field house, ball fields, and a playground containing swings, slides, and gymnastic
equipment."
Source: https://www.nycgovparks.org/parks/corona-golf-playground/history

**F163.** "This park was officially part of Flushing Meadows-Corona Park, site of the 1939 World's
Fair grounds. In February 27, 1980, when it was reassigned to conform with coterminous districts, it
became an independent park. A local law named it Corona Golf Playground."
Source: same. → **A rare, clean case of a piece of FMCP being legally separated from FMCP. Useful:
this park is unambiguously Corona's and unambiguously NOT owned by CitiFieldPlaces.**

**F164.** "Bounded by 109th Street, 46th Avenue, and 47th Avenue, Corona Golf Playground is equipped
with several basketball courts, a big open play area, two handball courts, three jungle gyms, two
box-ball courts, and a public restroom. It also boasts swings, slides, benches, game tables, London
planetrees, and dolphin and turtle statues, which create an aquatic atmosphere a flagpole, and a
yardarm that flies the American, City of New York, and Parks flags."
Source: same. Park record: "Park ID: Q450 / Acreage: 1.72 / Community Board: 4".

**F165.** "In 1998, Council Member Helen M. Marshall funded a $234,911 reconstruction of Corona Golf
Playground, laying down new safety surfacing and repairing the park's facilities."
Source: same.

### P34 — Josephine Caminiti Playground (formerly Alstyne Playground / Corona Playground)

**F166.** "This playground is named for adjacent Alstyne Street; the reason for the street naming is
unfortunately obscure. Before this parkland was renamed by Commissioner Stern, it was called Corona
Playground, after the surrounding neighborhood of Corona."
Source: https://www.nycgovparks.org/parks/josephine-caminiti-playground/history

**F167.** "The City purchased this property from the Camager Corporation for $42,750, in April 1930
and immediately assigned the property to Parks. The playground was officially opened to the public in
October 1934… One of the most significant features of the playground was its unusual roller-skating
track, which followed the circumference of the property. There was a public restroom complete with
mother's room, director's room, and an indoor playroom, which enabled children to enjoy the park even
in inclement weather."
Source: same. Park record: "Park ID: Q046 / Acreage: 0.40 / Community Board: 4".

**F168.** "Between 1998 and 1999, a $325,000 contribution from Council Member Helen M. Marshall funded
the park's reconstruction. Now, visitors may enjoy the park's colorful jungle gym, decorated with
horses and clown figures… a large public restroom and a plethora of shaded benches and picnic tables
make Alstyne Playground an asset to the Corona community."
Source: same.
→ **NOTE:** the sign's headline reads "Josephine Caminiti Playground / Alstyne Playground," and the
body text never explains who Josephine Caminiti was. `[GAP]`

### P35 — Louis Simeone Park

**F169.** "This park honors Corona community activist Louis F. Simeone (1920-1984). Simeone was raised
in Corona, Queens, attending St. Leo's Parochial School, Laughlin High School, and St. John's
University, earning a degree in accounting. Soon after graduating St. John's, he opened his own
accounting and insurance firm in Corona, the Simeone Agency."
Source: https://www.nycgovparks.org/parks/simeone-park/history
→ Independent attestation of **St. Leo's Parochial School (P36)**.

**F170.** "Active in many civic organizations, Simeone was a member of the Lions Club, Community Board
4, and Community School Board 24, both of which he chaired. During his years of service on Community
Board 4, Simeone was active in the fight for increased senior housing in the neighborhood of Corona…
At the time, HPD had jurisdiction over the property, and they reached an agreement by which the
Transport Workers Union (TWU)… would care for and maintain the park. As a result this site became
known as TWU Park for a time. On December 19, 1997, the City assigned the property to NYC Parks. Parks
Commissioner Stern renamed the park Louis Simeone Park in 1998."
Source: same. Park record: "Park ID: Q474 / Acreage: 1.78 / Community Board: 4".

**F171.** "In 2017 – 2018, Louis Simeone Park was reconstructed with new pavement, drainage, benches,
game tables, fencing, fitness equipment and plantings throughout the park. This site is part of Parks'
Community Parks Initiative —a multi-faceted program to invest in under-resourced public parks and
increase the accessibility and quality of parks throughout the five boroughs."
Source: same.

### P37 — Hinton Park (and the Corona Congregational Church, P38)

**Additional facts, continuing the numbering into the appendix.** The Hinton Park sign is the only
source I found for the Corona Congregational Church:

- "This park honors Reverend George Warren Hinton (1880-1969), a dedicated pastor and active
  community member. Born in North Carolina, Hinton moved to Queens as a young man. There he served
  for 41 years as the reverend of the Corona Congregational Church."
- "Hinton was a distinguished member of the Queens Council for Social Welfare, where he served as
  both its vice-president and director during his 25 years there. He was an 18-year elected member of
  the Queens Tuberculosis and Health Association Council… In addition, he was a member of the Queens
  Fair Employment Practices Against Discrimination, a moderator for the Home Missionary Committee of
  the New York Association of Congregational Churches, and a member of the lay board of Elmhurst City
  Hospital, where he had also served a term as chaplain."
- "Among these honors were awards from President Franklin D. Roosevelt, President Harry S. Truman,
  and several awards from the State of New York."
- "The City acquired the Hinton Park land, bounded by Pell Avenue, 34th Avenue, and 113th and 114th
  Streets, on October 26, 1961. The land was intended for a Limited Division Housing Project by the
  name of Meadow Gardens. The project failed to receive approval, and the property was transferred to
  Parks. The Triborough Bridge and Tunnel Authority funded the construction of the park, which was a
  replacement for the nearby Flushing Meadows-Corona Park Playground, eliminated for the widening of
  the Grand Central Parkway during the 1964 World's Fair. A 1976 local law named the park in honor of
  Reverend Hinton."
- "The main section of Hinton Park lies across the street from P.S. 134, the Louis Armstrong School."
- "In 1997, Council Member Helen M. Marshall funded a $628,159 reconstruction of the sitting areas at
  Hinton Park. In October 1999, the City added a nearby 0.06-acre triangle to the park."
- Park record: "Zip Code: 11368 / Community Board: 3 / Park ID: Q410 / Acreage: 3.73".

Source: https://www.nycgovparks.org/parks/hinton-park/history
→ **CONFLICT:** NYC Parks says "P.S. 134, the Louis Armstrong School"; Wikipedia's Corona school list
says "PS 143 (Louis Armstrong)". These may be two different schools or one error. Recorded, not
resolved. Rows in §L not needed (both are Corona) but the school identity must be pinned. (P39)
→ Hinton Park's boundary streets (Pell Avenue, 34th Avenue, 113th–114th Streets) are at the Corona /
East Elmhurst edge. Row in §L.

### P40 — Louis Armstrong Playground

The NYC Parks page for Louis Armstrong Playground has a "History" tab but **no historical-sign text
posted** — the page renders empty of narrative. Record fields only: "Zip Code: 11368 / Community
Board: 3 / Park ID: Q415 / Acreage: 1.08 / Property Type: Jointly Operated Playground."
Source: https://www.nycgovparks.org/parks/louis-armstrong-playground/history
→ `[GAP]` No narrative available. Do not invent one.

### P41 — Park of the Americas

Same situation: the History tab is empty of sign text. Record fields: "Zip Code: 11368 / Community
Board: 4 / Park ID: Q026 / Acreage: 3.08 / Property Type: Neighborhood Park."
Source: https://www.nycgovparks.org/parks/park-of-the-americas/history
→ Wikipedia connects it to the vanished Linden Pond (F51). `[GAP]` The name "Park of the Americas" is
evocative and almost certainly has a story; I could not retrieve it.

### P42 — Corona Plaza (NYC Parks property Q172, a.k.a. National Plaza)

**F (see §B, F26, F39, F46 for the historical text).** Additional, verbatim:
"The City acquired this property, nestled underneath the Corona Plaza elevated train stop at the
intersection of National Street and Roosevelt Avenue, in 1917 upon condemnation of sections of
Roosevelt Avenue. Parks was then assigned jurisdiction in order to create a public park. Originally
named Corona Plaza in 1928, the site was renamed National Plaza by Commissioner Stern in 1985.
National Plaza supports a handful of trees, shrubs, and potted flowers and attracts local vendors
selling artwork and other products. It is part of the Greenstreets project, a collaboration between
Parks and the Department of Transportation initiated in 1986 and revived in 1994."
Park record: "Zip Code: 11368 / Community Board: 4 / Park ID: Q172 / Acreage: 0.04 / Property Type:
Triangle/Plaza."
Source: https://www.nycgovparks.org/parks/corona-plaza/history

### P43 — Corona Plaza (the DOT pedestrian plaza) — DISTINCT FROM P42

Wikipedia: Corona Plaza is "Located at Roosevelt Avenue and National Street. Originally an
underutilized truck route, it was 'first transformed in 2012 as a temporary plaza' and 'fully
implemented in early 2018 at a cost of around $5.6 million.' Features performance space, seating,
lighting, plants, drinking fountain, and bike racks."
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]` `[PARAPHRASE except quoted
fragments]`
→ **I could not reach any NYC DOT page on Corona Plaza: nyc.gov/html/dot/html/pedestrians/corona-plaza.shtml
returned 404 and the DOT Plaza Program page returned 403 to both WebFetch and urllib.** `[GAP]`
→ **FLAG for the verifier: P42 (NYC Parks "Corona Plaza" / "National Plaza," 0.04 acres, renamed 1985)
and P43 (the DOT pedestrian plaza opened 2012/2018) are two different public spaces at the same
intersection with the same popular name.** Do not let the writer merge them. This is exactly the kind
of collapse that produces a Critical.

---

## §I — Flushing Meadows Corona Park: what the sources say, and where the firewall falls

Everything in this section is recorded so the verifier can see the shape of the exclusion. **The
writer's move is a link to `/g/citi-field-guide`, not narration.**

From the NYC Parks FMCP historical sign
(https://www.nycgovparks.org/parks/flushing-meadows-corona-park/history), verbatim:

- "In the 1930s, engineer Joseph F. Shagden approached a group of businessmen to organize the 1939-40
  World's Fair. NYC Parks Commissioner Robert Moses (1888–1981) saw potential to rehabilitate the land
  and create Flushing Meadows Park after the fair ended. The fair, with its theme 'The World of
  Tomorrow,' was a critical if not financial success."
- "The site was laid out with Beaux Arts radiating pathways inspired by the 1893 Columbian Exposition
  in Chicago, natural areas, and recreational fields. In the year following the fair, 10,000 trees
  were planted at the site."
- "Several features from the 1939-40 World's Fair era survive, including Meadow Lake and its
  boathouse, nearby Willow Lake, and the New York City Building (now the Queens Museum and formerly the
  United Nations' headquarters from 1946 to 1950)."
- "Moses tried again to realize the grand vision for Flushing Meadows when the site hosted the 1964–65
  World's Fair—its theme, 'Peace Through Understanding'."
- "The park is home to 11 major monuments, including Forms in Transit, The Rocket Thrower, and Freedom
  of the Human Spirit, all dating from the 1964 World's Fair. There are also two time capsules designed
  to last 5,000 years buried in the park, marked with a granite monument."
- "In 1967, the land—renamed Flushing Meadows Corona Park, now the largest in Queens—reverted to the
  City and was fully landscaped."
- "Each year Flushing Meadows Corona Park draws over nine million people from all over the world for
  both spectator and recreational activities."
- "The park is additionally supported by the Alliance for Flushing Meadows Corona Park, a
  private-public partnership."
- "This park gets its name from two adjacent communities, Flushing and Corona."

**Places named inside the park that are NOT among the eight owned by CitiFieldPlaces**, and are
therefore *technically* available but which I flag as high-risk for the writer:

- P44 Meadow Lake and its boathouse (1939-40 survivor)
- P45 Willow Lake
- P46 The Rocket Thrower (1964 sculpture)
- P47 Forms in Transit (1964 sculpture)
- P48 Freedom of the Human Spirit (1964 sculpture)
- P49 Terrace on the Park (named by Parks as a surviving 1964 structure)
- P50 The public marina at Flushing Bay ("built for the 1939 World's Fair but was expanded for the
  1964 World's Fair")
- P51 The two 5,000-year time capsules and their granite monument
- P52 Flushing Meadows Corona Park Aquatics Center & Ice Rink (named in the Parks "Know Before You Go"
  notice on the same page)
- P53 The Queens Night Market (F2; site "behind the New York Hall of Science")

→ **My recommendation to the verifier, offered as a recommendation and not a ruling:** every one of
P44–P53 sits inside a park whose marquee institutions are owned elsewhere, and several sit on the
Flushing side. The safest reading of "a marquee institution belongs to exactly ONE seed file" is that
FMCP as a whole is routed through /g/citi-field-guide. But three of these — Meadow Lake, Willow Lake,
and the Aquatics Center — are recreational infrastructure rather than institutions, and may be
defensible. **I am recording, not deciding.**

**Queens Night Market extra facts** (P53): Wikipedia infobox, verbatim field values: Venue "Flushing
Meadows-Corona Park"; Begins "April"; Ends "October"; Frequency "Annually"; Inaugurated "2015";
Attendance "20,000 nightly (2023)"; Coordinates 40°44′53″N 73°51′2″W.
Source: https://en.wikipedia.org/wiki/Queens_Night_Market `[AGGREGATOR]`
Its own site: "The Queens Night Market is a large, family-friendly open-air night market in Queens,
featuring over 100 independent vendors selling merchandise, art, and food and featuring small-scale
cultural performances, all celebrating the rich cultural diversity and heritage of NYC and Queens."
Schedule as posted: "Saturdays, 4PM - Midnight / APR. 18 - AUG. 22 / SEP. 19 - OCT. 31" and "SEASON
11". Source: https://www.queensnightmarket.com/

---

## §J — Libraries, civic institutions, community organizations

### P56 — Queens Public Library, Corona branch

Address, verbatim from QPL: "38-23 104 Street, Corona, NY 11368"; phone "(718) 426-2844". Hours as
posted: Tue 1–6, Wed 10–6, Thu 12–8, Fri 10–6; closed Sat/Sun/Mon. QPL's own boilerplate: visitors
can access "books, movies, music, free Wi-Fi, free computer workstations, classes, programs, and so
much more"; and "No matter who you are, where you're from, or where you want to go, at Queens Public
Library, we speak your language."
Source: https://www.queenslibrary.org/about-us/locations/corona
→ Wikipedia independently gives "Corona (38-23 104th Street)". `[AGGREGATOR]`

### P57 — Langston Hughes Community Library and Cultural Center

Address, verbatim from QPL: "100-01 Northern Boulevard, Corona, NY 11368". Hours: Tue 1–6, Wed 10–6,
Thu 12–8, Fri 10–6; closed Sat–Mon. QPL: the branch houses the "Black Heritage Reference Center of
Queens County."
Source: https://www.queenslibrary.org/about-us/locations/langston-hughes

Wikipedia adds detail I could not confirm at QPL: the Black Heritage Reference Center "houses ~30,000
volumes on African-American culture including 'The Schomburg Clippings File, an extensive microfiche
collection' and 'The UMI Thesis and Dissertation Collection' with 1,000+ doctoral/master
dissertations."
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]` `[PARAPHRASE except quoted
fragments]`
→ **This is the single most under-covered major institution in Corona and the best candidate in the
file after the two jazz houses.** The verifier should push for a QPL primary page on the Black
Heritage Reference Center specifically. `[GAP]`

### P58 — Queens Public Library, LeFrak City branch

Wikipedia lists "LeFrak City (98-30 57th Avenue)" as one of QPL's three Corona branches.
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`
→ **CONTESTED — see §L.** I did not fetch the QPL page for this branch. `[GAP]`

### Elmcor Youth & Adult Activities, Inc.

Elmcor's own site, verbatim: "At Elmcor, our work is reflected in our mantra, 'People for the People,'
because we consistently center the needs of the communities we serve. For over 59 years, Elmcor has
offered a wide array of valuable, life-changing activities and experiences for each participant who
walks through our doors, serving everyone from age 3 to 103." And: "Elmcor Youth & Adult Activities,
Inc. is a Queens, New York non-profit, multi-service organization of professionals providing a variety
of comprehensive programs that serve a broad and diverse spectrum of people, from preschool-aged
children to older adults."
Source: https://elmcor.org/

Elmcor's own locations list, verbatim addresses:
- "Recreation Building 33-16 108th Street, Corona, NY 11368"
- "Administration/Behavioral Health Building 107-20 Northern Blvd. Corona, NY 11368"
- "REHABILITATION OUTPATIENT 107-20 Northern Blvd. Corona, NY 11368"
- "ASTORIA OLDER ADULTS CENTER 98-19 Astoria Blvd. East Elmhurst, NY 11369"
- "ST. MARKS OLDER ADULTS CENTER 95-18 Northern Blvd. Corona, NY 11368"
- "Golden Phoenix 3 Lefrak Older Adults Center 96-05 Horace Harding Expressway Corona, NY 11368"
Source: https://elmcor.org/contact-us/
→ **Two §L rows here:** the "Astoria Older Adults Center" is at an East Elmhurst address, and the
"Lefrak Older Adults Center" is at a Horace Harding Expressway (LIE service road) address that Elmcor
itself calls **Corona**.

**Independent corroboration of Elmcor's age and its Corona/East Elmhurst identity:** LPC's 1988
Armstrong House report, note 31, records a plaque text: "Plaque from ELMCOR: 'East Elmhurst Corona
Area. Building a Better Community.'"
Source: LP-1555.
→ **"ELMCOR" is literally a portmanteau of East ELMhurst and CORona.** This is the best single piece
of evidence in the file that Corona's institutions do not respect the neighborhood line.

### The Corona East Elmhurst Preservation Society

Attested by LPC (F102) as a testifying party at the 2023 Gillespie hearing. No website retrieved.
`[GAP]`

### Schools (P39 and others)

Wikipedia's list, verbatim: elementary — "PS 14 Fairview", "PS 16 (Nancy Debenedittis School)",
"PS 19 (Marino Jeantet)", "PS 28 (Thomas Emanuel Early Childhood Center, PK–2)", "PS 92 (Harry T.
Stewart Sr., PK–5)", "PS 143 (Louis Armstrong)", "Pioneer Academy"; middle/high — "IS 61 (Leonardo da
Vinci, grades 6–8)", "High School for Arts and Business (9–12)", "Corona Arts & Sciences Academy
(6–8)".
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`
→ Conflicts with NYC Parks' "P.S. 134, the Louis Armstrong School" (§H, P37). Recorded, not resolved.
→ Wikipedia (Tiffany glass) separately names "The Louis Tiffany School, New York City P.S. (public
school) 110Q" on the old Tiffany factory site (F54) — a third school not on Wikipedia's own Corona
list. Recorded, not resolved.
→ St. Leo's Parochial School and Laughlin High School are attested by NYC Parks (F169).

---

## §K — Churches and food businesses

### Churches

**Diocese of Brooklyn parish directory** — parishes it places in Corona, with exact addresses:
- **St. Leo** — "104-05 49th Avenue, Corona, NY 11368", (718) 592-7569
- **Our Lady of Sorrows** — "104-11 37th Avenue, Corona, NY 11368", (718) 651-5682
- **St. Paul the Apostle** — "98-16 55th Avenue, Corona, NY 11368", (718) 271-1100
Source: https://dioceseofbrooklyn.org/parishes/
→ **St. Paul the Apostle at 98-16 55th Avenue sits in the LeFrak City block grid. §L row.**

Wikipedia's church claims, verbatim:
- "Antioch Baptist Church at 103rd Street and Northern Boulevard is a prominent African American
  congregation dating to 1936 with a membership of 700."
- "Saint Leo Catholic Church, established in 1903 in what was once Sycamore Avenue and Elm Street, is
  a Roman Catholic church located at 104 Street and 49th Avenue in South Corona."
- "In North Corona there is Our Lady of Sorrows Roman Catholic Church at 104th Street and 37th Avenue
  was built in 1899 largely out of red brick with a nearby conv[ent]…" (truncated); the article
  elsewhere states it "burned January 4, 2015; rebuilt 2016" and the photo caption reads "The original
  Church of Lady of Sorrows, 37th Avenue, which burned in 2015."
- "Brazilian Adventist Church" is listed among Corona structures with no further detail.
Source: https://en.wikipedia.org/wiki/Corona,_Queens `[AGGREGATOR]`
→ I could not reach antiochbaptistchurchny.org (DNS failure) or stleoscorona.org (DNS failure).
`[GAP]` The verifier needs a primary source for Antioch Baptist Church, which on this evidence is one
of Corona's most significant Black institutions.
→ **Note Wikipedia's own internal terms "South Corona" and "North Corona"** — a fourth sub-name for
the neighborhood alongside "Corona Heights."
→ Corona Congregational Church is attested only via NYC Parks' Hinton Park sign (§H, P38); no address.
`[GAP]`

### Food businesses — DOHMH DISCLOSURE

**Read this before writing any restaurant.** I queried the DOHMH restaurant inspection dataset
(`43nn-pn8j`) for ZIP 11368. Below, each business is marked with the *only* sourcing I have.

| Business | Address (as sourced) | Sourcing | DOHMH-ONLY? |
|---|---|---|---|
| Park Side Restaurant | "107-01 Corona Avenue / Corona, NY 11368" | own website + DOHMH | **No** — has an independent primary source |
| The Lemon Ice King of Corona | "52-02 108th St, Corona, New York, 11368" | Wikipedia only | **No DOHMH record found**; aggregator-only |
| Tortillería Nixtamal | none retrieved | own website (no address on it) | address unsourced |
| The Birria on the Block | 104-02 NORTHERN BOULEVARD, 11368 | **DOHMH only** | **YES — DOHMH-ONLY** |
| ~35 other 11368 food businesses on 104th & 108th Streets | see below | **DOHMH only** | **YES — DOHMH-ONLY** |

**Park Side Restaurant (own website, verbatim):** "An Italian Landmark located in the heart of Corona,
Queens, Park Side Restaurant is truly a fine food destination that is worth the trip." "…considered
one of New York City's Best Italian restaurants for over 40 years." "Each visit to Park Side
Restaurant is an experience steeped in three generations of Italian hospitality." Address: "107-01
Corona Avenue / Corona, NY 11368"; phones (718) 271-9274 and (718) 271-9871; "Monday - Saturday:
12:00pm - 10:00 pm / Sunday: 1:00pm - 10:00pm".
Source: https://www.parksiderestaurantny.com/ and /contact-us/
DOHMH corroboration (verbatim row): `{"dba":"PARK SIDE","building":"107-01","street":"CORONA
AVENUE","zipcode":"11368","boro":"Queens","cuisine_description":"Italian","community_board":"404","nta":"QN25"}`
Source: https://data.cityofnewyork.us/resource/43nn-pn8j.json

**The Lemon Ice King of Corona (P — Wikipedia only):** infobox verbatim — Established "1944"; Owner
"Michael Zampino"; Previous owners "Nicola and Peter Benfaremo"; Food type "Italian ice"; Location
"52-02 108th St, Corona, New York, 11368"; Coordinates 40°44′36″N 73°51′18″W. Body: "Founded in 1944
by Nicola Benfaremo out of a garage, it is a long-standing business considered a neighborhood
institution, and gained international fame for its appearance in the opening credits of the sitcom The
King of Queens." "The shop was founded by Nicola Benfaremo in 1944, and inherited by Peter Benfaremo,
the 'Lemon Ice King', who partnered with his father to open a storefront in 1964 to coincide with the
New York World's Fair. It was later sold to former production worker Michael Zampino, while Peter
Benfaremo continued working there until his death in 2008." "The ices served by them are made in-house
and have a creamy, semi-solid texture despite the lack of any dairy ingredients, achieved by
small-batch churning."
Source: https://en.wikipedia.org/wiki/The_Lemon_Ice_King_of_Corona `[AGGREGATOR]`
→ **CONFLICT: this article says founded by *Nicola* Benfaremo; the Corona neighborhood article says
"Founded in 1944 by Peter Benfaremo."** Two Wikipedia articles disagreeing. Recorded, not resolved.
→ **NOT in the DOHMH dataset** under any of `%ICE KING%`, `%BENFAREMO%`, or an address search of 108
STREET in 11368. So the aggregator is the only source I have for a very famous place. The verifier
should find a primary or press source before it is written. `[GAP]`
→ I attempted thelemoniceking.com twice; it returns a TLS `TLSV1_UNRECOGNIZED_NAME` error to both
WebFetch and urllib. `[GAP]`

**Tortillería Nixtamal:** its own site describes the process in detail ("We cook the corn in water
with lime or cal (calcium hydroxide), just like the people from Mesoamerica did it for thousands of
years."; "We grind the corn with a stone grinder to make 'masa' (corn dough). Yes, we make fresh masa
everyday!") but **prints no street address on the pages I retrieved**, and it does **not** appear in
DOHMH ZIP-11368 results under `%TORTILL%` or `%NIXTAMAL%`.
Source: https://www.tortillerianixtamal.com/
→ `[GAP]` No sourced address. **Do not write an address for this business from memory.**

**Leo's Latticini / "Mama's of Corona":** I found **no source at all**. leoslatticini.com fails DNS;
no DOHMH row under `%LEO%` or `%LATTICINI%` in 11368. **Not a candidate on this evidence.** `[GAP]`

**DOHMH-ONLY businesses (full disclosure).** The following are attested *only* by the DOHMH restaurant
inspection dataset — name, address, cuisine code, community board and 2010-NTA code, and nothing else.
No history, no ownership, no press. Verbatim `dba`/`building`/`street`/`community_board`/`nta`:

CB 404 / NTA QN25 (Corona): CAFE 47 NY 47-04 108 ST; CALI TAJADAS BAKERY & RESTAURANT 45-18 104 ST;
CHIMITO'S 55-02 108 ST; CHUANG CHEF 55-27 108 ST; CORONA PIZZA 51-23 108 ST; DOUBLE CHINESE
RESTAURANT 53-16 108 ST; DUNKIN' BASKIN 54-01 108 ST; EL QUETZALITO 8 CORP 45-12 104 ST; K'S CAFETERIA
48-03 108 ST; LINDA AZOGUENITA BAKERY & RESTAURANT 51-01 108 ST; LORENAS FRUIT 50-20 108 ST; LUZ
NUTRITION 45-08 104 ST; MATECANA BAKERY & RESTAURANT 48-04 108 ST; MIO RIVERA'S BAKERY 45-10 104 ST;
NUTRI_SPOT593 46-17 104 ST; OUR BACKYARD CAFE 46-10 104 ST; VIDA FELIZ 47-09 104 ST.
CB 404 / NTA QN26 (North Corona): CORONA CORNER COFFEE 43-17 104 ST; EL CAFECITO DE MAMA 40-12 104 ST;
Elite 24 Nutrition 40-08 108 ST; LA NUEVA DELICIA PERUANA 43-07 104 ST; MAGICO AMANECER 40-18 108 ST;
VINICIO'S 40-21 108 ST.
CB 403 / NTA QN26 (North Corona): CORONA KING RESTAURANT & BAR 37-55 108 ST; DON JULIO BAR &
RESTAURANT 39-20 104 ST; ESTRELLA LATINA 39-07 104 ST; GIANT NUTRITION 38-16 108 ST; HEALTHY SNACK
36-09 108 ST; LA MONTANA 33-13 108 ST; LUCKY STAR CHINESE RESTAURANT 39-03 104 ST; M&J ACCOUNTING AND
TAX INC. 39-06 108 ST; NUEVA AMBATENITA LA ESQUINA DEL SABOR 39-24 108 ST; PALO BAR 38-12 104 ST; PAN
DE CASA BAKERY 39-06 108 ST; SALUD ES VIDA (HEBALIFE) 39-24 108 ST; STEPHANIE'S MEXICAN BAKERY 37-56
108 ST; TIENDA GUATEMALTECA SABOR CHAPIN 38-22 108 ST; THE BIRRIA ON THE BLOCK 104-02 NORTHERN BLVD.
Source: https://data.cityofnewyork.us/resource/43nn-pn8j.json (ZIP 11368, streets "104 STREET" and
"108 STREET", plus name-pattern queries)

→ **CONSTRAINT the verifier must enforce:** for every one of these, the only source is a DOHMH
inspection dataset. That supports "this business exists at this address and serves this cuisine
category" and **nothing else**. No founding dates, no family stories, no superlatives.
→ **Useful byproduct:** the `community_board` and `nta` fields in this dataset are a second,
independent geocoded confirmation of the CB3/CB4 and Corona/North Corona split established in F3 and
F7. The 108th Street corridor crosses from CB 403 into CB 404 between the 40s and the 45s blocks.

---

## §L — CONTESTED NEIGHBORHOOD ASSIGNMENTS (record only — do not resolve)

Every row is a place or feature that at least one source assigns to a different one of
Corona / Elmhurst / Forest Hills / Rego Park (or to East Elmhurst, Jackson Heights, or Flushing).

| # | Place | Street address | What each source says |
|---|---|---|---|
| L1 | **Corona itself** | — | DCP NTA: **two** NTAs, `QN0402 Corona` in **CD 4 (Elmhurst-Corona)** and `QN0303 North Corona` in **CD 3 (Jackson Heights-East Elmhurst)**. Wikipedia: "mostly part of Queens Community District 4", section north of Roosevelt Ave in CD 3. NYC Parks assigns CB 3 to Louis Armstrong Playground and Hinton Park, CB 4 to the six southern parks. |
| L2 | **LeFrak City** | Junction Blvd / 57th Ave / 99th St / LIE | Wikipedia: "the southernmost region of **Corona** and the easternmost part of **Elmhurst**"; "part of Queens Community Board 4". Elmcor's own site gives a LeFrak-area address as **"96-05 Horace Harding Expressway Corona, NY 11368."** Wikipedia's Kool G Rap footnote treats them as separate: "the lyricist from **Lefrak City and Corona, Queens**." |
| L3 | **QPL LeFrak City branch** | 98-30 57th Avenue | Wikipedia lists it as one of three **Corona** branches. Its address is inside LeFrak City (L2). Not independently checked at QPL. |
| L4 | **St. Paul the Apostle Church** | 98-16 55th Avenue | Diocese of Brooklyn directory: **"Corona, NY 11368."** Address sits in the LeFrak City / LIE block grid that other sources call Elmhurst or Rego Park. |
| L5 | **Congregation Tifereth Israel** | 109-18 54th Avenue | LPC (LP-2283) `NEIGHBORHO` field: **Corona**; report calls it "The oldest active synagogue in **Corona**." But the hearing record lists a support letter from **"Queens Community Board 3 Chairman Martin Maier"** while the site is in CB 4 territory. LPC also notes the park is "less than one block" away. |
| L6 | **Fire Engine Co. 289 / Ladder Co. 138** | 97-28 43rd Avenue | LPC `NEIGHBORHO`: **Corona**; report: "one of **Corona's** most prominent public buildings." Same report: its 1843 predecessor was "founded in Newtown (**now Corona and Elmhurst**)". |
| L7 | **Engine Co. 324 / Satellite 4 / Division 14** | 108-01 Horace Harding Expressway | Wikipedia lists it under **Corona**. The Horace Harding Expressway is the LIE service road — the Corona / Rego Park / Forest Hills seam this wave contests. |
| L8 | **Louis Armstrong House** | 34-56 107th Street | LPC ArcGIS `NEIGHBORHO`: **"North Corona."** LPC report body: "located in **Corona**, Queens." Wikipedia: "the **Corona** neighborhood." Museum's own site: "a quiet residential neighborhood in **northern Queens**." |
| L9 | **Dizzy Gillespie Residence** | 105-19 37th Ave (aka 34-68 106th St) | LPC ArcGIS `NEIGHBORHO`: **"North Corona."** LPC report: "Located in **Corona**, Queens." |
| L10 | **Junction Boulevard station** | Junction Blvd & Roosevelt Ave | Wikipedia infobox locale, verbatim: **"Corona, Elmhurst, Jackson Heights"** — three neighborhoods, two of them in this wave. |
| L11 | **Mets–Willets Point station(s)** | FMCP | Wikipedia: "multiple train stations in the **Flushing Meadows** neighborhood of Queens." Wikipedia's Corona article nonetheless lists Mets–Willets Point among Corona's four subway stations. Also the station for Citi Field, an owned place. |
| L12 | **Corona Yard** | connects at 111th St | Named "Corona Yard," but I could not retrieve its address; its physical location may be in Willets Point / Flushing Meadows rather than Corona. Unresolved. |
| L13 | **Elmhurst Station post office** | 59-01 Junction Boulevard | Wikipedia: one of the "two post offices in **Corona**" — but it is *named* **Elmhurst** Station and sits on Junction Blvd. |
| L14 | **110th Precinct NYPD** | 94-41 43rd Avenue | Wikipedia lists it as patrolling **Corona**. The address is in the 94-block range usually read as Elmhurst/Jackson Heights. |
| L15 | **115th Precinct NYPD** | 92-15 Northern Boulevard | Wikipedia lists it as patrolling **Corona**. 92-block Northern Blvd is usually read as Jackson Heights / East Elmhurst. |
| L16 | **Elmcor — Astoria Older Adults Center** | 98-19 Astoria Blvd | Elmcor's own site: **"East Elmhurst, NY 11369."** But the parent organization ELMCOR is a Corona institution and its name means "East Elmhurst Corona." |
| L17 | **Elmcor — Lefrak Older Adults Center** | 96-05 Horace Harding Expressway | Elmcor's own site: **"Corona, NY 11368."** Same seam as L2 and L7. |
| L18 | **Bob Moses residence** | 108-63 Ditmars Boulevard | Wikipedia lists Moses under **Corona** notable residents, but Ditmars Blvd at 108th St is an **East Elmhurst** address. |
| L19 | **Backus Lake (former)** | 98th Street & 31st Avenue | Wikipedia lists it among **Corona's** historic kettle ponds; 31st Ave at 98th St reads as **East Elmhurst / Jackson Heights**. |
| L20 | **Hinton Park** | Pell Ave, 34th Ave, 113th–114th Sts | NYC Parks: ZIP 11368, **Community Board 3**. Sits at the Corona / East Elmhurst edge; the sign's honoree pastored the **Corona** Congregational Church but sat on the lay board of **Elmhurst** City Hospital. |
| L21 | **"Elmhurst-Corona" as a single unit** | — | LPC (LP-2283) quotes Roger Sanjek analysing **"Elmhurst-Corona (or Queens Community District No. 4)"** as one neighborhood throughout. DCP's CDTA name is literally `QN04 Elmhurst-Corona`. Two authorities treat the pair as one place. |

---

## §M — Internal source conflicts that are NOT about neighborhood boundaries

Recorded so the verifier can rule on each before the writer picks a version.

1. **Corona name origin** — five incompatible accounts (F23–F28): LPC 1872; LPC 1873; Parks/Corona
   Golf 1872 by village decision; Parks/Corona Plaza 1872 to distinguish from Flushing, after
   Hitchcock's 1867 land purchase; Parks/FMCP "late 1800s," from Italian immigrants and the Crown
   Building Company; Wikipedia's third theory of postmaster Thomas Waite Howard petitioning in 1870.
2. **Indigenous naming** — Munsee (LPC ×2, Parks/Moore Park) vs Matinecock (Parks/FMCP). F16–F18.
3. **Railroad arrival** — 1853 (LPC ×2) vs 1854 (Parks ×2, Wikipedia). F31–F32.
4. **Hitchcock's arrival** — "called the Village of West Flushing in 1854" (LPC 1987) vs "In 1867…
   buying 1200 parcels" (Parks). F26, F29.
5. **Fashion Course closure** — 1866 (Parks) vs 1871 railroad routing (Wikipedia). F39, F45.
6. **First paid baseball admission** — "in 1858" generally vs specifically the third game, Sept 10,
   1858. F43–F44.
7. **Tiffany factory dates** — "opened a major factory in Corona in 1893" (LPC ×2) vs "at 96–18 43rd
   Avenue in Corona, Queens from 1901 to 1932" (Wikipedia) vs "By late 1892 or early 1893, Tiffany
   built a glasshouse in Corona" (Met, quoted via Wikipedia). F52, F54, F55.
8. **Armstrong House NHL year** — 1976 (Wikipedia/NHL summary) vs "National Historic Landmark, 1977"
   (LPC's own photo caption). F78–F79.
9. **Armstrong House NYC landmark year** — Dec 13 1988 (LP-1555 header + ArcGIS DesDate) vs "1985"
   (LP-2657). 1985 was the hearing year. F71, F80.
10. **Armstrong museum street number** — 34-49 (museum About page) vs 34-56 (museum Visit page, LPC,
    Wikipedia). F88.
11. **Sanford's middle initial** — Edward **E.** Sanford (LPC summary + ArcGIS LPC_NAME) vs Edward
    **R.** Sanford (LPC history section). F108.
12. **NYC Jewish population** — "1.3 million… in 1913" vs "1.5 million… in 1918", in the same LPC
    report. F128.
13. **Estée Lauder's birth year** — 1908 (LPC) vs 1906 (Wikipedia). F123.
14. **Dorie Miller address** — "11-23 Northern Boulevard" (LPC 2023) is inconsistent with every other
    Corona Northern Blvd address in the corpus (100-01, 107-20, 95-18, 104-02). F145.
15. **The Louis Armstrong school** — "P.S. 134, the Louis Armstrong School" (NYC Parks) vs "PS 143
    (Louis Armstrong)" (Wikipedia). §H P37, §J.
16. **Lemon Ice King founder** — Nicola Benfaremo (Wikipedia, dedicated article) vs Peter Benfaremo
    (Wikipedia, Corona article). §K.
17. **Two different "Corona Plaza"s** — the 0.04-acre NYC Parks triangle renamed National Plaza in
    1985, and the DOT pedestrian plaza built 2012/2018. P42 vs P43.

---

## §N — Known gaps (things a Corona page probably needs that I could NOT source)

1. The size and contents of the **Louis Armstrong Archives** (F92). Biggest hole in the file.
2. **"Selma's Place,"** the museum's third building (F82).
3. Any **NPS primary page** for the Armstrong House NHL designation — both nps.gov URLs failed (F79).
4. The **Neustadt Collection's "Tiffany in Queens"** page (F57) — almost certainly the best account of
   the Corona glass factory.
5. Any **NYC DOT** page on Corona Plaza (F/P43) — 404 and 403.
6. A primary source for **Antioch Baptist Church** (DNS failure).
7. A primary source for **St. Leo's** and **Our Lady of Sorrows** beyond the diocesan directory
   listing; the 2015 fire and 2016 rebuild are aggregator-only.
8. The **Corona Congregational Church** — attested only via a park sign; no address, no status.
9. The former **Corona yeshiva on 53rd Avenue** (F122) — a standing building with Star of David
   brickwork and no street number.
10. The lost **El Dorado, Hyperion and Park Theaters** (F118) — no addresses.
11. The closed **LIRR Corona station** (F59) — aggregator-only.
12. **Corona Yard** — no address retrieved.
13. **Park of the Americas** and **Louis Armstrong Playground** — NYC Parks has no posted sign text.
14. **Josephine Caminiti** — the park's own sign never says who she was.
15. Addresses for **Tortillería Nixtamal**; anything at all for **Leo's Latticini**.
16. Ridership/《MTA station-facility primary data — the data.ny.gov station datasets I tried
    (`39hk-dan6`, `wujg-7c2s`) returned 404/wrong schema. Station facts are Wikipedia-only.
17. **SABR / John Thorn** primary accounts of the 1858 Fashion Course games (F43).

---

*End of finder file. 171 candidate facts, 58 candidate places, 21 contested-assignment rows,
17 non-boundary source conflicts, 17 declared gaps. Nothing above is confirmed.*
