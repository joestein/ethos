# Oriole Park at Camden Yards — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for
`lib/ethos/seeds/oriole_park_at_camden_yards_places.ex` and
`lib/ethos/seeds/oriole_park_at_camden_yards_guide.ex`.

Committed on purpose: the research artifact lives under `.superpowers/`, which
`.gitignore` excludes.

Source: the 2026-08-30 Baltimore Orioles research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/baltimore-orioles.json`,
`verified: true`).

**11 places and 1 guide shipped** from 11 researched places.

---

## The finding that shaped this whole site

The verifier's own note names it as *"the single most consequential finding"*:

> every 'found' fact and every 'still_trading' evidence citation pointing at
> `https://baltegis.baltimorecity.gov/mapping/rest/services/CityView/Licenses/FeatureServer/0`
> (the bare base URL, with no query string) is UNSUPPORTED by that URL. Fetched
> directly, twice, it is confirmed to be an ArcGIS service-metadata/schema page
> listing field names … with zero actual license records, and a query attempt
> against it errored out.

The finder's own note says it queried the layer "filtered by street name"; the
URL it recorded is the unfiltered base endpoint. **Eight claims** were cited to
it — licensee names, licence classes, statuses and 2027-04-30 end dates for the
ballpark's concessionaire, Horseshoe Baltimore, Pickles Pub, Faidley's, the
France-Merrick Performing Arts Center and Pratt Street Ale House. All eight are
`refuted` as citations.

**Not one liquor-licence fact appears anywhere in this site**, and no place's
trading status rests on one. Where that source was a place's only independent
evidence, the trading status was downgraded and no claim is published.

This is the same failure class the wave's brief warns about — a county cited to
a page that does not contain the county's name — and it is worth recording
that verification caught it rather than the author.

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| venue | Oriole Park at Camden Yards | *"The Baltimore Orioles' ballpark is Oriole Park at Camden Yards, at 333 W. Camden Street, Baltimore, MD."* — confirmed |
| city | Baltimore | as above |
| state | Maryland | as above |
| county | **Baltimore City** | *"Baltimore was designated an independent city by the Constitution of Maryland in 1851, is not located under the jurisdiction of any county, and is 'almost entirely surrounded by Baltimore County, but is politically independent of it.'"* — confirmed |

The artifact's `county` field is a sentence, not a value: `"Baltimore City (an
independent city, not part of any county)"`. The verifier's `identity_verdict`
note calls this out directly — *"the county field would more cleanly read
'Baltimore City' or 'Baltimore city' with the explanatory clause moved to
prose"* — and that is what has been done. The value derives
`/destinations/maryland/baltimore-city`, and the explanation is published in the
guide's closing section and an FAQ answer.

Identity verdict #3, the concession licence, is **refuted** and dropped. The
verifier notes it was never load-bearing: club, venue, city, state and county do
not depend on it.

---

## 1. Places, against the verdicts they rest on

### oriole-park-at-camden-yards — Oriole Park at Camden Yards (`stadium`)

Confirmed and published: the address; opening April 6, 1992; capacity 42,455 as
of 2026; HOK Sport, now Populous; **the retro-classic style**, which an identity
verdict states in those words; the retained B&O Warehouse; the former B&O
Camden Station rail yard site; the pioneering of the retro design "that
intentionally contrasted with the symmetrical multipurpose stadiums built in the
preceding era"; the warehouse's eight stories, 1,116 feet, 1899-1905
construction, 1,000-carload capacity, 1970s vacancy and current use as Orioles
offices, team spaces and a private club; Camden Street's naming after Charles
Pratt, 1st Earl Camden, and Schaefer's championing of the Camden Yards name for
the 85-acre redevelopment.

Style ships because a verdict states it.

### babe-ruth-birthplace-and-museum — Babe Ruth Birthplace & Museum (`museum`)

Three confirmed verdicts, published: 216 Emory Street as Ruth's birthplace,
February 6, 1895; the July 1974 opening after Hirsh Goldberg's advocacy against
demolition; official museum of the Orioles from 1983; the 1992 first-home-run
ball; and the own-site hours — 10:00 a.m. to 5:00 p.m. daily, extended to 5:30
p.m. on Orioles evening home games — with the nonprofit Babe Ruth Birthplace
Foundation as operator.

**`status_verdict: uncertain`.** The hours are published as what the museum's
own site lists, and the record says outright that a site cannot establish its
own current operation. No trading claim.

### horseshoe-baltimore — Horseshoe Baltimore (`attraction`)

Verdict #0 confirmed and published whole: 122,000-square-foot gaming floor;
World Series of Poker room; opened August 26, 2014; 1525 Russell Street;
adjacent to M&T Bank Stadium and Oriole Park; CBAC Gaming, a consortium led by
Caesars Entertainment. `status_verdict: confirmed / open`, re-sourced by the
verifier to Wikipedia rather than to the failed licence layer.

Verdict #1, the licence, **refuted** and absent.

### pickles-pub — Pickles Pub (`restaurant`)

Verdict #0 is **`uncertain`**, correction: *"Publish the address and
description; treat the 1988 date as unconfirmed rather than a stated fact."*
The address and the sports-bar description ship; the March 17, 1988 date is
published as the business's own uncorroborated statement, in those words, in the
place record, the entry note and an FAQ answer.

Verdict #1, the licence, **refuted** and absent. **`status_verdict:
uncertain`** — no trading claim.

### lexington-market — Lexington Market (`shop`) · `official_url: nil`

Both verdicts confirmed and published whole: 1782, General John Eager Howard's
donated land, "one of the longest-running public markets in the nation" — a
superlative inside confirmed verdict text, so it ships; the 1871 shed and the
1949 fire; the 60,000-square-foot 2022 replacement with 50 merchants; city
ownership and Baltimore Public Markets Corporation management.
`status_verdict: confirmed / open`, re-sourced to Wikipedia alone.

### faidleys-seafood — Faidley's Seafood (`restaurant`) · `official_url: nil`

Verdict #0 confirmed and published: founded 1886 by John W. Faidley Sr. in two
wooden sheds in Lexington Market; a family operation for generations; as of 2024
owned and operated by Nancy Devine and her husband Bill, descendants of the
founder. Verdict #1, the licence, **refuted** and absent. `status_verdict:
confirmed / open` on the Wikipedia leg alone.

The artifact's `address` field carries a parenthetical "(Lexington Market)"; the
place record moves that into prose and keeps the `address` field postal.

### hippodrome-theatre-baltimore — Hippodrome Theatre (`theater`) · `official_url: nil`

Verdicts #0 and #1 confirmed and published whole: 1914; 2,300 seats; vaudeville
and movie palace; **Thomas W. Lamb, Beaux Arts style**; "the largest theatre in
the United States south of Philadelphia" at its debut — a superlative in
confirmed verdict text; closed as a movie theater 1990; National Register
January 14, 2000; reopened after a 2004 renovation within the France-Merrick
Performing Arts Center.

Verdict #2, the licence, **refuted** and absent. **`status_verdict:
uncertain`**, `could_not_establish`: current season and programming beyond that
it remains an active venue. No programming and no trading claim.

### pratt-street-ale-house — Pratt Street Ale House (`brewery`)

One confirmed verdict, and it is the name and the address. Verdict #1, the
licence, **refuted**. `could_not_establish`: *"Founding year and any history —
the operator's own site gave only the name and address, and no independent
source with history was found."* **`status_verdict: uncertain`.**

The record is two facts and a stated gap. That is what the evidence supports,
and the content gate has no length floor precisely so that a record like this
does not get padded.

### federal-hill-park — Federal Hill Park (`park`) · `official_url: nil`

Both verdicts confirmed and published whole: 10.3 acres on the Inner Harbor; the
four bounding streets; Department of Recreation and Parks maintenance; John
Smith's Hill after the 1608 voyage; the 1788 ratification-celebration renaming;
War of 1812 and Civil War military use; city acquisition in 1880.

**The street number is dropped.** The artifact's `address` field opens "300
Warren Ave" while its own `could_not_establish` says *"A single street-number
address — the park is described by its bounding streets rather than a postal
address in the source used."* The bounding streets are what a verdict supports,
so they are what the `address` field carries.

### cross-street-market — Cross Street Market (`shop`)

Three confirmed verdicts, published: the 19th-century marketplace in Federal
Hill spanning Cross Street between Light and Charles; the riot of September 8,
1876; the $8.4 million redevelopment completed spring 2019; the own-site address
and daily hours from 7am, closing between 8pm and 10pm by day.

**`status_verdict` is `refuted`**, correction: *"Change status from 'open' to
'uncertain'."* `could_not_establish`: no independent source confirming 2026
operating status. The hours are published as the operator's listing; no trading
claim is made.

### ridgelys-delight-historic-district — Ridgely's Delight Historic District (`historic-site`) · `official_url: nil`

Three confirmed verdicts, published whole: 24 acres and the four boundaries; the
1732 survey for Charles Ridgely and the name from Charles Ridgely II's
plantation "Ridgely's Whim"; National Register June 6, 1980; rowhouses from 1823
in **Italianate, Federal and Late Federal** styles; Ruth's birthplace and the
museum on Emory Street. `still_trading: n/a` — a historic district, not a
business.

---

## 2. The guide

`slug: oriole-park-at-camden-yards-guide` · `destination: "Baltimore, Maryland"`
· `state: "Maryland"` · `county: "Baltimore City"`

### Getting there — and the three stations that are not on the line

| Published | Verdict |
|---|---|
| Camden Station at 301 West Camden Street, adjacent to the ballpark, on both the Light RailLink and MARC's Camden Line to Washington | confirmed, verbatim |
| **the corrected Camden Line station list** | **refuted**, correction: *"Camden Line stations … Camden Station, St. Denis, Dorsey, Jessup, Savage, Laurel Race Track, Laurel, Muirkirk, Greenbelt, College Park, Riverdale, Union Station (Washington, D.C.) — plus Halethorpe, West Baltimore and BWI Airport per the broader MARC article. Remove Bowie State, Rockville and Silver Spring; treat Odenton as unconfirmed rather than restating it."* All four are absent, and the guide says so. |
| Light RailLink: Hunt Valley to Glen Burnie, BWI spur, Penn Station and MARC connections, and the four downtown stations | confirmed, verbatim |
| MTA routes 69, 70, 73, 75 | confirmed, verbatim |
| the free Charm City Circulator Orange Route and its corridor | confirmed, verbatim |
| the 2110 Haines Street depot, Greyhound and Peter Pan, and BoltBus from Penn Station | confirmed, verbatim |
| **parking: only that availability can change on game days, with no lots and no rates** | **refuted**, correction: *"Drop the SP Plus name and the phone number; state only that the Maryland Stadium Authority's own page notes availability changes on game days without naming lots or rates."* Both dropped. |
| bicycle parking: 73 at Gate H, 80 at Gate C, 3 at the Warehouse, 36 at Camden Station | confirmed, verbatim |

No station, garage or bus route becomes a place record — including Camden
Station, whose history is one of the richest things in this artifact and is
published as prose in "The ballpark and the team".

### Around the ballpark

**Two unsourced spatial claims reached a first draft and were cut**, both by the
proximity gate or by re-reading against the verdicts: "North of the ballpark are
two markets and a theatre" (the gate caught this one) and "Ridgely's Delight
begins at the ballpark's western edge". Neither relationship is measured by any
verdict. The published text names streets and boundaries instead.

"Adjacent to M&T Bank Stadium and Oriole Park" survives because a confirmed
verdict states it — a bordering description of named landmarks, which the
Giants verifier in this same wave ruled is not vague proximity.

### The ballpark and the team

The four confirmed `history` verdicts, plus Camden Station's own: the Italianate
brick structure substantially completed by 1857; B&O passenger service into the
1980s; Lincoln's passage in February 1861 and his 1863 train change before the
Gettysburg Address; the Fort Sumter news reaching the telegraph office on April
12, 1861; the Sports Legends Museum's 2015 closure — the one closure in this
site that a verdict actually establishes.

---

## 3. What is absent from the whole site

* **Every liquor-licence fact**, all eight, cited to an endpoint holding no
  records.
* **Bowie State, Rockville, Silver Spring and Odenton** as Camden Line stations.
* **The parking operator's name and phone number**, and any parking rate.
* **Pickles Pub's 1988 date as a fact.**
* **Federal Hill Park's street number.**
* **No trading claim** for the Babe Ruth museum, Pickles Pub, the Hippodrome,
  Pratt Street Ale House or Cross Street Market.
* **No trip duration**, and no unsourced proximity.
