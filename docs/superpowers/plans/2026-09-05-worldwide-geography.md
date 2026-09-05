# Worldwide Geography Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the fixed `state`/`county`/`town` columns on guides and places with a variable-depth destination tree, so each corpus is modelled at its true depth and hub URLs become full ancestry paths.

**Architecture:** Grow the existing `destinations` table (already a unique-`path` node table) with `parent_id`, `kind`, `position`, `legacy_paths`. Guides and places gain `destination_id`. The legacy columns stay authoritative and backfilled until every call site has moved, then drop. Hub routing collapses to one glob route resolving a node by path, with 301s from the old shapes.

**Tech Stack:** Elixir 1.x, Phoenix 1.7.14, Ecto/Postgres, ExUnit.

**Spec:** `docs/superpowers/specs/2026-09-05-worldwide-geography-design.md`

## Global Constraints

- Phoenix 1.7.14. No AI or network calls in shipped code.
- **Every test command in this worktree MUST set `MIX_TEST_PARTITION=wwgeo`.** Other live worktrees share the `ethos_test` database and one has migrated it with a `users.username` column absent here; without the partition the suite reports ~333 phantom failures.
- Baseline is **746 tests, 0 failures, 4 excluded**. The suite is green before and after every task.
- `mix format` clean before every commit.
- Place slugs stay globally unique across all seed sources.
- Photo paths and licensing rules are untouched by this project.
- No content is added, removed or reworded. Seed edits are geo keys only.
- Destination `kind` vocabulary, used verbatim everywhere: `country`, `region`, `county`, `city`, `borough`, `town`, `neighborhood`.

## Corpus inventory (what the migration must cover)

| Source | Count | Current `state` / `county` / `town` |
| --- | --- | --- |
| `priv/seed_data/connecticut/*.json` | 165 | Connecticut / X County / town |
| `priv/seed_data/manhattan/*.json` | 38 | New York / Manhattan / neighborhood |
| `priv/seed_data/brooklyn/*.json` | 69 | New York / Brooklyn / neighborhood |
| `priv/seed_data/queens/*.json` | 21 | New York / Queens / neighborhood |
| `priv/seed_data/bronx/*.json` | 13 | New York / Bronx / neighborhood |
| `priv/seed_data/san_francisco/*.json` | 23 | California / San Francisco / neighborhood |
| `priv/seed_data/rome/*.json` | 31 | Italy / Rome / rione |
| `priv/seed_data/london/*.json` | 33 | England / London / borough or town |
| `lib/ethos/seeds/*_places.ex` + `*_guide.ex` | 31 modules | 20 regions incl. Ontario, District of Columbia |
| `priv/seed_data/destinations/*.json` | 13 | hub prose, keyed by path |

393 JSON guide/place files + 31 code modules.

---

### Task 1: Deepen destination paths and add the tree columns

**Files:**
- Create: `priv/repo/migrations/20260905120000_add_tree_to_destinations.exs`
- Modify: `lib/ethos/destinations/destination.ex`
- Test: `test/ethos/destinations_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces: `Destination` schema with `parent_id :: integer | nil`, `kind :: String.t() | nil`, `slug :: String.t()`, `position :: integer`, `legacy_paths :: [String.t()]`. `Destination.kinds/0` returns the seven-kind vocabulary. `Destination.changeset/2` derives `slug` from the last path segment.

- [ ] **Step 1: Write the failing tests**

Append to `test/ethos/destinations_test.exs`:

```elixir
  test "accepts a path deeper than two segments and derives its slug" do
    d =
      Destinations.upsert_destination!(%{
        path: "united-states/new-york/new-york-city/manhattan/alphabet-city",
        name: "Alphabet City",
        intro: "Loisaida's community gardens.",
        kind: "neighborhood"
      })

    assert d.slug == "alphabet-city"
    assert d.kind == "neighborhood"
    assert d.position == 0
    assert d.legacy_paths == []
  end

  test "rejects a kind outside the vocabulary" do
    assert_raise Ecto.InvalidChangesetError, fn ->
      Destinations.upsert_destination!(%{
        path: "atlantis",
        name: "Atlantis",
        intro: "Not a real tier.",
        kind: "planet"
      })
    end
  end

  test "kinds/0 is the seven-tier vocabulary" do
    assert Ethos.Destinations.Destination.kinds() ==
             ~w(country region county city borough town neighborhood)
  end
```

- [ ] **Step 2: Run the tests to verify they fail**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos/destinations_test.exs`
Expected: FAIL — the five-segment path violates `@path_format`, and `kind`/`slug` are not fields.

- [ ] **Step 3: Write the migration**

```elixir
defmodule Ethos.Repo.Migrations.AddTreeToDestinations do
  use Ecto.Migration

  # `kind` is nullable here and tightened to NOT NULL in the final cleanup
  # migration, once the roster has given every row one. Backfilling it with a
  # default would write a tier that is wrong for most rows.
  def change do
    alter table(:destinations) do
      add :parent_id, references(:destinations, on_delete: :restrict)
      add :kind, :string
      add :slug, :string
      add :position, :integer, null: false, default: 0
      add :legacy_paths, {:array, :string}, null: false, default: []
    end

    create index(:destinations, [:parent_id])
    create index(:destinations, [:legacy_paths], using: :gin)

    create constraint(:destinations, :destinations_kind_check,
             check:
               "kind is null or kind in ('country','region','county','city','borough','town','neighborhood')"
           )
  end
end
```

- [ ] **Step 4: Update the schema**

In `lib/ethos/destinations/destination.ex`, replace the `@path_format` module attribute, the `schema` block and `changeset/2`:

```elixir
  # Any number of slug segments — the tree is variable-depth, from two tiers
  # (a city-state) to five (a neighborhood inside a borough inside a city).
  @path_format ~r{^[a-z0-9]+(-[a-z0-9]+)*(/[a-z0-9]+(-[a-z0-9]+)*)*$}

  @kinds ~w(country region county city borough town neighborhood)

  def kinds, do: @kinds

  schema "destinations" do
    field :path, :string
    field :slug, :string
    field :kind, :string
    field :name, :string
    field :intro, :string
    field :photos, {:array, :map}, default: []
    field :position, :integer, default: 0
    field :legacy_paths, {:array, :string}, default: []

    belongs_to :parent, __MODULE__
    has_many :children, __MODULE__, foreign_key: :parent_id

    timestamps(type: :utc_datetime)
  end

  def changeset(destination, attrs) do
    destination
    |> cast(attrs, [:path, :name, :intro, :photos, :kind, :parent_id, :position, :legacy_paths])
    |> validate_required([:path, :name, :intro])
    |> validate_format(:path, @path_format)
    |> validate_inclusion(:kind, @kinds)
    |> put_slug()
    |> unique_constraint(:path)
  end

  # The slug is the last path segment, never authored separately — two sources
  # for one fact is how they drift.
  defp put_slug(changeset) do
    case get_field(changeset, :path) do
      nil -> changeset
      path -> put_change(changeset, :slug, path |> String.split("/") |> List.last())
    end
  end
```

Note `validate_inclusion/3` passes when the field is absent, so existing rows without a `kind` still validate.

- [ ] **Step 5: Run the migration and the tests**

Run: `MIX_TEST_PARTITION=wwgeo MIX_ENV=test mix ecto.migrate && MIX_TEST_PARTITION=wwgeo mix test test/ethos/destinations_test.exs`
Expected: PASS.

- [ ] **Step 6: Run the full suite**

Run: `MIX_TEST_PARTITION=wwgeo mix test`
Expected: 746+ tests, 0 failures.

- [ ] **Step 7: Commit**

```bash
mix format
git add priv/repo/migrations/20260905120000_add_tree_to_destinations.exs lib/ethos/destinations/destination.ex test/ethos/destinations_test.exs
git commit -m "feat: give destinations a parent, a kind and unlimited path depth"
```

---

### Task 2: Ancestry API on the Destinations context

**Files:**
- Modify: `lib/ethos/destinations.ex`
- Test: `test/ethos/destinations_test.exs`

**Interfaces:**
- Consumes: `Destination` schema from Task 1.
- Produces:
  - `Destinations.roots/0 :: [Destination.t()]`
  - `Destinations.children(Destination.t()) :: [Destination.t()]`
  - `Destinations.ancestors(Destination.t()) :: [Destination.t()]` — root first, excludes self
  - `Destinations.get_by_legacy_path(String.t()) :: Destination.t() | nil`
  - `Destinations.descendant_paths(Destination.t()) :: [String.t()]`

- [ ] **Step 1: Write the failing tests**

Append to `test/ethos/destinations_test.exs`:

```elixir
  describe "ancestry" do
    setup do
      nodes =
        for {path, kind, name} <- [
              {"united-states", "country", "United States"},
              {"united-states/new-york", "region", "New York"},
              {"united-states/new-york/new-york-city", "city", "New York City"},
              {"united-states/new-york/new-york-city/manhattan", "borough", "Manhattan"},
              {"italy", "country", "Italy"}
            ],
            into: %{} do
          parent_path = path |> String.split("/") |> Enum.drop(-1) |> Enum.join("/")

          parent =
            if parent_path == "", do: nil, else: Destinations.get_by_path(parent_path)

          d =
            Destinations.upsert_destination!(%{
              path: path,
              name: name,
              kind: kind,
              intro: "#{name}.",
              parent_id: parent && parent.id
            })

          {path, d}
        end

      %{nodes: nodes}
    end

    test "roots/0 returns only parentless nodes" do
      assert Enum.map(Destinations.roots(), & &1.path) == ["italy", "united-states"]
    end

    test "children/1 returns direct children only", %{nodes: nodes} do
      assert Enum.map(Destinations.children(nodes["united-states"]), & &1.path) ==
               ["united-states/new-york"]
    end

    test "ancestors/1 returns root first and excludes self", %{nodes: nodes} do
      manhattan = nodes["united-states/new-york/new-york-city/manhattan"]

      assert Enum.map(Destinations.ancestors(manhattan), & &1.path) == [
               "united-states",
               "united-states/new-york",
               "united-states/new-york/new-york-city"
             ]
    end

    test "ancestors/1 of a root is empty", %{nodes: nodes} do
      assert Destinations.ancestors(nodes["italy"]) == []
    end

    test "descendant_paths/1 excludes the node itself", %{nodes: nodes} do
      assert Destinations.descendant_paths(nodes["united-states/new-york"]) == [
               "united-states/new-york/new-york-city",
               "united-states/new-york/new-york-city/manhattan"
             ]
    end

    test "get_by_legacy_path/1 finds a moved node and nil otherwise", %{nodes: nodes} do
      Destinations.upsert_destination!(%{
        path: nodes["united-states/new-york/new-york-city/manhattan"].path,
        name: "Manhattan",
        intro: "Manhattan.",
        kind: "borough",
        legacy_paths: ["new-york/manhattan"]
      })

      assert %{path: "united-states/new-york/new-york-city/manhattan"} =
               Destinations.get_by_legacy_path("new-york/manhattan")

      assert Destinations.get_by_legacy_path("new-york/nowhere") == nil
    end
  end
```

- [ ] **Step 2: Run the tests to verify they fail**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos/destinations_test.exs`
Expected: FAIL with `UndefinedFunctionError` on `Destinations.roots/0`.

- [ ] **Step 3: Implement the ancestry functions**

Add to `lib/ethos/destinations.ex`:

```elixir
  def roots do
    Repo.all(
      from d in Destination,
        where: is_nil(d.parent_id),
        order_by: [asc: d.position, asc: d.name]
    )
  end

  def children(%Destination{id: id}) do
    Repo.all(
      from d in Destination,
        where: d.parent_id == ^id,
        order_by: [asc: d.position, asc: d.name]
    )
  end

  @doc """
  Ancestors root-first, excluding the node itself.

  Derived from the path's prefixes rather than by walking `parent_id`, so a
  five-deep node costs one query instead of four. `parent_id` and `path` are
  asserted to agree by the tree-integrity test, which is what makes the
  shortcut safe.
  """
  def ancestors(%Destination{path: path}) do
    prefixes =
      path
      |> String.split("/")
      |> Enum.drop(-1)
      |> Enum.scan([], fn seg, acc -> acc ++ [seg] end)
      |> Enum.map(&Enum.join(&1, "/"))

    case prefixes do
      [] ->
        []

      prefixes ->
        Repo.all(from d in Destination, where: d.path in ^prefixes)
        |> Enum.sort_by(&String.length(&1.path))
    end
  end

  def descendant_paths(%Destination{path: path}) do
    Repo.all(
      from d in Destination,
        where: like(d.path, ^(path <> "/%")),
        order_by: [asc: d.path],
        select: d.path
    )
  end

  def get_by_legacy_path(path) when is_binary(path) do
    Repo.one(from d in Destination, where: ^path in d.legacy_paths)
  end
```

- [ ] **Step 4: Run the tests to verify they pass**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos/destinations_test.exs`
Expected: PASS.

- [ ] **Step 5: Run the full suite and commit**

```bash
MIX_TEST_PARTITION=wwgeo mix test
mix format
git add lib/ethos/destinations.ex test/ethos/destinations_test.exs
git commit -m "feat: ancestry queries for the destination tree"
```

---

### Task 3: The tree roster and its loader

**Files:**
- Create: `priv/seed_data/destination_tree.json`
- Create: `lib/ethos/seeds/destination_tree.ex`
- Create: `test/ethos/seeds/destination_tree_test.exs`
- Modify: `lib/ethos/release.ex`

**Interfaces:**
- Consumes: `Destinations.upsert_destination!/1`, `Destinations.get_by_path/1`.
- Produces: `Ethos.Seeds.DestinationTree.upsert_all!/0 :: non_neg_integer()` (node count), `Ethos.Seeds.DestinationTree.load!/0 :: [map()]`, `Ethos.Release.seed_destination_tree/0`.

**The roster shape.** `tree.json` is a flat array; parentage is derived from `path`, so a node whose parent is absent is a hard error rather than a silent orphan. `intro` lives here only for nodes that have no file in `priv/seed_data/destinations/`; where a file exists it wins.

- [ ] **Step 1: Write the roster**

Create `priv/seed_data/destination_tree.json`. Every node the eight JSON corpora and the ballpark modules need. Interior nodes get a one-line `intro` (the loader requires one); leaf prose comes from the existing destination files.

```json
[
  {"path": "united-states", "kind": "country", "name": "United States",
   "intro": "Guides across the United States."},

  {"path": "united-states/connecticut", "kind": "region", "name": "Connecticut",
   "intro": "Connecticut, county by county.", "legacy_paths": ["connecticut"]},
  {"path": "united-states/connecticut/fairfield-county", "kind": "county",
   "name": "Fairfield County", "intro": "Fairfield County.",
   "legacy_paths": ["connecticut/fairfield-county"]},
  {"path": "united-states/connecticut/hartford-county", "kind": "county",
   "name": "Hartford County", "intro": "Hartford County.",
   "legacy_paths": ["connecticut/hartford-county"]},
  {"path": "united-states/connecticut/litchfield-county", "kind": "county",
   "name": "Litchfield County", "intro": "Litchfield County.",
   "legacy_paths": ["connecticut/litchfield-county"]},
  {"path": "united-states/connecticut/middlesex-county", "kind": "county",
   "name": "Middlesex County", "intro": "Middlesex County.",
   "legacy_paths": ["connecticut/middlesex-county"]},
  {"path": "united-states/connecticut/new-haven-county", "kind": "county",
   "name": "New Haven County", "intro": "New Haven County.",
   "legacy_paths": ["connecticut/new-haven-county"]},
  {"path": "united-states/connecticut/new-london-county", "kind": "county",
   "name": "New London County", "intro": "New London County.",
   "legacy_paths": ["connecticut/new-london-county"]},
  {"path": "united-states/connecticut/tolland-county", "kind": "county",
   "name": "Tolland County", "intro": "Tolland County.",
   "legacy_paths": ["connecticut/tolland-county"]},
  {"path": "united-states/connecticut/windham-county", "kind": "county",
   "name": "Windham County", "intro": "Windham County.",
   "legacy_paths": ["connecticut/windham-county"]},

  {"path": "united-states/new-york", "kind": "region", "name": "New York",
   "intro": "New York State.", "legacy_paths": ["new-york"]},
  {"path": "united-states/new-york/new-york-city", "kind": "city",
   "name": "New York City", "intro": "The five boroughs."},
  {"path": "united-states/new-york/new-york-city/manhattan", "kind": "borough",
   "name": "Manhattan", "intro": "Manhattan.", "legacy_paths": ["new-york/manhattan"]},
  {"path": "united-states/new-york/new-york-city/brooklyn", "kind": "borough",
   "name": "Brooklyn", "intro": "Brooklyn.", "legacy_paths": ["new-york/brooklyn"]},
  {"path": "united-states/new-york/new-york-city/queens", "kind": "borough",
   "name": "Queens", "intro": "Queens.", "legacy_paths": ["new-york/queens"]},
  {"path": "united-states/new-york/new-york-city/bronx", "kind": "borough",
   "name": "The Bronx", "intro": "The Bronx.", "legacy_paths": ["new-york/bronx"]},

  {"path": "united-states/california", "kind": "region", "name": "California",
   "intro": "California.", "legacy_paths": ["california"]},
  {"path": "united-states/california/san-francisco", "kind": "city",
   "name": "San Francisco", "intro": "San Francisco.",
   "legacy_paths": ["california/san-francisco"]},

  {"path": "italy", "kind": "country", "name": "Italy", "intro": "Italy."},
  {"path": "italy/lazio", "kind": "region", "name": "Lazio", "intro": "Lazio."},
  {"path": "italy/lazio/rome", "kind": "city", "name": "Rome", "intro": "Rome.",
   "legacy_paths": ["rome", "italy/rome"]},

  {"path": "united-kingdom", "kind": "country", "name": "United Kingdom",
   "intro": "The United Kingdom."},
  {"path": "united-kingdom/england", "kind": "region", "name": "England",
   "intro": "England.", "legacy_paths": ["england"]},
  {"path": "united-kingdom/england/london", "kind": "city", "name": "London",
   "intro": "London, borough by borough.", "legacy_paths": ["england/london"]},

  {"path": "canada", "kind": "country", "name": "Canada", "intro": "Canada."},
  {"path": "canada/ontario", "kind": "region", "name": "Ontario",
   "intro": "Ontario.", "legacy_paths": ["ontario"]},
  {"path": "canada/ontario/toronto", "kind": "city", "name": "Toronto",
   "intro": "Toronto."}
]
```

The leaf nodes (165 CT towns, 194 NYC neighborhoods, 23 SF neighborhoods, 31 rioni, 33 London boroughs) are **not** hand-written here — Task 5 appends them to this file from the corpora it rewrites, so the roster and the seed files cannot disagree.

- [ ] **Step 2: Write the failing test**

Create `test/ethos/seeds/destination_tree_test.exs`:

```elixir
defmodule Ethos.Seeds.DestinationTreeTest do
  use Ethos.DataCase, async: true

  alias Ethos.Destinations
  alias Ethos.Seeds.DestinationTree

  test "every roster node declares a known kind and a resolvable parent" do
    nodes = DestinationTree.load!()
    paths = MapSet.new(nodes, & &1["path"])

    for node <- nodes do
      assert node["kind"] in Ethos.Destinations.Destination.kinds(),
             "#{node["path"]} has kind #{inspect(node["kind"])}"

      parent = node["path"] |> String.split("/") |> Enum.drop(-1) |> Enum.join("/")

      if parent != "" do
        assert MapSet.member?(paths, parent),
               "#{node["path"]} has no parent node #{parent}"
      end
    end
  end

  test "roster paths are unique" do
    paths = Enum.map(DestinationTree.load!(), & &1["path"])
    assert length(paths) == length(Enum.uniq(paths))
  end

  test "legacy paths are unique across the whole roster" do
    legacy = Enum.flat_map(DestinationTree.load!(), &(&1["legacy_paths"] || []))
    assert length(legacy) == length(Enum.uniq(legacy))
  end

  test "upsert_all!/0 wires parent_id to match every path, idempotently" do
    count = DestinationTree.upsert_all!()
    assert count == length(DestinationTree.load!())

    manhattan = Destinations.get_by_path("united-states/new-york/new-york-city/manhattan")
    assert manhattan.kind == "borough"

    assert Enum.map(Destinations.ancestors(manhattan), & &1.path) == [
             "united-states",
             "united-states/new-york",
             "united-states/new-york/new-york-city"
           ]

    assert DestinationTree.upsert_all!() == count
    assert Destinations.get_by_path("united-states/new-york/new-york-city/manhattan").id ==
             manhattan.id
  end

  test "every seeded node's parent_id agrees with its path" do
    DestinationTree.upsert_all!()

    for d <- Destinations.list_destinations() do
      expected = d.path |> String.split("/") |> Enum.drop(-1) |> Enum.join("/")

      case d.parent_id do
        nil -> assert expected == "", "#{d.path} is a root but its path has a parent"
        id -> assert Ethos.Repo.get!(Destinations.Destination, id).path == expected
      end
    end
  end
end
```

- [ ] **Step 3: Run the test to verify it fails**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos/seeds/destination_tree_test.exs`
Expected: FAIL — `Ethos.Seeds.DestinationTree` does not exist.

- [ ] **Step 4: Implement the loader**

Create `lib/ethos/seeds/destination_tree.ex`:

```elixir
defmodule Ethos.Seeds.DestinationTree do
  @moduledoc """
  Loads `priv/seed_data/destination_tree.json` — the single declaration of the
  geographic hierarchy — into the `destinations` table.

  Parentage is derived from `path`, never authored, so the file cannot declare a
  node whose parent is missing without this loader raising. Nodes are seeded
  shallowest first so a parent always exists before its children.

  Idempotent: upserts by path, so re-running adopts new nodes and leaves
  existing ids alone.
  """

  alias Ethos.Destinations

  @roster "destination_tree.json"

  def path do
    Path.join([:code.priv_dir(:ethos) |> to_string(), "seed_data", @roster])
  end

  def load! do
    path = path()

    raw =
      case File.read(path) do
        {:ok, raw} -> raw
        {:error, reason} -> raise ArgumentError, "#{path}: cannot read (#{inspect(reason)})"
      end

    case Jason.decode(raw) do
      {:ok, nodes} when is_list(nodes) -> nodes
      {:ok, _} -> raise ArgumentError, "#{path}: expected a JSON array of nodes"
      {:error, err} -> raise ArgumentError, "#{path}: invalid JSON — #{Exception.message(err)}"
    end
  end

  def upsert_all! do
    nodes = load!()

    nodes
    |> Enum.sort_by(&depth(&1["path"]))
    |> Enum.each(fn node ->
      Destinations.upsert_destination!(%{
        "path" => node["path"],
        "name" => node["name"],
        "kind" => node["kind"],
        "intro" => node["intro"],
        "position" => node["position"] || 0,
        "legacy_paths" => node["legacy_paths"] || [],
        "parent_id" => parent_id!(node["path"])
      })
    end)

    length(nodes)
  end

  defp depth(path), do: path |> String.split("/") |> length()

  defp parent_id!(path) do
    case path |> String.split("/") |> Enum.drop(-1) |> Enum.join("/") do
      "" ->
        nil

      parent_path ->
        case Destinations.get_by_path(parent_path) do
          nil -> raise ArgumentError, "#{path}: parent #{parent_path} is not in the roster"
          parent -> parent.id
        end
    end
  end
end
```

- [ ] **Step 5: Run the test to verify it passes**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos/seeds/destination_tree_test.exs`
Expected: PASS.

- [ ] **Step 6: Expose it as a release task**

In `lib/ethos/release.ex`, add above `seed_destinations/0`:

```elixir
  def seed_destination_tree do
    load_app()
    Application.ensure_all_started(@app)
    count = Ethos.Seeds.DestinationTree.upsert_all!()
    IO.puts("Seeded #{count} destination nodes")
  end
```

- [ ] **Step 7: Run the full suite and commit**

```bash
MIX_TEST_PARTITION=wwgeo mix test
mix format
git add priv/seed_data/destination_tree.json lib/ethos/seeds/destination_tree.ex test/ethos/seeds/destination_tree_test.exs lib/ethos/release.ex
git commit -m "feat: declare the destination tree as data and seed it"
```

---

### Task 4: Attach guides and places to nodes

**Files:**
- Create: `priv/repo/migrations/20260905130000_add_destination_id_to_guides_and_places.exs`
- Modify: `lib/ethos/guides/guide.ex`, `lib/ethos/places/place.ex`
- Test: `test/ethos/guide_geo_test.exs`, `test/ethos/places_test.exs`

**Interfaces:**
- Consumes: `destinations` table from Task 1.
- Produces: `guides.destination_id`, `places.destination_id` (both nullable for now), castable through `Guide.changeset/2` and `Place.changeset/2`, with `belongs_to :destination` on both.

- [ ] **Step 1: Write the failing tests**

Append to `test/ethos/guide_geo_test.exs`:

```elixir
  test "a guide can be attached to a destination node" do
    node =
      Ethos.Destinations.upsert_destination!(%{
        path: "united-states/connecticut/litchfield-county/woodbury",
        name: "Woodbury",
        kind: "town",
        intro: "Woodbury."
      })

    user = Ethos.AccountsFixtures.user_fixture()

    {:ok, guide} =
      Ethos.Guides.create_guide(user, %{
        title: "Woodbury",
        destination: "Woodbury, Connecticut",
        destination_id: node.id
      })

    assert guide.destination_id == node.id
  end
```

Append to `test/ethos/places_test.exs`:

```elixir
  test "a place can be attached to a destination node" do
    node =
      Ethos.Destinations.upsert_destination!(%{
        path: "italy/lazio/rome/monti",
        name: "Monti",
        kind: "neighborhood",
        intro: "Monti."
      })

    place =
      Ethos.Places.upsert_place!(%{
        "slug" => "test-monti-place",
        "name" => "A place in Monti",
        "kind" => "restaurant",
        "town" => "Monti",
        "state" => "Italy",
        "county" => "Rome",
        "summary" => "A place.",
        "destination_id" => node.id
      })

    assert place.destination_id == node.id
  end
```

- [ ] **Step 2: Run the tests to verify they fail**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos/guide_geo_test.exs test/ethos/places_test.exs`
Expected: FAIL — no such field `destination_id`.

- [ ] **Step 3: Write the migration**

```elixir
defmodule Ethos.Repo.Migrations.AddDestinationIdToGuidesAndPlaces do
  use Ecto.Migration

  # Nullable on arrival. The seed corpora are rewritten to carry a
  # destination_path in a later commit, and only once every row has an id do
  # the legacy state/county/town columns come out.
  def change do
    alter table(:guides) do
      add :destination_id, references(:destinations, on_delete: :nilify_all)
    end

    alter table(:places) do
      add :destination_id, references(:destinations, on_delete: :nilify_all)
    end

    create index(:guides, [:destination_id])
    create index(:places, [:destination_id])
  end
end
```

- [ ] **Step 4: Add the field and association to both schemas**

In `lib/ethos/guides/guide.ex`, inside `schema "guides" do`, after `field :county_slug, :string`:

```elixir
    belongs_to :destination_node, Ethos.Destinations.Destination, foreign_key: :destination_id
```

and add `:destination_id` to the `cast/3` list in `changeset/2`:

```elixir
    |> cast(attrs, [:title, :destination, :starts_on, :ends_on, :state, :county, :destination_id])
```

In `lib/ethos/places/place.ex`, inside `schema "places" do`, after `field :status, :string, default: "open"`:

```elixir
    belongs_to :destination_node, Ethos.Destinations.Destination, foreign_key: :destination_id
```

and add `:destination_id` to the `cast/3` list in `changeset/2` (append it after `:status`).

The association is named `destination_node`, not `destination`, because `Guide` already has a `destination` string field.

- [ ] **Step 5: Run the tests to verify they pass**

Run: `MIX_TEST_PARTITION=wwgeo MIX_ENV=test mix ecto.migrate && MIX_TEST_PARTITION=wwgeo mix test test/ethos/guide_geo_test.exs test/ethos/places_test.exs`
Expected: PASS.

- [ ] **Step 6: Run the full suite and commit**

```bash
MIX_TEST_PARTITION=wwgeo mix test
mix format
git add priv/repo/migrations/20260905130000_add_destination_id_to_guides_and_places.exs lib/ethos/guides/guide.ex lib/ethos/places/place.ex test/ethos/guide_geo_test.exs test/ethos/places_test.exs
git commit -m "feat: let guides and places point at a destination node"
```

---

### Task 5: The corpus rewrite task

**Files:**
- Create: `lib/mix/tasks/ethos.migrate_geo.ex`
- Create: `test/mix/tasks/ethos_migrate_geo_test.exs`
- Modify: `priv/seed_data/destination_tree.json` (leaf nodes appended by the task)
- Modify: all 393 files under `priv/seed_data/{connecticut,manhattan,brooklyn,queens,bronx,san_francisco,rome,london}/`

**Interfaces:**
- Consumes: the roster from Task 3.
- Produces: `Mix.Tasks.Ethos.MigrateGeo.path_for(corpus :: String.t(), state :: String.t(), county :: String.t(), town :: String.t()) :: String.t()` — the pure mapping function, unit-testable without touching disk. Every rewritten seed file carries `"destination_path"` on its guide and on every place, and no longer carries `state`/`county`/`town`.

**The mapping rules.** One per corpus, derived from the inventory table. `slugify/1` is `Ethos.Guides.Guide.derive_destination_slug/1`.

| Corpus dir | Rule |
| --- | --- |
| `connecticut` | `united-states/connecticut/{slug(county)}/{slug(town)}` |
| `manhattan` | `united-states/new-york/new-york-city/manhattan/{slug(town)}` |
| `brooklyn` | `united-states/new-york/new-york-city/brooklyn/{slug(town)}` |
| `queens` | `united-states/new-york/new-york-city/queens/{slug(town)}` |
| `bronx` | `united-states/new-york/new-york-city/bronx/{slug(town)}` |
| `san_francisco` | `united-states/california/san-francisco/{slug(town)}` |
| `rome` | `italy/lazio/rome/{slug(town)}` |
| `london` | `united-kingdom/england/london/{slug(town)}` |

Guides have no `town` of their own; their leaf slug is `slug(first comma-segment of destination)` — "Alphabet City, New York" gives `alphabet-city`, matching their places' `town`.

**London is the one corpus where guide and place disagree**, and it must be handled explicitly. Its guides are boroughs ("Barking and Dagenham, England") while its places carry the town inside the borough (`"town": "Barking"`). Applying the flat rule would mint `united-kingdom/england/london/barking` as a *sibling* of `united-kingdom/england/london/barking-and-dagenham` — splitting a guide from its own places, so the borough hub would list zero places and `list_siblings/2` would never match across them.

The correct model nests the town under the borough:

```
united-kingdom/england/london                          city
  united-kingdom/england/london/barking-and-dagenham    borough   <- the guide
    united-kingdom/england/london/barking-and-dagenham/barking    town  <- its places
    united-kingdom/england/london/barking-and-dagenham/dagenham   town
```

A London place whose `town` equals its borough attaches to the borough node itself rather than minting a redundant child. This is exactly the variable depth the project exists to allow: London goes five deep where Connecticut goes four.

- [ ] **Step 1: Write the failing test for the mapping function**

Create `test/mix/tasks/ethos_migrate_geo_test.exs`:

```elixir
defmodule Mix.Tasks.Ethos.MigrateGeoTest do
  use ExUnit.Case, async: true

  alias Mix.Tasks.Ethos.MigrateGeo

  test "maps each corpus to its full ancestry path" do
    assert MigrateGeo.path_for("connecticut", "Connecticut", "Litchfield County", "Woodbury") ==
             "united-states/connecticut/litchfield-county/woodbury"

    assert MigrateGeo.path_for("manhattan", "New York", "Manhattan", "Alphabet City") ==
             "united-states/new-york/new-york-city/manhattan/alphabet-city"

    assert MigrateGeo.path_for("brooklyn", "New York", "Brooklyn", "Bath Beach") ==
             "united-states/new-york/new-york-city/brooklyn/bath-beach"

    assert MigrateGeo.path_for("queens", "New York", "Queens", "Astoria") ==
             "united-states/new-york/new-york-city/queens/astoria"

    assert MigrateGeo.path_for("bronx", "New York", "Bronx", "Belmont") ==
             "united-states/new-york/new-york-city/bronx/belmont"

    assert MigrateGeo.path_for("san_francisco", "California", "San Francisco", "The Castro") ==
             "united-states/california/san-francisco/the-castro"

    assert MigrateGeo.path_for("rome", "Italy", "Rome", "Ardeatino") ==
             "italy/lazio/rome/ardeatino"

    assert MigrateGeo.path_for("london", "England", "London", "Barking and Dagenham") ==
             "united-kingdom/england/london/barking-and-dagenham"
  end

  test "London places nest their town under the guide's borough" do
    borough = "united-kingdom/england/london/barking-and-dagenham"

    assert MigrateGeo.place_path_for("london", borough, "Barking") ==
             "united-kingdom/england/london/barking-and-dagenham/barking"

    # A place whose town is the borough attaches to the borough itself.
    assert MigrateGeo.place_path_for("london", borough, "Barking and Dagenham") == borough
  end

  test "every other corpus puts places on the same node as their guide" do
    node = "italy/lazio/rome/ardeatino"
    assert MigrateGeo.place_path_for("rome", node, "Ardeatino") == node
    assert MigrateGeo.place_path_for("connecticut", "x/y/z/andover", "Andover") == "x/y/z/andover"
  end

  test "raises on a corpus it has no rule for rather than guessing" do
    assert_raise ArgumentError, ~r/no mapping rule/, fn ->
      MigrateGeo.path_for("atlantis", "Atlantis", "Deep", "Trench")
    end
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/mix/tasks/ethos_migrate_geo_test.exs`
Expected: FAIL — module does not exist.

- [ ] **Step 3: Implement the task**

Create `lib/mix/tasks/ethos.migrate_geo.ex`:

```elixir
defmodule Mix.Tasks.Ethos.MigrateGeo do
  @shortdoc "Rewrites seed files from state/county/town to a destination_path"
  @moduledoc """
  One-shot, idempotent rewrite of the JSON seed corpora onto the destination
  tree.

  For every guide and place it computes the node path from the corpus and the
  existing `(state, county, town)` triple, writes `destination_path`, and drops
  the three legacy keys. Leaf nodes are appended to
  `priv/seed_data/destination_tree.json` so the roster and the corpora cannot
  disagree.

  A file whose triple matches no rule raises with its path. Guessing here would
  put a place in the wrong country and nothing downstream would notice.

      mix ethos.migrate_geo          # rewrite every corpus
      mix ethos.migrate_geo rome     # rewrite one
  """
  use Mix.Task

  alias Ethos.Guides.Guide

  @corpora ~w(connecticut manhattan brooklyn queens bronx san_francisco rome london)

  @leaf_kinds %{
    "connecticut" => "town",
    "manhattan" => "neighborhood",
    "brooklyn" => "neighborhood",
    "queens" => "neighborhood",
    "bronx" => "neighborhood",
    "san_francisco" => "neighborhood",
    "rome" => "neighborhood",
    "london" => "borough"
  }

  @impl Mix.Task
  def run(args) do
    corpora = if args == [], do: @corpora, else: args
    leaves = Enum.flat_map(corpora, &rewrite_corpus!/1)
    append_leaves!(leaves)
    Mix.shell().info("Rewrote #{length(corpora)} corpora, #{length(leaves)} leaf nodes")
  end

  @doc "The node path for one corpus's (state, county, town) triple."
  def path_for(corpus, state, county, town)

  def path_for("connecticut", _state, county, town),
    do: "united-states/connecticut/#{slug(county)}/#{slug(town)}"

  def path_for(borough, _state, _county, town) when borough in ~w(manhattan brooklyn queens bronx),
    do: "united-states/new-york/new-york-city/#{borough}/#{slug(town)}"

  def path_for("san_francisco", _state, _county, town),
    do: "united-states/california/san-francisco/#{slug(town)}"

  def path_for("rome", _state, _county, town), do: "italy/lazio/rome/#{slug(town)}"

  def path_for("london", _state, _county, town),
    do: "united-kingdom/england/london/#{slug(town)}"

  def path_for(corpus, _state, _county, _town),
    do: raise(ArgumentError, "no mapping rule for corpus #{inspect(corpus)}")

  @doc """
  The node path for one place, given its guide's node.

  Everywhere except London a place sits on the same node as its guide — the
  corpora were authored one file per neighborhood. London's files are one per
  borough with places in the towns inside it, so those nest a level deeper.
  """
  def place_path_for("london", guide_path, town) do
    town_slug = slug(town)
    borough_slug = guide_path |> String.split("/") |> List.last()

    if town_slug == borough_slug,
      do: guide_path,
      else: "#{guide_path}/#{town_slug}"
  end

  def place_path_for(_corpus, guide_path, _town), do: guide_path

  defp slug(value), do: Guide.derive_destination_slug(value)

  defp depth(path), do: path |> String.split("/") |> length()

  defp rewrite_corpus!(corpus) do
    Path.join(["priv", "seed_data", corpus, "*.json"])
    |> Path.wildcard()
    |> Enum.sort()
    |> Enum.flat_map(&rewrite_file!(corpus, &1))
  end

  # Idempotent: a file that already carries destination_path is left alone.
  # Re-running after a partial rewrite, or over a corpus a concurrent worktree
  # already migrated, is a no-op rather than a crash on the missing triple.
  #
  # Decoding with `objects: :ordered_objects` is NOT optional. A plain
  # `Jason.decode!` returns bare maps, which are unordered, so re-encoding
  # reshuffles every key — measured at 692 of 700 lines changed on
  # rome/ardeatino.json. Across 393 files that makes the diff unreviewable and
  # the "no prose was touched" guarantee unverifiable. With ordered objects the
  # round-trip is byte-identical, and this rewrite touches ZERO non-geo lines.
  defp rewrite_file!(corpus, file) do
    data = file |> File.read!() |> Jason.decode!(objects: :ordered_objects)
    guide = data["guide"]

    if is_binary(guide["destination_path"]) do
      # Already migrated. The roster already holds its nodes, and the names
      # needed to rebuild them (`town`) are gone, so contribute nothing.
      []
    else
      guide_town = guide["destination"] |> String.split(",") |> List.first() |> String.trim()
      guide_path = path_for(corpus, guide["state"], guide["county"], guide_town)

      # Computed from the ORIGINAL objects, before the geo keys are dropped —
      # `town` is the only place a leaf node's display name is written down.
      place_leaves =
        Enum.map(data["places"], fn p ->
          {place_path_for(corpus, guide_path, p["town"]), p["town"]}
        end)

      new_guide = swap_geo(guide, ~w(state county), guide_path)

      new_places =
        data["places"]
        |> Enum.zip(place_leaves)
        |> Enum.map(fn {p, {path, _name}} -> swap_geo(p, ~w(state county town), path) end)

      rewritten = data |> oput("guide", new_guide) |> oput("places", new_places)
      File.write!(file, Jason.encode!(rewritten, pretty: true) <> "\n")

      leaves_from(corpus, guide_path, guide_town, place_leaves)
    end
  end

  # Drops the legacy geo keys and inserts `destination_path` at the index the
  # first of them occupied. Appending instead would add a trailing comma to the
  # preceding key, churning 84 extra lines per file for no reason.
  defp swap_geo(%Jason.OrderedObject{values: vs} = obj, drop_keys, path) do
    idx = Enum.find_index(vs, fn {k, _} -> k in drop_keys end)
    kept = Enum.reject(vs, fn {k, _} -> k in drop_keys end)
    %{obj | values: List.insert_at(kept, idx || length(kept), {"destination_path", path})}
  end

  defp oput(%Jason.OrderedObject{values: vs} = obj, key, value) do
    if List.keymember?(vs, key, 0) do
      %{obj | values: List.keyreplace(vs, key, 0, {key, value})}
    else
      %{obj | values: vs ++ [{key, value}]}
    end
  end

  # One roster entry per distinct node the file references. The guide's own
  # node takes the corpus kind; a place node deeper than the guide's is a town
  # inside it — only London produces those.
  defp leaves_from(corpus, guide_path, guide_name, place_leaves) do
    guide_kind = Map.fetch!(@leaf_kinds, corpus)
    guide_depth = depth(guide_path)

    [{guide_path, guide_name} | place_leaves]
    |> Enum.reject(fn {path, _} -> is_nil(path) end)
    |> Enum.uniq_by(fn {path, _} -> path end)
    |> Enum.map(fn {path, name} ->
      name = name || path |> String.split("/") |> List.last()
      kind = if depth(path) > guide_depth, do: "town", else: guide_kind
      %{"path" => path, "kind" => kind, "name" => name, "intro" => "#{name}."}
    end)
  end

  defp append_leaves!(leaves) do
    roster_file = Path.join(["priv", "seed_data", "destination_tree.json"])
    existing = roster_file |> File.read!() |> Jason.decode!(objects: :ordered_objects)
    have = MapSet.new(existing, & &1["path"])

    new =
      leaves
      |> Enum.uniq_by(& &1["path"])
      |> Enum.reject(&MapSet.member?(have, &1["path"]))
      |> Enum.sort_by(& &1["path"])

    File.write!(roster_file, Jason.encode!(existing ++ new, pretty: true) <> "\n")
  end
end
```

Note `leaf_name/2` reads `p["town"]` before the drop — so it is computed from `places` **before** `Map.drop`. Reorder inside `rewrite_file!/2` if the implementer finds otherwise; the test in Step 6 catches it.

- [ ] **Step 4: Run the mapping test to verify it passes**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/mix/tasks/ethos_migrate_geo_test.exs`
Expected: PASS.

- [ ] **Step 5: Run the rewrite**

Run: `mix ethos.migrate_geo`
Expected: `Rewrote 8 corpora, N leaf nodes`.

- [ ] **Step 6: Review the diff corpus by corpus**

```bash
git diff --stat priv/seed_data/
git diff priv/seed_data/rome/ | head -60
git diff priv/seed_data/connecticut/andover.json
```

Confirm: only `state`/`county`/`town` removed and `destination_path` added; no prose changed. `git diff --stat` should show 393 files plus the roster.

Then verify that mechanically, because eyeballing 393 files does not scale — every changed line must be a geo key:

```bash
git diff -U0 priv/seed_data/ \
  | grep -E '^[+-]' \
  | grep -vE '^(\+\+\+|---)' \
  | grep -vE '"(destination_path|state|county|town)"' \
  | head -20
```

Expected: **no output at all.** Any line printed is prose or structure the rewrite touched by accident, and the task must be fixed rather than committed. (Measured on `rome/ardeatino.json`: 42 lines added, 125 removed, zero non-geo lines.)

- [ ] **Step 7: Commit**

```bash
mix format
git add lib/mix/tasks/ethos.migrate_geo.ex test/mix/tasks/ethos_migrate_geo_test.exs priv/seed_data/
git commit -m "refactor: rewrite the seed corpora onto destination paths"
```

---

### Task 6: The code-module corpora

> **Execution order:** run this task AFTER Task 7. It depends on the
> `Places.upsert_place!/1` shim and the `GuideRunner` path resolution that
> Task 7 introduces; without them, removing `town:`/`state:`/`county:` from
> these modules fails `Place.changeset/2`'s `validate_required`.
>
> **Delete the safety clause you are standing on.** Task 7 added a third,
> nil-returning clause to `GuideRunner.destination_node/1` so that the 37
> code-seed guide modules — which had no `destination_path` yet — would not
> raise `FunctionClauseError` before this task ran. That clause is a silent
> catch-all: paired with `Map.get(data, :state)`, a guide module that misspells
> `destination_pth:` writes a nil state instead of failing loudly, and every
> module you touch in this task is a chance to misspell it.
>
> Once every code module carries a real `destination_path`, **remove that nil
> clause** so an unresolvable guide raises again, and confirm the suite is still
> green without it. Inheriting it would leave a permanent hole exactly where
> this task's typos would land.

**Files:**
- Modify: `lib/ethos/seeds/*_places.ex` (31 modules), `lib/ethos/seeds/*_guide.ex` ballpark and Connecticut guide modules, `lib/ethos/seeds/connecticut_places.ex`
- Modify: `priv/seed_data/destination_tree.json`
- Test: `test/ethos/seeds/ballpark_seed_data_test.exs`, `test/ethos/seeds/connecticut_places_test.exs`

**Interfaces:**
- Consumes: `path_for/4` conventions from Task 5 (the same path strings, written by hand here).
- Produces: every code-module place and guide map carries `destination_path:` and no longer carries `town:`/`state:`/`county:`.

The 31 ballpark modules span 20 regions including **Ontario** (Rogers Centre, Toronto) and **District of Columbia** (Nationals Park). Each `*_places.ex` has a single module attribute like `@boston %{town: "Boston", state: "Massachusetts", county: "Suffolk County"}`, so each module is a one-line change.

- [ ] **Step 1: Enumerate what must change**

```bash
grep -rn 'town: "' lib/ethos/seeds/*_places.ex
grep -rn 'state:\|county:' lib/ethos/seeds/*_guide.ex
```

Every distinct triple becomes exactly one node path, built by this rule:

```
{country-slug}/{region-slug}/{city-slug}
```

- `country` is `united-states` for all 20 regions **except** Ontario, which is `canada`. Toronto (Rogers Centre) is the only non-US ballpark.
- `region` is the slugified `state:` value as-is — `massachusetts`, `district-of-columbia`, `ontario`.
- `city` is the slugified `town:` value — `boston`, `washington`, `toronto`, `anaheim`.
- The county in the existing triple is **dropped**, not modelled. It was never used for ballparks and adding a county tier for 30 stadiums would invent geography to fill a slot.

Kinds: `country` for the two countries, `region` for each state/province, `city` for each ballpark city. Add all three tiers for every distinct triple the grep prints, plus their missing parents (`united-states` and `canada` already exist from Task 3; most regions do not).

District of Columbia is a region whose only child is the city `washington` — a two-name repetition that is correct, not a mistake.

The Connecticut places module already has nodes from Task 5; it needs no new roster entries.

- [ ] **Step 2: Write the failing test**

Add to `test/ethos/seeds/ballpark_seed_data_test.exs`:

```elixir
  test "every ballpark place and guide carries a destination_path in the roster" do
    roster = MapSet.new(Ethos.Seeds.DestinationTree.load!(), & &1["path"])

    for {mod, _region} <- Ethos.Seeds.Catalog.place_modules(),
        place <- mod.places() do
      assert is_binary(place[:destination_path]),
             "#{inspect(mod)} place #{place[:slug]} has no destination_path"

      assert MapSet.member?(roster, place[:destination_path]),
             "#{inspect(mod)} references unknown node #{place[:destination_path]}"

      refute Map.has_key?(place, :town), "#{inspect(mod)} still carries a town"
    end
  end
```

- [ ] **Step 3: Run it to verify it fails**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos/seeds/ballpark_seed_data_test.exs`
Expected: FAIL — places still carry `:town` and no `:destination_path`.

- [ ] **Step 4: Rewrite the modules**

For each `*_places.ex`, replace the geo attribute. Example, `lib/ethos/seeds/fenway_park_places.ex:61`:

```elixir
  @boston %{destination_path: "united-states/massachusetts/boston"}
```

For each ballpark `*_guide.ex`, replace `state:`/`county:` with `destination_path:`. Example, `lib/ethos/seeds/fenway_park_guide.ex:48-50`:

```elixir
      destination: "Boston, Massachusetts",
      destination_path: "united-states/massachusetts/boston",
```

Update the module doc on line 5 to name the node rather than the two columns.

`connecticut_places.ex` and the five Connecticut guide modules take the same treatment, pointing at the `united-states/connecticut/{county}/{town}` nodes Task 5 already added to the roster.

- [ ] **Step 5: Run the tests to verify they pass**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos/seeds/`
Expected: PASS.

- [ ] **Step 6: Commit**

```bash
mix format
git add lib/ethos/seeds/ priv/seed_data/destination_tree.json test/ethos/seeds/
git commit -m "refactor: move the ballpark and Connecticut modules onto destination paths"
```

---

### Task 7: Loaders resolve paths, and the seed gate

**Files:**
- Modify: `lib/ethos/seeds/data_guide.ex`, `lib/ethos/seeds/guide_runner.ex`, `lib/ethos/places.ex`, `lib/ethos/release.ex`
- Create: `test/ethos/seeds/destination_path_gate_test.exs`
- Test: `test/ethos/seeds/data_guide_test.exs`

**Interfaces:**
- Consumes: `destination_path` on seed data, `Destinations.get_by_path/1`, `destination_id` from Task 4.
- Produces: `DataGuide.upsert_guide!/2` and `Places.upsert_place!/1` set `destination_id`; both raise `ArgumentError` naming the file and path when a node is missing. `Ethos.Release.seed_destination_tree/0` runs before every corpus seeder.

- [ ] **Step 1: Write the failing gate test**

Create `test/ethos/seeds/destination_path_gate_test.exs`:

```elixir
defmodule Ethos.Seeds.DestinationPathGateTest do
  use ExUnit.Case, async: true

  @corpora ~w(connecticut manhattan brooklyn queens bronx san_francisco rome london)

  setup_all do
    roster = MapSet.new(Ethos.Seeds.DestinationTree.load!(), & &1["path"])
    %{roster: roster}
  end

  test "every seed file's guide and places resolve to a roster node", %{roster: roster} do
    for corpus <- @corpora,
        file <- Path.wildcard(Path.join(["priv", "seed_data", corpus, "*.json"])) do
      data = file |> File.read!() |> Jason.decode!()

      guide_path = data["guide"]["destination_path"]
      assert is_binary(guide_path), "#{file}: guide has no destination_path"
      assert MapSet.member?(roster, guide_path), "#{file}: unknown node #{guide_path}"

      for p <- data["places"] do
        assert is_binary(p["destination_path"]), "#{file}: place #{p["slug"]} has no path"

        assert MapSet.member?(roster, p["destination_path"]),
               "#{file}: place #{p["slug"]} references unknown node #{p["destination_path"]}"
      end
    end
  end

  test "no seed file still carries the legacy triple" do
    for corpus <- @corpora,
        file <- Path.wildcard(Path.join(["priv", "seed_data", corpus, "*.json"])) do
      data = file |> File.read!() |> Jason.decode!()

      refute Map.has_key?(data["guide"], "state"), "#{file}: guide still has state"
      refute Map.has_key?(data["guide"], "county"), "#{file}: guide still has county"

      for p <- data["places"] do
        for key <- ~w(state county town) do
          refute Map.has_key?(p, key), "#{file}: place #{p["slug"]} still has #{key}"
        end
      end
    end
  end
end
```

- [ ] **Step 2: Run it to verify it fails**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos/seeds/destination_path_gate_test.exs`
Expected: PASS if Task 5 ran cleanly — this test is a regression guard, not a red-green driver. If it fails, Task 5's rewrite missed files; fix those before continuing.

- [ ] **Step 3: Teach the loaders to resolve paths**

In `lib/ethos/seeds/data_guide.ex`, change `@required_guide_keys` and add resolution:

```elixir
  @required_guide_keys ~w(slug title destination destination_path intro)
```

In `upsert_guide!/2`, replace the `state`/`county` entries in `runner_data` with:

```elixir
      destination_id: resolve_node!(path, g["destination_path"]),
```

In `upsert_places!/1`, map each place through the resolver:

```elixir
  def upsert_places!(path) do
    data = load!(path)

    Enum.map(data["places"], fn p ->
      node = resolve_node!(path, p["destination_path"])

      p
      |> Map.put("destination_id", node.id)
      |> Map.delete("destination_path")
      |> Places.upsert_place!()
    end)
  end

  defp resolve_node!(file, nil),
    do: raise(ArgumentError, "#{file}: missing destination_path")

  defp resolve_node!(file, node_path) do
    case Ethos.Destinations.get_by_path(node_path) do
      nil -> raise ArgumentError, "#{file}: unknown destination node #{node_path}"
      node -> node
    end
  end
```

In `lib/ethos/seeds/guide_runner.ex`, `upsert!/2` currently passes `"state"` and `"county"` into `Guide.changeset/2` in both `find_or_insert_guide!/2` and the transaction body. Replace both with `"destination_id" => destination_id(data)`, where:

```elixir
  # Code-module guides (the ballparks, the Connecticut five) carry a
  # :destination_path; JSON guides arrive already resolved to an id. Accept
  # either, so both seeding routes share one runner.
  defp destination_id(%{destination_id: id}) when is_integer(id), do: id

  defp destination_id(%{destination_path: path}) when is_binary(path) do
    case Ethos.Destinations.get_by_path(path) do
      nil -> raise ArgumentError, "unknown destination node #{path}"
      node -> node.id
    end
  end
```

- [ ] **Step 3b: Add the transitional legacy-geo shim**

`Place.changeset/2` requires `town`, `state` and `county`, and Tasks 8-11 still query the legacy columns. Until Task 12 removes both, they are derived from the node so re-seeding keeps them truthful rather than nulling them.

**The derivation lives in `Places.upsert_place!/1`, not in the JSON loader** — the 31 code modules (`ConnecticutPlaces`, the ballpark `*_places.ex`) call `upsert_place!/1` directly and would otherwise fail `validate_required` the moment Task 6 removes their `town:`/`state:`/`county:` keys. One shim at the single insertion point covers every caller.

In `lib/ethos/places.ex`:

```elixir
  def upsert_place!(attrs) do
    attrs = attrs |> normalize_keys() |> put_legacy_geo()
    slug = attrs["slug"]

    case Repo.get_by(Place, slug: slug) do
      nil -> %Place{}
      place -> place
    end
    |> Place.changeset(attrs)
    |> Repo.insert_or_update!()
  end

  defp normalize_keys(attrs), do: Map.new(attrs, fn {k, v} -> {to_string(k), v} end)

  # Transitional: derives town/state/county from the destination node while
  # those columns still have readers. Removed with the columns in Task 12.
  # A caller that already supplied them (none, after Task 6) keeps its values.
  defp put_legacy_geo(%{"destination_id" => id} = attrs) when not is_nil(id) do
    if Map.has_key?(attrs, "town") do
      attrs
    else
      node = Repo.get!(Ethos.Destinations.Destination, id)
      Map.merge(attrs, Ethos.Destinations.legacy_geo(node))
    end
  end

  defp put_legacy_geo(%{"destination_path" => path} = attrs) when is_binary(path) do
    node =
      Ethos.Destinations.get_by_path(path) ||
        raise ArgumentError, "unknown destination node #{path}"

    attrs
    |> Map.delete("destination_path")
    |> Map.put("destination_id", node.id)
    |> Map.merge(Ethos.Destinations.legacy_geo(node))
  end

  defp put_legacy_geo(attrs), do: attrs
```

Accepting `destination_path` here is what lets the code modules in Task 6 name a node without resolving it themselves.

Add to `lib/ethos/destinations.ex`:

```elixir
  @doc """
  The legacy `town`/`state`/`county` triple for a node, derived from its
  ancestry.

  Transitional. Tasks 8-11 move each reader onto `destination_id`, and the
  final migration drops the columns and this function with them. It exists so
  that re-seeding during the transition writes the same values the corpora
  used to carry, rather than nulls that would fail `Place.changeset/2`.

  The tiers map by position from the leaf: the node itself is the town, its
  nearest `county`-or-`borough`-or-`city` ancestor is the county, and its
  nearest `region` ancestor is the state.
  """
  def legacy_geo(%Destination{} = node) do
    trail = ancestors(node) ++ [node]

    %{
      "town" => node.name,
      "county" => nearest(trail, ~w(county borough city)) || node.name,
      "state" => nearest(trail, ~w(region)) || nearest(trail, ~w(country)) || node.name
    }
  end

  defp nearest(trail, kinds) do
    trail
    |> Enum.reverse()
    |> Enum.find_value(fn d -> if d.kind in kinds, do: d.name end)
  end
```

Add a test in `test/ethos/destinations_test.exs` asserting the Rome case reproduces what the corpus used to carry:

```elixir
  test "legacy_geo/1 reproduces the triple a corpus used to carry" do
    Ethos.Seeds.DestinationTree.upsert_all!()

    monti =
      Destinations.upsert_destination!(%{
        path: "italy/lazio/rome/monti",
        name: "Monti",
        kind: "neighborhood",
        intro: "Monti."
      })

    assert Destinations.legacy_geo(monti) == %{
             "town" => "Monti",
             "county" => "Rome",
             "state" => "Lazio"
           }
  end
```

Note this returns `"Lazio"` where the old Rome corpus carried `"Italy"` — the old value was the bug this project exists to fix. Any test asserting `state == "Italy"` for a Rome place is asserting the defect and should be updated to the node path.

- [ ] **Step 4: Seed the tree before every corpus**

In `lib/ethos/release.ex`, at the top of `seed_directory/2` and `seed_region/2`, add:

```elixir
    Ethos.Seeds.DestinationTree.upsert_all!()
```

so no corpus can be seeded against an absent tree.

- [ ] **Step 5: Run the suite**

Run: `MIX_TEST_PARTITION=wwgeo mix test`
Expected: 0 failures. The legacy columns are still written, now derived from the node by the Step 3b shim, so every existing geo query and test keeps working. The one class of test that must change is any asserting a Rome place's `state == "Italy"` or a London place's `state == "England"` — the shim now returns `"Lazio"` and `"England"` respectively, because it reads the corrected tree. Update those to assert the node path.

- [ ] **Step 6: Commit**

```bash
mix format
git add lib/ethos/seeds/data_guide.ex lib/ethos/seeds/guide_runner.ex lib/ethos/release.ex test/ethos/seeds/
git commit -m "feat: resolve seed destination paths to nodes at load time"
```

---

### Task 8: Serve hubs from the tree

**Files:**
- Modify: `lib/ethos_web/router.ex:26-28`, `lib/ethos_web/controllers/destination_controller.ex`
- Create: `lib/ethos_web/controllers/destination_html/node.html.heex`
- Delete: `lib/ethos_web/controllers/destination_html/show.html.heex`, `state.html.heex`, `county.html.heex`
- Modify: `lib/ethos/guides.ex`
- Test: `test/ethos_web/controllers/destination_controller_test.exs`, `test/ethos_web/controllers/hub_pages_test.exs`

**Interfaces:**
- Consumes: `Destinations.roots/0`, `children/1`, `ancestors/1`, `get_by_path/1`.
- Produces: `Guides.list_published_guides_for_node(node_id :: integer) :: [Guide.t()]`; routes `GET /destinations` and `GET /destinations/*path`; one `node.html.heex` rendering children, guides and prose.

- [ ] **Step 1: Write the failing controller tests**

Replace the body of `test/ethos_web/controllers/destination_controller_test.exs` with tests covering three depths:

```elixir
  test "a country hub lists its regions", %{conn: conn} do
    seed_tree()
    conn = get(conn, ~p"/destinations/united-states")
    assert html_response(conn, 200) =~ "Connecticut"
  end

  test "a county hub lists its towns", %{conn: conn} do
    seed_tree()
    conn = get(conn, ~p"/destinations/united-states/connecticut/litchfield-county")
    assert html_response(conn, 200) =~ "Litchfield County"
  end

  test "a five-deep neighborhood hub renders", %{conn: conn} do
    seed_tree()

    conn =
      get(conn, ~p"/destinations/united-states/new-york/new-york-city/manhattan/alphabet-city")

    assert html_response(conn, 200) =~ "Alphabet City"
  end

  test "an unknown path is a 404", %{conn: conn} do
    seed_tree()
    conn = get(conn, ~p"/destinations/atlantis/deep/trench")
    assert html_response(conn, 404)
  end
```

Add a `seed_tree/0` helper in the test that calls `Ethos.Seeds.DestinationTree.upsert_all!()`.

- [ ] **Step 2: Run to verify they fail**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos_web/controllers/destination_controller_test.exs`
Expected: FAIL — the glob route does not exist.

- [ ] **Step 3: Collapse the routes**

In `lib/ethos_web/router.ex`, replace lines 26-28 with:

```elixir
    get "/destinations", DestinationController, :index
    get "/destinations/*path", DestinationController, :show
```

- [ ] **Step 4: Add the node query**

In `lib/ethos/guides.ex`:

```elixir
  def list_published_guides_for_node(node_id) do
    Repo.all(
      from g in Guide,
        where: g.status == "published" and g.destination_id == ^node_id,
        order_by: [desc: g.view_count, desc: g.id]
    )
  end
```

- [ ] **Step 5: Rewrite the controller**

`show/2` takes the glob, joins it, and renders one template:

```elixir
  def show(conn, %{"path" => segments}) do
    path = Enum.join(segments, "/")

    case Destinations.get_by_path(path) do
      nil -> redirect_or_404(conn, path)
      node -> render_node(conn, node)
    end
  end

  defp render_node(conn, node) do
    children = Destinations.children(node)
    ancestors = Destinations.ancestors(node)
    guides = Guides.list_published_guides_for_node(node.id)

    render(conn, :node,
      node: node,
      children: children,
      ancestors: ancestors,
      guides: guides,
      page_title: "#{node.name} travel guides",
      page_meta_description:
        "Travel guides for #{node.name} — history, sites, restaurants, and places to stay.",
      page_canonical: url(~p"/destinations/#{node.path}"),
      json_ld: [collection_ld("#{node.name} travel guides", url(~p"/destinations/#{node.path}")), node_breadcrumb(node, ancestors)]
    )
  end
```

`index/2` becomes:

```elixir
  def index(conn, _params) do
    render(conn, :index,
      countries: Destinations.roots(),
      collections: Ethos.Collections.list_published(),
      page_title: "Destinations",
      page_meta_description:
        "Real trip guides by destination — places, verdicts, and tips from travelers who went.",
      page_canonical: url(~p"/destinations"),
      json_ld: [destinations_breadcrumb()]
    )
  end
```

`redirect_or_404/2` and `node_breadcrumb/2` land in Task 9 and Task 10 respectively; stub `redirect_or_404/2` as a 404 for now:

```elixir
  defp redirect_or_404(conn, _path) do
    conn |> put_status(:not_found) |> put_view(EthosWeb.ErrorHTML) |> render(:"404")
  end
```

and `node_breadcrumb/2` as the existing `destinations_breadcrumb/0` value.

- [ ] **Step 6: Write the node template**

Create `lib/ethos_web/controllers/destination_html/node.html.heex`:

```heex
<div class="mx-auto max-w-2xl px-4 py-10">
  <nav :if={@ancestors != []} class="text-sm text-zinc-500">
    <span :for={a <- @ancestors}>
      <.link navigate={~p"/destinations/#{a.path}"} class="underline">{a.name}</.link>
      <span aria-hidden="true">/</span>
    </span>
  </nav>

  <header class="mt-2">
    <h1 class="text-3xl font-bold">{@node.name}</h1>
  </header>

  <section :if={@node.intro} class="mt-4 prose">
    {EthosWeb.Markdown.to_html(@node.intro)}
  </section>

  <section :if={@children != []} class="mt-6">
    <h2 class="font-semibold">In {@node.name}</h2>
    <ul class="mt-3 space-y-2">
      <li :for={c <- @children}>
        <.link navigate={~p"/destinations/#{c.path}"} class="underline">{c.name}</.link>
      </li>
    </ul>
  </section>

  <ul :if={@guides != []} class="mt-8 space-y-3">
    <li :for={g <- @guides}>
      <.link navigate={~p"/g/#{g.slug}"} class="flex items-center justify-between rounded-lg border p-4 hover:bg-zinc-50">
        <span class="font-semibold">{g.title}</span>
      </.link>
    </li>
  </ul>
</div>
```

Check `EthosWeb.Markdown` for the exact rendering helper name before using it — `grep -n "def " lib/ethos_web/markdown.ex` — and match what `show.html.heex` used for `intro` before deleting it.

- [ ] **Step 7: Rewrite the index template**

In `lib/ethos_web/controllers/destination_html/index.html.heex`, replace the "By state" section with "By country" over `@countries`, linking `~p"/destinations/#{c.path}"`, and delete the `@destinations` list at the bottom.

- [ ] **Step 8: Delete the three obsolete templates**

```bash
git rm lib/ethos_web/controllers/destination_html/show.html.heex lib/ethos_web/controllers/destination_html/state.html.heex lib/ethos_web/controllers/destination_html/county.html.heex
```

- [ ] **Step 9: Run the tests**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos_web/`
Expected: the destination and hub tests pass. Sitemap and SEO tests still fail — Task 10 fixes them.

- [ ] **Step 10: Commit**

```bash
mix format
git add lib/ethos_web/ lib/ethos/guides.ex test/ethos_web/
git commit -m "feat: serve destination hubs from the tree at any depth"
```

---

### Task 9: Legacy URL redirects

**Files:**
- Modify: `lib/ethos_web/controllers/destination_controller.ex`
- Test: `test/ethos_web/controllers/destination_redirect_test.exs` (create)

**Interfaces:**
- Consumes: `Destinations.get_by_legacy_path/1` from Task 2, `legacy_paths` seeded in Task 3.
- Produces: `redirect_or_404/2` issuing a 301 to `~p"/destinations/#{node.path}"`.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/controllers/destination_redirect_test.exs`:

```elixir
defmodule EthosWeb.DestinationRedirectTest do
  use EthosWeb.ConnCase, async: true

  setup do
    Ethos.Seeds.DestinationTree.upsert_all!()
    :ok
  end

  @redirects [
    {"/destinations/connecticut", "/destinations/united-states/connecticut"},
    {"/destinations/connecticut/litchfield-county",
     "/destinations/united-states/connecticut/litchfield-county"},
    {"/destinations/new-york/manhattan",
     "/destinations/united-states/new-york/new-york-city/manhattan"},
    {"/destinations/new-york/brooklyn",
     "/destinations/united-states/new-york/new-york-city/brooklyn"},
    {"/destinations/rome", "/destinations/italy/lazio/rome"},
    {"/destinations/italy/rome", "/destinations/italy/lazio/rome"},
    {"/destinations/england/london", "/destinations/united-kingdom/england/london"}
  ]

  # `/destinations/italy` is deliberately NOT in that table: "italy" is a real
  # node now, so it renders the country hub listing Lazio. Exact-node
  # resolution runs before the legacy lookup, which is the correct order.
  test "a legacy path that is now a real node renders instead of redirecting", %{conn: conn} do
    conn = get(conn, ~p"/destinations/italy")
    assert html_response(conn, 200) =~ "Lazio"
  end

  test "every legacy path 301s to its new home", %{conn: conn} do
    for {from, to} <- @redirects do
      conn = get(build_conn(), from)
      assert redirected_to(conn, 301) == to, "#{from} did not 301 to #{to}"
    end

    _ = conn
  end

  test "an unknown path is still a 404", %{conn: conn} do
    conn = get(conn, ~p"/destinations/atlantis")
    assert html_response(conn, 404)
  end
end
```

- [ ] **Step 2: Run to verify it fails**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos_web/controllers/destination_redirect_test.exs`
Expected: FAIL — legacy paths currently 404.

- [ ] **Step 2b: Claim the orphaned ballpark county hubs**

Task 6 moved the 31 ballpark corpora onto `{country}/{region}/{city}` paths and deliberately did not model a county tier — inventing one for 30 stadiums would add geography the corpus does not carry. The consequence is that **thirty `/destinations/{state}/{county}` hub URLs lose their mapping**: `/destinations/illinois/cook-county` listed the Wrigley Field guide and now resolves to nothing, because that guide's county derives from its city node and reads `"Chicago"`.

Letting those 404 would contradict the choice this whole project was built on — a full hierarchy *with* 301s from every indexed URL. A hub that listed exactly one guide should redirect to the page that now lists that guide, which is the city node.

For each of the 30, add the old county-hub path to the **city node's** `legacy_paths` in `priv/seed_data/destination_tree.json`:

```json
{"path": "united-states/illinois/chicago", "kind": "city", "name": "Chicago",
 "legacy_paths": ["illinois/cook-county", "illinois/chicago"]}
```

Derive the list mechanically rather than by hand — read the pre-Task-6 county for each ballpark out of git history so no stadium is missed:

```bash
git show 0a3fb9a:lib/ethos/seeds/fenway_park_places.ex | grep -n 'town:\|state:\|county:'
```

Two honesty constraints on this step:

- A county hub is **not** the same place as a city hub, so this is a redirect, not an equivalence. Do not add the county name to the node, do not render it, and do not let the redirect imply the city and the county are one thing.
- Where a city legitimately has its own county node in the tree already (the Connecticut towns, the NYC boroughs), leave it alone — this step is only for the ballpark cities that have no county tier.

Add a test asserting `/destinations/illinois/cook-county` 301s to `/destinations/united-states/illinois/chicago`, and one more for a second stadium in a different state.

- [ ] **Step 3: Implement the redirect branch**

Replace the stub in `lib/ethos_web/controllers/destination_controller.ex`:

```elixir
  # Resolution order: an exact node renders; a path a node used to live at
  # 301s; anything else is a 404. Permanent, not temporary — these URLs are
  # indexed and the move is one-way.
  defp redirect_or_404(conn, path) do
    case Destinations.get_by_legacy_path(path) do
      nil ->
        conn |> put_status(:not_found) |> put_view(EthosWeb.ErrorHTML) |> render(:"404")

      node ->
        conn
        |> put_status(:moved_permanently)
        |> redirect(to: ~p"/destinations/#{node.path}")
    end
  end
```

- [ ] **Step 4: Run to verify it passes**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos_web/controllers/destination_redirect_test.exs`
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
mix format
git add lib/ethos_web/controllers/destination_controller.ex test/ethos_web/controllers/destination_redirect_test.exs
git commit -m "feat: 301 every legacy destination URL to its node"
```

---

### Task 10: Breadcrumbs, JSON-LD and the sitemap

**Files:**
- Modify: `lib/ethos_web/controllers/destination_controller.ex`, `lib/ethos_web/controllers/sitemap_controller.ex`, `lib/ethos_web/controllers/place_html/show.html.heex`
- Test: `test/ethos_web/controllers/sitemap_controller_test.exs`, `test/ethos_web/controllers/json_ld_parity_test.exs`, `test/ethos_web/controllers/seo_indexing_test.exs`

**Interfaces:**
- Consumes: `Destinations.list_destinations/0`, `ancestors/1`.
- Produces: `node_breadcrumb(node, ancestors)` emitting one `ListItem` per ancestor plus the node; sitemap emitting one URL per destination node and no legacy paths.

- [ ] **Step 1: Write the failing sitemap test**

Add to `test/ethos_web/controllers/sitemap_controller_test.exs`:

```elixir
  test "the sitemap lists every destination node and no legacy paths", %{conn: conn} do
    Ethos.Seeds.DestinationTree.upsert_all!()
    xml = conn |> get(~p"/sitemap.xml") |> response(200)

    assert xml =~ "/destinations/united-states/connecticut/litchfield-county"
    refute xml =~ "<loc>http://localhost:4002/destinations/connecticut</loc>"
  end
```

- [ ] **Step 2: Run to verify it fails**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos_web/controllers/sitemap_controller_test.exs`
Expected: FAIL — the sitemap still builds from `Guides.list_states/0`.

- [ ] **Step 3: Rewrite the sitemap's destination section**

In `lib/ethos_web/controllers/sitemap_controller.ex`, replace the three `Guides.list_destinations` / `list_states` / `list_counties_for_state` blocks (lines 21-31) with one pass over nodes:

```elixir
        Enum.map(Destinations.list_destinations(), fn d ->
          %{loc: url(~p"/destinations/#{d.path}"), lastmod: DateTime.to_date(d.updated_at)}
        end) ++
```

- [ ] **Step 4: Implement breadcrumbs over ancestry**

In `lib/ethos_web/controllers/destination_controller.ex`, replace the stubbed `node_breadcrumb/2`:

```elixir
  defp node_breadcrumb(node, ancestors) do
    trail = ancestors ++ [node]

    items =
      [
        %{"@type" => "ListItem", "position" => 1, "name" => "Ethos", "item" => url(~p"/")},
        %{
          "@type" => "ListItem",
          "position" => 2,
          "name" => "Destinations",
          "item" => url(~p"/destinations")
        }
      ] ++
        Enum.with_index(trail, 3)
        |> Enum.map(fn {d, position} ->
          %{
            "@type" => "ListItem",
            "position" => position,
            "name" => d.name,
            "item" => url(~p"/destinations/#{d.path}")
          }
        end)

    %{
      "@context" => "https://schema.org",
      "@type" => "BreadcrumbList",
      "itemListElement" => items
    }
  end
```

Delete the now-unused `state_breadcrumb/2`, `county_breadcrumb/4` and `destination_breadcrumb/2`.

- [ ] **Step 5: Fix the place page's geo links**

`lib/ethos_web/controllers/place_html/show.html.heex` links to `~p"/destinations/#{@place.state_slug}/#{@place.county_slug}"`. Change it to use the place's node path, passing `destination_node` preloaded in `PlaceController.show/2`.

- [ ] **Step 5b: Fix the place page's PostalAddress JSON-LD**

`lib/ethos_web/controllers/place_controller.ex:113` builds schema.org `PostalAddress` from `place.town` and `place.state` — the legacy columns. While the Task 7 shim still writes them the output is correct, but Task 12 drops those columns, at which point `addressCountry` silently falls back to `"US"` for every Rome and London place and `addressLocality` disappears corpus-wide. No existing test catches it.

Derive both from the node instead:

```elixir
  # addressLocality is the node's own name; addressCountry is its country
  # ancestor. Deriving them from the tree is what makes Rome resolve to IT and
  # London to GB rather than the old hardcoded US fallback.
  defp postal_address(%Place{destination_node: %Destination{} = node} = place) do
    ancestors = Destinations.ancestors(node)
    country = Enum.find(ancestors, &(&1.kind == "country"))

    %{
      "@type" => "PostalAddress",
      "streetAddress" => place.address,
      "addressLocality" => node.name,
      "addressCountry" => country_code(country)
    }
    |> Enum.reject(fn {_k, v} -> is_nil(v) end)
    |> Map.new()
  end
```

`country_code/1` maps the country node to its ISO 3166-1 alpha-2 code — `"United States"` → `"US"`, `"Italy"` → `"IT"`, `"United Kingdom"` → `"GB"`, `"Canada"` → `"CA"`. Those are the only four countries in the roster; raise on an unknown one rather than defaulting, so the next country added is a loud failure instead of a silent `"US"`.

Add tests asserting a Rome place's JSON-LD carries `addressCountry: "IT"` and `addressLocality` set to its rione, a London place's carries `"GB"`, and **a Vatican place's carries `"VA"`** — the Vatican is a root country node in the tree, so St Peter's must not inherit Italy's code. Those three assertions are the regression guard for the whole class of bug.

Verify by hand before committing that a Roman place's rendered JSON-LD does **not** say `"US"`. Between Task 7 and this step it does: the shim writes `state: "Lazio"`, which `@country_by_region` does not know. That is the live defect this step closes, and it is why no production re-seed may happen before this task lands.

**These tests must be production-faithful, and today's are not.** Task 7's `structured_data_test` helper `region_for/1` hands `postal_address/3` the string `"Italy"` for Roman places, while production hands it `place.state` — which the shim now sets to `"Lazio"`. So the suite passes on an input production never produces, and actively conceals the regression. When you rewrite these tests, drive them from **a seeded place row read back from the database**, not from a literal or from the seed JSON. A test that constructs its own input is testing itself; the whole point of this step is that the value production supplies is the one that used to be wrong.

- [ ] **Step 6: Run the web suite**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos_web/`
Expected: PASS.

- [ ] **Step 7: Commit**

```bash
mix format
git add lib/ethos_web/ test/ethos_web/
git commit -m "feat: breadcrumbs, JSON-LD and sitemap follow the tree"
```

---

### Task 11: Places queries move to node ancestry

**Files:**
- Modify: `lib/ethos/places.ex:37-60`, `lib/ethos/places.ex:128-151`, `lib/ethos/badges.ex`, `lib/ethos/visits.ex`
- Test: `test/ethos/places_test.exs`, `test/ethos/badges_test.exs`

**Interfaces:**
- Consumes: `places.destination_id`, `Destinations.descendant_paths/1`.
- Produces: `Places.list_places/1` accepting `{:destination_id, id}`; `Places.list_siblings/2` matching on `destination_id`; `Places.count_open_places_in_node(node_id)` replacing `count_open_places_in_county/2`.

- [ ] **Step 1: Write the failing test**

Add to `test/ethos/places_test.exs`:

```elixir
  test "siblings are places sharing a destination node" do
    node =
      Ethos.Destinations.upsert_destination!(%{
        path: "italy/lazio/rome/monti",
        name: "Monti",
        kind: "neighborhood",
        intro: "Monti."
      })

    other =
      Ethos.Destinations.upsert_destination!(%{
        path: "italy/lazio/rome/trastevere",
        name: "Trastevere",
        kind: "neighborhood",
        intro: "Trastevere."
      })

    a = place_in(node, "sibling-a", "A")
    b = place_in(node, "sibling-b", "B")
    _elsewhere = place_in(other, "sibling-c", "C")

    assert Enum.map(Ethos.Places.list_siblings(a), & &1.slug) == [b.slug]
  end
```

with a `place_in/3` helper building a valid place attached to the node.

- [ ] **Step 2: Run to verify it fails**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos/places_test.exs`
Expected: FAIL — `list_siblings/2` still matches on `town_slug`/`state_slug`.

- [ ] **Step 3: Rewrite the queries**

```elixir
  def list_siblings(place, opts \\ [])

  def list_siblings(%Place{destination_id: nil}, _opts), do: []

  def list_siblings(%Place{id: id, name: name, destination_id: destination_id}, opts) do
    limit = Keyword.get(opts, :limit, @sibling_limit)

    Repo.all(
      from p in Place,
        where: p.destination_id == ^destination_id and p.id != ^id and p.status == "open",
        order_by: [
          desc: fragment("(?, ?) > (?, ?)", p.name, p.id, ^name, ^id),
          asc: p.name,
          asc: p.id
        ],
        limit: ^limit
    )
  end

  def count_open_places_in_node(destination_id) do
    Repo.one(
      from p in Place,
        where: p.status == "open" and p.destination_id == ^destination_id,
        select: count(p.id)
    )
  end
```

In `list_places/1`, replace the `:town_slug`, `:county_slug` and `:state_slug` clauses with:

```elixir
      {:destination_id, v}, q -> where(q, [p], p.destination_id == ^v)
```

Update the `list_siblings/2` moduledoc: the two nil clauses become one, and the "wrong geography" warning it documents is now structurally impossible — a node is a single point in the tree, not a slug pair that can collide across states.

Update every caller found by `grep -rn "count_open_places_in_county\|town_slug\|county_slug\|state_slug" lib/`.

- [ ] **Step 4: Run the suite**

Run: `MIX_TEST_PARTITION=wwgeo mix test`
Expected: 0 failures.

- [ ] **Step 5: Commit**

```bash
mix format
git add lib/ethos/ test/ethos/
git commit -m "refactor: place queries key on the destination node"
```

---

### Task 12: Drop the legacy columns

**Files:**
- Create: `priv/repo/migrations/20260905140000_drop_legacy_geo_columns.exs`
- Modify: `lib/ethos/guides/guide.ex`, `lib/ethos/places/place.ex`, `lib/ethos/guides.ex`
- Test: full suite

**Interfaces:**
- Consumes: everything above.
- Produces: `guides` and `places` without `state`, `state_slug`, `county`, `county_slug`, `town`, `town_slug`; `destinations.kind` NOT NULL.

- [ ] **Step 1: Prove nothing reads the columns**

```bash
grep -rn "state_slug\|county_slug\|town_slug\|\.state\b\|\.county\b\|\.town\b" lib/ test/
```

Expected: no hits outside this migration. Any hit is a call site Task 8-11 missed — fix it before proceeding.

- [ ] **Step 2: Remove the dead query functions and the transitional shim**

Delete from `lib/ethos/guides.ex`: `list_destinations_without_state/0`, `list_states/0`, `list_counties_for_state/1`, `list_published_guides_for_state/1`, `list_published_guides_for_county/2`, `list_guides_shadowed_by_state/1`. Keep `list_destinations/0` only if the search index still uses it — check `lib/ethos/search.ex` first.

Delete `Ethos.Destinations.legacy_geo/1` and its private `nearest/2` (added in Task 7 Step 3b), and `put_legacy_geo/1` and its three clauses from `lib/ethos/places.ex` — keeping `normalize_keys/1` and the `destination_path` → `destination_id` resolution, which the code modules from Task 6 still rely on. Delete the `legacy_geo/1` test in `test/ethos/destinations_test.exs`. The shim exists only to keep the legacy columns truthful while they still have readers; this step is where it stops having a purpose.

- [ ] **Step 3: Write the migration**

```elixir
defmodule Ethos.Repo.Migrations.DropLegacyGeoColumns do
  use Ecto.Migration

  def change do
    # The FTS index reads places.town, so it is rebuilt without it. Guides' FTS
    # index does not reference any dropped column.
    execute "DROP INDEX places_fts_idx",
            "CREATE INDEX places_fts_idx ON places USING GIN (to_tsvector('english', coalesce(name,'') || ' ' || coalesce(town,'') || ' ' || coalesce(summary,'') || ' ' || coalesce(history,'')))"

    alter table(:guides) do
      remove :state, :string
      remove :state_slug, :string
      remove :county, :string
      remove :county_slug, :string
    end

    alter table(:places) do
      remove :town, :string
      remove :town_slug, :string
      remove :state, :string
      remove :state_slug, :string
      remove :county, :string
      remove :county_slug, :string
    end

    execute "CREATE INDEX places_fts_idx ON places USING GIN (to_tsvector('english', coalesce(name,'') || ' ' || coalesce(summary,'') || ' ' || coalesce(history,'')))",
            "DROP INDEX places_fts_idx"

    execute "ALTER TABLE destinations ALTER COLUMN kind SET NOT NULL",
            "ALTER TABLE destinations ALTER COLUMN kind DROP NOT NULL"
  end
end
```

- [ ] **Step 4: Strip the schemas**

Remove the six geo `field` declarations from `lib/ethos/places/place.ex`, the four from `lib/ethos/guides/guide.ex`, their entries in both `cast/3` lists and `validate_required/2`, and the `derive_geo_slugs/1` and `put_geo_slugs/1` private functions plus `derive_slug_for/3`. Keep `Guide.derive_destination_slug/1` — Task 5's mix task and `put_destination_slug/1` both use it.

- [ ] **Step 5: Run the full suite**

Run: `MIX_TEST_PARTITION=wwgeo MIX_ENV=test mix ecto.migrate && MIX_TEST_PARTITION=wwgeo mix test`
Expected: 0 failures.

- [ ] **Step 6: Verify search still works**

Run: `MIX_TEST_PARTITION=wwgeo mix test test/ethos/search_test.exs`
Expected: PASS — confirming the rebuilt FTS index covers what the tests query.

- [ ] **Step 7: Commit**

```bash
mix format
git add priv/repo/migrations/20260905140000_drop_legacy_geo_columns.exs lib/ethos/ test/
git commit -m "refactor: drop the state/county/town columns"
```

---

## Deployment

> **HARD ORDERING CONSTRAINT — Task 10 must land before any production re-seed.**
>
> Task 7's shim derives a place's legacy `state` from its **region** node, so a
> Roman place now carries `"Lazio"` where it used to carry `"Italy"`.
> `StructuredData.@country_by_region` is keyed on the old values
> (`%{"Italy" => "IT", "Vatican City" => "VA", "England" => "GB"}`), so `"Lazio"`
> misses the lookup and `addressCountry` falls through to the `"US"` default.
>
> Re-seeding production before Task 10 ships would therefore tell search engines
> that the Pantheon, the Sistine Chapel and all 1,250 Roman places are in the
> United States — the exact error `structured_data.ex:139-143` documents as the
> reason that lookup exists. No test catches it: every corpus gate reads the seed
> JSON, not the database.
>
> Task 10 Step 5b replaces the mechanism by deriving `addressCountry` from the
> node's country ancestor, which is immune to what the region is called.

After all twelve tasks are green on the branch:

```bash
fly deploy
fly ssh console -C "/app/bin/ethos eval 'Ethos.Release.seed_destination_tree()'"
fly ssh console -C "/app/bin/ethos eval 'Ethos.Release.seed_connecticut_expansion(~s[cryptcom@gmail.com])'"
# ...repeat per corpus seeder: seed_manhattan, seed_brooklyn, seed_queens,
#    seed_bronx, seed_san_francisco, seed_rome_zones, seed_london, seed_ballparks
fly ssh console -C "/app/bin/ethos eval 'Ethos.Release.seed_destinations()'"
fly ssh console -C "/app/bin/ethos eval 'Ethos.Release.seed_links()'"
```

Note the `~s[...]` sigil rather than quotes — `fly ssh console` strips quotes.

Verify live: a hub at each depth (`/destinations`, `/destinations/united-states`, `/destinations/united-states/connecticut/litchfield-county`, `/destinations/italy/lazio/rome/monti`), three 301s from the redirect table, a guide page, a place page's geo links, and `/sitemap.xml`. Then resubmit the sitemap per `docs/runbooks/google-search-console.md`.

## Notes for the executor

- **Never run `mix test` without `MIX_TEST_PARTITION=wwgeo`.** See Global Constraints.
- Four other worktrees are live. If a new corpus appears under `priv/seed_data/` mid-flight, add its rule to `path_for/4` and re-run `mix ethos.migrate_geo` — the task is idempotent, so re-running over already-migrated corpora is a no-op.
- Tasks 1-4 are additive and safe to land independently. Task 5 is the irreversible one; review its diff before committing.
