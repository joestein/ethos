defmodule Ethos.Guides.Import do
  use Ecto.Schema
  import Ecto.Changeset

  @statuses ~w(pending parsing parsed failed)

  schema "imports" do
    field :raw_text, :string
    field :status, :string, default: "pending"
    field :error, :string
    field :proposal, {:array, :map}
    belongs_to :guide, Ethos.Guides.Guide
    timestamps(type: :utc_datetime)
  end

  def changeset(import, attrs) do
    import
    |> cast(attrs, [:raw_text])
    |> update_change(:raw_text, &String.trim/1)
    |> validate_required([:raw_text])
    |> validate_length(:raw_text, min: 1, max: 50_000)
  end

  def mark_changeset(import, status, fields) when status in @statuses do
    import
    |> cast(fields, [:proposal, :error])
    |> put_change(:status, status)
  end
end
