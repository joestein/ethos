defmodule Ethos.Seeds.KauffmanStadiumPlaces do
  @moduledoc """
  Seeds the places for the Kauffman Stadium guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  **This module seeds one place, and that is the finding rather than a
  shortfall.** The artifact's `could_not_establish` is explicit: no walkable
  commercial or cultural district around the ballpark could be established from
  any source fetched. Every source describing the surroundings — the Kauffman
  Stadium and Truman Sports Complex articles and an independent ballpark
  directory — describes only a suburban, car-access sports complex outside
  downtown Kansas City, sharing roughly 26,000 parking spaces with the
  neighboring Arrowhead Stadium, with no adjacent businesses, hotels,
  restaurants or attractions named by any of them. A search for the nearest
  branded hotels found the closest named location 8.5 miles away in Blue
  Springs, Missouri. The corpus has no length floor by design, and inventing
  neighbours for a ballpark that a source says has none would be the defect,
  not the fix.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Kansas City Royals research artifact, or the text a `refuted`
  verdict's correction names as publishable.
  `docs/ballparks/kauffman-stadium.md` quotes each published sentence against
  the verdict it rests on, and records every omission.

  What the verification changed:

    * **The capacity history was collapsed and is published in full.** The
      finder wrote that capacity went from 40,625 to 37,903 after the 2007-2009
      renovation. The verifier re-fetched the capacity-by-year table and refuted
      it: the figure immediately after that renovation was 37,840 for 2010-2011,
      and 37,903 did not take effect until 2012, three seasons later, after a
      separate adjustment. The correction's full six-figure series is what
      ships, including the current 38,053.

    * **Two sources disagree on the original capacity**, and both are published:
      the encyclopedia's capacity-by-year table opens at 40,625 for 1973-2002,
      and an independent ballpark directory gives 40,793 for 1973. Neither is
      picked silently.

  **The venue's name has a sourced expiry, and it is published with one.** The
  `status_verdict` confirms Kauffman Stadium as the Royals' current home on
  three independent sources, and carries a caveat the status string itself did
  not: the club *"is planning a relocation to a new downtown Kansas City
  ballpark, with hopes to open it by the start of the 2027 or 2028 MLB
  season."* That is published rather than left for a later wave to discover.
  """

  alias Ethos.Places

  @kansas_city %{town: "Kansas City", state: "Missouri", county: "Jackson County"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@kansas_city, %{
        slug: "kauffman-stadium",
        name: "Kauffman Stadium",
        kind: "stadium",
        address: "1 Royal Way, Kansas City, MO 64129",
        official_url: "https://www.mlb.com/royals/ballpark",
        summary:
          "The home ballpark of the Kansas City Royals, nicknamed \"The K\", at 1 Royal Way in Kansas City, Missouri. It is part of the Truman Sports Complex, in Jackson County, which is owned by the government of Jackson County and managed by the Jackson County Sports Complex Authority, a State of Missouri agency. It opened as Royals Stadium on April 10, 1973 and was renamed Kauffman Stadium on July 2, 1993 to honor the franchise founder and owner Ewing Kauffman. Seating capacity is 38,053 as of the 2026 season. The club is planning a relocation to a new downtown Kansas City ballpark, with hopes to open it by the start of the 2027 or 2028 MLB season.",
        history:
          "The ballpark opened with a 12-1 Royals win over the Texas Rangers before 39,464 fans. Kivett and Myers designed the original facility, and Populous has handled later renovation work. Seating capacity has changed six times: 40,625 from 1973 to 2002, 40,793 from 2003 to 2004, 40,785 from 2005 to 2009, 37,840 from 2010 to 2011 immediately after the 2007-2009 renovation, 37,903 from 2012 to 2025, and 38,053 as of the 2026 season; a separate source gives the original 1973 capacity as 40,793 rather than 40,625, and this research did not resolve the disagreement. A 1990 change installed a Sony JumboTron video board in left-center field; in 1995 Astroturf was replaced with natural grass; a 1998 renovation added Crown Seats, Dugout Suites, new clubhouses and a restaurant, and replaced the orange-and-gold seats with blue ones; and the 2007-2009 renovation, costing $256 million, added new bullpens, expanded club areas, an LED scoreboard and a 360-degree outfield concourse. For the 2026 season the outfield fences were moved inward nine to ten feet and the wall height was reduced, intended to encourage home runs. The ballpark's signature feature is a 322-foot fountain and waterfall display behind the right-field fence, described by its source as the largest privately funded fountain in the world; the fountains run before and after games and between innings, and the waterfalls run continuously during play. Kauffman Stadium hosted MLB All-Star Games in 1973 and 2012, the National League winning 8-0 in 2012, and World Series games in 1980, when the Royals lost to the Philadelphia Phillies; 1985, when they defeated the St. Louis Cardinals for the franchise's first title; 2014, when they lost to the San Francisco Giants; and 2015, when they defeated the New York Mets.",
        photos: []
      })
    ]
  end
end
