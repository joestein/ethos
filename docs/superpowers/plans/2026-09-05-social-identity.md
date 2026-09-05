# Social Layer, Plan 1: Identity Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Give every user a public username that is separate from their email, so that when reviews land in Plan 3 the byline is a username and the email address is never rendered publicly.

**Architecture:** A `username` citext column on `users` with a companion `Ethos.Accounts.Username` module that owns the validation rules. One migration adds the column, backfills provisional usernames derived from email local-parts, and only then applies `null: false`. Registration takes username and email as separate fields. Existing users get a provisional name plus a picker at `/users/username`.

**Tech Stack:** Elixir 1.x, Phoenix 1.7, Phoenix LiveView, Ecto + PostgreSQL (citext), ExUnit, Bcrypt.

**Spec:** `docs/superpowers/specs/2026-09-05-social-layer-design.md`

## Global Constraints

- Username rules, used identically everywhere: 3–20 characters, `^[a-z0-9_]+$`, downcased and trimmed on cast.
- Reserved usernames: `admin`, `ethos`, `root`, `support`, `help`, `about`, `api`, `moderator`, `staff`, `system`, `anonymous`, `deleted`.
- The admin (the user whose email matches `Application.get_env(:ethos, :admin_email)`, configured as `cryptcom@gmail.com`) gets username `buoewe`, non-provisional.
- Email must never appear in public HTML. It may appear on `/users/settings`, which is the account's own page.
- `citext` is already enabled by `20260817144228_create_users_auth_tables.exs`. Do not re-enable it.
- Run the full suite with `mix test`. Baseline before this plan: **746 tests, 0 failures**. No task may reduce that number or add a failure.
- Run `mix format` before every commit.
- Database runs in Docker on port 54329 (`docker compose up -d`), matching `config/test.exs`.

---

### Task 1: Username rules module

The single source of truth for what a username may be. Pure functions, no Ecto, no Phoenix — so the schema, the migration, and the LiveView all agree without importing each other.

**Files:**
- Create: `lib/ethos/accounts/username.ex`
- Test: `test/ethos/accounts/username_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces: `Ethos.Accounts.Username.normalize/1` (binary → binary, passes non-binaries through), `reserved/0` (→ list of binary), `min_length/0` (→ 3), `max_length/0` (→ 20), `format/0` (→ Regex).

- [ ] **Step 1: Write the failing test**

Create `test/ethos/accounts/username_test.exs`:

```elixir
defmodule Ethos.Accounts.UsernameTest do
  use ExUnit.Case, async: true

  alias Ethos.Accounts.Username

  describe "normalize/1" do
    test "downcases and trims" do
      assert Username.normalize("  BuoEwe  ") == "buoewe"
    end

    test "passes non-binaries through untouched" do
      assert Username.normalize(nil) == nil
    end
  end

  describe "rules" do
    test "length bounds are 3 and 20" do
      assert Username.min_length() == 3
      assert Username.max_length() == 20
    end

    test "format accepts lowercase letters, digits and underscores" do
      assert Regex.match?(Username.format(), "buoewe_2")
    end

    test "format rejects anything else" do
      refute Regex.match?(Username.format(), "Buoewe")
      refute Regex.match?(Username.format(), "buo ewe")
      refute Regex.match?(Username.format(), "buo-ewe")
      refute Regex.match?(Username.format(), "buo.ewe")
    end

    test "reserved list includes the names that must never be claimed" do
      for name <- ~w(admin ethos root support moderator staff system anonymous deleted) do
        assert name in Username.reserved()
      end
    end
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/accounts/username_test.exs`
Expected: FAIL — `module Ethos.Accounts.Username is not available`.

- [ ] **Step 3: Write minimal implementation**

Create `lib/ethos/accounts/username.ex`:

```elixir
defmodule Ethos.Accounts.Username do
  @moduledoc """
  The rules a username must satisfy, in one place.

  Three callers need to agree on these rules and none of them can reasonably
  import the others: the `Ethos.Accounts.User` changeset, the backfill
  migration that invents usernames for pre-existing accounts, and the
  username picker LiveView. Pure functions with no Ecto and no Phoenix, so
  every caller can hold them.
  """

  @min_length 3
  @max_length 20
  @format ~r/^[a-z0-9_]+$/

  @reserved ~w(
    admin ethos root support help about api
    moderator staff system anonymous deleted
  )

  def min_length, do: @min_length
  def max_length, do: @max_length
  def format, do: @format
  def reserved, do: @reserved

  @doc """
  Canonical form: trimmed and downcased.

  Applied on cast so that `BuoEwe` and `buoewe` are the same name before
  uniqueness is ever checked. Non-binaries pass through so this is safe to
  hand a `nil` from an empty form field.
  """
  def normalize(value) when is_binary(value), do: value |> String.trim() |> String.downcase()
  def normalize(value), do: value
end
```

- [ ] **Step 4: Run test to verify it passes**

Run: `mix test test/ethos/accounts/username_test.exs`
Expected: PASS — 6 tests, 0 failures.

- [ ] **Step 5: Commit**

```bash
mix format
git add lib/ethos/accounts/username.ex test/ethos/accounts/username_test.exs
git commit -m "feat: username rules module"
```

---

### Task 2: Deriving usernames from emails

The backfill needs to invent a valid, unique username for every account that already exists. Pure functions again, so the logic is tested directly rather than through a migration.

**Files:**
- Modify: `lib/ethos/accounts/username.ex`
- Test: `test/ethos/accounts/username_test.exs`

**Interfaces:**
- Consumes: `Username.min_length/0`, `max_length/0`, `reserved/0` from Task 1.
- Produces: `Username.derive_from_email/1` (binary → binary, always valid against the Task 1 rules), `Username.uniquify/2` (binary, `MapSet` of taken names → binary not in the set).

- [ ] **Step 1: Write the failing test**

Append these two describe blocks inside the `defmodule` in `test/ethos/accounts/username_test.exs`:

```elixir
  describe "derive_from_email/1" do
    test "uses the local part" do
      assert Username.derive_from_email("cryptcom@gmail.com") == "cryptcom"
    end

    test "downcases" do
      assert Username.derive_from_email("JoeStein@example.com") == "joestein"
    end

    test "strips characters a username may not contain" do
      assert Username.derive_from_email("joe.stein+travel@example.com") == "joesteintravel"
    end

    test "truncates to the maximum length" do
      result = Username.derive_from_email("averyveryverylongnameindeed@example.com")
      assert String.length(result) == 20
      assert result == "averyveryverylongnam"
    end

    test "pads a local part that is too short" do
      assert Username.derive_from_email("jo@example.com") == "jo0"
    end

    test "pads a local part that strips down to nothing" do
      assert Username.derive_from_email("...@example.com") == "000"
    end

    test "always produces something the format accepts" do
      for email <- ["A@b.com", "j.o.e@x.io", "UPPER+tag@y.net", "..@z.org"] do
        derived = Username.derive_from_email(email)
        assert Regex.match?(Username.format(), derived)
        assert String.length(derived) >= Username.min_length()
        assert String.length(derived) <= Username.max_length()
      end
    end
  end

  describe "uniquify/2" do
    test "returns the base when it is free" do
      assert Username.uniquify("buoewe", MapSet.new()) == "buoewe"
    end

    test "appends a counter when the base is taken" do
      assert Username.uniquify("buoewe", MapSet.new(["buoewe"])) == "buoewe2"
    end

    test "keeps counting past the first collision" do
      taken = MapSet.new(["buoewe", "buoewe2", "buoewe3"])
      assert Username.uniquify("buoewe", taken) == "buoewe4"
    end

    test "keeps the result within the maximum length" do
      base = String.duplicate("a", 20)
      result = Username.uniquify(base, MapSet.new([base]))
      assert String.length(result) == 20
      assert String.ends_with?(result, "2")
    end
  end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/accounts/username_test.exs`
Expected: FAIL — `function Ethos.Accounts.Username.derive_from_email/1 is undefined`.

- [ ] **Step 3: Write minimal implementation**

Append to `lib/ethos/accounts/username.ex`, before the final `end`:

```elixir
  @doc """
  A valid username derived from an email address.

  Used only by the backfill migration, for accounts that predate usernames.
  The result is provisional — the user is asked to pick a real one — but it
  must still satisfy every rule above, because it is written straight to the
  column without passing through a changeset.
  """
  def derive_from_email(email) when is_binary(email) do
    email
    |> String.split("@")
    |> List.first()
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9_]/, "")
    |> String.slice(0, @max_length)
    |> pad()
  end

  defp pad(candidate) when byte_size(candidate) >= @min_length, do: candidate
  defp pad(candidate), do: String.pad_trailing(candidate, @min_length, "0")

  @doc """
  `base` if it is free, otherwise `base` with a counter appended.

  `taken` is a `MapSet` of names already spoken for. The counter is appended
  within the length limit rather than beyond it, so the result is always a
  legal username.
  """
  def uniquify(base, %MapSet{} = taken) do
    if MapSet.member?(taken, base), do: uniquify(base, taken, 2), else: base
  end

  defp uniquify(base, taken, counter) do
    suffix = Integer.to_string(counter)
    candidate = String.slice(base, 0, @max_length - String.length(suffix)) <> suffix

    if MapSet.member?(taken, candidate),
      do: uniquify(base, taken, counter + 1),
      else: candidate
  end
```

- [ ] **Step 4: Run test to verify it passes**

Run: `mix test test/ethos/accounts/username_test.exs`
Expected: PASS — 17 tests, 0 failures.

- [ ] **Step 5: Commit**

```bash
mix format
git add lib/ethos/accounts/username.ex test/ethos/accounts/username_test.exs
git commit -m "feat: derive and uniquify usernames from emails"
```

---

### Task 3: Migration — columns, backfill, constraints

Adds every column this whole social release needs on `users`, not just the username. The moderation columns (`trusted_at`, `banned_at`, `ban_reason`) are unused until Plan 3, but adding them now means one `ALTER TABLE` against production rather than two.

**Files:**
- Create: `priv/repo/migrations/20260905120000_add_usernames_and_moderation_fields_to_users.exs`

**Interfaces:**
- Consumes: `Username.derive_from_email/1`, `Username.uniquify/2`, `Username.reserved/0` from Tasks 1–2.
- Produces: `users.username` (citext, not null, unique), `users.username_provisional` (boolean, not null, default false), `users.trusted_at` (utc_datetime), `users.banned_at` (utc_datetime), `users.ban_reason` (text).

- [ ] **Step 1: Write the migration**

Create `priv/repo/migrations/20260905120000_add_usernames_and_moderation_fields_to_users.exs`:

```elixir
defmodule Ethos.Repo.Migrations.AddUsernamesAndModerationFieldsToUsers do
  use Ecto.Migration

  alias Ethos.Accounts.Username

  @admin_username "buoewe"

  def up do
    alter table(:users) do
      add :username, :citext
      add :username_provisional, :boolean, null: false, default: false
      add :trusted_at, :utc_datetime
      add :banned_at, :utc_datetime
      add :ban_reason, :text
    end

    flush()

    backfill_usernames()

    alter table(:users) do
      modify :username, :citext, null: false
    end

    create unique_index(:users, [:username])
  end

  def down do
    drop unique_index(:users, [:username])

    alter table(:users) do
      remove :username
      remove :username_provisional
      remove :trusted_at
      remove :banned_at
      remove :ban_reason
    end
  end

  # Calls into Ethos.Accounts.Username rather than freezing a copy of its
  # rules here.
  #
  # That breaks the usual "a migration must not depend on application code"
  # rule, and the exception is deliberate: every call below happens inside a
  # loop over rows that already exist. A fresh database has no users, so the
  # loop body never runs and the module is never reached — Elixir resolves
  # remote calls at runtime, so even deleting the module later would not
  # break `mix ecto.setup`. Any database that does reach these calls runs
  # this migration exactly once, so the rules cannot drift underneath it.
  defp backfill_usernames do
    %{rows: rows} = repo().query!("SELECT id, email FROM users ORDER BY id")

    admin_email = String.downcase(Application.get_env(:ethos, :admin_email) || "")

    # Seeded with the reserved names so that an account like
    # admin@example.com backfills to "admin2" rather than to a name the
    # changeset would later refuse.
    initial_taken = MapSet.new(Username.reserved())

    {updates, _taken} =
      Enum.map_reduce(rows, initial_taken, fn [id, email], taken ->
        admin? = String.downcase(email) == admin_email

        base = if admin?, do: @admin_username, else: Username.derive_from_email(email)
        username = Username.uniquify(base, taken)

        {{id, username, not admin?}, MapSet.put(taken, username)}
      end)

    Enum.each(updates, fn {id, username, provisional} ->
      repo().query!(
        "UPDATE users SET username = $1, username_provisional = $2 WHERE id = $3",
        [username, provisional, id]
      )
    end)
  end
end
```

- [ ] **Step 2: Run the migration and verify it applies**

Run: `mix ecto.migrate`
Expected: output ends with `create index users_username_index` and no error.

- [ ] **Step 3: Verify it rolls back cleanly**

Run: `mix ecto.rollback` then `mix ecto.migrate`
Expected: both succeed. A migration that cannot roll back is a migration you cannot undeploy.

- [ ] **Step 4: Verify the test database picks it up**

Run: `MIX_ENV=test mix ecto.migrate`
Expected: succeeds, or reports already up.

- [ ] **Step 5: Commit**

```bash
mix format
git add priv/repo/migrations/20260905120000_add_usernames_and_moderation_fields_to_users.exs
git commit -m "feat: add username and moderation columns to users"
```

---

### Task 4: User schema and changeset validation

This is the task that makes `username` required, so it is also the task that must keep all 746 existing tests green — every one of them that creates a user goes through `user_fixture/1`. The fixture update belongs here, not in a later task, because the suite is red in between.

**Files:**
- Modify: `lib/ethos/accounts/user.ex`
- Modify: `test/support/fixtures/accounts_fixtures.ex`
- Test: `test/ethos/accounts_test.exs`

**Interfaces:**
- Consumes: `Username.normalize/1`, `format/0`, `reserved/0`, `min_length/0`, `max_length/0` from Task 1; the columns from Task 3.
- Produces: `User.registration_changeset/3` now casts and validates `:username`; `User.username_changeset/3` (user, attrs, opts → changeset that also sets `username_provisional: false`); fixture helpers `AccountsFixtures.unique_username/0` and `valid_user_attributes/1` including `:username`.

- [ ] **Step 1: Write the failing test**

Append to `test/ethos/accounts_test.exs`, inside the `defmodule`:

```elixir
  describe "register_user/1 username validation" do
    import Ethos.AccountsFixtures

    test "requires a username" do
      {:error, changeset} =
        Ethos.Accounts.register_user(%{
          email: unique_user_email(),
          password: valid_user_password()
        })

      assert %{username: ["can't be blank"]} = errors_on(changeset)
    end

    test "rejects a username that is too short or too long" do
      {:error, short} =
        Ethos.Accounts.register_user(valid_user_attributes(username: "ab"))

      {:error, long} =
        Ethos.Accounts.register_user(valid_user_attributes(username: String.duplicate("a", 21)))

      assert %{username: ["should be at least 3 character(s)"]} = errors_on(short)
      assert %{username: ["should be at most 20 character(s)"]} = errors_on(long)
    end

    test "rejects characters outside a-z, 0-9 and underscore" do
      {:error, changeset} =
        Ethos.Accounts.register_user(valid_user_attributes(username: "joe stein"))

      assert %{username: ["can only contain lowercase letters, numbers and underscores"]} =
               errors_on(changeset)
    end

    test "rejects a reserved username" do
      {:error, changeset} =
        Ethos.Accounts.register_user(valid_user_attributes(username: "admin"))

      assert %{username: ["is reserved"]} = errors_on(changeset)
    end

    test "downcases and trims before storing" do
      {:ok, user} =
        Ethos.Accounts.register_user(valid_user_attributes(username: "  BuoEwe  "))

      assert user.username == "buoewe"
    end

    test "rejects a username already taken in a different case" do
      taken = user_fixture(username: "buoewe")

      {:error, changeset} =
        Ethos.Accounts.register_user(valid_user_attributes(username: "BUOEWE"))

      assert %{username: ["has already been taken"]} = errors_on(changeset)
      assert taken.username == "buoewe"
    end

    test "a newly registered user is not provisional" do
      {:ok, user} = Ethos.Accounts.register_user(valid_user_attributes())
      refute user.username_provisional
    end
  end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/accounts_test.exs`
Expected: FAIL — the username tests fail because nothing casts or validates `:username`.

- [ ] **Step 3: Write the implementation**

In `lib/ethos/accounts/user.ex`, add the alias directly under `import Ecto.Changeset`:

```elixir
  alias Ethos.Accounts.Username
```

Add these fields to the `schema "users" do` block, after `field :confirmed_at, :utc_datetime`:

```elixir
    field :username, :string
    field :username_provisional, :boolean, default: false
    field :trusted_at, :utc_datetime
    field :banned_at, :utc_datetime
    field :ban_reason, :string
```

Replace the body of `registration_changeset/3` so it casts and validates the username:

```elixir
  def registration_changeset(user, attrs, opts \\ []) do
    user
    |> cast(attrs, [:email, :password, :username])
    |> validate_email(opts)
    |> validate_username(opts)
    |> validate_password(opts)
  end
```

Add these functions after `maybe_validate_unique_email/2`:

```elixir
  @doc """
  A changeset for choosing or changing the public username.

  Always clears `username_provisional`: the only way through this changeset
  is a human deliberately picking a name, which is exactly what the flag
  tracks the absence of.
  """
  def username_changeset(user, attrs, opts \\ []) do
    user
    |> cast(attrs, [:username])
    |> validate_username(opts)
    |> put_change(:username_provisional, false)
  end

  defp validate_username(changeset, opts) do
    changeset
    |> update_change(:username, &Username.normalize/1)
    |> validate_required([:username])
    |> validate_length(:username,
      min: Username.min_length(),
      max: Username.max_length()
    )
    |> validate_format(:username, Username.format(),
      message: "can only contain lowercase letters, numbers and underscores"
    )
    |> validate_exclusion(:username, Username.reserved(), message: "is reserved")
    |> maybe_validate_unique_username(opts)
  end

  defp maybe_validate_unique_username(changeset, opts) do
    if Keyword.get(opts, :validate_username, true) do
      changeset
      |> unsafe_validate_unique(:username, Ethos.Repo)
      |> unique_constraint(:username)
    else
      changeset
    end
  end
```

In `lib/ethos/accounts.ex`, update `change_user_registration/2` so live form validation does not hit the database on every keystroke:

```elixir
  def change_user_registration(%User{} = user, attrs \\ %{}) do
    User.registration_changeset(user, attrs,
      hash_password: false,
      validate_email: false,
      validate_username: false
    )
  end
```

In `test/support/fixtures/accounts_fixtures.ex`, add a username generator and include it in the default attributes:

```elixir
  def unique_user_email, do: "user#{System.unique_integer()}@example.com"
  def unique_username, do: "user#{System.unique_integer([:positive])}"
  def valid_user_password, do: "hello world!"

  def valid_user_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      email: unique_user_email(),
      username: unique_username(),
      password: valid_user_password()
    })
  end
```

- [ ] **Step 4: Run the new tests**

Run: `mix test test/ethos/accounts_test.exs`
Expected: PASS.

- [ ] **Step 5: Run the full suite**

Run: `mix test`
Expected: PASS with **at least 753 tests, 0 failures**. If anything fails here it will be a test that builds user attributes by hand instead of through `valid_user_attributes/1` — fix it by adding a username to that call, not by relaxing the validation.

- [ ] **Step 6: Commit**

```bash
mix format
git add lib/ethos/accounts/user.ex lib/ethos/accounts.ex test/support/fixtures/accounts_fixtures.ex test/ethos/accounts_test.exs
git commit -m "feat: validate usernames on registration"
```

---

### Task 5: Accounts context functions for the picker

**Files:**
- Modify: `lib/ethos/accounts.ex`
- Test: `test/ethos/accounts_test.exs`

**Interfaces:**
- Consumes: `User.username_changeset/3` from Task 4.
- Produces: `Accounts.change_user_username/2` (user, attrs → changeset, no DB uniqueness check), `Accounts.update_user_username/2` (user, attrs → `{:ok, user}` | `{:error, changeset}`), `Accounts.needs_username?/1` (user → boolean).

- [ ] **Step 1: Write the failing test**

Append to `test/ethos/accounts_test.exs`, inside the `defmodule`:

```elixir
  describe "update_user_username/2" do
    import Ethos.AccountsFixtures

    test "sets the username and clears the provisional flag" do
      user = user_fixture()
      {:ok, updated} = Ethos.Accounts.update_user_username(user, %{"username" => "buoewe"})

      assert updated.username == "buoewe"
      refute updated.username_provisional
    end

    test "applies the same rules as registration" do
      user = user_fixture()

      assert {:error, changeset} =
               Ethos.Accounts.update_user_username(user, %{"username" => "admin"})

      assert %{username: ["is reserved"]} = errors_on(changeset)
    end

    test "rejects a username someone else already holds" do
      user_fixture(username: "buoewe")
      other = user_fixture()

      assert {:error, changeset} =
               Ethos.Accounts.update_user_username(other, %{"username" => "buoewe"})

      assert %{username: ["has already been taken"]} = errors_on(changeset)
    end
  end

  describe "needs_username?/1" do
    import Ethos.AccountsFixtures

    test "is false for a user who chose their own name" do
      refute Ethos.Accounts.needs_username?(user_fixture())
    end

    test "is true for a backfilled user" do
      user = user_fixture()
      provisional = %{user | username_provisional: true}
      assert Ethos.Accounts.needs_username?(provisional)
    end

    test "is false for nobody" do
      refute Ethos.Accounts.needs_username?(nil)
    end
  end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos/accounts_test.exs`
Expected: FAIL — `function Ethos.Accounts.update_user_username/2 is undefined`.

- [ ] **Step 3: Write the implementation**

In `lib/ethos/accounts.ex`, add after `change_user_registration/2`:

```elixir
  ## Username

  @doc """
  Changeset for the username picker.

  Skips the uniqueness query so live validation does not hit the database on
  every keystroke; `update_user_username/2` still catches a collision through
  the unique constraint.
  """
  def change_user_username(%User{} = user, attrs \\ %{}) do
    User.username_changeset(user, attrs, validate_username: false)
  end

  @doc """
  Sets a user's public username, clearing the provisional flag.
  """
  def update_user_username(%User{} = user, attrs) do
    user
    |> User.username_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  True when the user still carries a username invented by the backfill.

  These users must pick a real name before they can post anything public.
  """
  def needs_username?(%User{username_provisional: true}), do: true
  def needs_username?(_), do: false
```

- [ ] **Step 4: Run test to verify it passes**

Run: `mix test test/ethos/accounts_test.exs`
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
mix format
git add lib/ethos/accounts.ex test/ethos/accounts_test.exs
git commit -m "feat: accounts functions for choosing a username"
```

---

### Task 6: Registration form takes a username

**Files:**
- Modify: `lib/ethos_web/live/user_registration_live.ex`
- Test: `test/ethos_web/live/user_registration_live_test.exs:25-36` and `:58-71`

**Interfaces:**
- Consumes: `Accounts.change_user_registration/2` from Task 4.
- Produces: the registration form posts `user[username]` alongside `user[email]` and `user[password]`.

- [ ] **Step 1: Write the failing test**

In `test/ethos_web/live/user_registration_live_test.exs`, replace the body of the `"renders errors for invalid data"` test with:

```elixir
    test "renders errors for invalid data", %{conn: conn} do
      {:ok, lv, _html} = live(conn, ~p"/users/register")

      result =
        lv
        |> element("#registration_form")
        |> render_change(
          user: %{"username" => "no", "email" => "with spaces", "password" => "too short"}
        )

      assert result =~ "Register"
      assert result =~ "must have the @ sign and no spaces"
      assert result =~ "should be at least 12 character"
      assert result =~ "should be at least 3 character"
    end
```

And replace the `"renders errors for duplicated email"` test with:

```elixir
    test "renders errors for duplicated email", %{conn: conn} do
      {:ok, lv, _html} = live(conn, ~p"/users/register")

      user = user_fixture(%{email: "test@email.com"})

      result =
        lv
        |> form("#registration_form",
          user: %{
            "username" => unique_username(),
            "email" => user.email,
            "password" => "valid_password"
          }
        )
        |> render_submit()

      assert result =~ "has already been taken"
    end

    test "renders an error for a duplicated username", %{conn: conn} do
      {:ok, lv, _html} = live(conn, ~p"/users/register")

      user_fixture(%{username: "buoewe"})

      result =
        lv
        |> form("#registration_form",
          user: %{
            "username" => "buoewe",
            "email" => unique_user_email(),
            "password" => "valid_password_here"
          }
        )
        |> render_submit()

      assert result =~ "has already been taken"
    end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos_web/live/user_registration_live_test.exs`
Expected: FAIL — the form has no `user[username]` field, so `render_change`/`form` raise about an unknown field.

- [ ] **Step 3: Write the implementation**

In `lib/ethos_web/live/user_registration_live.ex`, replace the `<.input field={@form[:email]} …>` line with the username field above it:

```heex
        <.input
          field={@form[:username]}
          type="text"
          label="Username"
          required
          autocomplete="username"
        />
        <p class="-mt-4 text-sm text-zinc-500">
          Shown on everything you post. Your email address is never public.
        </p>

        <.input field={@form[:email]} type="email" label="Email" required />
```

- [ ] **Step 4: Run test to verify it passes**

Run: `mix test test/ethos_web/live/user_registration_live_test.exs`
Expected: PASS. The `"creates account and logs the user in"` test still passes because `valid_user_attributes/1` now supplies a username.

- [ ] **Step 5: Commit**

```bash
mix format
git add lib/ethos_web/live/user_registration_live.ex test/ethos_web/live/user_registration_live_test.exs
git commit -m "feat: registration takes a username separate from email"
```

---

### Task 7: The byline is the username, never the email

The point of the whole plan. The header currently prints `@current_user.email` on every page.

**Files:**
- Modify: `lib/ethos_web/components/layouts/root.html.heex:47-49`
- Modify: `test/ethos_web/live/user_registration_live_test.exs:53`
- Test: `test/ethos_web/controllers/public_identity_test.exs`

**Interfaces:**
- Consumes: `users.username` from Task 3.
- Produces: nothing later tasks depend on.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/controllers/public_identity_test.exs`:

```elixir
defmodule EthosWeb.PublicIdentityTest do
  @moduledoc """
  The email address is private. The username is the public byline.

  This is the regression guard for the whole social layer: any template that
  reaches for `current_user.email` on a public page fails here. Plan 3
  extends it to review bylines once reviews exist.
  """
  use EthosWeb.ConnCase, async: true

  import Ethos.AccountsFixtures

  setup do
    user = user_fixture(%{email: "verysecret@example.com", username: "buoewe"})
    %{user: user}
  end

  test "the header shows the username, not the email", %{conn: conn, user: user} do
    response =
      conn
      |> log_in_user(user)
      |> get(~p"/")
      |> html_response(200)

    assert response =~ "buoewe"
    refute response =~ "verysecret@example.com"
  end

  test "a logged-out visitor sees neither", %{conn: conn} do
    response = conn |> get(~p"/") |> html_response(200)

    refute response =~ "buoewe"
    refute response =~ "verysecret@example.com"
  end

  test "the account's own settings page may still show the email", %{conn: conn, user: user} do
    response =
      conn
      |> log_in_user(user)
      |> get(~p"/users/settings")
      |> html_response(200)

    assert response =~ "verysecret@example.com"
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos_web/controllers/public_identity_test.exs`
Expected: FAIL on the first test — the header renders the email, so `refute response =~ "verysecret@example.com"` fails.

- [ ] **Step 3: Write the implementation**

In `lib/ethos_web/components/layouts/root.html.heex`, replace the email list item:

```heex
        <li class="text-[0.8125rem] leading-6 text-zinc-900">
          {@current_user.email}
        </li>
```

with the username, and a prompt for anyone still carrying a backfilled name:

```heex
        <li class="text-[0.8125rem] leading-6 text-zinc-900">
          <%= if Ethos.Accounts.needs_username?(@current_user) do %>
            <.link href={~p"/users/username"} class="font-semibold underline">
              Pick a username
            </.link>
          <% else %>
            {@current_user.username}
          <% end %>
        </li>
```

In `test/ethos_web/live/user_registration_live_test.exs`, the `"creates account and logs the user in"` test asserts the header shows the email. Change it to assert the username. Replace:

```elixir
      email = unique_user_email()
      form = form(lv, "#registration_form", user: valid_user_attributes(email: email))
```

with:

```elixir
      email = unique_user_email()
      username = unique_username()

      form =
        form(lv, "#registration_form",
          user: valid_user_attributes(email: email, username: username)
        )
```

and replace `assert response =~ email` with:

```elixir
      assert response =~ username
      refute response =~ email
```

- [ ] **Step 4: Run the tests**

Run: `mix test test/ethos_web/controllers/public_identity_test.exs test/ethos_web/live/user_registration_live_test.exs`
Expected: PASS.

- [ ] **Step 5: Run the full suite**

Run: `mix test`
Expected: PASS, 0 failures. `test/ethos_web/user_auth_test.exs` and `test/ethos_web/live/user_settings_live_test.exs` both touch the header — if either asserts on the email, update the assertion to the username rather than reverting the layout.

- [ ] **Step 6: Commit**

```bash
mix format
git add lib/ethos_web/components/layouts/root.html.heex test/ethos_web/controllers/public_identity_test.exs test/ethos_web/live/user_registration_live_test.exs
git commit -m "feat: public byline is the username, never the email"
```

---

### Task 8: The username picker

Reachable from the header prompt added in Task 7. The `/users/username` route must exist before that link stops 404ing, so this task closes the loop.

**Files:**
- Create: `lib/ethos_web/live/username_live.ex`
- Modify: `lib/ethos_web/router.ex` (the `:require_authenticated_user` live_session)
- Test: `test/ethos_web/live/username_live_test.exs`

**Interfaces:**
- Consumes: `Accounts.change_user_username/2`, `Accounts.update_user_username/2` from Task 5.
- Produces: route `/users/username`, `EthosWeb.UsernameLive`.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/live/username_live_test.exs`:

```elixir
defmodule EthosWeb.UsernameLiveTest do
  use EthosWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures

  describe "/users/username" do
    test "redirects a logged-out visitor to log in", %{conn: conn} do
      assert {:error, {:redirect, %{to: "/users/log_in"}}} = live(conn, ~p"/users/username")
    end

    test "renders the picker prefilled with the current name", %{conn: conn} do
      user = user_fixture(%{username: "user123"})
      {:ok, _lv, html} = conn |> log_in_user(user) |> live(~p"/users/username")

      assert html =~ "Pick your username"
      assert html =~ "user123"
    end

    test "saves a valid username and clears the provisional flag", %{conn: conn} do
      # Bypass the changeset deliberately: username_changeset/3 always clears
      # this flag, so the only way to set up a backfilled user is to write it
      # directly, the way the migration does.
      user =
        user_fixture()
        |> Ecto.Changeset.change(username_provisional: true)
        |> Ethos.Repo.update!()

      {:ok, lv, _html} = conn |> log_in_user(user) |> live(~p"/users/username")

      result =
        lv
        |> form("#username_form", user: %{"username" => "buoewe"})
        |> render_submit()

      assert {:error, {:redirect, %{to: "/"}}} = result

      reloaded = Ethos.Accounts.get_user!(user.id)
      assert reloaded.username == "buoewe"
      refute reloaded.username_provisional
    end

    test "shows an error for a reserved username", %{conn: conn} do
      user = user_fixture()
      {:ok, lv, _html} = conn |> log_in_user(user) |> live(~p"/users/username")

      html =
        lv
        |> form("#username_form", user: %{"username" => "admin"})
        |> render_submit()

      assert html =~ "is reserved"
    end

    test "shows an error for a username someone else holds", %{conn: conn} do
      user_fixture(%{username: "buoewe"})
      user = user_fixture()
      {:ok, lv, _html} = conn |> log_in_user(user) |> live(~p"/users/username")

      html =
        lv
        |> form("#username_form", user: %{"username" => "buoewe"})
        |> render_submit()

      assert html =~ "has already been taken"
    end
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `mix test test/ethos_web/live/username_live_test.exs`
Expected: FAIL — no route matches `/users/username`.

- [ ] **Step 3: Write the implementation**

Create `lib/ethos_web/live/username_live.ex`:

```elixir
defmodule EthosWeb.UsernameLive do
  @moduledoc """
  Lets a user claim a real username.

  Reached by anyone whose name was invented by the backfill migration. It is
  not gated to those users only — changing your mind about your name is
  reasonable — but the header only advertises it while the provisional flag
  is set.
  """
  use EthosWeb, :live_view

  alias Ethos.Accounts

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm">
      <.header class="text-center">
        Pick your username
        <:subtitle>
          This is the name shown on everything you post. Your email address is
          never public.
        </:subtitle>
      </.header>

      <.simple_form for={@form} id="username_form" phx-submit="save" phx-change="validate">
        <.input field={@form[:username]} type="text" label="Username" required />

        <:actions>
          <.button phx-disable-with="Saving..." class="w-full">Save username</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    user = socket.assigns.current_user
    changeset = Accounts.change_user_username(user, %{"username" => user.username})

    {:ok, assign_form(socket, changeset)}
  end

  def handle_event("validate", %{"user" => params}, socket) do
    changeset =
      socket.assigns.current_user
      |> Accounts.change_user_username(params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"user" => params}, socket) do
    case Accounts.update_user_username(socket.assigns.current_user, params) do
      {:ok, user} ->
        {:noreply,
         socket
         |> put_flash(:info, "You're now #{user.username}.")
         |> redirect(to: ~p"/")}

      {:error, changeset} ->
        {:noreply, assign_form(socket, Map.put(changeset, :action, :validate))}
    end
  end

  defp assign_form(socket, changeset) do
    assign(socket, form: to_form(changeset, as: "user"))
  end
end
```

In `lib/ethos_web/router.ex`, add the route inside the existing `live_session :require_authenticated_user` block, directly after the `/users/settings/confirm_email/:token` line:

```elixir
      live "/users/username", UsernameLive, :edit
```

- [ ] **Step 4: Run test to verify it passes**

Run: `mix test test/ethos_web/live/username_live_test.exs`
Expected: PASS — 5 tests, 0 failures.

- [ ] **Step 5: Run the full suite**

Run: `mix test`
Expected: PASS, 0 failures, and the total at or above 765.

- [ ] **Step 6: Commit**

```bash
mix format
git add lib/ethos_web/live/username_live.ex lib/ethos_web/router.ex test/ethos_web/live/username_live_test.exs
git commit -m "feat: username picker for backfilled accounts"
```

---

## Done when

- `mix test` is green with no reduction from the 746-test baseline.
- Registering asks for a username and an email as separate fields.
- The header shows the username; `public_identity_test.exs` proves the email is absent from public HTML.
- Running `mix ecto.migrate` against a database with existing users gives each one a provisional username, and gives the configured admin the username `buoewe`.
- A user with a provisional username sees "Pick a username" in the header and can claim one at `/users/username`.

## Notes for Plan 2

- `Accounts.needs_username?/1` is the gate `SocialLive` will use to withhold reaction buttons and the review form. It exists and is tested; nothing calls it for enforcement yet.
- `trusted_at`, `banned_at`, and `ban_reason` exist on `users` but are unused until Plan 3. That is deliberate — one `ALTER TABLE` against production instead of two.
