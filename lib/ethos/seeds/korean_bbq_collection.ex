defmodule Ethos.Seeds.KoreanBbqCollection do
  @moduledoc """
  Seeds the Korean BBQ collection. Idempotent by slug.

  Ten guides, and the reason there are ten rather than eight is geography the
  scoping wave measured rather than assumed. Seattle has four tabletop grills
  inside its city limits and the region's Korean BBQ is four suburban corridors
  up to forty miles out, so the page is Puget Sound. Chicago's Koreatown on
  Lawrence Avenue fell from 158 Korean businesses to 50 between 1997 and 2017
  and the surviving density is suburban Niles and Glenview, which are separate
  municipalities and get their own page. San Francisco proper holds nine and the
  Bay Area's mass is Santa Clara, so the South Bay gets its own.

  `Collections.upsert_collection!/1` raises on an item whose guide slug has no
  row yet, so this must run after `seed_korean_bbq/1` — which is why
  `seed_collections/0` runs last in the release sequence.
  """

  alias Ethos.Collections

  def upsert!, do: Collections.upsert_collection!(attrs())

  @doc """
  The collection's attrs, exposed separately from `upsert!/0` so the seed
  data gate can read this module's own prose — intro and every item blurb —
  without writing to the repo.
  """
  def attrs do
    %{
      slug: "korean-bbq",
      title: "Korean BBQ",
      published: true,
      intro: """
      Korean barbecue means one thing here: a grill set into the table, and meat
      you cook in front of you. Not a tofu house, not fried chicken, not a
      kitchen that grills the short rib and carries it out. That line decides
      every restaurant in this collection, and it is why some famous names are
      missing from it.

      Ten guides, drawn where the grills actually are rather than where the city
      limits fall. Los Angeles is Koreatown and needs no apology. Manhattan is
      five blocks of West 32nd Street. Queens is a five-mile belt along Northern
      Boulevard. Seattle turned out to be Puget Sound, Chicago turned out to be
      two pages, and San Francisco turned out to be smaller than its reputation.
      """,
      items: [
        %{
          guide_slug: "los-angeles-korean-bbq-guide",
          blurb:
            "Koreatown, inside the City of Los Angeles: twenty-four tabletop grills citywide, eighteen of them in and around Koreatown on West 6th Street, Wilshire, West 8th, Olympic, Vermont and Western, and three twenty miles north in the San Fernando Valley."
        },
        %{
          guide_slug: "manhattan-korean-bbq-guide",
          blurb:
            "West 32nd Street between Fifth and Broadway carries six of the borough's eighteen grills, seven more stand a block east and south on Fifth Avenue and the cross streets, and five sit outside Koreatown, from West 22nd Street to East 58th."
        },
        %{
          guide_slug: "queens-korean-bbq-guide",
          blurb:
            "The Kimchi Belt: five miles east from Flushing along Northern Boulevard through Murray Hill, Auburndale, Bayside and Little Neck."
        },
        %{
          guide_slug: "brooklyn-korean-bbq-guide",
          blurb:
            "A complete borough census rather than a best-of — every tabletop grill in Brooklyn, in four of its sixty-nine neighborhoods."
        },
        %{
          guide_slug: "london-korean-bbq-guide",
          blurb:
            "Grills across eight boroughs, from Westminster and Camden out to Lewisham, Greenwich, Newham and Merton."
        },
        %{
          guide_slug: "chicago-korean-bbq-guide",
          blurb:
            "Inside the city limits, scattered rather than clustered: Chinatown, Wicker Park, the West Loop, Streeterville, and three on the north side."
        },
        %{
          guide_slug: "chicago-north-suburbs-korean-bbq-guide",
          blurb:
            "Niles and Glenview, where Chicago's Korean barbecue actually concentrated after Lawrence Avenue thinned out."
        },
        %{
          guide_slug: "san-francisco-korean-bbq-guide",
          blurb:
            "Three clusters that share no walking radius: the Richmond's Geary corridor, Inner Sunset's 9th Avenue, and Japantown's Post Street."
        },
        %{
          guide_slug: "south-bay-korean-bbq-guide",
          blurb:
            "Santa Clara, Sunnyvale and Fremont, at the south end of the Bay — Fremont across the water in Alameda County — where the Bay Area's tabletop grilling actually is."
        },
        %{
          guide_slug: "puget-sound-korean-bbq-guide",
          blurb:
            "Four suburban corridors: Pacific Highway S in Federal Way, Highway 99 in Lynnwood, S Tacoma Way in Lakewood, and Aurora Ave N in Shoreline."
        }
      ]
    }
  end
end
