# Steakhouse corpus — committed rulings and open follow-ups

The steakhouse vertical shipped in three content waves. Two decisions taken during
those waves lived only in the session ledger
(`.superpowers/sdd/2026-09-06-steakhouses/progress.md`), which is a working file
rather than a durable record. They are written down here, together with the one
piece of work the vertical knowingly left undone.

The evidence for every factual claim in the corpus is in this directory:
`rooms.md` (the room census from Task 1) and `wave1.md`, `wave2.md`, `wave3.md`
(one row per claim, with its source and verdict). Change no published sentence
without reading its row.

---

## Ruling C11 — file every place at the most specific existing node

**The rule.** A steakhouse place carries the **most specific node that already
exists in `priv/seed_data/destination_tree.json`**. Never a node invented for the
purpose; the corpus does not add nodes as a side effect of authoring content.

**How it lands per city.** For New York City, San Francisco and London the most
specific existing node is the neighbourhood, so that is what a room carries. For
Chicago, Boston, Miami, Seattle and Washington DC no sub-city nodes exist, so the
city node *is* the most specific node and filing there is correct, not lazy. For
Los Angeles and Miami the guide sits on one node while each room carries the
municipality it actually stands in, following `korean_bbq/puget-sound.json`.

**Why it exists.** Wave 1 filed all 62 of its places at borough depth. Ruling C5
had said "true municipality", which a borough satisfies, so this was a
consistency question rather than a violation — but these pages sit beside their
`korean_bbq` siblings, and `korean_bbq/queens.json` files at neighbourhood depth
(`murray-hill`, `auburndale`, `oakland-gardens`, `howard-beach`). Two corpora on
the same borough disagreeing about depth is the drift the ruling closes.

**Status.** Waves 2 and 3 applied C11 from the start. Wave 3 also refiled London:
24 of its 28 rooms moved one level deeper, matching the 551-of-584 depth the
London corpus already uses. No node was invented and `destination_tree.json` was
not in that diff.

---

## Open follow-up — wave 1's 62 NYC places are still at borough depth

**The work.** All 62 places in `priv/seed_data/steakhouse/manhattan.json` (31),
`brooklyn.json` (15) and `queens.json` (16) still carry the borough node. Under
C11 they belong at neighbourhood depth. This is a dedicated task, not a piecemeal
edit, because every neighbourhood assignment has to be verified against the
address before the `destination_path` is changed — the same discipline wave 3
applied to London.

**The two nodes it needs.** Two of the 62 have no existing node to move to, and
these are the only nodes this follow-up may add to
`priv/seed_data/destination_tree.json`:

| Node to add | Room that needs it |
| --- | --- |
| `united-states/new-york/new-york-city/queens/south-ozone-park` | RW Prime, 110-00 Rockaway Blvd |
| `united-states/new-york/new-york-city/queens/fresh-meadows` | El Gauchito, 158-15 Horace Harding Expy (the Fresh Meadows room; the Corona Avenue El Gauchito files at Elmhurst) |

**Cost if the ruling turns out wrong.** 62 `destination_path` edits and two
nodes — all mechanical once the assignments are verified.

**How to know it is done.** Every place in the three wave-1 files carries a path
deeper than its borough node, and `every destination_path resolves to a roster
node` in `test/ethos/seeds/steakhouse_seed_data_test.exs` still passes.

---

## Deliberately not refiled — four London rooms that stay at borough level

These four are **not** unfinished work. Each was examined during wave 3's refile
and left at borough depth because the neighbourhood node that would fit either
does not exist or hangs under the wrong borough. Choosing one anyway would be a
guess recorded as a fact.

| Room | Address | Why it stays |
| --- | --- | --- |
| Hawksmoor Air Street | 5a Air Street, W1J 0AD | Sits on the Regent Street / Piccadilly Circus seam where Soho, St James's and Mayfair meet. There is no `piccadilly` node, and picking among the three neighbours would be a guess. |
| Gaucho Piccadilly | 25 Swallow Street, W1B 4QR | One street from Air Street, on the same seam, for the same reason. |
| Hawksmoor Seven Dials | 11 Langley Street, WC2H 9JG | The room is in Camden, but the only `covent-garden` node hangs under Westminster. Filing it there would move the room into the wrong borough. |
| Brat | 4 Redchurch Street, E1 6JL | The room is in Tower Hamlets, but the only `shoreditch` node hangs under Hackney. Blacklock Shoreditch and Sagardi *were* refiled to `hackney/shoreditch` because both are genuinely in Hackney; Brat is not, which is exactly why it stays put. |

Borough tallies are unchanged by the refile, because every new node hangs under
the borough the room already carried. The London FAQ no longer claims that every
room is filed under the borough it stands in; it names the neighbourhood nodes and
these four boundary streets instead.
