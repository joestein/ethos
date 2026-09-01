# Riverdale — finder artifact

Role: FINDER only. No verdicts below. Every line is "source says X"; adjudication
(`confirmed`/`refuted`/`uncertain`) is for an independent verifier who has not
seen this reasoning.

`priv/seed_data/bronx/riverdale.json` has not been authored yet. This file is
its input, alongside whatever verifier artifact follows it.

Roster: `priv/seed_data/bronx_roster.json`, slug `riverdale`, community
district 8, wave 3, `in_scope: true`.

## Search access — report this first

**WebSearch was attempted once and confirmed unavailable.** Query issued:
"Riverdale Bronx Wave Hill Fieldston Historic District". Result:

> "Web search was not performed: this session has used its web search budget
> (200 of 200 WebSearch calls)."

Zero WebSearch queries succeeded. Everything below was gathered via **WebFetch**
against Wikipedia and the institution's own site (one attempt). WebFetch worked
throughout and was not throttled — no rate-limit or block response was received
on any of the roughly 20 fetches made in this pass. `nycgovparks.org` was not
attempted, per the dispatch's note that it has 403'd on six prior passes.
`web.archive.org` was not attempted, per the dispatch's note that the tool
refuses it outright.

`searched: complete` for every place and section below unless individually
marked otherwise.

---

## Boundary check — read before anything else

The dispatch requires checking every roster row adjacent or similar to
`riverdale` before writing anything up as this neighborhood's own. Community
District 8 rows in the roster, with scope status:

| slug | in_scope | note |
|---|---|---|
| `kingsbridge` | true | separate wave-3 assignment, not this file |
| `van-cortlandt-village` | false | not researched here |
| `spuyten-duyvil` | false | **holds a landmark this brief named as Riverdale's** — see finding 1 below |
| `riverdale` | true | this file |
| `fieldston` | false | **Wikipedia's own framing conflicts with the roster split** — see finding 2 |
| `north-riverdale` | false | **holds Fonthill Castle / the university per its own Wikipedia article** — see finding 3 |
| `van-cortlandt-park` | true | separate wave-3 assignment, not this file |

### Finding 1 — the Henry Hudson Bridge and its Monument source to Spuyten Duyvil, not Riverdale

The dispatch brief listed "the Henry Hudson Bridge and Monument" among what
Riverdale holds. Sources do not support that placement cleanly:

- The Henry Hudson Bridge's own Wikipedia article states it "connects Spuyten
  Duyvil in the Bronx with Inwood in Manhattan to the south, via the Henry
  Hudson Parkway," and its locale section names "Spuyten Duyvil, Bronx" as the
  Bronx-side landing, not Riverdale. —
  https://en.wikipedia.org/wiki/Henry_Hudson_Bridge
- The Spuyten Duyvil, Bronx Wikipedia article states "the north end of the
  Henry Hudson Bridge connects the neighborhood to the island of Manhattan via
  the Henry Hudson Parkway" and separately places the **Henry Hudson
  Monument** — "a 16-foot bronze statue of Henry Hudson sculpted by Karl
  Bitter and Karl Gruppe on top of a 100-foot Doric column by architect Walter
  Cook," dedicated January 6, 1938 — inside Henry Hudson Memorial Park, within
  Spuyten Duyvil. — https://en.wikipedia.org/wiki/Spuyten_Duyvil,_Bronx
- The same Spuyten Duyvil article does note "some consider it to be the
  southernmost part of Riverdale" — a loose, contested framing, not a firm
  placement. — same source
- Riverdale's own Wikipedia article independently confirms the boundary is
  unsettled on this side: "its eastern and southern boundaries are frequently
  disputed," and gives Riverdale's southern edge as "either the Harlem River
  or the Spuyten Duyvil neighborhood." — https://en.wikipedia.org/wiki/Riverdale,_Bronx

**Conclusion for the verifier: the primary, specific sourcing puts both the
bridge and the monument in Spuyten Duyvil, a separate roster row not in scope
for this file. Not written up as a Riverdale place below.** This is reported
as a finding, not worked around, per the dispatch's instruction.

### Finding 2 — Fieldston Historic District: Wikipedia calls Fieldston part of Riverdale, but the roster splits it into its own out-of-scope row

- Fieldston's own Wikipedia article opens: "Fieldston is a privately owned
  affluent neighborhood **in the Riverdale section** of the northwestern part
  of the New York City borough of the Bronx." —
  https://en.wikipedia.org/wiki/Fieldston,_Bronx
- Riverdale's own Wikipedia article lists Fieldston as one of Riverdale's
  internal subsections: "south of West 250th Street, east of the Henry Hudson
  Parkway." — https://en.wikipedia.org/wiki/Riverdale,_Bronx
- Against that, the borough-wide NYC landmarks list categorizes the Fieldston
  Historic District's location as "Fieldston," not "Riverdale," distinct from
  how it categorizes Wave Hill, Fonthill Castle, Christ Church and Riverdale
  Presbyterian Church, all of which it labels "Riverdale." —
  https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- The roster (`priv/seed_data/bronx_roster.json`) carries `fieldston` as its
  own row, community district 8, `in_scope: false` — meaning no wave is
  currently tasked with researching Fieldston as its own guide.

**This is reported as a finding for the coordinator to resolve, not decided
here.** The dispatch brief's own framing ("What Riverdale holds… the Fieldston
and Riverdale historic districts") anticipates including it; Wikipedia's own
neighborhood description supports treating Fieldston as part of greater
Riverdale; the roster and the borough-wide landmarks list both treat it as
administratively distinct. The Fieldston Historic District is written up below
**with this conflict flagged inline**, not silently folded in.

### Finding 3 — Fonthill Castle / the university sources to North Riverdale, not Riverdale, in one article and to Riverdale in two others

- The North Riverdale, Bronx Wikipedia article lists "College of Mount Saint
  Vincent" directly under a heading of landmarks "in North Riverdale proper,"
  and separately states "the northernmost point in NYC is located at the
  Hudson River on the campus of the College of Mount Saint Vincent" as a
  North Riverdale geographic feature. —
  https://en.wikipedia.org/wiki/North_Riverdale,_Bronx
- Fonthill Castle's dedicated Wikipedia article gives its address as "W. 261st
  St. and Riverdale Ave." — https://en.wikipedia.org/wiki/Fonthill_Castle_and_the_Administration_Building_of_the_College_of_Mount_St._Vincent
  — and North Riverdale's own article gives North Riverdale's boundary as
  "particularly above 254th Street," which 261st Street falls inside.
- Against that: the University of Mount Saint Vincent's own Wikipedia article
  states the institution "is situated in Riverdale, Bronx," not North
  Riverdale — https://en.wikipedia.org/wiki/University_of_Mount_Saint_Vincent
  — and Riverdale's own article claims the same landmark: "the neighborhood
  contains the city's northernmost point at the University of Mount Saint
  Vincent." — https://en.wikipedia.org/wiki/Riverdale,_Bronx
- The borough-wide NYC landmarks list also categorizes "Fonthill Castle
  (College Library), College of Mount St. Vincent" under location "Riverdale."
  — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx

**Three sources (Riverdale's own article, the university's own article, the
borough-wide landmarks list) place it in Riverdale; one source (North
Riverdale's own article) places it in North Riverdale specifically, using an
address that falls inside North Riverdale's own stated boundary.** Written up
below as a Riverdale place on the 3-1 sourcing balance, with this conflict
flagged for the verifier rather than resolved here.

### No conflict found for these

- **Wave Hill** — every source locates it in "the Hudson Hill section of
  Riverdale" (https://en.wikipedia.org/wiki/Wave_Hill) or simply "Riverdale"
  (landmarks list). Hudson Hill has no separate roster row. No conflict.
- **Riverdale Historic District** — Riverdale's own article places it "in the
  northwest of the neighborhood"; the landmarks list categorizes it
  "Riverdale." No conflict found.
- **Riverdale Park** — sourced as "a park along the Hudson River in Riverdale,
  The Bronx." Its northern tip touches the 254th Street line that North
  Riverdale's article uses as its own southern boundary marker, but no source
  fetched in this pass assigns any part of the park itself to North Riverdale,
  Fieldston, or Spuyten Duyvil by name. No conflict found; not flagged further.

---

## No eateries or shops investigated in this pass

The dispatch brief's list of what Riverdale holds names only institutional
landmarks (Wave Hill, the historic districts, the park, the bridge/monument,
Fonthill Castle/the college). No restaurant, cafe or shop candidates were
searched for or found in this pass. **DOHMH-only count: 0 — not because none
exist, but because none were investigated.** A later pass should search
Riverdale Avenue and Johnson Avenue commercial strips for eatery candidates if
the guide needs them for tier purposes.

---

## Neighborhood-level history and orientation

- Riverdale is bordered "by Yonkers to the north, Van Cortlandt Park and
  Broadway to the east, the Kingsbridge neighborhood to the southeast, either
  the Harlem River or the Spuyten Duyvil neighborhood to the south… and the
  Hudson River to the west." — https://en.wikipedia.org/wiki/Riverdale,_Bronx
- "Riverdale's boundaries are disputed," and "its eastern and southern
  boundaries are frequently disputed." — same source
- Riverdale covers approximately 2.714 square miles (7.03 km²). — same source
- Riverdale "has one of the highest elevations in New York City, affording it
  views of the Empire State Building, George Washington Bridge, Hudson River
  and New Jersey Palisades." — same source
- The article divides Riverdale into internal subsections: Fieldston ("south
  of West 250th Street, east of the Henry Hudson Parkway"), Hudson Hill
  ("above West 246th Street and west of Henry Hudson Parkway"), North
  Riverdale ("above West 254th Street and west of Fieldston Road"), Mosholu
  ("East of Fieldston Road and above West 254th Street"), Central Riverdale
  (Manhattan College Parkway to West 232nd Street), Spuyten Duyvil/South
  Riverdale ("below West 232nd Street or West 239th Street"), and Villanova
  Heights (bounded by Fieldston Road, 250th Street, and Henry Hudson
  Parkway). — same source
- Until the later 19th century, Riverdale, Kingsbridge and other northwest
  Bronx areas "were part of the Town of Yonkers." — https://en.wikipedia.org/wiki/Kingsbridge,_Bronx
- Fieldston's development: Major Joseph Delafield purchased 250 acres in 1829
  and named the area after his family's Irish estate; the Delafield family
  laid out lots in 1909, following the extension of the IRT subway to Van
  Cortlandt Park–242nd Street; civil engineer Albert E. Wheeler designed
  streets to follow the land's contours rather than a grid; "the first house
  was begun in 1910 and finished in 1911." — https://en.wikipedia.org/wiki/Fieldston,_Bronx
- In 1923, after 80 houses were completed in Fieldston, the Fieldston
  Property Owners' Association formed, and it still owns the neighborhood's
  streets and common areas today. — same source
- In 1938, the NYC Planning Commission "approved a special zoning district"
  for Fieldston prohibiting multiple-family buildings. — same source
- ZIP codes: "10463 and 10471," with "10471 entirely in Riverdale" while
  "10463 also covers the adjacent neighborhoods of Kingsbridge, Bronx, and
  Marble Hill, Manhattan." — https://en.wikipedia.org/wiki/Riverdale,_Bronx
- Population "was 47,850 as of the 2000 United States census" per the same
  article, which separately cites a lower 2010 count of 27,860 without
  reconciling the two figures in this pass — flagged for the verifier as an
  internal inconsistency in the source, not resolved here.

---

## Getting there

**Subway.** The Van Cortlandt Park–242nd Street station, at the intersection
of 242nd Street and Broadway, is "the northern terminal station" of the IRT
Broadway–Seventh Avenue Line and "is served by the 1 train at all times." It
serves the "Fieldston," "Kingsbridge," and "Riverdale" neighborhoods by name.
It opened August 1, 1908, was designed by Heins & LaFarge, and "is the only
remaining Victorian Gothic elevated terminal station on the subway"; it was
listed on the National Register of Historic Places in 2005. —
https://en.wikipedia.org/wiki/Van_Cortlandt_Park%E2%80%93242nd_Street_station

**Metro-North.** Riverdale's own article states two Hudson Line stations serve
it: "Spuyten Duyvil station at Edsall Avenue" and the "Riverdale station…
between West 254th and 255th Streets." — https://en.wikipedia.org/wiki/Riverdale,_Bronx
The Riverdale station's own dedicated article gives its full name as
"Riverdale station (also known as Riverdale–West 254th Street station)," its
address as "Railroad Terrace and West 254th Street," and states it is "the
northernmost Metro-North station in New York City on the Hudson Line." —
https://en.wikipedia.org/wiki/Riverdale_station_(Metro-North)
**Flag for the verifier:** Spuyten Duyvil station's own dedicated article
locates it in "the Spuyten Duyvil neighborhood of the Bronx," not Riverdale —
https://en.wikipedia.org/wiki/Spuyten_Duyvil_station — consistent with
Finding 1 above. Riverdale's own article nonetheless claims it as one of "two"
stations serving Riverdale. Report both; do not silently pick one.

**Bus.** Riverdale's own article lists "multiple MTA routes (Bx1, Bx7, Bx9,
Bx10, Bx20, BxM1-3, BxM18) plus Bee-Line routes to Westchester County" serving
the area. — https://en.wikipedia.org/wiki/Riverdale,_Bronx

**Ferry — dead end, not a claim.** The NYC Ferry Wikipedia article names no
route or landing anywhere in Riverdale, Spuyten Duyvil, Kingsbridge or the
northwest Bronx. It does note, as history rather than current service: the
"2011 Comprehensive Citywide Ferry Study identified potential ferry routes to
western Manhattan and Riverdale" among locations it studied, with no
indication this was ever implemented. — https://en.wikipedia.org/wiki/NYC_Ferry

---

## Places

### 1. Wave Hill

**What it is:** A public horticultural garden and cultural center on a
28-acre estate overlooking the Hudson River. `searched: complete`

- "Wave Hill is a 28-acre (11 ha) estate in the Hudson Hill section of
  Riverdale in the Bronx, New York City," at "West 249th Street and
  Independence Avenue." — https://en.wikipedia.org/wiki/Wave_Hill
- "The original Wave Hill House was a gray fieldstone mansion built in 1843 by
  lawyer William Lewis Morris." — same source
- William Henry Appleton owned it "from 1866 to 1903" and "enlarged the house
  in between 1866 and 1869 and again in 1890." — same source
- George Walbridge Perkins, "a partner of J. P. Morgan," purchased it "in
  1903." — same source
- "In 1960… the Perkins-Freeman family deeded Wave Hill to the City of New
  York." — same source
- Thomas Henry Huxley visited during Appleton's ownership; Theodore
  Roosevelt's family rented the estate during the summers of 1870 and 1871;
  Mark Twain leased it from 1901 to 1903; Arturo Toscanini lived there from
  1942 to 1945. — same source
- "Wave Hill currently consists of public horticultural gardens and a cultural
  center," with "two houses and a botanical garden." — same source
- Added to the National Register of Historic Places in 1983; the borough-wide
  NYC landmarks list separately gives "Wave Hill House" a NYC designation
  date of June 21, 1966. — https://en.wikipedia.org/wiki/Wave_Hill and
  https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- "On an annual basis, about 65,000 people visit Wave Hill." —
  https://en.wikipedia.org/wiki/Wave_Hill

### 2. Riverdale Historic District

**What it is:** A 15-acre residential historic district in Riverdale.
`searched: complete`

- Riverdale's own article describes it as a 15-acre district "in the
  northwest of the neighborhood, designated in 1990." —
  https://en.wikipedia.org/wiki/Riverdale,_Bronx
- The borough-wide NYC landmarks list separately gives its designation date as
  October 16, 1990, categorized under location "Riverdale." —
  https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- No dedicated Wikipedia article was found under this title in this pass; no
  further architectural or boundary detail beyond the two facts above was
  located.

### 3. Fieldston Historic District

**What it is:** A historic residential district covering most of the
Fieldston neighborhood. `searched: complete`. **See Finding 2 above: sources
disagree on whether "Fieldston" is part of Riverdale or a distinct,
separately-rostered neighborhood; written up here on the balance described
there, not as a settled fact.**

- "On January 10, 2006, the New York City Landmarks Preservation Commission
  designated the majority of the Fieldston neighborhood as a historic
  district. The district contains 252 houses and related structures." —
  https://en.wikipedia.org/wiki/Fieldston,_Bronx
- The borough-wide NYC landmarks list independently confirms the same
  designation date, January 10, 2006, categorized under location "Fieldston."
  — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- The district is "noted for its rural atmosphere, large houses and abundance
  of trees," featuring Tudor Revival, Colonial Revival, Medieval Revival,
  Mediterranean Revival, Norman Revival, Georgian Revival, and Dutch Colonial
  Revival architecture. — https://en.wikipedia.org/wiki/Fieldston,_Bronx
- Fieldston's total area is "0.426 square miles (1.10 km²)," with a 2011
  population of 3,292. — same source
- Streets and common areas within the district "are owned by the Fieldston
  Property Owners' Association, Inc." — same source

### 4. Riverdale Park

**What it is:** A linear park along the Hudson River. `searched: complete`

- "Riverdale Park is a park along the Hudson River in Riverdale, The Bronx,
  New York City." It is "approximately 1.5 miles (2.4 km) long and one block
  wide," averaging "9 meters above sea level." —
  https://en.wikipedia.org/wiki/Riverdale_Park_(Bronx)
- The park runs along Palisade Avenue between 254th Street and 232nd Street,
  with an entrance at Dodge Lane (247th Street). — same source
- "The main sections of the park, from north to south, are The North Woods,
  The Fishing Trail, Dodge Lane, The Oak Forest… and the South End." — same
  source
- The park was "originally planned as a neighborhood centerpiece but remained
  undeveloped"; in the 1940s the Delafield, Dodge, Douglas, and Perkins
  families donated land to New York City with a requirement that it be kept
  natural; it was established as a "special natural area" in the 1950s. —
  same source
- Wave Hill created a Learning Center connected to the park in 1981 and began
  the "Riverdale Park Project" in 1983, developing a Natural Sciences Program
  in 1984. — same source
- "It is adjacent to the grounds of Wave Hill." — same source

### 5. Fonthill Castle and the College/University of Mount Saint Vincent

**What it is:** A Gothic Revival former estate house, now part of a college
campus. `searched: complete`. **See Finding 3 above: one source places this on
the campus specifically within North Riverdale, a separately-rostered,
out-of-scope neighborhood; three other sources place it in Riverdale
generally.** Folded into one place record per the dispatch's sub-attraction
rule — the castle has no independent access, address, or ticketing apart from
the campus.

- "Fonthill Castle was built in 1852 as the country estate of Shakespearean
  actor Edwin Forrest and his wife, the actress Catherine Norton Sinclair." —
  https://en.wikipedia.org/wiki/Fonthill_Castle_and_the_Administration_Building_of_the_College_of_Mount_St._Vincent
- It is "a Gothic Revival style building consisting of a cluster of six
  octagonal towers at varying heights, built of hammered grey stone." The name
  derives from "William Beckford's Gothic Fonthill Abbey in England." — same
  source
- "A sketch of Fonthill's octagons among the papers of Alexander Jackson Davis
  suggests that he had some part in its design, although it has also been
  attributed to Thomas C. Smith." — same source
- Forrest later sold the property to the Sisters of Charity of New York, "who
  relocated the Academy of Mount Saint Vincent from McGowan's Pass." — same
  source
- "The castle has served as a convent, chapel, museum, chaplain's residence,
  and the college library. It later came to house the admissions office of
  the College of Mount Saint Vincent." — same source
- Address given as "W. 261st St. and Riverdale Ave." Listed on the National
  Register of Historic Places July 11, 1980, reference number 80002585. —
  same source
- The borough-wide NYC landmarks list separately gives "Fonthill Castle
  (College Library), College of Mount St. Vincent" a NYC designation date of
  March 15, 1966. — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- The university's own Wikipedia article: "the castle housed the university's
  library from 1942 to 1968" and "is currently vacant." —
  https://en.wikipedia.org/wiki/University_of_Mount_Saint_Vincent
- **Name change:** "In 2024, the college was renamed the University of Mount
  Saint Vincent," previously known as "College of Mount Saint Vincent
  (1911–2023)." Founded in 1847 "as the Academy of Mount Saint Vincent, a
  school for women," becoming a degree-granting institution and taking the
  "College" name in 1911. Affiliated with the Sisters of Charity of New York,
  a Roman Catholic organization. — same source
- The institution's own Wikipedia article states it "is situated in
  Riverdale, Bronx." — same source

### 6. Christ Church (Riverdale/Fieldston)

**What it is:** A Victorian Gothic Revival Episcopal church complex.
`searched: complete`. **Address discrepancy flagged below — not resolved
here.**

- Fieldston's own article describes "Christ Church (5030 Henry Hudson Parkway
  East): Victorian Gothic Revival structure from 1865-66," naming it as a
  landmark located "within Fieldston." — https://en.wikipedia.org/wiki/Fieldston,_Bronx
- The National Register of Historic Places listings page for the Bronx
  independently lists a "Christ Church Complex" at "5030 Riverdale Ave.,"
  listed September 8, 1983, reference number 83001637, categorized under
  location "Riverdale." — https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_the_Bronx
- The borough-wide NYC landmarks list separately gives "Christ Church" a NYC
  designation date of January 11, 1967, also categorized under location
  "Riverdale." — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- **Flag for the verifier, not resolved here:** the Fieldston source and the
  two borough-wide lists disagree both on the street address (Henry Hudson
  Parkway East vs. Riverdale Ave.) and on which neighborhood it belongs to
  (Fieldston vs. Riverdale). No dedicated Wikipedia article for the church
  itself was reachable in this pass (`Christ_Church_(Riverdale,_Bronx)`
  404'd) to adjudicate between them.

### 7. Riverdale Presbyterian Church

**What it is:** A Gothic Revival Presbyterian church. `searched: complete`.
**Same location flag as Christ Church above.**

- Fieldston's own article describes "Riverdale Presbyterian Church (4763
  Henry Hudson Parkway): Gothic Revival from 1863-64," naming it as located
  "within Fieldston." — https://en.wikipedia.org/wiki/Fieldston,_Bronx
- The borough-wide NYC landmarks list separately gives "Riverdale Presbyterian
  Church" a NYC designation date of April 19, 1966, categorized under location
  "Riverdale," not Fieldston. — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- No dedicated Wikipedia article for the church itself was reachable in this
  pass (`Riverdale_Presbyterian_Church` 404'd); no address-format
  reconciliation was possible beyond the two sources above, which do not
  conflict on the address itself, only on which neighborhood name to attach.

### 8. William E. Dodge House

**What it is:** An individually NRHP-listed house. `searched: complete`.

- Address "690 W. 247th St.," listed on the National Register of Historic
  Places August 28, 1977, reference number 77000934, categorized under
  location "Riverdale." — https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_the_Bronx
- No dedicated Wikipedia article was found; no further descriptive detail
  located in this pass.

### 9. Robert Colgate House

**What it is:** An individually NRHP-listed house. `searched: complete`.

- Address "5225 Sycamore Ave.," listed on the National Register of Historic
  Places September 8, 1983, reference number 83001638, categorized under
  location "Hudson Hill, Bronx" (a Riverdale subsection named in Riverdale's
  own article, not a separate roster row). —
  https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_the_Bronx
- No dedicated Wikipedia article was found; no further descriptive detail
  located in this pass.

---

## Candidates investigated and NOT included — read before re-researching these

- **Henry Hudson Bridge and Henry Hudson Monument** — sourced to Spuyten
  Duyvil, a separate out-of-scope roster row, not Riverdale. See Finding 1.
  Not written up as Riverdale places.
- **Gaelic Park** — named in Riverdale's own article ("Located at West 240th
  Street, owned by Manhattan University since 1991"), but not pursued further
  in this pass given the brief's explicit landmark list did not name it, and
  time budget was directed at the named candidates and the boundary check
  instead. Flagged here for a later pass, not excluded on any negative
  finding.
- **Bell Tower Park / Riverdale Monument** — Riverdale's own article names a
  "stone war memorial built in 1930… designed by architect Dwight James Baum"
  inside Bell Tower Park, but no dedicated article or second source was
  pursued in this pass. Not written up; flagged for a later pass.

## Dead ends

- `https://en.wikipedia.org/wiki/Fonthill_Castle_(Bronx,_New_York)` — HTTP 404
  (wrong guessed title; correct title found via the disambiguation page is
  "Fonthill Castle and the Administration Building of the College of Mount
  St. Vincent").
- `https://en.wikipedia.org/wiki/Riverdale,_Tennessee` — reached accidentally
  when guessing at a "Riverdale Historic District" title; this is an unrelated
  Knox County, Tennessee community and has no bearing on Bronx Riverdale.
  Not used for any claim above.
- `https://en.wikipedia.org/wiki/Christ_Church_(Riverdale,_Bronx)` — HTTP 404.
- `https://en.wikipedia.org/wiki/Riverdale_Presbyterian_Church` — HTTP 404.
- No dedicated "Riverdale Historic District" Wikipedia article was found under
  that or any guessed title; all facts on it above come from the Riverdale,
  Bronx article and the borough-wide landmarks list.
- `nycgovparks.org` — not attempted, per the dispatch's standing note (403'd
  six prior passes).
- `web.archive.org` — not attempted, per the dispatch's standing note (tool
  refuses it outright).

## Dedup check against the existing corpus (rung b, site-builder.md §7)

Checked the shipped Bronx files directly:
`priv/seed_data/bronx/belmont.json`, `priv/seed_data/bronx/bronx-park.json`,
`priv/seed_data/bronx/mott-haven.json`, and `priv/seed_data/bronx/city-island.json`.
A case-insensitive grep for "wave hill," "fieldston," "fonthill," "riverdale,"
and "mount saint vincent" across all four returned no matches. No existing
place record anywhere in the corpus collides with any address or institution
named above.

## Summary counts

- Places researched and written up with citations: **9** — Wave Hill,
  Riverdale Historic District, Fieldston Historic District, Riverdale Park,
  Fonthill Castle/University of Mount Saint Vincent, Christ Church, Riverdale
  Presbyterian Church, William E. Dodge House, Robert Colgate House. All
  `searched: complete`.
- **DOHMH-only places: 0** — no eateries or shops were investigated in this
  pass (see the dedicated note above); this is a scope statement, not a claim
  that none exist.
- Distinct sourced claims across the neighborhood-level, transit, and place
  sections: **approximately 70** individual citation lines.
- Transit claims: **subway (1 station named, with full designation history),
  Metro-North (2 stations named, with a boundary flag on one), bus (7 MTA
  routes plus Bee-Line service named), ferry (dead end, stated plainly, with
  one historical planning-study detail)** — roughly 15 individual
  transit-related citation lines.
- WebSearch: attempted once, confirmed exhausted (0 of 200 available);
  everything above is WebFetch-sourced.
- **Boundary findings: three**, all requiring verifier/coordinator attention
  — (1) the Henry Hudson Bridge and Monument source to Spuyten Duyvil, not
  Riverdale, contrary to the dispatch brief's framing; (2) the Fieldston
  Historic District sits in a neighborhood Wikipedia calls part of Riverdale
  but the roster splits into its own out-of-scope row; (3) Fonthill
  Castle/the university is claimed by both Riverdale's own article and
  (specifically) North Riverdale's own article, with the address favoring
  North Riverdale's stated boundary but three of four sources favoring
  Riverdale.
- Additional flags left open for the verifier: an internal population
  discrepancy in Riverdale's own Wikipedia article (47,850 for 2000 vs.
  27,860 for 2010, both stated without reconciliation); an address/
  neighborhood-name conflict on both Christ Church and Riverdale Presbyterian
  Church between the Fieldston article and the two borough-wide lists.
