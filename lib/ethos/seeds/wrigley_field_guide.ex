defmodule Ethos.Seeds.WrigleyFieldGuide do
  @moduledoc """
  Seeds the Wrigley Field guide. Idempotent by slug.

  Names the destination node `united-states/illinois/chicago`, so it lists on the
  Illinois destination page and on Chicago's. The ballparks model no county tier,
  so Cook County is recorded here as a sourced fact rather than as a field — and
  the sourcing is the point: the county was miscited by the research finder, the
  Wrigley Field article does not contain the words "Cook County", and the
  verifier re-sourced it to the Chicago and Lake View articles before confirming
  it.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Wrigley Field research artifact as adjudicated by an independent
  adversarial verifier (157 confirmed, 4 refuted, 7 uncertain). A verdict
  vouches only for what its own `item` text restates, not for every clause of
  the sentence the finder wrote around it. What the verification ruled
  `refuted` or `uncertain` is absent, and `docs/ballparks/wrigley-field.md`
  quotes every published sentence against the verdict it rests on and records
  each omission. That trace is committed rather than left in the research
  workspace, which is git-ignored and is how the Brooklyn artifacts were lost.

  What was dropped, and why:

    * **The rooftop revenue share is written as history.** The sourced 2004
      agreement required 17% of gross revenue and ran until 2023. The finder
      dropped the end date; written in the present tense it would be a false
      statement about 2026.

    * **The 1945 goat ejection is published with no reason given.** The Curse
      of the Billy Goat article says the pair "were bothering other fans"; the
      Billy Goat Tavern article says Philip K. Wrigley "allegedly ejected
      Sianis and goat due to the latter's odor". Two sources, two reasons, so
      this guide gives neither. The contradiction is registered in
      docs/content-defects.md.

    * **Two researched places are not entries here**: The Park at Wrigley, on
      an `uncertain` verdict about its own current name and an inferred
      address, and Cubs Store, whose only confirmed content is a licence row
      held by Levy Premium Foodservice rather than by the club. Strange Cargo
      is excluded outright — the licence register shows it moved to 5216 N
      Clark, ZIP 60640, outside Wrigleyville's sourced boundaries.

    * **Casey Moran's and Sports Corner** are named by the Lake View article
      alongside four places this guide carries, but were not researched in
      this batch. The "Around the ballpark" section says so rather than
      quietly listing four of six.

    * **No trip duration or drive time appears anywhere**, per
      docs/site-builder.md §8. Distances are given as the sources give them:
      "less than a mile", "about one-half mile to the west on Irving Park
      Road", street numbers on the Chicago grid.

    * **No distance between two places is published, in blocks or otherwise.**
      A first draft carried "nine blocks south" and "ten blocks south"; no
      verdict carries either, and the artifact's own grid data refutes them
      (Grace Street at 3800 N and Byron at 3900 N are one block apart, so
      3655 to 3439 is about two). Relative position is given as a direction
      between two published street numbers and nothing more.

    * **No community area is named for Graceland Cemetery.** Alta Vista
      Terrace's placement in Lake View is confirmed; Graceland's is not. A
      first draft put "Both are in Lake View" in an FAQ answer — one sentence
      confirming one half and carrying the other along, which is §9's failure
      exactly.

    * **No parking price and no official Cubs lot.** No published rate was
      reachable, and a City commercial-garage licence records that a garage
      operator is licensed at an address and nothing about affiliation with
      the club.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: no station, no garage and no bus route becomes a
  page.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "wrigley-field-guide",
      title: "Wrigley Field: The Ballpark and the Streets Around It",
      destination: "Chicago, Illinois",
      destination_path: "united-states/illinois/chicago",
      intro: """
      Wrigley Field stands at 1060 West Addison Street, in the Wrigleyville
      neighborhood of Chicago's Lake View community area, on the North Side.
      It opened on April 23, 1914 as Weeghman Park, built for the Chicago
      Whales of the Federal League; the Cubs moved in from the West Side
      Grounds before the 1916 season and play their home games there.
      Wrigleyville's borders run from Grace Street to Cornelia Avenue north
      to south, and from Wilton Avenue to Racine Avenue east to west, and the
      blocks inside them are low-rise brick buildings and houses, some with
      rooftop bleachers colloquially called Wrigley Rooftops where people can
      purchase seats.

      This guide takes the ballpark first, then the bars, restaurants and
      shops on the streets around it — North Clark Street, West Addison
      Street and North Sheffield Avenue — and then a cinema and a grocery on
      North Southport Avenue and two sites north of Grace Street. Research
      for it was carried out with web search unavailable, from named sources
      fetched directly: English Wikipedia, the businesses' own sites, and the
      City of Chicago's business-licence register. Where a claim rests on a
      business's own account of itself, this guide says so. Where the
      research could not establish something — a founding year, a menu,
      whether a business is trading now — this guide leaves it out and names
      the gap.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Wrigley Field",
          place_slug: "wrigley-field",
          note:
            "1060 West Addison Street: the Cubs' home ballpark, opened April 23, 1914 as Weeghman Park, designed by Zachary Taylor Davis. Capacity 41,649. A Chicago Landmark since 2004 and a National Historic Landmark since 2020."
        },
        %{
          kind: "food",
          name: "The Cubby Bear",
          place_slug: "the-cubby-bear",
          note:
            "1059-1065 West Addison Street: named by Wikipedia's Lake View article among the establishments at the Clark and Addison intersection that host the Cubs crowds. The bar's own site refused every fetch, so its founding, menu, programming and hours are unrecorded here."
        },
        %{
          kind: "food",
          name: "Merkle's Bar & Grill",
          place_slug: "merkles-bar-and-grill",
          note:
            "3516 North Clark Street, ZIP 60657: named by the same Lake View sentence, in an article that carries no date for it. Licensed by the City for Public Place of Amusement, Retail Food Establishment and Consumption on Premises; nothing further was reachable."
        },
        %{
          kind: "food",
          name: "Sluggers",
          place_slug: "sluggers-chicago",
          note:
            "3540 North Clark Street, ZIP 60657: wings, burgers, pizza, salads and appetizers with a full bar, and a second level of batting cages, electronic basketball, skee-ball, air hockey and arcade games. Over 40 TVs, six of them 10-foot screens."
        },
        %{
          kind: "stay",
          name: "Hotel Zachary",
          place_slug: "hotel-zachary",
          note:
            "3630 North Clark Street, just across Clark Street from the ballpark, constructed along the west side of the street as part of the Wrigley Field renovation project. It was open for business in time for the Cubs' first home game on April 9, 2018."
        },
        %{
          kind: "food",
          name: "Mordecai",
          place_slug: "mordecai-wrigleyville",
          note:
            "3632 North Clark Street: an American bistro across from the ballpark, serving classic dishes and wine. The licensee of record is registered as Mordecai Brown, also the name of a Cubs pitcher; no source states the bar is named after him."
        },
        %{
          kind: "food",
          name: "Smoke Daddy (Wrigleyville)",
          place_slug: "smoke-daddy-wrigleyville",
          note:
            "3636 North Clark Street: the second of the barbecue restaurant's two locations, the other in Wicker Park. Tagline \"BBQ, Blues, Beers\", with its own sauces and rubs for sale. Whether live blues is programmed at this branch is not stated by any source reached."
        },
        %{
          kind: "sight",
          name: "Clark Street Sports (Wrigleyville)",
          place_slug: "clark-street-sports-wrigleyville",
          note:
            "3650 North Clark Street: a storefront of a locally owned Chicago sports apparel retailer that describes itself as having more than 10 locations across Chicagoland, selling Cubs, White Sox, Blackhawks, Bulls and Bears merchandise. Its own site lists no store addresses."
        },
        %{
          kind: "food",
          name: "Bernie's",
          place_slug: "bernies-chicago",
          note:
            "3664 North Clark Street: carried on the City licence register as Bernie's, with Tavern, Outdoor Patio, Retail Food Establishment and Public Place of Amusement licences. Its own domain does not resolve, and that register entry is the whole of the record."
        },
        %{
          kind: "food",
          name: "Yakzie's Bar & Grill",
          place_slug: "yakzies-bar-and-grill",
          note:
            "3710 North Clark Street: wings, burgers, sandwiches, cheese curds and an Italian beef sandwich. Stated hours Monday to Saturday 11:00 AM to 12:00 AM, Sunday 1:00 PM to 12:00 AM, and it states that it opens for every Cubs game."
        },
        %{
          kind: "food",
          name: "Billy Goat Tavern & Grill (Wrigleyville)",
          place_slug: "billy-goat-tavern-wrigleyville",
          note:
            "3724-3726 North Clark Street: the Wrigleyville branch on the chain's own locations page. The chain's Wikipedia article lists eight locations and does not include this one, so the two sources disagree; the 1934 founding and the 1945 goat belong to the original Madison Street tavern, not to this address."
        },
        %{
          kind: "sight",
          name: "Metro",
          place_slug: "metro-chicago",
          note:
            "3730 North Clark Street: a music venue founded by Joe Shanahan, first opened in 1982 in a building put up in 1927 as a Swedish Community Center. Capacity 1,100; Smart Bar, in the basement beneath it, holds 400."
        },
        %{
          kind: "food",
          name: "Gman Tavern",
          place_slug: "gman-tavern",
          note:
            "3740 North Clark Street: a rotating draft list and a vinyl collection. It states that it opens two hours before every Cubs home game start and during all Metro shows. It states no ownership relationship to Metro, and no source establishes one."
        },
        %{
          kind: "food",
          name: "Murphy's Bleachers",
          place_slug: "murphys-bleachers",
          note:
            "3655 North Sheffield Avenue: local craft beers and pub food, with a recurring Pub Trivia Night except on home game days. Murphy Rooftop Company holds a City licence of the type \"Wrigley Field\" at 3649 North Sheffield Avenue."
        },
        %{
          kind: "food",
          name: "Nisei Lounge",
          place_slug: "nisei-lounge",
          note:
            "3439 North Sheffield Avenue, ZIP 60657: a bar carried on the City licence register with Tavern and Outdoor Patio licences. Its domain does not resolve and no other source mentions it, so its founding, history and the origin of its name are unrecorded here."
        },
        %{
          kind: "food",
          name: "Guthries Tavern",
          place_slug: "guthries-tavern",
          note:
            "1300 West Addison Street: a large collection of board games, craft cocktails, beer, wine, cider and hard seltzer, and pizza, soft pretzels, potato chips and cheese flights. A Thursday Jeopardy! league, Tuesday trivia and euchre leagues."
        },
        %{
          kind: "sight",
          name: "Music Box Theatre",
          place_slug: "music-box-theatre-chicago",
          note:
            "3733 North Southport Avenue: a cinema opened August 22, 1929, its original architects Edward Steinborn and Louis I. Simon, its interior style atmospheric. First-run features, repertory, weekend matinees, midnight cult films, foreign and independent film. Independently owned by the Southport Music Box Corporation since 2003."
        },
        %{
          kind: "food",
          name: "Southport Grocery & Cafe",
          place_slug: "southport-grocery-and-cafe",
          note:
            "3552 North Southport Avenue, ZIP 60657: breakfast and lunch alongside a specialty grocery of house-made preserves, pickles and mustards and artisanal local products. Stated hours every day 8 AM to 3 PM, with the kitchen closing before that."
        },
        %{
          kind: "sight",
          name: "The Vic Theatre",
          place_slug: "the-vic-theatre",
          note:
            "3145 North Sheffield Avenue, ZIP 60657: opened in 1912 as the Victoria Theatre, designed by John Eberson, and recorded as a music venue owned by Jam Productions holding 1,400, or 1,000 seated. No source reached places it relative to the ballpark; Wrigleyville's sourced southern boundary is Cornelia Avenue, north of this address."
        },
        %{
          kind: "sight",
          name: "Alta Vista Terrace District",
          place_slug: "alta-vista-terrace-district",
          note:
            "North Alta Vista Terrace, one block at 1050 West running north from Grace Street to Byron Street: 40 single-family rowhouses built in 1904 by Samuel Gross, in twenty exterior designs arranged so that matching houses face diagonally across the street. A Chicago Landmark since 1971 and on the National Register since 1972. No source reached states whether any of the houses is open to visitors."
        },
        %{
          kind: "sight",
          name: "Graceland Cemetery",
          place_slug: "graceland-cemetery-chicago",
          note:
            "4001 North Clark Street: 121 acres founded in 1860, with monuments by Louis Sullivan, Lorado Taft, Henry Bacon and Daniel Chester French, and the graves of Daniel Burnham, George Pullman and Ernie Banks. On the National Register since January 18, 2001. No source reached gives visiting hours."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Addison station, at 940 West Addison Street, is on the CTA Red Line
          and directly serves Wrigley Field; the ballpark was built with
          convenient access to the "L" in mind. The station opened on June 6,
          1900. The CTA bus routes connecting there are Route 22 Clark, which
          runs Owl Service, and Route 152 Addison. Two Pace suburban express
          routes also serve it: Route 282 Rolling Meadows-Wrigley Field
          Express and Route 779 Hillside-Wrigley Field Express.

          Sheridan station, at 3940 North Sheridan Road in the Lakeview
          neighborhood of Chicago's Lakeview community area, is the other Red
          Line stop used for games. Wrigley Field is less than a mile from
          it, and Red Line passengers travelling to Cubs games use it because
          Addison is often crowded after games. Beginning in spring 2007, CTA
          Purple Line Express trains stopped at Sheridan before Cubs weekday
          night games to provide service to the ballpark; that is a 2007
          service change with no stated end date, and no later source
          confirms the arrangement still stands. The CTA bus routes
          connecting at Sheridan are X9 Ashland Express, 80 Irving Park and
          151 Sheridan. Sheridan is also the closest "L" stop to Graceland
          Cemetery, about one-half mile to the west on Irving Park Road.

          Parking around the ballpark is commercial. The City of Chicago
          licenses commercial garages on the surrounding blocks: A & A
          Parking at 3735 N Clark St, Red Top Parking at 3701 N Clark St and
          Sdralis Parking at 3745 N Clark St, all licensed to 2028; Red Top
          again at 3716 and at 3701-3707 N Sheffield Ave, to the same date;
          Wrigleyville Parking, Inc. at 1109 W Addison St, to 2028, and ABM
          Industry Groups at 1025 W Addison St, to 2027. Operators here are
          named by the legal name the register carries, not its trading-name
          field, which for that Addison Street garage reads "Wrigleyville Park
          Inc". Standard Parking
          holds both a commercial garage licence and a valet operator licence
          at 3630 N Clark St, the Hotel Zachary address.

          Two things the licence register cannot tell anyone. It does not
          establish affiliation, so none of the garages above is an official
          Cubs lot, and this guide does not call one that. And it carries no
          price: no published parking rate for any Wrigley Field lot was
          reachable, so none is given here. Metra service to the ballpark,
          CTA fares and any club-run game-day shuttle were all outside what
          the research could reach.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          The Clark and Addison intersection is the centre of it. Wikipedia's
          Lake View article names The Cubby Bear, Sluggers, Murphy's
          Bleachers, Casey Moran's, Merkle's and Sports Corner as the
          establishments there that host the Cubs crowds. This guide carries
          four of those six; Casey Moran's and Sports Corner were not
          researched in this batch, and are named here rather than quietly
          dropped from a sourced list.

          North Clark Street holds the largest share, in street-number order:
          Merkle's at 3516 and Sluggers at 3540; Hotel Zachary at 3630,
          Mordecai at 3632, Smoke Daddy at 3636, Clark Street Sports at 3650
          and Bernie's at 3664; Yakzie's at 3710, the Billy Goat Tavern's
          Wrigleyville branch at 3724-3726, Metro at 3730 and Gman Tavern at
          3740. West Addison Street holds The Cubby Bear at 1059-1065 and
          Guthries Tavern at 1300 West. On North Sheffield Avenue, Murphy's
          Bleachers is at 3655 and Nisei Lounge south of it at 3439.

          Two more stand on North Southport Avenue: the Music Box Theatre at
          3733, a cinema since 1929, and Southport Grocery & Cafe south of it
          at 3552. Their ZIP codes differ — 60613 for the Music Box and 60657
          for the grocery — and that is what the City register carries for
          each, not an error to be tidied. The Vic Theatre is at 3145 North Sheffield
          Avenue; no source reached places it relative to the ballpark, and
          Wrigleyville's sourced southern boundary is Cornelia Avenue, which
          is north of that address.

          North of Grace Street, Wrigleyville's sourced northern boundary,
          are Alta Vista Terrace — one block of forty rowhouses built in 1904
          — and Graceland Cemetery at 4001 North Clark Street. No source
          reached places either inside the neighbourhood, and neither is
          claimed to be.

          One thing to know about the record behind all of this. Research was
          done without web search, and the City of Chicago's business-licence
          register did the work of discovery. That register shows a licence
          as active until its term expires or it is affirmatively cancelled,
          so a business that closed mid-term still reads as licensed. Four of
          the places above — Merkle's, Nisei Lounge, Clark Street Sports and
          the Vic Theatre — have no dated act on the register within the last
          year and no second source that could be reached, so this guide does
          not say they are trading. It does not say they have closed either:
          there is no evidence of that, and none should be inferred.
          Telephone first.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Wrigley Field opened on April 23, 1914 as Weeghman Park, built for
          Charles Weeghman's Chicago Whales of the Federal League and
          designed by Zachary Taylor Davis. The Whales came second in the
          league in 1914 and won its championship in 1915, and the league
          folded after that season. The Cubs moved from the West Side Grounds
          to the much newer park before the 1916 season. It was named Cubs
          Park from 1920 to 1926, before changing its name to Wrigley Field
          in 1927. It follows the jewel-box ballpark design that was popular
          in the early part of the 20th century, and it is the oldest park in
          the National League, the second-oldest in the majors after Fenway
          Park (1912), and the only remaining Federal League park.

          The club is older than the park. The Cubs began in 1870 as the
          Chicago White Stockings and joined the National League as a charter
          member in 1876. They were known as the Chicago Colts by 1890 and as
          the Chicago Orphans from 1898 to 1902 before becoming the Cubs.
          They played in the National League East Division from 1969 to 1993
          and have played in the Central Division since 1994. They have won
          the World Series in 1907, 1908 and 2016, and the 2016 championship
          ended a 71-year National League pennant drought and a 108-year
          World Series championship drought.

          The Curse of the Billy Goat attaches to the 1945 World Series. At
          Game 4, Billy Goat Tavern owner William Sianis and his pet goat
          Murphy were asked to leave. Two Wikipedia articles give two
          different reasons for the ejection, so this guide gives none.
          Sianis's family says he sent a telegram reading "You are going to
          lose this World Series and you are never going to win another World
          Series again." Sianis died on October 22, 1970. The Cubs won the
          National League pennant on October 22, 2016, the 46th anniversary
          of his death, and then beat Cleveland 8-7 in 10 innings in Game 7
          of the World Series.

          The fabric of the park is dated. Bill Veeck planted the ivy against
          the outfield walls in 1937, the year the scoreboard was installed;
          the scoreboard is still worked by hand, with a number turner
          watching the score changes on a computer and replacing the numbers
          from within it. The marquee over the main entrance went up in 1934,
          was green until it was repainted red on March 23, 1960, is art
          deco-style, and reads "Wrigley Field, Home of Chicago Cubs" in
          white. This was the last Major League Baseball park to have lights
          installed: they were lit on August 8, 1988, after 5,687 consecutive
          Cubs day games. The ballpark was designated a Chicago Landmark on
          February 1, 2004, and a National Historic Landmark and a National
          Register listing on September 23, 2020.

          The $575-million privately funded 1060 Project was revealed at the
          January 2013 Cubs Convention and began its first phase on September
          29, 2014; the ivy-covered walls in the left and right field corners
          were cut from 15 to 11 feet before the 2015 season. Hotel Zachary,
          just across Clark Street, was constructed along the west side of
          the street as part of the Wrigley Field renovation project, and was
          open for business in time for the Cubs' first home game on April 9,
          2018.

          Around it, Lake View was absorbed into Chicago in 1889, and
          Wrigleyville is its low-rise brick buildings and houses, some with
          rooftop bleachers colloquially called Wrigley Rooftops where people
          can purchase seats. Under an agreement reached in 2004, rooftop
          owners were required to pay the club 17% of their gross revenue.
          That agreement ran until 2023, and no source reached says what
          replaced it.
          """
        }
      ],
      faq: [
        %{
          "question" => "Which trains serve Wrigley Field?",
          "answer" =>
            "Addison station, at 940 West Addison Street on the CTA Red Line, directly serves the ballpark, which was built with convenient access to the \"L\" in mind. Sheridan station at 3940 North Sheridan Road is also on the Red Line, less than a mile from the ballpark, and is used by passengers travelling to Cubs games because Addison is often crowded after games. Beginning in spring 2007, CTA Purple Line Express trains stopped at Sheridan before Cubs weekday night games; no later source confirms that arrangement still stands. Whether Metra commuter rail serves the ballpark could not be established."
        },
        %{
          "question" => "Is there official parking, and what does it cost?",
          "answer" =>
            "The City of Chicago licenses several commercial garages on the blocks around the ballpark — on North Clark Street, West Addison Street and North Sheffield Avenue — and Standard Parking holds a garage and a valet licence at the Hotel Zachary address. A licence records that the City has licensed a garage operator at an address; it establishes nothing about affiliation, so none of them can be called an official Cubs lot. No published parking price for any Wrigley Field lot was reachable, and this guide publishes none."
        },
        %{
          "question" => "Why does this guide not say whether some of these places are open?",
          "answer" =>
            "Because the evidence does not reach that far. Research was carried out with web search unavailable, and the City of Chicago's business-licence register did most of the work. That register shows a licence as active until its term expires or it is affirmatively cancelled, so a business that shut mid-term still reads as licensed. For Merkle's, Nisei Lounge, Clark Street Sports and the Vic Theatre, the most recent dated act on the register — a term start or a fee payment — is more than a year old, and no second source was reachable. None of that is evidence of closure, and none is stated as such."
        },
        %{
          "question" => "Why is no reason given for the 1945 goat ejection?",
          "answer" =>
            "Because two sources give two reasons. Wikipedia's Curse of the Billy Goat article says the pair were bothering other fans; its Billy Goat Tavern article says Philip K. Wrigley allegedly ejected them because of the goat's odour. Rather than pick a winner, this guide publishes the incident and no reason for it."
        },
        %{
          "question" => "Are the rooftop bleachers part of the ballpark?",
          "answer" =>
            "They are on the surrounding buildings, not in the park. Wrigleyville's low-rise brick buildings and houses include some with rooftop bleachers colloquially called Wrigley Rooftops, where people can purchase seats. Under an agreement reached in 2004, the rooftop owners were required to pay the Cubs 17% of their gross revenue; that agreement ran until 2023, and no source reached says what replaced it."
        },
        %{
          "question" => "Are Alta Vista Terrace and Graceland Cemetery in Wrigleyville?",
          "answer" =>
            "No source reached says so, and this guide does not claim it. Wrigleyville's sourced borders run from Grace Street to Cornelia Avenue north to south. Alta Vista Terrace, which the source places in Lake View, runs north from Grace Street, putting it at or just beyond that edge. Graceland Cemetery is at 4001 North Clark Street, north of Grace Street; no source reached names a community area for it."
        }
      ],
      photos: []
    }
  end
end
