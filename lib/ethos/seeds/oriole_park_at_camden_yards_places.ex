defmodule Ethos.Seeds.OrioleParkAtCamdenYardsPlaces do
  @moduledoc """
  Seeds the places for the Oriole Park at Camden Yards guide. Idempotent:
  `upsert_all!/0` upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Baltimore Orioles research artifact, or the text a `refuted`
  verdict's correction supplies. `docs/ballparks/oriole-park-at-camden-yards.md`
  quotes each published sentence against the verdict it rests on.

  **Every record hangs from the node `united-states/maryland/baltimore`.** A
  confirmed verdict records that Baltimore was designated an independent city by
  the Maryland Constitution in 1851, is not under the jurisdiction of any county,
  and is almost entirely surrounded by but politically independent of Baltimore
  County. The verifier's own note asked for that explanation to be moved into
  prose, and the tree says the same thing structurally: no county node stands
  above the city.

  **Not one liquor-licence fact is published, and that is the big finding.**
  The finder cited a Baltimore City ArcGIS licence layer for eight separate
  claims — licensee names, licence classes, statuses and 2027 end dates — but
  the URL it cited in every case is the bare `FeatureServer/0` endpoint with no
  query string. Fetched directly, twice, the verifier established that this is
  a service-metadata page listing field names and containing **zero licence
  records**. Every one of those claims is `refuted` as a citation. None
  appears here, and no place's trading status rests on one.

  What else the verification changed:

    * **Six places carry no trading claim**: the Babe Ruth museum, Pickles
      Pub, the Hippodrome, Pratt Street Ale House and Cross Street Market are
      all `uncertain` once the licence source is removed, and Ridgely's
      Delight is a historic district rather than a business. Uncertain is not
      closed, and no closure is asserted.

    * **Pickles Pub's founding date is not a fact here.** Its verdict is
      `uncertain`, with the correction "Publish the address and description;
      treat the 1988 date as unconfirmed rather than a stated fact."

    * **Federal Hill Park carries no street number.** The finder's address
      field held one; `could_not_establish` records that the source describes
      the park by its bounding streets rather than a postal address, so the
      bounding streets are what is published.

  Architectural style ships wherever a verdict states one: the ballpark's
  retro-classic, Camden Station's Italianate, the Hippodrome's Beaux Arts, and
  Ridgely's Delight's Italianate, Federal and Late Federal rowhouses. No trip
  duration appears anywhere.
  """

  alias Ethos.Places

  @baltimore %{destination_path: "united-states/maryland/baltimore"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@baltimore, %{
        slug: "oriole-park-at-camden-yards",
        name: "Oriole Park at Camden Yards",
        kind: "stadium",
        address: "333 W. Camden Street, Baltimore, MD",
        official_url: "https://www.mlb.com/orioles/ballpark",
        summary:
          "The home ballpark of the Baltimore Orioles, at 333 W. Camden Street. It opened on April 6, 1992, and its capacity is listed as 42,455 as of 2026. HOK Sport, now Populous, designed it in a retro-classic style, and the design retained the historic B&O Warehouse behind the right-field wall rather than demolishing it.",
        history:
          "The ballpark was built on the site of the former Baltimore and Ohio Railroad's Camden Station rail yard, and pioneered the retro-classic design that intentionally contrasted with the symmetrical multipurpose stadiums built in the preceding era. Camden Street was named after Charles Pratt, 1st Earl Camden; the Camden Yards name for the redeveloped 85-acre complex was championed by Maryland governor William Donald Schaefer during the site's redevelopment in the late 1980s and early 1990s. The B&O Warehouse the design kept is eight stories and 1,116 feet long; the railroad began building it in 1899, with later sections completed in 1905, as a freight facility able to hold 1,000 carloads at a time. It stood largely vacant by the 1970s and now houses Orioles team offices, team spaces and a private club.",
        photos: []
      }),
      Map.merge(@baltimore, %{
        slug: "babe-ruth-birthplace-and-museum",
        name: "Babe Ruth Birthplace & Museum",
        kind: "museum",
        address: "216 Emory Street, Baltimore, MD 21230",
        official_url: "https://baberuthmuseum.org/",
        summary:
          "A museum in the row house at 216 Emory Street where Babe Ruth was born on February 6, 1895. Its own site lists hours of 10:00 a.m. to 5:00 p.m. daily, extended to 5:30 p.m. on Orioles evening home games, and states that it is operated by the nonprofit Babe Ruth Birthplace Foundation. That site is the only current-operation evidence the research reached, and it cannot establish that on its own word, so nothing here says whether the museum is open now.",
        history:
          "The museum officially opened in July 1974, after the press secretary Hirsh Goldberg advocated against the building's planned demolition. It became the official museum of the Baltimore Orioles in 1983, and when Camden Yards opened in 1992 the ball from the ballpark's first home run was donated to it.",
        photos: []
      }),
      Map.merge(@baltimore, %{
        slug: "horseshoe-baltimore",
        name: "Horseshoe Baltimore",
        kind: "attraction",
        address: "1525 Russell Street, Baltimore, MD",
        official_url: "https://www.caesars.com/horseshoe-baltimore",
        summary:
          "A casino at 1525 Russell Street, adjacent to M&T Bank Stadium and Oriole Park, with a 122,000-square-foot gaming floor and a World Series of Poker room. It opened on August 26, 2014 and is owned and operated by CBAC Gaming, a consortium led by Caesars Entertainment.",
        history: nil,
        photos: []
      }),
      Map.merge(@baltimore, %{
        slug: "pickles-pub",
        name: "Pickles Pub",
        kind: "restaurant",
        address: "520 Washington Blvd, Baltimore, MD 21230",
        official_url: "https://picklespub.com/",
        summary:
          "A sports bar at 520 Washington Blvd, which its own site describes as drawing Orioles and Ravens gameday crowds. That site also states a founding date of March 17, 1988; no independent source corroborates it, so it is recorded here as unconfirmed rather than as a fact. The bar's own site is the only source the research reached for it, and nothing here says whether it is trading now.",
        history: nil,
        photos: []
      }),
      Map.merge(@baltimore, %{
        slug: "lexington-market",
        name: "Lexington Market",
        kind: "shop",
        address: "112 N Eutaw Street, Baltimore, MD 21201",
        official_url: nil,
        summary:
          "A public market at 112 N Eutaw Street, established in 1782 on land donated by the Continental Army commander General John Eager Howard, and one of the longest-running public markets in the nation. It is owned by the City of Baltimore and managed by the nonprofit Baltimore Public Markets Corporation.",
        history:
          "A market shed was built in 1871 and destroyed by fire in 1949. A new market shed of 60,000 square feet, housing 50 merchants, was completed in 2022.",
        photos: []
      }),
      Map.merge(@baltimore, %{
        slug: "faidleys-seafood",
        name: "Faidley's Seafood",
        kind: "restaurant",
        address: "203 N Paca St, Baltimore, MD 21201",
        official_url: nil,
        summary:
          "A seafood business inside Lexington Market, founded in 1886 by John W. Faidley Sr. in two wooden sheds there and a family operation for generations since. As of 2024 it is owned and operated by Nancy Devine and her husband Bill, descendants of the founder.",
        history: nil,
        photos: []
      }),
      Map.merge(@baltimore, %{
        slug: "hippodrome-theatre-baltimore",
        name: "Hippodrome Theatre",
        kind: "theater",
        address: "12 N. Eutaw Street, Baltimore, MD",
        official_url: nil,
        summary:
          "A theatre at 12 N. Eutaw Street that opened in 1914 as a 2,300-seat vaudeville and movie palace, designed by the architect Thomas W. Lamb in the Beaux Arts style; at its debut it was the largest theatre in the United States south of Philadelphia. Its current programming was not established by the research and is not published here.",
        history:
          "The Hippodrome closed as a movie theater in 1990 and was added to the National Register of Historic Places on January 14, 2000. It reopened after a 2004 renovation as part of the France-Merrick Performing Arts Center.",
        photos: []
      }),
      Map.merge(@baltimore, %{
        slug: "pratt-street-ale-house",
        name: "Pratt Street Ale House",
        kind: "brewery",
        address: "206 W Pratt St, Baltimore, MD",
        official_url: "https://prattstreetalehouse.com/",
        summary:
          "An ale house at 206 W Pratt St. The operator's own site gives the name and the address and nothing further; no independent source with a founding year or a history was found, and nothing here says whether the business is trading now.",
        history: nil,
        photos: []
      }),
      Map.merge(@baltimore, %{
        slug: "federal-hill-park",
        name: "Federal Hill Park",
        kind: "park",
        address:
          "Bounded by Francis Scott Key Highway, Battery Avenue, Warren Avenue and Covington Street, Baltimore, MD",
        official_url: nil,
        summary:
          "A 10.3-acre public park on Baltimore's Inner Harbor, bounded by Francis Scott Key Highway, which carries Maryland Route 2, along with Battery Avenue, Warren Avenue and Covington Street. It is maintained by the city's Department of Recreation and Parks. The source describes it by those bounding streets rather than by a postal address, and no street number is published here.",
        history:
          "The site was originally called John Smith's Hill, after Captain John Smith's voyage of 1608, and was renamed Federal Hill after Maryland's Constitutional ratification celebration of 1788. It served military purposes during the War of 1812 and the Civil War, and was acquired by the City of Baltimore as public property in 1880.",
        photos: []
      }),
      Map.merge(@baltimore, %{
        slug: "cross-street-market",
        name: "Cross Street Market",
        kind: "shop",
        address: "1065 S Charles Street, Baltimore, MD 21230",
        official_url: "https://www.crossstmarket.com/",
        summary:
          "A 19th-century historic marketplace in Federal Hill, spanning Cross Street between Light Street and Charles Street. Its own site gives the address as 1065 S Charles Street and lists it as open daily from 7am, closing between 8pm and 10pm depending on the day. That site is the only source the research reached for current operation, and it cannot establish that on its own word, so nothing here says whether the market is trading now.",
        history:
          "The market was the scene of the Cross Street Market Hall riot of September 8, 1876. It underwent an $8.4 million redevelopment completed in spring 2019.",
        photos: []
      }),
      Map.merge(@baltimore, %{
        slug: "ridgelys-delight-historic-district",
        name: "Ridgely's Delight Historic District",
        kind: "historic-site",
        address:
          "Bounded by Russell and Greene Streets, West Pratt Street, and Martin Luther King Jr. Boulevard, Baltimore, MD",
        official_url: nil,
        summary:
          "A 24-acre historic residential neighborhood in downtown Baltimore, bounded by Russell and Greene Streets to the east, West Pratt Street to the north, and Martin Luther King Jr. Boulevard on the west and south. It is the birthplace of Babe Ruth and hosts the Babe Ruth Birthplace and Museum on Emory Street. As a neighborhood rather than a single building it has no postal address, and the boundary streets are given instead.",
        history:
          "The land was surveyed in 1732 for Charles Ridgely, and the name derives from Charles Ridgely II's plantation, Ridgely's Whim. The district's rowhouses, built from 1823 onward, feature Italianate, Federal and Late Federal architectural styles. The historic district was added to the National Register of Historic Places on June 6, 1980.",
        photos: []
      })
    ]
  end
end
