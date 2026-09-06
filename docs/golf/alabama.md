# Alabama — The Judge: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/alabama.json`,
following the register `docs/golf/oregon.md` established.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/alabama-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **45
   confirmed · 4 refuted · 8 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/alabama-finder.md` — the
   finder. Context only. Where the two disagree, the verdicts file wins.

**The governing rule:** a verdict vouches only for what its own text restates.

**The refuted-with-correction rule:** where a verdict is `refuted` but supplies
a correction naming what may still be published, that correction's text ships
**verbatim** and nothing else from the item does. Two of the four refuted items
in this state carry corrections, and both ship as the verdict wrote them —
see §2 below.

**4 places, 4 entries, 1 guide, 6 sections, 6 FAQ answers, 0 photos.**

---

## 0. The two failures this state is instructive for

**The green-fee "gap" was a URL guessed one character wrong.** The finder
checked `/rates/`, `/greenfees/` and `/capitolhill/rates/`, got three soft-404s
(all three return HTTP 200 with an identical 3,385-byte catch-all body), and
concluded no rate page existed. The real page is `rtjgolf.com/greensfees/` —
with an "s" — 7,836 bytes, titled "RTJ Golf Trail - Green Fees and Rates" in
its own `<title>`. The finder's *conclusion* (no dated Capitol Hill rack rate)
happened to survive independent re-verification, but its *method* did not, and
the skipped page led the verifier straight to `rtjgolf.com/fall/`, the "2026
Fall Specials" page the finder never opened either — the strongest dated price
in this file (REFUTED 36, CONFIRMED 37).

**The finder missed a tournament on the very course it recommended as the
fallback.** The finder's own report names The Senator as "the second publicly
accessible course" and does not flag any conflict. The Senator hosts the LPGA
Epson Tour's Guardian Championship on 11–13 September 2026 — five days after
this guide was authored, on the exact course being offered as the alternative
to the closed Judge (CONFIRMED 9). The finder wrote only that the Senator hosts
the event "each September," with no date fetched. Sending a reader to a course
mid-tournament, or implying it, is worse than a missing rate table: the
Guardian Championship claim is the reason this guide recommends **The
Legislator**, not The Senator, as the clean fallback, and states the
tournament dates rather than silently steering around them (UNCERTAIN 10,
CONFIRMED 11).

---

## 1. Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| ranked course | The Judge | CONFIRMED 13, 20 — the ranked entry is the bare course, not the Capitol Hill site |
| site | Robert Trent Jones Golf Trail at Capitol Hill | CONFIRMED 46 |
| city | Prattville | CONFIRMED 25 |
| state | Alabama | CONFIRMED 13 (Golf Digest Alabama ranking) |
| county | **Elmore County** | CONFIRMED 25, 28 — the course's own address (2600 Constitution Avenue) geocodes to Elmore by the Census's own address matcher, the strongest of four methods run |

`county: "Elmore County"` derives `/destinations/alabama/elmore-county`.

**The county straddle is real, not a geocoder artefact** (CONFIRMED 26, 27).
Prattville the incorporated place spans two counties: the course's address
geocodes to Elmore, a downtown Prattville control address (101 W Main St)
geocodes to Autauga. Published in the `Getting there` section and the FAQ,
because it is true and interesting, per the brief.

---

## 2. The guide

`slug: alabama-golf-guide` · `destination: "Prattville, Alabama"` ·
`state: "Alabama"` · `county: "Elmore County"` · `photos: []`

### Intro

| Published | Verdict |
|---|---|
| "places The Judge … seventh in Alabama with the access label \"Public\"" | CONFIRMED 13 |
| "the highest-ranked public course in the state: the six ranked above it … are all labelled \"Private\"" | CONFIRMED 14–19, naming Shoal Creek, Wicker Point Golf Club, The Country Club of Birmingham: West, The Ledges, Old Overton Club, Turtle Point Yacht & Country Club |
| "The ranked entry is The Judge itself, not the Capitol Hill site" | CONFIRMED 20 |
| "Capitol Hill fields three separate 18-hole courses on 54 holes" | CONFIRMED 46 |
| "The Judge has been closed for renovation since 1 December 2025. The operator's own maintenance schedule runs the closure through September 2026 and says the course reopens in October; the alert on the Capitol Hill page says \"a planned reopening in Fall 2026.\" No specific reopening day has been published, and the operator notes its schedule is weather-dependent and subject to change." | **REFUTED 3's correction, shipped verbatim.** Replaces "closed January to September 2026," which understates the shutdown by a month |
| "A visitor arriving before then should play The Legislator, Capitol Hill's other public course with no 2026 closure of its own." | CONFIRMED 11, synthesising the "when the Judge is playable" guidance |
| "The third course, The Senator, hosts the LPGA Epson Tour's Guardian Championship on 11–13 September 2026; whether it takes public play that week has not been published anywhere, so this guide does not say either way." | CONFIRMED 9 (dates), UNCERTAIN 10 (public access unresolved) |

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`. **No trip duration appears
anywhere in this file.**

| Published | Verdict |
|---|---|
| "2600 Constitution Avenue, Prattville, AL 36066, phone 334-285-1114" | CONFIRMED 41 |
| "about 10 miles by road from the Alabama State Capitol" | UNCERTAIN 42 — the verdict's own suggested text, chosen over the finder's decimal 11.6 mi (geocode-dependent to ±1.7 mi) and over the operator's own conflicting marketing figures (8 mi / 13 mi, refused per §5) |
| "roughly 15 to 17 miles by road from Montgomery Regional Airport (Dannelly Field), the nearest named commercial airport" | UNCERTAIN 43, CONFIRMED 44 — the verdict's own suggested text, spanning the operator's stated 15 mi and the measured 16.0–17.8 mi range rather than publishing the finder's single decimal |
| the county straddle paragraph | CONFIRMED 25–28 |

**No road name or route is published for either leg** — unlike Oregon, no
verdict here defends a specific highway for these two drives, so none is
invented.

### Section 2 — `The Judge, closed since December 2025`

| Published | Verdict |
|---|---|
| the REFUTED 3 correction, repeated | REFUTED 3 — deliberately repeated from the intro, since the brief calls for the closure to be said "plainly" and again |
| "That wording has held unchanged in snapshots from November 2025 through June 2026." | CONFIRMED 5 — five Wayback snapshots (Nov 2025, Dec 2025, Jan 2026, Mar 2026, Jun 2026) plus the live page all carry unchanged wording. Phrased as a range of absolute months, not as "for ten months," which would date itself against the writing day |
| "Once it reopens, expect overseeding: the Judge is overseeded on 26–27 October 2026, and for seven days afterwards carts are restricted to the rough — a playing-condition restriction, not a closure." | **REFUTED 4's correction, shipped verbatim** ("The Judge is overseeded on 26–27 October 2026; for seven days afterwards carts are restricted to the rough"), with the closure/restriction distinction stated explicitly per the verdict's own contrast (the Recovery column reads "Carts rough only 7 days," not "Closed") |
| "Ranked 7th, 2025-'26. Previous ranking: 6th." | CONFIRMED 21, verbatim from Golf Digest's own course page |
| "No opening year has been published for the course; Golf Digest's own record lists it as null." | CONFIRMED 23, UNCERTAIN 56 |

### Section 3 — `Playing Capitol Hill before The Judge reopens`

| Published | Verdict |
|---|---|
| "The Legislator carries no 2026 closure of its own; its only listed 2026 maintenance is an aerification already completed in June and an overseeding scheduled for 9–13 November 2026." | CONFIRMED 2 (table), CONFIRMED 11 |
| "The Senator … is also open and is in tournament condition: the LPGA Epson Tour's Guardian Championship is played on it, 11–13 September 2026, with a pro-am on the Thursday." | CONFIRMED 8, 9 |
| "Whether The Senator takes public play during that week has not been published anywhere — not by the operator, not by the tournament — so this guide does not say either way." | UNCERTAIN 10, and item 12 of "what must not be published" |
| "Anyone travelling to Capitol Hill in the first half of September should call the golf shop before planning a round on The Senator." | Synthesis of CONFIRMED 9/UNCERTAIN 10's own closing guidance ("anyone travelling in the first half of September should ring ahead") |

### Section 4 — `Booking a tee time`

| Published | Verdict |
|---|---|
| "Public golfers book up to 7 days ahead, online, through the RTJ app, or through RTJ Reservations." | CONFIRMED 29 |
| "Since June 1, 2026 the golf shop no longer takes advance bookings by phone; only same-day tee times may still be booked by phone, subject to availability." | CONFIRMED 33 |
| "Trail Card and Annual Members book 10 days ahead at the pro shop or 11 days ahead online or through the app; Platinum Members book 14 days ahead." | CONFIRMED 30, 31, 32 |
| "Package and group golfers continue to book through RTJ Reservations by phone or email." | CONFIRMED 29 (policy page quote) |
| "The 2026 Trail Card costs $49.95 and is available only to Alabama residents or those living within 100 miles of an RTJ Golf Trail site." | CONFIRMED 34 |

**UNCERTAIN 35 is why `/reservations/`'s "contact the Pro Shop directly"
language does not appear anywhere in this file.** The dedicated, dated policy
page governs; the un-updated pages do not get repeated.

### Section 5 — `Green fees`

| Published | Verdict |
|---|---|
| the "2026 Fall Specials" quote, $115/day, Sept 8 – Nov 15, 2026, and the $10 Judge surcharge, verbatim | CONFIRMED 37 |
| the Trail Card rate table, $56.95/$65.95, with the residency restriction stated in the same sentence | CONFIRMED 38, published only with the restriction attached per the verdict's own instruction |
| "Golf Digest's own price fields for The Judge — $155 on the course page, $125 in the ranking page's own data — are undated and disagree with each other by $30, so neither publishes here as a green fee." | CONFIRMED 39 |

**"Prices from $65 plus tax" does not appear anywhere in this file.** REFUTED
40 — it sits inside an HTML comment and never rendered on the live page.

### Section 6 — `Staying at Capitol Hill`

| Published | Verdict |
|---|---|
| "Montgomery Marriott Prattville Hotel & Conference Center at Capitol Hill, at 2500 Legends Circle, Prattville, AL 36066, phone 334-290-1235 (also 1-800-593-6429)" | CONFIRMED 48 |
| "The operator states the hotel overlooks the Senator course." | CONFIRMED 48 |
| "The hotel's own street address differs from the golf course's 2600 Constitution Avenue address" | CONFIRMED 48's explicit caution against merging the two addresses |
| "the operator's own \"Other Lodging Options\" list also names Oster Golf House as on-site lodging at Capitol Hill, alongside nearby hotels it lists individually with its own stated distances" | CONFIRMED 49, without repeating the individual mileages as this guide's own claim — they are the operator's stated distances, labelled as such by omission rather than restated as measured fact |

### FAQ

Six questions. The gate requires one matching `play|tee time|tee times|book`;
four match ("Can I play The Judge right now?", "Which course should I play
until The Judge reopens?", "How do I book a tee time at Capitol Hill?", and the
green-fee question references booking indirectly). Every answer restates a
section above.

* "Can I play The Judge right now?" — REFUTED 3's correction + the Legislator/Senator guidance.
* "When does The Judge reopen?" — REFUTED 3's correction + CONFIRMED 5's stability finding, said a second time as the brief requires.
* "Which course should I play until The Judge reopens?" — CONFIRMED 2, 8, 9, 11.
* "How do I book a tee time at Capitol Hill?" — CONFIRMED 29–34.
* "What does a round cost?" — CONFIRMED 37, 38, 39.
* "What county is Capitol Hill in?" — CONFIRMED 25–28.

---

## 3. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum: the ranked course and the one
clean fallback.

| slug | kind | rests on |
|---|---|---|
| `the-judge-capitol-hill-alabama` | `golf-course` | CONFIRMED 13, 20, 21, 22, 23, REFUTED 3-correction, REFUTED 4-correction |
| `the-legislator-capitol-hill-alabama` | `golf-course` | CONFIRMED 2, 11, 46, 47 |
| `montgomery-marriott-capitol-hill-alabama` | `hotel` | CONFIRMED 48 |
| `oster-golf-house-capitol-hill-alabama` | `bnb` | CONFIRMED 49 |

**The Senator is deliberately not a place record.** It is a golf course, and
the gate caps `golf-course` places at two; those two slots are spent on The
Judge (the ranked course) and The Legislator (the recommended fallback). The
Senator is named in prose only — in the intro, in "Playing Capitol Hill before
The Judge reopens," and in the FAQ — exactly as Oregon's `oregon.json` names
Bandon Dunes in prose without a place record for it.

`status: "closed"` on The Judge is not decoration — CONFIRMED 1 and REFUTED 3
establish it is actually closed, so the banner is an accurate claim.
`status: "open"` on the other three is the absence of a closed claim per
`Ethos.Seeds.DataGuide`'s moduledoc, not an assertion that any of them trades
at this moment; none of the summaries claims current trading beyond what the
verdicts establish.

**No `address` field on any place.** Street addresses appear only inside
`summary` prose, sourced to CONFIRMED 41 and 48, consistent with the Oregon
file's convention that `address` is reserved for a verified structured field,
which no verdict here supplies as such.

Four entries, one per place, all `place_slug` values resolving inside this
file.

---

## 4. Every omission, and why

### The four refuted claims

**O1 — "Closed for renovation from January to September 2026."** *Refuted,
verdict item 3.* Understates the shutdown by a month; the closure began 1
December 2025. Replaced by the correction, verbatim, in the intro, the Judge
section, and the FAQ.

**O2 — "A further overseeding closure on 26–27 October."** *Refuted, verdict
item 4.* The operator's own Recovery column reads "Carts rough only 7 days,"
not "Closed." Replaced by the correction, verbatim, and the closure/restriction
distinction is stated explicitly rather than left for a reader to infer from
the word choice alone.

**O3 — "No distinct non-card public rate table was found on the site."**
*Refuted, verdict item 36.* The finder guessed `/greenfees/`, `/rates/` and
`/capitolhill/rates/`, all soft-404s; the real page is `/greensfees/`. The
finder's conclusion happened to survive re-verification (there is no separate
non-card public rack rate on that page), but the guide does not repeat the
finder's method or its "no rate page exists" framing — see §0 above and the
`Green fees` section, which is built from the page the finder never found.

**O4 — "Prices from $65 plus tax."** *Refuted, verdict item 40.* Inside an
HTML comment; never rendered on the live page. Not published anywhere in this
file.

### The eight uncertain claims

**O5 — a specific reopening date for The Judge.** *Uncertain, verdict item 6.*
The operator publishes a month and a season, never a day, under an explicit
weather-dependency caveat. Published: "October 2026" and "Fall 2026,"
attributed to the operator, with "no specific reopening day has been
published" stated directly, in the intro, the Judge section, and the FAQ.

**O6 — any claim that The Senator is, or is not, open to public play during
11–13 September 2026.** *Uncertain, verdict item 10.* Neither the operator nor
the tournament site states it either way. Published: the tournament dates, and
an explicit statement that public access that week is unpublished — never an
assertion in either direction. This is the item that decided the guide's
fallback recommendation (The Legislator, not The Senator).

**O7 — confirmation from a live tee sheet.** *Uncertain, verdict item 12.* The
booking portal is auth- and reCAPTCHA-gated (`customer-cc33.clubcaddie.com`);
no inventory was observed. Nothing in this file claims to have checked live
availability; all access claims rest on the operator's published policy pages.

**O8 — "11.6 miles" and "17.1 miles" as precise road distances.** *Uncertain,
verdict items 42, 43.* Both swing by up to 1.7–1.9 miles depending on which of
three geocodes of the same address is used. Published instead: the verdict's
own suggested ranges, "about 10 miles" and "roughly 15 to 17 miles."

**O9 — "8 miles north of the state capitol" and "approximately 13 miles."**
*Uncertain, verdict item 45.* Two operator-side marketing figures, five miles
apart, neither matching the measured 9.9–11.6 mile range. Neither publishes;
the sourced OSRM approximation does.

**O10 — "Owned and operated by the Retirement Systems of Alabama."** Not
directly asserted by verdict item 45's underlying page (the finder's own
UNCERTAIN 51 in the Oregon-precedent sense — here, the Alabama verdicts file
does not carry this claim as confirmed at all; the finder's flat ownership
statement is not repeated). Omitted entirely; this guide makes no ownership
claim about the Trail.

**O11 — the operator's legacy awards.** *Confirmed as present, not confirmed
as true — verdict item 52.* Golf World "#2 public golf facility," GOLF
Magazine's "10 public courses worthy of hosting the U.S. Open," Zagat top 50,
Senator "Top 10 New Courses." All undated, all self-reported on the business's
own site. None is published.

**O12 — an opening year for The Judge or Capitol Hill.** *Uncertain, verdict
item 56.* No source fetched carries one; Golf Digest's own record has
`yearOpened: null`. Published instead: the absence, stated directly.

### The rules-driven omissions

**O13 — every trip duration.** None appears anywhere in this file. The
verdict's own OSRM/Census figures are road mileages with compass directions,
never converted to minutes or hours.

**O14 — a road name or number for the two `Getting there` legs.** No verdict
in this state defends a specific highway for the Capitol–course or
airport–course drives the way Oregon's H8 defended I-5 for two legs. Published
as bare mileage and direction only.

**O15 — every photo.** `guide.photos: []` and `photos: []` on all four places.
No photo scout has run for this state.

**O16 — a street address as a structured `address` field.** No verdict
supplies one in the structured sense the field would require; addresses appear
only inside sourced prose.

**O17 — the finder's minor discrepancies not otherwise load-bearing.** The
Senator's bunker count (operator: "more than 140"; Guardian Championship site:
"over 160") and the operator's site-wide 2021 severe-weather notice and
commented-out phone-outage banner (verdict item 40's aside) are both omitted;
neither is relevant to a visitor deciding whether or how to play.

---

## 5. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures, on the first run.** No allowlist entry was added;
`Ethos.GolfProse`'s allowlist remains `[]`.

Every candidate paragraph, FAQ answer, and place summary was run through
`Ethos.GolfProse.banned_phrases/1` directly while drafting, per the brief's
tip — via `MIX_ENV=test mix run` against two scratch scripts covering the
intro, all six section bodies, all six FAQ answers, and the county/distance
sentences. All scored `[]` on first draft; nothing needed rewriting before the
real test run.

Two shapes were deliberately avoided in drafting because they are exactly what
the twenty-eight patterns exist to catch, and are recorded here so the choice
is visible rather than accidental:

* The operator's own marketing figures ("just 8 miles north of Alabama's state
  capitol," "approximately 13 miles north") were never candidates for
  publication regardless of the gate — verdict item 45 refuses both on
  measurement grounds, not phrasing grounds — but "north of the state
  capitol" would in any case sit close to proximity pattern 5's
  named-feature exception; the guide instead uses "about 10 miles by road
  from the Alabama State Capitol," which is the form pattern 5 is written to
  allow (a direction/distance relative to a **named** feature, not a bare
  "north of the course").
* No self-dating phrase referencing this guide's own writing date was drafted.
  "That wording has held unchanged in snapshots from November 2025 through
  June 2026" replaces the tempting "unchanged for ten months," which would
  have relied on an unstated present.

---

## 6. What is absent from the whole file

* **No trip duration of any kind.**
* **No vague proximity.** Every spatial claim is a mileage with a compass
  direction, or a named-building relationship ("overlooks the Senator
  course," sourced to CONFIRMED 48).
* **No relative or self-dating language.** Every date is absolute
  ("since 1 December 2025," "11–13 September 2026," "through June 2026").
  No "currently," no "as of today," no offset from an unstated now.
* **No price without the source's own date attached** — the Fall Specials
  window and the Trail Card's stated validity both carry the source's own
  dates; Golf Digest's two undated, disagreeing price fields are named as
  disagreeing and undated, and neither publishes as a rate.
* **No claim that The Senator is open or closed to the public during the
  Guardian Championship.** The single most consequential omission in this
  file, and the reason the guide's fallback recommendation is The Legislator.
* **No ownership claim, no undated award, no opening year, no live-tee-sheet
  claim.**
