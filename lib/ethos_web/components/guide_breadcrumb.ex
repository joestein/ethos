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

  Guides carry `state` and `county` independently and both can be nil (Lisbon
  has neither), so the trail is only as deep as the data allows and never links
  a nil slug. Guides with no geography at all fall back to their destination
  hub, which is a real page.

  ## A curated destination outranks the derived state hub

  A `Destination` record is hand-written editorial content — an intro, photos,
  an og:image — sitting at `/destinations/<destination_slug>`. A state hub is a
  `GROUP BY` over the guides table: a title, a list of links, nothing else.
  When both exist for one guide, the curated page is the better crumb.

  This is not hypothetical. Giving the Rome guide `state: "Italy"` (so the
  affiliate registry, keyed on state slug, could reach it) moved its crumb from
  `/destinations/rome` — a curated record with an intro and a Colosseum photo —
  to `/destinations/italy`, which has neither. Since `list_destinations_without_state/0`
  had already dropped Rome from the `/destinations` index for having a state,
  those were its only two inbound internal links and the richer page went dark
  while the thin one took them.

  So the lookup runs first and, when it hits, is the whole trail. Nothing in
  the corpus has both a curated destination record and a county — county
  records are keyed `"<state>/<county>"`, never a bare destination slug — so
  this does not truncate any hierarchy that exists today.
  """
  def trail(guide) do
    cond do
      crumb = curated_destination_crumb(guide) ->
        [crumb]

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
        [destination_crumb(guide)]

      true ->
        []
    end
  end

  # `Destinations.get_by_path/1` is the same lookup `destination_controller.ex`
  # uses to decide whether a hub has editorial content, so "curated" means
  # exactly what it means there — one definition, not two.
  defp curated_destination_crumb(%{destination_slug: slug} = guide) when is_binary(slug) do
    if Destinations.get_by_path(slug), do: destination_crumb(guide)
  end

  defp curated_destination_crumb(_guide), do: nil

  defp destination_crumb(guide) do
    %{
      name: guide.destination |> String.split(",") |> List.first(),
      path: ~p"/destinations/#{guide.destination_slug}"
    }
  end
end
