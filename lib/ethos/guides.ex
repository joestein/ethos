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

  def get_published_guide_by_slug!(slug),
    do: Repo.get_by!(Guide, slug: slug, status: "published")

  def list_user_guides(user) do
    Repo.all(from g in Guide, where: g.user_id == ^user.id, order_by: [desc: g.inserted_at])
  end

  def publish_guide(%Guide{} = guide) do
    guide |> Guide.status_changeset("published") |> Repo.update()
  end

  def update_guide(%Guide{} = guide, attrs) do
    guide |> Guide.changeset(attrs) |> Repo.update()
  end

  def increment_view_count(%Guide{id: id}) do
    from(g in Guide, where: g.id == ^id)
    |> Repo.update_all(inc: [view_count: 1])

    :ok
  end

  def list_entries(%Guide{id: guide_id}) do
    Repo.all(
      from e in Entry, where: e.guide_id == ^guide_id, order_by: [asc: e.position, asc: e.id]
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
