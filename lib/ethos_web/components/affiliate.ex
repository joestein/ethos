defmodule EthosWeb.Affiliate do
  @moduledoc """
  Affiliate tags, resolved from the page's geography.

  ## Both tags live in the layouts

  `affiliate_head/1` renders in `root.html.heex`'s `<head>`; `affiliate_unit/1`
  renders in `app.html.heex`, which calls it **twice** — once before
  `{@inner_content}` and once after — passing each call a `position`. A locale
  has exactly one `placement/1`, so exactly one of the two slots renders and
  every page still carries at most one unit, at the top or the bottom of the
  content column.

  That placement is the point. A new controller, a new page type, a new borough
  inherits both tags with no work — nothing to remember, so nothing to forget.
  Assigning a locale in each controller action would be one missing `assign`
  away from silently skipping every page added after this shipped, and nothing
  would fail.

  The home page receives neither tag, which is correct — it is not a New York
  page. The reason is *not* its `layout: false` (`page_controller.ex:39`): that
  suppresses only the app layout, so `affiliate_unit/1` never runs, but
  `root.html.heex` still renders and `affiliate_head/1` **is** invoked. It
  renders nothing because the home page's assigns (`:featured`, `:latest`)
  match no clause of `locale_from_assigns/1`, which therefore returns `nil`.
  The protection is the resolver's default, not the layout option.

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
      #
      # The county hub splits its rows in two (`destination_controller.ex`:
      # `guides` is tier "guide", `town_pages` is the rest), so a borough hub
      # seeded entirely with town-pages has an EMPTY :guides list and all its
      # geography in :town_pages. Resolving over :guides alone would return nil
      # for a page full of New York content. Both lists describe the same hub,
      # so both feed the vote.
      #
      # :shadowed is deliberately NOT consulted: those are guides from other
      # states that merely share a destination slug, and they are not what the
      # page is about.
      is_list(assigns[:guides]) ->
        Affiliates.unanimous_locale(assigns[:guides] ++ hub_town_pages(assigns))

      true ->
        nil
    end
  end

  def locale_from_assigns(_), do: nil

  defp hub_town_pages(assigns) do
    case assigns[:town_pages] do
      rows when is_list(rows) -> rows
      _ -> []
    end
  end

  # The networks the components know how to render. A locale naming anything
  # else — a typo, or a network added to the registry before its component
  # clause lands — resolves fine and renders nothing.
  @supported_networks [:getyourguide]

  @doc """
  Whether an affiliate unit will actually render for this locale.

  The ONE predicate behind all three decisions: `affiliate_head/1`'s script,
  `affiliate_unit/1`'s widget, and the guide show page's fallback amber CTA and
  disclosure, which render precisely when this returns `false`. Splitting them
  is how a locale with an unrecognised `:network` came to render *neither* the
  widget nor the fallback — a page in that geography with no affiliate unit at
  all, and a green suite.
  """
  def renders?(locale) when is_map(locale), do: Map.get(locale, :network) in @supported_networks
  def renders?(_), do: false

  @doc """
  Whether the layout's affiliate unit will render for this page's assigns.

  Defined in terms of `renders?/1` so a template's condition and the
  component's condition cannot drift apart.
  """
  def unit_renders?(assigns), do: assigns |> locale_from_assigns() |> renders?()

  @default_placement :bottom
  @placements [:top, :bottom]

  @doc """
  Where a locale's unit renders: `:top` (above the page content) or `:bottom`.

  Defaults to `:bottom`, and the default is load-bearing. New York's registry
  entry does not carry the field, and any future entry that forgets it behaves
  like New York rather than like Rome — the conservative direction, since a
  top-placed unit renders above the page's `<h1>`.

  An **unrecognised** value (`:above`, `"top"`) falls back to the same default
  rather than matching neither slot. It has to: `renders?/1` and therefore
  `unit_renders?/1` are placement-agnostic by design — they answer "will this
  page carry a unit at all", which is the question the show page's amber CTA
  and disclosure ask. A typo that matched no slot would suppress the fallback
  CTA *and* the page's disclosure while `affiliate_head/1` still loaded the
  third-party script, leaving a page with no affiliate unit of any kind and a
  green suite. That is exactly the failure documented above `renders?/1`,
  reintroduced along the placement axis.

  This is a production safety net, not a licence to misconfigure:
  `affiliate_corpus_test.exs`'s registry-shape guard still fails loudly on any
  `:placement` outside #{inspect(@placements)}, so a typo is caught in CI and
  merely degrades to New York's behaviour if it ever reaches a deploy.
  """
  def placement(locale) when is_map(locale) do
    case Map.get(locale, :placement, @default_placement) do
      placement when placement in @placements -> placement
      _unrecognised -> @default_placement
    end
  end

  def placement(_), do: @default_placement

  # The two layout slots are mutually exclusive on one locale: exactly one
  # position can match, so exactly one unit renders. `renders?/1` is checked
  # first and short-circuits, so a nil locale never reaches placement/1.
  defp render_here?(locale, position), do: renders?(locale) and placement(locale) == position

  defp wrapper_margin(:top), do: "mb-10"
  defp wrapper_margin(:bottom), do: "mt-10"

  # Only :top needs a reserved floor. See the comment on the reserved div
  # below for why the two placements pay a different price for the same
  # blank space.
  defp reserved_height(:top), do: "min-h-[400px]"
  defp reserved_height(:bottom), do: nil

  attr :locale, :map, default: nil

  @doc """
  The partner's identifier, for the consent-gated loader to act on.

  This was a `<script src>` until consent landed. It cannot be one any more:
  a script tag in `<head>` runs before any consent signal exists, and the
  GetYourGuide widget sets cookies. `assets/js/analytics.js` reads this tag
  and injects the script only after `analyticsConsent` resolves.

  Renders nothing without a locale, exactly as before — `renders?/1` is still
  the one predicate, so this and the widget cannot disagree about whether a
  page carries an affiliate unit.
  """
  def affiliate_head(assigns) do
    ~H"""
    <meta :if={renders?(@locale)} name="gyg-partner-id" content={@locale.partner_id} />
    """
  end

  attr :locale, :map, default: nil
  attr :position, :atom, required: true

  @doc """
  The auto widget. Renders nothing without a locale `renders?/1` accepts.

  Carries its own disclosure line rather than relying on the guide show page's
  ("Some booking links on this page…"): the unit now also reaches place pages
  and destination hubs, which never had one, and a disclosure that only lived
  on one page type would silently miss the others. The show page's line is
  suppressed exactly when this one renders, so a New York guide carries one
  disclosure, not two.
  """
  def affiliate_unit(assigns) do
    ~H"""
    <%!-- px-4 matches the horizontal padding every page template applies to its
          own content wrapper (`mx-auto max-w-2xl px-4 py-10`). The layout's
          column has no padding of its own, so without this the unit sits 16px
          wider than the article beside it.

          The vertical margin flips with position: a bottom-placed unit needs
          space above it, a top-placed one needs space below. --%>
    <div :if={render_here?(@locale, @position)} class={["px-4", wrapper_margin(@position)]}>
      <%!-- min-h, not h: the widget's real height varies with how many activity
            cards GetYourGuide returns and how they wrap, so a fixed height
            would either clip it or leave a gap. The floor is one row of
            activity cards — a 16:9 thumbnail at this column's 672px max width
            (~180px) plus title, rating and price lines and the widget's own
            heading and padding — which lands just under 400px.

            The script is `async defer`, so without a reserved floor the div
            paints at zero height and the widget's arrival shoves everything
            below it down. Reserved only at :top: there the div sits above the
            page's <h1>, so the shift moves the title itself at the top of the
            viewport, on pages whose whole value is organic search — worth
            paying 400px for. At :bottom the unit is the last thing before the
            footer, so its arrival displaces only the footer, below the fold —
            invisible either way. Reserving there buys nothing and costs a full
            400px of blank space on every page whose visitor blocks
            GetYourGuide's host, with the "shown above" disclosure rendering
            right below the void. --%>
      <div
        class={reserved_height(@position)}
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
