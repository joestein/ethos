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

  @doc """
  Deletes places by slug, returning `{count_deleted, nil}`.

  Used only by the deletion manifest (`Ethos.Places.DeletedPlaces`) — never by
  an inferred diff against the seed corpus, because a loader that silently
  skipped a seed directory would then read as hundreds of closures.

  Slugs with no row are not an error: the prune is idempotent, so re-running it
  after the rows are gone deletes nothing and says so.
  """
  def delete_by_slugs!([]), do: {0, nil}

  def delete_by_slugs!(slugs) when is_list(slugs) do
    Repo.delete_all(from p in Place, where: p.slug in ^slugs)
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

  @sibling_limit 8

  @doc """
  Other open places in the same town, excluding the place itself.

  Ordered by name and capped (`:limit`, default #{@sibling_limit}) so a place
  page can offer a way sideways into its town without turning into a directory.

  Scoped by state as well as town, because `town_slug` alone is not a town.
  Washington, Connecticut and Washington, District of Columbia both derive
  `town_slug: "washington"`, as do Madison, Connecticut and Madison, Brooklyn —
  so a town-only filter puts Nationals Park in a Litchfield County town's
  "More in Washington" and four Connecticut museums and taverns in Nationals
  Park's. Nothing raises: the query is valid and the geography is wrong.

  A place with no `town_slug` or no `state_slug` has no town to be a sibling of.
  `Place.changeset/2` requires both `town` and `state`, so neither clause is
  reachable through the seed loaders; they are here so a partial record returns
  nothing rather than every place that happens to share one of its two halves.
  """
  def list_siblings(place, opts \\ [])

  def list_siblings(%Place{town_slug: nil}, _opts), do: []
  def list_siblings(%Place{state_slug: nil}, _opts), do: []

  def list_siblings(%Place{id: id, town_slug: town_slug, state_slug: state_slug}, opts) do
    limit = Keyword.get(opts, :limit, @sibling_limit)

    Repo.all(
      from p in Place,
        where:
          p.town_slug == ^town_slug and p.state_slug == ^state_slug and
            p.id != ^id and p.status == "open",
        order_by: [asc: p.name],
        limit: ^limit
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
