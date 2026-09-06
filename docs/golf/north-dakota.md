# North Dakota — The Minot Country Club: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/north-dakota.json`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/north-dakota-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **44
   confirmed · 8 refuted · 4 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/north-dakota-finder.md` —
   the finder. Context only **for claims the verdicts file adjudicated**. It
   carries several of the refuted and uncertain items (a fabricated quotation, a
   wrong panel-count range, a wrong airport citation for a page-404 that isn't
   one); where the two disagree, the verdicts file wins and its text, not the
   finder's, ships.
3. The same finder's **"Second publicly accessible course — Apple Grove Golf
   Course" section, which is not context and which no verdict covers.** It was
   rewritten from scratch after publication, under a measured radius sweep, and
   it is the only evidence behind the day-two course this guide now carries. It
   also **re-measures two distances the verdicts file supplied**, and where those
   two disagree the finder wins, for the reason given in Section 1 below. The
   ordering above therefore inverts for the day-two course and for those two
   figures, and every sentence resting on the finder is marked as doing so.

**The governing rule:** a verdict vouches only for what its own text restates,
not for every clause of the sentence the finder wrote around it.

**6 places, 6 entries, 1 guide, 5 sections, 4 FAQ answers, 0 photos.**

**Correction of record, 6 September 2026.** The day-two course published on
5 September 2026 was **Hawktree Golf Club**, Bismarck, selected at Golf Digest
rank #2 with its "Public" label. The spec's rule is the **nearest** other
publicly accessible course, not the highest-ranked other one, and a corpus-wide
audit (`second-course-audit.md`) named this state as the clearest instance of
the failure mode: the verdicts file had computed three candidate distances and
the roster took the one the ranking favoured, passing over The Links of North
Dakota — carrying the same "Public" label, and nearer — recorded in this state's
own files. `north-dakota.json` now carries **Apple Grove Golf Course, Minot —
3.6 road miles**, in the same city and the same county as the ranked course,
against Hawktree's **108.0**. Hawktree is not withdrawn: it keeps its rank, its
label and its place in the caveat Golf Digest itself wrote, and the guide names
it in prose as the farther course it is. Two figures moved with the correction —
see Section 1. The passages below that documented Hawktree as the day-two course
have been rewritten to document Apple Grove; this paragraph is the record that
they once did.

---

## 0. This is the hardest access story in the programme, and it stays unreconciled

Golf Digest's 2025-'26 North Dakota ranking places **The Minot Country Club**
first among six ranked courses, with the literal access label **"Public."**
Four independent reading methods in the verdicts file (rendered WebFetch, raw
`o-InfoBox` HTML pairing, and the embedded JSON `rank` integer) agree on this,
and the verdicts file records the naive-parse trap that would otherwise
mis-pair labels to the wrong course. **Confirmed**, §1 of the verdicts file.

The club's own site, fetched across 16 pages, never once uses the words
"public," "green fee," "guest fee," "non-member," "daily fee," or "open to
the." It calls itself "a private club" in its own copy, routes its
"TEE TIMES" navigation to a member login, and describes its reciprocal-play
program as included in membership. **Confirmed**, §2 Half B of the verdicts
file. **No published route exists for a non-member to book.** Per the
verdicts file's own instruction: "Do not state that a visitor can play, and do
not state that a visitor cannot — neither is sourced. State only what the club
publishes." This guide does exactly that in every place the access question is
raised — the "Getting there" section is silent on it, and the two FAQ items and
the "Can you actually play it?" section state only what is published, never a
conclusion about whether a visitor personally can or cannot get on the tee
sheet.

**The contradiction is published, not editorialised.** Per the dispatch
instruction, this guide does not frame the "Public" label as meaning something
narrower than it appears to — that framing was tested and rejected earlier in
this programme. The guide instead states both sources' own words side by side
and lets the disagreement stand, exactly as instructed, and does so **twice**:
once in the intro, once in the FAQ item "Golf Digest ranks this course #1 and
calls it 'Public' — so why is there no way to book it?" — satisfying the
set's standing rule that the contradiction appear in both places.

---

## 1. The guide

`slug: north-dakota-golf-guide` · `destination: "Minot, North Dakota"` ·
`state: "North Dakota"` · `county: "Ward County"` · `photos: []`

### Intro

| Published | Verdict |
|---|---|
| "places The Minot Country Club first, labeled 'Public,' in Minot, Ward County" | §1 methods A–D — confirmed; §3 — Ward County confirmed by two independent geocoders |
| "$105 weekend fee and a 'Daily Fee' facility type" | §2 Half A — confirmed. **Precision note honored**: the guide never writes "Public/Daily Fee" as a printed label — the verdicts file is explicit that string appears nowhere on the page and is a composite of two JSON fields. The guide always states the two separately. |
| "'a private club' in its own copy" | §2 Half B — confirmed verbatim, from `/clubhouse/`: "any private club in the area" |
| "'TEE TIMES' navigation link to a member login page" | §2 Half B — confirmed, WebFetch and raw-HTML anchor extraction |
| "OpenRounds... 'included in your membership' and giving members access to 'other private clubs nationwide'" | §2 Half B — confirmed verbatim from `/open-rounds/` |
| "No page on minotcountryclub.com publishes a green fee, a public tee sheet, or a guest-without-member policy" | §2, "Can an ordinary non-member book a tee time?" — confirmed |
| "the club's own phone number, (701) 852-3591" | §2 Half B, `/membership/` — confirmed verbatim |
| "'Three of the top-six ranked courses in North Dakota are open to the public'" | §1, "three things... point away from Minot," item 2 — confirmed verbatim |
| "four of its six entries carry the 'Public' label — Minot is the fourth" | §1, same item — confirmed; the ranking table in §1 shows Links, Bully Pulpit, Hawktree and Minot all `Public` |
| "a 3.6 rating from just two panelists, tied for both measures with the lowest-rated, least-evaluated entries" | §1, item 3, and §4's `ratingsCount` table (Links 6, Fargo 2, Bully Pulpit 7, Oxbow 3, Hawktree 8, Minot 2) — confirmed. Fargo also has 2 evaluations, so "tied... least-evaluated" is accurate; the joint-lowest rating is stated as shared with "the two Private-labeled clubs" without naming a false precise number for them, since no source gives Fargo's or Oxbow's individual rating figure — only that Minot's 3.6 is "joint-lowest... from just 2 panelists." |
| the caveat, verbatim | §4 — confirmed verbatim, found at char offset 235,532 of the raw Wayback HTML. Hawktree, Bully Pulpit and The Links of North Dakota are named inside this quotation and nowhere else in the intro — the intro no longer describes any of the three in its own voice. |
| "this guide points to Apple Grove Golf Course, a 9-hole course 3.6 road miles from the club, in the same city and the same county, whose own booking platform reports the club as taking public bookings" | **Finder, second-course section** — no verdict. The 3.6 figure is OSRM driving, origin fixed at the club's own Golf Digest coordinates; "same county" is the Census geocoder's `Ward County` for both points; "same city" rests on the operator's own address and self-description, **not** on the Census place — see Section 4b. `supportsPublic: true` is the Whoosh booking platform's own flag, returned to an unauthenticated query. |

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`, no trailing mode. **No trip
duration appears anywhere in this section or this file** — every figure below
is a road-mileage figure, confirmed by the verdicts file as computed via
Nominatim + OSRM, in metres, and never converted to a duration.

| Published | Verdict |
|---|---|
| "Minot International Airport (MOT) is 5.6 road miles from The Minot Country Club" | §5 Gap 1 — confirmed: 8,995 m = 5.6 miles. **This closes the finder's stated gap**; the finder's "getting there" section explicitly could not source this, and the verifier closed it without any search budget. |
| "at 1912 Valley Bluffs Dr in Minot, Ward County" | §3 — confirmed by Nominatim's reverse-geocode of that exact address, which itself resolved to "Minot Country Club, 1912, Valley Bluffs Drive, Minot, Ward County, North Dakota, 58701" |
| "Apple Grove Golf Course is 3.6 miles away" | **Finder, second-course section** — OSRM driving profile, from 48.19624427 / -101.26179525 to 48.210937 / -101.236380, the destination point taken from the Census address geocoder's exact match on `3910 20TH AVE SE, MINOT, ND, 58701` |
| "Souris Valley Golf Course is 5.4 miles away" | **Finder** — same origin, address-level geocode. Published because the guide names Souris Valley as the nearest eighteen-hole alternative; it has no place record. |
| "Hawktree Golf Club in Bismarck is 108.0 miles away" | **Finder**, superseding §5 Gap 1's 105.2 — see the note below |
| "The Links of North Dakota in Ray is 99.4 miles away" | **Finder**, superseding §5 Gap 1's 88.8 — see the note below |
| "Bismarck Municipal Airport (BIS) is 113.6 road miles" | §5 Gap 1 — confirmed: 182,784 m = 113.6 mi |
| "Hector International Airport in Fargo (FAR) is 269.6 road miles" | §5 Gap 1 — confirmed: 433,922 m = 269.6 mi |
| "each figure measured by OSRM's driving profile from the club's own coordinates" | The guide states its own method for the course-to-course figures, because two of them changed. Airport figures keep §5 Gap 1's metres-to-miles conversions unchanged. |

**Two published figures changed, and the lower-authority file won.** §5 Gap 1
recorded **105.2** miles to Hawktree and **88.8** to The Links of North Dakota.
The finder's correction pass re-measured both from anchored endpoints — the OSM
course object for Hawktree, the Census exact address match
`5153 109TH AVE NW, RAY, ND, 58849` for the Links — and got **108.0** and
**99.4**. The verdicts file **did not record its endpoints**, so its figures
cannot be reproduced, checked, or repaired; the finder's state an origin, a
destination and a router for every row. The standing rule that the verdicts file
wins presumes both files are making the same claim about the same points, and
here that presumption fails: an unreproducible number is not a competing verdict,
it is an unverifiable one. The reproducible pair publishes. **Neither the change
nor the reason for it is in the guide** — a reader needs the mileage, not the
provenance dispute — and this paragraph is where that decision is recorded.
Either figure leaves the conclusion untouched: both courses sit far beyond the
selected course's 3.6 miles, and the audit's central point stands, that a course
already written down in this state's own verdicts file as nearer than the
rostered one was passed over for rank.

**Omitted: Bully Pulpit's course-to-course distance.** §5 flagged its own figure
(218.3 mi) as approximate — geocoded to the Medora town centre because Nominatim
returned no result for the street address — and explicitly offered "or omit" as
an option. The finder's correction pass re-measured it from an anchored point at
**218.5**. Neither figure publishes: Bully Pulpit is not an anchor course in this
file, is named only inside Golf Digest's own caveat quotation, and is the
farthest candidate measured in the state. Recording both figures here is cheaper
than publishing either with the caveat sentence each would need.

### Section 2 — `The Minot Country Club`

| Published | Verdict |
|---|---|
| ranked first, label "Public," facility type "Daily Fee," $105 weekend fee "as of the ranking data's own November 14, 2025 update" | §2 Half A — confirmed. `updatedAt: 1763149506000` ≈ 14 Nov 2025. **Price rule honored**: the $105 figure ships with the source's own date attached, per the prose rule that prices publish only with the source's own date. |
| "multiple tees ranging from 4,485 to 6,870 yards" | §7 item 6 — the tee-SET COUNT is refuted (the club's own pages disagree, 4 vs. 7 sets), but the verdict explicitly instructs: "Publish the yardage range only, or nothing." The guide publishes the yardage range and deliberately says "multiple tees" rather than any number. |
| panel counts range two to eight; Minot's rank rests on two, tied with Fargo Country Club for fewest | §4 — confirmed correction. **The finder's "2–6" range is REFUTED and not published**; the true range, 2–8, ships instead, exactly as the verdicts file's correction states. |
| the caveat, verbatim, repeated here | §4 — confirmed. Published a second time because this section restates the #1 ranking, per the instruction that the caveat accompany the ranking wherever restated. |
| "No source available for this guide explains why Minot ranks first despite the lowest panel score and its absence from that same sentence" | §1 note and §7 item 8 — confirmed as an explicit non-claim: "Do not publish any causal explanation of why Minot ranks first." |

### Section 3 — `Can you actually play it?`

This section states only what each source publishes, in each source's own
words, per the verdicts file's closing instruction in §8.

| Published | Verdict |
|---|---|
| "'a private club' in its own copy — on its clubhouse page: 'one of the most extensive and varied social calendars of any private club in the area'" | §2 Half B — confirmed verbatim |
| "'TEE TIMES' navigation link sits under a 'MEMBERS PAGE' menu and opens a member login" | §2 Half B — confirmed |
| the OpenRounds quotation, verbatim | §2 Half B — confirmed verbatim from `/open-rounds/` |
| "'contact our Membership Director at (701) 852-3591'" | §2 Half B — confirmed verbatim from `/membership/` |
| "no season... is published for the course anywhere on the club's own site" | §5 Gap 2 — confirmed as a real, sourced gap. **No season is stated, and no winter closure is inferred**, exactly as instructed. |
| "The only sourced avenue for a visitor is to call the club directly at (701) 852-3591 and ask." | §8 "Plain statement" — this is close to verbatim from the verdicts file's own closing recommendation: "The guide should say exactly that." |

### Section 4 — `The practical round: Apple Grove Golf Course`

Every row in this section rests on the finder's rewritten second-course section.
**No verdict covers any of it**, and that is stated once here rather than
repeated on each line.

The section's own first sentence carries the selection rule the correction
enforces — "Apple Grove Golf Course is the nearest other publicly accessible
course to The Minot Country Club" — and the three facts that make it checkable
follow immediately: the mileage, the shared county, and the operator's own
words. What the guide does **not** do is recite the sweep; the method lives in
this file, and Section 4a below carries it.

| Published | Rests on |
|---|---|
| "the nearest other publicly accessible course to The Minot Country Club: 3.6 road miles, in the same city and in the same county, Ward County" | Finder — OSRM from the club's own coordinates; Census `geographies/coordinates` returning `Ward County` for both points. "Same city" is the operator's, not the Census's — see 4b. |
| "a 9-hole course at 3910 20th Ave SE" | Finder — the operator's own published address, matched exactly by the Census address geocoder. Corroborated at nine holes by NDGA, North Dakota Tourism and the OSM area pull. |
| "Apple Grove Golf Course is a 9-hole golf course located in Southeast Minot. We are proud to be locally owned and operated and strive to provide the best golf experience for all of our visitors." | Finder — verbatim from the operator's own About page. The domain was confirmed to be the right course before anything was quoted: the body carries the course's own name, town and street address. |
| "No membership requirement, no guest-of-member language and no exclusion sentence appears anywhere on applegrovend.com" | Finder — an absence reported as an absence, across five fetched pages. This is the mirror image of the ranked course's problem, and the guide states it the same way: what the operator publishes, and what it does not. |
| "Its Booking & Membership page carries a public 'Book a Tee Time' link and, separately, sells '2026 Early Bird Season Passes' — a pass sold alongside public play, not a gate in front of it" | Finder, including that reading of the pass. A season pass on the same page as a public booking link is not an access gate, and the guide says which it is rather than leaving a reader to guess. |
| "That booking link resolves to the Whoosh platform, whose own API, queried with no account and no authentication, returns supportsPublic: true for the club, records it as Minot, North Dakota, and lists a single department of type GOLF whose only facility is named 'Golf Course.'" | Finder — the GraphQL call and its verbatim response. **Behaviour, not an adjective.** All three clauses do work: `supportsPublic: true` is the platform's own public-booking flag; `city: "Minot", state: "ND"` closes the cross-state same-name risk on the platform's own record rather than on the domain name; and a single `GOLF` department whose only facility is "Golf Course" establishes an outdoor course a round is played on, not a simulator, range or indoor studio. |

#### Section 4a — the sweep that missed, and the directory that found it

This is the state where the standard method failed and the required
cross-check saved it, and the guide publishes that fact rather than hiding it
behind a clean answer.

**The sweep.** Overpass, every `leisure=golf_course` within 60 km of the ranked
course's own coordinates; `overpass-api.de` returned HTTP 429 and
`overpass.kumi.systems` served the query, returning six objects, one of them the
ranked course itself. All candidates were routed with OSRM from a single fixed
origin and geocoded with the Census coordinates endpoint, and a control query at
Minot City Hall returned `Ward County` / `Minot city`, so the empty Incorporated
Place results elsewhere in the table are real absences rather than failed
lookups.

**The sweep did not return the winner.** Apple Grove has **no
`leisure=golf_course` object in OpenStreetMap at all.** The guide publishes this
in its own paragraph, and quantifies it exactly as the finder does: an area pull
within 600 m of the course's geocoded point returns nine mapped holes, nine
fairways, nine greens, twelve tees, bunkers and water hazards — every hole is on
the map — but no course polygon and no name, so a `leisure=golf_course` query
cannot see it. **The map proves the course exists and still cannot find it.**
Jack Hoeven Wee Links is missing from OSM's golf tagging in the same radius, a
second confirmed gap; it is not in the guide because it is both farther (5.0
miles) and gated by exclusion in its operator's own words — "Adults may play the
course as long as they are accompanied by a child 14 or younger" — so an
unaccompanied traveller cannot play it. Per the rule, a candidate failing the
access bar does not promote a farther ranked course; the walk simply continued.

**What found it.** Two non-OSM directories, agreeing with each other: the North
Dakota Golf Association's own course directory, which lists it "Public - 9
Holes", and GolfLink's Minot city page, which counts seven courses in the city.
Both are published in the guide, named as what they are. North Dakota Tourism
carries the operator's own address, "Number of Holes: 9", "Public" and the word
"Seasonal" — also published, also named.

**A third source against the ranked course's label, recorded and not
published.** NDGA — North Dakota's own golf association — labels The Minot
Country Club **"Private."** That is a third independent source siding with the
operator's own copy against Golf Digest's badge, alongside Golf Digest's own
self-contradicting intro. It is not in the guide. The guide already carries the
contradiction twice, in the intro and in the dedicated FAQ answer, in each
source's own words and without editorialising; adding a fourth voice would tilt
a disagreement §0 requires be left standing. Recorded here so the strength of the
disagreement is on the record even though the guide's wording does not change.

**The address discrepancy is published, not reconciled.** The operator gives
3910 20th Ave SE; NDGA's detail page gives 2604 Valley Street. The guide states
the operator's address as the course's address and quotes NDGA's listing with
NDGA's own address attached to it. The telephone number matches exactly across
both, which is what makes them the same course.

#### Section 4b — "the same city," and what the Census actually returned

The guide says Apple Grove is "in the same city and in the same county, Ward
County," and the two halves of that clause do not have the same source.

**The county half is the Census geocoder's**, on both points, and it is the
strong half. **The city half is not.** The Census `geographies/coordinates` call
on Apple Grove's exact address point returned `Counties: Ward County` and
**Incorporated Places: none**, and the finder is explicit that the control query
proves this a real result — the course sits on unincorporated Ward County land
outside the Minot city boundary — with a standing instruction: **do not publish
"Minot city" as its Census place.** The guide does not. What it publishes is the
operator's own "located in Southeast Minot," the operator's own Minot postal
address, and the booking platform's own `city: "Minot"` — three operator-side
sources for a city, none of them a Census place claim. `town: "Minot"` on the
place record is the postal town on the operator's own address, and the trail says
so here rather than letting a structured field imply a boundary result the
geocoder declined to return.

#### Section 4c — the season and the fee, both written as gaps

**Season.** The guide states that the operator publishes "7 Days a Week: Weather
Permitting" and hours of 8am to 6:30pm, that no opening date and no closing date
appears anywhere on its site, that openness on any given date is therefore
unverified, and — in its own sentence — that "this guide does not infer a winter
closure from latitude." That last clause is the finder's own standing
instruction promoted into the published text, and it matters more here than
anywhere else in this corpus: this is the state where the inference would be
easiest to make and hardest to source. The finder's grep of the operator's raw
HTML for `clos`, `aerat`, `renovat`, `flood`, `maint` and `season` matched only
Wix framework noise, and each of the 48 HTML comment blocks per page was checked
for a switched-off closure notice; none carried one, so the stale-notice artefact
this programme has hit elsewhere does not occur here. The contrast the finder
drew is the proof the check works: Wee Links *does* publish "WINTER HOURS
Closed", and Apple Grove does not.

**The season gap now sits on both of this guide's courses**, and the FAQ answer
says so in one sentence: neither Minot course states when its golf year opens or
closes. The rank-selected course that *does* publish a season — Bully Pulpit,
"April – October | Weather Dependent" — is no longer this guide's second course,
so that fact leaves with it. **The correction cost the guide a published season
and gained it a course a reader can reach.** Recorded plainly, because it is the
one respect in which the corrected guide states less than the one it replaced.

**Fee.** The operator publishes no green-fee schedule at all. The guide names
GolfLink's $49 and immediately quotes GolfLink's own disclaimer around it —
"These rates are an estimate of what you might expect to pay at Apple Grove with
a cart. Actual rates may vary" — then states that it is a third party's estimate,
not the operator's rate, and that this guide does not publish it as a fee. The
finder's instruction is that the figure "must not be published as a fee," and
what the guide does is publish the *absence* of a fee with the estimate named as
the thing that is not one. The number appears; the claim does not. Noted here
because the line between those two is exactly the line an author is tempted to
blur, and a reader can see which side this sentence sits on only if the framing
travels with the figure — which, in the guide's own sentence, it does.

**Par and yardage are contested and published as contested.** North Dakota
Tourism gives par 30 and 1,671 yards; GolfLink gives par 29 and 1,538 yards; the
operator publishes no scorecard. The finder's instruction was "publish neither,
or attribute whichever is used." The guide takes the attribution route and names
both sources with their own figures, so a reader sees the disagreement rather
than an arbitrated number.

#### Section 4d — the two courses the section still names, and why neither is the second course

| Published | Rests on |
|---|---|
| "For eighteen holes instead of nine, Souris Valley Golf Course, run by the Minot Park District, is 5.4 road miles from The Minot Country Club and states on its own site, 'We welcome all golfers to the Souris Valley golf course.'" | Finder — the live domain `sourisvalleygolfcourse.com` was **recovered from a link on the Minot Parks page, not guessed**, after OSM's `website` tag on `way/217966757` was found stale, redirecting to a walking-trail page. Page identity confirmed from the title and body before quoting. |
| "Its Vermont Systems tee sheet returned bookable slots without a sign-in on two sampled dates." | Finder — WebTrac queried unauthenticated: 17 tee times with "Add To Cart" controls for one sampled date, 91 rows all reading "Available" for another. Published as behaviour, with the count of sampled dates rather than the dates themselves, since the tee sheet is the evidence and not the itinerary. |
| "Hawktree Golf Club, in Bismarck, Burleigh County, is Golf Digest's #2 in North Dakota and carries the same 'Public' label" | §1 ranking table for rank and label. **Burleigh County is now sourced** — the finder's Census `geographies/coordinates` call on the OSM course object returns `Burleigh County` — which retires the flagged addition recorded as O16 below. |
| "at 108.0 road miles from The Minot Country Club it is not this guide's second course, and it was named here previously on rank rather than on distance" | Finder for the mileage; the correction of record at the top of this file for the rest. **The guide states its own correction in its own prose**, in one sentence, without a date and without narrating the audit. A reader who wonders why a #2-ranked public course is not the second course gets the answer where the question occurs. |

Souris Valley's evidence is stronger than the selected course's — a live
operator site, an executed tee sheet, a full posted fee table — and it is still
not the second course, because the rule is distance and it is 1.8 miles farther.
The finder says so in as many words, and the guide's own framing keeps the two
straight: Souris Valley is offered for eighteen holes, not as the nearest. **A
better-evidenced course does not win a distance test.** Its fee table does not
publish either, for the same reason Apple Grove's absent one does not: no dated
qualifier appears in the operator's own copy, and the page's `article:modified_time`
and uploads path are freshness proxies rather than dates.

Souris Valley has no place record. The gate allows two `golf-course` places and
both are spoken for, so it lives in prose, with everything the finder
established about it and no structured claim about any of it.

### Section 5 — `Staying and eating in Minot`

| Published | Verdict |
|---|---|
| "Hyatt House Minot and Hotel Revel among its lodging" | §7 item 9 — confirmed: "The hotel list checked out (4/4 spot-checks: Hampton, Hyatt House, Kenmare Quilt Inn, Hotel Revel)." Two of the four spot-checked names are used. |
| "JL Beers and Ironhorse Kitchen + Bar among its restaurants" | §7 item 9 — confirmed: "only JL Beers and Ironhorse Kitchen + Bar were confirmed in the fetched HTML." No other restaurant name from the finder's longer list is published, because the rest is explicitly "UNCERTAIN." |

### FAQ

Four questions. The gate requires one matching `play|tee time|tee times|book`;
the first two match.

* **"How do I book a tee time to play The Minot Country Club?"** — restates the
  §2/§8 access findings and directs to **Apple Grove**, closing the loop the
  intro opens. This is the FAQ item required by the gate. The answer's closing
  sentence carries the two facts that make the redirect actionable rather than
  decorative — 3.6 road miles, and a booking platform returning
  `supportsPublic: true` to an unauthenticated query — both from the finder.
* **"Golf Digest ranks this course #1 and calls it 'Public' — so why is there
  no way to book it?"** — the second, required placement of the contradiction
  per the set's standing rule ("say it in the intro as well as the FAQ"), and
  restates the #1 ranking, so the caveat is quoted here a third time, per the
  instruction that the caveat accompany the ranking "wherever restated."
* **"What is the course's season?"** — states the gap explicitly rather than
  leaving it to be inferred, mirroring how the Oregon file turned its Audubon
  gap into a stated non-claim rather than silence. **Rewritten with the
  correction** to carry the gap on both courses: the answer now adds Apple
  Grove's "7 Days a Week: Weather Permitting" and 8am-to-6:30pm hours and its
  own absence of season dates, and closes "so neither Minot course states when
  its golf year opens or closes." The previous answer could say this of the
  ranked course only.
* **"Where is the course, and what's the second course in the state?"** —
  restates the address and airport mileage, and names **Apple Grove** as the
  second course with its town, its county, its hole count, its 3.6-mile figure
  and its booking platform's public-booking report. Hawktree's
  ranking/county/distance, which this answer previously carried, now appear only
  in Section 4's prose.

---

## 2. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum: the ranked course and one second
course. The second one changed after publication and was replaced **in place**,
so the place count, the entry count and the one-entry-per-place shape are
unchanged. Souris Valley Golf Course, named in Section 4's prose with a live
operator quotation and an executed tee sheet behind it, has no place record for
the same reason: the two slots are taken.

| slug | kind | rests on |
|---|---|---|
| `minot-country-club` | `golf-course` | §1 (rank, label), §2 Half A (facility type, fee, date), §2 Half B (self-description), §3 (address/county), §7 item 6 (yardage range only) |
| `apple-grove-golf-course-minot` | `golf-course` | **Finder, second-course section only — no verdict.** Distance and Census county from the routed sweep; address, hole count, "locally owned and operated", the absence of any membership or exclusion language, the public booking link and the 2026 Early Bird pass from the operator's own five fetched pages; `supportsPublic: true`, the Minot/ND binding and the single `GOLF` department from the Whoosh API call; "Public - 9 Holes" from NDGA's directory; the OSM tagging gap from the 600 m area pull; the season and fee absences from the grep and from the operator's silence. |
| `hyatt-house-minot` | `hotel` | §7 item 9 |
| `hotel-revel-minot` | `hotel` | §7 item 9 |
| `jl-beers-minot` | `restaurant` | §7 item 9 |
| `ironhorse-kitchen-and-bar-minot` | `restaurant` | §7 item 9 |

Every one of the six has `photos: []`, as does the guide. No photo scout has
run for this state, and the licence gate requires any referenced photo to
exist on disk.

**`address` on both `golf-course` places, and on nothing else.** §3's Nominatim
reverse-geocode of `1912 Valley Bluffs Dr, Minot, ND 58701` returned "Minot
Country Club" at that exact address, which is a genuine confirmation the address
belongs to the course, not merely an echoed query. `apple-grove-golf-course-minot`
gained the field with the correction: `3910 20th Ave SE, Minot, ND 58701` is the
operator's own published address, matched exactly by the Census address geocoder
and corroborated by North Dakota Tourism's listing. NDGA's differing "2604 Valley
Street" is not carried in the structured field — it is quoted in prose, attributed
to NDGA, so the discrepancy is visible rather than silently arbitrated inside a
schema field. The four lodging and dining places have no sourced street address
and carry none.

**`status: "open"` on all six is not a trading claim.** Per
`Ethos.Seeds.DataGuide`'s moduledoc, `"open"` renders nothing and is the
absence of a closed claim. No place's prose states that it currently trades;
the hotel and restaurant summaries state only that each is named on the city's
own tourism listing.

**No `official_url` on four of the six places.** Both `golf-course` places carry
one: `minot-country-club` has `https://www.minotcountryclub.com`, the domain the
verdicts file fetched 16 pages of, and `apple-grove-golf-course-minot` gained
`https://applegrovend.com` with the correction — a domain the finder confirmed
against the operator's own page body (course name, town, hole count, phone) and
against the booking platform's own club record, rather than trusting it for
being plausible. Neither the two hotels nor the two restaurants has a sourced
operator URL, so none is invented. Hawktree's `hawktree.com`, which the finder
did confirm against the OSM `website` tag on its course object, is not published
anywhere: the course has no place record to carry it, and the guide's prose
mentions it by name, not by link.

Six entries, one per place, all `place_slug` values resolving inside this
file.

---

## 3. Every omission, and why

### The fabricated quotation — refused entirely

**O1 — "Juniors golf FREE (one paying adult required)," attributed to Bully
Pulpit.** *Fabricated, §6 of the verdicts file.* The finder fused two separate
passages from the Bully Pulpit page into one quotation that does not exist on
the page. The verdicts file supplies the actual text — "Juniors golf FREE!" in
the fee panel, and separately, "Kids 17 and under golf for free at Bully
Pulpit. One paying adult must accompany each junior player." **Neither the
fabricated quote nor the correction is published in this file at all**, because
Bully Pulpit is not one of the two anchor courses this guide names as a place.
The dispatch instructions list this fabrication under "Do NOT publish," and the
simplest way to honor that instruction, given Bully Pulpit's more limited role
here (named only inside the caveat quotation, never independently described),
is to publish no Bully Pulpit fee or juniors claim in either form.

**O2 — "Beowulf" in any form.** *Refuted, §7 item 5 of the verdicts file.* The
string "Beowulf" does not appear on either `visitminot.org` page the finder
cited, and the club's own dining page names its restaurant "1685," not
Beowulf. Golf Digest's internal `completeName` field, "Beowulf Golf Club: Minot
Country Club," appears nowhere on the club's own site. **Nothing containing
"Beowulf" is published anywhere in this file.**

**O3 — a panel range of 2–6.** *Refuted, §4 of the verdicts file — the true
range is 2–8.* The guide publishes "range from two to eight evaluations,"
never the finder's incorrect 2–6.

**O4 — any claim that `/golf-1/` 404s.** *Refuted, §2 Half B correction.* The
finder's own §"Access" section stated `/golf` returned 404; the verdicts file
corrects this: the real page is `/golf-1/` and it returns HTTP 200 (`/tee-times/`
is the one that 200s with a "couldn't find the page" body). **No claim about
any page's HTTP status is published in this guide at all** — the underlying
facts drawn from `/golf-1/` and `/open-rounds/` are used, but no sentence
states or implies a page 404s.

**O5 — any season for Minot.** *Confirmed gap, §5 Gap 2.* No opening or
closing date is published anywhere on the operator's site. The guide states
this as an explicit gap (in the "Can you actually play it?" section and the
matching FAQ item) rather than omitting the topic silently or guessing a
winter closure from the state's latitude.

### The rules-driven omissions

**O6 — every trip duration.** No duration of any kind appears in this file.
Every distance is a road mileage with either a compass direction (the
airport-to-course figures) or a named endpoint (course-to-course figures),
sourced from §5 Gap 1's Nominatim + OSRM figures, given in metres and
converted to miles, never durations.

**O7 — Bully Pulpit's course-to-course mileage from Minot, in either
measurement.** The verdicts file flags its own 218.3 mi as approximate, geocoded
to the town centre rather than the actual address, and offers "treat as
approximate... or omit"; the finder's correction pass re-measured it at 218.5 mi
from an anchored point. Omitted, since Bully Pulpit is not an anchor course here
and is the farthest candidate measured in the state.

**O7b — Bully Pulpit's published season, and everything else it had.** This is
the one fact the correction cost the guide. Bully Pulpit was the only ranked
candidate publishing a season — "April – October | Weather Dependent" — along
with a booking route with no membership gate (`bullypulpit.quick18.com`) and
dated-by-band price floors ("Summer Prices start at $147.00", "Spring & Fall
Prices start at $107.00"). It was the finder's original second course and the
best-evidenced bookable public course on the ranking. None of it publishes,
because rank was the only reason it was there and 218.5 road miles is the
answer to a question nobody asked. The trade is recorded, not glossed: the guide
now carries a season gap on both its courses (Section 4c) where a rank-selected
second course would have carried a stated season on one.

**O8 — a designer name for The Minot Country Club.** "Jim Engh" appears only in
the finder's report, drawn from Golf Digest's embedded JSON. The verdicts file
— the authority — never re-confirms or re-quotes a designer field for Minot
anywhere in its text. Per the rule that every clause trace to a verdict, not
merely to the finder, the designer name is omitted entirely.

**O9 — any USA Today "#1 Best Golf Course in 2025" claim for Bully Pulpit.**
*Refuted, §7 item 7 — a self-published award claim, not verified against the
awarding body.* Not applicable to this file's two anchor courses in any case,
and not published.

**O10 — any tee-set count (four vs. seven) for Minot.** *Refuted by internal
contradiction, §7 item 6.* The club's own homepage and `/golf-1/` disagree on
the count while agreeing on the yardage range. Only the yardage range
publishes; no count is stated.

**O11 — any tournament history, award, or protected status for Minot CC.**
*Confirmed absence, §7 item 10.* None found in any source; correctly absent
here as well.

**O12 — most of the Minot dining list.** *Uncertain, §7 item 9.* Only JL Beers
and Ironhorse Kitchen + Bar were confirmed in the fetched HTML of
`visitminot.org/food-drink/restaurants/`, a paginated/JS listing. The rest of
the finder's longer list — Bone's BBQ, Ziggy's, Planet Pizza, and so on — is
not published.

**O13 — two of the four spot-checked Minot hotels.** Hampton Inn & Suites and
Kenmare Quilt Inn were both confirmed to exist on the visitminot.org hotel
list (§7 item 9's "4/4 spot-checks"), but only Hyatt House Minot and Hotel
Revel are published as places. This is an editorial trim, not a sourcing
gap — both omitted names are equally confirmed — kept to avoid padding a
"weekend around the course" section beyond what two representative venues per
category establish.

**O14 — a causal explanation of why Minot ranks #1.** *Explicit non-claim,
§1's note and §7 item 8:* "Do not publish any causal explanation of why Minot
ranks first." The guide states the panel numbers and the omission from the
editorial blurb, and stops there.

**O15 — every photo.** `guide.photos: []` and `photos: []` on all six places.
No photo scout has run for this state.

**O17 — Jack Hoeven Wee Links.** A real 9-hole outdoor course, 5.0 road miles
from the ranked course, and absent from the guide in every form. It fails the
access bar on its operator's own words — "Adults may play the course as long as
they are accompanied by a child 14 or younger" — which is the gated-by-exclusion
shape: the unaccompanied traveller this guide is written for cannot play it.
It is also farther than the selected course, so nothing turns on it. Recorded
because it is the second confirmed OSM golf-tagging gap in the same radius, and
because its "WINTER HOURS Closed" is the contrast that proves the season grep on
Apple Grove's site was working rather than merely returning nothing.

**O18 — every other candidate in the sweep.** The Vardon Golf Club (9.5 mi),
Wildwood Country Club, Burlington (12.4 mi), Roughrider Golf Course inside Minot
AFB (17.4 mi) and Star City Golf Course, Velva (23.2 mi, and the only candidate
returning a county other than Ward) were routed and geocoded before any
exclusion, and none was adjudicated on access: the walk stopped at the first
candidate that cleared the bar. They are in the finder's table and nowhere in
the guide, which is correct — the guide publishes the finding, not the sweep.

**O19 — NDGA's "Private" label on The Minot Country Club.** A third independent
source agreeing with the operator against Golf Digest's badge. Not published,
for the reason given in Section 4a: §0's instruction is that the contradiction
be stated in both sources' own words and left standing, and the guide already
does that twice. Recorded here so the omission is a decision rather than an
oversight.

**O20 — the operator's own email address and the finder's remaining Apple Grove
detail.** `applegroveclubhouse@gmail.com` and the "quaint, local course" homepage
welcome are in the finder and not in the guide. The telephone number publishes
because it is the actionable one; a generic welcome paragraph establishes nothing
the About-page quotation does not.

### The addition beyond the verdicts file — now retired

**O16 — "Burleigh County" for Hawktree Golf Club's place record. Resolved by the
correction, and kept here as the record of how it stood.** Neither the verdicts
file nor the finder's original text stated Bismarck's county anywhere; every
mention of Bismarck in both was a bare city name. `Ethos.Places.Place` requires a
non-null `county`, so a value had to go in the field, and Burleigh County went in
as uncontested public-record geography — flagged in this file rather than
presented as if it traced to a verdict, because the standing rule is that every
clause trace to a source and that one clause did not.

Two things then happened. Hawktree lost its place record, so the structured field
that forced the question no longer exists. And the finder's correction pass ran
the Census `geographies/coordinates` endpoint on Hawktree's own OSM course object
and got **`Burleigh County`** — so the fact is now sourced, and the guide's
Section 4 prose states it on that source rather than on general knowledge. The
flag is withdrawn. It is left in the file because a retired flag is part of the
trail: a reader who wonders whether this guide ever asserted an unsourced county
deserves the answer, and the answer is that it did, that it said so at the time,
and that the correction pass closed it.

---

## 4. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, first run, no rewrite needed. No allowlist entry was
added; `Ethos.GolfProse`'s allowlist remains `[]`.

Phrasing checked by hand against `Ethos.GolfProse.patterns/0` before writing,
given how easily a golf "getting there" section reaches for a duration:

| Candidate phrasing (never shipped) | Why it was rejected |
|---|---|
| "a short drive from the airport" | Duration pattern (`short drive`) — replaced with "5.6 road miles" |
| "just north of the airport" | Vague-proximity pattern — replaced with a named road-mileage figure |
| "twenty minutes north of Bismarck" | Duration pattern, spelled form — Hawktree's distance is stated only as a mileage figure with no direction word attached to a duration |

Every mileage figure that shipped states a number and a named endpoint
(airport, course, or city), never a direction alone and never a time.

Full corpus check: **9 tests, 0 failures.** No sibling state's file was
touched; only `priv/seed_data/golf/north-dakota.json` and this file were
written.

**Re-run after the day-two correction.** The corrected `north-dakota.json` was
checked with `Ethos.GolfProse.banned_phrases/1` over every string in its
published structure and returned `[]`; the seed suite passes with the allowlist
still `[]`. Four phrasings entered the corpus with the Apple Grove passages and
none needed a rewrite:

* **"3.6 road miles"**, **"5.4 road miles"**, **"108.0 miles away"**,
  **"99.4 miles away"** — mileages with named endpoints, no direction word, no
  duration.
* **"8am to 6:30pm"** — clock times, not an interval. Pattern 1 bans a digit
  followed by "minute" or "minutes"; a colon-separated time carries neither.
* **"7 Days a Week: Weather Permitting"** — the operator's own quoted string.
  Days are not gated in any form.
* **"in the same city and in the same county"** — the proximity patterns ban
  vague *distance* language ("next door", "steps from", "down the road", a bare
  compass bearing off the clubhouse), not a stated containment. This one is
  followed immediately by the county's own name and preceded by the mileage, so
  there is nothing vague left in it. Its weakness is not a gate matter at all —
  it is the sourcing split recorded in Section 4b, which no regex can see.

The one phrasing that had to be watched was Section 4's own correction sentence,
"it was named here previously on rank rather than on distance." It carries no
date, no offset from an unstated now, and no claim that rots: it is a statement
about this guide's own history, true whenever it is read. Written as "until
recently" or "as of today" it would have fired the self-dating patterns and
deserved to.

---

## 5. What is absent from the whole file

* **No trip duration of any kind.**
* **No vague proximity** — every spatial claim is either a road mileage with a
  named endpoint or a stated containment with its county named.
* **No price without the source's own date** — the $105 figure carries the
  Golf Digest data's own November 14, 2025 `updatedAt` timestamp.
* **No green fee for the second course, and GolfLink's $49 estimate named as an
  estimate rather than published as a fee.**
* **No trading claim for any of the six places.**
* **No causal explanation of the #1 ranking.**
* **No fabricated Bully Pulpit quotation, in either the finder's fused form or
  any paraphrase of it.**
* **No "Beowulf" anywhere.**
* **No season, and no inferred winter closure, for either Minot course** — the
  gap now sits on both, and the guide says so in one sentence.
* **No Census place claim for the second course** — the geocoder returned none,
  and "Minot" travels on the operator's own address and the booking platform's
  own record instead.
* **No arbitrated par or yardage for the second course** — both contested figures
  publish with the source that gives them.
* **No claim that a visitor can, or cannot, personally get a tee time at
  Minot** — only what each source publishes, in each source's own words.
* **No second course chosen by ranking position.** The one that was is named in
  the guide's own prose as the farther course it is, and the correction is
  recorded at the top of this file rather than written out of it.
