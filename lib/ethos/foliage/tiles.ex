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
