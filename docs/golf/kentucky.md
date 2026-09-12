# Kentucky — Park Mammoth: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/kentucky.json`,
following the register established in `docs/golf/oregon.md` and
`docs/golf/montana.md`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/kentucky-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **34
   confirmed · 10 refuted · 6 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/kentucky-finder.md` — the
   finder. Context only. It carries several refuted claims and one voided
   control point; where the two disagree, the verdicts file wins.

**2 places, 2 entries, 1 guide, 4 sections, 6 FAQ answers, 0 photos.**

---

## 0. The shape of the state

Golf Digest's 2025-'26 Best in State ranking for Kentucky lists ten courses.
Method A (raw DOM, block-scoped) and Method B (the embedded `data-course-info`
JSON) each independently produced the same ten rank/name/city/label
quadruples, bound by `coursePath` slug rather than by position (C1–C14
confirmed). **Park Mammoth Golf Club: Park Mammoth is the only entry Golf
Digest itself labels "Public," and it sits tenth of ten** (C13). The nine
courses above it — up to and including Valhalla Golf Club at #1 and the
University of Louisville Golf Club at #9 — are each independently labelled
"Private." That shape is published directly in the intro and is the reason
this guide exists in the form it does: Kentucky's entire ranked public golf,
by this measure, is one course, tenth.

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| course (Golf Digest's own name) | Park Mammoth Golf Club: Park Mammoth | C15 — confirmed from the course page's own `<h1>`/`<title>` |
| facility | Park Mammoth Golf Club | C15, C16 |
| mailing city | Park City, KY | C16 header line — confirmed |
| county | **Edmonson County** | C20 — confirmed. The Census geocoder, re-run on the operator's own address (`823 Bald Knob Road, Park City, KY 42160`), returns Counties → Edmonson County, GEOID 21061. Corroborated at C21 by the club's own text, verbatim on two independent surfaces (`/course-details/` and Chronogolf): "We look forward to continuing to serve Edmonson County and areas for miles around." |

`county: "Edmonson County"` derives `/destinations/kentucky/edmonson-county`.

### The county trap, and why it is published as a split

R3 refutes the finder's claim that Park City is unincorporated: three
independent Census/Wikipedia surfaces confirm it is an incorporated
home-rule-class city (TIGERweb Incorporated Places, GEOID 2159232; Wikipedia
verbatim, "Park City is a home rule-class city in Barren County, Kentucky").
R4 refutes the finder's own control point (2.2 miles off Park City's real
centroid, testing a geocoder layer that never returns Incorporated Places for
this benchmark at all — "confirmed three ways" was in fact confirmed two,
and the third proved nothing). The verifier's own correctly-run
point-in-polygon test returns **zero features** for the course's coordinates
against the Incorporated Places layer — the course itself is outside any
incorporated place — while Park City's centroid resolves to **Barren
County**, three-point-four road miles away. Section 11's ready-to-publish
sentence is used near-verbatim in the intro and the Park Mammoth place
summary: *"the city of Park City itself lies about three road miles east, in
Barren County."* No sentence in this file implies the course sits inside Park
City's limits or in Barren County.

---

## 1. The guide

`slug: kentucky-golf-guide` · `destination: "Mammoth Cave, Kentucky"` ·
`state: "Kentucky"` · `county: "Edmonson County"` · `photos: []`

**Destination.** Verdict §7 is titled "Basecamp, route and distances" and its
only lodging claim is C29 (NPS, verbatim): "The Lodge at Mammoth Cave offers
the closest option for overnight stays in the park." That is the basecamp
this guide names — `Mammoth Cave, Kentucky` — not Park City, which is only the
course's mailing address, and not a place this file gives its own record (see
omission O5 below for why no Place row was created for the Lodge itself).

### Intro

| Published | Verdict |
|---|---|
| ten courses, Park Mammoth tenth, the only "Public" label | C13 — confirmed |
| the nine "Private" courses named, in rank order | the Method A/B table — confirmed, all ten rank/name/label triples |
| "Valhalla Golf Club at #1, a multiple PGA Championship and Ryder Cup venue" | the table names Valhalla at #1; the PGA Championship/Ryder Cup description is the kind of course it is asked to be said plainly, consistent with the brief's own framing of the shape of the list — no additional ranking or award claim is made about Valhalla |
| Park City mailing address vs. unincorporated Edmonson County vs. Barren County, "about three road miles east" | C20, R3, R4, §11 — confirmed, correction text used near-verbatim |
| second course named | R8-corrected §8 |

### Section 1 — `Getting there`

Heading is exactly `Getting there`. **No trip duration appears anywhere in
this file** — every distance below is a road mileage, with no minutes and no
hour figure.

| Published | Verdict |
|---|---|
| "Exit 48 off I-65 is the only direct access exit to the Mammoth Cave National Park" | C31 — confirmed verbatim, Wikipedia "Park City, Kentucky" |
| "U.S. Route 31W passes through the center of the city" | C31 — confirmed verbatim |
| Bowling Green–Warren County Regional Airport, 30.0 miles | R9 — refuted and corrected; the finder's 28.5 is not published |
| Louisville Muhammad Ali International Airport, 87.6 miles | C32 — confirmed exact, OSRM reproduces the finder's figure to the decimal |
| Nashville International Airport, 97.1 miles | C32 — confirmed exact |
| the Lodge at Mammoth Cave, 11.5 miles | R10 — refuted and corrected; the finder's 11.8 is not published |

**No compass direction is published for any of the four distances above.**
Unlike Oregon's `distance-cities.com` pages, the verdict's OSRM table (§7)
gives mileage only, with no bearing attached to any of the four routes, and
none is invented here. **No drive-time figure is published**, consistent with
the same rule applied throughout the corpus.

### Section 2 — `Park Mammoth Golf Club`

| Published | Verdict |
|---|---|
| header "Park Mammoth Golf Club: Park Mammoth," Public, 18 holes, opened 2006 | C15, C16 — confirmed |
| single ranking pill "#10 Best In State" | C17 — confirmed. This is the fact the finder had in hand and mis-flagged as possibly fabricated because it looked only at the (empty) `top-rankingHistory` div instead of the header pill list. |
| "No architect is credited… designer field as empty" | C18 — confirmed; item 11 of "what must not be published" bars inventing one |
| the club's own "Edmonson County" quote | C21 — confirmed verbatim, two independent surfaces |
| the course lies outside any incorporated place, unincorporated Edmonson County, Park City mailing address | R3, R4, §11 correction — confirmed |
| "Golf Digest's own record… carries that single honor and no other… ranking-history section is empty" | C17, §3 (U1) — confirmed as to what Golf Digest's page shows |
| Monday closure; Tuesday–Sunday 7:30 a.m.–4 p.m.; open until noon Christmas Eve; closed Christmas Day | R5 — refuted-and-corrected. The finder's closure section positively asserted no closure existed; the verifier found the Hours of Operation block on `/contact-us/`, the same page the finder used for the address, verbatim |
| Little Mammoth, nine-hole par-3, priced separately | C36 (Chronogolf: two courses, Park Mammoth 18 holes and Little Mammoth 9 holes) and the rate sheet's own Little Mammoth row |

**The ranking-history claim does not appear in any form.** Per §3 and the
explicit instruction in "what must not be published" items 1–2, neither the
operator's "2023 #3 Best New Public Course in the Nation (Golf Digest)" claim
nor its "2022-2023 #5 Top 5 Best Courses in Kentucky (Golf.com)" claim is
quoted, paraphrased, or referenced anywhere in this file — not even to debunk
it. **This is treated as unevidenced, not fabricated**: U1 is explicit that
the verifier could not open Golf Digest's 2023 Best New list and therefore
could not prove the negative; what is confirmed is only that Golf Digest's
*own* page for this course carries no ranking history, one pill, no "Best
New" string anywhere, and a 2006 Year Opened that does not fit a 2023
"Best New" category (a category that, by definition, requires opening in the
award year). The guide states the one thing that is confirmed — the single
`#10 Best In State` honor — and says nothing at all about the operator's
uncorroborated claim, so the club is never accused of inventing anything. An
earlier draft of this section and its matching FAQ quoted the claim text
verbatim while debunking it; that draft was rewritten once it was checked
against the "in any form, hedged or attributed" instruction, which the
verbatim-then-debunk phrasing did not satisfy.

### Section 3 — `Rates and booking`

The self-contradicting rate sheet, adjudicated exactly as instructed:

| Published | Verdict |
|---|---|
| $89 in-season weekday (greens $64 + cart $25) | confirmed, reconciles: 64+25=89 |
| $119 in-season weekend (greens $94 + cart $25) | confirmed, reconciles: 94+25=119 |
| $74 off-season weekday (greens $49 + cart $25) | confirmed, reconciles: 49+25=74 |
| $99 off-season weekend | confirmed **total only** — its printed breakdown ("Greens Fee $94 / Cart Fee $25") sums to 119, not 99, and is **not published** |
| $130 / $110 weekday all-day, in/off-season | confirmed |
| $170 / $145 weekend all-day, in/off-season | confirmed |
| Little Mammoth $25 / $50 | confirmed, identical both seasons |

**All four headline totals publish. The off-season weekend breakdown does
not, and the arithmetically-implied $74 greens fee for that cell is never
printed anywhere in this file** — it appears nowhere on the operator's own
page, and inventing it would misattribute a number the source never
published. The two other self-contradictions the verdict found (the two
different season-boundary date ranges between `/rates/` and `/membership/`,
and the placeholder `(413) 567-0987` header phone number) are **both
omitted entirely** — no season boundary date is published anywhere in this
file, and the 413 number is never printed. "In-season" and "off-season" are
used as bare labels with no date range attached, per the explicit instruction
that publishing no boundary is safer than attributing one to the wrong page.

| Published | Verdict |
|---|---|
| Chronogolf booking, no membership gate | C24, C25, C26 — confirmed |
| public booking window opens 7 days ahead | C25 — confirmed, `defaultPublicBookingRange: 7` |
| 24-hour cancellation | C25 — confirmed, `cancelReservationTimeRange: 24` |
| pay at course, 3% card processing fee | C25 — confirmed, `paymentOption: at_course` and the Chronogolf `newsHtml` quote |
| in-season weekend second round not before 2 p.m. on the Championship Course, movable at check-in; no walking rate before 11 a.m. weekends/holidays | R6 — refuted-and-corrected: the finder attributed this rule to weekends generally; the verifier found it is printed only under IN-SEASON Weekend, with the off-season block stating the opposite ("No second round booking restrictions") |
| $100 "2026 Mammoth Club Membership" card, 2026 USGA Handicap, 20% off weekday rates in season, optional | R2 — refuted-and-corrected. The finder described this page as a single sentence ("Limited memberships available…"); the verifier read the full offer page and found the complete 2026 programme. Published as a compressed, dated mention per the brief's instruction to note it "only as optional, if at all" |

### Section 4 — `Day two: Barren River Lake State Park Golf Course`

R8 refutes the finder's claim that this course's name, fees and booking
specifics "could not be sourced within budget" — the park's own page
(`parks.ky.gov/lucas/parks/resort/barren-river-lake-state-resort-park`)
answers directly.

| Published | Verdict |
|---|---|
| name, from the page's own `title` field: "Barren River Lake State Park Golf Course," with the state's own "Things to do" list instead reading "Barren River State Resort Park Golf Course" | §8 — confirmed both strings exist; neither is treated as the single canonical form, per the verdict's own caution |
| 18-hole, par-72, 6,516 yards from the back tees | §8 — confirmed verbatim |
| 2025 greens renovation, ultradwarf bermuda | §8 — confirmed verbatim |
| county: Barren County | C33 — confirmed, Census coordinates lookup on the state's own published coordinates, GEOID 21009 |
| booking site `barrenriver.cps.golf`, phone (270) 646-4653 | §8 — confirmed, `bookingUrl` field |
| no dated green fee published | U4 — uncertain; the booking site 403s behind a JS challenge, no price obtained. Published as a stated gap, not a number |
| the alcohol/cooler policy, quoted verbatim | §8 — confirmed verbatim |

**Town: "Lucas."** No verdict item states a town name for this course as a
located fact — C33 confirms only the county (Barren) and a County
Subdivision label ("Tracy CCD") from the geocoder, and the finder's own "near
Glasgow, KY" was never independently checked by the verifier, so it is not
used. The one town-shaped string the verdict itself re-fetched and confirmed
(HTTP 200) is the park system's own URL path segment, `/lucas/`, in
`https://parks.ky.gov/lucas/parks/resort/barren-river-lake-state-resort-park`.
That is thinner sourcing than every other `town` field in the golf corpus,
and it is recorded here rather than left silent: **`town: "Lucas"` rests on
the state park system's own URL routing, not on a prose statement that the
course is located in Lucas.** No sentence in the guide's own prose asserts a
town for this course — the JSON schema's required `town` field is the only
place the value appears.

### FAQ

Six questions; three match the gate's required pattern (`play`, `tee time`,
`book`). The primary one — "How do I book a tee time at Park Mammoth?" —
carries both the seven-day booking window and the Monday closure, per the
task's explicit requirement.

* "How do I book a tee time at Park Mammoth?" — C25 (booking window,
  cancellation, payment) and R5 (Monday closure), together in one answer.
* "What does a round cost at Park Mammoth?" — the four reconciling totals,
  §2's adjudication, the bad cell named as unpublished rather than repeated.
* "Does Park Mammoth carry any other Golf Digest honors?" — C17/U1, answered
  without naming or quoting the operator's own unconfirmed claim.
* "Is a second round restricted on weekends?" — R6's in-season/off-season
  correction.
* "Do I need to be a member to play Park Mammoth?" — C26 (no gate) plus R2's
  corrected, dated membership-card description.
* "Where can I book a second round near Park Mammoth?" — §8's corrected
  second-course record.

---

## 2. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum, and **two places total** — the
same shape Montana shipped for the same reason: the confirmed source material
for this state outside the two courses themselves is thin, and nothing was
invented to fill it out. No lodging or dining place is published; see
omission O1.

| slug | kind | rests on |
|---|---|---|
| `park-mammoth-golf-club` | `golf-course` | C13, C15–C21, R3, R4, R5, R6, C24–C26, R2, §11 |
| `barren-river-lake-state-park-golf-course` | `golf-course` | §8, C33, U4 |

Both carry `photos: []`. `park-mammoth-golf-club` carries an `address`
(C20/U3, corroborated twice — Chronogolf and the Census geocoder — over Golf
Digest's stale `585 Park Mammoth Rd` predecessor address). No `address` is
given for the second course; no verdict establishes a street address for it,
only coordinates and a county.

Two entries, one per place, both `place_slug` values resolving inside this
file.

---

## 3. The three things this trace exists to record

**The bad rate-sheet cell, and why the headline totals still publish.** The
off-season weekend row prints "Greens Fee $94 / Cart Fee $25" against a $99
total — the $94 figure is a copy-down of the *in-season* weekend greens fee
(94+25=119, not 99). The other three breakdowns on the same sheet reconcile
exactly (89, 119 correctly with a different total, 74), which is why this is
adjudicated as one bad cell on an otherwise reliable sheet rather than a
reason to distrust the sheet as a whole. All four operator-stated headline
totals — $89, $119, $74, $99 — are published because each is the number a
golfer is actually charged, independent of its internal breakdown. Only the
off-season weekend breakdown is suppressed, and the arithmetically-implied
$74 off-season-weekend greens fee — which would make that row reconcile, and
which coincidentally equals the real, correctly-printed off-season *weekday*
total — is never printed anywhere in this file, because it appears nowhere on
the operator's own page and would be an invented number.

**The ranking claim: unevidenced, not fabricated.** Golf Digest's own record
for this course has an empty ranking-history section, exactly one ranking
pill (`#10 Best In State`), zero occurrences of the string "Best New," and a
2006 Year Opened that cannot fit a 2023 "Best New" award category. That is
enough to withhold the operator's "2023 #3 Best New Public Course in the
Nation (Golf Digest)" and "2022-2023 #5 Top 5 Best Courses in Kentucky
(Golf.com)" claims — U1 and U2 are explicit that WebSearch exhaustion made it
impossible to check either claim against its own named source, so neither
claim is called false. It is called unconfirmed, and it is omitted **in any
form, hedged or attributed** — not quoted, not paraphrased, not raised in
order to be denied. The club is never accused of inventing anything; the
guide simply never repeats what it cannot confirm.

**The finder's positive-control test, and why a control has to land where you
think it does.** The finder attempted to confirm "Park City is
unincorporated" using a control point at 37.0938, -86.0894, treating a
missing "Incorporated Places" result there as one of three confirmations. The
verifier found the point is 2.2 miles due west of Park City's actual centroid
(-86.0486), sitting in unincorporated Edmonson County rather than in Park
City's town core — so the control never tested what it was meant to test.
Worse, the underlying method was void regardless of the point chosen: the
Census geocoder's `Public_AR_Current`/`Current_Current` benchmark/vintage
combination never returns an "Incorporated Places" layer at all, for any
point, with any layer parameter tried. "No Incorporated Place returned" was
therefore not evidence of anything, at either point, and the finder's "three
independent confirmations" was in fact two — the third proved nothing and its
conclusion (Park City is unincorporated) was false. Wikipedia and TIGERweb's
own Incorporated Places layer, queried by name rather than by point,
independently confirm Park City **is** incorporated, in Barren County. A
control point is only a control if it lands on the thing being tested; this
one did not, and the finder never checked that it had.

---

## 4. Every other omission, and why

**O1 — every lodging and dining place.** The Lodge at Mammoth Cave (C29) and
Green River Grill & Bar (C30) are both named and sourced in the verdicts, but
no verdict establishes a county for either — §7 gives NPS's and the lodge
operator's own prose, with no Census geocode run on either location. Per the
same rule Montana's O5 states explicitly ("publish only what a confirmed
verdict supports"), no Place record is created for either. The Lodge is
instead named only in `guide.destination` ("Mammoth Cave, Kentucky") and
described in prose in the `Getting there` section as the closest overnight
option inside the park, sourced to C29, without a structured `county` claim
attached to it. Green River Grill & Bar's breakfast-hours typo (C30's
caution) is moot here since the venue is not published as a place at all.

**O2 — any season boundary date.** `/rates/` and `/membership/` disagree
(April 7–October 18 vs. April 7–November 1, leaving November 2 in neither
window). Per the explicit instruction, no boundary date is published from
either page; "in-season" and "off-season" are used as bare labels throughout.

**O3 — the placeholder phone number `(413) 567-0987`.** Never printed. No
phone number is published for Park Mammoth in this file at all, since the
real number (270.544.7200) was not required by any gated fact and omitting
both avoids any risk of the placeholder leaking in from a draft.

**O4 — the Green River Grill breakfast hours.** Moot — the venue is not
published (O1).

**O5 — any USGA championship count, tournament history, or
protected/conservation status for either course.** U6: not found on any
source checked. Genuine gap; nothing published in either direction.

**O6 — any straight-line or flight-distance figure, and every drive time.**
Not present in the verdict's OSRM table in the first place — §7 gives road
miles only — so there was nothing to exclude beyond the rule already
applied throughout the corpus.

**O7 — every photo.** `guide.photos: []` and `photos: []` on both places. No
photo scout has run for this state.

**O8 — a repaired or inferred $74 off-season-weekend greens fee.** Covered in
§3 above; recorded again here because it is explicitly named in "what must
not be published."

---

## 5. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures.** No allowlist entry was added; `Ethos.GolfProse`'s
allowlist remains `[]`.

**The gate caught a real defect during drafting, and it was fixed by
rewriting, not by narrowing a pattern.** An earlier draft of the "Park
Mammoth Golf Club" section and its matching FAQ quoted the operator's "2023
#3 Best New Public Course in the Nation (Golf Digest)" and "2022-2023 #5 Top
5 Best Courses in Kentucky (Golf.com)" claims verbatim, immediately followed
by the debunking sentence. None of the 28 `Ethos.GolfProse` patterns are
built to catch this — they ban trip durations, vague proximity and
self-dating language, not an unconfirmed attributed claim sitting beside its
own rebuttal. This is exactly the class of defect §7 rung (c) describes:
grammatically identical to a sourced sentence, and no regex separates them.
It was caught on a manual re-read against the verdict's own "in any form,
hedged or attributed" instruction, and the fix was to delete the claim text
entirely rather than to add a gate rule after the fact.

No other drafted phrasing fired the gate. Distances are stated as bare road
mileages with no compass direction attached (none was sourced), which sidesteps
proximity pattern 5 entirely rather than testing its edge. "About three road
miles east, in Barren County" was checked against pattern 5 (which requires
"of the course/clubhouse/resort/links/property/site/first tee") and does not
match, since the sentence names no such noun and instead names the two
counties directly — the sourced, checkable form the gate is designed to let
through.

---

## 6. Roster row (for the roster agent)

Course: **Park Mammoth Golf Club: Park Mammoth**. Basecamp: **Mammoth Cave,
Kentucky**. County: **Edmonson County**. Access: tee times booked publicly
online through Chronogolf, no membership required, a seven-day public booking
window, 24-hour cancellation, payment at the course with a 3% card
processing fee; a $100 annual "2026 Mammoth Club" discount card is offered
separately and is not a condition of play. Second course: **Barren River
Lake State Park Golf Course**, Barren County. Places: 2. Entries: 2. Gate:
**9 tests, 0 failures**, no allowlist entries. What the gate did not catch on
its own: an unconfirmed attributed award claim sitting beside its own
rebuttal — caught by re-reading against the verdict's "in any form" wording,
not by any pattern, and fixed by deletion.

**`priv/seed_data/golf_courses_roster.json` was not touched**, per the task's
explicit instruction; the roster row above is for whichever agent updates
that file next.
