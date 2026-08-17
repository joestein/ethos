defmodule Ethos.Guides.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  @kinds ~w(food tour walk sight stay tip)
  @verdicts ~w(loved good skip)
  @sources ~w(import manual suggestion gap_fill)

  def kinds, do: @kinds
  def verdicts, do: @verdicts

  schema "entries" do
    field :day, :integer
    field :kind, :string
    field :name, :string
    field :note, :string
    field :verdict, :string
    field :position, :integer, default: 0
    field :enrichment, :map
    field :lat, :float
    field :lng, :float
    field :source, :string, default: "manual"
    belongs_to :guide, Ethos.Guides.Guide
    belongs_to :credited_user, Ethos.Accounts.User
    timestamps(type: :utc_datetime)
  end

  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [:day, :kind, :name, :note, :verdict, :position, :lat, :lng, :source, :credited_user_id])
    |> validate_required([:kind, :name])
    |> validate_inclusion(:kind, @kinds)
    |> validate_inclusion(:verdict, @verdicts ++ [nil])
    |> validate_inclusion(:source, @sources)
  end
end
