defmodule Mix.Tasks.Ethos.OptimizeNyPhotos do
  @shortdoc "Optimizes NY source photos from images/ny/ into priv/static/photos/ny/, driven by seed JSONs"
  @moduledoc "Scans priv/seed_data/manhattan/*.json for photo srcs and optimizes images/ny/{label}.* accordingly."
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)

  @impl true
  def run(_args) do
    "priv/seed_data/manhattan/*.json"
    |> Path.wildcard()
    |> Enum.flat_map(&photo_srcs/1)
    |> Enum.uniq()
    |> Enum.each(&optimize_src/1)
  end

  defp photo_srcs(file) do
    data = file |> File.read!() |> Jason.decode!()

    ((get_in(data, ["guide", "photos"]) || []) ++
       Enum.flat_map(data["places"] || [], &(&1["photos"] || [])))
    |> Enum.map(& &1["src"])
  end

  defp optimize_src(src) do
    case String.split(src, "/") do
      ["", "photos", "ny", "manhattan", town, file] ->
        label = Path.rootname(file)
        out_dir = Path.join(["priv", "static", "photos", "ny", "manhattan", town])
        File.mkdir_p!(out_dir)

        case Ethos.PhotoOptimizer.optimize(find_source!(label), out_dir, label) do
          {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
          {:error, reason} -> Mix.raise("failed #{label}: #{inspect(reason)}")
        end

      _ ->
        Mix.raise(
          "unexpected photo src path #{src} (want /photos/ny/manhattan/{town}/{label}.jpg)"
        )
    end
  end

  defp find_source!(label) do
    Enum.find_value(@source_exts, fn ext ->
      path = Path.join(["images", "ny", "#{label}.#{ext}"])
      if File.exists?(path), do: path
    end) || Mix.raise("no source image for #{label} under images/ny/")
  end
end
