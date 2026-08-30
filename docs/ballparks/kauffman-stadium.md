# Kauffman Stadium — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for
`lib/ethos/seeds/kauffman_stadium_places.ex` and
`lib/ethos/seeds/kauffman_stadium_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Kansas City Royals research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/kansas-city-royals.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates, not for every clause of the sentence the finder wrote around it.

**1 place and 1 guide shipped** from 1 researched place.

---

## 0. Why one place, and why that is the finding

The artifact's `could_not_establish` on the ballpark is the longest single entry
in this wave, and it is a positive finding rather than a gap someone forgot to
fill:

> No walkable commercial or cultural district around the ballpark could be
> established from any source fetched this session. Every source describing the
> site's surroundings (Wikipedia's Kauffman Stadium and Truman Sports Complex
> articles, ballparksofbaseball.com) describes it only as a suburban, car-access
> sports complex outside downtown Kansas City, sharing roughly 26,000 parking
> spaces with the neighboring Arrowhead Stadium, with no adjacent businesses,
> hotels, restaurants, or attractions named by any of them. A search for the
> nearest branded hotels (Drury Hotels' own site) found the closest named
> location 8.5 miles away in Blue Springs, Missouri — too far to be 'around the
> ballpark' for a day-tripper, and no closer establishment could be sourced.

It also names the method limit: search was WebSearch-exhausted before the first
query, so the finding rests on direct fetches of encyclopedia, team,
hotel-chain and venue-directory pages, and *"Kansas City's open data portal
(data.kcmo.org) did not yield a queryable business-license dataset through the
pages fetched"*, with other candidates returning 403s, DNS failures or CAPTCHA
walls.

**The guide publishes the absence and the method limit together.** The
place-content gate has no minimum length by design — padding is the defect — so
the "Around the ballpark" section reports what the sources say is there (the
complex, its ownership, its parking) and states plainly that "no district could
be established" is a limit on the record, not a claim that nothing exists near
the ballpark.

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| venue | Kauffman Stadium | *"The ballpark's current official name is Kauffman Stadium, at 1 Royal Way, Kansas City, Missouri 64129. It opened as 'Royals Stadium' on April 10, 1973, and was renamed Kauffman Stadium on July 2, 1993, to honor franchise founder and owner Ewing Kauffman."* — confirmed |
| city | Kansas City | as above |
| state | Missouri | as above |
| county | **Jackson County** | *"Kauffman Stadium is part of the Truman Sports Complex, which is located in Jackson County, Missouri"* — confirmed, `ballparksofbaseball.com`; and *"The Truman Sports Complex … is 'owned by the government of Jackson County' and 'managed by the Jackson County Sports Complex Authority, which is a State of Missouri agency.'"* — confirmed, `en.wikipedia.org/wiki/Truman_Sports_Complex` |

Both county citations were checked against the dispatch's warning and both cited
sources carry the county in the sentence the verdict restates.

**This is the set's second Missouri ballpark and the two counties differ by
design.** Busch Stadium ships `county: "St. Louis"` — an independent city
outside its same-named county — while Jackson County is an ordinary county and
is named as one. The roster's attribution test checks each row against the place
record it names, so the difference is asserted rather than assumed.

A fifth confirmed identity verdict is bookkeeping worth keeping: `royals.com/ballpark`
301-redirects permanently to `mlb.com/royals/ballpark`, which is why that is the
`official_url` — though the page itself returned HTTP 406 on every fetch attempt
and could not be read.

---

## 1. The one refutation: the capacity history

The finder wrote: *"Original seating capacity was 40,625 (1973-2002); it was
reduced to 37,903 after the 2007-2009 renovation."* Refuted:

> Re-fetched the Wikipedia infobox's capacity-by-year table directly and it does
> not support the second clause. The full table is: 40,625 (1973-2002); 40,793
> (2003-2004); 40,785 (2005-2009); 37,840 (2010-2011); 37,903 (2012-2025);
> 38,053 (2026-present). The capacity immediately after the 2007-2009 renovation
> was 37,840 (2010-2011), not 37,903 — 37,903 did not take effect until 2012,
> three seasons later, following a separate adjustment. The item collapses two
> distinct capacity eras into one and also omits that the current
> (2026-present) capacity is 38,053.

The correction's full six-figure series is what ships, in the place record and
in the guide, with the 37,840/37,903 distinction stated in terms. An FAQ answer
gives the series.

**A second, unresolved disagreement is published rather than resolved.** A
separate confirmed verdict records that *"A separate source gives original
capacity as 40,793 (1973)"*, against the table's 40,625 for 1973-2002. Both
figures appear, attributed, with the disagreement named — the wave-1 practice for
two sources with two answers.

---

## 2. The place, against the verdicts it rests on

### kauffman-stadium — Kauffman Stadium (`stadium`)

`1 Royal Way, Kansas City, MO 64129` · `https://www.mlb.com/royals/ballpark`

| Published | Verdict |
|---|---|
| home of the Royals, nicknamed "The K"; Royals since 1969 with no name changes; AL Central since 1994, AL West 1969-1993 | confirmed, verbatim |
| 1 Royal Way; opened as Royals Stadium April 10, 1973; renamed July 2, 1993 for Ewing Kauffman | confirmed, verbatim (twice — an identity verdict and a place verdict) |
| part of the Truman Sports Complex, in Jackson County, county-owned and Authority-managed | two confirmed identity verdicts |
| the 12-1 opening win over the Texas Rangers before 39,464 fans | confirmed, verbatim |
| Kivett and Myers as original architects, Populous on later renovations | confirmed, verbatim |
| the six-figure capacity series through 38,053 for 2026 | **refuted with correction**; the correction's series |
| the 40,793-vs-40,625 disagreement on 1973 | confirmed, and published as a disagreement |
| the 2007-2009 renovation at $256 million with bullpens, club areas, LED scoreboard and 360-degree concourse | confirmed, verbatim |
| the 1998 Crown Seats / Dugout Suites / clubhouses / restaurant / blue seats round, the 1995 grass replacement and the 1990 JumboTron | confirmed, verbatim |
| the 2026 fences moved inward nine to ten feet with reduced wall height | confirmed, verbatim |
| the 322-foot fountain and waterfall display, its operating pattern, and "the largest privately funded fountain in the world" | confirmed. The verifier's reason states in terms that it re-fetched and confirms *"the 322-foot height … and the exact 'largest privately funded fountain in the world' superlative attributed to the source itself — so the superlative ships … since the cited source states it rather than the finder inflating it."* Published as "a 322-foot fountain and waterfall display", carrying the verdict's number without restating the dimension label. |
| the 1973 and 2012 All-Star Games and the NL's 8-0 win in 2012 | confirmed, verbatim |
| the 1980, 1985, 2014 and 2015 World Series with their outcomes | confirmed, verbatim |

**The relocation caveat is published**, from the `status_verdict`'s own text:

> CAVEAT NOT REFLECTED IN THE STATUS STRING: the Wikipedia Kansas City Royals
> article also states the franchise "is planning a relocation to a new downtown
> Kansas City ballpark, with hopes to open it by the start of the 2027 or 2028
> MLB season." … it means this identity fact has a known, sourced expiration and
> should not be assumed stable past the 2026/2027 offseason without
> re-verification.

It appears in the place summary, in the guide intro and in an FAQ answer. This
is the same treatment Comerica Park's pending Fifth Third rebrand gets in this
wave: a name or tenancy with a sourced end date is published with the end date,
not silently as though permanent.

`status_verdict: confirmed` on three independent freshly re-fetched sources —
`ballparksofbaseball.com`, the Royals article, and the club's own MLB.com page,
which the verifier records as loading live *"with matching address and active
ticketing/parking/tours content — not merely a licence-style record, but a
functioning commercial page."*

---

## 3. The guide

`slug: kauffman-stadium-guide` · `destination: "Kansas City, Missouri"` ·
`state: "Missouri"` · `county: "Jackson County"`

### Getting there

All five `getting_there` verdicts are confirmed and all five ship: the single
KCATA bus route serving the complex and the absence of any rail line; KCATA
Route 47 serving Kauffman Stadium; the suburban location reached via I-70, the
Blue Ridge Cutoff, I-435 and Stadium Drive or Raytown Road, with car rental or
rideshare described as the fastest way from the airport; the $21 expected general
parking pass; and the complex's 26,000 total parking spaces shared with
Arrowhead.

**This is one of the few ballparks in the set where a parking price ships**, and
it ships because a confirmed verdict states one. Elsewhere in this wave the
answer is that no source states a price.

**No bus route or parking estate becomes a place record.**

### Around the ballpark

Reports the absence and the method limit; see §0.

### The ballpark and the team

Restates the confirmed `history` items with `about: "ballpark"` and
`about: "team"`, with the corrected capacity series and the published
disagreement.

### FAQ

Five questions. Three state a limit: what is around the ballpark, the unresolved
1973 capacity figure, and the club's planned relocation.

---

## 4. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8. Nothing was lost
  to it here. "The fastest way to travel from the airport" is a mode
  recommendation the source makes and carries no time.
* **No vague proximity.** The only spatial claims are the complex membership, the
  road approaches by name and number, and the 8.5-mile distance to the nearest
  sourceable hotel — which is published as a measured distance in the sentence
  that explains why no district is listed.
* **No unsourced superlative.** One ships, inside confirmed verdict text and with
  the verifier's explicit reasoning behind it: the largest privately funded
  fountain in the world.
* **No invented neighbours.** The set's largest temptation on this artifact was
  to fill "Around the ballpark" from general knowledge. Nothing there rests on
  anything but a verdict, and the section says why it is short.
