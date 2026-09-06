# Town adjacency and scenic routes — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Give every Connecticut town guide inbound links from its bordering towns, put the seven foliage routes on the homepage, and publish four state-designated scenic byways as collections.

**Architecture:** Adjacency is a published attribute of Connecticut's town-lines layer, not something derived from geometry — an offline mix task fetches it, gates it, and commits `priv/adjacency.json`; a release function writes one `nearby` edge per border through the existing link graph. The byways become ordinary `Collection` records, inheriting `/c/:slug`, structured data, the sitemap and homepage placement. Nothing here introduces a new page type or a new URL shape.

**Tech Stack:** Elixir 1.18.4, Phoenix 1.7.14, Ecto/Postgres, `req` for the offline fetch. No new dependencies.

**Spec:** `docs/superpowers/specs/2026-09-06-adjacency-and-scenic-routes-design.md`

## Global Constraints

- **No new dependencies.** `mix.exs` must be untouched.
- **Run every test with `MIX_TEST_PARTITION=_foliage`.** The default `ethos_test` database is shared with other worktrees and carries another branch's migrations. `ethos_test_foliage` is this branch's isolated database. Establish the baseline count before Task 1 and report it.
- **Run `mix format` only on files you touched.** Never bare `mix format` — it reformats unrelated files that are unclean on main under Elixir 1.18.4.
- **No new pages and no new routes.** Adjacency ships as links; byways are `Collection` records at the existing `/c/:slug`.
- **One stored edge per border, never two.** `Ethos.Links.links_for/2` unions outgoing and incoming edges — its moduledoc says "one stored edge connects both pages". Writing both directions lists every neighbour twice.
- **Nothing may raise on a missing guide.** A town whose guide is absent or unpublished is skipped with a log line. This is a link graph, not a correctness boundary.
- **Production runs a release with no Mix.** Anything needed after a deploy must exist as an `Ethos.Release` function. The previous branch shipped three hooks with no callable path.
- **Do not quote per-town mileage on any page.** The `BEGIN_POINT`/`END_POINT` milepoints are per-direction: the Merritt Parkway's segments sum to 74.5 miles because `15-N` and `15-S` are both present, while the parkway is about 37. Distances are excluded rather than halved-and-hoped.
- **Route names are ours, not the dataset's.** The layer has no name field. Each byway page says where the route data comes from and that the name is the common one.
- **Voice:** restrained and specific. No exclamation marks, no travel-blog register.

---

### Task 1: The adjacency dataset

Fetch Connecticut's town-lines layer offline, derive the border pairs, gate them, and commit the result. No database, no links yet.

**Files:**
- Create: `lib/ethos/adjacency.ex`
- Create: `lib/mix/tasks/ethos.adjacency.build.ex`
- Create: `test/ethos/adjacency_test.exs`
- Generate and commit: `priv/adjacency.json`

**Interfaces:**
- Consumes: nothing.
- Produces:
  - `Ethos.Adjacency.pairs_from_rows(rows :: [map]) :: %{String.t() => [String.t()]}` — pure; rows are ArcGIS attribute maps with `"TOWN_LEFT"` and `"TOWN_RIGHT"`
  - `Ethos.Adjacency.neighbours(town_slug) :: [String.t()]`
  - `Ethos.Adjacency.all() :: %{String.t() => [String.t()]}`
  - `Ethos.Adjacency.ordered_pairs() :: [{String.t(), String.t()}]` — each border once, alphabetically ordered

- [ ] **Step 1: Write the failing test**

Create `test/ethos/adjacency_test.exs`:

```elixir
defmodule Ethos.AdjacencyTest do
  use ExUnit.Case, async: true

  alias Ethos.Adjacency

  describe "pairs_from_rows/1" do
    test "builds a symmetric map from town-line rows" do
      rows = [
        %{"TOWN_LEFT" => "Avon", "TOWN_RIGHT" => "Canton"},
        %{"TOWN_LEFT" => "Avon", "TOWN_RIGHT" => "Simsbury"}
      ]

      assert %{"avon" => avon, "canton" => ["avon"], "simsbury" => ["avon"]} =
               Adjacency.pairs_from_rows(rows)

      assert Enum.sort(avon) == ["canton", "simsbury"]
    end

    test "ignores rows where either side is blank" do
      # A state-boundary segment has one side blank: the neighbour is
      # Massachusetts or New York, not another Connecticut town.
      rows = [
        %{"TOWN_LEFT" => " ", "TOWN_RIGHT" => "Salisbury"},
        %{"TOWN_LEFT" => "Salisbury", "TOWN_RIGHT" => ""}
      ]

      assert Adjacency.pairs_from_rows(rows) == %{}
    end

    test "ignores a town bordering itself" do
      rows = [%{"TOWN_LEFT" => "Avon", "TOWN_RIGHT" => "Avon"}]
      assert Adjacency.pairs_from_rows(rows) == %{}
    end

    test "deduplicates repeated segments between the same two towns" do
      # A border is many short line segments in the source, not one row.
      rows = List.duplicate(%{"TOWN_LEFT" => "Avon", "TOWN_RIGHT" => "Canton"}, 12)
      assert Adjacency.pairs_from_rows(rows) == %{"avon" => ["canton"], "canton" => ["avon"]}
    end

    test "slugifies town names" do
      rows = [%{"TOWN_LEFT" => "New Hartford", "TOWN_RIGHT" => "Barkhamsted"}]

      assert Adjacency.pairs_from_rows(rows) == %{
               "new-hartford" => ["barkhamsted"],
               "barkhamsted" => ["new-hartford"]
             }
    end
  end

  describe "all/0 and neighbours/1" do
    test "loads the committed dataset with every Connecticut town" do
      assert map_size(Adjacency.all()) == 169
    end

    test "Avon borders exactly its five real neighbours" do
      assert Enum.sort(Adjacency.neighbours("avon")) ==
               ["bloomfield", "burlington", "canton", "farmington", "simsbury"]
    end

    test "returns an empty list for an unknown town" do
      assert Adjacency.neighbours("nowhere") == []
    end

    test "is symmetric across the whole dataset" do
      all = Adjacency.all()

      for {town, neighbours} <- all, neighbour <- neighbours do
        assert town in Map.fetch!(all, neighbour),
               "#{town} lists #{neighbour} but not the reverse"
      end
    end

    test "no town borders itself" do
      for {town, neighbours} <- Adjacency.all() do
        refute town in neighbours
      end
    end

    test "every neighbour is a known town" do
      all = Adjacency.all()
      known = MapSet.new(Map.keys(all))

      for {_town, neighbours} <- all, n <- neighbours do
        assert MapSet.member?(known, n)
      end
    end
  end

  describe "ordered_pairs/0" do
    test "returns each border exactly once, alphabetically ordered" do
      pairs = Adjacency.ordered_pairs()

      assert length(pairs) == 446
      assert Enum.all?(pairs, fn {a, b} -> a < b end)
      assert length(Enum.uniq(pairs)) == length(pairs)
    end

    test "the pair count is half the directed edge count" do
      directed = Adjacency.all() |> Map.values() |> Enum.map(&length/1) |> Enum.sum()
      assert length(Adjacency.ordered_pairs()) == div(directed, 2)
    end
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `MIX_TEST_PARTITION=_foliage mix test test/ethos/adjacency_test.exs`
Expected: FAIL — `module Ethos.Adjacency is not available`

- [ ] **Step 3: Write the module**

Create `lib/ethos/adjacency.ex`:

```elixir
defmodule Ethos.Adjacency do
  @moduledoc """
  Which Connecticut towns border which.

  Not derived from polygon geometry: Connecticut publishes it. Every segment
  of the state's town-lines layer carries `TOWN_LEFT` and `TOWN_RIGHT`, so the
  adjacency is an attribute to be read rather than a computation to get wrong.

  The dataset is committed (`priv/adjacency.json`) and loaded once at boot,
  mirroring `Ethos.Foliage.Dataset`. The running application never calls
  ArcGIS.

  ## Borders are stored once, not twice

  `Ethos.Links.links_for/2` unions outgoing and incoming edges, so one stored
  edge already appears on both pages. `ordered_pairs/0` therefore returns each
  border once with the alphabetically smaller slug first — writing both
  directions would list every neighbour twice on every page.
  """

  @key {__MODULE__, :adjacency}

  def child_spec(_opts) do
    %{id: __MODULE__, start: {__MODULE__, :start_link, []}, type: :worker, restart: :temporary}
  end

  def start_link do
    load!()
    :ignore
  end

  def load! do
    :persistent_term.put(@key, read!())
    :ok
  rescue
    error ->
      # Boot must survive a missing or malformed file. The link builder is a
      # deploy-time step; an empty map writes no edges and takes nothing down.
      require Logger
      Logger.error("adjacency: could not load, no nearby links will be written: #{Exception.message(error)}")
      :persistent_term.put(@key, %{})
      :ok
  end

  @doc "The whole map: town slug to a sorted list of neighbouring town slugs."
  def all do
    :persistent_term.get(@key)
  rescue
    ArgumentError ->
      load!()
      :persistent_term.get(@key, %{})
  end

  @doc "Neighbouring town slugs, or an empty list for an unknown town."
  def neighbours(town_slug), do: Map.get(all(), town_slug, [])

  @doc """
  Every border exactly once, as `{smaller_slug, larger_slug}`.

  Alphabetical ordering makes the set stable, so re-running the link builder
  updates the same rows instead of adding their reverses.
  """
  def ordered_pairs do
    for {town, neighbours} <- all(), neighbour <- neighbours, town < neighbour do
      {town, neighbour}
    end
    |> Enum.sort()
  end

  @doc """
  Builds the adjacency map from raw town-line rows.

  A blank side means the segment is a state boundary — the neighbour is
  Massachusetts, New York or Rhode Island, not a Connecticut town.
  """
  def pairs_from_rows(rows) when is_list(rows) do
    rows
    |> Enum.reduce(%{}, fn row, acc ->
      left = clean(Map.get(row, "TOWN_LEFT"))
      right = clean(Map.get(row, "TOWN_RIGHT"))

      if left && right && left != right do
        acc
        |> Map.update(left, MapSet.new([right]), &MapSet.put(&1, right))
        |> Map.update(right, MapSet.new([left]), &MapSet.put(&1, left))
      else
        acc
      end
    end)
    |> Map.new(fn {town, set} -> {town, set |> MapSet.to_list() |> Enum.sort()} end)
  end

  defp clean(nil), do: nil

  defp clean(value) when is_binary(value) do
    trimmed = String.trim(value)

    if trimmed == "" or String.match?(trimmed, ~r/^\d+$/) do
      nil
    else
      slugify(trimmed)
    end
  end

  defp clean(_), do: nil

  defp slugify(name) do
    name
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9]+/, "-")
    |> String.trim("-")
  end

  defp read! do
    Path.join([:code.priv_dir(:ethos) |> to_string(), "adjacency.json"])
    |> File.read!()
    |> Jason.decode!()
  end
end
```

- [ ] **Step 4: Add the loader to the supervision tree**

In `lib/ethos/application.ex`, immediately after `Ethos.HouseAd`:

```elixir
      Ethos.Adjacency,
```

- [ ] **Step 5: Write the mix task**

Create `lib/mix/tasks/ethos.adjacency.build.ex`:

```elixir
defmodule Mix.Tasks.Ethos.Adjacency.Build do
  @shortdoc "Derives Connecticut town adjacency from the state's town-lines layer"

  @moduledoc """
  Writes `priv/adjacency.json` from Connecticut's published town-lines layer.
  Run on a developer machine; commit the output.

  The layer is `Connecticut_Towns_NoLabels/FeatureServer/0` (owner `deepgis`,
  CC0). Every segment carries `TOWN_LEFT` and `TOWN_RIGHT`, so adjacency is
  read rather than computed. The layer returns 1,431 rows and pages at 1,000,
  so the fetch must paginate — a single request silently returns two thirds of
  the state.
  """

  use Mix.Task

  @layer "https://services1.arcgis.com/FjPcSmEFuDYlIdKC/arcgis/rest/services/Connecticut_Towns_NoLabels/FeatureServer/0"
  @expected_towns 169
  @max_neighbours 12

  @impl Mix.Task
  def run(_args) do
    Application.ensure_all_started(:req)

    rows = fetch_all()
    Mix.shell().info("Fetched #{length(rows)} town-line rows.")

    adjacency = Ethos.Adjacency.pairs_from_rows(rows)
    validate!(adjacency)

    dir = Path.join(:code.priv_dir(:ethos) |> to_string(), "")
    File.write!(Path.join(dir, "adjacency.json"), Jason.encode_to_iodata!(adjacency, pretty: true))

    pairs = for {t, ns} <- adjacency, n <- ns, t < n, do: {t, n}
    Mix.shell().info("Wrote #{map_size(adjacency)} towns, #{length(pairs)} borders.")
  end

  defp fetch_all(offset \\ 0, acc \\ []) do
    params = %{
      "where" => "1=1",
      "outFields" => "TOWN_LEFT,TOWN_RIGHT",
      "returnGeometry" => "false",
      "resultOffset" => Integer.to_string(offset),
      "resultRecordCount" => "1000",
      "f" => "json"
    }

    body =
      case Req.post("#{@layer}/query", form: params, receive_timeout: 60_000, retry: :transient) do
        {:ok, %{status: 200, body: body}} when is_map(body) -> body
        other -> Mix.raise("town-lines query failed: #{inspect(other)}")
      end

    if body["error"], do: Mix.raise("ArcGIS error: #{inspect(body["error"])}")

    rows = Enum.map(body["features"] || [], & &1["attributes"])

    if length(rows) < 1000 do
      acc ++ rows
    else
      fetch_all(offset + 1000, acc ++ rows)
    end
  end

  defp validate!(adjacency) do
    if map_size(adjacency) != @expected_towns do
      Mix.raise("Expected #{@expected_towns} towns, got #{map_size(adjacency)}. Refusing to write.")
    end

    for {town, neighbours} <- adjacency do
      if town in neighbours, do: Mix.raise("#{town} borders itself")

      if length(neighbours) < 1 or length(neighbours) > @max_neighbours do
        Mix.raise("#{town} has #{length(neighbours)} neighbours, outside 1..#{@max_neighbours}")
      end

      for n <- neighbours do
        unless Map.has_key?(adjacency, n), do: Mix.raise("#{town} borders unknown town #{n}")
        unless town in Map.fetch!(adjacency, n), do: Mix.raise("#{town}/#{n} is not symmetric")
      end
    end

    Mix.shell().info("Adjacency is symmetric, self-free and complete.")
  end
end
```

- [ ] **Step 6: Run the build**

```bash
mix ethos.adjacency.build
```

Expected: `Fetched 1431 town-line rows.`, `Adjacency is symmetric, self-free and complete.`, `Wrote 169 towns, 446 borders.`

If the row count is 1,000 exactly, pagination is broken — a single page is the whole failure mode this task guards against. Report the actual numbers.

- [ ] **Step 7: Run the tests**

Run: `MIX_TEST_PARTITION=_foliage mix test test/ethos/adjacency_test.exs`
Expected: PASS, 13 tests

- [ ] **Step 8: Format and commit**

```bash
mix format lib/ethos/adjacency.ex lib/mix/tasks/ethos.adjacency.build.ex lib/ethos/application.ex test/ethos/adjacency_test.exs
git add lib/ethos/adjacency.ex lib/mix/tasks/ethos.adjacency.build.ex lib/ethos/application.ex test/ethos/adjacency_test.exs priv/adjacency.json
git commit -m "feat(adjacency): Connecticut town borders from the state's town-lines layer"
```

---

### Task 2: Nearby links and the release hook

**Files:**
- Create: `lib/ethos/adjacency/link_builder.ex`
- Modify: `lib/ethos/release.ex` (add `adjacency_links/0`)
- Create: `test/ethos/adjacency/link_builder_test.exs`

**Interfaces:**
- Consumes: `Ethos.Adjacency.ordered_pairs/0`, `Ethos.Foliage.Routes.guide_slug_for/2`, `Ethos.Links.upsert_link!/1`.
- Produces:
  - `Ethos.Adjacency.LinkBuilder.build!() :: :ok`
  - `Ethos.Release.adjacency_links/0`

**Three facts you need:**

1. `Ethos.Links.upsert_link!/1` takes `%{source: {:guide, slug}, target: {:guide, slug}, kind: String.t(), note: String.t() | nil}` and raises `ArgumentError` from its private `resolve!/1` when a slug names no guide. Rescue that and skip.
2. `Ethos.Foliage.Routes.guide_slug_for(town_slug, published_slugs_mapset)` returns the guide slug or `nil`, and carries the one Mansfield-to-Storrs alias. Reuse it; do not write a second resolver.
3. `ConnectedPages` already renders the `"nearby"` kind under a **"Nearby"** heading. No template change.

- [ ] **Step 1: Write the failing test**

Create `test/ethos/adjacency/link_builder_test.exs`:

```elixir
defmodule Ethos.Adjacency.LinkBuilderTest do
  use Ethos.DataCase, async: false

  import Ecto.Query
  import Ethos.GuidesFixtures

  alias Ethos.Adjacency.LinkBuilder
  alias Ethos.Links.Link
  alias Ethos.Repo

  defp ct_guide(town) do
    published_guide_fixture(%{
      title: town,
      destination: "#{town}, Connecticut",
      state: "Connecticut",
      county: "Hartford County"
    })
  end

  defp nearby_count do
    Repo.aggregate(from(l in Link, where: l.kind == "nearby"), :count)
  end

  test "writes one edge per border between guides that exist" do
    # Avon borders Canton and Simsbury among others. With only these three
    # seeded, exactly the borders among them should be written.
    for t <- ["Avon", "Canton", "Simsbury"], do: ct_guide(t)

    assert :ok = LinkBuilder.build!()
    assert nearby_count() > 0
  end

  test "does not write both directions of the same border" do
    # Ethos.Links.links_for/2 unions outgoing and incoming edges, so a second
    # row for the reverse would list every neighbour twice on both pages.
    for t <- ["Avon", "Canton"], do: ct_guide(t)
    :ok = LinkBuilder.build!()

    avon = Repo.get_by!(Ethos.Guides.Guide, slug: "avon-ct-travel-guide")
    canton = Repo.get_by!(Ethos.Guides.Guide, slug: "canton-ct-travel-guide")

    both =
      Repo.all(
        from l in Link,
          where:
            l.kind == "nearby" and
              ((l.source_id == ^avon.id and l.target_id == ^canton.id) or
                 (l.source_id == ^canton.id and l.target_id == ^avon.id))
      )

    assert length(both) == 1
  end

  test "is idempotent" do
    for t <- ["Avon", "Canton", "Simsbury"], do: ct_guide(t)

    :ok = LinkBuilder.build!()
    first = nearby_count()
    :ok = LinkBuilder.build!()

    assert nearby_count() == first
  end

  test "skips a border whose guide is missing without raising" do
    # Only one of the pair exists; the border must be skipped, not raised on.
    ct_guide("Avon")
    assert :ok = LinkBuilder.build!()
  end

  test "writes nothing at all when no Connecticut guides exist" do
    assert :ok = LinkBuilder.build!()
    assert nearby_count() == 0
  end

  test "the note names the relationship" do
    for t <- ["Avon", "Canton"], do: ct_guide(t)
    :ok = LinkBuilder.build!()

    link = Repo.one!(from l in Link, where: l.kind == "nearby", limit: 1)
    assert link.note =~ "border"
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `MIX_TEST_PARTITION=_foliage mix test test/ethos/adjacency/link_builder_test.exs`
Expected: FAIL — `module Ethos.Adjacency.LinkBuilder is not available`

- [ ] **Step 3: Write the link builder**

Create `lib/ethos/adjacency/link_builder.ex`:

```elixir
defmodule Ethos.Adjacency.LinkBuilder do
  @moduledoc """
  Writes a `nearby` edge between the guides of every pair of Connecticut towns
  that share a border.

  One edge per border, not per direction: `Ethos.Links.links_for/2` unions
  outgoing and incoming edges, so a stored edge already appears on both pages.
  `Ethos.Adjacency.ordered_pairs/0` supplies each border once with a stable
  ordering, which is also what makes re-running update rows rather than add
  their reverses.

  Skip-if-missing, like `Ethos.Foliage.LinkBuilder`: a town whose guide is
  unpublished is a corpus state, not a programming error.
  """

  require Logger

  import Ecto.Query

  alias Ethos.Adjacency
  alias Ethos.Foliage.Routes
  alias Ethos.Guides.Guide
  alias Ethos.Links
  alias Ethos.Repo

  def build! do
    published =
      Repo.all(from g in Guide, where: g.status == "published", select: g.slug) |> MapSet.new()

    {written, skipped} =
      Enum.reduce(Adjacency.ordered_pairs(), {0, 0}, fn {a, b}, {written, skipped} ->
        with slug_a when not is_nil(slug_a) <- Routes.guide_slug_for(a, published),
             slug_b when not is_nil(slug_b) <- Routes.guide_slug_for(b, published) do
          upsert(slug_a, slug_b)
          {written + 1, skipped}
        else
          _ -> {written, skipped + 1}
        end
      end)

    Logger.info("adjacency links: #{written} borders written, #{skipped} skipped")
    :ok
  end

  defp upsert(source, target) do
    Links.upsert_link!(%{
      source: {:guide, source},
      target: {:guide, target},
      kind: "nearby",
      note: "The two towns share a border"
    })
  rescue
    ArgumentError ->
      Logger.warning("adjacency links: skipped #{source} -> #{target}, guide missing")
      :ok
  end
end
```

- [ ] **Step 4: Add the release hook**

In `lib/ethos/release.ex`, after `foliage_links/0`:

```elixir
  @doc """
  Writes the town-adjacency `nearby` edges.

  Production runs a release, not Mix, so this is the only way to invoke the
  link builder after a deploy.
  """
  def adjacency_links do
    load_app()
    Application.ensure_all_started(@app)

    :ok = Ethos.Adjacency.LinkBuilder.build!()
  end
```

- [ ] **Step 5: Run the tests**

Run: `MIX_TEST_PARTITION=_foliage mix test test/ethos/adjacency/link_builder_test.exs`
Expected: PASS, 6 tests

- [ ] **Step 6: Verify against the real corpus**

```bash
MIX_ENV=dev mix run -e 'import Ecto.Query; before = Ethos.Repo.aggregate(from(l in Ethos.Links.Link, where: l.kind == "nearby"), :count); :ok = Ethos.Adjacency.LinkBuilder.build!(); after_ = Ethos.Repo.aggregate(from(l in Ethos.Links.Link, where: l.kind == "nearby"), :count); :ok = Ethos.Adjacency.LinkBuilder.build!(); again = Ethos.Repo.aggregate(from(l in Ethos.Links.Link, where: l.kind == "nearby"), :count); IO.puts(">>> before=#{before} after=#{after_} second-run=#{again}")'
```

Expected: `after_` close to 446 (a few borders may be skipped if a guide is unpublished), and `second-run` equal to `after_`. Report all three numbers.

- [ ] **Step 7: Confirm a guide page shows the block once**

```bash
MIX_ENV=dev mix run -e 'g = Ethos.Repo.get_by!(Ethos.Guides.Guide, slug: "avon-ct-travel-guide"); links = Ethos.Links.links_for("guide", g.id); nearby = Enum.filter(links, &(&1.kind == "nearby")); names = Enum.map(nearby, & &1.other.title) |> Enum.sort(); IO.puts(">>> #{length(nearby)} nearby: #{inspect(names)}")'
```

Expected: five entries, no duplicates. Report them.

- [ ] **Step 8: Format and commit**

```bash
mix format lib/ethos/adjacency/link_builder.ex lib/ethos/release.ex test/ethos/adjacency/link_builder_test.exs
git add lib/ethos/adjacency/link_builder.ex lib/ethos/release.ex test/ethos/adjacency/link_builder_test.exs
git commit -m "feat(adjacency): nearby links between bordering towns, with a release hook"
```

---

### Task 3: Four scenic byway collections

**Files:**
- Create: `lib/ethos/seeds/scenic_byways_collections.ex`
- Modify: `lib/ethos/release.ex:seed_collections/0` (add four modules to the list)
- Create: `test/ethos/seeds/scenic_byways_test.exs`

**Interfaces:**
- Consumes: `Ethos.Collections.upsert_collection!/1`, which takes `%{slug:, title:, intro:, published:, items: [%{guide_slug:, blurb:}]}` and raises `ArgumentError` on an unknown guide slug.
- Produces: `Ethos.Seeds.ScenicBywaysCollections.upsert_all!() :: [Ethos.Collections.Collection.t()]`

**Facts from the dataset, which the prose is built from:**

| Route | `LOCATE_NUM` | Designated | Status | Towns, in route order |
|---|---|---|---|---|
| Merritt Parkway | 15 | 1993 | National Scenic Byway | Greenwich, Stamford, New Canaan, Norwalk, Westport, Fairfield, Trumbull, Stratford |
| Route 169 | 54 | 1991 | National Scenic Byway | Woodstock, Pomfret, Brooklyn, Canterbury, Lisbon |
| Route 207 | 74 | 2022 | State scenic road | Hebron, Lebanon, Franklin, Sprague |
| Route 7 | 11 | 2002 | State scenic road | Sharon, Salisbury, Canaan |

A `blurb` is at most 255 characters — `CollectionItem`'s changeset enforces it, and its moduledoc records why. Every blurb below is inside that.

- [ ] **Step 1: Write the failing test**

Create `test/ethos/seeds/scenic_byways_test.exs`:

```elixir
defmodule Ethos.Seeds.ScenicBywaysTest do
  use Ethos.DataCase, async: false

  import Ethos.GuidesFixtures

  alias Ethos.Collections
  alias Ethos.Seeds.ScenicBywaysCollections

  # Listed explicitly rather than with ~w, because "New Canaan" contains a
  # space and the sigil would split it into two towns.
  @towns %{
    "merritt-parkway" => [
      "Greenwich",
      "Stamford",
      "New Canaan",
      "Norwalk",
      "Westport",
      "Fairfield",
      "Trumbull",
      "Stratford"
    ],
    "route-169" => ["Woodstock", "Pomfret", "Brooklyn", "Canterbury", "Lisbon"],
    "route-207" => ["Hebron", "Lebanon", "Franklin", "Sprague"],
    "route-7-in-the-northwest" => ["Sharon", "Salisbury", "Canaan"]
  }

  defp seed_towns do
    names = @towns |> Map.values() |> List.flatten() |> Enum.uniq()

    for name <- names do
      published_guide_fixture(%{
        title: name,
        destination: "#{name}, Connecticut",
        state: "Connecticut",
        county: "Fairfield County"
      })
    end
  end

  test "seeds four published collections" do
    seed_towns()
    collections = ScenicBywaysCollections.upsert_all!()

    assert length(collections) == 4
    slugs = collections |> Enum.map(& &1.slug) |> Enum.sort()
    assert slugs == ["merritt-parkway", "route-169", "route-207", "route-7-in-the-northwest"]
    assert Enum.all?(collections, & &1.published)
  end

  test "every collection names its designation year and who designated it" do
    seed_towns()

    for c <- ScenicBywaysCollections.upsert_all!() do
      assert c.intro =~ ~r/\b(1991|1993|2002|2022)\b/, "#{c.slug} states no designation year"
      assert c.intro =~ "Department of Transportation",
             "#{c.slug} does not say where the route data comes from"
    end
  end

  test "the two National Scenic Byways say so and the two state roads do not" do
    seed_towns()
    by_slug = Map.new(ScenicBywaysCollections.upsert_all!(), &{&1.slug, &1})

    assert by_slug["merritt-parkway"].intro =~ "National Scenic Byway"
    assert by_slug["route-169"].intro =~ "National Scenic Byway"
    refute by_slug["route-207"].intro =~ "National Scenic Byway"
    refute by_slug["route-7-in-the-northwest"].intro =~ "National Scenic Byway"
  end

  test "no collection quotes a distance in miles" do
    # The source milepoints are per-direction: the Merritt's segments sum to
    # 74.5 miles because both carriageways are present, while the parkway is
    # about 37. Distances are excluded rather than halved and hoped.
    seed_towns()

    for c <- ScenicBywaysCollections.upsert_all!() do
      refute c.intro =~ ~r/\bmiles?\b/i, "#{c.slug} quotes a distance"

      for item <- Ethos.Repo.preload(c, :items).items do
        refute (item.blurb || "") =~ ~r/\bmiles?\b/i, "#{c.slug} blurb quotes a distance"
      end
    end
  end

  test "each collection has one item per town, in route order" do
    seed_towns()
    by_slug = Map.new(ScenicBywaysCollections.upsert_all!(), &{&1.slug, &1})

    expected = %{
      "merritt-parkway" => 8,
      "route-169" => 5,
      "route-207" => 4,
      "route-7-in-the-northwest" => 3
    }

    for {slug, count} <- expected do
      items = Ethos.Repo.preload(by_slug[slug], :items).items
      assert length(items) == count, "#{slug} has #{length(items)} items, expected #{count}"
      assert Enum.map(items, & &1.position) == Enum.to_list(0..(count - 1))
      assert Enum.all?(items, &(String.trim(&1.blurb || "") != ""))
    end
  end

  test "is idempotent" do
    seed_towns()
    ScenicBywaysCollections.upsert_all!()
    ScenicBywaysCollections.upsert_all!()

    assert length(Collections.list_published()) >= 4
    c = Enum.find(Collections.list_published(), &(&1.slug == "route-207"))
    assert length(Ethos.Repo.preload(c, :items).items) == 4
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `MIX_TEST_PARTITION=_foliage mix test test/ethos/seeds/scenic_byways_test.exs`
Expected: FAIL — `module Ethos.Seeds.ScenicBywaysCollections is not available`

- [ ] **Step 3: Write the seed module**

Create `lib/ethos/seeds/scenic_byways_collections.ex`:

```elixir
defmodule Ethos.Seeds.ScenicBywaysCollections do
  @moduledoc """
  Seeds the four Connecticut scenic roads that run through three or more towns.

  The state designates scenic roads under a 1989 law and publishes them as a
  Department of Transportation layer of 141 segments in 74 groups. Seventy of
  those groups are a single town, which belongs on that town's guide rather
  than on a page of its own. Four cross three or more towns, and those are
  these.

  ## The names are ours

  The layer has no name field — only route numbers, town names, milepoints and
  a designation date. "The Merritt Parkway" is the common name for Route 15
  running from the New York line through those eight towns; the state's data
  does not say it. Each intro says where the route data comes from and leaves
  the name as what it is.

  ## No distances

  The milepoints are per-direction. The Merritt's segments sum to 74.5 miles
  because `15-N` and `15-S` are both in the data, while the parkway is about
  37. Rather than halve some routes and not others, the pages describe order
  and designation and quote no distances at all.
  """

  alias Ethos.Collections

  @source "the Connecticut Department of Transportation's scenic roads layer"

  def upsert_all! do
    [merritt(), route_169(), route_207(), route_7()]
    |> Enum.map(&Collections.upsert_collection!/1)
  end

  defp merritt do
    %{
      slug: "merritt-parkway",
      title: "The Merritt Parkway",
      published: true,
      intro: """
      Route 15 from the New York state line east to the Housatonic, designated
      a scenic road by Connecticut in 1993 and one of the state's two National
      Scenic Byways. It crosses eight Fairfield County towns, and no two of its
      bridges are alike. The route data here is #{@source}; the name is the one
      everyone uses, not a field in that dataset.
      """,
      items: [
        %{
          guide_slug: "greenwich-ct-travel-guide",
          blurb: "Where the parkway enters Connecticut from the New York line, and the first of the eight towns it crosses."
        },
        %{
          guide_slug: "stamford-ct-travel-guide",
          blurb: "The second town east, and the largest the parkway passes through."
        },
        %{
          guide_slug: "new-canaan-ct-travel-guide",
          blurb: "The parkway clips New Canaan's southern edge between Stamford and Norwalk."
        },
        %{
          guide_slug: "norwalk-ct-travel-guide",
          blurb: "Midway along the Fairfield County stretch, where the parkway crosses the Norwalk River valley."
        },
        %{
          guide_slug: "westport-ct-travel-guide",
          blurb: "East of Norwalk, on the run toward Fairfield."
        },
        %{
          guide_slug: "fairfield-ct-travel-guide",
          blurb: "The county's namesake town, and one of the longer stretches of the designation."
        },
        %{
          guide_slug: "trumbull-ct-travel-guide",
          blurb: "North of Bridgeport, where the parkway turns toward the Housatonic."
        },
        %{
          guide_slug: "stratford-ct-travel-guide",
          blurb: "The last Connecticut town on the designated stretch, ending at the Housatonic River."
        }
      ]
    }
  end

  defp route_169 do
    %{
      slug: "route-169",
      title: "Route 169 through the Quiet Corner",
      published: true,
      intro: """
      Designated in 1991 and Connecticut's other National Scenic Byway, Route
      169 runs north to south through the state's north-east corner, overlapping
      Routes 171, 44 and 138 along the way. Five towns, none of them large. The
      route data here is #{@source}; the corner's nickname is not the state's.
      """,
      items: [
        %{
          guide_slug: "woodstock-ct-travel-guide",
          blurb: "The northern end, where the designated stretch begins near the Massachusetts line."
        },
        %{
          guide_slug: "pomfret-ct-travel-guide",
          blurb: "South of Woodstock, where Route 169 overlaps US 44."
        },
        %{
          guide_slug: "brooklyn-ct-travel-guide",
          blurb: "The middle of the byway, and not the Brooklyn most people mean."
        },
        %{
          guide_slug: "canterbury-ct-travel-guide",
          blurb: "One of the longer stretches, running south toward the Quinebaug."
        },
        %{
          guide_slug: "lisbon-ct-travel-guide",
          blurb: "The southern end, where Route 169 meets Route 138."
        }
      ]
    }
  end

  defp route_207 do
    %{
      slug: "route-207",
      title: "Route 207",
      published: true,
      intro: """
      A state scenic road designated in 2022, the newest of the four, running
      east from Route 85 in Hebron to Route 97 in Sprague across four towns in
      the eastern uplands. Not a National Scenic Byway — a state designation
      under Connecticut's 1989 law. The route data here is #{@source}.
      """,
      items: [
        %{
          guide_slug: "hebron-ct-travel-guide",
          blurb: "The western end, where the designated stretch begins at Route 85."
        },
        %{
          guide_slug: "lebanon-ct-travel-guide",
          blurb: "The longest stretch of the four towns, across Lebanon's farmland."
        },
        %{
          guide_slug: "franklin-ct-travel-guide",
          blurb: "East of Lebanon, one of the smallest towns in the state by population."
        },
        %{
          guide_slug: "sprague-ct-travel-guide",
          blurb: "The eastern end, finishing at Route 97."
        }
      ]
    }
  end

  defp route_7 do
    %{
      slug: "route-7-in-the-northwest",
      title: "Route 7 in the north-west",
      published: true,
      intro: """
      A state scenic road designated in 2002, running north along Route 7 from
      the Cornwall–Sharon turnpike to the Canaan town line, through three towns
      in the Litchfield hills. Not a National Scenic Byway — a state
      designation. The route data here is #{@source}.
      """,
      items: [
        %{
          guide_slug: "sharon-ct-travel-guide",
          blurb: "The southern end of the designated stretch, where it leaves the Cornwall–Sharon turnpike."
        },
        %{
          guide_slug: "salisbury-ct-travel-guide",
          blurb: "The shortest of the three stretches, in the state's north-west corner."
        },
        %{
          guide_slug: "canaan-ct-travel-guide",
          blurb: "The northern end, finishing at the North Canaan town line."
        }
      ]
    }
  end
end
```

- [ ] **Step 4: Register in the release hook**

In `lib/ethos/release.ex`, inside `seed_collections/0`, the module list becomes a two-part run — the existing single-collection modules, then the byways which seed four at once:

```elixir
    for mod <- collections do
      collection = mod.upsert!()
      IO.puts("Seeded collection: /c/#{collection.slug}")
    end

    for collection <- Ethos.Seeds.ScenicBywaysCollections.upsert_all!() do
      IO.puts("Seeded collection: /c/#{collection.slug}")
    end
```

- [ ] **Step 5: Run the tests**

Run: `MIX_TEST_PARTITION=_foliage mix test test/ethos/seeds/scenic_byways_test.exs`
Expected: PASS, 6 tests

- [ ] **Step 6: Seed against the real corpus and read the pages**

```bash
MIX_ENV=dev mix run -e 'for c <- Ethos.Seeds.ScenicBywaysCollections.upsert_all!(), do: IO.puts(">>> /c/#{c.slug} — #{c.title} — #{length(Ethos.Repo.preload(c, :items).items)} items")'
```

Expected: four lines, with 8, 5, 4 and 3 items. **Then read the four intros and twenty blurbs back and paste them into your report.** The copy needs checking by eye; a passing test says nothing about whether it reads well or whether a claim is true.

- [ ] **Step 7: Format and commit**

```bash
mix format lib/ethos/seeds/scenic_byways_collections.ex lib/ethos/release.ex test/ethos/seeds/scenic_byways_test.exs
git add lib/ethos/seeds/scenic_byways_collections.ex lib/ethos/release.ex test/ethos/seeds/scenic_byways_test.exs
git commit -m "feat(collections): four state-designated scenic byways"
```

---

### Task 4: Foliage routes on the homepage

**Files:**
- Modify: `lib/ethos_web/controllers/page_controller.ex` (one assign)
- Modify: `lib/ethos_web/controllers/page_html/home.html.heex` (one section, after Collections)
- Modify: `test/ethos_web/controllers/page_controller_test.exs` (append)

**Interfaces:**
- Consumes: `Ethos.Foliage.routes/0`, returning `[%{slug:, name:, deep_url:, path:, stops: [%{town_slug:, guide_slug:}]}]`.
- Produces: a `:foliage_routes` assign.

**One fact:** the homepage renders with `layout: false`, so it has no affiliate slots and no house ad. Do not change that.

- [ ] **Step 1: Write the failing test**

Append to `test/ethos_web/controllers/page_controller_test.exs`:

```elixir
  describe "foliage driving routes" do
    test "lists all seven routes with their links", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)
      routes = Ethos.Foliage.routes()

      assert length(routes) == 7
      assert html =~ "Foliage driving routes"

      for route <- routes do
        # One route is "New Haven & Neighborhood"; HEEx escapes the ampersand,
        # so compare against what the page actually contains.
        escaped = route.name |> Phoenix.HTML.html_escape() |> Phoenix.HTML.safe_to_string()

        assert html =~ escaped
        assert html =~ ~s(href="/foliage/#{route.slug}")
      end
    end

    test "shows each route's town count", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)
      route = Ethos.Foliage.route("hartford-west")

      assert html =~ "#{length(route.stops)} towns"
    end

    test "keeps the Collections section above it", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      # Match the headings themselves, not the bare words — "Collections"
      # could appear earlier in a meta tag or a link label, and `:binary.match`
      # returns the first hit wherever it is.
      collections_heading = ~s(<h2 class="text-sm uppercase tracking-wide text-zinc-400">Collections</h2>)
      routes_heading = ~s(<h2 class="text-sm uppercase tracking-wide text-zinc-400">Foliage driving routes</h2>)

      assert [{collections_at, _}] = :binary.matches(html, collections_heading)
      assert [{routes_at, _}] = :binary.matches(html, routes_heading)
      assert collections_at < routes_at
    end
  end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `MIX_TEST_PARTITION=_foliage mix test test/ethos_web/controllers/page_controller_test.exs`
Expected: FAIL — the page contains no "Foliage driving routes"

- [ ] **Step 3: Add the assign**

In `lib/ethos_web/controllers/page_controller.ex`, add to the `render/3` keyword list:

```elixir
      foliage_routes: Ethos.Foliage.routes(),
```

- [ ] **Step 4: Add the section**

In `lib/ethos_web/controllers/page_html/home.html.heex`, immediately after the Collections `</section>` and before the closing `</div>`:

```heex
  <section :if={@foliage_routes != []} class="mt-12 text-left">
    <div class="flex items-center justify-between">
      <h2 class="text-sm uppercase tracking-wide text-zinc-400">Foliage driving routes</h2>
      <.link navigate={~p"/foliage"} class="text-sm underline">The forecast →</.link>
    </div>
    <ul class="mt-4 grid gap-3 sm:grid-cols-2">
      <li :for={route <- @foliage_routes} class="rounded-xl border p-4">
        <.link navigate={~p"/foliage/#{route.slug}"} class="font-semibold hover:underline">
          {route.name}
        </.link>
        <p class="text-sm text-zinc-500">{length(route.stops)} towns</p>
      </li>
    </ul>
  </section>
```

- [ ] **Step 5: Run the tests**

Run: `MIX_TEST_PARTITION=_foliage mix test test/ethos_web/controllers/page_controller_test.exs`
Expected: PASS

- [ ] **Step 6: Prove the section is guarded**

Delete the `<section :if={@foliage_routes != []}...>` block from the template, run the test file, and confirm at least one test FAILS. Restore with `git checkout -- lib/ethos_web/controllers/page_html/home.html.heex`, re-run, confirm green, and confirm `git status --porcelain` is clean. Report which test failed.

- [ ] **Step 7: Run the full suite**

Run: `MIX_TEST_PARTITION=_foliage mix test`
Expected: 0 failures.

- [ ] **Step 8: Format and commit**

```bash
mix format lib/ethos_web/controllers/page_controller.ex lib/ethos_web/controllers/page_html/home.html.heex test/ethos_web/controllers/page_controller_test.exs
git add lib/ethos_web/controllers/page_controller.ex lib/ethos_web/controllers/page_html/home.html.heex test/ethos_web/controllers/page_controller_test.exs
git commit -m "feat(homepage): the seven foliage driving routes"
```

---

## Post-implementation

- [ ] After deploy, run `bin/ethos eval "Ethos.Release.adjacency_links()"` and `bin/ethos eval "Ethos.Release.seed_collections()"`.
- [ ] Confirm a Connecticut guide page shows a "Nearby" block listing its real bordering towns, each once.
- [ ] Confirm the four byway collections render and appear on the homepage.
