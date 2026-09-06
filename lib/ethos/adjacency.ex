defmodule Ethos.Adjacency do
  @moduledoc """
  Which Connecticut towns border which.

  Not derived from polygon geometry: Connecticut publishes it. Every segment
  of the state's town-lines layer carries `TOWN_LEFT` and `TOWN_RIGHT`, so the
  adjacency is an attribute to be read rather than a computation to get wrong.

  The dataset is committed (`priv/adjacency.json`) and loaded once at boot,
  mirroring `Ethos.Foliage.Dataset`. The running application never calls
  ArcGIS.

  ## Borders are stored once, not twice

  `Ethos.Links.links_for/2` unions outgoing and incoming edges, so one stored
  edge already appears on both pages. `ordered_pairs/0` therefore returns each
  border once with the alphabetically smaller slug first — writing both
  directions would list every neighbour twice on every page.
  """

  @key {__MODULE__, :adjacency}

  def child_spec(_opts) do
    %{id: __MODULE__, start: {__MODULE__, :start_link, []}, type: :worker, restart: :temporary}
  end

  def start_link do
    load!()
    :ignore
  end

  def load! do
    :persistent_term.put(@key, read!())
    :ok
  rescue
    error ->
      # Boot must survive a missing or malformed file. The link builder is a
      # deploy-time step; an empty map writes no edges and takes nothing down.
      require Logger

      Logger.error(
        "adjacency: could not load, no nearby links will be written: #{Exception.message(error)}"
      )

      :persistent_term.put(@key, %{})
      :ok
  end

  @doc "The whole map: town slug to a sorted list of neighbouring town slugs."
  def all do
    :persistent_term.get(@key)
  rescue
    ArgumentError ->
      load!()
      :persistent_term.get(@key, %{})
  end

  @doc "Neighbouring town slugs, or an empty list for an unknown town."
  def neighbours(town_slug), do: Map.get(all(), town_slug, [])

  @doc """
  Every border exactly once, as `{smaller_slug, larger_slug}`.

  Alphabetical ordering makes the set stable, so re-running the link builder
  updates the same rows instead of adding their reverses.
  """
  def ordered_pairs do
    for {town, neighbours} <- all(), neighbour <- neighbours, town < neighbour do
      {town, neighbour}
    end
    |> Enum.sort()
  end

  @doc """
  Builds the adjacency map from raw town-line rows.

  A blank side means the segment is a state boundary — the neighbour is
  Massachusetts, New York or Rhode Island, not a Connecticut town.
  """
  def pairs_from_rows(rows) when is_list(rows) do
    rows
    |> Enum.reduce(%{}, fn row, acc ->
      left = clean(Map.get(row, "TOWN_LEFT"))
      right = clean(Map.get(row, "TOWN_RIGHT"))

      if left && right && left != right do
        acc
        |> Map.update(left, MapSet.new([right]), &MapSet.put(&1, right))
        |> Map.update(right, MapSet.new([left]), &MapSet.put(&1, left))
      else
        acc
      end
    end)
    |> Map.new(fn {town, set} -> {town, set |> MapSet.to_list() |> Enum.sort()} end)
  end

  defp clean(nil), do: nil

  defp clean(value) when is_binary(value) do
    trimmed = String.trim(value)

    if trimmed == "" or String.match?(trimmed, ~r/^\d+$/) do
      nil
    else
      slugify(trimmed)
    end
  end

  defp clean(_), do: nil

  defp slugify(name) do
    name
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9]+/, "-")
    |> String.trim("-")
  end

  defp read! do
    Path.join([:code.priv_dir(:ethos) |> to_string(), "adjacency.json"])
    |> File.read!()
    |> Jason.decode!()
  end
end
