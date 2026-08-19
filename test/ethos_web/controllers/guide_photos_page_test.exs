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
    assert [title_tag] = Regex.run(~r{<title[^>]*>(.*?)</title>}s, html, capture: :all_but_first)
    assert title_tag =~ "Pictures from Rome"
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

    refute html =~ "photos"
  end
end
