# New Mexico — Paako Ridge Golf Club: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/new-mexico.json`,
following the register `docs/golf/oregon.md` established.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/new-mexico-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **24
   confirmed · 2 refuted · 4 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/new-mexico-finder.md` —
   the finder. Context only; carries the two refuted claims and several
   citations the verifier corrected. Where the two disagree, the verdicts file
   wins.

**4 places, 4 entries, 1 guide, 5 sections, 7 FAQ answers, 0 photos.**

---

## 0. The ranking claim — the reasoning in full

This is the item that decided how the whole file is worded, and it is also a
correction to how this programme had been checking ranking claims.

**What the operator says.** Paako Ridge's own site states Golf Digest ranks it
the #1 golf course in New Mexico.

**What the current Golf Digest list says.** The 2025-'26 Best in State New
Mexico ranking places Paako Ridge **second**, labelled "Public," behind The
Club At Las Campanas: Sunset, labelled "Private." Read alone, this makes the
operator's claim look false — and a verifier who stopped here would have
called it fabricated.

**Where a verifier would go next, and why it would still be wrong.** Golf
Digest's own course page for Paako Ridge carries a ranking-history block:
"Best in State: Ranked Top 5 in New Mexico since 2001. 2025-'26 ranking (and
previous): 2nd." That block never mentions a No. 1 finish anywhere. A verifier
who checked the course page's own ranking history — the single most obvious
place to check a ranking-history question — would have concluded the operator
invented the #1 claim outright. **That would have been the wrong answer, and
it is the corroborating evidence, not the settling evidence.** This is the
correction this file records for the rest of the programme: a course's own
ranking-history block is a summary, and a summary can omit the one fact that
answers the question. The primary record is the ranking page itself, in every
edition it can be found in — not the course page's digest of it.

**What actually settles it.** An archived capture of Golf Digest's *prior*
New Mexico Best in State list (Wayback Machine, HTTP 200, fetched raw) states
in its own body text: "Below you'll find our **2023-'24** ranking of the Best
Golf Courses in New Mexico." Its ranked entries carry titles of the form
`<rank>. (<previous rank>) <course name>`, and the Paako Ridge entry reads,
verbatim, **`2. (1) Paako Ridge Golf Club (1st/2nd)`**.

The parenthetical is the *previous* edition's rank. This is proven from inside
the same page, two independent ways, not assumed:

1. `5. (NR) Rainmakers Resort and Club` — "NR" can only mean "not previously
   ranked." No other reading of a parenthetical after a rank number is
   available once this entry exists on the page.
2. Ranks 1 and 2 are a clean swap: `1. (2) The Club At Las Campanas: Sunset`
   and `2. (1) Paako Ridge Golf Club (1st/2nd)`. The two courses exchanged
   places between editions.

So: in the edition immediately before 2023-'24, Golf Digest ranked Paako
Ridge **first** in New Mexico. It has ranked **second** in every edition
since, including the current 2025-'26 list — which the course page's "(and
previous): 2nd" line corroborates for 2023-'24, consistent with, but not
sufficient on its own to prove, the earlier #1 finish.

**The year is uncertain and is not published.** No Wayback capture of the New
Mexico list predates 2024-04, and the `best-in-state-rankings` article URL has
zero captures. "2021-'22" appears only in the finder's report, inferred from
publication cadence (Golf Digest publishes Best in State every other year),
not from an archived list. The verdicts file marks the year `uncertain` and
this guide does not name it.

**Published wording**, drawn from the verdicts file's own "strictly sourced"
text: "Golf Digest ranked Paako Ridge first in New Mexico in the edition
before its 2023-'24 list; it has ranked second in the state in every edition
since, including the current 2025-'26 ranking." This is the stale-but-true
kind of claim, never the fabricated kind, and the guide says so without
naming a year for the #1 finish.

**What is dropped entirely: Golfweek.** The operator's sentence names Golf
Digest and Golfweek together. Only the Golf Digest half is verified — WebSearch
was exhausted before any Golfweek list could be opened, and the verdicts file
marks the Golfweek attribution `uncertain`, instructing it be dropped. No
Golfweek claim appears anywhere in this file.

---

## 1. What Golf Digest actually ranks — the 1st & 2nd nines, not the facility

The finder characterised the ranked entry as "27-hole facility; no other
Paako Ridge course competes for this slot" — true but materially incomplete,
and marked `refuted` by the verifier on exactly that gap. Golf Digest's own
embedded course data for the ranked entry carries `name: "Paako Ridge (1st &
2nd 9s)"` and `completeName: "Paako Ridge Golf Club: Paako Ridge (1st & 2nd
9s)"`; `holes: "27"` describes the facility, not what is ranked. The 2023-'24
list's title made this plain — `"Paako Ridge Golf Club (1st/2nd)"` — before
the 2025-'26 display title shortened it.

Published: "What Golf Digest ranks is a specific eighteen at the facility —
its own listing names it 'Paako Ridge (1st & 2nd 9s)' — not the 27-hole
property as a whole," in the intro, the course section and a dedicated FAQ
answer. Never published: "Golf Digest ranks the 27-hole course."

---

## 2. Geography — Bernalillo County, unincorporated, and not tribal land

| Field | Value | Verdict |
|---|---|---|
| county | **Bernalillo County** | confirmed twice: address geocode and coordinate geocode both return Bernalillo County (GEOID 35001) |
| municipality | **none — unincorporated** | confirmed: the coordinates geocode returns no Incorporated Places layer at all |
| census place | Paa-Ko CDP | confirmed |
| mailing address | Sandia Park, NM 87047 | confirmed, from the operator's own address |
| tribal land | **no** | confirmed by a positive control, not by an absent layer alone |

**The tribal-land negative, proven rather than asserted.** An absent layer on
its own proves nothing unless the same query is shown to surface a positive
result when one exists. The verifier ran that control: geocoding Sandia
Resort & Casino (30 Rainbow Rd NE, Albuquerque — on Pueblo land) with the same
`layers=all` query returns `Federal American Indian Reservations -> ['Sandia
Pueblo']`. The identical query at Paako Ridge's coordinates returns none of
that layer, or the two related tribal layers, at all. The negative is real.
Published in the guide's FAQ, using Sandia Resort — one of the club's own
named lodging recommendations — as the worked contrast, so a reader sees the
method rather than a bare assertion.

**The name trap.** The *town* of Bernalillo is a separate place from
Bernalillo *County*: geocoding the town's coordinates (as a control point)
returns Incorporated Places → "Bernalillo town" and Counties → **Sandoval
County**. Paako Ridge is in Bernalillo County but has no connection to the
town of Bernalillo. Published in a dedicated FAQ answer: "This is not the
same place as the town of Bernalillo, which sits in Sandoval County — a town
and a county sharing a name in different parts of the state." No proximity
phrase is used to relate the two — the guide states the county fact and stops,
rather than reaching for an unmeasured "near" or a banned directional phrase.

Wikipedia's Sandia Park infobox was not used as a source, following the
verifier's own instruction: it is redundant given two agreeing geocoder calls
plus a working control, and a prior WebFetch summary of the operator's own
page had already produced a fabricated "County:" line the verifier discarded.

---

## 3. Access — public, no membership, the two booking tracks

All three access elements are `confirmed`, each sourced separately from the
operator, and each element ships:

* **Public, no membership required.** The reservations page publishes rates
  and an open booking path with no membership gate; Golf Digest's own course
  data records `facilityType: "Daily Fee"`, `private: false`.
* **30-day online booking window**, quoted verbatim from the club's live
  tee-sheet page: "Online Tee Time Reservations are subject to a 30-day
  advance booking window."
* **Phone/request booking beyond 30 days**, from the club's own reservations
  page and its `/reserve-later` inquiry form: staff "assist with booking your
  tee time(s) more than 30 days in advance," by phone or by an online inquiry
  form that the club's concierge team follows up on — a **request the club
  confirms**, not an instant online booking. Published exactly that way, so a
  reader does not expect the far-out booking to behave like the 30-day one.

**What is not published: the operator's driving durations as a stand-in for
access rules or as distances.** See §5.

**Rates**, dated to the operator's own 2026 season and appearing identically
on two pages: 18 holes with a cart, $225 plus tax; same-day replay, $100 plus
tax. Cashless, major cards. Published with the season attached, per the
pricing rule.

**Starting tees and the 19–27 detail.** The operator states play begins on
the 1st and 10th tees each day, with holes 19–27 open after 10:30 a.m.,
Wednesday through Sunday — operationally useful for a visitor deciding when
to book, and it corroborates that Golf Digest's ranked "1st & 2nd 9s" is a
routing distinct from the third nine. The verdicts file flags a minor,
`uncertain` variant — one operator page says play starts on "#1" alone — and
this guide uses the "#1 & #10" form the verifier used, since it agrees with
the starting-times sentence on both pages fetched.

---

## 4. Season — 29 April to 18 October 2026, closed Mondays and Tuesdays

Verbatim, on two operator pages: "For the 2026 season, Paako Ridge Golf Club
will be open April 29th – October 18th (Closed Monday's and Tuesday's)," and
separately, "closed on Mondays & Tuesdays for Golf, Pro Shop and Dining
Service."

**This is the single most useful fact in the guide for anyone planning a trip
later in the year, and it is placed accordingly**: in the intro (the first
thing a reader sees), in its own section ("The 2026 season"), and in two FAQ
answers, one of which is the play/booking FAQ the gate requires. The
instruction to make the closing date prominent, not buried, is honoured by
repetition across exactly the surfaces a reader is likely to read first.

**No other closure is published as a guarantee.** The verifier swept five
operator pages for `aerat|aerif|overseed|over-seed|punch|closed for|closure|
maintenance|frost|shut` and found zero hits — a genuine negative from the
operator's own current pages, but a negative from silence, which could still
be filled by an announcement inside the season. This guide publishes the
season dates and the weekly closure as fact, and states neither "no other
closures exist" nor anything that implies it.

**Hours**, confirmed on the same two pages: pro shop and practice, 7:30 a.m.
to 6:00 p.m., Wednesday through Sunday; dining, 7:30 a.m. to 5:00 p.m.
Wednesday, Thursday and Sunday, 7:30 a.m. to 8:00 p.m. Friday and Saturday.
The operator's own hedge — "Hours of operation are ultimately at the
discretion of management" — is carried into the published text rather than
dropped, so the guide does not overstate the operator's own certainty.

---

## 5. Getting there — distances only, no operator drive-time converted to a claim

Published, from the operator's own `/directions` page, verbatim mileages:
Albuquerque 28 miles, Santa Fe 48 miles, Taos 117 miles, Las Cruces 249 miles.

Independently, OSRM road routing from the course's geocoded coordinates:
about 31 miles to Albuquerque International Sunport (the verifier's re-run
returned 30.8 miles against the finder's 45-minute-adjacent 31.4; both round
to "about 31 miles," published as a rounded figure rather than a spurious
decimal), and 47.6 miles to Santa Fe — matching the operator's own 48-mile
figure, stated as agreement rather than as two separate claims.

**What is explicitly not published: the operator's own drive-time language.**
The operator's site states "a twenty-five minute drive from Albuquerque, a
thirty minute drive from the Albuquerque International Sunport, and an hour
drive from Santa Fe." OSRM contradicts two of the three — 45 minutes to the
Sunport, not 30; 77 minutes to Santa Fe, not 60 — and the prose rules ban
trip durations outright regardless. Every distance in this guide is a road
mileage; no duration of any kind appears in the file.

**The limousine service**, named but not priced. The operator names a
"Club Operated 9-Passenger Mercedes Sprinter Limousine," available to and
from the airport, lodging and the course, "$150 per trip leg." No date
attaches to that figure in the source, so per the pricing rule the service is
named and the figure is omitted: "priced per trip leg," no dollar amount.

---

## 6. The course itself — what ships, and what the record leaves as a gap

| Published | Verdict |
|---|---|
| Ken Dye, architect; opened 2000 | confirmed, from Golf Digest's own course data (`designer`, `yearOpened`), independent of the operator |
| 27-hole facility | confirmed |
| Golf Digest 100 Greatest Public, 56th (2025-'26) | confirmed twice — the ranking page's `coursePills` and the course page's ranking-history text |
| 6,500 feet elevation | confirmed, read directly on two operator pages |
| has hosted the U.S. Senior Challenge, no year given | confirmed the hosting happened; the source dates only the 2026 edition, held elsewhere, and leaves Paako Ridge's own hosting undated |

**Omitted: the second-nine-added-in-2005 date.** The verdicts file marks this
`uncertain` — the verifier did not re-fetch the `/membership` page that is its
only source, and declined to vouch for it. Not published.

**Omitted: 7,000 feet.** The operator states two figures on two different
pages — 6,500 feet (reservations and tee-sheet, re-fetched and confirmed) and
7,000 feet (`/membership`, not re-fetched). The guide publishes only the
figure read directly.

**Omitted: "One of America's Top 50 Public Golf Courses."** The operator's own
phrase, contradicted by Golf Digest's own confirmed 56th-place ranking, and
inconsistent even within the operator's own site (a second operator page says
"Top 100" on otherwise identical boilerplate). Not published in any form.

**Omitted: any year for the U.S. Senior Challenge hosting.** The source dates
the *2026* event at a different club and leaves Paako Ridge's own hosting
undated.

**Omitted: a second `golf-course` place.** Golf Digest's third-ranked New
Mexico entry, Black Mesa Golf Club in Espanola, is confirmed as the state's
next publicly accessible course down the same list — but the verdicts supply
only its name, rank and city. No address, no county, no season, no access
terms and no rates were verified for it. Rather than pad a second
`golf-course` place with an under-sourced record, this guide ships with one —
Paako Ridge alone — which the corrections explicitly permit ("several sibling
states ship two places total and that is correct").

---

## 7. Places, against the verdicts they rest on

| slug | kind | rests on |
|---|---|---|
| `paako-ridge-golf-club-sandia-park` | `golf-course` | ranking §0–1, geography §2, access §3, season §4, course facts §6 |
| `hotel-chaco-albuquerque-nm` | `hotel` | the operator's own "Lodging recommendations," `/directions` page |
| `sandia-resort-albuquerque-nm` | `hotel` | same page, plus the tribal-land positive control (§2) |
| `paako-ridge-clubhouse-dining-sandia-park` | `restaurant` | season/hours §4 |

Every place has `photos: []`, as does the guide — no photo scout has run for
this state.

**No `address` field on `paako-ridge-golf-club-sandia-park`.** The operator's
address (1 Club House Dr, Sandia Park, NM 87047) is the one used for both
geocoder calls, but is omitted from the place record on the same principle
Oregon's trace states: only fields the file chooses to carry need populating,
and the course's identity here rests on county/CDP/mailing-town, not a street
address claim that adds nothing to what a visitor needs. Hotel Chaco and
Sandia Resort do carry addresses, since those are exactly what the operator's
own "Lodging recommendations" list provides.

**`status: "open"` on all four is not a trading claim**, per
`Ethos.Seeds.DataGuide`'s moduledoc — it renders nothing and is the absence of
a closed claim, not an assertion that any place is trading today.

Four entries, one per place, `place_slug` values all resolving inside this
file.

---

## 8. What the gate caught, and what did not need catching

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures.** No allowlist entry was added; `Ethos.GolfProse`'s
allowlist remains `[]`.

Phrasings checked against `Ethos.GolfProse.banned_phrases/1` while drafting,
before they had a chance to fire in the corpus test:

| Candidate phrasing | Result | Shipped instead |
|---|---|---|
| "the town of Bernalillo, north of the course" | would fire proximity pattern 5 (`north of the... course`) | dropped the direction entirely — the county fact does not need a compass bearing |
| "a thirty minute drive from the Sunport" | would fire the hour/minute duration patterns | "about 31 miles to Albuquerque International Sunport" |
| "$150 per trip leg" for the limousine | not a banned phrase, but undated per source — excluded by the pricing rule, not the gate | named the service, omitted the figure |

**What this file does not lean on the gate for.** An unsourced containment or
proximity claim in ordinary prose is grammatically identical to a sourced one
and no pattern catches the difference — that is this document, not
`Ethos.GolfProse`, and every spatial claim in the JSON is a named road, a
county, or a measured mileage rather than a vague relation.

---

## 9. What is absent from the whole file

* **No trip duration of any kind.** Every distance is a road mileage; the
  operator's own drive-time language is named as excluded, never converted
  into this guide's claim.
* **No vague proximity.** Every spatial claim names a county, a road, a
  measured mileage, or is dropped rather than hedged with a directional
  phrase.
* **No relative or self-dating language.** The season's end date, 18 October
  2026, is stated as an absolute date everywhere it appears, including the
  "anyone planning a visit after 18 October 2026" sentence — never as an
  offset from the guide's writing date.
* **No price without its source's own date.** The 2026 green fees carry their
  season; the limousine's price is omitted because it carries none.
* **No Golfweek attribution**, and no year attached to the #1 Golf Digest
  finish — both `uncertain`, both left out entirely rather than guessed.
* **No second `golf-course` place** — the verdicts do not support one with
  enough sourced detail to avoid padding.
* **No membership claim, no closure guarantee beyond Mondays and Tuesdays, no
  7,000-foot elevation, no 2005 second-nine date, no dated U.S. Senior
  Challenge year, no "Top 50 Public" claim, and no tribal-land claim about
  Paako Ridge itself** — each a true-sounding sentence some source suggests
  and none fully establishes, per §§2, 4 and 6 above.
