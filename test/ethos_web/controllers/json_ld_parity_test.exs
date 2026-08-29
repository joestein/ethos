defmodule EthosWeb.JsonLdParityTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.{Collections, Guides, Places}

  @place_attrs %{
    slug: "palace-theater-waterbury",
    name: "Palace Theater",
    kind: "theater",
    town: "Waterbury",
    state: "Connecticut",
    county: "New Haven County",
    summary: "A 1922 Thomas Lamb movie palace.",
    history: "Designed by **Thomas Lamb**.",
    address: "100 E. Main St., Waterbury, CT 06702",
    official_url: "https://palacetheaterct.org",
    status: "open",
    booking_url: nil,
    photos: [
      %{
        "src" => "/photos/ct/waterbury/palace-theater.jpg",
        "thumb" => "/photos/ct/waterbury/palace-theater_thumb.jpg",
        "title" => "Palace Theater",
        "description" => "The marquee.",
        "author" => "Jane Doe",
        "license" => "CC BY-SA 4.0",
        "source_url" => "https://commons.wikimedia.org/wiki/File:Palace.jpg"
      }
    ]
  }

  @photos [
    %{
      "src" => "/photos/rome/trevi-fountain.jpg",
      "thumb" => "/photos/rome/trevi-fountain_thumb.jpg",
      "title" => "Trevi Fountain",
      "description" => "Oceanus in afternoon sun."
    },
    %{
      "src" => "/photos/rome/arch-of-constantine.jpg",
      "thumb" => "/photos/rome/arch-of-constantine_thumb.jpg",
      "title" => "Arch of Constantine",
      "description" => "Triple arch beside the Colosseum."
    }
  ]

  # Every page type that emits a BreadcrumbList. The refactor in Task 1 is a
  # pure refactor: these blocks must be byte-identical before and after.
  test "breadcrumb JSON-LD is stable across every page type", %{conn: conn} do
    for path <- parity_paths() do
      html = conn |> get(path) |> html_response(200)
      crumb = json_ld_of_type(html, "BreadcrumbList")

      assert crumb, "no BreadcrumbList on #{path}"

      positions = Enum.map(crumb["itemListElement"], & &1["position"])

      assert positions == Enum.to_list(1..length(positions)),
             "positions on #{path} are not 1..n: #{inspect(positions)}"

      for item <- crumb["itemListElement"] do
        assert item["@type"] == "ListItem"
        assert is_binary(item["name"]) and item["name"] != ""
        assert is_binary(item["item"]) and String.starts_with?(item["item"], "http")
      end
    end
  end

  # Builds a fixture for every page type that emits a breadcrumb and returns
  # the path each is served at. Kept in one place so the parity test and the
  # raw before/after byte comparison walk exactly the same set of pages.
  def parity_paths do
    Places.upsert_place!(@place_attrs)

    guide = published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})

    photo_guide = published_guide_fixture(%{title: "Three Days", destination: "Rome, Italy"})
    {:ok, photo_guide} = Guides.update_guide_photos(photo_guide, @photos)

    # An orientation page (tier "town-page") plus the Connecticut state and
    # Windham County hubs it populates.
    town_page =
      Ethos.Seeds.DataGuide.upsert_from_file!(
        Path.expand("../../support/fixtures/seed_data/townville.json", __DIR__),
        user_fixture().email
      )

    Collections.upsert_collection!(%{
      slug: "burys-test",
      title: "Burys Test",
      intro: "Ten towns end in **-bury**.",
      published: true,
      items: [%{guide_slug: guide.slug, blurb: "The antiques one."}]
    })

    [
      # a place
      ~p"/p/palace-theater-waterbury",
      # a guide
      ~p"/g/#{guide.slug}",
      # a town-page-tier guide
      ~p"/g/#{town_page.slug}",
      # a guide photos page
      ~p"/g/#{photo_guide.slug}/photos",
      # the destinations index
      ~p"/destinations",
      # a state destination
      ~p"/destinations/connecticut",
      # a county destination
      ~p"/destinations/connecticut/windham-county",
      # a town destination
      ~p"/destinations/rome",
      # a collection
      ~p"/c/burys-test"
    ]
  end
end
