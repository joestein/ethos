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
