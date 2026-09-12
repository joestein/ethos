# Tennessee — General's Retreat: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/tennessee.json`.

**This file is committed on purpose.** The research artifacts live under
`.superpowers/`, which `.gitignore` excludes. A year from now this file is
the only thing that can answer "where did that sentence come from."

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/tennessee-verdicts.md`
   — the independent verifier's adjudication. Tally: **25 confirmed · 6
   refuted · 6 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/tennessee-list-recheck.md`
   — a second, later verifier pass that re-examined the ranking-page claims
   §0 of the verdicts file called "unproven." **Both files are authority, and
   where they disagree the recheck wins**, because it is the later, more
   thorough pass and it re-derives the same conclusion by two independent
   methods plus an archival cross-check.
3. `.superpowers/sdd/2026-09-05-golf-courses/research/tennessee-finder.md` —
   the finder. Context only. Its Basecamp section (§6, on-site cottages and
   an on-site grill) was **not published**, because neither verdicts file
   re-verifies those specific pages, and this trace's rule is that every
   published clause must trace to a verdict, not to an unverified finder
   claim. That is why this file, unlike Oregon's, ships only two places.

**The governing rule:** a verdict vouches only for what its own text
restates, not for every clause of the sentence the finder wrote around it.

**2 places, 2 entries, 1 guide, 5 sections, 6 FAQ answers, 0 photos.**

---

## 0. Why Tennessee is the one state on a different rule

Every other state in this fifty-state set is anchored on the highest-ranked
entry carrying Golf Digest's own "Public" label on that state's Best in
State 2025-'26 ranking. Tennessee's ranking has fifteen entries and **every
one is labelled Private.** There is no Public entry to anchor on, so this
guide uses the set's stated fallback: the publicly accessible course in the
state with the strongest verifiable competitive record.

**That finding was contested, refuted, and then re-confirmed — the whole
episode is preserved here because a reader who sees "all fifteen Private"
deserves to be able to find out that it was disputed and how it was
settled.**

### Round 1 — the finder's original claim

`tennessee-finder.md` §0 restates a prior finder pass: the Best in State page
at `https://www.golfdigest.com/guides/tennessee-best-golf-courses-rankings`
has 15 entries, all Private, established by (1) a WebFetch of the live URL
and (2) a curl of Wayback snapshot `20260315114452`, both agreeing.

### Round 2 — the verifier's refutation (`tennessee-verdicts.md` §0)

The verifier re-fetched from scratch and reported the *opposite*:

- `curl` with a full browser header set and WebFetch **both returned HTTP
  404**, a genuine 237,298-byte Golf Digest error page — `<title>404 |
  GolfDigest.com</title>`, zero `o-InfoBox`, zero `data-course-info`.
- The cited Wayback snapshot **had zero CDX captures, ever** — confirmed by
  `archive.org/wayback/available` returning an empty
  `archived_snapshots` object and a CDX exact query returning an empty body,
  with working controls (golfdigest.com homepage, example.com) proving CDX
  itself was functioning.
- Verdict: "the predicate for invoking the fallback at all is unproven," and
  every downstream claim about the fifteen-entry list — including "TPC
  Southwind is #6" — was marked **uncertain**, not confirmed and not refuted.
- A live counter-indication was flagged in the same pass: Hermitage's own
  site claims President's Reserve was "voted 'Top 10 in State' by Golf
  Digest," which sits in tension with "all fifteen are Private" and
  "cannot be adjudicated while the ranking page is unreachable."

**This refutation is what "WHAT MUST NOT BE PUBLISHED" item 1 in
`tennessee-verdicts.md` is about** — it instructs that nothing about the
Best in State list be published, on the reasoning that the URL 404s and the
snapshot never existed.

### Round 3 — the recheck's re-confirmation (`tennessee-list-recheck.md`)

A third, later pass took the refutation itself as the thing to test, rather
than the original claim, and found the refutation was the error:

- `golfdigest.com` **discriminates on request headers.** Plain curl and
  curl with only UA/Accept/Accept-Language headers both return **403 Access
  Denied**; a full browser header set (`sec-ch-ua`, `sec-ch-ua-mobile`,
  `sec-ch-ua-platform`, `Sec-Fetch-Dest/Mode/Site/User`,
  `Upgrade-Insecure-Requests`) returns **HTTP 200, 101,576 bytes**, the real
  ranking page, titled *"The best golf courses in Tennessee"*, with 225
  `o-InfoBox` occurrences and one `data-course-info` JSON array.
- The **237,298-byte body the verifier called a "genuine 404" is the site's
  generic soft-404 shell**, served to any request that does not present the
  full header set — byte-identical to what a URL that never existed also
  returns. It is large enough to look like a real fetch and titled like a
  real 404, so a structural check on it "correctly" finds nothing, on a page
  that was never actually reached.
- The cited Wayback snapshot **does exist**: a CDX query for
  `golfdigest.com/courses/guides/tennessee-best-golf-courses-rankings`
  returns six captures including `20260315114452`, and fetching it
  (`...id_`) returns HTTP 200, 137,333 bytes, 15 `o-InfoBox__a-Rubric` spans,
  all reading Private. The verifier's CDX query had used a URL path
  (`/guides/...`) one segment short of the real one
  (`/courses/guides/...`) — a URL-shape mismatch, not an absent snapshot.
- **Two independent parses of the working page agree exactly**: parsing the
  embedded `data-course-info` JSON array, and — after stripping that
  attribute out first, so the second method could not see the first
  method's data — parsing the rendered HTML's 15 `o-InfoBox__a-Rubric`
  spans bound within their own segment. Same 15 courses, same 15 ranks
  (1 The Honors Course through 15 Hillwood Country Club), same 15 labels,
  same order. Rank 6 is TPC Southwind.
- **Verdict: "the first researcher's fifteen-Private enumeration was
  correct, and the Wayback snapshot they cited does exist. Nothing was
  fabricated; the refutation was the error."**
- The President's Reserve counter-indication was resolved, not left open:
  its "Top 10 in State" claim traces to a **different, unranked** Golf
  Digest guide, `best-public-courses-tennessee` — 15 unranked courses, all
  `Public`, including both Hermitage courses — not to the Best in State
  ranking. President's Reserve does not appear in Best in State at all.

**What this trace publishes, and on what authority.** The recheck is the
later, more thorough pass, it names the exact header requirement that
explains why the refutation happened, it reproduces the finder's original
enumeration by two independent methods that agree exactly, and it identifies
the specific error in the refutation's own CDX query. Per this project's
stated rule ("the re-check overrides the verdicts file where they
disagree"), **this guide publishes the fifteen-entry, all-Private finding,
the rank-6 TPC Southwind fact, and the resolved President's Reserve
counter-indication — all on the recheck's authority**, and explicitly
supersedes `tennessee-verdicts.md`'s "WHAT MUST NOT BE PUBLISHED" item 1 on
the exact point the recheck re-examined.

---

## 1. The guide

`slug: tennessee-golf-guide` · `destination: "Old Hickory, Tennessee"` ·
`state: "Tennessee"` · `county: "Metropolitan Government of Nashville and
Davidson County"` · `photos: []`

### The county field

The verdicts file's original correction (§4) and the recheck agree: the
field takes the jurisdiction's own name for itself, not the Census
rendering. The Census geocoder (re-run at `x=-86.6381772&y=36.2347717`)
returns County → **Davidson County**, Incorporated Places →
**"Nashville-Davidson metropolitan government (balance)."** That second
string is the Census's own rendering, with the Census's own `(balance)`
disambiguator — exactly the pattern this corpus already excludes elsewhere
("Town of Mosel" over "Mosel town," "Municipality of Anchorage"). The
government's own site, `nashville.gov`, gives its name in its own metadata:
`<title>Metro Nashville and Davidson County | Nashville.gov</title>` and
`<meta name="description" content="Official website of the Metropolitan
Government of Nashville and Davidson County.">`. **Published:**
`Metropolitan Government of Nashville and Davidson County`. This is the
finder's trap, correctly caught and corrected by the verifier.

### Intro

| Published | Verdict |
|---|---|
| "Tennessee's ranking has fifteen entries, ranked 1 through 15, and every one of them is labelled 'Private'" | recheck §3, confirmed by two agreeing methods |
| "confirmed by two independently-run parses ... agree exactly ... corroborated separately by an archived snapshot" | recheck §2, §3 — confirmed |
| "TPC Southwind, ranked 6th ... a current PGA Tour venue that hosts the FedEx St. Jude Championship" | verdicts §1 (Wikipedia extract, confirmed) + recheck §3 table (rank 6) |
| "'the PGA TOUR's only private golf club in the state of Tennessee'" | verdicts §1 — confirmed verbatim from `tpc.com/southwind/` raw HTML |
| "publishes no green fee, and offers no tee-time booking route of any kind" | verdicts §1 — confirmed; zero `green fee`/`guest play`/booking hrefs found |
| "General's Retreat ... carries the historical record instead — the LPGA Sara Lee Classic, played there from 1988 to 1999" | verdicts §2.1, §2.2 — confirmed, with the "ended in 1999" wording corrected to "played there... from 1988 to 1999" (see §2 below) |
| "a direct call to its own booking system returned bookable tee times with no membership, no booking class and no sign-in required" | verdicts §2.3 — confirmed, 28 slots, `booking_class_id: false`, no auth |

### Section 1 — `Getting there`

Heading is exactly `Getting there`, lowercase `t`. No trip duration appears
anywhere in this file — every distance is a road mileage with a named road.

| Published | Verdict |
|---|---|
| BNA is the nearest major airport; 11.7 miles (18,798.3 m) by road, via Donelson Pike 1.61 mi, I-40 3.33 mi, Old Hickory Boulevard 4.87 mi | verdicts §6 — confirmed, re-run by the verifier to the metre, matching the finder exactly |
| the routing engine's destination waypoint reads "Hermitage Golf Course" | verdicts §6 — confirmed, independently corroborating the coordinates |
| address 3939 Old Hickory Blvd, Old Hickory, TN 37138 | verdicts §2.4 — confirmed, quoted from the rate page |

**Not published: that the coordinates came from the operator's embedded
Google Maps link on the contact page.** Verdicts §5 refutes this — the
contact page contains no such coordinates, only an address query string and
an unrelated central-Florida template artefact. The coordinate *values*
are confirmed accurate (OSRM snaps them to a "Hermitage Golf Course"
waypoint), so they publish; the finder's sourcing claim about *where they
came from* does not, and this trace does not repeat it.

### Section 2 — `A different rule for this state`

Restates §0 above in guide prose. Every clause traces to the recheck as
tabulated in §0: HTTP 200 with a full header set, the soft-404 shell
explanation, the two agreeing parses, the archived snapshot, rank 6 being
TPC Southwind, and the resolved President's Reserve "Top 10 in State"
claim (quoted verbatim from Hermitage's own marketing, per recheck §4,
which is itself corroborating the verdicts file's original §0 sighting of
the same sentence).

### Section 3 — `General's Retreat`

| Published | Verdict |
|---|---|
| opened 1986, Gary Roger Baird | verdicts §2.2 — confirmed, operator `/about/` and `/gr-rates/` |
| "hosted the LPGA Sara Lee Classic from 1988 to 1999" | verdicts §2.1 — confirmed by operator and independently by Wikipedia's tournament article |
| "the Sara Lee Classic played on the LPGA Tour from 1988 to 2002 overall... moved to the Legends Club of Tennessee in Franklin and continued as the Electrolux USA Championship through a final edition in 2002" | verdicts §2.2 — this is the finder's stated error, corrected: **not** "the tournament ended in 1999" — only its Hermitage tenure did. Ships in the corrected form only. |
| "the sister course, President's Reserve, was not built until 2001, two years after the tournament left Hermitage, so it cannot have hosted any of the twelve editions" | verdicts §2.2 — confirmed, decisive date arithmetic |
| "'the best in Tennessee public golf'" and "'one of the state's premier public courses'" | verdicts §2.3 — confirmed verbatim from `hermitagegolf.com/about/` |

**Refuted-with-correction, applied exactly:** the finder's sentence "the
tournament ended in 1999" is flatly wrong (verdicts §2.2, and restated in
"WHAT MUST NOT BE PUBLISHED" item 3). The correction's own wording —
"hosted at Hermitage 1988–1999," the tournament itself running to 2002
elsewhere — ships verbatim in substance; nothing of the finder's original
phrasing does.

### Section 4 — `Playing General's Retreat`

The access and pricing paragraph is built entirely from verdicts §2.3 and
§2.4, the section the verifier called "decisive."

| Published | Verdict |
|---|---|
| "bookable without membership... no sign-in requirement... 28 bookable tee times with no authentication and no booking class attached" | §2.3 — confirmed by executing the booking API directly: `GET .../api/booking/times?date=09-20-2026...` → HTTP 200, `booking_class_id: false` |
| "For Sunday, September 20, 2026 ... $84 ... plus $16 ... a total of $100 — reconciling to the cent with the course's own published Friday-through-Sunday, 10 a.m.-to-4 p.m. rate of $100.00" | §2.4 — confirmed exactly: the live booking engine's 12:00 quote for Generals Retreat is $84 green fee + $16 cart = $100, matching the Fri–Sun 10–4 PM row |
| the full Mon–Wed/Thu/Fri–Sun rate table | §2.4 — confirmed verbatim from `/gr-rates/` |
| rental clubs $60.00/day | §2.4 — confirmed |
| "no bookable tee time at all on either course on September 16 and September 17, 2026; the cause is not established" | §3.3 — confirmed as fact (`[]` returned for both dates, both courses; adjacent dates return 13–28 slots; ruled out as a booking-window artefact, a weekly pattern, and a sellout, leaving cause **uncertain**, most likely outing buyouts) |
| "no closure notice appears anywhere" and "'in pristine condition come September'" | §3.1 — confirmed; the dated 31 August 2026 blog post is the positive corroboration the verifier found, and the sentence is quoted verbatim |
| "this is recorded as an open question... not as a closure" | Direct instruction honoured: §3.3 explicitly forbids calling this a closure, only an uncertain-cause unavailability |

### Section 5 — `President's Reserve`

| Published | Verdict |
|---|---|
| opened 2001, Denis Griffiths | verdicts §2.2, §7 — confirmed |
| "'300 acres of natural Tennessee wetlands and along the banks of the beautiful Cumberland River'" | verdicts §7 — confirmed verbatim from `/pr-rates/` |
| "No professional-championship record was found for this course" | verdicts §7 — confirmed, none found |
| the full Mon–Wed/Thu/Fri–Sat/Sun rate table | verdicts §7 — confirmed verbatim, and date-reconciled at §2.4 |
| "For the same Sunday, September 20, 2026 ... $94 ... plus $16 ... a total of $110, matching the published Sunday rate to the cent" | verdicts §2.4 — confirmed: live quote for Presidents Reserve 14:18 is $94 + $16 = $110, matching Sunday 10–4 PM = $110.00 |
| "a Golf Digest 'Public' label of its own, on the separate, unranked guide ... not on the Best in State ranking, which does not include it" | recheck §4 — confirmed: `Facility Type: Public` on its own Golf Digest page, listed on `best-public-courses-tennessee`, absent from Best in State |

### FAQ

Six questions. The gate requires one matching `play|tee time|tee times|book`
— the first does, twice over. A second FAQ answers why this state's
criterion differs from every other state's, as required.

* "How do I book a tee time at General's Retreat?" — §2.3, §2.4.
* "Why was Tennessee's course chosen by a different rule ...?" — §0 above,
  recheck §3, §5.
* "Why isn't TPC Southwind in this guide?" — verdicts §1, recheck §3 (rank
  6).
* "What does a round cost at General's Retreat?" — §2.4.
* "Can I play President's Reserve too?" — §2.3 (same booking system), §2.4
  (dated quote).
* "Where is General's Retreat?" — §4 (address, county correction), §6
  (routing).

---

## 2. Places, against the verdicts they rest on

**Two `golf-course` places — the gate's maximum, and both of them are the
whole file's inventory.** Unlike every other state's file in this corpus,
no restaurant, hotel or other amenity place is included. The finder's §6
("Basecamp") names on-site cottages and an on-site grill, sourced to
`hermitagegolf.com/cottages/` and `/grill/`, but **neither verdicts file
re-fetches or re-verifies either page**; the verifier's own closure sweep
(§3.1) reads the general site for closure strings but does not confirm the
cottages' room count, amenities, or the grill's hours as facts in their own
right. Per this project's rule that every published clause must trace to a
verdict, those two candidate places are omitted rather than published on
finder-only sourcing. This is a smaller file than Oregon's for that reason,
and it follows the same minimal precedent already in this corpus
(`arizona.json`, `montana.json`, `south-dakota.json` each ship 2 places).

| slug | kind | rests on |
|---|---|---|
| `hermitage-generals-retreat` | `golf-course` | verdicts §2.1–§2.4, §4, §6 |
| `hermitage-presidents-reserve` | `golf-course` | verdicts §2.2, §2.4, §7; recheck §4 |

Both places carry `photos: []`, as does the guide. No photo scout has run
for this state.

**No `address` field on either place.** The street address (3939 Old
Hickory Blvd, Old Hickory, TN 37138) appears in guide prose, sourced to the
operator's rate pages, but the place schema in this corpus (see
`oregon.json`) does not carry a dedicated `address` field and this file
follows that shape.

**`status: "open"` on both is not a trading claim** — per
`Ethos.Seeds.DataGuide`'s moduledoc, `"open"` renders nothing and is the
absence of a closed claim. The 16–17 September 2026 unavailability finding
is stated in the prose as an open, uncertain-cause question, which is where
a trading caveat belongs; it is not encoded as `status: "closed"`, because
the verifier explicitly found no closure.

Two entries, one per place, both `place_slug` values resolving inside this
file.

---

## 3. What TPC Southwind is, and why it is not a place

TPC Southwind is named in guide prose three times (intro, "A different rule
for this state," and the FAQ "Why isn't TPC Southwind in this guide?") and
appears nowhere in `places` or `entries`. This is deliberate, not an
omission to explain away: a `golf-course` place record would give a private
club a page in a set about courses a reader can actually play, and the
brief instructs that it must not be one. Every fact stated about it —
its FedEx St. Jude Championship record, its rank-6 position, its own
"PGA TOUR's only private golf club in the state of Tennessee" quote, and
that it publishes no green fee or booking route — traces to verdicts §1 and
recheck §3–§4, as tabulated above.

---

## 4. Every omission, and why

**O1 — the finder's "the tournament ended in 1999."** *Refuted, verdicts
§2.2.* The Sara Lee Classic ran on the LPGA Tour 1988–2002; only its
Hermitage tenure ended in 1999. Published instead: "hosted ... from 1988 to
1999," with the tournament's later life stated separately and correctly.

**O2 — "coordinates recovered from the operator's embedded Google Maps
directions link on the contact page."** *Refuted, verdicts §5.* The
contact page carries no such coordinates — only an address query string and
an unreplaced Florida template artefact. The coordinate values are
confirmed accurate by an independent method (OSRM's waypoint match) and
publish; this specific sourcing claim does not.

**O3 — "Nashville-Davidson metropolitan government (balance)" as a
self-name.** *Refuted, verdicts §4.* It is the Census's own rendering.
Published instead: `Metropolitan Government of Nashville and Davidson
County`, from `nashville.gov`'s own page metadata.

**O4 — "no dedicated calendar/news page exists" for Hermitage.** *Refuted,
verdicts §3.2.* An active blog exists at `hermitagegolf.com/blog/`, with
nine posts running through 31 August 2026, and it is the source for the
"in pristine condition come September" quote this guide publishes. The
finder's absence claim is not repeated.

**O5 — any claim that the 16–17 September 2026 unavailability is a
closure.** *Deliberately avoided, per instruction and per verdicts §3.3,
which found no closure notice and expressly could not rule out a
simultaneous full-course sellout as implausible while a booking-system
cause remained unconfirmed.* Published as an open, dated, uncertain-cause
question instead.

**O6 — the on-site cottages and the on-site grill as places.** *Not a
finding to omit so much as a sourcing gap*: see §2 above. Neither verdicts
file independently re-verifies `hermitagegolf.com/cottages/` or `/grill/`,
so neither publishes as a place or as prose.

**O7 — President's Reserve's "Top 10 in State" claim as verified fact.**
*Uncertain as an independent fact per verdicts §0, resolved as to its
referent per recheck §4.* Published exactly as the recheck resolves it: the
club's own marketing claim is quoted, and it is explicitly attributed to
the separate, unranked "best public courses" guide rather than treated as a
Best in State placement.

**O8 — any USGA/PGA Tour championship count, hole-by-hole yardage claim,
or National Register / conservation designation for either Hermitage
course.** No verdict establishes any of these; verdicts §2.2 and §9 note
"no protected/National Register status found" and this trace records the
absence as an absence rather than inventing a number.

**O9 — every photo.** `guide.photos: []` and `photos: []` on both places.
No photo scout has run for this state.

---

## 5. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, on the first run. No allowlist entry was added;
`Ethos.GolfProse`'s allowlist remains `[]`.

No drafted phrasing fired a pattern in this file. The prose was written
directly in checkable form from the start — road mileage with named roads
("11.7 miles ... via Donelson Pike ... I-40 ... Old Hickory Boulevard"),
absolute dates throughout ("Sunday, September 20, 2026," "September 16 and
September 17, 2026," "31 August 2026"), and no relative or self-dating
language anywhere ("today," "currently," "this week" and their family do
not appear in this file at all). The one place a draft might naturally have
reached for a relative date — describing the 16–17 September finding — was
written as an absolute-dated open question from the first draft, per the
brief's explicit instruction not to call it a closure.

---

## 6. Roster row (not written — `golf_courses_roster.json` is owned by a
finalize agent)

For the finalize agent, the row this state's research supports:

| field | value | verdict |
|---|---|---|
| `course` | `General's Retreat` | verdicts §2.1–§2.4 — matches the seeded `golf-course` place's `name` exactly |
| `facility` | `Hermitage Golf Course` | verdicts §2, §7 |
| `city` | `Old Hickory` | verdicts §2.4 (operator address) |
| `county` | `Metropolitan Government of Nashville and Davidson County` | verdicts §4, corrected |
| `access` | public, no membership; booking API returns bookable times with no auth, no booking class; $84 green fee + $16 cart = $100 for Sunday, September 20, 2026 | verdicts §2.3–§2.4 |
| `criterion` | `championship` — **not** `ranking`, unlike every other state | recheck §5, verdicts §0/"WHICH COURSE THE FALLBACK SELECTS" |
| `ranking_source` | `null` | Tennessee has no Golf Digest "Public" anchor to cite as a ranking source for this course |
| `ranking_edition` | `null` | as above |
| `ranking_position` | `null` | General's Retreat is not on the Best in State list at all; it is not a ranking-anchored pick |
| `second_course` | `President's Reserve` | verdicts §7 |
| `verified` | `true` | |

This row is intentionally unlike every other state's: all ranking fields
are null because the pick was made on the fallback criterion (competitive
record + genuine public access), not on a Golf Digest "Public" ranking
position. `priv/seed_data/golf_courses_roster.json` was **not modified** by
this work — it is owned by a finalize agent per the dispatch's instruction.

Full golf-gate run for this file:
`MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures.**
