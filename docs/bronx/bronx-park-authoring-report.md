# Bronx Park — authoring report

**Status: not shipped.** `priv/seed_data/bronx/bronx-park.json` was not
authored. Bronx Park cannot clear the orientation-page link floor with honest
links, and the dispatch's own instruction on that point is explicit: *"If you
cannot reach three honest links, stop and report that rather than padding. A
manufactured link is worse than a failed floor."* This report is that ruling.

Nothing was committed to `priv/seed_data/bronx/`. The corpus is unchanged at
two files, `belmont.json` and `mott-haven.json`.

---

## 1. The tier call, which is not in dispute

Five places survive verdict filtering: Bronx Park, the New York Botanical
Garden, the Bronx Zoo, the Lorillard Snuff Mill, and Bronx River Forest. Five
is below the six-place threshold, so the file is a `"tier": "town-page"`
orientation page. The verifier reached the same count independently.

An orientation page must clear two floors, both mechanically enforced by
`floor_violations/1` in `test/ethos/seeds/bronx_seed_data_test.exs`:

* an intro of at least 90 words, and
* **at least 3 outbound links.**

The intro floor is comfortably reachable — the neighborhood-level verdicts
carry 718 acres, the boundary streets, the 1884 New Parks Act, the Fordham and
Lorillard land, the 1891 Garden, the 1899 Zoo, Fordham Road bisecting the two,
and the Bronx River's two miles through the park. That is more than enough
verified history for 90 to 130 words.

The link floor is the one that fails.

## 2. Exactly one honest outbound link exists

Every link note is a factual claim and must trace to a verdict. Working
through the four permitted link kinds against the verdicts:

**`nearby` — a shared border.** The verdicts confirm, verbatim, exactly three
adjacent neighborhoods: *"Adjacent neighborhoods include Pelham Parkway to the
east, West Farms to the south, and Belmont to the west."* Of those three, the
roster marks only Belmont `in_scope: true`, and only Belmont has shipped:

| Adjacent neighborhood | Roster `in_scope` | Seed file |
| --- | --- | --- |
| Belmont | true | shipped |
| West Farms | **false** | never |
| Pelham Parkway | **false** | never |

A `guide:` target that no file defines raises `ArgumentError` out of
`Ethos.Links.resolve!/1`, which aborts the whole link-upsert pass rather than
skipping the edge. West Farms and Pelham Parkway are not merely unshipped —
they are out of scope, so they will not arrive later either.

**That yields one link: `guide:belmont-bronx-guide`.** It is a strong one. The
border is confirmed from both sides (Bronx Park's own article gives "Belmont to
the west"; Belmont's gives Bronx Park as its "definitive eastern border" and
places the Zoo and Garden "at the northeastern edge of Belmont"), and
`belmont.json`'s shipped intro already carries the shared history — the
construction of the Bronx Zoo and the New York Botanical Garden from 1898 gave
work to Italian immigrants. The note writes itself and traces cleanly.

**`same-region`.** The only other shipped Bronx guide is Mott Haven. The
verdicts do not mention Mott Haven, or Community District 1, or the South
Bronx, in any form. There is no clause to trace, so any note would be authored
from outside the research. Rejected as padding.

**`shared-history`.** Only Belmont, which is already the `nearby` edge. Two
edges to one target would render Belmont twice in the Nearby block and would
not be a second connection — it would be one connection counted twice to clear
a floor. Rejected.

**`see-also` — cross-borough, and only for a real named connection.** I checked
the whole shipped corpus rather than reasoning about it: no file in
`priv/seed_data/manhattan/` (38 guides) or `priv/seed_data/brooklyn/` (69
guides) mentions Bronx Park, the Bronx Zoo, the New York Botanical Garden, the
Bronx River, the Lorillards, a herbarium or Torrey. The one hit was Bay Ridge's
Narrows Botanical Gardens, an unrelated Brooklyn park.

Two candidate ties surfaced from the verdicts and both were rejected on
inspection:

* **Columbia College herbarium → Morningside Heights.** The verdicts confirm
  NYBG's acquisition of the Columbia College herbarium in 1895 (~600,000
  specimens). But Morningside Heights' own shipped guide records that Columbia's
  new campus opened in 1897 — so in 1895 the herbarium was not in the
  neighborhood the link would point at. The note would be false at its own date.
* **Andrew Carnegie → Carnegie Hill.** Carnegie is a confirmed NYBG principal
  officer, alongside Cornelius Vanderbilt II and J.P. Morgan. A person being an
  officer of an institution in one neighborhood is not a documented tie between
  two neighborhoods; it is the "these are both interesting places" edge the
  rules name specifically. Rejected.

**Honest total: 1. Floor: 3.** The gate would report
`{"bronx-park.json", "only 1 outbound links, floor is 3"}` and fail the suite.

## 3. Why this is structural, not a sequencing problem

Two of Bronx Park's three confirmed neighbors are permanently out of scope.
Shipping the rest of wave 2 does not fix it:

* `fordham-heights` (in scope, wave 2, unshipped) is the only remaining
  candidate, and it is a *different neighborhood* from the "Fordham" whose
  article the verdicts adjudicate. Verdict flagged item 2 rules on Fordham's
  boundary — Southern Boulevard, meeting Bronx Park at a line — but nothing in
  the research establishes that Fordham Heights, as the roster names it, borders
  Bronx Park. Treating the two as the same neighborhood is exactly the outside
  knowledge rule 2 forbids.
* Even granting that edge, the ceiling is 2, still below the floor.

So Bronx Park is a park neighborhood whose only in-scope neighbor is Belmont,
and the 3-link floor — which was written for residential pockets that can reach
sideways to three neighbors — has no honest solution here. Three ways out, all
of them decisions for the programme rather than for an authoring task:

1. **Commission adjacency research.** The finder never pulled transit or
   adjacency material beyond the Wikipedia boundary line (see §5). A pass that
   establishes Bronx Park's border with Bedford Park, Norwood or Fordham Manor
   would still need those files to ship, and all three are `in_scope: false`.
2. **Flip `west-farms` and/or `pelham-parkway` to `in_scope: true`** and author
   them. Both are confirmed borders; two of them would take Bronx Park to three.
   This is the cleanest fix and it makes the existing verdicts sufficient.
3. **Flip `bronx-park` to `in_scope: false`** and record the omission.

## 4. The cost of option 3, which the caller should weigh

Omitting Bronx Park breaks the marquee-institution gate, currently dark behind
`@tag :pending_bronx`:

```elixir
@marquee_institutions [
  {"New York Botanical Garden", ~r/^new-york-botanical-garden/},
  {"Bronx Zoo", ~r/^bronx-zoo/},
  ...
]
```

Both must appear in **exactly one** Bronx seed file, and the gate's own comment
names Bronx Park as their home. Zero is the failure it was written to catch —
"it fell between two waves". So option 3 does not close the question; it defers
a red gate to whichever wave un-tags it. Options 1 and 2 do close it.

I verified the duplication half myself rather than taking the verifier's word:
`belmont.json` defines 40 places and none of them is the Zoo or the Garden.
Both appear there only inside two `links[].note` strings. Nothing in the corpus
claims either institution today, so whichever file eventually ships them is
uncontested.

## 5. Two research gaps that would have bound the file anyway

Recorded so the next pass does not start cold.

* **No transit research exists for Bronx Park.** The finder states plainly:
  *"Not researched in this pass — no subway/bus/train material was pulled for
  Bronx Park itself,"* and marks the subsection `searched: incomplete`. The
  verdicts carry no station, line, Metro-North stop, bus route or ferry landing.
  The `Getting there` heading is gated on both tiers, so the section is
  mandatory — but with zero sourced transit facts it could only have been
  written as a page-level statement that no station is named here, which is a
  thin section and four such constructions on the previous page already read
  like a memo. The finder's own recommendation stands: pull the Bronx Zoo's and
  NYBG's visitor-information pages, which carry subway and bus directions.
* **Bronx River Forest has no acreage, boundary or designation date.**
  Confirmed as a real gap, not an error. Its identity and description are
  complete, so it ships as a place; it just cannot carry a dimension.

## 6. Editorial rulings already made, so a later pass reuses them

The content work is done and traceable; only the links block it. Applying it:

* **Five places, and the Snuff Mill is one of them.** Verdict item 6 rules it
  standalone on a distinct road address (Snuff Mill Road), a pre-Garden
  institutional history, and two landmark designations (NYC 1966, NHL/NRHP
  1977) that predate every NYBG-specific designation.
* **Sub-attractions stay features of their parents.** Astor Court, Congo
  Gorilla Forest, JungleWorld, the Enid A. Haupt Conservatory, the Thain Family
  Forest, the Mertz Library and the Rose Garden all belong inside their
  institution's entry, per verdict item 7 — a dedicated Wikipedia article is not
  an independent address.
* **Conservatory landmark date: October 16, 1973.** Not 1976. The correction is
  supplied by the verdict and is used exactly as given; 1976 is footnoted to a
  secondary guidebook, 1973 to the LPC designation report itself.
* **Mertz Library: completed 1900, and no conflict is mentioned.** The verifier
  refuted the "1900 vs 1901" framing outright — the article never states 1901,
  and its only 1901 mentions are unrelated fountain and road contracts. Writing
  about the conflict would publish a dispute that does not exist.
* **American Bison Society: the 1905 year ships, "founded at the zoo" does
  not.** The year and the 1913 shipment of fourteen bison are confirmed
  verbatim; the source never places the founding meeting at the zoo. The
  specific is removed, not hedged.
* **"Hundreds of unique rose varieties" is cut entirely.** Accurately quoted,
  but it is NYBG describing itself, which its own site cannot establish. The
  Rose Garden keeps Beatrix Jones Farrand and 1916 and the 2007 renovation. Cut,
  not framed as unverified — §2's remedy is removal, and the previous
  neighborhood's mistake was reproducing a specific in full and then disclaiming
  it.
* **The Lorillard acquisition date is written without a date.** Three sources
  give 1870, 1884 and 1888–89, and all three are confirmed to their own
  sources — a genuine disagreement, not an unverified claim. Asserting one year
  claims more than the research supports and listing all three reads as a
  footnote, so the fact is written in a form true under all of them.
* **Forever Wild, the Thain Family Forest and Bronx River Forest are three
  separate claims.** Verdict item 5 confirms no source relates them; prose must
  not imply a relationship.
* **No photos.** Belmont and Mott Haven both ship without them and no photo
  artifact exists for this neighborhood.
* **No DOHMH or DCWP material anywhere.** The finder reports zero DOHMH-only
  places and the verifier confirmed no such citation appears in either
  artifact, so the rule never bound here.

## 7. Verification

* `mix format --check-formatted` — clean.
* `mix test` — baseline, unchanged, since no file was added.
* Structured-data census in `test/ethos_web/components/structured_data_test.exs`
  — **unmoved**, and deliberately so. It stands at 2113 total, 1575 with a
  `streetAddress`, 538 with none, 1712 with a `postalCode`, 248 locality-only.
  Shipping Bronx Park's five places would have moved it; shipping nothing does
  not, so the assertions are left exactly as they are.
