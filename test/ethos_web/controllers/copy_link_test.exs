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
        summary: "Historic theater."
      })

    {:ok, _linked} =
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
  end

  test "entry name links: place link wins over enrichment, plain text when neither",
       %{conn: conn} do
    guide = published_guide_fixture()

    place =
      Places.upsert_place!(%{
        slug: "palace-theater-waterbury",
        name: "Palace Theater",
        kind: "theater",
        summary: "Historic theater."
      })

    # Entry with place and enrichment: place link should win
    {:ok, place_linked} =
      Guides.create_entry(
        guide,
        %{"kind" => "sight", "name" => "Palace Theater", "place_id" => place.id},
        :privileged
      )

    {:ok, _} =
      Guides.set_entry_enrichment(place_linked, %{
        "official_url" => "https://example.com/theater"
      })

    # Entry with enrichment but NO place
    {:ok, enriched} = Guides.create_entry(guide, %{"kind" => "sight", "name" => "Enriched Spot"})

    {:ok, _} =
      Guides.set_entry_enrichment(enriched, %{
        "official_url" => "https://example.com/enriched"
      })

    # Entry with neither place nor enrichment
    {:ok, plain} = Guides.create_entry(guide, %{"kind" => "food", "name" => "Street Food"})

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    # Place-linked entry: verify place page link is used, not enrichment URL
    # The Phoenix .link component with navigate generates a link to /p/palace-theater-waterbury
    assert html =~ ~s(href="/p/palace-theater-waterbury")
    # Ensure the enrichment URL is not used for this entry (place wins)
    refute html =~ "https://example.com/theater"

    # Enrichment-only entry: should have link to enrichment URL
    # Verify that "Enriched Spot" is wrapped in an anchor to the enrichment URL
    assert html =~ ~r{<a[^>]*href="https://example\.com/enriched"[^>]*>\s*Enriched Spot}s

    # Plain entry: should have plain text (name not wrapped in any link)
    # Verify the name appears but is not inside an anchor tag
    assert html =~ "Street Food"
    # Entry ID should be in HTML for verification
    assert html =~ ~s(id="entry-#{plain.id}")
    refute html =~ ~r{<a[^>]*>Street Food</a>}
  end
end
