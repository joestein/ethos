defmodule EthosWeb.PageControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Guides

  test "GET / shows hero and CTA without any guides", %{conn: conn} do
    conn = get(conn, ~p"/")
    html = html_response(conn, 200)
    assert html =~ "Turn your trip into a guide"
    assert html =~ "Make your guide"
  end

  test "GET / features a published guide when one exists", %{conn: conn} do
    guide = published_guide_fixture(%{title: "Featured Lisbon"})
    Guides.increment_view_count(guide)

    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Featured Lisbon"
  end

  test "GET / lists latest guides besides the featured one, with destinations link", %{conn: conn} do
    featured = published_guide_fixture(%{title: "Featured Lisbon"})
    Guides.increment_view_count(featured)
    published_guide_fixture(%{title: "Waterbury Weekend", destination: "Waterbury, Connecticut"})

    html = conn |> get(~p"/") |> html_response(200)
    assert html =~ "Latest guides"
    assert html =~ "Waterbury Weekend"
    assert html =~ "Browse all destinations"
    # the featured guide is not duplicated in the latest list
    assert length(String.split(html, "Featured Lisbon")) == 2
  end

  describe "GET / metadata" do
    test "carries a title, description, canonical and OpenGraph tags", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      # The layout appends " · Ethos" on its own line, so the rendered title is
      # only a single string once whitespace is collapsed the way a browser
      # collapses it — a raw substring match here would pass on anything.
      # An unset page_title renders "Ethos · Ethos"; that is what this fixes.
      assert title(html) == "Travel guides from real trips · Ethos"
      refute title(html) == "Ethos · Ethos"

      assert html =~ ~s(<link rel="canonical" href="#{url(~p"/")}")

      assert [description] =
               Regex.run(~r{<meta name="description" content="([^"]+)"}, html,
                 capture: :all_but_first
               )

      assert description =~ "Connecticut"
      assert description =~ "Manhattan"
      assert description =~ "Brooklyn"
      assert description =~ "Rome"
      assert String.length(description) <= 160

      assert html =~ ~s(<meta property="og:title" content="Ethos — travel guides from real trips")
      assert html =~ ~s(<meta property="og:type" content="website")
      assert html =~ ~s(<meta property="og:url" content="#{url(~p"/")}")
      assert html =~ ~s(<meta property="og:description" content=")
      # no raster OG image exists yet, so the layout must not emit an empty one
      refute html =~ ~s(<meta property="og:image")
    end

    # The home page has no share image, so it must not ask a card renderer for
    # a layout built around one. Every page whose page_og carries no image is
    # in the same position; this is the one that has no image by construction.
    test "advertises a summary Twitter card, not a large image it does not have", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      assert html =~ ~s(<meta name="twitter:card" content="summary")
      refute html =~ "summary_large_image"
    end

    test "emits exactly the Organization and WebSite site-level nodes", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      assert Enum.map(json_ld_blocks(html), & &1["@type"]) == ["Organization", "WebSite"]
    end

    test "the Organization node names, locates and illustrates the publisher", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      org = json_ld_of_type(html, "Organization")

      assert org["@context"] == "https://schema.org"
      assert org["name"] == "Ethos"
      assert org["url"] == url(~p"/")
      assert org["logo"] == static_url(EthosWeb.Endpoint, "/images/logo.svg")
      assert org["logo"] =~ ~r{^https?://}
      assert org["logo"] =~ "/images/logo.svg"
    end

    test "the WebSite node carries a SearchAction the search route actually answers", %{
      conn: conn
    } do
      html = conn |> get(~p"/") |> html_response(200)

      site = json_ld_of_type(html, "WebSite")

      assert site["@context"] == "https://schema.org"
      assert site["name"] == "Ethos"
      assert site["url"] == url(~p"/")

      action = site["potentialAction"]
      assert action["@type"] == "SearchAction"
      assert action["query-input"] == "required name=search_term_string"

      target = action["target"]
      assert target["@type"] == "EntryPoint"
      assert target["urlTemplate"] == url(~p"/search") <> "?q={search_term_string}"
    end

    test "the SearchAction template resolves to a page the router serves", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      template =
        json_ld_of_type(html, "WebSite")["potentialAction"]["target"]["urlTemplate"]

      # substitute a real term the way a search engine would, then fetch it
      %URI{path: path, query: query} =
        URI.parse(String.replace(template, "{search_term_string}", "lisbon"))

      published_guide_fixture(%{title: "Lisbon In Three Days"})

      body = conn |> get(path <> "?" <> query) |> html_response(200)
      assert body =~ "Lisbon In Three Days"
    end
  end

  # The rendered <title>, whitespace-collapsed the way a browser collapses it.
  defp title(html) do
    [inner] = Regex.run(~r{<title[^>]*>(.*?)</title>}s, html, capture: :all_but_first)

    inner |> String.split() |> Enum.join(" ")
  end
end
