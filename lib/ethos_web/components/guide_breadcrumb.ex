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

  Guides carry `state` and `county` independently and both can be nil (Rome and
  Lisbon have neither), so the trail is only as deep as the data allows and
  never links a nil slug. Guides with no geography at all fall back to their
  destination hub, which is a real page.
  """
  def trail(guide) do
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
