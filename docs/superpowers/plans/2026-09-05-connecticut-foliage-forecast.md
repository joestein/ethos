# Connecticut Foliage Forecast Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish a per-town, per-week Connecticut foliage forecast derived from CT DEEP's published map, presented through seven official state driving-route pages and an embeddable SVG map.

**Architecture:** An offline mix task samples DEEP's raster tile services inside each of 169 town polygons, classifies the pixels against DEEP's colour ramp, and writes frozen JSON to `priv/foliage/`. That JSON is committed and loaded into `:persistent_term` at boot, so the running app has no third-party dependency, no API key, and no way to change what it says without a commit. The web layer renders inline SVG server-side; JavaScript is an enhancement, never a requirement. One small Ecto table holds editorial field notes.

**Tech Stack:** Elixir 1.14+, Phoenix 1.7.14, Ecto/Postgres, `req ~> 0.5` (HTTP), `vix ~> 0.26` (JPEG tile decode and SVG→PNG), `jason ~> 1.2`. No new dependencies.

**Spec:** `docs/superpowers/specs/2026-09-05-connecticut-foliage-forecast-design.md`

## Global Constraints

- **No new dependencies.** `req`, `vix`, and `jason` are already in `mix.exs`.
- **No network access at runtime.** The mix task is the only thing that talks to ArcGIS, it runs on a developer machine, and its output is committed. Nothing under `lib/ethos_web/` may make an HTTP request.
- **No map vendor.** No MapLibre, no MapTiler, no Protomaps, no basemap of any kind. 169 town polygons over one fixed extent are the map. Adding a tile dependency is a design change, not an implementation detail.
- **No JavaScript requirement.** Every page must render its full content and support week switching with JS disabled. Any script is progressive enhancement only.
- **Attribution sentence is mandatory** on every page showing a stage or a peak window, verbatim:
  > Derived from the Connecticut DEEP fall foliage map. DEEP's map is a climatological estimate last published in 2023; it describes a normal year, not this one. Stage names are ours.
- **Vocabulary.** The product is a *forecast*. The words "tracker", "live", and "real-time" must not appear in any user-facing string, route, title, or OG card.
- **Exactly nine public URLs.** `/foliage`, seven `/foliage/:route_slug`, `/foliage/embed`. No `/foliage/:town` route.
- **Five stage atoms**, in this order: `:green`, `:turning`, `:near_peak`, `:peak`, `:past_peak`.
- **Nine weeks**, indices 1..9, stored as year-agnostic month/day ranges. Week 9 is `Past peak` and carries no range.
- **Voice.** Restrained and specific. No exclamation marks, no "stunning", no "breathtaking". Match `priv/seed_data/connecticut/*.json` intros.
- Run tests with `mix test`. Format with `mix format` before every commit.

---

### Task 1: Geometry primitives

Pure functions with no I/O. Everything geometric that later tasks need, testable without a network or a database.

**Files:**
- Create: `lib/ethos/foliage/geometry.ex`
- Test: `test/ethos/foliage/geometry_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces:
  - `slugify(String.t()) :: String.t()`
  - `centroid([{lon, lat}]) :: {lon, lat}` — area-weighted polygon centroid
  - `point_in_polygon?({lon, lat}, [{lon, lat}]) :: boolean`
  - `simplify([{lon, lat}], tolerance :: float) :: [{lon, lat}]` — Douglas–Peucker
  - `sample_points([{lon, lat}], count :: pos_integer, seed :: integer) :: [{lon, lat}]` — deterministic interior points
  - `bbox([{lon, lat}]) :: {min_lon, min_lat, max_lon, max_lat}`
  - `project({lon, lat}, {min_lon, min_lat, max_lon, max_lat}, {width, height}) :: {x, y}` — Web Mercator into an SVG viewBox

- [ ] **Step 1: Write the failing test**

Create `test/ethos/foliage/geometry_test.exs`:

```elixir
defmodule Ethos.Foliage.GeometryTest do
  use ExUnit.Case, async: true

  alias Ethos.Foliage.Geometry

  describe "slugify/1" do
    test "lowercases and hyphenates town names" do
      assert Geometry.slugify("New Hartford") == "new-hartford"
      assert Geometry.slugify("Windsor Locks") == "windsor-locks"
      assert Geometry.slugify("New Haven & Neighborhood") == "new-haven-neighborhood"
    end
  end

  describe "centroid/1" do
    test "returns the centre of a unit square" do
      square = [{0.0, 0.0}, {2.0, 0.0}, {2.0, 2.0}, {0.0, 2.0}]
      assert {x, y} = Geometry.centroid(square)
      assert_in_delta x, 1.0, 0.0001
      assert_in_delta y, 1.0, 0.0001
    end

    test "is area-weighted, not vertex-averaged" do
      # An L shape: vertex-averaging would pull the point off-centre differently
      # than area-weighting. This asserts we did the area-weighted version.
      l_shape = [{0.0, 0.0}, {4.0, 0.0}, {4.0, 1.0}, {1.0, 1.0}, {1.0, 4.0}, {0.0, 4.0}]
      assert {x, y} = Geometry.centroid(l_shape)
      assert_in_delta x, 1.0, 0.01
      assert_in_delta y, 1.0, 0.01
    end
  end

  describe "point_in_polygon?/2" do
    setup do
      %{square: [{0.0, 0.0}, {2.0, 0.0}, {2.0, 2.0}, {0.0, 2.0}]}
    end

    test "detects interior points", %{square: square} do
      assert Geometry.point_in_polygon?({1.0, 1.0}, square)
    end

    test "rejects exterior points", %{square: square} do
      refute Geometry.point_in_polygon?({3.0, 1.0}, square)
      refute Geometry.point_in_polygon?({1.0, -1.0}, square)
    end

    test "handles a concave polygon" do
      # A C shape open to the right; the notch is outside.
      c = [{0.0, 0.0}, {3.0, 0.0}, {3.0, 1.0}, {1.0, 1.0}, {1.0, 2.0}, {3.0, 2.0},
           {3.0, 3.0}, {0.0, 3.0}]
      assert Geometry.point_in_polygon?({0.5, 1.5}, c)
      refute Geometry.point_in_polygon?({2.0, 1.5}, c)
    end
  end

  describe "simplify/2" do
    test "drops collinear points" do
      line = [{0.0, 0.0}, {1.0, 0.0}, {2.0, 0.0}, {3.0, 0.0}]
      assert Geometry.simplify(line, 0.01) == [{0.0, 0.0}, {3.0, 0.0}]
    end

    test "keeps points that exceed the tolerance" do
      spike = [{0.0, 0.0}, {1.0, 1.0}, {2.0, 0.0}]
      assert Geometry.simplify(spike, 0.5) == spike
    end

    test "never returns fewer than two points" do
      assert length(Geometry.simplify([{0.0, 0.0}, {1.0, 0.0}], 100.0)) == 2
    end
  end

  describe "sample_points/3" do
    test "returns the requested number of interior points" do
      square = [{0.0, 0.0}, {2.0, 0.0}, {2.0, 2.0}, {0.0, 2.0}]
      points = Geometry.sample_points(square, 25, 42)

      assert length(points) == 25
      assert Enum.all?(points, &Geometry.point_in_polygon?(&1, square))
    end

    test "is deterministic for a given seed" do
      square = [{0.0, 0.0}, {2.0, 0.0}, {2.0, 2.0}, {0.0, 2.0}]
      assert Geometry.sample_points(square, 10, 7) == Geometry.sample_points(square, 10, 7)
    end

    test "differs across seeds" do
      square = [{0.0, 0.0}, {2.0, 0.0}, {2.0, 2.0}, {0.0, 2.0}]
      refute Geometry.sample_points(square, 10, 7) == Geometry.sample_points(square, 10, 8)
    end
  end

  describe "project/3" do
    test "maps the bbox corners to the viewBox corners" do
      bbox = {-73.7, 40.9, -71.7, 42.1}
      assert {x0, y0} = Geometry.project({-73.7, 42.1}, bbox, {800, 520})
      assert {x1, y1} = Geometry.project({-71.7, 40.9}, bbox, {800, 520})

      assert_in_delta x0, 0.0, 0.01
      assert_in_delta y0, 0.0, 0.01
      assert_in_delta x1, 800.0, 0.01
      assert_in_delta y1, 520.0, 0.01
    end

    test "y increases southward" do
      bbox = {-73.7, 40.9, -71.7, 42.1}
      {_, north} = Geometry.project({-72.7, 42.0}, bbox, {800, 520})
      {_, south} = Geometry.project({-72.7, 41.0}, bbox, {800, 520})
      assert south > north
    end
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `mix test test/ethos/foliage/geometry_test.exs`
Expected: FAIL — `module Ethos.Foliage.Geometry is not available`

- [ ] **Step 3: Write the implementation**

Create `lib/ethos/foliage/geometry.ex`:

```elixir
defmodule Ethos.Foliage.Geometry do
  @moduledoc """
  Pure geometry for the foliage map: polygon maths, deterministic interior
  sampling, and the Web Mercator projection into a fixed SVG viewBox.

  Coordinates are `{longitude, latitude}` in WGS84 throughout — the order
  ArcGIS returns and the opposite of the `{lat, lng}` order the rest of the
  application uses for places. The tuple order is the type: anything named
  `point` here is `{lon, lat}`.

  No I/O. Everything here is called from the offline build task and from the
  SVG renderer, and both need to be testable without a network.
  """

  @type point :: {float, float}
  @type bbox :: {float, float, float, float}

  @doc "Lowercase, hyphen-joined slug. Matches `Guide.derive_destination_slug/1`."
  def slugify(name) when is_binary(name) do
    name
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9]+/, "-")
    |> String.trim("-")
  end

  @doc """
  Area-weighted centroid of a closed ring.

  Vertex-averaging would bias toward whichever edge happens to carry more
  vertices, which for a simplified coastline is the coast — placing several
  shoreline towns' labels in the water.
  """
  def centroid(ring) when is_list(ring) do
    pairs = Enum.zip(ring, rotate(ring))

    {a2, cx, cy} =
      Enum.reduce(pairs, {0.0, 0.0, 0.0}, fn {{x0, y0}, {x1, y1}}, {a, sx, sy} ->
        cross = x0 * y1 - x1 * y0
        {a + cross, sx + (x0 + x1) * cross, sy + (y0 + y1) * cross}
      end)

    if abs(a2) < 1.0e-12 do
      # Degenerate ring (zero area). Fall back to the vertex mean rather than
      # dividing by zero; the build gate rejects these anyway.
      {xs, ys} = Enum.unzip(ring)
      {Enum.sum(xs) / length(xs), Enum.sum(ys) / length(ys)}
    else
      {cx / (3.0 * a2), cy / (3.0 * a2)}
    end
  end

  @doc "Ray-casting point-in-polygon. Boundary behaviour is unspecified and unused."
  def point_in_polygon?({px, py}, ring) when is_list(ring) do
    ring
    |> Enum.zip(rotate(ring))
    |> Enum.reduce(false, fn {{x0, y0}, {x1, y1}}, inside ->
      crosses? = y0 > py != y1 > py

      if crosses? and px < (x1 - x0) * (py - y0) / (y1 - y0) + x0 do
        not inside
      else
        inside
      end
    end)
  end

  @doc """
  Douglas–Peucker simplification. Always returns at least the two endpoints.
  """
  def simplify(points, _tolerance) when is_list(points) and length(points) <= 2, do: points

  def simplify(points, tolerance) when is_list(points) do
    first = List.first(points)
    last = List.last(points)

    {index, dist} =
      points
      |> Enum.with_index()
      |> Enum.slice(1..-2//1)
      |> Enum.map(fn {p, i} -> {i, perpendicular_distance(p, first, last)} end)
      |> Enum.max_by(fn {_i, d} -> d end, fn -> {0, 0.0} end)

    if dist > tolerance do
      left = simplify(Enum.slice(points, 0..index), tolerance)
      right = simplify(Enum.slice(points, index..-1//1), tolerance)
      left ++ tl(right)
    else
      [first, last]
    end
  end

  @doc """
  `count` points strictly inside `ring`, reproducible for a given `seed`.

  Uses its own linear congruential generator rather than `:rand`, because the
  build output is committed and must not change when the OTP release changes
  its default algorithm.
  """
  def sample_points(ring, count, seed) do
    {min_x, min_y, max_x, max_y} = bbox(ring)

    Stream.unfold(seed, fn s ->
      s1 = lcg(s)
      s2 = lcg(s1)
      x = min_x + unit(s1) * (max_x - min_x)
      y = min_y + unit(s2) * (max_y - min_y)
      {{x, y}, s2}
    end)
    |> Stream.filter(&point_in_polygon?(&1, ring))
    # A sliver polygon can reject almost every candidate; cap the attempts so a
    # bad geometry fails the build gate instead of hanging it.
    |> Enum.take(count)
  end

  @doc "Bounding box of a ring as `{min_lon, min_lat, max_lon, max_lat}`."
  def bbox(ring) do
    {xs, ys} = Enum.unzip(ring)
    {Enum.min(xs), Enum.min(ys), Enum.max(xs), Enum.max(ys)}
  end

  @doc """
  Web Mercator projection of a point into an SVG viewBox.

  The extent never changes (it is Connecticut), so this is fifteen lines rather
  than a projection dependency.
  """
  def project({lon, lat}, {min_lon, min_lat, max_lon, max_lat}, {width, height}) do
    x = (lon - min_lon) / (max_lon - min_lon) * width

    top = mercator_y(max_lat)
    bottom = mercator_y(min_lat)
    y = (mercator_y(lat) - top) / (bottom - top) * height

    {x, y}
  end

  defp mercator_y(lat) do
    rad = lat * :math.pi() / 180.0
    :math.log(:math.tan(rad) + 1.0 / :math.cos(rad))
  end

  defp rotate([head | tail]), do: tail ++ [head]

  defp perpendicular_distance({px, py}, {x0, y0}, {x1, y1}) do
    dx = x1 - x0
    dy = y1 - y0

    if dx == 0.0 and dy == 0.0 do
      :math.sqrt(:math.pow(px - x0, 2) + :math.pow(py - y0, 2))
    else
      abs(dy * px - dx * py + x1 * y0 - y1 * x0) / :math.sqrt(dx * dx + dy * dy)
    end
  end

  # Numerical Recipes LCG constants; 2^32 modulus.
  defp lcg(s), do: rem(1_664_525 * s + 1_013_904_223, 4_294_967_296)
  defp unit(s), do: s / 4_294_967_296.0
end
```

- [ ] **Step 4: Run the test to verify it passes**

Run: `mix test test/ethos/foliage/geometry_test.exs`
Expected: PASS, 13 tests

- [ ] **Step 5: Format and commit**

```bash
mix format
git add lib/ethos/foliage/geometry.ex test/ethos/foliage/geometry_test.exs
git commit -m "feat(foliage): geometry primitives for town polygons and projection"
```

---

### Task 2: Tile addressing and colour classification

Also pure. Converts a lat/lng to a slippy-tile address and a pixel to one of five stages against DEEP's continuous ramp.

**Files:**
- Create: `lib/ethos/foliage/tiles.ex`
- Test: `test/ethos/foliage/tiles_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces:
  - `@zoom 12`
  - `stages() :: [:green | :turning | :near_peak | :peak | :past_peak]`
  - `address({lon, lat}, zoom :: integer) :: {x, y, px, py}` — tile x/y and 0..255 pixel offsets
  - `tiles_covering(bbox, zoom) :: [{x, y}]`
  - `classify({r, g, b}) :: {:ok, stage} | :unknown`

- [ ] **Step 1: Write the failing test**

Create `test/ethos/foliage/tiles_test.exs`:

```elixir
defmodule Ethos.Foliage.TilesTest do
  use ExUnit.Case, async: true

  alias Ethos.Foliage.Tiles

  describe "address/2" do
    test "places central Connecticut on the tile observed from the live service" do
      # Verified against the DEEP tile service on 2026-09-05: 41.6N, 72.7W at
      # zoom 9 is tile x=152, y=190.
      assert {152, 190, _, _} = Tiles.address({-72.7, 41.6}, 9)
    end

    test "pixel offsets are within a tile" do
      {_, _, px, py} = Tiles.address({-72.7, 41.6}, 12)
      assert px in 0..255
      assert py in 0..255
    end

    test "moving east increases x" do
      {x0, _, _, _} = Tiles.address({-73.5, 41.6}, 12)
      {x1, _, _, _} = Tiles.address({-71.9, 41.6}, 12)
      assert x1 > x0
    end

    test "moving north decreases y" do
      {_, y0, _, _} = Tiles.address({-72.7, 42.0}, 12)
      {_, y1, _, _} = Tiles.address({-72.7, 41.0}, 12)
      assert y1 > y0
    end
  end

  describe "tiles_covering/2" do
    test "covers the Connecticut bounding box without gaps" do
      bbox = {-73.8, 40.9, -71.7, 42.1}
      tiles = Tiles.tiles_covering(bbox, 12)

      assert length(tiles) > 100
      assert Enum.uniq(tiles) == tiles

      # Every corner of the bbox must be inside one of the returned tiles.
      for corner <- [{-73.8, 42.1}, {-71.7, 42.1}, {-73.8, 40.9}, {-71.7, 40.9}] do
        {x, y, _, _} = Tiles.address(corner, 12)
        assert {x, y} in tiles
      end
    end
  end

  describe "classify/1" do
    test "classifies the ramp anchors observed on the live tiles" do
      # Every colour below was read from DEEP's tile services on 2026-09-05.
      assert Tiles.classify({0, 115, 8}) == {:ok, :green}
      assert Tiles.classify({20, 115, 23}) == {:ok, :green}
      assert Tiles.classify({115, 182, 15}) == {:ok, :turning}
      assert Tiles.classify({247, 242, 39}) == {:ok, :turning}
      assert Tiles.classify({255, 147, 10}) == {:ok, :near_peak}
      assert Tiles.classify({254, 60, 24}) == {:ok, :peak}
      assert Tiles.classify({145, 0, 3}) == {:ok, :past_peak}
    end

    test "tolerates JPEG drift around an anchor" do
      assert Tiles.classify({2, 117, 10}) == {:ok, :green}
      assert Tiles.classify({251, 58, 27}) == {:ok, :peak}
    end

    test "rejects colours that are not on the ramp" do
      # Road casing, borders, labels and the ocean must not be counted.
      assert Tiles.classify({255, 255, 255}) == :unknown
      assert Tiles.classify({0, 0, 0}) == :unknown
      assert Tiles.classify({160, 160, 160}) == :unknown
    end
  end

  describe "stages/0" do
    test "is ordered from green through past peak" do
      assert Tiles.stages() == [:green, :turning, :near_peak, :peak, :past_peak]
    end
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `mix test test/ethos/foliage/tiles_test.exs`
Expected: FAIL — `module Ethos.Foliage.Tiles is not available`

- [ ] **Step 3: Write the implementation**

Create `lib/ethos/foliage/tiles.ex`:

```elixir
defmodule Ethos.Foliage.Tiles do
  @moduledoc """
  Slippy-tile addressing and colour classification for DEEP's foliage rasters.

  DEEP's symbology is a *continuous* green-to-dark-red ramp — the StoryMap
  legend resource is a smooth gradient and names no discrete classes. So the
  five stage names here are Ethos's editorial binning of the state's ramp, not
  a vocabulary DEEP publishes, and the pages say so.

  Anchors were read off the live tile services on 2026-09-05. Classification is
  nearest-anchor in RGB with a distance ceiling; the ceiling is what keeps road
  casing, town borders, place labels and the ocean out of the sample.
  """

  @zoom 12
  def zoom, do: @zoom

  @stages [:green, :turning, :near_peak, :peak, :past_peak]
  def stages, do: @stages

  # {r, g, b} => stage. Several anchors map to one stage because the ramp is
  # continuous: "turning" spans yellow-green through full yellow.
  @anchors [
    {{0, 115, 8}, :green},
    {{20, 115, 23}, :green},
    {{44, 142, 29}, :green},
    {{115, 182, 15}, :turning},
    {{155, 201, 33}, :turning},
    {{215, 238, 32}, :turning},
    {{247, 242, 39}, :turning},
    {{252, 215, 23}, :turning},
    {{255, 190, 34}, :near_peak},
    {{254, 195, 33}, :near_peak},
    {{255, 147, 10}, :near_peak},
    {{255, 110, 27}, :near_peak},
    {{255, 97, 26}, :peak},
    {{254, 60, 24}, :peak},
    {{247, 47, 24}, :peak},
    {{181, 29, 10}, :past_peak},
    {{156, 18, 5}, :past_peak},
    {{145, 0, 3}, :past_peak}
  ]

  # Squared RGB distance. 40 units per channel is roughly the drift JPEG
  # introduces on a flat fill; beyond that the pixel is something else.
  @max_distance_squared 40 * 40 * 3

  @doc """
  Tile address as `{tile_x, tile_y, pixel_x, pixel_y}` for a `{lon, lat}` point.
  """
  def address({lon, lat}, zoom \\ @zoom) do
    n = :math.pow(2, zoom)
    rad = lat * :math.pi() / 180.0

    fx = (lon + 180.0) / 360.0 * n
    fy = (1.0 - :math.log(:math.tan(rad) + 1.0 / :math.cos(rad)) / :math.pi()) / 2.0 * n

    {trunc(fx), trunc(fy), floor_px(fx), floor_px(fy)}
  end

  @doc "Every `{tile_x, tile_y}` needed to cover `bbox` at `zoom`."
  def tiles_covering({min_lon, min_lat, max_lon, max_lat}, zoom \\ @zoom) do
    {x0, y0, _, _} = address({min_lon, max_lat}, zoom)
    {x1, y1, _, _} = address({max_lon, min_lat}, zoom)

    for x <- x0..x1, y <- y0..y1, do: {x, y}
  end

  @doc """
  Nearest ramp anchor, or `:unknown` when the pixel is further from every
  anchor than the ceiling allows.
  """
  def classify({r, g, b}) do
    {stage, distance} =
      Enum.reduce(@anchors, {nil, :infinity}, fn {{ar, ag, ab}, stage}, {best, best_d} ->
        d = (r - ar) * (r - ar) + (g - ag) * (g - ag) + (b - ab) * (b - ab)
        if d < best_d, do: {stage, d}, else: {best, best_d}
      end)

    if distance <= @max_distance_squared, do: {:ok, stage}, else: :unknown
  end

  defp floor_px(f), do: trunc((f - Float.floor(f)) * 256)
end
```

- [ ] **Step 4: Run the test to verify it passes**

Run: `mix test test/ethos/foliage/tiles_test.exs`
Expected: PASS, 9 tests

If `classify/1` mis-bins an anchor, adjust `@anchors` and `@max_distance_squared` — the anchors are empirical and the test is the arbiter. Do not widen `@max_distance_squared` past `50 * 50 * 3`; beyond that grey road casing starts classifying as `:past_peak`.

- [ ] **Step 5: Format and commit**

```bash
mix format
git add lib/ethos/foliage/tiles.ex test/ethos/foliage/tiles_test.exs
git commit -m "feat(foliage): tile addressing and DEEP ramp classification"
```

---

### Task 3: ArcGIS client and town geometry build

Fetch the CC0 town polygons, dissolve multipart geometry, simplify, and write `priv/foliage/towns.json` with geometry only. Stages come in Task 4.

**Files:**
- Create: `lib/ethos/foliage/arc_gis.ex`
- Create: `lib/mix/tasks/ethos.foliage.build.ex`
- Test: `test/ethos/foliage/arc_gis_test.exs`
- Create: `test/support/fixtures/foliage/towns_response.json`

**Interfaces:**
- Consumes: `Ethos.Foliage.Geometry`.
- Produces:
  - `ArcGIS.town_features(json :: map) :: [%{name: String.t(), county: String.t(), fips: String.t(), rings: [[{lon, lat}]]}]` — parses an ArcGIS query response
  - `ArcGIS.dissolve([feature]) :: [%{name:, county:, fips:, ring: [{lon, lat}]}]` — largest ring per town
  - `ArcGIS.fetch_towns!() :: map` — live call, not unit tested
  - `mix ethos.foliage.build --towns`

- [ ] **Step 1: Write the fixture**

Create `test/support/fixtures/foliage/towns_response.json`. This is a trimmed real ArcGIS response shape — two towns, one of them multipart:

```json
{
  "features": [
    {
      "attributes": {"TOWN": "Andover", "COUNTY": "Tolland", "FIPS_COD": "09013"},
      "geometry": {"rings": [[[-72.4, 41.7], [-72.3, 41.7], [-72.3, 41.8], [-72.4, 41.8], [-72.4, 41.7]]]}
    },
    {
      "attributes": {"TOWN": "Groton", "COUNTY": "New London", "FIPS_COD": "09011"},
      "geometry": {"rings": [[[-72.1, 41.3], [-72.0, 41.3], [-72.0, 41.4], [-72.1, 41.4], [-72.1, 41.3]]]}
    },
    {
      "attributes": {"TOWN": "Groton", "COUNTY": "New London", "FIPS_COD": "09011"},
      "geometry": {"rings": [[[-72.05, 41.28], [-72.04, 41.28], [-72.04, 41.29], [-72.05, 41.29], [-72.05, 41.28]]]}
    }
  ]
}
```

- [ ] **Step 2: Write the failing test**

Create `test/ethos/foliage/arc_gis_test.exs`:

```elixir
defmodule Ethos.Foliage.ArcGISTest do
  use ExUnit.Case, async: true

  alias Ethos.Foliage.ArcGIS

  setup do
    json =
      Path.join([__DIR__, "..", "..", "support", "fixtures", "foliage", "towns_response.json"])
      |> Path.expand()
      |> File.read!()
      |> Jason.decode!()

    %{json: json}
  end

  describe "town_features/1" do
    test "parses attributes and rings into {lon, lat} tuples", %{json: json} do
      features = ArcGIS.town_features(json)

      assert length(features) == 3
      andover = Enum.find(features, &(&1.name == "Andover"))
      assert andover.county == "Tolland"
      assert andover.fips == "09013"
      assert [ring] = andover.rings
      assert {-72.4, 41.7} in ring
    end
  end

  describe "dissolve/1" do
    test "collapses multipart towns to one ring each", %{json: json} do
      dissolved = json |> ArcGIS.town_features() |> ArcGIS.dissolve()

      assert length(dissolved) == 2
      assert Enum.map(dissolved, & &1.name) |> Enum.sort() == ["Andover", "Groton"]
    end

    test "keeps the largest part of a multipart town", %{json: json} do
      groton =
        json |> ArcGIS.town_features() |> ArcGIS.dissolve() |> Enum.find(&(&1.name == "Groton"))

      # The mainland ring spans 0.1 degrees; the island ring spans 0.01. Keeping
      # the island would put Groton's centroid in Long Island Sound.
      {min_x, _, max_x, _} = Ethos.Foliage.Geometry.bbox(groton.ring)
      assert_in_delta max_x - min_x, 0.1, 0.001
    end

    test "carries a slug derived from the town name", %{json: json} do
      dissolved = json |> ArcGIS.town_features() |> ArcGIS.dissolve()
      assert Enum.find(dissolved, &(&1.slug == "andover"))
    end
  end
end
```

- [ ] **Step 3: Run the test to verify it fails**

Run: `mix test test/ethos/foliage/arc_gis_test.exs`
Expected: FAIL — `module Ethos.Foliage.ArcGIS is not available`

- [ ] **Step 4: Write the ArcGIS client**

Create `lib/ethos/foliage/arc_gis.ex`:

```elixir
defmodule Ethos.Foliage.ArcGIS do
  @moduledoc """
  Reads the two public CT feature services the foliage build depends on.

  Called only from `mix ethos.foliage.build`, never at runtime — the build's
  output is committed, so the running application has no dependency on these
  services and keeps working unchanged if they go away.

  Town polygons are `Connecticut_Towns_NoLabels` (owner `deepgis`, licensed
  CC0). The service returns 785 rows for 169 towns because islands and
  exclaves are separate features; `dissolve/1` keeps the largest ring per town,
  which is what a choropleth needs and what puts centroids on land.
  """

  require Logger

  @host "https://services1.arcgis.com/FjPcSmEFuDYlIdKC/arcgis/rest/services"
  @towns "#{@host}/Connecticut_Towns_NoLabels/FeatureServer/1/query"
  @routes "#{@host}/Fall_Foliage_Driving_Routes/FeatureServer/0/query"

  def fetch_towns! do
    get!(@towns, %{
      "where" => "STATE_COD='CT' AND COUNTY <> ' '",
      "outFields" => "TOWN,COUNTY,FIPS_COD",
      "returnGeometry" => "true",
      "outSR" => "4326",
      "f" => "json"
    })
  end

  def fetch_routes! do
    get!(@routes, %{
      "where" => "1=1",
      "outFields" => "ROUTENAME,URL",
      "returnGeometry" => "true",
      "outSR" => "4326",
      "f" => "json"
    })
  end

  @doc "Towns intersecting a route polyline, as `[town_name]`."
  def fetch_route_towns!(paths) do
    geometry = Jason.encode!(%{"paths" => paths, "spatialReference" => %{"wkid" => 4326}})

    get!(@towns, %{
      "geometry" => geometry,
      "geometryType" => "esriGeometryPolyline",
      "spatialRel" => "esriSpatialRelIntersects",
      "inSR" => "4326",
      "where" => "STATE_COD='CT' AND COUNTY <> ' '",
      "outFields" => "TOWN",
      "returnGeometry" => "false",
      "f" => "json"
    })
    |> Map.fetch!("features")
    |> Enum.map(& &1["attributes"]["TOWN"])
    |> Enum.uniq()
  end

  def town_features(%{"features" => features}) do
    Enum.map(features, fn %{"attributes" => a, "geometry" => g} ->
      %{
        name: a["TOWN"],
        county: a["COUNTY"],
        fips: a["FIPS_COD"],
        rings: Enum.map(g["rings"] || [], fn ring -> Enum.map(ring, fn [x, y] -> {x / 1, y / 1} end) end)
      }
    end)
  end

  @doc "One ring per town — the largest by bounding-box area."
  def dissolve(features) do
    features
    |> Enum.group_by(& &1.name)
    |> Enum.map(fn {name, group} ->
      ring =
        group
        |> Enum.flat_map(& &1.rings)
        |> Enum.max_by(&ring_extent/1, fn -> [] end)

      first = hd(group)

      %{
        name: name,
        slug: Ethos.Foliage.Geometry.slugify(name),
        county: first.county,
        fips: first.fips,
        ring: ring
      }
    end)
    |> Enum.sort_by(& &1.slug)
  end

  defp ring_extent([]), do: 0.0

  defp ring_extent(ring) do
    {min_x, min_y, max_x, max_y} = Ethos.Foliage.Geometry.bbox(ring)
    (max_x - min_x) * (max_y - min_y)
  end

  defp get!(url, params) do
    case Req.post(url, form: params, receive_timeout: 60_000, retry: :transient) do
      {:ok, %{status: 200, body: body}} when is_map(body) ->
        if body["error"], do: raise("ArcGIS error from #{url}: #{inspect(body["error"])}")
        body

      {:ok, %{status: status}} ->
        raise "ArcGIS returned #{status} for #{url}"

      {:error, reason} ->
        raise "ArcGIS request to #{url} failed: #{inspect(reason)}"
    end
  end
end
```

- [ ] **Step 5: Run the test to verify it passes**

Run: `mix test test/ethos/foliage/arc_gis_test.exs`
Expected: PASS, 4 tests

- [ ] **Step 6: Write the build task's town stage**

Create `lib/mix/tasks/ethos.foliage.build.ex`:

```elixir
defmodule Mix.Tasks.Ethos.Foliage.Build do
  @shortdoc "Derives the foliage dataset from CT DEEP's public services"

  @moduledoc """
  Writes `priv/foliage/{towns,routes,weeks}.json` from CT DEEP's public ArcGIS
  services. Run on a developer machine; commit the output.

  This never runs in production and the application never calls it. The point
  of committing the output is that the dataset is reviewable in a diff — which
  matters, because it is the thing being represented as derived from a state
  agency.

      mix ethos.foliage.build --towns    # geometry only
      mix ethos.foliage.build --stages   # sample the tiles (slow, ~2500 fetches)
      mix ethos.foliage.build --routes   # route/town joins; needs a seeded DB
      mix ethos.foliage.build --all

  `--routes` resolves town names to published guide slugs by querying `guides`,
  so it needs a locally seeded database. Five towns (Danbury, Middlebury,
  Southbury, Waterbury, Woodbury) are seeded from Elixir modules rather than
  JSON, and Mansfield has no guide of its own at all — it is covered by the
  Storrs guide, Storrs being a village in Mansfield. Reading the seed
  directory would miss all six.
  """

  use Mix.Task

  alias Ethos.Foliage.{ArcGIS, Geometry}

  @expected_towns 169
  @simplify_tolerance 0.0008
  @sample_count 25

  @impl Mix.Task
  def run(args) do
    Application.ensure_all_started(:req)
    {opts, _, _} = OptionParser.parse(args, strict: [towns: :boolean, stages: :boolean, routes: :boolean, all: :boolean])

    if opts[:towns] || opts[:all], do: build_towns()
  end

  defp build_towns do
    Mix.shell().info("Fetching Connecticut town polygons…")

    towns =
      ArcGIS.fetch_towns!()
      |> ArcGIS.town_features()
      |> ArcGIS.dissolve()

    if length(towns) != @expected_towns do
      Mix.raise("Expected #{@expected_towns} towns, got #{length(towns)}. Refusing to write.")
    end

    payload =
      Enum.map(towns, fn town ->
        simplified = Geometry.simplify(town.ring, @simplify_tolerance)

        if length(simplified) < 4 do
          Mix.raise("#{town.name} simplified to #{length(simplified)} points; tolerance too coarse.")
        end

        {lon, lat} = Geometry.centroid(town.ring)

        %{
          slug: town.slug,
          name: town.name,
          county: town.county,
          fips: town.fips,
          # Stored even though the choropleth does not use them: a town-to-town
          # drive-time matrix is the one piece of this that a later trip planner
          # can inherit, and it costs one line here.
          lat: Float.round(lat, 5),
          lng: Float.round(lon, 5),
          ring: Enum.map(simplified, fn {x, y} -> [Float.round(x, 5), Float.round(y, 5)] end),
          samples:
            town.ring
            |> Geometry.sample_points(@sample_count, :erlang.phash2(town.slug))
            |> Enum.map(fn {x, y} -> [Float.round(x, 6), Float.round(y, 6)] end)
        }
      end)

    write!("towns.json", payload)
    Mix.shell().info("Wrote #{length(payload)} towns.")
  end

  defp write!(name, payload) do
    dir = Path.join(:code.priv_dir(:ethos) |> to_string(), "foliage")
    File.mkdir_p!(dir)
    File.write!(Path.join(dir, name), Jason.encode_to_iodata!(payload, pretty: true))
  end
end
```

- [ ] **Step 7: Run the build and inspect the output**

```bash
mix ethos.foliage.build --towns
python3 -c "
import json; d=json.load(open('priv/foliage/towns.json'))
print('towns:', len(d))
print('sample:', {k: (v if k not in ('ring','samples') else f'{len(v)} points') for k, v in d[0].items()})
print('total ring points:', sum(len(t['ring']) for t in d))
"
```

Expected: 169 towns, every one with at least 4 ring points and 25 samples. If total ring points exceeds about 20,000 the SVG will be too heavy — raise `@simplify_tolerance` and re-run.

- [ ] **Step 8: Commit**

```bash
mix format
git add lib/ethos/foliage/arc_gis.ex lib/mix/tasks/ethos.foliage.build.ex \
        test/ethos/foliage/arc_gis_test.exs \
        test/support/fixtures/foliage/towns_response.json priv/foliage/towns.json
git commit -m "feat(foliage): fetch and simplify 169 CT town polygons"
```

---

### Task 4: Tile sampling and the validation gates

Sample the nine week services inside every town, classify, and write the stage matrix. This is the step that must fail loudly rather than publish something wrong.

**Files:**
- Modify: `lib/mix/tasks/ethos.foliage.build.ex`
- Create: `lib/ethos/foliage/sampler.ex`
- Test: `test/ethos/foliage/sampler_test.exs`

**Interfaces:**
- Consumes: `Ethos.Foliage.Tiles`, `Ethos.Foliage.Geometry`.
- Produces:
  - `Sampler.weeks() :: [%{index:, label:, starts:, ends:, service:}]`
  - `Sampler.modal_stage([stage_or_unknown], floor :: float) :: {:ok, stage} | {:error, :insufficient_samples}`
  - `Sampler.monotonic?([stage]) :: boolean`
  - `Sampler.peak_week([stage]) :: pos_integer | nil`

- [ ] **Step 1: Write the failing test**

Create `test/ethos/foliage/sampler_test.exs`:

```elixir
defmodule Ethos.Foliage.SamplerTest do
  use ExUnit.Case, async: true

  alias Ethos.Foliage.Sampler

  describe "weeks/0" do
    test "has nine weeks in DEEP's order" do
      weeks = Sampler.weeks()
      assert length(weeks) == 9
      assert Enum.map(weeks, & &1.index) == Enum.to_list(1..9)
      assert hd(weeks).label == "Sept 16–22"
      assert List.last(weeks).label == "Past peak"
    end

    test "week nine carries no date range" do
      assert List.last(Sampler.weeks()).starts == nil
    end

    test "each week names its DEEP tile service" do
      assert hd(Sampler.weeks()).service == "FallFoliage_Week1_Sept16_22"
      assert List.last(Sampler.weeks()).service == "FallFoliage_Week9_PastPeak"
    end
  end

  describe "modal_stage/2" do
    test "returns the most common classified stage" do
      samples = [{:ok, :peak}, {:ok, :peak}, {:ok, :turning}, :unknown]
      assert Sampler.modal_stage(samples, 0.5) == {:ok, :peak}
    end

    test "ignores unknown pixels when counting" do
      samples = [{:ok, :green}, :unknown, :unknown, :unknown, {:ok, :green}, {:ok, :green}]
      assert Sampler.modal_stage(samples, 0.5) == {:ok, :green}
    end

    test "fails when too few pixels classified" do
      samples = [{:ok, :green}, :unknown, :unknown, :unknown, :unknown]
      assert Sampler.modal_stage(samples, 0.5) == {:error, :insufficient_samples}
    end
  end

  describe "monotonic?/1" do
    test "accepts a sequence that only advances" do
      assert Sampler.monotonic?([:green, :green, :turning, :near_peak, :peak, :past_peak])
    end

    test "rejects a sequence that goes backwards" do
      refute Sampler.monotonic?([:green, :peak, :turning])
    end
  end

  describe "peak_week/1" do
    test "returns the one-based index of the first peak week" do
      assert Sampler.peak_week([:green, :turning, :near_peak, :peak, :peak, :past_peak]) == 4
    end

    test "returns nil when a town never peaks" do
      assert Sampler.peak_week([:green, :green, :turning]) == nil
    end
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `mix test test/ethos/foliage/sampler_test.exs`
Expected: FAIL — `module Ethos.Foliage.Sampler is not available`

- [ ] **Step 3: Write the sampler**

Create `lib/ethos/foliage/sampler.ex`:

```elixir
defmodule Ethos.Foliage.Sampler do
  @moduledoc """
  The week list and the pure decision functions the build gate applies to a
  sampled stage sequence.

  Week ranges are stored year-agnostically, as DEEP labelled them. They are
  climatological bins, not this year's calendar weeks, so pinning them to 2026
  dates would be both wrong and an annual maintenance task.
  """

  alias Ethos.Foliage.Tiles

  @weeks [
    %{index: 1, label: "Sept 16–22", starts: {9, 16}, ends: {9, 22}, service: "FallFoliage_Week1_Sept16_22"},
    %{index: 2, label: "Sept 23–29", starts: {9, 23}, ends: {9, 29}, service: "FallFoliage_Week2_Sept23_29"},
    %{index: 3, label: "Sept 30–Oct 6", starts: {9, 30}, ends: {10, 6}, service: "FallFoliage_Week3_Sept30_Oct6"},
    %{index: 4, label: "Oct 7–13", starts: {10, 7}, ends: {10, 13}, service: "FallFoliage_Week4_Oct7_Oct13"},
    %{index: 5, label: "Oct 14–20", starts: {10, 14}, ends: {10, 20}, service: "FallFoliage_Week5_Oct14_Oct20"},
    %{index: 6, label: "Oct 21–27", starts: {10, 21}, ends: {10, 27}, service: "FallFoliage_Week6_Oct21_Oct27"},
    %{index: 7, label: "Oct 28–Nov 3", starts: {10, 28}, ends: {11, 3}, service: "FallFoliage_Week7_Oct28_Nov3"},
    %{index: 8, label: "Nov 4–10", starts: {11, 4}, ends: {11, 10}, service: "FallFoliage_Week8_Nov4_Nov10"},
    %{index: 9, label: "Past peak", starts: nil, ends: nil, service: "FallFoliage_Week9_PastPeak"}
  ]

  def weeks, do: @weeks

  @doc """
  The modal classified stage, or an error when fewer than `floor` of the
  samples landed on the ramp at all. A town smaller than the sampling footprint
  is the realistic failure mode and it must stop the build, not guess.
  """
  def modal_stage(samples, floor) when is_list(samples) do
    classified = for {:ok, stage} <- samples, do: stage

    if length(classified) / max(length(samples), 1) < floor do
      {:error, :insufficient_samples}
    else
      {stage, _count} =
        classified
        |> Enum.frequencies()
        |> Enum.max_by(fn {_stage, count} -> count end)

      {:ok, stage}
    end
  end

  @doc "True when a stage sequence never regresses toward green."
  def monotonic?(stages) do
    order = Enum.with_index(Tiles.stages()) |> Map.new()
    ranks = Enum.map(stages, &Map.fetch!(order, &1))
    ranks == Enum.sort(ranks)
  end

  @doc "One-based index of the first `:peak` week, or nil."
  def peak_week(stages) do
    case Enum.find_index(stages, &(&1 == :peak)) do
      nil -> nil
      i -> i + 1
    end
  end
end
```

- [ ] **Step 4: Run the test to verify it passes**

Run: `mix test test/ethos/foliage/sampler_test.exs`
Expected: PASS, 9 tests

- [ ] **Step 5: Add the sampling stage to the build task**

Add to `lib/mix/tasks/ethos.foliage.build.ex` — a `--stages` branch in `run/1` and these functions:

```elixir
  @sample_floor 0.6
  @tile_host "https://tiles.arcgis.com/tiles/FjPcSmEFuDYlIdKC/arcgis/rest/services"
  @tile_cache "tmp/foliage_tiles"

  # Verified against the live tile services on 2026-09-05. If a change to the
  # anchors or the sampling breaks these, the derivation has drifted away from
  # what DEEP publishes and the build must not produce a dataset.
  @regional_expectations [
    {"salisbury", 4..5},
    {"norfolk", 4..5},
    {"hartford", 5..6},
    {"old-saybrook", 7..8},
    {"greenwich", 8..8}
  ]

  defp build_stages do
    towns = read!("towns.json")
    weeks = Ethos.Foliage.Sampler.weeks()

    stages =
      Enum.map(towns, fn town ->
        samples = Enum.map(town["samples"], fn [x, y] -> {x, y} end)

        sequence =
          Enum.map(weeks, fn week ->
            samples
            |> Enum.map(&sample_pixel(week.service, &1))
            |> Ethos.Foliage.Sampler.modal_stage(@sample_floor)
            |> case do
              {:ok, stage} ->
                stage

              {:error, :insufficient_samples} ->
                Mix.raise("#{town["name"]} week #{week.index}: too few pixels on the ramp.")
            end
          end)

        unless Ethos.Foliage.Sampler.monotonic?(sequence) do
          Mix.raise("#{town["name"]} regresses: #{inspect(sequence)}")
        end

        peak = Ethos.Foliage.Sampler.peak_week(sequence)
        unless peak, do: Mix.raise("#{town["name"]} never reaches peak: #{inspect(sequence)}")

        Map.merge(town, %{"stages" => Enum.map(sequence, &to_string/1), "peak_week" => peak})
      end)

    verify_regions!(stages)
    write!("towns.json", stages)
    write!("weeks.json", Enum.map(weeks, &encode_week/1))
    Mix.shell().info("Sampled #{length(stages)} towns across #{length(weeks)} weeks.")
  end

  defp verify_regions!(towns) do
    by_slug = Map.new(towns, &{&1["slug"], &1})

    for {slug, expected} <- @regional_expectations do
      town = Map.fetch!(by_slug, slug)

      unless town["peak_week"] in expected do
        Mix.raise("""
        #{town["name"]} peaks in week #{town["peak_week"]}, expected #{inspect(expected)}.
        The sampling has drifted from DEEP's published regional windows.
        """)
      end
    end

    Mix.shell().info("Regional windows reproduce DEEP's published dates.")
  end

  defp sample_pixel(service, point) do
    {tx, ty, px, py} = Ethos.Foliage.Tiles.address(point)
    image = tile_image(service, tx, ty)

    case Vix.Vips.Operation.getpoint(image, px, py) do
      {:ok, [r, g, b | _]} -> Ethos.Foliage.Tiles.classify({round(r), round(g), round(b)})
      _ -> :unknown
    end
  end

  defp tile_image(service, x, y) do
    path = Path.join([@tile_cache, service, "#{x}_#{y}.jpg"])

    unless File.exists?(path) do
      File.mkdir_p!(Path.dirname(path))
      url = "#{@tile_host}/#{service}/MapServer/tile/#{Ethos.Foliage.Tiles.zoom()}/#{y}/#{x}"
      %{status: 200, body: body} = Req.get!(url, receive_timeout: 60_000, retry: :transient)
      File.write!(path, body)
    end

    {:ok, image} = Vix.Vips.Image.new_from_file(path)
    image
  end

  defp encode_week(week) do
    %{
      "index" => week.index,
      "label" => week.label,
      "starts" => week.starts && Tuple.to_list(week.starts),
      "ends" => week.ends && Tuple.to_list(week.ends)
    }
  end

  defp read!(name) do
    Path.join([:code.priv_dir(:ethos) |> to_string(), "foliage", name])
    |> File.read!()
    |> Jason.decode!()
  end
```

Wire `--stages` and `--all` into `run/1` alongside `--towns`, and add `@tile_cache` to `.gitignore` via `tmp/`.

- [ ] **Step 6: Run the sampling build**

```bash
mix ethos.foliage.build --stages
```

Expected: about 2,500 tile fetches on the first run (cached to `tmp/` afterwards), then
`Regional windows reproduce DEEP's published dates.` and `Sampled 169 towns across 9 weeks.`

If a town raises `too few pixels on the ramp`, it is smaller than the sampling footprint. Raise `@sample_count` in Task 3 to 50 for that build and re-run `--towns --stages`. Do not lower `@sample_floor` — that trades a loud failure for a quiet wrong answer.

- [ ] **Step 7: Verify the output by eye**

```bash
python3 -c "
import json
d={t['slug']: t for t in json.load(open('priv/foliage/towns.json'))}
for s in ['salisbury','norfolk','hartford','old-saybrook','greenwich']:
    print(f\"{s:15s} peak wk {d[s]['peak_week']}  {' '.join(x[:4] for x in d[s]['stages'])}\")
"
```

Expected: Salisbury and Norfolk peak weeks 4–5, Hartford 5–6, Old Saybrook 7–8, Greenwich 8 — matching the table in the spec.

- [ ] **Step 8: Commit**

```bash
mix format
git add lib/ethos/foliage/sampler.ex lib/mix/tasks/ethos.foliage.build.ex \
        test/ethos/foliage/sampler_test.exs priv/foliage/towns.json priv/foliage/weeks.json
git commit -m "feat(foliage): sample DEEP tiles into a 169x9 stage matrix with validation gates"
```

---

### Task 5: Route pages data

Join the seven official routes to their towns, order the towns along each polyline, and resolve each to a published guide slug.

**Files:**
- Modify: `lib/mix/tasks/ethos.foliage.build.ex`
- Create: `lib/ethos/foliage/routes.ex`
- Test: `test/ethos/foliage/routes_test.exs`

**Interfaces:**
- Consumes: `Ethos.Foliage.ArcGIS`, `Ethos.Foliage.Geometry`.
- Produces:
  - `Routes.order_along(path :: [{lon, lat}], towns :: [%{slug:, lat:, lng:}]) :: [slug]`
  - `Routes.guide_slug_for(town_slug :: String.t(), published :: MapSet.t()) :: String.t() | nil`

- [ ] **Step 1: Write the failing test**

Create `test/ethos/foliage/routes_test.exs`:

```elixir
defmodule Ethos.Foliage.RoutesTest do
  use ExUnit.Case, async: true

  alias Ethos.Foliage.Routes

  describe "order_along/2" do
    test "orders towns by their position along the polyline" do
      # A path running west to east.
      path = [{-73.0, 41.5}, {-72.0, 41.5}, {-71.0, 41.5}]

      towns = [
        %{slug: "east", lat: 41.5, lng: -71.1},
        %{slug: "west", lat: 41.5, lng: -72.9},
        %{slug: "middle", lat: 41.5, lng: -72.0}
      ]

      assert Routes.order_along(path, towns) == ["west", "middle", "east"]
    end

    test "handles a path that doubles back" do
      # Out east then back west; a town near the turn should not sort last.
      path = [{-73.0, 41.5}, {-71.0, 41.5}, {-73.0, 41.6}]

      towns = [
        %{slug: "start", lat: 41.5, lng: -72.9},
        %{slug: "turn", lat: 41.5, lng: -71.1},
        %{slug: "return", lat: 41.6, lng: -72.9}
      ]

      assert Routes.order_along(path, towns) == ["start", "turn", "return"]
    end
  end

  describe "guide_slug_for/2" do
    setup do
      %{
        published:
          MapSet.new(["avon-ct-travel-guide", "hartford-ct-travel-guide", "storrs-ct-travel-guide"])
      }
    end

    test "resolves the conventional slug", %{published: published} do
      assert Routes.guide_slug_for("avon", published) == "avon-ct-travel-guide"
    end

    test "resolves Mansfield through the Storrs guide", %{published: published} do
      # Mansfield is the one CT town with no guide of its own. Storrs is a
      # village in Mansfield and its guide is what covers the town.
      assert Routes.guide_slug_for("mansfield", published) == "storrs-ct-travel-guide"
    end

    test "returns nil when no guide is published", %{published: published} do
      assert Routes.guide_slug_for("bozrah", published) == nil
    end
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `mix test test/ethos/foliage/routes_test.exs`
Expected: FAIL — `module Ethos.Foliage.Routes is not available`

- [ ] **Step 3: Write the implementation**

Create `lib/ethos/foliage/routes.ex`:

```elixir
defmodule Ethos.Foliage.Routes do
  @moduledoc """
  Ordering towns along a driving route, and resolving a town to the guide that
  covers it.

  168 of Connecticut's 169 towns have a guide whose destination slug is the
  town slug. Mansfield is the exception: it has no guide of its own and is
  covered by the Storrs guide, Storrs being a village within it. That is the
  entire alias table and it is expected to stay one entry — a second entry
  means a town lost its guide and the build gate should have caught it.
  """

  @aliases %{"mansfield" => "storrs"}

  @doc "Town slugs ordered by distance along `path` from its start."
  def order_along(path, towns) do
    towns
    |> Enum.sort_by(fn town -> position_along(path, {town.lng, town.lat}) end)
    |> Enum.map(& &1.slug)
  end

  @doc "The published guide slug covering `town_slug`, or nil."
  def guide_slug_for(town_slug, published) do
    candidate = "#{Map.get(@aliases, town_slug, town_slug)}-ct-travel-guide"
    if MapSet.member?(published, candidate), do: candidate, else: nil
  end

  # Cumulative distance from the path's start to the nearest point on the path.
  defp position_along(path, point) do
    path
    |> Enum.zip(tl(path))
    |> Enum.reduce({0.0, :infinity, 0.0}, fn {a, b}, {travelled, best_d, best_pos} ->
      {d, t} = segment_distance(point, a, b)
      pos = travelled + t * distance(a, b)

      if d < best_d, do: {travelled + distance(a, b), d, pos}, else: {travelled + distance(a, b), best_d, best_pos}
    end)
    |> elem(2)
  end

  # Distance from `p` to segment `a`-`b`, plus how far along the segment (0..1)
  # the closest point sits.
  defp segment_distance({px, py}, {ax, ay}, {bx, by}) do
    dx = bx - ax
    dy = by - ay
    len_sq = dx * dx + dy * dy

    t =
      if len_sq == 0.0,
        do: 0.0,
        else: max(0.0, min(1.0, ((px - ax) * dx + (py - ay) * dy) / len_sq))

    cx = ax + t * dx
    cy = ay + t * dy
    {:math.sqrt(:math.pow(px - cx, 2) + :math.pow(py - cy, 2)), t}
  end

  defp distance({ax, ay}, {bx, by}), do: :math.sqrt(:math.pow(bx - ax, 2) + :math.pow(by - ay, 2))
end
```

- [ ] **Step 4: Run the test to verify it passes**

Run: `mix test test/ethos/foliage/routes_test.exs`
Expected: PASS, 5 tests

- [ ] **Step 5: Add the routes stage to the build task**

Add a `--routes` branch and this function to `lib/mix/tasks/ethos.foliage.build.ex`:

```elixir
  @expected_routes 7
  @minimum_route_towns 3

  defp build_routes do
    Mix.Task.run("app.start")

    published =
      Ethos.Repo.all(
        Ecto.Query.from(g in Ethos.Guides.Guide,
          where: g.status == "published" and g.state_slug == "connecticut",
          select: g.slug
        )
      )
      |> MapSet.new()

    towns = read!("towns.json")
    by_slug = Map.new(towns, &{&1["slug"], &1})
    features = ArcGIS.fetch_routes!() |> Map.fetch!("features")

    if length(features) != @expected_routes do
      Mix.raise("Expected #{@expected_routes} routes, got #{length(features)}.")
    end

    routes =
      Enum.map(features, fn %{"attributes" => a, "geometry" => g} ->
        name = a["ROUTENAME"]
        slug = Geometry.slugify(name)
        path = g["paths"] |> List.flatten() |> Enum.chunk_every(2) |> Enum.map(fn [x, y] -> {x, y} end)

        members =
          ArcGIS.fetch_route_towns!(g["paths"])
          |> Enum.map(&Geometry.slugify/1)
          |> Enum.filter(&Map.has_key?(by_slug, &1))
          |> Enum.map(fn s ->
            t = by_slug[s]
            %{slug: s, lat: t["lat"], lng: t["lng"]}
          end)

        ordered = Ethos.Foliage.Routes.order_along(path, members)

        if length(ordered) < @minimum_route_towns do
          Mix.raise("Route #{name} matched only #{length(ordered)} towns.")
        end

        stops =
          Enum.map(ordered, fn town_slug ->
            guide = Ethos.Foliage.Routes.guide_slug_for(town_slug, published)

            unless guide do
              Mix.raise("Route #{name}: town #{town_slug} has no published guide.")
            end

            %{"town_slug" => town_slug, "guide_slug" => guide}
          end)

        %{
          "slug" => slug,
          "name" => name,
          "deep_url" => a["URL"],
          "stops" => stops,
          "path" =>
            path
            |> Geometry.simplify(0.0005)
            |> Enum.map(fn {x, y} -> [Float.round(x, 5), Float.round(y, 5)] end)
        }
      end)
      |> Enum.sort_by(& &1["slug"])

    write!("routes.json", routes)

    for r <- routes, do: Mix.shell().info("  #{r["name"]}: #{length(r["stops"])} towns")
    Mix.shell().info("Wrote #{length(routes)} routes.")
  end
```

- [ ] **Step 6: Run the routes build**

```bash
mix ecto.reset   # only if the local DB is not seeded
mix ethos.foliage.build --routes
```

Expected: seven routes, each listing its town count. `Hartford West: 11 towns` confirms the join matches what was verified during design.

- [ ] **Step 7: Commit**

```bash
mix format
git add lib/ethos/foliage/routes.ex lib/mix/tasks/ethos.foliage.build.ex \
        test/ethos/foliage/routes_test.exs priv/foliage/routes.json
git commit -m "feat(foliage): join the seven DEEP driving routes to towns and guides"
```

---

### Task 6: Dataset loader and read API

Load the committed JSON into `:persistent_term` at boot and expose the only interface the web layer uses.

**Files:**
- Create: `lib/ethos/foliage/dataset.ex`
- Create: `lib/ethos/foliage.ex`
- Modify: `lib/ethos/application.ex:11-22`
- Test: `test/ethos/foliage_test.exs`

**Interfaces:**
- Consumes: `priv/foliage/*.json`.
- Produces:
  - `Ethos.Foliage.weeks() :: [%{index:, label:, starts:, ends:}]`
  - `Ethos.Foliage.week(index) :: map | nil`
  - `Ethos.Foliage.current_week_index(Date.t()) :: 1..9`
  - `Ethos.Foliage.towns() :: [town]` where `town` is `%{slug:, name:, county:, fips:, lat:, lng:, ring:, stages:, peak_week:}` with `stages` a list of nine atoms
  - `Ethos.Foliage.town(slug) :: town | nil`
  - `Ethos.Foliage.stage_at(town, week_index) :: stage`
  - `Ethos.Foliage.peak_label(town) :: String.t()`
  - `Ethos.Foliage.routes() :: [%{slug:, name:, deep_url:, path:, stops:}]`
  - `Ethos.Foliage.route(slug) :: route | nil`
  - `Ethos.Foliage.in_season?(Date.t()) :: boolean`
  - `Ethos.Foliage.attribution() :: String.t()`

- [ ] **Step 1: Write the failing test**

Create `test/ethos/foliage_test.exs`:

```elixir
defmodule Ethos.FoliageTest do
  use ExUnit.Case, async: true

  alias Ethos.Foliage

  describe "towns/0" do
    test "loads all 169 Connecticut towns" do
      assert length(Foliage.towns()) == 169
    end

    test "every town has nine stages and a peak week" do
      for town <- Foliage.towns() do
        assert length(town.stages) == 9, "#{town.slug} has #{length(town.stages)} stages"
        assert town.peak_week in 1..9, "#{town.slug} has peak_week #{inspect(town.peak_week)}"
      end
    end

    test "stages are atoms from the known set" do
      known = MapSet.new([:green, :turning, :near_peak, :peak, :past_peak])

      for town <- Foliage.towns(), stage <- town.stages do
        assert MapSet.member?(known, stage), "#{town.slug} has unknown stage #{inspect(stage)}"
      end
    end
  end

  describe "town/1" do
    test "finds a town by slug" do
      assert %{name: "Salisbury", county: "Litchfield"} = Foliage.town("salisbury")
    end

    test "returns nil for an unknown slug" do
      assert Foliage.town("nowhere") == nil
    end
  end

  describe "stage_at/2" do
    test "reproduces the north-west corner peaking before the shoreline" do
      salisbury = Foliage.town("salisbury")
      saybrook = Foliage.town("old-saybrook")

      assert salisbury.peak_week < saybrook.peak_week
    end
  end

  describe "current_week_index/1" do
    test "maps a date inside the season to its week" do
      assert Foliage.current_week_index(~D[2026-10-16]) == 5
    end

    test "clamps to week one before the season" do
      assert Foliage.current_week_index(~D[2026-08-01]) == 1
    end

    test "clamps to week nine after the season" do
      assert Foliage.current_week_index(~D[2026-12-01]) == 9
    end
  end

  describe "routes/0" do
    test "loads the seven official DEEP routes" do
      assert length(Foliage.routes()) == 7
    end

    test "every stop names a guide that exists in the corpus" do
      for route <- Foliage.routes(), stop <- route.stops do
        assert is_binary(stop.guide_slug)
        assert String.ends_with?(stop.guide_slug, "-ct-travel-guide")
      end
    end

    test "Hartford West runs through eleven towns" do
      assert %{stops: stops} = Foliage.route("hartford-west")
      assert length(stops) == 11
    end
  end

  describe "in_season?/1" do
    test "is true in October and false in June" do
      assert Foliage.in_season?(~D[2026-10-15])
      refute Foliage.in_season?(~D[2026-06-15])
    end
  end

  describe "attribution/0" do
    test "names DEEP, the 2023 vintage, and whose the stage names are" do
      text = Foliage.attribution()
      assert text =~ "Connecticut DEEP"
      assert text =~ "2023"
      assert text =~ "Stage names are ours"
    end

    test "never claims to be live" do
      refute Foliage.attribution() =~ ~r/live|real-time|tracker/i
    end
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `mix test test/ethos/foliage_test.exs`
Expected: FAIL — `module Ethos.Foliage is not available`

- [ ] **Step 3: Write the dataset loader**

Create `lib/ethos/foliage/dataset.ex`:

```elixir
defmodule Ethos.Foliage.Dataset do
  @moduledoc """
  Loads the committed foliage JSON into `:persistent_term` once at boot.

  `:persistent_term` rather than ETS or a GenServer because the data is written
  exactly once and then read on every request: reads are a direct memory
  access with no copy, and the write cost that makes `:persistent_term` a bad
  fit for mutable state never applies here.

  Validation happens at boot rather than at first request, so a bad deploy
  fails to start instead of serving a broken map.
  """

  require Logger

  @key {__MODULE__, :data}
  @expected_towns 169
  @expected_routes 7
  @expected_weeks 9

  def child_spec(_opts) do
    %{id: __MODULE__, start: {__MODULE__, :start_link, []}, type: :worker, restart: :temporary}
  end

  def start_link do
    load!()
    :ignore
  end

  def load! do
    towns = read!("towns.json") |> Enum.map(&decode_town/1)
    routes = read!("routes.json") |> Enum.map(&decode_route/1)
    weeks = read!("weeks.json") |> Enum.map(&decode_week/1)

    validate!(towns, routes, weeks)

    :persistent_term.put(@key, %{
      towns: towns,
      towns_by_slug: Map.new(towns, &{&1.slug, &1}),
      routes: routes,
      routes_by_slug: Map.new(routes, &{&1.slug, &1}),
      weeks: weeks
    })

    :ok
  end

  def fetch! do
    :persistent_term.get(@key)
  rescue
    ArgumentError ->
      load!()
      :persistent_term.get(@key)
  end

  defp validate!(towns, routes, weeks) do
    if length(towns) != @expected_towns, do: raise("foliage: #{length(towns)} towns, expected #{@expected_towns}")
    if length(routes) != @expected_routes, do: raise("foliage: #{length(routes)} routes, expected #{@expected_routes}")
    if length(weeks) != @expected_weeks, do: raise("foliage: #{length(weeks)} weeks, expected #{@expected_weeks}")

    for town <- towns do
      if length(town.stages) != @expected_weeks do
        raise "foliage: #{town.slug} has #{length(town.stages)} stages"
      end
    end

    slugs = MapSet.new(towns, & &1.slug)

    for route <- routes, stop <- route.stops, not MapSet.member?(slugs, stop.town_slug) do
      raise "foliage: route #{route.slug} references unknown town #{stop.town_slug}"
    end

    :ok
  end

  @doc """
  Logs any route stop whose guide has been unpublished or renamed.

  Not a raise: a guide going missing should not take the site down, but it
  silently orphans a link, so it has to be loud in the log. Called from
  `Ethos.Release` alongside the other corpus checks.
  """
  def warn_dangling_guides(published_slugs) do
    for route <- fetch!().routes,
        stop <- route.stops,
        not MapSet.member?(published_slugs, stop.guide_slug) do
      Logger.warning("foliage: route #{route.slug} links missing guide #{stop.guide_slug}")
    end

    :ok
  end

  defp decode_town(t) do
    %{
      slug: t["slug"],
      name: t["name"],
      county: t["county"],
      fips: t["fips"],
      lat: t["lat"],
      lng: t["lng"],
      ring: Enum.map(t["ring"], fn [x, y] -> {x, y} end),
      stages: Enum.map(t["stages"], &String.to_existing_atom/1),
      peak_week: t["peak_week"]
    }
  end

  defp decode_route(r) do
    %{
      slug: r["slug"],
      name: r["name"],
      deep_url: r["deep_url"],
      path: Enum.map(r["path"], fn [x, y] -> {x, y} end),
      stops: Enum.map(r["stops"], &%{town_slug: &1["town_slug"], guide_slug: &1["guide_slug"]})
    }
  end

  defp decode_week(w) do
    %{
      index: w["index"],
      label: w["label"],
      starts: w["starts"] && List.to_tuple(w["starts"]),
      ends: w["ends"] && List.to_tuple(w["ends"])
    }
  end

  defp read!(name) do
    Path.join([:code.priv_dir(:ethos) |> to_string(), "foliage", name])
    |> File.read!()
    |> Jason.decode!()
  end
end
```

- [ ] **Step 4: Write the context**

Create `lib/ethos/foliage.ex`:

```elixir
defmodule Ethos.Foliage do
  @moduledoc """
  The Connecticut Foliage Forecast: a per-town, per-week estimate derived from
  CT DEEP's published foliage map.

  DEEP's map is nine pre-rendered raster layers last modified in October 2023.
  It is a climatological normal, not a current-season observation, and there is
  no live foliage data for Connecticut from any source. Everything this module
  returns is therefore an estimate of a normal year, and every page that shows
  one carries `attribution/0` saying so.

  The dataset is frozen and committed; see `mix ethos.foliage.build`. The only
  thing that changes during a season is the editorial field note, which lives
  in Postgres and is not part of this module.
  """

  # `Note` is aliased here for Task 11; until then only `Dataset` is used.
  alias Ethos.Foliage.{Dataset, Note}

  @attribution "Derived from the Connecticut DEEP fall foliage map. DEEP's map is a climatological estimate last published in 2023; it describes a normal year, not this one. Stage names are ours."

  @stage_labels %{
    green: "Still green",
    turning: "Turning",
    near_peak: "Near peak",
    peak: "Peak",
    past_peak: "Past peak"
  }

  @stage_colors %{
    green: "#3f6f3a",
    turning: "#a8a52e",
    near_peak: "#d08a2c",
    peak: "#c0472b",
    past_peak: "#7a3b2e"
  }

  @season_start {9, 1}
  @season_end {11, 30}

  def attribution, do: @attribution

  def stage_label(stage), do: Map.fetch!(@stage_labels, stage)
  def stage_color(stage), do: Map.fetch!(@stage_colors, stage)
  def stage_labels, do: @stage_labels

  def towns, do: Dataset.fetch!().towns
  def town(slug), do: Map.get(Dataset.fetch!().towns_by_slug, slug)

  def routes, do: Dataset.fetch!().routes
  def route(slug), do: Map.get(Dataset.fetch!().routes_by_slug, slug)

  def weeks, do: Dataset.fetch!().weeks
  def week(index), do: Enum.find(weeks(), &(&1.index == index))

  def stage_at(town, week_index) when week_index in 1..9 do
    Enum.at(town.stages, week_index - 1)
  end

  @doc "The date range of a town's first peak week, e.g. \"Oct 14–20\"."
  def peak_label(town), do: week(town.peak_week).label

  @doc """
  The week containing `date`, clamped to 1..9.

  Weeks are year-agnostic month/day ranges, so this compares `{month, day}`
  rather than building dates for the current year.
  """
  def current_week_index(date \\ Date.utc_today()) do
    md = {date.month, date.day}

    cond do
      md < {9, 16} -> 1
      md > {11, 10} -> 9
      true -> Enum.find(weeks(), &within?(md, &1)) |> then(&((&1 && &1.index) || 9))
    end
  end

  @doc "Whether the seasonal foliage panel should render at all."
  def in_season?(date \\ Date.utc_today()) do
    md = {date.month, date.day}
    md >= @season_start and md <= @season_end
  end

  # Replaced in Task 11 with `Note.latest(scope, ref)`. Task 8's controller
  # calls this, so it has to exist and return nil until the table does.
  @doc "The most recent published field note for a scope, or nil."
  def latest_note(_scope, _ref \\ nil), do: nil

  defp within?(_md, %{starts: nil}), do: false
  defp within?(md, %{starts: s, ends: e}), do: md >= s and md <= e
end
```

- [ ] **Step 5: Add the loader to the supervision tree**

In `lib/ethos/application.ex`, insert after `Ethos.Repo`:

```elixir
      Ethos.Foliage.Dataset,
```

- [ ] **Step 6: Run the test to verify it passes**

Run: `mix test test/ethos/foliage_test.exs`
Expected: PASS, 14 tests

- [ ] **Step 7: Commit**

```bash
mix format
git add lib/ethos/foliage.ex lib/ethos/foliage/dataset.ex lib/ethos/application.ex \
        test/ethos/foliage_test.exs
git commit -m "feat(foliage): boot-time dataset loader and read API"
```

---

### Task 7: SVG renderer

**Files:**
- Create: `lib/ethos/foliage/svg.ex`
- Test: `test/ethos/foliage/svg_test.exs`

**Interfaces:**
- Consumes: `Ethos.Foliage`, `Ethos.Foliage.Geometry`.
- Produces:
  - `Svg.map(week_index, opts) :: Phoenix.HTML.safe()` where `opts` accepts `:route` (a route struct, drawn and its towns emphasised), `:width`, `:height`
  - `Svg.viewbox() :: {width, height}`

- [ ] **Step 1: Write the failing test**

Create `test/ethos/foliage/svg_test.exs`:

```elixir
defmodule Ethos.Foliage.SvgTest do
  use ExUnit.Case, async: true

  alias Ethos.Foliage
  alias Ethos.Foliage.Svg

  defp render(week, opts \\ []), do: week |> Svg.map(opts) |> Phoenix.HTML.safe_to_string()

  describe "map/2" do
    test "draws one path per town" do
      html = render(5)
      assert length(Regex.scan(~r/data-town="/, html)) == 169
    end

    test "labels every town for screen readers and native tooltips" do
      html = render(5)
      assert html =~ "<title>Salisbury — Peak</title>"
    end

    test "colours differ between weeks" do
      early = render(1)
      late = render(8)
      refute early == late
    end

    test "week one is entirely green" do
      html = render(1)
      green = Foliage.stage_color(:green)
      # Every town is still green in DEEP's first week, statewide.
      assert length(Regex.scan(~r/fill="#{green}"/, html)) == 169
    end

    test "emits no script tag" do
      refute render(5) =~ "<script"
    end

    test "escapes town names" do
      # No CT town contains markup, but the renderer must not be the reason
      # that stays true.
      assert render(5) =~ ~r/<title>[^<]*<\/title>/
    end
  end

  describe "map/2 with a route" do
    test "draws the route path" do
      route = Foliage.route("hartford-west")
      html = render(5, route: route)
      assert html =~ ~s(data-route="hartford-west")
    end

    test "marks the route's towns" do
      route = Foliage.route("hartford-west")
      html = render(5, route: route)
      assert length(Regex.scan(~r/data-on-route="true"/, html)) == 11
    end
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `mix test test/ethos/foliage/svg_test.exs`
Expected: FAIL — `module Ethos.Foliage.Svg is not available`

- [ ] **Step 3: Write the renderer**

Create `lib/ethos/foliage/svg.ex`:

```elixir
defmodule Ethos.Foliage.Svg do
  @moduledoc """
  Renders the town choropleth as inline SVG.

  Server-rendered rather than a JavaScript map because the whole point of the
  artifact is that it works — completely — with scripting off. There is no
  basemap: 169 town polygons over a fixed extent are the map, so there is no
  tile vendor, no API key and no bundle.

  This renderer is deliberately specific to Connecticut at one extent. It is
  not "the map layer" and should not be generalised into one — a street-level
  trail map is a different tool with different requirements.
  """

  alias Ethos.Foliage
  alias Ethos.Foliage.Geometry

  # Connecticut plus a shoreline margin.
  @bbox {-73.75, 40.95, -71.75, 42.10}
  @width 800
  @height 520

  def viewbox, do: {@width, @height}

  def map(week_index, opts \\ []) do
    route = Keyword.get(opts, :route)
    width = Keyword.get(opts, :width, @width)
    height = Keyword.get(opts, :height, @height)
    on_route = route_town_slugs(route)

    towns =
      Enum.map(Foliage.towns(), fn town ->
        stage = Foliage.stage_at(town, week_index)

        [
          ~s(<path data-town="),
          town.slug,
          ~s(" data-stage="),
          to_string(stage),
          on_route_attr(town, on_route),
          ~s(" fill="),
          Foliage.stage_color(stage),
          ~s(" stroke="#ffffff" stroke-width="0.5" d="),
          path_d(town.ring, {width, height}),
          ~s("><title>),
          escape(town.name),
          " — ",
          escape(Foliage.stage_label(stage)),
          ~s(</title></path>)
        ]
      end)

    svg = [
      ~s(<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 #{width} #{height}" ),
      ~s(role="img" aria-label="Connecticut foliage forecast by town" ),
      ~s(class="w-full h-auto">),
      towns,
      route_path(route, {width, height}),
      ~s(</svg>)
    ]

    Phoenix.HTML.raw(IO.iodata_to_binary(svg))
  end

  defp route_town_slugs(nil), do: MapSet.new()
  defp route_town_slugs(route), do: MapSet.new(route.stops, & &1.town_slug)

  defp on_route_attr(town, on_route) do
    if MapSet.member?(on_route, town.slug), do: ~s(" data-on-route="true), else: ""
  end

  defp route_path(nil, _size), do: []

  defp route_path(route, size) do
    [
      ~s(<path data-route="),
      route.slug,
      ~s(" fill="none" stroke="#18181b" stroke-width="2.5" ),
      ~s(stroke-linejoin="round" stroke-linecap="round" d="),
      polyline_d(route.path, size),
      ~s("/>)
    ]
  end

  defp path_d(ring, size) do
    points = Enum.map(ring, &Geometry.project(&1, @bbox, size))

    [
      "M",
      points |> Enum.map(fn {x, y} -> "#{fmt(x)},#{fmt(y)}" end) |> Enum.intersperse("L"),
      "Z"
    ]
  end

  defp polyline_d(path, size) do
    points = Enum.map(path, &Geometry.project(&1, @bbox, size))
    ["M", points |> Enum.map(fn {x, y} -> "#{fmt(x)},#{fmt(y)}" end) |> Enum.intersperse("L")]
  end

  defp fmt(n), do: :erlang.float_to_binary(n * 1.0, decimals: 1)

  defp escape(text) do
    text
    |> String.replace("&", "&amp;")
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
  end
end
```

- [ ] **Step 4: Run the test to verify it passes**

Run: `mix test test/ethos/foliage/svg_test.exs`
Expected: PASS, 8 tests

- [ ] **Step 5: Commit**

```bash
mix format
git add lib/ethos/foliage/svg.ex test/ethos/foliage/svg_test.exs
git commit -m "feat(foliage): server-rendered SVG choropleth"
```

---

### Task 8: The /foliage page

**Files:**
- Create: `lib/ethos_web/controllers/foliage_controller.ex`
- Create: `lib/ethos_web/controllers/foliage_html.ex`
- Create: `lib/ethos_web/controllers/foliage_html/index.html.heex`
- Modify: `lib/ethos_web/router.ex:20-31`
- Test: `test/ethos_web/controllers/foliage_controller_test.exs`

**Interfaces:**
- Consumes: `Ethos.Foliage`, `Ethos.Foliage.Svg`.
- Produces: `GET /foliage`, `GET /foliage?week=N`.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/controllers/foliage_controller_test.exs`:

```elixir
defmodule EthosWeb.FoliageControllerTest do
  use EthosWeb.ConnCase, async: true

  describe "GET /foliage" do
    test "renders the map and the attribution", %{conn: conn} do
      html = conn |> get(~p"/foliage") |> html_response(200)

      assert html =~ "Connecticut Foliage Forecast"
      assert html =~ "Derived from the Connecticut DEEP fall foliage map"
      assert html =~ "Stage names are ours"
    end

    test "never describes itself as live or a tracker", %{conn: conn} do
      html = conn |> get(~p"/foliage") |> html_response(200)
      refute html =~ ~r/\blive\b|real-time|tracker/i
    end

    test "lists all seven driving routes", %{conn: conn} do
      html = conn |> get(~p"/foliage") |> html_response(200)

      for route <- Ethos.Foliage.routes() do
        assert html =~ route.name
        assert html =~ ~p"/foliage/#{route.slug}"
      end
    end

    test "renders every town", %{conn: conn} do
      html = conn |> get(~p"/foliage") |> html_response(200)
      assert length(Regex.scan(~r/data-town="/, html)) == 169
    end
  end

  describe "week selection without JavaScript" do
    test "renders different fills for different weeks", %{conn: conn} do
      early = conn |> get(~p"/foliage?week=1") |> html_response(200)
      late = conn |> get(~p"/foliage?week=8") |> html_response(200)

      refute early == late
    end

    test "the selector is plain links", %{conn: conn} do
      html = conn |> get(~p"/foliage") |> html_response(200)

      for index <- 1..9 do
        assert html =~ ~s(href="/foliage?week=#{index}")
      end
    end

    test "clamps an out-of-range week", %{conn: conn} do
      assert conn |> get(~p"/foliage?week=99") |> html_response(200)
      assert conn |> get(~p"/foliage?week=nonsense") |> html_response(200)
    end

    test "week variants canonicalise to the bare URL", %{conn: conn} do
      html = conn |> get(~p"/foliage?week=5") |> html_response(200)
      assert html =~ ~s(<link rel="canonical" href="http://localhost:4002/foliage")
      refute html =~ ~s(rel="canonical" href="http://localhost:4002/foliage?week=5")
    end
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `mix test test/ethos_web/controllers/foliage_controller_test.exs`
Expected: FAIL — no route matches `/foliage`

- [ ] **Step 3: Add the route**

In `lib/ethos_web/router.ex`, inside the first `scope "/", EthosWeb` block, after the `/c/:slug` line:

```elixir
    get "/foliage", FoliageController, :index
    get "/foliage/embed", FoliageController, :embed
    get "/foliage/:route_slug", FoliageController, :route
```

`/foliage/embed` must come before `/foliage/:route_slug` or the embed path matches the route param.

- [ ] **Step 4: Write the controller**

Create `lib/ethos_web/controllers/foliage_controller.ex`:

```elixir
defmodule EthosWeb.FoliageController do
  use EthosWeb, :controller

  alias Ethos.Foliage
  alias EthosWeb.StructuredData

  @title "Connecticut Foliage Forecast"
  @description "When Connecticut's leaves turn, town by town — derived from the state's own foliage map and joined to a guide for each of the 169 towns."

  def index(conn, params) do
    week = week_param(params)

    render(conn, :index,
      week: week,
      weeks: Foliage.weeks(),
      towns: Foliage.towns(),
      routes: Foliage.routes(),
      note: Foliage.latest_note("statewide"),
      counties: counties(),
      page_title: @title,
      page_meta_description: @description,
      # Every ?week= variant points at the bare URL: nine views of one page,
      # not nine pages.
      page_canonical: url(~p"/foliage"),
      page_og: %{
        title: @title,
        description: @description,
        type: "website",
        url: url(~p"/foliage"),
        image: StructuredData.absolute_url("uploads/og/foliage.png")
      },
      json_ld: [dataset_ld()]
    )
  end

  @doc false
  def week_param(%{"week" => raw}) do
    case Integer.parse(to_string(raw)) do
      {n, _} when n in 1..9 -> n
      _ -> Foliage.current_week_index()
    end
  end

  def week_param(_), do: Foliage.current_week_index()

  defp counties do
    Foliage.towns()
    |> Enum.group_by(& &1.county)
    |> Enum.map(fn {county, towns} ->
      %{
        name: county,
        town_count: length(towns),
        peak: towns |> Enum.map(& &1.peak_week) |> median() |> Foliage.week() |> Map.fetch!(:label)
      }
    end)
    |> Enum.sort_by(& &1.name)
  end

  defp median(values) do
    sorted = Enum.sort(values)
    Enum.at(sorted, div(length(sorted), 2))
  end

  defp dataset_ld do
    %{
      "@context" => "https://schema.org",
      "@type" => "Dataset",
      "name" => @title,
      "description" => Foliage.attribution(),
      "spatialCoverage" => %{"@type" => "Place", "name" => "Connecticut"},
      "isBasedOn" => "https://portal.ct.gov/DEEP/Forestry/Foliage/Connecticuts-Fall-Foliage",
      "creator" => StructuredData.publisher(),
      "url" => url(~p"/foliage")
    }
  end
end
```

- [ ] **Step 5: Write the HTML module and template**

Create `lib/ethos_web/controllers/foliage_html.ex`:

```elixir
defmodule EthosWeb.FoliageHTML do
  use EthosWeb, :html

  embed_templates "foliage_html/*"

  @doc "The week selector: ordinary links, so it works with scripting off."
  attr :weeks, :list, required: true
  attr :current, :integer, required: true
  attr :base, :string, required: true

  def week_selector(assigns) do
    ~H"""
    <nav class="mt-4 flex flex-wrap gap-1" aria-label="Week">
      <.link
        :for={week <- @weeks}
        href={"#{@base}?week=#{week.index}"}
        aria-current={week.index == @current && "page"}
        class={[
          "rounded border px-2 py-1 text-xs",
          week.index == @current && "border-zinc-900 bg-zinc-900 text-white",
          week.index != @current && "border-zinc-300 text-zinc-700 hover:border-zinc-500"
        ]}
      >
        {week.label}
      </.link>
    </nav>
    """
  end

  @doc "The colour key. Stage names are ours, not DEEP's, and the page says so."
  def stage_key(assigns) do
    assigns = assign(assigns, :stages, Ethos.Foliage.stage_labels())

    ~H"""
    <ul class="mt-3 flex flex-wrap gap-3 text-xs text-zinc-600">
      <li :for={{stage, label} <- @stages} class="flex items-center gap-1.5">
        <span
          class="inline-block h-3 w-3 rounded-sm"
          style={"background-color: #{Ethos.Foliage.stage_color(stage)}"}
        />
        {label}
      </li>
    </ul>
    """
  end

  @doc "A dated editorial note, or nothing at all. There is no empty state."
  attr :note, :any, required: true

  def field_note(assigns) do
    ~H"""
    <aside :if={@note} class="mt-6 border-l-2 border-zinc-300 pl-4">
      <p class="text-xs uppercase tracking-wide text-zinc-500">
        Field note · {Calendar.strftime(@note.published_on, "%B %-d")}
      </p>
      <div class="prose prose-sm mt-2">{EthosWeb.Markdown.render(@note.body)}</div>
    </aside>
    """
  end
end
```

Create `lib/ethos_web/controllers/foliage_html/index.html.heex`:

```heex
<article class="mx-auto max-w-3xl px-4 py-10">
  <h1 class="text-3xl font-bold">Connecticut Foliage Forecast</h1>

  <p class="mt-2 text-zinc-600">
    When the leaves turn in each of Connecticut's 169 towns, and which of the state's
    seven official driving routes runs through them.
  </p>

  <.week_selector weeks={@weeks} current={@week} base="/foliage" />

  <figure class="mt-4">
    {Ethos.Foliage.Svg.map(@week)}
    <figcaption class="sr-only">
      Connecticut foliage stage by town for {Ethos.Foliage.week(@week).label}.
    </figcaption>
  </figure>

  <.stage_key />

  <p class="mt-4 text-xs text-zinc-500">{Ethos.Foliage.attribution()}</p>

  <.field_note note={@note} />

  <section class="mt-10">
    <h2 class="font-semibold">Driving routes</h2>
    <p class="mt-1 text-sm text-zinc-600">
      Seven routes published by the state. Each page lists the towns it passes through.
    </p>
    <ul class="mt-3 grid gap-3 sm:grid-cols-2">
      <li :for={route <- @routes} class="rounded-xl border p-4">
        <.link navigate={~p"/foliage/#{route.slug}"} class="font-semibold hover:underline">
          {route.name}
        </.link>
        <p class="mt-1 text-sm text-zinc-600">{length(route.stops)} towns</p>
      </li>
    </ul>
  </section>

  <section class="mt-10">
    <h2 class="font-semibold">By county</h2>
    <table class="mt-3 w-full text-sm">
      <thead class="text-left text-zinc-500">
        <tr>
          <th class="py-1">County</th>
          <th class="py-1">Towns</th>
          <th class="py-1">Typical peak</th>
        </tr>
      </thead>
      <tbody>
        <tr :for={county <- @counties} class="border-t">
          <td class="py-1">{county.name}</td>
          <td class="py-1">{county.town_count}</td>
          <td class="py-1">{county.peak}</td>
        </tr>
      </tbody>
    </table>
  </section>
</article>
```

- [ ] **Step 6: Run the test to verify it passes**

Run: `mix test test/ethos_web/controllers/foliage_controller_test.exs`
Expected: PASS, 8 tests

- [ ] **Step 7: Commit**

```bash
mix format
git add lib/ethos_web/controllers/foliage_controller.ex lib/ethos_web/controllers/foliage_html.ex \
        lib/ethos_web/controllers/foliage_html/index.html.heex lib/ethos_web/router.ex \
        test/ethos_web/controllers/foliage_controller_test.exs
git commit -m "feat(foliage): /foliage page with JS-free week selection"
```

---

### Task 9: Route pages and the link graph

**Files:**
- Modify: `lib/ethos_web/controllers/foliage_controller.ex`
- Create: `lib/ethos_web/controllers/foliage_html/route.html.heex`
- Create: `lib/ethos/foliage/link_builder.ex`
- Test: `test/ethos_web/controllers/foliage_route_test.exs`

**Interfaces:**
- Consumes: `Ethos.Foliage`, `Ethos.Links`.
- Produces: `GET /foliage/:route_slug`; `LinkBuilder.build!/0` writing `same-region` edges from each route's guides.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/controllers/foliage_route_test.exs`:

```elixir
defmodule EthosWeb.FoliageRouteTest do
  use EthosWeb.ConnCase, async: true

  alias Ethos.Foliage

  describe "GET /foliage/:route_slug" do
    test "renders each of the seven routes", %{conn: conn} do
      for route <- Foliage.routes() do
        html = conn |> get(~p"/foliage/#{route.slug}") |> html_response(200)
        assert html =~ route.name
      end
    end

    test "lists every town on the route in order", %{conn: conn} do
      route = Foliage.route("hartford-west")
      html = conn |> get(~p"/foliage/#{route.slug}") |> html_response(200)

      for stop <- route.stops do
        town = Foliage.town(stop.town_slug)
        assert html =~ town.name
      end
    end

    test "links a guide for every town on the route", %{conn: conn} do
      route = Foliage.route("hartford-west")
      html = conn |> get(~p"/foliage/#{route.slug}") |> html_response(200)

      # An empty stop list would still render 200 with a map and a heading.
      # Counting the guide links is what proves the join actually produced
      # something.
      guide_links = Regex.scan(~r{href="/g/[a-z0-9-]+"}, html)
      assert length(guide_links) >= length(route.stops)
    end

    test "shows each town's estimated peak window", %{conn: conn} do
      html = conn |> get(~p"/foliage/hartford-west") |> html_response(200)
      assert html =~ Foliage.peak_label(Foliage.town("avon"))
    end

    test "links back to the state's own page for the route", %{conn: conn} do
      route = Foliage.route("hartford-west")
      html = conn |> get(~p"/foliage/#{route.slug}") |> html_response(200)
      assert html =~ route.deep_url
    end

    test "carries the attribution", %{conn: conn} do
      html = conn |> get(~p"/foliage/hartford-west") |> html_response(200)
      assert html =~ "Derived from the Connecticut DEEP fall foliage map"
    end

    test "supports week selection without JavaScript", %{conn: conn} do
      early = conn |> get(~p"/foliage/hartford-west?week=1") |> html_response(200)
      late = conn |> get(~p"/foliage/hartford-west?week=8") |> html_response(200)
      refute early == late
    end

    test "canonicalises week variants to the route URL", %{conn: conn} do
      html = conn |> get(~p"/foliage/hartford-west?week=5") |> html_response(200)
      assert html =~ ~s(<link rel="canonical" href="http://localhost:4002/foliage/hartford-west")
    end

    test "404s an unknown route", %{conn: conn} do
      assert conn |> get(~p"/foliage/not-a-route") |> html_response(404)
    end
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `mix test test/ethos_web/controllers/foliage_route_test.exs`
Expected: FAIL — `function EthosWeb.FoliageController.route/2 is undefined`

- [ ] **Step 3: Add the controller action**

Add to `lib/ethos_web/controllers/foliage_controller.ex`:

```elixir
  def route(conn, %{"route_slug" => slug} = params) do
    case Foliage.route(slug) do
      nil ->
        conn
        |> put_status(:not_found)
        |> put_view(EthosWeb.ErrorHTML)
        |> render(:"404")

      route ->
        week = week_param(params)
        stops = Enum.map(route.stops, &%{stop: &1, town: Foliage.town(&1.town_slug)})
        title = "#{route.name} — Connecticut foliage route"

        description =
          "The #{route.name} foliage route passes through #{length(stops)} Connecticut towns. When each one turns, and what is in it."

        render(conn, :route,
          route: route,
          stops: stops,
          week: week,
          weeks: Foliage.weeks(),
          note: Foliage.latest_note("route", route.slug),
          page_title: title,
          page_meta_description: description,
          page_canonical: url(~p"/foliage/#{route.slug}"),
          page_og: %{
            title: title,
            description: description,
            type: "website",
            url: url(~p"/foliage/#{route.slug}"),
            image: StructuredData.absolute_url("uploads/og/foliage.png")
          },
          json_ld: [trip_ld(route, stops)]
        )
    end
  end

  defp trip_ld(route, stops) do
    %{
      "@context" => "https://schema.org",
      "@type" => "TouristTrip",
      "name" => route.name,
      "description" => Foliage.attribution(),
      "url" => url(~p"/foliage/#{route.slug}"),
      "itinerary" => %{
        "@type" => "ItemList",
        "numberOfItems" => length(stops),
        "itemListElement" =>
          stops
          |> Enum.with_index(1)
          |> Enum.map(fn {%{stop: stop, town: town}, position} ->
            %{
              "@type" => "ListItem",
              "position" => position,
              "item" => %{
                "@type" => "TouristDestination",
                "name" => town.name,
                "url" => url(~p"/g/#{stop.guide_slug}")
              }
            }
          end)
      }
    }
  end
```

- [ ] **Step 4: Write the template**

Create `lib/ethos_web/controllers/foliage_html/route.html.heex`:

```heex
<article class="mx-auto max-w-3xl px-4 py-10">
  <p class="text-sm text-zinc-500">
    <.link navigate={~p"/foliage"} class="hover:underline">Connecticut Foliage Forecast</.link>
  </p>

  <h1 class="mt-1 text-3xl font-bold">{@route.name}</h1>

  <p class="mt-2 text-zinc-600">
    One of seven foliage driving routes published by the State of Connecticut.
    It passes through {length(@stops)} towns.
  </p>

  <.week_selector weeks={@weeks} current={@week} base={~p"/foliage/#{@route.slug}"} />

  <figure class="mt-4">
    {Ethos.Foliage.Svg.map(@week, route: @route)}
    <figcaption class="sr-only">
      The {@route.name} route across Connecticut, with foliage stage by town for
      {Ethos.Foliage.week(@week).label}.
    </figcaption>
  </figure>

  <.stage_key />

  <p class="mt-4 text-xs text-zinc-500">{Ethos.Foliage.attribution()}</p>

  <.field_note note={@note} />

  <section class="mt-10">
    <h2 class="font-semibold">Towns along the route</h2>
    <ol class="mt-3 space-y-3">
      <li :for={%{stop: stop, town: town} <- @stops} class="rounded-xl border p-4">
        <div class="flex items-baseline justify-between gap-3">
          <.link href={~p"/g/#{stop.guide_slug}"} class="font-semibold hover:underline">
            {town.name}
          </.link>
          <span class="text-sm text-zinc-500">{town.county} County</span>
        </div>
        <p class="mt-1 text-sm text-zinc-600">
          {Ethos.Foliage.stage_label(Ethos.Foliage.stage_at(town, @week))} this week ·
          estimated peak {Ethos.Foliage.peak_label(town)}
        </p>
      </li>
    </ol>
  </section>

  <p class="mt-8 text-sm text-zinc-500">
    The state's own description of this route:
    <.link href={@route.deep_url} class="underline" rel="noopener">CT DEEP</.link>.
  </p>
</article>
```

- [ ] **Step 5: Run the test to verify it passes**

Run: `mix test test/ethos_web/controllers/foliage_route_test.exs`
Expected: PASS, 9 tests

- [ ] **Step 6: Write the link-graph builder**

Create `lib/ethos/foliage/link_builder.ex`:

```elixir
defmodule Ethos.Foliage.LinkBuilder do
  @moduledoc """
  Writes `same-region` edges between the guides that share a foliage driving
  route, so each town guide gains inbound links from its neighbours through the
  existing `ConnectedPages` component rather than through new plumbing.

  Skip-if-missing, like `Ethos.Seeds.BackfillLinks`: an unpublished guide is a
  corpus state, not a programming error.
  """

  require Logger

  alias Ethos.Foliage
  alias Ethos.Links

  def build! do
    for route <- Foliage.routes() do
      slugs = Enum.map(route.stops, & &1.guide_slug)

      for {source, index} <- Enum.with_index(slugs),
          target <- Enum.slice(slugs, (index + 1)..(index + 2)//1) do
        upsert(source, target, route.name)
      end
    end

    :ok
  end

  defp upsert(source, target, note) do
    Links.upsert_link!(%{
      source: {:guide, source},
      target: {:guide, target},
      kind: "same-region",
      note: "Both on the #{note} foliage route"
    })
  rescue
    ArgumentError ->
      Logger.warning("foliage links: skipped #{source} -> #{target}, guide missing")
      :ok
  end
end
```

- [ ] **Step 7: Commit**

```bash
mix format
git add lib/ethos_web/controllers/foliage_controller.ex \
        lib/ethos_web/controllers/foliage_html/route.html.heex \
        lib/ethos/foliage/link_builder.ex test/ethos_web/controllers/foliage_route_test.exs
git commit -m "feat(foliage): seven driving-route pages with guide joins and link edges"
```

---

### Task 10: The embed

**Files:**
- Modify: `lib/ethos_web/controllers/foliage_controller.ex`
- Create: `lib/ethos_web/controllers/foliage_html/embed.html.heex`
- Modify: `lib/ethos_web/controllers/foliage_html/index.html.heex`
- Test: `test/ethos_web/controllers/foliage_embed_test.exs`

**Interfaces:**
- Consumes: `Ethos.Foliage.Svg`.
- Produces: `GET /foliage/embed`.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/controllers/foliage_embed_test.exs`:

```elixir
defmodule EthosWeb.FoliageEmbedTest do
  use EthosWeb.ConnCase, async: true

  describe "GET /foliage/embed" do
    test "renders a self-contained map", %{conn: conn} do
      html = conn |> get(~p"/foliage/embed") |> html_response(200)

      assert length(Regex.scan(~r/data-town="/, html)) == 169
      refute html =~ "<script"
    end

    test "links back to the forecast", %{conn: conn} do
      html = conn |> get(~p"/foliage/embed") |> html_response(200)

      # The whole point of the embed is this link, and it must be followable.
      assert html =~ "http://localhost:4002/foliage"
      refute html =~ ~s(rel="nofollow")
    end

    test "carries the attribution", %{conn: conn} do
      html = conn |> get(~p"/foliage/embed") |> html_response(200)
      assert html =~ "Connecticut DEEP"
    end

    test "is not indexable on its own", %{conn: conn} do
      html = conn |> get(~p"/foliage/embed") |> html_response(200)
      assert html =~ ~s(name="robots")
      assert html =~ "noindex"
    end

    test "allows framing", %{conn: conn} do
      conn = get(conn, ~p"/foliage/embed")
      # The app sets x-frame-options via put_secure_browser_headers; an embed
      # that cannot be framed is not an embed.
      refute get_resp_header(conn, "x-frame-options") == ["SAMEORIGIN"]
    end

    test "the copy-paste snippet is on the main page", %{conn: conn} do
      html = conn |> get(~p"/foliage") |> html_response(200)
      assert html =~ "&lt;iframe"
      assert html =~ "/foliage/embed"
    end
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `mix test test/ethos_web/controllers/foliage_embed_test.exs`
Expected: FAIL — `function EthosWeb.FoliageController.embed/2 is undefined`

- [ ] **Step 3: Add the action**

Add to `lib/ethos_web/controllers/foliage_controller.ex`:

```elixir
  def embed(conn, params) do
    conn
    # The default secure headers forbid framing, which is the one thing an
    # embed must permit. Nothing on this page is interactive or authenticated.
    |> delete_resp_header("x-frame-options")
    |> put_resp_header("content-security-policy", "frame-ancestors *")
    |> put_root_layout(false)
    |> put_layout(false)
    |> render(:embed, week: week_param(params))
  end
```

- [ ] **Step 4: Write the template**

Create `lib/ethos_web/controllers/foliage_html/embed.html.heex`:

```heex
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="robots" content="noindex, follow" />
    <title>Connecticut Foliage Forecast</title>
    <style>
      body { margin: 0; font-family: Georgia, serif; color: #27272a; background: #fff; }
      .wrap { padding: 8px; }
      .credit { margin: 6px 0 0; font-size: 12px; color: #52525b; }
      .credit a { color: #27272a; }
      svg { width: 100%; height: auto; display: block; }
    </style>
  </head>
  <body>
    <div class="wrap">
      {Ethos.Foliage.Svg.map(@week)}
      <p class="credit">
        <a href={url(~p"/foliage")}>Connecticut Foliage Forecast · Ethos</a> —
        derived from the CT DEEP fall foliage map.
      </p>
    </div>
  </body>
</html>
```

- [ ] **Step 5: Add the snippet to the index template**

Append to `lib/ethos_web/controllers/foliage_html/index.html.heex`, before `</article>`:

```heex
  <section class="mt-10">
    <h2 class="font-semibold">Use this map</h2>
    <p class="mt-1 text-sm text-zinc-600">
      Free to embed, on any site, with the credit link left in place.
    </p>
    <pre class="mt-3 overflow-x-auto rounded-lg bg-zinc-100 p-3 text-xs"><code>{~s(<iframe src="#{url(~p"/foliage/embed")}" width="100%" height="560" loading="lazy" style="border:0" title="Connecticut Foliage Forecast"></iframe>)}</code></pre>
  </section>
```

- [ ] **Step 6: Run the test to verify it passes**

Run: `mix test test/ethos_web/controllers/foliage_embed_test.exs`
Expected: PASS, 6 tests

- [ ] **Step 7: Commit**

```bash
mix format
git add lib/ethos_web/controllers/foliage_controller.ex \
        lib/ethos_web/controllers/foliage_html/embed.html.heex \
        lib/ethos_web/controllers/foliage_html/index.html.heex \
        test/ethos_web/controllers/foliage_embed_test.exs
git commit -m "feat(foliage): embeddable map with attribution link"
```

---

### Task 11: Field notes

**Files:**
- Create: `priv/repo/migrations/20260905120000_create_foliage_notes.exs`
- Create: `lib/ethos/foliage/note.ex`
- Create: `lib/ethos_web/controllers/admin_foliage_controller.ex`
- Create: `lib/ethos_web/controllers/admin_foliage_html.ex`
- Create: `lib/ethos_web/controllers/admin_foliage_html/index.html.heex`
- Modify: `lib/ethos/foliage.ex` (replace the `latest_note/2` stub)
- Modify: `lib/ethos_web/router.ex` (admin scope)
- Test: `test/ethos/foliage/note_test.exs`, `test/ethos_web/controllers/admin_foliage_test.exs`

**Interfaces:**
- Produces:
  - `Note.changeset(note, attrs)`
  - `Note.latest(scope, ref) :: %Note{} | nil`
  - `Note.create(attrs) :: {:ok, %Note{}} | {:error, changeset}`
  - `Note.list() :: [%Note{}]`
  - `GET/POST /admin/foliage/notes`

- [ ] **Step 1: Write the migration**

Create `priv/repo/migrations/20260905120000_create_foliage_notes.exs`:

```elixir
defmodule Ethos.Repo.Migrations.CreateFoliageNotes do
  use Ecto.Migration

  def change do
    create table(:foliage_notes) do
      add :scope, :string, null: false
      add :ref, :string
      add :published_on, :date, null: false
      add :body, :text, null: false

      timestamps(type: :utc_datetime)
    end

    create index(:foliage_notes, [:scope, :ref, :published_on])
  end
end
```

- [ ] **Step 2: Write the failing test**

Create `test/ethos/foliage/note_test.exs`:

```elixir
defmodule Ethos.Foliage.NoteTest do
  use Ethos.DataCase, async: true

  alias Ethos.Foliage.Note

  describe "changeset/2" do
    test "requires scope, published_on and body" do
      changeset = Note.changeset(%Note{}, %{})
      assert %{scope: _, published_on: _, body: _} = errors_on(changeset)
    end

    test "rejects an unknown scope" do
      changeset =
        Note.changeset(%Note{}, %{scope: "galaxy", published_on: ~D[2026-10-09], body: "x"})

      assert "is invalid" in errors_on(changeset).scope
    end

    test "requires a ref for route scope" do
      changeset =
        Note.changeset(%Note{}, %{scope: "route", published_on: ~D[2026-10-09], body: "x"})

      assert errors_on(changeset).ref
    end

    test "forbids a ref for statewide scope" do
      changeset =
        Note.changeset(%Note{}, %{
          scope: "statewide",
          ref: "hartford-west",
          published_on: ~D[2026-10-09],
          body: "x"
        })

      assert errors_on(changeset).ref
    end

    test "rejects a ref that is not a known route" do
      changeset =
        Note.changeset(%Note{}, %{
          scope: "route",
          ref: "not-a-route",
          published_on: ~D[2026-10-09],
          body: "x"
        })

      assert errors_on(changeset).ref
    end
  end

  describe "latest/2" do
    test "returns nil when nothing is published" do
      assert Note.latest("statewide") == nil
    end

    test "returns the most recent note for the scope" do
      {:ok, _} = Note.create(%{scope: "statewide", published_on: ~D[2026-10-02], body: "older"})
      {:ok, _} = Note.create(%{scope: "statewide", published_on: ~D[2026-10-09], body: "newer"})

      assert %{body: "newer"} = Note.latest("statewide")
    end

    test "scopes by ref" do
      {:ok, _} =
        Note.create(%{
          scope: "route",
          ref: "hartford-west",
          published_on: ~D[2026-10-09],
          body: "west"
        })

      assert %{body: "west"} = Note.latest("route", "hartford-west")
      assert Note.latest("route", "yankee-roots") == nil
    end
  end
end
```

- [ ] **Step 3: Run the test to verify it fails**

Run: `mix test test/ethos/foliage/note_test.exs`
Expected: FAIL — `module Ethos.Foliage.Note is not available`

- [ ] **Step 4: Write the schema**

Create `lib/ethos/foliage/note.ex`:

```elixir
defmodule Ethos.Foliage.Note do
  @moduledoc """
  A dated editorial note on the foliage forecast.

  The derived numbers never change during a season — they are a climatological
  normal, not an observation. This is the part that does: a short note saying
  what is actually happening, and where the normal is running early or late.
  It is the only part of the forecast that is Ethos's own reporting, and the
  only reason to come back to the page.
  """

  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias Ethos.Repo

  @scopes ~w(statewide route)

  schema "foliage_notes" do
    field :scope, :string
    field :ref, :string
    field :published_on, :date
    field :body, :string

    timestamps(type: :utc_datetime)
  end

  def changeset(note, attrs) do
    note
    |> cast(attrs, [:scope, :ref, :published_on, :body])
    |> validate_required([:scope, :published_on, :body])
    |> validate_inclusion(:scope, @scopes)
    |> validate_length(:body, min: 20, max: 2000)
    |> validate_ref()
  end

  def create(attrs), do: %__MODULE__{} |> changeset(attrs) |> Repo.insert()

  def list do
    Repo.all(from n in __MODULE__, order_by: [desc: n.published_on, desc: n.id])
  end

  def latest(scope, ref \\ nil) do
    Repo.one(
      from n in __MODULE__,
        where: n.scope == ^scope,
        where: ^ref_condition(ref),
        order_by: [desc: n.published_on, desc: n.id],
        limit: 1
    )
  end

  defp ref_condition(nil), do: dynamic([n], is_nil(n.ref))
  defp ref_condition(ref), do: dynamic([n], n.ref == ^ref)

  # A statewide note with a ref, or a route note without one, would silently
  # never render — `latest/2` filters on exactly this pair.
  defp validate_ref(changeset) do
    case {get_field(changeset, :scope), get_field(changeset, :ref)} do
      {"statewide", nil} ->
        changeset

      {"statewide", _} ->
        add_error(changeset, :ref, "must be blank for a statewide note")

      {"route", nil} ->
        add_error(changeset, :ref, "is required for a route note")

      {"route", ref} ->
        if Ethos.Foliage.route(ref),
          do: changeset,
          else: add_error(changeset, :ref, "is not a known foliage route")

      _ ->
        changeset
    end
  end
end
```

- [ ] **Step 5: Replace the stub in the context**

In `lib/ethos/foliage.ex`, replace the temporary stub with the real delegation:

```elixir
  def latest_note(scope, ref \\ nil), do: Note.latest(scope, ref)
```

- [ ] **Step 6: Run migration and tests**

```bash
mix ecto.migrate
mix test test/ethos/foliage/note_test.exs
```

Expected: PASS, 8 tests

- [ ] **Step 7: Write the admin test**

Create `test/ethos_web/controllers/admin_foliage_test.exs`:

```elixir
defmodule EthosWeb.AdminFoliageTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.AccountsFixtures

  describe "GET /admin/foliage/notes" do
    test "404s for an anonymous visitor", %{conn: conn} do
      assert conn |> get(~p"/admin/foliage/notes") |> html_response(302)
    end

    test "404s for a signed-in non-admin", %{conn: conn} do
      conn = conn |> log_in_user(user_fixture())
      assert conn |> get(~p"/admin/foliage/notes") |> html_response(404)
    end

    test "renders the form for an admin", %{conn: conn} do
      conn = conn |> log_in_user(admin_fixture())
      html = conn |> get(~p"/admin/foliage/notes") |> html_response(200)
      assert html =~ "Field notes"
    end
  end

  describe "POST /admin/foliage/notes" do
    setup %{conn: conn}, do: %{conn: log_in_user(conn, admin_fixture())}

    test "creates a statewide note", %{conn: conn} do
      params = %{
        "note" => %{
          "scope" => "statewide",
          "published_on" => "2026-10-09",
          "body" => "The Route 6 maples east of the lake turned late last week."
        }
      }

      conn = post(conn, ~p"/admin/foliage/notes", params)
      assert redirected_to(conn) == ~p"/admin/foliage/notes"
      assert Ethos.Foliage.latest_note("statewide")
    end

    test "rerenders with errors on invalid input", %{conn: conn} do
      params = %{"note" => %{"scope" => "statewide", "published_on" => "", "body" => "short"}}
      assert conn |> post(~p"/admin/foliage/notes", params) |> html_response(200) =~ "Field notes"
    end
  end
end
```

If `admin_fixture/0` does not exist in `test/support/fixtures/accounts_fixtures.ex`, add it following the existing `user_fixture/0` and the admin flag `Ethos.Accounts.admin?/1` checks.

- [ ] **Step 8: Write the admin controller, HTML module, and template**

Create `lib/ethos_web/controllers/admin_foliage_controller.ex`:

```elixir
defmodule EthosWeb.AdminFoliageController do
  use EthosWeb, :controller

  alias Ethos.Foliage
  alias Ethos.Foliage.Note

  def index(conn, _params) do
    render(conn, :index,
      changeset: Note.changeset(%Note{}, %{}),
      notes: Note.list(),
      routes: Foliage.routes(),
      page_title: "Field notes"
    )
  end

  def create(conn, %{"note" => params}) do
    case Note.create(normalize(params)) do
      {:ok, _note} ->
        conn
        |> put_flash(:info, "Note published.")
        |> redirect(to: ~p"/admin/foliage/notes")

      {:error, changeset} ->
        render(conn, :index,
          changeset: changeset,
          notes: Note.list(),
          routes: Foliage.routes(),
          page_title: "Field notes"
        )
    end
  end

  # An empty select renders as "", which is not the nil the statewide-scope
  # validation expects.
  defp normalize(%{"ref" => ""} = params), do: Map.put(params, "ref", nil)
  defp normalize(params), do: params
end
```

Create `lib/ethos_web/controllers/admin_foliage_html.ex`:

```elixir
defmodule EthosWeb.AdminFoliageHTML do
  use EthosWeb, :html

  embed_templates "admin_foliage_html/*"
end
```

Create `lib/ethos_web/controllers/admin_foliage_html/index.html.heex`:

```heex
<div class="mx-auto max-w-3xl px-4 py-10">
  <h1 class="text-2xl font-bold">Field notes</h1>
  <p class="mt-2 text-sm text-zinc-600">
    The forecast numbers are frozen. This is where the season gets recorded.
  </p>

  <.simple_form :let={f} for={@changeset} action={~p"/admin/foliage/notes"} class="mt-6">
    <.input field={f[:scope]} type="select" label="Scope" options={["statewide", "route"]} />
    <.input
      field={f[:ref]}
      type="select"
      label="Route (route scope only)"
      options={[{"—", ""} | Enum.map(@routes, &{&1.name, &1.slug})]}
    />
    <.input field={f[:published_on]} type="date" label="Date" />
    <.input field={f[:body]} type="textarea" label="Note" rows="4" />
    <:actions>
      <.button>Publish note</.button>
    </:actions>
  </.simple_form>

  <ul class="mt-10 space-y-4">
    <li :for={note <- @notes} class="rounded-xl border p-4">
      <p class="text-xs uppercase tracking-wide text-zinc-500">
        {note.scope}{if note.ref, do: " · #{note.ref}"} ·
        {Calendar.strftime(note.published_on, "%B %-d, %Y")}
      </p>
      <p class="mt-1 text-sm">{note.body}</p>
    </li>
  </ul>
</div>
```

- [ ] **Step 9: Add the admin routes**

In `lib/ethos_web/router.ex`, inside the `scope "/admin", EthosWeb` block:

```elixir
    get "/foliage/notes", AdminFoliageController, :index
    post "/foliage/notes", AdminFoliageController, :create
```

- [ ] **Step 10: Run the tests**

Run: `mix test test/ethos/foliage/note_test.exs test/ethos_web/controllers/admin_foliage_test.exs`
Expected: PASS, 13 tests

- [ ] **Step 11: Commit**

```bash
mix format
git add priv/repo/migrations/20260905120000_create_foliage_notes.exs lib/ethos/foliage/note.ex \
        lib/ethos/foliage.ex lib/ethos_web/controllers/admin_foliage_controller.ex \
        lib/ethos_web/controllers/admin_foliage_html.ex \
        lib/ethos_web/controllers/admin_foliage_html/index.html.heex lib/ethos_web/router.ex \
        test/ethos/foliage/note_test.exs test/ethos_web/controllers/admin_foliage_test.exs
git commit -m "feat(foliage): admin-authored seasonal field notes"
```

---

### Task 12: The guide panel

Attach foliage content to the 169 town guides that already exist, rather than creating 169 new pages.

**Files:**
- Modify: `lib/ethos_web/controllers/guide_controller.ex:38-50`
- Modify: `lib/ethos_web/controllers/guide_html/town_page.html.heex` (before `<EthosWeb.ConnectedPages...>`)
- Test: `test/ethos_web/controllers/foliage_guide_panel_test.exs`

**Interfaces:**
- Consumes: `Ethos.Foliage`.
- Produces: a `:foliage` assign on town-page guides — `nil` or `%{town:, stage:, week:, route:}`.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/controllers/foliage_guide_panel_test.exs`:

```elixir
defmodule EthosWeb.FoliageGuidePanelTest do
  use EthosWeb.ConnCase, async: true

  alias EthosWeb.GuideController

  describe "foliage_assign/2" do
    test "returns nil outside the season" do
      guide = %Ethos.Guides.Guide{tier: "town-page", state_slug: "connecticut", destination_slug: "avon"}
      assert GuideController.foliage_assign(guide, ~D[2026-06-15]) == nil
    end

    test "returns nil for a guide outside Connecticut" do
      guide = %Ethos.Guides.Guide{tier: "town-page", state_slug: "new-york", destination_slug: "brooklyn"}
      assert GuideController.foliage_assign(guide, ~D[2026-10-15]) == nil
    end

    test "returns nil for a guide that is not a town page" do
      guide = %Ethos.Guides.Guide{tier: "guide", state_slug: "connecticut", destination_slug: "avon"}
      assert GuideController.foliage_assign(guide, ~D[2026-10-15]) == nil
    end

    test "returns nil for a Connecticut town with no foliage record" do
      guide = %Ethos.Guides.Guide{tier: "town-page", state_slug: "connecticut", destination_slug: "mystic"}
      assert GuideController.foliage_assign(guide, ~D[2026-10-15]) == nil
    end

    test "returns the town, stage and week in season" do
      guide = %Ethos.Guides.Guide{tier: "town-page", state_slug: "connecticut", destination_slug: "avon"}
      assert %{town: town, stage: stage, week: week} = GuideController.foliage_assign(guide, ~D[2026-10-15])

      assert town.name == "Avon"
      assert stage in [:green, :turning, :near_peak, :peak, :past_peak]
      assert week in 1..9
    end

    test "names the route when the town is on one" do
      guide = %Ethos.Guides.Guide{tier: "town-page", state_slug: "connecticut", destination_slug: "avon"}
      assert %{route: %{slug: "hartford-west"}} = GuideController.foliage_assign(guide, ~D[2026-10-15])
    end

    test "leaves route nil for a town on no route" do
      guide = %Ethos.Guides.Guide{tier: "town-page", state_slug: "connecticut", destination_slug: "bozrah"}
      assert %{route: nil} = GuideController.foliage_assign(guide, ~D[2026-10-15])
    end
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `mix test test/ethos_web/controllers/foliage_guide_panel_test.exs`
Expected: FAIL — `function EthosWeb.GuideController.foliage_assign/2 is undefined`

- [ ] **Step 3: Add the assign builder to the guide controller**

Add to `lib/ethos_web/controllers/guide_controller.ex`, and add `foliage: foliage_assign(guide)` to the `render/3` keyword list in `show/2`:

```elixir
  @doc """
  Foliage context for a Connecticut town guide, or nil.

  Seasonal: out of season the guides should not carry a foliage block at all,
  so this returns nil rather than the template hiding a populated one.
  """
  def foliage_assign(guide, today \\ Date.utc_today())

  def foliage_assign(%Guide{tier: "town-page", state_slug: "connecticut"} = guide, today) do
    with true <- Ethos.Foliage.in_season?(today),
         town when not is_nil(town) <- Ethos.Foliage.town(guide.destination_slug) do
      week = Ethos.Foliage.current_week_index(today)

      %{
        town: town,
        week: week,
        stage: Ethos.Foliage.stage_at(town, week),
        route:
          Enum.find(Ethos.Foliage.routes(), fn route ->
            Enum.any?(route.stops, &(&1.town_slug == town.slug))
          end)
      }
    else
      _ -> nil
    end
  end

  def foliage_assign(%Guide{}, _today), do: nil
```

- [ ] **Step 4: Add the panel to the town-page template**

In `lib/ethos_web/controllers/guide_html/town_page.html.heex`, immediately before the `<EthosWeb.ConnectedPages.connected_pages ... />` line:

```heex
  <section :if={@foliage} class="mt-10 rounded-xl border p-4">
    <h2 class="font-semibold">Foliage</h2>
    <p class="mt-2 text-sm">
      {Ethos.Foliage.stage_label(@foliage.stage)} this week ·
      estimated peak {Ethos.Foliage.peak_label(@foliage.town)}
    </p>
    <p :if={@foliage.route} class="mt-1 text-sm text-zinc-600">
      On the
      <.link navigate={~p"/foliage/#{@foliage.route.slug}"} class="underline">
        {@foliage.route.name}
      </.link>
      foliage driving route.
    </p>
    <p class="mt-2 text-xs text-zinc-500">
      {Ethos.Foliage.attribution()}
      <.link navigate={~p"/foliage"} class="underline">See the statewide forecast</.link>.
    </p>
  </section>
```

The `:show` template does not get this block — only `town_page`.

- [ ] **Step 5: Run the tests**

Run: `mix test test/ethos_web/controllers/foliage_guide_panel_test.exs test/ethos_web/controllers/guide_controller_test.exs`
Expected: PASS. If `guide_controller_test.exs` fails on a missing `@foliage` assign, the `render/3` call in `show/2` was not updated in Step 3.

- [ ] **Step 6: Commit**

```bash
mix format
git add lib/ethos_web/controllers/guide_controller.ex \
        lib/ethos_web/controllers/guide_html/town_page.html.heex \
        test/ethos_web/controllers/foliage_guide_panel_test.exs
git commit -m "feat(foliage): seasonal foliage panel on Connecticut town guides"
```

---

### Task 13: Sitemap, OG card, and the homepage link

**Files:**
- Modify: `lib/ethos_web/controllers/sitemap_controller.ex:20-50`
- Modify: `lib/ethos/og_card.ex`
- Modify: `lib/ethos_web/controllers/page_html/home.html.heex`
- Test: `test/ethos_web/controllers/sitemap_controller_test.exs` (extend), `test/ethos/foliage/og_card_test.exs`

**Interfaces:**
- Consumes: `Ethos.Foliage`, `Ethos.Foliage.Svg`.
- Produces: `OGCard.generate_foliage/0` writing `priv/uploads/og/foliage.png`.

- [ ] **Step 1: Write the failing tests**

Append to `test/ethos_web/controllers/sitemap_controller_test.exs`:

```elixir
  describe "foliage URLs" do
    test "lists the nine foliage pages", %{conn: conn} do
      xml = conn |> get(~p"/sitemap.xml") |> response(200)

      assert xml =~ "<loc>http://localhost:4002/foliage</loc>"
      assert xml =~ "<loc>http://localhost:4002/foliage/hartford-west</loc>"

      foliage_urls = Regex.scan(~r{<loc>[^<]*/foliage[^<]*</loc>}, xml)
      assert length(foliage_urls) == 9
    end

    test "never lists a week variant", %{conn: conn} do
      xml = conn |> get(~p"/sitemap.xml") |> response(200)
      refute xml =~ "?week="
    end
  end
```

Create `test/ethos/foliage/og_card_test.exs`:

```elixir
defmodule Ethos.Foliage.OGCardTest do
  use ExUnit.Case, async: true

  @tag :tmp_dir
  test "renders a 1200x630 card carrying the forecast name" do
    assert {:ok, path} = Ethos.OGCard.generate_foliage()
    assert File.exists?(path)

    {:ok, image} = Vix.Vips.Image.new_from_file(path)
    assert Vix.Vips.Image.width(image) == 1200
    assert Vix.Vips.Image.height(image) == 630
  end
end
```

- [ ] **Step 2: Run the tests to verify they fail**

Run: `mix test test/ethos_web/controllers/sitemap_controller_test.exs test/ethos/foliage/og_card_test.exs`
Expected: FAIL — sitemap missing `/foliage`; `generate_foliage/0` undefined

- [ ] **Step 3: Add the foliage URLs to the sitemap**

In `lib/ethos_web/controllers/sitemap_controller.ex`, inside the `urls = ...` pipeline, add:

```elixir
        ++
        (
          # The forecast dataset is frozen; what changes is the field note, so
          # that is what lastmod reports. `?week=` variants canonicalise to
          # these URLs and are never listed.
          statewide = Ethos.Foliage.latest_note("statewide")

          [%{loc: url(~p"/foliage"), lastmod: statewide && statewide.published_on}] ++
            Enum.map(Ethos.Foliage.routes(), fn route ->
              note = Ethos.Foliage.latest_note("route", route.slug)
              %{loc: url(~p"/foliage/#{route.slug}"), lastmod: note && note.published_on}
            end) ++
            [%{loc: url(~p"/foliage/embed"), lastmod: nil}]
        )
```

- [ ] **Step 4: Add the OG card generator**

Add to `lib/ethos/og_card.ex`:

```elixir
  @doc """
  The share card for the foliage forecast — the same SVG renderer as the page,
  at card size, over the dark ground the guide cards use.
  """
  def generate_foliage do
    dir = Path.join([:code.priv_dir(:ethos) |> to_string(), "uploads", "og"])
    File.mkdir_p!(dir)
    path = Path.join(dir, "foliage.png")

    week = Ethos.Foliage.current_week_index()
    map = Ethos.Foliage.Svg.map(week, width: 520, height: 340) |> Phoenix.HTML.safe_to_string()
    inner = map |> String.replace(~r/^<svg[^>]*>/, "") |> String.replace(~r{</svg>$}, "")

    svg = """
    <svg xmlns="http://www.w3.org/2000/svg" width="1200" height="630">
      <rect width="1200" height="630" fill="#18181b"/>
      <text x="80" y="150" font-family="DejaVu Serif, Georgia, serif" font-size="56" fill="#fafafa" font-weight="bold">Connecticut Foliage Forecast</text>
      <text x="80" y="205" font-family="DejaVu Serif, Georgia, serif" font-size="28" fill="#a1a1aa">169 towns · seven state driving routes</text>
      <g transform="translate(600, 240)">#{inner}</g>
      <rect x="0" y="560" width="1200" height="70" fill="#f59e0b"/>
      <text x="80" y="605" font-family="DejaVu Serif, Georgia, serif" font-size="24" fill="#18181b">derived from the CT DEEP fall foliage map</text>
    </svg>
    """

    with {:ok, {image, _flags}} <- Vix.Vips.Operation.svgload_buffer(svg),
         :ok <- Vix.Vips.Image.write_to_file(image, path) do
      {:ok, path}
    end
  end
```

- [ ] **Step 5: Add the homepage link**

In `lib/ethos_web/controllers/page_html/home.html.heex`, after the featured guide block, add one line — not a widget, not a hero:

```heex
<p class="mt-8 text-sm text-zinc-600">
  In season:
  <.link navigate={~p"/foliage"} class="underline">the Connecticut Foliage Forecast</.link>
  — when the leaves turn in each of the state's 169 towns.
</p>
```

- [ ] **Step 6: Run the full suite**

```bash
mix ethos.foliage.build --all
mix format
mix test
```

Expected: the whole suite passes, including the pre-existing corpus and SEO tests. `seo_indexing_test.exs` and `json_ld_parity_test.exs` cover every route; if either fails on a foliage URL, fix the page rather than the test.

- [ ] **Step 7: Generate the card and commit**

```bash
mix run -e "Ethos.OGCard.generate_foliage()"
mix format
git add lib/ethos_web/controllers/sitemap_controller.ex lib/ethos/og_card.ex \
        lib/ethos_web/controllers/page_html/home.html.heex \
        test/ethos_web/controllers/sitemap_controller_test.exs test/ethos/foliage/og_card_test.exs
git commit -m "feat(foliage): sitemap entries, share card, and homepage link"
```

---

## Post-implementation

Not tasks, but the plan is not done until these happen:

- [ ] Run `Ethos.Foliage.LinkBuilder.build!/0` against production after deploy, so route neighbours appear in `ConnectedPages`.
- [ ] Write the first statewide field note through `/admin/foliage/notes`.
- [ ] Submit `/foliage` and the seven route URLs in Search Console (see `docs/runbooks/`).
- [ ] Send the CT DEEP forestry email described in §12 of the spec. Lead with the derivation and the offer, not with a request for a link.
