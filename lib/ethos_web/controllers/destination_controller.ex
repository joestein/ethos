defmodule EthosWeb.DestinationController do
  use EthosWeb, :controller

  alias Ethos.{Destinations, Guides}
  alias EthosWeb.{DestinationHTML, StructuredData}

  def index(conn, _params) do
    title = "Destinations"

    description =
      "Real trip guides by destination — places, verdicts, and tips from travelers who went."

    render(conn, :index,
      countries: Destinations.roots(),
      collections: Ethos.Collections.list_published(),
      page_title: title,
      page_og: og(title, description, url(~p"/destinations")),
      page_meta_description: description,
      page_canonical: url(~p"/destinations"),
      json_ld: [
        collection_ld(title, url(~p"/destinations")),
        destinations_breadcrumb()
      ]
    )
  end

  @doc """
  One hub for every node in the tree, at whatever depth it sits.

  The glob replaces the three fixed routes — town, state, county — that the
  site served before the tree existed. A path is a node's path verbatim, so
  `/destinations/united-states/connecticut/litchfield-county/washington` and
  `/destinations/united-states/washington` are different pages rather than two
  claims on one URL.
  """
  def show(conn, %{"path" => segments}) do
    path = Enum.join(segments, "/")

    case Destinations.get_by_path(path) do
      nil -> redirect_or_404(conn, path)
      node -> render_node(conn, node)
    end
  end

  defp render_node(conn, node) do
    children = Destinations.children(node)
    ancestors = Destinations.ancestors(node)
    guides = Guides.list_published_guides_for_node(node.id)

    title = "#{node.name} travel guides"

    description =
      "Travel guides for #{node.name} — history, sites, restaurants, and places to stay."

    page_url = node_url(node.path)

    render(conn, :node,
      node: node,
      children: children,
      ancestors: ancestors,
      guides: guides,
      page_title: title,
      page_og: %{og(title, description, page_url) | image: destination_image(node)},
      page_meta_description: description,
      page_canonical: page_url,
      json_ld: [collection_ld(title, page_url, node), node_breadcrumb(node, ancestors)]
    )
  end

  # A node path is many segments, and `~p` percent-encodes a `/` inside a single
  # interpolated string. Interpolating the segment LIST is what expands to the
  # glob route's real URL. (`url/1` demands a literal `~p`, so this cannot
  # route through `DestinationHTML.node_path/1` the way the 301 below does.)
  defp node_url(path) when is_binary(path),
    do: url(~p"/destinations/#{String.split(path, "/")}")

  # Resolution order: an exact node renders — `show/2` has already tried that
  # and come back nil — a path a node used to live at 301s, and anything else
  # is a 404. `/destinations/italy` is the case that ordering protects: "italy"
  # is a real country node and a legacy path of nothing, so it renders its own
  # hub rather than following Rome.
  #
  # Permanent, not temporary: these URLs are indexed and the move is one-way.
  # `Location` is built through `node_path/1` for the same reason links are —
  # `/destinations/united-states%2Fillinois%2Fchicago` would 301 every indexed
  # URL onto a 404.
  defp redirect_or_404(conn, path) do
    case Destinations.get_by_legacy_path(path) do
      nil ->
        conn |> put_status(:not_found) |> put_view(EthosWeb.ErrorHTML) |> render(:"404")

      node ->
        conn
        |> put_status(:moved_permanently)
        |> redirect(to: DestinationHTML.node_path(node.path))
    end
  end

  # The hub's own ancestry, root-first, with the node itself last.
  #
  # `ancestors` is the same list the template renders above the title, so the
  # visible trail and the `BreadcrumbList` cannot disagree — the page derives
  # both from one query. Depth is whatever the node's depth is: a country hub
  # emits three crumbs and a London town hub emits seven, where the three fixed
  # builders this replaced could only ever emit a state, a state+county or a
  # single curated destination.
  #
  # Positions are not written here. `StructuredData.breadcrumb/1` derives them
  # from list order, which is the invariant that module exists to hold — a
  # hardcoded position surviving a trail growing a crumb is the exact bug its
  # moduledoc records.
  defp node_breadcrumb(node, ancestors) do
    crumbs =
      StructuredData.root_crumbs() ++
        Enum.map(ancestors ++ [node], fn d -> %{name: d.name, url: node_url(d.path)} end)

    StructuredData.breadcrumb(crumbs)
  end

  # Destination hubs have no single representative photo, so they ship without
  # an og:image — the layout omits the tag when it's nil. A node carrying
  # photos overrides :image with `destination_image/1`.
  defp og(title, description, url) do
    %{title: title, description: description, type: "website", url: url, image: nil}
  end

  # Joins a node's first photo the same way place_controller.ex does for place
  # photos, so og:image points at an absolute, site-rooted URL.
  defp destination_image(%Destinations.Destination{photos: [_ | _] = photos}) do
    StructuredData.absolute_url(List.first(photos)["src"])
  end

  defp destination_image(_), do: nil

  # Every hub is a CollectionPage — a page whose subject is the list of pages on
  # it — the index included.
  #
  # `description` is the node's `intro`, which is the prose the hub already
  # renders above its lists; schema.org asks that a description describe the
  # page's visible content, and this is that content. Nodes with no intro (and
  # the index, which has no node at all) pass nil, and `collection_page/3` drops
  # the key rather than publishing an empty string.
  defp collection_ld(name, page_url, node \\ nil) do
    StructuredData.collection_page(name, page_url, description: node && node.intro)
  end

  defp destinations_breadcrumb, do: StructuredData.breadcrumb(StructuredData.root_crumbs())
end
