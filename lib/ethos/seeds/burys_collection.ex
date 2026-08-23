defmodule Ethos.Seeds.BurysCollection do
  @moduledoc "Seeds The Burys of Connecticut collection. Idempotent by slug."

  alias Ethos.Collections

  def upsert! do
    Collections.upsert_collection!(%{
      slug: "the-burys-of-connecticut",
      title: "The Burys of Connecticut",
      published: true,
      intro: """
      Connecticut has a habit of naming towns with the Old English ending
      *-bury* — "fortified settlement" — and ten of its towns carry it.
      Five sit within a short drive of each other in the state's western
      hills, sharing colonial roots and brass-and-hat industrial history.
      The rest range from an iron town in the northwest corner to a Quiet
      Corner village that changed who was allowed to go to school in
      America. This collection gathers our guides to all ten — start
      anywhere and follow the connections.
      """,
      items: [
        %{
          guide_slug: "waterbury-ct-travel-guide",
          blurb:
            "The Brass City: a Thomas Lamb palace theater, the Mattatuck Museum, and grinders since 1922."
        },
        %{
          guide_slug: "danbury-ct-travel-guide",
          blurb:
            "Hat City: the museum campus that tells how Danbury crowned America, plus a working railway museum."
        },
        %{
          guide_slug: "middlebury-ct-travel-guide",
          blurb:
            "Quassy, the lakeside amusement park running since 1908, and a trolley line turned greenway."
        },
        %{
          guide_slug: "southbury-ct-travel-guide",
          blurb:
            "Pomperaug valley parks, a one-kettle land legend, and the region's resort-style hotel."
        },
        %{
          guide_slug: "woodbury-ct-travel-guide",
          blurb:
            "Connecticut's antiques capital, the Glebe House, and the only public Gertrude Jekyll garden in America."
        },
        %{
          guide_slug: "salisbury-ct-travel-guide",
          blurb:
            "Arsenal of the Revolution: northwest-corner iron, Lime Rock Park, and a library that has never closed."
        },
        %{
          guide_slug: "roxbury-ct-travel-guide",
          blurb:
            "Mine Hill's abandoned granite furnace, land-trust trails, and one of the quietest town centers in the state."
        },
        %{
          guide_slug: "simsbury-ct-travel-guide",
          blurb:
            "Heublein Tower above the Farmington Valley, the Old Drake Hill Flower Bridge, and the Pinchot Sycamore."
        },
        %{
          guide_slug: "glastonbury-ct-travel-guide",
          blurb:
            "The oldest continuously operating ferry in America, colonial houses on the green, and river-valley orchards."
        },
        %{
          guide_slug: "canterbury-ct-travel-guide",
          blurb:
            "Prudence Crandall's school for Black students, the fight it started, and a Scenic Byway through town."
        }
      ]
    })
  end
end
