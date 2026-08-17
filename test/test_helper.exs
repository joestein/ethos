Mox.defmock(Ethos.ClaudeMock, for: Ethos.Claude)
Mox.defmock(Ethos.ExaMock, for: Ethos.Exa)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Ethos.Repo, :manual)
