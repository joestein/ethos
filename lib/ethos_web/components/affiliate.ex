defmodule EthosWeb.Affiliate do
  @moduledoc """
  Affiliate tags, resolved from the page's geography.

  ## Both tags live in the layouts

  `affiliate_head/1` renders in `root.html.heex`'s `<head>`; `affiliate_unit/1`
  renders in `app.html.heex` immediately after `{@inner_content}`, which puts
  it at the bottom of the content column on every page.

  That placement is the point. A new controller, a new page type, a new borough
  inherits both tags with no work — nothing to remember, so nothing to forget.
  Assigning a locale in each controller action would be one missing `assign`
  away from silently skipping every page added after this shipped, and nothing
  would fail.

  The home page renders with `layout: false` (`page_controller.ex:39`) and so
  receives neither tag. It is not a New York page; this is correct.

  ## Reading assigns

  `locale_from_assigns/1` sniffs the assigns rather than being handed an
  explicit tag by each controller. Sniffing is normally fragile, but here the
  fragility cuts the safe way: an unrecognised page shape yields `nil`, and
  `nil` renders nothing. The failure mode is a missing widget, never a wrong
  one.
  """
  use Phoenix.Component

  alias Ethos.Affiliates

  @doc """
  The page's affiliate locale, or `nil`.

  Clause order is load-bearing: a page may carry more than one of these keys,
  and the most specific description of what the page is about wins.
  """
  def locale_from_assigns(assigns) when is_map(assigns) do
    cond do
      guide = assigns[:guide] ->
        Affiliates.locale_for(guide.state_slug, guide.county)

      place = assigns[:place] ->
        Affiliates.locale_for(place.state_slug, place.county)

      collection = assigns[:collection] ->
        collection.items
        |> Enum.map(& &1.guide)
        |> Affiliates.unanimous_locale()

      # Every destination hub shape — town, state, county — assigns :guides.
      # :shadowed is deliberately NOT consulted: those are guides from other
      # states that merely share a destination slug, and they are not what the
      # page is about.
      is_list(assigns[:guides]) ->
        Affiliates.unanimous_locale(assigns[:guides])

      true ->
        nil
    end
  end

  def locale_from_assigns(_), do: nil

  attr :locale, :map, default: nil

  @doc "The partner analytics and widget script. Renders nothing without a locale."
  def affiliate_head(assigns) do
    ~H"""
    <script
      :if={@locale && @locale.network == :getyourguide}
      async
      defer
      src="https://widget.getyourguide.com/dist/pa.umd.production.min.js"
      data-gyg-partner-id={@locale.partner_id}
    >
    </script>
    """
  end

  attr :locale, :map, default: nil

  @doc "The auto widget. Renders nothing without a locale."
  def affiliate_unit(assigns) do
    ~H"""
    <div
      :if={@locale && @locale.network == :getyourguide}
      class="mt-10"
      data-gyg-widget="auto"
      data-gyg-partner-id={@locale.partner_id}
      data-gyg-cmp={@locale.cmp}
    >
    </div>
    """
  end
end
