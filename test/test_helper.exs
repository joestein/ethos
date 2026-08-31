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
# with 65 neighborhoods left, and whichever of the two finishes first would
# either be unable to delete the shared tag or, deleting it, un-exclude the
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
ExUnit.configure(exclude: [:pending_wave, :pending_bronx, :pending_queens])

Ecto.Adapters.SQL.Sandbox.mode(Ethos.Repo, :manual)
