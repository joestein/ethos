defmodule Ethos.Seeds.ConnecticutSeedDataTest do
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures
  alias Ethos.Seeds.DataGuide

  @ct_glob Path.expand("../../../priv/seed_data/connecticut/*.json", __DIR__)
  @manhattan_glob Path.expand("../../../priv/seed_data/manhattan/*.json", __DIR__)

  defp ct_files, do: @ct_glob |> Path.wildcard() |> Enum.sort()

  defp all_photos(data) do
    (get_in(data, ["guide", "photos"]) || []) ++
      Enum.flat_map(data["places"], &(&1["photos"] || []))
  end

  defp allowed_license?(l),
    do: l in ["Public domain", "CC0"] or Regex.match?(~r/^CC BY(-SA)? \d\.\d$/, l)

  test "every committed connecticut seed file is valid, globally unique, and loads twice" do
    files = ct_files()

    if files != [] do
      # place-slug ownership across connecticut + manhattan + CT-5 code module
      json_owned =
        for f <- files ++ Path.wildcard(@manhattan_glob),
            p <- DataGuide.load!(f)["places"],
            do: {p["slug"], Path.basename(f)}

      code_owned =
        for p <- Ethos.Seeds.ConnecticutPlaces.places(), do: {p.slug, "connecticut_places.ex"}

      dups =
        (json_owned ++ code_owned)
        |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
        |> Enum.filter(fn {_slug, owners} -> length(Enum.uniq(owners)) > 1 end)

      assert dups == [], "place slugs with multiple owners: #{inspect(dups)}"

      # licenses
      for f <- files, p <- all_photos(DataGuide.load!(f)) do
        assert allowed_license?(p["license"]),
               "#{Path.basename(f)}: bad license #{inspect(p["license"])}"
      end

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
end
