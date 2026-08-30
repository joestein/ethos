# Citizens Bank Park — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for
`lib/ethos/seeds/citizens_bank_park_places.ex` and
`lib/ethos/seeds/citizens_bank_park_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Philadelphia Phillies research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/philadelphia-phillies.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates, not for every clause of the sentence the finder wrote around it.

**5 places and 1 guide shipped** from 5 researched places.

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| venue | Citizens Bank Park | *"The Philadelphia Phillies play at Citizens Bank Park in Philadelphia, Pennsylvania, their home since 2004, located in the South Philadelphia Sports Complex."* — confirmed |
| city | Philadelphia | same verdict, plus *"Citizens Bank Park's address is One Citizens Bank Way, Philadelphia, Pennsylvania."* — confirmed |
| state | Pennsylvania | as above |
| county | **Philadelphia** | *"Philadelphia is coextensive with Philadelphia County, Pennsylvania; the city is the seat of its own county under a consolidated city-county government structure."* — confirmed, source `en.wikipedia.org/wiki/Philadelphia`, with the correction: *"Ship `county` as 'Philadelphia', matching the independent-city convention already used elsewhere in this corpus (St. Louis, Baltimore) — not the current explanatory-sentence value."* |

The artifact's `county` field holds an explanatory sentence, not a value. The
value is taken from the verdict, and the verdict's own `source_url` is the
Philadelphia article that carries the consolidated city-county fact — checked,
because the county citation has been miscited in every wave so far.

---

## 1. Places, against the verdicts they rest on

### citizens-bank-park — Citizens Bank Park (`stadium`)

`One Citizens Bank Way, Philadelphia, PA 19148` ·
`official_url: https://www.mlb.com/phillies/ballpark`

| Published | Verdict `item` |
|---|---|
| home ballpark of the Phillies since 2004, in the South Philadelphia Sports Complex | confirmed, verbatim |
| One Citizens Bank Way | confirmed, verbatim |
| "the City of Philadelphia's business-license register gives the ZIP code for 1 Citizens Bank Way as 19148-5204" | confirmed, verbatim (the `phl.carto.com` SQL endpoint, re-fetched) |
| "42,901 by Wikipedia and 43,035 by Ballparks of Baseball; the two sources do not agree" | confirmed — the verdict's own text **is** the disagreement |
| "perimeter buildings face 11th Street to the west, Pattison Avenue to the south and Darien Street to the east" | **refuted with correction.** The correction reads: *"Keep only what the source supports: 'Citizens Bank Park's perimeter buildings face 11th Street to the west, Pattison Avenue to the south, and Darien Street to the east.' Drop 'on the northeast corner of the South Philadelphia Sports Complex' — no source fetched states this."* The correction's text ships; the positional clause does not. |
| opened April 3, 2004; replaced Veterans Stadium (1971-2003); $458m / $781m in 2025 dollars; groundbreaking June 28, 2001; EwingCole, HOK Sport, Agoos Lovera, Stanley Cole chief architect | confirmed, verbatim |
| the 25-year, US $95 million Citizens Bank naming deal of June 17, 2003 | confirmed, verbatim |
| 2008 World Series clinched October 29, 2008, Brad Lidge's final out | confirmed, verbatim |
| 2012 NHL Winter Classic, announced attendance 46,967, a stadium record | confirmed, verbatim. The "stadium record" is the source's own and rides inside the verdict. |
| announced April 16, 2019 as the 2026 All-Star Game site, timed to the 250th anniversary of American independence | confirmed, verbatim |
| Ashburn Alley; the 52-foot Liberty Bell replica; the Frudakis bronzes; the 7.5-foot Harry Kalas memorial dedicated 2011 | confirmed, verbatim |

`status_verdict: open` — the only trading claim this site makes about the
ballpark, and the guide says the Phillies play there.

**Not published:** "on the northeast corner of the South Philadelphia Sports
Complex"; any parking price (see the guide).

### stateside-live-philadelphia — Stateside Live! Philadelphia (`attraction`)

`1100 Pattison Avenue, Philadelphia, PA 19148` · `https://statesidelive.com/`

Four confirmed verdicts, published: the corner of 11th and Pattison on the
eastern edge of the former Spectrum site, first tenants March 2012 as Xfinity
Live! Philadelphia; the August 21, 2025 rebrand after Stateside Brands, a
Philadelphia-area vodka company, bought the naming rights, with a $15 million
expansion and a new outdoor beer garden expected in early 2026; the tenant list
from the venue's own site, with events promoted through January 2027; the
Miller Lite Concert Stage and NBC Sports Arena description under the former
name, **including the source's own statement that it does not say whether the
Chickie's & Pete's and Geno's Steaks inside are the brands' original South
Philadelphia locations**; and the business-license row filing the operator as
"PL PHASE ONE LP (XFINITY LIVE)" at 3601 South Broad Street.

`status_verdict: open`.

### chickies-and-petes-sports-complex — Chickie's & Pete's (`restaurant`)

`1526 Packer Avenue, Philadelphia, PA`

Two confirmed verdicts, published: the 1977 founding by Peter and Henrietta
Ciarrocchi, the 2007 "crab fries" trademark, and the 1998 expansion into a
former vacant supermarket building near Veterans Stadium in the Sports Complex
Special Services District in Packer Park at 1526 Packer Avenue; and the City
register's active Food Preparing and Serving (30+ seats) licence at that address
under "T/A CHICKIES & PETES INC (PACKER CAFE INC)", plus an active dumpster
licence at the same address.

**`status_verdict: uncertain`**, `could_not_establish`: no source states whether
this is the same physical storefront as the "Chickie's and Pete's" tenant listed
at 1100 Pattison Avenue. Identity — name and address — is established by two
independent sources, so the record ships; **no trading claim is made**, in the
place record, the guide prose or the FAQ. That is the "uncertain trading does
not block publication" rule, and its limit: the guide says plainly that the
silence is not evidence of closure.

### american-swedish-historical-museum — American Swedish Historical Museum (`museum`)

`1900 Pattison Avenue, Philadelphia, PA 19145`

Five confirmed verdicts, all published: the 1926 founding out of the
Sesquicentennial Exposition's Swedish-American committee, Crown Prince Gustaf VI
Adolf's cornerstone of June 2, 1926 and the dedication of June 28, 1938 on the
New Sweden colony's 300th anniversary; John Nydén's building drawing on
Ericsberg Castle, a 17th-century Swedish manor house, with Mount Vernon arcades
and a Stockholm City Hall cupola; the museum's own hours and admission prices;
Visit Philadelphia's 12 galleries and the Midsummer and Lucia festivals; and the
business-license register's **1954** Pattison Avenue against the museum's own
**1900**.

The architectural derivation ships because a confirmed verdict states it. The
address disagreement ships because a record that hides a source disagreement is
worse than one that states it — `could_not_establish` names it as unresolved.

`status_verdict: open`.

### fdr-park — FDR Park (`park`)

`1500 Pattison Avenue & S Broad St, Philadelphia, PA 19145` ·
`https://fdrparkphilly.org/`

Four confirmed verdicts, all published: 348 acres in South Philadelphia along
the Delaware River, Olmsted Brothers, reclaimed marshland from the former
Greenwich Island, opened as League Island Park and renamed in 1955;
Philadelphia Register of Historic Places 2000, bordering the sports complex on
South Broad Street and bounded by I-95, the former Naval Yard and Packer Park;
about 77 acres of natural lands with ponds and lagoons, the museum, a boathouse
and gazebo, the 2-acre playground of 2023, and the golf course of nearly 80
years that closed in 2019; and the Parks & Recreation address plus the Tai Chi
for Beginners program of September 1, 2026 run by Friends of FDR Park.

"It borders the South Philadelphia Sports Complex on South Broad Street" is a
bordering relationship named to a street, which docs/site-builder.md §8
publishes. `status_verdict: open`.

---

## 2. The guide

`slug: citizens-bank-park-guide` · `destination: "Philadelphia, Pennsylvania"` ·
`state: "Pennsylvania"` · `county: "Philadelphia"`

### Getting there

Seven confirmed `getting_there` verdicts, all published as prose: the Broad
Street Line (Metro B) from Fern Rock Transit Center through Center City to NRG
Station on Pattison Avenue; NRG's three names (Pattison 1973-2010, AT&T
2010-2018); the "B2 Special" express making no stops between Walnut-Locust and
NRG; the 1973 extension built for the then-newly completed complex; SEPTA bus
routes 4 and 17; the two active Public Garage / Parking Lot licences on Pattison
Avenue (SP Plus Corporation at 1020, Express Parking Inc at 700) with no
per-event rate in the register; and FDR Park as an alternative offsite parking
site.

**No station, garage, lot or bus route becomes a place record.** The two
licensed parking operators are named in prose and hold no records.

**Not published: a parking price.** The `could_not_establish` on the ballpark
records that MLB.com's ballpark, transportation and parking pages and
phillies.com (which redirects to MLB.com) returned HTTP 406 to every automated
fetch, and that the Philadelphia Parking Authority's public facility listing
names no sports-complex event lot and states no rate.

### Around the ballpark

Every address is a place record's own published address. The two source
disagreements — the museum's street number, and whether the Packer Avenue
Chickie's & Pete's is the Pattison Avenue tenant — are stated where a reader
meets the place, not buried.

**Not published:** any spatial relationship between two of these places that no
verdict measures. What ships is checkable: a street corner ("11th and
Pattison"), a bordering relationship ("borders the sports complex on South
Broad Street"), a containment ("inside FDR Park", which the FDR Park verdict
states), and street numbers on one avenue.

### The ballpark and the team

The ballpark paragraphs restate the five confirmed `history` items with
`about: "ballpark"`, plus the naming-rights and boundary verdicts from the place
record. The team paragraph restates the three with `about: "team"`: the 1883
establishment and the December 7, 1882 award to Al Reach and John Rogers; "the
oldest, continuous, one-name, one-city franchise in American professional
sports" and the April 3, 1883 first print appearance of the nickname; and the
two World Series titles and eight National League pennants.

The superlative ships because it sits inside a confirmed verdict's own text.

### FAQ

Six questions, each answered only from the verdicts above. The parking answer,
the capacity answer and the Chickie's & Pete's answer each state what could not
be established rather than filling the space.

---

## 3. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8. Nothing in this
  artifact was lost to that rule — no confirmed verdict here states one.
* **No vague proximity.** Every spatial claim published is a street name, a
  street corner, a bordering relationship or a containment a verdict states.
* **No unsourced superlative.** Two ship, both inside confirmed verdict text:
  the Phillies as the oldest continuous one-name, one-city franchise in American
  professional sports, and the Winter Classic attendance as a stadium record.
  One positional claim was struck: the ballpark's "northeast corner" of the
  sports complex.
* **No trading claim for Chickie's & Pete's**, named with the reason in the
  guide prose and in an FAQ answer.
