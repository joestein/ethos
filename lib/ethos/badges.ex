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

  def definitions do
    @static_defs ++ town_defs() ++ county_defs()
  end

  defp town_defs do
    Repo.all(
      from p in Place,
        join: d in assoc(p, :destination_node),
        where: p.status == "open",
        group_by: [p.destination_id, d.slug, d.name],
        having: count(p.id) >= 3,
        select: %{
          destination_id: p.destination_id,
          slug: d.slug,
          name: d.name,
          count: count(p.id)
        }
    )
    |> Enum.map(fn t ->
      o = Map.get(@town_overrides, t.slug, %{})
      threshold = Map.get(o, :threshold, min(5, t.count))

      %{
        key: "explorer-#{t.slug}",
        name: Map.get(o, :name, "#{t.name} Explorer"),
        emoji: Map.get(o, :emoji, "🧭"),
        description: "React to #{threshold} places in #{t.name}.",
        rule: {:town, t.destination_id, threshold}
      }
    end)
  end

  # A "county" in the old triple was a `(state_slug, county_slug)` pair that a
  # place carried directly, so the badge fell out of one `group_by` over
  # `places`. A node has no such shortcut: a county-tier destination (kind
  # "county", "borough" or "city") is an *ancestor* of the town nodes places
  # actually attach to, so completing it means every open place under every
  # node in its subtree, not just places attached to the county node itself.
  # `Destinations.descendant_paths/1` is what makes that subtree visible —
  # without it a five-town county would only ever see the one town, if any,
  # whose places happened to hang directly off the county node.
  defp county_defs do
    Repo.all(from d in Destination, where: d.kind in ~w(county borough city))
    |> Enum.map(fn node -> {node, node_ids(node)} end)
    |> Enum.map(fn {node, ids} -> {node, ids, Places.count_open_places_in_nodes(ids)} end)
    |> Enum.filter(fn {_node, _ids, count} -> count > 0 end)
    |> Enum.map(fn {node, ids, _count} ->
      %{
        key: "county-complete-#{node.slug}",
        name: "#{node.name} Complete",
        emoji: "🗺️",
        description: "React to every open place in #{node.name}.",
        rule: {:county_complete, ids}
      }
    end)
  end

  # A county-tier node plus every node beneath it, as ids. `descendant_paths/1`
  # returns paths rather than ids or records, because that is what lets it be
  # one `LIKE` query regardless of subtree depth; resolving each path back to a
  # node is the price of that.
  defp node_ids(%Destination{id: id} = node) do
    ids =
      node
      |> Destinations.descendant_paths()
      |> Enum.map(&Destinations.get_by_path/1)
      |> Enum.reject(&is_nil/1)
      |> Enum.map(& &1.id)

    [id | ids]
  end

  @doc """
  Evaluates badge rules after a reaction and inserts any newly earned badges.
  Never raises: a failure here must not break the reaction itself.
  Returns the list of newly awarded definitions.
  """
  def check_and_award(user, %Place{} = place) do
    earned_keys = MapSet.new(earned_badges(user), & &1.badge_key)

    definitions()
    |> Enum.reject(&MapSet.member?(earned_keys, &1.key))
    |> Enum.filter(&rule_met?(&1.rule, user, place))
    |> Enum.filter(&insert_badge(user, &1))
  rescue
    error ->
      Logger.error("badge award failed: #{Exception.message(error)}")
      []
  end

  def earned_badges(user) do
    Repo.all(from b in UserBadge, where: b.user_id == ^user.id, order_by: [asc: b.awarded_at])
  end

  defp rule_met?({:total, n}, user, _place), do: Social.reacted_place_count(user) >= n

  defp rule_met?({:town, node_id, n}, user, _place),
    do: Social.reacted_place_count_by_node(user, node_id) >= n

  defp rule_met?({:kinds, kinds, n}, user, _place),
    do: Social.reacted_place_count_by_kinds(user, kinds) >= n

  defp rule_met?({:county_complete, ids}, user, place) do
    # Only worth evaluating for the county the place just reacted to belongs to.
    place.destination_id in ids and
      Places.count_open_places_in_nodes(ids) > 0 and
      Social.reacted_place_count_in_nodes(user, ids) >= Places.count_open_places_in_nodes(ids)
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
