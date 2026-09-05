# The ranking decision, and the audit trail behind it

Source: the 2026-09-05 golf-course research artifacts
(`.superpowers/sdd/2026-09-05-golf-courses/research/ranking-finder.md`,
`ranking-verdicts.md`), the finder gathering candidates and the verifier
re-fetching every cited URL and adjudicating each claim. The verifier's own
count is **33 confirmed / 8 refuted / 6 uncertain**.

**The governing rule, same as the ballpark set:** where the finder and the
verifier disagree, the verifier wins. Eight of the finder's claims are refuted
below, and this file publishes only the verifier's corrected text for each.

This file is committed on purpose, for the same reason
`docs/ballparks/fenway-park.md` is: the research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A future citation to a
git-ignored path has no audit trail a year from now.

---

## 1. The selected ranking

**Golf Digest "Best in State," 2025-'26 edition — the 25th edition of a series
published every other year since 1977.**

Landing page: `https://www.golfdigest.com/story/best-in-state-rankings`

Confirmed verdicts that establish fitness for this project:

| Requirement | Confirmed verdict |
|---|---|
| Fetchable, no subscription | The landing page and sibling Golf Digest pages read cleanly and unpaywalled (C2.3, C3.1, C4.2). `www.golfdigest.com` blocks `curl` (HTTP 403) but serves WebFetch normally — use WebFetch, not curl, on this domain. |
| Fifty-state coverage | *"the fetched page lists all 50 states (Alabama through Wyoming) with individual state links"* — confirmed, C3.2. This is the only candidate confirmed to cover all fifty states. |
| Stable, citable edition | *"Golf Digest has been publishing a Best in State ranking every other year since 1977, making this the 25th edition."* — confirmed verbatim, C3.1. |
| Public/private labelling exists | Golf Digest's companion "best golf course in every state" page labels **every** entry with its access type — `Public` or `Private` — printed beneath the course name and location. Confirmed on two independent fetches, C5.3. Shoal Creek (Alabama) renders `Private`; Moose Run (Alaska) renders `Public`. |

Two conditions travel with this selection, both stated by the verifier and
both still open as of this writing:

1. The verifier confirmed the `Public`/`Private` label on the **every-state
   summary** page (`https://www.golfdigest.com/courses/guides/best-golf-course-in-every-state`,
   C5.3). It did **not** confirm the label appears on each of the fifty
   individual Best in State per-state pages, and did not confirm those fifty
   pages are unpaywalled (C3.5). Each research wave must check its own
   state's per-state page for the label before treating it as settled.
2. Golf Digest never defines "public." It labels but does not explain
   (C5.4). The resort / stay-and-play edge case is unresolved by the source
   itself — see §6.

---

## 2. How a wave uses it

For a given state:

1. Open that state's Golf Digest Best in State page (linked from the 2025-'26
   landing page above).
2. Walk the state's ranked list from the top.
3. Take the **first (highest-ranked) entry carrying Golf Digest's own
   `Public` label.** Do not take the state's #1 overall course if it is
   labelled `Private` — walk down the list until a `Public` label is found.
4. Record that course's `ranking_source` as `"Golf Digest Best in State"`,
   `ranking_edition` as `"2025-'26 (25th edition)"`, and `ranking_position`
   as the course's numeric rank in the state's list (not its rank among
   public courses only — the source ranks the full mixed list). Set
   `criterion: "ranking"`.
5. If the label on the per-state page is missing, ambiguous, or contradicts
   the every-state summary page, do not guess — see §6. Say so in that
   state's research artifact and treat the state as blocked pending a
   second source, rather than publishing an unlabelled or guessed course.

Because Golf Digest's fifty-state coverage is complete, no state should need
the championship-venue fallback the roster schema otherwise allows for. If a
wave finds itself reaching for that fallback, that is itself a signal to
re-check step 3 before concluding Golf Digest has no usable entry for the
state.

Applied to the confirmed examples above: Alabama's top-ranked course, Shoal
Creek, is `Private` (C5.2) — the wave must walk down to Alabama's first
`Public` entry, not cite Shoal Creek. The same applies to Arizona (The
Estancia Club, private) and Georgia (Augusta National, private) — all three
confirmed private top-ranked courses, C5.2.

---

## 3. Rejected candidates, and why

### Golfweek's Best — "Best Courses You Can Play, State-by-State" (rejected)

This is the closest match in principle to what the set needs: natively
state-by-state, natively restricted to public-access courses, an annual named
list (Golfweek's Best 2025 issue, released June 3, 2025 per Troon's press
release, confirmed C1.2). It is rejected anyway, for a reason that outlasts
this wave and should stop a later one from re-discovering it and re-spending
a search budget:

**It cannot be read, by any tooling used.** WebFetch refuses the domain
`golfweek.usatoday.com` outright at the tool level. Direct HTTP requests
(`curl`) succeed — HTTP 200, 154,332 bytes for the homepage, 60,391 bytes for
the sitemap — but the response is a Gannett JavaScript application shell.
Parsed directly, the homepage contains **zero** `href` links and **zero**
occurrences of "courses you can play," "state-by-state," "golfweek's best,"
or "best courses." The linked digital-edition replica at
`golfweek-fl.newsmemory.com` returns 13KB whose entire visible text is the
single word "Golfweek" (login-gated viewer). No article URL for the list is
indexed by search. This is confirmed, C1.1 — the content is not retrievable
without a JavaScript-rendering browser, which is a different and harder
problem than "blocked, retry with different tooling."

Secondhand sourcing (press releases from courses that happen to be on the
list) establishes the list's existence, name, and edition, but its **content
for a given state** only where an operator happens to have a course on it.
The single richest secondary source found, Troon's press release, yields the
top public course for exactly **three** states — Arkansas, Minnesota, and
Utah — and only because Troon manages those three. Assembling fifty states
this way means finding a vendor press release per state and trusting an
interested party's characterization of a ranking no one, verifier or reader,
can open. A ranking that cannot be fetched also cannot be re-verified per
state by anyone later — every Golfweek-sourced course in the finished site
would be permanently unauditable.

Revisit only if a JavaScript-rendering fetch tool becomes available.

### Golf Digest "America's 100 Greatest Public Courses" (rejected)

A single national Top 100 list, not organized per state (confirmed, C2.2).
Wisconsin places 11 courses and ties for most; most states place far fewer or
none — a 100-course national list cannot guarantee one entry per state,
confirmed C2.6-C2.7. Unusable for a fifty-state, one-course-per-state set.

### Golf Digest "Best Public Courses" per-state guides (rejected)

An unknown-sized series of individual articles (one confirmed example: New
York, listing Bethpage Black, Montauk Downs, Turning Stone). Coverage across
all fifty states was never confirmed and could not be enumerated from any
fetched page (confirmed, C4.4). Not usable without independently verifying
fifty separate URLs exist.

### Golf Digest "Here is the best golf course in every state" (superseded, not rejected on the merits)

Names one best course per state and does carry the `Public`/`Private` label
per entry — this is in fact the page that confirms the label exists at all
(§1, C5.3). It is not the selected source only because it is one edition
behind: it is pinned to the 2023-'24 edition while Best in State has moved to
2025-'26 (confirmed, C5.1). Useful as the fallback illustration of the
label's presence, not as the citation for any state's ranking.

### GOLF.com "Top 100 Courses You Can Play in the U.S." (rejected)

Covers 29 states, confirmed verbatim: *"Our panel's top-ranked public courses
span across the country, touching 29 states in all"* (C6.2). Decisive against
a fifty-state requirement on its own; twenty-one states have no entry.

### GolfPass "Golfers' Choice" (rejected as primary; noted as secondary option)

Purpose-built as public-only, per-state, and fetchable — but covers only 49
states. Alaska is explicitly excluded, confirmed by direct count of the
article's own state headings (C7.2). It is consumer-review-based ("generated
by golfer reviews on GolfNow and GolfPass throughout 2025," C7.3) rather than
an expert panel, a different claim to make to a reader than Golf Digest's
panel-scored ranking. Its listings also mix `Public`, `Semi-Private`,
`Resort`, `Private/Resort`, and `Public/Resort` labels without defining any
of them (C7.5). Recorded here as the fallback if a genuinely public-only
source is ever preferred over Golf Digest's filtered general list — but it
would still need a separate source for Alaska, and Golf Digest already
supplies one (Moose Run Golf Course: Creek, labelled `Public`, C5.2).

### GolfCourseGurus.com (rejected)

Self-published, not a magazine ranking; its own page separates "The Guru's
Rankings" and "The Guru's Lists" from a distinct "National Magazine Rankings"
section (C8.1-C8.2). Its Best in State list tracks "favorite courses visited
state-by-state" — a personal record of play, not a survey or panel score
(confirmed verbatim, C8.2). Too small and too informal a publication for a
fifty-state citation base.

### No official (.gov / tourism board) ranking found

A search restricted to `.gov` and `visit*` domains for a state-published
"best public golf course" ranking returned no matching results. Recorded as
"no result found by this search," not as "no such ranking exists" — the
distinction the finder drew and the verifier did not need to re-litigate.

---

## 4. What the verifier refuted, and the corrected text

Two refutations are recorded here in full because they are the evidence that
the finder/verifier split does real work, not ceremony — the same reason
Fenway's audit trail keeps its street-number disagreements rather than
picking one number and moving on.

**The "850 raters" miscitation.** The finder wrote that Golfweek's Best
methodology involves "more than 850 raters evaluating courses based on 10
criteria," cited to `kempersports.com`. The verifier re-fetched that exact
page and found it says something different: *"For nearly three decades,
Golfweek's Best has expanded to rank courses with the input of **more than
800 raters** around the world"* and that raters "rate each layout based on
10 provided criteria, with each offering its own 10-point scale." The figure
850 is real — it appears verbatim on Troon's press release, a different
publisher entirely: *"Golfweek's team of more than 850 raters rate courses
based on 10 criteria."* The finder took a true number from one source and
attached it to a different source's URL. Corrected text: rater counts differ
by publisher — KemperSports reports "more than 800," Troon reports "more
than 850" — and Golfweek's own statement of the figure could not be read at
all, since the primary domain is unreadable (§3).

**The truncated methodology quote.** The finder quoted Golf Digest's Best in
State methodology as ending: *"...Aesthetics, Character and Fun."* The
verifier re-fetched the page and found the sentence does not end there. The
full sentence: *"These rankings were based on more than 80,000 evaluations
over a 10-year cycle from our panelists, who assess candidate courses based
on the following criteria: Shot Options, Challenge, Design Variety,
Conditioning, Aesthetics, Character and Fun (though Fun isn't currently used
in our formula)."* Cutting the quote at the first period imports a
substantive error: it tells a reader Fun is a scoring criterion when the
source says the opposite. The corrected, publishable text is the full
sentence including the parenthetical.

The other six refutations, briefer:

- **Troon's press release is fetchable (HTTP 200, 225,592 bytes), not 403
  Forbidden as the finder reported** — it turned out to be the richest
  secondary source on Golfweek in the whole artifact (source of both the
  June 3 2025 date and the 850-rater figure above).
- **The public/private list separation should cite Troon, not
  tributaryidaho.com** — the finder cited a page it never fetched; Troon
  states the split directly ("51 ... daily-fee/resort properties" vs. "14
  private clubs").
- **Golf Digest's "100 Greatest Public" page does not define eligibility as
  "public and resort" golf** — that phrase is descriptive prose, not a
  stated rule. The page's actual scoping language: it reflects "the
  architectural merits of each course, not their affordability," and gives
  no access definition.
- **The "every state" page does flag public vs. private per entry** — the
  finder's claim that it does not, and that "a downstream user would need to
  cross-reference each state's entry against a separate public/private
  determination," is refuted outright. This is the label the whole selection
  in §1 depends on.
- **GolfPass's regional page does not claim rankings for "all 50 states,"
  contradicting the 49-state figure** — the finder converted a count of
  *lists* ("all 75+ lists we create in 2026") into a count of *states* and
  then reported a contradiction with its own correct 49-state finding. There
  is no contradiction.
- **GolfCourseGurus.com's page does not contain the quoted sentence** "Golf
  Course Gurus publishes these rankings themselves (not a national
  magazine)" as page content — it is a reasonable paraphrase of the page's
  section headings, rendered in quotation marks as if it were a direct
  quote. A true summary dressed as a citation.

---

## 5. `searched: blocked`

Sources that blocked direct verification, named:

- **`golfweek.usatoday.com`** — refused by WebFetch at the tool level;
  reachable by curl (HTTP 200) but serves a JavaScript shell with no ranking
  content and no links, at the homepage and the sitemap alike.
- **`golfweek-fl.newsmemory.com`** — Golfweek's digital-edition replica,
  HTTP 200, 13KB, no readable content (login-gated replica viewer).
- **`www.pressreader.com`** — HTTP 403 Forbidden. This blocked the one
  sentence that would have settled Golfweek's own definition of "public
  access" (C1.5), which is why that verdict is uncertain rather than
  confirmed or refuted.
- **`www.aol.com`** (a 2022 Golfweek article) — HTTP 404, confirmed dead.

The set proceeds anyway. **33 confirmed verdicts is not an empty result.**
Verdicts gate publication — and the verdicts backing the §1 selection
(fifty-state coverage, stable edition, per-entry public/private labelling)
are all confirmed, not blocked. `searched: blocked` gates completeness
accounting — it records that some *candidates* (chiefly Golfweek) could not
be fully audited, not that the *selected* ranking is unverified. These are
separate questions, and this file keeps them separate rather than letting an
unrelated block on a rejected candidate cast doubt on the selection.

---

## 6. Known limitation

Golf Digest's Best in State ranking mixes public and private courses within
a single ranked list per state — it is not a public-only product the way
Golfweek's rejected list would have been. The selection rule in §2 works
around this by depending on Golf Digest's own `Public` label being present
and correct for each state, confirmed to exist on the every-state summary
page (§1) but **not yet confirmed on each of the fifty individual per-state
pages.**

Golf Digest does not define what "Public" means on that label — no stated
criteria, no treatment of the resort / stay-and-play edge case that a UK-
style access model raises for other candidates in §3. The label is applied,
not explained.

A wave that finds a state's label ambiguous, missing, or internally
inconsistent (e.g., the per-state page disagreeing with the every-state
summary page) must say so in that state's own research artifact rather than
guess which entry is really public. That state is blocked pending a second
source, exactly as if the ranking had no entry for it at all.

---

## A note on the roster

`priv/seed_data/golf_courses_roster.json` is untouched by this decision. All
fifty rows remain fully null with `verified: false`. The roster gate asserts
that an unverified row has every researched field null; writing this
ranking's name into fifty unverified rows now would fail
`test/ethos/seeds/golf_courses_roster_test.exs` immediately, and would also
misrepresent the state of the work — no state's own research has run yet.
Rows gain their ranking fields only when that state's own wave resolves
them, all fields at once.
