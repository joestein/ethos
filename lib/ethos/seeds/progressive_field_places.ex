defmodule Ethos.Seeds.ProgressiveFieldPlaces do
  @moduledoc """
  Seeds the places for the Progressive Field guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Cleveland Guardians research artifact, or the text a `refuted`
  verdict's correction names as publishable. A verdict vouches only for what its
  own `item` text restates, not for every clause of the sentence the finder
  wrote around it. `docs/ballparks/progressive-field.md` quotes each published
  sentence against the verdict it rests on, and records every omission.

  This artifact confirmed at a rate the verifier itself called untypical — one
  refutation across the whole set — and its note explains why: the finder cited
  narrowly, one fact per source visit, and used `could_not_establish` where the
  evidence ran out. The single miss is instructive and is recorded below.

  What the verification changed, and what is therefore absent here:

    * **The 1954 record is not "the best in Major League Baseball history".**
      The finder's own cited source contradicts it: the 111-43 mark *"remains
      the best Major League Baseball regular season record since the 1909
      Pirates"*, which means it was never the best in MLB history, then or now.
      The correction's wording is what the guide carries. The verifier's phrase
      for the failure is worth keeping: a superlative that grew between the
      source and the sentence.

    * **No self-sourced superlative for The Corner Alley.** Its own site calls
      it "Cleveland's Premier Bowling Alley & Sports Bar Experience". The
      verdict confirms that item only as far as a business's own site can
      establish — existence, offering and address — so the offering ships and
      the ranking does not.

    * **No trading claim for three of the eight places.** The Corner Alley,
      Pickwick & Frolic and Flannery's Pub each rest on their own site alone;
      each `status_verdict` confirms the finder's *uncertain* call rather than
      upgrading it. Uncertain is not closed: no closure has positive evidence
      and none is asserted.

  The one distance published between a business and the ballpark is the
  source's own, in miles, and the verifier approved it explicitly as a sourced
  distance rather than a gesture. The same page states journey figures
  alongside that mileage; those are barred by docs/site-builder.md §8 and were
  left out by the finder before they ever reached a verdict.
  """

  alias Ethos.Places

  @cleveland %{destination_path: "united-states/ohio/cleveland"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@cleveland, %{
        slug: "progressive-field",
        name: "Progressive Field",
        kind: "stadium",
        address: "2401 Ontario Street, Cleveland, OH 44115",
        official_url: "https://www.mlb.com/guardians/ballpark",
        summary:
          "The home ballpark of the Cleveland Guardians, at 2401 Ontario Street in Cuyahoga County. It opened on April 4, 1994 as Jacobs Field and was renamed Progressive Field in 2008 under a naming-rights deal with the Progressive Corporation, extended on April 3, 2024 through at least 2036 with an option to 2041. As of 2025 the official seating capacity is 34,820, the smallest of any MLB stadium by total maximum capacity. An independent ballpark directory gives the same street address for driving directions.",
        history:
          "Progressive Field opened as part of the Gateway Sports and Entertainment Complex at a cost of about $175 million. The team owner Richard E. Jacobs contributed $91 million, and the remainder was funded by a 15-year \"sin tax\" that Cuyahoga County voters approved by a 51% margin in a May 1990 ballot issue, after earlier stadium funding initiatives had failed. Populous, then HOK Sport, a division of Hellmuth, Obata and Kassabaum, designed it, and it is described as the second retro-style and the first retro-modern ballpark, following the model of Oriole Park at Camden Yards. Its features include a 19-foot left-field wall nicknamed the \"Little Green Monster\", 19 white vertical light towers standing 200 feet above street level, a Daktronics scoreboard 59 feet high by 221 feet wide, and Heritage Park, added behind center field in 2007 with 27 plaques honoring the Cleveland Indians Hall of Fame and 38 bricks marking the team's most memorable moments. Renovations in 2014 to 2016 relocated the bullpens and added new statuary, a bar called \"The Corner\" and enhanced concessions; a new scoreboard system followed in 2016 and LED field lights in 2017; and a further $200 million renovation project ran from 2023 to 2025.",
        photos: []
      }),
      Map.merge(@cleveland, %{
        slug: "rock-and-roll-hall-of-fame",
        name: "Rock and Roll Hall of Fame",
        kind: "museum",
        address: "1100 Rock and Roll Boulevard, Cleveland, OH 44114",
        official_url: "https://www.rockhall.com/",
        summary:
          "A museum at 1100 Rock and Roll Boulevard, on East 9th Street at Lake Erie. It was dedicated on September 1, 1995, though the founding foundation dates to April 20, 1983. Cleveland was chosen as the permanent home in 1986, influenced by the city's connection to the disc jockey Alan Freed, who promoted rock and roll and hosted the Moondog Coronation Ball there.",
        history:
          "The building was designed by the architect I. M. Pei and features a 162-foot tower supporting a dual-triangular-shaped glass \"tent\", with about 55,000 square feet of exhibition space across seven levels.",
        photos: []
      }),
      Map.merge(@cleveland, %{
        slug: "great-lakes-science-center",
        name: "Great Lakes Science Center",
        kind: "museum",
        address: "601 Erieside Avenue, Cleveland, OH 44114",
        official_url: "https://www.greatscience.com/",
        summary:
          "A science museum at 601 Erieside Avenue, at North Coast Harbor in downtown Cleveland, which opened in July 1996. It houses signature and traveling STEM exhibits, a cafe, and the Cleveland Clinic Dome Theater — a 79-foot, 300-seat theater updated with laser projection in 2016 — plus the NASA Glenn Visitor Center, one of only 11 such centers nationally.",
        history:
          "The center is partially funded by the citizens of Cuyahoga County through Cuyahoga Arts and Culture. Its Cleveland Creates Gallery opened in February 2024, and a children's gallery, Handle With Care, opened in September 2025.",
        photos: []
      }),
      Map.merge(@cleveland, %{
        slug: "house-of-blues-cleveland",
        name: "House of Blues Cleveland",
        kind: "theater",
        address: "308 Euclid Avenue, Cleveland, OH 44114",
        official_url: "https://www.houseofblues.com/cleveland",
        summary:
          "A music venue at 308 Euclid Avenue that opened in 2004 with a capacity of 1,300. It is listed among the chain's 11 currently operating North American locations.",
        history: nil,
        photos: []
      }),
      Map.merge(@cleveland, %{
        slug: "the-corner-alley-cleveland",
        name: "The Corner Alley",
        kind: "restaurant",
        address: "402 Euclid Avenue, Cleveland, OH 44114",
        official_url: "https://thecorneralley.com/",
        summary:
          "A bowling alley and sports bar at 402 Euclid Avenue, on East 4th Street in downtown Cleveland, with 16 bowling lanes, a bar and dining. Its own site posts hours of Sunday to Thursday 11:30 am to 12:00 am, with the kitchen closing at 11:00 pm, and Friday to Saturday 11:30 am to 1:00 am, with the kitchen closing at 12:00 am; entry is restricted to over-21s after 10:00 pm. East 4th Street runs from Euclid Avenue to Prospect Avenue and directly adjoins the Gateway Sports and Entertainment Complex. No founding date or history was stated on any page reached, and the business's own site is the only source for its current operation.",
        history: nil,
        photos: []
      }),
      Map.merge(@cleveland, %{
        slug: "pickwick-and-frolic",
        name: "Pickwick & Frolic",
        kind: "restaurant",
        address: "2035 East 4th Street, Cleveland, OH 44115",
        official_url: "https://www.pickwickandfrolic.com/",
        summary:
          "A restaurant and entertainment complex at 2035 East 4th Street that also includes Kevin's Martini Bar and Hilarities 4th Street Theatre, a comedy club. Its own site describes the restaurant as serving \"American Rustic Cuisine\" with wood-fired entrees, seating 185 diners. East 4th Street directly adjoins the Gateway Sports and Entertainment Complex. The site references long operation with experienced staff but gives no founding year, and it is the only source for the business's current operation.",
        history: nil,
        photos: []
      }),
      Map.merge(@cleveland, %{
        slug: "flannerys-pub",
        name: "Flannery's Pub",
        kind: "restaurant",
        address: "323 Prospect Avenue, Cleveland, OH",
        official_url: "https://flannerys.com/",
        summary:
          "An Irish pub at 323 Prospect Avenue, founded in 1997 by Denis Flannery, serving Irish pub fare — fish and chips, Reubens, Irish stew, bangers and mash — alongside a full bar with draft Guinness. The pub's own site states that it is about 0.4 miles from Progressive Field and about 0.1 miles from Rocket Mortgage FieldHouse. That site is the only source reached for the pub, and a long stated operating history is not evidence of current trading.",
        history: nil,
        photos: []
      }),
      Map.merge(@cleveland, %{
        slug: "hope-memorial-bridge",
        name: "Hope Memorial Bridge",
        kind: "historic-site",
        address:
          "Carries Lorain Avenue and Carnegie Avenue over the Cuyahoga River, Cleveland, OH",
        official_url: nil,
        summary:
          "A 4,490-foot Art Deco truss bridge over the Cuyahoga River, also called the Lorain-Carnegie Bridge, connecting Lorain Avenue on the west side to Carnegie Avenue on the east side. Construction ran from 1927 to 1932 at a cost of $4.75 million. The bridge terminates just short of Progressive Field.",
        history:
          "Eight monumental statues called the Guardians of Traffic adorn the bridge's pylons. Henry Hering sculpted them to the architect Frank Walker's design, and they were carved of Berea Sandstone in Cleveland's Little Italy neighborhood; each holds a different vehicle — a hay wagon, a covered wagon, a stagecoach, a 1930s-era automobile. The sculptures directly inspired the Cleveland Guardians' 2021 name change.",
        photos: []
      })
    ]
  end
end
