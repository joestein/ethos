defmodule Ethos.Destinations.Destination do
  @moduledoc """
  Editorial content for a destination page — a state, a county or borough, or a
  standalone town.

  Keyed by `path`, the URL segment(s) after `/destinations/`: "connecticut",
  "new-york/brooklyn", "rome". Destinations come in three shapes, so a
  state_slug/county_slug pair would need a nullable column and a partial unique
  index to express what the router already knows.

  The record is additive. Guide lists are still derived by `Ethos.Guides`; this
  supplies an intro and photos and nothing else.
  """
  use Ecto.Schema
  import Ecto.Changeset

  # Any number of slug segments — the tree is variable-depth, from two tiers
  # (a city-state) to five (a neighborhood inside a borough inside a city).
  @path_format ~r{^[a-z0-9]+(-[a-z0-9]+)*(/[a-z0-9]+(-[a-z0-9]+)*)*$}

  @kinds ~w(country region county city borough town neighborhood)

  def kinds, do: @kinds

  schema "destinations" do
    field :path, :string
    field :slug, :string
    field :kind, :string
    field :name, :string
    field :intro, :string
    field :photos, {:array, :map}, default: []
    field :position, :integer, default: 0
    field :legacy_paths, {:array, :string}, default: []

    belongs_to :parent, __MODULE__
    has_many :children, __MODULE__, foreign_key: :parent_id

    timestamps(type: :utc_datetime)
  end

  def changeset(destination, attrs) do
    destination
    |> cast(attrs, [:path, :name, :intro, :photos, :kind, :parent_id, :position, :legacy_paths])
    # `kind` is NOT NULL in the table, so requiring it here is what turns a node
    # seeded without one into a changeset error instead of a Postgrex raise that
    # aborts the surrounding seeding transaction.
    |> validate_required([:path, :name, :intro, :kind])
    |> validate_format(:path, @path_format)
    |> validate_inclusion(:kind, @kinds)
    |> put_slug()
    |> unique_constraint(:path)
  end

  # The slug is the last path segment, never authored separately — two sources
  # for one fact is how they drift.
  defp put_slug(changeset) do
    case get_field(changeset, :path) do
      nil -> changeset
      path -> put_change(changeset, :slug, path |> String.split("/") |> List.last())
    end
  end
end
