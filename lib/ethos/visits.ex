defmodule Ethos.Visits do
  import Ecto.Query, warn: false

  alias Ethos.Repo
  alias Ethos.Places.Place
  alias Ethos.Visits.PlaceVisit

  def toggle_visit(_user, %Place{status: "closed"}), do: {:error, :closed}

  def toggle_visit(user, %Place{} = place) do
    case Repo.get_by(PlaceVisit, user_id: user.id, place_id: place.id) do
      nil ->
        %PlaceVisit{user_id: user.id, place_id: place.id}
        |> Repo.insert!(on_conflict: :nothing)

        {:ok, :visited}

      visit ->
        Repo.delete(visit)
        {:ok, :unvisited}
    end
  end

  def visited?(user, %Place{} = place) do
    Repo.exists?(from v in PlaceVisit, where: v.user_id == ^user.id and v.place_id == ^place.id)
  end

  def count_for_user(user) do
    Repo.one(from v in PlaceVisit, where: v.user_id == ^user.id, select: count(v.id))
  end

  def count_for_user_by_town(user, town_slug) do
    Repo.one(
      from v in PlaceVisit,
        join: p in Place,
        on: v.place_id == p.id,
        where: v.user_id == ^user.id and p.town_slug == ^town_slug,
        select: count(v.id)
    )
  end

  def count_for_user_by_kinds(user, kinds) do
    Repo.one(
      from v in PlaceVisit,
        join: p in Place,
        on: v.place_id == p.id,
        where: v.user_id == ^user.id and p.kind in ^kinds,
        select: count(v.id)
    )
  end

  def count_for_user_in_county(user, state_slug, county_slug) do
    Repo.one(
      from v in PlaceVisit,
        join: p in Place,
        on: v.place_id == p.id,
        where:
          v.user_id == ^user.id and p.state_slug == ^state_slug and
            p.county_slug == ^county_slug,
        select: count(v.id)
    )
  end
end
