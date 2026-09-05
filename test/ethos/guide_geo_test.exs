defmodule Ethos.GuideGeoTest do
  use Ethos.DataCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Guides

  test "changeset derives state_slug and county_slug" do
    guide =
      published_guide_fixture(%{
        title: "Waterbury guide",
        destination: "Waterbury, Connecticut",
        state: "Connecticut",
        county: "New Haven County"
      })

    assert guide.state_slug == "connecticut"
    assert guide.county_slug == "new-haven-county"
  end

  test "guides without state keep nil geo slugs" do
    guide = published_guide_fixture(%{title: "Rome", destination: "Rome, Italy"})
    assert guide.state_slug == nil
    assert guide.county_slug == nil
  end

  test "list_states / list_counties_for_state / hub listings" do
    published_guide_fixture(%{
      title: "Waterbury",
      destination: "Waterbury, Connecticut",
      state: "Connecticut",
      county: "New Haven County"
    })

    published_guide_fixture(%{
      title: "Woodbury",
      destination: "Woodbury, Connecticut",
      state: "Connecticut",
      county: "Litchfield County"
    })

    # Rome-style guide without geo — must not appear in state listings
    published_guide_fixture(%{title: "Rome", destination: "Rome, Italy"})

    assert [%{state: "Connecticut", slug: "connecticut", count: 2}] = Guides.list_states()

    counties = Guides.list_counties_for_state("connecticut")

    assert Enum.map(counties, & &1.slug) |> Enum.sort() == [
             "litchfield-county",
             "new-haven-county"
           ]

    assert length(Guides.list_published_guides_for_state("connecticut")) == 2

    assert [%{title: "Woodbury"}] =
             Guides.list_published_guides_for_county("connecticut", "litchfield-county")
  end

  test "a guide can be attached to a destination node" do
    node =
      Ethos.Destinations.upsert_destination!(%{
        path: "united-states/connecticut/litchfield-county/woodbury",
        name: "Woodbury",
        kind: "town",
        intro: "Woodbury."
      })

    user = Ethos.AccountsFixtures.user_fixture()

    {:ok, guide} =
      Ethos.Guides.create_guide(user, %{
        title: "Woodbury",
        destination: "Woodbury, Connecticut",
        destination_id: node.id
      })

    assert guide.destination_id == node.id
  end
end
