defmodule Ethos.Seeds.GreatAmericanBallParkGuide do
  @moduledoc """
  Seeds the Great American Ball Park guide. Idempotent by slug.

  Names the destination node `united-states/ohio/cincinnati`, so it lists on the
  Ohio destination page and on Cincinnati's. The ballparks model no county tier,
  so Hamilton County is recorded here as a sourced fact rather than as a field.
  It comes from the verdict — *"Cincinnati is the most populous city in Hamilton County, Ohio,
  and its county seat"*, confirmed against `en.wikipedia.org/wiki/Cincinnati`,
  which is the source that carries it.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Cincinnati Reds research artifact, or the text a verdict's
  correction names as publishable.
  `docs/ballparks/great-american-ball-park.md` quotes each published sentence
  against the verdict it rests on and records each omission.

  What was dropped, and why:

    * **No parking price.** A `could_not_establish` records that MLB.com's own
      ballpark and transportation subpages returned HTTP 406 to automated fetch
      and could not be read for a parking cost. The ballpark's 850 spaces are a
      confirmed count, and no rate is published here.

    * **The streetcar's stale sponsor name.** Every item naming the "Cincinnati
      Bell Connector" was refuted on the name alone: the system was renamed in
      2022 when Cincinnati Bell rebranded to Altafiber, and it is now the
      Connector. The corrections keep the route facts and fix the name, and the
      corrected text is what this guide carries.

    * **A directory listing that was not there.** Heritage Bank Center's claim
      to appear in The Banks' development directory was refuted by direct
      re-fetch — the arena is not part of The Banks and does not appear in its
      directory at all. The correction supplies what is confirmed: the
      Connector's own article lists the arena among the venues The Banks station
      serves.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: no station, no garage and no bus route becomes a
  page.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "great-american-ball-park-guide",
      title: "Great American Ball Park: The Ballpark and the Cincinnati Riverfront",
      destination: "Cincinnati, Ohio",
      destination_path: "united-states/ohio/cincinnati",
      intro: """
      Great American Ball Park stands at 100 Joe Nuxhall Way on the Cincinnati
      riverfront, in Hamilton County. It opened on March 31, 2003 and is the
      home of Major League Baseball's Cincinnati Reds, who compete in the
      National League Central Division.

      This guide takes the ballpark first, then the museums, market, riverfront
      park and bars around it, and then the team's own record. Research for it
      was carried out from named sources fetched directly: English Wikipedia,
      The Banks development's own directory and tenant pages, Findlay Market's
      own site, and the Hamilton County Auditor. Two of the names in it changed
      recently enough that recollection gets them wrong — the streetcar is the
      Connector, and the brewpub at 115 Joe Nuxhall Way is the Cincinnati Lager
      House — and both are taken from the verified research rather than from
      memory.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Great American Ball Park",
          place_slug: "great-american-ball-park",
          note:
            "100 Joe Nuxhall Way: the Reds' home ballpark, open since March 31, 2003, on the site adjacent to the former Riverfront Stadium. Capacity 43,500 as of 2021, with 850 parking spaces and the Crosley Terrace statues of Joe Nuxhall, Ernie Lombardi, Ted Kluszewski and Frank Robinson."
        },
        %{
          kind: "sight",
          name: "Cincinnati Reds Hall of Fame and Museum",
          place_slug: "cincinnati-reds-hall-of-fame-and-museum",
          note:
            "Main Street, next to the ballpark: open since September 25, 2004, with more than 15,000 square feet of exhibit space on two floors — the 1975, 1976 and 1990 World Series trophies, the 1869 Red Stockings scorebook, and Johnny Bench's and Joe Morgan's MVP trophies."
        },
        %{
          kind: "sight",
          name: "National Underground Railroad Freedom Center",
          place_slug: "national-underground-railroad-freedom-center",
          note:
            "50 E. Freedom Way: a museum of the Underground Railroad and the abolition of slavery, open to the public since August 3, 2004, sited at The Banks in reference to the Ohio River's role as a crossing point."
        },
        %{
          kind: "sight",
          name: "Smale Riverfront Park",
          place_slug: "smale-riverfront-park",
          note:
            "Along the Ohio River between Broadway and Central Avenue: over 40 acres of bike trails, boat docks, a carousel, gardens, a great lawn, playgrounds, a promenade with oversized porch swings and water features, linking Bicentennial Commons and Sawyer Point."
        },
        %{
          kind: "sight",
          name: "Findlay Market",
          place_slug: "findlay-market",
          note:
            "1801 Race Street, Over-the-Rhine: Ohio's oldest continuously operated public market, built in 1852 in early iron framework and on the National Register of Historic Places since June 5, 1972. The last remaining of nine public markets that once served Cincinnati."
        },
        %{
          kind: "food",
          name: "Cincinnati Lager House",
          place_slug: "cincinnati-lager-house",
          note:
            "115 Joe Nuxhall Way: a working microbrewery at The Banks producing a full line of Moerlein craft beers, opened in February 2012 as the Christian Moerlein Lager House — 15,000 square feet over two floors, with beer gardens seating about 500 indoors and 600 outdoors."
        },
        %{
          kind: "food",
          name: "Holy Grail",
          place_slug: "holy-grail-banks-cincinnati",
          note:
            "161 Joe Nuxhall Way: a sports bar at The Banks with 31 hi-def TVs, pub fare and outdoor patios."
        },
        %{
          kind: "food",
          name: "Taste of Belgium",
          place_slug: "taste-of-belgium-banks",
          note:
            "16 W. Freedom Way: a scratch kitchen at The Banks known for its Liege waffle and chicken, specializing in Belgian food with American influences and craft beer."
        },
        %{
          kind: "sight",
          name: "Heritage Bank Center",
          place_slug: "heritage-bank-center",
          note:
            "100 Broadway Street: an indoor arena open since September 9, 1975, seating 17,556 across 346,100 square feet, home to the Cincinnati Cyclones of the ECHL. It has carried five names: Riverfront Coliseum, The Crown, Firstar Center, U.S. Bank Arena and Heritage Bank Center."
        },
        %{
          kind: "sight",
          name: "John A. Roebling Suspension Bridge",
          place_slug: "john-a-roebling-suspension-bridge",
          note:
            "Spanning the Ohio River to Covington, Kentucky: opened to traffic on January 1, 1867 and then the longest suspension bridge in the world, at a 1,057-foot main span. Its Kentucky end gives its name to the Roebling Point bar and restaurant district."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          The streetcar is called the Connector. It was the Cincinnati Bell
          Connector until a 2022 rebrand, when Cincinnati Bell became Altafiber,
          and it runs a 3.6-mile loop from The Banks, Great American Ball Park,
          Paycor Stadium and Smale Riverfront Park through Downtown Cincinnati
          and north to Findlay Market.

          The Banks, at 2nd & Main, is the loop's southern terminus and connects
          to the Riverfront Transit Center; it serves Great American Ball Park,
          Paycor Stadium, the Freedom Center and the Brady Music Center, and the
          Connector's own route also lists Heritage Bank Center among the venues
          it reaches. The 4th & Main station connects to the Government Square
          transit hub. The streetcar has operated free of charge since November
          1, 2020, after Cincinnati city council overrode a mayoral veto to
          suspend fares permanently.

          Great American Ball Park is also served by Metro, Cincinnati's SORTA
          bus system, by TANK, the Transit Authority of Northern Kentucky, and
          by the Red Bike bike-share.

          On foot from Kentucky, the crossing is the John A. Roebling Suspension
          Bridge, which pedestrians use to reach hotels, bars and restaurants in
          Northern Kentucky.

          On parking, the record gives a count and not a price. The ballpark has
          850 parking spaces. MLB.com's own ballpark and transportation subpages
          returned HTTP 406 to automated fetch and could not be read for a cost,
          so no rate is published here and no lot is described as an official
          one.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          The Banks is the riverfront development the ballpark sits in, and most
          of what is around the ballpark is either in it or beside it.

          Two museums anchor the immediate blocks. The Cincinnati Reds Hall of
          Fame and Museum opened on September 25, 2004 and sits on Main Street
          next to the ballpark, with more than 15,000 square feet of exhibit
          space on two floors: the World Series trophies of 1975, 1976 and 1990,
          the scorebook from the 1869 Cincinnati Red Stockings, and MVP trophies
          belonging to Johnny Bench and Joe Morgan. Its exact street number
          could not be established by this research, so this guide gives the
          street and stops there. The National Underground Railroad Freedom
          Center, at 50 E. Freedom Way, opened to the public on August 3, 2004,
          with official ceremonies later that month; it is sited at The Banks in
          reference to the Ohio River's role as an Underground Railroad crossing
          point, and its exhibits include the "Suite for Freedom" theater, the
          "ESCAPE! Freedom Seekers" display, the film "Brothers of the
          Borderland", the John Parker Library and a quilt titled "Crossing to
          Freedom".

          Smale Riverfront Park runs along the Ohio River between Broadway and
          Central Avenue: over 40 acres of bike trails, boat docks, a carousel,
          gardens, grand stairs, a great lawn, playgrounds, a river's edge
          promenade with oversized porch swings, tree groves, walkways and water
          features. It connects Bicentennial Commons and Sawyer Point into an
          almost 3-mile corridor of public park, and it holds a historical
          marker showing where home plate of the former Riverfront Stadium
          stood.

          Three tenants of The Banks serve food and drink. The Cincinnati Lager
          House, at 115 Joe Nuxhall Way, is a working microbrewery producing a
          full line of Moerlein craft beers; it opened in February 2012 as the
          Christian Moerlein Lager House, a 15,000-square-foot, two-story
          building with beer gardens seating about 500 indoors and 600 outdoors.
          The brewing company behind the name was founded in 1853 in
          Over-the-Rhine by the Bavarian immigrant Christian Moerlein, grew into
          one of the country's ten largest breweries, closed in 1919 under
          Prohibition, was revived as a brand in 1981 and relaunched under new
          ownership in 2004. Holy Grail, at 161 Joe Nuxhall Way, is a sports bar
          with 31 hi-def TVs, pub fare and outdoor patios. Taste of Belgium, at
          16 W. Freedom Way, is a scratch kitchen known for its Liege waffle and
          chicken, specializing in Belgian food with American influences and
          craft beer; The Banks' tenant page reports a Food Network Diners,
          Drive-Ins and Dives feature and a "Best Brunch 2016" award from
          CityBeat Magazine, neither of which this research could confirm at its
          primary source.

          Two landmarks complete the riverfront. Heritage Bank Center, at 100
          Broadway Street, is an indoor arena that opened on September 9, 1975
          and has since carried five names — Riverfront Coliseum, The Crown,
          Firstar Center, U.S. Bank Arena and Heritage Bank Center. It seats
          17,556 across 346,100 square feet, is the largest indoor arena in the
          Greater Cincinnati region, and is home to the Cincinnati Cyclones of
          the ECHL, alongside college basketball, concerts, wrestling, MMA and
          figure skating. The John A. Roebling Suspension Bridge crosses the
          Ohio River to Covington, Kentucky; it opened to traffic on January 1,
          1867 and was then the longest suspension bridge in the world, at a
          1,057-foot main span.

          Further from the river, Findlay Market stands at 1801 Race Street in
          the Over-the-Rhine neighborhood north of downtown, at the far end of
          the Connector's loop. It is Ohio's oldest continuously operated public
          market, built in 1852 in early iron framework, listed on the National
          Register of Historic Places on June 5, 1972, and the last remaining of
          the nine public markets that once served Cincinnati. Its own site
          publishes hours of Tuesday to Friday 9am to 6pm, Saturday 8am to 6pm
          and Sunday 10am to 4pm, closed Monday, with a weekend farmers market;
          those hours come from the market itself and were not independently
          confirmed for 2026.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Great American Ball Park opened on March 31, 2003, replacing
          Riverfront Stadium — later Cinergy Field — which the Reds and the
          Bengals had shared before the two clubs sought separate venues. HOK
          Sport, now Populous, and GBBN built it at a cost of approximately $290
          million. Current seating capacity is 43,500, as of 2021, and the
          ballpark has 850 parking spaces.

          Crosley Terrace, the plaza at the ballpark, carries bronze statues of
          four Crosley Field-era players: Joe Nuxhall, Ernie Lombardi, Ted
          Kluszewski and Frank Robinson. The predecessor stadium is marked too,
          in Smale Riverfront Park, where a historical marker shows the position
          of Riverfront Stadium's home plate.

          The Cincinnati Reds franchise was established in 1881 and was a
          charter member of the American Association in 1882 before joining the
          National League in 1890. It competes today in the National League
          Central Division and has won five World Series titles: 1919, 1940,
          1975, 1976 and 1990. Three of those trophies are on display at the
          Reds Hall of Fame and Museum on Main Street, along with the scorebook
          from the 1869 Cincinnati Red Stockings.
          """
        }
      ],
      faq: [
        %{
          "question" => "What is the streetcar to the ballpark called?",
          "answer" =>
            "The Connector. It was the Cincinnati Bell Connector until 2022, when the system was renamed after Cincinnati Bell rebranded to Altafiber, and the older name is the one recollection tends to produce. It runs a 3.6-mile loop from The Banks, Great American Ball Park, Paycor Stadium and Smale Riverfront Park through Downtown Cincinnati and north to Findlay Market, and it has operated free of charge since November 1, 2020, after city council overrode a mayoral veto to suspend fares permanently."
        },
        %{
          "question" => "Which buses and bikes serve the ballpark?",
          "answer" =>
            "Great American Ball Park is served by Metro, Cincinnati's SORTA bus system, by TANK, the Transit Authority of Northern Kentucky, and by the Red Bike bike-share. The Banks station, at 2nd & Main, is the streetcar's southern terminus and connects to the Riverfront Transit Center; the 4th & Main station connects to the Government Square transit hub."
        },
        %{
          "question" => "What does parking cost at the ballpark?",
          "answer" =>
            "No source fetched for this guide states a price. The ballpark has 850 parking spaces, which is a confirmed count, but MLB.com's own ballpark and transportation subpages returned HTTP 406 to automated fetch and could not be read for a cost. No rate is published here and no lot is described as an official one."
        },
        %{
          "question" => "Why is the brewpub at The Banks called the Cincinnati Lager House?",
          "answer" =>
            "Because that is the name The Banks' 2026 directory and tenant page give it. It was previously the Christian Moerlein Lager House and then the Moerlein Lager House, and the landlord's own page URL still carries the string \"moerlein-lager-house\", which is why the older name persists in search results. The exact date of the rename could not be established by this research."
        },
        %{
          "question" => "Where is the Reds Hall of Fame and Museum exactly?",
          "answer" =>
            "On Main Street, next to Great American Ball Park. The exact street number could not be established from any source fetched for this research, so this guide publishes the street and does not infer a number. Its current hours could not be established either."
        },
        %{
          "question" => "Is Heritage Bank Center part of The Banks?",
          "answer" =>
            "No. The research first claimed the arena was listed in The Banks development's directory; a targeted re-fetch of that directory found no mention of Heritage Bank Center, Heritage Bank, any arena or the Cyclones — the directory lists Great American Ball Park and Paycor Stadium as sports venues and stops there. The arena sits nearby but outside The Banks development proper, and what is confirmed instead is that the Connector's route lists it among the venues The Banks station serves."
        }
      ],
      photos: []
    }
  end
end
