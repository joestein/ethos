defmodule Ethos.SeedDataHelpers do
  @moduledoc """
  Assertions shared by every destination's seed-data test.

  `places` carries a global `unique_index(:places, [:slug])`, so a slug used by
  two destinations fails at seed time in production — partway through a run
  that is not transactional, leaving earlier files published and later ones
  unseeded. Each destination test used to hardcode the sibling directories it
  compared against, so adding a destination silently narrowed the check. This
  walks every seed directory instead, and stays correct as destinations are
  added.
  """
  import ExUnit.Assertions

  alias Ethos.Seeds.DataGuide

  @seed_data_root Path.expand("../../priv/seed_data", __DIR__)

  @doc "Sorted absolute paths of a destination's committed seed files."
  def seed_files(destination) do
    @seed_data_root
    |> Path.join("#{destination}/*.json")
    |> Path.wildcard()
    |> Enum.sort()
  end

  # priv/seed_data/destinations/ holds destination-page records — a path, a
  # name, an intro and photos, with no guide, places or entries — so
  # DataGuide.load!/1 raises "missing guide/places/entries keys" on them. They
  # define no place slugs and have nothing to contribute to the checks below;
  # they are validated by test/ethos/seeds/destination_seed_data_test.exs.
  # Excluded by directory rather than by shape, so that a future non-guide
  # directory fails loudly here instead of being silently skipped.
  @non_guide_dirs ["destinations"]

  @doc "Every guide seed file in every guide-corpus directory."
  def all_seed_files do
    @seed_data_root
    |> Path.join("*/*.json")
    |> Path.wildcard()
    |> Enum.reject(fn f -> Path.basename(Path.dirname(f)) in @non_guide_dirs end)
    |> Enum.sort()
  end

  @doc """
  Every place defined in an Elixir seed module, paired with its owner.

  Delegates to `Ethos.Seeds.Catalog.places_owned/0`. The list of modules lives
  in `lib/` rather than here because `Mix.Tasks.Ethos.BarePlaces` needs it too
  and cannot reach test support — see that module's docs for what a second
  private copy of the list cost.
  """
  defdelegate code_places, to: Ethos.Seeds.Catalog, as: :places_owned

  @doc """
  Every code-defined guide's published data, paired with its owner.

  The counterpart to `code_places/0`, and it did not exist until a banned
  phrase was found in `Ethos.Seeds.YankeeStadiumGuide` that every corpus gate
  had passed over: the walks read JSON seed files and code *places* modules,
  so thirty-seven guide modules' intros, section bodies, FAQ answers and entry
  notes were outside every one of them.
  """
  defdelegate code_guides, to: Ethos.Seeds.Catalog, as: :guides_owned

  @doc """
  Every roster path mapped to its ancestry trail — root-first, the node itself
  last — as maps carrying `:path`, `:kind` and `:name`.

  Read from `priv/seed_data/destination_tree.json`, not from the database, so
  the corpus gates that are `ExUnit.Case` rather than `DataCase` can resolve
  the `destination_path` a seed file now carries in place of the town/state
  pair it used to. Feed a trail to `Ethos.Destinations.legacy_geo_from_trail/1`
  to get the triple the loaders derive from the same ancestry.
  """
  def destination_trails do
    by_path =
      Map.new(Ethos.Seeds.DestinationTree.load!(), fn n ->
        {n["path"], %{path: n["path"], kind: n["kind"], name: n["name"]}}
      end)

    Map.new(by_path, fn {path, _node} ->
      trail =
        path
        |> String.split("/")
        |> Enum.scan([], fn seg, acc -> acc ++ [seg] end)
        |> Enum.map(&Enum.join(&1, "/"))
        |> Enum.map(&by_path[&1])
        |> Enum.reject(&is_nil/1)

      {path, trail}
    end)
  end

  @fixture_ancestors ~w(
    united-states
    united-states/connecticut
    united-states/connecticut/windham-county
    united-states/new-york
    united-states/new-york/new-york-city
    united-states/new-york/new-york-city/manhattan
  )

  @fixture_nodes [
    %{
      path: "united-states/connecticut/windham-county/townville",
      name: "Townville",
      kind: "town",
      intro: "A fixture town."
    },
    %{
      path: "united-states/new-york/new-york-city/manhattan/testville",
      name: "Testville",
      kind: "neighborhood",
      intro: "A fixture neighborhood."
    },
    %{
      path: "united-states/new-york/new-york-city/manhattan/refville",
      name: "Refville",
      kind: "neighborhood",
      intro: "A fixture neighborhood."
    }
  ]

  @doc """
  Seeds the make-believe nodes the seed-data fixtures under
  `test/support/fixtures/seed_data/` name, plus the real ancestors they hang
  from.

  Townville, Testville and Refville have no business in
  `priv/seed_data/destination_tree.json`, but the loaders resolve every
  `destination_path` against the `destinations` table and raise on a miss, so
  the fixtures need rows. They are filed under Windham County and Manhattan
  because what the fixture tests read back is the state and county derived from
  that ancestry.

  Six ancestors rather than the whole 678-node roster, because these are
  controller tests that seed one fixture file each and the roster would be
  seeded per test. The ancestors' names and kinds are read out of the roster
  instead of restated here, so a renamed borough cannot leave the fixtures
  asserting a name production no longer uses.

  They are also written in the roster's own order — shallowest first, roster
  order within a tier — which is the order `DestinationTree.upsert_all!/0`
  writes in. Two async tests that both touch `destinations` then take their row
  locks in one consistent global order and can only wait on each other, never
  deadlock; seeding these six in a private order of their own produced exactly
  that deadlock.
  """
  def seed_fixture_destinations! do
    wanted = MapSet.new(@fixture_ancestors)

    ancestors =
      Ethos.Seeds.DestinationTree.load!()
      |> Enum.filter(&MapSet.member?(wanted, &1["path"]))
      |> Enum.sort_by(&(&1["path"] |> String.split("/") |> length()))

    assert length(ancestors) == MapSet.size(wanted),
           "the roster no longer holds every ancestor the seed-data fixtures hang from: " <>
             inspect(MapSet.difference(wanted, MapSet.new(ancestors, & &1["path"])))

    for node <- ancestors do
      upsert_node!(%{
        path: node["path"],
        name: node["name"],
        kind: node["kind"],
        intro: node["intro"]
      })
    end

    Enum.each(@fixture_nodes, &upsert_node!/1)
    :ok
  end

  @doc """
  Seeds every roster node the Elixir seed modules name, plus their ancestors.

  `Places.upsert_place!/1` and `GuideRunner.upsert!/2` resolve a
  `destination_path` against the `destinations` table and raise on a miss, so a
  test that calls `SomePlaces.upsert_all!/0` needs rows first. The paths come
  from `Ethos.Seeds.Catalog` rather than being listed here, so a module that
  moves to a different node is followed automatically instead of failing in
  every test that seeds it.

  Roughly fifty nodes rather than the whole roster, because the callers are
  per-module tests that would otherwise seed every row in it. Written
  shallowest first, roster order within a tier — the order
  `DestinationTree.upsert_all!/0` writes in — so two async tests take their row
  locks in one consistent global order and can only wait on each other, never
  deadlock. `seed_destinations_for!/1` narrows it further, and is what a
  single-module test should call.
  """
  def seed_code_destinations!, do: seed_destination_paths!(code_destination_paths())

  @doc """
  `seed_code_destinations!/0` narrowed to the nodes some modules name.

  Takes place modules, guide modules or both. Prefer it over the whole-corpus
  form in a per-module test: three rows instead of fifty is faster, and it keeps
  the transaction — and so the window in which another async test can collide on
  a shared ancestor row — as short as the test's actual precondition.
  """
  def seed_destinations_for!(modules) when is_list(modules) do
    paths = for mod <- modules, path <- module_destination_paths(mod), uniq: true, do: path

    assert paths != [],
           "#{inspect(modules)} name no destination node, so this seeds nothing and every " <>
             "loader call after it raises"

    seed_destination_paths!(paths)
  end

  defp module_destination_paths(mod) do
    # `function_exported?/3` answers false for a module that has not been loaded
    # yet, and under lazy loading that is most of them: without this the
    # `cond` below fell through to `[]`, seeded nothing, and the caller's very
    # next loader call raised — intermittently, depending on what else in the
    # run happened to have loaded the module first.
    {:module, ^mod} = Code.ensure_loaded(mod)

    cond do
      function_exported?(mod, :places, 0) ->
        for p <- mod.places(), path = p[:destination_path], do: path

      function_exported?(mod, :data, 0) ->
        case Map.get(mod.data(), :destination_path) do
          nil -> []
          path -> [path]
        end

      true ->
        []
    end
  end

  @doc """
  Seeds the roster nodes at these paths, plus every ancestor of each.

  The general form behind `seed_code_destinations!/0` and
  `seed_destinations_for!/1`, for a test that names a node directly rather than
  through a seed module — a controller test exercising one destination hub, say.
  Nodes are written shallowest first, the order
  `DestinationTree.upsert_all!/0` writes in, so two async tests take their row
  locks in one consistent global order and can only wait on each other.
  """
  def seed_destination_paths!(paths) when is_list(paths) do
    wanted =
      for path <- paths,
          segments = String.split(path, "/"),
          n <- 1..length(segments),
          into: MapSet.new(),
          do: segments |> Enum.take(n) |> Enum.join("/")

    nodes =
      Ethos.Seeds.DestinationTree.load!()
      |> Enum.filter(&MapSet.member?(wanted, &1["path"]))
      |> Enum.sort_by(&(&1["path"] |> String.split("/") |> length()))

    assert length(nodes) == MapSet.size(wanted),
           "the roster is missing nodes the code seed modules name: " <>
             inspect(MapSet.difference(wanted, MapSet.new(nodes, & &1["path"])))

    for node <- nodes do
      upsert_node!(%{
        path: node["path"],
        name: node["name"],
        kind: node["kind"],
        intro: node["intro"]
      })
    end

    :ok
  end

  @doc """
  Every `destination_path` named by an Elixir place or guide module.

  `Ethos.Seeds.RomeGuide` hand-rolls its own upsert and names no node, so it
  contributes nothing; every other module must, and a module that named none
  would simply be absent here — which is why
  `ballpark_seed_data_test.exs` asserts the paths exist rather than trusting
  this list to be complete.
  """
  def code_destination_paths do
    places = for {p, _owner} <- code_places(), path = p[:destination_path], do: path
    guides = for {d, _owner} <- code_guides(), path = Map.get(d, :destination_path), do: path

    (places ++ guides) |> Enum.uniq() |> Enum.sort()
  end

  defp upsert_node!(attrs) do
    parent_path = attrs.path |> String.split("/") |> Enum.drop(-1) |> Enum.join("/")
    parent = parent_path != "" && Ethos.Destinations.get_by_path(parent_path)

    Ethos.Destinations.upsert_destination!(Map.put(attrs, :parent_id, if(parent, do: parent.id)))
  end

  @doc """
  Asserts each place slug is defined exactly once across the whole corpus:
  every `priv/seed_data/*/*.json` file plus every code-defined places module.
  """
  def assert_place_slugs_globally_unique! do
    json_owned =
      for f <- all_seed_files(),
          p <- DataGuide.load!(f)["places"],
          # Directory-qualified: two destinations may hold the same basename,
          # which would otherwise hide a genuine cross-destination collision.
          do: {p["slug"], Path.join(Path.basename(Path.dirname(f)), Path.basename(f))}

    code_owned =
      for {p, owner} <- code_places(), do: {p.slug, Path.basename(owner.seed_file)}

    dups =
      (json_owned ++ code_owned)
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
      # length/1, not uniq — two places sharing a slug inside ONE file collide too.
      |> Enum.filter(fn {_slug, owners} -> length(owners) > 1 end)

    assert dups == [], "place slugs with multiple owners: #{inspect(dups)}"
  end
end
