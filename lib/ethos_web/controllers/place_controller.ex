defmodule EthosWeb.PlaceController do
  use EthosWeb, :controller

  alias Ethos.{Links, Places}
  alias Ethos.Places.DeletedPlaces
  alias EthosWeb.StructuredData

  def show(conn, %{"slug" => slug}) do
    case Places.get_place_by_slug(slug) do
      nil ->
        render_absence(conn, absence_reason(slug))

      place ->
        featured = Places.guides_featuring(place)
        meta_description = EthosWeb.Markdown.excerpt(place.summary, 160)
        first_photo = List.first(place.photos)

        og = %{
          title: "#{place.name} — #{place.town}, #{place.state}",
          description: meta_description,
          image: StructuredData.absolute_url(first_photo["src"]),
          type: "website",
          url: url(~p"/p/#{place.slug}")
        }

        render(conn, :show,
          place: place,
          featured_guides: featured,
          siblings: Places.list_siblings(place),
          connected: Links.links_for("place", place.id),
          page_title: "#{place.name} — #{place.town}, #{place.state}",
          page_og: og,
          page_meta_description: meta_description,
          page_canonical: url(~p"/p/#{place.slug}"),
          json_ld: [place_ld(place, meta_description), breadcrumb_ld(place)]
        )
    end
  end

  # A slug the deletion manifest names was taken down deliberately, with a
  # recorded reason and source. One it does not name is just a URL we have
  # nothing for — a typo, or a page that never existed.
  defp absence_reason(slug) do
    if DeletedPlaces.deleted?(slug), do: :deleted, else: :unknown
  end

  # 410 tells a crawler the URL is intentionally dead, so it drops the page;
  # 404 invites months of retries. Each clause names its own status and its own
  # template, rather than deriving the template from `conn.status`, so what is
  # rendered never depends on a field some earlier plug may have set.
  #
  # Neither template exists on disk: EthosWeb.ErrorHTML.render/2 falls through
  # to Phoenix.Controller.status_message_from_template/1, which turns
  # "410.html" into "Gone" and "404.html" into "Not Found".
  defp render_absence(conn, :deleted) do
    conn |> put_status(:gone) |> put_view(EthosWeb.ErrorHTML) |> render(:"410")
  end

  defp render_absence(conn, :unknown) do
    conn |> put_status(:not_found) |> put_view(EthosWeb.ErrorHTML) |> render(:"404")
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
    |> StructuredData.maybe_put(
      "image",
      StructuredData.absolute_url(List.first(place.photos)["src"])
    )
    |> StructuredData.maybe_put(
      "address",
      StructuredData.postal_address(place.address, place.town, place.state)
    )
    |> StructuredData.maybe_put("sameAs", place.official_url && [place.official_url])
  end

  defp breadcrumb_ld(place) do
    StructuredData.breadcrumb(
      StructuredData.root_crumbs() ++
        [
          %{name: place.state, url: url(~p"/destinations/#{place.state_slug}")},
          %{
            name: place.county,
            url: url(~p"/destinations/#{place.state_slug}/#{place.county_slug}")
          },
          %{name: place.name, url: url(~p"/p/#{place.slug}")}
        ]
    )
  end
end
