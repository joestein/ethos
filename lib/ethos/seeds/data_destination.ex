defmodule Ethos.Seeds.DataDestination do
  @moduledoc """
  Loads a destination seed file and upserts it. Seed files live in
  `priv/seed_data/destinations/` and are the authoring format for destination
  page content.

  Unlike `Ethos.Seeds.DataGuide` this is single-pass: a destination references
  no places, resolves no links, and has no author.

  ## A file is an overlay on a node, never a row of its own

  `path` must be the path of a node the roster already owns. Every hub is a
  node now; a curated file adds an intro and photos to one.

  A file keyed outside the tree used to insert quietly, and since only
  `path`/`name`/`intro` are required it inserted with `kind: nil` and
  `parent_id: nil` — a parentless row sitting on a URL a node's redirect was
  supposed to own. Fifteen of those shipped: they disabled fifteen 301s,
  entered the sitemap, listed Connecticut, New York and Rome on `/destinations`
  as countries, and stranded the curated prose on rows nothing linked to.

  So `upsert!/1` raises instead, naming the file and the path. Seeding is not
  transactional, and a run that stops on the first bad file leaves less wreckage
  than one that finishes and publishes it.
  """

  alias Ethos.Destinations

  @required ~w(path name intro)

  def upsert!(file) do
    data = load!(file)

    unless Destinations.get_by_path(data["path"]) do
      raise ArgumentError,
            "#{file}: #{inspect(data["path"])} is not a destination node. A curated hub file " <>
              "overlays a node the roster owns — seed priv/seed_data/destination_tree.json " <>
              "first, and if the path is a legacy one, re-key the file to the node whose " <>
              "legacy_paths holds it."
    end

    Destinations.upsert_destination!(data)
  end

  def load!(path) do
    raw =
      case File.read(path) do
        {:ok, raw} -> raw
        {:error, reason} -> raise ArgumentError, "#{path}: cannot read (#{inspect(reason)})"
      end

    data =
      case Jason.decode(raw) do
        {:ok, data} -> data
        {:error, err} -> raise ArgumentError, "#{path}: invalid JSON — #{Exception.message(err)}"
      end

    validate_shape!(path, data)
    data
  end

  defp validate_shape!(path, data) do
    missing = Enum.filter(@required, &(not is_binary(data[&1]) or data[&1] == ""))

    if missing != [] do
      raise ArgumentError, "#{path}: missing required keys #{inspect(missing)}"
    end

    if not is_list(data["photos"] || []) do
      raise ArgumentError, "#{path}: photos must be a list"
    end

    :ok
  end
end
