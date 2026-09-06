# Social Layer, Plan 3b: Ban, Trust, and the Users Tab Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Let the admin ban an account outright and stop reviewing every comment from people who have already proved themselves, from a Users tab in the console.

**Architecture:** Two columns that already exist and nothing writes — `users.banned_at` and `users.trusted_at` — get their writers. Ban is enforced in three places: `Ethos.Moderation` writes the flag and deletes the account's tokens in one transaction, the session controller refuses the login, and `fetch_current_user` treats a surviving session as logged out. Trust is set as a side effect of the first approval and read at review-creation time, so an approved author's next comment posts immediately.

**Tech Stack:** Elixir, Phoenix 1.7, Phoenix LiveView, Ecto + PostgreSQL (`Ecto.Multi`), ExUnit.

**Spec:** `docs/superpowers/specs/2026-09-05-social-layer-design.md` (sections "Moderation console" and "Ban semantics")

**Predecessor:** Plan 3a, merged to `main`. This builds on `Ethos.Moderation`, `Ethos.Social.create_review/3` and `update_review/2`, `EthosWeb.AdminNav`, `EthosWeb.UserAuth.on_mount(:ensure_admin, ...)`, and `Ethos.AccountsFixtures.admin_fixture/1`.

## Global Constraints

- **A ban is a full block.** The account cannot log in, its existing sessions are revoked, and its reviews stop being publicly visible. It is reversible.
- The suspension message is exactly `"This account has been suspended."` It is deliberately distinct from the generic invalid-credentials message: it is only reachable by someone who supplied the *correct* password, so it discloses nothing to an attacker probing for registered emails, and a banned user retrying their own correct password forever generates support mail.
- **The admin cannot be banned.** Attempting it returns an error rather than locking the only moderator out.
- A user becomes trusted the first time the admin approves one of their comments. `trusted_at` is set once and never moved by a later approval.
- A trusted author's new review is created `"approved"` with `moderated_at` left `nil` — `Moderation.list_approved_reviews/0` already orders `desc_nulls_last` for exactly this reason. Do not set `moderated_at` on the fast lane.
- A trusted author's **edit** keeps the review's current status. An untrusted author's edit returns it to `"pending"`.
- Review statuses, exactly: `"pending"`, `"approved"`, `"revoked"`.
- **Never render `user.username` on a page a third party can see — call `Ethos.Accounts.display_name/1`.**
- Admin identity is the email matching `Application.get_env(:ethos, :admin_email)`. Use `Ethos.AccountsFixtures.admin_fixture/1`; never spell that email out in a new test, and mark any new test file that uses it `async: false` — concurrent inserts of that email deadlock.
- Run `mix format` **scoped to the files you touched**. Never bare `mix format`.
- **Prefix every test command with `MIX_TEST_PARTITION=_social.`** Three worktrees share one test database.
- **Every task must end with `mix test` at 0 failures.** Baseline entering this plan: **1138 tests, 0 failures**.
- Database runs in Docker on port 54329 (`docker compose up -d`).

## File Structure

**Created:**

| File | Responsibility |
|---|---|
| `lib/ethos_web/live/admin/users_live.ex` | The Users tab: search, trust/untrust, ban/unban. |
| `test/ethos_web/live/admin/users_live_test.exs` | Its tests. `async: false`. |
| `test/ethos/moderation_ban_test.exs` | Ban and trust behaviour in the context, kept out of the already-large `moderation_test.exs`. `async: false`. |

**Modified:** `lib/ethos/moderation.ex` (ban, unban, trust-on-approve), `lib/ethos/social.ex` (fast lane on create, trusted-edit rule), `lib/ethos/accounts.ex` (user listing), `lib/ethos_web/user_auth.ex` (ban guard), `lib/ethos_web/controllers/user_session_controller.ex` (login refusal), `lib/ethos_web/components/admin_nav.ex` (third tab), `lib/ethos_web/router.ex`, `lib/ethos_web/live/social_live.ex` (the `update_review` arity change).

---

### Task 1: Ban and unban in the Moderation context

**Files:**
- Modify: `lib/ethos/moderation.ex`
- Test: `test/ethos/moderation_ban_test.exs`

**Interfaces:**
- Consumes: `Ethos.Accounts.admin?/1`, `Ethos.Accounts.UserToken.by_user_and_contexts_query/2` (exists, `:all` returns every token for a user).
- Produces:
  - `Moderation.ban_user(user, reason, admin)` → `{:ok, user}` | `{:error, :unauthorized}` | `{:error, :cannot_ban_admin}` | `{:error, changeset}`
  - `Moderation.unban_user(user, admin)` → `{:ok, user}` | `{:error, :unauthorized}`
  - `Moderation.banned?(user)` → boolean

- [ ] **Step 1: Write the failing test**

Create `test/ethos/moderation_ban_test.exs`:

```elixir
defmodule Ethos.ModerationBanTest do
  # async: false — admin_fixture/1 inserts the configured admin email, and
  # concurrent inserts of that unique value deadlock.
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Accounts
  alias Ethos.Moderation
  alias Ethos.Social

  setup do
    %{admin: admin_fixture(), user: user_fixture(), guide: guide_fixture()}
  end

  describe "ban_user/3" do
    test "records the ban and its reason", %{admin: admin, user: user} do
      assert {:ok, banned} = Moderation.ban_user(user, "Spamming every guide.", admin)

      assert banned.banned_at
      assert banned.ban_reason == "Spamming every guide."
      assert Moderation.banned?(banned)
    end

    test "revokes every session the user holds", %{admin: admin, user: user} do
      token_one = Accounts.generate_user_session_token(user)
      token_two = Accounts.generate_user_session_token(user)

      assert Accounts.get_user_by_session_token(token_one)
      assert Accounts.get_user_by_session_token(token_two)

      {:ok, _} = Moderation.ban_user(user, "Enough.", admin)

      refute Accounts.get_user_by_session_token(token_one)
      refute Accounts.get_user_by_session_token(token_two)
    end

    test "hides the user's approved reviews from the public", %{
      admin: admin,
      user: user,
      guide: guide
    } do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "9", "body" => "Great."})
      {:ok, _} = Moderation.approve_review(review, admin)

      assert length(Social.approved_reviews(guide)) == 1

      {:ok, _} = Moderation.ban_user(user, "Enough.", admin)

      assert Social.approved_reviews(guide) == []
      assert Social.rating_summary(guide) == %{average: nil, count: 0}
    end

    test "refuses a non-admin", %{user: user} do
      assert {:error, :unauthorized} = Moderation.ban_user(user, "No.", user_fixture())
    end

    test "refuses to ban the admin", %{admin: admin} do
      assert {:error, :cannot_ban_admin} = Moderation.ban_user(admin, "Oops.", admin)
    end

    test "requires a reason", %{admin: admin, user: user} do
      assert {:error, changeset} = Moderation.ban_user(user, "", admin)
      assert %{ban_reason: _} = errors_on(changeset)
    end
  end

  describe "unban_user/2" do
    test "clears the ban and restores the user's reviews", %{
      admin: admin,
      user: user,
      guide: guide
    } do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "9", "body" => "Back."})
      {:ok, _} = Moderation.approve_review(review, admin)
      {:ok, banned} = Moderation.ban_user(user, "Temporary.", admin)

      assert Social.approved_reviews(guide) == []

      assert {:ok, restored} = Moderation.unban_user(banned, admin)

      refute restored.banned_at
      refute restored.ban_reason
      assert length(Social.approved_reviews(guide)) == 1
    end

    test "refuses a non-admin", %{admin: admin, user: user} do
      {:ok, banned} = Moderation.ban_user(user, "Enough.", admin)

      assert {:error, :unauthorized} = Moderation.unban_user(banned, user_fixture())
    end
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/moderation_ban_test.exs`
Expected: FAIL — `function Ethos.Moderation.ban_user/3 is undefined`.

- [ ] **Step 3: Write the implementation**

In `lib/ethos/moderation.ex`, add `alias Ethos.Accounts.UserToken` to the aliases, then
append before the final `end`:

```elixir
  ## Bans

  @doc "True when this account is banned."
  def banned?(%User{banned_at: nil}), do: false
  def banned?(%User{}), do: true

  @doc """
  Bans an account: full block.

  The flag and the token purge happen in one transaction, because a ban that
  set the flag but left a live session behind would leave the user browsing
  as though nothing had happened until their cookie expired.

  Refuses to ban the admin. There is exactly one, and locking them out would
  leave nobody able to undo it.
  """
  def ban_user(%User{} = user, reason, %User{} = admin) do
    cond do
      not Accounts.admin?(admin) ->
        {:error, :unauthorized}

      Accounts.admin?(user) ->
        {:error, :cannot_ban_admin}

      true ->
        do_ban(user, reason)
    end
  end

  defp do_ban(%User{} = user, reason) do
    changeset =
      user
      |> Ecto.Changeset.cast(%{ban_reason: reason}, [:ban_reason])
      |> Ecto.Changeset.put_change(
        :banned_at,
        DateTime.utc_now() |> DateTime.truncate(:second)
      )
      |> Ecto.Changeset.validate_required([:ban_reason])
      |> Ecto.Changeset.validate_length(:ban_reason, min: 1, max: 500)

    Ecto.Multi.new()
    |> Ecto.Multi.update(:user, changeset)
    |> Ecto.Multi.delete_all(:tokens, UserToken.by_user_and_contexts_query(user, :all))
    |> Repo.transaction()
    |> case do
      {:ok, %{user: user}} -> {:ok, user}
      {:error, :user, changeset, _} -> {:error, changeset}
    end
  end

  @doc """
  Lifts a ban. The account's reviews become visible again by themselves —
  the public queries filter on `banned_at`, so there is nothing to restore.
  """
  def unban_user(%User{} = user, %User{} = admin) do
    if Accounts.admin?(admin) do
      user
      |> Ecto.Changeset.change(banned_at: nil, ban_reason: nil)
      |> Repo.update()
    else
      {:error, :unauthorized}
    end
  end
```

- [ ] **Step 4: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/moderation_ban_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: both pass, 0 failures.

- [ ] **Step 5: Commit**

```bash
mix format lib/ethos/moderation.ex test/ethos/moderation_ban_test.exs
git add lib/ethos/moderation.ex test/ethos/moderation_ban_test.exs
git commit -m "feat: ban and unban in the moderation context"
```

---

### Task 2: Ban enforcement in the login and session paths

Writing the flag is not a ban until the door is actually shut. Two places:
the login attempt, and any session that survives.

**Files:**
- Modify: `lib/ethos_web/controllers/user_session_controller.ex`
- Modify: `lib/ethos_web/user_auth.ex` (`fetch_current_user/2`)
- Test: `test/ethos_web/controllers/user_session_controller_test.exs`
- Test: `test/ethos_web/user_auth_test.exs`

**Interfaces:**
- Consumes: `Moderation.banned?/1` (Task 1).
- Produces: no new module interface.

- [ ] **Step 1: Write the failing tests**

`test/ethos_web/controllers/user_session_controller_test.exs` already asserts the
generic failure message at line 93. **Leave that test alone** — it covers a wrong
password, which still gets the generic message. Add a sibling.

**First, change that file from `async: true` to `async: false`**, with a comment
matching the ones already on the other admin-email test files:

```elixir
  # async: false — admin_fixture/1 inserts the configured admin email, and
  # concurrent inserts of that unique value deadlock.
  use EthosWeb.ConnCase, async: false
```

This is not optional. The new test below calls `admin_fixture/1`, and three
other files already had to be serialised for exactly this reason — an async
module inserting that email is what made the suite fail half its runs.

`test/ethos_web/user_auth_test.exs` is already `async: false`; leave it.

Append inside the session controller file's `describe "POST /users/log_in"` block:

```elixir
    test "refuses a banned account with a distinct message", %{conn: conn} do
      admin = Ethos.AccountsFixtures.admin_fixture()
      user = user_fixture(%{password: "hello world!"})
      {:ok, _} = Ethos.Moderation.ban_user(user, "Spamming.", admin)

      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => "hello world!"}
        })

      assert redirected_to(conn) == ~p"/users/log_in"
      assert Phoenix.Flash.get(conn.assigns.flash, :error) == "This account has been suspended."
      refute get_session(conn, :user_token)
    end
```

Append to `test/ethos_web/user_auth_test.exs`, inside its `describe "fetch_current_user/2"` block:

```elixir
    test "does not authenticate a banned user whose session survives", %{conn: conn} do
      admin = Ethos.AccountsFixtures.admin_fixture()
      user = user_fixture()
      token = Ethos.Accounts.generate_user_session_token(user)

      {:ok, _} =
        user
        |> Ecto.Changeset.change(
          banned_at: DateTime.utc_now() |> DateTime.truncate(:second),
          ban_reason: "Enough."
        )
        |> Ethos.Repo.update()

      # Deliberately NOT going through Moderation.ban_user/3, which would delete
      # this token. The point is the belt-and-braces guard: if a session ever
      # outlives the purge, fetch_current_user must still refuse it.
      _ = admin

      conn =
        conn
        |> Plug.Test.init_test_session(user_token: token)
        |> EthosWeb.UserAuth.fetch_current_user([])

      refute conn.assigns.current_user
    end
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/controllers/user_session_controller_test.exs test/ethos_web/user_auth_test.exs`
Expected: FAIL — the banned user is currently logged in normally, and
`fetch_current_user` still assigns them.

- [ ] **Step 3: Refuse the login**

In `lib/ethos_web/controllers/user_session_controller.ex`, replace the body of the
private `create/3`:

```elixir
  defp create(conn, %{"user" => user_params}, info) do
    %{"email" => email, "password" => password} = user_params

    case Accounts.get_user_by_email_and_password(email, password) do
      nil ->
        # Don't disclose whether the email is registered.
        conn
        |> put_flash(:error, "Invalid email or password")
        |> put_flash(:email, String.slice(email, 0, 160))
        |> redirect(to: ~p"/users/log_in")

      user ->
        if Ethos.Moderation.banned?(user) do
          # Deliberately a different message from the one above. It is only
          # reachable by someone who supplied the CORRECT password, so it
          # tells an attacker nothing they did not already know — and a
          # banned user retyping their own working password forever is a
          # support email nobody needs.
          conn
          |> put_flash(:error, "This account has been suspended.")
          |> redirect(to: ~p"/users/log_in")
        else
          conn
          |> put_flash(:info, info)
          |> UserAuth.log_in_user(user, user_params)
        end
    end
  end
```

- [ ] **Step 4: Guard the session**

In `lib/ethos_web/user_auth.ex`, replace `fetch_current_user/2`:

```elixir
  def fetch_current_user(conn, _opts) do
    {user_token, conn} = ensure_user_token(conn)
    user = user_token && Accounts.get_user_by_session_token(user_token)

    # Banning deletes the account's tokens, so this is belt and braces — it
    # closes the window where a request is already in flight when the ban
    # lands, and it means a session restored from anywhere else still fails.
    assign(conn, :current_user, if(user && Ethos.Moderation.banned?(user), do: nil, else: user))
  end
```

- [ ] **Step 5: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/controllers/user_session_controller_test.exs test/ethos_web/user_auth_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: both pass, 0 failures. The pre-existing wrong-password test must still
pass unchanged — a wrong password still gets the generic message.

- [ ] **Step 6: Commit**

```bash
mix format lib/ethos_web/controllers/user_session_controller.ex lib/ethos_web/user_auth.ex test/ethos_web/controllers/user_session_controller_test.exs test/ethos_web/user_auth_test.exs
git add lib/ethos_web/controllers/user_session_controller.ex lib/ethos_web/user_auth.ex test/ethos_web/controllers/user_session_controller_test.exs test/ethos_web/user_auth_test.exs
git commit -m "feat: a banned account cannot log in or hold a session"
```

---

### Task 3: Approving a comment trusts its author

**Files:**
- Modify: `lib/ethos/moderation.ex` (the private `decide/3`)
- Test: `test/ethos/moderation_ban_test.exs`

**Interfaces:**
- Consumes: `Moderation.approve_review/2`, `revoke_review/2` (exist).
- Produces: `approve_review/2` now also sets the author's `trusted_at` when it is `nil`. Return shape unchanged. Plus `Moderation.trust_user(user, admin)` and `Moderation.untrust_user(user, admin)`, both → `{:ok, user}` | `{:error, :unauthorized}` | `{:error, changeset}`.

- [ ] **Step 1: Write the failing test**

Append to `test/ethos/moderation_ban_test.exs`, inside the `defmodule`:

```elixir
  describe "approving trusts the author" do
    test "the first approval sets trusted_at", %{admin: admin, user: user, guide: guide} do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "8", "body" => "Good."})

      refute Ethos.Repo.reload!(user).trusted_at

      {:ok, _} = Moderation.approve_review(review, admin)

      assert Ethos.Repo.reload!(user).trusted_at
    end

    test "a later approval does not move trusted_at", %{admin: admin, user: user, guide: guide} do
      {:ok, first} = Social.create_review(user, guide, %{"rating" => "8", "body" => "One."})
      {:ok, _} = Moderation.approve_review(first, admin)

      trusted_at = Ethos.Repo.reload!(user).trusted_at

      {:ok, second} =
        Social.create_review(user, guide_fixture(), %{"rating" => "7", "body" => "Two."})

      {:ok, _} = Moderation.approve_review(second, admin)

      assert Ethos.Repo.reload!(user).trusted_at == trusted_at
    end

    test "revoking does not trust anyone", %{admin: admin, user: user, guide: guide} do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "2", "body" => "Bad."})

      {:ok, _} = Moderation.revoke_review(review, admin)

      refute Ethos.Repo.reload!(user).trusted_at
    end
  end

  describe "trust_user/2 and untrust_user/2" do
    test "trusting by hand skips the earn-it path", %{admin: admin, user: user} do
      assert {:ok, trusted} = Moderation.trust_user(user, admin)
      assert trusted.trusted_at
    end

    test "untrusting sends the author back to the queue", %{
      admin: admin,
      user: user,
      guide: guide
    } do
      {:ok, trusted} = Moderation.trust_user(user, admin)
      assert {:ok, untrusted} = Moderation.untrust_user(trusted, admin)

      refute untrusted.trusted_at

      {:ok, review} =
        Social.create_review(untrusted, guide, %{"rating" => "8", "body" => "Back in line."})

      assert review.status == "pending"
    end

    test "trusting again does not move an existing date", %{admin: admin, user: user} do
      {:ok, trusted} = Moderation.trust_user(user, admin)
      {:ok, again} = Moderation.trust_user(trusted, admin)

      assert again.trusted_at == trusted.trusted_at
    end

    test "both refuse a non-admin", %{user: user} do
      assert {:error, :unauthorized} = Moderation.trust_user(user, user_fixture())
      assert {:error, :unauthorized} = Moderation.untrust_user(user, user_fixture())
    end
  end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/moderation_ban_test.exs`
Expected: FAIL — `trusted_at` is never written.

- [ ] **Step 3: Write the implementation**

In `lib/ethos/moderation.ex`, replace the private `decide/3` with a transactional
version. The review update and the trust write must land together: a trusted flag
without the approval that earned it would fast-lane an author whose comment was
never published.

```elixir
  defp decide(%Review{} = review, status, %User{} = admin) do
    now = DateTime.utc_now() |> DateTime.truncate(:second)

    Ecto.Multi.new()
    |> Ecto.Multi.update(
      :review,
      Ecto.Changeset.change(review,
        status: status,
        moderated_at: now,
        moderated_by_id: admin.id
      )
    )
    |> maybe_trust_author(review, status, now)
    |> Repo.transaction()
    |> case do
      {:ok, %{review: review}} -> {:ok, review}
      {:error, _step, changeset, _changes} -> {:error, changeset}
    end
  end

  # Trust is earned by having a comment published, so only "approved" grants it,
  # and only the first time — `where: is_nil(u.trusted_at)` means a later
  # approval cannot move the date, and two concurrent approvals cannot fight
  # over it.
  defp maybe_trust_author(multi, %Review{} = review, "approved", now) do
    Ecto.Multi.update_all(
      multi,
      :trust,
      from(u in User, where: u.id == ^review.user_id and is_nil(u.trusted_at)),
      set: [trusted_at: now]
    )
  end

  defp maybe_trust_author(multi, _review, _status, _now), do: multi

  @doc """
  Trusts an author by hand, without waiting for them to earn it.

  Idempotent: trusting someone already trusted leaves their original date
  alone, so the console cannot accidentally reset how long they have been
  trusted for.
  """
  def trust_user(%User{trusted_at: %DateTime{}} = user, %User{} = admin) do
    if Accounts.admin?(admin), do: {:ok, user}, else: {:error, :unauthorized}
  end

  def trust_user(%User{} = user, %User{} = admin) do
    if Accounts.admin?(admin) do
      user
      |> Ecto.Changeset.change(
        trusted_at: DateTime.utc_now() |> DateTime.truncate(:second)
      )
      |> Repo.update()
    else
      {:error, :unauthorized}
    end
  end

  @doc """
  Withdraws trust. The author's next comment goes back into the queue;
  anything already published stays published.
  """
  def untrust_user(%User{} = user, %User{} = admin) do
    if Accounts.admin?(admin) do
      user
      |> Ecto.Changeset.change(trusted_at: nil)
      |> Repo.update()
    else
      {:error, :unauthorized}
    end
  end
```

- [ ] **Step 4: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/moderation_ban_test.exs test/ethos/moderation_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: all pass, 0 failures.

- [ ] **Step 5: Commit**

```bash
mix format lib/ethos/moderation.ex test/ethos/moderation_ban_test.exs
git add lib/ethos/moderation.ex test/ethos/moderation_ban_test.exs
git commit -m "feat: approving a comment trusts its author"
```

---

### Task 4: A trusted author's new review posts immediately

**Files:**
- Modify: `lib/ethos/social.ex` (`create_review/3`)
- Test: `test/ethos/social_reviews_test.exs`

**Interfaces:**
- Consumes: `users.trusted_at`, written by Task 3.
- Produces: `create_review/3` returns a review whose status is `"approved"` when the author is trusted, `"pending"` otherwise. Signature unchanged.

- [ ] **Step 1: Write the failing test**

Append to `test/ethos/social_reviews_test.exs`, inside the `defmodule`:

```elixir
  describe "the trusted fast lane" do
    test "an untrusted author's review is pending", %{user: user, guide: guide} do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "8", "body" => "First."})

      assert review.status == "pending"
    end

    test "a trusted author's review is approved on arrival", %{user: user, guide: guide} do
      trusted =
        user
        |> Ecto.Changeset.change(trusted_at: DateTime.utc_now() |> DateTime.truncate(:second))
        |> Repo.update!()

      {:ok, review} = Social.create_review(trusted, guide, %{"rating" => "8", "body" => "Live."})

      assert review.status == "approved"
      assert [visible] = Social.approved_reviews(guide)
      assert visible.id == review.id
    end

    test "a fast-laned review has no moderated_at", %{user: user, guide: guide} do
      trusted =
        user
        |> Ecto.Changeset.change(trusted_at: DateTime.utc_now() |> DateTime.truncate(:second))
        |> Repo.update!()

      {:ok, review} = Social.create_review(trusted, guide, %{"rating" => "8", "body" => "Fast."})

      # Nobody decided it, so there is no decision timestamp. This is why
      # Moderation.list_approved_reviews/0 orders desc_nulls_last.
      refute review.moderated_at
      refute review.moderated_by_id
    end

    test "a banned trusted author still cannot be seen", %{user: user, guide: guide} do
      trusted =
        user
        |> Ecto.Changeset.change(
          trusted_at: DateTime.utc_now() |> DateTime.truncate(:second),
          banned_at: DateTime.utc_now() |> DateTime.truncate(:second)
        )
        |> Repo.update!()

      {:ok, _} = Social.create_review(trusted, guide, %{"rating" => "8", "body" => "Hidden."})

      assert Social.approved_reviews(guide) == []
    end
  end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/social_reviews_test.exs`
Expected: FAIL — every review is still created `"pending"`.

- [ ] **Step 3: Write the implementation**

In `lib/ethos/social.ex`, replace `create_review/3`'s pinned status with a computed
one:

```elixir
  def create_review(%User{} = user, subject, attrs) do
    {type, id} = Subject.ref(subject)

    %Review{}
    |> Review.changeset(
      Map.merge(normalize_review_attrs(attrs), %{
        user_id: user.id,
        subject_type: type,
        subject_id: id,
        status: initial_status(user)
      })
    )
    |> Repo.insert()
  end

  # Trusted authors skip the queue. `moderated_at` stays nil because nobody
  # decided anything — see Moderation.list_approved_reviews/0's
  # desc_nulls_last, which exists for this case.
  #
  # Still computed server-side from the stored user, never from attrs: the
  # pinned key in the merge above is what stops a caller naming its own status.
  defp initial_status(%User{trusted_at: nil}), do: "pending"
  defp initial_status(%User{}), do: "approved"
```

- [ ] **Step 4: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/social_reviews_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: both pass, 0 failures.

- [ ] **Step 5: Commit**

```bash
mix format lib/ethos/social.ex test/ethos/social_reviews_test.exs
git add lib/ethos/social.ex test/ethos/social_reviews_test.exs
git commit -m "feat: a trusted author's review posts without waiting"
```

---

### Task 5: A trusted author's edit does not go back to the queue

`update_review/2` currently takes no user, so it cannot tell whose review it is
editing. This task changes its arity, which means updating its only caller in the
same commit.

**Files:**
- Modify: `lib/ethos/social.ex` (`update_review/2` → `/3`)
- Modify: `lib/ethos_web/live/social_live.ex` (the `save_review/2` call site)
- Test: `test/ethos/social_reviews_test.exs`

**Interfaces:**
- Consumes: `users.trusted_at`.
- Produces: `Social.update_review(review, user, attrs)` → `{:ok, review}` | `{:error, changeset}`. **The two-argument version is gone.**

- [ ] **Step 1: Write the failing test**

In `test/ethos/social_reviews_test.exs`, the existing `describe "update_review/2"` block
calls `Social.update_review(review, attrs)`. Update both existing calls to pass the
user as the middle argument, keeping their assertions identical, and rename the
describe to `"update_review/3"`. Then append these tests inside that block:

```elixir
    test "an untrusted author's edit returns an approved review to pending", %{
      user: user,
      guide: guide
    } do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "8", "body" => "First."})
      approved = review |> Ecto.Changeset.change(status: "approved") |> Repo.update!()

      assert {:ok, updated} =
               Social.update_review(approved, user, %{"rating" => "8", "body" => "Edited."})

      assert updated.status == "pending"
    end

    test "a trusted author's edit keeps the review approved", %{user: user, guide: guide} do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "8", "body" => "First."})
      approved = review |> Ecto.Changeset.change(status: "approved") |> Repo.update!()

      trusted =
        user
        |> Ecto.Changeset.change(trusted_at: DateTime.utc_now() |> DateTime.truncate(:second))
        |> Repo.update!()

      assert {:ok, updated} =
               Social.update_review(approved, trusted, %{"rating" => "3", "body" => "Changed."})

      assert updated.status == "approved"
      assert updated.body == "Changed."
    end

    test "a trusted author editing a revoked review does not resurrect it", %{
      user: user,
      guide: guide
    } do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "8", "body" => "First."})
      revoked = review |> Ecto.Changeset.change(status: "revoked") |> Repo.update!()

      trusted =
        user
        |> Ecto.Changeset.change(trusted_at: DateTime.utc_now() |> DateTime.truncate(:second))
        |> Repo.update!()

      assert {:ok, updated} =
               Social.update_review(revoked, trusted, %{"rating" => "9", "body" => "Try again."})

      # Keeping the current status means a revoked review stays revoked. Trust
      # buys you the queue, not a way to undo a moderator.
      assert updated.status == "revoked"
      assert Social.approved_reviews(guide) == []
    end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/social_reviews_test.exs`
Expected: FAIL — `Social.update_review/3 is undefined`.

- [ ] **Step 3: Write the implementation**

In `lib/ethos/social.ex`, replace `update_review/2`:

```elixir
  @doc """
  Edits a review.

  An untrusted author's edit returns it to `pending`. Without that, posting
  something innocuous, waiting for approval, then editing it into something
  else would publish unmoderated text.

  A trusted author keeps whatever status the review already had — which for a
  revoked review means it stays revoked. Trust buys a place at the front of
  the queue, not a way to undo a moderator's decision.
  """
  def update_review(%Review{} = review, %User{} = user, attrs) do
    review
    |> Review.changeset(
      Map.put(normalize_review_attrs(attrs), :status, edited_status(review, user))
    )
    |> Repo.update()
  end

  defp edited_status(%Review{}, %User{trusted_at: nil}), do: "pending"
  defp edited_status(%Review{status: status}, %User{}), do: status
```

- [ ] **Step 4: Update the only caller**

In `lib/ethos_web/live/social_live.ex`, `save_review/2` calls
`Social.update_review(existing, attrs)`. Pass the user:

```elixir
        existing -> Social.update_review(existing, user, attrs)
```

`user` is already bound in that function from `socket.assigns.current_user`.

- [ ] **Step 5: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/social_reviews_test.exs test/ethos_web/live/social_reviews_live_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: all pass, 0 failures. If the LiveView tests fail on an arity error, the
call site in Step 4 was missed.

- [ ] **Step 6: Commit**

```bash
mix format lib/ethos/social.ex lib/ethos_web/live/social_live.ex test/ethos/social_reviews_test.exs
git add lib/ethos/social.ex lib/ethos_web/live/social_live.ex test/ethos/social_reviews_test.exs
git commit -m "feat: a trusted author's edit stays published"
```

---

### Task 6: Listing users for the console

**Files:**
- Modify: `lib/ethos/accounts.ex`
- Test: `test/ethos/accounts_test.exs`

**Interfaces:**
- Consumes: `Ethos.Social.Review` for the counts.
- Produces: `Accounts.list_users_for_moderation(opts \\ [])` → list of
  `%{user: %User{}, review_count: integer, revoked_count: integer}`, newest user
  first. `opts` accepts `:search`, a binary matched case-insensitively against
  username and email.

- [ ] **Step 1: Write the failing test**

Append to `test/ethos/accounts_test.exs`, inside the `defmodule`:

```elixir
  describe "list_users_for_moderation/1" do
    import Ethos.AccountsFixtures
    import Ethos.GuidesFixtures

    test "returns every user with zero counts when nobody has reviewed" do
      user = user_fixture()

      assert [row] = Ethos.Accounts.list_users_for_moderation()
      assert row.user.id == user.id
      assert row.review_count == 0
      assert row.revoked_count == 0
    end

    test "counts a user's reviews and how many were revoked" do
      user = user_fixture()
      guide_one = guide_fixture()
      guide_two = guide_fixture()

      {:ok, _kept} =
        Ethos.Social.create_review(user, guide_one, %{"rating" => "8", "body" => "Kept."})

      {:ok, gone} =
        Ethos.Social.create_review(user, guide_two, %{"rating" => "2", "body" => "Gone."})

      gone |> Ecto.Changeset.change(status: "revoked") |> Ethos.Repo.update!()

      assert [row] = Ethos.Accounts.list_users_for_moderation()
      assert row.review_count == 2
      assert row.revoked_count == 1
    end

    test "searches by username" do
      match = user_fixture(%{username: "findme"})
      _other = user_fixture(%{username: "somebodyelse"})

      assert [row] = Ethos.Accounts.list_users_for_moderation(search: "findm")
      assert row.user.id == match.id
    end

    test "searches by email, case-insensitively" do
      match = user_fixture(%{email: "Needle@example.com"})
      _other = user_fixture()

      assert [row] = Ethos.Accounts.list_users_for_moderation(search: "needle")
      assert row.user.id == match.id
    end

    test "an empty search returns everyone" do
      user_fixture()
      user_fixture()

      assert length(Ethos.Accounts.list_users_for_moderation(search: "")) == 2
    end
  end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/accounts_test.exs`
Expected: FAIL — `function Ethos.Accounts.list_users_for_moderation/0 is undefined`.

- [ ] **Step 3: Write the implementation**

In `lib/ethos/accounts.ex`, append before the final `end`:

```elixir
  ## Moderation listing

  @doc """
  Every account, with the numbers a moderator needs to judge it.

  `review_count` and `revoked_count` together are the signal: one revoked
  comment out of twenty reads very differently from two out of two, and the
  console should not make an admin run that query in their head.

  `opts` accepts `:search`, matched case-insensitively against username and
  email. An empty or missing search returns everyone.
  """
  def list_users_for_moderation(opts \\ []) do
    search = opts |> Keyword.get(:search, "") |> to_string() |> String.trim()

    from(u in User,
      left_join: r in Ethos.Social.Review,
      on: r.user_id == u.id,
      group_by: u.id,
      order_by: [desc: u.inserted_at, desc: u.id],
      select: %{
        user: u,
        review_count: count(r.id),
        revoked_count:
          fragment("count(*) filter (where ? = 'revoked')", r.status)
      }
    )
    |> filter_by_search(search)
    |> Repo.all()
  end

  defp filter_by_search(query, ""), do: query

  defp filter_by_search(query, search) do
    pattern = "%#{search}%"

    # `username` is citext so it is already case-insensitive; `email` is citext
    # too. ilike is belt and braces and costs nothing at this size.
    where(query, [u], ilike(u.username, ^pattern) or ilike(fragment("?::text", u.email), ^pattern))
  end
```

Note `count(r.id)` counts only matched rows, so a user with no reviews gets 0 rather
than 1 — that is why the join is on `r.id` and not `u.id`.

- [ ] **Step 4: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/accounts_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: both pass, 0 failures.

- [ ] **Step 5: Commit**

```bash
mix format lib/ethos/accounts.ex test/ethos/accounts_test.exs
git add lib/ethos/accounts.ex test/ethos/accounts_test.exs
git commit -m "feat: list users with review counts for moderation"
```

---

### Task 7: The Users tab

**Files:**
- Create: `lib/ethos_web/live/admin/users_live.ex`
- Modify: `lib/ethos_web/components/admin_nav.ex`
- Modify: `lib/ethos_web/router.ex`
- Test: `test/ethos_web/live/admin/users_live_test.exs`

**Interfaces:**
- Consumes: `Accounts.list_users_for_moderation/1` (Task 6), `Moderation.ban_user/3`, `unban_user/2`, `banned?/1` (Task 1), `Moderation.trust_user/2`, `untrust_user/2` (Task 3), `Accounts.display_name/1`, `Accounts.admin?/1`, `Accounts.get_user!/1`.
- Produces: route `/admin/users`; `AdminNav.admin_nav/1` gains a `:users` tab.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/live/admin/users_live_test.exs`:

```elixir
defmodule EthosWeb.Admin.UsersLiveTest do
  # async: false — admin_fixture/1 inserts the configured admin email.
  use EthosWeb.ConnCase, async: false

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures

  alias Ethos.Moderation

  setup do
    %{admin: admin_fixture(), user: user_fixture(%{username: "wanderer"})}
  end

  # get/2, not live/2: the guards are plugs on the router pipeline and act on
  # the HTTP request before any mount. require_admin_user RENDERS a 404 and
  # halts rather than raising.
  test "a logged-out visitor is sent to log in", %{conn: conn} do
    assert conn |> get(~p"/admin/users") |> redirected_to() == ~p"/users/log_in"
  end

  test "a non-admin gets a 404", %{conn: conn} do
    conn = log_in_user(conn, user_fixture(%{email: "not-admin@example.com"}))

    assert conn |> get(~p"/admin/users") |> html_response(404)
  end

  test "the admin sees users by username", %{conn: conn, admin: admin} do
    {:ok, _view, html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    assert html =~ "wanderer"
  end

  test "searching narrows the list", %{conn: conn, admin: admin} do
    user_fixture(%{username: "otherperson"})

    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    html = view |> form("#user-search", search: %{query: "wander"}) |> render_change()

    assert html =~ "wanderer"
    refute html =~ "otherperson"
  end

  test "banning an account blocks it and shows the reason", %{
    conn: conn,
    admin: admin,
    user: user
  } do
    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    html =
      view
      |> form("#ban-#{user.id}", ban: %{reason: "Spamming every guide."})
      |> render_submit()

    assert html =~ "Spamming every guide."
    assert Moderation.banned?(Ethos.Repo.reload!(user))
  end

  test "unbanning restores the account", %{conn: conn, admin: admin, user: user} do
    {:ok, _} = Moderation.ban_user(user, "Temporary.", admin)

    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    view |> element("button[phx-click=unban][phx-value-id=#{user.id}]") |> render_click()

    refute Moderation.banned?(Ethos.Repo.reload!(user))
  end

  test "trusting from the console fast-lanes that author's next comment", %{
    conn: conn,
    admin: admin,
    user: user
  } do
    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    view |> element("button[phx-click=trust][phx-value-id=#{user.id}]") |> render_click()

    assert Ethos.Repo.reload!(user).trusted_at

    {:ok, review} =
      Ethos.Social.create_review(
        Ethos.Repo.reload!(user),
        Ethos.GuidesFixtures.guide_fixture(),
        %{"rating" => "8", "body" => "Straight through."}
      )

    assert review.status == "approved"
  end

  test "untrusting sends that author back to the queue", %{
    conn: conn,
    admin: admin,
    user: user
  } do
    {:ok, _} = Moderation.trust_user(user, admin)

    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    view |> element("button[phx-click=untrust][phx-value-id=#{user.id}]") |> render_click()

    refute Ethos.Repo.reload!(user).trusted_at
  end

  test "the admin's own row cannot be banned", %{conn: conn, admin: admin} do
    {:ok, _view, html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    refute html =~ ~s(id="ban-#{admin.id}")
  end

  test "the console links to the other tabs", %{conn: conn, admin: admin} do
    {:ok, _view, html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    assert html =~ ~s(href="/admin/comments")
    assert html =~ ~s(href="/admin/suggestions")
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/live/admin/users_live_test.exs`
Expected: FAIL — no route matches `/admin/users`.

- [ ] **Step 3: Write the LiveView**

Create `lib/ethos_web/live/admin/users_live.ex`:

```elixir
defmodule EthosWeb.Admin.UsersLive do
  @moduledoc """
  The Users tab: who is here, what they have written, and the levers.

  Trust is normally earned rather than granted — approving someone's comment
  on the Comments tab trusts them automatically. The buttons here are the
  override: granting it to somebody known-good without waiting, and taking it
  back from somebody who turned out not to be.
  """
  use EthosWeb, :live_view

  alias Ethos.Accounts
  alias Ethos.Moderation

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(query: "", page_title: "Users") |> load_users()}
  end

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-3xl px-4 py-10">
      <EthosWeb.AdminNav.admin_nav current={:users} />

      <h1 class="text-2xl font-bold">Users</h1>

      <%!-- Plain inputs rather than <.input>: that component is built around a
            Phoenix.HTML.FormField, and these forms carry loose params rather
            than a changeset. --%>
      <form id="user-search" phx-change="search" class="mt-4">
        <input
          type="text"
          name="search[query]"
          value={@query}
          placeholder="Search by username or email"
          class="w-full rounded-lg border-zinc-300"
        />
      </form>

      <p :if={@rows == []} class="mt-6 text-zinc-500">Nobody matches that.</p>

      <ul class="mt-6 space-y-3">
        <li :for={row <- @rows} class="rounded-lg border p-4">
          <div class="flex flex-wrap items-baseline justify-between gap-2">
            <div>
              <span class="font-semibold">{Accounts.display_name(row.user)}</span>
              <span :if={row.user.trusted_at} class="ml-2 text-xs text-emerald-700">trusted</span>
              <span :if={row.user.banned_at} class="ml-2 text-xs text-red-700">banned</span>
            </div>
            <p class="text-sm text-zinc-500">
              {row.review_count} {if row.review_count == 1, do: "review", else: "reviews"}
              · {row.revoked_count} revoked
            </p>
          </div>

          <p :if={row.user.ban_reason} class="mt-2 text-sm text-red-700">
            {row.user.ban_reason}
          </p>

          <div class="mt-3 flex flex-wrap items-end gap-2">
            <.button
              :if={is_nil(row.user.trusted_at)}
              phx-click="trust"
              phx-value-id={row.user.id}
            >
              Trust
            </.button>

            <.button :if={row.user.trusted_at} phx-click="untrust" phx-value-id={row.user.id}>
              Untrust
            </.button>

            <.button :if={row.user.banned_at} phx-click="unban" phx-value-id={row.user.id}>
              Unban
            </.button>

            <form
              :if={is_nil(row.user.banned_at) and not Accounts.admin?(row.user)}
              id={"ban-#{row.user.id}"}
              phx-submit="ban"
              class="flex items-end gap-2"
            >
              <input type="hidden" name="ban[id]" value={row.user.id} />
              <input
                type="text"
                name="ban[reason]"
                placeholder="Reason"
                class="rounded-lg border-zinc-300 text-sm"
              />
              <.button class="bg-red-600">Ban</.button>
            </form>
          </div>
        </li>
      </ul>
    </div>
    """
  end

  def handle_event("search", %{"search" => %{"query" => query}}, socket)
      when is_binary(query) do
    {:noreply, socket |> assign(query: query) |> load_users()}
  end

  def handle_event("ban", %{"ban" => %{"id" => id, "reason" => reason}}, socket)
      when is_binary(id) and is_binary(reason) do
    case Moderation.ban_user(Accounts.get_user!(id), reason, socket.assigns.current_user) do
      {:ok, user} ->
        {:noreply,
         socket
         |> put_flash(:info, "Banned #{Accounts.display_name(user)}.")
         |> load_users()}

      {:error, :cannot_ban_admin} ->
        {:noreply, put_flash(socket, :error, "You cannot ban yourself.")}

      {:error, _} ->
        {:noreply, put_flash(socket, :error, "That ban needs a reason.")}
    end
  end

  def handle_event("unban", %{"id" => id}, socket) when is_binary(id) do
    case Moderation.unban_user(Accounts.get_user!(id), socket.assigns.current_user) do
      {:ok, user} ->
        {:noreply,
         socket
         |> put_flash(:info, "Unbanned #{Accounts.display_name(user)}.")
         |> load_users()}

      {:error, _} ->
        {:noreply, put_flash(socket, :error, "That could not be undone.")}
    end
  end

  def handle_event("trust", %{"id" => id}, socket) when is_binary(id) do
    {:noreply, apply_trust(socket, id, &Moderation.trust_user/2, "Trusted")}
  end

  def handle_event("untrust", %{"id" => id}, socket) when is_binary(id) do
    {:noreply, apply_trust(socket, id, &Moderation.untrust_user/2, "Untrusted")}
  end

  # A crafted socket frame with a differently-shaped payload must not raise and
  # kill this process.
  def handle_event(_event, _params, socket), do: {:noreply, socket}

  defp apply_trust(socket, id, fun, verb) do
    case fun.(Accounts.get_user!(id), socket.assigns.current_user) do
      {:ok, user} ->
        socket
        |> put_flash(:info, "#{verb} #{Accounts.display_name(user)}.")
        |> load_users()

      {:error, _} ->
        put_flash(socket, :error, "That could not be changed.")
    end
  end

  defp load_users(socket) do
    assign(socket, rows: Accounts.list_users_for_moderation(search: socket.assigns.query))
  end
end
```

- [ ] **Step 4: Add the tab and the route**

In `lib/ethos_web/components/admin_nav.ex`, add a third tab between the existing two
lines so the order reads Comments, Users, Suggestions:

```heex
      <.tab label="Users" href={~p"/admin/users"} active={@current == :users} />
```

In `lib/ethos_web/router.ex`, add the route inside the existing `live_session :admin`
block, next to the comments route:

```elixir
      live "/users", Admin.UsersLive, :index
```

- [ ] **Step 5: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/live/admin/users_live_test.exs test/ethos_web/live/admin/comments_live_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: all pass, 0 failures.

- [ ] **Step 6: Commit**

```bash
mix format lib/ethos_web/live/admin/users_live.ex lib/ethos_web/components/admin_nav.ex lib/ethos_web/router.ex test/ethos_web/live/admin/users_live_test.exs
git add lib/ethos_web/live/admin/users_live.ex lib/ethos_web/components/admin_nav.ex lib/ethos_web/router.ex test/ethos_web/live/admin/users_live_test.exs
git commit -m "feat: admin Users tab with trust state, ban and unban"
```

---

## Done when

- `MIX_TEST_PARTITION=_social mix test` is green, with no reduction from the 1138-test baseline.
- A banned account cannot log in, gets `"This account has been suspended."` rather than the generic message, has its sessions revoked, and has its reviews disappear from every public page and from the rating average. Unbanning restores all of it.
- The admin cannot ban themselves.
- Approving someone's comment trusts them; their next comment posts immediately with no `moderated_at`; a later approval does not move the date; revoking trusts nobody.
- A trusted author's edit keeps the review's status; an untrusted author's edit returns it to pending; a revoked review stays revoked either way.
- `/admin/users` lists everyone with review and revoked counts, searches by username and email, and offers trust/untrust plus ban-with-a-reason and unban — with the admin's own row offering no ban control.
- Trusting from the console fast-lanes that author's next comment; untrusting sends them back to the queue.
- The console's three tabs all link to each other.

## Notes for Plan 4

Plan 4 is the last of the social layer: removing guide authoring for regular users, hiding every affiliate surface behind a default-off flag, and the seasonal design system. None of it depends on this plan. Two things from here are worth carrying:

- `Ethos.Moderation.decide/3` is now transactional. If Plan 4 or later adds another moderation verb, follow the same `Ecto.Multi` shape rather than a bare `Repo.update`.
- `Accounts.list_users_for_moderation/1` uses a `filter (where ...)` aggregate, which is Postgres-specific. It is the only such fragment in the codebase; if the project ever targets another database, this is the query that breaks.
