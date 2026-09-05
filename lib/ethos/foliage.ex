defmodule Ethos.Foliage do
  @moduledoc """
  The Connecticut Foliage Forecast: a per-town, per-week estimate derived from
  CT DEEP's published foliage map.

  DEEP's map is nine pre-rendered raster layers last modified in October 2023.
  It is a climatological normal, not a current-season observation, and there is
  no live foliage data for Connecticut from any source. Everything this module
  returns is therefore an estimate of a normal year, and every page that shows
  one carries `attribution/0` saying so.

  The dataset is frozen and committed; see `mix ethos.foliage.build`. The only
  thing that changes during a season is the editorial field note, which lives
  in Postgres and is not part of this module.
  """

  alias Ethos.Foliage.{Dataset, Note}

  @attribution "Derived from the Connecticut DEEP fall foliage map. DEEP's map is a climatological estimate last published in 2023; it describes a normal year, not this one. Stage names are ours."

  @stage_labels %{
    green: "Still green",
    turning: "Turning",
    near_peak: "Near peak",
    peak: "Peak",
    past_peak: "Past peak"
  }

  @stage_colors %{
    green: "#3f6f3a",
    turning: "#a8a52e",
    near_peak: "#d08a2c",
    peak: "#c0472b",
    past_peak: "#7a3b2e"
  }

  @season_start {9, 1}
  @season_end {11, 30}

  def attribution, do: @attribution

  def stage_label(stage), do: Map.fetch!(@stage_labels, stage)
  def stage_color(stage), do: Map.fetch!(@stage_colors, stage)
  def stage_labels, do: @stage_labels

  def towns, do: Dataset.fetch!().towns
  def town(slug), do: Map.get(Dataset.fetch!().towns_by_slug, slug)

  def routes, do: Dataset.fetch!().routes
  def route(slug), do: Map.get(Dataset.fetch!().routes_by_slug, slug)

  def weeks, do: Dataset.fetch!().weeks
  def week(index), do: Enum.find(weeks(), &(&1.index == index))

  def stage_at(town, week_index) when week_index in 1..9 do
    Enum.at(town.stages, week_index - 1)
  end

  @doc "The date range of a town's first peak week, e.g. \"Oct 14–20\"."
  def peak_label(town), do: week(town.peak_week).label

  @doc """
  Whether a town actually reaches `:peak` in DEEP's data.

  36 of the 169 do not: the shoreline and the south-west corner turn late
  enough that DEEP's eight real weeks run out before they reach the red band.
  Their published window names the week they are most advanced, and the pages
  must say so rather than calling it a peak.
  """
  def peak_verified?(town), do: :peak in town.stages

  @doc """
  The week containing `date`, clamped to 1..9.

  Weeks are year-agnostic month/day ranges, so this compares `{month, day}`
  rather than building dates for the current year.
  """
  def current_week_index(date \\ Date.utc_today()) do
    md = {date.month, date.day}

    cond do
      md < {9, 16} -> 1
      md > {11, 10} -> 9
      true -> Enum.find(weeks(), &within?(md, &1)) |> then(&((&1 && &1.index) || 9))
    end
  end

  @doc "Whether the seasonal foliage panel should render at all."
  def in_season?(date \\ Date.utc_today()) do
    md = {date.month, date.day}
    md >= @season_start and md <= @season_end
  end

  @doc "The most recent published field note for a scope, or nil."
  def latest_note(scope, ref \\ nil), do: Note.latest(scope, ref)

  defp within?(_md, %{starts: nil}), do: false
  defp within?(md, %{starts: s, ends: e}), do: md >= s and md <= e
end
