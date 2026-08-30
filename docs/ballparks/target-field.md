# Target Field — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/target_field_places.ex`
and `lib/ethos/seeds/target_field_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Minnesota Twins research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/minnesota-twins.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates, not for every clause of the sentence the finder wrote around it.

**11 places and 1 guide shipped** from 11 researched places.

---

## 0. This artifact has an unusual shape, and it changes what "verdict" means here

Most artifacts in this set carry a `verdicts` array inside each place, one
adjudication per fact. **This one does not.** Its `identity`, `getting_there`
and `history` sections carry per-item verdicts in the usual way; its `places`
carry `found` facts, a `could_not_establish` list, and a **`status_verdict`
adjudicating the place's trading status only**.

That is recorded here rather than papered over, because it changes what the
binding rule can be applied to. What was done:

* **Where a per-item verdict exists** — identity, getting there, history — the
  rule was applied exactly as elsewhere: confirmed ships, refuted ships only
  through its correction.
* **Where only a `status_verdict` exists**, the place's `found` facts were
  published only insofar as the verifier's own reasoning treats them as the
  standing record and its `could_not_establish` list does not carve them out.
  The verifier does reason about content in several of these — for Black Sheep
  it writes that the self-superlatives *"were properly excluded from the found
  facts and left in could_not_establish per rule 4 — the finder did not let a
  self-superlative slip into the confirmed record"*, which is an explicit
  endorsement of the found facts as the confirmed record.
* **Every `could_not_establish` entry was treated as binding**, and each one is
  stated in the published record rather than silently obeyed. There are eight of
  them across this artifact and all eight are named in the prose.

**Both verification passes ran without web search.** The finder's
`search_budget_note` and the verifier's own note record the same thing: the
WebSearch budget reported "200 of 200" exhausted on the first query, in two
separate sessions. The verifier states the consequence plainly: *"It could not
independently discover a competing or more current source the finder never
looked at."* That is a real limit on this artifact and it is why the trading
verdicts here are conservative and why six of eleven places carry no trading
claim.

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| venue | Target Field | refuted-with-correction on one clause (below); confirmed twice more, including against `ballparksofbaseball.com` |
| city | Minneapolis | *"Target Field is confirmed as the current ballpark of the Minnesota Twins, located in downtown Minneapolis' Warehouse District"* — confirmed |
| state | Minnesota | as above |
| county | **Hennepin County** | *"Minneapolis is the county seat of Hennepin County, Minnesota."* — confirmed, cited to `en.wikipedia.org/wiki/Hennepin_County,_Minnesota`, the article that carries it. |

The county citation was checked against the dispatch's warning and holds: the
cited source is the county's own article. The artifact's top-level
`status_verdict` adds that Hennepin County *"is a standard US county that is
also the address's administering jurisdiction and names itself exactly that."*

**A staleness check was run on the venue name**, and it is worth recording as
the counter-case to Rate Field and Comerica Park: the verifier notes that MLB's
own venue reference states the Target Corporation naming-rights deal runs
*"through 2035"* with *"Former Name(s): None"* — *"affirmative, not merely
absent, evidence against a stale venue name."*

---

## 1. The two refutations

### The heated canopy

The finder wrote *"a heated upper-deck canopy and a heated field"*. Refuted on
that one clause:

> The article states 'a canopy above the top deck' and separately 'heated
> viewing areas and a heated field' as two distinct features; it never calls the
> canopy itself heated. That is the heated-viewing-areas fact relocated onto the
> canopy.

Every other clause in the same item was confirmed. The correction's full
wording — *"an open-air, natural-grass ballpark with no retractable roof, built
with local limestone, a canopy over the upper deck, heated viewing areas and a
heated field"* — is what the place record and the guide carry, and an FAQ answer
records the correction.

### The ballpark's adjacency to the parking ramps

The finder wrote that Target Field is *"immediately next to the 'A' and 'B'
ramps"*. Refuted — and this one is instructive, because **the cited source
itself uses "immediately adjacent to"**:

> The underlying facts (the ramps' existence, the I-394 terminus, the bus
> terminals, the skyway link) are all in the Wikipedia article, which itself
> uses the qualitative phrase 'immediately adjacent to.' But the site-builder
> contract bans vague proximity outright … and requires either a sourced address
> or a sourced distance, or silence, rather than an unquantified adjacency claim
> between two named places. No source gives a measured distance between the
> ballpark and the ramps, so the proximity clause should be dropped rather than
> restated in stronger or weaker wording.

The correction supplies the three ramps' street addresses, and those addresses
are what the guide publishes. **This is a case where a source's own words were
not enough**, because the site's rule is about checkability rather than
attribution — the opposite direction from the Mordecai and Hotel Zachary cases
in wave 1, where a verdict's own "across from" wording was what kept the phrase
publishable. The guide states the reasoning in the "Getting there" section, so a
reader who checks the source and finds "immediately adjacent" can see why it is
not here.

Also dropped from that same `found` fact: *"Over 8,000 attendees per game
typically use light rail."* No verdict in the artifact restates it, and it
travelled in the same sentence as the refuted clause. A verdict vouches only for
what it restates, and nothing restates this.

---

## 2. Four self-sourced awards and superlatives, all struck

`could_not_establish` entries name each one:

| Business | Claim | Why it is absent |
|---|---|---|
| Bar La Grassa | a James Beard Award for Isaac Becker | *"the restaurant's own site claims a James Beard Award, but per the research rules a business's own site cannot establish an award, and no independent source confirming it was found"* |
| Black Sheep Coal Fired Pizza | "first coal-burning pizza restaurant in Minnesota" | own site only; the verifier notes approvingly that the finder kept it out of the found facts |
| Black Sheep Coal Fired Pizza | "Award Winning Pizza" | as above |
| The Freehouse | Great American Beer Festival medals (2023 gold for Rye Beers, 2020 gold for Scotch Ale, others) | own site only |

**Spoon and Stable's awards do ship**, and the contrast is the point: Food &
Wine's 2015 Restaurant of the Year, Bon Appetit's Best New Restaurant, and the
2015 James Beard Award finalist nod all come from
`en.wikipedia.org/wiki/Gavin_Kaysen` — an independent article about the chef,
not the restaurant's own page. An FAQ answer explains the distinction, because
a reader who sees one restaurant's awards and not another's should know why.

---

## 3. Places, against the record they rest on

### target-field — Target Field (`stadium`)

`1 Twins Way, Minneapolis, MN` · `https://www.mlb.com/twins/ballpark`

Published from the corrected identity verdict and four confirmed identity and
`history` items: the address, the Warehouse District location, the April 12,
2010 opening and the inaugural win over the Boston Red Sox; the open-air,
natural-turf, baseball-only, no-retractable-roof, local-limestone construction
with a canopy over the upper deck, heated viewing areas and a heated field; the
replacement of the Metrodome, the 30-year lease and the July 15, 2014 All-Star
Game; the 1961 relocation from Washington, D.C.; and the 2010 opening on the
North Loop's southwest edge.

**Not published: a seating capacity.** `could_not_establish` reads *"A specific
2026 seating-capacity figure — no fetched source gave a capacity number dated to
the current season."* No capacity appears anywhere on this site, and both the
place record and an FAQ answer say why. This is the "no minimum length" rule
doing its job: a figure is not published to fill a field.

`status_verdict: confirmed`, on independent non-operator evidence.

### guthrie-theater — Guthrie Theater (`theater`)

`818 South 2nd Street, Minneapolis, MN` · `official_url: nil`

Published: the May 7, 1963 opening with Hamlet, Ralph Rapson's original
building; Jean Nouvel's 2006 facility, the 178-foot cantilevered "Endless
Bridge" toward the Mississippi accessible during regular building hours, and the
three performance spaces seating 1,100, 700 and 199.

**`status_verdict: uncertain`**: *"a season-listing dated to 2024-2025 does not
establish operation as of August 2026."* The 2024-2025 season is published as
what it is — the most recent lineup reached — with no operating claim attached.

### mill-city-museum — Mill City Museum (`museum`)

`704 South 2nd Street, Minneapolis, MN`

Published in full: the Minnesota Historical Society operation, the 2003 opening
inside the Washburn "A" Mill ruins, the Minneapolis-history and flour-milling
exhibits and the "Flour Tower".

**`status_verdict: uncertain`**, `could_not_establish`: *"A dated 2026 statement
of current operating status."* No trading claim.

### stone-arch-bridge-minneapolis — Stone Arch Bridge (`historic-site`)

`Crosses the Mississippi River at Saint Anthony Falls, downtown Minneapolis, MN`

Published in full: James J. Hill's 1881 commission for the Great Northern
Railway, Col. Charles C. Smith's design to avoid damaging the sandstone at the
falls, the 22-month construction completing in 1883 at about $650,000 and the
"Hill's Folly" nickname; the 21 stone arch spans plus one steel-deck truss span
at 2,100 feet; the only-stone-arch-bridge-on-the-Mississippi standing; the 1994
pedestrian and bicycle conversion, the 1971 NRHP listing and the 1974 National
Historic Civil Engineering Landmark designation; and the Stone Arch Festival of
the Arts and Fourth of July fireworks.

The superlative — *"the only arched bridge made of stone on the entire
Mississippi River"* — is the source's own and ships inside the found record.

**The `address` field was trimmed.** The artifact's own address string ends
*"between the 3rd Avenue Bridge and the I-35W Saint Anthony Falls Bridge"*; no
found fact states that relationship, so it is not published. What ships is the
crossing itself, which every found fact supports.

`status_verdict: confirmed` — public pedestrian infrastructure.

### gold-medal-park — Gold Medal Park (`park`)

`Downtown East neighborhood, Minneapolis, MN`

Published in full: 7.5 acres, the May 2007 opening, Tom Oslund's design, the
32-foot mound on a spiral walkway, about 300 trees, the luminescent benches, the
Gold Medal flour name; the original joint City/Guthrie ownership, the 2014
Conservancy purchase and the 50-year lease on the rest; and the Walker Art
Center sculptures including Mark di Suvero and Tony Cragg.

**The `address` field was trimmed.** The artifact's string ends *"next to the
Guthrie Theater and the Mississippi River"*; no found fact states that
adjacency — the Guthrie appears in the found facts as a former *co-owner*, which
is not a spatial claim — so the neighborhood alone is published. This is the same
correction the verifier applied to the ABC Ramps, applied here by the author
rather than the verifier.

`status_verdict: confirmed`, and the verifier upgrades the reasoning: the source
dates the sculpture display *"as of 2025"*, which is *"affirmative present-tense
evidence of an operating public park, not merely an undated description."*

### target-center — Target Center (`attraction`)

`600 First Avenue North, Minneapolis, MN`

Published in full: the October 13, 1990 opening, the Timberwolves and Lynx
tenancies, the concerts and other events, the City of Minneapolis ownership and
Legends Global management, and the $140 million renovation completed October
2017.

`status_verdict: confirmed`. Target Center is a place record and not transit
prose because it is an arena with major-league tenants, a dated renovation and a
named manager — content, not an address.

### bar-la-grassa — Bar La Grassa (`restaurant`)

`800 Washington Avenue North, Minneapolis, MN` · `https://www.barlagrassa.com/`

Published: the address, the Italian cuisine, and the establishment by the chef
Isaac Becker and Nancy St. Pierre, all attributed to the restaurant's own site
because that is the only source reached.

**`status_verdict: uncertain`**, and **no James Beard Award**; see §2.

### black-sheep-coal-fired-pizza-north-loop — Black Sheep Coal Fired Pizza (`restaurant`)

`600 Washington Ave, Minneapolis, MN` · `https://www.blacksheeppizza.com/`

Published: the North Loop address, the coal-fired pizza, salads, appetizers,
desserts and craft cocktails, and the site's own statement about anthracite coal
in ovens reaching at least 1,200 degrees. The oven detail is a description of an
offering rather than a ranking, which is the line rule 4 draws.

**`status_verdict: uncertain`**, and **no "first in Minnesota" and no "Award
Winning"**; see §2.

### the-freehouse — The Freehouse (`brewery`)

`701 N Washington Ave #101, Minneapolis, MN 55401` ·
`https://www.freehousempls.com/`

Published: the address and the description as a restaurant and brewery serving
from breakfast through evening, attributed to its own site.

**`status_verdict: uncertain`** — the verifier notes the site lists current
happy-hour times, which is *"a self-reported operating signal but not
independent confirmation"*. **No GABF medals**; see §2.

### spoon-and-stable — Spoon and Stable (`restaurant`)

`211 North First Street, Minneapolis, MN 55401` ·
`https://www.spoonandstable.com/`

Published in full, including the three awards, which come from an independent
source; see §2.

**`status_verdict: uncertain`** — *"no independent dated-2026 operating statement
… correctly left uncertain rather than upgraded on the strength of a well-sourced
history."* The history is good; that is not the same as being open.

### kierans-irish-pub — Kieran's Irish Pub (`restaurant`)

`85 N 6th St, Minneapolis, MN 55403` · `https://kierans.com/`

**This is the artifact's one flagged identity wrinkle**, and the verifier's
handling of it is quoted in full because it decides what is published:

> This is the one place in the artifact carrying a genuine, flagged identity
> wrinkle — the finder itself raised whether the '85 N 6th St' address is the
> same Kieran's as an earlier-address business the finder recalls seeing
> referenced as having closed in 2020, and never resolved it. The address and
> current existence are still confirmed by an operator's own site per rule 4, so
> this does not fall under the identity-blocks-publication bar (that bar is for
> an unconfirmed name or address, and this address is confirmed as the site's
> own current claim) — but the continuity claim ('over 30 years… in downtown
> Minneapolis') should not be read as proof this is the same
> continuously-operating pub … Publish the address and description as given; do
> not add or imply an unbroken 30-year history at one location beyond what the
> site itself claims.

Published: the address, the Cara Irish Pubs membership, the game-day watch
parties, and the over-30-years claim **stated as the site's own claim**. The
unresolved question about the earlier location is stated in the place record and
in the guide. **`status_verdict: uncertain`.**

---

## 4. The guide

`slug: target-field-guide` · `destination: "Minneapolis, Minnesota"` ·
`state: "Minnesota"` · `county: "Hennepin County"`

### Getting there

Five `getting_there` items: four confirmed, one refuted on adjacency and shipped
through its correction. Published: the Blue and Green Lines terminating at
Target Field Station, its November 14, 2009 opening, its name, and the 1,725
daily boardings ranking sixth of 37 stations as of 2025; the C Line and D Line
BRT and local routes 9, 14, 22 and 94; the Northstar Line's January 4, 2026
closure with every figure and cause the verdict gives; and the three ABC Ramps
addresses, the I-394 terminus, the two bus terminals and the skyway.

**The discontinued Northstar service is published, deliberately**, for the same
reason Milwaukee's discontinued Brewers Line is: a reader looking for a train
that no longer runs needs the fact, not the silence.

**No station, ramp or bus route becomes a place record.**

**Not published:** a parking rate — the operator's own site publishes none for
Twins games and no other source states one.

### Around the ballpark

Every address is a place record's own published address. The neighborhood
paragraph rests on the confirmed North Loop `history` item, including the
Chicago Commercial style, which ships because a confirmed verdict states it.

### The ballpark and the team

Restates the confirmed `history` items with `about: "ballpark"` and
`about: "team"`, with the corrected canopy wording and an explicit statement
that no capacity is published and why.

### FAQ

Seven questions. Five state a limit rather than filling space: the absent
Northstar service, the absent parking rate, the absent capacity, the heated
canopy correction, and the difference between an award sourced independently and
one sourced to the business claiming it.

---

## 5. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8. Nothing was lost
  to it here; no confirmed verdict in this artifact states one.
* **No vague proximity** — and this site is where the rule bit hardest, because
  it struck a phrase the cited source itself used. Three spatial claims were
  trimmed: the ballpark-to-ramps adjacency, the Stone Arch Bridge's
  between-two-bridges position, and Gold Medal Park's "next to the Guthrie
  Theater and the Mississippi River". All three are replaced by addresses or
  neighborhoods.
* **No self-sourced award or superlative.** Four struck, one set published
  because it is independently sourced.
* **No seating capacity**, because no dated one exists in the record.
* **No trading claim for six of eleven places**, named with the reason in the
  guide prose and in an FAQ answer — with the additional reason stated that
  Minneapolis's open data portal produced no queryable licence records, so this
  site has no licence evidence at all.
