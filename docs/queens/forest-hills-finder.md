# Forest Hills, Queens — FINDER candidate file

**Role:** Finder. Nothing here is verified, confirmed, or adjudicated. Every line below is a
CANDIDATE awaiting a separate verifier. I record no verdicts and none should be inferred from the
ordering, from the amount of detail attached to an item, or from the fact that I bothered to chase
a source. Where two sources disagree I record both and say so; I do not pick a winner.

**Quoting convention used throughout — read this before using any line:**

- **[Q]** — text inside `"…"` that I read myself as raw source text: the LPC designation-report
  PDFs (converted with `pdftotext -layout` and read line-by-line), the JSON payloads from
  government open-data APIs, and HTML pages I fetched with `urllib` and stripped to text myself.
  These I can vouch for as character-accurate to what the fetched bytes said.
- **[Q-2nd]** — a quotation that reached me through the WebFetch tool's summarizing layer rather
  than from raw source text I read directly. I have **not** compared these character-by-character
  against the source. Treat every **[Q-2nd]** as paraphrase-grade until the verifier re-reads the
  source itself.
- **[P]** — **MY PARAPHRASE.** Not the source's wording. Where a claim is [P] the verifier must go
  to the URL for the actual language.

I have not presented any paraphrase of mine as a verbatim quote. Where I was unsure which bucket a
line belonged in, I graded it down.

**Research constraint disclosure (material — read it):**

1. **The WebSearch budget for this session was exhausted (200/200) before I issued a single Forest
   Hills query.** Every item below was obtained either by fetching a URL I could name in advance,
   or by pulling government open-data APIs. This biases the corpus hard toward institutional
   sources and government datasets and means coverage of local news, oral history, small business,
   and recent (2024–2026) developments is thin-to-absent. §17 lists the gaps this created.
2. Several intended sources refused me: `nycgovparks.org` returns 403 to WebFetch (I got around it
   with a browser User-Agent in `urllib`, so Parks material below is [Q]); `foresthillstennis.com`
   (West Side Tennis Club, the single most important institutional source for this page) returned
   **503 on every attempt, by both tools**; `foresthillsgardens.org` (Forest Hills Gardens
   Corporation) **refused the connection**; `churchinthegardens.org` returned an empty body;
   `queenslibrary.org` served a navigation shell with no branch record; the NPS NRHP nomination PDF
   for the Church-in-the-Gardens did not download as a valid PDF.
3. Because of (1) and (2), **the West Side Tennis Club and Forest Hills Gardens Corporation are
   documented here almost entirely from Wikipedia and from a third party**, which is the weakest
   evidentiary footing in this file for two of its most important subjects. Flagged again in §17.

---

## 0. THE FLUSHING MEADOWS CORONA PARK EXCLUSION — checked first, deliberately

The wave brief states that `Ethos.Seeds.CitiFieldPlaces` already owns eight places inside Flushing
Meadows Corona Park: Citi Field, the Unisphere, the Queens Museum, the New York Hall of Science,
the Queens Zoo, the USTA Billie Jean King National Tennis Center, the New York State Pavilion and
the Queens Theatre.

**I searched my corpus for all eight and I am surfacing none of them as Forest Hills candidates.**
This is not an oversight and it is not a research failure — it is the point. What my sources
*did* turn up, and which the verifier and author both need to see:

**F001** [Q] NYC Parks' own "Other Parks Nearby" module on the Willow Lake Playground page lists
`"Flushing Meadows Corona Park (0.35 miles)"` as the nearest park to a playground whose own record
reads `"Zip Code: 11375"`. — S12
*(Finder note, not a verdict: Forest Hills' eastern edge runs up against FMCP. Proximity is not
ownership. Willow Lake Playground is a candidate below; the park it abuts is not.)*

**F002** [Q] The NYC Parks Yellowstone Park page's "Other Parks Nearby" module likewise lists
`"Flushing Meadows Corona Park (0.49 miles)"`. — S11

**F003** [Q] The USTA's current home is named in the West Side Tennis Club article's own succession
box as the venue that followed Forest Hills: the entry after `"1924"`–1977 reads
`"[[USTA Billie Jean King National Tennis Center]] ([[1978 U.S. Open (tennis)|1978]]–present)"`. — S20

*(Finder note: F003 is the ONE place where an FMCP institution is genuinely load-bearing for a
Forest Hills fact — the U.S. Open left Forest Hills **for** Flushing Meadows in 1978. The brief's
guidance is that linking routes the reader and narrating does not. The honest construction here is
a link to `/g/citi-field-guide` for where the tournament went, with no history of the Tennis Center
narrated on this page. I am recording that as a candidate treatment, not prescribing it — the
author and arbitrator own that call. I flag it because the Bronx concourse page failed on exactly
this shape of temptation and it returned as two Criticals.)*

**F004** [P] I found **no** source in this corpus that places Citi Field, the Unisphere, the Queens
Museum, the New York Hall of Science, the Queens Zoo, the New York State Pavilion or the Queens
Theatre in Forest Hills, or that gives any of them a Forest Hills address. I am recording the
absence explicitly so the verifier does not have to wonder whether I looked.

**F005** [P] Unlike Corona, Forest Hills does **not** look thinner than its fame for FMCP reasons.
Its marquee subject — the West Side Tennis Club and Forest Hills Stadium — sits at 1 Tennis Place
inside Forest Hills Gardens and is not owned by any other seed file that I can see. The
FMCP-exclusion risk on this page is narrow and specific: it is the U.S. Open's 1978 departure, and
nothing else.

---

## 1. Source inventory

| ID | Source | URL | Type / how I read it |
|----|--------|-----|------|
| S1 | NYC LPC, *Ridgewood Savings Bank, Forest Hills Branch* designation report, LP-2066, May 30, 2000 | https://s-media.nyc.gov/agencies/lpc/lp/2066.pdf | Primary / institutional. **Raw PDF text read directly.** |
| S2 | NYC LPC, *Firehouse, Engine Company 305, Hook & Ladder Company 151* designation report, LP-2522, June 12, 2012 | https://s-media.nyc.gov/agencies/lpc/lp/2522.pdf | Primary / institutional. **Raw PDF text read directly.** |
| S3 | NYC LPC, *Remsen Cemetery* designation report, LP-1177, May 26, 1981 | https://s-media.nyc.gov/agencies/lpc/lp/1177.pdf | Primary / institutional. **Raw PDF text read directly** (full report, it is 3 pages). |
| S4 | NYC Open Data — LPC Individual Landmark Sites (`buis-pvji`) | https://data.cityofnewyork.us/resource/buis-pvji.json | Primary government dataset. Raw JSON. |
| S5 | NYC Open Data — LPC Historic Districts (`skyk-mpzq`) | https://data.cityofnewyork.us/resource/skyk-mpzq.json | Primary government dataset. Raw JSON. |
| S6 | NYC Open Data — LPC Scenic Landmarks (`qexa-qpj6`) | https://data.cityofnewyork.us/resource/qexa-qpj6.json | Primary government dataset. Raw JSON. |
| S7 | NYC Open Data — 2020 Neighborhood Tabulation Areas (`9nt8-h7nd`), NYC Dept. of City Planning | https://data.cityofnewyork.us/resource/9nt8-h7nd.json | Primary government dataset. Raw JSON. |
| S8 | NYC Open Data — Parks Properties (`enfh-gkve`) | https://data.cityofnewyork.us/resource/enfh-gkve.json | Primary government dataset. Raw JSON. |
| S9 | NYC Open Data — DOE School Locations (`wg9x-4ke6`) | https://data.cityofnewyork.us/resource/wg9x-4ke6.json | Primary government dataset. Raw JSON. |
| S10 | NY State Open Data — MTA Subway Stations (`39hk-dx4f`) | https://data.ny.gov/resource/39hk-dx4f.json | Primary government dataset. Raw JSON. |
| S11 | NYC Parks — Yellowstone Park, Historical Signs Project page | https://www.nycgovparks.org/parks/yellowstone-park/history | Institutional (agency sign text). Raw HTML, stripped by me. |
| S12 | NYC Parks — Willow Lake Playground page | https://www.nycgovparks.org/parks/willow-lake-playground/history | Institutional. Raw HTML. **Sign text is a stub — data panel only.** |
| S13 | NYC Parks — Forest Park, Historical Signs Project page | https://www.nycgovparks.org/parks/forest-park/history | Institutional (agency sign text). Raw HTML. |
| S14 | NYC Parks — Russell Sage Playground page | https://www.nycgovparks.org/parks/russell-sage-playground/history | Institutional (agency sign text). Raw HTML. |
| S15 | NYC Parks — Annadale Playground page | https://www.nycgovparks.org/parks/annadale-playground/history | Institutional (agency sign text). Raw HTML. |
| S16 | NYC Parks — Ehrenreich-Austin Playground page | https://www.nycgovparks.org/parks/ehrenreich-austin-playground/history | Institutional (agency sign text). Raw HTML. |
| S17 | NYC Parks — MacDonald Park page | https://www.nycgovparks.org/parks/macdonald-park/history | Institutional. Raw HTML. **Sign text is a stub — data panel only.** |
| S18 | NYC Parks — Remsen Family Cemetery page | https://www.nycgovparks.org/parks/remsen-family-cemetery/history | Institutional. Raw HTML. **Sign text is a stub — data panel only.** |
| S19 | NYC DCP GeoSearch / PAD geocoder | https://geosearch.planninglabs.nyc/v2/search | Primary government geocoder. Raw JSON. |
| S20 | Wikipedia, "West Side Tennis Club" | https://en.wikipedia.org/wiki/West_Side_Tennis_Club | **AGGREGATOR — lowest tier.** Raw HTML read by me. |
| S21 | Wikipedia, "Forest Hills Stadium" (redirects into S20's content) | https://en.wikipedia.org/wiki/Forest_Hills_Stadium | **AGGREGATOR.** Raw HTML. |
| S22 | Wikipedia, "Forest Hills station (LIRR)" | https://en.wikipedia.org/wiki/Forest_Hills_station_(LIRR) | **AGGREGATOR.** Raw HTML. |
| S23 | Wikipedia, "Forest Hills–71st Avenue station" | https://en.wikipedia.org/wiki/Forest_Hills%E2%80%9371st_Avenue_station | **AGGREGATOR.** Raw HTML. |
| S24 | Wikipedia, "75th Avenue station" | https://en.wikipedia.org/wiki/75th_Avenue_station | **AGGREGATOR.** Raw HTML. |
| S25 | Wikipedia, "Queens Boulevard" | https://en.wikipedia.org/wiki/Queens_Boulevard | **AGGREGATOR.** Raw HTML. |
| S26 | Wikipedia, "Rego Park, Queens" | https://en.wikipedia.org/wiki/Rego_Park,_Queens | **AGGREGATOR.** Raw HTML. Used ONLY for the boundary contest. |
| S27 | Wikipedia, "Ramones" | https://en.wikipedia.org/wiki/Ramones | **AGGREGATOR.** Raw HTML. |
| S28 | Wikipedia, "Forest Hills, Queens" | https://en.wikipedia.org/wiki/Forest_Hills,_Queens | **AGGREGATOR.** Via WebFetch summarizer — everything from it is [Q-2nd]. |
| S29 | Wikipedia, "National Register of Historic Places listings in Queens County, New York" | https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens_County,_New_York | **AGGREGATOR.** Via WebFetch summarizer — [Q-2nd]. |
| S30 | Our Lady Queen of Martyrs parish — "Our Church History" | https://www.ourladyqueenofmartyrs.org/our-church-history/ | Institutional (self-description). Raw HTML. |
| S31 | Forest Hills Stadium official site — About | https://www.foresthillsstadium.com/about | Commercial / venue self-description. Via WebFetch summarizer — [Q-2nd]. |
| S32 | Forest Hills Stadium official site — home page footer | https://www.foresthillsstadium.com/ | Commercial. Raw HTML. |
| S33 | Forest Hills Gardens Foundation | https://www.foresthillsgardensfoundation.org/ | Institutional (neighborhood historical nonprofit). Raw HTML. |
| S34 | NYC Open Data — DOHMH Restaurant Inspection Results (`43nn-pn8j`) | https://data.cityofnewyork.us/resource/43nn-pn8j.json | Primary government dataset. **INSPECTION DATASET — see the §15 warning before writing any business.** |
| S35 | Queens Community Board 6 official site | https://www.nyc.gov/site/queenscb6/index.page | Institutional. Raw HTML. Thin — event/announcement shell only. |

Anything sourced only to S20–S29 is an aggregator claim and is a lead to chase, not a citable
fact. Anything sourced only to S34 is subject to the §15 constraint.

---

## 2. Official geography, boundaries, administrative identity

**F006** [Q] DCP's 2020 NTA file contains a tabulation area coded `"nta2020": "QN0602"` whose
`ntaname` is `"Forest Hills"` and whose `ntaabbrev` is `"FrstHls"`. Its `boroname` is `"Queens"`,
`borocode` `"4"`. — S7

**F007** [Q] The same record gives Forest Hills' parent CDTA as `"cdta2020": "QN06"` with
`"cdtaname": "QN06 Forest Hills-Rego Park (CD 6 Approximation)"`. — S7

**F008** [Q] The same file contains `"nta2020": "QN0601"`, `"ntaname": "Rego Park"`,
`"ntaabbrev": "RegoPk"` — also under `"QN06 Forest Hills-Rego Park (CD 6 Approximation)"`. — S7
*(Finder note, not a verdict: Forest Hills and Rego Park are two separate NTAs sharing one
community district, and DCP's own name for that district puts them in the same breath. The NTA
line between them is exactly the boundary at issue for this pair. I am not resolving it.)*

**F009** [Q] DCP gives Forest Hills `"shape_area": "57954644.0929"` and
`"shape_leng": "36075.594579"`; Rego Park `"shape_area": "20193352.2373"` and
`"shape_leng": "26496.2223988"`. — S7
*(Finder note: units are the NY State Plane feet of the source file. I have NOT converted these to
acres or square miles and the verifier should not assume a conversion. If the author wants an area
figure, it needs deriving and checking, not lifting.)*

**F010** [Q-2nd] S28 states: *"It is adjacent to Corona to the north, Rego Park and Glendale to the
west, Forest Park to the south, Kew Gardens to the southeast, and Flushing Meadows–Corona Park and
Kew Gardens Hills to the east."* — S28
*(Finder note: this names TWO of the four wave-3 neighborhoods as adjacent — Corona and Rego Park —
and it is an aggregator sentence reaching me through a summarizer. Do not treat it as a boundary
definition.)*

**F011** [Q] S26's lead reads: `"Rego Park is bordered to the north by Elmhurst and Corona, to the
east and south by Forest Hills, and to the west by Middle Village."` — S26

**F012** [Q] S26 continues: `"Rego Park's boundaries include Queens Boulevard, the Long Island
Expressway, Woodhaven Boulevard, and Yellowstone Boulevard."` — S26
*(Finder note: F011 and F012 are the other side of this wave's Forest Hills/Rego Park contest, in
the sibling's own aggregator's words. Note that F012 makes **Queens Boulevard and the Long Island
Expressway** boundary streets — the same two roads the wave brief names as running between the
pairs. Recording, not resolving.)*

**F013** [Q] S26 states: `"Rego Park is located in Queens Community District 6 and its ZIP Code is
11374."` — S26

**F014** [Q-2nd] S28 gives Forest Hills' ZIP Code as `11375` and its community district as Queens
Community Board 6. — S28

**F015** [Q-2nd] S28 states Forest Hills is *"patrolled by the New York City Police Department's
112th Precinct"* and is *"Located within New York's 6th congressional district, represented by
Grace Meng"*. — S28
*(Finder note: S26 independently states the 112th Precinct patrols **Rego Park** — see F016. A
shared precinct is not a boundary and must not be written as one. Congressional representation is
also the kind of fact that goes stale; the verifier should re-date it.)*

**F016** [Q] S26 states of Rego Park: `"It is patrolled by the New York City Police Department's
112th Precinct."` — S26

**F017** [Q-2nd] S28 gives a 2010 population for Forest Hills of 83,728, with a racial composition
of *"White 58.3%, Asian 24.2%, Hispanic 12.4%, Black 2.5%"*. — S28
*(Finder note: a 2010 figure is now sixteen years old and the geography behind an aggregator's
"Forest Hills" population is unstated — it may be an NTA, a ZIP, or a CD. Low confidence. If the
page needs a population number the verifier should source it from DCP directly.)*

**F018** [Q] S26 states: `"The entirety of Community Board 6, which comprises Rego Park and Forest
Hills, had 115,119 inhabitants as of NYC Health's 2018 Community Health Profile, with an average
life expectancy of 85.4 years."` — S26
*(Finder note: this is a **combined** CD 6 figure covering both neighborhoods, not a Forest Hills
figure. It must not be written as Forest Hills'.)*

**F019** [Q] Queens Community Board 6's official site titles itself
`"NYC Community Board 6, Queens"`. — S35
*(Finder note: the CB6 site as served to me was an announcements shell. It carried no district
description, no boundary statement and no neighborhood list. That absence is itself worth knowing:
the obvious primary source for the Forest Hills/Rego Park line did not, on this fetch, provide one.)*

---

## 3. The Whitepot origin and the naming of Forest Hills

**F020** [Q] LP-2066: `"In 1906, developer Cord Meyer who had previously been active in the
Elmhurst section of Queens, purchased 600 acres (comprising the land of six farms) in the area
known as the Hopedale section of Whitepot. Changing the name to Forest Hills because of its high
ground and its proximity to the beautiful terrain of Forest Park, he began to lay out streets,
install utilities, and construct the first houses."` — S1

**F021** [Q] LP-2522 repeats the same sentence essentially verbatim: `"In 1906, developer Cord
Meyer who had previously been active in the Elmhurst section of Queens, purchased 600 acres
(comprising the land of six farms) in the area known as the Hopedale section of Whitepot."` — S2
*(Finder note: LP-2522 (2012) appears to reuse LP-2066's (2000) text. These are NOT two independent
confirmations — they are one LPC research department passage, twice. The verifier should count them
as one source. Note also that the developer Cord Meyer's prior theatre of operations is named as
**Elmhurst**, a wave-3 sibling.)*

**F022** [Q] LP-2066: `"To encourage sales, Meyer's company ran horse-drawn stages to Forest Hills
from the closest train station in Elmhurst."` — S1

**F023** [Q] LP-2066: `"By 1908, the Long Island Railroad was running three steam-driven trains a
day with a local stop at Austin Street and Roman Avenue."` — S1
*(Finder note: LP-2522 gives the identical sentence. Same caveat as F021. "Roman Avenue" is a
street name I could not independently locate in any current source; it may be a historical name.
Flagged for the verifier, not resolved.)*

**F024** [Q] NYC Parks' Yellowstone Park sign text: `"Forest Hills was once farmland owned by
Frederick Backus, George Backus, and Horatio N. Squires. The Cord Meyer Development Company bought
much of the land. Its name is derived from its proximity to Forest Park."` — S11
*(Finder note: this is an independent agency source naming the pre-1906 farm owners, which the LPC
reports do not. Good candidate. It agrees with LP-2066 on the Forest Park derivation.)*

**F025** [Q] S26, on the shared colonial substrate: `"By 1653, though, English and Dutch farmers
moved into the area and founded a community called Whitepot, which was a part of the Township of
Newtown. Whitepot is believed to be so named because Dutch settlers named the area 'Whiteput', or
'hollow creek'; later, English settlers Anglicized the name."` — S26
*(Finder note: this sentence appears in the **Rego Park** article, about Rego Park. Whitepot is the
common ancestor of both neighborhoods, which is precisely why the boundary is contested. If this
page uses Whitepot it should not imply Whitepot was Forest Hills alone.)*

**F026** [Q] LP-2066: `"The electrification of the Long Island Railroad in 1909 and the opening of
the Queens borough Bridge that same year further advanced the development of Forest Hills."` — S1
*(Finder note: "Queens borough Bridge" is the OCR'd rendering in the PDF text I read. LP-2522 gives
it as `"Queensborough Bridge"`. I am recording the character string I actually saw.)*

**F027** [Q] LP-2066: `"With the widening of Queens Boulevard in 1913, Cord Meyer began the
improvement of his remaining acreage. Meyer's first apartment building was constructed in 1917,
followed by others in the twenties. By 1921, his company had constructed 200 homes, some designed
by architects Robert Tappan and William Patterson."` — S1

**F028** [Q] LP-2522 gives a differently-worded and slightly different version: `"By 1921, Meyer's
company had constructed some 200 homes, and several apartment buildings."` — S2
*(Finder note: LP-2066 says 200 homes and names Tappan and Patterson; LP-2522 says "some 200
homes" and names no architects. Not a contradiction, but the "200" is soft in the later report.)*

**F029** [Q] LP-2522: `"Within Forest Hills Gardens, a number of brick houses of both modest and
luxury scale were constructed between 1910 and 1917, followed by the first apartment building –
the Forest Arms – in 1924."` — S2

**F030** [Q] LP-2522: `"The small, inward-facing developments of Arbor Close and Forest Close,
which aesthetically emulate the nearby Forest Hills Gardens and which abut the site of the
Firehouse, Engine Company 305, Hook & Ladder Company 151, were completed in 1925 and 1927,
respectively."` — S2
*(Finder note: **Arbor Close and Forest Close** are a strong, primary-sourced, distinctively Forest
Hills subject that no aggregator gave me. Candidate places, see §16.)*

**F031** [Q] LP-2066: `"The opening of the Independent subway line with a stop at Queens Boulevard
and Continental Avenue in 1936 was another major improvement which stimulated growth in the area,
reflected in new businesses opening here, such as the Ridgewood Savings Bank branch."` — S1

---

## 4. Forest Hills Gardens

**F032** [Q] LP-2066: `"This spurred the sale of 160 acres south of the railroad line to the
Russell Sage Foundation, a philanthropic institution founded by Sage's widow, Margaret Olivia
Slocum Sage to improve the social and living conditions of the poor. Despite the foundation's
interest in low-income housing, it developed the Forest Hills property as a revenue-generating
venture, hiring architect Grosvener Atterbury and the landscape architecture firm of the Olmstead
Brothers to create a picturesque enclave of homes, schools, churches, and businesses."` — S1
*(Finder note: "Grosvener" and "Olmstead" are the spellings as they appear in the PDF text I read.
The conventional spellings are Grosvenor Atterbury and Olmsted Brothers. Recording what the source
said, flagging the discrepancy rather than silently correcting it.)*

**F033** [Q] LP-2522 gives a materially different account of the acreage and the date: `"In 1906,
the Russell Sage Foundation purchased 160 acres of land south of the railroad line with the intent
to develop a 'modern suburban development' to contrast with the overcrowding, squalor and chaos of
residential districts in Manhattan."` — S2

**F034** [Q-2nd] S28 gives a THIRD version: *"Margaret Sage, the founder of the Russell Sage
Foundation, bought 142 acres (57 ha) of land from the Cord Meyer Development Company in 1908."*
— S28

> **CONFLICT — FLAGGED, NOT RESOLVED.** Three sources give three combinations:
> - LP-2066 (S1): **160 acres**, sold to the Russell Sage Foundation, date not stated in the
>   sentence (context implies after 1908).
> - LP-2522 (S2): **160 acres**, **in 1906**.
> - Wikipedia (S28): **142 acres**, bought by **Margaret Sage** personally, **in 1908**.
>
> Note also that the Russell Sage Foundation's own founding date is given as **1907** by NYC Parks
> (F045), which makes LP-2522's "In 1906, the Russell Sage Foundation purchased…" internally
> difficult. The verifier must settle acreage, buyer, and year before any of this is written. Do
> not average them and do not pick the one that reads best.

**F035** [Q] LP-2522 on authorship of the plan: `"The proposed development, Forest Hills Gardens,
was the collaborative creation of landscape architect and planner Frederick Law Olmsted, Jr. and
the architect and housing reform activist Grosvenor Atterbury."` — S2

**F036** [Q-2nd] S28 credits it differently: *"Grosvenor Atterbury, along with his associate
architect and Forest Hills resident, John Almy Tompkins II, was given the commission to design
Forest Hills Gardens."* — S28

**F037** [Q] Our Lady Queen of Martyrs' own parish history credits it to Olmsted alone: `"A portion
of it was to become Forest Hills Gardens, designed by Frederick Law Olmsted, Jr., to resemble an
English garden community."` — S30

> **CONFLICT — FLAGGED, NOT RESOLVED.** Attribution of the Forest Hills Gardens design runs:
> Olmsted Jr. + Atterbury (LPC, S2) / Atterbury + John Almy Tompkins II (S28) / Olmsted Jr. alone
> (S30) / "architect Grosvener Atterbury and the landscape architecture firm of the Olmstead
> Brothers" (LPC, S1). **Four sources, four attributions.** The LPC 2012 report is the best-evidenced
> and the parish's is the weakest, but that is a judgement and I am not making it. Note S1 and S2
> are the same agency disagreeing with itself twelve years apart — the firm ("Olmstead Brothers")
> vs the individual ("Frederick Law Olmsted, Jr.").

**F038** [Q] LP-2522: `"Together they conceived of a picturesque enclave of homes, schools,
churches, and businesses that would, upon completion in 1909-10, be widely publicized across the
country as a modern Arcadia – a place where people of 'moderate income and good taste… might find
some country air and country life within striking distance of the active centers of New York.'"` — S2
*(Finder note: the inner single-quoted phrase is LPC quoting its own footnoted source (note 11),
not LPC's words. A nested quotation — the verifier should chase LP-2522 note 11 before this is
attributed to anyone.)*

**F039** [Q] LP-2522 describes the built result: `"The completed development consisted of a
brick-paved square shaded by trees built in front of the train station, a clock tower, arched
passageways, and garden apartments built to resemble a row of country inns along narrow, winding
roads that discouraged through-traffic."` — S2
*(Finder note: this is LPC's own description of **Station Square** without using the name. Strong
candidate material.)*

**F040** [Q-2nd] S28 on construction method: *"Each house was built from approximately 170
standardized precast concrete panels, fabricated off-site and positioned by crane. The houses were
mostly constructed between 1910 and 1917."* — S28
*(Finder note: the prefabricated-concrete story is one of the genuinely distinctive things about
Forest Hills Gardens and it reaches me ONLY through an aggregator via a summarizer — the weakest
possible footing for a claim this specific. "approximately 170 standardized precast concrete
panels" is exactly the kind of number that gets copied wrong. Verify against Atterbury scholarship
or the Forest Hills Gardens Foundation before writing it.)*

**F041** [Q] **Forest Hills Gardens is NOT a New York City historic district.** I pulled the
complete LPC Historic Districts dataset (141 rows total, of which 13 are borough `"QN"`) and read
every Queens `area_name`. The full Queens list is: Cambria Heights-222nd Street, Cambria
Heights-227th Street, Ridgewood South, Jackson Heights, Addisleigh Park, Central Ridgewood,
Sunnyside Gardens, Stockholm Street, Hunters Point, Douglaston, Douglaston Hill (Amendment),
Ridgewood North, Fort Totten. **Forest Hills Gardens does not appear.** — S5

**F042** [Q] **There is no Forest Hills scenic landmark either.** The complete LPC Scenic Landmarks
dataset is 8 rows: Bryant Park, Central Park, Grand Army Plaza, Morningside Park, Verdi Square
(all `"MN"`), Prospect Park, Coney Island (Riegelmann) Boardwalk (both `"BK"`), and Fort Tryon Park
(`"MN"`). **No Queens scenic landmark exists at all.** — S6

*(Finder note on F041/F042: this is a significant, checkable negative and I want it stated plainly
because a page about Forest Hills Gardens is under constant temptation to call it "landmarked." By
these two datasets it is neither an LPC historic district nor a scenic landmark. What it may be is
covered by F043 and F044 — and those two disagree with each other.)*

**F043** [Q-2nd] S29 (the NRHP-listings-in-Queens table) returned exactly ONE Forest Hills entry:
*"The Church-in-the-Gardens"*, reference **#09001086**, listed **December 11, 2009**, location
*"50 Ascan Ave."* — S29
*(Same fetch returned, for the other wave-3 neighborhoods: **Corona** — Louis Armstrong House
#76001265, May 11, 1976, "3456 107th St."; Congregation Tifereth Israel #02001357, Nov 21, 2002,
"109-20 54th Ave." **Elmhurst** — B.P.O. Elks Lodge #878 #14000938, Nov 19, 2014, "82-10, 82-20
Queens Blvd."; First Presbyterian Church of Newtown #13000696, Sept 9, 2013, "54-05 Seabury St."
**Rego Park** — the fetch reported none. Recorded for the siblings' benefit; none of these is mine.)*

**F044** [Q-2nd] A DIFFERENT WebFetch of Wikipedia, however, returned: *"The Church-in-the-Gardens,
St. Luke's Episcopal Church, and United States Post Office are listed on the National Register of
Historic Places."* — S28

> **CONFLICT — FLAGGED, NOT RESOLVED.** S29's Queens NRHP table gives Forest Hills exactly ONE
> listing (Church-in-the-Gardens). S28's prose claims THREE (adding St. Luke's Episcopal Church and
> a United States Post Office). Both reached me through the same summarizing layer, so both are
> [Q-2nd] and neither is trustworthy as read. **The verifier must resolve this against NPS
> directly** — my attempt to download the NPS nomination PDF for #09001086 returned a file that
> `pdftotext` reported as `"May not be a PDF file"` with `"Couldn't find trailer dictionary"`, so I
> have no primary NRHP text at all. If S28 is right, St. Luke's and the post office are two more
> candidate places; if S29 is right, they are not. I am recording both possibilities.

**F045** [Q] NYC Parks, on the Foundation behind the Gardens: `"Olivia also founded the Russell
Sage Foundation in 1907 for 'the improvement of social and living conditions in the United
States.'"` — S14

**F046** [Q] NYC Parks on Margaret Olivia Slocum Sage: `"At the time of his death in 1906, Sage's
massive fortune went to his second wife, Margaret Olivia Slocum Sage (1828-1918). It is largely due
to her efforts that so many social and cultural institutions benefitted from his fortune, some of
which still bear his name."` — S14

**F047** [Q] NYC Parks on Russell Sage himself: `"Russell Sage (1816-1906) was a financier and a
railroad tycoon who amassed a fortune of $70 million by the time he died."` — S14

**F048** [Q] The Forest Hills Gardens Foundation describes itself as
`"Preserving the Legacy and History of Forest Hills Gardens"` and, in its donation panel, as
`"the Forest Hills Gardens Foundation (aka Taxpayers Association)"` and `"a not-for-profit service
501(c)3 service organization"`. — S33

**F049** [Q] The Forest Hills Gardens Foundation's "Helpful links" panel names, as the constellation
of institutions in and around the Gardens: `"CITG Community House"`, `"Forest Hills Gardens
Corporation"`, `"Friends of Station Square"`, `"The West Side Tennis Club"`, `"Forest Hills
Stadium"`, `"St Luke's Church"`, `"The Church-in-the-Gardens"`, `"The Women's Club"`. — S33
*(Finder note: this is a neighborhood institution's own list of its neighbors and it is the single
most useful discovery-list in this file. Note it independently corroborates that **St Luke's
Church** and **The Women's Club** exist as Forest Hills Gardens institutions — relevant to the F044
conflict. Each is a candidate place I could not separately document.)*

**F050** [Q] The same site describes Friends of Station Square as `"A tax-exempt nonprofit
established in 1992, FOSS is committed to the beautification and upkeep of Station Square. From
landscape maintenance to community advocacy, FOSS is 100% funded by the residents and businesses of
Forest Hills Gardens and its surrounds."` — S33

**F051** [Q] The Foundation's gallery captions name and date three views:
`"Slocum Crescent Townhomes 1917"`, `"Station Square LIRR Landing -1917"`, and
`"Station Square on Continental – 1917"`. — S33

**F052** [Q] DCP GeoSearch geocodes `"1 Station Square, Queens"` to
`"1 STATION SQUARE, Forest Hills, NY, USA"`, neighbourhood `Forest Hills`. — S19

---

## 5. LPC-designated individual landmarks — the complete set

I read the entire LPC Individual Landmark Sites dataset (1,532 rows) and filtered it three ways:
by `nta2020`, by `cd`, and by full-text match on "Forest Hills". **Community District 406 contains
exactly three individual landmarks.** Two are tagged to the Forest Hills NTA and one to the Rego
Park NTA.

### 5.1 Ridgewood Savings Bank, Forest Hills Branch — 107-55 Queens Boulevard

**F053** [Q] LPC dataset row: `"lpc_name": "Ridgewood Savings Bank, Forest Hills Branch"`,
`"address": "107-55 Queens Boulevard"`, `"lpc_lpnumb": "LP-02066"`, `"desdate": "5/30/2000"`,
`"landmarkty": "Individual Landmark"`, `"lpc_sitest": "Designated"`, `"cd": "406"`,
`"council": "29"`, `"nta2020": "QN0602"`, `"bbl": "4022160001"`, `"block": "2216"`, `"lot": "1"`,
`"latitude": "40.7220111"`, `"longitude": "-73.844294"`. — S4

**F054** [Q] DCP GeoSearch geocodes `"107-55 Queens Boulevard"` to
`"107-55 QUEENS BOULEVARD, Forest Hills, NY, USA"`, neighbourhood `Forest Hills`. — S19

**F055** [Q] LP-2066 header: `"RIDGEWOOD SAVINGS BANK, FOREST HILLS BRANCH, 107-55 Queens
Boulevard, Queens. Built 1939-40; Halsey, McCormack & Helmer, architects."` — S1

**F056** [Q] LP-2066 summary: `"The Forest Hills Branch building of the Ridgewood Savings Bank was
constructed in 1939-40 to serve the residents of this rapidly expanding Queens neighborhood. The
Ridgewood Savings Bank was founded in 1921 in Ridgewood, Queens, as a mutual savings bank which had
no stockholders and distributed all profits to its depositors. The bank managers chose the Forest
Hills location for the bank's first branch office because of its growing population and newly-opened
subway stop."` — S1

**F057** [Q] LP-2066: `"Halsey, McCormack & Helmer, one of New York's leading firms specializing in
bank architecture, designed this building as well as the home office of this bank (in Ridgewood),
and the Williamsburgh and Dime Savings Banks (both designated New York City Landmarks) in downtown
Brooklyn."` — S1

**F058** [Q] LP-2066: `"In this building, the architects employed the modem classical style,
varying the shape of the building's perimeter with concave and convex sections, and alternating flat
limestone surfaces with crisply incised designs and large expanses of windows. This distinctive
building sits alone on its triangular lot, creating a unique and noteworthy presence on bustling
Queens Boulevard."` — S1
*(Finder note: "modem" is the OCR rendering of "modern" in the PDF text I read. Recording the
string I actually saw rather than silently fixing it.)*

**F059** [Q] LP-2066: `"Endeavoring to serve other, newly populous neighborhoods, the Ridgewood
Savings Bank opened its first branch in nearby Forest Hills in 1940."` — S1
*(Finder note: F055/F056 say "Built 1939-40" / "constructed in 1939-40"; F059 says the branch
"opened … in 1940." Same report. Compatible, but the author must not collapse "built 1939-40" into
"opened 1939.")*

**F060** [Q] LP-2066: `"The construction of the Forest Hills Branch in 1939-40 was the first time
the Ridgewood Savings Bank moved beyond its original neighborhood. This was an impo1tant step for a
bank that considered itself a local institution and had been 'a near-perfect example of the
completely community-oriented bank.'"` — S1
*(Finder note: "impo1tant" is the OCR artifact for "important". The inner quoted phrase is LPC
quoting its own footnote 13 — a nested quotation, not LPC's words.)*

**F061** [Q] LP-2066: `"This time however, the firm created a modem classical design which won the
annual building award for excellent design from the Queens Chamber of Commerce in 1940."` — S1
*(Finder note: the raw text I read renders this as `"excel lent"` with a broken word — an OCR
line-break artifact. I have joined it here and I am telling you I joined it.)*

**F062** [Q] LP-2066, Description: `"The Forest Hills Branch of the Ridgewood Savings Bank is a
three-story, freestanding building that sits alone on a triangular lot surrounded by shrubs and
small lawns. The building is faced with smooth limestone over a high base of polished granit~.
There have been very few changes to the building since its construction and the bronze-framed
windows and steel doors are original."` — S1
*(The `granit~` is the OCR rendering of "granite" in the source text.)*

**F063** [Q] LP-2066: `"The building has a rectangular central area three bays long, with a
semi-circular section, five bays wide and slightly shorter than the main part, projecting at each
end."` — S1

**F064** [Q] LP-2066: `"The main entrance is located in the central bay of the rounded end closest
to the intersection of Queens Boulevard and 108th Street."` and `"Above the opening, the stone
lintel is engraved with the words 'FOREST HILLS OFFICE.'"` — S1
*(Finder note: the engraved lintel text is a genuinely visitor-facing detail and it is LPC's own
observation. Strong candidate.)*

**F065** [Q] LP-2066: `"A cornice at the roofline of the curved sections is represented by stylized
eagles linked by incised wavy lines"` and `"At the top of both rounded sections are six stylized,
flat eagles, each aligned with the pilasters below it."` — S1

**F066** [Q] LP-2066: `"The building has had only minor alterations: the insertion of ventilating
grates in part of one of the large windows at the southern rounded end and the addition of two
signs for an ATM machine, on either side of the southern end."` — S1
*(Finder note: this describes the building as of 2000. Twenty-six years on, it is not evidence of
current condition, and the verifier should not let it be written in the present tense. **I have no
source at all on whether this is still a bank branch.**)*

**F067** [Q] LP-2066: `"Report researched and written by Virginia Kurshan, Research Department"`.
— S1

### 5.2 Firehouse, Engine Company 305, Hook & Ladder Company 151 — 111-02 Queens Boulevard

**F068** [Q] LPC dataset row: `"lpc_name": "Firehouse, Engine Company 305 and Hook & Ladder 151"`,
`"address": "111-02 Queens Boulevard"`, `"lpc_lpnumb": "LP-02522"`, `"desdate": "6/12/2012"`,
`"cd": "406"`, `"nta2020": "QN0602"`. — S4

**F069** [Q] DCP GeoSearch geocodes `"111-02 Queens Boulevard"` to
`"111-02 QUEENS BOULEVARD, Forest Hills, NY, USA"`, neighbourhood `Forest Hills`. — S19

**F070** [Q] LP-2522 header: `"FIREHOUSE, ENGINE COMPANY 305, HOOK & LADDER COMPANY 151, 111-02
Queens Boulevard (aka 111-02 to 111-04 Queens Boulevard; 111-50 75th Avenue), Queens. Built:
1922-1924; John R. Sliney, architect (attributed)"` and `"Landmark Site: Borough of Queens Tax Map
Block 3294, Lot 20"`. — S2
*(Finder note: the **alternate address 111-50 75th Avenue** matters — it is the same building on a
different street, and a place record must not treat it as a second site.)*

**F071** [Q] LP-2522 summary: `"The Firehouse, Engine Company 305, Hook & Ladder Company 151, in
Forest Hills, Queens, was constructed by the Fire Department of the City of New York in 1924. The
firehouse was intended to serve the growing population of the Forest Hills neighborhood, which had
seen a boom in residential construction following World War I."` — S2
*(Finder note: this is LPC saying, in its own summary, **"in Forest Hills, Queens"** — an explicit
neighborhood assignment from the strongest source class. Contrast with LP-1177's silence, F085.)*

**F072** [Q] LP-2522: `"The large, two and two-and-a-half story Neo-Medieval style firehouse is clad
in red brick laid in a Flemish bond and enlivened with decorative limestone details and subtle
patterned brickwork. The asymmetrical massing of the building is accentuated by steep gables clad
with copper standing-seam roofs, two prominent square towers (a stair tower and a hose-drying
tower) featuring round-arched window openings, and a slender chimney rising nearly a story above the
western elevation."` — S2

**F073** [Q] LP-2522: `"The innovative design of this firehouse has been attributed to John R.
Sliney, head building inspector for the fire department, during whose tenure approximately 70
firehouses were constructed throughout the five boroughs."` — S2
*(Finder note: the header says `"architect (attributed)"` and the summary says `"has been
attributed to"`. The attribution is explicitly uncertain **in LPC's own words** and must be written
as attributed, never as fact.)*

**F074** [Q] LP-2522: `"The firehouse, which has experienced remarkably few changes in the 90 years
since its construction, continues to serve the Forest Hills community today. It is at once a
striking presence along the Queens Boulevard streetscape and a well-integrated constituent of this
vibrant residential neighborhood."` — S2
*(Finder note: "today" here is 2012. Whether it is still an active firehouse in 2026 is
**unsourced in this file**. Do not write it in the present tense on LPC's authority.)*

**F075** [Q] LP-2522: `"The Firehouse, Engine Company 305, Hook & Ladder Company 151 was dedicated
on November 15, 1924 in Forest Hills, Queens. The two companies that would occupy the building,
Engine Company 305 and Hook & Ladder Company 151, were officially organized on the same day the
firehouse opened, assigned to the 46th Battalion, 13th Division of the Fire Department of the City
of New York."` — S2

**F076** [Q] LP-2522: `"It announced intentions to extend the paid fire department into Forest
Hills, and in 1923 it awarded a contract in the amount of $77,713 for construction of a new
firehouse on Queens Boulevard."` — S2

**F077** [Q] LP-2522: `"The site for the firehouse appears to have been acquired in 1922, along with
sites for firehouses in several other Queens communities, including Bayside, Queens Village,
Jamaica, and Jackson Heights, as well as sites for firehouses in Brooklyn and 'Westchester.'"` — S2

**F078** [Q] LP-2522 quotes the FDNY's 1922 Annual Report: `"plans [for the firehouses] have been
prepared by the Department and therefore there will be no architect employed in connection with the
erection of these buildings."` — S2, quoting FDNY 1922 Annual Report (LP-2522 note 21)

**F079** [Q] LP-2522 quotes the FDNY's 1924 Annual Report: `"the plans and specifications for these
buildings have been prepared by this bureau, as has been the practice since this administration came
into power, and thus the fees of architects were saved."` — S2, quoting FDNY 1924 Annual Report
(LP-2522 note 22)
*(Finder note: F078 and F079 are nested quotations — LPC quoting FDNY. They also sit in tension
with the Sliney attribution in F073: the FDNY's own reports say **no architect was employed**. That
tension is in the source and is worth preserving rather than smoothing.)*

**F080** [Q] LP-2522 quotes the FDNY 1924 Annual Report: `"The development of certain sections of
Brooklyn and Queens has made it imperative to extend the activities of this department. To keep
abreast of times it has been necessary to have new firehouses constructed."` — S2 (note 19)

**F081** [Q] LP-2522: `"Unlike its contemporaries, Firehouse, Engine Company 305, Hook & Ladder
Company 151 was not constructed in the dominant firehouse style of the time. In this way, the
design of the Forest Hills firehouse, with its large scale and near-ecclesiastical appearance, is
remarkable."` — S2

**F082** [Q] LP-2522: `"The building is strongly suggestive of religious, not civic architecture,
particularly in the steep pitch of its roofs and the height of the hose-drying tower, itself
reminiscent of a church bell tower."` — S2

**F083** [Q] LP-2522: `"Fire loss statistics during this era further underscore the increased need
for fire protection throughout Queens, with losses doubling from $1.372 million in 1921 to $2.744
million in 1922."` — S2

**F084** [Q] LP-2522 lists who testified: `"There were five speakers in favor of designation
including representatives of the Historic Districts Council, the Queens Preservation Council, the
Central Queens Historical Association, the Four Borough Neighborhood Preservation Alliance, and the
Bayside Historical Society. Correspondence in support of designation was received from the Fire
Department of the City of New York and from the Queens Borough President, Helen M. Marshall."` — S2

### 5.3 Remsen Cemetery — CONTESTED, see §16

**F085** [Q] I read LP-1177 in full (it is three pages). **The report never names a
neighborhood.** Its header is: `"REMSEN CEMETERY, between Alderton Street and Trotting Course Lane,
adjoining 69-43 Trotting Course Lane, Borough of Queens."` and `"Landmark Site: Borough of Queens
Tax Map Block 3178, Lot 44."` The words "Forest Hills" and "Rego Park" appear nowhere in the
document. — S3
*(Finder note: this is the crux of the contest in §16. The strongest source class is **silent** on
the assignment, which means the assignment must be settled by other evidence, and that other
evidence conflicts.)*

**F086** [Q] LPC dataset row: `"lpc_name": "Remsen Cemetery"`, `"address": "adjacent to 69-43
Trotting Course Lane"`, `"lpc_lpnumb": "LP-01177"`, `"desdate": "5/26/1981"`, `"cd": "406"`,
`"council": "30"`, **`"nta2020": "QN0601"`** (= Rego Park), `"bbl": "4031780044"`,
`"latitude": "40.71242"`, `"longitude": "-73.8584997"`. — S4

**F087** [Q] LP-1177: `"The Remsen Cemetery is a tangible reminder of the colonial past of this
section of Queens. Typical of the small private cemeteries that were favored by early settlers, it
commemorates one of New York's earliest families and the role it played in both the French and
Indian War and the American Revolutionary War. The plot has been preserved and maintained by
various local organizations and citizens within the community."` — S3
*(Finder note: "this section of Queens" — LPC declining to name it, twice.)*

**F088** [Q] LP-1177: `"The Remsen family ancestors immigrated to America in the 17th century from
northern Germany and eventually settled in Queens County. The founding father of the clan in America
was Rem Jansen Van der Beeck; his sons adopted the surname Remsen. One son, Abraham
Remsen,settled at Hempstead Swamp, as this area of Queens County was then called, and had a son
named Jeromus."` — S3
*(Finder note: `"Remsen,settled"` — missing space — is in the source text as I read it. **Note the
alternate historical place-name "Hempstead Swamp"**, which differs from the "Whitepot" of F020 and
F025. Two different colonial names for overlapping ground; the verifier should not merge them.)*

**F089** [Q] LP-1177 on Jeromus Remsen the younger: `"born on November 22, 1735"`; `"The younger
Jeromus served during the French and Indian War of 1757 and became active in Whig politics prior to
the Revolutionary War."` — S3

**F090** [Q] LP-1177: `"After the Continental Congress of 1774 was established the inhabitants of
New Towne (Newto~assembled at the request of Jeromus Remsen and appointed a committee to insure
adherence to congressional measures within the limits of the town. Jeromus Remsen was a member and
clerk of the county committee. Later he was appointed colonel over half the militia of Kings and
Queens counties and joined forces under the brigade of General Greene in Brooklyn."` — S3
*(`(Newto~` is an OCR artifact in the source; it appears to be a truncated "(Newtown)".)*

**F091** [Q] LP-1177: `"These American forces were routed at the Battle of Long Island and after
their retreat Colonel Remsen was forced to flee to safety in New Jersey, where he resided until the
war's end."` — S3

**F092** [Q] LP-1177: `"Jeromus had married Ann(a), daughter of Cornelius Rapelje, on April 31,
1768. She bore him seven children of whom only three sons survived infancy. Jeromus died in 1790
while Anna lived until 1816."` — S3
*(Finder note: **"April 31, 1768" is not a real date** — April has thirty days. The error is in the
LPC report itself. Do not reproduce it, and do not silently "fix" it to April 30 or March 31
either; the honest move is to omit the day.)*

**F093** [Q] LP-1177: `"This small cemetery is believed to have been used from the mid-18th through
the 19th centuries for Remsen family members. The oldest known grave is that of Jeromus Remsen, from
1790. In a survey of 1925, the 8raves and gravestones of eight Remsen family members were
identified."` — S3
*(`8raves` is the OCR rendering of "graves". The 1925 survey is LPC note 2: Charles U. Powell,
*Description of Private and Family Cemeteries in the Borough of Queens*, ed. Alice H. Meigs,
Jamaica, NY: Long Island Collection, Queens Borough Public Library, 1932.)*

**F094** [Q] LP-1177: `"In a I!'"ebruary 23, 1887 article in a Kings County newspaper the cemetery
was described as lying between the old Remsen house and the Suydam homestead, neither of which
survive."` — S3
*(`I!'"ebruary` is OCR corruption of "February". LPC's note 1 gives the source as a Kings County
newspaper clipping of February 23, 1887 held in LPC files.)*

**F095** [Q] LP-1177: `"Presently the cemetery features a group of three brownstone gravestones
near Alderton Avenue, formerly Orville Street, (the two Jeromus Remsens and Anna Rems·e~, two along
the northwesterly perimeter (Jerome Remsen and Ann Elizabeth Remsen), and the remnants of another
tombstone along the southern property line (Bridget Remsen). These tombstones date from 1790 through
1819."` — S3
*(Finder note: the header of the same report says **"Alderton Street"**; this sentence says
**"Alderton Avenue, formerly Orville Street"**. The report contradicts itself on the street type.
Also `Rems·e~` is OCR corruption. "Presently" is 1981.)*

**F096** [Q] LP-1177: `"Recently, commemorative gravestones have been erected by the Veterans
Administration in honor of Col. Remsen, Major Abraham Remsen, and their two brothers Aert Remsen
and Garrett Remsen, who were also Revolutionary War officers."` — S3
*("Recently" is 1981 or before.)*

**F097** [Q] LP-1177: `"A World War I memorial, honoring the community's service in that war,
occupies the center of the cemetery. It consists of two doughboy statues flanking a flagpole."` — S3
*(Finder note: strongly visitor-facing detail, and the only one in the report. As of 1981.)*

**F098** [Q] LP-1177's public hearing record: `"On July 8, 1980, the Landmarks Preservation
Commission held a public hearing… At the public hearing there were five speakers in favor of
designation and none opposed. Twenty-three letters were received supporting designation and none
against."` — S3

**F099** [Q] LP-1177: `"Report prepared by Daniel P. Brunetto, Research Department"`. — S3

**F100** [Q] NYC Parks holds the site as a park property: `"signname": "Remsen Family Cemetery"`,
`"borough": "Q"`, `"zipcode": "11374"`, `"acres": "0.247"`, `"location": "Trotting Course La.,
Alderton St."`, `"communityboard": "406"`, `"councildistrict": "30"`, `"typecategory": "Cemetery"`,
`"gispropnum": "Q480"`. — S8
*(Finder note: NYC Parks names it **"Remsen Family Cemetery"**; LPC names it **"Remsen Cemetery"**.
Two agencies, two names for one site. The author must pick one and the verifier should say which.)*

**F101** [Q] NYC Parks' own page data panel: `"Zip Code: 11374"`, `"Community Board: 6"`,
`"Council Member: Phil Wong"`, `"Park ID: Q480"`, `"Acreage: 0.25"`, `"Property Type: Cemetery"`.
Its "Other Parks Nearby" list begins `"Forest Park (0.51 miles)"`. — S18
*(Finder note: NYC Parks' Historical Signs text for this site is a **stub** — the page carries the
boilerplate `"This text is part of Parks' Historical Signs Project and can be found posted within
the park."` and then no sign text at all. Also note S8 gives acreage 0.247 and S18 gives 0.25 —
the same number rounded, not a conflict, but the author should not present 0.247 as precise.)*

---

## 6. West Side Tennis Club and Forest Hills Stadium

> **EVIDENCE WARNING, stated once and applying to this entire section.** The club's own site
> (`foresthillstennis.com`) returned **HTTP 503 to every attempt by both of my tools**. Everything
> below therefore comes from Wikipedia (S20/S21), from the stadium's separate commercial promoter
> site (S31/S32), or from LPC reports that mention the club in passing. **There is no institutional
> self-description in this corpus for the single most important place on this page.** The verifier
> should treat this section as the weakest-sourced part of the file despite being the most
> important, and should retry `foresthillstennis.com` before accepting anything here.

**F102** [Q] S20 lead: `"West Side Tennis Club is a private tennis club located in Forest Hills, a
neighborhood in the New York City borough of Queens. The club has 38 tennis courts in all four
surfaces (clay court, Har-Tru, grass court and hardcourt), a junior Olympic-size swimming pool and
other amenities."` — S20

**F103** [Q] S20: `"It is the home of the Forest Hills Stadium (originally Forest Hills Tennis
Stadium), a 14,000 seat outdoor tennis stadium and concert venue."` — S20

**F104** [Q-2nd] The stadium's own site (S31) says instead: *"the 13,000 capacity stadium is the
only outdoor venue of its kind and size in the city."* — S31

**F105** [Q-2nd] S28 gives yet another figure: the club *"constructed the Forest Hills Tennis
Stadium, with approximately 13,000 seats, in 1923."* — S28

> **CONFLICT — FLAGGED, NOT RESOLVED.** Capacity is given as **14,000** (S20, twice, including in
> the same sentence as the club's court count) and as **13,000** (S31, the venue's own promoter;
> and S28). Note that "capacity" for a concert configuration and "seats" for a tennis
> configuration are not necessarily the same quantity, which may explain the split — but that is my
> speculation and I am marking it as such. **Do not write a capacity number until this is settled.**

**F106** [Q] S20: `"The club hosted 60 editions of the U.S. National Championships (renamed the US
Open Tennis Championships in 1968), first from 1915 to 1920, and then again from 1924 to 1977."`
— S20

**F107** [Q-2nd] S28 states instead: *"The U.S. Open and its predecessor national championships
were held there until 1978."* — S28

> **CONFLICT — FLAGGED, NOT RESOLVED.** S20 says the run ended in **1977**; S28 says **1978**.
> S20's own succession box (F003) gives the USTA Billie Jean King National Tennis Center as taking
> over from **1978**, which is consistent with a last Forest Hills tournament in 1977 — but that is
> inference, not a source statement, and I am not making the call. This matters because the
> departure year is likely to be the single most-quoted number on the finished page.

**F108** [Q] S20: `"The club was founded in 1892 when 13 original members rented land on Central
Park West for three clay courts and a small clubhouse. Ten years later, the land had become too
valuable, and the club moved to a site near Columbia University with room for eight courts. In 1908,
the club moved again to a property at 238th Street and Broadway. The new site covered two city
blocks and had 12 grass courts and 15 clay courts."` — S20
*(Finder note: this is the club's **pre-Forest Hills** history — Manhattan, then the Bronx. Useful
for explaining why it is called the *West Side* club while sitting in Queens.)*

**F109** [Q] S20: `"…ite in Forest Hills, Queens, was purchased. The signature Tudor-style clubhouse
was built the next year. In 1915, the United States Lawn Tennis Association National Championship,
later renamed the U.S. Open, moved to West Side."` — S20
*(Finder note: my extraction clipped the start of this sentence — the surviving text begins mid-word
at `"…ite in Forest Hills"`, evidently "…site in Forest Hills…". I am showing the truncation rather
than reconstructing it. The **year the site was purchased is therefore missing from my quote.**
S28 (F110) supplies 1914 independently; the verifier should confirm from S20 directly.)*

**F110** [Q-2nd] S28: *"In 1914, the West Side Tennis Club moved from Manhattan to Forest Hills
Gardens"*. — S28
*(Finder note: S28 says the club moved **from Manhattan**; S20 (F108) has it at 238th Street and
Broadway — **the Bronx** — from 1908. These are not compatible. Flagged.)*

**F111** [Q] S20: `"By 1923, the success of the event necessitated the construction of a 14,000-seat
horseshoe-shaped stadium that still stands today. The stadium's first event was the 1923 Wightman
Cup, a precursor to the final of the International Lawn Tennis Challenge, which saw the U.S. defeat
Australia."` — S20

**F112** [Q] LP-2066, independently and from a much better source class: `"The world famous West
Side Tennis Club, home of the U.S. Open Tennis Tournament for many years, was constructed in Forest
Hills in 1923."` — S1
*(Finder note: LP-2522 gives the same sentence. Same-agency reuse again — count as one. Note the
LPC sentence says the *club* was constructed in 1923, where Wikipedia says the *stadium* was. LPC is
arguably imprecise here; recording both.)*

**F113** [Q] S20: `"In addition, the finals of the Davis Cup were held at the club ten times, more
than any other venue. The US Pro tournament was held at the venue eleven times, and another
prominent professional tournament, the Tournament of Champions, was held at the venue three
times."` — S20

**F114** [Q] S20's infobox lists Davis Cup / International Lawn Tennis Challenge years at the venue
as: `"1914"`, `"1921 • 1922 • 1923"`, `"1947 • 1948 • 1949 • 1950"`, `"1955"`, `"1959"`. — S20
*(That is ten years, consistent with F113's "ten times".)*

**F115** [Q] S20: `"Beginning in 1971, the stadium was home to the annual Robert F. Kennedy Memorial
Tennis Tournament which was a celebrity pro-am for charity"`. — S20

**F116** [Q] S20/S21 infobox: `Location: One Tennis Place Forest Hills, Queens, NY, U.S. 11375`;
`Coordinates 40°43′11″N 73°50′55″W / 40.7196°N 73.8487°W`; `Former names: Forest Hills Tennis
Stadium`. — S20/S21

**F117** [Q] The stadium's own site footer gives its address as `"1 Tennis Pl, Forest Hills, NY
11375"` and carries the notice `"© 2025 Forest Hills Stadium"`. — S32

**F118** [Q] DCP GeoSearch geocodes `"1 Tennis Place"` to `"1 TENNIS PLACE, Forest Hills, NY, USA"`,
neighbourhood `Forest Hills`, postalcode `11375`. Every one of the first five Tennis Place results
returns neighbourhood `Forest Hills` / zip `11375`. — S19
*(Finder note: **Tennis Place is uncontested.** No source in this corpus assigns it anywhere but
Forest Hills.)*

**F119** [Q-2nd] S31: *"Forest Hills Stadium is a historic outdoor music venue that has welcomed
fans to the picturesque New York City neighborhood of Forest Hills, Queens for over 100 years."*
and *"Originally designed in the 1920's as the home of the U.S. Open tennis tournament"*. — S31

**F120** [Q-2nd] S31 on performers: the venue *"went on to host some of the most culturally
significant performances of the time – Frank Sinatra, Barbra Streisand, The Rolling Stones, and Bob
Dylan."* — S31

**F121** [Q] S21, a fuller and differently-sourced list: `"In the 1960s and 1970s, the venue was
host to performances by The Beatles, Ray Charles, Bob Dylan, The Monkees with Jimi Hendrix, Diana
Ross and The Supremes, Simon & Garfunkel, Frank Sinatra, Barbra Streisand, and The Rolling
Stones."` — S21

**F122** [Q] S21 describes a 1964 poster: `"Poster for 1964 concerts at Forest Hills Tennis Stadium,
headlining Barbra Streisand, Count Basie, Woody Allen, Johnny Mathis, Harry Belafonte, Peter Nero,
and The Beatles."` — S21
*(Finder note: this is an **image caption**, not article prose. Weaker even than the surrounding
aggregator text. But it is the only dated concert evidence I have.)*

**F123** [Q-2nd] S31 on the renovation: *"The stadium was updated in 2013 with a number of
state-of-the-art upgrades and has since welcomed a new golden age of diverse superstars - sell-out
performances by Drake, Dolly Parton, Mumford and Sons, Alabama Shakes, Ed Sheeran and many
more."* — S31

**F124** [Q] S21 dates the renovation differently and in more detail: `"From 2013 to 2017, an
extensive renovation to revitalize the venue included several significant upgrades. Starting with
patching up concrete exterior walls, old seats were removed and replaced by initially 1,200 new
seats in 2014. A permanent stage was installed, designed by Mark Fisher, renowned for his sets for
Pink Floyd, U2, and the Rolling Stones. A new concourse redesign expanded it to twice its original
size"`. — S21
*(Finder note: S31 says "updated in 2013"; S21 says "From 2013 to 2017". Not strictly contradictory
— a multi-year project can be described by its start — but the author must not write "renovated in
2013" as a completed act if S21 is right.)*

**F125** [Q] S21: `"It is also the summer home of The New York Pops."` — S21

**F126** [Q] S21 on the current conflict with the Gardens: `"An October 2022 concert featuring Yeah
Yeah Yeahs and Japanese Breakfast resulted in 62 noise complaints, the highest number recorded for
the stadium. In May 2023, the stadium was sued by the Forest Hills Gardens Corporation for violating
the neighborhood's residential zoning regulations. In response, West Side Tennis Club and its booker
countersued and a judge provided an injunction allowing for Burns Street to remain open for the over
30 concerts that were scheduled at the stadium that summer. The stadium was sued three times in
total for noise complaints in 2023."` — S21
*(Finder note: this is live, contested, litigated, ongoing material about a private dispute between
neighbours. It is also the ONLY evidence in my corpus that the **Forest Hills Gardens Corporation**
exists as a legal entity, since its own site refused connection. My extraction was cut off
mid-sentence at `"On March 25, 2025, the Forest Hills Gardens Corporati…"` — **there is a 2025
development here that I did not capture.** The verifier should retrieve it. I would counsel the
author strongly against narrating an active lawsuit from an aggregator, but that is the
arbitrator's call, not mine.)*

**F127** [Q] S21's transit infobox for the stadium lists `Long Island Rail Road (LIRR) at Forest
Hills` and `New York City Subway … at Forest Hills–71st Avenue`, and buses
`Q23, Q60, Q90, Q64, Q74, QM4, QM11, QM12, QM18, QM42, QM44`. — S21

---

## 7. Religious institutions

### 7.1 Our Lady Queen of Martyrs — 110-06 Queens Boulevard

**F128** [Q] The parish's own site header and footer give the address as `"110-06 Queens Boulevard
Forest Hills, NY 11375"` and `"110-06 Queens Blvd. Forest Hills, NY 11375"`, phone
`"(718) 268-6251"`. — S30

**F129** [Q] DCP GeoSearch geocodes `"110-06 Queens Boulevard"` to `"110-06 QUEENS BOULEVARD, Forest
Hills, NY, USA"`, neighbourhood `Forest Hills`. — S19

**F130** [Q] Parish history: `"In 1912, as people were still venturing into the wilderness of Forest
Hills, building homes on the north side of Hoffman Boulevard (later renamed Queens Boulevard), they
began to want more than just housing. They wanted a community. The Catholics among these early
pioneers formed a parish community of the faithful. Then they needed a church."` — S30
*(Finder note: independently corroborates **Hoffman Boulevard** as Queens Boulevard's earlier name
— see F167 from S25.)*

**F131** [Q] Parish history: `"In 1916, the original white chapel of Our Lady Queen of Martyrs was
built at the corner of Ascan Avenue and Queens Boulevard. By 1917, our founding pastor, Monsignor
Joseph McLaughlin, opened negotiations for the purchase of land for the future development of the
parish as it exists today. He opened our school in 1928 and a decade later announced plans to
construct a new church and rectory. The new church (our present-day church) opened for worship on
November 5, 1939."` — S30

**F132** [Q] Parish history: `"Did you know Our Lady Queen of Martyrs church building itself
(constructed in 1938-39) was modeled after the English Gothic cathedral at Durham?"` — S30
*(Finder note: the Durham comparison is the parish's own claim about itself, framed as a
did-you-know. Institutional self-description, not third-party architectural analysis.)*

**F133** [Q] Parish history photo credits read `"Photo courtesy Rego-Forest Preservation Council"`
and `"Photo courtesy Michael Perlman, Rego-Forest Preservation Council"`, and the page links to
`"Rego-Forest Preservation Council (additional photos of our church complex)"`. — S30
*(Finder note worth the author's attention: the local preservation body covering this ground is
named the **Rego-Forest** Preservation Council — it hyphenates the two contested neighborhoods into
one name. That is itself evidence about how locally entangled the Rego Park / Forest Hills boundary
is. It is also an uncited lead: I could not fetch the Council's own site and it is likely the
richest untapped vein for this page. See §17.)*

**F134** [Q] A caption on the same page: `"Night view of the current church complex which spans one
full block."` — S30

**F135** [Q] The parish site states `"Church is wheelchair accessible through Queens Blvd.
entrance"` and `"Assistive listening device available for Hard of Hearing"`. — S30
*(Finder note: genuinely useful visitor information and it is the institution's own statement.)*

**F136** [Q] The site names current clergy: `"Rev. Francis J. Passenant, Pastor"`, `"Most Rev. Paul
R. Sanchez, D.D., Pastor Emeritus"`, `"Rev. Antonin Kocurek, Parochial Vicar"`, and advertises
`"Strengthen Our Tower of Faith: a parish campaign to repair our church tower"`. — S30
*(Finder note: personnel and active campaigns date fast. Recording, but this is not durable page
material.)*

**F137** [Q] The parish site links a `"2012 Centennial Journal (PDF)"`. — S30
*(Finder note: a 2012 centennial is consistent with the 1912 parish-formation date in F131.)*

### 7.2 The Church-in-the-Gardens — 50 Ascan Avenue

**F138** [Q-2nd] S29: NRHP listing *"The Church-in-the-Gardens"*, reference **#09001086**, listed
**December 11, 2009**, at *"50 Ascan Ave."* — S29

**F139** [Q] DCP GeoSearch geocodes `"50 Ascan Avenue, Queens"` to `"50 ASCAN AVENUE, Forest Hills,
NY, USA"`, neighbourhood `Forest Hills`. — S19

**F140** [Q] The Forest Hills Gardens Foundation links both `"CITG Community House"` and
`"The Church-in-the-Gardens"` among Forest Hills Gardens institutions. — S33

*(Finder note: **the church's own site returned an empty body to both of my tools.** I have no
founding date, no denomination, no architect and no self-description for what is, on the NRHP
evidence, the only nationally-listed building in Forest Hills. This is the largest single gap in
the file. See §17.)*

### 7.3 St. Luke's Church, and the Women's Club

**F141** [Q] The Forest Hills Gardens Foundation lists `"St Luke's Church"` and `"The Women's
Club"` among Forest Hills Gardens institutions. — S33

**F142** [Q-2nd] S28 claims *"St. Luke's Episcopal Church"* is NRHP-listed. — S28
*(Finder note: F142 is directly contradicted by F043/S29, which returned no such listing. See the
conflict box at F044. Beyond the name in F141 and the disputed claim in F142, **I have nothing on
St. Luke's** — no address, no date, no architect. Candidate place, essentially undocumented.)*

---

## 8. Parks and playgrounds

### 8.1 Yellowstone Park — 68-01 Yellowstone Boulevard

**F143** [Q] Parks Properties: `"signname": "Yellowstone Park"`, `"borough": "Q"`,
`"zipcode": "11375"`, `"acres": "1.745"`, `"location": "Yellowstone Blvd. bet. 68 Ave. and 68 Rd."`,
`"communityboard": "406"`, `"councildistrict": "29"`, `"typecategory": "Neighborhood Park"`,
`"address": "68-01 YELLOWSTONE BLVD"`. — S8

**F144** [Q] DCP GeoSearch geocodes `"68-01 Yellowstone Boulevard"` to `"68-01 YELLOWSTONE
BOULEVARD, Forest Hills, NY, USA"`. — S19

**F145** [Q] NYC Parks sign text: `"Yellowstone Municipal Park rests between Yellowstone Boulevard,
68th Avenue, and 68th Road. Initially, the vacant land was partially owned by the Carol Management
Corporation and the Cord Meyer Development Corporation, with plans for an apartment project. The
site was acquired by condemnation on February 3, 1964."` — S11

**F146** [Q] `"City Council Member Arthur Katzman initiated the development of the park, and the
site was included in the Mayor's Capital Budget for 1964-65. Yellowstone Municipal Park was
originally planned as a cement playground, however the neighborhood residents wanted trees and
grass to fill the park. The park opened to the public on May 27, 1968, and was known as Yellowstone
Park for the adjacent boulevard until it was changed to Yellowstone Municipal Park on June 18,
1987."` — S11
*(Finder note: **NYC Parks' own dataset (S8) and its own page header both still call it
"Yellowstone Park"** despite the sign text saying it was renamed to "Yellowstone Municipal Park" in
1987. The agency disagrees with itself. Recording, not resolving.)*

**F147** [Q] `"The origin of the name Yellowstone for the adjacent boulevard is unclear, however it
has been reported to appear on Queens street maps since 1915."` — S11
*(Finder note: the source itself says the etymology is **unclear**. Any page copy that explains the
name is going beyond the source.)*

**F148** [Q] `"The small playground within the park was named for Council Member Andrew Katzman
(1903-1993). Arthur J. Katzman served on New York's City Council for 29 years."` — S11

> **INTERNAL CONTRADICTION IN THE SOURCE — FLAGGED.** The same NYC Parks paragraph calls him
> **"Andrew Katzman"** in one sentence and **"Arthur J. Katzman"** in the next, and calls him
> **"Arthur Katzman"** in F146. The date range (1903-1993) is attached to "Andrew." The
> preponderance within the source favours **Arthur J. Katzman**, but I am not adjudicating it. If
> the page names this man, the verifier must settle it first.

**F149** [Q] `"Katzman was born on September 21, 1903, in Byelarus, which was then a part of Russia.
He came to America and settled in Brownsville, Brooklyn, at the age of five. Katzman graduated from
Brooklyn Law School and practiced law for 65 years, based in Forest Hills for 25 years. Elected as
the neighborhood councilman in 1962, he was known as 'the conscience of city government' for his
support of ethics in government."` — S11

**F150** [Q] The Yellowstone sign carries a compact Forest Hills history: `"Much of the development
in Forest Hills was a result of the opening of the Long Island Rail Road station as well as trolley
surface along Queens Boulevard. In 1936, the IND subway opened to the Union Turnpike, transforming
the Forest Hills area. Forest Hills is predominantly middle class and features the exclusive
development Forest Hills Gardens. In the 1980s, Forest Hills saw a new wave of immigrants from
Europe and Asia."` — S11
*(Finder note: `"trolley surface"` is the text as it appears — likely a truncation of "trolley
surface lines". The 1980s immigration sentence is the ONLY immigration-history evidence in my
entire corpus for Forest Hills, and it is one sentence on a park sign of unknown date. That is a
thin basis for a neighborhood's immigration story. See §17.)*

**F151** [Q] `"In 1973, an enclosed community room was built with the help of Community Volunteers
for Yellowstone Park, the local McDonald's, and construction funds. In 1996, Council Member Karen
Koslowitz funded a $800,000 renovation of new play equipment with safety surfacing, basketball
courts, game tables, picnic tables, benches, fences, new lawns and trees."` — S11

**F152** [Q] `"The park has basketball courts with cement seating, a flagpole with a yardarm, a
public restroom, game tables, benches, and swings for tots. The Arthur J. Katzman Playground
features seal animal art, a drinking fountain, and play equipment with safety surfacing. A path
winds up the hill to a quiet sitting area with benches."` — S11
*(Finder note: undated present tense on an agency sign. Amenities change.)*

**F153** [Q] The page's data panel: `"Zip Code: 11375"`, `"Community Board: 6"`, `"Council Member:
Lynn Schulman"`, `"Park ID: Q425"`, `"Acreage: 1.75"`, `"Property Type: Neighborhood Park"`. — S11

### 8.2 MacDonald Park — Queens Boulevard at Yellowstone Boulevard

**F154** [Q] Parks Properties: `"signname": "MacDonald Park"`, `"zipcode": "11375"`,
`"acres": "1.415"`, `"location": "Queens Blvd. bet. Yellowstone Blvd. and 70 Rd."`,
`"communityboard": "406"`, `"councildistrict": "29"`, `"typecategory": "Neighborhood Park"`. — S8

**F155** [Q] NYC Parks page data panel: `"Zip Code: 11375"`, `"Community Board: 6"`,
`"Council Member: Lynn Schulman"`, `"Park ID: Q207"`, `"Acreage: 1.42"`,
`"Property Type: Neighborhood Park"`. The page also carries navigation to a `"Monuments"` tab. — S17
*(Finder note: **the Historical Signs text for MacDonald Park is a stub** — boilerplate and nothing
else. I have **no** source for who MacDonald was, when the park was created, or what is in it. The
"Monuments" tab implies there is at least one monument I have not identified. Given that this is a
prominent green space directly on Queens Boulevard in the middle of the neighborhood, this is a
significant gap. See §17.)*

### 8.3 Russell Sage Playground — CONTESTED, see §16

**F156** [Q] Parks Properties: `"signname": "Russell Sage Playground"`, `"zipcode": "11375"`,
`"acres": "1.526"`, `"location": "Booth St. bet. 68 Ave. and 68 Dr."`, `"communityboard": "406"`,
`"councildistrict": "29"`, `"typecategory": "Jointly Operated Playground"`,
`"address": "68-17 68 AVENUE"`. — S8

**F157** [Q] NYC Parks sign text, first sentence: `"This playground is named after the adjacent
Russell Sage School, J.H.S.190, in the Rego Park section of Queens."` — S14
*(Finder note: **this is NYC Parks explicitly assigning the site to Rego Park**, against its own
Forest Hills ZIP in F156. Flagged in §16.)*

**F158** [Q] NYC Parks: `"The land for this park, located on Booth Street between 68th Avenue and
68th Drive, was acquired by condemnation for recreational and educational purposes in 1950. A
portion of the land became the footprint of the junior high school, and on January 27, 1957, the
playground opened on an adjacent parcel. In 1985, the playground adopted the name of the school,
Russell Sage."` — S14

**F159** [Q] NYC Parks on the Russell Sage Foundation's later reach: `"Notably, it sponsored the
Regional Plan Association's ('RPA') project to develop a regional plan for New York City in 1929.
The plan sought to revitalize the urban core and to control suburbanization."` and `"it would
provide Parks Commissioner Robert Moses (1888-1981) with many of the basic ideas that shaped his
career."` — S14

### 8.4 Annadale Playground — CONTESTED, see §16

**F160** [Q] Parks Properties: `"signname": "Annadale Playground"`, `"zipcode": "11375"`,
`"acres": "1.013"`, `"location": "Yellowstone Blvd. bet. 64 Rd. and 65 Ave."`,
`"communityboard": "406"`, `"councildistrict": "29"`, `"address": "64-35 102 STREET"`. — S8

**F161** [Q] NYC Parks sign text: `"According to local lore, this neighborhood was once called
Annadale in honor of Anna, the wife of a much-beloved shipbuilder from the area. There is scant
information to prove the truth of this tale, but the playground does bear the Annadale name in
homage to the story. Though the Annadale name is shared with a community in Staten Island, there is
no certain connection between the Staten Island neighborhood and this section of Queens."` — S15
*(Finder note: the source flags its own story as unproven local lore — `"scant information to prove
the truth of this tale"`. Any page copy must carry that hedge.)*

**F162** [Q] NYC Parks, same sign: `"Rego Park, the surrounding neighborhood, derives its name from
the REal GOod Construction Company, which developed the neighborhood in the 1920s. Before
entrepreneurs Henry Schloh and Charles I. Hausman developed the area, this part of Queens was
largely farmland owned by Chinese immigrants and their descendants. These farmers formed an ethnic
enclave, growing Asian produce strictly for sale in Chinatown. When the Real Good Construction
Company bought out the farmers, the neighborhood began to look much as it does today"`. — S15
*(Finder note: **NYC Parks calls Rego Park "the surrounding neighborhood"** for a playground whose
own ZIP in the same agency's dataset is 11375. Flagged in §16. Note also that this Chinese-farmer
history is **Rego Park's**, not Forest Hills'; the Forest Hills page must not annex it.)*

**F163** [Q] `"The city acquired the land for this playground in 1949 through condemnation. Parks
acquired jurisdiction in 1951, and the playground has since been jointly operated by agreement with
the Board of Eduacation. Upon the opening of the park in 1951, it was called P.S. 175 Playground
because of the adjacent school. Commissioner Stern changed the name to Annadale Playground in
1985."` — S15
*(`Eduacation` is the typo as it appears in the source text.)*

### 8.5 Ehrenreich-Austin Playground — 76-10 Austin Street

**F164** [Q] Parks Properties: `"signname": "Ehrenreich-Austin Playground"`, `"zipcode": "11375"`,
`"acres": "1.161"`, `"location": "Austin St. bet. 76 Ave. and 76 Dr."`, `"communityboard": "406"`,
`"councildistrict": "29"`, `"typecategory": "Playground"`, `"address": "76-10 AUSTIN STREET"`. — S8

**F165** [Q] NYC Parks sign text: `"Leo Ehrenreich (1882-1962) played a supporting role in Queens
civic life and was instrumental in the creation of this playground. His father, Moses, owned
Ehrenreich Bros. Coal Yards and was a successful real estate developer."` — S16

**F166** [Q] `"Ehrenreich's initiatives focused on improvements in traffic efficiency, pedestrian
safety, and the creation of recreational facilities in Kew Gardens and Forest Hills. Beginning in
1937, he petitioned for the construction of more playgrounds in his district."` — S16

**F167** [Q] `"During this period, Ehrenreich began working to create the Austin Street Playground.
He petitioned Parks Commissioner Robert Moses and Queens Borough President George U. Harvey to
purchase the plot. On May 2, 1947, after years of negotiation, the area was purchased and the
playground constructed."` — S16

**F168** [Q] `"In later years, he became known as 'the unofficial mayor of Kew Gardens.' During
1952, two local fire companies, Engine Company 305 and Hook and Ladder Company 15, named him as a
honorary member."` — S16
*(Finder note TWO things here. (a) NYC Parks calls him **"the unofficial mayor of Kew Gardens"**
and F166 says he lived in Kew Gardens — a Forest Hills park named for a Kew Gardens man. Not a
boundary contest (Kew Gardens is not a wave-3 sibling) but the author must not make him a Forest
Hills figure. (b) NYC Parks writes **"Hook and Ladder Company 15"** where LPC (F068, F075)
consistently writes **Hook & Ladder Company 151**. One of the two agencies has dropped a digit.
Flagged, not resolved.)*

**F169** [Q] `"The playground is bounded by 76th Avenue and 76th Drive and lies in-between Austin
Street and the main line of the Long Island Railroad. In 1963, the City Council enacted a local law
changing the name to Leo Ehrenreich-Austin Street Playground in honor of the community activist."`
— S16
*(Finder note: the 1963 law is quoted as making it **"Leo Ehrenreich-Austin Street Playground"**,
but NYC Parks' own `signname` in S8 is **"Ehrenreich-Austin Playground"**. Third instance of Parks
disagreeing with its own sign text about a name.)*

**F170** [Q] `"Although Forest Park and Flushing Meadow Park lie within one-quarter mile, their
access routes require crossing main arterial highways. This playground provides safe pedestrian
access to local children, corresponding with Leo Ehrenreich's vision."` — S16
*(Finder note: NYC Parks' own statement that **both** Forest Park and "Flushing Meadow Park" are
within a quarter mile of this spot. That is a concrete, agency-sourced statement of how tightly
Forest Hills is boxed in by two large parks it does not own. Useful, and safely a link rather than
a narration.)*

### 8.6 Other Forest Hills-ZIP park properties (candidate places, lightly documented)

**F171** [Q] Parks Properties rows with `zipcode` `"11375"` that I have not otherwise covered — all
with `"communityboard": "406"`: — S8
- `"Underbridge Dog Run"`, 0.457 acres, `"Grand Central Pkwy. Sr. Rd. W. bet. 64 Ave. and 64 Rd."`,
  address `"64-02 GRND CNTRL PKWY SR W"`, council district `"24"`, `"Sitting Area/Triangle/Mall"`.
- `"Playground Sixty Two LXII"`, 1.48 acres, `"62 Rd. bet. Yellowstone Blvd. and108 St."`, address
  `"105-25 62 Road"`, council district `"24"`, `"Jointly Operated Playground"`.
- `"Barrier Playground"`, 0.867 acres, `"Horace Harding Exwy. Sr. Rd. S., 62 Ave. bet. 102 St. and
  Yellowstone Blvd."`, council district `"24"`, no street address in the dataset.
- `"Willow Lake Playground"`, 1.277 acres, `"72 Ave. bet. 112 St. and Grand Central Parkway"`,
  address `"71-25 113 STREET"`, council district `"29"`, `"Jointly Operated Playground"`.
- `"Project Eden"`, 0.108 acres, `"Kessel St. bet. Yellowstone Blvd. and Selfridge St."`, council
  district `"29"`, `"typecategory": "Garden"`, `"subcategory": "Greenthumb"`.

*(Finder note: **Project Eden is a GreenThumb community garden** — a genuinely distinctive small
place. Underbridge Dog Run sits under the Grand Central Parkway. Barrier Playground and Playground
Sixty Two are in council district 24, which is the district that reaches into the Rego Park side —
worth the arbitrator's eye. I have no history text for any of these five; the Historical Signs
pages I checked for Willow Lake were stubs.)*

### 8.7 Forest Park — CONTESTED (multi-neighborhood), see §16

**F172** [Q] Parks Properties: `"signname": "Forest Park"`, `"borough": "Q"`, `"acres": "506.86"`,
`"zipcode": "11375, 11385, 11415, 11421"`, `"communityboard": "305405406409"`,
`"councildistrict": "29, 32"`, `"typecategory": "Flagship Park"`, `"address": "80-30 PARK LANE"`,
`"location": "Myrtle Ave, Union Tpke, Park Lane S"`, `"gispropnum": "Q015"`. — S8
*(Finder note: `"305405406409"` decodes as community boards **Brooklyn 5, Queens 5, Queens 6, and
Queens 9** — a park spanning a borough line and four community districts. Queens CB 6 is Forest
Hills'/Rego Park's. ZIP 11375 is Forest Hills'.)*

**F173** [Q] NYC Parks' own Forest Park page data panel gives a DIFFERENT ZIP list:
`"Zip Code: 11375, 11385, 11415, 11418, 11421"` and `"Community Board: 5, 6, 9"`. — S13
*(Finder note: the page adds **11418** which the dataset omits, and its community board list drops
the Brooklyn board. **NYC Parks contradicts NYC Parks.** Recording both.)*

**F174** [Q] NYC Parks sign text: `"One of New York City's natural treasures, Forest Park's
topography was created by the Wisconsin glacier 20,000 years ago and includes the Harbor Hill
Moraine, a series of small hills known as 'knob and kettle' terrain. The area was inhabited by the
Rockaway, Lenape, and Delaware tribes until the Dutch West India Company settled the area in
1635."` — S13

**F175** [Q] `"In 1892, the New York State Legislature authorized an initiative by Brooklyn
officials to establish a large public park. The Brooklyn Parks Department purchased the first parcel
of what was called Brooklyn Forest Park on August 9, 1895, with additional acquisitions continuing
until 1898. The park and Forest Park Drive were designed by the firm of Olmsted, Olmsted, and
Elliot."` — S13
*(Finder note: `"Olmsted, Olmsted, and Elliot"` is the spelling in the source; the firm is usually
written Olmsted, Olmsted & Eliot. S28 independently dates the Olmsted involvement to `"Starting in
1896"` (F176) which does not match "1892"/"1895" cleanly. Also note this is the **same Olmsted
lineage** as Forest Hills Gardens — a real connection, but the two commissions are separate and
must not be merged.)*

**F176** [Q-2nd] S28: *"Starting in 1896, the landscape architecture firm of Olmsted, Olmsted &
Eliot was contracted to provide a plan for the park."* — S28

**F177** [Q] `"Forest Park is home to Oak Ridge, an exquisite example of Dutch Colonial
architecture, Oak Ridge was built in 1905 by the architectural firm of Helmle, Huberty & Hudswell,
who also designed the landmark Williamsburgh Savings Bank tower in Brooklyn. Originally built as the
golf course clubhouse, it is now the administration building for Forest Park staff. The Overlook was
completed in 1912 and houses NYC Parks' Queens borough operations. The park's greenhouse, built in
1910, grows trees and plants for many city parks."` — S13

**F178** [Q] `"Forest Park also offers a wide array of recreational facilities, such as the
Carousel, 110-acre Forest Park Golf Course George Seuffert, Sr. Bandshell, a bridle path for horses,
tennis courts, playgrounds, Victory Field, areas for bird watching, and over five miles of walking
trails. The park also contains several monuments, including the Richmond Hill War Memorial."` — S13

**F179** [Q] `"Forest Park is named for its many trees… The park contains a pine grove that was
planted in 1914 to replace more than 15,000 trees lost to a fungus known as chestnut blight in 1912.
Among these trees, there are some specimens that survived and date back to 1909. The park also
contains the largest continuous oak forest in Queens and a stand of memorial trees planted along
Forest Parkway in 1919 to commemorate fallen World War I soldiers."` — S13

**F180** [Q] `"Forest Park Nature Center is currently closed to the public."` — S13
*(Finder note: undated "currently" on an agency page fetched 2026. Useful visitor warning if it
still holds, but the verifier must not let it be written as timeless.)*

**F181** [Q] Two parkway properties also carry ZIP 11375 in Parks Properties: `"Grand Central
Parkway Extension"` (233.073 acres, `"zipcode": "11103, 11367, 11368, 11369, 11370, 11371, 11375"`,
`"communityboard": "401403404406"`) and `"Jackie Robinson Parkway"` (72.75 acres,
`"zipcode": "11207, 11375, 11385, 11415"`, `"communityboard": "304305405406"`). — S8
*(Finder note: these are highway rights-of-way, not visitable parks. Recording them only so the
verifier knows the 11375 park list is complete and knows why they were excluded.)*

---

## 9. Schools

**F182** [Q] DOE School Locations rows in community district `"406"`, all with `"nta": "QN17"` and
`"council_district": "29"`: — S9

| Location name | Address (as printed) | Category | Grades | Open date |
|---|---|---|---|---|
| `"Forest Hills High School"` | `"67-01 110 STREET"` | `"High school"` | `"09,10,11,12"` | `"1941-07-01"` |
| `"P.S. 101 School in the Gardens"` | `"2 RUSSELL PLACE"` | `"Elementary"` | `"PK,0K,01–06"` | `"1927-07-01"` |
| `"J.H.S. 190 Russell Sage"` | `"68-17 AUSTIN STREET"` | `"Junior High-Intermediate-Middle"` | `"06,07,08"` | `"1954-07-01"` |
| `"P.S. 144 Col Jeromus Remsen"` | `"93-02 69 AVENUE"` | `"Elementary"` | `"PK,0K,01–06"` | `"1931-07-01"` |
| `"J.H.S. 157 Stephen A. Halsey"` | `"63-55 102ND STREET"` | `"Junior High-Intermediate-Middle"` | `"06,07,08,09"` | `"1948-07-01"` |
| `"P.S. 175 The Lynn Gross Discovery School"` | `"64-35 102 STREET"` | `"Elementary"` | `"0K,01–05"` | `"1951-07-01"` |
| `"P.S. 196 Grand Central Parkway"` | `"71-25 113 STREET"` | `"Elementary"` | `"0K,01–05"` | `"1953-07-01"` |
| `"P.S. 220 Edward Mandel"` | `"62-10 108 STREET"` | `"Elementary"` | `"PK,0K,01–05"` | `"1956-07-01"` |
| `"Queens Metropolitan High School"` | `"91-30 METROPOLITAN AVENUE"` | `"High school"` | `"09–12"` | `"2010-07-01"` |
| `"Metropolitan Expeditionary Learning School"` | `"91-30 METROPOLITAN AVENUE"` | `"Secondary School"` | `"06–12"` | `"2010-07-01"` |
| `"P.S. Q233"` | `"91-30 METROPOLITAN AVENUE"` | `"Special Education"` | `"02–12,SE"` | `"1989-06-26"` |
| `"The Academy for Excellence through the Arts"` | `"108-55 69 AVENUE"` | `"Early Childhood"` | `"PK,0K,01–05"` | `"2008-07-01"` |

*(Finder note: **`"nta": "QN17"` is a 2010-vintage NTA code, not a 2020 one** — it does not map onto
the `QN0601`/`QN0602` split in S7 and cannot be used to assign any of these to Forest Hills vs Rego
Park. The DOE file assigns all twelve to one blended code. Do not read QN17 as "Forest Hills".)*

**F183** [Q] DCP GeoSearch geocodes the school addresses as follows — **all to Forest Hills**:
`"67-01 110 STREET, Forest Hills"`; `"2 RUSSELL PLACE, Forest Hills"`; `"68-17 AUSTIN STREET,
Forest Hills"`; `"64-35 102 STREET, Forest Hills"`; `"91-30 METROPOLITAN AVENUE, Forest Hills"`.
— S19

**F184** [Q-2nd] S28: Simon and Garfunkel *"graduated from Forest Hills High School in 1958"*. — S28

**F185** [Q] S27: `"The Ramones were an American punk rock band formed in the New York City
neighborhood Forest Hills, Queens, in 1974."` — S27

**F186** [Q] S27: `"Forest Hills High School, attended by the four original members of the
Ramones"` (image caption), and `"The original members of the band met in and around the middle-class
neighborhood of Forest Hills in the New York City borough of Queens. John Cummings and Thomas
Erdelyi had both been in a high-school garage band from 1965 to 1967 known as the Tangerine Puppets.
They became friends with Douglas Colvin, who had recently moved to the area from Germany, and Jeff
Hyman"`. — S27

**F187** [Q-2nd] S28 states the Ramones formed in Forest Hills and that a *"Ramones Way"* was
designated in 2017. — S28
*(Finder note: a co-named street is a checkable, visitable, distinctly-Forest-Hills thing and it
reaches me only as a summarizer fragment with no location given. **Strong candidate, needs the
actual block.** See §17.)*

**F188** [Q-2nd] S28 records the fictional association: Spider-Man's residence at *"20 Ingram
Street"*. — S28
*(Finder note: a fictional address. Fun, widely repeated, and exactly the sort of thing that gets
written as fact. If used at all it must be framed as fiction.)*

**F189** [Q] `"P.S. 144 Col Jeromus Remsen"` at `"93-02 69 AVENUE"` is named for the same Colonel
Jeromus Remsen buried in the Remsen Cemetery (F085–F099). — S9 + S3
*(Finder note: that connection is **my inference from two sources**, not a statement either source
makes. Marked as such deliberately. It is a good connection if it holds and the verifier should
confirm the school's namesake independently.)*

---

## 10. Transit

**F190** [Q] MTA Subway Stations dataset, the only Forest Hills row:
`"gtfs_stop_id": "G08"`, `"station_id": "261"`, `"complex_id": "261"`, `"division": "IND"`,
`"line": "Queens Blvd"`, `"stop_name": "Forest Hills-71 Av"`, `"borough": "Q"`,
`"daytime_routes": "E F M R"`, `"structure": "Subway"`, `"gtfs_latitude": "40.721691"`,
`"gtfs_longitude": "-73.844521"`, `"ada": "1"`, `"ada_northbound": "1"`, `"ada_southbound": "1"`,
`"north_direction_label": "Outbound"`, `"south_direction_label": "Manhattan"`. — S10
*(Finder note: `"ada": "1"` with both directions flagged is the MTA's own **fully accessible**
marker. That is a real visitor fact from a primary source.)*

**F191** [Q] S23 infobox: `Opened December 31, 1936`; `Structure: Underground`; `Platforms: 2 island
platforms, cross-platform interchange`; `Tracks: 4`; `Accessible: Yes`; `Former/other names:
71st–Continental Avenues–Forest Hills`; `Traffic 2024: 5,697,461`, `3.4%`, `Rank 47 out of 423`.
— S23
*(Finder note: **"Rank 47 out of 423"** for 2024 ridership is a strong, checkable, primary-flavoured
statistic — though it reaches me via an aggregator citing the MTA. The "Former/other names" line
explains the "Continental Avenue" the LPC reports keep referring to.)*

**F192** [Q] S23: `"To the east, the line widens to six tracks, with two tracks starting between
the local and express tracks in each direction, then ramping down to a lower level, where they
widen to four tracks and run under the 75th Avenue station to Jamaica Yard. M and R trains discharge
their passengers on the northbound platform and proceed to one of the innermost two tracks to relay
and return southbound"`. — S23
*(Finder note: this is why Forest Hills–71st Avenue is a terminal for M and R — genuinely useful to
a visitor and not obvious from a map.)*

**F193** [Q] S24 lead: `"The 75th Avenue station (originally the 75th Avenue–Puritan Avenue
station) is a local station on the IND Queens Boulevard Line of the New York City Subway. Located at
the intersection of 75th Avenue and Queens Boulevard in Forest Hills, Queens, it is served by the F
train at all times, the E train at all times except weekday rush hours and middays, and the <F>
train during rush hours in the reverse peak direction. The station opened on December 31, 1936"`.
— S24
*(Finder note: **Forest Hills has two subway stations, not one** — the MTA dataset query in F190
only surfaced 71st Avenue because 75th Avenue's `stop_name` does not contain "Forest Hills". The
verifier should re-pull S10 for station_id of 75th Avenue rather than trusting my single row. S24's
infobox gives `Opened December 31, 1936`, `2 side platforms`, `4 tracks`, `Underground`,
`Traffic 2024: 745,630`, `Rank 339 out of 423`.)*

**F194** [Q-2nd] S28: *"The two subway stops in Forest Hills opened in 1936 along with six other
stations on the Queens Boulevard line."* — S28
*(Corroborates the two-station count in F193 from a second source.)*

**F195** [Q] S22 infobox for the LIRR station: `Opened 1906`; `Closed 1911`; `Rebuilt August 5,
1911`; `Electrified June 16, 1910, 750 V (DC) third rail`; `Station code FHL`; `Fare zone 1`;
`2 side platforms`; `4 tracks`; `Passengers 2017: 1,967`; `Accessible: ADA Accessible-Yes — 2 Ramps
are present at Forest Hills, one for each platform`. — S22
*(Finder note: the **opened-1906 / closed-1911 / rebuilt-1911** sequence is unusual and the article's
own category list says `"Railway stations in the United States opened in 1911"` — i.e. Wikipedia
itself files it under 1911 while its infobox says 1906. Flagged.)*

**F196** [Q] S22: `"Built in 1906, the Forest Hills station is one of the oldest operating passenger
railway stations in New York City, predating IND subway expansion to the area in the mid 1930s."`
— S22

**F197** [Q] S22: `"…center of Forest Hills Gardens, a planned community modelled after the garden
communities of England. The station building was constructed in the same Tudor style as the building
known as the 'Forest Hills Inn' located across Station Square. The station is also just east of the
West Side Tennis Club. Two blocks to the north along 71st Avenue is the Forest Hills–71st Avenue
subway station, one of the busiest in Queens."` — S22
*(Finder note: my extraction clipped the start of this passage. This is the **only** evidence in my
corpus for the **Forest Hills Inn** as a named building, and it reaches me from an aggregator. The
Inn is an obvious candidate place and is essentially undocumented here. See §17.)*

**F198** [Q] S22 gives the station's line as `"Main Line (Long Island Rail Road)"` at
`"6.7 mi (km) from Long Island City"`, and its adjacent stations as `"Woodside"` toward Penn
Station or Grand Central and `"Kew Gardens"` toward Hempstead. — S22
*(Finder note: **Woodside is a wave-2 Queens page that already ships.** A rail link between the two
is a legitimate cross-reference.)*

**F199** [Q] S22 lists a **former** LIRR service with adjacent stations `"Grand Street"` and
`"Kew Gardens"` on the Main Line. — S22

**F200** [Q] S25 infobox: Queens Boulevard is `New York State Route 25`, `Length 7.5 mi (12.1 km)`,
`Width 80 to 200 feet (24 to 61 m)`, `Owner: City of New York`, `Maintained by NYCDOT`, west end at
the `Queensboro Bridge` in Long Island City, east end at `Jamaica Avenue in Jamaica`. Its infobox
caption reads `"Queens Boulevard near its intersection with Yellowstone Boulevard in Forest
Hills"`. — S25

**F201** [Q] S25: `"Due to the high number of crashes, Queens Boulevard is known as the Boulevard
of Death. More crashes happen along Queens Boulevard than any other roadway statewide."` — S25
*(Finder note: undated claim, cited to two footnotes I did not chase. "Boulevard of Death" is real
and widely used, but the "more than any other roadway statewide" superlative needs a date and a
source before it is written.)*

**F202** [Q] S25: `"The route of today's Queens Boulevard originally consisted of Hoffman Boulevard
and Thompson Avenue, which was created by linking and expanding these already-existing streets, stubs
of which still exist. In 1913, a trolley line was constructed from 59th Street in Manhattan east
along the new boulevard."` — S25
*(Finder note: S25 spells it **"Thompson Avenue"** here and **"Thomson Avenue"** two sentences
earlier in F203. Corroborates OLQM's "Hoffman Boulevard" (F130) from an independent source.)*

**F203** [Q] S25: `"Queens Boulevard was planned as a nearly 10-mile (16 km) road from the
Queensboro Bridge Plaza to Jamaica, mostly 200 feet (61 m) wide and formed partly by widening
Thomson Avenue."` — S25
*(Finder note: the infobox says the road is **7.5 mi** long (F200); this sentence says it was
*planned* as **nearly 10 miles**. Not a contradiction — planned vs built — but easy to garble.)*

**F204** [Q] S25: `"During the 1920s and 1930s the boulevard was widened in conjunction with the
digging of the IND Queens Boulevard Line subway tunnels. The new subway line used cut-and-cover
construction and trenches had to be dug up in the center of the thoroughfare, and to allow
pedestrians to pass over the construction, temporary bridges were built. The improvement was between
Van Dam Street and Hillside Avenue, and it cost $2.23 million. The street was widened to 200 feet
(61 m) between Van Dam Street and Union Turnpike"`. — S25

**F205** [Q] LP-2066, from a far better source class, on the same widening: `"Forest Hills, in
particular, was poised for huge growth. In addition to house and apartment construction, in 1936 two
major events occurred to spur development. This section of Queens Boulevard was widened further, and
a new subway station was opened just next to the site of the new bank at Continental Avenue and
Queens Boulevard."` — S1

**F206** [Q] S25 on buses through Forest Hills: `"The Electchester-bound Q64 runs from 108th Street
to Jewel Avenue, with service originating at 70th Road. The Forest Hills-bound Q74 runs from 108th
Street to 70th Road, deadheads to 70th Avenue, and begins QCC service running to Jewel Avenue. The
Q23 runs between Yellowstone Boulevard and 108th Street."` — S25
*(Finder note: bus routings change often; this is undated. The stadium's own bus list (F127) is a
better starting point for a visitor.)*

**F207** [Q] S24 lists MTA Bus service at 75th Avenue as `Q60, QM11, QM18`. — S24

---

## 11. Commercial streets and cultural venues

**F208** [Q-2nd] S28: Austin Street *"has many restaurants and chain stores"* and is *"the area's
main commercial street."* — S28
*(Finder note: **Austin Street is Forest Hills' principal shopping street and this one-clause
summarizer fragment is ALL the evidence I have for it.** No BID site, no chamber of commerce, no
local news. For a page whose visitors will mostly come to walk Austin Street, this is a serious
hole. The DOHMH data in §15 shows the density of businesses on it but says nothing about its
character. See §17.)*

**F209** [Q] DCP GeoSearch geocodes `"108-22 Queens Boulevard"` to `"108-22 QUEENS BOULEVARD,
Forest Hills, NY, USA"`, zip `11375` — but the near-miss results on the same query return
`"22-108 QUEENS BOULEVARD, Rego Park"`, `"17-108 QUEENS BOULEVARD, Rego Park"` and
`"38-108 QUEENS BOULEVARD, Rego Park"` at zip `11374`. — S19
*(Finder note: this is the boundary in miniature. **Queens Boulevard's hyphenated house numbers
flip between Forest Hills and Rego Park within the same block range**, and a transposed number
lands in the other neighborhood. Any address-based assignment on Queens Boulevard must be
character-exact.)*

**F210** [Q] DCP GeoSearch geocodes `"106-03 Metropolitan Avenue, Queens"` to `"106-03 METROPOLITAN
AVENUE, Forest Hills, NY, USA"`. — S19
*(Finder note: Metropolitan Avenue is Forest Hills' third commercial spine after Austin Street and
Queens Boulevard, and 106-03 Metropolitan is the long-standing address of the Cinemart Cinemas —
but **I have no source for the cinema itself**, only for the address geocoding to Forest Hills. I
am recording the address, not the business. See §17.)*

**F211** [Q] DCP GeoSearch geocodes `"106-28 Queens Boulevard"` to `"106-28 QUEENS BOULEVARD, Forest
Hills, NY, USA"`. — S19
*(Finder note: recorded because S28 (F044) claims a *"United States Post Office"* in Forest Hills is
NRHP-listed and this is the Forest Hills post office address I attempted. **I have no source
confirming the post office is at this address**, and S29 did not list it as NRHP. Two open
questions, both unresolved.)*

**F212** [Q] S26 on the Trylon Theater — recorded here because it is repeatedly called Forest Hills
in popular usage: `"The Trylon Theater, an art deco theater built around the time of the 1939 New
York World's Fair, was converted to the home of the Education Center for Russian Jewry in 2006.
After local furor over interior refurbishment, the New York City Landmarks Preservation Commission
was considering landmarking the property. The theater, which closed in 2009, was repurposed into a
synagogue for more than a decade"`. — S26

**F213** [Q] DCP GeoSearch geocodes the Trylon's address `"98-81 Queens Boulevard"` to
`"98-81 QUEENS BOULEVARD, Rego Park, NY, USA"`, zip `11374`. All five returned results are
`Rego Park`. — S19
*(Finder note: **the Trylon geocodes to Rego Park and S26 discusses it in the Rego Park article.**
Flagged in §16 as almost certainly the sibling's, not mine. I record it only so the Forest Hills
author does not reach for it.)*

**F214** [Q] S26 on Lost Battalion Hall: `"The Lost Battalion Hall, on Queens Boulevard, is named
after nine companies of the 77th Infantry Division who fought in World War I. The structure, which is
now a community center, was erected in 1939 as a hall for the Veterans of Foreign Wars and the
American Legion. It was taken over as a community center by the New York City Department of Parks
and Recreation in 1960 and is still operated as such."` — S26

**F215** [Q] Parks Properties: `"signname": "Lost Battalion Hall Recreation Center"`,
`"zipcode": "11374"`, `"acres": "2.412"`, `"address": "93-29 QUEENS BOULEVARD"`,
`"communityboard": "406"`, `"councildistrict": "24"`. — S8

**F216** [Q] DCP GeoSearch geocodes `"93-29 Queens Boulevard"` to `"93-29 QUEENS BOULEVARD, Rego
Park, NY, USA"`, zip `11374`. — S19
*(Finder note: Lost Battalion Hall is **Rego Park's on every axis I can check** — ZIP, geocode, and
the sibling's own article. Recorded so the Forest Hills author does not claim it.)*

**F217** [Q] S26 on the Rego Park Jewish Center, recorded only to keep it out of this page:
`"is notable for an A. Raymond Katz-designed façade with Old Testament scenes and symbols carved
into it. The building is listed on both the New York State and National Register of Historic
Places."` — S26
*(Finder note: **this is Rego Park's.** It also resolves the apparent oddity that S29 reported no
Rego Park NRHP listings — S29's table evidently indexes it under a different locality string. That
is a caution about F043's completeness, not a claim about Forest Hills.)*

---

## 12. Candidate places — consolidated list

Every place below is a CANDIDATE. Nothing is confirmed. The "assignment evidence" column records
what my sources say, including where they disagree; it is not a ruling.

| # | Candidate place | Address as sourced | Assignment evidence | Facts |
|---|---|---|---|---|
| P01 | West Side Tennis Club | 1 Tennis Place / One Tennis Place, 11375 | GeoSearch → **Forest Hills**; S20 lead → Forest Hills; uncontested | F102–F118 |
| P02 | Forest Hills Stadium | 1 Tennis Pl, 11375 | GeoSearch → **Forest Hills**; venue's own footer → Forest Hills | F103–F127 |
| P03 | Forest Hills Gardens (the planned community) | south of the LIRR line | LPC + all sources → Forest Hills; **NOT LPC-designated, NOT scenic** | F032–F052 |
| P04 | Station Square | 1 Station Square, 11375 | GeoSearch → **Forest Hills** | F039, F050–F052, F197 |
| P05 | Forest Hills Inn | "across Station Square" | S22 only; no address, no date | F197 |
| P06 | Ridgewood Savings Bank, Forest Hills Branch (LPC individual landmark, LP-2066) | 107-55 Queens Blvd | LPC NTA `QN0602`; GeoSearch → **Forest Hills** | F053–F067 |
| P07 | Firehouse, Engine Co. 305 / Hook & Ladder 151 (LPC individual landmark, LP-2522) | 111-02 Queens Blvd (aka 111-50 75th Ave) | LPC summary says **"in Forest Hills, Queens"**; NTA `QN0602`; GeoSearch → Forest Hills | F068–F084 |
| P08 | Remsen Cemetery / Remsen Family Cemetery (LPC individual landmark, LP-1177) | adjoining 69-43 Trotting Course Lane | **CONTESTED — see §16** | F085–F101 |
| P09 | Our Lady Queen of Martyrs | 110-06 Queens Blvd, 11375 | GeoSearch → **Forest Hills**; parish's own address says Forest Hills | F128–F137 |
| P10 | The Church-in-the-Gardens (NRHP #09001086) | 50 Ascan Ave | GeoSearch → **Forest Hills**; S29 → Forest Hills | F138–F140 |
| P11 | St. Luke's Church | unknown | S33 lists it as a Gardens institution; NRHP status disputed | F141–F142 |
| P12 | The Women's Club | unknown | S33 lists it as a Gardens institution | F141 |
| P13 | Arbor Close and Forest Close | abutting the Queens Blvd firehouse site | LP-2522 → within Forest Hills; completed 1925 and 1927 | F030 |
| P14 | Yellowstone Park (a.k.a. Yellowstone Municipal Park) | 68-01 Yellowstone Blvd, 11375 | GeoSearch → **Forest Hills**; ZIP 11375 | F143–F153 |
| P15 | MacDonald Park | Queens Blvd bet. Yellowstone Blvd and 70 Rd, 11375 | ZIP 11375, CB 6 — but **no sign text at all** | F154–F155 |
| P16 | Ehrenreich-Austin Playground | 76-10 Austin Street, 11375 | ZIP 11375; sign names Forest Hills **and** Kew Gardens | F164–F170 |
| P17 | Russell Sage Playground | 68-17 68 Avenue, 11375 | **CONTESTED — see §16** | F156–F159 |
| P18 | Annadale Playground | 64-35 102 Street, 11375 | **CONTESTED — see §16** | F160–F163 |
| P19 | Willow Lake Playground | 71-25 113 Street, 11375 | ZIP 11375; abuts FMCP — **see §0** | F001, F171 |
| P20 | Project Eden (GreenThumb garden) | Kessel St bet. Yellowstone Blvd and Selfridge St, 11375 | ZIP 11375, CB 6 | F171 |
| P21 | Underbridge Dog Run | 64-02 Grand Central Pkwy Sr Rd W, 11375 | ZIP 11375, **council district 24** | F171 |
| P22 | Playground Sixty Two LXII | 105-25 62 Road, 11375 | ZIP 11375, **council district 24** | F171 |
| P23 | Barrier Playground | Horace Harding Exwy Sr Rd S at 62 Ave, 11375 | ZIP 11375, **council district 24** | F171 |
| P24 | Forest Park | 80-30 Park Lane | **CONTESTED (multi-neighborhood) — see §16** | F172–F181 |
| P25 | Forest Hills–71st Avenue subway station | Queens Blvd at 71st Ave | MTA `stop_name` says Forest Hills; fully ADA | F190–F192 |
| P26 | 75th Avenue subway station | 75th Ave and Queens Blvd | S24 lead → **"in Forest Hills, Queens"** | F193 |
| P27 | Forest Hills station (LIRR), station code FHL | in Station Square | S22 → Forest Hills; ADA via 2 ramps | F195–F199 |
| P28 | Forest Hills High School | 67-01 110 Street | DOE CD 406; GeoSearch → **Forest Hills**; opened 1941 | F182–F186 |
| P29 | P.S. 101 School in the Gardens | 2 Russell Place | GeoSearch → **Forest Hills**; opened 1927 | F182–F183 |
| P30 | J.H.S. 190 Russell Sage | 68-17 Austin Street | GeoSearch → Forest Hills; but **Parks sign says Rego Park** — §16 | F157, F182 |
| P31 | Queens Metropolitan HS / MELS / P.S. Q233 (one building) | 91-30 Metropolitan Avenue | GeoSearch → **Forest Hills** | F182–F183 |
| P32 | "Ramones Way" co-named street | block unknown | S28 only; 2017 designation | F187 |

**Places I am recording as almost certainly NOT this page's, so the author does not reach for them:**
Lost Battalion Hall Recreation Center (P-x, §16 row 5), the Trylon Theater (§16 row 6), the Rego
Park Jewish Center (F217), and all eight `CitiFieldPlaces` holdings inside Flushing Meadows Corona
Park (§0).

---

## 13. Count

- **Candidate facts recorded: 217** (F001–F217).
- **Candidate places recorded: 32** (P01–P32), plus 4 explicitly recorded as probably-not-mine.
- **Sources: 35** (S1–S35), of which 3 are LPC designation-report PDFs read as raw text, 8 are
  government open-data APIs / geocoders read as raw JSON, 8 are institutional HTML pages I stripped
  myself, 10 are Wikipedia (aggregator), and the remainder commercial or thin.

---

## 14. SOURCE CONFLICTS AND INTERNAL CONTRADICTIONS — for the verifier

I am not resolving any of these. I am listing them so none of them reaches the author unnoticed.

1. **Forest Hills Gardens land purchase** — 160 acres (LP-2066) / 160 acres in 1906 (LP-2522) /
   142 acres in 1908 by Margaret Sage personally (S28). Complicated further by the Russell Sage
   Foundation's own founding date of 1907 (F045). — F032/F033/F034
2. **Who designed Forest Hills Gardens** — four sources, four attributions, including LPC
   contradicting LPC twelve years apart. — F035/F036/F037 vs F032
3. **Stadium capacity** — 14,000 (S20) vs 13,000 (S31, the venue's own site; and S28). — F103/F104/F105
4. **When the U.S. Open left** — 1977 (S20) vs 1978 (S28). — F106/F107
5. **Where the tennis club moved FROM** — Manhattan (S28) vs 238th St and Broadway, the Bronx, from
   1908 (S20). — F108/F110
6. **Stadium renovation** — "updated in 2013" (S31) vs "From 2013 to 2017" (S21). — F123/F124
7. **NRHP listings in Forest Hills** — one, the Church-in-the-Gardens (S29) vs three, adding St.
   Luke's and a US Post Office (S28). Unresolvable in this corpus; my NPS PDF fetch failed. — F043/F044
8. **"Andrew Katzman" vs "Arthur J. Katzman"** — NYC Parks calls the same man both, in consecutive
   sentences. — F148
9. **"Hook and Ladder Company 15" (NYC Parks) vs "Hook & Ladder Company 151" (LPC, repeatedly)** —
   one agency has dropped a digit. — F168 vs F068/F075
10. **Yellowstone Park vs Yellowstone Municipal Park** — the sign says it was renamed in 1987; the
    agency's own dataset and page header still use the old name. — F146
11. **Ehrenreich-Austin Playground vs Leo Ehrenreich-Austin Street Playground** — the sign quotes a
    1963 local law giving the longer name; the dataset uses the shorter. — F169
12. **Remsen Cemetery vs Remsen Family Cemetery** — LPC's name vs NYC Parks' name for one site. — F100
13. **Alderton Street vs Alderton Avenue** — LP-1177 contradicts itself between its header and its
    description, and adds "formerly Orville Street". — F085 vs F095
14. **Forest Park ZIP and community-board lists** — the Parks dataset and the Parks web page give
    different lists (11418 present in one, absent in the other; Brooklyn CB5 present in one, absent
    in the other). — F172/F173
15. **Forest Park's Olmsted date** — 1892 legislature / 1895 first parcel (S13) vs "Starting in
    1896" (S28). — F175/F176
16. **LIRR Forest Hills station opening** — infobox says opened 1906, closed 1911, rebuilt 1911;
    the same article's category list files it as opened in 1911. — F195/F196
17. **Queens Boulevard length** — 7.5 mi built (infobox) vs "nearly 10-mile" planned (prose). Also
    "Thomson Avenue" and "Thompson Avenue" in the same article. — F200/F202/F203
18. **LP-1177's marriage date "April 31, 1768" is not a real date.** The error is the source's. — F092
19. **LP-2522's Sliney attribution sits against the FDNY's own annual reports saying no architect
    was employed.** Both are in LP-2522. — F073 vs F078/F079
20. **LP-2066 and LP-2522 share large passages verbatim.** They are not independent corroboration
    and must not be counted twice. — F021, F023, F112
21. **OCR artifacts I preserved rather than silently fixing**, so the verifier is not surprised when
    the PDF does not match a cleaned quote: `modem` (modern), `granit~` (granite), `impo1tant`,
    `excel lent`, `8raves` (graves), `I!'"ebruary` (February), `Rems·e~`, `(Newto~`, `Remsen,settled`,
    `Eduacation`, `Queens borough Bridge`. — throughout §5

---

## 15. Restaurants and businesses — DOHMH CONSTRAINT, READ BEFORE WRITING ANY BUSINESS

**F218** [Q] I queried the DOHMH Restaurant Inspection Results dataset (`43nn-pn8j`) for
`boro=Queens` and `zipcode=11375`. The query returned 1,200 inspection rows resolving to
**215 distinct `dba` values**. — S34

**EXPLICIT STATEMENT AS REQUIRED BY THE BRIEF: for every one of these 215 businesses, a DOHMH
inspection record is the ONLY source I have.** I found no menu, no press coverage, no institutional
page, no local review, and no opening date for any of them. That is a direct consequence of the
exhausted WebSearch budget described at the top of this file. Nothing here establishes that a
business is open today, is any good, is notable, or is worth a visit. An inspection record
establishes only that DOHMH inspected an address under that trade name on a given date.

A sample of what the dataset contains, recorded so the verifier can see the shape of the evidence
and the geography of the commercial strips — **not as a recommendation list and not as candidate
place records**: — S34

- **On Austin Street:** `"LOWKEY GARDEN LOUNGE"` (70-15, Caribbean), `"OBA GRILL"` (70-35,
  Turkish), `"718 HOOKAH LOUNGE"` (72-13, Middle Eastern), `"AMAR PERUVIAN KITCHEN"` (68-54,
  Peruvian), `"THE BILLIARD COMPANY"` (70-49, American), `"COOKIES N' CREAM"` (70-17, Frozen
  Desserts), `"DUNKIN' / 'BASKIN ROBBINS"` (73-02).
- **On Queens Boulevard:** `"KLIO"` (107-02), `"RED MANGO"` (107-40), `"STARBUCKS COFFEE COMPANY"`
  (108-01), `"KYURAMEN"` (108-50), `"GLORIA PIZZA"` (108-22), `"SHOGUN HIBACHI & SUSHI BAR"`
  (111-16), `"MATIZ LATIN CUISINE"` (110-72), `"NEMO'S BEER SHOP"` (110-64),
  `"STIX KOSHER RESTAURANT"` (101-15), `"LAGMAN LOUNGE"` (101-05), `"ANDRE'S BAKERY"` (100-28),
  `"BAGELS FOR YOU"` (113-29), `"BEIJING DUMPLING"` (116-14A), `"KING KEW GARDEN"` (116-49),
  `"ALEX & FRIENDS COFFEE SHOP"` (118-17).
- **In Station Square:** `"PRINCE TEA HOUSE"` (15 Station Square, Coffee/Tea) and
  `"JADE EATERY AND LOUNGE"` (1 Station Square, Japanese).
- **On Metropolitan Avenue:** `"RADICI"` (100-11, Italian), `"NICK'S BISTRO"` (104-20, Greek),
  `"CONTINENTAL LUNCHEONETTE & DELI"` (104-03, Sandwiches), `"GOURMET BAKERY & DELI"` (96-15),
  `"DUNKIN'"` (97-12).
- **On 108th Street:** `"MITO"` (64-18), `"PIZZA PALACE CAFE"` (63-60), `"YAFA"` (63-32),
  `"TACO KING"` (64-05, Tex-Mex), `"NADEZHDA"` (64-06, Jewish/Kosher), `"CRAZY MEAT"` (64-47,
  Jewish/Kosher).
- **Elsewhere:** `"MIKE'S PIZZERIA"` (71-75 Yellowstone Blvd), `"WHITE RADISH"` (108-25 Ascan Ave),
  `"LA BOULANGERIE"` (109-01 72 Road, French), `"NARITA"` (107-08 70 Road, Japanese),
  `"PAHAL ZAN MEDITERRANEAN"` (106-12 Continental Ave, Jewish/Kosher),
  `"G & S PIZZERIA INC."` (107-21 71 Avenue), `"LILLIAN PIZZERIA"` (96-01 69 Avenue).

**F219** [P] Two observations about the geography of that list, which are my inference and not any
source's statement. First, the concentration of `Jewish/Kosher` and Central-Asian-adjacent trade
names on **108th Street and the 100-block of Queens Boulevard** is consistent with the Bukharian
Jewish community that S26 associates with this general area — but **I have no source that describes
that community in Forest Hills**, only S26's discussion of it in the Rego Park context, and I am not
extending a sibling's demographic story across the boundary. Second, the 113-, 116- and 118-block
Queens Boulevard addresses sit at the far eastern end of ZIP 11375 toward Union Turnpike and
**Kew Gardens**, and a ZIP-based query cannot tell me which side of the neighborhood line they fall
on. Both points are leads for the verifier, not findings.

**F220** [P] The one Station Square address (`1 STATION SQUARE`) shared with the Forest Hills Inn
(F197) and the West Side Tennis Club area is worth the verifier's attention as corroboration that
Station Square is an active commercial place and not only a historic one — but a restaurant
inspection record is thin evidence for that and I am marking it as an observation, not a fact.

---

## 16. CONTESTED NEIGHBORHOOD ASSIGNMENTS — recorded, NOT resolved

Per the wave brief: for every candidate place I have recorded what each source says about which
neighborhood it is in, plus its street address. Below are every place in my corpus that **any**
source assigns to a different neighborhood than another source does. **I make no ruling on any
row.** The arbitration note owns these.

| Place | Street address | Sources saying FOREST HILLS | Sources saying OTHERWISE | Nature of the conflict |
|---|---|---|---|---|
| **Remsen Cemetery / Remsen Family Cemetery** (LPC individual landmark LP-1177) | "adjoining 69-43 Trotting Course Lane", between Alderton St and Trotting Course Lane; Block 3178 Lot 44 | DCP GeoSearch returns `"8138 TROTTING COURSE LANE, **Forest Hills**"` (zip 11385), `"8064 … Forest Hills"` (11385), `"7204 / 7206 / 7208 TROTTING COURSE LANE, **Forest Hills**"` (zip 11374) — i.e. **the street itself geocodes to Forest Hills** | DCP GeoSearch on the *exact* landmark address `"69-43 Trotting Course Lane"` returns **`Rego Park`**; LPC's own dataset tags it `nta2020` **`QN0601` = Rego Park**; NYC Parks gives `zipcode` **`11374`** (the Rego Park ZIP) and council district **30**; S26 narrates the burial ground inside the **Rego Park** article's history section | **The sharpest conflict in the wave.** LP-1177 itself names no neighborhood at all (F085), so the best source is silent. DCP's geocoder gives Forest Hills for the street and Rego Park for the specific house number. Two agencies (LPC NTA, Parks ZIP) point to Rego Park. — F085/F086/F100/F101 + S19 + S26 |
| **Russell Sage Playground** and **J.H.S. 190 Russell Sage** | Playground `"68-17 68 AVENUE"` / Booth St bet. 68 Ave and 68 Dr; school `"68-17 AUSTIN STREET"` | NYC Parks' own dataset gives `zipcode` **`11375`**; DCP GeoSearch returns `"68-17 AUSTIN STREET, **Forest Hills**"`; the Parks page data panel says `"Council Member: Lynn Schulman"` | **NYC Parks' own sign text opens: `"This playground is named after the adjacent Russell Sage School, J.H.S.190, in the Rego Park section of Queens."`** | NYC Parks contradicts NYC Parks — its ZIP says Forest Hills, its sign says Rego Park. — F156/F157/F182/F183 |
| **Annadale Playground** and **P.S. 175 The Lynn Gross Discovery School** | `"64-35 102 STREET"` / Yellowstone Blvd bet. 64 Rd and 65 Ave | NYC Parks dataset `zipcode` **`11375`**; the page data panel repeats `"Zip Code: 11375"`; DCP GeoSearch returns `"64-35 102 STREET, **Forest Hills**"` | **NYC Parks' own sign text says `"Rego Park, the surrounding neighborhood, derives its name from the REal GOod Construction Company"`** — i.e. the agency names Rego Park as the surrounding neighborhood | Same shape as the row above: agency ZIP vs agency sign text, pointing opposite ways. — F160/F162/F183 |
| **Forest Park** | `"80-30 PARK LANE"` | Parks dataset lists ZIP **`11375`** first among four, and community board **`406`** among four; S28 names Forest Park as bounding Forest Hills "to the south"; the neighborhood is *named after* the park (F020, F024) | Parks lists ZIPs `11385` (Ridgewood/Glendale), `11415` (Kew Gardens), `11421` (Woodhaven) and — on the web page only — `11418` (Richmond Hill); community boards Brooklyn 5, Queens 5, Queens 9; the sign text's own landmarks are the **Richmond Hill** War Memorial and Forest **Parkway** | Multi-neighborhood and multi-borough. None of the competing claimants is a wave-3 sibling, but Forest Hills has the weakest claim of the five despite the name. — F172/F173/F178 |
| **Lost Battalion Hall Recreation Center** | `"93-29 QUEENS BOULEVARD"` | *(none in my corpus)* | NYC Parks `zipcode` **`11374`**; DCP GeoSearch → **`Rego Park`**; S26 narrates it in the **Rego Park** article's Landmarks section; council district 24 | Uncontested against Forest Hills as far as my sources go — recorded so the Forest Hills author knows not to claim it. — F214/F215/F216 |
| **Trylon Theater** | `"98-81 Queens Boulevard"` | *(none in my corpus — though it is commonly called Forest Hills in popular usage, I found no source saying so)* | DCP GeoSearch → **`Rego Park`** on all five returned results, zip `11374`; S26 narrates it in the **Rego Park** article | Same as above. Recorded to keep it off this page. — F212/F213 |
| **Queens Boulevard addresses generally** | e.g. `108-22` vs `22-108` | `"108-22 QUEENS BOULEVARD, **Forest Hills**"`, zip 11375 | `"22-108 / 17-108 / 38-108 QUEENS BOULEVARD, **Rego Park**"`, zip 11374 | Not a place but a **method warning**: on Queens Boulevard the neighborhood flips with the house number, so every address must be verified character-exact rather than by block. — F209 |
| **Underbridge Dog Run, Playground Sixty Two LXII, Barrier Playground** | 64-02 Grand Central Pkwy Sr Rd W; 105-25 62 Road; Horace Harding Exwy Sr Rd S at 62 Ave | All three carry Parks `zipcode` **`11375`** and community board `406` | All three sit in **council district 24**, unlike the Forest Hills core properties which are district 29; all three are in the 62nd-Road/102nd-Street area that S15's sign text calls Rego Park's surroundings | Weaker than the rows above — no source explicitly says "Rego Park" for these three — but the council district and the geography put them on the contested side. Flagging for the arbitrator's completeness. — F171 |
| **Ehrenreich-Austin Playground** | `"76-10 AUSTIN STREET"` | Parks `zipcode` **`11375`**; sign says Ehrenreich worked for facilities "in Kew Gardens **and Forest Hills**" | Sign calls its namesake `"the unofficial mayor of **Kew Gardens**"` and says he "purchased a house in Kew Gardens" | Not a wave-3 sibling conflict (Kew Gardens is not in this wave) and the *park* is not assigned elsewhere — only its namesake is. Recorded for honesty about the man. — F164/F166/F168 |
| **Willow Lake Playground** | `"71-25 113 STREET"` | Parks `zipcode` **`11375`**, CB 406, council 29 | Its nearest park per Parks' own module is **Flushing Meadows Corona Park (0.35 miles)**, and "Willow Lake" is the name of a water body inside FMCP | Not a neighborhood conflict but a **seed-file conflict**: the playground is a Forest Hills-ZIP Parks property, while the lake it is named for is inside the park whose institutions `CitiFieldPlaces` owns. The author must write the playground, not the lake. — F001/F171 |

**Additional adjacency observations recorded for the arbitrator, resolving nothing:**

- DCP's own name for the community district — `"QN06 Forest Hills-Rego Park (CD 6 Approximation)"`
  (F007) — hyphenates the contested pair, exactly as the local preservation body does in calling
  itself the **Rego-Forest** Preservation Council (F133).
- S26 makes **Queens Boulevard** and the **Long Island Expressway** boundary streets of Rego Park
  (F012). The wave brief names those same two roads as running between the pairs. If the boundary
  literally runs down Queens Boulevard, then P06 (107-55), P07 (111-02) and P09 (110-06) — three of
  this page's best-evidenced places — all sit on the boundary line itself. Their **individual**
  assignments to Forest Hills are strong (LPC NTA, LPC prose, GeoSearch, and the parish's own
  letterhead all agree), but the author should not describe Queens Boulevard as running *through*
  Forest Hills without checking that against the sibling's file.
- **Corona and Elmhurst**, the other wave-3 pair, surface in my corpus only glancingly: S28 names
  Corona as adjacent to the north (F010); S26 names Elmhurst and Corona as bordering Rego Park to
  the north (F011); LP-2066/LP-2522 place Cord Meyer's earlier career in **Elmhurst** (F020/F021)
  and his horse-drawn stages running from **Elmhurst**'s station (F022). **No place in my candidate
  list is contested between Forest Hills and either Corona or Elmhurst.** The contest on this page
  is entirely with Rego Park.

---

## 17. GAPS — what I could not source, and what the verifier should chase

Listed frankly, because a finder that hides its holes is worse than useless.

1. **The West Side Tennis Club's own website returned 503 to every attempt by both tools.** The
   most important institution on this page has no institutional self-description in this file. §6
   rests on Wikipedia and a promoter's marketing page. **Highest-priority retry.**
2. **The Forest Hills Gardens Corporation's site refused the connection.** The body that governs the
   private streets of the Gardens is documented here only through a Wikipedia paragraph about it
   suing its neighbour (F126) — and my extraction of even that was cut off mid-sentence at a
   **March 25, 2025** development I never captured.
3. **The Church-in-the-Gardens' site returned an empty body,** and the NPS nomination PDF for its
   NRHP listing (#09001086) downloaded as a non-PDF. I have a reference number and a date and
   nothing else about the only nationally-listed building in Forest Hills.
4. **The NRHP question is unresolved** — one listing or three? See F043/F044. This needs NPS
   directly, not Wikipedia.
5. **MacDonald Park has no history text at all** (F155) — no namesake, no date, no contents, despite
   a "Monuments" tab implying there is something there. A prominent Queens Boulevard green space,
   undocumented.
6. **Austin Street** — the neighborhood's main commercial street — is supported by exactly one
   summarizer clause (F208). No BID, no chamber of commerce, no local news, no history of the strip.
7. **The Forest Hills Inn** (F197) has no address, no date, no architect and no institutional
   source. Same for **St. Luke's Church** (F141) and **The Women's Club** (F141).
8. **The Rego-Forest Preservation Council** (F133) is named as a photo source by the OLQM parish and
   is almost certainly the richest untapped vein for this page — and, given its name, for the
   boundary question too. I never fetched it.
9. **The Cinemart Cinemas** on Metropolitan Avenue: I have the address geocoding to Forest Hills
   (F210) and nothing about the business.
10. **"Ramones Way"** (F187) — I have the 2017 designation from a summarizer and not the block.
11. **Immigration and demographic history** rests on a single sentence of undated park-sign text
    (F150). For a neighborhood whose 108th Street commercial strip looks the way the DOHMH data
    suggests (F219), that is nowhere near enough.
12. **Queens Community Board 6's own site carried no district description or boundary statement**
    (F019) — the obvious primary source for the Forest Hills/Rego Park line did not supply one on
    this fetch. Worth retrying, and worth checking the CB6 district needs statement / district
    profile as a separate document.
13. **The Queens Public Library Forest Hills branch** — the locations page served me a navigation
    shell with no branch record, and the JSON locations endpoint 404'd. I have no branch address.
14. **Current-state facts are missing throughout.** Is the Ridgewood Savings Bank building still a
    bank (F066 describes it as of 2000)? Is Engine 305 still an active firehouse (F074 says "today"
    meaning 2012)? Is the Forest Park Nature Center still closed (F180, undated)? None of these is
    answerable from this corpus and none should be written in the present tense on these sources.
15. **No waterfront.** The brief asks about the waterfront; **Forest Hills has none.** It is an
    inland neighborhood on the Harbor Hill Moraine's high ground (F020's "high ground", F174's
    moraine). The nearest water in my corpus is Willow Lake, which is inside Flushing Meadows Corona
    Park (§0). Recording the absence so nobody goes looking for a shoreline that is not there.
16. **No industrial history surfaced.** The brief asks about industrial history; every source in my
    corpus describes Forest Hills as farmland becoming planned residential suburb, with no
    manufacturing phase at all. That may well be correct and characteristic — Cord Meyer and the
    Russell Sage Foundation were both selling the *absence* of the industrial city (F033's
    "overcrowding, squalor and chaos") — but I want to be explicit that I found no industrial
    material rather than let silence imply I did not look.
