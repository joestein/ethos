# Jackson Heights, Queens — FINDER candidate dossier

**Role:** FINDER. Nothing in this file is a verdict. No claim here is confirmed, adjudicated, or
resolved. Every item is a *candidate* for the verifier to check. Where I paraphrase, I say so.
Where I quote, the quote is copied character-for-character from the fetched source.

**Wave context:** Queens wave 2 — Jackson Heights / Sunnyside / Woodside, three CONTIGUOUS
neighborhoods. Per the brief, every candidate place below carries (a) its street address and
(b) what each source says about which neighborhood it is in. Section E lists every place whose
neighborhood assignment conflicts across sources. I do not resolve any of them.

---

## 0. RESEARCH CONDITIONS — read this before trusting coverage

**The WebSearch budget for this session was already exhausted before I made a single search call**
(`200 of 200 WebSearch calls` used by earlier/sibling agents). Every source below was reached by
constructing a URL directly and fetching it — via WebFetch, or via `curl`/`urllib` where WebFetch
got a 403. This has two consequences the verifier and coordinator must weigh:

1. **Coverage is URL-guessable-source biased.** I could not discover sources I did not already
   know how to address. Local news (Queens Chronicle, QNS, Jackson Heights Post), oral-history
   archives, the Queensboro Corporation papers, and most restaurant/press coverage are absent —
   not because they don't exist but because I could not search for them.
2. **Several high-value primary sources returned errors and are simply missing:** the NRHP
   nomination text (see F-14), NYC Parks' own pages for the 34th Avenue corridor, GrowNYC,
   and the Queens Public Library site (bot-blocked).

Sources that failed, for the record:
- `https://npgallery.nps.gov/NRHP/GetAsset/NRHP/99000059_text` → returned a one-page PDF reading
  **"The PDF file for this National Register record has not yet been digitized."**
- `https://www.nycgovparks.org/parks/paseo-park`, `.../paseo-park/history`, `.../parks/Q490` → HTTP 404
- `https://www.grownyc.org/greenmarket/queens/jackson-heights` → HTTP 403
- `https://www.queenslibrary.org/about-us/locations/jackson-heights` → HTTP 200 but body is
  **"Request Rejected The requested URL was rejected. Please consult with your administrator."**
- `https://en.wikipedia.org/wiki/Jackson_Diner`, `.../United_States_Post_Office_(Jackson_Heights,_New_York)`,
  `.../Jackson_Heights_Post_Office`, `.../Diversity_Plaza`, `.../Eagle_Theatre_(New_York_City)` → HTTP 404
  (i.e. no such article; these entities are **unsourced** in this dossier)

**OCR warning on the LPC designation report.** The LPC report is a scanned document. Its OCR
systematically renders "the"→"die"/"tiie", "with"→"widi", "these"→"mese", "34th"→"34di"/"34m",
"88th"→"88m". **I have preserved these artifacts inside quotation marks rather than silently
correcting them**, so that the verifier can match my quotes against the file byte-for-byte. Any
quote below containing "die"/"widi"/"tiie" is an OCR artifact of the scan, **not** the printed
report's wording. The verifier should treat the *meaning* as the report's and the *spelling* as
the scanner's.

---

## A. SOURCE REGISTER

| ID | Source | Type | URL / retrieval |
|----|--------|------|-----------------|
| S1 | NYC Landmarks Preservation Commission, *Jackson Heights Historic District Designation Report*, LP-1831, October 19, 1993 | **PRIMARY / institutional** (scanned PDF, 430,786 chars extracted) | `http://s-media.nyc.gov/agencies/lpc/lp/1831.pdf` — fetched via curl (WebFetch 403); local copy at `/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/jh_lp1831.pdf`, text at `.../jh_lp1831_full.txt` |
| S2 | NYC Dept. of Parks & Recreation, Travers Park "Historical Signs Project" text + park data panel | **PRIMARY / institutional** | `https://www.nycgovparks.org/parks/travers-park/history` (curl; WebFetch 403) |
| S3 | NYC Open Data — Parks Properties (resource `enfh-gkve`) | **PRIMARY / city dataset** | `https://data.cityofnewyork.us/resource/enfh-gkve.json` |
| S4 | NYC Open Data — DOHMH New York City Restaurant Inspection Results (resource `43nn-pn8j`) | **PRIMARY / city dataset — INSPECTION DATASET, see §D warning** | `https://data.cityofnewyork.us/resource/43nn-pn8j.json` |
| S5 | NYC Dept. of City Planning "GeoSearch" geocoder (Planning Labs) | **PRIMARY / city geocoder** | `https://geosearch.planninglabs.nyc/v2/search?text=...` |
| S6 | Garden School official site, "History of Garden School" | **PRIMARY / institutional (self-description)** | `https://gardenschool.org/about/history/` |
| S7 | 82nd Street Partnership official site | **PRIMARY / institutional (self-description)** | `https://82ndstreet.org/` |
| S8 | Jackson Heights Beautification Group official site | **PRIMARY / institutional (self-description)** | `https://www.jhbg.org/` |
| S9 | NPS National Register — nomination text | **PRIMARY but UNAVAILABLE** | not digitized (see §0) |
| S10 | Wikipedia, "Jackson Heights, Queens" | **AGGREGATOR — lowest confidence tier** | `https://en.wikipedia.org/wiki/Jackson_Heights,_Queens` |
| S11 | Wikipedia, "National Register of Historic Places listings in Queens County, New York" | **AGGREGATOR** | `https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens_County,_New_York` |
| S12 | Wikipedia, "Jackson Heights Historic District" | **AGGREGATOR** | `https://en.wikipedia.org/wiki/Jackson_Heights_Historic_District` |
| S13 | Wikipedia, "Jackson Heights–Roosevelt Avenue/74th Street station" | **AGGREGATOR** | `https://en.wikipedia.org/wiki/Jackson_Heights%E2%80%93Roosevelt_Avenue/74th_Street_station` |
| S14 | Wikipedia, "82nd Street–Jackson Heights station" | **AGGREGATOR** | `https://en.wikipedia.org/wiki/82nd_Street%E2%80%93Jackson_Heights_station` |
| S15 | Wikipedia, "90th Street–Elmhurst Avenue station" | **AGGREGATOR** | `https://en.wikipedia.org/wiki/90th_Street%E2%80%93Elmhurst_Avenue_station` |
| S16 | Wikipedia, "IRT Flushing Line" | **AGGREGATOR** | `https://en.wikipedia.org/wiki/IRT_Flushing_Line` |
| S17 | Wikipedia, "National Millennium Trails" | **AGGREGATOR** | `https://en.wikipedia.org/wiki/National_Millennium_Trails` |
| S18 | Wikipedia, "Murder of Julio Rivera" | **AGGREGATOR** | `https://en.wikipedia.org/wiki/Murder_of_Julio_Rivera` |
| S19 | Wikipedia, "Queens Pride Parade" | **AGGREGATOR** | `https://en.wikipedia.org/wiki/Queens_Pride_Parade` |
| S20 | Wikipedia, "Chester Carlson" | **AGGREGATOR** | `https://en.wikipedia.org/wiki/Chester_Carlson` |
| S21 | Wikipedia, "Alfred Mosher Butts" | **AGGREGATOR** | `https://en.wikipedia.org/wiki/Alfred_Mosher_Butts` |
| S22 | Wikipedia, "In Jackson Heights" (film) | **AGGREGATOR** | `https://en.wikipedia.org/wiki/In_Jackson_Heights` |
| S23 | Wikipedia, "Lent Homestead and Cemetery" | **AGGREGATOR** | `https://en.wikipedia.org/wiki/Lent_Homestead_and_Cemetery` |
| S24 | Wikipedia, "Woodside, Queens" | **AGGREGATOR** | `https://en.wikipedia.org/wiki/Woodside,_Queens` |
| S25 | Wikipedia, "Sunnyside, Queens" | **AGGREGATOR** | `https://en.wikipedia.org/wiki/Sunnyside,_Queens` |

> Note on S5: the GeoSearch `neighbourhood` field is a *derived* attribute attached to a geocoded
> point. I record what it returns. I make no claim about how DCP computes it, and the verifier
> should not treat it as a boundary determination. It is one source's assignment among several.

---

## B. CANDIDATE FACTS

Numbered F-1 … F-58. Each carries source ID and URL.

### B1. Origin, naming, and the Queensboro Corporation

**F-1.** The land was marshland called Trains Meadow before development. S2 (NYC Parks, primary),
exact quote: *"From the 1700s to the 1900s, this was a vast and rural area known as Trains Meadow."*
— `https://www.nycgovparks.org/parks/travers-park/history`
S1 corroborates the place-name independently, exact quote: *"Soon after acquiring an extensive
tract of farmland in the Trains Meadow section of Newtown in northwest Queens in 1910, the
Queensboro Corporation began to improve its property."* — LP-1831.
**Candidate discrepancy for verifier:** S2 says the Queensboro Corporation "bought 325 acres" in
**1909**; S1 says it acquired the tract in **1910**. Both quoted below in F-2/F-3.

**F-2.** S2 (NYC Parks, primary), exact quote: *"In 1909, Edward A. MacDougall's Queensboro
Corporation bought 325 acres of undeveloped land and named the area Jackson Heights after John C.
Jackson (1809-1899), a respected businessman and well-known citizen of Queens County."*
— `https://www.nycgovparks.org/parks/travers-park/history`

**F-3.** S1 (LP-1831, primary) gives the acquisition year as 1910 — see quote in F-1. The date
conflict (1909 vs 1910) is recorded, not resolved.

**F-4.** Naming derivation, competing version. S10 (aggregator) states the neighborhood was named
after **Jackson Avenue**, itself named for John C. Jackson — whereas S2 (primary, NYC Parks) says
it was named **directly after the man**. *This is my paraphrase of the difference; the S2 wording
is quoted verbatim in F-2.* Verifier should note S1 separately records that Jackson Avenue is the
former name of Northern Boulevard (see F-9).

**F-5.** The developer was a single firm. S1 exact quote: *"Conceived, planned, built in part, and
managed under the direction of a single real estate firm, the Queensboro Corporation, and its
president Edward A. MacDougall, Jackson Heights is one of the earliest neighborhoods in New York
to introduce two new building types, "garden apartments" and "garden homes.""* — LP-1831.

**F-6.** Period of development. S1 exact quote: *"The Jackson Heights Historic District comprises
the most cohesive part of an innovative residential development which was mostly built between the
early 1910s and the early 1950s."* — LP-1831.

**F-7.** The Queensboro Corporation failed in 1989. S1 exact quote: *"The Corporation had become
the insurance broker and managing agent for many of the apartment houses and continued in that role
until its failure in 1989. During the 1980s, many of the rental buildings within the district were
converted to cooperatives, recalling the plan begun by Queensboro sixty years before."* — LP-1831.

**F-8.** Transport drove development. S1 exact quote: *"Development of Jackson Heights was spurred
by such transportation improvements as the opening of the Queensboro Bridge in 1909, the extension
of the subway as far as Flushing (the elevated train line along Roosevelt Avenue opened in 1917),
the construction of the Independent subway line in the 1930s, and the rapid growth of Long Island
City as one of the city's largest manufacturing centers."* — LP-1831.
**Cross-boundary note:** this sentence ties Jackson Heights' origin to **Long Island City**, a
wave-1 neighborhood already shipped.

**F-9.** Northern Boulevard was formerly Jackson Avenue; 34th Avenue was formerly Hayes Avenue.
S1 exact quotes: *"located at the southeast corner of Jackson Avenue (now Northern Boulevard) and
82nd Street"* and *"Hayes Court (named for Hayes Avenue, the former name of 34th Avenue, on which
it fronts)"* — LP-1831.

### B2. The garden apartment — the neighborhood's headline claim

**F-10.** The block-as-single-unit planning concept. S1 exact quote: *"the Queensboro Corporation
initiated in Jackson Heights an important planning concept, developed from ideas and examples of
the model housing movement of the nineteenth century, which involved the treatment of the
rectangular block created by the street grid system as a single unit of planning and design,
ratiier than as a collection of individual building lots to be developed independently."*
[OCR artifact "ratiier" = "rather"] — LP-1831.

**F-11.** Earliest examples in New York. S1 exact quote: *"This design concept is seen in the
area's "garden apartments" of the 1910s and 1920s, which are among New York's earliest examples of
this type of apartment house, and in the "garden homes," clusters of attached and semi-detached
houses which were built after 1924."* — LP-1831.

**F-12.** Novel building features. S1 exact quote: *"The apartment buildings were constructed with
a number of features considered novel at the time such as automatic push-button elevators, sun
porches, and, at Linden Court, ground-level garages."* — LP-1831.

**F-13.** Designed for the automobile. S1 exact quote: *"Jackson Heights is one of New York's
earliest communities in which residential buildings were designed with die automobile in mind."*
[OCR "die" = "the"] — LP-1831.

**F-14.** Cooperative ownership plan introduced 1919. S1 exact quote: *"The idea of community was
strengthened by the Corporation's introduction in 1919 of a plan for the cooperative ownership of
the buildings in the garden apartment complexes."* — LP-1831.

**F-15.** Metropolitan Life financing. S1 exact quote: *"The Metropolitan Life Insurance Company
was a strong lobbyist for this legislation and also one of the important financial backers of
Queensboro's efforts at Jackson Heights. In 1921, it had loaned over $1,400,000 to the Corporation
for the construction of Elm, Hawthorne, and Laburnum Courts. By the following year, Metropolitan
Life had loaned Queensboro almost $8,000,000."* [footnote markers 19/20 removed at the two
sentence ends; otherwise verbatim] — LP-1831.

**F-16.** Deed restrictions. S1 exact quote: *"there were also restrictions entered into the deeds
governing use, materials, height, placement of fire escapes, entrance and egress over the
properties, signage, awnings, and heights of ornamental hedges."* — LP-1831.
**Note for verifier:** this passage covers *aesthetic//use* restrictions only. I searched the
extracted LP-1831 text for the terms "Negro" (0 hits) and "Jewish" (hits only in the context of
the Jewish Center and Young Israel congregations, F-33). **I found no discussion of racial or
religious occupancy covenants in this report.** Jackson Heights' exclusionary history is
frequently asserted elsewhere; I could not source it here and did not have search available to
try. Flagging as a **known gap**, not as an absence.

**F-17.** The 1920 critic's assessment. S1 quotes architectural critic John Taylor Boyd, Jr. (1920);
S1's exact rendering of the block quote: *"It is no less than a small city. In the process [of
developing the area] a community center with a building is already established, churches are
organized, community recreations, such as playgrounds, golf links, gardens, are in operation on the
corporation's land, stores are provided for, and other needs of a little city are planned for as
they will be required. This, truly, is city planning."* — LP-1831.

**F-18.** Successor complexes year by year. S1 exact quote: *"Subsequent to the construction of
Linden Court, Queensboro initiated major projects each year to the designs of either George H.
Wells or Andrew J. Thomas: Hampton Court (Wells, begun 1919); Elm Court, Hawthorne Court, and
Laburnum Court (Wells, begun 1921); the Chateau and Hayes Court (Thomas, begun 1922) and Cambridge
Court (Wells, begun 1922); the Towers (Thomas, begun 1923); and Ivy Court, Cedar Court, and the
Spanish Gardens (Thomas, begun 1924)."* — LP-1831.

**F-19.** The 1924 pivot to houses. S1 exact quote: *"In 1924, the Queensboro Corporation
redirected its efforts to building groups of single-family and convertible two-family houses; the
firm's president, E.A. MacDougall, is said to have made this change in policy in response to the
requests of the young veterans of World War I who wanted their own homes."* — LP-1831.
(Note S1's own hedge: *"is said to have"*.)

**F-20.** An Ernest Flagg project was abandoned after its foundations. S1 exact quote: *"Indeed,
one project designed by Ernest Flagg, for die entire block between 35th and 37th avenues, 77th and
78th streets, was halted after the foundations were laid. It was over a decade before that block
was developed with Berkeley Hall and Berkeley Gardens."* — LP-1831.

**F-21.** Landscape as an essential element. S1 exact quote: *"After the streets had been laid out,
each block was framed by a continuous grass strip that ran on all four sides between the street
curb and the sidewalk."* — LP-1831.

**F-22.** The lost 34th Avenue median and the two-block greenway. S1 exact quote: *"At die time of
construction of die Chateau and the Towers, 34m Avenue was landscaped witii a wide median strip;
thus, originally die two long gardens of the complexes visually connected across die landscaped
avenue to form a two-block long interior greenway; some of diat effect survives despite die loss of
die median strip landscaping"* [heavy OCR artifacts preserved] — LP-1831.

**F-23.** The vanished country club, tennis courts and golf course. S1 exact quote: *"At one time,
a broad mall was planted down the center of 34th Avenue which led to the community's country club,
tennis courts, and golf course, all of which are no longer extant."* — LP-1831.
S1 elsewhere states the golf course site was built over: exact quote: *"completed during the 1930s,
filling in some of the sites at the avenue ends of the garden apartment complexes and open spaces
such as the golf course (Dunolly Gardens)."* — LP-1831.
**This is a strong "what a visitor would travel for" vein: the golf course is gone and Dunolly
Gardens stands on it.**

### B3. Individual complexes and their architects (all from S1, LP-1831, primary)

**F-24.** Earliest projects inside the district. Exact quote: *"The earliest projects located within
the district are the row of houses (1911) by architect Charles Peck on the west side of 83rd Street
just north of Roosevelt Avenue, and Laurel Court (1913-14, George H. Wells), the first apartment
complex, located at the southeast corner of Jackson Avenue (now Northern Boulevard) and 82nd
Street."*

**F-25.** The Greystone Apartments. Exact quote: *"The Greystone Apartments (1917-18) on 80th
Street between 35th and 37th avenues, designed by Wells, mark a departure from the architect's
earlier Laurel Court in the reduction of lot coverage and allocation of garden space."*
**Discrepancy for verifier:** S10 and S12 (aggregators) date "The Greystones" to **1918** and place
them "Either side of 80th St, 37th–35th Ave"; S1 (primary) dates them **1917-18**.

**F-26.** Linden Court — the pivotal design. Exact quote: *"A different planning scheme was
introduced by Thomas widi his design of Linden Court (1919-21), located on 84th and 85th streets
between 37th and Roosevelt avenues. In this complex, the buildings are grouped into attached pairs;
the building wall on the periphery of the block is interrupted at regular intervals by open space.
The interior of the block is an undivided landscaped space, held in common by means of easements
and deed restrictions for the benefit of die residents."*
**Discrepancy:** S10/S12 date Linden Court **1919**; S1 gives **1919-21**. S12 places it "84th-85th
St, 37th Ave-Roosevelt Ave" (agrees with S1); S10 describes it as a "10-building complex, gated
garden, first with garages."

**F-27.** Hawthorne Court and Cambridge Court. Exact quote: *"Characteristic examples of Wells's
garden apartment complexes include Hawthorne Court (1921-22), located on 76th and 77th streets
between 35th and 37th avenues, and Cambridge Court (1922-23), located on 85th and 86th streets
between 37th and Roosevelt avenues."*
(Note: F-18 gives Cambridge Court as "begun 1922"; this passage gives "1922-23". Both from S1.)

**F-28.** Wells's five successors and their style. Exact quote: *"Wells went on to design the next
five garden-apartment blocks: Hampton Court in 1919-21; Hawthorne Court, Elm Court, and Laburnum
Court in 1921-22; and Cambridge Court in 1922. In all five of these complexes, the architectural
design, using red brick and stone trim, draws on Georgian sources."*

**F-29.** Laburnum Court's distinctive plan. Exact quote: *"At Laburnum Court, the configuration is
entirely different, with "H"-shaped buildings forming recessed street-front garden courts as well as
rear gardens"*.

**F-30.** Cambridge Court's composition. Exact quote: *"Composed of seven attached buildings on each
side of the block, each row has projecting buildings at the ends and center, creating the effect of
a long pavilion. While the projecting buildings have four full stories capped by a cornice and
balustraded parapet, the fourth story of each of the recessed buildings is hidden behind a steeply
sloping mansard roof"*.

**F-31.** The Chateau and the Towers. Exact quote: *"The Chateau (1922) and the Towers (1923-25)
are among the grandest of the Jackson Heights garden apartment complexes, each comprising almost a
full block and including die end of each block facing 34th Avenue."*
On the Towers' style, S1 quotes a contemporary account describing it as inspired by *"Central Italy
at its best period,"* attributed by S1 to *Queens Borough Magazine* (Oct., 1923), cited via Karatzas.
On the Chateau's name, exact quote: *"Thomas drew upon French inspiration for the ornamental style
of the Chateau — the French word for "castle" — incorporating mansard roofs at the upper story of
each building and diaperwork brick patterning in the end buildings."*
**Discrepancy:** S10/S12 place "the Chateau" in "the 1920s" with "12 buildings"; S1 says each
blockfront is *"composed of six buildings"* (i.e. twelve total — consistent, but the verifier should
check whether "12 buildings" is sourced or inferred). S1 also locates the Chateau *"on 80th and 81st
streets south of 34th Avenue, and the Towers, on the block directly to the north."*

**F-32.** Spanish Gardens. Exact quote: *"At Spanish Gardens (1924-26), Thomas tried yet another
approach to the organization of buildings around a block by including front gardens, as Wells had
done at Laburnum Court, in addition to the characteristic central inner garden. Each blockfront of
Spanish Gardens is composed of three identical and very large buildings, each roughly twice the size
of the individual buildings at the other garden complexes."*

**F-33.** Hayes Court, Ivy Court, Cedar Court. Exact quote: *"Hayes Court and Ivy Court both center
on inner courts which are entered from the side streets via barrel-vaulted archways and from the
avenue through wide openings; Cedar Court is "C"-shaped and opens toward the avenue."* S1 adds that
*"Ivy Court and Cedar Court, occupying opposite ends of one block"*.

**F-34.** Dunolly Gardens. Exact quote: *"Dunolly Gardens (Thomas, 1939), located on the block
bounded by 34m and 35th avenues and 78m and 79m streets, is a later example of the characteristic
garden apartment complex, yet given a modernistic architectural treatment."* [OCR "34m"/"78m"/"79m"
= "34th"/"78th"/"79th"]
**Discrepancy:** S10 calls Dunolly Gardens "Six modernistic buildings, last Thomas design"; S1 does
not use the phrase "last Thomas design" in this passage.

### B4. Institutions, churches, schools (all from S1 unless noted)

**F-35.** No houses of worship until the 1920s. S1 exact quote: *"Until the early 1920s there were
no houses of worship in Jackson Heights, rather congregations held services in storefronts or at the
Community Casino (no longer extant)."*
**⚠ WORDING TRAP FOR THE VERIFIER:** this sentence contains the word "no" **in the source itself**.
It is genuinely the source's wording. (Flagging explicitly because the brief notes a prior finder
inverted a source's meaning by *inserting* "no"; here the "no" is original.)

**F-36.** Community United Methodist Church. S1 exact quote: *"The Community United Methodist
Church received encouragement and aid from the Corporation, which initially provided a storefront to
serve as the church's first home, and subsequently donated the land for its current building. F.P.
Piatt's design for the church, built in 1920-23, draws on Tudor inspiration"* [footnote markers 51/52
removed]. S1 footnotes this to *"Founding of Churches," Jackson Heights News 18, no. 16 (Aug. 24,
1934), 1* and *Jackson Heights News 7, no. 12 (June 8, 1923), 4*.
**Discrepancy:** S10 gives "Founded 1919; Dedicated 1923" and calls it *"Oldest church in Jackson
Heights"*; S1 gives construction 1920-23 and does not use the phrase "oldest church."

**F-37.** St. Mark's Episcopal Church. S1 exact quote: *"Robert Tappan, architect of many houses in
the historic district, produced a Modern Gothic design in his plans for the St. Mark's Episcopal
Church, built in 1927."*
**Discrepancy:** S10 dates St. Mark's **1923** and says it was *"designated NYC landmark 1993"*;
S1 (primary) dates it **1927**. On the landmark claim: 1993 is the year the *historic district* was
designated (F-42), so "designated NYC landmark" may be a conflation of district-contributing status
with individual landmark status. **Recorded, not resolved.**

**F-38.** St. Joan of Arc R.C. Church — the cathedral that wasn't. S1 exact quote: *"The St. Joan of
Arc parish was established by the Brooklyn diocese and it was thought at the time that Jackson
Heights might become the location of a new Catholic diocese of Queens. In anticipation of this
event, the first design of St. Joan of Arc was modeled after the great French Gothic cathedrals.
However, the diocese was never approved and only the basement level of this ambitious first plan had
been completed by the late 1920s. The church was finally completed in 1951 to a design derived from
Italian Romanesque sources by local architect, W.A. Schlusing. The complex also includes a convent,
a school, and a rectory."*
**Discrepancy:** the S1 figure caption reads *"Fig. 36. St. Joan of Arc R.C. Church (W.A. Schlusing,
1949-51)"* while the body text says *"finally completed in 1951"*. S10 adds a claim not in S1: that
it was the *"First Catholic church named for newly canonized French saint"* — **unsourced here.**
**This is an excellent visitor-facing story and worth the verifier's time.**

**F-39.** First Church of Christ, Scientist — also finished decades late. S1 exact quote: *"Another
house of worship within the historic district is the First Church of Christ, Scientist, whose
mid-1920s neo-Georgian design by Arnold Brunner was completed only at the basement; die structure,
with its striking limestone facade in the Moderne style, was finished in me early 1950s to designs
by C. Faulkner."*

**F-40.** Jewish institutions. S1 exact quote: *"the Jewish Center of Jackson Heights, an
International Style synagogue built in 1959-60 to designs by Bloch & Hesse (with an addition by J.
Stein in 1968-69); and the Young Israel of Jackson Heights which occupies a converted commercial
building on 37th Avenue (Jack Fein, 1951; later altered)."*

**F-41.** Public buildings. S1 exact quote: *"P;S. 69, the neighborhood's public elementary school,
is representative of the work of New York public school architect, C.B.J. Snyder, Superintendent of
Buildings for the Board of Education from 1891 until 1923. Typical of his work from the 1920s, it is
neo-Tudor in style"*; and *"The neo-Georgian style of the post office (Benjamin C. Flournoy, 1936-37,
with later additions) also complements many of the surrounding apartment houses. The Queens Borough
Public Library branch (S. Keller, 1949-52) is an example of the International Style."*
S1's summary line gives P.S. 69 as *"(P.S. 69, C.B.J. Snyder, 1924)"*.

**F-42.** The commercial streets were designed to match the housing — a genuinely unusual claim.
S1 exact quote: *"The Jackson Heights Historic District represents one of the first areas in the city
in which the commercial thoroughfares were designed to complement and integrate with the residential
buildings by using the same architectural styles or by incorporating features of adjoining
residential buildings into their design. Within the boundaries of the historic district are two major
commercial thoroughfares: the spine of 37th Avenue running the length of the district, and the
intersecting block of 82nd Street between 37th and Roosevelt avenues."*
S1 also: *"In the city's original 1916 zoning, only 37m Avenue, Roosevelt Avenue, and Northern
Boulevard were zoned for commercial purposes."*
And: *"The intersection of 37th Avenue, the commercial spine of the district, and 82nd Street,
another important commercial street, is distinguished by a group of picturesque neo-Tudor style
commercial buildings dating from between the World Wars."*

### B5. Designations

**F-43.** NYC Landmarks designation. S1 title block, exact: *"New York City Landmarks Preservation
Commission / Jackson Heights Historic District / October 19, 1993"*; report authorship line, exact:
*"JACKSON HEIGHTS HISTORIC DISTRICT / Prepared by the Research Department, Marjorie Pearson,
Director"*. Commission chair at designation, exact: *"Laurie Beckelman, Chair"*. LP number **LP-1831**
(from the file path/report; S12 also gives "LP Number: 1831").

**F-44.** The district's origin in a Community Board 3 survey. S1 exact quote: *"In 1987 Gene A.
Norman, then Chairman, directed the Commission's Survey Department to undertake a survey of Queens
Community Board 3 which includes Jackson Heights, Elmhurst, and Corona."* S1 also credits the
Jackson Heights Beautification Group: *"The Commission wishes to express its thanks to the Jackson
Heights Beautification Group for additional research help"*, and dedicates the report *"In memory of
Luella Adams"*.

**F-45. LPC BOUNDARY — verbatim opening of the metes-and-bounds.** S1 exact quote: *"The Jackson
Heights Historic District in the Borough of Queens consists of the property bounded by a line
beginning at the southeast corner of the intersection of 78th Street and 34th Avenue, then extending
southerly along the eastern curbline of 78th Street, westerly along the southern curbline of 35th
Avenue, soudierly along the eastern curbline of 77th Street, westerly across 77th Street, westerly
along the northern property lines of 35-14 77th Street and 35-13 76th Street, southerly along the
eastern curbline of 76th Street…"* [OCR "soudierly" = "southerly"; ellipsis mine — the full
description runs several hundred more words and is in the local text file at offset ~7757].
The description's easternmost extent reaches 88th Street (S1: *"northerly along the western curbline
of 88m Street"*) and its southern edge runs along Roosevelt Avenue (S1: *"easterly along the northern
curbline of Roosevelt Avenue"*).
**Note:** the LPC boundary is a lot-by-lot line, **not** a clean rectangle. S12's paraphrase — *"a
rectangle stretching roughly from 76th to 88th Streets and from Roosevelt Avenue almost up to
Northern Boulevard"* — is an aggregator's simplification and is flagged as such.

**F-46.** Number of buildings in the LPC district. S10/S12 (aggregators) say *"Almost 600 buildings
in the neighborhood"* / "Approximately 600 buildings." **I did not locate a building count in the
S1 text I extracted.** Unverified count — flagged.

**F-47. National Register listing.** S11 (aggregator, but reproducing the NRHP list) gives:
name **Jackson Heights Historic District**, **NRHP Reference Number 99000059**, **listed January 27,
1999**, address given as *"Bounded by Roosevelt Ave., Broadway, Leverich St., Northern Blvd., and
90th St."*
**⚠ BOUNDARY CONFLICT among sources for the SAME district:**
- S11: *"Bounded by Roosevelt Ave., Broadway, Leverich St., Northern Blvd., and 90th St."*
- S12: *"from 93rd Street through 69rd Street between Northern Boulevard and Roosevelt Avenue"*
  [sic — "69rd" is S12's typo]
- S10 (describing the *neighborhood*, not the district): *"Roosevelt Ave., Broadway, Leverich St.,
  70 St., Northern Blvd., and Junction Blvd."*
These do not agree (90th vs 93rd St; 69th vs 70th St). **Recorded, not resolved.** The authoritative
tiebreaker would be the NRHP nomination — which is **not digitized** (§0).

**F-48.** NR district size. S10/S12 (aggregators): **300 acres**, **2,203 contributing buildings,
19 sites, 3 objects**. Source is aggregator-only; the nomination is unavailable to check it.

**F-49.** The two districts are not the same shape. S12 exact quote on the difference in effect:
*"the local designation comes with aesthetic protections"* (contrasted with state/national listing).
The LPC district is materially smaller than the NR district per every source above.

### B6. Transit

**F-50.** The Flushing Line elevated reached the area in 1917. S16 gives *"Queensboro Plaza to
Alburtis Avenue"* opening **April 21, 1917**, with later extensions *"October 13, 1925"* (111th St),
*"May 7, 1927"* (Willets Point Blvd), *"January 21, 1928"* (Main Street). S1 independently
corroborates 1917 (F-8).

**F-51.** The "International Express" is a National Millennium Trail. S17 exact quote of the list
entry: *"International Express – 5 miles (8.0 km) – Queens County, New York from Sunnyside to
Flushing follows the route of the New York City Subway's IRT Flushing Line (7 and <7> trains)"*,
designated by the White House Millennium Council, **1999**.
**⚠ CROSS-BOUNDARY: this designation's own wording starts the trail at SUNNYSIDE — a sibling
neighborhood in this same wave. Jackson Heights, Woodside and Sunnyside will all have a legitimate
claim on this fact. Coordinator should arbitrate who gets to write it.**

**F-52.** Jackson Heights–Roosevelt Avenue/74th Street. S13 exact quote on location: the complex is
*"located at "Roosevelt Avenue, 74th Street & Broadway" in Jackson Heights and Elmhurst, Queens."*
IRT Flushing Line component opened **April 21, 1917**; IND Queens Boulevard Line component **August
19, 1933**. Served by 7, E, F, M, R. S13: **15,086,001 annual riders in 2024**, ranked *"9 out of
423"*, *"the busiest subway station in Queens."*

**F-53.** Victor A. Moore Bus Terminal. S13: renovation 2000–2005, *"MTA approved a renovation of
the station itself in September 2002"*, final cost **$132 million**, bus terminal *"opened on July
13, 2005"*; the station building is described as *"one of the first green buildings in the MTA
system"* with solar panels. Named for Broadway performer **Victor Moore**.
S10 adds it *"replaced the Victor Moore Arcade"* — aggregator-only.

**F-54.** 82nd Street–Jackson Heights station. S14 exact quote: *"the intersection of 82nd Street
and Roosevelt Avenue on the border of Jackson Heights and Elmhurst in Queens."* Opened **April 21,
1917**. Elevated, 2 side platforms, 3 tracks. S14 also records recent closures: Manhattan-bound
platform closed **May 15, 2023**, reopened **April 19, 2024**; Flushing-bound closed **May 6, 2024**,
reopened **January 22, 2025**.

**F-55.** 90th Street–Elmhurst Avenue station. S15 exact quote: *"on the border of Elmhurst and
Jackson Heights in Queens."* Opened **April 21, 1917**.

**F-56.** Bus routes serving Jackson Heights per S10 (aggregator): Q29, Q32, Q33, Q47, Q49, Q53 SBS,
Q63, Q66, Q70 SBS, Q72. **Not independently checked against MTA.**

### B7. Immigration, culture, LGBTQ history

**F-57.** Julio Rivera murder. S18 exact quote: *"Three men cornered Rivera in a schoolyard that was
known as a gay cruising area and beat him with a hammer and beer bottle, and then stabbed him."*
Date **July 2, 1990**; Rivera was a 29-year-old bartender at the Magic Touch bar. Renaming, S18 exact
quote: *"In 2000, the corner of 78th Street and 37th Avenue, where Rivera was killed, was renamed in
his memory."*
**Internal tension for the verifier:** S18 says the killing happened in *a schoolyard* but that the
renamed *corner* is "where Rivera was killed." The P.S. 69 schoolyard is at 77-02 37th Avenue (P-8).
Recorded, not resolved.

**F-58.** Queens Pride Parade. S19: founded **June 6, 1993**; founders **Daniel Dromm and Maritza
Martinez**; route *"Parade on 37th Avenue from 89th Street to 75th Street"*; inaugural march *"around
1,000 people"*; now *"Queens Pride has attracted crowds of over 40,000 people."*
**Discrepancy:** S10 names the organizers of the 1994 Lesbian and Gay Democratic Club as *"Daniel
Dromm and Wayne Mahlke"* and gives the 1993 parade as *"The Inaugural Queens Lesbian and Gay Parade
and Block Party Festival"*; S19 names **Maritza Martinez** as co-founder of the parade. Different
events, possibly conflated. Recorded, not resolved.

**F-59.** *In Jackson Heights* (film). S22: directed by **Frederick Wiseman**, **2015**, **190
minutes**, premiered **September 4, 2015 at the Venice Film Festival**. S22 describes its content:
*"a Muslim school, a Jewish center, a meeting of gay and transgender people, a City Council office
and the local headquarters of Make the Road New York, an activist organization dedicated to Latino
and working-class people."* S22 reports a *New York Times* reviewer's description: *"a movingly
principled, political look at a dynamic neighborhood in which older waves of pioneers make room for
new, amid creeping gentrification"*, and that in 2017 the Times ranked it 13th best film of the 21st
century thus far.

**F-60.** Diversity claim. S10 (aggregator) attributes to *The New York Times* the description of
Jackson Heights as *"the most culturally diverse neighborhood in New York, if not on the planet."*
**This is a quote-of-a-quote via an aggregator; the underlying NYT article is not cited to a URL
here. Treat as unverified attribution.**

**F-61.** Commercial corridors, per S10 (aggregator, and the weakest tier in this dossier):
74th Street as the Indian/South Asian retail hub; 73rd Street associated with Pakistani and
Bangladeshi retail; 37th Avenue east of 77th Street associated with Colombian business; Northern
Boulevard *"from 80th Street east to the border of neighboring Corona at Junction Boulevard"*
associated with Colombian and Peruvian retailers; Roosevelt Avenue street food.
**All aggregator-only. None independently sourced. Recommend the writer not lean on these.**

**F-62.** Tibetan community. S10 (aggregator) calls Jackson Heights *"the second (if unofficial)
capital of the exile Tibetan world, after Dharamsala, India."* **Aggregator-only, and phrased as an
unofficial claim in the source itself.** Partial corroboration from S4 (DOHMH): multiple Tibetan/
Himalayan establishments are registered in ZIP 11372 (see P-16…P-20), but DOHMH records cuisine
type, not community history.

**F-63.** Scrabble. S21 exact quote: *"Butts was a resident of Jackson Heights, New York, and the
game of Scrabble was invented there."* S21 gives the invention year as **1931** and describes the
commemorative sign: *"A street sign at 35th Avenue and 81st Street in Jackson Heights is stylized
using letters with their values in Scrabble as a subscript."*
**⚠ DISCREPANCY:** S10 says Butts *"invented Scrabble in 1938; perfected at Community Methodist
Church"* and that the sign was *"erected 1995, replaced 2011"*. S21 gives **1931**, mentions **no**
church, and gives **no** erection date. Two aggregators, two different years. Recorded, not resolved.
**⚠ Note also: 35th Avenue and 81st Street is inside the LPC historic district.**

**F-64. ⚠⚠ CHESTER CARLSON — CROSS-NEIGHBORHOOD CONFLICT WITH A WAVE-1 NEIGHBORHOOD.**
S10 (the Jackson Heights article) lists Carlson as a notable resident who *"invented Xerox copy
machine in Jackson Heights kitchen"* (S10's phrasing as returned).
S20 (the Chester Carlson article) states the opposite location. S20 exact quote: *"By the fall of
1938, Carlson's wife had convinced him that his experiments needed to be conducted elsewhere. He
rented a room on the second floor of a house owned by his mother-in-law at 32-05 37th Street in
Astoria, Queens."* S20 also records the image itself is labelled *"Astoria 10-22-38 (The first
xerographic image)"*.
**32-05 37th Street, Astoria is in DITMARS-STEINWAY/ASTORIA territory — wave 1, already shipped.**
The verifier and the coordinator must decide whether Jackson Heights may claim Carlson at all, and
if so only as a *residence*, never as the invention site. **I am not resolving this.**

### B8. Parks and open space

**F-65.** Travers Park, all from S2 (NYC Parks, primary). Exact quotes:
*"In 1948, the City of New York acquired the site by condemnation to provide much-needed parkland
for a booming population. It opened the following year as Jackson Heights Park with athletic
facilities, basketball courts, and a skating rink that turned into an ice rink in the wintertime. It
was updated in 1995 to include spray showers, game tables, and multigenerational play equipment."*
*"In 2020, the park was rebuilt to include a great lawn, surrounded with flowering trees, benches,
and a performance area with stadium seating. An expanded play area features equipment for all age
groups with a multi-purpose area for open play. The expanded plaza at 78th Street allows for seamless
access from 77th Street to 79th Street."*
Full official name per S2: **Thomas J. Travers Park**.

**F-66. ⚠ Travers Park's namesake is a cross-boundary figure.** S2 exact quote: *"This park was
renamed for Thomas J. Travers (1897-1958), a prominent Queens Democrat and Jackson Heights community
leader."* and — critically — *"He served as Democratic District Leader for **Woodside-Jackson
Heights** from 1940 until his death in 1958."* [emphasis mine] S2 also records his involvement with
*"St. Joan of Arc Church, the Catholic Youth Organization, and the Jackson Heights Sandlot Baseball
League"* and the *"Jackson Heights Taxpayers Association and the Queens Chamber of Commerce"*.
**The park's own NYC Parks sign names a joint Woodside-Jackson Heights political district. This is a
legitimate shared fact with the Woodside finder.**

**F-67.** 34th Avenue open street. S10 (aggregator) states that since May 2020 a *"1.3-mile (2.1 km)
stretch...closed to vehicular traffic from 7am to 8pm"* and that proposals by 2025 include *"26 blocks
of 34th Avenue"* converted to parkland; S10 calls it "34th Avenue Open Streets/Paseo Park".
**⚠ I could NOT source Paseo Park from NYC Parks — `/parks/paseo-park` and `/parks/paseo-park/history`
both 404 (§0). The name "Paseo Park" is aggregator-only in this dossier.** However, S3 (NYC Open Data,
primary) does list a Parks property on that corridor — see P-24 — under a *different* name.

---

## C. CANDIDATE PLACES

Format: **name — street address — neighborhood as assigned by each source that assigns one.**
"GeoSearch" = S5, the DCP Planning Labs geocoder. "ZIP" is from the cited record.

### C1. Landmarks / historic fabric

**P-1. Jackson Heights Historic District (NYC landmark).** Boundary per F-45; corner point given by
S1 as the intersection of **78th Street and 34th Avenue**. Neighborhood: Jackson Heights (S1, by name).

**P-2. Jackson Heights Historic District (National Register).** NRHP ref **99000059**, listed
**1999-01-27**. Address per S11: *"Bounded by Roosevelt Ave., Broadway, Leverich St., Northern Blvd.,
and 90th St."* Neighborhood per S11: **Jackson Heights**. See F-47 for the three-way boundary conflict.

**P-3. Laurel Court** — southeast corner of **Northern Boulevard (former Jackson Avenue) and 82nd
Street** (S1). 1913-14, George H. Wells. Neighborhood: Jackson Heights (S1). GeoSearch for
**34-25 82 Street → Jackson Heights, 11372**.

**P-4. The Greystone Apartments** — **80th Street between 35th and 37th Avenues** (S1). 1917-18,
Wells. Neighborhood: Jackson Heights (S1).

**P-5. Linden Court** — **84th and 85th Streets between 37th and Roosevelt Avenues** (S1). 1919-21,
Andrew J. Thomas. Neighborhood: Jackson Heights (S1).

**P-6. The Chateau** — **80th and 81st Streets south of 34th Avenue** (S1). 1922, Thomas.
Neighborhood: Jackson Heights (S1).

**P-7. The Towers** — the block **directly north of the Chateau**, i.e. north of 34th Avenue between
80th and 81st Streets (S1). 1923-25, Thomas. Neighborhood: Jackson Heights (S1).

**P-8. Spanish Gardens** — 1924-26, Thomas, on the block **adjacent (west) to Linden Court** (S1:
*"complementing the architectural expression of Linden Court on the adjacent block to the east"* —
note S1 phrases this from Spanish Gardens' perspective). Neighborhood: Jackson Heights (S1).

**P-9. Hawthorne Court** — **76th and 77th Streets between 35th and 37th Avenues** (S1). 1921-22,
Wells. Neighborhood: Jackson Heights (S1).

**P-10. Cambridge Court** — **85th and 86th Streets between 37th and Roosevelt Avenues** (S1).
1922-23, Wells. Neighborhood: Jackson Heights (S1).

**P-11. Laburnum Court** — 1921-22, Wells (S1). **No street location given in the S1 passages I
extracted** — address gap. Neighborhood: Jackson Heights (S1). Note S6 (Garden School, primary)
independently references *"the Laburnum Court Apartments"* as the school's first classroom site.

**P-12. Elm Court, Hampton Court, Hayes Court, Ivy Court, Cedar Court** — all named in S1 (F-18,
F-28, F-33). **Addresses not given in the extracted passages** — address gap for all five.
Neighborhood: Jackson Heights (S1). Hayes Court fronts **34th Avenue** (S1, F-9).

**P-13. Dunolly Gardens** — the block bounded by **34th and 35th Avenues and 78th and 79th Streets**
(S1). 1939, Thomas. Neighborhood: Jackson Heights (S1). **Built on the former golf course** (S1, F-23).

**P-14. Berkeley Hall and Berkeley Gardens** — the block between **35th and 37th Avenues, 77th and
78th Streets** (S1) — the block where Ernest Flagg's project was abandoned (F-20). Neighborhood:
Jackson Heights (S1).

**P-15. Charles Peck rowhouses (1911)** — **west side of 83rd Street just north of Roosevelt Avenue**
(S1). The district's earliest buildings. Neighborhood: Jackson Heights (S1).

### C2. Institutions

**P-16. Community United Methodist Church** — S10 gives **35th Avenue between 81st and 82nd Streets**.
GeoSearch for **81-10 35 Avenue → Jackson Heights, 11372**. Built 1920-23, F.P. Piatt (S1).
Neighborhood: Jackson Heights (S1, S10, GeoSearch — all agree).

**P-17. St. Joan of Arc R.C. Church** — S10 gives **35th Avenue between 82nd and 83rd Streets**.
GeoSearch for **35-27 82 Street → Jackson Heights, 11372**. Completed 1951, W.A. Schlusing (S1).
Neighborhood: Jackson Heights (S1, S10, GeoSearch — all agree).

**P-18. St. Mark's Episcopal Church** — S10 gives **34th Avenue between 81st and 82nd Streets**.
GeoSearch for **33-50 82 Street → Jackson Heights, 11372**. Built 1927, Robert Tappan (S1).
Neighborhood: Jackson Heights (S1, S10, GeoSearch — all agree). Date conflict per F-37.

**P-19. First Church of Christ, Scientist** — no address in S1. Address gap. Neighborhood: Jackson
Heights (S1, *"within the historic district"*).

**P-20. Jewish Center of Jackson Heights** — S10 gives **77th Street & 37th Avenue**. 1959-60,
Bloch & Hesse (S1). Neighborhood: Jackson Heights (S1, S10).

**P-21. Young Israel of Jackson Heights** — **on 37th Avenue** (S1), converted commercial building,
Jack Fein 1951. No house number. Neighborhood: Jackson Heights (S1).

**P-22. P.S. 69** — S10 and S1 place it in the district; **77-02 37th Avenue** per common usage.
GeoSearch for **77-02 37 Avenue → Jackson Heights, 11372**. C.B.J. Snyder, 1924 (S1).
**⚠ CAVEAT: I did not verify the house number 77-02 against a DOE source — the DOE school-location
dataset query failed (HTTP 400). The address is my inference from the block S1 describes, and is
flagged as UNVERIFIED.**

**P-23. U.S. Post Office, Jackson Heights** — Benjamin C. Flournoy, 1936-37 (S1). S10 lists a
"Jackson Heights post office" among National Register properties. **No address sourced; no Wikipedia
article exists (404); NRHP listing unconfirmed — S11's Queens County NRHP list returned only ONE
Jackson Heights entry, the historic district (F-47), and did NOT list a post office.** This is a
**contradiction between S10 and S11** and a significant open question. GeoSearch for
**78-02 37 Avenue → Jackson Heights, 11372** (candidate address only, unverified).
S8 (JHBG, primary) independently confirms the post office is a community focal point: its program
list includes *"Annual Holiday Post Office Lighting"*.

**P-24. Queens Public Library, Jackson Heights branch** — S10 gives **35-51 81st Street**. GeoSearch
for **35-51 81 Street → Jackson Heights, 11372**. S. Keller, 1949-52, International Style (S1).
Neighborhood: Jackson Heights (S1, S10, GeoSearch). **The library's own site is bot-blocked (§0), so
current hours/status are unsourced.**

**P-25. Garden School** — **33-16 79th Street, Jackson Heights, NY 11372** (S6, the school's own
site, verbatim from its footer). GeoSearch for **33-16 79 Street → Jackson Heights, 11372**.
S6 exact quotes: *"Garden School has deep roots in the Jackson Heights community, founded in 1923 by
a group of neighborhood parents with a shared vision for exceptional education."*; *"The school took
its name from the newly conceived garden apartment complexes built by Edward MacDougall, founder of
the Queensboro Corporation, in the then-rural community of Jackson Heights."*; *"The first classes,
grades K–3, met in the Laburnum Court Apartments under the guidance of Mrs. Dorothy Gleen, Mrs.
Charles Townshend, and Mrs. Josephine Wech."*; *"in 1925, grades 4–6 were added and Mr. John Bosworth
Laing became the director. In 1927 Mr. Otis Flower assumed leadership as headmaster."*; *"in the
spring of 1929, graduating its first high school class of three students!"*; and its self-description
*"an NYSAIS-accredited independent Nursery to Grade 12 private college preparatory school in the
heart of Jackson Heights, Queens, New York."* Milestone list includes *"2023 Garden School
Centennial!"*
Neighborhood: Jackson Heights (S6 primary, GeoSearch, S10 — all agree). **This is the single
best-sourced institution in the dossier.**

**P-26. 82nd Street Partnership** — **37-06 82nd Street, Suite 309, Jackson Heights, NY 11372**
(S7, verbatim from its own site). GeoSearch for **37-06 82 Street → Jackson Heights, 11372**.
S7 self-description, exact quote: *"An award-winning neighborhood development organization for
Jackson Heights and Elmhurst, Queens."*
**⚠ NOTE: the organization defines its own service area as spanning Jackson Heights AND Elmhurst.**

**P-27. Jackson Heights Beautification Group** — **PO Box 720253, Jackson Heights, NY 11372** (S8,
its own site; a PO box, not a street address). S8 exact quotes: *"Serving Jackson Heights Since
1988"*; *"The Jackson Heights Beautification Group is a grassroots not-for-profit civic, environmental
and arts organization dedicated to promoting the well-being and quality of life in Jackson Heights,
Queens."* Programs listed on its own site include: *Jackson Heights Orchestra*, *Friends of Travers
Park*, *Annual Holiday Post Office Lighting*, *Annual Children's Art Contest*, *Historic Weekend and
Landmarks Advocacy*, *Children's Halloween Parade*, *JHCREW Dog Run*, *Summer Sundays in the Park*,
*JH SCRAPS Community Composting*, *JHBG Graffiti Busters*, *Tree LC Team*. S1 (1993) corroborates the
group's existence and role at designation (F-44).
Neighborhood: Jackson Heights (S8 primary).

### C3. Parks — all from S3 (NYC Open Data Parks Properties, primary)

S3 returned exactly **6** park properties with ZIP 11372 in Queens:

**P-28. Travers Park** — *"34 Ave. bet. 77 St. and 78 St."* — ZIP **11372**, Community Board **403**
(= Queens CB3), type *Playground*, **1.919 acres**. S2 gives Park ID **Q303**, acreage **1.92**,
Community Board **3**, Council Member **Shekar Krishnan**. Neighborhood: Jackson Heights (S2, S3 via
CB3/11372, GeoSearch 77-01 34 Avenue → Jackson Heights).

**P-29. Rory Staunton Field** — *"78 St., 79 St. bet. Northern Blvd. and 34 Ave."* — ZIP **11372**,
CB **403**, type *Recreational Field/Courts*, **0.574 acres** (S3). GeoSearch **79-01 34 Avenue →
Jackson Heights, 11372**. Neighborhood: Jackson Heights.
**Note: this is the block Dunolly Gardens occupies on its south side (P-13) — the former golf course
area. Good candidate for a linked story. I have NOT sourced who Rory Staunton was.**

**P-30. Northern Playground** — *"Northern Blvd. bet. 93 St. and 94 St."* — ZIP **11372**, CB **403**,
*Jointly Operated Playground*, **1.719 acres** (S3). Neighborhood: ZIP/CB say Jackson Heights; **93rd–
94th Street is east of every LPC/NR district boundary and close to the North Corona / East Elmhurst
edge.** Flagged in §E.

**P-31. Junction Playground** — *"34 Ave. bet. 96 St. and Junction Blvd."* — ZIP **11372**, CB **403**,
*Neighborhood Park*, **0.54 acres** (S3). **At Junction Boulevard, the Corona border.** Flagged in §E.

**P-32. Elmjack Mall** — *"75 St. bet. 37 Ave. and Woodside Ave."* — ZIP **11372, 11373**, Community
Board **403404** (i.e. **both CB3 and CB4**), *Mall*, **0.241 acres** (S3).
**⚠ The name "Elmjack" appears to be a portmanteau of Elmhurst + Jackson Heights, and the record
itself carries two ZIPs and two community boards. This property straddles a boundary by the City's
own data.** Flagged in §E. (The portmanteau reading is **my inference**, not the source's statement.)

**P-33. Mall Thirty Four XXXIV** — *"34 Ave. bet. 79 St. and 92 St., Junction Blvd. and 111 St."* —
ZIP **11368, 11372**, CB **403**, *Mall*, **0.55 acres** (S3).
**This is the Parks-owned malls along the 34th Avenue corridor — the likely official Parks record
behind what S10 calls "Paseo Park" (F-67). Its extent reaches 111th Street, deep into Corona (ZIP
11368).** Flagged in §E.

### C4. Transit

**P-34. Jackson Heights–Roosevelt Avenue/74th Street station** — *"Roosevelt Avenue, 74th Street &
Broadway"* (S13). Neighborhood per S13: **"in Jackson Heights and Elmhurst, Queens"** — i.e. the
source itself assigns it to two neighborhoods. GeoSearch **74-01 Broadway → Elmhurst, 11373**;
GeoSearch **74-10 Roosevelt Avenue → Elmhurst, 11372**. Flagged in §E.

**P-35. Victor A. Moore Bus Terminal** — co-located with P-34. Same assignment ambiguity.

**P-36. 82nd Street–Jackson Heights station** — 82nd Street & Roosevelt Avenue. Neighborhood per S14:
*"on the border of Jackson Heights and Elmhurst"*. GeoSearch **82-10 Roosevelt Avenue → Elmhurst,
11372**. Flagged in §E.

**P-37. 90th Street–Elmhurst Avenue station** — 90th Street, Elmhurst Avenue & Roosevelt Avenue.
Neighborhood per S15: *"on the border of Elmhurst and Jackson Heights"*. GeoSearch **90-01 Roosevelt
Avenue → Jackson Heights, 11372**. Flagged in §E.

**P-38. Junction Boulevard station** — GeoSearch **94-01 Roosevelt Avenue → Jackson Heights, 11372**;
but GeoSearch **40-05 Junction Boulevard → South Corona, 11368**. S10 lists it as a Jackson Heights
station. Flagged in §E.

### C5. Food and retail — SOURCING WARNING

**⚠⚠ READ THIS BEFORE WRITING ANY RESTAURANT.**
For **every** establishment in this subsection, the **ONLY** source I obtained is **S4, the NYC DOHMH
Restaurant Inspection Results dataset** (`43nn-pn8j`), optionally cross-checked for
neighborhood by **S5, the DCP GeoSearch geocoder**. I have **no** press coverage, **no** review,
**no** restaurant website, and **no** institutional writeup for any of them, because WebSearch was
unavailable (§0).

What a DOHMH record establishes: that an establishment with that trade name was registered at that
address with that cuisine code at some inspection date. What it does **NOT** establish: that the
business is currently open, that it is notable, when it was founded, who founded it, its quality, or
anything a visitor would travel for. **Nothing beyond name / address / cuisine / ZIP should be
written from these records.**

| ID | DBA (as recorded in S4) | Address (S4) | ZIP (S4) | Cuisine (S4) | GeoSearch neighborhood (S5) |
|----|------|------|------|------|------|
| P-39 | AREPA LADY | 77-17 37 AVENUE | 11372 | Latin American | (37th Ave block → Jackson Heights) |
| P-40 | HIMALAYAN YAK | 72-20 ROOSEVELT AVENUE | 11372 | Asian/Asian Fusion | **72-20 Roosevelt Ave → WOODSIDE** ⚠ |
| P-41 | LHASA TIBET RESTAURANT & BAR | 76-03 37 AVENUE | 11372 | Asian/Asian Fusion | (37th Ave block → Jackson Heights) |
| P-42 | LHASA SNACK CAFE | 69-11C ROOSEVELT AVENUE | **11377** | Asian/Asian Fusion | **69-11 Roosevelt Ave → WOODSIDE, 11377** ⚠ |
| P-43 | NY LHASALIANG FEN | 74-17 ROOSEVELT AVENUE | 11372 | Asian/Asian Fusion | **74-10 Roosevelt Ave block → ELMHURST** ⚠ |
| P-44 | ESPRESSO 77 | 35-57 77 STREET | 11372 | American | 35-57 77 Street → Jackson Heights |
| P-45 | PHAYUL 2 | 37-59 74 STREET | 11372 | Asian/Asian Fusion | 74 Street → Jackson Heights |
| P-46 | PHAYUL FRESH FOOD | 37-65 74 STREET | 11372 | Asian/Asian Fusion | 74 Street → Jackson Heights |
| P-47 | MERIT KABAB | 37-67 74 STREET | 11372 | **Bangladeshi** | 37-67 74 Street → Jackson Heights |
| P-48 | MERIT KABAB & SWEETS | 37-03 74 STREET | 11372 | **Bangladeshi** | 74 Street → Jackson Heights |
| P-49 | NEPALI BHANCHHA GHAR | 74-11 ROOSEVELT AVENUE | 11372 | Asian/Asian Fusion | **74-10 Roosevelt Ave block → ELMHURST** ⚠ |
| P-50 | MAHARAJA QUALITY SWEETS | 73-10 37 AVENUE | 11372 | **Indian** | 73-10 37 Avenue → Jackson Heights |
| P-51 | LA NUEVA BAKERY | 86-10 37 AVENUE | 11372 | Bakery Products/Desserts | 37th Ave → Jackson Heights |
| P-52 | LA NUEVA DELICIA | 93-16B 37 AVENUE | 11372 | Latin American | (93rd St — east edge) |
| P-53 | PUNTO COLOMBIANO EN LA NUEVA 90 BAKERY | 37-06 90 STREET | 11372 | Latin American | (90th St) |
| P-54 | URUBAMBA | 86-20 37 AVENUE | 11372 | **Peruvian** | 37th Ave → Jackson Heights |

**Observations offered as candidates, not conclusions:** the DOHMH cuisine codes at these addresses
do independently show Bangladeshi, Indian, Nepali, Tibetan/Himalayan, Latin American and Peruvian
establishments clustered on 74th Street, 37th Avenue and Roosevelt Avenue in ZIP 11372. That is
dataset evidence consistent with F-61/F-62, but it is **not** a source for any narrative claim about
those communities.

**Searched for and NOT found in S4 within ZIPs 11372/11377/11104/11373:** JACKSON DINER, DELHI
HEIGHTS, TABLE WINE, TORTAS NEZA, RAJBHOG, PATEL BROTHERS, MUSTANG THAKALI, BIRRIA, SHIVA SHANKAR.
**Absence from an inspection dataset is not evidence a business never existed** — DOHMH covers only
currently/recently permitted food-service establishments and the dataset drops closed records.
Jackson Diner in particular is a widely known 74th Street institution that I could **not** source at
all; treat as an unresolved gap, not a refutation.

### C6. Places named by aggregators that I could NOT source

Recorded so the verifier knows they were considered and are **unsourced** here:
**P-55.** Satya Narayan Mandir — S10 gives *"76th St & Woodside Ave"*, 1987, and claims it is the
*"Oldest Hindu-Sikhism combination temple in the United States"*. **⚠ GeoSearch for
76-16 Woodside Avenue returns → ELMHURST, 11373.** The claim and the address are both aggregator-only
and the geocoder disagrees with the neighborhood. Flagged in §E.
**P-56.** Muhammadi Community Center — S10: **37–46 72nd Street**, 1995. Aggregator-only.
**P-57.** The Eagle Theatre / Jackson Triplex, 73-07 37th Road — **no source obtained** (Wikipedia
404). GeoSearch **73-07 37 Road → Jackson Heights, 11372** confirms only that the address exists in
Jackson Heights. **No source that a theatre is there.**
**P-58.** Diversity Plaza (37th Road at 73rd/74th Streets) — **no source obtained** (Wikipedia 404,
no DOT page reached). GeoSearch **37-01 73 Street → Jackson Heights, 11372**. **Do not write without
a source.**
**P-59.** Jackson Heights Greenmarket — S10 mentions a *"Year-round greenmarket Sunday mornings"* at
Travers Park; GrowNYC returned 403. Aggregator-only.
**P-60.** Renaissance Charter School, 82nd Street Academics, Our Lady of Fatima School, P.S. 149,
P.S. 212, P.S. 222, I.S. 145, I.S. 230 — all S10 aggregator-only; the DOE dataset query failed.

---

## D. RICHEST VEINS (ranked, for the writer)

1. **The LPC designation report LP-1831 (S1).** By far the deepest and the only true primary
   narrative source here. It supports the garden-apartment story end to end — the block-as-unit
   planning concept, named complexes with architects and dates, the cooperative-ownership scheme,
   MetLife's $8M, the abandoned Ernest Flagg block, the vanished golf course and 34th Avenue median,
   the two cathedral-scale churches finished decades late in reduced form, and the claim that the
   commercial streets were deliberately styled to match the housing. Local text file is on disk.
2. **The churches that were begun as one building and finished as another** (F-38, F-39). St. Joan
   of Arc was designed as a French Gothic cathedral for a Queens diocese that was never created, sat
   as a basement for ~25 years, and was completed in 1951 as Italian Romanesque. First Church of
   Christ, Scientist has the same shape of story. This is unusual, primary-sourced, and visitor-facing.
3. **The lost recreational landscape** (F-22, F-23, P-13, P-29). A golf course, country club and
   tennis courts, plus a planted median down 34th Avenue that once linked the Chateau's and the
   Towers' gardens into a two-block greenway — all gone, with Dunolly Gardens standing on the golf
   course. Primary-sourced.
4. **Travers Park (S2)** — a full primary NYC Parks history with a named, dated, biographied
   namesake, including his cross-boundary "Woodside-Jackson Heights" district leadership.
5. **Garden School (S6)** — the only institution with a rich, self-published, dated history, and it
   ties directly back to the Queensboro Corporation and to Laburnum Court.
6. **LGBTQ civic history** (F-57, F-58) — Julio Rivera's 1990 murder, the corner renamed in 2000, and
   the Queens Pride Parade founded 1993 on 37th Avenue. Aggregator-sourced only, so it needs
   verification, but it is high-value and specific.
7. **Transit** (F-50–F-55) — 1917 elevated, the 74th Street complex as the busiest station in Queens,
   the $132M green bus terminal, and the "International Express" National Millennium Trail.

**Thinnest veins — writer beware:** every restaurant (§C5, DOHMH-only), the commercial-corridor
ethnography (F-61), the Tibetan-capital claim (F-62), the NYT "most diverse" quote (F-60), Diversity
Plaza and the Eagle Theatre (P-57, P-58 — literally unsourced), and the exclusionary-covenant history
which I could not source at all (F-16).

---

## E. CONTESTED NEIGHBORHOOD ASSIGNMENTS — recorded, NOT resolved

Per the brief, every place any source assigns to a different one of the three wave-2 neighborhoods
(or otherwise disputes) is listed here. **I make no determination on any of these.**

### E1. Contested between Jackson Heights and WOODSIDE (the wave-2 sibling)

| Place | Address | Conflicting assignments |
|---|---|---|
| **P-40 Himalayan Yak** | 72-20 Roosevelt Avenue | S4 (DOHMH) records **ZIP 11372** (the Jackson Heights ZIP); S5 (DCP GeoSearch) returns **"72-20 ROOSEVELT AVENUE, Woodside, NY, USA / neighbourhood=Woodside"**. Same address, two city sources, two neighborhoods. |
| **P-42 Lhasa Snack Cafe** | 69-11C Roosevelt Avenue | S4 ZIP **11377** and S5 **Woodside** both say Woodside — but it sits on the Roosevelt Avenue/7-train corridor commonly written up as Jackson Heights. Recorded because the Woodside finder will likely claim it. |
| **Roosevelt Avenue frontage, 72nd–73rd Streets** (whole blockfront) | 72-10 and 73-10 Roosevelt Ave | S5 returns **Woodside** for both, with **ZIP 11372**. The ZIP says Jackson Heights, the geocoder says Woodside. |
| **F-66 Travers Park's namesake** | 34 Ave bet. 77 & 78 St | S2 (NYC Parks, primary) states Thomas J. Travers *"served as Democratic District Leader for **Woodside-Jackson Heights**"*. The park is unambiguously in Jackson Heights; the man's political district was shared. Shared-fact risk with the Woodside finder. |
| **F-51 "International Express" National Millennium Trail** | IRT Flushing Line | S17's own wording runs the trail *"from Sunnyside to Flushing"* — it passes through and is claimable by **all three** wave-2 neighborhoods. Coordinator arbitration needed. |
| **General Hart Playground / Pigeon Paradise** | *"Broadway, 37 Ave. bet. 65 St. and 69 St."* and *"Broadway, 69 St., 37 Ave."* | S3 records both at **ZIP 11377, CB 402** (Woodside). Listed here only because S2's Travers Park page names **General Hart Playground** as one of the nearest parks (0.55 miles), and because they sit on **37th Avenue**, the street S1 calls Jackson Heights' *"commercial spine"*. Both appear to be Woodside's, not Jackson Heights'. |

### E2. Contested between Jackson Heights and SUNNYSIDE

| Place | Conflicting assignments |
|---|---|
| **F-51 "International Express"** | See above — S17 anchors the trail's western end at **Sunnyside**. |
| **F-16 / S1 passage on Andrew J. Thomas** | S1 (primary) states a corporation *"hired Queensboro's architect, Andrew J. Thomas, to design its three initial complexes, which are located in **Sunnyside, Astoria, and Woodside**, all in Queens."* The **architect** is shared across Jackson Heights, Sunnyside, Woodside **and** wave-1 Astoria. Any Thomas biography material is contested by all four. **Do not let Jackson Heights claim Thomas exclusively.** |

*(No place-level Jackson Heights/Sunnyside address conflict surfaced; S25 records no Sunnyside claim
overlapping Jackson Heights, and the two are not adjacent.)*

### E3. Contested with ELMHURST / CORONA / EAST ELMHURST (outside the wave, but recorded)

| Place | Address | Conflicting assignments |
|---|---|---|
| **P-34 Jackson Heights–Roosevelt Av/74 St station** | Roosevelt Av, 74 St & Broadway | S13 itself: *"in Jackson Heights and Elmhurst, Queens."* S5: 74-01 Broadway → **Elmhurst**; 74-10 Roosevelt Ave → **Elmhurst**. The station carries "Jackson Heights" in its name. |
| **P-36 82nd Street–Jackson Heights station** | 82 St & Roosevelt Av | S14: *"on the border of Jackson Heights and Elmhurst."* S5: 82-10 Roosevelt Ave → **Elmhurst**. Again the station name says Jackson Heights. |
| **P-37 90th St–Elmhurst Avenue station** | 90 St, Elmhurst Av & Roosevelt Av | S15: *"on the border of Elmhurst and Jackson Heights."* S5: 90-01 Roosevelt Ave → **Jackson Heights**. |
| **P-38 Junction Boulevard station** | Junction Blvd & Roosevelt Av | S5: 94-01 Roosevelt Ave → **Jackson Heights**; 40-05 Junction Blvd → **South Corona**. S10 lists it as Jackson Heights. |
| **P-32 Elmjack Mall** | 75 St bet. 37 Av and Woodside Av | S3 (city data) itself records **two ZIPs (11372, 11373)** and **two community boards (403 and 404)**. Straddles by the City's own record. |
| **P-33 Mall Thirty Four XXXIV** | 34 Av bet. 79 St and 92 St, Junction Blvd and 111 St | S3 records **ZIPs 11368 and 11372** — extends into Corona. |
| **P-43 NY Lhasaliang Fen**, **P-49 Nepali Bhanccha Ghar** | 74-17 and 74-11 Roosevelt Ave | S4 ZIP **11372**; S5 for the 74-10 Roosevelt Ave block → **Elmhurst**. |
| **P-30 Northern Playground**, **P-31 Junction Playground** | Northern Blvd 93–94 St; 34 Av 96 St–Junction Blvd | S3 ZIP 11372 / CB403 = Jackson Heights, but both lie **east of every stated historic-district boundary** and abut North Corona / East Elmhurst. |
| **P-55 Satya Narayan Mandir** | S10: "76th St & Woodside Ave" | S10 assigns it to **Jackson Heights**; S5 for 76-16 Woodside Avenue returns **Elmhurst, 11373**. The street is literally named Woodside Avenue. |

### E4. ⚠ Contested with a WAVE-1 neighborhood already shipped

| Item | Conflict |
|---|---|
| **F-64 Chester Carlson / invention of xerography** | S10 (Jackson Heights article) lists Carlson as having *"invented Xerox copy machine in Jackson Heights kitchen"*. S20 (Carlson's own article) states he *"rented a room on the second floor of a house owned by his mother-in-law at **32-05 37th Street in Astoria, Queens**"* and labels the first image *"Astoria 10-22-38"*. **Astoria/Ditmars-Steinway shipped in wave 1.** If wave 1 already wrote Carlson, Jackson Heights must not re-claim the invention. Highest-priority arbitration item in this dossier. |
| **P-61 Lent Homestead and Cemetery** | S10 lists it among Jackson Heights' *"Other National Register Properties"*. S23 gives the address **78-03 19th Rd., East Elmhurst** and states it is in the *"Steinway and East Elmhurst neighborhoods of Queens"* — NRHP ref **84002918**, listed **1984-02-02**. **This is a Ditmars-Steinway/East Elmhurst property, not a Jackson Heights one.** S11's Queens NRHP list did not return it under Jackson Heights. |
| **F-8 Long Island City** | S1 (primary) attributes Jackson Heights' growth partly to *"the rapid growth of Long Island City as one of the city's largest manufacturing centers."* LIC shipped in wave 1. Shared causal fact. |
| **F-16 Andrew J. Thomas in Astoria** | See E2 — S1 places Thomas's other work in Astoria as well as Sunnyside and Woodside. |

### E5. Non-geographic discrepancies also recorded (for completeness)

- **F-1/F-3:** Queensboro acquisition year **1909** (S2, primary) vs **1910** (S1, primary). Two
  primary city/agency sources disagree.
- **F-4:** named for **John C. Jackson directly** (S2) vs named for **Jackson Avenue** (S10).
- **F-25/F-26/F-31/F-34:** construction dates for the Greystones, Linden Court, the Chateau and
  Dunolly Gardens differ between S1 (primary, gives date ranges) and S10/S12 (aggregators, give single
  years).
- **F-37:** St. Mark's Episcopal built **1927** (S1) vs **1923** (S10); and S10's claim it was
  individually *"designated NYC landmark 1993"*.
- **F-47:** three mutually inconsistent NR district boundary descriptions (90th St / 93rd St / 70th St).
- **F-63:** Scrabble invented **1931** (S21) vs **1938** (S10); church involvement claimed by S10 only.
- **P-23:** S10 says the Jackson Heights post office is on the National Register; S11's Queens NRHP
  list returned **only** the historic district for Jackson Heights.
- **F-46:** the "~600 buildings" count for the LPC district is aggregator-only; I did not find it in S1.

---

## F. TALLY

- **Candidate facts recorded: 67** (F-1 … F-67)
- **Candidate places recorded: 61** (P-1 … P-61)
- **Places with contested neighborhood assignment: 20** (see §E)
- **Places whose only source is a DOHMH inspection dataset: 16** (P-39 … P-54, plus the
  not-found list) — see the §C5 warning
- **Places explicitly recorded as UNSOURCED: 6** (P-55 … P-60)

*Finder output only. No verdicts, no confirmations, no adjudication.*
