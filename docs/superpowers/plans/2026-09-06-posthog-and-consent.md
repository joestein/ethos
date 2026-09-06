# PostHog and Consent Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Product analytics on every public page, gated on a consent signal that keeps AdSense compliant in the EEA and the UK, with a privacy policy describing what the site collects.

**Architecture:** Google's certified CMP renders the banner and handles AdSense itself. We write a consent *reader* — one JS module exporting one promise, resolved on TCF Purpose 1 or when the CMP reports the visitor out of scope. PostHog and GetYourGuide are both injected only after it resolves. The PostHog key reaches the browser as a `<meta>` tag rendered only when configured, so dev and test render nothing.

**Tech Stack:** Elixir 1.18, Phoenix 1.7.14, esbuild (no npm — it resolves from Elixir deps, so third-party JS loads from a CDN), PostHog `posthog-js` via CDN, IAB TCF v2 `__tcfapi`.

**Spec:** `docs/superpowers/specs/2026-09-06-posthog-and-consent-design.md`

## Global Constraints

- **The key never enters the repository.** `.env.example` documents the name only. A test greps the tree for `phc_` and fails if it appears.
- **Dev and test set no key**, so the meta tag renders nothing and no events are sent. The failure direction is silence, never pollution.
- **No timeout on the consent promise.** A timeout that resolves on expiry treats "no answer yet" as consent; one that rejects is what already happens. It waits.
- **PostHog and GetYourGuide load only after consent resolves.** Neither is a plain `<script>` tag in the head any more.
- **AdSense is NOT gated by our code** — the certified CMP handles it. Do not add a consent check around the AdSense script.
- **`/foliage/embed` gets no analytics.** It calls `put_root_layout(false)`; nothing in the head reaches it, and that is correct — it runs inside other people's sites.
- **The CMP is configured in Google's AdSense dashboard, outside this repo.** Until that is done the signal never arrives and PostHog stays dark, with no error.
- Never use bare `git stash` — the stash stack is shared with other worktrees.
- Work in `/Users/charmalloc/dev/ethos/.claude/worktrees/posthog-analytics` on branch `posthog-analytics`. Do not `cd` elsewhere.
- Run tests as `MIX_TEST_PARTITION=_posthog mix test` after Task 1 creates that database. The shared `ethos_test` database is written by other worktrees.

---

### Task 1: Configuration, secrets, and the guard that keeps the key out

**Files:**
- Modify: `config/runtime.exs` (after the `GOOGLE_SITE_VERIFICATION` block, ~line 21-23)
- Modify: `.env.example`
- Test: `test/ethos/posthog_config_test.exs` (create)

**Interfaces:**
- Produces: `Application.get_env(:ethos, :posthog_public_key)` — a `String.t()` in production when `POSTHOG_PUBLIC_KEY` is set, `nil` everywhere else. Tasks 3 and 4 read it.

- [ ] **Step 1: Create the isolated test database**

The shared `ethos_test` database is written by other worktrees on this machine, and a migration from one of them has broken this suite before. `config/test.exs` already interpolates `MIX_TEST_PARTITION` into the database name, so this costs one command:

```bash
MIX_TEST_PARTITION=_posthog MIX_ENV=test mix ecto.create
MIX_TEST_PARTITION=_posthog MIX_ENV=test mix ecto.migrate
MIX_TEST_PARTITION=_posthog mix test
```

Expected: the suite passes. Use that prefix for every test command from here on.

- [ ] **Step 2: Write the failing test**

Create `test/ethos/posthog_config_test.exs`:

```elixir
defmodule Ethos.PostHogConfigTest do
  use ExUnit.Case, async: true

  @doc_key "phc_"

  test "no committed file contains a PostHog project key" do
    # phc_ keys are public client keys and appear in production page source
    # regardless, so this is not about secrecy — it is about the key reaching
    # production through `fly secrets` rather than through a paste into a file
    # nobody re-reads. A key committed here would be the one in the repo
    # forever, including after it is rotated.
    root = Path.expand("../..", __DIR__)

    {out, _} =
      System.cmd("git", ["grep", "-l", @doc_key], cd: root, stderr_to_stdout: true)

    offenders =
      out
      |> String.split("\n", trim: true)
      # This test file names the prefix in order to search for it.
      |> Enum.reject(&String.ends_with?(&1, "posthog_config_test.exs"))

    assert offenders == [],
           "a PostHog key is committed in: #{Enum.join(offenders, ", ")}"
  end

  test "the key is unset in test, so nothing is sent" do
    # The default that matters. If this ever fails, the test suite is firing
    # events into a real PostHog project.
    assert Application.get_env(:ethos, :posthog_public_key) == nil
  end
end
```

- [ ] **Step 3: Run it**

Run: `MIX_TEST_PARTITION=_posthog mix test test/ethos/posthog_config_test.exs`
Expected: PASS. Both assertions describe the state before any code changes — they are regression guards, not red-first tests, and they are the two things most likely to break silently later.

- [ ] **Step 4: Add the runtime config**

In `config/runtime.exs`, immediately after the `GOOGLE_SITE_VERIFICATION` block that ends around line 23, add:

```elixir
# PostHog product analytics. Read here rather than in config.exs so the key
# comes from the environment on every deploy target and from nowhere in dev or
# test — an unset key renders no <meta> tag, so app.js finds nothing to
# initialise and no events are sent. Silence is the correct failure.
#
# phc_-prefixed keys are PUBLIC client keys: they are visible in the page
# source of every production page by design. Keeping this out of the repo is
# deploy discipline, not secrecy.
if posthog_key = System.get_env("POSTHOG_PUBLIC_KEY") do
  config :ethos, :posthog_public_key, posthog_key
end
```

- [ ] **Step 5: Document the variable**

Append to `.env.example`:

```
# PostHog project API key — product analytics (https://posthog.com).
# A phc_-prefixed PUBLIC client key; it ships in page source by design.
# Leave blank in dev unless you want your local clicking in the real project.
POSTHOG_PUBLIC_KEY=
```

- [ ] **Step 6: Run the full suite**

Run: `MIX_TEST_PARTITION=_posthog mix test`
Expected: 0 failures.

- [ ] **Step 7: Commit**

```bash
git add config/runtime.exs .env.example test/ethos/posthog_config_test.exs
git commit -m "feat: read POSTHOG_PUBLIC_KEY from the environment"
```

---

### Task 2: The privacy page and a site footer to reach it from

**Files:**
- Create: `lib/ethos_web/controllers/page_html/privacy.html.heex`
- Modify: `lib/ethos_web/controllers/page_controller.ex`
- Modify: `lib/ethos_web/router.ex:23` (add the route beside `get "/"`)
- Modify: `lib/ethos_web/components/layouts.ex` (add `site_footer/1` beside `site_header/1` at line 31)
- Modify: `lib/ethos_web/components/layouts/app.html.heex` (render the footer after `</main>`)
- Modify: `lib/ethos_web/controllers/page_html/home.html.heex` (render the footer at the end)
- Test: `test/ethos_web/controllers/privacy_test.exs` (create)

**Interfaces:**
- Consumes: nothing from Task 1.
- Produces: the route `~p"/privacy"`, and `EthosWeb.Layouts.site_footer/1` taking no attributes.

**There is no site-wide footer.** `layouts.ex` defines only `site_header/1`; the sole `<footer>` in the repo is inside `guide_html/show.html.heex` and belongs to that page. The spec assumed a footer existed. It does not, so this task builds the smallest one that does the job — and it must be rendered in **two** places, because `home.html.heex` renders with `layout: false` and never passes through `app.html.heex`.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/controllers/privacy_test.exs`:

```elixir
defmodule EthosWeb.PrivacyTest do
  use EthosWeb.ConnCase, async: true

  test "the privacy page renders and names every third party the site loads",
       %{conn: conn} do
    html = conn |> get(~p"/privacy") |> html_response(200)

    # Each of these actually runs on the site. A privacy policy that omits one
    # is worse than none: it is a specific false statement about what the page
    # does, rather than a gap.
    assert html =~ "PostHog"
    assert html =~ "Google AdSense"
    assert html =~ "GetYourGuide"

    # The first-party cookies, which people forget because they are not
    # third-party scripts.
    assert html =~ "session"
    assert html =~ "remember"
  end

  test "the footer links to the privacy page from a guide", %{conn: conn} do
    guide = Ethos.GuidesFixtures.published_guide_fixture()

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ ~s(href="/privacy")
  end

  test "the footer links to the privacy page from the home page", %{conn: conn} do
    # The home page renders with `layout: false` (page_controller.ex), so it
    # never passes through app.html.heex and needs its own footer call. If this
    # fails while the guide test passes, that second call site was dropped.
    html = conn |> get(~p"/") |> html_response(200)

    assert html =~ ~s(href="/privacy")
  end
end
```

- [ ] **Step 2: Run it and watch it fail**

Run: `MIX_TEST_PARTITION=_posthog mix test test/ethos_web/controllers/privacy_test.exs`
Expected: FAIL — no route matches `/privacy`.

- [ ] **Step 3: Add the route**

In `lib/ethos_web/router.ex`, immediately after `get "/", PageController, :home`:

```elixir
    get "/privacy", PageController, :privacy
```

- [ ] **Step 4: Add the controller action**

In `lib/ethos_web/controllers/page_controller.ex`, after `home/2`:

```elixir
  @privacy_title "Privacy"
  @privacy_description "What Ethos collects, which third parties run on the site, and how to refuse them."

  def privacy(conn, _params) do
    render(conn, :privacy,
      page_title: @privacy_title,
      page_meta_description: @privacy_description,
      page_canonical: url(~p"/privacy")
    )
  end
```

- [ ] **Step 5: Write the page**

Create `lib/ethos_web/controllers/page_html/privacy.html.heex`. Write it in the corpus's voice — declarative, specific, no marketing. It must describe what the code actually does, and nothing it does not.

The facts it must state, all of them true of this repo:

- **PostHog** — product analytics: pages viewed, links clicked, browser and approximate location derived from IP. Loaded only after consent where consent is required.
- **Google AdSense** — advertising, and the consent banner itself, which is Google's certified CMP.
- **GetYourGuide** — affiliate links on some destination pages; loaded only after consent.
- **First-party cookies** — a session cookie, and a "remember me" cookie valid for 60 days (`lib/ethos_web/user_auth.ex:9`), set only for signed-in users.
- **How to change your mind** — the CMP banner can be reopened; browsers can clear cookies.
- **Contact** — an email address. Ask the site owner for the right one rather than inventing it; if none is supplied, write "contact the site owner" and flag it in the task report rather than fabricating an address.

Add a dated "last updated" line.

**This is a draft for the site owner to review.** Do not claim it constitutes legal advice, and do not assert compliance with any named regulation — state what the site does and let the owner judge sufficiency.

- [ ] **Step 6: Add the footer component**

In `lib/ethos_web/components/layouts.ex`, after `site_header/1`:

```elixir
  @doc """
  The site footer.

  Rendered from `app.html.heex` AND from `page_html/home.html.heex`, because
  the home page renders with `layout: false` and never passes through the app
  layout. Two call sites, for the same reason `site_header/1` has two.
  """
  def site_footer(assigns) do
    ~H"""
    <footer class="mt-16 border-t border-zinc-100 px-4 py-8 text-sm text-zinc-500 sm:px-6 lg:px-8">
      <div class="mx-auto flex max-w-2xl items-center justify-between">
        <span>Ethos</span>
        <nav class="flex gap-4">
          <.link navigate={~p"/destinations"} class="hover:text-zinc-700">Destinations</.link>
          <.link navigate={~p"/privacy"} class="hover:text-zinc-700">Privacy</.link>
        </nav>
      </div>
    </footer>
    """
  end
```

- [ ] **Step 7: Render it in both places**

In `lib/ethos_web/components/layouts/app.html.heex`, after the closing `</main>`:

```heex
<EthosWeb.Layouts.site_footer />
```

At the very end of `lib/ethos_web/controllers/page_html/home.html.heex`:

```heex
<EthosWeb.Layouts.site_footer />
```

- [ ] **Step 8: Run the tests**

Run: `MIX_TEST_PARTITION=_posthog mix test test/ethos_web/controllers/privacy_test.exs`
Expected: PASS, all three.

- [ ] **Step 9: Run the full suite**

Run: `MIX_TEST_PARTITION=_posthog mix test`
Expected: 0 failures. A site-wide footer is new markup on every page; if a test asserts on page structure it may need updating — report any such failure rather than weakening the assertion.

- [ ] **Step 10: Commit**

```bash
git add lib/ethos_web test/ethos_web/controllers/privacy_test.exs
git commit -m "feat: a privacy page, and a site footer to reach it from"
```

---

### Task 3: The key reaches the browser as a meta tag

**Files:**
- Modify: `lib/ethos_web/components/layouts/root.html.heex` (in `<head>`, after the `google-site-verification` block, ~line 9)
- Test: `test/ethos_web/posthog_meta_test.exs` (create)

**Interfaces:**
- Consumes: `Application.get_env(:ethos, :posthog_public_key)` from Task 1.
- Produces: `<meta name="posthog-key" content="...">` in `<head>` when configured. Task 4's `analytics.js` reads it with `document.querySelector("meta[name='posthog-key']")`.

A meta tag rather than an inline script: the key never lands inside a `<script>` body, there is nothing to escape, and "is the key configured" becomes a server-rendered fact a request test can assert.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/posthog_meta_test.exs`:

```elixir
defmodule EthosWeb.PostHogMetaTest do
  use EthosWeb.ConnCase, async: false

  @key "phc_test_key_not_a_real_project"

  setup do
    original = Application.get_env(:ethos, :posthog_public_key)
    on_exit(fn -> Application.put_env(:ethos, :posthog_public_key, original) end)
    :ok
  end

  test "renders nothing when no key is configured", %{conn: conn} do
    # THE DEFAULT, and the assertion that matters most: dev and test set no
    # key, and this is what stops the suite firing events into a real project.
    Application.put_env(:ethos, :posthog_public_key, nil)

    html = conn |> get(~p"/") |> html_response(200)

    refute html =~ "posthog-key"
  end

  test "renders the key when configured", %{conn: conn} do
    Application.put_env(:ethos, :posthog_public_key, @key)

    html = conn |> get(~p"/") |> html_response(200)

    assert html =~ ~s(name="posthog-key")
    assert html =~ @key
  end

  test "is absent from the embeddable iframe", %{conn: conn} do
    # /foliage/embed calls put_root_layout(false) and runs inside other
    # people's sites. Tracking visitors there is a different act from tracking
    # them here, and it reaches this outcome by a different mechanism from
    # every other page: no layout at all, rather than no key.
    Application.put_env(:ethos, :posthog_public_key, @key)

    html = conn |> get(~p"/foliage/embed") |> html_response(200)

    refute html =~ "posthog-key"
  end
end
```

- [ ] **Step 2: Run it and watch it fail**

Run: `MIX_TEST_PARTITION=_posthog mix test test/ethos_web/posthog_meta_test.exs`
Expected: the "renders the key" test FAILS; the other two pass vacuously.

- [ ] **Step 3: Add the meta tag**

In `lib/ethos_web/components/layouts/root.html.heex`, after the `google-site-verification` block:

```heex
    <%= if key = Application.get_env(:ethos, :posthog_public_key) do %>
      <%!-- The key only. Nothing loads from this tag: assets/js/analytics.js
            reads it and initialises PostHog after consent resolves. Unset in
            dev and test, so nothing renders and nothing is sent. --%>
      <meta name="posthog-key" content={key} />
    <% end %>
```

- [ ] **Step 4: Run the tests**

Run: `MIX_TEST_PARTITION=_posthog mix test test/ethos_web/posthog_meta_test.exs`
Expected: PASS, all three.

- [ ] **Step 5: Run the full suite**

Run: `MIX_TEST_PARTITION=_posthog mix test`
Expected: 0 failures.

- [ ] **Step 6: Commit**

```bash
git add lib/ethos_web/components/layouts/root.html.heex test/ethos_web/posthog_meta_test.exs
git commit -m "feat: render the PostHog key as a meta tag when configured"
```

---

### Task 4: The consent reader, and both scripts behind it

**Files:**
- Create: `assets/js/consent.js`
- Create: `assets/js/analytics.js`
- Modify: `assets/js/app.js` (import `analytics.js` only) — **corrected during execution.** This plan originally put the LiveView pageview handler in `app.js`, beside the existing `phx:page-loading-stop` listener at ~line 34. It went into `assets/js/analytics.js` instead: `app.js` runs unconditionally, so a `posthog.capture` there would sit OUTSIDE the consent gate and fire for visitors who never consented. It belongs inside the `analyticsConsent.then(...)` block with everything else that touches PostHog.
- Modify: `lib/ethos_web/components/affiliate.ex:200-211` (`affiliate_head/1`)
- Modify: `test/ethos_web/affiliate_placement_test.exs` — **corrected during execution.** This plan originally named three test files (`affiliate_placement_test.exs`, `affiliate_corpus_test.exs`, `controllers/guide_seo_test.exs`) as referencing `widget.getyourguide.com`. In fact the string appears in only ONE file, `test/ethos_web/affiliate_placement_test.exs`, three times — the `@script_src` module attribute, defined once in each of that file's three test modules — and those three definitions carry all **16** references that had to change. `affiliate_corpus_test.exs` greps for `"affiliate_unit"` and `"data-gyg"`, not the host; `controllers/guide_seo_test.exs:55` asserts on a per-entry booking link (`www.getyourguide.com/?partner_id=…`), a different mechanism. Neither needed editing.
- Test: `test/ethos_web/affiliate_consent_test.exs` (create)

**Interfaces:**
- Consumes: the meta tag from Task 3.
- Produces: `assets/js/consent.js` exporting `analyticsConsent` — a `Promise<void>` that resolves when analytics storage is permitted and never resolves otherwise.

**This task changes revenue-bearing code.** `affiliate_head/1` currently renders the GetYourGuide script unconditionally wherever a locale resolves — including for EEA/UK visitors, since Rome is an Italian locale and the London boroughs ship. It stops being a `<script>` and becomes a data tag that `analytics.js` acts on after consent.

- [ ] **Step 1: Write the failing test for the affiliate change**

Create `test/ethos_web/affiliate_consent_test.exs`:

```elixir
defmodule EthosWeb.AffiliateConsentTest do
  use EthosWeb.ConnCase, async: false

  import Ethos.GuidesFixtures

  test "the GetYourGuide script is not a plain tag in the head", %{conn: conn} do
    # It sets cookies and loads for EEA/UK visitors — Rome is an Italian
    # locale. A <script src> in the head runs before any consent signal
    # exists, so the tag is replaced by a data element that assets/js/
    # analytics.js acts on only after consent resolves.
    guide = published_guide_fixture(%{state: "Italy", county: "Rome", destination: "Rome, Italy"})

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    refute html =~ "widget.getyourguide.com"
  end

  test "the partner id still reaches the page for the loader to use", %{conn: conn} do
    guide = published_guide_fixture(%{state: "Italy", county: "Rome", destination: "Rome, Italy"})

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ ~s(name="gyg-partner-id")
    assert html =~ "ZA4AIMF"
  end

  test "no partner id where no locale resolves", %{conn: conn} do
    guide = published_guide_fixture(%{state: "Washington", county: "Puget Sound"})

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    refute html =~ "gyg-partner-id"
  end
end
```

- [ ] **Step 2: Run it and watch it fail**

Run: `MIX_TEST_PARTITION=_posthog mix test test/ethos_web/affiliate_consent_test.exs`
Expected: the first two FAIL — the script tag is still there and no meta tag exists.

- [ ] **Step 3: Change `affiliate_head/1`**

Replace the body at `lib/ethos_web/components/affiliate.ex:200-211`:

```elixir
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
```

- [ ] **Step 4: Update the three existing assertions**

Three tests assert on `widget.getyourguide.com`. Find them:

```bash
grep -rn "widget.getyourguide.com" test/
```

Each asserts the script is present in the head. Change each to assert the meta tag instead — `name="gyg-partner-id"` — keeping the surrounding test's intent. Read each test's own comments before editing; several document why the assertion exists.

Do NOT delete any of the three. If one cannot be sensibly rewritten, report it rather than removing it.

- [ ] **Step 5: Write the consent reader**

Create `assets/js/consent.js`:

```js
// The consent reader. Not a consent UI — the banner belongs to Google's
// certified CMP (Funding Choices), which is what makes AdSense compliant in
// the EEA and the UK. This module only listens for its answer.
//
// Exports one promise. It resolves when analytics storage is permitted, and
// never resolves otherwise.
//
// NO TIMEOUT, deliberately. A timeout that resolves on expiry would load
// PostHog for a visitor whose CMP was merely slow — treating "no answer yet"
// as consent. A timeout that rejects is indistinguishable from never
// resolving, which is already what happens. So it waits.

// TCF Purpose 1: "Store and/or access information on a device". This is the
// purpose PostHog's cookies actually need; the analytics-flavoured purposes
// (8, 9) describe measurement, not storage.
const STORAGE_PURPOSE = 1

export const analyticsConsent = new Promise((resolve) => {
  const listen = () => {
    if (typeof window.__tcfapi !== "function") return false

    window.__tcfapi("addEventListener", 2, (data, success) => {
      if (!success || !data) return

      // Outside the framework's scope — most non-EEA/UK traffic. No banner is
      // shown and none is required, so analytics may load immediately.
      if (data.gdprApplies === false) return resolve()

      // Wait until the visitor has actually answered.
      if (data.eventStatus !== "useractioncomplete" && data.eventStatus !== "tcloaded") return

      if (data.purpose && data.purpose.consents && data.purpose.consents[STORAGE_PURPOSE]) {
        resolve()
      }
    })

    return true
  }

  if (listen()) return

  // The CMP script may not have defined __tcfapi yet. Poll until it does; the
  // promise simply stays pending if it never arrives, which is the intended
  // behaviour when no CMP is configured.
  const timer = setInterval(() => {
    if (listen()) clearInterval(timer)
  }, 250)
})
```

- [ ] **Step 6: Write the loader**

Create `assets/js/analytics.js`:

```js
// Loads PostHog and the GetYourGuide widget, both only after consent.
//
// Neither is bundled: this project has no package.json — esbuild resolves
// imports from Elixir deps via NODE_PATH — so third-party JS comes from a CDN.
// That suits the gating anyway: nothing is fetched until consent resolves.

import { analyticsConsent } from "./consent.js"

const injectScript = (src, attrs = {}) => {
  const el = document.createElement("script")
  el.src = src
  el.async = true
  Object.entries(attrs).forEach(([k, v]) => el.setAttribute(k, v))
  document.head.appendChild(el)
  return el
}

const posthogKey = () => {
  const tag = document.querySelector("meta[name='posthog-key']")
  return tag && tag.getAttribute("content")
}

const gygPartnerId = () => {
  const tag = document.querySelector("meta[name='gyg-partner-id']")
  return tag && tag.getAttribute("content")
}

analyticsConsent.then(() => {
  const key = posthogKey()

  if (key) {
    // The official snippet, reduced to what is used here. It defines a queue
    // so posthog.capture works before the library finishes loading.
    !(function (t, e) {
      var o, n, p, r
      e.__SV ||
        ((window.posthog = e),
        (e._i = []),
        (e.init = function (i, s, a) {
          function g(t, e) {
            var o = e.split(".")
            2 == o.length && ((t = t[o[0]]), (e = o[1]))
            t[e] = function () {
              t.push([e].concat(Array.prototype.slice.call(arguments, 0)))
            }
          }
          ;(p = t.createElement("script")).type = "text/javascript"
          p.async = !0
          p.src = s.api_host + "/static/array.js"
          ;(r = t.getElementsByTagName("script")[0]).parentNode.insertBefore(p, r)
          var u = e
          for (
            void 0 !== a ? (u = e[a] = []) : (a = "posthog"),
              u.people = u.people || [],
              u.toString = function (t) {
                var e = "posthog"
                return "posthog" !== a && (e += "." + a), t || (e += " (stub)"), e
              },
              u.people.toString = function () {
                return u.toString(1) + ".people (stub)"
              },
              o =
                "capture identify alias people.set people.set_once set_config register register_once unregister opt_out_capturing has_opted_out_capturing opt_in_capturing reset".split(
                  " "
                ),
              n = 0;
            n < o.length;
            n++
          )
            g(u, o[n])
          e._i.push([i, s, a])
        }),
        (e.__SV = 1))
    })(document, window.posthog || [])

    window.posthog.init(key, {
      api_host: "https://us.i.posthog.com",
      // Pageviews are captured explicitly below, including on LiveView
      // navigation, which autocapture does not see.
      capture_pageview: false
    })

    window.posthog.capture("$pageview")

    // LiveView patches the DOM without a full page load, so the library's own
    // pageview detection never fires. This is the authoring and account
    // screens, plus any live navigation between public pages.
    window.addEventListener("phx:page-loading-stop", (info) => {
      if (info.detail && info.detail.kind === "initial") return
      window.posthog.capture("$pageview")
    })
  }

  const partnerId = gygPartnerId()

  if (partnerId) {
    injectScript("https://widget.getyourguide.com/dist/pa.umd.production.min.js", {
      "data-gyg-partner-id": partnerId
    })
  }
})
```

- [ ] **Step 7: Wire it into app.js**

In `assets/js/app.js`, after the `import topbar` line:

```js
import "./analytics.js"
```

- [ ] **Step 8: Confirm the bundle builds**

Run: `mix assets.build`
Expected: no errors. This is the only check the JS gets from the toolchain — esbuild will fail loudly on a syntax error and silently on a logic one.

- [ ] **Step 9: Run the tests**

Run: `MIX_TEST_PARTITION=_posthog mix test`
Expected: 0 failures, including the three rewritten affiliate assertions.

- [ ] **Step 10: Commit**

```bash
git add assets lib/ethos_web/components/affiliate.ex test/
git commit -m "feat: load PostHog and GetYourGuide only after consent"
```

---

### Task 5: Deploy, and verify against the real CMP

**Files:** none created or modified.

**Interfaces:**
- Consumes: everything above.

**Push and deploy are outward-facing, and this touches live ad revenue on every page. Ask before each.**

The order below is load-bearing. The CMP must exist before the code that waits for it, or PostHog ships dark with no error.

- [ ] **Step 1: Confirm the suite is green**

Run: `MIX_TEST_PARTITION=_posthog mix test`
Expected: 0 failures.

- [ ] **Step 2: The site owner enables the CMP**

In the AdSense dashboard: Privacy & messaging → European regulations → create and publish a GDPR message. Set its privacy-policy URL to `https://ethosguides.com/privacy`.

**Enable a revocation entry point on that message** — the control that lets a visitor reopen the banner and change their answer. This is not optional polish: `/privacy` tells readers "the consent banner can be reopened", and nothing in this repository can make that true. It is the one sentence on that page whose truth lives entirely in this dashboard. Google's TCF policy requires withdrawal to be possible, so the control exists; it has to be turned on.

**This cannot be done from this repo.** Report to the user that it is needed and wait — do not deploy first.

- [ ] **Step 3: Set the production secret**

```bash
fly secrets set POSTHOG_PUBLIC_KEY=<the phc_ key>
```

Setting a secret restarts the app. Do this BEFORE deploying the code, so the first deploy carrying the meta tag already has a key to render.

- [ ] **Step 4: Ask, then push**

```bash
git push origin HEAD:main
```

If the remote has moved, merge rather than rebase and re-run the suite. Other worktrees on this machine push to the same branch.

- [ ] **Step 5: Ask, then deploy**

```bash
fly deploy --now
```

- [ ] **Step 6: Verify against the real CMP**

The consent handshake has no automated coverage. Run this in a browser, once with an EEA/UK VPN and once without. **Do step 6a first** — it is the revenue check:

- **6a. AdSense still renders** in every state below. If ads have stopped, stop and roll back.
- **6b. Outside the EEA/UK** — no banner appears, and a PostHog request goes out on page load.
- **6c. Inside, before answering** — no PostHog request, no GetYourGuide script. The banner is showing.
- **6d. Inside, after accepting** — both load; the pageview arrives in PostHog. **Do this twice: once accepting immediately, and once after leaving the banner untouched for a minute or two.** The GetYourGuide widget used to be an `async` script in `<head>`, so it always ran shortly after parse; it is now injected whenever consent arrives, which may be minutes later. Whether its bundle still finds and hydrates the server-rendered `[data-gyg-widget]` element that late cannot be established without a browser, and it is the revenue path. If the widget renders on the immediate accept but not the delayed one, stop — that is a real regression and not a quirk of your session.
- **6e. Inside, after declining** — neither loads, and no PostHog request is made for the rest of the session.
- **6f. LiveView navigation** — open a guide, navigate to the editor, and confirm a second `$pageview`.
- **6g. `/foliage/embed`** — no `posthog-key` meta tag in the source.
- **6h. The banner can be reopened.** After declining in 6e, find the revocation control and change the answer to accept; confirm PostHog then loads. `/privacy` states that this is possible, and this is the only check that makes that sentence true. If no control appears, the revocation entry point was not enabled in Step 2 — go back and enable it rather than editing the page.

- [ ] **Step 7: Report what you saw**

Report the result of each check to the user. If PostHog is dark, check in this order: the Fly secret is set (`fly secrets list`), the meta tag is in the page source, and the CMP is actually published in AdSense.

**If 6a and 6c–6e pass but 6b fails — PostHog dark outside the EEA/UK while everything inside works — stop and read this. It is the branch's single largest exposure and it does not look like a bug.**

The entire non-EEA path rests on one line of `consent.js`: `if (data.gdprApplies === false) return resolve()`. For a US visitor that line is the *only* way the promise ever settles, and reaching it requires the CMP to publish `__tcfapi` **and fire a TCF event for a visitor it considers out of scope.** Google's Funding Choices serves the GDPR message to EEA/UK users; there is no guarantee it installs the TCF API at all for everyone else. If it does not, `__tcfapi` never appears, the bounded poller gives up after 30 seconds, the promise stays pending forever, and PostHog is dark for what is probably most of the traffic. Nothing errors. The console is clean, the suite is green, ads still render, and every EEA check above passes. **6b is the only signal this failure ever produces** — which is why it is a step and not a nice-to-have.

The cause is not in this repository and the fix is not either. The remedy is a **CMP or region configuration change in the AdSense dashboard**: configure Funding Choices so the TCF API is served to all regions (so out-of-scope visitors receive a payload carrying `gdprApplies: false`), or serve a message to the non-EEA regions as well. Re-run 6b after the change propagates.

**The remedy is NOT a resolve-on-timeout in `consent.js`, and it is not any other change to `consent.js`.** It is the obvious fix, it is a two-line diff, it will appear to work immediately, and it is wrong. Resolving when the CMP has not answered means treating "nobody asked this visitor anything" as "this visitor consented" — for EEA visitors too, since the same timer runs for everyone and cannot tell a US visitor from a European one whose CMP was merely slow or blocked by an ad blocker. That single change silently converts every non-answer on the site into consent and defeats the whole branch. `consent.js` carries three separate comments saying so; if you are reading this under time pressure, this is the paragraph they were written for. Change the dashboard, not the file.

---

## Self-Review

**1. Spec coverage.** Every spec section maps to a task. The CMP → Task 5 Step 2 (and named as out-of-repo in the Global Constraints). `consent.js` → Task 4. PostHog including LiveView pageviews → Tasks 3 and 4. GetYourGuide gating → Task 4. `/privacy` → Task 2. Configuration and secrets → Tasks 1 and 5. The spec's four ExUnit-testable items → Tasks 1, 2, 3 and 4. The spec's six-step manual checklist → Task 5 Step 6, reordered to put the AdSense revenue check first. Risks → the Global Constraints and Task 5's ordering.

**Gap found and fixed:** the spec says the privacy page is "linked from the site footer". There is no site footer — `layouts.ex` defines only `site_header/1`, and the repo's one `<footer>` belongs to the guide template. Task 2 now builds one and renders it in both required places.

**2. Placeholder scan.** No TBD, TODO, "similar to Task N", or "add appropriate error handling". Every code step carries real code. Task 2 Step 5 specifies the privacy page's required facts rather than its prose, which is deliberate: the wording is drafting work, and the enumerated facts are what makes it checkable.

**3. Type consistency.** `Application.get_env(:ethos, :posthog_public_key)` is set in Task 1 and read in Task 3. The meta name `posthog-key` is rendered in Task 3 and queried in Task 4. `gyg-partner-id` is rendered and queried inside Task 4. `analyticsConsent` is exported by `consent.js` and imported by `analytics.js`, both in Task 4. `site_footer/1` is defined and called in Task 2. `MIX_TEST_PARTITION=_posthog` is created in Task 1 Step 1 and used by every later test command.
