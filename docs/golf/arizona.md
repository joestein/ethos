# Arizona — Quintero Golf Club: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/arizona.json`,
copying the shape of `priv/seed_data/golf/oregon.json`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/arizona-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **48
   confirmed · 7 refuted · 7 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/arizona-finder.md` — the
   finder, second pass, concerns Quintero. Context only; where it disagrees
   with the verdicts file, the verdicts file wins.

**The governing rule:** a verdict vouches only for what its own text restates,
not for every clause of the sentence the finder wrote around it. Where a
verdict is `refuted` but supplies a correction, that correction's text ships
verbatim and nothing else from the item does.

**2 places, 2 entries, 1 guide, 7 sections, 6 FAQ answers, 0 photos.**

---

## 0. The wrong course, and why this is the most important thing this state produced

**The first Arizona research pass researched the wrong course entirely.** It
reported **We-Ko-Pa Golf Club: Saguaro** as Arizona's #1 "Public" entry on
Golf Digest's Best in State ranking. A verifier, working from raw Wayback HTML
of the full ranking page instead of a WebFetch summary, found:

- **#1 on the list is The Estancia Club — Private — Scottsdale.**
- **#2 through #15 are all labelled Private.**
- **We-Ko-Pa Golf Club: Saguaro is #20 — Public — Fort McDowell**, not #1.
- **The highest "Public"-labelled entry on the whole ranking is #16, Quintero
  Golf Club, Peoria.**

**Root cause:** `WebFetch` truncates and mis-orders golfdigest.com ranking
pages. The verifier records that asking WebFetch for #1–#25 on this exact
page "returned a truncated, mis-ordered list and hallucinated 'Sycuan Golf
Club: Wildhorse' — a California course — into the Arizona rankings." The first
pass never saw the true #1–#15, all Private, and so never saw that its subject
was not even the highest-ranked Public course. The fix that stuck: parse the
raw Wayback HTML of the ranking page directly, never WebFetch it.

Every fact this file publishes concerns **Quintero Golf Club** only.
Everything from the first pass about We-Ko-Pa is discarded — no sentence
about We-Ko-Pa appears anywhere below, in the guide, or in the places file.

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| course | Quintero Golf Club | Verdicts §1, "Selection re-check" — confirmed #16, highest "Public"-labelled entry |
| facility/operator | Troon (Troon Golf brand) | Verdicts §3, §4, §5 — confirmed throughout |
| town / jurisdiction | Peoria (Peoria city) | Verdicts §2 — confirmed via the Census geocoder's Incorporated Places layer, run on two independently sourced coordinate pairs |
| state | Arizona | throughout |
| county | **Maricopa County** | Verdicts §1 — confirmed via the US Census Bureau geocoder, run twice, once on Nominatim's coordinates for the course (33.8500825, -112.4190380) and once on Troon's own embedded coordinates (33.8394797, -112.4238394). Both independently return Maricopa County. |

The county claim is unusually well-defended here: the verifier deliberately
"guarded against a right answer on wrong coordinates" by checking two
independently sourced coordinate pairs, precisely because county miscitation
(a true fact citing a page that doesn't contain it) recurred in prior waves.
Neither the AZMAG PDF the first pass cited, nor anything the verifier didn't
fetch itself, is relied on here.

`county: "Maricopa County"` derives `/destinations/arizona/maricopa-county`.

**The jurisdiction/mailing-address distinction, as instructed:** the Census
geocoder's Incorporated Places layer — the municipal-jurisdiction layer, not
the postal layer — returns "Peoria city" for both coordinate pairs. That is
stronger evidence than a mailing address alone, and it is why `guide.town` and
`guide.destination` both use Peoria rather than treating "Peoria, AZ 85383" as
merely where the mail goes. The Census County Subdivision layer separately
returns "Wickenburg CCD" — a statistical subdivision, not a municipality — and
that is explicitly **not** published as the town (Verdicts, "must not
publish" #8).

---

## 1. The guide

`slug: arizona-golf-guide` · `destination: "Peoria, Arizona"` ·
`state: "Arizona"` · `county: "Maricopa County"` · `photos: []`

### Intro

| Published | Verdict |
|---|---|
| Quintero is #16 on Golf Digest's 2025-'26 Arizona Best in State ranking; #1–#15 all "Private"; #16 is the highest "Public" | Verdicts, "Selection re-check" and Uncertain U6's correction — confirmed |
| Golf Digest's course page: "Facility Type: Public" | Verdicts §3 — confirmed |
| Troon's course page: "Course type: Semi-private" | Verdicts §3 — confirmed, the human-visible string, preferred over the embedded JSON key per the verifier's own instruction |
| "this guide states the disagreement rather than choosing a side" | Task instruction, honoring both confirmed halves without resolving them |
| County and jurisdiction sentences | Verdicts §1, §2 — confirmed |

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`, no trailing mode. **No trip
duration appears anywhere in this file.**

| Published | Verdict |
|---|---|
| Troon's address: 16752 W Carefree Hwy, Peoria, AZ 85383 | Verdicts §Uncertain U1 — confirmed as Troon's own address |
| Club's address: 16752 W State Route 74, Peoria, AZ 85383 | Verdicts §Uncertain U1 — confirmed as the club's own address |
| "without asserting that the two names describe the same stretch of pavement" | Verdicts U1 explicitly: "publish both addresses as each source gives them, without the road-designation assertion" — the finder's claim that "Carefree Highway carries the AZ-74 designation in this stretch" is **not published**, per instruction |
| "51.3 miles from Phoenix Sky Harbor International Airport by road" | Verdicts, "WHAT MUST NOT BE PUBLISHED" #9: "'Less than one hour from Sky Harbor' — a duration, banned outright. Use 51.3 miles." This is the verdict's own instructed replacement figure, used exactly as given. |

No compass direction is published for the Sky Harbor leg, and no turn-by-turn
route is given: the only route detail the verdicts file itself endorses is the
51.3-mile figure. The finder's turn-by-turn (I-10, I-17, "West Carefree
Highway (AZ-74)") was never independently re-verified by the verifier and
repeats the same road-identity assertion U1 says not to make, so it is
omitted rather than reconstructed. See omission O1.

### Section 2 — `Public or semi-private`

| Published | Verdict |
|---|---|
| Golf Digest ranking-page fields, quoted verbatim: "Public / 16. Quintero Golf Club / Peoria, AZ / 3.9 / 29 Panelists / 100 Greatest Public / Best In State / Previous rank: 17" | Verdicts §3 — confirmed, from raw Wayback HTML |
| "Facility Type: Public" | Verdicts §3 — confirmed |
| "Course type: Semi-private" | Verdicts §3 — confirmed, the visible page text |
| "Accessible yet secluded, this semi-private golf club is located..." | Verdicts §3 — confirmed verbatim (quote truncated here deliberately at the point the duration clause would begin; see the "must not publish" note below) |
| "Quintero, a former private club, is a scenic and playable delight." | Verdicts §3 — confirmed verbatim, Golf Digest's own blurb |
| "the course's history as a former private club is the likely root of the disagreement" | Verdicts §3: "The disagreement is a live artefact of that history, not an error by either party." Restated in the guide's own words. |
| "#1 through #15 are all 'Private'" | Verdicts, "Selection re-check" — confirmed |

**Deliberate truncation, not an accident:** the Troon quote "this semi-private
golf club is located..." stops before the words "less than one hour
northwest of Phoenix Sky Harbor Airport in the high Sonoran Desert near Lake
Pleasant in the Hieroglyphic Mountains" — the duration clause banned outright
by the verdict. The Sonoran Desert / Lake Pleasant / Hieroglyphic Mountains
descriptive context was never independently re-confirmed by the verifier
outside that duration-bearing sentence, so none of it is published. See
omission O2.

### Section 3 — `Playing Quintero`

This section is built from the verdicts file's own closing block, "HOW DOES A
VISITOR BOOK IT?", which the verifier wrote as a ready-to-publish summary.

| Published | Verdict |
|---|---|
| "No membership is required to play Quintero — anyone may book." | Verdicts §4 — confirmed by absence of a membership gate plus Troon's `isBookable:true` |
| EzLinks engine at quintero2.ezlinksgolf.com, "Book Your Tee Time"; separate "Single Player" engine at quinteroazres1.ezlinksgolf.com | Verdicts §4 — confirmed from the anchors themselves |
| "Make a reservation for play up to 90 days in advance of your visit." | Verdicts §4 — confirmed verbatim |
| credit-card confirmation | Verdicts §4 — confirmed |
| "The course is open from 5:00 AM to 4:00 PM" | Verdicts, Refuted R7's correction — confirmed verbatim, **with "daily" dropped** per R7 ("'daily' NOT STATED... drop 'daily', quote the hours as printed") |
| Arizona-resident rate, 90-day window, ID required at check-in | Verdicts §4, Uncertain U3 — confirmed; U3 resolves the 90-vs-210-day conflict in favor of the club's own page |
| "the AZ Resident, NOT valid for the entire group" | Verdicts §4 — confirmed verbatim |
| "cancel at least 48 hours before the day of play... the full amount being charged to your card" | Verdicts §4, Uncertain U2 — confirmed verbatim; U2 resolves the 48-vs-24-hour conflict in favor of the club's own reservation-policy page |
| Groups of 12+, Mike Poe, (928) 501-1500 | Verdicts §4 — confirmed |

**Omitted from this section on purpose:** the tee-time scheduling detail
("tee times... scheduled in 10-minute intervals") is confirmed by the verdict
but is **not published** — it is banned unconditionally by
`Ethos.GolfProse`'s pattern 1, which fires on any numeral-minute phrase
regardless of travel context. This is a real, sourced, small loss of detail,
accepted rather than worked around; the gate was not weakened and no
allowlist entry was added. See omission O3.

### Section 4 — `Green fees`

| Published | Verdict |
|---|---|
| "Green fees (peak) $162 to $199," published 9 August 2026 | Verdicts, Refuted R2's correction: "the club's own stay-and-play page, published 9 August 2026... 'Green fees (peak) $162 to $199.' That is a first-party figure with the source's own date attached... Prefer it." **Per the task's explicit instruction, this is the figure published with its date.** |
| Early-morning tiered pricing, page last modified 24 June 2026: $162/$171 non-resident, $144/$153 resident before 8 AM; $188/$199 non-resident, $167/$178 resident at 9 AM | Verdicts, Refuted R2's correction — confirmed, exact figures, exact dating |
| "Rates are subject to change. Please see current pricing for resident, non-resident, single-player, and group tee times in our live booking app." | Verdicts, Refuted R2's correction — confirmed verbatim |

**What is not published, and why:** the "Summer Special" rates the first pass
would have used are refuted outright (R1, R2). The verdict is unambiguous:
"The banner is inside an HTML comment and never renders... 2021 markup,
commented out. Nothing about it was 'active at time of fetch.'" No rate in
this file is described as a summer rate, current standing rate, or anything
other than what the two dated pages actually say. See omission O4.

### Section 5 — `Is Quintero open`

| Published | Verdict |
|---|---|
| Troon's facility record: empty closures list, `isBookable:true` | Verdicts §5 — confirmed, "the operator's own machine-readable closure register" |
| Club blog posting as recently as 9 August 2026 | Verdicts §5 — confirmed |
| Troon press-release feed current through 4 September 2026, nothing new for Quintero | Verdicts §5 — confirmed |
| "No 2026 closure is confirmed anywhere reachable." | Verdicts §5 — confirmed, matches the verdict's own framing exactly |
| EzLinks live tee sheet unreachable (Cloudflare block); "an autumn overseed shutdown cannot be ruled out; confirm at booking before travelling" | Verdicts §5, Uncertain U5 — confirmed as the honest caveat the verdict itself requires: "Trading status uncertainty publishes with no trading claim and a check-before-you-go line." |
| 2025 closure: began 2 June 2025, "reopened for public play on November 1" | Verdicts, Refuted R5's correction: "closed 2 June – 1 November 2025." The finder's "June 1" start date is not used. |
| five-month, course-wide renovation, overseen by Rees Jones, Quintero's original architect | Verdicts §5 — confirmed verbatim |
| "The newly overseeded golf course is currently cart path only and will be for several weeks to allow the rye grass to mature." | Verdicts §5 — confirmed verbatim (quoting the historical press release; explicitly framed here as past, not current) |
| "Both the closure and the cart-path restriction that followed it are past, not current." | Verdicts §5: "That closure ran 2 June – 1 Nov 2025 and is historical... long expired." Restated plainly so a reader cannot mistake a 2025 quote for a 2026 status. |

This section is deliberately the least confident in the file, matching the
verdict's own framing: "Publish it as open with a confirm-at-booking line —
not as a clean guarantee." No sentence here claims the course is certainly
open on any specific future date (Verdicts, "must not publish" #10).

### Section 6 — `The course itself`

| Published | Verdict |
|---|---|
| Rees Jones designed the course | Verdicts §7 — confirmed |
| "the 7,249-yard, par 72 layout" opened in 2000 | Verdicts §7 — confirmed verbatim (press release) |
| 2025 renovation: all 18 greens rebuilt, tees relaid, 65 bunkers rebuilt | Verdicts §5, §7 — confirmed |
| "Rees Jones, ASGCA/Rees Jones & Steve Weisser (2025)" | Verdicts §7 — confirmed, "the addition the finder missed" |
| Yardage conflict: 7,249 (Golf Digest, press release) vs 7,208 (Troon course page) | Verdicts, Uncertain U4 — confirmed conflict; "publish 7,249 attributed to Golf Digest, or omit" — 7,249 is published, attributed |
| Golf Digest ranking history: "Best in State: Ranked 15th, 2017-'22. Ranked 16th, 2025-'26. Ranked 17th, 2023-'24." | Verdicts, Refuted R6 — confirmed verbatim, the awarding body's own record |
| The club's "#1 by Golf Digest, 2017" claim is not published | Verdicts, Refuted R6: "REFUTED BY THE AWARDING BODY... Must not publish." |

### Section 7 — `Staying at Quintero`

| Published | Verdict |
|---|---|
| "five Terrace Casitas, an Executive Loft and a Private Estate," the club's own site's description | Verdicts, Refuted R4's correction: "describe the five Terrace Casitas, Executive Loft and Private Estate as the club's own site describes them." |
| Troon's press release: "renovated their nine stay-and-play units to provide guests with updated accommodations, including refreshed kitchens and bathrooms, new flooring and paint throughout the units and new furniture" | Verdicts, Refuted R4 — confirmed verbatim as **Troon's own figure** |
| "not reconciled with the casita, loft and estate line-up" | Verdicts, Refuted R4: "5 + 1 + 1 = 7, not 9... Do not equate the two." The arithmetic itself is not restated anywhere in this file. |
| "Emily Wulzen, Director of Sales, emily@quinterogolf.com" | Verdicts, Refuted R3's correction — confirmed and used verbatim |

**Not published:** Mitchell Fischer as the lodging contact (Verdicts R3: he is
the *events* contact, misattributed by the finder) and the "nine units = 5
casitas + loft + estate" arithmetic (Verdicts R4: false, 5+1+1=7). Neither
appears anywhere in this file. See omissions O5 and O6.

### FAQ

Six questions. The gate requires one matching `play|tee time|tee times|book`;
two match ("How do I book a tee time at Quintero?" and indirectly "Is
Quintero open right now?"). Every answer restates a section above and adds
nothing new.

* "How do I book a tee time at Quintero?" — §Playing Quintero.
* "Is Quintero a public or semi-private course?" — §Public or semi-private.
* "What does a round cost?" — §Green fees.
* "Is Quintero open right now?" — §Is Quintero open, with the confirm-at-booking caveat restated.
* "Where is Quintero?" — county, jurisdiction, both addresses.
* "Do Arizona residents get a discount?" — §Playing Quintero.

---

## 2. Places, against the verdicts they rest on

**One `golf-course` place, not two.** The gate allows up to two, but no
verdict in this file adjudicates a second course for Arizona — the finder's
"Rancho Mañana Golf Club, Cave Creek" (its §6) was never re-verified by the
verifier and appears nowhere in the verdicts file's 48 confirmed / 7 refuted /
7 uncertain tally. Per the rule that every clause must trace to a verdict, a
second course is not manufactured to fill the slot. See omission O7.

| slug | kind | rests on |
|---|---|---|
| `quintero-golf-club` | `golf-course` | Verdicts §1, §2, §3, §4, §5, §7, Selection re-check |
| `quintero-golf-club-lodging` | `hotel` | Verdicts, Refuted R3 and R4 corrections |

Both places carry `photos: []`, as does the guide. See omission O8.

**No `address` field on either place.** Two addresses are confirmed for the
course but they disagree on the road name (U1), and the task instructs
against asserting they are the same road; rather than pick one arbitrarily,
neither is written into the structured `address` field, and both appear in
prose instead, attributed to their own source. This mirrors the Oregon file's
own rule that an unestablished single value does not get invented to fill a
field.

**`status: "open"` on both is not a trading claim.** Per
`Ethos.Seeds.DataGuide`'s moduledoc, `"open"` renders nothing and is the
absence of a closed claim, not an assertion of current trading — which is
exactly the posture Verdicts §5 asks for ("Publish it as open with a
confirm-at-booking line — not as a clean guarantee"). The guide's prose
carries the actual caveat; the field does not need to.

Two entries, one per place, both `place_slug` values resolving inside this
file.

---

## 3. Every omission, and why

### The four refuted claims with corrections used

**O5 — "Mitchell Fischer, Director of Sales" as the lodging contact.**
*Refuted, R3.* Fischer is Quintero's *events* contact, not lodging. Replaced
throughout with R3's correction: Emily Wulzen, emily@quinterogolf.com. The
finder's own repair of the page's typo ("Mitchell.Fischer@troon.comm") is
moot — his name is not published at all.

**O6 — "Nine units total = the 5 casitas + loft + estate configuration."**
*Refuted, R4.* Arithmetically false (5+1+1=7, not 9) and unsourced as a
reconciliation. Published instead: Troon's "nine stay-and-play units" quoted
as Troon's own figure, and the casita/loft/estate description quoted
separately as the club's own site describes it, explicitly not equated.

**O4 — "Summer Special" rates as current, standing rates.** *Refuted, R1 and
R2.* The banner is 2021 markup inside an HTML comment, never rendered.
Replaced with the two dated figures the corrections supply: the 9 August 2026
"$162 to $199" figure and the 24 June 2026 early-morning tiered pricing.
Neither is called a summer rate.

**"Ranked #1 by Golf Digest, 2017" / "Best Public Course 2023 by Golf
Digest."** *Refuted, R6.* Golf Digest's own ranking-history record for
Quintero shows 15th in 2017 and 17th in 2023-'24 — the awarding body's own
data positively contradicts the club's self-published claim. Not published,
per the task instruction and per the general rule that a business's own site
never establishes an award, doubled here because the awarding body's record
actively refutes it.

**"the course operates 5:00 AM to 4:00 PM daily."** *Refuted, R7.* "Daily" is
not stated on the source page. Published as: "The course is open from
5:00 AM to 4:00 PM," with "daily" dropped.

### The uncertain claims and how each resolved

**U1 — the road-designation assertion.** "Carefree Highway carries the AZ-74
designation in this stretch" is unsourced, the finder's own reconciliation.
Both addresses publish, verbatim per source, with no claim that they name the
same road.

**U2 — the cancellation window.** Club page says 48 hours; Troon's facility
record says 24. The club's own reservation-policy page governs its own
booking policy, so 48 hours publishes, per the verdict's own resolution.

**U3 — the booking window.** Club page says 90 days; Troon's record says 210.
Same resolution rule: the club's own page governs. 90 days publishes.

**U4 — the yardage conflict.** 7,249 (Troon press release and Golf Digest) vs
7,208 (Troon's own course page). Two of three sources agree at 7,249; that
figure publishes, attributed to Golf Digest, per the verdict's own
instruction.

**U5 — whether an autumn 2026 overseed closure will occur.** No live tee
sheet reachable. Publishes with no trading claim and an explicit
check-before-you-go line, exactly as the verdict directs.

**U6 — "Arizona's No. 1 public course."** Not printed as an unqualified
number anywhere reliable: Golf Digest's separate, unnumbered 2022 feature
lists Quintero first of 25, and Troon's own marketing calls it "the No. 1
Public Course in Arizona." Neither is asserted in the guide's own voice.
Published instead, per the verdict's own suggested alternative: the checkable
fact that on the 2025-'26 Best in State ranking, Quintero at #16 is the
highest-placed "Public" course, with #1–#15 all "Private."

**U7 — the club's remaining self-published accolades.** The rules exclude a
business's own site as the source of an award claim, and the verifier found
the club's own accolade page internally inconsistent (Arizona Foothills 2016
in prose, 2017 in an image). None of it is published.

### The rules-driven omissions

**O1 — turn-by-turn driving directions from Sky Harbor** (I-10, I-17, "West
Carefree Highway (AZ-74)"). The finder computed these via OSRM but the
verifier never independently re-checked the route steps, and the route
description repeats exactly the road-identity assertion U1 says not to make
("Carefree Highway (AZ-74)"). Only the 51.3-mile aggregate figure, which the
verdict itself supplies as the required replacement for the banned duration
claim, is published.

**O2 — "Sonoran Desert," "Lake Pleasant," "Hieroglyphic Mountains," "Federal
lands managed by the Bureau of Land Management."** All of this descriptive
context comes from Troon's page inside or immediately beside the banned
duration sentence ("less than one hour northwest of Phoenix Sky Harbor
Airport in the high Sonoran Desert near Lake Pleasant in the Hieroglyphic
Mountains") and was never separately re-verified by the verifier as
independent facts. None of it is published.

**O3 — "tee times... scheduled in 10-minute intervals."** Confirmed by the
verdict, but `Ethos.GolfProse` pattern 1 bans any numeral-minute phrase
unconditionally, with no travel-context exception (the moduledoc for that
module states plainly: "Minutes are banned unconditionally in numeral form by
pattern 1 and always have been"). The detail is dropped, not rephrased around
the gate and not allowlisted, per the instruction that a fired gate gets fixed
prose, never an allowlist entry.

**O7 — a second golf-course place ("Rancho Mañana Golf Club, Cave Creek").**
Named only in the finder's §6, never adjudicated by the verifier. The gate
permits up to two `golf-course` places but does not require two; with no
verdict to trace it to, it is omitted rather than invented to fill the slot.

**O8 — every photo.** `guide.photos: []` and `photos: []` on both places. No
photo scout has run for this state, and the licence gate requires any
referenced photo to exist on disk.

**O9 — any claim about restaurants, cafes, parks, museums or attractions near
Quintero.** The finder's own §5 recorded an honest gap here: "no specific
hotel chain property could be confirmed and sourced," and Pleasant Harbor
Marina & RV Resort — the one nearby facility the verdicts file mentions at
all — is cited by the verifier only for its site footer's copyright line, used
solely to corroborate the county, not adjudicated as a place with confirmed
address, hours, or offerings. Rather than build a place record on a footer
citation, no such place is published. This is why the file has two places
instead of the nine Oregon carries — the source material for Arizona this
time is narrow and this guide reflects that rather than padding around it.

**O10 — a street address field on either place.** See §2 above; two
disagreeing sources, no invented single value.

**O11 — any historic-designation or NRHP claim.** No verdict addresses one
either way for Quintero; nothing is published in either direction.

---

## 4. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures** on the first run. No allowlist entry was added;
`Ethos.GolfProse`'s allowlist remains `[]`.

One phrasing was caught in drafting before it was ever run through the gate,
because the verdict itself flagged it as unpublishable content (not a prose
violation) — see omission O3 above: "scheduled in 10-minute intervals" was
never written into the file at all, having been identified as a
`Ethos.GolfProse` pattern-1 hit (any numeral-minute phrase) while drafting
§Playing Quintero. No sentence in the shipped file contains a numeral- or
word-form minute count, an hour-plus-travel-word phrase, or any of the
proximity phrasings the gate bans ("next door," "steps from," "north of the
course," etc.) — none of that vocabulary was needed to state Quintero's
facts, since every spatial claim in this file is either a road/mileage figure
(the 51.3-mile Sky Harbor distance) or a plain address, and no relative
proximity language was required anywhere.

---

## 5. Roster row

Per instruction, this agent does **not** touch
`priv/seed_data/golf_courses_roster.json` — a finalize agent resolves all ten
rows afterward. For that agent's reference, the row this state's research
supports is:

| field | value | verdict |
|---|---|---|
| `course` | `Quintero Golf Club` | Selection re-check — and it exactly equals the `name` of the seeded `golf-course` place |
| `facility` | Troon (operator; no separate resort brand name confirmed) | Verdicts §3–§5 |
| `city` | `Peoria` | Verdicts §2 |
| `county` | `Maricopa County` | Verdicts §1 |
| `access` | Public (Golf Digest) / Semi-private (Troon) — disagreement, not resolved | Verdicts §3 |
| `criterion` | `ranking` | Selection re-check |
| `ranking_source` | `Golf Digest Best in State, Arizona` | Verdicts §1, §3 |
| `ranking_edition` | `2025-'26` | Verdicts §1, §3 |
| `ranking_position` | `16` (highest "Public"-labelled entry; #1-#15 all Private) | Selection re-check, Uncertain U6 |
| `second_course` | none — no verdict adjudicates one | Omission O7 |
| `verified` | `true` | |

---

## 6. What is absent from the whole file

* **No trip duration of any kind.** The one distance figure — 51.3 miles from
  Phoenix Sky Harbor — is the verdict's own instructed replacement for a
  banned duration claim, published as a plain road-mileage figure.
* **No vague proximity.** No sentence in this file relies on relative
  location language at all; every location claim is either a specific
  address (both disagreeing versions given) or a county/jurisdiction fact
  from the Census geocoder.
* **No price without the source's own date.** Both green-fee figures carry
  the date the source itself attaches — 9 August 2026 and 24 June 2026 — and
  the banned 2021 "Summer Special" banner is not published in any form.
* **No trading claim.** §Is Quintero open states plainly what is and is not
  confirmed and ends on a confirm-at-booking instruction rather than a
  guarantee.
* **No self-published award claim.** The club's "#1 by Golf Digest, 2017" and
  "Best Public Course 2023" claims are both refuted by Golf Digest's own
  ranking-history record and neither is published.
* **No misattributed contact and no invented arithmetic.** Mitchell Fischer
  and the "nine units = five casitas + loft + estate" claim are both refuted
  and neither appears anywhere in this file.
* **No manufactured second course.** The gate permits up to two `golf-course`
  places; this file has one, because that is what the verdicts file
  supports.