# Hawaii — Manele Golf Course: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/hawaii.json`.

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/hawaii-verdicts.md` — the
   independent verifier's adjudication. **The authority.** Tally: **16
   confirmed · 8 refuted · 3 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/hawaii-finder.md` — the
   finder. Context only, and the verdicts file's own header says to treat it
   with suspicion. Where the two disagree, the verdicts file wins.
3. `priv/seed_data/golf/oregon.json` — the structural template this file
   copies.

**The governing rule, unchanged from Oregon:** a verdict vouches only for what
its own text restates, not for every clause of the sentence the finder wrote
around it. **The refuted-with-correction rule:** where a verdict is `refuted`
but supplies a correction naming what may still be published, that
correction's text ships **verbatim** and nothing else from the item does.

**4 places, 4 entries, 1 guide, 4 sections, 6 FAQ answers, 0 photos.**

---

## 0. The fact that decided the whole file

Both halves are `confirmed` verbatim, from two named sources, in direct
contradiction:

- Golf Digest, in its block titled "2. Manele Golf Course" (`o-InfoBox`
  method) and in its `data-course-info` JSON (`displayedFacilityType:
  "Public"`, `private: false`), labels the course **"Public."**
- Four Seasons Resort Lanai, which operates it, states on **two of its own
  pages**, fetched live: **"Course access is not available for day guest
  use."**

Per the verdicts file's closing section ("Can a non-resort-guest play Manele,
and how? On the published evidence: no."), this is not a booking window or a
priority scheme — it is a flat exclusion. This file states the disagreement
in the intro, in a dedicated section ("Who can play here"), and again in the
FAQ, exactly as instructed, rather than smoothing it into "resort-priority."

**The tool-access record behind §2's closure dates is itself load-bearing**:
`fourseasons.com` 403s both plain curl and WebFetch, but returns **HTTP 200,
13,325 bytes** to curl carrying a full browser header set. That live fetch —
not the Wayback Machine, which only holds two 2026 captures of the relevant
page, both stale — is the only route to the current closure text. Recorded
here because the corpus's own tuning notes call out exactly this kind of
tool-access finding as something to preserve, not just act on.

---

## 1. The guide

`slug: hawaii-golf-guide` · `title: "Manele Golf Course: Golf on Lānaʻi,
Hawaii"` · `destination: "Lānaʻi, Hawaii"` · `state: "Hawaii"` ·
`county: "County of Maui"` · `photos: []`

### Intro

| Published | Verdict |
|---|---|
| "places Manele Golf Course second and labels it \"Public\"" | §1 Method A/B — confirmed, three routes, two raw |
| "states on two of its own pages: \"Course access is not available for day guest use\"" | §3, half two — confirmed, both page URLs given |
| "Those two named sources disagree... a visitor who is not staying at the resort cannot play this course" | §3's closing verdict, and the dispatch's own instruction to state the disagreement rather than editorialise it into something narrower |
| "in the County of Maui — Hawaii records zero incorporated places in every Census vintage" | §4 — confirmed, TIGERweb 0/0/0 across BAS 2026, ACS 2025, Census 2020 |
| "County of Maui, the jurisdiction's own name for itself" | §4 — confirmed, `mauicounty.gov` address block, footer, and the charter PDF cover/foreword/officials page |
| "this guide then turns to Kapalua: Plantation, on Maui" | §1 Method A row (rank 3, Public, Lahaina, HI) — confirmed |

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`. **No trip duration appears
anywhere in this file** — the ferry crossing's "approximately one hour and ten
minutes" is confirmed by the verdict but deliberately never published, per the
dispatch's explicit ban on publishing a crossing duration.

| Published | Verdict |
|---|---|
| "Lānaʻi has no road or bridge connection to another island" | §5 — a reader cannot drive between Hawaiian islands; the section's own framing |
| Lanai Airport (LNY), Airport Road, Lanai City, HI 96763, "served by interisland planes" | §5 — confirmed verbatim, Hawaii DOT's own site |
| Expeditions ferry, ʻAuʻau Channel, route Māʻalaea, Maui → Mānele, Lānaʻi | §5 — confirmed, `go-lanai.com`, live. **"Māʻalaea," not "Lahaina"** — the verdict flags that the same page's customer-testimonial text still says Lahaina and must not be quoted as the current route; this file uses only the route line |
| "the ferry lands at Mānele, the same bay the golf course sits above" | §5 — confirmed: the ferry route's own Lānaʻi terminus is named Mānele, the golf course's own name |
| 10.8 miles, Lanai Airport to Four Seasons Resort Lanai, "a road distance, not a straight-line one" | §5 — confirmed, OSRM `driving`, 17,432 m; published as a mileage with no duration, per the section's own framing note |
| zero incorporated places statewide, all three TIGERweb vintages; 483 California, 149 Alaska, 8 Rhode Island; 163 Hawaii CDPs | §4 — confirmed, the layer-4/11/18 table |
| "Lanai City, the CDP nearest the course and the mailing address the Census geocoder returns for it" | §4 — confirmed: the address-endpoint geocode of the resort's own address resolves to "1 MANELE RD, LANAI CITY, HI, 96763" |
| County of Maui named from the site, address block, footer and charter cover | §4 — confirmed, all four citations |

### Section 2 — `Manele Golf Course`

| Published | Verdict |
|---|---|
| rank 2, label "Public," `displayedFacilityType`/`private`/`facilityType` JSON fields | §1 Method B — confirmed |
| "Best in State: Ranked second, 2021 to current" / "2025-'26 ranking (and previous): 2nd" | §1 — confirmed, Wayback and live course page |
| "Only one course ranks above it: Nanea Golf Club... \"Private\"" | §1 — confirmed, the sole entry above #2 |
| hours Tue–Sun, 8:00 a.m. first tee – 6:00 p.m.; closed Mondays | §2 — confirmed hours verbatim; the Monday consequence is the verifier's own explicit addition ("the finder reported the hours but never drew the Monday consequence") |
| closed for aeration 21–28 September 2026, 29 March–4 April 2027, 20–27 September 2027 | §2 — confirmed, the corrected live text, **superseding the finder's stale May 11–18 / Sept 21–28, 2026 pair** |
| "Special post-aeration rates are available" | §2 — confirmed verbatim, no figure given, none published here |

### Section 3 — `Who can play here`

This section is §3's correction, published in full: the access sentence, the
adjoining "or days" sentence (quoted together, per the verdict's explicit
instruction not to quote one without the other), the club-rental scoping, the
"Member for a Week" product, and the statement that no green-fee page,
tee-time page or non-guest rate exists anywhere on the operator's site.

| Published | Verdict |
|---|---|
| "Course access is not available for day guest use" | §3 half two — confirmed, two page URLs |
| full corrected quote ending "...ensure a memorable day – or days – on the greens" | §3 — the `refuted`-with-correction item; the finder's truncated version (ending "...ensure a memorable day.") is **not** published |
| "complimentary... for resort guests playing 9- or 18-hole rounds after 12:00 noon" | §3 — confirmed verbatim |
| "Member for a Week"... "unlimited golf for one player at any time during a seven-day stay" | §3 — confirmed verbatim |
| "no green-fee page, no tee-time booking page and no non-guest rate... a telephone line, +1 (808) 565-2000, and a chat widget" | §3 — confirmed, "the only routes offered are a phone number... and 'Chat With Us'" |
| "a visitor who is not staying at Four Seasons Resort Lanai cannot play Manele Golf Course" | §3's closing verdict paragraph, quoted in substance |

### Section 4 — `Kapalua: Plantation, the practical round`

| Published | Verdict |
|---|---|
| rank 3, label "Public," Lahaina, HI | §1 Method A row 3 — confirmed |
| "Kapalua fields two ranked courses on the list, Plantation at third and Bay at nineteenth" | §1 — confirmed, the multi-course hazard note naming Kapalua explicitly |
| "On Maui, not on Lānaʻi" | the island-constraint rule: every place must be on Lānaʻi or the guide must say plainly where it is not |
| reached by the Expeditions ferry (Mānele → Māʻalaea) or Maui's own airports | §5 — confirmed, same ferry route reversed; no separate Maui-airport source was fetched, so no airport is named, only that Maui has its own |
| "no claim about Kapalua: Plantation's green fee, tee-time policy or hours" | nothing in either research file reaches Kapalua's own pages — an honest absence, not an inferred one |

### FAQ

Six questions; the gate requires one matching `play|tee time|tee times|book`
and the first one does. Every answer restates a section above.

* "Can a visitor who is not a resort guest play Manele Golf Course?" — §3.
* "Is Manele Golf Course public or private?" — §1 + §3, stated as a
  disagreement rather than reconciled.
* "When is Manele Golf Course closed?" — §2's corrected closure dates and
  Monday closure.
* "How do I get to Lānaʻi?" — §5, airport and ferry, no duration.
* "I can't book a tee time at Manele — where else can I play?" — §1 row 3 +
  §5's reversed ferry route.
* "What county is Manele Golf Course in?" — §4, County of Maui vs. "Maui
  County," and the zero-incorporated-places fact.

---

## 2. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum: the ranked course and one
practical second course.

| slug | kind | rests on |
|---|---|---|
| `manele-golf-course-lanai` | `golf-course` | §1 (rank, label, JSON fields), §2 (hours, closures) |
| `kapalua-plantation-maui` | `golf-course` | §1 Method A row 3 |
| `four-seasons-resort-lanai` | `hotel` | §3 (access quotes, rental scoping, Member-for-a-Week, no-booking-page finding), §5 (basecamp) |
| `sensei-lanai-koele` | `hotel` | §5's refutation of "no Lodge at Koele property operates" |

Every one of the four has `photos: []`, as does the guide. No photo scout has
run for Hawaii.

**`town` field.** Per §4's own stated consequence — "there is no incorporated
place to publish. The place field is the island — Lāna'i" — every Lānaʻi
place in this file carries `town: "Lānaʻi"` rather than "Lanai City," even
though the Census geocoder's own address match resolves the resort's mailing
address to Lanai City. Publishing "Lanai City" as the `town` field would be
exactly the mailing-city-as-locality trap the verdicts warn against; the
prose names Lanai City and Koele specifically (for Sensei Lānaʻi) without
promoting either into the structured town field. Kapalua: Plantation, being
on a different island entirely, carries `town: "Lahaina"` — the subtitle
Golf Digest's own ranking page prints for it.

**`county` field is `"County of Maui"` on all four places**, without
diacritics, exactly as §4 specifies. Maui island and Lānaʻi are both within
the same county-equivalent, so Kapalua: Plantation carries the identical
value.

**No `address` field on any place.** No verdict establishes a checkable street
address for a place record (the Census match is a geocoding artifact, not an
address to publish as this file's own claim).

**`status: "open"` on all four is not a trading claim** — it is the absence of
a closed claim, per `Ethos.Seeds.DataGuide`'s moduledoc, and Manele Golf
Course's specific closure dates are stated in prose, which is where a trading
claim belongs.

Four entries, one per place, all `place_slug` values resolving inside this
file.

---

## 3. Every omission, and why

### The eight refuted claims

**O1 — "closed for aeration May 11 to 18 and September 21 to 28, 2026."**
*Refuted, §2.* The May window is over and the operator's live pages have
removed it; publishing it would print a closure that already ended.
Published instead: the three current windows recovered by curl with full
browser headers — 21–28 September 2026, 29 March–4 April 2027, 20–27
September 2027.

**O2 — the truncated access-adjoining quote, "...ensure a memorable day."**
*Refuted, §3.* The full sentence continues "– or days – on the greens," and
the verdict is explicit that the two sentences (this one and the access
exclusion that follows it) must be quoted together or not at all. Published
in full, adjoining the exclusion sentence.

**O3 — "USD 85 plus tax" for the Pro-V1 ball sleeve.** *Refuted, §3.* The
correct live text reads "USD 105 plus tax" with different wording ("Pro-v 1,"
"rental golf clubs"). **Neither figure is published**, independent of the
correction: no date is attached to either the finder's price or the
corrected one, and the prose-rules gate requires a source's own date on any
price. This is a price omitted twice over — once for accuracy, once for the
dating rule.

**O4 — "Maui County" as the published county field.** *Refuted, §4.* That is
the Census's own label, not the jurisdiction's self-name. Published:
`County of Maui`, sourced to the county's own site, address block, footer and
charter.

**O5 — Hawaii's "Incorporated Places: []" as an empty-but-present key.**
*Refuted in form, confirmed in substance, §4.* The key is absent entirely,
not empty; the verifier's own TIGERweb layer table (0 across three vintages,
against non-zero controls) is the citation actually published, not the single
control-point description.

**O6 — "No separate Lodge at Koele property found currently operating."**
*Refuted, §5.* Sensei Lānaʻi, A Four Seasons Resort, operates at that site,
live, taking reservations. Published as its own place record
(`sensei-lanai-koele`), explicitly stated to be at Koele and not at Manele.

**O7 — The Cavendish as an open, free, playable nine.** *Refuted with an
`uncertain` status attached, §5.* The claim rests on a February 2018 Wayback
capture of a Hawaii Tourism Authority page Wikipedia itself flags
`url-status=dead`; that same stale page describes a neighbouring property,
"The Lodge at Koele," under a name no longer in use — direct internal
evidence the page is out of date. Live `gohawaii.com` 403s to curl with full
browser headers and to WebFetch; no operator page or current source exists.
Per the verdict's own instruction ("Publish it only as unverified, or leave
it out"), **The Cavendish does not appear anywhere in this file** — not as a
place, not in prose, not in the FAQ. The second, practical course this guide
names instead is Kapalua: Plantation, a confirmed `Public`-labelled entry on
the same Golf Digest list.

**O8 — the finder's "two independent methods" claim for the ranking.**
*Refuted, §1.* The finder's second "method" was a WebFetch summarized read,
not a second raw structural parse. The verifier supplied the actual second
raw method (`data-course-info` JSON) and it agrees with the first, so the
*conclusion* (rank 2, Public) still publishes — sourced to the verifier's own
two-method cross-check, not to the finder's mischaracterized one.

### The three uncertain claims

**O9 — a dollar green fee for Manele Golf Course.** *Uncertain, §6.* The
operator publishes no figure at all, only "Please inquire for special rates
and conditions." Golf Digest's course page carries a figure that moved from
$385 (17 Oct 2025 capture) to $550 (live) with no season attached at either
reading, and Golf Digest is not the operator. **No fee of any kind is
published** in this file, matching the verdict's explicit instruction that no
dated, seasoned green fee exists to publish.

**O10 — whether a phone-in exception to the day-guest exclusion exists.**
*Uncertain, §3's closing paragraph.* No source says non-guests are refused if
they telephone, and none says they are accommodated. This file publishes only
the operator's stated policy (no access) and directs a reader to the same
phone number the operator itself publishes, without asserting either that the
line will or will not make an exception.

**O11 — The Cavendish's current operating status generally.** *Uncertain,
§5.* Covered under O7 above: left out of the file entirely rather than
published as unverified, since the dispatch's second course is Kapalua:
Plantation instead.

### The rules-driven omissions

**O12 — the ferry crossing duration, "approximately one hour and ten
minutes."** *Confirmed by the verdict, but banned by the dispatch itself*
("Do not publish a crossing duration") and independently caught by the
prose gate's trip-duration patterns. The route, operator and terminals
publish; the duration does not.

**O13 — the architect, opening year, and any design/history detail for
Manele Golf Course** (Jack Nicklaus, 1993, lava-outcropping design, the Bill
Gates wedding anecdote). All of these appear only in `hawaii-finder.md`, none
of them re-verified in `hawaii-verdicts.md`, and the verdicts file's own
header instructs treating the finder with suspicion. None of it is published.

**O14 — "The Challenge at Manele," Wikipedia's historic name for the
course.** *Noted in §1 but not adopted.* The operator and Golf Digest both
use "Manele Golf Course," which is the name this file uses throughout.

**O15 — any PGA Tour or USGA championship history for this course.** Neither
research file establishes one for Manele Golf Course specifically (the
finder's Sentry Tournament of Champions note is for a Maui course, Kapalua
Plantation, and is not re-verified in the verdicts file at all). Nothing is
published.

**O16 — a street address for any place.** No verdict establishes one as a
checkable fact belonging to this file's own claims; see §2.

**O17 — Hulopoʻe Bay, its Marine Life Conservation District status, or any
adjacency claim between it and the course.** Appears only in
`hawaii-finder.md`'s "protected/conservation status" note, which the finder
itself flags as unconfirmed for the course ("not stated to apply to the golf
course"), and is not re-verified anywhere in the verdicts file. Omitted
entirely.

**O18 — Nobu Lanai, Malibu Farm Bar, Koele Garden Bar, or any other dining
venue.** These appear only in `hawaii-finder.md`'s basecamp section and are
never touched by the verdicts file. No restaurant, cafe or brewery place is
published in this file for that reason — the corpus of confirmed Hawaii
facts does not reach dining.

**O19 — every photo.** `guide.photos: []` and `photos: []` on all four
places. No photo scout has run for Hawaii.

---

## 4. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures, on the first run.** No allowlist entry was added;
`Ethos.GolfProse`'s allowlist remains `[]`.

Nothing in the drafted prose fired a pattern before or after drafting. The
sentences most at risk, checked deliberately against
`Ethos.GolfProse.patterns/0` in reasoning while drafting:

* "the ferry crossing... approximately one hour and ten minutes" — never
  drafted into the file at all (see O12), so the duration ban was never
  exercised against it here; it would have fired pattern 6
  (`\d+\s*hours?\s+...`) had it been written as "an hour... away," and this
  is exactly the class of sentence patterns 6/21/22 exist for.
* "10.8 miles from Four Seasons Resort Lanai" — does **not** fire pattern 5
  (`north|south|east|west of the course|clubhouse|resort|...`), because it
  carries no compass direction; it is a bare mileage, the publishable form
  the corpus already uses in Oregon ("25 miles north of Bandon Dunes Golf
  Resort" — itself publishable there only because the resort is named, not
  "the resort").
* "closed Mondays," "closed for aeration 21 to 28 September 2026" and the
  other absolute dates in this file were checked against patterns 23–28 (the
  self-dating/relative-offset ban): none carry a "days away," "from today,"
  bare "Today is," or "as of today" construction, so none fire. This file
  contains **no relative-dating language anywhere** — every date is stated
  in the source's own absolute terms, exactly as the dispatch requires.
* "seven-day stay," "9- or 18-hole rounds," "after 12:00 noon" — none of
  these match the minute/hour trip-duration patterns, which require a
  travel verb (drive/ride/away/etc.) following the number; a stay length and
  a round length are not journeys, matching the corpus's own documented
  rationale for why "a 4-hour round" and "24-hour front desk" must keep
  publishing.

**What the gate does not catch, and the defence instead:** an unsourced
*containment* claim in ordinary prose is grammatically identical to a sourced
one and no pattern in `Ethos.GolfProse` separates them (Oregon's own
moduledoc, §7 rung (c)). The defence here is this trace: every containment
claim in `hawaii.json` — the golf course at the resort, Sensei Lānaʻi at
Koele and not at Manele, Kapalua: Plantation on Maui and not on Lānaʻi — is
individually cited above to a verdict item, not left to the gate to catch.

---

## 5. What is absent from the whole file

* **No trip duration of any kind, including the ferry crossing.** The route,
  operator and terminals publish; "approximately one hour and ten minutes"
  does not, by the dispatch's explicit instruction and independently by the
  prose gate.
* **No vague proximity.** The one spatial fact that could have been vague —
  the ferry landing and the course sharing a bay — is published as a named
  fact ("lands at Mānele, the same bay the golf course sits above"), not as
  a proximity relation.
* **No price without the source's own date.** There are none to publish: no
  green fee (uncertain, unseasoned, and not the operator's own figure) and
  no ancillary price (the ball-sleeve figure carries no date at all).
* **No trading claim for either hotel place** beyond what each operator's
  own site states about itself (Sensei Lānaʻi "live and taking reservations,"
  matching what the verdict itself asserts, not a further inference).
* **No Cavendish claim of any kind**, per its own uncertain-status
  instruction — not as a place, not in prose, not as a "some sources say"
  hedge.
* **No inference published as a citation.** The Audubon-style failure mode
  from Oregon does not recur here because this file publishes nothing that
  is not a direct verdict quote or a direct verdict-table fact — no
  architect, no opening year, no championship history, no dining venue, no
  conservation-district adjacency.
