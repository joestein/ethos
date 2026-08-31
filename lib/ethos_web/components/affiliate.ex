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

  ## LiveViews are excluded, even when they assign :guide or :guides

  `{EthosWeb.Layouts, :app}` is also the layout for every LiveView
  (`lib/ethos_web.ex:58`), and seven of them assign geography: the guide
  editor (`guide_live/edit.ex`), the import screen (`guide_live/import.ex`),
  the publish-confirmation screen (`guide_live/confirm.ex`), the share screen
  (`guide_live/share.ex`), the suggestions inbox (`guide_live/suggestions.ex`),
  the reader-suggestion flow (`suggest_live.ex`), and the author's guide
  dashboard (`guide_live/index.ex`, via `Guides.list_user_guides/1` — drafts
  included). All seven are authoring or account screens, never a visitor
  reading published content, so an impression there is not visitor intent and
  would muddy the campaign's data.

  `guide.status == "published"` was deliberately rejected as the guard:
  editing an already-published guide would still leak. `current_user` was
  rejected too: a logged-in visitor reading a public guide should still see
  the widget. What actually distinguishes these seven pages is that they are
  LiveViews, not the geography or the viewer.

  Phoenix hands the `app.html.heex` layout a `:socket` assign only when it is
  rendering as part of a LiveView (both the disconnected and the connected
  render carry it); a plain controller-rendered page never does. For
  `root.html.heex`, which renders once per request outside the LiveView
  socket, the equivalent tell is `:live_module` — injected only by
  `Phoenix.LiveView.Controller.live_render/3` for a route's initial page
  load, never by a controller action. Checking for either key catches every
  LiveView render of both layouts without needing to enumerate routes.
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
      # A LiveView render — author and account screens, never a public page.
      # See the moduledoc for why :socket/:live_module are the right tell and
      # guide.status / current_user are not.
      Map.has_key?(assigns, :socket) or Map.has_key?(assigns, :live_module) ->
        nil

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

  @doc """
  The auto widget. Renders nothing without a locale.

  Carries its own disclosure line rather than relying on the guide show
  page's (`guide_html/show.html.heex:153-155`): the unit now also reaches
  place pages and destination hubs, which never had one, and a disclosure
  that only lived on one page type would silently miss the others.
  """
  def affiliate_unit(assigns) do
    ~H"""
    <div :if={@locale && @locale.network == :getyourguide}>
      <div
        class="mt-10"
        data-gyg-widget="auto"
        data-gyg-partner-id={@locale.partner_id}
        data-gyg-cmp={@locale.cmp}
      >
      </div>
      <p class="mt-2 text-xs text-zinc-400">
        Tours and activities shown above earn Ethos a commission at no extra cost to you.
      </p>
    </div>
    """
  end
end
