defmodule EthosWeb.DestinationController do
  use EthosWeb, :controller

  alias Ethos.{Destinations, Guides}
  alias EthosWeb.StructuredData

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
  # an og:image — the layout omits the tag when it's nil. Where a Destination
  # record has a photo, callers override :image with `destination_image/1`.
  defp og(title, description, url) do
    %{title: title, description: description, type: "website", url: url, image: nil}
  end

  # Joins a destination's first photo the same way place_controller.ex does
  # for place photos, so og:image points at an absolute, site-rooted URL.
  defp destination_image(nil), do: nil

  defp destination_image(%Destinations.Destination{photos: photos}) do
    StructuredData.absolute_url(List.first(photos)["src"])
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

        destination = Destinations.get_by_path(slug)

        page_og = %{
          og(title, description, url(~p"/destinations/#{slug}"))
          | image: destination_image(destination)
        }

        render(conn, :show,
          name: name,
          slug: slug,
          guides: guides,
          destination: destination,
          page_title: title,
          page_og: page_og,
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

    destination = Destinations.get_by_path(slug)

    page_og = %{
      og(title, description, url(~p"/destinations/#{slug}"))
      | image: destination_image(destination)
    }

    render(conn, :state,
      state: state,
      slug: slug,
      counties: counties,
      guides: guides,
      destination: destination,
      page_title: title,
      page_og: page_og,
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

        destination = Destinations.get_by_path("#{state_slug}/#{county_slug}")

        page_og = %{
          og(title, description, url(~p"/destinations/#{state_slug}/#{county_slug}"))
          | image: destination_image(destination)
        }

        render(conn, :county,
          state: g.state,
          state_slug: state_slug,
          county: g.county,
          county_slug: county_slug,
          guides: Enum.filter(guides, &(&1.tier == "guide")),
          town_pages: Enum.filter(guides, &(&1.tier == "town-page")),
          destination: destination,
          page_title: title,
          page_og: page_og,
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

  defp collection_ld(name, page_url), do: StructuredData.collection_page(name, page_url)

  # A state hub and a town hub live at the same `/destinations/:slug` shape and
  # so produce the same three-crumb trail; they stay separate functions because
  # their callers name the third crumb differently.
  defp state_breadcrumb(state, slug), do: state_trail(state, slug) |> StructuredData.breadcrumb()

  defp county_breadcrumb(state, state_slug, county, county_slug) do
    StructuredData.breadcrumb(
      state_trail(state, state_slug) ++
        [
          %{
            name: county,
            url: url(~p"/destinations/#{state_slug}/#{county_slug}")
          }
        ]
    )
  end

  defp destinations_breadcrumb, do: StructuredData.breadcrumb(StructuredData.root_crumbs())

  defp destination_breadcrumb(name, slug),
    do: state_trail(name, slug) |> StructuredData.breadcrumb()

  defp state_trail(name, slug) do
    StructuredData.root_crumbs() ++ [%{name: name, url: url(~p"/destinations/#{slug}")}]
  end
end
