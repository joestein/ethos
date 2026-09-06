defmodule Ethos.SiteSettings do
  @moduledoc """
  Site-wide settings an admin can change without a deploy.

  One key/value row per setting. Today there is exactly one setting — the
  season override — and the table exists rather than an application env var
  because the whole point is that it survives a restart and takes effect
  without one.
  """

  import Ecto.Query

  alias Ethos.Repo
  alias Ethos.Seasons
  alias Ethos.SiteSettings.SiteSetting

  @season_key "season_override"

  @doc """
  The season the site should render in: the override when one is set and
  valid, otherwise the season `date` falls in.
  """
  def active_season(date \\ Date.utc_today()) do
    season_override() || Seasons.current(date)
  end

  @doc """
  The admin's season override, or nil when the site is following the calendar.

  A stored value that is not a season resolves to nil rather than raising.
  The column is free text, and one bad row must not take every page down.
  """
  def season_override do
    case Repo.one(from s in SiteSetting, where: s.key == ^@season_key, select: s.value) do
      nil -> nil
      value -> parse_season(value)
    end
  end

  @doc """
  Sets the override, or clears it when given nil.

  Refuses anything that is not one of `Ethos.Seasons.all/0`, so the admin
  form cannot write a value the renderer would then have to defend against.
  """
  def put_season_override(nil), do: upsert(@season_key, nil)

  def put_season_override(season) do
    if Seasons.valid?(season) do
      upsert(@season_key, Atom.to_string(season))
    else
      {:error, :invalid_season}
    end
  end

  defp upsert(key, value) do
    %SiteSetting{}
    |> SiteSetting.changeset(%{key: key, value: value})
    |> Repo.insert(
      on_conflict: [set: [value: value, updated_at: DateTime.utc_now(:second)]],
      conflict_target: :key
    )
  end

  # String.to_existing_atom/1 rather than String.to_atom/1: the value comes
  # out of a database column, and to_atom on unbounded input is an atom-table
  # leak. The rescue covers a value whose atom was never created at all.
  defp parse_season(value) do
    season = String.to_existing_atom(value)
    if Seasons.valid?(season), do: season, else: nil
  rescue
    ArgumentError -> nil
  end
end
