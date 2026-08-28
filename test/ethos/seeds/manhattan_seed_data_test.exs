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
    assert files != []

    Ethos.SeedDataHelpers.assert_place_slugs_globally_unique!()

    # licenses + photo existence
    # Photos are served from priv/photos by their own Plug.Static, not from
    # priv/static — see EthosWeb.Endpoint.
    static_root = Path.expand("../../../priv", __DIR__)

    for f <- files, p <- all_photos(DataGuide.load!(f)) do
      assert allowed_license?(p["license"]),
             "#{Path.basename(f)}: bad license #{inspect(p["license"])}"

      assert File.exists?(Path.join(static_root, p["src"])), "missing #{p["src"]}"
      assert File.exists?(Path.join(static_root, p["thumb"])), "missing #{p["thumb"]}"
    end

    # two-pass load, twice (idempotency)
    user = user_fixture()

    for _pass <- 1..2 do
      Enum.each(files, &DataGuide.upsert_places!/1)
      Enum.each(files, &DataGuide.upsert_guide!(&1, user.email))
      Enum.each(files, &DataGuide.upsert_links!/1)
    end

    manhattan_guides =
      Ethos.Guides.list_published_guides() |> Enum.filter(&(&1.county == "Manhattan"))

    assert length(manhattan_guides) == length(files)
  end
end
