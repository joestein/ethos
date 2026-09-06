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

    File.write!(
      Path.join(dir, "adjacency.json"),
      Jason.encode_to_iodata!(adjacency, pretty: true)
    )

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
      Mix.raise(
        "Expected #{@expected_towns} towns, got #{map_size(adjacency)}. Refusing to write."
      )
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
