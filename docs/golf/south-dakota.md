# South Dakota — The Golf Club At Red Rock: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/south-dakota.json`,
following the register established in `docs/golf/oregon.md`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/south-dakota-verdicts.md`
   — the independent verifier's adjudication. **The authority.** Tally: **27
   confirmed · 3 refuted · 5 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/south-dakota-finder.md` —
   the finder. Context only **for claims the verdicts file adjudicated**. It
   carries three refuted claims; where the two disagree on those, the verdicts
   file wins.
3. The same finder's **"Second publicly accessible course — nearest-course sweep
   (corrected)" section, which no verdict covers and which overturns one.** It
   was re-run from scratch after publication, and on the single point where it
   and the verdicts file collide — whether Meadowbrook may be published at all —
   **the finder wins, on evidence the verifier did not have.** The reason is set
   out in the correction note below and in full at O1.
4. `.superpowers/sdd/2026-09-05-golf-courses/research/south-dakota-basecamp.md` —
   the basecamp finder's report, also written after publication, also covered by
   no verdict. It closes the gap recorded at O4 and is the only evidence behind
   this guide's lodging and dining.

**This state came back `searched: blocked`** — `redrock.cps.golf`, the Club
Prophet Systems booking engine, 403s curl and WebFetch alike behind a
Cloudflare browser-verification challenge, its API endpoints return the same
challenge, and its only two Wayback captures are empty Angular application
shells with the JS bundle unarchived. `visitrapidcity.com` and `rcgov.org`
were also blocked (403 to both tools). It publishes anyway on 27 confirmed
verdicts, per the rule that verdicts gate publication while the search flag
only gates completeness accounting. **The one real casualty of the block that
survives is named below and nowhere papered over: the advance-booking window at
The Golf Club At Red Rock is a genuine, unresolvable gap, and the guide says so
plainly, twice — once in its own section and once in the FAQ.** Two other
casualties of the same block — the second course and the basecamp — did not
survive, and the correction note records what replaced them.

**5 places, 5 entries, 1 guide, 5 sections, 6 FAQ answers, 0 photos.**

**Correction of record, 6 September 2026.** Two things changed after
publication, and they have the same cause.

**The day-two course.** What published on 5 September 2026 was **Elkhorn Ridge
Golf Club**, Spearfish, selected at Golf Digest rank #4 with its "Public" label.
The spec's rule is the **nearest** other publicly accessible course, not the
highest-ranked other one, and a corpus-wide audit (`second-course-audit.md`)
found this state among four that had selected by ranking position instead.
`south-dakota.json` now carries **Meadowbrook Golf Club, Rapid City — 5.8 road
miles**, in the same city and the same county as the ranked course, against
Elkhorn Ridge's **48.3** across the Black Hills into a different county. Eleven
courses sit nearer to the ranked course by road than Elkhorn Ridge does.

**And Meadowbrook is the course this file's strongest single directive
previously forbade.** O1 below said, in this file's own words, that Meadowbrook
"does not appear anywhere in this file," on a verdict that read the operator's
own directory listing as corrupted. That verdict was reading **a different
course**: the South Dakota directory page it judged is titled "Meadowbrook Golf
Course - Golf in Wellsburg, IA" and carries an Iowa address and an Iowa
telephone number. The Iowa area code and the nine-hole figures that looked like
corruption were accurate data about a real Iowa course, reached through a slug
collision. The verdict was sound reasoning on a page that was not the subject.
**A directive is only as good as the page behind it**, and this one is reversed
in full at O1, which is kept as the record of how it stood and why it fell.

**The basecamp.** The guide published two place records, both golf courses, and
this file recorded at O4 that no hotel or restaurant was published because none
could be sourced through a blocked destination-marketing site. A basecamp pass
went to the operators directly and returned three: **Hotel Alex Johnson**,
**Rock Bar & Grill** and **Paddy O'Neill's Irish Pub**, all in `Pennington
County`. The guide gained a fifth section and a sixth FAQ answer to carry them.
O4 is reversed too, and for a plainer reason than O1: the gap was real, and
somebody went and closed it.

Elkhorn Ridge is not withdrawn. It keeps its rank, its label, its architect and
its telephone number, and the guide names it in prose as the farther course it
is. The passages below that documented it as the day-two course, and the ones
that recorded the absence of a basecamp, have been rewritten to document what
the guide now carries; these paragraphs are the record that they once did.

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
| "Meadowbrook Golf Club, the city-owned 18-hole course on Jackson Blvd, gives this guide a second round: it is 5.8 road miles from Red Rock in the same city and the same county, its operator publishes non-member tee times in its own words, and its Club Caddie portal returned bookable non-member slots on four sampled dates." | **Finder, second-course section** — no verdict. Each clause is separately sourced in Section 4 below. The intro no longer names Elkhorn Ridge at all; it appears once, at the end of Section 4, as the farther alternative. |

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

### Section 4 — `Day two: Meadowbrook Golf Club`

Every row in this section rests on the finder's re-run second-course section.
**No verdict covers any of it**, and the one verdict that touched the subject is
overturned — see O1. That is stated once here rather than repeated on each line.

**How the course was arrived at.** An Overpass sweep of every
`leisure=golf_course` within 60 km of the ranked course returned twelve objects,
one of them the ranked course itself; the remaining eleven were routed with OSRM
from a single fixed origin and geocoded with the Census coordinates endpoint
before any exclusion, and two control queries — Rapid City Hall and Spearfish
City Hall — both returned an Incorporated Place, so the four blanks in the table
are unincorporated territory rather than failed lookups. **All fourteen points
returned a county and a state; none came back unmatched.** Meadowbrook is row
one at 5.8 miles, and the walk stopped there. None of that method is in the
guide, which publishes the finding: "Meadowbrook Golf Club is the nearest other
publicly accessible course to The Golf Club At Red Rock."

| Published | Rests on |
|---|---|
| "the nearest other publicly accessible course to The Golf Club At Red Rock: 5.8 road miles by OSRM's driving profile, at 3625 Jackson Blvd, in the same city and the same county, Pennington County" | Finder — OSRM to the Census-geocoded street address returns **5.76 miles** with the destination waypoint named **"Jackson Boulevard"**, the street in the operator's own address, which is what confirms the point; routing to the OSM polygon centroid instead returns 5.87. **5.8 is the figure carried, and it is the rounding of the address-anchored route, not an average of the two.** Census on both the centroid and the address returns `Pennington County` / `Rapid City city` — the same county string, the same incorporated place, as the ranked course. |
| "It is municipal. The City of Rapid City's own government directory carries it as 'Parks & Recreation - Golf Division - Meadowbrook Golf Course,' with the office and tee-time line 605-394-4191 and a web link to golfatmeadowbrook.com, whose own footer gives the same street address and the same phone number." | Finder — **and this sentence is the identity check, published rather than assumed.** The operator domain came from the city that owns the course, not from a guess, and the footer was read before anything was quoted from it. Section 4a records why that mattered here more than anywhere. |
| "a distinguished 18-hole golf experience rooted in tradition and shaped by thoughtful stewardship. Originally designed by David Gill, this classic parkland layout stretches more than 6,900 yards." | Finder — verbatim from the operator's own About page. This is what establishes a playable outdoor eighteen, alongside the home page's "18 Hole Championship Course" block and the scorecard and rates links on the same page. |
| "Rapid Creek runs through the property." | Finder. |
| The two headed tee-time blocks, quoted: "Non Member Tee Times" / "Did you know you can book tee times online 24/7? Click the button below to book a tee time online"; "Member Tee Times" / "All members must log into the member portal to book a tee time online." | Finder — the operator's own page structure, and the guide's own framing says why it is quoted in that shape: "Access is the operator's own, in the operator's own words rather than a ranking's label." A page that heads one block for non-members and another for members has answered the access question itself. |
| "The public button resolves to a Club Caddie portal that renders the club record as 'Meadowbrook Golf Club / 3625 Jackson Blvd., South Dakota, Rapid City, 57702' and lists 'Open to Public' among its amenities, alongside Bar, Restaurant, ProShop, Rent Club and Walking." | Finder — the portal's own club record. The address inside the booking system matching the address on the city directory is the second half of the identity check. |
| "Queried with no login and no member number, that portal returned bookable slots on four sampled dates: 24 on 7 September 2026; 32 on 12 September 2026, the first at 08:10 AM, front nine, for groups of one to four; 51 on 13 September 2026; and 48 on 20 September 2026." | Finder — the portal's own `webapi/TeeTimes` search, executed. **Behaviour, not an adjective**, and the guide states the counts and the dates rather than the conclusion, so a reader can see the size of the evidence. No booking was completed. |
| "Dates from 21 September 2026 onward returned no slots, and neither did 15 April 2027, which sits inside the operator's own published season — that boundary is the tee sheet's rolling advance-booking horizon, not a closure." | Finder, including the reasoning. **This is the sentence that stops the evidence being misread**, and it is published rather than left in the research: an empty tee sheet looks exactly like a closed course, and the only thing separating them is a date inside the season that is also empty. The finder tested six such dates; the guide publishes the one that settles it. |

#### Section 4a — the domain trap this state walked into twice

The guide does not narrate this, and this file must.

**Plausible-looking domains kept resolving to different courses in other
states.** `meadowbrookgolfcourse.com` is titled "Meadowbrook Golf Course - MI";
`rcgolf.com` is "Reservoir Creek"; `meadowbrookgc.com` is a Meadowbrook Golf
Club that publishes no address at all; and during the same pass
`fountainspringsgolf.com` turned out to be a Fountain Springs Golf Course in
Peterstown, West Virginia. The OSM object for the real Meadowbrook carries **no
`website` tag at all**, so there was nothing stale to be misled by and nothing
to lean on either.

**The same trap is what produced O1's directive.** The page the verdict judged
corrupted — an Iowa phone number, nine-hole figures for an eighteen-hole
course — is a South Dakota directory's page about **Meadowbrook Golf Course in
Wellsburg, Iowa**, reached through a slug collision. Its own title says so. The
data was not corrupted; it was correct data about a different course. The
verifier's inference from the page in front of it was reasonable and its
conclusion was wrong, and the difference between those two is the whole reason
this file exists.

Every operator URL relied on for this course was reached from a source naming
this course's own address — the city government directory for the operator site,
the operator's footer for the address and phone, the booking portal's own club
record for both again. The guide publishes the chain rather than the conclusion,
which is why the "municipal" sentence carries a directory name, a phone number
and a domain instead of an adjective.

#### Section 4b — the season, and the conflict that is published as a conflict

| Published | Rests on |
|---|---|
| "The season is stated on the operator's rates page: 'Typical season is from the middle of March to the end of November and is weather-dependent.'" | Finder — and the guide's next clause is the check, not the claim: "That sentence is live page content, inside the rates page's 2026 season-pass block, not a notice switched off inside an HTML comment." The check was run because this programme has been burned by exactly that artefact, and Section 4c below records where it fired in this very state. |
| "The operator's own 2026 Tournament Schedule agrees with the same window, running from a Monday 13 April fixture to a Saturday 17 October one, with no entries in December, January or February." | Finder — the operator's own PDF, titled "2026 Tournament Schedule" in the document itself. The finder labels the asset-path date a freshness proxy rather than a publication date; **the guide cites the document's own title and its own fixture dates, and no path date**, so nothing rests on the proxy. |
| "No aeration schedule, no winter-closure notice, no renovation notice and no alerts page exists anywhere on the site, live or commented out." | Finder — seven pages pulled as raw HTML and matched against `clos`, `aerat`, `renovat`, `flood` and `maint`, every hit tested for whether it sat inside a comment. An absence reported as an absence, with the comment test named so a reader knows which kind of absence it is. |
| The green fees, under the operator's visible "2026 Season Passes" heading, with "Fees were approved by City Council Fee Resolution 2025-130" | Finder — 18 holes $60; 18 holes senior 62 and over, active military or veteran $51; 18 holes junior 12 to 17 $25; 9 holes $42; twilight walking only $34; half cart 18 holes $23; single-rider cart 18 holes $30; and "The development fee is included in all daily green fees." **The dated qualifier is the visible heading plus the cited fee resolution**, which is what lets these publish where the ranked course's own undated figures could not have. |
| "One conflict on that page is recorded rather than smoothed over: its own metadata still describes the page as the 2025 rates while the visible, operator-authored heading reads 2026." | Finder. The guide publishes the conflict in its own sentence rather than picking a year silently. The fee resolution is the operator's own citation and was not independently located on the city's site, which the finder says and this file records — see O14. |

**The correction changed what this guide can say about a season.** The ranked
course's season is an open gap (O8) and stays one. The rank-selected second
course had a season too — Elkhorn Ridge publishes explicit dated fee periods —
so on this one axis the swap is not a straight gain: it trades one course's
stated season for another's. What it gains is that Meadowbrook's season is
stated by a **municipal operator on a page whose live-versus-commented status
was checked**, and Elkhorn Ridge's page is the one where a switched-off notice
was found.

#### Section 4c — the courses named, ruled out, and not published

**Elkhorn Ridge, kept in the guide's prose.** The final paragraph of Section 4
publishes its rank, its "Public" label, its architect, its county, its golf-shop
number, its 48.3 road miles, and — in the guide's own words — that "it was this
guide's second course on rank rather than on distance," followed by "Eleven
courses sit closer to Red Rock by road." **The guide states its own correction,
in one sentence, with no date and no narration of the audit.** A reader who
wonders why a #4-ranked public course is not the second course gets the answer
where the question occurs.

Two facts about Elkhorn Ridge are recorded here and published nowhere. Its
access **holds up when tested properly** — the operator publishes "Public play
is limited to four players maximum" with daily non-guest rates by season band
and a resort-guest discount, which is tiered by price rather than gated by
membership — so the label was right and the entry failed on distance alone. And
a **switched-off closure notice** sits on its own site: a COVID-era "We're open!
However… new guidelines" banner whose entire `<div>` is wrapped in an HTML
comment. The operator disabled it; a naive tag-strip would resurrect it. Neither
fact is in the guide, because the guide says only that Elkhorn Ridge is farther,
and neither the access finding nor the retired banner changes that.

One flagged item is resolved by the correction rather than by evidence. The
state directory describes Elkhorn Ridge as "a regulation 9-Hole facility open to
the golfing public with plans for an additional nine holes" — a third-party
claim the finder flagged precisely because the published guide's prose implied a
full second round there. The guide no longer sends anyone there for a round, so
the tension is gone; the claim is still third-party and is still not published.

**The two OSM objects that are not established courses.** `way 242674003` at
8.7 road miles carries `leisure=golf_course` and nothing else: 28 nodes over
roughly 245 m × 502 m, about thirty acres, in a residential block, with no
clubhouse, no operator and no golf business in the surrounding bbox pull, and no
Rapid City directory listing a course there — most likely a mis-tagged park
feature. `relation 17658520` at 40.1 miles is untagged beyond
`leisure=golf_course` and is inferred to be Boulder Canyon Golf Club, Sturgis
from the Census CDP name plus the SDGA list, not confirmed against any operator.
**Both are farther than the winner and neither could have displaced it**, which
is why the finder records them rather than dropping them and why the guide names
neither. `leisure=golf_course` is a tag, not a promise.

**The course the sweep could not see.** Fountain Springs Golf Course is absent
from OSM's golf tagging entirely — no object at its location, and a Nominatim
name search returns nothing. It was placed from the City of Rapid City's own
planning record (agenda items 17PD009 and 17PL018, "Fountain Springs Golf Course
and Gardens", 2700 N. Plaza Drive) and routed at 9.3 miles. **It is farther than
the selection, so the answer holds** — but the gap is real, its current
operating status was never established from an operator site, and the obvious
domain belongs to the West Virginia course of the same name. This is the second
state in this programme where the required non-OSM cross-check found a course
the map could not, and it is recorded here for that reason rather than for any
effect on the outcome.

With Fountain Springs added, every course either non-OSM inventory names inside
Rapid City is accounted for — the SDGA's member list and GolfLink's own count of
seven Rapid City courses — and none of them is nearer than Meadowbrook.

### Section 5 — `Staying and eating in Rapid City`

This section did not exist in the published guide. It rests entirely on the
basecamp report; **no verdict covers any of it**, and O4's recorded absence is
what it replaces.

**The basecamp shape, stated rather than assumed.** The guide's first sentence
gives the reasoning: the Census geocoder places the course itself inside `Rapid
City city`, `Pennington County`, "so the basecamp is the city itself and not a
gateway town." The route out is published as a road list rather than a
direction — Muirfield Drive to Sheridan Lake Road, then Jackson Boulevard and
West Main Street into downtown, 8.0 road miles — because named roads are what
OSRM returned and a compass bearing is not.

| Published | Rests on |
|---|---|
| "The club has no lodging of its own — its navigation runs Tee Times, Golf, Events, Bar & Grill, Store and Contact Us, and no rooms or cabins appear anywhere on golfclubatredrock.com." | Basecamp report — **rejected as absent, not as unfound**, and the guide publishes the navigation list so a reader can see which kind of absence it is. |
| The Rock Bar & Grill: "WE ARE OPEN to the PUBLIC. You don't have to be a member!" and the home page's "You don't have to be a member to play the course or dine in the bar & grill!" | Basecamp report — verbatim, capitals as the operator sets them. Two operator pages saying the same thing, which is why the guide quotes both. |
| Its hours, its daily lunch/dinner/snacks, its full-service bar, and its own line 605-716-3892 "separate from the golf shop's" | Basecamp report. The separate phone line is published because it is the detail that makes the restaurant reachable independently of the course. |
| The Hotel Alex Johnson at 523 Sixth St., open "since July 1, 1928," a member of the Curio Collection by Hilton, "Historic Style. Newly Renovated Rooms." | Basecamp report — verbatim from the hotel's own pages. |
| The dated events: Buffalo Roundup September 24-26, 2026; Black Hills Pow Wow October 9-11, 2026; Lakota Nation Invitational December 16-19, 2026; Black Hills Stock Show & Rodeo January 29 - February 6, 2027 | Basecamp report — **and this is the trading-status evidence, not decoration.** The hotel's own dated forward programme is what the record rests on; the Hilton reservation path returns HTTP 403 to automated requests, so no availability query was run and none is implied. The guide publishes the dates themselves so the basis is visible. |
| "It is 8.0 road miles from the course, by Muirfield Drive, Sheridan Lake Road, Jackson Boulevard, West Main Street and Saint Joseph Street to 6th Street." | Basecamp report — OSRM driving route between two Census address matches. |
| "No nightly rate is published here: the hotel's own site publishes none, and Hilton's booking pages return HTTP 403 to automated requests, so there is no dated operator figure to carry." | Basecamp report. The absence is published with its reason, in the same shape the guide uses for the ranked course's booking window. |
| Paddy O'Neill's Irish Pub: the "Old World Irish charm" quotation, hours of 8AM to 2AM, kitchen to 10PM, breakfast seven days a week, Industry Night Mondays from 4PM, karaoke Tuesdays, music bingo Wednesdays | Basecamp report — verbatim, and the standing weekly programme is part of the trading-status evidence rather than colour. |
| Juniper at Vertex Sky Bar: rooftop, daily from 4PM, dinner 4PM to 9PM, reservations by OpenTable or on 605-484-8593; "the third outlet is a Starbucks" | Basecamp report. Named in prose, **no place record** — see O15. |
| "Both pubs publish happy-hour price lists, and neither carries a dated qualifier from its operator, so no drink or food price is published in this guide." | Basecamp report, which read the prices and rejected them under the price rule rather than missing them. The guide states the rejection instead of leaving a silent gap, matching how it handles the ranked course's booking window and its yardage. |

**The nearer hotel that was not published.** The basecamp report is explicit
that a hotel closer than 8.0 road miles was not established: Visit Rapid City's
lodging directory renders client-side and returned no property names, addresses
or URLs, and no chain-hotel domain was guessed at — "this programme has twice
found plausible domains belonging to same-named businesses in other states, and
an unverified nearer hotel is worth less than a verified one at 8.0 miles."
Section 4a is the third such finding, in this same state. The gap is real and is
recorded at O16; it is not a claim that nothing nearer exists.

### FAQ

Six questions; the first matches the gate's required pattern (`play`, `tee
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
* "Where can I play a second round in Rapid City?" — **rewritten.** Now
  Meadowbrook, from the finder: the address, the 5.8-mile figure, the shared
  county, the operator's own "Did you know you can book tee times online 24/7?",
  the portal's slot counts stated as a range across four sampled dates, "Open to
  Public" among the amenities, the fee band from $25 to $60 under the 2026
  heading, and the stated typical season. Elkhorn Ridge closes the answer with
  its rank, its 48.3 miles and its different county. The question's own wording
  changed from "near Rapid City" to "in Rapid City", because the answer now is.
* "Where do I stay and eat around the course?" — **new.** The basecamp report:
  the city as basecamp, the absence of on-property lodging, the hotel with its
  opening date, its brand and its unpublished rate, two of its three outlets, and
  the clubhouse restaurant's own "WE ARE OPEN to the PUBLIC" line.

---

## 3. Places, against the verdicts they rest on

Five places. Two are `golf-course`, the gate's maximum; the other three arrived
with the basecamp pass.

| slug | kind | rests on |
|---|---|---|
| `golf-club-at-red-rock-rapid-city` | `golf-course` | §1, §2, §3, §4, §6 |
| `meadowbrook-golf-club-rapid-city` | `golf-course` | **Finder, second-course section only — no verdict, and one verdict overturned (O1).** Distance, Census county and Incorporated Place from the routed sweep; the municipal identity from the City of Rapid City's own government directory; the design, the yardage and the eighteen holes from the operator's About page; the two headed tee-time blocks and the daily-fee table from the operator's own pages; "Open to Public", the club record and the four sampled slot counts from the executed Club Caddie portal; the season sentence and its live-content check, the tournament schedule and the absence of any aeration or closure notice from the seven-page raw-HTML pass. |
| `hotel-alex-johnson-rapid-city` | `hotel` | **Basecamp report — no verdict.** Address, opening date, brand, own copy, the three in-building outlets, the 8.0-mile OSRM route between two Census address matches, the dated events page as the trading-status basis, and the unpublished rate with its reason. |
| `rock-bar-and-grill-rapid-city` | `restaurant` | **Basecamp report — no verdict.** The operator's two "not a member" lines, the daily lunch/dinner/snacks and full-service bar, the published hours and happy-hour windows, its own phone line, and the rejected undated happy-hour prices. |
| `paddy-oneills-irish-pub-rapid-city` | `restaurant` | **Basecamp report — no verdict.** Its own description, "Proudly Seed-Oil Free", the published hours and kitchen hours, the standing weekly programme, the ordering channels, and the rejected undated price lists. |

**Three of the five carry a sourced address.** `golf-club-at-red-rock-rapid-city`
from §3; `meadowbrook-golf-club-rapid-city` from the operator's own footer, the
city directory and the booking portal's club record, matched exactly by the
Census address geocoder; `hotel-alex-johnson-rapid-city` and
`paddy-oneills-irish-pub-rapid-city` share 523 Sixth St, the pub being inside
the hotel building, and `rock-bar-and-grill-rapid-city` shares the course's own
6520 Birkdale Dr for the same reason. All five carry `photos: []`, as does the
guide — see omission O5.

**An address-form discrepancy on the ranked course, recorded twice over.** §3
already noted that the Census geocoder normalises the street to "Birkdale Rd"
while the operator, Golf Digest and the club's own JSON-LD write "Birkdale Dr";
the basecamp pass hit it independently and adds a third source for **Road**, the
AJGA's own tournament page for the course. Both forms resolve to the same point.
**Drive** publishes, per the verdict's explicit instruction, and the variance is
flagged rather than resolved.

**Both county fields on the two golf courses now trace to the Census geocoder.**
This file previously flagged `Lawrence County` on
`elkhorn-ridge-golf-club-spearfish` as the one field that did not trace to a
verdict, entered as settled public record because the schema requires a non-null
`county`. That record no longer exists. Its replacement,
`meadowbrook-golf-club-rapid-city`, geocodes to `Pennington County` on both its
polygon centroid and its street address — the same county string as the ranked
course. And Elkhorn Ridge's county is now sourced anyway: the finder geocoded
its coordinates and got `Lawrence County` / `Spearfish city`, which is what the
guide's prose states. **The flag is withdrawn on both counts, and the record of
it is kept at O13.**

Five entries, one per place, all `place_slug` values resolving inside this
file.

---

## 4. Every omission, and why

### The three refuted claims

**O1 — "Meadowbrook Golf Course, Semi-Private, is the second publicly
accessible course." *Refuted, §6 U3 — and the refutation is itself now
overturned.* This entry is kept in full, exactly as it stood, followed by what
happened to it. A trail that quietly deletes its own strongest directive is
worse than one that is wrong in public.**

*As it stood:* southdakotagolf.com's Meadowbrook page is demonstrably corrupted:
it lists an Iowa phone number (515 area code) and nine-hole yardage/rating
figures for what is Rapid City's 18-hole course. `golfmeadowbrook.com` is a
parked domain; `meadowbrookgolfcourse.com` is a different course, in Anderson,
Indiana; rcgov.org 403s both tools. Not published in any form, per the verdict's
explicit "do not publish Meadowbrook or any access label for it." Replaced
entirely by Elkhorn Ridge Golf Club, ranked #4 on the same Golf Digest list and
carrying Golf Digest's own "Public" label — "a far stronger source than a
corrupted directory page," per the verdict.

*What happened to it:* **the page was not corrupted, and it was not about this
course.** Its own title reads "Meadowbrook Golf Course - Golf in Wellsburg, IA",
its address block reads "51 W 5th St / Wellsburg, IA 50680 / Phone:
515-869-3766", and its description reads "Meadowbrook Golf Course, located in
Wellsburg, is a Semi-Private course." The Iowa area code was an Iowa telephone
number. The nine-hole figures were a nine-hole course's figures. The
"Semi-Private" label — the specific thing that disqualified this course from the
guide — belongs to a course six hundred miles away, reached through a South
Dakota directory's slug collision. **Every observation in the verdict was
accurate and its conclusion was wrong**, because the page it was reading was the
wrong page and nothing on the page said so except the title.

Three things follow, and all three are the point of recording this rather than
overwriting it.

**The directive was reversed on the operator, not on the directory.** The
correction pass did not re-litigate the directory page; it went to the City of
Rapid City's own government directory, which carries the course under Parks &
Recreation's Golf Division with its phone number and its web link, then to the
operator's own footer, then to the booking portal's own club record — three
sources naming the same street address and the same telephone number. The SDGA's
own member list independently carries "Meadowbrook Golf Club / Black Hills /
Public / Rapid City / 605-394-4191". A bad third-party page is answered by
first-party evidence, not by a better third-party page.

**"Semi-Private" was never this course's label.** The published guide's access
statement rests on the operator's own headed "Non Member Tee Times" block and on
an executed tee sheet, not on any directory's access word. That is the shape
this corpus asks for anyway; the collision merely made it necessary.

**The strongest directive in a corrections brief is still only as good as the
page behind it.** This is the second time in this state that a same-named
business in another state produced a false finding — Section 4a lists four more
domains that did the same during the correction pass — and it is the one worth
carrying to the next state.

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

**O4 — any hotel, restaurant, or other non-golf place near Rapid City.
*Uncertain, §6 U4 — closed by the basecamp pass.* Kept as the record of a gap
that was real and got filled.**

*As it stood:* the visitrapidcity.com listing 403s curl and returns only site
navigation, no listing content, to WebFetch. No hotel or restaurant name was
recoverable by any method. Per the operating rule (publish only what a confirmed
verdict supports), none is invented and none is published — this is why the file
carries only two places instead of Oregon's nine. The one fact that *is*
independently confirmed — that Rapid City is the basecamp — rests instead on the
Census geocoder placing the course inside the incorporated place "Rapid City
city" (§3), not on the visitrapidcity.com listing, exactly as the verdict
directs.

*What happened to it:* the destination-marketing site is still unreadable —
Visit Rapid City's lodging directory renders client-side and returned no
property names to any request — and it is no longer the route. The basecamp pass
went to operators directly and returned three publishable places (Hotel Alex
Johnson, Rock Bar & Grill, Paddy O'Neill's Irish Pub) and one more that was
found and not published (O15). **The basecamp claim itself did not change**: it
still rests on the Census geocoder placing the course inside `Rapid City city`,
exactly as the verdict directed, and the guide's new section opens by saying so.
What changed is that the city now has named places in it. One half of O4 stands
unclosed and is carried forward as O16: no lodging nearer than 8.0 road miles
was established.

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
window is unpublished and unconfirmable from any source tried. **This applies to
the ranked course only.** The second course's booking horizon *was* established
by execution — the tee sheet goes empty from 21 September 2026 onward — and the
guide publishes it while stating in the same sentence that it is a rolling
horizon and not a closure, because 15 April 2027, inside the operator's own
season, returns nothing either. A horizon that is named as a horizon is not the
figure this rule bans.

### Added with the correction

**O13 — the unsourced county field, retired.** This file previously flagged
`Lawrence County` on `elkhorn-ridge-golf-club-spearfish` as its one field
tracing to no verdict, entered because `Ethos.Places.Place` requires a non-null
`county`. The place record is gone, its replacement's county is the Census
geocoder's on two independent points, and Elkhorn Ridge's own county is now
geocoded too. The flag is withdrawn. Kept here because a reader who wants to
know whether this guide ever carried an unsourced county deserves the answer:
it did, it said so at the time, and the correction closed it.

**O14 — City Council Fee Resolution 2025-130 as an independently confirmed
document.** The operator cites it beside its own fee table and the guide quotes
the operator citing it — "Fees were approved by City Council Fee Resolution
2025-130" — which is a quotation of a citation, not a verification of one. The
finder could not locate the resolution on the city's own site within the URL set
it pulled. The guide's sentence is accurate as written and would not be if it
dropped the attribution, so the attribution is load-bearing rather than
decorative.

**O15 — a place record for Juniper at Vertex Sky Bar.** The basecamp report
covers it as fully as the two published restaurants: its own copy, "Now Open to
the Public!", daily hours to midnight and to 2AM at weekends, dinner service
4PM to 9PM, an OpenTable channel and a reservations line. It is named in the
guide's prose with its hours and its reservation channels, and it has no place
record. The reason is composition, not sourcing: the hotel, the pub inside it
and the clubhouse restaurant at the course give a reader a place to sleep and a
meal at each end of the day, and a third dining record in the same building
would pad the section rather than extend it. The Starbucks in the same building
is named for completeness, matching the operator's own count of three outlets,
and likewise has no record. **Both omissions are editorial trims of confirmed
material, not sourcing gaps**, and both are recoverable from the basecamp report
if a later pass wants them.

**O16 — any lodging nearer to the course than 8.0 road miles.** Carried forward
from O4's unclosed half. Visit Rapid City's lodging directory renders
client-side and yielded no property names, addresses or URLs, and no chain-hotel
domain along the approach roads was guessed at — the basecamp report says why in
its own words, and Section 4a is the third instance in this state of a plausible
domain belonging to a same-named business elsewhere. **The absence of a nearer
hotel in this guide is a gap, not a finding**, and the guide claims nothing
about what does or does not sit closer. Any pass with working web search should
retry this one point.

**O17 — the happy-hour and beer-bucket price lists at both pubs, and at the
clubhouse restaurant.** All three publish standing price lists; none carries a
dated qualifier from its operator. The basecamp report read them and rejected
them under the price rule rather than missing them, and the guide states the
rejection in its own sentence rather than leaving a silent gap. The same rule
that lets Meadowbrook's fees publish — a visible, operator-authored dated
heading — is what excludes these.

**O18 — the hotel's management company.** O'Rourke Hospitality is linked from
the hotel's own footer and is recorded in the basecamp report as read off the
operator's site, not independently confirmed. Not published: a management
company establishes nothing a traveller acts on, and the trading-status record
already rests on the dated events page.

**O19 — the "Alex Johnson Hotel" title-tag variant.** The hotel's page title
reads "Alex Johnson Hotel" while its body copy, its property selector and
Hilton's own URL slug read "Hotel Alex Johnson". The latter is what publishes.
The variant is flagged, not resolved, in the same register as the Birkdale
Dr/Rd discrepancy above.

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
  list pattern 16 bans — because no sourced fact in this state supports a
  bearing claim at all. Every spatial relation in the file is a road mileage, a
  named-road route, or a shared county and city.

**Re-run after the day-two correction and the basecamp addition.** The corrected
`south-dakota.json` was checked with `Ethos.GolfProse.banned_phrases/1` over
every string in its published structure and returned `[]`, with the allowlist
still `[]`. The two rewritten sections roughly doubled the file's prose and
brought in a class of string this state had not carried before — opening hours —
so the new phrasings were checked one by one:

* **"5.8 road miles"**, **"48.3 road miles"**, **"8.0 road miles"**, **"9.3 road
  miles"** — mileages with named endpoints, no direction word, no duration.
* **"8AM to 2AM"**, **"7:00 AM to 10:00 PM"**, **"4PM to 9PM"**, **"08:10 AM"** —
  clock times, not intervals. Pattern 1 bans a digit followed by "minute" or
  "minutes"; a clock time carries neither, and no opening hour in this file is
  expressed as a duration.
* **"online 24/7"** — the operator's own quoted string. It is a slash-separated
  pair of numerals, not a digit-plus-hours travel phrase; pattern 21 requires a
  travel word after "hours" and there is no "hours" here at all.
* **"Muirfield Drive to Sheridan Lake Road, then Jackson Boulevard and West Main
  Street"** — a named-road route, which is what the proximity patterns exist to
  push authors toward. The route publishes as roads because roads are what OSRM
  returned; no bearing was invented to shorten it.
* **"Industry Night on Mondays"**, **"karaoke on Tuesdays"**, **"music bingo on
  Wednesdays"** — recurring weekday schedules. The self-dating patterns ban
  "next Monday" and "this coming Monday", not a standing weekly programme, for
  the reason the module records beside pattern 28: a recurring schedule is not a
  date.
* **"open since July 1, 1928"**, **"September 24-26, 2026"**, **"January 29 -
  February 6, 2027"** — absolute dates, which are the useful content and which
  the self-dating patterns are explicitly built to let through.

One sentence was watched closely and passes: Section 4's own correction line,
"it was this guide's second course on rank rather than on distance." It carries
no date, no offset from an unstated now, and no claim that stops being true — it
describes this guide's own history. Written as "until recently" it would have
fired, and deserved to.

---

## 6. Roster row (for the roster agent)

Course: **The Golf Club At Red Rock**. Basecamp: **Rapid City, South
Dakota**. County: **Pennington County**. Access: non-members book through the
club's own online tee sheet, hosted at redrock.cps.golf (Club Prophet
Systems), or by phone at (605) 718-4710; the advance-booking window is not
published anywhere and could not be established from the booking engine
(Cloudflare-blocked), the operator's own site, or any archived snapshot.
Second course: **Meadowbrook Golf Club**, Rapid City, Pennington County, 5.8 road
miles — superseding the **Elkhorn Ridge Golf Club**, Spearfish first handed off,
per the correction of record at the top of this file. Places: 5. Entries: 5.
Gate: **0 failures**, no allowlist entries. Nothing the gate would
have caught was ever drafted; the one deliberately excluded number is the
ranked course's advance-booking window, named as unpublished rather than guessed
at, per the "searched: blocked" sourcing on this state. The second course's own
booking horizon is published, and published as a horizon rather than as a
closure.

`priv/seed_data/golf_courses_roster.json` was not touched by this task — its
`south-dakota` row remains the unverified stub, owned by the finalize agent.
