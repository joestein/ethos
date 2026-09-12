# California — Pebble Beach Golf Links: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/california.json`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/california-verdicts.md` —
   the independent verifier's adjudication. **The authority.** Tally: **33
   confirmed · 8 refuted · 12 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/california-finder.md` —
   the finder. Context only. It carries the eight refuted claims and twelve
   uncertains; where the two disagree, the verdicts file wins.

**Provenance note, load-bearing for a later reader:** pebblebeach.com, the
operator's own site, is blocked live to both WebFetch and curl (Cloudflare
bot-challenge, confirmed independently by the verifier — verdict §3.1). Every
fact attributed to "the resort's own FAQ", "the resort's own directions", "the
resort's own rate table" or "the resort's own course notice" below was
recovered not from the live site but from Wayback Machine snapshots the
verifier fetched directly: the FAQ from a **2026-02-08** snapshot, the rate
table from a **2025-12-06** snapshot, the directions page from a
**2026-03-08** snapshot, the course page's "Course Notices" from a
**2026-08-31** snapshot (the most recent), and the dining pages from
**2026-01-23** (Stillwater) and roughly **2026-01-01** (Roy's). These are
treated as operator-primary because they are the operator's own HTML, not
because they are live today. Anyone re-verifying this file should expect the
live site to still 403 and should go straight to web.archive.org.

**9 tests, 0 failures** on
`MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`,
on the first run. No allowlist entry was added.

---

## 0. Selection and ranking

| Published | Verdict |
|---|---|
| Exact name "Pebble Beach Golf Links" | 1.1 — confirmed |
| #2, California Best in State 2025-'26 | 1.2 — confirmed |
| Golf Digest's own label "Public" | 1.3 — confirmed |
| #1 Cypress Point Club, "Private", the only position skipped | 1.4, 1.5 — confirmed |
| "ranked No. 1 on Golf Digest's America's 100 Greatest Public Courses (published May 27, 2025)" | 1.8 — confirmed, exact publishable text from the verdict, used verbatim |

**Omitted: "25th edition."** Verdict 1.7 — uncertain; that phrase does not
appear on the fetched page. Published "2025-'26" only, never "25th edition",
unlike the Oregon file where the 25th-edition figure *was* confirmed (Oregon
verdict A5). This is a genuine cross-state difference, not an inconsistency.

---

## 1. Geography

| Published | Verdict |
|---|---|
| "Pebble Beach, an unincorporated community on the Monterey Peninsula in Monterey County, California" — "it has no city government of its own" | 2.1 — confirmed verbatim from Wikipedia's opening sentence for the community |
| County: Monterey County | 2.2 — confirmed, corroborated on the Spyglass Hill Wikipedia page and the resort's own $2 Monterey County tourism-assessment line |
| Address, 1700 17-Mile Drive, Pebble Beach, CA 93953 | 2.4 — confirmed, operator-primary (archived) |

**Omitted: the Tripadvisor breadcrumb citation for county.** Verdict 2.3 —
uncertain; the verifier did not re-fetch it and a breadcrumb is weak evidence
regardless. County rests on 2.2 alone.

**`guide.destination`: "Pebble Beach, California."** Pebble Beach is
unincorporated, but every hotel, restaurant, and both golf courses in this
file sit inside it (1700 and 2700 17-Mile Drive, both addressed "Pebble
Beach, CA 93953" per verdicts 2.4 and 6.4) — it is where a visitor actually
sleeps, and the verdicts support no other named town for that role. The guide
prose is careful to call it a community, not a city, per the 2.1 correction
about municipal government.

---

## 2. Access — the central paragraph

This is the most consequential paragraph in the file and traces almost
entirely to verdict §4, which the assignment brief also restates directly.

| Published | Verdict |
|---|---|
| "Pebble Beach Golf Links is open to the public" | 4.1 — confirmed, operator-primary |
| "'Tee times at Pebble Beach Golf Links are subject to a hotel stay requirement.'" | 4.9 — confirmed verbatim, the most recent (Aug 31 2026) operator statement |
| Resort guests can reserve a tee time up to 18 months in advance, subject to a minimum-stay requirement | 4.2 — confirmed, "the tee-time window," specifically |
| The resort does not publish a fixed number of nights for the minimum stay and asks guests to inquire | 4.5 — this is **the correction's text**, used because the underlying claim (2-night/3-night minimums) is refuted |
| "A minimum stay is also required for any weekend stay." | Verbatim from the operator FAQ quoted in verdict §4, within the confirmed quotation block |
| "Non-guests can only reserve tee times 24 hours in advance." (quoted) | 4.6 — confirmed, one of the two verbatim operator sentences |
| "Non-Resort guests may book ... Pebble Beach Golf Links 1 day in advance." (quoted) | 4.6 — confirmed, the second verbatim operator sentence, corroborating the first |
| "There is no 48-hour option; some secondary sources ... have reported one, but the resort's own wording gives only the 24-hour figure." | 4.6, 4.7 — the 24–48 hour range is refuted; 4.7 identifies the 48-hour half as resting on a quotation that does not exist in the article it was attributed to (thegolfnewsnet.com). Stated as a disagreement between the resort and "some secondary sources," per the assignment's rule that disagreements between named sources are stated rather than silently resolved — though the specific fabricated citation is not named in the guide itself, only in this trace, to avoid handing a reader a dead citation. |
| Room-booking windows: Lodge and Inn at Spanish Bay 18 months; Casa Palmero 12 months | 4.4 — this is **the correction's text verbatim**, replacing the finder's refuted claim that all three book 18 months out |

**Omitted: any specific night count for the minimum stay.** Verdict 4.5,
"UNCERTAIN" — the 2-night/3-night figures (with a 3-night peak-season
Thursday–Sunday rule) come from a single secondary source
(thegolfnewsnet.com) against an operator page that deliberately declines to
give a number. Per the assignment brief's explicit instruction, these are not
published. This is the single largest omission in the file, and it is
intentional: publishing a specific night count risks telling a reader they
qualify for a booking they do not.

**Stated in both the intro and the FAQ, per the assignment's Ruling-9
instruction.** The intro's final two sentences and the "Playing it as a
non-guest" section both carry the 24-hour non-guest window, and two FAQ
entries ("How can I play Pebble Beach Golf Links?" and "Can I book a tee time
without staying at the resort?") restate it. The course is genuinely
playable by a non-guest, but only at 24 hours' notice, and the guide does
not let the intro sell an 18-month-advance weekend without immediately
surfacing that constraint.

---

## 3. Green fees — what was deliberately not published

The assignment brief overrides the verdict's own "publishable" text here.
Verdict §5.2 offers a publishable form that names $675 with its season dates
attached; the assignment brief instructs, without qualification: "Do not
publish the $675 rate — it expired 31 March 2026 and today is September."
That instruction is followed literally: **the figure $675 does not appear
anywhere in this file.**

Extending the same reasoning, the cart fee ($60 per person, verdict 5.3) and
every other line item from the same December 2025 rate table (caddie fees,
club rental) are **also** omitted as dollar figures, on the view that a rate
table whose headline number is too stale to publish is too stale to publish
piecemeal either. What is kept from 5.3 is the *structural* fact —
non-resort guests' green fee always comes bundled with a mandatory per-person
cart fee — stated as a policy rule from a past table, not as a current price,
and explicitly flagged as "not known whether it still applies to the current
season's table."

| Published | Verdict |
|---|---|
| "the resort's most recently archived rate table ... is no longer current, and no operator-published table for the current season could be found" | 5.1 confirms the table exists and is dated; the assignment brief's own framing ("today is September" — the season already ended) is restated directly |
| "Two secondary sources (golfinspired.com and thegolfnewsnet.com), writing in February 2026, reported that the fee would rise to $695 ... but no operator-published rate table confirms that figure" | 5.2 — uncertain, but the verdict's own text explicitly permits "attribute or omit"; this guide attributes, with the sources' own publication date (February 2026) attached, and states plainly that it is unconfirmed |
| Non-resort guests' green fee "always include[s] a mandatory cart fee, charged per person" (no dollar figure) | 5.3 — confirmed as a structural fact; the dollar figure itself is withheld per the reasoning above |

---

## 4. Basecamp — lodging and dining

| Published | Verdict |
|---|---|
| The Lodge at Pebble Beach, 1700 17-Mile Drive | 6.1 — confirmed, operator-primary |
| The Inn at Spanish Bay, 2700 17-Mile Drive | 6.4 — confirmed, operator-primary |
| Casa Palmero, "a Mediterranean-style property on the resort grounds" | Existence confirmed at 4.3; the Mediterranean-style descriptor is the finder's own phrase, retained only because it is a physical description, not a fact the verdict specifically checked — see the note on unchecked descriptive language below |
| Room-booking windows (18/18/12 months) | 4.4 — confirmed, the correction |
| "Casa Palmero guests can still reserve a Pebble Beach Golf Links tee time up to 18 months ahead, the tee-time window being separate from the room-booking window" | 4.2, 4.4 — this sentence exists specifically to stop a reader from conflating the two different 18/12-month figures, which the assignment brief's own "Casa Palmero is 12 months, not 18" instruction flags as the exact confusion to avoid |
| Stillwater Bar & Grill, at The Lodge, "California Coastal Cuisine," quoted "ranging from fresh and sustainable seafood to Prime Angus cuts," overlooking Stillwater Cove and the 18th hole | 6.5 — confirmed verbatim, operator-primary |
| Roy's at Pebble Beach, at The Inn at Spanish Bay, "Hawaiian-Fusion" | 6.7 — confirmed verbatim, operator-primary |
| "it is not known whether the restaurant is currently open for service" (both restaurants) | 6.6, 6.8 — uncertain trading status; per the assignment's own rules and the DataGuide convention, no trading claim is made either way; `status: "open"` on both places is the absence of a closed claim, not a trading claim |

**Omitted: any room count.** "161 rooms" for The Lodge — verdict 6.2, refuted
as sourced (AAA does not contain the figure) and unconfirmed as fact. "24
rooms" for Casa Palmero — verdict 6.3, uncertain, sourced only to
Tripadvisor, not re-verified. Neither appears anywhere in this file.

**Omitted: "reopened November 2025 after renovation" for Stillwater.**
Verdict 6.6 — uncertain, not re-fetched, and a trading-status claim in any
case, which the DataGuide convention already excludes.

**A note on the Casa Palmero descriptor.** The verdict never independently
verifies "Mediterranean-style" — it confirms only that Casa Palmero exists as
one of the three hotels. This one adjective is weaker sourcing than the rest
of the file and is flagged here rather than silently treated as equally solid.
It was kept, on balance, because it is a physical/architectural description
rather than a bookable-fact claim (unlike a room count or a price), and the
finder's report was not itself flagged as containing a fabricated citation for
it, unlike several other items in this run.

---

## 5. The course itself — Pebble Beach Golf Links

| Published | Verdict |
|---|---|
| Jack Neville and Douglas Grant | 9.1 — confirmed |
| Opened February 22, 1919 | 9.2 — confirmed |
| U.S. Open 1972, 1982, 1992, 2000, 2010, 2019 | 9.3 — confirmed |
| PGA Championship 1977; U.S. Amateur 1929, 1947, 1961, 1999, 2018; U.S. Women's Amateur 1940, 1948; U.S. Women's Open 2023; AT&T Pebble Beach Pro-Am 1947–present | 9.3 — confirmed |
| Scheduled to host the U.S. Open again in 2027 | 9.4 — confirmed, operator-primary, the standing site navigation |

**Omitted: the Nabisco Championship, 1988.** Verdict 9.3 notes Wikipedia
lists it and the finder omitted it; this guide also omits it, for space, not
because it is doubted — it is confirmed by the same source as the rest of
the tournament list. Recorded here so the omission reads as a choice, not a
gap.

**Omitted: any historic-landmark claim, either way.** Verdict 9.6 — an
unconfirmed absence. No National Historic Landmark or NRHP designation could
be found, but no page affirms the absence either. Per the assignment's rule,
nothing is published in either direction.

**County citation note.** Verdict 9.5 flags that the *course* Wikipedia
article (as opposed to the *community* article used at 2.1) does not name
the county in its body text, only in category tags — so this file cites the
community article for county, never the course article, matching the
verdict's explicit correction.

---

## 6. Second course — Spyglass Hill Golf Course

| Published | Verdict |
|---|---|
| #10, California Best in State 2025-'26, "Public" | 7.1 — confirmed |
| Robert Trent Jones, Sr. | 7.2 — confirmed |
| Opened 1966 | 7.3 — confirmed, from Wikipedia (Golf Digest's own page does not state the year) |
| "Non-Resort guests may book ... Spyglass Hill Golf Course up to 3 months in advance." (quoted) | 7.4 — this is **the correction's text**, replacing the finder's unresolved "90 days vs. 24 hours" hedge |

**Omitted: a 12-month Spyglass golf-booking window for Inn at Spanish Bay
guests.** Verdict 7.5 — refuted outright. No operator text supports a
12-month *golf* window for Inn guests; the 12-month figure belongs to Casa
Palmero *room* bookings (a different hotel, a different kind of booking),
and conflating the two is exactly the failure the correction exists to
prevent.

---

## 7. Getting there

The assignment brief bans trip durations outright ("No trip durations.
None... State the road, the direction, and the mileage"), which is a
stricter rule than the verdict's own default correction for this section.
Verdict §8.5 says: "publish the operator's times (15 minutes from MRY, 1–1.5
hours from SJC, 2–2.5 hours from SFO) and drop the mileages," because the
only confirmed airport-to-resort distances were minutes/hours, and the
mileage figures (77.8/106/111/8.4 miles) were uncertain, sourced only to
Rome2Rio/TravelMath.

That correction is **not** followed here, because it would fail this
project's own prose gate (`Ethos.GolfProse`'s minute/hour patterns ban any
numeric minutes outright and ban hour-figures followed by a travel word) and
because the assignment brief's rule is more specific to this run than the
verdict's general-purpose correction. Instead:

| Published | Verdict |
|---|---|
| Airports served: MRY, SJC, SFO | 8.1 — confirmed, operator-primary |
| MRY route, quoted verbatim, including "approximately 2.5 miles" | 8.2 — confirmed, operator-primary. The travel-time sentence ("Approximate Travel Time: 15 Minutes") that follows this quotation on the source page is deliberately **not** quoted, per the no-duration rule; "approximately 2.5 miles" is kept because it is a distance, not a duration |
| SJC/SFO route (Highway 101 South → Highway 156 → Highway 1 South → Highway 68 West → 17-Mile Drive), including "approximately 18 miles" | 8.4 — confirmed, operator-primary. Again, the travel-time sentences ("1-1.5 hours," "2-2.5 hours") that follow on the source page are omitted |

**Omitted, and explicitly noted as omitted in the guide's own prose: every
operator-published travel time.** This is a real tension between the
verdict's recommendation and the assignment's prose rule, and it is resolved
in the assignment's favor because the prose rule is gate-enforced. The
"Getting there" section says so directly: "the resort's directions page
gives travel times for these routes... neither the travel times nor any
third-party mileage estimate for the full airport-to-resort distance is
republished here" — so a reader is told the times exist on the source rather
than being left to wonder why the guide is thinner here than the source.

**Omitted: the SJC route via CA-87/CA-85.** Verdict 8.3 — refuted; the
operator's own directions contain no such leg. The operator's actual route
(Highway 101 South → 156 → Castroville/Highway 1 South) is published
instead.

**Omitted: all three total airport-to-resort mileages (77.8, 106/111, 8.4
miles).** Verdict 8.5 — uncertain, sourced only to Rome2Rio/TravelMath via
search snippets, never independently confirmed. Only the two mid-route
mileages that are part of the operator's own confirmed route text (2.5 miles
from the Pebble Beach gate to Palmero Way; 18 miles of Highway 1 South) are
published.

---

## 8. Places, against the verdicts they rest on

Two `golf-course` places — the gate's maximum, and exactly what the
assignment allows: the ranked course and one second course.

| slug | kind | rests on |
|---|---|---|
| `pebble-beach-golf-links` | `golf-course` | 1.1–1.5, 1.8, 2.1, 2.2, 2.4, 4.1, 4.2, 4.6, 4.9, 9.1–9.4 |
| `spyglass-hill-golf-course` | `golf-course` | 7.1–7.4 |
| `the-lodge-at-pebble-beach` | `hotel` | 4.4, 6.1 |
| `the-inn-at-spanish-bay` | `hotel` | 4.4, 6.4 |
| `casa-palmero-pebble-beach` | `hotel` | 4.3, 4.4 |
| `stillwater-bar-and-grill-pebble-beach` | `restaurant` | 6.5, 6.6, 6.8 |
| `roys-at-pebble-beach` | `restaurant` | 6.7, 6.8 |

Seven places, seven entries, one per place, all `place_slug` values resolving
inside this file. `guide.photos: []` and every place's `photos: []` — no
photo scout has run for California; a state with no freely-licensed photo
ships none.

**No `address` field on any place**, matching the Oregon convention:
required fields (slug, name, kind, town, state, county, summary) are present
and sourced; `address` is a distinct field this run does not populate even
though street addresses (1700 and 2700 17-Mile Drive) are confirmed and do
appear in the summary prose.

**Slug uniqueness.** Checked by grep against every `priv/seed_data/*/*.json`
file and every code-defined seed module before writing: no existing place in
the corpus uses `pebble-beach-golf-links`, `spyglass-hill-golf-course`,
`the-lodge-at-pebble-beach`, `the-inn-at-spanish-bay`,
`casa-palmero-pebble-beach`, `stillwater-bar-and-grill-pebble-beach`, or
`roys-at-pebble-beach`. All seven are qualified with the course, resort, or
"pebble-beach" specifically to survive collision with the thirty-state,
Manhattan/London/Rome/ballpark corpus this file joins.

---

## 9. Every omission and why — the eight refutations and twelve uncertains

### Refuted (8 total in the verdicts file)

1. **"archive.org was not reachable."** Verdict §3.2 — refuted; this is the
   finder's own error, not something published either way, but it explains
   why the operator-primary sourcing below exists at all.
2. **The finder's "24–48 hour" non-guest booking window.** Verdict 4.6/4.7 —
   refuted; only 24 hours is published, and the 48-hour half is flagged as
   resting on a fabricated citation (§4.7).
3. **"All three [hotels] book up to 18 months out" (rooms).** Verdict 4.4 —
   refuted as to rooms; Casa Palmero is 12 months. Corrected and published.
4. **The 2-night/3-night minimum-stay figures.** Verdict 4.5 — refuted as
   policy (no fixed number exists); omitted per the assignment's explicit
   instruction.
5. **"161 guest rooms" for The Lodge, sourced to AAA.** Verdict 6.2 —
   refuted as sourced; AAA's page does not contain the figure. Omitted
   entirely, per the assignment's explicit instruction.
6. **The SJC route via CA-87/CA-85.** Verdict 8.3 — refuted; the operator's
   own route is published instead.
7. **Spyglass Hill's "90 days vs. 24 hours" unresolved window.** Verdict
   7.4 — refuted and resolved: the operator's own text says 3 months.
8. **A 12-month Spyglass golf window for Inn at Spanish Bay guests.**
   Verdict 7.5 — refuted outright; no operator text supports it. Omitted.

### Uncertain (12 total in the verdicts file)

1. **"25th edition."** 1.7 — omitted; not on the fetched page.
2. **Tripadvisor breadcrumb for county.** 2.3 — omitted; county rests on 2.2
   alone.
3. **The 2-night/3-night minimum-stay figures**, viewed as an uncertain
   secondary-only claim as well as a refuted policy claim (4.5 is both).
   Omitted.
4. **$695 as the confirmed 2026-27 rate.** 5.2 — published only as an
   attributed, dated, explicitly-unconfirmed report from two named secondary
   sources, never as an established figure.
5. **Casa Palmero "24 rooms."** 6.3 — omitted; Tripadvisor-only, not
   re-verified.
6. **"Stillwater reopened November 2025 after renovation."** 6.6 — omitted;
   a trading-status claim in any case.
7. **Current trading status of both restaurants.** 6.8 — omitted; no
   "currently open" claim is made about either.
8. **Spyglass Hill's access window before the operator text resolved it.**
   Folded into refuted item 7 above; the uncertainty is closed, not
   published as a hedge.
9. **No NHL/NRHP designation for Pebble Beach Golf Links.** 9.6 — an
   unconfirmed absence; nothing published either way.
10. **Airport mileages (77.8, 106/111, 8.4 miles).** 8.5 — omitted;
    Rome2Rio/TravelMath only, not independently confirmed. (The verdict's own
    suggested substitute, the operator's travel times, is also omitted here —
    see §7 above — because the assignment's no-duration rule is stricter than
    the verdict's fallback.)
11. **The Nabisco Championship, 1988**, at the confirmed-but-omitted
    boundary rather than true uncertainty — see §5's note; included here for
    completeness of the omission ledger even though its status is "confirmed
    but not published," not "uncertain."
12. **The "Mediterranean-style" descriptor for Casa Palmero.** Not
    independently checked by the verdict; flagged in §4 above as
    weaker-sourced than the rest of the file rather than silently equated
    with it.

---

## 10. What the gate caught, and what did not need catching

`MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures, on the first run.** No allowlist entry was added to
`Ethos.GolfProse`.

Before that first run, the file was written with the no-duration rule
already applied by hand — no operator travel time ("15 Minutes," "1-1.5
hours," "2-2.5 hours") was ever drafted into a sentence, because verdict §8.5
made clear those figures existed and the temptation to use them (they are
operator-confirmed, unlike the mileages) was real. Manually checked before
running the suite:

* `\d+\s*hours?` bare numeric patterns — every "24 hours" and "48-hour" in
  the file is followed by "in advance," "option," or "window," never by a
  travel word (`drive|ride|away|south|north|east|west|by car|by subway|by
  train`), so none of the `hour_patterns` or trip-duration pattern 6 fire.
  Confirmed by grep before the test run, not just by inspection.
* No numeric minutes appear anywhere in the file at all — the operator's
  "15 Minutes" travel time from MRY was cut in drafting for exactly this
  reason, before the gate could have caught or missed it.
* Proximity patterns — no "next door," "steps from," "around the corner,"
  "within walking distance," or "north/south/east/west of the
  course/clubhouse/resort/links/property/site/first tee" phrasing appears.
  The two mileage figures kept from the operator's own MRY and SJC/SFO route
  text ("approximately 2.5 miles," "approximately 18 miles") are checkable
  distances tied to a named road, not vague relations, and were not flagged
  by any pattern.

**No draft phrasing had to be rewritten after a failing run** — the
no-duration and no-vague-proximity rules were designed into the prose before
the first test invocation, using the same reasoning the Oregon trace records
about which travel-time phrasings escape the twenty-plus-two pattern set.
Given that verdict §8.5's own recommended text ("15 minutes," "1-1.5 hours,"
"2-2.5 hours") would very likely have passed the gate outright — bare
numeric minutes fire pattern 1 unconditionally, so "15 Minutes" would in fact
have been caught; but "1-1.5 hours" and "2-2.5 hours," with no trailing
travel-anchor word, would **not** have fired any pattern — this is recorded
as a live gate gap for later waves: **a decimal-range hour figure with no
anchor word ("1-1.5 hours") escapes every current pattern.** It is absent
from this file by the author's own choice under the assignment's explicit
"no trip durations, none" rule, not because the gate would have stopped it.
A future state author relying on the gate alone, rather than on this rule,
could ship "the drive from the airport takes 1-1.5 hours" clean.

---

## 11. Roster row (for the roster agent — not written by this file)

Per instructions, `priv/seed_data/golf_courses_roster.json` was **not**
touched. The values a roster agent will need, restated here for convenience,
all traceable above:

* `course`: Pebble Beach Golf Links
* `facility`: Pebble Beach Resorts
* `city`: Pebble Beach
* `county`: Monterey County
* `criterion`: ranking
* `ranking_source`: Golf Digest Best in State, California
* `ranking_position`: 2
* `ranking_edition`: "2025-'26" (not "25th edition" — see §0)
* `second_course`: Spyglass Hill Golf Course
* `access`: open to the public; resort guests (The Lodge at Pebble Beach, The
  Inn at Spanish Bay, or Casa Palmero) can reserve a tee time up to 18 months
  ahead subject to an unpublished minimum-stay requirement; non-guests can
  reserve only 24 hours ahead, subject to availability
* `verified`: true
