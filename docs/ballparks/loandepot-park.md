# loanDepot park — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for
`lib/ethos/seeds/loandepot_park_places.ex` and
`lib/ethos/seeds/loandepot_park_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Miami Marlins research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/miami-marlins.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates. Only `confirmed` verdicts ship; a `refuted` verdict ships nothing,
including its correction.

**6 places and 1 guide shipped** from 5 researched places plus the ballpark,
which this artifact does not carry as a place. **No place was dropped.**

---

## Identity, and the county the finder mis-sourced

| Field | Value | Verdict |
|---|---|---|
| venue | loanDepot park | *"MLB.com's official Marlins site confirms the club name 'Miami Marlins', that it plays at 'loanDepot park' …"* — confirmed. A second confirmed verdict adds the Marlins Park era and the March 31, 2021 renaming. |
| city | Miami | as above, and in the ballpark article's confirmed address clause. |
| state | Florida | as above |
| county | **Miami-Dade County** | Not from the source the finder cited. See below. |

**This is the county miscitation the dispatch names, and it is worth quoting in
full because the correction is exactly the sort of thing a later reader would
otherwise assume never happened.** The finder's identity item read: *"MLB.com's
Marlins site names the ballpark 'loanDepot park' and gives the address 501
Marlins Way, Miami, FL 33125, Miami-Dade County."* The verifier **refuted** it:

> Re-fetched https://www.mlb.com/marlins/ballpark directly. It literally
> displays 'loanDepot park / 501 Marlins Way / Miami, FL 33125' — the name,
> street address and ZIP are confirmed there — but the page contains neither the
> word 'Miami-Dade' nor 'county' anywhere. The county clause is not supported by
> the cited source; it was appended without a source that actually carries it.

**The county ships from the two verdicts that survived**, and both of their
cited sources carry it:

* The confirmed ballpark verdict, cited to `en.wikipedia.org/wiki/LoanDepot_Park`.
  The verifier records precisely where in that article the county is carried and
  where it is not: *"The county is confirmed via the infobox 'Owner: Miami-Dade
  County' field and body text describing 'the Miami-Dade County Commission
  (county board)' as a funding party, rather than via the infobox's separate
  'Location' line, which reads only 'Miami, Florida, U.S.' — but the county fact
  stands."*
* The confirmed club verdict, cited to `en.wikipedia.org/wiki/Miami_Marlins`,
  which the verifier quotes verbatim: *"As part of an agreement with the park
  owner, Miami-Dade County, to use the stadium, the franchise changed its name
  to the Miami Marlins prior to the 2012 season."*

Miami is an ordinary city in an ordinary county — not consolidated, not
independent — so the plain `"<Name> County"` form ships, and no
consolidated-city rendering applies.

**The venue name comes from the verdict.** `loanDepot park` is published with
the source's own capitalisation, lowercase `l` and lowercase `park` included.

### The zip code, and why no address carries one

The zip is confirmed only inside the **refuted** identity verdict and its
correction. Only confirmed verdicts ship, so no address in this ballpark carries
a zip — not the ballpark's, not Versailles's. The confirmed ballpark verdict
gives *"501 Marlins Way, Miami, Florida"* and that is what is published.

`official_url` for the ballpark is MLB.com's Marlins ballpark page — the page
both passes fetched, and which the verifier reports displays the venue name and
street address. That is a pointer to a page, not a factual claim about the
world, and the claim the finder attached to it is the one that was dropped.

---

## 1. Places, against the verdicts they rest on

### loandepot-park — loanDepot park (`stadium`)

`501 Marlins Way, Miami, Florida` · `https://www.mlb.com/marlins/ballpark`

**Minted from the identity and history verdicts.** The artifact's `places` array
holds the five places around the ballpark and not the ballpark itself, so this
record is built from confirmed verdicts elsewhere in the artifact: the name, the
address, the April 4, 2012 regular-season opening, the Marlins Park era from
2012 to 2020, the March 31, 2021 renaming after loanDepot bought the naming
rights, the former Miami Orange Bowl site (demolished March 2008, from the
verifier's own reason), the Little Havana neighborhood, and the county
ownership. Plus three confirmed `history` items: the $634 million construction
cost and its $889 million 2025-dollar equivalent; the LEED Gold certification,
dated May 25, 2012 in the verifier's reason; and the Sun Life Stadium tenancy
with the Dolphins before 2012, and this being the franchise's first home
designed exclusively for baseball. Plus the club's 1993 founding as the Florida
Marlins, the 2012 renaming under the county agreement, and the 1997 and 2003
World Series wins with their series scores.

**One superlative ships and one does not.** *"[T]he 1997 team was the first to
win the World Series as a wild card"* is inside a confirmed verdict's `item` and
is published, attributed to the source. The claim that loanDepot park was the
first retractable-roof stadium in any sport to achieve LEED Gold is **not**
published: it appears only in the verifier's `reason`, not in the item text the
verdict vouches for, and the standing rule is that a ranking needs a confirmed
verdict that carries it. The certification and its date ship; the ranking does
not.

**Two `history` items were refuted and ship nothing.**

* **The roof.** *"[T]he timing clause conflates two different figures the source
  gives separately: the cited article states the roof takes approximately [one
  interval] to open, and [another] to close — not the same duration 'to open or
  close' as the item claims."* The 8,300-ton figure in the same sentence is
  confirmed in the verifier's reason and is dropped with the item. It would have
  survived under a reading in which corrections ship; it does not under this
  one. The timing figures could not have been published in any case: the corpus
  bans duration-shaped strings, the ban scans module source, and its allowlist
  is keyed over a whole module and cannot be narrowed — so the figures are not
  quoted in this file's prose either where a module would read them.
* **The artwork.** The Red Grooms home-run sculpture and the Carlos Cruz-Diez
  tiled walkway are both confirmed in the verifier's reason. The item was
  refuted because the finder turned the source's *"four bright primary colors"*
  from Joan Miro's palette into "pastel colors", which the source uses elsewhere
  for something else entirely. **This is the wave's most substantive loss to the
  refuted-ships-nothing rule**, and it is recorded here so the remedy is
  obvious: if a correction is publishable text, the sculpture and the walkway
  come back, with the colours described as the source describes them.

### maximo-gomez-park-miami — Maximo Gomez Park (`park`)

`Calle Ocho (8th Street), Little Havana, Miami, Florida` · `official_url: nil`

Two confirmed verdicts, published in full: the Calle Ocho location in Little
Havana, the Domino Park nickname and the gathering place for Cuban immigrants to
play dominoes, drink coffee and smoke cigars since the early 1970s; and the
naming for Maximo Gomez, a general of Cuba's War of Independence, with the food
tours and art festivals it hosts today.

**The slug follows the name.** The finder proposed
`maximo-gomez-domino-park-miami`; the confirmed verdict's name is "Maximo Gomez
Park" with "Domino Park" as a nickname, so the record is
`maximo-gomez-park-miami` and the nickname is published in the summary.

**No street number**, on an explicit `could_not_establish`: *"An exact street
number; only the Calle Ocho location is sourced."* A second entry records that
the city and county parks pages returned 403 and 404 to automated fetches. Both
are published.

**`status_verdict: uncertain`, no trading claim.** The verifier weighed a 2024
photo caption in the cited article and rejected it as a basis: *"marginally
supportive but two years old and not a statement about ongoing operation."*

### tower-theater-miami — Tower Theater (`theater`)

`1508 SW 8th Street, Miami, Florida` · `official_url: nil`

One confirmed verdict, published in full: the address, the Art Deco building,
Little Havana, and the Viernes Culturales events. **The architectural style
ships because a verdict states it** — the standing rule.

**`status_verdict: uncertain`, and its reason is published as a named clause.**
The reason reads: *"Directly re-fetched towertheatermiami.com: it is indeed a
placeholder page headed 'Tower Theater Miami — Returns Soon,' identifying the
venue as 'Miami Dade College's Tower Theater Miami' and directing visitors to
the Miami Film Festival for current screenings. That confirms the finder's
characterization exactly."* That is the verifier expressly affirming a named
clause inside an uncertain verdict, which is the adjudication the project's
`uncertain`-with-authorisation ruling covers, so the clause is published exactly
as far as it goes and no further. The verifier's own limit is published with it:
the operator's own site cannot establish trading either way, and "Returns Soon"
is not a closure notice.

`could_not_establish`: opening date, current operator details, National Register
status. None is published.

`official_url: nil` — the site the verifier reached is a placeholder, and no
verdict establishes it as the venue's current official site.

### ball-and-chain-miami — Ball & Chain (`attraction`)

`1513 SW 8th Street, Miami, Florida` · `https://www.ballandchainmiami.com/`

Two confirmed verdicts, published in full: the address, the historic live music
venue in Little Havana and the 1935 opening; and Harry Gibson's appearance at
the Ball & Chain nightclub on the same bill as Billie Holiday in the Christmas
season of 1956, which the verifier confirmed near-verbatim.

**`status_verdict: uncertain`, no trading claim**, on the standing rule that a
business's own site cannot establish that it trades. Both
`could_not_establish` entries are published: the details of the venue's closure
in the 1935 era and its later reopening are unestablished, as are its current
hours, ownership and offerings.

### versailles-restaurant-miami — Versailles Restaurant (`restaurant`)

`3555 SW 8th Street, Miami, Florida` · `https://www.versaillesrestaurant.com/`

Three confirmed verdicts, published in full: the 1971 opening and the founder
Felipe A. Valls Sr., a Cuban exile from Santiago de Cuba — which the verifier
specifically confirmed *"independently of the operator's own site"*; the 2001
James Beard Foundation America's Classics award; and the restaurant's decades as
a central gathering place for Miami's Cuban exile community, hosting political
fundraisers and rallies, drawing media coverage of events related to Cuba, and
receiving visits from U.S. presidents and other politicians.

**The award ships because a confirmed verdict carries it in its `item` text.**
The standing rule bans an award *a confirmed verdict does not carry*; this one
does. The limit is published with it: the `could_not_establish` records that the
James Beard Foundation's own database is JavaScript-rendered and could not be
fetched, so the award rests on the encyclopedia's account.

**One verdict is refuted and ships nothing:** the finder's framing of an
undated 50th-anniversary campaign on the restaurant's site as a 2025-26
initiative. The verifier's arithmetic is the point — a 1971 opening puts the
50th anniversary in 2021 — and the "In 2025-26" framing is *"the finder's own
unsupported inference"*. No anniversary campaign is published in any form.

**`status_verdict: uncertain`, no trading claim**, and the reason is published
because it is what makes the guide's four-way distinction meaningful: the
encyclopedia documents a dated presidential visit on **June 13, 2023**, which
the verifier calls *"materially better evidence than 'no independent source
reachable,' but … roughly three years old, short of confirming trading today"*.

### south-river-drive-historic-district-miami — South River Drive Historic District (`historic-site`)

`SW South River Drive and SW 1st and 2nd Streets, Miami, Florida (contributing addresses …)` · `official_url: nil`

Two confirmed verdicts, published in full: the eastern-Little-Havana location
along the Miami River, the 1987 local designation by the Miami City Commission
and the National Register listing of August 10, 1987 as two distinct events in
the same year; and the 25 acres, the 9 historic buildings, the first-two-decades
development and the description as *"the city's oldest extant group of
vernacular frame buildings near the Miami River"*.

**The superlative ships because it sits inside confirmed verdict text.** The
contributing addresses ship on the verifier's own reason, which confirms the
description *"including the contributing addresses given"*.

`status_verdict: n/a` — a district, not a business, and the verifier records
that the finder's `n/a` "is appropriate and is not overturned". The
`could_not_establish` about which contributing buildings house publicly
visitable businesses is published.

---

## 2. The guide

`slug: loandepot-park-guide` · `destination: "Miami, Florida"` ·
`state: "Florida"` · `county: "Miami-Dade County"`

### Getting there

Three of the five `getting_there` items are confirmed and all three ship: the
game-day "Marlins Shuttle" from Culmer Metrorail station, with the verifier's
corroboration from Culmer's own article and the note that its name has not
changed since 1984; the free game-day trolleys to and from the Downtown Miami
Civic Center area, which the verifier reads as the district name and not the
station's; and the four garages, six surface lots, roughly 5,600-vehicle
capacity and pre-purchased parking tickets.

**Not published:**

* **Both items naming the Metrorail station nearest the ballpark**, and the
  lines serving it, both `refuted`. The guide states that the omission is
  deliberate and describes the adjudication — a superseded name in both cited
  sources, and line detail absent from the cited pages — without restating the
  facts the corrections carry.
* **"a nearby train station"**, the confirmed trolley item's own wording. The
  word "nearby" is an unmeasurable gesture, and this corpus drops those even
  when a source uses one. The gate does not catch it — `nearby` was rejected as
  a pattern at 474 repo-wide hits, most of them a link `kind` — so this is the
  rule holding where the gate cannot.

**No station, garage or lot becomes a place record.** Culmer station is prose.

### Around the ballpark

Every address is a place record's own published address. The only spatial
relationships published are the ones verdicts state: the Calle Ocho location,
the Little Havana containment, the district's position at the eastern end of
Little Havana along the Miami River, and the ballpark's placement on the former
Orange Bowl site.

### The ballpark and the team

Restates the confirmed identity and `history` verdicts, and states in terms
which two items were dropped and why.

### FAQ

Five questions, four of which state a limit: the mis-sourced county, the unnamed
Metrorail station, the four places with no trading claim, and the two refuted
building items.

---

## 3. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8. The roof
  timings would have been the only candidates and their item was refuted
  anyway.
* **No vague proximity.** The source's own "nearby" is dropped.
* **One superlative ships** — the 1997 wild-card first, inside a confirmed
  item — and **two do not**: the LEED "first retractable-roof stadium" claim,
  which lives only in a verifier reason, and nothing else.
* **No zip code on any address**, because the only verdict carrying one was
  refuted.
* **No trading claim for four of the six places**, each with its own reason
  named in the record and in the guide.
* **No parking price**, which no source established.
* **Nothing from any of the five refuted verdicts, including their
  corrections** — the two Metrorail items, the roof, the artwork and the
  anniversary campaign.
