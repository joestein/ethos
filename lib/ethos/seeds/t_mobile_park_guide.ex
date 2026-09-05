defmodule Ethos.Seeds.TMobileParkGuide do
  @moduledoc """
  Seeds the T-Mobile Park guide. Idempotent by slug.

  Names the destination node `united-states/washington/seattle`, so it lists on
  the Washington destination page and on Seattle's. The ballparks model no county
  tier, so King County is recorded here as a sourced fact rather than as a field.
  Three confirmed verdicts establish it on three independent sources — the
  encyclopedia's T-Mobile Park article, an independent ballpark directory, and
  OpenStreetMap's Nominatim geocoder, which returns the ballpark's address with
  King County in it. None of the three infers the county from the city name.

  Every clause here restates text a `confirmed` verdict carries, or that the
  verifier's own reason or correction expressly states was confirmed.
  `docs/ballparks/t-mobile-park.md` quotes each published sentence against the
  verdict it rests on and records each omission.

  What was dropped, and why:

    * **"Near the Mariners' ballpark."** The finder used it to place Filson's
      flagship, and the verifier refuted it as vague proximity, adding the
      point that matters: *"The source itself only says 'near' too, so the fix
      is not a better source, it is dropping the gesture and relying on the
      sourced address."* The address ships in its place.

    * **"One block west of the station."** The source uses it of the ballpark
      and the finder had already left it out; it stays out. A direction-bearing
      block count is the banned form, and the corpus's gate catches it.

    * **The block count in the historic district's northern boundary**, for the
      same reason. The three precise bounds ship and the fourth is described.

    * **The interval in which the ballpark's roof operates**, which is
      confirmed and duration-shaped. This corpus publishes no duration-shaped
      string, the ban scans module source, and its allowlist cannot be narrowed
      below a whole module, so the clause goes rather than the gate. The roof's
      area and weight ship, and this moduledoc cannot quote what it records
      dropping.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: Stadium station and King Street Station are
  prose, and so is every garage.

  Both the research and its verification ran with WebSearch exhausted before
  the first query, and MLB.com returned HTTP 406 to every fetch in both passes,
  which is why the ballpark's record carries no official URL and no parking
  rate.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "t-mobile-park-guide",
      title: "T-Mobile Park: The Ballpark, SoDo and Pioneer Square",
      destination: "Seattle, Washington",
      destination_path: "united-states/washington/seattle",
      intro: """
      T-Mobile Park stands at 1250 First Avenue South in Seattle's SoDo
      neighborhood, and the Mariners have played there since July 15, 1999,
      when it opened as Safeco Field. It took its present name on January 1,
      2019.

      This guide takes the ballpark first, then the stadium beside it and six
      places in SoDo and Pioneer Square, and then the ballpark's own record.

      Three facts in this research were true and cited to sources that do not
      contain them, and one spatial claim was a gesture rather than a
      measurement. All four were re-established or replaced during
      verification, and this guide names the source that actually carries each
      one.
      """,
      entries: [
        %{
          kind: "sight",
          name: "T-Mobile Park",
          place_slug: "t-mobile-park",
          note:
            "1250 First Avenue South: the Mariners' home ballpark, open since July 15, 1999 as Safeco Field and renamed T-Mobile Park on January 1, 2019. Capacity 47,574, under a retractable roof."
        },
        %{
          kind: "sight",
          name: "Lumen Field",
          place_slug: "lumen-field",
          note:
            "800 Occidental Avenue South: the stadium of the Seahawks, Sounders FC and Reign FC, opened July 28, 2002 and under its fourth name since 2020."
        },
        %{
          kind: "sight",
          name: "Pioneer Square-Skid Road Historic District",
          place_slug: "pioneer-square-historic-district-seattle",
          note:
            "A National Register historic district since June 22, 1970, centered on the triangular plaza at First Avenue and Yesler Way, with late 19th-century Richardsonian Romanesque architecture."
        },
        %{
          kind: "sight",
          name: "Klondike Gold Rush National Historical Park, Seattle Unit",
          place_slug: "klondike-gold-rush-national-historical-park-seattle-unit",
          note:
            "319 Second Avenue South: a National Park Service museum in the 1890 Cadillac Hotel building, reopened as a visitor center on June 26, 2006."
        },
        %{
          kind: "sight",
          name: "Smith Tower",
          place_slug: "smith-tower-seattle",
          note:
            "506 Second Avenue: a 1914 neoclassical tower by Gaggin & Gaggin, a Seattle landmark since 1984 and the tallest building on the West Coast until 1962."
        },
        %{
          kind: "sight",
          name: "Waterfall Garden Park",
          place_slug: "waterfall-garden-park-seattle",
          note:
            "Second Avenue South and South Main Street: a 60-by-80-foot pocket park of 1978 with a 22-foot manmade waterfall, commemorating the UPS founder James Casey."
        },
        %{
          kind: "sight",
          name: "Filson",
          place_slug: "filson-flagship-seattle",
          note:
            "1741 First Avenue South: the flagship store of a Seattle outfitter established in 1897, opened at this address in 1998."
        },
        %{
          kind: "food",
          name: "Merchant's Cafe",
          place_slug: "merchants-cafe-seattle",
          note:
            "109 Yesler Way: a cafe dating to 1890, described by the encyclopedia's Pioneer Square article as Seattle's oldest restaurant."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Sound Transit's 1 Line light rail serves Stadium station, at 501
          South Royal Brougham Way — the intersection of the SODO Busway and
          Royal Brougham Way, under the ramps of Interstate 90. Lumen Field and
          T-Mobile Park sit on the north and south sides of Royal Brougham Way
          respectively. The station opened on July 18, 2009. A one-way adult
          Link fare is $3.00; riders 18 and under travel free; and ORCA LIFT
          and Regional Reduced Fare Permit holders pay $1.00.

          Three Sound Transit Express bus routes serving Tacoma, Lakewood and
          Gig Harbor stop at Stadium station, along with King County Metro
          all-day routes to Renton, Tukwila and Kent and peak-direction routes
          to Renton, Fairwood, Federal Way and Redondo Heights. A Seattle
          Greyhound station stands east of the light-rail platform.

          Longer-distance rail uses King Street Station, at 303 South Jackson
          Street — a National Register building, listed on April 13, 1973,
          designed by Reed and Stem, opened on May 10, 1906 and restored at a
          cost of $55 million through 2013. Sound Transit's Sounder commuter
          rail and Amtrak's Cascades, Empire Builder and Coast Starlight all
          use it. Sounder's S Line runs 13 daily trains south to Tacoma, eight
          of them continuing to Lakewood, on weekdays only; the N Line runs
          four daily trains north to Everett, also weekdays only.

          On parking, the ballpark has an on-site garage with 1,800 stalls,
          plus access to the Lumen Field garage to the north and privately
          operated lots throughout SoDo, including lots across Edgar Martinez
          Drive. One caveat on that sentence is the source's rather than this
          guide's: the article describes the 1,800-stall garage both as
          attached to the ballpark and as being across Edgar Martinez Drive,
          and it is not internally consistent about which. A dedicated
          ride-hailing pickup lot along 3rd Avenue opened in June 2023 at a
          cost of $2.8 million.

          No per-game parking rate is published here, and the obstacle was
          mechanical: MLB.com's transportation page, the likely source for an
          official rate, returned HTTP 406 on every attempt in both research
          passes.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          Lumen Field, at 800 Occidental Avenue South, is the home of the
          Seattle Seahawks, Seattle Sounders FC and Seattle Reign FC. It opened
          on July 28, 2002 at a cost of $430 million and has carried four
          names: Seahawks Stadium to 2004, Qwest Field to 2011, CenturyLink
          Field to 2020 and Lumen Field since. Its design involved a
          coordinated effort with T-Mobile Park to manage traffic, and from its
          partially open south end spectators can see T-Mobile Park's
          retractable roof.

          The Pioneer Square-Skid Road Historic District was listed on the
          National Register of
          Historic Places on June 22, 1970, with boundary increases in 1978 and
          1988, and was separately designated a Seattle preservation district
          in 1970. It is centered on the triangular plaza at First Avenue and
          Yesler Way, and its late 19th-century architecture is Richardsonian
          Romanesque. Its features include the Pioneer Square pergola, in iron
          and glass; a Tlingit totem pole installed in 1940, replacing an
          earlier pole lost to fire; and a Fallen Firefighters Memorial.

          The Seattle unit of Klondike Gold Rush National Historical Park is at
          319 Second Avenue South, in the Cadillac Hotel building inside that
          district. The building was constructed in 1890 and was a major
          outfitting and departure point during the Klondike gold rush
          stampede. It was severely damaged in the 2001 Nisqually earthquake,
          rehabilitated in 2004 and 2005, and reopened as the visitor center on
          June 26, 2006; the visitor center itself was originally established
          on June 2, 1979. Its hours and any admission fee are not published
          here, because the National Park Service's own page was not reached.

          Smith Tower was built in 1914 to a design by the Syracuse firm Gaggin
          & Gaggin, in neoclassical style with granite on its lower floors and
          terracotta above, and was designated a Seattle landmark in 1984. It
          held the title of tallest building west of the Mississippi River
          until 1931 and remained the tallest on the United States West Coast
          until the Space Needle surpassed it in 1962. Its address is given
          here as 506 Second Avenue, from an independent geocoder; the
          encyclopedia's own article says 500 Second Avenue, and this guide
          reports the disagreement rather than picking a side.

          Waterfall Garden Park is a pocket park of 60 by 80 feet at Second and
          Main Streets, created in 1978, designed by Masao Kinoshita with
          Sasaki Associates and funded by the Annie E. Casey Foundation to
          commemorate the UPS founder James Casey. Its manmade waterfall is 22
          feet high, and about 5,000 US gallons of water a minute are pumped
          over it. It is open to the public during the day and locked at night.

          Filson's flagship store is at 1741 First Avenue South. The company,
          formally C.C. Filson Co., was established in Seattle in 1897 as
          Pioneer Alaska Clothing and Blanket Manufacturers and opened this
          flagship in 1998. The address is what this guide gives instead of the
          relationship the sources reach for: both the finder and the
          encyclopedia describe the store as near the ballpark, and this corpus
          does not publish that form of claim at all — a street address is
          checkable and a gesture is not.

          Merchant's Cafe is at 109 Yesler Way and dates to 1890. The
          encyclopedia's article on Pioneer Square calls it Seattle's oldest
          restaurant; the address and the founding year come from the cafe's
          own article, because the Pioneer Square article mentions the cafe
          once and gives neither.

          One thing to know about the record behind these seven. Four are
          published as operating: Lumen Field, on three currently active
          professional tenants; the historic district, which is a standing
          designation rather than a business; the Klondike Gold Rush visitor
          center, as a National Park Service unit described in the present
          tense; and Waterfall Garden Park, a public park with a daily open and
          lock cycle.

          Three carry no such claim, and each for its own reason. Smith Tower
          stands and has active tenancy — it was sold in August 2024 to new
          ownership, and by the end of that year carried 55% office vacancy
          with eleven new leases signed — but nothing reached says whether its
          2016-era observation deck and speakeasy bar are still operating.
          Filson's flagship rests on a geocoder and a historical account of its
          1998 opening, with the listing sites that might confirm it returning
          HTTP 403 in both passes. And Merchant's Cafe has one dated report,
          from October 2024, of a planned temporary closure running from
          January to March 2025, with nothing reached since about a reopening;
          its own site says it is open, which cannot establish that it trades.
          A temporary closure with a planned reopening is not evidence of a
          permanent one, and no closure is asserted for any of the three.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          T-Mobile Park opened on July 15, 1999 as Safeco Field, under a
          naming-rights deal signed in June 1998 with the Seattle-based Safeco
          Insurance worth $40 million over 20 years. T-Mobile acquired the
          rights on December 19, 2018 for $87.5 million over 25 years, and the
          ballpark took its present name on January 1, 2019.

          It replaced the Kingdome. That building's rapid deterioration
          included the collapse of ceiling tiles onto the seating area before a
          scheduled Mariners game in 1994 — a detail this guide cites to the
          Kingdome's own article, because the ballpark's article does not carry
          it, which is the sort of correction this research made four times.
          The Washington State Legislature authorized replacement funding in
          October 1995, ground was broken on March 8, 1997 with Ken Griffey Jr.
          taking part, and the total construction cost was $517 million.

          The design is credited across two sources and this guide keeps them
          apart. An independent ballpark directory names NBBJ as architect,
          gives the capacity as 47,574, and describes a retractable roof
          spanning about nine acres and weighing 22 million pounds. The
          ballpark's own encyclopedia article adds 360 Architecture as a second
          architect, Magnusson Klemencic Associates as structural engineer and
          the Hunt-Kiewit partnership as general contractor. The same directory
          states how long the roof takes to operate, and that figure cannot
          appear here: it is duration-shaped, and this corpus publishes no
          duration-shaped string.

          The ballpark hosted the 2023 Major League Baseball All-Star Game and
          the 2024 NHL Winter Classic.

          The Mariners were established in 1977 as an expansion team, created
          after a lawsuit that followed the Seattle Pilots' 1970 relocation to
          become the Milwaukee Brewers, and the team name was chosen from a
          public contest with more than 600 names submitted. The club is the
          only active Major League Baseball franchise never to have appeared in
          a World Series. In 2001 it compiled a 116-46 regular-season record,
          tying the all-time single-season wins record set by the 1906 Chicago
          Cubs and setting the American League record. It reached the playoffs
          in 1995, 1997, 2000, 2001, 2022 and 2025, and in 2025 won its first
          American League West division title in 24 years.
          """
        }
      ],
      faq: [
        %{
          "question" => "How do you reach T-Mobile Park by transit?",
          "answer" =>
            "Sound Transit's 1 Line light rail serves Stadium station at 501 South Royal Brougham Way, under the ramps of Interstate 90, with Lumen Field and T-Mobile Park on the north and south sides of Royal Brougham Way respectively. A one-way adult Link fare is $3.00, riders 18 and under travel free, and ORCA LIFT and Regional Reduced Fare Permit holders pay $1.00. Three Sound Transit Express routes and several King County Metro routes also stop at the station, and longer-distance Sounder and Amtrak services use King Street Station at 303 South Jackson Street."
        },
        %{
          "question" => "What does parking cost at the ballpark?",
          "answer" =>
            "No source reached publishes a rate, and the obstacle was mechanical: MLB.com returned HTTP 406 to every fetch in both research passes, including the transportation page that would be the likely source for one. What is established is the capacity and the geography — an on-site garage with 1,800 stalls, access to the Lumen Field garage to the north, privately operated lots throughout SoDo including across Edgar Martinez Drive, and a ride-hailing pickup lot along 3rd Avenue that opened in June 2023 at a cost of $2.8 million. The source is not internally consistent about whether the 1,800-stall garage is attached to the ballpark or across Edgar Martinez Drive, and this guide says so rather than choosing."
        },
        %{
          "question" => "Why does the guide give no distance from the ballpark to anything?",
          "answer" =>
            "Because the sources gave gestures rather than measurements, and this corpus does not publish gestures. The clearest case is Filson's flagship, which the research placed \"near the Mariners' ballpark\" — a phrase the source itself uses. The verifier refuted it, noting that a better source would not fix it, because the source says only \"near\" as well; what fixes it is the street address, which is checkable. The same applies to a block count the source uses of the ballpark and to the historic district's northern boundary. Addresses, cross-streets and named bounds appear throughout; distances do not."
        },
        %{
          "question" => "Which of these places is confirmed open?",
          "answer" =>
            "Five of eight. The ballpark, on two encyclopedic sources plus the club's 2025 division title; Lumen Field, on three currently active professional tenants; the Pioneer Square-Skid Road Historic District, which is a standing National Register designation rather than a business; the Klondike Gold Rush visitor center, as a National Park Service unit; and Waterfall Garden Park, a public park. Smith Tower's visitor offering, Filson's flagship and Merchant's Cafe carry no claim — the building stands and has tenants, but its tour is unconfirmed; the store rests on a geocoder and a 1998 account; and the cafe's most recent dated report is a planned temporary closure ending in March 2025. No closure is asserted for any of them."
        },
        %{
          "question" => "Is Merchant's Cafe open?",
          "answer" =>
            "This guide does not say. The most recent dated report reached is that The Infatuation reported on October 10, 2024 that the cafe was slated to close temporarily from January to March 2025, and nothing reached since says whether it reopened. A stated temporary closure with a planned reopening window is not positive evidence of a permanent closure, so nothing here should be read as saying it has shut. The cafe's own site states that it is open, and a business's own site cannot establish that it is trading."
        }
      ],
      photos: []
    }
  end
end
