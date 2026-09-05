defmodule Ethos.Places do
  import Ecto.Query, warn: false

  alias Ethos.Repo
  alias Ethos.Places.Place

  def get_place_by_slug!(slug), do: Repo.get_by!(Place, slug: slug)

  @doc """
  A place by slug, with its destination node loaded, or nil.

  The node is preloaded here rather than at the call site because the page this
  feeds derives its breadcrumb, its visible geography nav and its schema.org
  `PostalAddress` from the node's ancestry — three readers of one association,
  and a lazy load would be three queries or a `NotLoaded` crash. `get_place_by_slug!/1`
  deliberately does not preload: its caller is `Ethos.Seeds.GuideRunner`,
  resolving one entry per guide row in a seeding loop that never touches the
  node.
  """
  def get_place_by_slug(slug) do
    case Repo.get_by(Place, slug: slug) do
      nil -> nil
      place -> Repo.preload(place, :destination_node)
    end
  end

  def upsert_place!(attrs) do
    attrs = attrs |> normalize_keys() |> put_legacy_geo()
    slug = attrs["slug"]

    case Repo.get_by(Place, slug: slug) do
      nil -> %Place{}
      place -> place
    end
    |> Place.changeset(attrs)
    |> Repo.insert_or_update!()
  end

  defp normalize_keys(attrs), do: Map.new(attrs, fn {k, v} -> {to_string(k), v} end)

  # Transitional: derives town/state/county from the destination node while
  # those columns still have readers. Removed with the columns in Task 12.
  # A caller that already supplied them (none, after Task 6) keeps its values.
  defp put_legacy_geo(%{"destination_id" => id} = attrs) when not is_nil(id) do
    if Map.has_key?(attrs, "town") do
      attrs
    else
      node = Repo.get!(Ethos.Destinations.Destination, id)
      Map.merge(attrs, Ethos.Destinations.legacy_geo(node))
    end
  end

  defp put_legacy_geo(%{"destination_path" => path} = attrs) when is_binary(path) do
    node =
      Ethos.Destinations.get_by_path(path) ||
        raise ArgumentError, "unknown destination node #{path}"

    attrs
    |> Map.delete("destination_path")
    |> Map.put("destination_id", node.id)
    |> Map.merge(Ethos.Destinations.legacy_geo(node))
  end

  defp put_legacy_geo(attrs), do: attrs

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

  Capped (`:limit`, default #{@sibling_limit}) so a place page can offer a way
  sideways into its town without turning into a directory.

  The window into the town *rotates*: each place shows the #{@sibling_limit}
  places that follow it alphabetically, wrapping around to the top of the town
  when it runs out. A fixed `order_by: [asc: p.name]` with the same cap put the
  same eight alphabetically-first names on every place page in the town, so in a
  town of more than nine places the rest had no inbound in-site link at all —
  in the sitemap, resolvable by URL, unreachable by navigation. Belmont, the
  Bronx is the first town where it showed: of its 40 places, 12 are linked from
  the guide's entries and only 6 more were sibling-reachable.

  Rotating instead of raising the cap keeps the page density and the intent
  above, and makes the union of the town's sibling lists cover the whole town —
  every place gains inbound links from the #{@sibling_limit} that precede it.
  It also stops "More in {town}" from being the same duplicated block on every
  place page in the town.

  The sort key is `(name, id)` and the partition predicate compares the *same*
  row-wise pair, not `name` alone. Two places in one town can share a name — a
  parish church and its parish school — and a predicate over `name` alone would
  start the rotation past the anchor's entire equal-name block, so a block
  larger than the window would be jumped over by its own members and reached
  only partly from outside. Nine identically-named places in one town orphan
  one; twelve orphan four. No real town has that, but the guarantee should not
  be contingent on the corpus not containing something, and the asymmetry is one
  character wide. Row-wise, the window opens on the next row in the total order
  whatever its name, so coverage holds at every block size.

  The ordering is therefore total and stable across calls, and `id` is the
  visible tiebreak between equal names rather than an unspecified one.

  ## Collation

  `p.name > $1` binds a parameter, and a bound parameter carries no collation of
  its own, so the comparison derives the column's implicit collation — the same
  one `ORDER BY p.name` uses. Predicate and sort therefore cannot disagree, by
  construction rather than by luck, and the boolean they produce has no
  collation at all.

  What the collation *does* decide is which eight names a page shows. The local
  Postgres runs on musl, whose `strcoll` is byte comparison, so its `en_US.utf8`
  label is effectively binary ordering; a production Postgres on glibc with the
  identical label collates dictionary-style, filing `Çka Ka Qëllu` under C
  rather than after Z and `Joe's Italian Deli` as `Joes`. The two environments
  show different windows for the same place. Coverage is unaffected — the
  rotation is over whatever total order the database produces — but a reader
  diffing local against production will otherwise think something is broken.

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

  def list_siblings(
        %Place{id: id, name: name, town_slug: town_slug, state_slug: state_slug},
        opts
      ) do
    limit = Keyword.get(opts, :limit, @sibling_limit)

    Repo.all(
      from p in Place,
        where:
          p.town_slug == ^town_slug and p.state_slug == ^state_slug and
            p.id != ^id and p.status == "open",
        order_by: [
          desc: fragment("(?, ?) > (?, ?)", p.name, p.id, ^name, ^id),
          asc: p.name,
          asc: p.id
        ],
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
