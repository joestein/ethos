# Oregon — Pacific Dunes: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/oregon.json`, the
golf set's checkpoint file and the shape every wave file copies.

**This file is committed on purpose.** The research artifacts live under
`.superpowers/`, which `.gitignore` excludes — the arrangement that lost the
Brooklyn research artifacts. A year from now this file is the only thing that
can answer "where did that sentence come from".

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/oregon-verdicts.md` — the
   independent verifier's adjudication. **The authority.** Tally: **26
   confirmed · 4 refuted · 4 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/oregon-finder.md` — the
   finder. Context only. It carries the four refuted claims; where the two
   disagree, the verdicts file wins.

**The governing rule:** a verdict vouches only for what its own text restates,
not for every clause of the sentence the finder wrote around it.

**The refuted-with-correction rule:** where a verdict is `refuted` but supplies
a correction naming what may still be published, that correction's text ships
**verbatim** and nothing else from the item does.

**9 places, 9 entries, 1 guide, 5 sections, 7 FAQ answers, 0 photos.**

---

## 0. The identity correction that decided the whole file

The plan's prose called this checkpoint "Bandon Dunes". That was wrong, and it
would have anchored the guide on the wrong course.

| | Verdict |
|---|---|
| **Pacific Dunes is #1** on Golf Digest's Oregon Best in State 2025-'26 list, rated 4.9 by 66 panelists, literal access label `Public` | A2 — confirmed, on a second targeted pass written to force the literal label and reject inference |
| **Bandon Dunes is a distinct entry at #2**, 4.7, 60 panelists, also `Public` | A3 — confirmed |
| Therefore the ranking criterion selects **Pacific Dunes** | A4 — confirmed, follows from A2/A3 |

The guide is about Pacific Dunes. Bandon Dunes appears in this file exactly
twice: once in the intro, named as the separate #2 entry so a reader is not
confused; and once in the Pacific Dunes section, as the course that actually
hosted the 2025 U.S. Women's Amateur (E7). It is **not** a place record and
**not** the second course.

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| course | Pacific Dunes | A2/A4 — confirmed |
| facility | Bandon Dunes Golf Resort | B2, D1 — confirmed |
| city | Bandon | B4 — confirmed (Golf Digest ranking page places Pacific Dunes in Bandon) |
| state | Oregon | A1 — confirmed |
| county | **Coos County** | B1 — confirmed. Oregon Blue Book's Bandon page carries an explicit field reading `County: Coos`, hyperlinked to the Coos page. Corroborated at B2 (resort infobox: `[[Coos County, Oregon]]`) and B3 (Bandon, Oregon: *"a city in Coos County, Oregon"*). |

County is taken from the verdict, not derived from recollection. County
miscitation recurred in **every wave** of the ballpark run — always a true fact
citing a page that does not contain it — so B1 was verified as its own item on
a page that carries the fact as a labelled field, not as prose.

`county: "Coos County"` derives `/destinations/oregon/coos-county`.

---

## 1. The guide

`slug: oregon-golf-guide` · `destination: "Bandon, Oregon"` ·
`state: "Oregon"` · `county: "Coos County"` · `photos: []`

### Intro

| Published | Verdict |
|---|---|
| "puts Pacific Dunes first, with a rating of 4.9 from 66 panelists and the access label \"Public\"" | A2 — confirmed, exact figures |
| "one of the courses at Bandon Dunes Golf Resort, in Bandon, in Coos County" | B1, B2, B4 — confirmed |
| "Tom Doak designed it and it opened on July 1, 2001" | E1, E3 — confirmed. Wikipedia: *"The resort's second course, Pacific Dunes, opened on July 1, 2001."* |
| the quoted sentence *"Designed by Tom Doak and opened in 2001, Pacific Dunes is remarkably different in character and shot making requirements than our other courses."* | E1 — confirmed verbatim from the resort's own course page |
| "Bandon Dunes, the resort's original course and a separate entry on the same ranking, sits second." | A3 — confirmed |

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`, no trailing mode. **No trip
duration appears anywhere in this section or this file.**

| Published | Verdict |
|---|---|
| *"Bandon Dunes is just west of Highway 101"* — U.S. Route 101 | H1 — confirmed verbatim from the resort's directions page |
| Eugene 132 miles, northeast | H7 — confirmed, distance-cities.com, road distance |
| Medford 160 miles, southeast, by way of I-5 | H7 — confirmed, *"160 miles by car, following the I-5 route"* |
| Portland 236 miles, northeast, by way of I-5 | H7 — confirmed, *"236 miles by car, following the I-5 route"* |
| Coos Bay 24 miles northeast on US-101 | H2 — confirmed, *"24 miles … following the US-101 route"* |
| Coquille 18 miles northeast on OR 42S | H3 — confirmed, *"18 miles … following the OR 42S route"* |
| OTH in North Bend, service from DEN and SFO on United Express, *"just 25 miles north of Bandon Dunes Golf Resort"* | H4 — confirmed verbatim |
| Bandon State Airport (S05) listed alongside OTH | H5 — confirmed |

**No road name is published for the Bandon–Eugene leg.** See omission O10.
**No straight-line figure is published.** Each distance-cities page prints both;
the smaller number is the flight distance and would misrepresent a drive (§ "What
must not be published" 12).

### Section 2 — `The weekend around the course`

| Published | Verdict |
|---|---|
| six lodging properties named — The Lodge, Lily Pond, Chrome Lake, The Inn, Round Lake, Grove Cottages — from the *"Lodging Rates 2026 & 2027"* sheet | F1 — confirmed |
| Grove Cottages, four bedrooms / four baths / four kings, 2026 from $1,300 in January and December to $2,300 June–September | F1 — confirmed exact. **The date is the source's own** (`Rooms 2026`), which is the only condition under which a price publishes. |
| the ten dining rooms, named | F2 — confirmed; the ten appear in the resort's own site navigation on every page the verifier fetched |
| "What the sources establish is that these rooms exist and what they serve; none of them says whether any given room is serving this week, so this guide does not say so either." | F2's caveat, made explicit rather than left implicit. No trading claim is made about any venue. |
| The Inn at Face Rock, a Best Western property, (800) 638-3092, named by the resort *"in an answer about travelling with a non-service animal rather than as a general lodging recommendation"* | F3 — confirmed verbatim, **including the context**, which the verifier explicitly instructed be kept if published |
| the 2,525-acre resort, ~1,500 acres unmanaged, the 250-acre H.L. McKee Preserve, 13 natural resource communities, Silvery Phacelia (Phacelia Argentea) threatened in Oregon and a species of concern federally | E11 — confirmed exact, quoted |
| "Bandon Dunes Golf Resort states that five of its six courses are certified as an Audubon Cooperative Sanctuary through Audubon International. The resort does not name which five." | E9 confirmed **as to the resort**; E10 refuted, and this is **the correction's text verbatim**. See omission O6. |

### Section 3 — `Pacific Dunes`

| Published | Verdict |
|---|---|
| Tom Doak; opened July 1, 2001 | E1, E3 — confirmed |
| "sculpted by his own Renaissance Design, Inc." | E2 — confirmed **with a source correction**: the firm is named on the *Bandon Dunes Golf Resort* Wikipedia article, not on doakgolf.com, which names no firm. The claim ships; the finder's citation does not. |
| rank 1, 4.9, 66 panelists, `Public` | A2 — confirmed |
| *"has been publishing a Best in State ranking every other year since 1977, making this the 25th edition"* and *"our trained panel of more than 1,700 low-handicap golfers"* | A5 — confirmed verbatim |
| 2006 Curtis Cup at Pacific Dunes; *"Team USA wins the 34th Curtis Cup Match by a comfortable margin, with a score of 11.5 points to Great Britain and Ireland's 6.5 points."* | E4 — confirmed verbatim. The **34th** is the source's own ordinal, which the finder dropped; it ships because the verdict carries it. |
| inaugural U.S. Women's Amateur Four-Ball, 2015, at Pacific Dunes | E5 — confirmed |
| "the 2019 U.S. Amateur Four-Ball, **played over** Old Macdonald and Pacific Dunes" | E6 uncertain as to *co-hosting*; this is **the correction's wording verbatim**. See omission O8. |
| "The 2025 U.S. Women's Amateur … was held on the resort's original Bandon Dunes course, not on Pacific Dunes." | E7 — confirmed twice (thepnga.org and the resort's own USGA page). Published as a negative to stop the event being absorbed into this course's list. |
| *"All courses are walking only."* | D6 — confirmed verbatim |

### Section 4 — `Playing it as a day guest`

The access paragraph is **C2's correction, published verbatim and complete**:

> Pacific Dunes is one of Bandon Dunes Golf Resort's daily-fee courses, and Golf
> Digest labels it "Public." You do not have to stay at the resort to play it:
> the resort publishes a day-guest green fee for every month of the year. Day
> guests booking inside 21 days pay the standard day-guest rate. To book more
> than 21 days ahead, a day guest must be playing between April and
> mid-November, pays the higher premium day-guest rate, takes a tee time after
> 10:00 a.m., and may book no more than one year out. Resort lodging guests book
> on a separate, earlier track at the lower resort-guest rate.

This is the single most consequential paragraph in the file, and it is where the
finder was wrong **in both directions**:

* The finder said day-guest play runs **April to mid-November**. Refuted (C2):
  the resort publishes a day-guest price for all twelve months, **December
  $180**. A published December price cannot coexist with "you may not play in
  December". Publishing the finder's version would have told a reader they
  cannot play a course they can.
* The finder read *"over 21 days in advance"* as **"from 21 days out"**.
  Refuted and **inverted** (C2): "over" means *more than*, and the page's own
  symmetric footnote for the Oregonian rate uses *"within"* as its opposite. The
  Premium Day Guest row is `n/a` for January, February, March and December —
  which is itself the proof that the seasonal clause governs the far-ahead
  premium booking, not access.
* The finder's quote stopped **before the parenthesis**. Refuted by omission
  (C3): the green-fees footnote continues *"(tee times must be after 10:00 a.m.
  and cannot exceed one year in advance)"*. A 10 a.m. floor is material to a day
  guest. Both the floor and the one-year cap are in the published paragraph.

| Published | Verdict |
|---|---|
| the page is headed "Green Fees" and dated *"2026 & 2027 Rates for Bandon Dunes, Pacific Dunes, Bandon Trails, Old Macdonald, and Sheep Ranch"* | D1 — confirmed. **The date is attached by the source, not by us**, which is the only basis on which the prices below publish. |
| Day Guest 2026: $180 Jan/Dec, $425 Jun–Sep | D3 — confirmed exact |
| Premium Day Guest 2026: Apr $360, May $440, Jun–Sep $475, Oct $440, Nov $325, **no premium rate published for Jan, Feb, Mar, Dec** | D5 — confirmed, and **supplied by the verifier**: the finder omitted this row entirely. It is the number a day guest booking ahead actually pays. |
| Resort Guest 2026: $130 Jan/Dec, $375 Jun–Sep | D2 — confirmed exact |
| Oregon Resident matches the Resort Guest schedule, with *"The Oregonian rate is available only for tee times made within 21 days in advance."* | D4 — confirmed, **with the condition the finder omitted**. The verdict makes publishing the condition a requirement of publishing the rate. |
| *"Replay rates only apply to an individual's second round played the same day."* | D6 — confirmed verbatim |

### Section 5 — `Day two: Bandon Trails`

| Published | Verdict |
|---|---|
| third on the same list, labelled `Public` | G1 — confirmed |
| on the same 2026 & 2027 green-fee sheet, same booking rule | G2 — confirmed. Note the verdict's rider: the finder's own §6 restates its **inverted** version of the window; this guide applies the C2 correction to Bandon Trails, not the finder's. |
| the Coore/Crenshaw quotation, 2005, *"begins atop a massive sand dune, then quickly opens into a sprawling meadow"* | G3 — confirmed verbatim, word for word |

### FAQ

Seven questions. The gate requires one matching `play|tee time|tee times|book`;
three match. Every answer restates a section above and adds nothing.

* "How do I book a tee time at Pacific Dunes as a day guest?" — C2's correction.
* "Can I play Pacific Dunes in winter?" — C2, the twelve-month day-guest grid and
  the four `n/a` premium months. This question exists **because** the finder's
  refuted claim would have answered it "no".
* "What does a round cost?" — D1–D5, with the source's own 2026 dating.
* "Are carts available?" — D6 verbatim.
* "Where is Pacific Dunes?" — B1, H1, H2, H7.
* "Which course should I play on day two?" — G1, G3.
* "Is Pacific Dunes an Audubon-certified course?" — E9/E10. Answers by stating
  the resort-level fact and saying plainly that no claim is made about this
  course, rather than by leaving the question unanswered.

---

## 2. Places, against the verdicts they rest on

Two `golf-course` places, which is the gate's maximum: the ranked course and one
second course.

| slug | kind | rests on |
|---|---|---|
| `pacific-dunes` | `golf-course` | A2, A4, B1, B4, E1, E2, E3, E4, E5, E6-correction, D6 |
| `bandon-trails` | `golf-course` | G1, G2, G3 |
| `grove-cottages-bandon-dunes` | `hotel` | F1 |
| `inn-at-face-rock-bandon` | `hotel` | F3, with its "non-service animal" context preserved |
| `ghost-tree-grill-bandon-dunes` | `restaurant` | F2 |
| `pacific-grill-bandon-dunes` | `restaurant` | F2 |
| `the-gallery-and-puffin-bar-bandon-dunes` | `restaurant` | F2 |
| `mckees-pub-bandon-dunes` | `restaurant` | F2 |
| `hl-mckee-preserve` | `park` | E11 |

Every one of the nine has `photos: []`, as does the guide. See omission O15.

**No `address` field on any place.** No verdict establishes a street address for
any of them. A place record's `address` is a postal address; inventing one to
fill the field is the accretion failure this trace exists to catch. Required
fields — slug, name, kind, town, state, county, summary — are all present and
all sourced.

**`status: "open"` on all nine is not a trading claim.** Per
`Ethos.Seeds.DataGuide`'s moduledoc, `"open"` renders nothing and is the absence
of a closed claim. F2's caveat is honoured in the prose, which is where a
trading claim would otherwise live.

**Two sourced spatial claims ship**, both from F2's Wikipedia descriptors, both
naming a specific building rather than a vague relation: Pacific Grill *"above
the Pacific Dunes pro shop"* and The Gallery & Puffin Bar *"in the main lodge"*.
The Fenway precedent governs: a sourced spatial relationship publishes, an
unsourced one does not. McKee's Pub's descriptor *"located next to main lodge"*
was **dropped** — see O16.

Nine entries, one per place, all `place_slug` values resolving inside this file.

---

## 3. Every omission, and why

### The four refuted claims

**O1 — "Day guests may only play April to mid-November."** *Refuted, C2.* The
resort publishes a day-guest green fee for all twelve months, December $180.
Replaced by C2's correction in full. This is the omission that matters most: the
finder's version tells a reader they cannot play a course they can, and a
reader acts on it.

**O2 — "Day guests can only book starting 21 days out."** *Refuted and inverted,
C2.* "Over 21 days in advance" means *more* than 21 days ahead. Replaced by C2's
correction. The `n/a` Premium Day Guest cells for January, February, March and
December are the evidence.

**O3 — an access paragraph without the 10 a.m. floor and the one-year cap.**
*Refuted by omission, C3.* Both sit inside the parenthesis the finder's quote
stopped before. Both are published.

**O4 — "Resort guests may book 12 months ahead."** *Refuted, C5.* Unsourced —
the finder's own words were *"is implied by their reservations flow"*. The only
one-year figure on any fetched page is the **day-guest** cap, and attaching it
to resort guests would misassign a limit to the wrong tier. Published instead:
resort guests book "on a separate, earlier track at the lower resort-guest
rate" — **no number**, exactly as the correction directs.

**O5 — the finder's citation of the two access sentences to "the resort's FAQ".**
*C1, confirmed with a location correction.* The sentences exist verbatim
(including the source's own typo "adavanced") but sit in a site-wide reservation
widget injected into every page, not in the FAQ body. This file cites the
**green-fees page**, where the same rule appears as a deliberate rate-table
footnote — the better citation, per C1.

**O6 — "Pacific Dunes is a Certified Audubon Cooperative Sanctuary."** *Refuted,
E10.* The cited page says five of six courses are certified and **never names
which five, and never names Pacific Dunes anywhere in its environmental
section**. That Sheep Ranch is the uncertified sixth is a reasonable inference
the page does not make. Published instead: E10's correction verbatim — the
resort-level sentence plus "The resort does not name which five." The FAQ says
so a second time, explicitly.

### The four uncertain claims

**O7 — "Pacific Dunes has no membership."** *Uncertain, C4.* The string
"membership" appears **zero** times on the Pacific Dunes course page, the
green-fees page or the FAQ; the only "member" hits are *"A member of our team
will reach back out"* and a trip-planner option *"Club members trip"*. Uncited
is not false, but it does not publish. The access fact is published from what
**is** confirmed: Golf Digest's literal `Public` label (A2) and the published
day-guest rate schedule (C2, C7).

**O8 — "the 2019 U.S. Amateur Four-Ball co-hosted across Old Macdonald and
Pacific Dunes."** *Uncertain, E6.* The resort page's listing
`(Old Macdonald/Pacific Dunes)` is confirmed, but Wikipedia states *"Old
Macdonald's was the primary course used for the event, with Pacific Dunes also
used."* "Co-hosted" implies a parity no source establishes. Published as E6's
correction: *"played over Old Macdonald and Pacific Dunes."*

**O9 — any USGA championship count for the resort, and the 2028 Walker Cup.**
*Uncertain, E8.* Two sources disagree in both directions: thepnga.org says
*"the ninth USGA championship … since it opened in 1999"* and *"11 more amateur
competitions … over the next 20 years"* starting with the 2028 Walker Cup; the
resort's own page says *"eight USGA championships … thus far"* and 13
championships over 23 years from a 2021 announcement. E8 permits publication
only with source and as-of date attached. **Omitted entirely** — and it is
resort-level in any case, never a Pacific Dunes fact. The three championships
this file does publish (E4, E5, E6-correction) are each individually confirmed
as having been played on this course.

**O10 — "OR 126" as the Bandon–Eugene road.** *Uncertain, H8.* OR 126 does not
reach Bandon; the aggregator names a mid-route highway as though it were the
whole route. Published: **132 miles, northeast**, with no road name. The
I-5 labels for Medford and Portland are published because H8 finds them
defensible for those two legs specifically.

### The rules-driven omissions

**O11 — every drive time.** The resort's own directions page gives Eugene,
Medford and Portland **only** as durations — *"Approximately a 2.5-hour drive"*,
*"3-hour"*, *"4.5-hour"* — and gives no mileage at all (H6, confirmed). The
finder was right to refuse to convert a duration into a distance. H7 fills the
gap with three separately fetched, sourced road mileages, and those are what
publish. The resort's "35-minute" and "10-minute" figures and every
distance-cities minute figure are likewise absent.

**O12 — every straight-line distance.** Each distance-cities page prints a road
distance and a flight distance; the smaller figure is the flight distance
(Eugene 92.34, Medford 95.10, Portland 186.86, Coos Bay 19.59, Coquille 11.79
miles). None is published, and none is mixed into a road claim.

**O13 — any claim that a named restaurant or lodging property is currently
trading.** F2's caveat and the `DataGuide` rule. The sources establish that the
venues exist, what they serve and, for two of them, where in the property they
sit. Nothing more is written, and the guide says so in the prose.

**O14 — any historic-designation claim.** E12: the verifier found no NRHP or
historic-preservation listing either, and records the absence as an absence, not
as a negative finding. Nothing is published in either direction.

**O15 — every photo.** `guide.photos: []` and `photos: []` on all nine places.
No photo scout has run for this state, and the licence gate requires any
referenced photo to exist on disk. A state with no freely licensed photo ships
none rather than padding.

**O16 — McKee's Pub's "located next to main lodge."** F2 confirms the descriptor
exists, but "next to" is a vague relation, not a checkable one, and the
`next door` family is exactly what the proximity gate bans. The venue and its
offering — traditional pub fare — publish; the location does not. The two
retained spatial descriptors (Pacific Grill, The Gallery & Puffin Bar) each name
a specific building, which is checkable.

**O17 — a street address for any place.** No verdict establishes one. See §2.

---

## 4. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures.** No allowlist entry was added; `Ethos.GolfProse`'s
allowlist remains `[]`.

The gate passed on the first run, but only because two phrasings were caught in
drafting and rewritten. Both were verified against `Ethos.GolfProse.patterns/0`
directly, because a rule you avoided without testing is a rule you cannot prove
you avoided:

| Draft phrasing | Gate result | Shipped instead |
|---|---|---|
| `just 25 miles north of the resort` | **fires** — `["north of the resort"]`, proximity pattern 5 | `just 25 miles north of Bandon Dunes Golf Resort` — the resort's own words, and naming the facility rather than "the resort" satisfies the pattern's requirement that a direction be relative to a *named* feature |
| `a short drive from Coos Bay` | **fires** — `["short drive"]`, duration pattern 8 | `Coos Bay is 24 miles northeast on US-101` |

**The gate hole worth recording for the waves.** The source's own drive times —
`"Approximately a 2.5-hour drive from the resort"` and
`"Approximately a 3-hour drive from the resort"` — were tested against the
patterns and **return `[]`. Neither fires.** Pattern 6 requires
`\d+\s*hours?` and a decimal hour with a following noun slips both it and
pattern 11. These durations are absent from this file because **H6 and the §4
rule** excluded them, not because the gate would have. A wave that relies on the
gate to catch drive times will ship "approximately a 2.5-hour drive". Do not
widen the pattern without measuring it over the whole corpus first (the gate's
own moduledoc records four candidates rejected on measurement over 272 files) —
the durable defence is this trace, not the regex.

Confirmed to pass cleanly, as they should: `Bandon Dunes is just west of Highway
101`, `Coos Bay is 24 miles northeast on US-101`, `sited above the Pacific Dunes
pro shop`, `sited in the main lodge`, `All courses are walking only.`

---

## 5. Roster row

`priv/seed_data/golf_courses_roster.json`, the `oregon` row, resolved
all-or-nothing:

| field | value | verdict |
|---|---|---|
| `course` | `Pacific Dunes` | A2/A4 — and it exactly equals the `name` of the seeded `golf-course` place, which the attribution test checks |
| `facility` | `Bandon Dunes Golf Resort` | B2, D1 |
| `city` | `Bandon` | B4 |
| `county` | `Coos County` | B1 |
| `access` | the C2 correction, condensed | C2, C3, C7 |
| `criterion` | `ranking` | A1–A5 |
| `ranking_source` | `Golf Digest Best in State` | A1 |
| `ranking_edition` | `2025-'26` | A2 |
| `ranking_position` | `1` | A2 |
| `second_course` | `Bandon Trails` | G1 |
| `verified` | `true` | |

**Correction:** this row originally recorded `ranking_source` as `Golf Digest
Best in State, Oregon` and `ranking_edition` as `2025-'26 (25th edition)`. A
verifier fetching the ranking page directly found "25th edition" does not
appear on it — an unsourced descriptor riding along with a confirmed fact —
so it was dropped, and the source name was brought in line with the other
resolved rows. See `docs/golf/00-ranking.md` §7. The roster JSON has been
corrected to match; nothing else in this row changed.

`MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_courses_roster_test.exs
--include pending_golf` — **6 tests, 1 failure.** The attribution test now
passes, having something to check for the first time. The exhaustion test fails
naming the other 49 states. **That failure is correct** and is the visible
remainder of the work.

Full suite: **763 tests, 0 failures, 6 excluded** — the baseline, unchanged.

---

## 6. What is absent from the whole file

* **No trip duration of any kind.** Every distance is a road mileage with a
  compass direction, and where a route is defensible, a road number.
* **No vague proximity.** Two spatial descriptors ship, both sourced and both
  naming a specific building; one was dropped for being vague (O16).
* **No price without the source's own date.** Every figure sits under the
  resort's own `2026` heading, and the Oregon Resident rate carries the
  condition the source attaches to it.
* **No trading claim for any of the nine places**, stated in the prose rather
  than left to be inferred.
* **No inference published as a citation.** The Audubon rider (O6), the
  membership claim (O7), the resort-guest booking window (O4) and the co-hosting
  parity (O8) were each a true-sounding sentence that no fetched page states.
  All four are the same failure mode, and all four are out.
