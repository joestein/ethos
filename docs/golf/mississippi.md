# Mississippi — Dancing Rabbit Golf Club: Azaleas: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/mississippi.json`,
copying the shape of `priv/seed_data/golf/oregon.json`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/mississippi-verdicts.md`
   — the independent verifier's adjudication. **The authority.** Tally: **33
   confirmed · 2 refuted · 3 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/mississippi-finder.md` —
   the finder. Context only; where it disagrees with the verdicts file, the
   verdicts file wins.

**The governing rule:** a verdict vouches only for what its own text restates,
not for every clause of the sentence the finder wrote around it. Where a
verdict is `refuted` but supplies a correction, that correction's text ships
verbatim and nothing else from the item does.

**9 places, 9 entries, 1 guide, 5 sections, 4 FAQ answers, 0 photos.**

---

## 0. Mississippi is the clean case, and the trace says so plainly

Six states in this set have a gap between what the ranking's label claims and
what the operator's own terms allow. Mississippi does not, and the verifier
established that firmly rather than merely failing to find one: an
adversarial keyword sweep across all seven operator pages for `must stay`,
`host`, `credit line`, `guest only`, `priority`, `required`, `member`,
`resort guest` and `only available` turned up nothing except the dress code.
The operator's own Azaleas page states the course is "Available to resort
guests, club members, and the general public" — no stay requirement, no host,
no credit line, no guest priority. The casino-guest discount is optional, not
required, and all three "Book" buttons on the site resolve to the same public
reservations form. That is published directly, in the "Playing it as the
general public" section and the first FAQ answer, because a reader comparing
fifty states benefits from knowing this one is straightforward.

---

## 1. Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| course | Dancing Rabbit Golf Club: Azaleas | confirmed three ways (raw HTML, embedded JSON, WebFetch) — §2 of the verdicts |
| second course | Dancing Rabbit Golf Club: The Oaks, #8, also "Public" | confirmed, same three methods |
| facility | Dancing Rabbit Golf Club, part of Pearl River Resort, operated by the Mississippi Band of Choctaw Indians | confirmed |
| town (postal) | Philadelphia, Mississippi | confirmed as the postal address only |
| state | Mississippi | confirmed |
| county | **Neshoba County** | confirmed via US Census geocoder, run on Golf Digest's own `courseData` coordinates |

**County is stated honestly, not smoothed over.** The geocoder returns
**Neshoba County** for the course's coordinates but **no Incorporated Places
key at all** — not an empty list, not null-in-a-list, entirely absent. A
control geocode of downtown Philadelphia, MS returned "Philadelphia city",
GEOID 2856960, on the same endpoint and vintage, proving the null at the
course is a genuine geographic fact (the course sits on Mississippi Band of
Choctaw Indians trust land, outside Philadelphia's incorporated limits) and
not a tool failure. The guide's intro, "Getting there" answer and the "Where
is the Azaleas Course, exactly?" FAQ all say this directly: "Philadelphia,
Mississippi" is the postal address, not the course's municipal jurisdiction.
`county: "Neshoba County"` is what ships in every place record and in the
guide.

---

## 2. The guide

`slug: mississippi-golf-guide` · `destination: "Philadelphia, Mississippi"` ·
`state: "Mississippi"` · `county: "Neshoba County"` · `photos: []`

### Intro

| Published | Verdict |
|---|---|
| "places Dancing Rabbit Golf Club: Azaleas fifth, labelled \"Public\"" with `rank: 5`, `displayedFacilityType: "Public"`, `private: false` | confirmed, §2, all three methods agree |
| the four private courses ranked above it, named | confirmed, §2 table |
| Fallen Oak's own access note, "available to guests staying at the Beau Rivage MGM resort in Biloxi" | confirmed verbatim, §2, "Fallen Oak's own access note" |
| the thin-panel caveat, verbatim, full sentence | confirmed verbatim, §2 |
| "Available to resort guests, club members, and the general public" | confirmed verbatim, §4, "the decisive line" |
| the Choctaw trust land / no Incorporated Place fact | confirmed, §3 |

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`. No trip duration and no
straight-line distance appear.

| Published | Verdict |
|---|---|
| JAN as the nearest major commercial airport | confirmed, §6, "sourced road distance" |
| 71.3 miles by road, OSRM, "a road-network distance, not straight-line" | confirmed, §6. **The 1.62-hour duration is deliberately omitted** — the verdict states it "exists but is not to be published in place of the distance," and this guide does not publish it in any form. |
| address 13541 Mississippi 16, Philadelphia, MS 39350 | confirmed, §2, Golf Digest's own `courseAddress` |

**Omitted:** the finder's turn-by-turn route narrative (Airport Road/
International Drive, then "roughly 32 miles" on MS-25 before reaching MS-16).
The verifier's own confirmed item is the total mileage from OSRM's `code: Ok`
response; the intermediate route steps are the finder's gloss on OSRM's
`steps` array and were not independently re-verified as a discrete item. Only
the total distance and the course's own frontage on MS-16 (itself confirmed
via the address) are published.

### Section 2 — `The Azaleas Course`

| Published | Verdict |
|---|---|
| Tom Fazio and Jerry Pate; the Whitten quote, verbatim, "opened in 1997… opened two years later" | confirmed, §2, with the sourcing correction that this text is the ranking page's own description block, not the course page's `og:description` |
| club phone (601) 663-0011 | confirmed, §2 |
| "many tournaments are played on the Azaleas," no tournament named | confirmed verbatim, §6, "gaps are real gaps" |
| Mid/In/Off Season green fees, exact figures, all dated to the page's own "2026" | confirmed verbatim, §6, "green fees" |
| the Off Season caveat, verbatim | confirmed, §6 |
| discount categories (military, junior, casino gaming badge, fair weeks) as optional reductions, not requirements | confirmed, §4, "the casino-guest discount is optional, not required" |
| the June aerification note | confirmed, §5. **Published without inventing dates**, per instruction — the quote "Ask about our aerification schedule for June" is the entire sourced sentence, and no month-day or year is added anywhere near it. |

**Omitted:** any green-type claim (TifEagle vs. bentgrass) — U2, the operator
contradicts itself across two pages and neither figure publishes. Also
omitted: any protected/heritage designation — sourced nowhere.

### Section 3 — `Playing it as the general public`

This section is **C-equivalent to Oregon's day-guest section**: the single
most consequential paragraph in the file, because it is where a reader
decides whether they can play at all.

| Published | Verdict |
|---|---|
| the Azaleas page's full quote, verbatim, "Opened in July 1997… general public… natural beauty, meticulous design, and exceptional playability" | confirmed verbatim, §4, "the decisive line" |
| no stay requirement, no casino host, no credit line | confirmed, §4, adversarial keyword sweep, zero hits |
| all three "Book Tee Times" / "Book The Oaks" / "Book The Azeleas" buttons resolve to the same reservations page | confirmed, §4, "the three... buttons were followed" |
| the reservations-page quote, verbatim, including the source's own typo "availabilty" | confirmed verbatim, §4 |
| booking by form or by phone, (601) 663-0011 | confirmed, §4 |
| the rates-page quote, "Paid at the golf shop counter. Not part of the golf package offering." | confirmed verbatim, §4 |
| stay-and-play packages as an alternative, not a requirement, phone 1-866-447-3275 | confirmed, §4, "packages are an alternative, not a requirement" |
| "the only 'required' anywhere on the operator's site is the dress code," with the dress-code quote verbatim | confirmed, §4 |

**Omitted, deliberately:** any suggestion that a casino stay, players-club
membership, or host relationship is needed to play — affirmatively
contradicted by the operator, and explicitly item 10 on the verdicts' "must
not be published" list stated as a thing to avoid asserting, not something to
publish in inverted form either.

### Section 4 — `Day two: The Oaks`

**This is the section the truncated quote almost broke.** See §4 below.

| Published | Verdict |
|---|---|
| The Oaks ranks eighth, also "Public" | confirmed, §2 |
| shares the Azaleas' public booking terms | confirmed, §4 (applies to both courses; the operator's pages do not distinguish Azaleas-only vs. Oaks-only terms) |
| the full weekly-closure sentence, verbatim, hedge included | confirmed verbatim, §5 |
| the Monday/Tuesday distinction spelled out for a day-two visitor | derived directly from the quote; no additional claim beyond what the sentence states |

### Section 5 — `The weekend around the course`

| Published | Verdict |
|---|---|
| Pearl River Resort run by the Mississippi Band of Choctaw Indians, with two casino hotels and Geyser Falls | confirmed, §6 |
| Golden Moon Hotel & Casino, "a 26-storey tower about a mile from the first tee" | this is R2's correction text, published **verbatim** |
| "The operator's own sites disagree on Golden Moon's room count, so this guide publishes none" | R2 — **no room count is published for Golden Moon in any form**, including inside a sentence about the disagreement itself |
| Silver Star, "over 500 rooms and a 90,000 square foot casino floor" | confirmed, §6 — R2 explicitly permits this figure as uncontested |
| Dancing Rabbit Inn correction, verbatim, "140 rooms in the golf course's parking lot… breakfast is available at the clubhouse" | this is R1's correction text, published **verbatim** and complete |
| "'Family friendly' is the resort's own description of Geyser Falls Water Theme Park, not of any hotel on the property" | R1 — the corrective statement made explicit, exactly as the misattribution demands |
| Club House Restaurant, Phillip M's, Mama 'n' Em named | confirmed, §6, dining list |
| Phillip M's superlative, quoted and attributed as the resort's own marketing, never asserted as fact | confirmed, §6, with the explicit instruction that a business's own site is never authoritative on a superlative about itself |

### FAQ

Four questions. The gate requires one matching `play|tee time|tee times|book`;
the first question matches, and it is also the one that carries the weekly
closure quote in full — satisfying "an FAQ answering how a visitor plays this
course" and "should carry both weekly closure days" in the same answer. The
fourth question repeats the closure distinction from the Oaks's own point of
view, so a reader scanning only the FAQ (and not the section prose) still
gets both days.

* "How do I book a tee time at the Azaleas, and what are the closure days?" —
  the C-equivalent access paragraph plus the full weekly-closure quote.
* "What does a round cost?" — the Mid/In/Off Season figures, 2026-dated.
* "Where is the Azaleas Course, exactly?" — the county/postal-address
  distinction, stated plainly.
* "Which course should I play on day two, and is it open that day?" — The
  Oaks at #8, plus the Monday/Tuesday distinction restated from the Oaks's
  side.

---

## 3. The truncated quote, and why it mattered

**The finder's version of the closure sentence lost two things: "365 days a
year" and the entire Oaks/Tuesday clause.** As delivered by the finder, the
quote read only as far as "the Azaleas is usually closed on Monday." Had that
truncated form shipped, this guide's own "Day two" recommendation — play The
Oaks second — would have sent a reader to a course that is, per the
operator's own FAQ, usually shut on Tuesday, with the guide never having said
so. The verifier's re-fetch of the FAQ page recovered the full sentence:

> "Dancing Rabbit is available for golf 365 days a year, the Azaleas is
> usually closed on Monday and the Oaks on Tuesday for general maintenance."

This guide publishes the **whole sentence, verbatim, in quotation marks and
attributed to the operator's FAQ**, in the "Day two: The Oaks" section and in
the first FAQ answer — twice, once from each course's point of view. Quoting
it in full is not the same as asserting "the course is open 365 days a year"
as an independent fact: the verdicts file separately marks that clause
uncertain and self-contradicted (U3, "Open 365 days a year" — "self-
contradicted in its own sentence," item 5 of "what must not be published"),
because the same sentence claims year-round availability and a standing
weekly closure in the same breath. This guide never asserts "open 365 days a
year" as its own prose claim anywhere — the phrase appears exactly once,
inside the quotation marks of the sourced sentence, exactly where the
operator wrote it, and every other reference to the closures names only the
Monday/Tuesday split with the word "usually" attached. That is the resolution
the correction demands: publish the full quote so the Oaks's closure day
survives, without converting the quote's own internal contradiction into a
guide-authored availability claim.

---

## 4. What was withheld, and why: the Golf Digest ranking-history block

**Nothing from Golf Digest's ranking-history box is published anywhere in
this file.** The finder quoted "100 Greatest Public: Ranked from 2003-'08,
2015-'18. Highest ranking: 70th, 2005-'06. Best in State: Ranked fourth,
2015-'18. Ranked fifth, 2011-'14, 2019-'22, 2023-'26." A WebFetch read of the
course page returned exactly this text — but the Golf Digest **course** page
(as distinct from the ranking page) 403s curl with browser headers, and no
Wayback snapshot exists for it (CDX empty, `/web/2026/` 404). That leaves
**a single tool, WebFetch, as the only witness** to this specific text, on a
host the research programme has already documented eight separate tool
artefacts on (truncated lists, mis-ordered rank, badge-shift, hallucinated
course names on sibling states' ranking pages). One tool reading one
unarchivable page is not a source under this programme's own standard — it is
exactly the situation the verdicts file marks "uncertain" (U1) and instructs:
"Do not publish the ranking history." The #5 placement itself is unaffected,
because that fact is confirmed three independent ways (raw HTML, embedded
JSON keyed by each entry's own rank field, and WebFetch as a third,
non-relied-upon witness) from the **ranking** page, which curl reaches
directly via Wayback. This file records the withholding here rather than
silently dropping the block, because the reasoning — one-tool-on-a-documented-
failure-host is not a source — is itself a fact worth a future reader
finding.

---

## 5. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum: the ranked course and the
second course.

| slug | kind | rests on |
|---|---|---|
| `dancing-rabbit-azaleas` | `golf-course` | §2 (rank, label), §2 (Fazio/Pate, 1997), §4 (access), §5 (Monday closure) |
| `dancing-rabbit-oaks` | `golf-course` | §2 (rank, label), §2 ("two years later"), §4 (shared access terms), §5 (Tuesday closure) |
| `golden-moon-hotel-casino` | `hotel` | R2 correction, verbatim |
| `silver-star-hotel-casino` | `hotel` | §6, "over 500 rooms" |
| `dancing-rabbit-inn` | `hotel` | R1 correction, verbatim |
| `dancing-rabbit-clubhouse-restaurant` | `restaurant` | §6, dining list |
| `phillip-ms-silver-star` | `restaurant` | §6, dining list, superlative attributed not asserted |
| `mama-n-em-pearl-river` | `restaurant` | §6, dining list |
| `geyser-falls-water-theme-park` | `attraction` | R1, "family friendly" reattributed here |

Every one of the nine has `photos: []`, as does the guide — no photo scout has
run for this state.

**No street address on any place except what the course records carry in
prose** (13541 Mississippi 16 appears in the summary text and the FAQ, not as
a separate `address` field — no verdict establishes a structured address
field, and none is invented to fill one).

Nine entries, one per place, all `place_slug` values resolve inside this
file. Slugs are qualified by course/property name
(`dancing-rabbit-azaleas`, `golden-moon-hotel-casino`, `phillip-ms-silver-star`,
etc.) and checked against every other slug in `priv/seed_data/` before
writing — no collision found.

---

## 6. What must not be published, and where each one was kept out

Copied from the verdicts file's own list, with the guide location that
enforces each:

1. **The Golf Digest ranking-history block** — omitted entirely (§4 above).
2. **Any Golden Moon room count** — omitted from the Golden Moon place record
   and from the "weekend around the course" section; the disagreement is
   named without either number.
3. **"Family friendly" attached to Dancing Rabbit Inn** — reattached to
   Geyser Falls Water Theme Park instead, in both the section prose and that
   place's own summary.
4. **Any green-type claim for the Azaleas** — neither "TifEagle" nor
   "bentgrass" appears anywhere in the file.
5. **"Open 365 days a year" as an independent factual claim** — the phrase
   appears exactly once, inside the sourced quotation, never asserted as the
   guide's own prose (§3 above).
6. **The weekly closure without the word "usually"** — every occurrence of
   the Monday/Tuesday closures carries "usually."
7. **Any named tournament, and any protected/heritage designation** — neither
   appears; the FAQ's own unnamed-tournaments sentence is quoted instead.
8. **The 1.62-hour drive time in place of the 71.3-mile distance** — only the
   mileage is published; the duration does not appear anywhere in the file.
9. **Phillip M's "best fine dining restaurant in the South" as fact** — it is
   quoted and explicitly attributed as the resort's own marketing
   characterisation, never asserted as an independent rating.
10. **Any suggestion that a casino stay, players-club membership or host
    relationship is needed to play** — the guide states the opposite,
    directly and with sourcing, in the "Playing it as the general public"
    section and the first FAQ answer.

---

## 7. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures, on the first run.** No allowlist entry was added;
`Ethos.GolfProse`'s allowlist remains `[]`.

No banned phrasing had to be rewritten out of this file. The mileage in
"Getting there" ("71.3 miles from the Azaleas course by road") and "about a
mile from the first tee" (Golden Moon) were checked by hand against
`Ethos.GolfProse.patterns/0` before drafting finished, since a plain mileage
figure sits close to the proximity family: neither matches any of the 28
patterns, because pattern 5 requires a compass direction immediately before
"of the course/clubhouse/resort/links/property/site/first tee," and a bare
distance-and-preposition does not supply one. No relative-date language
appears anywhere in the file — every closure reference is either the
absolute weekly-day pair (Monday/Tuesday) or the hedge word "usually," and no
sentence dates itself against the guide's own writing day.

---

## 8. What is absent from the whole file

* **No trip duration of any kind.** The one distance published (71.3 miles)
  carries no duration alongside it.
* **No vague proximity.** "About a mile from the first tee" is the one
  spatial descriptor close to that family, and it is the verdict's own exact
  correction text, naming a specific reference point with a specific
  distance rather than a vague relation.
* **No relative or self-dating language.** No "days away," no "Today is…,"
  no "currently closed," no "next week." The only date-shaped language in the
  file is the source's own season labels (2026) and the absolute weekday
  names Monday and Tuesday.
* **No price without the source's own date.** Every green-fee figure sits
  under the rates page's own "2026" season headings.
* **No trading claim beyond what a status field implies**; `status: "open"`
  on all nine places is the absence of a closed claim, not an assertion that
  any given venue is serving today, per `Ethos.Seeds.DataGuide`'s own rule.
* **No inference published as a citation.** The Golden Moon room count, the
  Azaleas green type, any USGA ranking-history detail, and any casino-stay
  requirement were each a sentence some source gestures at without stating
  cleanly — all four are left out rather than resolved by guesswork.
