defmodule Ethos.Badges do
  @moduledoc """
  Explorer badges. Definitions live in code; earned badges are rows in
  `user_badges`. Badges are awarded on visit check-off and never revoked.
  Zero AI involvement — plain Ecto counts.
  """

  import Ecto.Query, warn: false
  require Logger

  alias Ethos.Repo
  alias Ethos.Badges.UserBadge
  alias Ethos.Places
  alias Ethos.Places.Place
  alias Ethos.Visits

  @food_kinds ~w(restaurant cafe brewery)
  @history_kinds ~w(museum historic-site theater)

  @static_defs [
    %{
      key: "first-steps",
      name: "First Steps",
      emoji: "👣",
      description: "Check off your first place.",
      rule: {:total, 1}
    },
    %{
      key: "explorer-waterbury",
      name: "Brass City Explorer",
      emoji: "🏭",
      description: "Check off 5 places in Waterbury.",
      rule: {:town, "waterbury", 5}
    },
    %{
      key: "explorer-danbury",
      name: "Hat City Explorer",
      emoji: "🎩",
      description: "Check off 5 places in Danbury.",
      rule: {:town, "danbury", 5}
    },
    %{
      key: "explorer-middlebury",
      name: "Middlebury Explorer",
      emoji: "🎡",
      description: "Check off 3 places in Middlebury.",
      rule: {:town, "middlebury", 3}
    },
    %{
      key: "explorer-southbury",
      name: "Southbury Explorer",
      emoji: "🌳",
      description: "Check off 3 places in Southbury.",
      rule: {:town, "southbury", 3}
    },
    %{
      key: "explorer-woodbury",
      name: "Woodbury Explorer",
      emoji: "🪑",
      description: "Check off 3 places in Woodbury.",
      rule: {:town, "woodbury", 3}
    },
    %{
      key: "foodie",
      name: "Local Foodie",
      emoji: "🍽️",
      description: "Check off 5 restaurants, cafes, or breweries.",
      rule: {:kinds, @food_kinds, 5}
    },
    %{
      key: "historian",
      name: "Time Traveler",
      emoji: "🏛️",
      description: "Check off 5 museums, historic sites, or theaters.",
      rule: {:kinds, @history_kinds, 5}
    }
  ]

  def definitions do
    @static_defs ++ county_defs()
  end

  defp county_defs do
    Repo.all(
      from p in Place,
        where: p.status == "open",
        group_by: [p.state_slug, p.county_slug, p.county],
        select: %{state_slug: p.state_slug, county_slug: p.county_slug, county: p.county}
    )
    |> Enum.map(fn c ->
      %{
        key: "county-complete-#{c.county_slug}",
        name: "#{c.county} Complete",
        emoji: "🗺️",
        description: "Check off every open place in #{c.county}.",
        rule: {:county_complete, c.state_slug, c.county_slug}
      }
    end)
  end

  @doc """
  Evaluates badge rules after a visit and inserts any newly earned badges.
  Never raises: a failure here must not break the visit itself.
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

  defp rule_met?({:total, n}, user, _place), do: Visits.count_for_user(user) >= n

  defp rule_met?({:town, town_slug, n}, user, _place),
    do: Visits.count_for_user_by_town(user, town_slug) >= n

  defp rule_met?({:kinds, kinds, n}, user, _place),
    do: Visits.count_for_user_by_kinds(user, kinds) >= n

  defp rule_met?({:county_complete, state_slug, county_slug}, user, place) do
    # Only worth evaluating for the county just visited.
    place.state_slug == state_slug and place.county_slug == county_slug and
      Places.count_open_places_in_county(state_slug, county_slug) > 0 and
      Visits.count_for_user_in_county(user, state_slug, county_slug) >=
        Places.count_open_places_in_county(state_slug, county_slug)
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
