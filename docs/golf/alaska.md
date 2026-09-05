# Alaska — Anchorage Golf Course: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/alaska.json`,
following the register set by `docs/golf/oregon.md`, the golf set's checkpoint
file.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/alaska-verdicts.md` — the
   independent verifier's adjudication. **The authority.** Tally: **23
   confirmed · 4 refuted · 2 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/alaska-finder.md` — the
   finder. Context only. It carries the four refuted claims; where the two
   disagree, the verdicts file wins.

**The governing rule (same as Oregon):** a verdict vouches only for what its
own text restates, not for every clause of the sentence the finder wrote
around it. **The refuted-with-correction rule:** where a verdict is `refuted`
but supplies a correction naming what may still be published, that
correction's text ships as close to verbatim as the surrounding sentence
allows.

**3 places, 3 entries, 1 guide, 5 sections, 5 FAQ answers, 0 photos.**

---

## 0. Two PDFs, recovered the same way, both load-bearing for the county field

Both jurisdiction sources — the Alaska Legislature's local-government paper and
the Municipality of Anchorage's own 2024 ACFR — are PDFs that WebFetch's HTML
conversion garbled. The verifier recovered both the same way the finder
predicted: `curl` to fetch the raw bytes (HTTP 200, 1,040,277 bytes and
5,984,486 bytes respectively), then `pdftotext -layout` to extract clean text
locally, and every jurisdiction quote below is read from that extracted text,
not from a WebFetch conversion. This is recorded here because the county field
below rests entirely on those two extractions, and a later reader auditing
"why does this say Municipality of Anchorage" needs to know the quotes were
read from a clean local extraction, not summarized by a tool that mangles PDF
tables.

## 1. The jurisdiction — why the field says "Municipality of Anchorage," not a county

This is the fact a later reader will most want explained, so it is explained
here before anything else.

**Alaska has no counties.** The state legislature's own research service
(legfin.akleg.gov, `21-028m-Local-Government-In-Alaska.pdf`) states plainly:

> "there were no counties in Alaska because the Organic Act of 1912 had
> specifically prohibited the Territorial Legislature from creating a county
> form of government, unless it had been approved by an 'affirmative action'
> of Congress."

The same report records that the constitutional convention deliberately
avoided the word, quoting the 1961 "Final Report on Borough Government":

> "It is understandable why the members of the Committee on Local Government
> and the delegates to the Constitutional Convention deemed it necessary to
> avoid the use of the name 'county' and developed a unit of local government,
> the borough."

So the field cannot be a county — there is no such thing here to name. But it
also cannot be "borough," because Anchorage specifically is not a borough in
name. The Municipality of Anchorage's own 2024 Annual Comprehensive Financial
Report (muni.org) states, in its "Profile of the Municipality of Anchorage":

> "The City of Anchorage was originally incorporated in 1920 and unified with
> the Greater Anchorage Area Borough in 1975 to create the Municipality of
> Anchorage."

The same document self-names throughout as "the Municipality," never
"Anchorage Borough" and never "Anchorage County," and is addressed "To the
Honorable Mayor, Members of the Assembly, and Citizens of the Municipality of
Anchorage." Applying the rule this corpus already used for the District of
Columbia and for Baltimore City — the jurisdiction's own name for itself, not
a Census Bureau county-equivalent label — the field is:

```
"county": "Municipality of Anchorage"
```

This is verdict §3.1–3.2, confirmed. The Census Bureau's own QuickFacts page,
which would have supplied a "county (equivalent)" label, was 403-blocked on
both WebFetch and curl and was not used — the ACFR settles the self-naming
question on its own and nothing turns on the blocked page.

**Applied to all three places in this file, including Moose Run.** Only the
Anchorage Golf Course place has a verdict directly establishing its
jurisdiction (the address is the one the ACFR and the golf-course site both
confirm). Moose Run Golf Course sits at Joint Base Elmendorf-Richardson, and no
verdict item independently confirms JBER's municipal jurisdiction. The
`county: "Municipality of Anchorage"` value on that place record is therefore
an inference, not a direct citation: JBER lies within the geographic area the
1975 unification folded into the Municipality (the legislative report's own
grouping of "populous boroughs (Anchorage, Mat-Su, Fairbanks, Kenai)" treats
Anchorage as a single unified area with no smaller jurisdiction carved out of
it), and no source anywhere suggests JBER sits in a different borough or the
Unorganized Borough. This inference is flagged here rather than presented as
independently sourced, per the county-miscitation caution recorded in
`docs/golf/oregon.md` §0. The place's `town` field, by contrast, is sourced
directly: Golf Digest's own ranking page lists the course's city as "Fort
Richardson, AK" (verdict §6.1), which is what `town: "Fort Richardson"` cites.

---

## 2. The guide

`slug: alaska-golf-guide` · `destination: "Anchorage, Alaska"` ·
`state: "Alaska"` · `county: "Municipality of Anchorage"` · `photos: []`

### Intro

| Published | Verdict |
|---|---|
| "ranks Anchorage Golf Course first in Alaska — a list of only two courses" | §1.2, §2.1 — confirmed |
| the quoted sentence *"an abbreviated Best in State list based on just a dozen or so evaluations from some ambitious travelers"* and *"It's also not simple to get panelists there"* | §1.3 — confirmed verbatim, Golf Digest's own words, reproduced across two independently-prompted fetches |
| "Public" label | §1.2 — confirmed |
| address 3651 O'Malley Road, Anchorage, AK 99507 | §2.2 — confirmed, operator's own site |
| "a Municipality of Anchorage Public Facility" | §4.1 — confirmed verbatim |
| Alaska has no counties / Organic Act of 1912 / 2024 ACFR self-naming | §3.1–3.2 — confirmed, see §1 above |
| Bill Newcomb, opened 1987 | §8.1 — confirmed |
| Forrest Richardson, ASGCA, renovation began 2008, expected to conclude 2028 | §8.1 — confirmed |
| season early May through mid-October | §5.1 — confirmed, refutes the finder's "gap" characterization |
| Moose Run Creek Course second on the same list, also "Public" | §6.1 — confirmed |

### Section 1 — `Getting there`

Heading is exactly `Getting there`. **No trip duration appears anywhere in
this file.**

| Published | Verdict |
|---|---|
| Ted Stevens Anchorage International Airport (ANC) named as the gateway | §7.1 — confirmed (implicit in the operator's own airport directions) |
| the airport-route quote, verbatim, "approximately 1.5 miles ... approximately 2 miles" | §7.1 — confirmed verbatim |
| the downtown-route quote, verbatim, "approximately six miles ... approximately 2 miles" | §7.2 — confirmed verbatim, and this route **is** fully quantified end to end |
| address repeated | §2.2 |
| Moose Run "operates at Joint Base Elmendorf-Richardson, but its two courses sit outside the base gates" and the Glenn Highway / Arctic Valley Road exit routing | §6.3 — this is the refuted item's **correction text**, used as the verdict supplies it |

**No total airport-to-course mileage is published.** Only two of three segments
carry a number on the operator's own page (1.5 mi + an unquantified Minnesota
Boulevard/Drive stretch + 2 mi); verdict §7.1 states this explicitly as a
gap and forbids summing the two known segments into a route. The fully
quantified downtown route (approximately six miles plus approximately two
miles, both the operator's own figures) is published instead, exactly as
Oregon's file used its own fully-quantified alternative route.

**No mileage or duration is published for Moose Run's distance from the
airport.** See omission O1 below — this is the banned "20 minutes from the
airport" duration, and the verdict states no distance figure exists on that
page to substitute.

### Section 2 — `Anchorage Golf Course`

| Published | Verdict |
|---|---|
| ranking #1, "Public," ranking history "1989, 2017-'20, 2025-'26" | §2.1 — confirmed |
| the abbreviated-list quote, in full, including "It's also not simple to get panelists there" | §1.3 — confirmed verbatim; published a second time in this section because the task requires the caveat to sit with the ranking wherever the ranking is restated |
| Bill Newcomb designed and built the original course, opened 1987; "renowned golf course architect Bill Newcomb" | §8.1 — confirmed verbatim (operator's own course page) |
| Forrest Richardson renovation, began 2008, "a few holes a year," "due to Alaska's short growing season," expected to conclude 2028 | §8.1 — confirmed |
| "hosted a USGA championship in 2022" — no championship name given | §8.2 — the two sources name the event differently ("U.S. Women's Senior Amateur" vs. "U.S. Senior Women's Amateur"); the verdict instructs publishing the year and venue without a confident name. **This guide does neither claim the specific title nor claim it was "the first USGA champion crowned in Alaska"** — the latter rests on a single architect's marketing page and is excluded per the verdict's own caution. |
| "6,600 yard test" (operator) cited separately from "6,601 yards, slope rating 129, ... 32 bunkers" (Golf Digest) | §8.3 — confirmed with a discrepancy the verdict instructs not to blend into one uncredited figure; each number is attributed to its own source |
| season early May–mid-October, golf shop open year-round, "5am to after midnight" in midsummer | §5.1 — confirmed, refuting the finder's reported gap |

### Section 3 — `Playing it`

The access paragraph is **§4.3's correction, published as given**:

> Tee times are open to anyone; there is no membership, residency or
> affiliation requirement. The standard booking window is five days in
> advance. Out-of-state visitors are an explicit exception: the course invites
> travellers to request a tee time ahead of that five-day policy through a
> form on its Out of State page, and staff then confirm the booking. Single
> players cannot reserve online and are handled as walk-ons or on the
> stand-by list.

This is the single most important paragraph in the file, matching the brief's
instruction that the out-of-state exception is "the rule that matters most" in
a state where nearly every visitor is from out of state. The finder's version
— "Tee times can be reserved 5 days in advance," reported as the whole rule —
is exactly what §4.3 refutes: the finder never fetched the operator's own
`/golf/out-of-state` page, which publishes the exception outright.

| Published | Verdict |
|---|---|
| "At least 24 hours notice must be given to cancel or make changes" | §4.4 — confirmed verbatim |
| online booking requires a valid credit card; phone (907) 522-3363 | §4.4 — confirmed |
| 2026 Rates & Fees: 18 holes $84.00/$57.50/$55.00/$17.00; 9 holes $55.00/$37.50/$36.50/$11.50; Twilight $65.00/$47.00/$44.00/$17.00 | §4.5 — confirmed exact, **the source's own 2026 heading is the date attached**, satisfying the prices-need-a-date rule |
| "Seniors are 60+, Juniors are 17 & Under" | §4.5 — confirmed verbatim, converted to "60 and over" / "17 and under" in prose |

### Section 4 — `At the course`

| Published | Verdict |
|---|---|
| O'Malley's on the Green, "Conveniently located just off O'Malley Road at the Anchorage Golf Course," bar-and-grill menu quote | §8.4 — confirmed verbatim |
| hours Mon–Sat 11:30 a.m.–10 p.m., Sun 10 a.m.–10 p.m., Sunday brunch 10 a.m.–3 p.m. | §8.4 — confirmed |
| "The operator's page does not say whether these hours hold once the golf season ends in mid-October." | §8.4's own caveat, made explicit per the brief's instruction, mirroring Oregon's F2 caveat about undated trading claims — the source does not mark these hours as seasonal, and the course itself closes mid-October, so this guide does not assert the hours survive that closure in either direction |

### Section 5 — `Day two: Moose Run Golf Course (Creek)`

| Published | Verdict |
|---|---|
| second on the same list, "Public" | §6.1 — confirmed |
| the operator's own heading, verbatim: "Creek & Hill Courses Located Outside the Gates of Joint Base Elmendorf-Richardson" | §6.3 — this exact heading is quoted as evidence inside the refuted item; the brief explicitly instructs publishing it clearly so a reader does not prepare for base access they do not need |
| "Moose Run is a military golf facility operated at Joint Base Elmendorf-Richardson, but its two courses sit outside the base gates and it is open to the public: ... 'all Active Duty and Retired Military, Veterans, DoD Employees, their families, and our Civilian Guests,' and JBER's own Force Support site confirms the courses 'are open to the civilian community.' Civilians reach it from the Glenn Highway at the Arctic Valley Road exit without passing a base checkpoint." | §6.3 — the correction text, used as given |
| "the operator states it serves ... Civilian Guests" also independently at §6.2 | §6.2 — confirmed, two independent official sources (operator + JBER Force Support) |
| Hill Course established 1952, Army Combat Engineers; Creek Course opened 2000, architect Robin Nelson | §6.5 — confirmed verbatim |
| rate sheet "updated 08/31/2026"; civilian Daily Rates Mon–Thu $53/$36, Senior 60+ $50/$35; Fri–Sun $56/$39, Senior 60+ $53/$38; "Military and DoD tiers are priced separately and lower" | §6.4 — confirmed, and this is the verdict that **refutes** the finder's "no date on the rate sheet" claim — the date is present in the raw HTML and is what makes these prices publishable at all |

**No positive "no ID required" guarantee is published.** Verdict §6.3 states
explicitly that neither the operator nor JBER affirmatively states this, and
that a positive guarantee would overreach both sources. The guide states only
that the courses sit outside the gates and that civilians reach them without
a checkpoint — nothing about identification either way.

### FAQ

Five questions. The gate requires one matching `play|tee time|tee times|book`;
one matches directly ("How do I book a tee time...").

* "How do I book a tee time at Anchorage Golf Course?" — §4.3's correction in
  full, including the out-of-state exception the brief calls the rule that
  matters most for this state.
* "When is the golf season in Anchorage?" — §5.1, refuting the finder's
  reported gap.
* "Is Anchorage Golf Course really Alaska's best course?" — §1.3, the
  abbreviated-list caveat in Golf Digest's own words, answering the
  superlative-accretion risk the verdict flags as this list's chief danger.
* "Why does this guide say 'Municipality of Anchorage' instead of a county?"
  — §3.1–3.2, anticipating exactly the question this document's own §1
  answers, so a guide reader gets the same explanation a later auditor does.
* "Do I need base access to play Moose Run?" — §6.2–6.3, stopping the
  wrong-gate misreading the verdict identifies as the primary risk with this
  course.

---

## 3. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum: the ranked course and the day-two
course.

| slug | kind | rests on |
|---|---|---|
| `anchorage-golf-course` | `golf-course` | §1.2, §2.1, §2.2, §3.2, §4.1, §4.3, §4.5, §5.1, §8.1, §8.3 |
| `moose-run-creek-course` | `golf-course` | §6.1, §6.2, §6.3, §6.4, §6.5 |
| `omalleys-on-the-green-anchorage` | `restaurant` | §8.4 |

All three carry `photos: []`, as does the guide (omission O5). `status: "open"`
on all three is not a trading claim — see `Ethos.Seeds.DataGuide`'s moduledoc,
which Oregon's trace also cites: `"open"` renders nothing, and it is the
absence of a closed claim, not an assertion that a place trades today. The
uncertain question of whether O'Malley's hours survive the mid-October season
close is handled in the prose (Section 4, above), not by withholding
`status: "open"`.

**Two addresses ship**, both sourced: Anchorage Golf Course's `3651 O'Malley
Road, Anchorage, AK 99507` (§2.2, the operator's own directions page) and
Moose Run's `27000 Arctic Valley Rd., JBER, AK 99505` (quoted in §6.3 as the
JBER mailing address; the verdict is explicit that this address is a postal
locality and is *not* itself evidence of a gate position — it is published
here only as an address, and the "outside the gates" claim rests entirely on
the separate §6.3 correction text, not on this address). O'Malley's on the
Green has no address of its own beyond "at the Anchorage Golf Course" — no
verdict item establishes a street address distinct from the course's.

Three entries, one per place, all `place_slug` values resolving inside this
file.

---

## 4. Every omission, and why

### The four refuted claims

**O1 — "20 minutes from the airport" for Moose Run.** *Banned outright*, per
the brief and verdict §6 "What must not be published" item 6: it is a
duration, and no distance figure exists on the operator's page to substitute.
Nothing about Moose Run's distance from ANC is published in this file.

**O2 — "5 days in advance" as the whole booking rule.** *Refuted, §4.3.* The
finder's bare quote is real but incomplete: the operator's own
`/golf/out-of-state` page publishes a standing exception for out-of-state
visitors that the finder never fetched. Replaced by §4.3's correction in full.
This is the omission that matters most in this state specifically, because
nearly every visitor to Anchorage Golf Course is from out of state, and a
reader told "5 days" flat would book too late or not book ahead at all when
the course explicitly invites earlier requests.

**O3 — Moose Run as an on-base or gate-access course.** *Refuted and inverted,
§6.3.* The operator's own heading states the opposite: "Located Outside the
Gates of Joint Base Elmendorf-Richardson." Publishing an on-base reading would
send a visitor to prepare for a checkpoint that is not on their route. The
heading and the correction both ship; no "no ID required" guarantee is
invented (see Section 2 above).

**O4 — "no season/year label on the Moose Run rates."** *Refuted, §6.4.* The
rate sheet is dated "Updated 08/31/2026" in its raw HTML — the finder did not
find the date; the verifier did. The rates publish with that date attached,
satisfying the prices-need-a-date rule.

### The two uncertain claims

**O5 — Hyatt Place Anchorage-Midtown as a basecamp.** *Uncertain, §8.5.*
Blocked on both WebFetch and curl (HTTP 403 both ways); identity, room count,
and current trading status all unverified. Under the rule that uncertainty
about identity does not publish, this guide names no lodging at all. This is
a real gap in the guide — no hotel is recommended — and it is left open rather
than filled with an unverifiable name, exactly as the brief instructs.

**O6 — a confident name for the 2022 championship.** *Uncertain, §8.2.* The
architect's own project page says "U.S. Women's Senior Amateur"; Golf Digest's
course profile says "U.S. Senior Women's Amateur." Neither a USGA source was
fetched to settle which is correct. Published: the year and the fact of a USGA
championship, with no event name and no "first USGA champion in Alaska"
superlative (which rests on the single architect's marketing page and is
excluded per verdict §8.2's own instruction).

### The rules-driven omissions

**O7 — Census QuickFacts.** 403-blocked on both WebFetch and curl (verdict
§3.3). Not used; the ACFR settles the self-naming question on its own.

**O8 — jber.jb.mil news article.** 403-blocked on both methods. Not recovered;
the civilian-access finding does not depend on it, being independently carried
by the operator's own site and JBER's own Force Support site (§6.2).

**O9 — any total airport-to-Anchorage-Golf-Course mileage.** Only two of three
segments are quantified on the operator's page (§7.1). Published instead: the
segments as given, or the fully-quantified downtown alternative (§7.2).

**O10 — every award/badge Moose Run displays on its own homepage** — "America's
Northernmost 36-Hole Facility," "Alaska's only 36-Hole Golf Course," and any
Golf Digest/Golfweek self-displayed badge. Per verdict §6's "What must not be
published" item 8, a business's own site establishes existence, offering, and
location — never an award or superlative about itself. The #2 Golf Digest
placement is cited to Golf Digest's own ranking page (§6.1), not to Moose
Run's self-display.

**O11 — any unqualified superlative built on the Golf Digest ranking** — "Alaska's
best course," "top-ranked in Alaska," or any similar phrase without the
abbreviated-list caveat attached in the same sentence or the next. Per verdict
§1 "What must not be published" items 1–2, every restatement of the ranking in
this file (intro, Section 2, FAQ) carries Golf Digest's own qualifying language
alongside it.

**O12 — Hyatt Place, its address, or its room count.** §8.5, uncertain,
blocked on both methods. Not named anywhere.

**O13 — every trip duration.** No minutes, no hours, no "short drive," no
"20 minutes." Every distance in this file is a road mileage with a direction,
sourced to the operator's own directions page, or a simple absence where no
mileage exists (Moose Run's distance from ANC).

**O14 — every vague proximity.** No "next door," "steps from," "within walking
distance," or "north of the course." The one spatial claim this file makes
about O'Malley's — "just off O'Malley Road at the Anchorage Golf Course" — is
the operator's own sourced wording naming a specific road, not an invented
relation, mirroring the Fenway/Pacific Grill precedent Oregon's trace
recorded: a sourced spatial relationship publishes, an unsourced one does not.

**O15 — every photo.** `guide.photos: []` and `photos: []` on all three
places. No photo scout has run for this state.

---

## 5. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, on the first run. No allowlist entry was added;
`Ethos.GolfProse`'s allowlist remains `[]`.

Phrasing checked by hand against `Ethos.GolfProse.patterns/0` before writing,
because this state's most consequential correction sentences (§4.3's access
paragraph, §6.3's geography correction) needed to ship close to verbatim and
had to be verified clean rather than assumed clean:

* `"At least 24 hours notice must be given to cancel or make changes"` —
  clean. Pattern 6 requires `\d+\s*hours?` immediately followed by a travel
  word (drive/ride/away/south/north/east/west/by car/by subway/by train);
  "hours notice" matches none of those. Patterns 21–22 require the same travel
  anchor after "hours" and likewise do not fire. This mirrors Oregon's own
  confirmed-clean specimen, "24-hour front desk."
* `"5 a.m. to after midnight"` and `"as early as 5 a.m."` — clean. No pattern
  matches a bare clock time.
* `"just off O'Malley Road"` and `"just a dozen or so evaluations"` — clean.
  Pattern 3 requires `just` immediately followed by a digit and `min`; neither
  phrase has a digit after "just."
* `"outside the base gates"` and `"outside the Gates of Joint Base
  Elmendorf-Richardson"` — clean. The proximity pattern's direction-plus-noun
  rule only fires on `north|south|east|west of the (course|clubhouse|resort|
  links|property|site|first tee)`; "gates of Joint Base
  Elmendorf-Richardson" matches no branch of it.
* `"past Westchester Lagoon"` (inside the operator's own quoted downtown-route
  sentence) — clean, no pattern matches "past."

No new pattern gap was found for this state; the twenty-two patterns Oregon's
trace already exercises covered everything this file needed to avoid.

---

## 6. What is absent from the whole file

* **No trip duration of any kind**, including the one the brief specifically
  bans — Moose Run's "20 minutes from the airport."
* **No vague proximity.** The one spatial descriptor that ships is sourced and
  names a specific road (O'Malley Road).
* **No price without the source's own date or season attached** — the 2026
  Rates & Fees heading for Anchorage Golf Course, and the "Updated 08/31/2026"
  stamp for Moose Run.
* **No lodging is named.** Hyatt Place is excluded per its uncertain verdict,
  and no other lodging was sourced. This guide has a real gap here rather than
  an invented basecamp.
* **No trading claim for any of the three places.** `status: "open"` is not
  one; O'Malley's hours are published without a claim that they survive the
  season's mid-October close.
* **No confident championship name, and no "first USGA champion in Alaska"
  superlative** for the 2022 event — sources conflict and the superlative
  rests on one page.
* **No unqualified use of the Golf Digest ranking.** Every occurrence carries
  the "abbreviated ... just a dozen or so evaluations" caveat in Golf Digest's
  own words.
