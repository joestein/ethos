defmodule Ethos.Guides do
  import Ecto.Query, warn: false
  alias Ethos.Repo
  alias Ethos.Guides.Guide

  def create_guide(user, attrs) do
    %Guide{user_id: user.id}
    |> Guide.changeset(attrs)
    |> Repo.insert()
  end

  def get_guide!(id), do: Repo.get!(Guide, id)

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
end
