# Oklahoma — Jimmie Austin: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/oklahoma.json`,
following the register kept for every state at `docs/golf/oregon.md`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/oklahoma-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **34
   confirmed · 7 refuted · 6 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/oklahoma-finder.md` —
   the finder. Context only, and its central access claim is the one the
   verifier overturned.

**5 places, 5 entries, 1 guide, 5 sections, 5 FAQ answers, 0 photos.**

---

## 0. The headline: the finder's central access claim is refuted

The finder logged `theougolfclub.com` as "membership-structured with no public
rates or booking page at all," and recorded "no dated green fee" and "no
stated booking window" as gaps.

**All three are wrong**, and this is the central lesson this file exists to
record: **marketing pages describe access; booking engines enforce it.** The
finder's `href` enumeration of the raw HTML could not see the club's
"Book a Tee-Time" button because it is injected by JavaScript — a
`window.chronogolfSettings` block and a script loader, not an `<a href>`. The
verifier followed that widget rather than trusting the finder's negative
finding: it resolves to `chronogolf.com/club/jimmie-austin-golf-course`, a
public marketplace listing with no login wall. The listing's own
configuration then answers the two remaining gaps directly —
`defaultPublicBookingRange: 7` — and the booking API supplies independent,
second-source confirmation of the same number in its own refusal text:
*"You are out of your booking range. The player type \"Public\" can only book
7 days in advance."* Two independent reads of the same rule, from two
different endpoints on the same operator's own systems, is why the seven-day
window ships as a confirmed fact rather than a single citation.

The dated green fee gap closes the same way: the verifier read the club's own
public tee sheet directly, on 6 September 2026, and quoted $105.75 weekday /
$133.33 weekend for 18 holes plus $18.39 for a shared cart — the club's own
`green_fee`, `half_cart` and `subtotal` fields, not an inference.

---

## 1. The guide

`slug: oklahoma-golf-guide` · `destination: "Norman, Oklahoma"` ·
`state: "Oklahoma"` · `county: "Cleveland County"` · `photos: []`

### Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| course | Jimmie Austin Golf Club at the University of Oklahoma | §1 — confirmed by three independent methods (live WebFetch, raw-HTML block parse, embedded JSON) that agreed on all 15 ranking positions and all 15 labels |
| rank / label | 5th, "Public," the only non-Private entry in the fifteen | §1 — confirmed |
| facility (2nd course) | Westwood Golf Course, City of Norman | §4, "the second public course — found" — confirmed |
| city | Norman | §1 (raw subtitle "Norman, OK") — confirmed |
| county | **Cleveland County** (GEOID 40027) | §2 — confirmed on two independently sourced coordinate pairs (OSM way 315995643 and Golf Digest's own, separate coordinates), both resolving to the same county and the same incorporated place, Norman city |

`destination: "Norman, Oklahoma"` is the basecamp city: both named lodging and
dining options (Montford Inn, The Mont) and both golf courses sit in Norman.

### Intro

| Published | Verdict |
|---|---|
| "places Jimmie Austin Golf Club at the University of Oklahoma fifth and labels it \"Public\" — the only course on the fifteen-course list carrying that label" | §1 — confirmed; the table shows Jimmie Austin as the sole `private: false` / "Public" row among fifteen |
| "every other entry, including the four ranked above it (Southern Hills Country Club, Oak Tree National, Karsten Creek Golf Club and The Patriot Golf Club), is \"Private\"" | §1 — confirmed, each independently backed by `private: true` in the embedded JSON |
| "4 Ransom Drive in Norman, Cleveland County" | §4 confirmed ("Operator identity and address"), §2 confirmed (county) |
| "the U.S. Census Bureau's geocoder, run on two independently sourced coordinate pairs for the course, returns Cleveland County (GEOID 40027) and Norman city both times" | §2 — confirmed, the control-point check against a wrong-coordinates failure mode |
| "Perry Maxwell designed the course, which the club's own Club History page says opened for play in January 1951 (Golf Digest's course page instead states \"Year Opened: 1952\")" | §4 confirmed (architects, verbatim quote) and §4/§5 confirmed-as-conflict (year-opened discrepancy, item 4 under Uncertain) — both years published, neither chosen |
| "Robert E. Cupp renovated it in 1996 and Tripp Davis in 2017" | §4 — confirmed, Club History quotations |
| "home course of the University of Oklahoma men's and women's golf teams" | §4 — confirmed |
| "the club's own site opens a Chronogolf (Lightspeed Golf) public-booking widget, injected into the page by JavaScript rather than written as an ordinary link, resolving to chronogolf.com/club/jimmie-austin-golf-course, where the public player type can book up to seven days ahead" | HEADLINE section — confirmed, two independent readings (widget config, API error string) |
| "This guide's second course is Westwood Golf Course, a City of Norman municipal course" | §4, second-course section — confirmed |

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`.

| Published | Verdict |
|---|---|
| "4 Ransom Drive, Norman, Oklahoma 73019" | §4 confirmed, contact page quoted verbatim |
| "\"Our new address is 4 Ransom Drive and is not located on Google maps yet\"" | §4 confirmed, contact page verbatim |
| "Golf Digest's course page instead shows the older \"1 Par Drive\"" | §4, refuted-item 7 — the finder's unreconciled three-address puzzle is resolved: 4 Ransom Drive is current, "1 Par Drive" is stale, and the Nominatim polygon label is unstable (shown to change between finder and verifier passes) and is therefore **not published as an address at all** |
| Will Rogers International Airport, 23.2 miles by road | §4 — confirmed, OSRM routing, identical to the finder's figure |
| named roads (South MacArthur Blvd, SW 104th St, NW 27th St, Shields Blvd, I-35/US-77, W Lindsey St, 24th Ave SW, OK-9, Imhoff Rd, Jenkins Ave, E Constitution St) | §4 — confirmed, taken directly from OSRM's own turn-by-turn steps, airport→course direction |
| Cleveland County, on OSM coordinates and again on Golf Digest's own, separate coordinates | §2 — confirmed, the two-coordinate-source control |

**No drive duration published anywhere in this file.** Only the OSRM road
mileage (a distance, never a time) is used, matching the Oregon precedent of
naming a road distance rather than converting it to a duration.

### Section 2 — `Jimmie Austin Golf Club at the University of Oklahoma`

| Published | Verdict |
|---|---|
| rank 5, "Public," only non-Private entry in the fifteen | §1 — confirmed |
| Perry Maxwell design; "opened for play" January 1951 (Club History) vs. Golf Digest's "Year Opened: 1952" | §4 confirmed / §5 uncertain-4 — both years published, neither chosen, exactly as the verdict directs |
| Robert E. Cupp, ASGCA, 1996 renovation; Tripp Davis, "an OU graduate and member of the 1989 OU Men's National Championship Golf Team," 2017 renovation | §4 — confirmed, Club History verbatim |
| home course of OU men's and women's golf teams | §4 — confirmed |
| course card: 18 holes, par 72, nine tee sets, Championship 7,452 yd / 77.9 rating / 142 slope (club's own Chronogolf record) vs. Golf Digest's 7,387 yd at the same slope | §4 confirmed / §5 uncertain-5 — both figures published; the club's own record on its own course is treated as authoritative, per the verdict's own framing ("the operator's own figure governs") without deleting the conflicting Golf Digest figure |
| 1997 Oklahoma State Amateur and NCAA Regional; Big 12 Women's Championship 1998 and 2010; U.S. Amateur Public Links Championship 2009; U.S. Women's Amateur Public Links 2013; NCAA Regionals 2012/2018/2022 (men), 2013/2019 (women) | §4 — confirmed, Club History verbatim list |
| "In 2023, Golfweek named 'The Jimmie' the No. 6 Campus Golf Course in the country, and No. 1 in the Southeastern Conference." | §4 — confirmed, OU Athletics facilities page, quoted verbatim exactly as sourced (the SEC reference is the source's own words, not this guide's construction) |

### Section 3 — `Playing it as a public golfer`

This is the corrected access paragraph, and it is where the finder was wrong
in every direction the HEADLINE describes.

| Published | Verdict |
|---|---|
| site-wide "Book a Tee-Time" button, Chronogolf (Lightspeed Golf) widget, injected by JavaScript | HEADLINE — confirmed, raw HTML quoted from two separate pages of the site-wide theme |
| resolves to chronogolf.com/club/jimmie-austin-golf-course, no login wall | HEADLINE — confirmed, followed through the widget's own URL builder and the 301 redirect chain |
| `"defaultPublicBookingRange": 7` | HEADLINE — confirmed, from the marketplace `__NEXT_DATA__` record |
| `"You are out of your booking range. The player type \"Public\" can only book 7 days in advance."` | HEADLINE — confirmed verbatim, the booking API's own error string, the second independent confirmation of the same number |
| $105.75 weekday / $133.33 weekend, 18 holes, $18.39 shared cart, paid at the course, as of 6 September 2026 | HEADLINE — confirmed, the club's own tee sheet fields `green_fee`, `half_cart`, `subtotal`, dated to the read |
| `"singlePlayerRestrictionActivated": true`; a single golfer cannot book alone online, must join a group or call (405) 325-6716 | HEADLINE / §1 marketplace record — confirmed |
| forecaddie $10 plus a suggested cash tip, requested when booking | §4 confirmed, Guest Information page verbatim ("Only $10 additional green fee plus tip!") |
| Friday, 18 September 2026, "Coach Stoops HBC Golf Classic" posted on the tee sheet | §3 — confirmed, the one hit in a 60-consecutive-day sweep of the club's own tee-sheet-notes endpoint |
| no OU home tournament at Jimmie Austin this season; women's Schooner Fall Classic (19-21 Sep 2026) at Belmar Golf Club, a different Norman course; women's Bruzzy (8-9 Sep 2026) at Trophy Club Country Club, Dallas | §3 — confirmed, parsed from the men's and women's `__NUXT_DATA__` schedule payloads; not one men's venue is in Oklahoma, and the two Oklahoma-adjacent items on the women's schedule are named precisely so a reader does not conflate Belmar with Jimmie Austin |

**8 September 2026 is deliberately absent from this file.** See omission O1.

### Section 4 — `Basecamp: Norman`

| Published | Verdict |
|---|---|
| Montford Inn, 322 W Tonhawa St, Norman, Oklahoma 73069, (405) 321-2200 | §4 confirmed, address from the site's own footer |
| The Mont, 1300 Classen Boulevard, Norman, Oklahoma 73071, "The Mont has been locally owned and operated right outside of the University of Oklahoma since 1976." | §4 confirmed, and this exact phrasing is §7's own prescribed substitute for the "landmark" claim that must not publish (see omission O2) |

### Section 5 — `Day two: Westwood Golf Course`

| Published | Verdict |
|---|---|
| 2400 Westport Dr, Norman, Oklahoma 73069, (405) 292-9700, open year-round | §4, second-course section — confirmed |
| "Westwood is one of Oklahoma's premier public courses" | §4 — confirmed verbatim, the city's own page |
| "The 6200-yard course was recently renovated and features wide, tree-lined fairways and gently contoured greens, twenty traps and several water hazards." | §4 — confirmed verbatim |
| "All Fees include tax"; Regular $35.00, 2:00 pm $29.00, 5:00 pm $24.00, 9 holes $24.00, senior $21.00, junior $10.00; carts 18-hole $40.00/$20.00, 9-hole $22.00/$11.00; range half-bucket $5.00 | §4 — confirmed exact, all figures the operator's own, tax-in as stated. **Dated** here as "current as of a 6 September 2026 reading of its own site" — the verifier's own read date — since the operator's page carries no dateline of its own; the rule that a price publishes only with a date attached is satisfied by naming when the site was read, the same construction already tested clean in the gate's own publishable-specimen list. |
| Book a Tee Time → westwoodpark.cps.golf | §4 — confirmed |
| The Turn Grill on site | §4 — confirmed |
| September 2026 events: 13 September NHS reunion tournament; 25 September City of Norman United Way Scramble, 9 a.m. shotgun | §4 — confirmed, the course's own posted events |

### FAQ

Five questions. The gate requires one matching `play|tee time|tee times|book`;
the first question matches on both "tee time" and "book."

* "How do I book a tee time at Jimmie Austin?" — the HEADLINE-section
  correction in full: the JS-injected widget, the public marketplace URL, the
  seven-day window from both independent sources, the dated fee, and the
  single-player restriction.
* "What does a round cost at Jimmie Austin?" — the same dated fee, restated
  on its own so a reader scanning FAQs for price does not have to read the
  access mechanics first.
* "Is Jimmie Austin closed on any date this September?" — the confirmed 18
  September closure notice, plus the confirmed absence of any OU home
  tournament, so a reader is not left to wonder whether the team's schedule
  closes the course beyond the one dated event.
* "Where is Jimmie Austin Golf Club?" — county, address, and the address
  correction (4 Ransom Drive over the stale "1 Par Drive").
* "Which course should I play on day two?" — Westwood Golf Course, its dated
  fee and its booking route.

---

## 2. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum: the ranked course and one
second course.

| slug | kind | rests on |
|---|---|---|
| `jimmie-austin-golf-club-norman` | `golf-course` | §1 (rank/label), §2 (county), §4 (architects, history), HEADLINE (access, fee, booking window) |
| `westwood-golf-course-norman` | `golf-course` | §4, second-course section |
| `montford-inn-norman` | `hotel` | §4 ("Montford Inn," address and phone only) |
| `the-mont-norman` | `restaurant` | §4 ("The Mont," address and the §7-prescribed self-description) |
| `the-turn-grill-westwood-norman` | `restaurant` | §4, second-course section ("The Turn Grill on site") |

Every one of the five has `photos: []`, as does the guide. No photo scout has
run for this state and the licence gate requires any referenced photo to
exist on disk, so none is claimed.

**No trading claim beyond `status: "open"` on any of the five**, per
`Ethos.Seeds.DataGuide`'s moduledoc convention (also recorded in
`docs/golf/oregon.md` §2): `"open"` renders nothing and is the absence of a
closed claim, not an assertion that a venue is trading today.

Five entries, one per place, all `place_slug` values resolving inside this
file.

---

## 3. Every omission, and why

### The refuted claim, corrected in full

**O0 — "no public rates or booking page at all," "no dated green fee," "no
stated booking window."** *Refuted, HEADLINE and §4 items 1-3.* All three
replaced by the corrected access paragraph: the JS-injected Chronogolf widget,
the public marketplace URL, the seven-day window (confirmed twice, by the
widget config and by the API's own refusal text), and the dated green fee
read directly from the club's own tee sheet.

### The instructed omission

**O1 — Tuesday, 8 September 2026: no closure is published for this date.**
The verifier's own tee sheet found zero bookable slots that day against
forty-nine on every neighbouring day, and logged it as **uncertain** — no
posted note, no OU event, and no confirmed cause; possibly a maintenance day
shifted off a Labor Day Monday, possibly not, and the verifier explicitly
declined to publish either a cause or "closed Tuesdays." Layered on top of
that: the dispatching brief for this file records that **three states in this
programme independently found an empty tee sheet on this same date, via three
different booking platforms** — a pattern far more consistent with a shared
query artefact across the sweep than three unrelated closures, and no
operator page anywhere announces anything for that date. On that basis this
file omits 8 September entirely rather than publish an unexplained blank as a
closure. This is a stronger omission than the verifier's own "report as
observed" recommendation, made deliberately and recorded here so the
divergence from the source document is visible.

**O2 — "The Mont" is not described as a "landmark."** *§7, "what must not be
published."* The finder's "landmark" wording is, per the verifier, a customer
review quoted in the site's own review carousel, not the restaurant's words
about itself. Published instead is the verifier's own prescribed substitute,
the restaurant's factual self-description: "locally owned and operated right
outside of the University of Oklahoma since 1976."

### The uncertain claims, resolved by publishing both readings or neither

**O3 — year opened, 1951 or 1952.** *Uncertain, §5 item 4.* Both the
operator's Club History ("opened for play" January 1951) and Golf Digest's
course page ("Year Opened: 1952") are read and quoted; neither is chosen.

**O4 — course length, 7,452 or 7,387 yards.** *Uncertain, §5 item 5.* Both
figures publish; the club's own Chronogolf record on its own course is
treated as the more authoritative of the two, per the verdict's framing, but
the Golf Digest figure is not deleted.

**O5 — Golf Digest's "$135" or "$145" price fields.** *Uncertain, §5 item 6,
and explicitly banned at §7.* Neither figure is Golf Digest's own business —
Golf Digest is authoritative on its ranking and its "Public" label, never on
another operator's rates — so **neither is published as a green fee.** Every
price in this file is the operator's own (the club's Chronogolf tee sheet for
Jimmie Austin, the city's own rate page for Westwood).

**O6 — whether 18 September 2026 closes the course to visiting play.**
*Uncertain, §5 item 1.* The tee-sheet note is confirmed; its effect on public
bookings is not, because 18 September sits outside the seven-day public
booking window and could not be tested directly. Published as the note's
existence only, exactly as the verdict's §7 instructs — not as a stated
closure.

**O7 — a weekly closure pattern.** *Uncertain, §5 item 3.* Only one Tuesday
fell inside the seven-day observation window, so no pattern is asserted, and
none is published.

### The rules-driven omissions

**O8 — every drive duration.** Will Rogers International Airport is 23.2
road miles from the course (OSRM), named as a distance with the roads OSRM
itself names; no minute or hour figure is attached to it anywhere in this
file.

**O9 — the forecaddie's exact tee-spacing and expected round length.** The
Guest Information page also states 20-minute tee spacing and a "recommended
round of 4 h 10 min"; both are numeral-minute phrasings the gate's pattern 1
bans unconditionally (any digit followed by "minutes," with no travel-word
anchor required), and neither is load-bearing to a visitor's access decision,
so both are dropped rather than reworded around the gate.

**O10 — any claim of proximity between Montford Inn and the university or
downtown Norman.** The inn's own site describes itself as "within walking
distance of the University of Oklahoma" and "about a mile" from it — both a
banned vague-proximity phrase and a banned trip-duration phrase. Rather than
paraphrase around the ban (which would just restate the same claim in
different words — the O16 precedent in `docs/golf/oregon.md`), the proximity
claim is dropped entirely. The address and phone number publish; nothing
about location relative to campus does.

**O11 — The Trails Golf Club and Winter Creek Golf & Social Club.** *§4,
"also within Cleveland County."* The verifier found both only as bare entries
in a marketplace directory listing and explicitly did not open either
operator's own site. Per §7's own instruction, nothing beyond their bare
existence may be claimed, and since nothing beyond that exists to publish,
neither appears in this file at all.

**O12 — the Chronogolf marketplace's other operational notes** (tee-time grid
08:00-20:00, `bookableHoles: [9, 18]`, one-hour cancellation window, 20-minute
tee spacing at 5,200 seconds... ). Only the single-player restriction and the
booking window are load-bearing to whether and how a visitor plays; the rest
is left out as detail beyond what the FAQ gate or the corrections list calls
for.

**O13 — every photo.** `guide.photos: []` and `photos: []` on all five
places, per the same rule as every other state in this set.

**O14 — a street address for Westwood Golf Course beyond the city's own
listing, and no address field for any place.** Matching the Oregon precedent:
addresses are woven into `summary` and section prose rather than given their
own JSON field, since no verdict here establishes a dedicated `address` field
convention beyond what other sibling files already do.

---

## 4. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures.** No allowlist entry was added; `Ethos.GolfProse`'s
allowlist remains `[]`.

Phrasing decisions made in drafting, before running the gate, to avoid known
holes recorded in `Ethos.GolfProse`'s own moduledoc:

| Source phrasing | Why it was not shipped as-is |
|---|---|
| "within walking distance of the University of Oklahoma… about a mile" (Montford Inn's own site) | Proximity pattern 20 (`within walking distance`) and the trip-duration ban both fire; dropped per O10 rather than reworded, since a paraphrase would restate the same claim |
| "20-minute tee spacing," "recommended round of 4 h 10 min" (Guest Information page) | Pattern 1 bans any digit + "minutes" unconditionally, no travel anchor required; dropped per O9 |
| Golf Digest's "$135"/"$145" price fields | Not a gate-pattern issue — banned outright at §7 as another business's rates attributed to the wrong operator |

The dated-price convention this file introduces — "current as of a
[date] reading of its own site" for Westwood's undated rate page — is not a
new pattern; it is the exact construction already pinned as publishable in
`golf_seed_data_test.exs`'s `@publishable` list ("the rate table is current
as of a September 5, 2026 reading of its own site"), reused here rather than
invented.

---

## 5. Roster row

Per the task's explicit instruction, **`priv/seed_data/golf_courses_roster.json`
was not touched** for this state. No roster row was added or edited.

---

## 6. What is absent from the whole file

* **No trip duration of any kind.** The only distance in the file is the
  23.2-mile OSRM road figure, with named roads and no time attached.
* **No vague proximity.** The Montford Inn proximity claim was dropped
  entirely rather than reworded (O10); no other spatial relation is claimed
  anywhere in the file.
* **No price without a date attached.** Jimmie Austin's fees carry the
  verifier's own 6 September 2026 read; Westwood's undated rate page is dated
  the same way, "current as of a 6 September 2026 reading of its own site."
* **No relative or self-dating language.** Every date is absolute
  (6 September 2026, 18 September 2026, 19-21 September 2026, 8-9 September
  2026, 13 September, 25 September); no "today," no "currently," no offset
  from an unstated now.
* **No closure claim for 8 September 2026**, per the explicit correction
  layered on top of the verifier's own "report as observed, don't publish a
  cause" instruction — see O1.
* **No claim that the course is members-only or that public access could not
  be established.** The opposite is the entire point of this file: the course
  is genuinely public, and the access route the finder missed is documented
  in full, with its own two independent confirmations of the seven-day
  window.
* **No rate attributed to Golf Digest for either course.** Golf Digest is
  cited only for its ranking and its "Public"/"Private" labels, never for a
  price.
