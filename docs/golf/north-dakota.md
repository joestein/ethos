# North Dakota — The Minot Country Club: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/north-dakota.json`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/north-dakota-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **44
   confirmed · 8 refuted · 4 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/north-dakota-finder.md` —
   the finder. Context only. It carries several of the refuted and uncertain
   items (a fabricated quotation, a wrong panel-count range, a wrong airport
   citation for a page-404 that isn't one); where the two disagree, the
   verdicts file wins and its text, not the finder's, ships.

**The governing rule:** a verdict vouches only for what its own text restates,
not for every clause of the sentence the finder wrote around it.

**6 places, 6 entries, 1 guide, 5 sections, 4 FAQ answers, 0 photos.**

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
| the caveat, verbatim | §4 — confirmed verbatim, found at char offset 235,532 of the raw Wayback HTML |
| "Hawktree Golf Club, Golf Digest's #2 in the state, also labeled 'Public,' in Bismarck" | §1 ranking table — confirmed |

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`, no trailing mode. **No trip
duration appears anywhere in this section or this file** — every figure below
is a road-mileage figure, confirmed by the verdicts file as computed via
Nominatim + OSRM, in metres, and never converted to a duration.

| Published | Verdict |
|---|---|
| "Minot International Airport (MOT) is 5.6 road miles from The Minot Country Club" | §5 Gap 1 — confirmed: 8,995 m = 5.6 miles. **This closes the finder's stated gap**; the finder's "getting there" section explicitly could not source this, and the verifier closed it without any search budget. |
| "at 1912 Valley Bluffs Dr in Minot, Ward County" | §3 — confirmed by Nominatim's reverse-geocode of that exact address, which itself resolved to "Minot Country Club, 1912, Valley Bluffs Drive, Minot, Ward County, North Dakota, 58701" |
| "Hawktree Golf Club in Bismarck is 105.2 miles away" | §5 Gap 1 — confirmed, course-to-course road distance |
| "The Links of North Dakota in Ray is 88.8 miles away" | §5 Gap 1 — confirmed |
| "Bismarck Municipal Airport (BIS) is 113.6 road miles" | §5 Gap 1 — confirmed: 182,784 m = 113.6 mi |
| "Hector International Airport in Fargo (FAR) is 269.6 road miles" | §5 Gap 1 — confirmed: 433,922 m = 269.6 mi |

**Omitted: Bully Pulpit's course-to-course distance (218.3 mi).** The verdicts
file itself flags this figure as approximate — geocoded to the Medora town
centre because Nominatim returned no result for the street address — and
explicitly offers "or omit" as an option. Since Bully Pulpit is not one of the
two anchor courses in this file, it is omitted rather than published as an
approximate figure with a caveat that would need its own sentence.

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

### Section 4 — `The practical round: Hawktree Golf Club`

Hawktree is presented as the practical option per the dispatch instruction,
but the guide does **not** claim an online booking route for Hawktree — no
verdict in this file independently checked Hawktree's own operator site the
way it checked Minot's and Bully Pulpit's. Only what the verdicts table and
the caveat establish is published.

| Published | Verdict |
|---|---|
| "ranks Hawktree Golf Club, in Bismarck... second... 'Public'... 'Daily Fee'" | §1 ranking table — confirmed |
| "Burleigh County" | **Not itemized in either sourced file.** Bismarck's home county is not established by any verdict here; it is uncontested public-record geography (Bismarck is the seat of Burleigh County), included only because the place schema requires a non-null `county` field. See omission O1 below — this is flagged rather than silently treated as verdict-sourced. |
| "names Hawktree, by name, as one of three courses whose visitors 'are all happy they made the trip'" | §4 caveat — confirmed verbatim, Hawktree is one of the three named courses |
| "a line the same page does not extend to its own #1" | §1, "three things... point away from Minot," item 1 — confirmed: "The editorial blurb names three other courses... It does not name its own #1." |
| "By road, Hawktree is 105.2 miles from The Minot Country Club" | §5 Gap 1 — confirmed |
| "No source consulted for this guide records Hawktree's own site disputing Golf Digest's 'Public' label" | Stated as an absence, not a claim — no verdict item checked Hawktree's operator site, so none is claimed here either. |

### Section 5 — `Staying and eating in Minot`

| Published | Verdict |
|---|---|
| "Hyatt House Minot and Hotel Revel among its lodging" | §7 item 9 — confirmed: "The hotel list checked out (4/4 spot-checks: Hampton, Hyatt House, Kenmare Quilt Inn, Hotel Revel)." Two of the four spot-checked names are used. |
| "JL Beers and Ironhorse Kitchen + Bar among its restaurants" | §7 item 9 — confirmed: "only JL Beers and Ironhorse Kitchen + Bar were confirmed in the fetched HTML." No other restaurant name from the finder's longer list is published, because the rest is explicitly "UNCERTAIN." |

### FAQ

Four questions. The gate requires one matching `play|tee time|tee times|book`;
the first two match.

* **"How do I book a tee time to play The Minot Country Club?"** — restates the
  §2/§8 access findings and directs to Hawktree, closing the loop the intro
  opens. This is the FAQ item required by the gate.
* **"Golf Digest ranks this course #1 and calls it 'Public' — so why is there
  no way to book it?"** — the second, required placement of the contradiction
  per the set's standing rule ("say it in the intro as well as the FAQ"), and
  restates the #1 ranking, so the caveat is quoted here a third time, per the
  instruction that the caveat accompany the ranking "wherever restated."
* **"What is the course's season?"** — states the gap explicitly rather than
  leaving it to be inferred, mirroring how the Oregon file turned its Audubon
  gap into a stated non-claim rather than silence.
* **"Where is the course, and what's the second course in the state?"** —
  restates the address, airport mileage, and Hawktree's ranking/county/
  distance, all previously sourced above.

---

## 2. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum: the ranked course and one second
course.

| slug | kind | rests on |
|---|---|---|
| `minot-country-club` | `golf-course` | §1 (rank, label), §2 Half A (facility type, fee, date), §2 Half B (self-description), §3 (address/county), §7 item 6 (yardage range only) |
| `hawktree-golf-club` | `golf-course` | §1 (rank, label), §4 (caveat naming), §5 Gap 1 (distance) |
| `hyatt-house-minot` | `hotel` | §7 item 9 |
| `hotel-revel-minot` | `hotel` | §7 item 9 |
| `jl-beers-minot` | `restaurant` | §7 item 9 |
| `ironhorse-kitchen-and-bar-minot` | `restaurant` | §7 item 9 |

Every one of the six has `photos: []`, as does the guide. No photo scout has
run for this state, and the licence gate requires any referenced photo to
exist on disk.

**`address` on `minot-country-club` only.** §3's Nominatim reverse-geocode of
`1912 Valley Bluffs Dr, Minot, ND 58701` returned "Minot Country Club" at that
exact address, which is a genuine confirmation the address belongs to the
course, not merely an echoed query. No other place in this file has a sourced
street address, so no other place carries the field.

**`status: "open"` on all six is not a trading claim.** Per
`Ethos.Seeds.DataGuide`'s moduledoc, `"open"` renders nothing and is the
absence of a closed claim. No place's prose states that it currently trades;
the hotel and restaurant summaries state only that each is named on the city's
own tourism listing.

**No `official_url` on five of the six places.** Only `minot-country-club`
carries one (`https://www.minotcountryclub.com`, the domain the verdicts file
fetched 16 pages of). No verdict establishes an operator URL for Hawktree, the
two hotels, or the two restaurants, so none is invented.

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

**O7 — Bully Pulpit's course-to-course mileage (218.3 mi) from Minot.** The
verdicts file itself flags this figure as approximate, geocoded to the town
centre rather than the actual address, and offers "treat as approximate... or
omit" — omitted, since Bully Pulpit is not an anchor course here.

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

### The one addition beyond the verdicts file, flagged rather than hidden

**O16 — "Burleigh County" for Hawktree Golf Club's place record.** Neither the
verdicts file nor the finder states Bismarck's county anywhere; every mention
of Bismarck in both source documents is a bare city name. `Ethos.Places.Place`
requires a non-null `county` on every place, so a value had to go in the
field. Burleigh County is uncontested public-record geography — Bismarck is
its county seat — and carries none of the risk the "no fabricated county
field" rule was written to guard against (a disputed or coincidence-adjacent
fact masquerading as sourced). It is called out explicitly here, rather than
presented in the JSON summary as if it traced to a verdict item the way Ward
County does, because the standing rule for this file is that every clause
trace to the verdicts document, and this one clause does not. No sentence in
the guide's prose states Burleigh County as a researched fact; it appears only
in the place record's structured `county` field.

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
| "twenty minutes north of Bismarck" | Duration pattern, spelled form — Hawktree's distance is stated only as "105.2 miles" with no direction word attached to a duration |

Every mileage figure that shipped states a number and a named endpoint
(airport, course, or city), never a direction alone and never a time.

Full corpus check: **9 tests, 0 failures.** No sibling state's file was
touched; only `priv/seed_data/golf/north-dakota.json` and this file were
written.

---

## 5. What is absent from the whole file

* **No trip duration of any kind.**
* **No vague proximity** — every spatial claim is either a road mileage with a
  named endpoint, or (in the Hawktree section) a plain statement of absence
  ("no source consulted... records Hawktree's own site disputing...").
* **No price without the source's own date** — the $105 figure carries the
  Golf Digest data's own November 14, 2025 `updatedAt` timestamp.
* **No trading claim for any of the six places.**
* **No causal explanation of the #1 ranking.**
* **No fabricated Bully Pulpit quotation, in either the finder's fused form or
  any paraphrase of it.**
* **No "Beowulf" anywhere.**
* **No season, and no inferred winter closure, for Minot.**
* **No claim that a visitor can, or cannot, personally get a tee time at
  Minot** — only what each source publishes, in each source's own words.
