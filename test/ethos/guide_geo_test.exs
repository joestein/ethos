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

  # Hawaii's "Lānaʻi, Hawaii" derived "l-na-i": the macron in "ā" and the ʻokina
  # (U+02BB) are outside [a-z0-9], so each became a hyphen and the destination
  # hub sat on a URL no reader could guess or type. derive_destination_slug/1
  # now transliterates first. The fix is only defensible if it is ADDITIVE, so
  # the first test below is the binding one: it pins real corpus destinations to
  # the exact slugs they derived BEFORE the change, and it fails if the new step
  # perturbs any pure-ASCII input by a single byte.
  describe "derive_destination_slug/1 transliteration" do
    test "pure-ASCII destinations derive byte-identically to what they always did" do
      # Baselines captured from the deriver as it stood before transliteration.
      for {destination, slug} <- [
            {"Bandon, Oregon", "bandon"},
            {"Burlington, Iowa", "burlington"},
            {"Las Vegas, Nevada", "las-vegas"},
            {"University Place, Washington", "university-place"},
            {"St. Louis, Missouri", "st-louis"},
            {"Waterbury, Connecticut", "waterbury"},
            {"County of Maui", "county-of-maui"},
            {"Jefferson Parish", "jefferson-parish"},
            {"Metropolitan Government of Nashville and Davidson County",
             "metropolitan-government-of-nashville-and-davidson-county"}
          ] do
        assert Guide.derive_destination_slug(destination) == slug,
               "#{inspect(destination)} is pure ASCII and must derive #{inspect(slug)} " <>
                 "exactly as it did before transliteration was added, but derived " <>
                 inspect(Guide.derive_destination_slug(destination))
      end
    end

    test "a macron and an ʻokina transliterate rather than hyphenate" do
      # The case that produced the rule. Not "lana-i": the ʻokina is a letter in
      # Hawaiian orthography with no ASCII equivalent, so it is dropped.
      assert Guide.derive_destination_slug("Lānaʻi, Hawaii") == "lanai"
      assert Guide.derive_destination_slug("Lānaʻi") == "lanai"
    end

    test "diacritics generally fall back to their base letter" do
      assert Guide.derive_destination_slug("Montréal, Québec") == "montreal"
      assert Guide.derive_destination_slug("Zürich, Switzerland") == "zurich"
      assert Guide.derive_destination_slug("Ñuñoa, Chile") == "nunoa"
      assert Guide.derive_destination_slug("São Paulo, Brazil") == "sao-paulo"
    end

    test "a guide changeset carries the transliterated destination_slug" do
      guide =
        published_guide_fixture(%{
          title: "Lānaʻi golf guide",
          destination: "Lānaʻi, Hawaii"
        })

      assert guide.destination_slug == "lanai"
    end
  end
end
