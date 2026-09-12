# Illinois — Cog Hill Dubsdread: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/illinois.json`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/illinois-verdicts.md` — the
   independent verifier's adjudication. **The authority.** Tally: **43
   confirmed · 4 refuted · 7 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/illinois-finder.md` — the
   finder. Context only. It carries all four refuted claims and one
   mischaracterisation of a real document (the "Patriarch of Public Golf"
   attribution); where the two disagree, the verdicts file wins.
3. `priv/seed_data/golf/oregon.json` and `docs/golf/oregon.md` — the structural
   template this file and its JSON copy exactly.

**The governing rule:** a verdict vouches only for what its own text restates,
not for every clause of the sentence the finder wrote around it.

**The refuted-with-correction rule:** where a verdict is `refuted` but supplies
a correction naming what may still be published, that correction's text ships
**verbatim** and nothing else from the item does. Four of five refuted items in
this file follow that rule to the letter (aerification, White Fence Farm
distance, Cantigny's renovation status, the Jemsek epithet). The fifth — the
credit-card quote — is refuted only as to where it terminates, corrected by
continuing the quote rather than by rewriting it.

**4 places, 4 entries, 1 guide, 6 sections, 6 FAQ answers, 0 photos.**

---

## 0. The identity that decided the file

The ranked course is **Cog Hill Golf & Country Club: Course No. 4 – Dubsdread**,
#14 of 35 on Golf Digest's Illinois 2025-'26 Best in State countdown, literal
label **"Public."** This survives on two independently-agreeing methods (raw
Wayback HTML, structurally parsed, and a live-page WebFetch cross-check), and
the verdict is unusually strong here: **all thirteen positions above it were
individually verified, twice**, and every one carries the literal label
"Private." That thirteen-deep private field is itself a fact worth publishing,
and it anchors section 2 of the guide.

Cog Hill fields four courses (Nos. 1–4). The gate caps a guide at two
`golf-course` places, and the guide's subject is Course No. 4 specifically —
Courses 1–3 are named once, in the intro, to make that scope explicit, and are
not places in this file.

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| course | Cog Hill Golf & Country Club: Course No. 4 – Dubsdread | §1 — confirmed, two independent methods agreeing on rank, name and label |
| position | #14 of 35 | §1 — confirmed |
| label | "Public" | §1 — confirmed, literal rubric text |
| city | Lemont | §2, §8 (Golf Digest's own national-ranking page corroborates a third time) — confirmed. **Not** Palos Park (Wikipedia's infobox) — see omission O1. |
| county | **Cook County** | §2 — confirmed by two independent US Census geocoder calls (address match, then coordinate reverse-lookup) |
| county subdivision | Lemont township | §2 — confirmed, from the coordinate reverse-lookup |
| incorporated place | **none returned** | §2 — confirmed absence. The address sits in unincorporated Cook County. |
| state | Illinois | §1 |

County and the "no incorporated place" fact are both taken from the verdict's
own re-run geocoder calls, not derived from the city name — the same
discipline the Oregon trace used, and the same reason it matters: a true fact
citing the wrong kind of source is exactly the failure mode this programme
keeps re-finding.

`county: "Cook County"` derives `/destinations/illinois/cook-county` for the
guide. Individual places carry their own, different counties (Will, DuPage) —
see §2 below.

---

## 1. The guide

`slug: illinois-golf-guide` · `destination: "Bolingbrook, Illinois"` ·
`state: "Illinois"` · `county: "Cook County"` · `photos: []`

**The destination is not the course's own town.** Per the task's basecamp
rule — where a visitor sleeps — the only lodging this research found is Best
Western Bolingbrook, in Bolingbrook, Will County (§9). The verifier's dedup
check (§10) confirmed no address collision with this project's existing
Wrigley Field ballpark guide, whose places are all city-of-Chicago addresses;
Bolingbrook, Romeoville, Wheaton and unincorporated Lemont are all outside
Chicago and outside that guide's coverage.

### Intro

| Published | Verdict |
|---|---|
| "#14 of 35 courses, labelled \"Public\"" | §1 — confirmed |
| "Every one of the thirteen courses ranked above it ... carries the literal label \"Private,\" each verified individually and twice, by two independent methods" | §1 — confirmed, this is the verifier's own method description |
| "Dubsdread, in Lemont, Cook County, is therefore the first course on the list that a member of the public can book" | §1, §2 — confirmed; a direct inference from the confirmed rank/label table, not itself sourced text |
| "Golf Digest's own \"America's 100 Greatest Public Golf Courses\" page separately ranks it #76 nationally" | §8 — confirmed by the verifier's own raw-HTML block parse of the awarding body's page, not the operator's claim about it |
| "Cog Hill operates four courses in all; this guide is about Course No. 4 specifically" | §1 heading + the task's own instruction that the gate caps a guide at two `golf-course` places |

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`, no trailing mode. **No trip
duration appears anywhere in this section or this file** — every distance is a
road mileage.

| Published | Verdict |
|---|---|
| "12294 Archer Avenue in Lemont, an address the operator's own site gives on both its homepage and its contact page" | §8/finder §8 (address), and the finder's own note that the address was confirmed twice on the operator's site |
| "the US Census geocoder matches exactly" | §2 — confirmed, `matchedAddress` string quoted in the verdict |
| "Cook County, ... Lemont township, ... no incorporated place" | §2 — confirmed, both geocoder calls |
| "Cog Hill's own contact page carries no airport or mileage information" | §9 — confirmed: "`https://coghillgolf.com/contact/` carries address, phone, hours and staff directory but no airport or mileage information" |
| "about 18 miles ... MDW" / "about 26 miles ... ORD" | §9, U5 — confirmed as hedged figures. The verdict gives a range (finder's point 18.3/26.0 mi vs. the verifier's alternate node 19.4/27.7 mi) and explicitly directs: publish "about 18 miles from Midway" and "about 26 miles from O'Hare," not a decimal. Published exactly that way. |
| "Both figures are OSRM's, not the operator's, and are node-dependent by roughly a mile" | §9, U5 — confirmed, the attribution the verdict requires |

**No route/road names (I-55, IL-83, IL-171) are published for the airport
legs.** See omission O2 — U4 records these as "not independently re-derived,"
and the Oregon precedent (dropping OR 126 rather than publishing an
unconfirmed road) is followed here even though this case is weaker evidence of
error, not a refutation.

### Section 2 — `Thirteen private courses ahead of it`

| Published | Verdict |
|---|---|
| the two Golf Digest quotes ("Below you'll find..." and "Of the 35 courses...") | §1 — confirmed verbatim |
| all thirteen names, cities and the "Private" label | §1 — confirmed, the verifier's own table, reproduced in full |
| "Dubsdread ... is the first course on the list that a member of the public can book" | Follows directly from the confirmed rank/label table |
| the #76 national-ranking sentence, repeated with its full citation string | §8 — confirmed, the verifier's exact quoted line: `76. Cog Hill Golf & Country Club: Dubsdread (Course #4)` — rubric "Public" — subtitle "Lemont, IL" |

This section exists because the task instructions call the thirteen-deep
private field "a true and interesting fact about golf in Illinois" that "the
guide may say so" — it is the one piece of scope in this file that goes beyond
the strict minimum, and every name in it is individually confirmed twice in
§1, not copied from the finder's unverified list.

### Section 3 — `Dubsdread`

| Published | Verdict |
|---|---|
| Dick Wilson and Joseph L. Lee, completed 1964, "a year after Cog Hill's Course No. 3" | §8 — confirmed, Wikipedia raw wikitext line 189 and the independent corroboration at line 49 ("Course #3 was added in 1963 and Dubsdread was completed in 1964") |
| Rees Jones renovation, 2007–2008 | §8 — confirmed verbatim from Wikipedia raw wikitext |
| "per the club's Wikipedia article, corroborated by the operator's own architect credits" | §8 — confirmed; the operator's page names the same two architects without the renovation date, which is why Wikipedia carries the renovation claim and the operator's page corroborates only the names |
| Western Open 1991–2006, BMW Championship 2007, 2009–2011 | §8 — confirmed, Wikipedia infobox `tournaments` field, exact years |
| the full aerification paragraph | §4 — this is **the verdict's own "exact publishable text," verbatim**, correcting the finder's refuted claim that no dated closure information exists |
| 2026 green fee $149–225, twilight from $110, junior $108, inclusions | §3 — confirmed verbatim, and the price carries the source's own "2026" date, the only condition under which it may publish |

**The aerification paragraph is the single most consequential correction in
this file.** The finder reported a "GAP: no page found ... states explicit
seasonal open/close calendar dates" and treated the season as unsourced. The
verifier found the finder's own cited rates page links "View 2026 Aerification
Schedule" three times, fetched it, and produced dated, course-specific
disruption data. Publishing the finder's version would have told a reader
nothing was known about closures when a dated schedule exists; this file
carries the verdict's correction word for word.

### Section 4 — `Playing Dubsdread`

| Published | Verdict |
|---|---|
| "the words \"member\" and \"membership\" are absent ... \"resident\" is absent too" | §3 — confirmed, string-absence facts from the rates and homepage text |
| the 60-day booking quote, verbatim | §3 — confirmed verbatim |
| the credit-card quote, **continued past "Dubsdread."** | §3 — confirmed verbatim, **with the caveat honoured**: the finder printed this as a closed sentence ending at "Dubsdread." The verdict is explicit that the sentence continues "...and Friday-Sunday on Course No. 1/2/3," and forbids publishing it as though it ended earlier. This file quotes the full continuation. |
| ForeUp portal, phone 866-264-4455 | §3 — confirmed, both linked from the operator's own site and printed on two pages |

### Section 5 — `The weekend around the course`

| Published | Verdict |
|---|---|
| "White Fence Farm ... about 8.9 miles by road from Cog Hill" | §5 — **this is the verdict's own corrected figure, verbatim.** The finder's 3.7 mi is refuted: it was computed from a coordinate that reverse-geocodes to a bare point in Lemont, not to the restaurant in Romeoville. The verifier re-derived the real restaurant coordinate by forward-geocoding its name and address, then re-routed: 8.9 mi. |
| "operating by its own account \"since its beginning in the early 1920s\"" | §5 — confirmed verbatim from the restaurant's own site |
| the "NO SPLIT CHECKS" quote | §5 — confirmed verbatim |
| "Best Western Bolingbrook ... is 9.1 road miles from Cog Hill" | §9 — confirmed, both the finder's and verifier's OSRM calls agree exactly |
| "its own site returned HTTP 403 to verification, so this guide names it only as a hotel at that address, with no claim about whether it is currently trading" | §9, U1 — confirmed as to the 403 (the verifier re-tested `bestwestern.com` itself); U1 is the uncertain-trading item, and the published sentence is the "no trading claim" the rule requires rather than an omission of the hotel altogether |
| "Joe Jemsek, who bought Cog Hill in 1951, was known as the \"Patriarch of Public Golf\" — an epithet attached to the man, not to the club's own branding" | §7 — **this is the verdict's own corrected sentence, essentially verbatim.** The finder's claim that Cog Hill "markets itself" with this phrase is refuted: the operator's own page attaches the epithet to Joe Jemsek by name, not to the facility. |

### Section 6 — `Day two: Cantigny Golf`

Published as **the verdict's own "exact publishable text," verbatim**, per §6:

> Cantigny Golf in Wheaton, DuPage County, ranked #35 and labelled "Public" on
> the same Golf Digest list, is about 24 miles from Cog Hill. It is partway
> through a multi-year renovation: the Woodside nine closed for construction
> in June 2026 and is projected to reopen in June 2027, and Cantigny keeps 18
> holes open for play throughout. Book through the club's own site or on
> 630.668.8463.

The finder's claim presented Cantigny as an unqualified day-two option — "the
same 'Woodside/Lakeside/Hillside/Youth Links' complex," no renovation
mentioned. §6 refutes the omission: the operator's own "Golf Course
Renovation" page, which the finder never opened, states the Woodside nine
(named in the very ranking title the finder cited) is closed for construction
as of today, projected to reopen in June 2027. Publishing Cantigny without
this caveat would have implied a course not currently playable in full is
fully available. Both occurrences of this fact in the file (this section and
the matching FAQ answer) carry the caveat.

`DuPage County` for Cantigny's own location is stated at §10 of the verdicts
file ("the second course in Wheaton (DuPage County)"), not independently
re-derived by a geocoder call the way Cook County was — recorded here so the
distinction is visible.

### FAQ

Six questions. The gate requires one matching `play|tee time|tee times|book`;
two match by design (booking and day-two).

* "How do I book a tee time on Dubsdread?" — §3, §4's access rule, and the
  aerification correction from §4, all three brought together because a
  visitor deciding whether they can play needs the booking rule and the dated
  disruption in the same place.
* "What does a round cost?" — §3, the dated 2026 green fee.
* "Is Cog Hill a members-only club?" — §3's string-absence facts, answered
  plainly rather than left as an inference the reader has to make.
* "Where is Cog Hill, and what county is it in?" — §2, stated honestly with
  the "no incorporated place" fact rather than rounded up to a village name.
* "How does Dubsdread rank nationally?" — §8, both rankings side by side with
  their own labels.
* "Which course should I play on day two?" — §6's correction, verbatim,
  repeated from the section so the FAQ alone answers the question completely.

---

## 2. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum: the ranked course and one
second course.

| slug | kind | town / county | rests on |
|---|---|---|---|
| `cog-hill-dubsdread` | `golf-course` | Lemont / Cook County | §1, §2, §3, §4, §8 |
| `cantigny-golf` | `golf-course` | Wheaton / DuPage County | §6, §10 |
| `white-fence-farm-romeoville` | `restaurant` | Romeoville / Will County | §5, §10 |
| `best-western-bolingbrook` | `hotel` | Bolingbrook / Will County | §9, §10, U1 |

Every one of the four has `photos: []`, as does the guide. See omission O3.

**Two places carry an `address` field** (`cog-hill-dubsdread`,
`white-fence-farm-romeoville`, and `best-western-bolingbrook`) because the
verdict independently establishes a street address for each of them (§2, §5,
§9) — unlike the Oregon file, where no verdict established one for any place
and the field was omitted entirely. `cantigny-golf` has no `address`: no
verdict gives one, only a distance and a general town.

**Slugs.** §10's residual-slug-risk note lists `cog-hill`, `cantigny-golf`,
`white-fence-farm` and `best-western-bolingbrook` as all unused in the corpus
today. This file qualifies two of them further — `cog-hill-dubsdread` (not
bare `cog-hill`, since Cog Hill fields four courses and the slug should name
the one this guide is about) and `white-fence-farm-romeoville` (qualified by
town per the task's own instruction, even though the bare slug was already
confirmed unused) — and keeps `cantigny-golf` and `best-western-bolingbrook`
as the verdict recorded them.

**`status: "open"` on all four is not a trading claim**, including on Best
Western Bolingbrook, whose trading status is explicitly uncertain (U1). Per
`Ethos.Seeds.DataGuide`'s moduledoc and the Oregon precedent (Inn at Face Rock
carried the same `status: "open"` under the same kind of uncertainty), `"open"`
renders nothing and is the absence of a closed claim; the no-trading-claim rule
is honoured in the prose (§5's sentence), which is where a trading claim would
otherwise live.

Four entries, one per place, all `place_slug` values resolving inside this
file.

---

## 3. Every omission, and why

### The refuted claims

**O1 — "Palos Park" as the club's town.** *Uncertain, U6, resolved against
Wikipedia.* Wikipedia's infobox gives `location = Palos Park, Illinois`, but
the operator, the Census geocoder match, and Golf Digest — twice, on both its
state list and its national list — all say Lemont. Per the task's explicit
instruction, Palos Park is not published anywhere in this file, in either
direction.

**O2 — the named airport route steps (I-55 / IL-83 / IL-171).** *Uncertain,
U4.* "Not independently re-derived. Low risk, but unverified." Rather than
publish an OSRM-generated route description the verifier did not personally
re-run, this file states only the mileage and attributes it to OSRM, following
the same caution the Oregon trace applied to an actually-refuted road name
(OR 126, that file's O10).

**O3 — every photo.** `guide.photos: []` and `photos: []` on all four places.
No photo scout has run for this state.

**O4 — "3.7 driving miles" for White Fence Farm.** *Refuted, §5.* Derived from
a coordinate that reverse-geocodes to a bare point in Lemont, not to the
restaurant. Replaced by the verdict's own re-derived figure, 8.9 miles,
verbatim.

**O5 — "GAP: no page found ... states explicit seasonal open/close calendar
dates."** *Refuted, §4.* The finder's own cited rates page links a dated 2026
aerification schedule it did not open. Replaced by the verdict's full
correction paragraph, verbatim, in the Dubsdread section.

**O6 — Cantigny presented without its renovation status.** *Refuted by
omission, §6.* The Woodside nine — named in the very ranking title the finder
leaned on — is closed for construction until June 2027. The verdict's full
corrected paragraph publishes instead, in both the section and the FAQ.

**O7 — "Patriarch of Public Golf" as Cog Hill's own branding.** *Refuted, §7.*
The operator's page attaches the epithet to Joe Jemsek, the man who bought the
club in 1951, not to the facility. Published as the verdict's corrected
sentence, attributing the epithet to the man.

**O8 — the credit-card quote as a closed sentence ending at "Dubsdread."**
*Refuted by omission, §3.* The sentence continues "...and Friday-Sunday on
Course No. 1/2/3." Published as the full continuation, never as a sentence
that stops early.

### The uncertain claims not published

**O9 — "Rated #1 in Illinois — Golfweek."** *Uncertain, U2.* The operator's own
claim, never checked against Golfweek's own page. Omitted entirely, per the
verdict's explicit instruction that "uncertainty about an award publishes as
nothing."

**O10 — any claim that Best Western Bolingbrook is open or currently
trading.** *Uncertain, U1.* Name and address only, from OSM/Nominatim. §5
states the 403 and the resulting no-trading-claim rule directly in the prose
rather than leaving it to be inferred.

**O11 — Dubsdread's own playing season, or any "year-round" claim.**
*Uncertain, U3, confirmed absent.* "364 days" belongs to the Learning Center
(confirmed at §4); "year-round facility" belongs to the range, learning
centre, shops, restaurant and banquet hall (confirmed at §4). The finder was
right to flag rather than transfer these, and the verifier explicitly upheld
that distinction. No season claim of any kind is published for the golf
course itself.

**O12 — exact-decimal airport mileages.** *Uncertain, U5.* Two Nominatim nodes
each for MDW and ORD give figures roughly a mile apart. Published as "about 18
miles" and "about 26 miles," the verdict's own hedge, never as a bare decimal.

**O13 — "Rated #1 in Illinois — Golfweek"'s sibling, no historic-landmark
status.** *Uncertain, U7.* Absence of evidence, not a sourced negative.
Nothing is published in either direction.

### The rules-driven omissions

**O14 — every trip duration.** No number of minutes or hours describing a
journey appears anywhere in this file. Every distance is a road mileage,
hedged where the verdict itself hedges (airport mileages) and exact where the
verdict is exact (White Fence Farm 8.9 mi, Best Western 9.1 mi, Cantigny ~24
mi).

**O15 — every vague proximity phrase.** No "next door," "steps from," "within
walking distance," or direction relative to an unnamed feature ("north of the
course") appears. Directions are given only where the verdict itself supplies
one, and none does for the distances in this file, so none is invented.

**O16 — any price without the source's own date.** The only prices in this
file — the 2026 green fee schedule — carry the "2026" heading the operator's
own page attaches to them, the only condition under which they publish.

**O17 — a street address for Cantigny.** No verdict establishes one; §2 above
records why the other three places do carry one and this one does not.

---

## 4. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, on the first run. No allowlist entry was added;
`Ethos.GolfProse`'s allowlist remains `[]`.

No drafted phrasing needed rewriting for this file — the aerification and
distance corrections were copied verbatim from the verdict's own "exact
publishable text," which is itself already gate-clean prose (dates and road
mileages, no durations, no vague proximity), so the gate holes the Oregon
trace records (spelled-out hour durations like "Approximately a 2.5-hour
drive") were never approached here. Every distance in this file names a road
mileage and, where the source supports it, a road name; none states a drive
time.

---

## 5. What is absent from the whole file

* **No trip duration of any kind.** Every distance is a road mileage.
* **No vague proximity.** No spatial claim in this file relies on an unnamed
  feature or a bare directional relation.
* **No price without the source's own date.** The only prices published carry
  the operator's own "2026" heading.
* **No trading claim for Best Western Bolingbrook**, stated in the prose
  rather than left to be inferred from its `status: "open"` field.
* **No inference published as a citation.** Palos Park, the Golfweek claim,
  the year-round/364-day claims, and any specific route-road name for the
  airport legs are each a true-sounding or plausible detail that either a
  verdict refutes or leaves uncertain. All are out.
* **No third `golf-course` place.** Cog Hill's Courses 1–3 are named once, in
  the intro, to state scope, and are not seeded as places.
