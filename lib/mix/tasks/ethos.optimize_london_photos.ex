defmodule Mix.Tasks.Ethos.OptimizeLondonPhotos do
  @shortdoc "Optimizes London photos from images/london/ into priv/photos/gb/london/"
  @moduledoc """
  Scans `priv/seed_data/london/*.json` for photo srcs and optimizes
  `images/london/{label}.*` accordingly.

  The output root is `priv/photos/gb/london/`, following the country-segment
  shape San Francisco and Rome use. New York's tree predates that segment and
  lives at `priv/photos/ny/`; that inconsistency is known and deliberately not
  migrated, because renaming it would move more than two hundred committed
  images for no reader benefit.

  ## What this refuses, and what it deliberately does not

  s.62 CDPA 1988 is the broadest freedom of panorama this corpus has met.
  s.4(2) defines a building as including any fixed structure and a part of one,
  so it is WIDER than 17 USC 120(a): it reaches sculptures, models for
  buildings and works of artistic craftsmanship as well, and s.62(3) permits
  issuing copies to the public — commercial publication, no attribution
  condition, no non-commercial limit.

  So there is NO modern-buildings blocklist here, and the architect's death
  date is not a thing this task knows or should be taught. The Shard publishes.
  Rome needed a four-gate rule and rejected MAXXI on exactly that ground; San
  Francisco needed a blocklist of public artworks because 17 USC 120(a) covers
  buildings only. London needs neither, and adding one back would be a
  restriction the law does not impose.

  What it refuses is the two things s.62 does not reach, and both are
  subject-side rather than licence-side — a clean CC tag on Commons says
  nothing about either:

    * **Graphic works.** s.4(2) defines them and s.62(1) does not name them, so
      a mural is out however permanently it is fixed to the wall. Banksy is a
      reject twice over, being a graphic work and living.
    * **Anything not permanently situated.** The Fourth Plinth commissions are
      sculptures in a public place and are still out, because the plinth is the
      one place in London whose whole point is that its occupant changes.

  A non-copyright restriction is recorded and NOT gated: the Royal Parks and
  Other Open Spaces Regulations 1997, reg. 4(18), require written permission
  for commercial photography in Hyde Park, Regent's Park, Greenwich Park and
  Richmond Park among others. That is the same shape as Italy's Codice dei beni
  culturali, which this corpus also records rather than enforces. Gating it
  would cost the Serpentine, the Albert Memorial and Greenwich's whole
  waterfront on a rule that is not copyright and that no photograph on Commons
  is tagged for.

  `Ethos.Seeds.LondonSeedDataTest` holds the same exclusion list and is the
  primary gate; this is a second copy at the last point before pixels land in
  `priv/`. The duplication is deliberate — a reviewer changing one is meant to
  notice the other.
  """
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)
  @manifest_path "priv/seed_data/london_photo_manifest.json"

  # Keep in sync with @excluded_subjects in the seed-data test.
  @excluded_subjects [
    {"fourth-plinth",
     "the Fourth Plinth is temporary, and s.62 reaches only what is permanently situated — " <>
       "Commons deleted Hahn/Cock, Gift Horse, Alison Lapper Pregnant, Ecce Homo and The End " <>
       "on that ground"},
    {"banksy",
     "a graphic work, and the artist is living — Commons deleted Category:Banksy in London " <>
       "on 31 December 2025. The EUIPO 'flower bomber' decision is a TRADE MARK bad-faith " <>
       "finding and is not a copyright licence"},
    {"mural", "a graphic work under s.4(2), which s.62(1) does not name"},
    {"street-art", "a graphic work under s.4(2), which s.62(1) does not name"},
    {"graffiti", "a graphic work under s.4(2), which s.62(1) does not name"}
  ]

  @impl true
  def run(_args) do
    files = Path.wildcard("priv/seed_data/london/*.json")

    if files == [] do
      Mix.raise(
        "no seed files matched priv/seed_data/london/*.json — run this from the project root"
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
      ["", "photos", "gb", "london", borough, file] ->
        label = Path.rootname(file)
        refute_excluded_subject!(label)
        out_dir = Path.join(["priv", "photos", "gb", "london", borough])
        File.mkdir_p!(out_dir)

        case Ethos.PhotoOptimizer.optimize(find_source!(label), out_dir, label) do
          {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
          {:error, reason} -> Mix.raise("failed #{label}: #{inspect(reason)}")
        end

      _ ->
        Mix.raise(
          "unexpected photo src path #{src} (want /photos/gb/london/{borough}/{label}.jpg)"
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
        refusing to optimize #{label}: it names #{needle}, which s.62 CDPA 1988 does not reach \
        (#{why}).

        s.62 is broad — it covers buildings, any fixed structure, and permanently situated \
        sculpture, and it does NOT care when the architect died. These two exclusions are the \
        whole of what it leaves out. Photograph a building or a permanent sculpture instead; do \
        not work around this by renaming the file.\
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
        path = Path.join(["images", "london", "#{label}.#{ext}"])
        if File.exists?(path), do: path
      end) || Mix.raise("no source image for #{label} under images/london/")

    try do
      Ethos.PhotoManifest.verify!(@manifest_path, label, path)
    rescue
      e -> Mix.raise(Exception.message(e))
    end

    path
  end
end
