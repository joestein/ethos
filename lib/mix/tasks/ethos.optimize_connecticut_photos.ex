defmodule Mix.Tasks.Ethos.OptimizeConnecticutPhotos do
  @shortdoc "Optimizes CT-expansion photos from images/connecticut/ into priv/static/photos/ct/, driven by seed JSONs"
  @moduledoc "Scans priv/seed_data/connecticut/*.json for photo srcs and optimizes images/connecticut/{label}.* accordingly."
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)

  @impl true
  def run(_args) do
    "priv/seed_data/connecticut/*.json"
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
      ["", "photos", "ct", town, file] ->
        label = Path.rootname(file)
        out_dir = Path.join(["priv", "static", "photos", "ct", town])
        File.mkdir_p!(out_dir)

        case Ethos.PhotoOptimizer.optimize(find_source!(label), out_dir, label) do
          {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
          {:error, reason} -> Mix.raise("failed #{label}: #{inspect(reason)}")
        end

      _ ->
        Mix.raise("unexpected photo src path #{src} (want /photos/ct/{town}/{label}.jpg)")
    end
  end

  defp find_source!(label) do
    Enum.find_value(@source_exts, fn ext ->
      path = Path.join(["images", "connecticut", "#{label}.#{ext}"])
      if File.exists?(path), do: path
    end) || Mix.raise("no source image for #{label} under images/connecticut/")
  end
end
