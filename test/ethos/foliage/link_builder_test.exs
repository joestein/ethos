defmodule Ethos.Foliage.LinkBuilderTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.Links
  alias Ethos.Seeds.DataGuide
  alias Ethos.Foliage.LinkBuilder

  # Avon and Canton are consecutive stops on the committed `hartford-west`
  # route (priv/foliage/routes.json), so `LinkBuilder.build!/0` should link
  # their guides directly. Every other route's guides are deliberately left
  # unseeded here, so `build!/0` also exercises its skip-if-missing rescue
  # across dozens of pairs on every run — that path is what this test file
  # exists to cover.
  @avon Path.expand("../../../priv/seed_data/connecticut/avon.json", __DIR__)
  @canton Path.expand("../../../priv/seed_data/connecticut/canton.json", __DIR__)

  test "build!/0 creates a same-region edge between guides sharing a route" do
    user = user_fixture()

    for path <- [@avon, @canton] do
      # The loader resolves each file's destination_path against the
      # destinations table and raises on a miss, so its nodes come first.
      Ethos.SeedDataHelpers.seed_destinations_for_file!(path)
      DataGuide.upsert_places!(path)
      DataGuide.upsert_guide!(path, user.email)
    end

    avon = Ethos.Guides.get_published_guide_by_slug!("avon-ct-travel-guide")

    assert :ok = LinkBuilder.build!()

    connected = Links.links_for("guide", avon.id)

    assert Enum.any?(
             connected,
             &(&1.other.slug == "canton-ct-travel-guide" and &1.kind == "same-region")
           )
  end

  test "build!/0 does not raise when a route's guides are unseeded" do
    # No guides seeded at all: every one of the 93 stops across the seven
    # routes resolves to a missing guide, so this exercises the rescue path
    # end to end and proves it swallows rather than propagates.
    assert :ok = LinkBuilder.build!()
  end
end
