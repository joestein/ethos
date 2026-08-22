defmodule EthosWeb.PlaceController do
  use EthosWeb, :controller

  alias Ethos.Places

  def show(conn, %{"slug" => slug}) do
    case Places.get_place_by_slug(slug) do
      nil ->
        conn |> put_status(:not_found) |> put_view(EthosWeb.ErrorHTML) |> render(:"404")

      place ->
        featured = Places.guides_featuring(place)
        meta_description = EthosWeb.Markdown.excerpt(place.summary, 160)
        first_photo = List.first(place.photos)

        og = %{
          title: "#{place.name} — #{place.town}, #{place.state}",
          description: meta_description,
          image: first_photo && url(~p"/") <> String.trim_leading(first_photo["src"], "/"),
          type: "website",
          url: url(~p"/p/#{place.slug}")
        }

        current_user = conn.assigns[:current_user]

        visited? =
          if current_user, do: Ethos.Visits.visited?(current_user, place), else: false

        render(conn, :show,
          place: place,
          featured_guides: featured,
          visited?: visited?,
          page_title: "#{place.name} — #{place.town}, #{place.state}",
          page_og: og,
          page_meta_description: meta_description,
          page_canonical: url(~p"/p/#{place.slug}"),
          json_ld: [place_ld(place, meta_description), breadcrumb_ld(place)]
        )
    end
  end

  def visit(conn, %{"slug" => slug}) do
    place = Places.get_place_by_slug!(slug)
    user = conn.assigns.current_user

    conn =
      case Ethos.Visits.toggle_visit(user, place) do
        {:ok, :visited} -> put_flash(conn, :info, "Checked off #{place.name}!")
        {:ok, :unvisited} -> put_flash(conn, :info, "Removed #{place.name} from your visits.")
        {:error, :closed} -> put_flash(conn, :error, "#{place.name} is permanently closed.")
      end

    redirect(conn, to: ~p"/p/#{place.slug}")
  end

  defp place_ld(place, description) do
    base = %{
      "@context" => "https://schema.org",
      "@type" => EthosWeb.PlaceHTML.schema_type(place.kind),
      "name" => place.name,
      "description" => description,
      "url" => url(~p"/p/#{place.slug}")
    }

    base
    |> maybe_put(
      "image",
      case List.first(place.photos) do
        nil -> nil
        p -> url(~p"/") <> String.trim_leading(p["src"], "/")
      end
    )
    |> maybe_put(
      "address",
      place.address &&
        %{
          "@type" => "PostalAddress",
          "streetAddress" => place.address,
          "addressLocality" => place.town,
          "addressRegion" => place.state,
          "addressCountry" => "US"
        }
    )
  end

  defp maybe_put(map, _key, nil), do: map
  defp maybe_put(map, key, value), do: Map.put(map, key, value)

  defp breadcrumb_ld(place) do
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
          "name" => place.state,
          "item" => url(~p"/destinations/#{place.state_slug}")
        },
        %{
          "@type" => "ListItem",
          "position" => 4,
          "name" => place.county,
          "item" => url(~p"/destinations/#{place.state_slug}/#{place.county_slug}")
        },
        %{
          "@type" => "ListItem",
          "position" => 5,
          "name" => place.name,
          "item" => url(~p"/p/#{place.slug}")
        }
      ]
    }
  end
end
