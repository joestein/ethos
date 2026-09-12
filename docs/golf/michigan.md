# Michigan — the Bluffs Course: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/michigan.json`.

**This file is committed on purpose.** The research artifacts live under
`.superpowers/`, which `.gitignore` excludes. A year from now this file is the
only thing that can answer "where did that sentence come from".

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/michigan-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **30
   confirmed · 12 refuted · 4 uncertain** — the most heavily corrected state in
   the wave.
2. `.superpowers/sdd/2026-09-05-golf-courses/research/michigan-finder.md` — the
   finder. Context only, and treated with suspicion: twelve of its claims were
   refuted, including its central season finding.

**The governing rule:** a verdict vouches only for what its own text restates,
not for every clause of the sentence the finder wrote around it.

**The refuted-with-correction rule:** where a verdict is `refuted` but supplies
a correction naming what may still be published, that correction's text ships
**verbatim** and nothing else from the item does.

**7 places, 7 entries, 1 guide, 5 sections, 7 FAQ answers, 0 photos.**

---

## 0. The correction that governs the whole file: the season "disagreement" is dead, and must not be resurrected

The finder found two of the operator's own pages, `arcadiabluffs.com/the-bluffs`
and `arcadiabluffs.com/contact`, reading different **2025** opening dates —
April 4 on one, April 1 on the other (verdict C20) — and asked that the
disagreement be published as a live conflict, the same treatment this set gives
the Fenway Park case.

**R4 refutes the premise.** The finder's "no 2026 snapshot exists" claim is
false: both operator pages are readable live, both are stamped 2026, and
**both now read "2026 Operation Dates April 1 - November 30."** The split was a
2025 page-maintenance lag the operator has since fixed. Publishing it as a
live disagreement would import a stale, resolved contradiction into a guide
that claims to be current — the opposite of the Fenway Park case, where the
conflict is still live on both pages today.

**Nothing about the April 1 / April 4 split appears anywhere in
`michigan.json`.** What publishes instead, in "Playing the Bluffs Course" and
in the FAQ, is R4's own publishable text, taken close to verbatim: *"Both of
the operator's own pages agree, live in 2026: the Bluffs Course's stated 2026
operating season is April 1 – November 30."* This is the single most
instructive thing this state produced: being scrupulous about a source that
has since moved on would have invented a fact rather than reported one. The
discipline is not "publish every disagreement found in research" — it is
"publish the disagreement that is still true."

---

## 1. The selection — confirmed, survives intact

| Published | Verdict |
|---|---|
| "places the Bluffs Course at Arcadia Bluffs Golf Club third, labelled \"Public\"" | C1, C2, C5 — confirmed by two independent parsing methods, agreeing on all 40 rank/name/label triples |
| "above #1 Crystal Downs Country Club and #2 Oakland Hills Country Club: South, both Private" | C3, C4 — confirmed, `"private":true` on both in Golf Digest's own JSON |
| "the highest-ranked course on the Michigan list carrying that label" | C7 — confirmed, follows from C3/C4/C5 |
| "Golf Digest's own record for the Bluffs Course (ngfCourseId 18620) also carries 100 Greatest Public #16 and Second 100 Greatest #102" | C8 — confirmed |
| "distinct from Arcadia Bluffs' sibling South Course, itself ranked #7" | C6, C25 — confirmed. Distinct `ngfCourseId` (18620 vs 56598) and distinct real-world addresses (Arcadia vs Bear Lake) |

**The course is named specifically throughout** — "the Bluffs Course" or
"Arcadia Bluffs Golf Club: The Bluffs Course" — never bare "Arcadia Bluffs"
where the South Course could be confused for it, per the brief's instruction
and per C5's warning that Golf Digest's own JSON record reads
`"completeName":"Arcadia Bluffs The Bluffs Course: Arcadia Bluffs"`.

---

## 2. Geography

| Published | Verdict |
|---|---|
| "14710 Northwood Highway, Arcadia, Michigan 49613" | C12 — confirmed, the address the verifier geocoded independently |
| "in Manistee County's Arcadia township" | C10 — confirmed, Census geocoder: Manistee County (GEOID 26101), Arcadia township (COUSUB 03320) |
| "the U.S. Census Bureau's geocoder returns no Incorporated Place for its coordinates, confirmed independently by two separate geocodes — one from Golf Digest's own coordinates for the course, one from the postal address" | C11, C12 — confirmed twice over. The `Incorporated Places` key is **absent**, not empty, from both the coordinate-based and the address-based query |
| "Michigan's M-22 runs through Arcadia, leading north to Elberta and south to Onekama, according to Wikipedia" | C13 — confirmed verbatim quote from Wikipedia |
| "Manistee, the county seat, is 20.9 miles south" | OSRM road-distance correction table (§8 of the verdicts) for mileage; C13's Wikipedia quote ("23 miles (37 km) to the south") independently confirms the direction. The OSRM figure, not the Wikipedia figure, is published as the number, per the brief's instruction to publish OSRM road distances |
| "Manistee County Blacker Airport (MBL) is 16.4 miles south; Frankfort Dow Memorial Airport (FKS) is 16.0 miles north" | OSRM correction table — confirmed exact mileages. Direction computed from the verified coordinates themselves (course 44.45670385/-86.24251676; MBL 44.2754452/-86.2562133, south; FKS 44.6255569/-86.2012624, north) — arithmetic on confirmed coordinates, not a new unsourced claim |
| "Cherry Capital Airport (TVC) in Traverse City, the practical commercial gateway, is 51.8 miles northeast" | OSRM correction table — confirmed mileage. "Practical commercial gateway" tracks U3's instruction not to publish "the nearest airport with scheduled commercial service," which was not found in the form quoted |
| "Arcadia Bluffs offers complimentary transportation to and from local airports for its guests" | C30 — confirmed. No duration published alongside it; the operator's own "(30 min.)" and "(20 min.)" figures for MBL and FKS are durations and are excluded entirely, per R12 and the prose gate |

**Not published: any straight-line distance.** R12 refutes the finder's 12.7
mi / 38.0 mi figures outright as straight-line, not road, distances. Not
published either: "northwestern Manistee County" (U1, unconfirmed phrasing).

---

## 3. Access and booking policy — all quotes confirmed verbatim

| Published | Verdict |
|---|---|
| "Reservations are required, however, walk-on players will be accommodated when possible. All guests must register in the Golf Shop prior to starting their round." | C14 — confirmed verbatim |
| "Reservations may be made within current calendar year. All reservations must be guaranteed with a credit card." | C15 — confirmed verbatim (the page's own article-less form, which the finder correctly quoted) |
| "Reservations canceled within 7 days of tee time result in a 100% per player charge (cancellation policy may vary depending on group size)." | R2 — the finder's version omitted the parenthetical; the live 2026 page adds it, and it ships |
| "The golf course is open to all pre-registered guests and walk-ons when appropriate." / "Special Events, both private and public, supersede all reservations." | C18 — confirmed verbatim |
| the FAQ's four-tier cancellation schedule (11 or fewer players, 7 days; 12–19, 14 days; 20–39, 30 days; 40+, 60 days) | C17 — confirmed live in 2026 |
| "The Rates page states a different, three-tier version of the same policy: groups under 11 players, 7 days; groups of 12–19 players, 14 days; groups of 20 or more players, 30 days." | R3 — refuted by omission in the finder (who reported the Rates page only as a group-booking routing note); the correction directs that if a cancellation window publishes, both schedules be named. Both are named |
| "There is no membership at Arcadia Bluffs: Golf Digest classifies the Bluffs Course as Daily Fee, and the operator's own rate card is a public, per-person schedule with no member tier." | C19 — confirmed affirmatively: `"facilityType":"Daily Fee"`, `"private":false`, a public per-person rate card, and the string "member" appearing nowhere on the Policies/FAQ/course pages except in an unrelated service-animal answer |

---

## 4. The season — published only as the resolved 2026 fact

| Published | Verdict |
|---|---|
| "The operator states: \"The Bluffs Course is open to the public seven days a week April through November each year.\"" | C19 — confirmed verbatim |
| "Both of the operator's own pages agree, live in 2026: the Bluffs Course's stated 2026 operating season is April 1 – November 30." | R4's correction — published verbatim in substance. See §0 above |
| "This guide makes no claim about whether the course is open on any specific date; its online tee sheet is a script-driven booking application that could not be read for this guide." | U2 — the closure check is `uncertain`, not `confirmed`, because the ResortSuite tee sheet is a JavaScript SPA no tool could read. No affirmative "open today" claim is made anywhere in the file, per the verdicts' explicit instruction |

**Not published:** the 2025 April 1 / April 4 split (§0); any claim the course
is trading on a given date (U2, "publish no affirmative 'open today' claim").

---

## 5. Green fees — 2026 only

| Published | Verdict |
|---|---|
| "The 2026 Rates page lists peak-season green fees of $285 for eighteen holes, June 1 through October 4, 2026, plus a $75 non-player rider fee, before applicable taxes and fees; shoulder-season rates start at $135 in April 2026." | R6's correction, published close to verbatim. Peak $285 and rider $75 are both confirmed 2026 figures; "before applicable taxes and fees" reflects the new 2026 line the 2025 page did not carry |

**Not published: any 2025 rate**, including the $275 peak the finder
transcribed accurately for **last season** (C21) — R6 refutes the whole table
as superseded. Not published: the full rate grid (Mon–Thu vs Fri–Sun splits,
twilight, late twilight, junior, two-rounds pricing) or the caddie/forecaddie/
club-rental add-ons — all confirmed by R6/C21 but omitted here as
supplementary detail beyond what a visitor needs to know the course is
daily-fee and what peak play costs; nothing published contradicts them.

---

## 6. The course itself

| Published | Verdict |
|---|---|
| "Arcadia Bluffs Golf Club's own site credits \"Course Designer Warren Henderson\"; Golf Digest's record for the course credits \"Warren Henderson/Rick Smith.\" Both credits are current and neither source amends the other." | C26 — confirmed as a real, unreconciled disagreement, reported as such rather than resolved in either direction |
| "construction of Arcadia Bluffs began in 1997 and was completed in 1999. The clubhouse opened on July 4th and the golf course to limited play on Labor Day." | C27 — confirmed verbatim |
| "Golf Digest records the Bluffs Course's year opened as 1999." | C27 — confirmed, `yearOpened` field |

**Not published: any award from the club's own Awards page** — "Best Par 5,"
"Best 19th Hole," "Most Interesting Hole," the ASGCA seal, "Top 100 Resorts."
C28 confirms these appear on the page; the verdicts' §"What must not be
published" item 7 states a business's own site cannot establish an award, and
U4 finds no awarding body or year attached to most of them. The only rankings
published are Golf Digest's own (§1).

---

## 7. The South Course

| Published | Verdict |
|---|---|
| "sits at 13637 Northwood Hwy, Bear Lake, Michigan 49614, and books through its own \"Book Tee Time\" link" | C25 — confirmed |
| "Dana Fry and Jason Straka designed it, and it opened in 2018" | C25 — confirmed |
| "Golf Digest's Best in State 2025-'26 Michigan list ranks it #7, with a 100 Greatest Public position of #53" | C25 — confirmed |
| "Its PGA Head Golf Professional is Dustin Darling and its superintendent is Noah Wiles." | C25 (Darling) and R8 (Wiles, the live 2026 name; the finder's "Zach Redman" is the superseded 2025 name) |
| "The South Course's stated 2026 operating season is April 1 – October 31 — a month shorter than the Bluffs Course's November 30, and the two courses' seasons are not the same." | R9 — confirmed and explicitly flagged: the verdicts warn against applying the Bluffs Course's November 30 close to the South Course, which this sentence exists to prevent |
| "The casual full-service concept features carefully crafted comfort cuisine perfect for any occasion. The restaurant is located on the second floor of our stunning South Course clubhouse." | C24 — confirmed verbatim |

**Not published: "The South Course Restaurant: Open all Winter Tuesday -
Saturday / 11am - 9pm."** R10 refutes both the finder's name for the venue
(the archived page reads "The Restaurant at The South Course," not "The South
Course Restaurant") and its currency (that line is absent from the live 2026
Contact page, which lists only a phone number under the label "South Course
Restaurant"). The place record `south-course-restaurant-arcadia-bluffs` uses
that live 2026 label and publishes only the C24 description — no hours, no
winter-trading claim.

**Not published: any resort-wide USGA championship count** — not in this
file's scope; that count belongs to the Pacific Dunes-style resort narrative
this state does not need, and the verdicts flag it (§ their U2 area,
"uncertain") in any case as disputed between sources.

---

## 8. Lodging and dining at the Bluffs Course side

| Published | Verdict |
|---|---|
| The Lodge: "located on the second level of the beautiful Nantucket coastal estate-style clubhouse, and accommodates 15 comfortably appointed guest rooms with 1 King bed each and 1 Suite." | C23 — confirmed verbatim |
| The Bluffs Lodge: "offers 21 comfortable guest rooms with 2 queen beds, as well as a state of the art workout facility." | C23 — confirmed verbatim, **with the clause "located just steps away from the Main Lodge" dropped**. See omission O1 below |
| The Cottages: "1900 square foot, four bedroom, four bath cottages." | C23 — confirmed verbatim |
| The Porch at The Dozen: "a full menu of unique sandwiches, burgers, and Dozen Delicacies." | C24 — confirmed verbatim |

**No trading claim is made about any of these four venues.** They are
described by what they are and what the operator says they contain, never as
currently serving on a given day, matching the same discipline the Oregon
checkpoint applied to Bandon Dunes' dining rooms.

---

## 9. Every omission, and why

**O1 — "The Bluffs Lodge is located just steps away from the Main Lodge."**
*Gate-driven.* C23 confirms this clause verbatim, but "steps away" is exactly
the vague-proximity phrasing `Ethos.GolfProse`'s pattern 5 bans. The
confirmed, checkable remainder of the same sentence — the room count, bed
configuration, and workout facility — publishes; the proximity clause does
not. This is a drop, not a rewrite: no substitute spatial claim was invented
to replace it.

**O2 — the 2025 season split (April 1 vs. April 4).** *Refuted, R4.* See §0.
The most consequential omission in this file, because it is an omission of a
finding that was true and is no longer.

**O3 — every 2025 green fee, including the $275 peak Golf Digest's own
`weekendFee` field matches.** *Refuted, R6.* Superseded by the 2026 card. See
§5.

**O4 — the full 2026 rate grid, the caddie/forecaddie/club-rental add-ons, and
the two-round/twilight/junior pricing tiers.** *Editorial, not a refutation.*
All confirmed by R6/C21; omitted as supplementary detail. Peak price and rider
fee are what a visitor needs to gauge cost; nothing published contradicts the
fuller table.

**O5 — "No 2026 information could be obtained" / "the live site is
unreachable."** *Refuted, R1/R4/R5.* False on all three counts: WebFetch
returned the live page (truncated, not blocked); the live 2026 operator pages
are readable through a text-extraction proxy; and 2026 Wayback captures do
exist, just not of the exact URL the finder queried. None of this is
published as a gap.

**O6 — the straight-line distances (12.7 mi to MBL, 38.0 mi to TVC).**
*Refuted, R12.* Not road distances; replaced by the OSRM figures throughout.

**O7 — "Frankfort Dow's coordinates could not be sourced."** *Refuted, R11.*
They are on the operator's own Contact page and are used directly, without
comment on the finder's error, to compute the published direction and to
support the published mileage.

**O8 — "The South Course Restaurant … Open all Winter Tuesday–Saturday,
11am–9pm," "Zach Redman" as South Course superintendent, and the 09/18/2025
news-post date.** *Refuted, R7/R8/R10.* Wrong name, wrong person, wrong date,
respectively, on the live 2026 site. None appear in this file. Noah Wiles
(R8's correction) is the name published instead.

**O9 — any award or superlative from the club's own Awards page.** *Rule,
verdicts §"What must not be published" item 7, U4.* See §6.

**O10 — any claim the course is open, or open today.** *Uncertain, U2.* The
ResortSuite tee sheet could not be read; no trading claim is made anywhere for
either course. See §4.

**O11 — "the nearest airport with scheduled commercial service" for TVC, and
"northwestern Manistee County."** *Uncertain, U3/U1.* Neither phrase was found
in the form quoted. TVC publishes as "the practical commercial gateway," a
narrower claim the mileage table supports; the county publishes without the
disputed adjective.

**O12 — any drive-time duration** (the operator's own "(30 min.)" for MBL,
"(20 min.)" for FKS, or any OSRM minute figure). *Rule, verdicts C30 plus the
prose gate.* Only road mileages are published, per the brief's instruction and
per `Ethos.GolfProse`'s trip-duration ban.

**O13 — resort-wide USGA championship counts.** *Uncertain, and out of
scope.* Two sources disagree on the count and the years; not attached to
either course specifically. Omitted rather than adjudicated, since neither
course's own record depends on it.

**O14 — every photo.** `guide.photos: []` and `photos: []` on all seven
places. No photo scout has run for this state.

**O15 — a street address for lodging and dining places other than the two
courses.** No verdict gives The Lodge, The Bluffs Lodge, The Cottages, The
Porch at The Dozen, or the South Course Restaurant a separate street address
from the golf facility they sit on; none is invented.

---

## 10. What the gate caught, and what it did not

Run:
`MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, first run. No allowlist entry was added;
`Ethos.GolfProse`'s allowlist remains `[]`.

**One phrasing was caught in drafting and rewritten before the gate ever ran**,
found by re-reading C23's verbatim quote against `Ethos.GolfProse.patterns/0`
rather than by trusting a paraphrase:

| Draft phrasing | Gate result | Shipped instead |
|---|---|---|
| `The Bluffs Lodge is located just steps away from the Main Lodge and offers 21 comfortable guest rooms…` | **fires** — `["steps away"]`, proximity pattern (`steps\|a stone's throw\|moments … from\|away`) | The clause was dropped outright (O1); only `"offers 21 comfortable guest rooms with 2 queen beds, as well as a state of the art workout facility."` ships |

No drive-time phrasing was drafted and caught, because none was ever written:
the OSRM mileage-and-direction figures replaced the operator's own duration
claims ("(30 min.)", "(20 min.)") before a single sentence was typed, per §2
above. Confirmed to pass cleanly, as they should: `16.4 miles south`,
`16.0 miles north`, `51.8 miles northeast`, `20.9 miles south`, `seven days a
week`, `on the second floor of our stunning South Course clubhouse`.

---

## 11. What is absent from the whole file

* **No trip duration of any kind.** Every distance is a road mileage (OSRM)
  with a compass direction; no drive time, from the operator or from OSRM, is
  published anywhere.
* **No vague proximity.** One sourced spatial clause ("steps away") was found
  and dropped rather than rephrased or allowlisted.
* **No price without the source's own date.** Every fee sits under the
  operator's own "2026 Rates" heading.
* **No trading claim for any of the seven places**, and no claim that either
  course is open on a specific date — stated as a limitation in the prose
  itself (§4), not left to be inferred.
* **No resurrected 2025 fact treated as current** — season, green fees,
  superintendent, restaurant name, or news-post date all publish in their
  live-2026 form only, per §0 and §9's O2/O3/O8.
* **No inference published as a citation.** The season disagreement (§0), the
  straight-line distances (O6), and the sourced-but-vague proximity clause
  (O1) were each a true-sounding or previously-true sentence a live source no
  longer supports, or supports only in a form the prose gate bans. All are
  out.
