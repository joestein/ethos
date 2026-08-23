defmodule Ethos.Seeds.ConnecticutSeedDataTest do
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures
  alias Ethos.Seeds.DataGuide

  @ct_glob Path.expand("../../../priv/seed_data/connecticut/*.json", __DIR__)
  @manhattan_glob Path.expand("../../../priv/seed_data/manhattan/*.json", __DIR__)
  @static_root Path.expand("../../../priv/static", __DIR__)
  @manifest_path Path.expand("../../../priv/seed_data/connecticut_photo_manifest.json", __DIR__)

  defp ct_files, do: @ct_glob |> Path.wildcard() |> Enum.sort()

  defp all_photos(data) do
    (get_in(data, ["guide", "photos"]) || []) ++
      Enum.flat_map(data["places"], &(&1["photos"] || []))
  end

  defp allowed_license?(l),
    do: l in ["Public domain", "CC0"] or Regex.match?(~r/^CC BY(-SA)? \d\.\d$/, l)

  test "every committed connecticut seed file is valid, globally unique, and loads twice" do
    files = ct_files()

    # The expansion has shipped: this gate is no longer allowed to pass vacuously.
    assert length(files) == 109,
           "expected 109 connecticut seed files, found #{length(files)}"

    # place-slug ownership across connecticut + manhattan + CT-5 code module
    json_owned =
      for f <- files ++ Path.wildcard(@manhattan_glob),
          p <- DataGuide.load!(f)["places"],
          # Directory-qualified: connecticut/ and manhattan/ may hold the same
          # basename, which would hide a genuine cross-destination collision.
          do: {p["slug"], Path.join(Path.basename(Path.dirname(f)), Path.basename(f))}

    code_owned =
      for p <- Ethos.Seeds.ConnecticutPlaces.places(), do: {p.slug, "connecticut_places.ex"}

    dups =
      (json_owned ++ code_owned)
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
      # length/1, not uniq — two places sharing a slug inside ONE file collide too.
      |> Enum.filter(fn {_slug, owners} -> length(owners) > 1 end)

    assert dups == [], "place slugs with multiple owners: #{inspect(dups)}"

    # licenses
    for f <- files, p <- all_photos(DataGuide.load!(f)) do
      assert allowed_license?(p["license"]),
             "#{Path.basename(f)}: bad license #{inspect(p["license"])}"
    end

    # Tier invariants. The rules doc's "6+ places → full guide" is the authoring
    # decision for a new town; this gate is the backstop for clear mislabels, not
    # the arbiter of editorial judgement. A town-page shipping 6+ places is
    # mislabelled rich content. A guide shipping fewer than 4 places is padding or
    # a mislabel. Roxbury sits legitimately between: 5 places, but 3 sections,
    # 5 FAQ and 3 photos of genuinely verified material.
    tier_violations =
      for f <- files,
          data = DataGuide.load!(f),
          tier = data["guide"]["tier"] || "guide",
          n = length(data["places"]),
          violation =
            (cond do
               tier == "guide" and n < 4 -> "full guide with only #{n} places"
               tier == "town-page" and n >= 6 -> "town-page with #{n} places — should be a guide"
               true -> nil
             end),
          not is_nil(violation),
          do: {Path.basename(f), violation}

    assert tier_violations == [], "tier does not match place count: #{inspect(tier_violations)}"

    # The floor an orientation page must clear, or it should not have shipped.
    floor_violations =
      for f <- files,
          data = DataGuide.load!(f),
          (data["guide"]["tier"] || "guide") == "town-page",
          words = data["guide"]["intro"] |> String.split(~r/\s+/, trim: true) |> length(),
          links = length(data["links"] || []),
          violation =
            (cond do
               words < 90 -> "intro is #{words} words, floor is 90"
               links < 3 -> "only #{links} outbound links, floor is 3"
               true -> nil
             end),
          not is_nil(violation),
          do: {Path.basename(f), violation}

    assert floor_violations == [],
           "orientation pages below the floor: #{inspect(floor_violations)}"

    # Photo labels are the optimizer's lookup key: mix ethos.optimize_connecticut_photos
    # resolves every /photos/ct/{town}/{label}.jpg from images/connecticut/{label}.*, so
    # one label may never stand for two different source images.
    label_sources =
      for f <- files,
          p <- all_photos(DataGuide.load!(f)),
          do: {Path.rootname(Path.basename(p["src"])), p["source_url"]}

    label_dups =
      label_sources
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
      |> Enum.filter(fn {_label, sources} -> length(Enum.uniq(sources)) > 1 end)

    assert label_dups == [],
           "photo labels standing for more than one image: #{inspect(label_dups)}"

    # Every referenced photo must actually be on disk, full size and thumb, or the
    # guide renders a broken image. mix ethos.optimize_connecticut_photos writes these.
    missing =
      for f <- files,
          p <- all_photos(DataGuide.load!(f)),
          path <- [p["src"], p["thumb"]],
          path not in [nil, ""],
          not File.exists?(Path.join(@static_root, path)),
          do: {Path.basename(f), path}

    assert missing == [], "seed photos with no optimized file on disk: #{inspect(missing)}"

    # The manifest pins each label to the Commons file it came from, so the author
    # and licence a page prints always belong to the image beside them.
    manifest = @manifest_path |> File.read!() |> Jason.decode!()

    unpinned =
      for f <- files,
          p <- all_photos(DataGuide.load!(f)),
          label = Path.rootname(Path.basename(p["src"])),
          manifest[label]["source_url"] != p["source_url"],
          do: {Path.basename(f), label, manifest[label]["source_url"], p["source_url"]}

    assert unpinned == [],
           "photos whose manifest provenance disagrees with the published credit: #{inspect(unpinned)}"

    # Seed the link-target universe (mirrors prod seeding order):
    user = user_fixture()

    Ethos.Seeds.ConnecticutPlaces.upsert_all!()

    for mod <- [
          Ethos.Seeds.WaterburyGuide,
          Ethos.Seeds.MiddleburyGuide,
          Ethos.Seeds.DanburyGuide,
          Ethos.Seeds.SouthburyGuide,
          Ethos.Seeds.WoodburyGuide
        ],
        do: mod.upsert!(user.email)

    manhattan_files = @manhattan_glob |> Path.wildcard() |> Enum.sort()
    Enum.each(manhattan_files, &DataGuide.upsert_places!/1)
    Enum.each(manhattan_files, &DataGuide.upsert_guide!(&1, user.email))
    Enum.each(manhattan_files, &DataGuide.upsert_links!/1)

    # three-pass load, twice
    for _pass <- 1..2 do
      Enum.each(files, &DataGuide.upsert_places!/1)
      Enum.each(files, &DataGuide.upsert_guide!(&1, user.email))
      Enum.each(files, &DataGuide.upsert_links!/1)
    end

    ct_guides =
      Ethos.Guides.list_published_guides()
      |> Enum.filter(
        &(&1.state == "Connecticut" and String.ends_with?(&1.slug, "-ct-travel-guide"))
      )

    assert length(ct_guides) == length(files) + 5
  end
end
