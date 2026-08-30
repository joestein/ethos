# Progressive Field — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for
`lib/ethos/seeds/progressive_field_places.ex` and
`lib/ethos/seeds/progressive_field_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Cleveland Guardians research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/cleveland-guardians.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates, not for every clause of the sentence the finder wrote around it.

**8 places and 1 guide shipped** from 8 researched places.

---

## The verifier's own note, and why it is recorded here

One item in this artifact was refuted. The verifier's note explains the rate and
warns against reading it as licence:

> This is a near-perfect confirmation rate and it is not typical of this kind of
> review: the finder here worked entirely from Wikipedia and directly-fetched
> primary/business sources rather than from summarized or secondhand material,
> cited narrowly (one fact per source-visit rather than bundling), and used
> qualifying language ('could_not_establish', 'uncertain') exactly where
> evidence ran out rather than rounding up. The one miss — reading 'best since
> the 1909 Pirates' as 'best… at the time' — is exactly the kind of accretion
> error the checkpoint programme was built to catch, and it surviving in an
> otherwise disciplined artifact is the reason to keep checking rather than to
> treat a high hit rate as license to sample less next time.

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| venue | Progressive Field | *"Progressive Field is the current official name… naming rights transferred to Progressive Corporation in 2008… extended April 3, 2024 through at least 2036, option to 2041."* — confirmed |
| city | Cleveland | *"The Cleveland Guardians play at Progressive Field, 2401 Ontario Street, Cleveland, Ohio, Cuyahoga County."* — confirmed |
| state | Ohio | as above |
| county | **Cuyahoga County** | the same verdict, plus *"Cleveland is the county seat and most populous city of Cuyahoga County, Ohio"* — confirmed, cited to `en.wikipedia.org/wiki/Cuyahoga_County,_Ohio`, which is the article that carries it. |

The county citation was checked against the dispatch's warning: unlike
Pittsburgh, the cited source here is the county's own article and does carry the
fact. A third confirmed verdict corroborates the jurisdiction from another
angle — the Gateway complex is *"owned by the City of Cleveland and Cuyahoga
County, managed by the Gateway Economic Development Corporation"*.

---

## 1. The one refutation

**The 1954 team's record.** The finder wrote: *"Its 1954 team set a 111-43
regular-season record, at the time the best in Major League Baseball history."*
Refuted, with the reason:

> The clause 'at the time the best in Major League Baseball history' is
> contradicted by the very source cited: the article states the 1954 record
> 'remains the best Major League Baseball regular season record since the 1909
> Pirates' — meaning the 1909 Pittsburgh Pirates already held a superior record
> 45 years earlier, so the 1954 mark was never the best in MLB history, at the
> time or since. This is a superlative that grew between the source and the
> sentence, the exact class of error this review is built to catch.

The correction's wording is what ships: *"remains the best Major League Baseball
regular-season record since the 1909 Pittsburgh Pirates."* The rest of the
item — both championships, the four non-winning World Series appearances, the
1947-1956 run — stands confirmed and is published. An FAQ answer states the
whole episode.

---

## 2. Places, against the verdicts they rest on

### progressive-field — Progressive Field (`stadium`)

`2401 Ontario Street, Cleveland, OH 44115` ·
`official_url: https://www.mlb.com/guardians/ballpark`

Three confirmed place verdicts plus five confirmed `history` items, all
published: the address, the April 4, 1994 opening as Jacobs Field, the 2008
rename and the April 2024 extension through at least 2036 with an option to
2041; Populous (then HOK Sport) as designer, the 34,820 capacity as of 2025 and
the smallest-MLB-stadium ranking, the "Little Green Monster", the 19 light
towers 200 feet above street level and the 59-by-221-foot Daktronics scoreboard;
the independent directory's matching address; the $175 million cost, Richard E.
Jacobs' $91 million and the 15-year "sin tax" approved by 51% in May 1990; the
retro-modern description following Camden Yards; Heritage Park's 27 plaques and
38 bricks; and the 2014-2016, 2016, 2017 and 2023-2025 renovation phases.

The capacity superlative and the architectural characterisation both sit inside
confirmed verdict text and therefore ship.

`status_verdict: confirmed`, and the reason records that it does **not** rest on
the club's own page: Wikipedia's 2024 extension through 2036 is the independent
evidence, with MLB.com's live page as corroboration.

**Not published:** any parking price. `could_not_establish` records that
`/directions` and `/transportation` both returned HTTP 406.

### rock-and-roll-hall-of-fame — Rock and Roll Hall of Fame (`museum`)

`1100 Rock and Roll Boulevard, Cleveland, OH 44114` · `https://www.rockhall.com/`

Two confirmed verdicts, published in full: the address at East 9th Street and
Lake Erie, the September 1, 1995 dedication, the April 20, 1983 founding
foundation, the 1986 choice of Cleveland and the Alan Freed / Moondog
Coronation Ball reason; I. M. Pei's design, the 162-foot tower, the
dual-triangular glass tent and about 55,000 square feet of exhibition space
across seven levels.

`status_verdict: confirmed` on induction ceremonies scheduled through 2026 —
dated, independent, current evidence.

**`could_not_establish`: any sourced distance or bordering relationship between
the museum and Progressive Field.** Both are downtown landmarks and no source
fetched states one, so **none is published**. This is why the guide's museum
paragraph gives street addresses and no relationship to the ballpark.

### great-lakes-science-center — Great Lakes Science Center (`museum`)

`601 Erieside Avenue, Cleveland, OH 44114` · `https://www.greatscience.com/`

Two confirmed verdicts, published in full: the address at North Coast Harbor,
the July 1996 opening, the STEM exhibits and cafe, the 79-foot, 300-seat
Cleveland Clinic Dome Theater updated with laser projection in 2016, and the
NASA Glenn Visitor Center as one of only 11 nationally; the Cuyahoga Arts and
Culture funding, quoted verbatim by the verifier, and the February 2024 and
September 2025 gallery openings.

`status_verdict: confirmed` on the September 2025 gallery opening. Same
`could_not_establish` about a relationship to the ballpark, and the same
silence in response.

### house-of-blues-cleveland — House of Blues Cleveland (`theater`)

`308 Euclid Avenue, Cleveland, OH 44114`

One confirmed verdict, published in full: the address, the 2004 opening, the
1,300 capacity, and the listing among the chain's 11 currently operating North
American locations.

**The finder called this `uncertain`; the verifier upgraded it to confirmed**,
and the reason is the interesting part: it re-obtained the full 11-location list
directly rather than trusting the finder's summary, and Cleveland is on it. That
is an editorially maintained third-party list, not the venue's own site.

### the-corner-alley-cleveland — The Corner Alley (`restaurant`)

`402 Euclid Avenue, Cleveland, OH 44114` · `https://thecorneralley.com/`

Two confirmed verdicts. The first is confirmed *"only as far as what a business's
own site can establish — its existence, offering and address — not its trading
status"*: 16 bowling lanes, a bar and dining, the address, the posted hours and
the over-21 restriction after 10:00 pm all ship.

**Not published: "Cleveland's Premier Bowling Alley & Sports Bar Experience".**
That is the site's self-description, and a self-sourced superlative does not
ship however it is attributed — the same rule that struck two Pittsburgh museum
claims. The record's `name` and `slug` carry no superlative either, which the
corpus gate checks independently.

The second verdict is the spatial one, and it is the checkable kind: *"the
article states the street runs from Euclid Avenue to Prospect Avenue and 'butts
up against the Gateway Sports and Entertainment Complex' — a bordering
relationship stated by an independent source, which is what the item restates,
not a vague-proximity claim."*

**Trading status: uncertain.** The `status_verdict` reason reads *"Agree with
the finder's uncertain call … so per rule 4 this stays uncertain, not
confirmed-operating."* No trading claim is made.

### pickwick-and-frolic — Pickwick & Frolic (`restaurant`)

`2035 East 4th Street, Cleveland, OH 44115`

Two confirmed verdicts, published: the address, the restaurant / bar / theatre
complex with Kevin's Martini Bar and Hilarities 4th Street Theatre, the
"American Rustic Cuisine" with wood-fired entrees, and 185 seats; and the same
independently sourced bordering relationship for East 4th Street.

**Trading status: uncertain**, on the same reasoning. `could_not_establish`
records that the site references long operation but gives no founding year, and
the record says so rather than implying one.

### flannerys-pub — Flannery's Pub (`restaurant`)

`323 Prospect Avenue, Cleveland, OH` · `https://flannerys.com/`

Two confirmed verdicts, published: founded 1997 by Denis Flannery, the Irish pub
fare and the full bar with draft Guinness; and *"about 0.4 miles from
Progressive Field and about 0.1 miles from Rocket Mortgage FieldHouse"*.

**The distance ships, and the verifier said why in terms:** *"This is a sourced
distance, not a banned vague-proximity phrase or a trip duration — the source
also states walking-time figures … alongside the mileage, and the finder
correctly took only the mileage and left the duration out."* Those journey
figures do not appear anywhere in this corpus, and because the duration ban is
enforced by a scan over module source, neither moduledoc can quote them even to
record the omission — only this file, which is Markdown and not scanned, can
say that the source carried them and that they were dropped.

**Trading status: uncertain.** A long stated operating history is not evidence
of current trading, and no independent source was found.

### hope-memorial-bridge — Hope Memorial Bridge (`historic-site`)

`Carries Lorain Avenue and Carnegie Avenue over the Cuyahoga River, Cleveland, OH`

Two confirmed verdicts plus one confirmed `history` item, all published: the
4,490-foot Art Deco truss bridge, the 1927-1932 construction, the $4.75 million
cost and the Lorain-to-Carnegie connection; the eight Guardians of Traffic
statues, Henry Hering's sculpture to Frank Walker's design, the Berea Sandstone
carved in Little Italy, the different vehicle each holds, the bridge terminating
just short of Progressive Field, and the direct inspiration for the 2021 name
change.

*"Terminates just short of Progressive Field"* is the source's own language,
quoted verbatim by the verifier, which is why it publishes.
`could_not_establish` records that no precise distance exists — *"the source's
own language … is a qualitative description, not a measured distance"* — and
none is invented.

`status_verdict: confirmed`, with the correct note that a publicly owned road
bridge carrying Ohio State Route 10 has no trading status to establish.

---

## 3. The guide

`slug: progressive-field-guide` · `destination: "Cleveland, Ohio"` ·
`state: "Ohio"` · `county: "Cuyahoga County"`

### Getting there

All five `getting_there` items are confirmed and all five ship: Tower City
station as the four-line hub at 230 West Huron Road, reachable only through the
Tower City Center mall; the enclosed, air-conditioned skyway to the arena and
the ballpark; the Gateway complex's underground walkway to Tower City Center and
its street boundaries; the HealthLine's Euclid Avenue route and stop list,
**including the source's own statement that no stop at East 4th Street or the
Gateway complex is documented**; and the complex's two garages with a combined
capacity of about 3,300 vehicles.

**No station, garage or bus route becomes a place record.**

**One source disagreement, published rather than resolved.** The transit source
calls the arena Rocket Arena; Flannery's Pub's own site calls it Rocket Mortgage
FieldHouse. Both names appear, each where its own source used it, and the guide
says so — the wave-1 practice for two sources with two answers.

### Around the ballpark

Every address is a place record's own published address. The only distances are
Flannery's Pub's two, in miles, from its own site.

**Not published:** any relationship between the two lakefront museums and the
ballpark. Both `could_not_establish` entries name that gap explicitly, and the
paragraph gives addresses instead.

### The ballpark and the team

Restates the confirmed `history` items with `about: "ballpark"` and
`about: "team"`, plus the identity verdicts on the name change and the Gateway
complex's ownership. The 1954 sentence carries the correction's wording.

### FAQ

Six questions. Three state what could not be established or what a source does
not support — the parking price, the HealthLine's absent stop, and the 1954
record.

---

## 4. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8. One source
  carried journey figures beside its mileage; the mileage ships and the rest
  does not.
* **No vague proximity.** Every spatial claim published is a street name, a
  street-to-street extent, a set of bounding streets, a distance in miles, or a
  bordering relationship an independent source states. Where the research found
  no relationship — the two museums to the ballpark, a measured distance for the
  bridge — the record says so.
* **No unsourced superlative, and no self-sourced one.** Two ship, both inside
  confirmed verdict text: the smallest MLB stadium by total maximum capacity,
  and the NASA Glenn Visitor Center as one of only 11 nationally. One was
  struck as a self-description (The Corner Alley), and one was struck as
  contradicted by its own source (the 1954 record).
* **No trading claim for three of eight places**, named with the reason in the
  guide prose and in an FAQ answer.
