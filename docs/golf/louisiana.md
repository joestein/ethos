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
   the finder. Context only **for the sections the verdicts file adjudicated**.
   Its central access claim ("the booking engine could not be directly read") is
   refuted; where the two disagree on those, the verdicts file wins.
3. The same finder's **§7, which no verdict covers.** It was written from
   scratch after publication — "This section was originally written the other way
   round and has been redone by measurement," in its own words — and it is the
   only evidence behind the day-two course this guide now carries.
4. `.superpowers/sdd/2026-09-05-golf-courses/research/louisiana-basecamp.md` —
   the basecamp finder's report, also written after publication, also covered by
   no verdict. It confirms and deepens the two basecamp records this guide
   already had, adds two more, and is the only evidence behind all four.
5. A top-level authoring instruction, outside all three research files,
   directing that the 8 September 2026 closure the verdicts file calls
   **CONFIRMED** must **not** be published (see §4, O1).

**6 places, 6 entries, 1 guide, 5 sections, 6 FAQ answers, 0 photos.**

`MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs` —
**0 failures**, with `Ethos.GolfProse`'s allowlist left at `[]`, both on the
original pass and after the corrections below.

**Correction of record, 6 September 2026.** Two things changed after
publication.

**The day-two course.** What published on 5 September 2026 was **The Country
Club At Golden Nugget**, Lake Charles, selected at Golf Digest rank #5 with its
"Public" label. The spec's rule is the **nearest** other publicly accessible
course, not the highest-ranked other one, and a corpus-wide audit
(`second-course-audit.md`) found Louisiana among four states that had selected
by ranking position instead — noting that **no course-to-course distance
appeared anywhere in the finder, the verdicts or the author report**, and that
"this one wants a mileage before it ships." It now has one.
`louisiana.json` carries **Timberlane Golf & Recreation, Gretna — 9.0 road
miles**, in the same Jefferson Parish as TPC Louisiana and on the same named
road, against Golden Nugget's **212.3** at the opposite end of the state.
Twenty-three courses sit between the two.

Golden Nugget is not withdrawn. Its rank, its label, its town and its designer
still publish, in the intro, in a FAQ answer and at the close of the day-two
section, where the guide states the mileage that displaced it. What it lost is
its place record — and with it the four rate tiers and the yardage this file
previously recorded as its strongest content, which came from a Wayback snapshot
of an operator page that has never once answered a live request. §3 records why
that is a better outcome than it looks.

**The basecamp.** The guide published two basecamp places: a lodging record of
twenty-nine words and a dining record of seventeen, an address and little else
apiece. A basecamp pass sourced both properly and added one of each. The guide
now carries **Hotel Monteleone** and **Galatoire's** with the operators' own
histories, amenities and hours behind them, plus **The Roosevelt New Orleans, A
Waldorf Astoria Hotel** and **Cochon**. O11 — this file's own record that
Galatoire's could publish nothing beyond an address — is reversed at O11.

The passages below that documented Golden Nugget as the day-two course, and the
ones that recorded the basecamp as thin, have been rewritten to document what
the guide now carries; these paragraphs are the record that they once did.

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

**Timberlane's parish is the geocoder's, on the same endpoint and the same
string.** Finder §7.3 ran the Census coordinates endpoint against the course's
own coordinates and got Counties **`Jefferson Parish`** (BASENAME "Jefferson"),
Incorporated Places **`Gretna city`**, States Louisiana. **The parish string is
recorded character for character** — not tidied to "Jefferson", not normalised
to "Jefferson County" — which is the same discipline §1 above applies to the
ranked course. A control point at a separate Gretna coordinate returned the
identical pair, confirming a live lookup rather than a cached or failed one. So
the day-two course sits in the *same* parish as TPC Louisiana, and the guide
says so in its own sentence; the displaced course sat in a different one.

**A geocoder silence on Timberlane that is not an absence.** The Census
*address* endpoint returned `"addressMatches": []` for the operator's own
published "700 Lapalco Blvd, Gretna, LA 70056". §7.3 did not read that as the
place not existing: the coordinates endpoint resolved the same site, and
Nominatim independently returns "Lapalco Boulevard, Timberlane, Gretna,
Jefferson Parish, Louisiana, 70056". The empty match is recorded as a quirk of
that one endpoint. Nothing in the guide rests on it, and the guide publishes the
address the operator publishes.

**Golden Nugget's parish is no longer a field in this file — and the flag it
carried is retired.** This file previously recorded that
`country-club-at-golden-nugget-lake-charles` carried `county: "Calcasieu
Parish"` on geographic common knowledge rather than on a verdict, because
`Ethos.Places.Place` requires a non-blank `county` and no verdict stated Lake
Charles's parish. That place record no longer exists, so no unsourced field
remains. And the fact itself is now sourced anyway: §7.7 geocoded Golden
Nugget's coordinates and got Counties **"Calcasieu Parish"**, Incorporated
Places "Lake Charles city". The flag is withdrawn on both counts. It is kept
here because a reader who wants to know whether this guide ever carried an
unsourced parish deserves the answer: it did, it said so at the time, and the
correction closed it. No sentence in the guide's prose has ever asserted Golden
Nugget's parish, and none does now.

---

## 2. The guide

`slug: louisiana-golf-guide` · `destination: "New Orleans, Louisiana"` ·
`state: "Louisiana"` · `county: "Jefferson Parish"` · `photos: []`

**Destination is New Orleans, not Avondale**, and the basecamp report re-derived
that conclusion rather than inheriting it. Avondale is unincorporated — the
report re-ran the geographies query at the course's own coordinates rather than
trusting the guide, got an empty Incorporated Places layer, and confirmed the
layer answers where a place exists by getting `New Orleans city` from the same
endpoint on the same run for all four basecamp points. It describes Avondale as
an unincorporated industrial stretch of the West Bank with no hotel stock worth
naming. **The shape is: a daily-fee course outside a city, so the visitor sleeps
in the city.** "Where a visitor sleeps" is New Orleans, in Orleans Parish, and
all four basecamp places geocode to `Orleans Parish` / `New Orleans city`.

**And the choice among New Orleans places is made on merit, because mileage
cannot make it.** The report's own filter is published in the guide's opening
basecamp sentence: everything named sits inside a band of 13.09 to 13.94 road
miles from the first tee, a spread of 0.85 miles, "so the choice is made on what
a visitor gets rather than on mileage." That sentence is doing work — it is the
answer to the obvious objection that a metropolitan area with this much hotel
stock could justify any pick at all. The report also rejects the nearest-thing
reasoning explicitly: a West Bank airport-strip chain box would be closer and
would make the trip worse.

**The published 14.2-mile French Quarter figure and the basecamp's 13.86–13.94
figures do not conflict**, and both publish. The first routes to the Quarter as
a place (verdicts §7, Decatur Street); the others route to four specific street
addresses. The report says so itself — "the difference is which point in the
Quarter you route to" — and the guide keeps them in separate sentences with
their own endpoints named, rather than averaging them into one number that
belongs to neither.

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

### Section 4 — `Day two: Timberlane Golf & Recreation`

Every row rests on finder §7. **No verdict covers any of it.**

**How the course was arrived at.** An Overpass sweep for every
`leisure=golf_course` within 60 km of TPC Louisiana returned 27 elements, 24 of
them inside the radius; every one was routed with OSRM from the course's own
coordinates and geocoded with the Census coordinates endpoint before any
exclusion. Exactly one candidate routes nearer than the selection, and it is
disposed of on the merits below. **The candidate set is the sweep, not a
ranking** — which is the whole difference between this section and the one it
replaces. None of the method is in the guide; the finding is.

| Published | Rests on |
|---|---|
| "The nearest other publicly accessible course to TPC Louisiana is Timberlane Golf & Recreation, at 700 Lapalco Boulevard in Gretna — 9.0 road miles by OSRM routing between the two clubhouses, along the same named road, Lapalco Boulevard, that carries TPC Louisiana itself." | §7.2. **The road name is the confirmation, not decoration**: OSRM named *both* waypoints "Lapalco Boulevard", which is how each endpoint is known to have snapped to the intended point. Two figures were measured — 9.0 clubhouse to clubhouse, 9.1 to the OSM polygon centroid — and the guide publishes the clubhouse-to-clubhouse one, which is the one the road-name check anchors. |
| The Census run: Jefferson Parish, Incorporated Place "Gretna city", the same parish as TPC Louisiana | §7.3, and §1 above for why the string is published untidied. |
| "Although open to the public, golf memberships also provide several perks and privileges that make Timberlane unique." | §7.4 — verbatim, the operator's own course page. **This is the access sentence, and it is quoted rather than paraphrased** because a paraphrase would have to choose between "public" and "members-first" and the operator's own sentence carries both without resolving them. |
| "Please note Non-Members must book through the TGR website which has no booking fee." | §7.4 — verbatim, the operator's own booking page. A published non-member route, in the operator's words. |
| "The booking system agrees with the words: Timberlane's foreUP tee sheet carries a booking class the operator itself names 'Timberlane 18 Hole Public Tee Times,' left unprotected by any password" | §7.4 — booking class 4049, `online_booking_protected: 0`, sitting on the same tee sheet as two member classes that are password-gated at 1. **The contrast is the evidence**: the operator's own system distinguishes protected from open classes, and this one is open. |
| "an unauthenticated query of that class for Thursday, September 10, 2026 returned 68 bookable eighteen-hole slots, most of them with all four spots open" | §7.4 — the query executed against foreUP's own tee-times API, every slot stamped `"course_name":"Timberlane Golf & Recreation"`, `"booking_class_id":4049`, `"teesheet_holes":18`. **Behaviour, not an adjective.** No booking was completed. |
| "an 18-hole, par-72 Robert Trent Jones, Sr. layout that opened in 1959 as… 'the Westbank's first private country club'; the Timberlane Neighborhood Improvement and Beautification District assumed ownership in 2018, and the facility now 'operates as Timberlane Golf and Recreation.'" | §7.4 — the operator's own history text. **The ownership sentence is why the access sentence is credible**: it explains how a course that opened as a private club came to publish non-member tee times, which is the question a reader would otherwise be left holding. |
| The published hours, and "with the course closed on Mondays — a closure the tee sheet confirms, since the same unauthenticated query run for Monday, September 14, 2026 returned no bookable times at all." | §7.5 — the operator's Hours of Operation page for the hours, and the same foreUP query returning an empty array for the Monday against 68 for the Thursday. **A stated closure checked against the system that would have to honour it.** |
| "No dated rate card exists anywhere on the operator's site, only live booking quotes that vary from slot to slot, so no green fee is published here." | §7.5 — see O13 for the quotes themselves, which exist and are deliberately not published. |
| "The operator publishes no conditions calendar, aeration schedule or news page either, so openness beyond that weekly Monday closure is unverified rather than established." | §7.5 — the Course Conditions page carries only a weather widget with no conditions text, the Events calendar renders with a heading and no entries, and there is no news page. An absence reported as an absence. The eight-page raw-HTML grep for `clos`, `aerat`, `renovat`, `flood`, `maint`, `hurricane`, `storm`, `overseed` and `punch` found **no disabled closure notice inside an HTML comment** and no live one either; the only in-comment matches were an SVG `maskClose` element id. |
| "The Country Club At Golden Nugget in Lake Charles, fifth on the same Golf Digest list, is a public casino-resort course at the far end of the state: OSRM puts it 212.3 road miles from TPC Louisiana, against Timberlane's 9.0, so it is not a same-trip second round." | §7.7 for the mileage; verdicts §1 / Verdict 22 for the rank and label. **The guide states its own correction in one sentence**, without a date and without narrating the audit. A reader who wonders why a #5-ranked public course is not the second course gets the answer where the question occurs. |

#### Section 4a — the wrong-course guard, and the one nearer candidate

**The domain was probed, then confirmed, never trusted for being plausible.**
`timberlanecc.com`, the domain OSM still tags on this course, is dead —
Cloudflare Error 1000, "DNS points to prohibited IP", and Wayback shows it
serving only redirects since 2021. `playtimberlane.com` was reached by probe and
then confirmed by its own footer, which prints "700 Lapalco Blvd. Gretna, LA
70056" and the clubhouse number on every page quoted. **Every page was checked
at the footer before anything was taken from it.** This is the same guard that
§0's ezLinks lesson turns on, applied in the other direction: there, a 403 on
one host was not a fact about the resource; here, a name matching on one domain
is not a fact about the operator.

**Colonial Golf Course routes 8.8 miles — 0.2 nearer than the selection — and
had to be disposed of on the merits rather than skipped.** It closed. Wikipedia,
fetched through the MediaWiki API, states verbatim that it "closed in early
2012". The OSM object carries no website, no phone and no address, only a GNIS
feature id, and its full history shows version 1, created 2013-04-02 and never
edited since — a GNIS import of a feature that had shut the year before. An OSM
map pull over the site returns 953 buildings, three residential landuse
polygons, **not one golf-related tag of any kind**, and two named streets
crossing the old outline. GolfLink's Harahan page states "There are 0 golf
courses in Harahan, Louisiana." **It is disqualified because it was established
not to be a publicly accessible golf course, not because a lookup came back
empty** — and its failure promotes nothing; the walk moved to the next nearest.
None of this is in the guide, and none of it should be: the guide's claim is
that Timberlane is the nearest, and this is the work that makes the claim true.

**A sweep gap, reported rather than papered over.** Joseph M. Bartholomew, Sr.
Municipal Golf Course sits inside the radius and was **not returned by the
Overpass sweep** — OSM carries no `leisure=golf_course` object there for the
query to match. It was found while cross-checking a directory listing and routed
separately at 20.7 road miles, far behind the selection, so the gap changes
nothing. The same cross-check surfaced no other course nearer than Timberlane.
Recorded because it is the shape a map sweep is blind to, and because two other
states in this programme were changed by exactly this failure mode.

**Everything below the selection was not access-tested**, and that is the rule
working rather than a corner cut: a farther course cannot displace a nearer one
that clears the bar, and better evidence for a farther course does not beat the
rule either. The line matters here more than anywhere in this state, because the
course it displaces had better *ranking* evidence and worse everything else.

### Section 5 — `New Orleans basecamp`

Every row rests on the basecamp report. **No verdict covers any of it**, and
what it replaces is the two-line section recorded above.

| Published | Rests on |
|---|---|
| The 13.09-to-13.94 band, the 0.85-mile spread, and "so the choice is made on what a visitor gets rather than on mileage" | Basecamp §2 — four OSRM routes from the course's own coordinates to four Census- or OSM-resolved points. The reasoning publishes with the figures because without it the choice of four places out of a metropolitan inventory would be unexplained. |
| Hotel Monteleone: "A French Quarter Classic for a Reason", "A family-owned landmark in the French Quarter", 214 Royal Street, 13.91 miles | Basecamp §3a — the operator's own homepage and its own Carousel Bar page for the printed address. |
| The dated timeline: 1886, Antonio Monteleone, a Sicilian cobbler, buying the Hotel Victor at Iberville and Royal; three storeys to five in 1896 and renamed the Commercial Hotel; a "massive overhaul" in 1908 | Basecamp §3a — the operator's own Our Story timeline, published as absolute dates with no offset from any present. |
| National Literary Landmark of the American Library Association; Historic Hotels of America; "from Tennessee Williams to Truman Capote, our walls have served as a muse for the world's greatest storytellers" | Basecamp §3a — verbatim. **Two of these are third-party designations the operator claims about itself**, which is ordinarily the shape this corpus refuses; they publish because the guide attributes them as the hotel's own statement rather than as a verified award, and because a landmark designation is a fact about a building rather than a competitive ranking of the kind O7's rule exists to stop. |
| The Carousel Bar & Lounge, "started spinning in 1949 and hasn't stopped since", live music seven nights a week; Criollo; the Acqua Bella poolside bar; a heated rooftop pool open year-round; Spa Aria; a 24/7 fitness center | Basecamp §3a — the operator's own amenities and dining pages. See O12 for the one clause of the Carousel quotation that could not publish. |
| "The hotel advertises percentage offers rather than nightly rates, so no room rate is published here." | Basecamp §3a — three such offers are quoted in the report and no nightly rate appears anywhere. The absence publishes with its reason, in the same shape §3's booking-window and fee absences use. |
| The Roosevelt New Orleans, A Waldorf Astoria Hotel: "a beacon of New Orleans Hospitality", "displaying over 130 years of grandeur", "both an elegant time capsule and an architectural marvel", Roosevelt Way, CBD, 13.94 miles | Basecamp §3b — verbatim from the operator's own site, which is the property's own domain rather than the Hilton-hosted brand page. |
| The Sazerac Bar as a "restored landmark" that "has kept the cocktails and conversations flowing for decades"; the Fountain Lounge; Teddy's Café in the Grand Lobby; the Rooftop at the Roosevelt; the Waldorf Astoria Spa | Basecamp §3b. |
| "No street number is given for it here: the operator's own contact page was not confirmed for one, and the coordinate behind the distance above is OpenStreetMap's." | Basecamp §3b and §5 — the Census locations service returns no match for the street number, and the report is explicit that "anyone publishing a street address for this record should take it from the operator's own contact page, not from mine." **The guide publishes the gap rather than borrowing the number from a third party**, and says which coordinate the mileage rests on so the figure can be checked. |
| Galatoire's: the history page's own heading, Jean Galatoire from the French village of Pardies, 1905, five generations, the same address; "anchored in the French Creole tradition"; "brimming with bountiful seafood from the Gulf" | Basecamp §4a — verbatim. **This is what O11 said could not be published.** |
| The 2009 ownership partnership — Jean Galatoire's descendants with Todd Trosclair and John Georges, Melvin Rodrigue as CEO | Basecamp §4a — the operator's own words. |
| "closed Monday; Tuesday to Saturday, 11:30 a.m. to 9 p.m.; Sunday, 12 p.m. to 9 p.m." | Basecamp §4a — verbatim from the operator's events page. **The Monday closure is the one operational fact a weekend visitor most needs, and the record it replaces omitted it.** |
| Cochon, 930 Tchoupitoulas Street, Warehouse District, 13.09 miles, "the shortest of the four routes" | Basecamp §4b — and the report's reason for the figure mattering: the Warehouse District is on the river side of downtown, the first thing a golfer reaches coming off the Crescent City Connection. |
| Donald Link and Stephen Stryjewski, "the traditional Cajun Southern dishes he grew up with", "with locally sourced pork, fresh produce and seafood", "a rustic, yet contemporary interior of a renovated New Orleans warehouse" | Basecamp §4b — verbatim. |
| "Dine-In Reservations \| Walk-Ins Welcome \| Private Dining"; space held at the bar, the chef's counter and, weather permitting, the patio; reservations through Resy | Basecamp §4b — the operator's own header and reservations block. |
| "Published hours are daily, 11 a.m. to 10 p.m., which covers the Monday the Galatoire's dining room is closed." | Basecamp §4b for the hours; §4a for the closure. **The clause joining them is the guide's own, and it is the reason the fourth record exists**: the report's stated case for a second dining option is that the first is a jacket-and-ritual institution shut on Mondays and a golf party wants a second answer that takes walk-ins after a late round. |
| "Both pubs publish happy-hour price lists, and neither carries a dated qualifier from its operator, so no drink or food price is published in this guide." | Basecamp §3a, §3b, §4b — prices were read and rejected under the price rule rather than missed, and the guide states the rejection. |

**Trading status rests on dated operator evidence for all four, and none of it
publishes as a trading claim.** The Carousel Bar's named, dated live
entertainment calendar; Galatoire's newsroom, whose most recent item is dated
April 2026 and datelined March 2026; Cochon's live Resy flow and published daily
hours; the Roosevelt's live reservations and spa programme. Per
`Ethos.Seeds.DataGuide`'s moduledoc, `status: "open"` is the absence of a closed
claim, not an assertion of current trading, and no sentence in the guide says
any of the four is serving this week.

### FAQ

Six questions. The gate requires one matching `play|tee time|tee times|book`;
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
  ranked above it and Golden Nugget at fifth, with its designer and its 18-hole
  par-72 layout. **This is now the only FAQ answer that describes Golden Nugget
  as a course**, and it describes it in the terms Verdict 22 confirms, not in
  the snapshot-sourced rates and yardage the retired place record carried
  (O14).
* "Which course should I play on day two?" — **new.** Timberlane, from finder
  §7: the address, the 9.0-mile figure, the shared parish, both operator
  quotations, the named unprotected booking class and its 68 returned slots, the
  designer and opening year, the Monday closure, the absence of a rate card, and
  Golden Nugget's 212.3 miles as the reason it is not the answer.

---

## 3. Places, against the verdicts they rest on

Six places. Two are `golf-course` — the gate's maximum — and the second one
changed after publication, replaced in place. Two are `hotel` and two are
`restaurant`, where the file previously carried one of each.

| slug | kind | rests on |
|---|---|---|
| `tpc-louisiana` | `golf-course` | verdicts §1, §2, §3, §7 |
| `timberlane-golf-and-recreation-gretna` | `golf-course` | **Finder §7 only — no verdict.** §7.2 for the 9.0 miles and the shared road name; §7.3 for the parish and the Incorporated Place; §7.4 for both operator quotations, the ownership history, the designer and opening year, the named unprotected booking class and the 68 returned slots; §7.5 for the hours, the tee-sheet-confirmed Monday closure, the absent rate card and the unverified openness beyond it. |
| `hotel-monteleone-new-orleans` | `hotel` | **Basecamp §3a — no verdict.** Previously a twenty-nine-word record resting on verdicts §7; now the operator's own timeline, designations, on-site venues, mileage and price absence. |
| `galatoires-new-orleans` | `restaurant` | **Basecamp §4a — no verdict.** Previously a seventeen-word record that was an address; now the founding, the ownership, the menu tradition, the published hours and the Monday closure. |
| `the-roosevelt-new-orleans` | `hotel` | **Basecamp §3b — no verdict.** New with the correction. |
| `cochon-new-orleans` | `restaurant` | **Basecamp §4b — no verdict.** New with the correction. |

**What was lost when Golden Nugget lost its place record, and why it is not a
loss.** Verdict 22 was this file's proudest correction: the finder reported that
no Wayback snapshot existed for `goldennugget.com/lake-charles`, and the
verifier found the availability API **does** return one, fetched the operator's
own golf page from a snapshot, and published from it — designer, par-72, 18
holes, 7,000 yards, and four rate tiers ($159 general, $129 hotel guests, $79
juniors, $89 twilight). All of that was sourced and honest.

**It was also the only course in this file whose access was never tested against
its own operator.** Finder §7.7 preserves the limitation in as many words:
`goldennuggetlc.com` 301-redirects to a page that returns 403 to every live
request, so the course was sourced through Golf Digest and a snapshot, never
through the operator speaking now, and **its public-access claim was never
tested against the operator's own words or its own booking system** — the
standard the ranked course meets through §0's executed ezLinks API and the
standard the replacement meets through §7.4's executed foreUP query. §7.7 adds
the observation that matters most: "a casino-property course is exactly where an
'access via host or resort guest' gate tends to hide." Had it survived the
distance test it would still have needed that work.

So the record that replaced it trades snapshot-dated rate tiers for a live,
unauthenticated tee sheet, and a 212.3-mile drive for a 9.0-mile one. **The
rank-selected course had the better ranking and the weaker evidence**, which is
the pattern the audit was looking for.

Golden Nugget's rank, label, town, designer and 18-hole par-72 layout still
publish, in the intro and in the "What else is on Golf Digest's Louisiana list?"
answer, all from Verdict 22 and verdicts §1. The rates, the yardage and the
hours do not — see O14 and the retained O7.

**No `address` field on any place.** Required fields — slug, name, kind, town,
state, county, summary — are present and sourced; street addresses live in
the prose and in the summaries (TPC Louisiana, Timberlane, Hotel Monteleone,
Galatoire's, Cochon) rather than in a structured field no schema here requires.
The Roosevelt has no street number in either place, which is the point of O15.

**`status: "open"` on all six is not a trading claim**, per
`Ethos.Seeds.DataGuide`'s moduledoc — it is the absence of a closed claim, and
the guide's prose makes no present-tense trading assertion about any place
beyond what its own sourced pages state.

Six entries, one per place, all `place_slug` values resolving inside this
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
course, so they are omitted rather than hedged. **This stands, and the
correction has widened it**: with the place record gone, the snapshot-sourced
rates and yardage go with the hours — see O14.

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

**O11 — a description of Galatoire's beyond its address. *Reversed by the
basecamp pass.* Kept as the record of a gap that was real and got filled.**

*As it stood:* the verdicts file confirms Hotel Monteleone's self-description
verbatim but does not separately re-quote Galatoire's beyond the address the
finder gave (finder §6). No verdict item independently restates a description
for it, so none is invented; the address alone publishes.

*What happened to it:* the reasoning was right and the conclusion was
provisional. **A verdict's silence about a business is not evidence about the
business** — it is evidence that nobody had fetched its pages. The basecamp pass
fetched them, and the record now carries the operator's own founding account,
its 2009 ownership partnership, its menu tradition and its published dining-room
hours. **The hours are the part that mattered**: the dining room is closed on
Mondays, which is the single operational fact a weekend visitor most needs, and
the seventeen-word record omitted it entirely while being scrupulously correct
about everything it did say. Cochon was added in the same pass specifically to
cover that Monday. The lesson is the mirror of §0's: "no verdict says so" is a
statement about the research done, not about the world, and the fix in both
cases was to go and look.

**O12 — any drive-time duration, for any leg.** No verdict and no research file
in this state supplies one, and the gate bans them outright regardless. Every
distance in the file — 14.2 and 15.0 miles from the ranked course, 9.0 to
Timberlane, 212.3 to Golden Nugget, and the four basecamp figures from 13.09 to
13.94 — is an OSRM road mileage with a named endpoint, with no duration
alongside it.

### Added with the corrections

**O13 — Timberlane's live booking quotes, and its annual-pass prices.** §7.5
records both and publishes neither, and the guide says so in its own sentence.
The foreUP public class returned `"green_fee":48` on 51 of the 68 slots and
`"green_fee":40` on the later 17, with `"cart_fee_18_hole":24` itemised and a
9.75% green-fee tax rate — **booking-system quotes for one queried date, not an
operator-dated rate card**, and §7.5 is explicit that they "must not be
presented as a standing published rate." The operator's own annual passes
($999, $249, $99) carry no dated qualifier and are excluded by the same price
rule that governs the ranked course's three annual products, which publish only
because they are marked as read from the page in September 2026. The guide's
sentence — "only live booking quotes that vary from slot to slot, so no green fee
is published here" — describes the evidence accurately without quoting a figure
that would read as a rate.

**O14 — Golden Nugget's snapshot-sourced rates and yardage.** $159 general,
$129 hotel guests, $79 juniors, $89 twilight, and 7,000 yards, all from the
Wayback capture Verdict 22 recovered. They left with the place record. The
retained facts — rank, label, town, designer, 18 holes, par 72 — are the ones
that come from Golf Digest's own live-fetched ranking data rather than from a
snapshot of a page that 403s every live request, so what publishes about that
course is now uniformly sourced instead of mixed. **The rates were never wrong;
they were dated to a capture and carried in a record whose subject the guide no
longer sends anyone to.**

**O15 — a street number for The Roosevelt New Orleans.** The basecamp report
found the Census locations service returns no match for the candidate number and
that the coordinate behind the mileage is OSM's, and instructs that any published
address be taken from the operator's own contact page rather than from the
report. The operator's contact page was not confirmed for one. **The guide
publishes the absence and names the coordinate source in the same sentence**, so
the 13.94-mile figure can be checked against the point it was measured from. It
is the only place in this file whose location is stated without a street number,
and it says why.

**O16 — the Roosevelt's stale homepage banner.** Its top banner advertises "the
76th Annual Stormin' of the Sazerac on September 26, 2025", a date that has
passed. The basecamp report records it rather than resolving it, and reads it as
marketing nobody swapped out rather than a closure signal — the property is
plainly trading on live reservations, an operating spa and pool programme and a
brand property page. Nothing about it publishes. Recorded here because a
verifier who re-fetches that page will see it and should not have to work out
whether it was missed.

**O17 — "Just steps away from the French Quarter."** The Roosevelt's own opening
line, and **the one operator quotation in this state that the prose gate would
have caught.** "steps away from" matches the vague-proximity pattern outright.
The basecamp report flagged it in advance — "Quote it or drop it; do not
paraphrase it into the summary" — and it is dropped. What publishes instead is
the road mileage and the named district, which is what the pattern exists to
force.

**O18 — "Completing a rotation every 15 minutes."** The middle clause of the
Carousel Bar quotation. It is a rotation interval, not a journey duration, and
it is unpublishable in this corpus for exactly the reason `Ethos.GolfProse`'s
own comment above pattern 7 records for Utah's tee-time interval: minutes are
banned unconditionally in both numeral and word form, deliberately, because
making the word form conditional is what produced a respelling evasion once
already. The clause is **dropped, not respelled** — per that same precedent —
and the two clauses around it publish unchanged. The cost is one ornamental
detail about a bar.

**O19 — the Carousel Bar's dated live-entertainment calendar and its
refurbishment notice.** Six named acts with dates, a dated Jazz Brunch, a daily
10:00 AM Carousel Bar Experience, and an operator-written notice that the bar
"is undergoing refurbishments from August 3-23rd but the Lounge will be open."
All of it is what establishes the hotel is trading, and none of it publishes:
a named act on a named night is the most perishable content in this file, and
the refurbishment window carries no year in the operator's own wording. The
guide publishes the durable half of the same page — that the bar revolves, that
it has live music seven nights a week — and makes no trading claim at all.

**O20 — the Monteleone's "$1 per night."** A dated 1896 figure inside the
operator's own timeline. The basecamp report notes it is safe only if presented
as that. It is not published: a nineteenth-century room rate in a guide that
declines to publish this century's would invite exactly the misreading the price
rule exists to prevent.

**O21 — the Roosevelt's room tiers, and the rest of both hotels' amenity
inventories.** Standard, Deluxe, Superior, King Suite and Luxury Suite are named
in the place summary and not in the section prose; the Monteleone's Iberville
Tower and Literary Suites, its barber shop, valet parking, pet package and
27,000 square feet of meeting space are in the report and in neither. An
amenities list is not a reason to sleep somewhere, and the section is already
carrying two hotels.

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

**Re-run after the day-two correction and the basecamp expansion.** The
corrected `louisiana.json` was checked with `Ethos.GolfProse.banned_phrases/1`
over every string in its published structure and returned `[]`, with the
allowlist still `[]`. The two rewritten sections roughly doubled the file's
prose and brought in two classes of string this state had not carried —
opening hours, and hotel marketing copy — so the new phrasings were checked one
by one.

**The one that would have fired, and did not ship:** the Roosevelt's own "Just
steps away from the French Quarter" (O17). This is the first operator quotation
in this state to hit a pattern, and it is a reminder that the proximity family
exists mainly to catch *hotel copy*, which is written to sound near rather than
to be measured. The guide replaces it with 13.94 road miles and a named
district.

**The one that had to be dropped rather than rewritten:** "Completing a rotation
every 15 minutes" (O18), which fires pattern 1 unconditionally. Dropping it
rather than respelling it follows Utah's O15 precedent and this module's own
comment above pattern 7; a respelled "fifteen minutes" fires pattern 7 too, and
would be an evasion even if it did not.

**Checked and clean:**

* **"9.0 road miles"**, **"212.3 road miles"**, **"13.09"** through **"13.94"**,
  **"a spread of 0.85 miles"** — mileages and a mileage difference, no direction
  word, no duration.
* **"7:00 a.m. to 8:00 p.m."**, **"6:30 a.m. to 7:00 p.m."**, **"11:30 a.m. to
  9 p.m."**, **"11 a.m. to 10 p.m."**, **"12 p.m. to 9 p.m."** — clock times.
  Pattern 1 bans a digit followed by "minute" or "minutes"; a clock time carries
  neither, and no opening hour here is expressed as a duration.
* **"a 24/7 fitness center"**, **"live music seven nights a week"**, **"open
  year-round"** — no digit-plus-hours travel construction, no journey, nothing
  the hour patterns anchor on. Pattern 21 requires a travel word after "hours"
  and there is no "hours" in any of them.
* **"closed on Mondays"**, **"closed Monday"** — a recurring weekly closure. The
  self-dating patterns ban "next Monday" and "last week", not a standing
  schedule, for the reason the module records beside pattern 28.
* **"opened in 1959"**, **"since 1886"**, **"in 1896"**, **"in 1908"**,
  **"since 1905"**, **"in 2009"**, **"in 2018"**, **"Thursday, September 10,
  2026"**, **"Monday, September 14, 2026"** — absolute dates, which the
  self-dating patterns are explicitly built to let through.
* **"the shortest of the four routes"** — a comparison between four stated
  mileages that appear in the same paragraph, not a vague proximity claim. The
  figures are what carry it; the phrase only orders them.

One construction was watched closely and passes: the day-two section's own
correction clause, "it was this guide's second course on rank rather than on
distance" in the sibling states, appears here as "so it is not a same-trip second
round," attached to a stated mileage. It carries no date, no offset from an
unstated now, and no claim that stops being true.

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
  pages, are marked "read from the page in September 2026." **No price appears
  for the day-two course or for any of the four basecamp places**, and in every
  case the guide states the absence and its reason rather than leaving a silent
  gap (O13, O17's sibling clauses, and the two hotels' own sentences).
* **No 8 September 2026 closure claim**, per the overriding programme-level
  instruction (O1) — despite the per-state verdict calling it confirmed.
* **No trading claim for Golden Nugget's hours or for any of the four New
  Orleans places** beyond what each source states about itself, even though the
  dated evidence behind all four is the strongest in this state.
* **No access claim for any course that rests on a ranking's label alone.** Both
  `golf-course` places carry an executed, unauthenticated booking-system query
  behind their access sentences — ezLinks for the ranked course, foreUP for the
  day-two course. The course that could not meet that standard is the one the
  correction displaced.
* **No second course chosen by ranking position.** The one that was is named in
  the guide's own prose with the mileage that displaced it, and the correction is
  recorded at the top of this file rather than written out of it.
* **`priv/seed_data/golf_courses_roster.json` was not touched**, per the
  brief's explicit instruction; this file records no roster row.
