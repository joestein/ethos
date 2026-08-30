defmodule Ethos.Seeds.AngelStadiumPlaces do
  @moduledoc """
  Seeds the places for the Angel Stadium guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Los Angeles Angels research artifact. A verdict vouches only
  for what its own `item` text restates.
  `docs/ballparks/angel-stadium.md` quotes each published sentence against the
  verdict it rests on, and records every omission.

  What the verification changed, and what is therefore absent here:

    * **Two `official_url` fields are `nil`.** The verifier's
      `could_not_establish` records that Honda Center's own site was never
      fetched in either pass, and that no working official site for the
      DigAlert Grove of Anaheim could be located at all. A URL neither pass
      confirmed is an unsourced claim in a field readers treat as
      authoritative, so neither is published — the wave-2 precedent set by
      Larimer Square.

    * **No trading claim for the Grove.** Its `status_verdict` is `uncertain`:
      no source outside the encyclopedia could be reached, every ticketing and
      listings site attempted was blocked or empty, and the domain the finder
      tried does not resolve. Uncertain is not closed, and no closure is
      asserted.

    * **No parking entrances, and no Lexus Lot perk.** That whole item is
      `refuted`. Only confirmed verdicts ship here, so nothing from it does —
      not the entrance names the verifier's reason says reproduce, and not the
      corrected form of the perk.

  **The venue name is "Angel Stadium", and the fuller form is published as what
  the verdict says it is.** A confirmed verdict quotes the December 29, 2003
  announcement that the ballpark "would be known as Angel Stadium (in full,
  Angel Stadium of Anaheim)", and the verifier records that the two are one
  unchanged name rather than a later renaming. Which form is currently
  preferred for formal use is a `could_not_establish`, and the record says so.

  The county on every record is `"Orange County"`, from a confirmed verdict
  citing the encyclopedia article on Anaheim, which states the county by name:
  *"Anaheim, California is a city in northern Orange County, California, United
  States"*.
  """

  alias Ethos.Places

  @anaheim %{town: "Anaheim", state: "California", county: "Orange County"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@anaheim, %{
        slug: "angel-stadium-anaheim",
        name: "Angel Stadium",
        kind: "stadium",
        address: "2000 Gene Autry Way, Anaheim, California 92806",
        official_url: "https://www.mlb.com/angels/ballpark",
        summary:
          "The home ballpark of the Los Angeles Angels, at 2000 Gene Autry Way in Anaheim, and the club's home since it opened on April 19, 1966. It is nicknamed \"The Big A\". The encyclopedia article's opening sentence reads \"Angel Stadium (originally and colloquially known as Anaheim Stadium) is a ballpark in Anaheim, California\", and the ballpark also housed the NFL's Los Angeles Rams from 1980 to 1994. On February 6, 2025 the Angels extended their lease to play there through 2032. Which of \"Angel Stadium\" and \"Angel Stadium of Anaheim\" is the more precise current form for formal use could not be established by this research; MLB.com's own channels use the shorter form throughout.",
        history:
          "Ground was broken on August 31, 1964 and the ballpark opened on April 19, 1966, at an original construction cost of about $24 million. It was known as Anaheim Stadium from 1966 to 1997, then as Edison International Field of Anaheim from 1998 to 2003 under a naming-rights deal with the utility company; on December 29, 2003 the Angels announced that from then on the stadium would be known as Angel Stadium, in full Angel Stadium of Anaheim, the name it has carried since. A $118 million renovation between the 1997 and 1998 seasons returned the stadium to a baseball-only facility, removing football-era infrastructure and adding outfield bleachers and the \"California Spectacular\" — geysers and a stream cascading down an artificial rock mountainside with real trees, behind the left-center-field fence — completed in time for the 1998 season. The franchise was founded in 1961 as the Los Angeles Angels, renamed California Angels in 1965 ahead of the move to Anaheim, Anaheim Angels in 1997 following Disney's acquisition of the club, Los Angeles Angels of Anaheim in 2005 under owner Arte Moreno, retaining \"of Anaheim\" to satisfy the team's lease with the city, and reverted to Los Angeles Angels in 2016 while continuing to play at Angel Stadium in Anaheim.",
        photos: []
      }),
      Map.merge(@anaheim, %{
        slug: "honda-center-anaheim",
        name: "Honda Center",
        kind: "attraction",
        address: "2695 East Katella Avenue, Anaheim, California",
        official_url: nil,
        summary:
          "An arena on East Katella Avenue, the home of the NHL's Anaheim Ducks, which the league's own Ducks site currently names as the team's arena. The encyclopedia article states that Honda Center \"lies northeast across California State Route 57 from Angel Stadium\". No zip code for the Katella Avenue address was stated by any source this research reached, and the arena's own site was not fetched in either pass, so no official URL is published here.",
        history:
          "The arena opened on June 17, 1993, with a Barry Manilow concert on June 19, 1993 as its first event — the two dates are the source article's own, and it is not internally consistent on the point. It was named Anaheim Arena during construction. It hosted the 2003 Stanley Cup Final, and the Ducks won their first Stanley Cup there on June 6, 2007, defeating the Ottawa Senators 6-2.",
        photos: []
      }),
      Map.merge(@anaheim, %{
        slug: "digalert-grove-of-anaheim",
        name: "DigAlert Grove of Anaheim",
        kind: "theater",
        address: "2200 East Katella Avenue, Anaheim, California",
        official_url: nil,
        summary:
          "A 1,700-capacity music venue on East Katella Avenue, which the encyclopedia states \"sits on the northwest corner of the parking lot of Angel Stadium of Anaheim, home of Major League Baseball's Los Angeles Angels\". It opened in 1998 as \"Tinseltown\", an awards-show-themed restaurant and venue, then became \"The Sun Theatre\", then \"The Grove of Anaheim\". On January 24, 2011 it became \"City National Grove of Anaheim\" under a five-year, $1.25 million naming-rights deal with City National Bank. The article, in the version dated August 4, 2026, gives its current name as \"DigAlert Grove of Anaheim\". That name rests on a single source: no independent, non-encyclopedia confirmation of it could be reached, no working official site for the venue could be located, no zip code for the address was stated, and no dated third-party source confirming that the venue is operating today could be reached either.",
        history: nil,
        photos: []
      })
    ]
  end
end
