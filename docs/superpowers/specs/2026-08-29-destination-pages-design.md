# Destination Pages: Content and Photos

**Status:** approved design, ready for planning
**Date:** 2026-08-29
**Predecessor:** `docs/superpowers/specs/2026-08-28-brooklyn-neighborhoods-design.md`

## Goal

Give every destination page real content and a photograph, so `/destinations/connecticut`
and `/destinations/new-york/brooklyn` stop being bare lists of links.

## Where we are

The site publishes 277 guides and 2,108 places across Connecticut, Manhattan, Brooklyn and
Rome. Destination pages are the top of that hierarchy and the thinnest thing on the site:

- `/destinations/connecticut` renders a county list and an all-guides list. No prose.
- `/destinations/new-york/brooklyn` renders a guide list split by tier. No prose.
- Breadcrumbs now point *at* these pages from all 272 guide pages, which makes their
  emptiness more visible, not less.

There is nowhere to put content. `Guides.list_states/0` and
`Guides.list_counties_for_state/1` are `GROUP BY` queries over the guides table — a
destination page is assembled at request time from whatever guides exist. No record, no
slug ownership, no photo provenance.

## The thirteen pages

Paths are derived by `Guide.derive_destination_slug/1` (downcase, non-alphanumerics to
hyphens). The set is fixed by the guides that exist:

| Path | Kind | Guides |
|---|---|---|
| `connecticut` | state | 165 |
| `new-york` | state | 107 |
| `rome` | destination | 1 |
| `connecticut/fairfield-county` | county | 22 |
| `connecticut/hartford-county` | county | 29 |
| `connecticut/litchfield-county` | county | 25 |
| `connecticut/middlesex-county` | county | 15 |
| `connecticut/new-haven-county` | county | 24 |
| `connecticut/new-london-county` | county | 22 |
| `connecticut/tolland-county` | county | 13 |
| `connecticut/windham-county` | county | 15 |
| `new-york/brooklyn` | county | 69 |
| `new-york/manhattan` | county | 38 |

Guide counts exclude the five Connecticut code-module guides, which carry state and county
and therefore fold into their county pages at render time.

The `/destinations` index is **out of scope**. It is a list of destinations, not a place, and
it needs a different kind of copy.

## Design

### Data model

One table, keyed by the URL path.

```
destinations
  path      :string  not null, unique   # "connecticut", "new-york/brooklyn", "rome"
  name      :string  not null           # "Litchfield County"
  intro     :text    not null
  photos    {:array, :map}  default []
```

**Why `path` rather than `state_slug` + `county_slug`.** Destinations come in three shapes —
state, county, standalone town — so a column pair needs a nullable `county_slug`, and
Postgres treats NULLs as distinct in a unique index. That means a partial index plus
null-handling in every query, to express something the router already knows. The controller
holds the exact path it is rendering; one string lookup against one unique index cannot
drift from the routes.

**The record is additive.** `list_states/0` and `list_counties_for_state/1` are unchanged and
still derive the guide lists. A `Destination` supplies an intro and photos, nothing else. A
page with no record renders exactly as it does today, so this ships incrementally and cannot
break a page by omission.

`photos` reuses the seven-key map already used by guides and places: `src`, `thumb`, `title`,
`description`, `author`, `license`, `source_url`.

### Content, synthesized rather than researched

Thirteen seed files under `priv/seed_data/destinations/`, loaded by
`Ethos.Seeds.DataDestination` mirroring `Ethos.Seeds.DataGuide`, seeded by
`Ethos.Release.seed_destinations/1`.

Each intro is **120-180 words, synthesized from the research artifacts already on disk**.
Litchfield County's page is written from the 25 Litchfield town artifacts; Brooklyn's from
the 69 neighborhood artifacts. Every one of those was produced by a finder and checked by an
adversarial verifier during the Connecticut and Brooklyn programs.

This is the central design decision and it buys two things. No new research, and a county
page that is **provably consistent with its own town pages**, because it is built from the
same verdicts they were.

The authoring contract carries over unchanged
(`docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md`):

- A `confirmed` verdict vouches for what the verdict's own `item` restates, not for every
  clause in the finder's sentence.
- No superlatives, rankings or attributions that are not restated. **This matters more here
  than anywhere else in the corpus:** a county page naturally reaches for "the largest",
  "the oldest", "the first", and it is summarising 25 towns, so the temptation to rank them
  is structural.
- No architectural style unless a verifier wrote it.
- No trip durations.
- No exclusivity sentences. A destination page is a summary, which is precisely the shape
  that produces "the only", "the three", "its landmark is".
- Boundary language stays hedged.

**A synthesis-specific rule, new to this spec:** a claim true of one town is not thereby true
of its county. "Litchfield County's towns were shaped by the iron industry" requires evidence
about the county, not about Salisbury. Where the artifacts support only a per-town claim,
attribute it to that town by name or leave it out.

### Photos

One or two per page, Wikimedia Commons only, licences restricted to `Public domain`, `CC0`,
`CC BY x.y`, `CC BY-SA x.y`.

- Paths `/photos/destinations/{path}/{label}.jpg` and `..._thumb.jpg`, with `/` in the path
  replaced by `-` for the directory name.
- `priv/seed_data/destination_photo_manifest.json` pins each label to its Commons file URL
  and the sha256 of the downloaded image.
- `mix ethos.optimize_destination_photos`, sharing `Ethos.PhotoManifest` with the Brooklyn
  and Connecticut tasks rather than adding a fourth near-duplicate.
- Magic-byte validation on download, and **open each image to confirm it depicts what the
  candidate claims** — fourteen candidates across the Brooklyn program did not.

County-level Commons coverage is uneven. **A page shipping with no photo is an expected
outcome**, as it was for several Brooklyn neighborhoods, and is preferable to a loosely
related image.

This also completes work shipped on 2026-08-29: destination pages emit `page_og` with
`image: nil`. With a record they get a real social preview image.

### Rendering

`destination_html/state.html.heex`, `county.html.heex` and `show.html.heex` each gain an
intro block and photo above the existing guide list, guarded on the record's presence so a
missing record renders today's page unchanged.

`destination_controller.ex` loads the record by path in all four branches and passes it
through, along with the photo as the `page_og` image when one exists.

### The gate

`test/ethos/seeds/destination_seed_data_test.exs`, porting the Brooklyn gate:

- **Roster equality** — the committed seed files match the thirteen paths exactly, failing
  in both directions and naming which.
- **Every path resolves to a real destination page.** A `Destination` whose path names a
  state or county the guides table does not produce is a page nobody can reach. This is the
  assertion the Brooklyn gate had no equivalent of, and the one most likely to catch a real
  mistake.
- Intro word count inside 120-180.
- Licence allowlist; photo labels globally unique; every referenced photo present on disk;
  manifest provenance matching the published credit.
- The trip-duration ban, all eleven patterns.
- Place-slug uniqueness is not applicable — destinations own no places.

### Seeding order

`seed_destinations` is independent of the link graph and of guide seeding: it writes its own
table and resolves nothing. It can run anywhere in the sequence. The runbook
(`docs/runbooks/seeding.md`) gains it after `seed_brooklyn`, before `seed_collections`, for
consistency rather than necessity.

## Risks

**Synthesis drifts from its sources.** The failure mode is a county page asserting something
none of its town pages support. Mitigated by the per-town attribution rule above and by a
fact-fidelity review that traces each intro back to the artifacts it was built from — the
same review every content wave has had.

**County-level photos are thin.** Expect several pages with none. Accepted.

**Thirteen pages is small enough to feel routine.** Every defect class this project found —
unrestated clauses, architectural style, exclusivity sentences — was found in content that
felt routine while it was being written. The gate and the review are not optional because
the program is short.

## Success criteria

- All thirteen destination pages carry a 120-180 word intro; the roster assertion passes
  with strict equality.
- Every published claim traces to a research artifact that already survived verification.
- No destination record names a path the guides table does not produce.
- Photo credits byte-identical to their Commons source; manifest reconciles with disk.
- Full suite green.
- `/destinations/connecticut` and `/destinations/new-york/brooklyn` render prose and a
  photograph above their guide lists, and produce a social preview image when shared.
