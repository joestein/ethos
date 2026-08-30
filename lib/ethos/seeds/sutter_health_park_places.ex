defmodule Ethos.Seeds.SutterHealthParkPlaces do
  @moduledoc """
  Seeds the places for the Sutter Health Park guide. Idempotent:
  `upsert_all!/0` upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Athletics research artifact, or the text a `refuted` verdict's
  correction supplies. `docs/ballparks/sutter-health-park.md` quotes each
  published sentence against the verdict it rests on.

  **The club has no city name.** Confirmed verdicts establish that the team was
  the Oakland Athletics through 2024 and became simply "Athletics", with no
  city prefix, on relocating to West Sacramento for the 2025 season, and that
  both its own site and the encyclopedia use that bare name. The tenancy is
  temporary: a further confirmed verdict records the 2025-2027 term at this
  ballpark, with an option for a fourth year, while a Las Vegas ballpark is
  built.

  What the verification changed, and what is therefore absent here:

    * **One record does not ship at all: Mill Street Pier.** Its address
      `could not be established`, and its only source is a single
      tourism-bureau line. A place whose address is unestablished has nothing
      left to publish, which is the ruling that dropped The Park at Wrigley
      from the checkpoint. It is named in the guide's prose rather than
      quietly omitted.

    * **The "Oakland Athletics" naming discrepancy is refuted and gone.** The
      finder flagged the ballpark's own site as still using the old name; on
      re-fetch the verifier found it uses "Athletics" consistently, like every
      other source. Flagging a discrepancy that does not exist is its own kind
      of error.

    * **River Walk Park's second source is not the city's.** The finder cited
      westsacramento.org as "the city tourism-adjacent site"; the correction
      establishes it is an independently run information site, run by an
      individual rather than by the city or a tourism bureau. That description
      and its quoted sentence are dropped in favour of the tourism bureau's.

    * **Three places carry no trading claim**: Drake's: The Barn, Bike Dog
      Brewing and Franquette. Each rests on the owner's own site plus a
      tourism itinerary, and neither is independent confirmation of current
      trading. Uncertain is not closed, and no closure is asserted.

  Tower Bridge's Streamline Moderne style ships, because a verdict states it.
  No trip duration appears anywhere, and no distance between two places.
  """

  alias Ethos.Places

  @west_sac %{town: "West Sacramento", state: "California", county: "Yolo County"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@west_sac, %{
        slug: "sutter-health-park",
        name: "Sutter Health Park",
        kind: "stadium",
        address: "400 Ballpark Drive, West Sacramento, CA 95691",
        official_url: "https://www.sutterhealthpark.com/",
        summary:
          "A ballpark at 400 Ballpark Drive, hosting the Sacramento River Cats and the Athletics. Total capacity is 14,014 — 10,624 fixed seats plus outfield grass berms — which makes it currently the smallest ballpark in Major League Baseball while it hosts the Athletics. That capacity is down from an original 14,611, after additions including a party deck in 2005 and a Diamond Club in 2010.",
        history:
          "The ballpark broke ground on October 28, 1999 and opened on May 15, 2000 as Raley Field, built for $46.5 million, about $86.9 million in 2025 dollars, with naming rights originally sold to Raley's supermarkets for $15 million over 20 years. It was renamed Sutter Health Park after the 2019 season, under a naming-rights agreement with the Sacramento-based Sutter Health. On April 4, 2024 it was announced that the Athletics would play here from 2025 through 2027, with an option for a fourth year, while a new Las Vegas ballpark is built; the team played its first home game here on March 31, 2025.",
        photos: []
      }),
      Map.merge(@west_sac, %{
        slug: "drakes-the-barn-west-sacramento",
        name: "Drake's: The Barn",
        kind: "brewery",
        address: "985 Riverfront St, West Sacramento, CA 95691",
        official_url: "https://drinkdrakes.com/the-barn/",
        summary:
          "A two-acre riverside beer garden and event space in West Sacramento's Bridge District, with a wood-fired pizza kitchen, rotating food trucks, over 40 taps of Drake's beers alongside cocktails and wine, fire pits and lawn games. Yolo County's tourism bureau names it as one of three West Sacramento breweries and restaurants in an itinerary. Neither that itinerary nor the owner's own site establishes current trading, and nothing here says whether it is open now.",
        history: nil,
        photos: []
      }),
      Map.merge(@west_sac, %{
        slug: "bike-dog-brewing-west-sacramento",
        name: "Bike Dog Brewing (West Sacramento taproom)",
        kind: "brewery",
        address: "2568 Industrial Blvd Suite 110, West Sacramento, CA 95691",
        official_url: "https://bikedogbrewing.com/west-sacramento-brewery/",
        summary:
          "A dog-friendly craft brewery taproom, open Tuesday to Sunday and closed on Mondays, hosting food trucks, cornhole and running-club events; the menu on the brewery's own site is dated March 2026. Yolo County's tourism bureau names it as a Bridge District brewery in an itinerary. Neither source establishes current trading, and nothing here says whether it is open now.",
        history: nil,
        photos: []
      }),
      Map.merge(@west_sac, %{
        slug: "franquette-west-sacramento",
        name: "Franquette",
        kind: "cafe",
        address: "965 Bridge Street, Suite 100, West Sacramento, CA 95691",
        official_url: "https://hellofranquette.com/",
        summary:
          "A French-inspired cafe and wine bar in West Sacramento's Bridge District, founded by Brad Cecchi and Clay Nutting, who previously worked at the restaurant Canon. Its stated hours are Monday 7am to 4pm, Tuesday to Friday 7am to 7pm, Saturday 8am to 7pm and Sunday 8am to 4pm, with weekend brunch service. Yolo County's tourism bureau describes it as serving casual French cuisine such as beef tartare and duck confit. Neither source establishes current trading, and nothing here says whether it is open now.",
        history: nil,
        photos: []
      }),
      Map.merge(@west_sac, %{
        slug: "tower-bridge-sacramento",
        name: "Tower Bridge",
        kind: "historic-site",
        address:
          "State Route 275 across the Sacramento River, between West Capitol Avenue, West Sacramento and Capitol Mall, Sacramento",
        official_url: nil,
        summary:
          "A vertical lift bridge carrying State Route 275 across the Sacramento River, connecting West Capitol Avenue in West Sacramento with Capitol Mall in downtown Sacramento, and carrying cars, bicycles and pedestrians. It is built in the Streamline Moderne style, which was unusual for a lift bridge of its era.",
        history:
          "The bridge was completed in 1935, replacing an 1911 swing bridge, and was dedicated by Governor Frank Merriam on December 15, 1935. The American Institute of Steel Construction recognized it in 1935, and it was listed on the National Register of Historic Places in 1982.",
        photos: []
      }),
      Map.merge(@west_sac, %{
        slug: "river-walk-park-west-sacramento",
        name: "River Walk Park",
        kind: "park",
        address: "West Sacramento riverfront, West Sacramento, CA",
        official_url: nil,
        summary:
          "A riverfront park with walking trails and public art, including a piece titled \"Subtile\" made of 34,000 stainless steel plates, and views of Tower Bridge and Old Sacramento. No street address from an authoritative source could be found for it: OpenStreetMap's geocoder places it at 651 Broderick, West Sacramento, at 38.5834, -121.5086, but that is a crowd-sourced result rather than a source with editorial authority, and it is recorded here as one rather than published as the park's address.",
        history: nil,
        photos: []
      })
    ]
  end
end
