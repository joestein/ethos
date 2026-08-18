# SEO Guide Pages + Affiliate Booking Links Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make published guides SEO-ranking, affiliate-earning pages (intro/sections/FAQ + JSON-LD + destination hubs + sitemap + native booking CTAs), seeded with the founder's real 3-day Rome guide, deployed to Fly.

**Architecture:** Extends the deployed Ethos v1 app. New columns on `guides`/`entries`, markdown rendering via Earmark, new `DestinationController` + `SitemapController`, additions to the public guide page and `GuideLive.Edit`, and an idempotent seeding function in `Ethos.Release` (mix task wrapper for dev).

**Tech Stack:** Existing Phoenix 1.7 app + `{:earmark, "~> 1.4"}`. Postgres via `docker compose` (port 54329).

**Spec:** `docs/superpowers/specs/2026-08-18-seo-affiliate-pages-design.md`

## Global Constraints

- **Content policy (binding):** no fabricated first-person experiences. The seed content in Task 7 is the canonical text — transcribe it verbatim; do not invent additional anecdotes, review quotes, or place names.
- Affiliate CTA links render with exactly `rel="sponsored nofollow noopener"` and `target="_blank"`, only when `EthosWeb.Url.safe_http?/1` passes.
- Disclosure line, exact text: `Some booking links on this page earn Ethos a commission at no extra cost to you.` Rendered iff any rendered entry has a valid `booking_url`.
- GetYourGuide link, exact: `https://www.getyourguide.com/rome-l33/rome-colosseum-gladiator-floor-access-roman-forum-tour-t633431/?partner_id=ZA4AIMF&currency=USD&travel_agent=1&cmp=share_to_earn`
- Viator link, exact: `https://www.viator.com/tours/Rome/Skip-the-Line-Group-Tour-of-the-Vatican-Sistine-Chapel-and-St-Peters-Basilica/d511-120123P3`
- Roman Guy link, exact: `https://theromanguy.com/tours/italy/rome/colosseum-tour-arena-floor`
- Rome guide slug, fixed: `three-days-in-rome-real-trip-guide`. Production owner email: `cryptcom@gmail.com` (already registered in prod — attach, don't create; dev may create the account).
- The codebase has evolved past its v1 plan (review fixes). **Read each file you modify before editing**; the code blocks below are the required end-state for NEW code, and precise insertions for existing files — adapt surrounding details (aliases, assigns) to what's actually there.
- `mix test` green before every commit. No new compile warnings.

---

### Task 1: Migrations, schema fields, slug derivation

**Files:**
- Create: `priv/repo/migrations/*_add_seo_fields.exs`
- Modify: `lib/ethos/guides/guide.ex`, `lib/ethos/guides/entry.ex`, `lib/ethos/guides.ex`, `mix.exs` (earmark dep)
- Test: `test/ethos/seo_fields_test.exs`

**Interfaces:**
- Consumes: existing `Guide`/`Entry` schemas and changesets.
- Produces: `guides.intro :text`, `guides.sections :jsonb ([%{"heading","body"}])`, `guides.faq :jsonb ([%{"question","answer"}])`, `guides.destination_slug :string` (indexed, derived on changeset when destination set); `entries.booking_url`, `entries.booking_label`; public entry changeset casts + validates booking fields (http/https only); `Guides.update_guide_seo(guide, attrs)` casting intro/sections/faq; `Ethos.Guides.Guide.derive_destination_slug/1`; `Guides.list_destinations/0` and `Guides.list_published_guides_for_destination/1` (used by Task 4); `Guides.list_published_guides/0` (used by Task 5).

- [ ] **Step 1: Add dep and write the failing test**

In `mix.exs` deps add `{:earmark, "~> 1.4"},` then `mix deps.get`.

`test/ethos/seo_fields_test.exs`:

```elixir
defmodule Ethos.SeoFieldsTest do
  use Ethos.DataCase, async: true

  alias Ethos.Guides
  import Ethos.GuidesFixtures

  test "destination_slug derives from destination on create and update" do
    guide = guide_fixture(%{destination: "Rome, Italy"})
    assert guide.destination_slug == "rome"

    {:ok, guide} = Guides.update_guide(guide, %{destination: "San Sebastián, Spain"})
    assert guide.destination_slug == "san-sebasti-n"
  end

  test "update_guide_seo/2 stores intro, sections, faq" do
    guide = guide_fixture()

    {:ok, guide} =
      Guides.update_guide_seo(guide, %{
        intro: "Three **real** days in Rome.",
        sections: [%{"heading" => "Getting around", "body" => "Walk. Everything is close."}],
        faq: [%{"question" => "How many days?", "answer" => "Three is enough for the center."}]
      })

    assert guide.intro =~ "real"
    assert [%{"heading" => "Getting around"}] = guide.sections
    assert [%{"question" => "How many days?"}] = guide.faq
  end

  test "entry booking_url must be http(s)" do
    guide = guide_fixture()

    {:ok, entry} =
      Guides.create_entry(guide, %{
        kind: "tour", name: "Arena floor", verdict: "loved",
        booking_url: "https://example.com/t/1", booking_label: "Book it"
      })

    assert entry.booking_url == "https://example.com/t/1"

    {:error, changeset} =
      Guides.create_entry(guide, %{kind: "tour", name: "Bad", booking_url: "javascript:alert(1)"})

    assert %{booking_url: _} = errors_on(changeset)
  end

  test "destination listing helpers" do
    g = published_guide_fixture(%{destination: "Rome, Italy"})
    _draft = guide_fixture(%{destination: "Rome, Italy"})
    _other = published_guide_fixture(%{destination: "Tokyo, Japan"})

    dests = Guides.list_destinations()
    assert %{slug: "rome", name: "Rome", count: 1} in dests
    assert %{slug: "tokyo", name: "Tokyo", count: 1} in dests

    assert [%{id: id}] = Guides.list_published_guides_for_destination("rome")
    assert id == g.id
    assert length(Guides.list_published_guides()) == 2
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/seo_fields_test.exs`
Expected: FAIL (unknown fields/functions).

- [ ] **Step 3: Migration + schema/context changes**

`mix ecto.gen.migration add_seo_fields`:

```elixir
defmodule Ethos.Repo.Migrations.AddSeoFields do
  use Ecto.Migration

  def change do
    alter table(:guides) do
      add :intro, :text
      add :sections, {:array, :map}
      add :faq, {:array, :map}
      add :destination_slug, :string
    end

    alter table(:entries) do
      add :booking_url, :string
      add :booking_label, :string
    end

    create index(:guides, [:destination_slug])

    execute(
      """
      UPDATE guides SET destination_slug =
        trim(both '-' from regexp_replace(lower(split_part(destination, ',', 1)), '[^a-z0-9]+', '-', 'g'))
      """,
      ""
    )
  end
end
```

In `lib/ethos/guides/guide.ex`: add fields `intro :string`, `sections {:array, :map}`, `faq {:array, :map}`, `destination_slug :string` to the schema. Add public helper + hook into the existing changeset pipeline (after destination cast):

```elixir
def derive_destination_slug(destination) when is_binary(destination) do
  destination
  |> String.split(",")
  |> List.first()
  |> String.downcase()
  |> String.replace(~r/[^a-z0-9]+/, "-")
  |> String.trim("-")
end

defp put_destination_slug(changeset) do
  case get_field(changeset, :destination) do
    nil -> changeset
    destination -> put_change(changeset, :destination_slug, derive_destination_slug(destination))
  end
end
```

Append `|> put_destination_slug()` to `changeset/2` (before `unique_constraint`). Add a separate SEO changeset:

```elixir
def seo_changeset(guide, attrs) do
  guide
  |> cast(attrs, [:intro, :sections, :faq])
  |> validate_length(:intro, max: 10_000)
end
```

In `lib/ethos/guides/entry.ex`: add `booking_url`/`booking_label` fields; add both to the PUBLIC `changeset/2` cast list (owners set them via UI) and:

```elixir
|> validate_change(:booking_url, fn :booking_url, url ->
  if EthosWeb.Url.safe_http?(url), do: [], else: [booking_url: "must be an http(s) URL"]
end)
|> validate_length(:booking_label, max: 80)
```

(If `EthosWeb.Url.safe_http?/1` rejects `nil`, only run the check when url is non-nil.) Note: referencing an `EthosWeb` module from `Ethos` is a layering smell — if you prefer, move `safe_http?/1` to a new `Ethos.Url` module and delegate from `EthosWeb.Url`; update callers found by grep. Either way, one shared implementation.

In `lib/ethos/guides.ex`:

```elixir
def update_guide_seo(%Guide{} = guide, attrs) do
  guide |> Guide.seo_changeset(attrs) |> Repo.update()
end

def list_published_guides do
  Repo.all(from g in Guide, where: g.status == "published", order_by: [desc: g.updated_at])
end

def list_published_guides_for_destination(slug) do
  Repo.all(
    from g in Guide,
      where: g.status == "published" and g.destination_slug == ^slug,
      order_by: [desc: g.view_count, desc: g.id]
  )
end

def list_destinations do
  Repo.all(
    from g in Guide,
      where: g.status == "published",
      group_by: [g.destination_slug, fragment("split_part(?, ',', 1)", g.destination)],
      select: %{
        slug: g.destination_slug,
        name: fragment("split_part(?, ',', 1)", g.destination),
        count: count(g.id)
      },
      order_by: [desc: count(g.id)]
  )
end
```

Run: `mix ecto.migrate`

- [ ] **Step 4: Run tests to verify they pass**

Run: `mix test test/ethos/seo_fields_test.exs && mix test`
Expected: PASS, full suite green.

- [ ] **Step 5: Commit**

```bash
git add -A && git commit -m "feat: SEO fields, booking links, destination slugs"
```

---

### Task 2: Markdown rendering helper

**Files:**
- Create: `lib/ethos_web/markdown.ex`
- Test: `test/ethos_web/markdown_test.exs`

**Interfaces:**
- Produces: `EthosWeb.Markdown.render(md_or_nil) :: Phoenix.HTML.safe()` — Earmark with escaping on; nil/"" → empty safe string. Used by Tasks 3/4.

- [ ] **Step 1: Failing test**

`test/ethos_web/markdown_test.exs`:

```elixir
defmodule EthosWeb.MarkdownTest do
  use ExUnit.Case, async: true

  import Phoenix.HTML, only: [safe_to_string: 1]

  test "renders markdown to safe html" do
    html = safe_to_string(EthosWeb.Markdown.render("Three **real** days"))
    assert html =~ "<strong>real</strong>"
  end

  test "escapes raw html" do
    html = safe_to_string(EthosWeb.Markdown.render("hi <script>alert(1)</script>"))
    refute html =~ "<script>"
  end

  test "nil and empty render as empty" do
    assert safe_to_string(EthosWeb.Markdown.render(nil)) == ""
    assert safe_to_string(EthosWeb.Markdown.render("")) == ""
  end
end
```

- [ ] **Step 2: Run to verify failure** — `mix test test/ethos_web/markdown_test.exs`

- [ ] **Step 3: Implement**

```elixir
defmodule EthosWeb.Markdown do
  @moduledoc "Server-side markdown rendering for guide prose. Escapes raw HTML."

  def render(nil), do: {:safe, ""}
  def render(""), do: {:safe, ""}

  def render(markdown) when is_binary(markdown) do
    case Earmark.as_html(markdown, escape: true) do
      {:ok, html, _} -> {:safe, html}
      {:error, html, _} -> {:safe, html}
    end
  end

  @doc "Plain-text excerpt for meta descriptions."
  def excerpt(nil, _max), do: nil

  def excerpt(markdown, max) do
    markdown
    |> String.replace(~r/[#*_>\[\]()`]/, "")
    |> String.replace(~r/\s+/, " ")
    |> String.trim()
    |> String.slice(0, max)
  end
end
```

Verify Earmark's option name for escaping against the installed version (`mix hex.docs` or deps source): if `escape: true` is not the current API, use the equivalent (`Earmark.Options` `escape`/`smartypants` — the requirement is: raw HTML in input must not pass through unescaped). The test is the contract.

- [ ] **Step 4: Run tests** — focused then `mix test`. Expected: PASS.
- [ ] **Step 5: Commit** — `git add -A && git commit -m "feat: markdown rendering helper"`

---

### Task 3: Guide page — intro/sections/FAQ/CTAs/disclosure/JSON-LD

**Files:**
- Modify: `lib/ethos_web/controllers/guide_controller.ex`, `lib/ethos_web/controllers/guide_html.ex`, `lib/ethos_web/controllers/guide_html/show.html.heex`, root layout (head block)
- Test: `test/ethos_web/controllers/guide_seo_test.exs`

**Interfaces:**
- Consumes: Task 1 fields, Task 2 `Markdown.render/1` + `excerpt/2`, existing `@page_og`, `EthosWeb.Url.safe_http?/1`.
- Produces: assigns `@page_meta_description`, `@page_canonical`, `@json_ld` (list of maps) rendered in the root layout head; CTA card + disclosure on the guide page.

- [ ] **Step 1: Failing test**

`test/ethos_web/controllers/guide_seo_test.exs`:

```elixir
defmodule EthosWeb.GuideSeoTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Guides

  @gyg "https://www.getyourguide.com/rome-l33/rome-colosseum-gladiator-floor-access-roman-forum-tour-t633431/?partner_id=ZA4AIMF&currency=USD&travel_agent=1&cmp=share_to_earn"

  defp seo_guide do
    guide = published_guide_fixture(%{title: "Three Days", destination: "Rome, Italy"})

    {:ok, guide} =
      Guides.update_guide_seo(guide, %{
        intro: "Three **real** days in Rome, from the arena floor to Monti.",
        sections: [%{"heading" => "Getting around", "body" => "Walk everywhere."}],
        faq: [%{"question" => "Worth it?", "answer" => "Yes."}]
      })

    {:ok, _} =
      Guides.create_entry(guide, %{
        kind: "tour", name: "Colosseum arena floor", verdict: "loved",
        booking_url: @gyg, booking_label: "Book the arena-floor tour"
      })

    guide
  end

  test "renders intro, sections, faq, CTA with sponsored rel, and disclosure", %{conn: conn} do
    guide = seo_guide()
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ "<strong>real</strong>"
    assert html =~ "Getting around"
    assert html =~ "Worth it?"
    assert html =~ "Book the arena-floor tour"
    assert html =~ ~s(rel="sponsored nofollow noopener")
    assert html =~ "partner_id=ZA4AIMF"
    assert html =~ "earn Ethos a commission"
  end

  test "no disclosure without booking links", %{conn: conn} do
    guide = published_guide_fixture()
    {:ok, _} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)
    refute html =~ "earn Ethos a commission"
  end

  test "emits Article, FAQPage, BreadcrumbList JSON-LD, canonical, meta description", %{conn: conn} do
    guide = seo_guide()
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ ~s("@type":"Article")
    assert html =~ ~s("@type":"FAQPage")
    assert html =~ ~s("@type":"BreadcrumbList")
    assert html =~ ~s(<link rel="canonical" href="http://localhost:4002/g/#{guide.slug}")
    assert html =~ ~s(name="description")
    refute html =~ ~s("@type":"FAQPage") == false
  end

  test "no FAQPage block when faq empty", %{conn: conn} do
    guide = published_guide_fixture()
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)
    refute html =~ ~s("@type":"FAQPage")
  end
end
```

(Adjust the canonical host/port assertion to the test endpoint's configured `url` — read `config/test.exs`; assert with `url(~p"/g/#{guide.slug}")` if simpler.)

- [ ] **Step 2: Run to verify failure** — `mix test test/ethos_web/controllers/guide_seo_test.exs`

- [ ] **Step 3: Implement**

Controller `show/2`: after loading guide/entries, add assigns:

```elixir
meta_description =
  EthosWeb.Markdown.excerpt(guide.intro, 160) ||
    "#{guide.destination} · #{length(entries)} places and tips from a real trip"

has_booking = Enum.any?(entries, &EthosWeb.Url.safe_http?(&1.booking_url))

json_ld =
  [article_ld(conn, guide), breadcrumb_ld(conn, guide)] ++
    if(guide.faq not in [nil, []], do: [faq_ld(guide)], else: [])

render(conn, :show,
  guide: guide, entries: entries, research: research, page_og: og,
  page_meta_description: meta_description,
  page_canonical: url(~p"/g/#{guide.slug}"),
  json_ld: json_ld,
  has_booking: has_booking
)
```

Private builders in the controller (or `GuideHTML`):

```elixir
defp article_ld(conn, guide) do
  %{
    "@context" => "https://schema.org",
    "@type" => "Article",
    "headline" => guide.title,
    "description" => EthosWeb.Markdown.excerpt(guide.intro, 160),
    "datePublished" => NaiveDateTime.to_iso8601(guide.inserted_at),
    "dateModified" => NaiveDateTime.to_iso8601(guide.updated_at),
    "author" => %{"@type" => "Person", "name" => "An Ethos traveler"},
    "mainEntityOfPage" => url(~p"/g/#{guide.slug}")
  }
end

defp faq_ld(guide) do
  %{
    "@context" => "https://schema.org",
    "@type" => "FAQPage",
    "mainEntity" =>
      Enum.map(guide.faq, fn %{"question" => q, "answer" => a} ->
        %{"@type" => "Question", "name" => q,
          "acceptedAnswer" => %{"@type" => "Answer", "text" => a}}
      end)
  }
end

defp breadcrumb_ld(conn, guide) do
  %{
    "@context" => "https://schema.org",
    "@type" => "BreadcrumbList",
    "itemListElement" => [
      %{"@type" => "ListItem", "position" => 1, "name" => "Ethos", "item" => url(~p"/")},
      %{"@type" => "ListItem", "position" => 2, "name" => "Destinations", "item" => url(~p"/destinations")},
      %{"@type" => "ListItem", "position" => 3,
        "name" => guide.destination |> String.split(",") |> List.first(),
        "item" => url(~p"/destinations/#{guide.destination_slug}")},
      %{"@type" => "ListItem", "position" => 4, "name" => guide.title,
        "item" => url(~p"/g/#{guide.slug}")}
    ]
  }
end
```

(`~p"/destinations"` routes are added in Task 4 — add the two routes and a shell controller action in THIS task so `~p` verifies, exactly like v1's shell pattern; Task 4 fills them in.)

Root layout head (after the existing `page_og` block):

```heex
<%= if assigns[:page_meta_description] do %>
  <meta name="description" content={@page_meta_description} />
<% end %>
<%= if assigns[:page_canonical] do %>
  <link rel="canonical" href={@page_canonical} />
<% end %>
<%= for ld <- assigns[:json_ld] || [] do %>
  <script type="application/ld+json"><%= Phoenix.HTML.raw(Jason.encode!(ld)) %></script>
<% end %>
```

`show.html.heex` insertions:
- After the header, before the entries list: `<div :if={@guide.intro} class="prose mt-6">{EthosWeb.Markdown.render(@guide.intro)}</div>`
- Inside each entry card, after the note: a CTA card —

```heex
<a
  :if={EthosWeb.Url.safe_http?(entry.booking_url)}
  href={entry.booking_url}
  rel="sponsored nofollow noopener"
  target="_blank"
  class="mt-3 inline-flex items-center gap-2 rounded-lg bg-amber-500 px-4 py-2 text-sm font-medium text-white hover:bg-amber-600"
>
  {entry.booking_label || "Book this"} →
</a>
```

- After the entries list: sections then FAQ —

```heex
<section :for={section <- @guide.sections || []} class="mt-10">
  <h2 class="text-xl font-semibold">{section["heading"]}</h2>
  <div class="prose mt-2">{EthosWeb.Markdown.render(section["body"])}</div>
</section>

<section :if={(@guide.faq || []) != []} class="mt-10">
  <h2 class="text-xl font-semibold">Frequently asked questions</h2>
  <dl class="mt-3 space-y-4">
    <div :for={item <- @guide.faq}>
      <dt class="font-medium">{item["question"]}</dt>
      <dd class="text-zinc-600 mt-1">{item["answer"]}</dd>
    </div>
  </dl>
</section>

<p :if={@has_booking} class="mt-8 text-xs text-zinc-400">
  Some booking links on this page earn Ethos a commission at no extra cost to you.
</p>
```

(Use whichever HEEx interpolation style `mix format` now enforces in this repo — `{...}`.)

- [ ] **Step 4: Run tests** — focused then `mix test`. Expected: PASS.
- [ ] **Step 5: Commit** — `git add -A && git commit -m "feat: guide page SEO rendering with booking CTAs and JSON-LD"`

---

### Task 4: Destination hub pages

**Files:**
- Modify: `lib/ethos_web/controllers/destination_controller.ex` (fill shell from Task 3), `lib/ethos_web/router.ex` (routes exist from Task 3)
- Create: `lib/ethos_web/controllers/destination_html.ex`, `lib/ethos_web/controllers/destination_html/index.html.heex`, `lib/ethos_web/controllers/destination_html/show.html.heex`
- Test: `test/ethos_web/controllers/destination_controller_test.exs`

**Interfaces:**
- Consumes: `Guides.list_destinations/0`, `list_published_guides_for_destination/1` (Task 1).
- Produces: `GET /destinations` and `GET /destinations/:slug` (404 when no published guides), both with meta description + `BreadcrumbList` JSON-LD via the Task 3 layout assigns.

- [ ] **Step 1: Failing test**

```elixir
defmodule EthosWeb.DestinationControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures

  test "index lists destinations with published guides", %{conn: conn} do
    published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})
    guide_fixture(%{destination: "Oslo, Norway"})

    html = conn |> get(~p"/destinations") |> html_response(200)
    assert html =~ "Rome"
    refute html =~ "Oslo"
  end

  test "show lists that destination's published guides with breadcrumb ld", %{conn: conn} do
    g = published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})
    html = conn |> get(~p"/destinations/rome") |> html_response(200)
    assert html =~ "Roman Holiday"
    assert html =~ "/g/#{g.slug}"
    assert html =~ ~s("@type":"BreadcrumbList")
    assert html =~ ~s(name="description")
  end

  test "404 for unknown destination", %{conn: conn} do
    assert conn |> get(~p"/destinations/nowhere") |> response(404)
  end
end
```

- [ ] **Step 2: Run to verify failure.**

- [ ] **Step 3: Implement**

Controller:

```elixir
defmodule EthosWeb.DestinationController do
  use EthosWeb, :controller

  alias Ethos.Guides

  def index(conn, _params) do
    destinations = Guides.list_destinations()

    render(conn, :index,
      destinations: destinations,
      page_meta_description:
        "Real trip guides by destination — places, verdicts, and tips from travelers who went.",
      page_canonical: url(~p"/destinations")
    )
  end

  def show(conn, %{"slug" => slug}) do
    case Guides.list_published_guides_for_destination(slug) do
      [] ->
        conn |> put_status(:not_found) |> put_view(EthosWeb.ErrorHTML) |> render("404.html") |> halt()

      guides ->
        name = guides |> hd() |> Map.get(:destination) |> String.split(",") |> List.first()

        render(conn, :show,
          name: name, slug: slug, guides: guides,
          page_meta_description:
            "Real trip guides for #{name} — places, verdicts, and tips from travelers who went.",
          page_canonical: url(~p"/destinations/#{slug}"),
          json_ld: [destination_breadcrumb(name, slug)]
        )
    end
  end

  defp destination_breadcrumb(name, slug) do
    %{
      "@context" => "https://schema.org",
      "@type" => "BreadcrumbList",
      "itemListElement" => [
        %{"@type" => "ListItem", "position" => 1, "name" => "Ethos", "item" => url(~p"/")},
        %{"@type" => "ListItem", "position" => 2, "name" => "Destinations", "item" => url(~p"/destinations")},
        %{"@type" => "ListItem", "position" => 3, "name" => name, "item" => url(~p"/destinations/#{slug}")}
      ]
    }
  end
end
```

(For the 404: `Ethos.Guides` has no bang-lookup for destinations; raising `Phoenix.Router.NoRouteError`-style is clumsy here — simplest correct: `raise Ecto.NoResultsError, queryable: Ethos.Guides.Guide` is wrong semantically; instead `conn |> put_status(404) |> put_view(html: EthosWeb.ErrorHTML) |> render(:"404")` matching the app's error view — check how the app renders 404s (`config :ethos, EthosWeb.Endpoint, render_errors: ...` in `config/config.exs`) and use that idiom; the test asserts only status 404.)

`destination_html.ex`: `use EthosWeb, :html` + `embed_templates "destination_html/*"`.

`index.html.heex`:

```heex
<div class="mx-auto max-w-2xl px-4 py-10">
  <h1 class="text-3xl font-bold">Destinations</h1>
  <p class="mt-2 text-zinc-600">Real trip guides — places, verdicts, and tips from travelers who went.</p>
  <ul class="mt-8 space-y-4">
    <li :for={d <- @destinations} class="rounded-xl border p-5">
      <.link navigate={~p"/destinations/#{d.slug}"} class="text-xl font-semibold hover:underline">
        {d.name}
      </.link>
      <p class="text-sm text-zinc-500">{d.count} {if d.count == 1, do: "guide", else: "guides"}</p>
    </li>
  </ul>
</div>
```

`show.html.heex`:

```heex
<div class="mx-auto max-w-2xl px-4 py-10">
  <nav class="text-sm text-zinc-500">
    <.link navigate={~p"/destinations"} class="hover:underline">Destinations</.link> / {@name}
  </nav>
  <h1 class="mt-2 text-3xl font-bold">{@name} trip guides</h1>
  <p class="mt-2 text-zinc-600">
    Real trip guides for {@name} — places, verdicts, and tips from travelers who went.
  </p>
  <ul class="mt-8 space-y-4">
    <li :for={guide <- @guides} class="rounded-xl border p-5">
      <.link href={~p"/g/#{guide.slug}"} class="text-xl font-semibold hover:underline">{guide.title}</.link>
      <p class="text-sm text-zinc-500">{guide.destination}</p>
    </li>
  </ul>
</div>
```

- [ ] **Step 4: Run tests** — focused then `mix test`. Expected: PASS.
- [ ] **Step 5: Commit** — `git add -A && git commit -m "feat: destination hub pages"`

---

### Task 5: sitemap.xml

**Files:**
- Create: `lib/ethos_web/controllers/sitemap_controller.ex`
- Modify: `lib/ethos_web/router.ex`
- Test: `test/ethos_web/controllers/sitemap_controller_test.exs`

**Interfaces:**
- Consumes: `Guides.list_published_guides/0`, `list_destinations/0`.
- Produces: `GET /sitemap.xml` (public scope), `Cache-Control: public, max-age=3600`.

- [ ] **Step 1: Failing test**

```elixir
defmodule EthosWeb.SitemapControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures

  test "lists landing, destinations, hubs, and published guides", %{conn: conn} do
    g = published_guide_fixture(%{destination: "Rome, Italy"})
    _draft = guide_fixture(%{destination: "Oslo, Norway"})

    conn = get(conn, "/sitemap.xml")
    body = response(conn, 200)

    assert response_content_type(conn, :xml) =~ "xml"
    assert body =~ url(~p"/")
    assert body =~ url(~p"/destinations")
    assert body =~ url(~p"/destinations/rome")
    assert body =~ url(~p"/g/#{g.slug}")
    refute body =~ "oslo"
    assert body =~ "<lastmod>"
  end
end
```

- [ ] **Step 2: Run to verify failure.**

- [ ] **Step 3: Implement**

Route (public browser or a bare pipeline): `get "/sitemap.xml", SitemapController, :index`

```elixir
defmodule EthosWeb.SitemapController do
  use EthosWeb, :controller

  alias Ethos.Guides

  def index(conn, _params) do
    urls =
      [%{loc: url(~p"/"), lastmod: nil}, %{loc: url(~p"/destinations"), lastmod: nil}] ++
        Enum.map(Guides.list_destinations(), fn d ->
          %{loc: url(~p"/destinations/#{d.slug}"), lastmod: nil}
        end) ++
        Enum.map(Guides.list_published_guides(), fn g ->
          %{loc: url(~p"/g/#{g.slug}"), lastmod: NaiveDateTime.to_date(g.updated_at)}
        end)

    xml =
      [
        ~s(<?xml version="1.0" encoding="UTF-8"?>),
        ~s(<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">),
        Enum.map(urls, fn %{loc: loc, lastmod: lastmod} ->
          [
            "<url><loc>", loc, "</loc>",
            if(lastmod, do: ["<lastmod>", Date.to_iso8601(lastmod), "</lastmod>"], else: []),
            "</url>"
          ]
        end),
        "</urlset>"
      ]

    conn
    |> put_resp_content_type("application/xml")
    |> put_resp_header("cache-control", "public, max-age=3600")
    |> send_resp(200, IO.iodata_to_binary(xml))
  end
end
```

- [ ] **Step 4: Run tests** — focused then `mix test`. Expected: PASS.
- [ ] **Step 5: Commit** — `git add -A && git commit -m "feat: sitemap.xml"`

---

### Task 6: Edit UI for intro/sections/FAQ + booking fields

**Files:**
- Modify: `lib/ethos_web/live/guide_live/edit.ex`
- Test: `test/ethos_web/live/guide_seo_edit_test.exs`

**Interfaces:**
- Consumes: `Guides.update_guide_seo/2` (Task 1); entry changeset now accepting booking fields.
- Produces: on the edit screen — an "SEO & story" card (intro textarea, add/remove/edit section rows, add/remove/edit FAQ rows, one Save button submitting all of it via `update_guide_seo`) and `booking_url`/`booking_label` inputs on the add-entry form. Follow the per-row `phx-change` + hidden-index pattern already used by `GuideLive.Confirm.update_row`.

- [ ] **Step 1: Failing test**

`test/ethos_web/live/guide_seo_edit_test.exs`:

```elixir
defmodule EthosWeb.GuideSeoEditTest do
  use EthosWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Ethos.{AccountsFixtures, GuidesFixtures}
  alias Ethos.Guides

  setup %{conn: conn} do
    user = user_fixture()
    %{conn: log_in_user(conn, user), user: user}
  end

  test "saves intro, a section, and a faq row", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user})
    {:ok, lv, _} = live(conn, ~p"/guides/#{guide.id}/edit")

    lv |> element("#add-section") |> render_click()
    lv |> element("#add-faq") |> render_click()

    lv
    |> form("#seo-form",
      seo: %{
        intro: "Three real days in Rome.",
        sections: %{"0" => %{heading: "Getting around", body: "Walk."}},
        faq: %{"0" => %{question: "Worth it?", answer: "Yes."}}
      }
    )
    |> render_submit()

    guide = Guides.get_guide!(guide.id)
    assert guide.intro =~ "Three real days"
    assert [%{"heading" => "Getting around", "body" => "Walk."}] = guide.sections
    assert [%{"question" => "Worth it?", "answer" => "Yes."}] = guide.faq
  end

  test "adds an entry with booking url and label", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user})
    {:ok, lv, _} = live(conn, ~p"/guides/#{guide.id}/edit")

    lv
    |> form("#entry-form",
      entry: %{
        kind: "tour", name: "Arena floor", verdict: "loved",
        booking_url: "https://example.com/t", booking_label: "Book it"
      }
    )
    |> render_submit()

    assert [%{booking_url: "https://example.com/t", booking_label: "Book it"}] =
             Guides.list_entries(guide)
  end
end
```

- [ ] **Step 2: Run to verify failure.**

- [ ] **Step 3: Implement**

In `GuideLive.Edit`:
- Mount: also assign `seo` working state from the guide: `%{intro: guide.intro || "", sections: guide.sections || [], faq: guide.faq || []}`.
- Events: `"add-section"` appends `%{"heading" => "", "body" => ""}`; `"remove-section"` (phx-value-index) deletes at index; same pair for FAQ (`add-faq`/`remove-faq`); `"save_seo"` receives the whole `%{"seo" => params}` form, normalizes the indexed maps back to ordered lists (sort keys numerically), drops rows where every field is blank, calls `Guides.update_guide_seo/2`, flashes "Saved".
- Render, below the existing entry list and above the add-entry form:

```heex
<h3 class="mt-10 font-semibold">Story &amp; SEO</h3>
<.simple_form for={%{}} as={:seo} id="seo-form" phx-submit="save_seo">
  <.input type="textarea" name="seo[intro]" label="Intro (markdown)" value={@seo.intro} rows="6" />

  <div :for={{section, i} <- Enum.with_index(@seo.sections)} class="rounded border p-3">
    <.input name={"seo[sections][#{i}][heading]"} label="Section heading" value={section["heading"]} />
    <.input type="textarea" name={"seo[sections][#{i}][body]"} label="Body (markdown)" value={section["body"]} rows="4" />
    <button type="button" phx-click="remove-section" phx-value-index={i} class="text-sm text-red-600 underline">
      Remove section
    </button>
  </div>
  <button type="button" id="add-section" phx-click="add-section" class="text-sm underline">+ Add section</button>

  <div :for={{item, i} <- Enum.with_index(@seo.faq)} class="rounded border p-3">
    <.input name={"seo[faq][#{i}][question]"} label="Question" value={item["question"]} />
    <.input type="textarea" name={"seo[faq][#{i}][answer]"} label="Answer" value={item["answer"]} rows="2" />
    <button type="button" phx-click="remove-faq" phx-value-index={i} class="text-sm text-red-600 underline">
      Remove FAQ
    </button>
  </div>
  <button type="button" id="add-faq" phx-click="add-faq" class="text-sm underline">+ Add FAQ</button>

  <:actions><.button>Save story &amp; SEO</.button></:actions>
</.simple_form>
```

Important: on `add-section`/`add-faq`/`remove-*`, first capture any in-flight form values? Keep v1-simple: these buttons only mutate row count; unsaved text in other rows is re-rendered from assigns, so ALSO handle `phx-change="seo_changed"` on the form storing params into `@seo` on every change, preventing data loss when adding rows. Implement `seo_changed` with the same normalization as save (but no persist).
- Add `booking_url` and `booking_label` `<.input>` fields to the existing `#entry-form`.
- Entry changeset already casts them (Task 1) — no context change.

- [ ] **Step 4: Run tests** — focused then `mix test`. Expected: PASS.
- [ ] **Step 5: Commit** — `git add -A && git commit -m "feat: edit UI for story/SEO content and booking links"`

---

### Task 7: Rome guide seed content + release function

**Files:**
- Create: `lib/ethos/seeds/rome_guide.ex`, `lib/mix/tasks/ethos.seed_rome.ex`
- Modify: `lib/ethos/release.ex` (add `seed_rome/1`)
- Test: `test/ethos/seeds/rome_guide_test.exs`

**Interfaces:**
- Produces: `Ethos.Seeds.RomeGuide.upsert!(owner_email) :: %Guide{}` — idempotent by slug `three-days-in-rome-real-trip-guide`; attaches to existing user with that email, creates (random password) only if absent; guide published with intro/sections/faq/entries/booking links per the content below. `Ethos.Release.seed_rome(email)` wraps it with app start (mirror `Ethos.Release.migrate`'s `load_app`/`Application.ensure_all_started` pattern). Mix task `mix ethos.seed_rome --owner EMAIL` delegates.

- [ ] **Step 1: Failing test**

```elixir
defmodule Ethos.Seeds.RomeGuideTest do
  use Ethos.DataCase, async: false

  alias Ethos.{Guides, Seeds.RomeGuide}
  import Ethos.AccountsFixtures

  test "upsert! creates the published guide idempotently under the owner" do
    user = user_fixture()

    guide = RomeGuide.upsert!(user.email)
    assert guide.user_id == user.id
    assert guide.status == "published"
    assert guide.slug == "three-days-in-rome-real-trip-guide"
    assert guide.destination_slug == "rome"
    assert length(guide.sections) == 4
    assert length(guide.faq) == 6

    entries = Guides.list_entries(guide)
    assert length(entries) == 8
    assert Enum.any?(entries, &(&1.booking_url && &1.booking_url =~ "partner_id=ZA4AIMF"))
    assert Enum.any?(entries, &(&1.booking_url && &1.booking_url =~ "viator.com"))

    # second run updates in place, no duplicates
    guide2 = RomeGuide.upsert!(user.email)
    assert guide2.id == guide.id
    assert length(Guides.list_entries(guide2)) == 8
  end
end
```

- [ ] **Step 2: Run to verify failure.**

- [ ] **Step 3: Implement**

`lib/ethos/seeds/rome_guide.ex` — the content below is canonical; transcribe verbatim. Structure: module with `@slug`, `@title`, `@intro`, `@sections`, `@faq`, `@entries` attributes and an `upsert!/1` that (a) finds the user by email (creates with `:crypto.strong_rand_bytes(24) |> Base.encode64()` password only if absent), (b) finds guide by slug — update title/destination/intro/sections/faq via changesets (insert with the fixed slug when absent; set `slug` via `Ecto.Changeset.put_change` on create), (c) deletes the guide's existing entries and reinserts `@entries` in order (positions 0..7, `source: "import"` via the privileged path), (d) publishes, (e) returns the reloaded guide.

Canonical content:

```elixir
@slug "three-days-in-rome-real-trip-guide"
@title "3 Days in Rome: Colosseum Arena Floor, the Vatican, and the Back Streets of Monti"
@destination "Rome, Italy"

@intro """
Three days in Rome, exactly as we did them — no filler, real verdicts. We based
ourselves at the Anantara Palazzo Naiadi by Termini, walked almost everywhere,
took two guided tours that were worth every euro (the Vatican skip-the-line and
the Colosseum arena floor), ate on side streets rather than piazzas, and still
had time to rest. If you only have three days, this is the shape of trip we'd
recommend: one day for the Vatican, one for ancient Rome, one to walk the
centro storico from the Spanish Steps to Trastevere. Every place below is
somewhere we actually stayed, toured, walked, or ate — with honest notes on
what was worth it.
"""

@entries [
  %{day: 1, kind: "stay", name: "Anantara Palazzo Naiadi Rome", verdict: "loved",
    note: "Our base for all three days, on Piazza della Repubblica by Termini. Grand old building, quiet rooms, and the rooftop restaurant made our last-night dinner easy. Location is the win: we walked to everything."},
  %{day: 1, kind: "tour", name: "Vatican, Sistine Chapel & St. Peter's skip-the-line tour", verdict: "loved",
    note: "Three hours of non-stop culture and history that primed us for the rest of the trip. The skip-the-line part matters — the general queue was enormous. The Vatican is a walk through history right up to the present day.",
    booking_url: "https://www.viator.com/tours/Rome/Skip-the-Line-Group-Tour-of-the-Vatican-Sistine-Chapel-and-St-Peters-Basilica/d511-120123P3",
    booking_label: "Book the Vatican skip-the-line tour"},
  %{day: 1, kind: "food", name: "Lunch under the Leonine Wall (Borgo side streets)", verdict: "good",
    note: "We ate on a side street in the shadow of the wall Pope Leo IV built after the Saracen raid — around 846–852 AD, so nearly 1,200 years old. Skip the places facing the basilica; one street back the food gets better and cheaper."},
  %{day: 2, kind: "tour", name: "Colosseum arena floor, Roman Forum & Palatine Hill", verdict: "loved",
    note: "Breathtaking. Walking through the gladiators' gate onto the arena floor is the tip-of-the-hat moment of the whole trip. The Forum walk shows you the Curia Julia — the Senate house, still standing because it was converted into a church — plus the triumphal arches and views over five of Rome's seven hills.",
    booking_url: "https://www.getyourguide.com/rome-l33/rome-colosseum-gladiator-floor-access-roman-forum-tour-t633431/?partner_id=ZA4AIMF&currency=USD&travel_agent=1&cmp=share_to_earn",
    booking_label: "Book the arena-floor tour"},
  %{day: 2, kind: "food", name: "Dinner in Monti — the one place still open", verdict: "loved",
    note: "Most of the neighborhood was closed that night, but one little spot on a side street was open — and I ate a dish I hadn't had since my grandparents made it for me 35 years ago. Monti rewards wandering: pick the street, not the restaurant."},
  %{day: 3, kind: "walk", name: "Spanish Steps → Trinità dei Monti → Villa Borghese → Trevi → Pantheon → Piazza Navona", verdict: "loved",
    note: "Our whole final morning on foot: up the Spanish Steps to the church of Trinità dei Monti (the beautiful landmark at the top of the hill), looping through the Villa Borghese park, then down to the Trevi Fountain, the Pantheon, and Piazza Navona. Do it in this order — you descend more than you climb."},
  %{day: 3, kind: "sight", name: "Basilica di Santa Maria in Trastevere", verdict: "loved",
    note: "Crossed the Tiber to light a candle here. One of Rome's oldest churches, golden mosaics, and Trastevere's lanes around it are the right place to land for lunch afterwards."},
  %{day: 3, kind: "food", name: "SEEN — rooftop dinner at the Anantara", verdict: "loved",
    note: "Sushi on a Roman rooftop sounds wrong and tasted right — the quail egg was a nice touch, and the soft-shell crab is my favorite. A calm way to end three full days."}
]

@sections [
  %{"heading" => "Colosseum arena floor access, explained",
    "body" => """
    Standard Colosseum tickets put you in the galleries; **arena floor access**
    is a separate, limited entry through the Porta Libitinaria — the gladiators'
    gate — onto the reconstructed arena deck. It sells out days ahead in high
    season, and most arena-floor tickets come bundled with the Roman Forum and
    Palatine Hill (they're one archaeological park; keep a full afternoon for
    it). A guided tour is worth it here specifically: the Forum is a field of
    stones without context, and with context it's the center of the world for
    a thousand years. Comfortable shoes; there is almost no shade.
    """},
  %{"heading" => "Vatican skip-the-line logistics",
    "body" => """
    The Vatican Museums queue regularly runs past two hours; booked entries and
    guided tours use a separate entrance. Three practical notes from doing it:
    dress code is enforced (covered shoulders and knees) for the Sistine Chapel
    and St. Peter's; the museums-to-basilica shortcut is only available on some
    guided tours — otherwise you exit and re-queue for St. Peter's security;
    and mornings are the crowd peak, so early afternoon entries are often
    calmer. Give it three hours minimum. Afterwards, walk one street away from
    the basilica into Borgo for lunch — the side streets under the 9th-century
    Leonine Wall beat anything on the tourist frontage.
    """},
  %{"heading" => "Where to eat in Monti",
    "body" => """
    Monti is the neighborhood between the Colosseum and Termini — Rome's oldest
    rione, now its most walkable dinner district. The pattern that worked for
    us: skip anywhere with a host waving menus on Via dei Serpenti's busiest
    corners and turn onto the smaller side streets, where kitchens cook Roman
    classics — cacio e pepe, carbonara, saltimbocca — for people who live
    there. Many kitchens close one night a week (often Monday); if the street
    looks shut, keep walking — the one place still open is usually open
    because locals keep it that way.
    """},
  %{"heading" => "Making three days work on foot from Termini",
    "body" => """
    Basing near Termini gets a bad rap, but it worked: metro line A runs
    direct to the Vatican side (Ottaviano), the Colosseum and Monti are a
    20-minute walk, and the centro storico loop — Spanish Steps, Trevi,
    Pantheon, Piazza Navona — is entirely walkable in a morning. Our shape:
    Day 1 Vatican (tour + Borgo lunch), Day 2 ancient Rome (arena floor +
    Forum + Monti dinner), Day 3 the walking loop ending across the Tiber in
    Trastevere. Total walking: 8–12km a day. Build in an afternoon rest — Rome
    rewards evenings, and August heat is real.
    """}
]

@faq [
  %{"question" => "Is the Colosseum arena floor tour worth it?",
    "answer" => "Yes — it was the single best moment of our trip. You enter through the gladiators' gate onto the arena deck itself, which regular tickets don't include. Book several days ahead; it's capacity-limited and sells out."},
  %{"question" => "How many days do you need in Rome?",
    "answer" => "Three full days covers the Vatican, ancient Rome (Colosseum, Forum, Palatine), and the historic center's walking loop without rushing. You could fill a week, but three days makes a complete trip."},
  %{"question" => "Do you need a guided tour for the Vatican?",
    "answer" => "You don't need one, but the skip-the-line entry alone can save two hours, and our three-hour guided tour turned the museums from overwhelming into coherent. If you take one tour in Rome, make it the Vatican or the Colosseum."},
  %{"question" => "Where should you stay in Rome for a first visit?",
    "answer" => "Anywhere you can walk from. We stayed at the Anantara Palazzo Naiadi by Piazza della Repubblica — near Termini for airport trains and metro, and a walkable base for everything in this guide."},
  %{"question" => "Is the area around Termini a good place to eat?",
    "answer" => "Breakfast and shopping around Termini worked fine for us, but for dinner walk 15 minutes into Monti — the side streets there had the best food of our trip."},
  %{"question" => "What's the walking route for the classic Rome sights?",
    "answer" => "Start at the Spanish Steps, climb to Trinità dei Monti, loop through Villa Borghese, then descend to the Trevi Fountain, Pantheon, and Piazza Navona, and cross the Tiber to finish in Trastevere. It's a comfortable half-day on foot, mostly downhill if done in that order."}
]
```

`Ethos.Release.seed_rome/1`: mirror `migrate/0`'s app-loading, then `Ethos.Seeds.RomeGuide.upsert!(email)` and `IO.puts` the public URL. Mix task `Mix.Tasks.Ethos.SeedRome`: `use Mix.Task`, `@shortdoc`, parse `--owner`, `Mix.Task.run("app.start")`, call `upsert!/1`.

- [ ] **Step 4: Run tests** — focused then `mix test`. Also run `mix ethos.seed_rome --owner demo@ethos.example` against dev and eyeball `http://localhost:4000/g/three-days-in-rome-real-trip-guide` if the server is up. Expected: PASS.
- [ ] **Step 5: Commit** — `git add -A && git commit -m "feat: seeded Rome flagship guide with affiliate booking links"`

---

### Task 8: Ship it

**Files:** none new (commands only)

- [ ] **Step 1: Full verification** — `mix test` green; `mix format --check-formatted` clean (run `mix format` if needed, commit separately as `chore: mix format`).
- [ ] **Step 2: Push** — `git push origin main` (work merged to main per repo convention; if built on a branch, merge to main first with tests green).
- [ ] **Step 3: Deploy** — `fly deploy -a ethos` (migrations run automatically via release_command).
- [ ] **Step 4: Seed production** —
  `fly ssh console -a ethos -C "/app/bin/ethos eval 'Ethos.Release.seed_rome(\"cryptcom@gmail.com\")'"`
- [ ] **Step 5: Verify live** — `https://ethos.fly.dev/g/three-days-in-rome-real-trip-guide` renders intro/sections/FAQ/CTAs/disclosure; CTA href contains `partner_id=ZA4AIMF`; `/destinations/rome` lists it; `/sitemap.xml` includes all URLs; JSON-LD present (view-source).
- [ ] **Step 6: Hand off Search Console steps** — report to the founder: add property `ethos.fly.dev` in Google Search Console (DNS or HTML-file verification), submit `https://ethos.fly.dev/sitemap.xml`.
