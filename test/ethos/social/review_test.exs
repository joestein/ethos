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
