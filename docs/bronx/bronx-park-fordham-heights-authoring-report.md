# Bronx Park and Fordham Heights — authoring report

Both files were authored and committed together, because each supplies a link
the other needs to clear the three-link orientation floor. Neither could ship
alone.

## Tier and floor

| File | Surviving places | Tier | Intro words | Outbound links |
|---|---|---|---|---|
| `priv/seed_data/bronx/bronx-park.json` | 5 | `town-page` | 119 | 3 |
| `priv/seed_data/bronx/fordham-heights.json` | 4 | `town-page` | 129 | 3 |

Both counts are the verifiers' own (`bronx-park-verdicts.md` "Surviving
places: 5"; `fordham-heights-verdicts.md` "Surviving places: 4"). Both are
below six, so both are orientation pages, and both clear the 90-word intro
floor and the 3-link floor.

## Places published

**Bronx Park (5):** Bronx Park (`bronx-park`, `park`), New York Botanical
Garden (`new-york-botanical-garden`, `park`), Bronx Zoo (`bronx-zoo`,
`attraction`), Lorillard Snuff Mill (`lorillard-snuff-mill`, `historic-site`),
Bronx River Forest (`bronx-river-forest`, `park`).

The Conservatory, Mertz Library, Thain Family Forest, rose garden and Fountain
of Life are folded into the Garden's record; Astor Court, the Rainey Memorial
Gates, the Rockefeller Fountain, Zoo Center, Congo Gorilla Forest and
JungleWorld into the Zoo's — per the verifier's item 7. The Snuff Mill stands
alone per its item 6.

**Fordham Heights (4):** Grand Concourse (`grand-concourse`, `attraction`),
Paradise Theater (`paradise-theater-bronx`, `theater`), Fordham Road Business
Improvement District (`fordham-road-business-improvement-district`,
`attraction`), Monroe University (`monroe-university`, `attraction`).

Poe Cottage, Poe Park, the Bronx Library Center, the Kingsbridge Road corridor,
Fordham University's Rose Hill campus and Fordham Plaza are **not published
here**, per §0 of the Fordham Heights verdicts. None of their names, slugs or
addresses appears anywhere in either file.

## The six links

| From | Target | Kind | Rests on |
|---|---|---|---|
| Bronx Park | `guide:belmont-bronx-guide` | `nearby` | Belmont's article gives Bronx Park as its eastern boundary; Belmont's shipped intro records Italian immigrants working on the Zoo and Garden from 1898 |
| Bronx Park | `guide:fordham-heights-bronx-guide` | `nearby` | Fordham Road runs west-east from the Harlem River to Bronx Park; the Zoo and Garden are at its **eastern terminus** — the corrected wording, not "runs between" |
| Bronx Park | `place:new-york-aquarium` | `see-also` | WCS is headquartered at the Bronx Zoo and runs the aquarium, whose shipped Coney Island record already says "A Wildlife Conservation Society aquarium" |
| Fordham Heights | `guide:belmont-bronx-guide` | `nearby` | Fordham Road is Belmont's northern boundary in Belmont's own shipped file; the shopping district runs along it |
| Fordham Heights | `guide:bronx-park-bronx-guide` | `nearby` | Fordham Road ends east at Bronx Park; the park's northwestern edge is Webster Avenue, CD5's stated eastern limit |
| Fordham Heights | `guide:brownsville-brooklyn-guide` | `see-also` | Loew's Paradise (opened 1929) and the Loew's Pitkin Theatre in Brownsville (built 1929) — two movie palaces on the same circuit |

**The Loew's choice.** Two shipped files mention Loew's.
`priv/seed_data/manhattan/east-harlem.json` mentions a *Loews hotel* in Miami
Beach, in a sentence about a Rao's spinoff — a hotel chain, not a theatre
circuit, and no connection at all. `priv/seed_data/brooklyn/brownsville.json`
carries `loews-pitkin-theatre`, a 2,827-seat movie palace built in 1929. That
is a real shared circuit and a comparable movie palace of the same year,
carried by the shipped record's own name and date, so Brownsville is the
target.

Every guide slug targeted matches what these files author:
`bronx-park-bronx-guide` and `fordham-heights-bronx-guide`.

## Corrections applied

Bronx Park: Haupt Conservatory landmarked **October 16, 1973**, not 1976.
Mertz Library **completed 1900**, with no "1900 vs 1901" conflict written.
American Bison Society **1905** with the conservation role and the 1913 bison
shipment, but **not** "founded at the zoo". NYBG's "hundreds of unique rose
varieties" cut. The Lorillard acquisition is stated **without a date**.
"Fordham Road runs between the Zoo and the Garden" replaced by "at the eastern
terminus of Fordham Road in Bronx Park". "on the condition it be used as a zoo
and botanical garden" cut.

Fordham Heights: no Grand Concourse Historic District clause of any kind —
neither the NRHP #87001388 district nor the 2011 city district appears in the
file. Monroe University's consolidation is **1977**, presented as a separate
event from the 1967 move. The city-wide "third largest shopping district"
ranking was dropped on the verifier's recommendation; largest-in-borough and
longest-in-borough are published with their attributions.

## Marquee rule

`new-york-botanical-garden` and `bronx-zoo` are place records in
`bronx-park.json` and in no other Bronx file. `fordham-heights.json` does not
mention either institution in any string. Belmont's three prose mentions are
pre-existing `links[].note` and intro text, not place records.

## Transit

Bronx Park's "Getting there" is built from the finder's `## TOP-UP` section
(subway, Metro-North, bus) and states the ferry gap. Fordham Heights' is built
from the verdicts' transit paragraph. No durations anywhere; the gate's eleven
duration patterns and nine proximity patterns were run over every string in
both files before commit and matched nothing.

**Gaps recorded, not filled.** Neither research pass reached a ferry landing
for either neighborhood, and both files say so in one sentence each rather
than claiming none exists. The Bronx Zoo's own page lists three stations for
one gate without tying any of them to it, and the file reproduces that
looseness rather than resolving it.

## Structured-data census

Nine new places; five ship `"address": null` (Bronx Park and Bronx River
Forest, both sourced to boundary streets and a river corridor; the Grand
Concourse and the Fordham Road BID, both linear; Monroe University, for which
no source gives a street address) and are rejected before counting.

| Count | Before | After | Delta |
|---|---|---|---|
| `length(emitted)` | 2113 | 2117 | +4 |
| `streetAddress` | 1575 | 1577 | +2 (Bronx Zoo, Paradise Theater) |
| `is_nil(streetAddress)` | 538 | 540 | +2 (NYBG, Snuff Mill) |
| `postalCode` | 1712 | 1713 | +1 (Bronx Zoo only) |
| locality-only | 248 | 250 | +2 (NYBG, Snuff Mill) |

The `streetAddress`/`is_nil(streetAddress)` pair proves each of the four
addressed rows landed in exactly one bucket; `postalCode` alone proves only
the Bronx Zoo carries a ZIP. The comment in
`test/ethos_web/components/structured_data_test.exs` records the same
accounting.

## One test precondition changed

`test/ethos/release_test.exs` seeded Manhattan before `seed_bronx/1` and its
own comment said "If a wave authors an edge to a Brooklyn guide,
`seed_brooklyn/1` belongs here too." It does now — `place:new-york-aquarium`
and `guide:brownsville-brooklyn-guide` — so the Brooklyn seed was added to the
preconditions. The production runbook order (`seed_brooklyn` before
`seed_bronx`) already satisfies it; no gate was weakened.

## Validation

`mix format --check-formatted` clean. `mix test`: **650 tests, 0 failures, 32
excluded** — the baseline, unchanged. Warnings limited to the tolerated
`data_guide_test.exs:16` and `ct_guides_test.exs:21`.

No photos: the three shipped Bronx pages carry none, no photo artifact exists
for these neighborhoods, and both files ship `"photos": []`.
