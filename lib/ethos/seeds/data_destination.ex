defmodule Ethos.Seeds.DataDestination do
  @moduledoc """
  Loads a destination seed file and upserts it. Seed files live in
  `priv/seed_data/destinations/` and are the authoring format for destination
  page content.

  Unlike `Ethos.Seeds.DataGuide` this is single-pass: a destination references
  no places, resolves no links, and has no author.
  """

  alias Ethos.Destinations

  @required ~w(path name intro)

  def upsert!(file), do: file |> load!() |> Destinations.upsert_destination!()

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
