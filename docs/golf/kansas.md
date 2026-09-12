# Kansas — Colbert Hills: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/kansas.json`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/kansas-verdicts.md` — the
   independent verifier's adjudication. **The authority.** Tally: **67
   confirmed · 4 refuted · 2 uncertain** (73 claims adjudicated).
2. `.superpowers/sdd/2026-09-05-golf-courses/research/kansas-finder.md` — the
   finder. Context only. Where the two disagree, the verdicts file wins.
3. `priv/seed_data/golf/oregon.json` — the structural template this file
   copies.

**The governing rule:** a verdict vouches only for what its own text restates,
not for every clause of the sentence the finder wrote around it.

**6 places, 6 entries, 1 guide, 5 sections, 6 FAQ answers, 0 photos.**

---

## 0. The selection, and the "zero skipped" question the brief flagged

The brief warned of an apparent contradiction: the selection sits at #8, but
the finder also reported "zero positions skipped." The verdicts file resolves
this explicitly (§0): "zero positions skipped" meant the countdown has no
missing rank numbers, which is true and is a different claim from "no Public
entry was passed over." The verifier separately enumerated ranks 1–7 by their
literal labels:

| Rank | Course | Label |
|---|---|---|
| 1 | Prairie Dunes Country Club | Private |
| 2 | Flint Hills National Golf Club | Private |
| 3 | Shadow Glen Golf Club | Private |
| 4 | Kansas City Country Club | Private |
| 5 | Wolf Creek Kansas | Private |
| 6 | Hallbrook Country Club | Private |
| 7 | Milburn Country Club | Private |
| **8** | **Colbert Hills** | **Public ← selection** |

Verified by four independent methods (raw HTML rubric/title/subtitle order,
embedded JSON with a corrected off-by-one parse, rank-addressed JSON with
explicit `"rank"`/`"private"` fields, and live WebFetch as a cross-check),
applied across three Wayback snapshots. **All four methods agreed on all ten
ranks in all three snapshots.** Verdict item 17: "Colbert Hills #8 is the
highest-ranked Public entry — confirmed."

**Published:** the intro and one FAQ ("Which courses were ranked above Colbert
Hills?") name all seven Private courses and state that seven entries were
passed over. This is the correction the corrections brief required: "the
finder's 'zero skipped' meant only that the list had no missing rank numbers,
and the guide may say so."

---

## 1. Geography

| Field | Value | Verdict |
|---|---|---|
| course | Colbert Hills | items 17 (selection), confirmed |
| city | Manhattan, Kansas | item 23 — confirmed (Golf Digest subtitle + operator footer) |
| **County: Riley County** | confirmed | item 25 — Census geocoder, re-run by the verifier on the course's own coordinates (39.2128451, -96.6405934), cross-checked against Nominatim independently resolving the same coordinates to "Colbert Hills Golf Course, 5200, Colbert Hills Drive, Manhattan, Riley County, Kansas, 66503." |
| Incorporated Place | Manhattan city | item 26 — confirmed, same Census geocoder response |

`county: "Riley County"` is taken directly from the verdict, not derived from
recollection — the standard set by the Oregon checkpoint (`docs/golf/oregon.md`
§ "Identity and the county field"), after county miscitation recurred across
the ballpark run.

**Basecamp: `destination: "Manhattan, Kansas"`.** The Incorporated Place for
the course's coordinates is Manhattan city (item 26); this is also where every
sourced lodging and dining option in this file sits.

---

## 2. The guide

`slug: kansas-golf-guide` · `destination: "Manhattan, Kansas"` ·
`state: "Kansas"` · `county: "Riley County"` · `photos: []`

### Intro

| Published | Verdict |
|---|---|
| "Golf Digest's 2025-'26 Best in State ranking places Colbert Hills eighth in Kansas, labelled 'Public.'" | §0, item 17, item 19 (ranking is "2025-'26 Best in State" per body text + pill title) |
| The seven named Private courses, and "makes Colbert Hills the highest-ranked Public course on the list" | §0 table, item 17 |
| "a Kansas State University course in Manhattan, Riley County" | item 69 (KSU home course), items 23/25/26 |
| "designed by eight-time PGA Tour winner Jim Colbert along with architect Jeff Brauer" | item 64 — confirmed verbatim, operator's own site |
| "Today is September 5, 2026: the course's own closures calendar shows the entire facility... closed all day September 13, 14 and 15, and again September 27, 28 and 29 — the first of those dates eight days away." | items 40–42, and §3 of the verdicts file ("EXACTLY WHICH DATES THE FACILITY IS CLOSED"), which states plainly: "Sunday 13 September 2026 — eight days from today." Per the corrections brief: "Today is 5 September 2026, so the first closure is eight days away. Put the September dates in the intro as well as the FAQ." |

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`, no trailing mode. **No trip
duration appears anywhere in this file.**

| Published | Verdict |
|---|---|
| "5200 Colbert Hills Drive, Manhattan, Kansas 66503, in Riley County" | item 58 — confirmed, operator footer |
| MHK 6.8 miles by road | item 60 — confirmed, OSRM recomputed |
| MCI 137.3 miles by road | item 61 — confirmed, OSRM recomputed. **This replaces the finder's unsourced "roughly 115 miles west of the Kansas City area"** (Uncertainty 1), which the verdicts file explicitly rejects and replaces with "about 137 miles west of Kansas City International Airport." |
| Topeka 62.0 miles, "I-70 west, then north on K-177 (Fort Riley Boulevard) into Manhattan, then Tuttle Creek Boulevard, Kimball Avenue, Vanesta Drive and Colbert Hills Drive" | item 62 — confirmed, road names/refs taken directly from OSRM turn-by-turn step data |

**No duration is published anywhere** — every distance above is a sourced road
mileage with a route, per the verdicts file's own framing ("All are sourced
road mileages, not durations").

### Section 2 — `The course`

| Published | Verdict |
|---|---|
| *"Designed by eight-time PGA Tour winner Jim Colbert along with architect Jeff Brauer."* | item 64 — confirmed verbatim |
| *"the course opened with an invitational pro-am tournament on April 30, 2000"* | item 66 — confirmed verbatim, Wikipedia |
| opening field, *"Jim Colbert, Lee Trevino, Raymond Floyd, Annika Sörenstam and Manhattan native Deb Richard"* | item 67 — confirmed verbatim |
| *"was host to the Big 12 Conference women's golf championships on April 19–21, 2002"* | item 68 — confirmed verbatim |
| KSU home course; "environmental research and turf management facility" | item 69 — confirmed verbatim |
| First Tee of Manhattan / Earl Woods National Youth Golf Academy | item 70 — confirmed verbatim, operator |
| Par 72, 7,525 yards, rating 77.50 | item 72 — confirmed, Wikipedia infobox |
| Operator homepage states 7,525 yards | item 73 — confirmed |

**Not published: the operator's own "highest-ranked public course in state" claim as a sourced ranking fact.** Item 71 confirms it only as an operator claim; the guide's ranking claim rests on the Golf Digest verdict (§0), not on the operator repeating it.

### Section 3 — `Rates and closures`

| Published | Verdict |
|---|---|
| 2026 seasonal rates, April 1 – November 10, $115/$105/$80, green fees and cart included | item 31, item 33 — confirmed verbatim |
| Military $95/$95/$80, Senior (60+) $90/$90/$80, KSU Alumni $90/$90/$80 | item 34 — confirmed verbatim |
| *"All rates will change as we move through the season so check back with us. The Rates are adjusted for spring, summer, and fall and reflect the rack rate for golf or golf and cart."* | REFUTATION 3 in the verdicts file — the finder omitted this qualifier; it is now required. Corrections brief: "Rates change through the season — the finder omitted that and it must be published, because a price without that qualifier misleads." **Every price in this file carries it or sits beside it.** |
| Ride-along fee $25 per person; club rental $50 per set | item 37/38, with the typo correction — see §4 below |
| Closures calendar, all dates | items 40–45, §3 of the verdicts file, verbatim date list |

**Not published: any reason for a closure** ("tournament blocks" etc.) — per
Uncertainty 2, the finder's own inference, explicitly excluded ("Do not
publish a reason. Publish the dates and nothing about why"). The section
closes with "The page gives no reason for any closure" rather than supplying
one.

**Not published: Golf Digest's `"$90"` price field.** The verdicts file's
"WHAT MUST NOT BE PUBLISHED" §2 forbids it outright: it contradicts the
operator's own $115/$105/$80 and is not a rate the course charges.

**Not published: any winter-closure claim.** The verdicts file distinguishes
the rate *season* (Apr 1 – Nov 10) from a closure — "those are different
facts" — and no winter-closure statement appears on the operator's site.

### Section 4 — `Basecamp: Manhattan`

| Published | Verdict |
|---|---|
| Samy Family Stay & Play Lodge: *"an elegant lodge complex located directly behind the driving range at Colbert Hills"*, *"two sides, each featuring 4 sleeping rooms (8 total)"* | item 46 — confirmed verbatim |
| Colbert's Bar & Grill is the course's own restaurant | item 47 — confirmed |
| Bluemont Hotel: *"The Premier Hotel of Manhattan, KS"* | item 48 — confirmed (own `<title>`) |
| Tallgrass Tap House: titles its own site *"Tallgrass Tap House \| Manhattan, KS"* | item 49 — confirmed (own `<title>`) |

**No overlap with the project's Kansas City guide** — item 50 confirms this
basecamp (Riley County) is unrelated to Kansas City, KS/MO.

### Section 5 — `Day two: Wabaunsee Pines`

This entire section rests on **REFUTATION 4** in the verdicts file, which
overturns the finder's conclusion that "no second nearby publicly-accessible
course could be reliably sourced" (item 57). Corrections brief: "A second
course DOES exist — the finder was wrong that none could be sourced."

| Published | Verdict |
|---|---|
| Wabaunsee Pines Golf Course, Lake Wabaunsee, Alma, Kansas | REFUTATION 4 — confirmed, live/current own site |
| 48.6 road miles from Colbert Hills | REFUTATION 4 — OSRM, computed by the verifier |
| *"a nine hole public golf course featuring limestone berms and native grasses of the Flint Hills"* | REFUTATION 4 — confirmed verbatim, own site |
| Cash or check only; no tee times — *"We are a first come first served course"* | REFUTATION 4 — confirmed verbatim |
| 2025 rates, effective 1/1/25: $15 for nine holes, $20 for eighteen, cart $15 | REFUTATION 4 — confirmed, with its own 2025 date, which is why the date is published alongside the price rather than dropped |

**Caveats honoured, per the verdicts file's binding conditions on this text:**
this guide does not describe Wabaunsee Pines as a resort pairing or a peer of
Colbert Hills — it is stated plainly as nine holes, volunteer-built and
cash-only. The 48.6-mile figure and the phrase "a separate trip rather than a
same-day add-on" are the honesty the corrections brief required ("be honest
that it is not next door") — worded to avoid the banned proximity vocabulary
itself (see §5 below on gate compliance) while still conveying that this is
not a nearby course.

**Not published: Sand Creek Station** as the second course. It is a real
"Public"-labelled entry (rank #10) but sits 108.1 road miles away — more than
twice the distance to Wabaunsee Pines — and the verdicts file records it only
as the finder's ruled-out alternative, not as a publishable pairing.

**Not published: Stagg Hill Golf Club, Wildcat Creek, University Park,
Manhattan Country Club, Junction City Golf Course, or Wamego Country Club.**
Per the verdicts file's "WHAT MUST NOT BE PUBLISHED" §9–10: none of the first
five has a reachable operator site, and Wamego Country Club's own site states
it is private, members and guests only.

### FAQ

Six questions. The gate requires one matching `play|tee time|tee times|book`;
one matches directly ("How do I book a tee time at Colbert Hills?") and states
the booking-window gap, the rates with their qualifier, and the closure dates
— satisfying the "states whether and how the course can be played" test in one
answer, per the corrections brief's requirement.

* **"How do I book a tee time at Colbert Hills?"** — states the booking
  channel (colberthills.com → colberthills.cps.golf), states plainly that the
  booking window is unsourced (see §4 below), and carries the September
  closure dates plus rates with the seasonal-change qualifier.
* **"Is Colbert Hills closed anytime soon?"** — the September 13–15/27–29
  dates and the "eight days away" framing, plus the clubhouse-only dates.
* **"What does a round cost?"** — the 2026 rate table with the source's own
  date and the seasonal-change qualifier attached.
* **"Where is Colbert Hills?"** — address, MHK/MCI/Topeka mileages.
* **"Which courses were ranked above Colbert Hills?"** — the seven Private
  courses (§0).
* **"Is there a second course for a day two round?"** — Wabaunsee Pines, 48.6
  miles, honestly framed as a separate trip.

---

## 3. Places, against the verdicts they rest on

Two `golf-course` places — the gate's maximum: the ranked course and one
second course.

| slug | kind | rests on |
|---|---|---|
| `colbert-hills` | `golf-course` | §0, items 23/25/26, 64, 66–70, 72–73 |
| `wabaunsee-pines` | `golf-course` | REFUTATION 4 |
| `samy-family-stay-and-play-lodge` | `hotel` | item 46 |
| `colberts-bar-and-grill` | `restaurant` | item 47 |
| `bluemont-hotel-manhattan-ks` | `hotel` | item 48 |
| `tallgrass-tap-house-manhattan` | `brewery` | item 49 |

Every one of the six has `photos: []`, as does the guide. No photo scout has
run for this state.

**County field on `wabaunsee-pines`.** The verdicts file establishes the
course's town as Alma, Kansas, at Lake Wabaunsee, but does not itself run a
county geocode for that location the way it did for Colbert Hills (item 25).
`county: "Wabaunsee County"` is published on the strength of an
uncontested, standing geographic record — Alma is the seat of Wabaunsee
County, Kansas, and the course's own name and its "Lake Wabaunsee" address
both name the same county — not on a verdict item that geocodes it directly.
This is recorded here rather than silently presented as equally sourced as the
Riley County figure, which does rest on a direct Census-geocoder verdict.

**No street address for either golf-course place beyond what the verdicts
establish.** Colbert Hills carries its confirmed operator address (item 58);
Wabaunsee Pines carries none, because none was fetched as a discrete field —
only "Lake Wabaunsee, Alma, KS 66401" appears in the verdicts file's prose, and
it is folded into the summary rather than promoted to a structured field the
verdict does not itself structure.

Six entries, one per place, all `place_slug` values resolving inside this
file.

---

## 4. The unsourceable booking window

Per the corrections brief: "The booking window is genuinely unsourceable.
`cps.golf` 403s both tools and was never archived. Say so plainly; do not
invent a number." The verdicts file confirms this as a **block**, tested three
independent ways by the verifier (item 29, and the dedicated subsection
"Booking window — block confirmed, tested three ways myself"):

* curl (browser UA) → HTTP 403, Cloudflare challenge body, on `/`,
  `/onlineresweb/` and `/onlineres/`.
* WebFetch → HTTP 403 Forbidden.
* Wayback → zero snapshots of any path under `colberthills.cps.golf`, ever.

**Published:** the FAQ states this outright — "exactly how many days in
advance a tee time can be booked is not published anywhere this guide can
verify — this guide says so plainly rather than guessing at a number." No
number is invented anywhere in the file.

---

## 5. The "peson" typo, and why the guide does not quote it

The finder's report placed `"Ride Along Fee: $25 per person"` inside
quotation marks. **REFUTATION 2** in the verdicts file establishes that the
page itself reads:

> `Ride Along Fee: $25 per peson`

The typo is the site's own. Per the corrections brief: "Do NOT quote the
site's '$25 per person' line as verbatim — the page actually reads 'peson'.
The finder silently corrected the typo, which makes the quote non-verbatim.
Either quote it exactly with the typo, or paraphrase without quotation marks."

**This guide paraphrases, without quotation marks, and flags the typo
explicitly** rather than either silently correcting it (the finder's failure)
or publishing "peson" as though it were the intended fee name (which would
misread as this project's own error to a copy-editing reader). Published text:
"A ride-along fee applies at $25 per person (the operator's own page spells it
'per peson'), and club rental runs $50 per set." The parenthetical exists
specifically so a reader checking this guide against the source is not
confused by a spelling mismatch, and so this trace records the typo as a
subtle finder failure worth recording, per the dispatch's own instruction —
"a silently-corrected typo turning a verbatim quote into a paraphrase is a
subtle failure worth recording."

---

## 6. The "evaluations" non-claim

Per the corrections brief: "Do not claim 'evaluations' appears on the page —
it occurs only in the meta description, not the body." The verdicts file's
REFUTATION 1 confirms exactly this: "evaluations" appears once, in
`<meta name="description">` — "thanks to tens of thousands of evaluations from
our course experts" — and nowhere in the article body. The verdicts file
states plainly: "Do not publish any 'tens of thousands of evaluations' claim —
it is Golf Digest marketing text about its own methodology, which this
project does not republish."

**Not published anywhere in this file.** No sentence in `kansas.json`
mentions "evaluations," a panelist count, or Golf Digest's methodology beyond
the ranking name and edition ("2025-'26 Best in State").

---

## 7. Every omission, and why

**O1 — Golf Digest's `"$90"` price for Colbert Hills.** Verdicts file, "WHAT
MUST NOT BE PUBLISHED" §2: it contradicts the operator's own $115/$105/$80 and
is not a rate the course charges. Omitted entirely.

**O2 — any "days in advance" booking-window number.** Genuinely unsourceable
(item 29–30, §4 above). The FAQ states the gap instead of inventing a figure.

**O3 — any reason for the closures.** Uncertainty 2 — the finder's own
inference ("likely tournament blocks"), explicitly excluded by the verdicts
file. The section states "The page gives no reason for any closure."

**O4 — any winter-closure claim.** The rate season (Apr 1 – Nov 10) is a
different fact from a closure, per the verdicts file, and no winter-closure
statement exists on the operator's site.

**O5 — "tens of thousands of evaluations."** Golf Digest's own meta-description
marketing about its methodology, confirmed present only in a `<meta>` tag, not
the body. See §6 above.

**O6 — "roughly 115 miles west of the Kansas City area."** Uncertainty 1 —
unsourced, no defined edge for "the Kansas City area." Replaced with the
sourced 137.3 mi from MCI (item 61).

**O7 — the verbatim quotation `"Ride Along Fee: $25 per person"`.** REFUTATION
2 — the page reads "peson." Paraphrased without quotation marks instead. See
§5 above.

**O8 — Stagg Hill Golf Club, Wildcat Creek Golf & Fitness, Manhattan Country
Club, University Park Golf Course, Junction City Golf Course.** None has a
reachable operator site (verdicts file §F); the underlying OSM map features
prove a mapped polygon, not a trading business.

**O9 — Wamego Country Club as a public second-course option.** Its own site
states it is private, members and guests only.

**O10 — Sand Creek Station as the second course.** A genuine "Public"-labelled
entry, but 108.1 road miles away — more than twice Wabaunsee Pines' distance —
and the finder's own reasoning for rejecting it as a practical day-two pairing
is sound per the verdicts file, even though its overall conclusion ("no second
course exists") was wrong.

**O11 — the operator's own "highest-ranked public course in state" claim, used
as a sourced ranking fact.** Item 71 notes it is confirmed only as an
operator claim, correctly not laundered into the source of record; the
guide's ranking claim rests on the independently-verified Golf Digest data.

**O12 — the Golf Digest intro quote about "course panelists."** Not load-bearing
to any clause this guide needed to make, and adds nothing the ranking claim
doesn't already establish; omitted for that reason rather than any block.

**O13 — every trip duration.** No duration of any kind appears in this file;
every distance is a road mileage with a route or a compass direction on a
named road, per items 60–62 and the "sourced, not durations" framing in the
verdicts file itself.

**O14 — every photo.** `guide.photos: []` and `photos: []` on all six places.
No photo scout has run for Kansas.

**O15 — a structured street address for Wabaunsee Pines.** See §3 above: the
verdicts file's prose names "Lake Wabaunsee, Alma, KS 66401" but does not
structure it as a discrete address field, so none is invented here.

---

## 8. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, on the first run. No allowlist entry was added;
`Ethos.GolfProse`'s allowlist remains `[]`.

**The proximity instruction ("be honest that it is not next door") was
satisfied without the banned vocabulary itself.** "Next door," "steps from,"
"within walking distance," "around the corner" and "north of the course" are
all gated phrases (`Ethos.GolfProse`'s proximity patterns). The published
sentence instead states the exact mileage and calls Wabaunsee Pines "a
separate trip rather than a same-day add-on" — a checkable, sourced framing
that conveys the same honesty the corrections brief asked for without
tripping the pattern that bans vague relational language.

**No duration language was drafted and caught; none was ever written.** Every
distance in this file (6.8 mi, 137.3 mi, 62.0 mi, 48.6 mi) is a road mileage
with a route or a named highway, matching the discipline the verdicts file
itself insists on ("reported as mileage, not a drive-time estimate").

Full suite for this file only (not run repo-wide, per instructions): 9 tests,
0 failures.

---

## 9. What this file does not touch

* `priv/seed_data/golf_courses_roster.json` — owned by a finalize agent.
* No commit was made.
* No repo-wide `mix format` was run; no sibling state's file was modified.
