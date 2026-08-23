# Connecticut Completion: All 169 Towns

**Status:** approved design, ready for planning
**Date:** 2026-08-23
**Predecessor:** `docs/superpowers/specs/2026-08-23-connecticut-expansion-design.md`

## Goal

Give every one of Connecticut's 169 towns a page on ethosguides.com, so the
site can credibly tell the Connecticut Office of Tourism it covers the entire
state — without publishing 115 interchangeable thin pages to get there.

## Where we are

The site publishes 55 Connecticut guides. Those cover **54 of the 169 towns**:
the count differs because Mystic is a village straddling Groton and Stonington
rather than a town, and Storrs — a village inside the Town of Mansfield —
stands in for Mansfield.

**115 towns remain**, by county:

| County | Towns | Covered | Remaining |
|---|---|---|---|
| Hartford | 29 | 7 | 22 |
| New Haven | 27 | 10 | 17 |
| Litchfield | 26 | 9 | 17 |
| Fairfield | 23 | 8 | 15 |
| New London | 21 | 7 | 14 |
| Windham | 15 | 4 | 11 |
| Middlesex | 15 | 6 | 9 |
| Tolland | 13 | 3 | 10 |
| **Total** | **169** | **54** | **115** |

Every county already has a hub page, and the places/guides/links/collections
/search machinery is in place. Nothing structural is missing; this is coverage.

## The core problem

Research quality falls off sharply in smaller towns. In the expansion just
shipped, adversarial verifiers returned 16 non-confirmed items for Pomfret and
13 for Canterbury, and Roxbury shipped with five places rather than six because
padding it would have meant inventing material. The 115 remaining towns are on
average *smaller* than the 50 just published — many are bedroom communities
with a green, a library and a pizzeria.

Two failure modes to avoid:

1. **Fabrication.** Forcing every town into the full-guide shape pressures
   authors to invent the missing sixth restaurant. The last build caught this
   class of error in six of seven waves.
2. **Thin duplication.** 115 near-identical sparse pages is the pattern Google's
   helpful-content signals demote, and the damage would not stay confined to the
   new pages — it would drag on the 55 good ones already indexed.

## Design

### Two tiers, decided by evidence

Every town gets the same two-agent research pass already in use: a finder, then
an adversarial verifier issuing per-item `confirmed` / `refuted` / `uncertain`
verdicts. After verdict filtering:

- **6 or more verified places → full guide.** The existing format, unchanged.
- **Fewer than 6 → orientation page.**

The tier is decided *after* research, from what survived verification — never
from a town's reputation beforehand. A town nobody expects much from can earn a
full guide; a well-known town whose listings won't verify does not get padded
into one. The author records the surviving count and the resulting tier in its
report, so the reviewer can check the call rather than take it on trust.

### What an orientation page contains

- **History intro**, 90-130 words, from verified `history_facts` only.
- **Getting there**, from the research's `getting_there` data — highways and
  only research-verified rail. Never an invented station.
- **What's here** — every verified place, however few (2-5 typical). Same place
  records, same kinds, same global slug uniqueness as full guides. If a town
  yields *zero* verified places, the section is omitted entirely rather than
  rendered empty, and the page carries only history, getting there, and nearby.
- **Nearby** — a prominent block built from the link graph, with proximity
  stated in checkable terms: "borders Canterbury", "12 miles north of Norwich
  on Route 97". **No drive times** — nothing in the research supports them and
  they are exactly the invented-specific the reviews keep catching.
- **FAQ**, 2-3 entries, including "How do I get to {Town}?".
- **One photo** if a free-licensed one exists on Wikimedia Commons, otherwise
  none. Small-town photo coverage is poor; shipping imageless is correct, and
  reaching for a loosely-related image is not.

It is framed as orientation — what is in this town and what is near it — not as
a trip itinerary, and carries a visible label so a reader knows which they are
getting.

### Floor: what does not ship

An orientation page must clear both:

- a real, unique history intro of at least 90 words, and
- at least 3 outbound links to neighbouring covered towns.

A town that cannot clear that floor is **omitted**, and the omission is
recorded in the wave report. The failure mode must be omission, never a stub.
This is expected to be rare.

### Data model

Both tiers are the **same `Guide` record**, distinguished by a new stored
`tier` column: `"guide"` (default) or `"town-page"`. The seed file declares it.

- Stored rather than derived from place count, so adding a place later cannot
  silently reclassify a page that was reviewed as an orientation page.
- Everything downstream keeps working untouched: county and state hubs,
  full-text search, the `page_links` graph, `sitemap.xml`, collections.

One migration adds the column with a `"guide"` default and a check constraint on
the two valid values; existing rows need no backfill.

### Rendering

- A leaner template for `tier == "town-page"`: no stay/eat scaffolding to leave
  conspicuously empty, with the Nearby block promoted.
- County hubs list full guides first, then orientation pages under their own
  heading, so a visitor scanning a county sees the substantial pages first.
- Both tiers appear in search and the sitemap on equal terms; an orientation
  page is real content, not a second-class URL.

### Sequencing

Seven county waves, ordered so the new format is proven on the hardest material
first and the largest county lands last:

| Wave | Counties | Towns |
|---|---|---|
| 1 | Tolland + Windham | 21 |
| 2 | Middlesex | 9 |
| 3 | New London | 14 |
| 4 | Fairfield | 15 |
| 5 | New Haven | 17 |
| 6 | Litchfield | 17 |
| 7 | Hartford | 22 |

Wave 1 is deliberately the thinnest material in the state: if the orientation
format cannot carry Scotland and Union, that is worth learning in the first
wave rather than the sixth.

### Quality gates — unchanged

- The same authoring contract
  (`docs/superpowers/plans/2026-08-23-connecticut-content-rules.md`), extended
  with the orientation-page rules and the tier decision procedure. Its existing
  rules all still bind, including: `nearby` means the towns share a border;
  edge notes must trace to research; and no claim about where a named rail
  service runs unless that town's research states it.
- The same per-wave fact-fidelity review, tracing every claim in every file
  back to the research artifacts. Reviews are dispatched per wave, and a wave is
  not complete until its findings are fixed.
- The same validation test, extended to assert: `tier` is one of the two valid
  values; a `"guide"` has 6+ places and a `"town-page"` has fewer; every
  orientation page clears the 90-word and 3-link floor.
- Photo provenance continues through the manifest — each label pinned to its
  Commons file and hash, so a published credit cannot drift from its image.

## Risks

**Photo coverage will be poor.** Expect a majority of orientation pages to ship
with no image. Accepted; the alternative is misattributed or irrelevant photos.

**More orientation pages than expected.** If verification is as strict as it has
been, the split could land well past half. That is the design working, not a
failure — but the county hubs need to read well when a county is mostly
orientation pages, which the hub grouping addresses.

**Research volume.** 115 towns times two agents, plus photo scouts, authors and
reviewers, is roughly twice the program just completed.

**Small-town homonyms.** Connecticut has Canaan and North Canaan, Windham and
South Windham, Killingly and Killingworth. Slugs and research dispatches must
disambiguate explicitly, and the existing global slug-uniqueness test is the
backstop.

## Success criteria

- All 169 Connecticut towns reachable from the site; every county hub lists its
  full roster.
- Every published claim traces to a verified research item.
- No page ships below the floor; omissions are recorded rather than stubbed.
- The full test suite green, including the extended tier and floor assertions.
- Sitemap and canonical URLs correct on ethosguides.com.
