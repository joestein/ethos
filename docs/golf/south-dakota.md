# South Dakota — The Golf Club At Red Rock: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/south-dakota.json`,
following the register established in `docs/golf/oregon.md`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/south-dakota-verdicts.md`
   — the independent verifier's adjudication. **The authority.** Tally: **27
   confirmed · 3 refuted · 5 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/south-dakota-finder.md` —
   the finder. Context only. It carries three refuted claims; where the two
   disagree, the verdicts file wins.

**This state came back `searched: blocked`** — `redrock.cps.golf`, the Club
Prophet Systems booking engine, 403s curl and WebFetch alike behind a
Cloudflare browser-verification challenge, its API endpoints return the same
challenge, and its only two Wayback captures are empty Angular application
shells with the JS bundle unarchived. `visitrapidcity.com` and `rcgov.org`
were also blocked (403 to both tools). It publishes anyway on 27 confirmed
verdicts, per the rule that verdicts gate publication while the search flag
only gates completeness accounting. **The one real casualty of the block is
named below and nowhere papered over: the advance-booking window at The Golf
Club At Red Rock is a genuine, unresolvable gap, and the guide says so
plainly, twice — once in its own section and once in the FAQ.**

**2 places, 2 entries, 1 guide, 4 sections, 5 FAQ answers, 0 photos.**

---

## 1. The selection, and the corrections that shaped it

| | Verdict |
|---|---|
| **The Golf Club At Red Rock is third** on Golf Digest's Best in State South Dakota ranking, 3.8 from 4 panelists, literal access label `Public` | §1 Method A/B/C — confirmed, three independent extraction methods agree |
| **#1 Sutton Bay Golf Course (Agar) is `Private`** | §1 — confirmed individually |
| **#2 Minnehaha Country Club (Sioux Falls) is `Private`** | §1 — confirmed individually. Golf Digest's own prose misspells it "Minnehana"; the ranking-entry spelling "Minnehaha Country Club" is what publishes (see omission O6). |
| Therefore Red Rock is the highest-ranked `Public` entry and the selection stands | §1 — confirmed, follows from the above |

The guide is about The Golf Club At Red Rock. Sutton Bay and Minnehaha appear
exactly once each, in the intro, named as the two private courses ranked
above it so a reader is not confused about why a "third-ranked" course is the
subject of the guide. Neither is a place record.

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| course | The Golf Club At Red Rock | §1 — confirmed |
| town | Rapid City | §1, §3 — confirmed |
| state | South Dakota | given |
| county | **Pennington County** | §3 — confirmed **four independent ways**: by street address, by Golf Digest's own coordinates, by the finder's coordinates, and by the operator's JSON-LD coordinates. All four land in Pennington County. |
| Incorporated Place | **Rapid City city** | §3 — confirmed. Unlike a sibling Black Hills course that returned none, an Incorporated Place *is* returned here. |
| address | 6520 Birkdale Dr, Rapid City, SD 57702 | §3 — confirmed, with a spelling correction: the Census geocoder normalises the street to "Birkdale Rd," but the operator, Golf Digest and the club's own JSON-LD all write "Birkdale Dr." **Drive** is what publishes, per the verdict's explicit instruction. |

`county: "Pennington County"` at both the guide level and the Red Rock place
record derives from §3 directly. **The operator's own JSON-LD `geo` field
(44.0845, -103.2017) is not published anywhere** — the verdict flags it as
~7 miles off the street address, even though it still lands in the same
county. No coordinate is published in this file at all; none was needed for
the prose.

---

## 2. The guide

`slug: south-dakota-golf-guide` · `destination: "Rapid City, South Dakota"` ·
`state: "South Dakota"` · `county: "Pennington County"` · `photos: []`

### Intro

| Published | Verdict |
|---|---|
| "places The Golf Club At Red Rock third in South Dakota — the highest-ranked course carrying Golf Digest's own \"Public\" label" | §1 — confirmed |
| "Sutton Bay Golf Course, first, in Agar" / "Minnehaha Country Club, second, in Sioux Falls," both "Private" | §1 — confirmed |
| "Golf Digest rates Red Rock 3.8, from four panelists" | §1 table — confirmed exact |
| the caveat, quoted in full, ending at "…Second 100 Greatest ranking." | §2(b) — confirmed. **This is the one clause the whole dispatch turns on.** The finder's version truncated the sentence at "…lowest in the United States…", which drops the softening clause that follows ("but its top course, Sutton Bay, sits just outside our Second 100 Greatest ranking") and changes the sentence's meaning from "the ranking is weak, but not without a bright spot" to a flat claim of weakness. The verdict is explicit that the quotation boundary the finder actually used was correct — it is the *finder's own report text*, not the finder's boundary, that had elided the clause. Published here in full, and stopped exactly at "ranking." per the verdict's own instruction not to fold in the following sentence about Sutton Bay's character. |
| "designed by Ron Farris and opened in 2003" | §6 confirmed — twin sourcing (Golf Digest's structured field and prose; southdakotagolf.com) |
| "Elkhorn Ridge Golf Club, ranked fourth on the same list and also labelled \"Public,\" in Spearfish" | §1 table; §6 U3-correction — confirmed |

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`, no trailing mode. **No trip
duration and no vague proximity phrase appears anywhere in this file.**

| Published | Verdict |
|---|---|
| "6520 Birkdale Dr, Rapid City, in Pennington County" | §3 — confirmed, "Drive" spelling per the verdict's instruction |
| "Rapid City Regional Airport (RAP), also in Pennington County, is 17.2 miles from the course by road, per an OSRM driving-route calculation" | §6 R3-correction — confirmed. **This is a direct correction of the finder's number.** The finder reported "≈11.8 miles" and called it a driving distance while admitting it was a straight-line calculation. The verifier ran OSRM `driving` and got 17.2 miles (27,622 m); the great-circle distance is actually 12.0 miles, not 11.8, and **neither the 11.8/12.0 figure nor the accompanying ~29-minute duration is published** — see omission O2. |
| "(605) 718-4710" | §6 — confirmed, agreed by Golf Digest and the operator |

### Section 2 — `Playing it as a visitor`

This section, and the matching FAQ answer, are the direct execution of §4's
"Publishable booking statement," reproduced here in substance rather than
verbatim so it reads as guide prose rather than a research memo, but nothing
in it goes beyond what §4 supports:

| Published | Verdict |
|---|---|
| booking through the club's own online tee sheet, "embedded on its Tee Times page and hosted at redrock.cps.golf, a Club Prophet Systems reservation system," or by phone | §4 — confirmed. **Corrects the finder's R2 error**: the finder named Gallus Golf as the booking widget. The verifier found Gallus Golf only as a mobile-app download banner; the actual tee-sheet iframe embeds `redrock.cps.golf`, i.e. Club Prophet Systems. "Gallus Golf" does not appear anywhere in this file. |
| "the operator's own site states it offers public golf for members and visitors, so play by a non-member is established" | §4 — confirmed, operator's own JSON-LD |
| "How far in advance a visitor may book is not published anywhere," with the Cloudflare challenge, the empty archived shells, and the directory's own "For Reservation Policy" line named as the evidence for the gap | §4 — confirmed as an exhaustively documented absence, not a lazy "unknown." Every avenue the verifier tried is named: curl (403), curl with full browser headers (403, same challenge), WebFetch (403), the config and reservation-settings API endpoints (404 / 403 challenge), and both Wayback captures (bare Angular shells, unarchived JS bundle). The 11-page sweep of the operator's own site for "in advance," "days out," "24/48 hour," "tee time policy" returned **zero** hits. southdakotagolf.com's own listing corroborates the gap by telling callers to phone for the policy rather than stating one. |
| "No number of days should be assumed here. Confirm the booking window directly with the golf shop." | §4's hard rule — "this uncertainty must appear in the guide — it may not publish silently." Satisfied here and again in the FAQ. |

### Section 3 — `The Golf Club At Red Rock`

| Published | Verdict |
|---|---|
| ranking restated, 3.8 from four panelists, `Public` | §1 — confirmed |
| the caveat, quoted in full a second time | Per the corrections brief: "Quote it wherever the #3 ranking is restated." Restated here because this section re-states the ranking as a course fact, not just as guide framing. |
| *"has lived for decades in Rapid City"* / *"when he got the opportunity in the early 2000s to create a course in his adopted hometown, he decided to go the lay-of-the-land route"* / *"Farris pulled it off at The Golf Club at Red Rock"* | §6 — confirmed verbatim, Ron Whitten's Golf Digest review text |
| "opened in 2003" and "par 72" | §6 — confirmed, Golf Digest's structured field and southdakotagolf.com agree |
| *"Course Type: Public | Architect: Ron Farris | Opened: 2003"* | §6 — confirmed verbatim from southdakotagolf.com |
| "No yardage figure is published here" | §6 U5 — uncertain, four conflicting figures (Golf Digest 7,114; operator marketing "7000 Yard"; operator scorecard tops at 6,969; southdakotagolf.com 5,761). Publish nothing, or "par 72" alone. This guide states the conflict itself rather than picking a number. |
| the rates header, "2026 Season & Cart Pass Rates" | §6 R1-correction — confirmed **as a direct correction of the finder's fabricated header**. The finder claimed the page was headed "2026 Annual Membership Options" — that exact string occurs zero times, and "Membership" occurs zero times on the whole rates page. The verdict's correction is quoted, and nothing about a membership gate is implied anywhere in this file. |
| 2026 green fees: 18 holes w/ cart $130 plus tax; 9 holes w/ cart $75 plus tax; twilight (after 3 PM) w/ cart $100 plus tax; rental clubs $25 (9) / $40 (18) | §6 — confirmed verbatim, operator's own dated 2026 rates page |
| *"All rates subject to change without notice. Call the golf shop for current rates."* | §6 — confirmed verbatim, published alongside the fees per the verdict's own instruction |

### Section 4 — `Day two: Elkhorn Ridge Golf Club`

| Published | Verdict |
|---|---|
| Elkhorn Ridge Golf Club, Spearfish, ranked fourth, `Public`, 3.8 from two panelists | §1 table; §6 U3-correction — confirmed |
| Pat Wyss designed the course; (605) 722-4653 | §6 U3-correction — confirmed, named explicitly in the verdict as the replacement for the corrupted Meadowbrook record |

**Meadowbrook Golf Course does not appear anywhere in this file.** See
omission O1 — the strongest single directive in the corrections brief.

### FAQ

Five questions; the first matches the gate's required pattern (`play`, `tee
time`, `tee times`, `book`) on two separate words.

* "How do I book a tee time at The Golf Club At Red Rock?" — §2's booking
  channel and §4's unpublished-window statement, restated a second time as
  the corrections brief requires ("this uncertainty must appear in the
  guide — it may not publish silently").
* "What does a round cost?" — §6's dated 2026 rate sheet.
* "Is The Golf Club At Red Rock really South Dakota's best public course?" —
  §1's ranking and the caveat, quoted a third time. This is deliberate: the
  corrections brief says to quote the caveat "wherever the #3 ranking is
  restated," and a reader asking this exact question is restating it.
* "Where is the course, and how far is the airport?" — §3's county and §6
  R3-correction's 17.2-mile figure.
* "Where can I play a second round near Rapid City?" — §6 U3-correction,
  Elkhorn Ridge.

---

## 3. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum.

| slug | kind | rests on |
|---|---|---|
| `golf-club-at-red-rock-rapid-city` | `golf-course` | §1, §2, §3, §4, §6 |
| `elkhorn-ridge-golf-club-spearfish` | `golf-course` | §1 table, §6 U3-correction |

`golf-club-at-red-rock-rapid-city` carries a sourced address (§3). Both carry
`photos: []`, as does the guide — see omission O5. No non-golf place (no
restaurant, hotel, park, museum, etc.) is published — see omission O4.

**The county field on `elkhorn-ridge-golf-club-spearfish` is the one field in
this file that does not trace to a verdict**, and it is recorded here rather
than smoothed over: `Ethos.Places.Place` requires a non-null `county` on
every place record, and no verdict in the research file states Elkhorn
Ridge's county. `Lawrence County` is entered as a matter of settled public
record (Spearfish is Lawrence County's largest city), not as a research
finding, because no dispatched verification exists for it and none was run
to produce this file. No guide prose states Elkhorn Ridge's county anywhere —
the claim is confined to the structural database field the schema requires,
and does not appear as a sentence a reader could act on. If a later wave
verifies this field, it should be corrected then; it is flagged here so it is
not mistaken for a sourced fact.

Two entries, one per place, both `place_slug` values resolving inside this
file.

---

## 4. Every omission, and why

### The three refuted claims

**O1 — "Meadowbrook Golf Course, Semi-Private, is the second publicly
accessible course."** *Refuted, §6 U3.* southdakotagolf.com's Meadowbrook page
is demonstrably corrupted: it lists an Iowa phone number (515 area code) and
nine-hole yardage/rating figures for what is Rapid City's 18-hole course.
`golfmeadowbrook.com` is a parked domain; `meadowbrookgolfcourse.com` is a
different course, in Anderson, Indiana; rcgov.org 403s both tools. Not
published in any form, per the verdict's explicit "do not publish Meadowbrook
or any access label for it." Replaced entirely by Elkhorn Ridge Golf Club,
ranked #4 on the same Golf Digest list and carrying Golf Digest's own
"Public" label — "a far stronger source than a corrupted directory page,"
per the verdict.

**O2 — "≈11.8 miles" (or 12.0 miles) as the driving distance to the
airport, and its accompanying ~29-minute duration.** *Refuted, §6 R3.* The
finder reported a straight-line calculation as though it were a road
distance. The verifier ran OSRM `driving` and got 17.2 miles; the great-circle
distance is 12.0 miles (not even the finder's 11.8), and neither the
straight-line figure nor the ~29-minute duration is published anywhere in
this file — durations are separately banned by the prose rules regardless.

**O3 — "Page header explicitly labeled '2026 Annual Membership Options.'"**
*Refuted, §6 R1.* That string occurs zero times on the rates page; the word
"Membership" occurs zero times on the entire page. Published instead: the
verdict's own correction, "2026 Season & Cart Pass Rates," and no sentence in
this file implies the daily green fees sit under a membership heading.

### The five uncertain claims

**O4 — any hotel, restaurant, or other non-golf place near Rapid City.**
*Uncertain, §6 U4.* The visitrapidcity.com listing 403s curl and returns only
site navigation, no listing content, to WebFetch. No hotel or restaurant name
was recoverable by any method. Per the operating rule (publish only what a
confirmed verdict supports), none is invented and none is published — this is
why the file carries only two places instead of Oregon's nine. The one fact
that *is* independently confirmed — that Rapid City is the basecamp — rests
instead on the Census geocoder placing the course inside the incorporated
place "Rapid City city" (§3), not on the visitrapidcity.com listing, exactly
as the verdict directs.

**O5 — the club's own self-claimed award.** *Confirmed as existing on the
operator's site ("The Most Highly-Awarded Public Golf Course in South Dakota
by Golfweek Magazine & Golf Digest"), but flagged under "what must not be
published."* A club's own site cannot establish an award or ranking — this is
the exact failure class the verdict names as having "burned two states last
wave." Not published in any form, anywhere in this file.

**O6 — the prose spelling "Minnehana."** *Confirmed as Golf Digest's own
typo, in its ranking-page prose.* The ranking-entry data field spells it
correctly, "Minnehaha Country Club" — that is the spelling that publishes,
per the verdict's explicit instruction not to carry the misprint forward.

**O7 — any yardage figure for The Golf Club At Red Rock.** *Uncertain, §6
U5.* Four sources, four different numbers (7,114 / "7000 Yard" / 6,969 /
5,761). Nothing is published; the conflict itself is stated instead. Par 72
is the one figure every source agrees on, and it is what publishes.

**O8 — any season open/close date for the outdoor course.** *Uncertain, §5.*
No explicit open/close date is published anywhere on the operator's site. The
only November–April string on the site describes the *indoor simulators*, in
a JSON-LD sub-entity — not the outdoor course — and the verdict explicitly
upholds the finder's refusal to convert that into a winter closure. This
guide makes no claim about the course's operating season in either
direction; it is simply absent, rather than guessed at. The verdict also
records that the club's live events calendar shows play scheduled well past
the near term (an AJGA event, a Labor Day tournament, Folds of Honor, a
Senior Series round), but that is a snapshot-in-time observation about a
calendar, not a durable published fact about the guide's subject, and it is
left out rather than dressed up as a season statement.

### The rules-driven omissions

**O9 — the operator's own JSON-LD coordinates (44.0845, -103.2017).**
*Confirmed to be ~7 miles off the street address.* Not published anywhere;
no coordinate of any kind appears in this file.

**O10 — every photo.** `guide.photos: []` and `photos: []` on both places. No
photo scout has run for this state.

**O11 — "Gallus Golf" as the club's booking system.** *Refuted, §6 R2.* Named
only as a mobile-app download link on the operator's Tee Times page, never as
the tee-sheet itself. Does not appear anywhere in this file, in any role.

**O12 — a specific number of advance-booking days, in any form, rounded or
implied.** The single hardest rule in the whole dispatch. No figure appears
anywhere in this file; every reference to booking states plainly that the
window is unpublished and unconfirmable from any source tried.

---

## 5. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, first run, no allowlist entry added.
`Ethos.GolfProse.allowlist/0` remains `[]`.

No drafted phrasing fired the gate and required rewriting in this state.
Candidate phrasings were checked against the pattern set before being
drafted, rather than after:

* "17.2 miles from the course by road" — checked against the hour/duration
  patterns and the proximity patterns; matches neither, since it carries no
  duration word and no vague relational phrase. This is the mileage-plus-road
  form the gate is built to let through, following the oregon.md and
  montana.md precedent ("the resort is 25 miles north of Coos Bay on
  US-101"; "63 miles via US-93").
* "sits just outside our Second 100 Greatest ranking" (inside the quoted
  caveat) — checked against pattern 3 (`just|only|...` + a following minute
  count); does not match, since "just" here is not followed by a digit and a
  minute unit. The caveat quotes clean without alteration.
* No section states a direction relative to "the course," "the clubhouse,"
  "the resort," "the links," "the property," or "the first tee" — the noun
  list pattern 16 bans — because no sourced fact in this state's verdicts
  supports a bearing claim at all; Elkhorn Ridge's relation to Rapid City is
  stated only by naming the town, with no direction or distance attached,
  since none is sourced.

---

## 6. Roster row (for the roster agent)

Course: **The Golf Club At Red Rock**. Basecamp: **Rapid City, South
Dakota**. County: **Pennington County**. Access: non-members book through the
club's own online tee sheet, hosted at redrock.cps.golf (Club Prophet
Systems), or by phone at (605) 718-4710; the advance-booking window is not
published anywhere and could not be established from the booking engine
(Cloudflare-blocked), the operator's own site, or any archived snapshot.
Second course: **Elkhorn Ridge Golf Club**, Spearfish. Places: 2. Entries: 2.
Gate: **9 tests, 0 failures**, no allowlist entries. Nothing the gate would
have caught was ever drafted; the one deliberately excluded number is the
advance-booking window, named as unpublished rather than guessed at, per the
"searched: blocked" sourcing on this state.

`priv/seed_data/golf_courses_roster.json` was not touched by this task — its
`south-dakota` row remains the unverified stub, owned by the finalize agent.
