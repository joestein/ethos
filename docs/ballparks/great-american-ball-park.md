# Great American Ball Park — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for
`lib/ethos/seeds/great_american_ball_park_places.ex` and
`lib/ethos/seeds/great_american_ball_park_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Cincinnati Reds research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/cincinnati-reds.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates, not for every clause of the sentence the finder wrote around it.

**10 places and 1 guide shipped** from 10 researched places.

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| venue | Great American Ball Park | *"Great American Ball Park is the home of Major League Baseball's Cincinnati Reds."* — confirmed |
| city | Cincinnati | *"The ballpark's address is 100 Joe Nuxhall Way, Cincinnati, Ohio."* — confirmed |
| state | Ohio | as above |
| county | **Hamilton County** | *"Cincinnati is the most populous city in Hamilton County, Ohio, and its county seat."* — confirmed, `en.wikipedia.org/wiki/Cincinnati`. A second confirmed verdict corroborates through the Hamilton County Auditor's office as the county property authority covering Cincinnati addresses. |

The county citation was checked against the dispatch's warning. Here the
finder's own source is the Cincinnati article, which does carry the county —
unlike Pittsburgh, where the cited article carried nothing.

---

## 1. Two names recollection gets wrong

Both are sponsorship-era renames, and both were taken from the verdict rather
than corrected back.

**The streetcar is the Connector.** The finder wrote "Cincinnati Bell
Connector" in two items and both were **refuted on the name alone**: *"The
streetcar was known as the Cincinnati Bell Connector until 2022, when the system
gained its current name after the rebranding of Cincinnati Bell to Altafiber."*
The verifier's note is worth keeping: *"This is exactly the class of stale
sponsorship name the identity check is meant to catch, and it recurs through
every getting_there item that names the streetcar. The 3.6-mile loop and the
stop list are otherwise correct."* Each correction supplies the same sentence
with the right name, and that corrected sentence is what ships.

**The brewpub is the Cincinnati Lager House.** Confirmed: *"This business is
currently named 'Cincinnati Lager House' in The Banks' 2026 directory and tenant
page, though its page URL still carries the older name 'moerlein-lager-house.'
It was previously known as Christian Moerlein Lager House / Moerlein Lager
House."* The name decides the slug, so the record is `cincinnati-lager-house`
and not `moerlein-lager-house`, even though the `official_url` still resolves
through the old path — which is stated in the summary rather than hidden.

---

## 2. Places, against the verdicts they rest on

### great-american-ball-park — Great American Ball Park (`stadium`)

`100 Joe Nuxhall Way, Cincinnati, OH` · `https://www.mlb.com/reds/ballpark`

Five confirmed place verdicts and three confirmed `history` items, all
published: home of the Reds, opened March 31, 2003 on the site adjacent to the
former Riverfront Stadium; built by HOK Sport (now Populous) and GBBN at
approximately $290 million; capacity 43,500 as of 2021; 850 parking spaces;
Crosley Terrace and its four bronzes of Joe Nuxhall, Ernie Lombardi, Ted
Kluszewski and Frank Robinson; and Riverfront Stadium, later Cinergy Field,
shared with the Bengals before the two clubs sought separate venues.

`status_verdict: confirmed`, and the verifier's reason is worth recording: the
finder's cited MLB.com page returned HTTP 406 to the verifier too, and the
status was confirmed instead on ESPN's Reds schedule page, *"an independent,
non-Wikipedia, non-MLB source"*, listing current-season home-game ticket links.

**Not published:** any parking price (see the guide).

### cincinnati-reds-hall-of-fame-and-museum — Cincinnati Reds Hall of Fame and Museum (`museum`)

`Main Street, Cincinnati, OH` · `official_url: nil`

Two confirmed verdicts, both published: opened September 25, 2004, on Main
Street next to Great American Ball Park; more than 15,000 square feet of exhibit
space on two floors, the 1975, 1976 and 1990 World Series trophies, the 1869
Cincinnati Red Stockings scorebook, and Johnny Bench's and Joe Morgan's MVP
trophies.

**The identity call.** `could_not_establish` names the exact street address and
the current hours. Under the identity rule, a place whose address is
unestablished does not ship — so this record was weighed explicitly rather than
waved through. What is unestablished here is the **street number**, not the
address: a confirmed verdict places the museum on Main Street next to the
ballpark, which is positive direct evidence at street level, and the name is
fully established with an entire confirmed paragraph of content behind it. That
is the Bleacher Bar situation (two street numbers, both sourced) rather than the
Mill Street Pier one (address *"could not be established"*, nothing left to
publish). The record carries `address: "Main Street, Cincinnati, OH"` and says in
the summary that the number is unknown; the guide and an FAQ answer say the same.

The artifact's own `address` field carries the explanation inline — *"Main
Street, Cincinnati, OH (adjoining Great American Ball Park; exact street number
not established)"* — and a parenthetical explanation is not a postal address, so
it does not go in the `address` field. Same treatment the Citgo sign's "(Kenmore
Square)" got in wave 1.

`status_verdict: confirmed`, upgraded by the verifier on the museum's own
Wikipedia article ("is open year-round") and a 2025-dated event photo caption.

### national-underground-railroad-freedom-center — National Underground Railroad Freedom Center (`museum`)

`50 E. Freedom Way, Cincinnati, OH 45202`

Four confirmed verdicts, all published in full. `status_verdict: confirmed`,
re-fetched from The Banks' directory by the verifier; the reason records the
reading that makes it admissible — *"the landlord's directory is third-party
evidence for a tenant/co-located attraction under the authoring contract's
precise reading of the self-reporting rule."*

### smale-riverfront-park — Smale Riverfront Park (`park`)

`Along the Ohio River between Broadway and Central Avenue, Cincinnati, OH`

Verdict #0 is **`uncertain`** and carries no `correction`, but its reason names
the split precisely: *"The acreage and river-boundary clause are confirmed
verbatim ('over 40 acres') on re-fetch. The 'Phase I opened in spring 2011'
clause is not."* The article's only nearby date reads "summer of 2011" and is
tied to The Banks development rather than to the park.

**Published:** over 40 acres, between Broadway and Central Avenue.
**Not published:** any opening season or phase date.

The other four verdicts are confirmed and published in full: the feature list;
the Riverfront Stadium home-plate marker; the Bicentennial Commons / Sawyer
Point link forming an almost 3-mile corridor; and the Banks directory listing.

### findlay-market — Findlay Market (`historic-site`)

`1801 Race Street, Cincinnati, OH 45202` · `https://www.findlaymarket.org/`

Four confirmed verdicts published in full, including two superlatives that sit
inside confirmed verdict text and therefore ship: *"Ohio's oldest continuously
operated public market"* and *"the last remaining of nine public markets that
once served Cincinnati"*.

The streetcar verdict here is **refuted on the name** and ships through its
correction, with "Connector" and the 2022 rebrand noted.

`status_verdict: confirmed`, upgraded on Wikipedia's independent statement that
the market is open year-round Tuesday through Sunday. But
`could_not_establish` names the hours as sourced only to the market's own site,
so the record attributes them to the market and says no independent 2026
confirmation was reached.

### cincinnati-lager-house — Cincinnati Lager House (`brewery`)

`115 Joe Nuxhall Way, Cincinnati, OH 45202`

Four confirmed verdicts, all published: the current name and the URL that still
carries the old one; the working microbrewery and the full line of Moerlein
craft beers; the February 2012 opening as the Christian Moerlein Lager House,
15,000 square feet over two floors with beer gardens seating about 500 indoors
and 600 outdoors; and the 1853 founding in Over-the-Rhine, the growth into one
of the country's ten largest breweries, the 1919 Prohibition closure, the 1981
brand revival and the 2004 relaunch.

Two of those four carry a **citation-only correction** — the cited
`…_Brewing_Company` URL 404s and the fact belongs to
`en.wikipedia.org/wiki/Christian_Moerlein_Brewing_Co.` The fact text is
unchanged; the source is the corrected one.

**Not published:** the surname "Hardman" that opens the 2012 item. No verdict in
this artifact establishes who that is, and a bare surname with no antecedent is
not publishable prose. Dropping a clause is always available; adding a first
name would not have been.

`could_not_establish`: the exact date of the rename — stated in the summary.

### holy-grail-banks-cincinnati — Holy Grail (`restaurant`)

`161 Joe Nuxhall Way, Cincinnati, OH 45202`

One confirmed verdict, published in full: a sports bar at The Banks with 31
hi-def TVs, pub fare and outdoor patios.

`status_verdict: confirmed` on the landlord's directory, with the tenant page's
hours (Monday to Sunday, 11am to 2:30am) as corroboration.
`could_not_establish` names the absence of confirmation independent of the
landlord and the absence of a founding date, and the record states both. What
the record does **not** do is assert trading in its own voice; it reports the
directory listing and the published hours, which is exactly what the evidence
is.

### taste-of-belgium-banks — Taste of Belgium (`restaurant`)

`16 W. Freedom Way, Cincinnati, OH 45202`

Two confirmed verdicts, published. The second is itself an attribution — *"The
Banks' tenant page states the restaurant was featured on Food Network's Diners,
Drive-Ins and Dives and received a 'Best Brunch 2016' award from CityBeat
Magazine"* — and it is published as an attribution, because
`could_not_establish` records that neither claim was confirmed at Food Network
or CityBeat directly. An award reported by the landlord is a fact about the
landlord's page; the record says so.

### heritage-bank-center — Heritage Bank Center (`attraction`)

`100 Broadway Street, Cincinnati, OH`

Three confirmed verdicts, published: the September 9, 1975 opening and the
downtown location next to the ballpark; 17,556 seats and 346,100 square feet as
the largest indoor arena in the Greater Cincinnati region; the Cincinnati
Cyclones of the ECHL as home tenant, with college basketball, concerts,
wrestling, MMA and figure skating. The first verdict's correction — *"Optionally
note the full chain: Riverfront Coliseum, The Crown, Firstar Center, U.S. Bank
Arena, Heritage Bank Center"* — is taken up, so all five names appear.

**Verdict #3 is refuted, and it is the Baltimore failure class again.** The
finder claimed the arena appears in The Banks' directory. The verifier
re-fetched that page and searched for "Heritage Bank Center", "Heritage Bank",
"arena" and "Cyclones": *"none appear anywhere on the page … This is the
finder's own cited source failing to support its own claim, the pattern the task
explicitly warns to check hardest for."* The claim is removed. The correction
names what is confirmed instead — the Connector's article lists the arena among
the venues The Banks station serves — and that is what the guide's transit prose
carries. An FAQ answer states the whole episode.

`status_verdict: confirmed` on the Wikipedia evidence alone, explicitly *"not
on the wrong directory citation"*.

### john-a-roebling-suspension-bridge — John A. Roebling Suspension Bridge (`historic-site`)

`Spans the Ohio River between Cincinnati, OH and Covington, KY`

Three confirmed verdicts, all published in full, including the source's own
superlative: at its January 1, 1867 opening it was the longest suspension bridge
in the world, at a 1,057-foot main span.

The record's `town`/`state`/`county` are Cincinnati / Ohio / Hamilton County —
the Ohio end, which is the end this guide's destination hub covers and the one
the artifact's address names first. The Kentucky end is named in the `address`
and in the summary so no reader is misled about what the bridge crosses.

---

## 3. The guide

`slug: great-american-ball-park-guide` · `destination: "Cincinnati, Ohio"` ·
`state: "Ohio"` · `county: "Hamilton County"`

### Getting there

Six `getting_there` items: five confirmed, one refuted on the streetcar's name
and shipped through its correction. Published: the Connector's 3.6-mile loop and
its stops; The Banks (2nd & Main) as southern terminus, its Riverfront Transit
Center connection and the venues it serves; 4th & Main to Government Square;
fare-free operation since November 1, 2020 after a council override of a mayoral
veto; Metro (SORTA), TANK and Red Bike; and the ballpark's 850 parking spaces.

**No station, transit centre or bus system becomes a place record.**

**Not published: a parking price.** `could_not_establish` on the ballpark
records that MLB.com's own ballpark and transportation subpages returned HTTP
406 to automated fetch and could not be read for a cost.

### Around the ballpark

Every address is a place record's own published address. The two gaps — the
museum's street number, and the Food Network / CityBeat claims resting on the
landlord's page — are stated where the reader meets the place.

**Not published:** any spatial relationship no verdict states. What ships is
checkable: "on Main Street next to Great American Ball Park", "between Broadway
and Central Avenue", "in the Over-the-Rhine neighborhood north of downtown",
"at The Banks" — each a verdict's own wording.

### The ballpark and the team

Restates the four confirmed `history` items with `about: "ballpark"` and the two
with `about: "team"`: the 1881 establishment, the 1882 American Association
charter membership, the 1890 move to the National League, and the five World
Series titles of 1919, 1940, 1975, 1976 and 1990.

### FAQ

Six questions. Three state what could not be established — the parking cost, the
museum's street number, the rename date — and one records the refuted directory
citation in full, because a reader who checks the directory and finds nothing
should be able to see that the research checked too.

---

## 4. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8. Nothing was
  lost to that rule here: no confirmed verdict in this artifact states a travel
  time. The 3.6-mile loop and the almost 3-mile park corridor are distances.
* **No vague proximity.** Every spatial claim is a street, a pair of bounding
  streets, a named neighborhood, a named development or a bordering
  relationship a verdict states.
* **No unsourced superlative.** Four ship, all inside confirmed verdict text:
  Ohio's oldest continuously operated public market; the last remaining of nine
  Cincinnati public markets; the largest indoor arena in the Greater Cincinnati
  region; and the longest suspension bridge in the world as of 1867.
* **No claim of a directory listing that is not there**, and the refuted one is
  named rather than quietly dropped.
