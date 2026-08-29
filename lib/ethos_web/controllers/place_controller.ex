defmodule EthosWeb.PlaceController do
  use EthosWeb, :controller

  alias Ethos.{Links, Places}
  alias EthosWeb.StructuredData

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
          image: StructuredData.absolute_url(first_photo["src"]),
          type: "website",
          url: url(~p"/p/#{place.slug}")
        }

        current_user = conn.assigns[:current_user]

        visited? =
          if current_user, do: Ethos.Visits.visited?(current_user, place), else: false

        render(conn, :show,
          place: place,
          featured_guides: featured,
          siblings: Places.list_siblings(place),
          visited?: visited?,
          connected: Links.links_for("place", place.id),
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
        {:ok, :visited} ->
          conn = put_flash(conn, :info, "Checked off #{place.name}!")

          case Ethos.Badges.check_and_award(user, place) do
            [] ->
              conn

            awarded ->
              names = Enum.map_join(awarded, ", ", &"#{&1.emoji} #{&1.name}")
              put_flash(conn, :info, "Checked off #{place.name}! Badge earned: #{names}")
          end

        {:ok, :unvisited} ->
          put_flash(conn, :info, "Removed #{place.name} from your visits.")

        {:error, :closed} ->
          put_flash(conn, :error, "#{place.name} is permanently closed.")
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
    |> StructuredData.maybe_put(
      "image",
      StructuredData.absolute_url(List.first(place.photos)["src"])
    )
    |> StructuredData.maybe_put(
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
