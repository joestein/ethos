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

  # 255, not 300, because `add :blurb, :string` in
  # priv/repo/migrations/20260823121000_create_collections.exs is a
  # varchar(255) — Ecto's default width for :string. The limit was 300 for as
  # long as this schema has existed, so a blurb between 256 and 300 passed
  # validation and then raised a Postgrex error at insert time: the wrong
  # failure, in the wrong layer, with a message about a database constraint
  # rather than about a blurb being too long.
  #
  # It surfaced while writing the Korean BBQ collection, where a 265-character
  # blurb passed the changeset and died against the column. Every blurb in the
  # four committed collections is 236 characters or fewer, so tightening the
  # rule to match the column rejects nothing that exists and costs nothing.
  #
  # Widening the column instead would work too, and is the wrong trade: 255 is
  # already more than a one-line summary needs, and a migration over shared
  # data buys nothing a shorter blurb does not.
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:position, :blurb])
    |> validate_length(:blurb, max: 255)
  end
end
