# Van Cortlandt Park — finder artifact

Role: FINDER only. No verdicts below. Every line is "source says X"; adjudication
(`confirmed`/`refuted`/`uncertain`) is for an independent verifier who has not
seen this reasoning.

`priv/seed_data/bronx/van-cortlandt-park.json` has not been authored yet. This
file is its input, alongside whatever verifier artifact follows it.

Roster: `priv/seed_data/bronx_roster.json`, slug `van-cortlandt-park`,
community district 8, wave 3, `in_scope: true`.

## Search access — report this first

**WebSearch was attempted once and confirmed unavailable.** Query issued:
"Van Cortlandt House Museum history Bronx". Result:

> "Web search was not performed: this session has used its web search budget
> (200 of 200 WebSearch calls). Continue with the information already
> gathered instead of issuing more searches."

Zero WebSearch queries succeeded. Everything below was gathered via WebFetch
against Wikipedia only. `nycgovparks.org` was not attempted, per the
dispatch's note that it has 403'd on six prior passes. `web.archive.org` was
not attempted, per the dispatch's note that the tool refuses it outright.
WebFetch worked throughout and was not throttled.

## Boundary check — read before anything else

The roster carries `van-cortlandt-park` as its own standalone row (community
district 8, wave 3, `in_scope: true`) — it is **not** split across two rows
the way `fordham-heights`/`fordham-manor` and `pelham-bay`/`pelham-bay-park`
were, so the specific failure mode that misplaced Poe Cottage and the
Bartow-Pell Mansion in those two prior neighborhoods does not have an obvious
twin here. Still checked explicitly, row by row, against every CD8 neighbor
on the roster (`kingsbridge`, `van-cortlandt-village`, `riverdale`, plus
non-scoped `spuyten-duyvil`, `fieldston`, `north-riverdale`) and the CD12
neighbor `woodlawn`:

- **Van Cortlandt House Museum, Vault Hill, the golf course, the parade
  ground, and Van Cortlandt Lake all sit inside the park's own boundaries**,
  per the park's dedicated Wikipedia article, not inside any neighboring
  NTA. — https://en.wikipedia.org/wiki/Van_Cortlandt_Park
- **Riverdale** is described as bordered by "Van Cortlandt Park and Broadway
  to the east" — the park is Riverdale's boundary, not Riverdale's contents.
  No source fetched attributes Van Cortlandt House, Vault Hill, or the golf
  course to Riverdale. — https://en.wikipedia.org/wiki/Riverdale,_Bronx
- **Kingsbridge** is bounded by "Manhattan College Parkway to the north, the
  Major Deegan Expressway or Bailey Avenue to the east, West 230th Street to
  the south, and Irwin Avenue to the west" — a bounding box that does not
  reach the park. No park feature is attributed to Kingsbridge in its
  article; the only Van Cortlandt-named thing placed there is the NYPL's Van
  Cortlandt branch library at 3882 Cannon Place, a library, not a park
  feature. — https://en.wikipedia.org/wiki/Kingsbridge,_Bronx
- **Van Cortlandt Village** is explicitly described as bordered by "Van
  Cortlandt Park to the north" and as a neighborhood the park "abuts," with
  its own article stating plainly that park features (golf course, trails)
  belong to the park, not to the neighborhood. — https://en.wikipedia.org/wiki/Van_Cortlandt_Village,_Bronx
- **Woodlawn Cemetery is not a Van Cortlandt Park feature.** Woodlawn
  Heights is described as bounded by "Woodlawn Cemetery to the south" and
  "Van Cortlandt Park to the west" — two distinct, adjacent, non-overlapping
  landmarks. The cemetery belongs administratively with the neighboring
  Woodlawn/Woodlawn Heights area (roster: `woodlawn`, in_scope true),
  **not with this row**, and is not written up below. — https://en.wikipedia.org/wiki/Woodlawn_Heights,_Bronx
- **One genuine ambiguity survives and is flagged, not resolved:** Mosholu
  Golf Course. The Van Cortlandt Park Wikipedia article lists "Mosholu
  Links" as one of the park's two golf courses. But the dedicated Mosholu
  Golf Course article independently states it is located "in Van Cortlandt
  Park in the Woodlawn neighborhood of the Bronx" and sits adjacent to the
  Woodlawn subway station on the Jerome Avenue Line — i.e. at the park's
  northeastern edge, nearest the `woodlawn` roster row rather than the
  park's core. Written up below under this row (matching the park's own
  article, which claims it as a park feature), but flagged explicitly for
  the verifier given the second source's neighborhood attribution. —
  https://en.wikipedia.org/wiki/Van_Cortlandt_Park and
  https://en.wikipedia.org/wiki/Mosholu_Golf_Course

**No DOHMH-only exclusions apply to this file.** No restaurant, food vendor
or retail establishment was investigated for this neighborhood — Van
Cortlandt Park's candidate places are a house museum, a golf course, a lake,
trails, a historic battle site, and a water-infrastructure plant, none of
which are DOHMH inspection subjects. DOHMH-only count: **0**.

---

## Neighborhood-level history and orientation

- Van Cortlandt Park is 1,146 acres (464 hectares), the third-largest park
  in New York City, in the Bronx. — https://en.wikipedia.org/wiki/Van_Cortlandt_Park
- In 1691, Jacobus Van Cortlandt purchased the land from John Barrett. —
  same source
- In 1699, Van Cortlandt dammed Tibbetts Brook, creating what became Van
  Cortlandt Lake as a mill pond. — same source
- Frederick Van Cortlandt built the Van Cortlandt House starting in 1748
  (completed after his death). — same source
- The property was used during the American Revolution, 1776–1783; George
  Washington used it as a headquarters. — same source
- The Van Cortlandt family sold the property to the City of New York in
  1888, converting it to public parkland. — same source
- Van Cortlandt Golf Course opened July 6, 1895, described by the source as
  "the country's first and oldest public golf course." — same source
- Between the 1930s and 1955, Robert Moses directed construction of the
  Henry Hudson Parkway and Mosholu Parkway, fragmenting the park into six
  pieces. — same source
- The 1975 NYC fiscal crisis caused park deterioration. — same source
- A "Van Cortlandt Park Master Plan 2034" was published in 2014. — same
  source
- The park is operated by the NYC Department of Parks and Recreation,
  assisted by the Van Cortlandt Park Alliance. — same source
- Tibbetts Brook originates in Yonkers, runs through culverts, and feeds
  Van Cortlandt Lake. — same source
- The park recorded 301 bird species since 1875, and mammals including
  white-tailed deer, raccoons, Eastern coyotes, and wild turkeys. — same
  source
- The Old Croton Aqueduct (1837–1955 in service) and the New Croton
  Aqueduct (opened 1890) both run historically through the park area. —
  same source

---

## Getting there

**Subway.** Van Cortlandt Park–242nd Street station, at West 242nd Street
and Broadway, is served exclusively by the 1 train on the IRT
Broadway–Seventh Avenue Line and is that line's northern terminal ("the
next stop to the south is 238th Street"); the station sits adjacent to Van
Cortlandt Park to the east, on the border of the Fieldston and Kingsbridge
neighborhoods. — https://en.wikipedia.org/wiki/Van_Cortlandt_Park%E2%80%93242nd_Street_station

- That station opened August 1, 1908, as part of the Contract 1 system,
  designed by Heins & LaFarge in Victorian Gothic style, described as "the
  only elevated terminal station left in that style from Contract 1"; it
  was added to the National Register of Historic Places March 30, 2005
  (NRHP reference #05000226). — same source, cross-checked against
  https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_the_Bronx
- The station is currently not ADA-accessible; a contract for one elevator
  was awarded December 2023, with construction anticipated to complete in
  2026. — https://en.wikipedia.org/wiki/Van_Cortlandt_Park%E2%80%93242nd_Street_station
- Connecting buses at that station: NYCT Bx9, MTA Bus BxM3, and Bee-Line
  Routes 1, 2, and 3. — same source
- Separately, Woodlawn station on the IRT Jerome Avenue Line is served by
  the 4 train "at all times" and is that line's northern terminal; it sits
  at Bainbridge Avenue and Jerome Avenue, described by the source as being
  in the Norwood neighborhood, "outside Woodlawn Cemetery" rather than
  inside the Woodlawn neighborhood itself — and is described as adjacent to
  the park's Mosholu Golf Course. — https://en.wikipedia.org/wiki/Woodlawn_(IRT_Jerome_Avenue_Line)
  and https://en.wikipedia.org/wiki/Mosholu_Golf_Course
- That station opened April 15, 1918, built by the Interborough Rapid
  Transit Company as part of the Dual Contracts, and was listed on the
  National Register of Historic Places following 2005 renovations for its
  ornamental concrete design. It is not currently ADA-accessible, though
  the MTA announced in July 2025 it would install elevators there. —
  https://en.wikipedia.org/wiki/Woodlawn_(IRT_Jerome_Avenue_Line)
- Connecting buses at that station: NYCT Bx16 and Bx34, MTA Bus BxM4, and
  Bee-Line Routes 4, 20, and 21. — same source
- The park's own Wikipedia article separately lists its subway access as
  "Woodlawn (4 train)" and "Van Cortlandt Park–242nd Street (1 train)." —
  https://en.wikipedia.org/wiki/Van_Cortlandt_Park

**Bus.** The park's own article lists local routes Bx9, Bx10, Bx16, and
Bx34; express routes BxM3 and BxM4; and Bee-Line (Westchester County)
Routes 1, 2, 3, 4, 20, and 21 as serving the park. —
https://en.wikipedia.org/wiki/Van_Cortlandt_Park

**Metro-North — dead end, not a claim.** No source fetched in this pass
states that any Metro-North station serves Van Cortlandt Park directly. The
park's own Wikipedia article's transit-access section names only subway and
bus, no Metro-North. A Metro-North Harlem Line station named "Woodlawn"
exists nearby at 555 East 233rd Street, but its own dedicated article does
not mention Van Cortlandt Park, Van Cortlandt House, or any park feature —
it is described only in relation to the Woodlawn neighborhood and "Woodlawn
Junction," where the New Haven Line splits from the Harlem Line. Not
claimed as serving this park. —
https://en.wikipedia.org/wiki/Woodlawn_station_(Metro-North)

**Ferry — dead end, not a claim.** No source fetched in this pass names any
NYC Ferry landing near Van Cortlandt Park; the park is inland and no ferry
route was searched for or found serving it.

**Former rail access.** The New York and Putnam Railroad's main line passed
through the park; "skeletal remains of Van Cortlandt station in Van
Cortlandt Park" still exist, along with a milepost marker showing the
former railbed. Main-line passenger service ended May 29, 1958. The former
right-of-way north of the old Van Cortlandt station was converted into the
Putnam Greenway, South County Trailway, North County Trailway, and Putnam
County Trailway rail trails — the same corridor that becomes the park's own
Putnam Trail. — https://en.wikipedia.org/wiki/New_York_and_Putnam_Railroad

---

## Places

### 1. Van Cortlandt House (Van Cortlandt House Museum)

**What it is:** A Georgian-style stone house in the park, built by the Van
Cortlandt family, now an historic house museum. `searched: complete`

- Built 1748–1749 by Frederick Van Cortlandt, who died before its
  completion; his son James inherited it. —
  https://en.wikipedia.org/wiki/Van_Cortlandt_House
- Architectural style: Georgian, 2½ stories, dressed fieldstone with
  rubblestone facade, L-shaped with wings extending south and east. —
  same source
- Located in the southwestern corner of Van Cortlandt Park, near the
  Riverdale neighborhood. — same source
- Described by the park's own article as "the oldest known surviving house
  in the Bronx." — https://en.wikipedia.org/wiki/Van_Cortlandt_Park
- Used by both Patriot and British forces during the American Revolution;
  the source describes it as serving as "Washington's headquarters after
  his troops were defeated in the 1776 Battle of Long Island." British
  General William Howe made it his headquarters on November 13, 1776;
  Washington stayed there again prior to the Battle of White Plains and
  returned in 1781 and 1783. — https://en.wikipedia.org/wiki/Van_Cortlandt_House
- Acquired by New York City in 1888 as part of the Van Cortlandt Park
  purchase; it initially served as a police/military barracks before
  opening to the public as a museum on May 28, 1897. — same source
- As of 2023, operated by the National Society of Colonial Dames in the
  State of New York. — same source
- Designated a NYC Landmark (exterior/facade) March 15, 1966, and an
  interior landmark July 22, 1975 — cross-checked against a second,
  independent Wikipedia page listing Bronx landmarks, which gives the same
  two dates for "Van Cortlandt Mansion" and "Van Cortlandt Mansion
  Interior." — https://en.wikipedia.org/wiki/Van_Cortlandt_House and
  https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- Listed on the National Register of Historic Places December 24, 1967,
  and separately designated a National Historic Landmark on the same date,
  December 24, 1976, per the source's own two entries. —
  https://en.wikipedia.org/wiki/Van_Cortlandt_House
- Notable interior features per the source: keystones above windows
  carved as "grotesque masks" depicting Van Cortlandt family members;
  multiple fireplaces with Dutch tiles; a U-shaped stairway in the front
  hall with "turned balusters" and carved woodwork. — same source

### 2. Vault Hill

**What it is:** The Van Cortlandt family burial ground within the park.
`searched: complete` (no dedicated Wikipedia article exists; sourced only
from the park's own article)

- Vault Hill is a family burial ground created in 1749. —
  https://en.wikipedia.org/wiki/Van_Cortlandt_Park
- It contains the remains of Frederick Van Cortlandt. — same source
- No dedicated Wikipedia article exists for Vault Hill on its own
  (`en.wikipedia.org/wiki/Vault_Hill` returns HTTP 404); no independent
  second source was reached in this pass beyond the park's own article.
  Nothing about a Revolutionary War records-hiding legend or public
  access/hours was found in any source fetched — not claimed.

### 3. Van Cortlandt Golf Course

**What it is:** A public 18-hole golf course within the park.
`searched: complete`

- Opened in 1895 as a nine-hole course; expanded to 18 holes by 1899;
  clubhouse constructed in 1902. — https://en.wikipedia.org/wiki/Van_Cortlandt_Golf_Course
- Described by this dedicated article as "the oldest public golf course in
  the United States." — same source
- Operated by the New York City Department of Parks & Recreation as a
  public facility. — same source
- The clubhouse locker room served as a filming location for the 1987 film
  *Wall Street*. — same source
- Informally known as "Vanny" or "Vannie." — same source
- **Discrepancy flagged, not resolved:** the park's own general Wikipedia
  article separately states the course was "expanded to 18 holes by Tom
  Bendelow" and renovated in 2016, and dates the golf course's opening to
  "July 6, 1895" specifically — details the dedicated golf-course article
  does not corroborate (it names no designer and gives no 2016 renovation).
  — https://en.wikipedia.org/wiki/Van_Cortlandt_Park

### 4. Mosholu Golf Course

**What it is:** A public 9-hole golf course, described by the park's own
article as a Van Cortlandt Park feature. `searched: complete` — see the
Boundary check section above for an unresolved neighborhood-attribution
flag.

- Opened in 1914; originally designed as an 18-hole course, now nine holes
  after being reduced by road construction in the neighborhood. —
  https://en.wikipedia.org/wiki/Mosholu_Golf_Course
- Includes a driving range and putting green that, per the source, "also
  function as a water treatment plant." — same source
- Adjacent to the Woodlawn station on the IRT Jerome Avenue Line (4
  train). — same source
- The park's own article separately calls this course "Mosholu Links,
  opened 1914." — https://en.wikipedia.org/wiki/Van_Cortlandt_Park

### 5. Van Cortlandt Lake

**What it is:** A freshwater lake within the park, created as a millpond.
`searched: complete` (no dedicated Wikipedia article; sourced from the
park's own article)

- Described as "the largest freshwater lake in the Bronx." —
  https://en.wikipedia.org/wiki/Van_Cortlandt_Park
- 4–8 feet deep, 18 acres in area. — same source
- Created in 1699 when Jacobus Van Cortlandt dammed Tibbetts Brook to power
  a sawmill/gristmill. — same source
- Faced severe pollution issues in the 1960s–1980s; restoration efforts
  began in 1978. — same source
- Fish species recorded in the lake: largemouth bass, carp, perch, and
  catfish. — same source

### 6. Putnam Trail

**What it is:** A rail-trail through the park on the former New York and
Putnam Railroad right-of-way. `searched: complete`

- 1.5 miles, described by the park's own article as "easy" difficulty;
  connects to the South County Trailway. — https://en.wikipedia.org/wiki/Van_Cortlandt_Park
- Reconstructed 2019–2020. — same source
- The former railbed it follows carried the New York and Putnam Railroad,
  whose main-line passenger service ended May 29, 1958; "skeletal remains
  of Van Cortlandt station" and a milepost marker showing the former
  railbed still exist in the park. — https://en.wikipedia.org/wiki/New_York_and_Putnam_Railroad
- The former right-of-way north of the old Van Cortlandt station was
  converted into the Putnam Greenway, South County Trailway, North County
  Trailway, and Putnam County Trailway rail trails. — same source

### 7. Old Croton Aqueduct Trail (through the park)

**What it is:** A section of the historic aqueduct's route, now a trail,
passing through the park. `searched: complete`

- The park's own article lists this trail at 1.1 miles, "easy/moderate"
  difficulty. — https://en.wikipedia.org/wiki/Van_Cortlandt_Park
- The Old Croton Trail "enters New York City on the eastern side of Van
  Cortlandt Park" before continuing through the Bronx. —
  https://en.wikipedia.org/wiki/Old_Croton_Aqueduct
- The aqueduct itself was built 1837–1842; water began flowing June 22,
  1842, with public opening October 14, 1842; the original system's
  service ended in 1955, with portions reopened in 1987. — same source
- Listed on the National Register of Historic Places December 2, 1974, and
  designated a National Historic Landmark April 27, 1992, with that
  designation "extended to cover the aqueduct's route in the Bronx." —
  same source

### 8. John Kieran Nature Trail

**What it is:** A nature trail within the park. `searched: complete` (no
dedicated Wikipedia article; sourced from the park's own article)

- 1.25 miles, "easy" difficulty; opened in 1987. —
  https://en.wikipedia.org/wiki/Van_Cortlandt_Park
- Features "13 stone pillars ... tested for the facade of Grand Central
  Terminal." — same source

### 9. Parade Ground

**What it is:** A large open lawn within the park, historically used for
military drill. `searched: complete` (no dedicated Wikipedia article;
sourced from the park's own article)

- Originally grain fields, converted to a sprawling lawn. —
  https://en.wikipedia.org/wiki/Van_Cortlandt_Park
- Used by the National Guard for brigade practice; hosted recreational
  facilities and concerts. — same source
- Restored using construction-mitigation funds from the Croton Water
  Filtration Plant project (see below). — same source

### 10. Croton Water Filtration Plant

**What it is:** An underground water-filtration facility built beneath the
park's Mosholu Golf Course driving range. `searched: complete`

- Built 160 feet underground beneath the Mosholu Golf Course in Van
  Cortlandt Park. — https://en.wikipedia.org/wiki/Croton_Water_Filtration_Plant
- Construction ran 2007–2015; activated May 2015. — same source
- Originally projected at $800 million, the final cost reached $3.2
  billion due to delays and community opposition; a contemporary source
  headline is quoted as "Plan to Put Filtration Plant Under Park Angers the
  Bronx." — same source
- Processes up to 320 million gallons per day, filtering water from the
  Croton Aqueduct system to remove 99.9% of Giardia, Cryptosporidium, and
  viruses, supplying approximately 10% of NYC's water system. — same
  source
- Measures 830 by 550 feet, described by the source as larger than Yankee
  Stadium. — same source
- To mitigate construction disruption, the city restored the Van Cortlandt
  Park Parade Ground and built the Sachkerah Woods Playground using
  construction-mitigation funds. — same source

### 11. Indian Field (Stockbridge Indian Massacre site)

**What it is:** A Revolutionary War battle site within the park, marked by
a memorial. `searched: complete`

- The park's own article states Indian Field is the site where the
  Stockbridge militia was "destroyed" by Queen's Rangers in 1778, and that
  a stone memorial was placed there in 1906. —
  https://en.wikipedia.org/wiki/Van_Cortlandt_Park
- A dedicated article on the battle states it occurred in August 1778 at
  "Indian Field" within Van Cortlandt Park, approximately one mile north
  of Kingsbridge. — https://en.wikipedia.org/wiki/Stockbridge_Indian_massacre
- The Stockbridge Militia — a Native American unit of Mohican, Wappinger,
  Munsee, Tunxis, Shawnee, and Housatonic peoples serving the Continental
  Army under Jehoiaikim Mtohksin and Abraham Nimham — was attacked by the
  Queen's Rangers, a Loyalist cavalry unit commanded by Lieutenant Colonel
  John Graves Simcoe, in a sudden cavalry charge. — same source
- Survivors were discharged by George Washington's order in September
  1778, paid $1,000 for their service. — same source
- **Casualty-count discrepancy, not resolved here:** the park's own
  article states "38 Indians killed," while the dedicated battle article
  states "approximately 40" Stockbridge militia killed (with 1 Queen's
  Ranger killed and 3 wounded). — https://en.wikipedia.org/wiki/Van_Cortlandt_Park
  and https://en.wikipedia.org/wiki/Stockbridge_Indian_massacre
- The dedicated battle article does not mention the 1906 memorial; that
  detail comes only from the park's own article. Not resolved here.

---

## Candidates investigated and NOT included — read before re-researching these

- **Woodlawn Cemetery** — investigated as a candidate for this row because
  of its adjacency, but every source fetched places it administratively
  with the Woodlawn/Woodlawn Heights neighborhood (roster: `woodlawn`), not
  with Van Cortlandt Park. See Boundary check above. Not written up here.
- **Sachkerah Woods Playground** — named only once, in passing, inside the
  Croton Water Filtration Plant article, as a mitigation-funded project in
  the park's southeast corner. No dedicated article found
  (`en.wikipedia.org/wiki/Sachkerah_Woods_Playground` not attempted for
  time; flagged rather than fetched). Not written up as its own place for
  lack of independent material in this pass.
- **Van Cortlandt Stadium** — named only once, in the park's own article,
  as "added in 1939." No dedicated article found or attempted. Not written
  up as its own place for lack of independent material.
- **Colonial Garden / Shakespeare Garden** — the park's own article states
  both were "demolished by the end of the 1930s." Not a current place; not
  written up.
- **John Muir Trail** and **Cass Gallagher Nature Trail** — both named only
  in the park's own article (1.5 miles/moderate, established 1997; and 1.4
  miles/moderate-difficult, respectively), with no dedicated Wikipedia
  article found or attempted for either. Not written up as independent
  place blocks for lack of a second source in this pass; flagged here in
  case a later pass has budget to pursue them.
- **Van Cortlandt Park Stables** — the park's own article mentions
  "stables for horseback riding" generically, with no proper name, address,
  or operator given. Not written up.
- **New York and Putnam Railroad's Van Cortlandt station remains** —
  covered as part of the Putnam Trail's history above; not written up as
  an independent place, since it is a ruin with no independent access,
  address, or ticketing distinct from the trail it now underlies.

## Dead ends — for a later pass, not for publication

- `en.wikipedia.org/wiki/Vault_Hill` — HTTP 404. No dedicated article.
- `en.wikipedia.org/wiki/Van_Cortlandt_Park_and_Broadway_(IRT_Broadway%E2%80%93Seventh_Avenue_Line)` — HTTP 404 (wrong/guessed title).
- `en.wikipedia.org/wiki/Woodlawn_(NYCT_station)` — HTTP 404 (wrong/guessed title; correct titles are `Woodlawn_(IRT_Jerome_Avenue_Line)` for the subway and `Woodlawn_station_(Metro-North)` for the commuter rail stop).
- No Metro-North station was found by any source to serve Van Cortlandt
  Park directly — see Getting There.
- No ferry route was found to serve Van Cortlandt Park — see Getting There.
- `nycgovparks.org` — not attempted this pass, per the dispatch's note that
  it has 403'd on six prior passes.
- `web.archive.org` — not attempted this pass, per the dispatch's note that
  the tool refuses it outright.

## Dedup check against the existing corpus (rung b, site-builder.md §7)

Checked all five shipped Bronx files directly: `belmont.json`,
`bronx-park.json`, `city-island.json`, `mott-haven.json`, and
`pelham-bay-park.json` in `priv/seed_data/bronx/`. A case-insensitive grep
for "van cortlandt," "vault hill," "putnam trail," "croton," "mosholu,"
"woodlawn," and "kingsbridge" across all five returned no matches for any
place name written up above; a single unrelated hit for "Croton Av" as a
cross-street name in a Belmont playground record, not the same feature. No
existing place record in the corpus collides with anything named above.
No `van-cortlandt-park.json`, `kingsbridge.json`, `riverdale.json`, or
`woodlawn.json` file exists yet in `priv/seed_data/bronx/` — all four are
still unresearched wave-3/wave-7 neighbors, so no collision risk exists at
this time either.

## Summary counts

- Places researched and written up with citations: **11** — Van Cortlandt
  House (Van Cortlandt House Museum), Vault Hill, Van Cortlandt Golf
  Course, Mosholu Golf Course, Van Cortlandt Lake, Putnam Trail, Old
  Croton Aqueduct Trail, John Kieran Nature Trail, Parade Ground, Croton
  Water Filtration Plant, and Indian Field (Stockbridge Indian Massacre
  site). All `searched: complete`.
- **DOHMH-only exclusions: 0.** No eatery or DOHMH-regulated business was
  investigated for this neighborhood; none apply.
- Distinct sourced claims across the neighborhood-level, transit, and
  place sections: **approximately 85** individual citation lines.
- Transit claims: **subway (2 stations named with full histories and
  landmark status), bus (10 route numbers named), Metro-North (dead end,
  stated plainly), ferry (dead end, stated plainly), former rail (New York
  and Putnam Railroad history and its conversion into the Putnam Trail)**
  — roughly 20 individual transit-related citation lines in total.
- WebSearch: attempted once, confirmed exhausted (0 of 200 available);
  everything above is WebFetch-sourced, entirely from Wikipedia.
- Boundary finding: Van Cortlandt Park is a standalone, unsplit roster row;
  all core candidate landmarks (House, Vault Hill, golf course, lake,
  parade ground) are confirmed by source to sit inside the park's own
  boundary, not a neighbor's. Woodlawn Cemetery was investigated and found
  to belong to the neighboring `woodlawn` row, not this one — excluded
  here. Mosholu Golf Course is the one unresolved edge case: claimed by the
  park's own article but placed "in the Woodlawn neighborhood" by its own
  dedicated article; written up under this row but flagged for the
  verifier.
- Flags left open for the verifier: the Mosholu Golf Course
  neighborhood-attribution ambiguity; the Van Cortlandt Golf Course
  designer/renovation discrepancy between the park's general article and
  the course's dedicated article; the Indian Field casualty-count
  discrepancy (38 vs. approximately 40) between the same two source types;
  and the 1906 Indian Field memorial, sourced only from the park's general
  article and absent from the dedicated battle article.
