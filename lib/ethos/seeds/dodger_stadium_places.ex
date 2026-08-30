defmodule Ethos.Seeds.DodgerStadiumPlaces do
  @moduledoc """
  Seeds the places for the Dodger Stadium guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Los Angeles Dodgers research artifact, or the text a
  `refuted` verdict's correction supplies. `docs/ballparks/dodger-stadium.md`
  quotes each published sentence against the verdict it rests on.

  **Three places, and that is the whole of it.** This artifact researched two
  places beside the ballpark. The ballpark itself has no `places` entry in the
  artifact at all; its record is built from the confirmed `identity` and
  `history` verdicts, which carry its name, address, neighbourhood, county and
  construction. Nothing is padded to make a longer set — the corpus's content
  gate has no length floor precisely because a floor manufactures filler.

  What the verification changed, and what is therefore absent here:

    * **No quotation from Stan Kasten or Dodgers ownership.** The finder
      attributed "will never be for sale" to them about the stadium's name;
      the verifier found it in neither cited source and refuted it. The
      correction's publishable form — the stadium's own name is unchanged, the
      2026 Uniqlo deal covers only the playing field, and it is the first
      naming-rights agreement in the stadium's 60-plus-year history — is what
      ships.

    * **Elysian Park names no administering department.** Its
      `status_verdict` correction requires either dropping the department name
      or citing it to a source that states it, and discoverlosangeles.com does
      not. The record says the park is a public one and stops.

    * **No `official_url` for Elysian Park.** laparks.org returned HTTP 403 on
      every attempt, so nothing establishes the page, its amenities or its
      hours. An unreachable domain is not a verified one.

    * **No `official_url` for the ballpark.** The one MLB URL in the artifact
      is cited for the club's existence, not as the venue's page.

    * **Philippe's superlative is the verifier's, not the restaurant's.** The
      finder cited "the longest continuously operating restaurant in Los
      Angeles"; the article marks that as the restaurant's own claim, and the
      correction directs the lead sentence instead: continuously operating
      since 1908, making it one of the oldest restaurants in Los Angeles. The
      "French Dipped Sandwich" origin is likewise published as the
      restaurant's claim, because the verdict says the source restates it as a
      claim rather than an established fact.

  No trip duration appears anywhere, and no distance between two places. Where
  a source states a spatial relationship — Angels Point overlooking the
  stadium, Philippe's at the edge of Chinatown — that sourced wording is what
  is published.
  """

  alias Ethos.Places

  @los_angeles %{town: "Los Angeles", state: "California", county: "Los Angeles County"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@los_angeles, %{
        slug: "dodger-stadium",
        name: "Dodger Stadium",
        kind: "stadium",
        address: "1000 Vin Scully Avenue, Los Angeles, CA",
        official_url: nil,
        summary:
          "The home ballpark of the Los Angeles Dodgers, at 1000 Vin Scully Avenue in the Elysian Park neighborhood of Los Angeles. Its own name is unchanged: in 2026 the club signed a naming-rights deal with Uniqlo covering only the playing field, branded \"Uniqlo Field at Dodger Stadium\", the first naming-rights agreement in the stadium's 60-plus-year history. A large terraced parking area is built behind the main stands, at elevations that let ticket holders park at roughly the level of their seats.",
        history:
          "Ground was broken on September 17, 1959 and the stadium opened on April 10, 1962, built in under three years at a cost of about $23 million; it was the first Major League Baseball stadium since the construction of the original Yankee Stadium to be built with 100% private financing. Extensive renovations took place in 2012 and 2013 under new ownership, including HD video boards and facility upgrades. The ground it stands on has a contested history. The Chavez Ravine land was acquired by the City of Los Angeles using eminent domain under the Housing Act of 1949, for a planned public-housing project; after the 1953 election of mayor Norris Poulson, political support for that project collapsed, and following a June 3, 1958 municipal referendum approving a baseball-related land transfer, the Dodgers acquired the property. The displacement of the largely Spanish-speaking residents who had refused to sell became known as the \"Battle of Chavez Ravine\".",
        photos: []
      }),
      Map.merge(@los_angeles, %{
        slug: "elysian-park",
        name: "Elysian Park",
        kind: "park",
        address: "835 Academy Rd, Los Angeles, CA 90012",
        official_url: nil,
        summary:
          "A public park of 600 acres, created by Los Angeles city ordinance on April 5, 1886 and sponsored by the city engineer George Hansen at a time when the city had few other parks. The site had been considered worthless land and was originally part of the Spanish land grant for the Pueblo of Los Angeles. Angels Point, a hill within the park, overlooks Dodger Stadium and the downtown Los Angeles skyline. The Chavez Ravine Arboretum, also within the park, opened in 1893 and contains more than 100 varieties of trees from around the world. Its current visitor amenities and hours could not be confirmed: the official parks page returned HTTP 403 on every attempt, and neither is published here.",
        history:
          "Parts of Elysian Park were swapped for other lands held by the Los Angeles Dodgers when Dodger Stadium was built.",
        photos: []
      }),
      Map.merge(@los_angeles, %{
        slug: "philippe-the-original",
        name: "Philippe The Original",
        kind: "restaurant",
        address: "1001 N. Alameda Street, Los Angeles, CA 90012",
        official_url: "https://www.philippes.com/",
        summary:
          "A restaurant at 1001 N. Alameda Street, at the edge of Chinatown, continuously operating since 1908 and one of the oldest restaurants in Los Angeles. It serves French-dipped sandwiches — roast beef, pork, lamb, turkey, pastrami or ham on a French roll dipped in gravy — along with breakfast, soups, chili, salads and desserts. It claims to have created the French Dipped Sandwich; that is the restaurant's own claim, restated by its encyclopedia entry as a claim rather than as an established fact, and it is published here on the same terms. Philippe's appears on the James Beard Foundation's list of America's Classics.",
        history:
          "Philippe Mathieu, a French immigrant, established the restaurant in 1908 at 300 N. Alameda Street. It has been owned and operated by the Martin and Binder families since 1927, and moved to its current Alameda Street location in 1951 after the original site was displaced by Hollywood Freeway construction.",
        photos: []
      })
    ]
  end
end
