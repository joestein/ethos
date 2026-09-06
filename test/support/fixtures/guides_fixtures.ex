defmodule Ethos.GuidesFixtures do
  import Ethos.AccountsFixtures

  @doc """
  A guide, optionally filed on a real roster node.

  Pass `destination_path:` (or `"destination_path"`) and the node and its
  ancestors are seeded from `priv/seed_data/destination_tree.json` first, then
  resolved to the `destination_id` the guide actually carries.

  It is a `destination_path` rather than a state and a county because a guide's
  geography is now nothing but the node it names: the breadcrumb walks that
  node's ancestry, a hub lists the guides filed against it, and
  `Ethos.Affiliates` matches its campaign against the node's path. A fixture
  writing a state string would be describing a column that no longer exists,
  which is how a suite goes green over geography production does not have.

  Omit it for a guide with no node — the shape a guide authored through the web
  UI has, and the shape that must resolve to no affiliate locale.
  """
  def guide_fixture(attrs \\ %{}) do
    user = Map.get_lazy(attrs, :user, fn -> user_fixture() end)

    attrs =
      attrs
      |> Map.drop([:user, "user"])
      |> normalize_keys()
      |> put_destination_id()

    {:ok, guide} =
      Ethos.Guides.create_guide(
        user,
        Map.merge(%{title: "Test Trip", destination: "Lisbon, Portugal"}, attrs)
      )

    guide
  end

  defp put_destination_id(%{destination_path: path} = attrs) when is_binary(path) do
    Ethos.SeedDataHelpers.seed_destination_paths!([path])
    node = Ethos.Destinations.get_by_path(path)

    attrs
    |> Map.delete(:destination_path)
    |> Map.put(:destination_id, node.id)
  end

  defp put_destination_id(attrs), do: attrs

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
