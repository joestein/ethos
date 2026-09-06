defmodule EthosWeb.GuideBreadcrumb do
  @moduledoc """
  The destination hierarchy above a guide's title.

  Owns both forms of the breadcrumb — the visible `<nav>` and the trail the
  controller turns into `BreadcrumbList` JSON-LD — so the two cannot drift
  apart, and so the full-guide and orientation-page templates render the same
  markup from one definition.
  """

  use Phoenix.Component
  use EthosWeb, :verified_routes

  alias Ethos.Destinations
  alias Ethos.Destinations.Destination
  alias EthosWeb.DestinationHTML

  attr :guide, :map, required: true

  def guide_breadcrumb(assigns) do
    assigns = assign(assigns, :trail, trail(assigns.guide))

    ~H"""
    <nav class="text-sm text-zinc-500">
      <.link navigate={~p"/destinations"} class="underline">Destinations</.link>
      <span :for={crumb <- @trail}>
        / <.link navigate={crumb.path} class="underline">{crumb.name}</.link>
      </span>
    </nav>
    """
  end

  @doc """
  The crumbs between "Destinations" and the guide itself, as `%{name:, path:}`.

  A guide's trail is its destination node's ancestry, root-first with the node
  itself last — the same trail a hub page renders above its own title, and the
  same one `PlaceController` builds for a place. Depth is whatever the node's
  depth is: a Waterbury guide gets United States / Connecticut / New Haven
  County / Waterbury where the pair-based builder this replaced could only ever
  emit a state and a county.

  ## Why this is no longer a lookup on a curated record

  It used to prefer a hand-written `Destination` record whose `path` equalled
  the guide's `destination_slug`, on the reasoning that editorial content beat a
  derived state hub. That reasoning belonged to a world where a hub was a
  `GROUP BY` over the guides table and a curated record was a separate row
  sitting beside it. The tree collapsed the two: a node **is** the hub, and the
  thirteen curated pages are now overlays on nodes rather than rows of their
  own. There is nothing left to prefer — `/destinations/italy/lazio/rome` is
  both the node and the curated page.

  The lookup was also the last thing keeping those thirteen rows keyed on their
  pre-tree paths, which is what made `/destinations/connecticut` render a
  parentless row instead of 301ing to Connecticut's node.

  ## Guides with no node

  `guides.destination_id` is nullable, because a guide created through the web
  UI names no destination node — it has only the free-text `destination` a
  traveller typed. Nothing in the seeded corpus takes that branch (every loader
  resolves a `destination_path` and raises on a miss), and a breadcrumb is not
  the place to raise.

  Such a guide's `destination_slug` is looked up as a node path and then as a
  legacy path. If it names a real node the guide gets that node's full ancestry;
  if it names nothing it gets no geographic crumb at all, rather than a link to
  a `/destinations/:slug` URL that 404s. See `legacy_trail/1`.
  """
  def trail(guide) do
    case destination_node(guide) do
      %Destination{} = node -> node_trail(node)
      nil -> legacy_trail(guide)
    end
  end

  defp node_trail(%Destination{} = node) do
    (Destinations.ancestors(node) ++ [node])
    |> Enum.map(&%{name: &1.name, path: DestinationHTML.node_path(&1.path)})
  end

  # The association when it is loaded, the row when it is not. A guide reaches
  # this from a controller that fetched it without a preload as readily as from
  # one that did, and `%Ecto.Association.NotLoaded{}` renders as a crash rather
  # than as a missing crumb.
  defp destination_node(%{destination_node: %Destination{} = node}), do: node
  defp destination_node(%{destination_id: id}) when is_integer(id), do: Destinations.get(id)
  defp destination_node(_guide), do: nil

  # A guide with no node has no ancestry to walk, only the free-text
  # `destination` its author typed and the slug derived from it.
  #
  # That slug used to be linked straight at `/destinations/:destination_slug`,
  # on the reasoning that the glob route serves single-segment paths. It does —
  # but only as a node's own path or one of a node's `legacy_paths`, and
  # everything else is a 404. "Lisbon, Portugal" typed into the web form slugs
  # to `lisbon`, which is neither, so the crumb pointed at a 404 in the visible
  # `<nav>` and in the `BreadcrumbList` JSON-LD alike — a worse crumb than none,
  # because a broken breadcrumb link is a structured-data error Search Console
  # reports against the guide page.
  #
  # THE CHOICE, recorded: point it somewhere real where there is somewhere real,
  # and drop it where there is not. The slug is resolved exactly as
  # `DestinationController` resolves a request — node path first, then legacy
  # path — and a hit renders that node's full ancestry, as though the guide had
  # been filed on it. A miss renders no geographic crumb at all, which is what
  # `PlaceController.geo_crumbs/2` already does for a nodeless place: the trail
  # is then Ethos / Destinations / the guide itself. Two queries on a branch no
  # seeded guide takes, and only for guides the web UI created.
  defp legacy_trail(%{destination_slug: slug}) when is_binary(slug) and slug != "" do
    case Destinations.get_by_path(slug) || Destinations.get_by_legacy_path(slug) do
      %Destination{} = node -> node_trail(node)
      nil -> []
    end
  end

  defp legacy_trail(_guide), do: []
end
