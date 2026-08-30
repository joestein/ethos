# American Family Field — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for
`lib/ethos/seeds/american_family_field_places.ex` and
`lib/ethos/seeds/american_family_field_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Milwaukee Brewers research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/milwaukee-brewers.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates, not for every clause of the sentence the finder wrote around it.

**4 places and 1 guide shipped** from 4 researched places.

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| venue | American Family Field | *"…it was originally named Miller Park (2001-2020) under a $40 million naming-rights deal with Miller Brewing Company that expired at the end of 2020, and was renamed American Family Field in 2021 after American Family Insurance purchased a 15-year naming-rights agreement"* — confirmed |
| city | Milwaukee | *"American Family Field, home of the Milwaukee Brewers, is at 1 Brewers Way, Milwaukee, Wisconsin, in Milwaukee County"* — confirmed |
| state | Wisconsin | as above |
| county | **Milwaukee County** | the same verdict, plus *"Milwaukee is the county seat of Milwaukee County, Wisconsin, the state's most populous county, which the article states is home to the Milwaukee Bucks and Milwaukee Brewers"* — confirmed, cited to `en.wikipedia.org/wiki/Milwaukee_County,_Wisconsin`, the article that carries it. |

The county citation was checked against the dispatch's warning; here the cited
source is the county's own article and does carry the fact, and it names the
Brewers explicitly, so the link to this ballpark is in the source rather than
inferred.

**The former name survives in one published string, and it is not the
ballpark's.** MCTS Route 74 is named "S. 43rd St-Miller Park Way", confirmed
verbatim. It is published as the route's name, with that stated.

---

## 1. What the duration ban cost here

The confirmed verdict describing the roof reads: *"features North America's only
fan-shaped convertible roof, which can open and close in less than [interval],
and a natural Kentucky bluegrass playing surface with heat lamps for off-season
maintenance."* The bracket is this file's, because the rest of the clause is
what §8 bars.

The roof's shape, its "only in North America" standing, the bluegrass and the
heat lamps all ship. **The operating interval does not**, on the wave-1
precedent: the duration ban is enforced by a scan over module *source*, and its
allowlist is keyed `{file, phrase}` over a whole module, so a pardon would also
cover a genuine travel claim added to that file later. Wave 1 dropped Rogers
Centre's roof interval and the Dodger Stadium Express headways on exactly this
reasoning.

**A consequence worth restating:** because the scan reads source, neither
moduledoc can quote the omitted clause even to record that it was omitted. Both
describe the omission instead. This Markdown file is not scanned, which is why
the shape of the missing clause can be described here at all.

---

## 2. The two refutations

### The lot access route

The finder wrote: *"Named lots include the Molitor Lot, Cooper Lot and American
Family Lot, reached via Bluemound Road and Yount Drive."* Refuted:

> A full-text search of the page's raw HTML shows the phrase 'Bluemound' appears
> exactly once, and only in the paragraph describing the Rideshare Lot on the
> south end of the Molitor Lot … The Cooper Lot is described only as
> motorcycle/scooter parking, and the American Family Lot only as an
> oversized-vehicle/bus overflow area … Folding three named lots into one
> access-road claim sourced to only one of them is exactly the kind of overreach
> the vague-proximity rule targets.

The correction's split is what ships. Note also that **every dollar figure in
that item was confirmed as an exact match to the live page's raw HTML** — the
rates are not what failed. The verifier's re-read gives the Bus/RV advance
triple as $55/$70/$100 where the finder's prose compressed it to "$55-$100", so
the published rates are the verifier's triples.

### Helfaer Field's citations

Six clauses were attributed to `en.wikipedia.org/wiki/Helfaer_Field`. A raw
wikitext fetch confirmed five of them there — opened 2002, $3.1 million, old
foul poles retained, 722 capacity, 200-foot fences six feet high — and found
that *"groundbreaking… August 2001"*, *"Marion Helfaer"*, *"1974"* and *"original
investor"* appear nowhere in it. They appear verbatim in
`en.wikipedia.org/wiki/American_Family_Field` instead. The verifier's own
comparison: *"the same class of error this document's own history flags ('a
founding year… attributed to an article that contains neither')."*

**Both halves ship, each cited to the article that carries it.** And because the
two articles phrase the naming rationale differently — "an original investor in
the Brewers" against "a part-owner of the Brewers when they arrived in
Milwaukee" — **both phrasings are published**, which is the wave-1 practice for
two sources with two answers.

---

## 3. Places, against the verdicts they rest on

### american-family-field — American Family Field (`stadium`)

`1 Brewers Way, Milwaukee, WI 53214` · `https://www.mlb.com/brewers/ballpark`

Three confirmed place verdicts, four confirmed `history` items and one confirmed
`getting_there` item ship: the April 6, 2001 opening, the 41,900 capacity, the
fan-shaped convertible roof and the heat-lamped Kentucky bluegrass; HKS, Inc.,
NBBJ and Eppstein Uhen Architects; the Miller Park / American Family Field
naming chain; the $290 million of public funds from the 0.1% five-county sales
tax, its January 1, 1996 to March 31, 2020 span, the $609 million total and
George Petak's deciding vote and recall defeat; the November 9, 1996
groundbreaking in a parking lot behind County Stadium; the Big Blue crane
collapse of July 14, 1999, the 450-ton roof section, the three deaths and the
delay; the $392 million total cost and the project's standing among Wisconsin's
largest; County Stadium's February 21, 2001 demolition and the parking that
covers most of its site; the Seattle Pilots origin, the 1970 relocation and the
brewing-industry name; and the position southwest of the I-94 / Brewers
Boulevard intersection with the stated coordinates.

`could_not_establish` records that *"The official MLB.com ballpark page itself
does not state capacity or opening date; those figures come from Wikipedia."*
The summary says so, because a reader who checks the club's page and finds
neither figure should be able to see that the research knew.

`status_verdict: confirmed - operating`, and the reasoning is recorded: the
club's own page alone would be self-referential, and Wikipedia is the
independent third-party source stating the same thing.

**Not published:** the roof's operating interval; see §1.

### miller-brewery-tour — Miller Brewery Tour (`brewery`)

`4251 W. State St., Milwaukee, WI 53208` · `https://www.millerbrewerytour.com/`

Two confirmed verdicts, published in full: Frederick Miller's 1855 founding a
year after emigrating from Germany, the $2,300 purchase of the Plank Road
Brewery, Molson Coors' full ownership from 2016 and its continued operation of
the brewery at the original complex; and the tour site's own description with
its quoted phrases and the 414-931-BEER visitor line.

**`status_verdict: uncertain`.** The verifier's reason distinguishes two things
a careless read would merge: *"Wikipedia's 'Molson Coors continues to operate
the Miller Brewery' is third-party but undated and could be describing the
brewing operation generally rather than the public tour specifically."* So the
brewery's operation is published as the encyclopedia states it, and **no claim
is made that the tour is running**.

`could_not_establish`: hours, prices and whether reservations are required, the
tour-information page having returned a 404. Stated in the summary and in an FAQ
answer.

### hank-aaron-state-trail — Hank Aaron State Trail (`park`)

`Lakeshore State Park, Milwaukee, WI to Underwood Parkway, Wauwatosa, WI, via the Menomonee Valley` ·
`https://dnr.wisconsin.gov/topic/parks/hankaaron`

Three confirmed verdicts, published in full: the DNR's own connection
statement and the Ward Theatre, State Fair Park and Pettit National Ice Center
links, the year-round opening and the absence of a trail-pass requirement; the
east-west run, the northwestward spur to the ballpark, the 2000 opening with an
initial one-third-mile segment, the DNR management with the Friends group, and
the approximately 200,000 annual users; and the "People of the Road" sculpture,
the "Bird Bike" installation, the murals and the 1929 copper streetcar shelters.

**`status_verdict: confirmed - open`, and the basis is not a self-report.** The
verifier: *"The Wisconsin DNR's own current page … states 'The trail is open
year-round' under its own Hours heading. This is a state agency's
operating-status statement about a facility it operates, not a business's
self-report about its own commercial trading status, so it is treated as
authoritative here."* That distinction is worth carrying into later waves.

**The record's `town` is Milwaukee** though the trail ends in Wauwatosa. The
`address` names both ends, so no reader is misled, and Milwaukee is the end the
DNR page and this guide's destination hub cover.

One correction on this item is bookkeeping rather than content: a confirmed
`getting_there` verdict carries the note that the finder tagged the trail
`"mode": "bus"` and should have used a non-transit tag. That affects the
artifact's own schema, not any published sentence.

### helfaer-field — Helfaer Field (`historic-site`)

`On the former infield site of Milwaukee County Stadium, Milwaukee, WI` ·
`official_url: nil`

The refuted verdict ships through its correction; see §2. One further verdict is
confirmed and published in full: the home-plate outline on the picnic concourse,
the bronze marker in the nearby parking lot for Hank Aaron's 755th home run, and
the Teamwork sculpture honoring the three workers killed in the crane collapse.

**The identity call.** `could_not_establish` reads: *"A specific street address
or house number — no source reached gives one; it is described only by its
position relative to American Family Field and the former County Stadium
infield."* Under the identity rule a place whose address is unestablished does
not ship, so this was weighed rather than waved through.

What is unestablished is a **house number**. What is established, by two
independent confirmed verdicts, is that the field occupies the former County
Stadium *infield footprint* — a fixed, historically located piece of ground, not
a gesture at a neighbour. The Milwaukee County Stadium verdict puts it as
containment: *"the site of its old infield was converted into a Little League
park now called Helfaer Field."* The name is beyond doubt and there is a
paragraph of confirmed content behind it.

So it ships, and the `address` field carries the **footprint** form rather than
the relative form: `"On the former infield site of Milwaukee County Stadium,
Milwaukee, WI"`. The artifact's own address string opens "Outside American
Family Field", which is the relative half and is left out of the address field
for that reason. The missing house number, the missing hours and the unknown
operator are all stated in the summary and in an FAQ answer.

This sits between wave 1's two precedents: firmer than Mill Street Pier, whose
address *"could not be established"* at all and which was dropped, and looser
than Bleacher Bar, which had two sourced street numbers. The deciding fact is
that a source states where the field is, in terms a reader can check on the
ground.

**`status_verdict: uncertain`.** No trading claim.

---

## 4. The guide

`slug: american-family-field-guide` · `destination: "Milwaukee, Wisconsin"` ·
`state: "Wisconsin"` · `county: "Milwaukee County"`

### Getting there

Eight `getting_there` items: seven confirmed, one refuted on the lot access and
shipped through its correction. All ship in some form.

**The discontinued services are published, deliberately.** The confirmed verdict
records that the MCTS freeway-flyer routes, the Cream Puff Line, the Summerfest
Shuttle and the Brewers Line — *"which provided game-day service to American
Family Field"* — were formally discontinued toward the end of 2022 over a
projected 2025 budget shortfall. A guide that silently omitted this would leave
a reader looking for a game-day bus that is not there, so it opens the section.

**No station, garage, lot or bus route becomes a place record.** The Hank Aaron
State Trail *is* a place record, and it is a state park facility rather than
transit infrastructure — it has three sculptures, a set of 1929 shelters and a
sourced annual-use figure, not an address and nothing.

### Around the ballpark

Every address is a place record's own published address, except Helfaer Field,
which has none and says so. The Helfaer naming disagreement is stated where the
reader meets it.

**Not published:** an access route for the Cooper Lot or the American Family
Lot, and any spatial relationship among the three named lots. The source gives
one route, for the Rideshare Lot, and that is the only one here.

### The ballpark and the team

Restates the confirmed `history` items with `about: "ballpark"` plus the
franchise-origin clause of the identity verdict. The roof paragraph states in
terms that a sourced detail was dropped and why.

### FAQ

Six questions. Four state a limit: the absent game-day bus, the unavailable tour
hours, the missing Helfaer Field address, and the single sourced lot access
route.

---

## 5. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8. One confirmed
  fact was lost to it — the roof's operating interval — and the loss is recorded
  in both moduledocs, the guide prose and §1 above.
* **No vague proximity.** Every spatial claim is a street address, an interstate
  intersection with stated coordinates, a named trail's two endpoints, or a
  containment a verdict states.
* **No unsourced superlative.** Two ship, both inside confirmed verdict text:
  North America's only fan-shaped convertible roof, and the ballpark as one of
  the largest construction projects in Wisconsin history.
* **No trading claim for two of four places**, named with the reason in the
  guide prose and in an FAQ answer — with the brewery's operation and the
  public tour's operation kept carefully apart, because the verdict keeps them
  apart.
