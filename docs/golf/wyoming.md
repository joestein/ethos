# Wyoming — Jackson Hole Golf & Tennis Club: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/wyoming.json`,
copying the shape of `priv/seed_data/golf/oregon.json`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/wyoming-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **14
   confirmed · 7 refuted · 2 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/wyoming-finder.md` — the
   finder. Context only. It carries the seven refuted claims, including the
   central access rule stated backwards; where the two disagree, the verdicts
   file wins.

**The governing rule:** a verdict vouches only for what its own text restates.
Where a verdict is `refuted` but supplies a correction, that correction's
substance ships and the finder's original wording does not.

**5 places, 5 entries, 1 guide, 5 sections, 6 FAQ answers, 0 photos.**

---

## 0. The correction that decided the whole file

The finder's access section (§3) had the club's central rule **backwards**: it
said non-members "may only book that one-hour window" and invented "earlier
tee times require being a member or a member's guest." Verdict **C2** proves,
from the club's own rate card and its own live booking engine, that 1pm–2pm is
the window non-members **play in**, not a window they must **call within**.
Booking is unrestricted and available online at any hour. Every sentence about
access in this file rests on C2's correction text, not the finder's.

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| course | Jackson Hole Golf & Tennis Club | C1 — confirmed, #4, labelled "Public" |
| ranking skips | Shooting Star (#1), Snake River Sporting Club (#2), 3 Creek Ranch Golf Club (#3), all "Private" | C1 — confirmed |
| city | Jackson, WY (mailing address) | C4 — confirmed |
| county | **Teton County** | C4 — confirmed, three independent sources (county's own housing page, Wikipedia's Jackson and Jackson Hole Airport pages) |
| basecamp | Jackson, WY | C10 — confirmed (Hotel Jackson, Snake River Grill) |

C4's caveat is honoured in prose: the guide writes "near Jackson, in Teton
County, on Spring Gulch Road," never "in the town of Jackson," because the
club sits north of the town limits and Teton County's own page frames Spring
Gulch Road as its own thing, not the golf course itself.

---

## 1. The guide

`slug: wyoming-golf-guide` · `destination: "Jackson, Wyoming"` ·
`state: "Wyoming"` · `county: "Teton County"` · `photos: []`

### Intro

| Published | Verdict |
|---|---|
| "lists Jackson Hole Golf & Tennis Club fourth, with the access label \"Public\"" | C1 — confirmed |
| "Shooting Star Golf Club in Teton Village, WY, and Snake River Sporting Club and 3 Creek Ranch Golf Club, both in Jackson, WY" — each "Private" | C1 — confirmed, town-by-town, exactly as the ranking table gives them |
| "near Jackson, in Teton County, on Spring Gulch Road" | C4 — confirmed, and its own phrasing rule honoured |
| the quoted sentence, "Semi-private Club with daily tee times available to non-members, 1pm-2pm daily." | C2 — confirmed verbatim from `jhgtc.com/golf`, curl-verified |
| "That span is the fixed afternoon block of tee times sold to the public, not a booking window — reservations can be made online at any hour." | C2's correction, restated | 

### Section 1 — `Getting there`

Heading is exactly `Getting there`. **No trip duration appears anywhere in
this file** — every distance below is a road mileage with a direction or a
named route.

| Published | Verdict |
|---|---|
| JAC, "a public airport located seven miles ... north of Jackson ... Teton County, Wyoming", "the only commercial airport in the United States located inside a national park" | C7 (airport sub-item) — confirmed, Wikipedia |
| 7.91 miles from downtown Jackson, turn-by-turn (N Center St, E Deloney Ave, N Cache Dr/US-189/191/26/89 for 6.8 miles, Golf Course Rd 0.5 miles, Spring Gulch Rd 0.5 miles) | C7 — confirmed, club's own raw-HTML directions page, curl-verified strings "7.91" and the turn list |
| 20.40 miles from Teton Village | C7 — confirmed, same source |
| "Idaho Falls, Idaho, lies 88 miles from Jackson via US-26" | C7 — confirmed, distance-cities.com, curl-verified |

**Durations stripped per the rule:** the directions page's own "12 minutes" and
"30 minutes" are omitted (C7 says so explicitly). **The 17.494-mile figure is
omitted entirely** — see omission O1. **No JAC-to-clubhouse total is
published** — see omission O2 (U2, uncertain).

### Section 2 — `Playing it as a day guest`

This section carries **C2's correction almost verbatim**, plus the season
(C3) and the fee correction (C6), each its own sourced sentence:

| Published | Verdict |
|---|---|
| "Semi-private Club with daily tee times available to non-members, 1pm-2pm daily." (quoted) | C2 — confirmed verbatim |
| "The 1pm-2pm span is when non-members tee off, not when they may call ... booking engine lists only tee times between 1:00pm and 1:40pm." | C2's correction — the club's booking engine offered exactly 1:00/1:10/1:20/1:40 PM, all $300, all "18 Holes with Cart" |
| "Reservations can be made online at any hour through the tee-time link at jhgtc.com, or by phone at the Pro Shop, 307.733.3111 x1." | C2's correction (booking channel) + C6's PDF text, which names the phone number and extension directly; **no vendor name (quick18/Sagacity) is published**, per C2b |
| "No lodging or resort stay is required." | C2 — confirmed |
| "Guests who do not show for a tee time, or have not cancelled at least five days in advance, are charged the full greens fee." | C2 — confirmed verbatim source: "Guests who do not show ... or have not cancelled 5 days in advance shall be subject to their greens fee charge." |
| "$195 from opening through May 22 and $300 from May 23 to close, both for the 1pm-2pm non-member block, and both including tax, cart rental and use of the practice facilities" | C6 — confirmed, the 2026 JHGTC Daily Green Fees PDF, downloaded and read verbatim |
| "Rental clubs are $95 per person per day." | C6 — confirmed, "Daily Club Rentals ... $95/person per day" |
| "The golf course opens in early May and closes in mid-October, so there is no winter golf here." | C3 — confirmed, two independent sources (jhgtc.com and gtlc.com) |

### Section 3 — `The course itself`

| Published | Verdict |
|---|---|
| "unveiled in 1965, designed by California-based architect Bob Baldock" | C9 — confirmed verbatim |
| "Two years after it opened, Laurance Rockefeller purchased the property and appointed Robert Trent Jones Jr. to redesign the layout." | C9 — confirmed **as paraphrase, not quotation**. The finder's "In 1967 ... commissioned" is refuted; the source's own words are "Only two years after opening, Laurance Rockefellar stepped in to purchase the property, appointing Robert Trent Jones Jr. to redesign the layout." No year is asserted; "1967" is never printed. |
| "Vail Resorts acquired the Grand Teton Lodge Company in 1999 and spent the best part of eight years carrying out improvements ... redesign of the 1st and 15th holes, twenty new tees ... new irrigation system" | C9 — confirmed, close paraphrase of the source's own sentence |
| "hosted the 1988 U.S. Amateur Public Links and the 1993 U.S. Women's Amateur Public Links" | C9 — confirmed, Golf Digest course page |

### Section 4 — `The weekend around the course`

| Published | Verdict |
|---|---|
| Hotel Jackson, 120 N Glenwood St, "on Jackson's Town Square," on-site FIGS and rooftop Juliette | C10 — confirmed verbatim |
| Snake River Grill, 84 E. Broadway, "modern American grill, wood-burning oven," open nightly 5pm–9pm | C10 — confirmed verbatim |
| "the North Grille serves lunch, Après Golf and dinner through the summer season, and reservations are strongly encouraged" | C8's correction — confirmed. **Neither fabricated North Grille quote is published.** See omission O3. |

### Section 5 — `Day two: Teton Reserve, in Victor, Idaho`

| Published | Verdict |
|---|---|
| "a different county in a different state, Teton County, Idaho, not Teton County, Wyoming" | C5a — confirmed, the note is explicit in the verdict |
| labelled "Public" by Golf Digest, designed by Hale Irwin | C5a — confirmed |
| "located in Victor, Idaho just 23 miles from Jackson Hole, Wyoming" (quoted) | C5a — confirmed verbatim, the operator's own booking-engine page. **This replaces both the finder's unsourced 25-mile figure and its misuse of Wyoming Highway 22's 17.494-mile route length.** See omission O1. |
| "24/7 online tee-time booking engine" | C5a — confirmed verbatim |
| $95 walking / $110 riding, main season June 1–Sept 14; $55/$70 early and late season | C5a — confirmed exact, operator's own rates page. Published as the base rate figures per C5a's wording caution: the page never uses the word "resident" against the lower figures, so this file does not either. |
| "Teton Pines Resort and Golf Club, in Wilson, Wyoming, is not an option ... 'very limited afternoon reciprocal tee times,' arranged through a home club's golf professional, reservable no more than seven days ahead, and only after 2pm" | C5b — confirmed verbatim (three separate quoted clauses from tetonpines.com/golf) and the rejection stands. **The finder's "4 miles from Jackson" and its "Jackson" location are both dropped** — Golf Digest places the club in Wilson, WY, not Jackson, and no verdict sources a mileage. See omission O4. |

### FAQ

Six questions. The gate requires one matching `play|tee time|tee times|book`;
three do (Q1, Q2 by implication of "tee time"/"book", Q6 by "book"). Answers:

* "How do I book a tee time?" — C2's correction, booking channel, no
  lodging/membership requirement.
* "Can I play in the morning?" — **exists because the finder's refuted claim
  would have answered this wrong.** States the play/booking distinction from
  C2 directly, since this is the fact a visitor most needs and most likely to
  get backwards from a search result.
* "What does a round cost?" — C6.
* "When is the course open?" — C3.
* "Where is the club, and how far is it from town?" — C4, C7.
* "Which course should I play on day two?" — C5a, C5b.

---

## 2. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum: the ranked course and the
second course, across the state line.

| slug | kind | rests on |
|---|---|---|
| `jackson-hole-golf-and-tennis-club` | `golf-course` | C1, C2, C3, C4, C6, C9 |
| `teton-reserve-golf-course-victor-id` | `golf-course` | C5a |
| `hotel-jackson-town-square-wy` | `hotel` | C10 |
| `snake-river-grill-jackson-wy` | `restaurant` | C10 |
| `north-grille-jackson-hole-golf-tennis` | `restaurant` | C8's correction |

Every place has `photos: []`, as does the guide. No photo scout has run for
this state.

**No historic-designation claim.** No verdict establishes one, and none was
invented.

**`status: "open"` on all five is not a trading claim** — see
`Ethos.Seeds.DataGuide`'s moduledoc. It renders nothing; a closed banner is the
only thing `status` asserts, and none of these places is claimed closed.

Five entries, one per place, all `place_slug` values resolving inside this
file, `kind` values drawn from `food|sight|stay` (`Ethos.Guides.Entry.kinds/0`).

---

## 3. Every omission, and why

### The seven refuted claims

**O1 — Wyoming Highway 22's "17.494 mi" as the Jackson–Victor distance, and the
finder's unsourced "25 miles."** *Refuted, C7.* 17.494 miles is the length of
the highway itself, not the distance between the two towns — a real number
measuring something else. Replaced by the operator's own "23 miles" (C5a).

**O2 — a JAC-to-clubhouse total mileage.** *Uncertain, U2.* The club's
directions page gives routes from Jackson and from Teton Village but never
from the airport; summing the airport-to-town figure (7 miles) and the
town-to-course figure (7.91 miles) would be this file's own arithmetic across
two different alignments, not a sourced distance. The two legs are published
separately and never added.

**O3 — both North Grille quotations: "open to both members and the public"
and "11am - 9pm daily."** *Refuted, C8.* Both are fabricated — the verifier
grepped the raw HTML of the cited page for every relevant string
(`'11am'`, `'9pm'`, `'public'`, `'members'`, `'Hours'`) and got zero hits on
all five. Replaced by C8's correction: what the page actually says, that the
North Grille serves lunch, Après Golf and dinner through the summer season
with reservations strongly encouraged.

**O4 — Teton Pines "4 miles from Jackson."** *Refuted (unsourced figure), and
location corrected, C5b.* No verdict sources a mileage, and Golf Digest places
the club in Wilson, WY, not Jackson. The rejection of Teton Pines as a day-two
option stands regardless — it is reciprocal/members-only, confirmed
independently by Golf Digest's own "Private" label.

**O5 — "online booking via Chronogolf/Lightspeed."** *Refuted, C2b.* The
club's own "Book Non-Member Tee Times" link resolves to a Sagacity
Golf-powered booking page, not Chronogolf. Per C2b's own instruction, this
file does **not** name that vendor either — it names the club's own site and
phone number, and nothing else.

**O6 — "no dated Jackson Hole Golf & Tennis Club green fee was found" / "the
club's own site lists no fee figures at all."** *Refuted, C6.* The club's own
Rates section links a dated 2026 PDF, downloaded and read directly:
`$195` through May 22, `$300` from May 23 to close. Both figures publish.

**O7 — the finder's framing of the 1pm–2pm window as a call/booking
restriction, and the invented clause "earlier tee times require being a
member or a member's guest."** *Refuted, C2.* This is the correction discussed
in §0 above; it governs every access sentence in the file.

### The two uncertain claims

**O8 — an opening year for Teton Reserve.** *Uncertain, U1.* The string
"2008" appears on neither `tetonreservegolf.com` nor `/rates/`, and Golf
Digest's Teton Reserve page shows no year opened. **Omitted entirely** — no
opening year is published for Teton Reserve anywhere in this file.

**O9 — a JAC-to-clubhouse mileage** — see O2 above (U2).

### The rules-driven omissions

**O10 — every drive time.** The club's own directions page prints "12
minutes" and "30 minutes" beside its mileages; both are stripped per the
no-duration rule, leaving only the mileage and the route.

**O11 — the Idaho Falls "2 hours 1 min" duration.** C7 confirms the 88-mile
figure and explicitly bars its accompanying duration from publication.

**O12 — "1967" as a sourced year, and the Rockefeller sentence inside
quotation marks.** C9 confirms the substance but not the finder's wording;
published as paraphrase with no year asserted.

**O13 — any superlative from the club's or resort's own marketing** (e.g.
self-description as "premier," "diamond in the rough"). None appears in any
verdict as a literal source string, and none is published.

**O14 — every photo.** `guide.photos: []` and `photos: []` on all five
places, matching the rest of the corpus at this stage.

**O15 — a street address for the golf courses and the North Grille.** No
verdict establishes a street address for the two courses (the club's mailing
address, 5000 N Spring Gulch Rd, is used only inside the directions
narrative, not as a place-record `address` field, to avoid overstating what
the `address` field is meant to carry versus what the prose already states)
or for the North Grille. `address` fields are populated only for Hotel
Jackson and Snake River Grill, both dead-verbatim from C10.

---

## 4. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, first run, no allowlist entry added.

No draft phrasing tripped the gate in this file. Candidates considered and
rewritten before they were ever tested against the file (informed by the
Oregon trace's own gate-hole notes):

* A first draft read "Teton Pines, also near Jackson" — not banned by any
  regex, but factually wrong (Golf Digest places it in Wilson, WY) and
  replaced before the gate ever saw it.
* Mileages are stated as "seven miles north of Jackson" and "23 miles from
  Jackson Hole" — neither trips pattern 5, which only fires on a direction
  relative to `course|clubhouse|resort|links|property|site|first tee`, not a
  town name.
* "spent the best part of eight years carrying out improvements" was checked
  against the duration patterns and correctly does not fire — it describes a
  span of work, not a journey, and none of the 22 patterns is anchored on a
  travel word without one present.

Confirmed to pass cleanly, as expected: the quoted access sentence, the
mileage-and-route sentences, "open nightly from 5pm to 9pm," and every
FAQ answer.

---

## 5. For the roster agent

Not written by this pass — `priv/seed_data/golf_courses_roster.json` is out of
scope per the dispatch. Values a roster agent would need, all traceable above:

| field | value | verdict |
|---|---|---|
| `course` | `Jackson Hole Golf & Tennis Club` | C1 — matches the seeded `golf-course` place's `name` exactly |
| `facility` | `Jackson Hole Golf & Tennis Club` (no separate resort brand) | C1, C4 |
| `city` | `Jackson` | C4 |
| `county` | `Teton County` | C4 |
| `access` | semi-private; 1pm–2pm is the non-member **play** window, booking is 24/7 online, no lodging required | C2 |
| `criterion` | `ranking` | C1 |
| `ranking_source` | `Golf Digest Best in State, Wyoming` | C1 |
| `ranking_edition` | `2025-'26` | C1 |
| `ranking_position` | `4` | C1 |
| `second_course` | `Teton Reserve` (Victor, Idaho) | C5a |
| `verified` | `true` | |

---

## 6. What is absent from the whole file

* **No trip duration of any kind.** Every distance is a road mileage, with a
  compass direction or a named highway.
* **No vague proximity.** Every spatial claim names a specific place, town or
  road ("on Spring Gulch Road," "on Jackson's Town Square," "in Wilson,
  Wyoming").
* **No price without the source's own date or season.** The green fees carry
  the PDF's own 2026 dating; Teton Reserve's fees carry the rates page's own
  season boundaries.
* **No fabricated quotation.** Both North Grille quotes the finder attributed
  are absent; what publishes instead is the page's own wording.
* **No highway-length figure used as a town-to-town distance.**
* **No booking vendor named**, per C2b.
* **No opening year for Teton Reserve**, per U1.
* **No JAC-to-clubhouse combined mileage**, per U2.
