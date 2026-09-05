defmodule Ethos.Seeds.KauffmanStadiumGuide do
  @moduledoc """
  Seeds the Kauffman Stadium guide. Idempotent by slug.

  Names the destination node `united-states/missouri/kansas-city`, so it lists on
  the Missouri destination page and on Kansas City's. The ballparks model no
  county tier, so Jackson County is recorded here as a sourced fact rather than
  as a field, and two confirmed verdicts carry it: *"Kauffman
  Stadium is part of the Truman Sports Complex, which is located in Jackson
  County, Missouri"*, cited to an independent ballpark directory, and *"The
  Truman Sports Complex … is 'owned by the government of Jackson County' and
  'managed by the Jackson County Sports Complex Authority, which is a State of
  Missouri agency'"*, cited to the Truman Sports Complex article. Both cited
  sources carry the county, which is the check the wave-2 dispatch requires.

  Note that this is the second Missouri ballpark in the set and the two
  jurisdictions differ: St. Louis is an independent city outside its same-named
  county, while Jackson County is an ordinary county administering Kansas City's
  address. Neither distinction reaches the tree, which stops at the city for
  both.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Kansas City Royals research artifact, or the text a `refuted`
  verdict's correction names as publishable.
  `docs/ballparks/kauffman-stadium.md` quotes each published sentence against
  the verdict it rests on and records each omission.

  **"Around the ballpark" reports an absence, because the research established
  one.** No walkable commercial or cultural district could be established from
  any source fetched; every source describes a suburban, car-access sports
  complex. That section says so and names what the sources do describe, rather
  than being padded with places no verdict supports.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8 — which here means the whole Truman Sports Complex
  parking estate and KCATA Route 47 are prose.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "kauffman-stadium-guide",
      title: "Kauffman Stadium: The Ballpark and the Truman Sports Complex",
      destination: "Kansas City, Missouri",
      destination_path: "united-states/missouri/kansas-city",
      intro: """
      Kauffman Stadium stands at 1 Royal Way in Kansas City, Missouri, in
      Jackson County, as part of the Truman Sports Complex. It opened as Royals
      Stadium on April 10, 1973 and was renamed on July 2, 1993 for the
      franchise founder Ewing Kauffman. The Kansas City Royals have played there
      since the ballpark opened, and the franchise has carried that name since
      its founding in 1969 with no changes.

      Two things about this guide's shape are worth stating at the top. It
      describes one place, because the research established that there is one to
      describe: no source fetched names a walkable commercial or cultural
      district around the ballpark, and every source describes a suburban,
      car-access sports complex outside downtown. And the ballpark's tenure has
      a sourced end date in view — the club is planning a relocation to a new
      downtown Kansas City ballpark, with hopes to open it by the start of the
      2027 or 2028 season.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Kauffman Stadium",
          place_slug: "kauffman-stadium",
          note:
            "1 Royal Way: the Royals' home ballpark, open since April 10, 1973 as Royals Stadium and renamed on July 2, 1993 for Ewing Kauffman. Capacity 38,053 as of 2026, in the Truman Sports Complex, with a 322-foot fountain and waterfall display behind the right-field fence."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          There is no rail line to the ballpark. Arrowhead Stadium, which shares
          the Truman Sports Complex with Kauffman Stadium, is served by a single
          bus route operated by the Kansas City Area Transportation Authority,
          and no rail line reaches the complex. That route is KCATA Route 47,
          which serves Kauffman Stadium.

          By road, the stadium is described as located outside of downtown in a
          suburban area of Kansas City, reached via Interstate 70, the Blue
          Ridge Cutoff, Interstate 435 and Stadium Drive or Raytown Road.
          Renting a car or using a rideshare is described as the fastest way to
          travel from the airport.

          On parking, the record gives both a count and a price. The Truman
          Sports Complex has 26,000 total parking spaces, shared between
          Kauffman Stadium and Arrowhead Stadium. General parking passes for
          regular-season games are expected to cost $21.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          This section reports an absence, and the absence is the finding.

          No walkable commercial or cultural district around Kauffman Stadium
          could be established from any source fetched for this research. Every
          source that describes the site's surroundings — the Kauffman Stadium
          and Truman Sports Complex articles, and an independent ballpark
          directory — describes it only as a suburban, car-access sports complex
          outside downtown Kansas City, sharing roughly 26,000 parking spaces
          with the neighboring Arrowhead Stadium, and names no adjacent
          businesses, hotels, restaurants or attractions at all. A search for
          the nearest branded hotels found the closest named location 8.5 miles
          away, in Blue Springs, Missouri, and no closer establishment could be
          sourced.

          What is around the ballpark, on the evidence, is the complex itself.
          The Truman Sports Complex is owned by the government of Jackson County
          and managed by the Jackson County Sports Complex Authority, a State of
          Missouri agency. Kauffman Stadium and Arrowhead Stadium share it, and
          share its parking.

          A note on how this was researched, because it bears on how much weight
          to put on the absence. Web search was unavailable — the budget was
          exhausted before the first query — so the finding rests on direct
          fetches of encyclopedia, team, hotel-chain and venue-directory pages
          rather than on open business-licence data. Kansas City's open data
          portal did not yield a queryable business-licence dataset through the
          pages fetched, and other candidate sources returned 403s, DNS failures
          or CAPTCHA walls. So this guide says that no district could be
          established, which is not the same as saying no business exists near
          the ballpark. It is a limit on the record, stated as one.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Kauffman Stadium opened as Royals Stadium on April 10, 1973, with a
          12-1 Royals win over the Texas Rangers before 39,464 fans, and was
          renamed on July 2, 1993 to honor the franchise founder and owner Ewing
          Kauffman. Kivett and Myers designed the original facility; Populous has
          handled the later renovation work.

          The capacity has moved six times, and the full series is worth giving
          because a compressed version of it was the one thing this research got
          wrong. It was 40,625 from 1973 to 2002, 40,793 from 2003 to 2004,
          40,785 from 2005 to 2009, 37,840 from 2010 to 2011, 37,903 from 2012
          to 2025, and 38,053 as of the 2026 season. The drop to 37,840 is the
          one that followed the 2007-2009 renovation; the further change to
          37,903 came three seasons later, from a separate adjustment. One
          disagreement remains unresolved: an independent ballpark directory
          gives the original 1973 capacity as 40,793 rather than 40,625, and
          this guide publishes both figures rather than choosing.

          The renovations came in four rounds. In 1990 a Sony JumboTron video
          board went into left-center field. In 1995 the Astroturf was replaced
          with natural grass. A 1998 renovation added Crown Seats, Dugout
          Suites, new clubhouses and a restaurant, and replaced the
          orange-and-gold seats with blue ones. And the 2007-2009 renovation,
          costing $256 million, added new bullpens, expanded club areas, an LED
          scoreboard and a 360-degree outfield concourse. For the 2026 season
          the outfield fences were moved inward nine to ten feet and the wall
          height was reduced, intended to encourage home runs.

          The ballpark's signature feature is a 322-foot fountain and waterfall
          display behind the right-field fence, which its source describes as
          the largest privately funded fountain in the world. The fountains run
          before and after games and between innings, and the waterfalls run
          continuously during play.

          Kauffman Stadium hosted MLB All-Star Games in 1973 and 2012, the
          National League winning 8-0 in 2012. It hosted World Series games in
          1980, when the Royals lost to the Philadelphia Phillies; in 1985, when
          they defeated the St. Louis Cardinals for the franchise's first title;
          in 2014, when they lost to the San Francisco Giants; and in 2015, when
          they defeated the New York Mets.

          The franchise has been the Kansas City Royals since its founding in
          1969, with no name changes in the team's history. It has played in the
          American League Central Division since 1994, having previously played
          in the AL West from 1969 to 1993.
          """
        }
      ],
      faq: [
        %{
          "question" => "Is there a train to Kauffman Stadium?",
          "answer" =>
            "No. Arrowhead Stadium, which shares the Truman Sports Complex with Kauffman Stadium, is served by a single bus route operated by the Kansas City Area Transportation Authority, and no rail line reaches the complex. That route is KCATA Route 47. By road the ballpark is reached via Interstate 70, the Blue Ridge Cutoff, Interstate 435 and Stadium Drive or Raytown Road, and renting a car or using a rideshare is described as the fastest way to travel from the airport."
        },
        %{
          "question" => "What does parking cost at Kauffman Stadium?",
          "answer" =>
            "General parking passes for regular-season games are expected to cost $21. The Truman Sports Complex has 26,000 total parking spaces, shared between Kauffman Stadium and Arrowhead Stadium."
        },
        %{
          "question" => "What is there around the ballpark?",
          "answer" =>
            "On the evidence this research could reach, the sports complex and its parking. No walkable commercial or cultural district around the ballpark could be established: every source describing the surroundings gives a suburban, car-access sports complex outside downtown Kansas City and names no adjacent businesses, hotels, restaurants or attractions. The nearest branded hotel that could be sourced was 8.5 miles away in Blue Springs, Missouri. Web search was unavailable to this research and Kansas City's open data portal produced no queryable business-licence records, so that absence is a limit on the record rather than a claim that nothing is there."
        },
        %{
          "question" => "What is Kauffman Stadium's seating capacity?",
          "answer" =>
            "38,053 as of the 2026 season, after the outfield fences were moved inward nine to ten feet and the wall height reduced. The full series is 40,625 for 1973-2002, 40,793 for 2003-2004, 40,785 for 2005-2009, 37,840 for 2010-2011, 37,903 for 2012-2025 and 38,053 from 2026. One disagreement is unresolved: an independent ballpark directory gives the original 1973 capacity as 40,793 rather than 40,625."
        },
        %{
          "question" => "Are the Royals leaving Kauffman Stadium?",
          "answer" =>
            "The research confirms Kauffman Stadium as the club's current, active home for the 2026 season on three independent sources, and records alongside that a sourced plan: the Royals are planning a relocation to a new downtown Kansas City ballpark, with hopes to open it by the start of the 2027 or 2028 MLB season. Nothing here says the move has happened, and this page should be re-verified rather than assumed stable past the 2026-2027 offseason."
        }
      ],
      photos: []
    }
  end
end
