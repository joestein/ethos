# Kingsbridge — finder artifact

Role: FINDER only. No verdicts below. Every line is "source says X"; adjudication
(`confirmed`/`refuted`/`uncertain`) is for an independent verifier who has not
seen this reasoning.

`priv/seed_data/bronx/kingsbridge.json` has not been authored yet. This file is
its input, alongside whatever verifier artifact follows it.

Roster: `priv/seed_data/bronx_roster.json`, slug `kingsbridge`, community
district 8, wave 3, `in_scope: true`.

**The eight hard rules from `docs/site-builder.md` §4 bind this pass** (restated
per the dispatch instruction, not paraphrased):
1. The authoring contract binds (`docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md`).
2. No minimum word count, anywhere.
3. A closure requires positive evidence; uncertain never deletes.
4. A business's own site cannot establish an award, ranking, superlative, or
   that it is still trading — only that it exists, what it serves, where.
5. The finder never writes verdicts.
6. The gate scans every prose field; a wave cleans every mention of its places.
7. Parking and public transport are prose in "Getting there," never place records.
8. Nothing about identity is taken from recollection or an unchecked list.

## Search access — report this first

**WebSearch was attempted once and confirmed unavailable.** Query issued:
"Kingsbridge Bronx Kingsbridge Armory history". Result:

> "Web search was not performed: this session has used its web search budget
> (200 of 200 WebSearch calls). Continue with the information already gathered
> instead of issuing more searches."

Zero WebSearch queries succeeded. Everything below was gathered via **WebFetch**
against Wikipedia, the NYC Public Library's own site, and Wikipedia's own list
pages (NYC Designated Landmarks in the Bronx, Carnegie libraries in New York
City, bus-route articles). `nycgovparks.org` was not attempted, per the
dispatch's note that it has 403'd on six prior passes. `web.archive.org` was
not attempted, per the dispatch's note that the tool refuses it outright. A
business's own site was attempted once
(`kingsbridgeriverdalevancortlandt.org`, the presumed BID/civic-group site) and
failed to resolve (`ENOTFOUND`) — see Dead ends.

---

## Boundary check — read before anything else

This roster has burned two prior neighborhoods on exactly this mistake
(`fordham-heights` scoped instead of `fordham-manor`, which held Poe Cottage;
`pelham-bay` scoped instead of `pelham-bay-park`, which held Orchard Beach).
I read the full roster before researching a single place. Rows adjacent or
similar to `kingsbridge` (CD8, wave 3, in_scope true):

- `kingsbridge-heights` — CD **7** per the roster, `in_scope: false`.
- `van-cortlandt-village` — CD8, `in_scope: false`.
- `spuyten-duyvil` — CD8, `in_scope: false`.
- `riverdale` — CD8, `in_scope: true` (separate finder).
- `fieldston` — CD8, `in_scope: false`.
- `north-riverdale` — CD8, `in_scope: false`.
- `van-cortlandt-park` — CD8, `in_scope: true` (separate finder).

**Finding: the dispatch brief's own list of "what Kingsbridge holds" contains
a landmark that Wikipedia's own dedicated article places in a neighboring,
out-of-scope row.**

- **The Kingsbridge Armory does not sit in Kingsbridge per its own Wikipedia
  article.** Verbatim: "a decommissioned armory at Jerome Avenue and West
  Kingsbridge Road in the **Kingsbridge Heights** neighborhood of the Bronx."
  — https://en.wikipedia.org/wiki/Kingsbridge_Armory. The Kingsbridge Heights,
  Bronx article independently corroborates, listing "Kingsbridge Armory:
  Located on Kingsbridge Road, constructed on the site of the former Bathgate
  mansion in the early 1900s" among *its own* landmarks. —
  https://en.wikipedia.org/wiki/Kingsbridge_Heights,_Bronx. **Not written up as
  a Kingsbridge place below**, per the standing instruction not to claim a
  place sources put next door. Note for whoever researches Kingsbridge
  Heights: the general `Kingsbridge, Bronx` overview article (not the
  armory's own dedicated article) lists the Kingsbridge Heights community
  district as CD8 ("Part of Bronx Community District 8, with ZIP codes 10463
  and 10468" — https://en.wikipedia.org/wiki/Kingsbridge_Heights,_Bronx), which
  conflicts with the roster's CD7 for that row. Flagging the CD discrepancy;
  not resolving it.
- **The James J. Peters VA Medical Center does not sit in Kingsbridge per its
  own Wikipedia article either.** Verbatim: "130 West Kingsbridge Road in
  **West Fordham**, Bronx, New York City" (the article's infobox separately
  labels the neighborhood field "Kingsbridge Heights, Bronx" as an alternate).
  — https://en.wikipedia.org/wiki/James_J._Peters_VA_Medical_Center. Neither
  label is "Kingsbridge." The general Kingsbridge overview article lists it
  as a Kingsbridge-area landmark with the parenthetical "(Kingsbridge
  Heights)" attached to its own name, i.e. that overview article itself
  concedes the location. **Not written up as a Kingsbridge place below.**
- **Gaelic Park / Manhattan University — conflicting placement, flagged, not
  resolved.** The general Kingsbridge overview article lists "Manhattan
  University (operates Gaelic Park)" among Kingsbridge institutions. But
  Manhattan University's own dedicated article states the campus "occupies a
  relatively compact campus... in the residential **Riverdale** section of
  the Bronx," and places Gaelic Park itself "on 240th Street" —
  https://en.wikipedia.org/wiki/Manhattan_College. Kingsbridge's own boundary
  (per its dedicated article) is Manhattan College Parkway on the *north*,
  and 240th Street lies north of that line. **Not written up as a Kingsbridge
  place below**; flagged for whoever researches Riverdale.
- **The "Castle of Kingsbridge" (2744 Kingsbridge Terrace)** is listed among
  Kingsbridge Heights's own landmarks by the Kingsbridge Heights, Bronx
  article, not by the Kingsbridge, Bronx article. Not pursued further and not
  written up here; flagged for Kingsbridge Heights.
- **Fort Independence Park and Old Fort Four Park are the opposite case —
  claimed by Kingsbridge's own article, and independently by a subsection
  of Kingsbridge.** The `Kingsbridge, Bronx` Wikipedia article itself
  describes both directly in its own body text (see Places, below), and
  the `Van Cortlandt Village` Wikipedia article states outright: "Van
  Cortlandt Village is a subsection of the **Kingsbridge** neighborhood in
  the New York City borough of the Bronx" —
  https://en.wikipedia.org/wiki/Van_Cortlandt_Village — before going on to
  describe Fort Independence Park in the same breath. Both parks are written
  up below on the strength of the Kingsbridge article's own text, with this
  cross-source agreement noted. (Van Cortlandt Village remains its own
  `in_scope: false` roster row; I am not claiming the whole of that row, only
  the two parks the Kingsbridge article itself names.)
- **Kings Bridge Historical Society library building vs. current library
  branch — two different addresses, not resolved here.** See the Places
  section (Kingsbridge Library) below.

So: of the landmarks named in the dispatch brief, the Kingsbridge Armory
and (by extension) its associated VA-hospital neighbor are **not** Kingsbridge
per their own dedicated sources — this is the finding the dispatch asked me
to surface rather than work around. The former Kings Bridge itself and Fort
Independence Park **do** check out as Kingsbridge per sources below. The
Broadway commercial strip also checks out (Broadway is Kingsbridge's own
retail spine per its own article).

---

## Eateries / shops — none investigated this pass

No specific restaurant, shop, or business name was supplied in the dispatch
brief, and no dedicated Wikipedia article surfaced one in the course of
researching the neighborhood-level material below. **DOHMH-only count: 0**,
because zero candidate eateries were checked against the DOHMH dataset this
pass — this is a gap, not a finding of "none exist." A later pass with time
budget to query the DOHMH Socrata endpoint by Kingsbridge zip codes (10463,
and 10468 where it overlaps Kingsbridge Heights) could still surface
DOHMH-only candidates the way City Island's pass did.

---

## Neighborhood-level history and orientation

- Kingsbridge's boundaries: "Manhattan College Parkway to the north, the
  Major Deegan Expressway or Bailey Avenue to the east, West 230th Street to
  the south, and Irwin Avenue to the west." — https://en.wikipedia.org/wiki/Kingsbridge,_Bronx
- Community District: Bronx Community District 8. — same source
- Coordinates: 40.879°N, 73.905°W. — same source
- Policed by the NYPD's 50th Precinct, located at 3450 Kingsbridge Avenue. — same source
- Fire coverage from Engine Co. 81/Ladder Co. 46 at 3025 Bailey Avenue. — same source
- "The neighborhood is named for the King's Bridge, likely erected by
  enslaved Africans in 1693 and owned by Frederick Philipse." — same source
- The bridge "spanned a now-filled-in section of Spuyten Duyvil Creek,
  roughly parallel to today's 230th Street." — same source
- "The bridge is said to still be in place, having been buried when the
  creek bed was filled in." — same source
- Independent corroboration of the bridge's construction: "In 1693 Frederick
  Philipse, a powerful Dutch landowner who had sworn allegiance to the Crown
  upon the British takeover of Dutch New Netherlands, built the King's Bridge
  at Marble Hill near what is now West 230th Street in the Bronx." —
  https://en.wikipedia.org/wiki/Spuyten_Duyvil_Creek
- After the American Revolution, "Philipse Manor was forfeited to the state
  legislature, after which the King's Bridge was free" (i.e., tolls ended). — same source
- The area was part of the Town of Kingsbridge until annexed by New York City
  in 1874. — https://en.wikipedia.org/wiki/Kingsbridge,_Bronx
- "For most of the American Revolutionary War, the area was under British
  control." — same source
- 2010 Census population of "Kingsbridge and Spuyten Duyvil" combined:
  30,161, "a change of 289 (1%) from the 29,872 counted in 2000." (This
  figure is explicitly for the two neighborhoods combined, not Kingsbridge
  alone.) — same source
- Racial composition of that combined 2010 count: 49.3% (14,872) White, 8.9%
  (2,691) African American, 33.8% (10,204) Hispanic or Latino. — same source
- Streets connecting Riverdale and Kingsbridge include "step streets," with
  stairways of "as many as 160 steps climbing the slope." — same source
- "Kingsbridge is also part of a business improvement district that is home
  to 200 merchants, and is one of the largest retail shopping districts in
  the Bronx." — same source
- Dominicans "predominantly live along Broadway and adjacent side streets"
  per the same article's demographic discussion. — same source
- On 233rd Street and Bailey Avenue is a baseball field run by Kingsbridge
  Little League, with "lights, dugouts, stands, and a small food court." — same source

### Fort Independence and Old Fort Four (Revolutionary War sites)

- "A stone wall in Fort Independence Park/Playground (on Sedgwick Avenue and
  Giles Place) is believed to be the only extant physical trace of Fort
  Independence built by the Continental Army in 1776." — https://en.wikipedia.org/wiki/Kingsbridge,_Bronx
- "On January 18–28, 1777, an American force led by General William Heath
  unsuccessfully attempted to recapture Fort Independence." — same source
- "The nearby Old Fort Four Park/Playground (at 2890 Sedgwick Ave.) is named
  for Fort Number Four, which was the largest in a series of eight outer
  defenses built by the Continental Army in 1777." — same source
- Separately, Fort Independence Park is described (in the Van Cortlandt
  Village article) as "stretching along part of Sedgwick Avenue," "a popular
  neighborhood spot with handball courts, a basketball court and a
  playground." — https://en.wikipedia.org/wiki/Van_Cortlandt_Village
- Same source, on the wider area: "The community sits atop the ruins of a
  Revolutionary War fort and was designed by legendary landscape architect
  Frederick Law Olmsted." **Flag for the verifier, not resolved here:** the
  antecedent of "the community" in this sentence is ambiguous — it could mean
  the Van Cortlandt Village street/housing layout generally, or the park
  specifically. No source found attributes Fort Independence Park itself,
  by name, to Olmsted as its designer.
- "The Fort Independence Park Neighborhood Association has been fighting a
  handful of land grabs and new housing projects" in Van Cortlandt Village. — same source
- "As of 2015 some former co-ops such as the Shalom Aleichem Houses had
  fallen on hard times and the character of the neighborhood was threatened
  by overdevelopment." — same source

---

## Places

### 1. King's Bridge (historic bridge site)

**What it is:** The Revolutionary-era bridge that gave the neighborhood its
name; buried in place, not extant above ground. `searched: complete`

- Built in 1693 by Frederick Philipse, crossing what is now filled-in
  Spuyten Duyvil Creek near present-day West 230th Street. —
  https://en.wikipedia.org/wiki/Kingsbridge,_Bronx and
  https://en.wikipedia.org/wiki/Spuyten_Duyvil_Creek
- "The bridge is said to still be in place, having been buried when the
  creek bed was filled in." — https://en.wikipedia.org/wiki/Kingsbridge,_Bronx
- Freed of tolls after the Revolution when Philipse Manor was forfeited to
  the state legislature. — https://en.wikipedia.org/wiki/Spuyten_Duyvil_Creek
- The neighborhood, and the historic Town of Kingsbridge (annexed to New
  York City in 1874), are both named for this bridge. — https://en.wikipedia.org/wiki/Kingsbridge,_Bronx

### 2. Fort Independence Park / Playground

**What it is:** A park on Sedgwick Avenue sitting atop the remains of a 1776
Continental Army fort. `searched: complete`

- Located "on Sedgwick Avenue and Giles Place." — https://en.wikipedia.org/wiki/Kingsbridge,_Bronx
- "A stone wall in Fort Independence Park/Playground... is believed to be the
  only extant physical trace of Fort Independence built by the Continental
  Army in 1776." — same source
- "On January 18–28, 1777, an American force led by General William Heath
  unsuccessfully attempted to recapture Fort Independence." — same source
- Independently described (Van Cortlandt Village article) as stretching
  "along part of Sedgwick Avenue," with "handball courts, a basketball court
  and a playground." — https://en.wikipedia.org/wiki/Van_Cortlandt_Village
- **Not resolved here:** whether Frederick Law Olmsted designed this specific
  park — see the flag under Neighborhood-level history above.

### 3. Old Fort Four Park / Playground

**What it is:** A park at 2890 Sedgwick Avenue named for a second
Revolutionary War fort. `searched: complete`

- Address: 2890 Sedgwick Ave. — https://en.wikipedia.org/wiki/Kingsbridge,_Bronx
- "Named for Fort Number Four, which was the largest in a series of eight
  outer defenses built by the Continental Army in 1777." — same source

### 4. St. John's Church (Roman Catholic)

**What it is:** A Tudor Revival Roman Catholic parish church, individually
designated a NYC Landmark. `searched: complete`

- Full name per its dedicated Wikipedia article: "The Church of St. John."
  Address: 3021 Kingsbridge Avenue, Kingsbridge, Bronx. — https://en.wikipedia.org/wiki/St._John%27s_Church_(Bronx)
- Independently listed by address and neighborhood in the borough-wide NYC
  landmarks list: "St. John's Church, 3021 Kingsbridge Avenue | February 19,
  1974 | Kingsbridge." — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- Roman Catholic, under the Archdiocese of New York; architect Davis, McGrath
  & Kiessling; Tudor Revival style. — https://en.wikipedia.org/wiki/St._John%27s_Church_(Bronx)
- Property purchased in 1870; first timber-framed church dedicated by
  Cardinal McCloskey on December 4, 1877; that structure was demolished in
  1893; the present church's basement work began in 1893 and the present
  church was completed in 1904. — same source
- The present church has "a beautiful painting, a copy of Brumidi's
  'Crucifixion,' above the altar," and a basement containing "a chapel,
  hall, theater, club-rooms, and gymnasium." — same source
- In November 2014, St. John's Parish merged with the Church of the
  Visitation. — same source

### 5. Kingsbridge Library (New York Public Library branch)

**What it is:** An active NYPL branch; a separate, earlier Carnegie-funded
building of the same name closed decades ago. Two distinct addresses appear
across sources — flagged, not resolved. `searched: complete`

- The library's own site gives its current name, "Kingsbridge Library,"
  address "291 West 231st Street, Bronx, NY 10463," and states "the
  Kingsbridge branch of The New York Public Library has been an integral
  part of its neighborhood since 1905." — https://www.nypl.org/locations/kingsbridge
- **Separately**, Wikipedia's list of Carnegie libraries in New York City
  gives an entry for "Kingsbridge" at a different address — "3041 Kingsbridge
  Ave" — designed by McKim, Mead & White and opened May 19, 1905, which
  "outgrew its original building and closed in 1958" and "is now the
  Spuyten Duyvil Preschool." — https://en.wikipedia.org/wiki/List_of_Carnegie_libraries_in_New_York_City
- **Flag for the verifier:** both sources agree on the 1905 founding year but
  give two different street addresses (291 West 231st Street vs. 3041
  Kingsbridge Ave) for what appears to be the same branch's history before
  and after a mid-century move. Not resolved here; a verifier should decide
  which address (or both, sequentially) belongs in the record, and note that
  the original Carnegie building itself is no longer a library.

### 6. Broadway commercial corridor (Kingsbridge)

**What it is:** Kingsbridge's retail spine along Broadway, part of a
business improvement district. `searched: complete`

- "Kingsbridge is also part of a business improvement district that is home
  to 200 merchants, and is one of the largest retail shopping districts in
  the Bronx." — https://en.wikipedia.org/wiki/Kingsbridge,_Bronx
- Dominicans "predominantly live along Broadway and adjacent side streets." — same source
- Broadway through this stretch carries the elevated IRT Broadway–Seventh
  Avenue Line structure and both the 231st Street and 238th Street subway
  stations sit directly on it (see Getting There). — https://en.wikipedia.org/wiki/231st_Street_station and https://en.wikipedia.org/wiki/238th_Street_station
- The BID's own presumed web presence (`kingsbridgeriverdalevancortlandt.org`)
  could not be reached — DNS failure — so no own-site corroboration beyond
  the Wikipedia claim above was obtained this pass. See Dead ends.

---

## Getting there

**Subway.** The IRT Broadway–Seventh Avenue Line runs elevated through
Kingsbridge on Broadway, with two stations inside the neighborhood:
- **231st Street** (at West 231st Street & Broadway): served by the 1 train
  at all times; elevated structure, 2 side platforms; opened January 27,
  1907 as "230th Street station." — https://en.wikipedia.org/wiki/231st_Street_station
- **238th Street** (at West 238th Street & Broadway): served by the 1 train
  at all times; elevated structure, 2 side platforms; opened August 1, 1908. — https://en.wikipedia.org/wiki/238th_Street_station
- Both stations are explicitly located "in the Kingsbridge neighborhood of
  the Bronx" per their own dedicated articles. — same two sources

**Bus.** Multiple NYCT routes run through or terminate in Kingsbridge:
- **Bx1** (limited-stop): runs between Mott Haven and "Riverdale, West 231st
  Street and Riverdale Avenue," via the Grand Concourse and Sedgwick Avenue,
  terminating at Kingsbridge's own 231st Street station. — https://en.wikipedia.org/wiki/List_of_bus_routes_in_the_Bronx and https://en.wikipedia.org/wiki/Bx1_and_Bx2_buses
- **Bx2** (local counterpart to Bx1): "Kingsbridge Heights – Fort
  Independence Street" to Mott Haven, also via the Grand Concourse; some
  weekday-southbound and Sunday-morning trips serve the 231st Street
  station. — https://en.wikipedia.org/wiki/Bx1_and_Bx2_buses
- **Bx7**: Washington Heights (St. Nicholas Avenue & West 167th Street) to
  Riverdale (Riverdale Avenue & West 263rd Street), via Broadway and
  Riverdale Avenue — i.e., running the length of Broadway through
  Kingsbridge. — https://en.wikipedia.org/wiki/List_of_bus_routes_in_the_Bronx
- **Bx9**: Riverdale (Broadway & West 262nd Street) to West Farms (Tremont
  Avenue & Boston Road), via Broadway, Kingsbridge Road, Fordham Road, and
  Southern Boulevard. — same source
- **Bx10**: 24-hour route, Norwood (East 206th Street & Bainbridge Avenue)
  to Riverdale (Riverdale Avenue & West 263rd Street), via Jerome Avenue,
  Bailey Avenue, West 231st Street, and Riverdale Avenue. — same source
- **Bx20** (weekday rush-hour only): Inwood (Broadway & Isham Street) to
  Riverdale (Henry Hudson Parkway & West 246th Street), via Broadway,
  Johnson Avenue, and Henry Hudson Parkway. — same source
- BxM1, BxM2, and BxM18 express routes are named as serving the area by the
  general Kingsbridge overview article, but no dedicated route article was
  reachable this pass to confirm termini or streets for any of the three. — https://en.wikipedia.org/wiki/Kingsbridge,_Bronx

**Metro-North.** No Metro-North station sits inside Kingsbridge's own
boundaries. The nearest is **Marble Hill** (Hudson Line), at 125 West 225th
Street — but that address is in Marble Hill, Manhattan, not the Bronx,
"two blocks west of the Broadway Bridge on the north side of the Harlem
River." — https://en.wikipedia.org/wiki/Marble_Hill_(Metro-North_station).
The same station's article notes that historically, before the Harlem River
Ship Canal was cut, "the nearest station was a station in the Bronx named
Kingsbridge" on the same line — i.e., a same-named station once existed but
no longer does. — same source

**Ferry — dead end, not a claim.** No source fetched this pass names any
NYC Ferry route or landing serving Kingsbridge; not checked exhaustively
against the full NYC Ferry system list this pass (City Island's earlier
finder did check that list in full and found nothing for the northwest
Bronx either).

**Bridge.** Broadway crosses the Harlem River into the Bronx via the
**Broadway Bridge**, a double-deck vertical-lift bridge (current structure
built 1957–1962) carrying Broadway/US Route 9 on its lower deck and the 1
train on its upper deck; the bridge itself "is entirely in Manhattan"
despite carrying Bronx-bound traffic and trains. — https://en.wikipedia.org/wiki/Broadway_Bridge_(Manhattan)

---

## Candidates investigated and found to belong to a neighboring row — not written up as Kingsbridge places

See the Boundary check section above for full sourcing on each:

- **Kingsbridge Armory** — Wikipedia's own dedicated article places it in
  Kingsbridge Heights. Facts gathered in case a Kingsbridge Heights pass can
  use them: built 1917, architect Pilcher & Tachau (Lewis Pilcher lead
  designer), Romanesque style, occupies 5 acres with a 180,000-sq-ft drill
  hall and 800-seat auditorium, "possibly the largest armory in the world,"
  NYC Landmark September 24, 1974, National Register December 21, 1982,
  vacant since 1996, City Council approved a redevelopment plan in late
  October 2025. — https://en.wikipedia.org/wiki/Kingsbridge_Armory
- **James J. Peters VA Medical Center** — its own article places it in
  "West Fordham" (alternately labeled "Kingsbridge Heights" in the same
  infobox); not Kingsbridge. — https://en.wikipedia.org/wiki/James_J._Peters_VA_Medical_Center
- **Gaelic Park / Manhattan University** — Manhattan University's own
  article places its campus, and Gaelic Park specifically (240th Street),
  in Riverdale, north of Kingsbridge's own Manhattan College Parkway
  boundary. — https://en.wikipedia.org/wiki/Manhattan_College
- **"Castle of Kingsbridge," 2744 Kingsbridge Terrace** — appears only in
  the Kingsbridge Heights, Bronx article's own landmark list, not
  Kingsbridge's. Not pursued further. — https://en.wikipedia.org/wiki/Kingsbridge_Heights,_Bronx

## Dead ends — for a later pass, not for publication

- `www.kingsbridgeriverdalevancortlandt.org` — DNS `ENOTFOUND` (presumed
  BID/civic-group site; could not corroborate the "200 merchants" claim
  beyond Wikipedia's own statement of it).
- `en.wikipedia.org/wiki/Fort_Independence_Park` — HTTP 404 (no standalone
  article; content only exists inside the Kingsbridge and Van Cortlandt
  Village articles, both used above).
- `en.wikipedia.org/wiki/Fort_Independence,_Bronx` — HTTP 404.
- `en.wikipedia.org/wiki/Kings_Bridge_(New_York)` — HTTP 404 (content found
  instead via the Spuyten Duyvil Creek article).
- `en.wikipedia.org/wiki/King%27s_Bridge` — resolves to a disambiguation
  page listing bridges in Belfast, Glasgow, Pennsylvania, Launceston, and
  Dublin; nothing on the Bronx bridge.
- `en.wikipedia.org/wiki/Kingsbridge_branch,_New_York_Public_Library` —
  HTTP 404 (correct current-branch data found via nypl.org instead; Carnegie
  building's own history found via the Carnegie-libraries list article).
- `en.wikipedia.org/wiki/Kingsbridge_Library` — HTTP 404.
- `en.wikipedia.org/wiki/Episcopal_Church_of_the_Mediator` — HTTP 404.
- `en.wikipedia.org/wiki/Church_of_the_Mediator_(Bronx,_New_York)` — HTTP 404.
  (The Episcopal Church of the Mediator is named as a Kingsbridge landmark by
  the general overview article, but no dedicated article was reachable under
  any title tried this pass; no facts beyond its bare name survive.)
- `en.wikipedia.org/wiki/Bx7_and_Bx9_buses` — HTTP 404 (data for both routes
  found instead via the List of bus routes in the Bronx article).
- `en.wikipedia.org/wiki/Bx10_and_Bx20_buses` — HTTP 404 (same workaround).
- `en.wikipedia.org/wiki/Bx9_bus` — HTTP 404.
- `nycgovparks.org` — not attempted this pass, per the dispatch's note that
  it has 403'd on six prior passes.
- `web.archive.org` — not attempted this pass, per the dispatch's note that
  the tool refuses it outright.

## Dedup check against the existing corpus

Grepped all five shipped Bronx seed files
(`priv/seed_data/bronx/belmont.json`, `bronx-park.json`, `city-island.json`,
`mott-haven.json`, `pelham-bay-park.json`) case-insensitively for
"kingsbridge," "fort independence," and "king's bridge"/"kings bridge": zero
matches. No existing place record in the shipped corpus collides with
anything named above. No `kingsbridge.json` or `kingsbridge-heights.json`
file exists yet in `priv/seed_data/bronx/`.

## Summary counts

- Places researched and written up with citations: **6** — King's Bridge
  (historic site), Fort Independence Park/Playground, Old Fort Four
  Park/Playground, St. John's Church, Kingsbridge Library, Broadway
  commercial corridor. All `searched: complete`.
- **DOHMH-only eateries: 0** — zero candidate eateries were investigated
  this pass (no name was supplied and none surfaced independently); this is
  an open gap, not a finding of absence.
- Distinct sourced claims across the boundary-check, neighborhood-level,
  transit, and place sections: **approximately 60** individual citation
  lines.
- Transit claims: **subway (2 stations named with full detail), bus (6
  named NYCT routes with termini/streets, plus 3 named-but-unconfirmed
  express routes), Metro-North (nearest station identified and its
  cross-river/out-of-borough caveat stated), ferry (dead end, stated
  plainly), bridge (Broadway Bridge, full structural history)** — roughly
  20 individual transit-related citation lines.
- WebSearch: attempted once, confirmed exhausted (0 of 200 available);
  everything above is WebFetch-sourced.
- **Boundary finding (the one the dispatch asked me to surface, not work
  around):** the Kingsbridge Armory — the marquee landmark named in the
  dispatch brief itself — sits in Kingsbridge Heights per Wikipedia's own
  dedicated article on the armory, corroborated by Kingsbridge Heights's own
  overview article. The James J. Peters VA Medical Center likewise sits in
  "West Fordham"/"Kingsbridge Heights," not Kingsbridge, per its own
  article. Gaelic Park/Manhattan University sits in Riverdale per Manhattan
  University's own article. None of the three is written up as a Kingsbridge
  place above. Conversely, Fort Independence Park and Old Fort Four Park are
  claimed by the Kingsbridge, Bronx article's own text and are included.
- Other flags left open for the verifier: the Fort Independence Park /
  Frederick Law Olmsted design-attribution ambiguity; the two different
  street addresses given for "Kingsbridge Library" (current NYPL branch vs.
  the original, now-closed Carnegie building); and the CD7-vs-CD8
  discrepancy between the roster and Wikipedia for Kingsbridge Heights.
