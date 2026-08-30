defmodule Ethos.Seeds.PetcoParkPlaces do
  @moduledoc """
  Seeds the places for the Petco Park guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates text a `confirmed` verdict in the
  2026-08-30 San Diego Padres research artifact carries, or that the verifier's
  own reason or correction expressly states was confirmed.
  `docs/ballparks/petco-park.md` quotes each published sentence against the
  verdict it rests on, and records every omission.

  What the verification changed, and what is therefore absent here:

    * **No trading claim for five of the seven places.** Every business here
      rests on its own site plus, for four of them, the Gaslamp Quarter
      Association's business directory — and the verifier ruled that a
      neighborhood business directory is not third-party evidence of current
      trading either. Uncertain is not closed, and no closure is asserted for
      any of them.

    * **No founding year for three restaurants**, and no opening year for one
      museum, each on an explicit `could_not_establish`. Asti Ristorante's own
      site says it has operated "over 20 years", and that is published as the
      site's own claim rather than as a date.

    * **No parking rate**, on a `could_not_establish` the verifier reproduced:
      MLB.com's ballpark parking and transportation pages returned HTTP 406 to
      direct fetch, and the third-party directions page names no lots and no
      prices.

  The county on every record is `"San Diego County"`, from two confirmed
  verdicts: the encyclopedia's Petco Park infobox, which names the county, and
  its article on San Diego, which states verbatim that the city is the county
  seat of San Diego County. San Diego is not a consolidated city-county, so the
  plain form ships rather than the bare-city rendering used for San Francisco
  and Denver.
  """

  alias Ethos.Places

  @san_diego %{town: "San Diego", state: "California", county: "San Diego County"}

  @own_site_only "Its own site and a neighborhood business directory are the only sources this research reached for it, and neither can establish that a business is trading, so nothing is said here about whether it is open today."

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@san_diego, %{
        slug: "petco-park",
        name: "Petco Park",
        kind: "stadium",
        address: "100 Park Boulevard, San Diego, California 92101",
        official_url: "https://www.mlb.com/padres/ballpark",
        summary:
          "The home ballpark of the San Diego Padres, at 100 Park Boulevard — an address the encyclopedia also gives as 19 Tony Gwynn Way, named in honor of the eight-time National League batting champion who wore that uniform number. It opened in 2004, replacing San Diego Stadium, later Qualcomm Stadium, where the Padres had played from their inception in 1969 to 2003. It was designed by Populous, then HOK Sport, with Antoine Predock credited for design, and cost more than $450 million, partially funded by a public-private partnership that included the Center City Development Corporation and the San Diego Redevelopment Agency.",
        history:
          "The Padres played their first regular-season game at the ballpark on April 8, 2004, defeating the San Francisco Giants 4-3 in ten innings. It hosted the inaugural 2006 World Baseball Classic championship and the 2016 Major League Baseball All-Star Game, and on October 9, 2024 it set a baseball attendance record with 47,773 people present. Gallagher Square, known as the \"Park at the Park\", is a grassy berm sloping above the outfield fence in center field; when no game is scheduled it serves as a free local park for area residents. The franchise was established in 1969 and plays in the National League West. It has reached the World Series twice, in 1984 and 1998, losing to the Detroit Tigers and then being swept by the New York Yankees. The article on the club describes Tony Gwynn, a Hall of Famer who spent his whole career with the Padres, as widely considered the greatest Padres player ever, and names Dave Winfield, Roberto Alomar, Rollie Fingers, Goose Gossage, Rickey Henderson, Trevor Hoffman, Greg Maddux, Willie McCovey, Fred McGriff, Gaylord Perry, Mike Piazza and Ozzie Smith among the other Hall of Famers who played for the franchise. Ownership was in transition when this research was carried out: Peter Seidler, who owned the team from 2012, died on November 14, 2023; Major League Baseball owners approved John Seidler as the club's control person on February 6, 2025; and on May 2, 2026 the Padres announced a pending sale to Feliciano and Kwanza Jones, which the article records as not finalized as of August 4, 2026.",
        photos: []
      }),
      Map.merge(@san_diego, %{
        slug: "gaslamp-museum-davis-horton-house",
        name: "Gaslamp Museum at the Davis-Horton House",
        kind: "museum",
        address: "410 Island Avenue, San Diego, California 92101",
        official_url: "https://www.gaslampmuseum.org/",
        summary:
          "An 1850 house at 410 Island Avenue, pre-fabricated in the saltbox style and shipped from the United States East Coast, which the encyclopedia describes as the oldest structure in the New Town San Diego area that William Heath Davis helped establish. The same article records that this particular building was not Davis's own house but one of the same style and age. The encyclopedia describes the house as open to the public as a museum, operated as the Gaslamp Museum at the Davis-Horton House, and the museum's own site gives hours of 10 a.m. to 4 p.m. from Thursday to Saturday, with last entry at 3:30 p.m., and states that it serves as headquarters for the Gaslamp Quarter Historical Foundation. No independent source confirming that it is operating today could be reached — the Gaslamp Quarter Association's own business directory carries no listing for it under any of its names — and the date it opened as a museum is not established either.",
        history: nil,
        photos: []
      }),
      Map.merge(@san_diego, %{
        slug: "museum-of-illusions-san-diego",
        name: "Museum of Illusions San Diego",
        kind: "museum",
        address: "665 Fifth Avenue, San Diego, California 92101",
        official_url: "https://moisandiego.com",
        summary:
          "A museum at 665 Fifth Avenue whose own site describes perspective-changing rooms, installations and optical illusions, visitable by guided tour or at a self-paced visit. The Gaslamp Quarter Association's business directory lists it as a museum at the same address. The year it opened is not established. #{@own_site_only}",
        history: nil,
        photos: []
      }),
      Map.merge(@san_diego, %{
        slug: "gaslamp-quarter-historic-district",
        name: "Gaslamp Quarter Historic District",
        kind: "historic-site",
        address:
          "Roughly bounded by Broadway and Harbor Drive, and Fourth and Sixth Avenues, San Diego, California 92101",
        official_url: "https://gaslamp.org",
        summary:
          "A historic district in downtown San Diego, designated a San Diego Historic Landmark on June 2, 1978 and added to the National Register of Historic Places on May 23, 1980. It contains over 90 historic buildings, primarily Victorian-era structures now in use as restaurants, shops and entertainment venues, and Petco Park sits in the adjacent East Village neighborhood. The address above is a boundary description rather than a mailing address: this is a multi-block district and no single street address applies to it.",
        history:
          "Intensive development began in 1867, when Alonzo Horton bought land to create a new city center on San Diego Bay and chose Fifth Avenue as its main street. From the 1880s through 1916 the district was known as the Stingaree and housed saloons, gambling halls and bordellos; the encyclopedia also records it as San Diego's first Chinatown. It was demolished and renamed by anti-vice campaigners in 1916. The Gaslamp Quarter Association's own history page corroborates the 1980 National Register listing and states that the Association was chartered in 1982 by the City of San Diego, under state law, as a Business Improvement District.",
        photos: []
      }),
      Map.merge(@san_diego, %{
        slug: "asti-ristorante",
        name: "Asti Ristorante",
        kind: "restaurant",
        address: "728 5th Avenue, San Diego, California 92101",
        official_url: "https://www.astisandiego.com",
        summary:
          "An Italian fine-dining restaurant at 728 5th Avenue in the Gaslamp Quarter, which its own site describes as having a Victorian-style brick interior, an outdoor patio and private event space for up to 120 guests, and which states on that site that it has been operating over 20 years. That duration is the restaurant's own claim and no exact founding year could be established. The Gaslamp Quarter Association's business directory lists it as a restaurant at the same address. #{@own_site_only}",
        history: nil,
        photos: []
      }),
      Map.merge(@san_diego, %{
        slug: "cafe-sevilla-san-diego",
        name: "Cafe Sevilla",
        kind: "restaurant",
        address: "353 Fifth Avenue, San Diego, California 92101",
        official_url: "https://cafesevilla.com/san-diego/",
        summary:
          "A restaurant and tapas bar at 353 Fifth Avenue in the Gaslamp Quarter, which its own site describes as featuring live music and flamenco shows, with an associated nightclub and private event hosting. The Gaslamp Quarter Association's business directory lists it as \"Cafe Sevilla Restaurant and Tapas Bar\" at the same address. Its founding year is not established. #{@own_site_only}",
        history: nil,
        photos: []
      }),
      Map.merge(@san_diego, %{
        slug: "the-field-irish-pub",
        name: "The Field Irish Pub",
        kind: "restaurant",
        address: "544 5th Avenue, San Diego, California 92101",
        official_url: "https://www.thefield.com",
        summary:
          "An Irish pub at 544 5th Avenue in the Gaslamp Quarter. Its own site tells the pub's origin as an Irish couple shipping a pub piece by piece from Ireland, and describes traditional Irish decor and a private party area upstairs for up to 200 guests. That origin story is published as the pub's own account of itself and not as verified history: no independent source corroborating it, or even the address, could be reached, the Gaslamp Quarter Association's directory carries no listing for the pub, and its founding year is not established. Nothing is said here about whether it is open today.",
        history: nil,
        photos: []
      })
    ]
  end
end
