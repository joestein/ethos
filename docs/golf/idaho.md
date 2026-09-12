# Idaho — Circling Raven: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/idaho.json`,
following the register established in `docs/golf/oregon.md`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/idaho-verdicts.md` — the
   independent verifier's adjudication. **The authority.** Tally: **21
   confirmed · 6 refuted · 4 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/idaho-finder.md` — the
   finder. Context only. It carries the six refuted claims; where the two
   disagree, the verdicts file wins.

**The governing rule:** a verdict vouches only for what its own text restates.
**The refuted-with-correction rule:** where a verdict is `refuted` but supplies
a correction naming what may still be published, that correction's text ships
verbatim and nothing else from the item does.

**7 places, 7 entries, 1 guide, 6 sections, 7 FAQ answers, 0 photos.**

---

## THE DURATION TRAP — read twice, publish once

The operator's own site (`https://www.cdacasino.com/golf/`) says: *"A scenic
45-minute drive from Spokane airport."* Wikipedia's Circling Raven article says
the nearest major airport, Spokane International, is *"about 45 mi northwest
by vehicle."* Both numbers are 45. One is a duration; one is a road distance.
Verdict G2 confirms only the mileage, sourced only to Wikipedia, and states
outright: "the duration must never be published, and the coincidence makes
this an easy place to launder one into the other."

**Published (guide, "Getting there" and FAQ "How far is Circling Raven from
Spokane?"):** *"Spokane International Airport is about 45 miles northwest by
road."* Sourced to Wikipedia (G2) only — never to `cdacasino.com/golf/`, which
is where the banned duration lives. The word "minute" does not appear anywhere
in `idaho.json`; grepped and confirmed after drafting. No allowlist entry was
needed because the duration was never drafted into the file in the first
place — the trap is closed by never writing the operator's sentence down, not
by writing it and then stripping it.

This is the single most instructive fact this state produced: two sources can
agree on the number and disagree on the unit, and only one of the two units is
publishable at all.

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| course | Circling Raven Golf Club | A2 — confirmed via raw `o-InfoBox` DOM pairing, not the rendered/summarized page (which shifts every badge by one) |
| rank / label | 6th, "Public" | A2 — confirmed |
| skipped | #1–#5, all "Private" | A3 — confirmed, cross-checked against the embedded JSON's 5×Private/4×Public count |
| facility | Coeur d'Alene Casino Resort Hotel | H1 — confirmed |
| town | Worley | A2, B1 |
| state | Idaho | A1 |
| county | **Kootenai County** | B1 — confirmed on the US Census Bureau geocoder at the course's own coordinates (47.424, −116.964), corroborated by the Circling Raven and Idaho SH-58 Wikipedia articles naming the county **of the course**, not just of the city of Worley |

B1 deliberately avoids the Fort McDowell hazard: Worley-the-city's county does
not, by itself, establish the course's county, because the course sits ~3
miles outside Worley on a reservation straddling two counties. The geocoder
call at the course's own coordinates is the fact that closes this.

`county: "Kootenai County"` derives `/destinations/idaho/kootenai-county`.

---

## 1. The guide

`slug: idaho-golf-guide` · `destination: "Worley, Idaho"` · `state: "Idaho"` ·
`county: "Kootenai County"` · `photos: []`

### Basecamp choice

**Worley**, not Coeur d'Alene or Hayden. The lodging a visitor actually sleeps
in — the Mountain Lodge and Spa Tower — is on the Coeur d'Alene Casino Resort
Hotel property at 37914 South Nukwalqw, **Worley**, Idaho 83876 (G1, H1). No
verdict places overnight lodging in any other town for this course.

### Intro

| Published | Verdict |
|---|---|
| Circling Raven at #6, literal "Public" rubric | A2 |
| positions #1–#5, all named, all "Private," skipped | A3, using the finder's own ladder table (the names themselves are not separately re-verified beyond the rubric, which is what matters for the skip) |
| "on the Coeur d'Alene Reservation near Worley, in the Kootenai County portion of the reservation" | B1 |
| "owned and operated by the Coeur d'Alene Tribe, a sovereign nation" | F4 |
| "Gene Bates designed the course" | F1 |
| "opened for play in the summer of 2003" | F2 |
| "covers 620 acres" | F3 — the corrected figure, not the finder's "more than 600 acres" |

### Section 1 — `Getting there`

Heading is exactly `Getting there`. No trip duration, no vague proximity, no
mention of the banned "minute" figure anywhere in this section.

| Published | Verdict |
|---|---|
| resort address 37914 South Nukwalqw, Worley, Idaho 83876, explicitly captioned as the **resort's**, not the golf club's | G1 — confirmed with the finder's conflation corrected. The golf club's own street number is UNCERTAIN and is not published (see omission O1). |
| Idaho SH-58: 2.943 mi, entirely on the Coeur d'Alene Reservation, begins at the WA state line east of Rockford at the SR-278 junction, continues as South Nukwalqw Street serving the Casino and Circling Raven near Worley | G4 — confirmed verbatim |
| Spokane International Airport, about 45 miles northwest by road | G2 — confirmed, Wikipedia only. **The duration trap; see above.** |
| resort complex about 30 miles south of the city of Coeur d'Alene (Wikipedia) | G3 — confirmed, one of two disagreeing-in-scope mileages |
| Worley itself 25 miles from Coeur d'Alene (operator's site) | G3 — confirmed, the other of the two. **Not merged** with the 30-mile figure — they measure different trips (resort-to-city vs. town-to-city), per the verdict's explicit instruction. |

**Omitted: the three driving-direction blocks** (from Spokane, Coeur d'Alene,
Lewiston). G3 marks these UNCERTAIN — the verifier's curl of
`cdacasino.com/contact-us/` was aborted by a tooling restriction and never
re-fetched. Not published.

### Section 2 — `Circling Raven Golf Club`

| Published | Verdict |
|---|---|
| "The golf course was designed by Gene Bates to both challenge and entertain golfers" (operator's own quote) | F1 — confirmed, upgraded to a primary source; the finder's "Florida-based" descriptor is Wikipedia-only and is dropped as unnecessary rather than published as safe-but-thin |
| opened summer 2003, matching Golf Digest's own `yearOpened: 2003-06-01` | F2 — confirmed |
| "sprawls out over a majestic 620 acres" (operator's own quote) | F3 — confirmed, corrected from the finder's Wikipedia-sourced "more than 600 acres." The 25-acre practice-facility figure is Wikipedia-only and UNCERTAIN; omitted. |
| Sept 2005 international competition and cultural exchange, Royal Dornoch GC, Scotland | F5 — confirmed |
| Aug 2006 PNW PGA Professional Championship, won by Ryan Malby | F5 — confirmed |
| returned 2012, won by Ryan Benzel | F5 — confirmed |
| Circling Raven Championship, Epson Tour, 2021–2023; 2020 inaugural cancelled (COVID-19); Peiyun Chien 2021 and Jillian Hollis 2022 both $200,000; Ren Yue 2023 at $225,000; event no longer held | F6 — **the correction, published verbatim and complete.** This is where the finder's superlative accretion is fixed: it wrote "$225,000 purse... each August" and never said the event ended. Both errors are corrected here. "Stroke-play" is deliberately not used — the source article does not use that term (F6's instruction). |

### Section 3 — `Access and booking`

The whole section is **two verdict corrections shipped verbatim**, plus
additional confirmed detail from the same page (C1):

> Circling Raven Golf Club is public-access: Golf Digest labels it "Public" in
> its 2025-'26 Idaho ranking, and the club's own site takes tee times from
> anyone, online or by phone on 1-800-523-2464, with no membership or
> hotel-stay requirement stated. Groups larger than 12 book through the golf
> club directly on 1-208-686-8823.

— C1's correction, verbatim. This replaces the finder's "states it is open to
the public," which is false: the word "public" occurs exactly once on the
whole page, inside a Golfweek award attribution, and that attribution is
banned separately (see omission O4).

> In peak season, 18 May to 13 September, phone bookings are capped at 45 days
> ahead; online booking runs beyond that 45-day window. The cap does not apply
> to Coeur d'Alene Tribal Members.

— C2's correction, verbatim. This is the Idaho-specific correction the
dispatch called out by name: the finder reported no booking window at all,
having checked only `/golf/` and never the rates page where the policy lives.
**A booking window is published, and it ships.**

| Published | Verdict |
|---|---|
| "Cancellations or reductions must be made at least 48 hours in advance." | C1 — confirmed verbatim, finder missed it |
| Dress code: "no jeans, tee shirts, or men's tank tops" | C1 — confirmed verbatim |
| Cart policy: GPS carts included with rate, no private power or push carts | C1 — confirmed verbatim |

### Section 4 — `Green fees and lodging`

| Published | Verdict |
|---|---|
| Peak season 18 May – 4 October 2026: $199 (Mon–Wed 18), $229 (Thu–Sun 18), $135 (9 daily) | E1 — confirmed exact, dated to "2026 Season" per the source's own header/footer |
| Shoulder season (opening day – 17 May, 5 Oct – end of season) 2026: $149, $169, $99 | E1 — confirmed exact |
| Rider fee $30, practice-facility day pass $30, premium rental set $75 "first come first serve" | E1 — confirmed |
| Raven Card holders: $40 off regular rate | E1 — confirmed, finder omitted this row |
| 2026 Raven Card $599: one free round Mon–Thu, $40 off green fees, "Raven Hour" all-you-can-play 3 hrs before sunset for $75, season practice-facility access, **no booking priority stated** | D2 — confirmed. The "no booking priority" clause is published deliberately, mirroring the verdict's own emphasis that this is a discount card, not a membership or an access tier. |
| Stay & Play 2026: $547 peak / $435 shoulder, double occupancy, subject to change | D1 — confirmed |
| "nothing published on the operator's site gives resort guests priority tee times, a guaranteed tee time, or an earlier booking window" | D1 — confirmed as an absence actively checked across four pages, including the client-rendered booking engine. **This is the second Idaho-specific correction the dispatch named: unlike two sibling states in this wave, lodging here confers no tee-time priority — price-only.** |
| 2026 season opens April 3rd | E2 — confirmed |
| shoulder season runs "October 5th – End of Season," **no closing date published** | E3 — confirmed as an absence; the finder's "implying a winter closed season" is explicitly refuted as sourcing (E3) and is **not** published in any form, positive or negative, beyond noting no closing date exists |
| aerification closure September 14–16, 2026 | E2 — confirmed |

**No winter closure claim appears anywhere in this file.** E3 is explicit that
this was the finder's inference dressed as a source; the guide states only
what is confirmed (an opening date and an unspecified "End of Season"), never
a closure.

### Section 5 — `The basecamp`

| Published | Verdict |
|---|---|
| Mountain Lodge room types (VIP Suite, Standard Queen, King Plus, Executive Suite, Queen Plus, Standard King, Presidential Suite) | H1 — confirmed, read from raw HTML site navigation |
| Spa Tower room types (Spa Suite, Deluxe Room, Chief Suite, Deluxe Suite, Junior Suite, Sunrise Suite, Deluxe Double) | H1 — confirmed |
| Ten dining rooms named; four selected as places (Chinook Steak Seafood & Pasta, Red Tail Bar Grill, Jackpot Java Coffee, Twisted Earth Grill) | H1 — confirmed |
| Twisted Earth Grill "located inside the Circling Raven Pro Shop," "open daily during golf season from late spring to early fall" | H1 — confirmed verbatim, a specific building, not a vague relation |
| "What the sources establish is that these rooms and venues exist and what they are called; none of them says whether any given one is serving this week, so this guide does not say so either." | The `DataGuide` no-trading-claim rule, made explicit exactly as Oregon's F2 caveat was. No place in this file asserts current trading. |

**Omitted: Nighthawk Lounge as a "live music bar," pet-friendly rooms at
"$40/day."** H2 — UNCERTAIN, both from `/hotel/`, which the verifier did not
fetch. Neither descriptor is published, and Nighthawk Lounge and The Wolf Den
Bar are not seeded as places at all since nothing beyond their names is
confirmed and the corpus does not need every named venue to be a place.

### Section 6 — `Day two: Avondale Golf Club`

| Published | Verdict |
|---|---|
| "A membership golf club that is open to the public," "Book a Tee Time" link, no member-only restriction on homepage | I1 — confirmed verbatim. (Unlike Circling Raven, Avondale's *own* site does use the words "open to the public" — this is not the banned Circling Raven phrase; it is Avondale's own confirmed wording about Avondale.) |
| Address: 10745 N Avondale Loop, Hayden, Idaho 83835 | I2 — the correction, verbatim. Replaces the finder's "10745 Avondale Loop Rd, Hayden Lake, Idaho," which the club's own site does not say — the finder attributed it to a GolfPass listing it never fetched. |
| Town: Hayden. County: Kootenai County | I2 — confirmed via Census geocoder match on the corrected address |

### FAQ

Seven questions; the gate requires one matching `play|tee time|tee times|book`
— four match.

* "How do I book a tee time at Circling Raven Golf Club?" — C1 and C2
  corrections, condensed.
* "Does staying at the resort get me a better tee time?" — D1. This question
  exists specifically to state the Idaho-specific correction the dispatch
  called out: no lodging priority, price only.
* "What does a round cost in the 2026 season?" — E1, D2.
* "When is Circling Raven open in the 2026 season?" — E2, E3 (the absence of a
  winter closure stated plainly, not inferred), the aerification window.
* "How far is Circling Raven from Spokane?" — G2. The duration trap's answer,
  in the one place a reader would ask the question the trap invites.
* "Where is Circling Raven Golf Club?" — B1, G4.
* "Which course should I play on day two?" — I1, I2.

---

## 2. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum.

| slug | kind | rests on |
|---|---|---|
| `circling-raven-golf-club` | `golf-course` | A2, A3, B1, F1, F2, F3, F4, F5, F6-correction |
| `avondale-golf-club-hayden` | `golf-course` | I1, I2-correction |
| `coeur-dalene-casino-resort-hotel` | `hotel` | G1, H1 |
| `twisted-earth-grill-cda` | `restaurant` | H1 |
| `chinook-steak-seafood-pasta-cda` | `restaurant` | H1 |
| `red-tail-bar-grill-cda` | `restaurant` | H1 |
| `jackpot-java-coffee-cda` | `cafe` | H1 |

All seven have `photos: []`, as does the guide. See omission O9.

**`address` appears on exactly two places**: `avondale-golf-club-hayden` (I2,
the corrected address) and `coeur-dalene-casino-resort-hotel` (G1, explicitly
the resort's own address). **`circling-raven-golf-club` carries no `address`
field.** No verdict establishes the golf club's own street number — G1 notes
both `37914` (the resort) and `38530` (a Yelp listing, never independently
confirmed) return zero matches on the Census address geocoder. Inventing one
to fill the field would be exactly the accretion failure the Oregon trace
warns against.

**`status: "open"` on all seven is not a trading claim**, per
`Ethos.Seeds.DataGuide`'s moduledoc — see the basecamp-section caveat above.

**One sourced spatial claim ships**: Twisted Earth Grill "inside the Circling
Raven Pro Shop" (H1), naming a specific building. No place in this file uses
"next to," "near," or any compass direction relative to an unnamed feature.

Seven entries, one per place, all `place_slug` values resolving inside this
file.

---

## 3. Every omission, and why

### The six refuted claims

**O1 — "45-minute drive from Spokane airport."** *Refuted, part of G2.* A
duration; banned outright regardless of the gate, and never drafted into the
file. See "THE DURATION TRAP" above.

**O2 — "No advance-booking window is published."** *Refuted, C2.* The rates
page publishes the 45-day peak-season phone cap with a tribal exemption.
Replaced by C2's correction in full — this is the Idaho-specific correction
named in the dispatch.

**O3 — "Its own site states it is open to the public."** *Refuted, C1.* The
word "public" occurs exactly once on the page, inside a Golfweek award
attribution. Replaced by C1's correction, which describes the actual booking
mechanics instead of putting words in the site's mouth.

**O4 — The Golfweek "No. 1 public-access course in Idaho" ranking, and every
other superlative sourced to `cdacasino.com`.** *Refuted, explicit "WHAT MUST
NOT BE PUBLISHED" item 4.* The operator's own domain cannot establish an award
or superlative about itself. Dropped entirely: "#1 Public Golf Course in
Idaho," "multi-award-winning," "Voted one of the Top 100 Courses in the U.S.,"
"The Best North Idaho Golf Course," and every testimonial pull-quote (Links
Magazine, breakingeighty.com).

**O5 — "A $225,000 purse played each August."** *Refuted, F6.* The purse was
$200,000 in 2021 and 2022, $225,000 only in 2023, and the event is
discontinued. Replaced by F6's correction in full.

**O6 — Avondale at "Hayden Lake" / "Avondale Loop Rd."** *Refuted, I2.* The
club's own site says Hayden, `10745 N Avondale Loop`. Replaced by I2's
correction.

### The four uncertain claims

**O7 — `"facilityType":"Daily Fee"`.** *Uncertain, A4.* `grep '"facilityType"'`
returned no matches bound to Circling Raven in the verifier's own re-parse.
Not published; the confirmed `displayedFacilityType: "Public"` (A2) is what
publishes instead.

**O8 — the 25-acre practice facility.** *Uncertain, F3.* Wikipedia-only,
sourced there to a 2006 newspaper piece the verifier did not re-fetch.
Omitted.

**O9 — Nighthawk Lounge "live music," pet-friendly rooms at $40/day.**
*Uncertain, H2.* Both from `/hotel/`, unfetched by the verifier. Neither
descriptor, nor a Nighthawk Lounge place record, is published.

**O10 — the three driving-direction blocks (Spokane, Coeur d'Alene,
Lewiston).** *Uncertain, G3.* The verifier's fetch of `contact-us/` was
aborted by a tooling restriction. Not published — see Section 1 above.

### The rules-driven omissions

**O11 — any winter closure.** *E3, explicitly refuted as sourcing.* The
finder's "implying a winter closed season consistent with the region's
climate" is inference, not a fact any page states. The guide publishes the
opening date and the unresolved "End of Season" phrase and stops there.

**O12 — a street address for `circling-raven-golf-club`.** No verdict
establishes one; see §2.

**O13 — any trading-status claim for any of the seven places.** The
basecamp-section caveat states this in the prose, matching `DataGuide`'s rule
and Oregon's F2 precedent.

**O14 — any protected/historic-status claim for the course.** F7 — UNCERTAIN,
correctly flagged by the finder as an absence of evidence, not evidence of
absence. Nothing published either way.

**O15 — every photo.** `guide.photos: []` and `photos: []` on all seven
places. No photo scout has run for this state.

**O16 — any trading-status or current-award claim tied to the 2026 season
dates.** Per verdict item 11 ("Any trading-status claim"): the 2026 season
dates and the aerification notice are the site's own forward-looking
statements about a season, not a claim that the club is currently trading.
Published as dated facts, not as "the club is open right now."

---

## 4. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, first run. No allowlist entry was added;
`Ethos.GolfProse`'s allowlist remains `[]`.

Nothing was drafted and then rewritten for this file — the duration trap was
avoided at drafting time by never writing the word "minute" anywhere near
"45," rather than by writing the operator's sentence and then having the gate
or a re-read catch it. Verified after the fact:

```
grep -in "minute" priv/seed_data/golf/idaho.json   # 0 matches
```

Also grepped and confirmed absent: `"open to the public"` as applied to
Circling Raven (it appears once, correctly, describing **Avondale**, whose own
site uses those exact words); `"225,000"` unpaired with `"2023"`; `"600 acres"`
(only `"620 acres"` appears); `"Hayden Lake"`; any `\d+[-\s]?minutes?` string;
any `next to|near|steps from|around the corner` construction.

Full golf-set gate: **9 tests, 0 failures.**

---

## 5. Roster row (informational only — not written by this agent)

Per dispatch, `priv/seed_data/golf_courses_roster.json` is resolved by another
agent afterward. For that agent's reference, this file establishes:

| field | value | verdict |
|---|---|---|
| `course` | `Circling Raven Golf Club` | A2 — matches the seeded `golf-course` place's `name` exactly |
| `facility` | `Coeur d'Alene Casino Resort Hotel` | H1 |
| `city` | `Worley` | A2, B1 |
| `county` | `Kootenai County` | B1 |
| `access` | C1 + C2 corrections, condensed: public-access, no membership/hotel-stay requirement, 45-day peak-season phone cap with tribal exemption, online booking runs longer | C1, C2 |
| `criterion` | `ranking` | A1–A3 |
| `ranking_source` | `Golf Digest Best in State, Idaho` | A1 |
| `ranking_edition` | `2025-'26` | A1 |
| `ranking_position` | `6` | A2 |
| `second_course` | `Avondale Golf Club` | I1 |
| `verified` | `true` | |

---

## 6. What is absent from the whole file

* **No trip duration of any kind**, and specifically never the word "minute"
  anywhere near "45" — the one trap this state was built around.
* **No vague proximity.** The one spatial descriptor that ships (Twisted Earth
  Grill, inside the Pro Shop) names a specific building.
* **No price without the source's own season or date attached** — every fee
  sits under the "2026 Season" heading, and Stay & Play prices carry their own
  peak/shoulder labels.
* **No trading claim for any of the seven places.**
* **No lodging-confers-priority claim.** Stated as an explicit negative twice
  (section 4, FAQ) because this state is the one in the wave where it would be
  easiest to assume otherwise from the Stay & Play packaging alone.
* **No "open to the public" sentence attributed to Circling Raven's own site.**
  That exact phrase is reserved for Avondale, which actually says it.
* **No inference published as a citation.** The winter closure (O11), the
  golf club's street address (O12), the practice-facility acreage (O8), and
  the three driving-direction blocks (O10) were each a plausible sentence no
  fetched page states. All four are out.
