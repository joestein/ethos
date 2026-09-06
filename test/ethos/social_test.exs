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

  describe "badge count queries" do
    import Ethos.PlacesFixtures

    setup do
      user = user_fixture()

      # A place's geography is the destination NODE it names — the
      # town/state/county triple these counts used to filter on is gone. So the
      # fixture takes a roster path and the assertions below compare node ids,
      # not derived slugs. That closes the hole the old comment here warned
      # about from the other side: a slug key was silently dropped and every
      # place landed in the same town, so the by-town and by-county assertions
      # passed while proving nothing. A path that names no roster node raises
      # in the fixture, so the same mistake now fails loudly.
      open = fn attrs ->
        place_fixture(
          Enum.into(attrs, %{
            status: "open",
            kind: "museum"
          })
        )
      end

      node = fn path ->
        Ethos.SeedDataHelpers.seed_destination_paths!([path])
        Ethos.Destinations.get_by_path(path)
      end

      %{user: user, open: open, node: node}
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

    # The test above proves nothing on its own: this test's transaction never
    # inserts a place row with an id equal to the guide's, so the join
    # `on p.id == r.subject_id` would find zero matching rows and the count
    # would come out 0 even if the `subject_type == "place"` guard were
    # deleted from `reacted_places_query/1`. This test forces the actual
    # collision the guard exists to prevent: a "guide" reaction whose
    # subject_id is a real place's id.
    test "a guide reaction sharing an id with a real place still does not count",
         %{user: user, open: open} do
      place = open.(%{})

      %Reaction{}
      |> Ecto.Changeset.change(%{
        user_id: user.id,
        subject_type: "guide",
        subject_id: place.id,
        value: "up"
      })
      |> Repo.insert!()

      assert Social.reacted_place_count(user) == 0
    end

    test "by node", %{user: user, open: open, node: node} do
      waterbury = node.("united-states/connecticut/new-haven-county/waterbury")

      Social.react(user, open.(%{destination_path: waterbury.path}), "up")

      Social.react(
        user,
        open.(%{destination_path: "united-states/connecticut/fairfield-county/danbury"}),
        "up"
      )

      assert Social.reacted_place_count_by_node(user, waterbury.id) == 1
    end

    test "by kinds", %{user: user, open: open} do
      Social.react(user, open.(%{kind: "cafe"}), "up")
      Social.react(user, open.(%{kind: "brewery"}), "up")
      Social.react(user, open.(%{kind: "museum"}), "up")

      assert Social.reacted_place_count_by_kinds(user, ["cafe", "brewery"]) == 2
    end

    test "in a set of nodes", %{user: user, open: open, node: node} do
      waterbury = node.("united-states/connecticut/new-haven-county/waterbury")
      middlebury = node.("united-states/connecticut/new-haven-county/middlebury")

      Social.react(user, open.(%{destination_path: waterbury.path}), "up")
      Social.react(user, open.(%{destination_path: middlebury.path}), "up")

      Social.react(
        user,
        open.(%{destination_path: "united-states/connecticut/fairfield-county/danbury"}),
        "up"
      )

      # The old version of this test needed a Vermont place carrying the county
      # name "New Haven County" to prove the state half of the where clause was
      # load-bearing — two counties in two states derived the same slug, and
      # without `state_slug` the Connecticut count inflated to 2. Node ids
      # cannot collide that way, so the failure mode is gone by construction
      # and there is nothing left to pin. What replaces it is the subtree
      # property the county-complete badge actually depends on: two DIFFERENT
      # town nodes under one county both count, and a town under another county
      # does not.
      assert Social.reacted_place_count_in_nodes(user, [waterbury.id, middlebury.id]) == 2
      assert Social.reacted_place_count_in_nodes(user, [waterbury.id]) == 1
    end
  end
end
