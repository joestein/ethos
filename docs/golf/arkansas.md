# Arkansas — Mystic Creek Golf Club: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/arkansas.json`,
modeled on `docs/golf/oregon.md`, the checkpoint file this wave's shape copies.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/arkansas-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **41
   confirmed · 6 refuted · 4 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/arkansas-finder.md` — the
   finder. Context only. Where the two disagree, the verdicts file wins.
3. `priv/seed_data/golf/oregon.json` — the structure this file's JSON copies.

**The governing rule, carried from Oregon's trace:** a verdict vouches only for
what its own text restates, not for every clause of the sentence the finder
wrote around it.

**4 places, 4 entries, 1 guide, 5 sections, 5 FAQ answers, 0 photos.**

---

## 0. The two failures the verifier caught in the finder, and why they matter

**The finder called the closure calendar an unreachable JS gap. It was not.**
The finder stopped at the static HTML of `/about-us/calendar` and reported
"specific closure dates could not be retrieved." The verifier followed the
page's own script, `calendar_ajax.js`, to the data endpoint it names —
`/api/ClubData/web/GetClubCalendar/public` — and that endpoint answers `curl`
with **no authentication**. Querying it with the page's own default filter
(`navSection=PUBLIC`) returns zero items, which is what made the calendar look
unreachable; querying the same endpoint with an empty `navSection` returns
the full 24-item event set. This is a filter effect, not an auth effect,
verified across four parameter combinations. The endpoint surfaces the guide's
single most actionable fact: **the club is closed 14-20 September 2026 for the
El Dorado Shootout**, on top of a standing weekly Monday closure. A finder that
declines to probe a "JS calendar" and a guide that omits a seven-day closure
are the same failure wearing two hats — this is why the correction says to put
the closure in the intro and the FAQ, not bury it in a closures section alone.

**The finder fabricated a quotation while getting the figure right.** The
finder wrote that Golf Digest's course subpage "states 'Green Fees: $179
(course notes pricing varies by timing)'." That string does not exist on the
page. The verifier searched the raw HTML: the label is **`Price`**, the value
is **`$179`**, and the adjacent tooltip reads, verbatim, "This covers all
ranges of greens fees. Please check with the course on specific timing and
pricing." The number the finder reported was correct and the date behind it
(the record's `updatedAt` field, 15 December 2025) was correct; only the
wording inside quotation marks was invented. This is the mildest form of the
failure and the easiest to miss, because a reader checking only the dollar
figure would find nothing wrong. Publishing a fabricated quotation trains a
reader to trust quotation marks that do not correspond to any source text —
this file quotes Golf Digest's actual label ("Price") and actual note, never
the finder's invented sentence.

---

## 1. The guide

`slug: arkansas-golf-guide` · `destination: "El Dorado, Arkansas"` ·
`state: "Arkansas"` · `county: "Union County"` · `photos: []`

### Intro

| Published | Verdict |
|---|---|
| "places Mystic Creek Golf Club third in Arkansas, labelled \"Public\"" | §1 — confirmed, three independent methods (HTML badge, embedded JSON, WebFetch transcription), all agreeing |
| "The two courses ranked above it, The Alotian Club and Blessings Golf Club, are both labelled Private" | §1 — confirmed, `private:true` on both, badge and JSON agree |
| "sits in unincorporated Union County near El Dorado" | §5 — confirmed, geocoder returns Union County and no Incorporated Place; control point proves the layer works |
| "designed by Kenneth Dye, Jr., ASGCA with Finger Dye & Spann" | §6 — confirmed, both Golf Digest surfaces name the architect; operator names none |
| "the operator's own site states it opened in May of 2013, and Golf Digest lists no year for the course at all" | §6 — resolved: not a discrepancy, an absence (`yearOpened: null`, no field on the subpage) |
| "closed 14-20 September 2026 for the El Dorado Shootout" | §4 — confirmed, calendar item id 6587707, corroborated by the public event page |
| "standing weekly Monday closure" | §4 — confirmed, Hours of Operation page, all three golf blocks |

No trip duration and no relative date appear in the intro. The closure dates
are absolute (`14-20 September 2026`), per the corrections note that this
guide must carry no self-dating language.

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`.

| Published | Verdict |
|---|---|
| address, 191 Clubhouse Drive, El Dorado, Arkansas 71730 | §5 — confirmed, operator's Directions page and every page footer |
| ELD, 5.96 road miles | §5 — confirmed, OSRM driving route, re-run by the verifier |
| Little Rock (Bill and Hillary Clinton National Airport), 124.25 road miles | §5 — confirmed, OSRM driving route; verifier's figure (124.25) supersedes the finder's rounding (124.24) |
| geocoder result: Union County, no Incorporated Place, control point confirms the layer | §5 — confirmed, both runs re-executed by the verifier |
| "El Dorado itself is the county seat of Union County, on the southern border of Arkansas" | §5 — confirmed, paraphrased from Wikipedia's raw wikitext rather than quoted, per the verdict's own instruction that the finder quoted a de-markup'd rendering, not a verbatim source string |

**Omitted: "~4-6 road miles from city limits."** §5, uncertain — the finder
gives no route or source for this figure and the verifier did not reproduce
it. See omission O1.

### Section 2 — `The course`

| Published | Verdict |
|---|---|
| rank #3, 4.4 from 6 panelists, "Best In State  Previous rank: NR", no editorial blurb | §1 — confirmed |
| Golf Digest course-page badge, rank pill, About block | §1 — confirmed, raw HTML |
| the access sentence, quoted whole: "Operating as a semi-private club, Mystic Creek has membership opportunities available and is also open to the public." | §2 — confirmed verbatim. Per the correction, this is the guide's key quote and a source qualifying itself, **not** a contradiction, and it is framed that way here |
| facility type "Daily Fee" (Golf Digest) | §6 — confirmed |
| Public Tee Times routes to a login-free booking page; Member Tee Times is separate | §2 — confirmed. The booking page loads for an anonymous visitor at 200 with no login required |
| "Membership status affects only a loyalty discount tier … not whether a visitor can book" | §2 — confirmed. The only member-gated thing found is price (a Troon "Access Premium Rates" / "Premium+" discount tier), not access |
| "no advance-booking window, sponsor requirement or residency rule appears anywhere" | §2 — confirmed negative; the Guest Information page states only pace-of-play and attire |
| architect credit, and that the operator repeats it nowhere | §6 — confirmed; grepped for "Dye", "architect", "designer", "designed", "Finger", "Spann": zero hits on the operator's site |
| "Golf Digest lists no year opened … the operator's own Golf page states the course 'opened in May of 2013.'" | §6 — resolved. Published plainly, per the correction, as one source being silent rather than a conflict |
| Golf Digest's $179 price, dated by the record's own last-updated timestamp of 15 December 2025 | §3 — confirmed. The label is "Price"; **the finder's quoted string does not appear anywhere in this file** — see §0 above |
| Golf Digest's own note quoted verbatim: "covers all ranges of greens fees … check with the course on specific timing and pricing" | §3 — confirmed verbatim |
| "No dated green-fee figure appears anywhere on the operator's own site" | §3 — confirmed. The verifier searched further than the finder: zero PDFs, no rates on the outings, rewards or membership pages, and the two TripFusion checkout payloads carry `"base_price": null` throughout |
| the club's own Golfweek award claims, given as claims the club makes about itself, including the page's own internal #37/#38 inconsistency | §6 — confirmed that the club makes these claims; **not confirmed that any of them is true**, per the correction. Framed here exactly that way, and never presented as this guide's ranking anchor |

**Omitted: any of the Golfweek claims stated as fact** (item 4 in "What must
not be published"). Published only as the club's own claims, with the
internal #37/#38 contradiction preserved rather than smoothed over, matching
the verdict's instruction to preserve it.

### Section 3 — `Closures and tournaments`

| Published | Verdict |
|---|---|
| weekly Monday closure, all three golf blocks | §4 — confirmed, Hours of Operation page |
| closed 14-20 September 2026 for the El Dorado Shootout, event page quoted verbatim | §4 — confirmed, calendar item 6587707 and its public event page |
| Stroke Play Championship 5-6 September 2026 | §4 — confirmed, calendar |
| Share Foundation Tournament 26 September 2026 | §4 — confirmed, calendar |
| SAU Mulerider Invitational 16 October 2026 | §4 — confirmed, calendar |
| Mystic Cup 17-18 October 2026 | §4 — confirmed, calendar |
| monthly One-Man Scramble events | §4 — confirmed, calendar |

**Omitted, deliberately: the 8 September 2026 closure.** The verifier's own
calendar fetch shows a `Closed` item on 8 September 2026 (id 6587703). Per the
explicit correction for this wave, **this date must not be published**: three
independent states in this programme found empty inventory on the same date
via three different booking platforms, which is far more likely a shared query
artefact across all three tools than three coincident real closures. A named
event (the El Dorado Shootout, with its own calendar entry and its own public
event page) publishes; a single inventory-inferred date does not. See omission
O2.

**Omitted: "no tournament hosting … found in any source checked."** This was
the finder's negative, refuted by the verifier's own calendar read. The
calendar lists five named events plus a recurring one, all published above.

### Section 4 — `Basecamp: El Dorado`

| Published | Verdict |
|---|---|
| The Mystic Grill description, quoted verbatim | §7 — confirmed verbatim, operator's Dining page |
| "Both of the operator's own pages that state hours agree only that the Grill is closed Monday" | §7 — uncertain as to precise hours (the Dining page and the Hours page give materially different weekday/Sunday schedules); published exactly as instructed — the Monday closure only |
| The Haywood El Dorado, Tapestry Collection by Hilton, named from the Stay & Play package quote | §7 — confirmed, operator's Stay & Play page |
| "the page states a per-person, per-night package price but attaches no date and no season … this guide names the package without repeating that figure" | §3 — confirmed the $197 figure exists, undated, no season stated. **Omitted per the prose rule that prices publish only with the source's own date attached** — see omission O3 |

### Section 5 — `Day two: Lions Club Municipal`

| Published | Verdict |
|---|---|
| address, 1420 E 19th Street, El Dorado, Arkansas 71730 | §7 — confirmed, GolfLink's embedded schema.org block |
| "Public," 18 holes, par 72, 6,282 yards, slope 107, rating 69, driving range, "Opened in 1954" | §7 — confirmed, GolfLink raw HTML |
| City of El Dorado tourism site lists it as a venue | §7 — confirmed, `goeldorado.com/venue/lions-club-golf-course/`, a bare stub with no operating detail |
| Wikipedia: "City parks include Lions Club Park and Golf Course" | §7 — confirmed |
| "$33 estimate … not repeated" | §7 — confirmed the figure exists and is GolfLink's own undated estimate, explicitly caveated by GolfLink as "Actual rates may vary." **Omitted per the same undated-price rule** — see omission O3 |
| "No operator website for Lions Club Municipal could be reached, so this guide makes no claim about its current hours" | §7 — uncertain; the verifier found no operator site, only the third-party directory and the city stub |

### FAQ

Five questions. The gate requires one matching `play|tee time|tee times|book`;
the first does.

* "How do I book a tee time at Mystic Creek Golf Club?" — the access quote
  (§2), the login-free Public Tee Times path, and **both closures** (weekly
  Monday and 14-20 September 2026), per the correction's instruction that the
  FAQ must carry both.
* "Is Mystic Creek Golf Club closed anytime soon?" — restates both closures
  with the calendar's own verbatim event text.
* "What does a round cost?" — the Golf Digest $179 figure, dated, with the
  source's own qualifying note.
* "Where is Mystic Creek Golf Club?" — address, county framing, both airport
  distances.
* "Which course should I play on day two?" — Lions Club Municipal, from
  GolfLink's own page.

---

## 2. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum: the ranked course and one second
course.

| slug | kind | rests on |
|---|---|---|
| `mystic-creek-golf-club-el-dorado` | `golf-course` | §1, §2, §4, §5, §6 |
| `lions-club-municipal-golf-course-el-dorado` | `golf-course` | §7 |
| `haywood-el-dorado-hotel` | `hotel` | §3, §7 |
| `mystic-grill-el-dorado` | `restaurant` | §7 |

Every one of the four has `photos: []`, as does the guide. No photo scout has
run for this state.

**No `address` field on the Lions Club Municipal or hotel/restaurant places.**
The Mystic Creek course's own address and the Lions Club course's own address
are both stated in prose (summary and section body) rather than in a
dedicated `address` field, matching Oregon's precedent of not inventing a
field structure the source data doesn't populate through `DataGuide`.

**`status: "open"` on all four is not a trading claim**, per `DataGuide`'s
convention carried from Oregon. The Mystic Grill's hours uncertainty and the
Lions Club operator gap are both honoured in prose, which is where a trading
claim would otherwise live.

Four entries, one per place, all `place_slug` values resolving inside this
file.

---

## 3. Every omission, and why

**O1 — "~4-6 road miles from city limits."** Uncertain, §5. The finder gives
no route or source; the verifier did not reproduce it. The two sourced OSRM
figures (5.96 miles from ELD, 124.25 miles from Little Rock) publish instead.

**O2 — the 8 September 2026 closure.** Confirmed to exist on the calendar
(item 6587703, `Closed`) but excluded by explicit correction: three states in
this programme independently found empty inventory on the same date via three
different booking platforms, which reads as a shared query artefact rather
than three coincident closures. Named events publish (the El Dorado Shootout,
with its own calendar entry and event page); a single inventory-inferred date
does not.

**O3 — both undated prices: the $197 Stay & Play package rate and the $33
Lions Club Municipal estimate.** Both are confirmed to exist in §3 and §7
respectively, and both are explicitly undated (the Stay & Play page states no
date or season; GolfLink's estimate carries no date and is self-labelled an
estimate). Per this wave's rule that prices publish only with the source's own
date attached, neither figure is published; both packages/venues are named
without their price.

**O4 — the finder's fabricated quotation, "Green Fees: $179 (course notes
pricing varies by timing)."** Never published. See §0 above for the full
account: the label is "Price," not "Green Fees," and the string in quotation
marks does not exist on the page. The correct figure ($179) and its correct
date (15 December 2025, from the record's own `updatedAt` field) are
published, attributed to Golf Digest, not to the operator.

**O5 — any claim that Golf Digest and the operator disagree about the year
opened.** Resolved, not refuted: Golf Digest states no year at all. Published
plainly as the operator's unopposed statement, per §6.

**O6 — any Golfweek award claim stated as settled fact.** Confirmed only that
the club makes these claims about itself, including their own internal
#37/#38 contradiction. Published as the club's claims, never as this guide's
ranking anchor, which remains Golf Digest's Best in State #3, "Public."

**O7 — "no tournament hosting … found in any source checked."** Refuted by the
verifier's own calendar read, which lists five named tournaments and a
recurring monthly event. All are published in the Closures and tournaments
section.

**O8 — "specific closure dates could not be retrieved."** Refuted. This is the
single most consequential correction in this file — see §0. The calendar
answers `curl` with no authentication once queried without the page's own
default filter, and the resulting closures are the guide's headline fact,
carried in the intro and both required FAQ answers.

**O9 — precise Mystic Grill hours.** Uncertain, §7. The operator's Dining page
and Hours of Operation page give materially different weekday and Sunday
schedules for the same restaurant. Only the Monday closure, which both pages
agree on, is published.

**O10 — any claim that Lions Club Municipal's current hours or rates are
known.** Uncertain, §7. No operator website could be reached; only a
third-party directory and a bare city tourism stub exist. Its existence,
location and public-access label are confirmed and published; its current
condition is not.

**O11 — every photo.** `guide.photos: []` and `photos: []` on all four
places, matching the gate's requirement and Oregon's precedent.

**O12 — any relative or self-dating phrasing.** Per the newly gated rule, all
closure and tournament dates are stated in absolute form ("14-20 September
2026", "5-6 September 2026") with no "today is," "days away," or "next week"
construction anywhere in the file.

---

## 4. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, first run. No allowlist entry was added;
`Ethos.GolfProse`'s allowlist remains `[]`.

No banned phrasing was drafted into this file and then removed — the closure
and distance sentences were written directly in checkable, absolute form
("5.96 road miles," "closed 14-20 September 2026") because Oregon's and
Kansas's traces already record which shapes fail (vague proximity, spelled-out
minutes, and self-dating offsets like "eight days away"), so those shapes were
avoided from the first draft rather than caught and rewritten.

**What the gate does not catch, per its own moduledoc's §7 rung (c):** an
unsourced containment claim reads identically to a sourced one next to it.
This file's defence is this trace, not the regex — every spatial and price
claim above is tied to a verdict citation, and every omission is recorded with
its reason rather than silently dropped.

---

## 5. Roster row

`priv/seed_data/golf_courses_roster.json` was **not modified** for this wave,
per this task's explicit instruction not to touch that file. Any roster entry
for Arkansas is out of scope here.
