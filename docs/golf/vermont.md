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

**The derivation is not finished, and it must not be guessed.** Two reads of that
same table disagreed with each other on at least one row: one returned
**2024 | Ralph Myhre**, the other **2024 | Burlington Country Club**. A
championship claim is a counting claim — New Hampshire's says *more than any
course in that championship's history* — and a count taken from a source whose
own reads conflict is exactly the kind of number this corpus refuses to publish.

A 1970–2025 extraction was obtained and is reproducible, but the full history
reaches to 1902, and the fallback's whole force is the completeness of the count.

## 4. What the next wave should do

1. Obtain the **complete 1902–2025 venue list** by a method that can be checked
   twice and agree with itself — raw HTML or the embedded table rather than a
   summarising read. Resolve the 2024 discrepancy above explicitly; it is a live
   known defect in the source-reading, not in the source.
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
