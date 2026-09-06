defmodule Mix.Tasks.Ethos.OptimizeKoreanBbqPhotos do
  @shortdoc "Optimizes Korean BBQ photos from images/korean_bbq/ into priv/photos/{country}/korean-bbq/"
  @moduledoc """
  Scans `priv/seed_data/korean_bbq/*.json` for photo srcs and optimizes
  `images/korean_bbq/{label}.*` accordingly.

  The output root varies by country, because this collection is not one
  destination but ten guides across two of them: Los Angeles, Chicago,
  Chicago's north suburbs, the South Bay, Puget Sound, Manhattan, Queens and
  Brooklyn are United States guides; London is a United Kingdom guide. So a
  src has the shape `/photos/{country}/korean-bbq/{zone}/{label}.jpg` —
  `country` is `us` or `gb`, `zone` is the guide's own slug (`los-angeles`,
  `manhattan`, `london`, ...) — and `optimize_src/1` builds the output
  directory from whichever country and zone the src actually named, rather
  than assuming a fixed one the way the London task assumes `gb/london`.

  ## What this refuses, and why it is not a copyright question at all

  Every predecessor task's subject rule turns on which STRUCTURES a freedom-
  of-panorama statute reaches. s.62 CDPA 1988 is broad enough to publish the
  Shard without a blocklist; 17 USC 120(a) is narrow enough that San
  Francisco needs one for public sculpture. Either way the question is: does
  the law let us publish a photo of this building?

  This collection asks a different question, and no statute answers it. s.62
  exempts photographing a BUILDING from a public place and says nothing about
  what is on the tables inside it; 17 USC 120(a) covers architectural works
  only and has no American equivalent for an interior at all. A restaurant's
  dining room is not a building in the sense either statute means, and a
  photograph of one raises model-release and trade-dress questions no
  Commons licence tag was ever written to answer — the CC BY tag on a
  photograph of a dining room says who may reuse the IMAGE; it says nothing
  about the people sitting in it or the branded interior design the
  restaurant itself may control.

  So this collection publishes EXTERIORS AND STREETSCAPES ONLY — a storefront,
  a building, a street — and the rule below is stricter than any law
  requires, because a restaurant interior is simply not the kind of subject
  this corpus will publish, independent of whether photographing it would be
  lawful. London's rule was about which structures the law reaches; this one
  is about which subjects the corpus will publish at all.

  Where Commons holds no photograph of a given restaurant — which will be
  common, since Commons contributors photograph landmarks far more often
  than storefronts — the right answer is not to reach for an interior, a
  dish or a portrait. It is a STREETSCAPE OF THE BLOCK the guide sends a
  reader to: West 32nd Street, Northern Boulevard in Murray Hill, Pacific
  Highway South. That is still a truthful photograph of where the guide
  points, without publishing any of the subjects this task refuses.
  """
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)
  @manifest_path "priv/seed_data/korean_bbq_photo_manifest.json"

  @excluded_subjects [
    {"interior", "an interior, not the exteriors-and-streetscapes this collection publishes"},
    {"dining-room", "a dining room, which raises model-release and trade-dress questions no licence tag answers"},
    {"dining_room", "a dining room, which raises model-release and trade-dress questions no licence tag answers"},
    {"table", "a table setting, an interior subject this collection does not publish"},
    {"banchan", "a food photograph, not the exteriors-and-streetscapes this collection publishes"},
    {"dish", "a food photograph, not the exteriors-and-streetscapes this collection publishes"},
    {"plate", "a food photograph, not the exteriors-and-streetscapes this collection publishes"},
    {"food", "a food photograph, not the exteriors-and-streetscapes this collection publishes"},
    {"portrait", "a portrait, which raises a model-release question no licence tag answers"},
    {"diner", "a photograph of a person eating, which raises a model-release question no licence tag answers"},
    {"staff", "a photograph of a person working, which raises a model-release question no licence tag answers"},
    {"mural", "a graphic work, not the exteriors-and-streetscapes this collection publishes"},
    {"street-art", "a graphic work, not the exteriors-and-streetscapes this collection publishes"},
    {"graffiti", "a graphic work, not the exteriors-and-streetscapes this collection publishes"},
    {"neon", "an interior sign detail, not the exteriors-and-streetscapes this collection publishes"}
  ]

  @impl true
  def run(_args) do
    files = Path.wildcard("priv/seed_data/korean_bbq/*.json")

    if files == [] do
      Mix.raise(
        "no seed files matched priv/seed_data/korean_bbq/*.json — run this from the project root"
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
      ["", "photos", country, "korean-bbq", zone, file] ->
        label = Path.rootname(file)
        refute_excluded_subject!(label)
        out_dir = Path.join(["priv", "photos", country, "korean-bbq", zone])
        File.mkdir_p!(out_dir)

        case Ethos.PhotoOptimizer.optimize(find_source!(label), out_dir, label) do
          {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
          {:error, reason} -> Mix.raise("failed #{label}: #{inspect(reason)}")
        end

      _ ->
        Mix.raise(
          "unexpected photo src path #{src} (want /photos/{country}/korean-bbq/{zone}/{label}.jpg)"
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
        refusing to optimize #{label}: it names #{needle}, which is #{why}.

        This collection publishes exteriors and streetscapes only — a storefront, a building, \
        a street. A restaurant's dining room is not a building in the sense any freedom-of-\
        panorama statute means, and a photograph of one raises model-release and trade-dress \
        questions no Commons licence tag was ever written to answer. Where Commons holds no \
        photograph of this restaurant, photograph the block the guide sends a reader to instead; \
        renaming the file is not a way around this.\
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
        path = Path.join(["images", "korean_bbq", "#{label}.#{ext}"])
        if File.exists?(path), do: path
      end) || Mix.raise("no source image for #{label} under images/korean_bbq/")

    try do
      Ethos.PhotoManifest.verify!(@manifest_path, label, path)
    rescue
      e -> Mix.raise(Exception.message(e))
    end

    path
  end
end
