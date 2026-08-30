defmodule Mix.Tasks.Ethos.OptimizeBronxPhotos do
  @shortdoc "Optimizes Bronx photos from images/bronx/ into priv/photos/ny/bronx/, driven by seed JSONs"
  @moduledoc "Scans priv/seed_data/bronx/*.json for photo srcs and optimizes images/bronx/{label}.* accordingly."
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)
  @manifest_path "priv/seed_data/bronx_photo_manifest.json"

  @impl true
  def run(_args) do
    files = Path.wildcard("priv/seed_data/bronx/*.json")

    if files == [] do
      Mix.raise(
        "no seed files matched priv/seed_data/bronx/*.json — run this from the project root"
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
      ["", "photos", "ny", "bronx", neighborhood, file] ->
        label = Path.rootname(file)
        out_dir = Path.join(["priv", "photos", "ny", "bronx", neighborhood])
        File.mkdir_p!(out_dir)

        case Ethos.PhotoOptimizer.optimize(find_source!(label), out_dir, label) do
          {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
          {:error, reason} -> Mix.raise("failed #{label}: #{inspect(reason)}")
        end

      _ ->
        Mix.raise(
          "unexpected photo src path #{src} (want /photos/ny/bronx/{neighborhood}/{label}.jpg)"
        )
    end
  end

  # Provenance is Ethos.PhotoManifest's job, not this task's: the manifest is
  # what keeps a page's printed author and licence attached to the pixels beside
  # them, and a per-task reimplementation of that check is how one copy drifts
  # weaker than the rest. The manifest path is the only Bronx-specific part.
  defp find_source!(label) do
    path =
      Enum.find_value(@source_exts, fn ext ->
        path = Path.join(["images", "bronx", "#{label}.#{ext}"])
        if File.exists?(path), do: path
      end) || Mix.raise("no source image for #{label} under images/bronx/")

    try do
      Ethos.PhotoManifest.verify!(@manifest_path, label, path)
    rescue
      e -> Mix.raise(Exception.message(e))
    end

    path
  end
end
