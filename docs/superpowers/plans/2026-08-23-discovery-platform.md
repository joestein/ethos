# Discovery Platform Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Graph page-links with "Connected pages" on every guide/place, collections (starting with The Burys of Connecticut), Postgres full-text search, and a single-admin global suggestion queue.

**Architecture:** A polymorphic `page_links` edge table over guides/places rendered via a shared component; `collections`/`collection_items` with public `/c/:slug` pages; expression-indexed Postgres FTS behind `Ethos.Search`; an email-bound admin pipeline over the existing `Ethos.Contributions` accept/decline paths.

**Tech Stack:** Elixir/Phoenix 1.7.14, Ecto/Postgres (FTS, no extensions), dead controller views.

**Spec:** `docs/superpowers/specs/2026-08-23-discovery-platform-design.md`

## Global Constraints

- Phoenix 1.7.14 conventions (`current_user`); zero AI/API calls in all new code.
- Edge kinds exactly: `nearby`, `shared-history`, `same-region`, `see-also`; note ≤160 chars; self-links rejected; unique (source_type, source_id, target_type, target_id, kind).
- Admin = email case-insensitive match against `:ethos, :admin_email` (env `ADMIN_EMAIL`, default `"cryptcom@gmail.com"`); non-admin hits on /admin/* render 404, never 403.
- Search page carries `<meta name="robots" content="noindex">`; empty/短 (<2 chars) queries return empty results; published guides only.
- All external URLs behind `EthosWeb.Url.safe_http?/1`; new public pages get canonical + JSON-LD per house pattern.
- `mix format` clean and full suite (281 tests at plan time) green before every commit.

---

### Task 1: page_links schema + Ethos.Links context

**Files:**
- Create: `priv/repo/migrations/20260823120000_create_page_links.exs`
- Create: `lib/ethos/links/link.ex`
- Create: `lib/ethos/links.ex`
- Test: `test/ethos/links_test.exs`

**Interfaces:**
- Consumes: `Ethos.Guides.Guide` / `Ethos.Places.Place` (existing; looked up by slug).
- Produces: `Links.upsert_link!(%{source: {:guide, slug}|{:place, slug}, target: same, kind: k, note: n_or_nil})` → `%Link{}` (raises ArgumentError naming the bad ref when a slug doesn't resolve; raises on self-link/bad kind via changeset); `Links.links_for(type, id)` (type in `"guide"|"place"`) → list of `%{kind, note, other: %{type, id, slug, title, subtitle}}` (outgoing ∪ incoming, ≤4 queries total); `Links.delete_links_for/2`; `Links.prune_orphans/0` → count deleted.

- [ ] **Step 1: Migration**

```elixir
defmodule Ethos.Repo.Migrations.CreatePageLinks do
  use Ecto.Migration

  def change do
    create table(:page_links) do
      add :source_type, :string, null: false
      add :source_id, :integer, null: false
      add :target_type, :string, null: false
      add :target_id, :integer, null: false
      add :kind, :string, null: false
      add :note, :string
      timestamps(type: :utc_datetime)
    end

    create unique_index(:page_links, [:source_type, :source_id, :target_type, :target_id, :kind])
    create index(:page_links, [:source_type, :source_id])
    create index(:page_links, [:target_type, :target_id])
  end
end
```

- [ ] **Step 2: Failing tests**

`test/ethos/links_test.exs`:

```elixir
defmodule Ethos.LinksTest do
  use Ethos.DataCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.{Links, Places}

  defp place!(slug, name \\ nil) do
    Places.upsert_place!(%{
      slug: slug,
      name: name || slug,
      kind: "museum",
      town: "Testville",
      state: "New York",
      county: "Manhattan",
      summary: "x"
    })
  end

  test "upsert_link! resolves slugs, is idempotent, updates note" do
    g = published_guide_fixture(%{title: "Guide A"})
    p = place!("place-a", "Place A")

    l1 =
      Links.upsert_link!(%{
        source: {:guide, g.slug},
        target: {:place, "place-a"},
        kind: "nearby",
        note: "steps away"
      })

    l2 =
      Links.upsert_link!(%{
        source: {:guide, g.slug},
        target: {:place, "place-a"},
        kind: "nearby",
        note: "around the corner"
      })

    assert l1.id == l2.id
    assert l2.note == "around the corner"
    assert l1.source_type == "guide" and l1.source_id == g.id
    assert l1.target_type == "place" and l1.target_id == p.id
  end

  test "bad slug, bad kind, long note, and self-link raise" do
    g = published_guide_fixture(%{title: "Guide B"})

    assert_raise ArgumentError, ~r/no-such-slug/, fn ->
      Links.upsert_link!(%{source: {:guide, g.slug}, target: {:guide, "no-such-slug"}, kind: "nearby", note: nil})
    end

    assert_raise Ecto.InvalidChangesetError, fn ->
      Links.upsert_link!(%{source: {:guide, g.slug}, target: {:guide, g.slug}, kind: "nearby", note: nil})
    end

    g2 = published_guide_fixture(%{title: "Guide C"})

    assert_raise Ecto.InvalidChangesetError, fn ->
      Links.upsert_link!(%{source: {:guide, g.slug}, target: {:guide, g2.slug}, kind: "friends", note: nil})
    end

    assert_raise Ecto.InvalidChangesetError, fn ->
      Links.upsert_link!(%{source: {:guide, g.slug}, target: {:guide, g2.slug}, kind: "nearby", note: String.duplicate("a", 161)})
    end
  end

  test "links_for returns union of outgoing and incoming, hydrated" do
    g = published_guide_fixture(%{title: "Hub Guide", destination: "Hubtown, New York"})
    p1 = place!("out-place", "Out Place")
    p2 = place!("in-place", "In Place")

    Links.upsert_link!(%{source: {:guide, g.slug}, target: {:place, "out-place"}, kind: "nearby", note: nil})
    Links.upsert_link!(%{source: {:place, "in-place"}, target: {:guide, g.slug}, kind: "shared-history", note: "old ties"})

    results = Links.links_for("guide", g.id)
    assert length(results) == 2

    nearby = Enum.find(results, &(&1.kind == "nearby"))
    assert nearby.other.slug == "out-place"
    assert nearby.other.title == "Out Place"
    assert nearby.other.type == "place"
    assert nearby.other.subtitle =~ "Testville"

    hist = Enum.find(results, &(&1.kind == "shared-history"))
    assert hist.other.slug == "in-place"
    assert hist.note == "old ties"

    assert p1.id != p2.id
  end

  test "prune_orphans removes edges whose endpoints are gone" do
    g = published_guide_fixture(%{title: "Doomed"})
    g2 = published_guide_fixture(%{title: "Stays"})
    Links.upsert_link!(%{source: {:guide, g.slug}, target: {:guide, g2.slug}, kind: "see-also", note: nil})

    Repo.delete!(g)
    assert Links.prune_orphans() == 1
    assert Links.links_for("guide", g2.id) == []
  end
end
```

- [ ] **Step 3: Run to verify failure** — `mix test test/ethos/links_test.exs`.

- [ ] **Step 4: Schema**

`lib/ethos/links/link.ex`:

```elixir
defmodule Ethos.Links.Link do
  use Ecto.Schema
  import Ecto.Changeset

  @kinds ~w(nearby shared-history same-region see-also)
  @types ~w(guide place)

  def kinds, do: @kinds

  schema "page_links" do
    field :source_type, :string
    field :source_id, :integer
    field :target_type, :string
    field :target_id, :integer
    field :kind, :string
    field :note, :string
    timestamps(type: :utc_datetime)
  end

  def changeset(link, attrs) do
    link
    |> cast(attrs, [:source_type, :source_id, :target_type, :target_id, :kind, :note])
    |> validate_required([:source_type, :source_id, :target_type, :target_id, :kind])
    |> validate_inclusion(:source_type, @types)
    |> validate_inclusion(:target_type, @types)
    |> validate_inclusion(:kind, @kinds)
    |> validate_length(:note, max: 160)
    |> validate_not_self()
    |> unique_constraint([:source_type, :source_id, :target_type, :target_id, :kind],
      name: :page_links_source_type_source_id_target_type_target_id_kind_index
    )
  end

  defp validate_not_self(changeset) do
    st = get_field(changeset, :source_type)
    si = get_field(changeset, :source_id)
    tt = get_field(changeset, :target_type)
    ti = get_field(changeset, :target_id)

    if st == tt and si == ti and not is_nil(si) do
      add_error(changeset, :target_id, "cannot link a page to itself")
    else
      changeset
    end
  end
end
```

- [ ] **Step 5: Context**

`lib/ethos/links.ex`:

```elixir
defmodule Ethos.Links do
  @moduledoc """
  The page-link graph: typed edges between guides and places. Nodes are
  polymorphic {type, id} pairs; rendering unions outgoing and incoming
  edges, so one stored edge connects both pages.
  """

  import Ecto.Query, warn: false

  alias Ethos.Repo
  alias Ethos.Links.Link
  alias Ethos.Guides.Guide
  alias Ethos.Places.Place

  def upsert_link!(%{source: source, target: target, kind: kind} = attrs) do
    {st, sid} = resolve!(source)
    {tt, tid} = resolve!(target)

    case Repo.get_by(Link,
           source_type: st,
           source_id: sid,
           target_type: tt,
           target_id: tid,
           kind: kind
         ) do
      nil -> %Link{}
      link -> link
    end
    |> Link.changeset(%{
      source_type: st,
      source_id: sid,
      target_type: tt,
      target_id: tid,
      kind: kind,
      note: Map.get(attrs, :note)
    })
    |> Repo.insert_or_update!()
  end

  defp resolve!({:guide, slug}) do
    case Repo.get_by(Guide, slug: slug) do
      nil -> raise ArgumentError, "page link references unknown guide #{slug}"
      g -> {"guide", g.id}
    end
  end

  defp resolve!({:place, slug}) do
    case Repo.get_by(Place, slug: slug) do
      nil -> raise ArgumentError, "page link references unknown place #{slug}"
      p -> {"place", p.id}
    end
  end

  def links_for(type, id) when type in ["guide", "place"] do
    outgoing =
      Repo.all(from l in Link, where: l.source_type == ^type and l.source_id == ^id)

    incoming =
      Repo.all(from l in Link, where: l.target_type == ^type and l.target_id == ^id)

    edges =
      Enum.map(outgoing, &{&1, {&1.target_type, &1.target_id}}) ++
        Enum.map(incoming, &{&1, {&1.source_type, &1.source_id}})

    guide_ids = for {_l, {"guide", gid}} <- edges, do: gid
    place_ids = for {_l, {"place", pid}} <- edges, do: pid

    guides =
      Map.new(Repo.all(from g in Guide, where: g.id in ^guide_ids), &{&1.id, &1})

    places =
      Map.new(Repo.all(from p in Place, where: p.id in ^place_ids), &{&1.id, &1})

    edges
    |> Enum.flat_map(fn {link, {ot, oid}} ->
      case hydrate(ot, oid, guides, places) do
        nil -> []
        other -> [%{kind: link.kind, note: link.note, other: other}]
      end
    end)
    |> Enum.uniq_by(&{&1.other.type, &1.other.id, &1.kind})
  end

  defp hydrate("guide", id, guides, _places) do
    case guides[id] do
      nil -> nil
      g -> %{type: "guide", id: g.id, slug: g.slug, title: g.title, subtitle: g.destination}
    end
  end

  defp hydrate("place", id, _guides, places) do
    case places[id] do
      nil -> nil
      p -> %{type: "place", id: p.id, slug: p.slug, title: p.name, subtitle: "#{p.kind} · #{p.town}"}
    end
  end

  def delete_links_for(type, id) when type in ["guide", "place"] do
    Repo.delete_all(
      from l in Link,
        where:
          (l.source_type == ^type and l.source_id == ^id) or
            (l.target_type == ^type and l.target_id == ^id)
    )
  end

  def prune_orphans do
    {n1, _} =
      Repo.delete_all(
        from l in Link,
          where:
            (l.source_type == "guide" and
               l.source_id not in subquery(from g in Guide, select: g.id)) or
              (l.target_type == "guide" and
                 l.target_id not in subquery(from g in Guide, select: g.id))
      )

    {n2, _} =
      Repo.delete_all(
        from l in Link,
          where:
            (l.source_type == "place" and
               l.source_id not in subquery(from p in Place, select: p.id)) or
              (l.target_type == "place" and
                 l.target_id not in subquery(from p in Place, select: p.id))
      )

    n1 + n2
  end
end
```

- [ ] **Step 6: Migrate, run tests, full suite, commit**

```bash
mix ecto.migrate && mix test test/ethos/links_test.exs && mix test
mix format && git add -A && git commit -m "feat: page_links graph schema and context"
```

---

### Task 2: "Connected pages" rendering on guide and place pages

**Files:**
- Create: `lib/ethos_web/components/connected_pages.ex`
- Modify: `lib/ethos_web/controllers/guide_controller.ex` (show: assign `connected`)
- Modify: `lib/ethos_web/controllers/place_controller.ex` (show: assign `connected`)
- Modify: `lib/ethos_web/controllers/guide_html/show.html.heex` (render before footer)
- Modify: `lib/ethos_web/controllers/place_html/show.html.heex` (render after Featured-in)
- Test: `test/ethos_web/controllers/connected_pages_test.exs`

**Interfaces:**
- Consumes: `Links.links_for/2` (Task 1).
- Produces: `<EthosWeb.ConnectedPages.connected_pages connected={...} />` component; both show actions assign `connected: Links.links_for("guide"|"place", id)`.

- [ ] **Step 1: Failing test**

```elixir
defmodule EthosWeb.ConnectedPagesTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.{Links, Places}

  test "guide and place pages render grouped connected pages", %{conn: conn} do
    g = published_guide_fixture(%{title: "Woodbury Guide", destination: "Woodbury, Connecticut"})

    p =
      Places.upsert_place!(%{
        slug: "glebe-house-x",
        name: "Glebe House X",
        kind: "museum",
        town: "Woodbury",
        state: "Connecticut",
        county: "Litchfield County",
        summary: "x"
      })

    Links.upsert_link!(%{
      source: {:guide, g.slug},
      target: {:place, "glebe-house-x"},
      kind: "shared-history",
      note: "Same parish story"
    })

    html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)
    assert html =~ "Connected pages"
    assert html =~ "Shared history"
    assert html =~ "Glebe House X"
    assert html =~ "Same parish story"

    html = build_conn() |> get(~p"/p/glebe-house-x") |> html_response(200)
    assert html =~ "Connected pages"
    assert html =~ "Woodbury Guide"
  end

  test "section absent when no links", %{conn: conn} do
    g = published_guide_fixture(%{title: "Lonely"})
    html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)
    refute html =~ "Connected pages"
  end
end
```

- [ ] **Step 2: Run to verify failure**, then implement.

`lib/ethos_web/components/connected_pages.ex`:

```elixir
defmodule EthosWeb.ConnectedPages do
  use Phoenix.Component
  use EthosWeb, :verified_routes

  @headings %{
    "nearby" => "Nearby",
    "shared-history" => "Shared history",
    "same-region" => "Same region",
    "see-also" => "See also"
  }

  attr :connected, :list, required: true

  def connected_pages(assigns) do
    groups =
      assigns.connected
      |> Enum.group_by(& &1.kind)
      |> Enum.sort_by(fn {kind, _} -> Enum.find_index(Map.keys(@headings), &(&1 == kind)) || 99 end)

    assigns = assign(assigns, :groups, groups) |> assign(:headings, @headings)

    ~H"""
    <section :if={@connected != []} class="mt-10 border-t pt-6">
      <h2 class="text-xl font-semibold">Connected pages</h2>
      <div :for={{kind, items} <- @groups} class="mt-4">
        <h3 class="text-sm uppercase tracking-wide text-zinc-400">
          {Map.get(@headings, kind, kind)}
        </h3>
        <ul class="mt-2 space-y-2">
          <li :for={item <- items}>
            <.link navigate={other_path(item.other)} class="font-medium underline">
              {item.other.title}
            </.link>
            <span class="text-sm text-zinc-500">· {item.other.subtitle}</span>
            <p :if={item.note} class="text-sm text-zinc-500">{item.note}</p>
          </li>
        </ul>
      </div>
    </section>
    """
  end

  defp other_path(%{type: "guide", slug: slug}), do: ~p"/g/#{slug}"
  defp other_path(%{type: "place", slug: slug}), do: ~p"/p/#{slug}"
end
```

Controllers: in `GuideController.show/2` add `connected: Ethos.Links.links_for("guide", guide.id)` to the render assigns; in `PlaceController.show/2` add `connected: Ethos.Links.links_for("place", place.id)`.

Templates: `guide_html/show.html.heex` — insert `<EthosWeb.ConnectedPages.connected_pages connected={@connected} />` immediately BEFORE the `<footer>`; `place_html/show.html.heex` — insert the same line after the "Featured in these guides" section (end of article).

- [ ] **Step 3: Run tests + suite, commit**

```bash
mix format && git add -A && git commit -m "feat: connected pages section on guide and place pages"
```

---

### Task 3: DataGuide `links` array + backfill seed + Release.seed_links

**Files:**
- Modify: `lib/ethos/seeds/data_guide.ex` (parse optional "links")
- Create: `lib/ethos/seeds/backfill_links.ex`
- Modify: `lib/ethos/release.ex` (add `seed_links/0`)
- Modify: `test/support/fixtures/seed_data/refville.json` (add a links array)
- Test: `test/ethos/seeds/backfill_links_test.exs`, extend `test/ethos/seeds/data_guide_test.exs`

**Interfaces:**
- Consumes: `Links.upsert_link!/1`, `Links.prune_orphans/0` (Task 1); `DataGuide.upsert_guide!/2` (existing).
- Produces: seed JSON optional top-level `"links"`: `[{"target": "guide:<slug>"|"place:<slug>", "kind": "...", "note": "..."}]` with source = the file's guide, upserted at the end of `upsert_guide!/2`; `Ethos.Seeds.BackfillLinks.upsert_all!/0` (idempotent; calls `Links.prune_orphans/0` first); `Ethos.Release.seed_links/0`.

- [ ] **Step 1: Extend refville fixture** — add to `test/support/fixtures/seed_data/refville.json` a top-level key (sibling of "guide"):

```json
  "links": [
    {"target": "guide:testville-manhattan-guide", "kind": "nearby", "note": "Fixture neighbors."},
    {"target": "place:test-square-park", "kind": "see-also", "note": null}
  ],
```

- [ ] **Step 2: Failing tests** — append to `test/ethos/seeds/data_guide_test.exs`:

```elixir
  test "seed file links array creates edges from the guide" do
    user = user_fixture()
    for path <- [@testville, @refville], do: DataGuide.upsert_places!(path)
    for path <- [@testville, @refville], do: DataGuide.upsert_guide!(path, user.email)
    # run twice — idempotent
    DataGuide.upsert_guide!(@refville, user.email)

    ref = Guides.get_published_guide_by_slug!("refville-manhattan-guide")
    connected = Ethos.Links.links_for("guide", ref.id)
    assert Enum.any?(connected, &(&1.kind == "nearby" and &1.other.slug == "testville-manhattan-guide"))
    assert Enum.any?(connected, &(&1.kind == "see-also" and &1.other.slug == "test-square-park"))
    assert length(connected) == 2
  end
```

`test/ethos/seeds/backfill_links_test.exs`:

```elixir
defmodule Ethos.Seeds.BackfillLinksTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.Seeds

  test "backfill is idempotent and only links pages that exist" do
    user = user_fixture()
    Seeds.ConnecticutPlaces.upsert_all!()
    Seeds.WoodburyGuide.upsert!(user.email)
    Seeds.SouthburyGuide.upsert!(user.email)
    # Manhattan guides absent — their edges must be skipped, not raise

    n1 = Seeds.BackfillLinks.upsert_all!()
    n2 = Seeds.BackfillLinks.upsert_all!()
    assert n1 == n2 and n1 > 0

    woodbury = Ethos.Guides.get_published_guide_by_slug!("woodbury-ct-travel-guide")
    connected = Ethos.Links.links_for("guide", woodbury.id)
    assert Enum.any?(connected, &(&1.other.slug == "southbury-ct-travel-guide" and &1.kind == "shared-history"))
  end
end
```

- [ ] **Step 3: Run to verify failure**, then implement.

`DataGuide.upsert_guide!/2` — after `GuideRunner.upsert!(runner_data, email)` returns `guide`, add:

```elixir
    for l <- data["links"] || [] do
      Ethos.Links.upsert_link!(%{
        source: {:guide, guide.slug},
        target: parse_ref!(path, l["target"]),
        kind: l["kind"],
        note: l["note"]
      })
    end

    guide
```

with:

```elixir
  defp parse_ref!(path, "guide:" <> slug), do: {:guide, slug}
  defp parse_ref!(path, "place:" <> slug), do: {:place, slug}

  defp parse_ref!(path, other),
    do: raise(ArgumentError, "#{path}: bad link target #{inspect(other)} (want guide:<slug> or place:<slug>)")
```

(`_ = path` unused-var warnings: the first two clauses ignore path — name it `_path` there.)

`lib/ethos/seeds/backfill_links.ex` — data-driven, skip-if-missing (backfill tolerates partially seeded DBs; per-file seed links stay strict):

```elixir
defmodule Ethos.Seeds.BackfillLinks do
  @moduledoc """
  Idempotent backfill of graph edges between already-seeded pages: CT-five
  history/nearby edges, Manhattan neighborhood adjacency, and cross-state
  see-also edges. Edges whose endpoints are not yet seeded are skipped, so
  this can run at any stage of content buildout. Returns the number of
  edges upserted.
  """

  alias Ethos.{Links, Repo}
  alias Ethos.Guides.Guide

  @ct_g "-ct-travel-guide"
  @m_g "-manhattan-guide"

  # {source_slug_base, target_slug_base, kind, note} — all guide↔guide.
  defp ct_edges do
    [
      {"woodbury#{@ct_g}", "southbury#{@ct_g}", "shared-history",
       "Both grew from the 1673 Pomperaug Plantation; Southbury was Woodbury's southern parish until 1787."},
      {"woodbury#{@ct_g}", "middlebury#{@ct_g}", "shared-history",
       "Middlebury (1807) was assembled partly from Woodbury land."},
      {"southbury#{@ct_g}", "middlebury#{@ct_g}", "shared-history",
       "Middlebury (1807) was assembled partly from Southbury land."},
      {"waterbury#{@ct_g}", "middlebury#{@ct_g}", "shared-history",
       "Middlebury (1807) was assembled partly from Waterbury land."},
      {"waterbury#{@ct_g}", "middlebury#{@ct_g}", "nearby", nil},
      {"middlebury#{@ct_g}", "woodbury#{@ct_g}", "nearby", nil},
      {"woodbury#{@ct_g}", "southbury#{@ct_g}", "nearby", nil},
      {"southbury#{@ct_g}", "danbury#{@ct_g}", "nearby", nil}
    ]
  end

  # Manhattan geographic adjacency, one direction each (rendering unions).
  defp manhattan_pairs do
    [
      {"financial-district", "battery-park-city"},
      {"financial-district", "tribeca"},
      {"financial-district", "two-bridges"},
      {"financial-district", "chinatown"},
      {"battery-park-city", "tribeca"},
      {"tribeca", "soho"},
      {"tribeca", "chinatown"},
      {"chinatown", "little-italy"},
      {"chinatown", "two-bridges"},
      {"chinatown", "lower-east-side"},
      {"little-italy", "nolita"},
      {"little-italy", "soho"},
      {"little-italy", "lower-east-side"},
      {"nolita", "soho"},
      {"nolita", "noho"},
      {"nolita", "lower-east-side"},
      {"two-bridges", "lower-east-side"},
      {"lower-east-side", "east-village"},
      {"soho", "noho"},
      {"soho", "greenwich-village"},
      {"soho", "west-village"},
      {"noho", "greenwich-village"},
      {"noho", "east-village"},
      {"greenwich-village", "west-village"},
      {"greenwich-village", "east-village"},
      {"greenwich-village", "union-square"},
      {"west-village", "meatpacking-district"},
      {"west-village", "chelsea"},
      {"east-village", "alphabet-city"},
      {"east-village", "union-square"},
      {"east-village", "gramercy"},
      {"alphabet-city", "lower-east-side"},
      {"union-square", "flatiron-district"},
      {"union-square", "gramercy"},
      {"union-square", "chelsea"},
      {"flatiron-district", "gramercy"},
      {"flatiron-district", "chelsea"},
      {"flatiron-district", "nomad"},
      {"gramercy", "kips-bay"},
      {"chelsea", "meatpacking-district"},
      {"chelsea", "garment-district"},
      {"chelsea", "hudson-yards"},
      {"hudson-yards", "garment-district"},
      {"hudson-yards", "hell-s-kitchen"},
      {"garment-district", "koreatown"},
      {"garment-district", "theater-district"},
      {"garment-district", "hell-s-kitchen"},
      {"koreatown", "murray-hill"},
      {"koreatown", "nomad"},
      {"koreatown", "midtown"},
      {"murray-hill", "kips-bay"},
      {"murray-hill", "nomad"},
      {"murray-hill", "midtown"},
      {"nomad", "midtown"},
      {"midtown", "theater-district"},
      {"midtown", "hell-s-kitchen"},
      {"midtown", "upper-east-side"},
      {"theater-district", "hell-s-kitchen"},
      {"hell-s-kitchen", "upper-west-side"},
      {"upper-west-side", "morningside-heights"},
      {"upper-east-side", "yorkville"},
      {"upper-east-side", "carnegie-hill"},
      {"upper-east-side", "east-harlem"},
      {"yorkville", "carnegie-hill"},
      {"yorkville", "east-harlem"},
      {"carnegie-hill", "east-harlem"},
      {"morningside-heights", "harlem"},
      {"morningside-heights", "hamilton-heights"},
      {"harlem", "east-harlem"},
      {"harlem", "hamilton-heights"},
      {"hamilton-heights", "washington-heights"},
      {"washington-heights", "inwood"}
    ]
  end

  defp cross_state_edges do
    [
      {"danbury#{@ct_g}", "midtown#{@m_g}", "see-also",
       "Metro-North's Danbury Branch connects to the New Haven Line into Grand Central Terminal."},
      {"waterbury#{@ct_g}", "midtown#{@m_g}", "see-also",
       "Metro-North's Waterbury Branch connects to the New Haven Line into Grand Central Terminal."}
    ]
  end

  def upsert_all! do
    Links.prune_orphans()

    edges =
      ct_edges() ++
        Enum.map(manhattan_pairs(), fn {a, b} -> {a <> @m_g, b <> @m_g, "nearby", nil} end) ++
        cross_state_edges()

    existing =
      Repo.all(Guide) |> Enum.map(& &1.slug) |> MapSet.new()

    edges
    |> Enum.filter(fn {a, b, _k, _n} -> MapSet.member?(existing, a) and MapSet.member?(existing, b) end)
    |> Enum.map(fn {a, b, kind, note} ->
      Links.upsert_link!(%{source: {:guide, a}, target: {:guide, b}, kind: kind, note: note})
    end)
    |> length()
  end
end
```

`lib/ethos/release.ex` — after `seed_manhattan/1`:

```elixir
  def seed_links do
    load_app()
    Application.ensure_all_started(@app)
    count = Ethos.Seeds.BackfillLinks.upsert_all!()
    IO.puts("Upserted #{count} page links")
  end
```

- [ ] **Step 4: Run new tests + suite, commit**

```bash
mix test test/ethos/seeds/backfill_links_test.exs test/ethos/seeds/data_guide_test.exs && mix test
mix format && git add -A && git commit -m "feat: seed-file links, graph backfill, seed_links release task"
```

---

### Task 4: Collections + The Burys of Connecticut

**Files:**
- Create: `priv/repo/migrations/20260823121000_create_collections.exs`
- Create: `lib/ethos/collections/collection.ex`, `lib/ethos/collections/collection_item.ex`
- Create: `lib/ethos/collections.ex`
- Create: `lib/ethos_web/controllers/collection_controller.ex`, `lib/ethos_web/controllers/collection_html.ex`, `lib/ethos_web/controllers/collection_html/show.html.heex`
- Create: `lib/ethos/seeds/burys_collection.ex`
- Modify: `lib/ethos_web/router.ex` (`get "/c/:slug", CollectionController, :show` in the public scope)
- Modify: `lib/ethos_web/controllers/sitemap_controller.ex` (collection URLs)
- Modify: `lib/ethos_web/controllers/destination_html/index.html.heex` + `destination_controller.ex` index (Collections section)
- Modify: `lib/ethos_web/controllers/guide_controller.ex` show + `guide_html/show.html.heex` ("Part of {collection}" line under header)
- Modify: `lib/ethos/release.ex` (`seed_collections/0`)
- Test: `test/ethos/collections_test.exs`, `test/ethos_web/controllers/collection_controller_test.exs`

**Interfaces:**
- Consumes: `Guides.get_published_guide_by_slug/1`, `EthosWeb.Markdown.render/1` + `excerpt/2`.
- Produces: `Collections.upsert_collection!(%{slug:, title:, intro:, published:, items: [%{guide_slug:, blurb:}]})` (items replaced in order, transaction; unknown guide slug raises ArgumentError with the slug); `Collections.get_published_by_slug/1` (nil-safe, items preloaded with guides ordered by position); `Collections.list_published/0`; `Collections.collections_for_guide(guide)` → `[%Collection{}]`; `Ethos.Seeds.BurysCollection.upsert!/0`; `Ethos.Release.seed_collections/0`.

- [ ] **Step 1: Migration**

```elixir
defmodule Ethos.Repo.Migrations.CreateCollections do
  use Ecto.Migration

  def change do
    create table(:collections) do
      add :slug, :string, null: false
      add :title, :string, null: false
      add :intro, :text
      add :published, :boolean, default: false, null: false
      timestamps(type: :utc_datetime)
    end

    create unique_index(:collections, [:slug])

    create table(:collection_items) do
      add :collection_id, references(:collections, on_delete: :delete_all), null: false
      add :guide_id, references(:guides, on_delete: :delete_all), null: false
      add :position, :integer, null: false, default: 0
      add :blurb, :string
      timestamps(type: :utc_datetime)
    end

    create unique_index(:collection_items, [:collection_id, :guide_id])
    create index(:collection_items, [:guide_id])
  end
end
```

- [ ] **Step 2: Failing context tests**

`test/ethos/collections_test.exs`:

```elixir
defmodule Ethos.CollectionsTest do
  use Ethos.DataCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Collections

  test "upsert_collection! creates, replaces items in order, idempotent" do
    g1 = published_guide_fixture(%{title: "Waterbury"})
    g2 = published_guide_fixture(%{title: "Woodbury"})

    attrs = %{
      slug: "test-collection",
      title: "Test Collection",
      intro: "An **intro**.",
      published: true,
      items: [
        %{guide_slug: g1.slug, blurb: "First"},
        %{guide_slug: g2.slug, blurb: "Second"}
      ]
    }

    c1 = Collections.upsert_collection!(attrs)
    c2 = Collections.upsert_collection!(%{attrs | items: Enum.reverse(attrs.items)})
    assert c1.id == c2.id

    loaded = Collections.get_published_by_slug("test-collection")
    assert [%{blurb: "Second"}, %{blurb: "First"}] = loaded.items
    assert [g2.id, g1.id] == Enum.map(loaded.items, & &1.guide_id)

    assert Collections.collections_for_guide(g1) |> Enum.map(& &1.slug) == ["test-collection"]
  end

  test "unknown guide slug raises; unpublished hidden" do
    assert_raise ArgumentError, ~r/nope-guide/, fn ->
      Collections.upsert_collection!(%{
        slug: "bad",
        title: "Bad",
        intro: nil,
        published: true,
        items: [%{guide_slug: "nope-guide", blurb: nil}]
      })
    end

    g = published_guide_fixture(%{title: "Hidden member"})

    Collections.upsert_collection!(%{
      slug: "draft-col",
      title: "Draft",
      intro: nil,
      published: false,
      items: [%{guide_slug: g.slug, blurb: nil}]
    })

    assert Collections.get_published_by_slug("draft-col") == nil
    assert Collections.list_published() |> Enum.map(& &1.slug) == []
    assert Collections.collections_for_guide(g) == []
  end
end
```

- [ ] **Step 3: Run to verify failure**, then implement schemas + context.

`lib/ethos/collections/collection.ex`:

```elixir
defmodule Ethos.Collections.Collection do
  use Ecto.Schema
  import Ecto.Changeset

  schema "collections" do
    field :slug, :string
    field :title, :string
    field :intro, :string
    field :published, :boolean, default: false
    has_many :items, Ethos.Collections.CollectionItem, preload_order: [asc: :position]
    timestamps(type: :utc_datetime)
  end

  def changeset(collection, attrs) do
    collection
    |> cast(attrs, [:slug, :title, :intro, :published])
    |> validate_required([:slug, :title])
    |> validate_format(:slug, ~r/^[a-z0-9-]+$/)
    |> unique_constraint(:slug)
  end
end
```

`lib/ethos/collections/collection_item.ex`:

```elixir
defmodule Ethos.Collections.CollectionItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "collection_items" do
    belongs_to :collection, Ethos.Collections.Collection
    belongs_to :guide, Ethos.Guides.Guide
    field :position, :integer, default: 0
    field :blurb, :string
    timestamps(type: :utc_datetime)
  end

  def changeset(item, attrs) do
    item
    |> cast(attrs, [:position, :blurb])
    |> validate_length(:blurb, max: 300)
  end
end
```

`lib/ethos/collections.ex`:

```elixir
defmodule Ethos.Collections do
  import Ecto.Query, warn: false

  alias Ethos.Repo
  alias Ethos.Collections.{Collection, CollectionItem}
  alias Ethos.Guides.Guide

  def upsert_collection!(%{slug: slug, items: items} = attrs) do
    {:ok, collection} =
      Repo.transaction(fn ->
        collection =
          case Repo.get_by(Collection, slug: slug) do
            nil -> %Collection{}
            c -> c
          end
          |> Collection.changeset(Map.drop(attrs, [:items]))
          |> Repo.insert_or_update!()

        Repo.delete_all(from i in CollectionItem, where: i.collection_id == ^collection.id)

        items
        |> Enum.with_index()
        |> Enum.each(fn {item, idx} ->
          guide =
            Repo.get_by(Guide, slug: item.guide_slug) ||
              raise ArgumentError, "collection #{slug} references unknown guide #{item.guide_slug}"

          %CollectionItem{collection_id: collection.id, guide_id: guide.id, position: idx}
          |> CollectionItem.changeset(%{blurb: item[:blurb], position: idx})
          |> Repo.insert!()
        end)

        collection
      end)

    collection
  end

  def get_published_by_slug(slug) do
    Repo.one(
      from c in Collection,
        where: c.slug == ^slug and c.published == true,
        preload: [items: [:guide]]
    )
  end

  def list_published do
    Repo.all(from c in Collection, where: c.published == true, order_by: [asc: c.title])
  end

  def collections_for_guide(%Guide{id: guide_id}) do
    Repo.all(
      from c in Collection,
        join: i in CollectionItem,
        on: i.collection_id == c.id,
        where: i.guide_id == ^guide_id and c.published == true,
        order_by: [asc: c.title]
    )
  end
end
```

Note on `upsert_collection!`: the `ArgumentError` raised inside the
transaction aborts it; `Repo.transaction` re-raises — matching the test.

- [ ] **Step 4: Controller, view, template, route, sitemap, hub, guide back-link**

`lib/ethos_web/controllers/collection_controller.ex`:

```elixir
defmodule EthosWeb.CollectionController do
  use EthosWeb, :controller

  alias Ethos.Collections

  def show(conn, %{"slug" => slug}) do
    case Collections.get_published_by_slug(slug) do
      nil ->
        conn |> put_status(:not_found) |> put_view(EthosWeb.ErrorHTML) |> render(:"404")

      collection ->
        meta_description = EthosWeb.Markdown.excerpt(collection.intro, 160) || collection.title

        render(conn, :show,
          collection: collection,
          page_title: collection.title,
          page_meta_description: meta_description,
          page_canonical: url(~p"/c/#{collection.slug}"),
          json_ld: [collection_ld(collection), breadcrumb_ld(collection)]
        )
    end
  end

  defp collection_ld(collection) do
    %{
      "@context" => "https://schema.org",
      "@type" => "CollectionPage",
      "name" => collection.title,
      "url" => url(~p"/c/#{collection.slug}"),
      "hasPart" =>
        Enum.map(collection.items, fn item ->
          %{
            "@type" => "Article",
            "headline" => item.guide.title,
            "url" => url(~p"/g/#{item.guide.slug}")
          }
        end)
    }
  end

  defp breadcrumb_ld(collection) do
    %{
      "@context" => "https://schema.org",
      "@type" => "BreadcrumbList",
      "itemListElement" => [
        %{"@type" => "ListItem", "position" => 1, "name" => "Ethos", "item" => url(~p"/")},
        %{"@type" => "ListItem", "position" => 2, "name" => "Destinations", "item" => url(~p"/destinations")},
        %{"@type" => "ListItem", "position" => 3, "name" => collection.title, "item" => url(~p"/c/#{collection.slug}")}
      ]
    }
  end
end
```

`lib/ethos_web/controllers/collection_html.ex`:

```elixir
defmodule EthosWeb.CollectionHTML do
  use EthosWeb, :html

  embed_templates "collection_html/*"
end
```

`lib/ethos_web/controllers/collection_html/show.html.heex`:

```heex
<article class="mx-auto max-w-2xl px-4 py-10">
  <nav class="text-sm text-zinc-500">
    <.link navigate={~p"/destinations"} class="underline">Destinations</.link> / {@collection.title}
  </nav>
  <h1 class="mt-2 text-3xl font-bold">{@collection.title}</h1>
  <div :if={@collection.intro} class="prose mt-4">
    {EthosWeb.Markdown.render(@collection.intro)}
  </div>

  <ol class="mt-8 space-y-4">
    <li :for={item <- @collection.items} class="rounded-xl border p-5">
      <div class="flex items-start gap-4">
        <img
          :if={first = List.first(item.guide.photos || [])}
          src={first["thumb"]}
          alt={first["title"]}
          loading="lazy"
          class="h-20 w-20 rounded-lg object-cover"
        />
        <div>
          <.link navigate={~p"/g/#{item.guide.slug}"} class="text-lg font-semibold hover:underline">
            {item.guide.title}
          </.link>
          <p class="text-sm text-zinc-500">{item.guide.destination}</p>
          <p :if={item.blurb} class="mt-1 text-sm text-zinc-600">{item.blurb}</p>
        </div>
      </div>
    </li>
  </ol>
</article>
```

Router (public scope, after the `/p/:slug` line): `get "/c/:slug", CollectionController, :show`.

Sitemap (`sitemap_controller.ex`) — append:

```elixir
        Enum.map(Ethos.Collections.list_published(), fn c ->
          %{loc: url(~p"/c/#{c.slug}"), lastmod: DateTime.to_date(c.updated_at)}
        end) ++
```

Destinations index: in `destination_controller.ex` `index/2` assign `collections: Ethos.Collections.list_published()`; in `destination_html/index.html.heex` add before the states section:

```heex
<section :if={@collections != []} class="mt-6">
  <h2 class="font-semibold">Collections</h2>
  <ul class="mt-3 space-y-2">
    <li :for={c <- @collections}>
      <.link navigate={~p"/c/#{c.slug}"} class="underline">{c.title}</.link>
    </li>
  </ul>
</section>
```

Guide back-link: in `guide_controller.ex` `show/2` assign `collections: Ethos.Collections.collections_for_guide(guide)`; in `guide_html/show.html.heex` under the header's destination line add:

```heex
    <p :for={c <- @collections} class="mt-1 text-sm text-zinc-500">
      Part of <.link navigate={~p"/c/#{c.slug}"} class="underline">{c.title}</.link>
    </p>
```

- [ ] **Step 5: Burys seed + release task**

`lib/ethos/seeds/burys_collection.ex`:

```elixir
defmodule Ethos.Seeds.BurysCollection do
  @moduledoc "Seeds The Burys of Connecticut collection. Idempotent by slug."

  alias Ethos.Collections

  def upsert! do
    Collections.upsert_collection!(%{
      slug: "the-burys-of-connecticut",
      title: "The Burys of Connecticut",
      published: true,
      intro: """
      Connecticut has a habit of naming towns with the Old English ending
      *-bury* — "fortified settlement" — and ten of its towns carry it.
      Five of them sit within a short drive of each other in the state's
      western hills, sharing colonial roots, brass-and-hat industrial
      history, and some of Connecticut's best small-town wandering. This
      collection gathers our guides to the Burys — start anywhere and
      follow the connections.
      """,
      items: [
        %{
          guide_slug: "waterbury-ct-travel-guide",
          blurb: "The Brass City: a Thomas Lamb palace theater, the Mattatuck Museum, and grinders since 1922."
        },
        %{
          guide_slug: "danbury-ct-travel-guide",
          blurb: "Hat City: the museum campus that tells how Danbury crowned America, plus a working railway museum."
        },
        %{
          guide_slug: "middlebury-ct-travel-guide",
          blurb: "Quassy, the lakeside amusement park running since 1908, and a trolley line turned greenway."
        },
        %{
          guide_slug: "southbury-ct-travel-guide",
          blurb: "Pomperaug valley parks, a one-kettle land legend, and the region's resort-style hotel."
        },
        %{
          guide_slug: "woodbury-ct-travel-guide",
          blurb: "Connecticut's antiques capital, the Glebe House, and the only public Gertrude Jekyll garden in America."
        }
      ]
    })
  end
end
```

`lib/ethos/release.ex` — after `seed_links/0`:

```elixir
  def seed_collections do
    load_app()
    Application.ensure_all_started(@app)
    collection = Ethos.Seeds.BurysCollection.upsert!()
    IO.puts("Seeded collection: /c/#{collection.slug}")
  end
```

- [ ] **Step 6: Controller tests**

`test/ethos_web/controllers/collection_controller_test.exs`:

```elixir
defmodule EthosWeb.CollectionControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Collections

  test "renders published collection with members, JSON-LD, backlink on guide", %{conn: conn} do
    g = published_guide_fixture(%{title: "Woodbury Wander"})

    Collections.upsert_collection!(%{
      slug: "burys-test",
      title: "Burys Test",
      intro: "Ten towns end in **-bury**.",
      published: true,
      items: [%{guide_slug: g.slug, blurb: "The antiques one."}]
    })

    html = conn |> get(~p"/c/burys-test") |> html_response(200)
    assert html =~ "Burys Test"
    assert html =~ "Woodbury Wander"
    assert html =~ "The antiques one."
    assert html =~ "CollectionPage"

    html = build_conn() |> get(~p"/g/#{g.slug}") |> html_response(200)
    assert html =~ "Part of"
    assert html =~ "Burys Test"

    html = build_conn() |> get(~p"/destinations") |> html_response(200)
    assert html =~ "Collections"
    assert html =~ "Burys Test"

    xml = build_conn() |> get(~p"/sitemap.xml") |> response(200)
    assert xml =~ "/c/burys-test</loc>"
  end

  test "unpublished or unknown collection 404s", %{conn: conn} do
    assert conn |> get(~p"/c/nope") |> html_response(404)
  end
end
```

- [ ] **Step 7: Run all new tests + suite, commit**

```bash
mix ecto.migrate && mix test test/ethos/collections_test.exs test/ethos_web/controllers/collection_controller_test.exs && mix test
mix format && git add -A && git commit -m "feat: collections with Burys of Connecticut, pages, sitemap, backlinks"
```

---

### Task 5: Full-text search

**Files:**
- Create: `priv/repo/migrations/20260823122000_add_search_indexes.exs`
- Create: `lib/ethos/search.ex`
- Create: `lib/ethos_web/controllers/search_controller.ex`, `lib/ethos_web/controllers/search_html.ex`, `lib/ethos_web/controllers/search_html/index.html.heex`
- Modify: `lib/ethos_web/router.ex` (`get "/search", SearchController, :index` public scope)
- Modify: `lib/ethos_web/components/layouts/root.html.heex` (noindex meta when `assigns[:noindex]`)
- Modify: `lib/ethos_web/components/layouts/app.html.heex` (nav search form)
- Test: `test/ethos/search_test.exs`, `test/ethos_web/controllers/search_controller_test.exs`

**Interfaces:**
- Consumes: guides/places tables.
- Produces: `Ethos.Search.query(q, limit \\ 20)` → `%{guides: [%Guide{}], places: [%Place{}]}`.

- [ ] **Step 1: Migration** (expression indexes must match the query expressions EXACTLY, including coalesce and concatenation order)

```elixir
defmodule Ethos.Repo.Migrations.AddSearchIndexes do
  use Ecto.Migration

  def up do
    execute """
    CREATE INDEX guides_fts_idx ON guides USING GIN (
      to_tsvector('english', coalesce(title,'') || ' ' || coalesce(destination,'') || ' ' || coalesce(intro,''))
    )
    """

    execute """
    CREATE INDEX places_fts_idx ON places USING GIN (
      to_tsvector('english', coalesce(name,'') || ' ' || coalesce(town,'') || ' ' || coalesce(summary,'') || ' ' || coalesce(history,''))
    )
    """
  end

  def down do
    execute "DROP INDEX guides_fts_idx"
    execute "DROP INDEX places_fts_idx"
  end
end
```

- [ ] **Step 2: Failing context tests**

`test/ethos/search_test.exs`:

```elixir
defmodule Ethos.SearchTest do
  use Ethos.DataCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.{Places, Search}

  test "finds published guides and places by words; name matches rank first" do
    published_guide_fixture(%{"title" => "Brass City Weekend", "destination" => "Waterbury, Connecticut"})
    draft = guide_fixture(%{"title" => "Brass Unpublished"})

    Places.upsert_place!(%{
      slug: "brass-works",
      name: "Brass Works Brewing",
      kind: "brewery",
      town: "Waterbury",
      state: "Connecticut",
      county: "New Haven County",
      summary: "Named for the brass heritage."
    })

    Places.upsert_place!(%{
      slug: "other-museum",
      name: "History Museum",
      kind: "museum",
      town: "Elsewhere",
      state: "Connecticut",
      county: "New Haven County",
      summary: "A museum that mentions brass once."
    })

    %{guides: guides, places: places} = Search.query("brass")
    assert Enum.map(guides, & &1.title) == ["Brass City Weekend"]
    refute Enum.any?(guides, &(&1.id == draft.id))
    assert List.first(places).slug == "brass-works"
    assert Enum.any?(places, &(&1.slug == "other-museum"))
  end

  test "short and empty queries return empties" do
    assert Search.query("") == %{guides: [], places: []}
    assert Search.query("a") == %{guides: [], places: []}
    assert Search.query("   ") == %{guides: [], places: []}
  end
end
```

- [ ] **Step 3: Run to verify failure**, then implement.

`lib/ethos/search.ex`:

```elixir
defmodule Ethos.Search do
  @moduledoc "Postgres full-text search over published guides and places."

  import Ecto.Query, warn: false

  alias Ethos.Repo
  alias Ethos.Guides.Guide
  alias Ethos.Places.Place

  def query(q, limit \\ 20)

  def query(q, limit) when is_binary(q) do
    q = String.trim(q)

    if String.length(q) < 2 do
      %{guides: [], places: []}
    else
      %{guides: search_guides(q, limit), places: search_places(q, limit)}
    end
  end

  defp search_guides(q, limit) do
    Repo.all(
      from g in Guide,
        where: g.status == "published",
        where:
          fragment(
            "to_tsvector('english', coalesce(?,'') || ' ' || coalesce(?,'') || ' ' || coalesce(?,'')) @@ websearch_to_tsquery('english', ?)",
            g.title,
            g.destination,
            g.intro,
            ^q
          ),
        order_by: [
          desc:
            fragment(
              "ts_rank(to_tsvector('english', coalesce(?,'') || ' ' || coalesce(?,'') || ' ' || coalesce(?,'')), websearch_to_tsquery('english', ?))",
              g.title,
              g.destination,
              g.intro,
              ^q
            )
        ],
        limit: ^limit
    )
  end

  defp search_places(q, limit) do
    Repo.all(
      from p in Place,
        where:
          fragment(
            "to_tsvector('english', coalesce(?,'') || ' ' || coalesce(?,'') || ' ' || coalesce(?,'') || ' ' || coalesce(?,'')) @@ websearch_to_tsquery('english', ?)",
            p.name,
            p.town,
            p.summary,
            p.history,
            ^q
          ),
        order_by: [
          desc:
            fragment(
              "ts_rank(to_tsvector('english', coalesce(?,'') || ' ' || coalesce(?,'') || ' ' || coalesce(?,'') || ' ' || coalesce(?,'')), websearch_to_tsquery('english', ?))",
              p.name,
              p.town,
              p.summary,
              p.history,
              ^q
            ),
          asc: p.name
        ],
        limit: ^limit
    )
  end
end
```

- [ ] **Step 4: Controller, template, nav, noindex**

`lib/ethos_web/controllers/search_controller.ex`:

```elixir
defmodule EthosWeb.SearchController do
  use EthosWeb, :controller

  def index(conn, params) do
    q = Map.get(params, "q", "")
    results = Ethos.Search.query(q)

    render(conn, :index,
      q: q,
      results: results,
      noindex: true,
      page_title: if(q == "", do: "Search", else: "Search: #{q}")
    )
  end
end
```

`lib/ethos_web/controllers/search_html.ex`: same shape as `CollectionHTML` (`use EthosWeb, :html` + `embed_templates "search_html/*"`).

`lib/ethos_web/controllers/search_html/index.html.heex`:

```heex
<div class="mx-auto max-w-2xl px-4 py-10">
  <h1 class="text-3xl font-bold">Search</h1>
  <form action={~p"/search"} method="get" class="mt-4 flex gap-2">
    <input
      type="search"
      name="q"
      value={@q}
      placeholder="Towns, museums, restaurants…"
      class="w-full rounded-lg border-zinc-300"
      autofocus
    />
    <button class="rounded-lg bg-zinc-900 px-4 py-2 text-white">Search</button>
  </form>

  <p :if={@q != "" and @results.guides == [] and @results.places == []} class="mt-8 text-zinc-500">
    No results for "{@q}".
  </p>

  <section :if={@results.guides != []} class="mt-8">
    <h2 class="font-semibold">Guides</h2>
    <ul class="mt-3 space-y-2">
      <li :for={g <- @results.guides}>
        <.link navigate={~p"/g/#{g.slug}"} class="underline">{g.title}</.link>
        <span class="text-sm text-zinc-500">· {g.destination}</span>
      </li>
    </ul>
  </section>

  <section :if={@results.places != []} class="mt-8">
    <h2 class="font-semibold">Places</h2>
    <ul class="mt-3 space-y-2">
      <li :for={p <- @results.places}>
        <.link navigate={~p"/p/#{p.slug}"} class="underline">{p.name}</.link>
        <span class="text-sm text-zinc-500">· {p.kind} · {p.town}, {p.state}</span>
      </li>
    </ul>
  </section>
</div>
```

Router: `get "/search", SearchController, :index` in the public scope.

`root.html.heex` — after the google-site-verification block add:

```heex
    <%= if assigns[:noindex] do %>
      <meta name="robots" content="noindex" />
    <% end %>
```

`app.html.heex` — in the header `<nav>`, BEFORE the Destinations link:

```heex
      <form action={~p"/search"} method="get" class="hidden sm:block">
        <input
          type="search"
          name="q"
          placeholder="Search"
          class="w-36 rounded-lg border-zinc-300 py-1 text-sm"
        />
      </form>
```

- [ ] **Step 5: Controller tests**

`test/ethos_web/controllers/search_controller_test.exs`:

```elixir
defmodule EthosWeb.SearchControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures

  test "search page groups results and is noindex", %{conn: conn} do
    published_guide_fixture(%{"title" => "Harlem Heritage", "destination" => "Harlem, New York"})

    html = conn |> get(~p"/search?q=harlem") |> html_response(200)
    assert html =~ "Guides"
    assert html =~ "Harlem Heritage"
    assert html =~ ~s(<meta name="robots" content="noindex")
  end

  test "empty query renders the form without results", %{conn: conn} do
    html = conn |> get(~p"/search") |> html_response(200)
    assert html =~ "Search"
    refute html =~ "No results"
  end

  test "nav search box present on other pages", %{conn: conn} do
    html = conn |> get(~p"/destinations") |> html_response(200)
    assert html =~ ~s(action="/search")
  end
end
```

- [ ] **Step 6: Migrate, run tests + suite, commit**

```bash
mix ecto.migrate && mix test test/ethos/search_test.exs test/ethos_web/controllers/search_controller_test.exs && mix test
mix format && git add -A && git commit -m "feat: Postgres full-text search with nav box and noindex results page"
```

---

### Task 6: Admin suggestion queue

**Files:**
- Modify: `config/runtime.exs` (ADMIN_EMAIL), `config/config.exs` (compile default `config :ethos, :admin_email, "cryptcom@gmail.com"`)
- Modify: `lib/ethos/accounts.ex` (add `admin?/1`)
- Modify: `lib/ethos/contributions.ex` (add `list_all_pending_suggestions/0`, `get_suggestion_by_id!/1`)
- Modify: `lib/ethos_web/user_auth.ex` (add `require_admin_user/2` plug)
- Modify: `lib/ethos_web/router.ex` (admin scope)
- Create: `lib/ethos_web/controllers/admin_suggestion_controller.ex`, `lib/ethos_web/controllers/admin_suggestion_html.ex`, `lib/ethos_web/controllers/admin_suggestion_html/index.html.heex`
- Modify: `lib/ethos_web/components/layouts/app.html.heex` (Admin nav link, admin only)
- Test: `test/ethos_web/controllers/admin_suggestion_controller_test.exs`

**Interfaces:**
- Consumes: `Contributions.accept_suggestion/1`, `decline_suggestion/1` (existing; both return `{:error, :already_processed}` on non-pending).
- Produces: `Accounts.admin?(user_or_nil)` → boolean; routes `GET /admin/suggestions`, `POST /admin/suggestions/:id/accept`, `POST /admin/suggestions/:id/decline`.

- [ ] **Step 1: Failing tests**

`test/ethos_web/controllers/admin_suggestion_controller_test.exs`:

```elixir
defmodule EthosWeb.AdminSuggestionControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures
  alias Ethos.Contributions

  defp admin_conn(_) do
    admin = user_fixture(%{email: "cryptcom@gmail.com"})
    %{conn: log_in_user(build_conn(), admin), admin: admin}
  end

  defp pending_suggestion do
    author = user_fixture()
    guide = published_guide_fixture(%{title: "Suggestible"})

    {:ok, s} =
      Contributions.create_suggestion(author, guide, %{
        place_name: "New Spot",
        body: "Try this",
        kind_hint: "food"
      })

    {s, guide, author}
  end

  describe "as admin" do
    setup :admin_conn

    test "lists all pending suggestions across guides", %{conn: conn} do
      {_s, guide, author} = pending_suggestion()
      html = conn |> get(~p"/admin/suggestions") |> html_response(200)
      assert html =~ "New Spot"
      assert html =~ guide.title
      assert html =~ author.email
    end

    test "accept creates credited entry; decline resolves; double-accept flashes error", %{conn: conn} do
      {s, guide, author} = pending_suggestion()

      conn2 = post(conn, ~p"/admin/suggestions/#{s.id}/accept")
      assert redirected_to(conn2) == ~p"/admin/suggestions"

      entries = Ethos.Guides.list_entries(guide)
      assert [entry] = Enum.filter(entries, &(&1.name == "New Spot"))
      assert entry.credited_user_id == author.id
      assert entry.source == "suggestion"

      conn3 = post(conn, ~p"/admin/suggestions/#{s.id}/accept")
      assert Phoenix.Flash.get(conn3.assigns.flash, :error) =~ "already"

      {s2, _g, _a} = pending_suggestion()
      post(conn, ~p"/admin/suggestions/#{s2.id}/decline")
      html = conn |> get(~p"/admin/suggestions") |> html_response(200)
      refute html =~ s2.place_name
    end
  end

  test "non-admin gets 404; logged-out redirected to log in" do
    user = user_fixture(%{email: "not-admin@example.com"})
    conn = log_in_user(build_conn(), user)
    assert conn |> get(~p"/admin/suggestions") |> html_response(404)

    conn = build_conn() |> get(~p"/admin/suggestions")
    assert redirected_to(conn) == ~p"/users/log_in"
  end
end
```

(Check `Ethos.AccountsFixtures.user_fixture/1` accepts an email override — it builds attrs with `valid_user_attributes`; pass `%{email: ...}`. `log_in_user/2` is a ConnCase helper from phx.gen.auth.)

- [ ] **Step 2: Run to verify failure**, then implement.

`config/config.exs` (near other `:ethos` config): `config :ethos, :admin_email, "cryptcom@gmail.com"`.

`config/runtime.exs` (next to the GOOGLE_SITE_VERIFICATION block):

```elixir
if admin_email = System.get_env("ADMIN_EMAIL") do
  config :ethos, :admin_email, admin_email
end
```

`lib/ethos/accounts.ex` — add:

```elixir
  @doc "True when the user is THE admin (single admin, bound by email config)."
  def admin?(%Ethos.Accounts.User{email: email}) when is_binary(email) do
    admin = Application.get_env(:ethos, :admin_email) || ""
    String.downcase(email) == String.downcase(admin)
  end

  def admin?(_), do: false
```

`lib/ethos/contributions.ex` — add:

```elixir
  def list_all_pending_suggestions do
    Repo.all(
      from s in Suggestion,
        where: s.status == "pending",
        order_by: [desc: s.id],
        preload: [:author, :guide]
    )
  end

  def get_suggestion_by_id!(id), do: Repo.get_by!(Suggestion, id: id)
```

`lib/ethos_web/user_auth.ex` — add (near `require_authenticated_user/2`):

```elixir
  @doc """
  Used for routes that require the single configured admin. Renders 404 for
  any other user so the admin surface is not advertised.
  """
  def require_admin_user(conn, _opts) do
    if Ethos.Accounts.admin?(conn.assigns[:current_user]) do
      conn
    else
      conn
      |> Plug.Conn.put_status(:not_found)
      |> Phoenix.Controller.put_view(EthosWeb.ErrorHTML)
      |> Phoenix.Controller.render(:"404")
      |> halt()
    end
  end
```

`lib/ethos_web/router.ex` — new scope after the authenticated scope:

```elixir
  scope "/admin", EthosWeb do
    pipe_through [:browser, :require_authenticated_user, :require_admin_user]

    get "/suggestions", AdminSuggestionController, :index
    post "/suggestions/:id/accept", AdminSuggestionController, :accept
    post "/suggestions/:id/decline", AdminSuggestionController, :decline
  end
```

(`require_admin_user` is importable as a plug because the router already
does `import EthosWeb.UserAuth`.)

`lib/ethos_web/controllers/admin_suggestion_controller.ex`:

```elixir
defmodule EthosWeb.AdminSuggestionController do
  use EthosWeb, :controller

  alias Ethos.Contributions

  def index(conn, _params) do
    render(conn, :index,
      suggestions: Contributions.list_all_pending_suggestions(),
      page_title: "Suggestion queue"
    )
  end

  def accept(conn, %{"id" => id}) do
    suggestion = Contributions.get_suggestion_by_id!(id)

    case Contributions.accept_suggestion(suggestion) do
      {:ok, _} -> put_flash(conn, :info, "Accepted #{suggestion.place_name}.")
      {:error, :already_processed} -> put_flash(conn, :error, "That suggestion was already handled.")
      {:error, _} -> put_flash(conn, :error, "Could not accept that suggestion.")
    end
    |> redirect(to: ~p"/admin/suggestions")
  end

  def decline(conn, %{"id" => id}) do
    suggestion = Contributions.get_suggestion_by_id!(id)

    case Contributions.decline_suggestion(suggestion) do
      {:ok, _} -> put_flash(conn, :info, "Declined #{suggestion.place_name}.")
      {:error, :already_processed} -> put_flash(conn, :error, "That suggestion was already handled.")
    end
    |> redirect(to: ~p"/admin/suggestions")
  end
end
```

`lib/ethos_web/controllers/admin_suggestion_html.ex`: `use EthosWeb, :html` + `embed_templates "admin_suggestion_html/*"`.

`lib/ethos_web/controllers/admin_suggestion_html/index.html.heex`:

```heex
<div class="mx-auto max-w-2xl px-4 py-10">
  <h1 class="text-3xl font-bold">Suggestion queue</h1>
  <p class="mt-1 text-zinc-500">{length(@suggestions)} pending</p>

  <p :if={@suggestions == []} class="mt-8 text-zinc-500">Nothing waiting. 🎉</p>

  <ul class="mt-6 space-y-4">
    <li :for={s <- @suggestions} class="rounded-xl border p-5">
      <p class="text-sm text-zinc-500">
        For <.link navigate={~p"/g/#{s.guide.slug}"} class="underline">{s.guide.title}</.link>
        <span :if={s.author}>· from {s.author.email}</span>
        <span :if={is_nil(s.author)}>· via {s.origin}</span>
      </p>
      <p class="mt-1 font-semibold">{s.place_name}</p>
      <p :if={s.body} class="mt-1 text-sm text-zinc-600">{s.body}</p>
      <p :if={EthosWeb.Url.safe_http?(s.url)} class="mt-1 text-sm">
        <a href={s.url} class="underline" rel="nofollow noopener" target="_blank">{s.url}</a>
      </p>
      <div class="mt-3 flex gap-3">
        <form action={~p"/admin/suggestions/#{s.id}/accept"} method="post">
          <input type="hidden" name="_csrf_token" value={Plug.CSRFProtection.get_csrf_token()} />
          <button class="rounded-lg bg-emerald-600 px-3 py-1.5 text-sm text-white">Accept</button>
        </form>
        <form action={~p"/admin/suggestions/#{s.id}/decline"} method="post">
          <input type="hidden" name="_csrf_token" value={Plug.CSRFProtection.get_csrf_token()} />
          <button class="rounded-lg border px-3 py-1.5 text-sm">Decline</button>
        </form>
      </div>
    </li>
  </ul>
</div>
```

`app.html.heex` — inside the `@current_user` block, after the Badges link:

```heex
        <.link
          :if={Ethos.Accounts.admin?(@current_user)}
          navigate={~p"/admin/suggestions"}
          class="hover:text-zinc-700"
        >
          Admin
        </.link>
```

- [ ] **Step 3: Run tests + suite, commit**

```bash
mix test test/ethos_web/controllers/admin_suggestion_controller_test.exs && mix test
mix format && git add -A && git commit -m "feat: single-admin global suggestion queue"
```

---

### Task 7: Search Console runbook

**Files:**
- Create: `docs/runbooks/google-search-console.md`

**Interfaces:** none (documentation).

- [ ] **Step 1: Write the runbook**

```markdown
# Google Search Console runbook

Property: Domain property `ethosguides.com` (verified 2026-08-23 via the
Route 53 TXT record `google-site-verification=HAuBTTvhwPv9QoR6huT-NIxVEkCjhssp8MlwUAVTKbs`).
A URL-prefix property can additionally be added anytime; the site serves a
matching `google-site-verification` meta tag from the
`GOOGLE_SITE_VERIFICATION` Fly secret.

## After verification (one-time)
1. Search Console → Sitemaps → add `https://ethosguides.com/sitemap.xml`.
2. URL Inspection → Request indexing for `/`, `/destinations/connecticut`,
   `/destinations/new-york/manhattan`, and `/c/the-burys-of-connecticut`.

## Per content launch
- The sitemap is dynamic — new guides/places/collections appear
  automatically; optionally re-submit the sitemap to nudge recrawl.
- Request indexing for the highest-value new hub (e.g. a new state or
  collection page).

## Rotation / recovery
- Meta tag: update the `GOOGLE_SITE_VERIFICATION` secret
  (`fly secrets set GOOGLE_SITE_VERIFICATION=... -a ethos`) and deploy.
- DNS: the TXT record lives in Route 53 zone `ethosguides.com`
  (Z08945076X91CIDSYLDO), record type TXT at the apex.
- robots.txt is served dynamically at `/robots.txt` and always points at
  the canonical sitemap URL.
```

- [ ] **Step 2: Commit**

```bash
git add docs/runbooks && git commit -m "docs: Google Search Console runbook"
```

---

### Task 8 (controller-executed, NOT for implementation subagents): rollout

After final review and merge to main: `fly deploy` (release_command runs the
three migrations), then
`fly ssh console -a ethos -C "/app/bin/ethos eval 'Ethos.Release.seed_links()'"` and
`fly ssh console -a ethos -C "/app/bin/ethos eval 'Ethos.Release.seed_collections()'"`,
then verify live on ethosguides.com: `/c/the-burys-of-connecticut` (200,
members, JSON-LD), a Woodbury↔Southbury "Connected pages" section, Manhattan
neighborhood adjacency on two pages, `/search?q=brass` returning grouped
results, nav search box, `/admin/suggestions` as cryptcom (200) and as
logged-out (redirect), sitemap containing `/c/` URLs. Then `git push`.
