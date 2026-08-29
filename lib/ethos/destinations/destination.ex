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

  @path_format ~r{^[a-z0-9]+(-[a-z0-9]+)*(/[a-z0-9]+(-[a-z0-9]+)*)?$}

  schema "destinations" do
    field :path, :string
    field :name, :string
    field :intro, :string
    field :photos, {:array, :map}, default: []

    timestamps(type: :utc_datetime)
  end

  def changeset(destination, attrs) do
    destination
    |> cast(attrs, [:path, :name, :intro, :photos])
    |> validate_required([:path, :name, :intro])
    |> validate_format(:path, @path_format)
    |> unique_constraint(:path)
  end
end
