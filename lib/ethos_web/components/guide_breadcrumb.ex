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

  `guides.destination_id` is nullable until Task 12 drops the legacy columns, so
  a guide with no node falls back to the state/county pair it carries. Nothing
  in the seeded corpus takes that branch — every loader resolves a
  `destination_path` and raises on a miss — but a guide created through the web
  UI has no node at all, and a breadcrumb is not the place to raise.
  """
  def trail(guide) do
    case destination_node(guide) do
      %Destination{} = node ->
        (Destinations.ancestors(node) ++ [node])
        |> Enum.map(&%{name: &1.name, path: DestinationHTML.node_path(&1.path)})

      nil ->
        legacy_trail(guide)
    end
  end

  # The association when it is loaded, the row when it is not. A guide reaches
  # this from a controller that fetched it without a preload as readily as from
  # one that did, and `%Ecto.Association.NotLoaded{}` renders as a crash rather
  # than as a missing crumb.
  defp destination_node(%{destination_node: %Destination{} = node}), do: node
  defp destination_node(%{destination_id: id}) when is_integer(id), do: Destinations.get(id)
  defp destination_node(_guide), do: nil

  # Transitional, for a guide with no node: the pre-tree single-slug hub forms,
  # which 301 to their nodes. `PlaceController.geo_crumbs/2` carries the same
  # fallback for the same reason, and Task 12 removes both with the columns they
  # read.
  defp legacy_trail(guide) do
    cond do
      guide.state_slug && guide.county_slug ->
        [
          %{name: guide.state, path: ~p"/destinations/#{guide.state_slug}"},
          %{
            name: guide.county,
            path: ~p"/destinations/#{guide.state_slug}/#{guide.county_slug}"
          }
        ]

      guide.state_slug ->
        [%{name: guide.state, path: ~p"/destinations/#{guide.state_slug}"}]

      guide.destination_slug ->
        [
          %{
            name: guide.destination |> String.split(",") |> List.first(),
            path: ~p"/destinations/#{guide.destination_slug}"
          }
        ]

      true ->
        []
    end
  end
end
