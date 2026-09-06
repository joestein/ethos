# Social Layer, Plan 4b: Seasonal Design System

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Give the site one palette it can change by season, and stop it looking blank and generic.

**Architecture:** Semantic CSS custom properties, one `:root[data-season="…"]` block per season, mapped to Tailwind utilities so templates say `bg-surface` and `text-ink` rather than `bg-white` and `text-zinc-900`. A pure `Ethos.Seasons` resolves a date to a season; a `site_settings` row lets the admin override it; a plug assigns it and the root layout stamps `data-season` on `<html>`. Re-skinning is then one CSS block, not a sweep of every template.

**Tech Stack:** Elixir, Phoenix 1.7, Phoenix LiveView, Tailwind 3.4.3, Ecto + PostgreSQL, ExUnit.

**Spec:** `docs/superpowers/specs/2026-09-05-social-layer-design.md`, section "Seasonal design system"

**Predecessor:** Plans 1, 2, 3a, 3b and 4a, all merged to `main`.

## Global Constraints

- **The token palettes are copied verbatim from the spec's table.** They are RGB triples, space-separated, no `rgb()` wrapper — `--c-surface: 255 253 247`. The `<alpha-value>` mapping in Tailwind depends on that exact shape, and it is what makes `bg-accent/10` keep working.
- **Season boundaries, from the spec:** spring Mar 20 – May 31, summer Jun 1 – Sep 21, autumn Sep 22 – Nov 30, winter Dec 1 – Mar 19. Today is **2026-09-06**, which is summer; the site turns autumn on **September 22**, sixteen days out. Autumn must be right before it arrives on its own.
- **`Ethos.Foliage` already has a different season and must not be touched.** `lib/ethos/foliage.ex:37-38` defines `@season_start {9, 1}` / `@season_end {11, 30}` — a foliage-viewing window, starting three weeks before the site's autumn. These are different concepts: one is when Connecticut's leaves turn, the other is what colour the site is. Do not unify them, do not "fix" the discrepancy, and do not have either call the other.
- **`positive`, `negative` and `accent-ink` are constant across all four seasons.** A thumbs-down must not read as seasonal decoration.
- **The root layout renders for error pages too.** `EthosWeb.UserAuth.require_admin_user/2` *renders* a 404 through this layout rather than raising, and Plan 4a put eight routes behind it. A root layout that assumes `@season` will crash every admin 404. Read the season with `assigns[:season] || "summer"`, never `@season`.
- Run `mix format` **scoped to the files you touched**. Never bare `mix format` — five other worktrees are active and it reformats their files.
- **Prefix every test command with `MIX_TEST_PARTITION=_social`.** Six worktrees share one Postgres database.
- **Never use `git stash` or `git stash pop`.** The stash stack is shared across all worktrees; a conflicted pop reapplies another session's work. Revert experiments with `git checkout <ref> -- <path>`.
- **Every task ends with `MIX_TEST_PARTITION=_social mix test` at 0 failures.** Baseline entering this plan: **1354 tests, 0 failures, 4 excluded**.
- Database runs in Docker on port 54329 (`docker compose up -d`).
- **Assets must actually build.** After any change to `assets/`, run `mix assets.build` (a real alias in `mix.exs:83`, `tailwind ethos` + `esbuild ethos`) and confirm it exits 0. A Tailwind config error does not fail the test suite — it fails silently at request time and every new utility renders as nothing.

## Scope

**In scope:** the token system, season resolution and override, the type treatment, and the surfaces that make the site feel designed — `core_components.ex`, the layouts and header, the home hero, cards, the social island, and the main public templates.

**Deliberately out of scope:** the 42 hardcoded colour occurrences across 13 admin and authoring templates (`admin/comments_live.ex`, `guide_live/*`, `user_settings_live.ex`, and the rest). They are admin-only surfaces, invisible to visitors, and after Plan 4a most are admin-only by access too. Migrating them is mechanical and can follow later. **Say so in the final report rather than leaving it implied** — a plan that quietly stops short reads as one that finished.

**Why the order is what it is:** `core_components.ex` alone carries 36 of the 167 public occurrences and is the shared component library, so migrating it re-skins the whole site in one file. It comes before the page templates for that reason.

## File Structure

**Created:**

| File | Responsibility |
|---|---|
| `lib/ethos/seasons.ex` | Pure date → season. No database, no config, no `Date.utc_today()` inside the core function. |
| `lib/ethos/site_settings.ex` | The settings context: read and write the season override. |
| `lib/ethos/site_settings/site_setting.ex` | The schema — a single-row key/value store. |
| `priv/repo/migrations/20260908120000_create_site_settings.exs` | The table. |
| `lib/ethos_web/plugs/put_season.ex` | Assigns the active season onto the conn. |
| `lib/ethos_web/controllers/admin_season_controller.ex` | The admin selector: Auto, Spring, Summer, Autumn, Winter. |
| `lib/ethos_web/controllers/admin_season_html.ex` + `admin_season_html/index.html.heex` | The selector's markup. |
| `priv/static/fonts/` | Self-hosted Fraunces `woff2`. |
| `test/ethos/seasons_test.exs`, `test/ethos/site_settings_test.exs`, `test/ethos_web/plugs/put_season_test.exs`, `test/ethos_web/season_stamp_test.exs`, `test/ethos_web/admin_season_test.exs` | Coverage for each. |

**Modified:** `assets/css/app.css`, `assets/tailwind.config.js`, `lib/ethos_web/router.ex`, `lib/ethos_web/components/layouts/root.html.heex`, `lib/ethos_web/components/layouts.ex`, `lib/ethos_web/components/core_components.ex`, `lib/ethos_web/components/admin_nav.ex`, `lib/ethos_web/controllers/page_html/home.html.heex`, `lib/ethos_web/live/social_live.ex`, and the public page templates named in Task 8.

---

### Task 1: The tokens and their Tailwind mapping

**Files:**
- Modify: `assets/css/app.css`
- Modify: `assets/tailwind.config.js`
- Test: `test/ethos_web/season_tokens_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces: the utility names `surface`, `surface-raised`, `ink`, `ink-muted`, `line`, `accent`, `accent-ink`, `accent-soft`, `positive`, `negative`, `star`, usable as `bg-*`, `text-*`, `border-*`.

This task changes no page. It only makes the vocabulary exist.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/season_tokens_test.exs`. This one asserts against the **built stylesheet**, because a Tailwind misconfiguration cannot fail a normal test — it fails silently at request time:

```elixir
defmodule EthosWeb.SeasonTokensTest do
  @moduledoc """
  The token layer, asserted against the built stylesheet.

  A broken Tailwind mapping does not raise: the utility simply never gets
  generated, and every element using it renders unstyled. So this reads
  priv/static/assets/app.css directly rather than trusting that the config
  parses.
  """
  use ExUnit.Case, async: true

  @css "priv/static/assets/app.css"

  setup_all do
    # The built stylesheet is a build artifact, so build it rather than
    # assuming a previous run left one behind.
    {_, 0} = System.cmd("mix", ["assets.build"], stderr_to_stdout: true)
    %{css: File.read!(@css)}
  end

  test "every season defines every token", %{css: css} do
    tokens =
      ~w(surface surface-raised ink ink-muted line accent accent-ink accent-soft
         positive negative star)

    for season <- ~w(summer autumn winter spring), token <- tokens do
      assert css =~ "--c-#{token}",
             "token --c-#{token} is missing entirely"

      assert css =~ ~s([data-season="#{season}"]),
             "season #{season} has no :root block"
    end
  end

  test "tokens are bare RGB triples, not rgb() calls", %{css: css} do
    # `<alpha-value>` interpolation only works on a bare triple. An
    # `rgb(...)` value here silently breaks every `bg-accent/10` in the app.
    assert css =~ ~r/--c-surface:\s*\d+\s+\d+\s+\d+/
    refute css =~ ~r/--c-surface:\s*rgb\(/
  end

  test "the utilities are actually generated", %{css: css} do
    # Tailwind only emits a utility it has seen used. These are referenced by
    # the safelist, so their absence means the colour mapping did not load.
    for utility <- ~w(bg-surface text-ink border-line bg-accent text-ink-muted) do
      assert css =~ ".#{utility}", "utility .#{utility} was never generated"
    end
  end

  test "alpha modifiers survive the mapping", %{css: css} do
    assert css =~ ".bg-accent\\/10", "bg-accent/10 was not generated"
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/season_tokens_test.exs`
Expected: FAIL — no tokens exist yet.

- [ ] **Step 3: Add the tokens**

In `assets/css/app.css`, after the three `@import` lines, add one block per season. Values are copied verbatim from the spec's table; `positive`, `negative` and `accent-ink` repeat unchanged in every block on purpose:

```css
/* Seasonal palettes. Bare RGB triples, not rgb() — Tailwind interpolates
   <alpha-value> into these, which is what keeps bg-accent/10 working.

   positive, negative and accent-ink are deliberately identical in all four
   seasons: a thumbs-down is a judgement, not seasonal decoration. */
:root,
:root[data-season="summer"] {
  --c-surface: 255 253 247;
  --c-surface-raised: 255 255 255;
  --c-ink: 28 25 23;
  --c-ink-muted: 120 113 108;
  --c-line: 231 229 228;
  --c-accent: 13 148 136;
  --c-accent-ink: 255 255 255;
  --c-accent-soft: 204 251 241;
  --c-positive: 5 150 105;
  --c-negative: 220 38 38;
  --c-star: 245 158 11;
}

:root[data-season="autumn"] {
  --c-surface: 255 251 245;
  --c-surface-raised: 255 255 255;
  --c-ink: 28 25 23;
  --c-ink-muted: 120 113 108;
  --c-line: 232 226 218;
  --c-accent: 194 65 12;
  --c-accent-ink: 255 255 255;
  --c-accent-soft: 255 237 213;
  --c-positive: 5 150 105;
  --c-negative: 220 38 38;
  --c-star: 217 119 6;
}

:root[data-season="winter"] {
  --c-surface: 248 250 252;
  --c-surface-raised: 255 255 255;
  --c-ink: 15 23 42;
  --c-ink-muted: 100 116 139;
  --c-line: 226 232 240;
  --c-accent: 3 105 161;
  --c-accent-ink: 255 255 255;
  --c-accent-soft: 224 242 254;
  --c-positive: 5 150 105;
  --c-negative: 220 38 38;
  --c-star: 56 189 248;
}

:root[data-season="spring"] {
  --c-surface: 253 253 248;
  --c-surface-raised: 255 255 255;
  --c-ink: 26 46 5;
  --c-ink-muted: 101 118 84;
  --c-line: 228 230 220;
  --c-accent: 77 124 15;
  --c-accent-ink: 255 255 255;
  --c-accent-soft: 236 252 203;
  --c-positive: 5 150 105;
  --c-negative: 220 38 38;
  --c-star: 132 204 22;
}
```

`:root` bare is listed alongside summer so a page that never gets a `data-season` stamp still has a complete palette rather than rendering with undefined colours.

`--c-surface-raised` is not in the spec's table; it is in the spec's token list. White in every season is the right default for a raised card over a tinted surface.

- [ ] **Step 4: Map them in Tailwind**

In `assets/tailwind.config.js`, extend `theme.extend.colors` — keep the existing `brand` entry:

```js
      colors: {
        brand: "#FD4F00",
        surface: "rgb(var(--c-surface) / <alpha-value>)",
        "surface-raised": "rgb(var(--c-surface-raised) / <alpha-value>)",
        ink: "rgb(var(--c-ink) / <alpha-value>)",
        "ink-muted": "rgb(var(--c-ink-muted) / <alpha-value>)",
        line: "rgb(var(--c-line) / <alpha-value>)",
        accent: "rgb(var(--c-accent) / <alpha-value>)",
        "accent-ink": "rgb(var(--c-accent-ink) / <alpha-value>)",
        "accent-soft": "rgb(var(--c-accent-soft) / <alpha-value>)",
        positive: "rgb(var(--c-positive) / <alpha-value>)",
        negative: "rgb(var(--c-negative) / <alpha-value>)",
        star: "rgb(var(--c-star) / <alpha-value>)",
      }
```

Tailwind only emits utilities it finds used in `content`. Until templates use them, the test above would fail on utilities that are real but unused, so add a safelist at the top level of the config (a sibling of `content`, `theme` and `plugins`):

```js
  safelist: [
    "bg-surface", "bg-surface-raised", "text-ink", "text-ink-muted",
    "border-line", "bg-accent", "text-accent", "text-accent-ink",
    "bg-accent-soft", "text-positive", "text-negative", "text-star",
    "bg-accent/10",
  ],
```

Keep the safelist after the migration tasks too: several of these are applied from Elixir (`class={...}` built in a function component), where Tailwind's scanner cannot always see them.

- [ ] **Step 5: Run tests and build the assets**

Run: `mix assets.build` — must exit 0.
Then: `MIX_TEST_PARTITION=_social mix test test/ethos_web/season_tokens_test.exs`
Then: `MIX_TEST_PARTITION=_social mix test`
Expected: all pass, 0 failures. No page has changed appearance yet — that is correct at this stage.

- [ ] **Step 6: Commit**

```bash
mix format assets/tailwind.config.js 2>/dev/null || true
git add assets/css/app.css assets/tailwind.config.js test/ethos_web/season_tokens_test.exs
git commit -m "feat: seasonal colour tokens and their Tailwind mapping"
```

(`mix format` does not format JavaScript; the `|| true` keeps the line honest rather than pretending it did.)

---

### Task 2: `Ethos.Seasons`

**Files:**
- Create: `lib/ethos/seasons.ex`
- Test: `test/ethos/seasons_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces: `Ethos.Seasons.current/1` (a `Date` → `:spring | :summer | :autumn | :winter`), `Ethos.Seasons.all/0` (the four atoms), `Ethos.Seasons.valid?/1`.

Pure. No database, no application config, and **no `Date.utc_today()` default inside `current/1`** — a function that reads the clock cannot be tested at a boundary without stubbing time. The caller passes the date.

- [ ] **Step 1: Write the failing test**

Create `test/ethos/seasons_test.exs`:

```elixir
defmodule Ethos.SeasonsTest do
  @moduledoc """
  Boundaries, exhaustively. Every season's first and last day, and the day
  either side of it — off-by-one at a season boundary is the whole risk in a
  function this small, and it would show up in production exactly once a
  quarter.
  """
  use ExUnit.Case, async: true

  alias Ethos.Seasons

  describe "current/1 at each boundary" do
    test "spring runs Mar 20 to May 31" do
      assert Seasons.current(~D[2026-03-19]) == :winter
      assert Seasons.current(~D[2026-03-20]) == :spring
      assert Seasons.current(~D[2026-05-31]) == :spring
      assert Seasons.current(~D[2026-06-01]) == :summer
    end

    test "summer runs Jun 1 to Sep 21" do
      assert Seasons.current(~D[2026-05-31]) == :spring
      assert Seasons.current(~D[2026-06-01]) == :summer
      assert Seasons.current(~D[2026-09-21]) == :summer
      assert Seasons.current(~D[2026-09-22]) == :autumn
    end

    test "autumn runs Sep 22 to Nov 30" do
      assert Seasons.current(~D[2026-09-21]) == :summer
      assert Seasons.current(~D[2026-09-22]) == :autumn
      assert Seasons.current(~D[2026-11-30]) == :autumn
      assert Seasons.current(~D[2026-12-01]) == :winter
    end

    test "winter wraps the year end" do
      assert Seasons.current(~D[2026-11-30]) == :autumn
      assert Seasons.current(~D[2026-12-01]) == :winter
      assert Seasons.current(~D[2026-12-31]) == :winter
      assert Seasons.current(~D[2027-01-01]) == :winter
      assert Seasons.current(~D[2027-03-19]) == :winter
      assert Seasons.current(~D[2027-03-20]) == :spring
    end
  end

  test "today is summer, and the site turns autumn on September 22" do
    # The dates this plan was written against. If someone shifts a boundary,
    # this is the test that says what the shift means in plain terms.
    assert Seasons.current(~D[2026-09-06]) == :summer
    assert Seasons.current(~D[2026-09-22]) == :autumn
  end

  test "every day of a leap year resolves to exactly one season" do
    # 2028 is a leap year: Feb 29 must not fall through the winter clauses.
    for d <- Date.range(~D[2028-01-01], ~D[2028-12-31]) do
      assert Seasons.current(d) in Seasons.all(),
             "#{d} resolved to something that is not a season"
    end

    assert Seasons.current(~D[2028-02-29]) == :winter
  end

  test "all/0 and valid?/1 agree" do
    assert Seasons.all() == [:spring, :summer, :autumn, :winter]
    for s <- Seasons.all(), do: assert(Seasons.valid?(s))
    refute Seasons.valid?(:monsoon)
    refute Seasons.valid?("summer")
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/seasons_test.exs`
Expected: FAIL — `Ethos.Seasons` is undefined.

- [ ] **Step 3: Implement**

Create `lib/ethos/seasons.ex`:

```elixir
defmodule Ethos.Seasons do
  @moduledoc """
  Which season the site is dressed in.

  Boundaries are the spec's, which are the astronomical ones rounded to whole
  days. They are NOT `Ethos.Foliage`'s season: that one opens on September 1
  and describes when Connecticut's leaves are worth travelling for. This one
  describes what colour the site is. They are three weeks apart on purpose
  and neither should be derived from the other.

  `current/1` takes the date rather than reading the clock so its boundaries
  can be tested directly. `Ethos.SiteSettings.active_season/0` is what reads
  today's date, and what an admin override goes through.
  """

  @seasons [:spring, :summer, :autumn, :winter]

  @doc "The four seasons, in calendar order from the spring boundary."
  def all, do: @seasons

  @doc "Whether a term is one of the four seasons."
  def valid?(season), do: season in @seasons

  @doc """
  The season a date falls in.

  Compared on `{month, day}` so the year never enters into it, which is what
  makes the December-to-March wrap a single clause rather than a special case
  per year.
  """
  def current(%Date{month: month, day: day}) do
    md = {month, day}

    cond do
      md >= {3, 20} and md <= {5, 31} -> :spring
      md >= {6, 1} and md <= {9, 21} -> :summer
      md >= {9, 22} and md <= {11, 30} -> :autumn
      true -> :winter
    end
  end
end
```

The `true -> :winter` catch-all is what makes the year-end wrap work: December and January-to-March-19 both fall through to it, and so does February 29.

- [ ] **Step 4: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/seasons_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: both pass, 0 failures.

- [ ] **Step 5: Commit**

```bash
mix format lib/ethos/seasons.ex test/ethos/seasons_test.exs
git add lib/ethos/seasons.ex test/ethos/seasons_test.exs
git commit -m "feat: resolve a date to a season"
```

---

### Task 3: The override — `site_settings` and the admin selector

**Files:**
- Create: `priv/repo/migrations/20260908120000_create_site_settings.exs`
- Create: `lib/ethos/site_settings/site_setting.ex`
- Create: `lib/ethos/site_settings.ex`
- Create: `lib/ethos_web/controllers/admin_season_controller.ex`
- Modify: `lib/ethos_web/router.ex`, `lib/ethos_web/components/admin_nav.ex`
- Test: `test/ethos/site_settings_test.exs`, `test/ethos_web/admin_season_test.exs`

**Interfaces:**
- Consumes: `Ethos.Seasons.valid?/1`, `Ethos.Seasons.current/1`, `Ethos.Seasons.all/0`.
- Produces: `Ethos.SiteSettings.active_season/1` (optional `Date`, defaults to today) → season atom; `Ethos.SiteSettings.season_override/0` → season atom or `nil`; `Ethos.SiteSettings.put_season_override/1` accepting a season atom or `nil` to clear.

- [ ] **Step 1: Write the failing tests**

Create `test/ethos/site_settings_test.exs`:

```elixir
defmodule Ethos.SiteSettingsTest do
  use Ethos.DataCase, async: true

  alias Ethos.SiteSettings

  test "with no override, the season follows the date" do
    assert SiteSettings.season_override() == nil
    assert SiteSettings.active_season(~D[2026-09-06]) == :summer
    assert SiteSettings.active_season(~D[2026-09-22]) == :autumn
  end

  test "an override wins over the date" do
    {:ok, _} = SiteSettings.put_season_override(:winter)

    assert SiteSettings.season_override() == :winter
    assert SiteSettings.active_season(~D[2026-09-06]) == :winter
    assert SiteSettings.active_season(~D[2026-06-15]) == :winter
  end

  test "clearing the override returns to the date" do
    {:ok, _} = SiteSettings.put_season_override(:winter)
    {:ok, _} = SiteSettings.put_season_override(nil)

    assert SiteSettings.season_override() == nil
    assert SiteSettings.active_season(~D[2026-09-06]) == :summer
  end

  test "setting the override twice updates rather than duplicating" do
    {:ok, _} = SiteSettings.put_season_override(:winter)
    {:ok, _} = SiteSettings.put_season_override(:spring)

    assert SiteSettings.season_override() == :spring
    assert Ethos.Repo.aggregate(Ethos.SiteSettings.SiteSetting, :count) == 1
  end

  test "a value that is not a season is refused" do
    assert {:error, _} = SiteSettings.put_season_override(:monsoon)
    assert SiteSettings.season_override() == nil
  end

  test "a junk value already in the table degrades to the date" do
    # Defence in depth: the column is text, and a bad row must not take the
    # whole site down with a match error on every request.
    Ethos.Repo.insert!(%Ethos.SiteSettings.SiteSetting{
      key: "season_override",
      value: "not-a-season"
    })

    assert SiteSettings.season_override() == nil
    assert SiteSettings.active_season(~D[2026-09-06]) == :summer
  end
end
```

Create `test/ethos_web/admin_season_test.exs`:

```elixir
defmodule EthosWeb.AdminSeasonTest do
  @moduledoc "async: false — admin_fixture/1 inserts the configured admin email."
  use EthosWeb.ConnCase, async: false

  import Ethos.AccountsFixtures

  describe "as the admin" do
    setup %{conn: conn}, do: %{conn: log_in_user(conn, admin_fixture())}

    test "the season page lists every season plus Auto", %{conn: conn} do
      html = conn |> get(~p"/admin/season") |> html_response(200)

      for label <- ~w(Auto Spring Summer Autumn Winter) do
        assert html =~ label
      end
    end

    test "choosing a season sets the override", %{conn: conn} do
      conn = post(conn, ~p"/admin/season", %{"season" => "winter"})

      assert redirected_to(conn) == ~p"/admin/season"
      assert Ethos.SiteSettings.season_override() == :winter
    end

    test "choosing Auto clears it", %{conn: conn} do
      {:ok, _} = Ethos.SiteSettings.put_season_override(:winter)

      post(conn, ~p"/admin/season", %{"season" => "auto"})

      assert Ethos.SiteSettings.season_override() == nil
    end

    test "a junk season is refused rather than stored", %{conn: conn} do
      post(conn, ~p"/admin/season", %{"season" => "monsoon"})

      assert Ethos.SiteSettings.season_override() == nil
    end
  end

  test "a regular user gets a 404", %{conn: conn} do
    conn = log_in_user(conn, user_fixture())

    assert conn |> get(~p"/admin/season") |> html_response(404)
  end

  test "a logged-out visitor is redirected to log in, not 404ed", %{conn: conn} do
    assert conn |> get(~p"/admin/season") |> redirected_to() == ~p"/users/log_in"
  end
end
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/site_settings_test.exs test/ethos_web/admin_season_test.exs`
Expected: FAIL — nothing exists yet.

- [ ] **Step 3: The migration**

Create `priv/repo/migrations/20260908120000_create_site_settings.exs`. Check `priv/repo/migrations/` first and pick a timestamp later than every existing one — another session may have added migrations since this plan was written:

```elixir
defmodule Ethos.Repo.Migrations.CreateSiteSettings do
  use Ecto.Migration

  def change do
    create table(:site_settings) do
      add :key, :string, null: false
      add :value, :string
      timestamps(type: :utc_datetime)
    end

    create unique_index(:site_settings, [:key])
  end
end
```

The unique index on `key` is what makes "set the override twice" an update rather than a second row, and it is enforced by the database rather than by the context remembering to check.

- [ ] **Step 4: The schema and context**

`lib/ethos/site_settings/site_setting.ex`:

```elixir
defmodule Ethos.SiteSettings.SiteSetting do
  use Ecto.Schema
  import Ecto.Changeset

  schema "site_settings" do
    field :key, :string
    field :value, :string
    timestamps(type: :utc_datetime)
  end

  def changeset(setting, attrs) do
    setting
    |> cast(attrs, [:key, :value])
    |> validate_required([:key])
    |> unique_constraint(:key)
  end
end
```

`lib/ethos/site_settings.ex`:

```elixir
defmodule Ethos.SiteSettings do
  @moduledoc """
  Site-wide settings an admin can change without a deploy.

  One key/value row per setting. Today there is exactly one setting — the
  season override — and the table exists rather than an application env var
  because the whole point is that it survives a restart and takes effect
  without one.
  """

  import Ecto.Query

  alias Ethos.Repo
  alias Ethos.Seasons
  alias Ethos.SiteSettings.SiteSetting

  @season_key "season_override"

  @doc """
  The season the site should render in: the override when one is set and
  valid, otherwise the season `date` falls in.
  """
  def active_season(date \\ Date.utc_today()) do
    season_override() || Seasons.current(date)
  end

  @doc """
  The admin's season override, or nil when the site is following the calendar.

  A stored value that is not a season resolves to nil rather than raising.
  The column is free text, and one bad row must not take every page down.
  """
  def season_override do
    case Repo.one(from s in SiteSetting, where: s.key == ^@season_key, select: s.value) do
      nil -> nil
      value -> parse_season(value)
    end
  end

  @doc """
  Sets the override, or clears it when given nil.

  Refuses anything that is not one of `Ethos.Seasons.all/0`, so the admin
  form cannot write a value the renderer would then have to defend against.
  """
  def put_season_override(nil), do: upsert(@season_key, nil)

  def put_season_override(season) do
    if Seasons.valid?(season) do
      upsert(@season_key, Atom.to_string(season))
    else
      {:error, :invalid_season}
    end
  end

  defp upsert(key, value) do
    %SiteSetting{}
    |> SiteSetting.changeset(%{key: key, value: value})
    |> Repo.insert(
      on_conflict: [set: [value: value, updated_at: DateTime.utc_now(:second)]],
      conflict_target: :key
    )
  end

  # String.to_existing_atom/1 rather than String.to_atom/1: the value comes
  # out of a database column, and to_atom on unbounded input is an atom-table
  # leak. The rescue covers a value whose atom was never created at all.
  defp parse_season(value) do
    season = String.to_existing_atom(value)
    if Seasons.valid?(season), do: season, else: nil
  rescue
    ArgumentError -> nil
  end
end
```

- [ ] **Step 5: The admin controller and route**

Create `lib/ethos_web/controllers/admin_season_controller.ex`:

```elixir
defmodule EthosWeb.AdminSeasonController do
  use EthosWeb, :controller

  alias Ethos.Seasons
  alias Ethos.SiteSettings

  def index(conn, _params) do
    render(conn, :index,
      override: SiteSettings.season_override(),
      active: SiteSettings.active_season(),
      seasons: Seasons.all(),
      page_title: "Season"
    )
  end

  def update(conn, %{"season" => "auto"}) do
    {:ok, _} = SiteSettings.put_season_override(nil)

    conn
    |> put_flash(:info, "Following the calendar again.")
    |> redirect(to: ~p"/admin/season")
  end

  def update(conn, %{"season" => season}) when is_binary(season) do
    # The form posts a string; only a string naming one of the four seasons
    # is converted. Anything else is refused here rather than reaching
    # SiteSettings, so no unknown value ever gets near an atom conversion.
    case Enum.find(Seasons.all(), &(Atom.to_string(&1) == season)) do
      nil ->
        conn
        |> put_flash(:error, "That is not a season.")
        |> redirect(to: ~p"/admin/season")

      found ->
        {:ok, _} = SiteSettings.put_season_override(found)

        conn
        |> put_flash(:info, "The site is now #{found}.")
        |> redirect(to: ~p"/admin/season")
    end
  end

  # A post with no season at all, rather than a 500.
  def update(conn, _params) do
    conn
    |> put_flash(:error, "Choose a season.")
    |> redirect(to: ~p"/admin/season")
  end
end
```

Create `lib/ethos_web/controllers/admin_season_html.ex`:

```elixir
defmodule EthosWeb.AdminSeasonHTML do
  use EthosWeb, :html

  embed_templates "admin_season_html/*"
end
```

Create `lib/ethos_web/controllers/admin_season_html/index.html.heex`:

```heex
<EthosWeb.AdminNav.admin_nav current={:season} />

<h1 class="text-2xl font-semibold text-ink">Season</h1>

<p class="mt-2 text-sm text-ink-muted">
  The site follows the calendar unless you pin it. Currently showing
  <span class="font-medium text-ink">{@active}</span>{if @override,
    do: " (pinned)",
    else: " (automatic)"}.
</p>

<div class="mt-6 flex flex-wrap gap-3">
  <form action={~p"/admin/season"} method="post">
    <input type="hidden" name="_csrf_token" value={Plug.CSRFProtection.get_csrf_token()} />
    <input type="hidden" name="season" value="auto" />
    <button
      type="submit"
      class={[
        "rounded-lg border border-line px-4 py-2 text-sm",
        is_nil(@override) && "bg-accent text-accent-ink"
      ]}
    >
      Auto
    </button>
  </form>

  <form :for={season <- @seasons} action={~p"/admin/season"} method="post">
    <input type="hidden" name="_csrf_token" value={Plug.CSRFProtection.get_csrf_token()} />
    <input type="hidden" name="season" value={season} />
    <button
      type="submit"
      class={[
        "rounded-lg border border-line px-4 py-2 text-sm capitalize",
        @override == season && "bg-accent text-accent-ink"
      ]}
    >
      {season}
    </button>
  </form>
</div>
```

The buttons are separate forms rather than one form with four submit buttons, because a
submit button's value is only sent when it is the one clicked — a detail that is easy to
get subtly wrong and produces a form that always posts the first season.

In `lib/ethos_web/router.ex`, add to the existing `scope "/admin"` block (which already pipes through `[:browser, :require_authenticated_user, :require_admin_user]`):

```elixir
    get "/season", AdminSeasonController, :index
    post "/season", AdminSeasonController, :update
```

In `lib/ethos_web/components/admin_nav.ex`, add a fourth tab: `<.tab label="Season" href={~p"/admin/season"} active={@current == :season} />`.

- [ ] **Step 6: Run tests**

Run: `MIX_TEST_PARTITION=_social mix ecto.migrate`
then `MIX_TEST_PARTITION=_social mix test test/ethos/site_settings_test.exs test/ethos_web/admin_season_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: all pass, 0 failures.

- [ ] **Step 7: Commit**

```bash
mix format lib/ethos/site_settings.ex lib/ethos/site_settings/site_setting.ex lib/ethos_web/controllers/admin_season_controller.ex lib/ethos_web/router.ex lib/ethos_web/components/admin_nav.ex priv/repo/migrations/20260908120000_create_site_settings.exs test/ethos/site_settings_test.exs test/ethos_web/admin_season_test.exs
git add -A
git commit -m "feat: admin season override backed by site_settings"
```

---

### Task 4: Stamp the season on the page

**Files:**
- Create: `lib/ethos_web/plugs/put_season.ex`
- Modify: `lib/ethos_web/router.ex`, `lib/ethos_web/components/layouts/root.html.heex`
- Test: `test/ethos_web/plugs/put_season_test.exs`, `test/ethos_web/season_stamp_test.exs`

**Interfaces:**
- Consumes: `Ethos.SiteSettings.active_season/1`.
- Produces: `conn.assigns.season`, a season atom, on every browser request; `<html data-season="…">`.

**The trap in this task.** `EthosWeb.UserAuth.require_admin_user/2` *renders* a 404 through this same root layout rather than raising, and Plan 4a put eight routes behind it. Error responses may not carry the plug's assign. Read it as `assigns[:season] || "summer"` in the template — never `@season`, which raises on a missing key — and prove it with a test that fetches an admin-only path as a regular user.

- [ ] **Step 1: Write the failing tests**

`test/ethos_web/plugs/put_season_test.exs`:

```elixir
defmodule EthosWeb.Plugs.PutSeasonTest do
  use EthosWeb.ConnCase, async: true

  alias EthosWeb.Plugs.PutSeason

  test "assigns the calendar season", %{conn: conn} do
    assert PutSeason.call(conn, []).assigns.season in Ethos.Seasons.all()
  end

  test "assigns the override when one is set", %{conn: conn} do
    {:ok, _} = Ethos.SiteSettings.put_season_override(:winter)

    assert PutSeason.call(conn, []).assigns.season == :winter
  end
end
```

`test/ethos_web/season_stamp_test.exs`:

```elixir
defmodule EthosWeb.SeasonStampTest do
  @moduledoc "async: false — admin_fixture/1 and a global season override."
  use EthosWeb.ConnCase, async: false

  import Ethos.AccountsFixtures

  test "the home page stamps the current season", %{conn: conn} do
    html = conn |> get(~p"/") |> html_response(200)

    assert html =~ ~s(data-season=")
  end

  test "an override changes the stamp", %{conn: conn} do
    {:ok, _} = Ethos.SiteSettings.put_season_override(:winter)

    html = conn |> get(~p"/") |> html_response(200)

    assert html =~ ~s(data-season="winter")
    refute html =~ ~s(data-season="summer")
  end

  test "a rendered 404 still has a complete page", %{conn: conn} do
    # require_admin_user/2 RENDERS a 404 through the root layout rather than
    # raising, and Plan 4a put eight routes behind it. If the layout reads
    # @season on a response the plug never touched, every one of those 404s
    # becomes a 500.
    conn = log_in_user(conn, user_fixture())
    html = conn |> get(~p"/guides/new") |> html_response(404)

    assert html =~ ~s(data-season=")
  end
end
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/plugs/put_season_test.exs test/ethos_web/season_stamp_test.exs`
Expected: FAIL — the plug does not exist.

- [ ] **Step 3: The plug**

```elixir
defmodule EthosWeb.Plugs.PutSeason do
  @moduledoc """
  Assigns the season the page should render in.

  In the `:browser` pipeline so every HTML response carries it, including the
  404s `EthosWeb.UserAuth.require_admin_user/2` renders.
  """

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts), do: assign(conn, :season, Ethos.SiteSettings.active_season())
end
```

Add `plug EthosWeb.Plugs.PutSeason` to the end of the `:browser` pipeline in `lib/ethos_web/router.ex`, after `plug :fetch_current_user`.

- [ ] **Step 4: Stamp it**

In `lib/ethos_web/components/layouts/root.html.heex`, line 2 currently reads:

```heex
<html lang="en" class="[scrollbar-gutter:stable]">
```

Change it to:

```heex
<html lang="en" class="[scrollbar-gutter:stable]" data-season={assigns[:season] || "summer"}>
```

`assigns[:season]`, not `@season`. A response that never passed through the plug — an error page rendered from a different path — must still produce a complete page rather than a `KeyError`.

- [ ] **Step 5: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/plugs/put_season_test.exs test/ethos_web/season_stamp_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: both pass, 0 failures.

- [ ] **Step 6: Commit**

```bash
mix format lib/ethos_web/plugs/put_season.ex lib/ethos_web/router.ex lib/ethos_web/components/layouts/root.html.heex test/ethos_web/plugs/put_season_test.exs test/ethos_web/season_stamp_test.exs
git add -A
git commit -m "feat: stamp the active season on every page"
```

---

### Task 5: Type — self-hosted Fraunces and a scale

**Files:**
- Create: `priv/static/fonts/` (the `woff2` files)
- Modify: `assets/css/app.css`, `assets/tailwind.config.js`
- Test: `test/ethos_web/typography_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces: a `font-display` heading family available as `font-display`, and a type scale.

**If the font cannot be fetched, stop and report rather than improvising.** Do not substitute a different font, and do not fall back to Google's CDN — the spec chose self-hosting specifically to avoid a third-party request and the layout shift of a late-arriving font.

- [ ] **Step 1: Fetch the font**

Fraunces is licensed SIL OFL 1.1, which permits redistribution, so the `woff2` is committed to the repo. Fetch the variable latin subset:

```bash
mkdir -p priv/static/fonts
curl -sSL -o priv/static/fonts/fraunces-latin-variable.woff2 \
  "https://cdn.jsdelivr.net/fontsource/fonts/fraunces:vf@latest/latin-wght-normal.woff2"
```

Verify it is a real font file and not an error page saved with a font's name — a 404 body written to that path would "succeed" and then fail silently in the browser:

```bash
file priv/static/fonts/fraunces-latin-variable.woff2
ls -l priv/static/fonts/fraunces-latin-variable.woff2
```

Expect `Web Open Font Format (Version 2)` and a size in the tens of kilobytes. Anything else — HTML, a few hundred bytes — means the fetch failed. **Report that and stop; do not proceed with a broken file.**

Also fetch the licence, because redistributing an OFL font requires shipping it:

```bash
curl -sSL -o priv/static/fonts/Fraunces-OFL.txt \
  "https://raw.githubusercontent.com/googlefonts/fraunces/main/OFL.txt"
```

- [ ] **Step 2: Write the failing test**

```elixir
defmodule EthosWeb.TypographyTest do
  use ExUnit.Case, async: true

  test "the font file is present, and is a font" do
    path = "priv/static/fonts/fraunces-latin-variable.woff2"

    assert File.exists?(path), "the Fraunces woff2 was never committed"

    # wOF2 magic number. Guards against an error page saved under this name,
    # which would pass a mere File.exists?/1 and then fail in the browser.
    assert File.read!(path) |> binary_part(0, 4) == "wOF2"
    assert File.stat!(path).size > 10_000
  end

  test "the licence ships with it" do
    # SIL OFL 1.1 requires the licence to travel with the font.
    assert File.exists?("priv/static/fonts/Fraunces-OFL.txt")
  end

  test "the face is declared and swaps rather than blocking" do
    {_, 0} = System.cmd("mix", ["assets.build"], stderr_to_stdout: true)
    css = File.read!("priv/static/assets/app.css")

    assert css =~ "@font-face"
    assert css =~ "Fraunces"
    assert css =~ "font-display: swap"
    assert css =~ "/fonts/fraunces-latin-variable.woff2"
  end
end
```

- [ ] **Step 3: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/typography_test.exs`
Expected: FAIL on the `@font-face` assertions (the file assertions pass after Step 1).

- [ ] **Step 4: Declare the face and the scale**

In `assets/css/app.css`, above the season blocks:

```css
/* Self-hosted rather than Google's CDN: no third-party request on every page
   load, and no layout shift from a font that arrives late. `swap` means the
   fallback renders immediately and Fraunces replaces it when it lands. */
@font-face {
  font-family: "Fraunces";
  src: url("/fonts/fraunces-latin-variable.woff2") format("woff2-variations");
  font-weight: 100 900;
  font-style: normal;
  font-display: swap;
}
```

In `assets/tailwind.config.js`, inside `theme.extend`:

```js
      fontFamily: {
        display: ["Fraunces", "Georgia", "Cambria", "serif"],
      },
      fontSize: {
        // A scale, so pages stop picking text-3xl ad hoc.
        "display-lg": ["3.5rem", { lineHeight: "1.05", letterSpacing: "-0.02em" }],
        "display-md": ["2.5rem", { lineHeight: "1.1", letterSpacing: "-0.015em" }],
        "display-sm": ["1.875rem", { lineHeight: "1.2", letterSpacing: "-0.01em" }],
      },
```

Add `font-display`, `text-display-lg`, `text-display-md` and `text-display-sm` to the safelist from Task 1.

The fallback stack matters: with `swap`, visitors see Georgia first. A stack ending in bare `serif` would let the fallback be anything at all.

- [ ] **Step 5: Run tests**

Run: `mix assets.build` (must exit 0), then `MIX_TEST_PARTITION=_social mix test test/ethos_web/typography_test.exs`, then `MIX_TEST_PARTITION=_social mix test`
Expected: all pass, 0 failures.

- [ ] **Step 6: Commit**

```bash
git add priv/static/fonts assets/css/app.css assets/tailwind.config.js test/ethos_web/typography_test.exs
git commit -m "feat: self-hosted Fraunces for headings, and a type scale"
```

---

### Task 6: `core_components.ex` and the header on tokens

**Files:**
- Modify: `lib/ethos_web/components/core_components.ex` (36 occurrences)
- Modify: `lib/ethos_web/components/layouts.ex` (10), `lib/ethos_web/components/layouts/root.html.heex` (9), `lib/ethos_web/components/layouts/app.html.heex`
- Test: `test/ethos_web/token_migration_test.exs`

**Interfaces:**
- Consumes: the utilities from Task 1.
- Produces: nothing new; every component keeps its current API.

The highest-leverage task in the plan: `core_components.ex` is the shared component library, so migrating it re-skins flashes, buttons, inputs, tables and modals everywhere at once.

**The mapping, applied consistently:**

| Was | Becomes |
|---|---|
| `bg-white` (page background) | `bg-surface` |
| `bg-white` (a card on a tinted surface) | `bg-surface-raised` |
| `text-zinc-900`, `text-zinc-800` | `text-ink` |
| `text-zinc-600`, `text-zinc-500`, `text-zinc-400` | `text-ink-muted` |
| `border-zinc-300`, `border-zinc-200`, `border-zinc-100`, bare `border` | `border-line` |
| `bg-zinc-900` (a primary button) | `bg-accent` with `text-accent-ink` |
| `bg-zinc-50`, `bg-zinc-100` (subtle fills) | `bg-accent-soft` for emphasis, `bg-surface` otherwise |
| `emerald-*` | `positive` |
| `rose-*`, `red-*` in an error role | `negative` |
| `amber-*` in a rating or star role | `star` |

**Do not migrate `amber-*` where it signals an affiliate unit.** Plan 4a put those behind a default-off flag; they are commercial styling, not seasonal, and `affiliate.ex` is deliberately excluded from this task.

- [ ] **Step 1: Write the failing test**

```elixir
defmodule EthosWeb.TokenMigrationTest do
  @moduledoc """
  The shared component library and the layouts carry no hardcoded palette
  colours, so a season change reaches them.

  Asserted against the source rather than rendered output: a hardcoded
  `text-zinc-900` renders perfectly well, it just never changes colour. There
  is no rendered artifact to catch, which is why this reads the files.
  """
  use ExUnit.Case, async: true

  @files [
    "lib/ethos_web/components/core_components.ex",
    "lib/ethos_web/components/layouts.ex",
    "lib/ethos_web/components/layouts/root.html.heex",
    "lib/ethos_web/components/layouts/app.html.heex"
  ]

  test "no hardcoded palette colours survive in the shared surfaces" do
    for path <- @files do
      offenders =
        path
        |> File.read!()
        |> String.split("\n")
        |> Enum.with_index(1)
        |> Enum.filter(fn {line, _} -> line =~ ~r/\b(zinc|emerald)-[0-9]{2,3}\b/ end)
        |> Enum.map(fn {line, n} -> "  #{path}:#{n}: #{String.trim(line)}" end)

      assert offenders == [],
             "hardcoded palette colours remain:\n" <> Enum.join(offenders, "\n")
    end
  end
end
```

`amber` is absent from that regex on purpose: `layouts.ex` and the affiliate surfaces may legitimately keep amber for commercial units.

- [ ] **Step 2: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/token_migration_test.exs`
Expected: FAIL, listing every offending line.

- [ ] **Step 3: Migrate**

Work file by file, applying the mapping table. This is mechanical, but two things need judgment:

- **`bg-white` is ambiguous.** A page background is `bg-surface`; a card sitting on that background is `bg-surface-raised`. Decide per occurrence by what the element is, not by what it says.
- **A bare `border` class** with no colour uses Tailwind's default border colour, which is not a token. Make it `border border-line` so it follows the season.

Do not change any layout, spacing, or structure in this task. Colour only — that keeps the diff reviewable and means a visual regression can only have come from the palette.

- [ ] **Step 4: Run tests and build**

Run: `mix assets.build` (must exit 0)
then `MIX_TEST_PARTITION=_social mix test`
Expected: 0 failures. Several existing tests assert on markup; if one fails because it matched a colour class, update it to match the token — but read it first, and if it was asserting something real about appearance, say so in the report.

- [ ] **Step 5: Verify it actually re-skins, in the browser**

A passing suite does not prove the site looks right. Start the dev server on a free port, load a page in each season, and confirm the colours change:

```bash
PORT=4010 mix phx.server
```

Fetch the home page, then set an override and fetch again:

```bash
curl -s localhost:4010/ | grep -o 'data-season="[a-z]*"'
```

Then, in `iex -S mix`, `Ethos.SiteSettings.put_season_override(:autumn)` and re-fetch. Confirm the stamp changes. Note in the report what you saw. **Check the server's own log to confirm it answered your request** — this machine has run other services on 4000 before, and a previous session was fooled by a Docker container answering on the port it expected.

- [ ] **Step 6: Commit**

```bash
mix format lib/ethos_web/components/core_components.ex lib/ethos_web/components/layouts.ex test/ethos_web/token_migration_test.exs
git add -A
git commit -m "feat: shared components and layouts on seasonal tokens"
```

---

### Task 7: The home hero, cards, and the social island

**Files:**
- Modify: `lib/ethos_web/controllers/page_html/home.html.heex` (12 occurrences)
- Modify: `lib/ethos_web/live/social_live.ex` (14)
- Test: extend `test/ethos_web/token_migration_test.exs`, `test/ethos_web/controllers/page_controller_test.exs`

**Interfaces:**
- Consumes: the utilities from Task 1, the type scale from Task 5.
- Produces: nothing new.

This is the task that answers "too blank and generic" directly.

**Do not touch the house ad block at the top of `home.html.heex`.** Another session added it and owns it; Plan 4a already resolved one conflict there.

- [ ] **Step 1: Extend the failing test**

Add `"lib/ethos_web/controllers/page_html/home.html.heex"` and `"lib/ethos_web/live/social_live.ex"` to the `@files` list in `test/ethos_web/token_migration_test.exs`.

Add to `test/ethos_web/controllers/page_controller_test.exs`:

```elixir
    test "the hero carries the seasonal gradient", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      # Built from accent and accent-soft, so it re-skins with the season
      # rather than being a fixed pair of colours that happens to suit summer.
      assert html =~ "from-accent-soft"
      assert html =~ "font-display"
    end
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/token_migration_test.exs test/ethos_web/controllers/page_controller_test.exs`
Expected: FAIL.

- [ ] **Step 3: The hero**

In `home.html.heex`, give the hero container a seasonal gradient and the headline the display face. Keep the copy exactly as Plan 4a left it — the words are not this task's business:

```heex
<div class="bg-gradient-to-b from-accent-soft to-surface">
  <div class="mx-auto max-w-3xl px-4 pb-20 pt-16 text-center">
    <h1 class="font-display text-display-lg text-ink">
      Places worth the trip, and what people made of them
    </h1>
```

Add `from-accent-soft`, `to-surface` and `bg-gradient-to-b` to the safelist.

- [ ] **Step 4: Cards**

Replace the hairline `border` treatment on the featured-guide card and the latest-guides list with real elevation:

```heex
class="rounded-2xl border border-line bg-surface-raised p-6 shadow-sm transition hover:shadow-md"
```

- [ ] **Step 5: The social island**

Migrate `social_live.ex` to tokens using Task 6's mapping table, with two rules specific to it:

- **Thumbs up is `positive`, thumbs down is `negative`, and neither changes with the season.** That is a spec constraint: a judgement must not read as decoration.
- **Stars use `star`**, which does change with the season.

- [ ] **Step 6: Run tests, build, and look at it**

Run `mix assets.build`, then the full suite. Then repeat Task 6's browser check on the home page in summer and in autumn, and describe in the report what actually changed. A screenshot-free "it looked right" is not a report; name the colours you saw.

- [ ] **Step 7: Commit**

```bash
mix format lib/ethos_web/controllers/page_html/home.html.heex lib/ethos_web/live/social_live.ex test/ethos_web/token_migration_test.exs test/ethos_web/controllers/page_controller_test.exs
git add -A
git commit -m "feat: seasonal hero, real cards, and the social island on tokens"
```

---

### Task 8: The remaining public templates

**Files:**
- Modify, in descending order of occurrences: `guide_html/show.html.heex` (20), `foliage_html.ex` (8), `place_html/show.html.heex` (7), `foliage_html/route.html.heex` (7), `foliage_html/index.html.heex` (7), `search_html/index.html.heex` (5), `guide_html/town_page.html.heex` (5), `badge_html/index.html.heex` (5), `destination_html/node.html.heex` (4), `house_ad.ex` (4), `collection_html/show.html.heex` (3), `foliage_panel.ex` (3), `connected_pages.ex` (3), `guide_html/photos.html.heex` (2), `destination_html/index.html.heex` (1), `guide_breadcrumb.ex` (1)
- Test: extend `test/ethos_web/token_migration_test.exs`

**Interfaces:**
- Consumes: the utilities from Task 1.
- Produces: nothing new.

**Commit file by file, not all at once.** Five other worktrees are active and several of these files belong to work in flight. A per-file commit means a conflict costs one file, not the task.

**Three files need care rather than mechanical replacement:**

- **`house_ad.ex`** belongs to another session's active work. Migrate its neutrals, leave its structure alone, and expect to rebase.
- **`foliage_*`** are the autumn foliage feature. They may legitimately want autumn colours in every season — that is their subject. Migrate neutrals to `ink`/`surface`/`line`, but **leave deliberate foliage oranges alone** and say which you kept and why.
- **`affiliate.ex`** is excluded entirely. Its amber signals a commercial unit that Plan 4a put behind a flag.

- [ ] **Step 1: Extend the test**

Add each file to `@files` in `test/ethos_web/token_migration_test.exs` as you migrate it, so the guard grows with the work rather than being switched on at the end.

- [ ] **Step 2: Migrate, file by file**

Apply Task 6's mapping. After each file: `MIX_TEST_PARTITION=_social mix test`, then commit that file alone.

- [ ] **Step 3: Final verification**

Run `mix assets.build`, the full suite, and load each migrated page type in the browser in two different seasons — a guide page, a place page, a destination hub, search results, and the foliage index. Report what you saw per page type.

- [ ] **Step 4: Report what was left**

The 42 occurrences across 13 admin and authoring templates are deliberately out of scope. **List them explicitly in the final report** so the omission is a stated decision rather than something a reader has to notice.

---

## Done when

- `MIX_TEST_PARTITION=_social mix test` is green, at no fewer than the 1354 tests this plan starts from.
- `mix assets.build` exits 0, and the built stylesheet contains all four season blocks and every token.
- `Ethos.Seasons.current/1` is correct at all eight season boundaries, across a year end and a leap day.
- Setting an admin override changes `data-season` on the next page load; choosing Auto returns the site to the calendar.
- An admin-only path still renders a 404 for a regular user, with a complete page, rather than a 500 from a missing assign.
- Fraunces is served from `priv/static/fonts` with its licence, `font-display: swap`, and a real fallback stack.
- No hardcoded `zinc` or `emerald` remains in `core_components.ex`, the layouts, the home page, the social island, or the public page templates in Task 8.
- Thumbs up and down are the same colour in all four seasons.
- The report names the 42 admin and authoring occurrences left behind, and states what was seen in the browser in at least two seasons.

## Notes for whoever picks this up next

- **The admin and authoring templates.** 42 occurrences, 13 files, listed in Task 8. Mechanical, and best done when fewer worktrees are active.
- **A season the calendar will reach on its own.** Autumn arrives **September 22, 2026** — sixteen days after this plan was written. Nobody has to deploy anything for the site to change colour, which is the point and also the risk: if the autumn palette is wrong, it goes wrong by itself. Look at autumn in the browser before this lands, not after.
- **`Ethos.Foliage` still has its own season** (Sep 1 – Nov 30) and that is correct. If a future change makes the two look like duplication, read `lib/ethos/seasons.ex`'s moduledoc before unifying them.
