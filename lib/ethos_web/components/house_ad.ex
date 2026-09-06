defmodule EthosWeb.HouseAd do
  @moduledoc """
  The house ad in the top slot of every page.

  A slot, not a foliage card. The ad it carries today is the Connecticut
  Foliage Forecast; swapping it is editing `@ad` below and nothing else, which
  is the whole reason this is a module rather than markup pasted into two
  templates.

  ## Where it renders, and the two places it does not

  `app.html.heex` carries it for every page on the app layout, and
  `page_html/home.html.heex` carries it separately — the home page renders with
  `layout: false` (see `page_controller.ex`), so it draws its own header and a
  change to the layout does not reach it. Those are the only two call sites; a
  third would mean a third thing to keep in step.

  It suppresses itself in two cases, and both are checked here rather than by
  the callers, so a new template cannot forget them:

    * **`house_ad: false`** — set by `foliage_controller.ex` on the forecast and
      the seven route pages. A card inviting a reader to the page they are
      already reading is dead weight. (`/foliage/embed` never reaches this: it
      disables both layouts, because it is an iframe meant to sit on somebody
      else's site.)

    * **A top-placed affiliate unit** — Rome carries a paid GetYourGuide widget
      in this exact slot, reserving 400px. The paid unit wins; stacking both
      would put roughly 500px of advertising above the page's `<h1>`.
      `EthosWeb.Affiliate.top_unit_renders?/1` is the single predicate, and it
      lives in that module beside its sibling for the drift reason recorded
      there.

  ## The suppression is an assign, not a path check

  `assigns[:house_ad] != false` rather than a test against
  `@conn.request_path`, because `app.html.heex` is shared by controllers AND
  LiveViews. A LiveView render has `@socket` and no `@conn`, so a path check
  would work on every controller page and raise on the account screens.

  Defaulting to *render* also puts the burden in the right place: a page that
  wants no house ad says so, and a new controller cannot silently lose it.

  ## The photograph is Chester's, and so is its credit

  `@ad` names a photo the corpus already owns — Chester's guide publishes it —
  with the same title, author, licence and source URL that guide carries. It is
  CC BY-SA 4.0, which requires attribution, and the credit renders from those
  fields for the same reason the credit on any other page does. A house ad is
  not an exemption from the licence, and retyping the credit by hand is how the
  two copies drift.
  """

  use Phoenix.Component
  use EthosWeb, :verified_routes

  alias EthosWeb.Affiliate

  @ad %{
    href: "/foliage",
    title: "Connecticut Foliage Forecast",
    subtitle: "169 towns, seven state driving routes",
    image: "/photos/ct/chester/chester-main-street_thumb.jpg",
    alt: "Main Street in Chester, Connecticut",
    credit: %{
      title: "Main Street, Chester",
      author: "John Phelan",
      license: "CC BY-SA 4.0",
      source_url: "https://commons.wikimedia.org/wiki/File:Main_Street,_Chester_CT.jpg"
    }
  }

  attr :page, :map,
    required: true,
    doc: """
    The calling page's whole assigns, passed as one map: `page={assigns}`.

    Explicitly a single attribute rather than a `{assigns}` spread, and that is
    not a style choice — the spread silently failed. A Rome guide rendered the
    paid GetYourGuide unit AND this house ad on the same page, because the
    spread did not carry `:guide` through to the component, so
    `top_unit_renders?/1` was asked about an assigns map that had no locale in
    it and truthfully answered no.

    The component needs the locale-bearing keys — `:guide`, `:place`,
    `:collection`, `:guides` — and it cannot name them, because which one is
    present is the calling page's business. So it takes the map whole.
    """

  @doc """
  Renders the house ad, or nothing.

  Reads `:house_ad` from `@page` and hands the same map to
  `EthosWeb.Affiliate.top_unit_renders?/1`, which resolves the locale from
  whichever of `:guide`, `:place`, `:collection` or `:guides` the page carries.
  """
  def house_ad(assigns) do
    assigns =
      assigns
      |> assign(:ad, @ad)
      |> assign(:show?, show?(assigns.page))

    ~H"""
    <div :if={@show?} class="mb-10">
      <.link
        navigate={@ad.href}
        class="flex items-center gap-4 rounded-xl border p-4 hover:bg-zinc-50"
      >
        <img
          src={@ad.image}
          alt={@ad.alt}
          width="200"
          height="130"
          loading="lazy"
          decoding="async"
          class="h-[88px] w-[132px] shrink-0 rounded-md object-cover"
        />
        <span class="min-w-0">
          <span class="block text-xl font-bold">{@ad.title}</span>
          <span class="block text-zinc-600">{@ad.subtitle}</span>
        </span>
      </.link>
      <p class="mt-2 text-xs text-zinc-500">
        {@ad.credit.title} — {@ad.credit.author}, {@ad.credit.license}, via
        <.link href={@ad.credit.source_url} class="underline" rel="nofollow">
          Wikimedia Commons
        </.link>
      </p>
    </div>
    """
  end

  # Three conditions, and the LiveView one is not theoretical. The social layer
  # embeds a reactions LiveView in every guide page, and that LiveView
  # re-renders `app.html.heex` — so without this the ad rendered TWICE on a
  # guide: once for the page, correctly suppressed on Rome where the paid unit
  # owns the slot, and once for the embedded LiveView, whose assigns carry
  # `:socket` and no `:guide` and which therefore could not know either that a
  # paid unit had already taken the slot or that the page had opted out.
  #
  # A LiveView render is never a page in its own right here, so it never
  # carries the ad. `EthosWeb.Affiliate.live_render?/1` is the one definition
  # of that tell; the affiliate unit has always relied on it for the same
  # reason.
  defp show?(page) do
    not Affiliate.live_render?(page) and
      page[:house_ad] != false and
      not Affiliate.top_unit_renders?(page)
  end
end
