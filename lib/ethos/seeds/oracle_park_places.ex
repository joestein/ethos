defmodule Ethos.Seeds.OracleParkPlaces do
  @moduledoc """
  Seeds the places for the Oracle Park guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 San Francisco Giants research artifact. The verifier
  re-fetched every cited Wikipedia article, four business sites, the Port of
  San Francisco parking page and six open-data registry queries; of roughly 58
  items, three came back `uncertain` and none was flatly refuted.
  `docs/ballparks/oracle-park.md` quotes each published sentence against the
  verdict it rests on.

  Every record hangs from the node `united-states/california/san-francisco` — the
  same node the San Francisco corpus uses. San Francisco has been a consolidated
  city-county since 1856 and no separate county government administers the
  address, so nothing stands between the city and the region.

  What the verification changed, and what is therefore absent here:

    * **No architectural style for the ballpark.** The artifact records this
      as an explicit instruction: Wikipedia names HOK Sport, now Populous, as
      the architect but no fetch surfaced a style term applied to Oracle Park
      the way "jewel-box" is applied to Wrigley Field, and the verifier
      independently confirmed the absence. Style ships when a verdict states
      one; here no verdict does.

    * **MoMo's carries no trading claim.** Its registry row could not be
      reproduced on independent re-fetch, so the `still_trading` judgement was
      downgraded to `uncertain`. The address and existence are established by
      the restaurant's own site, and that is what the record publishes. Its
      self-description as a landmark dining destination is a self-superlative
      and does not appear.

    * **Two source disagreements are published as disagreements.** Red's Java
      House has two ZIP codes across the registry's current and prior rows and
      its own site; the pizza shop at Mission Rock has two public-facing names,
      the registry's and Wikipedia's. Neither could be resolved, and neither is
      resolved silently here.

    * **Red's founding year is the business's own statement**, not a
      established date. Its site says "Doing The Same Thing Since 1955"; no
      other source reached carries the year, and a business's own site can
      establish that it makes a claim, not that the claim is accurate.

    * **No awards for Arsicault Bakery.** None were fetched from any
      third-party source, only the bakery's self-description.

  No trip duration appears anywhere. Spatial relationships are published only
  where a source fixes them to a named landmark — "across McCovey Cove from
  Oracle Park", "at the mouth of Mission Creek" — and the Caltrain station's
  sourced block count is not carried into prose at all; see the guide.
  """

  alias Ethos.Places

  @sf %{destination_path: "united-states/california/san-francisco"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@sf, %{
        slug: "oracle-park",
        name: "Oracle Park",
        kind: "stadium",
        address: "24 Willie Mays Plaza, San Francisco, CA 94107",
        official_url: nil,
        summary:
          "The home ballpark of the San Francisco Giants, at 24 Willie Mays Plaza in the South Beach neighborhood, on San Francisco Bay in the industrial waterfront area known as China Basin. It opened on March 31, 2000 and has a capacity of 41,331 as of 2021. San Francisco Giants Baseball Club LLC has been registered at the address since January 1, 2016 with no end date. No source reached states an architectural style for it, and none is supplied here.",
        history:
          "Groundbreaking was December 11, 1997 and the architect was HOK Sport, now known as Populous. The stadium cost $357 million to build, about $667 million in 2025 dollars, and was the first Major League Baseball ballpark built without public funds since the completion of Dodger Stadium in 1962 — though the Giants received a $10 million tax abatement and $80 million for upgrades to local infrastructure. Pacific Bell purchased the naming rights for the planned ballpark on April 3, 1996, for $50 million over 24 years, giving Pacific Bell Park from 2000 to 2003; it became SBC Park on January 1, 2004 after SBC acquired Pacific Bell's parent company, took its third name in six years as AT&T Park in 2006, and became Oracle Park on January 10, 2019. It hosted the 2007 Major League Baseball All-Star Game and received LEED Silver Certification in April 2010. Barry Bonds hit his record-breaking 756th career home run here on August 7, 2007, passing Hank Aaron's career record, and Jonathan Sanchez pitched the park's first no-hitter on July 10, 2009. The right-field wall is 24 feet high, honoring Willie Mays, and the right-field foul pole is 309 feet from home plate; the Willie Mays statue stands in front of the entrance at 24 Willie Mays Plaza, surrounded by 24 palm trees for his uniform number. Other statues are a Willie McCovey, dedicated in 2003 at McCovey Point; a Juan Marichal, dedicated in 2005 at the Lefty O'Doul Gate entrance; an Orlando Cepeda at the corner of 2nd Street and King Street; and a Gaylord Perry, dedicated August 13, 2016. The bay beyond the right-field wall is unofficially known as McCovey Cove, after the Giants first baseman Willie McCovey; as of August 16, 2026, 110 splash hits had been knocked into the Cove by Giants players since the park opened, 35 of them by Barry Bonds.",
        photos: []
      }),
      Map.merge(@sf, %{
        slug: "reds-java-house",
        name: "Red's Java House",
        kind: "restaurant",
        address: "30 Pier, San Francisco, CA 94105",
        official_url: "https://redsjavahouse.com",
        summary:
          "A waterfront diner serving burgers on San Francisco sourdough bread with onions, pickles and yellow mustard, alongside breakfast items, hot dogs, fish and chips, daily specials and a full bar. Red's Java House Inc has been on the San Francisco business registry at Pier 30 since July 1, 2016 with no end date, following an earlier registration under the name Red's Java House at the same address that ran from November 1, 2010 to June 30, 2016. The sources disagree on the ZIP code — the current registry row gives 94133, the prior row and the business's own site give 94105 — and this research could not resolve which is right.",
        history:
          "The business states on its own site that it has been \"Doing The Same Thing Since 1955\", describing decades of service to longshoremen, sailors, dock workers, business men and women, military men and women, yachtsmen and generations of families. That founding year appears in no other source the research reached, so it is published as the business's own account of itself rather than as an established date.",
        photos: []
      }),
      Map.merge(@sf, %{
        slug: "momos-san-francisco",
        name: "MoMo's",
        kind: "restaurant",
        address: "760 2nd St, San Francisco, CA 94107",
        official_url: "https://www.sfmomos.com",
        summary:
          "An American bar and grill at 760 2nd St. The restaurant's own site is the only source that establishes it: a business registry row for the address could not be reproduced on independent re-fetch, so nothing here says whether it is trading now. Its own site's description of itself as a landmark dining destination is a self-superlative and is not published, and no founding year or history could be established.",
        history: nil,
        photos: []
      }),
      Map.merge(@sf, %{
        slug: "flour-and-water-pizza-shop-mission-rock",
        name: "Flour + Water Pizza Shop",
        kind: "restaurant",
        address: "1090 Dr Maya Angelou Lane, Suite A, San Francisco, CA 94158",
        official_url: "https://flourandwater.com",
        summary:
          "A wood-fired pizza operation in the Mission Rock development, across McCovey Cove from Oracle Park. It is run by the Flour + Water restaurant group, whose flagship serves handmade pastas and Neapolitan-style pizzas. The San Francisco business registry has carried it at this address since February 25, 2025 with no end date. Two sources give it two public-facing names — the registry's \"Flour + Water Pizza Shop\" and the Mission Rock article's \"Flour + Water Pizzeria\" — and this research could not establish which is current; the registry's is used here, as the register is the name of record.",
        history: nil,
        photos: []
      }),
      Map.merge(@sf, %{
        slug: "arsicault-bakery-mission-rock",
        name: "Arsicault Bakery",
        kind: "cafe",
        address: "1070 Bridgeview Way, Unit B, San Francisco, CA 94158",
        official_url: "https://arsicault-bakery.com",
        summary:
          "A bakery in the Mission Rock development, across McCovey Cove from Oracle Park. It describes itself as \"a French bakery with a simple mission - Serve the food we love\", with a menu including quiches and baguettes. The San Francisco business registry has carried this location since July 10, 2024 with no end date, alongside other active Arsicault Bakery Inc locations at 397 Arguello Blvd, 87 McAllister St and 88 Spear St. No award or ranking for it was reached from any third-party source, and none is published here.",
        history: nil,
        photos: []
      }),
      Map.merge(@sf, %{
        slug: "blue-bottle-coffee-mission-rock",
        name: "Blue Bottle Coffee",
        kind: "cafe",
        address: "300 Toni Stone Crossing, Suite E, San Francisco, CA 94158",
        official_url: nil,
        summary:
          "A coffee shop in the Mission Rock development, across McCovey Cove from Oracle Park. Blue Bottle Coffee Inc has been on the San Francisco business registry at this address since August 5, 2025 with no end date, and the Mission Rock article lists a Blue Bottle Coffee location among the development's businesses. The company's own site could not be reached in this research, so what this particular location serves, beyond the coffee-shop format the registry category and the brand imply, is not published here.",
        history: nil,
        photos: []
      }),
      Map.merge(@sf, %{
        slug: "china-basin-park",
        name: "China Basin Park",
        kind: "park",
        address: "Mission Bay neighborhood, San Francisco, CA",
        official_url: nil,
        summary:
          "A five-acre public park at the mouth of Mission Creek in the Mission Bay neighborhood, across from Oracle Park. It opened to the public before the Giants' home opening game on April 5, 2024, with an official grand opening several weeks later on April 25. Its features include a hilly lawn, a dog run, an artificial beach, amphitheater seating and a statue of Willie McCovey, and a section of the Bay Trail runs through it. No precise street address was found for it: the sources locate it descriptively, and the Port of San Francisco's own site could not be reached for a formal one.",
        history:
          "The park was developed after 15 years of planning, in conjunction with the Mission Rock development. It falls under the Port of San Francisco's jurisdiction rather than the city's Recreation and Parks Department.",
        photos: []
      })
    ]
  end
end
