# Iowa — Spirit Hollow: what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `priv/seed_data/golf/iowa.json`, following
the register kept for every state (see `docs/golf/oregon.md` for the format this
copies).

Sources, in order of authority:

1. `.superpowers/sdd/2026-09-05-golf-courses/research/iowa-verdicts.md` — the
   independent verifier's adjudication. **The authority.** Tally: **47
   confirmed · 7 refuted · 3 uncertain.**
2. `.superpowers/sdd/2026-09-05-golf-courses/research/iowa-finder.md` — the
   finder. Context only. It carries seven refuted claims; where the two
   disagree, the verdicts file wins.
3. `priv/seed_data/golf/oregon.json` — the structural template this file copies.

**The governing rule:** a verdict vouches only for what its own text restates,
not for every clause of the sentence the finder wrote around it.

**4 places, 4 entries, 1 guide, 6 sections, 6 FAQ answers, 0 photos.**

---

## 1. The selection — Spirit Hollow, #7, the sole "Public" entry

| | Verdict |
|---|---|
| Eight courses on Golf Digest's 2025-'26 Iowa Best in State list, none skipped | §1 — confirmed by three independent methods (raw-HTML `o-InfoBox` parse, embedded JSON, live WebFetch), all agreeing on rank, label and course for every position |
| Spirit Hollow, rank 7, labelled `Public` | §1 — confirmed, card text verbatim: "Public 7. Spirit Hollow Burlington, IA 4 11 Panelists Best In State Previous rank: 8" |
| The other seven, all labelled `Private` | §1 — confirmed for each: Des Moines Golf and Country Club: South (8), Glen Oaks Country Club (6), Wakonda Club (5), Des Moines Golf and Country Club: North (4), Cedar Rapids Country Club (3), Davenport Country Club (2), The Harvester Club (1) |
| The single-Public pattern is stable across two ranking cycles (2023-'24 and 2025-'26) | §1 corroboration table — confirmed |
| No abbreviation caveat on the ranking page | §1 — confirmed, zero hits for "abbreviat", "dozen", "handful", "partial list" |

**Published, guide intro and FAQ 2:** the eight-course list, the "Public" label
on Spirit Hollow alone, and the seven "Private" course names in rank order (as
listed on the source page, not re-sorted). This is the starkest
public-scarcity fact the corpus can state for Iowa and the task calls for
stating it plainly — done in the intro's second sentence and restated in FAQ 2.

---

## 2. THE COUNTY TRAP

| | Verdict |
|---|---|
| Course coordinates (40.76033505, -91.14467596) geocode to **Des Moines County** (FIPS 19057), not an incorporated place | §2 — confirmed via the US Census geocoder, re-run independently by the verifier on Golf Digest's own published coordinates |
| The city of Des Moines geocodes to **Polk County** | §2 — confirmed, verifier ran the same geocoder on downtown Des Moines coordinates |
| Address: 5592 Clubhouse Dr, Burlington, IA 52601 | §2 — confirmed, appears in the operator's own site footer |

**Published:** `county: "Des Moines County"` on the guide and on every place, and
the intro states the trap explicitly — "a different county from the one that
contains the city of Des Moines, which is in Polk County" — rather than
leaving a reader to assume Burlington sits near the city of Des Moines. No
sentence in this file implies proximity to the city of Des Moines; the two
mileage tables in "Getting there" list Davenport, Iowa City, Cedar Rapids and
seven other cities, and the city of Des Moines does not appear in either.

---

## 3. THE STALE-RANKING FINDING — a distinct failure class

This is the finding the dispatch specifically asked to be recorded explicitly,
because a claim where every word is true and only the tense is wrong does not
look like a defect on a first read.

**What the club's site says**, verbatim, confirmed present:

> "The result of Randy and Rick's collaboration is a course now ranked #2 Best
> in Iowa by Golf Digest and Golf World." / "Golf Digest - Best in State, #2
> ranked."

**What Golf Digest's own course page says**, verbatim, confirmed present (two
independent reads: live WebFetch and a Wayback snapshot, word for word):

> "Best in State: Ranked second, 2015-'16. Ranked fifth, 2013-'14. Ranked
> sixth, 2011-'12. Ranked seventh, 2017-'18, 2025-'26. Ranked eighth,
> 2019-'24. Ranked inside the top 10, 2003-'10." / "Previous ranking: 8th.
> 2025-'26 ranking: 7th."

**Why this is not the same failure as an invented award.** The finder's
framing (in `iowa-finder.md`, §1) was that the club's #2 claim "directly
contradicts the current 2025-'26 Golf Digest record" — implying Golf Digest
never awarded a #2. The verdicts file refutes that framing specifically: Golf
Digest's own ranking history *contains* the #2 result, for the 2015-'16 cycle.
The club did not fabricate a number; it dropped a date and let a nine-year-old
result read as current. A gate that only checks "is this number attributable
to the source" would have waved this through, because it is — the sentence
needed a second axis of scrutiny (tense), not a first one (attribution).

**Published, in the "Spirit Hollow" section and FAQ 3:** Golf Digest's ranking
history quoted verbatim in full, immediately followed by the club's own
undated repetition of the #2 figure, then a plain closing sentence: "Golf
Digest's current placement for Spirit Hollow is seventh." No sentence anywhere
in this file calls the club's claim false, fabricated, or a contradiction —
that would misstate what the verdict found. No sentence presents #2 as current
either. The word "now" from the club's own quotation is preserved inside the
quotation marks (so the club's own tense-elision is visible to a reader) but
never adopted as the guide's own voice.

---

## 4. Access — the operator's own policy, verbatim

| | Verdict |
|---|---|
| "Starting times may be reserved up to 14 days in advance." | §4 — confirmed verbatim, `golf-course-policies` page |
| Groups of 16+ wanting to book further out should contact the pro shop | §4 — confirmed verbatim |
| Cancellations require a minimum of 24 hours' notice | §4 — confirmed verbatim |
| No membership requirement; daily-fee, public course | §4 — confirmed: Golf Digest's own `facilityType: "Daily Fee"` field, no resident/non-resident tier on the rates page, no membership gate on the policy page |

**Deliberately omitted — the foreUP scheduler discrepancy.** The verifier
found the live booking widget currently loads tee times only about a week out,
not fourteen days (§4, marked **uncertain**), and explicitly warned: "Do not
publish 'book up to two weeks ahead' as a description of what the system will
actually accept." The published policy is what publishes — this file states
the 14-day policy as the operator's stated policy and says nothing about what
the live scheduler currently shows, per the verdict's own instruction.

**Deliberately omitted — the three self-published awards not independently
reachable.** The rates page's "#1 Best Course to Play in Iowa by Golfweek"
claim and its variants (homepage, history page) are confirmed **present** on
the operator's own site but **uncertain** as awards — the verifier could not
reach Golfweek to confirm them, and WebSearch was exhausted. A business's own
site cannot establish an award it claims for itself. Omitted entirely rather
than published as an attributed self-description, since nothing in this
file's scope needed it.

---

## 5. THE SEASON GAP — refuted, and the distinction that matters

The finder's claim: "No published season-opening date, closing date, or
closure notice was found for Spirit Hollow on any reachable page" — **REFUTED
in §5.** The contact page — which the finder itself cites elsewhere for
airport data — carries an "Hours of Operation" block that says, verbatim:

> "While the golf course is open, the Golf Shop, Lambo's & the Shankopotamus
> Golf Academy will be open during the following hours ... Once the course
> closes for the season, Lambo's & the Shankopotamus Golf Academy will be open
> during the following hours ..."

A second page (`lambos-dining`) independently says "For the remaining of the
golf season Lambo's will offer bar service only." Two pages state a seasonal
closure exists; one of them was a page the finder itself had already fetched.

**What is genuinely absent is a date.** No opening date, closing date, or
dated notice appears on any reachable page (§5 — confirmed as a real gap).

**Published, "Access and season" section and FAQ 4:** a seasonal closure is
stated as a fact ("Spirit Hollow closes for a winter season"), quoting both
of the operator's own hours-page sentences, immediately followed by "The
operator does not publish an opening or closing date for the season." Neither
half is dropped — stating the closure without the "no dates" qualifier would
let a reader assume dates exist somewhere; stating "no season is published"
(the finder's version) would tell a reader the course might never close.

**No closure within three weeks — confirmed, and published as a present-tense
fact rather than left implicit.** The verifier found tee times bookable daily
through the operator's own scheduler and the 2026 Tournament Series listing
events on September 26 and October 10, 2026, with an August 22 event already
showing posted results. Published: "As of this writing, tee times are
bookable and the 2026 Tournament Series lists events scheduled through
October 10." Today's date (2026-09-05) is inside that window, and the October
10 event is the outer bound the verdict establishes, not a date invented for
this file.

---

## 6. Lambo's — bar-service-only, not dining, and not quoted as "dining"

| | Verdict |
|---|---|
| Finder called Lambo's "Dining" and quoted it as "A small, neighborhood bar serves locals..." | §7 — REFUTED on two counts |
| Correct quotation: "**Our** small, neighborhood bar serves locals..." | §7 — the finder's first word was wrong in a string it presented as verbatim |
| "Effective 11/1/24, Lambo's will offer bar service only. There will be no food service available." | §7 — confirmed verbatim, contact page |
| "For the remaining of the golf season Lambo's will offer bar service only." | §7 — confirmed verbatim, `lambos-dining` page |
| The homepage's contrary "delicious meals... served up daily" is stale marketing copy | §7 — noted, and explicitly not to be quoted |

**Published:** Lambo's is placed as an `attraction` place (see §9 on kind
choice) and an entry of `kind: "tip"`, not `food` or `stay`, and every mention
in the guide states plainly that it is bar-service-only with no food service,
quoting the dated 11/1/24 notice rather than the homepage's stale copy. The
FAQ asks the question directly — "Is Lambo's a place to eat at Spirit
Hollow?" — and answers "No," because a reader who arrives expecting a meal is
exactly the failure this correction exists to prevent.

**The hours discrepancy — published as days only, per the verdict's own
instruction.** The Lambo's page gives Wednesday–Saturday as "Sunrise to 9pm";
the contact page gives the same days as "7am to 9pm." Both agree on
Sunday–Tuesday ("Sunrise to Sunset") and on the Wednesday–Saturday closing
time (9pm). Published: the agreed closing time (9pm) and the agreed
Sunday–Tuesday hours, with an explicit statement that the two pages disagree
on the weekday opening time and that none is stated here — following §7's
instruction to "publish the days without asserting the weekday opening time."

---

## 7. Getting there — mileages filled in, Nauvoo omitted, no durations anywhere

| | Verdict |
|---|---|
| Airport: "2 miles SW of Burlington, IA" (the airport's own stated location, in miles) | §9 — confirmed verbatim |
| Airport → Spirit Hollow: 2.5 road miles (OSRM driving profile, both endpoints' own published coordinates) | §9 — confirmed, refuting the finder's "unfillable gap" characterization |
| Nine other cities, road distance by OSRM: Davenport 82.5 mi, Iowa City 80.9 mi, Moline 91.6 mi, Peoria 99.3 mi, Cedar Rapids 104.1 mi, Springfield 140.8 mi, St. Louis 212.7 mi, Naperville 221.8 mi, Chicago 248.7 mi | §9 — confirmed, filling the finder's "duration only" gap |
| No road or highway number published for any of these routes | §9 — confirmed |

**Nauvoo, IL (23.8 miles) — omitted per the dispatch's explicit instruction**
("Do not publish anything about Nauvoo"), even though §9 supplies a sourced
mileage for it (23.8 miles, OSRM) and flags the finder for omitting it from
its own drive-time list. The task's instruction is a publication rule for
this file, not a correction of the verdict, so Nauvoo is left out of the
"Getting there" section entirely — the mileage table runs nine cities, not
ten.

**No duration published anywhere in this file.** The operator's own site
gives the airport as "5 minutes from" the course and every other city as a
drive time only; neither form is quoted or referenced by its duration figure
anywhere in the JSON. The "5 minutes" figure is recorded here, in this audit
trail (which the golf gate does not scan), specifically so a later reader can
see what was deliberately not carried into the seed file, rather than having
to re-derive it. The published text instead says the operator "advertises the
airport as a duration rather than a distance" and gives only the OSRM
mileage.

---

## 8. The course itself — tee data, history, tournaments

All confirmed verbatim in §10: Rick Jacobson as designer; the 1991
acquisition; Randy Winegard's quotation about hiring Jacobson; the full
Iowa Golf Association event list (Iowa Amateur 2002/2012, Senior Amateur
2009, Match Play 2005/2009, Mid-Amateur 2015, State Four-Ball 2016, IWGA
Women's Amateur 2018, Golfweek Conference Challenge 2011-2016); and the tee
data (Gold 7,550 yds / 74.8 / 134, Black 6,580, White 6,010, Rust 5,053).

**Omitted — Golf Digest's differing tee measurement.** §10 flags that Golf
Digest's own course page lists "Length 7021" and "Slope 128" against the
club's Gold-tee figures of 7,550 yards and 134 slope — almost certainly a
different tee measured, per the verdict's own note. Since the verdict does
not resolve which tee Golf Digest measured, this file publishes only the
club's own tee-by-tee breakdown, which is internally consistent and fully
attributed, rather than presenting two unreconciled numbers as though they
described the same set of tees.

**Omitted — protected/conservation status.** §10 records this as a genuine
gap: no page states one. Nothing is published in either direction.

---

## 9. Places, against the verdicts they rest on

Two `golf-course` places, the gate's maximum: the ranked course and one second
course.

| slug | kind | rests on |
|---|---|---|
| `spirit-hollow-burlington` | `golf-course` | §1, §2, §3, §4, §10 |
| `flint-hills-municipal-burlington` | `golf-course` | §8 |
| `the-lodge-spirit-hollow-burlington` | `hotel` | §7 |
| `lambos-spirit-hollow-burlington` | `attraction` | §7 |

**Lambo's kind choice.** The dispatch flagged that `restaurant`/`cafe` do not
fit an on-site bar with no food service, and asked for the honest kind with
the mismatch stated in the entry note. `attraction` was chosen from the
allowed list (`restaurant cafe brewery hotel bnb park historic-site museum
shop attraction`) because none of the food-service kinds are accurate and
`attraction` makes no claim about what is served — the summary and the entry
note (`kind: "tip"`) both state explicitly that it is a bar with no food
service, so the kind field's imprecision is not left to mislead a reader on
its own.

**All four places carry `address`,** unlike Oregon's file, because the
verdicts independently confirm a street address for Spirit Hollow (§2),
Flint Hills (§8, via its own site footer) and the Lodge (§7, same site as
Spirit Hollow — 5592 Clubhouse Dr). No address is invented for Lambo's beyond
the confirmed shared site address, since it is the same on-site facility.

**`status: "open"` on all four is not a trading claim,** per
`Ethos.Seeds.DataGuide`'s moduledoc — it renders nothing, and every trading
fact this file states (Lambo's bar-only service, the seasonal closure) is
stated in the prose itself rather than left to the status field.

**Every place has `photos: []`,** as does the guide. No photo scout has run
for Iowa.

---

## 10. Every omission, and why

**O1 — Nauvoo, entirely.** Instructed omission (see §7 above), notwithstanding
a sourced 23.8-mile OSRM figure.

**O2 — the club's Golfweek "#1 Best Course You Can Play in Iowa" claims (three
separate self-published instances).** Uncertain per §3 of the verdicts —
unreachable at Golfweek itself, and a business's own site cannot establish an
award for itself. Omitted rather than published as an attributed
self-description, since the guide's scope did not require it.

**O3 — the foreUP scheduler's ~7-day tee-time load window.** Uncertain per §4
— an observation about the current state of a booking widget, not a published
policy statement, and the verdict explicitly warns against publishing it as
what the system will accept. The published 14-day figure is the operator's
stated *policy*, not a description of the live system.

**O4 — Golf Digest's differing 7,021-yard / 128-slope tee figures.** §10 flags
the discrepancy but does not resolve which tee Golf Digest measured against
the club's own Gold-tee numbers. Omitted rather than juxtaposed unreconciled.

**O5 — any protected or conservation-status claim.** §10 — confirmed absent
from every reachable page; the absence is recorded, not asserted as a
negative fact.

**O6 — any duration for any distance, anywhere.** The operator's own site
states the airport as "5 minutes from" the course and every other city as a
drive time in hours and minutes. None of these figures is quoted or
referenced by duration in the seed file; only the OSRM mileages are
published, per the task's blanket ban on trip durations.

**O7 — a description of the live booking system's own words beyond the
policy page.** Covered by O3.

**O8 — every photo.** `guide.photos: []` and `photos: []` on all four places.
No photo scout has run for Iowa; a state with no freely licensed photo ships
none rather than padding.

**O9 — any claim that the city of Des Moines is near the course.** Not an
omission of a sourced fact but a deliberate absence: no sentence in this file
places Burlington relative to the city of Des Moines, and the intro states
the county distinction affirmatively instead.

---

## 11. What the gate caught, and what it did not

Run: `MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs`
— **9 tests, 0 failures**, on the first run against the drafted file. No
allowlist entry was added or needed; `Ethos.GolfProse.allowlist/0` remains
`[]`.

Phrasings checked by hand before the run, because §8's lesson (repeated in
this gate's own moduledoc) is that a rule you avoided without testing is a
rule you cannot prove you avoided:

| Candidate phrasing | Why it was rejected pre-emptively |
|---|---|
| "5 minutes from the Southeast Iowa Regional Airport" (the operator's own words) | A bare numeral-plus-minutes duration; fires pattern 1 regardless of whether it appears inside a quotation or a critique of the quotation. Rewritten as "advertises the airport as a duration rather than a distance," with the OSRM mileage given instead. |
| "just north of the course" | Would fire the proximity pattern's named-noun list (`course`, `clubhouse`, `resort`, `links`, `property`, `site`, `first tee`). Flint Hills' own "just north of Burlington" was used instead — a direction relative to a *named town*, which the gate's own moduledoc confirms still publishes. |
| "24 hours' notice" (cancellation policy) | Checked against the hour-duration patterns (21/22): both require a travel word (`drive`, `ride`, `trip`, `away`, `north/south/east/west`, `by car/bus/train/ferry/subway`) immediately after "hours." "24 hours in advance to avoid being charged" has no such word following and does not fire — confirmed by comparison with the test file's own `@publishable` specimen "at least 48 hours in advance." |

Confirmed to pass cleanly, matching the test file's `@publishable` precedents
directly: "2 miles SW of Burlington, IA," "9pm" (matches "the kitchen serves
until 9 p.m."), "14 days in advance" (matches "180 days in advance"), "24
hours in advance" (matches "at least 48 hours in advance"), and "just north of
Burlington" (a named-town direction, matching "the resort is 25 miles north
of Coos Bay on US-101").

**The gate hole worth repeating for the waves (already recorded in
`oregon.md` §4, restated here because Iowa's own draft walked right up to
it):** the source's own "5 minutes from the Southeast Iowa Regional Airport"
*would* have fired pattern 1 (it is a bare numeral-minutes duration, unlike
the hour-form gaps `oregon.md` records), so the gate would have caught it had
it been drafted in. It was caught in drafting instead, which is the correct
order of operations — catching a banned phrase by testing it before it goes
in the file, not by relying on the gate to reject a submission after the
fact.

---

## 12. Corpus check

`MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/seed_data_helpers_test.exs`
— **6 tests, 0 failures.** No place-slug collision: `spirit-hollow-burlington`,
`flint-hills-municipal-burlington`, `the-lodge-spirit-hollow-burlington` and
`lambos-spirit-hollow-burlington` are each unique across the full seed corpus
(Manhattan, London, Rome, the ballparks, the ten other golf states).

`priv/seed_data/golf_courses_roster.json` is untouched by this dispatch —
owned by a finalize agent, per the task's explicit instruction.

---

## 13. Destination slug rebase, decided at finalize

`MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_courses_roster_test.exs`
— the assertion "no golf guide's destination slug silently takes an existing
page's URL" — went **red on this file alone** when the wave was assembled:

    golf basecamps whose destination slug is already answered by another
    guide: [{"iowa.json", "burlington"}]

§12 above ran `seed_data_helpers_test.exs`, which checks **place** slugs, and
those are all unique. The **destination** slug is a different derivation and a
different assertion, and it was not run by this dispatch.

`Ethos.Guides.Guide.derive_destination_slug/1` (`lib/ethos/guides/guide.ex:74`)
splits the destination string on the first comma and keeps only the part before
it, throwing the state away. `"Burlington, Iowa"` therefore derives
`burlington`, which `priv/seed_data/connecticut/burlington.json`
(`"Burlington, Connecticut"`, shipped in commit `d71b35f`) already answers on.
That is the cross-state co-listing shape `docs/content-defects.md` records for
`madison`, and the /destinations/washington shape
`Guides.list_guides_shadowed_by_state/1` exists because of.

**Decision: rebase this guide, not the Connecticut one, and not a shared hub.**

* The Connecticut guide is published and indexed. Moving its URL would trade a
  content regression for a link regression — the reason `guides.ex` argues
  against renames. This guide has never been published, so it has no URL to
  move.
* Sharing the hub was the other option the assertion offers. It was rejected
  because the two guides are unrelated towns in unrelated states; a shared
  `/destinations/burlington` would list a Connecticut shore town beside an Iowa
  golf resort, which is the defect, not the remedy.
* `destination` changed from `"Burlington, Iowa"` to `"Spirit Hollow, Iowa"`,
  deriving `spirit-hollow`. **Nothing else in the file changed.** The title
  still reads "Spirit Hollow: Golf in Burlington, Iowa," every place still
  carries `town: "Burlington"`, and the county is still Des Moines County.

**Why this costs no accuracy.** §2 above already established, from the US
Census geocoder run on Golf Digest's own published coordinates, that the course
sits in **unincorporated Des Moines County and geocodes to no incorporated
place at all** — Burlington is the postal town on the operator's footer, not
the administering municipality. So `"Burlington, Iowa"` was never a municipal
claim in the first place. And every place in this guide but Flint Hills shares
one address, 5592 Clubhouse Dr: the course, The Lodge at Spirit Hollow and
Lambo's are one complex, and that complex is where a traveller following this
guide actually stays. Naming it as the basecamp is the more precise claim, not
the looser one.

**What it costs.** The other twenty golf guides all use a town as their
destination, and this is the one that does not. The corpus does carry non-town
destinations already — `antique-trail-of-connecticut` publishes
`destination: "Connecticut"` — so the shape is not new, but within this set it
is the exception and should be read as one.

After the change: `test/ethos/seeds/golf_courses_roster_test.exs` runs 6 tests
with **1 failure**, and that failure is the exhaustion check naming the
twenty-nine states wave 3 onward still owes. The shadowing assertion is green.
