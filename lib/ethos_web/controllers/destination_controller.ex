defmodule EthosWeb.DestinationController do
  use EthosWeb, :controller

  alias Ethos.Guides

  def index(conn, _params) do
    destinations = Guides.list_destinations()

    render(conn, :index,
      destinations: destinations,
      page_meta_description:
        "Real trip guides by destination — places, verdicts, and tips from travelers who went.",
      page_canonical: url(~p"/destinations")
    )
  end

  def show(conn, %{"slug" => slug}) do
    case Guides.list_published_guides_for_destination(slug) do
      [] ->
        conn
        |> put_status(:not_found)
        |> put_view(EthosWeb.ErrorHTML)
        |> render(:"404")

      guides ->
        name = guides |> hd() |> Map.get(:destination) |> String.split(",") |> List.first()

        render(conn, :show,
          name: name,
          slug: slug,
          guides: guides,
          page_meta_description:
            "Real trip guides for #{name} — places, verdicts, and tips from travelers who went.",
          page_canonical: url(~p"/destinations/#{slug}"),
          json_ld: [destination_breadcrumb(name, slug)]
        )
    end
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
