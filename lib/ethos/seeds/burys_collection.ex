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
      Five of them sit within a short drive of each other in the state's
      western hills, sharing colonial roots, brass-and-hat industrial
      history, and some of Connecticut's best small-town wandering. This
      collection gathers our guides to the Burys — start anywhere and
      follow the connections.
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
        }
      ]
    })
  end
end
