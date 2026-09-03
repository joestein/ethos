defmodule Mix.Tasks.Ethos.OptimizeSfPhotos do
  @shortdoc "Optimizes San Francisco photos from images/san_francisco/ into priv/photos/us/ca/san-francisco/"
  @moduledoc """
  Scans `priv/seed_data/san_francisco/*.json` for photo srcs and optimizes
  `images/san_francisco/{label}.*` accordingly.

  The output root is `priv/photos/us/ca/san-francisco/`. New York's tree
  predates the country segment and lives at `priv/photos/ny/`; that
  inconsistency is known and deliberately not being migrated, because renaming
  it would move more than two hundred committed images for no reader benefit.

  Refuses a label naming a public ARTWORK whose artist's copyright is live.
  17 USC 120(a) permits pictorial representation of an architectural work
  visible from a public place, which is why San Francisco does not need Rome's
  four-gate rule — but it covers BUILDINGS ONLY. Sculptures, murals and other
  public artworks keep full copyright for life plus seventy years, and San
  Francisco is dense with them.

  `Ethos.Seeds.SanFranciscoSeedDataTest` holds the same blocklist and is the
  primary gate; this is a second copy at the last point before pixels land in
  `priv/`. The duplication is deliberate — a reviewer changing one is meant to
  notice the other.
  """
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)
  @manifest_path "priv/seed_data/san_francisco_photo_manifest.json"

  # Keep in sync with @live_artwork_subjects in the seed-data test.
  @live_artwork_subjects [
    {"cupids-span", "Claes Oldenburg d. 2022, Coosje van Bruggen d. 2009"},
    {"vaillancourt", "Armand Vaillancourt is living"},
    {"balmy-alley", "Mission murals, many artists living"},
    {"clarion-alley", "Mission murals, many artists living"},
    {"goldsworthy", "Andy Goldsworthy is living"},
    {"spire-presidio", "Andy Goldsworthy is living"}
  ]

  @impl true
  def run(_args) do
    files = Path.wildcard("priv/seed_data/san_francisco/*.json")

    if files == [] do
      Mix.raise(
        "no seed files matched priv/seed_data/san_francisco/*.json — run this from the project root"
      )
    end

    srcs = files |> Enum.flat_map(&photo_srcs/1) |> Enum.uniq()

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
      ["", "photos", "us", "ca", "san-francisco", zone, file] ->
        label = Path.rootname(file)
        refute_live_artwork!(label)
        out_dir = Path.join(["priv", "photos", "us", "ca", "san-francisco", zone])
        File.mkdir_p!(out_dir)

        case Ethos.PhotoOptimizer.optimize(find_source!(label), out_dir, label) do
          {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
          {:error, reason} -> Mix.raise("failed #{label}: #{inspect(reason)}")
        end

      _ ->
        Mix.raise(
          "unexpected photo src path #{src} (want /photos/us/ca/san-francisco/{zone}/{label}.jpg)"
        )
    end
  end

  defp refute_live_artwork!(label) do
    downcased = String.downcase(label)

    case Enum.find(@live_artwork_subjects, fn {needle, _} ->
           String.contains?(downcased, needle)
         end) do
      nil ->
        :ok

      {needle, why} ->
        Mix.raise("""
        refusing to optimize #{label}: it names #{needle}, a public artwork whose copyright is \
        live (#{why}).

        17 USC 120(a) covers architectural works, not sculptures or murals, so a public vantage \
        is no defence for this subject. Photograph a building instead; do not work around this \
        by renaming the file.\
        """)
    end
  end

  # Provenance is Ethos.PhotoManifest's job, not this task's: the manifest is
  # what keeps a page's printed author and licence attached to the pixels beside
  # them, and a per-task reimplementation of that check is how one copy drifts
  # weaker than the rest.
  defp find_source!(label) do
    path =
      Enum.find_value(@source_exts, fn ext ->
        path = Path.join(["images", "san_francisco", "#{label}.#{ext}"])
        if File.exists?(path), do: path
      end) || Mix.raise("no source image for #{label} under images/san_francisco/")

    try do
      Ethos.PhotoManifest.verify!(@manifest_path, label, path)
    rescue
      e -> Mix.raise(Exception.message(e))
    end

    path
  end
end
