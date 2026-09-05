# Social Layer, Plan 3a: Reviews and the Moderation Queue Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Let people rate a place, guide or collection out of ten with a written comment, and give the admin a queue to approve or revoke those comments before anyone else sees them.

**Architecture:** A `reviews` table reusing the polymorphic `subject_type`/`subject_id` shape the `reactions` table already established, and the same `Ethos.Social.Subject` module to resolve it. Reviews are written and read through `Ethos.Social`; they are approved and revoked through a separate `Ethos.Moderation`, because moderation acts *on* content rather than being part of how content works. The review form and the approved list join the existing `EthosWeb.SocialLive` island; the admin queue is a new LiveView under `/admin`.

**Tech Stack:** Elixir, Phoenix 1.7, Phoenix LiveView, Ecto + PostgreSQL, ExUnit, Floki.

**Spec:** `docs/superpowers/specs/2026-09-05-social-layer-design.md` (sections "Reviews" and "Moderation console")

**Predecessors:** Plans 1 and 2, both merged to `main`. This plan builds on `Ethos.Social.Subject`, `Ethos.Accounts.display_name/1`, `Ethos.Accounts.needs_username?/1`, `EthosWeb.SocialLive`, and the `users.trusted_at` / `users.banned_at` columns.

**Scope note:** this is Plan 3**a**. It ships pure pre-moderation — every comment waits for the admin. Plan 3b adds the trusted-author fast lane, the Users tab, ban enforcement, and folds the existing suggestion queue into the console. 3a is usable on its own; 3b makes it pleasant.

## Global Constraints

- Rating is an **integer from 1 to 10 inclusive**. No half steps, no zero.
- A comment body is **required** on every review — there is no rating-only review.
- Body length: 2 to 2000 characters.
- One review per user per subject, enforced by a unique index, not only by a changeset.
- Subject types, exactly these three strings: `"place"`, `"guide"`, `"collection"`.
- Review statuses, exactly these three strings: `"pending"`, `"approved"`, `"revoked"`.
- **A new review is always `"pending"`.** Nothing in this plan publishes a review without an admin action.
- Editing a review returns it to `"pending"`.
- A review by a banned author (`users.banned_at` is not null) must never appear publicly, and must not count toward the rating average.
- **Never render `user.username` on a page a third party can see. Call `Ethos.Accounts.display_name/1`.** It has no `nil` clause — guard before calling.
- Run `mix format` **scoped to the files you touched**. Never bare `mix format`: it reformats unrelated files across the project and creates merge conflicts for the other active worktrees.
- **Prefix every test command with `MIX_TEST_PARTITION=_social`.** Three worktrees share one test database; without the prefix another branch's migrations cause unrelated mass failures.
- **Every task must end with `mix test` at 0 failures.** Baseline entering this plan: **1012 tests, 0 failures**.
- Database runs in Docker on port 54329 (`docker compose up -d`).

## File Structure

**Created:**

| File | Responsibility |
|---|---|
| `lib/ethos/social/review.ex` | Ecto schema and changeset for one review. |
| `lib/ethos/moderation.ex` | The admin's verbs: list the queue, approve, revoke. Separate from `Ethos.Social` because only the console calls it. |
| `lib/ethos_web/live/admin/comments_live.ex` | The moderation queue. |
| `lib/ethos_web/components/admin_nav.ex` | The console's shared tab bar, so Comments and the existing Suggestions page look like one surface. |
| `priv/repo/migrations/20260907120000_create_reviews.exs` | The table. |

**Modified:** `lib/ethos/social.ex` (review reads and writes), `lib/ethos_web/live/social_live.ex` (form and list), `lib/ethos_web/router.ex`, `lib/ethos_web/components/layouts.ex` (the admin nav link), `lib/ethos_web/controllers/admin_suggestion_html/index.html.heex` (adopt the tab bar), `test/ethos_web/controllers/public_identity_test.exs` (extend the byline guard).

---

### Task 1: The reviews table and schema

Additive: nothing reads this table yet.

**Files:**
- Create: `priv/repo/migrations/20260907120000_create_reviews.exs`
- Create: `lib/ethos/social/review.ex`
- Test: `test/ethos/social/review_test.exs`

**Interfaces:**
- Consumes: `Ethos.Social.Subject.types/0` (exists, returns `["place", "guide", "collection"]`).
- Produces: table `reviews`; `Ethos.Social.Review` schema with fields `user_id`, `subject_type`, `subject_id`, `rating`, `body`, `status`, `moderated_at`, `moderated_by_id`; `Review.changeset/2`; `Review.statuses/0` → `["pending", "approved", "revoked"]`.

- [ ] **Step 1: Write the migration**

Create `priv/repo/migrations/20260907120000_create_reviews.exs`:

```elixir
defmodule Ethos.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :subject_type, :string, null: false
      # bigint, matching reactions.subject_id: places, guides and collections
      # all have bigserial primary keys, and widening later is a data migration.
      add :subject_id, :bigint, null: false
      add :rating, :integer, null: false
      add :body, :text, null: false
      add :status, :string, null: false, default: "pending"
      add :moderated_at, :utc_datetime
      # nilify rather than delete_all: losing the moderator's account must not
      # silently delete the moderation decisions they made.
      add :moderated_by_id, references(:users, on_delete: :nilify_all)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:reviews, [:user_id, :subject_type, :subject_id])

    # Serves the public "approved reviews for this subject" read on every show
    # page, and the admin queue's status filter.
    create index(:reviews, [:subject_type, :subject_id, :status])
    create index(:reviews, [:status])

    create constraint(:reviews, :reviews_rating_check,
             check: "rating >= 1 AND rating <= 10"
           )

    create constraint(:reviews, :reviews_status_check,
             check: "status in ('pending', 'approved', 'revoked')"
           )

    create constraint(:reviews, :reviews_subject_type_check,
             check: "subject_type in ('place', 'guide', 'collection')"
           )
  end
end
```

- [ ] **Step 2: Run the migration and verify it reverses**

Run: `mix ecto.migrate`, then `mix ecto.rollback`, then `mix ecto.migrate`, then
`MIX_TEST_PARTITION=_social mix ecto.migrate`
Expected: all four succeed.

- [ ] **Step 3: Write the failing test**

Create `test/ethos/social/review_test.exs`:

```elixir
defmodule Ethos.Social.ReviewTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures

  alias Ethos.Repo
  alias Ethos.Social.Review

  defp valid_attrs(user) do
    %{
      user_id: user.id,
      subject_type: "place",
      subject_id: 1,
      rating: 7,
      body: "Worth the detour."
    }
  end

  test "accepts a well-formed review and defaults to pending" do
    user = user_fixture()

    assert {:ok, review} = %Review{} |> Review.changeset(valid_attrs(user)) |> Repo.insert()
    assert review.status == "pending"
    assert review.rating == 7
  end

  test "requires a body" do
    user = user_fixture()
    changeset = Review.changeset(%Review{}, Map.delete(valid_attrs(user), :body))

    assert %{body: ["can't be blank"]} = errors_on(changeset)
  end

  test "rejects a body that is too short or too long" do
    user = user_fixture()

    short = Review.changeset(%Review{}, %{valid_attrs(user) | body: "x"})
    long = Review.changeset(%Review{}, %{valid_attrs(user) | body: String.duplicate("x", 2001)})

    assert %{body: ["should be at least 2 character(s)"]} = errors_on(short)
    assert %{body: ["should be at most 2000 character(s)"]} = errors_on(long)
  end

  test "requires a rating" do
    user = user_fixture()
    changeset = Review.changeset(%Review{}, Map.delete(valid_attrs(user), :rating))

    assert %{rating: ["can't be blank"]} = errors_on(changeset)
  end

  test "rejects a rating outside 1..10" do
    user = user_fixture()

    for bad <- [0, -1, 11, 100] do
      changeset = Review.changeset(%Review{}, %{valid_attrs(user) | rating: bad})
      assert %{rating: _} = errors_on(changeset), "expected #{bad} to be rejected"
    end
  end

  test "accepts both ends of the scale" do
    user_one = user_fixture()
    user_two = user_fixture()

    assert {:ok, _} =
             %Review{} |> Review.changeset(%{valid_attrs(user_one) | rating: 1}) |> Repo.insert()

    assert {:ok, _} =
             %Review{} |> Review.changeset(%{valid_attrs(user_two) | rating: 10}) |> Repo.insert()
  end

  test "rejects an unknown subject type" do
    user = user_fixture()
    changeset = Review.changeset(%Review{}, %{valid_attrs(user) | subject_type: "entry"})

    assert %{subject_type: ["is invalid"]} = errors_on(changeset)
  end

  test "rejects an unknown status" do
    user = user_fixture()
    changeset = Review.changeset(%Review{}, Map.put(valid_attrs(user), :status, "sideways"))

    assert %{status: ["is invalid"]} = errors_on(changeset)
  end

  test "the database rejects a second review on the same subject" do
    user = user_fixture()
    {:ok, _} = %Review{} |> Review.changeset(valid_attrs(user)) |> Repo.insert()

    assert {:error, changeset} =
             %Review{} |> Review.changeset(valid_attrs(user)) |> Repo.insert()

    assert %{user_id: ["has already reviewed this"]} = errors_on(changeset)
  end

  test "the rating check constraint holds even when the changeset is bypassed" do
    user = user_fixture()
    now = DateTime.utc_now() |> DateTime.truncate(:second)

    assert_raise Postgrex.Error, fn ->
      Repo.insert_all("reviews", [
        %{
          user_id: user.id,
          subject_type: "place",
          subject_id: 1,
          rating: 99,
          body: "bypassed",
          status: "pending",
          inserted_at: now,
          updated_at: now
        }
      ])
    end
  end
end
```

- [ ] **Step 4: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/social/review_test.exs`
Expected: FAIL — `module Ethos.Social.Review is not available`.

- [ ] **Step 5: Write the schema**

Create `lib/ethos/social/review.ex`:

```elixir
defmodule Ethos.Social.Review do
  @moduledoc """
  One person's rating of one subject, with the comment that justifies it.

  A rating cannot be posted bare — `body` is required — which is why every
  review carries text and therefore every review is moderated. That is the
  whole split between reviews and reactions: thumbs are instant because
  there is nothing in them to moderate.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Ethos.Social.Subject

  @statuses ~w(pending approved revoked)

  schema "reviews" do
    belongs_to :user, Ethos.Accounts.User
    field :subject_type, :string
    field :subject_id, :integer
    field :rating, :integer
    field :body, :string
    field :status, :string, default: "pending"
    field :moderated_at, :utc_datetime
    belongs_to :moderated_by, Ethos.Accounts.User, foreign_key: :moderated_by_id

    timestamps(type: :utc_datetime)
  end

  def statuses, do: @statuses

  def changeset(review, attrs) do
    review
    |> cast(attrs, [:user_id, :subject_type, :subject_id, :rating, :body, :status])
    |> validate_required([:user_id, :subject_type, :subject_id, :rating, :body])
    |> validate_inclusion(:subject_type, Subject.types())
    |> validate_inclusion(:status, @statuses)
    |> validate_inclusion(:rating, 1..10)
    |> validate_length(:body, min: 2, max: 2000)
    |> unique_constraint([:user_id, :subject_type, :subject_id],
      name: :reviews_user_id_subject_type_subject_id_index,
      message: "has already reviewed this"
    )
  end
end
```

- [ ] **Step 6: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/social/review_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: both pass, 0 failures.

- [ ] **Step 7: Commit**

```bash
mix format lib/ethos/social/review.ex test/ethos/social/review_test.exs priv/repo/migrations/20260907120000_create_reviews.exs
git add lib/ethos/social/review.ex test/ethos/social/review_test.exs priv/repo/migrations/20260907120000_create_reviews.exs
git commit -m "feat: reviews table and schema"
```

---

### Task 2: Review reads and writes in the Social context

**Files:**
- Modify: `lib/ethos/social.ex`
- Test: `test/ethos/social_reviews_test.exs`

A separate test file rather than appending to `test/ethos/social_test.exs`, which is already ~350 lines covering reactions. Reviews are a distinct concern and deserve their own file.

**Interfaces:**
- Consumes: `Subject.ref/1`, `Review.changeset/2` (Task 1).
- Produces:
  - `Social.create_review(user, subject, attrs)` → `{:ok, review}` | `{:error, changeset}`
  - `Social.update_review(review, attrs)` → `{:ok, review}` | `{:error, changeset}`
  - `Social.user_review(user_or_nil, subject)` → `%Review{}` | `nil`
  - `Social.approved_reviews(subject)` → list of `%Review{}` with `:user` preloaded, newest first
  - `Social.rating_summary(subject)` → `%{average: float | nil, count: integer}`

- [ ] **Step 1: Write the failing test**

Create `test/ethos/social_reviews_test.exs`:

```elixir
defmodule Ethos.SocialReviewsTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Social

  setup do
    %{user: user_fixture(), guide: guide_fixture()}
  end

  defp approve!(review) do
    review
    |> Ecto.Changeset.change(status: "approved")
    |> Repo.update!()
  end

  describe "create_review/3" do
    test "creates a pending review", %{user: user, guide: guide} do
      assert {:ok, review} =
               Social.create_review(user, guide, %{"rating" => "8", "body" => "Very good."})

      assert review.status == "pending"
      assert review.rating == 8
      assert review.subject_type == "guide"
      assert review.subject_id == guide.id
    end

    test "rejects a review with no body", %{user: user, guide: guide} do
      assert {:error, changeset} = Social.create_review(user, guide, %{"rating" => "8"})
      assert %{body: ["can't be blank"]} = errors_on(changeset)
    end

    test "rejects a review with no rating", %{user: user, guide: guide} do
      assert {:error, changeset} = Social.create_review(user, guide, %{"body" => "No score."})
      assert %{rating: ["can't be blank"]} = errors_on(changeset)
    end

    test "refuses a second review of the same subject", %{user: user, guide: guide} do
      {:ok, _} = Social.create_review(user, guide, %{"rating" => "8", "body" => "First."})

      assert {:error, changeset} =
               Social.create_review(user, guide, %{"rating" => "2", "body" => "Second."})

      assert %{user_id: ["has already reviewed this"]} = errors_on(changeset)
    end
  end

  describe "update_review/2" do
    test "changes the rating and body", %{user: user, guide: guide} do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "8", "body" => "Good."})

      assert {:ok, updated} =
               Social.update_review(review, %{"rating" => "3", "body" => "Changed my mind."})

      assert updated.rating == 3
      assert updated.body == "Changed my mind."
    end

    test "returns an approved review to pending", %{user: user, guide: guide} do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "8", "body" => "Good."})
      approved = approve!(review)

      assert {:ok, updated} =
               Social.update_review(approved, %{"rating" => "8", "body" => "Edited after."})

      assert updated.status == "pending"
    end
  end

  describe "user_review/2" do
    test "nil for a logged-out visitor", %{guide: guide} do
      assert Social.user_review(nil, guide) == nil
    end

    test "returns the user's own review whatever its status", %{user: user, guide: guide} do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "8", "body" => "Mine."})

      assert Social.user_review(user, guide).id == review.id
    end

    test "does not return another user's review", %{user: user, guide: guide} do
      {:ok, _} = Social.create_review(user_fixture(), guide, %{"rating" => "8", "body" => "Theirs."})

      assert Social.user_review(user, guide) == nil
    end
  end

  describe "approved_reviews/1" do
    test "excludes pending reviews", %{user: user, guide: guide} do
      {:ok, _} = Social.create_review(user, guide, %{"rating" => "8", "body" => "Waiting."})

      assert Social.approved_reviews(guide) == []
    end

    test "includes approved ones with the author preloaded", %{user: user, guide: guide} do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "8", "body" => "Live."})
      approve!(review)

      assert [loaded] = Social.approved_reviews(guide)
      assert loaded.body == "Live."
      assert loaded.user.id == user.id
    end

    test "excludes revoked reviews", %{user: user, guide: guide} do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "8", "body" => "Gone."})
      review |> Ecto.Changeset.change(status: "revoked") |> Repo.update!()

      assert Social.approved_reviews(guide) == []
    end

    test "excludes reviews by a banned author", %{guide: guide} do
      banned = user_fixture()
      {:ok, review} = Social.create_review(banned, guide, %{"rating" => "8", "body" => "Banned."})
      approve!(review)

      banned
      |> Ecto.Changeset.change(banned_at: DateTime.utc_now() |> DateTime.truncate(:second))
      |> Repo.update!()

      assert Social.approved_reviews(guide) == []
    end

    test "is scoped to one subject", %{user: user, guide: guide} do
      other = guide_fixture()
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "8", "body" => "Here."})
      approve!(review)

      assert length(Social.approved_reviews(guide)) == 1
      assert Social.approved_reviews(other) == []
    end
  end

  describe "rating_summary/1" do
    test "zero and nil for a subject with no approved reviews", %{guide: guide} do
      assert Social.rating_summary(guide) == %{average: nil, count: 0}
    end

    test "ignores pending reviews", %{user: user, guide: guide} do
      {:ok, _} = Social.create_review(user, guide, %{"rating" => "10", "body" => "Pending."})

      assert Social.rating_summary(guide) == %{average: nil, count: 0}
    end

    test "averages approved ratings to one decimal", %{guide: guide} do
      for rating <- [7, 8, 10] do
        {:ok, review} =
          Social.create_review(user_fixture(), guide, %{
            "rating" => to_string(rating),
            "body" => "Scored #{rating}."
          })

        approve!(review)
      end

      assert Social.rating_summary(guide) == %{average: 8.3, count: 3}
    end

    test "excludes a banned author from the average", %{guide: guide} do
      banned = user_fixture()

      {:ok, low} = Social.create_review(banned, guide, %{"rating" => "1", "body" => "Low."})
      approve!(low)

      {:ok, high} =
        Social.create_review(user_fixture(), guide, %{"rating" => "9", "body" => "High."})

      approve!(high)

      banned
      |> Ecto.Changeset.change(banned_at: DateTime.utc_now() |> DateTime.truncate(:second))
      |> Repo.update!()

      assert Social.rating_summary(guide) == %{average: 9.0, count: 1}
    end
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/social_reviews_test.exs`
Expected: FAIL — `function Ethos.Social.create_review/3 is undefined`.

- [ ] **Step 3: Write the implementation**

In `lib/ethos/social.ex`, add `alias Ethos.Social.Review` to the existing aliases, then
append these functions before the final `end`:

```elixir
  ## Reviews
  #
  # A review is a rating out of ten plus the comment that justifies it. The
  # body is required, so every review carries text and every review is
  # moderated — which is exactly why reactions are instant and these are not.

  @doc """
  Records a pending review. Never publishes: an admin has to approve it.
  """
  def create_review(%User{} = user, subject, attrs) do
    {type, id} = Subject.ref(subject)

    %Review{}
    |> Review.changeset(
      Map.merge(normalize_review_attrs(attrs), %{
        user_id: user.id,
        subject_type: type,
        subject_id: id,
        status: "pending"
      })
    )
    |> Repo.insert()
  end

  @doc """
  Edits a review, returning it to `pending`.

  The reset is the point: without it, posting something innocuous, waiting
  for approval, then editing it into something else would publish
  unmoderated text.
  """
  def update_review(%Review{} = review, attrs) do
    review
    |> Review.changeset(Map.put(normalize_review_attrs(attrs), :status, "pending"))
    |> Repo.update()
  end

  @doc "This user's own review of a subject, at any status, or nil."
  def user_review(nil, _subject), do: nil

  def user_review(%User{} = user, subject) do
    {type, id} = Subject.ref(subject)

    Repo.get_by(Review, user_id: user.id, subject_type: type, subject_id: id)
  end

  @doc """
  The publicly visible reviews for a subject, newest first, author preloaded.

  Excludes anything not approved and anyone banned. The ban filter lives in
  the join so a ban takes effect on every page immediately, with no backfill.
  """
  def approved_reviews(subject) do
    subject
    |> public_reviews_query()
    |> order_by([r], desc: r.inserted_at, desc: r.id)
    |> preload(:user)
    |> Repo.all()
  end

  @doc """
  Average rating out of ten and how many reviews it is drawn from.

  `average` is `nil` rather than `0.0` when there is nothing to average —
  "no rating yet" and "rated zero" must not render the same, and the scale
  starts at 1 anyway.
  """
  def rating_summary(subject) do
    query = public_reviews_query(subject)

    case Repo.one(from r in query, select: {avg(r.rating), count(r.id)}) do
      {nil, _} -> %{average: nil, count: 0}
      {_avg, 0} -> %{average: nil, count: 0}
      {avg, count} -> %{average: avg |> Decimal.to_float() |> Float.round(1), count: count}
    end
  end

  defp public_reviews_query(subject) do
    {type, id} = Subject.ref(subject)

    from r in Review,
      join: u in User,
      on: u.id == r.user_id,
      where:
        r.subject_type == ^type and r.subject_id == ^id and
          r.status == "approved" and is_nil(u.banned_at)
  end

  # The form posts strings; the tests and the console pass atoms or strings
  # interchangeably. Normalising here keeps `Review.changeset/2` from having to
  # care which it got.
  defp normalize_review_attrs(attrs) do
    Map.new(attrs, fn
      {k, v} when is_binary(k) -> {String.to_existing_atom(k), v}
      {k, v} -> {k, v}
    end)
  end
```

Note `avg/1` returns a `Decimal` on Postgres, which is why the conversion is
explicit. If `Decimal` is not already available it comes in transitively with
Ecto; do not add it to `mix.exs`.

- [ ] **Step 4: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/social_reviews_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: both pass, 0 failures.

- [ ] **Step 5: Commit**

```bash
mix format lib/ethos/social.ex test/ethos/social_reviews_test.exs
git add lib/ethos/social.ex test/ethos/social_reviews_test.exs
git commit -m "feat: review reads and writes in the Social context"
```

---

### Task 3: The Moderation context

**Files:**
- Create: `lib/ethos/moderation.ex`
- Test: `test/ethos/moderation_test.exs`

**Interfaces:**
- Consumes: `Ethos.Social.Review` (Task 1).
- Produces:
  - `Moderation.list_pending_reviews/0` → list, `:user` preloaded, oldest first
  - `Moderation.list_approved_reviews/0` → list, `:user` preloaded, most recently moderated first
  - `Moderation.get_review!/1` → `%Review{}`, raises if absent
  - `Moderation.approve_review(review, admin)` → `{:ok, review}` | `{:error, changeset}`
  - `Moderation.revoke_review(review, admin)` → `{:ok, review}` | `{:error, changeset}`

- [ ] **Step 1: Write the failing test**

Create `test/ethos/moderation_test.exs`:

```elixir
defmodule Ethos.ModerationTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Moderation
  alias Ethos.Social

  setup do
    admin = user_fixture()
    guide = guide_fixture()
    {:ok, review} = Social.create_review(user_fixture(), guide, %{"rating" => "8", "body" => "Hi."})

    %{admin: admin, guide: guide, review: review}
  end

  describe "list_pending_reviews/0" do
    test "returns pending reviews with the author preloaded", %{review: review} do
      assert [found] = Moderation.list_pending_reviews()
      assert found.id == review.id
      assert found.user.id == review.user_id
    end

    test "excludes approved and revoked reviews", %{review: review, admin: admin} do
      {:ok, _} = Moderation.approve_review(review, admin)

      assert Moderation.list_pending_reviews() == []
    end

    test "is oldest first, so the longest wait is handled first", %{guide: guide} do
      {:ok, second} =
        Social.create_review(user_fixture(), guide, %{"rating" => "2", "body" => "Later."})

      ids = Enum.map(Moderation.list_pending_reviews(), & &1.id)

      assert List.last(ids) == second.id
    end
  end

  describe "approve_review/2" do
    test "publishes it and records who decided and when", %{review: review, admin: admin} do
      assert {:ok, approved} = Moderation.approve_review(review, admin)

      assert approved.status == "approved"
      assert approved.moderated_by_id == admin.id
      assert approved.moderated_at
    end

    test "an approved review becomes publicly visible", %{
      review: review,
      admin: admin,
      guide: guide
    } do
      assert Social.approved_reviews(guide) == []

      {:ok, _} = Moderation.approve_review(review, admin)

      assert [visible] = Social.approved_reviews(guide)
      assert visible.id == review.id
    end
  end

  describe "revoke_review/2" do
    test "hides it and records the decision", %{review: review, admin: admin} do
      {:ok, approved} = Moderation.approve_review(review, admin)

      assert {:ok, revoked} = Moderation.revoke_review(approved, admin)

      assert revoked.status == "revoked"
      assert revoked.moderated_by_id == admin.id
    end

    test "a revoked review disappears from the public page", %{
      review: review,
      admin: admin,
      guide: guide
    } do
      {:ok, approved} = Moderation.approve_review(review, admin)
      {:ok, _} = Moderation.revoke_review(approved, admin)

      assert Social.approved_reviews(guide) == []
    end

    test "a revoked review stops counting toward the average", %{
      review: review,
      admin: admin,
      guide: guide
    } do
      {:ok, approved} = Moderation.approve_review(review, admin)
      assert Social.rating_summary(guide).count == 1

      {:ok, _} = Moderation.revoke_review(approved, admin)
      assert Social.rating_summary(guide) == %{average: nil, count: 0}
    end
  end

  describe "list_approved_reviews/0" do
    test "returns approved reviews only", %{review: review, admin: admin} do
      {:ok, _} = Moderation.approve_review(review, admin)

      assert [found] = Moderation.list_approved_reviews()
      assert found.id == review.id
    end
  end

  describe "get_review!/1" do
    test "raises for an unknown id" do
      assert_raise Ecto.NoResultsError, fn -> Moderation.get_review!(0) end
    end
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/moderation_test.exs`
Expected: FAIL — `module Ethos.Moderation is not available`.

- [ ] **Step 3: Write the implementation**

Create `lib/ethos/moderation.ex`:

```elixir
defmodule Ethos.Moderation do
  @moduledoc """
  The admin's verbs over user-generated content.

  Separate from `Ethos.Social` on purpose: `Social` is how content works,
  this is what an administrator does *to* it. The console is the only
  caller, and keeping the two apart means a moderation change cannot
  accidentally alter how a page reads.

  Every decision records who made it and when. That is not bookkeeping for
  its own sake — a revoked comment is a dispute waiting to happen, and the
  answer to "who took this down" should not be "nobody knows".
  """

  import Ecto.Query, warn: false

  alias Ethos.Accounts.User
  alias Ethos.Repo
  alias Ethos.Social.Review

  @doc "Reviews awaiting a decision, oldest first."
  def list_pending_reviews do
    Repo.all(
      from r in Review,
        where: r.status == "pending",
        order_by: [asc: r.inserted_at, asc: r.id],
        preload: [:user]
    )
  end

  @doc "Reviews currently public, most recently decided first."
  def list_approved_reviews do
    Repo.all(
      from r in Review,
        where: r.status == "approved",
        order_by: [desc: r.moderated_at, desc: r.id],
        preload: [:user]
    )
  end

  def get_review!(id), do: Repo.get!(Review, id)

  @doc "Publishes a review."
  def approve_review(%Review{} = review, %User{} = admin), do: decide(review, "approved", admin)

  @doc "Hides a review, whether it was ever public or not."
  def revoke_review(%Review{} = review, %User{} = admin), do: decide(review, "revoked", admin)

  defp decide(%Review{} = review, status, %User{} = admin) do
    review
    |> Ecto.Changeset.change(
      status: status,
      moderated_at: DateTime.utc_now() |> DateTime.truncate(:second),
      moderated_by_id: admin.id
    )
    |> Repo.update()
  end
end
```

- [ ] **Step 4: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos/moderation_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: both pass, 0 failures.

- [ ] **Step 5: Commit**

```bash
mix format lib/ethos/moderation.ex test/ethos/moderation_test.exs
git add lib/ethos/moderation.ex test/ethos/moderation_test.exs
git commit -m "feat: moderation context for approving and revoking reviews"
```

---

### Task 4: The review form and list in the island

**Files:**
- Modify: `lib/ethos_web/live/social_live.ex`
- Test: `test/ethos_web/live/social_reviews_live_test.exs`

**Interfaces:**
- Consumes: `Social.create_review/3`, `Social.update_review/2`, `Social.user_review/2`, `Social.approved_reviews/1`, `Social.rating_summary/1` (Task 2); `Accounts.display_name/1`.
- Produces: no new module interface. The island gains `handle_event("rate", ...)` and `handle_event("submit_review", ...)`.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/live/social_reviews_live_test.exs`:

```elixir
defmodule EthosWeb.SocialReviewsLiveTest do
  use EthosWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Moderation
  alias Ethos.Social

  setup do
    %{guide: published_guide_fixture()}
  end

  defp live_island(conn, guide) do
    live_isolated(conn, EthosWeb.SocialLive,
      session: %{"subject_type" => "guide", "subject_id" => guide.id}
    )
  end

  describe "the form" do
    test "a logged-out visitor gets no review form", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_island(conn, guide)

      refute has_element?(view, "#review-form")
    end

    test "a logged-in user gets a form with ten rating buttons", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_island(log_in_user(conn, user_fixture()), guide)

      assert has_element?(view, "#review-form")

      for rating <- 1..10 do
        assert has_element?(view, "button[phx-value-rating=#{rating}]")
      end
    end
  end

  describe "submitting" do
    setup %{conn: conn} do
      %{conn: log_in_user(conn, user_fixture())}
    end

    test "a rating and comment creates a pending review", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_island(conn, guide)

      view |> element("button[phx-value-rating=8]") |> render_click()

      html =
        view
        |> form("#review-form", review: %{body: "Genuinely good."})
        |> render_submit()

      assert html =~ "waiting to be approved"
      assert Social.approved_reviews(guide) == []
    end

    test "the pending review is not shown to anyone else", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_island(conn, guide)
      view |> element("button[phx-value-rating=8]") |> render_click()
      view |> form("#review-form", review: %{body: "Not yet public."}) |> render_submit()

      {:ok, _other, html} = live_island(build_conn(), guide)

      refute html =~ "Not yet public."
    end

    test "an empty comment is refused", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_island(conn, guide)

      view |> element("button[phx-value-rating=8]") |> render_click()
      html = view |> form("#review-form", review: %{body: ""}) |> render_submit()

      assert html =~ "can&#39;t be blank" or html =~ "can't be blank"
    end

    test "submitting without choosing a rating is refused", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_island(conn, guide)

      html = view |> form("#review-form", review: %{body: "No stars picked."}) |> render_submit()

      assert html =~ "Pick a rating"
    end
  end

  describe "the approved list" do
    test "shows an approved review with the author's username", %{conn: conn, guide: guide} do
      author = user_fixture(%{username: "voyager"})
      admin = user_fixture()
      {:ok, review} = Social.create_review(author, guide, %{"rating" => "9", "body" => "Superb."})
      {:ok, _} = Moderation.approve_review(review, admin)

      {:ok, _view, html} = live_island(conn, guide)

      assert html =~ "Superb."
      assert html =~ "voyager"
      assert html =~ "9"
    end

    test "shows the average out of ten", %{conn: conn, guide: guide} do
      admin = user_fixture()

      for rating <- [7, 8, 10] do
        {:ok, review} =
          Social.create_review(user_fixture(), guide, %{
            "rating" => to_string(rating),
            "body" => "Scored."
          })

        {:ok, _} = Moderation.approve_review(review, admin)
      end

      {:ok, _view, html} = live_island(conn, guide)

      assert html =~ "8.3"
    end

    test "shows nothing about ratings when there are none", %{conn: conn, guide: guide} do
      {:ok, _view, html} = live_island(conn, guide)

      refute html =~ "out of 10"
    end
  end

  describe "editing" do
    test "an approved review returns to pending when its author edits it", %{
      conn: conn,
      guide: guide
    } do
      author = user_fixture()
      admin = user_fixture()
      {:ok, review} = Social.create_review(author, guide, %{"rating" => "9", "body" => "First."})
      {:ok, _} = Moderation.approve_review(review, admin)

      {:ok, view, _html} = live_island(log_in_user(conn, author), guide)

      view |> element("button[phx-value-rating=4]") |> render_click()
      view |> form("#review-form", review: %{body: "Edited afterwards."}) |> render_submit()

      assert Social.approved_reviews(guide) == []
      assert Social.user_review(author, guide).status == "pending"
    end
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/live/social_reviews_live_test.exs`
Expected: FAIL — there is no `#review-form`.

- [ ] **Step 3: Extend the island**

In `lib/ethos_web/live/social_live.ex`:

Add `alias Ethos.Social.Review` to the aliases.

Change `mount/3` to load reviews as well:

```elixir
  def mount(_params, %{"subject_type" => type, "subject_id" => id}, socket) do
    subject = Subject.get!(type, id)

    {:ok,
     socket
     |> assign(subject: subject, rating: nil, rating_error: nil)
     |> load_reactions()
     |> load_reviews()}
  end
```

Add this to `render/1`, immediately before the closing `</section>`:

```heex
      <div class="mt-8 border-t pt-6">
        <div :if={@summary.count > 0} class="flex items-baseline gap-2">
          <span class="text-2xl font-semibold">{@summary.average}</span>
          <span class="text-sm text-zinc-500">
            out of 10 · {@summary.count} {if @summary.count == 1, do: "review", else: "reviews"}
          </span>
        </div>

        <.review_form
          :if={@interactive}
          form={@review_form}
          rating={@rating}
          rating_error={@rating_error}
          existing={@own_review}
        />

        <p :if={@own_review && @own_review.status == "pending"} class="mt-3 text-sm text-zinc-500">
          Your review is waiting to be approved.
        </p>

        <ul class="mt-6 space-y-5">
          <li :for={review <- @reviews} class="border-t pt-4 first:border-t-0 first:pt-0">
            <div class="flex items-baseline gap-2">
              <span class="font-semibold">{Accounts.display_name(review.user)}</span>
              <span class="text-sm text-zinc-500">{review.rating}/10</span>
            </div>
            <p class="mt-1 whitespace-pre-line">{review.body}</p>
          </li>
        </ul>
      </div>
```

Add the form component and the two event handlers. Put the component with the
other private components, and the handlers immediately after the existing
`handle_event("react", ...)` clause but **before** the catch-all clause — a
clause added after the catch-all is unreachable:

```elixir
  attr :form, :any, required: true
  attr :rating, :integer, default: nil
  attr :rating_error, :string, default: nil
  attr :existing, :any, default: nil

  defp review_form(assigns) do
    ~H"""
    <div class="mt-4">
      <p class="text-sm font-medium">
        {if @existing, do: "Your review", else: "Rate it out of ten"}
      </p>

      <div class="mt-2 flex flex-wrap gap-1">
        <button
          :for={value <- 1..10}
          type="button"
          phx-click="rate"
          phx-value-rating={value}
          aria-pressed={to_string(@rating == value)}
          class={[
            "h-8 w-8 rounded border text-sm",
            @rating && value <= @rating && "bg-amber-400 border-amber-500",
            !(@rating && value <= @rating) && "hover:bg-zinc-50"
          ]}
        >
          {value}
        </button>
      </div>

      <p :if={@rating_error} class="mt-1 text-sm text-red-600">{@rating_error}</p>

      <.form for={@form} id="review-form" phx-submit="submit_review" class="mt-3">
        <.input
          field={@form[:body]}
          type="textarea"
          label="Why?"
          placeholder="What made it worth it — or not?"
        />
        <.button phx-disable-with="Sending...">
          {if @existing, do: "Update review", else: "Post review"}
        </.button>
      </.form>
    </div>
    """
  end

  def handle_event("rate", %{"rating" => rating}, socket) do
    {:noreply, assign(socket, rating: String.to_integer(rating), rating_error: nil)}
  end

  def handle_event("submit_review", %{"review" => params}, socket) do
    cond do
      not socket.assigns.interactive ->
        {:noreply, socket}

      is_nil(socket.assigns.rating) ->
        {:noreply, assign(socket, rating_error: "Pick a rating from 1 to 10.")}

      true ->
        save_review(socket, params)
    end
  end
```

And the private helpers, next to `load_reactions/1`:

```elixir
  defp save_review(socket, params) do
    user = socket.assigns.current_user
    subject = socket.assigns.subject
    attrs = %{"rating" => socket.assigns.rating, "body" => params["body"]}

    result =
      case socket.assigns.own_review do
        nil -> Social.create_review(user, subject, attrs)
        existing -> Social.update_review(existing, attrs)
      end

    case result do
      {:ok, _review} ->
        {:noreply, socket |> assign(rating_error: nil) |> load_reviews()}

      {:error, changeset} ->
        {:noreply, assign(socket, review_form: to_form(changeset, as: "review"))}
    end
  end

  defp load_reviews(socket) do
    user = socket.assigns[:current_user]
    subject = socket.assigns.subject
    own = Social.user_review(user, subject)

    assign(socket,
      reviews: Social.approved_reviews(subject),
      summary: Social.rating_summary(subject),
      own_review: own,
      rating: socket.assigns[:rating] || (own && own.rating),
      review_form: to_form(Review.changeset(own || %Review{}, %{}), as: "review")
    )
  end
```

- [ ] **Step 4: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/live/social_reviews_live_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: both pass, 0 failures. The existing `test/ethos_web/live/social_live_test.exs`
must still pass unchanged — if a reaction test breaks, the review markup has
displaced something it asserted on; fix the markup, not the reaction test.

- [ ] **Step 5: Commit**

```bash
mix format lib/ethos_web/live/social_live.ex test/ethos_web/live/social_reviews_live_test.exs
git add lib/ethos_web/live/social_live.ex test/ethos_web/live/social_reviews_live_test.exs
git commit -m "feat: rate out of ten with a required comment"
```

---

### Task 5: The admin comments queue

**Files:**
- Create: `lib/ethos_web/components/admin_nav.ex`
- Create: `lib/ethos_web/live/admin/comments_live.ex`
- Modify: `lib/ethos_web/router.ex` (the existing `/admin` scope)
- Modify: `lib/ethos_web/components/layouts.ex` (the Admin nav link)
- Modify: `lib/ethos_web/controllers/admin_suggestion_html/index.html.heex` (adopt the tab bar)
- Test: `test/ethos_web/live/admin/comments_live_test.exs`

**Interfaces:**
- Consumes: `Moderation.list_pending_reviews/0`, `list_approved_reviews/0`, `get_review!/1`, `approve_review/2`, `revoke_review/2` (Task 3); `Accounts.display_name/1`.
- Produces: route `/admin/comments`; `EthosWeb.AdminNav.admin_nav/1` with a `current` attr.

- [ ] **Step 1: Write the failing test**

Create `test/ethos_web/live/admin/comments_live_test.exs`:

```elixir
defmodule EthosWeb.Admin.CommentsLiveTest do
  use EthosWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Moderation
  alias Ethos.Social

  @admin_email "cryptcom@gmail.com"

  setup do
    # Admin-ness is keyed off the EMAIL matching :admin_email config, not the
    # username. Do not try to give this fixture the username "buoewe" — Plan 1
    # put that name on the reserved list, so `register_user/1` refuses it and
    # the fixture would fail.
    admin = user_fixture(%{email: @admin_email, username: "adminuser"})
    author = user_fixture(%{username: "voyager"})
    guide = published_guide_fixture()

    {:ok, review} =
      Social.create_review(author, guide, %{"rating" => "9", "body" => "Pending words."})

    %{admin: admin, author: author, guide: guide, review: review}
  end

  # Both of these use get/2 rather than live/2 on purpose. The guards are
  # PLUGS in the router pipeline, so they act on the HTTP request and halt
  # before the LiveView ever mounts. `require_admin_user` RENDERS a 404 and
  # halts — it does not raise — so `assert_error_sent` would never fire.
  # This matches the existing pattern in
  # test/ethos_web/controllers/admin_suggestion_controller_test.exs:61-68.
  test "a logged-out visitor is sent to log in", %{conn: conn} do
    assert conn |> get(~p"/admin/comments") |> redirected_to() == ~p"/users/log_in"
  end

  test "a non-admin gets a 404 rather than a hint the page exists", %{conn: conn} do
    conn = log_in_user(conn, user_fixture(%{email: "not-admin@example.com"}))

    assert conn |> get(~p"/admin/comments") |> html_response(404)
  end

  test "the admin sees pending comments with author and rating", %{conn: conn, admin: admin} do
    {:ok, _view, html} = conn |> log_in_user(admin) |> live(~p"/admin/comments")

    assert html =~ "Pending words."
    assert html =~ "voyager"
    assert html =~ "9"
  end

  test "approving publishes the comment", %{conn: conn, admin: admin, review: review, guide: guide} do
    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/comments")

    view |> element("button[phx-value-id=#{review.id}][phx-click=approve]") |> render_click()

    assert [visible] = Social.approved_reviews(guide)
    assert visible.id == review.id
  end

  test "an approved comment leaves the pending queue", %{conn: conn, admin: admin, review: review} do
    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/comments")

    html = view |> element("button[phx-value-id=#{review.id}][phx-click=approve]") |> render_click()

    refute html =~ "Pending words."
  end

  test "revoking hides a published comment", %{
    conn: conn,
    admin: admin,
    review: review,
    guide: guide
  } do
    {:ok, _} = Moderation.approve_review(review, admin)

    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/comments")

    view |> element("button[phx-value-id=#{review.id}][phx-click=revoke]") |> render_click()

    assert Social.approved_reviews(guide) == []
  end

  test "the queue reports when it is empty", %{conn: conn, admin: admin, review: review} do
    {:ok, _} = Moderation.approve_review(review, admin)

    {:ok, _view, html} = conn |> log_in_user(admin) |> live(~p"/admin/comments")

    assert html =~ "Nothing waiting"
  end

  test "the console links to the suggestions tab", %{conn: conn, admin: admin} do
    {:ok, _view, html} = conn |> log_in_user(admin) |> live(~p"/admin/comments")

    assert html =~ ~s(href="/admin/suggestions")
  end
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/live/admin/comments_live_test.exs`
Expected: FAIL — no route matches `/admin/comments`.

- [ ] **Step 3: Write the shared tab bar**

Create `lib/ethos_web/components/admin_nav.ex`:

```elixir
defmodule EthosWeb.AdminNav do
  @moduledoc """
  The admin console's tab bar.

  A component rather than a layout because the console is half LiveView
  (comments) and half controller (suggestions), and a shared component is
  the only thing both can render identically.
  """
  use Phoenix.Component
  use Phoenix.VerifiedRoutes, endpoint: EthosWeb.Endpoint, router: EthosWeb.Router

  attr :current, :atom, required: true

  def admin_nav(assigns) do
    ~H"""
    <nav class="mb-6 flex gap-4 border-b text-sm">
      <.tab label="Comments" href={~p"/admin/comments"} active={@current == :comments} />
      <.tab label="Suggestions" href={~p"/admin/suggestions"} active={@current == :suggestions} />
    </nav>
    """
  end

  attr :label, :string, required: true
  attr :href, :string, required: true
  attr :active, :boolean, required: true

  defp tab(assigns) do
    ~H"""
    <.link
      href={@href}
      class={[
        "-mb-px border-b-2 px-1 pb-2",
        @active && "border-zinc-900 font-semibold",
        !@active && "border-transparent text-zinc-500 hover:text-zinc-900"
      ]}
    >
      {@label}
    </.link>
    """
  end
end
```

- [ ] **Step 4: Write the queue**

Create `lib/ethos_web/live/admin/comments_live.ex`:

```elixir
defmodule EthosWeb.Admin.CommentsLive do
  @moduledoc """
  The comment moderation queue.

  Pending comments are invisible to everyone but their author until they are
  approved here, so this page is the only thing standing between a new
  account and the front of the site.
  """
  use EthosWeb, :live_view

  alias Ethos.Accounts
  alias Ethos.Moderation

  def mount(_params, _session, socket) do
    {:ok, load(socket)}
  end

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-3xl px-4 py-10">
      <EthosWeb.AdminNav.admin_nav current={:comments} />

      <h1 class="text-2xl font-bold">Comments</h1>

      <section class="mt-6">
        <h2 class="text-sm font-semibold uppercase tracking-wide text-zinc-500">Waiting</h2>

        <p :if={@pending == []} class="mt-3 text-zinc-500">Nothing waiting. 🎉</p>

        <ul class="mt-3 space-y-3">
          <li :for={review <- @pending} class="rounded-lg border p-4">
            <.review_row review={review} />
            <div class="mt-3 flex gap-2">
              <.button phx-click="approve" phx-value-id={review.id}>Approve</.button>
              <.button phx-click="revoke" phx-value-id={review.id} class="bg-red-600">
                Revoke
              </.button>
            </div>
          </li>
        </ul>
      </section>

      <section class="mt-10">
        <h2 class="text-sm font-semibold uppercase tracking-wide text-zinc-500">Published</h2>

        <p :if={@approved == []} class="mt-3 text-zinc-500">Nothing published yet.</p>

        <ul class="mt-3 space-y-3">
          <li :for={review <- @approved} class="rounded-lg border p-4">
            <.review_row review={review} />
            <div class="mt-3">
              <.button phx-click="revoke" phx-value-id={review.id} class="bg-red-600">
                Revoke
              </.button>
            </div>
          </li>
        </ul>
      </section>
    </div>
    """
  end

  attr :review, :map, required: true

  defp review_row(assigns) do
    ~H"""
    <div>
      <p class="text-sm text-zinc-500">
        <span class="font-semibold text-zinc-900">{Accounts.display_name(@review.user)}</span>
        · {@review.rating}/10 · {@review.subject_type}
      </p>
      <p class="mt-1 whitespace-pre-line">{@review.body}</p>
    </div>
    """
  end

  def handle_event("approve", %{"id" => id}, socket) do
    {:ok, _} =
      id
      |> Moderation.get_review!()
      |> Moderation.approve_review(socket.assigns.current_user)

    {:noreply, socket |> put_flash(:info, "Approved.") |> load()}
  end

  def handle_event("revoke", %{"id" => id}, socket) do
    {:ok, _} =
      id
      |> Moderation.get_review!()
      |> Moderation.revoke_review(socket.assigns.current_user)

    {:noreply, socket |> put_flash(:info, "Revoked.") |> load()}
  end

  defp load(socket) do
    assign(socket,
      pending: Moderation.list_pending_reviews(),
      approved: Moderation.list_approved_reviews(),
      page_title: "Comments"
    )
  end
end
```

- [ ] **Step 5: Wire the route**

In `lib/ethos_web/router.ex`, the `/admin` scope currently pipes through
`[:browser, :require_authenticated_user, :require_admin_user]` and holds only
controller routes. Add a `live_session` inside that same scope so the LiveView
gets the admin check on mount as well as on the initial request:

```elixir
  scope "/admin", EthosWeb do
    pipe_through [:browser, :require_authenticated_user, :require_admin_user]

    live_session :admin,
      on_mount: [{EthosWeb.UserAuth, :ensure_authenticated}] do
      live "/comments", Admin.CommentsLive, :index
    end

    get "/suggestions", AdminSuggestionController, :index
    post "/suggestions/:id/accept", AdminSuggestionController, :accept
    post "/suggestions/:id/decline", AdminSuggestionController, :decline
  end
```

- [ ] **Step 6: Point the header at the console and give suggestions the tab bar**

In `lib/ethos_web/components/layouts.ex`, the admin link currently navigates to
`~p"/admin/suggestions"`. Change it to `~p"/admin/comments"` — comments are the
queue that needs daily attention; suggestions are occasional.

In `lib/ethos_web/controllers/admin_suggestion_html/index.html.heex`, the file opens:

```heex
<div class="mx-auto max-w-2xl px-4 py-10">
  <h1 class="text-3xl font-bold">Suggestion queue</h1>
```

Insert the tab bar between those two lines, so it sits above the heading:

```heex
<div class="mx-auto max-w-2xl px-4 py-10">
  <EthosWeb.AdminNav.admin_nav current={:suggestions} />
  <h1 class="text-3xl font-bold">Suggestion queue</h1>
```

- [ ] **Step 7: Run tests**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/live/admin/comments_live_test.exs test/ethos_web/controllers/admin_suggestion_controller_test.exs`
then `MIX_TEST_PARTITION=_social mix test`
Expected: both pass, 0 failures.

- [ ] **Step 8: Commit**

```bash
mix format lib/ethos_web/components/admin_nav.ex lib/ethos_web/live/admin/comments_live.ex lib/ethos_web/router.ex lib/ethos_web/components/layouts.ex lib/ethos_web/controllers/admin_suggestion_html/index.html.heex test/ethos_web/live/admin/comments_live_test.exs
git add lib/ethos_web/components/admin_nav.ex lib/ethos_web/live/admin/comments_live.ex lib/ethos_web/router.ex lib/ethos_web/components/layouts.ex lib/ethos_web/controllers/admin_suggestion_html/index.html.heex test/ethos_web/live/admin/comments_live_test.exs
git commit -m "feat: admin comment moderation queue"
```

---

### Task 6: Extend the public identity guard to review bylines

The spec's "Identity" section asks for a regression test proving an email never
appears on a page carrying an approved review. Plan 1 could not write it —
reviews did not exist. Now they do.

**Files:**
- Modify: `test/ethos_web/controllers/public_identity_test.exs`

**Interfaces:**
- Consumes: `Social.create_review/3`, `Moderation.approve_review/2`.
- Produces: nothing.

- [ ] **Step 1: Write the failing test**

The file currently has a module comment naming place, guide and collection pages
as not yet covered. Delete that sentence — this task covers them — and append
these tests inside the `defmodule`:

```elixir
  describe "review bylines" do
    setup do
      %{admin: user_fixture(), guide: Ethos.GuidesFixtures.published_guide_fixture()}
    end

    test "an approved review shows the username and never the email", %{
      conn: conn,
      admin: admin,
      guide: guide
    } do
      author = user_fixture(%{email: "reviewer-secret@example.com", username: "voyager"})

      {:ok, review} =
        Ethos.Social.create_review(author, guide, %{"rating" => "9", "body" => "Real words."})

      {:ok, _} = Ethos.Moderation.approve_review(review, admin)

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html =~ "Real words."
      assert html =~ "voyager"
      refute html =~ "reviewer-secret@example.com"
    end

    test "the admin queue shows the username and never the email", %{
      conn: conn,
      guide: guide
    } do
      # Use admin_fixture/0 rather than spelling the admin email out. The
      # literal is load-bearing — it must match :admin_email config for
      # Accounts.admin?/1 — and having it in several files at once caused a
      # Postgres deadlock between concurrent async inserts. The helper is the
      # single place it lives now; this file is `async: false` for the same
      # reason.
      admin = admin_fixture()
      author = user_fixture(%{email: "queued-secret@example.com", username: "traveller"})

      {:ok, _} =
        Ethos.Social.create_review(author, guide, %{"rating" => "4", "body" => "In the queue."})

      html =
        conn
        |> log_in_user(admin)
        |> get(~p"/admin/comments")
        |> html_response(200)

      assert html =~ "traveller"
      refute html =~ "queued-secret@example.com"
    end
  end
```

- [ ] **Step 2: Run test to verify it passes or fails honestly**

Run: `MIX_TEST_PARTITION=_social mix test test/ethos_web/controllers/public_identity_test.exs`
Expected: PASS, because Tasks 4 and 5 already call `Accounts.display_name/1`.

**If it passes on the first run, prove it has teeth**: temporarily change the
review byline in `lib/ethos_web/live/social_live.ex` from
`Accounts.display_name(review.user)` to `review.user.email`, confirm the first
test fails, then restore it. Report that you did this and what you saw. A guard
that has never been seen to fail is not a guard.

- [ ] **Step 3: Commit**

```bash
mix format test/ethos_web/controllers/public_identity_test.exs
git add test/ethos_web/controllers/public_identity_test.exs
git commit -m "test: email never appears on a page carrying a review"
```

---

## Done when

- `MIX_TEST_PARTITION=_social mix test` is green, with no reduction from the 1012-test baseline.
- A logged-in user can rate a place, guide or collection from 1 to 10 with a required comment, and edit their own review afterwards.
- A new review is invisible to everyone but its author until the admin approves it, and editing an approved review hides it again.
- The average renders as a score out of ten alongside the number of reviews it is drawn from, excluding pending, revoked and banned-author reviews.
- `/admin/comments` lists what is waiting, publishes on approve, and hides on revoke — with the decision's author and timestamp recorded.
- The admin console has one tab bar shared by Comments and Suggestions.
- Email never appears on a public page carrying a review, proven by a test that has been seen to fail.

## Notes for Plan 3b

- `users.trusted_at` exists and nothing reads it. The fast lane belongs in
  `Social.create_review/3` (insert as `approved` when the author is trusted) and in
  `Moderation.approve_review/2` (set `trusted_at` when it is nil).
- `users.banned_at` is read by `Social.approved_reviews/1` and `rating_summary/1` but
  nothing writes it. Ban enforcement belongs in `Ethos.Moderation`, plus
  `UserSessionController.create/3` and `EthosWeb.UserAuth.fetch_current_user/2`.
- `test/ethos_web/controllers/user_session_controller_test.exs:93` asserts the login
  failure flash is exactly `"Invalid email or password"`. A banned user gets a different
  message, so that test needs a sibling rather than an edit.
- `EthosWeb.AdminNav.admin_nav/1` takes a `current` atom; adding a Users tab is one line
  there plus one route.
