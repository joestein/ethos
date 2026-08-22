# Connecticut Guides, Place Pages, and Explorer Badges — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a state → county → town destination hierarchy, first-class place pages with copy-link sharing, visit check-offs with explorer badges, and five researched Connecticut town guides with Wikimedia Commons photos.

**Architecture:** Extends the existing Phoenix 1.7 guide/entry model with a new `places` table (each place gets its own SEO page at `/p/:slug`), nullable geo columns on guides driving derived hub pages, and two small join tables (`place_visits`, `user_badges`) powering a code-defined badge system. Zero AI calls anywhere in this plan.

**Tech Stack:** Elixir/Phoenix 1.7.14, Ecto/Postgres, dead controller views (no LiveView needed for new pages), plain-JS clipboard listener, Vix/PhotoOptimizer for images.

**Spec:** `docs/superpowers/specs/2026-08-22-ct-places-badges-design.md`

## Global Constraints

- Phoenix 1.7.14 conventions (`current_user` assigns, `EthosWeb.UserAuth`), NOT 1.8 scopes.
- Zero AI/exa API calls in every feature in this plan.
- No fabricated experiences or unverified facts in content; editorial voice ("Waterbury's brass mills once employed 50,000…"), never first-person fake trips.
- Images: public domain / CC0 / CC-BY / CC-BY-SA only, always attributed (author, license, Commons source link), never hotlinked.
- Public changesets never cast privileged fields: `place_id`, `source`, `credited_user_id` are privileged.
- External URLs render only behind `EthosWeb.Url.safe_http?/1`; booking/affiliate links get `rel="sponsored nofollow noopener"`.
- All commits made with `mix format` clean and the full suite green (`mix test`).
- Photo paths must match `~r{^/photos/[a-z0-9/_-]+\.(jpg|jpeg|png|webp)$}`.

---

### Task 1: Guide geo columns (state/county) + hub queries

**Files:**
- Create: `priv/repo/migrations/20260822120000_add_geo_to_guides.exs`
- Modify: `lib/ethos/guides/guide.ex` (changeset + slug derivation)
- Modify: `lib/ethos/guides.ex` (hub query functions)
- Test: `test/ethos/guide_geo_test.exs`

**Interfaces:**
- Consumes: existing `Ethos.Guides.Guide.derive_destination_slug/1` (public), `Ethos.GuidesFixtures.published_guide_fixture/1`.
- Produces: `Guide` fields `:state, :state_slug, :county, :county_slug` (all nullable strings, slugs derived automatically when state/county cast); `Guides.list_states/0` → `[%{state: "Connecticut", slug: "connecticut", count: 3}]`; `Guides.list_counties_for_state/1` (state_slug) → `[%{county: "New Haven County", slug: "new-haven-county", count: 2}]`; `Guides.list_published_guides_for_state/1` (state_slug) → `[%Guide{}]`; `Guides.list_published_guides_for_county/2` (state_slug, county_slug) → `[%Guide{}]`.

- [ ] **Step 1: Write the migration**

```elixir
defmodule Ethos.Repo.Migrations.AddGeoToGuides do
  use Ecto.Migration

  def change do
    alter table(:guides) do
      add :state, :string
      add :state_slug, :string
      add :county, :string
      add :county_slug, :string
    end

    create index(:guides, [:state_slug])
    create index(:guides, [:state_slug, :county_slug])
  end
end
```

Run: `mix ecto.migrate` — expect success.

- [ ] **Step 2: Write the failing tests**

`test/ethos/guide_geo_test.exs`:

```elixir
defmodule Ethos.GuideGeoTest do
  use Ethos.DataCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Guides

  test "changeset derives state_slug and county_slug" do
    guide =
      published_guide_fixture(%{
        "title" => "Waterbury guide",
        "destination" => "Waterbury, Connecticut",
        "state" => "Connecticut",
        "county" => "New Haven County"
      })

    assert guide.state_slug == "connecticut"
    assert guide.county_slug == "new-haven-county"
  end

  test "guides without state keep nil geo slugs" do
    guide = published_guide_fixture(%{"title" => "Rome", "destination" => "Rome, Italy"})
    assert guide.state_slug == nil
    assert guide.county_slug == nil
  end

  test "list_states / list_counties_for_state / hub listings" do
    published_guide_fixture(%{
      "title" => "Waterbury",
      "destination" => "Waterbury, Connecticut",
      "state" => "Connecticut",
      "county" => "New Haven County"
    })

    published_guide_fixture(%{
      "title" => "Woodbury",
      "destination" => "Woodbury, Connecticut",
      "state" => "Connecticut",
      "county" => "Litchfield County"
    })

    # Rome-style guide without geo — must not appear in state listings
    published_guide_fixture(%{"title" => "Rome", "destination" => "Rome, Italy"})

    assert [%{state: "Connecticut", slug: "connecticut", count: 2}] = Guides.list_states()

    counties = Guides.list_counties_for_state("connecticut")
    assert Enum.map(counties, & &1.slug) |> Enum.sort() == ["litchfield-county", "new-haven-county"]

    assert length(Guides.list_published_guides_for_state("connecticut")) == 2

    assert [%{title: "Woodbury"}] =
             Guides.list_published_guides_for_county("connecticut", "litchfield-county")
  end
end
```

Note: check `test/support/fixtures/guides_fixtures.ex` — if `guide_fixture/1` uses atom-keyed maps merged into attrs, pass attrs in the same key style the fixture expects (adjust the test attrs to match; do not change the fixture's contract).

- [ ] **Step 3: Run tests to verify they fail**

Run: `mix test test/ethos/guide_geo_test.exs` — expect failures (unknown fields / undefined functions).

- [ ] **Step 4: Implement schema changes**

In `lib/ethos/guides/guide.ex`, add fields to the schema block:

```elixir
    field :state, :string
    field :state_slug, :string
    field :county, :string
    field :county_slug, :string
```

Update `changeset/2`: cast `[:title, :destination, :starts_on, :ends_on, :state, :county]` and pipe `|> put_geo_slugs()` after `put_destination_slug()`. Add:

```elixir
  defp put_geo_slugs(changeset) do
    changeset
    |> derive_slug_for(:state, :state_slug)
    |> derive_slug_for(:county, :county_slug)
  end

  defp derive_slug_for(changeset, source_field, slug_field) do
    case get_field(changeset, source_field) do
      nil -> changeset
      value -> put_change(changeset, slug_field, derive_destination_slug(value))
    end
  end
```

(`derive_destination_slug/1` already lowercases and dashes any string; the name is historical.)

- [ ] **Step 5: Implement hub queries in `lib/ethos/guides.ex`**

```elixir
  def list_states do
    Repo.all(
      from g in Guide,
        where: g.status == "published" and not is_nil(g.state_slug),
        group_by: [g.state, g.state_slug],
        select: %{state: g.state, slug: g.state_slug, count: count(g.id)},
        order_by: [desc: count(g.id)]
    )
  end

  def list_counties_for_state(state_slug) do
    Repo.all(
      from g in Guide,
        where:
          g.status == "published" and g.state_slug == ^state_slug and
            not is_nil(g.county_slug),
        group_by: [g.county, g.county_slug],
        select: %{county: g.county, slug: g.county_slug, count: count(g.id)},
        order_by: [asc: g.county]
    )
  end

  def list_published_guides_for_state(state_slug) do
    Repo.all(
      from g in Guide,
        where: g.status == "published" and g.state_slug == ^state_slug,
        order_by: [desc: g.view_count, desc: g.id]
    )
  end

  def list_published_guides_for_county(state_slug, county_slug) do
    Repo.all(
      from g in Guide,
        where:
          g.status == "published" and g.state_slug == ^state_slug and
            g.county_slug == ^county_slug,
        order_by: [desc: g.view_count, desc: g.id]
    )
  end
```

- [ ] **Step 6: Run tests to verify they pass**

Run: `mix test test/ethos/guide_geo_test.exs` — expect PASS. Then `mix test` — full suite green.

- [ ] **Step 7: Commit**

```bash
mix format && git add -A && git commit -m "feat: guide state/county geo fields and hub queries"
```

---

### Task 2: State and county hub pages + sitemap

**Files:**
- Modify: `lib/ethos_web/router.ex` (add county route)
- Modify: `lib/ethos_web/controllers/destination_controller.ex`
- Modify: `lib/ethos_web/controllers/destination_html/index.html.heex`
- Create: `lib/ethos_web/controllers/destination_html/state.html.heex`
- Create: `lib/ethos_web/controllers/destination_html/county.html.heex`
- Modify: `lib/ethos_web/controllers/sitemap_controller.ex`
- Test: `test/ethos_web/controllers/hub_pages_test.exs`

**Interfaces:**
- Consumes: `Guides.list_states/0`, `list_counties_for_state/1`, `list_published_guides_for_state/1`, `list_published_guides_for_county/2`, `list_published_guides_for_destination/1` (Task 1 + existing).
- Produces: routes `GET /destinations/:slug` (state hub when slug matches a state, else existing town hub) and `GET /destinations/:state_slug/:county_slug`. No new Elixir functions consumed later.

- [ ] **Step 1: Write the failing tests**

`test/ethos_web/controllers/hub_pages_test.exs`:

```elixir
defmodule EthosWeb.HubPagesTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures

  defp ct_guide(title, county) do
    published_guide_fixture(%{
      "title" => title,
      "destination" => "#{title}, Connecticut",
      "state" => "Connecticut",
      "county" => county
    })
  end

  test "state hub lists counties and guides", %{conn: conn} do
    ct_guide("Waterbury", "New Haven County")
    ct_guide("Woodbury", "Litchfield County")

    html = conn |> get(~p"/destinations/connecticut") |> html_response(200)
    assert html =~ "Connecticut"
    assert html =~ "New Haven County"
    assert html =~ "Litchfield County"
    assert html =~ "Waterbury"
  end

  test "town hub still resolves when slug is not a state", %{conn: conn} do
    published_guide_fixture(%{"title" => "Rome trip", "destination" => "Rome, Italy"})
    html = conn |> get(~p"/destinations/rome") |> html_response(200)
    assert html =~ "Rome"
  end

  test "county hub lists that county's guides only", %{conn: conn} do
    ct_guide("Waterbury", "New Haven County")
    ct_guide("Woodbury", "Litchfield County")

    html =
      conn |> get(~p"/destinations/connecticut/litchfield-county") |> html_response(200)

    assert html =~ "Woodbury"
    refute html =~ "Waterbury"
  end

  test "unknown county hub 404s", %{conn: conn} do
    assert conn |> get(~p"/destinations/connecticut/nope-county") |> html_response(404)
  end

  test "destinations index shows states section", %{conn: conn} do
    ct_guide("Waterbury", "New Haven County")
    html = conn |> get(~p"/destinations") |> html_response(200)
    assert html =~ "Connecticut"
  end

  test "sitemap includes state, county hubs", %{conn: conn} do
    ct_guide("Waterbury", "New Haven County")
    xml = conn |> get(~p"/sitemap.xml") |> response(200)
    assert xml =~ "/destinations/connecticut</loc>"
    assert xml =~ "/destinations/connecticut/new-haven-county</loc>"
  end
end
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `mix test test/ethos_web/controllers/hub_pages_test.exs` — expect failures (no route / no state resolution).

- [ ] **Step 3: Add the county route**

In `lib/ethos_web/router.ex`, public browser scope, AFTER the existing `/destinations/:slug` line:

```elixir
    get "/destinations/:state_slug/:county_slug", DestinationController, :county
```

- [ ] **Step 4: Implement controller changes**

In `destination_controller.ex`:

- `index/2`: also assign `states: Guides.list_states()`.
- `show/2`: resolve state first, then fall back to the town hub:

```elixir
  def show(conn, %{"slug" => slug}) do
    case Guides.list_published_guides_for_state(slug) do
      [] -> town_show(conn, slug)
      guides -> state_show(conn, slug, guides)
    end
  end

  defp state_show(conn, slug, guides) do
    state = hd(guides).state
    counties = Guides.list_counties_for_state(slug)

    render(conn, :state,
      state: state,
      slug: slug,
      counties: counties,
      guides: guides,
      page_title: "#{state} travel guides",
      page_meta_description:
        "Travel guides for #{state} — history, sites, restaurants, and places to stay, county by county.",
      page_canonical: url(~p"/destinations/#{slug}"),
      json_ld: [collection_ld("#{state} travel guides", url(~p"/destinations/#{slug}")), state_breadcrumb(state, slug)]
    )
  end

  def county(conn, %{"state_slug" => state_slug, "county_slug" => county_slug}) do
    case Guides.list_published_guides_for_county(state_slug, county_slug) do
      [] ->
        conn |> put_status(:not_found) |> put_view(EthosWeb.ErrorHTML) |> render(:"404")

      guides ->
        g = hd(guides)

        render(conn, :county,
          state: g.state,
          state_slug: state_slug,
          county: g.county,
          county_slug: county_slug,
          guides: guides,
          page_title: "#{g.county}, #{g.state} travel guides",
          page_meta_description:
            "Travel guides for #{g.county}, #{g.state} — towns, history, sites, restaurants, and places to stay.",
          page_canonical: url(~p"/destinations/#{state_slug}/#{county_slug}"),
          json_ld: [
            collection_ld("#{g.county} travel guides", url(~p"/destinations/#{state_slug}/#{county_slug}")),
            county_breadcrumb(g.state, state_slug, g.county, county_slug)
          ]
        )
    end
  end
```

`town_show/2` is the existing `show/2` body extracted verbatim (its `[] -> 404` branch included). Add JSON-LD helpers:

```elixir
  defp collection_ld(name, url) do
    %{"@context" => "https://schema.org", "@type" => "CollectionPage", "name" => name, "url" => url}
  end

  defp state_breadcrumb(state, slug) do
    %{
      "@context" => "https://schema.org",
      "@type" => "BreadcrumbList",
      "itemListElement" => [
        %{"@type" => "ListItem", "position" => 1, "name" => "Ethos", "item" => url(~p"/")},
        %{"@type" => "ListItem", "position" => 2, "name" => "Destinations", "item" => url(~p"/destinations")},
        %{"@type" => "ListItem", "position" => 3, "name" => state, "item" => url(~p"/destinations/#{slug}")}
      ]
    }
  end

  defp county_breadcrumb(state, state_slug, county, county_slug) do
    crumb = state_breadcrumb(state, state_slug)

    %{crumb | "itemListElement" => crumb["itemListElement"] ++ [
      %{"@type" => "ListItem", "position" => 4, "name" => county,
        "item" => url(~p"/destinations/#{state_slug}/#{county_slug}")}
    ]}
  end
```

- [ ] **Step 5: Templates**

`destination_html/state.html.heex`:

```heex
<div class="mx-auto max-w-2xl px-4 py-10">
  <nav class="text-sm text-zinc-500">
    <.link navigate={~p"/destinations"} class="underline">Destinations</.link> / {@state}
  </nav>
  <h1 class="mt-2 text-3xl font-bold">{@state} travel guides</h1>

  <h2 class="mt-8 font-semibold">By county</h2>
  <ul class="mt-3 space-y-2">
    <li :for={c <- @counties}>
      <.link navigate={~p"/destinations/#{@slug}/#{c.slug}"} class="underline">
        {c.county}
      </.link>
      <span class="text-sm text-zinc-500">· {c.count} {if c.count == 1, do: "guide", else: "guides"}</span>
    </li>
  </ul>

  <h2 class="mt-8 font-semibold">All {@state} guides</h2>
  <ul class="mt-3 space-y-3">
    <li :for={g <- @guides} class="rounded-xl border p-4">
      <.link navigate={~p"/g/#{g.slug}"} class="font-semibold hover:underline">{g.title}</.link>
      <p class="text-sm text-zinc-500">{g.destination}</p>
    </li>
  </ul>
</div>
```

`destination_html/county.html.heex`:

```heex
<div class="mx-auto max-w-2xl px-4 py-10">
  <nav class="text-sm text-zinc-500">
    <.link navigate={~p"/destinations"} class="underline">Destinations</.link>
    / <.link navigate={~p"/destinations/#{@state_slug}"} class="underline">{@state}</.link>
    / {@county}
  </nav>
  <h1 class="mt-2 text-3xl font-bold">{@county} travel guides</h1>
  <ul class="mt-6 space-y-3">
    <li :for={g <- @guides} class="rounded-xl border p-4">
      <.link navigate={~p"/g/#{g.slug}"} class="font-semibold hover:underline">{g.title}</.link>
      <p class="text-sm text-zinc-500">{g.destination}</p>
    </li>
  </ul>
</div>
```

In `destination_html/index.html.heex`, add a states section above the existing town list (only when `@states != []`):

```heex
<section :if={@states != []} class="mt-6">
  <h2 class="font-semibold">By state</h2>
  <ul class="mt-3 space-y-2">
    <li :for={s <- @states}>
      <.link navigate={~p"/destinations/#{s.slug}"} class="underline">{s.state}</.link>
      <span class="text-sm text-zinc-500">· {s.count} {if s.count == 1, do: "guide", else: "guides"}</span>
    </li>
  </ul>
</section>
```

(Match the file's existing wrapper markup; read it first.)

- [ ] **Step 6: Sitemap**

In `sitemap_controller.ex`, after the existing destinations mapping, add:

```elixir
        Enum.map(Guides.list_states(), fn s ->
          %{loc: url(~p"/destinations/#{s.slug}"), lastmod: nil}
        end) ++
        Enum.flat_map(Guides.list_states(), fn s ->
          Enum.map(Guides.list_counties_for_state(s.slug), fn c ->
            %{loc: url(~p"/destinations/#{s.slug}/#{c.slug}"), lastmod: nil}
          end)
        end) ++
```

- [ ] **Step 7: Run tests, full suite, commit**

Run: `mix test test/ethos_web/controllers/hub_pages_test.exs && mix test` — all green.

```bash
mix format && git add -A && git commit -m "feat: state and county destination hubs with sitemap entries"
```

---

### Task 3: Places schema and context

**Files:**
- Create: `priv/repo/migrations/20260822121000_create_places.exs`
- Create: `lib/ethos/places/place.ex`
- Create: `lib/ethos/places.ex`
- Test: `test/ethos/places_test.exs`

**Interfaces:**
- Consumes: `Ethos.Guides.Guide.derive_destination_slug/1`, `Ethos.Url.safe_http?/1`.
- Produces: `Ethos.Places.Place` struct (fields per migration below; `kinds/0` returns the kind list); `Places.upsert_place!/1` (attrs map with string or atom keys, keyed by required `:slug`; insert-or-update, raises on invalid) → `%Place{}`; `Places.get_place_by_slug!/1`, `Places.get_place_by_slug/1` (nil-safe); `Places.list_places/1` keyword opts `:town_slug, :county_slug, :state_slug, :kind, :kinds, :status` → `[%Place{}]` ordered by name; `Places.count_open_places_in_county/2` (state_slug, county_slug) → integer.

- [ ] **Step 1: Migration**

```elixir
defmodule Ethos.Repo.Migrations.CreatePlaces do
  use Ecto.Migration

  def change do
    create table(:places) do
      add :slug, :string, null: false
      add :name, :string, null: false
      add :kind, :string, null: false
      add :town, :string, null: false
      add :town_slug, :string, null: false
      add :state, :string, null: false
      add :state_slug, :string, null: false
      add :county, :string, null: false
      add :county_slug, :string, null: false
      add :summary, :text, null: false
      add :history, :text
      add :address, :string
      add :official_url, :string
      add :booking_url, :string
      add :photos, {:array, :map}, default: [], null: false
      add :status, :string, default: "open", null: false
      timestamps(type: :utc_datetime)
    end

    create unique_index(:places, [:slug])
    create index(:places, [:state_slug, :county_slug])
    create index(:places, [:town_slug])
    create index(:places, [:kind])
  end
end
```

Run `mix ecto.migrate`.

- [ ] **Step 2: Failing tests**

`test/ethos/places_test.exs`:

```elixir
defmodule Ethos.PlacesTest do
  use Ethos.DataCase, async: true

  alias Ethos.Places

  @valid %{
    slug: "palace-theater-waterbury",
    name: "Palace Theater",
    kind: "theater",
    town: "Waterbury",
    state: "Connecticut",
    county: "New Haven County",
    summary: "A 1922 Thomas Lamb theater on East Main Street.",
    address: "100 E. Main St., Waterbury, CT 06702",
    official_url: "https://palacetheaterct.org"
  }

  test "upsert_place! inserts, derives slugs, and is idempotent" do
    place = Places.upsert_place!(@valid)
    assert place.town_slug == "waterbury"
    assert place.state_slug == "connecticut"
    assert place.county_slug == "new-haven-county"
    assert place.status == "open"

    again = Places.upsert_place!(%{@valid | summary: "Updated."})
    assert again.id == place.id
    assert again.summary == "Updated."
    assert Repo.aggregate(Places.Place, :count) == 1
  end

  test "rejects bad kind, bad status, unsafe urls" do
    assert_raise Ecto.InvalidChangesetError, fn ->
      Places.upsert_place!(%{@valid | kind: "castle"})
    end

    assert_raise Ecto.InvalidChangesetError, fn ->
      Places.upsert_place!(%{@valid | official_url: "javascript:alert(1)"})
    end

    assert_raise Ecto.InvalidChangesetError, fn ->
      Places.upsert_place!(%{@valid | status: "gone"})
    end
  end

  test "photos require attribution fields and /photos/ paths" do
    good = %{
      "src" => "/photos/ct/waterbury/palace-theater.jpg",
      "thumb" => "/photos/ct/waterbury/palace-theater_thumb.jpg",
      "title" => "Palace Theater",
      "description" => "The marquee.",
      "author" => "Jane Doe",
      "license" => "CC BY-SA 4.0",
      "source_url" => "https://commons.wikimedia.org/wiki/File:Palace.jpg"
    }

    assert %{photos: [_]} = Places.upsert_place!(Map.put(@valid, :photos, [good]))

    assert_raise Ecto.InvalidChangesetError, fn ->
      Places.upsert_place!(Map.put(@valid, :photos, [Map.delete(good, "license")]))
    end

    assert_raise Ecto.InvalidChangesetError, fn ->
      Places.upsert_place!(Map.put(@valid, :photos, [%{good | "src" => "https://evil.example/x.jpg"}]))
    end
  end

  test "list_places filters and count_open_places_in_county" do
    Places.upsert_place!(@valid)

    Places.upsert_place!(%{@valid | slug: "mattatuck-museum", name: "Mattatuck Museum", kind: "museum"})

    Places.upsert_place!(%{
      @valid
      | slug: "glebe-house",
        name: "Glebe House",
        kind: "museum",
        town: "Woodbury",
        county: "Litchfield County",
        status: "closed"
    })

    assert length(Places.list_places(town_slug: "waterbury")) == 2
    assert [%{name: "Mattatuck Museum"}] = Places.list_places(kind: "museum", status: "open")
    assert length(Places.list_places(kinds: ["museum", "theater"])) == 3
    assert Places.count_open_places_in_county("connecticut", "new-haven-county") == 2
    assert Places.count_open_places_in_county("connecticut", "litchfield-county") == 0
  end
end
```

- [ ] **Step 3: Run to verify failure** — `mix test test/ethos/places_test.exs`.

- [ ] **Step 4: Schema**

`lib/ethos/places/place.ex`:

```elixir
defmodule Ethos.Places.Place do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ethos.Guides.Guide

  @kinds ~w(museum theater restaurant cafe brewery hotel bnb park historic-site amusement-park attraction)
  @statuses ~w(open closed)
  @photo_path_re ~r{^/photos/[a-z0-9/_-]+\.(jpg|jpeg|png|webp)$}
  @photo_keys ~w(src thumb title description author license source_url)

  def kinds, do: @kinds

  schema "places" do
    field :slug, :string
    field :name, :string
    field :kind, :string
    field :town, :string
    field :town_slug, :string
    field :state, :string
    field :state_slug, :string
    field :county, :string
    field :county_slug, :string
    field :summary, :string
    field :history, :string
    field :address, :string
    field :official_url, :string
    field :booking_url, :string
    field :photos, {:array, :map}, default: []
    field :status, :string, default: "open"
    timestamps(type: :utc_datetime)
  end

  def changeset(place, attrs) do
    place
    |> cast(attrs, [
      :slug, :name, :kind, :town, :state, :county, :summary, :history,
      :address, :official_url, :booking_url, :photos, :status
    ])
    |> validate_required([:slug, :name, :kind, :town, :state, :county, :summary])
    |> validate_inclusion(:kind, @kinds)
    |> validate_inclusion(:status, @statuses)
    |> validate_format(:slug, ~r/^[a-z0-9-]+$/)
    |> validate_safe_url(:official_url)
    |> validate_safe_url(:booking_url)
    |> validate_photos()
    |> derive_geo_slugs()
    |> unique_constraint(:slug)
  end

  defp validate_safe_url(changeset, field) do
    validate_change(changeset, field, fn ^field, url ->
      if is_nil(url) or Ethos.Url.safe_http?(url), do: [], else: [{field, "must be an http(s) URL"}]
    end)
  end

  defp validate_photos(changeset) do
    validate_change(changeset, :photos, fn :photos, photos ->
      ok? =
        is_list(photos) and
          Enum.all?(photos, fn p ->
            is_map(p) and
              Enum.all?(@photo_keys, &is_binary(Map.get(p, &1))) and
              Regex.match?(@photo_path_re, p["src"]) and
              Regex.match?(@photo_path_re, p["thumb"]) and
              Ethos.Url.safe_http?(p["source_url"])
          end)

      if ok?,
        do: [],
        else: [photos: "each photo needs src/thumb under /photos/ plus title, description, author, license, source_url"]
    end)
  end

  defp derive_geo_slugs(changeset) do
    Enum.reduce([town: :town_slug, state: :state_slug, county: :county_slug], changeset, fn
      {src, dst}, cs ->
        case get_field(cs, src) do
          nil -> cs
          value -> put_change(cs, dst, Guide.derive_destination_slug(value))
        end
    end)
  end
end
```

- [ ] **Step 5: Context**

`lib/ethos/places.ex`:

```elixir
defmodule Ethos.Places do
  import Ecto.Query, warn: false

  alias Ethos.Repo
  alias Ethos.Places.Place

  def get_place_by_slug!(slug), do: Repo.get_by!(Place, slug: slug)
  def get_place_by_slug(slug), do: Repo.get_by(Place, slug: slug)

  def upsert_place!(attrs) do
    slug = attrs[:slug] || attrs["slug"]

    case Repo.get_by(Place, slug: slug) do
      nil -> %Place{}
      place -> place
    end
    |> Place.changeset(attrs)
    |> Repo.insert_or_update!()
  end

  def list_places(opts \\ []) do
    base = from p in Place, order_by: [asc: p.name]

    opts
    |> Enum.reduce(base, fn
      {:town_slug, v}, q -> where(q, [p], p.town_slug == ^v)
      {:county_slug, v}, q -> where(q, [p], p.county_slug == ^v)
      {:state_slug, v}, q -> where(q, [p], p.state_slug == ^v)
      {:kind, v}, q -> where(q, [p], p.kind == ^v)
      {:kinds, v}, q -> where(q, [p], p.kind in ^v)
      {:status, v}, q -> where(q, [p], p.status == ^v)
    end)
    |> Repo.all()
  end

  def count_open_places_in_county(state_slug, county_slug) do
    Repo.one(
      from p in Place,
        where:
          p.status == "open" and p.state_slug == ^state_slug and
            p.county_slug == ^county_slug,
        select: count(p.id)
    )
  end
end
```

- [ ] **Step 6: Run tests + suite, commit**

`mix test test/ethos/places_test.exs && mix test` green, then:

```bash
mix format && git add -A && git commit -m "feat: places schema and context"
```

---

### Task 4: Link entries to places

**Files:**
- Create: `priv/repo/migrations/20260822122000_add_place_id_to_entries.exs`
- Modify: `lib/ethos/guides/entry.ex`
- Modify: `lib/ethos/guides.ex:81-85` (`list_entries/1` preloads place)
- Modify: `lib/ethos/places.ex` (add `guides_featuring/1`)
- Test: `test/ethos/entry_place_test.exs`

**Interfaces:**
- Consumes: `Places.upsert_place!/1` (Task 3), `Guides.create_entry/3` `:privileged` mode (existing).
- Produces: `entries.place_id` (nullable FK; cast ONLY in `Entry.privileged_changeset/2`); `Entry` gains `belongs_to :place, Ethos.Places.Place`; `Guides.list_entries/1` now returns entries with `:place` preloaded; `Places.guides_featuring/1` (`%Place{}`) → `[%Guide{}]` published guides having an entry with that place_id.

- [ ] **Step 1: Migration**

```elixir
defmodule Ethos.Repo.Migrations.AddPlaceIdToEntries do
  use Ecto.Migration

  def change do
    alter table(:entries) do
      add :place_id, references(:places, on_delete: :nilify_all)
    end

    create index(:entries, [:place_id])
  end
end
```

- [ ] **Step 2: Failing tests**

`test/ethos/entry_place_test.exs`:

```elixir
defmodule Ethos.EntryPlaceTest do
  use Ethos.DataCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.{Guides, Places}

  @place %{
    slug: "palace-theater-waterbury",
    name: "Palace Theater",
    kind: "theater",
    town: "Waterbury",
    state: "Connecticut",
    county: "New Haven County",
    summary: "Historic theater."
  }

  test "public changeset cannot set place_id; privileged can" do
    place = Places.upsert_place!(@place)
    guide = published_guide_fixture()

    {:ok, public_entry} =
      Guides.create_entry(guide, %{"kind" => "sight", "name" => "X", "place_id" => place.id})

    assert public_entry.place_id == nil

    {:ok, priv_entry} =
      Guides.create_entry(guide, %{"kind" => "sight", "name" => "X", "place_id" => place.id}, :privileged)

    assert priv_entry.place_id == place.id
  end

  test "list_entries preloads place and guides_featuring finds published guides" do
    place = Places.upsert_place!(@place)
    guide = published_guide_fixture()

    {:ok, _} =
      Guides.create_entry(guide, %{"kind" => "sight", "name" => "X", "place_id" => place.id}, :privileged)

    assert [%{place: %Places.Place{slug: "palace-theater-waterbury"}}] = Guides.list_entries(guide)
    assert [found] = Places.guides_featuring(place)
    assert found.id == guide.id
  end
end
```

(If `published_guide_fixture/0` requires attrs, pass the minimal ones the fixture file shows.)

- [ ] **Step 3: Run to verify failure**, then implement:

In `entry.ex`: add `belongs_to :place, Ethos.Places.Place` to the schema (remove nothing), and in `privileged_changeset/2` change the second cast to `cast(attrs, [:source, :credited_user_id, :place_id])`. Do NOT touch the public `changeset/2` cast list.

In `guides.ex` `list_entries/1`, add preload:

```elixir
  def list_entries(%Guide{id: guide_id}) do
    Repo.all(
      from e in Entry,
        where: e.guide_id == ^guide_id,
        order_by: [asc: e.position, asc: e.id],
        preload: [:place]
    )
  end
```

In `places.ex`:

```elixir
  def guides_featuring(%Place{id: place_id}) do
    Repo.all(
      from g in Ethos.Guides.Guide,
        join: e in Ethos.Guides.Entry,
        on: e.guide_id == g.id,
        where: e.place_id == ^place_id and g.status == "published",
        distinct: true,
        order_by: [asc: g.title]
    )
  end
```

(Add `alias Ethos.Guides.Guide`-free full module paths as shown to avoid alias collision with `Places.Place`.)

- [ ] **Step 4: Run tests + full suite, commit**

```bash
mix format && git add -A && git commit -m "feat: entries link to places via privileged place_id"
```

---

### Task 5: Place pages with JSON-LD, OG, and sitemap

**Files:**
- Modify: `lib/ethos_web/router.ex` (public: `get "/p/:slug", PlaceController, :show`)
- Create: `lib/ethos_web/controllers/place_controller.ex`
- Create: `lib/ethos_web/controllers/place_html.ex`
- Create: `lib/ethos_web/controllers/place_html/show.html.heex`
- Modify: `lib/ethos_web/controllers/sitemap_controller.ex`
- Test: `test/ethos_web/controllers/place_controller_test.exs`

**Interfaces:**
- Consumes: `Places.get_place_by_slug/1`, `Places.guides_featuring/1` (Tasks 3-4), `EthosWeb.Markdown.render/1` + `excerpt/2`, `EthosWeb.Url.safe_http?/1`.
- Produces: route `GET /p/:slug`; `EthosWeb.PlaceHTML.schema_type/1` (kind string → schema.org type string). Task 7 modifies this controller/template to add check-off.

- [ ] **Step 1: Failing tests**

`test/ethos_web/controllers/place_controller_test.exs`:

```elixir
defmodule EthosWeb.PlaceControllerTest do
  use EthosWeb.ConnCase, async: true

  alias Ethos.Places

  @attrs %{
    slug: "palace-theater-waterbury",
    name: "Palace Theater",
    kind: "theater",
    town: "Waterbury",
    state: "Connecticut",
    county: "New Haven County",
    summary: "A 1922 Thomas Lamb movie palace.",
    history: "Designed by **Thomas Lamb**.",
    address: "100 E. Main St., Waterbury, CT 06702",
    official_url: "https://palacetheaterct.org",
    photos: [
      %{
        "src" => "/photos/ct/waterbury/palace-theater.jpg",
        "thumb" => "/photos/ct/waterbury/palace-theater_thumb.jpg",
        "title" => "Palace Theater",
        "description" => "The marquee.",
        "author" => "Jane Doe",
        "license" => "CC BY-SA 4.0",
        "source_url" => "https://commons.wikimedia.org/wiki/File:Palace.jpg"
      }
    ]
  }

  test "renders place with JSON-LD type, attribution, breadcrumb", %{conn: conn} do
    Places.upsert_place!(@attrs)
    html = conn |> get(~p"/p/palace-theater-waterbury") |> html_response(200)

    assert html =~ "Palace Theater"
    assert html =~ "PerformingArtsTheater"
    assert html =~ "BreadcrumbList"
    assert html =~ "Jane Doe"
    assert html =~ "CC BY-SA 4.0"
    assert html =~ ~s(rel="nofollow noopener")
    assert html =~ "data-copy-url"
    assert html =~ "og:image"
  end

  test "closed place shows banner, no booking CTA", %{conn: conn} do
    Places.upsert_place!(%{@attrs | status: "closed", booking_url: "https://example.com/book"})
    html = conn |> get(~p"/p/palace-theater-waterbury") |> html_response(200)
    assert html =~ "Permanently closed"
    refute html =~ "https://example.com/book"
  end

  test "unknown slug 404s", %{conn: conn} do
    assert conn |> get(~p"/p/nope") |> html_response(404)
  end

  test "restaurant kind maps to Restaurant JSON-LD", %{conn: conn} do
    Places.upsert_place!(%{@attrs | slug: "dine-x", name: "Dine X", kind: "restaurant", photos: []})
    html = conn |> get(~p"/p/dine-x") |> html_response(200)
    assert html =~ ~s("@type":"Restaurant")
  end

  test "sitemap includes place urls", %{conn: conn} do
    Places.upsert_place!(@attrs)
    xml = conn |> get(~p"/sitemap.xml") |> response(200)
    assert xml =~ "/p/palace-theater-waterbury</loc>"
  end
end
```

- [ ] **Step 2: Run to verify failure**, then add the route (public browser scope):

```elixir
    get "/p/:slug", PlaceController, :show
```

- [ ] **Step 3: Controller**

`lib/ethos_web/controllers/place_controller.ex`:

```elixir
defmodule EthosWeb.PlaceController do
  use EthosWeb, :controller

  alias Ethos.Places

  def show(conn, %{"slug" => slug}) do
    case Places.get_place_by_slug(slug) do
      nil ->
        conn |> put_status(:not_found) |> put_view(EthosWeb.ErrorHTML) |> render(:"404")

      place ->
        featured = Places.guides_featuring(place)
        meta_description = EthosWeb.Markdown.excerpt(place.summary, 160)
        first_photo = List.first(place.photos)

        og = %{
          title: "#{place.name} — #{place.town}, #{place.state}",
          description: meta_description,
          image: first_photo && url(~p"/") <> String.trim_leading(first_photo["src"], "/"),
          type: "website",
          url: url(~p"/p/#{place.slug}")
        }

        render(conn, :show,
          place: place,
          featured_guides: featured,
          page_title: "#{place.name} — #{place.town}, #{place.state}",
          page_og: og,
          page_meta_description: meta_description,
          page_canonical: url(~p"/p/#{place.slug}"),
          json_ld: [place_ld(place, meta_description), breadcrumb_ld(place)]
        )
    end
  end

  defp place_ld(place, description) do
    base = %{
      "@context" => "https://schema.org",
      "@type" => EthosWeb.PlaceHTML.schema_type(place.kind),
      "name" => place.name,
      "description" => description,
      "url" => url(~p"/p/#{place.slug}")
    }

    base
    |> maybe_put("image", case List.first(place.photos) do
      nil -> nil
      p -> url(~p"/") <> String.trim_leading(p["src"], "/")
    end)
    |> maybe_put("address", place.address && %{
      "@type" => "PostalAddress",
      "streetAddress" => place.address,
      "addressLocality" => place.town,
      "addressRegion" => place.state,
      "addressCountry" => "US"
    })
  end

  defp maybe_put(map, _key, nil), do: map
  defp maybe_put(map, key, value), do: Map.put(map, key, value)

  defp breadcrumb_ld(place) do
    %{
      "@context" => "https://schema.org",
      "@type" => "BreadcrumbList",
      "itemListElement" => [
        %{"@type" => "ListItem", "position" => 1, "name" => "Ethos", "item" => url(~p"/")},
        %{"@type" => "ListItem", "position" => 2, "name" => "Destinations", "item" => url(~p"/destinations")},
        %{"@type" => "ListItem", "position" => 3, "name" => place.state, "item" => url(~p"/destinations/#{place.state_slug}")},
        %{"@type" => "ListItem", "position" => 4, "name" => place.county, "item" => url(~p"/destinations/#{place.state_slug}/#{place.county_slug}")},
        %{"@type" => "ListItem", "position" => 5, "name" => place.name, "item" => url(~p"/p/#{place.slug}")}
      ]
    }
  end
end
```

- [ ] **Step 4: View module + template**

`lib/ethos_web/controllers/place_html.ex`:

```elixir
defmodule EthosWeb.PlaceHTML do
  use EthosWeb, :html

  embed_templates "place_html/*"

  @schema_types %{
    "museum" => "Museum",
    "theater" => "PerformingArtsTheater",
    "restaurant" => "Restaurant",
    "cafe" => "CafeOrCoffeeShop",
    "brewery" => "Brewery",
    "hotel" => "Hotel",
    "bnb" => "BedAndBreakfast",
    "park" => "Park",
    "historic-site" => "LandmarksOrHistoricalBuildings",
    "amusement-park" => "AmusementPark"
  }

  def schema_type(kind), do: Map.get(@schema_types, kind, "TouristAttraction")

  def kind_label(kind), do: kind |> String.replace("-", " ") |> String.capitalize()
end
```

`lib/ethos_web/controllers/place_html/show.html.heex`:

```heex
<article class="mx-auto max-w-2xl px-4 py-10">
  <nav class="text-sm text-zinc-500">
    <.link navigate={~p"/destinations/#{@place.state_slug}"} class="underline">{@place.state}</.link>
    / <.link navigate={~p"/destinations/#{@place.state_slug}/#{@place.county_slug}"} class="underline">{@place.county}</.link>
    / {@place.town}
  </nav>

  <header class="mt-2 flex flex-wrap items-start justify-between gap-3">
    <div>
      <h1 class="text-3xl font-bold">{@place.name}</h1>
      <p class="mt-1 text-zinc-500">{kind_label(@place.kind)} · {@place.town}, {@place.state}</p>
    </div>
    <button
      type="button"
      data-copy-url={url(~p"/p/#{@place.slug}")}
      class="rounded-lg border px-3 py-1.5 text-sm hover:bg-zinc-50"
    >
      Copy link
    </button>
  </header>

  <p :if={@place.status == "closed"} class="mt-4 rounded-lg bg-red-50 p-3 text-sm text-red-700">
    Permanently closed. This page is kept for reference.
  </p>

  <img
    :if={first = List.first(@place.photos)}
    src={first["src"]}
    alt={first["title"]}
    class="mt-6 w-full rounded-xl"
  />

  <div class="prose mt-6">{EthosWeb.Markdown.render(@place.summary)}</div>

  <section :if={@place.history} class="mt-8">
    <h2 class="text-xl font-semibold">History</h2>
    <div class="prose mt-2">{EthosWeb.Markdown.render(@place.history)}</div>
  </section>

  <section class="mt-8 rounded-xl border p-5 text-sm">
    <h2 class="font-semibold">Visit</h2>
    <p :if={@place.address} class="mt-2 text-zinc-600">{@place.address}</p>
    <p :if={EthosWeb.Url.safe_http?(@place.official_url)} class="mt-2">
      <a href={@place.official_url} class="underline" rel="nofollow">Official website</a>
    </p>
    <a
      :if={@place.status == "open" && EthosWeb.Url.safe_http?(@place.booking_url)}
      href={@place.booking_url}
      rel="sponsored nofollow noopener"
      target="_blank"
      class="mt-3 inline-flex items-center gap-2 rounded-lg bg-amber-500 px-4 py-2 text-sm font-medium text-white hover:bg-amber-600"
    >
      Book or buy tickets →
    </a>
  </section>

  <section :if={length(@place.photos) > 1} class="mt-8">
    <h2 class="text-xl font-semibold">Photos</h2>
    <div class="mt-3 grid grid-cols-2 gap-3 sm:grid-cols-3">
      <figure :for={p <- Enum.drop(@place.photos, 1)}>
        <a href={p["src"]} target="_blank" rel="noopener">
          <img src={p["thumb"]} alt={p["title"]} loading="lazy" class="w-full rounded-lg" />
        </a>
        <figcaption class="mt-1 text-xs text-zinc-500">{p["title"]}</figcaption>
      </figure>
    </div>
  </section>

  <section :if={@place.photos != []} class="mt-4 text-xs text-zinc-400">
    <p :for={p <- @place.photos}>
      Photo "{p["title"]}": {p["author"]}, {p["license"]}, via
      <a href={p["source_url"]} class="underline" rel="nofollow noopener">Wikimedia Commons</a>
    </p>
  </section>

  <section :if={@featured_guides != []} class="mt-8">
    <h2 class="text-xl font-semibold">Featured in these guides</h2>
    <ul class="mt-3 space-y-2">
      <li :for={g <- @featured_guides}>
        <.link navigate={~p"/g/#{g.slug}"} class="underline">{g.title}</.link>
      </li>
    </ul>
  </section>
</article>
```

- [ ] **Step 5: Sitemap** — in `sitemap_controller.ex`, alias `Ethos.Places` and append after the guide URLs:

```elixir
        Enum.map(Ethos.Places.list_places(), fn p ->
          %{loc: url(~p"/p/#{p.slug}"), lastmod: DateTime.to_date(p.updated_at)}
        end)
```

- [ ] **Step 6: Run tests + suite, commit**

```bash
mix format && git add -A && git commit -m "feat: public place pages with typed JSON-LD, OG, sitemap"
```

---

### Task 6: Copy-link buttons (plain JS, works on dead views)

**Files:**
- Modify: `assets/js/app.js`
- Modify: `lib/ethos_web/controllers/guide_html.ex` (add `entry_share_url/2`)
- Modify: `lib/ethos_web/controllers/guide_html/show.html.heex` (button per entry)
- Test: `test/ethos_web/controllers/copy_link_test.exs`

**Interfaces:**
- Consumes: `entry.place` preload (Task 4), place page `data-copy-url` button (Task 5, already rendered).
- Produces: `EthosWeb.GuideHTML.entry_share_url(guide, entry)` → absolute URL string (place URL when `entry.place` set, else `/g/{slug}#entry-{id}`); global click listener for `[data-copy-url]`.

- [ ] **Step 1: Failing tests**

`test/ethos_web/controllers/copy_link_test.exs`:

```elixir
defmodule EthosWeb.CopyLinkTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.{Guides, Places}

  test "entries render copy buttons: place URL when linked, anchor otherwise", %{conn: conn} do
    guide = published_guide_fixture()

    place =
      Places.upsert_place!(%{
        slug: "palace-theater-waterbury",
        name: "Palace Theater",
        kind: "theater",
        town: "Waterbury",
        state: "Connecticut",
        county: "New Haven County",
        summary: "Historic theater."
      })

    {:ok, linked} =
      Guides.create_entry(guide, %{"kind" => "sight", "name" => "Palace", "place_id" => place.id}, :privileged)

    {:ok, plain} = Guides.create_entry(guide, %{"kind" => "food", "name" => "Diner"})

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    base = EthosWeb.Endpoint.url()
    assert html =~ ~s(data-copy-url="#{base}/p/palace-theater-waterbury")
    assert html =~ ~s(data-copy-url="#{base}/g/#{guide.slug}#entry-#{plain.id}")
    assert linked.place_id == place.id
  end
end
```

- [ ] **Step 2: Run to verify failure**, then implement.

`guide_html.ex` — add:

```elixir
  def entry_share_url(guide, entry) do
    case entry.place do
      %{slug: slug} -> url(~p"/p/#{slug}")
      _ -> url(~p"/g/#{guide.slug}") <> "#entry-#{entry.id}"
    end
  end
```

(`entry.place` may be `nil` or `%Ecto.Association.NotLoaded{}` — the `%{slug: slug}` map-pattern matches only a loaded struct; both fall to the anchor branch. `use EthosWeb, :html` already imports verified routes `url/1`.)

`show.html.heex` — inside the entry `<li>`, in the header flex div after the name/kind block, add:

```heex
        <button
          type="button"
          data-copy-url={entry_share_url(@guide, entry)}
          class="shrink-0 rounded-lg border px-2 py-1 text-xs text-zinc-500 hover:bg-zinc-50"
        >
          Copy link
        </button>
```

Also, when the entry has a linked place, make the entry name link to the place page instead of the enrichment URL: replace the name block's condition so `entry.place` wins:

```heex
          <p class="font-semibold text-lg">
            <%= cond do %>
              <% match?(%{slug: _}, entry.place) -> %>
                <.link navigate={~p"/p/#{entry.place.slug}"} class="hover:underline">{entry.name}</.link>
              <% entry.enrichment && entry.enrichment["official_url"] &&
                   EthosWeb.Url.safe_http?(entry.enrichment["official_url"]) -> %>
                <a href={entry.enrichment["official_url"]} class="hover:underline" rel="nofollow">{entry.name}</a>
              <% true -> %>
                {entry.name}
            <% end %>
          </p>
```

`assets/js/app.js` — after the `phx:copy` listener, add:

```javascript
// Copy-link buttons (server-rendered pages and LiveViews alike)
document.addEventListener("click", (e) => {
  const btn = e.target.closest("[data-copy-url]")
  if (!btn) return
  const url = btn.dataset.copyUrl
  const done = () => {
    const prev = btn.textContent
    btn.textContent = "Copied!"
    setTimeout(() => { btn.textContent = prev }, 1500)
  }
  if (navigator.clipboard && navigator.clipboard.writeText) {
    navigator.clipboard.writeText(url).then(done, () => window.prompt("Copy this link:", url))
  } else {
    window.prompt("Copy this link:", url)
  }
})
```

- [ ] **Step 3: Run tests + suite, commit**

```bash
mix format && git add -A && git commit -m "feat: copy-link buttons on place pages and guide entries"
```

---

### Task 7: Place visits (check-offs)

**Files:**
- Create: `priv/repo/migrations/20260822123000_create_place_visits.exs`
- Create: `lib/ethos/visits/place_visit.ex`
- Create: `lib/ethos/visits.ex`
- Modify: `lib/ethos_web/router.ex` (authenticated: `post "/p/:slug/visit", PlaceController, :visit`)
- Modify: `lib/ethos_web/controllers/place_controller.ex` (`:visit` action; `show` assigns `visited?`)
- Modify: `lib/ethos_web/controllers/place_html/show.html.heex` (check-off button)
- Test: `test/ethos/visits_test.exs`, `test/ethos_web/controllers/place_visit_test.exs`

**Interfaces:**
- Consumes: `Places` context (Task 3), `EthosWeb.ConnCase` helpers (`register_and_log_in_user`), `Ethos.AccountsFixtures.user_fixture/0`.
- Produces: `Visits.toggle_visit(user, place)` → `{:ok, :visited} | {:ok, :unvisited} | {:error, :closed}`; `Visits.visited?(user, place)` → boolean; `Visits.count_for_user/1`, `Visits.count_for_user_by_town(user, town_slug)`, `Visits.count_for_user_by_kinds(user, kinds)` → integers; `Visits.count_for_user_in_county(user, state_slug, county_slug)` → integer. Task 8 consumes all of these.

- [ ] **Step 1: Migration**

```elixir
defmodule Ethos.Repo.Migrations.CreatePlaceVisits do
  use Ecto.Migration

  def change do
    create table(:place_visits) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :place_id, references(:places, on_delete: :delete_all), null: false
      timestamps(type: :utc_datetime)
    end

    create unique_index(:place_visits, [:user_id, :place_id])
    create index(:place_visits, [:place_id])
  end
end
```

- [ ] **Step 2: Failing context tests**

`test/ethos/visits_test.exs`:

```elixir
defmodule Ethos.VisitsTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.{Places, Visits}

  defp place!(slug, overrides \\ %{}) do
    Places.upsert_place!(
      Map.merge(
        %{
          slug: slug,
          name: slug,
          kind: "museum",
          town: "Waterbury",
          state: "Connecticut",
          county: "New Haven County",
          summary: "x"
        },
        overrides
      )
    )
  end

  test "toggle_visit creates then removes; visited? tracks" do
    user = user_fixture()
    place = place!("mattatuck-museum")

    assert {:ok, :visited} = Visits.toggle_visit(user, place)
    assert Visits.visited?(user, place)
    assert {:ok, :unvisited} = Visits.toggle_visit(user, place)
    refute Visits.visited?(user, place)
  end

  test "closed places cannot be checked off" do
    user = user_fixture()
    place = place!("gone", %{status: "closed"})
    assert {:error, :closed} = Visits.toggle_visit(user, place)
  end

  test "count helpers" do
    user = user_fixture()
    {:ok, :visited} = Visits.toggle_visit(user, place!("a", %{kind: "restaurant"}))
    {:ok, :visited} = Visits.toggle_visit(user, place!("b", %{kind: "cafe"}))
    {:ok, :visited} = Visits.toggle_visit(user, place!("c", %{town: "Woodbury", county: "Litchfield County"}))

    assert Visits.count_for_user(user) == 3
    assert Visits.count_for_user_by_town(user, "waterbury") == 2
    assert Visits.count_for_user_by_kinds(user, ["restaurant", "cafe"]) == 2
    assert Visits.count_for_user_in_county(user, "connecticut", "litchfield-county") == 1
  end
end
```

- [ ] **Step 3: Run to verify failure**, then implement.

`lib/ethos/visits/place_visit.ex`:

```elixir
defmodule Ethos.Visits.PlaceVisit do
  use Ecto.Schema

  schema "place_visits" do
    belongs_to :user, Ethos.Accounts.User
    belongs_to :place, Ethos.Places.Place
    timestamps(type: :utc_datetime)
  end
end
```

`lib/ethos/visits.ex`:

```elixir
defmodule Ethos.Visits do
  import Ecto.Query, warn: false

  alias Ethos.Repo
  alias Ethos.Places.Place
  alias Ethos.Visits.PlaceVisit

  def toggle_visit(_user, %Place{status: "closed"}), do: {:error, :closed}

  def toggle_visit(user, %Place{} = place) do
    case Repo.get_by(PlaceVisit, user_id: user.id, place_id: place.id) do
      nil ->
        %PlaceVisit{user_id: user.id, place_id: place.id}
        |> Repo.insert!(on_conflict: :nothing)

        {:ok, :visited}

      visit ->
        Repo.delete(visit)
        {:ok, :unvisited}
    end
  end

  def visited?(user, %Place{} = place) do
    Repo.exists?(from v in PlaceVisit, where: v.user_id == ^user.id and v.place_id == ^place.id)
  end

  def count_for_user(user) do
    Repo.one(from v in PlaceVisit, where: v.user_id == ^user.id, select: count(v.id))
  end

  def count_for_user_by_town(user, town_slug) do
    Repo.one(
      from v in PlaceVisit,
        join: p in Place,
        on: v.place_id == p.id,
        where: v.user_id == ^user.id and p.town_slug == ^town_slug,
        select: count(v.id)
    )
  end

  def count_for_user_by_kinds(user, kinds) do
    Repo.one(
      from v in PlaceVisit,
        join: p in Place,
        on: v.place_id == p.id,
        where: v.user_id == ^user.id and p.kind in ^kinds,
        select: count(v.id)
    )
  end

  def count_for_user_in_county(user, state_slug, county_slug) do
    Repo.one(
      from v in PlaceVisit,
        join: p in Place,
        on: v.place_id == p.id,
        where:
          v.user_id == ^user.id and p.state_slug == ^state_slug and
            p.county_slug == ^county_slug,
        select: count(v.id)
    )
  end
end
```

- [ ] **Step 4: Route + controller + template**

Router, inside the existing `:require_authenticated_user` scope (the plain-controller section near `post "/g/:slug/entries/:entry_id/research"`):

```elixir
    post "/p/:slug/visit", PlaceController, :visit
```

`place_controller.ex` — in `show`, add assigns:

```elixir
        current_user = conn.assigns[:current_user]

        visited? =
          if current_user, do: Ethos.Visits.visited?(current_user, place), else: false
```

(pass `visited?: visited?` to `render/3`). Add the action:

```elixir
  def visit(conn, %{"slug" => slug}) do
    place = Places.get_place_by_slug!(slug)
    user = conn.assigns.current_user

    conn =
      case Ethos.Visits.toggle_visit(user, place) do
        {:ok, :visited} -> put_flash(conn, :info, "Checked off #{place.name}!")
        {:ok, :unvisited} -> put_flash(conn, :info, "Removed #{place.name} from your visits.")
        {:error, :closed} -> put_flash(conn, :error, "#{place.name} is permanently closed.")
      end

    redirect(conn, to: ~p"/p/#{place.slug}")
  end
```

`place_html/show.html.heex` — in the header, next to the Copy link button:

```heex
    <div :if={@place.status == "open"}>
      <%= if @current_user do %>
        <form action={~p"/p/#{@place.slug}/visit"} method="post">
          <input type="hidden" name="_csrf_token" value={Plug.CSRFProtection.get_csrf_token()} />
          <%= if @visited? do %>
            <button class="rounded-lg bg-emerald-600 px-3 py-1.5 text-sm text-white hover:bg-emerald-700">
              ✓ Been here
            </button>
          <% else %>
            <button class="rounded-lg border px-3 py-1.5 text-sm hover:bg-zinc-50">
              I've been here
            </button>
          <% end %>
        </form>
      <% else %>
        <.link navigate={~p"/users/log_in"} class="rounded-lg border px-3 py-1.5 text-sm hover:bg-zinc-50">
          Log in to track places
        </.link>
      <% end %>
    </div>
```

Note: `show/2` must always assign `visited?` (false when logged out) so `@visited?` is defined on every render.

- [ ] **Step 5: Controller tests**

`test/ethos_web/controllers/place_visit_test.exs`:

```elixir
defmodule EthosWeb.PlaceVisitTest do
  use EthosWeb.ConnCase, async: true

  alias Ethos.{Places, Visits}

  @attrs %{
    slug: "mattatuck-museum",
    name: "Mattatuck Museum",
    kind: "museum",
    town: "Waterbury",
    state: "Connecticut",
    county: "New Haven County",
    summary: "x"
  }

  setup :register_and_log_in_user

  test "POST toggles visit and flashes", %{conn: conn, user: user} do
    place = Places.upsert_place!(@attrs)

    conn2 = post(conn, ~p"/p/#{place.slug}/visit")
    assert redirected_to(conn2) == ~p"/p/#{place.slug}"
    assert Visits.visited?(user, place)

    conn3 = post(conn, ~p"/p/#{place.slug}/visit")
    assert redirected_to(conn3) == ~p"/p/#{place.slug}"
    refute Visits.visited?(user, place)
  end

  test "closed place flashes error", %{conn: conn} do
    place = Places.upsert_place!(Map.put(@attrs, :status, "closed"))
    conn = post(conn, ~p"/p/#{place.slug}/visit")
    assert Phoenix.Flash.get(conn.assigns.flash, :error) =~ "permanently closed"
  end

  test "requires auth" do
    conn = build_conn()
    place = Places.upsert_place!(@attrs)
    conn = post(conn, ~p"/p/#{place.slug}/visit")
    assert redirected_to(conn) == ~p"/users/log_in"
  end
end
```

- [ ] **Step 6: Run both test files + suite, commit**

```bash
mix format && git add -A && git commit -m "feat: place visit check-offs with auth-gated toggle"
```

---

### Task 8: Explorer badges

**Files:**
- Create: `priv/repo/migrations/20260822124000_create_user_badges.exs`
- Create: `lib/ethos/badges/user_badge.ex`
- Create: `lib/ethos/badges.ex`
- Modify: `lib/ethos_web/controllers/place_controller.ex` (award after visit)
- Create: `lib/ethos_web/controllers/badge_controller.ex`
- Create: `lib/ethos_web/controllers/badge_html.ex`
- Create: `lib/ethos_web/controllers/badge_html/index.html.heex`
- Modify: `lib/ethos_web/router.ex` (authenticated: `get "/badges", BadgeController, :index`)
- Modify: `lib/ethos_web/components/layouts/app.html.heex` (nav link)
- Test: `test/ethos/badges_test.exs`, `test/ethos_web/controllers/badge_controller_test.exs`

**Interfaces:**
- Consumes: `Visits.count_for_user/1`, `count_for_user_by_town/2`, `count_for_user_by_kinds/2`, `count_for_user_in_county/3`, `Places.count_open_places_in_county/2` (Tasks 3, 7).
- Produces: `Badges.definitions/0` → list of `%{key, name, emoji, description, rule}` (static badges + one dynamic `county-complete-{county_slug}` per county that has open places); `Badges.check_and_award(user, place)` → list of newly awarded definition maps (empty when none); `Badges.earned_badges(user)` → `[%UserBadge{}]`.

- [ ] **Step 1: Migration**

```elixir
defmodule Ethos.Repo.Migrations.CreateUserBadges do
  use Ecto.Migration

  def change do
    create table(:user_badges) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :badge_key, :string, null: false
      add :awarded_at, :utc_datetime, null: false
      timestamps(type: :utc_datetime)
    end

    create unique_index(:user_badges, [:user_id, :badge_key])
  end
end
```

- [ ] **Step 2: Failing tests**

`test/ethos/badges_test.exs`:

```elixir
defmodule Ethos.BadgesTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.{Badges, Places, Visits}

  defp place!(slug, overrides \\ %{}) do
    Places.upsert_place!(
      Map.merge(
        %{
          slug: slug,
          name: slug,
          kind: "museum",
          town: "Waterbury",
          state: "Connecticut",
          county: "New Haven County",
          summary: "x"
        },
        overrides
      )
    )
  end

  defp visit!(user, place) do
    {:ok, :visited} = Visits.toggle_visit(user, place)
    Badges.check_and_award(user, place)
  end

  test "first visit awards first-steps only (with county not yet complete)" do
    user = user_fixture()
    place!("p1")
    place!("p2")

    awarded = visit!(user, Places.get_place_by_slug!("p1"))
    assert Enum.map(awarded, & &1.key) == ["first-steps"]
  end

  test "5th Waterbury place awards explorer-waterbury at the boundary" do
    user = user_fixture()
    places = for i <- 1..5, do: place!("wtby-#{i}")
    extra = place!("wtby-6")

    [p1, p2, p3, p4, p5] = places
    visit!(user, p1)
    visit!(user, p2)
    visit!(user, p3)
    assert visit!(user, p4) == []

    awarded = visit!(user, p5)
    assert "explorer-waterbury" in Enum.map(awarded, & &1.key)

    # already earned — not re-awarded
    assert visit!(user, extra) |> Enum.map(& &1.key) |> Enum.member?("explorer-waterbury") == false
  end

  test "foodie counts restaurant/cafe/brewery kinds" do
    user = user_fixture()

    for {slug, kind} <- [{"r1", "restaurant"}, {"r2", "cafe"}, {"r3", "brewery"}, {"r4", "restaurant"}] do
      visit!(user, place!(slug, %{kind: kind}))
    end

    awarded = visit!(user, place!("r5", %{kind: "restaurant"}))
    assert "foodie" in Enum.map(awarded, & &1.key)
  end

  test "county-complete awards when every open place in the county is visited" do
    user = user_fixture()
    a = place!("only-a", %{town: "Woodbury", county: "Litchfield County"})
    b = place!("only-b", %{town: "Woodbury", county: "Litchfield County"})
    place!("closed-c", %{town: "Woodbury", county: "Litchfield County", status: "closed"})

    visit!(user, a)
    awarded = visit!(user, b)
    assert "county-complete-litchfield-county" in Enum.map(awarded, & &1.key)
  end

  test "un-visiting does not revoke badges" do
    user = user_fixture()
    p = place!("keep")
    awarded_keys = visit!(user, p) |> Enum.map(& &1.key) |> Enum.sort()
    # sole open place in its county: both badges land on the first visit
    assert awarded_keys == ["county-complete-new-haven-county", "first-steps"]

    {:ok, :unvisited} = Visits.toggle_visit(user, p)

    assert Badges.earned_badges(user) |> Enum.map(& &1.badge_key) |> Enum.sort() ==
             awarded_keys
  end

  test "definitions include dynamic county badges for counties with open places" do
    place!("x1")
    keys = Badges.definitions() |> Enum.map(& &1.key)
    assert "county-complete-new-haven-county" in keys
    assert "first-steps" in keys
  end
end
```

- [ ] **Step 3: Run to verify failure**, then implement.

`lib/ethos/badges/user_badge.ex`:

```elixir
defmodule Ethos.Badges.UserBadge do
  use Ecto.Schema

  schema "user_badges" do
    belongs_to :user, Ethos.Accounts.User
    field :badge_key, :string
    field :awarded_at, :utc_datetime
    timestamps(type: :utc_datetime)
  end
end
```

`lib/ethos/badges.ex`:

```elixir
defmodule Ethos.Badges do
  @moduledoc """
  Explorer badges. Definitions live in code; earned badges are rows in
  `user_badges`. Badges are awarded on visit check-off and never revoked.
  Zero AI involvement — plain Ecto counts.
  """

  import Ecto.Query, warn: false
  require Logger

  alias Ethos.Repo
  alias Ethos.Badges.UserBadge
  alias Ethos.Places
  alias Ethos.Places.Place
  alias Ethos.Visits

  @food_kinds ~w(restaurant cafe brewery)
  @history_kinds ~w(museum historic-site theater)

  @static_defs [
    %{key: "first-steps", name: "First Steps", emoji: "👣",
      description: "Check off your first place.", rule: {:total, 1}},
    %{key: "explorer-waterbury", name: "Brass City Explorer", emoji: "🏭",
      description: "Check off 5 places in Waterbury.", rule: {:town, "waterbury", 5}},
    %{key: "explorer-danbury", name: "Hat City Explorer", emoji: "🎩",
      description: "Check off 5 places in Danbury.", rule: {:town, "danbury", 5}},
    %{key: "explorer-middlebury", name: "Middlebury Explorer", emoji: "🎡",
      description: "Check off 3 places in Middlebury.", rule: {:town, "middlebury", 3}},
    %{key: "explorer-southbury", name: "Southbury Explorer", emoji: "🌳",
      description: "Check off 3 places in Southbury.", rule: {:town, "southbury", 3}},
    %{key: "explorer-woodbury", name: "Woodbury Explorer", emoji: "🪑",
      description: "Check off 3 places in Woodbury.", rule: {:town, "woodbury", 3}},
    %{key: "foodie", name: "Local Foodie", emoji: "🍽️",
      description: "Check off 5 restaurants, cafes, or breweries.", rule: {:kinds, @food_kinds, 5}},
    %{key: "historian", name: "Time Traveler", emoji: "🏛️",
      description: "Check off 5 museums, historic sites, or theaters.", rule: {:kinds, @history_kinds, 5}}
  ]

  def definitions do
    @static_defs ++ county_defs()
  end

  defp county_defs do
    Repo.all(
      from p in Place,
        where: p.status == "open",
        group_by: [p.state_slug, p.county_slug, p.county],
        select: %{state_slug: p.state_slug, county_slug: p.county_slug, county: p.county}
    )
    |> Enum.map(fn c ->
      %{
        key: "county-complete-#{c.county_slug}",
        name: "#{c.county} Complete",
        emoji: "🗺️",
        description: "Check off every open place in #{c.county}.",
        rule: {:county_complete, c.state_slug, c.county_slug}
      }
    end)
  end

  @doc """
  Evaluates badge rules after a visit and inserts any newly earned badges.
  Never raises: a failure here must not break the visit itself.
  Returns the list of newly awarded definitions.
  """
  def check_and_award(user, %Place{} = place) do
    earned_keys = MapSet.new(earned_badges(user), & &1.badge_key)

    definitions()
    |> Enum.reject(&MapSet.member?(earned_keys, &1.key))
    |> Enum.filter(&rule_met?(&1.rule, user, place))
    |> Enum.filter(&insert_badge(user, &1))
  rescue
    error ->
      Logger.error("badge award failed: #{Exception.message(error)}")
      []
  end

  def earned_badges(user) do
    Repo.all(
      from b in UserBadge, where: b.user_id == ^user.id, order_by: [asc: b.awarded_at]
    )
  end

  defp rule_met?({:total, n}, user, _place), do: Visits.count_for_user(user) >= n

  defp rule_met?({:town, town_slug, n}, user, _place),
    do: Visits.count_for_user_by_town(user, town_slug) >= n

  defp rule_met?({:kinds, kinds, n}, user, _place),
    do: Visits.count_for_user_by_kinds(user, kinds) >= n

  defp rule_met?({:county_complete, state_slug, county_slug}, user, place) do
    # Only worth evaluating for the county just visited.
    place.state_slug == state_slug and place.county_slug == county_slug and
      Places.count_open_places_in_county(state_slug, county_slug) > 0 and
      Visits.count_for_user_in_county(user, state_slug, county_slug) >=
        Places.count_open_places_in_county(state_slug, county_slug)
  end

  defp insert_badge(user, def) do
    now = DateTime.utc_now() |> DateTime.truncate(:second)

    {count, _} =
      Repo.insert_all(
        UserBadge,
        [%{user_id: user.id, badge_key: def.key, awarded_at: now, inserted_at: now, updated_at: now}],
        on_conflict: :nothing,
        conflict_target: [:user_id, :badge_key]
      )

    count == 1
  end
end
```

- [ ] **Step 4: Wire awards into the visit action**

In `place_controller.ex` `visit/2`, replace the `{:ok, :visited}` branch:

```elixir
        {:ok, :visited} ->
          conn = put_flash(conn, :info, "Checked off #{place.name}!")

          case Ethos.Badges.check_and_award(user, place) do
            [] ->
              conn

            awarded ->
              names = Enum.map_join(awarded, ", ", &"#{&1.emoji} #{&1.name}")
              put_flash(conn, :info, "Checked off #{place.name}! Badge earned: #{names}")
          end
```

- [ ] **Step 5: Badges page + nav**

Router (authenticated plain-controller section):

```elixir
    get "/badges", BadgeController, :index
```

`badge_controller.ex`:

```elixir
defmodule EthosWeb.BadgeController do
  use EthosWeb, :controller

  alias Ethos.Badges

  def index(conn, _params) do
    user = conn.assigns.current_user
    earned = Map.new(Badges.earned_badges(user), &{&1.badge_key, &1.awarded_at})

    render(conn, :index,
      definitions: Badges.definitions(),
      earned: earned,
      page_title: "Your badges"
    )
  end
end
```

`badge_html.ex`:

```elixir
defmodule EthosWeb.BadgeHTML do
  use EthosWeb, :html

  embed_templates "badge_html/*"
end
```

`badge_html/index.html.heex`:

```heex
<div class="mx-auto max-w-2xl px-4 py-10">
  <h1 class="text-3xl font-bold">Your badges</h1>
  <p class="mt-1 text-zinc-500">
    Check off places you've visited to earn them.
  </p>
  <div class="mt-6 grid grid-cols-2 gap-4 sm:grid-cols-3">
    <div
      :for={d <- @definitions}
      class={[
        "rounded-xl border p-4 text-center",
        if(Map.has_key?(@earned, d.key), do: "border-amber-300 bg-amber-50", else: "opacity-50")
      ]}
    >
      <div class="text-3xl">{d.emoji}</div>
      <p class="mt-1 font-semibold">{d.name}</p>
      <p class="mt-1 text-xs text-zinc-500">{d.description}</p>
      <p :if={at = @earned[d.key]} class="mt-1 text-xs text-amber-600">
        Earned {Calendar.strftime(at, "%b %-d, %Y")}
      </p>
    </div>
  </div>
</div>
```

`layouts/app.html.heex` — inside the `@current_user` block, after "Your guides":

```heex
        <.link navigate={~p"/badges"} class="hover:text-zinc-700">
          Badges
        </.link>
```

- [ ] **Step 6: Controller test**

`test/ethos_web/controllers/badge_controller_test.exs`:

```elixir
defmodule EthosWeb.BadgeControllerTest do
  use EthosWeb.ConnCase, async: true

  alias Ethos.{Badges, Places, Visits}

  setup :register_and_log_in_user

  test "shows earned and locked badges", %{conn: conn, user: user} do
    place =
      Places.upsert_place!(%{
        slug: "p1",
        name: "P1",
        kind: "museum",
        town: "Waterbury",
        state: "Connecticut",
        county: "New Haven County",
        summary: "x"
      })

    {:ok, :visited} = Visits.toggle_visit(user, place)
    Badges.check_and_award(user, place)

    html = conn |> get(~p"/badges") |> html_response(200)
    assert html =~ "First Steps"
    assert html =~ "Earned"
    assert html =~ "Local Foodie"
  end

  test "requires auth" do
    conn = build_conn() |> get(~p"/badges")
    assert redirected_to(conn) == ~p"/users/log_in"
  end
end
```

- [ ] **Step 7: Run all new tests + suite, commit**

```bash
mix format && git add -A && git commit -m "feat: explorer badges awarded on check-off, badges page"
```

---

### Task 9: Wikimedia Commons photo pipeline

All content in Tasks 9–12 comes from the verified 2026-08 research passes
(deep-research + gap-fill, adversarially verified). Do not add places,
facts, or photos beyond what these tasks specify.

**Files:**
- Create: `lib/mix/tasks/ethos.optimize_ct_photos.ex`
- Create (binary, committed): `priv/static/photos/ct/{waterbury,middlebury,danbury,southbury,woodbury}/*.jpg` (30 photos × full+thumb = 60 JPEGs)
- Downloads (git-ignored `images/` dir): `images/ct/*`

**Interfaces:**
- Consumes: `Ethos.PhotoOptimizer.optimize/3` (src_path, out_dir, label) → `{:ok, %{jpg: path, thumb: path}}`. Vix reads JPEG/PNG/TIFF by content sniffing, so the PNG and TIF sources convert without extra steps.
- Produces: committed web JPEGs at `/photos/ct/{town}/{label}.jpg` + `_thumb.jpg`, referenced by Tasks 10-11.

- [ ] **Step 1: Download the 30 licensed originals**

All are Wikimedia Commons files with verified free licenses (PD/CC0/CC BY/CC BY-SA). Run from repo root (`images/` is git-ignored):

```bash
mkdir -p images/ct
UA="EthosPhotoFetch/1.0 (https://ethos.fly.dev; cryptcom@gmail.com)"
dl() { curl -fsSL -A "$UA" -o "images/ct/$1" "$2" && echo "ok $1"; }

# Waterbury
dl palace-theater.jpg "https://upload.wikimedia.org/wikipedia/commons/7/79/WaterburyCT_PalaceTheater.jpg"
dl palace-theater-marquee.jpg "https://upload.wikimedia.org/wikipedia/commons/c/c6/PalaceTheater-WaterburyCT-1.jpg"
dl mattatuck-museum.jpg "https://upload.wikimedia.org/wikipedia/commons/5/57/Mattatuck_Museum_Exterior.jpg"
dl mattatuck-museum-front.jpg "https://upload.wikimedia.org/wikipedia/commons/8/88/Mattatuck_Museum_1_-_front_exterior.JPG"
dl union-station-tower.jpg "https://upload.wikimedia.org/wikipedia/commons/3/3b/Waterbury_Union_Station_Clock_Tower%2C_Waterbury_CT%2C_US.jpg"
dl union-station-clock.jpg "https://upload.wikimedia.org/wikipedia/commons/b/b8/Clock_tower%2C_Waterbury_Union_Station.jpg"
dl waterbury-green-fountain.jpg "https://upload.wikimedia.org/wikipedia/commons/3/3f/Welton_Fountain_on_Waterbury_Green.jpg"
dl downtown-waterbury.jpg "https://upload.wikimedia.org/wikipedia/commons/7/7e/Downtown_Waterbury%2C_CT.jpg"
# Danbury
dl railway-museum-entrance.jpg "https://upload.wikimedia.org/wikipedia/commons/8/89/Danbury_Railway_Museum%3B_Main_Entrance.jpg"
dl railway-museum-station.jpg "https://upload.wikimedia.org/wikipedia/commons/a/a5/Danbury_Railroad_Museum.jpg"
dl railway-museum-acmu.jpg "https://upload.wikimedia.org/wikipedia/commons/8/8a/ACMU_at_Danbury_Railway_Museum.jpg"
dl danbury-museum.jpg "https://upload.wikimedia.org/wikipedia/commons/1/1e/Danbury_Museum_Streetside_New.jpg"
dl john-rider-house.jpg "https://upload.wikimedia.org/wikipedia/commons/1/15/John_Rider_House.jpg"
dl charles-ives-birthplace.jpg "https://upload.wikimedia.org/wikipedia/commons/c/cd/Main_entrance%2C_Charles_Ives_Birthplace.jpg"
dl main-street-danbury.jpg "https://upload.wikimedia.org/wikipedia/commons/e/e3/Main_Street%2C_Danbury%2C_Connecticut.jpg"
# Middlebury
dl quassy-sign.jpg "https://upload.wikimedia.org/wikipedia/commons/8/82/Quassy.jpg"
dl quassy-rides.jpg "https://upload.wikimedia.org/wikipedia/commons/a/aa/Quassy_Amusement_Park_-_48334465221.jpg"
dl middlebury-town-hall.jpg "https://upload.wikimedia.org/wikipedia/commons/f/f2/TownHallMiddleburyCT.jpg"
dl middlebury-sign.jpg "https://upload.wikimedia.org/wikipedia/commons/6/65/Middlebury%2C_CT.jpg"
# Woodbury
dl glebe-house.png "https://upload.wikimedia.org/wikipedia/commons/a/a5/GlebeHouse.png"
dl woodbury-old-town-hall.jpg "https://upload.wikimedia.org/wikipedia/commons/5/52/Greek_Revival_-_Woodbury%2C_CT_-_Woodbury_Old_Town_Hall_%281%29.jpg"
dl woodbury-historic-district.jpg "https://upload.wikimedia.org/wikipedia/commons/0/01/WoodburyCT_HistoricDistrictNumber2.jpg"
dl 1754-house.tif "https://upload.wikimedia.org/wikipedia/commons/1/15/Historic_American_Buildings_Survey_William_Rainey%2C_Photographer_GENERAL_VIEW_SHOWING_FRONT_AND_GABLE_END_-_Curtiss_House%2C_Woodbury%2C_Litchfield_County%2C_CT_HABS_CONN%2C3-WOO%2C6-1.tif"
# Southbury
dl kettletown-lake-zoar.jpg "https://upload.wikimedia.org/wikipedia/commons/4/4f/Kettletown_State_Park_4_-_Lake_Zoar_%28Housatonic_River%29.jpg"
dl kettletown-overlook.jpg "https://upload.wikimedia.org/wikipedia/commons/a/a7/Kettletown_State_Park_Miller_Trail_Lake_Zoar_Overloop.jpg"
dl bent-of-the-river.jpg "https://upload.wikimedia.org/wikipedia/commons/7/78/Audubon_Center_at_Bent_of_the_River_I.JPG"
dl bent-of-the-river-center.jpg "https://upload.wikimedia.org/wikipedia/commons/1/1f/Audubon_Center_Bent_of_the_River_1.jpg"
dl southbury-town-hall.jpg "https://upload.wikimedia.org/wikipedia/commons/a/a0/Southbury%2C_CT_Town_Hall.jpg"
dl south-britain-church.jpg "https://upload.wikimedia.org/wikipedia/commons/b/b1/SouthburyCT_SouthBritainCongregationalChurch.jpg"
dl lake-zoar-bridge.jpg "https://upload.wikimedia.org/wikipedia/commons/2/2c/Lake_Zoar_old_bridge_105.JPG"
ls images/ct | wc -l   # expect 30
```

If any URL 404s, find the same file's current direct URL via its Commons file page (listed in Task 10's attribution data) and retry; do not substitute a different photo.

- [ ] **Step 2: Create the mix task**

`lib/mix/tasks/ethos.optimize_ct_photos.ex` (mirrors `lib/mix/tasks/ethos.optimize_photos.ex` — read that file first and follow its structure exactly, including `Mix.Task.run("app.start")` if the Rome task does it):

```elixir
defmodule Mix.Tasks.Ethos.OptimizeCtPhotos do
  @shortdoc "Optimizes Connecticut source photos from images/ct/ into priv/static/photos/ct/"
  @moduledoc "Run after downloading Commons originals: mix ethos.optimize_ct_photos"
  use Mix.Task

  # {town_dir, label, source filename under images/ct/}
  @mapping [
    {"waterbury", "palace-theater", "palace-theater.jpg"},
    {"waterbury", "palace-theater-marquee", "palace-theater-marquee.jpg"},
    {"waterbury", "mattatuck-museum", "mattatuck-museum.jpg"},
    {"waterbury", "mattatuck-museum-front", "mattatuck-museum-front.jpg"},
    {"waterbury", "union-station-tower", "union-station-tower.jpg"},
    {"waterbury", "union-station-clock", "union-station-clock.jpg"},
    {"waterbury", "waterbury-green-fountain", "waterbury-green-fountain.jpg"},
    {"waterbury", "downtown-waterbury", "downtown-waterbury.jpg"},
    {"danbury", "railway-museum-entrance", "railway-museum-entrance.jpg"},
    {"danbury", "railway-museum-station", "railway-museum-station.jpg"},
    {"danbury", "railway-museum-acmu", "railway-museum-acmu.jpg"},
    {"danbury", "danbury-museum", "danbury-museum.jpg"},
    {"danbury", "john-rider-house", "john-rider-house.jpg"},
    {"danbury", "charles-ives-birthplace", "charles-ives-birthplace.jpg"},
    {"danbury", "main-street-danbury", "main-street-danbury.jpg"},
    {"middlebury", "quassy-sign", "quassy-sign.jpg"},
    {"middlebury", "quassy-rides", "quassy-rides.jpg"},
    {"middlebury", "middlebury-town-hall", "middlebury-town-hall.jpg"},
    {"middlebury", "middlebury-sign", "middlebury-sign.jpg"},
    {"woodbury", "glebe-house", "glebe-house.png"},
    {"woodbury", "woodbury-old-town-hall", "woodbury-old-town-hall.jpg"},
    {"woodbury", "woodbury-historic-district", "woodbury-historic-district.jpg"},
    {"woodbury", "1754-house", "1754-house.tif"},
    {"southbury", "kettletown-lake-zoar", "kettletown-lake-zoar.jpg"},
    {"southbury", "kettletown-overlook", "kettletown-overlook.jpg"},
    {"southbury", "bent-of-the-river", "bent-of-the-river.jpg"},
    {"southbury", "bent-of-the-river-center", "bent-of-the-river-center.jpg"},
    {"southbury", "southbury-town-hall", "southbury-town-hall.jpg"},
    {"southbury", "south-britain-church", "south-britain-church.jpg"},
    {"southbury", "lake-zoar-bridge", "lake-zoar-bridge.jpg"}
  ]

  @impl true
  def run(_args) do
    Mix.Task.run("app.start")

    Enum.each(@mapping, fn {town, label, src} ->
      src_path = Path.join(["images", "ct", src])
      out_dir = Path.join(["priv", "static", "photos", "ct", town])
      File.mkdir_p!(out_dir)

      case Ethos.PhotoOptimizer.optimize(src_path, out_dir, label) do
        {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
        {:error, reason} -> Mix.raise("failed #{src}: #{inspect(reason)}")
      end
    end)
  end
end
```

- [ ] **Step 3: Run it and verify**

```bash
mix ethos.optimize_ct_photos
find priv/static/photos/ct -name '*.jpg' | wc -l   # expect 60
```

Spot-check 3 outputs visually (Read the JPEG files for e.g. palace-theater, glebe-house, 1754-house) — confirm upright orientation and that the PNG/TIF conversions look clean.

- [ ] **Step 4: Commit**

```bash
mix format && git add lib/mix priv/static/photos/ct && git commit -m "feat: CT guide photos from Wikimedia Commons (attributed, optimized)"
```

---

### Task 10: Connecticut places seed (50 verified places)

**Files:**
- Create: `lib/ethos/seeds/connecticut_places.ex`
- Test: `test/ethos/seeds/connecticut_places_test.exs`

**Interfaces:**
- Consumes: `Places.upsert_place!/1` (Task 3), JPEG paths from Task 9.
- Produces: `Ethos.Seeds.ConnecticutPlaces.upsert_all!/0` → list of `%Place{}` (idempotent); place slugs referenced by Task 11's guide entries.

- [ ] **Step 1: Failing test**

`test/ethos/seeds/connecticut_places_test.exs`:

```elixir
defmodule Ethos.Seeds.ConnecticutPlacesTest do
  use Ethos.DataCase, async: true

  alias Ethos.Places
  alias Ethos.Seeds.ConnecticutPlaces

  test "upsert_all! is idempotent and seeds all towns" do
    first = ConnecticutPlaces.upsert_all!()
    second = ConnecticutPlaces.upsert_all!()
    assert length(first) == length(second)
    assert length(first) == 50
    assert Repo.aggregate(Places.Place, :count) == 50

    assert %{kind: "theater", county_slug: "new-haven-county"} =
             Places.get_place_by_slug!("palace-theater-waterbury")

    assert %{kind: "bnb", county_slug: "litchfield-county"} =
             Places.get_place_by_slug!("1754-house-woodbury")

    for town <- ~w(waterbury middlebury danbury southbury woodbury) do
      assert Places.list_places(town_slug: town) != []
    end
  end
end
```

- [ ] **Step 2: Run to verify failure**, then create the module.

`lib/ethos/seeds/connecticut_places.ex` — exact content (every fact below is from the verified research; transcribe faithfully, do not embellish):

```elixir
defmodule Ethos.Seeds.ConnecticutPlaces do
  @moduledoc """
  Seeds the 50 verified Connecticut places for the five-town guides
  (Waterbury, Middlebury, Danbury, Southbury, Woodbury). Idempotent:
  `upsert_all!/0` upserts by slug. All facts verified against official
  sources in the 2026-08 research passes; photos are Wikimedia Commons
  free-license images with attribution.
  """

  alias Ethos.Places

  @waterbury %{town: "Waterbury", state: "Connecticut", county: "New Haven County"}
  @middlebury %{town: "Middlebury", state: "Connecticut", county: "New Haven County"}
  @danbury %{town: "Danbury", state: "Connecticut", county: "Fairfield County"}
  @southbury %{town: "Southbury", state: "Connecticut", county: "New Haven County"}
  @woodbury %{town: "Woodbury", state: "Connecticut", county: "Litchfield County"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    waterbury() ++ middlebury() ++ danbury() ++ southbury() ++ woodbury()
  end

  defp photo(town, label, title, description, author, license, source_url) do
    %{
      "src" => "/photos/ct/#{town}/#{label}.jpg",
      "thumb" => "/photos/ct/#{town}/#{label}_thumb.jpg",
      "title" => title,
      "description" => description,
      "author" => author,
      "license" => license,
      "source_url" => source_url
    }
  end

  defp waterbury do
    [
      Map.merge(@waterbury, %{
        slug: "palace-theater-waterbury",
        name: "Palace Theater",
        kind: "theater",
        address: "100 East Main Street, Waterbury, CT 06702",
        official_url: "https://palacetheaterct.org/",
        summary:
          "A grand movie palace on East Main Street, opened in 1922 for theater magnate Sylvester Poli and reopened in 2004 after a $30 million restoration. Today it hosts touring Broadway series, comedy, and concerts.",
        history:
          "Designed by Thomas W. Lamb, the most celebrated theater architect of his era, the Palace is one of only two survivors of Poli's roughly thirty-theater northeastern empire. It went dark in 1987, reopened in 2004, and is listed on the National Register of Historic Places.",
        photos: [
          photo("waterbury", "palace-theater", "Palace Theater facade",
            "The Palace Theater on East Main Street, Waterbury.", "Magicpiano",
            "CC BY-SA 4.0", "https://commons.wikimedia.org/wiki/File:WaterburyCT_PalaceTheater.jpg"),
          photo("waterbury", "palace-theater-marquee", "Palace Theater marquee",
            "The restored marquee of Waterbury's Palace Theater.", "Koskenart",
            "CC BY-SA 4.0", "https://commons.wikimedia.org/wiki/File:PalaceTheater-WaterburyCT-1.jpg")
        ]
      }),
      Map.merge(@waterbury, %{
        slug: "mattatuck-museum",
        name: "Mattatuck Museum",
        kind: "museum",
        address: "144 West Main Street, Waterbury, CT 06702",
        official_url: "https://www.mattmuseum.org/",
        summary:
          "Waterbury's art and history museum on the Green, founded in 1877 as the Mattatuck Historical Society. It pairs American art with the industrial story of the Naugatuck Valley — including the Waterbury Button Museum's collection of more than 10,000 buttons. Open Tue-Sat 11-5, Sun 11-4.",
        history:
          "The museum keeps the Brass City's story: by 1840 America's entire brass industry was concentrated in the Naugatuck Valley around Waterbury. The Button Museum collection was donated in 1999 by the Waterbury Button Company, which has made buttons since 1812.",
        photos: [
          photo("waterbury", "mattatuck-museum", "Mattatuck Museum",
            "The Mattatuck Museum's modern exterior on West Main Street.", "DavidMacharelli",
            "CC BY-SA 4.0", "https://commons.wikimedia.org/wiki/File:Mattatuck_Museum_Exterior.jpg"),
          photo("waterbury", "mattatuck-museum-front", "Mattatuck Museum entrance",
            "Front exterior of the Mattatuck Museum.", "Jllm06",
            "CC BY-SA 4.0", "https://commons.wikimedia.org/wiki/File:Mattatuck_Museum_1_-_front_exterior.JPG")
        ]
      }),
      Map.merge(@waterbury, %{
        slug: "seven-angels-theatre",
        name: "Seven Angels Theatre",
        kind: "theater",
        address: "1 Plank Road, Waterbury, CT 06705",
        official_url: "https://sevenangelstheatre.org/",
        summary:
          "Greater Waterbury's professional regional theatre, staging musical theatre, comedy, concerts, and educational programs with local and national talent.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "holy-land-usa",
        name: "Holy Land USA",
        kind: "historic-site",
        address: "Slocum Street, Waterbury, CT",
        summary:
          "An 18-acre hillside park of miniature Bethlehem and Jerusalem replicas crowned by a 65-foot illuminated cross visible from I-84. Built as a Catholic theme park, it closed in 1984, was revived by new owners, and reopened to visitors in 2014 during daylight hours.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "waterbury-union-station",
        name: "Waterbury Union Station",
        kind: "historic-site",
        address: "Meadow Street, Waterbury, CT",
        summary:
          "Waterbury's Union Station opened in 1909; its clock tower is the city's signature landmark and a favorite photo stop on any downtown walk.",
        photos: [
          photo("waterbury", "union-station-tower", "Union Station clock tower",
            "The clock tower of Waterbury Union Station.", "Hallettx",
            "CC BY-SA 4.0", "https://commons.wikimedia.org/wiki/File:Waterbury_Union_Station_Clock_Tower,_Waterbury_CT,_US.jpg"),
          photo("waterbury", "union-station-clock", "Clock tower detail",
            "Waterbury Union Station's clock tower seen from below.", "Daniel Case",
            "CC BY-SA 3.0", "https://commons.wikimedia.org/wiki/File:Clock_tower,_Waterbury_Union_Station.jpg")
        ]
      }),
      Map.merge(@waterbury, %{
        slug: "waterbury-green",
        name: "Waterbury Green",
        kind: "park",
        address: "West Main Street, Waterbury, CT",
        summary:
          "The historic green at the heart of downtown, centered on the Welton Fountain — the natural starting point for a walking loop past the Palace Theater and the Mattatuck Museum.",
        photos: [
          photo("waterbury", "waterbury-green-fountain", "Welton Fountain",
            "The Welton Fountain on the Waterbury Green.", "GrammarFascist",
            "CC BY-SA 4.0", "https://commons.wikimedia.org/wiki/File:Welton_Fountain_on_Waterbury_Green.jpg")
        ]
      }),
      Map.merge(@waterbury, %{
        slug: "diorio-restaurant",
        name: "Diorio Restaurant & Bar",
        kind: "restaurant",
        address: "231 Bank Street, Waterbury, CT",
        official_url: "https://www.diorios.com/",
        summary:
          "A longstanding fine-dining fixture on Bank Street downtown — white-tablecloth Italian-American with a classic bar that opens at 4 PM Monday through Saturday, dinner from 5.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "brass-works-brewing",
        name: "Brass Works Brewing Company",
        kind: "brewery",
        address: "2066 Thomaston Avenue, Waterbury, CT 06704",
        official_url: "https://www.brassworksbrewing.com/",
        summary:
          "Waterbury's brewery, named for the city's brass heritage, pouring nine-plus house beers in a Thomaston Avenue taproom with rotating food trucks.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "sweet-marias-waterbury",
        name: "Sweet Maria's",
        kind: "cafe",
        address: "159 Manor Avenue, Waterbury, CT 06705",
        official_url: "https://sweet-marias.com/",
        summary:
          "A beloved Waterbury bakery on Manor Avenue known for cakes, cookies, cupcakes, and biscotti — the owner has published a shelf of branded cookbooks.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "nardellis-grinder-shoppe",
        name: "Nardelli's Grinder Shoppe",
        kind: "restaurant",
        address: "540 Plank Road, Waterbury, CT 06705",
        official_url: "https://www.nardellis.com/",
        summary:
          "A Waterbury institution founded in 1922 and family-owned for three generations — repeatedly voted among Connecticut's best grinders, with two locations in the city.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "frankies-hot-dogs-waterbury",
        name: "Frankie's Hot Dogs",
        kind: "restaurant",
        address: "700 Watertown Avenue, Waterbury, CT 06708",
        official_url: "https://www.frankieshotdogs.com/",
        summary:
          "A drive-in hot dog institution born in Waterbury in 1937 and still family-owned, with three locations around the city.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "courtyard-waterbury-downtown",
        name: "Courtyard by Marriott Waterbury Downtown",
        kind: "hotel",
        address: "63 Grand Street, Waterbury, CT",
        official_url: "https://www.marriott.com/en-us/hotels/hvncw-courtyard-waterbury-downtown/overview/",
        summary:
          "Downtown Waterbury's main full-service hotel, steps from the Palace Theater and the Green — the practical base for a Brass City weekend.",
        photos: []
      })
    ]
  end

  defp middlebury do
    [
      Map.merge(@middlebury, %{
        slug: "quassy-amusement-park",
        name: "Quassy Amusement Park & Splash Away Bay",
        kind: "amusement-park",
        address: "2132 Middlebury Road (Route 64), Middlebury, CT 06762",
        official_url: "https://www.quassy.com/",
        summary:
          "One of America's last family-owned lakeside amusement parks, on Lake Quassapaug since 1908 — 20-plus rides including the award-winning Wooden Warrior wooden coaster, plus the Splash Away Bay waterpark. Open seasonally, roughly April through October.",
        history:
          "Quassy began as a trolley park: the electric line that reached Lake Quassapaug in 1908 turned the lake into a summer resort with swimming, dancing, and a carousel. Three Waterbury businessmen bought the park in 1937. 'Quassapaug' derives from a Native American term for 'Big Pond,' and a 2026 index named Quassy the most affordable theme park in America.",
        photos: [
          photo("middlebury", "quassy-sign", "Quassy entrance",
            "The entrance sign at Quassy Amusement Park.", "AskJoanne",
            "CC BY 3.0", "https://commons.wikimedia.org/wiki/File:Quassy.jpg"),
          photo("middlebury", "quassy-rides", "Quassy rides",
            "Rides at Quassy Amusement Park on Lake Quassapaug.", "Roller Coaster Philosophy",
            "CC BY 2.0", "https://commons.wikimedia.org/wiki/File:Quassy_Amusement_Park_-_48334465221.jpg")
        ]
      }),
      Map.merge(@middlebury, %{
        slug: "middlebury-greenway",
        name: "Middlebury Greenway",
        kind: "park",
        address: "Along Route 64 between Woodside Avenue and Middlebury Road, Middlebury, CT",
        official_url: "https://www.traillink.com/trail/middlebury-greenway/",
        summary:
          "A paved 4.5-mile trail along Route 64 following the roadbed of the electric trolley line that carried summer crowds toward Lake Quassapaug from 1908 to 1930. Notably hilly, lined with stone benches, and it ends near Quassy's gates.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "middlebury-historical-society",
        name: "Middlebury Historical Society Museum",
        kind: "museum",
        address: "4 Library Road, Middlebury, CT 06762",
        official_url: "https://middleburyhistoricalsociety.org/",
        summary:
          "The town's history museum and research center in an 1897 two-room schoolhouse near the Green — a National Register building that served as Middlebury's public library from 1935 to 1972.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "vyne-restaurant",
        name: "Vyne Restaurant & Bar",
        kind: "restaurant",
        address: "1365 Whittemore Road, Middlebury, CT 06762",
        official_url: "https://www.vynerestaurant.com/",
        summary:
          "Middlebury's fine-dining room: contemporary American with locally sourced ingredients, built on a family restaurant legacy on this site dating to the 1940s.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "brewbury-kitchen-tap",
        name: "Brewbury Kitchen & Tap",
        kind: "brewery",
        address: "1383 Whittemore Road, Middlebury, CT 06762",
        official_url: "https://www.brewbury.com/",
        summary:
          "House brewery and taproom with ten-plus beers on draft, a full menu of pizza, burgers, and wings, an outdoor patio, and enough TVs for any game day.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "pies-and-pub",
        name: "Pies & Pub",
        kind: "restaurant",
        address: "1 Store Road, Middlebury, CT 06762",
        official_url: "https://www.piesandpub.com/",
        summary:
          "Hand-tossed pizza and wings with 26 rotating craft drafts — a casual local anchor just off the Green.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "kitchen-64",
        name: "Kitchen 64",
        kind: "cafe",
        address: "590 Middlebury Road, Middlebury, CT 06762",
        official_url: "https://thekitchen64.com/",
        summary:
          "The town's breakfast-and-brunch spot, open daily from 6:30 AM — eggs Benedict, French toast, and the Caprese panini are the local favorites.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "maggie-mcflys-middlebury",
        name: "Maggie McFly's",
        kind: "restaurant",
        address: "6 Woodside Avenue, Middlebury, CT 06762",
        official_url: "https://maggiemcflys.com/middlebury/",
        summary:
          "A Connecticut-grown American restaurant and bar known for one of the most extensive menus around.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "senor-panchos-middlebury",
        name: "Señor Pancho's of Middlebury",
        kind: "restaurant",
        address: "530 Middlebury Road, Middlebury, CT 06762",
        official_url: "https://senorpanchos.com/",
        summary:
          "Family-run Mexican — one of five locations of one of Connecticut's oldest family Mexican restaurant groups.",
        photos: []
      })
    ]
  end

  defp danbury do
    [
      Map.merge(@danbury, %{
        slug: "danbury-railway-museum",
        name: "Danbury Railway Museum",
        kind: "museum",
        address: "120 White Street, Danbury, CT 06810",
        official_url: "https://www.danburyrail.org/",
        summary:
          "A working railroad museum in the fully restored 1903 Danbury Union Station, with a rail yard of more than 60 pieces of historic equipment. Open weekends 10-4; admission $10 (ages 3+), with train rides spring through October plus Santa trains in December.",
        photos: [
          photo("danbury", "railway-museum-entrance", "Danbury Railway Museum",
            "Main entrance of the Danbury Railway Museum in the 1903 Union Station.", "DanTD",
            "CC BY-SA 4.0", "https://commons.wikimedia.org/wiki/File:Danbury_Railway_Museum;_Main_Entrance.jpg"),
          photo("danbury", "railway-museum-acmu", "Vintage railcar",
            "A vintage ACMU railcar in the museum's rail yard.", "TriStateGuy",
            "CC BY 4.0", "https://commons.wikimedia.org/wiki/File:ACMU_at_Danbury_Railway_Museum.jpg")
        ]
      }),
      Map.merge(@danbury, %{
        slug: "danbury-museum-historical-society",
        name: "Danbury Museum & Historical Society",
        kind: "museum",
        address: "43 Main Street, Danbury, CT 06810",
        official_url: "https://danburymuseum.org",
        summary:
          "A seven-building Main Street campus preserving Danbury's history — Huntington Hall's exhibits, the birthplace of composer Charles Ives, and the Marian Anderson Studio. Hat City's hatting story lives here. Tours Wednesday-Saturday.",
        history:
          "Danbury made America's hats. Zadoc Benedict pioneered felt hat-making here in the late 1700s; by 1809 the town had 56 hat shops, and by 1880 Danbury turned out roughly 4.5 million hats a year. The trade's dark side — mercury poisoning known as the 'Danbury Shakes' — helped drive workplace-safety reform, and Connecticut banned mercury in hat manufacturing on December 1, 1941.",
        photos: [
          photo("danbury", "danbury-museum", "Danbury Museum",
            "Streetside view of the Danbury Museum & Historical Society campus.", "TulaneTim",
            "CC BY-SA 4.0", "https://commons.wikimedia.org/wiki/File:Danbury_Museum_Streetside_New.jpg"),
          photo("danbury", "john-rider-house", "John Rider House",
            "The John Rider House on the museum campus.", "Daniel Case",
            "CC BY-SA 3.0", "https://commons.wikimedia.org/wiki/File:John_Rider_House.jpg"),
          photo("danbury", "charles-ives-birthplace", "Charles Ives Birthplace",
            "Main entrance of the Charles Ives Birthplace.", "Danbury Museum",
            "CC BY-SA 4.0", "https://commons.wikimedia.org/wiki/File:Main_entrance,_Charles_Ives_Birthplace.jpg")
        ]
      }),
      Map.merge(@danbury, %{
        slug: "tarrywile-park",
        name: "Tarrywile Park & Mansion",
        kind: "park",
        address: "70 Southern Boulevard, Danbury, CT 06810",
        official_url: "https://www.tarrywile.com/",
        summary:
          "A 722-acre public park with 21 miles of hiking trails, two ponds, and a lake, centered on the 1897 Shingle-style Tarrywile Mansion (National Register). Open daily dawn to dusk, free.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "palace-danbury",
        name: "The Palace Danbury",
        kind: "theater",
        address: "165 Main Street, Danbury, CT 06810",
        official_url: "https://thepalacedanbury.com",
        summary:
          "Downtown Danbury's historic Main Street theater, presenting music, comedy, theater, and film — including the Manhattan Short Film Festival and touring acts.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "stanziatos-wood-fired-pizza",
        name: "Stanziato's Wood Fired Pizza",
        kind: "restaurant",
        address: "35 Lake Avenue Ext, Danbury, CT 06811",
        official_url: "https://www.stanziatos.com/",
        summary:
          "Artisanal 12-inch pizzas out of an Italian wood-fired oven running 800-plus degrees, sourced from nine regional farms and producers.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "tks-american-cafe",
        name: "TK's American Cafe",
        kind: "restaurant",
        address: "255 White Street, Danbury, CT 06810",
        official_url: "https://www.tksamericancafe.com/",
        summary:
          "A White Street fixture since 1990 — 76 wing flavors (ranked among Connecticut's best), 50 beers, and the area's favorite sports-bar crown.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "chucks-steak-house-danbury",
        name: "Chuck's Steak House & Margarita Grill",
        kind: "restaurant",
        address: "20 Segar Street, Danbury, CT 06810",
        official_url: "https://www.chucksdanbury.com/",
        summary:
          "Hand-cut Midwestern steaks and an extensive salad bar; the Danbury location has been serving since 1973, with live music Tuesdays and Thursdays.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "charter-oak-brewing",
        name: "Charter Oak Brewing Co.",
        kind: "brewery",
        address: "39B Shelter Rock Road, Danbury, CT 06810",
        official_url: "https://charteroakbrewing.com/",
        summary:
          "Named Best Brewery and Taproom in Connecticut by Connecticut Magazine two years running, with ten rotating draft lines on Shelter Rock Road.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "hotel-zero-degrees-danbury",
        name: "Hotel Zero Degrees Danbury",
        kind: "hotel",
        address: "15 Milestone Road, Danbury, CT 06810",
        official_url: "https://www.hotelzerodegrees.com/",
        summary:
          "Danbury's boutique hotel option, with the Northern Italian Terra Danbury restaurant on site, a fitness center, and an outdoor patio with a fire pit.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "la-quinta-danbury",
        name: "La Quinta by Wyndham Danbury",
        kind: "hotel",
        address: "116 Newtown Road, Danbury, CT 06810",
        official_url: "https://www.wyndhamhotels.com/laquinta/danbury-connecticut/la-quinta-danbury/overview",
        summary:
          "Reliable mid-range base on Newtown Road: seasonal outdoor pool, 24/7 fitness center, EV charging, and free breakfast.",
        photos: []
      })
    ]
  end

  defp southbury do
    [
      Map.merge(@southbury, %{
        slug: "bent-of-the-river-audubon",
        name: "Bent of the River Audubon Center",
        kind: "park",
        address: "185 East Flat Hill Road, Southbury, CT 06488",
        official_url: "https://www.audubon.org/bent-river",
        summary:
          "A roughly 700-acre National Audubon Society sanctuary. Althea Clark bequeathed the Bent of the River farm to Audubon with instructions that it be used for education, and its trails opened to the public in the early 2000s.",
        photos: [
          photo("southbury", "bent-of-the-river", "Bent of the River",
            "The Audubon Center at Bent of the River, Southbury.", "Karl Thomas Moore",
            "CC BY-SA 4.0", "https://commons.wikimedia.org/wiki/File:Audubon_Center_at_Bent_of_the_River_I.JPG"),
          photo("southbury", "bent-of-the-river-center", "Audubon center",
            "Buildings at the Bent of the River Audubon Center.", "Jllm06",
            "CC BY-SA 4.0", "https://commons.wikimedia.org/wiki/File:Audubon_Center_Bent_of_the_River_1.jpg")
        ]
      }),
      Map.merge(@southbury, %{
        slug: "kettletown-state-park",
        name: "Kettletown State Park",
        kind: "park",
        address: "1400 Georges Hill Road, Southbury, CT 06488",
        official_url: "https://ctparks.com/node/73",
        summary:
          "A 605-acre state park on Lake Zoar with more than six miles of hiking trails. The name comes from local legend: early colonists traded one brass kettle to the Pootatuck people for the right to hunt and fish here. Day use is open; the campground is closed for the 2026 season after 2024 flood damage.",
        history:
          "The original village site vanished under water in 1919, when the Housatonic River was dammed to create Lake Zoar.",
        photos: [
          photo("southbury", "kettletown-lake-zoar", "Lake Zoar",
            "Lake Zoar (the impounded Housatonic River) from Kettletown State Park.", "Jllm06",
            "CC BY-SA 4.0", "https://commons.wikimedia.org/wiki/File:Kettletown_State_Park_4_-_Lake_Zoar_(Housatonic_River).jpg"),
          photo("southbury", "kettletown-overlook", "Miller Trail overlook",
            "Lake Zoar from the Miller Trail overlook in Kettletown State Park.", "Morrowlong",
            "CC BY-SA 4.0", "https://commons.wikimedia.org/wiki/File:Kettletown_State_Park_Miller_Trail_Lake_Zoar_Overloop.jpg")
        ]
      }),
      Map.merge(@southbury, %{
        slug: "southford-falls-state-park",
        name: "Southford Falls State Park",
        kind: "park",
        address: "175 Quaker Farms Road, Southbury, CT 06488",
        official_url: "https://ctparks.com/parks/southford-falls-state-park",
        summary:
          "A 169-acre park with a tiered waterfall, covered bridge, observation tower, and trout-stocked Paper Mill Pond — on the former site of the Diamond Match Company, a state park since 1932.",
        photos: []
      }),
      Map.merge(@southbury, %{
        slug: "old-town-hall-museum-southbury",
        name: "Old Town Hall Museum",
        kind: "museum",
        address: "624 South Britain Road, Southbury, CT 06488",
        official_url: "https://www.southburyhistory.org/",
        summary:
          "One of four historic properties kept by the Southbury Historical Society, anchoring the town's archives and collections in the village of South Britain.",
        photos: []
      }),
      Map.merge(@southbury, %{
        slug: "bullet-hill-school",
        name: "Bullet Hill School",
        kind: "historic-site",
        address: "215 Main Street North, Southbury, CT 06488",
        official_url: "https://www.southburyhistory.org/",
        summary:
          "A historic one-room schoolhouse maintained by the Southbury Historical Society and run as a living-museum program.",
        photos: []
      }),
      Map.merge(@southbury, %{
        slug: "maggie-mcflys-southbury",
        name: "Maggie McFly's",
        kind: "restaurant",
        address: "971 Main Street South, Southbury, CT 06488",
        official_url: "https://www.maggiemcflys.com/southbury/",
        summary:
          "The Southbury outpost of Connecticut's own big-menu craft eatery — the New England lobster roll and the fish fry are the orders.",
        photos: []
      }),
      Map.merge(@southbury, %{
        slug: "senor-panchos-southbury",
        name: "Señor Pancho's of Southbury",
        kind: "restaurant",
        address: "385 Main Street South, Southbury, CT 06488",
        official_url: "https://senorpanchos.com/",
        summary:
          "The founding 1989 location of the Señor Pancho's family — one of Connecticut's oldest family Mexican restaurant groups and a 'Best Burrito in Connecticut' winner.",
        photos: []
      }),
      Map.merge(@southbury, %{
        slug: "the-bevy-co",
        name: "The Bevy Co",
        kind: "restaurant",
        address: "22 Poverty Road, Southbury, CT 06488",
        official_url: "https://thebevy.co/",
        summary:
          "An NYC-inspired cocktail lounge with a full food menu — flavored espresso martinis and chicken bao buns are the signatures.",
        photos: []
      }),
      Map.merge(@southbury, %{
        slug: "raasa-indian-cuisine",
        name: "RaaSa Indian Cuisine",
        kind: "restaurant",
        address: "466 Heritage Road, Southbury, CT 06488",
        official_url: "https://raasact.com/",
        summary:
          "Family-owned Indian kitchen with near-perfect local ratings — lamb rogan josh, tandoori chicken, and tikka masala are the specialties. Closed Tuesdays.",
        photos: []
      }),
      Map.merge(@southbury, %{
        slug: "heritage-hotel-southbury",
        name: "Heritage Hotel, Golf & Conference Center",
        kind: "hotel",
        address: "522 Heritage Road, Southbury, CT 06488",
        official_url: "https://www.heritagesouthbury.com/",
        summary:
          "Southbury's full-service resort-style hotel: two saltwater pools, the Riverwalk Athletic Club, a spa, The Tavern restaurant, and the nine-hole Pomperaug golf course behind the hotel.",
        photos: []
      })
    ]
  end

  defp woodbury do
    [
      Map.merge(@woodbury, %{
        slug: "glebe-house-museum",
        name: "Glebe House Museum & Gertrude Jekyll Garden",
        kind: "museum",
        address: "49 Hollow Road, Woodbury, CT 06798",
        official_url: "https://glebehousemuseum.org",
        summary:
          "A c. 1740 gambrel-roofed minister's house known as the birthplace of the Episcopal Church in the United States — with the only Gertrude Jekyll-designed garden in America open to the public (self-guided, dawn to dusk, year-round).",
        history:
          "The house was first occupied by Woodbury's Anglican priest John Rutgers Marshall in 1771. Its grounds hold the sole publicly accessible U.S. garden designed by the great English garden designer Gertrude Jekyll.",
        photos: [
          photo("woodbury", "glebe-house", "Glebe House",
            "The c. 1740 Glebe House in Woodbury.", "LisaHendricks",
            "CC BY-SA 3.0", "https://commons.wikimedia.org/wiki/File:GlebeHouse.png")
        ]
      }),
      Map.merge(@woodbury, %{
        slug: "flanders-nature-center",
        name: "Flanders Nature Center & Land Trust",
        kind: "park",
        address: "596 Flanders Road, Woodbury, CT 06798",
        official_url: "https://flandersnaturecenter.org",
        summary:
          "A roughly 60-year-old nature center and land trust protecting more than 2,400 acres of conserved open space, laced with public hiking trails.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "hollow-park",
        name: "Hollow Park",
        kind: "park",
        address: "43 Hollow Road, Woodbury, CT 06798",
        summary:
          "Woodbury's town park on Hollow Road — covered pavilion, athletic fields, basketball, and sand volleyball — right next door to the Glebe House.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "orenaug-park",
        name: "Orenaug Park",
        kind: "park",
        address: "Park Road, Woodbury, CT 06798",
        summary: "A wooded town park off Park Road with a disc golf course.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "johns-cafe-woodbury",
        name: "John's Cafe",
        kind: "restaurant",
        address: "693 Main Street South, Woodbury, CT 06798",
        official_url: "https://www.johnscafe.com",
        summary:
          "Bistro-style New American with Mediterranean leanings in the heart of the antiques district — steaks, house-made pasta, and pizza; Mondays are BYOB with no corkage fee.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "market-place-kitchen-woodbury",
        name: "Market Place Kitchen & Bar",
        kind: "restaurant",
        address: "641 Main Street South, Woodbury, CT 06798",
        official_url: "https://marketplacekitchenbar.com/woodbury/",
        summary:
          "Farm-fresh American dining with locally sourced, seasonally changing menus; Sunday brunch runs 11:30 to 3.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "new-morning-market",
        name: "New Morning Market",
        kind: "cafe",
        address: "129 Main Street North, Woodbury, CT 06798",
        official_url: "https://newmorningmarket.com/",
        summary:
          "A natural-and-organic market founded in 1971 — wholesome prepared foods, artisanal cheeses, and specialty goods, open daily 8 to 8.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "mix-prime-steakhouse-woodbury",
        name: "MIX Prime Steakhouse",
        kind: "restaurant",
        address: "757 Main Street South, Woodbury, CT 06798",
        official_url: "https://www.mixprimesteakhouse.com/woodbury",
        summary:
          "A Main Street steakhouse advertising the area's only 40-day prime aged beef, plus fresh seafood and a sushi bar.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "1754-house-woodbury",
        name: "1754 House",
        kind: "bnb",
        address: "506 Main Street South, Woodbury, CT 06798",
        summary:
          "Woodbury's historic inn: ten guest rooms, each with private bath, plus a dining room, in the 18th-century building long known as the Curtis House — reputed to be Connecticut's oldest inn.",
        photos: [
          photo("woodbury", "1754-house", "The Curtiss House (1754 House)",
            "1930s Historic American Buildings Survey photograph of the Curtiss House, today the 1754 House inn.", "William Rainey, Historic American Buildings Survey (Library of Congress)",
            "Public domain", "https://commons.wikimedia.org/wiki/File:Historic_American_Buildings_Survey_William_Rainey,_Photographer_GENERAL_VIEW_SHOWING_FRONT_AND_GABLE_END_-_Curtiss_House,_Woodbury,_Litchfield_County,_CT_HABS_CONN,3-WOO,6-1.tif")
        ]
      })
    ]
  end
end
```

- [ ] **Step 3: Run test to verify it passes**

Run: `mix test test/ethos/seeds/connecticut_places_test.exs` — PASS. Then full suite.

- [ ] **Step 4: Commit**

```bash
mix format && git add -A && git commit -m "feat: seed 50 verified Connecticut places across five towns"
```

---

### Task 11: Five Connecticut town guides (seed + gallery attribution)

**Files:**
- Create: `lib/ethos/seeds/ct_guide_runner.ex`
- Create: `lib/ethos/seeds/waterbury_guide.ex`, `lib/ethos/seeds/middlebury_guide.ex`, `lib/ethos/seeds/danbury_guide.ex`, `lib/ethos/seeds/southbury_guide.ex`, `lib/ethos/seeds/woodbury_guide.ex`
- Modify: `lib/ethos_web/controllers/guide_html/photos.html.heex` (render photo attribution when present)
- Test: `test/ethos/seeds/ct_guides_test.exs`

**Interfaces:**
- Consumes: `Ethos.Seeds.ConnecticutPlaces.upsert_all!/0` (Task 10), `Guides.create_entry/3` `:privileged`, `Guide.changeset/2` (with state/county from Task 1), `Guide.seo_changeset/2`, `Guide.photos_changeset/2`, `Guide.status_changeset/2`. **Read `lib/ethos/seeds/rome_guide.ex` first** and reuse its owner-resolution pattern exactly (find user by email; auto-create only when `Application.get_env(:ethos, :env) in [:dev, :test]`).
- Produces: `Ethos.Seeds.CtGuideRunner.upsert!(data, email)` → `%Guide{}`; per-town modules exposing `upsert!(email)` and `data/0`. Task 12 calls each `upsert!/1`.

- [ ] **Step 1: Failing test**

`test/ethos/seeds/ct_guides_test.exs`:

```elixir
defmodule Ethos.Seeds.CtGuidesTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.{Guides, Places}
  alias Ethos.Seeds

  @towns [
    {Seeds.WaterburyGuide, "waterbury-ct-travel-guide", "New Haven County"},
    {Seeds.MiddleburyGuide, "middlebury-ct-travel-guide", "New Haven County"},
    {Seeds.DanburyGuide, "danbury-ct-travel-guide", "Fairfield County"},
    {Seeds.SouthburyGuide, "southbury-ct-travel-guide", "New Haven County"},
    {Seeds.WoodburyGuide, "woodbury-ct-travel-guide", "Litchfield County"}
  ]

  test "all five guides seed idempotently with linked entries" do
    user = user_fixture()
    Seeds.ConnecticutPlaces.upsert_all!()

    for {mod, slug, county} <- @towns do
      guide = mod.upsert!(user.email)
      guide = mod.upsert!(user.email)

      assert guide.slug == slug
      assert guide.status == "published"
      assert guide.state == "Connecticut"
      assert guide.county == county
      assert guide.intro != nil
      assert guide.sections != []
      assert guide.faq != []

      entries = Guides.list_entries(guide)
      assert entries != []
      assert Enum.all?(entries, & &1.place_id), "every CT entry links a place"
    end

    # idempotency: no duplicate guides or entries
    assert Guides.list_published_guides() |> Enum.count(&(&1.state == "Connecticut")) == 5
  end

  test "every entry place_slug resolves to a seeded place" do
    Seeds.ConnecticutPlaces.upsert_all!()

    for {mod, _slug, _county} <- @towns,
        entry <- mod.data().entries do
      assert Places.get_place_by_slug(entry.place_slug), "missing place #{entry.place_slug}"
    end
  end
end
```

- [ ] **Step 2: Run to verify failure**, then create the runner.

`lib/ethos/seeds/ct_guide_runner.ex`:

```elixir
defmodule Ethos.Seeds.CtGuideRunner do
  @moduledoc """
  Shared upsert logic for the Connecticut town guide seeds. Each town module
  supplies a `data/0` map; this runner idempotently upserts the guide by
  slug, replaces its entries (linking each to a seeded place), sets SEO
  fields and photos, and publishes it.
  """

  import Ecto.Query, warn: false

  alias Ethos.Repo
  alias Ethos.Guides
  alias Ethos.Guides.{Guide, Entry}
  alias Ethos.Places

  def upsert!(data, email) do
    {:ok, guide} =
      Repo.transaction(fn ->
        user = find_owner!(email)
        guide = upsert_guide!(user, data)
        replace_entries!(guide, data.entries)

        {:ok, guide} =
          Guides.update_guide_seo(guide, %{
            intro: data.intro,
            sections: data.sections,
            faq: data.faq
          })

        {:ok, guide} = Guides.update_guide_photos(guide, data.photos)
        {:ok, guide} = Guides.publish_guide(guide)
        guide
      end)

    guide
  end

  # Mirror Ethos.Seeds.RomeGuide's owner resolution: look up by email; only
  # auto-create (confirmed) when running in dev/test.
  defp find_owner!(email) do
    case Ethos.Accounts.get_user_by_email(email) do
      nil ->
        if Application.get_env(:ethos, :env) in [:dev, :test] do
          create_dev_user!(email)
        else
          raise "no user with email #{email} — register first, then re-run the seed"
        end

      user ->
        user
    end
  end

  defp create_dev_user!(email) do
    # Copy the RomeGuide dev-user creation verbatim (registration +
    # confirmation) so both seeds behave identically.
    {:ok, user} =
      Ethos.Accounts.register_user(%{email: email, password: "seed-password-123!"})

    user
  end

  defp upsert_guide!(user, data) do
    attrs = %{
      "title" => data.title,
      "destination" => data.destination,
      "state" => "Connecticut",
      "county" => data.county
    }

    case Repo.get_by(Guide, slug: data.slug) do
      nil ->
        %Guide{user_id: user.id, slug: data.slug}
        |> Guide.changeset(attrs)
        |> Ecto.Changeset.put_change(:slug, data.slug)
        |> Repo.insert!()

      guide ->
        guide |> Guide.changeset(attrs) |> Repo.update!()
    end
  end

  defp replace_entries!(guide, entries) do
    Repo.delete_all(from e in Entry, where: e.guide_id == ^guide.id)

    entries
    |> Enum.with_index()
    |> Enum.each(fn {e, idx} ->
      place = Places.get_place_by_slug!(e.place_slug)

      %Entry{guide_id: guide.id, position: idx}
      |> Entry.privileged_changeset(%{
        "kind" => e.kind,
        "name" => e.name,
        "note" => e.note,
        "place_id" => place.id,
        "source" => "manual"
      })
      |> Repo.insert!()
    end)
  end
end
```

Note: `Guide.changeset/2` auto-generates a random-suffixed slug on insert when title is cast — the explicit `put_change(:slug, data.slug)` AFTER the changeset pins the canonical slug (this mirrors how RomeGuide pins its slug; read RomeGuide and follow its exact mechanism if it differs).

- [ ] **Step 3: Create the five town data modules**

Each module has this shape (shown in full for Waterbury; the other four follow with their own content below):

```elixir
defmodule Ethos.Seeds.WaterburyGuide do
  @moduledoc "Seeds the Waterbury, Connecticut travel guide. Idempotent by slug."

  def upsert!(email), do: Ethos.Seeds.CtGuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "waterbury-ct-travel-guide",
      title: "Waterbury, Connecticut: A Brass City Travel Guide",
      destination: "Waterbury, Connecticut",
      county: "New Haven County",
      intro: """
      Waterbury earned its nickname the honest way: by 1840, America's entire
      brass industry was concentrated in the Naugatuck Valley around this city,
      and at its peak the brass mills employed some 50,000 people. The
      factories are quieter now, but the wealth they made built a downtown
      worth a day of anyone's time — a Thomas Lamb movie palace, a
      museum-on-the-Green with 10,000 buttons, and a clock tower you can see
      from the highway. Add a food scene that never stopped being
      old-school — grinders since 1922, hot dogs since 1937 — and the Brass
      City makes a rewarding, unpretentious stop on any western Connecticut
      trip.
      """,
      entries: [
        %{kind: "sight", name: "Palace Theater", place_slug: "palace-theater-waterbury",
          note: "A 1922 Thomas Lamb movie palace restored for $30 million and reopened in 2004 — one of only two survivors of Sylvester Poli's theater empire. Check the Broadway series schedule before you book the trip."},
        %{kind: "sight", name: "Mattatuck Museum", place_slug: "mattatuck-museum",
          note: "Art upstairs, brass and buttons downstairs: the museum founded in 1877 holds the industrial story of the Naugatuck Valley, including the Waterbury Button Museum's 10,000-plus buttons."},
        %{kind: "sight", name: "Union Station clock tower", place_slug: "waterbury-union-station",
          note: "The 1909 station's clock tower is the city's signature landmark — walk over for the photo."},
        %{kind: "walk", name: "Waterbury Green", place_slug: "waterbury-green",
          note: "Start a downtown loop at the Welton Fountain on the Green, then walk to the Palace and the Mattatuck — everything is within a few blocks."},
        %{kind: "sight", name: "Holy Land USA", place_slug: "holy-land-usa",
          note: "The 18-acre hillside park of miniature biblical scenes, closed in 1984 and reopened in 2014, is one of Connecticut's strangest and most memorable sights. Daylight hours."},
        %{kind: "sight", name: "Seven Angels Theatre", place_slug: "seven-angels-theatre",
          note: "Greater Waterbury's professional regional theatre — check the calendar for musicals, comedy, and concerts."},
        %{kind: "food", name: "Diorio Restaurant & Bar", place_slug: "diorio-restaurant",
          note: "The white-tablecloth stalwart of Bank Street — classic Italian-American with a proper bar. Dinner from 5, closed Sundays for the bar."},
        %{kind: "food", name: "Nardelli's Grinder Shoppe", place_slug: "nardellis-grinder-shoppe",
          note: "Founded 1922 and still family-owned — repeatedly voted among Connecticut's best grinders. Order the grinder; that's the point."},
        %{kind: "food", name: "Frankie's Hot Dogs", place_slug: "frankies-hot-dogs-waterbury",
          note: "A drive-in institution since 1937 with three locations around the city."},
        %{kind: "food", name: "Sweet Maria's", place_slug: "sweet-marias-waterbury",
          note: "The bakery Waterbury swears by — cakes, biscotti, and cookies worth the detour to Manor Avenue."},
        %{kind: "food", name: "Brass Works Brewing", place_slug: "brass-works-brewing",
          note: "The city's brewery, named for its brass heritage — taproom pours plus rotating food trucks."},
        %{kind: "stay", name: "Courtyard by Marriott Waterbury Downtown", place_slug: "courtyard-waterbury-downtown",
          note: "The downtown base: steps from the Palace Theater and the Green, which is exactly where you want to be."}
      ],
      sections: [
        %{
          "heading" => "How Waterbury became the Brass City",
          "body" => """
          Settled in 1674 as Mattatuck Plantation and incorporated as a town in
          1686, Waterbury industrialized around one metal. By 1840 the entire
          American brass industry was localized in the Naugatuck Valley, led by
          giants like Scovill Manufacturing, Anaconda American Brass, and Chase
          Brass & Copper — at the WWII peak, about 10,000 people worked at
          Scovill alone, in mills covering more than two million square feet.
          The Waterbury Clock Company (ancestor of Timex) was making 20,000
          clocks and watches a day by the end of the 19th century, and its 1933
          Mickey Mouse watch sold over 11,000 units on day one. Waterbury
          inventors gave the world the can opener (Ezra J. Warner, 1858) and the
          machine-made paper clip (William D. Middlebrook, 1899). Employment
          peaked around 50,000 before falling to under 5,000 by the 1980s — the
          Mattatuck Museum tells the whole arc.
          """
        },
        %{
          "heading" => "Getting there and around",
          "body" => """
          Waterbury sits on I-84 in west-central Connecticut, roughly halfway
          between Hartford and Danbury, and has its own Metro-North branch line
          into Union Station. Downtown — the Green, the Palace, the
          Mattatuck — is compactly walkable; Holy Land USA and the brewery are
          short drives.
          """
        }
      ],
      faq: [
        %{"question" => "Why is Waterbury called the Brass City?",
          "answer" => "By 1840 America's entire brass industry was concentrated in the Naugatuck Valley around Waterbury, and brass employment peaked near 50,000 workers. The nickname parallels Meriden (Silver City) and New Britain (Hardware City)."},
        %{"question" => "Is the Palace Theater still open?",
          "answer" => "Yes — it operates year-round with a Broadway series, comedy, and concerts, and offers guided tours. It reopened in 2004 after a $30 million restoration."},
        %{"question" => "What is the one must-see in Waterbury?",
          "answer" => "The Mattatuck Museum on the Green: American art plus the definitive telling of the brass story, with the Waterbury Button Museum inside. Pair it with a walk to the Palace Theater."},
        %{"question" => "Where should I stay in Waterbury?",
          "answer" => "The Courtyard by Marriott Waterbury Downtown at 63 Grand Street is the main full-service downtown hotel, steps from the Palace Theater."},
        %{"question" => "Is Holy Land USA open?",
          "answer" => "Yes — after closing in 1984 it was revived and reopened to the public in 2014, and is open during daylight hours."}
      ],
      photos: [
        %{"src" => "/photos/ct/waterbury/palace-theater.jpg", "thumb" => "/photos/ct/waterbury/palace-theater_thumb.jpg",
          "title" => "Palace Theater", "description" => "The Palace Theater on East Main Street.",
          "author" => "Magicpiano", "license" => "CC BY-SA 4.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:WaterburyCT_PalaceTheater.jpg"},
        %{"src" => "/photos/ct/waterbury/waterbury-green-fountain.jpg", "thumb" => "/photos/ct/waterbury/waterbury-green-fountain_thumb.jpg",
          "title" => "Welton Fountain", "description" => "The Welton Fountain on the Waterbury Green.",
          "author" => "GrammarFascist", "license" => "CC BY-SA 4.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:Welton_Fountain_on_Waterbury_Green.jpg"},
        %{"src" => "/photos/ct/waterbury/union-station-tower.jpg", "thumb" => "/photos/ct/waterbury/union-station-tower_thumb.jpg",
          "title" => "Union Station clock tower", "description" => "Waterbury Union Station's landmark clock tower.",
          "author" => "Hallettx", "license" => "CC BY-SA 4.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:Waterbury_Union_Station_Clock_Tower,_Waterbury_CT,_US.jpg"},
        %{"src" => "/photos/ct/waterbury/downtown-waterbury.jpg", "thumb" => "/photos/ct/waterbury/downtown-waterbury_thumb.jpg",
          "title" => "Downtown Waterbury", "description" => "Downtown Waterbury near the Green.",
          "author" => "Daniel Case", "license" => "CC BY-SA 3.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:Downtown_Waterbury,_CT.jpg"},
        %{"src" => "/photos/ct/waterbury/mattatuck-museum.jpg", "thumb" => "/photos/ct/waterbury/mattatuck-museum_thumb.jpg",
          "title" => "Mattatuck Museum", "description" => "The Mattatuck Museum on West Main Street.",
          "author" => "DavidMacharelli", "license" => "CC BY-SA 4.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:Mattatuck_Museum_Exterior.jpg"}
      ]
    }
  end
end
```

**Middlebury** (`middlebury_guide.ex`, same shape) — content:

- slug `middlebury-ct-travel-guide`, title "Middlebury, Connecticut: Quassy, the Greenway, and the Quiet Side of the Valley", destination "Middlebury, Connecticut", county "New Haven County".
- intro: """
  Middlebury was incorporated in 1807 from pieces of Southbury, Waterbury,
  and Woodbury — named simply for sitting "in the midst" of them — and it
  has stayed the quiet neighbor ever since: farms, a green, a boarding
  school designed by pioneering architect Theodate Pope Riddle, and one
  glorious exception to the calm. That exception is Quassy, the 1908
  lakeside amusement park on Lake Quassapaug that began as a trolley-line
  resort and never stopped running. Come for a family day at the park, bike
  the old trolley route, and eat far better than a town of this size has
  any right to feed you.
  """
- entries (kind, name, place_slug, note):
  1. sight / "Quassy Amusement Park" / `quassy-amusement-park` / "On Lake Quassapaug since 1908 and still family-owned — 20-plus rides including the Wooden Warrior coaster, plus the Splash Away Bay waterpark. Seasonal, roughly April through October."
  2. walk / "Middlebury Greenway" / `middlebury-greenway` / "4.5 paved miles along the old trolley roadbed that once carried summer crowds to the lake — hilly, bench-lined, and it ends near Quassy's gates."
  3. sight / "Middlebury Historical Society Museum" / `middlebury-historical-society` / "Local history in an 1897 two-room schoolhouse near the Green, a National Register building that spent decades as the town library."
  4. food / "Vyne Restaurant & Bar" / `vyne-restaurant` / "The fine-dining pick: contemporary American on a site with a family restaurant legacy back to the 1940s."
  5. food / "Brewbury Kitchen & Tap" / `brewbury-kitchen-tap` / "House-brewed beers, a full kitchen, and a patio — the easy crowd-pleaser."
  6. food / "Pies & Pub" / `pies-and-pub` / "Hand-tossed pizza and 26 rotating drafts."
  7. food / "Kitchen 64" / `kitchen-64` / "Breakfast from 6:30 AM daily — eggs Benedict and French toast are the moves."
  8. food / "Maggie McFly's" / `maggie-mcflys-middlebury` / "The famously enormous menu; there is something for every person in the car."
  9. food / "Señor Pancho's" / `senor-panchos-middlebury` / "Family-run Mexican from one of Connecticut's oldest family Mexican restaurant groups."
- sections: (1) "From trolley resort to family park" — body: """
  A trolley line reached Middlebury by 1908 and turned Lake Quassapaug into
  a summer resort — swimming, picnicking, dancing, and a carousel. That
  resort became Lake Quassapaug Amusement Park, today's Quassy, purchased
  in 1937 by three Waterbury businessmen. The trolley itself shut down in
  1930 after Route 64 was improved; its roadbed is now the Middlebury
  Greenway, so you can ride the route the summer crowds once did — on two
  wheels. In 2026 an industry index named Quassy the most affordable theme
  park in America.
  """ (2) "Where to stay" — body: """
  Middlebury itself has no verified operating hotel or B&B as of 2026 (the
  longtime Tucker Hill Inn appears to have closed). The closest verified
  bases are the Courtyard by Marriott in downtown Waterbury, ten minutes
  east, or the resort-style Heritage Hotel in Southbury, ten minutes
  southwest — both covered in their towns' Ethos guides.
  """
- faq: (1) "Is Quassy open all year?" → "No — Quassy is seasonal, operating roughly April through October, with the Splash Away Bay waterpark in summer." (2) "Is the Middlebury Greenway good for kids?" → "It's paved and car-free for 4.5 miles along Route 64, though notably hilly in stretches — fine for confident young riders, with benches along the way." (3) "Where do I stay for a Quassy trip?" → "In neighboring towns: downtown Waterbury's Courtyard by Marriott or Southbury's Heritage Hotel are the closest verified options, each about ten minutes away." (4) "What's Middlebury's history in one line?" → "Incorporated in 1807 from parts of Southbury, Waterbury, and Woodbury, it stayed agricultural — dairy and saddle horses — while its neighbors industrialized." (5) "What is Westover School?" → "A girls' boarding school established in 1909, designed by Theodate Pope Riddle, one of America's first licensed female architects."
- photos: `quassy-sign` (AskJoanne, CC BY 3.0, File:Quassy.jpg), `quassy-rides` (Roller Coaster Philosophy, CC BY 2.0, File:Quassy_Amusement_Park_-_48334465221.jpg), `middlebury-town-hall` (Jerry Dougherty, CC BY 2.5, File:TownHallMiddleburyCT.jpg), `middlebury-sign` (CTsignhunt, CC0, File:Middlebury,_CT.jpg) — all under `/photos/ct/middlebury/`, titles/descriptions matching the landmarks.

**Danbury** (`danbury_guide.ex`) — content:

- slug `danbury-ct-travel-guide`, title "Danbury, Connecticut: Hat City History, Rail Heritage, and Where to Eat", destination "Danbury, Connecticut", county "Fairfield County".
- intro: """
  Danbury made America's hats. From Zadoc Benedict's first felt hats in the
  late 1700s to roughly 4.5 million hats a year by 1880, "Hat City" crowned
  the country — and paid for it with the mercury-poisoning tremors known as
  the Danbury Shakes, a story that ends with Connecticut banning mercury
  from hatting in 1941. Today the city wears its history well: a
  seven-building museum campus with the birthplace of composer Charles
  Ives, a railroad museum in the restored 1903 Union Station, a 722-acre
  park around a Gilded Age mansion, and one of the state's best brewery
  taprooms. It's the natural base for exploring western Connecticut.
  """
- entries:
  1. sight / "Danbury Railway Museum" / `danbury-railway-museum` / "A working rail yard of 60-plus historic pieces around the restored 1903 Union Station. Weekends 10-4, $10 — time it for a train-ride day, spring through October."
  2. sight / "Danbury Museum & Historical Society" / `danbury-museum-historical-society` / "Seven historic buildings on Main Street, including the Charles Ives Birthplace and the Marian Anderson Studio — and the definitive Hat City story. Tours Wednesday-Saturday."
  3. sight / "Tarrywile Park & Mansion" / `tarrywile-park` / "722 acres, 21 miles of trails, and the 1897 Tarrywile Mansion. Dawn to dusk, free."
  4. sight / "The Palace Danbury" / `palace-danbury` / "The historic Main Street theater — music, comedy, film, and touring acts."
  5. food / "Stanziato's Wood Fired Pizza" / `stanziatos-wood-fired-pizza` / "Artisanal pies from an 800-degree Italian oven, sourced from nine regional farms."
  6. food / "TK's American Cafe" / `tks-american-cafe` / "76 wing flavors since 1990 — the area's sports bar of record."
  7. food / "Chuck's Steak House & Margarita Grill" / `chucks-steak-house-danbury` / "Hand-cut steaks and a famous salad bar, serving Danbury since 1973."
  8. food / "Charter Oak Brewing" / `charter-oak-brewing` / "Connecticut Magazine's best brewery and taproom in the state, two years running."
  9. stay / "Hotel Zero Degrees" / `hotel-zero-degrees-danbury` / "The boutique pick, with Terra Danbury (Northern Italian) on site."
  10. stay / "La Quinta by Wyndham Danbury" / `la-quinta-danbury` / "The dependable mid-range pick on Newtown Road — pool, gym, free breakfast, EV charging."
- sections: (1) "Hat City: how Danbury crowned America" — body: """
  Before hats, Danbury was "Beantown" — named in 1687, incorporated in
  1702, and known for its bean crops. Zadoc Benedict changed that in the
  late 18th century with felt hat-making; by 1809 there were 56 hat shops,
  and by the 1850s Danbury called itself the Hat City of the World, with
  hatting employing more residents than every other occupation combined.
  The price was steep: mercury nitrate used in felt "carroting" caused the
  tremors known as the Danbury Shakes — a 1922 study found 43 of 100
  examined union hatters showed mercury poisoning. On December 1, 1941,
  Connecticut banned mercury in hat manufacturing, a date Danbury hatters
  celebrated annually. The industry faded — six manufacturers by 1923, one
  by the 1950s — but the Danbury Museum keeps the whole story.
  """ (2) "The Revolution came here" — body: """
  Danbury was a Continental Army supply depot, and in April 1777 British
  forces under Major General William Tryon raided and burned the town — one
  of Connecticut's defining Revolutionary episodes. The Danbury Museum's
  historic buildings, including the John Rider House, put you in that
  streetscape.
  """ (3) "Getting there" — body: """
  Danbury sits on I-84 at the New York line, with its own Metro-North
  branch line. The Railway Museum is right at the old Union Station on
  White Street; downtown Main Street and the museum campus are minutes
  away.
  """
- faq: (1) "Why is Danbury called Hat City?" → "It was the center of American hat production — 56 hat shops by 1809 and roughly 4.5 million hats a year by 1880; by the 1850s it styled itself the 'Hat City of the World.'" (2) "What were the Danbury Shakes?" → "Tremors from mercury poisoning among hatters, caused by the mercury nitrate used in felt-making. Connecticut banned mercury in hat manufacturing on December 1, 1941." (3) "When is the Danbury Railway Museum open?" → "Weekends 10 AM-4 PM, admission $10 for ages 3+, with train rides from early spring through October plus December Santa trains." (4) "Where should I stay in Danbury?" → "Hotel Zero Degrees is the boutique option; La Quinta by Wyndham on Newtown Road is the reliable mid-range one. The historic Ethan Allen Hotel also operates in town." (5) "What happened in Danbury in 1777?" → "British forces under Major General William Tryon raided and burned the town, which was serving as a Continental Army supply depot."
- photos (under `/photos/ct/danbury/`): `railway-museum-station` (Daniel Case, CC BY-SA 3.0, File:Danbury_Railroad_Museum.jpg), `danbury-museum` (TulaneTim, CC BY-SA 4.0, File:Danbury_Museum_Streetside_New.jpg), `charles-ives-birthplace` (Danbury Museum, CC BY-SA 4.0, File:Main_entrance,_Charles_Ives_Birthplace.jpg), `main-street-danbury` (Daniel Case, CC BY-SA 3.0, File:Main_Street,_Danbury,_Connecticut.jpg), `railway-museum-acmu` (TriStateGuy, CC BY 4.0, File:ACMU_at_Danbury_Railway_Museum.jpg).

**Southbury** (`southbury_guide.ex`) — content:

- slug `southbury-ct-travel-guide`, title "Southbury, Connecticut: State Parks, Colonial Roots, and the Pomperaug Valley", destination "Southbury, Connecticut", county "New Haven County".
- intro: """
  Southbury began in 1673, when religious dissidents from Stratford bought
  "Pomperaug Plantation" along a Housatonic tributary; the southern parish
  went its own way in 1787 with a charter as The Town of Southbury. What
  that history left behind is a town built for being outdoors: an Audubon
  sanctuary on a bend of the Pomperaug, a state park on Lake Zoar named for
  a one-kettle land deal, and a waterfall park with a covered bridge. Add a
  genuine resort-style hotel and a small, good restaurant row, and
  Southbury is the comfortable overnight in the region.
  """
- entries:
  1. sight / "Bent of the River Audubon Center" / `bent-of-the-river-audubon` / "About 700 sanctuary acres left to Audubon for education by Althea Clark — trails open to the public since the early 2000s."
  2. sight / "Kettletown State Park" / `kettletown-state-park` / "605 acres on Lake Zoar with six-plus miles of trails. Day use is open; the campground is closed for the 2026 season after 2024 flood damage."
  3. sight / "Southford Falls State Park" / `southford-falls-state-park` / "Tiered waterfall, covered bridge, observation tower, and a trout-stocked pond — on the old Diamond Match Company site."
  4. sight / "Old Town Hall Museum" / `old-town-hall-museum-southbury` / "The Southbury Historical Society's anchor property in South Britain."
  5. sight / "Bullet Hill School" / `bullet-hill-school` / "A one-room schoolhouse run as a living museum."
  6. food / "Señor Pancho's" / `senor-panchos-southbury` / "The founding 1989 location of the family — and a 'Best Burrito in Connecticut' winner."
  7. food / "Maggie McFly's" / `maggie-mcflys-southbury` / "The big-menu Connecticut original's Southbury outpost — lobster roll and fish fry."
  8. food / "The Bevy Co" / `the-bevy-co` / "NYC-style cocktail lounge — espresso martinis and bao buns."
  9. food / "RaaSa Indian Cuisine" / `raasa-indian-cuisine` / "Family-owned Indian with near-perfect ratings. Closed Tuesdays."
  10. stay / "Heritage Hotel, Golf & Conference Center" / `heritage-hotel-southbury` / "The region's resort-style stay: saltwater pools, spa, athletic club, The Tavern, and nine holes of golf out back."
- sections: (1) "Pomperaug Plantation and the kettle legend" — body: """
  In 1673, religious dissidents from Stratford purchased Pomperaug
  Plantation and settled the valley; Southbury — originally Woodbury's
  southern parish — received its own town charter in 1787. During the
  Revolution the town supplied militia and provisions to Washington's
  forces. The land kept its stories: legend says colonists obtained the
  Kettletown tract from the Pootatuck people for a single brass kettle, and
  the original village site there disappeared under water in 1919 when
  damming the Housatonic created Lake Zoar. Colonial Revival photographer
  Wallace Nutting, a Southbury resident, immortalized the town in his 1923
  "Connecticut Beautiful."
  """ (2) "Know before you go" — body: """
  Kettletown's campground is closed for the 2026 season (2024 flood
  damage), though day use is open. And a note that saves confusion:
  Heritage Village, despite the name, is an age-restricted residential
  community — not a tourist attraction. The Heritage Hotel on Heritage
  Road is the place travelers actually want.
  """
- faq: (1) "How did Kettletown get its name?" → "Local legend says early colonists traded one brass kettle to the Pootatuck people for the right to hunt and fish the land." (2) "Is the Kettletown campground open?" → "Not in 2026 — it's closed for the season due to August 2024 flood damage. The park itself is open for day use." (3) "What is Heritage Village?" → "An age-restricted retirement community, not a tourist attraction. Travelers looking for 'Heritage' want the Heritage Hotel, Golf & Conference Center on Heritage Road." (4) "When did Southbury become a town?" → "1787, when Woodbury's southern parish received a charter as The Town of Southbury; European settlement of the valley dates to 1673." (5) "Where should I stay?" → "The Heritage Hotel, Golf & Conference Center — Southbury's full-service resort-style hotel with pools, a spa, and golf."
- photos (under `/photos/ct/southbury/`): `kettletown-lake-zoar` (Jllm06, CC BY-SA 4.0, File:Kettletown_State_Park_4_-_Lake_Zoar_(Housatonic_River).jpg), `bent-of-the-river` (Karl Thomas Moore, CC BY-SA 4.0, File:Audubon_Center_at_Bent_of_the_River_I.JPG), `southbury-town-hall` (AirportExpert, CC BY-SA 4.0, File:Southbury,_CT_Town_Hall.jpg), `south-britain-church` (Magicpiano, CC BY-SA 4.0, File:SouthburyCT_SouthBritainCongregationalChurch.jpg), `lake-zoar-bridge` (Pedro Xing, CC0, File:Lake_Zoar_old_bridge_105.JPG).

**Woodbury** (`woodbury_guide.ex`) — content:

- slug `woodbury-ct-travel-guide`, title "Woodbury, Connecticut: Antiques Capital, the Glebe House, and Main Street", destination "Woodbury, Connecticut", county "Litchfield County".
- intro: """
  Woodbury is Connecticut's 23rd town, settled in 1673 by families who
  walked up the rivers from Stratford to claim the Pomperaug plantation and
  built log cabins along what is still the main street. Three and a half
  centuries later that street is the reason to come: a National Register
  streetscape of 18th- and 19th-century buildings that earned Woodbury its
  title as Connecticut's antiques capital, anchored by the c. 1740 Glebe
  House — birthplace of the Episcopal Church in America — and the only
  Gertrude Jekyll garden in the country open to the public. Eat well, sleep
  in an 18th-century inn, and browse.
  """
- entries:
  1. sight / "Glebe House Museum & Gertrude Jekyll Garden" / `glebe-house-museum` / "The c. 1740 minister's house where the Episcopal Church in America traces its birth — and the only publicly open Gertrude Jekyll-designed garden in the U.S. Garden is self-guided, dawn to dusk, year-round."
  2. sight / "Flanders Nature Center & Land Trust" / `flanders-nature-center` / "2,400-plus conserved acres with public trails, about 60 years in the making."
  3. walk / "Hollow Park" / `hollow-park` / "The town park next to the Glebe House — pavilion, fields, and a stretch-your-legs stop."
  4. walk / "Orenaug Park" / `orenaug-park` / "Wooded town park with a disc golf course."
  5. food / "John's Cafe" / `johns-cafe-woodbury` / "Bistro New American in the antiques district; Monday BYOB with no corkage."
  6. food / "Market Place Kitchen & Bar" / `market-place-kitchen-woodbury` / "Farm-fresh, seasonally changing menus; Sunday brunch 11:30-3."
  7. food / "New Morning Market" / `new-morning-market` / "The 1971-founded natural-foods market — grab prepared foods and picnic."
  8. food / "MIX Prime Steakhouse" / `mix-prime-steakhouse-woodbury` / "40-day aged prime beef and a sushi bar on Main Street."
  9. stay / "1754 House" / `1754-house-woodbury` / "Ten rooms with private baths in the 18th-century inn long known as the Curtis House — reputedly Connecticut's oldest inn, now operating as the 1754 House."
- sections: (1) "Connecticut's 23rd town" — body: """
  In the spring of 1673, families from Rev. Zechariah Walker's dissenting
  Stratford congregation walked into the Pomperaug wilderness and founded
  Woodbury — "dwelling place in the woods" — with each family receiving up
  to twenty-five acres along a single main street. By the late 1700s
  Woodbury was a thriving agricultural trade center of millers,
  blacksmiths, wheelwrights, tinsmiths, and goldsmiths. The town center
  still holds St. Paul's Episcopal Church (1785), the First Congregational
  Church (1818), and the Masonic Temple (1839) — and it was home to Leroy
  Anderson, one of the 20th century's most popular composers of light
  concert music.
  """ (2) "Antiquing Main Street" — body: """
  In the late twentieth century, antique dealers moved into the historic
  residential buildings along Woodbury's town center, and the town became
  known as Connecticut's antiques capital. The dealers change; the
  streetscape doesn't. Park once and walk Main Street South — the shops,
  John's Cafe, and MIX are all on the same stretch, with the Glebe House a
  turn away on Hollow Road.
  """
- faq: (1) "Why is Woodbury called the antiques capital of Connecticut?" → "Since the late 20th century, antique shops have occupied the historic buildings along its town center, making it the state's best-known antiques destination." (2) "Is the Gertrude Jekyll garden open?" → "Yes — it's self-guided and open dawn to dusk year-round on the Glebe House grounds, the only Jekyll-designed garden in the U.S. open to the public." (3) "Where can I stay in Woodbury?" → "The 1754 House at 506 Main Street South — ten guest rooms with private baths in the 18th-century building long known as the Curtis House, reputedly Connecticut's oldest inn." (4) "What is the Glebe House?" → "A c. 1740 gambrel-roofed house, occupied from 1771 by Anglican priest John Rutgers Marshall, known as the birthplace of the Episcopal Church in the United States." (5) "Is the Good News Cafe still open?" → "No — Carole Peck's famed Good News Cafe could not be verified as operating in 2026; its successors appear closed. John's Cafe and Market Place are the current Main Street picks."
- photos (under `/photos/ct/woodbury/`): `glebe-house` (LisaHendricks, CC BY-SA 3.0, File:GlebeHouse.png), `woodbury-old-town-hall` (Bmzuckerman, CC BY 4.0, File:Greek_Revival_-_Woodbury,_CT_-_Woodbury_Old_Town_Hall_(1).jpg), `woodbury-historic-district` (Magicpiano, CC BY-SA 4.0, File:WoodburyCT_HistoricDistrictNumber2.jpg), `1754-house` (William Rainey, Historic American Buildings Survey (Library of Congress), Public domain, the HABS file page URL from Task 10).

For all four non-Waterbury modules: photo maps use the exact same 7-key shape as Waterbury's (`src`/`thumb`/`title`/`description`/`author`/`license`/`source_url`), with `source_url` = `https://commons.wikimedia.org/wiki/` + the File: name given.

- [ ] **Step 4: Gallery attribution**

In `lib/ethos_web/controllers/guide_html/photos.html.heex`, extend each photo's `<figcaption>` to append attribution when present:

```heex
<span :if={p["author"]} class="text-zinc-400">
  — {p["author"]}, {p["license"]}, via
  <a href={p["source_url"]} class="underline" rel="nofollow noopener">Wikimedia Commons</a>
</span>
```

(Read the file first; place the span inside the existing figcaption element. Rome photos have no `author` key, so nothing changes for them.)

- [ ] **Step 5: Run tests + full suite, commit**

```bash
mix test test/ethos/seeds/ct_guides_test.exs && mix test
mix format && git add -A && git commit -m "feat: seed five Connecticut town guides with galleries and attribution"
```

---

### Task 12: Release seeding + rollout

**Files:**
- Modify: `lib/ethos/release.ex`
- Test: covered by Task 11's seed test; this task adds the release function + verifies the whole suite.

**Interfaces:**
- Consumes: `Ethos.Seeds.ConnecticutPlaces.upsert_all!/0`, the five `upsert!/1` guide seeds (Tasks 10-11).
- Produces: `Ethos.Release.seed_connecticut/1` (email) — runnable in prod via `bin/ethos eval`.

- [ ] **Step 1: Add the release function**

In `lib/ethos/release.ex`, after `seed_rome/1`:

```elixir
  def seed_connecticut(email) do
    load_app()
    Application.ensure_all_started(@app)

    Ethos.Seeds.ConnecticutPlaces.upsert_all!()

    for mod <- [
          Ethos.Seeds.WaterburyGuide,
          Ethos.Seeds.MiddleburyGuide,
          Ethos.Seeds.DanburyGuide,
          Ethos.Seeds.SouthburyGuide,
          Ethos.Seeds.WoodburyGuide
        ] do
      guide = mod.upsert!(email)
      IO.puts("Seeded: /g/#{guide.slug}")
    end
  end
```

- [ ] **Step 2: Full verification**

Run: `mix format --check-formatted && mix test` — entire suite green.

- [ ] **Step 3: Commit**

```bash
git add -A && git commit -m "feat: seed_connecticut release task"
```

- [ ] **Step 4 (controller-executed, NOT for implementation subagents): production rollout**

After merge to main: `fly deploy`, then
`fly ssh console -a ethos -C "/app/bin/ethos eval 'Ethos.Release.seed_connecticut(\"cryptcom@gmail.com\")'"`,
then verify live: the five `/g/*-ct-travel-guide` pages, `/destinations/connecticut`, `/destinations/connecticut/litchfield-county`, a place page (`/p/palace-theater-waterbury`), check-off + badge flow with a logged-in user, and `sitemap.xml` containing the new URLs. Then `git push`.
