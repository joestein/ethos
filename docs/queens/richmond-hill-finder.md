# Richmond Hill, Queens — FINDER dossier (wave 6, Community District 9)

**Role: FINDER only.** Nothing below is adjudicated, confirmed, or verified. Every item is a
**candidate**. Verdicts belong to the verifier. Where sources disagree I record *both* and resolve
*neither*.

**Quotation convention (read before using anything below):**
- Text inside `"…"` after the marker **QUOTE:** is copied verbatim from the cited source.
- Text after **PARAPHRASE:** is my own wording. It is NOT a quote and must never be presented as one.
- **DERIVED:** marks a result I computed from open data (geocode + point-in-polygon), not a sentence
  any source wrote. It is evidence, not a quotation.
- **OCR NOTE:** marks a quote taken from a scanned PDF where the character recognition is visibly
  imperfect. I reproduce the OCR exactly and flag the garbled characters.

**Counts: 396 candidate facts (F1–F396) across 62 candidate places (P1–P62).**
(Both sequences are contiguous with no gaps — verified programmatically against the finished file.
Some places share a definition line where the source names them only as a bare list: P24–P27
(private schools), P56–P57 (police/fire), P53–P54 (schools). Sixteen places carry a contested
neighborhood assignment; they are tabulated in §14.)

---

## 0. METHOD AND LIMITATION DISCLOSURE

**F1.** WebSearch was **unavailable, then budget-exhausted**, for this session. My first two calls
returned a classifier-unavailable error; a later call returned `this session has used its web search
budget (200 of 200 WebSearch calls)`. The budget is shared with sibling agents in this wave.

**F2.** WebFetch was likewise unavailable at the start of the session, and when it recovered it was
**403-blocked by `nycgovparks.org`**. Everything below was therefore retrieved by **direct HTTP
fetch with a browser user-agent** from a Python script, plus:
- the **Wikipedia action API** (`action=query&prop=extracts&explaintext=1`; `action=parse` for
  wikitext; `list=search`),
- the **NYC Open Data / Socrata API** (LPC Individual Landmark Sites `buis-pvji`; Parks Properties
  `enfh-gkve`; 2020 NTAs `9nt8-h7nd`; DOHMH restaurant inspections `43nn-pn8j`),
- the **NYC DCP GeoSearch** geocoder (`geosearch.planninglabs.nyc/v2/search`),
- **NPGallery** (NPS) for National Register nomination PDFs,
- **`s-media.nyc.gov/agencies/lpc/lp/<n>.pdf`** for LPC designation reports.

**F3. Consequence: coverage is deep on government/institutional primary sources and thin on press.**
I retrieved the **full 4,122-line Richmond Hill Historic District National Register nomination** and
**three complete LPC designation reports**. I could **not** search local outlets (QNS, Queens
Chronicle, Queens Eagle) or retrieve the *New York Times* articles the nomination cites. Any NYT
material below appears only as *the nomination quoting the NYT*, and is flagged as such.

### 0.1 Failed retrievals, recorded so the verifier does not repeat them

**F4.** The National Register nomination PDFs for **Church of the Resurrection (03000090)**,
**Public School 66 (03000850)** and **Saint Benedict Joseph Labre Parish (06001297)** at
`https://npgallery.nps.gov/NRHP/GetAsset/NRHP/<refnum>_text` each returned an **identical
22,151-byte stub** (verified: all three share MD5 `5a5935ef18defe9117af9f29969055d5`) whose entire
text content is:
> **QUOTE:** `"The PDF file for this National Register record has not yet been digitized."`

**The primary nomination text is therefore NOT in evidence for any of those three listings.**
Everything below about them comes from the Wikipedia NRHP listing table, the individual Wikipedia
articles, or the *Richmond Hill Historic District* nomination's incidental references.

**F5.** `https://npgallery.nps.gov/NRHP/GetAsset/NRHP/100007667_text` (**Kent Manor**) returned a
**PNG image**, not a PDF. No Kent Manor nomination text is in evidence.

**F6.** `https://www.sikhculturalsociety.org/` failed with a **TLS handshake error**
(`TLSV1_ALERT_INTERNAL_ERROR`). **There is no official-website evidence for the Sikh Cultural
Society in this dossier.** See §5 — this is a serious gap on what is plausibly the neighborhood's
single most significant religious institution.

**F7.** `resurrectionrh.org` **does not resolve** (DNS failure). The Wikipedia article's "External
links" section references "The Church of the Resurrection website" but I could not reach it.

**F8.** `richmondhillhistory.org/homes` and `/noteworthy-people` both returned **404**.
`https://forgotten-ny.com/2015/03/richmond-hill-queens/` returned **404**. The Queens Public Library
location pages at both `queenslibrary.org` and `queenslib.org` returned **244-byte stubs** (a
redirect shell with no content) — **no QPL branch page content is in evidence.**

**F9. `nycgovparks.org/parks/Q217/monuments` returned a zero-byte response.** The Morris Park World
War I Memorial (P13) is therefore attested **only** by one sentence on the McConnell Park history
page, with no monument record behind it.

### 0.2 A provenance trap the verifier must know about

**F10.** The **Richmond Hill Historical Society**'s "CHURCHES" page
(`https://richmondhillhistory.org/churches`) is a **verbatim copy of the Wikipedia article** on the
Church of the Resurrection — it reproduces Wikipedia's text word for word **including the leftover
footnote markers `[2]`**. RHHS is therefore **NOT an independent source** for the Church of the
Resurrection. Anything that appears to be "corroborated by the local historical society" on that
subject is Wikipedia cited twice. Its "BUSINESSES" page has **no content at all** — just the site
chrome and the footer.

### 0.3 The geo method used for DERIVED assignments

**F11. DERIVED.** For each candidate place I geocoded the street address through **NYC DCP
GeoSearch**, then ran a ray-casting point-in-polygon test of the resulting coordinate against the
**82 Queens polygons of the DCP 2020 Neighborhood Tabulation Areas** (`9nt8-h7nd`). Results are
labelled **DERIVED** throughout. This is DCP's statistical geography, **not** a boundary any source
wrote in prose, and it must not be reported as if a source said it.

**F12. DERIVED.** DCP's 2020 NTA layer splits this neighborhood into **two** NTAs, both inside CDTA
`QN09`:
- `QN0902` **Richmond Hill** (abbrev `RchmdHl`), shape_area 30,269,746
- `QN0903` **South Richmond Hill** (abbrev `SthRchmdHl`), shape_area 15,849,140

**F13.** The CDTA that contains both is named, in DCP's own field,
> **QUOTE:** `"QN09 Kew Gardens-Richmond Hill-Woodhaven (CD 9 Approximation)"`

This is the same three-neighborhood grouping used in NYC Health's Community Health Profile, and it
is the reason nearly every health/education statistic below is reported for **"Richmond Hill and Kew
Gardens" jointly** and cannot be disaggregated. **Flag for the verifier: no statistic in §9 is a
Richmond-Hill-only figure.**

---

## 1. BOUNDARIES — FOUR SOURCES, FOUR DIFFERENT ANSWERS

This is the single most contested area of the dossier. **Do not let any one of these stand as "the"
boundary.**

### 1.1 Wikipedia's boundary

Source: `https://en.wikipedia.org/wiki/Richmond_Hill,_Queens`

**F14. QUOTE:** `"The area borders Kew Gardens and Forest Park to the north, Jamaica and South
Jamaica to the east, South Ozone Park to the south, and Woodhaven and Ozone Park to the west."`

**F15. QUOTE:** `"Hillside Avenue forms its northern boundary with Kew Gardens east of Lefferts
Boulevard, while Forest Park and the right-of-way of the Long Island Rail Road (LIRR)'s Montauk
Branch form its northern edge west of Lefferts."`

**F16. QUOTE:** `"Its western boundary north of Atlantic Avenue is formed by the LIRR's abandoned
Rockaway Beach Branch; south of Atlantic, the western border lies between 104th and 107th
Streets."`

**F17. QUOTE:** `"The southern border extends to around 103rd Avenue or Liberty Avenue."`
— note the source itself hedges with "or".

**F18. QUOTE:** `"The Van Wyck Expressway abuts the eastern end of the community."`

**F19. QUOTE:** `"The portion of the neighborhood south of Atlantic Avenue is also known as South
Richmond Hill."`

### 1.2 The Landmarks Preservation Commission's boundary — materially different

Source: LPC designation report **LP-2126**, `http://s-media.nyc.gov/agencies/lpc/lp/2126.pdf`,
December 17, 2002.

**F20. QUOTE (OCR NOTE — "10ot1" is the scan's garbling of "100th"; "Myrtle and Hillside streets"
is verbatim, including "streets" for what are avenues):**
> `"Richmond Hill is a neighborhood located in east central Queens, adjacent to Jamaica and bounded
> to the north by Myrtle and Hillside streets, to the east by the Van Wyck Expressway, to the south
> by Linden Boulevard, and to the west by 10ot1 Street."`

**F21.** **This conflicts with Wikipedia on three of four sides.** LPC puts the southern boundary at
**Linden Boulevard** — roughly a mile south of Wikipedia's "103rd Avenue or Liberty Avenue" (F17) —
and the western boundary at **100th Street**, west of Wikipedia's "between 104th and 107th Streets"
(F16). Only the eastern boundary (Van Wyck Expressway) agrees. **Record; do not resolve.**

### 1.3 The National Register nomination's boundary — a third framing

Source: NRHP nomination for the Richmond Hill Historic District, refnum **100003430**,
`https://npgallery.nps.gov/NRHP/GetAsset/NRHP/100003430_text` (12.5 MB, retrieved in full).

**F22.** The nomination's cover sheet gives the district's ZIP codes as
> **QUOTE:** `"11415, 11418"`

**11415 is the Kew Gardens ZIP code.** The historic district straddles it. **Flag.**

**F23. QUOTE:** `"The district is bounded on the north by the natural boundary of Forest Park and
the historic boundary of 84th Avenue (originally known as Division Avenue since it demarcated the
boarder with Kew Gardens)."` — "boarder" is the nomination's own spelling.

**F24. QUOTE:** `"To the east, south, and west the district stops short of Lefferts Boulevard and
Myrtle Avenue, two wide and heavily trafficed streets that form logical boundaries as major visual
and physical barriers."` — "trafficed" is the nomination's own spelling.

**F25.** On the extent of the *original 1868 plan* (not the district):
> **QUOTE:** `"the entirety of Man and Richmond's 1868 plan—which encompassed an extensive area from
> Jamaica Avenue on the south to Union Turnpike on the north, and from 110th Street on the west to
> approximately 121st Street on the east."`

**F26.** On what became Kew Gardens:
> **QUOTE:** `"Areas that were never developed according to their plan were then excluded, amounting
> essentially to the area north of 84th Avenue; this area would later develop under a different
> street plan as the neighborhood of Kew Gardens."`

**F27.** From the Boundary Justification section:
> **QUOTE:** `"The boundaries generally follow clear visual barriers: Forest Park and 84th Avenue
> (originally Division Avenue, separating Richmond Hill from Kew Gardens) to the north; Myrtle
> Avenue to the southwest. The eastern boundary was drawn to exclude larger apartment buildings not
> in keeping with the historic character of the neighborhood, while the southern boundary excludes
> houses that do not retain sufficient architectural integrity."`

**F28.** Acreage of the historic district: **QUOTE:** `"29.97 acres"`.

**F29.** A footnote adds a detail that complicates the Kew Gardens relationship further:
> **QUOTE:** `"The unrealized Hill Section was laid out according to Picturesque design ideals, with
> curvilinear streets that responded to the existing topography. This section was also mostly within
> the boundaries of the Town of Newtown, rather than Jamaica."`

**F30.** And the extent of the realized southern section:
> **QUOTE:** `"The historic district comprises a smaller part of this southern section, which
> stretched from what is now Jamaica Avenue in the south to 84th Avenue in the north, and from 110th
> Street in the west to Lefferts Boulevard in the east."`

### 1.4 Wikipedia's *Historic District* article contradicts the nomination it describes

Source: `https://en.wikipedia.org/wiki/Richmond_Hill_Historic_District`

**F31. QUOTE:** `"It is bounded to the north by Park Lane South, to the east by 118th Street, to the
south by Myrtle Avenue."`
**This does not match F23/F24/F27.** The nomination says the north boundary is Forest Park **and
84th Avenue**, and that the district *stops short of* Myrtle Avenue rather than being bounded by it.

**F32. QUOTE:** `"The district includes 200 contributing buildings built between 1890 and 1915."`
**The nomination says otherwise** — see F33.

**F33. QUOTE (nomination):** `"The historic district contains 185 houses, most of them freestanding,
wood-framed, the vast majority of which are contributing resources to the historic district (173
contributing versus 12 non-contributing). Many of the houses have freestanding garages, of which 128
are contributing and only 6 are non-contributing. Jacob Riis Triangle is counted as a contributing
site."`

**F34.** The nomination's **period of significance is `"1868-1930"`**, not Wikipedia's "1890 and
1915". **QUOTE (nomination, Significant Dates field):** `"1868 (Plan); 1895 (Establishment of
Village) 1917 (Jamaica Avenue elevated)"`.

**F35. QUOTE (Wikipedia HD article):** `"Richmond Hill, one of the first garden communities in
eastern Queens County was acquired in 1868 by Englishman Albon P. Man, who developed the
neighborhood of Hollis Hill."`
**Three problems, all flagged, none resolved:** the nomination calls Man a **Manhattan lawyer**, not
an Englishman (F44); **"Hollis Hill" appears nowhere** in the nomination or in either LPC report;
and Richmond Hill is in **western/central**, not eastern, Queens by every other source here.

**F36. QUOTE (Wikipedia HD article):** `"The dominant architecture is called the Shingle style."`
**The nomination says the opposite emphasis:** **QUOTE:** `"A few houses in the neighborhood can be
classified as Shingle Style"`, against **QUOTE:** `"The predominant styles within Richmond Hill
include eclectic Queen Anne and the Shingle Style designs, Classically inspired Renaissance Revival
and Colonial Revival houses, and examples of Dutch Colonial, Tudor Revival, and Craftsman
architecture."`

**F37. QUOTE (Wikipedia HD article):** `"after the nomination was revamped in 2017, it was accepted
by the Landmark Preservation Commission on December 6, 2018, and added to the state registry."`
**Flag: the LPC does not administer the State Register** — that is the New York State Board for
Historic Preservation. Treat this sentence as unreliable.

**F38. QUOTE (Wikipedia HD article):** `"The district is bisected by the former South Side Railroad
line, which had a station on Hillside Avenue called Clarenceville."`
**Conflicts with F97/F99:** the Clarenceville *name* belonged to the Hillside Avenue station only
until 1871, and a **separate** Clarenceville station existed on the Atlantic Branch at 111th Street.

### 1.5 Internal contradictions inside the main Wikipedia article

**F39.** The article says both **QUOTE:** `"The neighborhood is split between Queens Community Board
9 and 10."` and, two paragraphs later, **QUOTE:** `"Richmond Hill is located in Queens Community
District 9"`. **Unreconciled within the source.**

**F40.** It gives ZIP codes twice, differently: **QUOTE:** `"its ZIP Codes are 11418 and 11419"` and
**QUOTE:** `"Richmond Hill is covered by the ZIP Code 11418 as well as parts of 11416, 11419, and
11421."`

**F41.** **DERIVED.** NYC Parks' own page for Phil "Scooter" Rizzuto Park lists
`Zip Code: 11418, 11419` while the Parks Properties open-data row for the same property (`Q129`)
carries the single value `11419`. Minor, but it shows ZIP is not a clean discriminator here.

---

## 2. HISTORY — the deepest vein in this dossier

The Richmond Hill Historic District nomination is a **60-page professionally researched primary
document** and is by a wide margin the best source available for this neighborhood. Cite it as
`https://npgallery.nps.gov/NRHP/GetAsset/NRHP/100003430_text`.

### 2.1 Pre-colonial and colonial

**F42.** Two sources name **different** Indigenous peoples for this land.
- **QUOTE (Wikipedia, main article):** `"Before European colonization the land was occupied by the
  Rockaway Native American group, for which the Rockaways were named."`
- **QUOTE (NRHP nomination):** `"This area was originally inhabited by the Native American tribe
  known as the Jameco or Yamecah, meaning "beaver" in Algonquin."`
- **QUOTE (LPC LP-2317, P.S. 66):** `"Jamaica was inhabited by a Native American tribe called the
  Jameco or Yamecah, a word meaning Beaver in Algonquin, when the first Europeans arrived there in
  1655."`

**Two institutional sources say Jameco/Yamecah; Wikipedia says Rockaway. Record both. Do not
resolve.** Note also that the two Jameco sources give **different contact dates** — the nomination
says the English petitioned Stuyvesant in **1656**, LP-2317 says the settlers arrived in **1655**
and applied in **1656**.

**F43. QUOTE (nomination):** `"In 1656 English colonists from Massachusetts and Long Island
petitioned Dutch governor Petrus Stuyvesant for a patent to settle the area, paying a nominal
"purchase" price to the Native American occupants (who considered the deal more like a joint tenancy
agreement)."`

**F44. QUOTE (nomination):** `"When the English conquered the Dutch colony in 1664, the settlement of
Rustdorp was renamed Jamaica. Queens County was chartered in 1683 and Jamaica was given official
status as a town, one of three in the borough along with Newtown and Flushing."`

**F45. QUOTE (Wikipedia):** `"In 1660, the Welling family purchased land in what was then the western
portion of the colonial town of Rustdorp."`

**F46. QUOTE (nomination):** `"The King's Highway, now Jamaica Avenue, is considered the oldest
continually used road on Long Island and brought significant trade activity to Jamaica center (it
was established in 1703 and later privatized by the Jamaica & Brooklyn Plank Road Company)."`

**F47.** On the Revolutionary War claim — **this one needs scrutiny.**
**QUOTE (Wikipedia):** `"The Battle of Long Island, one of the bloodiest battles of the Revolutionary
War, was fought in 1776 along the ridge in present-day Forest Park, near what is now the golf course
clubhouse."`
NYC Parks repeats it nearly verbatim on the McConnell Park page: **QUOTE:** `"In 1776 the Battle of
Long Island was fought along the ridge in Forest Park, near what is now the golf course clubhouse."`
**Flag: this describes an event located inside Forest Park, which is ruled out of scope for this
file.** It is recorded here only so the verifier can see it exists and rule on whether the *ridge*
claim can be stated without narrating Forest Park.

**F48. QUOTE (Wikipedia):** `"One of the sites that would make up modern Richmond Hill, Lefferts
Farm, was said to be the site of a Revolutionary War battle."` — note the source's own hedge, `"was
said to be"`.

### 2.2 Clarenceville — three incompatible foundings

**F49. QUOTE (Wikipedia):** `"Clarenceville, a farming community, was established in January 1853 on
the south side of Jamaica Avenue between 110th and 112th Streets on land purchased from the Welling
estate."`

**F50. QUOTE (NRHP nomination):** `"The suburban community of Clarenceville, located between Atlantic
and Jamaica Avenues just south of the area that would become Richmond Hill, was platted in 1853 by
Clarence Miliken and Jacob Pecare, although it remained primarily agrarian through the late 19th
century."`

**F51. QUOTE (LPC LP-2473, Eldridge House):** `"Located south of what is now Jamaica Avenue and
traversed by the Long Island Rail Road's Atlantic Avenue division, the parcel was subdivided into
building lots in 1853 by Jacob Pecare, a New York City businessman."`

**F52.** **The three disagree on who platted it** (unnamed / Miliken *and* Pecare / Pecare alone) and
on its **extent** (110th–112th Streets south of Jamaica Ave / between Atlantic and Jamaica Avenues).
All three agree on **1853**. Record all three.

**F53. QUOTE (LP-2473):** `"59 acres in western Jamaica were purchased from the Welling family,
farmers and landowners since the 17th century."`

**F54. QUOTE (LP-2473):** `"Clarenceville, as the area was named, was heavily promoted in the early
1850s for its beauty, convenient location, and accessibility by public transportation, but little
development had taken place when Daniel Eldridge, a clerk in New York City's Water Department and
alleged member of the Tweed Ring, purchased six lots in 1867 and 1869."`

**F55. QUOTE (LP-2473):** `"Clarenceville, which was incorporated into Richmond Hill in 1895,
remained largely undeveloped until the turn of the 20th century."`

### 2.3 Morris Grove and Morris Park

**F56. QUOTE (nomination):** `"To the east, the Morris Grove picnic grounds opened by the mid 1850s,
catering to urban weekenders and pleasure seekers."`

**F57. QUOTE (nomination):** `"Morris Park (named for the site of the old Morris Grove picnic grounds,
just south of Jamaica Avenue) was platted around 1884."`

**F58. QUOTE (Wikipedia):** `"Richmond Hill was incorporated as an independent village in 1894, by
which time it had also absorbed the Morris Park neighborhood, which had been established in 1885."`

**F59. CONFLICT.** Wikipedia says Morris Park was **established 1885** and the village incorporated
**1894**. The nomination says Morris Park was **platted around 1884** and the village incorporated
**1895** (F34, F63). LP-2126 also says **1895** (F62). **Record all; resolve none.**

### 2.4 Brooklyn Hills, Richmond Hill Terrace, Waterbury

**F60. QUOTE (nomination):** `"Brooklyn Hills, east of Richmond Hill between 102nd and 104th Streets,
was laid out in 1887, the same year that the Jamaica Avenue horsecar line was replaced with an
electric trolley."`
**Flag an internal oddity in the source:** 102nd–104th Streets are **west** of the Richmond Hill
core, not east. The nomination says "east". Record the quote as written.

**F61. QUOTE (nomination):** `"Richmond Hill Terrace, to the west of the original Richmond Hill
neighborhood, was established in 1893, when the Gassin Estate was laid out into 25-foot lots by
surveyor James F. Deehan. The development encompassed 15 blocks between Garfield and Welling Streets
(now 106th to 110th Streets), immediately adjacent to the historic district."`

**F62.** A footnote gives the auction detail:
**QUOTE:** `"On September 22, 1894 was held a "Public Auction of the Gassin Estate, Richmond Hill
Terrace...Containing 500 Lots...The choicest Building Lots ever offered in the vicinity of the City
of Brooklyn.""`

**F63.** **QUOTE (nomination footnote):** `"That same year, in 1905, the former Waterbury Estate
encompassing the area between 104th and 106th Street—the last of the old farmsteads in the vicinity
of Richmond Hill—was finally subdivided and opened for development."`

### 2.5 The railroad that made the suburb

**F64. QUOTE (nomination):** `"Richmond Hill is a quintessential mid 19th century railroad
suburb—acquired, designed, and subdivided within months of the opening of the South Side Railroad in
1868."`

**F65. QUOTE (nomination):** `"The Brooklyn and Jamaica Railroad running along Atlantic Avenue was
chartered in 1832; it was soon incorporated into the Long Island Rail Road (LIRR), which opened a
stop at Jamaica in 1836."`

**F66. QUOTE (nomination):** `"These areas were further linked to the metropolis with the opening of
the East New-York & Jamaica Horse Railroad along Jamaica Avenue in 1866 and the creation of a LIRR
station at Atlantic and Greenwood Avenues (now 111th Street) the following year."`

**F67. QUOTE (nomination):** `"Construction west from Jamaica to the ferry terminal at South 7th
Street (now Broadway) in Williamsburg commenced in the spring of 1867 and was open to 118th Street
by that December. The line was completed the following year and the first passenger train from
Jamaica to Brooklyn ran on July 18, 1868."`

**F68. QUOTE (nomination):** `"With a stop at 118th Street just north of Jamaica Avenue, Richmond Hill
was now an easy and relatively inexpensive commute to the cities of Brooklyn and Manhattan."`

**F69.** A footnote settles the station's renaming:
**QUOTE:** `"The station was originally named for the adjacent farm settlement of Clarenceville. It
was renamed Richmond Hill in 1871 as the neighborhood north of Jamaica assumed greater prominence."`

**F70.** Wikipedia's account of the two Clarenceville stations —
**QUOTE (Wikipedia, *Clarenceville station (LIRR)*):** `"Richmond Hill station to the north, at
Jamaica Avenue and Lefferts Boulevard, was also originally named Clarenceville Station when it
opened in 1868, but that name was changed in 1871."`
**Note the date conflict with F72:** the *Richmond Hill station* article says the South Side Railroad
built it in **1869**, not 1868.

### 2.6 Albon Platt Man and Edward Richmond — the founding

**F71.** **Man's occupation is contested across four sources.**
- **QUOTE (Wikipedia):** `"Albon Platt Man, a successful Manhattan lawyer"`
- **QUOTE (nomination):** `"Manhattan lawyer Albon Platt Man purchased 250 acres of farm land in
  western Jamaica"`
- **QUOTE (LPC LP-2126):** `"the area was developed by Albon Platt Man, a wealthy lawyer in New York
  City"`
- **QUOTE (NYC Parks, Rizzuto Park history):** `"In 1868, a successful banker named Albon P. Man
  bought the Lefferts and Welling farms and hired Richmond to lay out the community."`
- **QUOTE (NYC Parks, McConnell Park history):** `"In 1868, a successful banker named Albon P. Man
  bought the Lefferts and Welling farms and hired Edward Richmond to lay out the community."`

**Three sources say lawyer; NYC Parks says banker, twice.** Record; do not resolve.

**F72. QUOTE (nomination):** `"On June 29, 1868—just weeks before the South Side Railroad ran its
first train to Brooklyn—Manhattan lawyer Albon Platt Man purchased 250 acres of farm land in western
Jamaica and initiated the suburban subdivision of Richmond Hill. He soon enlarged his holdings to
400 acres, including land from the Lefferts, Welling, Bergen, Robertson, and Hendrickson farms."`

**F73. QUOTE (Wikipedia):** `"In 1868, Albon Platt Man, a successful Manhattan lawyer, purchased the
Lefferts, Welling, and Bergen farms along with other plots amounting to 400 acres of land, and hired
Richmond to lay out the community."`
**Conflict with F72:** Wikipedia gives **400 acres at purchase** and **three** named farms; the
nomination gives **250 acres at purchase, enlarged to 400**, and **five** named farms.

**F74. QUOTE (nomination):** `"Stretching from what is now 110th to 121st Streets, and from Jamaica
Avenue up the hill to Union Turnpike, this tract forms the nucleus of the neighborhoods now known as
Richmond Hill and Kew Gardens."`
**This is the strongest single statement of the shared origin of the two neighborhoods. Flag for the
Kew Gardens file too.**

**F75. QUOTE (Wikipedia):** `"The tract extended as far north as White Pot Road (now Kew Gardens
Road) near modern Queens Boulevard."` — a **different** northern limit from the nomination's "Union
Turnpike" (F74).

**F76.** On the name's origin, both sources hedge:
**QUOTE (Wikipedia):** `"Richmond Hill's name was inspired either by a suburban town near London or
by Edward Richmond, a landscape architect in the mid-19th century who designed much of the
neighborhood."`
**QUOTE (nomination footnote):** `"Some accounts claim the neighborhood was named after Richmond,
although the current consensus seems to be that the moniker derives from the similarly-named section
of London."`
**QUOTE (NYC Parks):** `"The name derives either from a suburban town near London, England, or from
Edward Richmond, a landscape architect in the mid-1800s who designed much of the neighborhood."`

**F77. QUOTE (Wikipedia):** `"The area reminded Man of the London suburb, where his family resided."`

**F78. QUOTE (nomination):** `"According to local legend, Man first became aware of the bucolic
location during a drive to his country estate in Lawrence, Long Island."` — the nomination
immediately undercuts this: **QUOTE:** `"It seems more likely that he was a shrewd businessman who
was well aware of the potential of the railroad to enhance real estate values in this part of Long
Island."`

**F79.** On Edward Richmond, whom the nomination credits as the real designer:
**QUOTE:** `"It appears that the real genius behind the initial Richmond Hill development was Edward
Richmond."`
**QUOTE:** `"Richmond "had his attention called to the high wooded slopes of the central range of
hills on Long Island, selected a number of farms and induced Mr. Man to enter into the enterprise as
an investment.""` — the nomination is here quoting an unnamed newspaper article, itself
**QUOTE:** `"written more than two decades after the fact"`.

**F80. QUOTE (nomination):** `"This same article called Richmond "a landscape architect of national
reputation" who had already laid out several suburbs in Boston. Other sources describe him as a
Brooklyn capitalist, but little is known about his life and career."`

**F81. QUOTE (nomination footnote):** `"Aside from these hints, little is known of Richmond or his
career. He was posthumously called a capitalist in 1889, while the earliest references to Richmond as
a landscape architect came a decade later."`
**Flag: the nomination is explicitly sceptical of Richmond's "landscape architect" credential. Any
page calling him a landscape architect without that hedge is overstating the evidence.**

**F82. QUOTE (nomination):** `"After Richmond died in 1870, Man continued to manage the estate through
his agent, Oliver B. Fowler, who lived on site (whereas Man remained in Manhattan)."`
**Note:** LP-2126 lists Fowler as a co-developer rather than an agent — **QUOTE:** `"the area was
developed by Albon Platt Man, a wealthy lawyer in New York City; Oliver Fowler, a local developer;
and landscape architect Edward Richmond."` **Conflict; record both.**

### 2.7 The 1868 plan, the trees, and the covenants

**F83. QUOTE (nomination):** `"The original 1868 plan for Richmond Hill consisted of two sections
separated by the appropriately named Division Avenue (now 84th Avenue)—of which only one was actually
realized. The unrealized northern portion above Division Avenue was known as the "Hill Section" and
corresponds closely to present day Kew Gardens."`

**F84. QUOTE (nomination):** `"They in fact named most of the north-south side streets after tree
species, and planted thousands of shade trees supplied by a nursery they owned nearby."`

**F85. QUOTE (nomination):** `"Most of the neighborhood streets were initially named after these
trees—Cherry, Chestnut, Maple, Elm, Oak, and Walnut."`

**F86. QUOTE (nomination):** `"The streets were given sequential numbers in the 1910s during the
borough-wide program to rename Queens streets into a unified system."`

**F87.** On the tree count, sources differ by an order of magnitude:
**QUOTE (nomination):** `"they attempted to give the neighborhood a park-like appearance by planting
thousands of shade trees (by one account more than 4,000) and establishing a nearby nursery covering
two acres in which "there are not less than 1,100 trees, which are the source of Richmond Hill's
future supply of shade…each year taste is used in transplanting these to various parts of the
suburb.""`
**QUOTE (LPC LP-2126):** `"Some 400 shade and ornamental trees were planted"`
**4,000+ vs 400. Record both.**

**F88. QUOTE (nomination):** `"By 1870 they had begun grading and macadamized the streets."`

**F89. QUOTE (nomination):** `"In 1872 the first auction of buildings lots in Richmond Hill took
place."` The advertisement is quoted:
**QUOTE:** `"Suburban Chef D'Ouevre"...[the] most magnificent suburban enterprise on Long
Island...without a doubt the most elegant suburb, most beautiful and picturesque by nature, most
tastefully and liberally adorned by art."` — bracketed insertion and ellipses are the nomination's.

**F90. QUOTE (nomination):** `"400 lots were offered for sale, as well as five "modern villa houses
and a neat farm house." Making no mention of Man or Fowler, the ad called the neighborhood the
"conception and achievement of the late Edward Richmond.""`

**F91. QUOTE (nomination):** `"In Richmond Hill, covenants regulated use by forbidding "nuisances" and
liquor. They also encouraged single-family residences and some aspects of landscape design—namely
that all buildings should be set back from the street by 20 feet, that fences were prohibited, and
that the location of stables would require prior approval."`

**F92. QUOTE (nomination):** `"The estate broke with common practice, however, by declining to
establish a minimum cost for new construction—"owing to the fact that the naming of any specified sum
as the underlimit of building cost is a meaningless condition without practical force...A really
costly structure might be erected which would prove an eyesore and obviously no purchaser could put
up a dwelling costing less than $2,000 or $3,000, even if he chose to do so.""`

**F93.** The screening covenant — **an uncomfortable fact the corpus should handle carefully:**
**QUOTE (nomination):** `"the developers exercised a degree of influence over the general form, and
perhaps even the appearance, of individual houses by reserving the right to screen potential buyers
for "social status" and to review their architectural plans."`
And, quoting the *Brooklyn Daily Eagle* of May 27, 1900:
**QUOTE:** `"the social status of intending lot buyers is also considered and the plans of all
proposed houses must be approved by the estate."`
**QUOTE (nomination):** `"In addition to the estate's vetting process, the cost and lifestyle
associated with having a suburban home in Richmond Hill narrowed the pool of potential buyers."`

**F94. QUOTE (nomination):** `"The Panic of 1873 and the subsequent economic depression stifled
building activities throughout the metropolis and the entire nation, and very few houses were built
in the neighborhood for nearly two decades (none of which survive within the historic district)."`

**F95. QUOTE (nomination, citing the *Brooklyn Daily Eagle*):** `"No attempt has ever been made to
boom the suburb or to force the sale of building plots."`

### 2.8 The 1884 revival, the village, and consolidation

**F96. QUOTE (nomination):** `"The long dry spell of development was broken in 1884, when Albon Platt
Man commissioned five new houses in Richmond Hill (of which one is extant within the historic
district at 116-03 85th Avenue)."` The nomination quotes an early neighborhood history:
**QUOTE:** `"no five buildings every created a greater sensation in any community than did these"` —
"every" for "ever" is in the source.

**F97. QUOTE (nomination):** `"After Albon Man died in 1891, the Richmond Hill Estate was taken over by
his son, Alrick Man, who soon moved to the neighborhood to better oversee operations."`

**F98. QUOTE (nomination):** `"The renewed suburban vigor reached its apex in 1895, when the hamlets of
Richmond Hill, Morris Park, and Clarenceville voted to incorporate as the Village of Richmond Hill.
Led by the Citizens' Non-Partisan League, Alrick Man became the first village president."`

**F99. QUOTE (LPC LP-2126):** `"By 1895, the settlement was incorporated with Morris Park and
Clarenceville as the Village of Richmond Hill and then in 1898, Richmond Hill became part of the
consolidated Greater New York City."`

**F100. QUOTE (nomination):** `"Streets throughout the village were "macadamized in the most scientific
and permanent manner." Gas service was introduced "at city prices," which also facilitated the
installation of street lamps throughout the neighborhood."`

**F101. QUOTE (nomination):** `"By the time the Village of Richmond Hill was established, "the building
of private houses ceased to be a wonder, but came to be considered quite the usual order of things.""`

**F102. QUOTE (nomination):** `"The Village of Richmond Hill was short lived. In 1898, three years
after its creation, it was subsumed into Greater New York along with the rest of Queens."`

**F103.** Alrick Man's role in Forest Park — **recorded only because the verifier must rule on
whether this can be said at all**, given Forest Park is out of scope:
**QUOTE (nomination):** `"Alrick Man was also instrumental in the creation of Forest Park, which forms
Richmond Hills' northwestern boundary. New York State originally authorized the park in 1892 and the
first parcels were acquired in 1895. From 1895-96 landscape architects Olmsted, Olmsted & Eliot
(successors to Olmsted & Vaux) surveyed the park and laid out the picturesque drives. The eastern
section was largely native woods and was widely touted as an amenity in advertisements for Richmond
Hill real estate."`
**FINDER FLAG: this is a fact about a Richmond Hill developer and about Richmond Hill real-estate
advertising, whose object is Forest Park. It is offered as a boundary/relational fact, not as a park
record. The verifier must decide; I am not deciding.**

**F104.** The 1905 boom, quoted by the nomination from the *Brooklyn Daily Eagle*, March 28, 1905,
p. 17 (**I could not retrieve the original; this is the nomination quoting the Eagle**):
**QUOTE:** `"The rapid growth of what is called the Richmond Hill and Woodhaven sections of the Town
of Jamaica...seems more like the experiences of a Western boom town than of a staid Eastern
community. In this section there are now not fewer than 6,000 dwelling houses and a population of not
less than 30,000, where fifteen years ago there was hardly a sixth of that number...There are at
present from 150 to 200 houses under construction and well informed builders and contractors say that
there are planned from 400 to 500 new buildings to be finished before fall."`

### 2.9 The architects

**F105. QUOTE (nomination):** `"The most prolific architect in Richmond Hill —and by far the best
remembered—was architect Henry Edward Haugaard (1866-1939), who opened his architecture practice just
south of the historic district at Jamaica Avenue and Lefferts Boulevard in 1888."`

**F106. QUOTE (nomination):** `"Working closely with his brothers, John August Theodore Neilsen
(1860-1931), the real estate sales expert, and William Conrad Haugaard (1871-1942), the builder, the
Haugaards impressive Richmond Hill enterprise eventually included a lumber mill located on 121st
Street near Jamaica Avenue operating as the Long Island Mill and Construction Company."`

**F107. QUOTE (nomination footnote):** `"A map of the neighborhood from 1891 shows his house at 85-14
117th Street (still standing though altered). His family later had houses on Elm (114th) and
Waterbury (105th) Streets."`

**F108. QUOTE (nomination):** `"Other notable firms included those of Daniel Stage (1870-1929) and Wade
& Cullingford (William H. Wade Jr. and Howard J. Cullingford)."`

**F109. QUOTE (nomination):** `"The most prolific architect during this period, however, was Henry T.
Jeffrey Jr., whose Richmond Hill commissions came mostly from the Classic Construction Co."`

**F110. The 1917 shooting** — LPC LP-2126:
**QUOTE (OCR NOTE — "January 27t1'" is the scan's garbling of "January 27th"):**
`"On January 27t1', Henry E. Haugaard and his brother William were shot while working in their office
in the Hillside Bank Building in Richmond Hill by Herbert M. Newcomb, a local builder. Mr. Newcomb,
who was intoxicated at the time, accused Henry Haugaard of ruining him financially. Henry Haugaard
was taken to Jamaica Hospital and was reported to be in serious condition."`

**F111. QUOTE (LP-2126):** `"A 1920 Federal census record locates Henry Haugaard in Queens and gives
his age as 53; a subsequent 1930 Federal census record locates him in Los Angeles and sites his age
as 63. No additional accounts of Haugaard' s work or life have been found."` — "sites" for "cites" is
in the source.

**F112. QUOTE (LP-2126, quoting a period trade notice):** `"The residences of Mr. Louis Schroeder, at
Myrtle avenue and Elm street, and Mr. Peter Zimmerman, on Division avenue, are examples of Mr.
Haugaard 's work, and he gives a careful attention to detail, which commands a wide appreciation.
There is an especially active demand here for residences costing from $5,000 to $7,500... He has been
recently elected as supervising architect for the new Royal Arcanium building to be erected corner of
Jamaica avenue and Elm street."`

**F113. QUOTE (LP-2126):** `"In addition to his architectural practice, Henry Haugaard also owned a
planing mill and employed from fifteen to thirty-five men depending upon the number of projects
ongoing."`

### 2.10 The elevated railways and the second boom

**F114. QUOTE (nomination):** `"Mass transit arrived in the area with the opening of the Liberty Avenue
elevated (now the A train) in 1914-15, and the Jamaica Avenue elevated (now the J/Z train) in 1917."`

**F115. QUOTE (Wikipedia):** `"The New York City Subway's BMT Fulton Street Line was extended east
along Liberty Avenue into the area on September 25, 1915, terminating at Lefferts Avenue (now
Lefferts Boulevard)."`

**F116. QUOTE (Wikipedia):** `"The area received further development when the BMT Jamaica Line
elevated, now served by the New York City Subway's J and ​Z trains, was extended east into the
neighborhood at Greenwood Avenue (now 111th Street) on May 28, 1917."`

**F117. QUOTE (nomination):** `"In 1921, after much discussion and agitation, the matter was settled so
that Park Lane South would cross the tracks on a bridge of steel and concrete, "25 feet at least above
the level of the railroad tracks, 102 feet in length, 52 feet wide with sidewalks for pedestrians and
a roadway for vehicular traffic.""` — citing *New York Times*, December 28, 1921, p. 10 (**original
not retrieved**).

**F118. QUOTE (nomination):** `"Only a couple of years later, in 1923-24, the remainder of the railroad
track through Richmond Hill was raised to eliminate grade crossings—a boon to the growing number of
motorists now driving through Richmond Hill. The ornamented Art Deco structure, built of concrete and
steel, was nicknamed "a railroad on stilts." One article called it "one of the handsomest elevated
railroad structures in the country.""`

**F119. QUOTE (nomination):** `"Around the same time in the mid-to-late 1920s, 117th Street between 84th
and 85th Avenues was finally cut through and the building lots made accessible to development."`

**F120. QUOTE (nomination):** `"The only changes to the 1860s street plan occurred within the period of
significance. These were the extension of 85th Avenue westward past the rail line, which occurred by
1901, and the creation of Park Lane South which was laid out in 1921 along the north edge of the
development."`

**F121. QUOTE (Wikipedia):** `"As the neighborhood's population continued to grow into the 1920s,
smaller closely spaced houses and apartment buildings began to replace large private houses."`

**F122. QUOTE (nomination):** `"Though a handful of houses were built in the 1930s to 1960s, Richmond
Hill remains largely an intact late 19th and early 20th century residential suburb."`

### 2.11 The subsequent-history passage

**F123. QUOTE (nomination):** `"While the buildings of Richmond Hill are little changed, the
neighborhood—like much of Queens—has undergone substantial demographic shifts in the subsequent
decades. What was once the exclusive province of Manhattan businessmen is now home to a diverse and
vibrant community of native New Yorkers and immigrants."`

**F124.** The nomination quoting the *New York Times* of January 11, 2013, article titled
"Indo-Caribbean Content, Victorian Style" (**I could not retrieve the original — this is the
nomination quoting the NYT, and must be attributed that way**):
**QUOTE:** `"The New York Times gave the neighborhood a high compliment, calling Richmond Hill "the
ultimate study in New York diversity…a place to eat Caribbean cuisine, shop for Bollywood movies,
worship at a Sikh temple and stroll through streets lined with Victorian-era houses, a slice of pure
Americana.""`

**F125. QUOTE (nomination):** `"In recent years a grassroots historic preservation movement has emerged
in the neighborhood, spearheaded by the Richmond Hill Historical Society. A significant number of
houses have been restored to their original appearance, clearly demonstrating that the architectural
character of Richmond Hill is very much intact."`

**F126. QUOTE (LP-2126):** `"By 1920, the population of Richmond Hill continued to grow and commercial
activity flourished. With no more open land to develop, some of Richmond Hill 's nineteenth century
private houses were replaced by twentieth century apartment houses, and a population of mostly German
and Irish descent gave way to an influx of Latin"` — **the sentence is cut off at a column break in
the scan; the continuation is not legible. Do not complete it.**

---

## 3. THE ARCHITECTURE AND THE STREETSCAPE (nomination, §7)

**F127. QUOTE:** `"Much of the developers' original layout remains intact including the street plan,
which comprises a mostly rectangular grid. Narrow residential side streets run generally north-south
with a one-way travel lane; wider avenues run generally east-west with two-way traffic."`

**F128. QUOTE:** `"The historic rail line—elevated on a viaduct in 1923-24 and flanked by Babbage and
Bessemer Streets—angles northwesterly across the historic district, as does Myrtle Avenue, creating
some unusually shaped lots including Jacob Riis Triangle (a contributing site)."`

**F129. QUOTE:** `"Street trees continue to be a significant feature of the historic district and most
of the blocks in the area are lined with mature plantings. The majority are located in the narrow
planting strips between sidewalk and curb."`

**F130. QUOTE:** `"Lot sizes in Richmond Hill are typically quite large—at least by Queens and New York
City standards—especially those associated with buildings constructed before the 1910s. These earlier
houses often occupy lots at 50 feet or wider (some as wide as 100 feet), and usually extend half the
width of the block, usually 100 feet deep. Lots associated with later houses, those built in the 1910s
and '20s, are typically narrower, around 30 feet or less."`

**F131. QUOTE:** `"These covenants also banned fences, influencing the spatial relationship between the
private realm of house and yard and the public realm of the streets. Though the restriction against
fences has not been universally upheld, most yards in the historic district are open to the street,
upholding the park-like environment envisioned by the developers."`

**F132. QUOTE:** `"Eventually, however, most properties included a freestanding, one-story carriage
house or garage, many built during the beginning of the automobile era in the 1910s and '20s."`

**F133. QUOTE:** `"Unlike surrounding neighborhoods, many of which were quickly developed, built-out
during economic booms, and have a consistent architectural character as a result, the district
encompasses the range of architectural styles popular over the six decades."`

**F134. QUOTE:** `"Many of the houses in the historic district have been assigned a building date of c.
1895. These buildings post-date the 1891 fire insurance maps of the neighborhood but appear on the
1901 maps. They also likely pre-date the keeping of New Building (NB) permits, which were not issued
in Queens until 1898, when the area became part of Greater New York."`

**F135. QUOTE:** `"Siding does not preclude a building's ability to contribute to the district as long
as the building's original form (massing, roofline, fenestration pattern) is mostly intact."`

**F136.** On the Montauk viaduct's non-listing:
**QUOTE:** `"While the boundary includes a portion of the LIRR Montauk Branch Viaduct, this resource is
not being listed as part of the Richmond Hill Historic District. As a portion of a resource cannot be
listed and the bridge extends far beyond the boundaries of the historic district, NPS staff
recommended this course of action."`
**FINDER NOTE: this is the same "a linear resource that runs beyond the boundary cannot be claimed
whole" logic the wave has been warned about for Rockaway Beach and Boardwalk. Recorded because it is
a precedent from *this* neighborhood's own primary document.**

### 3.1 Individually described contributing houses (candidate places)

Each of the following is described in the nomination's building list or significance section. All are
inside the NRHP district; all geocode to NTA `QN0902 Richmond Hill`.

**P1. 116-03 85th Avenue** — **F137. QUOTE:** `"one of the five commissioned by Albon Platt Man
himself in 1884, originally was clad in narrow clapboard on the ground floor with shingled upper
stories; it also had a spindle-work porch, of which the slender turned columns remain."`
**F138.** A footnote hedges the attribution: **QUOTE:** `"It is possible that 116-03 85th Avenue is one
of these five; 84-50 117th Street may also be, although it would have been relocated sometime after
1913."` **Record the hedge; do not state it flatly as one of Man's five.**

**P2. 116-12 85th Avenue** — **F139. QUOTE:** `"a more intact example with clapboard siding, fish-scale
shingles in the main gables, and a prominent sunburst in the secondary gable."`

**P3. 85-10 113th Street** — **F140. QUOTE:** `"features a Palladian attic window, dentiled cornice, and
corner pilasters."` One of **QUOTE:** `"the five residences designed by Daniel Stage around 1900
between 112th and 114th Streets."`

**P4. 85-04 113th Street** — **F141. QUOTE:** `"has a wrap-around porch with the hallmark pediment above
the entrance and an arcade in front of its second-story sleeping porch."`

**P5. 84-48 118th Street (1901) and 117-03 85th Avenue (1902)** — **F142. QUOTE:** `"The nearly
identical houses at 84-48 118th Street (1901) and 117-03 85th Avenue (1902), both designed by Wade &
Cullingford, are excellent illustrations. The transition between the round corner tower and the rest
of the facade is seamless, as is the roof flowing over the eyebrow dormer projecting from the main roof
and the gable wrapping into the attic window on the side facade."`

**P6. 84-37 113th Street** — **F143. QUOTE:** `"features Asian-inspired flourishes such as flared eaves
and the decorative porch supports perhaps meant to evoke the traditional Chinese construction method
of "tou kung," or interlocking brackets."`

**P7. 84-11 112th Street (c. 1900)** — **F144. QUOTE:** `"fully symmetrically with a central entrance
and second story Palladian window, hipped roof, and Classical details including modillioned porch
cornice and Corinthian corner pilasters."` — "symmetrically" for "symmetrical" is in the source.

**P8. Haugaard Tudor Revival group** — **F145. QUOTE:** `"Many early Tudor Revival houses in the
historic district were designed by Henry Haugaard; though most have had their half-timbering covered
they can still be espied at 84-27 116th Street (1906), 85-19 117th Street (1906-07), and 114-03 84th
Avenue."`

**P9. 110-41 to 110-47 84th Avenue** — **F146. QUOTE:** `"Some of these small houses were designed by
established local architects, including Haugaard, who was responsible for a number within the district,
including the group of four at 110-41 to 110-47 84th Avenue."`

**P10. 84-10 112th Street (c. 1895, Queen Anne)** — **F147. QUOTE:** `"Two-story and attic, wood frame
freestanding house. Two bays of grouped windows. Porch, hipped roof with gabled dormers, and a brick
chimney… Alterations include aluminum or vinyl siding, asphalt-shingle roofing, replacement windows,
brick porch steps and porch piers, metal porch railings, a window converted to a door at the
second-floor of the front facade, and a projecting picture window at the rear bump-out. Contributing
garage built by 1927 (possibly under NB permit 3879-1921)."`

**P11. The Lefferts "Farm Cottage", 86-20 115th Street** — **F148. QUOTE (nomination footnote):**
`"Fowler occupied the "Farm Cottage," the former Lefferts farmhouse that at that time was still located
on Jamaica Avenue between Elm and Oak Streets. It was moved to 86-20 115th Street sometime between 1901
and 1907."`

**P12. 85-14 117th Street** — Henry Haugaard's own house per F107; **QUOTE:** `"still standing though
altered."`

**P13. William Gati house, 84th Avenue and 113th Street** — **F149. QUOTE (Wikipedia HD article):**
`"The architect and musician William Gati owns a Spanish Colonial house in the district on 84 Ave and
113 Street."` **Single-source, Wikipedia only, and it names a living private individual and his home
address. Flag as a privacy concern as well as a sourcing concern.**

---

## 4. DESIGNATED LANDMARKS

### 4.1 The National Register district

**P14. Richmond Hill Historic District** — NRHP refnum **100003430**, listed **March 7, 2019**.
**F150.** Address of record, from the NRHP listing table:
**QUOTE:** `"Generally 84th-85th Aves. & 113th to 118th Sts."`, city
**QUOTE:** `"[[Richmond Hill, Queens|Richmond Hill]]"`, and the table's own description:
**QUOTE:** `"Covers a small portion of the larger Richmond Hill neighborhood."`
Source: `https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens,_New_York`
**F151.** Criteria: **A** (Community Planning & Development) and **C** (Architecture); level of
significance **local**. Period of significance **1868–1930**. See F28 for acreage, F33 for resource
counts.

### 4.2 New York City individual landmarks

**F152. DERIVED.** Querying the LPC Individual Landmark Sites dataset
(`https://data.cityofnewyork.us/resource/buis-pvji.json`, filtered `borough='QN'`, 86 Queens rows)
for `cd = 409` or `nta2020` beginning `QN09` returns **exactly four** landmarks, of which **three**
fall in NTA `QN0902 Richmond Hill` and one in `QN0901 Kew Gardens`.

**P15. Richmond Hill Republican Club**, 86-15 Lefferts Boulevard — **LP-02126**, designated
**December 17, 2002**, Individual Landmark, CD 409, NTA `QN0902`, 40.7009071 / −73.8310137.
**F153. QUOTE (LP-2126 header):** `"RICHMOND HILL REPUBLICAN CLUB, 86-15 Lefferts Boulevard, Queens .
Built 1908; Henry E. Haugaard, architect. Landmark Site: Borough of Queens Tax Map Block 9273, Lot
89."`
**F154. QUOTE (LP-2126 summary):** `"An integral part of downtown Richmond Hill, the Richmond Hill
Republican Club served as an important political club and a cornerstone of the Richmond Hill
neighborhood where parades, public lectures, picnics, dances, and dinners were held. Built in 1908 to
the designs of Henry E. Haugaard, a prolific local architect and builder, the building was constructed
of Roman brick and wood in the Colonial Revival style."`
**F155. QUOTE:** `"Original stylistic features of the building include an elaborate entryway with
classical pediment, a denticulated and bracketed cornice, and a roof-line balustrade."`
**F156. QUOTE:** `"The building was constructed as a political club and post office. However during
World War I, it took on a larger community function when it became a social gathering place for local
citizens and an entertainment center and retreat for the armed forces. As late as 1980, a presidential
candidate delivered a campaign speech there."` — **the source does not name the candidate.**
**F157. QUOTE:** `"Vacant since the mid 1980s, the Richmond Hill Republican Club is an intact example of
a clubhouse designed to serve the social, political and recreational needs of a local community and an
excellent prototype of small-scale Colonial Revival style civic architecture."`
**F158.** The hearing record: **QUOTE:** `"Twenty witnesses spoke in favor of designation including
Council member Melinda R. Katz; Council member Dennis Gallagher; representatives from the Historic
Districts Council, the New York City Landmarks Conservancy, the Queens Borough President's Office,
Assemblyman Brian Mclaughlin's Office, and the Richmond Hill Historical Society; and residents of
Richmond Hill. There were no speakers or letters in opposition to designation."`
**F159. CURRENCY WARNING.** LP-2126's `"Vacant since the mid 1980s"` describes the building **as of
2002**. The DOHMH restaurant dataset currently carries an active establishment named **OLIGARCH** at
**86-15 Lefferts Boulevard**, cuisine `Jewish/Kosher`. **Do not write that the building is vacant.**
See §10 for the DOHMH-only caveat on that business.

**P16. Public School 66 (Jacqueline Kennedy Onassis School)**, 85-11 102nd Street — **LP-02317**,
designated **January 12, 2010**, Individual Landmark, CD 409, NTA `QN0902`, 40.6979392 / −73.846139.
Also **NRHP refnum 03000850**, listed **August 28, 2003**, city given as `"Richmond Hill"`.
**F160. QUOTE (LP-2317 header):** `"PUBLIC SCHOOL 66 (FORMERLY THE BROOKLYN HILLS SCHOOL, LATER THE
OXFORD SCHOOL, NOW THE JACQUELINE KENNEDY ONASSIS SCHOOL) 85-11 102nd Street (aka 85-01 to 85-19 102nd
Street; 102-01 85th Road; 102-02 85th Avenue), Queens. Built, 1898; Harry S. Chambers, architect;
Addition, 1905-6; C.B.J. Snyder, architect. Landmark Site: Borough of Queens Tax Map Block 9183, Lot
1."`
**F161. QUOTE:** `"Originally constructed in 1898-9, Public School (P.S.) 66 is a remarkable survivor
from a time when Richmond Hill, Queens, was transitioning from a rural farming community into a vibrant
residential neighborhood."`
**F162. QUOTE:** `"Three identical schools (two now demolished) were constructed in anticipation of an
influx of residents, expected as a result of improvements in transportation, the subdivision of
farmlands into lots for residential development, and the consolidation of Queens with Greater New York
City that same year."`
**F163. QUOTE:** `"Also known as the Brooklyn Hills School after the suburban development in which it was
physically located, P.S. 66 formally opened its doors in 1902."`
**Note the tension with F60:** the school is named for **Brooklyn Hills**, the 1887 subdivision at
102nd–104th Streets — the same ground the nomination places "east of Richmond Hill".
**F164. QUOTE:** `"Harry S. Chambers, Superintendent of School Buildings for the Union Free School
District No. 7 of the Town of Jamaica, Queens, is credited with the design of the original school
building. C.B.J. Snyder, Superintendent of School Buildings for the New York City Board of Education
from 1890 to 1923, is noted as the architect of a 1905-6 addition."`
**F165. QUOTE:** `"The two-and-a-half and three-story red brick building is Victorian Eclectic in style.
Many of its features are characteristic of the Romanesque Revival style and give the building a
fortress-like appearance, including prominent round arches highlighting window openings and the main
entrance, a flared base, and a distinctive six-story tower (restored in 2001)."`
**F166. QUOTE:** `"Elements of the Queen Anne style are also present in the building's large entablatures
featuring elaborate rinceaux, its gabled dormers, and the steeply pitched roofs of the 1905-6 addition,
which was harmoniously designed in the style of the main section."`
**F167. QUOTE:** `"The tower, which originally contained a bell used to call school children from
neighboring farms and developments, is distinguished by round arches, brick corbelling, large masonry
columns, and foliate details. An ornamental panel above the main entranceway survives and features the
name of the school."`
**F168. QUOTE:** `"Today, P.S. 66 has been renamed the Jacqueline Kennedy Onassis School in honor of the
former First Lady's passion for literacy and for historic preservation and continues to serve in its
original function as a grammar school. It remains one of Queens' most distinctive school structures."`
**F169. QUOTE (LP-2317 neighborhood statement):** `"P.S. 66 is geographically located in east central
Queens, just south of the verdant Forest Park in the neighborhood of Richmond Hill."`
**F170. QUOTE (hearing record):** `"The Commission read a letter in support of designation from Caroline
Kennedy. The Commission also received several letters in support of designation from first grade
students of the school. There were no speakers in opposition to designation."`
**F171.** Wikipedia's main article lists it among the neighborhood's public elementary schools:
**QUOTE:** `"PS 66 Jacqueline Kennedy Onassis School, a New York City Landmark."`

**P17. Daniel and Abbie B. Eldridge House**, 87-61 111th Street — **LP-02473**, designated
**December 20, 2011**, Individual Landmark, CD 409, NTA `QN0902`, 40.695293 / −73.8360405.
**F172. QUOTE (LP-2473 header):** `"DANIEL AND ABBIE B. ELDRIDGE HOUSE, 87-61 111th Street, Borough of
Queens. Built c. 1870, architect not determined. Landmark Site: Borough of Queens Tax Map Block 9301,
Lot 101"`
**F173. QUOTE:** `"His imposing c. 1870 2½ story Italianate-style villa, with its cubic form, hipped roof
with projecting eaves, square cupola, segmental-arched entrance with elaborate doorhood, and angular bay
windows, may have been influenced by the cottage and villa designs popularized in the mid-19th century
by the pattern books of Andrew Jackson Downing and Henry W. Cleaveland."`
**F174. QUOTE:** `"The Daniel and Abbie B. Eldridge House, now enlarged and re-purposed as a school,
remains a rare, relatively intact example of the Italianate-style villa in Queens."`
**F175. QUOTE:** `"Standing in contrast to the small single- and multi-family dwellings that were
constructed during the 20th century, it is a unique and important reminder of the area's mid-19th
century development."`
**F176. QUOTE (hearing record):** `"Three people testified in favor of designation including
representatives of the Historic Districts Council, The Victorian Society New York, and Queens
Preservation Council."`
**F177.** On Daniel Eldridge himself, see F54 — **QUOTE:** `"a clerk in New York City's Water Department
and alleged member of the Tweed Ring"`. Note the source's own hedge, `"alleged"`.
**F178. FINDER FLAG:** the Eldridge House is **not** in the NRHP historic district (it is at 111th
Street, west and south of the district's 113th–118th Street span, F150), and LP-2473 frames it as a
**Clarenceville** building. It is a Richmond Hill landmark by every geographic test but its narrative
belongs to Clarenceville.

**P18. Ralph Bunche House**, 115-24 Grosvenor Road — **LP-02175**, designated **May 17, 2005**,
Individual Landmark, **CD 409** but NTA **`QN0901` Kew Gardens**.
**F179.** NRHP refnum **76001266**, listed **May 11, 1976**, with address given as `"115-125 Grosvenor
Rd."` and city `"[[Kew Gardens, Queens|Kew Gardens]]"`.
**F180. DERIVED.** Point-in-polygon on 40.7064299 / −73.8369942 returns **`QN0901 Kew Gardens`**.
**F181. FINDER FLAG:** note the **address discrepancy between the two designations** — LPC says
**115-24** Grosvenor Road, the NRHP table says **115-125** Grosvenor Rd. **This is listed here only
because it sits in CD 9 alongside Richmond Hill's landmarks and a careless reader will sweep it in. No
source in this dossier places it in Richmond Hill.**

**F182. DERIVED.** **There is no LPC-designated historic district in Richmond Hill.** The LPC dataset
returns only individual landmarks for CD 409 / `QN09xx`. The NRHP district (P14) carries **no** city
landmark protection. Wikipedia's HD article claim about LPC "accept[ing]" the district (F37) must not
be read as city designation.

### 4.3 Other NRHP listings whose city field touches Richmond Hill

**P19. Church of the Resurrection**, 85-09 118th Street — **NRHP refnum 03000090**, listed
**March 7, 2003**. **See §6.1 — this is the dossier's most contested place.**

**P20. Saint Benedict Joseph Labre Parish**, 94-40 118th Street — **NRHP refnum 06001297**, listed
**January 25, 2007**, city `"[[Richmond Hill, New York|Richmond Hill]]"`. **See §5.2.**

**P21. Kent Manor**, 117-01 Park Lane South — **NRHP refnum 100007667**, listed **April 28, 2022**,
city `"[[Kew Gardens, Queens|Kew Gardens]]"`. **See §6.2 — triple-contested.**

---

## 5. RELIGIOUS INSTITUTIONS

**F183. QUOTE (Wikipedia, main article):** `"Richmond Hill is home to a density of Hindu, Roman
Catholic, Eastern Orthodox, Protestant, Sikh, Jewish, and Muslim places of worship."`

### 5.1 Church of the Resurrection (Episcopal) — P19

Source for all quotes in this subsection unless noted:
`https://en.wikipedia.org/wiki/Church_of_the_Resurrection_(Queens)`
**Remember F4: the NRHP nomination is not digitized. And remember F10: the Richmond Hill Historical
Society's page on this church is a verbatim copy of this Wikipedia article and is not independent
corroboration.**

**F184. QUOTE:** `"The Church of the Resurrection is a historic Episcopal church and rectory in Richmond
Hill, Queens, New York City. It was originally built in 1874 as a frame, Gothic Revival style church.
It was extensively remodeled and enlarged in 1904 in the Late Gothic / Tudor Revival style. It has an
exterior of random quarry-faced stone and a prominent bell tower with spire."`

**F185. QUOTE:** `"The church includes the Riis family memorial window, donated in 1905 by Elizabeth
Riis, wife of Jacob Riis. The adjacent Cummings Hall was built in 1923. The rectory was built in 1888
and is a 2+1⁄2-story, frame dwelling with a hipped roof and gable dormers in the Queen Anne style."`

**F186. QUOTE:** `"The church is also notable for its association with Jacob Riis, a social reformer and
pioneering photojournalist who was a Richmond Hill resident from 1885 to 1912 and a church member from
1900 to 1912."`

**F187. QUOTE:** `"Theodore Roosevelt, a close friend and associate of Riis, visited the church to attend
the marriage of Riis's daughter Clara to Dr. William Fiske on June 1, 1900. Roosevelt was Governor of
New York at the time."`

**F188.** The **NRHP nomination for the historic district** gives an **independent** account, and it
differs on the architect and on the church's relationship to the district:
**QUOTE:** `"A few notable institutional buildings were completed around the time of the collapse
including the Church of the Resurrection. Located at 85-09 118th Street, it was built in 1874 on land
donated by the Man estate just east of the historic district, and was effectively rebuilt in 1904 to
the designs of Nathaniel W. Vickers. It was listed individually on the State and National Registers in
2003."`
**Two new facts not in Wikipedia: the land was donated by the Man estate, and the 1904 architect was
Nathaniel W. Vickers.** And the nomination says **"just east of the historic district"** where
Wikipedia's HD article says **"On the eastern edge of the district sits the Church of the
Resurrection"** (F189).

**F189. QUOTE (Wikipedia HD article):** `"On the eastern edge of the district sits the Church of the
Resurrection. This Episcopalian church is an 1874 structure and is the oldest house of worship in
Richmond Hill."`
**F190. QUOTE (Wikipedia main article):** `"The northern edge of Richmond Hill contains the Church of the
Resurrection. This Episcopalian church is an 1874 structure and is the oldest house of worship in
Richmond Hill."`
**F191. FINDER FLAG: the same encyclopedia places this church on the neighborhood's NORTHERN edge in
one article and on the district's EASTERN edge in another, while the primary nomination places it
OUTSIDE the district entirely. Record all three; resolve none.**

### 5.2 Saint Benedict Joseph Labre Parish — P20

Source: `https://en.wikipedia.org/wiki/Saint_Benedict_Joseph_Labre_Church_(Queens)`
**F192. QUOTE:** `"Saint Benedict Joseph Labre Parish is a historic Roman Catholic parish church complex
in the Diocese of Brooklyn, located at 94-40 118th Street in Richmond Hill, Queens, New York City."`
**F193. QUOTE:** `"The complex consists of the church, rectory / parsonage, school, and cloister. The
church was designed in 1916 by architect Thomas Henry Poole (1860–1919) and completed in 1919. It is a
large brick Romanesque-style building in the basilican plan. It features a standing seam copper-roofed
dome and a bell tower."`
**F194. QUOTE:** `"The rectory is a 2+1⁄2-story brick building built in 1939. The cloister also dates to
1939 and connects the rectory to the sanctuary. It features a 1938 statue of the patron Saint Benedict
Joseph Labre. The brick school building was built in 1912 and substantially enlarged in 1938–1939."`
**F195. DERIVED. CONTESTED.** GeoSearch returns `94-40 118 STREET, Richmond Hill, NY` with
**postal code 11419**; point-in-polygon returns **`QN0903 South Richmond Hill`**, *not* `QN0902`.
The NRHP table and Wikipedia both say plain **"Richmond Hill"**. **Record the split; do not resolve.**
**F196.** Wikipedia's main article lists the parish among NRHP listings: **QUOTE:** `"Also listed on the
National Register of Historic Places are Public School 66 and Saint Benedict Joseph Labre Parish."`

### 5.3 Sikh Cultural Society — P22 — **A CRITICAL GAP**

**F197.** The nomination's NYT quote (F124) names **"worship at a Sikh temple"** as one of the three
things that define the neighborhood, and Wikipedia states **QUOTE:** `"Richmond Hill also has the
largest Sikh population in the city."` (F206).
**F198.** Despite that, **I have no usable source for the Sikh Cultural Society as a place.** Its
website failed with a TLS error (F6); WebSearch was unavailable (F1); and it does not appear in the
LPC, NRHP, or Parks datasets. What I have is **only** a geocode:
**F199. DERIVED.** GeoSearch resolves **95-30 118th Street** to `95-30 118 STREET, Richmond Hill, NY,
USA`, **postal code 11419**, 40.69109 / −73.82801; point-in-polygon returns **`QN0903 South Richmond
Hill`**.
**F200. FINDER FLAG:** the address 95-30 118th Street is **my own working hypothesis**, not something a
retrieved source stated. **No source in this dossier confirms that the Sikh Cultural Society is at that
address, or that it exists at all.** The verifier must treat P22 as **unsourced** and either commission
a fresh retrieval or drop it. **Do not write a gurdwara record on the strength of a geocode.**

### 5.4 Other religious institutions named only in passing

**P23. Holy Child Jesus Church / Holy Child Jesus Academy**, 111-11 86th Avenue.
**F201.** Wikipedia's main article lists **QUOTE:** `"Holy Child Jesus Academy Holy Child Jesus School"`
among private schools — the doubled phrase is the source's own garbling.
**F202. DERIVED.** GeoSearch: `111-11 86 AVENUE, Richmond Hill, NY`, ZIP **11418**, 40.69916 /
−73.83767; point-in-polygon **`QN0902 Richmond Hill`**. **The church itself is not described by any
source I retrieved — only the school is named.**

**P24. Bethlehem Christian Academy**, **P25. Hebrew Academy-West Queens**, **P26. Islamic Elementary
School**, **P27. Theatre Street School** — **F203.** all four appear **only** as bare names in
Wikipedia's private-schools list, with **no address, no date, and no description**:
**QUOTE:** `"Private schools include: Bethlehem Christian Academy, Hebrew Academy-West Queens, Holy
Child Jesus Academy Holy Child Jesus School, Islamic Elementary School, Theatre Street School"`.
**Flag: name-only. Not enough for a record.**

**P28. Arcaneum Hall Library / the Royal Arcanium building** — **F204. QUOTE (LP-2126):** `"The Arcaneum
Hall Library was established in 1899"`; and separately, Haugaard was **QUOTE:** `"recently elected as
supervising architect for the new Royal Arcanium building to be erected corner of Jamaica avenue and Elm
street"` (F112). **Two spellings ("Arcaneum" / "Arcanium") in one document; unclear whether one or two
buildings. Record the ambiguity.**

---

## 6. THE CONTESTED PLACES — Richmond Hill vs Kew Gardens vs Jamaica

**This section exists because the wave brief requires it. Every place here is recorded with what each
source says and is NOT resolved.**

### 6.1 Church of the Resurrection, 85-09 118th Street — P19

| Source | Says |
|---|---|
| NRHP listing table | city = **`"[[Kew Gardens, Queens|Kew Gardens]]/[[Richmond Hill, Queens|Richmond Hill]]"`** — the table itself declines to choose |
| Wikipedia article title | `Church of the Resurrection (Kew Gardens, Borough of Queens, New York)` |
| Wikipedia article text | **`"in Richmond Hill, Queens"`** (F184) |
| Wikipedia, RH main article | **`"The northern edge of Richmond Hill"`** (F190) |
| Wikipedia, RH Historic District article | **`"On the eastern edge of the district"`** (F189) |
| NRHP district nomination | **`"just east of the historic district"`** (F188) |
| DCP GeoSearch | neighbourhood **`Richmond Hill`**, **postal code 11415** — the **Kew Gardens** ZIP |
| DERIVED point-in-polygon | **`QN0902 Richmond Hill`** |

**F205. This is the single most contested place in the dossier. Seven sources, and the NRHP's own
listing table records the ambiguity in its city field by naming both neighborhoods with a slash.**

### 6.2 Kent Manor, 117-01 Park Lane South — P21

| Source | Says |
|---|---|
| NRHP listing table | city = **`"[[Kew Gardens, Queens|Kew Gardens]]"`**, refnum 100007667, listed 2022-04-28 |
| DCP GeoSearch | neighbourhood **`Forest Park`** (!), **postal code 11418** — the **Richmond Hill** ZIP |
| DERIVED point-in-polygon | **`QN0901 Kew Gardens`** |
| NRHP nomination text | **not retrievable** (F5) |

**F206. Three sources, three different answers, and one of them is "Forest Park" — a place this wave has
ruled belongs to no neighborhood file at all.** Park Lane South at 117th Street is exactly the seam
described in F117/F120 (the 1921 bridge, the 1921 laying-out of Park Lane South along the north edge).
**Record; do not resolve; and note that a "Forest Park" geocode is not a licence to write about Forest
Park.**

### 6.3 Queens Public Library, Lefferts branch, 103-34 Lefferts Boulevard — P29

| Source | Says |
|---|---|
| Wikipedia, RH main article | **`"The Queens Public Library operates two branches in Richmond Hill: The Richmond Hill branch at 118–14 Hillside Avenue; The Lefferts branch at 103–34 Lefferts Boulevard"`** |
| DCP GeoSearch | neighbourhood **`Richmond Hill`**, postal code **11419** |
| DERIVED point-in-polygon | **`QN1001 South Ozone Park`** — a **different community district** (CD 10, not CD 9) |
| QPL's own site | **not retrievable** (F8) |

**F207. Flag hard: the DERIVED test puts this branch outside CD 9 entirely.** Wikipedia claims it for
Richmond Hill. The library's own page could not be fetched. **Unresolved.**

### 6.4 121st Street subway station — P30

**F208. QUOTE (Wikipedia):** `"Located at the intersection of 121st Street and Jamaica Avenue in Richmond
Hill and Kew Gardens, Queens"` — **the source assigns it to both neighborhoods in one sentence.**
**Flag: Kew Gardens' own file will want this station too.**

### 6.5 111th Street–Greenwood Avenue station (IND Fulton Street Line) — P31

**F209. QUOTE (Wikipedia):** `"located on Liberty Avenue at 111th Street in South Ozone Park and South
Richmond Hill, Queens."` — **assigned to two neighborhoods, one of which is South Ozone Park (CD 10).**
Wikipedia's RH main article nonetheless claims it: **QUOTE:** `"The Jamaica–Van Wyck station on the E
train, and the 111th Street and Ozone Park–Lefferts Boulevard stations on the A train, are also located
in Richmond Hill."`

### 6.6 Ozone Park–Lefferts Boulevard station — P32

**F210. QUOTE (Wikipedia):** `"Despite its name, the station is not actually located in Ozone Park, but
rather in the adjacent neighborhood of South Ozone Park, with part of the station also in South Richmond
Hill."` — **three neighborhoods named in one sentence, and the RH main article claims it outright
(F209).**

### 6.7 Jamaica–Van Wyck station — P33

**F211.** Wikipedia's RH main article claims it for Richmond Hill (quoted in F209). **The station's name
is "Jamaica–Van Wyck" and it sits at the Van Wyck Expressway, which every boundary source in §1 makes
Richmond Hill's EASTERN EDGE (F18, F20). Flag as a Jamaica/Richmond Hill contest.**

### 6.8 Morris Park Facility (LIRR) — P34

**F212. QUOTE (Wikipedia):** `"The yard's locomotive yard office and engine shops, divided into the front
shops and back shops, were built in 1889, at the junction of the Atlantic and Lower Montauk Branches
approximately on the opposite side of the former "R" Tower at the latter day Richmond Hill Storage
Yard."` — **the facility is named "Morris Park" for the Richmond Hill sub-settlement (F57), sits beside a
yard named "Richmond Hill", and is not assigned to a neighborhood by the source. Unresolved.**
**F213. QUOTE:** `"The Morris Park Facility covers about 21 acres (8.5 ha)"`, and **QUOTE:** `"The facility
opened on November 1, 1889."`
**F214. QUOTE:** `"The Morris Park turntable is the only one of the turntables still functioning; those in
Oyster Bay, Riverhead, and Greenport exist purely for historical purposes."`
**F215. QUOTE:** `"The Morris Park station was in service until 1939, when it was closed as part of the
grade elimination project that replaced the surface railway with a tunnel beneath Atlantic Avenue.
Efforts by local residents and elected officials to allow for an underground Morris Park station were
rejected by construction coordinator Robert Moses."`
**F216. QUOTE:** `"Morris Grove station was originally a South Side Railroad of Long Island station house
located at Berlin Station that was moved to 124th Street in 1878 and renamed "Morris Grove." The station
was later renamed "Morris Park," for a park that was located behind the depot, and closed in 1886 to be
replaced by the "new" Morris Park station on Atlantic Avenue between Lefferts Boulevard and 120th
Street."`

### 6.9 The Richmond Hill LIRR station's own location is contested — P35

**F217. QUOTE (Wikipedia, RH main article):** `"There was a Long Island Rail Road station named Richmond
Hill on Hillside Avenue and Babbage Street along the Montauk Branch."`
**F218. QUOTE (Wikipedia, *Richmond Hill station (LIRR)*):** `"The station is located at Myrtle Avenue and
cuts diagonally from the intersection of Jamaica Avenue and Lefferts Boulevard through to Hillside
Avenue."`
**Two Wikipedia articles, two different locations for the same station. Record both.**

---

## 7. TRANSPORTATION

### 7.1 The closed Richmond Hill LIRR station — P35

Source: `https://en.wikipedia.org/wiki/Richmond_Hill_station_(LIRR)`
**F219. QUOTE:** `"Richmond Hill was the only station on the Lower Montauk Branch that was elevated with a
high-level platform for passengers to wait for trains; the others were at ground level, with low-level
platforms."`
**F220. QUOTE:** `"The Richmond Hill station was originally built by the South Side Railroad of Long Island
in 1869 as the Clarenceville station, distinct from the nearby Clarenceville station on the Atlantic
Branch."` — **note: 1869 here, against the nomination's 1868 opening of the line (F67) and Wikipedia's
own Clarenceville-station article saying it "opened in 1868" (F70).**
**F221. QUOTE:** `"Clarenceville was a farming community centered around Jamaica and Greenwood Avenues (the
latter now 111th Street, where the Atlantic Branch station was located), which is now part of Richmond
Hill."`
**F222. QUOTE:** `"In 1917, the LIRR finalized the grade crossing elimination project plans for the Montauk
Branch in the Richmond Hill area, which would construct a new elevated station between Park Street
(today's Hillside Avenue) and Lefferts Avenue (now Lefferts Boulevard)."`
**F223. QUOTE:** `"The project eliminated numerous at-grade crossings in the vicinity of the station,
including those at St. Anne Avenue (now 84th Avenue), Ashland Avenue (now 85th Avenue), Park Street, the
intersection of Jamaica and Lefferts Avenue, and Ridgewood Avenue (now 89th Avenue). It also extended the
roads adjacent to the right-of-way then known as Railroad Avenue (now Babbage Street and Bessemer Street)
east to Lefferts Avenue."` — **a valuable old-street-name key for the whole neighborhood.**
**F224. QUOTE:** `"The station was closed on March 16, 1998, along with nine others, including the other
four on the Lower Montauk branch, due to low ridership and the potential cost of upgrading the stations to
modern standards. This station and Penny Bridge, also on the Lower Montauk, averaged one daily rider each
at the time of their closure."`
**F225. QUOTE (RH main article, slightly different):** `"this station was closed in 1998 due to low
ridership (this station had just one daily rider at the time of its closure). The station and platform
remain, though access via the staircase at Jamaica Avenue is gated off."`
**F226. QUOTE:** `"The station sits on a concrete trestle, supported by pairs of concrete arches. The
station's island platform has a small shelter in the center, and two stairways down to the street."`
**F227. QUOTE:** `"Shortly after the station's closure, it was frequented by the homeless and animals, and
was used as an illegal waste dumping site. In July 2003, new security fencing was installed around the
trestle, though maintenance problems and trespassing issues have continued."`
**F228. QUOTE:** `"The platform could accommodate trains of six 85-foot (26 m) cars."`
**F229. QUOTE:** `"The Jamaica elevated (serving the New York City Subway's J and ​Z trains) runs above the
Montauk Branch tracks along Jamaica Avenue… The closest station is two blocks east at 121st Street."`

### 7.2 Clarenceville station (Atlantic Branch) — P36

**F230. QUOTE:** `"The Clarenceville station was on the Atlantic Branch of the Long Island Rail Road,
located on Atlantic Avenue west of 111th Street in the Richmond Hill section of Queens, New York City."`
**F231. QUOTE:** `"Clarenceville was originally an 1874-built Atlantic Avenue Rapid Transit station that was
reopened as an LIRR station in 1905 as part of the LIRR's electrification of the Atlantic Branch, and
closed in 1939, when the branch was moved underground, along with Warwick Street, Autumn Avenue, Union
Course, Woodhaven, Morris Park, and Dunton stations."`

### 7.3 Subway stations

**P37. 111th Street (BMT Jamaica Line)** — **F232. QUOTE:** `"Located at the intersection of 111th Street
and Jamaica Avenue in Richmond Hill, Queens, it is served at all times by the J train. The Z train skips
this station when it operates."` **This is the one station unambiguously assigned to Richmond Hill alone.**
**F233. QUOTE:** `"This station was opened on May 28, 1917 by the Brooklyn Union Elevated Railroad, an
affiliate of the Brooklyn Rapid Transit Company, replacing Cypress Hills as the line's terminus."`
**F234. QUOTE:** `"This elevated station has three tracks and two side platforms. The center track dead ends
at bumper blocks on both sides of the station and has connections to both local tracks. It is only used for
train storage. It was formerly used to turn trains for the BMT Lexington Avenue Elevated trains from 1917
until 1950."`
**F235. QUOTE:** `"The 1990 artwork is called Points of Observation by Kathleen McCarthy. It is a face-shaped
wire mesh sculpture that affords a view of the street from the platforms. The artwork also appears at 104th
Street and at Woodhaven Bouelvard."` — "Bouelvard" is the source's typo.
**F236. QUOTE:** `"The station was temporarily closed on January 14, 2019, for six months of structural
repairs… both platforms were closed simultaneously to cut the work from 12 months to 6 months; as a result,
the station reopened on June 11, 2019."`

**P38. 104th Street (BMT Jamaica Line)** — **F237. QUOTE:** `"located on Jamaica Avenue between 102nd and
104th Streets in Richmond Hill, Queens. It is served by the Z train during rush hours in the peak
direction, and the J at all other times."`
**F238. QUOTE:** `"Until 1966, this station was known as 102nd Street. It was then given the dual name of
102nd–104th Streets. As of 2011, station signage and the official map give the station name as 104th
Street."`
**F239. QUOTE:** `"The former Brooklyn Manor station on the LIRR's defunct Rockaway Beach Branch, which was
closed in 1962, is two blocks to the west and could be an available transfer if the Rockaway Beach Branch is
reopened for train service."`
**F240. QUOTE:** `"This station formerly had another mezzanine at 102nd Street. The station house and stairs
to the street have been removed, all that remains is the ceiling and some support I-Beams."`

**P30. 121st Street** — see F208 for the contested assignment.
**F241. QUOTE:** `"This station was opened on July 3, 1918, by the Brooklyn Union Elevated Railroad, an
affiliate of the Brooklyn Rapid Transit Company."` — **note this is a different date from the 1917 opening
of 111th and 104th Streets (F233, F237).**
**F242. QUOTE:** `"During construction of the Archer Avenue Line, the Jamaica Avenue elevated line was cut
back past 121st Street on April 15, 1985."`
**F243. QUOTE:** `"The Archer Avenue Line opened on December 11, 1988, and service was extended from 121st
Street to Jamaica Center–Parsons/Archer."`
**F244. QUOTE:** `"This is the easternmost station on the Jamaica Line, east of here, trains go underground to
the BMT Archer Avenue Line."`
**F245. QUOTE:** `"As part of its 2025–2029 Capital Program, the MTA has proposed making the station
wheelchair-accessible in compliance with the Americans with Disabilities Act of 1990."` — **currency flag:
"has proposed" as of the article's writing.**
**F246. QUOTE:** `"There is an additional unstaffed exit at the east (railroad north) end of the station
leading to the west side of 123rd Street."`

**P31. 111th Street–Greenwood Avenue (IND Fulton)** — see F209.
**F247. QUOTE:** `"The station has gone by a number of different names. It opened as Greenwood Avenue. A 1924
system map portrayed the station as "Greenwood Avenue" with "111th St." below it in parentheses and smaller
print. By 1948, "Greenwood" and "111 St." were shown in equal sizes, and by 1959, the station's name was shown
as "111 St–Greenwood". The current official map shows the name as just "111 St". However, station signs still
show "111th Street–Greenwood Avenue"."`
**Note: "Greenwood Avenue" is the pre-1910s name of 111th Street (F66, F221) — the station preserves the
neighborhood's old street nomenclature.**
**F248. QUOTE:** `"This elevated station, opened on September 25, 1915, has three tracks and two side
platforms, with the middle track not used in revenue service."`

**P32. Ozone Park–Lefferts Boulevard** — see F210.
**F249. QUOTE:** `"It opened as Lefferts Avenue. A 1924 system map portrayed the station as "Lefferts Avenue",
with "119th St." shown below the name in parentheses, and in a smaller print. By 1948, "Lefferts" and "119"
were shown in equal sizes, and by 1959 the name was shown as "119 St–Lefferts"."`
**F250. QUOTE:** `"The elevators ultimately opened in January 2018. The project cost $29 million; $8 million for
the station renovation and $21 million for the elevators."`
**F251. QUOTE:** `"In early 2024, the MTA installed a "Welcome to Little Guyana" sign at the station."`
**This is the strongest institutional attestation of the Little Guyana identity in the dossier — but the
station is only partly in South Richmond Hill (F210). Flag.**

### 7.4 The abandoned right-of-way — P39

**F252. QUOTE (Wikipedia, RH main article):** `"Its western boundary north of Atlantic Avenue is formed by the
LIRR's abandoned Rockaway Beach Branch"` (also F16).
**F253. QUOTE (Wikipedia HD article):** `"The LIRR's abandoned stretch of the Rockaway Beach Branch has been
suggested for a greenway to run from Sunnyside, Queens to Rockaway Junction"`.
**F254.** My attempt to fetch a dedicated `QueensWay` article returned a **missing page** (98 bytes). **No
QueensWay source is in evidence; do not write the project's name as if sourced.**
**F255. QUOTE (Wikipedia, RH main article):** `"The Long Island Rail Road provides freight access via the
Montauk Branch, which runs diagonally through the neighborhood from northwest to southeast."`

### 7.5 Buses

**F256. QUOTE (Wikipedia, RH main article):** `"These include the Q8, Q9, Q10, Q24, Q37, Q54, Q55, Q56, Q80 and
Q112 local buses, as well as the QM18 express bus to Manhattan."`
**F257.** For Liberty Avenue specifically, **QUOTE (Wikipedia, *Liberty Avenue*):** `"The Q112 bus serves the
avenue between Waltham Street and either Rockaway Boulevard (East New York) or Cross Bay Boulevard
(Jamaica)."`

---

## 8. PARKS AND PUBLIC SPACE

**FINDER COMPLIANCE NOTE: Forest Park is ruled out of scope for this file. It is named below only where a
retrieved source uses it to state a Richmond Hill BOUNDARY, and in F103/F47 where it is the object of a
Richmond Hill fact. No park record is proposed for it and no history of it is narrated here.**

**F258. DERIVED.** Querying Parks Properties (`enfh-gkve`) for ZIP codes 11415/11416/11418/11419/11421
returns **13 properties, all in community board 409**. Of these, the three that any source places in
Richmond Hill are Jacob Riis Triangle, Phil "Scooter" Rizzuto Park and Lt. Frank McConnell Park.

### P40. Jacob Riis Triangle

**F259. QUOTE (NYC Parks, `https://www.nycgovparks.org/parks/jacob-riis-triangle`):** location
`"Bessemer St., 116 St., 85 Ave."`, `"Zip Code: 11418"`, `"Community Board: 9"`, `"Park ID: Q142"`,
`"Acreage: 0.01"`, `"Property Type: Triangle/Plaza"`.
**F260. DERIVED.** The Parks Properties open-data row for `Q142` gives **acres = 0.005**, against the web
page's **0.01** (F259). **A 2× discrepancy inside one agency. Record both; state neither as fact.**
**F261.** Acquisition date in open data: **`1924-01-01`**.
**F262. QUOTE (NRHP nomination):** `"Jacob Riis Triangle is counted as a contributing site."` (also F33) —
**this small triangle is a contributing resource of the National Register district**, which is a genuinely
distinguishing fact.
**F263. QUOTE (nomination):** the rail line and Myrtle Avenue angle across the district `"creating some
unusually shaped lots including Jacob Riis Triangle (a contributing site)"` (F128).
**F264. FINDER FLAG: NYC Parks' history page for Jacob Riis Triangle contains NO historical text** — the
"History" URL resolves but the body is only the standard park-information chrome. **There is no Parks
historical sign essay for this triangle, and in particular no Parks statement connecting it to Jacob Riis.**
The Riis connection must rest on §5.1 (F186) and on the naming itself, not on a Parks source.

### P41. Phil "Scooter" Rizzuto Park (formerly Smokey Oval Park)

Source: `https://www.nycgovparks.org/parks/Q129/history`
**F265. QUOTE:** `"The site was acquired by condemnation in 1938 and opened that year as Smokey Oval Park. The
park's former name is a reference to the Long Island Railroad terminus, which was a landing area of soot and
ash from the railway smoke. The park was renamed in 2008 after local legend, Phil "Scooter" Rizzuto."`
**F266. QUOTE (Wikipedia, RH main article):** `"Phil "Scooter" Rizzuto Park, formerly Smokey Oval Park, at
Atlantic Avenue between 125th and 127th Streets. The name "Smokey Oval" referred to the smoke from the
adjacent Morris Park Facility of the Long Island Rail Road. In June 2008 was named after New York Yankees
player and broadcaster Phil Rizzuto, who played baseball at nearby Richmond Hill High School."`
**F267. CONFLICT:** Parks attributes the smoke to `"the Long Island Railroad terminus"`; Wikipedia attributes
it to `"the adjacent Morris Park Facility"`. Parks says renamed **"in 2008"**; Wikipedia says **"In June
2008"**. **Record both.**
**F268. QUOTE (Parks):** `"This park is named after Phil "Scooter" Rizzuto, (1917 – 2007) an American Major
League Baseball shortstop and announcer with the New York Yankees."`
**F269. QUOTE (Parks):** `"Rizzuto was born in Brooklyn, NY and attended Richmond Hill High School in Queens
where he played both baseball and football. In 1937, he was signed as an amateur free agent by the New York
Yankees and began his 13-year career with them. He was well known for being the best bunter of his era helping
the Yankees win seven World Series and becoming the AL MVP in 1950. After he retired in 1956, he worked for the
organization as the color commentator for their live broadcasts where he coined his popular catchphrase "Holy
Cow.""`
**F270. QUOTE (Parks):** `"Rizzuto died on August 13, 2007, one month shy of his 90th birthday. His jersey
number 10 was retired, and he was inducted to both Monument Park and the Baseball Hall of Fame."`
**F271.** Parks facilities list: **QUOTE:** `"Baseball Fields, Basketball Courts, Fitness Equipment, Football
Fields, Handball Courts, Playgrounds, Public Restrooms, Spray Showers, Wi-Fi Hot Spots"`.
**F272. QUOTE (Parks):** `"Zip Code: 11418, 11419"`, `"Park ID: Q129"`, `"Acreage: 4.35"`, `"Property Type:
Community Park"`. Open-data row gives **acres 4.353**, location `"Atlantic Ave., 95 Ave. bet. 127 St. and 125
St."`, address `"125-02 ATLANTIC AVENUE"`, acquisition `1938-03-18`.
**F273. DERIVED. CONTESTED.** GeoSearch returns `125-02 ATLANTIC AVENUE, Richmond Hill, NY`, ZIP 11419;
point-in-polygon returns **`QN0903 South Richmond Hill`**, not `QN0902`.
**F274.** A Parks news headline appears on the page: **QUOTE:** `"Holy Cow! Park Renamed for the Scooter Hosts
a Family Day"`. **Undated on the page; do not date it.**
**F275. QUOTE (Parks capital projects):** `"Phil 'Scooter' Rizzuto Park Sports Courts Reconstruction and Adult
Fitness Area Construction"`, with `"$4M Recent Investment"` and a `"Clean & Safe"` park condition score of
`"72"`. **These are live dashboard values and will drift; treat as volatile.**

### P42. Lt. Frank McConnell Park

Source: `https://www.nycgovparks.org/parks/Q217/history`
**F276. QUOTE:** `"This park is located in Richmond Hill."` — **a direct, unambiguous agency assignment.**
**F277. QUOTE:** `"After being used as a public park for more than two decades, this site was officially
assigned to Parks in 1944, and named for Lt. McConnell in 1964."`
**Note the tension with open data, which gives acquisition date `1922-05-02` — consistent with "used as a
public park for more than two decades" before 1944, but the two dates must not be conflated.**
**F278. QUOTE:** `"In 1964, this park was named to honor Lieutenant Frank McConnell (1896-1918), the first
Richmond Hill resident killed in World War I. A star member of the Princeton crew team, McConnell was killed on
July 26, 1918 in northern France during the Second Battle of the Marne."`
**F279. QUOTE:** `"This battle marked a turning point of the war. On July 18, 1918, the Allied commander,
General Ferdinand Foch, counterattacked German troops with forces that included McConnell's division. At
Château-Thierry, American troops won their first decisive victory of the war by forcing German troops back
across the Marne in what was one of the first large-scale retreats by the German army."`
**F280. QUOTE:** `"McConnell Park functions primarily as a sitting area, shaded by an abundance of pin oaks."`
**F281. NAME CONFLICT.** NYC Parks calls it **`"Lt. Frank McConnell Park"`** (page title, open-data `signname`).
Wikipedia's RH main article calls it **`"Lt. Frank McConnell Memorial Park"`**. **Record both; Parks is the
custodian.**
**F282.** Open data: `Q217`, acres **0.207** (web page says **0.21**), ZIP 11419, location
`"94 Ave., Atlantic Ave. bet. Leffers Blvd. and 120 St."` — **"Leffers" is the dataset's own typo for
"Lefferts".**

### P43. Morris Park World War I Memorial

**F283. QUOTE (NYC Parks, McConnell Park history):** `"McConnell Park is home to the Morris Park World War I
Memorial, a large granite monument adorned with a bronze plaque."`
**F284. FINDER FLAG: this single sentence is the ENTIRE evidence base.** The monuments endpoint returned zero
bytes (F9) and the Parks monuments bulk JSON 404'd. **No dedication date, no sculptor, no inscription is in
evidence.** Note also that the memorial is named for **Morris Park**, the sub-settlement (F57), inside a park
named for McConnell — a naming layer worth preserving.

### P44. Parks explicitly NOT in Richmond Hill

**F285. DERIVED.** Of the 13 CB-9 parks returned in F258, the following are in the **11415 (Kew Gardens)** ZIP
and must not be swept into this file: **Eight Oaks Triangle** (`Q206`, `"125 St., Austin St., 84 Dr."`),
**Maple Grove Park** (`Q220F`, `"Hoover Ave. bet. Queens Blvd. and 132 St."`), **Metro Triangle** (`Q157`,
`"125 St., 85 Ave., Metropolitan Ave."`). The **11416/11421** properties (Ampere Playground, Maurice A
FitzGerald Playground, Ruoff Triangle, London Planetree Playground, Legion Triangle, Lt. Clinton L. Whiting
Square, Equity Playground) sit in Ozone Park/Woodhaven territory. **Recorded so the verifier can see they were
considered and set aside.**

---

## 9. DEMOGRAPHICS, "LITTLE GUYANA" AND "LITTLE PUNJAB"

**Reminder F13: every "Richmond Hill and Kew Gardens" statistic below is a CD-9 joint figure and cannot be
disaggregated to Richmond Hill alone.**

### 9.1 Census

**F286. QUOTE (Wikipedia):** `"Based on data from the 2010 United States census, the population of Richmond Hill
was 62,982, a decrease of 3 (0.0%) from the 62,985 counted in 2000. Covering an area of 1,171.55 acres (474.11
ha), the neighborhood had a population density of 53.8 inhabitants per acre (34,400/sq mi; 13,300/km2)."`
**Currency flag: this is 2010 census data.**
**F287. QUOTE:** `"The racial makeup of the neighborhood was 11.2% (7,078) White, 11.1% (6,960) African American,
1.0% (657) Native American, 27.4% (17,252) Asian, 0.2% (116) Pacific Islander, 6.6% (4,139) from other races, and
6.6% (4,136) from two or more races. Hispanic or Latino of any race were 36.0% (22,644) of the population."`
**F288. QUOTE:** `"The entirety of Community Board 9, which comprises Kew Gardens, Richmond Hill, and Woodhaven,
had 148,465 inhabitants as of NYC Health's 2018 Community Health Profile, with an average life expectancy of 84.3
years. This is higher than the median life expectancy of 81.2 for all New York City neighborhoods."`
**F289. QUOTE:** `"As of 2017, the median household income in Community Board 9 was $69,916."`
**F290. QUOTE:** `"Rent burden, or the percentage of residents who have difficulty paying their rent, is 55% in
Richmond Hill and Kew Gardens, higher than the boroughwide and citywide rates of 53% and 51% respectively."`
**F291. QUOTE:** `"Based on this calculation, as of 2018, Richmond Hill and Kew Gardens are considered to be
high-income relative to the rest of the city and not gentrifying."`
**FINDER FLAG: F290 (rent burden above the city rate) and F291 ("high-income… and not gentrifying") sit awkwardly
together in the same source, as does F292's 22% poverty rate. Record the tension; do not smooth it.**
**F292. QUOTE:** `"In 2018, an estimated 22% of Richmond Hill and Kew Gardens residents lived in poverty, compared
to 19% in all of Queens and 20% in all of New York City. One in twelve residents (8%) were unemployed, compared to
8% in Queens and 9% in New York City."`

### 9.2 Demographic change

**F293. QUOTE:** `"Originally, many European (Italian, Dutch, English, Irish, Scots, Danish, and German) and Jewish
families lived in Richmond Hill. In the 1970s, the neighborhood was predominantly Hispanic."`
**F294. QUOTE:** `"Today, the south side of Richmond Hill consists mostly of South Asian Americans (Indians,
Pakistanis, and Bangladeshis) and Indo-Caribbean Americans (Indo-Guyanese, Indo-Trinidadians, Indo-Surinamese, and
Indo-Jamaicans), who have steadily emigrated to the United States since the 1960s."`
**F295. QUOTE:** `"South Richmond Hill is known as Little Guyana for its large Indo-Caribbean American (mostly
Indo-Guyanese and some Indo-Trinidadians) population. It is also called Little Punjab due to its large Punjabi
American (especially Sikh American) population."`
**F296. QUOTE:** `"A portion of Liberty Avenue has also been officially been renamed Little Guyana."` — the
doubled "been" is the source's.
**F297. QUOTE:** `"Richmond Hill also has the largest Sikh population in the city, and 101st Avenue has evolved
into "Little Punjab", or Punjab Avenue, has emerged in Richmond Hill, Queens."` — **the sentence is
ungrammatical in the source; quote it only in fragments.**

### 9.3 Liberty Avenue — P45

Source: `https://en.wikipedia.org/wiki/Liberty_Avenue_(New_York_City)`
**F298. QUOTE:** `"A portion of Liberty Avenue in South Richmond Hill is known as "Little Guyana" because it runs
through an Indo-Caribbean American neighborhood with mostly Indo-Guyanese and Indo-Trinidadian and Tobagonian
cultures and people there."`
**F299. QUOTE:** `"Indian clothing stores, puja stores, roti shops, Caribbean bakeries, Hindu temples, mosques, and
other Indo-Caribbean American businesses are on this portion of Liberty Avenue."`
**F300. QUOTE:** `"Liberty Avenue was co-named "Little Guyana Avenue" on May 29, 2021."`
**This is the only dated attestation of the co-naming in the dossier. It comes from Wikipedia, not from a City
Council or DOT source — I could not reach one (the NYC street-name dataset returned 403). Flag as
single-source.**
**F301. QUOTE:** `"Parallel to Liberty Avenue is 101st Avenue which was renamed Little Punjab, due its similar
presence of Punjabi and other South Asian cultures."` — **note "renamed", where F297 says "evolved into" and
"Punjab Avenue". No date is given for 101st Avenue anywhere in my sources.**
**F302. QUOTE:** `"Liberty Avenue is an 8-mile (13 km) long west-east avenue in Brooklyn and Queens, New York City…
running between Mother Gaston Boulevard in Brooklyn in the west and Farmers Boulevard in Queens in the east."`
**FINDER FLAG: Liberty Avenue runs 8 miles across two boroughs. Like Rockaway Beach and Boardwalk on the
peninsula, it MAY NOT BE CLAIMED WHOLE by this file — only the South Richmond Hill portion is in play.**
**F303.** See also **F251**: the MTA's `"Welcome to Little Guyana"` sign at Ozone Park–Lefferts Boulevard, early
2024.
**F304.** And **F124**: the NYT's `"a place to eat Caribbean cuisine, shop for Bollywood movies, worship at a Sikh
temple"` — via the nomination, not the original.

### 9.4 P46. 101st Avenue / "Little Punjab" / "Punjab Avenue"

**F305.** Attested **only** by F297 and F301, which disagree on the mechanism ("evolved into" vs "renamed") and on
the name ("Little Punjab" vs "Punjab Avenue"), and neither gives a date. **No official source retrieved.**
**F306. DERIVED.** DOHMH inspection records place a cluster of Indian and Punjabi-named establishments on 101st
Avenue in ZIP 11419 — e.g. `NEW APNA VIRSA RESTAURANT` (118-05), `APNA PIND` (131-09), `DESI PIZZA` (111-03),
`SR 101 MEAT SHOP` (116-01), `SOHNA MEAT SHOP` (115-04), `1313 CAFE & JUICE BAR` (111-18). **This is a pattern in
an inspection dataset, not a source describing the avenue. See §10 for the constraint that imposes.**

---

## 10. COMMERCIAL LIFE AND BUSINESSES — READ THE CONSTRAINT FIRST

**F307. EXPLICIT SOURCING DECLARATION, as the wave brief requires.**
**For EVERY restaurant, bakery, bar, shop and food business named in this section, the DOHMH restaurant
inspection dataset (`https://data.cityofnewyork.us/resource/43nn-pn8j.json`) is the ONLY source I obtained.**
There is **no** press coverage, **no** institutional description, **no** business website, and **no** historical
account behind any of them. WebSearch was unavailable throughout (F1).

**What that dataset does and does not establish:** it establishes that an establishment with a given trade name
held a DOHMH permit at a given address in a given ZIP code, and carries an agency-assigned cuisine label. It
establishes **nothing** about when the business opened, whether it is still trading, whether it is notable,
whether it is any good, or what it means to the neighborhood. **A DOHMH row is a permit record, not a
description.** Anything written from it must stay inside those limits.

**F308. DERIVED.** The dataset returns **202 unique establishments (by CAMIS)** in ZIP codes 11418 and 11419.
Agency-assigned cuisine labels, most common first:
`Caribbean 45 · Indian 21 · American 16 · Chinese 15 · (blank) 14 · Latin American 11 · Pizza 11 · Bakery
Products/Desserts 8 · Spanish 7 · Mexican 6 · Donuts 6 · Sandwiches 4 · Fusion 4 · Italian 4 · Hamburgers 4 ·
Chicken 4 · Tex-Mex 3 · Coffee/Tea 3`

**F309.** **Caribbean is the single largest category by a factor of more than two over the next non-generic
category, and Caribbean plus Indian together account for roughly a third of all establishments.** This is
consistent with F294–F299 and with F124. **It is a defensible aggregate observation about the commercial
streetscape. Individual named businesses are not.**

**F310. P47 (collective).** Illustrative rows, recorded so the verifier can see exactly what the evidence looks
like — **each one DOHMH-only**:
`TROPICAL ISLE ROTI SHOP & BAKERY, 118-19 Liberty Avenue, 11419` · `JULIE'S BAKERY & ROTI SHOP, 117-16 Liberty
Avenue, 11419` · `Slight Pepper Roti Shop, 125-01 Liberty Avenue, 11419` · `BAKEWELL BAKERY & RESTAURANT, 127-08
Liberty Avenue, 11419` · `SHIVRAM'S, 129-05 Liberty Avenue, 11419` · `NEW THRIVING RESTAURANT, 120-12 Liberty
Avenue, 11419` · `NEW CHINESE GARDEN OF GUYANA, 109-10 Liberty Avenue, 11419` (cuisine `Fusion`) ·
`SHERIFF STREET LOUNGE, 120-09 Liberty Avenue, 11419` · `LITTLE BROWN JUG, 124-02 Jamaica Avenue, 11418` ·
`INDIA CAFE, 94-08 Lefferts Boulevard, 11419`.
**F311.** `NEW CHINESE GARDEN OF GUYANA` and the several `TROPICAL JADE` locations are the kind of
Chinese-Guyanese hybrid the cuisine labels only partly capture. **Interesting, but still DOHMH-only. Do not
narrate a cuisine history from a permit table.**
**F312.** `OLIGARCH, 86-15 Lefferts Boulevard, 11418, Jewish/Kosher` — **this is the Richmond Hill Republican Club
address (P15).** See **F159**: it contradicts LP-2126's 2002 statement that the landmark has been
`"Vacant since the mid 1980s"`. **DOHMH-only; do not assert what occupies the landmark today.**

### 10.1 The historic commercial core — P48

**F313. QUOTE (Wikipedia, RH main article):** `"These and several other landmarks are located in the vicinity of the
"Richmond Hill Triangle", bracketed by Jamaica Avenue, Myrtle Avenue, and 117th Street. This was historically the
commercial center of Richmond Hill."`
**F314. QUOTE:** `"The intersection of Jamaica and Myrtle Avenues is also known as James J. Creegan Square."`
**Single-source; no date, no biography of Creegan in any source I retrieved.**
**F315. QUOTE (Wikipedia):** `"Main commercial streets in the neighborhood include Jamaica Avenue, Atlantic Avenue
and Liberty Avenue."`
**F316. QUOTE (nomination):** the district boundary was drawn `"to exclude areas that had experienced commercial and
institutional development—particularly the blocks along 86th Avenue, along Jamaica Avenue, and near the triangular
intersection of Myrtle Avenue and the Long Island Railroad."` **The commercial core is deliberately OUTSIDE the
historic district.**

### 10.2 P49. The Triangle Hofbrau

**F317. QUOTE (Wikipedia, RH main article):** `"The Triangle Hofbrau, opened as a hotel in 1893 and as a restaurant
in 1893, was a restaurant which was frequented by such stars as Mae West in the 1920s and 1930s. It sat on the
triangular piece of land bordered by Hillside Avenue, Jamaica Avenue, and Myrtle Avenue. The building has since been
converted to medical offices."`
**F318. FINDER FLAG: the source says "opened as a hotel in 1893 and as a restaurant in 1893" — the SAME YEAR
twice. This is a corrupted sentence.** One of those dates is almost certainly wrong, and I have no second source
to say which. **Do not repair it silently; quote around it or omit the dates.**
**F319.** The Mae West claim is **single-source, undated as to any specific visit, and unverifiable from anything I
retrieved.** Treat as folklore-grade.
**F320. DERIVED.** GeoSearch on 117-01 Hillside Avenue (the triangle's approximate location) returns
`117-01 HILLSIDE AVENUE, Richmond Hill, NY`, ZIP 11418; point-in-polygon **`QN0902 Richmond Hill`**.
**Note: I chose that address as a probe; no source states it.**

### 10.3 P50. RKO Keith's Theater (Richmond Hill)

Source: `https://en.wikipedia.org/wiki/RKO_Keith%27s_Theater_(Richmond_Hill,_Queens)`
**F321. QUOTE:** `"RKO Keith's Theater is a historic RKO Pictures movie theater located at 117-09 Hillside Avenue in
the Richmond Hill section of the New York City borough of Queens. It was designed by architect R. Thomas Short and
built in 1929 in the Neo-Classical Revival style."`
**F322. QUOTE:** `"It has a two-story, three bay wide front facade with its original, horizontal marquee and terra
cotta details. The orchestra level measures 100 feet 6 inches (30.6 m) deep and 99 feet (30 m) wide. It has a
balcony and three tiered boxes of seating on the north and south walls."`
**F323. QUOTE:** `"The theater closed in 1968 and it has been used as a bingo hall and flea market."`
**F324. QUOTE — the most consequential sentence here:** `"In 2003, the theater was listed on New York's State
Register of Historic Places, but the property owner refused listing on the National Register of Historic Places."`
**FINDER FLAG: this is a State Register listing ONLY. It is NOT on the National Register. It will not appear in
any NRHP dataset, and anyone checking NRHP and finding nothing has not refuted it.**
**F325. ADDRESS CONFLICT.** This article says **117-09 Hillside Avenue**. The RH main article instead locates it
by adjacency: **QUOTE:** `"Between Myrtle Avenue and the Montauk Line railroad is a former movie theatre, RKO
Keith's Richmond Hill Theater, opened in 1929, functioning since 1968 as a bingo hall."` **Record both.**
**F326. NAME CONFLICT.** `"RKO Keith's Theater"` (article title and text) vs `"RKO Keith's Richmond Hill Theater"`
(RH main article) vs `"RKO Keith's Richmond Hill Theatre"` (Wikipedia HD article). **Three spellings; pick none
silently.**
**F327.** The article's external links cite a *New York Daily News* piece by Nicholas Hirshon, August 13, 2008,
titled **QUOTE:** `"Fears of coming detractions at former RKO Keith's in Richmond Hill"`. **I could not retrieve
it. Recorded as a lead, not as evidence.**
**F328. CURRENCY WARNING.** `"has been used as a bingo hall and flea market"` and the RH main article's
`"functioning since 1968 as a bingo hall"` are **undated present-tense claims about a building's current use.**
**Do not state the theater's present use.**

### 10.4 P51. Jahn's ice cream parlor

**F329. QUOTE (Wikipedia, RH main article):** `"Near the northwest corner of Hillside Avenue and Myrtle Avenue sat
an old time ice cream parlor, Jahn's. It closed in late 2007."`
**F330.** The HD article repeats it nearly verbatim. **Single-source in substance; no opening date, no history, no
proprietor named in anything I retrieved.**

### 10.5 P52. The Haugaard lumber mill and the Hillside Bank Building

**F331.** The **Long Island Mill and Construction Company** lumber mill, `"located on 121st Street near Jamaica
Avenue"` (F106) — **nomination-sourced; no indication it survives.**
**F332.** The **Hillside Bank Building**, the site of the 1917 shooting (F110) — **LP-2126-sourced; no address and
no indication it survives.** **Both are historical sites, not extant places, on this evidence.**

---

## 11. CIVIC INSTITUTIONS, SCHOOLS AND SERVICES

### 11.1 Richmond Hill High School — P53

Source: `https://en.wikipedia.org/wiki/Richmond_Hill_High_School_(Queens)`
**F333. QUOTE:** `"Richmond Hill High School was founded in 1899, one year after Queens became part of New York
City, in the then-bucolic setting of Richmond Hill. As such, it is the oldest high school south of Jamaica Avenue
in Queens, New York City."`
**F334. QUOTE:** `"Its first principal was Isaac Newton Failor (1851 to 1925), author of the longtime school book
"Inventional Geometry" in 1904. He built an observatory on top of the building open to the students."`
**F335. QUOTE:** `"The high school shared its facility with a local elementary school on the then Johnson Avenue.
In 1899, the first students were admitted to the Johnson Avenue site, and in 1919 the current site was opened on
114th street."`
**F336. QUOTE:** `"The school, built to accommodate 1,800 students, had reached an enrollment of 3,600 for the
2007–2008 school year, severely straining the school's ability to serve its students. The school's population has
declined to 2,300 students."`
**F337. QUOTE:** `"Richmond Hill High School was among over two dozen schools due to be closed from June 2012 due to
persistently low academic performance."`
**F338. QUOTE (RH main article):** `"Until June 2012, the city had planned to close the high school. The city had
slated the school to close; however, a court ruling prevented the school's closure."`
**F339. QUOTE:** `"Rudolph Giuliani, Mayor of New York, proclaimed September 24, 1997, as "Richmond Hill High School
Day"."`
**F340. QUOTE:** `"Richmond Hill High School is the zoned school for Richmond Hill Residents, while some living
towards the east of Richmond Hill has Hillcrest High School as their zoned school."` — grammar is the source's.
**F341. CURRENCY WARNING.** The article contains clearly time-bound and partly promotional present-tense material:
**QUOTE:** `"In 2024, the school, with its new principal, Tarek Alamarie, implemented new programs, such as a
hydroponics lab, an Army JROTC program and a culinary class."` and **QUOTE:** `"It has since been striving to prove
that it is one of the top High Schools, not only in Richmond Hill alone, but in New York City."` — **the second is
editorialising, not fact. Do not reuse it.** Likewise **QUOTE:** `"It has been voted the 100 U.S. Best High School
in 2005."` is garbled and unattributed.
**F342. NOTABLE ALUMNI as listed** (Wikipedia, unsourced list — **treat every one as a candidate needing separate
verification**): `Fred Trump (1905–1999)` · `John G. Trump (1907-1985)` · `Pauli Murray (1910–1985) class of 1927`
· `Anthony Joseph Cardinal Bevilacqua (1923–2012)` · `Pop Smoke (1999–2020)` · `Rodney Dangerfield (1921–2004),
graduated in 1939` · `Albert Dekker (1905–1968)` · `Seymour Halpern (1913–1997)` · `Frank Kameny (1925–2011, class
of 1941)` · `Herb Karpel` · `Cyndi Lauper (born 1953)` · `Michael R. Long (1940–2022)` · `Phil Rizzuto (1917–2007)`
· `Marius Russo (1914–2005)`.
**F343. DERIVED.** GeoSearch: `89-30 114 STREET, Richmond Hill, NY`, ZIP 11418, 40.69464 / −73.83372;
point-in-polygon **`QN0902 Richmond Hill`**.

### 11.2 Elementary and middle schools — P54 (collective)

**F344. QUOTE (Wikipedia):** `"PS 51 (grades PK-1), PS 54 Hillside Avenue School, PS 55 The Maure School (grades
K-5), PS 56 Harry Eichler School (grades 2–5), PS 62 Chester Park School, PS 66 Jacqueline Kennedy Onassis School, a
New York City Landmark, PS 90 Horace Mann School, PS 161 Arthur R. Ashe Junior School"`
**F345. QUOTE:** `"Residents are zoned to MS 72 and MS 217 in Briarwood, and MS 137 in Ozone Park."`
**F346.** Apart from **PS 66** (P16), **none of these has an address, a date, or a description in any source I
retrieved.** Name-only.

### 11.3 Libraries — P28, P29, P55

**F347. QUOTE (Wikipedia):** `"The Queens Public Library operates two branches in Richmond Hill: The Richmond Hill
branch at 118–14 Hillside Avenue; The Lefferts branch at 103–34 Lefferts Boulevard"` (also §6.3).
**F348. DERIVED.** Richmond Hill branch: GeoSearch `118-14 HILLSIDE AVENUE, Richmond Hill, NY`, ZIP 11418,
40.70076 / −73.83164; point-in-polygon **`QN0902 Richmond Hill`**. **Uncontested.**
**F349.** Lefferts branch: **contested — see §6.3 / F207.**
**F350. P55. The 1905 Carnegie library.** **QUOTE (LP-2126):** `"in 1905, the Richmond Hill Library, one of the
Carnegie libraries, was built on Lefferts Boulevard."`
**F351. FINDER FLAG: LP-2126 puts the 1905 Carnegie library on LEFFERTS BOULEVARD; Wikipedia puts today's Richmond
Hill branch on HILLSIDE AVENUE and a separate "Lefferts branch" on Lefferts Boulevard.** Whether the Carnegie
building is the ancestor of the Hillside Avenue branch, of the Lefferts branch, or of neither, **is not established
by anything I retrieved. Do not assert a lineage.** Note also the Friends group listed in Wikipedia's external
links, **QUOTE:** `"Friends of the Richmond Hill Library"` — no page retrieved.
**F352.** See also **F204**, the 1899 `"Arcaneum Hall Library"` — a possible third, earlier library.

### 11.4 Police and fire — P56, P57

**F353. QUOTE (Wikipedia):** `"Kew Gardens, Richmond Hill, and Woodhaven are patrolled by the 102nd Precinct of the
NYPD, located at 87–34 118th Street."` **A three-neighborhood command; not a Richmond Hill institution alone.**
**F354. DERIVED.** GeoSearch `87-34 118 STREET, Richmond Hill, NY`, ZIP 11418; point-in-polygon
**`QN0902 Richmond Hill`**.
**F355. QUOTE:** `"The 102nd Precinct ranked 22nd safest out of 69 patrol areas for per-capita crime in 2010."`
**F356. QUOTE:** `"The precinct reported 2 murders, 24 rapes, 101 robberies, 184 felony assaults, 104 burglaries, 285
grand larcenies, and 99 grand larcenies auto in 2018."` **Currency flag: 2018.**
**F357. QUOTE:** `"The 102nd Precinct has a lower crime rate than in the 1990s, with crimes across all categories
having decreased by 90.2% between 1990 and 2018."`
**F358. QUOTE (fire stations):** `"Engine Co. 285/Ladder Co. 142 – 103-17 98th Street; Engine Co. 294/Ladder Co. 143
– 101-02 Jamaica Avenue; Squad 270/Division 13 – 91-45 121st Street"`
**F359. FINDER FLAG on F358: 103-17 98th Street is WEST of every western boundary given in §1 except LPC's 100th
Street (F20) — and even that puts it outside.** Wikipedia nonetheless calls it one of `"three New York City Fire
Department (FDNY) fire stations"` that `"Richmond Hill contains"`. **Contested; record, do not resolve.**

### 11.5 Post offices — P58

**F360. QUOTE (Wikipedia):** `"The United States Post Office operates two post offices nearby: South Richmond Hill
Station – 117-04 101st Avenue; Richmond Hill Station – 122-01 Jamaica Avenue"`
**Note the source's own hedge, `"nearby"`, rather than "in Richmond Hill".**
**F361.** See also **F156**: the Richmond Hill Republican Club `"was constructed as a political club and post
office"` — an earlier postal use at a third address.
**F362. QUOTE (Wikipedia):** `"By 1872, a post office was established in the neighborhood, while the Clarenceville
neighborhood was merged into Richmond Hill."` **Conflict with F55/F98, which put the Clarenceville merger at
1895, not 1872.**

### 11.6 Health — P59 (institutions named only as "nearest")

**F363. QUOTE (Wikipedia):** `"The nearest major hospitals are Long Island Jewish Forest Hills and Jamaica
Hospital."` — **explicitly framed as "nearest", i.e. NOT in Richmond Hill. Do not make either a Richmond Hill
place.**
**F364. QUOTE:** `"In Richmond Hill and Kew Gardens, there were 92 preterm births per 1,000 live births (compared to
87 per 1,000 citywide), and 15.7 births to teenage mothers per 1,000 live births (compared to 19.3 per 1,000
citywide)."`
**F365. QUOTE:** `"In 2018, this population of uninsured residents was estimated to be 14%, slightly higher than the
citywide rate of 12%."`
**F366. QUOTE:** `"The concentration of fine particulate matter, the deadliest type of air pollutant, in Richmond
Hill and Kew Gardens is 0.0073 milligrams per cubic metre (7.3×10−9 oz/ft3), less than the city average."`
**F367. QUOTE:** `"In Richmond Hill and Kew Gardens, 23% of residents are obese, 14% are diabetic, and 22% have high
blood pressure—compared to the citywide averages of 22%, 8%, and 23% respectively."`
**F368. QUOTE:** `"For every supermarket in Richmond Hill and Kew Gardens, there are 11 bodegas."`
**FINDER FLAG: F368 is the kind of vivid statistic that reads well and disaggregates badly. It is a CD-9 figure
covering Kew Gardens and Woodhaven too (F13).**

### 11.7 Education statistics

**F369. QUOTE:** `"While 34% of residents age 25 and older have a college education or higher, 22% have less than a
high school education and 43% are high school graduates or have some college education. By contrast, 39% of Queens
residents and 43% of city residents have a college education or higher."`
**F370. QUOTE:** `"The percentage of Richmond Hill and Kew Gardens students excelling in math rose from 34% in 2000
to 61% in 2011, and reading achievement rose from 39% to 48% during the same time period."`
**F371. QUOTE:** `"In Richmond Hill and Kew Gardens, 17% of elementary school students missed twenty or more days per
school year, lower than the citywide average of 20%. Additionally, 79% of high school students in Richmond Hill and
Kew Gardens graduate on time, more than the citywide average of 75%."`

### 11.8 P60. Richmond Hill Historical Society

**F372.** Address, from its own site (`https://richmondhillhistory.org/`):
**QUOTE:** `"The Richmond Hill Historical Society, 112-13 84th Avenue, Richmond Hill, NY 11418"`.
**Note: 84th Avenue between 112th and 113th Streets is INSIDE the National Register district (F150).**
**F373. QUOTE:** `"The Richmond Hill Historical Society (R.H.H.S.) is a nonprofit organization that promotes historic
preservation efforts in the Village of Richmond Hill. It was founded in the early 1980's by a group of concerned
citizens who wanted to establish a showcase and archive dedicated to preserving the history of Richmond Hill,
including its rich architectural and cultural heritage."`
**F374. QUOTE:** `"The Richmond Hill Historical Society endeavors to preserve the past and promote the future of
Richmond Hill through fostering a better appreciation, understanding and enjoyment of its historic heritage as
embodied by its architectural legacy and the contributions of its past and present residents."`
**F375. QUOTE (its stated activities):** `"Sponsor Tours of Historic Homes · Serve as a Clearing House for
Restoration techniques and products · Help match historic properties with interested buyers · Welcome new
homeowners to the community · Sponsor lectures and exhibits that highlight Richmond Hill history and the broader
area of the Victorian period · Work to secure Historic District status for portions of Richmond Hill · Cooperate
with other organizations that share our goals and concerns · Endeavor to archive and protect surviving records and
personal collections relating to Richmond Hill history and make it available to students and scholars"`
**F376.** The site advertises an **"ARCHIVE MUSEUM"**, an **"ERNEST R BALL COLLECTION"**, **"STREET POSTCARDS"**,
**"MAPS"** including **"Early Maps of Long Island"** and **"Former Street Names"** in its navigation. **The Archive
Museum page contains no description of a museum — only the mission text repeated (F374). There is no evidence in
this dossier of visiting hours, a public collection, or that the "museum" is open to the public. Do NOT write it up
as a visitable museum.**
**F377.** The site footer reads **QUOTE:** `"©2022 By Richmond Hill Historical Society."` — **currency flag: the
site may not have been updated since 2022.**
**F378.** Third-party corroboration of the society's activity: RHHS representatives testified at the LPC hearings
for **both** the Richmond Hill Republican Club (F158) and P.S. 66 (LP-2317 hearing record), and the NRHP nomination
credits it with spearheading the local preservation movement (F125). **This is genuinely well-corroborated.**
**F379.** But see **F10**: its CHURCHES page is copied from Wikipedia and its BUSINESSES page is empty. **The
organisation is well attested; its website is not a research source.**

### 11.9 P61. Felix Cuervo Corner

**F380. QUOTE (Wikipedia):** `"The southeast corner of 86th Avenue and 111th Street in Richmond Hill is designated
Felix Cuervo Corner. Cuervo was an elevator operator who campaigned for elevator safety and other maintenance issues
in high rise buildings."`
**Single-source; no date of designation, no dates for Cuervo, no second source. A charming detail on thin
evidence.**

### 11.10 P62. Political representation

**F381. QUOTE (Wikipedia):** `"Politically, Richmond Hill is represented by the New York City Council's 28th, 30th,
and 32nd Districts."`
**F382. DERIVED.** The Parks and LPC datasets consistently return **council district 29** for Richmond Hill
properties (Jacob Riis Triangle, Rizzuto Park, McConnell Park all show `councildistrict 29`, and NYC Parks names
`"Council Member: Lynn Schulman"`), and **32** for the Ozone Park/Woodhaven-side properties.
**F383. FINDER FLAG: Wikipedia lists districts 28, 30 and 32 and does NOT list 29, while the city's own park
records for Richmond Hill parks all say 29. Record the conflict; resolve neither. Council district lines are
redrawn on a cycle and this is volatile in any case.**

---

## 12. NOTABLE RESIDENTS — candidates only, all needing separate verification

**F384.** Wikipedia's RH main article carries a `"Notable residents"` list. **It is unsourced in the article, and
most entries assert only "lived in Richmond Hill" with no address, date range, or citation.** I record the list in
full so the verifier can triage it, and I am **not** endorsing any entry.

`Robert Angeloch (1922–2011), artist, co-founder of the Woodstock School of Art` · `Joseph Baldi, serial killer
known as "The Queens Creeper"` · `Amelia Edith Huddleston Barr (1831–1919), author` · `Gary Barnett (born c. 1956),
founder of Extell Development Company` · `Karen Berg (1942–2020), founder of the Kabbalah Centre` · `Sal Butera
(born 1952), baseball catcher` · `Jack Cassidy (1927–1976), actor, "born and raised in Richmond Hill"` · `Percy
Crosby (1891–1964), creator of the comic Skippy` · `Danny Fields (born 1939), music manager and punk-rock figure` ·
`Morton Gould (1913–1996), composer and conductor` · `Alfred H. Grebe (1895–1935), radio broadcasting pioneer` ·
`Seymour Halpern (1913–1997), congressman 1959–1973` · `William Hickey (1927–1997), actor` · `Frank Kameny
(1925–2011), LGBT rights activist` · `Jack Kerouac (1922–1969), "lived in Richmond Hill from 1950 to 1955"` ·
`Wilbur Knorr (1945–1997), historian of mathematics` · `Jack Lord (1920–1998), actor` · `Jack Maple (1952–2001),
NYPD deputy commissioner and architect of CompStat` · `Marx Brothers – "Family comedy act"` · `Anaïs Nin
(1923–1977), author, "lived in Richmond Hill prior to moving to Paris in 1924"` · `Jacob Riis (1849–1914),
journalist, photographer and reformer` · `Phil Rizzuto (1917–2007)` · `Bob Sheppard (1910–2010), Yankees public
address announcer` · `Joe Solomon (1930–2023), West Indian cricketer` · `Robin Tewes (born 1950), painter, "born and
raised in Richmond Hill"` · `Dick Van Patten (1928–2015), actor, "raised in Richmond Hill"`.

**F385. The three with independent corroboration in this dossier:**
- **Jacob Riis** — corroborated three ways: the church article's **QUOTE:** `"a Richmond Hill resident from 1885 to
  1912 and a church member from 1900 to 1912"` (F186); the Riis memorial window donated by Elizabeth Riis in 1905
  (F185); and **Jacob Riis Triangle**, a contributing site of the National Register district (F262). **The
  strongest notable-resident claim in the dossier.**
- **Phil Rizzuto** — corroborated by NYC Parks' own historical sign text (F268–F270), which independently states he
  `"attended Richmond Hill High School in Queens where he played both baseball and football"`. **Note the careful
  distinction: Parks says he was BORN IN BROOKLYN and ATTENDED school here.** Wikipedia's RH main article says he
  `"lived and went to high school in Richmond Hill"`. **Record the difference — "born in Brooklyn" is Parks'
  wording and it constrains what may be said.**
- **Frank Kameny** and **Seymour Halpern** appear on **both** the residents list and the high-school alumni list
  (F342), with Kameny given as `"class of 1941"`.

**F386. FINDER FLAG on `Marx Brothers – Family comedy act`:** this entry gives **no dates, no address, and no
claim of residence at all** — it is a bare name in a residents list. **The Marx Brothers' New York associations are
overwhelmingly documented elsewhere (Manhattan). Treat this as the weakest entry on the list and do not repeat it
without a real source.**
**F387. FINDER FLAG on `Joseph Baldi, serial killer known as "The Queens Creeper"`:** no dates, no source, and a
grave claim about a named individual. **Do not publish without independent verification.**
**F388. FINDER FLAG on Anaïs Nin:** the list gives her dates as `(1923–1977)`. **Anaïs Nin was born in 1903, not
1923** — and the entry says she lived here `"prior to moving to Paris in 1924"`, which is impossible if she were
born in 1923. **The source is internally incoherent here. Do not reuse these dates.**
**F389. FINDER FLAG on Jack Kerouac:** the entry gives `"from 1950 to 1955"` but **no address**. Kerouac's Queens
addresses are frequently placed in **Ozone Park** in other literature. **No address is in evidence here; do not
supply one.**
**F390.** Additional named individuals attested by primary sources rather than the list: **Albon Platt Man**,
**Alrick Man**, **Edward Richmond**, **Oliver B. Fowler**, **Henry Edward Haugaard (1866–1939)**, **William Conrad
Haugaard (1871–1942)**, **John August Theodore Neilsen (1860–1931)**, **Daniel Stage (1870–1929)**, **Wade &
Cullingford**, **Henry T. Jeffrey Jr.**, **Daniel and Abbie B. Eldridge**, **Lt. Frank McConnell (1896–1918)**,
**Isaac Newton Failor (1851–1925)**, **Harry S. Chambers**, **C.B.J. Snyder**, **Thomas Henry Poole (1860–1919)**,
**Nathaniel W. Vickers**, **R. Thomas Short**, **Herbert M. Newcomb**.
**F391. QUOTE (LP-2126):** `"The Haugaard architectural legacy did, however, continue on into the next generation
with two of the Haugaard sons becoming noteworthy in their fields. William E. Haugaard became New York State"` —
**the sentence is cut off at the scan's column break. The completion ("State Architect", most likely) is NOT in
evidence. Do not complete it.**

---

## 13. WHAT I DELIBERATELY DID NOT PURSUE

**F392. Forest Park.** Wave 4 ruled that Forest Park belongs to no neighborhood file and that Richmond Hill and Kew
Gardens would both be tempted. **I have proposed no Forest Park record and no Forest Park narrative.** Forest Park
appears above in exactly four roles, all of them boundary or relational: F14/F15/F23/F27 (it is named as a boundary
by four independent sources, which is unavoidable), F47 (a Battle of Long Island claim that two sources locate
inside it — recorded so the verifier can rule it out), F103 (Alrick Man's role in creating it, a fact about a
Richmond Hill developer), and F169 (LPC locating P.S. 66 relative to it). **Nothing inside Forest Park is proposed
as a Richmond Hill place — not the carousel, not the golf course, not the bandshell, not Oak Ridge, not the
Overlook.** Note that the **Forest Park Carousel** appears in the NRHP Queens table with city
`"[[Woodhaven, Queens|Woodhaven]]"` and address `"Woodhaven Blvd. and Myrtle Ave."` — **I flag it only to confirm
that no source in my retrieval assigns it to Richmond Hill.**

**F393. Flushing Meadows Corona Park and the eight `Ethos.Seeds.CitiFieldPlaces` holdings.** These are the far side
of the borough from Richmond Hill and **nothing in my retrieval touched them.** No record, no prose. A routing link
to `/g/citi-field-guide` would not be warranted from this page on any evidence I gathered.

**F394. Jamaica Bay and the Rockaway peninsula.** Per the wave brief, Richmond Hill's group (with Jamaica and Kew
Gardens) does not touch Far Rockaway or Rockaway Beach. **I have manufactured no tie across the bay.** The word
"Rockaway" appears above only in: the **Rockaway Beach Branch** right-of-way (F16, F252–F255), which is a rail
alignment forming Richmond Hill's western boundary; **Rockaway Boulevard**, in a bus-route quotation (F257); and
**F42**, where Wikipedia claims the pre-colonial occupants were `"the Rockaway Native American group, for which the
Rockaways were named"` — **a claim about an Indigenous people, contradicted by two institutional sources (F42), and
NOT a geographic tie to the peninsula. It must not be turned into one.**

**F395. The "Jamaica" name collision.** Per the brief, I checked every instance. In this dossier "Jamaica" appears
as: the **Town of Jamaica** (colonial/19th-century jurisdiction — F44, F72, F104, F164); **Jamaica Avenue** the
street (F46, F49, F150, F313–F316, and most transit facts); the **Jamaica neighborhood** (F14, F20 as an eastern
neighbor); **Jamaica Hospital** (F110, F363); the **BMT Jamaica Line** (F116, F229, F232, F237, F241); and
**Jamaica–Van Wyck station** (F211). **Jamaica Bay does not appear in any Richmond Hill source I retrieved, and I
have introduced no reference to it.** **The verifier should watch particularly for F44/F72/F104: "the Town of
Jamaica" and "western Jamaica" are jurisdictional, NOT the modern neighborhood, and the nomination uses them
constantly.**

**F396.** I did not pursue individual DOHMH establishments beyond the aggregate (F307–F312), because a permit table
cannot support a place record and the brief requires me to say so explicitly.

---

## 14. SUMMARY OF CONTESTED NEIGHBORHOOD ASSIGNMENTS

Every place below has **at least one source assigning it to a neighborhood other than Richmond Hill**. Recorded,
not resolved.

| # | Place | Address | Competing assignments |
|---|---|---|---|
| P19 | **Church of the Resurrection** | 85-09 118th St | NRHP table: **Kew Gardens/Richmond Hill** (both) · Wikipedia article title: **Kew Gardens** · article text + GeoSearch + PIP: **Richmond Hill** · **ZIP 11415 = Kew Gardens** · nomination: `"just east of the historic district"` |
| P21 | **Kent Manor** | 117-01 Park Lane South | NRHP: **Kew Gardens** · GeoSearch: **Forest Park** · PIP: **Kew Gardens** · ZIP 11418 = Richmond Hill |
| P29 | **QPL Lefferts branch** | 103-34 Lefferts Blvd | Wikipedia: **Richmond Hill** · GeoSearch: **Richmond Hill** · PIP: **South Ozone Park (CD 10)** |
| P30 | **121st Street station** | 121st St & Jamaica Ave | Wikipedia: `"in Richmond Hill and Kew Gardens"` (both, one sentence) |
| P31 | **111th St–Greenwood Av station** | Liberty Av & 111th St | Wikipedia station article: `"South Ozone Park and South Richmond Hill"` · Wikipedia RH article: **Richmond Hill** |
| P32 | **Ozone Park–Lefferts Blvd station** | Lefferts Blvd & Liberty Av | Wikipedia station article: **South Ozone Park**, `"part of the station also in South Richmond Hill"` · Wikipedia RH article: **Richmond Hill** · station name says **Ozone Park** |
| P33 | **Jamaica–Van Wyck station** | Van Wyck Expwy | Wikipedia RH article: **Richmond Hill** · station name + all §1 boundaries: **Jamaica** side of the eastern edge |
| P34 | **Morris Park Facility (LIRR)** | Atlantic Av, Lefferts Blvd–120th St | No source assigns a neighborhood; named for Richmond Hill's **Morris Park** sub-settlement; adjoins the **Richmond Hill Storage Yard** |
| P20 | **St. Benedict Joseph Labre** | 94-40 118th St | NRHP + Wikipedia: **Richmond Hill** · PIP: **South Richmond Hill (QN0903)** |
| P41 | **Phil "Scooter" Rizzuto Park** | 125-02 Atlantic Av | Wikipedia + Parks: **Richmond Hill** · PIP: **South Richmond Hill (QN0903)** · Parks ZIP: **11418 and 11419** |
| P22 | **Sikh Cultural Society** | 95-30 118th St *(unconfirmed)* | **No source at all** (F197–F200) · PIP on an unverified address: **South Richmond Hill** |
| P18 | **Ralph Bunche House** | 115-24 / 115-125 Grosvenor Rd | LPC + NRHP: **Kew Gardens** · PIP: **Kew Gardens** · **in CD 9** alongside RH landmarks. *No source claims it for Richmond Hill; listed to pre-empt a sweep-in.* |
| P57 | **Engine 285 / Ladder 142** | 103-17 98th St | Wikipedia: `"Richmond Hill contains"` · but 98th St lies **west of every boundary in §1** |
| P14 | **Richmond Hill Historic District** | 84th–85th Aves, 113th–118th Sts | NRHP: **Richmond Hill** · but nomination cover sheet gives ZIPs **`"11415, 11418"`**, and 11415 is **Kew Gardens** |
| P45 | **Liberty Avenue / "Little Guyana"** | Liberty Av, ~108th–135th Sts | An **8-mile, two-borough** street (F302). Only the **South Richmond Hill** portion is in play; **may not be claimed whole** |
| P55 | **1905 Carnegie library** | "on Lefferts Boulevard" | LP-2126: **Lefferts Blvd** · today's RH branch: **Hillside Av** · lineage **not established** |

---

## 15. RICHEST VEINS, RANKED

1. **The 2019 National Register nomination (refnum 100003430)** — 4,122 lines of professional primary research,
   retrieved in full. Covers the 1868 founding, the covenants (including the "social status" screening clause),
   the architects, the three building eras, block-by-block building descriptions, and the boundary reasoning.
   **Nothing else in this dossier comes close.**
2. **The three LPC designation reports** (LP-2126 Republican Club, LP-2317 P.S. 66, LP-2473 Eldridge House) —
   complete, primary, and each carries an independent neighborhood history that **conflicts productively** with the
   nomination and with Wikipedia.
3. **The Victorian housing stock itself** — the nomination names and describes a dozen individual addresses with
   architects and dates (P1–P12). This is unusually specific for any neighborhood in this corpus.
4. **Little Guyana / Little Punjab** — genuinely distinctive, corroborated by the NYT-via-nomination (F124), the
   MTA station sign (F251), the Liberty Avenue co-naming (F300), and the DOHMH cuisine distribution (F308–F309).
   **But thin on retrievable primary sources, and the Sikh Cultural Society is entirely unsourced (F197–F200).**
5. **Boundary contestation** — four sources give four materially different boundaries (§1). This is a *feature* for
   a page that wants to be honest about where Richmond Hill ends and Kew Gardens and Jamaica begin.
6. **The railroad layer** — the South Side Railroad's 1868 arrival, the two Clarenceville stations, the 1923–24
   "railroad on stilts" viaduct, the closed Richmond Hill station with one daily rider, the Morris Park Facility,
   and the abandoned Rockaway Beach Branch as the western edge.
7. **Jacob Riis** — the best-corroborated notable resident, with a church window, a church membership, a Theodore
   Roosevelt visit, and a contributing park site all pointing the same way.

---

## 16. THINGS THE VERIFIER SHOULD CHECK FIRST

1. **F4** — the three non-digitized NRHP nominations. If the verifier can reach NYS CRIS
   (`cris.parks.ny.gov`), the Resurrection, P.S. 66 and Labre nominations may be there. I could not search for it.
2. **F197–F200** — the Sikh Cultural Society. **The single largest gap.** A neighborhood the NYT calls a place to
   `"worship at a Sikh temple"` and that Wikipedia says has `"the largest Sikh population in the city"` has **no
   sourced gurdwara** in this dossier.
3. **F205 / §6.1** — the Church of the Resurrection. Seven sources, and the NRHP's own city field names both
   neighborhoods.
4. **F300** — the May 29, 2021 Liberty Avenue co-naming date is **Wikipedia-only**; a City Council local law or DOT
   record would settle it.
5. **F159 / F312** — do not repeat LP-2126's 2002 `"Vacant since the mid 1980s"` about the Republican Club.
6. **F324** — RKO Keith's is **State Register only, not National Register.** An NRHP dataset check will wrongly
   appear to refute it.
7. **F388** — Anaïs Nin's dates in the Wikipedia residents list are internally impossible.
8. **F10 / F379** — the Richmond Hill Historical Society's website is not an independent source; the organisation
   itself is well corroborated (F378).
9. **F13** — no health, education, income or crime statistic above is Richmond-Hill-only.
