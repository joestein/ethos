defmodule Ethos.Places do
  import Ecto.Query, warn: false

  alias Ethos.Repo
  alias Ethos.Places.Place

  def get_place_by_slug!(slug), do: Repo.get_by!(Place, slug: slug)
  def get_place_by_slug(slug), do: Repo.get_by(Place, slug: slug)

  def upsert_place!(attrs) do
    slug = attrs[:slug] || attrs["slug"]

    case Repo.get_by(Place, slug: slug) do
      nil -> %Place{}
      place -> place
    end
    |> Place.changeset(attrs)
    |> Repo.insert_or_update!()
  end

  def list_places(opts \\ []) do
    base = from p in Place, order_by: [asc: p.name]

    opts
    |> Enum.reduce(base, fn
      {:town_slug, v}, q -> where(q, [p], p.town_slug == ^v)
      {:county_slug, v}, q -> where(q, [p], p.county_slug == ^v)
      {:state_slug, v}, q -> where(q, [p], p.state_slug == ^v)
      {:kind, v}, q -> where(q, [p], p.kind == ^v)
      {:kinds, v}, q -> where(q, [p], p.kind in ^v)
      {:status, v}, q -> where(q, [p], p.status == ^v)
    end)
    |> Repo.all()
  end

  def count_open_places_in_county(state_slug, county_slug) do
    Repo.one(
      from p in Place,
        where:
          p.status == "open" and p.state_slug == ^state_slug and
            p.county_slug == ^county_slug,
        select: count(p.id)
    )
  end

  def guides_featuring(%Place{id: place_id}) do
    Repo.all(
      from g in Ethos.Guides.Guide,
        join: e in Ethos.Guides.Entry,
        on: e.guide_id == g.id,
        where: e.place_id == ^place_id and g.status == "published",
        distinct: true,
        order_by: [asc: g.title]
    )
  end
end
