# Montana — Wilderness Club: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/montana.json`,
following the register established in `docs/golf/oregon.md`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/montana-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **26
   confirmed · 6 refuted · 5 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/montana-finder.md` — the
   finder. Context only. **Its central premise was wrong**, and it carries six
   refuted claims; where the two disagree, the verdicts file wins.

**This state came back `searched: blocked`** — Golf Course Industry
(Incapsula, all five Wayback snapshots archived only the block page) and the
EZLinks booking engine (`wildernessclub.ezlinksgolf.com`, HTTP 403, JS SPA)
were never reached by any method. It publishes anyway on 26 confirmed
verdicts. The one real casualty of the block is named below and nowhere
papered over: **the Wilderness Club green fee is a genuine gap.**

**2 places, 2 entries, 1 guide, 4 sections, 7 FAQ answers, 0 photos.**

---

## 0. The identity correction that decided the whole file

The finder framed Montana around an unresolved conflict: `thewildernessclub.com`
looked like a rival developer domain whose "mandatory membership" language
contradicted `wildernessclubmontana.com`'s FAQ. **The verifier dissolved this
premise on two independent grounds, and it is the most instructive thing this
state produced.**

**Ground 1 — same operator, not two domains.** Golf Digest's own course page
and Faldo Design's own course page both list `thewildernessclub.com` as *the*
course website, alongside the phone number (406) 889-6501. The site's own
footer reads "© 2026 Escalante Golf, LLC" — the course's current operator, not
a third party. `refuted`: there is no second, conflicting domain. Both sites
are Escalante-operated.

**Ground 2 — the "conflicting" domain affirms the same policy.** The verifier
curled `thewildernessclub.com/faq/` directly (HTTP 200, 212,331 bytes) and
found, verbatim: "Can non-members play golf at the Wilderness Club? Yes, in
the 2026 season. The golf course is open to non-member and non-resort-guest
play after 12:00 PM." That is the *same* domain the finder cited as the source
of the contradiction, stating the *same* policy as the other FAQ.

**What the "mandatory membership" sentence actually is.** Read in full context
by curl, it sits inside a real-estate offering-disclaimer block, bracketed on
both sides by securities/land-sales boilerplate ("renderings are for
illustrative purposes only… This does not constitute an offer to sell or
solicitation of an offer to buy real estate…"). It is a disclosure to
**prospective home buyers** that owning a lot does not convey golf privileges
— not a statement that the course is closed to public play. The finder
hypothesised exactly this reading but left it unresolved; the verifier proved
it.

**How the verifier established the truth, in order:** (1) cross-checked the
domain's ownership against two independent third-party course listings
(Golf Digest, Faldo Design) rather than trusting either operator site alone;
(2) read the disputed sentence in its surrounding paragraph instead of in
isolation; (3) fetched the FAQ directly by curl rather than relying on a
summarizer, because the finder's WebFetch-based read had not surfaced the
sentence's full context. None of the three steps required a source the finder
lacked access to — the finder's own two citations already resolve the
contradiction once read together and in context. **This is the register
entry: a "conflict between two sources" was actually one source, misread.**

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| course | Wilderness Club | §1 — confirmed |
| city | Eureka | §1 — confirmed |
| state | Montana | §1 — confirmed |
| county | **Lincoln County** | §2 — confirmed **at course level**. GolfPass: "1885 Sophie Lake Rd, Eureka, Montana 59917, Lincoln County" — the address field itself names the county, not a town-name inference. Wikipedia corroborates for the town: "Eureka is a town in Lincoln County, Montana." |

`county: "Lincoln County"` derives `/destinations/montana/lincoln-county`.

---

## 1. Selection and skip count

| # | Course | Label | Verdict |
|---|---|---|---|
| 1 | Rock Creek Cattle Company | Private | §1 — confirmed |
| 2 | The Reserve At Moonlight Basin | Private | §1 — confirmed |
| 3 | Stock Farm Club | Private | §1 — confirmed |
| 4 | Iron Horse Golf Club | Private | §1 — confirmed |
| 5 | **Wilderness Club** | **Public** | §1 — confirmed |

Golf Digest "Best in State" Montana 2025-'26, fetched twice with differently
phrased prompts to guard against summarizer confabulation; both passes agreed.
On the direct question "is any of ranks 1–4 marked anything other than
Private?" the source answered "No." **Skip count of 4 is correct** —
published in the guide's intro and in the "Wilderness Club" section.

`#57 in America's 100 Greatest Public Golf Courses (2025-'26)` — §5, confirmed,
and explicitly the *only* other ranking claim the verdicts permit (the
operator's self-reported awards are all in the "must not be published" list,
below).

---

## 2. The guide

`slug: montana-golf-guide` · `destination: "Eureka, Montana"` ·
`state: "Montana"` · `county: "Lincoln County"` · `photos: []`

### Intro

| Published | Verdict |
|---|---|
| "the highest-ranked course carrying Golf Digest's own 'Public' label" | §1 — confirmed |
| the four private courses named | §1 table |
| "at 1885 Sophie Lake Rd" | §2 GolfPass — confirmed |
| "designed by Nick Faldo and opened in 2009" | §6 — confirmed (not "sole" designer; see below) |
| "open to non-member and non-resort-guest play after 12:00 PM… no membership or resort room required" | §0, FAQ verbatim — confirmed |
| "the operator, Escalante Golf, LLC, has said publicly it intends to eventually return the club to fully private status" | Fort Worth Inc., 26 Mar 2024 — confirmed as a **stated intent**, not the 2026 rule (full date given in the "Playing it in 2026" section, per the corrections brief) |
| "Indian Springs Ranch Golf Course, lies two miles north on Highway 93" | §3 corrected quote — confirmed |

### Section 1 — `Getting there`

Heading is exactly `Getting there`. **No trip duration appears anywhere in
this file.**

| Published | Verdict |
|---|---|
| "U.S. Route 93 reaches its northern terminus at the Canada–US border near Eureka, and the highway runs south through Whitefish and Kalispell" | Wikipedia, *U.S. Route 93 in Montana* — confirmed |
| "Eureka to Whitefish is 51 miles, southeast, following the US-93 route" | §4 — confirmed verbatim ("51 miles (82.08 kilometers) by car, following the US-93 route," direction "southeast" from the same sentence) |
| "Eureka to Glacier Park International Airport (FCA), near Kalispell, is 63 miles via US-93" | §4 — confirmed (63 miles verbatim from travelmath; "via US-93" is the routing the corrections brief specifies, consistent with the Wikipedia route description of US-93 running through Kalispell) |
| "Wilderness Club itself… is eight miles from the Canadian border" | Fort Worth Inc. — confirmed verbatim ("located eight miles from the Canadian border in the northern Montana town of Eureka") |

**No drive-time figure is published anywhere.** Both distance sources'
"1 hour" / driving-time-calculator figures are excluded per §4's explicit
instruction.

### Section 2 — `Wilderness Club`

| Published | Verdict |
|---|---|
| rank 5, "Public" label, skip count of 4 | §1 |
| "#57 in America's 100 Greatest Public Golf Courses (2025-'26)" | §5, and the "must not be published" list — the *only* ranking claim beyond #5 Best in State |
| "Nick Faldo designed the course, which opened in 2009" | §6 — confirmed by three sources (Golf Digest, Faldo Design, Fort Worth Inc.) for design; two sources (Flathead Beacon, GolfPass) for the year |
| the operator's tee-yardage quote, verbatim | §5/§6 operator quote — confirmed by curl |
| "7,207 yards, par 72" | §6 — confirmed (Fort Worth Inc., Golf Digest) |
| "roughly 550 acres" | §6 — confirmed, using the operator's and Fort Worth Inc.'s figure over Faldo Design's "545," per the `uncertain` note's own recommended phrasing |
| the dogs-not-permitted quote, verbatim | §6 — confirmed by curl |

**Not published: "sole" designer, or "Faldo's own hand."** GolfPass credits
Faldo, Lee E. Schmidt and Brian Curley jointly; the verdict permits "designed
by Nick Faldo" but not an exclusivity claim. See omission O1.

### Section 3 — `Playing it in 2026`

This is the section the whole guide turns on, and every clause in it maps to
§0's resolution.

| Published | Verdict |
|---|---|
| the FAQ quote, verbatim, with its site attribution and the "© 2026 Escalante Golf, LLC" footer fact | §0 — confirmed by curl |
| booking channel: wildernessclub.ezlinksgolf.com or (406) 296-8264 | §0 Ground 3 — confirmed (the booking link's *existence and destination* are confirmed; live inventory/pricing on that page is `blocked` and none is claimed) |
| "neither a club membership nor a resort room is required" | §0 — confirmed; this directly negates the finder's "advantaged, not strictly required" hedge on resort guests, which the verdicts flag as unstated (see O5, below) — the guide makes no claim about resort-guest morning access at all |
| season quote, verbatim, curl-confirmed | §5 — confirmed |
| "no dated green fee is published… a genuine gap" | §5 and the corrections brief — confirmed as an **absence**, named as a gap rather than filled with any number |
| the real-estate disclaimer, quoted verbatim, characterized as a disclaimer to home buyers rather than an access rule | §0 — confirmed, the correction ships verbatim |
| the Fort Worth Inc. quote, verbatim, dated "In March 2024" | §0 "ownership-change allegation" — confirmed, published strictly as a **stated intention with its date**, never as the current rule, per the corrections brief |

### Section 4 — `Day two: Indian Springs Ranch`

| Published | Verdict |
|---|---|
| address "3082 Montana Highway 93 North" | §3 Visit Montana — confirmed |
| "lies two miles north of Eureka on Highway 93" | §3 — this is **the verdict's corrected text**, not the finder's. The finder attributed this phrase to MSGA and the operator's own site; the verifier grepped both (531,501 and full MSGA text) and found zero hits for "two miles," "2 miles," or "Highway 93" on either. The sentence is real but lives on Visit Montana instead. Published per the verdict's explicit correction. |
| Visit Montana's "PUBLIC GOLF COURSE" label, quoted | §3 — confirmed |
| MSGA quote, "first opened to the public in 2010," verbatim | §3 — confirmed by curl (this page 403s to WebFetch) |
| "18 holes at 6,600 yards" | §3 `uncertain` note — confirmed as the two facts two sources agree on; explicitly **not** publishing par (72 vs. 71 dispute) or a year-built figure distinct from the public-access date above (see O2) |
| 2026 rates: $90 for 18 holes, $110 with cart, range balls included, season April 1 – October 31, 2026, tee times up to 7 days ahead, (406) 889-5056 | §3 — confirmed, the finder's "gap" claim on this price is **refuted**; the verifier followed the PDF link the finder cited but did not open |

**Cabinet View Golf Club, Libby, is not published at all.** The verdicts mark
its ~43-mile distance `uncertain` — unverified against a mapping source — and
Indian Springs already fills the second-course slot on stronger sourcing. See
omission O3.

### FAQ

Seven questions; three match the gate's required pattern (`play`, `tee time`,
`book`).

* "Can I play Wilderness Club without a membership?" — §0 FAQ verbatim.
* "How do I book a tee time at Wilderness Club?" — §0 booking channel.
* "What does a round cost at Wilderness Club?" — §5, the gap named explicitly.
  This question exists **because** the gap is real, not despite it — the
  brief requires the FAQ to carry more weight here than in most states given
  the afternoon-only rule and the private-club intent, and a reader asking
  "what does it cost" deserves the honest "unpublished" answer rather than
  silence.
* "When is Wilderness Club open?" — §5 season quote.
* "Is Wilderness Club going private?" — §0 Fort Worth Inc., dated, framed as
  intent not current rule.
* "What is the 'mandatory membership' language I might see on the club's
  site?" — §0's resolution, stated so a reader who finds that sentence
  independently is not misled by it.
* "Where can I book a second round near Eureka?" — §3 Indian Springs.

---

## 3. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum.

| slug | kind | rests on |
|---|---|---|
| `wilderness-club-eureka` | `golf-course` | §1, §2, §5, §6, §0 |
| `indian-springs-ranch-eureka` | `golf-course` | §3 |

Both carry `address`, sourced at course level (GolfPass; Visit Montana) —
unlike Oregon, where no verdict established a street address for any place.
Both `photos: []`. No non-golf place is published — see omission O4 for why.

Two entries, one per place, both `place_slug` values resolving inside this
file.

---

## 4. Every omission, and why

### The six refuted claims

**O-a — "two rival, conflicting operator domains."** *Refuted, §0 Ground 1.*
Both domains are Escalante-operated. Not published in any form; the guide
names only one official site.

**O-b — the "mandatory membership" sentence as a golf-access rule.** *Refuted,
§0.* It is a real-estate disclaimer to home buyers. Published instead: the
disclaimer's own text, characterized correctly, plus the FAQ that contradicts
reading it as an access rule.

**O-c — the Indian Springs "two miles / Highway 93" quote attributed to MSGA
and the operator's own site.** *Refuted, §3.* Neither page contains the
phrase. Published instead: the same sentence, re-attributed to Visit Montana,
where it actually lives.

**O-d — "no dated Indian Springs green fee exists."** *Refuted, §3.* The
finder saw a PDF link and did not follow it. The verifier did: 2026 season
rates, dated, exist and are published in full.

**O-e — Golf Digest's course-page "$250" as a current Wilderness Club price.**
*`Uncertain`, §5 — carries no date or season, and the verdicts explicitly say
"do not publish $250 as a price… preferably omit."* Omitted entirely; the FAQ
states the gap instead of a number.

**O-f — every self-reported Wilderness Club award or superlative** ("#1 in
Montana by GolfWeek 2022," "#57 in the United States… 2021," "award-winning,"
"Montana's foremost luxury golf experience," "#1 AMONG MONTANA GOLF COURSES").
*Confirmed as existing on the operator's own site, but a business's own site
cannot establish an award or a superlative — the verdicts list these by name
under "what must not be published."* None ship. The one ranking claim
(#57, 2025-'26) is Golf Digest's own current page, not the operator's stale
citation of an old edition.

### The five uncertain claims

**O1 — sole/exclusive Faldo design credit.** *Uncertain, §6.* GolfPass credits
Faldo jointly with Lee E. Schmidt and Brian Curley. Published: "Nick Faldo
designed the course" — supported by three independent sources — without
"solely" or an exclusivity claim.

**O2 — Indian Springs' par and year-built figure distinct from its
public-access date.** *Uncertain, §3.* Par 72 (MSGA) vs. par 71 (aggregators);
"Est. 2010" vs. "built in 2009"; two different street addresses across
sources. Published: only the two facts two sources agree on (18 holes,
6,600 yards) plus the Highway 93 address from Visit Montana and the
public-access date from MSGA's own confirmed sentence, which is a distinct
claim (when the course opened to the public) from a construction date.

**O3 — Cabinet View Golf Club, Libby, as a third golf option.** *Uncertain,
§3.* Its ~43-mile distance is an unverified search-aggregator figure. Omitted
entirely; the gate's two-course maximum makes the choice easy, since Indian
Springs is confirmed on stronger sourcing.

**O4 — resort-guest morning play.** *Uncertain, §0 item 7.* The finder
inferred that resort guests can play in the morning from the phrase
"non-Member & non-Resort Guest play," calling a room booking "advantaged, not
strictly required" — the verifier notes the first half of that claim is
unstated anywhere. The guide makes **no claim at all** about resort-guest
timing; it states only that non-members and non-resort-guests may play after
noon, exactly as both operator FAQs phrase it, and separately that neither a
membership nor a room is required to play (which is what the FAQ actually
says).

**O5 — any lodging or dining place at or near Wilderness Club.** *Not
addressed by any verdict.* The finder's §5 (Deluxe Wilderness Suites,
Wilderness Grille, named cottages) was never independently verified — no item
in the verdicts file confirms, refutes, or marks it uncertain, because the
verifier's scope was the access conflict, selection, county, mileages, and the
two courses. Per the operating rule ("publish only what a confirmed verdict
supports"), none of it ships. The FAQ's confirmed sentence that "overnight
resort accommodations are available to non-members through homes in the
club's rental program" is *about* a rental program, not a named property, and
supplies no place record to create. This is why the file carries only two
places instead of Oregon's nine: **the source material for this state is
thin outside golf, and nothing was invented to fill it out.**

### The rules-driven omissions

**O6 — every drive-time figure.** Both distance-cities.com and travelmath
offer duration figures ("1 hour," driving-time calculators); neither is
published, per the corrections brief's explicit instruction and the "no trip
durations, none" prose rule.

**O7 — any straight-line/flight-distance figure.** Not sourced or needed here;
no aggregator page in this state's source set was found to conflate the two,
unlike Oregon's distance-cities pages.

**O8 — live tee-time inventory or price from the EZLinks booking engine.**
`blocked` — 403 to curl, a JavaScript SPA. Its existence and its role as the
booking destination are confirmed from two operator FAQ pages that name it;
nothing beyond that is claimed.

**O9 — the Golf Course Industry acquisition article.** `blocked`,
exhaustively — Incapsula bot-block to WebFetch, curl with full headers, and
all five Wayback snapshots (each 633–1,294 bytes, archiving only the block
page). No material loss: its content is the same press release the Fort
Worth Inc. article covers, which was retrieved via Wayback-by-curl and is
quoted directly in Section 3.

**O10 — every photo.** `guide.photos: []` and `photos: []` on both places. No
photo scout has run for this state.

**O11 — a claim that access is permanent, or that morning play is available to
the general public.** Both are explicitly named in the corrections brief as
things the guide must not claim. Every access sentence in this file is scoped
to "the 2026 season" and "after 12:00 PM."

---

## 5. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, first run, no allowlist entry added.
`Ethos.GolfProse.allowlist/0` remains `[]`.

No drafted phrasing fired the gate and required rewriting in this state — the
prose was written directly in the road/direction/mileage form from the start,
following Oregon's precedent and the corrections brief's explicit confirmed
mileages (Eureka–Whitefish 51 mi, Eureka–FCA 63 mi). Phrasings the gate
would have caught and were deliberately never drafted: "eight miles from the
border" was checked against pattern 5 (which bans direction-relative-to-
course/clubhouse/resort/links/property/site/first-tee) and does not match,
since "the Canadian border" is not in that noun list and the sentence carries
its own number; "two miles north of Eureka on Highway 93" was checked the same
way and is the sourced, checkable form the gate is designed to let through
(per the oregon.md publishable-form precedent: "the resort is 25 miles north
of Coos Bay on US-101").

---

## 6. Roster row (for the roster agent)

Course: **Wilderness Club**. Basecamp: **Eureka, Montana**. County: **Lincoln
County**. Access: open to non-member and non-resort-guest play after 12:00 PM
in the 2026 season, no membership or room required, booked at
wildernessclub.ezlinksgolf.com or (406) 296-8264; the operator has stated a
2024 intent to go fully private at an unspecified future date. Second course:
**Indian Springs Ranch Golf Course**. Places: 2. Entries: 2. Gate:
**9 tests, 0 failures**, no allowlist entries. The only thing the gate did not
need to catch, because it was never drafted: any Wilderness Club green fee —
named explicitly as a gap per the `searched: blocked` sourcing on this state.
