# Washington — Chambers Bay: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/washington.json`.

**This file is committed on purpose.** The research artifacts live under
`.superpowers/`, which `.gitignore` excludes. A year from now this file is the
only thing that can answer "where did that sentence come from".

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/washington-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **26
   confirmed · 8 refuted · 4 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/washington-finder.md` —
   the finder. Context only. It carries all eight refuted claims; where the
   two disagree, the verdicts file wins.
3. `priv/seed_data/golf/oregon.json` — the canonical shape, copied exactly.

**The refuted-with-correction rule:** where a verdict is `refuted` but
supplies a correction naming what may still be published, that correction's
substance ships and nothing else from the item does. Washington is the
heaviest-refutation state so far in this set — eight refutations against
twenty-six confirmations — and every one of the eight required either a
correction or an omission below.

**7 places, 7 entries, 1 guide, 5 sections, 7 FAQ answers, 0 photos.**

---

## 1. The selection

| | Verdict |
|---|---|
| Chambers Bay is **#1** on Golf Digest's Washington Best in State ranking, rated **4.4** from **46 panelists**, literal label **Public** | C-01 — confirmed on two independent WebFetch calls |
| "25th edition" | R-01 — **refuted**. The string does not appear on the page. Correction used verbatim: cite the ranking as "Golf Digest, Best Golf Courses in Washington, 2025-'26," with no edition ordinal. |

Published: `intro` and the "Chambers Bay" section both cite "Golf Digest's Best
Golf Courses in Washington, 2025-'26" with the 4.4/46-panelist figures and the
"Public" label. No "25th edition" appears anywhere in the file.

---

## 2. Geography

| Field | Value | Verdict |
|---|---|---|
| city | University Place | C-02 — confirmed, chambersbaygolf.com/contact/ footer |
| address | 6320 Grandview Drive West, University Place, WA 98467 | C-02 — confirmed verbatim |
| county | **Pierce County** | C-03 — confirmed, on the county's own Parks & Recreation page (recovered via Wayback after both tools were refused directly by Cloudflare), corroborated by rtj2.com and Wikipedia raw wikitext |

**R-02 — refuted:** washingtongolf.com does *not* state "County: Pierce
County" in its raw HTML; a WebFetch summarizer fabricated that field. **Not
cited** for the county anywhere in this file — the county's own government
page is cited instead (in prose, without a URL, since the page itself is
Cloudflare-gated and reached only via Wayback).

**R-03 — refuted:** visitpiercecounty.com returns no content about the course
at all (HTTP 403 to curl, empty of subject matter to WebFetch). **Not used as
a citation or otherwise mentioned.**

`county: "Pierce County"` is used on every place in the file. Tacoma, Ruston
and University Place are all incorporated municipalities inside Pierce
County — settled Washington state geography, not a research-dependent claim —
and the verdicts corroborate the Tacoma-area connection independently: the
county's own page names Lake Spanaway (a Tacoma course) alongside Chambers Bay
as one of "our" — Pierce County's — golf courses.

---

## 3. The guide

`slug: washington-golf-guide` · `title: "Chambers Bay: Golf in University
Place, Washington"` · `destination: "Tacoma, Washington"` ·
`state: "Washington"` · `county: "Pierce County"` · `photos: []`

**Why `destination` is Tacoma, not University Place.** The course itself sits
in University Place, but neither confirmed lodging option is there: Silver
Cloud Hotel Tacoma at Point Ruston Waterfront is addressed in Ruston, WA
(C-15), and Hotel Murano is addressed in downtown Tacoma, WA (R-05
correction). Boathouse19 (R-06 correction) and Cedar Irons Golf Course (R-07
correction) are both addressed in Tacoma as well. Tacoma is the town most of
what a visitor actually uses — sleeping, day-two golf, one of two dinners —
sits in, so it is the basecamp named in `destination`.

### Section 1 — `Getting there`

Heading is exactly `Getting there`. No trip duration and no Sea-Tac mileage
appear anywhere in this section or this file.

| Published | Verdict |
|---|---|
| From Seattle: I-5 south to Exit 130, S. 56th St. West → Cirque Drive West for ~3 mi, left on Grandview Drive West, through one roundabout, **~6.1 miles from I-5** | C-16 — confirmed verbatim, washingtongolf.com raw HTML |
| From Portland: I-5 north via Steilacoom-DuPont Rd, Dupont-Steilacoom Hwy, Lafayette St, Chambers Creek Rd W, 64th St W, **~9.4 miles from I-5** | C-16 — confirmed verbatim |
| Course address, 6320 Grandview Drive West, University Place, WA 98467 | C-02 — confirmed |
| Sea-Tac named as the region's commercial airport, **with no mileage attached** | U-02 — the verdict's own instruction. The finder's four candidate numbers (25.9 / 26.1 / 28 / ~34) are city-to-city, not airport-to-course, and conflict with each other; the one authoritative figure (rtj2.com's "approximately 35 minutes") is a **duration** and is banned outright from conversion into a distance. The guide states only that published figures disagree, gives no number, and does not name a source for the disagreement (naming tacomashuttle.com or rome2rio.com would dress an unusable figure in a citation it does not deserve). |

**Also omitted from this section:** the same washingtongolf.com page's drive
times ("approx 60 minutes", "approx 2.5 hours") — banned outright, and not
needed since the mileages above are the checkable form of the same claim.

### Section 2 — `Where to stay and eat`

| Published | Verdict |
|---|---|
| Chambers Bay Grill: full-service, lunch/dinner/weekend brunch, full bar, Northwest wines, at the course | C-14 — confirmed, chambersbaygolf.com/dine/ |
| The Landing: casual walk-up counter, seasonal Pacific Northwest-inspired fare, at the course | C-14 — confirmed |
| Silver Cloud Hotel Tacoma at Point Ruston Waterfront, 5125 Grand Loop, Ruston, WA 98407, rooftop pool, Spa Serein, Copper & Salt Northwest Kitchen | C-15 — confirmed, hotel's own site |
| Hotel Murano, 1320 Broadway, Tacoma, WA 98402, in downtown Tacoma | R-05 — **refuted (partial)**. Published: address and "in downtown Tacoma" only. |
| Boathouse19, 9001 S 19th St, Tacoma, WA 98466, Northwest seafood and waterfront dining at Tacoma Narrows Marina, views of the Narrows Bridge and Puget Sound | R-06 — **refuted (identity/menu)**, correction used verbatim |

**R-05 in detail, and what the gate caught.** The verdict's own suggested
"publishable text" for Hotel Murano reads: *"Hotel Murano, 1320 Broadway,
Tacoma, WA 98402 — in downtown Tacoma, steps from the Tacoma Convention
Center and a few blocks from the city's museums and restaurants."* I drafted
that sentence verbatim first. `Ethos.GolfProse.banned_phrases/1` fires on it:
`"steps from"` matches pattern 5 (`steps|a stone's throw|moments` +
`from|away`). This is exactly the situation the top-level instructions
anticipate — the gate caught a phrase in a verdict's own suggested correction
text, because the verdict was written for factual accuracy, not for the
proximity gate. **Rewrite, not allowlist:** the "steps from"/"a few blocks
from" clause was dropped entirely rather than reworded, because no source
gives a checkable distance for either claim — "a few blocks" is not
convertible into a road name and a mileage, it is simply vague. What ships is
`"Hotel Murano, 1320 Broadway, Tacoma, Washington 98402, sits in downtown
Tacoma."` — the address and city placement only.

**Also refuted, and dropped rather than replaced:**
- R-05's "5-star, 319-room" — neither figure is on the hotel's own site.
  Nothing substitutes; the place record makes no rating or size claim at all,
  and says so.
- **U-01 — Salted Rim Bar & Kitchen; Seoul Kitchen — uncertain, not
  published.** Aggregator-only sourcing (a Tripadvisor "near" list), no
  own-site fetch of either restaurant. Not mentioned anywhere in this file.

### Section 3 — `Chambers Bay`

| Published | Verdict |
|---|---|
| Robert Trent Jones II designed it; opened for play June 23, 2007 | C-17, C-18 — confirmed |
| Wikipedia: 250-acre course in a 930-acre county park with walking trails; operator's site: 249 acres — **both stated, neither picked as exact** | C-20 — confirmed both figures; verdict flags the discrepancy and instructs neither publish as exact if precision matters. Stating the disagreement follows this corpus's Fenway-address precedent. |
| Owned by Pierce County, managed by KemperSports | C-22 — confirmed, "the better-supported reading" per the verdict, which flags rtj2.com's "owned and operated by Pierce County" against Wikipedia's operator field and prefers "owned by / managed by" |
| Pierce County's own page: "host of the 2010 U.S. Amateur and 2015 U.S. Men's Open" | C-03/C-19 — confirmed verbatim |
| Championships: 2010 U.S. Amateur, 2015 U.S. Open (Jordan Spieth), 2021 U.S. Amateur Four-Ball, 2022 U.S. Women's Amateur; scheduled 2027 U.S. Junior Amateur, 2033 U.S. Amateur — **no "first" of any kind** | C-19 confirmed; **R-08 refuted** for both "first" claims, correction used verbatim |
| Audubon International Certified Silver Signature Sanctuary Course, attributed to Robert Trent Jones II's own portfolio page | C-21 — confirmed as a third-party (architect) listing, not the certifying body or the operator; published with attribution to the architect's page rather than as an unqualified fact, per the verdict's guidance |
| Golf Digest ranking restated: #1, 4.4, 46 panelists, "Public" | C-01 — confirmed |

**R-08 in full.** The finder attributed "first U.S. Amateur held on a public
course" and "first U.S. Open held in the Pacific Northwest" to both rtj2.com
and Wikipedia. The verdict found the string "first" occurs **zero** times on
rtj2's raw page text, and every "first" on Wikipedia's raw wikitext is either
a citation author field or unrelated prose. Neither superlative appears on
either source. **Published:** the championship list with no "first" of any
kind, exactly as R-08's correction supplies it.

**Not published:** "one of the toughest walks in golf" / "world-renowned" —
per verdict item 13, the operator's own promotional language, not fact.
Omitted rather than attributed, to keep the course section to established
facts.

### Section 4 — `Playing it as a day guest`

The entire paragraph is C-05 through C-13, restated close to verbatim:

| Published | Verdict |
|---|---|
| "Chambers Bay is a public course — no membership required." | C-05 — confirmed verbatim. **This exact sentence is R-04's correction, used in place of the fabricated quote.** |
| Walking-only; push/pull carts included; personal push/pull carts welcome | C-06, C-07 — confirmed |
| "Book online or call 253-460-4653." | C-10 — confirmed verbatim |
| Residency-based rates: up to 3 months ahead, from the 1st of the month | C-08 — confirmed verbatim, tied explicitly to the residency-based tier as the verdict requires |
| Advance Reservations: April–October 2026, bookable from January 1, 2026, 15.2% tax, no additional fees at check-in | C-09 — confirmed verbatim |
| Single players can join groups but cannot book open times | C-11 — confirmed verbatim |
| Cancellation: >7 days full refund; 7 days–48 hrs 50% fee/player; <48 hrs or no-show full fee | C-12 — confirmed verbatim, in full |
| 2026 rate tiers by month: Golf Club $89–$169, Pierce County resident $109–$209, WA/PNGA $119–$259, non-resident $149–$325, Advance Booking $275–$425; "starting at" qualifier; 15.2% combined tax (10.2% state + 5% city) | C-13 — confirmed, read directly off the 2026 table. **The 2025 table on the same page was not used** — the verdict flags it explicitly as a distinct column set not to mix in. |

**R-04 in full — the highest-stakes refutation in the file.** The finder
quoted *"The facility welcomes all golfers—no membership required."* as
verbatim from chambersbaygolf.com/golf/. The verifier grepped the raw page for
the string `welcomes all golfers` and got **zero** matches. This sentence
appears nowhere on the file's most consequential access claim. **Not
published anywhere in this file.** The confirmed replacement — "Chambers Bay
is a public course — no membership required." — is used verbatim, both in
the section body and again in the FAQ.

### Section 5 — `Day two: Cedar Irons Golf Course`

| Published | Verdict |
|---|---|
| Cedar Irons Golf Course (formerly North Shore Golf Course), 4101 North Shore Blvd NE, Tacoma, WA 98422, a public course in northeast Tacoma | R-07 — **refuted (identity)**, correction used verbatim |
| Back nine temporarily closed; front nine, practice areas and golf shop open | R-07 — confirmed from the same page's hours block, contradicting the same page's own "newly renovated 18-hole course, now open for play" banner |
| Pro shop 253-927-1375 | R-07 — confirmed |

**R-07 in full.** The finder's source, `nshoregolf.com`, has renamed: its
`<title>` and a site-wide banner both read "Cedar Irons," with the stale
sentence "North Shore Golf Course is a public golf course..." left in body
copy. **"North Shore Golf Course" is never published as the course's current
name anywhere in this file** — only in parenthetical explanation of the
rename, as the verdict's own correction phrases it. The same page's hours
block states the back nine is temporarily closed even while its banner claims
a "newly renovated 18-hole course, now open for play" — the two contradict
each other on the same page, and this file publishes only the closure, not
the 18-hole claim, per the verdict's explicit instruction.

**U-03 — uncertain, not published.** No mileage from University Place (or
Tacoma) to Cedar Irons Golf Course was established by either the finder or
the verifier. Nothing publishes; the section states only the address and the
closure.

### FAQ

Seven questions; the gate requires one matching `play|tee time|tee times|book`
— four do ("How do I book a tee time…", "What does a round cost?" (implicitly
references booking via the rate/booking answer), "Which course should I play
on day two?", and the booking-window content embedded in the first answer).
Every answer restates a section above.

---

## 4. Places, against the verdicts they rest on

Two `golf-course` places — the gate's maximum — the ranked course and the day
two course.

| slug | kind | rests on |
|---|---|---|
| `chambers-bay` | `golf-course` | C-01, C-02, C-03, C-05–C-13, C-17–C-22, R-01, R-04, R-08 |
| `cedar-irons-golf-course` | `golf-course` | R-07 |
| `silver-cloud-hotel-point-ruston` | `hotel` | C-15 |
| `hotel-murano-tacoma` | `hotel` | R-05 |
| `chambers-bay-grill` | `restaurant` | C-14 |
| `the-landing-chambers-bay` | `cafe` | C-14 |
| `boathouse19-tacoma` | `restaurant` | R-06 |

Every place has `photos: []`, as does the guide. No photo scout has run for
this state; a state with no freely licensed photo ships none.

**No `address` field on any place record** (matching Oregon's convention —
`Ethos.Places.Place` has no required address field, and the corpus's habit is
to fold a sourced address into `summary` prose instead of inventing a
structured field for it). Every address that appears anywhere in this file —
Chambers Bay's, Silver Cloud's, Hotel Murano's, Boathouse19's, Cedar Irons's —
comes from that place's own site or a verdict-confirmed source, quoted or
closely restated.

`status: "open"` on all seven is not a trading claim, per
`Ethos.Seeds.DataGuide`'s moduledoc — it renders nothing, and no place's prose
asserts current trading beyond what its own official site states.

Seven entries, one per place, all `place_slug` values resolving inside this
file.

**Slug uniqueness:** checked against the rest of `priv/seed_data/` before
writing — `chambers-bay`, `cedar-irons-golf-course`,
`silver-cloud-hotel-point-ruston`, `hotel-murano-tacoma`,
`chambers-bay-grill`, `the-landing-chambers-bay`, `boathouse19-tacoma` collide
with nothing else in the corpus.

---

## 5. Every omission, and why

### The eight refuted claims

**O1 — "The facility welcomes all golfers—no membership required."** *Refuted,
R-04.* Zero matches for "welcomes all golfers" on the raw page. Replaced
everywhere by the confirmed sentence, "Chambers Bay is a public course — no
membership required."

**O2 — either "first" claim (first U.S. Amateur on a public course, first
U.S. Open in the Pacific Northwest).** *Refuted, R-08.* The word "first"
occurs zero times on rtj2.com; Wikipedia's occurrences are all citation
metadata or unrelated prose. The championship list publishes with no
superlative.

**O3 — "25th edition" of the Golf Digest ranking.** *Refuted, R-01.* Not on
the page. Cited instead as "Golf Digest, Best Golf Courses in Washington,
2025-'26."

**O4 — washingtongolf.com as the citation for "County: Pierce County."**
*Refuted, R-02.* A WebFetch summarizer fabricated the field; the raw page
contains no such statement. Not cited for the county anywhere.

**O5 — visitpiercecounty.com as a supporting source for anything.** *Refuted,
R-03.* Returns no content about the course under either fetch tool. Not
mentioned.

**O6 — Hotel Murano as "5-star, 319-room," and its "steps from"/"a few
blocks from" proximity claims.** *Refuted, R-05, and separately dropped for
vagueness — see the gate note in §3.* Neither the rating nor the room count
appears on the hotel's own site. Address and "downtown Tacoma" ship; nothing
else.

**O7 — Boathouse 19 as "regional American."** *Refuted, R-06.* Its own site
(after following the stale-path redirect) describes it as Northwest seafood.
Published per the correction.

**O8 — "North Shore Golf Course" as the current name of the day-two course.**
*Refuted, R-07.* The business renamed to Cedar Irons Golf Course. Published
under the current name, with the old name appearing only in a parenthetical
"formerly," and with the back-nine closure stated rather than omitted.

### The four uncertain claims

**O9 — any Sea-Tac-to-course mileage.** *Uncertain, U-02.* Four conflicting
secondary figures (25.9 / 26.1 / 28 / ~34 miles), all city-to-city rather than
airport-to-course, plus a banned duration ("approximately 35 minutes") on the
one authoritative page. No number published; the airport is named as the
region's gateway only.

**O10 — mileage from University Place (or Tacoma) to Cedar Irons Golf
Course.** *Uncertain, U-03.* Never established by either researcher. Nothing
published.

**O11 — Salted Rim Bar & Kitchen and Seoul Kitchen.** *Uncertain, U-01.*
Aggregator-only sourcing, no own-site verification of identity or trading.
Not mentioned.

**O12 — historic designation for Chambers Bay, in either direction.**
*Uncertain, U-04.* No National Register or comparable listing was found by
either researcher. This is an absence of evidence, not a confirmed negative,
so this file makes no claim either way.

### The rules-driven omissions

**O13 — every drive time.** washingtongolf.com's own "approx 60 minutes" /
"approx 2.5 hours" and rtj2.com's "approximately 35 minutes from
Seattle-Tacoma International Airport" are all durations. None publishes, in
either raw or converted form. The mileages in C-16 are what ships instead for
the I-5 legs; nothing substitutes for Sea-Tac because no mileage was ever
established (O9).

**O14 — every straight-line/aggregator distance for Sea-Tac.** See O9. None
of the four conflicting figures is authoritative or airport-to-course, so none
is published, singly or as a range.

**O15 — "one of the toughest walks in golf" / "world-renowned."** Operator's
own promotional language per verdict item 13. Omitted; the walking-only rule
and cart policy publish as fact instead.

**O16 — an exact acreage for Chambers Bay.** C-20 confirms two different
numbers (250 acres per Wikipedia, 249 per the operator) on two authoritative
pages. Both are published, with the disagreement stated, rather than picking
one — following this corpus's established rule for disagreeing named sources
(the Fenway-address precedent).

**O17 — every photo.** `guide.photos: []` and `photos: []` on all seven
places. No photo scout has run for this state.

**O18 — a claim that Cedar Irons Golf Course has 18 holes open.** The
course's own site's banner says so, but its own hours block says the back
nine is temporarily closed. Per R-07's explicit instruction, only the closure
publishes.

---

## 6. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, run twice for stability. No allowlist entry was
added.

**The one rewrite the gate forced (see §3 for detail).** The verdict R-05's
own suggested "publishable text" for Hotel Murano contained *"steps from the
Tacoma Convention Center and a few blocks from the city's museums and
restaurants."* `Ethos.GolfProse.banned_phrases/1` fires on `"steps from"`
(pattern 5). Per the task's own rule — "if the prose gate fires, fix the
prose — never add an allowlist entry" — the clause was dropped rather than
reworded, since no source gives a checkable distance for either claim. What
ships is only the address and "in downtown Tacoma."

**What was checked and found clean without needing a rewrite:**
- "approximately 3 miles" (part of the I-5 route description) does not match
  the minute-duration patterns, because the regex requires the literal
  substring "min" immediately after the number and "miles" does not contain
  it.
- "in northeast Tacoma" (Cedar Irons) does not match the proximity ban's
  directional pattern, which only fires on a direction relative to *the
  course/clubhouse/resort/links/property/site/first tee* — a city
  neighborhood name is not one of those nouns.
- "up to three months in advance" and "within 21 days"-style booking-window
  language does not match the trip-duration patterns, which require a
  travel-related following word (drive/ride/away/south/etc.) that a booking
  window never has.
- No dollar figure in this file lacks a season/year attribution: every price
  is explicitly "2026," matching the source's own "2026 Golf Rates" heading.

**What the gate does not cover, and why it does not need to here.** Per
`Ethos.GolfProse`'s own moduledoc, an unsourced containment claim in ordinary
prose is invisible to pattern matching. This file's defense against that
class of error is this trace: every geographic and factual clause above is
matched to a specific verdict item, and the two dropped-not-replaced
proximity clauses (Hotel Murano, O6) were removed rather than laundered into
something checkable-sounding.

---

## 7. Full suite

`MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/` — **256 tests, 0
failures, 6 excluded** (the `pending_golf`-tagged roster-exhaustion and
attribution tests, which another agent resolves once all fifty states are
seeded). No regression in the destination, ballpark, wave or Connecticut
suites from adding this file.

---

## 8. Roster row (informational — not written to the roster file)

Per the dispatch, `priv/seed_data/golf_courses_roster.json` was **not
touched**; another agent resolves all fifty rows. For that agent's reference,
the Washington row resolves to:

| field | value | verdict |
|---|---|---|
| `course` | `Chambers Bay` | C-01/C-02 — matches the seeded `golf-course` place's `name` exactly |
| `facility` | `Chambers Bay Golf Course` | C-02 |
| `city` | `University Place` | C-02 |
| `county` | `Pierce County` | C-03 |
| `access` | Public course, no membership required; walking-only with included push/pull carts; book online or by phone; residency-based rates up to 3 months ahead from the 1st of the month | C-05–C-13 |
| `criterion` | `ranking` | C-01 |
| `ranking_source` | `Golf Digest Best in State, Washington` | C-01 |
| `ranking_edition` | `2025-'26` (no ordinal — R-01 refutes "25th edition") | C-01, R-01 |
| `ranking_position` | `1` | C-01 |
| `second_course` | `Cedar Irons Golf Course` | R-07 |
| `verified` | `true` | |
