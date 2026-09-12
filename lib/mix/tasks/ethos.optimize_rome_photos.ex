defmodule Mix.Tasks.Ethos.OptimizeRomePhotos do
  @shortdoc "Optimizes Rome photos from images/rome/ into priv/photos/it/rome/, driven by seed JSONs"
  @moduledoc """
  Scans `priv/seed_data/rome/*.json` for photo srcs and optimizes
  `images/rome/{label}.*` accordingly.

  Mirrors the Bronx and Queens tasks with two differences.

  The output root is `priv/photos/it/rome/` rather than `priv/photos/ny/`,
  because Rome is the first destination outside the United States and the
  first path segment is the country.

  It also refuses a label naming a subject whose architect's copyright is
  still live. Italy has no freedom of panorama, so a photograph of such a
  building is an infringing derivative work no matter what licence the
  photographer applied and no matter that it was shot from a public street.
  `Ethos.Seeds.RomeSeedDataTest` holds the same blocklist and is the primary
  gate; this is a second copy at the last point before pixels land in `priv/`,
  because the scoping wave established that the usual signal is absent — CC
  licensed Commons photographs of MAXXI and Meier's Ara Pacis carry no
  restriction tag at all. The two copies are deliberate duplication: a
  reviewer changing one is meant to notice the other.
  """
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)
  @manifest_path "priv/seed_data/rome_photo_manifest.json"

  # Keep in sync with @live_copyright_subjects in
  # test/ethos/seeds/rome_seed_data_test.exs.
  @live_copyright_subjects [
    {"maxxi", "Zaha Hadid died 2016; protected to 2087"},
    {"ara-pacis-museum", "Richard Meier is living"},
    {"auditorium-parco-della-musica", "Renzo Piano is living"},
    {"palazzo-della-civilta", "co-architect Giovanni Guerrini died 1972; blocked until 2043"},
    {"square-colosseum", "the Palazzo della Civilta Italiana under its nickname"}
  ]

  @impl true
  def run(_args) do
    files = Path.wildcard("priv/seed_data/rome/*.json")

    if files == [] do
      Mix.raise(
        "no seed files matched priv/seed_data/rome/*.json — run this from the project root"
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
      ["", "photos", "it", "rome", zone, file] ->
        label = Path.rootname(file)
        refute_live_copyright!(label)
        out_dir = Path.join(["priv", "photos", "it", "rome", zone])
        File.mkdir_p!(out_dir)

        case Ethos.PhotoOptimizer.optimize(find_source!(label), out_dir, label) do
          {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
          {:error, reason} -> Mix.raise("failed #{label}: #{inspect(reason)}")
        end

      _ ->
        Mix.raise("unexpected photo src path #{src} (want /photos/it/rome/{zone}/{label}.jpg)")
    end
  end

  defp refute_live_copyright!(label) do
    downcased = String.downcase(label)

    case Enum.find(@live_copyright_subjects, fn {needle, _} ->
           String.contains?(downcased, needle)
         end) do
      nil ->
        :ok

      {needle, why} ->
        Mix.raise("""
        refusing to optimize #{label}: it names #{needle}, whose architect's copyright is live \
        (#{why}).

        Italy has no freedom of panorama, so a photograph of this building is an infringing \
        derivative work regardless of the photographer's licence and regardless of a public-street \
        vantage. Choose a different subject; do not work around this by renaming the file.\
        """)
    end
  end

  # Provenance is Ethos.PhotoManifest's job, not this task's: the manifest is
  # what keeps a page's printed author and licence attached to the pixels beside
  # them, and a per-task reimplementation of that check is how one copy drifts
  # weaker than the rest. The manifest path is the only Rome-specific part.
  defp find_source!(label) do
    path =
      Enum.find_value(@source_exts, fn ext ->
        path = Path.join(["images", "rome", "#{label}.#{ext}"])
        if File.exists?(path), do: path
      end) || Mix.raise("no source image for #{label} under images/rome/")

    try do
      Ethos.PhotoManifest.verify!(@manifest_path, label, path)
    rescue
      e -> Mix.raise(Exception.message(e))
    end

    path
  end
end
