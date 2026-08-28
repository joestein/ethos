defmodule Mix.Tasks.Ethos.OptimizeBrooklynPhotos do
  @shortdoc "Optimizes Brooklyn photos from images/brooklyn/ into priv/photos/ny/brooklyn/, driven by seed JSONs"
  @moduledoc "Scans priv/seed_data/brooklyn/*.json for photo srcs and optimizes images/brooklyn/{label}.* accordingly."
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)
  @manifest_path "priv/seed_data/brooklyn_photo_manifest.json"

  @impl true
  def run(_args) do
    files = Path.wildcard("priv/seed_data/brooklyn/*.json")

    if files == [] do
      Mix.raise(
        "no seed files matched priv/seed_data/brooklyn/*.json — run this from the project root"
      )
    end

    srcs =
      files
      |> Enum.flat_map(&photo_srcs/1)
      |> Enum.uniq()

    Enum.each(srcs, &optimize_src/1)
    Mix.shell().info("optimized #{length(srcs)} photos from #{length(files)} seed files")
  end

  defp photo_srcs(file) do
    data = file |> File.read!() |> Jason.decode!()

    ((get_in(data, ["guide", "photos"]) || []) ++
       Enum.flat_map(data["places"] || [], &(&1["photos"] || [])))
    |> Enum.map(& &1["src"])
  end

  defp optimize_src(src) do
    case String.split(src, "/") do
      ["", "photos", "ny", "brooklyn", neighborhood, file] ->
        label = Path.rootname(file)
        out_dir = Path.join(["priv", "photos", "ny", "brooklyn", neighborhood])
        File.mkdir_p!(out_dir)

        case Ethos.PhotoOptimizer.optimize(find_source!(label), out_dir, label) do
          {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
          {:error, reason} -> Mix.raise("failed #{label}: #{inspect(reason)}")
        end

      _ ->
        Mix.raise(
          "unexpected photo src path #{src} (want /photos/ny/brooklyn/{neighborhood}/{label}.jpg)"
        )
    end
  end

  defp find_source!(label) do
    path =
      Enum.find_value(@source_exts, fn ext ->
        path = Path.join(["images", "brooklyn", "#{label}.#{ext}"])
        if File.exists?(path), do: path
      end) || Mix.raise("no source image for #{label} under images/brooklyn/")

    try do
      Ethos.PhotoManifest.verify!(@manifest_path, label, path)
    rescue
      e -> Mix.raise(Exception.message(e))
    end

    path
  end
end
