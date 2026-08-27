defmodule Mix.Tasks.Ethos.OptimizeConnecticutPhotos do
  @shortdoc "Optimizes CT-expansion photos from images/connecticut/ into priv/photos/ct/, driven by seed JSONs"
  @moduledoc "Scans priv/seed_data/connecticut/*.json for photo srcs and optimizes images/connecticut/{label}.* accordingly."
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)
  @manifest_path "priv/seed_data/connecticut_photo_manifest.json"

  @impl true
  def run(_args) do
    files = Path.wildcard("priv/seed_data/connecticut/*.json")

    if files == [] do
      Mix.raise(
        "no seed files matched priv/seed_data/connecticut/*.json — run this from the project root"
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
      ["", "photos", "ct", town, file] ->
        label = Path.rootname(file)
        out_dir = Path.join(["priv", "photos", "ct", town])
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
    path =
      Enum.find_value(@source_exts, fn ext ->
        path = Path.join(["images", "connecticut", "#{label}.#{ext}"])
        if File.exists?(path), do: path
      end) || Mix.raise("no source image for #{label} under images/connecticut/")

    verify_provenance!(label, path)
    path
  end

  # Source images resolve by bare label, so the wrong file under that name would
  # publish a real photo carrying another image's author and licence credit. The
  # manifest pins each label to the Commons file it was downloaded from.
  defp verify_provenance!(label, path) do
    case manifest()[label] do
      nil ->
        Mix.raise("#{label} is not in #{@manifest_path} — regenerate the manifest")

      %{"sha256" => expected} ->
        actual = :crypto.hash(:sha256, File.read!(path)) |> Base.encode16(case: :lower)

        if actual != expected do
          Mix.raise(
            "#{path} does not match the image recorded for #{label} " <>
              "(expected #{String.slice(expected, 0, 12)}…, got #{String.slice(actual, 0, 12)}…). " <>
              "The published author and licence would credit the wrong photo."
          )
        end
    end
  end

  defp manifest do
    case :persistent_term.get({__MODULE__, :manifest}, nil) do
      nil ->
        data = @manifest_path |> File.read!() |> Jason.decode!()
        :persistent_term.put({__MODULE__, :manifest}, data)
        data

      data ->
        data
    end
  end
end
