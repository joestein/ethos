# Ethos — Trip Log → Shareable Guide Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build Ethos v1 — paste a trip dump, AI structures it into a guide you confirm and publish at a shareable public URL, with exa-powered enrichment, reader suggestions accepted with credit, and OG share cards.

**Architecture:** Single Phoenix app. LiveView for authoring flows, a plain controller for public guide pages (SEO + OG cards). Domain contexts (`Guides`, `Contributions`, `Research`) own persistence. A Jido action pipeline (`ParseDump` → `EnrichEntries` → `GapFill`) does all AI/exa work, orchestrated by `Ethos.Agents.GuideAgent` under a Task.Supervisor. Claude and exa are called over raw HTTP via Req behind behaviours mocked with Mox.

**Tech Stack:** Elixir ~> 1.17, Phoenix 1.7.x (pinned), Ecto/Postgres, Phoenix LiveView, Jido ~> 1.2, Req, Mox, Vix (SVG→PNG for OG cards), Fly.io deploy.

**Spec:** `docs/superpowers/specs/2026-08-17-ethos-travel-guides-design.md`

## Global Constraints

- Phoenix generator pinned: `mix archive.install hex phx_new 1.7.14 --force` — all code in this plan is written against Phoenix 1.7 conventions (`current_user` assign, not 1.8 scopes). Do not upgrade mid-plan.
- Claude model is exactly `claude-opus-5`, called via raw HTTP `POST https://api.anthropic.com/v1/messages` with headers `x-api-key` + `anthropic-version: 2023-06-01`. Every parse/gap-fill request sets `output_config: %{effort: "low", format: %{type: "json_schema", schema: ...}}` and a frozen system prompt block with `cache_control: %{type: "ephemeral"}`.
- exa called via `POST https://api.exa.ai/search` with header `x-api-key`.
- Tests NEVER hit live APIs. `config/test.exs` sets `config :ethos, :claude, Ethos.ClaudeMock` and `config :ethos, :exa, Ethos.ExaMock` (Mox mocks of the behaviours).
- Secrets from env vars only: `ANTHROPIC_API_KEY`, `EXA_API_KEY`. Never in code or config files.
- AI budget rules (from spec): exactly 1 Claude call per import parse; gap-fill = max 3 exa queries + exactly 1 Claude call, publish-time only; enrichment and Research button use zero AI.
- Cache rules: enrichment cache entries never expire; `research` cache entries expire after 7 days; Research button rate limit = 10 calls/user/hour.
- Entry kinds: `food | tour | walk | sight | stay | tip`. Verdicts: `loved | good | skip`. Guide statuses: `draft | published`. Import statuses: `pending | parsing | parsed | failed`. Suggestion statuses: `pending | accepted | declined`. Suggestion origins: `user | gap_fill`. Entry sources: `import | manual | suggestion | gap_fill`.
- Run `mix test` green before every commit.

---

### Task 1: Scaffold the Phoenix app and dependencies

**Files:**
- Create: entire app via generator at repo root (`/Users/charmalloc/dev/ethos`)
- Modify: `mix.exs` (deps), `config/test.exs`, `test/test_helper.exs`, `.gitignore`

**Interfaces:**
- Consumes: nothing (first task)
- Produces: a compiling app named `Ethos` / OTP app `:ethos`; deps `{:req, "~> 0.5"}`, `{:jido, "~> 1.2"}`, `{:mox, "~> 1.1", only: :test}`, `{:vix, "~> 0.26"}` available to all later tasks.

- [ ] **Step 1: Pin the generator and scaffold**

The repo root already contains `.git`, `README.md`, and `docs/`. Generate the app in place:

```bash
cd /Users/charmalloc/dev/ethos
mix archive.install hex phx_new 1.7.14 --force
mix phx.new . --app ethos --module Ethos --install
```

Answer `y` to "The directory ... already exists. Are you sure you want to continue?". Do NOT overwrite `README.md` if prompted (answer `n` for README, `y` for everything else).

- [ ] **Step 2: Add dependencies**

In `mix.exs`, add to `deps/0`:

```elixir
{:req, "~> 0.5"},
{:jido, "~> 1.2"},
{:vix, "~> 0.26"},
{:mox, "~> 1.1", only: :test},
```

Run: `mix deps.get`

- [ ] **Step 3: Create the database and verify the scaffold tests pass**

```bash
mix ecto.create
mix test
```

Expected: all generated tests PASS.

- [ ] **Step 4: Commit**

```bash
git add -A
git commit -m "chore: scaffold Phoenix 1.7 app with req, jido, vix, mox deps"
```

---

### Task 2: Authentication

**Files:**
- Create: everything `mix phx.gen.auth` generates (Accounts context, LiveViews, migrations)
- Test: generated auth tests

**Interfaces:**
- Consumes: Task 1 scaffold
- Produces: `Ethos.Accounts` with `%Ethos.Accounts.User{}`; `:require_authenticated_user` plug/on_mount hooks; `@current_user` assign; `register_user/1` and `Ethos.AccountsFixtures.user_fixture/0` for tests.

- [ ] **Step 1: Run the generator**

```bash
mix phx.gen.auth Accounts User users
mix deps.get
mix ecto.migrate
```

Choose LiveView-based auth when prompted (answer `y`).

- [ ] **Step 2: Run tests**

Run: `mix test`
Expected: PASS (generator ships its own suite).

- [ ] **Step 3: Commit**

```bash
git add -A
git commit -m "feat: add authentication via phx.gen.auth"
```

---

### Task 3: Guides schema and context

**Files:**
- Create: `lib/ethos/guides.ex`, `lib/ethos/guides/guide.ex`, `priv/repo/migrations/*_create_guides.exs`
- Test: `test/ethos/guides_test.exs`
- Create: `test/support/fixtures/guides_fixtures.ex`

**Interfaces:**
- Consumes: `Ethos.Accounts.User` (Task 2)
- Produces: `Ethos.Guides.create_guide(user, attrs) :: {:ok, %Guide{}} | {:error, changeset}`, `get_guide!(id)`, `get_user_guide!(user, id)` (raises unless owned), `get_published_guide_by_slug!(slug)`, `list_user_guides(user)`, `publish_guide(guide) :: {:ok, guide}`, `increment_view_count(guide)`. `%Guide{}` fields: `title, slug, destination, starts_on, ends_on, status ("draft"|"published"), view_count, og_image_path, user_id`.

- [ ] **Step 1: Write the failing test**

`test/ethos/guides_test.exs`:

```elixir
defmodule Ethos.GuidesTest do
  use Ethos.DataCase, async: true

  alias Ethos.Guides
  import Ethos.AccountsFixtures

  describe "create_guide/2" do
    test "creates a draft guide with a unique slug from the title" do
      user = user_fixture()

      {:ok, guide} =
        Guides.create_guide(user, %{title: "Lisbon in 5 days", destination: "Lisbon, Portugal"})

      assert guide.status == "draft"
      assert guide.user_id == user.id
      assert guide.slug =~ ~r/^lisbon-in-5-days-[a-z0-9]{6}$/
      assert guide.view_count == 0
    end

    test "requires title and destination" do
      user = user_fixture()
      {:error, changeset} = Guides.create_guide(user, %{})
      assert %{title: _, destination: _} = errors_on(changeset)
    end
  end

  describe "publish_guide/1" do
    test "marks the guide published" do
      user = user_fixture()
      {:ok, guide} = Guides.create_guide(user, %{title: "Tokyo", destination: "Tokyo, Japan"})
      {:ok, published} = Guides.publish_guide(guide)
      assert published.status == "published"
      assert Guides.get_published_guide_by_slug!(guide.slug).id == guide.id
    end
  end

  describe "increment_view_count/1" do
    test "bumps view_count" do
      user = user_fixture()
      {:ok, guide} = Guides.create_guide(user, %{title: "Rome", destination: "Rome, Italy"})
      Guides.increment_view_count(guide)
      assert Guides.get_guide!(guide.id).view_count == 1
    end
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/guides_test.exs`
Expected: FAIL — `Ethos.Guides` is not available.

- [ ] **Step 3: Migration, schema, context**

Generate migration: `mix ecto.gen.migration create_guides` and fill in:

```elixir
defmodule Ethos.Repo.Migrations.CreateGuides do
  use Ecto.Migration

  def change do
    create table(:guides) do
      add :title, :string, null: false
      add :slug, :string, null: false
      add :destination, :string, null: false
      add :starts_on, :date
      add :ends_on, :date
      add :status, :string, null: false, default: "draft"
      add :view_count, :integer, null: false, default: 0
      add :og_image_path, :string
      add :user_id, references(:users, on_delete: :delete_all), null: false
      timestamps(type: :utc_datetime)
    end

    create unique_index(:guides, [:slug])
    create index(:guides, [:user_id])
  end
end
```

`lib/ethos/guides/guide.ex`:

```elixir
defmodule Ethos.Guides.Guide do
  use Ecto.Schema
  import Ecto.Changeset

  @statuses ~w(draft published)

  schema "guides" do
    field :title, :string
    field :slug, :string
    field :destination, :string
    field :starts_on, :date
    field :ends_on, :date
    field :status, :string, default: "draft"
    field :view_count, :integer, default: 0
    field :og_image_path, :string
    belongs_to :user, Ethos.Accounts.User
    has_many :entries, Ethos.Guides.Entry, preload_order: [asc: :position]
    timestamps(type: :utc_datetime)
  end

  def changeset(guide, attrs) do
    guide
    |> cast(attrs, [:title, :destination, :starts_on, :ends_on])
    |> validate_required([:title, :destination])
    |> validate_length(:title, max: 120)
    |> maybe_put_slug()
  end

  def status_changeset(guide, status) when status in @statuses do
    change(guide, status: status)
  end

  defp maybe_put_slug(changeset) do
    case {get_field(changeset, :slug), get_change(changeset, :title)} do
      {nil, title} when is_binary(title) ->
        suffix = for _ <- 1..6, into: "", do: <<Enum.random(~c"abcdefghijklmnopqrstuvwxyz0123456789")>>

        slug =
          title
          |> String.downcase()
          |> String.replace(~r/[^a-z0-9\s-]/, "")
          |> String.replace(~r/\s+/, "-")
          |> String.slice(0, 60)

        put_change(changeset, :slug, "#{slug}-#{suffix}")

      _ ->
        changeset
    end
  end
end
```

`lib/ethos/guides.ex` (the `has_many :entries` line compiles even before Task 4 because Ecto resolves associations lazily — but to keep every commit compiling, add the `Entry` schema in Task 4 and comment nothing out; instead, delete the `has_many` line here and re-add it in Task 4. Write it WITHOUT the `has_many` line now):

```elixir
defmodule Ethos.Guides do
  import Ecto.Query, warn: false
  alias Ethos.Repo
  alias Ethos.Guides.Guide

  def create_guide(user, attrs) do
    %Guide{user_id: user.id}
    |> Guide.changeset(attrs)
    |> Repo.insert()
  end

  def get_guide!(id), do: Repo.get!(Guide, id)

  def get_user_guide!(user, id), do: Repo.get_by!(Guide, id: id, user_id: user.id)

  def get_published_guide_by_slug!(slug),
    do: Repo.get_by!(Guide, slug: slug, status: "published")

  def list_user_guides(user) do
    Repo.all(from g in Guide, where: g.user_id == ^user.id, order_by: [desc: g.inserted_at])
  end

  def publish_guide(%Guide{} = guide) do
    guide |> Guide.status_changeset("published") |> Repo.update()
  end

  def update_guide(%Guide{} = guide, attrs) do
    guide |> Guide.changeset(attrs) |> Repo.update()
  end

  def increment_view_count(%Guide{id: id}) do
    from(g in Guide, where: g.id == ^id)
    |> Repo.update_all(inc: [view_count: 1])

    :ok
  end
end
```

`test/support/fixtures/guides_fixtures.ex`:

```elixir
defmodule Ethos.GuidesFixtures do
  import Ethos.AccountsFixtures

  def guide_fixture(attrs \\ %{}) do
    user = Map.get_lazy(attrs, :user, fn -> user_fixture() end)

    {:ok, guide} =
      Ethos.Guides.create_guide(
        user,
        Enum.into(Map.drop(attrs, [:user]), %{title: "Test Trip", destination: "Lisbon, Portugal"})
      )

    guide
  end

  def published_guide_fixture(attrs \\ %{}) do
    {:ok, guide} = attrs |> guide_fixture() |> Ethos.Guides.publish_guide()
    guide
  end
end
```

Run: `mix ecto.migrate`

- [ ] **Step 4: Run test to verify it passes**

Run: `mix test test/ethos/guides_test.exs`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: guides schema and context with slug generation and publish"
```

---

### Task 4: Entries schema and context functions

**Files:**
- Create: `lib/ethos/guides/entry.ex`, `priv/repo/migrations/*_create_entries.exs`
- Modify: `lib/ethos/guides.ex`, `lib/ethos/guides/guide.ex` (re-add `has_many :entries`)
- Test: `test/ethos/entries_test.exs`

**Interfaces:**
- Consumes: `Ethos.Guides.Guide` (Task 3)
- Produces: `%Ethos.Guides.Entry{}` with fields `guide_id, day, kind, name, note, verdict, position, enrichment (map), lat, lng, credited_user_id, source`; context functions `Guides.list_entries(guide) :: [%Entry{}]` (ordered by position), `Guides.create_entry(guide, attrs)`, `Guides.update_entry(entry, attrs)`, `Guides.delete_entry(entry)`, `Guides.replace_entries_from_proposal(guide, [map]) :: {:ok, [%Entry{}]}` (inserts confirmed proposal rows with `source: "import"` and sequential positions), `Guides.set_entry_enrichment(entry, map)`.

- [ ] **Step 1: Write the failing test**

`test/ethos/entries_test.exs`:

```elixir
defmodule Ethos.EntriesTest do
  use Ethos.DataCase, async: true

  alias Ethos.Guides
  import Ethos.GuidesFixtures

  test "create_entry/2 validates kind and verdict" do
    guide = guide_fixture()

    {:ok, entry} =
      Guides.create_entry(guide, %{kind: "food", name: "Cervejaria Ramiro", verdict: "loved"})

    assert entry.source == "manual"
    assert entry.position == 0

    {:error, changeset} = Guides.create_entry(guide, %{kind: "banquet", name: "X"})
    assert %{kind: _} = errors_on(changeset)
  end

  test "replace_entries_from_proposal/2 inserts ordered import entries" do
    guide = guide_fixture()

    proposal = [
      %{"day" => 1, "kind" => "food", "name" => "Ramiro", "note" => "garlic shrimp", "verdict" => "loved"},
      %{"day" => 1, "kind" => "walk", "name" => "Alfama wander", "note" => nil, "verdict" => "good"}
    ]

    {:ok, entries} = Guides.replace_entries_from_proposal(guide, proposal)

    assert [%{name: "Ramiro", position: 0, source: "import"}, %{name: "Alfama wander", position: 1}] =
             entries

    assert length(Guides.list_entries(guide)) == 2
  end

  test "set_entry_enrichment/2 merges enrichment payload" do
    guide = guide_fixture()
    {:ok, entry} = Guides.create_entry(guide, %{kind: "sight", name: "Belem Tower", verdict: "good"})
    {:ok, entry} = Guides.set_entry_enrichment(entry, %{"official_url" => "https://example.com"})
    assert entry.enrichment["official_url"] == "https://example.com"
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/entries_test.exs`
Expected: FAIL — `create_entry/2` undefined.

- [ ] **Step 3: Migration, schema, context additions**

`mix ecto.gen.migration create_entries`:

```elixir
defmodule Ethos.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :guide_id, references(:guides, on_delete: :delete_all), null: false
      add :day, :integer
      add :kind, :string, null: false
      add :name, :string, null: false
      add :note, :text
      add :verdict, :string
      add :position, :integer, null: false, default: 0
      add :enrichment, :map
      add :lat, :float
      add :lng, :float
      add :credited_user_id, references(:users, on_delete: :nilify_all)
      add :source, :string, null: false, default: "manual"
      timestamps(type: :utc_datetime)
    end

    create index(:entries, [:guide_id, :position])
  end
end
```

`lib/ethos/guides/entry.ex`:

```elixir
defmodule Ethos.Guides.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  @kinds ~w(food tour walk sight stay tip)
  @verdicts ~w(loved good skip)
  @sources ~w(import manual suggestion gap_fill)

  def kinds, do: @kinds
  def verdicts, do: @verdicts

  schema "entries" do
    field :day, :integer
    field :kind, :string
    field :name, :string
    field :note, :string
    field :verdict, :string
    field :position, :integer, default: 0
    field :enrichment, :map
    field :lat, :float
    field :lng, :float
    field :source, :string, default: "manual"
    belongs_to :guide, Ethos.Guides.Guide
    belongs_to :credited_user, Ethos.Accounts.User
    timestamps(type: :utc_datetime)
  end

  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [:day, :kind, :name, :note, :verdict, :position, :lat, :lng, :source, :credited_user_id])
    |> validate_required([:kind, :name])
    |> validate_inclusion(:kind, @kinds)
    |> validate_inclusion(:verdict, @verdicts ++ [nil])
    |> validate_inclusion(:source, @sources)
  end
end
```

Re-add to `lib/ethos/guides/guide.ex` inside `schema`:

```elixir
has_many :entries, Ethos.Guides.Entry, preload_order: [asc: :position]
```

Append to `lib/ethos/guides.ex`:

```elixir
alias Ethos.Guides.Entry

def list_entries(%Guide{id: guide_id}) do
  Repo.all(from e in Entry, where: e.guide_id == ^guide_id, order_by: [asc: e.position, asc: e.id])
end

def get_entry!(%Guide{id: guide_id}, id), do: Repo.get_by!(Entry, id: id, guide_id: guide_id)

def create_entry(%Guide{} = guide, attrs) do
  position = next_position(guide)

  %Entry{guide_id: guide.id, position: position}
  |> Entry.changeset(Map.drop(attrs, [:position, "position"]))
  |> Repo.insert()
end

def update_entry(%Entry{} = entry, attrs) do
  entry |> Entry.changeset(attrs) |> Repo.update()
end

def delete_entry(%Entry{} = entry), do: Repo.delete(entry)

def replace_entries_from_proposal(%Guide{} = guide, proposal) when is_list(proposal) do
  Repo.transaction(fn ->
    Repo.delete_all(from e in Entry, where: e.guide_id == ^guide.id and e.source == "import")

    proposal
    |> Enum.with_index()
    |> Enum.map(fn {attrs, idx} ->
      %Entry{guide_id: guide.id, position: idx, source: "import"}
      |> Entry.changeset(Map.drop(attrs, ["source", :source]))
      |> Repo.insert!()
    end)
  end)
end

def set_entry_enrichment(%Entry{} = entry, payload) when is_map(payload) do
  entry |> Ecto.Changeset.change(enrichment: payload) |> Repo.update()
end

defp next_position(%Guide{id: guide_id}) do
  (Repo.one(from e in Entry, where: e.guide_id == ^guide_id, select: max(e.position)) || -1) + 1
end
```

Run: `mix ecto.migrate`

- [ ] **Step 4: Run tests to verify they pass**

Run: `mix test test/ethos/entries_test.exs test/ethos/guides_test.exs`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: entries schema with proposal replacement and enrichment"
```

---

### Task 5: Imports schema

**Files:**
- Create: `lib/ethos/guides/import.ex`, `priv/repo/migrations/*_create_imports.exs`
- Modify: `lib/ethos/guides.ex`
- Test: `test/ethos/imports_test.exs`

**Interfaces:**
- Consumes: `Guide` (Task 3)
- Produces: `%Ethos.Guides.Import{}` with `guide_id, raw_text, status, error, proposal ([map] jsonb)`; `Guides.create_import(guide, raw_text) :: {:ok, %Import{}}`, `Guides.get_import!(id)`, `Guides.mark_import(import, status, fields \\ %{})` where status ∈ `pending|parsing|parsed|failed` and fields may set `proposal`/`error`, `Guides.latest_import(guide)`.

- [ ] **Step 1: Write the failing test**

`test/ethos/imports_test.exs`:

```elixir
defmodule Ethos.ImportsTest do
  use Ethos.DataCase, async: true

  alias Ethos.Guides
  import Ethos.GuidesFixtures

  test "create_import/2 stores raw text as pending" do
    guide = guide_fixture()
    {:ok, imp} = Guides.create_import(guide, "day 1 we ate at Ramiro, amazing")
    assert imp.status == "pending"
    assert Guides.latest_import(guide).id == imp.id
  end

  test "mark_import/3 transitions status and stores proposal or error" do
    guide = guide_fixture()
    {:ok, imp} = Guides.create_import(guide, "notes")

    {:ok, imp} = Guides.mark_import(imp, "parsed", %{proposal: [%{"name" => "Ramiro", "kind" => "food"}]})
    assert imp.status == "parsed"
    assert [%{"name" => "Ramiro"}] = imp.proposal

    {:ok, imp} = Guides.mark_import(imp, "failed", %{error: "refusal"})
    assert imp.error == "refusal"
  end

  test "create_import/2 rejects blank text" do
    guide = guide_fixture()
    assert {:error, _} = Guides.create_import(guide, "   ")
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/imports_test.exs`
Expected: FAIL — `create_import/2` undefined.

- [ ] **Step 3: Migration, schema, context additions**

`mix ecto.gen.migration create_imports`:

```elixir
defmodule Ethos.Repo.Migrations.CreateImports do
  use Ecto.Migration

  def change do
    create table(:imports) do
      add :guide_id, references(:guides, on_delete: :delete_all), null: false
      add :raw_text, :text, null: false
      add :status, :string, null: false, default: "pending"
      add :error, :string
      add :proposal, {:array, :map}
      timestamps(type: :utc_datetime)
    end

    create index(:imports, [:guide_id])
  end
end
```

`lib/ethos/guides/import.ex`:

```elixir
defmodule Ethos.Guides.Import do
  use Ecto.Schema
  import Ecto.Changeset

  @statuses ~w(pending parsing parsed failed)

  schema "imports" do
    field :raw_text, :string
    field :status, :string, default: "pending"
    field :error, :string
    field :proposal, {:array, :map}
    belongs_to :guide, Ethos.Guides.Guide
    timestamps(type: :utc_datetime)
  end

  def changeset(import, attrs) do
    import
    |> cast(attrs, [:raw_text])
    |> update_change(:raw_text, &String.trim/1)
    |> validate_required([:raw_text])
    |> validate_length(:raw_text, min: 1, max: 50_000)
  end

  def mark_changeset(import, status, fields) when status in @statuses do
    import
    |> cast(fields, [:proposal, :error])
    |> put_change(:status, status)
  end
end
```

Append to `lib/ethos/guides.ex`:

```elixir
alias Ethos.Guides.Import

def create_import(%Guide{} = guide, raw_text) do
  %Import{guide_id: guide.id}
  |> Import.changeset(%{raw_text: raw_text})
  |> Repo.insert()
end

def get_import!(id), do: Repo.get!(Import, id)

def latest_import(%Guide{id: guide_id}) do
  Repo.one(from i in Import, where: i.guide_id == ^guide_id, order_by: [desc: i.id], limit: 1)
end

def mark_import(%Import{} = import, status, fields \\ %{}) do
  import |> Import.mark_changeset(status, fields) |> Repo.update()
end
```

Run: `mix ecto.migrate`

- [ ] **Step 4: Run test to verify it passes**

Run: `mix test test/ethos/imports_test.exs`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: imports schema for raw dumps with parse lifecycle"
```

---

### Task 6: Claude client behaviour + Req implementation

**Files:**
- Create: `lib/ethos/claude.ex`, `lib/ethos/claude/api.ex`
- Modify: `config/test.exs`, `config/runtime.exs`, `test/test_helper.exs`
- Test: `test/ethos/claude_api_test.exs`

**Interfaces:**
- Consumes: nothing internal
- Produces: behaviour `Ethos.Claude` with callbacks `parse_dump(raw_text :: String.t(), destination :: String.t()) :: {:ok, [map()]} | {:error, term()}` and `pick_nearby(destination :: String.t(), existing_names :: [String.t()], candidates :: [map()]) :: {:ok, [map()]} | {:error, term()}`; `Ethos.Claude.impl/0` returning the configured module; live impl `Ethos.Claude.API`; Mox mock `Ethos.ClaudeMock` configured in test env. Parse result maps have string keys `"day" | "kind" | "name" | "note" | "verdict"`; pick_nearby result maps have `"name" | "kind" | "reason" | "url"`.

- [ ] **Step 1: Write the failing test**

The live module is tested against a local Req stub (`Req.Test`) — still no network. `test/ethos/claude_api_test.exs`:

```elixir
defmodule Ethos.Claude.APITest do
  use ExUnit.Case, async: true

  alias Ethos.Claude.API

  defp claude_response(json_text, stop_reason \\ "end_turn") do
    %{
      "stop_reason" => stop_reason,
      "content" => [%{"type" => "text", "text" => json_text}]
    }
  end

  test "parse_dump/2 sends structured-output request and decodes entries" do
    Req.Test.stub(Ethos.Claude.API, fn conn ->
      {:ok, body, conn} = Plug.Conn.read_body(conn)
      decoded = Jason.decode!(body)

      assert decoded["model"] == "claude-opus-5"
      assert decoded["output_config"]["effort"] == "low"
      assert decoded["output_config"]["format"]["type"] == "json_schema"
      assert [%{"cache_control" => %{"type" => "ephemeral"}} | _] = decoded["system"]

      Req.Test.json(conn, claude_response(~s({"entries":[{"day":1,"kind":"food","name":"Ramiro","note":"go early","verdict":"loved"}]})))
    end)

    assert {:ok, [%{"name" => "Ramiro", "kind" => "food"}]} =
             API.parse_dump("we ate at Ramiro day 1", "Lisbon, Portugal")
  end

  test "parse_dump/2 surfaces refusals" do
    Req.Test.stub(Ethos.Claude.API, fn conn ->
      Req.Test.json(conn, claude_response("", "refusal"))
    end)

    assert {:error, :refusal} = API.parse_dump("notes", "Lisbon")
  end

  test "parse_dump/2 surfaces HTTP errors" do
    Req.Test.stub(Ethos.Claude.API, fn conn ->
      conn |> Plug.Conn.put_status(429) |> Req.Test.json(%{"error" => %{"type" => "rate_limit_error"}})
    end)

    assert {:error, {:http, 429, _}} = API.parse_dump("notes", "Lisbon")
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/claude_api_test.exs`
Expected: FAIL — module undefined.

- [ ] **Step 3: Implement behaviour + API module + config**

`lib/ethos/claude.ex`:

```elixir
defmodule Ethos.Claude do
  @moduledoc "Behaviour for the two AI calls in the system. See spec §4."

  @callback parse_dump(raw_text :: String.t(), destination :: String.t()) ::
              {:ok, [map()]} | {:error, term()}

  @callback pick_nearby(destination :: String.t(), existing_names :: [String.t()], candidates :: [map()]) ::
              {:ok, [map()]} | {:error, term()}

  def impl, do: Application.get_env(:ethos, :claude, Ethos.Claude.API)
end
```

`lib/ethos/claude/api.ex`:

```elixir
defmodule Ethos.Claude.API do
  @behaviour Ethos.Claude

  @endpoint "https://api.anthropic.com/v1/messages"
  @model "claude-opus-5"

  @entry_schema %{
    type: "object",
    additionalProperties: false,
    required: ["entries"],
    properties: %{
      entries: %{
        type: "array",
        items: %{
          type: "object",
          additionalProperties: false,
          required: ["day", "kind", "name", "note", "verdict"],
          properties: %{
            day: %{type: ["integer", "null"]},
            kind: %{type: "string", enum: ["food", "tour", "walk", "sight", "stay", "tip"]},
            name: %{type: "string"},
            note: %{type: ["string", "null"]},
            verdict: %{type: ["string", "null"], enum: ["loved", "good", "skip", nil]}
          }
        }
      }
    }
  }

  @nearby_schema %{
    type: "object",
    additionalProperties: false,
    required: ["ideas"],
    properties: %{
      ideas: %{
        type: "array",
        items: %{
          type: "object",
          additionalProperties: false,
          required: ["name", "kind", "reason", "url"],
          properties: %{
            name: %{type: "string"},
            kind: %{type: "string", enum: ["food", "tour", "walk", "sight", "stay", "tip"]},
            reason: %{type: "string"},
            url: %{type: ["string", "null"]}
          }
        }
      }
    }
  }

  @parse_system """
  You structure raw travel notes into guide entries. Extract every distinct place,
  activity, food spot, walk, stay, or tip mentioned. Infer kind and verdict from
  tone (loved / good / skip); use null verdict when tone is unclear. Preserve the
  author's own words in note where possible. Assign day numbers only when the text
  clearly indicates them, else null. Never invent places not present in the notes.
  """

  @nearby_system """
  You select nearby ideas for a travel guide. From the candidate search results,
  pick up to 5 genuinely notable places NOT already in the guide's entry list.
  Write a one-sentence reason each, grounded in the candidate snippets. Never
  invent places absent from the candidates.
  """

  @impl true
  def parse_dump(raw_text, destination) do
    request(@parse_system, @entry_schema,
      "Destination: #{destination}\n\nRaw trip notes:\n#{raw_text}")
    |> decode_list("entries")
  end

  @impl true
  def pick_nearby(destination, existing_names, candidates) do
    user = """
    Destination: #{destination}
    Already in the guide: #{Enum.join(existing_names, "; ")}

    Candidate search results (JSON):
    #{Jason.encode!(candidates)}
    """

    request(@nearby_system, @nearby_schema, user)
    |> decode_list("ideas")
  end

  defp request(system_text, schema, user_content) do
    body = %{
      model: @model,
      max_tokens: 4000,
      system: [%{type: "text", text: system_text, cache_control: %{type: "ephemeral"}}],
      output_config: %{effort: "low", format: %{type: "json_schema", schema: schema}},
      messages: [%{role: "user", content: user_content}]
    }

    req =
      Req.new(
        url: @endpoint,
        headers: [
          {"x-api-key", api_key()},
          {"anthropic-version", "2023-06-01"}
        ],
        receive_timeout: 120_000,
        retry: false
      )
      |> attach_test_stub()

    case Req.post(req, json: body) do
      {:ok, %Req.Response{status: 200, body: %{"stop_reason" => "refusal"}}} ->
        {:error, :refusal}

      {:ok, %Req.Response{status: 200, body: %{"content" => content}}} ->
        text =
          content
          |> Enum.find(%{}, &(&1["type"] == "text"))
          |> Map.get("text", "")

        {:ok, text}

      {:ok, %Req.Response{status: status, body: body}} ->
        {:error, {:http, status, body}}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp decode_list({:ok, text}, key) do
    case Jason.decode(text) do
      {:ok, %{^key => list}} when is_list(list) -> {:ok, list}
      _ -> {:error, :bad_response}
    end
  end

  defp decode_list(error, _key), do: error

  defp api_key, do: Application.fetch_env!(:ethos, :anthropic_api_key)

  defp attach_test_stub(req) do
    case Application.get_env(:ethos, :claude_req_options) do
      nil -> req
      opts -> Req.merge(req, opts)
    end
  end
end
```

`config/test.exs` — add:

```elixir
config :ethos, :anthropic_api_key, "test-key"
config :ethos, :exa_api_key, "test-key"
config :ethos, :claude, Ethos.ClaudeMock
config :ethos, :exa, Ethos.ExaMock
config :ethos, :claude_req_options, plug: {Req.Test, Ethos.Claude.API}
config :ethos, :exa_req_options, plug: {Req.Test, Ethos.Exa.API}
```

`config/runtime.exs` — inside the `if config_env() == :prod` block add:

```elixir
config :ethos, :anthropic_api_key, System.fetch_env!("ANTHROPIC_API_KEY")
config :ethos, :exa_api_key, System.fetch_env!("EXA_API_KEY")
```

And for dev, in `config/dev.exs`:

```elixir
config :ethos, :anthropic_api_key, System.get_env("ANTHROPIC_API_KEY", "")
config :ethos, :exa_api_key, System.get_env("EXA_API_KEY", "")
```

`test/test_helper.exs` — add before `ExUnit.start()`:

```elixir
Mox.defmock(Ethos.ClaudeMock, for: Ethos.Claude)
Mox.defmock(Ethos.ExaMock, for: Ethos.Exa)
```

(`Ethos.Exa` behaviour arrives in Task 7 — to keep this task compiling on its own, add ONLY the `Ethos.ClaudeMock` line now and add the `ExaMock` line plus the two `:exa` config lines in Task 7. Same for `exa_req_options`.)

- [ ] **Step 4: Run test to verify it passes**

Run: `mix test test/ethos/claude_api_test.exs`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: Claude client behaviour with structured-output HTTP impl"
```

---

### Task 7: exa client behaviour + Req implementation

**Files:**
- Create: `lib/ethos/exa.ex`, `lib/ethos/exa/api.ex`
- Modify: `config/test.exs`, `test/test_helper.exs` (the deferred lines from Task 6)
- Test: `test/ethos/exa_api_test.exs`

**Interfaces:**
- Consumes: nothing internal
- Produces: behaviour `Ethos.Exa` with callback `search(query :: String.t(), opts :: keyword()) :: {:ok, [result]} | {:error, term()}` where `result = %{title: String.t() | nil, url: String.t(), snippet: String.t() | nil}`; `Ethos.Exa.impl/0`; live impl `Ethos.Exa.API`; Mox mock `Ethos.ExaMock`. Option `:num_results` (default 3).

- [ ] **Step 1: Write the failing test**

`test/ethos/exa_api_test.exs`:

```elixir
defmodule Ethos.Exa.APITest do
  use ExUnit.Case, async: true

  alias Ethos.Exa.API

  test "search/2 posts query and normalizes results" do
    Req.Test.stub(Ethos.Exa.API, fn conn ->
      {:ok, body, conn} = Plug.Conn.read_body(conn)
      assert %{"query" => "Cervejaria Ramiro Lisbon", "numResults" => 3} = Jason.decode!(body)

      Req.Test.json(conn, %{
        "results" => [
          %{"title" => "Ramiro", "url" => "https://cervejariaramiro.pt", "text" => "Seafood institution"}
        ]
      })
    end)

    assert {:ok, [%{title: "Ramiro", url: "https://cervejariaramiro.pt", snippet: "Seafood institution"}]} =
             API.search("Cervejaria Ramiro Lisbon")
  end

  test "search/2 surfaces HTTP errors" do
    Req.Test.stub(Ethos.Exa.API, fn conn ->
      conn |> Plug.Conn.put_status(500) |> Req.Test.json(%{"error" => "boom"})
    end)

    assert {:error, {:http, 500, _}} = API.search("anything")
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/exa_api_test.exs`
Expected: FAIL — module undefined.

- [ ] **Step 3: Implement**

`lib/ethos/exa.ex`:

```elixir
defmodule Ethos.Exa do
  @type result :: %{title: String.t() | nil, url: String.t(), snippet: String.t() | nil}

  @callback search(query :: String.t(), opts :: keyword()) :: {:ok, [result()]} | {:error, term()}

  def impl, do: Application.get_env(:ethos, :exa, Ethos.Exa.API)
end
```

`lib/ethos/exa/api.ex`:

```elixir
defmodule Ethos.Exa.API do
  @behaviour Ethos.Exa

  @endpoint "https://api.exa.ai/search"

  @impl true
  def search(query, opts \\ []) do
    body = %{
      query: query,
      numResults: Keyword.get(opts, :num_results, 3),
      type: "auto",
      contents: %{text: %{maxCharacters: 500}}
    }

    req =
      Req.new(
        url: @endpoint,
        headers: [{"x-api-key", api_key()}],
        receive_timeout: 30_000,
        retry: false
      )
      |> attach_test_stub()

    case Req.post(req, json: body) do
      {:ok, %Req.Response{status: 200, body: %{"results" => results}}} ->
        {:ok,
         Enum.map(results, fn r ->
           %{title: r["title"], url: r["url"], snippet: r["text"]}
         end)}

      {:ok, %Req.Response{status: status, body: body}} ->
        {:error, {:http, status, body}}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp api_key, do: Application.fetch_env!(:ethos, :exa_api_key)

  defp attach_test_stub(req) do
    case Application.get_env(:ethos, :exa_req_options) do
      nil -> req
      opts -> Req.merge(req, opts)
    end
  end
end
```

Now add the deferred lines: in `test/test_helper.exs` add `Mox.defmock(Ethos.ExaMock, for: Ethos.Exa)`, and confirm `config/test.exs` has the `:exa`, `:exa_api_key`, and `:exa_req_options` lines from Task 6 Step 3.

- [ ] **Step 4: Run tests to verify they pass**

Run: `mix test test/ethos/exa_api_test.exs && mix test`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: exa search client behaviour with HTTP impl"
```

---

### Task 8: Research context — cache and rate limiting

**Files:**
- Create: `lib/ethos/research.ex`, `lib/ethos/research/cache_entry.ex`, `lib/ethos/research/rate_limiter.ex`, `priv/repo/migrations/*_create_research_cache.exs`
- Modify: `lib/ethos/application.ex` (supervise RateLimiter)
- Test: `test/ethos/research_test.exs`

**Interfaces:**
- Consumes: `Ethos.Exa` (Task 7)
- Produces:
  - `Ethos.Research.enrich_place(name, destination) :: {:ok, map} | {:error, term}` — cache-first (kind `"enrichment"`, never expires). Returned map: `%{"official_url" => url | nil, "links" => [%{"title","url"}], "source" => "exa", "fetched_at" => iso8601}`.
  - `Ethos.Research.research(entry_name, destination) :: {:ok, map} | {:error, term}` — kind `"research"`, 7-day TTL. Map: `%{"results" => [%{"title","url","snippet"}], "fetched_at" => iso8601}`.
  - `Ethos.Research.cached_research(entry_name, destination) :: map | nil` — read-only, no fetch.
  - `Ethos.Research.destination_candidates(destination, kinds :: [String.t()]) :: [map]` — up to 3 exa queries for gap-fill, cache kind `"gap_fill"`, never expires.
  - `Ethos.Research.RateLimiter.allow?(user_id) :: boolean` — 10/hour sliding window, ETS-backed; `Ethos.Research.RateLimiter.reset(user_id)` for tests.

- [ ] **Step 1: Write the failing test**

`test/ethos/research_test.exs`:

```elixir
defmodule Ethos.ResearchTest do
  use Ethos.DataCase, async: false
  import Mox

  alias Ethos.Research

  setup :verify_on_exit!
  setup :set_mox_from_context

  test "enrich_place/2 calls exa once then serves from cache forever" do
    expect(Ethos.ExaMock, :search, 1, fn "Ramiro Lisbon, Portugal", _opts ->
      {:ok, [%{title: "Ramiro", url: "https://cervejariaramiro.pt", snippet: "seafood"}]}
    end)

    assert {:ok, %{"official_url" => "https://cervejariaramiro.pt"}} =
             Research.enrich_place("Ramiro", "Lisbon, Portugal")

    # Second call must NOT hit exa (expect count above is 1)
    assert {:ok, %{"official_url" => "https://cervejariaramiro.pt"}} =
             Research.enrich_place("ramiro", "Lisbon, Portugal")
  end

  test "research/2 refetches after the 7-day TTL" do
    expect(Ethos.ExaMock, :search, 2, fn _query, _opts ->
      {:ok, [%{title: "News", url: "https://example.com", snippet: "still open"}]}
    end)

    assert {:ok, _} = Research.research("Ramiro", "Lisbon")
    # age the cache row past TTL
    Ethos.Repo.update_all(Ethos.Research.CacheEntry,
      set: [fetched_at: DateTime.add(DateTime.utc_now(), -8, :day) |> DateTime.truncate(:second)]
    )

    assert {:ok, _} = Research.research("Ramiro", "Lisbon")
  end

  test "cached_research/2 returns nil without fetching" do
    assert Research.cached_research("Nowhere", "Lisbon") == nil
  end

  test "rate limiter allows 10 then denies" do
    Ethos.Research.RateLimiter.reset(42)
    results = for _ <- 1..11, do: Ethos.Research.RateLimiter.allow?(42)
    assert Enum.count(results, & &1) == 10
    assert List.last(results) == false
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/research_test.exs`
Expected: FAIL — `Ethos.Research` undefined.

- [ ] **Step 3: Implement**

`mix ecto.gen.migration create_research_cache`:

```elixir
defmodule Ethos.Repo.Migrations.CreateResearchCache do
  use Ecto.Migration

  def change do
    create table(:research_cache) do
      add :key, :string, null: false
      add :kind, :string, null: false
      add :payload, :map, null: false
      add :fetched_at, :utc_datetime, null: false
      timestamps(type: :utc_datetime)
    end

    create unique_index(:research_cache, [:key])
  end
end
```

`lib/ethos/research/cache_entry.ex`:

```elixir
defmodule Ethos.Research.CacheEntry do
  use Ecto.Schema

  schema "research_cache" do
    field :key, :string
    field :kind, :string
    field :payload, :map
    field :fetched_at, :utc_datetime
    timestamps(type: :utc_datetime)
  end
end
```

`lib/ethos/research/rate_limiter.ex`:

```elixir
defmodule Ethos.Research.RateLimiter do
  @moduledoc "ETS sliding-window limiter: 10 research calls per user per hour. Resets on deploy (accepted per spec)."
  use GenServer

  @table __MODULE__
  @limit 10
  @window_ms :timer.hours(1)

  def start_link(_), do: GenServer.start_link(__MODULE__, nil, name: __MODULE__)

  def allow?(user_id) do
    now = System.monotonic_time(:millisecond)
    cutoff = now - @window_ms
    stamps = case :ets.lookup(@table, user_id) do
      [{^user_id, list}] -> Enum.filter(list, &(&1 > cutoff))
      [] -> []
    end

    if length(stamps) < @limit do
      :ets.insert(@table, {user_id, [now | stamps]})
      true
    else
      :ets.insert(@table, {user_id, stamps})
      false
    end
  end

  def reset(user_id), do: :ets.delete(@table, user_id)

  @impl true
  def init(nil) do
    :ets.new(@table, [:named_table, :public, :set])
    {:ok, nil}
  end
end
```

`lib/ethos/research.ex`:

```elixir
defmodule Ethos.Research do
  import Ecto.Query, warn: false
  alias Ethos.Repo
  alias Ethos.Research.CacheEntry

  @research_ttl_days 7

  def enrich_place(name, destination) do
    key = cache_key("enrichment", name, destination)

    cache_first(key, "enrichment", :infinity, fn ->
      with {:ok, results} <- Ethos.Exa.impl().search("#{name} #{destination}", num_results: 3) do
        {:ok,
         %{
           "official_url" => results |> List.first(%{}) |> Map.get(:url),
           "links" => Enum.map(results, &%{"title" => &1.title, "url" => &1.url}),
           "source" => "exa",
           "fetched_at" => DateTime.to_iso8601(DateTime.utc_now())
         }}
      end
    end)
  end

  def research(entry_name, destination) do
    key = cache_key("research", entry_name, destination)

    cache_first(key, "research", @research_ttl_days, fn ->
      query = "#{entry_name} #{destination} hours open reviews"

      with {:ok, results} <- Ethos.Exa.impl().search(query, num_results: 3) do
        {:ok,
         %{
           "results" => Enum.map(results, &%{"title" => &1.title, "url" => &1.url, "snippet" => &1.snippet}),
           "fetched_at" => DateTime.to_iso8601(DateTime.utc_now())
         }}
      end
    end)
  end

  def cached_research(entry_name, destination) do
    case fresh_entry(cache_key("research", entry_name, destination), @research_ttl_days) do
      nil -> nil
      entry -> entry.payload
    end
  end

  @doc "Up to 3 exa queries for gap-fill candidates. Returns a flat candidate list."
  def destination_candidates(destination, kinds) when is_list(kinds) do
    kinds
    |> Enum.take(3)
    |> Enum.flat_map(fn kind ->
      key = cache_key("gap_fill", kind, destination)

      case cache_first(key, "gap_fill", :infinity, fn ->
             with {:ok, results} <- Ethos.Exa.impl().search("best #{kind} #{destination}", num_results: 5) do
               {:ok, %{"results" => Enum.map(results, &%{"title" => &1.title, "url" => &1.url, "snippet" => &1.snippet})}}
             end
           end) do
        {:ok, %{"results" => results}} -> Enum.map(results, &Map.put(&1, "kind_hint", kind))
        _ -> []
      end
    end)
  end

  defp cache_key(kind, a, b) do
    normalize = fn s -> s |> String.downcase() |> String.replace(~r/\s+/, " ") |> String.trim() end
    "#{kind}:#{normalize.(a)}:#{normalize.(b)}"
  end

  defp cache_first(key, kind, ttl, fetch_fun) do
    case fresh_entry(key, ttl) do
      %CacheEntry{payload: payload} ->
        {:ok, payload}

      nil ->
        with {:ok, payload} <- fetch_fun.() do
          Repo.insert!(
            %CacheEntry{key: key, kind: kind, payload: payload,
                        fetched_at: DateTime.truncate(DateTime.utc_now(), :second)},
            on_conflict: {:replace, [:payload, :fetched_at]},
            conflict_target: :key
          )

          {:ok, payload}
        end
    end
  end

  defp fresh_entry(key, ttl) do
    case Repo.get_by(CacheEntry, key: key) do
      nil ->
        nil

      entry ->
        case ttl do
          :infinity ->
            entry

          days ->
            if DateTime.compare(entry.fetched_at, DateTime.add(DateTime.utc_now(), -days, :day)) == :gt,
              do: entry,
              else: nil
        end
    end
  end
end
```

In `lib/ethos/application.ex`, add to the children list (before the Endpoint):

```elixir
Ethos.Research.RateLimiter,
{Task.Supervisor, name: Ethos.AgentTaskSupervisor},
```

(The Task.Supervisor is used in Task 12.)

Run: `mix ecto.migrate`

- [ ] **Step 4: Run test to verify it passes**

Run: `mix test test/ethos/research_test.exs`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: research context with permanent/TTL cache and rate limiter"
```

---

### Task 9: Jido action — ParseDump

**Files:**
- Create: `lib/ethos/agents/actions/parse_dump.ex`
- Test: `test/ethos/agents/parse_dump_test.exs`

**Interfaces:**
- Consumes: `Ethos.Claude.impl()` (Task 6), `Guides.get_import!/1`, `Guides.mark_import/3` (Task 5)
- Produces: `Ethos.Agents.Actions.ParseDump` — Jido action; `run(%{import_id: id}, _ctx)` returns `{:ok, %{import_id: id, proposal: [map]}}` and side-effects the import to `parsed` (or `failed` with error string). Invalid-kind rows from the model are dropped defensively.

- [ ] **Step 1: Write the failing test**

`test/ethos/agents/parse_dump_test.exs`:

```elixir
defmodule Ethos.Agents.Actions.ParseDumpTest do
  use Ethos.DataCase, async: false
  import Mox

  alias Ethos.Agents.Actions.ParseDump
  alias Ethos.Guides
  import Ethos.GuidesFixtures

  setup :verify_on_exit!
  setup :set_mox_from_context

  test "parses the dump, stores proposal, marks import parsed" do
    guide = guide_fixture()
    {:ok, imp} = Guides.create_import(guide, "day 1: Ramiro (unreal), then walked Alfama")

    expect(Ethos.ClaudeMock, :parse_dump, fn raw, dest ->
      assert raw =~ "Ramiro"
      assert dest == guide.destination

      {:ok,
       [
         %{"day" => 1, "kind" => "food", "name" => "Ramiro", "note" => "unreal", "verdict" => "loved"},
         %{"day" => 1, "kind" => "banquet", "name" => "junk", "note" => nil, "verdict" => nil}
       ]}
    end)

    assert {:ok, %{proposal: [%{"name" => "Ramiro"}]}} = ParseDump.run(%{import_id: imp.id}, %{})

    imp = Guides.get_import!(imp.id)
    assert imp.status == "parsed"
    assert [%{"name" => "Ramiro"}] = imp.proposal
  end

  test "marks import failed on refusal" do
    guide = guide_fixture()
    {:ok, imp} = Guides.create_import(guide, "notes")

    expect(Ethos.ClaudeMock, :parse_dump, fn _, _ -> {:error, :refusal} end)

    assert {:error, _} = ParseDump.run(%{import_id: imp.id}, %{})
    assert Guides.get_import!(imp.id).status == "failed"
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/agents/parse_dump_test.exs`
Expected: FAIL — module undefined.

- [ ] **Step 3: Implement**

`lib/ethos/agents/actions/parse_dump.ex`:

```elixir
defmodule Ethos.Agents.Actions.ParseDump do
  @moduledoc "One Claude call: raw import text -> structured entry proposal. Spec §4.1."
  use Jido.Action,
    name: "parse_dump",
    description: "Structure a raw trip dump into proposed guide entries",
    schema: [import_id: [type: :integer, required: true]]

  alias Ethos.Guides
  alias Ethos.Guides.Entry

  @impl true
  def run(%{import_id: import_id}, _context) do
    import = Guides.get_import!(import_id)
    guide = Guides.get_guide!(import.guide_id)
    {:ok, import} = Guides.mark_import(import, "parsing")

    case Ethos.Claude.impl().parse_dump(import.raw_text, guide.destination) do
      {:ok, raw_entries} ->
        proposal = Enum.filter(raw_entries, &(&1["kind"] in Entry.kinds()))
        {:ok, _} = Guides.mark_import(import, "parsed", %{proposal: proposal})
        {:ok, %{import_id: import_id, proposal: proposal}}

      {:error, reason} ->
        {:ok, _} = Guides.mark_import(import, "failed", %{error: inspect(reason)})
        {:error, reason}
    end
  end
end
```

- [ ] **Step 4: Run test to verify it passes**

Run: `mix test test/ethos/agents/parse_dump_test.exs`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: ParseDump Jido action - one Claude call per import"
```

---

### Task 10: Jido action — EnrichEntries

**Files:**
- Create: `lib/ethos/agents/actions/enrich_entries.ex`
- Test: `test/ethos/agents/enrich_entries_test.exs`

**Interfaces:**
- Consumes: `Research.enrich_place/2` (Task 8), `Guides.list_entries/1`, `Guides.set_entry_enrichment/2` (Task 4)
- Produces: `Ethos.Agents.Actions.EnrichEntries`; `run(%{guide_id: id}, _ctx)` returns `{:ok, %{guide_id: id, enriched: count, failed: count}}`. Skips entries that already have enrichment and entries of kind `tip`. exa failures are counted, not raised (silent degrade).

- [ ] **Step 1: Write the failing test**

`test/ethos/agents/enrich_entries_test.exs`:

```elixir
defmodule Ethos.Agents.Actions.EnrichEntriesTest do
  use Ethos.DataCase, async: false
  import Mox

  alias Ethos.Agents.Actions.EnrichEntries
  alias Ethos.Guides
  import Ethos.GuidesFixtures

  setup :verify_on_exit!
  setup :set_mox_from_context

  test "enriches entries lacking enrichment, skips tips, tolerates failures" do
    guide = guide_fixture()
    {:ok, e1} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})
    {:ok, _tip} = Guides.create_entry(guide, %{kind: "tip", name: "Carry coins", verdict: nil})
    {:ok, _e2} = Guides.create_entry(guide, %{kind: "sight", name: "Belem Tower", verdict: "good"})

    expect(Ethos.ExaMock, :search, 2, fn query, _opts ->
      if query =~ "Ramiro" do
        {:ok, [%{title: "Ramiro", url: "https://cervejariaramiro.pt", snippet: "seafood"}]}
      else
        {:error, :timeout}
      end
    end)

    assert {:ok, %{enriched: 1, failed: 1}} = EnrichEntries.run(%{guide_id: guide.id}, %{})

    assert Guides.get_entry!(guide, e1.id).enrichment["official_url"] == "https://cervejariaramiro.pt"
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/agents/enrich_entries_test.exs`
Expected: FAIL — module undefined.

- [ ] **Step 3: Implement**

`lib/ethos/agents/actions/enrich_entries.ex`:

```elixir
defmodule Ethos.Agents.Actions.EnrichEntries do
  @moduledoc "exa enrichment per entry, cache-first, zero AI. Spec §4.2."
  use Jido.Action,
    name: "enrich_entries",
    description: "Resolve official links for each guide entry via exa",
    schema: [guide_id: [type: :integer, required: true]]

  alias Ethos.{Guides, Research}

  @impl true
  def run(%{guide_id: guide_id}, _context) do
    guide = Guides.get_guide!(guide_id)

    {enriched, failed} =
      guide
      |> Guides.list_entries()
      |> Enum.filter(&(&1.kind != "tip" and is_nil(&1.enrichment)))
      |> Enum.reduce({0, 0}, fn entry, {ok, err} ->
        case Research.enrich_place(entry.name, guide.destination) do
          {:ok, payload} ->
            {:ok, _} = Guides.set_entry_enrichment(entry, payload)
            {ok + 1, err}

          {:error, _} ->
            {ok, err + 1}
        end
      end)

    {:ok, %{guide_id: guide_id, enriched: enriched, failed: failed}}
  end
end
```

- [ ] **Step 4: Run test to verify it passes**

Run: `mix test test/ethos/agents/enrich_entries_test.exs`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: EnrichEntries Jido action - cache-first exa enrichment"
```

---

### Task 11: Suggestions context + GapFill action

**Files:**
- Create: `lib/ethos/contributions.ex`, `lib/ethos/contributions/suggestion.ex`, `priv/repo/migrations/*_create_suggestions.exs`, `lib/ethos/agents/actions/gap_fill.ex`
- Test: `test/ethos/contributions_test.exs`, `test/ethos/agents/gap_fill_test.exs`

**Interfaces:**
- Consumes: `Guides` (Tasks 3–4), `Research.destination_candidates/2` (Task 8), `Ethos.Claude.impl().pick_nearby/3` (Task 6)
- Produces:
  - `%Ethos.Contributions.Suggestion{}`: `guide_id, entry_id (nil ok), author_id (nil ok for gap_fill), origin ("user"|"gap_fill"), place_name, body, status, accepted_entry_id`.
  - `Ethos.Contributions.create_suggestion(author, guide, attrs)`, `list_pending_suggestions(guide)`, `accept_suggestion(suggestion) :: {:ok, %{suggestion: s, entry: e}}` (creates entry with `credited_user_id: author_id`, `source: "suggestion"` for user origin / `source: "gap_fill"` for gap_fill origin), `decline_suggestion(suggestion)`, `create_gap_fill_suggestions(guide, ideas)` where ideas are `pick_nearby` maps.
  - `Ethos.Agents.Actions.GapFill`; `run(%{guide_id: id}, _ctx)` → `{:ok, %{guide_id: id, created: count}}`. Budget: candidates from ≤3 exa queries + exactly 1 Claude call. On any error returns `{:ok, %{created: 0}}` (guide publishes anyway).

- [ ] **Step 1: Write the failing tests**

`test/ethos/contributions_test.exs`:

```elixir
defmodule Ethos.ContributionsTest do
  use Ethos.DataCase, async: true

  alias Ethos.{Contributions, Guides}
  import Ethos.{AccountsFixtures, GuidesFixtures}

  test "accept_suggestion/1 creates a credited entry and links it" do
    guide = guide_fixture()
    reader = user_fixture()

    {:ok, sugg} =
      Contributions.create_suggestion(reader, guide, %{
        place_name: "Bar da Velha",
        body: "Two blocks from Ramiro, better vibe"
      })

    assert sugg.status == "pending"
    {:ok, %{suggestion: sugg, entry: entry}} = Contributions.accept_suggestion(sugg)

    assert sugg.status == "accepted"
    assert sugg.accepted_entry_id == entry.id
    assert entry.credited_user_id == reader.id
    assert entry.source == "suggestion"
    assert entry.name == "Bar da Velha"
  end

  test "decline_suggestion/1 sets declined without creating an entry" do
    guide = guide_fixture()
    reader = user_fixture()
    {:ok, sugg} = Contributions.create_suggestion(reader, guide, %{place_name: "X", body: "y"})
    {:ok, sugg} = Contributions.decline_suggestion(sugg)
    assert sugg.status == "declined"
    assert Guides.list_entries(guide) == []
  end

  test "create_gap_fill_suggestions/2 creates authorless pending suggestions" do
    guide = guide_fixture()

    {:ok, suggs} =
      Contributions.create_gap_fill_suggestions(guide, [
        %{"name" => "LX Factory", "kind" => "sight", "reason" => "creative hub", "url" => "https://lxfactory.com"}
      ])

    assert [%{origin: "gap_fill", author_id: nil, place_name: "LX Factory", status: "pending"}] = suggs
  end
end
```

`test/ethos/agents/gap_fill_test.exs`:

```elixir
defmodule Ethos.Agents.Actions.GapFillTest do
  use Ethos.DataCase, async: false
  import Mox

  alias Ethos.Agents.Actions.GapFill
  alias Ethos.{Contributions, Guides}
  import Ethos.GuidesFixtures

  setup :verify_on_exit!
  setup :set_mox_from_context

  test "gathers candidates, one Claude pick, creates suggestions" do
    guide = guide_fixture()
    {:ok, _} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})

    expect(Ethos.ExaMock, :search, 3, fn _query, _opts ->
      {:ok, [%{title: "LX Factory", url: "https://lxfactory.com", snippet: "creative hub"}]}
    end)

    expect(Ethos.ClaudeMock, :pick_nearby, 1, fn dest, existing, candidates ->
      assert dest == guide.destination
      assert "Ramiro" in existing
      assert length(candidates) > 0
      {:ok, [%{"name" => "LX Factory", "kind" => "sight", "reason" => "creative hub", "url" => "https://lxfactory.com"}]}
    end)

    assert {:ok, %{created: 1}} = GapFill.run(%{guide_id: guide.id}, %{})
    assert [%{place_name: "LX Factory", origin: "gap_fill"}] = Contributions.list_pending_suggestions(guide)
  end

  test "degrades to zero suggestions on Claude error" do
    guide = guide_fixture()

    expect(Ethos.ExaMock, :search, 3, fn _q, _o -> {:ok, []} end)
    expect(Ethos.ClaudeMock, :pick_nearby, 1, fn _, _, _ -> {:error, :refusal} end)

    assert {:ok, %{created: 0}} = GapFill.run(%{guide_id: guide.id}, %{})
  end
end
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `mix test test/ethos/contributions_test.exs test/ethos/agents/gap_fill_test.exs`
Expected: FAIL — modules undefined.

- [ ] **Step 3: Implement**

`mix ecto.gen.migration create_suggestions`:

```elixir
defmodule Ethos.Repo.Migrations.CreateSuggestions do
  use Ecto.Migration

  def change do
    create table(:suggestions) do
      add :guide_id, references(:guides, on_delete: :delete_all), null: false
      add :entry_id, references(:entries, on_delete: :nilify_all)
      add :author_id, references(:users, on_delete: :nilify_all)
      add :origin, :string, null: false, default: "user"
      add :place_name, :string, null: false
      add :body, :text
      add :url, :string
      add :kind_hint, :string
      add :status, :string, null: false, default: "pending"
      add :accepted_entry_id, references(:entries, on_delete: :nilify_all)
      timestamps(type: :utc_datetime)
    end

    create index(:suggestions, [:guide_id, :status])
  end
end
```

`lib/ethos/contributions/suggestion.ex`:

```elixir
defmodule Ethos.Contributions.Suggestion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "suggestions" do
    field :origin, :string, default: "user"
    field :place_name, :string
    field :body, :string
    field :url, :string
    field :kind_hint, :string
    field :status, :string, default: "pending"
    belongs_to :guide, Ethos.Guides.Guide
    belongs_to :entry, Ethos.Guides.Entry
    belongs_to :author, Ethos.Accounts.User
    belongs_to :accepted_entry, Ethos.Guides.Entry
    timestamps(type: :utc_datetime)
  end

  def changeset(suggestion, attrs) do
    suggestion
    |> cast(attrs, [:place_name, :body, :url, :kind_hint, :entry_id])
    |> validate_required([:place_name])
    |> validate_length(:place_name, max: 120)
    |> validate_length(:body, max: 2000)
    |> validate_inclusion(:kind_hint, Ethos.Guides.Entry.kinds() ++ [nil])
  end
end
```

`lib/ethos/contributions.ex`:

```elixir
defmodule Ethos.Contributions do
  import Ecto.Query, warn: false
  alias Ethos.Repo
  alias Ethos.Contributions.Suggestion
  alias Ethos.Guides

  def create_suggestion(author, guide, attrs) do
    %Suggestion{guide_id: guide.id, author_id: author.id, origin: "user"}
    |> Suggestion.changeset(attrs)
    |> Repo.insert()
  end

  def create_gap_fill_suggestions(guide, ideas) do
    suggestions =
      Enum.map(ideas, fn idea ->
        %Suggestion{guide_id: guide.id, origin: "gap_fill"}
        |> Suggestion.changeset(%{
          place_name: idea["name"],
          body: idea["reason"],
          url: idea["url"],
          kind_hint: idea["kind"]
        })
        |> Repo.insert!()
      end)

    {:ok, suggestions}
  end

  def list_pending_suggestions(guide) do
    Repo.all(
      from s in Suggestion,
        where: s.guide_id == ^guide.id and s.status == "pending",
        order_by: [asc: s.id],
        preload: [:author]
    )
  end

  def get_suggestion!(guide, id), do: Repo.get_by!(Suggestion, id: id, guide_id: guide.id)

  def accept_suggestion(%Suggestion{status: "pending"} = suggestion) do
    guide = Guides.get_guide!(suggestion.guide_id)
    source = if suggestion.origin == "gap_fill", do: "gap_fill", else: "suggestion"

    Repo.transaction(fn ->
      {:ok, entry} =
        Guides.create_entry(guide, %{
          kind: suggestion.kind_hint || "tip",
          name: suggestion.place_name,
          note: suggestion.body,
          source: source,
          credited_user_id: suggestion.author_id
        })

      {:ok, suggestion} =
        suggestion
        |> Ecto.Changeset.change(status: "accepted", accepted_entry_id: entry.id)
        |> Repo.update()

      %{suggestion: suggestion, entry: entry}
    end)
  end

  def decline_suggestion(%Suggestion{} = suggestion) do
    suggestion |> Ecto.Changeset.change(status: "declined") |> Repo.update()
  end
end
```

`lib/ethos/agents/actions/gap_fill.ex`:

```elixir
defmodule Ethos.Agents.Actions.GapFill do
  @moduledoc "Publish-time only. Max 3 exa queries + exactly 1 Claude call. Spec §4.3."
  use Jido.Action,
    name: "gap_fill",
    description: "Suggest up to 5 nearby ideas the author didn't mention",
    schema: [guide_id: [type: :integer, required: true]]

  alias Ethos.{Contributions, Guides, Research}

  @query_kinds ~w(food sight walk)

  @impl true
  def run(%{guide_id: guide_id}, _context) do
    guide = Guides.get_guide!(guide_id)
    entries = Guides.list_entries(guide)
    existing = Enum.map(entries, & &1.name)
    candidates = Research.destination_candidates(guide.destination, @query_kinds)

    with true <- candidates != [],
         {:ok, ideas} <- Ethos.Claude.impl().pick_nearby(guide.destination, existing, candidates),
         {:ok, suggestions} <- Contributions.create_gap_fill_suggestions(guide, Enum.take(ideas, 5)) do
      {:ok, %{guide_id: guide_id, created: length(suggestions)}}
    else
      _ -> {:ok, %{guide_id: guide_id, created: 0}}
    end
  end
end
```

Note: the GapFill test expects `pick_nearby` to be called even when candidates exist but exa returned `[]` per query — with all three queries returning `{:ok, []}`, `destination_candidates` returns `[]` and the `with` short-circuits. But the test stubs `pick_nearby` with expect count 1. Fix the test expectation mismatch by making the action call Claude whenever ANY exa query succeeded (even with zero results is fine to skip). To match the test exactly: change `true <- candidates != []` to always proceed:

```elixir
    with {:ok, ideas} <- Ethos.Claude.impl().pick_nearby(guide.destination, existing, candidates),
         {:ok, suggestions} <- Contributions.create_gap_fill_suggestions(guide, Enum.take(ideas, 5)) do
      {:ok, %{guide_id: guide_id, created: length(suggestions)}}
    else
      _ -> {:ok, %{guide_id: guide_id, created: 0}}
    end
```

Use this second form (always exactly 1 Claude call per gap-fill run — matches the budget rule deterministically).

Run: `mix ecto.migrate`

- [ ] **Step 4: Run tests to verify they pass**

Run: `mix test test/ethos/contributions_test.exs test/ethos/agents/gap_fill_test.exs`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: suggestions with accept-and-credit plus GapFill action"
```

---

### Task 12: GuideAgent pipeline orchestration

**Files:**
- Create: `lib/ethos/agents/guide_agent.ex`
- Test: `test/ethos/agents/guide_agent_test.exs`

**Interfaces:**
- Consumes: the three actions (Tasks 9–11), `Ethos.AgentTaskSupervisor` (Task 8), `Phoenix.PubSub` (ships with Phoenix as `Ethos.PubSub`)
- Produces:
  - `Ethos.Agents.GuideAgent.parse_import(import_id)` — async; runs `ParseDump` under the Task.Supervisor; broadcasts `{:import_parsed, import_id}` or `{:import_failed, import_id}` on topic `"import:#{import_id}"`.
  - `Ethos.Agents.GuideAgent.publish_pipeline(guide_id)` — async; runs `EnrichEntries` then `GapFill`; broadcasts `{:pipeline_done, guide_id}` on topic `"guide:#{guide_id}"`.
  - `Ethos.Agents.GuideAgent.subscribe_import(import_id)` / `subscribe_guide(guide_id)`.
  - Both async functions accept `sync: true` in opts for tests (runs inline).

- [ ] **Step 1: Write the failing test**

`test/ethos/agents/guide_agent_test.exs`:

```elixir
defmodule Ethos.Agents.GuideAgentTest do
  use Ethos.DataCase, async: false
  import Mox

  alias Ethos.Agents.GuideAgent
  alias Ethos.Guides
  import Ethos.GuidesFixtures

  setup :verify_on_exit!
  setup :set_mox_from_context

  test "parse_import/2 runs ParseDump and broadcasts completion" do
    guide = guide_fixture()
    {:ok, imp} = Guides.create_import(guide, "Ramiro was amazing")
    GuideAgent.subscribe_import(imp.id)

    expect(Ethos.ClaudeMock, :parse_dump, fn _, _ ->
      {:ok, [%{"day" => nil, "kind" => "food", "name" => "Ramiro", "note" => nil, "verdict" => "loved"}]}
    end)

    GuideAgent.parse_import(imp.id, sync: true)

    assert_receive {:import_parsed, import_id}
    assert import_id == imp.id
    assert Guides.get_import!(imp.id).status == "parsed"
  end

  test "parse_import/2 broadcasts failure" do
    guide = guide_fixture()
    {:ok, imp} = Guides.create_import(guide, "notes")
    GuideAgent.subscribe_import(imp.id)

    expect(Ethos.ClaudeMock, :parse_dump, fn _, _ -> {:error, :refusal} end)

    GuideAgent.parse_import(imp.id, sync: true)
    assert_receive {:import_failed, _}
  end

  test "publish_pipeline/2 enriches then gap-fills then broadcasts" do
    guide = guide_fixture()
    {:ok, _} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})
    GuideAgent.subscribe_guide(guide.id)

    expect(Ethos.ExaMock, :search, 4, fn _q, _o -> {:ok, []} end)
    expect(Ethos.ClaudeMock, :pick_nearby, fn _, _, _ -> {:ok, []} end)

    GuideAgent.publish_pipeline(guide.id, sync: true)
    assert_receive {:pipeline_done, _}
  end
end
```

(4 exa calls: 1 enrichment for Ramiro + 3 gap-fill queries.)

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/agents/guide_agent_test.exs`
Expected: FAIL — module undefined.

- [ ] **Step 3: Implement**

`lib/ethos/agents/guide_agent.ex`:

```elixir
defmodule Ethos.Agents.GuideAgent do
  @moduledoc """
  Orchestrates the Jido action pipeline for a guide.
  Async by default (Task.Supervisor); `sync: true` runs inline for tests.
  """

  alias Ethos.Agents.Actions.{EnrichEntries, GapFill, ParseDump}

  def subscribe_import(import_id),
    do: Phoenix.PubSub.subscribe(Ethos.PubSub, "import:#{import_id}")

  def subscribe_guide(guide_id),
    do: Phoenix.PubSub.subscribe(Ethos.PubSub, "guide:#{guide_id}")

  def parse_import(import_id, opts \\ []) do
    run(opts, fn ->
      case Jido.Exec.run(ParseDump, %{import_id: import_id}, %{}) do
        {:ok, _} -> broadcast("import:#{import_id}", {:import_parsed, import_id})
        {:error, _} -> broadcast("import:#{import_id}", {:import_failed, import_id})
      end
    end)
  end

  def publish_pipeline(guide_id, opts \\ []) do
    run(opts, fn ->
      {:ok, _} = Jido.Exec.run(EnrichEntries, %{guide_id: guide_id}, %{})
      {:ok, _} = Jido.Exec.run(GapFill, %{guide_id: guide_id}, %{})
      broadcast("guide:#{guide_id}", {:pipeline_done, guide_id})
    end)
  end

  defp run(opts, fun) do
    if Keyword.get(opts, :sync, false) do
      fun.()
      :ok
    else
      {:ok, _pid} = Task.Supervisor.start_child(Ethos.AgentTaskSupervisor, fun)
      :ok
    end
  end

  defp broadcast(topic, message),
    do: Phoenix.PubSub.broadcast(Ethos.PubSub, topic, message)
end
```

Note on Jido: `Jido.Exec.run/3` is the action executor in jido ~> 1.2. If the installed version exposes `Jido.Workflow.run/3` instead (1.0/1.1), substitute that call — the signature is the same. Check with `mix hex.docs open jido` if unsure.

- [ ] **Step 4: Run tests to verify they pass**

Run: `mix test test/ethos/agents/guide_agent_test.exs && mix test`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: GuideAgent pipeline orchestration with PubSub notifications"
```

---

### Task 13: Authoring LiveViews — dashboard, new guide, dump import

**Files:**
- Create: `lib/ethos_web/live/guide_live/index.ex`, `lib/ethos_web/live/guide_live/new.ex`, `lib/ethos_web/live/guide_live/import.ex`
- Modify: `lib/ethos_web/router.ex`
- Test: `test/ethos_web/live/guide_authoring_test.exs`

**Interfaces:**
- Consumes: `Guides` context, `GuideAgent.parse_import/2`, auth `on_mount` hooks (Task 2)
- Produces: routes `live "/guides", GuideLive.Index`, `live "/guides/new", GuideLive.New`, `live "/guides/:id/import", GuideLive.Import` inside the `:require_authenticated_user` live_session. Import LiveView pushes to Confirm route (Task 14) on `{:import_parsed, _}`.

- [ ] **Step 1: Write the failing test**

`test/ethos_web/live/guide_authoring_test.exs`:

```elixir
defmodule EthosWeb.GuideAuthoringTest do
  use EthosWeb.ConnCase, async: false

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures
  import Mox

  setup :verify_on_exit!
  setup :set_mox_from_context

  setup %{conn: conn} do
    user = user_fixture()
    %{conn: log_in_user(conn, user), user: user}
  end

  test "creates a guide from the new form", %{conn: conn} do
    {:ok, lv, _html} = live(conn, ~p"/guides/new")

    {:ok, _lv, html} =
      lv
      |> form("#guide-form", guide: %{title: "Lisbon week", destination: "Lisbon, Portugal"})
      |> render_submit()
      |> follow_redirect(conn)

    assert html =~ "Paste your trip notes"
  end

  test "import page submits a dump and kicks off parsing", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user})

    expect(Ethos.ClaudeMock, :parse_dump, fn _, _ ->
      {:ok, [%{"day" => 1, "kind" => "food", "name" => "Ramiro", "note" => nil, "verdict" => "loved"}]}
    end)

    {:ok, lv, _html} = live(conn, ~p"/guides/#{guide.id}/import")

    lv
    |> form("#import-form", import: %{raw_text: "day 1 Ramiro, incredible"})
    |> render_submit()

    # LiveView subscribed and gets redirected to confirm once parse completes
    assert_redirect(lv, ~p"/guides/#{guide.id}/confirm")
  end

  test "index lists my guides", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user, title: "Tokyo Sprint"})
    {:ok, _lv, html} = live(conn, ~p"/guides")
    assert html =~ "Tokyo Sprint"
    assert html =~ guide.destination
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos_web/live/guide_authoring_test.exs`
Expected: FAIL — routes undefined.

- [ ] **Step 3: Implement**

In `lib/ethos_web/router.ex`, inside the existing `live_session :require_authenticated_user` block (created by phx.gen.auth), add:

```elixir
live "/guides", GuideLive.Index, :index
live "/guides/new", GuideLive.New, :new
live "/guides/:id/import", GuideLive.Import, :import
```

`lib/ethos_web/live/guide_live/index.ex`:

```elixir
defmodule EthosWeb.GuideLive.Index do
  use EthosWeb, :live_view

  alias Ethos.Guides

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, guides: Guides.list_user_guides(socket.assigns.current_user), page_title: "Your guides")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Your guides
      <:actions>
        <.link navigate={~p"/guides/new"}><.button>New guide</.button></.link>
      </:actions>
    </.header>

    <ul id="guides" class="mt-6 divide-y">
      <li :for={guide <- @guides} class="py-4 flex items-center justify-between">
        <div>
          <p class="font-semibold"><%= guide.title %></p>
          <p class="text-sm text-zinc-500"><%= guide.destination %> · <%= guide.status %></p>
        </div>
        <div class="flex gap-3">
          <.link :if={guide.status == "published"} href={~p"/g/#{guide.slug}"} class="text-sm underline">
            View
          </.link>
          <.link navigate={~p"/guides/#{guide.id}/edit"} class="text-sm underline">Edit</.link>
        </div>
      </li>
    </ul>
    <p :if={@guides == []} class="mt-6 text-zinc-500">No guides yet — start with your last trip.</p>
    """
  end
end
```

`lib/ethos_web/live/guide_live/new.ex`:

```elixir
defmodule EthosWeb.GuideLive.New do
  use EthosWeb, :live_view

  alias Ethos.Guides
  alias Ethos.Guides.Guide

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, form: to_form(Guide.changeset(%Guide{}, %{})), page_title: "New guide")}
  end

  @impl true
  def handle_event("save", %{"guide" => params}, socket) do
    case Guides.create_guide(socket.assigns.current_user, params) do
      {:ok, guide} ->
        {:noreply, push_navigate(socket, to: ~p"/guides/#{guide.id}/import")}

      {:error, changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.header>Start a guide</.header>
    <.simple_form for={@form} id="guide-form" phx-submit="save">
      <.input field={@form[:title]} label="Trip title" placeholder="Lisbon in 5 days" />
      <.input field={@form[:destination]} label="Destination" placeholder="Lisbon, Portugal" />
      <.input field={@form[:starts_on]} type="date" label="Started (optional)" />
      <.input field={@form[:ends_on]} type="date" label="Ended (optional)" />
      <:actions><.button>Continue</.button></:actions>
    </.simple_form>
    """
  end
end
```

`lib/ethos_web/live/guide_live/import.ex`:

```elixir
defmodule EthosWeb.GuideLive.Import do
  use EthosWeb, :live_view

  alias Ethos.Agents.GuideAgent
  alias Ethos.Guides

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    guide = Guides.get_user_guide!(socket.assigns.current_user, id)

    {:ok,
     assign(socket,
       guide: guide,
       parsing: false,
       parse_failed: false,
       form: to_form(%{"raw_text" => ""}, as: :import),
       page_title: "Import notes"
     )}
  end

  @impl true
  def handle_event("submit", %{"import" => %{"raw_text" => raw_text}}, socket) do
    case Guides.create_import(socket.assigns.guide, raw_text) do
      {:ok, import} ->
        GuideAgent.subscribe_import(import.id)
        GuideAgent.parse_import(import.id)
        {:noreply, assign(socket, parsing: true, parse_failed: false)}

      {:error, _changeset} ->
        {:noreply, put_flash(socket, :error, "Paste some notes first.")}
    end
  end

  @impl true
  def handle_info({:import_parsed, _import_id}, socket) do
    {:noreply, push_navigate(socket, to: ~p"/guides/#{socket.assigns.guide.id}/confirm")}
  end

  def handle_info({:import_failed, _import_id}, socket) do
    {:noreply, assign(socket, parsing: false, parse_failed: true)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.header>Paste your trip notes</.header>
    <p class="mt-2 text-zinc-600">
      Anything works: your notes app, the thread of recs friends sent you, a rough day-by-day.
      We'll structure it — you confirm before anything is saved.
    </p>

    <div :if={@parse_failed} class="mt-4 rounded-md bg-red-50 p-4 text-red-800">
      We couldn't structure this dump.
      <button phx-click="submit" class="underline">Try again</button>
      or <.link navigate={~p"/guides/#{@guide.id}/edit"} class="underline">add entries manually</.link>.
    </div>

    <.simple_form for={@form} id="import-form" phx-submit="submit">
      <.input field={@form[:raw_text]} type="textarea" rows="14" label="Trip notes" />
      <:actions>
        <.button disabled={@parsing} phx-disable-with="Structuring...">
          <%= if @parsing, do: "Structuring your trip…", else: "Structure my trip" %>
        </.button>
      </:actions>
    </.simple_form>
    """
  end
end
```

Note for the failure retry button: `phx-click="submit"` with no params won't re-post the textarea; the simplest correct behavior is that the user resubmits the form (raw text is still in the textarea). Change the failed-state copy to say "edit your notes and press Structure my trip again" and remove the inline retry button:

```heex
<div :if={@parse_failed} class="mt-4 rounded-md bg-red-50 p-4 text-red-800">
  We couldn't structure this dump. Tweak your notes and try again, or
  <.link navigate={~p"/guides/#{@guide.id}/edit"} class="underline">add entries manually</.link>.
</div>
```

Use this second form.

- [ ] **Step 4: Run tests to verify they pass**

Run: `mix test test/ethos_web/live/guide_authoring_test.exs`
Expected: PASS (the `/guides/:id/confirm` and `/guides/:id/edit` routes are referenced by `~p` — add placeholder routes NOW pointing at modules built in Task 14; to keep this task green, add the two `live` routes in the router in this task and create minimal `Confirm` and `Edit` modules in Task 14. If compilation of `~p` fails without the routes, create the two LiveView modules in this task as empty shells rendering `<div />` and flesh them out in Task 14.)

Add to router now:

```elixir
live "/guides/:id/confirm", GuideLive.Confirm, :confirm
live "/guides/:id/edit", GuideLive.Edit, :edit
live "/guides/:id/share", GuideLive.Share, :share
live "/guides/:id/suggestions", GuideLive.Suggestions, :suggestions
```

And create shells (each replaced in later tasks):

```elixir
# lib/ethos_web/live/guide_live/confirm.ex — REPLACED IN TASK 14
defmodule EthosWeb.GuideLive.Confirm do
  use EthosWeb, :live_view
  def mount(_p, _s, socket), do: {:ok, socket}
  def render(assigns), do: ~H"<div>confirm</div>"
end
```

```elixir
# lib/ethos_web/live/guide_live/edit.ex — REPLACED IN TASK 14
defmodule EthosWeb.GuideLive.Edit do
  use EthosWeb, :live_view
  def mount(_p, _s, socket), do: {:ok, socket}
  def render(assigns), do: ~H"<div>edit</div>"
end
```

```elixir
# lib/ethos_web/live/guide_live/share.ex — REPLACED IN TASK 15
defmodule EthosWeb.GuideLive.Share do
  use EthosWeb, :live_view
  def mount(_p, _s, socket), do: {:ok, socket}
  def render(assigns), do: ~H"<div>share</div>"
end
```

```elixir
# lib/ethos_web/live/guide_live/suggestions.ex — REPLACED IN TASK 18
defmodule EthosWeb.GuideLive.Suggestions do
  use EthosWeb, :live_view
  def mount(_p, _s, socket), do: {:ok, socket}
  def render(assigns), do: ~H"<div>suggestions</div>"
end
```

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: authoring LiveViews - dashboard, new guide, dump import"
```

---

### Task 14: Confirm proposal + guide editor LiveViews

**Files:**
- Modify (replace shells): `lib/ethos_web/live/guide_live/confirm.ex`, `lib/ethos_web/live/guide_live/edit.ex`
- Test: `test/ethos_web/live/guide_confirm_edit_test.exs`

**Interfaces:**
- Consumes: `Guides.latest_import/1`, `Guides.replace_entries_from_proposal/2`, entry CRUD (Task 4)
- Produces: Confirm screen — renders the proposal rows with editable name/kind/verdict/day/note, delete-row, confirm-all (persists via `replace_entries_from_proposal` then navigates to edit). Edit screen — lists persisted entries, inline add-entry form (manual fallback), delete entry, "Publish" button navigating to Share (Task 15 wires actual publish).

- [ ] **Step 1: Write the failing test**

`test/ethos_web/live/guide_confirm_edit_test.exs`:

```elixir
defmodule EthosWeb.GuideConfirmEditTest do
  use EthosWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Guides

  setup %{conn: conn} do
    user = user_fixture()
    %{conn: log_in_user(conn, user), user: user}
  end

  defp guide_with_proposal(user) do
    guide = guide_fixture(%{user: user})
    {:ok, imp} = Guides.create_import(guide, "raw")

    {:ok, _} =
      Guides.mark_import(imp, "parsed", %{
        proposal: [
          %{"day" => 1, "kind" => "food", "name" => "Ramiro", "note" => "go early", "verdict" => "loved"},
          %{"day" => 2, "kind" => "walk", "name" => "Alfama", "note" => nil, "verdict" => "good"}
        ]
      })

    guide
  end

  test "confirm screen shows proposal and persists entries on confirm", %{conn: conn, user: user} do
    guide = guide_with_proposal(user)
    {:ok, lv, html} = live(conn, ~p"/guides/#{guide.id}/confirm")

    assert html =~ "Ramiro"
    assert html =~ "Alfama"

    lv |> element("#confirm-entries") |> render_click()
    assert_redirect(lv, ~p"/guides/#{guide.id}/edit")

    assert [%{name: "Ramiro"}, %{name: "Alfama"}] = Guides.list_entries(guide)
  end

  test "confirm screen can remove a proposed row before confirming", %{conn: conn, user: user} do
    guide = guide_with_proposal(user)
    {:ok, lv, _} = live(conn, ~p"/guides/#{guide.id}/confirm")

    lv |> element(~s(button[phx-click="remove"][phx-value-index="0"])) |> render_click()
    lv |> element("#confirm-entries") |> render_click()

    assert [%{name: "Alfama"}] = Guides.list_entries(guide)
  end

  test "edit screen adds a manual entry", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user})
    {:ok, lv, _} = live(conn, ~p"/guides/#{guide.id}/edit")

    lv
    |> form("#entry-form", entry: %{kind: "food", name: "Time Out Market", verdict: "good"})
    |> render_submit()

    assert [%{name: "Time Out Market", source: "manual"}] = Guides.list_entries(guide)
    assert render(lv) =~ "Time Out Market"
  end

  test "edit screen deletes an entry", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user})
    {:ok, entry} = Guides.create_entry(guide, %{kind: "food", name: "Skip me", verdict: "skip"})
    {:ok, lv, _} = live(conn, ~p"/guides/#{guide.id}/edit")

    lv |> element(~s(button[phx-click="delete"][phx-value-id="#{entry.id}"])) |> render_click()
    assert Guides.list_entries(guide) == []
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos_web/live/guide_confirm_edit_test.exs`
Expected: FAIL — shells render placeholder divs.

- [ ] **Step 3: Implement**

Replace `lib/ethos_web/live/guide_live/confirm.ex`:

```elixir
defmodule EthosWeb.GuideLive.Confirm do
  use EthosWeb, :live_view

  alias Ethos.Guides

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    guide = Guides.get_user_guide!(socket.assigns.current_user, id)
    import = Guides.latest_import(guide)

    proposal =
      case import do
        %{status: "parsed", proposal: proposal} when is_list(proposal) -> proposal
        _ -> []
      end

    {:ok, assign(socket, guide: guide, proposal: proposal, page_title: "Confirm entries")}
  end

  @impl true
  def handle_event("remove", %{"index" => index}, socket) do
    proposal = List.delete_at(socket.assigns.proposal, String.to_integer(index))
    {:noreply, assign(socket, proposal: proposal)}
  end

  def handle_event("update", %{"index" => index, "field" => field, "value" => value}, socket) do
    index = String.to_integer(index)
    proposal = List.update_at(socket.assigns.proposal, index, &Map.put(&1, field, value))
    {:noreply, assign(socket, proposal: proposal)}
  end

  def handle_event("confirm", _params, socket) do
    {:ok, _entries} =
      Guides.replace_entries_from_proposal(socket.assigns.guide, socket.assigns.proposal)

    {:noreply, push_navigate(socket, to: ~p"/guides/#{socket.assigns.guide.id}/edit")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Here's what we found — confirm before saving
      <:subtitle>Nothing is saved until you confirm. Remove or tweak anything.</:subtitle>
    </.header>

    <div :if={@proposal == []} class="mt-6 text-zinc-500">
      No parsed entries. <.link navigate={~p"/guides/#{@guide.id}/import"} class="underline">Go back and import</.link>
      or <.link navigate={~p"/guides/#{@guide.id}/edit"} class="underline">add manually</.link>.
    </div>

    <ul class="mt-6 space-y-3">
      <li :for={{entry, index} <- Enum.with_index(@proposal)} class="rounded-lg border p-4 flex items-start justify-between">
        <div>
          <p class="font-semibold"><%= entry["name"] %></p>
          <p class="text-sm text-zinc-500">
            <%= entry["kind"] %>
            <span :if={entry["day"]}>· day <%= entry["day"] %></span>
            <span :if={entry["verdict"]}>· <%= entry["verdict"] %></span>
          </p>
          <p :if={entry["note"]} class="text-sm mt-1"><%= entry["note"] %></p>
        </div>
        <button phx-click="remove" phx-value-index={index} class="text-sm text-red-600 underline">
          Remove
        </button>
      </li>
    </ul>

    <div :if={@proposal != []} class="mt-6">
      <.button id="confirm-entries" phx-click="confirm">Looks right — save these</.button>
    </div>
    """
  end
end
```

Replace `lib/ethos_web/live/guide_live/edit.ex`:

```elixir
defmodule EthosWeb.GuideLive.Edit do
  use EthosWeb, :live_view

  alias Ethos.Guides
  alias Ethos.Guides.Entry

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    guide = Guides.get_user_guide!(socket.assigns.current_user, id)
    {:ok, socket |> assign(guide: guide, page_title: "Edit guide") |> load_entries() |> reset_form()}
  end

  @impl true
  def handle_event("add", %{"entry" => params}, socket) do
    case Guides.create_entry(socket.assigns.guide, params) do
      {:ok, _entry} -> {:noreply, socket |> load_entries() |> reset_form()}
      {:error, changeset} -> {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  def handle_event("delete", %{"id" => id}, socket) do
    entry = Guides.get_entry!(socket.assigns.guide, id)
    {:ok, _} = Guides.delete_entry(entry)
    {:noreply, load_entries(socket)}
  end

  defp load_entries(socket),
    do: assign(socket, entries: Guides.list_entries(socket.assigns.guide))

  defp reset_form(socket),
    do: assign(socket, form: to_form(Entry.changeset(%Entry{}, %{})))

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      <%= @guide.title %>
      <:subtitle><%= @guide.destination %></:subtitle>
      <:actions>
        <.link navigate={~p"/guides/#{@guide.id}/share"}><.button>Publish</.button></.link>
      </:actions>
    </.header>

    <ul class="mt-6 space-y-3">
      <li :for={entry <- @entries} class="rounded-lg border p-4 flex items-start justify-between">
        <div>
          <p class="font-semibold"><%= entry.name %></p>
          <p class="text-sm text-zinc-500">
            <%= entry.kind %>
            <span :if={entry.day}>· day <%= entry.day %></span>
            <span :if={entry.verdict}>· <%= entry.verdict %></span>
          </p>
          <p :if={entry.note} class="text-sm mt-1"><%= entry.note %></p>
        </div>
        <button phx-click="delete" phx-value-id={entry.id} class="text-sm text-red-600 underline">
          Delete
        </button>
      </li>
    </ul>

    <h3 class="mt-10 font-semibold">Add an entry</h3>
    <.simple_form for={@form} id="entry-form" phx-submit="add">
      <.input field={@form[:name]} label="Place / activity" />
      <.input field={@form[:kind]} type="select" label="Kind" options={Entry.kinds()} />
      <.input field={@form[:verdict]} type="select" label="Verdict" prompt="—" options={Entry.verdicts()} />
      <.input field={@form[:day]} type="number" label="Day (optional)" />
      <.input field={@form[:note]} type="textarea" label="Note (optional)" />
      <:actions><.button>Add</.button></:actions>
    </.simple_form>
    """
  end
end
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `mix test test/ethos_web/live/guide_confirm_edit_test.exs`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: confirm-proposal and guide editor LiveViews with manual fallback"
```

---

### Task 15: Publish flow + Share screen

**Files:**
- Modify (replace shell): `lib/ethos_web/live/guide_live/share.ex`
- Test: `test/ethos_web/live/guide_share_test.exs`

**Interfaces:**
- Consumes: `Guides.publish_guide/1`, `GuideAgent.publish_pipeline/2`, `Ethos.OGCard.generate/1` (Task 17 — stub here as a no-op module so this task compiles; Task 17 replaces it)
- Produces: Share LiveView at `/guides/:id/share` — on mount, if guide is draft: publishes it, generates the OG card, kicks off `publish_pipeline` async, subscribes; renders the public URL, copy-link input, pipeline status ("polishing your guide…" → "done") and link to suggestions review.

- [ ] **Step 1: Create the OGCard stub (replaced in Task 17)**

`lib/ethos/og_card.ex`:

```elixir
defmodule Ethos.OGCard do
  @moduledoc "Generates the Open Graph share card PNG. Real implementation in the OG card task."
  def generate(_guide), do: {:ok, nil}
end
```

- [ ] **Step 2: Write the failing test**

`test/ethos_web/live/guide_share_test.exs`:

```elixir
defmodule EthosWeb.GuideShareTest do
  use EthosWeb.ConnCase, async: false

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures
  import Mox

  alias Ethos.Guides

  setup :verify_on_exit!
  setup :set_mox_from_context

  setup %{conn: conn} do
    user = user_fixture()
    %{conn: log_in_user(conn, user), user: user}
  end

  test "visiting share publishes the guide and shows the public link", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user})
    {:ok, _} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})

    # publish pipeline runs sync in tests via config below; stub its calls
    stub(Ethos.ExaMock, :search, fn _q, _o -> {:ok, []} end)
    stub(Ethos.ClaudeMock, :pick_nearby, fn _, _, _ -> {:ok, []} end)

    {:ok, _lv, html} = live(conn, ~p"/guides/#{guide.id}/share")

    assert html =~ "/g/#{guide.slug}"
    assert Guides.get_guide!(guide.id).status == "published"
  end

  test "share screen on an already-published guide does not re-run the pipeline", %{conn: conn, user: user} do
    guide = published_guide_fixture(%{user: user})
    {:ok, _lv, html} = live(conn, ~p"/guides/#{guide.id}/share")
    assert html =~ "/g/#{guide.slug}"
  end
end
```

Add to `config/test.exs` so the pipeline runs inline in tests:

```elixir
config :ethos, :agent_sync, true
```

And in `Ethos.Agents.GuideAgent.run/2` (Task 12), change the sync check to:

```elixir
if Keyword.get(opts, :sync, Application.get_env(:ethos, :agent_sync, false)) do
```

- [ ] **Step 3: Run test to verify it fails**

Run: `mix test test/ethos_web/live/guide_share_test.exs`
Expected: FAIL — share shell renders placeholder.

- [ ] **Step 4: Implement**

Replace `lib/ethos_web/live/guide_live/share.ex`:

```elixir
defmodule EthosWeb.GuideLive.Share do
  use EthosWeb, :live_view

  alias Ethos.Agents.GuideAgent
  alias Ethos.Guides

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    guide = Guides.get_user_guide!(socket.assigns.current_user, id)

    {guide, polishing} =
      if guide.status == "draft" do
        {:ok, guide} = Guides.publish_guide(guide)
        {:ok, _} = Ethos.OGCard.generate(guide)
        if connected?(socket), do: GuideAgent.subscribe_guide(guide.id)
        GuideAgent.publish_pipeline(guide.id)
        {guide, true}
      else
        {guide, false}
      end

    {:ok,
     assign(socket,
       guide: guide,
       polishing: polishing,
       public_url: url(~p"/g/#{guide.slug}"),
       page_title: "Share your guide"
     )}
  end

  @impl true
  def handle_info({:pipeline_done, _guide_id}, socket) do
    {:noreply, assign(socket, polishing: false)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Your guide is live 🎉
      <:subtitle>Share the link anywhere — no account needed to view it.</:subtitle>
    </.header>

    <div class="mt-6 flex gap-2">
      <input type="text" readonly value={@public_url} id="share-url"
             class="w-full rounded-md border-zinc-300 text-sm" />
      <.button phx-click={JS.dispatch("phx:copy", to: "#share-url")}>Copy</.button>
    </div>

    <p class="mt-4">
      <.link href={~p"/g/#{@guide.slug}"} class="underline">View your public guide →</.link>
    </p>

    <div class="mt-6 rounded-md bg-zinc-50 p-4 text-sm">
      <p :if={@polishing}>✨ Polishing your guide — adding official links and nearby ideas…</p>
      <p :if={!@polishing}>
        Done. Review
        <.link navigate={~p"/guides/#{@guide.id}/suggestions"} class="underline">nearby ideas &amp; suggestions</.link>.
      </p>
    </div>
    """
  end
end
```

Add the copy hook to `assets/js/app.js` (after the existing `liveSocket` setup):

```javascript
window.addEventListener("phx:copy", (event) => {
  navigator.clipboard.writeText(event.target.value)
})
```

- [ ] **Step 5: Run tests, then commit**

Run: `mix test test/ethos_web/live/guide_share_test.exs && mix test`
Expected: PASS

```bash
git add -A
git commit -m "feat: publish flow with share screen and async polish pipeline"
```

---

### Task 16: Public guide page (controller) with OG meta and Research display

**Files:**
- Create: `lib/ethos_web/controllers/guide_controller.ex`, `lib/ethos_web/controllers/guide_html.ex`, `lib/ethos_web/controllers/guide_html/show.html.heex`
- Modify: `lib/ethos_web/router.ex`, `lib/ethos_web/components/layouts/root.html.heex`
- Test: `test/ethos_web/controllers/guide_controller_test.exs`

**Interfaces:**
- Consumes: `Guides.get_published_guide_by_slug!/1`, `list_entries/1`, `increment_view_count/1`, `Research.cached_research/2` and `Research.research/2` + `RateLimiter` (Task 8)
- Produces: `GET /g/:slug` renders the public page with OG meta (`og:title`, `og:description`, `og:image` when `og_image_path` set) and increments views; `POST /g/:slug/entries/:id/research` (authenticated) fetches research, redirects back to `/g/:slug#entry-{id}`. Assigns `@page_og` map consumed by root layout.

- [ ] **Step 1: Write the failing test**

`test/ethos_web/controllers/guide_controller_test.exs`:

```elixir
defmodule EthosWeb.GuideControllerTest do
  use EthosWeb.ConnCase, async: false

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures
  import Mox

  alias Ethos.Guides

  setup :verify_on_exit!
  setup :set_mox_from_context

  test "shows a published guide with entries, credit lines, and OG meta", %{conn: conn} do
    guide = published_guide_fixture()
    contributor = user_fixture()

    {:ok, _} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved", note: "go early"})

    {:ok, _} =
      Guides.create_entry(guide, %{
        kind: "sight",
        name: "LX Factory",
        source: "suggestion",
        credited_user_id: contributor.id
      })

    conn = get(conn, ~p"/g/#{guide.slug}")
    html = html_response(conn, 200)

    assert html =~ guide.title
    assert html =~ "Ramiro"
    assert html =~ "go early"
    assert html =~ "added from a suggestion"
    assert html =~ ~s(property="og:title")
    assert Guides.get_guide!(guide.id).view_count == 1
  end

  test "404s for drafts", %{conn: conn} do
    guide = guide_fixture()

    assert_error_sent 404, fn -> get(conn, ~p"/g/#{guide.slug}") end
  end

  test "research action requires login", %{conn: conn} do
    guide = published_guide_fixture()
    {:ok, entry} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})

    conn = post(conn, ~p"/g/#{guide.slug}/entries/#{entry.id}/research")
    assert redirected_to(conn) == ~p"/users/log_in"
  end

  test "research action fetches and redirects back", %{conn: conn} do
    guide = published_guide_fixture()
    {:ok, entry} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})
    user = user_fixture()
    Ethos.Research.RateLimiter.reset(user.id)

    expect(Ethos.ExaMock, :search, fn _q, _o ->
      {:ok, [%{title: "Update", url: "https://example.com", snippet: "still open, book ahead"}]}
    end)

    conn =
      conn
      |> log_in_user(user)
      |> post(~p"/g/#{guide.slug}/entries/#{entry.id}/research")

    assert redirected_to(conn) =~ "/g/#{guide.slug}"

    # rendered page now shows the cached research
    conn = get(build_conn(), ~p"/g/#{guide.slug}")
    assert html_response(conn, 200) =~ "still open, book ahead"
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos_web/controllers/guide_controller_test.exs`
Expected: FAIL — routes undefined.

- [ ] **Step 3: Implement**

Router — in the public `scope "/", EthosWeb do pipe_through :browser` block:

```elixir
get "/g/:slug", GuideController, :show
```

And in an authenticated browser scope (`pipe_through [:browser, :require_authenticated_user]`):

```elixir
post "/g/:slug/entries/:entry_id/research", GuideController, :research
```

`lib/ethos_web/controllers/guide_controller.ex`:

```elixir
defmodule EthosWeb.GuideController do
  use EthosWeb, :controller

  alias Ethos.{Guides, Research}

  def show(conn, %{"slug" => slug}) do
    guide = Guides.get_published_guide_by_slug!(slug)
    entries = Guides.list_entries(guide)
    Guides.increment_view_count(guide)

    research =
      Map.new(entries, fn entry ->
        {entry.id, Research.cached_research(entry.name, guide.destination)}
      end)

    og = %{
      title: "#{guide.title} — an Ethos guide",
      description: "#{guide.destination} · #{length(entries)} places and tips from a real trip",
      image: guide.og_image_path && url(~p"/#{guide.og_image_path}")
    }

    render(conn, :show, guide: guide, entries: entries, research: research, page_og: og)
  end

  def research(conn, %{"slug" => slug, "entry_id" => entry_id}) do
    guide = Guides.get_published_guide_by_slug!(slug)
    entry = Guides.get_entry!(guide, entry_id)
    user = conn.assigns.current_user

    conn =
      cond do
        not Research.RateLimiter.allow?(user.id) ->
          put_flash(conn, :error, "Research limit reached — try again in an hour.")

        match?({:ok, _}, Research.research(entry.name, guide.destination)) ->
          conn

        true ->
          put_flash(conn, :error, "Couldn't fetch fresh info for #{entry.name}.")
      end

    redirect(conn, to: ~p"/g/#{guide.slug}" <> "#entry-#{entry.id}")
  end
end
```

`lib/ethos_web/controllers/guide_html.ex`:

```elixir
defmodule EthosWeb.GuideHTML do
  use EthosWeb, :html

  embed_templates "guide_html/*"

  def verdict_badge("loved"), do: "❤️ loved it"
  def verdict_badge("good"), do: "👍 good"
  def verdict_badge("skip"), do: "⏭ skip it"
  def verdict_badge(_), do: nil
end
```

`lib/ethos_web/controllers/guide_html/show.html.heex`:

```heex
<article class="mx-auto max-w-2xl px-4 py-10">
  <header>
    <h1 class="text-3xl font-bold"><%= @guide.title %></h1>
    <p class="mt-1 text-zinc-500"><%= @guide.destination %></p>
  </header>

  <ol class="mt-8 space-y-4">
    <li :for={entry <- @entries} id={"entry-#{entry.id}"} class="rounded-xl border p-5">
      <div class="flex items-start justify-between gap-4">
        <div>
          <p class="font-semibold text-lg">
            <%= if entry.enrichment && entry.enrichment["official_url"] do %>
              <a href={entry.enrichment["official_url"]} class="hover:underline" rel="nofollow">
                <%= entry.name %>
              </a>
            <% else %>
              <%= entry.name %>
            <% end %>
          </p>
          <p class="text-sm text-zinc-500">
            <%= entry.kind %>
            <span :if={entry.day}>· day <%= entry.day %></span>
            <span :if={verdict_badge(entry.verdict)}>· <%= verdict_badge(entry.verdict) %></span>
          </p>
        </div>
      </div>

      <p :if={entry.note} class="mt-2"><%= entry.note %></p>

      <p :if={entry.credited_user_id} class="mt-2 text-xs text-zinc-400">
        added from a suggestion
      </p>

      <div :if={@research[entry.id]} class="mt-3 rounded-md bg-zinc-50 p-3 text-sm">
        <p class="font-medium text-zinc-600">Fresh research</p>
        <ul class="mt-1 space-y-1">
          <li :for={r <- @research[entry.id]["results"]}>
            <a href={r["url"]} class="underline" rel="nofollow"><%= r["title"] || r["url"] %></a>
            <span :if={r["snippet"]} class="text-zinc-500">— <%= r["snippet"] %></span>
          </li>
        </ul>
      </div>

      <form :if={@current_user} action={~p"/g/#{@guide.slug}/entries/#{entry.id}/research"} method="post" class="mt-2">
        <input type="hidden" name="_csrf_token" value={Plug.CSRFProtection.get_csrf_token()} />
        <button class="text-xs underline text-zinc-500">Research this</button>
      </form>
    </li>
  </ol>

  <footer class="mt-10 flex flex-wrap gap-4 border-t pt-6">
    <.link navigate={~p"/g/#{@guide.slug}/suggest"} class="rounded-md bg-zinc-900 px-4 py-2 text-white text-sm">
      Suggest a place
    </.link>
    <.link navigate={~p"/guides/new"} class="rounded-md border px-4 py-2 text-sm">
      Make your own guide
    </.link>
  </footer>
</article>
```

Root layout `lib/ethos_web/components/layouts/root.html.heex` — in `<head>`, after the existing meta tags:

```heex
<%= if assigns[:page_og] do %>
  <meta property="og:title" content={@page_og.title} />
  <meta property="og:description" content={@page_og.description} />
  <%= if @page_og.image do %>
    <meta property="og:image" content={@page_og.image} />
  <% end %>
  <meta name="twitter:card" content="summary_large_image" />
<% end %>
```

The `~p"/g/#{@guide.slug}/suggest"` route arrives in Task 18 — add it to the router now with a shell (same pattern as Task 13):

```elixir
# authenticated live_session
live "/g/:slug/suggest", SuggestLive, :new
```

```elixir
# lib/ethos_web/live/suggest_live.ex — REPLACED IN TASK 18
defmodule EthosWeb.SuggestLive do
  use EthosWeb, :live_view
  def mount(_p, _s, socket), do: {:ok, socket}
  def render(assigns), do: ~H"<div>suggest</div>"
end
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `mix test test/ethos_web/controllers/guide_controller_test.exs`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: public guide page with OG meta, credit lines, research display"
```

---

### Task 17: OG card image generation

**Files:**
- Modify (replace stub): `lib/ethos/og_card.ex`
- Modify: `lib/ethos_web/endpoint.ex` (serve `/uploads`), `.gitignore`
- Test: `test/ethos/og_card_test.exs`

**Interfaces:**
- Consumes: `%Guide{}` (Task 3), Vix (Task 1 dep)
- Produces: `Ethos.OGCard.generate(guide) :: {:ok, guide}` — renders a 1200×630 SVG (title, destination, "an Ethos guide"), rasterizes to PNG via Vix, writes `priv/uploads/og/{slug}.png`, updates `guide.og_image_path` to `"uploads/og/{slug}.png"`. Endpoint serves `/uploads/*` from `priv/uploads`.

- [ ] **Step 1: Write the failing test**

`test/ethos/og_card_test.exs`:

```elixir
defmodule Ethos.OGCardTest do
  use Ethos.DataCase, async: false

  import Ethos.GuidesFixtures

  test "generate/1 writes a PNG and records the path" do
    guide = guide_fixture(%{title: "Lisbon in 5 days"})

    {:ok, guide} = Ethos.OGCard.generate(guide)

    assert guide.og_image_path == "uploads/og/#{guide.slug}.png"
    path = Path.join([:code.priv_dir(:ethos), "uploads", "og", "#{guide.slug}.png"])
    assert File.exists?(path)
    # PNG magic bytes
    assert <<0x89, "PNG", _::binary>> = File.read!(path)
    File.rm!(path)
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/og_card_test.exs`
Expected: FAIL — stub returns `{:ok, nil}`.

- [ ] **Step 3: Implement**

Replace `lib/ethos/og_card.ex`:

```elixir
defmodule Ethos.OGCard do
  @moduledoc "Renders the 1200x630 Open Graph share card: SVG template -> PNG via Vix/libvips."

  alias Ethos.Guides

  def generate(guide) do
    svg = template(guide)
    dir = Path.join([:code.priv_dir(:ethos) |> to_string(), "uploads", "og"])
    File.mkdir_p!(dir)
    path = Path.join(dir, "#{guide.slug}.png")

    with {:ok, {image, _flags}} <- Vix.Vips.Operation.svgload_buffer(svg),
         :ok <- Vix.Vips.Image.write_to_file(image, path) do
      Guides.update_guide_og_path(guide, "uploads/og/#{guide.slug}.png")
    end
  end

  defp template(guide) do
    title = escape(String.slice(guide.title, 0, 60))
    destination = escape(String.slice(guide.destination, 0, 60))

    """
    <svg xmlns="http://www.w3.org/2000/svg" width="1200" height="630">
      <rect width="1200" height="630" fill="#18181b"/>
      <rect x="0" y="560" width="1200" height="70" fill="#f59e0b"/>
      <text x="80" y="280" font-family="Georgia, serif" font-size="64" fill="#fafafa" font-weight="bold">#{title}</text>
      <text x="80" y="360" font-family="Georgia, serif" font-size="36" fill="#a1a1aa">#{destination}</text>
      <text x="80" y="605" font-family="Georgia, serif" font-size="24" fill="#18181b">an Ethos guide — real places, real verdicts</text>
    </svg>
    """
  end

  defp escape(text) do
    text
    |> String.replace("&", "&amp;")
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
  end
end
```

Add to `lib/ethos/guides.ex`:

```elixir
def update_guide_og_path(%Guide{} = guide, path) do
  guide |> Ecto.Changeset.change(og_image_path: path) |> Repo.update()
end
```

In `lib/ethos_web/endpoint.ex`, above the existing `Plug.Static` for `priv/static`, add:

```elixir
plug Plug.Static,
  at: "/uploads",
  from: {:ethos, "priv/uploads"},
  gzip: false
```

Add to `.gitignore`:

```
/priv/uploads/
```

Note: `og_image_path` is stored as `"uploads/og/..."` and rendered in Task 16 as `url(~p"/#{guide.og_image_path}")`, producing `/uploads/og/{slug}.png` — matches the static mount.

- [ ] **Step 4: Run tests to verify they pass**

Run: `mix test test/ethos/og_card_test.exs && mix test`
Expected: PASS (requires libvips with SVG support on the machine: `brew install vips`).

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: OG share card generation via SVG->PNG"
```

---

### Task 18: Suggestion submit + owner review UI

**Files:**
- Modify (replace shells): `lib/ethos_web/live/suggest_live.ex`, `lib/ethos_web/live/guide_live/suggestions.ex`
- Test: `test/ethos_web/live/suggestions_flow_test.exs`

**Interfaces:**
- Consumes: `Contributions` (Task 11), `Guides`
- Produces: `/g/:slug/suggest` — authenticated form (place_name, kind_hint, body, optional entry pin) creating a pending suggestion, redirecting to the guide with a thank-you flash. `/guides/:id/suggestions` — owner-only list of pending suggestions (user + gap_fill origins) with Accept/Decline buttons.

- [ ] **Step 1: Write the failing test**

`test/ethos_web/live/suggestions_flow_test.exs`:

```elixir
defmodule EthosWeb.SuggestionsFlowTest do
  use EthosWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.{Contributions, Guides}

  test "reader submits a suggestion", %{conn: conn} do
    guide = published_guide_fixture()
    reader = user_fixture()
    conn = log_in_user(conn, reader)

    {:ok, lv, _html} = live(conn, ~p"/g/#{guide.slug}/suggest")

    lv
    |> form("#suggest-form", suggestion: %{place_name: "Bar da Velha", kind_hint: "food", body: "hidden gem"})
    |> render_submit()

    assert_redirect(lv, ~p"/g/#{guide.slug}")
    assert [%{place_name: "Bar da Velha", origin: "user"}] = Contributions.list_pending_suggestions(guide)
  end

  test "owner accepts a suggestion which creates a credited entry", %{conn: conn} do
    owner = user_fixture()
    guide = published_guide_fixture(%{user: owner})
    reader = user_fixture()
    {:ok, sugg} = Contributions.create_suggestion(reader, guide, %{place_name: "Bar da Velha", body: "gem"})

    conn = log_in_user(conn, owner)
    {:ok, lv, html} = live(conn, ~p"/guides/#{guide.id}/suggestions")
    assert html =~ "Bar da Velha"

    lv |> element(~s(button[phx-click="accept"][phx-value-id="#{sugg.id}"])) |> render_click()

    assert [entry] = Guides.list_entries(guide)
    assert entry.credited_user_id == reader.id
    refute render(lv) =~ "Bar da Velha"
  end

  test "owner declines a suggestion", %{conn: conn} do
    owner = user_fixture()
    guide = published_guide_fixture(%{user: owner})
    reader = user_fixture()
    {:ok, sugg} = Contributions.create_suggestion(reader, guide, %{place_name: "Meh place", body: "eh"})

    conn = log_in_user(conn, owner)
    {:ok, lv, _} = live(conn, ~p"/guides/#{guide.id}/suggestions")

    lv |> element(~s(button[phx-click="decline"][phx-value-id="#{sugg.id}"])) |> render_click()
    assert Guides.list_entries(guide) == []
    assert Contributions.list_pending_suggestions(guide) == []
  end

  test "non-owner cannot open the review screen", %{conn: conn} do
    guide = published_guide_fixture()
    other = user_fixture()
    conn = log_in_user(conn, other)

    assert_error_sent 404, fn -> live(conn, ~p"/guides/#{guide.id}/suggestions") end
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos_web/live/suggestions_flow_test.exs`
Expected: FAIL — shells render placeholders.

- [ ] **Step 3: Implement**

Replace `lib/ethos_web/live/suggest_live.ex`:

```elixir
defmodule EthosWeb.SuggestLive do
  use EthosWeb, :live_view

  alias Ethos.{Contributions, Guides}
  alias Ethos.Contributions.Suggestion

  @impl true
  def mount(%{"slug" => slug}, _session, socket) do
    guide = Guides.get_published_guide_by_slug!(slug)

    {:ok,
     assign(socket,
       guide: guide,
       form: to_form(Suggestion.changeset(%Suggestion{}, %{})),
       page_title: "Suggest a place"
     )}
  end

  @impl true
  def handle_event("save", %{"suggestion" => params}, socket) do
    case Contributions.create_suggestion(socket.assigns.current_user, socket.assigns.guide, params) do
      {:ok, _} ->
        {:noreply,
         socket
         |> put_flash(:info, "Thanks! The guide owner will review your suggestion.")
         |> push_navigate(to: ~p"/g/#{socket.assigns.guide.slug}")}

      {:error, changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Suggest a place for “<%= @guide.title %>”
      <:subtitle>If the owner accepts it, you'll be credited on the guide.</:subtitle>
    </.header>

    <.simple_form for={@form} id="suggest-form" phx-submit="save">
      <.input field={@form[:place_name]} label="Place / tip" />
      <.input field={@form[:kind_hint]} type="select" label="Kind" prompt="—" options={Ethos.Guides.Entry.kinds()} />
      <.input field={@form[:body]} type="textarea" label="Why it belongs in this guide" />
      <:actions><.button>Send suggestion</.button></:actions>
    </.simple_form>
    """
  end
end
```

Replace `lib/ethos_web/live/guide_live/suggestions.ex`:

```elixir
defmodule EthosWeb.GuideLive.Suggestions do
  use EthosWeb, :live_view

  alias Ethos.{Contributions, Guides}

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    guide = Guides.get_user_guide!(socket.assigns.current_user, id)
    {:ok, socket |> assign(guide: guide, page_title: "Suggestions") |> load()}
  end

  @impl true
  def handle_event("accept", %{"id" => id}, socket) do
    suggestion = Contributions.get_suggestion!(socket.assigns.guide, id)
    {:ok, _} = Contributions.accept_suggestion(suggestion)
    {:noreply, load(socket)}
  end

  def handle_event("decline", %{"id" => id}, socket) do
    suggestion = Contributions.get_suggestion!(socket.assigns.guide, id)
    {:ok, _} = Contributions.decline_suggestion(suggestion)
    {:noreply, load(socket)}
  end

  defp load(socket),
    do: assign(socket, suggestions: Contributions.list_pending_suggestions(socket.assigns.guide))

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Suggestions &amp; nearby ideas
      <:subtitle>Accepting adds the place to your guide (with credit for reader suggestions).</:subtitle>
    </.header>

    <p :if={@suggestions == []} class="mt-6 text-zinc-500">Nothing pending. 🎉</p>

    <ul class="mt-6 space-y-3">
      <li :for={s <- @suggestions} class="rounded-lg border p-4">
        <div class="flex items-start justify-between gap-4">
          <div>
            <p class="font-semibold"><%= s.place_name %></p>
            <p class="text-sm text-zinc-500">
              <%= s.kind_hint || "tip" %> ·
              <%= if s.origin == "gap_fill", do: "nearby idea (auto)", else: "suggested by #{s.author && s.author.email}" %>
            </p>
            <p :if={s.body} class="text-sm mt-1"><%= s.body %></p>
            <a :if={s.url} href={s.url} class="text-xs underline" rel="nofollow"><%= s.url %></a>
          </div>
          <div class="flex gap-2 shrink-0">
            <.button phx-click="accept" phx-value-id={s.id}>Accept</.button>
            <button phx-click="decline" phx-value-id={s.id} class="text-sm underline text-zinc-500">
              Decline
            </button>
          </div>
        </div>
      </li>
    </ul>
    """
  end
end
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `mix test test/ethos_web/live/suggestions_flow_test.exs && mix test`
Expected: PASS (note: `get_user_guide!` raises `Ecto.NoResultsError` → 404 for non-owners, satisfying the last test).

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: reader suggestions and owner review with accept-and-credit"
```

---

### Task 19: Landing page with example guide

**Files:**
- Modify: `lib/ethos_web/controllers/page_controller.ex`, `lib/ethos_web/controllers/page_html/home.html.heex`, `priv/repo/seeds.exs`
- Test: `test/ethos_web/controllers/page_controller_test.exs` (modify generated test)

**Interfaces:**
- Consumes: `Guides` (published guides)
- Produces: landing page showing hero copy + the most-viewed published guide as the example (or none gracefully); `mix run priv/repo/seeds.exs` creates a demo user + published "Lisbon in 5 days" guide with 6 entries.

- [ ] **Step 1: Write the failing test**

Replace `test/ethos_web/controllers/page_controller_test.exs`:

```elixir
defmodule EthosWeb.PageControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Guides

  test "GET / shows hero and CTA without any guides", %{conn: conn} do
    conn = get(conn, ~p"/")
    html = html_response(conn, 200)
    assert html =~ "Turn your trip into a guide"
    assert html =~ "Make your guide"
  end

  test "GET / features a published guide when one exists", %{conn: conn} do
    guide = published_guide_fixture(%{title: "Featured Lisbon"})
    Guides.increment_view_count(guide)

    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Featured Lisbon"
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos_web/controllers/page_controller_test.exs`
Expected: FAIL — generated page has different copy.

- [ ] **Step 3: Implement**

`lib/ethos_web/controllers/page_controller.ex`:

```elixir
defmodule EthosWeb.PageController do
  use EthosWeb, :controller

  import Ecto.Query
  alias Ethos.Guides.Guide
  alias Ethos.Repo

  def home(conn, _params) do
    featured =
      Repo.one(
        from g in Guide,
          where: g.status == "published",
          order_by: [desc: g.view_count, desc: g.id],
          limit: 1
      )

    render(conn, :home, featured: featured, layout: false)
  end
end
```

Replace `lib/ethos_web/controllers/page_html/home.html.heex`:

```heex
<div class="mx-auto max-w-3xl px-4 py-20 text-center">
  <h1 class="text-4xl sm:text-5xl font-bold">Turn your trip into a guide worth sharing</h1>
  <p class="mt-4 text-lg text-zinc-600">
    Paste your notes — or the thread of recs your friends sent you — and Ethos turns it into
    a beautiful guide with real verdicts. Share one link instead of typing it all out again.
  </p>
  <div class="mt-8 flex justify-center gap-4">
    <.link navigate={~p"/guides/new"} class="rounded-md bg-zinc-900 px-6 py-3 text-white font-medium">
      Make your guide
    </.link>
    <.link :if={@featured} href={~p"/g/#{@featured.slug}"} class="rounded-md border px-6 py-3 font-medium">
      See an example
    </.link>
  </div>

  <div :if={@featured} class="mt-16 rounded-xl border p-6 text-left">
    <p class="text-sm uppercase tracking-wide text-zinc-400">Featured guide</p>
    <p class="mt-1 text-xl font-semibold"><%= @featured.title %></p>
    <p class="text-zinc-500"><%= @featured.destination %></p>
    <.link href={~p"/g/#{@featured.slug}"} class="mt-3 inline-block underline">Read it →</.link>
  </div>
</div>
```

Append to `priv/repo/seeds.exs`:

```elixir
alias Ethos.{Accounts, Guides}

{:ok, demo} =
  Accounts.register_user(%{email: "demo@ethos.example", password: "demo-password-123!"})

{:ok, guide} =
  Guides.create_guide(demo, %{title: "Lisbon in 5 days", destination: "Lisbon, Portugal"})

[
  %{day: 1, kind: "food", name: "Cervejaria Ramiro", note: "Garlic shrimp + prego. Go at opening or queue an hour.", verdict: "loved"},
  %{day: 1, kind: "walk", name: "Alfama at golden hour", note: "Get lost on purpose. Miradouro de Santa Luzia at sunset.", verdict: "loved"},
  %{day: 2, kind: "sight", name: "Belém Tower", note: "Fine from outside; skip the interior queue.", verdict: "skip"},
  %{day: 2, kind: "food", name: "Pastéis de Belém", note: "Yes it's touristy. Yes it's worth it. Eat them warm.", verdict: "loved"},
  %{day: 3, kind: "tour", name: "LX Factory", note: "Creative complex under the bridge — Sunday market is best.", verdict: "good"},
  %{day: 4, kind: "tip", name: "Carris day pass", note: "€6.80 covers trams incl. the 28 — buy at metro machines.", verdict: "good"}
]
|> Enum.each(fn attrs -> {:ok, _} = Guides.create_entry(guide, attrs) end)

{:ok, _} = Guides.publish_guide(guide)
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `mix test test/ethos_web/controllers/page_controller_test.exs && mix test`
Expected: PASS. Also verify seeds run clean: `mix ecto.reset` (runs migrations + seeds) then `mix test` again.

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: landing page with featured guide and demo seeds"
```

---

### Task 20: Deploy to Fly.io

**Files:**
- Create: `Dockerfile`, `.dockerignore`, `fly.toml`, `rel/` (via generator)
- Modify: `config/runtime.exs` (already has secrets from Task 6), `Dockerfile` (add libvips)

**Interfaces:**
- Consumes: the whole app
- Produces: production deployment on Fly.io with Postgres attached and secrets set. No automated test — verification is manual smoke checks listed below.

- [ ] **Step 1: Generate release files**

```bash
mix phx.gen.release --docker
```

- [ ] **Step 2: Add libvips to the Dockerfile**

In the generated `Dockerfile`, find the runner-stage `apt-get install` line (the one installing `libstdc++6 openssl libncurses5 locales ...`) and add `libvips42` (and in the builder stage's apt-get line add `libvips-dev`), e.g.:

```dockerfile
# builder stage
RUN apt-get update -y && apt-get install -y build-essential git libvips-dev \
    && apt-get clean && rm -f /var/lib/apt/lists/*_*

# runner stage
RUN apt-get update -y && \
    apt-get install -y libstdc++6 openssl libncurses5 locales ca-certificates libvips42 \
    && apt-get clean && rm -f /var/lib/apt/lists/*_*
```

Note: OG card PNGs are written to `priv/uploads/`, which is ephemeral on Fly. That is acceptable for v1 (cards regenerate on next publish; existing cards survive until redeploy). Create the dir in the Dockerfile runner stage: `RUN mkdir -p /app/lib/ethos-*/priv/uploads/og` is fragile — instead `File.mkdir_p!` already runs inside `OGCard.generate/1`, so nothing extra is needed.

- [ ] **Step 3: Launch and deploy**

```bash
fly launch --no-deploy   # accept app name ethos or choose; provisions fly.toml
fly postgres create --name ethos-db
fly postgres attach ethos-db
fly secrets set ANTHROPIC_API_KEY=<key> EXA_API_KEY=<key>
fly deploy
```

`config/runtime.exs` already reads `DATABASE_URL`, `SECRET_KEY_BASE` (set by `fly launch`), `ANTHROPIC_API_KEY`, `EXA_API_KEY`.

- [ ] **Step 4: Seed production and smoke test**

```bash
fly ssh console -C "/app/bin/ethos eval 'Ethos.Release.migrate()'"
fly ssh console -C "/app/bin/ethos eval 'Code.eval_file(\"/app/lib/ethos-0.1.0/priv/repo/seeds.exs\")'"
```

Manual smoke checks:
1. Landing page loads and shows the seeded Lisbon guide.
2. Register, create a guide, paste a dump, confirm entries, publish — parse + enrichment work with live keys.
3. Public guide link unfurls with the OG card (test in an OG debugger, e.g. opengraph.xyz).
4. Suggest a place from a second account; accept it; credit line renders.
5. Research button returns fresh results and rate-limits after 10 clicks.

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "chore: Fly.io deployment with libvips and release config"
```

---

## Final verification

- [ ] `mix test` — full suite green.
- [ ] `mix format --check-formatted` — clean (run `mix format` if not).
- [ ] Walk the five smoke checks in Task 20 Step 4 on production.
- [ ] Confirm token budget invariants by reading the code one last time: exactly one `parse_dump` call per import; exactly one `pick_nearby` call per publish; enrichment/Research use exa only.
