defmodule Ethos.Badges do
  @moduledoc """
  Explorer badges. Definitions live in code; earned badges are rows in
  `user_badges`. Badges are awarded when a user reacts (thumbs up or down)
  to a place and never revoked. Zero AI involvement — plain Ecto counts.
  """

  import Ecto.Query, warn: false
  require Logger

  alias Ethos.Destinations
  alias Ethos.Destinations.Destination
  alias Ethos.Repo
  alias Ethos.Badges.UserBadge
  alias Ethos.Places
  alias Ethos.Places.Place
  alias Ethos.Social

  @food_kinds ~w(restaurant cafe brewery)
  @history_kinds ~w(museum historic-site theater)

  @town_overrides %{
    "waterbury" => %{name: "Brass City Explorer", emoji: "🏭", threshold: 5},
    "danbury" => %{name: "Hat City Explorer", emoji: "🎩", threshold: 5},
    "middlebury" => %{name: "Middlebury Explorer", emoji: "🎡", threshold: 3},
    "southbury" => %{name: "Southbury Explorer", emoji: "🌳", threshold: 3},
    "woodbury" => %{name: "Woodbury Explorer", emoji: "🪑", threshold: 3}
  }

  @static_defs [
    %{
      key: "first-steps",
      name: "First Steps",
      emoji: "👣",
      description: "React to your first place.",
      rule: {:total, 1}
    },
    %{
      key: "foodie",
      name: "Local Foodie",
      emoji: "🍽️",
      description: "React to 5 restaurants, cafes, or breweries.",
      rule: {:kinds, @food_kinds, 5}
    },
    %{
      key: "historian",
      name: "Time Traveler",
      emoji: "🏛️",
      description: "React to 5 museums, historic sites, or theaters.",
      rule: {:kinds, @history_kinds, 5}
    }
  ]

  @county_kinds ~w(county borough city)

  @doc """
  Every badge a user could hold — the catalogue behind `/badges` and the flash
  copy after an award.

  Costs a fixed **two** queries no matter how large the roster grows: one read
  of `destinations` and one grouped count of open places per node. It used to
  cost one query per county-tier node plus one per node beneath it — 1,265
  against the 752-node roster — and `check_and_award/2` called it on every
  reaction. See `candidate_definitions/1`.
  """
  def definitions do
    counts = open_place_counts()
    nodes = roster()
    @static_defs ++ town_defs(nodes, counts) ++ county_defs(nodes, counts)
  end

  # Open places per destination node, in one grouped query. Both tiers need it,
  # so both tiers are handed the same map rather than each re-counting.
  #
  # `destination_id` is nullable — a place authored through the web UI names no
  # node — and a NULL group would key the map on nil, so it is excluded here
  # rather than guarded against at every read.
  defp open_place_counts do
    Repo.all(
      from p in Place,
        where: p.status == "open" and not is_nil(p.destination_id),
        group_by: p.destination_id,
        select: {p.destination_id, count(p.id)}
    )
    |> Map.new()
  end

  # The whole tree in one read, as the four fields both tiers need. 752 narrow
  # rows; the tree is the smallest table the badge code touches and the only
  # one it needs in full.
  defp roster do
    Repo.all(
      from d in Destination,
        select: %{id: d.id, path: d.path, kind: d.kind, slug: d.slug, name: d.name}
    )
  end

  defp town_defs(nodes, counts) do
    nodes
    |> Enum.filter(&(Map.get(counts, &1.id, 0) >= 3))
    |> Enum.map(&town_def(&1, Map.fetch!(counts, &1.id)))
  end

  # A "county" in the old triple was a `(state_slug, county_slug)` pair that a
  # place carried directly, so the badge fell out of one `group_by` over
  # `places`. A node has no such shortcut: a county-tier destination (kind
  # "county", "borough" or "city") is an *ancestor* of the town nodes places
  # actually attach to, so completing it means every open place under every
  # node in its subtree, not just places attached to the county node itself.
  #
  # The subtree is resolved from the materialised `path` of the roster read
  # once into memory, NOT with a query per node. The previous shape asked the
  # database for each county's descendant paths and then re-resolved each path
  # to a row one at a time; on the 752-node roster that was 90 + 1,083 + 90
  # queries every time this ran, and it ran on every thumbs-up. String prefix
  # matching over 752 rows in the BEAM is free by comparison and gives exactly
  # the same set, because `path` is the tree.
  defp county_defs(nodes, counts) do
    nodes
    |> Enum.filter(&(&1.kind in @county_kinds))
    |> Enum.map(fn c ->
      ids = subtree_ids(c, nodes)
      {c, ids, Enum.sum(Enum.map(ids, &Map.get(counts, &1, 0)))}
    end)
    |> Enum.filter(fn {_c, _ids, open} -> open > 0 end)
    |> Enum.map(fn {c, ids, _open} -> county_def(c, ids) end)
  end

  defp subtree_ids(node, nodes) do
    prefix = node.path <> "/"
    for n <- nodes, n.id == node.id or String.starts_with?(n.path, prefix), do: n.id
  end

  defp town_def(node, count) do
    o = Map.get(@town_overrides, node.slug, %{})
    threshold = Map.get(o, :threshold, min(5, count))

    %{
      key: "explorer-#{node.slug}",
      name: Map.get(o, :name, "#{node.name} Explorer"),
      emoji: Map.get(o, :emoji, "🧭"),
      description: "React to #{threshold} places in #{node.name}.",
      rule: {:town, node.id, threshold}
    }
  end

  # `ids` is sorted, not merely collected. The two callers gather the subtree
  # differently — `definitions/0` filters the roster it read into memory,
  # `candidate_definitions/1` asks the database for one node's descendants —
  # and an unordered list would make the same badge compare unequal depending
  # on which built it. The rule is a value; it should not carry a trace of its
  # provenance.
  defp county_def(node, ids) do
    %{
      key: "county-complete-#{node.slug}",
      name: "#{node.name} Complete",
      emoji: "🗺️",
      description: "React to every open place in #{node.name}.",
      rule: {:county_complete, Enum.sort(ids)}
    }
  end

  @doc """
  Evaluates badge rules after a reaction and inserts any newly earned badges.
  Never raises: a failure here must not break the reaction itself.
  Returns the list of newly awarded definitions.
  """
  def check_and_award(user, %Place{} = place) do
    earned_keys = MapSet.new(earned_badges(user), & &1.badge_key)

    place
    |> candidate_definitions()
    |> Enum.reject(&MapSet.member?(earned_keys, &1.key))
    |> Enum.filter(&rule_met?(&1.rule, user, place))
    |> Enum.filter(&insert_badge(user, &1))
  rescue
    error ->
      Logger.error("badge award failed: #{Exception.message(error)}")
      []
  end

  @doc false
  # The definitions ONE reaction can newly satisfy — never the whole catalogue.
  #
  # This is the difference between a bounded handful of queries and a storm.
  # Reacting to a place changes exactly three things: the user's total, their
  # count for the place's `kind`, and their count for the node the place hangs
  # off and every node above it. Nothing a reaction in Woodbury does can newly
  # complete Danbury or New Haven County, so evaluating those definitions can
  # only ever return false — but `rule_met?/3` pays a query to learn that for
  # every town-tier definition in the catalogue, one per town with three or
  # more open places. Against the real corpus that is hundreds of queries per
  # thumbs-up on top of the ones building the catalogue cost.
  #
  # So the candidates are: the static rules (global, always evaluated), the
  # town-tier rule for the place's own node, and the county-tier rule for each
  # county-tier node on the path from that node to the root. That last set is
  # exactly the set whose `{:county_complete, ids}` could contain the place —
  # `ids` is a node plus its subtree, so `place.destination_id in ids` holds
  # precisely when the county node is the place's node or an ancestor of it.
  # The guard inside `rule_met?/3` already said so; this stops asking the
  # question of the ~90 nodes for which the answer is structurally no.
  #
  # Every definition returned here is byte-identical to the one `definitions/0`
  # builds for the same node under the same thresholds, which is what keeps
  # `SocialLive`'s `Map.fetch!(definitions, key)` on the flash path total.
  #
  # A place with no node — one authored through the web UI — gets the static
  # rules only, which is all that ever applied to it.
  def candidate_definitions(%Place{destination_id: nil}), do: @static_defs

  def candidate_definitions(%Place{destination_id: node_id}) do
    case Destinations.get(node_id) do
      nil -> @static_defs
      node -> @static_defs ++ town_defs_for(node) ++ county_defs_for(node)
    end
  end

  defp town_defs_for(%Destination{} = node) do
    case Places.count_open_places_in_node(node.id) do
      count when count >= 3 -> [town_def(node, count)]
      _ -> []
    end
  end

  defp county_defs_for(%Destination{} = node) do
    (Destinations.ancestors(node) ++ [node])
    |> Enum.filter(&(&1.kind in @county_kinds))
    |> Enum.map(fn c ->
      ids = [c.id | Destinations.descendant_ids(c)]
      {c, ids, Places.count_open_places_in_nodes(ids)}
    end)
    |> Enum.filter(fn {_c, _ids, open} -> open > 0 end)
    |> Enum.map(fn {c, ids, _open} -> county_def(c, ids) end)
  end

  def earned_badges(user) do
    Repo.all(from b in UserBadge, where: b.user_id == ^user.id, order_by: [asc: b.awarded_at])
  end

  defp rule_met?({:total, n}, user, _place), do: Social.reacted_place_count(user) >= n

  defp rule_met?({:town, node_id, n}, user, _place),
    do: Social.reacted_place_count_by_node(user, node_id) >= n

  defp rule_met?({:kinds, kinds, n}, user, _place),
    do: Social.reacted_place_count_by_kinds(user, kinds) >= n

  # Only worth evaluating for the county the place just reacted to belongs to.
  # `candidate_definitions/1` already narrows to those, but `definitions/0` is
  # public and a caller may hand any rule here, so the guard stays.
  #
  # The open count is read ONCE and bound. It used to appear twice in the same
  # boolean chain — the same aggregate, run twice per evaluation.
  defp rule_met?({:county_complete, ids}, user, place) do
    if place.destination_id in ids do
      open = Places.count_open_places_in_nodes(ids)
      open > 0 and Social.reacted_place_count_in_nodes(user, ids) >= open
    else
      false
    end
  end

  defp insert_badge(user, def) do
    now = DateTime.utc_now() |> DateTime.truncate(:second)

    {count, _} =
      Repo.insert_all(
        UserBadge,
        [
          %{
            user_id: user.id,
            badge_key: def.key,
            awarded_at: now,
            inserted_at: now,
            updated_at: now
          }
        ],
        on_conflict: :nothing,
        conflict_target: [:user_id, :badge_key]
      )

    count == 1
  end
end
