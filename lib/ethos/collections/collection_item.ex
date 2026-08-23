defmodule Ethos.Collections.CollectionItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "collection_items" do
    belongs_to :collection, Ethos.Collections.Collection
    belongs_to :guide, Ethos.Guides.Guide
    field :position, :integer, default: 0
    field :blurb, :string
    timestamps(type: :utc_datetime)
  end

  def changeset(item, attrs) do
    item
    |> cast(attrs, [:position, :blurb])
    |> validate_length(:blurb, max: 300)
  end
end
