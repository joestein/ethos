# Colorado — TPC Colorado: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/colorado.json`,
following the register established by `docs/golf/oregon.md`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/colorado-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **27
   confirmed · 5 refuted · 5 uncertain** (37 adjudicated claims).
2. `.superpowers/sdd/2026-09-05-golf-courses/research/colorado-finder.md` — the
   finder. Context only. It carries **five refuted claims**, including its
   county source and its access summary. Where the two disagree, the verdicts
   file wins.
3. `priv/seed_data/golf/oregon.json` — the canonical shape this file copies.

**The refuted-with-correction rule (carried from the Oregon register):** where
a verdict is `refuted` but supplies a correction naming what may still be
published, that correction's text ships as given and nothing else from the
item does.

**4 places, 4 entries, 1 guide, 5 sections, 4 FAQ answers, 0 photos.**

---

## 0. The selection — thirteen Private labels, verified twice

Golf Digest's 2025-'26 "Best in State" ranking for Colorado places TPC
Colorado at #14 — the first entry on the list carrying Golf Digest's own
`Public` label. Positions #1 through #13 are every one of them labelled
`Private`.

**This is the fact that makes the whole selection trustworthy, and it was not
taken on the finder's word.** The verifier fetched
`https://www.golfdigest.com/courses/guides/colorado-best-golf-courses-rankings`
via WebFetch **twice, with two differently-framed prompts**, and on both
passes read **all thirteen** higher-ranked entries individually — Ballyneal
Golf Club, Castle Pines Golf Club, Cherry Hills Country Club, Colorado Golf
Club, Maroon Creek Club, The Broadmoor Golf Club East Course, Sanctuary Golf
Club, Roaring Fork Club, Red Sky Ranch & Golf Club Fazio Course, Country Club
of the Rockies, Red Sky Ranch & Golf Club Norman Course, Frost Creek Golf
Club, and Denver Country Club — confirming the literal label string `Private`
for each, not inferring it from a pattern. The Broadmoor East (#6), a resort
course that might plausibly have carried a "Resort" label instead, was
specifically re-probed on the second pass; it too reads `Private`. (C1, C2,
C3 — all confirmed.)

**Caution recorded, not published as a claim:** Golf Digest's *separate*
"Best Public Courses in Colorado" guide ranks The Broadmoor East, Red Sky
Fazio and Red Sky Norman — all three `Private` on the Best in State list —
*above* TPC Colorado (C16a). Golf Digest is internally inconsistent between
its own two guides. This does not change the selection (the published rule is
"first Golf Digest-labelled Public entry on Best in State," and TPC Colorado
at #14 is unambiguously that), but no sentence in this guide claims TPC
Colorado is Colorado's best publicly-accessible course in general — see
omission O9.

---

## 1. Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| course | TPC Colorado | C1, C4 — confirmed |
| city | Berthoud | C5 — confirmed, operator's own printed address ("2375 TPC Parkway", "Berthoud, CO 80513") |
| state | Colorado | C1 |
| county | **Larimer County** | C6 — confirmed |

**County sourcing is the second trust-critical fact in this file, and it took
the most care.** Two sources establish it:

1. The **U.S. Census Bureau geocoder**, coordinate lookup on the course's own
   location (40.3432972, −105.1114492) — returns `Counties -> Larimer County`.
2. The **Town of Berthoud's recorded Heron Lakes Rezoning Map, Amendment 6**
   (`berthoud.org/AgendaCenter/ViewFile/Item/1118?fileID=1804`), bearing the
   Larimer County Clerk & Recorder's own filing certificate and the surveyor's
   caption "HERON LAKES REZONING MAP - AMENDMENT 6, County of Larimer, State
   of Colorado."

**Caution — a source deliberately NOT used, and why.** The finder cited
`heronlakescommunity.com/environmental-stewardship/` for the county (C6b).
The quote it relies on is real and verbatim — "over 40 acres are dedicated to
the partnership with GOCO, Town of Berthoud, City of Loveland, Larimer County
and Colorado Parks and Wildlife" — but Larimer County appears there as a
**party to a conservation partnership**, not as the jurisdiction the property
sits in. The City of Loveland is named in the identical list and the course
is not in Loveland; Colorado Parks and Wildlife is named and is not a
jurisdiction at all. This is the exact county-miscitation shape the ballpark
run flagged repeatedly: a true fact, cited to a page that supports it for the
wrong reason. **This citation is not used anywhere in this guide for the
county.** (It is used once, correctly, for the conservation description in
the "TPC Colorado" section, where it is authoritative for describing its own
community's land dedication — see C33 below.)

**Caution — a second source rejected outright, and why.** The finder also
cited a Berthoud annexation resolution
(`berthoud.org/DocumentCenter/View/2731/...`) as corroboration, describing it
as covering "adjoining Heron Lakes acreage" and referencing "Larimer County
Road (LCR) 14" as a boundary (C7). **Verdict: refuted, fabricated
characterisation.** The verifier ran a text search on the actual document:
zero occurrences of "Heron," zero of "LCR," zero of "Road 14." The document is
Resolution No. 16-05, a 2005 annexation of County Road 19 right-of-way, in
Section 16, Township 4 North, Range 69 West — Heron Lakes is in Section 3 of
the same township, a different parcel twenty-one years earlier. **This
citation is not used anywhere in this guide.** Berthoud does straddle the
Larimer/Weld county line (C8), which is exactly why a coordinate-level source
was needed instead of a town-level one — the course itself sits west of I-25,
firmly on the Larimer side.

`county: "Larimer County"` derives `/destinations/colorado/larimer-county`.

---

## 2. The guide

`slug: colorado-golf-guide` · `destination: "Loveland, Colorado"` ·
`state: "Colorado"` · `county: "Larimer County"` · `photos: []`

**Why the destination (basecamp) is Loveland, not Berthoud.** No verdict
establishes any confirmed lodging or dining in Berthoud itself. The one hotel
the finder named there was never actually in Berthoud — see O3 — and every
other confirmed secondary place in this file (the second course, the
restaurant) sits in Loveland. Loveland is the town a visitor sourced by this
file actually has a bed or a meal in.

### Intro

| Published | Verdict |
|---|---|
| "thirteen courses ahead of TPC Colorado 'Private'... first entry... carrying Golf Digest's own 'Public' label, at #14" | C1, C2, C3 — confirmed |
| "TPC Colorado is a members-first club, non-members book by phone up to seven days ahead" | C9, C12 — confirmed verbatim |
| "the club's own page reserves Thursday through Sunday to its membership and the TPC Network, releasing any leftover tee times to the public only 24 hours in advance" | C11 — confirmed verbatim |
| "a traveller who wants a guaranteed round on a Saturday or Sunday... should plan on Mariana Butte Golf Course... as the practical weekend round instead" | This is the guide's Ruling 9 framing — the intro states the weekend-access reality up front, per the assignment's instruction that "a guide whose intro sells a weekend while burying the booking reality is misleading by structure." Mariana Butte's public/municipal status is C24. |

### Section 1 — `Getting there`

Heading is exactly `Getting there`. **No trip duration appears anywhere in
this section or this file.**

| Published | Verdict |
|---|---|
| DEN to Berthoud, 53 miles | C26 — confirmed verbatim, `travelmath.com`: "The driving distance from Denver International Airport to Berthoud, Colorado is: 53 miles / 85 km" |
| "north on I-25 to Exit 250 at Johnstown, then west on Colorado State Highway 56 for 9.5 miles to its western terminus at US 287 in Berthoud" | C28 — confirmed in substance. The verdict specifically corrects the finder's rendering of the Wikipedia terminus fields as prose quotes that don't appear on the page in that form; this file states the route as plain fact rather than as a quotation, matching the correction. |
| "Northern Colorado Regional Airport (FNL)... has no scheduled commercial airline service" | C27 — confirmed as a gap: FNL's scheduled service ended after 2017; a new terminal opened November 2024; carriers are only evaluating future routes. |

**Not published:** any duration (§ "must not be published" 11), any
straight-line distance, the "US 287 bypasses Berthoud" detail (C29,
uncertain — O5).

### Section 2 — `TPC Colorado`

| Published | Verdict |
|---|---|
| "Arthur Schaupeter Golf Course Architects designed TPC Colorado's championship course" | C30 — confirmed, operator's own words |
| "stretching to more than 7,991 yards from the tournament tees and playing from 4,157 yards forward" | C34 — confirmed as the correction. The operator's `/golf-course/` page gives a stale, different figure (7,900/4,000–7,600); the correction directs publishing the more precise number from `tpc.com/colorado/` and `tpc.com/colorado/golf/` instead. |
| "No opening year is published here... a grand opening was 'scheduled for 2018,' which is not a record of when the course actually opened, and the operator's own site states no opening year at all" | C31 — refuted, correction applied exactly: omit the year entirely, no hedge word. |
| "the Korn Ferry Tour has played TPC Colorado every year since 2019" | C31's suggested date anchor, and C32 — confirmed, Wikipedia: "first played in July 2019" |
| "under three tournament names in sequence — TPC Colorado Championship, The Ascendant presented by Blue, and The Blue Championship, with Blue Federal Credit Union named title sponsor of the event starting in 2026" | C32 — confirmed |
| "one of the largest Great Blue Heron rookeries in Colorado; more than 90 acres there are dedicated land that cannot be developed, part of a conservation partnership among GOCO, the Town of Berthoud, the City of Loveland, Larimer County and Colorado Parks and Wildlife" | C33 — confirmed verbatim from `heronlakescommunity.com`, used here **only** for the conservation description, never for the county (see §1 caution) |
| "This is a conservation designation, not a historic one — no historic designation was found for the property" | C33 — confirmed as an absence |
| "the club names three dining outlets: Center Stage & 773 Prime... the Golf Café; and the Waterfront Grill" | C23 — confirmed, with the name correction applied: the outlet is "Center Stage & 773 Prime," not "Center Stage at TPC Colorado" as the finder had it |

**Not published:** any green fee, in any form, including the undated $280
Golf Digest figure (C17 — see O1). "Public" as a general-superlative claim
(C16a caveat — see O9).

### Section 3 — `Playing it as a visitor`

This entire paragraph is **C14's correction, published as given**:

> TPC Colorado is not an unrestricted public course. Non-members book by phone
> on (970) 663-5063, up to seven days in advance. The club states that
> non-member tee times are available Monday through Thursday after 11:00 AM
> and Friday through Sunday after 1:00 PM, subject to availability. It also
> states that Thursday through Sunday are reserved for TPC Colorado members
> and the TPC Network, with any remaining starting times released for sale
> only 24 hours in advance. The club's own wording places Thursday in both
> categories, so a Thursday time should be confirmed by phone.

This is where the finder was wrong in the direction that would have misled a
reader (C14, refuted as incomplete): its synthesis — "a non-member can call
up to 7 days ahead for Mon–Thu after 11am tee times" — silently dropped the
operator's own "and Friday through Sunday after 1:00 PM" clause, which would
have told a reader that no weekend tee time exists inside the seven-day
window at all. The operator's text does not say that. **The Thursday overlap
is reproduced faithfully, not smoothed into consistency** (C13 — the finder
transcribed the operator correctly; the contradiction is the operator's own,
confirmed on lines 109–110 of the raw fetched HTML).

| Published | Verdict |
|---|---|
| "There is no lodging requirement... TPC Colorado has no lodging of its own — the property is a golf course, clubhouse and residential community" | C15 — confirmed as an absence, phrased per the verdict's own instruction not to render it as though the operator affirmatively states it |
| "no green fee is published here, since no figure found for TPC Colorado carries a date or a season" | C17 — confirmed. The undated $280 Golf Digest figure and the undated $175–$185 secondhand figures are all excluded; none is named in the published prose (see O1) |

### Section 4 — `Day two: Mariana Butte Golf Course`

| Published | Verdict |
|---|---|
| "701 Clubhouse Dr, Loveland... a City of Loveland municipal course open to the public, in Larimer County" | C24 — uncertain on primary sourcing (every City of Loveland channel is bot-walled), corroborated by two independent aggregators, ForeTee and GolfPass, which is the standard the verdict accepts for publication |
| "Two independent aggregators, ForeTee and GolfPass, agree on its type as public/municipal, its par of 72, its architect Dick Phelps, and that it first opened for play in 1992" | C24 — confirmed by agreement between the two named aggregators, cited as aggregator-sourced rather than operator-sourced |
| "(970) 667-8308" | C25 — confirmed across both aggregators independently |
| "the city's own booking site and facility pages return only a browser-verification page to automated requests, so no operator quote or online booking link is published here" | C24's blocked-channel list: `golfloveland.com/mariana-butte`, `lovgov.org` golf and facility-directory pages, `marianabutte.cps.golf` (Cloudflare interstitial), `golfnow.com` — all 403 or bot-walled to both WebFetch and curl |
| "No yardage is published, since the sources disagree" | C24 — confirmed as a deliberate omission; the sources disagree (6,718 black / 6,604 / 6,632 blue / 5,967 white) |
| "no green fee is published, since none carries a date" | C24 — confirmed as a gap |

### Section 5 — `Dining in Loveland`

| Published | Verdict |
|---|---|
| Door 222 Food & Drink, 222 E. 4th Street, Loveland, CO 80537 | C21 — confirmed verbatim, operator's own site |
| "Upscale Casual Dining in Downtown Loveland" / "a creative menu featuring modern twists on traditional cuisine" | C21 — confirmed verbatim quotes |
| "open Tuesday through Sunday, from 4:00 pm until close; phone (970) 541-3020" | C21 — confirmed, as printed on the operator's page |

**Not published:** the City of Loveland's "Heart Improvement Plan" street
construction detail from the same page (present in the verdict but not load-
bearing for a visitor's dining decision — left out as unnecessary detail
rather than a sourcing failure); Henry's Pub, Urban Field Pizza, Sage
Speakeasy & Lounge, A.K.A Kitchen, The Loveland Chophouse (C22, uncertain,
unverified in both passes — see O2); the Residence Inn by Marriott (C20,
uncertain — see O3).

### FAQ

Four questions. The gate requires one matching `play|tee time|tee times|book`;
the first and second both match.

* "How do I book a tee time at TPC Colorado?" — C14's correction, restated.
  **This is the most important prose in the guide**, per the assignment's
  instruction, because the intro's weekend framing is only trustworthy if the
  FAQ backs it with the operator's own conditional wording rather than a
  simplified rule.
* "Can I get a weekend tee time at TPC Colorado?" — states the Ruling 9
  reality directly and points to Mariana Butte as the practical alternative,
  per C11 and C24.
* "Does playing TPC Colorado require staying at a hotel or resort?" — C15.
* "What does a round at TPC Colorado cost?" — C17, stated as an absence with
  no figure named.

---

## 3. Places, against the verdicts they rest on

Two `golf-course` places — the gate's maximum: the ranked course and one
second course.

| slug | kind | rests on |
|---|---|---|
| `tpc-colorado-berthoud` | `golf-course` | C1–C6, C9–C15, C17, C23, C30–C35 |
| `mariana-butte-golf-course-loveland` | `golf-course` | C24, C25 |
| `door-222-food-and-drink-loveland` | `restaurant` | C21 |
| `center-stage-773-prime-tpc-colorado` | `restaurant` | C23 |

All four have `photos: []`, as does the guide (no photo scout has run for
this state).

**No `address` field on TPC Colorado or Center Stage & 773 Prime.** No
verdict establishes a scorecard street address independent of the club's own
`town`/`county` fields already carried; `town: "Berthoud"` covers it. Mariana
Butte and Door 222 do carry an `address`, because C24 and C21 each source one
directly.

**Deliberately not created as places:** the Golf Café and the Waterfront
Grill (C23 confirms only their names, with no further descriptive fact to
report — creating a bare-name place record for each would be padding rather
than sourcing, per the assignment's instruction to let this guide be short);
any lodging property (see O3); the additional Loveland restaurants (see O2);
the H.L.-style conservation acreage at Heron Lakes, which unlike Oregon's
H.L. McKee Preserve is not established anywhere as a place the public visits
— it is dedicated open space and rookery habitat, not a park with confirmed
public access (see O6).

Four entries, one per place, all `place_slug` values resolving inside this
file.

---

## 4. Every omission, and why

### The five refuted claims

**O1 — any green fee, including the undated $280 figure.** *Confirmed as a
gap, C17.* Golf Digest's course profile shows $280; a search surfaced $175
and $185 elsewhere. None carries a date or a season. Per the rule that prices
publish only with the source's own date attached, **the dollar figure itself
is not named anywhere in the published guide**, including in the sentences
that explain why no fee is published — those sentences state the absence
without repeating the number, to avoid planting an unsourced price
expectation even under a disclaimer.

**O2 — the additional Loveland restaurants (Henry's Pub, Urban Field Pizza,
Sage Speakeasy & Lounge, A.K.A Kitchen, The Loveland Chophouse).** *Uncertain,
C22.* Flagged unverified by the finder and not independently verified by the
verifier either. Not published.

**O3 — the Residence Inn by Marriott Loveland Fort Collins, named lodging.**
*Uncertain, C20.* Both Marriott URLs returned HTTP 403 to WebFetch and curl
(`Retry-After: 28800`); only a TripAdvisor aggregator supports the name and
address. Under the rule that a business's own site establishes identity and
address, this hotel's identity is not established. **No lodging property is
named anywhere in this guide** as a result — the guide is honestly thinner
for it rather than padded with an unverified name.

**O4 — the county citation to `heronlakescommunity.com`.** *Refuted as a
county source, C6b.* See §1. Replaced with the Census geocoder and the
Berthoud recorded plat.

**O5 — the Berthoud annexation resolution as county corroboration.**
*Refuted, fabricated characterisation, C7.* See §1. Deleted entirely; not
used anywhere in this file.

### The uncertain claims not published

**O6 — Heron Lakes' conservation acreage as a visitable "park."** Not a
verdict item directly, but a caution applied conservatively: the source
(C33, `heronlakescommunity.com`) describes dedicated non-developable land and
a heron rookery, not a place with confirmed public trail access. Unlike
Oregon's H.L. McKee Preserve (which the resort itself frames as a walk
between rounds), nothing here establishes public access. The fact is
published as prose color in the "TPC Colorado" section; no `park` place
record was created for it.

**O7 — Mariana Butte's yardage.** *C24, sources disagree* (6,718 black /
6,604 / 6,632 blue / 5,967 white). None published.

**O8 — any operator quote for Mariana Butte.** Every City of Loveland
channel — `golfloveland.com`, `lovgov.org` (both the golf page and the
facility-directory page), `marianabutte.cps.golf`, `golfnow.com` — returned
403 or a Cloudflare bot-check to both WebFetch and curl. The course is
published on aggregator corroboration only (ForeTee + GolfPass agreement),
per C24's own standard for what may still ship.

**O9 — any claim that TPC Colorado is Colorado's best publicly-accessible
course, or "the" public course in Colorado.** *C16a's caveat.* Golf Digest's
own "Best Public Courses in Colorado" guide ranks three `Private`-labelled
Best-in-State entries (The Broadmoor East, Red Sky Fazio, Red Sky Norman)
above TPC Colorado. The guide's intro and every section describe TPC Colorado
only as "the first Golf Digest-labelled Public entry" on the Best in State
list — never as Colorado's top public course in general.

### The rules-driven omissions

**O10 — every trip duration.** No source in this artifact states one that
was used; the only travel figure that publishes is the 53-mile DEN–Berthoud
road distance (C26) and the 9.5-mile CO-56 segment (C28), both mileages with
directions, no times.

**O11 — the "US 287 bypasses Berthoud" detail.** *Uncertain, C29.* Not
re-verified by the verifier; adds nothing a driver needs. Omitted.

**O12 — any statement that TPC Colorado is open year-round or closes for
winter.** *C18, confirmed as a gap.* Nothing on any operator page states a
seasonal closure or winter hours. Published in neither direction.

**O13 — any trading claim for Door 222 or Center Stage & 773 Prime beyond
what the sources state.** Both places' summaries describe what they are and
what they serve per their own operator pages; `status: "open"` is the absence
of a closed claim, per `Ethos.Seeds.DataGuide`'s moduledoc, not an assertion
of current trading.

**O14 — every photo.** `guide.photos: []` and `photos: []` on all four
places. No photo scout has run for this state.

**O15 — a street address for TPC Colorado.** The operator's printed address
(2375 TPC Parkway, Berthoud, CO 80513, per C5) was available but not added as
an `address` field, to keep the place record's sourced claims minimal and
because `town`/`county` already carry the geography the guide's prose needs.
This is a stylistic choice, not a sourcing gap; the address is fully
confirmed if a later wave wants to add it.

---

## 5. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, on the first run after the draft above. No
allowlist entry was added; `Ethos.GolfProse`'s allowlist remains `[]`.

No draft phrasing in this file tripped a pattern before the final draft — the
Oregon register's caution about `"north of the resort"` and `"a short drive
from Coos Bay"` was kept in mind while drafting the "Getting there" and
"Playing it as a visitor" sections, and neither shape was written in the
first place (e.g. "north on I-25," not "north of the course"; "24 hours in
advance," not a duration phrase with a travel-word anchor).

**The gate hole worth re-recording for this state.** As in Oregon, the gate
does not catch an unsourced *containment* claim in ordinary prose — "TPC
Colorado is in Berthoud" is grammatically identical whether or not a source
backs it. Every geography claim in this file is backed by §1's identity
table; the defense is this trace, not the regex, per §7 of the assignment
context inherited from the Oregon register.

---

## 6. For the roster agent (informational only — roster file not touched)

Per the assignment, `priv/seed_data/golf_courses_roster.json` was **not**
edited by this pass. The values below are recorded here for the roster
agent's reference, resolved from the verdicts the same way Oregon's row was:

| field | value | verdict |
|---|---|---|
| `course` | `TPC Colorado` | C1, C4 — equals the `name` of the seeded `golf-course` place |
| `city` | `Berthoud` | C5 |
| `county` | `Larimer County` | C6 |
| `access` | C14's correction, condensed | C9–C13 |
| `criterion` | `ranking` | C1–C3 |
| `ranking_source` | `Golf Digest Best in State, Colorado` | C1 |
| `ranking_position` | `14` | C1 |
| `second_course` | `Mariana Butte Golf Course` | C24 |
| `verified` | `true` | |

---

## 7. What is absent from the whole file

* **No trip duration of any kind.** Every distance is a road mileage with a
  compass direction and a named route.
* **No vague proximity.** No "next door," "steps from," or direction relative
  to an unnamed feature anywhere in the file.
* **No price without the source's own date.** No green fee for either course
  is published, at all, in any form — including the specific dollar figures
  found, which are recorded here in this trace but never named in the guide
  itself.
* **No 2018 opening year, hedged or otherwise.** The year is omitted
  entirely; the Korn Ferry Tour's 2019 start is the only date anchor used.
* **No trading claim for any of the four places**, stated in the prose rather
  than left to be inferred.
* **No county citation to a source that names the county for the wrong
  reason**, and no corroborating source that turned out to describe an
  unrelated parcel. Both rejected sources are recorded in §1 as cautions, not
  used anywhere in the published file.
