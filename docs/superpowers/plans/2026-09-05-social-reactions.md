# Social Layer, Plan 2: Reactions Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the single-purpose "I've been here" check-off with thumbs up and thumbs down on places, guides, and collections, and move the badge system onto reactions without anyone losing a badge they had earned.

**Architecture:** One polymorphic `reactions` table (`subject_type` + `subject_id`) and one `Ethos.Social` context that owns every query touching it. The UI is a LiveView island embedded in the existing controller-rendered show pages via `live_render/3`, so all the SEO work in those controllers stays untouched. `Ethos.Visits` and `place_visits` are deleted last, after a migration converts every visit into a thumbs-up.

**Tech Stack:** Elixir, Phoenix 1.7, Phoenix LiveView, Ecto + PostgreSQL, ExUnit.

**Spec:** `docs/superpowers/specs/2026-09-05-social-layer-design.md` (sections "Reactions" and "Badges")

**Predecessor:** `docs/superpowers/plans/2026-09-05-social-identity.md` (Plan 1, merged as PR #5). This plan builds on `Ethos.Accounts.display_name/1`, `Accounts.needs_username?/1`, and `users.banned_at`, all of which already exist.

## Global Constraints

- Subject types, exactly these three strings: `"place"`, `"guide"`, `"collection"`.
- Reaction values, exactly these two strings: `"up"`, `"down"`.
- One reaction per user per subject, enforced by a unique index — not only by a changeset.
- Toggle semantics: no existing row → insert; existing row with the OPPOSITE value → update; existing row with the SAME value → delete.
- **Any reaction counts as a visit.** Badge rules count distinct places a user has reacted to, thumbs up *or* down.
- A banned user's reactions (`users.banned_at` is not null) must not appear in any public count.
- **Never render `user.username` on a page a third party can see. Call `Ethos.Accounts.display_name/1`.** It has no `nil` clause — guard before calling.
- **Run `mix format` scoped to the files you touched.** Never bare `mix format`: it reformats unrelated files across the project and creates merge conflicts for the two other active worktrees.
- **Every task must end with `mix test` at 0 failures.** Baseline entering this plan: **805 tests, 0 failures**. The task order below is deliberately chosen so no commit is ever red.
- Database runs in Docker on port 54329 (`docker compose up -d`).

## File Structure

**Created:**

| File | Responsibility |
|---|---|
| `lib/ethos/social/subject.ex` | The only module that knows the three subject types: struct → `{type, id}`, type → loader, type validation. |
| `lib/ethos/social/reaction.ex` | Ecto schema and changeset for one reaction. |
| `lib/ethos/social.ex` | The context. Every query touching `reactions` lives here, including the four badge count queries that used to live in `Ethos.Visits`. |
| `lib/ethos_web/live/social_live.ex` | The embedded island: thumbs, counts, login prompt, provisional-username prompt. |
| `priv/repo/migrations/20260906120000_create_reactions.exs` | Creates the table. Additive only. |
| `priv/repo/migrations/20260906130000_migrate_visits_to_reactions.exs` | Converts `place_visits` into thumbs-up reactions, then drops the table. |

**Modified:** `lib/ethos/badges.ex`, `lib/ethos_web/controllers/place_controller.ex`, the three show templates, `lib/ethos_web/router.ex`.

**Deleted (Task 7 only):** `lib/ethos/visits.ex`, `lib/ethos/visits/place_visit.ex`, `test/ethos/visits_test.exs`, `test/ethos_web/controllers/place_visit_test.exs`.

---

### Task 1: The subject module

The one place that knows what "polymorphic subject" means here. Everything else asks it.

**Files:**
- Create: `lib/ethos/social/subject.ex`
- Test: `test/ethos/social/subject_test.exs`

**Interfaces:**
- Consumes: `Ethos.Places.Place`, `Ethos.Guides.Guide`, `Ethos.Collections.Collection` schemas (all exist).
- Produces: `Subject.types/0` → `["place", "guide", "collection"]`; `Subject.type/1` (struct → binary); `Subject.ref/1` (struct → `{binary, integer}`); `Subject.valid_type?/1` → boolean; `Subject.get!/2` (type, id → struct, raises `Ecto.NoResultsError`).

- [ ] **Step 1: Write the failing test**

Create `test/ethos/social/subject_test.exs`:

```elixir
defmodule Ethos.Social.SubjectTest do
  use Ethos.DataCase, async: true

  import Ethos.GuidesFixtures

  alias Ethos.Social.Subject

  describe "types/0 and valid_type?/1" do
    test "exactly three types" do
      assert Subject.types() == ["place", "guide", "collection"]
    end

    test "accepts the three and nothing else" do
      assert Subject.valid_type?("place")
      assert Subject.valid_type?("guide")
      assert Subject.valid_type?("collection")
      refute Subject.valid_type?("entry")
      refute Subject.valid_type?("Place")
      refute Subject.valid_type?(nil)
    end
  end

  describe "type/1 and ref/1" do
    test "a place" do
      place = %Ethos.Places.Place{id: 7}
      assert Subject.type(place) == "place"
      assert Subject.ref(place) == {"place", 7}
    end

    test "a guide" do
      guide = %Ethos.Guides.Guide{id: 9}
      assert Subject.type(guide) == "guide"
      assert Subject.ref(guide) == {"guide", 9}
    end

    test "a collection" do
      collection = %Ethos.Collections.Collection{id: 11}
      assert Subject.type(collection) == "collection"
      assert Subject.ref(collection) == {"collection", 11}
    end
  end

  describe "get!/2" do
    test "loads a guide by type and id" do
      guide = guide_fixture()
      assert Subject.get!("guide", guide.id).id == guide.id
    end

    test "raises for a missing row" do
      assert_raise Ecto.NoResultsError, fn -> Subject.get!("guide", 0) end
    end

    test "raises for an unknown type rather than guessing" do
      assert_raise FunctionClauseError, fn -> Subject.get!("entry", 1) end
    end
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/social/subject_test.exs`
Expected: FAIL — `module Ethos.Social.Subject is not available`.

- [ ] **Step 3: Write the implementation**

Create `lib/ethos/social/subject.ex`:

```elixir
defmodule Ethos.Social.Subject do
  @moduledoc """
  What a reaction or review can be attached to.

  Reactions are polymorphic — one table serves places, guides and
  collections — which means the mapping between a struct and the
  `{subject_type, subject_id}` pair stored in the database has to live
  somewhere. It lives here, and nowhere else, so adding a fourth kind of
  subject is one module to change rather than a grep.

  Unknown types raise rather than returning `nil`. A subject type that
  does not match is a programming error, not a runtime condition: silently
  returning `nil` would let a typo write rows that no query ever reads
  again.
  """

  alias Ethos.Collections.Collection
  alias Ethos.Guides.Guide
  alias Ethos.Places.Place
  alias Ethos.Repo

  @types ~w(place guide collection)

  def types, do: @types

  def valid_type?(type), do: type in @types

  def type(%Place{}), do: "place"
  def type(%Guide{}), do: "guide"
  def type(%Collection{}), do: "collection"

  @doc "The `{subject_type, subject_id}` pair for a subject struct."
  def ref(subject), do: {type(subject), subject.id}

  @doc "Loads a subject by its stored type and id. Raises if absent."
  def get!("place", id), do: Repo.get!(Place, id)
  def get!("guide", id), do: Repo.get!(Guide, id)
  def get!("collection", id), do: Repo.get!(Collection, id)
end
```

- [ ] **Step 4: Run test to verify it passes**

Run: `mix test test/ethos/social/subject_test.exs`
Expected: PASS — 9 tests, 0 failures.

- [ ] **Step 5: Run the full suite**

Run: `mix test`
Expected: 0 failures, count at or above 814.

- [ ] **Step 6: Commit**

```bash
mix format lib/ethos/social/subject.ex test/ethos/social/subject_test.exs
git add lib/ethos/social/subject.ex test/ethos/social/subject_test.exs
git commit -m "feat: polymorphic subject module for social features"
```

---

### Task 2: The reactions table and schema

Additive: nothing reads this table yet.

**Files:**
- Create: `priv/repo/migrations/20260906120000_create_reactions.exs`
- Create: `lib/ethos/social/reaction.ex`
- Test: `test/ethos/social/reaction_test.exs`

**Interfaces:**
- Consumes: `Subject.types/0` from Task 1.
- Produces: table `reactions`; `Ethos.Social.Reaction` schema with fields `user_id`, `subject_type`, `subject_id`, `value`; `Reaction.changeset/2`.

- [ ] **Step 1: Write the migration**

Create `priv/repo/migrations/20260906120000_create_reactions.exs`:

```elixir
defmodule Ethos.Repo.Migrations.CreateReactions do
  use Ecto.Migration

  def change do
    create table(:reactions) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :subject_type, :string, null: false
      # bigint, not integer: places, guides and collections all have bigserial
      # primary keys. An int4 column here would overflow once any of those
      # sequences passes 2^31-1, and widening it later is a data migration.
      add :subject_id, :bigint, null: false
      add :value, :string, null: false

      timestamps(type: :utc_datetime)
    end

    # One reaction per person per thing. The changeset checks this too, but
    # the index is what actually holds under a double-click race.
    create unique_index(:reactions, [:user_id, :subject_type, :subject_id])

    # Serves the count aggregate on every show page.
    create index(:reactions, [:subject_type, :subject_id, :value])

    # No foreign key to the subject: it is polymorphic, and Postgres cannot
    # reference three tables from one column. Rows for a deleted subject are
    # inert — nothing queries them — which is the accepted cost of one table
    # instead of three.
    create constraint(:reactions, :reactions_value_check,
             check: "value in ('up', 'down')"
           )

    create constraint(:reactions, :reactions_subject_type_check,
             check: "subject_type in ('place', 'guide', 'collection')"
           )
  end
end
```

- [ ] **Step 2: Run the migration and verify it reverses**

Run: `mix ecto.migrate`, then `mix ecto.rollback`, then `mix ecto.migrate`
Expected: all three succeed. Then `MIX_ENV=test mix ecto.migrate`.

- [ ] **Step 3: Write the failing test**

Create `test/ethos/social/reaction_test.exs`:

```elixir
defmodule Ethos.Social.ReactionTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures

  alias Ethos.Repo
  alias Ethos.Social.Reaction

  defp valid_attrs(user) do
    %{user_id: user.id, subject_type: "place", subject_id: 1, value: "up"}
  end

  test "accepts a well-formed reaction" do
    user = user_fixture()
    assert {:ok, _} = %Reaction{} |> Reaction.changeset(valid_attrs(user)) |> Repo.insert()
  end

  test "rejects an unknown subject type" do
    user = user_fixture()
    attrs = %{valid_attrs(user) | subject_type: "entry"}
    changeset = Reaction.changeset(%Reaction{}, attrs)

    assert %{subject_type: ["is invalid"]} = errors_on(changeset)
  end

  test "rejects an unknown value" do
    user = user_fixture()
    attrs = %{valid_attrs(user) | value: "sideways"}
    changeset = Reaction.changeset(%Reaction{}, attrs)

    assert %{value: ["is invalid"]} = errors_on(changeset)
  end

  test "requires every field" do
    changeset = Reaction.changeset(%Reaction{}, %{})
    errors = errors_on(changeset)

    for field <- [:user_id, :subject_type, :subject_id, :value] do
      assert Map.has_key?(errors, field), "expected #{field} to be required"
    end
  end

  test "the database rejects a second reaction on the same subject" do
    user = user_fixture()
    {:ok, _} = %Reaction{} |> Reaction.changeset(valid_attrs(user)) |> Repo.insert()

    assert {:error, changeset} =
             %Reaction{}
             |> Reaction.changeset(%{valid_attrs(user) | value: "down"})
             |> Repo.insert()

    assert %{user_id: ["has already reacted to this"]} = errors_on(changeset)
  end

  test "the check constraint holds even when the changeset is bypassed" do
    user = user_fixture()

    assert_raise Postgrex.Error, fn ->
      Repo.insert_all("reactions", [
        %{
          user_id: user.id,
          subject_type: "place",
          subject_id: 1,
          value: "sideways",
          inserted_at: DateTime.utc_now() |> DateTime.truncate(:second),
          updated_at: DateTime.utc_now() |> DateTime.truncate(:second)
        }
      ])
    end
  end
end
```

- [ ] **Step 4: Run test to verify it fails**

Run: `mix test test/ethos/social/reaction_test.exs`
Expected: FAIL — `module Ethos.Social.Reaction is not available`.

- [ ] **Step 5: Write the implementation**

Create `lib/ethos/social/reaction.ex`:

```elixir
defmodule Ethos.Social.Reaction do
  @moduledoc """
  One person's thumbs up or thumbs down on one subject.

  Deliberately has no moderation state. A reaction carries no text, so
  there is nothing to moderate — that is the whole reason thumbs are
  instant and reviews are not.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Ethos.Social.Subject

  @values ~w(up down)

  schema "reactions" do
    belongs_to :user, Ethos.Accounts.User
    field :subject_type, :string
    field :subject_id, :integer
    field :value, :string

    timestamps(type: :utc_datetime)
  end

  def changeset(reaction, attrs) do
    reaction
    |> cast(attrs, [:user_id, :subject_type, :subject_id, :value])
    |> validate_required([:user_id, :subject_type, :subject_id, :value])
    |> validate_inclusion(:subject_type, Subject.types())
    |> validate_inclusion(:value, @values)
    |> unique_constraint([:user_id, :subject_type, :subject_id],
      name: :reactions_user_id_subject_type_subject_id_index,
      message: "has already reacted to this"
    )
  end
end
```

- [ ] **Step 6: Run tests**

Run: `mix test test/ethos/social/reaction_test.exs` then `mix test`
Expected: both pass, 0 failures.

- [ ] **Step 7: Commit**

```bash
mix format lib/ethos/social/reaction.ex test/ethos/social/reaction_test.exs priv/repo/migrations/20260906120000_create_reactions.exs
git add lib/ethos/social/reaction.ex test/ethos/social/reaction_test.exs priv/repo/migrations/20260906120000_create_reactions.exs
git commit -m "feat: reactions table and schema"
```

---

### Task 3: The Social context — react and count

**Files:**
- Create: `lib/ethos/social.ex`
- Test: `test/ethos/social_test.exs`

**Interfaces:**
- Consumes: `Subject.ref/1` (Task 1), `Reaction.changeset/2` (Task 2).
- Produces:
  - `Social.react(user, subject, value)` → `{:ok, :added}` | `{:ok, :switched}` | `{:ok, :cleared}` | `{:error, changeset}`
  - `Social.counts(subject)` → `%{up: integer, down: integer}`
  - `Social.user_reaction(user_or_nil, subject)` → `"up"` | `"down"` | `nil`

- [ ] **Step 1: Write the failing test**

Create `test/ethos/social_test.exs`:

```elixir
defmodule Ethos.SocialTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Social

  setup do
    %{user: user_fixture(), guide: guide_fixture()}
  end

  describe "react/3 toggle semantics" do
    test "no existing reaction inserts one", %{user: user, guide: guide} do
      assert {:ok, :added} = Social.react(user, guide, "up")
      assert Social.user_reaction(user, guide) == "up"
    end

    test "the opposite value switches it", %{user: user, guide: guide} do
      {:ok, :added} = Social.react(user, guide, "up")

      assert {:ok, :switched} = Social.react(user, guide, "down")
      assert Social.user_reaction(user, guide) == "down"
      assert Social.counts(guide) == %{up: 0, down: 1}
    end

    test "the same value clears it", %{user: user, guide: guide} do
      {:ok, :added} = Social.react(user, guide, "up")

      assert {:ok, :cleared} = Social.react(user, guide, "up")
      assert Social.user_reaction(user, guide) == nil
      assert Social.counts(guide) == %{up: 0, down: 0}
    end

    test "clearing then reacting again works", %{user: user, guide: guide} do
      {:ok, :added} = Social.react(user, guide, "up")
      {:ok, :cleared} = Social.react(user, guide, "up")

      assert {:ok, :added} = Social.react(user, guide, "down")
      assert Social.counts(guide) == %{up: 0, down: 1}
    end

    test "rejects a value that is neither up nor down", %{user: user, guide: guide} do
      assert {:error, changeset} = Social.react(user, guide, "sideways")
      assert %{value: ["is invalid"]} = errors_on(changeset)
    end
  end

  describe "counts/1" do
    test "zero for a subject nobody has touched", %{guide: guide} do
      assert Social.counts(guide) == %{up: 0, down: 0}
    end

    test "tallies each value separately", %{guide: guide} do
      for _ <- 1..3, do: Social.react(user_fixture(), guide, "up")
      Social.react(user_fixture(), guide, "down")

      assert Social.counts(guide) == %{up: 3, down: 1}
    end

    test "counts are per subject, not global", %{user: user, guide: guide} do
      other = guide_fixture()
      Social.react(user, guide, "up")

      assert Social.counts(guide) == %{up: 1, down: 0}
      assert Social.counts(other) == %{up: 0, down: 0}
    end

    test "a banned user's reaction does not count", %{guide: guide} do
      banned = user_fixture()
      Social.react(banned, guide, "up")
      Social.react(user_fixture(), guide, "up")

      banned
      |> Ecto.Changeset.change(banned_at: DateTime.utc_now() |> DateTime.truncate(:second))
      |> Repo.update!()

      assert Social.counts(guide) == %{up: 1, down: 0}
    end
  end

  describe "user_reaction/2" do
    test "nil for a logged-out visitor", %{guide: guide} do
      assert Social.user_reaction(nil, guide) == nil
    end

    test "nil when the user has not reacted", %{user: user, guide: guide} do
      assert Social.user_reaction(user, guide) == nil
    end
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/social_test.exs`
Expected: FAIL — `module Ethos.Social is not available`.

- [ ] **Step 3: Write the implementation**

Create `lib/ethos/social.ex`:

```elixir
defmodule Ethos.Social do
  @moduledoc """
  Reactions, and the counts drawn from them.

  Every query that touches the `reactions` table lives here. Callers pass
  subject structs and get plain data back; nothing outside this module
  needs to know that reactions are stored polymorphically.

  Counts are computed on read rather than denormalised onto the subject.
  At this scale the grouped query is sub-millisecond with the index from
  the reactions migration, and a counter cache is the classic source of
  drift. If it ever matters, adding one is a change behind this API.
  """

  import Ecto.Query, warn: false

  alias Ethos.Accounts.User
  alias Ethos.Repo
  alias Ethos.Social.Reaction
  alias Ethos.Social.Subject

  @doc """
  Records `user`'s reaction to `subject`.

  Toggle semantics, which are what a thumbs button has to do:

    * nothing yet → insert, `{:ok, :added}`
    * the opposite value → update, `{:ok, :switched}`
    * the same value again → delete, `{:ok, :cleared}`

  The same-value case is what makes the button un-clickable: a second
  click on thumbs-up takes it back rather than doing nothing.
  """
  def react(%User{} = user, subject, value) do
    {type, id} = Subject.ref(subject)

    case Repo.get_by(Reaction, user_id: user.id, subject_type: type, subject_id: id) do
      nil ->
        %Reaction{}
        |> Reaction.changeset(%{
          user_id: user.id,
          subject_type: type,
          subject_id: id,
          value: value
        })
        |> Repo.insert()
        |> case do
          {:ok, _reaction} -> {:ok, :added}
          {:error, changeset} -> {:error, changeset}
        end

      %Reaction{value: ^value} = existing ->
        Repo.delete!(existing)
        {:ok, :cleared}

      existing ->
        existing
        |> Reaction.changeset(%{value: value})
        |> Repo.update()
        |> case do
          {:ok, _reaction} -> {:ok, :switched}
          {:error, changeset} -> {:error, changeset}
        end
    end
  end

  @doc """
  Public thumbs tally for a subject, as `%{up: n, down: n}`.

  Excludes banned users. The join is what enforces that, so a ban takes
  effect on every page the moment it is applied, with no backfill.
  """
  def counts(subject) do
    {type, id} = Subject.ref(subject)

    tally =
      Repo.all(
        from r in Reaction,
          join: u in User,
          on: u.id == r.user_id,
          where: r.subject_type == ^type and r.subject_id == ^id and is_nil(u.banned_at),
          group_by: r.value,
          select: {r.value, count(r.id)}
      )
      |> Map.new()

    %{up: Map.get(tally, "up", 0), down: Map.get(tally, "down", 0)}
  end

  @doc "This user's own reaction to a subject, or nil. `nil` user is a logged-out visitor."
  def user_reaction(nil, _subject), do: nil

  def user_reaction(%User{} = user, subject) do
    {type, id} = Subject.ref(subject)

    case Repo.get_by(Reaction, user_id: user.id, subject_type: type, subject_id: id) do
      nil -> nil
      reaction -> reaction.value
    end
  end
end
```

- [ ] **Step 4: Run tests**

Run: `mix test test/ethos/social_test.exs` then `mix test`
Expected: both pass, 0 failures.

- [ ] **Step 5: Commit**

```bash
mix format lib/ethos/social.ex test/ethos/social_test.exs
git add lib/ethos/social.ex test/ethos/social_test.exs
git commit -m "feat: Social context with reaction toggle and counts"
```

---

### Task 4: Badge count queries on reactions

These four functions mirror the ones in `Ethos.Visits` exactly, but count distinct places a user has reacted to. Added alongside the existing `Ethos.Visits`, which still works — nothing switches over yet.

**Files:**
- Modify: `lib/ethos/social.ex`
- Test: `test/ethos/social_test.exs`

**Interfaces:**
- Consumes: `Reaction` schema, `Ethos.Places.Place`.
- Produces: `Social.reacted_place_count/1`, `Social.reacted_place_count_by_town/2`, `Social.reacted_place_count_by_kinds/2`, `Social.reacted_place_count_in_county/3` — all → integer.

- [ ] **Step 1: Write the failing test**

Append to `test/ethos/social_test.exs`, inside the `defmodule`:

```elixir
  describe "badge count queries" do
    import Ethos.PlacesFixtures

    setup do
      user = user_fixture()

      # `Place.changeset/2` does NOT cast town_slug/county_slug/state_slug — it
      # DERIVES them from town/state/county. Passing a slug key here would be
      # silently dropped and every place would land in the same town, making the
      # by-town and by-county assertions below pass while proving nothing.
      # Always set the human-readable name; assert against the derived slug.
      open = fn attrs ->
        place_fixture(
          Enum.into(attrs, %{
            status: "open",
            state: "Connecticut",
            county: "New Haven County",
            town: "Waterbury",
            kind: "museum"
          })
        )
      end

      %{user: user, open: open}
    end

    test "counts every place the user reacted to, thumbs up or down", %{user: user, open: open} do
      Social.react(user, open.(%{}), "up")
      Social.react(user, open.(%{}), "down")

      assert Social.reacted_place_count(user) == 2
    end

    test "a thumbs-down earns badge progress exactly like a thumbs-up", %{user: user, open: open} do
      Social.react(user, open.(%{}), "down")

      assert Social.reacted_place_count(user) == 1
    end

    test "clearing a reaction removes the progress", %{user: user, open: open} do
      place = open.(%{})
      Social.react(user, place, "up")
      Social.react(user, place, "up")

      assert Social.reacted_place_count(user) == 0
    end

    test "another user's reactions do not count", %{user: user, open: open} do
      Social.react(user_fixture(), open.(%{}), "up")

      assert Social.reacted_place_count(user) == 0
    end

    test "reactions on guides do not count toward place badges", %{user: user} do
      Social.react(user, guide_fixture(), "up")

      assert Social.reacted_place_count(user) == 0
    end

    test "by town", %{user: user, open: open} do
      Social.react(user, open.(%{town: "Waterbury"}), "up")
      Social.react(user, open.(%{town: "Danbury"}), "up")

      assert Social.reacted_place_count_by_town(user, "waterbury") == 1
    end

    test "by kinds", %{user: user, open: open} do
      Social.react(user, open.(%{kind: "cafe"}), "up")
      Social.react(user, open.(%{kind: "brewery"}), "up")
      Social.react(user, open.(%{kind: "museum"}), "up")

      assert Social.reacted_place_count_by_kinds(user, ["cafe", "brewery"]) == 2
    end

    test "in county", %{user: user, open: open} do
      Social.react(user, open.(%{county: "New Haven County"}), "up")
      Social.react(user, open.(%{county: "Fairfield County"}), "up")

      # "New Haven County" derives to "new-haven-county" — the -county suffix is
      # part of the slug, as the existing badge key county-complete-new-haven-county
      # already shows.
      assert Social.reacted_place_count_in_county(user, "connecticut", "new-haven-county") == 1
    end
  end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/social_test.exs`
Expected: FAIL — `function Ethos.Social.reacted_place_count/1 is undefined`.

If it instead fails with `module Ethos.PlacesFixtures is not available` or an
argument error from `place_fixture/1`, open `test/support/fixtures/` and check
what the place fixture is actually called and what keys it accepts, then adjust
the `setup` block above to match. Do not invent a new fixture module.

- [ ] **Step 3: Write the implementation**

Append to `lib/ethos/social.ex`, before the final `end`:

```elixir
  ## Badge counts
  #
  # These four replace the identically shaped functions that used to live in
  # `Ethos.Visits`. The rule the spec settled on is that ANY reaction counts
  # as having been there — a thumbs-down is still a visit, and someone who
  # disliked five museums has still seen five museums.

  @doc "How many distinct places this user has reacted to."
  def reacted_place_count(%User{} = user) do
    user |> reacted_places_query() |> Repo.aggregate(:count, :id)
  end

  @doc "How many places in one town this user has reacted to."
  def reacted_place_count_by_town(%User{} = user, town_slug) do
    user
    |> reacted_places_query()
    |> where([_r, p], p.town_slug == ^town_slug)
    |> Repo.aggregate(:count, :id)
  end

  @doc "How many places of the given kinds this user has reacted to."
  def reacted_place_count_by_kinds(%User{} = user, kinds) do
    user
    |> reacted_places_query()
    |> where([_r, p], p.kind in ^kinds)
    |> Repo.aggregate(:count, :id)
  end

  @doc "How many places in one county this user has reacted to."
  def reacted_place_count_in_county(%User{} = user, state_slug, county_slug) do
    user
    |> reacted_places_query()
    |> where([_r, p], p.state_slug == ^state_slug and p.county_slug == ^county_slug)
    |> Repo.aggregate(:count, :id)
  end

  # The join to `places` is what restricts these to place reactions: a
  # reaction on a guide whose id happens to match a place id cannot match,
  # because subject_type is pinned to "place" first.
  defp reacted_places_query(%User{} = user) do
    from r in Reaction,
      join: p in Ethos.Places.Place,
      on: p.id == r.subject_id,
      where: r.user_id == ^user.id and r.subject_type == "place"
  end
```

- [ ] **Step 4: Run tests**

Run: `mix test test/ethos/social_test.exs` then `mix test`
Expected: both pass, 0 failures.

- [ ] **Step 5: Commit**

```bash
mix format lib/ethos/social.ex test/ethos/social_test.exs
git add lib/ethos/social.ex test/ethos/social_test.exs
git commit -m "feat: badge count queries over reactions"
```

---

### Task 5: The SocialLive island

Embedded in the three show pages. The old "I've been here" button stays for now — it is removed in Task 7, once nothing depends on it. For one commit a place page shows both; that is deliberate, so that no commit leaves a place page with no interaction at all.

**Files:**
- Create: `lib/ethos_web/live/social_live.ex`
- Modify: `lib/ethos_web/controllers/place_html/show.html.heex` (immediately before `<EthosWeb.ConnectedPages.connected_pages ...>`)
- Modify: `lib/ethos_web/controllers/guide_html/show.html.heex` (immediately before `<EthosWeb.ConnectedPages.connected_pages ...>`, line ~180)
- Modify: `lib/ethos_web/controllers/collection_html/show.html.heex` (at the end, before `</article>`)
- Test: `test/ethos_web/live/social_live_test.exs`

**Interfaces:**
- Consumes: `Social.react/3`, `Social.counts/1`, `Social.user_reaction/2` (Tasks 3), `Subject.get!/2` (Task 1), `Accounts.needs_username?/1` (Plan 1).
- Produces: `EthosWeb.SocialLive`, mounted with `session: %{"subject_type" => binary, "subject_id" => integer}`.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/live/social_live_test.exs`:

```elixir
defmodule EthosWeb.SocialLiveTest do
  use EthosWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Social

  setup do
    %{guide: guide_fixture(%{status: "published"})}
  end

  describe "rendering inside the guide page" do
    test "a logged-out visitor sees counts and a login prompt", %{conn: conn, guide: guide} do
      Social.react(user_fixture(), guide, "up")

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html =~ "Log in to react"
      assert html =~ "1"
    end

    test "a logged-in user gets working buttons", %{conn: conn, guide: guide} do
      user = user_fixture()
      conn = log_in_user(conn, user)

      {:ok, view, _html} = live_isolated_social(conn, guide)

      assert has_element?(view, "button[phx-value-value=up]")
      assert has_element?(view, "button[phx-value-value=down]")
    end
  end

  describe "reacting" do
    setup %{conn: conn} do
      %{conn: log_in_user(conn, user_fixture())}
    end

    test "clicking up records a reaction and shows the count", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_isolated_social(conn, guide)

      html = view |> element("button[phx-value-value=up]") |> render_click()

      assert html =~ "1"
      assert Social.counts(guide) == %{up: 1, down: 0}
    end

    test "clicking up twice clears it", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_isolated_social(conn, guide)

      view |> element("button[phx-value-value=up]") |> render_click()
      view |> element("button[phx-value-value=up]") |> render_click()

      assert Social.counts(guide) == %{up: 0, down: 0}
    end

    test "clicking down after up switches", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_isolated_social(conn, guide)

      view |> element("button[phx-value-value=up]") |> render_click()
      view |> element("button[phx-value-value=down]") |> render_click()

      assert Social.counts(guide) == %{up: 0, down: 1}
    end
  end

  describe "provisional usernames" do
    test "a user who has not chosen a username is prompted instead", %{conn: conn, guide: guide} do
      user =
        user_fixture()
        |> Ecto.Changeset.change(username_provisional: true)
        |> Ethos.Repo.update!()

      {:ok, view, html} = live_isolated_social(log_in_user(conn, user), guide)

      assert html =~ "Pick a username"
      refute has_element?(view, "button[phx-value-value=up]")
    end

    test "the event handler refuses even if the button is forged", %{conn: conn, guide: guide} do
      user =
        user_fixture()
        |> Ecto.Changeset.change(username_provisional: true)
        |> Ethos.Repo.update!()

      {:ok, view, _html} = live_isolated_social(log_in_user(conn, user), guide)

      render_click(view, "react", %{"value" => "up"})

      assert Social.counts(guide) == %{up: 0, down: 0}
    end
  end

  defp live_isolated_social(conn, guide) do
    live_isolated(conn, EthosWeb.SocialLive,
      session: %{"subject_type" => "guide", "subject_id" => guide.id}
    )
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos_web/live/social_live_test.exs`
Expected: FAIL — `module EthosWeb.SocialLive is not available`.

- [ ] **Step 3: Write the LiveView**

Create `lib/ethos_web/live/social_live.ex`:

```elixir
defmodule EthosWeb.SocialLive do
  @moduledoc """
  The social block, embedded in the place, guide and collection show pages.

  Those pages are plain controllers, and they stay that way: all of the
  SEO work — JSON-LD, canonical URLs, OG cards, meta descriptions — lives
  in those controllers, and converting them to LiveViews would rewrite
  code other branches are actively editing for no user-visible gain. So
  this renders as an island via `live_render/3` instead. It server-renders
  on first paint, which is what keeps the content indexable.

  One LiveView serves all three subject types; `Ethos.Social.Subject` is
  what knows the difference.
  """
  use EthosWeb, :live_view

  on_mount {EthosWeb.UserAuth, :mount_current_user}

  alias Ethos.Accounts
  alias Ethos.Social
  alias Ethos.Social.Subject

  def mount(_params, %{"subject_type" => type, "subject_id" => id}, socket) do
    subject = Subject.get!(type, id)

    {:ok, socket |> assign(subject: subject) |> load_reactions()}
  end

  def render(assigns) do
    ~H"""
    <section class="mt-10 rounded-xl border p-5">
      <h2 class="text-sm font-semibold uppercase tracking-wide text-zinc-500">
        What travelers think
      </h2>

      <div class="mt-4 flex items-start gap-8">
        <.thumb
          value="up"
          label="👍"
          count={@counts.up}
          mine={@mine == "up"}
          interactive={@interactive}
        />
        <.thumb
          value="down"
          label="👎"
          count={@counts.down}
          mine={@mine == "down"}
          interactive={@interactive}
        />
      </div>

      <p :if={@prompt} class="mt-4 text-sm text-zinc-500">{@prompt}</p>
    </section>
    """
  end

  attr :value, :string, required: true
  attr :label, :string, required: true
  attr :count, :integer, required: true
  attr :mine, :boolean, required: true
  attr :interactive, :boolean, required: true

  # The count sits directly beneath its own button, so "34 people liked this"
  # reads off the layout without a legend.
  defp thumb(assigns) do
    ~H"""
    <div class="flex flex-col items-center gap-1">
      <button
        :if={@interactive}
        type="button"
        phx-click="react"
        phx-value-value={@value}
        aria-pressed={to_string(@mine)}
        class={[
          "rounded-lg border px-4 py-2 text-xl transition",
          @mine && "border-zinc-900 bg-zinc-100",
          !@mine && "hover:bg-zinc-50"
        ]}
      >
        {@label}
      </button>
      <span :if={!@interactive} class="rounded-lg border px-4 py-2 text-xl opacity-60">
        {@label}
      </span>
      <span class="text-sm font-medium text-zinc-600">{@count}</span>
    </div>
    """
  end

  def handle_event("react", %{"value" => value}, socket) do
    # Checked here and not only in the template: the buttons are absent for a
    # visitor who may not react, but a crafted socket message does not care
    # what the template rendered.
    if socket.assigns.interactive do
      Social.react(socket.assigns.current_user, socket.assigns.subject, value)
      {:noreply, load_reactions(socket)}
    else
      {:noreply, socket}
    end
  end

  defp load_reactions(socket) do
    user = socket.assigns[:current_user]
    subject = socket.assigns.subject

    assign(socket,
      counts: Social.counts(subject),
      mine: Social.user_reaction(user, subject),
      interactive: interactive?(user),
      prompt: prompt_for(user)
    )
  end

  defp interactive?(nil), do: false
  defp interactive?(user), do: not Accounts.needs_username?(user)

  defp prompt_for(nil), do: "Log in to react."

  defp prompt_for(user) do
    if Accounts.needs_username?(user), do: "Pick a username to join in.", else: nil
  end
end
```

- [ ] **Step 4: Run the LiveView test**

Run: `mix test test/ethos_web/live/social_live_test.exs`
Expected: PASS.

**If the logged-in tests fail because `@current_user` is `nil`**, the session
passed by `live_render/3` did not carry the auth token. Fix it by passing the
token explicitly from each template — add
`"user_token" => Plug.Conn.get_session(@conn, :user_token)` to the session map
in Step 5 — rather than by weakening the `interactive?` check.

- [ ] **Step 5: Mount the island in all three templates**

In `lib/ethos_web/controllers/place_html/show.html.heex`, immediately before the
`<EthosWeb.ConnectedPages.connected_pages ... />` line:

```heex
  {live_render(@conn, EthosWeb.SocialLive,
    id: "social-place-#{@place.id}",
    session: %{"subject_type" => "place", "subject_id" => @place.id})}
```

In `lib/ethos_web/controllers/guide_html/show.html.heex`, immediately before its
`<EthosWeb.ConnectedPages.connected_pages ... />` line:

```heex
  {live_render(@conn, EthosWeb.SocialLive,
    id: "social-guide-#{@guide.id}",
    session: %{"subject_type" => "guide", "subject_id" => @guide.id})}
```

In `lib/ethos_web/controllers/collection_html/show.html.heex`, immediately before
the closing `</article>`:

```heex
  {live_render(@conn, EthosWeb.SocialLive,
    id: "social-collection-#{@collection.id}",
    session: %{"subject_type" => "collection", "subject_id" => @collection.id})}
```

- [ ] **Step 6: Run the full suite**

Run: `mix test`
Expected: 0 failures. Existing place, guide, and collection controller tests now
render the island too — if any fails on an unexpected string, read the failure
before changing anything; a controller test asserting exact page content may
legitimately need the new section accounted for.

- [ ] **Step 7: Commit**

```bash
mix format lib/ethos_web/live/social_live.ex test/ethos_web/live/social_live_test.exs lib/ethos_web/controllers/place_html/show.html.heex lib/ethos_web/controllers/guide_html/show.html.heex lib/ethos_web/controllers/collection_html/show.html.heex
git add lib/ethos_web/live/social_live.ex test/ethos_web/live/social_live_test.exs lib/ethos_web/controllers/place_html/show.html.heex lib/ethos_web/controllers/guide_html/show.html.heex lib/ethos_web/controllers/collection_html/show.html.heex
git commit -m "feat: thumbs up and down on places, guides and collections"
```

---

### Task 6: Point badges at reactions

`place_visits` still exists after this task; `Ethos.Badges` simply stops reading it.

**Files:**
- Modify: `lib/ethos/badges.ex` (the three `rule_met?/3` clauses and the `Visits` alias)
- Modify: `lib/ethos/social.ex` (award badges from `react/3`)
- Test: `test/ethos/badges_test.exs`
- Test: `test/ethos_web/controllers/badge_controller_test.exs` — records a visit and then
  calls `Badges.check_and_award/2`, asserting "Earned" renders. Once badges count
  reactions, a visit awards nothing and that assertion fails. This file breaks in THIS
  task, not in Task 7.

**Interfaces:**
- Consumes: `Social.reacted_place_count*` (Task 4), `Social.react/3` (Task 3).
- Produces: `Ethos.Badges.check_and_award/2` now driven by reactions. `Social.react/3` returns the same tuples as before, and additionally awards badges as a side effect on place reactions.

- [ ] **Step 1: Rewrite the badge test's helper**

`test/ethos/badges_test.exs` records visits through a `visit!/2` helper and every
test reads the badges it returns. Change the helper, not the assertions.

There is a trap here. Once Step 4 makes `Social.react/3` award badges itself,
a helper that reacts and *then* calls `Badges.check_and_award/2` would get back
`[]` every time — the badges were already awarded by the reaction — and every
assertion in the file would fail. So the helper must report what the reaction
awarded, by diffing.

Replace the alias line:

```elixir
  alias Ethos.{Badges, Places, Social}
```

Replace `visit!/2` entirely with:

```elixir
  # Reacting awards badges as a side effect, so this reports the difference
  # rather than calling check_and_award/2 a second time — a second call always
  # returns [] because the badges already landed. Shaped as %{key: ...} maps so
  # every existing assertion below still reads `& &1.key`.
  defp visit!(user, place) do
    before = MapSet.new(Badges.earned_badges(user), & &1.badge_key)

    {:ok, _outcome} = Social.react(user, place, "up")

    Badges.earned_badges(user)
    |> Enum.reject(&MapSet.member?(before, &1.badge_key))
    |> Enum.map(&%{key: &1.badge_key})
  end
```

In the test `"un-visiting does not revoke badges"`, replace the un-visit line:

```elixir
    {:ok, :unvisited} = Visits.toggle_visit(user, p)
```

with the equivalent clear — reacting the same way twice removes the reaction:

```elixir
    {:ok, :cleared} = Social.react(user, p, "up")
```

Leave every `assert` in the file exactly as it is. If one of them fails after
this change, that is a real regression in badge behaviour, not a stale test.

- [ ] **Step 2: Add tests for the reaction-specific rules**

Append these inside the `defmodule` in `test/ethos/badges_test.exs`:

```elixir
  describe "reactions drive badges" do
    import Ethos.AccountsFixtures
    import Ethos.PlacesFixtures

    test "a thumbs-down earns badge progress" do
      user = user_fixture()
      place = place_fixture(%{status: "open"})

      Ethos.Social.react(user, place, "down")

      assert Enum.any?(Ethos.Badges.earned_badges(user), &(&1.badge_key == "first-steps"))
    end

    test "clearing a reaction does not revoke an earned badge" do
      user = user_fixture()
      place = place_fixture(%{status: "open"})

      Ethos.Social.react(user, place, "up")
      Ethos.Social.react(user, place, "up")

      assert Enum.any?(Ethos.Badges.earned_badges(user), &(&1.badge_key == "first-steps"))
    end

    test "a reaction on a guide awards nothing" do
      user = user_fixture()

      Ethos.Social.react(user, Ethos.GuidesFixtures.guide_fixture(), "up")

      assert Ethos.Badges.earned_badges(user) == []
    end
  end
```

- [ ] **Step 3: Run test to verify it fails**

Run: `mix test test/ethos/badges_test.exs`
Expected: FAIL — badges are still counted from `place_visits`, which reacting does not write.

- [ ] **Step 4: Re-point the badge rules**

In `lib/ethos/badges.ex`, replace `alias Ethos.Visits` with `alias Ethos.Social`,
and replace the three counting `rule_met?/3` clauses:

```elixir
  defp rule_met?({:total, n}, user, _place), do: Social.reacted_place_count(user) >= n

  defp rule_met?({:town, town_slug, n}, user, _place),
    do: Social.reacted_place_count_by_town(user, town_slug) >= n

  defp rule_met?({:kinds, kinds, n}, user, _place),
    do: Social.reacted_place_count_by_kinds(user, kinds) >= n
```

And in the `{:county_complete, ...}` clause, replace the
`Visits.count_for_user_in_county(user, state_slug, county_slug)` call with:

```elixir
      Social.reacted_place_count_in_county(user, state_slug, county_slug) >=
```

Leave the badge definitions, thresholds, town overrides, and the `rescue` clause
in `check_and_award/2` exactly as they are.

- [ ] **Step 5: Award badges when reacting**

In `lib/ethos/social.ex`, add `alias Ethos.Places.Place` to the aliases, and make
`react/3` award badges after a successful place reaction. Wrap the existing body
so the return value is unchanged:

```elixir
  def react(%User{} = user, subject, value) do
    case do_react(user, subject, value) do
      {:ok, outcome} ->
        maybe_award_badges(user, subject)
        {:ok, outcome}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  # Badges are awarded for reacting to a place at all — see the badge count
  # functions below for why a thumbs-down counts. Never awarded for guides or
  # collections, which have no badge rules.
  #
  # `check_and_award/2` has its own rescue clause, so a badge failure cannot
  # break the reaction. That property is load-bearing: reacting must never
  # fail because badge evaluation did.
  defp maybe_award_badges(user, %Place{} = place), do: Ethos.Badges.check_and_award(user, place)
  defp maybe_award_badges(_user, _subject), do: :ok
```

Rename the existing `react/3` body to `defp do_react(%User{} = user, subject, value) do`.

Note that `Ethos.Social` and `Ethos.Badges` now call each other. That is fine in
Elixir — both are plain remote calls, no macros or structs cross the boundary, so
there is no compile-time cycle. The spec puts awarding in `react/3` deliberately:
it is the one place every reaction passes through.

- [ ] **Step 6: Fix the badge controller test**

`test/ethos_web/controllers/badge_controller_test.exs` records a visit with
`Visits.toggle_visit/2`, calls `Badges.check_and_award/2`, and asserts the page
renders "Earned". After Step 4 a visit awards nothing, so that assertion fails.

Replace the alias line:

```elixir
  alias Ethos.{Badges, Places, Social}
```

and replace these two lines:

```elixir
    {:ok, :visited} = Visits.toggle_visit(user, place)
    Badges.check_and_award(user, place)
```

with a single reaction, which now awards badges itself:

```elixir
    {:ok, :added} = Social.react(user, place, "up")
```

Leave the three `assert html =~ ...` lines exactly as they are. They are what proves the
badges page still works end to end.

- [ ] **Step 7: Run tests**

Run: `mix test test/ethos/badges_test.exs test/ethos_web/controllers/badge_controller_test.exs test/ethos/social_test.exs`
then `mix test`
Expected: both pass, 0 failures.

- [ ] **Step 8: Commit**

```bash
mix format lib/ethos/badges.ex lib/ethos/social.ex test/ethos/badges_test.exs test/ethos_web/controllers/badge_controller_test.exs
git add lib/ethos/badges.ex lib/ethos/social.ex test/ethos/badges_test.exs test/ethos_web/controllers/badge_controller_test.exs
git commit -m "feat: badges count reactions instead of visits"
```

---

### Task 7: Migrate visits into reactions and delete the visit feature

The last task. Nothing reads `place_visits` any more, so it can go — but only after its rows become reactions.

**Files:**
- Create: `priv/repo/migrations/20260906130000_migrate_visits_to_reactions.exs`
- Delete: `lib/ethos/visits.ex`, `lib/ethos/visits/place_visit.ex`, `test/ethos/visits_test.exs`, `test/ethos_web/controllers/place_visit_test.exs`
- Modify: `lib/ethos_web/controllers/place_controller.ex` (drop `visit/2` and the `visited?` assign)
- Modify: `lib/ethos_web/controllers/place_html/show.html.heex` (drop the "I've been here" form)
- Modify: `lib/ethos_web/router.ex` (drop `post "/p/:slug/visit"`)

**Interfaces:**
- Consumes: everything from Tasks 1–6.
- Produces: no `place_visits` table, no `Ethos.Visits` module, no `POST /p/:slug/visit` route.

- [ ] **Step 1: Write the migration**

Create `priv/repo/migrations/20260906130000_migrate_visits_to_reactions.exs`:

```elixir
defmodule Ethos.Repo.Migrations.MigrateVisitsToReactions do
  use Ecto.Migration

  @moduledoc """
  Converts every "I've been here" check-off into a thumbs-up, then drops the
  table.

  Continuity is the requirement: the badge system used to count rows in
  `place_visits`, and now counts reactions. Without this conversion every
  user would silently lose every badge they had earned. The conversion runs
  BEFORE the drop and in the same migration, so a failure leaves the visit
  data intact.
  """

  def up do
    # ON CONFLICT because Task 5 shipped the thumbs UI before this migration
    # runs: a user may already have reacted to a place they had also checked
    # off. Their existing reaction — which may be a thumbs-down they chose
    # deliberately — wins over the implied thumbs-up from the old button.
    execute """
    INSERT INTO reactions (user_id, subject_type, subject_id, value, inserted_at, updated_at)
    SELECT user_id, 'place', place_id, 'up', inserted_at, updated_at
    FROM place_visits
    ON CONFLICT (user_id, subject_type, subject_id) DO NOTHING
    """

    drop table(:place_visits)
  end

  def down do
    create table(:place_visits) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :place_id, references(:places, on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end

    # Both indexes, matching 20260822123000_create_place_visits.exs exactly — that
    # migration creates a unique index AND a plain index on :place_id. A `down` that
    # restores only one of them leaves the schema subtly different from what it dropped.
    create unique_index(:place_visits, [:user_id, :place_id])
    create index(:place_visits, [:place_id])

    execute """
    INSERT INTO place_visits (user_id, place_id, inserted_at, updated_at)
    SELECT user_id, subject_id, inserted_at, updated_at
    FROM reactions
    WHERE subject_type = 'place' AND value = 'up'
    """
  end
end
```

- [ ] **Step 2: Write the continuity test**

Create `test/ethos/social/visit_migration_test.exs`:

```elixir
defmodule Ethos.Social.VisitMigrationTest do
  @moduledoc """
  The migration itself cannot be tested after the fact — the test database is
  already migrated and `place_visits` is gone. What CAN be tested, and is what
  actually matters, is that a user holding the reactions the migration produces
  still earns the badges they had.
  """
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  import Ethos.PlacesFixtures

  test "a user with five Waterbury reactions holds Brass City Explorer" do
    user = user_fixture()

    # `town`, not `town_slug` — the changeset derives the slug and silently
    # ignores a slug key.
    for _ <- 1..5 do
      place = place_fixture(%{status: "open", town: "Waterbury"})
      Ethos.Social.react(user, place, "up")
    end

    keys = Enum.map(Ethos.Badges.earned_badges(user), & &1.badge_key)

    assert "explorer-waterbury" in keys
    assert "first-steps" in keys
  end
end
```

- [ ] **Step 3: Run the migration**

Run: `mix ecto.migrate`, then `mix ecto.rollback`, then `mix ecto.migrate`, then
`MIX_ENV=test mix ecto.migrate`
Expected: all succeed.

- [ ] **Step 4: Remove the visit feature**

Delete these four files:

```bash
git rm lib/ethos/visits.ex lib/ethos/visits/place_visit.ex test/ethos/visits_test.exs test/ethos_web/controllers/place_visit_test.exs
```

In `lib/ethos_web/router.ex`, delete the line `post "/p/:slug/visit", PlaceController, :visit`.

In `lib/ethos_web/controllers/place_controller.ex`, delete the whole `visit/2`
function, delete the `visited? =` binding in `show/2`, and remove `visited?:
visited?` from the `render/3` call. Leave every other assign alone — they feed
the SEO metadata.

In `lib/ethos_web/controllers/place_html/show.html.heex`, delete the entire
`<div :if={@place.status == "open"}>` block containing the "I've been here" form
and its logged-out "Log in to track places" link. Keep the "Copy link" button and
the surrounding `<div class="flex items-center gap-2">`.

- [ ] **Step 5: Run the full suite**

Run: `mix test`
Expected: 0 failures. Any remaining failure will be a test still referencing
`Ethos.Visits` or the removed route — update the test to react instead. Do not
reinstate the module.

- [ ] **Step 6: Commit**

```bash
mix format lib/ethos_web/controllers/place_controller.ex lib/ethos_web/controllers/place_html/show.html.heex lib/ethos_web/router.ex priv/repo/migrations/20260906130000_migrate_visits_to_reactions.exs test/ethos/social/visit_migration_test.exs
git add -A
git commit -m "feat: migrate visits to reactions and remove the visit feature"
```

---

## Done when

- `mix test` is green, with no reduction from the 805-test baseline.
- Places, guides, and collections all carry thumbs up and thumbs down with counts below each button.
- A second click on the same thumb clears it; clicking the other one switches it.
- A logged-out visitor sees the counts and a prompt to log in; a user with a provisional username sees a prompt to pick one, and the event handler refuses them even if the button is forged.
- Badges are earned by reacting, thumbs up or down, and a user who had earned a badge from `place_visits` still has it.
- `Ethos.Visits`, `place_visits`, and `POST /p/:slug/visit` no longer exist.

## Notes for Plan 3

- `Ethos.Social` and `Ethos.Social.Subject` are where reviews go. `Subject.get!/2` and `Subject.ref/1` already handle all three types.
- `SocialLive` is where the star picker and comment list mount. It already resolves `current_user`, so the review form inherits that.
- `Accounts.display_name/1` is what review bylines must call — never `user.username`. It has no `nil` clause.
- The `interactive?/1` + forged-event guard in `SocialLive` is the pattern Plan 3's review form should follow.
