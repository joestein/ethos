# Nebraska — Landmand: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/nebraska.json`,
following the format `docs/golf/oregon.md` established as the register for
this corpus.

**This file is committed on purpose.** The research artifacts live under
`.superpowers/`, which `.gitignore` excludes. A year from now this file is the
only thing that can answer "where did that sentence come from".

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/nebraska-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **49
   confirmed · 5 refuted · 4 uncertain**, of 58 items adjudicated.
2. `.superpowers/sdd/2026-09-05-golf-courses/research/nebraska-finder.md` —
   the finder. Context only.

**The governing rule:** a verdict vouches only for what its own text
restates, not for every clause of the sentence the finder wrote around it.

**The refuted-with-correction rule:** where a verdict is `refuted` but
supplies a correction naming what may still be published, that correction's
text ships **verbatim** and nothing else from the item does.

**4 places, 4 entries, 1 guide, 4 sections, 5 FAQ answers, 0 photos.**

---

## 1. The ranking and the selection

| | Verdict |
|---|---|
| Landmand is **#3** on Golf Digest's 2025-'26 Nebraska Best in State list, labelled `Public` | C5 — confirmed, raw HTML block quoted verbatim |
| #1 Sand Hills Golf Club (Mullen) — `Private` | C3 — confirmed individually, two Wayback records plus WebFetch |
| #2 CapRock Ranch (Valentine) — `Private` | C4 — confirmed individually |
| Therefore Landmand is the **highest-ranked `Public`-labelled entry** on the list | C6 — confirmed, no entry above #3 carries "Public" |
| The full fifteen-course countdown, no truncation | C2, C7 — confirmed |

No panelist rating count is published for Landmand — unlike Oregon's Pacific
Dunes (4.9 from 66 panelists), no verdict here carries a number for this
course, so none is invented. Only the rank and the label ship.

**R1 (refuted)** — "the two methods agreed exactly" is not reproducible;
WebFetch dropped the badge for #15 and #14 only, outside the selection-critical
range (#13 through #1). Does not affect anything published here, since this
guide only discusses #1, #2 and #3.

---

## 2. Jurisdiction — the corrected field

| Field | Value | Verdict |
|---|---|---|
| Street address | `2073 S. Bluff Rd., Homer, NE 68030` | C9 — confirmed, printed in the club's own site footer, periods included |
| County | **Dakota County** | C10, C11 — confirmed twice, address-based and coordinate-based Census geocoder calls |
| County subdivision | Dakota precinct | C13 — confirmed, extended beyond the finder |
| Incorporated place | **none** | C12 — confirmed, and proved as a negative, not assumed |
| CSA | Sioux City-Le Mars, IA-NE-SD CSA | C15 — confirmed |

**C12 is the load-bearing verdict for this whole section, and it is why the
guide never calls Homer the jurisdiction.** At the course's coordinates, the
Census geocoder's response carries no `Incorporated Places` key at all — the
layer is simply absent from the returned list (`States, Combined Statistical
Areas, County Subdivisions, Counties, State Legislative Districts, Census
Blocks, Census Tracts, Congressional Districts`). That alone would be
ambiguous: does the layer not apply here, or does the API just not return it
for this kind of query? The verifier ran a **positive control** — a second
geocoder call against a point *inside* Homer village (42.3200, -96.4894) —
and that response *does* carry `Incorporated Places → ["Homer village"]`. The
layer appears when it applies and is absent when it does not. That is what
turns "no incorporated place returned" from a possible artifact of the query
into a fact about this address: the course is genuinely outside Homer's
incorporated limits.

Published jurisdiction line, from the verdict's own "Publishable jurisdiction
line": the course "lies in Dakota precinct, outside the incorporated limits
of Homer village, and takes a Homer, NE 68030 mailing address." The guide's
`county` field is `Dakota County`. Every place record's `town` field is
`Homer` (for the course, cabins and Farmer's Table) — this is the mailing
town printed on the club's own address, matching Golf Digest's own listing
("Landmand Homer, NE"), and it is not a jurisdiction claim; the guide prose
states outright, three times (intro, "Landmand" section, and the "Where is
Landmand?" FAQ), that the course sits outside Homer's incorporated limits and
that Dakota County is the county. Nowhere does the file or the guide prose
call Homer the administering municipality.

---

## 3. Access and booking

| Published | Verdict |
|---|---|
| "We do not currently offer memberships." | C16 — confirmed, verbatim, character for character |
| ForeUp for the 2026 season | C17 — confirmed, platform and club account confirmed; live tee-sheet inventory not checked (login-gated) |
| Whoosh for the 2027 season | C18 — confirmed |
| Waitlist posted on the club's site | C19 — confirmed |
| $25 nonrefundable deposit per golfer; full refund minus that $25 outside a week; no refund inside a week | C20 — confirmed verbatim, **and the qualifier preserved**: the refund outside a week is "minus the $25/golfer," never unqualified |
| Two-cart cap per group; no fivesomes; no additional walkers added to a foursome | C21 — confirmed verbatim |
| Resale/brokering prohibited, on pain of losing the reservation | C25 — confirmed verbatim, the finder missed this one |
| Wet-weather policy: push carts free or a full refund, decided the morning of play | C26 — confirmed verbatim, the finder missed this one |
| $160/golfer, cart included; walk 18 and the club buys the first beer; no replay rate | C27 — confirmed verbatim |
| The green fee is published under the FAQ's 2026 season heading, not as an independently dated rate card | C29 — confirmed; the source's own date context is what allows the price to publish at all |

**Omitted: cabin cancellation ladder detail beyond what's stated for cabins
(§5), the preseason-pricing caveat (C24), and any advance-booking window
(C22).** C22 is a genuine gap — no "X days in advance" statement appears
anywhere on the operator's own site the verifier read in full — and is not
published as a number in either direction.

---

## 4. Season and closures

| Published | Verdict |
|---|---|
| "The 2026 Landmand golf season opens on May 16th, 2026 & ends on October 1st, 2026" | C31 — confirmed in substance, **with a punctuation correction applied**: no terminal period, and the source breaks the line before the ampersand. Published exactly, quoted, with the ampersand kept and no period added. |
| No closure inside the season on the operator's own site | C32 — confirmed, genuine absence checked across `/`, `/faq`, `/guest-info`, `/contact-us`, `/press` |
| Farmer's Table hours, 7:15 a.m.–9:00 p.m., with the caveat that closing hours may change toward the end of the season | C34 — confirmed verbatim (curly apostrophe and no closing period in the source, both dropped for house style; wording preserved) |

**Time-critical note, not itself published as a sentence in the guide:**
per C33, today (2026-09-05) is twenty-six days before the season's 1 October
close. The guide does not spell out the day-count — a number that goes stale
the day after publication — but the close date itself is stated three times
where an autumn-trip reader will see it: the guide intro, the "Booking a tee
time" section (with the verbatim season quote), and the first FAQ answer,
which is also the FAQ that satisfies the play/tee-time/book gate requirement.
No closure falls inside the season per C32, so nothing qualifies the October
1 date.

---

## 5. Basecamp

| Published | Verdict |
|---|---|
| On-site cabins, $800/night, booked direct via Lodgify; cabin bookings do not include tee times | C28, C35 — confirmed |
| $60 nonrefundable cabin deposit; 90% refund at 21+ days before arrival, 50% at 14 days, none inside 14 | C23 — confirmed, the finder missed this |
| Check-in 3:00 p.m.; door code sent at 2:00 p.m. | C35 (`/guest-info`) — confirmed |
| South Sioux City Marriott Riverfront named in the FAQ for a golfer discount | C36 — confirmed verbatim; this is not the fabricated-characterisation failure class the verifier warned about — the finder's truncated quote understated it but did not misrepresent it |
| Marriott identity: 385 East 4th Street, South Sioux City, NE 68776, phone +1 402-494-4000 | C38 — confirmed, via an archived (Wayback, 2026-05-14) copy of the hotel's own schema.org data, since the live page 403s both curl and WebFetch |
| Independent corroboration of the address and county (Dakota County) | C39 — confirmed, Nominatim/OSM |
| **No trading-status claim for the Marriott** | U1 — uncertain. Published: name, address, phone, and the FAQ's discount claim attributed to Landmand; explicitly **not** published: that the hotel is currently open, or that the discount is currently honored. The guide's "Staying near the course" section and its FAQ answer both say this in so many words. |
| "Homer has no hotel inventory" | U2 — uncertain, absence of evidence. **Not published in either direction.** The guide names only the two sourced options (cabins, Marriott) and makes no claim about Homer's lodging generally. |
| The FAQ's Marriott booking link's actual destination, or a specific discounted rate figure | U3 — uncertain, the link is a JavaScript shell with no property name or rate in static HTML. **No rate figure published**; the guide states only that a discount is offered per the FAQ, without a number. |

Road distance, course to hotel — **13.1 miles (C40)** — is not published in
this file. It did not fit the guide's chosen itinerary facts (Sioux City and
SUX distances were prioritized per the corrections) and no section required
it; it is recorded here so the figure is not lost if a later wave wants it.

---

## 6. Getting there

| Published | Verdict |
|---|---|
| Sioux City, Iowa: **14.3 miles** from the course, road distance | C43 — confirmed, OSRM |
| Golf Digest's own "about 10 miles from Sioux City, Iowa" | C42 — confirmed verbatim, published **alongside**, not in place of, the routed figure, exactly as the verdict directs |
| Sioux Gateway Airport (SUX), Woodbury County, Iowa: **16.8 miles** | R2 — refuted-and-corrected. The finder called this a gap; it is not — OSRM supplies it directly. Published verbatim per the correction. |
| Route: US 75/US 77 south from Sioux City, then county roads west — 210th Street, H Avenue, 212th Street — to South Bluff Road | R3 — refuted-and-corrected. The finder called the road numbers unfound; OSRM's route `ref` fields supply them. Published verbatim per the correction, reversed into "from Sioux City" phrasing to match the guide's direction of travel. |
| Airport's alternate name, "Brigadier General Bud Day Field," and its county | R4 correction, C44 — confirmed |

**No trip duration appears anywhere in this file.** Every distance is a road
mileage with a route or direction attached; no OSRM duration figure was
published in its place, per the corrections' explicit instruction.

### The fabricated quotation — deliberately omitted

**Not published, at all: any airline, route, or "currently served" claim for
Sioux Gateway Airport.** The finder's purported quotation —
*"classified…currently served by United Express"* — does not exist on the
Wikipedia article it was attributed to. Per R4: the word "classified" does
not appear (the article says "categorized," from a 2011–2015 planning
document, not a current-status claim); "currently served" and "with nonstop
flights to" do not appear at all; and the United Express/Chicago–O'Hare/Denver
pairing exists only inside a `{{Airport destination list}}` template that the
article itself flags as `{{Unsourced section|date=June 2024}}`. The article's
actual sourced narrative is a sequence of carriers *leaving* — Northwest, then
Frontier (ended 2008), Delta (final flights April 2012), American Eagle
(ended April 5, 2021) — the opposite of what the fabricated quote implied.
This guide names the airport, its alternate name, its county, and the 16.8-mile
routed distance. It makes no claim about who flies there, because the only
source for one is an explicitly unsourced Wikipedia table sitting inside a
sourced history of withdrawal.

---

## 7. The course itself

| Published | Verdict |
|---|---|
| Architects Rob Collins and Tad King | C45 — confirmed, Golf Digest review text |
| Fairways 80–100 yards wide; greens "cumulatively and in some cases individually, the largest in the United States," Golf Digest's own hedge kept intact | C45 — confirmed, hedge published with the claim, not shortened to a flat superlative |
| Rob Collins' own quote about the site ("jaw-dropping," "Sand Hills look," "raw, natural, tumbling landscape") | C47 — confirmed, the club's own homepage, attributed to Collins |
| Golf Digest #3, "Public," previous rank also 3 | C5 — confirmed, the only ranking placement published |

**Omitted, with reason:**

- **Year opened** — C48, genuine gap. Not stated on the club's own site or in
  Golf Digest's review text ("a new design" only). Not inferred from the
  "2022 Best New" phrasing or the site footer's copyright year, per the
  verdict's explicit instruction not to.
- **Tournament history or conservation status for Landmand itself** — C49,
  genuine gap. No source reached states either.
- **The club's four self-published ranking claims** (Golfweek #14 and #26 —
  and per R5 the finder had the two titles transposed — "America's Best New
  Courses 2022 – Best New Public Course," and the club's own "#3 2023"
  restatement of Golf Digest). All four are the club's own assertions on its
  own press page, none independently verified by the awarding body. Per the
  verdict's "must not publish" list, the only ranking placement this guide
  states is Golf Digest's current, independently-read one: #3, Public, Best
  In State.

---

## 8. Day two — omitted entirely

**Floyd Park Golf Course, Sioux City, is not published, in any form.** U4:
its existence and municipal character are sourced (Wikipedia, corroborated by
OpenStreetMap, which also corrects its county to **Woodbury County, Iowa**,
not Plymouth — Plymouth County is Hidden Acres), but current operating
status, hours and fees are not, and the city's own golf page 404s. Rather
than publish it as "unverified" — the verdict's other permitted option — this
guide omits a day-two recommendation entirely, since no second course or
activity in the corpus reached a confirmed operating status.

---

## 9. Places, against the verdicts they rest on

One `golf-course` place — the ranked course only; no second course is
published, since none of the lower-ranked public entries on the Nebraska list
(Quarry Oaks, Tatanka, Prairie Club Pines/Dunes, Wild Horse) were verified
beyond name, town and label, which is not enough to anchor a place record.

| slug | kind | rests on |
|---|---|---|
| `landmand-homer` | `golf-course` | C5, C6, C3, C4, C9–C14, C16, C45, C47 |
| `landmand-cabins-homer` | `hotel` | C23, C28, C35 |
| `south-sioux-city-marriott-riverfront` | `hotel` | C36, C38, C39, U1 |
| `farmers-table-landmand` | `restaurant` | C34 |

All four carry `photos: []`, as does the guide. No photo scout has run for
this state.

**`address` fields are populated for all four places**, unlike Oregon, where
no verdict established a street address for any place. Here C9 gives the
course's own address directly, C38 gives the hotel's, and the cabins and food
truck are on the same site as the course.

**`status: "open"` on all four is not a trading claim.** Per
`Ethos.Seeds.DataGuide`'s moduledoc, `"open"` renders nothing and is the
absence of a closed claim — it does not contradict the Marriott's uncertain
trading status (U1), which is handled entirely in the prose, exactly as the
moduledoc directs.

Four entries, one per place, all `place_slug` values resolving inside this
file.

---

## 10. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, on the first run. No allowlist entry was added;
`Ethos.GolfProse`'s allowlist remains `[]`.

No draft phrasing tripped a pattern during authoring — no trip duration and
no vague proximity phrase was written into any draft of this file. The
guide's mileages are all stated as "N miles" with a route or direction
attached (e.g., "14.3 miles from the course," "16.8 miles away, both routes
running by way of US 75/US 77"), never as a duration, and no sentence uses
`next door`, `steps from`, `within walking distance`, `around the corner`, or
a direction relative to "the course/clubhouse/resort/links/property/site/
first tee" (all banned by pattern 5) — every directional claim in this file
is relative to a named road or a named town, which the gate's own comment
notes is exactly the exception it leaves open.

---

## 11. What is absent from the whole file

- **No trip duration of any kind.** Every distance is a road mileage with a
  route or a compass/named-road reference.
- **No vague proximity.** "On site" is used for the cabins and food truck
  (both genuinely part of the golf club's own property, per C35 and the
  FAQ), never a vague relational phrase.
- **No price without the source's own date context.** The $160 green fee
  ships under the FAQ's 2026 season heading (C29); cabin and season prices
  likewise sit on the same dated page.
- **No trading claim for the Marriott**, stated explicitly in the prose
  rather than left to be inferred from silence (U1).
- **No airline or route claim for Sioux Gateway Airport** — the one
  fabricated quotation in the source material for this state, caught and
  excluded in full (R4, §6 above).
- **No self-published award claim** beyond the one independently verified
  by Golf Digest itself (§7).
- **No day-two recommendation** — Floyd Park's operating status is
  unconfirmed (U4), so it is omitted rather than published as "unverified."
- **No claim that Homer is Landmand's administering jurisdiction** — the
  county field is Dakota County throughout, and the guide states three times,
  in its own words, that the course sits outside Homer's incorporated
  limits, backed by the geocoder's positive-control test (§2).
