defmodule Ethos.Seeds.OrioleParkAtCamdenYardsGuide do
  @moduledoc """
  Seeds the Oriole Park at Camden Yards guide. Idempotent by slug.

  Carries `state: "Maryland"` and `county: "Baltimore City"` — the plain form
  the jurisdiction names itself by, with the independent-city explanation moved
  into prose where it belongs, exactly as the verifier's own note recommends.
  Baltimore has not been under any county's jurisdiction since 1851.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Baltimore Orioles research artifact, or the text a `refuted`
  verdict's correction supplies.
  `docs/ballparks/oriole-park-at-camden-yards.md` quotes each published
  sentence against the verdict it rests on.

  What was dropped, and why:

    * **Every liquor-licence fact.** Eight claims were cited to a Baltimore
      City ArcGIS endpoint that the verifier fetched twice and found to be a
      schema page holding no licence records at all. All eight are refuted as
      citations, and the trading statuses that rested on them are downgraded.

    * **Three MARC Camden Line stations that are not on it.** The finder's
      station list was refuted; the correction supplies the real one and
      instructs that Bowie State, Rockville and Silver Spring be removed and
      Odenton treated as unconfirmed. The corrected list is what the guide
      carries, Odenton included out.

    * **The parking operator's name and phone number.** Refuted, with the
      correction to state only that the Maryland Stadium Authority's own page
      notes availability changes on game days without naming lots or rates.

    * **Pickles Pub's 1988 founding date as a fact.** Uncertain; recorded as
      the business's own uncorroborated statement.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8. Camden Station is prose, not a page, even though
  its history is one of the richest things in this artifact.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "oriole-park-at-camden-yards-guide",
      title: "Oriole Park at Camden Yards: The Ballpark and Downtown Baltimore",
      destination: "Baltimore, Maryland",
      state: "Maryland",
      county: "Baltimore City",
      intro: """
      Oriole Park at Camden Yards stands at 333 W. Camden Street in Baltimore.
      It opened on April 6, 1992 on the site of the Baltimore and Ohio
      Railroad's Camden Station rail yard, holds 42,455 as of 2026, and
      pioneered the retro-classic ballpark design that intentionally contrasted
      with the symmetrical multipurpose stadiums of the preceding era. Its
      most-photographed feature is a building it did not build: the eight-story
      B&O Warehouse behind right field, which the design kept rather than
      demolished.

      This guide takes the ballpark and its warehouse first, then the
      neighborhood Babe Ruth was born in, then two public markets, a theatre,
      a casino, a bar, an ale house and a park on the Inner Harbor. Research
      was carried out with web search unavailable from the first query onward,
      from named sources fetched directly. One discovery source failed
      verification outright — the city licence layer the finder cited turned
      out to hold no records — so every claim that rested on it is gone, and
      six of these eleven places carry no statement about whether they are
      trading now.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Oriole Park at Camden Yards",
          place_slug: "oriole-park-at-camden-yards",
          note:
            "333 W. Camden Street: the Orioles' home ballpark, opened April 6, 1992, capacity 42,455 as of 2026. Designed by HOK Sport, now Populous, in a retro-classic style, keeping the 1899-1905 B&O Warehouse behind right field."
        },
        %{
          kind: "sight",
          name: "Babe Ruth Birthplace & Museum",
          place_slug: "babe-ruth-birthplace-and-museum",
          note:
            "216 Emory Street: the row house where Babe Ruth was born on February 6, 1895, opened as a museum in July 1974 and the official museum of the Orioles since 1983. The ball from Camden Yards' first home run was donated to it in 1992."
        },
        %{
          kind: "sight",
          name: "Ridgely's Delight Historic District",
          place_slug: "ridgelys-delight-historic-district",
          note:
            "Russell and Greene Streets to West Pratt Street and Martin Luther King Jr. Boulevard: 24 acres surveyed in 1732 for Charles Ridgely, its rowhouses built from 1823 in Italianate, Federal and Late Federal styles. On the National Register since June 6, 1980."
        },
        %{
          kind: "sight",
          name: "Horseshoe Baltimore",
          place_slug: "horseshoe-baltimore",
          note:
            "1525 Russell Street, adjacent to M&T Bank Stadium and Oriole Park: a casino with a 122,000-square-foot gaming floor and a World Series of Poker room, opened August 26, 2014, owned and operated by CBAC Gaming, a consortium led by Caesars Entertainment."
        },
        %{
          kind: "food",
          name: "Pickles Pub",
          place_slug: "pickles-pub",
          note:
            "520 Washington Blvd: a sports bar its own site describes as drawing Orioles and Ravens gameday crowds. The 1988 founding date it states has no independent corroboration and is not published as a fact."
        },
        %{
          kind: "sight",
          name: "Lexington Market",
          place_slug: "lexington-market",
          note:
            "112 N Eutaw Street: established 1782 on land donated by General John Eager Howard, and one of the longest-running public markets in the nation. Its 1871 shed burned in 1949; a 60,000-square-foot replacement housing 50 merchants was completed in 2022."
        },
        %{
          kind: "food",
          name: "Faidley's Seafood",
          place_slug: "faidleys-seafood",
          note:
            "Inside Lexington Market: founded 1886 by John W. Faidley Sr. in two wooden sheds there, and a family operation since. As of 2024 Nancy Devine and her husband Bill, descendants of the founder, own and operate it."
        },
        %{
          kind: "sight",
          name: "Hippodrome Theatre",
          place_slug: "hippodrome-theatre-baltimore",
          note:
            "12 N. Eutaw Street: a 2,300-seat vaudeville and movie palace of 1914 by Thomas W. Lamb, in the Beaux Arts style, the largest theatre in the United States south of Philadelphia at its debut. On the National Register since January 14, 2000 and reopened in 2004 within the France-Merrick Performing Arts Center."
        },
        %{
          kind: "food",
          name: "Pratt Street Ale House",
          place_slug: "pratt-street-ale-house",
          note:
            "206 W Pratt St. The operator's own site gives the name and the address and nothing else, and no independent source with a founding year or history was found."
        },
        %{
          kind: "sight",
          name: "Federal Hill Park",
          place_slug: "federal-hill-park",
          note:
            "Francis Scott Key Highway to Covington Street: 10.3 acres on the Inner Harbor, called John Smith's Hill until Maryland's 1788 ratification celebration, used militarily in the War of 1812 and the Civil War, and city property since 1880."
        },
        %{
          kind: "sight",
          name: "Cross Street Market",
          place_slug: "cross-street-market",
          note:
            "1065 S Charles Street: a 19th-century marketplace in Federal Hill spanning Cross Street between Light and Charles, scene of the Cross Street Market Hall riot of September 8, 1876, redeveloped for $8.4 million by spring 2019."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Camden Station, at 301 West Camden Street and adjacent to the
          ballpark, is served by both the Baltimore Light RailLink and MARC's
          Camden Line commuter rail to Washington, D.C.

          The Camden Line's stations are Camden Station, St. Denis, Dorsey,
          Jessup, Savage, Laurel Race Track, Laurel, Muirkirk, Greenbelt,
          College Park, Riverdale and Union Station in Washington, with
          Halethorpe, West Baltimore and BWI Airport also served on the
          broader MARC network. A first draft of this list carried Bowie State,
          Rockville and Silver Spring, which are not on this line, and Odenton,
          which could not be confirmed; none of the four appears here.

          The Light RailLink runs from Hunt Valley to Glen Burnie with a spur
          to BWI Airport, and connects to Penn Station and to MARC service at
          Camden Yards. Its downtown stations near the ballpark include Camden
          Station, Convention Center, Baltimore Arena, and Stadium/Federal
          Hill, formerly Hamburg Street.

          MTA Maryland bus routes 69, 70, 73 and 75 serve the area around the
          ballpark. The Charm City Circulator is free; its Orange Route runs
          along Pratt and Lombard Streets and Baltimore Street between Harbor
          East and Hollins Market, and lists Camden Yards among the
          destinations it serves. For intercity buses, a city bus depot at 2110
          Haines Street offers Greyhound and Peter Pan service to Washington,
          New York and Philadelphia, and BoltBus departs Baltimore's Penn
          Station, itself reachable by light rail, for Washington, Philadelphia
          and Boston.

          On parking, the record is thin and is published as thin. The Maryland
          Stadium Authority's own parking page notes that availability can
          change on game days; it names no lots and publishes no rates, and
          neither does this guide. A first draft named an operator and a phone
          number from that page; the verification struck both. Bicycle parking
          is documented in more detail than car parking: 73 spaces at Oriole
          Park's Gate H, 80 at Gate C, 3 at the Warehouse, and 36 at MARC's
          Camden Station.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          Ridgely's Delight is 24 acres
          bounded by Russell and Greene Streets to the east, West Pratt Street
          to the north, and Martin Luther King Jr. Boulevard on the west and
          south. The land was surveyed in 1732 for Charles Ridgely, and the
          name comes from Charles Ridgely II's plantation, Ridgely's Whim. Its
          rowhouses were built from 1823 onward in Italianate, Federal and Late
          Federal styles, and the district went on the National Register on
          June 6, 1980. Babe Ruth was born inside it, in the row house at 216
          Emory Street, on February 6, 1895; that house opened as a museum in
          July 1974 after the press secretary Hirsh Goldberg argued against its
          planned demolition, became the official museum of the Orioles in
          1983, and received the ball from Camden Yards' first home run when
          the ballpark opened in 1992.

          Horseshoe Baltimore is at 1525 Russell Street, adjacent to M&T Bank
          Stadium and Oriole Park: a casino with a 122,000-square-foot gaming
          floor and a World Series of Poker room, opened on August 26, 2014 and
          owned and operated by CBAC Gaming, a consortium led by Caesars
          Entertainment. Pickles Pub is at 520 Washington Blvd, a sports bar
          that its own site describes as drawing Orioles and Ravens gameday
          crowds.

          Eutaw Street carries two markets and a theatre.
          Lexington Market, at 112 N Eutaw, was established in 1782 on land
          donated by the Continental Army commander General John Eager Howard
          and is one of the longest-running public markets in the nation; its
          1871 shed burned in 1949, and a 60,000-square-foot replacement
          housing 50 merchants was completed in 2022. Faidley's Seafood has
          been inside it since 1886, when John W. Faidley Sr. founded it in two
          wooden sheds there; as of 2024 it is owned and operated by Nancy
          Devine and her husband Bill, descendants of the founder. The
          Hippodrome Theatre, at 12 N. Eutaw, opened in 1914 as a 2,300-seat
          vaudeville and movie palace designed by Thomas W. Lamb in the Beaux
          Arts style, and at its debut was the largest theatre in the United
          States south of Philadelphia; it closed as a movie theater in 1990,
          went on the National Register on January 14, 2000, and reopened after
          a 2004 renovation as part of the France-Merrick Performing Arts
          Center. Pratt Street Ale House is at 206 W Pratt St, and its own site
          gives its name and address and nothing more.

          Federal Hill has the last two entries. The park there covers 10.3 acres
          bounded by Francis Scott Key Highway, Battery Avenue, Warren Avenue
          and Covington Street, maintained by the city's Department of
          Recreation and Parks. It was John Smith's Hill, after Captain John
          Smith's 1608 voyage, until Maryland's Constitutional ratification
          celebration of 1788 renamed it; it served military purposes in the
          War of 1812 and the Civil War, and the city acquired it as public
          property in 1880. Cross Street Market, at 1065 S Charles Street,
          spans Cross Street between Light and Charles in the same
          neighborhood; it was the scene of the Cross Street Market Hall riot
          of September 8, 1876, and was redeveloped for $8.4 million by spring
          2019.

          One thing to know about the record behind all of this. Six of these
          eleven places carry no statement here about whether they are trading
          now: the Babe Ruth museum, Pickles Pub, the Hippodrome, Pratt Street
          Ale House and Cross Street Market all rest on an operator's own site
          once a failed licence source was removed, and Ridgely's Delight is a
          neighborhood rather than a business. None of that is evidence of
          closure, and none should be inferred. Telephone first.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Oriole Park at Camden Yards opened on April 6, 1992, on the site of
          the Baltimore and Ohio Railroad's Camden Station rail yard. HOK
          Sport, now Populous, designed it in a retro-classic style, and it
          pioneered that design, which intentionally contrasted with the
          symmetrical multipurpose stadiums built in the preceding era.
          Capacity is 42,455 as of 2026.

          The B&O Warehouse behind the right-field wall is the older building.
          The railroad began it in 1899, with later sections completed in 1905,
          as a freight facility able to hold 1,000 carloads at a time; it is
          eight stories and 1,116 feet long. By the 1970s it stood largely
          vacant. The 1992 design incorporated it rather than demolishing it,
          and it now houses Orioles team offices, team spaces and a private
          club.

          Camden Station itself, at 301 W. Camden Street, is a three-story
          Italianate brick structure substantially completed by 1857, and it
          served B&O passenger trains into the 1980s. President Lincoln passed
          through it in February 1861 on the way to his inauguration, and
          changed trains there in 1863 before delivering the Gettysburg
          Address; news of the Battle of Fort Sumter first reached Baltimore at
          the station's telegraph office on April 12, 1861. The Sports Legends
          Museum, which had operated in the station building, closed in 2015.

          The names come from the same source. Camden Street was named after
          Charles Pratt, 1st Earl Camden, and Maryland governor William Donald
          Schaefer championed the Camden Yards name for the redeveloped
          85-acre complex during the site's redevelopment in the late 1980s and
          early 1990s.

          One point of jurisdiction, because this guide's county field depends
          on it: Baltimore was designated an independent city by the
          Constitution of Maryland in 1851. It is not under the jurisdiction of
          any county, and is almost entirely surrounded by Baltimore County
          while being politically independent of it.
          """
        }
      ],
      faq: [
        %{
          "question" => "How does public transit reach the ballpark?",
          "answer" =>
            "Camden Station, at 301 West Camden Street and adjacent to the ballpark, carries both the Baltimore Light RailLink and MARC's Camden Line to Washington, D.C. The Light RailLink runs Hunt Valley to Glen Burnie with a BWI Airport spur and connects to Penn Station; its downtown stations near the ballpark include Camden Station, Convention Center, Baltimore Arena and Stadium/Federal Hill. MTA Maryland bus routes 69, 70, 73 and 75 serve the area, and the free Charm City Circulator's Orange Route lists Camden Yards among its destinations."
        },
        %{
          "question" => "What does parking cost?",
          "answer" =>
            "No rate is published here, because none could be sourced. The Maryland Stadium Authority's own parking page notes that availability can change on game days but names no lots and publishes no rates. Bicycle parking is better documented: 73 spaces at Oriole Park's Gate H, 80 at Gate C, 3 at the Warehouse, and 36 at MARC's Camden Station."
        },
        %{
          "question" => "What is the warehouse behind right field?",
          "answer" =>
            "The B&O Warehouse, eight stories and 1,116 feet long, begun by the Baltimore and Ohio Railroad in 1899 with later sections completed in 1905, built to hold 1,000 carloads of freight at a time. It was largely vacant by the 1970s and was incorporated into the ballpark's 1992 design rather than demolished. It now houses Orioles team offices, team spaces and a private club."
        },
        %{
          "question" => "Why does this guide not say whether some of these places are open?",
          "answer" =>
            "Because a source that would have answered it turned out to be empty. The research cited a Baltimore City licence layer for licensee names, licence classes and 2027 end dates across eight claims; on verification that URL proved to be a schema page containing no licence records at all, so every claim resting on it was struck. What remains for six of these places is an operator's own site, which establishes that a business makes a statement and not that the statement is currently true. None of that is evidence of closure."
        },
        %{
          "question" => "When was Pickles Pub founded?",
          "answer" =>
            "Its own site states March 17, 1988. No independent source corroborates that date, so this guide records it as the bar's own statement rather than publishing it as a fact."
        },
        %{
          "question" => "Why is this guide filed under Baltimore City rather than a county?",
          "answer" =>
            "Because Baltimore has not been in one since 1851, when the Constitution of Maryland designated it an independent city. It is not under the jurisdiction of any county and is almost entirely surrounded by Baltimore County while being politically independent of it. The county field carries the city's own name so that this guide and its places share a destination hub."
        }
      ],
      photos: []
    }
  end
end
