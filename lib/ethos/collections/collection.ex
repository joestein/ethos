defmodule Ethos.Collections.Collection do
  use Ecto.Schema
  import Ecto.Changeset

  schema "collections" do
    field :slug, :string
    field :title, :string
    field :intro, :string
    field :published, :boolean, default: false
    has_many :items, Ethos.Collections.CollectionItem, preload_order: [asc: :position]
    timestamps(type: :utc_datetime)
  end

  def changeset(collection, attrs) do
    collection
    |> cast(attrs, [:slug, :title, :intro, :published])
    |> validate_required([:slug, :title])
    |> validate_format(:slug, ~r/^[a-z0-9-]+$/)
    |> unique_constraint(:slug)
  end
end
