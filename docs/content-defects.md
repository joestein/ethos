# Known content defects

Contradictions between shipped guide files that are known, checked, and not
yet resolved. Recorded here rather than in an SDD workspace because those are
git-ignored and get deleted when a program finishes — which is how the
Brooklyn research artifacts were lost.

Each entry says what the corpus asserts, what was checked, and why it is still
open. An entry marked **resolved** stays, so nobody re-opens it.

## Open

### Williamsburg's merger into the City of Brooklyn: 1854 or 1855

The corpus asserts both, twice each.

| Date | Where |
|---|---|
| 1855 | `priv/seed_data/brooklyn/williamsburg.json` — intro and FAQ, reinforced arithmetically by "a city that lasted four years" (City of Williamsburgh 1851 + 4) |
| 1854 | `priv/seed_data/brooklyn/east-williamsburg.json` section body; `priv/seed_data/brooklyn/greenpoint.json` link note dating the three-way Brooklyn/Williamsburgh/Bushwick merger, which `bushwick.json` also carries |

**Checked, 2026-08-29.** All eight Brooklyn files carrying either year were
swept; no fifth file mentions the merger. The two-events explanation — a
legislative act in one year taking effect in the next — was tested for
specifically and is absent: both sides describe the same act in the same terms
("annexed into" / "merged into"), and "Consolidation Act" appears nowhere in
the corpus. `williamsburg.json` does carry a real multi-step chain (village in
Bushwick 1827, Town 1840, City 1851), but every step is separately dated and
none is 1854.

**Why it is still open.** Correcting `east-williamsburg.json` to 1855 would
leave `greenpoint.json` saying the merger Greenpoint was part of happened in
1854 — Williamsburg merging a year after its own merger. Making that
consistent means either changing `bushwick.json` too, or asserting a two-step
process no file supports. Both branches decide, by guess, a question the
corpus cannot settle.

**What would close it.** A primary source on the consolidation, verified the
way every other fact here was: a finder and an independent adversarial
verifier. Not a copy edit.

**Blast radius.** Two guide pages, visible only to a reader who opens both.
No destination page cites the merger.

### Two addresses publish a postal code that is contested or belongs to the neighbouring town

Newly relevant as of 2026-08-29: place JSON-LD now emits `postalCode`, so a ZIP
that used to sit inertly inside a display string is a published claim.

- `priv/seed_data/connecticut/manchester.json` — `"121 Pavilions Drive,
  Manchester, CT (ZIP contested between sources, either 06040 or 06074)"`. The
  address field **says in its own text that the value is contested**, and the
  parser takes the first five-digit run, so `06040` publishes. One of the two is
  wrong and the file does not know which.
- A small number of town-straddling addresses pair a `town` column with the
  other town's ZIP — e.g. `"735 Nod Hill Road, Wilton, CT 06897"` on a record
  whose `town` is Ridgefield. `addressLocality` comes from the column and
  `postalCode` from the string, so the emitted pair is internally inconsistent
  even though each half is individually defensible.

**Checked, 2026-08-29.** Audited across all 2,066 committed seed addresses: no
street line contains a stray five-digit run, no emitted block is type-and-country
only, and only two postal codes come from outside a `", XX ZIP"` slot — both
listed above. Every other one of the 1,669 emitted codes is state-plausible
(CT `06xxx`, NY `10xxx`/`11xxx`).

**Why still open.** Both need a postal-service lookup, which is the kind of
external check the rest of this corpus went through a verifier for. Neither is
worth guessing: a wrong ZIP published as structured data is a worse claim than a
ZIP that merely sits in a display string, which is exactly what changed.

### The Antique Trail disagrees with itself about how many dealers were researched

Both files agree on what ships — sixteen dealers — and disagree on the
denominator.

- `lib/ethos/seeds/antique_trail_guide.ex:17` — "Sixteen dealers, not the
  **seventeen** researched." The same paragraph then names **two** exclusions,
  Adorn Vintage and George Champion Modern, so the moduledoc contradicts itself
  as well as the test.
- `test/ethos/seeds/connecticut_places_test.exs:48` — **eighteen**, and asserts
  sixteen shops at `:33`. 16 + 2 = 18 is internally consistent.

**Checked, 2026-08-30.** The likely history is that eighteen were researched,
Adorn was removed for being in Southbury, and "seventeen" was written of the
Woodbury batch that remained — then George Champion's removal left the figure
stale by one. That is a reconstruction, not a finding: the research artifact
lived in a git-ignored SDD workspace and is gone.

**Why it is still open.** The denominator cannot be recovered from the
repository, and guessing between seventeen and eighteen in a moduledoc that
exists to make the content auditable would defeat the moduledoc. Prose that
names neither number — "sixteen dealers, two researched ones having been
excluded" — is supported by both files and is what `docs/site-builder.md` now
uses.

**Blast radius.** None published. Both numbers live in a moduledoc and a test
comment; no page renders either.

### Madison, New York and Madison, Connecticut share one destination page

Two guides in two states publish under one destination, because the derivation
throws the state away.

| Destination string | Where |
|---|---|
| "Madison, New York" | `priv/seed_data/brooklyn/madison.json` |
| "Madison, Connecticut" | `priv/seed_data/connecticut/madison.json` |

`Ethos.Guides.Guide.derive_destination_slug/1` (`lib/ethos/guides/guide.ex:74`)
splits the destination on a comma and keeps **only the first part**, so both
derive `madison` and `/destinations/madison` lists a Brooklyn neighborhood
alongside a Connecticut shore town.

**Checked, 2026-08-31.** Found by re-running the Queens spec's collision scan
against derived *slugs* rather than destination strings — the original scan
compared full strings, which is precisely the comparison that cannot see this.
All 273 destination strings across `priv/seed_data/` were re-derived and
compared: `madison` is the only such pair in the shipped corpus today.

**Why it is still open.** Both files are correct about their own subject and
neither is wrong on its face; the defect is in the derivation, which is shared
by every guide on the site. The fixes available are to change one town's
destination string — which changes a published URL for content that has a
legitimate claim to it — or to include the state in the derived slug, which
re-slugs every destination page in the corpus and is a migration, not an edit.
Neither belongs in a content pass.

**Blast radius.** One destination page, `/destinations/madison`, listing two
unrelated towns. Both guide pages themselves are correct.

**Queens will add three more unless they are caught.** The Queens roster carries
`murray-hill` (colliding with `priv/seed_data/manhattan/murray-hill.json`,
"Murray Hill, New York" — same state, so it merges the way Flushing does),
`newtown` (`priv/seed_data/connecticut/newtown.json`) and `roxbury`
(`priv/seed_data/connecticut/roxbury.json`). The last two are **cross-state**,
the same shape as this entry. None has landed: `priv/seed_data/queens/` is
empty. `test/ethos/seeds/queens_seed_data_test.exs` carries a Queens-scoped
assertion that fails when any of them ships, deliberately scoped to Queens
rather than corpus-wide so it does not go red on this pre-existing entry.

### Wikipedia gives two reasons for the 1945 Wrigley Field goat ejection

The source disagrees with itself, so the corpus publishes the incident and no
reason for it.

| Reason | Where |
|---|---|
| The pair "were bothering other fans" | `https://en.wikipedia.org/wiki/Curse_of_the_Billy_Goat` |
| Philip K. Wrigley "allegedly ejected Sianis and goat due to the latter's odor" | `https://en.wikipedia.org/wiki/Billy_Goat_Tavern` |

**Checked, 2026-08-30.** The research finder flagged the contradiction and the
independent verifier fetched both articles and reproduced both readings. Both
are stated flatly, in the same register, with no hedge on either side, and
neither article acknowledges the other's account.

**Why it is still open.** No third source was reachable — the research ran with
web search exhausted, on direct URL fetches only — so there is nothing to break
the tie with. Picking one would publish a coin-flip as a fact.

**How the corpus handles it.** `lib/ethos/seeds/wrigley_field_guide.ex`
publishes the ejection with no reason, and says in the prose that two sources
give two reasons and this guide gives neither. `ballpark_places.ex` carries the
incident on the Billy Goat Tavern record on the same terms. An FAQ answer
states the position explicitly, so a reader does not read the omission as an
oversight.

**Blast radius.** Two published surfaces — the guide's "The ballpark and the
team" section and its FAQ — both of which name the gap rather than filling it.

## Resolved

### East Lyme's separation from Lyme is *not* a contradiction

`lyme.json` dates East Lyme's separation to 1823; `east-lyme.json` dates its
incorporation to 1839. These are two different events, and **both files
reconcile them explicitly in their own link notes** — "separated from Lyme in
1823, sixteen years before its own 1839 incorporation."

Recorded because it was reported as a contradiction on 2026-08-29 by a reader
who compared the two intros without their link notes. It is not one. A
"fix" here would introduce an error.

### Ridgefield: Weir Farm, "only" vs "first" National Historical Park

`ridgefield.json` asserted "Connecticut's **only** National Historical Park"
in four places while its own section body said "**first**". All four now read
"first". Fixed 2026-08-29.

`wilton.json` was deliberately left alone: its FAQ's "only" is differently
scoped — the only National Historical Park dedicated to an American artist's
home, studio and grounds — and is correct as written.

### Orange: West Haven became a town in 1921, a city in 1961

`orange.json` said West Haven "became its own city in 1921", against
`west-haven.json`'s town 1921 / city 1961. `orange.json` fixed in both places
(intro and link note) to match the more specific account. Fixed 2026-08-29.

### Brooklyn's earliest Dutch settlement date

`flatbush.json` puts Flatbush's settlement at "between roughly 1630 and 1636";
`gowanus.json` says 1636 is when Gowanus Bay became the site of the first
settlement by Dutch farmers in what is now Brooklyn. The tension is mild and
possibly not real ("Dutch farmers" vs "Dutch settlers"). The Brooklyn
destination page uses 1636, which is inside `flatbush.json`'s own range and is
`gowanus.json`'s date, so it leans on neither. Left as is 2026-08-29.
