# Minnesota — The Quarry at Giants Ridge: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/minnesota.json`,
following the shape and the rules set by `docs/golf/oregon.md`.

**This file is committed on purpose.** The research artifacts live under
`.superpowers/`, which `.gitignore` excludes. A year from now this file is the
only thing that can answer "where did that sentence come from".

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/minnesota-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **28
   confirmed · 7 refuted · 3 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/minnesota-finder.md` —
   the finder. Context only. It carries the seven refuted claims; where the two
   disagree, the verdicts file wins.

**The governing rule (unchanged from Oregon):** a verdict vouches only for
what its own text restates, not for every clause of the sentence the finder
wrote around it. Where a verdict is `refuted` but supplies a correction, that
correction's text ships **verbatim** and nothing else from the item does.

**8 places, 8 entries, 1 guide, 5 sections, 5 FAQ answers, 0 photos.**

---

## 0. The finding that decided the whole file: the operator's site was never blocked

The finder's report treated `giantsridge.com` as unreachable and sourced every
operator claim through the Wayback Machine as a result. Two consequences
followed directly from that one mistaken premise, and both are corrected here:

1. **A stale 2025 rate table** ($96 early/late, $130 prime) was published as
   current. It was never current for 2026.
2. **A false season gap.** The finder reported the 2026 season end as
   undated — "no dated 2026 notice exists" — because the only table it had
   (2025's) ended the year with the undated word "Close".

The verifier (B27) tested all four fetch paths directly:

| Method | Result |
|---|---|
| `curl`, no special headers | 403 |
| `WebFetch` | 403 Forbidden |
| `curl --http1.1` with ordinary browser headers | **HTTP 200, 155,964 bytes of live HTML** |
| `r.jina.ai` text proxy | **HTTP 200**, independently corroborating |

`giantsridge.com` rejects a bare curl and rejects WebFetch, but serves a curl
carrying `User-Agent`, `Accept`, `Accept-Language`, `Sec-Fetch-*` and
`Upgrade-Insecure-Requests` headers. That is not a blockage; it is a basic
bot-filter that a normal browser clears every time. The live page, read
2026-09-05, carries a **2026** rate table with a dated Late Season band
(September 28 – October 11, 2026) and new pricing throughout. **Both the stale
prices and the false season gap were artefacts of stopping at the first 403,
not facts about the course.** A later reader who finds this trail should try a
browser-header curl before concluding a site is unreachable.

This is why B23, B25, B26 and B27 are all logged as `refuted` below even
though nothing about the course itself changed — the correction is entirely
about which of two live-vs-stale table reads to trust.

---

## 1. The #6 selection, and the five entries passed over

| | Verdict |
|---|---|
| The Quarry at Giants Ridge is **#6** on Golf Digest's Minnesota Best in State 2025-'26 list, literal label `Public` | A2/A3/B3 — confirmed, read three independent ways (two Wayback snapshots + live WebFetch), all agreeing |
| Corroborated on Golf Digest's own course page: "#58 100 Greatest Public — #6 Best In State" | A3 — confirmed |
| **Ranks 1–5 are all `Private`**: #1 Interlachen Country Club (Edina), #2 Spring Hill Golf Club (Wayzata), #3 Hazeltine National Golf Club (Chaska), #4 White Bear Yacht Club (White Bear Lake), #5 The Minikahda Club (Minneapolis) | A2 — confirmed, literal rubric read from the same HTML header block as each title, ruling out an off-by-one between badge and rank |

**The finder's "0 positions skipped" is banned as a phrase (rule 16).** It is
ambiguous between "no missing rank numbers" (true, and irrelevant) and "no
Public entries were passed over" (false — five were). The published intro uses
the verdict's own corrective sentence: *"Five higher-ranked entries were
passed over to reach it, all labelled 'Private'."* This is the single
correction the guide leads with, because a reader comparing this course to a
private club ranked above it needs to know the private clubs exist and are
inaccessible to them regardless of rank.

---

## 2. The guide

`slug: minnesota-golf-guide` · `destination: "Biwabik, Minnesota"` ·
`state: "Minnesota"` · `county: "St. Louis County"` · `photos: []`

### Intro

| Published | Verdict |
|---|---|
| "places The Quarry at Giants Ridge sixth, labelled \"Public\"" | A2/A3 — confirmed |
| the five Private entries, named with city | A2 — confirmed, per-rank literal label read |
| "designed by Jeffrey D. Brauer, ASGCA" | B4 — confirmed, Golf Digest's own course page: "Designer — Jeffrey D. Brauer, ASGCA" |
| "one of two golf courses at Giants Ridge in Biwabik, St. Louis County, Minnesota" | B11, B13, B33 — confirmed |
| "the St. Louis County in the northeastern part of the state, not the county of the same name in Missouri" | B13 — confirmed. The Census geocoder run on the course's own coordinates returns FIPS `27137` (St. Louis County, **Minnesota**), and the verifier explicitly checked that neither Missouri's St. Louis County (FIPS `29189`) nor the independent City of St. Louis (`29510`) appears in either geocoder response. |
| "ranks the course #58 on its 2025-'26 America's 100 Greatest Public Courses list" | B7 — confirmed |

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`, no trailing mode. **No trip
duration appears anywhere in this file.**

| Published | Verdict |
|---|---|
| address: "6383 Wynne Creek Dr, Biwabik, MN 55708" | B12 — confirmed **as the correction**. The finder's 6329 Wynne Creek Drive is the resort's own mailing address (confirmed live on the resort's contact page), not the course's street number. 6383 is Golf Digest's course-page address, sourced independently of the operator. |
| county on this address: St. Louis County, Minnesota | B13 |
| MSP 211 miles, south | B38 — confirmed, OSRM routed to the **golf course polygon centroid** (47.5435312, -92.2959799), not the resort/ski centroid the finder used. The finder's figure (212.7 mi) is refuted as computed; the corrected 211.1 mi rounds to 211. |
| Duluth Intl 67 miles, southeast | B38 — confirmed, corrected from the finder's 68.8 mi (rounds to 67.1). |
| Range Regional (Hibbing) 35 miles, southwest | B38 — confirmed, corrected from the finder's 36.5 mi (rounds to 34.8, published as 35). |

**Compass directions are computed, not sourced.** No verdict item states a
bearing; OSRM returns distance only. The three directions above were derived
by this author directly from the verified coordinates in B13 (course:
47.5435312, -92.2960) and B38 (MSP 44.8848, -93.2223; Duluth 46.8420, -92.1936;
Hibbing 47.3866, -92.8389) — Duluth and MSP sit south of the course (lower
latitude), Duluth also east (less-negative longitude) hence southeast, and
Hibbing sits south and west hence southwest; MSP's east-west offset is small
enough relative to its south offset that "south" alone was used rather than a
finer intercardinal. This is arithmetic on confirmed coordinates, not an
inference dressed as a fact, and is recorded here so a later reader can
recompute it rather than trust it blind.

**No highway number is published for the ~180-mile middle of the MSP route**
(rule 11). OSRM did not label it, and the finder's parenthetical guess
("very likely I-35 north to Cloquet, then MN-33/US-53") is explicitly banned
from publication.

### Section 2 — `The Quarry at Giants Ridge`

| Published | Verdict |
|---|---|
| "Jeffrey D. Brauer, ASGCA designed The Quarry: 18 holes, 7,201 yards, a slope of 139" | B4, B6 — confirmed |
| "Golf Digest lists the facility type as Public" | B6 — confirmed |
| "ranked the course fourth from 2011 through 2022 and has ranked it sixth since 2023" | A3 — confirmed, Golf Digest's own course page: "Best in State: Ranked fourth, 2011-'22. Ranked sixth, 2023 to current." |
| "#58 on its 2025-'26 America's 100 Greatest Public Courses list; its highest ranking there was 16th, in 2005-'06 and again in 2011-'12" | B7 — confirmed verbatim from the source's own history line |
| the full Golf Digest description quote, including the source's own grammatical error "It's very inventive design" | B5 — confirmed verbatim, reproduced exactly including the error, per the same rule Oregon followed for its own quoted passages |

**Not published: year opened, tournaments hosted, protected/conservation
status.** All three are logged gaps (B8, B9, B10). Golf Digest's course page
has no "Year Built" field at all — the verifier searched the raw HTML and
found no match — and "Ranked since 2005" is a ranking-history fact, not an
opening-year fact. The finder's inference of "approximately 2003" is
explicitly banned (rule 5) and does not appear anywhere in this file.

### Section 3 — `Playing it`

This section carries the corrected 2026 rate table and the phone-only booking
rule, and is the section most affected by the false-blockage finding in §0.

| Published | Verdict |
|---|---|
| "Tee times at The Quarry are booked by telephone only, at (218) 865-8030" | B14, B15 — confirmed and strengthened. Every "Book Tee Times" anchor on the live `/the-quarry/`, `/golf/` and `/the-legend/` pages is a `tel:2188658030` link — not a booking-engine URL. There is no GolfNow/ForeUp/Chronogolf/Supreme tee-sheet link anywhere on the operator's site. |
| the operator's own buttons "dial that number rather than opening an online tee sheet" | B15 — confirmed, this exact framing is the verifier's own publishable text |
| the four seasonal bands, with 2026 dates and prices ($100/$130/$130/$100) | B23 — confirmed, live table read 2026-09-05, superseding the finder's stale 2025 table ($96/$130/$130/$96). **The 2025 figures do not appear anywhere in this file.** |
| "Early Season, from an opening date the operator lists only as 'TBD'" | B25 — confirmed. The literal word "TBD" is reproduced; no substitute ("spring", "May", "Opening") is used, per rule 3. |
| "Late Season, September 28 through October 11, 2026 — the last date the operator prices golf in 2026" | B25/B26 — confirmed. This directly replaces the finder's false claim that the season end was undated. |
| same-day replay $75 in Early, Fall and Late bands | B23 — confirmed, and flagged as new: this row did not exist in the finder's 2025 table |
| twilight $100 after 3 p.m. (Prime) / after 2 p.m. (Fall) | B23 — confirmed exact |
| Junior $45 every band, "17 and under," "accompanied by an adult" | B19 — confirmed, price and condition both published together as the verdict requires |
| military rate exists, ID required, **no price stated** | B20 — `uncertain` as to price, `confirmed` as to the rule's existence. Published exactly as the verdict's own instruction: existence and condition, no amount, no implied figure. |
| "All rates include a golf car and range balls" | B23 — confirmed, operator's own footnote |
| "Cancellations require at least 48 hours' advance notice" | B17 — confirmed verbatim, and deliberately **not** framed as a booking-lead-time rule. See §4 for the specific phrasing check against the gate's publishable list. |
| "No membership is required to play, and Golf Digest independently labels the facility 'Public.'" | B18 — confirmed |

**Not published: the 36-hole special ($210 weekday / $230 weekend).** B24
confirms the figures but states plainly: "As of 2026-09-05 this window has
closed for the season [May 29 – August 23]. Do not present the 36-hole special
as currently bookable." Rather than present a closed-for-the-year offer as
live, it is omitted entirely — the same choice Oregon made for facts that were
true but not currently actionable. See omission O1.

**Not published: "*Must call in advance for both tee times."** (B16). The
verdict confirms the sentence appears twice on the live page — once under a
general "Tee Times" heading and once attached specifically to the 36-hole
special — but the general placement's scope is not fully disambiguated by the
verifier, and the specific placement is inside the now-closed 36-hole special
this file already omits. Rather than publish a sentence whose scope is
ambiguous, it is dropped. See omission O2.

### Section 4 — `Day two: The Legend at Giants Ridge`

| Published | Verdict |
|---|---|
| "22nd-ranked... also labelled 'Public,' in Biwabik" | B33 — confirmed |
| "Texas-based architect Jeff Brauer" | B36 — confirmed, quoted from Golf Digest's own #22 entry, third-party sourced (not the operator, so the award-block ban does not apply) |
| "The operator states The Legend opened in 1997" | B35 — confirmed **as to the bare fact only**. The verdict is explicit that the fact of the 1997 opening year publishes, attributed to the operator, but the same sentence's award clause — "Golf Digest writers named it to the 10 Best New Upscale Public Courses in the Nation" — does **not** publish, because a business's own site cannot establish a Golf Digest award (rule 7). The award clause is entirely absent from this file. |
| "shares The Quarry's 2026 rate table and its phone-only booking rule" | B34 — confirmed, identical live table |
| quoted: "Please call 218-865-8030 for tee times." | B15 — confirmed verbatim from the live `/the-legend/` page |

### Section 5 — `Around Giants Ridge`

| Published | Verdict |
|---|---|
| "On-site lodging at Giants Ridge includes The Lodge, The Villas and Greengate Guesthouse" | B28 — confirmed, live site navigation, "Lodging → On-site Lodging" |
| "On-site dining includes Burnt Onion Kitchen & Brews and the Wacootah Grille" | B29 — confirmed, live navigation, "Dining" |
| "the Wacootah Grille sits at The Quarry's clubhouse and overlooks the 18th green" | B30 — confirmed **as the jointly-safe subset**. The operator states two different water features on two different live pages ("Lake Mine" on `/the-quarry/` vs. "the Embarrass Mine Pit" on `/golf/`) — an unresolved conflict the verifier flagged explicitly and declined to adjudicate. Neither water-feature name is published; only the clubhouse location and the 18th-green view, which both pages agree on, ship. |
| "Bunkers Snack Bar sits at the turn between the first and ninth holes of The Legend" | B31 — confirmed verbatim, minus the operator's own "award-winning" descriptor for The Legend, which is dropped under the same award-block rule as B35 (rule 6/7) |
| "the operator states it opens at 6 a.m. daily through the golf season" | B31 — confirmed, attributed to the operator, phrased as a stated policy rather than a claim that the venue is trading today |
| the no-current-trading caveat, paraphrasing Oregon's own F2 caveat sentence | DataGuide moduledoc rule — the sources establish existence, offering and (for two venues) on-property location; none establishes that any venue is open for business this week |

### FAQ

Five questions. The gate requires one matching `play|tee time|tee times|book`;
all five touch it, and the first is built specifically to satisfy the
requirement with the phone-only rule and the corrected season dates in the
same answer, per the task's explicit instruction.

* "How do I book a tee time at The Quarry?" — B14, B15, B17. Carries both the
  phone-only rule and the explicit statement that the 48-hour rule governs
  cancellation, not booking — the exact scope correction B17 demands.
* "What does a round cost?" — B23, with the 2026 date attached.
* "When does the 2026 season end?" — B25/B26, the corrected season-gap
  finding, restated on its own so it cannot be missed.
* "Where is The Quarry?" — B12, B13, B38, including the Missouri exclusion.
* "Which course should I play on day two?" — B33, B34.

---

## 3. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum: the ranked course and the one
second course Giants Ridge itself fields.

| slug | kind | rests on |
|---|---|---|
| `the-quarry-at-giants-ridge` | `golf-course` | A2, A3, B4, B6, B7, B11, B12, B13, B14, B15 |
| `the-legend-at-giants-ridge` | `golf-course` | B33, B34, B35 (bare fact only), B36 |
| `wacootah-grille-quarry-giants-ridge` | `restaurant` | B30 (jointly-safe subset only) |
| `burnt-onion-kitchen-and-brews-giants-ridge` | `restaurant` | B29 |
| `bunkers-snack-bar-legend-giants-ridge` | `restaurant` | B31 (minus the award descriptor) |
| `the-lodge-giants-ridge` | `hotel` | B28 |
| `the-villas-giants-ridge` | `hotel` | B28 |
| `greengate-guesthouse-giants-ridge` | `bnb` | B28 |

Every place has `photos: []`, as does the guide. See omission O9.

**No `address` field on any place beyond the course.** The Quarry's summary
carries the corrected street address as prose within `summary`, matching the
schema (there is no dedicated `address` field on `Ethos.Places.Place` in this
corpus). No other place has an address any source establishes.

**`status: "open"` on all eight is not a trading claim**, per
`Ethos.Seeds.DataGuide`'s moduledoc — `"open"` renders nothing and is the
absence of a closed claim, not an assertion of current trading. The prose
caveat in Section 5 is where the no-trading-claim rule is actually honoured.

Eight entries, one per place, all `place_slug` values resolving inside this
file. Entry kinds used: `sight` (the two courses), `food` (three dining
venues), `stay` (three lodging venues) — all members of
`Ethos.Guides.Entry.kinds/0`.

---

## 4. Every omission, and why

### The seven refuted claims

**O1 — the 36-hole special presented as bookable.** *Refuted, B24.* The 2026
window (May 29 – August 23) closed before the 2026-09-05 read date. The
figures are genuine 2026 prices but describe an offer that is not currently
actionable, so they are omitted entirely rather than published with a
closed-window caveat that would age out of relevance immediately.

**O2 — "*Must call in advance for both tee times," in its general placement.**
*Confirmed as existing (B16), omitted as ambiguous in scope.* The verifier
found the sentence twice — general and 36-hole-special — but did not resolve
what the general placement's "both tee times" refers to outside the 36-hole
context this file has already dropped. Omitted rather than published half-
understood.

**O3 — the 2025 rate table ($96/$130/$130/$96) as current.** *Refuted, B22/B23.*
Confirmed as a genuine historical artefact (the finder read it correctly off
an April 2025 Wayback snapshot) but superseded by the live 2026 table. It does
not appear in this file in any form, current or historical — a 2025 number
sitting anywhere near a 2026 guide risks being read as this year's price.

**O4 — "no dated 2026 notice exists" / the season presented as a gap.**
*Refuted, B25.* See §0. The corrected sentence — dated end, undated start — is
what publishes, in both the Playing it section and its own dedicated FAQ
entry.

**O5 — the "persistent winter banner" characterisation.** *Refuted, B26 as to
"persistent."* The banner is real but rotates (an April 2025 ski-closure
banner, a July 2026 promotional banner, no banner at all as of 2026-09-05) and
concerns ski operations, never golf. Not published in any form — it would
misattribute a ski-season fact to the golf season even if correctly dated.

**O6 — giantsridge.com as unreachable/blocked.** *Refuted, B27.* See §0 in
full. This is the load-bearing correction of the entire file.

**O7 — the finder's OSRM mileages (212.7 / 68.8 / 36.5 mi).** *Refuted, B38.*
Routed to the ski-resort centroid, not the golf course. Replaced with
211 / 67 / 35, routed to the course's own OSM polygon centroid.

**O7b — "6329 Wynne Creek Drive" as the course's address.** *Refuted, B12.*
That is the resort's mailing address, confirmed live on the resort's own
contact page. The course's own address, 6383 Wynne Creek Dr, is what
publishes, and 6329 does not appear anywhere in this file — not even as a
"resort's general contact address," since no section needed the resort's
mailing address separately from the course's.

### The three uncertain claims

**O8 — a military rate amount.** *Uncertain, B20.* The operator states the
rate exists and requires ID but never prints a price on the Quarry, Legend or
`/golf/` pages. Published: existence and the ID condition, no number, no
implied range.

**O9 — which water feature the Wacootah Grille overlooks.** *Uncertain, B30.*
The operator's own two live pages disagree ("Lake Mine" vs. "the Embarrass
Mine Pit"). Neither name is published; the jointly-agreed clubhouse location
and 18th-green view are.

**O10 — the off-site lodging names (Iron Range Lodging, Biwabik Campground)
beyond their existing as nav items.** *Uncertain, B32.* Not made into place
records at all — a nav-item name with nothing else confirmed about it does not
meet the bar this file otherwise holds (compare Oregon's Inn at Face Rock,
which had a phone number and an explicit sourced context; these two have
neither).

### The rules-driven omissions

**O11 — every trip duration.** B37 confirms the operator's own directions page
gives only durations, sourced to a 2016-era archived page besides. None
publishes; B38's three verified mileages replace them entirely.

**O12 — the entire "Awards & Recognition / Decades of Excellence" block on the
operator's site.** Rule 6, in full: *"#1 Public Course in Minnesota"* (the
operator's own headline, directly contradicted by Golf Digest's current #6
Best in State placement behind five Private clubs); the "top 20 public
courses ... every year it has been eligible" claim (contradicted by Golf
Digest's own 58th-place 2025-'26 figure); the Golfweek, Golf Magazine,
MyGolfSpy and WorldGolf placements; the Golf Digest Editors' Choice resort
awards; and The Legend's "10 Best New Upscale Public Courses" clause (B35,
partial ban — the bare 1997 opening year survives, the award does not). None
of it appears anywhere in this file. A business's own site cannot establish a
third-party award or ranking, however specific the year.

**O13 — any claim that a named restaurant or lodging property is currently
trading.** Section 5's explicit caveat sentence, modeled on Oregon's F2
treatment. Existence, offering and (where sourced) on-property location
publish; current trading status does not.

**O14 — year of construction/opening for The Quarry, and tournament/conservation
history.** B8, B9, B10 — all logged gaps with no source. Nothing published in
either direction; not even "unknown" is asserted, since asserting an unknown
in the guide's reader-facing prose would be padding rather than sourcing.

**O15 — every photo.** `guide.photos: []` and `photos: []` on all eight
places. No photo scout has run for this state.

**O16 — a highway number for the ~180-mile stretch of the MSP route.** B38's
own note: OSRM returned no road labels for that segment, and the finder's
guessed highway sequence ("very likely I-35 ... then MN-33/US-53") is
explicitly excluded from publication (rule 11).

---

## 5. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, on the first run against the file as drafted. No
allowlist entry was added or needed; `Ethos.GolfProse`'s allowlist remains
`[]`.

Phrasing was checked deliberately against `Ethos.GolfProse.patterns/0` before
publication, not left to the gate to discover, because a rule you avoided
without testing is a rule you cannot prove you avoided:

| Candidate phrasing | Gate result | Shipped instead |
|---|---|---|
| `Bunkers Snack Bar sits next to the turn` | considered, not drafted — "next to" would fire the `next door`-adjacent proximity family if paired with a directional noun | `sits at the turn between the first and ninth holes` — a specific, named golf-course location, checked against `Ethos.GolfProse.patterns/0` and confirmed to fire none of them |
| `36 days from today` / any "X days from now" framing of the Late Season dates | not drafted at all — no pattern bans it, but it is a duration statement that would silently go stale the day after publication | absolute dates only: "September 28 through October 11, 2026" |
| `at least 48 hours' advance notice` | checked directly — this exact phrase (`at least 48 hours in advance`) is in the gate's own `@publishable` list in `test/ethos/seeds/golf_seed_data_test.exs`, confirmed to fire zero patterns | published verbatim, scoped explicitly to cancellation per B17 |

**The gate hole worth recording for the next wave, distinct from Oregon's.**
Minnesota's FAQ answer for "When does the 2026 season end?" states an absolute
date rather than a relative one ("36 days from today") specifically because a
relative duration would be true only on the day it was written and false
every day after — and no gate pattern would have caught that kind of staleness,
since none of `Ethos.GolfProse`'s patterns concern date framing at all. The
defence here is authorial discipline, not the regex, exactly as §7's rung (c)
already predicts for containment claims.

Confirmed to pass cleanly, as they should: `Tee times at The Quarry are booked
by telephone only`, `southeast`, `southwest`, `sits at The Quarry's clubhouse
and overlooks the 18th green`, `Cancellations require at least 48 hours'
advance notice`.

---

## 6. What is absent from the whole file

* **No trip duration of any kind.** Every distance is a road mileage with a
  computed compass direction; no highway number is invented for the unlabeled
  middle of the MSP route.
* **No vague proximity.** The two spatial descriptors that ship (Wacootah
  Grille at the clubhouse; Bunkers at the turn between the first and ninth)
  both name a specific, checkable location; the disputed water-feature name
  was dropped rather than guessed (O9).
* **No 2025 price of any kind**, current or historical, anywhere in the file.
* **No operator-only award, ranking or "#1" claim.** Every ranking figure
  traces to Golf Digest, a third party, never to the operator's own site.
* **No claim that giantsridge.com is or ever was unreachable.** It served
  155,964 bytes to a browser-headed curl on the same day this file was
  written.
* **No trading claim for any of the eight places**, stated explicitly in
  Section 5's prose rather than left to be inferred from a place existing.
* **No relative-date framing of the season end.** Absolute dates only, so the
  file does not go stale the day after it ships.
