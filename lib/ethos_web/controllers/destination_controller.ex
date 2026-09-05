defmodule EthosWeb.DestinationController do
  use EthosWeb, :controller

  alias Ethos.{Destinations, Guides}
  alias EthosWeb.StructuredData

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
  # glob route's real URL.
  defp node_url(path) when is_binary(path),
    do: url(~p"/destinations/#{String.split(path, "/")}")

  # Task 9 turns this into a legacy-path lookup and a 301. Until then an
  # unknown path is a plain 404 — exactly what the three routes this replaces
  # served for a slug they did not recognise.
  defp redirect_or_404(conn, _path) do
    conn |> put_status(:not_found) |> put_view(EthosWeb.ErrorHTML) |> render(:"404")
  end

  # Task 10 builds the real trail out of `ancestors`. Until then every hub
  # emits the index's own two crumbs, which is what the index emits today.
  defp node_breadcrumb(_node, _ancestors), do: destinations_breadcrumb()

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
