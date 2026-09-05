defmodule Ethos.ModerationTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Moderation
  alias Ethos.Social

  setup do
    admin = user_fixture()
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
