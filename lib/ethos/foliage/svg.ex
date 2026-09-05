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
