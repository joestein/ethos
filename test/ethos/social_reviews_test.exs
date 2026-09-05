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

    test "ignores a caller-supplied status and always stores pending", %{
      user: user,
      guide: guide
    } do
      assert {:ok, review} =
               Social.create_review(user, guide, %{
                 "rating" => "8",
                 "body" => "Sneaky.",
                 "status" => "approved"
               })

      assert review.status == "pending"
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
      {:ok, _} =
        Social.create_review(user_fixture(), guide, %{"rating" => "8", "body" => "Theirs."})

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
