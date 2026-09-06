defmodule Ethos.Seeds.OracleParkGuide do
  @moduledoc """
  Seeds the Oracle Park guide. Idempotent by slug.

  Names the destination node `united-states/california/san-francisco` — the same
  node the San Francisco corpus hangs its neighbourhoods from. A confirmed
  verdict records that San Francisco became a consolidated city-county in 1856
  and that the county shares the same name and government as the city, with no
  separate county administering the address, so the city sits directly under the
  region with nothing between them.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 San Francisco Giants research artifact.
  `docs/ballparks/oracle-park.md` quotes each published sentence against the
  verdict it rests on.

  What was dropped, and why:

    * **The Caltrain station's block count is not published.** The source says
      the station is one block from the ballpark, and the verdict confirming
      it carries a correction: state the two addresses, or note that both are
      reached by way of the King Street corridor, rather than a block count.
      The verifier's summary raises it again — a sourced block count still
      reads as the defect the vague-proximity rule bans, and the corpus gate
      catches the directional form of exactly this phrasing. Both addresses
      are published instead.

    * **No parking price.** The verdict's own words are "Do NOT publish a
      parking cost from this batch": MLB.com returned HTTP 406 on every fetch,
      SFMTA has no Oracle Park parking page that resolved, and the Port of San
      Francisco's page says only that metered street parking is available on
      the waterfront and links to a third-party garage finder. Those three
      findings are published; no rate is.

    * **No architectural style.** Explicitly withheld by the finder and
      independently confirmed absent by the verifier.

    * **No trading claim for MoMo's**, whose only independent evidence could
      not be reproduced.

  Transit, ferries and parking are prose in "Getting there" and mint no place
  records, per docs/site-builder.md §8: no station, no terminal, no garage and
  no bus route becomes a page.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "oracle-park-guide",
      title: "Oracle Park: The Ballpark, McCovey Cove and Mission Rock",
      destination: "San Francisco, California",
      destination_path: "united-states/california/san-francisco",
      intro: """
      Oracle Park stands at 24 Willie Mays Plaza in the South Beach
      neighborhood of San Francisco, on the bay in the industrial waterfront
      area known as China Basin. It opened on March 31, 2000 and holds 41,331
      as of 2021. The bay beyond its right-field wall is McCovey Cove, and the
      Mission Rock development sits across that water.

      This guide takes the ballpark first, a waterfront diner and a bar and
      grill on the city side, and then the park and three food businesses at
      Mission Rock. Research for it was carried out with web search
      unavailable from the first query onward, from named sources fetched
      directly: English Wikipedia, the businesses' own sites, and the City and
      County of San Francisco's Registered Business Locations dataset, which
      stood in for discovery. That substitution finds registered businesses
      and is blind to unlicensed ones and to press coverage, which is why this
      guide names its gaps rather than implying it swept the neighbourhood
      clean.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Oracle Park",
          place_slug: "oracle-park",
          note:
            "24 Willie Mays Plaza: the Giants' home ballpark, opened March 31, 2000, capacity 41,331 as of 2021. Built for $357 million by HOK Sport, now Populous, and the first Major League ballpark built without public funds since Dodger Stadium in 1962."
        },
        %{
          kind: "food",
          name: "Red's Java House",
          place_slug: "reds-java-house",
          note:
            "30 Pier: a waterfront diner serving burgers on San Francisco sourdough with onions, pickles and yellow mustard, plus breakfast, hot dogs, fish and chips, daily specials and a full bar. On the city business registry at Pier 30 since 2010."
        },
        %{
          kind: "food",
          name: "MoMo's",
          place_slug: "momos-san-francisco",
          note:
            "760 2nd St: an American bar and grill. Its own site is the only source that establishes it; a registry row for the address could not be reproduced, so nothing here says whether it is trading now."
        },
        %{
          kind: "sight",
          name: "China Basin Park",
          place_slug: "china-basin-park",
          note:
            "At the mouth of Mission Creek in Mission Bay, across from the ballpark: five acres opened to the public on April 5, 2024, with a hilly lawn, dog run, artificial beach, amphitheater seating, a Willie McCovey statue and a section of the Bay Trail."
        },
        %{
          kind: "food",
          name: "Flour + Water Pizza Shop",
          place_slug: "flour-and-water-pizza-shop-mission-rock",
          note:
            "1090 Dr Maya Angelou Lane, Suite A, at Mission Rock: wood-fired pizza from the Flour + Water restaurant group, whose flagship serves handmade pastas and Neapolitan-style pizzas. The registry and the Mission Rock article give it two different public-facing names."
        },
        %{
          kind: "food",
          name: "Arsicault Bakery",
          place_slug: "arsicault-bakery-mission-rock",
          note:
            "1070 Bridgeview Way, Unit B, at Mission Rock: a French bakery with quiches and baguettes on the menu, one of four Arsicault Bakery Inc locations active on the city registry."
        },
        %{
          kind: "food",
          name: "Blue Bottle Coffee",
          place_slug: "blue-bottle-coffee-mission-rock",
          note:
            "300 Toni Stone Crossing, Suite E, at Mission Rock: a coffee shop on the city registry since August 5, 2025. The company's own site could not be reached, so what this location serves is not detailed here."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          2nd and King station, at King Street at 2nd Street, is adjacent to
          Oracle Park. It opened in 1998 and became a major transit hub when
          the ballpark, then called Pacific Bell Park, opened in 2000. The N
          Judah Muni Metro line serves it, running from the Caltrain depot in
          the Mission Bay district to Ocean Beach and the Great Highway in the
          Sunset District, and the line's station listing states that it
          serves Oracle Park. The T Third Street line served the station
          historically; that service was rerouted away from it in January
          2023.

          Caltrain's San Francisco station is at 700 Fourth Street at King
          Street, and the ballpark is at 24 Willie Mays Plaza; both are reached
          by way of the King Street corridor. Caltrain runs extra trains on
          game days to carry passengers to and from the ballpark. The station
          is served by Muni bus routes 15, 30 and 45, with overnight service on
          the N Bus, N Owl, T Bus and 91 Owl routes.

          Boats reach the park directly. San Francisco Bay Ferry runs three
          Oracle Park services: from the Main Street Terminal on the northern
          shore of Alameda Island and the Oakland Ferry Terminal to the China
          Basin Ferry Terminal adjacent to the ballpark, for most Giants home
          games and concerts; from the Vallejo Ferry Terminal to the same
          China Basin terminal for all weekend home games; and from the
          Richmond Ferry Terminal to the Pier 48.5 Ferry Terminal for select
          home games. The Oracle Park ferry terminal is outside the eastern
          edge of the ballpark, and behind center field there is a pier where
          ferries let passengers off at the park.

          On parking, three findings and no price. MLB.com's own
          transportation page returned HTTP 406 on every fetch. The SFMTA site
          has no Oracle Park parking page that resolved, and its general
          driving pages say only that metered street parking exists on the
          waterfront with rates checked in real time. The Port of San
          Francisco's page likewise says only that metered street parking is
          available on the waterfront, and links to a third-party garage
          finder rather than naming an official lot or a price. No parking
          cost is published here.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          Two of this guide's businesses are on the city side. Red's Java
          House is a waterfront diner at 30 Pier, serving burgers on San
          Francisco sourdough with onions, pickles and yellow mustard,
          alongside breakfast, hot dogs, fish and chips, daily specials and a
          full bar; the city registry has carried the business at Pier 30
          since November 2010, under its present corporate name since July
          2016. Its own site says it has been doing the same thing since 1955,
          and that year appears nowhere else the research reached, so it is
          published as the business's claim and not as a date. The registry
          and the site also disagree about its ZIP code, which this research
          could not settle.

          MoMo's is an American bar and grill at 760 2nd St. Its own site
          establishes the address and the format, and that is all: the
          registry row that would have corroborated it independently could not
          be reproduced on re-fetch, so this guide does not say whether the
          restaurant is trading now. It does not say it has closed either.

          Across McCovey Cove is Mission Rock, and three of its businesses are
          here. Flour + Water Pizza Shop is at 1090 Dr Maya Angelou Lane, Suite
          A — wood-fired pizza from the group whose flagship serves handmade
          pastas and Neapolitan-style pizzas — though the city registry and
          the Mission Rock article give the location two different
          public-facing names, and which is current could not be established.
          Arsicault Bakery is at 1070 Bridgeview Way, Unit B, one of four
          Arsicault Bakery Inc locations the registry carries as active. Blue
          Bottle Coffee is at 300 Toni Stone Crossing, Suite E, on the
          registry since August 5, 2025.

          China Basin Park is at the mouth of Mission Creek in Mission Bay,
          across from the ballpark. Its five acres opened to the public before
          the Giants' home opener on April 5, 2024, with an official grand
          opening on April 25, after fifteen years of planning alongside the
          Mission Rock development. It holds a hilly lawn, a dog run, an
          artificial beach, amphitheater seating and a Willie McCovey statue,
          and a section of the Bay Trail runs through it. It is under the Port
          of San Francisco's jurisdiction rather than the city's Recreation
          and Parks Department.

          One thing to know about the record behind all of this. Web search
          was exhausted before the first query of this research, and the
          city's Registered Business Locations dataset did the work of
          discovery. That dataset finds registered businesses; it is blind to
          unregistered ones and to anything press coverage would have
          surfaced. This is not a complete inventory of the neighbourhood, and
          it does not claim to be.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Groundbreaking was on December 11, 1997 and the ballpark opened on
          March 31, 2000. HOK Sport, now known as Populous, was the architect.
          The stadium cost $357 million to build, about $667 million in 2025
          dollars, and was the first Major League Baseball ballpark built
          without public funds since Dodger Stadium was completed in 1962 —
          though the Giants received a $10 million tax abatement and $80
          million for upgrades to local infrastructure. No source reached
          states an architectural style for it, and this guide supplies none.

          The name has changed four times. Pacific Bell bought the naming
          rights for the planned ballpark on April 3, 1996, for $50 million
          over 24 years, and it opened as Pacific Bell Park. It became SBC Park
          on January 1, 2004, after SBC acquired Pacific Bell's parent company,
          and took its third name in six years as AT&T Park in 2006. It has
          been Oracle Park since January 10, 2019.

          Capacity is 41,331 as of 2021. The park hosted the 2007 Major League
          Baseball All-Star Game and received LEED Silver Certification in
          April 2010. Barry Bonds hit his record-breaking 756th career home run
          here on August 7, 2007, passing Hank Aaron's career record, and
          Jonathan Sanchez pitched the park's first no-hitter on July 10, 2009.

          The dimensions carry names. The right-field wall is 24 feet high for
          Willie Mays, whose statue stands in front of the entrance at 24
          Willie Mays Plaza, surrounded by 24 palm trees for his uniform
          number; the right-field foul pole is 309 feet from home plate. A
          Willie McCovey statue was dedicated in 2003 at McCovey Point, a Juan
          Marichal in 2005 at the Lefty O'Doul Gate entrance, an Orlando
          Cepeda at the corner of 2nd Street and King Street, and a Gaylord
          Perry on August 13, 2016. The bay beyond the right-field wall is
          unofficially McCovey Cove; as of August 16, 2026, 110 splash hits had
          been knocked into it by Giants players since the park opened, 35 of
          them by Bonds.

          The franchise was established in 1883 as the New York Gothams,
          renamed the New York Giants in 1885, and relocated to San Francisco
          in 1958; on April 15, 1958 it played its first game in the city,
          beating the former Brooklyn and now Los Angeles Dodgers 8-0. It has
          won eight World Series titles: 1905, 1921, 1922, 1933 and 1954 in New
          York, and 2010, 2012 and 2014 in San Francisco, the last three under
          manager Bruce Bochy, which made the Giants the second team in
          National League history to win three championships in five years.
          The franchise has more wins than any other in Major League Baseball
          history, and 67 representatives inducted into the Hall of Fame, more
          than any other team in the history of baseball.
          """
        }
      ],
      faq: [
        %{
          "question" => "How do trains, buses and ferries reach Oracle Park?",
          "answer" =>
            "2nd and King station, at King Street at 2nd Street, is adjacent to the ballpark and is served by the N Judah Muni Metro line; T Third Street service was rerouted away from it in January 2023. Caltrain's San Francisco station is at 700 Fourth Street at King Street, on the same King Street corridor as the ballpark at 24 Willie Mays Plaza, and Caltrain runs extra trains on game days. Muni routes 15, 30 and 45 serve that station, with the N Bus, N Owl, T Bus and 91 Owl overnight. San Francisco Bay Ferry runs Oracle Park services from Alameda and Oakland, from Vallejo for weekend home games, and from Richmond for select games."
        },
        %{
          "question" => "What does parking cost?",
          "answer" =>
            "No published rate could be established, and none is given here. MLB.com's transportation page returned HTTP 406 on every fetch; the SFMTA site has no Oracle Park parking page that resolved and says only that metered street parking exists on the waterfront with rates checked in real time; and the Port of San Francisco's page repeats that and links to a third-party garage finder rather than naming an official lot or price."
        },
        %{
          "question" => "What has the ballpark been called?",
          "answer" =>
            "Pacific Bell Park from 2000 to 2003, after Pacific Bell bought the naming rights on April 3, 1996 for $50 million over 24 years. SBC Park from January 1, 2004, after SBC acquired Pacific Bell's parent company. AT&T Park from 2006 — its third name in six years. Oracle Park since January 10, 2019."
        },
        %{
          "question" => "What is McCovey Cove?",
          "answer" =>
            "The area of the bay beyond the right-field wall, unofficially named after the Giants first baseman Willie McCovey. As of August 16, 2026, 110 splash hits had been knocked into it by Giants players since the park opened in 2000, 35 of them by Barry Bonds."
        },
        %{
          "question" => "What architectural style is Oracle Park?",
          "answer" =>
            "No source this research reached states one. Wikipedia names the architecture firm — HOK Sport, now Populous — but applies no style term to the building the way one is applied to Wrigley Field, and an independent re-check found the same absence. Rather than supply a plausible label, this guide leaves the question open."
        },
        %{
          "question" => "Why does this guide not say whether MoMo's is open?",
          "answer" =>
            "Because the only independent evidence could not be reproduced. The restaurant's own site establishes the address and the format, but a business's own site cannot establish that it is currently trading; the city registry row that would have corroborated it did not come back on an independent re-fetch of the same query. That is not evidence of closure, and none should be inferred."
        }
      ],
      photos: []
    }
  end
end
