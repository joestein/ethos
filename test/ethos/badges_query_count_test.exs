defmodule Ethos.BadgesQueryCountTest do
  @moduledoc """
  The badge evaluation that runs on **every reaction** must cost a number of
  queries that does not move when the destination tree grows.

  It has been wrong twice. Main shipped a commit called "silence badge query
  storms"; the node-based rewrite reintroduced a worse one, because a
  county-tier badge spans a subtree and the first implementation resolved that
  subtree by asking for its descendant *paths* and then re-reading each path as
  a row. Measured against the committed 752-node roster, one `check_and_award/2`
  issued **1,272** queries — 1,265 of them building the catalogue of badges the
  reaction could not possibly have earned.

  Prose cannot hold that line, so this file counts. The assertions are the
  shape of the fix rather than a single magic number: growing the tree — both
  *inside* the county whose badge is being evaluated and beside it — must not
  add a single query.
  """
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.{Badges, Destinations, Places}

  # Ecto emits this in the process that ran the query, so filtering on the pid
  # is what keeps a concurrent async test's queries out of the count. A named
  # function rather than a closure: :telemetry warns (loudly, once per handler)
  # about local captures.
  @event [:ethos, :repo, :query]

  def count_query(_event, _measurements, _metadata, %{pid: pid, counter: counter}) do
    if self() == pid, do: :counters.add(counter, 1, 1)
  end

  defp queries(fun) do
    counter = :counters.new(1, [])
    id = "badge-query-count-#{System.unique_integer([:positive])}"

    :telemetry.attach(id, @event, &__MODULE__.count_query/4, %{pid: self(), counter: counter})

    try do
      fun.()
      :counters.get(counter, 1)
    after
      :telemetry.detach(id)
    end
  end

  defp node!(path, name, kind, parent) do
    Destinations.upsert_destination!(%{
      path: path,
      name: name,
      kind: kind,
      intro: "#{name}.",
      parent_id: parent && parent.id
    })
  end

  defp place!(node, slug) do
    Places.upsert_place!(%{
      slug: slug,
      name: slug,
      kind: "museum",
      summary: "x",
      destination_id: node.id
    })
  end

  setup do
    region = node!("qc-region", "QC Region", "region", nil)
    county = node!("qc-region/qc-county", "QC County", "county", region)
    town = node!("qc-region/qc-county/qc-town", "QC Town", "town", county)

    for i <- 1..3, do: place!(town, "qc-town-#{i}")

    %{region: region, county: county, town: town, place: Places.get_place_by_slug!("qc-town-1")}
  end

  # Grows the tree in the two directions that used to cost a query each: more
  # nodes *under* the county being evaluated (the N+1 that `descendant_paths/1`
  # plus a `get_by_path/1` per path produced) and more county-tier nodes beside
  # it (the per-county pass that built the whole catalogue).
  defp grow!(region, county) do
    for i <- 1..25 do
      inner = node!("qc-region/qc-county/inner-#{i}", "Inner #{i}", "town", county)
      for j <- 1..3, do: place!(inner, "inner-#{i}-#{j}")

      other = node!("qc-region/other-#{i}", "Other #{i}", "county", region)
      other_town = node!("qc-region/other-#{i}/t", "Other Town #{i}", "town", other)
      for j <- 1..3, do: place!(other_town, "other-#{i}-#{j}")
    end
  end

  test "check_and_award/2 costs the same whether the tree has 3 nodes or 78", ctx do
    # Both users are created OUTSIDE the measured block: the fixture issues
    # queries of its own and they are not what this test is counting.
    user_a = user_fixture()
    user_b = user_fixture()

    small = queries(fn -> Badges.check_and_award(user_a, ctx.place) end)

    grow!(ctx.region, ctx.county)

    large = queries(fn -> Badges.check_and_award(user_b, ctx.place) end)

    assert large == small,
           "badge evaluation grew from #{small} to #{large} queries when the tree grew — " <>
             "something is querying per node again"

    # A ceiling as well as an invariant: an implementation that queried a fixed
    # forty times would satisfy the equality above and still be a storm. The
    # measured cost is one read of the user's badges, five to assemble the
    # candidate definitions and six to evaluate them.
    assert small <= 12, "check_and_award/2 issued #{small} queries; the budget is 12"
  end

  test "definitions/0 costs two queries whatever the tree looks like", ctx do
    assert queries(fn -> Badges.definitions() end) == 2

    grow!(ctx.region, ctx.county)

    assert queries(fn -> Badges.definitions() end) == 2
  end

  # The catalogue is what `SocialLive` looks an awarded badge up in
  # (`Map.fetch!/2`, which raises), so a definition `check_and_award/2` can
  # award and `definitions/0` does not list would be a 500 on the flash path.
  test "every definition a reaction can award is also in the full catalogue", ctx do
    grow!(ctx.region, ctx.county)

    catalogue = MapSet.new(Badges.definitions(), & &1.key)

    for def <- Badges.candidate_definitions(ctx.place) do
      assert MapSet.member?(catalogue, def.key),
             "#{def.key} is awardable but absent from definitions/0"

      assert def == Enum.find(Badges.definitions(), &(&1.key == def.key)),
             "#{def.key} differs between the candidate set and the catalogue"
    end
  end
end
