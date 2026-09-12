# Missouri — Ozarks National: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/missouri.json`,
following the register `docs/golf/oregon.md` established.

**This file is committed on purpose.** The research artifacts live under
`.superpowers/`, which `.gitignore` excludes. A year from now this file is the
only thing that can answer "where did that sentence come from".

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/missouri-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **39
   confirmed · 9 refuted · 3 uncertain (51 adjudicated).**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/missouri-finder.md` — the
   finder. Context only. It carries nine refuted claims and two fabricated
   quotations; where the two disagree, the verdicts file wins.
3. `priv/seed_data/golf/oregon.json` / `docs/golf/oregon.md` — the structural
   and register template this file and the seed data copy.

**The governing rule:** a verdict vouches only for what its own text restates,
not for every clause of the sentence the finder wrote around it.

**The refuted-with-correction rule:** where a verdict is `refuted` but supplies
a correction naming what may still be published, that correction's text ships
**verbatim** (or as close to verbatim as fitting it into a guide's prose
allows) and nothing else from the item does.

**7 places, 7 entries, 1 guide, 6 sections, 5 FAQ answers, 0 photos.**

---

## 0. The two corrections that decided the whole file

### The closure the finder missed entirely

The finder (§5 of missouri-finder.md) reported only the aeration closures —
8–10 September 2026 (recovery 11–20 September) and the spring 26–27 March
window. The **verifier found a second, independent closure the finder never
looked for**: Big Cedar's own 2026 rate table on `bigcedar.com/golf/` lists
both Ozarks National and Buffalo Ridge as `Closed` for an **off-season**
window, 1 January – 5 March and 7 – 31 December. Both closures are published,
in the intro, in their own dedicated section (`The closures`), on both
`golf-course` place records, and in two separate FAQ answers — one of which is
the FAQ entry the gate requires (matching `play|tee time|tee times|book`).
Today is 5 September 2026: the aeration closure is three days away, which the
guide states explicitly rather than leaving to the reader to compute.

### The resort trap: fame points at Payne's Valley, the criterion does not

Golf Digest's Missouri list ranks three Big Cedar Lodge courses, all labelled
`Public`: Ozarks National at #3, Payne's Valley (the Tiger Woods design, the
resort's most publicized course) at #7, and Buffalo Ridge at #8. Ranks #1 and
#2 (St. Louis Country Club, Bellerive Country Club) are both `Private` and
cannot anchor a "highest-ranked public course" guide. The verdict confirms all
three ranks and labels individually (§2 of missouri-verdicts.md) and states
plainly: **"Ozarks National at #3 survives against Payne's Valley at #7. Fame
points at the Tiger Woods design; the criterion does not."** This guide is
about Ozarks National. Payne's Valley is named once, in the intro and once
more in an FAQ answer, each time explicitly as a sibling course ranked lower —
never as a place record, and never displacing the subject.

| Field | Value | Verdict |
|---|---|---|
| course | Ozarks National | verdicts §2, Method A/B/C — confirmed by three independent methods |
| facility | Big Cedar Lodge | verdicts §7 |
| rank / label | #3 / Public | verdicts §2 |
| second course | Buffalo Ridge | verdicts §2, §7 — #8, Public |
| mentioned-not-selected | Payne's Valley | verdicts §2 — #7, Public, explicitly ranked below Ozarks National |
| county | **Taney County** | verdicts §3 — re-derived from scratch by the verifier, not carried from the finder |

---

## 1. County and the incorporated-place question

`county: "Taney County"` on the guide and on every place. Both `golf-course`
places carry `town: "Hollister"` — the postal town on the operator's own
mailing address — but the guide is deliberately worded never to call Hollister
the administering municipality.

The verifier's method, restated in full because it is the cleanest piece of
method in the wave:

1. Re-sourced the coordinates independently rather than trusting the finder's
   figures: the Golf Digest course page's own JSON-LD gives
   `latitude":"36.56115036","longitude":"-93.19681775"`, matching the finder's
   numbers exactly.
2. Ran the US Census Bureau geocoder on that exact coordinate. It returned
   `Counties: Taney County` but **no `Incorporated Places` layer at all** — no
   entry, not an empty one silently skipped.
3. Because an absent layer could mean "not inside any incorporated place" or
   could equally mean "the query is broken and returns nothing useful here,"
   the verifier ran a **positive control**: the same geocoder, on a coordinate
   in downtown Branson (`x=-93.2185&y=36.6437`). That query returned
   `Incorporated Places: ['Branson city']` alongside `Counties: ['Taney
   County']`.
4. The control proves the layer works and appears when a coordinate is
   genuinely inside a municipality. Its absence at the Ozarks National
   coordinate is therefore a real finding, not a query defect: **the course
   sits in unincorporated Taney County, and "Hollister, MO" on its mailing
   address is a postal designation, not the administering incorporated
   place.**

This guide publishes that finding in three places: the `Getting there`
section, the `Where is Ozarks National?` FAQ answer, and implicitly by never
writing "the town of Hollister" or treating Hollister as a municipality
anywhere in the file. It does not overcorrect into silence — the postal
address "Hollister, MO 65672" is itself sourced (the course's own site,
corroborated by Golf Digest's JSON-LD `addressLocality":"Hollister"`) and
ships as exactly that: a postal address, not a place of jurisdiction.

---

## 2. The guide

`slug: missouri-golf-guide` · `title: "Ozarks National: Golf at Big Cedar
Lodge, Missouri"` · `destination: "Ridgedale, Missouri"` · `state: "Missouri"`
· `county: "Taney County"` · `photos: []`

**Why `destination` is Ridgedale, not Hollister.** The task instruction is
explicit: destination is the basecamp, "where a visitor sleeps." The course's
own postal address is Hollister, but the resort's own site-wide mailing
address — the one attached to lodging, dining and the property as a whole —
is `190 Top of the Rock Road, Ridgedale, Missouri 65739` (verdicts §7,
confirmed on the footer of both `/contact/` and the course pages). A visitor
sleeps at Big Cedar Lodge, whose own address names Ridgedale. Using Ridgedale
also keeps the guide from repeating the Hollister-as-municipality error the
verdicts spent an entire section refuting.

### Intro

| Published | Verdict |
|---|---|
| "places Big Cedar Lodge's Ozarks National third and labels it \"Public\" — the highest-ranked public course on the list, since the two courses ranked above it, St. Louis Country Club and Bellerive Country Club, are both Private" | verdicts §2 — confirmed exact ranks and labels for #1, #2, #3; "highest-ranked public" is a direct read of the published table, not an inference beyond it |
| "closed for autumn aeration from 8 to 10 September 2026, with recovery conditions through 20 September" | verdicts §1 — confirmed, raw HTML and WebFetch agreeing |
| "Buffalo Ridge, the resort's other Golf Digest-ranked public course, closes on the same three days" | verdicts §1 — confirmed |
| "Both courses also close for the off-season, from 1 January to 5 March and from 7 to 31 December" | verdicts §1 — confirmed, the closure the finder missed |
| "Bill Coore and Ben Crenshaw designed Ozarks National" | verdicts §7 — confirmed, two independent sources |
| "sits in Taney County on a Hollister, MO 65672 postal address, outside any incorporated municipality" | verdicts §3 — confirmed |
| "Payne's Valley, the Tiger Woods design, at #7, and Buffalo Ridge, by Tom Fazio, at #8 — both labelled Public and both ranked below Ozarks National" | verdicts §2, §7 — confirmed |

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`, no trailing mode. **No trip
duration appears anywhere in this section or this file.**

| Published | Verdict |
|---|---|
| Branson Airport, Branson Jet Center, Springfield-Branson National Airport named as air gateways | verdicts §6 — confirmed verbatim, refuting the finder's claim that no airport was named |
| Branson Airport (BKG) 4.4 miles by road | verdicts §6 — confirmed, OSRM over Nominatim-resolved endpoints |
| town of Branson 9.3 miles | verdicts §6 — confirmed |
| Springfield-Branson National Airport (SGF) 60.6 miles | verdicts §6 — confirmed |
| "the resort itself publishes only a minutes-based travel-time chart... not mileage" | verdicts §6 — confirmed; this sentence exists specifically so no duration is ever converted into a distance |
| incorporated-place absence and the Branson control test | verdicts §3 — confirmed, see §1 above |

No direction (north/south/east/west) is attached to any of the three OSRM
distances: the verifier's OSRM figures give distance only, not bearing, unlike
Oregon's distance-cities.com source which published both. Inventing a
compass direction here would be exactly the accretion failure this trace
exists to catch.

### Section 2 — `The closures`

Every sentence in this section is verdicts §1, confirmed by two independent
fetch methods (curl and WebFetch) agreeing exactly on both dates and both
scopes. The verbatim quotations — `"Open for the season."` and the aeration
date lines — are the operator's own words, reproduced exactly. "Today is 5
September 2026, so that closure begins in three days" restates the task's own
framing of urgency using the verdict's dated facts, not an invented claim.

### Section 3 — `Ozarks National`

| Published | Verdict |
|---|---|
| Bill Coore and Ben Crenshaw, designers | verdicts §7 — confirmed |
| grand opening April 2019, Bass Pro Shops Legends of Golf Tournament, log cabin clubhouse acquired January 2019 | verdicts §7 — confirmed from the operator's own "Behind the Design" timeline (six tabs, six panels, chronologically consistent) |
| 46th in America's 100 Greatest Public Courses (2025-'26) | verdicts §2 — confirmed, from the course's own Golf Digest page |
| 3rd Best in State, ranked since 2021, holding 3rd in both editions | verdicts §2 — confirmed |
| 155th Second 100 Greatest (2021-'22) | verdicts §2 — confirmed |
| Ozarks tees 73.9/131, 7,036 yards, par 71 | verdicts §7 — confirmed, scorecard PDF |
| the Mickelson sentence, attributed explicitly to the resort's own marketing and flagged as uncorroborated | verdicts §8, item 1 — **uncertain**. The verdict's instruction is "publish only if corroborated by the tour, or attribute it explicitly to the resort; do not assert it as fact." This guide takes the second option: the claim is quoted, attributed by name to "the resort's own site," and followed immediately by "that claim comes from the operator's own marketing copy and has not been independently corroborated here." |

**Deliberately not published in this section:** any "Year Opened" field
attributed to Golf Digest. The verdict is explicit (verdicts §7, refuted
item) that Golf Digest's course page carries no such field — only `Holes`,
`Price`, `Facility Type`, `Designer`, `Awards`. The year comes from the
operator's own timeline alone, and the guide's wording ("The operator's own
'Behind the Design' feature dates the grand opening to April 2019") makes the
single source explicit rather than implying two sources agree on a field one
of them does not have.

**Deliberately not published anywhere:** any protected-land or conservation
designation. The verdict found only marketing language ("Coore & Crenshaw
share Johnny Morris' passion and appreciation for nature and conservation")
and no formal designation. Omitted rather than characterized, since it adds
nothing beyond what the guide already establishes about the designers. See
omission O5.

### Section 4 — `Playing it as a day guest`

The access paragraph is the verdict's §4 correction, condensed into guide
prose with every element retained:

> A visitor not staying at the resort can book Ozarks National up to 30 days
> ahead — or up to 60 days ahead for a round falling between 15 June and 15
> August — through the resort's booking portal at book.rguest.com or by
> calling 1-800-225-6343. Guests staying at Big Cedar Lodge book by telephone
> instead, which is the only channel that carries the resort-guest rate.

This is exactly the verdict's own "publishable text" from §4, unedited. It
deliberately avoids the finder's two errors: the invented quotation "30 days
for other periods" (never on the page) and the finder's mischaracterization
that the 15 June–15 August window governs only booking rather than also
qualifying the date of play.

The green-fee paragraph is verdict §5's correction, unedited:

> Big Cedar Lodge publishes its 2026 green fees by season... In peak season,
> 13 April to 25 October, a round at Ozarks National starts at $350 for the
> public and at $275 for resort guests; juniors of 17 and under pay $75. In
> shoulder season, 6 March to 12 April and 26 October to 6 December, the
> public rate is $215 and the resort-guest rate $190. The course is closed in
> the off-season.

| Published | Verdict |
|---|---|
| 30 days / 60 days (15 June–15 August) booking window | verdicts §4 — confirmed |
| booking portal book.rguest.com, phone 1-800-225-6343 | verdicts §4 — confirmed |
| resort guests book by phone only, for the resort rate | verdicts §4 — confirmed |
| Peak $350 public / $275 resort / $75 junior, 13 Apr–25 Oct | verdicts §5 — confirmed, **dated by the source's own 2026 table**, the only condition under which the price publishes |
| Shoulder $215 public / $190 resort, 6 Mar–12 Apr & 26 Oct–6 Dec | verdicts §5 — confirmed |
| local rate to residents of listed counties including Taney, ID/proof of residence required | verdicts §5 — confirmed verbatim, and ties back to the county finding in §1 above |

**Deliberately not published:** Golf Digest's own price field ($525 live,
$325 in an October 2025 snapshot). The verdict is explicit that this figure is
undated, self-inconsistent, and actually the resort's Payne's Valley rate, not
Ozarks National's. Using the operator's own dated $350 figure instead.

**Deliberately stated as a floor, never as an exact price.** "Starting at
$350" is the operator's own wording (verdicts §8, item 3, uncertain as an
exact figure). The guide never writes "the green fee is $350" — every
occurrence keeps "starts at."

### Section 5 — `Buffalo Ridge, the second course`

| Published | Verdict |
|---|---|
| #8, Public | verdicts §2 — confirmed |
| opened 2000, Tom Fazio, Branson Creek Golf Club | verdicts §7 — confirmed, operator's own six-tab timeline |
| Johnny Morris acquired the property 2013 | verdicts §7 — confirmed |
| unveiled as Buffalo Ridge **2014** | verdicts §7 — confirmed, and this is the exact correction of the finder's refuted "2013" claim |
| 2025 refresh: all 18 greens resodded, every greenside bunker redesigned | verdicts §7 — confirmed, newly reported by the verifier, not in the finder's file at all |
| same aeration closure dates as Ozarks National | verdicts §1 — confirmed |
| same off-season closure | verdicts §1 — confirmed |
| booked through book.rguest.com / 1-800-225-6343 | verdicts §4, §7 — confirmed access mechanism; **the finder's fabricated quotation** ("through the online reservation system at book.rguest.com or by calling 1-800-225-6343," attributed to the Buffalo Ridge page as verbatim text) is **not** reproduced. This guide states the same underlying fact — the portal URL and the phone number — in its own words, never inside quotation marks, exactly as verdicts §7 instructs. |

**Deliberately not published:** a specific green fee for Buffalo Ridge. The
verdict's rate table gives dated, dollar figures only for Ozarks National; no
Buffalo Ridge price row was fetched or verified. Naming a number for Buffalo
Ridge by analogy to Ozarks National's table would be an unsourced inference.
See omission O3.

### Section 6 — `Lodging and dining at Big Cedar Lodge`

| Published | Verdict |
|---|---|
| eight room products named, two at Falls Lodge (Premier King, Double Queen) | verdicts §7 — confirmed, all eight named room products verified on `/accommodations/lodge-rooms/` |
| eight dining venues named | verdicts §7 — confirmed, all eight verified on `/dining/` |
| "none of them says whether any given one is serving or open this week, so this guide makes no such claim" | the same no-trading-claim discipline `docs/golf/oregon.md` established, applied here because no verdict states current operating status for any venue |

### FAQ

Five questions. The gate requires one matching `play|tee time|tee times|book`;
the first question matches, and per the task instruction it carries **both**
closures in full.

* "How do I book a tee time at Ozarks National, and is it open right now?" —
  carries the aeration closure (with the "three days away" framing), the
  Buffalo Ridge same-day closure, the off-season closure for both courses,
  and the full verdicts §4 access paragraph. This is the FAQ entry the gate's
  regex matches.
* "Can I play Ozarks National in winter?" — restates the off-season closure
  specifically, so a reader asking exactly that question is not left to infer
  it from the aeration-focused first answer.
* "What does a round cost?" — verdicts §5, dated 2026 figures.
* "Where is Ozarks National?" — verdicts §3, the county/incorporated-place
  finding plus the three OSRM mileages.
* "Which course should I play on day two, and is Payne's Valley better?" —
  answers the resort-trap question head-on: names Payne's Valley, states its
  fame and its rank (#7), and states plainly that Buffalo Ridge, not Payne's
  Valley, is this guide's second course, because the ranking criterion —
  not popularity — governs the choice.

---

## 3. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum: the ranked course and one
second course. Payne's Valley is not a place record — see §0 above.

| slug | kind | rests on |
|---|---|---|
| `ozarks-national-big-cedar` | `golf-course` | verdicts §2, §3, §5, §7 |
| `buffalo-ridge-big-cedar` | `golf-course` | verdicts §2, §1, §7 |
| `falls-lodge-big-cedar` | `hotel` | verdicts §7 |
| `osage-restaurant-big-cedar` | `restaurant` | verdicts §7 |
| `truman-cafe-custard-big-cedar` | `cafe` | verdicts §7 |
| `buffalo-bar-big-cedar` | `restaurant` | verdicts §7 |
| `mountain-top-grill-big-cedar` | `restaurant` | verdicts §7 |

Every one of the seven has `photos: []`, as does the guide. See omission O4.

**No `address` field on any place.** The street name for the course itself is
contested across three sources (verdicts §8, item 2: "Golf Club Drive" per
the operator, "Buffalo Ridge Blvd" per the 2022 scorecard PDF, "Golf Club Dr."
per Golf Digest's JSON-LD) — city, state and ZIP agree, the street name does
not. Per the verdict's own instruction ("Publish 'Hollister, MO 65672' and the
county; do not assert a single street name"), no `address` field is set on
any place, and the guide's prose uses only "Hollister, MO 65672" without a
street name.

**Slugs are qualified with `-big-cedar`** specifically because this project
already publishes ballpark guides for St. Louis and Kansas City, and because
short, likely-to-recur names ("Buffalo Bar," "Falls Lodge") carry real
collision risk against a 5,000-plus-place corpus. A full-corpus slug scan
(every `priv/seed_data/**/*.json`) confirmed zero collisions for all seven
slugs before this file was written.

**`status: "open"` on all seven is not a trading claim**, per
`Ethos.Seeds.DataGuide`'s moduledoc, exactly as Oregon's trace records. The
no-trading-claim discipline is stated explicitly in prose (Section 6) rather
than left implicit.

Seven entries, one per place, all `place_slug` values resolving inside this
file — confirmed by the gate's own orphan test.

---

## 4. Every omission, and why

### The nine refuted claims

**O1 — the two fabricated quotations.** *Refuted, verdicts §4 and §7.* "30
days for other periods" and "through the online reservation system at
book.rguest.com or by calling 1-800-225-6343" are both strings the finder
wrote as quotations that do not exist verbatim on any fetched page. Neither
appears inside quotation marks anywhere in this file; the underlying facts
(the 30-day window, the portal, the phone number) are stated in the guide's
own words instead.

**O2 — "unveiled as Buffalo Ridge in 2013."** *Refuted, verdicts §7.* The
operator's own timeline distinguishes acquisition (2013) from unveiling
(2014). Published: "Johnny Morris acquired the property in 2013, and he and
Fazio unveiled the reborn course as Buffalo Ridge in 2014."

**O3 — a specific Buffalo Ridge green fee.** Not a verdict item directly, but
follows the same discipline: no rate-table row for Buffalo Ridge was fetched
or confirmed, only its shared off-season closure row. No number is invented
for it.

**O4 — every photo.** `guide.photos: []` and `photos: []` on all seven
places. No photo scout has run for this state.

**O5 — the conservation/protected-land marketing language.** Confirmed to
exist as marketing copy (verdicts §7), but establishes no formal designation.
Omitted as adding nothing beyond what the guide already says about the
designers, rather than published as an ambiguous half-claim.

**O6 — "Year Opened: 2019" attributed to Golf Digest.** *Refuted, verdicts
§7.* That field does not exist on Golf Digest's course page — verified in
archived raw HTML and two separate WebFetch reads. The year is sourced to the
operator's own timeline alone, and the guide's wording says so.

**O7 — "no airport is named."** *Refuted, verdicts §6.* The operator names
three airports by name. All three are published.

**O8 — Golf Digest's own price field ($525 / $325, undated).** *Refuted,
verdicts §5 / "What must NOT be published."* Contradicted by the operator's
own dated table and self-inconsistent across snapshots. Not published; the
operator's $350 peak-public figure is used instead.

**O9 — "America's Best Golf Resort by USA TODAY readers."** *Refuted,
verdicts "What must NOT be published."* Appears only on the resort's own
site; a business's own site does not establish an award. Omitted entirely.

### The three uncertain claims

**O10 — the Mickelson course-record claim.** *Uncertain, verdicts §8 item 1.*
Published only as an attributed, flagged claim from the resort's own
marketing — see Section 3 above — never asserted as an independent fact.

**O11 — the exact street address.** *Uncertain, verdicts §8 item 2.* No
`address` field is set on either golf-course place; only the undisputed city,
state and ZIP ("Hollister, MO 65672") are published. See §3 above.

**O12 — the exact peak green fee as a fixed number.** *Uncertain, verdicts §8
item 3.* Published as a floor, in the operator's own words — "starts at
$350" — never as "the green fee is $350."

### The rules-driven omissions

**O13 — every travel duration.** The operator's own Travel Time Chart
publishes only minutes between its own properties ("Ozarks National ... 22
Mins") and the line "within a day's drive for over one-third of Americans."
Neither is published, and no duration is converted into a distance anywhere
in this file. The three OSRM mileages (verdicts §6) are used instead, sourced
independently from Nominatim-resolved endpoints.

**O14 — a compass direction on any OSRM mileage.** The verifier's OSRM output
gives distance only, not bearing (unlike Oregon's distance-cities.com source,
which gave both). No direction is invented for Branson, BKG or SGF.

**O15 — any trading claim for any of the seven non-golf-course places.**
Stated explicitly in Section 6's prose rather than left to be inferred: the
sources establish that these rooms and venues exist and are named, nothing
about whether any one is serving this week.

**O16 — a `County:` field never actually on the fetched page.** Per the
verdicts' own warning (§3), county miscitation has recurred in prior waves of
this project. County is taken from the Census geocoder result on
independently re-sourced coordinates, corroborated by the positive control on
Branson — never carried over from the finder's assertion alone.

---

## 5. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, on the first run. No allowlist entry was added;
`Ethos.GolfProse`'s allowlist remains `[]`.

No duration or vague-proximity phrasing was drafted and then rewritten for
this file — the two disciplines that made the difference:

* Every distance in `Getting there` and the corresponding FAQ answer is a
  plain road mileage ("4.4 miles," "9.3 miles," "60.6 miles"), with no
  duration word and no direction word attached to a course/clubhouse/resort
  noun (the pattern that bans "north of the course").
* The operator's own minutes-based Travel Time Chart and its "within a day's
  drive" line are both omitted outright (O13), rather than rewritten into a
  duration-free paraphrase that risked reintroducing a banned pattern by
  accident.

As the Oregon trace records for its own corpus: the gate does not catch
"approximately a 2.5-hour drive"-style phrasing that crosses a hyphen in a
way none of the twenty-two patterns anchor on cleanly in every form, and it
cannot tell an unsourced containment claim from a sourced one written in the
same grammar. Neither situation arose in drafting this file, because no
duration of any kind was carried over from the operator's own site, and every
spatial claim here traces to a verdict item cited by name in §2–§4 above.

---

## 6. Roster row — values for the finalize agent

**`priv/seed_data/golf_courses_roster.json` was not touched by this task**, by
explicit instruction; a finalize agent owns it. The values below are what the
`missouri` row should resolve to, drawn only from what this file's places and
sections state:

| field | value | verdict |
|---|---|---|
| `course` | `Ozarks National` | verdicts §2 — matches the `name` of the seeded `golf-course` place exactly |
| `facility` | `Big Cedar Lodge` | verdicts §7 |
| `city` | `Hollister` | verdicts §3, §7 (postal town; see §1 above for the incorporated-place caveat) |
| `county` | `Taney County` | verdicts §3 |
| `access` | the verdicts §4 correction, condensed: 30 days ahead (60 days for 15 June–15 August) via book.rguest.com or 1-800-225-6343 for non-resort guests; resort guests book by phone only, at the resort rate | verdicts §4 |
| `criterion` | `ranking` | verdicts §2 |
| `ranking_source` | `Golf Digest Best in State` | verdicts §2 |
| `ranking_edition` | `2025-'26` | verdicts §2 |
| `ranking_position` | `3` | verdicts §2 |
| `second_course` | `Buffalo Ridge` | verdicts §2, §7 |
| `verified` | `true` | |

---

## 7. What is absent from the whole file

* **No trip duration of any kind**, including none of the operator's own
  minutes-based Travel Time Chart figures.
* **No vague proximity.** No direction word is attached to a course,
  clubhouse or resort noun anywhere in the file.
* **No price without the source's own date** — every dollar figure sits
  under the operator's own `2026` seasonal headings.
* **No trading claim for any of the seven places**, stated in the prose
  rather than left to be inferred.
* **Neither fabricated quotation.** Both are named and excluded by name in
  §4 above.
* **"Hollister" is never written as the administering municipality.** The
  positive-control method that established this is restated in full in §1.
* **No claim that Payne's Valley is the state's top public course**, and no
  claim that it displaces Ozarks National as this guide's subject.
