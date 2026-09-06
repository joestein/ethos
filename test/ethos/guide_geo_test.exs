defmodule Ethos.GuideGeoTest do
  use Ethos.DataCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Guides
  alias Ethos.Guides.Guide
  alias Ethos.Places.Place

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
          destination: "Lānaʻi, Hawaii",
          state: "Hawaii",
          county: "County of Maui"
        })

      assert guide.destination_slug == "lanai"
      assert guide.state_slug == "hawaii"
      assert guide.county_slug == "county-of-maui"
    end

    # Place.changeset/2 shares this deriver, and every Hawaii place record
    # carries town "Lānaʻi". If the place's town_slug and the guide's
    # destination_slug disagreed, the guide and its places would sit on two
    # different hubs.
    test "a place's town_slug derives the same way as the guide's destination_slug" do
      changeset =
        Place.changeset(%Place{}, %{
          slug: "manele-golf-course",
          name: "Manele Golf Course",
          kind: "attraction",
          town: "Lānaʻi",
          state: "Hawaii",
          county: "County of Maui",
          summary: "Golf course above Manele Bay."
        })

      assert changeset.valid?
      assert Ecto.Changeset.get_change(changeset, :town_slug) == "lanai"
      assert Ecto.Changeset.get_change(changeset, :state_slug) == "hawaii"

      assert Ecto.Changeset.get_change(changeset, :town_slug) ==
               Guide.derive_destination_slug("Lānaʻi, Hawaii")
    end
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
end
