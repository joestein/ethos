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
ExUnit.configure(exclude: [:pending_wave])

Ecto.Adapters.SQL.Sandbox.mode(Ethos.Repo, :manual)
