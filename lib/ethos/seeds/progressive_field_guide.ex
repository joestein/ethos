defmodule Ethos.Seeds.ProgressiveFieldGuide do
  @moduledoc """
  Seeds the Progressive Field guide. Idempotent by slug.

  Carries `state: "Ohio"` and `county: "Cuyahoga County"`, so it lists on both
  the Ohio destination page and the Cuyahoga County one. The county comes from
  the verdict, and two confirmed verdicts carry it: the identity verdict placing
  the Guardians at *"2401 Ontario Street, Cleveland, Ohio, Cuyahoga County"*,
  and a second stating that *"Cleveland is the county seat and most populous
  city of Cuyahoga County, Ohio"*, cited to the Cuyahoga County article that
  contains it.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Cleveland Guardians research artifact, or the text the one
  `refuted` verdict's correction names as publishable.
  `docs/ballparks/progressive-field.md` quotes each published sentence against
  the verdict it rests on and records each omission.

  What was dropped, and why:

    * **No parking price.** A `could_not_establish` records that
      `mlb.com/guardians/ballpark/directions` and `/transportation` both
      returned HTTP 406 and could not be read. The Gateway complex's two
      garages and their combined capacity of about 3,300 vehicles are a
      confirmed count, and no rate is published here.

    * **No "best in Major League Baseball history".** The 1954 team's 111-43
      record is the best regular-season record *since the 1909 Pittsburgh
      Pirates*, which is what the source says and what the correction supplies.

    * **No trading claim for three of the eight places**, and no self-sourced
      superlative for The Corner Alley.

    * **No journey figure alongside Flannery's Pub's mileage.** The pub's own
      site publishes both; the finder took the miles and left the rest, and the
      verifier recorded that as correct. Because the ban is enforced by a scan
      over module source, this moduledoc cannot restate the omitted clause
      verbatim — only that it was omitted.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: no station, no garage and no bus route becomes a
  page.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "progressive-field-guide",
      title: "Progressive Field: The Ballpark and Downtown Cleveland Around It",
      destination: "Cleveland, Ohio",
      state: "Ohio",
      county: "Cuyahoga County",
      intro: """
      Progressive Field stands at 2401 Ontario Street in downtown Cleveland, in
      Cuyahoga County, as part of the Gateway Sports and Entertainment Complex.
      It opened on April 4, 1994 as Jacobs Field and took its current name in
      2008; the Cleveland Guardians play there.

      This guide takes the ballpark first, then the museums, music venue, bars
      and bridge around it, and then the team's own record. Research for it was
      carried out from named sources fetched directly: English Wikipedia, the
      businesses' own sites, an independent ballpark directory, and RTA and
      HealthLine route articles. Three of the eight places rest on their own
      websites alone, and this guide does not say those three are trading.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Progressive Field",
          place_slug: "progressive-field",
          note:
            "2401 Ontario Street: the Guardians' home ballpark, open since April 4, 1994 as Jacobs Field and renamed in 2008. Capacity 34,820 as of 2025, the smallest of any MLB stadium by total maximum capacity, with the 19-foot \"Little Green Monster\" in left field and Heritage Park behind center."
        },
        %{
          kind: "sight",
          name: "Rock and Roll Hall of Fame",
          place_slug: "rock-and-roll-hall-of-fame",
          note:
            "1100 Rock and Roll Boulevard, on East 9th Street at Lake Erie: dedicated September 1, 1995, in an I. M. Pei building with a 162-foot tower and a glass tent over about 55,000 square feet of exhibition space across seven levels."
        },
        %{
          kind: "sight",
          name: "Great Lakes Science Center",
          place_slug: "great-lakes-science-center",
          note:
            "601 Erieside Avenue, at North Coast Harbor: open since July 1996, with STEM exhibits, the 300-seat Cleveland Clinic Dome Theater and the NASA Glenn Visitor Center, one of only 11 such centers nationally."
        },
        %{
          kind: "sight",
          name: "House of Blues Cleveland",
          place_slug: "house-of-blues-cleveland",
          note:
            "308 Euclid Avenue: a music venue open since 2004 with a capacity of 1,300, listed among the chain's 11 currently operating North American locations."
        },
        %{
          kind: "food",
          name: "The Corner Alley",
          place_slug: "the-corner-alley-cleveland",
          note:
            "402 Euclid Avenue, on East 4th Street: 16 bowling lanes with a bar and dining, on the pedestrian street that runs from Euclid Avenue to Prospect Avenue and directly adjoins the Gateway complex."
        },
        %{
          kind: "food",
          name: "Pickwick & Frolic",
          place_slug: "pickwick-and-frolic",
          note:
            "2035 East 4th Street: a restaurant and entertainment complex seating 185 diners, serving American Rustic Cuisine with wood-fired entrees, and holding Kevin's Martini Bar and the Hilarities 4th Street Theatre comedy club."
        },
        %{
          kind: "food",
          name: "Flannery's Pub",
          place_slug: "flannerys-pub",
          note:
            "323 Prospect Avenue: an Irish pub founded in 1997 by Denis Flannery, serving fish and chips, Reubens, Irish stew and bangers and mash alongside a full bar with draft Guinness. Its own site puts it about 0.4 miles from the ballpark."
        },
        %{
          kind: "sight",
          name: "Hope Memorial Bridge",
          place_slug: "hope-memorial-bridge",
          note:
            "Carrying Lorain Avenue and Carnegie Avenue over the Cuyahoga River: a 4,490-foot Art Deco truss bridge built 1927-1932, whose eight Guardians of Traffic statues gave the baseball club its 2021 name."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Tower City station is the central hub of Cleveland's RTA Rapid Transit
          system, and all four lines call there: the Red Line between the
          airport and Windermere, the Blue Line to Warrensville-Van Aken, the
          Green Line to Green Road and the Waterfront Line to South Harbor. The
          station is at 230 West Huron Road and is reachable only through the
          Tower City Center shopping mall.

          From there the connection to the ballpark is indoors. Tower City
          station has a completely enclosed, air-conditioned skyway to the arena
          and to Progressive Field, so transit riders can reach either without
          going outside. The Gateway Sports and Entertainment Complex also
          connects to Tower City Center and the RTA Rapid Transit by an
          underground walkway. The complex is roughly bounded by East 9th Street
          to the east, Huron Road to the north, Ontario Street to the west and
          Carnegie Avenue to the south.

          The HealthLine bus rapid transit route runs along Euclid Avenue from
          Public Square, with stops at Public Square/West Roadway and Public
          Square/Tower City, through downtown Cleveland, with further downtown
          stops at East 2nd, East 6th, East 9th, East 14th and East 19th
          streets, and continues to the Louis Stokes Station at Windermere in
          East Cleveland. No stop directly at East 4th Street or at the Gateway
          complex is documented in the source consulted, and none is claimed
          here.

          On parking, the record gives a count and not a price. The Gateway
          complex includes two parking garages with a combined capacity of about
          3,300 vehicles. MLB.com's own directions and transportation pages for
          the ballpark both returned HTTP 406 and could not be read, so no rate
          is published here and no lot is described as an official one.

          One naming note, because the sources disagree and this guide does not
          pick silently: the arena the skyway also reaches is called Rocket
          Arena in the transit source and Rocket Mortgage FieldHouse on
          Flannery's Pub's own site. Both names appear here, each where its own
          source used it.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          East 4th Street is the block that touches the ballpark. It is a
          pedestrian entertainment street running from Euclid Avenue to Prospect
          Avenue, and an independent source states that it directly adjoins the
          Gateway Sports and Entertainment Complex. The Corner Alley, at 402
          Euclid Avenue, has 16 bowling lanes with a bar and dining, and posts
          hours of Sunday to Thursday 11:30 am to 12:00 am — kitchen closing at
          11:00 pm — and Friday to Saturday 11:30 am to 1:00 am, with entry
          restricted to over-21s after 10:00 pm. Pickwick & Frolic, at 2035 East
          4th Street, is a restaurant and entertainment complex seating 185
          diners, serving what its site calls American Rustic Cuisine with
          wood-fired entrees, and holding Kevin's Martini Bar and the Hilarities
          4th Street Theatre comedy club.

          Flannery's Pub is at 323 Prospect Avenue, founded in 1997 by Denis
          Flannery, with Irish pub fare — fish and chips, Reubens, Irish stew,
          bangers and mash — and a full bar with draft Guinness. Its own site
          puts it about 0.4 miles from Progressive Field and about 0.1 miles
          from Rocket Mortgage FieldHouse. Those are the only distances in this
          guide, and they are the source's own, in miles.

          Euclid Avenue carries the music. House of Blues Cleveland, at 308
          Euclid Avenue, opened in 2004 with a capacity of 1,300 and appears
          among the chain's 11 currently operating North American locations.

          The lakefront carries the museums. The Rock and Roll Hall of Fame is
          at 1100 Rock and Roll Boulevard, on East 9th Street at Lake Erie; it
          was dedicated on September 1, 1995, although the founding foundation
          dates to April 20, 1983, and Cleveland was chosen as the permanent
          home in 1986 on the strength of the city's connection to the disc
          jockey Alan Freed, who promoted rock and roll and hosted the Moondog
          Coronation Ball there. I. M. Pei designed the building, with a
          162-foot tower supporting a dual-triangular glass tent over about
          55,000 square feet of exhibition space across seven levels. The Great
          Lakes Science Center is at 601 Erieside Avenue, at North Coast Harbor,
          open since July 1996, with signature and traveling STEM exhibits, a
          cafe, the 79-foot, 300-seat Cleveland Clinic Dome Theater — updated
          with laser projection in 2016 — and the NASA Glenn Visitor Center, one
          of only 11 such centers nationally. It is partially funded by the
          citizens of Cuyahoga County through Cuyahoga Arts and Culture, and it
          opened its Cleveland Creates Gallery in February 2024 and a children's
          gallery, Handle With Care, in September 2025.

          The Hope Memorial Bridge carries Lorain Avenue and Carnegie Avenue
          over the Cuyahoga River, joining the west side to the east side. It is
          a 4,490-foot Art Deco
          truss bridge, also called the Lorain-Carnegie Bridge, built between
          1927 and 1932 at a cost of $4.75 million, and it terminates just short
          of Progressive Field. Its eight Guardians of Traffic statues were
          sculpted by Henry Hering to the architect Frank Walker's design and
          carved of Berea Sandstone in Cleveland's Little Italy neighborhood;
          each holds a different vehicle, among them a hay wagon, a covered
          wagon, a stagecoach and a 1930s-era automobile.

          One thing to know about the record behind the bars. The Corner Alley,
          Pickwick & Frolic and Flannery's Pub each rest on their own website
          alone: the verification agreed that a business's own site can
          establish what it is, what it offers and where it is, but not that it
          is trading now. So this guide does not say those three are open. It
          does not say they have closed either: there is no evidence of that,
          and none should be inferred. Telephone first.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Progressive Field opened on April 4, 1994 as part of the Gateway
          Sports and Entertainment Complex, at a cost of about $175 million. The
          team owner Richard E. Jacobs contributed $91 million; the rest came
          from a 15-year "sin tax" that Cuyahoga County voters approved by a 51%
          margin in a May 1990 ballot issue, after earlier stadium funding
          initiatives had failed. The complex itself is owned by the City of
          Cleveland and Cuyahoga County and managed by the Gateway Economic
          Development Corporation.

          Populous — then HOK Sport, a division of Hellmuth, Obata and
          Kassabaum — designed the ballpark, which is described as the second
          retro-style and the first retro-modern ballpark, following the model
          of Oriole Park at Camden Yards. It opened as Jacobs Field and was
          renamed Progressive Field in 2008 under a naming-rights deal with the
          Progressive Corporation, extended on April 3, 2024 through at least
          2036 with an option to 2041.

          As of 2025 the official seating capacity is 34,820, the smallest of
          any MLB stadium by total maximum capacity. The left-field wall is 19
          feet high and nicknamed the "Little Green Monster"; 19 white vertical
          light towers stand 200 feet above street level; the Daktronics
          scoreboard is 59 feet high by 221 feet wide; and Heritage Park, added
          behind center field in 2007, carries 27 plaques honoring the Cleveland
          Indians Hall of Fame and 38 bricks marking the team's most memorable
          moments. Renovations from 2014 to 2016 relocated the bullpens and
          added new statuary, a bar called "The Corner" and enhanced
          concessions; a new scoreboard system followed in 2016 and LED field
          lights in 2017; and a further $200 million renovation project ran from
          2023 to 2025.

          The franchise was established in 1901 as a founding member of the
          American League and played under several names before Indians:
          Bluebirds in 1901, Bronchos in 1902, and Naps or Napoleons from 1903
          to 1914. It was the Cleveland Indians from 1915 through 2021 and
          became the Cleveland Guardians for the 2022 season, taking the name
          from the Guardians of Traffic statues on the Hope Memorial Bridge.

          The club has won two World Series championships, in 1920 and 1948, and
          reached the World Series without winning in 1954, 1995, 1997 and 2016.
          Its 1954 team went 111-43, which remains the best Major League
          Baseball regular-season record since the 1909 Pittsburgh Pirates,
          during a run of ten straight winning seasons from 1947 to 1956. Under
          the manager Terry Francona, hired in 2013, the club had eight
          consecutive winning seasons from 2013 to 2020 with multiple playoff
          appearances.
          """
        }
      ],
      faq: [
        %{
          "question" => "How do you reach Progressive Field on public transit?",
          "answer" =>
            "Through Tower City station, the central hub of Cleveland's RTA Rapid Transit system, at 230 West Huron Road. All four lines call there — the Red Line between the airport and Windermere, the Blue Line to Warrensville-Van Aken, the Green Line to Green Road and the Waterfront Line to South Harbor — and the station is reachable only through the Tower City Center shopping mall. A completely enclosed, air-conditioned skyway runs from the station to the arena and to Progressive Field, and the Gateway complex also connects to Tower City Center by an underground walkway."
        },
        %{
          "question" => "Does the HealthLine stop at the ballpark?",
          "answer" =>
            "Not according to the source consulted. The HealthLine bus rapid transit route runs along Euclid Avenue from Public Square through downtown, with stops at East 2nd, East 6th, East 9th, East 14th and East 19th streets, continuing to the Louis Stokes Station at Windermere in East Cleveland. No stop directly at East 4th Street or at the Gateway complex is documented there, so none is claimed here."
        },
        %{
          "question" => "What does parking cost at Progressive Field?",
          "answer" =>
            "No source fetched for this guide states a price. The Gateway Sports and Entertainment Complex includes two parking garages with a combined capacity of about 3,300 vehicles, which is a confirmed count, but MLB.com's own directions and transportation pages for the ballpark both returned HTTP 406 and could not be read. No rate is published here."
        },
        %{
          "question" => "Was the 1954 Cleveland team's record the best in baseball history?",
          "answer" =>
            "No, and the research's first draft said so before verification caught it. The 1954 team went 111-43, which remains the best Major League Baseball regular-season record since the 1909 Pittsburgh Pirates — meaning the 1909 Pirates already held a better one, 45 years earlier. The claim that it was the best in MLB history is contradicted by the very source the research cited for it."
        },
        %{
          "question" => "Why are the Guardians called the Guardians?",
          "answer" =>
            "After the Guardians of Traffic: eight monumental statues on the pylons of the Hope Memorial Bridge, which carries Lorain Avenue and Carnegie Avenue over the Cuyahoga River and terminates just short of Progressive Field. Henry Hering sculpted them to the architect Frank Walker's design, and they were carved of Berea Sandstone in Cleveland's Little Italy neighborhood. The club was the Cleveland Indians from 1915 through 2021 and took the new name for the 2022 season."
        },
        %{
          "question" => "Why does this guide not say whether the bars are open?",
          "answer" =>
            "Because the evidence does not reach that far for three of them. The Corner Alley, Pickwick & Frolic and Flannery's Pub each rest on their own website alone, and the verification agreed with the research that a business's own site can establish what it is, what it offers and where it is, but not that it is trading now. None of that is evidence of closure, and none is stated as such. The ballpark, the Rock and Roll Hall of Fame, the Great Lakes Science Center and House of Blues Cleveland each have independent, dated evidence of current operation."
        }
      ],
      photos: []
    }
  end
end
