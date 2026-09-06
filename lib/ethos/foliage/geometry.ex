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
