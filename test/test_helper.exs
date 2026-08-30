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
#   * Task 5, which completes the last wave, deletes those two tags and the
#     :pending_bronx entry below.
#
#     mix test --include pending_bronx
#
# Both tags live in ONE ExUnit.configure call because a second call passing
# `exclude:` replaces the list rather than appending to it — which would
# silently re-enable the two :pending_wave tests and turn the suite red on
# pre-existing defects neither programme owns.
ExUnit.configure(exclude: [:pending_wave, :pending_bronx])

Ecto.Adapters.SQL.Sandbox.mode(Ethos.Repo, :manual)
