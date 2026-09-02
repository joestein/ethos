# Sunnyside, Queens — FINDER candidate file

**Role:** Finder. Nothing here is verified, confirmed, or adjudicated. Every line below is a
CANDIDATE awaiting a separate verifier. No verdicts are recorded and none should be inferred from
the ordering or from the amount of detail attached to any item.

**Quoting convention used throughout (read this before using any line):**
- Text inside `"…"` and marked **[Q]** is presented as the source's own wording.
- Text marked **[P]** is MY PARAPHRASE. It is not the source's wording.
- Text marked **[Q-2nd]** is a quotation that reached me through an intermediary summarizer
  (the fetch tool's extraction layer) rather than from raw source text I read myself. I have NOT
  compared these character-by-character against the source. Treat every **[Q-2nd]** as a
  paraphrase-grade claim until the verifier re-reads the source directly.
- **[Q]** is used ONLY where I read the raw source text myself (the LPC PDFs, and the JSON API
  payloads). Everything from an HTML page fetch is **[Q-2nd]**.

**Research constraint disclosure:** the WebSearch budget for this session was exhausted before I
issued a single Sunnyside query (200/200 used by earlier work). All material below was obtained by
fetching known URLs directly (WebFetch) or by pulling government open-data APIs and government PDFs
over HTTP. This biases coverage toward institutional sources I could name in advance and means
coverage of local news, oral history, and small businesses is thin. Several intended sources
returned 403/404 and are listed in §14 as gaps.

---

## 1. Source inventory

| ID | Source | URL | Type |
|----|--------|-----|------|
| S1 | NYC Landmarks Preservation Commission, *Sunnyside Gardens Historic District Designation Report*, LP-2258, June 26, 2007 | https://s-media.nyc.gov/agencies/lpc/lp/2258.pdf | Primary / institutional. Raw PDF text read directly. |
| S2 | NYC LPC, *Engine Company No. 258, Hook and Ladder Company No. 115* designation report, LP-2200, June 20, 2006 | https://s-media.nyc.gov/agencies/lpc/lp/2200.pdf | Primary / institutional. Raw PDF text read directly. |
| S3 | NYC Open Data — LPC Historic Districts (resource `skyk-mpzq`) | https://data.cityofnewyork.us/resource/skyk-mpzq.json?$q=Sunnyside | Primary government dataset. Raw JSON read directly. |
| S4 | NYC Open Data — Parks Properties (resource `enfh-gkve`) | https://data.cityofnewyork.us/resource/enfh-gkve.json | Primary government dataset. Raw JSON read directly. |
| S5 | NYC Open Data — 2020 Neighborhood Tabulation Areas (resource `9nt8-h7nd`) | https://data.cityofnewyork.us/resource/9nt8-h7nd.json?$q=Sunnyside | Primary government dataset (NYC Dept. of City Planning). Raw JSON. |
| S6 | NY State Open Data — MTA Subway Stations (resource `39hk-dx4f`) | https://data.ny.gov/resource/39hk-dx4f.json?line=Flushing | Primary government dataset. Raw JSON. |
| S7 | NY State Open Data — MTA Subway Entrances and Exits (resource `i9wp-a4ja`) | https://data.ny.gov/resource/i9wp-a4ja.json | Primary government dataset. Raw JSON. |
| S8 | NYC Open Data — DOHMH New York City Restaurant Inspection Results (resource `43nn-pn8j`) | https://data.cityofnewyork.us/resource/43nn-pn8j.json | Primary government dataset. Raw JSON. **Inspection dataset — see §12 warning.** |
| S9 | NYC Open Data — DOE School Locations (resource `wg9x-4ke6`) | https://data.cityofnewyork.us/resource/wg9x-4ke6.json | Primary government dataset. Raw JSON. |
| S10 | Thalia Spanish Theatre official site | https://www.thaliatheatre.org/ | Institutional (self-description). Via fetch summarizer. |
| S11 | Sunnyside Community Services official site | https://scsny.org/about-us/ | Institutional (self-description). Via fetch summarizer. |
| S12 | Sunnyside Gardens Park official site | https://www.sunnysidegardenspark.org/ | Institutional (self-description). Via fetch summarizer. |
| S13 | Queens Public Library — Sunnyside branch page | https://www.queenslibrary.org/about-us/locations/sunnyside-13 | Institutional. Via fetch summarizer. |
| S14 | Sunnyside Shines BID — About | https://www.sunnysideshines.org/about | Institutional (BID self-description). Via fetch summarizer. |
| S15 | allsaintssunnyside.org (now "The Episcopal Mission in Sunnyside") | https://allsaintssunnyside.org/ | Institutional. Via fetch summarizer. |
| S16 | Phipps Houses — Our History | https://www.phippsny.org/about-us/our-history/ | Institutional (developer's own history). Via fetch summarizer. |
| S17 | Cornell University Library, Division of Rare and Manuscript Collections — Clarence S. Stein papers finding aid (RMM03600) | https://rmc.library.cornell.edu/EAD/htmldocs/RMM03600.html | Primary archival finding aid. Via fetch summarizer. |
| S18 | Wikipedia, "Sunnyside, Queens" | https://en.wikipedia.org/wiki/Sunnyside,_Queens | **AGGREGATOR — lowest confidence tier.** Via fetch summarizer. |
| S19 | Wikipedia, "Sunnyside Gardens, Queens" | https://en.wikipedia.org/wiki/Sunnyside_Gardens,_Queens | **AGGREGATOR — lowest confidence tier.** Via fetch summarizer. |

Everything sourced only to S18/S19 is an aggregator claim and should be treated as a lead to chase,
not as a citable fact.

---

## 2. Official geography, boundaries, and administrative identity

**F001** [Q] NYC DCP's 2020 Neighborhood Tabulation Area file contains a NTA coded `QN0202` whose
`ntaname` is `"Sunnyside"` and whose `ntaabbrev` is `"Snnysd"`. Its parent CDTA is coded `QN02`
with `cdtaname` `"QN02 Long Island City-Sunnyside-Woodside (CD 2 Approximation)"`. — S5

**F002** [Q] The same DCP file contains `QN0203` `"Woodside"` and `QN0201` `"Long Island
City-Hunters Point"`, both also under `"QN02 Long Island City-Sunnyside-Woodside (CD 2
Approximation)"`. — S5
*(Finder note: Sunnyside and Woodside are therefore separate NTAs sharing one community district.
The exact NTA line between them is the boundary at issue in this wave. I am not resolving it.)*

**F003** [Q] DCP's 2020 NTA file splits the rail yard into two separate NTAs in two different
community districts: `QN0161` `"Sunnyside Yards (North)"`, `cdtaname` `"QN01 Astoria-Queensbridge
(CD 1 Equivalent)"`; and `QN0261` `"Sunnyside Yards (South)"`, `cdtaname` `"QN02 Long Island
City-Sunnyside-Woodside (CD 2 Approximation)"`. — S5
*(Finder note: the yard that gives Sunnyside its transportation identity is officially split
between Community District 1 (Astoria) and Community District 2. Record, do not resolve.)*

**F004** [Q] DCP's 2020 NTA file also codes `QN0271` `"Calvary & Mount Zion Cemeteries"` into
`QN02`. — S5

**F005** [Q] The NYC DOE School Locations dataset (fiscal year 2020) labels its NTA field for a
Community District 402 school with `"nta":"QN31"`, `"nta_name":"Hunters Point-Sunnyside-West
Maspeth"`. — S9
*(Finder note: this is the older 2010-vintage NTA naming, in which "Sunnyside" was bundled with
Hunters Point and West Maspeth rather than standing alone. Two different official NYC geographies
of "Sunnyside" therefore coexist in city datasets. Flag for the verifier.)*

**F006** [Q-2nd] Wikipedia states Sunnyside is bounded by "Hunters Point and Long Island City to
the west, Astoria to the north, Woodside to the east, and Maspeth and Newtown Creek to the south."
— S18 (**aggregator**)

**F007** [Q-2nd] Wikipedia attributes to *The Encyclopedia of New York City* a western boundary at
Van Dam Street and an eastern boundary at Calvary Cemetery/51st Street. — S18 (**aggregator, and a
second-hand attribution: the Encyclopedia itself was not consulted**)

**F008** [Q-2nd] Wikipedia attributes to a *New York Times* article boundaries at "39th Street to
the west, and to the east by 48th Street south of Queens Boulevard and 52nd Street north of Queens
Boulevard." — S18 (**aggregator; the NYT article itself was not consulted**)
*(Finder note: F006, F007 and F008 disagree with each other about the eastern edge — 51st St vs
48th/52nd St. This is exactly the Sunnyside/Woodside contest. Recorded, not resolved.)*

**F009** [Q] LPC's 2006 designation report for a Queens firehouse states: "Long Island City is
comprised of five separate neighborhoods: Ravenswood, Astoria, Steinway, Sunnyside, and Hunter's
Point." — S2
*(Finder note: this is a NYC agency, in a legally operative document, treating Sunnyside as a
constituent neighborhood **of Long Island City** rather than as a peer neighborhood. Major
contested-assignment datapoint. Do not resolve.)*

**F010** [Q] LPC's Sunnyside Gardens report describes the district's setting as "Sunnyside Gardens,
in northwestern Queens" and, in its findings, as "a unique planned residential community in
northwestern Queens". — S1

**F011** [Q] LPC's Sunnyside Gardens report describes the neighborhood context at the time of
purchase: "Woodside, further to the east, was already completely built up and Long Island City,
just to the west, was becoming an industrial center and a transportation hub." — S1

**F012** [Q-2nd] Wikipedia gives Sunnyside's ZIP codes as 11101, 11104 and 11377 and places it in
Queens Community District 2, NYPD's 108th Precinct, and the City Council's 26th District. — S18
(**aggregator**; note that CD 402 / Precinct 108 / Council District 26 are independently
corroborated in the Parks JSON, F026–F031)

**F013** [Q] NYC Parks property records for parks in the Sunnyside area carry `"communityboard":
"402"`, `"councildistrict": "26"`, `"precinct": "108"`, `"nys_assembly": "37"`, `"nys_senate":
"12"`. — S4

---

## 3. Name origin and pre-1900 history

**F014** [Q] LPC: "The area was called Sunnyside, after the name of a farm belonging to early
settlers (the Bragaw family) in the area." — S1

**F015** [Q-2nd] Wikipedia offers a competing derivation, saying the area was named after
"Sunnyside Hill," a Bragaw family estate at Dutch Kills established in 1690, and notes "An
alternative source traces the modern neighborhood's name to 'a roadhouse built on Jackson Avenue in
the 1850s and 1860s.'" — S18 (**aggregator; two competing name origins, unresolved**)

**F016** [Q-2nd] Wikipedia: Richard Bragaw built a gambrel-roofed house in 1790 and "the house was
demolished in July 1903". — S18 (**aggregator**)

**F017** [Q] LPC records the historic (pre-renumbering) street names of the district, which is
useful for archival research and for locating the neighborhood in 19th-century documents: 43rd
Street = "Laurel Hill Avenue"; 44th Street = "Locust Street"; 45th Street = "Packard Street"; 47th
Street = "Carolin Street"; 48th Street = "Gosman Avenue"; 49th Street = "Heiser Street"; 50th
Street = "Fitting Street"; 51st Street = "Stone Street"; 52nd Street = "Dickson Street"; 39th
Avenue = "Middleburg Avenue". — S1
*(Finder note: the LPC report writes 39th Avenue's historic name as "Middleburg Avenue" in most
places but once as "Middleberg Ave." — an internal inconsistency in the source, recorded as such.)*

**F018** [Q] LPC also refers to 43rd Avenue by a historic name: "between 43rd (Foster) and Skillman
Avenues". — S1

---

## 4. Sunnyside Yard and the railroads

**F019** [Q] LPC (2006): transit projects "critical to real estate development in Queens" included
"the opening of the Queensboro Bridge (1909, a designated New York City Landmark), tunnels linking
Manhattan with the vast Sunnyside Yards (1910), and the beginning of regular IRT subway service
(1915) to Corona, and later, Flushing." — S2

**F020** [Q] LPC (2006) on the yard's effect on the surrounding street fabric: these improvements
"creat[ed] barriers that isolated Hunter's Point from the rest of the borough, while making it
easier for commuters to reach new residential districts to the east, in Sunnyside, Jackson Heights,
and other neighborhoods." — S2

**F021** [Q] LPC (2007): "It was only after the construction of the Queensboro Bridge (1909), the
Long Island Railroad tunnel (1910), and the subsequent extension of the subway (1918) that supplied
rapid access to Manhattan, that significant development started in Queens." — S1
*(Finder note: S1 dates the subway extension to 1918; S2 dates regular IRT service to 1915;
Wikipedia (F022) says 1917. Three different dates across three sources. Recorded, not resolved.)*

**F022** [Q-2nd] Wikipedia: "The opening of the Queensboro Bridge in 1909 and the extension of the
Flushing Line subway across Queens Boulevard in 1917 made Sunnyside accessible to Manhattan". —
S18 (**aggregator**)

**F023** [Q-2nd] Wikipedia: Sunnyside Yard was built by the Pennsylvania Railroad and "opened in
November 1910, occupying 192 acres (78 ha) and containing 25.7 miles of track". — S18
(**aggregator; acreage and track mileage unverified against Amtrak or PRR records**)

**F024** [Q-2nd] Wikipedia: between 1907 and 1908 the railroad "leveled an approximately 200-acre
hill at 34th and 35th Streets and used the earth to fill some 250 acres of tidal marsh". — S18
(**aggregator**)

**F025** [Q-2nd] Wikipedia: the yard is now owned by Amtrak and shared with NJ Transit Rail
Operations, serving as "a staging facility for Amtrak and NJ Transit trains using Pennsylvania
Station". — S18 (**aggregator; EDC and Amtrak pages both returned 403 to me — see §14**)

**F026** [Q] LPC: the City Housing Corporation "purchased 76.67 acres of land, most from the Long
Island Rail Road with smaller amounts from other landowners." — S1
*(Finder note: this means the LIRR was the principal land seller for Sunnyside Gardens itself.)*

**F027** [Q] LPC: "the land was purchased at a low price, approximately 50 cents per acre." — S1
*(Finder note: this figure is implausible on its face for 1924 Queens land and is very likely a
typographical error in the LPC report itself — possibly for 50 cents per square foot. I am
recording the source's exact wording and flagging the anomaly, NOT correcting it. Verifier should
check the original page image.)*

**F028** [Q-2nd] Wikipedia: NYCEDC and Amtrak began a feasibility study for development above the
yard in 2017; a master plan released in March 2020 proposed "a 12,000-unit deck of affordable
housing above the active rail yard along with 60 acres of new public open space"; the plan "was not
advanced to construction during the de Blasio administration". — S18 (**aggregator; unverified**)

**F029** [Q-2nd] Wikipedia asserts that "Mayor Zohran Mamdani revived the proposal in March 2026."
— S18 (**aggregator; a recent-events claim on a live wiki page, which is the least reliable class
of aggregator content. Flag hard.**)

**F030** [Q-2nd] Wikipedia: the East Side Access 2001 environmental impact statement "contemplated a
Long Island Rail Road station at Queens Boulevard and Skillman Avenue," and the MTA's 2025–2044
20-year needs assessment "included a cost evaluation for a station at the same location to be
served by both the Long Island Rail Road and Metro-North Railroad." — S18 (**aggregator**)

---

## 5. Sunnyside Gardens — the landmark (strongest source in this file)

All of §5 is from S1, the LPC designation report PDF, whose raw text I read directly. These are
**[Q]** quotations.

**F031** [Q] Report identity: "SUNNYSIDE GARDENS / HISTORIC DISTRICT / Designation Report / New York
City Landmarks Preservation Commission / June 26, 2007". — S1

**F032** [Q] NYC Open Data's LPC Historic Districts record: `"lp_number": "LP-02258"`, `"area_name":
"Sunnyside Gardens Historic District"`, `"borough": "QN"`, `"status_of_": "DESIGNATED"`,
`"public_hea": "4/17/2007"`, `"desdate": "2007-06-26T00:00:00.000"`, `"caldate":
"2007-03-06T00:00:00.000"`, `"extension": "No"`. — S3

**F033** [Q] Summary: "Sunnyside Gardens, in northwestern Queens, was the creation of architects
Clarence Stein and Henry Wright and the City Housing Corporation led by developer Alexander Bing.
Constructed between 1924 and 1928, it consists of a series of twelve 'courts' (composed of rows of
townhouses and small apartment buildings), built on all or part of 16 blocks, a total of more than
600 buildings." — S1

**F034** [Q] "The designated area also includes the Phipps Garden Apartment buildings, two courtyard
apartment buildings constructed in 1931-32 and 1935, and Sunnyside Park." — S1

**F035** [Q] "This large complex is one of the most significant planned residential communities in
New York City and has achieved national and international recognition for its low-rise, low density
housing arranged around landscaped open courtyards." — S1

**F036** [Q] "The development at Sunnyside Gardens was the first practical application of the
architecture and planning concepts developed by the Regional Planning Association of America
(RPAA)." — S1

**F037** [Q] "This diverse group, brought together by Clarence Stein, met from 1923 to 1931 to
examine the roots of the country's housing crisis and try to find new approaches to providing
quality housing for low-income workers." — S1

**F038** [Q] "The concepts developed by this group at Sunnyside Gardens were improved and expanded
at their subsequent developments at Radburn, NJ and Chatham Village in Pittsburgh." — S1

**F039** [Q] Purchase and start of work: "In February 1924, the City Housing Corporation purchased a
large swath of undeveloped land in northeastern Queens, adjacent to the Bliss Street Station of the
city subway line, providing easy and quick subway access to other parts of New York City." — S1
*(Finder note: the LPC report says "northeastern Queens" here but "northwestern Queens" in F033 and
in the findings. An internal contradiction in the source. Recorded as-is.)*

**F040** [Q] "Construction began in April, two months after purchase of the land." — S1

**F041** [Q] Grid compromise: "Because they were building within New York City, the Queens Borough
Engineer insisted that the designers make their plans conform to the already established city grid.
This was a major compromise of their goals because Wright and Stein had planned to eliminate some
streets to create larger blocks in order to save costs." — S1

**F042** [Q] "Since they were not allowed to close the streets, Wright and Stein eliminated the lot
divisions and worked with entire city blocks as their units of planning, thus adapting the large
block ideas Raymond Unwin had used at Hampstead Garden Suburb." — S1

**F043** [Q] Footnote in S1: "The property, as laid out by the city, included more than 1100 lots."
— S1

**F044** [Q] First court: "Their first block was Colonial Court, between 43rd (Foster) and Skillman
Avenues, and 47th (Carolin) and 48th Streets (Gosman Ave.). This first unit built at Sunnyside had
six, six- and seven-family apartment buildings, grouped together in three sets of two buildings, 40
two-family houses, and eight one-family houses. Begun in early spring of 1924, it was finished by
the fall." — S1

**F045** [Q] Second court: "The second unit, Hamilton Court, was begun in the spring of 1925 and it
accommodated 225 families in three-family and single-family houses." — S1

**F046** [Q] "By May 1, 1926, the City Housing Corporation had constructed homes for approximately
600 families in one-, two- and three-family houses and cooperative apartment buildings." — S1

**F047** [Q] Completion: "by fall, 1928 they deemed Sunnyside Gardens complete. It provided
residences for more than 1,200 families covering, on average, 28% of the land, and leaving 671,000
square feet of property that they determined they did not need." — S1

**F048** [Q] Open space: "For the entire development, the total area of the common gardens is almost
six acres." — S1

**F049** [Q] "Contributing to the sense of openness is the fact that all the utilities were laid
underground. This was quite unusual at the time but it improved the visual unity of the community."
— S1

**F050** [Q] Landscape design: "Each court was laid out with a horticulturally unique garden intended
to engage the community in an 'experience of nature and landscape.' The designer Marjorie Cautley
believed that good landscape design could improve lives. She used a mix of native, non-native and
ornamental species in a natural setting". — S1

**F051** [Q] Cars: "Although automobiles were becoming increasingly popular when Sunnyside was
constructed, the architects chose to segregate cars and their garages from the main living areas of
the development." — S1

**F052** [Q] Garage locations: "a row of individual garages facing 43rd Street (Laurel Hill Ave.),
several small rows near the corner of 43rd Street and Barnett Avenue (not included in this historic
district), a row of individual garages located behind the rowhouses facing 39th Avenue (Middleburg
Ave.) between 51st (Stone St) and 52nd (Dickson St.) Streets". — S1

**F053** [Q] Construction standardization: "They were all 28'4" wide which was based on stock framing
lengths." and "No residence was more than two rooms deep in order to provide the maximum light and
cross ventilation to the living spaces." — S1

**F054** [Q] Financing: the City Housing Corporation's "goal was to raise an initial capitalization of
$5,000,000. By May 1926, the company had sold over $1,750,000 of stock to approximately 300
stockholders at $100 per share. In their fourth annual report, the 'Capital-Stock' was listed at
close to $3,000,000." — S1

**F055** [Q] "The executives and board members of the CHC were all investors in the company and for
many years (until the Depression) all the investors received a 6% return on their investments." — S1

**F056** [Q] CHC board included "Mrs. Franklin D. Roosevelt," and "All of the directors, as well as
the officers of the corporation, served without compensation." — S1

**F057** [Q] Total construction cost, given in a footnote: "Total cost for all buildings: $6,564,180."
— S1

**F058** [Q] Cost control: "economy of construction is achieved through simplicity of design and
through the use of common brick." — S1

**F059** [Q] The twelve named courts, per the report's table of contents: Carolin Gardens; Colonial
Court; Hamilton Court; Hamilton Court Apartments; Harrison Place; Jefferson Court; Lincoln Court;
Madison Court North and South; Monroe Court Apartments; Phipps Garden Apartments I; Phipps Garden
Apartments II; Roosevelt Court; Washington Court; Wilson Court. — S1
*(Finder note: the summary says "twelve 'courts'" (F033) but the table of contents lists fourteen
headings. This may be because Phipps I/II and Hamilton Court/Hamilton Court Apartments are counted
as single courts. Recorded as an apparent internal discrepancy; not resolved.)*

**F060** [Q] Paving materials: "All of the courts feature through-block and interior garden 'paths' or
slightly wider 'lanes,' paved with concrete or broken red or blue slate set in concrete." — S1

**F061** [Q] "The arrangement of buildings in Jefferson Court and Madison Court North, which are set
perpendicular to the established street grid, allow for wider paved service driveways that access
the rear of the buildings." — S1

**F062** [Q] Alterations: "Some interior garden paths are blocked or removed where individual owners
have fenced in their rear yards, including portions of the central garden space." — S1

**F063** [Q] Public hearing: "On April 17, 2007, the Landmarks Preservation Commission held a public
hearing on the proposed designation of the Sunnyside Gardens Historic District (Item No.1)… There
were 138 speakers in favor of designation… There were 27 speakers opposed to designation, including
representatives of the Sunnyside Gardens Coalition, Preserve Sunnyside Gardens, and the Institute
for Justice." — S1

**F064** [Q] Organizations testifying in favor included "the Municipal Art Society, the American
Association of Architects, Queens and New York Chapters, the Regional Planning Association, the
Historic Districts Council, the Richmond Hill Society, the Newbergh Colonial Terrace, the Greater
Astoria Historical Society, the Queens Preservation Council, Metropolitan Historic Structures, the
Radburn Historical Preservation Society, the Rego Park Preservation Council," plus representatives
of "State Assemblywoman Margaret Markey" and "Borough President Helen Marshall". — S1

**F065** [Q] "Speakers representing the Washington Court and the Harrison Place Associations testified
that a majority of their residents were in favor of designation." — S1

**F066** [Q] "After the record was closed, Councilmember Eric Gioia sent a letter in support of
designation." — S1

**F067** [Q] Special district: "in 1974, after the original easements had expired, the New York City
Planning Department declared Sunnyside to be a 'Special Planned Community Preservation District'".
— S1

**F068** [Q] Easements: "the CHC created a series of easements attached to the deeds to maintain the
original plan and design of the buildings and set aside central courtyard areas for communal use by
the residents of Sunnyside; … these easements lasted for forty years because of the demands of the
original mortgage holders". — S1

**F069** [Q] Depression-era activism, from the findings: "the organizations and sense of social
empowerment that developed at Sunnyside helped encourage the rent strikes that shook the community
during the Depression when the dire economic situation forced many people out of their homes". — S1

**F070** [Q] Findings on style: "the exterior house and apartment designs included some Colonial
Revival and Art Deco details, as well as simplified massing and decorative use of brick in an early
modern manner, inspired by the early twentieth century brick housing developments in northern
Europe". — S1

**F071** [Q] Findings on finance innovation: "Bing and the City Housing Corporation developed a unique
financing plan for Sunnyside Gardens that allowed its homes to be accessible to many people who
could not otherwise afford to purchase them; … this financial arrangement then became a standard
approach to home finance". — S1

**F072** [Q] Findings, closing: "Sunnyside Gardens remains a unique neighborhood in New York City with
an unusual layout and strong neighborhood identification among its residents." — S1

**F073** [Q] Boundary — start and finish of the designated district: "The Sunnyside Gardens Historic
District consists of the property bounded by a line beginning at the northeast corner of Skillman
Avenue and 43rd Street (Laurel Hill Avenue) … westerly along the northern curbline of Skillman
Avenue, to the point of beginning, Borough of Queens." — S1
*(The full metes-and-bounds description runs roughly two printed pages; it reaches east to the
western curbline of 52nd Street (Dickson Street) and north to the southern curbline of Barnett
Avenue. The complete text is on pp. 3–4 of S1 and again in the FINDINGS AND DESIGNATION section.)*

**F074** [P] **My paraphrase, not a quotation:** the designated district's outer extent runs roughly
from 43rd Street east to 52nd Street, and from Skillman Avenue / 43rd Avenue north to Barnett
Avenue and 39th Avenue, with numerous lot-line indentations. Verifier should work from F073's exact
text, not from this paraphrase.

**F075** [Q] Report authorship: "Essay researched and written by Virginia Kurshan / Building analysis
and descriptions by Tara Harrison / Additional building descriptions by Kathryn E. Horak / Research
intern: Elizabeth Solomon / Edited by Mary Beth Betts, Director of Research and Michael Caratzas /
Photographs by Carl Forster / Map by Jennifer L. Most". LPC chairman at designation: "Robert B.
Tierney, Chairman". — S1

**F076** [Q] Cover image provenance: "Cover Photo: Madison Court North, 3974-3988 44th Street, Historic
photo shortly after construction, courtesy of Clarence Stein Collection #3600, Division of Rare and
Manuscript Collections, Cornell University Library". — S1
*(Finder note: "3974-3988 44th Street" as printed does not match Queens hyphenated addressing
(39-74 to 39-88 44th Street would). Possible OCR/typesetting artifact in the PDF. Flagged.)*

**F077** [Q-2nd] Wikipedia claims the development was "Listed on the National Register of Historic
Places on September 7, 1984" and covers "53 acres (21 ha) (NRHP/NYSRHP); 77 acres (31 ha) (NYC
Landmark)". — S18/S19 (**aggregator. I attempted to retrieve the NRHP nomination from NPGallery and
failed — see §14. The NRHP listing date and the two competing acreages are UNVERIFIED.**)

**F078** [Q-2nd] Wikipedia describes the acreage/units as "77 acres across about 16 blocks between
43rd and 51st Streets, north of Queens Boulevard" and "1,202 housing units in a mix of cooperative,
rental, and limited-dividend tenures". — S18 (**aggregator. Note that this conflicts with S1's
76.67 acres purchased (F026), with S1's "more than 1,200 families" (F047), and with S1's boundary
reaching 52nd Street (F073). Recorded as a discrepancy.**)

**F079** [Q-2nd] Wikipedia: Sunnyside Gardens was "the first attempt to create a garden city in the
United States, applying the planning principles of the English garden city movement of Ebenezer
Howard and Raymond Unwin." — S19 (**aggregator; compare S1's more careful "first practical
application of the architecture and planning concepts developed by the RPAA" (F036)**)

**F080** [Q-2nd] Cornell's finding aid for the Clarence S. Stein papers gives Stein's dates as
1882–1975, records him as Chairman of the New York State Housing and Regional Planning Commission
(1923–1926) and among the founders of the Regional Plan Association in 1923, and lists his awards as
the AIA Gold Medal (1956), the Distinguished Service Award of the American Institute of Planners
(1958), and the Ebenezer Howard Memorial Medal. — S17
*(Finder note: the finding aid as summarized says "Regional Plan Association", while LPC says
"Regional Planning Association of America (RPAA)". These are two different organizations
historically. Flag for the verifier — do not merge them.)*

---

## 6. Phipps Garden Apartments

**F081** [Q] LPC findings: "Phipps Garden Apartments were built by the Society for Phipps Houses on
land that was originally purchased for Sunnyside but then later sold; … the Phipps apartments were
designed by Clarence Stein to enclose a lavishly landscaped central courtyard created by Marjorie
Cautley; … a second apartment section was added three years later, on a smaller section of the block
that could not accommodate a fully enclosed courtyard; … Stein used many of the design and planning
ideas he had developed at Sunnyside along with a more decorative, Art Deco style treatment because
these buildings were intended for a slightly wealthier clientele". — S1

**F082** [Q] LPC dates the two Phipps campaigns "1931-32 and 1935". — S1

**F083** [Q-2nd] Phipps Houses' own history page, under a 1930 entry: "The Phipps Garden Apartments
were built to introduce residents to a new environment – natural landscapes within and surrounding
the 472-unit building. The final 13 four-story buildings were completed in 1935." The page heads the
item "Garden City Movement: Phipps Garden Apartments in Sunnyside, Queens". — S16

**F084** [Q-2nd] Wikipedia gives a different count: the complex "Opened on September 1, 1931,"
designed by Clarence Stein, "consisting of 22 connected four- and six-story buildings housing 344
families arranged around a landscaped interior courtyard," with "A second northern group of thirteen
four-story buildings … completed in 1935," and "Original rents in 1931 ranged from $31 to $80 per
month". — S18 (**aggregator**)
*(Finder note: 472 units (S16) vs 344 families (S18) is a live discrepancy for the first campaign.
Both are recorded. Not resolved.)*

**F085** [Q-2nd] Phipps Houses says it was "Founded by Henry Phipps" in 1905 and "was established by
special act of the New York Legislature," and that "Henry Phipps saw a need to improve housing for
what he termed 'the working classes.'" — S16

**F086** [Q-2nd] Wikipedia: in December 2020 Queens Community Board 2 "voted 28 to 12 to support a
Phipps Houses application to rezone a parking lot at 50-25 Barnett Avenue" for "A seven-story,
167-unit affordable housing building," with "Twenty-five units … reserved for formerly homeless
families at 40 percent of the area median income, with the balance offered at 90 percent of AMI,"
and the housing lottery launching in April 2026. — S18 (**aggregator; recent-events claim, low
confidence**)

---

## 7. Parks and open space (NYC Parks primary records)

All F087–F094 are **[Q]** verbatim field values from the NYC Parks Properties dataset (S4).

**F087** [Q] `"signname": "L/CPL Thomas P. Noonan Jr. Playground"`, `"address": "42-01 GREENPOINT
AVENUE"`, `"location": "47 Ave., Greenpoint Ave. bet. 42 St. and 43 St."`, `"acres": "1.05"`,
`"zipcode": "11104"`, `"gispropnum": "Q044"`, `"typecategory": "Playground"`, `"subcategory":
"Neighborhood Plgd"`, `"communityboard": "402"`, `"precinct": "108"`. — S4

**F088** [Q] `"signname": "Torsney Playground"`, `"address": "41-15 SKILLMAN AVENUE"`, `"location":
"Skillman Ave. bet. 41 St. and 43 St."`, `"acres": "2.027"`, `"acquisitiondate":
"1951-07-19T00:00:00.000"`, `"zipcode": "11104"`, `"gispropnum": "Q340"`. — S4
*(Finder note: the city's official `signname` is still "Torsney Playground". The widely used name
"Lou Lodati Playground" does not appear in the Parks property record. Flag.)*

**F089** [Q] `"signname": "Sabba Park"`, `"location": "Queens Blvd. bet.  48 St., Greenpoint Ave. and
50 St."`, `"acres": "0.467"`, `"acquisitiondate": "1933-10-18T00:00:00.000"`, `"zipcode": "11377"`,
`"gispropnum": "Q034"`, `"typecategory": "Triangle/Plaza"`, `"subcategory":
"Sitting Area/Triangle/Mall"`. — S4
*(Finder note: official `signname` is "Sabba Park", not "Joe Sabba Park". ZIP is 11377 — the
Woodside ZIP — while community board is 402. Contested-assignment candidate; see §13.)*

**F090** [Q] `"signname": "Lt. Michael R. Davidson Playground"`, `"address": "50-02 39 AVENUE"`,
`"location": "39 Ave. bet. 50 St. and 51 St."`, `"acres": "0.229"`, `"acquisitiondate":
"2019-09-13T00:00:00.000"`, `"zipcode": "11377"`, `"gispropnum": "Q516"`, `"typecategory":
"Undeveloped"`, `"mapped": "False"`. — S4
*(Finder note: as of the dataset snapshot I pulled, the city still classes this site as
`"Undeveloped"`. Wikipedia (F095) says it opened in June 2026. Direct conflict between a city
dataset and the aggregator. Recorded, unresolved. ZIP 11377 again — see §13.)*

**F091** [Q] `"signname": "Doughboy Park"`, `"address": "54-25 SKILLMAN AVENUE"`, `"location":
"Woodside Ave. bet. 54 St. and 56 St."`, `"acres": "1.71"`, `"acquisitiondate":
"1957-03-25T00:00:00.000"`, `"zipcode": "11377"`, `"gispropnum": "Q031A"`, `"communityboard":
"402"`. — S4
*(Included only as the eastern neighbor case — this is generally understood as Woodside, and it is
in the same community district. It marks how far CB2 extends. See §13.)*

**F092** [Q] LPC on the private park inside the historic district: "Sunnyside Park, 'dedicated for the
benefit of property owners in the Sunnyside development,' was constructed on approximately three
acres of land in 1925-26. The park historically featured a baseball field, tennis, basketball,
volleyball, handball, croquet, and horseshoe courts, and a small and large children's play court, as
well as landscaped garden areas." — S1

**F093** [Q] LPC, present-day condition: "Half of the park is currently paved and features three
tennis courts, a basketball court, a playground, small wading pool, baseball field and picnic area
with tables, benches and barbeques. The gated entry to this private park is reached by a concrete
path". — S1

**F094** [Q] LPC findings give a different acreage for the same park: "Sunnyside Gardens also includes
a 3 ½ acre park donated by CHC to the neighborhood, and includes playgrounds and two small buildings
with meeting space for a nursery school and numerous organizations that formed there". — S1
*(Finder note: "approximately three acres" (F092) vs "3 ½ acre" (F094) inside the same document.
Recorded, not resolved.)*

**F095** [Q-2nd] Wikipedia park claims, all **aggregator-only** and unverified: Noonan Playground's
site "was acquired by the city in 1936 as Thomson Hill Park" and was renamed in 1996 for a Marine
lance corporal "killed in Vietnam in 1969 and posthumously awarded the Medal of Honor"; Torsney
Playground was "named for George F. Torsney, a local political figure and World War I veteran" and
was "Named in 1999 by New York City Council resolution for the longtime community organizer Lou
Lodati (1908–1996), known locally as the 'Mayor of Sunnyside'," reopening "on June 22, 2013, after a
$1.4 million renovation"; Joe Sabba Park is "Named for Joe Sabba, a World War II veteran from the
neighborhood"; the Davidson Playground is "Named after a firefighter who grew up in Phipps Garden
Apartments and died in the line of duty in 2018" with "A ribbon cutting ceremony officially opening
the playground … on June 18, 2026". — S18
*(Note: F095's 1936 acquisition date for Noonan is contradicted by the Parks dataset, which carries
no `acquisitiondate` for Q044 at all, and F095's Torsney details are not in the Parks record either.
The NYC Parks per-park history pages, which would be the authoritative source here, blocked all my
requests — see §14.)*

**F096** [Q-2nd] Sunnyside Gardens Park's own website gives its address as "48-21 39th Avenue,
Sunnyside, New York" and its homepage banner reads "Celebrating 100 years of community in the heart
of Sunnyside and Woodside." — S12
*(Finder note: **the institution places itself in "Sunnyside and Woodside" — both.** This is the
single cleanest self-declared contested assignment in the file. See §13.)*

**F097** [Q-2nd] Wikipedia describes Sunnyside Gardens Park as "A privately owned roughly three-acre
common space opened in 1926" and "One of only two private residential parks in New York City,
alongside Manhattan's Gramercy Park"; the Sunnyside Gardens article instead calls it "The largest
privately held park in New York City and one of only two members-only parks in the city, the other
being Gramercy Park." — S18/S19 (**aggregator, and the two Wikipedia articles word the claim
differently. The park's own site did not make either claim on the pages I could reach.**)

**F098** [Q-2nd] Wikipedia lists two community gardens: "45th Street Composters and Community Garden"
at 41-12 45th Street and "Sunnyside Community Garden" at 38-01 50th Street. — S18 (**aggregator**)

---

## 8. Churches and religious institutions

**F099** [Q-2nd] The site at allsaintssunnyside.org now presents itself as "The Episcopal Mission in
Sunnyside," at "43-12 46th Street," ZIP 11104, describing itself as "a new community of Christian
practice" and stating it "launched on September 14, 2025," with a welcome message from Father Carl
Adair. — S15
*(Finder note: the domain name is All Saints', but the current occupant identity is different. A
verifier will need to establish the relationship between All Saints Episcopal Church and the
Episcopal Mission in Sunnyside before anything is written about either.)*

**F100** [Q-2nd] Wikipedia's list of religious institutions with addresses, **all aggregator-only**:
All Saints Church, 43-12 46th Street (Episcopal); New York Presbyterian Church, 43-23 37th Avenue;
Mosaic West Church and Community Center, 46-01 43rd Avenue; Islamic Institute of New York, 55-11
Queens Boulevard; Sunnyside Muslim Center, 39-18 47th Avenue; Queen of Angels Church, 44-04 Skillman
Avenue; Sunnyside Reformed Church, 48-03 Skillman Avenue, "organized in July 1896"; Mimar Sinan
Mosque, Sunnyside, 45-06 Skillman Avenue. — S18

**F101** [Q-2nd] Wikipedia: the Knickerbocker Laundry Factory at 43-23 37th Avenue was "An Art Deco
structure built in 1932, [and] was converted to use as the New York Presbyterian Church in the late
1990s". — S18 (**aggregator; my attempt at a Docomomo US page on this building 404'd**)
*(Contested-assignment candidate: 43-23 37th Avenue is north of Sunnyside Yard and its ZIP is
commonly 11101 (Long Island City). See §13.)*

**F102** [Q-2nd] Wikipedia: the Islamic Institute of New York address, 55-11 Queens Boulevard, is east
of 52nd Street. — S18
*(Contested-assignment candidate — 55-11 Queens Boulevard falls east of every eastern boundary
proposed in F007 and F008. See §13.)*

---

## 9. Cultural institutions, community organizations, events

**F103** [Q-2nd] Thalia Spanish Theatre's own site gives its address as "41-17 Greenpoint Ave,
Sunnyside, NY 11104," a founding year of 1977, and the self-descriptions "The Only Hispanic Theatre
in Queens, New York" and "the first and only BILINGUAL Hispanic Theatre in Queens." Its stated
mission: "Our mission is to celebrate the vibrancy and diversity of Spanish and Latin American
culture with unique productions of plays, musicals and dance." It claims "over 255 World and
American Premieres" and "252 Awards for Artistic Excellence over its 48 years of operation." — S10
*(Finder note: "255 premieres" and "252 awards" are the institution's own promotional counts and
should be attributed to the theatre, not stated as fact.)*

**F104** [Q-2nd] Sunnyside Community Services: founded 1974; address "43-31 39th Street, Sunnyside, NY
11104"; mission "We enrich lives and strengthen communities through services and engagement for
individuals at all ages, beginning with those most in need."; serves "a diverse community of over
16,000 people of all ethnicities and income levels throughout Queens"; programs include Pre-K
through college and career readiness, home care and health aide training, Beacon and Cornerstone
community centers, and an older adult center with social adult day care for Alzheimer's patients. —
S11

**F105** [Q-2nd] Queens Public Library lists its Sunnyside branch at "43-06 Greenpoint Avenue, Long
Island City, NY 11104". — S13
*(Finder note: **the library system's own record puts the "Sunnyside" branch in "Long Island
City."** Contested-assignment candidate; see §13.)*

**F106** [Q-2nd] Sunnyside Shines BID's About page describes Sunnyside as "A Tapestry of Cultures and
Stories" and names the most represented countries by population as "Ecuador, Colombia, Korea,
Mexico, Bangladesh, China, Dominican Republic, Romania, India, and Ireland." It references "Bliss &
Lowery Plazas" and a "Community Cultural Initiative," and gives contact "director@sunnysideshines.org
| +1-718-606-1800". The page as fetched did not state the BID's formation date, boundaries, or
property count. — S14

**F107** [Q-2nd] Wikipedia on the BID: "Authorized by the New York City Council and signed into law by
Mayor Michael Bloomberg on September 5, 2007," covering "92 properties along Queens Boulevard,
Greenpoint Avenue, and South Roosevelt Avenue," and "The thirteenth such district authorized under
the Bloomberg administration." — S18 (**aggregator; not corroborated on the BID's own page**)
*(Finder note: "South Roosevelt Avenue" in a Sunnyside BID description is directly relevant to this
wave — Roosevelt Avenue is the corridor shared with Woodside and Jackson Heights.)*

**F108** [Q-2nd] Wikipedia on St. Pat's for All: "Founded in 2000 by Brendan Fay and Ellen Duncan in
response to the exclusion of LGBT Irish groups from the Manhattan St. Patrick's Day Parade"; "The
inaugural parade on March 5, 2000, drew First Lady Hillary Clinton and Father Mychal Judge among its
marchers"; it "Proceeds along Skillman Avenue between 43rd Street in Sunnyside and 58th Street in
adjacent Woodside"; slogan "Cherishing All the Children of the Nation Equally". — S18
(**aggregator. The parade's own domain, stpatsforall.com, would not resolve DNS for me — see §14.**)
*(Finder note: this is a signature visitor draw AND an explicitly cross-neighborhood event: the
route as described spans Sunnyside and Woodside. See §13.)*

**F109** [Q-2nd] Wikipedia on the Sunnyside Arch: "In 1983, a steel gantry over 46th Street at its
intersection with Queens Boulevard, spelling out 'Sunnyside' in metal letters" was erected; in 2001
"Council member Walter L. McCaffrey and Queens Community Board 2 persuaded Queens Borough President
Claire Shulman to contribute $75,000 of her discretionary funds to repair the arch." — S18
(**aggregator; this is the neighborhood's most photographed object and deserves a better source**)

**F110** [Q-2nd] Wikipedia on Sunnyside Garden Arena, 44-11 Queens Boulevard: "Operated as a boxing and
wrestling venue from the mid-1940s until June 24, 1977"; "The arena seated about 2,500 spectators";
boxers included "Floyd Patterson, Emile Griffith, José Torres, and Gerry Cooney"; "John F. Kennedy
delivered a campaign address at the venue on October 27, 1960"; "The DuMont Television Network
broadcast a weekly program, Boxing From Sunnyside Gardens, from the venue from 1949 to 1950"; "The
arena was demolished in late 1977; a memorial monument was installed at the former site (now a
Wendy's restaurant) in October 2012." — S18 (**aggregator**)
*(Cross-check available: a "WENDY'S" at "44-16 QUEENS BOULEVARD" appears in the DOHMH dataset (S8) —
note 44-16, not 44-11.)*

**F111** [Q-2nd] Wikipedia: The Ramones "played some of their earliest shows at the Coventry,
originally known as the Popcorn Pub, on Queens Boulevard at 47th Street," and Kiss "performed its
first concert at the same venue on January 30, 1973." — S18 (**aggregator**)

**F112** [Q-2nd] Wikipedia: the Queens Public Library Sunnyside branch is at 43-06 Greenpoint Avenue
(corroborating F105's street address but not its city designation). — S18

---

## 10. Industrial and immigrant history

**F113** [Q] LPC (2006) on the industrial corridor immediately west: factories "benefited from spur
lines that allowed freight cars to travel directly to the loading docks. Various examples can be
found in the Degnon Terminal area, along Thomson Avenue, where the Adams Chewing Gum and Loose Wiles
Sunshine Biscuit companies located in the 1910s." — S2

**F114** [Q] LPC (2007) on the tax-exemption policy that produced Sunnyside: "Between 1923 and 1924,
New York City officials voted to exempt new housing developments from real estate taxes, providing
incentives to insurance companies (such as the Metropolitan Life Insurance Company) and other
developers that gave impetus to large projects such as those at Jackson Heights and Sunnyside." — S1
*(Finder note: LPC pairs Sunnyside and Jackson Heights as products of the same policy — relevant to
this wave's three-neighborhood adjacency.)*

**F115** [Q] LPC footnote: "One of the Metropolitan Life Insurance Company's developments was located
at 48th Street, across Queens Boulevard from Sunnyside Gardens." — S1

**F116** [Q-2nd] Wikipedia: "In 1901, the Irish-American Athletic Club established Celtic Park near
48th Avenue and 43rd Street as a venue for Gaelic games." — S18 (**aggregator; a significant claim
for Irish-American sporting history that badly needs a primary source**)

**F117** [Q-2nd] Wikipedia on Celtic Park Apartments: built on the former athletic field site "starting
in 1931"; "A nine-acre, 756-unit complex spans 42nd to 44th Streets between 48th and 50th Avenues,
straddling the boundary between Sunnyside and adjacent Woodside"; "Converted to cooperative
ownership in May 1986." — S18
*(Finder note: **the source itself says the complex straddles the Sunnyside/Woodside boundary.**
Contested-assignment candidate; see §13. Geographically 42nd–44th Streets is west of Sunnyside
Gardens, so "Woodside" here is surprising and should be scrutinized, not adopted.)*

**F118** [Q-2nd] Wikipedia on immigration: "The neighborhood developed in the 1910s and 1920s as a
working- and middle-class destination for Irish, German, Italian, and Eastern European arrivals to
New York"; "Korean, Turkish, and Romanian immigrants arrived in the 1980s, and Mexican immigrants in
growing numbers in the 1990s and 2000s"; "Subsequent immigration drew significant numbers of
arrivals from Ecuador, Colombia, Bangladesh, and Nepal"; and (2013) "The Hunters
Point–Sunnyside–West Maspeth neighborhood had the city's greatest concentration of Nepalese-born
residents". — S18 (**aggregator**)
*(Finder note: the last item uses the old NTA name from F005, which is itself a boundary artifact —
the statistic is about a tri-neighborhood tabulation area, not about Sunnyside alone. Important
caveat for anyone writing from it.)*

**F119** [Q-2nd] Wikipedia 2020 Census figures for Sunnyside: population 52,278; density 47.8 people
per acre; 31.4% non-Hispanic White (16,395), 3.3% African American (1,716), 25.1% Asian (13,123),
36.3% Hispanic/Latino (18,957), 1.2% other races (621), 2.8% two or more races (1,466); foreign-born
47.4% "more than NYC's 36.5% overall"; median household income (2019–2023 ACS) $80,933; poverty rate
7.9%; unemployment 6.4%; 78.3% rental / 21.7% owner-occupied; median age 38.8; average household
size 2.23. — S18 (**aggregator relaying Census/ACS; the geography these figures cover is almost
certainly an NTA, which means they are boundary-dependent**)

---

## 11. Transit

**F120** [Q] MTA subway station records for the three stations within Sunnyside, all `"division":
"IRT"`, `"line": "Flushing"`, `"borough": "Q"`, `"daytime_routes": "7"`, `"structure": "Elevated"`,
`"ada": "0"`:
- `"station_id": "460"`, `"stop_name": "33 St-Rawson St"`, lat/lon 40.744587 / -73.930997
- `"station_id": "459"`, `"stop_name": "40 St-Lowery St"`, lat/lon 40.743781 / -73.924016
- `"station_id": "458"`, `"stop_name": "46 St-Bliss St"`, lat/lon 40.743132 / -73.918435,
  `"gtfs_stop_id": "714"`, `"complex_id": "458"`, `"north_direction_label": "Outbound"`,
  `"south_direction_label": "Manhattan"` — S6

**F121** [Q] `"ada": "0"` for all three Sunnyside stations. By contrast `"station_id": "456"`,
`"stop_name": "61 St-Woodside"` carries `"ada": "1"`, and `"station_id": "457"`, `"stop_name":
"52 St"` carries `"ada": "0"`. — S6
*(Finder note: none of Sunnyside's three subway stations is accessible per this dataset. Also note
that the next station east, "52 St", sits at the very street the boundary disputes turn on — see
§13.)*

**F122** [Q] MTA entrances dataset lists six stair entrances for "46 St-Bliss St", all
`"entrance_type": "Stair"`, `"entry_allowed": "YES"`, `"exit_allowed": "YES"`, at approximately
40.7431/-73.9188, 40.7432/-73.9188, 40.7431/-73.9186, 40.7432/-73.9186, 40.7430/-73.9179,
40.7431/-73.9178. — S7

**F123** [Q-2nd] Wikipedia: "Express trains pass through the three Sunnyside stations without
stopping," and "The nearest express stop is 61st Street–Woodside, one stop east of the
neighborhood." — S18 (**aggregator, but consistent with the Flushing Line's known local/express
pattern; verifier should confirm against an MTA timetable**)

**F124** [Q-2nd] Wikipedia: "Ridership at Lowery St. subway station increased from 256,080 in 1923 to
2,117,809 in 1930." — S18 (**aggregator; a striking figure for the neighborhood's build-out, needs a
primary source**)

**F125** [Q-2nd] Wikipedia: bus routes Q32, Q39, Q60, Q104 and B24 operate within Sunnyside. — S18
(**aggregator; trivially checkable against MTA route maps, which I could not reach**)

**F126** [Q-2nd] Wikipedia: "In 2018 the New York City Department of Transportation installed
parking-protected bicycle lanes on Skillman and 43rd Avenues," a project that followed "the November
2017 death of cyclist Gelacio Reyes, who was struck by a driver on 43rd Avenue." — S18
(**aggregator; the NYC DOT project PDF I tried to retrieve 404'd**)

**F127** [Q-2nd] Wikipedia: "Citi Bike docking stations were installed across Sunnyside and adjacent
Woodside in spring 2022 as part of the system's expansion into western Queens, with about 71
stations planned for the two neighborhoods." — S18 (**aggregator; note the figure is again for
Sunnyside AND Woodside jointly — a boundary-blind statistic**)

**F128** [Q-2nd] Wikipedia: "The nearest NYC Ferry landing is at Hunters Point South in Long Island
City, approximately one mile west of southern Sunnyside." — S18 (**aggregator**)
*(Finder note: Sunnyside has NO waterfront. The task brief asked about "the waterfront"; the
candidate finding is that Sunnyside is landlocked, with Newtown Creek south of it commonly given as
its southern limit (F006) but the creek frontage itself belonging to Maspeth/Long Island City. This
is a paraphrase of my reading of F006 plus F128 — **[P]** — and should be verified, not assumed.)*

---

## 12. Commercial corridors and businesses

**⚠ MANDATORY DISCLOSURE PER TASK BRIEF ⚠**
Every business named in F130 below is sourced **ONLY** to the NYC DOHMH Restaurant Inspection
Results dataset (S8). I have **no** second source for any of them. A DOHMH inspection record
establishes only that a permitted food-service establishment was recorded at that address under
that trade name at some point in the dataset's window. It does **not** establish that the business
is currently open, that it is notable, that it is any good, that the cuisine label is accurate
(several records below carry `cuisine_description: None`), or that the trade name is the name on the
door. Nothing in F130 may be written up as a recommendation, a description, or a claim of current
operation. Several entries at "40-05 SKILLMAN AVENUE" appear to be stalls or licensees inside a
single shared address, not independent storefronts.

**F129** [Q-2nd] Wikipedia: "The principal commercial corridors of Sunnyside are Queens Boulevard
between approximately 38th and 50th Streets, Greenpoint Avenue between 39th and 49th Streets,
Skillman Avenue, and 43rd Avenue corridors". — S18 (**aggregator**)

**F130** [Q] DOHMH-only business roster for ZIP 11104 (trade name | address | DOHMH cuisine label).
**DOHMH INSPECTION DATASET IS THE SOLE SOURCE FOR ALL OF THESE.** — S8

Romanian Garden | 43-06 43 Avenue | Eastern European · The Sconery | 39-39 47 Avenue | Bakery
Products/Desserts · Paris Baguette | 45-22 46 Street | Bakery Products/Desserts · China Garden |
39-20 47 Avenue | Chinese · Cloud Catering | 40-11 Skillman Avenue | *(none)* · Maggie Mae's |
41-15 Queens Boulevard | American · Bliss 46 Bistro | 43-46 46 Street | French · Sunnyside Up Cafe |
45-16 Queens Boulevard | Bagels/Pretzels · The Courtyard Ale House | 40-18 Queens Boulevard |
American · Coba Pizzeria | 40-05 Skillman Avenue | *(none)* · Greenpoint Cafe & Bakery | 41-02A
Greenpoint Avenue | Bakery Products/Desserts · Ida's Nearabout | 43-13 Queens Boulevard | American ·
The Sunnyside Brother's Cafe | 43-47 40 Street | Mexican · Costa Y Mar | 41-06 Greenpoint Avenue |
Latin American · Thai Smith | 40-05 Skillman Avenue | *(none)* · Tacos El Guero | 48-11 43 Avenue |
Mexican · Arcobaleno | 44-09 Queens Boulevard | Frozen Desserts · Full Moon Cafe | 42-14 Greenpoint
Avenue | Mexican · Mr. Buncha | 45-09 40 Street | Thai · Las Maravillas De Neza | 42-16 Greenpoint
Avenue | *(none)* · The Spot Cafe | 43-24 43 Avenue | Juice, Smoothies, Fruit Salads · La Pollera De
Mario | 41-20 Greenpoint Avenue | Latin American · Takesushi | 43-46 42 Street | Japanese ·
Curley's Bagels | 43-04 47 Avenue | Bagels/Pretzels · Starbucks | 46-09 Queens Boulevard |
Coffee/Tea · Limena Pisco Bar | 47-14 Greenpoint Avenue | Peruvian · Ricuras Paisas Bakery
Restaurant | 39-44 Queens Boulevard | Latin American · Due Fratelli SS | 42-18 43 Avenue | *(none)*
· Dumplings & Things | 45-26 46 Street | Chinese · The Goodfellas Pizzeria of Sunnyside | 39-09 47
Avenue | Pizza · Red Rabbit | 40-05 Skillman Avenue | Continental · Wingstop | 40-11 Queens
Boulevard | Chicken · Sanger Hall | 48-20 Skillman Avenue | American · The Kasbah Cafe | 39-19
Greenpoint Avenue | Coffee/Tea · Wendy's | 44-16 Queens Boulevard | Hamburgers · Melting Cups Coffee
Co. | 43-45 40 Street | Coffee/Tea · Belo | 48-06 Skillman Avenue | Brazilian · Souk Al Shater Corp
| 43-03 Queens Boulevard | *(none)* · Burger King | 40-13 Queens Boulevard | American · Cardamom
Indian Cuisine | 43-45 43 Street | Indian · Empire Shop | 47-10 39 Place |
Sandwiches/Salads/Mixed Buffet · Zirve Turkish Grill | 42-03 Queens Boulevard | Turkish · Makina
Cafe | 46-11 Skillman Avenue | Ethiopian · The Alcove | 41-11 49 Street | Latin American · Mriga |
46-10 Skillman Avenue | New American · Mister Burrito Loco | 43-20 Greenpoint Avenue | Mexican ·
Porkie's Tofu & Grill | 40-05 Skillman Avenue | Asian/Asian Fusion · Milko Foods LLC | 40-05
Skillman Avenue | *(none)* · Sunnyside Pizza | 40-01 Queens Boulevard | Pizza · Floribella | 45-12
43 Avenue | Fusion · Philomena's | 41-16 Queens Boulevard | Pizza · Soleluna | 40-01 Queens
Boulevard | Italian · Rangoon Restaurant Concepts LLC | 40-05 Skillman Avenue | *(none)* · Finest
Sushi | 41-02 Greenpoint Avenue | Japanese · Cap't Loui | 43-10 Queens Boulevard | Seafood · Khao
Glong Thai | 40-05 Skillman Avenue | Thai · Wu Jia You Tian Sweetness Inc. | 40-05 Skillman Avenue |
*(none)* · Dunkin' | 45-13 Queens Boulevard | Coffee/Tea · Mika's Dumplings / Jacky's Fried / Nick's
Rice Bowl / Late Night Korean Express | 40-05 Skillman Avenue | *(none)*

**F131** [P] **My observation, not a source claim:** the DOHMH roster above is restricted to ZIP
11104 and therefore *by construction* excludes any Sunnyside establishment in ZIP 11377 or 11101.
Because the ZIP boundary does not follow the neighborhood boundary (see §13), this list is itself
boundary-biased and is not a complete picture of Sunnyside's commercial life.

---

## 13. ⚠ CONTESTED NEIGHBORHOOD ASSIGNMENTS — RECORDED, NOT RESOLVED

Per the wave instruction: every place below is assigned to a *different* one of Jackson Heights /
Sunnyside / Woodside (or to Long Island City) by at least one source, or straddles a line. I am
**not** adjudicating any of these. Address given first, then each source's assignment.

| # | Place | Address (as given by source) | Assignments found | Sources |
|---|-------|------------------------------|-------------------|---------|
| C1 | **Sunnyside Gardens Park** | 48-21 39th Avenue | Its **own website** says it is "in the heart of **Sunnyside and Woodside**" — both. LPC includes it inside the Sunnyside Gardens Historic District. | S12, S1 |
| C2 | **Queens Public Library, Sunnyside branch** | 43-06 Greenpoint Avenue | QPL's own record says "**Long Island City**, NY 11104". Wikipedia says Sunnyside. | S13, S18 |
| C3 | **Celtic Park Apartments** | 42nd–44th Streets between 48th and 50th Avenues | Source explicitly says it "**straddl[es] the boundary between Sunnyside and adjacent Woodside**". | S18 |
| C4 | **Sabba Park** | Queens Blvd between 48 St, Greenpoint Ave and 50 St | NYC Parks assigns ZIP **11377** (Woodside ZIP) but Community Board **402**. Wikipedia calls it a Sunnyside park. | S4, S18 |
| C5 | **Lt. Michael R. Davidson Playground** | 50-02 39 Avenue | NYC Parks assigns ZIP **11377**. Wikipedia describes it as Sunnyside, on the former Phipps Garden Apartments playground. | S4, S18 |
| C6 | **Phipps Garden Apartments** | Barnett Ave / 39th Ave between 50th and 52nd Streets; rezoning site given as 50-25 Barnett Avenue | Inside LPC's **Sunnyside Gardens Historic District**. Phipps Houses says "Sunnyside, Queens." Sits in ZIP **11377** territory per neighboring Parks records. | S1, S16, S4 |
| C7 | **Sunnyside Yard** | north of Barnett Ave | DCP splits it into "**Sunnyside Yards (North)**" in **CD 1 / Astoria** and "**Sunnyside Yards (South)**" in **CD 2**. Wikipedia says the yard "separates it from Astoria". | S5, S18 |
| C8 | **Sunnyside itself (the whole neighborhood)** | — | LPC (2006) states "**Long Island City is comprised of five separate neighborhoods: Ravenswood, Astoria, Steinway, Sunnyside, and Hunter's Point**" — i.e. Sunnyside as part of LIC. DCP's 2020 NTA file lists Sunnyside as a **standalone NTA (QN0202)**. DOE's dataset uses the older NTA "**Hunters Point-Sunnyside-West Maspeth**". | S2, S5, S9 |
| C9 | **New York Presbyterian Church / former Knickerbocker Laundry** | 43-23 37th Avenue | Listed by Wikipedia under Sunnyside, but the address is **north of Sunnyside Yard** in ZIP 11101 (Long Island City) territory. | S18 |
| C10 | **Islamic Institute of New York** | 55-11 Queens Boulevard | Listed by Wikipedia under Sunnyside, but **55th Street is east of every proposed Sunnyside eastern boundary** (48th, 51st or 52nd Street) and is normally Woodside. | S18, S18(F007/F008) |
| C11 | **St. Pat's for All parade route** | Skillman Avenue, 43rd Street to 58th Street | Source says the route runs "**between 43rd Street in Sunnyside and 58th Street in adjacent Woodside**" — a single event spanning both neighborhoods. | S18 |
| C12 | **Citi Bike station rollout (2022)** | across the area | Reported as a joint "**Sunnyside and adjacent Woodside**" figure (~71 stations) that cannot be split by neighborhood. | S18 |
| C13 | **Sunnyside Shines BID footprint** | Queens Blvd, Greenpoint Ave, **South Roosevelt Avenue** | The BID's reported footprint includes **Roosevelt Avenue**, the corridor shared with Woodside and (further east) Jackson Heights. | S18, S14 |
| C14 | **"52 St" subway station** | Queens Blvd at 52nd Street | MTA lists it on the Flushing Line in Queens between Sunnyside's 46 St-Bliss St and 61 St-Woodside; it sits exactly on the 52nd Street line that F008 gives as Sunnyside's northern-side eastern boundary. Neighborhood assignment not stated by MTA. | S6, S18(F008) |
| C15 | **Doughboy Park** | 54-25 Skillman Avenue | NYC Parks: ZIP **11377**, Community Board **402**, `location` "Woodside Ave. bet. 54 St. and 56 St." — same community district as Sunnyside, generally understood as Woodside. Included to mark CB2's eastern reach. | S4 |
| C16 | **Sunnyside Gardens Historic District eastern edge** | 52nd Street (Dickson Street) | LPC's designated boundary reaches the **western curbline of 52nd Street**, while one cited boundary account (F007) puts Sunnyside's eastern edge at **51st Street** — which would place part of the landmarked Sunnyside Gardens outside Sunnyside. | S1, S18 |
| C17 | **Sunnyside Reformed Church** | 48-03 Skillman Avenue | Listed under Sunnyside; address falls in the 48th–52nd Street zone that F007/F008 disagree about. | S18 |
| C18 | **Mimar Sinan Mosque, Sunnyside** | 45-06 Skillman Avenue | Name asserts Sunnyside; no independent assignment found. Recorded for completeness because Skillman Avenue is the shared Sunnyside/Woodside spine (C11). | S18 |
| C19 | **Sunnyside Community Services** | 43-31 39th Street | Self-assigns "Sunnyside, NY 11104" but says it serves "throughout **Queens**"; 39th Street is at the far western edge, near the LIC line given in F008. | S11, S18 |
| C20 | **The old NTA "Hunters Point-Sunnyside-West Maspeth"** | — | Any statistic carrying this label (including the Nepalese-population claim in F118) describes a **three-neighborhood** area, not Sunnyside. | S9, S18 |

**Not resolved. Not ranked. Not adjudicated.** The verifier owns all of the above.

---

## 14. Sources I tried and could not reach (gaps a verifier should close)

These are honest failures, not negative findings. Nothing below should be read as "the source says
no."

- **NYC Parks per-park history pages** (`nycgovparks.org/parks/<name>/history`) — returned 403 to
  WebFetch and HTTP 202 with an empty body to direct requests. These are the authoritative source
  for F095 (Noonan, Torsney/Lodati, Sabba naming histories) and remain **uncorroborated**.
- **National Register nomination for Sunnyside Gardens** — NPGallery returned "The PDF file for this
  National Register record has not yet been digitized" for the reference number I tried, and the
  NPGallery search interface returned no parseable results. The NRHP listing date (F077) and the
  53-acre NRHP figure are therefore **unverified**.
- **NYCEDC Sunnyside Yard project page** (`edc.nyc/project/sunnyside-yard`) — 403. The
  `sunnysideyard.nyc` domain did not resolve. All master-plan figures (F028) rest on the aggregator.
- **stpatsforall.com** — DNS did not resolve (both with and without `www`). All St. Pat's for All
  material (F108) rests on the aggregator.
- **Queens Community Board 2's own page** on nyc.gov — 404/403. CB2's own statement of which
  neighborhoods it covers is **missing from this file**, which is unfortunate given §13.
- **NYC Zoning Resolution §74-73 / Special Planned Community Preservation District text** — 403. The
  1974 special-district designation (F067) is sourced only to LPC's retelling.
- **NYC DOT Skillman/43rd Avenue project materials** — 404 at the URL I tried. F126 rests on the
  aggregator.
- **GrowNYC Sunnyside Greenmarket page** — 403. No greenmarket facts recorded.
- **Sunnyside Gardens Park "about"/"history" pages** — 404. Only the homepage banner (F096) and the
  address were obtainable.
- **Docomomo US page on the Knickerbocker Laundry** — 404. F101 rests on the aggregator.
- **WebSearch** — budget fully exhausted before this task began, so no discovery of local historical
  societies, the Greater Astoria Historical Society's Sunnyside material, Queens Historical Society
  holdings, or local press was possible.

---

## 15. Counts

- **Candidate facts recorded (F001–F131):** 131
- **Candidate places recorded (P-level entries):** 47 distinct named places — the three subway
  stations, five parks (Noonan, Torsney, Sabba, Davidson, Doughboy), Sunnyside Gardens Park, the
  Sunnyside Gardens Historic District and its fourteen named courts, Phipps Garden Apartments I and
  II, Celtic Park Apartments, the Sunnyside Arch, Sunnyside Garden Arena, the Coventry/Popcorn Pub,
  Thalia Spanish Theatre, Sunnyside Community Services, the Queens Public Library Sunnyside branch,
  eight religious institutions, two community gardens, Sunnyside Yard, and the Knickerbocker Laundry
  building. Businesses in F130 are counted separately and are **not** included in this figure, since
  they are DOHMH-only records rather than researched places.
- **Places with a contested neighborhood assignment:** 20 (C1–C20).
- **Facts resting solely on an aggregator (Wikipedia):** approximately 55 of the 131.
- **Facts read by me from raw primary text (LPC PDFs and government JSON):** approximately 60.
