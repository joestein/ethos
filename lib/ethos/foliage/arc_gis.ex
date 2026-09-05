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
        rings:
          Enum.map(g["rings"] || [], fn ring ->
            Enum.map(ring, fn [x, y] -> {x / 1, y / 1} end)
          end)
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
