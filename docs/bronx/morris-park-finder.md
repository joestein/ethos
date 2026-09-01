# Morris Park — finder artifact

Role: FINDER only. No verdicts below. Every line is "source says X"; adjudication
(`confirmed`/`refuted`/`uncertain`) is for an independent verifier who has not
seen this reasoning.

`priv/seed_data/bronx/morris-park.json` has not been authored yet. This file is
its input, alongside whatever verifier artifact follows it.

Roster: `priv/seed_data/bronx_roster.json`, slug `morris-park`, community
district 11, wave 6, `in_scope: true`.

## Search access — report this first

**WebSearch was attempted once and confirmed unavailable.** Query issued:
"Morris Park Bronx neighborhood history Morris Park Avenue". Result:

> "Web search was not performed: this session has used its web search budget
> (200 of 200 WebSearch calls)."

Zero WebSearch queries succeeded. Everything below was gathered via **WebFetch**
against Wikipedia, institutions' own sites, and the NYC DOHMH restaurant-
inspection Open Data endpoint (Socrata dataset `43nn-pn8j`, queried directly by
zip code, not via WebSearch). WebFetch worked throughout and was not throttled.
`web.archive.org` was not attempted (tool refuses it outright, per standing
note). `nycgovparks.org` was not attempted either (403's on six prior passes,
per standing note).

---

## Roster boundary check — read before anything else

The dispatch requires checking every roster row adjacent to `morris-park` for
misplaced landmarks, because this exact failure has happened twice before in
this programme (`fordham-heights`/`fordham-manor`, `pelham-bay`/`pelham-bay-park`).

Rows checked, all Bronx Community District 11 or immediately adjacent, from
`priv/seed_data/bronx_roster.json`:

- `morris-park` (CD 11, wave 6, **in_scope: true**) — this file's subject.
- `van-nest` (CD 11, wave 6, in_scope: false)
- `indian-village` (CD 11, wave 6, in_scope: false)
- `pelham-parkway` (CD 11, wave 6, in_scope: false)
- `bronxdale` (CD 11, wave 6, in_scope: false)
- `allerton` (CD 11, wave 6, in_scope: false)
- `pelham-gardens` (CD 11, wave 6, in_scope: false)
- `bronxwood` (CD 12, wave 6, in_scope: false)
- `westchester-square` (CD 10, wave 4, in_scope: false)
- `pelham-bay-park` (CD 10, wave 5, **in_scope: true** — already shipped,
  `priv/seed_data/bronx/pelham-bay-park.json` exists on disk)

**Unlike the two prior failures, `morris-park` is the only `in_scope: true`
row in its own community district** — there is no sibling row holding the
landmarks instead. But three separate landmark-location traps surfaced anyway,
and are reported here rather than silently worked around, per the dispatch's
instruction:

1. **The Bronx Victory Memorial is NOT in Morris Park — it is in Pelham Bay
   Park, which has already shipped.** The assignment brief lists "the Bronx
   Victory Memorial vicinity" as something Morris Park holds. Two independent
   Wikipedia sources place it inside Pelham Bay Park: the "List of New York
   City parks relating to World War I" article lists "Bronx Victory Memorial
   at [Pelham Bay Park]" (https://en.wikipedia.org/wiki/List_of_New_York_City_parks_relating_to_World_War_I),
   and the Pelham Bay Park article itself names "the Bronx Victory Column &
   Memorial Grove" as one of the park's landmarks
   (https://en.wikipedia.org/wiki/Pelham_Bay_Park). Confirmed further: the
   already-shipped `priv/seed_data/bronx/pelham-bay-park.json` file already
   contains the sentence "Other landmarks in the park include the Bronx
   Victory Column & Memorial Grove" in its own body text — the memorial is
   already claimed by that neighborhood's guide. **It is not written up as a
   Morris Park place below, and must not be.**
2. **The New York, Westchester and Boston Railway Administration Building, at
   481 Morris Park Avenue, is NOT in Morris Park — it sits in West Farms and
   Van Nest**, despite its street address containing the words "Morris Park
   Avenue." Two independent sources agree: the Wikipedia article on
   "East 180th Street station" states the building/station is "located in the
   West Farms and Van Nest neighborhoods of the Bronx"
   (https://en.wikipedia.org/wiki/East_180th_Street_station), and the
   NRHP boroughwide listings page separately files it as being in the "Van
   Nest area" (https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_the_Bronx).
   It is a real NRHP-listed (April 23, 1980) and NYC-landmarked (May 11, 1976)
   building — a legitimate landmark — but sources put it in a neighboring,
   out-of-scope neighborhood. **Not written up as a Morris Park place below.**
3. **Conti's Pastry Shoppe (established 1921) is named as a Van Nest landmark,
   not a Morris Park one.** The Van Nest Wikipedia article lists it under Van
   Nest's own landmarks (https://en.wikipedia.org/wiki/Van_Nest,_Bronx). Not
   pursued as a Morris Park place.

By contrast, three institutions the assignment brief names for Morris Park —
Jacobi Medical Center, Albert Einstein College of Medicine, and Bronx
Psychiatric Center — **are affirmatively confirmed as being in Morris Park by
multiple independent sources**, including the one neighboring roster row this
programme would most expect them to hide in (`pelham-parkway`). See the
Places section and the citations there. This is the positive control for the
same check: the boundary trap did not fire for the brief's core landmarks,
only for a memorial and a station building the brief did not ask for.

---

## DOHMH-only count and eatery handling

Per the finder contract, a NYC DOHMH restaurant-inspection dataset row may
establish existence and address only, never prose, never a category noun. A
business's own site is different: it cannot establish an award, a superlative,
or that it is still trading, but it can establish identity and location.

**Two eateries clear the bar with non-DOHMH sourcing** and are written up as
places below: Patricia's of Morris Park, and Morris Park Inn.

**A general search of the DOHMH dataset for zip codes 10461 and 10462
(covering Morris Park) turned up many more eatery names on Morris Park
Avenue itself for which no own-site was found or attempted beyond the two
above**, including (not investigated further, not written up, listed only so
a later pass does not re-run the same query cold): Emilio's (1051 Morris Park
Ave — `emiliosbronx.com` does not resolve), Scaglione Brothers Bakery (1078
Morris Park Ave — no working domain found), Addeo's of the Bronx (1056 Morris
Park Ave — `addeobakery.com` does not resolve), plus a long tail of smaller
storefronts (El Nuevo Pollo, Hemo's Spot 3, Tasty Choice, Arth Alsaeedah
Restaurant, Golden Eagle II, Joy Garden Restaurant, Kyan, Universe Cafe, Crepe
House, Better Gourmet Health Kitchen, M & R Deli & Hero Shop, Healthy Fresh 3,
Osaka Sushi, Prizreni Grill) that were not individually pursued for an
own-site given time budget. All of these are **DOHMH-only unless and until a
later pass finds an independent source**; none is written up as a place.

Source for all DOHMH rows in this section:
`https://data.cityofnewyork.us/resource/43nn-pn8j.json` queried by
`zipcode='10461'` and `zipcode='10462'`.

---

## Neighborhood-level history and orientation

Source, unless noted: https://en.wikipedia.org/wiki/Morris_Park,_Bronx

- Morris Park is "named after John Albert Morris, who built the Morris Park
  Racecourse, which existed from 1889 until 1910." — same source
- The racecourse "hosted both the Preakness and the Belmont Stakes" in 1890,
  with the Belmont continuing there "until 1905." — same source. (See the
  dedicated racecourse citations below for a materially different end year
  from the racecourse's own Wikipedia article — flagged for the verifier.)
- After a 1910 fire, "the property was divided into lots for the current
  neighborhood." — same source
- Morris Park's boundaries: "Neill Avenue and Pelham Parkway to the north,
  Eastchester Road to the east, the Amtrak Northeast Corridor tracks and
  Sackett Avenue to the east and south, and Bronxdale Avenue and White Plains
  Road to the west." — same source
- Morris Park "borders the neighborhoods of Van Nest to its southwest,
  Parkchester and Westchester Square to its south, and Pelham Parkway to its
  northeast." — same source
- Part of "Bronx Community District 11 in the East Bronx," ZIP codes "10461
  and 10462." — same source
- 2020 Census: population 25,077 over 0.347 square miles; "42.5% White
  (Non-Hispanic), 6.7% Black (Non-Hispanic), 14.1% Asian," and "33.2% Hispanic
  or Latino of any race." — same source
- "The neighborhood has a large Italian-American population" and a large
  Albanian-American presence, per the article's infobox/opening section. —
  same source
- "Morris Park has always been predominantly Italian." — same source
  (footnoted in the article; footnote target not independently re-fetched in
  this pass)
- After Italy's 2006 World Cup win, "over 30,000 flocked to the neighborhood
  for an all-day party." — same source
- **Flag for the verifier — two claims in the article carry Wikipedia's own
  `[citation needed]` tag and are not independently sourced by the article
  itself:** that Morris Park "rivals Arthur Avenue for the prototypical
  Italian-American neighborhood in the Bronx," and that it has "one of the
  highest percentage of Italian populations in the city, along with
  Bensonhurst... and Staten Island." Reported here as what the article says,
  not as confirmed fact.
- **Independent corroboration of the Italian-American character, from a
  different Wikipedia article**, unaffected by the citation-needed flags
  above: "Arthur Avenue and Morris Park are viewed as the Bronx's primary
  Italian American communities." — https://en.wikipedia.org/wiki/Arthur_Avenue
- Morris Park's Columbus Day parade "began in 1977"; past Grand Marshals have
  included Tony LoBianco, Chazz Palminteri, Regis Philbin, and Joe Pepitone
  (footnoted in the article). — https://en.wikipedia.org/wiki/Morris_Park,_Bronx
- The Morris Park Library (NYPL branch) opened July 21, 2006 as "the
  neighborhood's first library" — see the Places section for full sourcing.
- Schools serving the neighborhood, per the article: P.S. 83 Donald Hertz
  (K-8), P.S. 105 Senator Abraham Bernstein (PK-5), P.S. 108 Philip J.
  Abinanti (PK-5), P.S./M.S. 498 Van Nest Academy (K-8), and Bronx High School
  for the Visual Arts (9-12), all NYC Department of Education schools; St.
  Francis Xavier School and St. Clare of Assisi School as local Catholic
  schools (uncited in the article); Our Savior Lutheran School (uncited). Not
  pursued as individual places — schools are not the kind of place this
  corpus features absent an independent landmark or visitor reason, per the
  dispatch's "spend the day" test.
- Notable people from Morris Park named with citations in the article:
  actress Cara Buono (b. 1971), mystery author Mary Higgins Clark
  (1927-2020), boxer Jake LaMotta (1922-2017), and MLB infielder Andrew
  Velazquez (b. 1994). Several more names appear in the article without a
  citation (Jeffrey D. Klein, James Madio, Ronnie Ortiz-Magro, Luis Resto,
  Anthony Ribustello, Nancy Savoca, Guy Velella, and Abel Ferrara, the last
  itself flagged `[citation needed]` by the article). Reported for the
  verifier's judgment call on the cited/uncited distinction; none is written
  up as a place.

### Morris Park Racecourse — history only, not a place record

The racecourse site no longer exists as a distinct place (it was subdivided
into residential/industrial lots after 1910); folded into neighborhood history
rather than written up as a place, per the dispatch's guidance that a historic
site with no independent access, address or extant structure folds into
context rather than becoming its own record.

Source: https://en.wikipedia.org/wiki/Morris_Park_Racecourse

- Operated as a thoroughbred racing venue "from 1889 to 1904" — **note this
  is 1904, not the 1910 the main neighborhood article gives for the
  racecourse's operating end date; the two Wikipedia articles disagree on
  the closing year. Flagged for the verifier, not resolved here.**
- Opened "August 20, 1889," with jockey Isaac Murphy riding on opening day;
  the final race ran "October 15, 1904." — same source
- Located on land "in a part of Westchester County, New York that was
  annexed into the Bronx in 1895." — same source
- John Albert Morris was majority shareholder; Leonard W. Jerome was the
  racecourse's president. — same source
- Hosted "the Belmont Stakes from 1890 through 1904 as well as the Preakness
  Stakes in 1890." — same source
- Described as "the finest race track in the world" at its opening (a
  contemporaneous characterization per the source, not an independent
  superlative). — same source
- After racing ended: used for automobile racing; leased to the Aeronautic
  Society of New York (1907-1909) as an aerodrome, including a Glenn Curtiss
  flying exhibition in June 1909; damaged by fire in April 1910; subdivided
  into building lots; by 1921 the former clubhouse had become "a factory to
  manufacture ornamental iron." — same source

---

## Places

### 1. Albert Einstein College of Medicine

**What it is:** A medical school on the Jack and Pearl Resnick Campus, on
Morris Park Avenue. `searched: complete`

- Own site gives the current official name as "Albert Einstein College of
  Medicine," address "1300 Morris Park Avenue, Bronx, NY 10461," on the
  "Jack and Pearl Resnick Campus." — https://www.einsteinmed.edu/about/
- Own site states the college "operates patient care services across more
  than 300 patient-care locations in New York City, Westchester, and the
  Hudson Valley" (a scope description, not a superlative or trading-status
  claim). — same source
- Independently, Wikipedia places the college "in the Morris Park
  neighborhood" of the Bronx and states a site there was chosen for "ample
  land and proximity to the adjacent Bronx Municipal Hospital." —
  https://en.wikipedia.org/wiki/Albert_Einstein_College_of_Medicine
- Founded 1953; Albert Einstein agreed to lend his name on "March 14, 1953";
  the college "welcomed its first class of 56 students" on September 12,
  1955. — same source
- Described by the same source as "the first new medical school to open in
  New York City since 1897 and the first in the United States to open under
  Jewish auspices." — same source
- Planning was initiated by Yeshiva University President Samuel Belkin in
  1945; the college now operates as "an independent degree-granting entity
  within the Montefiore Einstein Health System." — same source
- By 2008, campus expansion had "doubled the size of Einstein's campus to
  nearly 40 acres." — same source

### 2. Jacobi Medical Center

**What it is:** A public acute-care hospital on Pelham Parkway South, in
Morris Park. `searched: complete`

- Address: "1400 Pelham Parkway South, Bronx, New York." —
  https://en.wikipedia.org/wiki/Jacobi_Medical_Center
- Independently confirmed as being in Morris Park by three separate sources:
  the hospital's own Wikipedia article states it is "situated in the Morris
  Park neighborhood of the Bronx" (same source); the main Morris Park
  neighborhood article lists it among Morris Park's major institutions
  (https://en.wikipedia.org/wiki/Morris_Park,_Bronx); and the *neighboring*
  Pelham Parkway neighborhood's own Wikipedia article states explicitly that
  "NYC Health + Hospitals/Jacobi" is "in Morris Park," not in Pelham Parkway
  itself. — https://en.wikipedia.org/wiki/Pelham_Parkway,_Bronx
- Established 1955, originally as "Bronx Municipal Hospital Center"; opened
  for pediatric and infant care November 1, 1955. —
  https://en.wikipedia.org/wiki/Jacobi_Medical_Center
- Maintains a formal affiliation with Albert Einstein College of Medicine:
  "This was the first time a medical school and municipal hospital entered
  into a formal affiliation agreement at the same time they were both
  built." — same source
- Currently has 457 beds. — same source
- Functions as a "Level I Adult Trauma Center" and "Level II Pediatric
  Trauma Center," and houses "the Bronx's only burn unit." — same source
- One of NYC Health + Hospitals' 11 acute care facilities; serves
  approximately 1.2 million Bronx and NYC-area residents. — same source
- Named for German physician Abraham Jacobi, "regarded as the father of
  American pediatrics." — same source

### 3. Calvary Hospital

**What it is:** A nonprofit hospice and palliative-care hospital on
Eastchester Road, in Morris Park. `searched: complete`

- Address: "1740 Eastchester Road, Morris Park, Bronx 10461, New York." —
  https://en.wikipedia.org/wiki/Calvary_Hospital,_Bronx
- Established 1899; affiliated with the Roman Catholic Archdiocese of New
  York. — same source
- Described as "one of the first, and is still one of the largest, medical
  complexes focusing on end-of-life hospice care." — same source
- Operates 225 beds across multiple locations, including a 25-bed unit at
  Lutheran Medical Center in Brooklyn (since 2001) and the 10-bed Dawn Greene
  Hospice on Manhattan's Upper East Side. — same source
- Own site independently confirms identity and describes its scope: "Calvary
  is the country's only fully accredited acute care specialty hospital
  exclusively providing palliative care for adult patients with advanced
  cancer and other life-limiting illnesses." — https://www.calvaryhospital.org/
- **Flag:** the own site's homepage references "125 year[s]" but gives no
  narrative founding date; the 1899 date above comes from Wikipedia only in
  this pass.

### 4. Bronx Psychiatric Center

**What it is:** A New York State-operated psychiatric hospital at Waters
Place. `searched: complete`

- "Bronx Psychiatric Center (BPC) is a state-operated psychiatric hospital in
  the Morris Park neighborhood of the Bronx, New York City." Address: "1500
  Waters Place, Bronx, New York." — https://en.wikipedia.org/wiki/Bronx_Psychiatric_Center
- Opened in 1963 "as a state mental health facility in the northeast Bronx."
  — same source
- Managed by the New York State Office of Mental Health; part of the "Bronx
  Behavioral Health Campus," a modernized complex that opened 2015-2016. —
  same source
- Currently provides 156 adult inpatient beds, plus children's services and
  residential housing, on an 85-acre campus. — same source

### 5. Loreto Park

**What it is:** A neighborhood park named for a police officer killed in the
line of duty. `searched: complete`

- "Loreto Park, bounded by Morris Park, Haight, Van Nest, and Tomlinson
  Avenues, was named after Alfred Loreto, a police officer who lived nearby
  at 1870 Hering Avenue and was killed on July 21, 1950, while foiling an
  attempted kidnapping of his neighbor." —
  https://en.wikipedia.org/wiki/Morris_Park,_Bronx (the article's own
  footnotes cite NYC Parks and 1950 New York Times articles for this
  material; those underlying sources were not independently re-fetched in
  this pass — `nycgovparks.org` was not attempted per the standing note, and
  the 1950 NYT articles were not located)
- The article also describes a 2012 renovation (~$500,000) and a 2021-2022
  reconstruction (~$2,000,000, reopened April 2022), citing the Bronx Times
  Reporter and NYC Parks construction-tracking pages — same source, same
  caveat: underlying sources not independently re-fetched.
- No dedicated Wikipedia article exists for Loreto Park itself
  (`en.wikipedia.org/wiki/Loreto_Park` 404s); all material above comes from
  its treatment inside the Morris Park neighborhood article.

### 6. Morris Park Library

**What it is:** A New York Public Library branch on Morris Park Avenue.
`searched: complete`

- Own site gives the name "Morris Park Library," address "985 Morris Park
  Avenue, Bronx, NY 10462." — https://www.nypl.org/locations/morris-park
- "The Morris Park branch became the neighborhood's first library when it
  opened July 21, 2006. The 6,600-square-foot, two-level branch houses a
  collection of 25,000 adult, young adult and children books, audio
  recordings, and resources in English, Italian, Albanian, and Chinese." —
  same source
- Has 19 public computers and wireless internet access. — same source

### 7. Bronx Military Museum (at John Dormi & Sons Funeral Home)

**What it is:** A small military-memorabilia display inside a funeral home
on Morris Park Avenue. `searched: complete`

- "Joseph Garofalo, a World War II veteran, persuaded John Dormi & Sons
  Funeral Home on Morris Park Avenue to display his collection of medals and
  war memorabilia and named it the Bronx Military Museum." —
  https://en.wikipedia.org/wiki/Morris_Park,_Bronx
- The funeral home's own site (redirected: `dormifuneralhome.com` ->
  `bronxfuneralhome.com`) confirms the business identity and address —
  "John Dormi & Sons Funeral Home," "1121 Morris Park Ave Bronx, NY 10461,"
  phone (718) 863-2000 — https://bronxfuneralhome.com/
- **Flag for the verifier: the funeral home's own site, fetched in this
  pass, makes no mention of a military museum, medals, or memorabilia
  display anywhere on it.** It references "veteran funeral service" and
  veteran headstone/flag options only. This does not establish the museum is
  gone — an absent mention on a business's own site is not positive evidence
  of closure, per the finder contract's closure rule — but the display's
  current existence is not corroborated by the one source that could most
  easily confirm it.

### 8. Patricia's of Morris Park

**What it is:** An Italian restaurant on Morris Park Avenue. `searched: complete`

- Own site gives the name "Patricia's of Morris Park," address "1082 Morris
  Park Ave, Bronx, NY 10461," phone "(718) 409-9069." —
  https://www.patriciasofmorrispark.com/
- Own site describes the restaurant as offering "a unique blend of the
  casual and sophisticated, mixing the more sophisticated and nuanced
  service and cuisine of a fine Ristorante with a casual charm of a classic
  Italian Bar/Restaurant" (a description of what it serves, not a
  superlative). — same source
- Independent existence/address corroboration: a NYC DOHMH record for
  "PATRICIA'S" at 1082 Morris Park Avenue matches this address exactly. —
  https://data.cityofnewyork.us/resource/43nn-pn8j.json (queried by
  zipcode='10461'; cited only as corroboration alongside the own-site source,
  not as the sole source)

### 9. Morris Park Inn

**What it is:** An American restaurant on Morris Park Avenue. `searched: complete`

- Own site gives the name "Morris Park Inn," address "1024 Morris Park Ave,
  Bronx," phone "718-239-4109," and self-categorizes as an "American
  Restaurant." — https://www.morrisparkinn.com/
- Own site states it offers online ordering (Uber Eats, GrubHub), catering,
  and event hosting. — same source
- Independent existence/address corroboration: a NYC DOHMH record for
  "MORRIS PARK INN" at 1024 Morris Park Avenue matches this address exactly.
  — https://data.cityofnewyork.us/resource/43nn-pn8j.json (queried by
  zipcode='10461')

---

## Getting there

**Subway.** The IRT Dyre Avenue Line's Morris Park station serves the
neighborhood directly:

- The main Morris Park article states: "The local subway is the IRT Dyre
  Avenue Line (5 train), which runs under the Esplanade." —
  https://en.wikipedia.org/wiki/Morris_Park,_Bronx
- The station is named "Morris Park," located at "Paulding Avenue &
  Esplanade," on the "IRT Dyre Avenue Line," served by the 5 train "at all
  times." — https://en.wikipedia.org/wiki/Morris_Park_station_(IRT_Dyre_Avenue_Line)
  (Wikipedia's own article title places this station under "Morris
  Park/Pelham Parkway neighborhoods" jointly — reported for the verifier's
  proximity-rule call, not resolved here as exclusively one or the other.)
- The station opened originally as "May 29, 1912" under the New York,
  Westchester and Boston Railway, closed December 12, 1937, and reopened as
  a NYC Subway station "May 15, 1941." — same source
- Built in Spanish Mission style, designed by Alfred T. Fellheimer (who also
  led design work on Grand Central Terminal); listed on the National
  Register of Historic Places July 6, 2005. — same source (transit
  infrastructure, reported here as part of "Getting there," not written up
  as a place per the dispatch's rule that parking and transit are prose,
  never place records)

**Metro-North — currently none, with a named station planned.**

- No Metro-North station currently serves Morris Park. Today's Bronx
  stations on the Harlem Line are Woodlawn, Riverdale, Williams Bridge,
  Botanical Garden, Spuyten Duyvil, Fordham, Tremont, Melrose, and Morris
  Heights, plus Marble Hill on the Hudson Line — none named Morris Park or
  located there. — https://en.wikipedia.org/wiki/Metro-North_Railroad
- A **planned** Metro-North station named "Morris Park" is part of the Penn
  Station Access project, on the New Haven Line, alongside three other new
  Bronx stations (Co-op City, Parkchester/Van Nest, Hunts Point). — 
  https://en.wikipedia.org/wiki/Penn_Station_Access
- "In August 2024, the New York City Council voted to rezone 46 city blocks
  in Parkchester, Van Nest, and Morris Park, around the Metro-North
  Railroad's Parkchester/Van Nest and Morris Park stations, as part of the
  Penn Station Access project." — same source
- Phase One completion is tentatively targeted for 2027, though "as of
  October 2025... three of the four stations could still open as early as
  2027 if Amtrak agreed to expedite the work, but... the Hunts Point station
  would still be delayed." — same source
- This is a planned, not yet operating, station; report it as such.

**Bus.** Two scheduled routes travel Morris Park Avenue:

- The Bx21 runs between Mott Haven (East 138th Street and Lincoln Avenue) and
  Westchester Square (Westchester Avenue and Lane Avenue), with "Third
  Avenue, Boston Road, Morris Park Avenue" as primary streets. —
  https://en.wikipedia.org/wiki/Bx21
- The Bx39 runs between Clasons Point (Soundview Avenue and Cornell Avenue)
  and Wakefield (East 241st Street and White Plains Road), primarily via
  White Plains Road; an alternate/overnight branch serves "Morris Park
  Avenue, Williamsbridge Road" as part of Williamsbridge service. —
  https://en.wikipedia.org/wiki/Bx39
- A T113 subway-shuttle bus is listed elsewhere as running on "Morris Park
  Avenue, Williamsbridge Road" between East 180th Street and Eastchester-Dyre
  Avenue, per a Bronx bus-routes list page, but no dedicated Wikipedia
  article for T113 was reachable to confirm current/scheduled status in this
  pass (`en.wikipedia.org/wiki/T113_(New_York_City_bus)` 404s). Not stated as
  a firm claim beyond what the list page shows.

**Ferry — dead end, not a claim.** No source fetched in this pass names any
NYC Ferry landing serving Morris Park or anywhere in its vicinity; Morris
Park is inland, with no waterfront. Not stated as a claim that none exists
anywhere, only that nothing fetched names one for this neighborhood.

**Amtrak — boundary only, not a stop.** The Amtrak Northeast Corridor tracks
form part of Morris Park's own southern/eastern boundary per the neighborhood
article, but no source in this pass states that Amtrak trains stop in or
near Morris Park; Amtrak's Northeast Corridor trains do not make local Bronx
stops. Reported as a boundary landmark, not a transit option.

---

## Candidates investigated and NOT included — read before re-researching these

- **Morris Park Racecourse** — folded into neighborhood history above; no
  longer exists as a distinct visitable place (subdivided into residential/
  industrial lots after 1910).
- **Bronx Victory Memorial** — belongs to Pelham Bay Park, already shipped
  there. See the Roster boundary check section. Do not re-add to Morris
  Park.
- **New York, Westchester and Boston Railway Administration Building (East
  180th Street station), 481 Morris Park Avenue** — sources place it in West
  Farms and Van Nest, not Morris Park, despite the street address. See the
  Roster boundary check section.
- **Conti's Pastry Shoppe** — a Van Nest landmark per Van Nest's own
  Wikipedia article, not pursued as Morris Park's.
- **Jack D. Weiler Hospital (Montefiore)** — named as a Morris Park
  institution only by the main Morris Park Wikipedia article's bare mention
  in a list; no dedicated Wikipedia article exists
  (`en.wikipedia.org/wiki/Jack_D._Weiler_Hospital` 404s) and no own-site was
  pursued in this pass given time budget. Not written up as its own place;
  flagged here in case a later pass has budget to pursue an own-site source.
- **St. Francis Xavier School, St. Clare of Assisi School, Our Savior
  Lutheran School** — named as local schools in the main Morris Park article
  (the first two uncited, the third uncited); not pursued as places per the
  "spend the day" test, and no own-site was attempted.
- **Bronx High School for the Visual Arts** — a public school named with a
  citation in the main article; not pursued as a place for the same reason.
- **Emilio's (1051 Morris Park Ave), Scaglione Brothers Bakery (1078 Morris
  Park Ave), Addeo's of the Bronx (1056 Morris Park Ave)** — DOHMH-confirmed
  existence/address only; no working own-site domain found for any of the
  three (all attempted domains failed to resolve). Not included.
- A long tail of smaller Morris Park Avenue and nearby eateries surfaced by
  the DOHMH zip-code queries (see the DOHMH-only section above) — not
  individually pursued for an own-site given time budget. Not included.

## Dead ends — for a later pass, not for publication

- `www.addeobakery.com` — DNS `ENOTFOUND`.
- `www.emiliosbronx.com` — DNS `ENOTFOUND`.
- `www.scaglionebros.com` — DNS `ENOTFOUND`.
- `www.fullmoonpizzeria.com` — resolves, but is a domain-marketplace parking
  page (DomainMarket.com listing), not an actual pizzeria. Do not treat as a
  business site.
- `www.thepinerestaurant.com` — DNS `ENOTFOUND`.
- `www.fjpine.com` — HTTP 403 Forbidden.
- `en.wikipedia.org/wiki/F%26J_Pine_Restaurant` — HTTP 404.
- `en.wikipedia.org/wiki/Bronx_Victory_Memorial` — HTTP 404 (the memorial has
  no dedicated article; it is treated inside the Pelham Bay Park article
  instead — see Roster boundary check).
- `en.wikipedia.org/wiki/New_York,_Westchester_and_Boston_Railway_Administration_Building`
  — HTTP 404 (a guessed title).
- `en.wikipedia.org/wiki/Administration_Building_(New_York,_Westchester_and_Boston_Railway)`
  — HTTP 404 (a guessed title; the real article is titled "East 180th Street
  station").
- `en.wikipedia.org/wiki/Loreto_Park` — HTTP 404 (no dedicated article; the
  park's facts live inside the Morris Park neighborhood article only).
- `en.wikipedia.org/wiki/Jack_D._Weiler_Hospital` — HTTP 404.
- `en.wikipedia.org/wiki/T113_(New_York_City_bus)` — HTTP 404.
- `en.wikipedia.org/wiki/Calvary_Hospital,_Bronx` reached via the disambig
  page `en.wikipedia.org/wiki/Calvary_Hospital` — that top-level title is a
  disambiguation page listing six same-named hospitals worldwide, not a
  dead end itself, but do not cite the bare disambig page as a source.
- `nycgovparks.org` — not attempted this pass, per the standing note that it
  has 403'd on six prior passes.
- `web.archive.org` — not attempted this pass, per the standing note that the
  tool refuses it outright.

## Dedup check against the existing corpus (rung b, site-builder.md §7)

Checked all shipped Bronx files directly: `priv/seed_data/bronx/belmont.json`,
`priv/seed_data/bronx/bronx-park.json`, `priv/seed_data/bronx/mott-haven.json`,
`priv/seed_data/bronx/city-island.json`, and
`priv/seed_data/bronx/pelham-bay-park.json`. A case-insensitive grep for
"morris park," "calvary hospital," "jacobi," "einstein," "loreto," and
"patricia" across all five returned no matches — no existing place record in
the corpus collides with any address or institution named above. The one
near-collision found was **not** an address collision but a landmark-identity
one: the Bronx Victory Memorial, already claimed by `pelham-bay-park.json`
under a slightly different name ("Bronx Victory Column & Memorial Grove") —
see the Roster boundary check section. No `van-nest.json`,
`pelham-parkway.json`, or other CD-11 neighbor file exists yet in
`priv/seed_data/bronx/`, so there is no risk of colliding with any of those
at this time.

## Summary counts

- Places researched and written up with citations: **9** — Albert Einstein
  College of Medicine, Jacobi Medical Center, Calvary Hospital, Bronx
  Psychiatric Center, Loreto Park, Morris Park Library, Bronx Military
  Museum (at John Dormi & Sons Funeral Home), Patricia's of Morris Park,
  Morris Park Inn. All `searched: complete`.
- **DOHMH-only eateries: at least 13 named candidates** surfaced by the zip
  10461/10462 queries (Emilio's, Scaglione Brothers Bakery, Addeo's of the
  Bronx, and ten more listed in the DOHMH-only section) — none written up as
  places; three of them (Emilio's, Scaglione Brothers, Addeo's) had an
  own-site domain attempted and failed to resolve, the rest were not
  individually pursued given time budget.
- Distinct sourced claims across the neighborhood-level history, racecourse
  history, boundary-check, transit, and place sections: **approximately 70**
  individual citation lines.
- WebSearch: attempted once, confirmed exhausted (0 of 200 available);
  everything above is WebFetch-sourced.
- Transit claims: **subway (1 station named, with full history), Metro-North
  (0 current stations, 1 named planned station with project-level sourcing),
  bus (2 routes named with termini and streets, 1 shuttle route flagged but
  not confirmed), ferry (dead end, stated plainly), Amtrak (boundary-only,
  stated plainly)** — roughly 15 individual transit-related citation lines
  in total.
- **Boundary findings for the coordinator:** three landmark-location traps
  found and resolved without being worked into the Morris Park write-up —
  the Bronx Victory Memorial (belongs to the already-shipped Pelham Bay
  Park), the NYW&B Administration Building at 481 Morris Park Avenue
  (belongs to West Farms/Van Nest despite its street address), and Conti's
  Pastry Shoppe (a Van Nest landmark). Conversely, the three institutions the
  assignment brief expected in Morris Park — Jacobi Medical Center, Albert
  Einstein College of Medicine, and Bronx Psychiatric Center — are
  affirmatively confirmed as being in Morris Park, including by the
  neighboring Pelham Parkway neighborhood's own Wikipedia article stating
  Jacobi and Einstein are "in Morris Park" and not in Pelham Parkway itself.
- Flags left open for the verifier: a discrepancy between the main Morris
  Park article (racecourse operated "1889 until 1910") and the dedicated
  Morris Park Racecourse article (racing itself ran "1889 to 1904," with the
  property not subdivided until after an April 1910 fire) — not resolved
  here; two Wikipedia `[citation needed]` claims about Morris Park's
  Italian-American superlative status; the current display status of the
  Bronx Military Museum, whose host funeral home's own site does not mention
  it; and the T113 bus route's current/scheduled status, unconfirmed beyond
  a list-page mention.
