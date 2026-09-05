defmodule Ethos.Foliage.Routes do
  @moduledoc """
  Ordering towns along a driving route, and resolving a town to the guide that
  covers it.

  168 of Connecticut's 169 towns have a guide whose destination slug is the
  town slug. Mansfield is the exception: it has no guide of its own and is
  covered by the Storrs guide, Storrs being a village within it. That is the
  entire alias table and it is expected to stay one entry — a second entry
  means a town lost its guide and the build gate should have caught it.
  """

  @aliases %{"mansfield" => "storrs"}

  @doc "Town slugs ordered by distance along `path` from its start."
  def order_along(path, towns) do
    towns
    |> Enum.sort_by(fn town -> position_along(path, {town.lng, town.lat}) end)
    |> Enum.map(& &1.slug)
  end

  @doc "The published guide slug covering `town_slug`, or nil."
  def guide_slug_for(town_slug, published) do
    candidate = "#{Map.get(@aliases, town_slug, town_slug)}-ct-travel-guide"
    if MapSet.member?(published, candidate), do: candidate, else: nil
  end

  # Cumulative distance from the path's start to the nearest point on the path.
  defp position_along(path, point) do
    path
    |> Enum.zip(tl(path))
    |> Enum.reduce({0.0, :infinity, 0.0}, fn {a, b}, {travelled, best_d, best_pos} ->
      {d, t} = segment_distance(point, a, b)
      pos = travelled + t * distance(a, b)

      if d < best_d,
        do: {travelled + distance(a, b), d, pos},
        else: {travelled + distance(a, b), best_d, best_pos}
    end)
    |> elem(2)
  end

  # Distance from `p` to segment `a`-`b`, plus how far along the segment (0..1)
  # the closest point sits.
  defp segment_distance({px, py}, {ax, ay}, {bx, by}) do
    dx = bx - ax
    dy = by - ay
    len_sq = dx * dx + dy * dy

    t =
      if len_sq == 0.0,
        do: 0.0,
        else: max(0.0, min(1.0, ((px - ax) * dx + (py - ay) * dy) / len_sq))

    cx = ax + t * dx
    cy = ay + t * dy
    {:math.sqrt(:math.pow(px - cx, 2) + :math.pow(py - cy, 2)), t}
  end

  defp distance({ax, ay}, {bx, by}), do: :math.sqrt(:math.pow(bx - ax, 2) + :math.pow(by - ay, 2))
end
