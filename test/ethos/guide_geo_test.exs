defmodule Ethos.GuideGeoTest do
  @moduledoc """
  A guide's geography, which is now one column: `destination_id`.

  This file used to cover the four that went with the destination tree —
  `state`, `state_slug`, `county`, `county_slug` — and the `GROUP BY` queries
  over them that built the pre-tree state and county hubs
  (`Guides.list_states/0`, `list_counties_for_state/1`,
  `list_published_guides_for_state/1`, `list_published_guides_for_county/2`).
  Those columns and those queries are gone: a hub is a node, and the guides on
  it are the ones filed against it by id. `Guides.list_published_guides_for_node/1`
  is what replaced all four, and it is covered by the hub tests in
  `destination_controller_test.exs`. What is left here is the attachment itself.
  """
  use Ethos.DataCase, async: true

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

  # The other shape, and the one the web UI produces: a guide whose author typed
  # a destination and named no node. It must be creatable — refusing it would
  # take authoring offline — and it must carry no geography rather than an
  # invented one.
  test "a guide with no destination node carries no geography" do
    user = Ethos.AccountsFixtures.user_fixture()

    {:ok, guide} =
      Ethos.Guides.create_guide(user, %{title: "Roman Holiday", destination: "Rome, Italy"})

    assert guide.destination_slug == "rome"
    refute guide.destination_id
  end
end
