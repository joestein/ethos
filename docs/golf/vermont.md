# Vermont — blocked by the criterion, not by missing research

`priv/seed_data/golf/vermont.json` does not exist and `vermont` is one of the two
roster rows still carrying `verified: false`. This file records why, so the next
wave does not re-run the same dead end.

**Status: BLOCKED under §6 of `docs/golf/00-ranking.md`.** Not "unresearched",
and not "hard". The selected criterion cannot produce a pick for Vermont.

## What the criterion says to do

`docs/golf/00-ranking.md` §2: open the state's Golf Digest Best in State page,
walk the ranked list from the top, and take the **first entry carrying Golf
Digest's own `Public` label**, walking past `Private` entries as far as needed.

## What Vermont's page actually holds

`https://www.golfdigest.com/courses/guides/vermont-best-golf-courses-rankings`,
2025-'26 edition. **Five courses, and every one is labelled `Private`:**

| Rank | Course | Town | Label |
|---|---|---|---|
| 1 | Ekwanok Country Club | Manchester, VT | Private |
| 2 | Country Club of Vermont | Waterbury Center, VT | Private |
| 3 | Rutland Country Club | Rutland, VT | Private |
| 4 | Dorset Field Club | Dorset, VT | Private |
| 5 | The Quechee Club: Highland | Quechee, VT | Private |

The list ends at rank 5. There is no rank 6, no pagination and no "load more"
control, and **the word "Public" does not appear anywhere on the page.**

Read three times with three different questions — a ranked-list extraction, a
"list only entries ranked 6 and below" probe, and a "reproduce every course name
on the page" probe — and all three agree on the five names, the five `Private`
labels and the absence of any sixth entry. The third also confirms the absent
"Public" string directly, which is the strongest form of the finding: there is
no public-labelled entry to walk down to.

## Why this is a criterion failure and not a research gap

§6 of the ranking decision already anticipated it:

> A wave that finds a state's label ambiguous, missing, or internally
> inconsistent … must say so in that state's own research artifact rather than
> guess which entry is really public. That state is blocked pending a second
> source, exactly as if the ranking had no entry for it at all.

Vermont is the cleanest possible instance: the label is neither ambiguous nor
inconsistent. It is uniformly `Private`, five times out of five. Every path
forward requires a decision the criterion does not license:

1. **Take rank 1 anyway.** Forbidden by §2, which exists precisely to stop a
   private club being published as somewhere a reader can book.
2. **Use a second ranking.** §3 rejected Golfweek's "Best Courses You Can Play",
   Golf Digest's own "Best Public Courses" per-state guides, GOLF.com's Top 100
   You Can Play, GolfPass Golfers' Choice and GolfCourseGurus — each for stated
   reasons. Reaching for one of them *only for Vermont* would mean this corpus's
   fifty rows no longer share a criterion, which is the one property that makes
   the set comparable at all.
3. **Pick a well-known Vermont public course from recollection.** §4 rule 8
   forbids identity from recollection or an unchecked list, and it is the rule
   most of this corpus's refuted claims violated.

None of those is available to a wave. Choosing between them is a **spec-level
decision about the criterion**, which belongs to whoever owns
`docs/golf/00-ranking.md`, not to the wave that happened to draw Vermont.

## What a future wave should do

Nothing, until that decision is made. When it is, the two honest shapes are:

- **Accept 49 states**, and say so on the collection page rather than implying
  a gap that is not there. "A Public Course in Every State" would then be
  publishing a claim its own corpus does not support, so the title or the intro
  has to move.
- **Name a documented second source for public access**, added to
  `docs/golf/00-ranking.md` as an explicit fallback with its own §3-style
  rejection notes for the alternatives, applied to *any* state the primary
  criterion cannot resolve — not to Vermont alone.

Rhode Island, the other `verified: false` row, resolved normally on the primary
criterion: see `docs/golf/rhode-island.md`. Vermont is alone in this.

## Provenance of this file

Unlike the other state files in this directory, this one is **not** backed by a
finder/verifier research pair under `.superpowers/sdd/2026-09-05-golf-courses/`.
It rests on three direct reads of the ranking page, recorded above, and it makes
exactly one claim: that the page carries five courses, all `Private`. It draws
no conclusion about any Vermont course's real access, and it publishes nothing
to the site.
