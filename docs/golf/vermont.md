# Vermont — the championship fallback applies, and the derivation is unfinished

`priv/seed_data/golf/vermont.json` does not exist and `vermont` is the last roster
row carrying `verified: false`. This file records how far the work got and what
is left, so the next wave starts from the right rule.

**Correction.** An earlier version of this file concluded that Vermont was
*blocked* and that resolving it needed a spec-level change to
`docs/golf/00-ranking.md`. **That was wrong**, and the mistake was reading only
the ranking decision and not the roster's own rules. Task 5's contingency — which
`test/ethos/seeds/golf_courses_roster_test.exs` encodes directly in its
`@ranking` comment — already licenses a **championship-venue fallback** for a
state the ranking cannot resolve, and three states have shipped on it. Vermont is
an ordinary instance of an established rule, not a new question.

## 1. The ranking genuinely cannot pick, and that part is settled

`https://www.golfdigest.com/courses/guides/vermont-best-golf-courses-rankings`,
2025-'26 edition. **Five courses, every one labelled `Private`:**

| Rank | Course | Town | Label |
|---|---|---|---|
| 1 | Ekwanok Country Club | Manchester | Private |
| 2 | Country Club of Vermont | Waterbury Center | Private |
| 3 | Rutland Country Club | Rutland | Private |
| 4 | Dorset Field Club | Dorset | Private |
| 5 | The Quechee Club: Highland | Quechee | Private |

The list ends at rank 5 — no rank 6, no pagination, no "load more" — and the
word "Public" does not occur anywhere on the page. Read three times with three
different probes (ranked-list extraction; "list only entries ranked 6 and below";
"reproduce every course name on the page"), all three agreeing on the five names,
the five `Private` labels and the absence of a sixth entry, the third confirming
the absent "Public" string directly.

This is the same negative New Hampshire's row rests on, in nearly the same words:
*"the state's 2025-'26 ranking has exactly five entries … all Private, with
'Public' occurring zero times."* Two neighbouring small states, the same shape.

## 2. Which rule applies

The championship fallback, with three precedents already in the roster:

- **New Hampshire** — Bretwood Golf Course: North Course, Keene. Taken on
  **19 New Hampshire Opens, more than any course in that championship's
  history**, "re-derived from the association's venue-by-year table."
- **New Jersey** — Seaview, Bay Course, Galloway. Taken on the ShopRite LPGA and
  the 1942 PGA Championship.
- **Tennessee** — General's Retreat, Old Hickory. Taken on the LPGA Sara Lee
  Classic, 1988–1999, "a twelve-edition run belonging to this course rather than
  to the Hermitage complex."

The pattern each follows: establish that no ranked entry is public; select a
genuinely public course on its **competitive record**; prove public access in the
operator's own words; and publish a green fee only if it carries a dated
qualifier.

## 3. What is done, and the one thing that is not

The Vermont Golf Association publishes a Vermont Amateur past-champions table
covering **1902–2025** at `https://www.vtga.org/vermont-amateur/`. It is the
right source — it is the state analogue of the venue-by-year table New Hampshire's
row derived from — and the venues it names include both private clubs and
genuinely public courses (Green Mountain National, Stowe Country Club, Williston
Golf Club, Kwiniaska, Ralph Myhre among them).

**The derivation is not finished, and the reading method is now PROVED unsound
for this table** — not merely doubted. Three attempts were made and each failed
in a way the next could check:

1. A row-by-row extraction returned **2024 | Ralph Myhre**; a second read of the
   same page returned **2024 | Burlington Country Club**. One of them is wrong.
2. A per-venue tally over the full history returned **Manchester Country Club:
   4**. But the 1970–2025 extraction alone shows Manchester hosting **six**
   times (1970, 1976, 1988, 1996, 2010, 2025). A full history cannot contain
   fewer appearances than a subset of itself, so the tally is arithmetically
   impossible — and this is the decisive failure, because it is not a matter of
   judgement.
3. That same tally listed one club twice under two spellings — "St. Johnsbury
   Country Club" (3) and "Saint Johnsbury Country Club" (1) — and summed to
   **123** where 1902–2025 minus the gaps the page itself states (1918,
   1942–45) allows about **119**.

A championship claim is a counting claim. New Hampshire's says *more than any
course in that championship's history*, and it is only worth as much as the
count behind it. A count from a source read that contradicts its own subset is
worth nothing, and publishing one would be the precise defect this corpus spent
eight review waves learning to catch: a plausible number with no sound
derivation.

A 1970–2025 extraction was obtained and is recorded above as a starting point,
but it is a partial history and it is one of the reads that disagreed.

**So the remaining work is a method problem, not a research problem.** The table
must be read as data — raw HTML, or the embedded structure behind it — and
counted mechanically, so the count can be re-run and shown to agree with itself.
A summarising fetch has now failed at this three times.

**And the access half is untouched.** Even with a sound count, the winner has to
be a *public* course, and most of the high-count venues are named "Country Club"
— each needs its own operator-terms check, the standard §2 of
`docs/golf/rhode-island.md` uses. Nothing here has established the access status
of any Vermont venue.

## 4. What the next wave should do

1. Obtain the **complete 1902–2025 venue list** by a method that can be checked
   twice and agree with itself — raw HTML or the embedded table, counted
   mechanically, never a summarising read. Three summarising reads have already
   failed, one of them provably. Resolve the 2024 discrepancy and the
   Manchester count explicitly; both are defects in the reading, not in the
   source. Normalise the St. Johnsbury spelling before counting.
1b. Confirm the right championship. New Hampshire's row counts the **New
   Hampshire Open**; the table used here is the **Vermont Amateur**. Whether
   the Vermont Open or the Amateur is the state analogue is a decision this
   record does not make, and the two will not have the same venue history.
2. Count hostings per venue over the full history.
3. Among the public venues, take the highest count, and say plainly how far ahead
   of the runner-up it is — New Hampshire's row does this ("four hostings to
   nineteen"), which is what makes the pick answerable rather than asserted.
4. Confirm that course's public access **in the operator's own words**, the
   standard `docs/golf/rhode-island.md` §2 and the Connecticut row both use.
5. Publish a green fee only if the operator's rate card carries a dated
   qualifier, as New Hampshire's did ("Rates listed here are current as of
   January 1, 2026") and New Jersey's did not.

The roster row stays all-null and `verified: false` until every one of those is
done together — the "resolved together or not at all" rule the roster gate
enforces.

## 5. Provenance of this file

Not backed by a finder/verifier research pair under
`.superpowers/sdd/2026-09-05-golf-courses/`. It rests on three direct reads of
the Golf Digest Vermont ranking page and two of the VGA Vermont Amateur page, all
named above. Its one firm claim is §1's: that the ranking page carries five
courses, all `Private`. It names no Vermont course as the selection and publishes
nothing to the site.
