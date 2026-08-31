# Narrowing the Bronx and Queens to a Deep Core

**Status:** approved design, ready for planning
**Date:** 2026-08-31
**Amends:** `docs/superpowers/specs/2026-08-30-bronx-neighborhoods-design.md`,
`docs/superpowers/specs/2026-08-31-queens-neighborhoods-design.md`

## Why

Both programmes were scoped to their full rosters — 66 Bronx neighborhoods and
111 Queens — on the assumption that research would run at Belmont's depth.

**It does not, because WebSearch is exhausted.** The first neighborhood of Bronx
wave 1 measured the gap directly:

| | Belmont (search available) | Mott Haven (search exhausted) |
| --- | --- | --- |
| Places shipped | 40 | 9 |
| Claims verified | 208 | 88 |
| Research cost | — | ~240k tokens, ~16 min |

Nothing unverified shipped in either case; the discipline held. The loss is
coverage, not accuracy — Bruckner Bar & Grill and Ceetay are real Mott Haven
restaurants that dropped out because no source surfaced without search.

At that density, 176 remaining neighborhoods produce a corpus roughly a quarter
as deep as Belmont's, for something like 42M tokens of research alone. The owner
chose depth over completeness on 2026-08-31: **do the neighborhoods that carry
traveler intent, at full depth as budget allows, and leave the residential
remainder unwritten rather than thin.**

## The scope: 35 neighborhoods

Every slug below is verified present in its committed roster.

**Bronx — 14.** `belmont` (shipped), `mott-haven` (researched), `riverdale`,
`city-island`, `fordham-heights`, `kingsbridge`, `pelham-bay`, `throgs-neck`,
`concourse`, `woodlawn`, `morris-park`, `bronx-park`, `hunts-point`,
`van-cortlandt-park`.

**Queens — 21.** `astoria`, `long-island-city`, `ditmars-steinway`, `flushing`,
`jackson-heights`, `elmhurst`, `corona`, `sunnyside`, `woodside`,
`forest-hills`, `rego-park`, `kew-gardens`, `ridgewood`, `glendale`, `maspeth`,
`richmond-hill`, `jamaica`, `bayside`, `douglaston`, `rockaway-beach`,
`far-rockaway`.

The selection is commercial spines and food districts (Arthur Avenue, Roosevelt
Avenue, downtown Flushing, Steinway Street), waterfront and park destinations
(City Island, Pelham Bay, Van Cortlandt Park, the Rockaways, Bronx Park for the
Zoo and Botanical Garden), the two ballpark neighborhoods that already have
guides (`concourse`, and `flushing` for Citi Field), and the arts corridors
(Long Island City, Mott Haven).

`fordham-heights` is taken rather than `fordham-manor` — the roster splits
Fordham in two and the commercial spine is Fordham Road.

`van-cortlandt-park` was missing from the first draft of this list and was added
after checking the marquee institutions against it: Van Cortlandt House Museum,
the oldest building in the Bronx, sits there. Its omission was an oversight
rather than a judgment — a 1,146-acre park holding a landmark museum is the same
shape as Pelham Bay and Bronx Park, both of which were already in. Adding it
also means **no marquee row has to be dropped**, which is the better outcome
than narrowing a coverage gate to fit a scope error.

What is left out is the residential remainder: the neighborhoods where an honest
guide would say people live here and little else. That is the whole point of
narrowing, and it is a better outcome than a thin page.

## The mechanism: a flag, not a trim

Each roster row gains **`in_scope`**, a boolean. **All 177 rows stay.** The
roster remains the record of what the borough contains; the flag records what
this programme committed to.

Trimming the rosters instead would have been simpler and is wrong: it destroys
the only written account of what was deferred, and a later expansion would have
to re-derive the full neighborhood list from scratch — which is the work Task 1
of each programme existed to do.

## What this breaks, precisely

Checked against the committed tests rather than assumed. Two things break, and
they are narrower than a first reading suggests.

**1. The dispatch-keys assertion, in both roster tests.**

`bronx_roster_test.exs:13` and `queens_roster_test.exs:18` both assert:

```elixir
assert Enum.sort(Map.keys(n)) == ~w(community_district name slug wave)
```

`and no others` is the point of that assertion, so adding a fifth key fails it
immediately. It becomes a five-key list including `in_scope`, and keeps its
exactness — the assertion exists so a stray or misspelled key fails loudly, and
that property must survive.

**2. The roster-equality gates, in both seed-data tests.**

`bronx_seed_data_test.exs` and `queens_seed_data_test.exs` each carry a
`@tag :pending_*` test asserting `MapSet.equal?(shipped, expected)` where
`expected` is every roster slug. Under a narrowed scope those can never pass.

They re-point at the **in-scope subset** and stay bidirectional.

The Bronx gate's own comment anticipates this case and proposes something
weaker:

> If a future roster entry is deliberately omitted … relax this to a
> one-directional difference check and record the omission and its reason in
> the wave report.

**Do not take that route.** A one-directional check loses truncated-corpus
detection, which is the only reason the test exists — its own comment says so
two paragraphs earlier: "deleting a seed file passes every other check in this
file." Equality against the in-scope subset keeps both directions over the set
we actually committed to, and is strictly better than the relaxation the comment
suggests. Update that comment to say so, rather than leaving a note that
recommends the weaker fix.

## What this does NOT break

Stated because a first reading suggests otherwise, and an implementer who
"fixes" these will weaken them for no reason:

- **`queens_roster_test.exs:66`, all 14 community districts represented.**
- **`queens_roster_test.exs:75`, the roster is not trivially small (≥ 80).**
- **Wave contiguity**, in both roster tests.
- **`queens_roster_test.exs:56`, every community district in 1..14.**

Every one of those is a property of the **roster**, and the roster keeps all 177
rows. They are unaffected. Leave them exactly as they are.

## The tag lifecycle changes

`:pending_bronx` and `:pending_queens` were each scheduled to come off when
their programme's last wave landed — 66 and 111 neighborhoods respectively.

They now come off at **14 and 21**. That is reachable, which matters: a tag with
an unreachable removal condition is a tag that never comes off, and both gates'
roster-equality and marquee assertions stay dark indefinitely.

The moduledocs in both seed-data tests describe the old schedule and must be
corrected. `test/test_helper.exs`'s comment does too.

## Marquee institutions — checked, and nothing needs dropping

Both gates carry a `@marquee_institutions` list asserting each named institution
appears in exactly one seed file. An institution sitting in a neighborhood that
will never ship would be reported missing forever — the same failure the Citi
Field places would have produced had they been listed.

**All ten were checked against the in-scope set. All ten are covered.**

| Institution | Neighborhood | In scope |
| --- | --- | --- |
| New York Botanical Garden | `bronx-park` | yes |
| Bronx Zoo | `bronx-park` | yes |
| Van Cortlandt House Museum | `van-cortlandt-park` | yes — see above |
| Orchard Beach | `pelham-bay` | yes |
| Bartow-Pell Mansion | `pelham-bay` | yes |
| Forest Park | `glendale` / `richmond-hill` / `kew-gardens` | yes |
| Alley Pond Park | `bayside` / `douglaston` | yes |
| Astoria Park | `astoria` | yes |
| Socrates Sculpture Park | `astoria` | yes |
| Louis Armstrong House Museum | `corona` | yes |

**Both lists ship unchanged.** This section exists to record that the check was
run and what it found, not to authorise an edit — an implementer who "filters"
these lists is removing coverage for no reason.

## What is explicitly deferred, not abandoned

The 142 out-of-scope neighborhoods keep their roster rows, their community
districts and their wave numbers. Nothing about them is deleted.

If search budget recovers and the owner wants them, the work is: flip
`in_scope`, and run the waves. The roster, the gates, the seeders and the
photo manifests all already exist and already cover them.

## Success criteria

- Both rosters carry `in_scope` on every row; all 177 rows retained.
- The 35 named slugs are `in_scope: true`; the other 142 are `false`.
- Both dispatch-key assertions accept exactly five keys and no more.
- Both roster-equality gates assert equality against the in-scope subset, in
  both directions, and the Bronx gate's comment no longer recommends the
  one-directional relaxation.
- The four Queens roster properties listed above are untouched.
- Both moduledocs and `test_helper.exs` describe the real removal condition.
- Both marquee lists ship UNCHANGED; all ten institutions verified in scope.
- Full suite green.
