defmodule Ethos.Destinations do
  @moduledoc """
  Editorial content for destination pages. See `Ethos.Destinations.Destination`
  for why records are keyed by URL path.
  """
  import Ecto.Query, warn: false

  alias Ethos.Destinations.Destination
  alias Ethos.Repo

  def get_by_path(path) when is_binary(path), do: Repo.get_by(Destination, path: path)

  def list_destinations, do: Repo.all(from d in Destination, order_by: [asc: d.path])

  def upsert_destination!(attrs) do
    attrs = Map.new(attrs, fn {k, v} -> {to_string(k), v} end)

    # is_binary/1, not truthiness: a non-string path (`"path": false` in a seed
    # file) would otherwise reach Destination.changeset/2 as the struct
    # argument and raise something opaque instead of a changeset error.
    # The lookup short-circuits to `false`, not `nil`, so match the struct
    # rather than testing for nil.
    case is_binary(attrs["path"]) && Repo.get_by(Destination, path: attrs["path"]) do
      %Destination{} = existing -> existing
      _ -> %Destination{}
    end
    |> Destination.changeset(attrs)
    |> Repo.insert_or_update!()
  end
end
