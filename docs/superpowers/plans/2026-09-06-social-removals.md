# Social Layer, Plan 4a: Removals Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Take guide authoring away from regular users and switch every affiliate link off behind a flag, without breaking either the machinery or the pages they live on.

**Architecture:** One `Affiliate.enabled?/0` predicate that all four affiliate surfaces consult independently, defaulting off everywhere except the test environment — where it stays on so the existing suite keeps proving the machinery works for the day it is switched back. Guide authoring routes move behind the admin plug that already exists; no code is deleted.

**Tech Stack:** Elixir, Phoenix 1.7, Phoenix LiveView, ExUnit.

**Spec:** `docs/superpowers/specs/2026-09-05-social-layer-design.md` (section "Removals")

**Predecessor:** Plans 1, 2, 3a and 3b, all merged to `main`.

**Scope note:** this is Plan 4**a**. Plan 4b is the seasonal design system, which is independent of this and touches many of the same templates — which is why the removals go first.

## Global Constraints

- **The affiliate flag defaults to `false`.** No affiliate surface renders in dev or production until someone turns it on.
- **In `:test` the flag defaults to `true`**, so the existing affiliate suite keeps covering the machinery. The off-state gets its own tests that flip it explicitly.
- **A module that overrides global affiliate config must be `async: false`.** This is an established convention in this codebase — see the comments at `test/ethos_web/affiliate_placement_test.exs:598-603` and `:664-670`, which do exactly this for `:affiliate_locales`. Global config plus async is a race.
- **The four affiliate surfaces are:** the GetYourGuide `<script>` in `root.html.heex`, the widget unit in `app.html.heex`, the amber "Planning your own trip?" CTA on the guide page, and per-entry `booking_url` links on the guide page.
- **`EthosWeb.HouseAd` is NOT an affiliate surface** and must keep working. House ads are Ethos promoting its own guides; the spec asks to hide affiliate links, not self-promotion.
- **Google AdSense in `root.html.heex` is out of scope.** It is display advertising, not an affiliate link. Removing it is a one-line change if wanted, but it is not what was asked for.
- Guide authoring is **hidden, not deleted.** Routes move behind `require_admin_user`; the LiveViews, the AI agents and the import pipeline all stay working for the admin.
- `entry.booking_url` stays in the schema and in the admin guide editor. Hiding the public link is a display decision; discarding stored data is not.
- Run `mix format` **scoped to the files you touched**. Never bare `mix format`.
- **Prefix every test command with `MIX_TEST_PARTITION=_social`.** Three worktrees share one test database.
- **Every task must end with `mix test` at 0 failures.** Baseline entering this plan: **1197 tests, 0 failures**.
- Database runs in Docker on port 54329 (`docker compose up -d`).

## File Structure

**Created:**

| File | Responsibility |
|---|---|
| `test/ethos_web/affiliate_disabled_test.exs` | Proves all four surfaces go dark when the flag is off. `async: false`, because it overrides global config. |
| `test/ethos_web/guide_authoring_access_test.exs` | Proves authoring is admin-only and its entry points are gone for everyone else. `async: false`, because it uses `admin_fixture/1`. |

**Modified:** `config/config.exs`, `config/test.exs`, `lib/ethos_web/components/affiliate.ex`, `lib/ethos_web/controllers/guide_html/show.html.heex`, `lib/ethos_web/router.ex`, `lib/ethos_web/components/layouts.ex`, `lib/ethos_web/controllers/page_html/home.html.heex`.

---

### Task 1: The affiliate kill switch

**Files:**
- Modify: `config/config.exs`, `config/test.exs`
- Modify: `lib/ethos_web/components/affiliate.ex`
- Modify: `lib/ethos_web/controllers/guide_html/show.html.heex`
- Test: `test/ethos_web/affiliate_disabled_test.exs`

**Interfaces:**
- Consumes: nothing from earlier tasks.
- Produces: `EthosWeb.Affiliate.enabled?/0` → boolean, reading `Application.get_env(:ethos, :affiliate_links_enabled, false)`.

**There is a trap in this task and it is the whole reason it is written out in detail.**

The amber "Planning your own trip?" CTA on the guide page renders when
`not EthosWeb.Affiliate.unit_renders?(assigns) and is_nil(EthosWeb.HouseAd.for_page(assigns))`.
It is the *fallback* for pages where GetYourGuide has no campaign.

So making `unit_renders?/1` return `false` as the kill switch would turn that sponsored
CTA **on** across every guide page without a house ad — strictly more affiliate content
than today, from a change meant to remove it. The flag must be a separate predicate that
each surface consults, and the CTA must consult it too.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/affiliate_disabled_test.exs`:

```elixir
defmodule EthosWeb.AffiliateDisabledTest do
  @moduledoc """
  Every affiliate surface goes dark when the flag is off.

  `async: false` because it overrides `:ethos, :affiliate_links_enabled`, which
  is global — the same reason `AffiliateUnsupportedNetworkTest` in
  `affiliate_placement_test.exs` is sync. Global config plus async is a race.

  The test environment defaults this flag ON so the existing affiliate suite
  keeps proving the machinery works. This file is the other half: proof that
  turning it off actually removes everything.
  """
  use EthosWeb.ConnCase, async: false

  import Ethos.GuidesFixtures

  setup do
    previous = Application.get_env(:ethos, :affiliate_links_enabled)
    Application.put_env(:ethos, :affiliate_links_enabled, false)

    on_exit(fn -> Application.put_env(:ethos, :affiliate_links_enabled, previous) end)

    # A New York guide is the case that WOULD render a widget when enabled —
    # testing a geography with no campaign would pass vacuously.
    guide =
      published_guide_fixture(%{
        title: "Affiliate off",
        destination: "Manhattan, New York",
        state: "New York",
        state_slug: "new-york",
        county: "New York County"
      })

    %{guide: guide}
  end

  test "the partner script is absent from the page head", %{conn: conn, guide: guide} do
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    refute html =~ "widget.getyourguide.com"
  end

  test "the widget unit is absent", %{conn: conn, guide: guide} do
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    refute html =~ "data-gyg-widget"
  end

  test "the fallback CTA does not appear in the widget's place", %{conn: conn, guide: guide} do
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    # This is the trap: the CTA renders when no widget renders, so a naive
    # kill switch turns it ON. It must be off too.
    refute html =~ "Planning your own trip?"
    refute html =~ "getyourguide.com/?partner_id"
  end

  test "per-entry booking links are absent", %{conn: conn, guide: guide} do
    {:ok, _entry} =
      Ethos.Guides.create_entry(
        guide,
        %{
          kind: "tip",
          name: "Bookable thing",
          note: "Has a booking link.",
          booking_url: "https://example.com/book"
        },
        :privileged
      )

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    refute html =~ "https://example.com/book"
  end

  test "enabled? reports the flag", _ do
    refute EthosWeb.Affiliate.enabled?()

    Application.put_env(:ethos, :affiliate_links_enabled, true)
    assert EthosWeb.Affiliate.enabled?()
  end

  test "the house ad still works with affiliates off", %{conn: conn, guide: guide} do
    # House ads are Ethos promoting its own guides, not an affiliate link.
    # Turning affiliates off must not take them with it.
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html_response_ok?(html)
  end

  defp html_response_ok?(html), do: is_binary(html) and html =~ "Affiliate off"
end
```

If `Ethos.Guides.create_entry/3`'s signature differs, read the function and adjust
the call — the point of that test is a rendered `booking_url`, not the fixture shape.

- [ ] **Step 2: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/affiliate_disabled_test.exs`
Expected: FAIL — `EthosWeb.Affiliate.enabled?/0` is undefined, and the surfaces still render.

- [ ] **Step 3: Add the config**

In `config/config.exs`, near the other `:ethos` settings:

```elixir
# Affiliate links are off by default, everywhere. The machinery stays in the
# codebase and keeps its test coverage; this is the switch that decides
# whether any of it reaches a visitor.
config :ethos, :affiliate_links_enabled, false
```

In `config/test.exs`:

```elixir
# On in test so the existing affiliate suite keeps proving the machinery works
# for the day it is switched back on. `affiliate_disabled_test.exs` is the
# other half — it flips this off and asserts everything disappears.
config :ethos, :affiliate_links_enabled, true
```

- [ ] **Step 4: Add the predicate and gate the components**

In `lib/ethos_web/components/affiliate.ex`, add near `renders?/1`:

```elixir
  @doc """
  Whether affiliate links reach visitors at all.

  Separate from `renders?/1` on purpose. `renders?/1` answers "does this
  locale have a campaign we can show", and the guide page's fallback CTA
  renders precisely when it says no. Overloading it as the kill switch would
  therefore turn that sponsored CTA ON across every page without a house ad —
  more affiliate content from a change meant to remove it. This predicate is
  the master switch and every surface checks it independently.
  """
  def enabled?, do: Application.get_env(:ethos, :affiliate_links_enabled, false)
```

Then make both components respect it. In `affiliate_head/1`, change the script's
condition from `:if={renders?(@locale)}` to `:if={enabled?() and renders?(@locale)}`.

In `affiliate_unit/1`, change the wrapper's condition from
`:if={render_here?(@locale, @position)}` to
`:if={enabled?() and render_here?(@locale, @position)}`.

Leave `renders?/1`, `unit_renders?/1`, `placement/1` and `locale_from_assigns/1` exactly
as they are — other code and tests depend on them answering their own question.

- [ ] **Step 5: Gate the two guide-page surfaces**

In `lib/ethos_web/controllers/guide_html/show.html.heex`:

The amber aside's condition becomes a three-part check — the flag must be on, no widget
renders, and no house ad is showing:

```heex
  <aside
    :if={
      EthosWeb.Affiliate.enabled?() and
        not EthosWeb.Affiliate.unit_renders?(assigns) and
        is_nil(EthosWeb.HouseAd.for_page(assigns))
    }
```

Keep the existing explanatory comment above it and add a sentence noting the flag is now
the first clause and why.

The per-entry booking link's condition becomes:

```heex
        :if={EthosWeb.Affiliate.enabled?() and EthosWeb.Url.safe_http?(entry.booking_url)}
```

There is also a disclosure paragraph further down whose condition mentions
`booking_url` — read it and gate it on `enabled?()` too, so a page with affiliates off
does not carry a commission disclosure for links it is not showing.

- [ ] **Step 6: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/affiliate_disabled_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: both pass, 0 failures. The four existing affiliate test files must pass
**unchanged** — they run with the flag on by default in test. If one fails, the gating
went somewhere it should not have.

- [ ] **Step 7: Commit**

```bash
mix format config/config.exs config/test.exs lib/ethos_web/components/affiliate.ex lib/ethos_web/controllers/guide_html/show.html.heex test/ethos_web/affiliate_disabled_test.exs
git add config/config.exs config/test.exs lib/ethos_web/components/affiliate.ex lib/ethos_web/controllers/guide_html/show.html.heex test/ethos_web/affiliate_disabled_test.exs
git commit -m "feat: affiliate links behind a default-off flag"
```

---

### Task 2: Guide authoring becomes admin-only

**Files:**
- Modify: `lib/ethos_web/router.ex`
- Modify: `lib/ethos_web/components/layouts.ex`
- Test: `test/ethos_web/guide_authoring_access_test.exs`

**Interfaces:**
- Consumes: `EthosWeb.UserAuth.require_admin_user/2` and the `:ensure_admin` on_mount, both of which exist.
- Produces: nothing later tasks rely on.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/guide_authoring_access_test.exs`:

```elixir
defmodule EthosWeb.GuideAuthoringAccessTest do
  @moduledoc """
  Guide authoring is the admin's tool now.

  Nothing is deleted — the LiveViews, the AI agents and the import pipeline all
  still work — but a regular user has no door to them and no sign one exists.

  `async: false` because `admin_fixture/1` inserts the configured admin email.
  """
  use EthosWeb.ConnCase, async: false

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  @authoring_paths ["/guides", "/guides/new"]

  describe "a regular logged-in user" do
    setup %{conn: conn} do
      %{conn: log_in_user(conn, user_fixture(%{email: "regular@example.com"}))}
    end

    test "gets a 404 from every authoring path", %{conn: conn} do
      for path <- @authoring_paths do
        assert conn |> get(path) |> html_response(404),
               "expected 404 from #{path}"
      end
    end

    test "gets a 404 from the per-guide authoring paths", %{conn: conn} do
      guide = guide_fixture()

      for path <- ["/guides/#{guide.id}/edit", "/guides/#{guide.id}/share"] do
        assert conn |> get(path) |> html_response(404),
               "expected 404 from #{path}"
      end
    end

    test "sees no authoring links in the header", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      refute html =~ ~s(href="/guides")
      refute html =~ "Make a guide"
      refute html =~ "Your guides"
    end
  end

  describe "the admin" do
    setup %{conn: conn} do
      %{conn: log_in_user(conn, admin_fixture())}
    end

    test "can still reach the authoring paths", %{conn: conn} do
      for path <- @authoring_paths do
        assert conn |> get(path) |> html_response(200),
               "expected 200 from #{path}"
      end
    end

    test "still sees the authoring links", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      assert html =~ "Make a guide"
    end
  end

  test "a logged-out visitor is sent to log in, not 404ed", %{conn: conn} do
    # The authentication guard runs first, so a stranger gets the normal login
    # redirect rather than a 404 that would tell them the path exists.
    assert conn |> get("/guides/new") |> redirected_to() == ~p"/users/log_in"
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/guide_authoring_access_test.exs`
Expected: FAIL — a regular user currently gets 200 from the authoring paths.

- [ ] **Step 3: Move the routes**

In `lib/ethos_web/router.ex`, the seven authoring `live` routes and the research `post`
currently sit in the `:require_authenticated_user` scope. Move them into a scope that also
pipes through `:require_admin_user`, keeping the `live_session` on_mount list consistent
with the `/admin` scope — which uses both `:ensure_authenticated` and `:ensure_admin`.

**Do not move `live "/g/:slug/suggest", SuggestLive, :new`.** Suggesting a place is
contribution, not authoring, and it stays open to every logged-in user — it feeds the
admin's suggestion queue.

The eight paths that move are:

```
/guides
/guides/new
/guides/:id/import
/guides/:id/confirm
/guides/:id/edit
/guides/:id/share
/guides/:id/suggestions
POST /g/:slug/entries/:entry_id/research
```

Give the new scope's `live_session` a distinct name — `live_session` names must be unique
across the router, and `:admin` is taken.

- [ ] **Step 4: Hide the entry points**

In `lib/ethos_web/components/layouts.ex`, `site_header/1` renders "Your guides" and a
"Make a guide" CTA. Gate both on `Ethos.Accounts.admin?(@current_user)`, the same predicate
the Admin link already uses a few lines above.

Two details that are easy to get wrong here:

- "Your guides" sits **inside** the `<%= if @current_user do %>` block, but the
  "Make a guide" button sits **outside** it — it currently renders for logged-out
  visitors too. Add a `:if` to that button where it stands; do not move it inside
  the `@current_user` block, which would change nothing for the logged-out case
  that the test covers.
- `@current_user` is `nil` for a visitor and `Ethos.Accounts.admin?/1` already
  returns `false` for `nil`, so one predicate covers both cases.

- [ ] **Step 5: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/guide_authoring_access_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: both pass, 0 failures. Existing authoring tests — `guide_authoring_test.exs`,
`guide_confirm_edit_test.exs`, `guide_share_test.exs`, `guide_seo_edit_test.exs`,
`suggestions_flow_test.exs` — drive those routes as a regular user and will now 404.
**Update them to log in as the admin, not to weaken what they assert.** Read each failure
before changing it; a test that starts passing for a different reason is worse than one
that fails.

- [ ] **Step 6: Commit**

```bash
mix format lib/ethos_web/router.ex lib/ethos_web/components/layouts.ex test/ethos_web/guide_authoring_access_test.exs
git add -A
git commit -m "feat: guide authoring is admin-only"
```

---

### Task 3: The home page stops advertising a feature nobody can use

**Files:**
- Modify: `lib/ethos_web/controllers/page_html/home.html.heex`
- Test: `test/ethos_web/controllers/page_controller_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces: nothing.

The home page currently opens *"Turn your trip into a guide worth sharing"* and explains
that pasting your notes produces a guide, above a "Make your guide" button. After Task 2 a
visitor cannot do any of that. Leaving the copy would be advertising a door that 404s.

**A judgment call, flagged rather than hidden:** the wording below is a minimal honest
rewrite describing what the site now is — guides to read, rate and discuss. It is not a
marketing pass. If different words are wanted, this is the place to change them, and the
rest of the plan does not depend on them.

- [ ] **Step 1: Write the failing test**

Append to `test/ethos_web/controllers/page_controller_test.exs`, inside the existing
`describe` block for the home page (read the file to find it):

```elixir
    test "does not invite a visitor to make a guide", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      refute html =~ "Make your guide"
      refute html =~ "Paste your notes"
    end

    test "points visitors at the destinations instead", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      # Assert on the hero button's text, NOT on `href="/destinations"` — the
      # site header renders that link on every page, so the href assertion
      # would pass even if the hero button were deleted entirely.
      assert html =~ "Browse destinations"
    end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/controllers/page_controller_test.exs`
Expected: FAIL — the hero still says "Make your guide".

- [ ] **Step 3: Rewrite the hero**

In `lib/ethos_web/controllers/page_html/home.html.heex`, replace the headline, the
paragraph and the primary button:

```heex
  <h1 class="text-4xl sm:text-5xl font-bold">Places worth the trip, and what people made of them</h1>
  <p class="mt-4 text-lg text-zinc-600">
    Guides to towns, neighbourhoods and the places inside them — written up properly, then
    rated and argued over by the people who went.
  </p>
  <div class="mt-8 flex justify-center gap-4">
    <.link
      navigate={~p"/destinations"}
      class="rounded-md bg-zinc-900 px-6 py-3 text-white font-medium"
    >
      Browse destinations
    </.link>
```

Leave the "See an example" link, the featured-guide card and the latest-guides list exactly
as they are.

- [ ] **Step 4: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/controllers/page_controller_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: both pass, 0 failures.

- [ ] **Step 5: Commit**

```bash
mix format lib/ethos_web/controllers/page_html/home.html.heex test/ethos_web/controllers/page_controller_test.exs
git add lib/ethos_web/controllers/page_html/home.html.heex test/ethos_web/controllers/page_controller_test.exs
git commit -m "feat: home page describes what the site is now"
```

---

## Done when

- `MIX_TEST_PARTITION=_social mix test` is green, with no reduction from the 1197-test baseline.
- With the flag off, a New York guide page carries no partner script, no widget, no amber CTA and no per-entry booking link — and still carries its house ad.
- With the flag on, everything renders exactly as it does today, proven by the four existing affiliate test files passing unchanged.
- A regular logged-in user gets a 404 from every authoring path and sees no authoring link anywhere; the admin still has all of it; a logged-out visitor still gets the login redirect rather than a 404.
- `/g/:slug/suggest` is still open to every logged-in user.
- The home page no longer invites anyone to make a guide.

## Notes for Plan 4b

Plan 4b is the seasonal design system — semantic CSS variable tokens, a Tailwind mapping,
`Ethos.Seasons` with an admin override, self-hosted Fraunces for headings, and migrating
templates off hardcoded `zinc`/`amber` utilities.

- Today is **2026-09-06**. The spec's boundaries put autumn at **September 22**, sixteen
  days out, so summer is the palette that ships and autumn is the one that must be right
  before it arrives on its own.
- This plan touches `home.html.heex`, `layouts.ex` and `guide_html/show.html.heex` — three
  of the templates 4b will migrate. Doing removals first is deliberate: 4b should not be
  re-theming markup that is about to be deleted.
- `EthosWeb.HouseAd` renders an ad-shaped unit on most pages and carries its own colours.
  It will need tokens too, and it is not in the spec's list.
