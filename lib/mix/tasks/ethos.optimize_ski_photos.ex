defmodule Mix.Tasks.Ethos.OptimizeSkiPhotos do
  @shortdoc "Optimizes ski photos from images/ski/ into priv/photos/ski/{slug}/"
  @moduledoc """
  Scans `priv/seed_data/ski/*.json` for photo srcs and optimizes
  `images/ski/{label}.*` accordingly.

  A src has the shape `/photos/ski/{slug}/{label}.jpg`, where `slug` is the ski
  area's own slug — the roster row, the seed file's basename and the place slug
  are all the same name. There is no country segment, unlike
  `Mix.Tasks.Ethos.OptimizeSteakhousePhotos`, and that is a decision rather than
  an oversight: a steakhouse called Hawksmoor exists in more than one country,
  while a ski area's slug is globally unique across the whole programme, so a
  later Canadian or Japanese round can write `/photos/ski/{slug}/` with no risk
  of collision and no migration of the paths this round writes.

  The destination root is `priv/photos/`, the directory the endpoint's own
  `/photos` `Plug.Static` serves (`from: {:ethos, "priv/photos"}`) — see
  `endpoint.ex`. `priv/static/` is not this: `EthosWeb.static_paths/0` never
  lists a `photos` directory, so a file written there would exist on disk and
  404 in production. `Ethos.Seeds.SkiSeedDataTest`'s photo test resolves a src
  the same way, by stripping the leading `/photos/` and joining under
  `priv/photos/`.

  ## The manifest

  `priv/seed_data/ski_photo_manifest.json` is a provenance manifest in the shape
  of `priv/seed_data/steakhouse_photo_manifest.json`: a flat object keyed by
  `label`, each value

      {"sha256": "<hex sha256 of the source file>",
       "source_url": "https://commons.wikimedia.org/wiki/File:..."}

  `find_source!/1` calls `Ethos.PhotoManifest.verify!/3`, which raises unless the
  label is present and its recorded sha256 matches the file found under
  `images/ski/`. It ships empty (`{}`) because no ski guide exists yet; each
  content wave adds its own rows before running this task.

  ## Running it against an empty corpus

  Run with no seed files present and this prints a message and exits zero rather
  than raising — the corpus not existing yet is not this task's error to report.

  Many guides ship photoless by design (spec §6: Commons has nothing for a great
  many small hills, and a guide without a photo is better than a guide with a
  borrowed substitute), so a run that optimizes far fewer photos than there are
  seed files is the expected case, not a symptom.
  """
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)
  @manifest_path "priv/seed_data/ski_photo_manifest.json"

  @impl true
  def run(_args) do
    files = Path.wildcard("priv/seed_data/ski/*.json")

    if files == [] do
      Mix.shell().info(
        "no seed files matched priv/seed_data/ski/*.json — nothing to optimize yet"
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
      ["", "photos", "ski", slug, file] ->
        label = Path.rootname(file)
        out_dir = Path.join(["priv", "photos", "ski", slug])
        File.mkdir_p!(out_dir)

        case Ethos.PhotoOptimizer.optimize(find_source!(label), out_dir, label) do
          {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
          {:error, reason} -> Mix.raise("failed #{label}: #{inspect(reason)}")
        end

      _ ->
        Mix.raise("unexpected photo src path #{src} (want /photos/ski/{slug}/{label}.jpg)")
    end
  end

  # Provenance is Ethos.PhotoManifest's job, not this task's: the manifest is
  # what keeps a page's printed author and licence attached to the pixels beside
  # them, and a per-task reimplementation of that check is how one copy drifts
  # weaker than the rest.
  defp find_source!(label) do
    path =
      Enum.find_value(@source_exts, fn ext ->
        path = Path.join(["images", "ski", "#{label}.#{ext}"])
        if File.exists?(path), do: path
      end) || Mix.raise("no source image for #{label} under images/ski/")

    try do
      Ethos.PhotoManifest.verify!(@manifest_path, label, path)
    rescue
      e -> Mix.raise(Exception.message(e))
    end

    path
  end
end
