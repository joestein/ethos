# Coors Field — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/coors_field_places.ex`
and `lib/ethos/seeds/coors_field_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Colorado Rockies research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/colorado-rockies.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates, not for every clause of the sentence the finder wrote around it.

**6 places and 1 guide shipped** from 6 researched places. **No verdict in this
artifact is refuted.** The verifier flags that on principle and then explains
it: the finder stuck almost entirely to well-established, cross-checkable
encyclopedia facts and avoided the failure modes — superlatives, trip durations,
vague proximity, self-sourced awards — that produced refutations on other
batches, and *"[t]he two places most exposed to self-sourcing (Wynkoop, McGregor
Square) were correctly left uncertain by the finder rather than laundered as
confirmed."*

---

## Identity, and the county form

| Field | Value | Verdict |
|---|---|---|
| venue | Coors Field | *"The ballpark's current name is Coors Field, at 2001 Blake Street, Denver, Colorado; it opened April 26, 1995."* — confirmed, cited to ESPN. A second confirmed verdict adds the naming rights in perpetuity from 1991 and the 2017 lease running the name to at least 2047. |
| city | Denver | as above |
| state | Colorado | as above |
| county | **Denver** | *"Denver is a consolidated city-county named 'City and County of Denver,' established December 1, 1902, and the only U.S. state capital that is a consolidated city-county."* — confirmed, cited to `en.wikipedia.org/wiki/Denver`, the article that carries it. |

**The county field ships `"Denver"`, not `"City and County of Denver"`, and the
reasoning is set out here because it is a judgment rather than a transcription.**

The verdict establishes two things: that the jurisdiction covering this address
is a consolidated city-county, and that its formal legal name is "City and
County of Denver". The `county` field in this corpus is not a legal-name field —
it is the field that derives `/destinations/{state}/{county}` and groups the
destination hubs. This corpus's established rendering for a consolidated
city-county is the bare city name:

* **San Francisco**, wave 1, shipped `county: "San Francisco"`. Its formal name
  is likewise "City and County of San Francisco".
* **St. Louis**, wave 1, shipped `county: "St. Louis"` — an independent city.
* **Baltimore City**, wave 1, kept its suffix, and the reason is
  disambiguation: a separate Baltimore County exists. No separate Denver County
  exists.
* **Philadelphia**, this wave, ships `county: "Philadelphia"` on an explicit
  verdict correction naming *"the independent-city convention already used
  elsewhere in this corpus (St. Louis, Baltimore)"*.

Shipping `city-and-county-of-denver` as a hub slug beside `san-francisco` and
`st-louis` would render one jurisdiction class two ways. The value here is the
verdict's jurisdiction rendered in the corpus's form, and the guide's moduledoc
states that at the point of use so nobody later reads it as a transcription
error.

A fifth confirmed identity verdict is the source for the neighborhood framing:
Coors Field sits in Denver's Lower Downtown, *"described by MLB's own site as
the 'Ballpark Neighborhood,' with the ballpark's main entrance at 20th and Blake
Streets."*

---

## 1. The gate exemption this ballpark required

`test/ethos/seeds/ballpark_seed_data_test.exs` fails any ballpark place whose
**name** matches `station|parking|garage|bus route|lot`. The record
`tattered-cover-union-station`, named "Tattered Cover — Union Station", matches
on "Station".

**A second slug-keyed exemption was added**, alongside wave 1's
`st-louis-union-station`. The bar the list sets is that the place is not transit
infrastructure, and a bookstore is not: confirmed verdicts establish the chain's
1971 Cherry Creek founding, its growth into one of the largest independent
bookstores in the United States, its October 2023 Chapter 11 filing, its July
2024 acquisition by Barnes & Noble, and its own store locator's listing of a
branch at 1701 Wynkoop Street inside the Union Station building alongside the
Crawford Hotel. "Union Station" is the branch's location qualifier.

**Renaming the record to dodge the pattern was considered and rejected.** The
verdict names the branch by its location; a name chosen to satisfy a regex is a
worse artifact than a pardon with guards. The exemption is keyed on the exact
slug, and the file's two existing guard assertions apply to it unchanged: the
list must name a slug some ballpark place actually has, and the pattern must
still fire on the pardoned name, so a stale pardon fails loudly.

**Denver Union Station itself mints no record** and is prose in "Getting there",
described by the RTD lines that call there — which is the rule working rather
than being bent.

---

## 2. Places, against the verdicts they rest on

### coors-field — Coors Field (`stadium`)

`2001 Blake Street, Denver, Colorado 80205` · `https://www.mlb.com/rockies/ballpark`

One confirmed place verdict, three confirmed identity verdicts and six confirmed
`history` items, all published: the address, the LoDo location, the April 26,
1995 opening and the 20th-and-Blake main entrance; the $300 million cost and the
1993-1994 seasons at Mile High Stadium; the 63 luxury suites, 4,526 club seats
and capacity of 46,897 or 50,144 with standing room as of 2018; the dinosaur
fossils, the "Jurassic Park" name that was considered and the triceratops mascot
Dinger; the 5,200-foot elevation, the semi-arid climate, the humidor, the
unusually distant outfield fences giving Coors Field the largest outfield in MLB
and the row of purple seats at the one-mile mark; the hand-laid brick facade,
the clock tower, the field 21 feet below street level as a deliberate choice to
limit visual impact, the standing as the first baseball-only National League
stadium since Dodger Stadium in 1962 and the October 16, 1992 construction
start; "The Rockpile" and its roughly 2,300 seats; the 59-by-116.5-foot video
display installed before the 2018 season; the naming rights bought in perpetuity
in 1991 within a $30 million investment and the 2017 lease running the name to at
least 2047; and the unchanged team name since 1993 with Richard and Charles
Monfort as principal owners.

The superlative — the largest outfield in Major League Baseball — sits inside
confirmed verdict text and therefore ships. So does the architectural detail,
for the same reason.

`status_verdict: confirmed`, and the verifier calls its basis *"the strongest
form of open-today evidence available for any place in this batch"*: a live
fetch of ESPN's 2026 Rockies schedule showing an August 31, 2026 home game
against Baltimore at Coors Field — dated, third-party and current.

### oxford-hotel-denver — The Oxford Hotel (`hotel`)

`1612 17th Street, Denver, Colorado` · `https://www.theoxfordhotel.com/`

Two confirmed verdicts, published in full: the 1891 build to Frank Edbrooke's
design, the NRHP listing of April 17, 1979 and the Colorado State Register
listing; and the Cruise Room — windowless, Art Deco, modeled after an ocean
liner lounge from the RMS Queen Mary, with bas-relief panels depicting toasts
from different cultures, opened the day after Prohibition ended and restored in
2012 with historically accurate finishes.

**`status_verdict: uncertain`**, and the verifier records having *tried* to
resolve it: a visitdenver.com listing for the Cruise Room 404'd, TripAdvisor
returned 403. `could_not_establish` names the gap. No trading claim.

### wynkoop-brewing-company — Wynkoop Brewing Company (`brewery`)

`1634 18th Street, Denver, Colorado 80202` · `https://www.wynkoop.com/`

Two confirmed verdicts, published in full: the 1988 founding by, among others,
the future Colorado governor John Hickenlooper, and the LoDo article's
description of it as one of the historic district's notable historic businesses;
and the brewery's own account of its basement brewery, its burgers and brunch
fare and its Rocky Mountain Oyster Stout.

**`status_verdict` upgraded from uncertain to confirmed**, and the mechanism is
worth recording:

> Upgraded from the finder's uncertain call on evidence the finder did not cite
> for this purpose: Wikipedia's LoDo article, fetched independently, states in
> the present tense that Wynkoop 'remains a notable establishment in the
> neighborhood' — a third-party, non-self source affirmatively describing
> continued operation, not merely absence of a closure notice. This is exactly
> the kind of upgrade this project's methodology anticipates a verifier making
> on evidence the finder had access to but did not apply to the trading-status
> question.

The record publishes that clause as the encyclopedia's, and the guide's closing
paragraph names Wynkoop among the three places with independent evidence of
operation.

### larimer-square-denver — Larimer Square (`historic-site`)

`1400 block of Larimer Street, Denver, Colorado` · `official_url: nil`

Two confirmed verdicts, published in full: the 1971 designation as Denver's
first officially designated historic district, the NRHP listing of May 7, 1973,
and the 1870s-1890s buildings in the Victorian commercial style typical of
western boomtowns; and Dana Hudkins Crawford's preservation campaign from the
1960s through adaptive reuse rather than demolition, with the district today a
mixed-use area of restaurants, retail, offices and entertainment venues.

`official_url` is `nil`, and the record says why: `could_not_establish` reads
*"An official website for the district as a whole — none was found; it is a
multi-tenant historic streetscape rather than a single operator."* The verifier
notes separately that *"a live official-looking site for the district was found
and was not in the finder's citations"* — **"official-looking" is not
established, so no URL is published.** A URL neither pass confirmed as official
would be an unsourced claim in a field readers treat as authoritative.

`status_verdict: confirmed`, on the encyclopedia's description of ongoing
mixed-use operation.

### mcgregor-square-denver — McGregor Square (`attraction`)

`1901 Wazee Street, Denver, Colorado 80202` · `https://mcgregorsquare.com/`

Two confirmed verdicts, published in full: the full-block mixed-use district in
LoDo with residential, hotel, office and commercial components around a
17,000-square-foot plaza with a 66-foot LED screen, named for the former Rockies
president Keli McGregor; and The Rally Hotel plus the 13-story McGregor Square
Residences with 103 condos.

**`status_verdict: uncertain`**, and again the verifier records the attempt:
*"This verifier tried the independent route the finder didn't record trying — a
Wikipedia article — and it does not exist (404). No other independent
corroboration was found."* `could_not_establish` also names the missing opening
date, and the record states it. No trading claim.

### tattered-cover-union-station — Tattered Cover — Union Station (`shop`)

`1701 Wynkoop Street, Denver, Colorado` · `https://www.tatteredcover.com/`

Two confirmed verdicts, published in full: the 1971 Cherry Creek founding, the
growth into one of the largest independent bookstores in the United States, the
July 2024 Barnes & Noble acquisition following the October 2023 Chapter 11
filing; and the company's own store locator listing the Union Station branch at
1701 Wynkoop Street, inside the Union Station building alongside the Crawford
Hotel, as one of four currently operating stores.

The superlative ships because it sits inside confirmed verdict text.

**`status_verdict: uncertain`, with a specific open question that is published
rather than resolved:**

> Wikipedia's account of the October 2023 bankruptcy states plainly that 'three
> stores would close' in that filing, and neither Wikipedia nor any other
> independent source this verifier could reach names which three. It is
> therefore not established, one way or the other, whether Union Station was
> among the closures that preceded the 2024 acquisition — the store locator's
> current listing is consistent with survival but is self-sourced and cannot
> settle it.

The record and an FAQ answer both state the question in those terms. This is the
sharpest case in the wave of "uncertain trading does not block publication, but
you may not write that it is open": the identity is fully established — name,
street address, building, and the chain's own listing — so there is something to
publish, and what is published stops exactly where the evidence does.

---

## 3. The guide

`slug: coors-field-guide` · `destination: "Denver, Colorado"` ·
`state: "Colorado"` · `county: "Denver"`

### Getting there

All four `getting_there` verdicts are confirmed and all four ship: Denver Union
Station at 1701 Wynkoop Street served by RTD's A Line and light rail lines B, C,
E, G, N and W; the ballpark page's statement that RTD light rail and local and
regional bus routes serve it, with the RTD contact details, **and its own
statement that it names no specific bus route numbers**; the four parking
purchase channels with the absent price and the 404'd parking page; and the
bicycle parking near Gate E, at Gate A and across from Gate B at 22nd and Blake
Streets.

One correction on the last of those is bookkeeping rather than content: the
bicycle-parking item was tagged `"mode": "bus"` and should have been `"bike"` or
`"parking"`. That affects the artifact's schema, not any published sentence.

**Not published: a parking price**, or any bus route number. Both absences are
what the verdicts state, and the guide says so in both places.

**No station or lot becomes a place record**, with the one slug-keyed exemption
in §1.

### Around the ballpark

Every address is a place record's own published address. The neighborhood
paragraph rests on the confirmed LoDo `history` item: the 1858 founding by
General William Larimer, the roughly 20% of buildings demolished in the 1960s
and 1970s, the March 1988 zoning ordinance protecting 127 contributing historic
structures, and Coors Field (1995) and Ball Arena (1999) anchoring a district
that today holds more than 70 bars and restaurants.

**Not published:** any spatial relationship among these six places that no
verdict states. What ships is a street address, a block designation, a
neighborhood, or a containment a verdict states ("inside the Union Station
building alongside the Crawford Hotel").

### The ballpark and the team

Restates the six confirmed `history` items with `about: "ballpark"` plus the
naming-rights and team-name identity verdicts.

### FAQ

Six questions. Three state a limit: the absent parking price and bus numbers,
the unresolved question about which three Tattered Cover stores closed, and the
three-of-six division on confirmed operation.

---

## 4. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8. Nothing was lost
  to it here; no confirmed verdict in this artifact states one.
* **No vague proximity.** Every spatial claim is a street address, a block, a
  named neighborhood, a gate, or a building a verdict places the record inside.
* **No unsourced superlative.** Three ship, all inside confirmed verdict text:
  the largest outfield in Major League Baseball, Denver as the only U.S. state
  capital that is a consolidated city-county, and Tattered Cover as one of the
  largest independent bookstores in the United States.
* **No official URL for Larimer Square**, because none was confirmed as official
  — only one was described as official-looking, which is not the same thing.
* **No trading claim for three of six places**, named with the reason in the
  guide prose and in an FAQ answer, and with the reasons kept specific: a 404'd
  corroborator for the hotel, a non-existent article for McGregor Square, and an
  unnamed set of three bankruptcy closures for the bookstore.
