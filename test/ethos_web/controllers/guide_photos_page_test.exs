defmodule EthosWeb.GuidePhotosPageTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Guides

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

  defp photo_guide do
    guide = published_guide_fixture(%{title: "Three Days", destination: "Rome, Italy"})
    {:ok, guide} = Guides.update_guide_photos(guide, @photos)
    guide
  end

  test "renders captions, alt text, back links, and ImageGallery JSON-LD", %{conn: conn} do
    guide = photo_guide()
    html = conn |> get(~p"/g/#{guide.slug}/photos") |> html_response(200)

    assert html =~ "Pictures from Rome"
    assert html =~ "Trevi Fountain"
    assert html =~ "Oceanus in afternoon sun."
    assert html =~ ~s(alt="Trevi Fountain")
    assert html =~ ~s(loading="lazy")
    assert html =~ "/photos/rome/trevi-fountain_thumb.jpg"
    assert html =~ "Back to the guide"
    assert html =~ ~s("@type":"ImageGallery")
    assert html =~ ~s("@type":"ImageObject")
    assert html =~ ~s(href="/photos/rome/trevi-fountain.jpg")
    full_image_url = url(~p"/") <> "photos/rome/trevi-fountain.jpg"
    assert html =~ ~s(property="og:image" content="#{full_image_url}")
    assert [title_tag] = Regex.run(~r{<title[^>]*>(.*?)</title>}s, html, capture: :all_but_first)
    assert title_tag =~ "Pictures from Rome"
  end

  test "photos breadcrumb is contiguous from 1 and ends on the photos page (short trail)", %{
    conn: conn
  } do
    guide = photo_guide()

    assert guide.state_slug == nil
    assert guide.county_slug == nil

    html = conn |> get(~p"/g/#{guide.slug}/photos") |> html_response(200)
    items = breadcrumb_json_ld(html)["itemListElement"]

    assert Enum.map(items, & &1["name"]) == [
             "Ethos",
             "Destinations",
             "Rome",
             "Three Days",
             "Photos"
           ]

    assert Enum.map(items, & &1["position"]) == [1, 2, 3, 4, 5]
    assert List.last(items)["item"] == url(~p"/g/#{guide.slug}/photos")
  end

  test "photos breadcrumb is contiguous from 1 and ends on the photos page (long trail)", %{
    conn: conn
  } do
    guide =
      published_guide_fixture(%{
        title: "A Day in Waterbury",
        destination: "Waterbury, Connecticut",
        state: "Connecticut",
        county: "New Haven County"
      })

    {:ok, guide} = Guides.update_guide_photos(guide, @photos)

    html = conn |> get(~p"/g/#{guide.slug}/photos") |> html_response(200)
    items = breadcrumb_json_ld(html)["itemListElement"]

    assert Enum.map(items, & &1["name"]) == [
             "Ethos",
             "Destinations",
             "Connecticut",
             "New Haven County",
             "A Day in Waterbury",
             "Photos"
           ]

    # The county crumb makes this trail one longer than the old hardcoded
    # `"position" => 5`, which would collide with the guide's own crumb.
    assert Enum.map(items, & &1["position"]) == [1, 2, 3, 4, 5, 6]
    assert List.last(items)["item"] == url(~p"/g/#{guide.slug}/photos")
  end

  test "404 when guide has no photos and for drafts", %{conn: conn} do
    guide = published_guide_fixture()
    assert conn |> get(~p"/g/#{guide.slug}/photos") |> response(404)

    draft = guide_fixture()
    {:ok, _} = Ethos.Guides.update_guide_photos(draft, @photos)
    assert conn |> get(~p"/g/#{draft.slug}/photos") |> response(404)
  end

  test "guide page shows a photo teaser when photos are present", %{conn: conn} do
    guide = photo_guide()
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ "See all 2 photos"
    assert html =~ "/photos/rome/trevi-fountain_thumb.jpg"
    assert html =~ ~p"/g/#{guide.slug}/photos"
  end

  test "guide page has no photo teaser when there are no photos", %{conn: conn} do
    guide = published_guide_fixture()
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    refute html =~ "See all"
  end
end
