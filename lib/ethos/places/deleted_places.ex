defmodule Ethos.Places.DeletedPlaces do
  @moduledoc """
  Places removed from the corpus because research found them closed.

  Deletion is driven by this list and never inferred from a place's absence
  from the seed files. Inferring it would mean a loader that silently skipped
  a directory could erase hundreds of records — and that failure mode is real,
  not hypothetical. An explicit list also gives every deletion an auditable
  reason and a source, which absence never can.

  Each entry records `slug`, `name`, `town`, `region`, `deleted_on`, `reason`
  and `source_url`. The manifest ships empty; research waves append to it, and
  `Ethos.Release.prune_deleted_places/0` applies it to the database.

  Because deletion is what makes a live URL disappear, the manifest is also the
  natural tombstone list — the record of which slugs used to exist and why they
  stopped, for any later handler that wants to answer `410 Gone` rather than
  `404` for them. No such handler exists yet.
  """

  @manifest_path Path.join(:code.priv_dir(:ethos), "seed_data/deleted_places.json")

  # This module lives in lib/, so it is persisted as a BEAM artifact and is not
  # recompiled unless something tells Mix to. Without this declaration, editing
  # the manifest would leave the running app holding a stale list.
  @external_resource @manifest_path

  @entries @manifest_path |> File.read!() |> Jason.decode!()
  @slugs @entries |> Enum.map(& &1["slug"]) |> MapSet.new()

  @doc "Every manifest entry, with its evidence."
  def all, do: @entries

  @doc "The deleted slugs, for O(1) membership."
  def slugs, do: @slugs

  @doc "Whether `slug` names a place the manifest has deleted."
  def deleted?(slug), do: MapSet.member?(@slugs, slug)
end
