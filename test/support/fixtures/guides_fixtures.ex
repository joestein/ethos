defmodule Ethos.GuidesFixtures do
  import Ethos.AccountsFixtures

  def guide_fixture(attrs \\ %{}) do
    user = Map.get_lazy(attrs, :user, fn -> user_fixture() end)

    {:ok, guide} =
      Ethos.Guides.create_guide(
        user,
        Enum.into(Map.drop(attrs, [:user]), %{title: "Test Trip", destination: "Lisbon, Portugal"})
      )

    guide
  end

  def published_guide_fixture(attrs \\ %{}) do
    {:ok, guide} = attrs |> guide_fixture() |> Ethos.Guides.publish_guide()
    guide
  end
end
