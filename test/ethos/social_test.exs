defmodule Ethos.SocialTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Social
  alias Ethos.Social.Reaction

  setup do
    %{user: user_fixture(), guide: guide_fixture()}
  end

  # Directly writes a reaction row, bypassing Social entirely. Used to
  # land a row in the gap `react/3`'s own read-then-write leaves open,
  # without needing real concurrency: see `intercept_next_query/1`.
  defp insert_reaction!(user, guide, value) do
    %Reaction{}
    |> Ecto.Changeset.change(%{
      user_id: user.id,
      subject_type: "guide",
      subject_id: guide.id,
      value: value
    })
    |> Repo.insert!()
  end

  # Removes a user's reaction to a guide directly, bypassing Social.
  # Used to simulate another request deleting the row between `react/3`'s
  # read and its write.
  defp delete_reaction!(user, guide) do
    Repo.delete_all(
      from(r in Reaction,
        where: r.user_id == ^user.id and r.subject_type == "guide" and r.subject_id == ^guide.id
      )
    )
  end

  # Runs `fun` once, synchronously, right after the next Ecto query issued
  # by THIS test's own process completes, and before control returns to
  # its caller. This is what lets these tests land a write in the narrow
  # gap between `react/3`'s read and its own write without any real
  # concurrency: the query's result is already fixed by the time the
  # telemetry event fires, so `fun` only affects what subsequent queries
  # in the same call see, exactly like a concurrent request would.
  #
  # `:telemetry.attach/4` is process-global, and this suite runs
  # `async: true`, so a handler that fired on ANY query would just as
  # happily catch some other test's query running concurrently in its own
  # process — corrupting that test's data instead of this one's. Filtering
  # on `self()` (the process a telemetry handler runs in is always the
  # one that emitted the event) keeps each test's interception scoped to
  # its own queries.
  defp intercept_next_query(fun) do
    test_pid = self()
    handler_id = {__MODULE__, make_ref()}

    :telemetry.attach(
      handler_id,
      [:ethos, :repo, :query],
      fn _event, _measurements, _metadata, _config ->
        if self() == test_pid do
          :telemetry.detach(handler_id)
          fun.()
        end
      end,
      nil
    )

    on_exit(fn -> :telemetry.detach(handler_id) end)
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

  describe "react/3 concurrency handling" do
    test "a concurrent insert of the opposite value resolves the retry to :switched",
         %{user: user, guide: guide} do
      # Lands after react/3's own read finds nothing, and before its
      # insert runs — the exact gap a second concurrent click would race
      # into.
      intercept_next_query(fn -> insert_reaction!(user, guide, "up") end)

      assert {:ok, :switched} = Social.react(user, guide, "down")
      assert Social.user_reaction(user, guide) == "down"
      assert Social.counts(guide) == %{up: 0, down: 1}
    end

    test "a concurrent insert of the same value resolves the retry to :cleared",
         %{user: user, guide: guide} do
      intercept_next_query(fn -> insert_reaction!(user, guide, "up") end)

      assert {:ok, :cleared} = Social.react(user, guide, "up")
      assert Social.user_reaction(user, guide) == nil
      assert Social.counts(guide) == %{up: 0, down: 0}
    end

    test "an invalid value never reaches the database and does not engage the retry",
         %{user: user, guide: guide} do
      {:ok, counter} = Agent.start_link(fn -> 0 end)
      test_pid = self()
      handler_id = {__MODULE__, make_ref()}

      :telemetry.attach(
        handler_id,
        [:ethos, :repo, :query],
        fn _event, _measurements, %{source: source}, counter ->
          if self() == test_pid and source == "reactions" do
            Agent.update(counter, &(&1 + 1))
          end
        end,
        counter
      )

      on_exit(fn -> :telemetry.detach(handler_id) end)

      assert {:error, changeset} = Social.react(user, guide, "sideways")
      assert %{value: ["is invalid"]} = errors_on(changeset)

      # Exactly one query: the initial read. An invalid changeset never
      # reaches Repo.insert's adapter call, so unique_reaction_collision?
      # never gets a real unique-constraint error to match, and the
      # retry — which exists only to rescue that specific collision — is
      # never engaged.
      #
      # An analogous "invalid subject_type" case cannot exist here:
      # Subject.ref/1 has no catch-all clause, so react/3 can never reach
      # Reaction.changeset/2 with a subject_type outside place/guide/
      # collection. That validation is covered directly, on the
      # changeset, in test/ethos/social/reaction_test.exs.
      assert Agent.get(counter, & &1) == 1

      :telemetry.detach(handler_id)
    end

    test "the row disappearing before a switch write returns an error instead of raising",
         %{user: user, guide: guide} do
      {:ok, :added} = Social.react(user, guide, "up")

      # Lands after react/3's own read finds the existing "up" row, and
      # before its update runs — simulating another request deleting the
      # reaction in that gap.
      intercept_next_query(fn -> delete_reaction!(user, guide) end)

      assert {:error, changeset} = Social.react(user, guide, "down")
      assert %{id: ["is stale"]} = errors_on(changeset)
    end

    test "the row disappearing before a clear write returns an error instead of raising",
         %{user: user, guide: guide} do
      {:ok, :added} = Social.react(user, guide, "up")

      intercept_next_query(fn -> delete_reaction!(user, guide) end)

      assert {:error, changeset} = Social.react(user, guide, "up")
      assert %{id: ["is stale"]} = errors_on(changeset)
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
