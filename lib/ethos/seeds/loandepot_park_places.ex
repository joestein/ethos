defmodule Ethos.Seeds.LoandepotParkPlaces do
  @moduledoc """
  Seeds the places for the loanDepot park guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Miami Marlins research artifact. A verdict vouches only for
  what its own `item` text restates.
  `docs/ballparks/loandepot-park.md` quotes each published sentence against the
  verdict it rests on, and records every omission.

  **The ballpark is minted here, not researched as a place.** The artifact's
  `places` array holds the five places around the ballpark and not the ballpark
  itself; the `loandepot-park` record below is built from the confirmed
  identity and `history` verdicts, which carry the name, the address, the
  opening date, the renaming, the site and the neighborhood.

  What the verification changed, and what is therefore absent here:

    * **No zip code except the ballpark's.** The ballpark's is stated by the
      verifier as confirmed; no other address in this artifact carries one in
      any verdict text.

    * **No figure for how long the retractable roof takes.** The roof item is
      `refuted` because the finder gave one figure for opening and closing when
      the source gives two different ones. The tonnage the verifier confirms
      "exactly" ships; the figures do not, and could not have in any case —
      they are duration-shaped, this corpus publishes no duration-shaped
      string, and the ban scans module source, so this moduledoc does not quote
      them either.

    * **No pastels.** The artwork item is `refuted` because the finder turned
      the source's "four bright primary colors" from Joan Miro's palette into
      pastel colors, which the source uses elsewhere for something else. The
      sculpture and the walkway, which the verifier confirms in the same
      breath, ship; the colours ship as the source describes them.

    * **No trading claim for four of the six places.** Maximo Gomez Park, the
      Tower Theater, Ball & Chain and Versailles Restaurant are all
      `uncertain`, each for a reason the records name. Uncertain is not closed,
      and no closure is asserted. The historic district is `n/a` — it is a
      district, not a business.

  The county on every record is `"Miami-Dade County"`. See
  `Ethos.Seeds.LoandepotParkGuide` for where it comes from, which is not the
  source the finder cited for it.
  """

  alias Ethos.Places

  @miami %{town: "Miami", state: "Florida", county: "Miami-Dade County"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@miami, %{
        slug: "loandepot-park",
        name: "loanDepot park",
        kind: "stadium",
        address: "501 Marlins Way, Miami, Florida 33125",
        official_url: "https://www.mlb.com/marlins/ballpark",
        summary:
          "The home ballpark of the Miami Marlins, at 501 Marlins Way in Miami, on the former site of the Miami Orange Bowl in the Little Havana neighborhood. It opened for the regular season on April 4, 2012, was named Marlins Park from 2012 to 2020, and was renamed loanDepot park on March 31, 2021 after loanDepot bought the naming rights. It is owned by Miami-Dade County, whose commission was a party to the funding agreement behind it.",
        history:
          "Construction cost was reported at $634 million, about $889 million in 2025 dollars. The ballpark achieved LEED Gold certification on May 25, 2012. Its retractable roof consists of roughly 8,300 tons of steel. The design incorporates a home run sculpture by Red Grooms and a tiled walkway by Carlos Cruz-Diez titled \"Chromatic Induction in a Double Frequency\", and the ballpark's four zone colors — green, red, yellow and blue — are drawn from what the source calls the four bright primary colors of Joan Miro's palette. Before it opened, the Marlins shared Sun Life Stadium with the Miami Dolphins; loanDepot park was the franchise's first home designed exclusively for baseball. The franchise began play in 1993 as the Florida Marlins and was renamed the Miami Marlins prior to the 2012 season, as part of an agreement with the park owner, Miami-Dade County, to use the new stadium. The Marlins won the World Series in 1997, over the Cleveland Indians 4-3, and in 2003, over the New York Yankees 4-2; the source states that the 1997 team was the first to win the World Series as a wild card.",
        photos: []
      }),
      Map.merge(@miami, %{
        slug: "maximo-gomez-park-miami",
        name: "Maximo Gomez Park",
        kind: "park",
        address: "Calle Ocho (8th Street), Little Havana, Miami, Florida",
        official_url: nil,
        summary:
          "A park on Calle Ocho in Little Havana, nicknamed Domino Park, which has been a gathering place for Cuban immigrants to play dominoes, drink coffee and smoke cigars since the early 1970s. It is named for Maximo Gomez, a general of Cuba's War of Independence, and today also hosts food tours and art festivals. No exact street number is published: only the Calle Ocho location is sourced. An official city parks-department page could not be fetched — the city and county park pages returned 403 and 404 to automated requests — and no dated source confirming its current operation was found.",
        history: nil,
        photos: []
      }),
      Map.merge(@miami, %{
        slug: "tower-theater-miami",
        name: "Tower Theater",
        kind: "theater",
        address: "1508 SW 8th Street, Miami, Florida",
        official_url: nil,
        summary:
          "An Art Deco building at 1508 SW 8th Street in Little Havana, which hosts the Viernes Culturales (Cultural Fridays) events. Its own website, re-fetched during verification, is a placeholder page headed \"Tower Theater Miami — Returns Soon\", identifying the venue as \"Miami Dade College's Tower Theater Miami\" and directing visitors to the Miami Film Festival for current screenings. That is neither a statement that the theater is trading nor a closure notice, and this record makes neither claim. Its opening date, its current operator and any National Register status could not be established beyond the neighborhood overview article.",
        history: nil,
        photos: []
      }),
      Map.merge(@miami, %{
        slug: "ball-and-chain-miami",
        name: "Ball & Chain",
        kind: "attraction",
        address: "1513 SW 8th Street, Miami, Florida",
        official_url: "https://www.ballandchainmiami.com/",
        summary:
          "A historic live music venue at 1513 SW 8th Street in Little Havana, originally opened in 1935. The musician Harry Gibson appeared at the Ball & Chain nightclub in Miami on the same bill as Billie Holiday during the Christmas season of 1956. No dedicated encyclopedia article for the venue exists — only passing mentions in others — so the details of its closure in the 1935 era and its later reopening are not established here, and neither are its current hours, ownership or offerings. Its own site is live, but a business's own site cannot establish that it is trading, and no independent dated source could be reached.",
        history: nil,
        photos: []
      }),
      Map.merge(@miami, %{
        slug: "versailles-restaurant-miami",
        name: "Versailles Restaurant",
        kind: "restaurant",
        address: "3555 SW 8th Street, Miami, Florida",
        official_url: "https://www.versaillesrestaurant.com/",
        summary:
          "A restaurant at 3555 SW 8th Street, opened in 1971 and founded by Felipe A. Valls Sr., a Cuban exile from Santiago de Cuba — a founding date and founder confirmed independently of the restaurant's own account. It won a James Beard Foundation America's Classics award in 2001. For decades it has served as a central gathering place for Miami's Cuban exile community, hosting political fundraisers and rallies and drawing media coverage of events related to Cuba, along with visits from U.S. presidents and other politicians; one such visit, on June 13, 2023, is independently documented and dated. The James Beard Foundation's own award database could not be fetched directly, so the award rests on the encyclopedia's account of it.",
        history: nil,
        photos: []
      }),
      Map.merge(@miami, %{
        slug: "south-river-drive-historic-district-miami",
        name: "South River Drive Historic District",
        kind: "historic-site",
        address:
          "SW South River Drive and SW 1st and 2nd Streets, Miami, Florida (contributing addresses include 428 and 438 SW 1st Street, 437 SW 2nd Street, and 104, 109 and 118 SW South River Drive)",
        official_url: nil,
        summary:
          "A historic district at the eastern end of Little Havana along the Miami River, locally designated by the Miami City Commission in 1987 and added to the National Register of Historic Places later the same year, on August 10, 1987. It covers 25 acres and contains 9 historic buildings, developed principally in the first two decades of the twentieth century, and is described as the city's oldest extant group of vernacular frame buildings near the Miami River. Which of the contributing buildings, if any, currently house publicly visitable businesses was not established.",
        history: nil,
        photos: []
      })
    ]
  end
end
