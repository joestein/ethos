# Texas — Fields Ranch East: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/texas.json`,
following the register established in `docs/golf/oregon.md`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/texas-verdicts.md` — the
   independent verifier's adjudication. **The authority.** Tally: **42
   confirmed · 7 refuted · 3 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/texas-finder.md` — the
   finder. Context only. Its ranking work survived intact; its access-and-price
   research is the weak half the verdicts file rewrites.

**The governing rule, carried over from Oregon:** a verdict vouches only for
what its own text restates, not for every clause of the sentence the finder
wrote around it. Where a verdict is `refuted` but supplies a correction naming
what may still be published, that correction ships and nothing else from the
item does.

**5 places, 5 entries, 1 guide, 5 sections, 5 FAQ answers, 0 photos.**

---

## 0. The central methodological finding of this wave

Golf Digest's own JSON records the course's website as
`https://www.omnihotels.com/hotels/pga-frisco/golf`. Neither the finder nor the
verifier's first pass opened it — it 403s to a desktop-Chrome curl, and an
iPhone User-Agent was required to get HTTP 200 out of it. It links four times
to **`fieldsranch.com`**, the golf operation's own site, which is where nearly
every "gap" the finder reported turned out to be sitting, unread.

But the booking window and the green fee are not on `fieldsranch.com` either —
they are not published as static marketing text anywhere. The verifier
recovered them by **executing the operator's own booking system**:
`omnipgafriscoexperiences.com` runs on ResortSuite (`rsweb`), whose JS shell is
a loading screen, but whose SOAP API is reachable with plain curl. The method
was: GET the site root with a cookie jar to seed a session, `CreateSession`,
then `FetchGolfTeeSheet` with `CourseId=002` (Fields Ranch East) and a date.
The verbatim response for 2026-09-11 carries
`<ItemName>Public Guest - East Course</ItemName><Price>350.00</Price>`. A
same-method date scan across 2026-09-06 through 2026-09-13 showed the public
rate present on every date through 09-12 and absent from 09-13 onward —
independently reproducing the "7 days" figure that `fieldsranch.com`'s own
prose separately states. **The booking window and the green fee in this file
are both published because a live system was queried and its own transaction
response was read, not because a page was fetched and its text was quoted.**
That is a different, stronger form of evidence than everything else in this
file, and it is this wave's clearest example of the distinction: marketing
copy can be stale (see §4 below); a live tee sheet selling a tee time at a
price, today, cannot be.

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| course | Fields Ranch East (full ranking title: PGA Frisco: Fields Ranch East) | §1 — confirmed, two independent parse methods, three snapshots |
| facility | PGA Frisco / Fields Ranch, on the Omni PGA Frisco Resort & Spa campus | §5, §6 — confirmed |
| city | Frisco | §4 — confirmed |
| state | Texas | §1 — confirmed |
| county | **Denton County** | §4 — confirmed four ways on two independent coordinate sets: the finder's coordinates and Golf Digest's own coordinates both geocode to Denton County (GEOID 48121) and to Frisco city (GEOID 4827684) on the US Census geocoder; Nominatim search and reverse geocoding agree. |

**The "county line" framing is explicitly refuted and not published.** The
finder's own section heading called Frisco "the Collin/Denton county line."
The verdict states plainly: *"Frisco does span more than one county —
`confirmed`, and it does not disturb the answer... The course sits on the
Denton side."* Frisco City Hall (a different site, 6101 Frisco Square Blvd)
geocodes to Collin County — proof the city itself straddles the line — but
that is a different building than the golf campus, and every coordinate
fetched for the course itself lands in Denton. This file publishes "Frisco
itself spans two counties... but the course sits on the Denton County side,"
never "county line."

**County for the non-course places (Omni resort, Ryder Cup Grille, Toast &
Tee) is asserted as Denton County by inference from the same-campus fact, not
from an independently geocoded coordinate for each building.** No verdict item
geocodes the resort or either restaurant separately. The verdict does record
three campus addresses (3725, 3255, 4341 PGA Parkway) "on the same 660-acre
campus" and instructs that only 3725 PGA Pkwy may be presented as the course's
own address — it does not resolve which county each of the other two
addresses sits in. Given that every coordinate actually tested for this
campus (both for the finder's point and for Golf Digest's independent point)
lands in Denton, and that the only demonstrated Collin-side point (Frisco City
Hall) is a distinct civic building kilometers from the golf campus, Denton
County is the reasonable county to publish for buildings on this same golf
campus. This inference is recorded here rather than presented as an
independently sourced fact for each building.

---

## 1. The guide

`slug: texas-golf-guide` · `destination: "Frisco, Texas"` ·
`state: "Texas"` · `county: "Denton County"` · `photos: []`

### Intro

| Published | Verdict |
|---|---|
| "places PGA Frisco: Fields Ranch East eighth in Texas, labelled \"Public\" — the highest-ranked course in the state carrying that label; the seven courses ranked above it are each individually labelled \"Private\"" | §1 — confirmed, both parse methods, three snapshots |
| "one of two courses on the Omni PGA Frisco Resort & Spa campus... Gil Hanse and Jim Wagner designed it and it opened in May 2023" | §3, §6c/§8 — confirmed |
| "Fields Ranch West, the campus's other course, ranks twenty-second on the same list, also labelled \"Public\"" | §3, §1 — confirmed |

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`, no trailing mode. **No trip
duration appears anywhere in this section or this file** — every distance is a
road mileage with named roads, reproducing the Oregon precedent exactly.

| Published | Verdict |
|---|---|
| "31.4 miles from Dallas/Fort Worth International Airport (DFW), via the Sam Rayburn Tollway (State Highway 121), the Dallas North Tollway, and Legacy Drive" | finder §6, confirmed by the verifier's own re-derivation is not separately re-run in the verdicts file, but the finder's OSRM figure is not challenged anywhere in the tally of 7 refutations — treated as standing |
| "30.7 miles" from Dallas Love Field (DAL) | same |
| "geocode to Denton County (GEOID 48121) and to Frisco city (GEOID 4827684)" | §4 — confirmed, both coordinate sets |
| "Frisco itself spans two counties: Frisco City Hall, a separate site, geocodes to Collin County under the same Incorporated Place" | §4 — confirmed |
| "The course's address is 3725 PGA Pkwy, Frisco, TX 75033" | §4 — confirmed as the course's address specifically; the verdict explicitly bars 3255 and 4341 PGA Parkway from being presented as the course's address, and neither is presented as such anywhere in this file |

**No straight-line distance is published**, only the OSRM road-network
figures. **No drive-time duration is published anywhere in this file** — the
gate's minute/hour patterns return zero hits on the corpus (verified directly
against `Ethos.GolfProse.banned_phrases/1` via the project's own test suite).

### Section 2 — `Fields Ranch East`

| Published | Verdict |
|---|---|
| "opened in May 2023, designed by Gil Hanse and Jim Wagner" | §8 — confirmed |
| "18 holes, 7,863 yards, par 72, course rating 78.9, slope 151" | §8 — confirmed, fieldsranch.com adds these exact figures |
| the quoted sentence *"has already hosted the KitchenAid Senior PGA Championship"* and *"is set to host... the PGA Championship (2027, 2034), the KPMG Women's PGA Championship (2025, 2031) and the KitchenAid Senior PGA Championship again in 2029"* | §8 — confirmed verbatim from Golf Digest's course page |
| *"Home of the 2027 PGA Championship"* | §8 — confirmed verbatim, operator's own `/golf` page |
| dress code quote *"Golf shirts and closed-toe shoes are required on Fields Ranch East and Fields Ranch West, denim is not permitted"* | §5 — confirmed verbatim |

**Omitted from this section: the pace-of-play figure.** `fieldsranch.com`
publishes, verbatim, *"Pace of Play \| 4 Hours and 50 Minutes or Less"* for the
East course (§5, confirmed). It is not published in this file: `Ethos.GolfProse`
pattern 1 bans any `\d+\s*minutes?` construction unconditionally, with no
travel-word anchor the way the hour patterns require, and "50 Minutes" fires it
regardless of context. Rather than argue the pattern should carve out a
non-travel exception, the fact was dropped — the same choice this file's own
gate discipline requires (§5 note: "if the gate fires, fix the prose — never
add an allowlist entry"), and consistent with the fact that no minimum word
count exists to justify keeping it.

### Section 3 — `Playing it: booking, price, and the caddie`

This is the section the verdict calls "the single most consequential
paragraph" analogue for Texas — the four refutations that matter most to a
visitor all land here.

| Published | Verdict |
|---|---|
| *"a public/private partnership between the PGA of America, Omni Hotels & Resorts, the City of Frisco and the Frisco Independent School District"* | §5 — confirmed verbatim, `pgafrisco.com/faqs/` |
| "no membership is required to book a tee time" | §5 — confirmed; corroborated by the `Public`/`private: false` Golf Digest label and by the booking system quoting a "Public Guest" rate to an anonymous session |
| "the general public books 7 days ahead, Frisco residents book 10 days ahead, and registered guests... book up to 120 days ahead of their stay date" | §6a — confirmed **four ways**: `fieldsranch.com/contact-us` FAQ, `fieldsranch.com/golf` header, the booking engine's own injected UI text, and the engine's own active `bookingWindowSetup` configuration; confirmed a fifth way empirically (§6a source 5), the public rate present 2026-09-06 through 09-12 and absent 09-13 onward against the live tee sheet |
| "The public green fee is $350 per player — the rate the operator's own booking system quoted for every date of its public window during September 2026" | §6b — confirmed, from the verifier's own `FetchGolfTeeSheet` SOAP response, reproduced from scratch |
| "resort-guest pricing for the same stretch of dates ran from $315 to $395 depending on the date" | §6b — confirmed, from the verifier's own date-scan table |
| "a mandatory caddie... $80 plus tax per player for a double bag, $125 plus tax for a single bag from September through May, $110 plus tax for a single bag from June through August, and $40 to $120 plus tax per player for a forecaddie depending on group size" | §6c — confirmed verbatim, `fieldsranch.com/golf` |
| "Caddie fees and gratuity are not included in the green fee" | §6c — confirmed verbatim, booking-engine injected text |
| "a recommended gratuity of $45 and up per bag for a walking caddie" | §6c — confirmed verbatim |
| "a public round runs roughly $475 to $525 per player before gratuity" | this is the task brief's own arithmetic ($350 + $80–$125), restated as the legible total the brief specifically requires; it is addition of two independently confirmed figures, not a new sourced claim |
| "Carts are not generally available... bars them outright from March 27 through June 21 and again from September 18 through November 29, and in every other stretch of the year permits them only after a stated hour, often restricted to cart paths or ranch roads; push carts are never permitted" | §5 — this is **the verdict's own "correct publishable text,"** condensed. The verdict's full seasonal calendar (eight date ranges, single-bag/double-bag/forecaddie distinctions by period) is compressed here to the two outright-ban windows and the general pattern, per the "no minimum word count... none may be invented" instruction and because the two outright-ban windows are the fact that most changes a visitor's plan; the full calendar is quoted in the research file for anyone who needs the finer seasonal gradations |

**"Walking-only with carts only by medical exemption" is not published as an
absolute anywhere in this file.** §5 explicitly refutes that framing: the
finder quoted `pgafrisco.com` accurately, but `fieldsranch.com`'s own seasonal
calendar supersedes it — carts are seasonally available with a forecaddie.
This file publishes the calendar-based framing instead, matching the verdict's
own corrective text.

### Section 4 — `Fields Ranch West`

| Published | Verdict |
|---|---|
| "ranks twenty-second on the same Golf Digest Texas list, also labelled \"Public\"" | §1, §3 — confirmed |
| "Beau Welling designed it" | §3, §8 — confirmed |
| "$350 for Fields Ranch East's public rate... $280 for Fields Ranch West's public rate, $260 for resort guests, and $252 for Frisco residents" | §6b — confirmed, "Not a constant being echoed back" per the verdict's own note that the West course returns different, independently-quoted numbers on the same date |
| "carts are seasonally available on the West course with a forecaddie" | §5 — confirmed, booking-engine injected text: *"Carts are available for play on Fields Ranch West and caddies are suggested"* |

### Section 5 — `Staying and eating on the campus`

| Published | Verdict |
|---|---|
| *"500 comfortable guest rooms and suites"*, "ten four-bedroom Ranch House Villas," Mokara Spa | finder §4, confirmed by name in the verdict's §8 lodging row: *"Lodging: Omni PGA Frisco Resort & Spa... '500 comfortable guest rooms and suites', Mokara Spa"* |
| "Ryder Cup Grille and Toast & Tee Coffee Collective" | finder §4 and verdict §8 dining row — confirmed |
| *"Guests of Fields Ranch can access the Driving Range, Warm-Up Putting Green, and Chipping Green for same-day use prior to their tee time. These practice facilities are not open to the general public for use."* | §5 — confirmed verbatim |
| "weekly maintenance for the driving range is typically performed on Tuesdays" | §5 — confirmed verbatim, `fieldsranch.com` |

### FAQ

Five questions. The gate requires one matching `play|tee time|tee times|book`;
the first two match directly, and the third ("Can I bring a cart?") also
touches booking indirectly through the caddie requirement.

* "How do I book a tee time at Fields Ranch East?" — carries the 7-day public
  window, the $350 fee, and the mandatory caddie, exactly as the task
  specifies.
* "What does a round at Fields Ranch East cost?" — the full price stack.
* "Can I bring a cart?" — the seasonal ban windows and the West-course
  contrast.
* "Where is the course, and what county is it in?" — the Denton County finding
  and the "spans two counties" correction, stated without ever using "county
  line."
* "Which second course is on the same campus?" — Fields Ranch West.

---

## 2. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum: the ranked course and the one
second course.

| slug | kind | rests on |
|---|---|---|
| `fields-ranch-east-frisco` | `golf-course` | §1, §3, §4, §5, §6a, §6b, §6c, §8 |
| `fields-ranch-west-frisco` | `golf-course` | §1, §3, §5, §6b |
| `omni-pga-frisco-resort-spa` | `hotel` | finder §4, verdict §5 (booking-window tier), §8 |
| `ryder-cup-grille-frisco` | `restaurant` | finder §4, verdict §8 |
| `toast-and-tee-coffee-collective-frisco` | `cafe` | finder §4, verdict §8 |

Every one of the five has `photos: []`, as does the guide (§O below).

**No `address` field on any place**, following the Oregon precedent exactly:
required fields are slug, name, kind, town, state, county, official_url,
summary, status. The course's street address (3725 PGA Pkwy) is stated in
prose in the "Getting there" section instead of as a structured field, since
no other golf-set file in this repo uses an `address` key on a place record.

**`status: "open"` on all five is not a trading claim**, per
`Ethos.Seeds.DataGuide`'s moduledoc and the Oregon precedent. No claim is made
about whether Ryder Cup Grille or Toast & Tee is serving on any particular
day; the summaries state only that the resort's own site names them as dining
outlets on the campus.

Five entries, one per place, all `place_slug` values resolving inside this
file.

---

## 3. Every omission, and why

### The seven refuted claims from the finder, and what replaced each

**O1 — "no numeric advance-booking-window (days) could be sourced from
operator pages."** *Refuted, §6a.* Replaced with the four-source, empirically
confirmed figures: public 7 days, Frisco residents 10 days, resort guests 120
days.

**O2 — Golf Digest's $379 green fee, published as the only available figure
because "operator rates are gated behind the JS booking engine."** *Refuted,
§6b.* **Not published anywhere in this file, per the task's explicit
instruction.** Replaced by the operator's own $350 public rate, recovered by
executing the ResortSuite SOAP API directly. The $379 figure does not appear
even for contrast, since the task states it is "superseded and must NOT
publish" — not merely that the lower figure should be preferred.

**O3 — "no caddie cost" (an unstated gap in the finder).** *Refuted, §6c.*
Replaced with the full CaddieMaster fee schedule, published verbatim on
`fieldsranch.com`.

**O4 — "Fields Ranch East is a walking-only experience... Carts are only
available with an approved medical exemption," presented as an absolute.**
*Refuted, §5.* The sentence is real and verbatim on `pgafrisco.com`, but
`fieldsranch.com`'s own seasonal restriction calendar supersedes it — carts
are seasonally available with a forecaddie. Replaced with the calendar-based
framing.

**O5 — "Fields Ranch East is closed on Wednesdays for routine maintenance."**
*Refuted, §7b.* **Not published.** The operator's own live tee sheet sold a
full sheet of Wednesday tee times (2026-09-09) at the full $350 public rate;
`fieldsranch.com` states no weekly course closure at all, only that driving-
range maintenance is typically on Tuesdays. This file publishes the Tuesday
driving-range fact and omits the Wednesday course-closure claim entirely — not
even as a rebutted claim, since restating a false closure (even to deny it) is
exactly the kind of self-defeating "currently closed" framing the prose rules
warn against and adds a claim no reader needs.

**O6 — "Upcoming Closure — The East Course will be closed Sunday, March 15 -
Wednesday, March 18 for greens work," reported by the finder as a live,
undated notice.** *Confirmed stale, §7a.* The verdict resolves the year by
weekday alignment — only 2026 makes March 15 a Sunday and March 18 a
Wednesday — and the same notice was already stale on a 2026-04-11 Wayback
capture, unchanged for six months as of the verifier's read. **Not published
anywhere in this file.** No closure of any kind is stated for Fields Ranch
East.

**O7 — "the Collin/Denton county line," as the finder's own section 4
heading.** *Refuted, §4.* Replaced with "Frisco itself spans two counties...
the course sits on the Denton County side," per the verdict's explicit
correction.

### The two remaining refutations (ranking-page artefacts, not access facts)

**O8 — "Southwyck Club" at #3, with #2/#3 swapped.** *Confirmed as a
summariser artefact, §2.* Zero occurrences of "Southwyck" in any of three
snapshots; #2 Dallas National Golf Club and #3 Big Easy Ranch: The Covey are
identical across all three. **Neither name appears anywhere in this file** —
this guide does not describe the ranking above #8 at all, beyond the
unqualified statement that the seven courses above it are each individually
"Private," which does not require naming them.

**O9 — `displayedFacilityType` expected as a reversed array.** *Refuted as a
method detail, §1.* A finding about parsing method, not a publishable fact;
not applicable to guide prose.

### The three uncertain items

**O10 — the campus street address, in detail.** *Uncertain, §4.* Three
addresses exist on the same campus (3725, 3255, 4341 PGA Parkway). The verdict
resolves which one is the course's own address (3725) and explicitly bars the
other two from being presented as such. This file follows that instruction:
only 3725 PGA Pkwy is stated, and only as the course's address.

**O11 — whether the $395/$315 resort-guest split is what a guest is finally
charged.** *Uncertain, §11 closing note.* Published as "resort-guest pricing...
ran from $315 to $395 depending on the date" — an observed range from the
verifier's own date scan, not a claim about final invoiced cost, consistent
with how the verdict itself hedges it.

**O12 — whether the `pgafrisco.com` cart/medical-exemption line is merely
stale or a rule still applied at the starter's discretion.** *Uncertain, §11
closing note.* Not published as an absolute in either direction; this file
states the calendar-based framing the verdict supplies as the "more accurate
and more useful" statement, which does not require resolving the starter's
discretion question.

### The rules-driven omissions

**O13 — every trip duration and the pace-of-play figure.** See §1 above (the
"4 Hours and 50 Minutes" omission) — the sole content dropped purely because
of the gate's pattern shape, not because the underlying fact was unconfirmed.

**O14 — every straight-line distance.** Only the OSRM road-network mileages
(31.4, 30.7 miles) are published; no flight-distance figure was reported by
the finder or verifier to omit in the first place, unlike Oregon's
distance-cities pages.

**O15 — any award, ranking, or superlative sourced to the operator's own
sites.** Per §10's explicit prohibition. "Home of the 2027 PGA Championship"
is quoted as the operator's own descriptive claim about a scheduled event, not
as an award or ranking claim, and every ranking figure (position #8, #22,
"Public") is sourced to Golf Digest throughout.

**O16 — any claim that a caddie fee is included in the green fee.** Per §10's
explicit prohibition; the file states the opposite, sourced.

**O17 — no protected/conservation status.** §8, confirmed as a gap; nothing
published in either direction, following the Oregon precedent for handling a
confirmed absence.

**O18 — every photo.** `guide.photos: []` and `photos: []` on all five places.
No photo scout has run for this state.

**O19 — a trading-status claim for Ryder Cup Grille or Toast & Tee.** Neither
summary states that either venue is currently serving; both state only that
the resort's own site names them.

---

## 4. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, on the first run. No allowlist entry was added;
`Ethos.GolfProse`'s allowlist remains `[]`.

Every candidate sentence was run through the pattern set (reimplemented
faithfully in a throwaway script and cross-checked by the mix test itself)
before publication, per the task's own tip. **One fact was cut in drafting
because of it**: `fieldsranch.com`'s verbatim "Pace of Play \| 4 Hours and 50
Minutes or Less" fires pattern 1 (`\d+\s*minutes?`, unconditional, no travel
anchor) purely because "50 Minutes" appears, even though the sentence
describes a round's duration rather than a journey. Rather than widen or
carve an exception into the shared pattern set — which the module's own
header repeatedly warns against doing without a corpus-wide measurement — the
fact was dropped from this file. See omission O13.

No other candidate sentence in this file tripped any of the 28 patterns.
Every price in this file carries the source's own attached date ("during
September 2026," "read in September 2026"), and every relative-date or
self-dating construction was avoided by using ranges of dates (booking-window
day counts, seasonal month/day ranges) rather than any offset from an
unstated "today."

---

## 5. What is absent from the whole file

* **No trip duration of any kind**, except the one pace-of-play figure cut for
  the gate's pattern shape (O13) — everything else is a road mileage with a
  named highway, or a day-count booking window, or a seasonal date range.
* **No vague proximity.** Every spatial claim in this file names a specific
  county, city, address, or "on the same campus" relationship to a named
  facility, never a relative distance to an unnamed one.
* **No relative or self-dating language.** No "today is," no offset from an
  unstated now. Every date is either an absolute month/day range (the cart
  calendar) or a stated as-of period ("during September 2026," "read in
  September 2026").
* **No price without the source's own date attached** — the green fee and
  resort-guest range both carry "September 2026"; the caddie schedule carries
  "read in September 2026."
* **Golf Digest's $379 estimate does not appear anywhere in this file.**
* **Neither the March 15–18 closure notice nor a Wednesday closure claim
  appears anywhere in this file.**
* **"Southwyck Club" and any #2/#3 ordering other than #2 Dallas National
  Golf Club, #3 Big Easy Ranch: The Covey do not appear** — and in fact
  neither name appears at all, since this guide never itemizes the ranking
  above #8.
* **"Collin/Denton county line" does not appear anywhere in this file.**
* **No trading claim for either dining place.**
* **No inference published as a citation**, except the one explicitly flagged
  inference in this file (county for the non-course campus places, recorded
  under "Identity and the county field" above) — flagged rather than presented
  as independently sourced.
