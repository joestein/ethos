# Angel Stadium — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/angel_stadium_places.ex`
and `lib/ethos/seeds/angel_stadium_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Los Angeles Angels research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/los-angeles-angels.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates, not for every clause of the sentence the finder wrote around it. Only
`confirmed` verdicts ship — and, following the wave-1 and wave-2 precedent, a
clause the verifier's own text **expressly states was confirmed** is an
adjudication of that clause and ships too, whether that text is a verdict's
`item`, a `reason` naming what confirmed, or a correction naming what was
confirmed verbatim. A finder's refuted item never ships as written, and a
correction that merely asserts a replacement fact without stating that the
verifier checked it does not ship either.

**3 places and 1 guide shipped** from 3 researched places. **No place was
dropped.** One `getting_there` item is refuted and one is uncertain; neither
ships, in whole or in part.

---

## 0. The search-budget limit, stated first because it shapes the whole site

The artifact's own `search_budget_note` records that WebSearch reported its
call budget exhausted *on the very first query of the session*, before any
research began. Everything in the artifact was gathered by direct fetch of named
URLs, several of which (MLB.com's ballpark subpages) return HTTP 406 to a direct
fetch and had to be read through a proxy. No Anaheim or Orange County
business-licence or open-data portal could be reached as a discovery substitute
— `data.anaheim.net` does not resolve, `anaheim.opendatasoft.com` 404s, and
anaheim.net's own licence pages carry no search tool. Every listings service
attempted was blocked, CAPTCHA-walled or empty.

The verifier states the consequence: the surroundings content "is thinner than
the Getting There and history sections and reflects a search-access limitation,
not an absence of things to find." The guide says so in an FAQ answer rather
than padding around it. **Three places were researched and all three ship.**

---

## Identity, and the county

| Field | Value | Verdict |
|---|---|---|
| venue | Angel Stadium | *"MLB.com identifies the club as the Los Angeles Angels, AL West, venue 'Angel Stadium'."* — confirmed, cited to `https://www.mlb.com/angels`, refetched. A second confirmed verdict covers the encyclopedia infobox name, the December 29, 2003 announcement wording and the former names. |
| city | Anaheim | *"MLB.com ballpark page address: 2000 Gene Autry Way, Anaheim, CA 92806, labeled 'Angel Stadium'."* — confirmed. |
| state | California | as above |
| county | **Orange County** | *"Anaheim is a city in Orange County, California."* — confirmed, cited to `https://en.wikipedia.org/wiki/Anaheim,_California`. |

**The county citation was checked, per the standing ruling that it has been
miscited in every wave.** The verifier's own reason states the check
explicitly: *"Independently refetched … and obtained the identical sentence
naming Orange County. This is a genuine verification (the source states the
county by name), not a derivation from the city name."* The article's own
sentence is *"Anaheim, California is a city in northern Orange County,
California, United States"* — the cited source carries the word "county" and the
county's name. Anaheim is not an independent or consolidated city, so the
consolidated-city rendering used for San Francisco, Philadelphia and Denver does
not apply, and the ordinary `"<Name> County"` form ships.

**The venue name was taken from the verdict, not from recollection.** The
sponsorship-rename hazard is live in this artifact in a different form: the
ballpark carried two sponsor-era names before 2003 and the current name is the
club's own. The related trap is the *fuller* form, handled below.

### "Angel Stadium" or "Angel Stadium of Anaheim"

The confirmed verdict quotes the article's account of the December 29, 2003
announcement: the stadium "would be known as Angel Stadium (in full, Angel
Stadium of Anaheim)". The verifier's reason and the finder's fact agree that
these are one unchanged name and not a subsequent renaming.

The place record's `name` is **"Angel Stadium"**, which is the form MLB.com's
own ballpark and transportation pages use throughout and the form the identity
verdict names. The record and an FAQ answer both publish the open question,
because the artifact's `could_not_establish` names it exactly: which form is
"the more precise current formal name for publication purposes" could not be
established.

---

## 1. Places, against the verdicts they rest on

### angel-stadium-anaheim — Angel Stadium (`stadium`)

`2000 Gene Autry Way, Anaheim, California 92806` · `https://www.mlb.com/angels/ballpark`

Three confirmed place verdicts and six confirmed `history` items, all published:
the April 19, 1966 opening and the club's tenancy since; the December 2003
naming; the Rams' tenancy from 1980 to 1994; the nickname "The Big A"; the
February 6, 2025 lease extension through 2032; the address, reproduced
identically on refetch; the August 31, 1964 groundbreaking and the roughly $24
million construction cost; the Anaheim Stadium and Edison International Field of
Anaheim eras with their date ranges and the utility naming-rights deal; the $118
million renovation between the 1997 and 1998 seasons, the return to a
baseball-only facility, the outfield bleachers and the "California Spectacular";
and the franchise's five names from 1961 to the present, with the Disney
acquisition and the lease clause that produced two of them.

**One name inside a confirmed verdict is deliberately not published.** The
verdict on the renovation is confirmed, and its reason says the rock-and-water
feature's own proper name "was not repeated back verbatim in my fetch's summary
but the rock-and-water feature it names is confirmed." A verdict vouches for
what it restates; the verifier's reason expressly withholds that one clause. The
feature is described and the name is dropped, in the module and in the guide,
and the guide says a name exists and was withheld.

The address is expanded from the source's postal abbreviation (`CA`) to
`California` to match the corpus's address form. That is a rendering, not a
claim.

`status_verdict: confirmed`, on two independent sources — the encyclopedia's
record of a February 2025 lease extension through 2032, which is a dated
third-party act, and MLB.com's team page still naming the ballpark as the
Angels' home.

### honda-center-anaheim — Honda Center (`attraction`)

`2695 East Katella Avenue, Anaheim, California` · `official_url: nil`

Three confirmed verdicts, published in full: the June 17, 1993 opening with the
June 19, 1993 Barry Manilow concert as first event, the Anaheim Arena
construction name, the Ducks' tenancy, their June 6, 2007 Stanley Cup win over
Ottawa 6-2 and the 2003 Stanley Cup Final; the verbatim quote *"Honda Center
lies northeast across California State Route 57 from Angel Stadium"*; and the
NHL's own Ducks site naming Honda Center as the team's arena.

**The two opening dates are published as a disagreement rather than resolved.**
The verifier records that the source article's infobox and body contradict each
other, and that the finder's phrasing "accurately reflects both of the source's
own numbers rather than inventing one". The module and the guide say so.

**The spatial claim ships, and it is worth saying why it is not the banned
kind.** The corpus bans unmeasurable gestures — "next door", "across the street
from", "steps from". This one names a numbered state route and a compass
direction, which is exactly the checkable form the rule protects, and the
verifier calls it out as such: *"a sourced directional/road relationship (a
specific numbered route), not the banned vague-proximity phrasing."*

**`official_url` is `nil`.** A `could_not_establish` entry reads: *"Confirmation
of the venue's own official site (hondacenter.com) was not independently fetched
within this session's search budget."* Wave 2's Larimer Square precedent
applies — a URL neither pass confirmed is an unsourced claim in a field readers
treat as authoritative — and the record says so on its face.

**The address is published, and the reasoning is recorded because it is a
judgment.** No `found` item restates the street address. What does exist is the
verifier's own `could_not_establish`, which names as missing only the *"[z]ip
code for the Katella Avenue address"* and states that *"the address and
operating status above rest on Wikipedia and NHL.com."* That is the verifier
placing the street address inside the standing record and naming the one
component that is not, so the street address ships and the zip does not — and
the module states that no zip was found.

`status_verdict: confirmed`, on NHL.com being third-party relative to the arena.

### digalert-grove-of-anaheim — DigAlert Grove of Anaheim (`theater`)

`2200 East Katella Avenue, Anaheim, California` · `official_url: nil`

Two confirmed verdicts, published in full: the 1,700 capacity, the 1998 opening
as the awards-show-themed "Tinseltown", the succession of names through "The Sun
Theatre" and "The Grove of Anaheim", the January 24, 2011 City National Bank
deal at five years and $1.25 million, and the current name "DigAlert Grove of
Anaheim" as given in the article version dated August 4, 2026; and the verbatim
quote *"sits on the northwest corner of the parking lot of Angel Stadium of
Anaheim"*, which the verifier likewise calls a sourced, specific spatial
description rather than vague proximity.

**The name comes from the verdict and the slug follows the name.** This is the
sponsorship-rename hazard in its sharpest form in this artifact: the venue is
still widely called the City National Grove of Anaheim, and recollection would
"correct" the current name back. The verdict establishes DigAlert, so DigAlert
is what ships — with its own limit published beside it, since the verifier
records that no independent, non-encyclopedia confirmation of the current name
was reachable and that the finder disclosed the same limitation.

**`official_url` is `nil`**, on a `could_not_establish` naming it: no working
official site could be located, and the domain the finder tried does not resolve.

The address ships on the same reasoning as Honda Center's: the only
`could_not_establish` touching it names the zip code alone.

**`status_verdict: uncertain`, and no trading claim is made.** The verifier's
reason is the governing text: *"This is squarely the 'absence of evidence is not
evidence of closure' case … Correctly left as uncertain, not open and not
closed; the identity (name, address, what it is) is confirmed and stands on its
own regardless of trading status."* Uncertain trading does not block
publication; uncertain identity would, and the identity here is confirmed.

---

## 2. The guide

`slug: angel-stadium-guide` · `destination: "Anaheim, California"` ·
`state: "California"` · `county: "Orange County"`

### Getting there

Five of the seven `getting_there` items are confirmed and all five ship: the
address; the parking rates; ARTIC at 2626 East Katella Avenue in the Platinum
Triangle with the Pacific Surfliner and the Orange County Line and the Douglass
Road underpass quote; Metrolink's own station page listing the Orange County
Line and nothing else; and the OCTA absence-of-confirmation item, which is
published *as* an absence — the seven route numbers are named as serving Anaheim
generally, with the source's own statement that none is tied to the ballpark.

**Not published, and each for its own reason:**

* **The freeway routes (`uncertain`).** The cited page carried no freeway detail
  on re-fetch; a likely subpage gave a different route set; and one designation
  the finder wrote, "I-91", is not a valid route number at all. Nothing in the
  verifier's reason authorises any clause of it, so nothing ships.
* **One clause of the parking-entrances item (`refuted`), and only that
  clause.** The verifier's reason states that "[t]he entrances, the
  oversized-vehicle and Express Entry Lane details, and the existence of a free
  Lexus Lot all confirm", and refutes the item because the finder widened "the
  first 100 Lexus vehicles" to "the first 100 vehicles". The clauses the
  verifier states were confirmed are published; the widened clause is not, and
  the correction's narrower form — the perk restricted to Lexus vehicles — is
  published in its place. The Lexus Lot's position relative to the Home Plate
  Gate is **not** published: the verifier's reason confirms the lot's existence
  and says nothing about where it sits.
* **The lot's opening time relative to first pitch (`confirmed`).** Dropped for
  the duration ban, following the wave-1 and wave-2 precedent: the ban scans
  module source, its allowlist is keyed on `{file, phrase}` over a whole module
  and cannot be narrowed, and a pardon there would pardon every duration-shaped
  string in the file including one added later. The clause goes; the rates
  beside it ship in full. Because the ban scans source, neither moduledoc can
  quote the dropped clause, so both describe it — the same side effect wave 1
  recorded.

**No station or lot becomes a place record.** ARTIC is prose.

### Around the ballpark

Every address is a place record's own published address. Both spatial
relationships are verbatim from confirmed verdicts and both name a checkable
feature — a numbered state route, a named corner of a named lot.

**Not published:** any spatial relationship among the three places that no
verdict states, and no trading claim for the Grove.

### The ballpark and the team

Restates the six confirmed `history` items — four `about: "ballpark"`, two
`about: "team"` — plus the naming and lease verdicts.

### FAQ

Five questions. Four of them state a limit: the unresolved formal-name
question, the unestablished bus route, the Grove's unestablished trading
status, and the search-budget limit behind the site's size.

---

## 3. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8. One confirmed
  clause was lost to it — how long before first pitch the parking lot opens.
* **No vague proximity.** Two spatial claims ship, both verbatim from confirmed
  verdicts and both checkable: "northeast across California State Route 57 from
  Angel Stadium", and "the northwest corner of the parking lot of Angel Stadium
  of Anaheim".
* **No superlative, ranking or award.** None appears in any confirmed verdict in
  this artifact, and none is published.
* **No official URL for Honda Center or for the Grove**, because neither was
  confirmed — one was never fetched, the other could not be located.
* **No zip code for either Katella Avenue address**, because the verifier names
  both as unestablished.
* **No trading claim for the Grove**, with the reason named in the module, in
  the guide prose and in an FAQ answer.
* **No name for the rock-and-water feature** behind the left-center-field fence,
  because the verifier's own reason withholds that clause while confirming the
  feature.
* **Nothing from the uncertain freeway item**, whose reason states in terms
  that the verifier "could not establish the artifact's specific route list on
  the cited page" — the case where a reason authorises nothing.
* **Nothing the refuted parking item added beyond what the verifier's reason
  states was confirmed** — in particular, no perk for vehicles generally.
