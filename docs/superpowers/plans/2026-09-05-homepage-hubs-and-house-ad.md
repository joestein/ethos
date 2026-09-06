# Homepage hubs and house ad — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Give the homepage a `Travel Guides` and a `Collections` section, and put a small attributed house ad for the Connecticut Foliage Forecast in the affiliate slot that already renders empty on most pages.

**Architecture:** `Ethos.HouseAd` owns a pool of ~25 attributed Connecticut photographs, resolved from published guides once at boot into `:persistent_term`. `EthosWeb.HouseAd` decides whether a given page qualifies — a controller-rendered public page with no affiliate widget and no foliage panel — and renders the unit. The homepage sections come straight from `Guides.list_states/0` and `Collections.list_published/0`, which already return what is needed.

**Tech Stack:** Elixir 1.18.4, Phoenix 1.7.14, Ecto/Postgres. No new dependencies.

**Spec:** `docs/superpowers/specs/2026-09-05-homepage-hubs-and-house-ad-design.md`

## Global Constraints

- **No new dependencies.** `mix.exs` must be untouched.
- **Run every test with `MIX_TEST_PARTITION=_foliage`.** The default `ethos_test` database is shared with other worktrees and has been migrated by an unrelated branch (it carries `users.username NOT NULL`, which does not exist here), producing ~333 spurious failures. `ethos_test_foliage` already exists and carries this branch's migrations. Baseline: **874 tests, 0 failures**.
- **Run `mix format` only on files you touched.** Never bare `mix format` — it reformats six unrelated files that are unclean on `origin/main` under Elixir 1.18.4 and creates phantom churn.
- **Every rendered ad carries attribution**, verbatim in the site's existing form: `— {author}, {license}, via Wikimedia Commons`. 420 of the 477 Connecticut photographs are CC BY or CC BY-SA; this is a licence obligation. A photo missing `author` or `license` is not rendered at all.
- **No "Visit Connecticut"**, no tourism-board name, mark, or logo anywhere.
- **The ad must never render** on a LiveView, on a page where an affiliate widget renders, or on a page already showing the foliage panel.
- **The honesty rule holds inside the ad.** A town that never reaches `:peak` reads "most advanced", not "estimated peak" — `Ethos.Foliage.peak_verified?/1` governs, exactly as on the forecast pages.
- **Voice:** restrained and specific. No exclamation marks, no travel-blog register.
- **The ad must never be able to take a page down.** Every failure path renders nothing.

---

### Task 1: `Ethos.HouseAd` — the photograph pool

The pool of attributed photographs, resolved once at boot. Pure selection logic is separated from the boot loader so it can be tested without a database.

**Files:**
- Create: `lib/ethos/house_ad.ex`
- Modify: `lib/ethos/application.ex` (one line)
- Test: `test/ethos/house_ad_test.exs`

**Interfaces:**
- Consumes: `Ethos.Guides.Guide`, `Ethos.Repo`.
- Produces:
  - `Ethos.HouseAd.pool() :: [photo]` where `photo` is the guide-photo map with string keys `"src"`, `"thumb"`, `"title"`, `"author"`, `"license"`, `"source_url"`
  - `Ethos.HouseAd.usable?(photo) :: boolean` — true when `author` and `license` are non-empty strings
  - `Ethos.HouseAd.pick(key :: String.t(), pool :: [photo]) :: photo | nil` — deterministic
  - `Ethos.HouseAd.load!() :: :ok`
  - `Ethos.HouseAd.child_spec/1`

- [ ] **Step 1: Write the failing test**

Create `test/ethos/house_ad_test.exs`:

```elixir
defmodule Ethos.HouseAdTest do
  use Ethos.DataCase, async: true

  alias Ethos.HouseAd

  defp photo(attrs \\ %{}) do
    Map.merge(
      %{
        "src" => "/photos/ct/avon/x.jpg",
        "thumb" => "/photos/ct/avon/x.jpg",
        "title" => "A church",
        "author" => "Daderot",
        "license" => "CC0",
        "source_url" => "https://commons.wikimedia.org/wiki/File:X.jpg"
      },
      attrs
    )
  end

  describe "usable?/1" do
    test "accepts a photo with an author and a licence" do
      assert HouseAd.usable?(photo())
    end

    test "rejects a photo with no author" do
      refute HouseAd.usable?(photo(%{"author" => ""}))
      refute HouseAd.usable?(Map.delete(photo(), "author"))
    end

    test "rejects a photo with no licence" do
      # 420 of the 477 Connecticut photographs are CC BY or CC BY-SA. Rendering
      # one without its licence is a licence breach, not a cosmetic gap.
      refute HouseAd.usable?(photo(%{"license" => ""}))
      refute HouseAd.usable?(Map.delete(photo(), "license"))
    end

    test "rejects a non-map" do
      refute HouseAd.usable?(nil)
      refute HouseAd.usable?("photo")
    end
  end

  describe "pick/2" do
    setup do
      %{pool: Enum.map(1..5, fn i -> photo(%{"title" => "photo #{i}"}) end)}
    end

    test "returns nil for an empty pool" do
      assert HouseAd.pick("/anything", []) == nil
    end

    test "is deterministic for a given key", %{pool: pool} do
      assert HouseAd.pick("/g/avon-ct-travel-guide", pool) ==
               HouseAd.pick("/g/avon-ct-travel-guide", pool)
    end

    test "varies across keys", %{pool: pool} do
      picks = Enum.map(1..40, &HouseAd.pick("/page/#{&1}", pool))
      assert length(Enum.uniq(picks)) > 1
    end

    test "always returns a member of the pool", %{pool: pool} do
      for i <- 1..40, do: assert(HouseAd.pick("/page/#{i}", pool) in pool)
    end

    test "handles a nil key without raising" do
      assert HouseAd.pick(nil, [photo()]) == photo()
    end
  end

  describe "pool/0" do
    test "returns a list even when nothing has been loaded" do
      assert is_list(HouseAd.pool())
    end

    test "every entry is usable" do
      # An unusable photo in the pool would render without attribution.
      assert Enum.all?(HouseAd.pool(), &HouseAd.usable?/1)
    end
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `MIX_TEST_PARTITION=_foliage mix test test/ethos/house_ad_test.exs`
Expected: FAIL — `module Ethos.HouseAd is not available`

- [ ] **Step 3: Write the implementation**

Create `lib/ethos/house_ad.ex`:

```elixir
defmodule Ethos.HouseAd do
  @moduledoc """
  The photograph pool behind the Connecticut Foliage Forecast house ad.

  Twenty-five Connecticut towns whose first photograph reads well at thumbnail
  size. Slugs rather than photo records: the list stays reviewable in a diff,
  and the photo data stays in one place — the guides that already own it.

  Resolved once at boot into `:persistent_term`, mirroring
  `Ethos.Foliage.Dataset`. A slug whose guide is unpublished or carries no
  usable photograph is skipped with a log line rather than raising. This is a
  promotional unit; it must never be able to take a page down.

  ## Attribution is a licence obligation, not a nicety

  420 of the 477 Connecticut guide photographs are CC BY or CC BY-SA. Both
  require visible attribution. `usable?/1` is what keeps an unattributable
  photograph out of the pool, so the rendering layer never has to decide.
  """

  require Logger

  import Ecto.Query

  alias Ethos.Guides.Guide
  alias Ethos.Repo

  @key {__MODULE__, :pool}

  @pool_slugs ~w(
    litchfield kent salisbury norfolk washington sharon cornwall
    woodbury essex chester old-lyme guilford madison stonington
    simsbury farmington avon granby suffield somers
    pomfret woodstock brooklyn canterbury lebanon
  )

  def child_spec(_opts) do
    %{id: __MODULE__, start: {__MODULE__, :start_link, []}, type: :worker, restart: :temporary}
  end

  def start_link do
    load!()
    :ignore
  end

  @doc "Resolves the pool slugs to photographs and stores the result."
  def load! do
    :persistent_term.put(@key, build_pool())
    :ok
  end

  @doc "The loaded pool, or an empty list if it has not been loaded."
  def pool, do: :persistent_term.get(@key, [])

  @doc """
  Whether a photograph can be rendered at all.

  Requires an author and a licence: without both, displaying it would breach
  the licence on all but the 57 CC0 and public-domain images.
  """
  def usable?(photo) when is_map(photo) do
    present?(Map.get(photo, "author")) and present?(Map.get(photo, "license")) and
      present?(Map.get(photo, "src"))
  end

  def usable?(_), do: false

  @doc """
  A deterministic member of `pool` for `key`.

  Deterministic rather than random so a given URL always shows the same
  photograph — caches stay coherent and tests stay predictable.
  """
  def pick(_key, []), do: nil

  def pick(key, pool) when is_list(pool) do
    Enum.at(pool, :erlang.phash2(key || "", length(pool)))
  end

  defp build_pool do
    photos =
      Repo.all(
        from g in Guide,
          where:
            g.status == "published" and g.state_slug == "connecticut" and
              g.destination_slug in ^@pool_slugs,
          select: {g.destination_slug, g.photos}
      )
      |> Enum.sort_by(&elem(&1, 0))
      |> Enum.flat_map(fn {slug, photos} ->
        case Enum.find(photos || [], &usable?/1) do
          nil ->
            Logger.warning("house ad: #{slug} has no usable photograph, skipped")
            []

          photo ->
            [photo]
        end
      end)

    if photos == [] do
      Logger.warning("house ad: pool is empty; the unit will not render")
    end

    photos
  end

  defp present?(value), do: is_binary(value) and String.trim(value) != ""
end
```

- [ ] **Step 4: Add the loader to the supervision tree**

In `lib/ethos/application.ex`, insert immediately after `Ethos.Foliage.Dataset`:

```elixir
      Ethos.HouseAd,
```

- [ ] **Step 5: Run the test to verify it passes**

Run: `MIX_TEST_PARTITION=_foliage mix test test/ethos/house_ad_test.exs`
Expected: PASS, 12 tests

- [ ] **Step 6: Confirm the pool resolves against real data**

```bash
MIX_ENV=dev mix run -e 'p = Ethos.HouseAd.pool(); IO.puts(">>> pool size: #{length(p)}"); IO.puts(">>> all usable: #{Enum.all?(p, &Ethos.HouseAd.usable?/1)}"); IO.inspect(Enum.map(Enum.take(p, 3), &Map.take(&1, ["title", "author", "license"])))'
```

Expected: pool size 25, all usable true. Report the actual number in your report — a pool smaller than 25 means a slug lost its guide, which is worth knowing.

- [ ] **Step 7: Format and commit**

```bash
mix format lib/ethos/house_ad.ex lib/ethos/application.ex test/ethos/house_ad_test.exs
git add lib/ethos/house_ad.ex lib/ethos/application.ex test/ethos/house_ad_test.exs
git commit -m "feat(house-ad): attributed Connecticut photograph pool loaded at boot"
```

---

### Task 2: `EthosWeb.HouseAd` — the decision rule and the unit

**Files:**
- Create: `lib/ethos_web/components/house_ad.ex`
- Modify: `lib/ethos_web/components/layouts/app.html.heex` (one call, after the bottom affiliate unit)
- Test: `test/ethos_web/components/house_ad_test.exs`

**Interfaces:**
- Consumes: `Ethos.HouseAd.pool/0`, `Ethos.HouseAd.pick/2`, `Ethos.HouseAd.usable?/1`, `EthosWeb.Affiliate.unit_renders?/1`, `Ethos.Foliage.town/1`, `Ethos.Foliage.peak_label/1`, `Ethos.Foliage.peak_verified?/1`.
- Produces:
  - `EthosWeb.HouseAd.for_page(assigns) :: %{photo: map, town: map | nil} | nil`
  - `EthosWeb.HouseAd.house_ad/1` — a function component taking `attr :ad`

**Three facts you need before writing this:**

1. `EthosWeb.Affiliate.unit_renders?/1` is **public** and takes the page assigns. It answers "will an affiliate widget render on this page". Use it; do not reimplement the check.
2. `Ethos.Affiliates.locale_for/2` returns `nil` for LiveViews, so "no affiliate widget" is trivially true on every authoring screen — the guide editor, the import and publish screens, the suggestions inbox, user settings. **You must exclude LiveViews separately**, with `Map.has_key?(assigns, :socket) or Map.has_key?(assigns, :live_module)`, which is how `Affiliate.locale_from_assigns/1` already does it.
3. A `Guide` carries `destination_slug`; a `Place` carries `town_slug`. Reading `destination_slug` off a place returns `nil` silently and every Connecticut place page would fall through to the generic pool. They are different field names and both are needed.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/components/house_ad_test.exs`:

```elixir
defmodule EthosWeb.HouseAdTest do
  use EthosWeb.ConnCase, async: true

  alias EthosWeb.HouseAd

  defp photo(attrs \\ %{}) do
    Map.merge(
      %{
        "src" => "/photos/ct/avon/church.jpg",
        "thumb" => "/photos/ct/avon/church.jpg",
        "title" => "Avon Congregational Church",
        "author" => "Daderot",
        "license" => "CC0",
        "source_url" => "https://commons.wikimedia.org/wiki/File:Avon.JPG"
      },
      attrs
    )
  end

  defp ct_guide(attrs \\ %{}) do
    Map.merge(
      %{
        __struct__: Ethos.Guides.Guide,
        state_slug: "connecticut",
        destination_slug: "avon",
        county: "Hartford County",
        tier: "guide",
        photos: [photo()]
      },
      attrs
    )
  end

  describe "for_page/1 — when it must not render" do
    test "returns nil on a LiveView" do
      # locale_for/2 returns nil for LiveViews, so "no affiliate here" is
      # trivially true on every authoring screen. Without this clause the ad
      # would appear on the guide editor and user settings.
      assert HouseAd.for_page(%{socket: %{}, guide: ct_guide()}) == nil
      assert HouseAd.for_page(%{live_module: SomeLive, guide: ct_guide()}) == nil
    end

    test "returns nil when the foliage panel is on the page" do
      # Otherwise a Connecticut town guide promotes the forecast twice within
      # about 200 pixels.
      assigns = %{guide: ct_guide(), foliage: %{town: %{name: "Avon"}}}
      assert HouseAd.for_page(assigns) == nil
    end

    test "returns nil when an affiliate widget renders" do
      ny = %{ct_guide() | state_slug: "new-york", county: "Brooklyn", destination_slug: "dumbo"}
      assert HouseAd.for_page(%{guide: ny}) == nil
    end
  end

  describe "for_page/1 — choosing the photograph" do
    test "uses the town's own photograph on a Connecticut guide out of season" do
      assigns = %{guide: ct_guide(), foliage: nil, page_canonical: "http://x/g/avon"}
      assert %{photo: p, town: town} = HouseAd.for_page(assigns)
      assert p["title"] == "Avon Congregational Church"
      assert town.name == "Avon"
    end

    test "uses a place's town_slug, not destination_slug" do
      # Place has no destination_slug at all; reading it would return nil and
      # silently fall through to the pool.
      place = %{
        __struct__: Ethos.Places.Place,
        state_slug: "connecticut",
        town_slug: "avon",
        county: "Hartford County",
        photos: [photo(%{"title" => "A place photo"})]
      }

      assert %{photo: p, town: town} = HouseAd.for_page(%{place: place, page_canonical: "http://x/p/y"})
      assert p["title"] == "A place photo"
      assert town.name == "Avon"
    end

    test "falls back to the pool with no town when there is no Connecticut context" do
      assigns = %{page_canonical: "http://x/c/mlb-ballparks"}

      case HouseAd.for_page(assigns) do
        nil -> assert Ethos.HouseAd.pool() == []
        %{photo: p, town: nil} -> assert Ethos.HouseAd.usable?(p)
      end
    end

    test "skips a contextual photograph that cannot be attributed" do
      guide = ct_guide(%{photos: [photo(%{"author" => ""})]})
      result = HouseAd.for_page(%{guide: guide, page_canonical: "http://x/g/avon"})

      # It may fall back to the pool, but it must never return the unattributable photo.
      refute match?(%{photo: %{"author" => ""}}, result)
    end

    test "returns nil when there is no context and the pool is empty" do
      # An empty pool must render no advert at all, never a broken image.
      assert HouseAd.for_page(%{page_canonical: "http://x/y"}, []) == nil
    end
  end

  describe "rendering" do
    test "renders nothing when ad is nil" do
      assert render_ad(nil) == ""
    end

    test "renders the forecast name, the photo and the attribution" do
      html = render_ad(%{photo: photo(), town: nil})

      assert html =~ "Connecticut Foliage Forecast"
      assert html =~ "/photos/ct/avon/church.jpg"
      assert html =~ "Daderot"
      assert html =~ "CC0"
      assert html =~ "via Wikimedia Commons"
      assert html =~ ~s(href="/foliage")
    end

    test "names the town and its window when there is a town" do
      town = Ethos.Foliage.town("avon")
      html = render_ad(%{photo: photo(), town: town})

      assert html =~ "Avon"
      assert html =~ Ethos.Foliage.peak_label(town)
    end

    test "says most advanced, not estimated peak, for an unverified town" do
      # The honesty rule does not get relaxed because the surface is an advert.
      greenwich = Ethos.Foliage.town("greenwich")
      refute Ethos.Foliage.peak_verified?(greenwich)

      html = render_ad(%{photo: photo(), town: greenwich})
      assert html =~ "most advanced"
      refute html =~ "estimated peak"
    end

    test "says estimated peak for a verified town" do
      salisbury = Ethos.Foliage.town("salisbury")
      assert Ethos.Foliage.peak_verified?(salisbury)

      html = render_ad(%{photo: photo(), town: salisbury})
      assert html =~ "estimated peak"
      refute html =~ "most advanced"
    end

    test "carries no tourism-board branding" do
      html = render_ad(%{photo: photo(), town: nil})
      refute html =~ ~r/visit connecticut/i
    end
  end

  # Defined at module level, not inside a describe block.
  defp render_ad(ad) do
    %{ad: ad}
    |> HouseAd.house_ad()
    |> Phoenix.HTML.Safe.to_iodata()
    |> IO.iodata_to_binary()
    |> String.trim()
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `MIX_TEST_PARTITION=_foliage mix test test/ethos_web/components/house_ad_test.exs`
Expected: FAIL — `module EthosWeb.HouseAd is not available`

- [ ] **Step 3: Write the component**

Create `lib/ethos_web/components/house_ad.ex`:

```elixir
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
  defp contextual(assigns) do
    with {slug, photos} <- subject(assigns),
         town when not is_nil(town) <- Foliage.town(slug || ""),
         photo when not is_nil(photo) <- Enum.find(photos || [], &Ethos.HouseAd.usable?/1) do
      {photo, town}
    else
      _ -> nil
    end
  end

  defp subject(%{guide: %{destination_slug: slug, photos: photos}}), do: {slug, photos}
  defp subject(%{place: %{town_slug: slug, photos: photos}}), do: {slug, photos}
  defp subject(_), do: nil

  attr :ad, :any, required: true

  def house_ad(assigns) do
    ~H"""
    <div :if={@ad} class="px-4 mt-10">
      <.link href={~p"/foliage"} class="flex items-center gap-4 rounded-xl border p-3 hover:border-zinc-400">
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
```

- [ ] **Step 4: Wire it into the layout**

In `lib/ethos_web/components/layouts/app.html.heex`, immediately after the closing `/>` of the `:bottom` affiliate unit and before `</div>`:

```heex
    <EthosWeb.HouseAd.house_ad ad={EthosWeb.HouseAd.for_page(assigns)} />
```

- [ ] **Step 5: Run the test to verify it passes**

Run: `MIX_TEST_PARTITION=_foliage mix test test/ethos_web/components/house_ad_test.exs`
Expected: PASS

- [ ] **Step 6: Verify through real HTTP, not only the helper**

A helper-only test leaves the layout's call site unguarded — deleting the line from `app.html.heex` would keep the suite green. Add to the same test file:

```elixir
  describe "through a real request" do
    import Ethos.GuidesFixtures

    test "appears on a guide page outside Connecticut", %{conn: conn} do
      # The layout call site is what puts the advert on ~480 pages. A
      # helper-only test leaves it unguarded: deleting the line from
      # app.html.heex would keep the suite green.
      guide = published_guide_fixture(%{title: "A Guide Somewhere"})
      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      if Ethos.HouseAd.pool() != [] do
        assert html =~ "Connecticut Foliage Forecast"
        assert html =~ "via Wikimedia Commons"
      end
    end

    test "never appears twice on one page", %{conn: conn} do
      guide = published_guide_fixture(%{title: "Another Guide"})
      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert length(Regex.scan(~r/Connecticut Foliage Forecast/, html)) <= 1
    end
  end
```

`published_guide_fixture/1` comes from `test/support/fixtures/guides_fixtures.ex`; see `test/ethos_web/controllers/collection_controller_test.exs` for how the suite uses it. The `if pool != []` guard is deliberate: the pool resolves from seeded Connecticut guides, and the test database may not carry them. Report in your report whether the pool was populated when you ran it — if it was empty, the assertion never ran and that is worth knowing.

- [ ] **Step 7: Run the full suite**

Run: `MIX_TEST_PARTITION=_foliage mix test`
Expected: 0 failures.

- [ ] **Step 8: Format and commit**

```bash
mix format lib/ethos_web/components/house_ad.ex lib/ethos_web/components/layouts/app.html.heex test/ethos_web/components/house_ad_test.exs
git add lib/ethos_web/components/house_ad.ex lib/ethos_web/components/layouts/app.html.heex test/ethos_web/components/house_ad_test.exs
git commit -m "feat(house-ad): attributed foliage promo in the empty affiliate slot"
```

---

### Task 3: Homepage `Travel Guides` and `Collections`

**Files:**
- Modify: `lib/ethos_web/controllers/page_controller.ex` (two assigns)
- Modify: `lib/ethos_web/controllers/page_html/home.html.heex` (two sections, appended before the closing `</div>`)
- Test: `test/ethos_web/controllers/page_controller_test.exs`

**Interfaces:**
- Consumes: `Ethos.Guides.list_states/0` — already returns `%{state: String.t(), slug: String.t(), count: integer}` ordered by count descending. `Ethos.Collections.list_published/0` — already ordered by title.
- Produces: `:hubs`, `:hub_count` and `:collections` assigns on the home template.

**Two facts you need:**

1. The homepage renders with `layout: false`, so it never sees the affiliate slots or the house ad. It keeps its own foliage line. Do not remove that line.
2. `list_states/0` already computes counts. Do not add a query.

- [ ] **Step 1: Write the failing test**

Append to `test/ethos_web/controllers/page_controller_test.exs`:

```elixir
  describe "travel guides and collections" do
    test "lists the five deepest hubs with their counts", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)
      hubs = Ethos.Guides.list_states() |> Enum.take(5)

      assert html =~ "Travel Guides"

      for hub <- hubs do
        assert html =~ hub.state
        assert html =~ ~s(href="/destinations/#{hub.slug}")
        assert html =~ Integer.to_string(hub.count)
      end
    end

    test "links to all destinations with a count that matches the hub list", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)
      total = length(Ethos.Guides.list_states())

      # The count is computed, not the literal 23, so it cannot drift from the
      # page it points at.
      assert html =~ "All #{total} destinations"
      assert html =~ ~s(href="/destinations")
    end

    test "lists every published collection", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      assert html =~ "Collections"

      for c <- Ethos.Collections.list_published() do
        escaped = c.title |> Phoenix.HTML.html_escape() |> Phoenix.HTML.safe_to_string()
        assert html =~ escaped
        assert html =~ ~s(href="/c/#{c.slug}")
      end
    end

    test "keeps the featured guide and the foliage line", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      assert html =~ "Connecticut Foliage Forecast"
      assert html =~ "Latest guides"
    end
  end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `MIX_TEST_PARTITION=_foliage mix test test/ethos_web/controllers/page_controller_test.exs`
Expected: FAIL — the page contains no "Travel Guides".

- [ ] **Step 3: Add the assigns**

In `lib/ethos_web/controllers/page_controller.ex`, inside `home/2` before the `render/3` call:

```elixir
    all_hubs = Ethos.Guides.list_states()
```

and add to the `render/3` keyword list:

```elixir
      hubs: Enum.take(all_hubs, 5),
      hub_count: length(all_hubs),
      collections: Ethos.Collections.list_published(),
```

- [ ] **Step 4: Add the sections to the template**

In `lib/ethos_web/controllers/page_html/home.html.heex`, immediately before the final `</div>` on the last line:

```heex
  <section :if={@hubs != []} class="mt-12 text-left">
    <div class="flex items-center justify-between">
      <h2 class="text-sm uppercase tracking-wide text-zinc-400">Travel Guides</h2>
      <.link navigate={~p"/destinations"} class="text-sm underline">
        All {@hub_count} destinations →
      </.link>
    </div>
    <ul class="mt-4 grid gap-3 sm:grid-cols-2">
      <li :for={hub <- @hubs} class="rounded-xl border p-4">
        <.link navigate={~p"/destinations/#{hub.slug}"} class="font-semibold hover:underline">
          {hub.state}
        </.link>
        <p class="text-sm text-zinc-500">{hub.count} {hub_noun(hub.slug)}</p>
      </li>
    </ul>
  </section>

  <section :if={@collections != []} class="mt-12 text-left">
    <h2 class="text-sm uppercase tracking-wide text-zinc-400">Collections</h2>
    <ul class="mt-4 grid gap-3 sm:grid-cols-2">
      <li :for={c <- @collections} class="rounded-xl border p-4">
        <.link navigate={~p"/c/#{c.slug}"} class="font-semibold hover:underline">{c.title}</.link>
      </li>
    </ul>
  </section>
```

- [ ] **Step 5: Add the noun helper**

In `lib/ethos_web/controllers/page_html.ex`, add:

```elixir
  # What each hub actually contains. "171 towns" is truer than "171 guides",
  # and an unmapped hub degrades to something true rather than something wrong.
  @hub_nouns %{
    "connecticut" => "towns",
    "new-york" => "neighbourhoods",
    "england" => "boroughs",
    "italy" => "zones",
    "california" => "neighbourhoods"
  }

  def hub_noun(slug), do: Map.get(@hub_nouns, slug, "guides")
```

The module is `EthosWeb.PageHTML`, which already exists and does `embed_templates "page_html/*"` — add the map and the function inside it.

- [ ] **Step 6: Run the tests**

Run: `MIX_TEST_PARTITION=_foliage mix test test/ethos_web/controllers/page_controller_test.exs`
Expected: PASS

- [ ] **Step 7: Run the full suite and look at the page**

```bash
MIX_TEST_PARTITION=_foliage mix test
```

Expected: 0 failures.

Then report what the homepage actually lists — the five hub names with counts and nouns, and the collection titles — so the copy can be checked by eye.

- [ ] **Step 8: Format and commit**

```bash
mix format lib/ethos_web/controllers/page_controller.ex lib/ethos_web/controllers/page_html.ex lib/ethos_web/controllers/page_html/home.html.heex test/ethos_web/controllers/page_controller_test.exs
git add lib/ethos_web/controllers/page_controller.ex lib/ethos_web/controllers/page_html.ex lib/ethos_web/controllers/page_html/home.html.heex test/ethos_web/controllers/page_controller_test.exs
git commit -m "feat(homepage): Travel Guides hubs and Collections sections"
```

---

## Post-implementation

- [ ] Deploy and confirm the ad appears on a non-Connecticut page and is absent on an in-season Connecticut town guide.
- [ ] Confirm every rendered ad carries an author and a licence.
