# Louisiana — TPC Louisiana: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/louisiana.json`,
following the register `docs/golf/oregon.md` established for the golf set.

**This file is committed on purpose.** The research artifacts live under
`.superpowers/`, which `.gitignore` excludes. A year from now this file is the
only thing that can answer "where did that sentence come from".

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/louisiana-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **24
   confirmed · 7 refuted · 5 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/louisiana-finder.md` —
   the finder. Context only. Its central access claim ("the booking engine
   could not be directly read") is refuted; where the two disagree, the
   verdicts file wins.
3. A top-level authoring instruction, outside both research files, directing
   that the 8 September 2026 closure the verdicts file calls **CONFIRMED** must
   **not** be published (see §5).

**4 places, 4 entries, 1 guide, 4 sections, 5 FAQ answers, 0 photos.**

`MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs` —
**9 tests, 0 failures**, on the first run, with `Ethos.GolfProse`'s allowlist
left at `[]`.

---

## 0. The two things this guide exists to get right

**1. The single-round route is real, and was found by executing the booking
API after the finder reported the engine blocked.** The finder hit
`tpclouisiana.ezlinksgolf.com/index.html` directly, got a 403, found no Wayback
snapshot, and concluded the booking window "could not be directly read." The
verifier tried the sibling host `tpclouisiana.ezlinks.com/` instead — one URL
short of where the finder stopped — got HTTP 200, followed its redirect to the
same ezlinksgolf.com host, pulled the AngularJS shell's own JS bundle to find
its API surface, and called `api/search/init` and `api/search/search`
directly. That is where the **136-day window**, the **Non-Resident tier**, and
the **$119–$299 live pricing** come from — not a summarised page read, a raw
API response. This is the guide's lead fact (§1, intro) and it is restated in
the FAQ's `play|tee time|tee times|book` answer with the price range and the
window together, per the brief's requirement. The lesson for the programme:
"blocked" is a claim about the exact URL and headers tried, not a claim about
the resource, and the fix was to try the next-most-obvious URL rather than
accept the negative.

**2. The $4,800 / $2,800 "conflict" was a missing footnote plus a wrong
number, not an unreconciled contradiction.** The finder found $4,800 on the
Annual Pass page and $2,800 on the Special Offers page, called them
conflicting, and published neither. The verifier re-fetched the Special Offers
page and found the reconciling footnote sitting directly under the $2,800
figure on the very page the finder had quoted: `*Weekday Annual Pass.
Restrictions apply.` The two numbers were never two prices for one product —
they are the **Full** Annual Pass ($4,800, its own page's own heading is "FULL
ANNUAL PASS PROGRAM") and a promotional "starting at" figure for the
**Weekday** Annual Pass. The Weekday pass's own dedicated page, which the
finder never opened, gives its actual price as **$3,000**, which is the number
this guide publishes for that tier; $2,800 is the promo teaser the dedicated
page supersedes and does not appear anywhere in this file. The lesson: a
flagged "conflict" between two numbers on two pages should be checked for a
footnote before being treated as irreconcilable, and the dedicated page for a
product outranks a promotional summary of it.

---

## 1. Identity and the parish field

| Field | Value | Verdict |
|---|---|---|
| course | TPC Louisiana | Finder §1 / verdicts §1 — confirmed, rank 4, label `Public`, both extraction methods agree |
| facility | TPC Louisiana (Tournament Players Club) | verdicts §1 |
| town | Avondale (unincorporated) | verdicts §2 — Census geocoder returns no Incorporated Places entry at the course's own coordinates; a control point in Gretna does return one, proving the absence is real |
| state | Louisiana | given |
| parish | **Jefferson Parish** | verdicts §2 — Census `NAME: "Jefferson Parish"`, and `jeffparish.gov`'s own title is "Jefferson Parish, LA \| Official Website" |

**Why "Jefferson Parish," not "Jefferson County."** Louisiana has parishes, not
counties, and the jurisdiction names itself "Jefferson Parish" on its own
site — the Census `NAME` field independently agrees. The corpus's `county`
JSON key is a generic schema field name; its **value** here is `"Jefferson
Parish"`, exactly as this corpus already publishes "Municipality of Anchorage"
and "Town of Mosel" for other states' self-naming jurisdictions. The word
"county" never appears in any published sentence about Louisiana's
jurisdiction.

**Why "Avondale," not "Westwego."** The verifier flagged this as **uncertain**:
the operator's own address and Golf Digest both say Avondale, but the
booking engine's internal `CityName` field says `"Westwego"`. The verdict is
explicit that Avondale is the publishable form and Westwego must not be
published, so `town: "Avondale"` is what ships, worded honestly as
unincorporated per the geocoder finding, never as an "Incorporated Place."

**Golden Nugget's parish is not from a verdict.** `country-club-at-golden-nugget-lake-charles`
carries `county: "Calcasieu Parish"` because the schema (`Ethos.Places.Place`)
requires a non-blank `county` on every place, and no verdict in either
research file states Lake Charles's parish. Calcasieu Parish is Louisiana's
uncontested, undisputed jurisdiction for its own parish seat — geographic
common knowledge of the same order as "Louisiana has parishes, not counties,"
which this file also states without a verdict citation — not a researched
claim the way the Jefferson Parish determination was (that one turned on an
ambiguous incorporated-place boundary, which is why it needed a geocoder run).
No sentence in the guide's prose asserts anything about Golden Nugget's parish
beyond this structural field.

---

## 2. The guide

`slug: louisiana-golf-guide` · `destination: "New Orleans, Louisiana"` ·
`state: "Louisiana"` · `county: "Jefferson Parish"` · `photos: []`

**Destination is New Orleans, not Avondale.** Avondale is unincorporated and
has no basecamp lodging or dining in either research file — the only basecamp
found (verdicts §7 / finder §6) is Hotel Monteleone and Galatoire's, both in
the French Quarter, New Orleans. "Where a visitor sleeps" is New Orleans.

### Intro

| Published | Verdict |
|---|---|
| "places TPC Louisiana fourth and labels it \"Public\" — the highest-ranked public course on the list" | verdicts §1, Methods A and B agree |
| "the three courses ranked above it… labelled \"Private\"" | verdicts §1 |
| "11001 Lapalco Boulevard in Avondale, an unincorporated community in Jefferson Parish" | verdicts §2 |
| "book a single round online… buying no annual product, at non-resident rates of $119 to $299… inside a public booking window that runs 136 days ahead" | verdicts §3.2, §3.3, §9 |
| "Fifth… also labelled \"Public,\" is The Country Club At Golden Nugget in Lake Charles" | verdicts §1, verdict 22 |

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`. No trip duration and no
vague proximity phrase appears anywhere in this file.

| Published | Verdict |
|---|---|
| address, 11001 Lapalco Boulevard, Avondale, LA 70094 | verdicts §2 (operator's own contact page, corroborated by Golf Digest's embedded `courseAddress`) |
| Census geocoder run, coordinates, Jefferson Parish, no Incorporated Places entry, Gretna control point | verdicts §2 |
| "Jefferson Parish, LA \| Official Website" | verdicts §2 |
| 14.2 miles by road to the French Quarter | verdicts §7 — OSRM, reproduces the finder's figure exactly |
| 15.0 miles by road from MSY | verdicts §7 — OSRM, a "new datum" the finder left uncomputed |
| golf shop phone, 504-436-8721 | verdicts §3.2 — the engine's own `NoTeeTimePrimaryMessage` |

**No road name published for either leg**, unlike Oregon's I-5/US-101
citations — neither OSRM run in the verdicts file names a route number, only a
distance, so none is invented.

### Section 2 — `TPC Louisiana`

| Published | Verdict |
|---|---|
| Pete Dye, with Steve Elkington and Kelly Gibson, "opened to the public" 2004 | verdicts §7 (operator's `/about/` and `/golf/`) |
| "the #4 best upscale public golf course," named on opening | verdicts §7 |
| "over 250 acres of wetlands," "over 100 bunkers," five tees "5,121… to… 7,400" | verdicts §7 |
| Audubon Golf Trail | verdicts §7 |
| Golf Digest ranking-history quotation, verbatim, and "Facility Type Public" | verdicts §1 (third check) |
| Zurich Classic hosted since 2005, "the only PGA TOUR event in the region" | verdicts §6 |
| next playing "April 22-25, 2027" | verdicts §6 — an absolute date, stated as a true and interesting fact about the course, explicitly outside any window a current reader is planning around, per the brief |

### Section 3 — `Booking a round`

The load-bearing section. Every clause traces to §3 of the verdicts file.

| Published | Verdict |
|---|---|
| "does not need an annual pass to play" | verdicts §9 — "No annual purchase stands in for public access here, and none is needed." |
| "Book A Tee Time" tool leads to ezLinks | verdicts §3.1 |
| booking window Sep 6, 2026 → Jan 20, 2027, 136 days | verdicts §3.2, `SearchMinDate`/`SearchMaxDate`/`ViewTeeSheetDaysOut` verbatim fields |
| "Non-Resident" tier | verdicts §3.3 — `MasterSponsorID` 10147 matches the `PricingOptions` entry named `"Non-Resident"` |
| Sun 20 Sep 2026: 44 slots, $119–$299, 7:25 a.m.–5:45 p.m. | verdicts §3.3 |
| Wed 23 Sep 2026: 53 slots, $119–$279 | verdicts §3.3 |
| 48-hour cancellation | verdicts §3.3 |
| single golfer returns full inventory | verdicts §3.3 — re-run with `p06:1`, byte-identical |
| account required, no guest checkout | verdicts §3.2 — `"AllowContinueAsGuest": false` |
| Full Annual Pass, $4,800/yr plus tax, cart-fee-only $28/$14 | verdicts §3.4 — **CONFIRMED, single-sourced, unambiguous** |
| Weekday Annual Pass, $3,000/yr, Monday–Thursday | verdicts §4 — the dedicated page's own figure, which supersedes the $2,800 promo teaser |
| NOLA Card, Louisiana residents only, $329/yr, first round cart-fee-only, $74/round thereafter, two-day booking window | verdicts §3.4 — and published as an annual product, per the correction that $329 is not a weekend fee |
| weekend restriction "after 8:30 a.m. from October 1 through May 15" | verdicts §7 (Verdict 36) — the **undated** form from the card's own dedicated page, not the stale "October 1, 2025 – May 15, 2026" window from the promo page, which has already expired |

**$2,800 does not appear anywhere in this file.** Per the verdict's explicit
instruction (§4, §8.1): it is a superseded promotional figure, not a price.

**$329 appears exactly once, as the NOLA Card's annual price, and nowhere as a
green fee, weekend fee or per-round rate.** Per the verdict's explicit
instruction (§5, Verdict 21, §8.2): Golf Digest's own `$329` figure carries an
explicit "covers all ranges of greens fees… check with the course" caveat and
matches no live-inventory rate.

**No member/pass booking window (7-day or 14-day) is published.** Per §8.3:
two operator pages give two different numbers for the same audience, and only
the public 136-day window — sound and single-sourced from the API — is
published.

### Section 4 — `New Orleans basecamp`

| Published | Verdict |
|---|---|
| Hotel Monteleone, 214 Royal Street, "A French Quarter Classic," "a family-owned landmark," since 1886 | verdicts §7 |
| Galatoire's, 209 Bourbon Street | verdicts §7 (finder §6 sourced the address; the verdicts file re-confirms Hotel Monteleone verbatim and does not re-quote Galatoire's separately, so the address alone publishes, not a description) |

### FAQ

Five questions. The gate requires one matching `play|tee time|tee times|book`;
the first one does, and carries the single-round route, the price range and
the 136-day window together as the brief requires.

* "How do I book a tee time at TPC Louisiana, and do I need an annual pass?" —
  the load-bearing answer: no pass required, 136-day window, $119–$299,
  48-hour cancellation, single-golfer inventory, account requirement, phone
  number.
* "What does a round cost?" — restates the live pricing and all three optional
  annual products with their own prices, explicit that none is required.
* "Where is TPC Louisiana?" — parish, unincorporated status, both road
  distances.
* "Is TPC Louisiana the only PGA TOUR stop in the state?" — Zurich Classic,
  hosted since 2005, next playing 22–25 April 2027.
* "What else is on Golf Digest's Louisiana list?" — the three Private courses
  ranked above it and Golden Nugget at fifth.

---

## 3. Places, against the verdicts they rest on

Two `golf-course` places — the gate's maximum.

| slug | kind | rests on |
|---|---|---|
| `tpc-louisiana` | `golf-course` | verdicts §1, §2, §3, §7 |
| `country-club-at-golden-nugget-lake-charles` | `golf-course` | verdicts §1, Verdict 22 |
| `hotel-monteleone-new-orleans` | `hotel` | verdicts §7 |
| `galatoires-new-orleans` | `restaurant` | verdicts §7 / finder §6 |

**Golden Nugget's summary is Verdict 22, confirmed, in full.** The finder
reported no Wayback snapshot existed for `goldennugget.com/lake-charles` and
sourced the course only through Golf Digest. The verifier found the
`archive.org/wayback/available` API **does** return a snapshot
(`20260731061542`) and fetched the operator's own golf page from an earlier
snapshot (`20260722192000`, 200, 46,150 bytes) directly — the correction named
in the brief ("The Golden Nugget does have a Wayback snapshot the finder said
it lacked"). Published from that snapshot: designer, par-72, 18 holes, 7,000
yards, and the four rate tiers ($159 general, $129 hotel guests, $79 juniors,
$89 twilight) — all dated to that snapshot implicitly by being sourced to it
and not restated as current pricing.

**Golden Nugget's hours are not published.** Verdict 9 flags the snapshot's
"Wednesday – Monday, 8am – 4pm" hours (implying closed Tuesdays) as dated
colour, fine to publish as snapshot-dated but not as a current trading claim.
This guide omits them rather than attach the caveat, since no FAQ or section
here turns on Golden Nugget's hours — it is a see-also mention, not the
guide's subject.

**No `address` field on any place.** Required fields — slug, name, kind, town,
state, county, summary — are present and sourced; street addresses live in
the prose (Hotel Monteleone, Galatoire's, TPC Louisiana) rather than in a
structured field no schema here requires.

**`status: "open"` on all four is not a trading claim**, per
`Ethos.Seeds.DataGuide`'s moduledoc — it is the absence of a closed claim, and
the guide's prose makes no present-tense trading assertion about Golden Nugget
or the two New Orleans places beyond what their own sourced pages state.

Four entries, one per place, all `place_slug` values resolving inside this
file.

---

## 4. Every omission, and why

**O1 — the 8 September 2026 closure.** *The verdicts file calls this
CONFIRMED* (§6): the booking engine returns zero bookable slots for that date
and the tee sheet is fully blocked/reserved end to end, corroborated across
two independent sessions. **It is not published.** A top-level authoring
instruction for this whole programme overrides the per-state verdict here:
three states independently reported empty booking inventory on that same one
date, via three different booking platforms, which reads far more plausibly as
a shared query artifact (e.g., a stale cache, a scraper collision, or a
date-handling bug common to the tooling used across all three verification
passes) than three genuine, independently timed closures. No page on
`tpc.com/louisiana` — including its own Calendar of Events, which the verifier
did check and which states "No events are scheduled in September" — announces
any such closure. Per the instruction: "An absence of inventory is strong
evidence about a course and weak evidence about a date." This guide states
nothing about 8 September 2026 in either direction.

**O2 — $2,800 in any form.** *Refuted, verdicts §4.* A "starting at" promo
figure the Weekday pass's own dedicated page supersedes at $3,000.

**O3 — $329 as any kind of green fee, weekend fee, or per-round rate.**
*Refuted, Verdict 21.* Golf Digest's own caveat ("covers all ranges… check
with the course") disqualifies it as a rate, and it matches no live-inventory
price. Published only as the NOLA Card's annual price.

**O4 — any member or pass booking window (7-day, 14-day, or otherwise) as
"the" booking window.** *Uncertain, Verdict 35 — two operator pages disagree.*
Only the public, API-sourced 136-day window is published, and it is
explicitly the *public* window, not attributed to any pass tier.

**O5 — "Avondale" or "Jefferson Parish" as a town/city, or "Westwego" at
all.** *Uncertain resolved by the verdict, verdicts §2.* Avondale is stated as
unincorporated; Westwego, the booking engine's internal city field, is never
published, per the verdict's explicit instruction.

**O6 — "county" as a word describing Jefferson Parish.** *Rules-driven, per
the brief.* Louisiana has parishes; every published sentence says "parish."

**O7 — Golden Nugget's current hours or trading status.** *Verdict 9,
uncertain as to currency.* The snapshot-dated hours are true of a specific
Wayback capture, not established as current, and this guide is not about that
course, so they are omitted rather than hedged.

**O8 — the member booking-window discrepancy (7 vs. 14 days) resolved either
way.** *Uncertain, Verdict 35.* Neither number publishes as authoritative;
neither is cited at all, since only the public window matters to this guide's
subject (a non-member visitor).

**O9 — any claim about what the NOLA Card's "October 1, 2025 – May 15, 2026"
season means for the current year.** *Uncertain and stale, Verdict 36.* That
specific dated window already expired before this guide was written (today's
date is after 15 May 2026). The card's own **undated** "(October 1 – May 15)"
form is published instead, per the verdict's own recommendation.

**O10 — every photo.** `guide.photos: []` and `photos: []` on all four
places. No photo scout has run for Louisiana golf, and the licence gate
requires any referenced photo to exist on disk.

**O11 — a description of Galatoire's beyond its address.** The verdicts file
confirms Hotel Monteleone's self-description verbatim but does not separately
re-quote Galatoire's beyond the address the finder gave (finder §6). No
verdict item independently restates a description for it, so none is
invented; the address alone publishes.

**O12 — any drive-time duration, for any leg.** No verdict in this state
supplies one, and the gate bans them outright regardless. Both New Orleans
distances (14.2 mi, 15.0 mi) are the OSRM road-mileage figures, with no
duration alongside them.

---

## 5. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures.** No allowlist entry was added; `Ethos.GolfProse`'s
allowlist remains `[]`. The corpus-wide banned-phrase test passed on the first
run against the draft as written; no phrase was caught and rewritten mid-draft
for this state, unlike Oregon's two mid-draft catches. That is a property of
having no drive-time or vague-proximity language to describe in the first
place — the sourced facts here are prices, dates, and a jurisdiction name, not
a trip between two named places, so the trip-duration and proximity pattern
families were never close to firing. What was deliberately avoided by
construction, not caught by the regex:

* "the course is 15 miles outside of downtown New Orleans" (the operator's own
  wording) — replaced with the OSRM road-mileage figure per the verdict's own
  instruction to publish the routed figure over the operator's rounded claim.
* any relative phrasing around the Zurich Classic's 22–25 April 2027 date
  ("coming up," "next year," "in six months") — published as a bare absolute
  date instead, per the newly gated self-dating rule.
* any framing of the 6 September 2026 `SearchMinDate` as "starting today" or
  "as of today" — published as the bare ISO-adjacent date the API itself
  returned, with no reference to the reader's present.

---

## 6. What is absent from the whole file

* **No trip duration of any kind.**
* **No vague proximity.** Every spatial claim is a road-mileage figure or a
  named-address fact.
* **No self-dating or relative-date language.** The Zurich Classic date and
  the booking window's own start/end dates are stated as bare absolute dates;
  no sentence anywhere in this file says "today," "currently," "next week," or
  computes an offset from an unstated now.
* **No price without either the source's own date or an explicit reading
  date.** The live tee-time prices carry their own search dates (20 and 23
  September 2026); the three annual products, which carry no date on their own
  pages, are marked "read from the page in September 2026."
* **No 8 September 2026 closure claim**, per the overriding programme-level
  instruction (O1) — despite the per-state verdict calling it confirmed.
* **No trading claim for Golden Nugget's hours or for either New Orleans
  place** beyond what each source states about itself.
* **`priv/seed_data/golf_courses_roster.json` was not touched**, per the
  brief's explicit instruction; this file records no roster row.
