defmodule EthosWeb.HouseAd do
  @moduledoc """
  A small promotional unit for the Connecticut Foliage Forecast, filling the
  affiliate slot on pages that have no affiliate widget.

  ## Why it skips pages that already carry the foliage panel

  In season, the Connecticut town guides carrying the foliage panel name the
  town and its window. An ad on the same page would promote the same thing
  twice within about 200 pixels. Out of season the panel disappears and the
  ad takes over there too, reaching every guide page that has neither an
  affiliate widget nor the panel — New York, England, Italy, California,
  ballparks, and Connecticut guides once their window has passed.

  ## Why LiveViews need their own clause

  `Ethos.Affiliates.locale_for/2` returns `nil` for LiveViews, so "no
  affiliate widget renders here" is trivially true on every authoring and
  account screen. Without the explicit check the ad would appear on the guide
  editor, the import and publish screens, the suggestions inbox and user
  settings.

  ## Other reasons a page opts out

  - `assigns[:house_ad] == false` — an explicit opt-out for a page that is
    itself about the forecast (`/foliage` and its route pages). Otherwise
    `/foliage` would end with an advertisement for `/foliage`.
  - `is_nil(assigns[:page_canonical])` — `page_canonical` is assigned only by
    the six public HTML controllers (page, guide, destination, place,
    collection, foliage). A controller that assigns none — every admin
    screen, `/badges`, `robots.txt`, the sitemap, the session controller —
    is not "a controller-rendered public page" per the design, whether or
    not it happens to be a LiveView. `/search` also assigns none, so it
    carries no ad; that is accepted, not a bug.

  ## The amber GetYourGuide fallback CTA yields to this ad

  `show.html.heex` renders a generic "Planning your own trip?" CTA under the
  same condition this ad renders under (no affiliate widget on the page), so
  without coordination a guide page outside New York and Italy would carry
  both. The CTA's own `:if` now also requires `for_page/2` to return `nil`
  for the page — this ad takes precedence when it can render, and the CTA
  remains the fallback for when there is no ad to show (empty pool, no
  usable photograph). There is no tier gate here: this module treats every
  guide the same regardless of `tier`.
  """

  use Phoenix.Component
  use EthosWeb, :verified_routes

  alias Ethos.Foliage

  @doc """
  The advert for a page, or nil when the page does not qualify.

  Takes the full page assigns because the decision reads several of them.
  """
  def for_page(assigns, pool \\ nil)

  def for_page(assigns, pool) when is_map(assigns) do
    pool = pool || Ethos.HouseAd.pool()

    cond do
      Map.has_key?(assigns, :socket) or Map.has_key?(assigns, :live_module) -> nil
      assigns[:house_ad] == false -> nil
      is_nil(assigns[:page_canonical]) -> nil
      assigns[:foliage] -> nil
      EthosWeb.Affiliate.unit_renders?(assigns) -> nil
      true -> build(assigns, pool)
    end
  end

  def for_page(_assigns, _pool), do: nil

  defp build(assigns, pool) do
    case contextual(assigns) do
      {photo, town} ->
        %{photo: photo, town: town}

      nil ->
        case Ethos.HouseAd.pick(assigns[:page_canonical] || assigns[:page_title], pool) do
          nil -> nil
          photo -> %{photo: photo, town: nil}
        end
    end
  end

  # A guide and a place both reach their town the same way now: through
  # `destination_node`. Before the destination tree these were two different
  # fields — a Guide carried `destination_slug`, a Place carried `town_slug` —
  # and each clause needed its own.
  #
  # The Connecticut check on both clauses is load-bearing, not decorative:
  # `Foliage.town/1` resolves on slug alone, and several town names are shared
  # with places well outside Connecticut — Lisbon (as in "Lisbon, Portugal"),
  # and Greenwich and Enfield (as in the London boroughs). Without it, a guide
  # about Greenwich, London would take the contextual branch and claim a
  # Connecticut foliage estimate for a page about England. It used to read
  # `state_slug: "connecticut"`; `Foliage.connecticut?/1` is the same guard
  # against the tree, and a stricter one — it asks whether the node genuinely
  # sits under `united-states/connecticut`, where the slug asked only whether a
  # derived string matched.
  defp contextual(assigns) do
    with {slug, photos} <- subject(assigns),
         town when not is_nil(town) <- Foliage.town(slug || ""),
         photo when not is_nil(photo) <- Enum.find(photos || [], &Ethos.HouseAd.usable?/1) do
      {photo, town}
    else
      _ -> nil
    end
  end

  defp subject(%{guide: %{destination_node: node, photos: photos}}),
    do: connecticut_town(node, photos)

  defp subject(%{place: %{destination_node: node, photos: photos}}),
    do: connecticut_town(node, photos)

  defp subject(_), do: nil

  # `nil` rather than a tuple for anything that is not a Connecticut node —
  # including a nil or unpreloaded association, which `Foliage.connecticut?/1`
  # answers `false` for rather than raising. `contextual/1`'s `with` treats
  # either the same way: fall through to the generic pool ad.
  defp connecticut_town(node, photos) do
    if Foliage.connecticut?(node), do: {node.slug, photos}, else: nil
  end

  attr :ad, :any, required: true

  def house_ad(assigns) do
    ~H"""
    <div :if={@ad} class="px-4 mt-10">
      <.link
        href={~p"/foliage"}
        class="flex items-center gap-4 rounded-xl border p-3 hover:border-zinc-400"
      >
        <img
          src={@ad.photo["thumb"] || @ad.photo["src"]}
          alt={@ad.photo["title"]}
          loading="lazy"
          class="h-16 w-24 flex-none rounded object-cover"
        />
        <span class="min-w-0">
          <span class="block font-semibold">Connecticut Foliage Forecast</span>
          <span :if={@ad.town} class="block text-sm text-zinc-600">
            {@ad.town.name} — {peak_phrase(@ad.town)} {Foliage.peak_label(@ad.town)}
          </span>
          <span :if={is_nil(@ad.town)} class="block text-sm text-zinc-600">
            169 towns, seven state driving routes
          </span>
        </span>
      </.link>
      <%!-- Outside the link above, not nested inside it: a nested <a> is
            invalid HTML, and the licence obligation on 23 of the 25 pool
            photographs is to keep the source URI attached, not merely to
            name Wikimedia Commons. --%>
      <p class="mt-1 px-1 text-xs text-zinc-400">
        {@ad.photo["title"]} — {@ad.photo["author"]}, {@ad.photo["license"]}, via
        <a
          :if={EthosWeb.Url.safe_http?(@ad.photo["source_url"])}
          href={@ad.photo["source_url"]}
          class="underline"
          rel="nofollow noopener"
        >
          Wikimedia Commons
        </a>
        <span :if={!EthosWeb.Url.safe_http?(@ad.photo["source_url"])}>Wikimedia Commons</span>
      </p>
    </div>
    """
  end

  # The honesty rule from the forecast pages applies here too: 36 of the 169
  # towns never reach full colour on DEEP's map, and their window names the
  # week they are most advanced.
  defp peak_phrase(town) do
    if Foliage.peak_verified?(town), do: "estimated peak", else: "most advanced"
  end
end
