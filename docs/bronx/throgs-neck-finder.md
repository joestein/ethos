# Throgs Neck — finder artifact

Role: FINDER only. No verdicts below. Every line is "source says X"; adjudication
(`confirmed`/`refuted`/`uncertain`) is for an independent verifier who has not
seen this reasoning.

`priv/seed_data/bronx/throgs-neck.json` has not been authored yet. This file is
its input, alongside whatever verifier artifact follows it.

Roster: `priv/seed_data/bronx_roster.json`, slug `throgs-neck`, community
district 10, wave 5, `in_scope: true`.

## Search access — report this first

**WebSearch was attempted once and confirmed unavailable.** Query issued:
"Throgs Neck Bronx Fort Schuyler history". Result:

> "Web search was not performed: this session has used its web search budget
> (200 of 200 WebSearch calls). Continue with the information already gathered
> instead of issuing more searches."

Zero WebSearch queries succeeded. Everything below was gathered via WebFetch
against Wikipedia, SUNY Maritime College's own site, and the NYPL's own site.
`nycgovparks.org` was not attempted, per the dispatch's note that it has
403'd on six prior passes. `web.archive.org` was not attempted, per the
dispatch's note that the tool refuses it outright.

## DOHMH-only count

**Zero.** No restaurant, eatery or shop candidates were pursued far enough to
reach a DOHMH lookup this pass — the neighborhood's sourceable material
skewed toward institutions (fort, college, schools, library, churches-by-name-only)
and infrastructure (bridge, park, ferry) rather than food establishments. No
eatery names were investigated at all in this pass; none is written up, and
none is flagged DOHMH-only because none was searched. This is a gap for a
later pass, not a finding — see Dead ends.

---

## Boundary check against the roster — read before anything else

Per the dispatch's standing instruction, every roster row adjacent or similar
to `throgs-neck` was checked against what the sources actually say.

Community District 10 rows in the roster: `throgs-neck` (in scope),
`edgewater-park` (not in scope), `locust-point` (not in scope),
`country-club` (not in scope), `schuylerville` (not in scope), `pelham-bay`
(not in scope), `city-island` (in scope, already shipped), `co-op-city` (not
in scope), `pelham-bay-park` (in scope, already shipped),
`westchester-square` (not in scope), `ferry-point` (not in scope).

Findings, row by row:

- **`locust-point` — Wikipedia's own Throgs Neck article calls it "a related
  area within Throggs Neck."** Quote, verbatim, from
  `https://en.wikipedia.org/wiki/Throgs_Neck`: "Locust Point is listed as a
  related area within Throggs Neck." Locust Point has its own dedicated
  article (`https://en.wikipedia.org/wiki/Locust_Point,_Bronx`) with its own
  boundaries (Harding Avenue to the north, the Throgs Neck Bridge to the
  east, Eastchester Bay), its own community character (Irish/German/Italian
  single-family enclave, 2011 population 1,479) and one named feature, the
  **Locust Point Yacht Club** ("the outermost block before the bay"). Because
  `locust-point` is `in_scope: false` and has no wave of its own, and because
  Wikipedia's own framing and the task brief both treat it as inside Throgs
  Neck's territory, its material is reported here rather than withheld. This
  is the opposite failure from the Fordham Heights/Pelham Bay precedent — the
  risk here was wrongly *excluding* Locust Point content because it carries
  its own out-of-scope roster row, not wrongly including a landmark that
  belongs elsewhere. Flagging explicitly per instruction: this is a
  boundary call for the verifier/author to make, not one this finder is
  making.
- **`ferry-point` — sources disagree with each other on Ferry Point Park's
  relationship to Throgs Neck.** One passage states the park is "situated in
  the Bronx, New York City, within the Throggs Neck neighborhood"; a second
  passage from the same page states it "is located on the eastern shore of
  Westchester Creek, **adjacent to** the neighborhood of Throggs Neck." Both
  from `https://en.wikipedia.org/wiki/Ferry_Point_Park`. These are not
  reconcilable from this pass — "within" and "adjacent to" are different
  claims. `ferry-point` has its own out-of-scope roster row. Flagged for the
  verifier; not resolved here. The park's ferry landing ("Throgs Neck
  Landing") is reported below regardless, since the Throgs Neck neighborhood
  article itself names that landing as serving Throgs Neck (see Getting
  there).
- **`schuylerville` — explicitly ambiguous in its own Wikipedia article.**
  Quote: "Though officially classified as part of the Throggs Neck section,
  the area aligns more closely with neighboring Pelham Bay and Country Club
  neighborhoods in character and association." — 
  `https://en.wikipedia.org/wiki/Schuylerville,_Bronx`. Schuylerville has its
  own roster row (`in_scope: false`) and its own bounded geography (between
  the Bruckner Expressway and Hutchinson River Parkway, 0.682 sq mi). Nothing
  from Schuylerville's own material (Herbert H. Lehman High School, Saint
  Raymond's Cemetery) is written up as a Throgs Neck place below, given the
  source's own hedge that it associates more with Pelham Bay/Country Club.
- **`country-club` — confirmed as a distinct, non-overlapping neighborhood.**
  Its own article gives Throgs Neck as a *bordering* neighborhood to its
  south ("Layton Avenue and the Throggs Neck neighborhood to the south"),
  not as a shared or ambiguous territory. Nothing from Country Club is
  written up here.
- **`edgewater-park` — mentioned once in the Throgs Neck article as a
  distinct, separately-originated place**, not folded in: "Nearby to the
  north, a campsite for church youth transformed into a bungalow colony
  later named Edgewater Park." Treated as bordering, not overlapping;
  nothing else about it was pursued this pass.
- **`pelham-bay` and `westchester-square`** — both named only as CD-10
  neighbors in a combined sentence ("Community District 10, which comprises
  City Island, Co-op City, Country Club, Pelham Bay, Schuylerville, Throgs
  Neck and Westchester Square") — `https://en.wikipedia.org/wiki/Throgs_Neck`.
  No landmark belonging to either was found misattributed to Throgs Neck in
  this pass.
- **A CD-10-wide population/demographic figure must not be read as
  Throgs-Neck-specific.** The Throgs Neck Wikipedia article's own 2010 Census
  figure — "44,167" — is stated as the combined population of "Schuylerville,
  Throgs Neck, and Edgewater Park," not Throgs Neck alone. Likewise all of
  the Police/Fire/Health/Education statistics quoted below are stated as
  **Community District 10** figures, covering City Island, Co-op City,
  Country Club, Pelham Bay, Schuylerville, Throgs Neck and Westchester
  Square together — not Throgs Neck alone. Flagged so none of it is
  published as if specific to the neighborhood.
- **Silver Beach** (the enclave named in the dispatch) has no dedicated
  Wikipedia article and no roster row of its own at all — it is not a
  separate NTA in the roster. Its only sourced material (below) comes from
  inside the main Throgs Neck article, which places it inside Throgs Neck's
  own history without qualification.

**Net finding: no landmark named in the dispatch turned out to sit in a
neighboring row.** Fort Schuyler, SUNY Maritime College, the Throgs Neck
Bridge, and Preston/Monsignor Scanlan high schools are all sourced to
addresses their own pages state are in Throgs Neck/Throggs Neck. The
boundary risk that materialized here was different from the two precedents:
Locust Point and Ferry Point both carry their own out-of-scope roster rows
while sources describe them as inside or adjacent to Throgs Neck — a
question of whether to include, not a case of a landmark hiding in the wrong
row.

---

## Neighborhood-level history and orientation

**Note on spelling:** Wikipedia's article title and running text consistently
render the name **"Throggs Neck"** (double g); the roster and the task brief
use "Throgs Neck" (single g). Both spellings are reported here exactly as
each source gives them; which one an authored file uses is a naming decision
for the verifier/author, not this finder, per the dispatch's rule that a
verdict decides the name.

- "Bounded by the East River and Long Island Sound to the south and east,
  Westchester Creek on the west, and Baisley Avenue and the Bruckner
  Expressway on the north," forming a peninsula in the southeastern Bronx,
  total area 1.903 sq mi (4.93 km²). — https://en.wikipedia.org/wiki/Throgs_Neck
- Part of Bronx Community District 10; ZIP code 10465; patrolled by the 45th
  Precinct of the NYPD, located at 2877 Barkley Avenue. — same source
- The peninsula was called *Vriedelandt* ("Land of Peace") by the New
  Netherlanders. — same source
- The current name comes from John Throckmorton, an English immigrant and
  associate of Roger Williams, whom the Dutch allowed to settle the area in
  1642 with thirty-five others. — same source
- At the same time the peninsula was also known as "Maxson's point," for the
  Maxson family who lived there. — same source
- Many of the settlers, including Anne Hutchinson and her family, were killed
  in a 1643 uprising of Native Americans; Throckmorton returned to Rhode
  Island. — same source
- In 1668 the peninsula appeared on maps as "Frockes Neck"; it was "virtually
  an island at high tide." — same source
- In 1776, George Washington's headquarters wrote of a potential British
  landing at "Frogs Neck." — same source
- **Battle of Throgs Neck (or Throg's Point), October 1776:** at the bridge
  over Westchester Creek — "now represented by an unobtrusive steel and
  concrete span at East Tremont Avenue near Westchester Avenue" — British
  General Howe attempted to cut off Washington's troops; the Americans tore
  up the plank bridge and opened fire, forcing Howe to withdraw. Six days
  later Howe landed troops at Rodman's Neck instead, on the far side of
  Eastchester Bay. — same source
- A farm owned by the Stephenson family was sold in 1795 to Abijah Hammond,
  who built a large mansion that later became the offices of the Silver
  Beach Garden Corporation. — same source
- In the 19th century the area held large farms converted into estates;
  around 1848 the Morris family purchased a large parcel, building two
  mansions and many cottages, with a private dock in Morris Cove (at the end
  of today's Emerson Avenue) and nearly a mile of shoreline. — same source
- After the Civil War, railroad builder Collis P. Huntington owned an
  extensive parcel that his heirs held until they were nearly the last
  estate remaining on Throggs Neck; the property had previously belonged to
  sugar magnate Frederick C. Havemeyer Jr., and the Havemeyer-Huntington
  mansion is now home to Preston High School. — same source
- **Silver Beach Garden**, a summer colony of bungalows later adapted for
  year-round use, was formed by the Peters and Sorgenfrel families and named
  "for the color of the beach at low tide." — same source
- Silver Beach Gardens's streets "were named for flowers and trees found on
  the Hammond estate," and its houses were owned by residents who rented the
  underlying land after joining to buy it collectively; the enclave was
  "largely exempt from the severe urban decay that affected much of the
  Bronx in the 1970s." — same source (Silver Beach content)
- Notable people born or raised in Throggs Neck, per the article: Frank
  Bello and Charlie Benante of Anthrax; Christine Jorgensen ("first
  transgender celebrity," born and raised on Dudley Avenue); sportscaster
  Michael Kay; NFL head coach Doug Marrone; actor Sal Mineo; NFL executive
  Bill Polian; MLB infielder T.J. Rivera; U.S. Congressman Ritchie Torres. —
  same source
- Community District 10 (City Island, Co-op City, Country Club, Pelham Bay,
  Schuylerville, Throgs Neck and Westchester Square together) had 121,868
  inhabitants per NYC Health's 2018 Community Health Profile. — same source
  (**CD-10-wide, not Throgs-Neck-specific — see boundary section above**)
- Throggs Neck is served by two FDNY stations: Engine Co. 89/Ladder Co. 50 at
  2924 Bruckner Boulevard, and Engine Co. 72/Satellite 2 at 3929 East Tremont
  Avenue. — same source

---

## Fort Schuyler and SUNY Maritime College

**What it is:** A mid-19th-century coastal fortification at the tip of
Throgs Neck, now the campus of SUNY Maritime College, including the
college's own maritime museum inside the fort. `searched: complete`

- Fort Schuyler sits on Throggs Neck at the southeastern tip of the Bronx,
  where the East River meets Long Island Sound. —
  https://en.wikipedia.org/wiki/Fort_Schuyler
- Built 1833–1856 by the U.S. Army Corps of Engineers, exemplifying the
  "Third System" of U.S. coastal fortifications; at its peak it housed 312
  guns and could accommodate 1,250 personnel, with casemated and barbette
  gun tiers and defensive outworks. — same source
- Garrisoned starting 1861; during the Civil War it held up to 500
  Confederate prisoners and included the McDougall Hospital, with a 2,000-bed
  capacity. — same source
- Received Endicott-era coastal artillery upgrades 1898–1900; some armaments
  were removed 1917–1920. — same source
- Transferred to New York State in 1934; the fort's restoration was
  completed by the Works Progress Administration. — same source
- Designated a New York City individual landmark on April 19, 1966. —
  https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- Listed on the National Register of Historic Places on June 29, 1976 (NRHP
  reference #76001206), address given as "Throggs Neck at East River and
  Long Island Sound." — https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_the_Bronx
- The fort now houses SUNY Maritime College, including the Stephen B. Luce
  Library, administrative offices, the Marine Transportation Department, and
  a maritime museum (the Fort Schuyler article calls it the "Maritime
  Industry Museum," established 1986, displaying exhibits on U.S. maritime
  history and the Port of New York). — https://en.wikipedia.org/wiki/Fort_Schuyler
  and https://en.wikipedia.org/wiki/SUNY_Maritime_College
- SUNY Maritime College was established in 1874 as the "New York Nautical
  School" — "the oldest institution of its kind in the United States" —
  became degree-granting in 1946, joined the SUNY system in 1948, and took
  its current name in 1949. — https://en.wikipedia.org/wiki/SUNY_Maritime_College
- The college moved to the Fort Schuyler campus in 1938; the campus is
  55 acres. — same source
- Fall 2025 enrollment: 1,552 total students (1,402 undergraduate, 150
  postgraduate). — same source
- Academic offerings include bachelor's degrees preparing graduates as U.S.
  Merchant Marine officers, master's degrees in International Transportation
  Management and in Maritime/Naval Studies, and the only Navy/Marine Corps
  ROTC program in the New York metropolitan area. — same source
- Athletics compete in NCAA Division III, Skyline Conference, 16 varsity
  sports, nickname "Privateers." — same source
- Notable alumni cited: astronaut Scott Kelly; America's Cup tactician Gary
  Jobson; ship captains Harry Manning and Joseph Hazelwood. — same source
- The college's own site gives its address as 6 Pennyfield Avenue, Bronx, NY
  10465, and independently names the "Maritime Industry Museum" as part of
  the campus — cited here only for identity/location corroboration, not for
  any claim the college's own site cannot establish. —
  https://www.sunymaritime.edu/about/history
- Per the finder contract on sub-attractions: the Maritime Industry Museum
  has no independent address, access point or ticketing separate from the
  Fort Schuyler/SUNY Maritime campus, so it is folded into this single place
  record rather than written up separately.

---

## Throgs Neck Bridge

**What it is:** A suspension bridge carrying I-295 between the Bronx and
Queens. `searched: complete`

- Connects Throggs Neck in the Bronx to Bay Terrace in Queens, crossing where
  the East River meets Long Island Sound; carries Interstate 295. —
  https://en.wikipedia.org/wiki/Throgs_Neck_Bridge
- Designed by structural engineer Othmar Ammann, who also designed the
  George Washington, Bronx–Whitestone, Verrazzano-Narrows, and Triborough
  Bridges. — same source
- Groundbreaking October 22, 1957; opened January 11, 1961; construction
  cost $92 million. — same source
- Suspension bridge, six lanes (three each direction); total length 11,250
  feet (3,430 m) including approaches; center span 1,800 feet (550 m); tower
  height 346 feet (105 m) above mean high water; clearance below 142 feet
  (43 m); main cables of 37 strands each containing 296 wires (10,952 wires
  per cable). — same source
- Built to relieve congestion on the Bronx–Whitestone Bridge, located two
  miles west. — same source
- First 12 hours of operation carried 20,000 vehicles; 16.4 million vehicles
  crossed in 1961, its first full year; 2016 daily traffic was 119,249
  vehicles. — same source
- Peregrine falcons have nested on the suspension towers since at least
  1983. — same source
- Tolls as of January 4, 2026: $12.03 toll-by-mail per car; $7.46 E-ZPass
  (NY) per car; $9.79 mid-tier E-ZPass per car. — same source

---

## Preston High School (Havemeyer-Huntington mansion)

**What it is:** A private Catholic girls' high school occupying a
19th-century mansion built for the Havemeyer and Huntington families.
`searched: complete`

- Address: 2780 Schurz Avenue, Throggs Neck, Bronx, NY 10465. —
  https://en.wikipedia.org/wiki/Preston_High_School_(Bronx)
- Founded 1947 by the Sisters of the Divine Compassion, a Roman Catholic
  order; named for Monsignor Thomas Scott Preston, the order's co-founder;
  it is a private, all-female school. — same source
- The mansion itself: Frederick C. Havemeyer Jr. purchased the property in
  1863 from the heirs of Dominick Lynch Lawrence; Arabella Duvall Huntington
  (wife of Collis P. Huntington) acquired it from Havemeyer in 1884; the
  Sisters of the Divine Compassion purchased the estate in 1927, initially
  running it as "The House of the Holy Family," a residence and girls'
  school, before converting it to a high school in 1947. — same source
- Campus expanded in 1960 and 1965 with a new building housing classrooms, a
  gymnasium, cafeteria, library and science labs. — same source
- School motto: *Virtus Mille Scuta* ("Virtue is a thousand shields"); the
  school's logo incorporates the Throgs Neck Bridge. — same source
- In 2025 a deal was reached with the Ballys Foundation to keep the school
  operating for 25 years. — same source
- **Not carried into a claim, per finder contract:** the same article
  reports student lore that the mansion is haunted by a ghost named
  "Archie" — folklore, not fact, flagged rather than stated as established.

---

## Monsignor Scanlan High School

**What it is:** A private Catholic coeducational high school. `searched: complete`

- Address: 915 Hutchinson River Parkway, Throggs Neck, Bronx, NY 10465. —
  https://en.wikipedia.org/wiki/Monsignor_Scanlan_High_School
- Roman Catholic, Archdiocese of New York, affiliated with the Dominican
  Sisters of Sparkill. — same source
- History: St. Helena's Elementary School opened in 1940; the parish
  purchased land from St. Joseph's School for the Deaf in Throggs Neck in
  1949 and established two separate high schools that year; both were
  renamed in Monsignor Arthur J. Scanlan's honor in 1972; the two schools
  merged into one coeducational institution in 1976; the school became
  administratively independent from the parish in 2014. — same source
- 13-acre campus; approximately 460 students enrolled as of 2021; accredited
  by the Middle States Association and the Board of Regents; offers AP
  courses, STEM programs and college-level courses through St. John's
  University. — same source
- Athletic programs include baseball, basketball, softball, volleyball and
  track. — same source

---

## New York Public Library, Throg's Neck branch

**What it is:** A single-floor NYPL branch. `searched: complete`

- Address, per the library's own site: 3025 Cross Bronx Expressway, Bronx,
  NY 10465. — https://www.nypl.org/locations/throgs-neck
- Wikipedia states the branch has operated since 1954 and relocated to its
  current one-story building in 1974; the library's own site states the
  current building "was opened in September 1974." — 
  https://en.wikipedia.org/wiki/Throgs_Neck and
  https://www.nypl.org/locations/throgs-neck
- The branch is fully accessible and houses collections for adults, young
  adults and children; the library's own site notes "a large mural
  celebrating Sesame Street" on the north wall of the courtyard near the
  children's room. — https://www.nypl.org/locations/throgs-neck
- The library's own site lists current hours: Monday–Thursday 10 AM–6 PM,
  Friday 10 AM–5 PM, closed Saturday–Sunday — cited only for identity/hours,
  not as independent confirmation the branch is still operating beyond what
  the library's own site can establish. — same source

---

## Locust Point Yacht Club (Locust Point enclave)

**What it is:** A yacht club in the Locust Point enclave, which Wikipedia's
own Throgs Neck article calls "a related area within Throggs Neck" — see
the Boundary check section above for the scope question this raises.
`searched: complete`

- Locust Point is bounded by Harding Avenue to the north, the Throgs Neck
  Bridge to the east, and Eastchester Bay; part of Bronx Community District
  10; ZIP code 10465. — https://en.wikipedia.org/wiki/Locust_Point,_Bronx
- Originally named Wrights Island (after owner Captain J. T. Wright), later
  Locust Island, before the separating waterway was filled — landfill that
  also carried the Throgs Neck Bridge's northern ramp and toll plaza,
  turning the former island into a peninsula. — same source
- Population 1,479 as of the 2011 census, across 0.416 sq mi; median income
  $85,072 at that time. — same source
- The Locust Point Yacht Club occupies "the outermost block before the bay."
  — same source
- Sportscaster Michael Kay is named as a former resident. — same source
- **No independent second source (own-site, press, or additional Wikipedia
  article) was found for the yacht club itself in this pass** — the single
  Wikipedia sentence above is all that was located.

---

## Places investigated and NOT included

- **Ferry Point Park** — not written up as a Throgs Neck place, per the
  boundary flag above: one clause of its own Wikipedia article places it
  "within" Throggs Neck and another places it "adjacent to" Throggs Neck.
  Its ferry landing is reported under Getting There because the Throgs Neck
  neighborhood article itself names that landing as serving the
  neighborhood, but the park as a whole is left for the verifier to place.
- **St. Joseph's School for the Deaf** — named only once, in passing, inside
  the Monsignor Scanlan history ("purchased land from St. Joseph's School
  for the Deaf in Throggs Neck in 1949"), with no address, no dates, and no
  indication of whether or where it still exists. Not pursued further this
  pass; not written up.
- **Silver Beach Garden Corporation / Silver Beach Gardens as a standalone
  place** — the material found (see History section) all comes from inside
  the main Throgs Neck Wikipedia article, with no dedicated article of its
  own reachable (`Silver_Beach,_Bronx` and `Silver_Beach_Gardens,_Bronx`
  both 404'd) and no own-site found. Folded into neighborhood history
  rather than written up as an independent place.
- **Schuylerville, Country Club, Edgewater Park material** — excluded per
  the boundary section above.
- **Any eatery, shop or restaurant** — none was investigated this pass; see
  the DOHMH-only section above and Dead ends below.

## Dead ends — for a later pass, not for publication

- `en.wikipedia.org/wiki/Bicentennial_Veterans_Memorial_Park` — HTTP 404.
- `en.wikipedia.org/wiki/Bicentennial_Park_(Bronx)` — HTTP 404.
- `en.wikipedia.org/wiki/Bicentennial_Veterans_Memorial_Park,_Bronx` — HTTP 404.
  No alternate title was found for this park in this pass; the task brief
  names it explicitly as one of Throgs Neck's holdings but no Wikipedia
  article, own-site, or other reachable source was found for it. `nycgovparks.org`
  would very likely carry it but was not attempted, per the dispatch's
  standing note that it 403's.
- `en.wikipedia.org/wiki/Silver_Beach,_Bronx` — HTTP 404.
- `en.wikipedia.org/wiki/Silver_Beach_Gardens,_Bronx` — HTTP 404.
- `en.wikipedia.org/wiki/Bx5_(New_York_City_bus)` — did not cleanly resolve;
  a fetch against this URL returned content that appears to describe Bx8 and
  Bx40/Bx42 instead of Bx5 specifically. **Treated as unreliable and not
  cited above for Bx5 route details** — only the direct fetches of
  `List_of_bus_routes_in_the_Bronx` (which gives Bx5 as Pelham Bay/Co-op
  City via Bruckner Boulevard, not clearly reaching Throgs Neck proper) and
  of `Bx8_(New_York_City_bus)` were relied on.
- `en.wikipedia.org/wiki/Bx40_and_Bx42_(New_York_City_bus)` — HTTP 404 on
  direct fetch; the Bx40/Bx42 termini reported under Getting There come only
  from the `List_of_bus_routes_in_the_Bronx` page, not from a dedicated
  route article.
- `nycgovparks.org` — not attempted, per the dispatch's note that it has
  403'd on six prior passes.
- `web.archive.org` — not attempted, per the dispatch's note that the tool
  refuses it outright.
- No eatery, restaurant or shop name was investigated this pass at all (not
  even a DOHMH lookup) — a real gap for a later pass, distinct from a dead
  end on a specific name.
- No source fetched in this pass names Q44 SBS, Q50, or BxM9 route termini
  in a way that specifically ties them to Throgs Neck beyond the
  neighborhood article's own bare list (see Getting There) — the
  `List_of_bus_routes_in_the_Bronx` fetch reported those three as "mentioned
  in reference lists but lack detailed terminus/street information in the
  provided content."

---

## Getting there

**Subway.** No subway line reaches Throgs Neck directly. Wikipedia's own
Throgs Neck article states this under a "No Subway Access" heading and notes
that a 1929–39 plan for a Second Avenue Subway branch to Throggs Neck never
materialized. — https://en.wikipedia.org/wiki/Throgs_Neck
The nearest subway stations found in this pass are both on the IRT Pelham
Line's 6 and `<6>` trains — Westchester Square–East Tremont Avenue ("located
at the intersection of East Tremont and Westchester Avenues in the
Westchester Square, and on the border of the Pelham Bay neighborhoods") and
Buhre Avenue ("at the intersection of Buhre and Westchester Avenues," in the
Pelham Bay neighborhood) — but neither source describes either station as
serving Throgs Neck itself, only Westchester Square/Pelham Bay; the
Westchester Square station's own article notes only that its northbound
platform offers "a good view of the Bronx–Whitestone and Throgs Neck
Bridges." Naming them here without asserting they serve Throgs Neck, per the
dispatch's Case C guidance. — https://en.wikipedia.org/wiki/Westchester_Square%E2%80%93East_Tremont_Avenue_station
and https://en.wikipedia.org/wiki/Buhre_Avenue_station

**Bus.** The Throgs Neck Wikipedia article's own list of bus routes serving
the neighborhood: "Bx5, Bx8, Bx40/Bx42, Q44 SBS, Q50, and BxM9 express
service." — https://en.wikipedia.org/wiki/Throgs_Neck
Two of those are independently sourced to termini:
- **Bx8** runs between Locust Point (Longstreet Avenue and Tierney Place) and
  Williamsbridge (East 226th Street and White Plains Road), using Throgs
  Neck Boulevard, Crosby Avenue, Williamsbridge Road and Bronxwood Avenue,
  connecting at its northern end to the 225th Street station on the IRT
  White Plains Road Line (2 and 5 trains). —
  https://en.wikipedia.org/wiki/Bx8_(New_York_City_bus)
- **Bx40 and Bx42** connect Morris Heights (River Park Towers) with SUNY
  Maritime College and Throgs Neck (Harding Avenue and Emerson Avenue). —
  https://en.wikipedia.org/wiki/List_of_bus_routes_in_the_Bronx
- **Bx5** is reported by the same list-of-routes page as running to Pelham
  Bay (via Bruckner Boulevard) and Co-op City (via the Bay Plaza Shopping
  Center); this source does not describe it reaching Throgs Neck proper,
  even though the neighborhood's own article names Bx5 among its routes —
  flagged as a discrepancy, not resolved here. —
  https://en.wikipedia.org/wiki/List_of_bus_routes_in_the_Bronx

**Metro-North.** No Metro-North station serves Throgs Neck. The Penn Station
Access project's Phase One is adding four new Metro-North stations on the
New Haven Line in the Bronx — Co-op City, Morris Park, Parkchester/Van Nest,
and Hunts Point — and Throgs Neck, Westchester Square, Country Club and
Locust Point are not among them. —
https://en.wikipedia.org/wiki/Penn_Station_Access

**Ferry.** The Soundview NYC Ferry route was extended to a new "Throggs Neck"
ferry stop, which opened December 28, 2021. — https://en.wikipedia.org/wiki/NYC_Ferry
The Soundview route itself launched August 15, 2018, serving East 34th
Street in Manhattan, with a Stuyvesant Cove stop added in May 2020. — same
source. As of late 2025 the NYC Economic Development Corporation planned to
merge the Rockaway and Soundview routes — same source. Per the boundary flag
above, sources disagree on whether the landing's home, Ferry Point Park, is
"within" or merely "adjacent to" Throggs Neck; the landing's own name and
the neighborhood article's inclusion of it are reported here regardless.

**Bridge.** The Throgs Neck Bridge (I-295) is the neighborhood's namesake
crossing to Bay Terrace, Queens — full details in the Throgs Neck Bridge
section above. No source in this pass describes the bridge as usable by
pedestrians or cyclists; none was found stating the opposite either.

---

## Dedup check against the existing corpus (rung b, site-builder.md §7)

Checked all five shipped Bronx files directly:
`priv/seed_data/bronx/belmont.json`, `priv/seed_data/bronx/bronx-park.json`,
`priv/seed_data/bronx/city-island.json`, `priv/seed_data/bronx/mott-haven.json`,
and `priv/seed_data/bronx/pelham-bay-park.json`, plus
`priv/seed_data/deleted_places.json`. A case-insensitive grep for "throgs
neck," "throggs neck," "fort schuyler," "maritime college," "preston high,"
"scanlan," "locust point," "silver beach," and "bicentennial" across all six
files returned no matches. No existing place record in the corpus collides
with any address or institution named above. No `throgs-neck.json`,
`locust-point.json`, `country-club.json`, `schuylerville.json`,
`edgewater-park.json`, `pelham-bay.json`, `co-op-city.json`,
`westchester-square.json` or `ferry-point.json` file exists yet in
`priv/seed_data/bronx/`.

## Summary counts

- Places researched and written up with citations: **5** — Fort Schuyler and
  SUNY Maritime College (with the Maritime Industry Museum folded in),
  Throgs Neck Bridge, Preston High School (Havemeyer-Huntington mansion),
  Monsignor Scanlan High School, New York Public Library Throg's Neck
  branch. A sixth, weaker candidate — Locust Point Yacht Club — is written
  up but flagged as resting on a single unsupported Wikipedia sentence and
  as a boundary question (Locust Point carries its own out-of-scope roster
  row).
- **DOHMH-only eateries: 0** — no eatery was investigated this pass at all;
  see Dead ends.
- Distinct sourced claims across neighborhood history/orientation, the five
  (or six, counting Locust Point) place write-ups, and the boundary section:
  **approximately 70** individual citation lines.
- WebSearch: attempted once, confirmed exhausted (0 of 200 available);
  everything above is WebFetch-sourced, plus two own-site fetches
  (SUNY Maritime, NYPL) used only for identity/address/hours.
- Transit claims: **subway (no direct service; failed 1929–39 extension
  plan; two nearby stations named without asserting they serve Throgs Neck),
  bus (Wikipedia's own 6-route list, with termini sourced for Bx8 and
  Bx40/Bx42, and a Bx5 discrepancy flagged), ferry (Throgs Neck Landing,
  Soundview route, full history), Metro-North (dead end, positively
  confirmed via Penn Station Access's station list), bridge (full history,
  9+ claims)** — roughly 20 individual transit-related citation lines.
- Boundary findings: **Locust Point** and **Ferry Point** both carry their
  own out-of-scope roster rows while sources place them inside or adjacent
  to Throgs Neck — flagged for the verifier/author rather than resolved.
  **Schuylerville** is explicitly hedged in its own Wikipedia article as
  associating more with Pelham Bay/Country Club despite being "officially
  classified as part of the Throggs Neck section" — its material is
  excluded here. **Country Club** and **Edgewater Park** are confirmed as
  bordering, non-overlapping neighborhoods. A CD-10-wide population figure
  and a set of CD-10-wide health/education/crime statistics are flagged as
  not specific to Throgs Neck alone.
- Concerns for the verifier: Bicentennial Veterans Memorial Park (named
  explicitly in the task brief) could not be sourced at all in this pass —
  no Wikipedia article under any guessed title, no own-site found, and
  `nycgovparks.org` (which would very likely carry it) was not attempted
  per the standing 403 note. The Bx5 route's relationship to Throgs Neck is
  contradictory between two sources. No eatery, restaurant or shop was
  investigated this pass — a real gap, not a dead end on a specific name.
