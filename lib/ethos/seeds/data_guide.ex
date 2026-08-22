defmodule Ethos.Seeds.DataGuide do
  @moduledoc """
  Loads a JSON seed file (guide + places + entries) and upserts it through
  `Ethos.Seeds.GuideRunner`. Seed files live under `priv/seed_data/` and are
  the authoring format for all data-driven destinations (Manhattan onward).

  Seeding is two-pass at the directory level (see `Ethos.Release.seed_manhattan/1`):
  all files' places first, then all guides — so entries may reference places
  defined in any file of the same run.
  """

  alias Ethos.Places
  alias Ethos.Seeds.GuideRunner

  @required_guide_keys ~w(slug title destination state county intro)

  def upsert_from_file!(path, email) do
    upsert_places!(path)
    upsert_guide!(path, email)
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

  def upsert_places!(path) do
    data = load!(path)
    Enum.map(data["places"], &Places.upsert_place!/1)
  end

  def upsert_guide!(path, email) do
    data = load!(path)
    g = data["guide"]

    runner_data = %{
      slug: g["slug"],
      title: g["title"],
      destination: g["destination"],
      state: g["state"],
      county: g["county"],
      intro: g["intro"],
      sections: g["sections"] || [],
      faq: g["faq"] || [],
      photos: g["photos"] || [],
      entries:
        Enum.map(data["entries"], fn e ->
          %{kind: e["kind"], name: e["name"], note: e["note"], place_slug: e["place_slug"]}
        end)
    }

    GuideRunner.upsert!(runner_data, email)
  end

  defp validate_shape!(path, data) do
    guide = data["guide"]

    cond do
      not (is_map(guide) and is_list(data["places"]) and is_list(data["entries"])) ->
        raise ArgumentError, "#{path}: missing guide/places/entries keys"

      Enum.any?(@required_guide_keys, &(not is_binary(guide[&1]) or guide[&1] == "")) ->
        missing =
          Enum.filter(@required_guide_keys, &(not is_binary(guide[&1]) or guide[&1] == ""))

        raise ArgumentError, "#{path}: guide missing required keys #{inspect(missing)}"

      true ->
        :ok
    end
  end
end
