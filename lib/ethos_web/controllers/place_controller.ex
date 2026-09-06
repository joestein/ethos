defmodule EthosWeb.PlaceController do
  use EthosWeb, :controller

  alias Ethos.{Destinations, Links, Places}
  alias Ethos.Destinations.Destination
  alias Ethos.Places.DeletedPlaces
  alias Ethos.Places.Place
  alias EthosWeb.StructuredData

  def show(conn, %{"slug" => slug}) do
    case Places.get_place_by_slug(slug) do
      nil ->
        render_absence(conn, absence_reason(slug))

      place ->
        featured = Places.guides_featuring(place)
        meta_description = EthosWeb.Markdown.excerpt(place.summary, 160)
        first_photo = List.first(place.photos)
        trail = destination_trail(place)

        og = %{
          title: page_title(place, trail),
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
          geo_trail: trail,
          featured_guides: featured,
          siblings: Places.list_siblings(place),
          visited?: visited?,
          connected: Links.links_for("place", place.id),
          page_title: page_title(place, trail),
          page_og: og,
          page_meta_description: meta_description,
          page_canonical: url(~p"/p/#{place.slug}"),
          json_ld: [place_ld(place, trail, meta_description), breadcrumb_ld(place, trail)]
        )
    end
  end

  # The place's own ancestry, root-first with its node last — the shape
  # `StructuredData.postal_address/2` and `country_code/1` take, and the shape
  # the visible `<nav>` renders. One query per request, shared by the nav, the
  # BreadcrumbList and the PostalAddress, so the three cannot disagree about
  # where a place is.
  #
  # `[]` for a place with no node. Unreachable from the seeded corpus — every
  # loader resolves a `destination_path` and raises on a miss — but
  # `places.destination_id` is nullable, so the page degrades to a place with no
  # printed geography rather than raising out of a controller.
  defp destination_trail(%Place{destination_node: %Destination{} = node}),
    do: Destinations.ancestors(node) ++ [node]

  defp destination_trail(%Place{}), do: []

  # "Palace Theater — Waterbury, Connecticut". Both the <title> and og:title, so
  # they cannot drift; `EthosWeb.PlaceHTML.geo_label/1` is the same function the
  # page's own subtitle renders through.
  defp page_title(place, trail) do
    case EthosWeb.PlaceHTML.geo_label(trail) do
      nil -> place.name
      label -> "#{place.name} — #{label}"
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

  defp place_ld(place, trail, description) do
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
    |> StructuredData.maybe_put("address", postal_address(place, trail))
    |> StructuredData.maybe_put("sameAs", place.official_url && [place.official_url])
  end

  # A node-backed place — every place in the seeded corpus — takes the tree
  # clause, which is what makes a Roman place emit IT and a Vatican one VA.
  defp postal_address(place, [_ | _] = trail),
    do: StructuredData.postal_address(place.address, trail)

  # A place with no node has no geography to publish, so it publishes none
  # rather than an invented one. The pair-based emitter that stood here was
  # keyed on a region *string* and defaulted to "US" on a miss, which is how the
  # Pantheon came within one deploy of being published as American.
  defp postal_address(_place, []), do: nil

  defp breadcrumb_ld(place, trail) do
    StructuredData.breadcrumb(
      StructuredData.root_crumbs() ++
        geo_crumbs(place, trail) ++
        [%{name: place.name, url: url(~p"/p/#{place.slug}")}]
    )
  end

  # The full ancestry, so the trail is as deep as the place's node is — a
  # Waterbury place gets United States / Connecticut / New Haven County /
  # Waterbury where the pair below could only ever emit a state and a county.
  # Same crumbs, same order and same URLs as the visible `<nav>`, which renders
  # `@geo_trail` directly.
  defp geo_crumbs(_place, [_ | _] = trail) do
    Enum.map(trail, fn d -> %{name: d.name, url: node_url(d.path)} end)
  end

  # A place with no node contributes no geography crumbs: the trail runs
  # Ethos / Destinations / the place itself.
  defp geo_crumbs(_place, []), do: []

  # The shared expansion of the glob route to an absolute URL — see
  # `DestinationHTML.node_url/1`, which the destination and sitemap controllers
  # now call too rather than each keeping a copy of the sigil.
  defp node_url(path) when is_binary(path), do: EthosWeb.DestinationHTML.node_url(path)
end
