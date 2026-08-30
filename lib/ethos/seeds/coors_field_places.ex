defmodule Ethos.Seeds.CoorsFieldPlaces do
  @moduledoc """
  Seeds the places for the Coors Field guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Colorado Rockies research artifact. No verdict in this artifact
  is refuted; the verifier flags the high confirmation rate as a warning sign on
  principle and then explains it — the finder stuck almost entirely to
  well-established, cross-checkable encyclopedia facts and avoided the failure
  modes that produced refutations elsewhere in the set. A verdict still vouches
  only for what its own `item` text restates.
  `docs/ballparks/coors-field.md` quotes each published sentence against the
  verdict it rests on, and records every omission.

  What the verification changed, and what is therefore absent here:

    * **No parking price.** A confirmed verdict records that the club's
      transportation page states no price and that the parking page it links to
      returned a 404, so no published parking cost could be established from an
      accessible source. The purchase channels that *are* stated ship; no rate
      does.

    * **No trading claim for four of the six places.** The Oxford Hotel,
      McGregor Square and the Tattered Cover's Union Station store are
      `uncertain`, and each `could_not_establish` names the specific
      corroboration that could not be reached. Uncertain is not closed, and no
      closure is asserted.

    * **An open question about the Tattered Cover, published as one.** Its
      October 2023 Chapter 11 filing closed three stores and no source reachable
      by either pass names which three. Whether the Union Station store was
      among them is therefore not established in either direction, and the
      record says so rather than reading the company's current store locator as
      settling it.

  **Wynkoop Brewing Company is published as operating, and the basis is worth
  naming.** The finder called it uncertain because its only trading evidence was
  the brewery's own site. The verifier upgraded it on a source the finder had
  cited for something else: the LoDo article states in the present tense that
  Wynkoop *"remains a notable establishment in the neighborhood"* — third-party,
  affirmative, not merely the absence of a closure notice.

  The county on every record is `"Denver"`. See `Ethos.Seeds.CoorsFieldGuide`
  for why that form and not the jurisdiction's full legal name.
  """

  alias Ethos.Places

  @denver %{town: "Denver", state: "Colorado", county: "Denver"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@denver, %{
        slug: "coors-field",
        name: "Coors Field",
        kind: "stadium",
        address: "2001 Blake Street, Denver, Colorado 80205",
        official_url: "https://www.mlb.com/rockies/ballpark",
        summary:
          "The home ballpark of the Colorado Rockies, at 2001 Blake Street in Denver's Lower Downtown, which MLB's own site describes as the \"Ballpark Neighborhood\". It opened on April 26, 1995, and its main entrance is at 20th and Blake Streets. Capacity is 46,897, or 50,144 including standing room as of 2018, with 63 luxury suites and 4,526 club seats. The center-field bleacher section is known as \"The Rockpile\" and seats roughly 2,300.",
        history:
          "Construction began on October 16, 1992, and the ballpark was built at a cost of $300 million while the Rockies played their first two seasons, 1993 and 1994, at Mile High Stadium. It was the first baseball-only stadium built in the National League since Dodger Stadium opened in 1962. It has a hand-laid brick facade and a clock tower, and the playing field sits 21 feet below street level — a deliberate design choice to minimize the stadium's visual impact on the surrounding neighborhood. During construction, workers discovered dinosaur fossils on the site, which led to consideration of \"Jurassic Park\" as a stadium name and influenced the choice of a triceratops mascot, Dinger. The ballpark's high elevation — 5,200 feet, one mile above sea level — and semi-arid climate produce a hitter-friendly environment; baseballs are stored in a humidor and the outfield fences are placed unusually far from home plate, giving Coors Field the largest outfield in Major League Baseball, and a row of purple seats marks the one-mile-elevation point. Before the 2018 season a new video display, 59 feet high by 116.5 feet wide, was installed in left field, replacing the previous scoreboard. The Coors Brewing Company purchased the naming rights in perpetuity in 1991, as part of a $30 million investment, and a 2017 lease agreement ensures the name remains at least through 2047. The Colorado Rockies' official team name has been unchanged since the franchise began play in 1993, and its principal owners are Richard and Charles Monfort.",
        photos: []
      }),
      Map.merge(@denver, %{
        slug: "oxford-hotel-denver",
        name: "The Oxford Hotel",
        kind: "hotel",
        address: "1612 17th Street, Denver, Colorado",
        official_url: "https://www.theoxfordhotel.com/",
        summary:
          "A hotel at 1612 17th Street, built in 1891 to a design by the architect Frank Edbrooke. It has been listed on the National Register of Historic Places since April 17, 1979 and appears on the Colorado State Register of Historic Properties. No dated third-party source confirming that the hotel is operating today could be reached for this research.",
        history:
          "The hotel's Cruise Room is a windowless Art Deco cocktail lounge modeled after an ocean liner lounge from the RMS Queen Mary, with bas-relief wall panels depicting toasts from different cultures. It opened the day after Prohibition ended and was restored in 2012 with historically accurate finishes.",
        photos: []
      }),
      Map.merge(@denver, %{
        slug: "wynkoop-brewing-company",
        name: "Wynkoop Brewing Company",
        kind: "brewery",
        address: "1634 18th Street, Denver, Colorado 80202",
        official_url: "https://www.wynkoop.com/",
        summary:
          "A brewpub at 1634 18th Street, founded in 1988 by, among others, the future Colorado governor John Hickenlooper. The encyclopedia article on Lower Downtown describes it as one of the historic district's notable historic businesses and states that it remains a notable establishment in the neighborhood. Its own site states that it brews on site in a basement brewery and serves food including burgers and brunch fare, and that it is known for its Rocky Mountain Oyster Stout.",
        history: nil,
        photos: []
      }),
      Map.merge(@denver, %{
        slug: "larimer-square-denver",
        name: "Larimer Square",
        kind: "historic-site",
        address: "1400 block of Larimer Street, Denver, Colorado",
        official_url: nil,
        summary:
          "Denver's first officially designated historic district, designated in 1971 and added to the National Register of Historic Places on May 7, 1973. Most of its buildings date from the 1870s to the 1890s, in the Victorian commercial style typical of western boomtowns. The district today is a mixed-use area of restaurants, retail, offices and entertainment venues. No official website for the district as a whole could be found; it is a multi-tenant historic streetscape rather than a single operator.",
        history:
          "Preservation was led by Dana Hudkins Crawford beginning in the 1960s, through adaptive reuse rather than demolition.",
        photos: []
      }),
      Map.merge(@denver, %{
        slug: "mcgregor-square-denver",
        name: "McGregor Square",
        kind: "attraction",
        address: "1901 Wazee Street, Denver, Colorado 80202",
        official_url: "https://mcgregorsquare.com/",
        summary:
          "A mixed-use entertainment district at 1901 Wazee Street in Denver's Lower Downtown, spanning a full block with residential, hotel, office and commercial components around a 17,000-square-foot outdoor plaza with a 66-foot LED screen. It is named after the former Colorado Rockies president Keli McGregor. Its hotel component is The Rally Hotel, and its 13-story residential building, McGregor Square Residences, has 103 condos. Its own site is the only source this research reached for it; no opening date is stated there, and no independent confirmation of its current operating status was found.",
        history: nil,
        photos: []
      }),
      Map.merge(@denver, %{
        slug: "tattered-cover-union-station",
        name: "Tattered Cover — Union Station",
        kind: "shop",
        address: "1701 Wynkoop Street, Denver, Colorado",
        official_url: "https://www.tatteredcover.com/",
        summary:
          "A bookstore inside the Union Station building at 1701 Wynkoop Street, alongside the Crawford Hotel. The company's own current store locator lists it as one of four currently operating Tattered Cover stores. Tattered Cover was founded in 1971 in Denver's Cherry Creek district and grew into one of the largest independent bookstores in the United States; it was acquired by Barnes & Noble in July 2024, following an October 2023 Chapter 11 bankruptcy filing under which three stores were to close. No source reachable by this research names which three, so whether the Union Station store was among them is not established in either direction; the store locator's current listing is consistent with survival but is the company's own and cannot settle it.",
        history: nil,
        photos: []
      })
    ]
  end
end
