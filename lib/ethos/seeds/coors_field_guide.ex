defmodule Ethos.Seeds.CoorsFieldGuide do
  @moduledoc """
  Seeds the Coors Field guide. Idempotent by slug.

  ## Denver's county, and why no node repeats the city's name

  Names the destination node `united-states/colorado/denver`, so it lists on the
  Colorado destination page and on Denver's.

  The confirmed verdict establishes the fact and the formal name together:
  *"Denver is a consolidated city-county named 'City and County of Denver,'
  established December 1, 1902, and the only U.S. state capital that is a
  consolidated city-county"*, cited to `en.wikipedia.org/wiki/Denver`, which is
  the source that carries it. The **value shipped is the corpus's rendering of
  that jurisdiction**, not a different jurisdiction: this corpus renders a
  consolidated city-county as the bare city name, which is what wave 1 shipped
  for San Francisco — whose formal name is likewise "City and County of San
  Francisco" — and what the Philadelphia verdict's own correction names as "the
  independent-city convention already used elsewhere in this corpus (St. Louis,
  Baltimore)". Baltimore keeps its "City" suffix because a separate Baltimore
  County exists and the suffix disambiguates; no separate Denver County exists,
  so none is needed.

  The node is what derives `/destinations/colorado/denver`, and a path segment
  reading `city-and-county-of-denver` beside `san-francisco` and `st-louis`
  would be the same jurisdiction class rendered two ways.

  ## Sourcing

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Colorado Rockies research artifact.
  `docs/ballparks/coors-field.md` quotes each published sentence against the
  verdict it rests on and records each omission.

  What was dropped, and why:

    * **No parking price.** A confirmed verdict states that the club's
      transportation page gives no price and that the parking page it links to
      returned a 404, so no published cost could be established from an
      accessible source. The four purchase channels the page does name are
      published; no rate is.

    * **No bus route numbers.** The same page states that RTD light rail and
      local and regional bus routes serve the ballpark and directs riders to RTD
      for specifics, and it *"does not itself name specific bus route numbers"*.
      None is invented here.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: Denver Union Station is prose. The Tattered
  Cover's Union Station branch is a place, because it is a bookstore rather than
  transit infrastructure — see `docs/ballparks/coors-field.md` for the gate
  exemption that required and why it is keyed on the slug.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "coors-field-guide",
      title: "Coors Field: The Ballpark and Lower Downtown Denver",
      destination: "Denver, Colorado",
      destination_path: "united-states/colorado/denver",
      intro: """
      Coors Field stands at 2001 Blake Street in Denver's Lower Downtown, which
      MLB's own site calls the Ballpark Neighborhood, with its main entrance at
      20th and Blake Streets. It opened on April 26, 1995, and the Colorado
      Rockies have played there since.

      This guide takes the ballpark first, then the hotel, brewpub, historic
      district, entertainment block and bookstore around it, and then the team's
      own record. Research for it was carried out from named sources fetched
      directly: English Wikipedia, an independent ballpark directory, ESPN, the
      club's own transportation page and the businesses' own sites. Four of the
      six places rest on their own sites or on undated descriptions, and this
      guide does not say those four are trading.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Coors Field",
          place_slug: "coors-field",
          note:
            "2001 Blake Street: the Rockies' home ballpark, open since April 26, 1995. Capacity 46,897, or 50,144 with standing room as of 2018, with the field 21 feet below street level, a row of purple seats at the one-mile elevation, and \"The Rockpile\" bleachers in center field."
        },
        %{
          kind: "stay",
          name: "The Oxford Hotel",
          place_slug: "oxford-hotel-denver",
          note:
            "1612 17th Street: an 1891 Frank Edbrooke building on the National Register of Historic Places since April 17, 1979, holding the Cruise Room — a windowless Art Deco lounge modeled on an RMS Queen Mary ocean liner lounge, opened the day after Prohibition ended."
        },
        %{
          kind: "food",
          name: "Wynkoop Brewing Company",
          place_slug: "wynkoop-brewing-company",
          note:
            "1634 18th Street: a brewpub founded in 1988 by, among others, the future Colorado governor John Hickenlooper, brewing on site in a basement brewery and known for its Rocky Mountain Oyster Stout."
        },
        %{
          kind: "sight",
          name: "Larimer Square",
          place_slug: "larimer-square-denver",
          note:
            "1400 block of Larimer Street: Denver's first officially designated historic district, from 1971, on the National Register since May 7, 1973, with buildings of the 1870s to 1890s in western-boomtown Victorian commercial style."
        },
        %{
          kind: "sight",
          name: "McGregor Square",
          place_slug: "mcgregor-square-denver",
          note:
            "1901 Wazee Street: a full-block mixed-use district named for the former Rockies president Keli McGregor, built around a 17,000-square-foot plaza with a 66-foot LED screen, and holding The Rally Hotel and 103 condos."
        },
        %{
          kind: "sight",
          name: "Tattered Cover — Union Station",
          place_slug: "tattered-cover-union-station",
          note:
            "1701 Wynkoop Street, inside the Union Station building alongside the Crawford Hotel: a branch of the bookstore founded in Cherry Creek in 1971 and acquired by Barnes & Noble in July 2024."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Denver Union Station, at 1701 Wynkoop Street in Lower Downtown, is
          served by RTD's A Line — the commuter rail to Denver International
          Airport — and by RTD light rail lines B, C, E, G, N and W.

          The ballpark's own transportation page states that RTD light rail and
          local and regional bus routes serve Coors Field, and directs riders to
          RTD at rtd-denver.com or 303.299.6000 for specific route, fare and
          schedule information. It names no specific bus route numbers, and none
          is named here.

          Bicycle parking is available near Gate E, at the left-field corner, at
          Gate A, and across from Gate B at 22nd and Blake Streets.

          On parking, the record gives the channels and not the price. Parking
          passes for Coors Field can be bought in advance online at
          rockies.com/parking, at the Coors Field Ticket Office, at any Rockies
          Dugout Store, or by phone on 303-ROCKIES. The transportation page
          states no price, and the parking page it links to returned a 404 when
          checked, so no published parking cost could be established from an
          accessible source and none appears here.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          The neighborhood is Lower Downtown, and it is older than the ballpark
          by well over a century. LoDo traces to Denver's founding in 1858 by
          General William Larimer. Roughly 20% of the area's buildings were
          demolished in the 1960s and 1970s, and in March 1988 a Denver City
          Council zoning ordinance established the Lower Downtown Historic
          District to protect 127 contributing historic structures. Coors Field
          in 1995 and Ball Arena in 1999 anchor the district as a sports
          destination, which today holds more than 70 bars and restaurants.

          Larimer Square, on the 1400 block of Larimer Street, is the older
          designation: Denver's first officially designated historic district,
          from 1971, added to the National Register of Historic Places on May 7,
          1973. Most of its buildings date from the 1870s to the 1890s, in the
          Victorian commercial style typical of western boomtowns, and Dana
          Hudkins Crawford led their preservation from the 1960s onward through
          adaptive reuse rather than demolition. It is a mixed-use area of
          restaurants, retail, offices and entertainment venues today. No
          official website for the district as a whole could be found, which is
          consistent with what it is: a multi-tenant historic streetscape rather
          than a single operator.

          The Oxford Hotel is at 1612 17th Street, an 1891 building by the
          architect Frank Edbrooke, on the National Register of Historic Places
          since April 17, 1979 and on the Colorado State Register of Historic
          Properties. Its Cruise Room is a windowless Art Deco cocktail lounge
          modeled after an ocean liner lounge from the RMS Queen Mary, with
          bas-relief wall panels depicting toasts from different cultures; it
          opened the day after Prohibition ended and was restored in 2012 with
          historically accurate finishes.

          Wynkoop Brewing Company is at 1634 18th Street, founded in 1988 by,
          among others, the future Colorado governor John Hickenlooper. The
          encyclopedia article on LoDo lists it among the district's notable
          historic businesses and says it remains a notable establishment in the
          neighborhood; the brewery's own site says it brews on site in a
          basement brewery, serves burgers and brunch fare, and is known for its
          Rocky Mountain Oyster Stout.

          McGregor Square, at 1901 Wazee Street, is a full-block mixed-use
          entertainment district with residential, hotel, office and commercial
          components around a 17,000-square-foot outdoor plaza with a 66-foot
          LED screen. It is named for the former Rockies president Keli
          McGregor. Its hotel component is The Rally Hotel, and its 13-story
          residential building, McGregor Square Residences, holds 103 condos.

          The Tattered Cover's Union Station branch is at 1701 Wynkoop Street,
          inside the Union Station building alongside the Crawford Hotel. The
          chain was founded in Denver's Cherry Creek district in 1971 and grew
          into one of the largest independent bookstores in the United States;
          it filed for Chapter 11 bankruptcy in October 2023 and was acquired by
          Barnes & Noble in July 2024. One thing about that filing is worth
          stating rather than glossing: three stores were to close under it, and
          no source this research could reach names which three. The company's
          own store locator lists Union Station as one of four currently
          operating stores, which is consistent with the branch having survived,
          but it is the company's own account and cannot settle the question
          either way.

          One thing to know about the record behind these six. Only the
          ballpark, Larimer Square and Wynkoop Brewing Company have independent
          evidence of current operation — the ballpark from a dated 2026
          third-party schedule, the other two from present-tense encyclopedia
          descriptions. For The Oxford Hotel, McGregor Square and the Tattered
          Cover branch, the only sources reachable were the businesses' own,
          and a business's own site cannot establish that it is trading. So this
          guide does not say those three are open. It does not say they have
          closed: there is no evidence of that, and none should be inferred.
          Telephone first.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Construction began on October 16, 1992, and Coors Field was built at a
          cost of $300 million while the Rockies played their first two seasons,
          1993 and 1994, at Mile High Stadium. It opened on April 26, 1995. It
          was the first baseball-only stadium built in the National League since
          Dodger Stadium opened in 1962.

          Two design decisions define the building. The facade is hand-laid
          brick with a clock tower, and the playing field sits 21 feet below
          street level — a deliberate choice to minimize the stadium's visual
          impact on the surrounding neighborhood. Capacity is 46,897, or 50,144
          including standing room as of 2018, with 63 luxury suites and 4,526
          club seats; the center-field bleacher section, "The Rockpile", seats
          roughly 2,300. Before the 2018 season a video display 59 feet high by
          116.5 feet wide went into left field, replacing the previous
          scoreboard.

          Two features come from where the ballpark is rather than how it was
          built. During construction, workers discovered dinosaur fossils on the
          site, which led to consideration of "Jurassic Park" as a stadium name
          and influenced the choice of a triceratops mascot, Dinger. And the
          elevation — 5,200 feet, one mile above sea level — with a semi-arid
          climate produces a hitter-friendly environment: baseballs are stored
          in a humidor, the outfield fences are placed unusually far from home
          plate, giving Coors Field the largest outfield in Major League
          Baseball, and a row of purple seats marks the one-mile-elevation
          point.

          The name was settled before the ballpark opened and is settled well
          past it. The Coors Brewing Company purchased the naming rights in
          perpetuity in 1991, as part of a $30 million investment, and a 2017
          lease agreement ensures the name remains at least through 2047.

          The Colorado Rockies' official team name has been unchanged since the
          franchise began play in 1993. Its principal owners are Richard and
          Charles Monfort.
          """
        }
      ],
      faq: [
        %{
          "question" => "How do you reach Coors Field on public transit?",
          "answer" =>
            "Denver Union Station, at 1701 Wynkoop Street in Lower Downtown, is served by RTD's A Line — the commuter rail to Denver International Airport — and by RTD light rail lines B, C, E, G, N and W. The ballpark's own transportation page states that RTD light rail and local and regional bus routes serve Coors Field and directs riders to RTD at rtd-denver.com or 303.299.6000 for route, fare and schedule information; it names no specific bus route numbers, so none is named here."
        },
        %{
          "question" => "What does parking cost at Coors Field?",
          "answer" =>
            "No accessible source states a price. Parking passes can be bought in advance online at rockies.com/parking, at the Coors Field Ticket Office, at any Rockies Dugout Store, or by phone on 303-ROCKIES; the club's transportation page states no price, and the parking page it links to returned a 404 when checked. Bicycle parking is available near Gate E at the left-field corner, at Gate A, and across from Gate B at 22nd and Blake Streets."
        },
        %{
          "question" => "Why is Coors Field a hitter's ballpark?",
          "answer" =>
            "Elevation and climate. The ballpark sits at 5,200 feet, one mile above sea level, in a semi-arid climate, and the combination produces a hitter-friendly environment. Baseballs are stored in a humidor, and the outfield fences are placed unusually far from home plate, giving Coors Field the largest outfield in Major League Baseball. A row of purple seats marks the one-mile-elevation point."
        },
        %{
          "question" => "Will the ballpark keep the Coors name?",
          "answer" =>
            "On the record here, yes, and for a long time. The Coors Brewing Company purchased the naming rights in perpetuity in 1991 as part of a $30 million investment, and a 2017 lease agreement ensures the name remains at least through 2047."
        },
        %{
          "question" => "Is the Tattered Cover at Union Station still open?",
          "answer" =>
            "This guide does not say, and the reason is specific rather than general. Tattered Cover filed for Chapter 11 bankruptcy in October 2023, under which three stores were to close, and was acquired by Barnes & Noble in July 2024. No source this research could reach names which three stores closed. The company's own store locator currently lists Union Station as one of four operating stores, which is consistent with the branch having survived, but that is the company's own account and cannot settle it. There is no evidence the branch closed, and none is asserted."
        },
        %{
          "question" => "Which of these places is confirmed open?",
          "answer" =>
            "Three of six. Coors Field, on a dated third-party source — ESPN's 2026 Rockies schedule shows an August 31, 2026 home game there. Larimer Square, on an encyclopedia description of ongoing mixed-use operation. And Wynkoop Brewing Company, on the LoDo article's present-tense statement that it remains a notable establishment in the neighborhood, which is third-party rather than the brewery's own account. The Oxford Hotel, McGregor Square and the Tattered Cover's Union Station branch rest on their own sites alone; a business's own site cannot establish that it is trading, and none of that is evidence of closure."
        }
      ],
      photos: []
    }
  end
end
