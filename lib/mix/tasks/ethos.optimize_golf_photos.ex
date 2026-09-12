defmodule Mix.Tasks.Ethos.OptimizeGolfPhotos do
  @shortdoc "Optimizes golf photos from images/golf/ into priv/photos/us/golf/"
  @moduledoc """
  Scans `priv/seed_data/golf/*.json` for photo srcs and optimizes
  `images/golf/{label}.*` accordingly, into `priv/photos/us/golf/{state}/`.

  ## The path segment is the set, not the city

  San Francisco writes to `priv/photos/us/ca/san-francisco/{zone}/` — country,
  state, city. Golf writes to `priv/photos/us/golf/{state-slug}/` instead,
  because the set is national and its unit is the state rather than a city:
  fifty basecamps across fifty states would otherwise scatter the corpus into
  fifty single-file city directories that nothing else ever reads. The
  optimizer trusts this segment literally, and the seed-data gate asserts every
  golf photo src starts `/photos/us/golf/`, so a typo lands nowhere silently.

  ## What this refuses

  17 USC 120(a) permits pictorial representation of an **architectural work**
  ordinarily visible from a public place. It covers buildings — a clubhouse, a
  lodge, a hotel — and it does **not** cover sculptures, murals or other public
  artworks, which keep their own copyright. That is the same rule
  `ethos.optimize_sf_photos` enforces, and the exclusion list below is the same
  shape.

  A golf course itself is landscape, not an architectural work, and needs no
  exemption: a photograph of a fairway, a dune or a green is a photograph of
  land. What needs care is a course's commissioned sculpture or a clubhouse
  mural, which is why the list exists at all.

  `Ethos.Seeds.GolfSeedDataTest` holds the licence and on-disk assertions; this
  is a second copy of the subject rule at the last point before pixels land in
  `priv/`. The duplication is deliberate — a reviewer changing one is meant to
  notice the other.
  """
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)
  @manifest_path "priv/seed_data/golf_photo_manifest.json"

  # Keep in sync with the licence rule in the seed-data gate.
  @excluded_subjects [
    {"sculpture",
     "a sculpture keeps its own copyright — 17 USC 120(a) reaches architectural works only"},
    {"mural", "a mural is a pictorial work, not an architectural one"},
    {"statue", "a statue keeps its own copyright, whatever it stands next to"},
    {"memorial",
     "a memorial is commonly a sculptural work rather than a building; photograph the " <>
       "clubhouse or the landscape instead"}
  ]

  @impl true
  def run(_args) do
    files = Path.wildcard("priv/seed_data/golf/*.json")

    if files == [] do
      Mix.raise(
        "no seed files matched priv/seed_data/golf/*.json — run this from the project root"
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
      ["", "photos", "us", "golf", state, file] ->
        label = Path.rootname(file)
        refute_excluded_subject!(label)
        out_dir = Path.join(["priv", "photos", "us", "golf", state])
        File.mkdir_p!(out_dir)

        case Ethos.PhotoOptimizer.optimize(find_source!(label), out_dir, label) do
          {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
          {:error, reason} -> Mix.raise("failed #{label}: #{inspect(reason)}")
        end

      _ ->
        Mix.raise(
          "unexpected photo src path #{src} (want /photos/us/golf/{state-slug}/{label}.jpg)"
        )
    end
  end

  defp refute_excluded_subject!(label) do
    downcased = String.downcase(label)

    case Enum.find(@excluded_subjects, fn {needle, _} -> String.contains?(downcased, needle) end) do
      nil ->
        :ok

      {needle, why} ->
        Mix.raise("""
        refusing to optimize #{label}: it names #{needle} (#{why}).

        17 USC 120(a) covers architectural works ordinarily visible from a public place. \
        Photograph the clubhouse, the lodge or the landscape instead; do not work around \
        this by renaming the file.\
        """)
    end
  end

  defp find_source!(label) do
    path =
      Enum.find_value(@source_exts, fn ext ->
        path = Path.join(["images", "golf", "#{label}.#{ext}"])
        if File.exists?(path), do: path
      end) || Mix.raise("no source image for #{label} under images/golf/")

    try do
      Ethos.PhotoManifest.verify!(@manifest_path, label, path)
    rescue
      e -> Mix.raise(Exception.message(e))
    end

    path
  end
end
