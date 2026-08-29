# Place Research Wave: 424 Bare Places

**Status:** draft design, pending approval
**Date:** 2026-08-29
**Predecessor:** `docs/superpowers/specs/2026-08-29-structured-data-design.md`

## Goal

Research and rewrite the 424 place records that are thin, photoless and
history-less, using the same finder + adversarial verifier apparatus every
prior content wave used.

## Why this is a research project and not a synthesis project

Sub-project B wrote thirteen destination pages by synthesising from committed
guide files. That worked because the guides discuss *towns* at length. It does
not transfer here, and the measurement is unambiguous.

A per-place "material budget" — every content word about a place anywhere in the
repository, minus what its summary already says — gives a **median of 3 words**.
315 of 512 thin places (62%) have fewer than five novel content words in the
entire corpus.

| novel content words available | thin places |
|---|---|
| 0 | 108 |
| 1–4 | 207 |
| 5–14 | 117 |
| 15–29 | 78 |
| 30+ | 2 |

The reason is structural: **guides were written to point at places, not to
describe them.** Entry notes are *shorter* than the summaries they accompany
(median 11 words) and 80% of their content already appears in the summary — they
are compressions for the guide's list view:

> `spread-love-and-eat-canarsie` — summary "A local eat-and-drink spot on
> Flatlands Avenue." / note "A local eat-and-drink spot further along Flatlands
> Avenue."

Guide section prose names only 150 of 512 thin places, with a median of 8 words
of predicate after the name, and the modal hit restates the summary. FAQs are
town-level. The `page_links` graph is 783 guide→guide rows out of 791.

Hand-checking the twelve best cases — the ceiling of the synthesis approach —
three are genuinely additive, five add only an address or a container, and four
add nothing about the place at all. **Even at the top of the distribution the
yield is one usable sentence for a quarter of cases.**

## The corpus

**512 places under 25 words** (not 482 — that figure omitted the 50 code-defined
Connecticut places). **424 are also photoless and history-less** — the working
set.

| region | bare | | kind | bare |
|---|---|---|---|---|
| Connecticut | 177 | | restaurant | 195 |
| Manhattan | 111 | | cafe | 55 |
| Brooklyn | 107 | | park | 49 |
| code-defined | 29 | | hotel | 35 |
| | | | other 7 kinds | 90 |

Thinness tracks **commercial venues** — restaurants, cafés and hotels are 296 of
the 512 — and Brooklyn/Manhattan over Connecticut. Places with a public record
(parks, districts, museums) are already fine. **334 of the 424 already carry an
`official_url`**, so the finder's starting point is committed.

## Not every thin summary is a defect

The thin ones split three ways, and only one way is a problem:

1. **Correctly short.** "Brooklyn's oldest Carnegie library, opened in 1905."
   (7 words) says the one true thing. This is the largest group.
2. **Trimmed by a verifier.** The content rules forbid shipping any clause a
   verdict did not restate, so superlatives, styles and rankings were dropped
   even from confirmed items. These are thin **because the process worked**.
3. **Genuinely placeholder — about 26 places.** 20 carry NYC restaurant-
   inspection boilerplate ("carried in the city's restaurant inspection records
   at this address with an inspection dated June 4, 2026"); 6 are bare Brooklyn
   stubs of the form "A restaurant on X, at number N."

This shapes the success criterion. **A place whose research yields nothing new
keeps its short summary and that is a pass, not a failure.** The wave's job is
to find what is findable, not to lengthen every record.

## Design

### Authoring contract

`docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md` binds unchanged —
verdict-restatement scope, no superlatives or rankings a verifier did not write,
no architectural style, no trip durations, hedged boundary language. Two rules
are added, both from defects this corpus already contains.

**No minimum word count, in the gate or in the brief.** A floor is the obvious
way to enforce "no more thin summaries" and it would manufacture the exact
defect being fixed: the 20 inspection-record summaries read as boilerplate
because something had to fill the space. The gate instead **bans the boilerplate
patterns by name** — inspection-record phrasing, and the "A {kind} on {street},
at number {n}" stub shape.

**Restaurant inspection records license existence, never description.** NYC
DOHMH data is the best available evidence a place is still open in 2026, and it
is also where the boilerplate came from. An inspection record may support a
`status` verdict. It may not appear in prose, in any paraphrase.

### Waves

All four regions run **in parallel**, batched by guide: one finder researches
every bare place in one town, so its sources are shared across them, then an
**independent** verifier adjudicates that batch. The finder never writes
verdicts — the Brooklyn program had that separation collapse once and produced
a 44-of-44 confirmation rate that had to be thrown out.

### Closures, and what deleting actually requires

Every one of the 2,158 places is currently `status: "open"`. After several years
of restaurant turnover that is implausible on its face, so the wave will find
closures. **Decision: closed places are deleted outright.**

Three things follow mechanically, and none is optional:

**The guide entry goes with it.** Entries reference places by `place_slug`; a
deleted place leaves its guide pointing at a dead slug.

**A prune step must exist, because seeding is upsert-only.** `Ethos.Places` has
no delete or prune function. Removing a record from a seed file has *zero*
effect on production — the row stays, the page stays live, and the sitemap keeps
listing it, because `SitemapController` reads `Places.list_places()` from the
database, not from the corpus.

**The prune gets a floor guard.** A prune that deletes every DB place absent
from the seed files would erase hundreds the first time a directory fails to
load — and that failure mode is not hypothetical: the dev database is missing
all 434 Brooklyn places right now and nothing noticed. The prune refuses to run
when the seed corpus is smaller than expected, and refuses to delete more than a
stated ceiling in one run.

**Deletions are recorded in a committed manifest** — slug, name, town, the date,
and the evidence that closed it. Without it a deletion is unauditable: the
record is gone and so is the reason. The manifest doubles as the tombstone list
for serving **`410 Gone`** rather than `404` on deleted slugs, which tells search
engines to drop the URL instead of retrying it as a soft 404.

### The gate

`test/ethos/seeds/` gains assertions, following the Brooklyn gate's shape:

- The boilerplate-pattern ban, both forms, with no allowlist.
- Every `place_slug` in any guide entry resolves to a place that exists — the
  assertion that makes an orphaned entry impossible after a deletion.
- Every slug in the deletion manifest is absent from the seed corpus, and no
  manifest slug is also a live place. Failing in both directions.
- The existing global place-slug uniqueness assertion continues to hold.

## Risks

**The wave shortens some records.** Verifiers will refute claims currently
shipped. That is a success condition and is stated here so it is not reported as
a surprise later.

**Parallel regions bake in a contract defect.** Running all four concurrently
means a flaw found in a late wave has already reached hundreds of places. Every
prior program found its worst defects mid-flight — the trip-duration gate hole,
the exclusivity sentences, the finder/verifier collapse. Mitigated by landing
one wave per region first and reviewing those four before the rest proceed;
that keeps the parallelism while creating a checkpoint the contract can be
amended at.

**424 places is roughly 850 agent runs.** The largest content effort in the
project by a wide margin.

## Success criteria

- All 424 researched; every published claim traces to a verifier's verdict.
- No summary matches either banned boilerplate pattern.
- Places found closed are deleted, their guide entries removed, and each one
  recorded in the manifest with its evidence.
- The prune runs under its floor guard; no orphaned entry survives the gate.
- Deleted slugs serve `410`.
- Full suite green.
