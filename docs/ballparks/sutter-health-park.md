# Sutter Health Park — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/sutter_health_park_places.ex`
and `lib/ethos/seeds/sutter_health_park_guide.ex`.

Committed on purpose: the research artifact lives under `.superpowers/`, which
`.gitignore` excludes.

Source: the 2026-08-30 Athletics research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/athletics.json`,
`verified: true`).

**6 places and 1 guide shipped** from **7 researched places**. One place was
dropped; see below.

---

## Identity

| Field | Value | Verdict |
|---|---|---|
| club | **Athletics** | *"Wikipedia's Athletics (baseball team) article states the team was the Oakland Athletics through 2024 and became simply 'Athletics' upon relocating to West Sacramento for 2025"* — confirmed, plus a confirmed verdict that MLB.com uses the bare name |
| venue | Sutter Health Park | *"Sutter Health Park's official site lists its address as 400 Ballpark Drive, West Sacramento, CA 95691, hosting the Sacramento River Cats and the Athletics"* — confirmed |
| city | West Sacramento | as above |
| state | California | *"West Sacramento is a city in Yolo County, California"* — confirmed |
| county | Yolo County | as above |

### The discrepancy that was not there

Identity verdict #3 is **refuted**. The finder flagged, with a `DISCREPANCY:`
prefix, that the ballpark's own site *"still labels the MLB tenant 'Oakland
Athletics' in its team-websites navigation footer"*. The correction: *"Drop this
claim. As of 2026-08-30, sutterhealthpark.com does not use 'Oakland Athletics'
anywhere; the team's current name is consistently 'Athletics' with no city name
across all sources checked, including this one."*

Nothing about a naming discrepancy appears anywhere in this site. A flagged
conflict that does not exist is its own kind of error, and publishing it would
have told readers to distrust a source that is in fact consistent.

---

## The one dropped record

**Mill Street Pier does not ship.** Its `address` field reads `could not be
established`, and `could_not_establish` names both gaps: a street address, and
independent confirmation beyond the one tourism-bureau source. Its single
confirmed verdict is *"Historic shipping pier featuring an illuminated 'WEST'
art installation."*

The binding rule: **a place whose current name or address is unestablished does
not ship — there is nothing left to publish.** That is the ruling that dropped
The Park at Wrigley from the checkpoint, and it applies here without strain: a
record with no address and one line of description is a name and an
installation.

It is **named in the guide's "Around the ballpark" section and in an FAQ
answer**, with the reason, rather than dropped in silence — the treatment
Wrigley gave Casey Moran's and Sports Corner.

Note the contrast with places in this wave that *do* ship without a street
number: Heritage Field, China Basin Park, the Old Courthouse, Federal Hill Park,
Ridgely's Delight, Tower Bridge and River Walk Park all have a **sourced
descriptive location** — cross streets, bounding streets, a river crossing, a
riverfront. Mill Street Pier has none.

---

## 1. Places, against the verdicts they rest on

### sutter-health-park — Sutter Health Park (`stadium`)

`400 Ballpark Drive, West Sacramento, CA 95691` ·
`official_url: https://www.sutterhealthpark.com/`

Confirmed and published: the address and both tenant teams; the 2000 opening as
Raley Field and the post-2019 renaming; total capacity 14,014 from 10,624 fixed
seats plus grass berms, **"currently the smallest ballpark in MLB while hosting
the Athletics"** — a superlative inside confirmed verdict text, so it ships, with
its own qualifier intact; the drop from an original 14,611 after the 2005 party
deck and 2010 Diamond Club; groundbreaking October 28, 1999; $46.5 million,
about $86.9 million in 2025 dollars; the Raley's naming rights at $15 million
over 20 years; the Sutter Health agreement; the April 4, 2024 announcement of a
2025-2027 tenancy with a fourth-year option; the first home game March 31, 2025.

`could_not_establish`: a flat published parking rate without entering a game
date. Published in the guide.

### drakes-the-barn-west-sacramento — Drake's: The Barn (`brewery`)

Both verdicts confirmed and published whole: the two-acre riverside beer garden
and event space in the Bridge District; wood-fired pizza kitchen; rotating food
trucks; over 40 taps of Drake's beers plus cocktails and wine; fire pits and
lawn games; the Visit Yolo itinerary listing.

**`status_verdict: uncertain`**, `could_not_establish`: independent
confirmation of current trading. No trading claim.

### bike-dog-brewing-west-sacramento — Bike Dog Brewing (West Sacramento taproom) (`brewery`)

Both verdicts confirmed and published whole: dog-friendly taproom; a menu on the
brewery's own site dated March 2026; open Tuesday to Sunday, closed Mondays;
food trucks, cornhole and running-club events; the Visit Yolo listing.

**`status_verdict: uncertain`.** No trading claim. The March 2026 menu date is
published as what it is — a date on the site, not a statement that the taproom
is trading now.

### franquette-west-sacramento — Franquette (`cafe`)

Three confirmed verdicts, published whole: the French-inspired cafe and wine bar
in the Bridge District; the full week of hours; weekend brunch; the founders
Brad Cecchi and Clay Nutting, previously of Canon; and the Visit Yolo
description of casual French cuisine such as beef tartare and duck confit.

**`status_verdict: uncertain`.** No trading claim.

### tower-bridge-sacramento — Tower Bridge (`historic-site`) · `official_url: nil`

Four confirmed verdicts, published whole: the vertical lift bridge completed in
1935, replacing an 1911 swing bridge, dedicated by Governor Frank Merriam on
December 15, 1935; **the Streamline Moderne style, "unusual for a lift bridge of
its era"**; American Institute of Steel Construction recognition in 1935;
National Register listing 1982; cars, bicycles and pedestrians.

Style ships because a verdict states it.

**Why this is a place and not just transit prose.** The station-and-garage ban
exists to stop thirty ballparks minting thirty platform records that can never
be more than an address. This is a National Register listing with a sourced
architectural style and a dedication date. Its name matches no pattern in that
gate, and no exemption was needed.

**The travel-function clause is dropped.** The `getting_there` verdict on the
bridge is confirmed but carries a correction: *"Keep the sourced description
(style, route, what it connects, modes carried). Drop the added clause naming it
'the' walking/biking link to the stations — no source ties the bridge to that
specific travel function."* The guide publishes what the bridge connects and
says outright that it asserts no route.

### river-walk-park-west-sacramento — River Walk Park (`park`) · `official_url: nil`

Verdict #0 confirmed and published: riverfront park, walking trails, public art
including "Subtile" of 34,000 stainless steel plates, views of Tower Bridge and
Old Sacramento.

Verdict #1 is **refuted**: the finder called westsacramento.org *"the city
tourism-adjacent site"*. The correction establishes it is *"an independently run
West Sacramento information site (run by an individual, not the city or a
tourism bureau)"* and offers the choice of re-citing it or dropping it. **It is
dropped**, along with its quoted sentence about lush green spaces and paved
pathways, and Visit Yolo's description carries the record instead.

Verdict #2 confirmed: OpenStreetMap's Nominatim geocodes the park to 651
Broderick at 38.5834, -121.5086. `could_not_establish`: *"a street address from
an authoritative (non-crowd-sourced) source."*

**The `address` field is descriptive and the geocode is prose.** The verdict
confirms that Nominatim returns that result; it does not confirm that the result
is the park's address, and the artifact's own address field says so — *"a
crowd-sourced result, not a source with editorial authority, and it should be
checked before being relied on."* The summary publishes the geocode with exactly
that caveat.

---

## 2. The guide

`slug: sutter-health-park-guide` · `destination: "West Sacramento, California"` ·
`state: "California"` · `county: "Yolo County"`

### Getting there

Five confirmed `getting_there_verdicts`: the ballpark address; ACE Parking's
reservation system, the 870 Riverfront St lot address, and **no flat price
without a game date**; Sacramento Valley Station as the Gold Line's western
terminus with its four Amtrak routes; 7th & Capitol and 8th & Capitol, opened
March 12, 1987, connecting to the Blue and Green Lines and to bus routes; and
Tower Bridge, with its travel-function clause corrected out.

Two clauses in the finder's `fact` text but **not in its verdict `item`** were
not carried: "across the river in downtown Sacramento" for Sacramento Valley
Station, and "in downtown Sacramento" for the two Capitol stations. A verdict
vouches only for what its own item restates.

### Around the ballpark

Three Bridge District businesses, the bridge, the park, and the paragraph naming
Mill Street Pier and why it has no page. The closing paragraph names the three
places with no trading claim.

### The ballpark and the team

Eight confirmed `history_verdicts`, in order: the 1901 founding as an AL charter
franchise in Philadelphia with Columbia Park and Shibe Park; Kansas City 1955 and
Oakland 1968, with 57 seasons at the Coliseum through 2024; the nine World
Series titles by year and city; the April 4, 2024 announcement and the 2025-2027
term; the Las Vegas ballpark not expected before 2028 and the six 2026 games at
Las Vegas Ballpark; the ballpark's groundbreaking, opening, cost and Raley's
naming rights; the Sutter Health renaming; the capacity figures.

The section opens with the club's name because the name is the fact a reader is
most likely to arrive with wrong.

---

## 3. What is absent from the whole site

* **Mill Street Pier as a place record** — address unestablished.
* **The "Oakland Athletics" naming discrepancy** — refuted; it does not exist.
* **westsacramento.org as a city or tourism source** — refuted; dropped
  entirely.
* **Tower Bridge as the walking route to the light rail** — no source ties it to
  that function.
* **Any flat parking price.**
* **No trading claim** for Drake's: The Barn, Bike Dog Brewing or Franquette.
* **No trip duration**, and no distance between two places.
