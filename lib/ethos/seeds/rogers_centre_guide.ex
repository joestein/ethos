defmodule Ethos.Seeds.RogersCentreGuide do
  @moduledoc """
  Seeds the Rogers Centre guide. Idempotent by slug.

  Carries `state: "Ontario"` and `county: "Toronto"`. Ontario is a Canadian
  province rather than a US state, which a confirmed verdict states outright;
  the `state` field is the corpus's name for the first-level subdivision and
  carries the province. Toronto is a single-tier municipality and not part of
  any county — the 1998 amalgamation dissolved Metropolitan Toronto and its six
  constituent municipalities — so the city's own name goes in `county`, giving
  the guide and its ten places a hub to share.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Toronto Blue Jays research artifact, or the text a `refuted`
  verdict's correction supplies. `docs/ballparks/rogers-centre.md` quotes each
  published sentence against the verdict it rests on.

  What was dropped, and why:

    * **The SkyWalk is about 160 metres, not 500.** The finder's figure was
      refuted against its own cited source; the correction's is what ships.
      The verifier notes this is the failure class adversarial verification
      exists for — a figure asserted from a source that gives a different one.

    * **The John Street Roundhouse's heritage designation is dated by
      by-law.** The finder wrote "made part of the Union Station Heritage
      Conservation District in 2008"; the correction establishes designation
      under Part V of Ontario's Heritage Act by by-law 634-2006, passed July
      27, 2006, with a separate heritage easement agreement registered in
      2008.

    * **The 2020-2021 Buffalo and Dunedin seasons are `uncertain` and do not
      appear.** They are widely known and would have been easy to write; the
      verdict does not support them and they are absent.

    * **The roof's operating interval is not published**, per the duration
      ban.

    * **No parking price.** The stadium's own site was unreachable to this
      research and the encyclopedic account of its lot states none.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "rogers-centre-guide",
      title: "Rogers Centre: The Ballpark and the Roundhouse",
      destination: "Toronto, Ontario",
      state: "Ontario",
      county: "Toronto",
      intro: """
      Rogers Centre stands at 1 Blue Jays Way in downtown Toronto, west of the
      CN Tower. It opened in 1989 as SkyDome, took its present name in 2005
      when Rogers Communications bought it for $25 million, and holds 39,150
      for baseball after a renovation in 2023 and 2024.

      This guide takes the ballpark, the hotel inside it, the tower and
      aquarium beside it, the three tenants of a 1929 railway roundhouse, a
      sports bar on York Street, a fort from 1793 and a tavern in an 1849
      building. Research was carried out with web search unavailable from the
      first query onward, and several vendor domains blocked every fetch
      outright, so discovery ran on encyclopedic cross-linking rather than on
      a structured open-data feed. Where the research could not establish
      something — a parking price, a set of hours, whether a business is
      trading now — this guide leaves it out and names the gap.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Rogers Centre",
          place_slug: "rogers-centre",
          note:
            "1 Blue Jays Way: the Blue Jays' home ballpark, opened 1989 as SkyDome and renamed in 2005. Owned by Rogers Communications, operated by Rogers Stadium Limited Partnership, capacity 39,150 after the 2023-2024 renovation. Its retractable roof covers 345,000 square feet."
        },
        %{
          kind: "stay",
          name: "Toronto Marriott City Centre Hotel",
          place_slug: "toronto-marriott-city-centre-hotel",
          note:
            "Within Rogers Centre: a hotel attached to the stadium with the Sportsnet Grill overlooking the field. The room count on record is 348, of which 70 look onto the field; the stadium renovation may have changed it. Previously the Renaissance Toronto Downtown Hotel, sold to Renaissance for a reported $31 million in 1999."
        },
        %{
          kind: "sight",
          name: "CN Tower",
          place_slug: "cn-tower",
          note:
            "290 Bremner Boulevard: opened to the public June 26, 1976, built for CA$63 million. It held the record for the world's tallest free-standing structure from 1975 to 2007 and remains the tallest free-standing structure on land in North America. The Top is at 446.5 metres; the glass floor at 342."
        },
        %{
          kind: "sight",
          name: "Ripley's Aquarium of Canada",
          place_slug: "ripleys-aquarium-of-canada",
          note:
            "288 Bremner Boulevard: opened October 16, 2013, one of three aquariums owned and operated by Ripley Entertainment. It sits just southeast of the CN Tower and east of Rogers Centre, and is reachable from Union Station by the SkyWalk."
        },
        %{
          kind: "food",
          name: "Steam Whistle Brewing",
          place_slug: "steam-whistle-brewing",
          note:
            "255 Bremner Boulevard: a brewery in Bays 1 to 14 of the 1929 John Street Roundhouse, established in 2000 by three laid-off Upper Canada Brewing employees. A working steam whistle on the roof sounds daily to mark the end of the workday."
        },
        %{
          kind: "sight",
          name: "Toronto Railway Museum",
          place_slug: "toronto-railway-museum",
          note:
            "255 Bremner Boulevard: opened May 28, 2010 and open year-round in about two-thirds of the roundhouse. Five full-sized locomotives, a diesel cab simulator, and restored structures including Don Station of 1896, now the ticket office."
        },
        %{
          kind: "sight",
          name: "The Rec Room (Roundhouse Park)",
          place_slug: "the-rec-room-roundhouse",
          note:
            "255 Bremner Boulevard: a Cineplex entertainment complex and the roundhouse's third tenant, opened June 2017. What this location contains could not be confirmed and is not listed."
        },
        %{
          kind: "food",
          name: "Real Sports Bar & Grill",
          place_slug: "real-sports-bar-and-grill",
          note:
            "15 York Street, Unit A: multiple large screens, a full food menu, a golf simulator and private dining for groups of 13 or more, connected to Maple Leaf Sports & Entertainment. Listed hours Monday to Saturday 11:30 AM to 12:00 AM and Sunday 11:30 AM to 11:00 PM."
        },
        %{
          kind: "sight",
          name: "Fort York National Historic Site",
          place_slug: "fort-york-national-historic-site",
          note:
            "250 Fort York Boulevard: established 1793, destroyed in the Battle of York in April 1813, rebuilt by about 1815, a museum since 1932 and formally reopened as one on Victoria Day 1934. The grounds are accessible year-round; the buildings keep museum hours."
        },
        %{
          kind: "food",
          name: "The Wheat Sheaf Tavern",
          place_slug: "wheat-sheaf-tavern",
          note:
            "667 King Street West, in the Niagara neighbourhood of Old Toronto, in a building Wikipedia's list of the city's oldest structures dates to 1849. Its own site lists hours of Monday to Sunday, 11:30am to 2am."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Rogers Centre is served by Union subway station on TTC Line 1
          Yonge-University. Union Station is Toronto's central rail terminal:
          the hub for seven GO Transit regional rail lines — Barrie, Kitchener,
          Lakeshore East, Lakeshore West, Milton, Richmond Hill and Stouffville
          — for VIA Rail intercity service, and for the Union Pearson Express
          airport rail link, which began running between Union Station and
          Toronto Pearson International Airport on June 6, 2015. TTC streetcar
          routes 509 Harbourfront and 510 Spadina can be boarded underground
          there.

          The SkyWalk is an enclosed pedestrian walkway, approximately 160
          metres long, connecting Union Station to the CN Tower and Rogers
          Centre. It was built to link the PATH network with the Metro Toronto
          Convention Centre and the ballpark.

          Rogers Centre's own parking lot sits under the stadium, divided into
          four sections for stadium use — named Sun, Moon, Star and Cloud —
          plus a separate Hotel Zone section. No published rate could be
          established: the stadium's own site could not be reached by this
          research, and the encyclopedic account of the lot states no price.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          The Toronto Marriott City Centre Hotel is inside the stadium, with
          the Sportsnet Grill overlooking the field. The room count on record
          is 348, of which 70 look onto the playing field; the 2023-2024
          renovation may have changed that figure and no more recent count was
          reachable. The hotel was sold to Renaissance for a reported $31
          million in 1999 and traded as the Renaissance Toronto Downtown Hotel
          before its current branding. Every attempt to reach the operator's
          own site returned HTTP 403, and two travel sites were blocked as
          well, so the hotel's location here is stated as "within Rogers
          Centre" — which is what the source says — rather than as a street
          address of its own.

          Bremner Boulevard carries the next three. The CN Tower is at 290: a
          communications and observation tower completed in 1976 and opened to
          the public on June 26 that year, built for CA$63 million, which held
          the record for the world's tallest free-standing structure for 32
          years from 1975 until 2007 and remains the tallest free-standing
          structure on land in North America. Its observation decks are The Top
          at 446.5 metres, the Main Observation Level at 346 and a Lower
          Observation Level with a glass floor at 342, and it also has a
          revolving restaurant, a gift shop and the EdgeWalk attraction.
          Ripley's Aquarium of Canada is at 288, opened on October 16, 2013,
          one of three aquariums owned and operated by Ripley Entertainment; it
          sits just southeast of the CN Tower and east of Rogers Centre, and is
          accessible from Union Station by the SkyWalk.

          255 Bremner Boulevard is a single building with three tenants. The
          John Street Roundhouse was built between 1929 and 1931 for the
          Canadian Pacific Railway, designated a national historic site of
          Canada in 1990, and designated under Part V of Ontario's Heritage Act
          as part of the Union Station Heritage Conservation District by by-law
          634-2006, passed on July 27, 2006; a separate heritage easement
          agreement was registered in 2008. Steam Whistle Brewing occupies Bays
          1 to 14 and keeps a working steam whistle on the roof that sounds
          daily to mark the end of the workday; three former Upper Canada
          Brewing Company employees — Greg Cromwell, Greg Taylor and Cam Heaps
          — founded it in 2000 after being laid off, and it acquired Beau's
          Brewing Co. in February 2022. The Toronto Railway Museum takes about
          two-thirds of the building, opened on May 28, 2010, and runs
          year-round with five full-sized locomotives, passenger and freight
          cars, a diesel cab simulator and restored structures including Don
          Station of 1896, now the ticket office, Signal Cabin D, a watchman's
          shanty, a water tower and a coaling tower; a miniature railway pulled
          by replica locomotives runs in the park during warmer months. The Rec
          Room, a Cineplex entertainment complex, is the third tenant and
          opened in June 2017 alongside a location at West Edmonton Mall. What
          that location contains could not be confirmed and is not listed here.

          Two more sit further out. Real Sports Bar & Grill is at 15 York
          Street, Unit A: multiple large screens, a full food menu, a golf
          simulator and private dining for groups of 13 or more, with hours of
          Monday to Saturday 11:30 AM to 12:00 AM and Sunday 11:30 AM to 11:00
          PM, and a connection to Maple Leaf Sports & Entertainment shown by
          its own site's job postings and system integration. The Wheat Sheaf
          Tavern is at 667 King Street West, in the Niagara neighbourhood of
          Old Toronto, in a building that Wikipedia's list of the city's oldest
          structures dates to 1849; its own site lists hours of Monday to
          Sunday, 11:30am to 2am.

          Fort York National Historic Site is at 250 Fort York Boulevard. Its
          grounds, including Garrison Common and the military cemeteries, are
          accessible year-round, while the fort buildings and visitor centre
          keep the museum's operating hours.

          One thing to know about the record behind all of this. Four of these
          ten places carry no statement here about whether they are trading
          now: the CN Tower, Real Sports Bar & Grill, the Marriott and the
          Wheat Sheaf. Three of the four rest only on their own operator's
          word or on a general encyclopedia claim. The fourth, the Wheat Sheaf,
          has a specific unresolved question behind it: a reference to a news
          headline about the bar closing for renovations could not be traced to
          a reachable article, and no third-party source post-dating it was
          reachable either. None of that is evidence of closure, and none
          should be inferred. Telephone first.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          The Toronto Blue Jays franchise was established in 1976 and began
          play in 1977, debuting on April 7, 1977 with a win against the
          Chicago White Sox. It won back-to-back World Series titles in 1992
          and 1993, becoming the first and, to date, only team based outside
          the United States to appear in and win a World Series. Since 1989 it
          has played its home games primarily at Rogers Centre.

          The ballpark broke ground on October 3, 1986 and opened in 1989 as
          SkyDome, at a construction cost reported as $570 million, about $1.25
          billion in 2025 dollars. Two sources give two opening dates — June 3
          and June 5, 1989 — and this guide gives both rather than choosing.
          Its retractable roof was one of the features that made SkyDome
          notable when it opened; it covers 345,000 square feet and cannot be
          moved in cold weather, because the closing mechanism could fail at
          cooler temperatures.

          Rogers Communications purchased the stadium for $25 million in 2005
          and renamed it Rogers Centre; the company owns it and Rogers Stadium
          Limited Partnership operates it. A $400 million renovation designed
          by Populous was carried out in two phases, 2022-2023 and 2023-2024,
          reorienting seating toward home plate and reducing baseball capacity
          from an original 50,516 in the years 1989 to 1998, to 41,500 after
          the 2023 phase and to 39,150 in 2024.

          One point of jurisdiction, because this guide's fields depend on it.
          Ontario is a Canadian province rather than a US state, and Toronto is
          its provincial capital. Toronto is a single-tier municipality and is
          not part of any county: on January 1, 1998 the Municipality of
          Metropolitan Toronto and its six constituent municipalities were
          dissolved and replaced by a single-tier City of Toronto, which
          handles all local government functions directly without being
          subordinate to a county or regional municipality.
          """
        }
      ],
      faq: [
        %{
          "question" => "How does public transit reach Rogers Centre?",
          "answer" =>
            "By Union subway station on TTC Line 1 Yonge-University. Union Station is also the hub for seven GO Transit regional rail lines — Barrie, Kitchener, Lakeshore East, Lakeshore West, Milton, Richmond Hill and Stouffville — for VIA Rail intercity service, and for the Union Pearson Express, which has run to Toronto Pearson International Airport since June 6, 2015. TTC streetcar routes 509 Harbourfront and 510 Spadina can be boarded underground there, and the SkyWalk, an enclosed pedestrian walkway approximately 160 metres long, connects the station to the CN Tower and the ballpark."
        },
        %{
          "question" => "What does parking cost?",
          "answer" =>
            "No published rate could be established, and none is given here. The stadium's own site could not be reached by this research and the encyclopedic account of its lot states no price. What is established is the lot's shape: it sits under the stadium, divided into four sections for stadium use — Sun, Moon, Star and Cloud — plus a separate Hotel Zone section."
        },
        %{
          "question" => "When did the ballpark open?",
          "answer" =>
            "Two sources give two dates. Wikipedia gives June 3, 1989; ballparksofbaseball.com gives June 5, 1989. Both are confirmed as what their source says, neither is preferred here, and the guide publishes the disagreement rather than picking a winner. Groundbreaking, which both agree on, was October 3, 1986."
        },
        %{
          "question" => "Why does this guide not say whether some of these places are open?",
          "answer" =>
            "Because the evidence stops short for four of them. The CN Tower's current operation rests on a general encyclopedia claim rather than a dated operator statement, and its own site was not reached. Real Sports Bar & Grill and the Marriott rest on the operator's own word or, for the Marriott, on a third-party article alone after every attempt at the hotel's site returned HTTP 403. The Wheat Sheaf has an unresolved question behind it: a reference to a news headline about a closure for renovations could not be traced to a reachable article. None of that is evidence of closure."
        },
        %{
          "question" => "What is the John Street Roundhouse?",
          "answer" =>
            "A Canadian Pacific Railway steam locomotive repair facility, built between 1929 and 1931, that now holds three tenants: Steam Whistle Brewing in Bays 1 to 14, the Toronto Railway Museum in about two-thirds of the building, and The Rec Room. It was designated a national historic site of Canada in 1990, and designated under Part V of Ontario's Heritage Act as part of the Union Station Heritage Conservation District by by-law 634-2006, passed July 27, 2006; a separate heritage easement agreement was registered in 2008."
        },
        %{
          "question" => "Is Toronto in a county?",
          "answer" =>
            "No. Toronto is a single-tier municipality in Ontario and is not part of any county. On January 1, 1998 the Municipality of Metropolitan Toronto and its six constituent municipalities were dissolved and replaced by a single-tier City of Toronto, which handles all local government functions directly without being subordinate to a county or regional municipality. This guide's county field carries the city's own name so that it and its places share one destination hub."
        }
      ],
      photos: []
    }
  end
end
