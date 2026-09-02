# Far Rockaway, Queens (CD 14) — VERIFIER verdicts (wave 6)

**Role:** INDEPENDENT VERIFIER. I re-pulled every cited URL myself, as **raw wikitext**
(`?action=raw`) rather than through a summarizer, and re-quoted every string I confirm. I did not
defer to the finder's reasoning. Where the finder's quote is accurate but its *gloss* is wrong, I
refute the gloss and say so.

**Retrieval date: 2026-09-02.**

**Tools that worked for me where the finder was blocked.** `nycgovparks.org` returns **HTTP 200** to
plain Python `urlopen` with a browser UA — the finder's blanket 403 was a WebFetch artifact, and it
cost the dossier its single most decisive source. `queenslibrary.org` and `snohetta.com` also
returned 200. NYC Open Data (`enfh-gkve` Parks Properties, `9nt8-h7nd` 2020 NTAs, `43nn-pn8j`
DOHMH) answered every query.

**Tools that failed for me too:** `parks.ny.gov` (403 on every attempt, browser UA included) and
`edc.nyc` (403). So the NYS Parks and EDC primary pages remain unread by anyone.

**Four of the finder's cited URLs are redirects**, and it never said so. `Far Rockaway, Queens` →
`Far Rockaway`; `Cornell Cemetery` → `Cornell Family Cemetery`; `Russell Sage Memorial Church` →
`First Presbyterian Church of Far Rockaway`; `Rockaway Community Park` → `Edgemere Landfill`;
`Rockaway Beach (Queens)` → `Rockaway Beach, Queens`. Each resolves to a real article, so no fact
is lost — but the author must cite the **target** title, not the finder's string.

---

## HEADLINE COUNT

| | |
|---|---|
| Claims adjudicated (F1–F68) | **68** |
| Confirmed | **56** |
| Refuted | **7** |
| Uncertain | **5** |
| Candidate places offered (P1–P31) | 31 |
| **Named places that survive as publishable on far-rockaway.json** | **18** (13 of the finder's 17, minus 4, plus 5 it missed) |
| Address-only DOHMH businesses available | **~45** of 49 in ZIP 11691 (4 are Edgemere) |

**Refuted:** F3, F16, F17, F22, F38, F45, F59.
**Uncertain:** F11, F14 (Palmer's route to title), F41 (park identities), F48, F68 (PACT gloss).
**Struck from this page on neighborhood grounds:** P18, P19, P20, P21, P22 and all of P23–P31.

---

## 1. THE REQUIRED NEIGHBORHOOD RULINGS

### 1.0 A methodological warning that governs everything below

**DCP's 2020 NTA scheme cannot adjudicate Far Rockaway vs. Bayswater.** I ran every candidate's
coordinates through `9nt8-h7nd`. Every single one returns:

```
{'nta2020': 'QN1401', 'ntaname': 'Far Rockaway-Bayswater',
 'cdtaname': 'QN14 The Rockaways (CD 14 Approximation)'}
```

The tabulation area is a **joint** one. So the geocoding move that settled Rego Park and Forest
Park is unavailable here, and the Bayswater questions must be decided on the sources' own wording.
An author or arbitrator who reaches for an NTA lookup will get a false confirmation.

For contrast, the Rockaway Beach page's centroid (40.586, −73.812) returns
`{'nta2020': 'QN1402', 'ntaname': 'Rockaway Beach-Arverne-Edgemere'}` — a *different* joint area,
which likewise cannot separate Rockaway Beach from Arverne or Edgemere.

### 1.1 Places CONFIRMED in Far Rockaway, with the exact publishable address string

Every address below is quoted from the source named. Where a source gives a boundary string rather
than a street number, I say so — publish the boundary string, do not invent a number.

| Place | Publishable address string | Source and its wording |
|---|---|---|
| Far Rockaway–Mott Avenue station | `Mott Avenue & Beach 22nd Street, Queens, New York` | Wikipedia infobox `address`; `locale = Far Rockaway` |
| Beach 25th Street–Wavecrest station | `Beach 25th Street & Rockaway Freeway, Queens, New York` | Wikipedia infobox; "The **Beach 25th Street station** (signed as **Beach 25th Street–Wavecrest**)"; `locale = Far Rockaway` |
| Far Rockaway station (LIRR) | `Nameoke Avenue and Redfern Avenue, Far Rockaway, Queens` | Wikipedia infobox; "The station is located at Nameoke Avenue (formerly Nameoke Street) and Redfern Avenue." |
| Richard Cornell Graveyard | **`Caffrey Ave. bet. New Haven Ave. and Davies Rd.`** | NYC Parks property `Q463 \| Cornell Burial Ground`, ZIP 11691, 0.459 acres, `typecategory: Cemetery`; and nycgovparks.org/parks/cornell-burial-ground prints the same string |
| Far Rockaway Beach Bungalow Historic District | `Beach 24th, Beach 25th & Beach 26th Sts.` | NRHP list row `pos=29`, `city=[[Far Rockaway, Queens\|Far Rockaway]]`, `date=2013-7-17`, `refnum=13000499` |
| First Presbyterian Church of Far Rockaway (Russell Sage Memorial Church) | `1324 Beach 12 St.` (NRHP list) / `1324 Beach Twelfth St.` (article infobox) | NRHP list row `pos=79`, `city=Far Rockaway`, `date=1986-09-22`, `refnum=86002678` |
| 53rd (now 101st) Precinct Police Station **and** the operating NYPD 101st Precinct | `16-12 Mott Avenue` | LPC list `refnum=2610`, `borough=Far Rockaway`, `date=May 29, 2018`; Far Rockaway article: "patrolled by the NYPD's 101st Precinct, located at 16-12 Mott Avenue" |
| Firehouse, Engine Cos. 264 & 328, Ladder Co. 134 **and** the operating FDNY company | `16-15 Central Avenue` | LPC list `refnum=2609`, `borough=Far Rockaway`, `date=2018-05-29`; Far Rockaway article: "served by the ... FDNY's Engine Cos. 264 and 328/Ladder Co. 134, located at 16-15 Central Avenue" |
| Queens Public Library, Far Rockaway branch | `1637 Central Avenue Far Rockaway, NY 11691` | queenslibrary.org branch page, verbatim, with phone `(718) 327-2549` |
| Far Rockaway High School building / Far Rockaway Educational Campus | `821 Bay 25th Street, Far Rockaway` | Wikipedia FRHS infobox `address` |
| Yeshiva Darchei Torah | `257 Beach 17th St`, `Far Rockaway, Queens` | Wikipedia infobox `address` / `city` |
| Redfern Houses | boundary string only: `in between Beach Channel Drive/Hassock Street, Redfern Avenue and the Nassau County border` | Wikipedia: "It is located in Far Rockaway, Queens in between Beach Channel Drive/Hassock Street, Redfern Avenue and the Nassau County border." ZIP 11691 |
| Nameoke Park | `Nameoke Ave. bet. Brunswick Ave. and Augustina Ave.` | NYC Parks `Q509`, ZIP 11691, CB 414, 0.318 acres, Neighborhood Park |

### 1.2 FIVE PLACES THE FINDER MISSED ENTIRELY, all fully sourced with street numbers

The finder's §D said the Queens NRHP list "returned only three peninsula entries." **It returns
five Far Rockaway entries and two Rockaway ones.** This is the largest single gap in the dossier.

| Place | Address as printed | Source |
|---|---|---|
| **US Post Office-Far Rockaway** | `1836 Mott Ave.` | NRHP list `pos=101`, `refnum=88002500`, `city=Far Rockaway`, `date=1988-11-17`. Article: "built in 1935, and is one of six post offices in New York State designed by architect **Eric Kebbon**... two-story brick building with limestone trim... **Colonial Revival** style. Its main facade features a centrally placed polygonal shaped frontispiece with a rounded dome inspired by Thomas Jefferson's Monticello." |
| **Trinity Chapel** (also St. John's Church; Beth-El Temple Church of God in Christ) | `1874 Mott Avenue` | NRHP list `pos=99`, `refnum=01001445`, `city=Far Rockaway`, `date=2002-01-11`. Article: "built in 1858 to the design of architect **Richard Upjohn** (1802–1878)... a frame **Gothic Revival** style chapel on a brick foundation... Its name was changed to St. John's of Far Rockaway in 1881." |
| **Richard Mott House** | `12-72 Norton Drive` | NRHP list `pos=62`, `refnum=100012710`, `city=[[Far Rockaway]]`, `date=2026-02-11`. **Brand-new listing (Feb 2026); no standalone article exists.** Existence + address only. |
| **The White Shul (Congregation Kneseth Israel)** | **no street address in any source I found** | Wikipedia `White Shul`: "an Orthodox Jewish congregation and synagogue located in **Far Rockaway**... established in 1922 as Talmud Torah Kneseth Israel and was nicknamed 'The White Shul' after its white marble building." Infobox `established = 1922 (as a congregation)`, `completed = 1964`. The finder said this had "no sources" after a 404 on a guessed URL — **refuted**; the article is at `White Shul`. But **do not invent an address.** |
| **Sorrentino Recreation Center** | `Cornaga Ave. bet. Beach 19 St. and Morse Ct.` | NYC Parks `Q446`, ZIP 11691, CB 414, `typecategory: Buildings/Institutions`; confirmed live at nycgovparks.org/parks/sorrentino-recreation-center |

The Far Rockaway article also names **Sh'or Yoshuv** and the **Yeshiva of Far Rockaway** as local
institutions. Sh'or Yoshuv's own article is short-described "Education organization in **Lawrence**,
United States" — Lawrence is Nassau County, **outside the corpus**. Do not place it here.

### 1.3 P18 — BAYSWATER POINT STATE PARK. Verdict: `refuted` as Far Rockaway. It belongs to BAYSWATER, which has no page, so **no file may host it**.

The finder framed this as postal-town-vs-neighborhood and left it open. It is not close.

Wikipedia, verbatim: "The park is located at the western end of Mott Avenue in **[[Bayswater,
Queens|Bayswater]]** near [[Far Rockaway, Queens|Far Rockaway]]". A source that says *near* Far
Rockaway is a source that says *not in* Far Rockaway. The `1479 Point Breeze Place, Far Rockaway,
New York` string is the **infobox `location` field carrying a USPS mailing town** — and ZIP 11691
demonstrably covers Bayswater too (the Bayswater article: "its ZIP Code is 11691"). A mailing town
is not a neighborhood assignment; on this peninsula it is specifically the thing that is wrong.

**Two further corrections to F45.** The park is **17 acres**, not 12: "Bayswater Point State Park
is a 17-acre state park located on Jamaica Bay." The 12-acre figure is the 1986 parcel — "A 12-acre
parcel that was to become Bayswater Point State Park was purchased by the Trust for Public Land in
1986." And I could **not** re-quote the NYS Parks mission sentence the finder attributed to
parks.ny.gov: that host 403'd for me on every attempt. Treat that quote as **unverified**.

Note a collision the author must not walk into: the mansion on the site was itself named **"Breezy
Point"** (built 1907 by banker Louis A. Heinsheimer). That is not Breezy Point the neighborhood.

### 1.4 P19 — "MICHAELIS-BAYSWATER PARK". Verdict: `refuted`. It is NYC Parks' **Bayswater Park**, in Bayswater. Out of scope.

The finder had only a bare name off the Far Rockaway article's park list. NYC Parks resolves it.
Property `Q007 | Bayswater Park | Dwight Ave., Seagirt Blvd. bet. Beach 38 St. and Bay 32 St. |
ZIP 11691 | CB 414 | 40.16 acres | Community Park`. Its Historical Signs Project text, live at
nycgovparks.org/parks/bayswater-park, verbatim:

> "This park is named, in part, for **Jules Michaelis** (1893-1968), a long-time caterer and civic
> leader in the Rockaways. For 16 years he served as president of the **Wavecrest Civic
> Association**... He was also a leader in the efforts to develop Bayswater Park."

So the hyphenated name is a legacy form; the city's current sign name is **Bayswater Park**, and
Beach 38th Street is west of Beach 32nd — outside Far Rockaway's own stated extent (F1). Out of
scope. (The Michaelis biography does tie to Far Rockaway High School and to Wavecrest, but that is
prose about a person, not a claim on the park.)

### 1.5 P16 — O'DONOHUE PARK. Verdict: `uncertain`, and it has **NO publishable address**. Do not give it one.

This is the finding the finder's 403s cost it. **NYC Parks has no property record named O'Donohue
Park.** I pulled all 58 CB-414 properties from `enfh-gkve` and it is not among them. And
`nycgovparks.org/parks/odonohue-park` returns **HTTP 404**, while `/parks/beach-9-playground` and
`/parks/beach-17-playground` both resolve to the **Rockaway Beach and Boardwalk** page. The city
carries that footprint as two sub-properties of the beach:

```
Q162J   | Beach 17 Playground | Seagirt Blvd bet. B. 17 St. and B. 12 St. | 11691 | 13.75 ac
Q162J01 | Beach 9 Playground  | Seagirt Blvd bet. B. 12 St. and B. 9 St.  | 11691 |  4.863 ac
```

Its only source is the Wikipedia article `O'Donohue Park`, which places it "in the **Far Rockaway**
neighborhood... at the eastern tip of the [[Rockaway Beach and Boardwalk]]" — that neighborhood
assignment is fine, but the article contradicts itself on age (`established=2008` in the infobox
against "In 1963, the NYC Parks Department constructed the current park at this location" in the
prose), and it names no address. **Single-sourced, Wikipedia-only, no address, no city record under
that name.** If the author writes it at all, write it as a named area within Rockaway Beach and
Boardwalk, with attribution, and give it no street address.

### 1.6 P20 — ROCKAWAY BEACH AND BOARDWALK. Verdict: `confirmed`, and **neither this page nor Rockaway Beach's may claim it**. NYC Parks' own string settles it.

The finder had two Wikipedia extents and no primary source. NYC Parks gives both a location string
and a property split, and both say the same thing.

nycgovparks.org/parks/rockaway-beach-and-boardwalk, verbatim, as the property's own location line:

> **"Beach 3 St. to Beach 153 St. and Boardwalk to Atlantic Ocean."**

And it is not even one property. `enfh-gkve` returns it as a family:

```
Q162  | Rockaway Beach and Boardwalk | Lands underwater bet. B. 2 St. and B. 73 St. | 11691, 11692 | 498.154 ac
Q162I | Rockaway Beach and Boardwalk | Rockaway Boardwalk bet. Crest Rd. and B. 17 St. | 11691 | 3.809 ac
Q163  | Rockaway Beach Boardwalk    | Shore Front Pkwy. bet. Beach 109 St. and B. 73 St. | 11692, 11693, 11694 | 376.2 ac
Q164  | Rockaway Beach              | Atlantic Ocean bet. B. 149 St. and B. 126 St. | 11694 | 166.71 ac
Q050  | Rockaway Beach              | Ocean Promenade, bet. Beach 126 St. and Beach 110 St. | 11694 | 31.5 ac
```

Far Rockaway fronts only the easternmost slice. The Parks page's one specific amenity — "the city's
only legal surfing beach, located between 67-69 Street and 87-92 Street" — is in Arverne and
Rockaway Beach, **not** Far Rockaway. Do not import it here.

**F43 and F44 are both confirmed and must not be merged**, exactly as the finder warned: "the
largest urban beach in the United States, stretching from Beach 3rd to Beach 153rd Streets on the
Atlantic Ocean" (Rockaway Beach, Queens) is the *beach*; "The 5.5 miles long Rockaway Boardwalk and
170 acres of sandy beaches, fully accessible by the subway, make this a popular summer day trip for
New York City residents" (Rockaway, Queens) is the *boardwalk*. Different facilities, different
lengths.

### 1.7 P21 Wavecrest, P22 Bayswater

**Wavecrest — `confirmed` as a named sub-area of Far Rockaway, not a place record.** "The Beach
25th Street station (signed as Beach 25th Street–Wavecrest)". NYC Parks independently attests the
"Wavecrest Civic Association." It has no page, no polygon and no address. Nameable in prose;
not a record.

**Bayswater's compass bearing — the finder recorded a "flat contradiction" and did not resolve it.
It resolves.** F2 (Rockaway, Queens): "Bayswater, located to the **northeast** of Far Rockaway."
F6 (Bayswater, Queens): "The community is located to the **northwest** of Far Rockaway." The
articles' own coordinates decide it: Bayswater `40.605, −73.765`, Far Rockaway `40.601, −73.757` —
higher latitude and lower longitude, i.e. **north and west**. **The Bayswater article is right;
F2's "northeast" is wrong.** Do not repeat "northeast." Bayswater is out of scope either way.

### 1.8 The Cornell address conflict (§J.8) — resolved, against BOTH of the finder's candidates

The finder offered "1457 Greenport Road" (LPC) vs. Gateway Boulevard (article) and left it open.
**Neither is the publishable string.** The Cornell Family Cemetery article states plainly why: the
site "is located on Gateway Boulevard (**formerly Greenport Road and Greenwood Avenue**)" — so the
LPC list is carrying a street name that no longer exists. And it continues: "According to NYC
Parks, the Cornell Burial Ground is on the **west side of Caffrey Avenue north of New Haven
Avenue** in Far Rockaway, Queens."

NYC Parks itself, which holds the property, prints `Caffrey Ave. bet. New Haven Ave. and Davies
Rd.` on both the dataset row and the live page. **Publish the Parks boundary string.** Cite the LPC
designation (`refnum=0741`, August 18, 1970) for landmark status, not for address.

**NRHP status: `refuted`, not merely unestablished.** The graveyard does **not** appear anywhere in
the Queens NRHP list. It is a New York City individual landmark and nothing more.

---

## 2. THE ALLEY POND PARK STRUCTURAL RULING

**I choose (a): ALLEY POND PARK GETS A HOSTED RECORD, in `douglaston.json`, following the Forest
Park pattern precisely.** Not because it is least work — it is an instruction to the coordinator to
edit a shipped file, which is more work than deleting one record or loosening one assertion. On
the merits:

**Why not (b) — drop forest-park too.** Forest Park has a determinable street address that the
city itself publishes: `enfh-gkve` gives `Q015 | Forest Park | address: 80-30 PARK LANE | 506.86
acres | Flagship Park`. `forest-hills.json` already carries it correctly, with `town: "Queens"`, no
containment claim, and a history field that states outright "The park is not administratively part
of any neighborhood." Deleting a true, addressed, well-sourced record of a 507-acre flagship park —
and killing a live `/p/forest-park` — to satisfy a taxonomy question makes the corpus worse for the
reader. "No neighborhood may claim it" and "no reader may look it up" are not the same statement.

**Why not (c) — change the gate.** The assertion's whole value is that it is mechanical and
unexceptioned. Splitting it into "institutions with a home appear exactly once; institutions ruled
to none appear at most once" is a weakening in precisely the direction the gate exists to guard:
zero would become legal, and the failure mode its own message names — "it fell between two waves" —
would stop being caught. Worse, the carve-out would need a hand-maintained "ruled to none" list
with **no mechanical cross-check available**. The gate's neighbours have such checks
(`@code_owned_queens_places` is diffed against `CitiFieldPlaces.places()` with an explicit
"guards a stale list" rationale); a ruled-to-none list has no code module to diff against, so it
would rot silently. That is a worse assertion, not a corrected one.

**Why (a) is right.** The corpus's actual defect is that it answers the same question two ways.
Hosting both parks makes it consistent, keeps the invariant at a hard `== 1`, and costs nothing in
truthfulness — because Forest Park has already demonstrated that a record can host a place while
saying plainly it is in no neighborhood.

**Why Douglaston and not Bayside.** I sampled the park's own polygon (`gispropnum=Q001`, 2,568
vertices) against the 2020 NTA layer, the same method that settled Forest Park:

```
centroid   (-73.746018, 40.753703) -> QN1191  Alley Pond Park      <- its OWN tabulation area
north edge (-73.746018, 40.770398) -> QN1103  Douglaston-Little Neck
east  edge (-73.734784, 40.753703) -> QN1103  Douglaston-Little Neck
south edge (-73.746018, 40.739180) -> QN1104  Oakland Gardens-Hollis Hills
west  edge (-73.761222, 40.753703) -> QN1102  Bayside
```

This independently confirms the standing ruling — Alley Pond Park has **its own NTA, QN1191**,
exactly as Forest Park has QN8291 — and it breaks the Bayside/Douglaston tie **2 edges to 1** for
Douglaston. The third abutter (Oakland Gardens-Hollis Hills) is not in scope and cannot host. NYC
Parks' ZIP list splits evenly (11362/11363 Douglaston-Little Neck, 11361/11364 Bayside), so the
polygon is the discriminator, and it favours Douglaston.

**What the record may contain — and what it may NOT.**

```
Q001 | Alley Pond Park | Little Neck Bay to Springfield Blvd, Union Tpke
     | ZIPs 11361, 11362, 11363, 11364, 11426 | CB 411 | 635.514 acres | Flagship Park
     | council districts 19, 23 | address: (NONE)
```

- `town: "Queens"` — **not** "Douglaston". Same as forest-park.
- **No street address.** Unlike Forest Park, the Parks row has **no `address` field at all**.
  Publish the location string `Little Neck Bay to Springfield Blvd, Union Tpke` and nothing else.
  An author who invents a number here is fabricating.
- Prose must state it is in no neighborhood, and may cite QN1191 as the instrument. It may say it
  borders Douglaston-Little Neck, Bayside and Oakland Gardens-Hollis Hills. It may **not** say
  Douglaston contains it.
- One correction to the standing record for the coordinator: the wave-5 note that the park "reaches
  Community District 13" is **not** what NYC Parks says. `Q001` records `communityboard: 411`
  alone. (Compare Forest Park's `communityboard: 305405406409` — four boards, and Parks does list
  them all when they apply.) Do not repeat the CD-13 claim without a source.
- `bayside.json` mentions Alley Pond Park 8 times in prose and `douglaston.json` twice, with no
  record in either. Both files' prose should be re-read against the new record so neither implies
  containment.

---

## 3. WHAT MAY BE PUBLISHED ABOUT BUSINESSES

**The finder's method note 4 — "No restaurant or business candidates were sourced at all. Not one.
There is therefore no DOHMH/DCWP-only business in this dossier — the category is empty, not thin" —
is `refuted` as a statement about what exists.** It is true as a statement about what the finder
did. DOHMH `43nn-pn8j` returns **49 distinct food-service establishments in ZIP 11691** with
building number and street, e.g.:

```
CENTRAL PIZZA        | 20-15 MOTT AVENUE
LA CABANA RESTAURANT AND BAKERY | 19-01 MOTT AVENUE
CHEN'S DINER         | 558 BEACH 25 STREET
LUCKY CORNAGA CHINESE RESTAURANT | 14-20 CORNAGA AVENUE
DELEON BAKERY & RESTAURANT | 18-58 CORNAGA AVENUE
GRAND OASIS RESTAURANT | 16-11 CENTRAL AVENUE
```

**Every one of these is DOHMH-only.** Their existence and address may be published. **NOTHING about
any of them may appear in prose** — no cuisine characterisation, no history, no recommendation, no
"a Caribbean spot on Beach 20th." The DOHMH `cuisine_description` column is an inspector's
classification, not editorial sourcing, and must not be laundered into a sentence.

**And the ZIP is a trap.** 11691 covers Far Rockaway *and* Bayswater *and* the east end of
Edgemere. At least four of the 49 are Edgemere by their own address — `BEACH DUNES EATERY AND ARTS
| 45-19 ROCKAWAY BEACH BOULEVARD`, `LEONA'Z CAFE | 43-15A BEACH CHANNEL DRIVE`, `NEW NEW GARDEN
RESTAURANT | 43-17 BEACH CHANNEL DRIVE`, and `BUONA PIZZA | 32-13 BEACH CHANNEL DRIVE` sits on the
Beach 32nd Street line itself. Far Rockaway is Beach 32nd east to Nassau (F1), so any hyphenated
address whose prefix is 32 or higher, or any "Beach N Street" with N ≥ 32, is **not this page's**.
Do not bulk-import by ZIP.

---

## 4. CLAIM-BY-CLAIM

### 4.1 The seven REFUTED claims

**F3 — `refuted`.** The finder wrote that the peninsula article "also lists Hammels, Seaside,
Roxbury and Broad Channel as separate communities." It does not. The roster is ten bullets and
contains none of Hammels or Seaside; Roxbury appears only *inside* Breezy Point — "Breezy Point,
from Beach 169th to the western tip; **this includes the smaller areas of Roxbury and Rockaway
Point**, as well as Fort Tilden." Broad Channel is confirmed: "while not technically on the
peninsula, it is located just north of the Cross Bay Veterans Memorial Bridge." Separately, the
`Hammels, Queens` article says Hammels "is an area **within Rockaway Beach**" — which matters to the
sibling page, not this one.

**F16 — `refuted` as to the Marine Pavilion's sourcing.** The finder fetched `Marine Pavilion`, got
a Brighton disambiguation page, and concluded "the Marine Pavilion has **no standalone source in
this dossier**." The article is at **`Marine Pavilion (Queens)`**, and the Far Rockaway article
links straight to it. It says: "The **Marine Pavilion** was a luxury hotel in Far Rockaway, Queens,
New York City. The Pavilion, which was built on the former homestead of Rockaway's first white
settler, Richard Cornell, was **completed in 1833**, at a then-record cost of **$43,000**." It also
gives the site: "The hotel was located **south of where Norton Street joined Central Avenue (now
Beach 20th Street)**." The 1833-vs-1835 tension survives but is now *internal to Wikipedia*: the
peninsula article says the Rockaway Association "started developing resorts in the area in 1833"
and, one clause later, "the first resort being founded at Far Rockaway in **1835**." Ship either
date only with attribution to the article that carries it. See `uncertain` below.

**F17 — `refuted` as to the Pavilion/Hotel identity.** The finder said "it is not clear from the
fetch whether they are the same building." They are. `Marine Pavilion (Queens)`: "The Pavilion was
**destroyed by fire on June 25, 1864**." The Far Rockaway article's "The Marine Hotel burned to the
ground in 1864" is the same event under a loose name. The guest list is confirmed verbatim from the
Far Rockaway article — "attracted such guests as Henry Wadsworth Longfellow, Washington Irving, and
the Vanderbilt family" — but note the Marine Pavilion article names only Longfellow and Irving
"and other New York City literary figures and socialites who were first attracted to the hotel as a
refuge from an outbreak of **cholera**." The Vanderbilts rest on one article. Attribute.

**F22 — `refuted` as quoted.** The finder wrote 'Far Rockaway and Arverne "tried to secede from the
city several times."' Neither source says that pair. The Rockaway Beach article: "the neighborhood
[Rockaway Beach], along with the eastern communities of **Arverne** and **Far Rockaway**, tried to
secede from the city several times." The Far Rockaway article gives a *different* trio: "The
neighborhoods of **Far Rockaway, Hammels, and Arverne** in Queens tried to secede from the city
several times." Both add: "In 1915 and 1917, a bill approving secession passed in the legislature
but was vetoed by ... John Purroy Mitchel." Write the trio your cited article names, and say which.

**F38 — `refuted` as to the NRHP-list gap.** The finder flagged that the church's 1986 listing "did
**not** appear in the Queens NRHP list fetch (F30's source returned only three peninsula entries)."
It appears at row `pos=79`: `refnum=86002678 | Russell Sage Memorial Church | address=1324 Beach 12
St. | city=Far Rockaway | date=1986-09-22 | description=Church designed by Ralph Adams Cram with
Louis Tiffany windows, recently restored.` There is no gap to reconcile — the finder's fetch was
lossy. Everything else in F38 is confirmed verbatim from the article, including `built = 1910`,
`architect = Cram, Goodhue & Ferguson; Olmsted Brothers`, `architecture = Late Gothic Revival,
Neo-Gothic style`, and "commissioned by Olivia Slocum Sage as a memorial to her late husband,
Russell Sage (1816–1906), as they used to summer in the area."

**F45 — `refuted`.** See §1.3.

**F59 — `refuted` on two counts.**
1. The ridership block is **not in the article**. I searched the raw wikitext for `961`, `12.8`,
   `302`, `423`, `Ridership` — the only hit is a 1961 citation year. **"2024 ridership 961,694, up
   12.8%, ranking 302 of 423 stations" is unsupported. Do not publish it.**
2. The $117 million is confirmed but the gloss is wrong. The article: "From 2009 to 2012, **this and
   eight other stations** were renovated for $117 million." That is a nine-station programme
   budget, not Far Rockaway's renovation cost. Everything else in F59 is confirmed: opened July 29,
   1869 as a South Side Railroad / LIRR station; city acquired all trackage west of Mott Avenue on
   June 11, 1952; "the current elevated station began operation as a subway station on January 16,
   1958"; "A glass artwork titled ''Respite'' was installed as part of the MTA's Arts for Transit
   program. The renovated station was unveiled on May 11, 2012"; infobox `1 island platform`,
   `2 tracks`, `Elevated`.

### 4.2 The five UNCERTAIN claims

**F11 — `uncertain`, because it is incomplete in a way that matters.** ZIP 11691 for Bayswater is
confirmed verbatim. But the Far Rockaway infobox reads `postal_code = 11691, 11693`, while the same
article's Post Office section says "Far Rockaway is covered by ZIP Code 11691." The article
contradicts itself, and 11693 is Rockaway Beach/Broad Channel territory. **Publish 11691 only.**

**F14 — `uncertain` on how Palmer got the land.** The purchase price and chief are confirmed
verbatim: "In 1685, the band chief, ''Tackapoucha'', and the English governor of the province agreed
to sell the Rockaways to a Captain Palmer for **31 pounds sterling**." But NYC Parks' Cornell
Burial Ground sign says Cornell "purchased all of the area now known as Rockaway from John Palmer,
who had **inherited** the land two years earlier." Sold-to vs inherited-by is a real conflict
between two decent sources. Also note the date the finder omitted — Wikipedia: "in **1687** he sold
the land to Richard Cornell"; NYC Parks: "On **August 23, 1687**".

Two more Cornell conflicts the author must not paper over:
- **Where the homestead was.** Far Rockaway article: "Cornell and his family lived on a homestead on
  what is now **Central Avenue**, near the shore of the Atlantic Ocean." NYC Parks: "He built a
  house on Far Rockaway, **near what is now Beach 19th Street**. This home was likely the first ever
  built on Rockaway by a European settler." Prefer NYC Parks or attribute both.
- **When the land was partitioned.** Rockaway, Queens: "The Cornell property was split into 46 lots
  in **1808** following a partition lawsuit." Richard Cornell: "much of which was partitioned into
  46 parcels in **1820**."

F15 is separately confirmed verbatim from the Cornell Family Cemetery article: Cornell is
"generally considered the first settler of European descent to homestead in Rockaway."

**F41 — `uncertain` as a park list; resolved item by item.** The bare list is confirmed verbatim —
the Far Rockaway article's Parks section is exactly `O'Donohue Park`, `Bayswater Point State Park`,
`Michaelis-Bayswater Park`, `Nameoke Park`. But the list is **not** a neighborhood assignment: two
of the four are in Bayswater (§1.3, §1.4), one has no city record (§1.5), and only Nameoke Park
survives. The list also **omits** Sorrentino Recreation Center, Redfern Playground (`Q345 | Beach
12 St., Redfern Ave.`), Westbourne Playground (`Q266 | Mott Ave., Westbourne Ave. bet. Bay 28 St.
and Bay 25 St.`), Lanett Playground (`Q407 | Lanett Ave. bet. Beach 9 St. and Beach 8 St.`) and
Grassmere Playground (`Q353`), all in ZIP 11691, CB 414.

**F48 — `uncertain`.** I did not re-test the NPS URL. It is out of scope regardless (§4.3, F39).

**F68 — confirmed on the facts, `uncertain` on the PACT gloss.** Every number checks: `population
_total = 1426`, `area_total_acre = 16.76`, ZIP 11691, "nine buildings each containing six to seven
stories", "built in August 1959", "named after Redfern Avenue in Queens", and the location string
quoted in §1.1. But the Wikipedia sentence carrying the money is garbled — "All of those buildings
were funded by the PACT in October 2017 where it had started for $123M" — and its own citation is
titled "**NYCHA Begins $123 Million Sandy Recovery Project** At Redfern Houses In Queens." Sandy
recovery and PACT conversion are different programmes. **Say "$123 million" and "October 2017"; do
not say "PACT" without checking the NYCHA release.**

### 4.3 Confirmed, with the corrections that matter

**F1** — confirmed verbatim: "The neighborhood extends from Beach 32nd Street east to the Nassau
County line. Its southern boundary is the Atlantic Ocean; it is one of the neighborhoods along
Rockaway Beach." Lead also: "a neighborhood on the eastern part of the Rockaway peninsula... the
easternmost section of the Rockaways."

**F2** — confirmed verbatim, including the source's own "from 77th Street" without "Beach". The
finder was right to transcribe rather than correct. Note the article says "**nine** neighborhoods or
sections" and then prints ten bullets — its own arithmetic, not the finder's error.

**F4, F5, F6, F7, F8, F9, F10** — all confirmed verbatim. F5's CB-14 roster and bounds are word for
word, and the infobox carries `population_total = 114,978`, `population_as_of = 2010`. The
peninsula article separately gives "As of 2020, the peninsula's total population is estimated to be
**124,185**" (NYS Comptroller) — newer, and the finder missed it.

**F12, F13, F18, F19, F20, F21** — confirmed. F12 verbatim from `named_for`. F18 verbatim: "In this
era, it became known as 'New York's Playground'" — the era being "the early 1900s," and the sentence
is peninsula-wide.

**F23** — confirmed as quotes, with a contradiction the author must handle. All three strings are
verbatim. But the same article, three paragraphs earlier, says the Breezy Point fire "destroyed
**126 homes** and damaged 22 more," and the "The FDNY found **130** homes burned to the ground"
sentence follows later. The article contradicts itself. **The finder's warning stands and is
correct: this is Breezy Point, at the far western tip, and none of it may attach to Far Rockaway.**

**F24, F25, F26, F27, F28, F29** — confirmed. F27 verbatim, and the `[[Jamaica]]` wikilink in the
raw text points at the **country**, which settles the finder's collision flag conclusively.

**F30, F31** — confirmed, including the sub-claims the finder hedged: "By the 1980s, many of the
bungalows had been razed... Only about **100 bungalows remain**." Infobox: `built = 1921`,
`architect = Henry Hohauser`, `area = 5.8 acres`, `refnum = 13000499`, `added = 7/17/2013`. Also
verbatim: "They were built in 1921 using pattern book designs incorporating uniform facades,
compact interiors, integrated porches and exposed rafters. Their architect, Henry Hohauser, became
better known in the 1930s as a designer of Art Deco hotels in Miami Beach." The finder's Sandy
sentence is a paraphrase, not a quote — the article reads "The district was hit by Hurricane Sandy
in 2012, but survived without major damage." The finder missed the **Beachside Bungalow
Preservation Association**, "formed in September 1984 by Betzie Parker White, Roger White, and
Carole Lewis."

**F32, F36, F37, F40** — all confirmed verbatim from the LPC list, with detail the finder dropped:
the precinct station is "the **first police station in the Rockaways built by the New York City
government, erected 1927–1928** in the Renaissance Revival and Colonial Revival styles"; the
firehouse is a "Renaissance Revival and Colonial Revival firehouse **built in 1910–1912**"; the
graveyard is "**one of New York City's surviving 18th-century cemeteries.**"

**F33, F34, F35** — confirmed. F35 gains a correction: Powell was "**chief engineer for the
Topographical Bureau, Borough of Queens**," and he had two reasons, "second, his own Dutch ancestors
were buried in one of them."

**F39** — confirmed verbatim; both are `city=[[Rockaway, Queens|Rockaway]]`. Correctly kept off.

**F42, F43, F44** — confirmed. See §1.6 on not merging F43 and F44.

**F46, F47** — confirmed, out of scope. One conflict for the Rockaway Beach page, not this one:
Wikipedia gives Arverne East Nature Preserve 35 acres, NYC Parks `Q520` gives **32.86** and locates
it `Edgemere Ave. bet. B. 56 Pl. and B. 44 St.`, ZIP 11692.

**F49, F50, F51** — confirmed, and **§J.10 is `refuted` as reasoning.** The finder wrote "Prefer the
architect if they conflict." They do not conflict. Snøhetta's page is *silent* on square footage and
roof; silence is not contradiction. Wikipedia's figures are cited to QNS (Marshall, July 31, 2024)
and read: "The current building is 18,000 ft2 across two stories, with a glass facade and a **blue
roof that collects rainwater**; the color of the facade is an allusion to the color of the ocean."
Both may be published, each attributed. Snøhetta confirmed verbatim: "Located at the prominent
intersection of **Mott and Central Avenues**"; "organized around an **inverted pyramidal atrium**,
which allows the penetration of natural light to the ground floor as well as a view of the sky";
"Clad in **fritted, colored glass, with a color gradient reflective of the sunrise off Long
Island's coast**"; "one of the borough's most **ethnically diverse** communities"; "the library is
both a **symbol and a resource**"; "the existing **1968** library building provided disaster relief
to residents"; project years **2012–2024**; client NYC DDC + Queens Public Library.

Three things the finder missed here and the author should have: the library "opened in **July 2024**
at a cost of **$39 million**," construction started **November 2018**, and the building carries two
commissioned artworks — "''Style Writing'' by **José Parlá**" on the facade and "''Feynman Code'' by
**Pablo Helguera**" on the second floor. The Parlá collaboration is confirmed independently on
Snøhetta's own page. *Feynman Code* is a direct, sourced tie to Richard Feynman and Far Rockaway
High School — the best single sentence available to this page, and the dossier does not contain it.

F50 confirmed verbatim from queenslibrary.org: "1637 Central Avenue Far Rockaway, NY 11691",
"(718) 327-2549", "24/7 drop-off for materials", "Wheelchair accessible", "Remote Printing is
available at this QPL location", and "If you're within 450 feet of this branch, you can connect
automatically to our wireless network, QPL_Wi-Fi, whether we are open or closed, no sign-in
required!" The finder's report that this host blocked it is not reproducible — it returned 200.

**F52, F53** — confirmed verbatim, and both addresses match their landmarked buildings exactly.

**F54, F55** — confirmed. Every FRHS figure checks. F55's negatives are confirmed: **Jan Peerce and
Frankie Lymon do not appear** in the alumni list. **One trap the finder did not flag:** the article
quotes a 1990 *Newsday* piece listing "polio vaccine inventor **Jonas Salk**" among alumni. That is
inside a quotation from a newspaper, not a claim the article makes, and Salk has no entry in the
alumni list. **Do not write Salk as a Far Rockaway High School alumnus.** The article's own summary
is safe: "Its alumni include three Nobel Prize laureates and convicted fraudster Bernard Madoff."

**F56** — confirmed and thin. The Far Rockaway article's notable-people list runs to ~35 entries,
and the finder returned eight. Mac DeMarco is confirmed with a usable hook: "has a house in Far
Rockaway, where he recorded his album ''Another One''." **Kelly Price is a trap:** the article says
she "grew up in the **Edgemere Projects**," and its NYT citation reads "reared in the Edgemere
Projects in Far Rockaway" — the two sources disagree about whether that is Edgemere or Far Rockaway.
Attribute or drop. Also present and unmentioned by the finder: **Joan Feynman** (Richard's sister,
"grew up in the Far Rockaway section of Queens"), Al Jaffee, Phil Ochs, Steve Madden, Raymond
Smullyan, Rammellzee, Cormega, MC Serch, Deborah Lipstadt, Khaleel Anderson.

**F57** — confirmed in full from the infobox and body, plus founder **Rabbi Yisroel Bloom** and
Rosh HaYeshiva **Rabbi Yaakov Bender**, which the finder omitted.

**F58** — confirmed verbatim. The finder omitted the seven zoned elementary schools the article
names (P.S. 43, P.S. 104 The Bayswater School, P.S. 105 The Bay School, P.S. 106, P.S. 197 The Ocean
School, P.S. 215, P.S. 253) and the fact that **Beach Channel High School "is in Rockaway Park"** —
i.e. out of scope, and a trap for anyone writing about local schooling.

**F60** — confirmed verbatim, including "(signed as **Beach 25th Street–Wavecrest**)", the May 1928
Wavecrest Station opening, the 800-foot relocation in August 1940, the April 10, 1942 elevated
reopening, the October 3, 1955 city purchase, the June 28, 1956 subway reopening, and "This station
is on a concrete viaduct with ballasted track. It has two tracks and two side platforms."

**F61** — confirmed. One correction: "Frequent fires and maintenance problems led the LIRR to
abandon the Queens portion of the route" is from the **Far Rockaway neighborhood** article, not the
station article. The station article adds `passengers = 560 per weekday` and station code `FRY`.
The finder's Inwood warning is correct and important — the infobox reads
`services = {{Adjacent stations|system=LIRR|line=Far Rockaway|left=Inwood}}`, and that is Inwood,
Nassau County.

**F62, F63** — confirmed verbatim. F62 gains a detail worth publishing: "**Unlike other NICE routes
in Queens, these buses operate open-door in Far Rockaway**, meaning customers can ride these buses
wholly within the neighborhood without going to Nassau County."

**F64** — confirmed from the IND Rockaway Line station table, which assigns Beach 44th and Beach
36th to **Edgemere** and Beach 67th and Beach 60th to **Arverne**, exactly as the finder reported.
The finder's conclusion stands: **only two subway stations belong to Far Rockaway.**

**F65** — confirmed verbatim, every figure. The "1,800 feet" renders through a `{{Convert}}`
template in the raw wikitext, which is why a literal search misses it: "The fire burned all night
and destroyed {{Convert|1800|feet|meters}} of the trestle between The Raunt and Broad Channel
stations, and the estimated cost to repair it was $1 million."

**F66** — confirmed verbatim, and the finder's conclusion is correct and load-bearing: **the ferry
does not land in Far Rockaway.** It lands at Beach 108th Street in Rockaway Park, which is out of
scope for both peninsula pages. The wave brief's framing that the peninsula is "reached by ... the
ferry" is true of the peninsula and **false of this page**. No "reached by ferry" sentence may
appear on far-rockaway.json.

**F67** — confirmed verbatim, and the finder is right that the article names no neighborhoods. It
adds one fact the finder dropped, which is out of scope but worth knowing: "A portion of the road,
between Beach 67th Street and Beach 73rd Street, was closed permanently in 2009 to make way for a
retail transit plaza in connection with the new Arverne-by-the-Sea construction development."

---

## 5. SINGLE-SOURCED CLAIMS AND THEIR SHIPPING STATUS

| Claim | Sole source | May it ship? |
|---|---|---|
| O'Donohue Park's existence, history, 2012 reconstruction, skate park | Wikipedia `O'Donohue Park` only; **no NYC Parks record, page 404s** | Only with attribution, as part of Rockaway Beach and Boardwalk, and **with no address** |
| Marine Pavilion completed 1833, cost $43,000, site at Norton St & Central Ave (now Beach 20th St) | Wikipedia `Marine Pavilion (Queens)` | Yes, attributed. **Demolished 1864 — it is a history subject, not a place record.** |
| Library 18,000 sq ft + blue roof | Wikipedia, cited to QNS | Yes, attributed to QNS |
| *Style Writing* (Parlá) and *Feynman Code* (Helguera) | Wikipedia, cited to *The Architect's Newspaper*; Parlá corroborated by Snøhetta | Yes |
| Richard Mott House, 12-72 Norton Drive | NRHP list row only (listed 2026-02-11); no article | **Existence and address only. No prose.** |
| White Shul founded 1922, building completed 1964 | Wikipedia `White Shul` | Yes, attributed. **No address exists — do not supply one.** |
| Vanderbilt family at the Marine Pavilion | Far Rockaway article only (the Pavilion article names only Longfellow and Irving) | Attributed only |
| NYS Parks mission statement for Bayswater Point | **finder only; parks.ny.gov 403'd for me** | **No — unverified, and the park is out of scope anyway** |
| Far Rockaway rezoning, 3,100 residences, 670 affordable apartments (2018) | Wikipedia (Curbed/GlobeSt/City Limits); **edc.nyc still unread** | Yes, attributed |
| Peninsula population 124,185 (2020) | Wikipedia, cited to NYS Comptroller Report 7-2023 | Yes, attributed — and newer than the finder's 2010 figures |

---

## 6. WHAT THE AUTHOR MUST BE WARNED ABOUT

1. **Do not publish the Mott Avenue ridership numbers (F59).** They are not in the source.
2. **Do not put Bayswater Point State Park or Bayswater/Michaelis-Bayswater Park on this page.**
   Both are Bayswater, which has no page. No file hosts them.
3. **Do not give O'Donohue Park an address.** The city has no record under that name.
4. **Do not claim Rockaway Beach and Boardwalk.** NYC Parks: "Beach 3 St. to Beach 153 St." Far
   Rockaway fronts the eastern slice only. Neither peninsula page may claim it whole.
5. **Do not write a "reached by ferry" sentence.** The ferry lands in Rockaway Park.
6. **Do not attach the Sandy fire (126 or 130 homes) to Far Rockaway.** It is Breezy Point.
7. **"Jamaica" in F27 is the country.** The raw wikitext links `[[Jamaica]]`. No tie to the Jamaica
   page, Jamaica Bay or Jamaica Avenue. (NYC Parks does own a `Q309 | Jamaica Bay Park` in CB 414 —
   another collision, and not this page's.)
8. **"Inwood" on the LIRR is Nassau County.**
9. **Do not write Jonas Salk as an FRHS alumnus.** He appears only inside a quoted newspaper blurb.
10. **Do not bulk-import ZIP 11691 businesses.** Four of the 49 are Edgemere. Filter on Beach street
    number < 32.
11. **DOHMH-only businesses: address and existence only, never prose.** Not even cuisine type.
12. **Cite redirect targets, not the finder's URLs.** Five of its citations are redirects.
13. **Forest Park, Alley Pond Park, Flushing Meadows-Corona Park and the eight
    `Ethos.Seeds.CitiFieldPlaces` holdings stay off this page entirely**, as records and as prose.
    Nothing in Far Rockaway's sourcing touches them, so this is easy to honour here — link to
    `/g/citi-field-guide` only if a routing sentence is genuinely warranted, which on a page about
    the far end of the Rockaway peninsula it almost certainly is not.
