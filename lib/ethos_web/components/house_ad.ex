defmodule EthosWeb.HouseAd do
  @moduledoc """
  A small promotional unit for the Connecticut Foliage Forecast, filling the
  affiliate slot on pages that have no affiliate widget.

  ## Why it skips pages that already carry the foliage panel

  In season, the 171 Connecticut town guides render a panel that names the
  town and its window. An ad on the same page would promote the same thing
  twice within about 200 pixels. Skipping them also gets the targeting right
  without extra logic: in season the ad reaches the roughly 70 pages that are
  *not* Connecticut guides, introducing the forecast to readers who have not
  met it; out of season the panel disappears and the ad takes over there too.

  ## Why LiveViews need their own clause

  `Ethos.Affiliates.locale_for/2` returns `nil` for LiveViews, so "no
  affiliate widget renders here" is trivially true on every authoring and
  account screen. Without the explicit check the ad would appear on the guide
  editor, the import and publish screens, the suggestions inbox and user
  settings.
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

  # A Guide carries `destination_slug`; a Place carries `town_slug`. They are
  # different fields and both are needed — reading `destination_slug` off a
  # place returns nil and every Connecticut place page would fall through.
  #
  # The `state_slug: "connecticut"` guard on both clauses is load-bearing, not
  # decorative: `Foliage.town/1` resolves on slug alone, and several town
  # names are shared with places well outside Connecticut — Lisbon (as in
  # "Lisbon, Portugal"), and Greenwich and Enfield (as in the London
  # boroughs). Without the state check, a guide about Greenwich, London would
  # take the contextual branch and claim a Connecticut foliage estimate for
  # a page about England.
  defp contextual(assigns) do
    with {slug, photos} <- subject(assigns),
         town when not is_nil(town) <- Foliage.town(slug || ""),
         photo when not is_nil(photo) <- Enum.find(photos || [], &Ethos.HouseAd.usable?/1) do
      {photo, town}
    else
      _ -> nil
    end
  end

  defp subject(%{guide: %{state_slug: "connecticut", destination_slug: slug, photos: photos}}),
    do: {slug, photos}

  defp subject(%{place: %{state_slug: "connecticut", town_slug: slug, photos: photos}}),
    do: {slug, photos}

  defp subject(_), do: nil

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
          <span class="mt-1 block text-xs text-zinc-400">
            {@ad.photo["title"]} — {@ad.photo["author"]}, {@ad.photo["license"]}, via Wikimedia Commons
          </span>
        </span>
      </.link>
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
