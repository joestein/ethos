# Affiliate Placement Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Put the GetYourGuide widget on every New York page — guides, places, destination hubs, collections — without touching any other page, keyed by geography from configuration.

**Architecture:** Two layers. `Ethos.Affiliates` is pure domain logic: a config-driven registry and the functions that resolve a state slug plus county to a locale, including unanimity over a list of guides. `EthosWeb.Affiliate` is the web layer: it reads assigns to find the page's locale, and renders two function components. Both tags live in the **layouts**, not in page templates, so any page added later inherits them with no code change.

**Tech Stack:** Elixir, Phoenix 1.7.14, HEEx function components, ExUnit.

**Spec:** `docs/superpowers/specs/2026-08-31-affiliate-placement-design.md`

## Global Constraints

- **Zero AI calls and zero server-side external API calls in shipped code.** The GetYourGuide `<script>` is a client-side browser tag, which is the same category as the AdSense tag already in `root.html.heex`. No Elixir code may call GetYourGuide.
- **Work only in the worktree** `/Users/charmalloc/dev/ethos/.claude/worktrees/connecticut-expansion`. Never `cd` to the original repo root.
- **Never use bare `git stash`** — the stash stack is shared with other sessions. Use a WIP commit.
- **Do not push and do not deploy.** Commit locally only.
- **The exact tag values**, copied verbatim from the spec:
  - script `src`: `https://widget.getyourguide.com/dist/pa.umd.production.min.js`
  - `data-gyg-partner-id`: `ZA4AIMF`
  - `data-gyg-widget`: `auto`
  - `data-gyg-cmp`: `new-york`
- **The script must carry `async` and `defer`.** It must never block render.
- **One widget div per page, maximum.** Two is a defect.
- **Non-New-York pages keep the existing amber CTA unchanged.** Rome, all 165 Connecticut towns, all 30 ballparks.
- **Per-entry `booking_url` links are untouched** (`guide_html/show.html.heex:90-96`).
- Run `mix format --check-formatted` and the full `mix test` before every commit. Baseline is 590 tests, 0 failures, 31 excluded.
- One pre-existing Gettext warning at `lib/ethos_web/gettext.ex:23` is tolerated. Any NEW compiler warning is a defect.

---

## File Structure

| File | Responsibility | Task |
|---|---|---|
| `config/config.exs` | The `:affiliate_locales` registry entry for New York. | 1 |
| `lib/ethos/affiliates.ex` | Pure domain: `locale_for/2`, `unanimous_locale/1`. No web, no assigns. | 1 |
| `test/ethos/affiliates_test.exs` | Resolver unit tests, including the county-guard test. | 1 |
| `lib/ethos_web/components/affiliate.ex` | Web layer: `locale_from_assigns/1` and the two function components. | 2 |
| `lib/ethos_web/components/layouts/root.html.heex` | Renders `<.affiliate_head>` in `<head>`. | 2 |
| `lib/ethos_web/components/layouts/app.html.heex` | Renders `<.affiliate_unit>` after `{@inner_content}`. | 2 |
| `lib/ethos_web/controllers/guide_html/show.html.heex:35` | Amber aside becomes conditional on having no locale. | 2 |
| `test/ethos_web/affiliate_placement_test.exs` | Rendering tests, both directions, per page type. | 2 |
| `test/ethos_web/affiliate_corpus_test.exs` | Real-corpus guards: madison, MLB collection, no-double-widget. | 3 |

---

### Task 1: The registry and the resolver

**Files:**
- Create: `lib/ethos/affiliates.ex`
- Create: `test/ethos/affiliates_test.exs`
- Modify: `config/config.exs`

**Interfaces:**
- Consumes: nothing.
- Produces:
  - `Ethos.Affiliates.locale_for(state_slug :: String.t() | nil, county :: String.t() | nil) :: map() | nil` — returns the locale map (with keys `:network`, `:partner_id`, `:cmp`, and possibly `:counties`) or `nil`.
  - `Ethos.Affiliates.unanimous_locale(guides :: list()) :: map() | nil` — each element must respond to `.state_slug` and `.county`. Returns the shared locale, or `nil` if the list is empty, if any element resolves to `nil`, or if two elements resolve differently.

**Context:** `Ethos.Guides.Guide` and `Ethos.Places.Place` both carry `state`, `state_slug`, `county`, `county_slug`. The slugs are derived from the display names by `Guide.derive_destination_slug/1` at changeset time (`lib/ethos/guides/guide.ex:115-122`), so `state: "New York"` yields `state_slug: "new-york"` and `county: "Brooklyn"` yields `county_slug: "brooklyn"`.

**The `counties` guard matches on the DISPLAY name (`county`), not the slug** — `"Manhattan"`, not `"manhattan"`. Both schemas carry the display name, and it is what the seed gates already constrain.

- [ ] **Step 1: Write the failing test**

Create `test/ethos/affiliates_test.exs`:

```elixir
defmodule Ethos.AffiliatesTest do
  use ExUnit.Case, async: true

  alias Ethos.Affiliates

  # A stand-in for a Guide or a Place. Both real schemas carry these two
  # fields, and the resolver reads nothing else, so a struct with exactly
  # these fields cannot drift from what production passes in.
  defmodule Row do
    defstruct [:state_slug, :county]
  end

  defp row(state_slug, county), do: %Row{state_slug: state_slug, county: county}

  describe "locale_for/2" do
    test "each New York borough resolves to the New York locale" do
      for county <- ~w(Manhattan Brooklyn Bronx Queens) do
        locale = Affiliates.locale_for("new-york", county)

        assert locale, "#{county} did not resolve"
        assert locale.network == :getyourguide
        assert locale.partner_id == "ZA4AIMF"
        assert locale.cmp == "new-york"
      end
    end

    # THE GUARD TEST. GetYourGuide's "new-york" campaign is New York CITY.
    # Without the counties allowlist an upstate guide inherits a campaign for
    # a city 300 miles away, and every other test in this file still passes.
    # If this test is deleted, the allowlist can be deleted with it and
    # nothing goes red. It is the only thing making that list load-bearing.
    test "an upstate New York county resolves to nil" do
      refute Affiliates.locale_for("new-york", "Albany")
      refute Affiliates.locale_for("new-york", "Dutchess")
      refute Affiliates.locale_for("new-york", "Niagara")
    end

    # The state hub /destinations/new-york has no county. It must resolve, and
    # it reads like an oversight in the implementation, so it is pinned here.
    test "a nil county resolves — this is the state-hub case" do
      assert Affiliates.locale_for("new-york", nil)
    end

    test "states with no registry entry resolve to nil" do
      refute Affiliates.locale_for("connecticut", "Litchfield County")
      refute Affiliates.locale_for("italy", nil)
      refute Affiliates.locale_for(nil, nil)
    end
  end

  describe "unanimous_locale/1" do
    test "a list of New York rows resolves to the New York locale" do
      assert Affiliates.unanimous_locale([row("new-york", "Brooklyn"), row("new-york", "Bronx")])
    end

    test "an empty list resolves to nil" do
      refute Affiliates.unanimous_locale([])
    end

    # Mixed geography is the whole reason this function exists. A rule that
    # took the first row, or a majority, would put a New York City tours
    # widget on a page that is half about somewhere else.
    test "a mixed list resolves to nil" do
      refute Affiliates.unanimous_locale([
               row("new-york", "Brooklyn"),
               row("connecticut", "New Haven County")
             ])
    end

    test "one unresolvable row makes the whole list unresolvable" do
      refute Affiliates.unanimous_locale([row("new-york", "Brooklyn"), row("new-york", "Albany")])
    end
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `mix test test/ethos/affiliates_test.exs`

Expected: FAIL to compile — `Ethos.Affiliates.locale_for/2 is undefined (module Ethos.Affiliates is not available)`.

- [ ] **Step 3: Add the registry to config**

In `config/config.exs`, before the `import_config` line at the bottom:

```elixir
# Affiliate placement, keyed by state slug. See
# docs/superpowers/specs/2026-08-31-affiliate-placement-design.md
#
# `counties` is a GUARD, not decoration. GetYourGuide's "new-york" campaign is
# New York CITY. Every New York page in the corpus today is a borough, so
# keying on state alone is correct today and silently wrong the day a Hudson
# Valley or Niagara guide ships and inherits a campaign for a city 300 miles
# away. Remove this list only when a separate upstate campaign exists.
#
# Staten Island is listed although no Staten Island content exists yet: it is a
# borough and the campaign covers it. It is the one forward-looking entry.
config :ethos, :affiliate_locales, %{
  "new-york" => %{
    network: :getyourguide,
    partner_id: "ZA4AIMF",
    cmp: "new-york",
    counties: ["Manhattan", "Brooklyn", "Bronx", "Queens", "Staten Island"]
  }
}
```

- [ ] **Step 4: Write the module**

Create `lib/ethos/affiliates.ex`:

```elixir
defmodule Ethos.Affiliates do
  @moduledoc """
  Resolves a page's affiliate locale from its geography.

  Pure domain logic: no assigns, no HTML, no Phoenix. The web layer
  (`EthosWeb.Affiliate`) extracts a state slug and county from whatever the
  page assigned and calls in here.

  ## The failure mode is deliberate

  Everything that does not resolve returns `nil`, and `nil` renders no widget.
  An unknown state, an unrecognised county, a mixed-geography list — all yield
  a missing widget, never a wrong one. That asymmetry is why the resolver is
  permissive about what it accepts and strict about what it confirms.

  ## Configuration

  `config :ethos, :affiliate_locales` maps a **state slug** to a locale. Adding
  Rome or Amsterdam is a config entry; adding a second affiliate network is a
  new `:network` value plus one component clause in `EthosWeb.Affiliate`.
  """

  @doc """
  The locale for a state slug and county, or `nil`.

  A `nil` county is the destination-hub case (`/destinations/new-york`) and
  resolves to the locale. A present county must appear in the entry's
  `:counties` list when it has one.
  """
  def locale_for(state_slug, county)

  def locale_for(nil, _county), do: nil

  def locale_for(state_slug, county) when is_binary(state_slug) do
    case Map.get(locales(), state_slug) do
      nil -> nil
      locale -> if county_allowed?(locale, county), do: locale, else: nil
    end
  end

  @doc """
  The locale shared by every row in the list, or `nil`.

  Each row must carry `:state_slug` and `:county` — `Ethos.Guides.Guide` and
  `Ethos.Places.Place` both do. Returns `nil` for an empty list, for any row
  that does not resolve, and for two rows that resolve differently.
  """
  def unanimous_locale([]), do: nil

  def unanimous_locale(rows) when is_list(rows) do
    rows
    |> Enum.map(&locale_for(&1.state_slug, &1.county))
    |> Enum.uniq()
    |> case do
      [locale] -> locale
      _ -> nil
    end
  end

  def unanimous_locale(_not_a_list), do: nil

  # A locale with no :counties key accepts any county. A nil county is the
  # hub case and is always accepted — see the moduledoc.
  defp county_allowed?(locale, county) do
    case {Map.get(locale, :counties), county} do
      {nil, _} -> true
      {_counties, nil} -> true
      {counties, county} -> county in counties
    end
  end

  defp locales, do: Application.get_env(:ethos, :affiliate_locales, %{})
end
```

Note the `[locale]` match in `unanimous_locale/1` handles the all-nil case for free: a list of rows that all resolve to `nil` uniqs to `[nil]`, and `nil` is falsy, so the caller renders nothing. Confirm this by reading the "one unresolvable row" test — it passes because `[locale, nil]` uniqs to two elements, not because `nil` is special-cased.

- [ ] **Step 5: Run the test to verify it passes**

Run: `mix test test/ethos/affiliates_test.exs`

Expected: PASS, 8 tests, 0 failures.

- [ ] **Step 6: Prove the guard test can fail**

Temporarily delete the `counties:` line from `config/config.exs` and re-run:

Run: `mix test test/ethos/affiliates_test.exs`

Expected: the "an upstate New York county resolves to nil" test FAILS, and no other test does. If any other test also fails, or if that one passes, the guard is not doing what the comment claims. **Restore the line before continuing** and re-run to confirm green.

Report the result of this step explicitly — it is the only evidence that the allowlist is load-bearing.

- [ ] **Step 7: Run the full suite and the formatter**

Run: `mix format && mix test`

Expected: 590 baseline + 8 new, 0 failures, 31 excluded.

- [ ] **Step 8: Commit**

```bash
git add config/config.exs lib/ethos/affiliates.ex test/ethos/affiliates_test.exs
git commit -m "Add the affiliate locale registry and resolver

Pure domain logic, keyed by state slug, with a counties allowlist that
exists because GetYourGuide's new-york campaign is New York CITY. Keying
on state alone is correct today and silently wrong the day an upstate
guide ships.

Everything that does not resolve returns nil, and nil renders nothing —
the failure mode is a missing widget, never a wrong one."
```

---

### Task 2: The components, the layouts, and the amber suppression

**Files:**
- Create: `lib/ethos_web/components/affiliate.ex`
- Create: `test/ethos_web/affiliate_placement_test.exs`
- Modify: `lib/ethos_web/components/layouts/root.html.heex` (after the AdSense script block, lines 13-18)
- Modify: `lib/ethos_web/components/layouts/app.html.heex` (after `{@inner_content}`)
- Modify: `lib/ethos_web/controllers/guide_html/show.html.heex:35` (the amber aside)

**Interfaces:**
- Consumes: `Ethos.Affiliates.locale_for/2` and `Ethos.Affiliates.unanimous_locale/1` from Task 1.
- Produces:
  - `EthosWeb.Affiliate.locale_from_assigns(assigns :: map()) :: map() | nil`
  - `EthosWeb.Affiliate.affiliate_head/1` — function component, attr `locale`
  - `EthosWeb.Affiliate.affiliate_unit/1` — function component, attr `locale`

**Context — the assign shapes, verified against the controllers:**

| Assign | Set by | Shape |
|---|---|---|
| `:guide` | `guide_controller.ex` show | a `%Ethos.Guides.Guide{}` |
| `:place` | `place_controller.ex:8` show | a `%Ethos.Places.Place{}` |
| `:collection` | `collection_controller.ex:16` | has `.items`, each with `.guide` |
| `:guides` | `destination_controller.ex:79` (town hub), `:119` (state hub), `:154-160` (county hub) | a list of `%Guide{}` |

The state hub also assigns `:shadowed` — guides from *other* states sharing a destination slug. **Do not consult it.** Those guides are not what the page is about.

`app.html.heex` currently reads, in full:

```heex
<EthosWeb.Layouts.site_header current_user={@current_user} />
<main class="px-4 py-20 sm:px-6 lg:px-8">
  <div class="mx-auto max-w-2xl">
    <.flash_group flash={@flash} />
    {@inner_content}
  </div>
</main>
```

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/affiliate_placement_test.exs`:

```elixir
defmodule EthosWeb.AffiliatePlacementTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures

  alias Ethos.Places

  @script_src "https://widget.getyourguide.com/dist/pa.umd.production.min.js"
  @widget ~s(data-gyg-widget="auto")
  @amber "Planning your own trip?"

  defp ny_guide(title, county) do
    published_guide_fixture(%{
      "title" => title,
      "destination" => "#{title}, New York",
      "state" => "New York",
      "county" => county
    })
  end

  defp ct_guide(title) do
    published_guide_fixture(%{
      "title" => title,
      "destination" => "#{title}, Connecticut",
      "state" => "Connecticut",
      "county" => "Litchfield County"
    })
  end

  describe "guide pages" do
    test "a New York guide carries the script and the widget, and NOT the amber CTA", %{
      conn: conn
    } do
      g = ny_guide("Belmont", "Bronx")
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      assert html =~ @script_src
      assert html =~ @widget
      assert html =~ ~s(data-gyg-cmp="new-york")
      assert html =~ ~s(data-gyg-partner-id="ZA4AIMF")
      refute html =~ @amber
    end

    # The other direction. Either assertion alone passes trivially against a
    # template that always renders one or always renders the other.
    test "a Connecticut guide carries the amber CTA and NOT the script or widget", %{conn: conn} do
      g = ct_guide("Woodbury")
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      assert html =~ @amber
      refute html =~ @script_src
      refute html =~ @widget
    end

    test "an upstate New York guide is treated as non-New-York", %{conn: conn} do
      g = ny_guide("Rhinebeck", "Dutchess")
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      assert html =~ @amber
      refute html =~ @widget
    end
  end

  describe "place pages" do
    test "a New York place carries the widget", %{conn: conn} do
      Places.upsert_place!(%{
        slug: "teitel-brothers",
        name: "Teitel Brothers",
        kind: "shop",
        town: "Belmont",
        state: "New York",
        county: "Bronx",
        summary: "An Arthur Avenue grocery.",
        status: "open"
      })

      html = conn |> get(~p"/p/teitel-brothers") |> html_response(200)

      assert html =~ @script_src
      assert html =~ @widget
    end

    test "a Connecticut place carries neither", %{conn: conn} do
      Places.upsert_place!(%{
        slug: "palace-theater-waterbury",
        name: "Palace Theater",
        kind: "theater",
        town: "Waterbury",
        state: "Connecticut",
        county: "New Haven County",
        summary: "A 1922 movie palace.",
        status: "open"
      })

      html = conn |> get(~p"/p/palace-theater-waterbury") |> html_response(200)

      refute html =~ @script_src
      refute html =~ @widget
    end
  end

  describe "destination hubs" do
    test "the New York state hub carries the widget — the nil-county case", %{conn: conn} do
      ny_guide("Belmont", "Bronx")

      html = conn |> get(~p"/destinations/new-york") |> html_response(200)

      assert html =~ @widget
    end

    test "a New York county hub carries the widget", %{conn: conn} do
      ny_guide("Belmont", "Bronx")

      html = conn |> get(~p"/destinations/new-york/bronx") |> html_response(200)

      assert html =~ @widget
    end

    test "the Connecticut state hub carries neither", %{conn: conn} do
      ct_guide("Woodbury")

      html = conn |> get(~p"/destinations/connecticut") |> html_response(200)

      refute html =~ @script_src
      refute html =~ @widget
    end

    # A town hub serving guides from two states is half a New York page.
    test "a mixed-state town hub carries neither", %{conn: conn} do
      published_guide_fixture(%{
        "title" => "Madison",
        "destination" => "Madison, New York",
        "state" => "New York",
        "county" => "Brooklyn"
      })

      published_guide_fixture(%{
        "title" => "Madison",
        "destination" => "Madison, Connecticut",
        "state" => "Connecticut",
        "county" => "New Haven County"
      })

      html = conn |> get(~p"/destinations/madison") |> html_response(200)

      refute html =~ @widget
    end
  end

  describe "the unit appears once" do
    test "a New York guide page renders exactly one widget div", %{conn: conn} do
      g = ny_guide("Belmont", "Bronx")
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      count = html |> String.split(@widget) |> length() |> Kernel.-(1)
      assert count == 1, "expected exactly one widget div, got #{count}"
    end

    # async and defer are what keep this tag from blocking render. A tag
    # missing them renders identically in a test and badly in a browser, so
    # they are asserted on the tag itself rather than on the page.
    test "the script tag carries async and defer so it never blocks render", %{conn: conn} do
      g = ny_guide("Belmont", "Bronx")
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      tag =
        Regex.run(~r{<script[^>]*#{Regex.escape(@script_src)}[^>]*>}, html)
        |> case do
          [tag] -> tag
          nil -> flunk("no script tag matched #{@script_src}")
        end

      assert tag =~ "async"
      assert tag =~ "defer"
    end
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `mix test test/ethos_web/affiliate_placement_test.exs`

Expected: FAIL. The New York assertions fail because no widget renders yet; the `refute html =~ @amber` fails because the amber aside is still unconditional.

- [ ] **Step 3: Write the component module**

Create `lib/ethos_web/components/affiliate.ex`:

```elixir
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
```

- [ ] **Step 4: Wire the head**

In `lib/ethos_web/components/layouts/root.html.heex`, immediately after the closing `</script>` of the AdSense block (which ends at line 18) and before `<.live_title ...>`:

```heex
    <EthosWeb.Affiliate.affiliate_head locale={EthosWeb.Affiliate.locale_from_assigns(assigns)} />
```

- [ ] **Step 5: Wire the unit**

Rewrite `lib/ethos_web/components/layouts/app.html.heex` in full:

```heex
<EthosWeb.Layouts.site_header current_user={@current_user} />
<main class="px-4 py-20 sm:px-6 lg:px-8">
  <div class="mx-auto max-w-2xl">
    <.flash_group flash={@flash} />
    {@inner_content}
    <EthosWeb.Affiliate.affiliate_unit locale={EthosWeb.Affiliate.locale_from_assigns(assigns)} />
  </div>
</main>
```

- [ ] **Step 6: Make the amber aside conditional**

In `lib/ethos_web/controllers/guide_html/show.html.heex`, line 35 currently reads:

```heex
  <aside class="mt-8 flex flex-wrap items-center justify-between gap-4 rounded-xl border border-amber-200 bg-amber-50 p-5">
```

Change it to:

```heex
  <%!-- The generic GetYourGuide CTA is the FALLBACK. A page whose geography
        resolves to a configured affiliate locale gets the widget from the app
        layout instead — one unit per page, below the content. This condition
        is the locale's presence, not a hardcoded state check, so Rome's aside
        becomes Rome's widget the day a Rome entry lands in the registry, with
        no edit here. --%>
  <aside
    :if={is_nil(EthosWeb.Affiliate.locale_from_assigns(assigns))}
    class="mt-8 flex flex-wrap items-center justify-between gap-4 rounded-xl border border-amber-200 bg-amber-50 p-5"
  >
```

- [ ] **Step 7: Run the test to verify it passes**

Run: `mix test test/ethos_web/affiliate_placement_test.exs`

Expected: PASS, 11 tests, 0 failures.

If the async/defer regex does not match — Phoenix may render boolean attributes in an order the pattern does not anticipate — adjust the pattern to find the tag, but **do not delete the assertion and do not weaken it to search the whole page**. Searching the page for `"async"` would pass on the AdSense tag, which is unconditional, and prove nothing about this one.

- [ ] **Step 8: Run the full suite and the formatter**

Run: `mix format && mix test`

Expected: 0 failures. Watch specifically for breakage in `guide_controller_test.exs`, `guide_seo_test.exs`, `hub_pages_test.exs`, `destination_controller_test.exs` and `place_controller_test.exs` — those exercise the templates you just changed. If any existing test asserts on the amber CTA's presence for a page that now resolves to a locale, that test is now wrong and must be updated, not deleted; say which ones in your report.

- [ ] **Step 9: Commit**

```bash
git add lib/ethos_web/components/affiliate.ex \
        lib/ethos_web/components/layouts/root.html.heex \
        lib/ethos_web/components/layouts/app.html.heex \
        lib/ethos_web/controllers/guide_html/show.html.heex \
        test/ethos_web/affiliate_placement_test.exs
git commit -m "Render affiliate tags from the layouts, keyed by page geography

Both tags live in the layouts rather than page templates: the script in
root.html.heex's head, the widget after {@inner_content} in app.html.heex.
Any page added later inherits both with no code change, which is the only
version of this that survives contact with future page types.

The amber CTA becomes the fallback — unchanged on every page without a
locale, suppressed on every page with one, so there is one affiliate unit
per page and it sits below the content."
```

---

### Task 3: Real-corpus guards

**Files:**
- Create: `test/ethos_web/affiliate_corpus_test.exs`

**Interfaces:**
- Consumes: `Ethos.Affiliates.unanimous_locale/1` and `EthosWeb.Affiliate.locale_from_assigns/1`.
- Produces: nothing consumed elsewhere.

**Context:** Task 2's tests use fixtures. Fixtures can drift from production — a fixture describing a two-state town hub keeps passing long after the real collision is fixed or changes shape. These tests read the **committed corpus**, so they cannot rot into cases that no longer match anything.

Two real cases exist:

1. **`/destinations/madison`** serves `priv/seed_data/brooklyn/madison.json` ("Madison, New York") and `priv/seed_data/connecticut/madison.json` ("Madison, Connecticut"). A live collision, recorded in `docs/content-defects.md`. Both files exist today; read them rather than hardcoding their states.
2. **The MLB ballparks collection** spans 30 states. Its member modules come from `Ethos.Seeds.Catalog.guide_modules("ballparks")`, and each module's `data()` returns a map carrying `:state`.

Code-defined guide data maps carry `state` but **not** `state_slug` — that is derived at changeset time. Derive it in the test with `Ethos.Guides.Guide.derive_destination_slug/1`.

- [ ] **Step 1: Write the test**

Create `test/ethos_web/affiliate_corpus_test.exs`:

```elixir
defmodule EthosWeb.AffiliateCorpusTest do
  @moduledoc """
  Guards that read the committed corpus rather than fixtures.

  A fixture describing a mixed-geography page keeps passing long after the real
  page changes shape. These read the real seed files and the real collection,
  so they fail when production changes and cannot drift quietly.
  """
  use ExUnit.Case, async: true

  alias Ethos.Affiliates
  alias Ethos.Guides.Guide
  alias Ethos.Seeds.Catalog
  alias Ethos.Seeds.DataGuide

  defp row_from_seed_file(path) do
    g = DataGuide.load!(path)["guide"]

    %{
      state_slug: Guide.derive_destination_slug(g["state"]),
      county: g["county"]
    }
  end

  defp row_from_module(mod) do
    d = mod.data()

    %{
      state_slug: Guide.derive_destination_slug(d.state),
      county: Map.get(d, :county)
    }
  end

  test "the real /destinations/madison guide set resolves to no locale" do
    rows =
      for path <- ["priv/seed_data/brooklyn/madison.json", "priv/seed_data/connecticut/madison.json"],
          do: row_from_seed_file(path)

    # Non-vacuity: if either file is ever renamed or its state changed, this
    # stops describing a real collision and the refute below becomes empty
    # ceremony. Assert the premise before asserting the conclusion.
    assert length(rows) == 2
    assert rows |> Enum.map(& &1.state_slug) |> Enum.uniq() |> length() == 2,
           "the two madison seed files no longer describe two different states — " <>
             "this test's premise is gone, not its conclusion"

    refute Affiliates.unanimous_locale(rows),
           "a page serving Madison, New York and Madison, Connecticut resolved to a locale"
  end

  test "the real MLB ballparks collection resolves to no locale" do
    rows = Enum.map(Catalog.guide_modules("ballparks"), &row_from_module/1)

    assert length(rows) >= 30, "expected the full ballpark set, got #{length(rows)}"

    assert rows |> Enum.map(& &1.state_slug) |> Enum.uniq() |> length() > 1,
           "the ballpark guides no longer span multiple states — premise gone"

    refute Affiliates.unanimous_locale(rows),
           "a collection spanning 30 states resolved to a locale"
  end

  test "locale_from_assigns returns nil for assigns carrying no geography" do
    refute EthosWeb.Affiliate.locale_from_assigns(%{})
    refute EthosWeb.Affiliate.locale_from_assigns(%{flash: %{}, current_user: nil})
    refute EthosWeb.Affiliate.locale_from_assigns(%{guides: []})
    refute EthosWeb.Affiliate.locale_from_assigns(%{guides: "not a list"})
  end
end
```

- [ ] **Step 2: Run the test**

Run: `mix test test/ethos_web/affiliate_corpus_test.exs`

Expected: PASS, 3 tests.

`Ethos.Seeds.Catalog.guide_modules/1` exists and takes a region string — verified at `lib/ethos/seeds/catalog.ex:126`. Confirm `"ballparks"` is the region string those modules are registered under by reading the `@guide_modules` list above it; if the region is spelled differently, use the actual spelling and say so in your report.

If `row_from_module/1` raises because a ballpark guide's `data()` has no `:county` key, `Map.get(d, :county)` already returns `nil` — a `nil` county with a non-New-York state still resolves to `nil`, so the test holds. Do not add a county to any seed module to make this pass.

- [ ] **Step 3: Add the no-double-widget corpus walk**

Append to the same file:

```elixir
  # The future mistake this catches: someone adds <.affiliate_unit> to a page
  # template, not realising it already comes from the app layout, and the page
  # ships with two. Two units render fine and look like an ad farm.
  test "no page template contains the widget markup — it comes from the layout only" do
    offenders =
      "lib/ethos_web/**/*.heex"
      |> Path.wildcard()
      |> Enum.reject(&(Path.basename(&1) == "app.html.heex"))
      |> Enum.filter(fn f -> File.read!(f) =~ "affiliate_unit" end)

    assert offenders == [],
           "these templates render the affiliate unit, which the app layout already " <>
             "renders on every page — the result is two widgets: #{inspect(offenders)}"
  end
```

- [ ] **Step 4: Run the test to verify it passes**

Run: `mix test test/ethos_web/affiliate_corpus_test.exs`

Expected: PASS, 4 tests.

- [ ] **Step 5: Prove the walk can fail**

Temporarily add `<EthosWeb.Affiliate.affiliate_unit locale={nil} />` to the bottom of `lib/ethos_web/controllers/place_html/show.html.heex` and re-run:

Run: `mix test test/ethos_web/affiliate_corpus_test.exs`

Expected: the no-double-widget test FAILS and names that file. **Remove the line and re-run to confirm green.** Report the result — a walk that has never failed is a walk nobody has checked.

- [ ] **Step 6: Run the full suite and the formatter**

Run: `mix format --check-formatted && mix test`

Expected: 0 failures.

- [ ] **Step 7: Commit**

```bash
git add test/ethos_web/affiliate_corpus_test.exs
git commit -m "Guard affiliate placement against the real corpus, not fixtures

Reads the two committed madison seed files and the real 30-state ballpark
collection, each with a non-vacuity assertion on its own premise so the
test fails loudly if the case it describes stops existing rather than
passing as empty ceremony.

Plus a walk asserting no page template renders the unit, since the app
layout already does — the failure that produces two widgets on one page
renders fine and looks like an ad farm."
```

---

## Self-Review

**1. Spec coverage.**

| Spec section | Task |
|---|---|
| Both tags live in the layouts | 2 (Steps 4, 5) |
| Resolver clause order and shapes | 2 (Step 3) |
| Unanimity, `shadowed` excluded | 2 (Step 3), 3 (Steps 1, 3) |
| The `/destinations/madison` case | 2 (fixture), 3 (real corpus) |
| MLB collection excluded | 3 (Step 1) |
| The registry, `counties` guard, nil-county exception | 1 (Steps 3, 4) |
| The two components | 2 (Step 3) |
| Amber CTA becomes fallback, suppressed with a locale | 2 (Step 6) |
| Per-entry `booking_url` untouched | no task — correctly, nothing changes |
| Upstate resolves to nil | 1 (Step 1 + the Step 6 mutation check), 2 (Rhinebeck) |
| No page renders two widgets | 3 (Step 3) |
| Exact-string assertions on all four tag values | 2 (Step 1) |
| Script carries async/defer | 2 (Step 1) |
| Home page opts out via `layout: false` | 2 (moduledoc) — behaviour is inherited, no code |

No gaps.

**2. Placeholder scan.** No TBD/TODO. Three steps direct the implementer to verify a name against source before using it (`Catalog.guide_modules/1` in Task 3 Step 2; the existing-test breakage sweep in Task 2 Step 8; the async/defer assertion's shape in Task 2 Step 7) — these are verification instructions with the exact command and a stated fallback, not placeholders.

**3. Type consistency.** `locale_for/2` takes `(state_slug, county)` in that order at every call site — Task 2 Step 3 passes `guide.state_slug, guide.county` and `place.state_slug, place.county`, matching Task 1's definition. `unanimous_locale/1` takes a list of anything carrying `:state_slug` and `:county`; Task 3 passes plain maps with exactly those two keys, which works because the implementation uses `&1.state_slug` map access rather than a struct match. `affiliate_head/1` and `affiliate_unit/1` are named identically in Task 2 Steps 3, 4, 5 and in Task 3's walk.

**Two things I corrected while reviewing:**

- Task 2's async/defer test as first drafted built an unused binding through a `then/2` that discarded its input — dead code handed to an implementer as if it were a specification. Rewritten to extract the tag with a single regex, with `flunk/1` on no match so a missing tag fails loudly rather than raising a `MatchError` that reads like a test bug. The Step 7 note now also forbids the tempting weakening: searching the whole page for `"async"` would pass on the unconditional AdSense tag and prove nothing.
- Task 3 Step 2 hedged on whether `Catalog.guide_modules/1` exists. It does, at `catalog.ex:126`. Verified and stated; only the region string still needs confirming.

**Names verified against source before committing this plan:** `Ethos.Seeds.Catalog.guide_modules/1` (`catalog.ex:126`), `Ethos.Seeds.DataGuide.load!/1` (`data_guide.ex:56`), `Ethos.Guides.Guide.derive_destination_slug/1` (`guide.ex:74`), `Ethos.Places.upsert_place!/1`, `published_guide_fixture/1` (`guides_fixtures.ex:26`), and both madison seed files.
