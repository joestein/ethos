defmodule Ethos.GuidesFixtures do
  import Ethos.AccountsFixtures

  def guide_fixture(attrs \\ %{}) do
    user = Map.get_lazy(attrs, :user, fn -> user_fixture() end)

    {:ok, guide} =
      Ethos.Guides.create_guide(
        user,
        Map.merge(
          %{title: "Test Trip", destination: "Lisbon, Portugal"},
          normalize_keys(Map.drop(attrs, [:user, "user"]))
        )
      )

    guide
  end

  defp normalize_keys(map) do
    Map.new(map, fn
      {k, v} when is_binary(k) -> {String.to_existing_atom(k), v}
      {k, v} -> {k, v}
    end)
  end

  def published_guide_fixture(attrs \\ %{}) do
    {:ok, guide} = attrs |> guide_fixture() |> Ethos.Guides.publish_guide()
    guide
  end
end
