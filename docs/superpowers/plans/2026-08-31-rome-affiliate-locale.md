# Rome Affiliate Locale Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Put the GetYourGuide widget on Rome pages with the `rome` campaign, above the content instead of below it.

**Architecture:** Two tasks. Task 1 adds a per-locale `placement` field (`:top` / `:bottom`, defaulting to `:bottom`) and a second render slot in the app layout, tested with a synthetic locale so it needs no Rome data. Task 2 gives the Rome guide a state — without which the state-slug-keyed registry cannot reach it at all — and adds the `italy` entry.

**Tech Stack:** Elixir, Phoenix 1.7.14, HEEx function components, ExUnit.

**Spec:** `docs/superpowers/specs/2026-08-31-rome-affiliate-locale-design.md`

## Global Constraints

- **Zero AI calls and zero server-side external API calls in shipped code.** The GetYourGuide `<script>` is a client-side browser tag. No Elixir code may call GetYourGuide.
- **Work only in the worktree** `/Users/charmalloc/dev/ethos/.claude/worktrees/connecticut-expansion`. Never `cd` to the original repo root.
- **Never use bare `git stash`** — the stash stack is shared with other sessions. Use a WIP commit.
- **Do not push and do not deploy.** Commit locally only.
- **Exact values, verbatim from the spec:**
  - script `src`: `https://widget.getyourguide.com/dist/pa.umd.production.min.js`
  - `data-gyg-partner-id`: `ZA4AIMF`
  - `data-gyg-widget`: `auto`
  - Rome's `data-gyg-cmp`: `rome`
  - New York's `data-gyg-cmp`: `new-york` (unchanged)
- **The script keeps `async` and `defer`.**
- **One widget div per page, maximum.** Two slots now exist; this is the invariant they must not break.
- **`placement` defaults to `:bottom`.** New York's registry entry is NOT edited, and any future entry omitting the field behaves like New York.
- **New York's behaviour is unchanged** by this plan: one widget, `cmp=new-york`, below the content.
- Run `mix format --check-formatted` and the full `mix test` before every commit. Baseline is 626 tests, 0 failures, 31 excluded.
- One pre-existing Gettext warning at `lib/ethos_web/gettext.ex:23` is tolerated. There is also a pre-existing unused-variable warning at `test/ethos/seeds/data_guide_test.exs:16` — that file is untouched by this branch. Any OTHER new warning is a defect.
- If `mix test` fails with `** (Mix) Could not load Ethos.Repo, error: :nofile`, run `mix compile --force` once — known stale build artifact.

---

## File Structure

| File | Responsibility | Task |
|---|---|---|
| `lib/ethos_web/components/affiliate.ex` | `placement/1`, `render_here?/2`, the `position` attr on `affiliate_unit/1`, margin flip | 1 |
| `lib/ethos_web/components/layouts/app.html.heex` | Two mutually exclusive unit slots | 1 |
| `test/ethos_web/affiliate_corpus_test.exs` | Registry-shape guard extended to validate `placement` | 1 |
| `test/ethos_web/affiliate_placement_test.exs` | Ordering and default-placement tests | 1, 2 |
| `lib/ethos/seeds/rome_guide.ex` | `state: "Italy"` in `data/0` and BOTH changeset call sites | 2 |
| `config/config.exs` | The `italy` registry entry | 2 |

---

### Task 1: Per-locale placement

**Files:**
- Modify: `lib/ethos_web/components/affiliate.ex` (`affiliate_unit/1` around :164-190)
- Modify: `lib/ethos_web/components/layouts/app.html.heex`
- Modify: `test/ethos_web/affiliate_corpus_test.exs` (the `"every configured affiliate locale is well-formed"` test, around :77)
- Modify: `test/ethos_web/affiliate_placement_test.exs`

**Interfaces:**
- Consumes: `EthosWeb.Affiliate.renders?/1` (`affiliate.ex:134`), which returns `true` when the locale's `:network` is in `@supported_networks`. `EthosWeb.Affiliate.locale_from_assigns/1`.
- Produces:
  - `affiliate_unit/1` now requires a `position` attr, `:top` or `:bottom`.
  - A locale map may carry `:placement`, `:top` or `:bottom`. Absent means `:bottom`.
  - Task 2 relies on `placement: :top` in a registry entry rendering the unit above `{@inner_content}`.

**Context — the current state of the two files you are changing:**

`app.html.heex` reads, in full:

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

`affiliate_unit/1`'s body currently renders an outer `<div class="px-4">` containing the widget div (`class="mt-10"`) and a disclosure `<p class="mt-2 text-xs text-zinc-400">`.

**The margin moves to the wrapper.** Today `mt-10` sits on the inner widget div, which is right for a bottom-placed unit and wrong for a top-placed one. Move it to the outer wrapper and pick it by position: `mt-10` at the bottom, `mb-10` at the top. The disclosure stays directly beneath the widget in both cases, so its "Tours and activities shown above" wording remains accurate.

**`unit_renders?/1` stays placement-agnostic — do not touch it.** It answers "will this page carry a unit at all", which is the question the guide show template asks to decide whether to suppress the amber CTA and the booking-link disclosure. Making it placement-aware would suppress the amber CTA at only one placement.

- [ ] **Step 1: Write the failing tests**

Add to `test/ethos_web/affiliate_placement_test.exs`. Put them in a new `describe` block at the end of the file:

```elixir
  describe "per-locale placement" do
    # These use a synthetic locale via config override rather than real data,
    # so the mechanism is tested before any destination adopts it. `on_exit`
    # restores the real registry — without it every later test in the run sees
    # the synthetic one.
    defp with_locale(slug, locale) do
      original = Application.get_env(:ethos, :affiliate_locales, %{})
      Application.put_env(:ethos, :affiliate_locales, Map.put(original, slug, locale))
      ExUnit.Callbacks.on_exit(fn -> Application.put_env(:ethos, :affiliate_locales, original) end)
    end

    defp guide_in(state, county) do
      published_guide_fixture(%{
        "title" => "Placement Probe",
        "destination" => "Placement Probe, #{state}",
        "state" => state,
        "county" => county
      })
    end

    # The load-bearing assertion for the whole feature. Both placements render
    # byte-identical markup, so asserting the widget is PRESENT passes the same
    # either way and proves nothing. Position relative to the page's <h1>
    # (guide_html/show.html.heex:5) is what distinguishes them.
    test "a :top locale renders the unit before the page title", %{conn: conn} do
      with_locale("testonia", %{
        network: :getyourguide,
        partner_id: "ZA4AIMF",
        cmp: "testonia",
        placement: :top
      })

      g = guide_in("Testonia", nil)
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      widget_at = :binary.match(html, "data-gyg-widget") |> elem(0)
      title_at = :binary.match(html, "<h1") |> elem(0)

      assert widget_at < title_at,
             "expected the :top unit before the <h1>, got widget at #{widget_at}, h1 at #{title_at}"
    end

    test "a :bottom locale renders the unit after the page title", %{conn: conn} do
      with_locale("testonia", %{
        network: :getyourguide,
        partner_id: "ZA4AIMF",
        cmp: "testonia",
        placement: :bottom
      })

      g = guide_in("Testonia", nil)
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      widget_at = :binary.match(html, "data-gyg-widget") |> elem(0)
      title_at = :binary.match(html, "<h1") |> elem(0)

      assert widget_at > title_at,
             "expected the :bottom unit after the <h1>, got widget at #{widget_at}, h1 at #{title_at}"
    end

    # Pins the default. This is what keeps New York unchanged without editing
    # its registry entry, and what makes an entry that forgets the field behave
    # like New York rather than like Rome.
    test "a locale omitting :placement renders at the bottom", %{conn: conn} do
      with_locale("testonia", %{
        network: :getyourguide,
        partner_id: "ZA4AIMF",
        cmp: "testonia"
      })

      g = guide_in("Testonia", nil)
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      widget_at = :binary.match(html, "data-gyg-widget") |> elem(0)
      title_at = :binary.match(html, "<h1") |> elem(0)

      assert widget_at > title_at, "a locale with no :placement did not default to the bottom"
    end

    # Two slots exist now. This is the assertion that catches both firing.
    test "a :top locale still renders exactly one widget div", %{conn: conn} do
      with_locale("testonia", %{
        network: :getyourguide,
        partner_id: "ZA4AIMF",
        cmp: "testonia",
        placement: :top
      })

      g = guide_in("Testonia", nil)
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      count = html |> String.split(~s(data-gyg-widget="auto")) |> length() |> Kernel.-(1)
      assert count == 1, "expected exactly one widget div, got #{count}"
    end
  end
```

- [ ] **Step 2: Run the tests to verify they fail**

Run: `mix test test/ethos_web/affiliate_placement_test.exs`

Expected: the `:top` test FAILS on the ordering assertion (the unit renders after the title today), and the "exactly one widget div" test PASSES already. The `:bottom` and default tests PASS already. **That is correct** — only the `:top` case is new behaviour. Report which failed.

- [ ] **Step 3: Add the placement helpers**

In `lib/ethos_web/components/affiliate.ex`, add beside `renders?/1`:

```elixir
  @default_placement :bottom

  @doc """
  Where a locale's unit renders: `:top` (above the page content) or `:bottom`.

  Defaults to `:bottom`, and the default is load-bearing. New York's registry
  entry does not carry the field, and any future entry that forgets it behaves
  like New York rather than like Rome — the conservative direction, since a
  top-placed unit renders above the page's `<h1>`.
  """
  def placement(locale) when is_map(locale), do: Map.get(locale, :placement, @default_placement)
  def placement(_), do: @default_placement

  # The two layout slots are mutually exclusive on one locale: exactly one
  # position can match, so exactly one unit renders. `renders?/1` is checked
  # first and short-circuits, so a nil locale never reaches placement/1.
  defp render_here?(locale, position), do: renders?(locale) and placement(locale) == position

  defp wrapper_margin(:top), do: "mb-10"
  defp wrapper_margin(:bottom), do: "mt-10"
```

- [ ] **Step 4: Add the `position` attr and use it**

Replace `affiliate_unit/1`'s attr line and body. The attrs become:

```elixir
  attr :locale, :map, default: nil
  attr :position, :atom, required: true
```

And the body:

```elixir
  def affiliate_unit(assigns) do
    ~H"""
    <%!-- px-4 matches the horizontal padding every page template applies to its
          own content wrapper (`mx-auto max-w-2xl px-4 py-10`). The layout's
          column has no padding of its own, so without this the unit sits 16px
          wider than the article beside it.

          The vertical margin flips with position: a bottom-placed unit needs
          space above it, a top-placed one needs space below. --%>
    <div :if={render_here?(@locale, @position)} class={["px-4", wrapper_margin(@position)]}>
      <div data-gyg-widget="auto" data-gyg-partner-id={@locale.partner_id} data-gyg-cmp={@locale.cmp}>
      </div>
      <p class="mt-2 text-xs text-zinc-400">
        Tours and activities shown above earn Ethos a commission at no extra cost to you.
      </p>
    </div>
    """
  end
```

Note the `mt-10` that used to sit on the inner widget div is gone — it moved to the wrapper via `wrapper_margin/1`. Do not leave both.

- [ ] **Step 5: Add the second layout slot**

Rewrite `lib/ethos_web/components/layouts/app.html.heex` in full:

```heex
<EthosWeb.Layouts.site_header current_user={@current_user} />
<main class="px-4 py-20 sm:px-6 lg:px-8">
  <div class="mx-auto max-w-2xl">
    <.flash_group flash={@flash} />
    <EthosWeb.Affiliate.affiliate_unit
      position={:top}
      locale={EthosWeb.Affiliate.locale_from_assigns(assigns)}
    />
    {@inner_content}
    <EthosWeb.Affiliate.affiliate_unit
      position={:bottom}
      locale={EthosWeb.Affiliate.locale_from_assigns(assigns)}
    />
  </div>
</main>
```

- [ ] **Step 6: Extend the registry-shape guard**

In `test/ethos_web/affiliate_corpus_test.exs`, inside the `"every configured affiliate locale is well-formed"` test, after the existing `:counties` case block, add:

```elixir
      case Map.fetch(locale, :placement) do
        :error ->
          :ok

        {:ok, placement} ->
          assert placement in [:top, :bottom],
                 "affiliate locale #{inspect(slug)}: :placement is #{inspect(placement)}, " <>
                   "expected :top or :bottom — a value matching neither layout slot renders " <>
                   "no unit at all, silently, on every page in #{inspect(slug)}"
      end
```

- [ ] **Step 7: Run the tests to verify they pass**

Run: `mix test test/ethos_web/affiliate_placement_test.exs test/ethos_web/affiliate_corpus_test.exs`

Expected: PASS, 0 failures.

- [ ] **Step 8: Prove the registry-shape guard can fail**

Temporarily add `placement: :above` to the `"new-york"` entry in `config/config.exs` and run:

Run: `mix test test/ethos_web/affiliate_corpus_test.exs`

Expected: the `"every configured affiliate locale is well-formed"` test FAILS naming `"new-york"` and `:above`. **Remove the line and re-run to confirm green.**

Report the exact failure text. A guard that has never fired is a guard nobody has checked — and this one is the only thing protecting whoever adds Amsterdam.

- [ ] **Step 9: Run the full suite and the formatter**

Run: `mix format && mix test`

Expected: 626 baseline + 4 new, 0 failures, 31 excluded. **New York's existing tests must all still pass unchanged** — if any fail, the default is not `:bottom` and that is the defect, not the tests.

- [ ] **Step 10: Commit**

```bash
git add lib/ethos_web/components/affiliate.ex \
        lib/ethos_web/components/layouts/app.html.heex \
        test/ethos_web/affiliate_corpus_test.exs \
        test/ethos_web/affiliate_placement_test.exs
git commit -m "Add per-locale affiliate placement, defaulting to bottom

Two mutually exclusive layout slots, selected by a locale's :placement
field. The default is :bottom and it is load-bearing: New York's entry is
not edited, and an entry that forgets the field behaves like New York
rather than rendering above the page title.

The ordering assertions are the load-bearing ones. Both placements emit
byte-identical markup, so asserting the widget is present passes the same
either way — position relative to the <h1> is what distinguishes them."
```

---

### Task 2: The Rome locale

**Files:**
- Modify: `lib/ethos/seeds/rome_guide.ex` — `data/0` (around :293) and BOTH `Guide.changeset` call sites (:320 and :372)
- Modify: `config/config.exs` — add the `italy` entry
- Modify: `test/ethos_web/affiliate_placement_test.exs`
- Modify: `test/ethos/seeds/rome_guide_test.exs` — pin `state_slug`

The module is `Ethos.Seeds.RomeGuide` and its entry point is `upsert!(owner_email)`. The placement test file already defines `@script_src`, `@amber` and `@old_disclosure` — use those constants rather than re-typing the strings.

**Interfaces:**
- Consumes: the `placement` field from Task 1. `placement: :top` renders the unit above `{@inner_content}`.
- Produces: nothing consumed by a later task.

**Context:**

`Ethos.Guides.Guide.changeset/2` already casts `:state` and `:county` (`guide.ex:33`) and derives `state_slug` from `state` via `put_geo_slugs/1`. So `state: "Italy"` yields `state_slug: "italy"` with no schema change.

**There are TWO changeset call sites in `rome_guide.ex` and both need the state:**

- `:320`, inside `upsert!/1` — the update path, runs on every seed.
- `:372`, inside `find_or_insert_guide!/1` — the insert path, runs once on a fresh database.

Both currently read `Guide.changeset(%{title: d.title, destination: d.destination})`. Miss either one and the guide's state is correct on some databases and nil on others. **Verify with `grep -n "Guide.changeset" lib/ethos/seeds/rome_guide.ex` that you found both.**

**This makes `/destinations/italy` a new public page.** The destination controller's `show/2` tries `list_published_guides_for_state("italy")` first, which will now return the Rome guide, so the state hub serves. That is expected and is one of the success criteria.

- [ ] **Step 1: Write the failing tests**

Add to `test/ethos_web/affiliate_placement_test.exs`, in a new `describe` block:

```elixir
  describe "the Rome locale" do
    setup do
      user = Ethos.AccountsFixtures.user_fixture()
      Ethos.Seeds.RomeGuide.upsert!(user.email)
      :ok
    end

    test "the Rome guide carries the rome campaign above its title", %{conn: conn} do
      html = conn |> get(~p"/g/three-days-in-rome-real-trip-guide") |> html_response(200)

      assert html =~ @script_src
      assert html =~ ~s(data-gyg-cmp="rome")
      assert html =~ ~s(data-gyg-partner-id="ZA4AIMF")

      widget_at = :binary.match(html, "data-gyg-widget") |> elem(0)
      title_at = :binary.match(html, "<h1") |> elem(0)
      assert widget_at < title_at, "Rome's unit did not render above the page title"

      count = html |> String.split(~s(data-gyg-widget="auto")) |> length() |> Kernel.-(1)
      assert count == 1, "expected exactly one widget div on the Rome guide, got #{count}"
    end

    # Rome is the ONLY guide in the corpus carrying both an affiliate locale and
    # a sponsored per-entry booking link, so it is the only page where this
    # interaction is observable at all.
    test "Rome's amber CTA is gone but its booking link and disclosure survive", %{conn: conn} do
      html = conn |> get(~p"/g/three-days-in-rome-real-trip-guide") |> html_response(200)

      refute html =~ @amber
      assert html =~ ~s(rel="sponsored nofollow noopener")
      assert html =~ @old_disclosure
    end

    test "the Italy state hub serves and carries the widget", %{conn: conn} do
      html = conn |> get(~p"/destinations/italy") |> html_response(200)

      assert html =~ ~s(data-gyg-cmp="rome")
    end

    # New York must not have moved. Asserted on the same run as Rome so a
    # shared-campaign or shared-placement regression cannot hide.
    test "New York is unchanged on the same deploy", %{conn: conn} do
      g =
        published_guide_fixture(%{
          "title" => "Belmont",
          "destination" => "Belmont, New York",
          "state" => "New York",
          "county" => "Bronx"
        })

      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      assert html =~ ~s(data-gyg-cmp="new-york")
      refute html =~ ~s(data-gyg-cmp="rome")

      widget_at = :binary.match(html, "data-gyg-widget") |> elem(0)
      title_at = :binary.match(html, "<h1") |> elem(0)
      assert widget_at > title_at, "New York's unit moved above the title"
    end
  end
```

- [ ] **Step 2: Run the tests to verify they fail**

Run: `mix test test/ethos_web/affiliate_placement_test.exs`

Expected: the Rome tests FAIL — no `data-gyg-cmp="rome"` renders, because the guide has no state and the registry has no `italy` entry. The `/destinations/italy` test fails with a 404. The New York test PASSES already. Report which failed and how.

- [ ] **Step 3: Give the Rome guide a state**

In `lib/ethos/seeds/rome_guide.ex`, add to `data/0`:

```elixir
      state: "Italy",
```

Then update BOTH changeset call sites to pass it. Each currently reads:

```elixir
|> Guide.changeset(%{title: d.title, destination: d.destination})
```

and becomes:

```elixir
|> Guide.changeset(%{title: d.title, destination: d.destination, state: d.state})
```

Run `grep -n "Guide.changeset" lib/ethos/seeds/rome_guide.ex` and confirm you changed every hit.

Then pin the result where the seeder's own test lives. `test/ethos/seeds/rome_guide_test.exs` already asserts `guide.destination_slug == "rome"`; add beside it:

```elixir
    # The affiliate registry is keyed on state_slug. Without this the Rome
    # locale silently never fires, and every affiliate test still passes
    # because they exercise fixtures rather than the seeder.
    assert guide.state_slug == "italy"
```

That assertion belongs there rather than in the placement test file: it is a property of what the seeder writes, and the placement tests would keep passing on their own fixtures if the seeder regressed.

Note `destination_slug` stays `"rome"` — it derives from `destination: "Rome, Italy"`, which is untouched. The existing assertion should not need changing; if it does, something else moved.

Add a comment above `data/0`'s new field:

```elixir
      # Rome's state is what lets the affiliate registry — keyed on state slug —
      # reach it at all. Without it state_slug is nil and locale_for/2 returns
      # nil on its first clause, so no config entry could ever fire. It also
      # makes /destinations/italy serve as a state hub, which is how every other
      # guide's state behaves.
```

- [ ] **Step 4: Add the registry entry**

In `config/config.exs`, add to the `:affiliate_locales` map alongside `"new-york"`:

```elixir
  "italy" => %{
    network: :getyourguide,
    partner_id: "ZA4AIMF",
    cmp: "rome",
    placement: :top
  }
```

With this comment above it:

```elixir
  # Country-level scope with a city campaign code, and those are not in tension:
  # GetYourGuide issues city-scoped codes and there is no "italy" code to use.
  # No :counties key, so every Italian page resolves.
  #
  # The consequence, recorded rather than guarded: when Florence or Venice ship
  # they inherit cmp=rome unless this entry is split first. The fix is the same
  # allowlist mechanism "new-york" uses. It is deliberately not built now — a
  # guard over a one-city corpus guards nothing.
```

- [ ] **Step 5: Run the tests to verify they pass**

Run: `mix test test/ethos_web/affiliate_placement_test.exs`

Expected: PASS, 0 failures.

- [ ] **Step 6: Run the full suite and the formatter**

Run: `mix format && mix test`

Expected: 0 failures.

**Watch for breakage in `test/ethos/seeds/rome_guide_test.exs` and `test/ethos_web/controllers/guide_seo_test.exs`** — the Rome guide is exercised by both, and it now renders a widget where it used to render the amber CTA. If a test breaks because it asserted the amber CTA on the Rome guide, that test now describes old behaviour: **update it, do not delete it**, and name every one you touched in your report. A test that breaks for any other reason means the change is wrong.

Also check `test/ethos_web/controllers/sitemap_controller_test.exs` — `/destinations/italy` is a new URL and the sitemap derives destinations from published guides.

- [ ] **Step 7: Commit**

```bash
git add lib/ethos/seeds/rome_guide.ex config/config.exs \
        test/ethos_web/affiliate_placement_test.exs test/ethos/seeds/rome_guide_test.exs
git commit -m "Give Rome a state and add the italy affiliate locale

The registry is keyed on state slug and rome_guide.ex set no state, so
state_slug was nil and locale_for/2 returned nil on its first clause — no
config entry could ever have fired. Both changeset call sites now carry
it, the update path and the insert path, because missing either leaves
the state correct on some databases and nil on others.

Side effect, intended: /destinations/italy now serves as a state hub with
one guide on it.

Rome is the only guide carrying both an affiliate locale and a sponsored
per-entry booking link, so it is the only page where that interaction is
observable — its booking link and the booking-link disclosure are both
asserted to survive."
```

---

## Self-Review

**1. Spec coverage.**

| Spec section | Task |
|---|---|
| Rome gets a state | 2 (Step 3) |
| `/destinations/italy` side effect | 2 (Step 3 comment, Step 1 test, Step 6 sitemap check) |
| The registry entry, no county guard | 2 (Step 4) |
| `cmp: "rome"` with country scope, and the Florence consequence | 2 (Step 4 comment) |
| Per-locale placement, default `:bottom` | 1 (Steps 3, 4, 5) |
| Margin flips with placement | 1 (Steps 3, 4) |
| `unit_renders?/1` stays placement-agnostic | 1 (Context block — explicitly do not touch) |
| One-unit-per-page invariant at both placements | 1 (Step 1 test), 2 (Step 1 test) |
| Registry-shape guard extended to `placement` | 1 (Step 6), proved by mutation (Step 8) |
| Ordering assertions rather than presence | 1 and 2, both Step 1 |
| Rome's amber CTA gone, booking link + disclosure survive | 2 (Step 1) |
| New York unchanged | 1 (Step 9), 2 (Step 1 test on the same run) |
| Top placement renders above the `<h1>` | 1 (Step 1 test asserts exactly this) |

No gaps.

**2. Placeholder scan.** No TBD/TODO, no "similar to Task N", no "add appropriate error handling". Every function and line reference was checked against source before this plan was committed: `renders?/1` (`affiliate.ex:134`), `Guide.changeset`'s cast list (`guide.ex:33`), both Rome changeset call sites (`rome_guide.ex:320` and `:372`), the `<h1>` (`guide_html/show.html.heex:5`), and the registry-shape test (`affiliate_corpus_test.exs:77`).

**3. Type consistency.** `placement/1` takes a locale map and returns an atom; `render_here?/2` takes `(locale, position)` in that order and is called only from the component with `(@locale, @position)`. `wrapper_margin/1` is defined for exactly the two values `placement/1` can return. `affiliate_unit/1`'s `position` attr is `required: true`, and both layout call sites pass it — a third call site that forgot would fail at compile time, which is the desired direction.

**Three things I fixed while reviewing:**

- Task 1's Step 4 originally left `mt-10` on the inner widget div while also adding `wrapper_margin/1` to the outer div, which would have double-spaced every bottom-placed unit. The step now says explicitly that the old class is removed and not to leave both.
- Task 2's tests re-typed `"Planning your own trip?"` and `"Some booking links on this page"` as literals when the test file already defines them as `@amber` and `@old_disclosure`. A reviewer would flag the duplication, and a literal that drifts from its constant is a test that silently stops checking the same thing.
- Task 2 pinned nothing about the seeder itself. Every affiliate test uses fixtures, so if `rome_guide.ex` regressed and stopped writing `state`, all of them would keep passing and the locale would silently never fire in production. The `state_slug == "italy"` assertion now lives in `rome_guide_test.exs`, which is the only test that exercises the seeder.

**Also checked and found sound, so no change:** `destination_slug` stays `"rome"` after adding the state, because it derives from `destination: "Rome, Italy"` — so `rome_guide_test.exs`'s existing `destination_slug` assertion does not need touching, and if it breaks, something other than this plan moved.
