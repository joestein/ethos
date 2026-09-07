defmodule Ethos.Seasons do
  @moduledoc """
  Which season the site is dressed in.

  Boundaries are the spec's, which are the astronomical ones rounded to whole
  days. They are NOT `Ethos.Foliage`'s season: that one opens on September 1
  and describes when Connecticut's leaves are worth travelling for. This one
  describes what colour the site is. They are three weeks apart on purpose
  and neither should be derived from the other.

  `current/1` takes the date rather than reading the clock so its boundaries
  can be tested directly. `Ethos.SiteSettings.active_season/0` is what reads
  today's date, and what an admin override goes through.
  """

  @seasons [:spring, :summer, :autumn, :winter]

  @doc "The four seasons, in calendar order from the spring boundary."
  def all, do: @seasons

  @doc "Whether a term is one of the four seasons."
  def valid?(season), do: season in @seasons

  @doc """
  The season a date falls in.

  Compared on `{month, day}` so the year never enters into it, which is what
  makes the December-to-March wrap a single clause rather than a special case
  per year.
  """
  def current(%Date{month: month, day: day}) do
    md = {month, day}

    cond do
      md >= {3, 20} and md <= {5, 31} -> :spring
      md >= {6, 1} and md <= {9, 21} -> :summer
      md >= {9, 22} and md <= {11, 30} -> :autumn
      true -> :winter
    end
  end
end
