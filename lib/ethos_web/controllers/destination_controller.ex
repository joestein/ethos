defmodule EthosWeb.DestinationController do
  use EthosWeb, :controller

  alias Ethos.Guides

  def index(conn, _params) do
    destinations = Guides.list_destinations_without_state()
    states = Guides.list_states()
    collections = Ethos.Collections.list_published()

    title = "Destinations"

    description =
      "Real trip guides by destination — places, verdicts, and tips from travelers who went."

    render(conn, :index,
      destinations: destinations,
      states: states,
      collections: collections,
      page_title: title,
      page_og: og(title, description, url(~p"/destinations")),
      page_meta_description: description,
      page_canonical: url(~p"/destinations"),
      json_ld: [destinations_breadcrumb()]
    )
  end

  # Destination hubs have no single representative photo, so they ship without
  # an og:image — the layout omits the tag when it's nil.
  defp og(title, description, url) do
    %{title: title, description: description, type: "website", url: url, image: nil}
  end

  def show(conn, %{"slug" => slug}) do
    case Guides.list_published_guides_for_state(slug) do
      [] -> town_show(conn, slug)
      guides -> state_show(conn, slug, guides)
    end
  end

  defp town_show(conn, slug) do
    case Guides.list_published_guides_for_destination(slug) do
      [] ->
        conn
        |> put_status(:not_found)
        |> put_view(EthosWeb.ErrorHTML)
        |> render(:"404")

      guides ->
        name = guides |> hd() |> Map.get(:destination) |> String.split(",") |> List.first()
        title = "#{name} travel guides"

        description =
          "Real trip guides for #{name} — places, verdicts, and tips from travelers who went."

        render(conn, :show,
          name: name,
          slug: slug,
          guides: guides,
          page_title: title,
          page_og: og(title, description, url(~p"/destinations/#{slug}")),
          page_meta_description: description,
          page_canonical: url(~p"/destinations/#{slug}"),
          json_ld: [destination_breadcrumb(name, slug)]
        )
    end
  end

  defp state_show(conn, slug, guides) do
    state = hd(guides).state
    counties = Guides.list_counties_for_state(slug)
    title = "#{state} travel guides"

    description =
      "Travel guides for #{state} — history, sites, restaurants, and places to stay, county by county."

    render(conn, :state,
      state: state,
      slug: slug,
      counties: counties,
      guides: guides,
      page_title: title,
      page_og: og(title, description, url(~p"/destinations/#{slug}")),
      page_meta_description: description,
      page_canonical: url(~p"/destinations/#{slug}"),
      json_ld: [
        collection_ld("#{state} travel guides", url(~p"/destinations/#{slug}")),
        state_breadcrumb(state, slug)
      ]
    )
  end

  def county(conn, %{"state_slug" => state_slug, "county_slug" => county_slug}) do
    case Guides.list_published_guides_for_county(state_slug, county_slug) do
      [] ->
        conn |> put_status(:not_found) |> put_view(EthosWeb.ErrorHTML) |> render(:"404")

      guides ->
        g = hd(guides)
        title = "#{g.county}, #{g.state} travel guides"

        description =
          "Travel guides for #{g.county}, #{g.state} — towns, history, sites, restaurants, and places to stay."

        render(conn, :county,
          state: g.state,
          state_slug: state_slug,
          county: g.county,
          county_slug: county_slug,
          guides: Enum.filter(guides, &(&1.tier == "guide")),
          town_pages: Enum.filter(guides, &(&1.tier == "town-page")),
          page_title: title,
          page_og: og(title, description, url(~p"/destinations/#{state_slug}/#{county_slug}")),
          page_meta_description: description,
          page_canonical: url(~p"/destinations/#{state_slug}/#{county_slug}"),
          json_ld: [
            collection_ld(
              "#{g.county} travel guides",
              url(~p"/destinations/#{state_slug}/#{county_slug}")
            ),
            county_breadcrumb(g.state, state_slug, g.county, county_slug)
          ]
        )
    end
  end

  defp collection_ld(name, url) do
    %{
      "@context" => "https://schema.org",
      "@type" => "CollectionPage",
      "name" => name,
      "url" => url
    }
  end

  defp state_breadcrumb(state, slug) do
    %{
      "@context" => "https://schema.org",
      "@type" => "BreadcrumbList",
      "itemListElement" => [
        %{"@type" => "ListItem", "position" => 1, "name" => "Ethos", "item" => url(~p"/")},
        %{
          "@type" => "ListItem",
          "position" => 2,
          "name" => "Destinations",
          "item" => url(~p"/destinations")
        },
        %{
          "@type" => "ListItem",
          "position" => 3,
          "name" => state,
          "item" => url(~p"/destinations/#{slug}")
        }
      ]
    }
  end

  defp county_breadcrumb(state, state_slug, county, county_slug) do
    crumb = state_breadcrumb(state, state_slug)

    %{
      crumb
      | "itemListElement" =>
          crumb["itemListElement"] ++
            [
              %{
                "@type" => "ListItem",
                "position" => 4,
                "name" => county,
                "item" => url(~p"/destinations/#{state_slug}/#{county_slug}")
              }
            ]
    }
  end

  defp destinations_breadcrumb do
    %{
      "@context" => "https://schema.org",
      "@type" => "BreadcrumbList",
      "itemListElement" => [
        %{"@type" => "ListItem", "position" => 1, "name" => "Ethos", "item" => url(~p"/")},
        %{
          "@type" => "ListItem",
          "position" => 2,
          "name" => "Destinations",
          "item" => url(~p"/destinations")
        }
      ]
    }
  end

  defp destination_breadcrumb(name, slug) do
    %{
      "@context" => "https://schema.org",
      "@type" => "BreadcrumbList",
      "itemListElement" => [
        %{"@type" => "ListItem", "position" => 1, "name" => "Ethos", "item" => url(~p"/")},
        %{
          "@type" => "ListItem",
          "position" => 2,
          "name" => "Destinations",
          "item" => url(~p"/destinations")
        },
        %{
          "@type" => "ListItem",
          "position" => 3,
          "name" => name,
          "item" => url(~p"/destinations/#{slug}")
        }
      ]
    }
  end
end
