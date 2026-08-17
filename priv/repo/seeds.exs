# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Ethos.Repo.insert!(%Ethos.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Ethos.{Accounts, Guides}

{:ok, demo} =
  Accounts.register_user(%{email: "demo@ethos.example", password: "demo-password-123!"})

{:ok, guide} =
  Guides.create_guide(demo, %{title: "Lisbon in 5 days", destination: "Lisbon, Portugal"})

[
  %{day: 1, kind: "food", name: "Cervejaria Ramiro", note: "Garlic shrimp + prego. Go at opening or queue an hour.", verdict: "loved"},
  %{day: 1, kind: "walk", name: "Alfama at golden hour", note: "Get lost on purpose. Miradouro de Santa Luzia at sunset.", verdict: "loved"},
  %{day: 2, kind: "sight", name: "Belém Tower", note: "Fine from outside; skip the interior queue.", verdict: "skip"},
  %{day: 2, kind: "food", name: "Pastéis de Belém", note: "Yes it's touristy. Yes it's worth it. Eat them warm.", verdict: "loved"},
  %{day: 3, kind: "tour", name: "LX Factory", note: "Creative complex under the bridge — Sunday market is best.", verdict: "good"},
  %{day: 4, kind: "tip", name: "Carris day pass", note: "€6.80 covers trams incl. the 28 — buy at metro machines.", verdict: "good"}
]
|> Enum.each(fn attrs -> {:ok, _} = Guides.create_entry(guide, attrs) end)

{:ok, _} = Guides.publish_guide(guide)
