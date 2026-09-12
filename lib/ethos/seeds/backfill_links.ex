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
  @sk_g "-ski-guide"

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
      # Newtown lies between them, so this is same-region under the rule the
      # Connecticut expansion codifies: `nearby` means the towns share a border.
      {"southbury#{@ct_g}", "danbury#{@ct_g}", "same-region", nil}
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
    ] ++ ski_migration_edges()
  end

  # Ski wave 8 (docs/ski/new-england.md) migrated Mohawk Mountain, Mount
  # Southington and Ski Sundown out of the Connecticut corpus into their own
  # ski guides (Powder Ridge is new to the corpus, with no prior CT record).
  # This is two edges per pair, and only one direction has an ordering
  # hazard:
  #
  # - CT town -> ski guide (the first four tuples below): the seeding runbook
  #   (docs/runbooks/seeding.md) runs step 3 (`seed_connecticut_expansion`)
  #   long before step 13 (`seed_ski`), so an inline edge in the CT file's own
  #   `"links"` array would target a guide that does not exist yet and
  #   `Links.resolve!/1` would raise, aborting step 3's run partway through.
  #   Routing this direction through this idempotent, order-independent
  #   backfill (which silently skips an edge whose endpoints are not yet
  #   seeded, per this module's own moduledoc) is the same fix already used
  #   above for the two CT-5 code-module guides.
  # - ski guide -> CT town (the last four tuples): no hazard in either seed
  #   order, since step 13 runs after step 3 either way, so this direction
  #   could be an inline edge in each ski file's own `"links"` array instead.
  #   It is kept here anyway, alongside its counterpart, so both edges of
  #   each pair live in one place and no runbook change is needed for either.
  @doc """
  The ski-migration edges, exposed (unlike `ct_edges/0` and its siblings) so
  a test can assert both endpoints of every edge still name a guide the seed
  corpus actually defines — `upsert_all!/0` silently skips an edge whose
  endpoints are not yet seeded, so a guide rename drops one of these links
  with no error and no red test unless something reads this list directly.
  """
  def ski_migration_edges do
    [
      {"cornwall#{@ct_g}", "mohawk-mountain#{@sk_g}", "see-also",
       "Mohawk Mountain's own ski-history guide covers Walt Schoenknecht's 1947 founding and its Mount Snow, Butternut, and Sundown connections."},
      {"southington#{@ct_g}", "mount-southington#{@sk_g}", "see-also",
       "Mount Southington's own ski-history guide covers Dr. Harold Richman's 1960s founding and its postponed dedication ceremony."},
      {"middlefield#{@ct_g}", "powder-ridge#{@sk_g}", "see-also",
       "Powder Ridge's own ski-history guide covers the Zemel brothers' founding and the mountain's 1970 rock festival."},
      {"new-hartford#{@ct_g}", "ski-sundown#{@sk_g}", "see-also",
       "Ski Sundown's own ski-history guide covers its 1964 opening as Satan's Ridge and Channing Murdock's later purchase."},
      {"mohawk-mountain#{@sk_g}", "cornwall#{@ct_g}", "see-also",
       "Cornwall's own travel guide covers its 1740 incorporation, iron-furnace history, and the West Cornwall Covered Bridge beyond this ski area."},
      {"mount-southington#{@sk_g}", "southington#{@ct_g}", "see-also",
       "Southington's own travel guide covers its 1779 incorporation and nut-and-bolt manufacturing history beyond this ski area."},
      {"powder-ridge#{@sk_g}", "middlefield#{@ct_g}", "see-also",
       "Middlefield's own travel guide covers its 1866 incorporation and the Lyman family farm, worked since 1741, beyond this ski area."},
      {"ski-sundown#{@sk_g}", "new-hartford#{@ct_g}", "see-also",
       "New Hartford's own travel guide covers its 1738 incorporation and Ovation Guitars history beyond this ski area."}
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
