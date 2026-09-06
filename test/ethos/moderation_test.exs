defmodule Ethos.ModerationTest do
  # async: false — `admin_fixture/1` inserts a user with the fixed admin
  # email required by `Ethos.Accounts.admin?/1`. Running alongside other
  # async modules that do the same has caused intermittent Postgres
  # deadlocks on the concurrent same-email inserts; see the fixture's
  # moduledoc.
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Moderation
  alias Ethos.Social

  setup do
    admin = admin_fixture()
    guide = guide_fixture()

    {:ok, review} =
      Social.create_review(user_fixture(), guide, %{"rating" => "8", "body" => "Hi."})

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

    test "refuses a non-admin user and leaves the review pending", %{review: review} do
      not_admin = user_fixture()

      assert Moderation.approve_review(review, not_admin) == {:error, :unauthorized}
      assert Moderation.get_review!(review.id).status == "pending"
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

    test "refuses a non-admin user and leaves it published", %{review: review, admin: admin} do
      {:ok, approved} = Moderation.approve_review(review, admin)
      not_admin = user_fixture()

      assert Moderation.revoke_review(approved, not_admin) == {:error, :unauthorized}
      assert Moderation.get_review!(approved.id).status == "approved"
    end
  end

  describe "list_approved_reviews/0" do
    test "returns approved reviews only", %{review: review, admin: admin} do
      {:ok, _} = Moderation.approve_review(review, admin)

      assert [found] = Moderation.list_approved_reviews()
      assert found.id == review.id
    end

    # Postgres sorts NULLs first on a plain `DESC`, and a review approved
    # straight through `Ecto.Changeset.change/2` here (bypassing `decide/3`,
    # the way Plan 3b's trusted fast lane bypasses it in production) never
    # gets a `moderated_at`. Without `desc_nulls_last` that review would sit
    # pinned above one genuinely decided moments ago.
    test "orders by moderated_at, most recently decided first", %{guide: guide} do
      {:ok, earlier} =
        Social.create_review(user_fixture(), guide, %{"rating" => "3", "body" => "Earlier."})

      {:ok, earlier} =
        earlier
        |> Ecto.Changeset.change(status: "approved", moderated_at: ~U[2026-01-01 00:00:00Z])
        |> Repo.update()

      {:ok, later} =
        Social.create_review(user_fixture(), guide, %{"rating" => "9", "body" => "Later."})

      {:ok, later} =
        later
        |> Ecto.Changeset.change(status: "approved", moderated_at: ~U[2026-02-01 00:00:00Z])
        |> Repo.update()

      assert Enum.map(Moderation.list_approved_reviews(), & &1.id) == [later.id, earlier.id]
    end

    test "a review approved with no moderated_at sorts after one that has it", %{guide: guide} do
      {:ok, decided} =
        Social.create_review(user_fixture(), guide, %{"rating" => "8", "body" => "Decided."})

      {:ok, decided} =
        decided
        |> Ecto.Changeset.change(status: "approved", moderated_at: ~U[2026-01-01 00:00:00Z])
        |> Repo.update()

      {:ok, fast_laned} =
        Social.create_review(user_fixture(), guide, %{"rating" => "6", "body" => "Fast-laned."})

      {:ok, fast_laned} =
        fast_laned
        |> Ecto.Changeset.change(status: "approved")
        |> Repo.update()

      assert Enum.map(Moderation.list_approved_reviews(), & &1.id) == [decided.id, fast_laned.id]
    end
  end

  describe "get_review!/1" do
    test "raises for an unknown id" do
      assert_raise Ecto.NoResultsError, fn -> Moderation.get_review!(0) end
    end
  end
end
