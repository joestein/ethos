defmodule Ethos.Seeds.RogersCentrePlaces do
  @moduledoc """
  Seeds the places for the Rogers Centre guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Toronto Blue Jays research artifact, or the text a `refuted`
  verdict's correction supplies. `docs/ballparks/rogers-centre.md` quotes each
  published sentence against the verdict it rests on.

  **This is the set's one non-US site.** `state` is `"Ontario"`, a Canadian
  province, and `county` is `"Toronto"` — a confirmed verdict records that
  Toronto is a single-tier municipality, not part of any county, since the
  1998 amalgamation. The city's own name goes in the county field so the guide
  and its ten places share a destination hub, the same treatment St. Louis and
  Baltimore City get in this wave.

  What the verification changed, and what is therefore absent here:

    * **The roof's operating interval is not published.** The confirmed
      verdict gives it in minutes, and every duration-shaped string is banned
      corpus-wide. The roof's 345,000 square feet and its cold-weather
      restriction ship whole.

    * **The Rec Room's amenities are `uncertain` and do not ship.** The Void
      virtual-reality attraction, and the general Rec Room mix of arcades,
      bowling, darts, restaurants, bars and cinema-style event space, all rest
      on a verdict the verifier would not confirm for this location.

    * **The Wheat Sheaf's self-description as Toronto's oldest bar is not
      published.** A confirmed verdict establishes that its own site headlines
      that phrase; it does not establish the claim. The 1849 building date,
      which a third-party list carries, is what ships — the same ruling that
      kept Sluggers' self-superlatives out of the Wrigley checkpoint.

    * **Four places carry no trading claim**: the CN Tower, Real Sports Bar &
      Grill, the Toronto Marriott City Centre Hotel and the Wheat Sheaf.
      Uncertain is not closed, and no closure is asserted for any of them —
      including the Wheat Sheaf, where an unreachable news headline about a
      renovation closure could not be traced or resolved.

    * **Six domains blocked or failed every fetch**, so six records carry
      `official_url: nil` despite a plausible domain existing. An unreachable
      domain is not a verified one.

  No trip duration appears anywhere. Spatial relationships are published only
  where a source fixes them — the aquarium southeast of the CN Tower and east
  of Rogers Centre, Fort York about 900 metres inland of the original
  waterfront — and each is a verdict's own wording.
  """

  alias Ethos.Places

  @toronto %{town: "Toronto", state: "Ontario", county: "Toronto"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@toronto, %{
        slug: "rogers-centre",
        name: "Rogers Centre",
        kind: "stadium",
        address: "1 Blue Jays Way, Toronto, Ontario",
        official_url: nil,
        summary:
          "A multi-purpose stadium at 1 Blue Jays Way in downtown Toronto, west of the CN Tower, home to the Toronto Blue Jays since it opened. It is owned by Rogers Communications and operated by Rogers Stadium Limited Partnership. Current baseball capacity is 39,150, following a renovation in 2023 and 2024. Its retractable roof covers 345,000 square feet and cannot be moved in cold weather, because the closing mechanism could fail at cooler temperatures. The Toronto Marriott City Centre Hotel is within the stadium.",
        history:
          "The ballpark broke ground on October 3, 1986 and opened in 1989 as SkyDome, at a construction cost reported as $570 million, about $1.25 billion in 2025 dollars; the retractable roof was one of the features that made it notable at the time. Two sources give two opening dates — June 3, 1989 and June 5, 1989 — and neither is preferred here. It was renamed Rogers Centre in 2005, when Rogers Communications purchased it for $25 million. A $400 million renovation designed by Populous was carried out in two phases, in 2022-2023 and 2023-2024, reorienting seating toward home plate and reducing baseball capacity from an original 50,516 in the years 1989 to 1998, to 41,500 after the 2023 phase and to 39,150 in 2024.",
        photos: []
      }),
      Map.merge(@toronto, %{
        slug: "cn-tower",
        name: "CN Tower",
        kind: "attraction",
        address: "290 Bremner Boulevard, Toronto, Ontario M5V 3L9",
        official_url: nil,
        summary:
          "A communications and observation tower completed in 1976 and opened to the public on June 26, 1976, at a construction cost of CA$63 million. It held the record for the world's tallest free-standing structure for 32 years, from 1975 until 2007, and remains the tallest free-standing structure on land in North America. Its observation decks include The Top at 446.5 metres, the Main Observation Level at 346 metres and a Lower Observation Level with a glass floor at 342 metres, and it also has a revolving restaurant, a gift shop and the EdgeWalk attraction. Its current admission pricing was not established, and the operator's own site was not reached by this research, so nothing here says whether it is open now.",
        history: nil,
        photos: []
      }),
      Map.merge(@toronto, %{
        slug: "ripleys-aquarium-of-canada",
        name: "Ripley's Aquarium of Canada",
        kind: "attraction",
        address: "288 Bremner Boulevard, Toronto, Ontario M5V 3L9",
        official_url: nil,
        summary:
          "An aquarium that opened on October 16, 2013, one of three owned and operated by Ripley Entertainment. It sits just southeast of the CN Tower and east of Rogers Centre in downtown Toronto, and is accessible from Union Station by way of the SkyWalk.",
        history: nil,
        photos: []
      }),
      Map.merge(@toronto, %{
        slug: "steam-whistle-brewing",
        name: "Steam Whistle Brewing",
        kind: "brewery",
        address: "255 Bremner Boulevard, Toronto, Ontario",
        official_url: "https://steamwhistle.ca/",
        summary:
          "A brewery occupying Bays 1 to 14 of the John Street Roundhouse, a former Canadian Pacific Railway steam locomotive repair facility built in 1929, in Roundhouse Park. It maintains a working steam whistle on the roof that sounds daily to mark the end of the workday. Its own site offers brewery tours and a retail shop and lists current kitchen and taproom hours.",
        history:
          "Steam Whistle Brewing was established in 2000 by three former Upper Canada Brewing Company employees — Greg Cromwell, Greg Taylor and Cam Heaps — who were laid off after their previous employer was acquired. It formally acquired Beau's Brewing Co. in February 2022.",
        photos: []
      }),
      Map.merge(@toronto, %{
        slug: "toronto-railway-museum",
        name: "Toronto Railway Museum",
        kind: "museum",
        address: "255 Bremner Boulevard, Toronto, Ontario",
        official_url: nil,
        summary:
          "A museum in Roundhouse Park that opened on May 28, 2010 and operates year-round, occupying about two-thirds of the John Street Roundhouse building. Its collection includes five full-sized locomotives, passenger and freight cars and a diesel cab simulator, alongside restored structures: Don Station, built in 1896 and now the ticket office, Signal Cabin D, a watchman's shanty, a water tower and a coaling tower. A miniature railway pulled by replica locomotives operates in the park during warmer months. The museum's own site returned HTTP 403 to this research, so its current admission pricing and hours are not published here.",
        history: nil,
        photos: []
      }),
      Map.merge(@toronto, %{
        slug: "the-rec-room-roundhouse",
        name: "The Rec Room (Roundhouse Park)",
        kind: "attraction",
        address: "255 Bremner Boulevard, Toronto, Ontario",
        official_url: nil,
        summary:
          "A Cineplex entertainment complex in Roundhouse Park, and the third tenant of the John Street Roundhouse building alongside Steam Whistle Brewing and the Toronto Railway Museum. It opened in June 2017, at the same time as a location at West Edmonton Mall. What this particular location contains could not be confirmed and is not listed here, and the operator's own site was unreachable, so its hours and pricing are not published either. No civic address or unit number distinct from the shared Roundhouse Park address was found.",
        history: nil,
        photos: []
      }),
      Map.merge(@toronto, %{
        slug: "real-sports-bar-and-grill",
        name: "Real Sports Bar & Grill",
        kind: "restaurant",
        address: "15 York Street, Unit A, Toronto, Ontario M5J 0A3",
        official_url: "https://www.realsports.ca/",
        summary:
          "A sports bar and grill at 15 York Street, Unit A. Its own site describes multiple large screens, a full food menu, a golf simulator and private dining for groups of 13 or more, and lists hours of Monday to Saturday 11:30 AM to 12:00 AM and Sunday 11:30 AM to 11:00 PM. The site's job postings and system integration show the venue is connected to Maple Leaf Sports & Entertainment. Everything known about it comes from that site; no independent source was reachable, so its founding date is unknown and nothing here says whether it is trading now.",
        history: nil,
        photos: []
      }),
      Map.merge(@toronto, %{
        slug: "fort-york-national-historic-site",
        name: "Fort York National Historic Site",
        kind: "historic-site",
        address: "250 Fort York Boulevard, Toronto, Ontario",
        official_url: nil,
        summary:
          "A fort and museum at 250 Fort York Boulevard. The grounds, including Garrison Common and the military cemeteries, are accessible to the public year-round, while access to the fort buildings and the visitor centre is limited by the museum's operating hours. Current admission pricing and hours could not be established and are not published here.",
        history:
          "The site was established in 1793, when 100 soldiers from the Queen's Rangers landed around Garrison Creek and erected the original fort. That fort was destroyed during the Battle of York in April 1813; work to rebuild it began later that year and was completed around 1815. Decades of land reclamation beginning in 1850 left the fort about 900 metres inland of the original waterfront by the 1920s. It was converted into a museum from 1932 and formally reopened as one on Victoria Day in 1934.",
        photos: []
      }),
      Map.merge(@toronto, %{
        slug: "toronto-marriott-city-centre-hotel",
        name: "Toronto Marriott City Centre Hotel",
        kind: "hotel",
        address: "Within Rogers Centre, 1 Blue Jays Way, Toronto, Ontario",
        official_url: nil,
        summary:
          "A hotel attached to Rogers Centre, with a restaurant and bar called the Sportsnet Grill that overlooks the playing field. The room count on record is 348, of which 70 overlook the field; the stadium's renovation in 2023 and 2024 may have changed that figure, and no more recent count was reachable. The hotel's location is given as within Rogers Centre rather than as a street address of its own, because no source independent of that statement could be reached: every attempt at the operator's site returned HTTP 403, and two travel sites were blocked as well. Nothing here says whether the hotel is trading now.",
        history:
          "The hotel was sold to Renaissance for a reported $31 million in 1999, and traded as the Renaissance Toronto Downtown Hotel before its current Marriott City Centre branding.",
        photos: []
      }),
      Map.merge(@toronto, %{
        slug: "wheat-sheaf-tavern",
        name: "The Wheat Sheaf Tavern",
        kind: "restaurant",
        address: "667 King Street West, Toronto, Ontario M5V 1M9",
        official_url: "https://wheatsheaftavern.com/",
        summary:
          "A tavern at 667 King Street West, in the Niagara neighbourhood of Old Toronto. Wikipedia's list of the oldest buildings and structures in Toronto dates the building to 1849. Its own site gives the same address and lists hours of Monday to Sunday, 11:30am to 2am. Whether the tavern has operated continuously since 1849, or under that name throughout, is not established by any source reached, and neither is whether it is trading now: a reference to a news headline about a closure for renovations could not be traced to a reachable article, and no third-party source post-dating it was reachable.",
        history: nil,
        photos: []
      })
    ]
  end
end
