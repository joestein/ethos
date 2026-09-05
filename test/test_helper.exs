Mox.defmock(Ethos.ClaudeMock, for: Ethos.Claude)
Mox.defmock(Ethos.ExaMock, for: Ethos.Exa)

ExUnit.start()

# The two content assertions in Ethos.Seeds.PlaceContentGateTest fail on today's
# corpus by design: they name the summaries the research waves exist to rewrite.
# They land excluded rather than red so that a later task's test run stays
# unambiguous — a red baseline makes an implementer unable to tell their own
# regression from the expected failure. Delete this line, and the `@tag
# :pending_wave` on both tests, once the waves have rewritten that prose.
#
#     mix test --include pending_wave
#
# Ethos.Seeds.BronxSeedDataTest is the gate every Bronx research wave must
# pass. It is written before the corpus it guards, so it lands excluded: over a
# priv/seed_data/bronx/ holding only .gitkeep the roster assertion and every
# non-vacuity floor fail by construction, and a gate that fails because there
# is nothing to check yet is noise rather than information.
#
# This is a SEPARATE tag from :pending_wave on purpose. That one is owned by
# the place-research backlog (320 places still owed) and gates two assertions
# in Ethos.Seeds.PlaceContentGateTest; sharing it would tie the deletion of one
# to the completion of the other.
#
# Removed in two stages, both inside the Bronx plan:
#
#   * Task 3, which lands the first neighborhood, deletes the `@moduletag
#     :pending_bronx` from the test file. Everything then runs except the two
#     tests carrying their own `@tag :pending_bronx`.
#   * The last in-scope wave — 14 neighborhoods, not the full 66 — deletes
#     those two tags and the :pending_bronx entry below. The programme
#     narrowed on 2026-08-31; see
#     docs/superpowers/specs/2026-08-31-narrowed-nyc-scope-design.md.
#
#     mix test --include pending_bronx
#
# Ethos.Seeds.QueensSeedDataTest is the same thing one borough later, and it is
# at the stage the Bronx gate was at before its Task 3: the WHOLE module carries
# `@moduletag :pending_queens` and priv/seed_data/queens/ holds only .gitkeep,
# so nothing in it runs. The Queens research is deferred to a later plan
# entirely, so this tag will sit here longer than the other two did.
#
# It is a THIRD tag rather than a reuse of :pending_bronx, for the reason that
# separated :pending_bronx from :pending_wave: the Bronx programme is mid-flight
# with 13 in-scope neighborhoods left, and whichever of the two finishes first
# would either be unable to delete the shared tag or, deleting it, un-exclude the
# other borough's gate and turn the suite red on a corpus it never touched.
#
# Removed in two stages, both inside the future Queens research plan:
#
#   * The first research wave, which lands the first seed file, deletes the
#     `@moduletag :pending_queens` from the test file. Everything then runs
#     except the three tests carrying their own `@tag :pending_queens`.
#   * The last in-scope wave — 21 neighborhoods, not the full 111 — deletes
#     those three tags and the :pending_queens entry below. The programme
#     narrowed on 2026-08-31; see
#     docs/superpowers/specs/2026-08-31-narrowed-nyc-scope-design.md.
#
#     mix test --include pending_queens
#
# All three tags live in ONE ExUnit.configure call because a second call passing
# `exclude:` replaces the list rather than appending to it — which would
# silently re-enable the two :pending_wave tests and the Bronx gate, and turn
# the suite red on pre-existing defects neither programme owns.
# :pending_queens removed 2026-09-02 by the last in-scope wave, which landed the
# twenty-first Queens seed file. Both remaining `@tag :pending_queens` lines came
# off with it — roster equality and marquee institutions — so the tag now names
# nothing and excluding it would only hide a future typo. The single-call rule
# above still binds: this list is edited in place, never by adding a second
# ExUnit.configure/1.
#
# Ethos.Seeds.RomeSeedDataTest is the same construction one city later, and it
# is at the stage the Queens gate was at before its first wave: the WHOLE
# module carries `@moduletag :pending_rome` and priv/seed_data/rome/ holds only
# .gitkeep, so nothing in it runs.
#
# It is a fourth tag rather than a reuse of :pending_bronx for the reason that
# separated the others: the Bronx programme still has Fordham Heights
# outstanding, and whichever of the two finishes first would either be unable
# to delete the shared tag or, deleting it, un-exclude the other's gate and
# turn the suite red on a corpus it never touched.
#
# Removed in two stages, both inside the Rome research programme:
#
#   * The first research wave, which lands the first seed file, deletes the
#     `@moduletag :pending_rome` from the test file. Everything then runs
#     except the one test carrying its own `@tag :pending_rome`.
#   * The last in-scope wave — 31 zones: 22 rioni, 8 tier-1 quartieri and
#     Vatican City — deletes that tag and the :pending_rome entry below. The
#     scope was ruled on 2026-09-02; see priv/seed_data/rome_roster.json,
#     whose scope_ruling and vatican_ruling fields are the record.
#
#     mix test --include pending_rome
#
# :pending_rome removed 2026-09-03 by the last in-scope wave, which landed
# Vatican City and brought Rome to all thirty-one zones. Its own `@tag` came
# off with it, so the tag now names nothing and excluding it would only hide a
# future typo. The single-call rule above still binds: this list is edited in
# place, never by adding a second ExUnit.configure/1.
#
# Ethos.Seeds.SanFranciscoSeedDataTest is the same construction one city later,
# at the stage the Rome gate was at before its first wave: the WHOLE module
# carries `@moduletag :pending_san_francisco` and priv/seed_data/san_francisco/
# holds only .gitkeep, so nothing in it runs.
#
# Removed in two stages, both inside the San Francisco programme:
#
#   * The first research wave, which lands the first seed file, deletes the
#     `@moduletag :pending_san_francisco` from the test file. Everything then
#     runs except the one test carrying its own `@tag`.
#   * The last wave — 23 zones: 20 neighborhoods and 3 park pages — deletes
#     that tag and the entry below. The scope was ruled on 2026-09-03; see
#     docs/superpowers/specs/2026-09-03-san-francisco-neighborhoods-design.md
#     and priv/seed_data/san_francisco_roster.json.
#
#     mix test --include pending_san_francisco
#
# :pending_san_francisco removed 2026-09-03 by wave 2, which landed the last
# eleven zones and brought San Francisco to all twenty-three. Its own `@tag`
# came off with it, so the tag names nothing and excluding it would only hide a
# future typo. The single-call rule above still binds.
#
# Ethos.Seeds.LondonSeedDataTest is the same construction one city later, at
# the stage the San Francisco gate was at before its first wave: the WHOLE
# module carries `@moduletag :pending_london` and priv/seed_data/london/ holds
# only .gitkeep, so nothing in it runs. Its self-tests — the ones proving each
# ban can fail and does not fire on prose that must publish — are the reason
# the gate is worth landing before the corpus, and they are also excluded
# until the first wave, which is the cost of one tag for the whole module.
#
# Removed in two stages, both inside the London programme:
#
#   * The first research wave, which lands the first seed file, deletes the
#     `@moduletag :pending_london` from the test file. Everything then runs
#     except the one test carrying its own `@tag`.
#   * The last wave — 33 boroughs, the GLA's complete set — deletes that tag
#     and the entry below. The scope was ruled on 2026-09-04; see
#     docs/superpowers/specs/2026-09-04-london-boroughs-design.md and
#     priv/seed_data/london_roster.json, whose unit_ruling and scope_ruling
#     fields are the record of why the unit is the borough.
#
#     mix test --include pending_london
#
# :pending_london removed 2026-09-04 by wave 3, which landed the final eleven
# boroughs and brought London to all thirty-three units. Its own `@tag` came
# off with it, so the tag names nothing and excluding it would only hide a
# future typo. The single-call rule above still binds: this list is edited in
# place, never by adding a second ExUnit.configure/1.
ExUnit.configure(exclude: [:pending_wave, :pending_bronx])

Ecto.Adapters.SQL.Sandbox.mode(Ethos.Repo, :manual)
