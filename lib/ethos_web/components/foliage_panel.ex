defmodule EthosWeb.FoliagePanel do
  @moduledoc """
  The seasonal foliage block on a Connecticut town guide.

  Rendered from both guide templates because only ten of the 169 Connecticut
  town guides carry `tier: "town-page"` — the rest are plain `"guide"` and
  render through `show.html.heex`. Gating on the tier would put this on ten
  pages instead of 169.
  """

  use Phoenix.Component
  use EthosWeb, :verified_routes

  attr :foliage, :any, required: true

  def foliage_panel(assigns) do
    ~H"""
    <section :if={@foliage} class="mt-10 rounded-xl border border-line p-4">
      <h2 class="font-semibold">Foliage</h2>
      <p class="mt-2 text-sm">
        {Ethos.Foliage.stage_label(@foliage.stage)} this week ·
        <%= if Ethos.Foliage.peak_verified?(@foliage.town) do %>
          estimated peak {Ethos.Foliage.peak_label(@foliage.town)}
        <% else %>
          most advanced {Ethos.Foliage.peak_label(@foliage.town)}
        <% end %>
      </p>
      <p :if={!Ethos.Foliage.peak_verified?(@foliage.town)} class="mt-1 text-xs text-ink-muted">
        This town never reaches full colour on the state's map — DEEP's eight weeks run out before it turns.
      </p>
      <p :if={@foliage.route} class="mt-1 text-sm text-ink-muted">
        On the
        <.link href={~p"/foliage/#{@foliage.route.slug}"} class="underline">
          {@foliage.route.name}
        </.link>
        foliage driving route.
      </p>
      <p class="mt-2 text-xs text-ink-muted">
        {Ethos.Foliage.attribution()}
        <.link href={~p"/foliage"} class="underline">See the statewide forecast</.link>.
      </p>
    </section>
    """
  end
end
