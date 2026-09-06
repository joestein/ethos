defmodule Ethos.Collections do
  import Ecto.Query, warn: false

  alias Ethos.Repo
  alias Ethos.Collections.{Collection, CollectionItem}
  alias Ethos.Guides.Guide

  def upsert_collection!(%{slug: slug, items: items} = attrs) do
    {:ok, collection} =
      Repo.transaction(fn ->
        collection =
          case Repo.get_by(Collection, slug: slug) do
            nil -> %Collection{}
            c -> c
          end
          |> Collection.changeset(Map.drop(attrs, [:items]))
          |> Repo.insert_or_update!()

        Repo.delete_all(from i in CollectionItem, where: i.collection_id == ^collection.id)

        items
        |> Enum.with_index()
        |> Enum.each(fn {item, idx} ->
          guide =
            Repo.get_by(Guide, slug: item.guide_slug) ||
              raise ArgumentError,
                    "collection #{slug} references unknown guide #{item.guide_slug}"

          %CollectionItem{collection_id: collection.id, guide_id: guide.id, position: idx}
          |> CollectionItem.changeset(%{blurb: item[:blurb], position: idx})
          |> Repo.insert!()
        end)

        collection
      end)

    collection
  end

  def get_published_by_slug(slug) do
    Repo.one(
      from c in Collection,
        where: c.slug == ^slug and c.published == true,
        preload: [items: [guide: :destination_node]]
    )
  end

  def list_published do
    Repo.all(from c in Collection, where: c.published == true, order_by: [asc: c.title])
  end

  def collections_for_guide(%Guide{id: guide_id}) do
    Repo.all(
      from c in Collection,
        join: i in CollectionItem,
        on: i.collection_id == c.id,
        where: i.guide_id == ^guide_id and c.published == true,
        order_by: [asc: c.title]
    )
  end
end
