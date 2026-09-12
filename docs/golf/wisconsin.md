# Wisconsin — Whistling Straits: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/wisconsin.json`,
following the register `docs/golf/oregon.md` established.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/wisconsin-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **37
   confirmed · 4 refuted · 2 uncertain (43 claims adjudicated).**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/wisconsin-finder.md` —
   the finder. Context only. It carries the four refuted claims and one false
   gap; where the two disagree, the verdicts file wins.

**The governing rule, carried over from Oregon:** a verdict vouches only for
what its own text restates, not for every clause of the sentence the finder
wrote around it.

**5 places, 5 entries, 1 guide, 6 sections, 7 FAQ answers, 0 photos.**

---

## 0. The selection — no resort trap here

Unlike Oregon (Pacific Dunes vs. Bandon Dunes) and other states in this set,
Wisconsin's selection required no substitution against fame:

| | Verdict |
|---|---|
| **Whistling Straits: Straits Course holds #1**, literal label `Public` | C1, C2 — confirmed, two independent methods, three page-instances |
| Zero positions skipped to reach it | C3 — confirmed |
| Nothing sits above it in either snapshot | C4 — confirmed |
| Kohler's other three ranked courses — Blackwolf Run: River (#5), Whistling Straits: Irish Course (#11), Blackwolf Run: Meadow Valleys (#14) — all sit below | C6 — confirmed |
| Golf Digest's own course-profile page corroborates independently: *"Best in State: Ranked first since 2011. 2025-'26 ranking: 1st."* | C7 — confirmed, with an omission corrected (see below) |

**Corrected omission:** the finder truncated the ranking-history quote at
*"Ranked first since 2011."* The verdict's C7 supplies the next sentence,
*"2025-'26 ranking: 1st,"* and the fuller line is what publishes, in the
"The Straits Course" section and again in the intro.

The guide is about the Straits Course specifically. Blackwolf Run appears as
the named day-two course; the Irish Course and Meadow Valleys are named only
in the intro, to show the resort trap does not apply, and are not place
records.

---

## 1. The jurisdiction — the county field

| Field | Value | Verdict |
|---|---|---|
| course | Whistling Straits: Straits Course | C1 |
| mailing address | N8501 Lakeshore Road, Sheboygan, Wisconsin 53083 | C9 — confirmed |
| county (Census, coordinate lookup) | Sheboygan County | C11 — confirmed |
| county subdivision (Census) | "Mosel town" | C11 — confirmed, but this is the Census `NAME` field, not the jurisdiction's own name |
| **published jurisdiction** | **Town of Mosel** | C12 — confirmed with a correction to form |

The finder wrote "Mosel town." The verifier fetched the town's own site,
`townofmosel.com`, whose `<title>` reads "Town of Mosel – Wisconsin" and whose
own pages head themselves "Town of Mosel." Under the same rule that gave this
corpus "Municipality of Anchorage" (`priv/seed_data/golf/alaska.json`), **the
field takes the name the jurisdiction uses for itself**, not the Census's
rendering of it. `guide.county` is therefore `"Town of Mosel"`, and the
Whistling Straits place record's own `county` field matches it.

**The control that proves this is a real finding, not a geocoder gap:** the
same query run against Blackwolf Run's address, ten road miles away, returns
**Kohler village** as an Incorporated Place cleanly (C11). Whistling Straits'
own coordinates return no Incorporated Place at all — twice, by two
independent query methods (coordinate lookup and street-address lookup). The
absence is the finding.

**Two different jurisdictions inside one guide.** Blackwolf Run, The American
Club, Inn on Woodlake, and The Immigrant Restaurant all sit in Kohler village,
Sheboygan County — an ordinary, correctly-returned incorporated place — so
their `county` field is the plain `"Sheboygan County"`. Only the Straits
Course's own place record carries the self-named override. `guide.destination`
is `"Kohler, Wisconsin"` — the basecamp, where a visitor sleeps (C29, C30) —
which is deliberately not the same municipality as `guide.county`.

**Published text, guide FAQ "Where is Whistling Straits?" and intro:**
> Whistling Straits posts a Sheboygan mailing address — N8501 Lakeshore Road,
> Sheboygan, Wisconsin 53083 — but the course itself does not sit inside the
> City of Sheboygan. On the operator's own coordinates, the U.S. Census Bureau
> places it in the Town of Mosel, an unincorporated township in Sheboygan
> County, within no incorporated place.

This closes "WHAT MUST NOT BE PUBLISHED" item 2 in the verdicts file:
"Sheboygan" is never presented as the course's municipality, and "Mosel town"
never appears verbatim anywhere in the guide.

---

## 2. Access — the finder's central gap was FALSE, and the honest residue that survives it

This is the most consequential pairing in the file, and the two facts must
not be confused with each other:

**Fact A — the booking mechanic IS published, on a page the finder never
fetched.** C14, `REFUTED`. The finder reported no advance-booking-window
mechanic existed anywhere on the operator's site. The verifier found it at
`https://www.kohlerwisconsin.com/reservations`, by two independent methods
(raw-HTML extraction and WebFetch, which agreed exactly):

> "For tee times within 30 days." → BOOK ONLINE
> "For tee times beyond 30 days and all golf packages." → CALL 855-444-2838 OR
> SUBMIT AN ONLINE INQUIRY

Corroborated by C15 on the rates page: "Military rates can be booked via
telephone only, not available online, and can only be booked 30 days in
advance" — the same 30-day figure recurring on a second, independent page.

**Fact B — the Straits-specific non-resort restriction is NOT published,
anywhere.** C16, `uncertain`. Kohler's FAQ (C13, confirmed verbatim) states:

> "Can I play golf at Whistling Straits or Blackwolf Run without staying at
> the resort? Yes. All Kohler golf courses are open to the public. The
> Straits Course may have booking restrictions for non-resort guests."

The verifier checked every page reached — the FAQ, the course pages, the
rates and policy page, the golf-inquiry page, both package pages, and the
booking engine itself (whose golf date limit is held server-side behind an
authenticated session and could not be read without booking) — and none
states what the restriction is, or whether it differs at all from the 30-day
window in Fact A.

**These are not the same fact, and the guide does not let the reader conflate
them.** The 30-day/phone split is a real, sourced, general booking mechanic.
The non-resort restriction is a separate, acknowledged-but-unspecified
caveat that attaches to this course specifically. Publishing Fact A alone
would silently imply Fact B is covered by it — the exact failure the brief
warned against. Every place the access facts appear (the "Booking the Straits
Course" section, and both the "How do I book a tee time..." and "Where is
Whistling Straits?" FAQ answers) states both, side by side, with the
uncertainty stated as uncertainty rather than resolved one way or the other.

**Published text (condensed from the verdict's own "Publishable access
text"):**
> ...The Straits Course may have booking restrictions for non-resort
> guests" — without saying anywhere on the resort's site what those
> restrictions are. What the resort does publish is timing... Because the
> resort reserves an unspecified restriction on the Straits Course for guests
> not staying with it, a non-resort visitor should call ahead rather than
> assume the online window will hold a date.

This closes "WHAT MUST NOT BE PUBLISHED" items 3 and 4: the guide never says
Kohler publishes no booking window (it does — 30 days), and it never says
what the Straits' non-resort restriction is, never softens it to "none," and
never equates it with the 30-day window.

**Junior and military rates** are stated as telephone-only, per C15, and the
military rate's own 30-day cap is stated as belonging to that rate, not
generalized to all non-resort guests.

---

## 3. Price

**C20 — `REFUTED`. The figure is $695, not $495.** Two independent
methods — Wayback raw HTML of the finder's own cited snapshot, and a live
WebFetch — both return $695 on the same page the finder read as $495. The
correction's wording ships: Golf Digest's own caveat ("covers all ranges of
greens fees," "check with the course on specific timing and pricing")
publishes alongside the figure, and the figure is attributed to Golf Digest,
not to Kohler. The date attached is the source's own — "Golf Digest's course
profile, dated to its 2025-'26 ranking edition" — satisfying the rule that a
price publishes only with the source's own date attached.

**C22, C24 — confirmed, with a framing correction.** The finder reported "no
dated dollar figure" on the operator's site; the verdict narrows this to "no
green fee specifically." The operator does publish several 2026-dated
figures: caddie fee $90/person on the Straits (gratuity $70/bag suggested),
forecaddie $60, club rental $100/person/round, and discount tiers off an
unstated rack rate (twilight 30% off from four and a half hours before
sunset, super-twilight 45% off from two and a half hours before, replay 45%
off, junior 45% off). All of these are governed by the page's own line,
quoted verbatim: "Rates and policies listed apply for the 2026 golf season
and do not include Wisconsin sales tax or gratuity." **No base green fee from
the operator itself is published, because none exists on any page reached**
(C23, confirmed) — not even the linked scorecard PDF, which was downloaded
and its text extracted (C24).

---

## 4. Season and closures — two dated findings the finder missed, and one true absence

**C25 — `REFUTED`.** The finder called the Kohler Tournament Series page a
"client-rendered shell with no visible tournament-calendar content." The
verifier fetched it with curl and got 3,176 characters of dated body text,
including the Fall Challenge announcement.

**C26(a) — the Fall Challenge is a dated EVENT, not a closure.** Confirmed,
on the event's own detail page: "October 31 – November 1... RATES $540 per
player... Golf nonrefundable after Wednesday, October 28," pinned to 2026 by
the page's own promo code FALLCHALL26. **The operator does not say the course
closes to other play during it**, and the guide does not say so either — the
"Season and the Fall Challenge" section and its FAQ entry both state
explicitly that it is a tournament field, not a closure. This closes "WHAT
MUST NOT BE PUBLISHED" item 6.

**C26(b) — the shuttle's seasonal window, published in "Getting there" per
the brief.** Verbatim: "For transportation to Whistling Straits May 1 through
October 15, we offer shuttle service which departs from the Village of Kohler
at the top of the hour from 6am–10pm... (10 miles)." The minutes figure
("travel time is around 20-25 minutes one-way") is **not published** — see
omission O1 below — only the mileage and the operating window. Fifteen
October is 40 days from the verification date; nothing published falls
within the next three weeks, matching the verdict's own statement.

**C27 — `uncertain`, and left uncertain.** No 2026 opening or closing date is
published anywhere reached. What ships: the season "opens in spring," sourced
to the resort's own "the final two weeks of April" language (from
`golf/bucket-list-golf`, describing the *type* of event, not a 2026 date), and
that play runs at least through November 1, 2026, per the Fall Challenge. The
2018 and 2019 press-release opening dates (April 25, April 26) are **not
published as 2026 dates** — see "WHAT MUST NOT BE PUBLISHED" item 5 — because
they are three and four years stale relative to this guide.

---

## 5. Basecamp and day two

**C29, C30, C31 — confirmed verbatim**, including the additional sourced
facts the finder missed: The American Club opened in 1918 for immigrant
workers and reopened as a public resort in 1981; its address is 419 Highland
Drive, Kohler, Wisconsin 53044, **not** the 444 Highland Drive address in the
site's footer, which the verdict identifies as Kohler Co.'s corporate address
(WHAT MUST NOT BE PUBLISHED item 8). The Immigrant Restaurant's hours
(Tuesday–Saturday, 5:30–10pm, closed Sunday/Monday) and dress code are
published; per the Oregon precedent (F2's caveat), the guide states plainly
that existing-and-described is not the same as currently-trading, and makes
no claim either way.

**C32 — confirmed as link/nav existence only.** Inn on Woodlake, the Carriage
House, and six named dining rooms are published **by name only**, with no
characterization — this closes "WHAT MUST NOT BE PUBLISHED" item 10. Inn on
Woodlake is the one of these promoted to a place record (it needed
`official_url` and a locatable address-equivalent to seed cleanly); the
Carriage House and the six restaurants are named in The American Club's
section prose but are not place records, matching how Oregon named
unfetched venues in prose without minting places for all of them.

**C33–C36 — confirmed, with a correction.** Blackwolf Run: River is #5,
`Public` (C33); address 1111 W. Riverside Drive, Kohler, Wisconsin 53044,
independently geocoded to Kohler village (C34); the same FAQ answer names
both properties (C35); and the architect credit for The Baths is corrected
from the finder's "Chris Lutzke alone" to **"Herb Kohler and Pete Dye
protégé, Chris Lutzke"** (C36) — both names ship. The 1998 and 2012 U.S.
Women's Opens (Se Ri Pak, Na Yeon Choi) are additional sourced facts the
finder missed, published in the "Day two" section and the place summary.

---

## 6. Getting there

**C37 — confirmed as the operator's own figures**, stated in miles against
named airports, not minutes: 72 miles MKE, 142 miles ORD, 58 miles GRB. The
independent OSRM road-distance corroboration in the verdict (68.7 / 146.1 /
59.8 miles) is **not published** — including it would require either
duplicating a second, different mileage for the same route (confusing) or
publishing OSRM's paired duration figures, which are journey durations and
banned outright. The operator's own figures, cited as the operator's own, are
what ships.

**C38 — confirmed verbatim, but NOT attributed to the course.** "Kohler is
located one hour north of Milwaukee (60 miles), one hour south of Green Bay
(60 miles) and two hours north of Chicago (140 miles)" describes the
**Village of Kohler**, ten road miles inland from the course itself. This
closes "WHAT MUST NOT BE PUBLISHED" item 7: the 60/60/140 figures never
appear as distances to Whistling Straits anywhere in the guide; only the
course's own 72/142/58 do. Both the mileage figures published (60, 60, 140,
72, 142, 58) are miles, never the hour figures the same sentences carry.

**C39 — confirmed verbatim.** The I-43 exit-126 directions to the Village of
Kohler, and the additional sourced fact that Sheboygan County Memorial
Airport sits about 5 miles away and is "accessible to private air
transportation."

---

## 7. The course itself

**C40, C41 — confirmed**, two methods each: Pete Dye, opened 1998, 7,790
yards, slope 152, 18 holes. The scorecard PDF independently corroborates the
Black-tee rating (77.2/152).

**C42 — confirmed verbatim, fuller than the finder quoted.** The finder
stopped at "Ranked first since 2011." The full line — including the "100
Greatest" (26th) and "100 Greatest Public" (4th) rankings the finder
omitted — is published in "The Straits Course" section, because the fuller
quote is the stronger, and more honest, corroboration: it shows this course's
overall-rankings position honestly (26th nationally) alongside its
state-specific #1, rather than cherry-picking only the flattering figure.

**C19, C28 — confirmed verbatim.** The walking-only quote, and the
championship history: "three PGA Championships, the 2007 U.S. Senior Open and
the 2021 Ryder Cup," corroborated independently by Kohler's own itemization
(2004 Singh, 2007 Bryant, 2010 Kaymer, 2015 Day, the 43rd Ryder Cup) — but
**no ranking or award claim is sourced to kohlerwisconsin.com** anywhere in
the guide (WHAT MUST NOT BE PUBLISHED item 9); every superlative traces to
Golf Digest.

**C43 — uncertain, and omitted rather than resolved.** No protected/landmark
status was found on any page reached, and WebSearch was exhausted before a
broader search could run. The guide publishes nothing about protected status
in either direction — not "the course is unprotected," which no source
states, and not a claim of protection, which no source supports either.

---

## 8. Every omission, and why

**O1 — the shuttle's minutes figure.** "Travel time is around 20-25 minutes
one-way" is a trip duration, banned outright regardless of sourcing. Only the
mileage (10 miles) and the seasonal window (May 1–October 15) and the hourly
departure schedule (6am–10pm, on the hour — a schedule, not a journey
duration) are published.

**O2 — the OSRM road-distance corroboration table.** See §6. Would either
duplicate the operator's own mileage confusingly or require publishing a
journey duration; left out.

**O3 — "$495."** Refuted (C20). See §3.

**O4 — "Mosel town" as the published jurisdiction name.** Refuted to a
correction (C12). See §1.

**O5 — "no advance-booking-window mechanic is published."** Refuted (C14).
See §2, Fact A.

**O6 — any statement of what the Straits' non-resort restriction actually
is, or that it equals the 30-day window, or that it doesn't exist.**
Uncertain (C16), stated as uncertain. See §2, Fact B. This is the omission
the brief most insists on getting right, and it is why the guide states Facts
A and B side by side in three separate places (one section, two FAQ answers)
rather than once.

**O7 — "the Kohler Tournament Series page has no visible calendar
content."** Refuted (C25). See §4.

**O8 — "no season or closure dates exist."** Refuted (C26). See §4.

**O9 — the Fall Challenge characterized as a closure.** The operator never
says the course closes; the guide follows suit. See §4 and "WHAT MUST NOT BE
PUBLISHED" item 6.

**O10 — April 25/26 as 2026 opening dates.** These are 2018 and 2019
press-release dates (C27). Not published as 2026 facts.

**O11 — 60/60/140-mile Milwaukee/Green Bay/Chicago figures attributed to the
course.** They describe the Village of Kohler, not Whistling Straits (C38).
See §6.

**O12 — 444 Highland Drive as The American Club's address.** That is Kohler
Co.'s corporate footer address (C30). The hotel is at 419 Highland Drive.

**O13 — "Chris Lutzke alone" as The Baths' architect.** Corrected to "Herb
Kohler and Pete Dye protégé, Chris Lutzke" (C36).

**O14 — any ranking, award, or superlative sourced to kohlerwisconsin.com.**
All such claims trace to Golf Digest only, per C28's explicit note and "WHAT
MUST NOT BE PUBLISHED" item 9.

**O15 — any characterization of the Carriage House, Inn on Woodlake beyond
its name, or the six named-only restaurants.** C32 establishes existence and
name only. Published as names, nothing more. "WHAT MUST NOT BE PUBLISHED"
item 10.

**O16 — any trading claim for The American Club or The Immigrant
Restaurant.** Per the `DataGuide` moduledoc's rule (`status: "open"` is not a
trading claim) and the Oregon precedent (F2's caveat), the guide states
plainly that the sources establish existence and offering, not current
trading.

**O17 — protected/landmark status, in either direction.** Not found (C43),
and WebSearch was exhausted before a fuller search could run. Reported as
"not found," not asserted as absent. Nothing published.

**O18 — every photo.** `guide.photos: []` and `photos: []` on all five
places. No photo scout has run for this state.

**O19 — a street address for Inn on Woodlake.** Not established by any
verdict; the place record carries only its `official_url` and town/county,
matching the "no invented `address` field" rule from Oregon §2.

---

## 9. Places, against the verdicts they rest on

Two `golf-course` places — the gate's maximum — the ranked course and one
second course:

| slug | kind | county field | rests on |
|---|---|---|---|
| `whistling-straits-straits-course` | `golf-course` | `Town of Mosel` | C1, C2, C7, C9–C12, C13, C14, C16, C17, C19, C28, C40–C42 |
| `blackwolf-run-river-course` | `golf-course` | `Sheboygan County` | C33–C36 |
| `the-american-club-kohler` | `hotel` | `Sheboygan County` | C29, C30 |
| `inn-on-woodlake-kohler` | `hotel` | `Sheboygan County` | C32 |
| `the-immigrant-restaurant-kohler` | `restaurant` | `Sheboygan County` | C31 |

Every place has `photos: []`. Every entry's `place_slug` resolves inside this
file (five places, five entries, one-to-one).

**No `address` field on any place**, matching Oregon's rule: a place record's
`address` is a postal street address, and none is invented for a place whose
verdict does not establish one as a discrete field (the street addresses that
exist are stated in prose instead, quoted from the sources that carry them).

---

## 10. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, first run, no allowlist entry added.
`Ethos.GolfProse`'s allowlist remains `[]`.

No phrasing needed to be rewritten to pass. The drafting process deliberately
avoided the two failure classes this file is most exposed to:

- **Trip durations.** The operator's own shuttle copy states a minutes figure
  ("20-25 minutes one-way") right next to the mileage this guide does
  publish (10 miles). The minutes figure was never drafted into the guide in
  the first place — dropped at the note-taking stage, per O1 — rather than
  written and then caught. Distances that publish (72, 142, 58, 60, 60, 140,
  5, 10, and the road-mile figures in "Getting there") are every one paired
  with a named airport, highway, or town, never with a duration.
- **Vague proximity.** "The Village is conveniently situated two-thirds mile
  west of Interstate 43" ships verbatim (a road-named, checkable relation);
  no "next door," "steps from," or unnamed "north of the course" construction
  was drafted anywhere. Kohler village's distance from the course is stated
  as "about ten road miles inland," never as a vague relative direction.

Spot-checked against `Ethos.GolfProse.banned_phrases/1` directly rather than
trusting a clean gate run alone, per the Oregon report's own caution that a
rule avoided without testing is a rule not proven avoided:

| Phrase considered | Gate result | Shipped instead |
|---|---|---|
| `about 20-25 minutes one-way` | **fires** — pattern 2 (`\d+ min... south/north/.../away`) | Dropped; only `(10 miles)` and the May 1–October 15 window publish |
| `four and a half hours before official sunset` | `[]` — no travel-word anchor follows `hours` | Published as-is; matches the corpus's own `"at least 48 hours in advance"` precedent |
| `two-thirds of a mile west of Interstate 43` | `[]` — matches the approved Oregon precedent `"about one-half mile west on US-101"` exactly in form | Published verbatim from the source |

**The gate hole this file does not test, recorded per the moduledoc's own
warning:** an unsourced *containment* claim reads identically to a sourced
one, and no pattern distinguishes them. The defence for Wisconsin is this
trace: every county, town, and municipality claim in the guide is checked
against §1 and §9 above, sentence by sentence, rather than left to the gate.

---

## 11. What is absent from the whole file

* **No trip duration of any kind**, including the operator's own shuttle
  minutes figure, which was dropped rather than published.
* **No vague proximity.** Every spatial claim names a road, a highway exit, a
  village, or a named airport.
* **No price without the source's own date attached** — Golf Digest's $695
  carries its own 2025-'26 edition date; every Kohler dollar figure carries
  the page's own "2026 golf season" line; the Fall Challenge's $540 carries
  the page's own FALLCHALL26 promo code as its 2026 anchor.
* **No trading claim for The American Club, Inn on Woodlake, or The
  Immigrant Restaurant**, stated in the prose rather than left to be
  inferred from `status: "open"`.
* **No conflation of the two access facts.** The 30-day booking window and
  the unstated non-resort restriction are never merged into one claim, and
  the uncertainty is stated as uncertainty in every place it appears.
* **No 2026 season boundary dates** — the finder's gap on this point was
  never closed by the verifier either (C27, uncertain), and the guide does
  not manufacture one from the 2018/2019 press-release dates.
* **No ranking, award, or superlative sourced to kohlerwisconsin.com.**
* **No protected-status claim in either direction.**
