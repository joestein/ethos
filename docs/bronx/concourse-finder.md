# Concourse — finder artifact

Role: FINDER only. No verdicts below. Every line is "source says X"; adjudication
(`confirmed`/`refuted`/`uncertain`) is for an independent verifier who has not
seen this reasoning.

`priv/seed_data/bronx/concourse.json` has not been authored yet. This file is
its input, alongside whatever verifier artifact follows it.

Roster: `priv/seed_data/bronx_roster.json`, slug `concourse`, community
district 4, wave 2, `in_scope: true`.

## Search access — report this first

**WebSearch was attempted once and confirmed unavailable.** Query issued:
"Grand Concourse Bronx Concourse neighborhood Art Deco history". Result:

> "Web search was not performed: this session has used its web search budget
> (200 of 200 WebSearch calls)."

Zero WebSearch queries succeeded. Everything below was gathered via WebFetch
against Wikipedia and the code-owned Yankee Stadium seed source. WebFetch
worked throughout this pass and was not throttled. `nycgovparks.org` and
`web.archive.org` were not attempted, per the dispatch's standing notes.

**A caveat on WebFetch itself in this pass:** several fetches were prompted to
return verbatim quotations but the tool's summarizing model instead returned
prose tables/paraphrases, and at least one of those (the "Grand Concourse
Historic District" fetch) stated Andrew Freedman Home was "later converted to
hotel," which directly contradicts the dedicated Andrew Freedman Home article
fetched independently (daycare/artists' hub, no hotel conversion mentioned).
That contradiction is flagged in place below and the hotel-conversion claim is
**not** carried into any place block. Treat any single-fetch paraphrase in
this file with more skepticism than a directly quoted sentence, and re-fetch
before confirming if the verifier needs the exact wording.

---

## Boundary check — read before anything else

Bronx Community District 4 has **four** roster rows: `highbridge` (out of
scope), `concourse` (in scope, this dispatch), `concourse-village` (out of
scope), and `mount-eden` (out of scope). Given this project's history —
`fordham-heights` scoped while Poe Cottage/Poe Park/Bronx Library Center sat in
`fordham-manor`; `pelham-bay` scoped while Orchard Beach/Bartow-Pell sat in
`pelham-bay-park` — this split was checked directly against sources before
anything else.

**Finding: no misboundary here. The landmarks the brief names for Concourse
are, per Wikipedia, actually inside the `Concourse, Bronx` neighborhood
article, not a neighboring row.**

- Wikipedia's own `Concourse, Bronx` article gives its boundaries as "East
  169th Street to the north, Webster Avenue to the east, East 149th Street to
  the south, and Jerome Avenue and Harlem River to the west," and states
  explicitly: "The neighborhood is divided into three subsections: West
  Concourse, East Concourse, and Concourse Village with the Grand Concourse
  being its main thoroughfare." — https://en.wikipedia.org/wiki/Concourse,_Bronx
  **Concourse Village is a subsection of Concourse in this source, not a
  separate area holding different landmarks** — so the `concourse-village`
  roster row being out of scope does not strand anything.
- The same article lists the Bronx County Courthouse, the Bronx Museum of the
  Arts, the Andrew Freedman Home, Yankee Stadium/Heritage Field, the Bronx
  Hall of Justice and the Bronx Terminal Market as landmarks "within Concourse."
  — same source
- Mount Eden is named as bordering Concourse to the north, and Highbridge to
  the west across Jerome Avenue/the Harlem River — same source. Neither was
  found to hold any of the brief's named landmarks; see the Park Plaza
  Apartments item below for the one candidate that does sit in Highbridge,
  correctly excluded on that basis.

**A second, more consequential boundary finding: two of the four landmarks
named in this dispatch's brief are already shipped, code-owned records under
the Yankee Stadium guide, not new Concourse places.**

- `lib/ethos/seeds/yankee_stadium_places.ex:122-133` already carries **Bronx
  County Courthouse**, slug `bronx-county-courthouse`, address "851 Grand
  Concourse, Bronx, NY", with the Art Deco/Classical Revival/Neo-Classical
  style clause, the 1976 NYC Landmark and 1983 NRHP dates, and the Hewlett
  murals.
- The same file at `:158-169` already carries **Bronx Museum of the Arts**,
  slug `bronx-museum-of-the-arts`, address "1040 Grand Concourse," founding,
  1983 move, 1988/2006 expansions, and current hours/admission.
- The same file at `:134-146` also already carries **Joyce Kilmer Park**
  (bounded by Grand Concourse, Walton Avenue, E164th and E161st Streets — squarely
  inside the Concourse boundary above) and, at `:170-181`, **Bronx Terminal
  Market**.
- Verified by direct grep of both `lib/ethos/seeds/yankee_stadium_places.ex`
  and `lib/ethos/seeds/yankee_stadium_guide.ex`: no hit for "Andrew Freedman"
  or "Concourse Plaza" or "1150 Grand Concourse" — those three are NOT
  code-owned and are the candidates written up below.

**Consequence for this guide: of the four things the brief names as "what
Concourse holds," only the Grand Concourse's Art Deco character and the
Andrew Freedman Home are actually available to write up as new places here.**
The Bronx Museum and the Bronx County Courthouse must not be re-created —
per the dispatch's own instruction on Yankee Stadium's code ownership, this
applies to them exactly as it applies to Yankee Stadium itself, since they are
in the same file. A verifier or author should link to the existing Yankee
Stadium guide rather than duplicate them, if the platform's link mechanism
supports cross-guide place references; that decision is outside this finder's
role.

---

## DOHMH-only count

**Zero.** No eatery or shop candidate was investigated in this pass — no
restaurant, cafe or shop name for Concourse surfaced in any source reached.
This is recorded honestly rather than papered over: the corridor's own
Wikipedia article names institutions and buildings, not businesses, and
without WebSearch there was no way to discover business names independently.
Flagged in Dead ends below as a real gap for a later pass with search access.

---

## Neighborhood-level history and orientation

- Concourse "is a neighborhood in the southwestern portion of the New York
  City borough of the Bronx." Boundaries: "East 169th Street to the north,
  Webster Avenue to the east, East 149th Street to the south, and Jerome
  Avenue and Harlem River to the west." — https://en.wikipedia.org/wiki/Concourse,_Bronx
- Bordered by Highbridge and the Harlem River to the west, Mount Eden to the
  north, Claremont Village/Melrose/Morrisania to the east, and Mott Haven to
  the south. — same source
- Part of Bronx Community Board 4; ZIP codes 10451 and 10452. — same source
- Policed by the NYPD's 44th Precinct, at 2 East 169th Street. — same source
- Centered on Grand Concourse and East 161st Street, in the southwestern South
  Bronx. — same source
- The neighborhood is divided into three subsections: West Concourse, East
  Concourse, and Concourse Village, with the Grand Concourse as its main
  thoroughfare. — same source
- 2010 Census combined population of the neighborhood's two census tabulation
  areas: 101,566, over 855.37 acres; 62.2% Hispanic/Latino, 32.7% African
  American, 1.6% White, 1.8% Asian. — same source
- The IRT Jerome Avenue Line "opened a decade later in 1917 and spurred
  enormous development" in the area. — same source
- The neighborhood experienced decline after 1960, with population rebounding
  starting in the 1990s. — same source
- Yankee Stadium's replacement opened in 2009; the former stadium was
  demolished, and Heritage Field, a public park, now occupies the site. —
  same source **(both Yankee Stadium and Heritage Field are code-owned in
  `yankee_stadium_places.ex`; not to be re-created here.)**
- The Bronx Hall of Justice opened in 2007. — same source
- The Bronx Terminal Market shopping center reopened in 2009. — same source
  **(code-owned in `yankee_stadium_places.ex`; not to be re-created here.)**

### The Grand Concourse

- The Grand Concourse is a 5.2-mile (8.4 km) thoroughfare designed by Louis
  Aloys Risse, an immigrant from Saint-Avold, France, who "first conceived of
  the road in 1890, as a means of connecting the borough of Manhattan to the
  northern Bronx." — https://en.wikipedia.org/wiki/Grand_Concourse_(Bronx)
- Construction spanned 1894–1909, with a southward extension completed in
  1927; it measures 180 feet wide for most of its length, in three
  tree-lined roadways with medians that prevented minor streets from
  crossing. — same source
- Modeled on the Champs-Élysées in Paris "but is considerably larger"; the
  project cost $14 million (about $541.8 million in current dollars, per the
  source's own conversion). — same source
- "By mid-1930s, almost three hundred apartment buildings had been
  constructed along the Concourse," in "many of the finest examples of Art
  Deco and Art Moderne architecture in the United States." By 1939 it was
  called "the Park Avenue of middle-class Bronx residents." — same source
- "In 1934, almost 99% of residences had private bathrooms, and 95% had
  central heating." — same source
- The boulevard declined through disinvestment, urban renewal and redlining
  in the 1960s–70s; the median was "replaced with cement that was painted
  green" during this period. A "Special Grand Concourse Preservation
  District" was created in 1989, and the corridor has seen new residential
  development and gentrification since the 2000s (examples given: 425 and
  276 Grand Concourse). — same source
- The Grand Concourse passes through Bedford Park, Concourse, Highbridge,
  Fordham, Mott Haven, Norwood and Tremont — i.e., it is a multi-neighborhood
  spine, not exclusive to Concourse. — same source

### Grand Concourse Historic District

- Designated a New York City Landmarks Preservation Commission historic
  district on October 25, 2011 (Designation No. 2403), covering "Grand
  Concourse from 153rd to 167th Streets" — a span that sits entirely inside
  the Concourse neighborhood's own 149th–169th boundary. — https://en.wikipedia.org/wiki/Grand_Concourse_Historic_District
- Listed on the National Register of Historic Places August 24, 1987
  (reference no. 87001388); the NRHP nomination itself lists buildings at
  addresses "730–1000, 1100–1520, 1560, and 851–1675 Grand Concourse" — a
  wider span than the 2011 NYC district, running well north of Concourse's
  own boundary. — same source, corroborated independently by
  https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_the_Bronx,
  which separately gives "Grand Concourse Historic District, 730–1675 Grand
  Concourse, August 24, 1987 (#87001388)."
- Styles: "Late 19th and 20th Century Revivals, Art Deco," buildings
  "Customarily five or six stories high with wide entrance courtyards
  bordered with grass and shrubs," among "the finest examples of Art Deco and
  Art Moderne architecture in the United States." — https://en.wikipedia.org/wiki/Grand_Concourse_Historic_District
- **Flag for the verifier:** a WebFetch pass over this article returned a
  table naming individual buildings "south to north" including the Bronx
  General Post Office (558), Bronx County Courthouse (851), Bronx Museum of
  the Arts (1040), Andrew Freedman Home (1125), a "Fish Building" (1150),
  Loew's Paradise Theater (2403), the Dollar Savings Bank Building
  (2516–2530), and Poe Cottage (2640). **Addresses above roughly 1675–2640 are
  well north of Concourse's own 169th-Street boundary and belong to other
  neighborhoods** (Loew's Paradise and Poe Cottage in particular — Poe Cottage
  is separately on record elsewhere in this programme as sitting in
  Fordham Manor, not a Concourse-adjacent row). Only addresses in the
  558–1150 range fall inside or at the edge of Concourse; the higher
  addresses are listed here only to show the source's full span, not as
  Concourse candidates.
- **"Fish Building" at 1150 Grand Concourse has no dedicated Wikipedia
  article** — `en.wikipedia.org/wiki/Fish_Building` returns HTTP 404 — and no
  other source was reached for it in this pass. Not written up as a place;
  see Dead ends.

---

## Getting there

**Subway.**
- The IRT Jerome Avenue Line's **161st Street–Yankee Stadium** station is
  served by the 4 train "at all times," the B train "weekdays only," and the D
  train "all except rush hours, peak direction," at East 161st Street and
  River Avenue; Wikipedia's own station statistics place this station in
  both **Highbridge and Concourse**. — https://en.wikipedia.org/wiki/161st_Street%E2%80%93Yankee_Stadium_(IRT_Jerome_Avenue_Line)
- **167th Street** on the IRT Jerome Avenue Line, at 167th Street and River
  Avenue, is served by the 4 "at all times," and Wikipedia places it in
  **Concourse and Highbridge**. — https://en.wikipedia.org/wiki/167th_Street_(IRT_Jerome_Avenue_Line)
- **167th Street** on the IND Concourse Line, at East 167th Street and Grand
  Concourse, is served by the B (weekdays only) and D (all times except rush
  hours in the peak direction), and Wikipedia places it in **Highbridge and
  Concourse**. — https://en.wikipedia.org/wiki/167th_Street_(IND_Concourse_Line)
- The main Concourse neighborhood article separately names the same stations
  as serving the neighborhood: "161st Street–Yankee Stadium and 167th Street"
  on the IRT Jerome Avenue Line (4 train), and "161st Street and 167th Street"
  on the IND Concourse Line (B and D trains). — https://en.wikipedia.org/wiki/Concourse,_Bronx

**Metro-North.**
- **Yankees–East 153rd Street** station is served daily by Metro-North's
  Hudson Line, with "selected trains on the Harlem and New Haven lines also
  stop[ping] at this station on game days"; Wikipedia's infobox places it at
  "Exterior Street, Concourse, Bronx, Highbridge, New York" — i.e., **inside
  Concourse** (jointly with Highbridge). — https://en.wikipedia.org/wiki/Yankees%E2%80%93East_153rd_Street_station
- **Melrose** station, on Metro-North's Harlem Line, sits "at its intersection
  with East 162nd Street" along Park Avenue, in "an open cut beneath Park
  Avenue"; Wikipedia places this station in the **Melrose neighborhood**, not
  Concourse. — https://en.wikipedia.org/wiki/Melrose_station **This is the
  Case-B proximity pattern: Melrose station is the nearer Metro-North option
  the Concourse article itself names, but it sits in a different named
  neighborhood, so it must be presented as "the nearest Metro-North station,
  in Melrose," not as Concourse's own.**

**Bus.**
- Bx1 and Bx2 "share the majority of their alignment from the Grand Concourse
  and 149th Street north along the Concourse." Bx1's termini: Mott Haven–138th
  Street to Riverdale–231st Street. Bx2's termini: Mott Haven–138th Street to
  Kingsbridge Heights–Fort Independence Street. Both run through Concourse.
  — https://en.wikipedia.org/wiki/Bx1_(New_York_City_bus)
- The main Concourse article separately lists Bx1, Bx2, Bx6, Bx13, Bx35 and
  BxM4 as serving the neighborhood via Grand Concourse, 161st Street, 163rd
  Street and Ogden Avenue. — https://en.wikipedia.org/wiki/Concourse,_Bronx

**Ferry — dead end, not a claim.** Checked Wikipedia's own NYC Ferry article
for every Bronx landing by name: only Soundview and Throggs Neck/Ferry Point
Park are listed. Neither serves Concourse, Highbridge, Mott Haven or Mount
Eden; the article's only mention of this area is a 2011 planning study that
considered, but did not implement, routes toward "the South Bronx." —
https://en.wikipedia.org/wiki/NYC_Ferry

---

## Places

### 1. Andrew Freedman Home

**What it is:** A former charitable retirement home, now an artists'/community
hub, at 1125 Grand Concourse. `searched: complete`

- Address: 1125 Grand Concourse, Bronx. — https://en.wikipedia.org/wiki/Andrew_Freedman_Home
- Architects Joseph H. Friedlander and Harry Allan Jacobs; plans filed 1922,
  construction started 1924, building opened 1924; two wings added 1928–1931.
  — same source
- Style described as "French and Italian Renaissance style with soft gray and
  yellow limestone." — same source
- Andrew Freedman, described as a self-made millionaire who feared losing his
  fortune during the Panic of 1907, died in 1915 leaving a $4 million estate
  that funded the home, "intended to serve as a retirement home for 'aged and
  indigent persons of both sexes,' who had formerly been of 'good
  circumstances' financially." Residents originally lived rent-free with free
  servants. — same source
- Designated a New York City Landmark in 1992 (independently corroborated as
  June 2, 1992 by the boroughwide landmarks list, see below). — same source
- The founding trust was depleted by the 1960s; the Mid Bronx Senior Citizens
  Council purchased the building in 1982 and "reopened the Home in 1983 as a
  residence for the elderly and poor." — same source
- As of the source's own account, it currently functions as a daycare center,
  event space, and artists' hub with residency programs, workshops and
  exhibitions. — same source
- **Flag, not carried into a claim:** a separate WebFetch pass over the
  "Grand Concourse Historic District" article's building list characterized
  this property as "later converted to hotel." That claim appears nowhere in
  the Andrew Freedman Home's own dedicated article, which instead describes
  the 1983 elder-residence reopening and the present-day artist-hub use with
  no hotel phase mentioned. Not published; flagged for the verifier as a
  likely fetch-summarization error, not re-resolved here.
- Independent corroboration of the 1992 NYC Landmark designation: the
  boroughwide list gives "Andrew Freedman Home... Designated: June 2, 1992."
  — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx

### 2. Concourse Plaza Hotel

**What it is:** A former luxury hotel at Grand Concourse and East 161st
Street, now senior housing. `searched: complete`

- Location given as "Grand Concourse and East 161st Street, Concourse
  neighborhood, the Bronx" — i.e., Wikipedia's own article places this
  explicitly inside Concourse. — https://en.wikipedia.org/wiki/Concourse_Plaza_Hotel
- Groundbreaking 1922; opened October 22, 1923, as a 12-story luxury hotel.
  — same source
- At its opening, Governor Al Smith said: "After seeing this new structure, I
  am convinced that anything can go in the Bronx." — same source
- Facilities included a grand ballroom, four banquet halls, two
  meeting/dinner rooms, two kitchens (one kosher), and — per the source — "a
  sub-basement rifle range." — same source
- Guests are named by the source as including Babe Ruth, Mickey Mantle, Roger
  Maris and Frank Gifford; it hosted presidential campaign stops, including a
  JFK campaign event in November 1960, and Tito Puente's band played New
  Year's Eve dances there. — same source
- Purchased by New York City government in 1974 and converted to senior
  citizens' housing, which the source states is its current use. — same
  source
- The building appeared in the films *Marty* (1955), *The Catered Affair*
  (1957), and *Gloria* (1980), per the same source.
- **No architect is named by the source reached in this pass.**

---

## Candidates investigated and NOT included — read before re-researching these

- **Bronx County Courthouse** (851 Grand Concourse) — extensively documented
  by Wikipedia, but **already code-owned** as slug `bronx-county-courthouse`
  in `lib/ethos/seeds/yankee_stadium_places.ex`. Do not re-create.
- **Bronx Museum of the Arts** (1040 Grand Concourse) — same treatment,
  code-owned as slug `bronx-museum-of-the-arts`. Do not re-create.
- **Joyce Kilmer Park** (Grand Concourse/Walton Ave/E164th/E161st) — same
  treatment, code-owned. Do not re-create.
- **Bronx Terminal Market** (610 Exterior Street) — same treatment,
  code-owned. Do not re-create.
- **"Fish Building"** (1150 Grand Concourse) — named only inside a
  WebFetch-summarized table of the Grand Concourse Historic District article;
  its own Wikipedia article (`Fish_Building`) 404s, and no other source was
  reached. Not included; no independent material to write it up on.
- **Park Plaza Apartments** (1005 Jerome Avenue) — a prominent Art Deco
  apartment building, Art Deco, architects Horace Ginsberg and Marvin Fine,
  completed 1931, NYC Landmark May 12, 1981 (NYCL No. 1077), NRHP June 3, 1982
  (ref. 82003346) — https://en.wikipedia.org/wiki/Park_Plaza_Apartments_(New_York).
  **Its own dedicated article's categories place it in Highbridge, not
  Concourse**, even though Jerome Avenue is Concourse's western boundary line.
  A second, separate WebFetch summarization pass (over the boroughwide NRHP
  list) guessed it was "located in Concourse neighborhood, near Grand
  Concourse area" — a parenthetical inference, not a quoted source statement,
  and weaker evidence than the dedicated article's own categorization. Not
  included as a Concourse place on that basis; flagged as a genuine boundary
  question for the verifier rather than resolved here.
- **Loew's Paradise Theater** (2403 Grand Concourse) and **Poe Cottage** (2640
  Grand Concourse) — both named inside the wider Grand Concourse corridor
  material, but both addresses are well north of Concourse's own 149th–169th
  Street boundary. Not included; Poe Cottage in particular is on record
  elsewhere in this programme as belonging to a different roster row
  entirely.
- **Mott Avenue Control House** — surfaced only inside a WebFetch-summarized
  table of the boroughwide NRHP listings page, given as "149th St. and Grand
  Concourse," May 6, 1980. "Mott Avenue" is not a street name that appears
  anywhere else in any source reached for this neighborhood, and the name
  itself is otherwise associated with a different part of New York City
  entirely (Far Rockaway, Queens). This reads as a plausible
  summarization/mislabeling error by the fetch tool rather than a confirmed
  fact, and it is **not carried forward as a claim at all** — not even as an
  uncertain one — pending a direct re-fetch with a verbatim-quote check.
- **Eateries/shops generally** — no candidate name was discovered in any
  source reached in this pass. See Dead ends.

## Dead ends — for a later pass, not for publication

- `en.wikipedia.org/wiki/Fish_Building` — HTTP 404.
- `nycgovparks.org` — not attempted this pass, per the dispatch's standing
  note that it has 403'd on six prior passes.
- `web.archive.org` — not attempted this pass, per the dispatch's standing
  note that the tool refuses it outright.
- No eatery, cafe, bar or shop name for Concourse was discoverable via
  WebFetch alone; without WebSearch there was no way to surface local business
  names independently of a source that already names them. A later pass with
  search access should specifically hunt for businesses along Grand Concourse
  or East 161st/163rd Streets, then run any names found against DOHMH per the
  provenance rule.
- The "Mott Avenue Control House" claim above — needs a direct, non-summarized
  re-fetch of the boroughwide NRHP listings page before it can be treated as
  even an uncertain fact.
- The Andrew Freedman Home "converted to hotel" claim — needs the same
  direct re-fetch treatment; likely a fetch-summarization artifact, not
  re-resolved here.

## Dedup check against the existing corpus (rung b, site-builder.md §7)

Checked all three shipped Bronx JSON files directly (`belmont.json`,
`bronx-park.json`, `mott-haven.json`) and both Yankee Stadium code modules
(`yankee_stadium_places.ex`, `yankee_stadium_guide.ex`) by grep for "1125
grand concourse," "andrew freedman," "1150 grand concourse," "fish building,"
"joyce kilmer," "851 grand concourse," "1040 grand concourse," and "concourse
plaza." Results:

- **851 Grand Concourse, 1040 Grand Concourse, and "Joyce Kilmer"** all hit —
  confirmed code-owned in the Yankee Stadium files, per the Boundary check
  section above. Neither of the two places written up in this file collides.
- **"Andrew Freedman" and "Concourse Plaza"** returned no hits anywhere in the
  corpus. Both are new.
- `mott-haven.json` independently carries "558 Grand Concourse" (the Bronx
  General Post Office) — a different address from anything considered here,
  no collision.
- No `highbridge.json`, `concourse-village.json` or `mount-eden.json` exists
  yet in `priv/seed_data/bronx/` (all three are out-of-scope roster rows), so
  there is no risk of colliding with a file that does not exist.

## Summary counts

- Places researched and written up with citations: **2** — Andrew Freedman
  Home, Concourse Plaza Hotel. Both `searched: complete`.
- **DOHMH-only eateries: 0.** No eatery candidate was discoverable at all in
  this pass; see Dead ends.
- **Boundary finding (the required check):** no roster-row misassignment
  found — Concourse Village is a sub-area of Concourse per Wikipedia, not a
  separate landmark-holding row, so nothing was stranded there. The
  consequential finding instead concerns *code* ownership, not roster rows:
  two of the four landmarks the dispatch brief named (Bronx County Courthouse,
  Bronx Museum of the Arts) plus two more found along the way (Joyce Kilmer
  Park, Bronx Terminal Market) are already shipped under the Yankee Stadium
  guide in `lib/ethos/seeds/yankee_stadium_places.ex` and must not be
  re-created for this guide.
- Distinct sourced claims across the neighborhood-level, Grand Concourse,
  historic-district, transit, and place sections: **approximately 55**
  individual citation lines.
- Transit claims: **subway (3 stations named, each independently confirmed as
  sitting in Concourse by Wikipedia's own station articles), Metro-North (1
  station in Concourse, 1 nearby station explicitly in a different
  neighborhood — Case B), bus (2 routes with termini plus 4 more named), ferry
  (dead end, stated plainly)** — roughly 12 individual transit citation lines.
- Flags left open for the verifier: the Andrew Freedman Home "hotel
  conversion" claim (likely fetch-summarization error); the Park Plaza
  Apartments neighborhood assignment (Highbridge per its own article's
  categories vs. a weaker "near Concourse" guess elsewhere); the "Mott Avenue
  Control House" claim (not even carried as uncertain, needs direct
  re-fetch); and the complete absence of any eatery/shop candidate for this
  neighborhood, which a later WebSearch-enabled pass should address.
