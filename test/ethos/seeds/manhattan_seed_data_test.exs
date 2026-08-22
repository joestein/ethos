defmodule Ethos.Seeds.ManhattanSeedDataTest do
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures
  alias Ethos.Seeds.DataGuide

  @seed_glob Path.expand("../../../priv/seed_data/manhattan/*.json", __DIR__)

  defp files, do: @seed_glob |> Path.wildcard() |> Enum.sort()

  defp all_photos(data) do
    (get_in(data, ["guide", "photos"]) || []) ++
      Enum.flat_map(data["places"], &(&1["photos"] || []))
  end

  defp allowed_license?(l),
    do: l in ["Public domain", "CC0"] or Regex.match?(~r/^CC BY(-SA)? \d\.\d$/, l)

  test "every committed manhattan seed file is valid, unique, and loads twice" do
    files = files()

    if files != [] do
      # global place-slug ownership: a slug is defined in exactly one file
      owned =
        for f <- files, p <- DataGuide.load!(f)["places"], do: {p["slug"], Path.basename(f)}

      dups =
        owned
        |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
        |> Enum.filter(fn {_slug, fs} -> length(fs) > 1 end)

      assert dups == [], "place slugs defined in multiple files: #{inspect(dups)}"

      # licenses
      for f <- files, p <- all_photos(DataGuide.load!(f)) do
        assert allowed_license?(p["license"]),
               "#{Path.basename(f)}: bad license #{inspect(p["license"])}"
      end

      # two-pass load, twice (idempotency)
      user = user_fixture()

      for _pass <- 1..2 do
        Enum.each(files, &DataGuide.upsert_places!/1)
        Enum.each(files, &DataGuide.upsert_guide!(&1, user.email))
      end

      manhattan_guides =
        Ethos.Guides.list_published_guides() |> Enum.filter(&(&1.county == "Manhattan"))

      assert length(manhattan_guides) == length(files)
    end
  end
end
