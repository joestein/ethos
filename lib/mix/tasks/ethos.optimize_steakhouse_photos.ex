defmodule Mix.Tasks.Ethos.OptimizeSteakhousePhotos do
  @shortdoc "Optimizes steakhouse photos from images/steakhouse/ into priv/static/photos/steakhouse/{city}/"
  @moduledoc """
  Scans `priv/seed_data/steakhouse/*.json` for photo srcs and optimizes
  `images/steakhouse/{label}.*` accordingly.

  Modelled on `Mix.Tasks.Ethos.OptimizeKoreanBbqPhotos`: this collection also
  spans many guides (Manhattan, Brooklyn, Queens, London, Chicago, Los
  Angeles, San Francisco, Seattle, Boston, Washington DC, Miami — see
  `priv/seed_data/steakhouse_roster.json`), so `optimize_src/1` builds the
  output directory from whichever city a src actually names rather than
  assuming a fixed one.

  A src has the shape `/photos/steakhouse/{city}/{label}.jpg` (content rules
  §7). Unlike every other corpus's photo root, the destination directory is
  `priv/static/photos/steakhouse/{city}/`, not `priv/photos/...` — that is
  not a typo. `Ethos.Seeds.SteakhouseSeedDataTest`'s photo test resolves a
  src by joining it under `priv/static/`, so a file written to `priv/photos/`
  would pass this task and fail that gate.

  ## The manifest, and why it is empty right now

  `priv/seed_data/steakhouse_photo_manifest.json` is a provenance manifest in
  the shape of `priv/seed_data/korean_bbq_photo_manifest.json`: a flat object
  keyed by `label`, each value

      {"sha256": "<hex sha256 of the source file>",
       "source_url": "https://commons.wikimedia.org/wiki/File:..."}

  `find_source!/1` calls `Ethos.PhotoManifest.verify!/3`, which raises unless
  the label is present here and its recorded sha256 matches the file found
  under `images/steakhouse/`. This file ships empty (`{}`) because no
  steakhouse guide exists yet — content is a later task, per
  `docs/superpowers/plans/2026-09-06-steakhouses.md`. Each content wave adds
  its own city's entries here (one per guide photo — the corpus carries
  exactly one photo per guide and none per place) before running this task,
  exactly as `korean_bbq`'s ten waves did.

  ## Running it against an empty corpus

  `priv/seed_data/steakhouse/` currently holds only `.gitkeep`. Run with no
  seed files present and this task prints a message and exits zero rather
  than raising — the corpus not existing yet is not this task's error to
  report.
  """
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)
  @manifest_path "priv/seed_data/steakhouse_photo_manifest.json"

  @impl true
  def run(_args) do
    files = Path.wildcard("priv/seed_data/steakhouse/*.json")

    if files == [] do
      Mix.shell().info(
        "no seed files matched priv/seed_data/steakhouse/*.json — nothing to optimize yet"
      )
    else
      srcs = files |> Enum.flat_map(&photo_srcs/1) |> Enum.uniq()

      Enum.each(srcs, &optimize_src/1)
      Mix.shell().info("optimized #{length(srcs)} photos from #{length(files)} seed files")
    end
  end

  defp photo_srcs(file) do
    data = file |> File.read!() |> Jason.decode!()

    ((get_in(data, ["guide", "photos"]) || []) ++
       Enum.flat_map(data["places"] || [], &(&1["photos"] || [])))
    |> Enum.map(& &1["src"])
  end

  defp optimize_src(src) do
    case String.split(src, "/") do
      ["", "photos", "steakhouse", city, file] ->
        label = Path.rootname(file)
        out_dir = Path.join(["priv", "static", "photos", "steakhouse", city])
        File.mkdir_p!(out_dir)

        case Ethos.PhotoOptimizer.optimize(find_source!(label), out_dir, label) do
          {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
          {:error, reason} -> Mix.raise("failed #{label}: #{inspect(reason)}")
        end

      _ ->
        Mix.raise("unexpected photo src path #{src} (want /photos/steakhouse/{city}/{label}.jpg)")
    end
  end

  # Provenance is Ethos.PhotoManifest's job, not this task's: the manifest is
  # what keeps a page's printed author and licence attached to the pixels beside
  # them, and a per-task reimplementation of that check is how one copy drifts
  # weaker than the rest.
  defp find_source!(label) do
    path =
      Enum.find_value(@source_exts, fn ext ->
        path = Path.join(["images", "steakhouse", "#{label}.#{ext}"])
        if File.exists?(path), do: path
      end) || Mix.raise("no source image for #{label} under images/steakhouse/")

    try do
      Ethos.PhotoManifest.verify!(@manifest_path, label, path)
    rescue
      e -> Mix.raise(Exception.message(e))
    end

    path
  end
end
