defmodule EthosWeb.CopyLinkTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.{Guides, Places}

  test "entries render copy buttons: place URL when linked, anchor otherwise", %{conn: conn} do
    guide = published_guide_fixture()

    place =
      Places.upsert_place!(%{
        slug: "palace-theater-waterbury",
        name: "Palace Theater",
        kind: "theater",
        town: "Waterbury",
        state: "Connecticut",
        county: "New Haven County",
        summary: "Historic theater."
      })

    {:ok, linked} =
      Guides.create_entry(
        guide,
        %{"kind" => "sight", "name" => "Palace", "place_id" => place.id},
        :privileged
      )

    {:ok, plain} = Guides.create_entry(guide, %{"kind" => "food", "name" => "Diner"})

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    base = EthosWeb.Endpoint.url()
    assert html =~ ~s(data-copy-url="#{base}/p/palace-theater-waterbury")
    assert html =~ ~s(data-copy-url="#{base}/g/#{guide.slug}#entry-#{plain.id}")
    assert linked.place_id == place.id
  end
end
