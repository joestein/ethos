defmodule Ethos.Guides do
  import Ecto.Query, warn: false
  alias Ethos.Repo
  alias Ethos.Guides.Guide
  alias Ethos.Guides.Entry
  alias Ethos.Guides.Import

  def create_guide(user, attrs) do
    %Guide{user_id: user.id}
    |> Guide.changeset(attrs)
    |> Repo.insert()
  end

  def get_guide!(id), do: Repo.get!(Guide, id)

  def update_guide_og_path(%Guide{} = guide, path) do
    guide |> Ecto.Changeset.change(og_image_path: path) |> Repo.update()
  end

  def get_user_guide!(user, id), do: Repo.get_by!(Guide, id: id, user_id: user.id)

  @doc """
  A published guide by slug, with its destination node loaded.

  The node is preloaded here, not at the call site, because three readers on
  the guide page want it: the breadcrumb, the `BreadcrumbList` JSON-LD, and
  `EthosWeb.Affiliate`, which resolves the page's affiliate locale from the
  node's path. A lazy load would be three queries; a missing one would be an
  `Ecto.Association.NotLoaded` out of the layout.
  """
  def get_published_guide_by_slug!(slug),
    do: Repo.get_by!(Guide, slug: slug, status: "published") |> Repo.preload(:destination_node)

  def get_published_guide_by_slug(slug) do
    case Repo.get_by(Guide, slug: slug, status: "published") do
      nil -> nil
      guide -> Repo.preload(guide, :destination_node)
    end
  end

  def list_user_guides(user) do
    Repo.all(from g in Guide, where: g.user_id == ^user.id, order_by: [desc: g.inserted_at])
  end

  def publish_guide(%Guide{} = guide) do
    guide |> Guide.status_changeset("published") |> Repo.update()
  end

  def update_guide(%Guide{} = guide, attrs) do
    guide |> Guide.changeset(attrs) |> Repo.update()
  end

  def update_guide_seo(%Guide{} = guide, attrs) do
    guide |> Guide.seo_changeset(attrs) |> Repo.update()
  end

  def update_guide_photos(%Guide{} = guide, photos) do
    guide |> Guide.photos_changeset(%{photos: photos}) |> Repo.update()
  end

  def list_published_guides do
    Repo.all(from g in Guide, where: g.status == "published", order_by: [desc: g.updated_at])
  end

  @doc """
  Published guides attached to one destination node.

  Filed by `destination_id`, so a hub lists exactly the guides that name it —
  no slug matching, and no ambiguity between a state and a town of the same
  name. A node's descendants are NOT rolled up: the tree gives every one of
  them its own hub.
  """
  def list_published_guides_for_node(node_id) do
    Repo.all(
      from g in Guide,
        where: g.status == "published" and g.destination_id == ^node_id,
        order_by: [desc: g.view_count, desc: g.id],
        preload: [:destination_node]
    )
  end

  @doc """
  Published guide counts per country hub — the roots of the destination tree.

  Replaces `list_states/0`, which grouped on the `state`/`state_slug` columns.
  Grouping on the ROOTS specifically, not on some other tier, is what keeps the
  homepage honest: `/destinations` lists the roots and nothing else, so a
  homepage that counted anything else would link to a page showing a different
  number of things — the drift main's own homepage test was written to pin.

  A guide's country is the first segment of its node's path, so the whole
  subtree rolls up in one grouped query rather than a `descendant_paths/1`
  expansion per root. A country with no published guide is simply absent, the
  same way a state with no guide was absent before.
  """
  def list_country_hubs do
    Repo.all(
      from g in Guide,
        join: d in assoc(g, :destination_node),
        join: c in Ethos.Destinations.Destination,
        on: c.path == fragment("split_part(?, '/', 1)", d.path),
        where: g.status == "published",
        group_by: [c.id, c.name, c.slug, c.path],
        select: %{name: c.name, slug: c.slug, path: c.path, count: count(g.id)},
        order_by: [desc: count(g.id), asc: c.name]
    )
  end

  def increment_view_count(%Guide{id: id}) do
    from(g in Guide, where: g.id == ^id)
    |> Repo.update_all(inc: [view_count: 1])

    :ok
  end

  def list_entries(%Guide{id: guide_id}) do
    Repo.all(
      from e in Entry,
        where: e.guide_id == ^guide_id,
        order_by: [asc: e.position, asc: e.id],
        preload: [:place]
    )
  end

  def get_entry!(%Guide{id: guide_id}, id), do: Repo.get_by!(Entry, id: id, guide_id: guide_id)

  @doc """
  Creates an entry for a guide.

  `mode` controls which changeset is used: `:public` (the default) is safe
  for attrs coming straight from a web form — it can never set `:source` or
  `:credited_user_id`. `:privileged` is for trusted, context-internal
  callers (e.g. `Contributions.accept_suggestion/1`) that need to set those
  fields explicitly. Never pass `:privileged` with attrs sourced from an
  external request.
  """
  def create_entry(%Guide{} = guide, attrs, mode \\ :public)
      when mode in [:public, :privileged] do
    position = next_position(guide)
    attrs = Map.drop(attrs, [:position, "position"])
    entry = %Entry{guide_id: guide.id, position: position}

    changeset =
      case mode do
        :public -> Entry.changeset(entry, attrs)
        :privileged -> Entry.privileged_changeset(entry, attrs)
      end

    Repo.insert(changeset)
  end

  def update_entry(%Entry{} = entry, attrs) do
    entry |> Entry.changeset(attrs) |> Repo.update()
  end

  def delete_entry(%Entry{} = entry), do: Repo.delete(entry)

  def replace_entries_from_proposal(%Guide{} = guide, proposal) when is_list(proposal) do
    Repo.transaction(fn ->
      Repo.delete_all(from e in Entry, where: e.guide_id == ^guide.id and e.source == "import")

      proposal
      |> Enum.with_index()
      |> Enum.map(fn {attrs, idx} ->
        changeset =
          %Entry{guide_id: guide.id, position: idx, source: "import"}
          |> Entry.changeset(Map.drop(attrs, ["source", :source]))

        case Repo.insert(changeset) do
          {:ok, entry} -> entry
          {:error, changeset} -> Repo.rollback(changeset)
        end
      end)
    end)
  end

  def set_entry_enrichment(%Entry{} = entry, payload) when is_map(payload) do
    entry |> Ecto.Changeset.change(enrichment: payload) |> Repo.update()
  end

  defp next_position(%Guide{id: guide_id}) do
    (Repo.one(from e in Entry, where: e.guide_id == ^guide_id, select: max(e.position)) || -1) + 1
  end

  def create_import(%Guide{} = guide, raw_text) do
    %Import{guide_id: guide.id}
    |> Import.changeset(%{raw_text: raw_text})
    |> Repo.insert()
  end

  def get_import!(id), do: Repo.get!(Import, id)

  def latest_import(%Guide{id: guide_id}) do
    Repo.one(from i in Import, where: i.guide_id == ^guide_id, order_by: [desc: i.id], limit: 1)
  end

  def mark_import(%Import{} = import, status, fields \\ %{}) do
    import |> Import.mark_changeset(status, fields) |> Repo.update()
  end
end
