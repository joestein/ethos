defmodule Ethos.Seeds.BackfillLinks do
  @moduledoc """
  Idempotent backfill of graph edges between already-seeded pages: CT-five
  history/nearby edges, Manhattan neighborhood adjacency, and cross-state
  see-also edges. Edges whose endpoints are not yet seeded are skipped, so
  this can run at any stage of content buildout. Returns the number of
  edges upserted.
  """

  alias Ethos.{Links, Repo}
  alias Ethos.Guides.Guide

  @ct_g "-ct-travel-guide"
  @m_g "-manhattan-guide"

  # {source_slug_base, target_slug_base, kind, note} — all guide↔guide.
  defp ct_edges do
    [
      {"woodbury#{@ct_g}", "southbury#{@ct_g}", "shared-history",
       "Both grew from the 1673 Pomperaug Plantation; Southbury was Woodbury's southern parish until 1787."},
      {"woodbury#{@ct_g}", "middlebury#{@ct_g}", "shared-history",
       "Middlebury (1807) was assembled partly from Woodbury land."},
      {"southbury#{@ct_g}", "middlebury#{@ct_g}", "shared-history",
       "Middlebury (1807) was assembled partly from Southbury land."},
      {"waterbury#{@ct_g}", "middlebury#{@ct_g}", "shared-history",
       "Middlebury (1807) was assembled partly from Waterbury land."},
      {"waterbury#{@ct_g}", "middlebury#{@ct_g}", "nearby", nil},
      {"middlebury#{@ct_g}", "woodbury#{@ct_g}", "nearby", nil},
      {"woodbury#{@ct_g}", "southbury#{@ct_g}", "nearby", nil},
      {"southbury#{@ct_g}", "danbury#{@ct_g}", "nearby", nil}
    ]
  end

  # Manhattan geographic adjacency, one direction each (rendering unions).
  defp manhattan_pairs do
    [
      {"financial-district", "battery-park-city"},
      {"financial-district", "tribeca"},
      {"financial-district", "two-bridges"},
      {"financial-district", "chinatown"},
      {"battery-park-city", "tribeca"},
      {"tribeca", "soho"},
      {"tribeca", "chinatown"},
      {"chinatown", "little-italy"},
      {"chinatown", "two-bridges"},
      {"chinatown", "lower-east-side"},
      {"little-italy", "nolita"},
      {"little-italy", "soho"},
      {"little-italy", "lower-east-side"},
      {"nolita", "soho"},
      {"nolita", "noho"},
      {"nolita", "lower-east-side"},
      {"two-bridges", "lower-east-side"},
      {"lower-east-side", "east-village"},
      {"soho", "noho"},
      {"soho", "greenwich-village"},
      {"soho", "west-village"},
      {"noho", "greenwich-village"},
      {"noho", "east-village"},
      {"greenwich-village", "west-village"},
      {"greenwich-village", "east-village"},
      {"greenwich-village", "union-square"},
      {"west-village", "meatpacking-district"},
      {"west-village", "chelsea"},
      {"east-village", "alphabet-city"},
      {"east-village", "union-square"},
      {"east-village", "gramercy"},
      {"alphabet-city", "lower-east-side"},
      {"union-square", "flatiron-district"},
      {"union-square", "gramercy"},
      {"union-square", "chelsea"},
      {"flatiron-district", "gramercy"},
      {"flatiron-district", "chelsea"},
      {"flatiron-district", "nomad"},
      {"gramercy", "kips-bay"},
      {"chelsea", "meatpacking-district"},
      {"chelsea", "garment-district"},
      {"chelsea", "hudson-yards"},
      {"hudson-yards", "garment-district"},
      {"hudson-yards", "hell-s-kitchen"},
      {"garment-district", "koreatown"},
      {"garment-district", "theater-district"},
      {"garment-district", "hell-s-kitchen"},
      {"koreatown", "murray-hill"},
      {"koreatown", "nomad"},
      {"koreatown", "midtown"},
      {"murray-hill", "kips-bay"},
      {"murray-hill", "nomad"},
      {"murray-hill", "midtown"},
      {"nomad", "midtown"},
      {"midtown", "theater-district"},
      {"midtown", "hell-s-kitchen"},
      {"midtown", "upper-east-side"},
      {"theater-district", "hell-s-kitchen"},
      {"hell-s-kitchen", "upper-west-side"},
      {"upper-west-side", "morningside-heights"},
      {"upper-east-side", "yorkville"},
      {"upper-east-side", "carnegie-hill"},
      {"upper-east-side", "east-harlem"},
      {"yorkville", "carnegie-hill"},
      {"yorkville", "east-harlem"},
      {"carnegie-hill", "east-harlem"},
      {"morningside-heights", "harlem"},
      {"morningside-heights", "hamilton-heights"},
      {"harlem", "east-harlem"},
      {"harlem", "hamilton-heights"},
      {"hamilton-heights", "washington-heights"},
      {"washington-heights", "inwood"}
    ]
  end

  defp cross_state_edges do
    [
      {"danbury#{@ct_g}", "midtown#{@m_g}", "see-also",
       "Metro-North's Danbury Branch connects to the New Haven Line into Grand Central Terminal."},
      {"waterbury#{@ct_g}", "midtown#{@m_g}", "see-also",
       "Metro-North's Waterbury Branch connects to the New Haven Line into Grand Central Terminal."}
    ]
  end

  def upsert_all! do
    Links.prune_orphans()

    edges =
      ct_edges() ++
        Enum.map(manhattan_pairs(), fn {a, b} -> {a <> @m_g, b <> @m_g, "nearby", nil} end) ++
        cross_state_edges()

    existing =
      Repo.all(Guide) |> Enum.map(& &1.slug) |> MapSet.new()

    edges
    |> Enum.filter(fn {a, b, _k, _n} ->
      MapSet.member?(existing, a) and MapSet.member?(existing, b)
    end)
    |> Enum.map(fn {a, b, kind, note} ->
      Links.upsert_link!(%{source: {:guide, a}, target: {:guide, b}, kind: kind, note: note})
    end)
    |> length()
  end
end
