defmodule Ethos.Seeds.TargetFieldPlaces do
  @moduledoc """
  Seeds the places for the Target Field guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Minnesota Twins research artifact, or the text a `refuted`
  verdict's correction names as publishable.
  `docs/ballparks/target-field.md` quotes each published sentence against the
  verdict it rests on, and records every omission — **including a note on this
  artifact's unusual shape**, which adjudicates each place's *status* and its
  `could_not_establish` list but carries no per-item verdicts on the place
  facts themselves. That difference is recorded there rather than papered over.

  What the verification changed, and what is therefore absent here:

    * **The canopy is not heated.** The identity verdict was refuted on that one
      clause: the source states "a canopy above the top deck" and, separately,
      "heated viewing areas and a heated field", as two distinct features. The
      correction's wording — canopy over the upper deck, heated viewing areas,
      heated field — is what ships.

    * **No adjacency between the ballpark and the parking ramps.** The finder
      wrote that Target Field is "immediately next to" the ABC Ramps; the
      verifier refuted it as vague proximity even though the source itself uses
      "immediately adjacent to", because no source gives a measured distance.
      The correction supplies each ramp's own street address instead, and those
      addresses are what the guide carries.

    * **No self-sourced award or superlative, anywhere.** Four were struck, all
      resting on a business's own site: Bar La Grassa's James Beard Award, Black
      Sheep's "first coal-burning pizza restaurant in Minnesota" and "Award
      Winning Pizza", and The Freehouse's Great American Beer Festival medals.
      Spoon and Stable's awards do ship, because they come from an independent
      encyclopedia article about the chef rather than from the restaurant.

    * **No 2026 seating capacity for the ballpark.** `could_not_establish` says
      no fetched source gave a capacity dated to the current season, so no
      capacity figure is published at all.

    * **No unbroken history claim for Kieran's Irish Pub.** Its own site says it
      has operated in downtown Minneapolis for over 30 years; the verifier
      flagged an unresolved question about whether this address is the same
      business as an earlier downtown location reported closed in 2020, and
      directed that the site's claim be published as the site's claim and not
      extended. It is published that way, with the open question stated.

  Six of the eleven places carry no trading claim. Uncertain is not closed: no
  closure has positive evidence and none is asserted.
  """

  alias Ethos.Places

  @minneapolis %{destination_path: "united-states/minnesota/minneapolis"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@minneapolis, %{
        slug: "target-field",
        name: "Target Field",
        kind: "stadium",
        address: "1 Twins Way, Minneapolis, MN",
        official_url: "https://www.mlb.com/twins/ballpark",
        summary:
          "The home ballpark of the Minnesota Twins, at 1 Twins Way in the Warehouse District of downtown Minneapolis. It opened on April 12, 2010, when the Twins played and won their inaugural game there against the Boston Red Sox. It is an open-air, natural-turf, baseball-only ballpark with no retractable roof, built with local limestone, with a canopy over the upper deck, heated viewing areas and a heated field. No source fetched for this research gave a seating capacity dated to the current season, so none is published here.",
        history:
          "Target Field replaced the Hubert H. Humphrey Metrodome as the Twins' home, and the club signed a 30-year lease for it. It hosted the 2014 Major League Baseball All-Star Game on Tuesday, July 15, 2014. The Twins themselves relocated to Minnesota from Washington, D.C. in 1961 and have played under the name Minnesota Twins continuously since. The ballpark opened in 2010 on the southwest edge of the North Loop, commonly known as the Warehouse District, which was historically Minneapolis's main commercial shipping hub.",
        photos: []
      }),
      Map.merge(@minneapolis, %{
        slug: "guthrie-theater",
        name: "Guthrie Theater",
        kind: "theater",
        address: "818 South 2nd Street, Minneapolis, MN",
        official_url: nil,
        summary:
          "A theater at 818 South 2nd Street. The Guthrie opened on May 7, 1963 with a production of Hamlet, in an original building designed by Ralph Rapson. The current facility, completed in 2006, was designed by the French architect Jean Nouvel; it includes a 178-foot cantilevered \"Endless Bridge\" toward the Mississippi River, accessible during regular building hours, and contains three performance spaces seating 1,100, 700 and 199. The most recent season lineup this research reached was 2024-2025, which is not a statement about 2026, so no claim is made here about whether the theater is currently operating.",
        history: nil,
        photos: []
      }),
      Map.merge(@minneapolis, %{
        slug: "mill-city-museum",
        name: "Mill City Museum",
        kind: "museum",
        address: "704 South 2nd Street, Minneapolis, MN",
        official_url: nil,
        summary:
          "A museum at 704 South 2nd Street, operated by the Minnesota Historical Society, which opened in 2003 inside the ruins of the former Washburn \"A\" Mill flour mill. Its exhibits cover Minneapolis history and flour milling and include the interactive \"Flour Tower\". No source fetched for this research states a current operating status, so none is given.",
        history: nil,
        photos: []
      }),
      Map.merge(@minneapolis, %{
        slug: "stone-arch-bridge-minneapolis",
        name: "Stone Arch Bridge",
        kind: "historic-site",
        address: "Crosses the Mississippi River at Saint Anthony Falls, downtown Minneapolis, MN",
        official_url: nil,
        summary:
          "A stone arch bridge across the Mississippi River at Saint Anthony Falls, with 21 stone arch spans plus one steel-deck truss span, 2,100 feet long. It is the only arched bridge made of stone on the entire Mississippi River. It was converted to a pedestrian and bicycle pathway in 1994, added to the National Register of Historic Places in 1971, and given National Historic Civil Engineering Landmark designation in 1974. It hosts events including the Stone Arch Festival of the Arts on Father's Day weekend and Fourth of July fireworks.",
        history:
          "The railroad tycoon James J. Hill commissioned the bridge in 1881 for his Great Northern Railway, and the engineer Col. Charles C. Smith designed it to avoid damaging the sandstone at Saint Anthony Falls. Construction took 22 months and completed in 1883 at a cost of about $650,000. It was initially nicknamed \"Hill's Folly\".",
        photos: []
      }),
      Map.merge(@minneapolis, %{
        slug: "gold-medal-park",
        name: "Gold Medal Park",
        kind: "park",
        address: "Downtown East neighborhood, Minneapolis, MN",
        official_url: nil,
        summary:
          "A 7.5-acre park in Minneapolis's Downtown East neighborhood, opened in May 2007 to a design by the landscape architect Tom Oslund. It has a 32-foot-high mound reached by a spiral walkway, about 300 trees, and specially designed luminescent benches, and it is named after the Gold Medal flour brand. It hosts public sculptures from the Walker Art Center collection, including works by Mark di Suvero and Tony Cragg.",
        history:
          "The park was originally owned jointly by the City of Minneapolis and the Guthrie Theater. In 2014 the Gold Medal Park Conservancy purchased the majority of the Guthrie-owned parkland and secured a 50-year lease for the rest.",
        photos: []
      }),
      Map.merge(@minneapolis, %{
        slug: "target-center",
        name: "Target Center",
        kind: "attraction",
        address: "600 First Avenue North, Minneapolis, MN",
        official_url: nil,
        summary:
          "An arena at 600 First Avenue North that opened on October 13, 1990. It is the home arena of the NBA's Minnesota Timberwolves and the WNBA's Minnesota Lynx, and it also hosts concerts and other events. The City of Minneapolis owns it and Legends Global manages it.",
        history:
          "Target Center underwent a $140 million renovation completed in October 2017, addressing the exterior, the seating and the technology.",
        photos: []
      }),
      Map.merge(@minneapolis, %{
        slug: "bar-la-grassa",
        name: "Bar La Grassa",
        kind: "restaurant",
        address: "800 Washington Avenue North, Minneapolis, MN",
        official_url: "https://www.barlagrassa.com/",
        summary:
          "An Italian restaurant at 800 Washington Avenue North, established by the chef Isaac Becker and Nancy St. Pierre, according to the restaurant's own site. That site is the only source this research reached for it, and it cannot establish either that the restaurant is currently trading or the award it attributes to its chef, so neither is stated here.",
        history: nil,
        photos: []
      }),
      Map.merge(@minneapolis, %{
        slug: "black-sheep-coal-fired-pizza-north-loop",
        name: "Black Sheep Coal Fired Pizza",
        kind: "restaurant",
        address: "600 Washington Ave, Minneapolis, MN",
        official_url: "https://www.blacksheeppizza.com/",
        summary:
          "A pizza restaurant at 600 Washington Avenue in Minneapolis's North Loop, serving coal-fired pizza, salads, appetizers, desserts and craft cocktails. Its own site states that it uses anthracite coal in ovens reaching at least 1,200 degrees. That site is the only source this research reached for it, so no claim about current trading and no award or ranking is stated here.",
        history: nil,
        photos: []
      }),
      Map.merge(@minneapolis, %{
        slug: "the-freehouse",
        name: "The Freehouse",
        kind: "brewery",
        address: "701 N Washington Ave #101, Minneapolis, MN 55401",
        official_url: "https://www.freehousempls.com/",
        summary:
          "A restaurant and brewery at 701 North Washington Avenue, offering food service from breakfast through evening, according to its own site. That site is the only source this research reached for it, so neither its current trading status nor the brewing medals it lists is stated here.",
        history: nil,
        photos: []
      }),
      Map.merge(@minneapolis, %{
        slug: "spoon-and-stable",
        name: "Spoon and Stable",
        kind: "restaurant",
        address: "211 North First Street, Minneapolis, MN 55401",
        official_url: "https://www.spoonandstable.com/",
        summary:
          "A restaurant at 211 North First Street, in the North Loop neighborhood, which the chef Gavin Kaysen opened in November 2014 as his first restaurant. It was named 2015 Restaurant of the Year by Food & Wine and Best New Restaurant by Bon Appetit, and was a 2015 James Beard Award finalist for Best New Restaurant. No source independent of the restaurant states a current operating status, so none is given.",
        history: nil,
        photos: []
      }),
      Map.merge(@minneapolis, %{
        slug: "kierans-irish-pub",
        name: "Kieran's Irish Pub",
        kind: "restaurant",
        address: "85 N 6th St, Minneapolis, MN 55403",
        official_url: "https://kierans.com/",
        summary:
          "An Irish pub at 85 North 6th Street, part of the Cara Irish Pubs restaurant group. Its own site states that it has operated as an Irish pub in downtown Minneapolis for over 30 years and that it hosts game-day watch parties, including for Minnesota Lynx games. One thing this research could not settle: whether this address is the same Kieran's Irish Pub as an earlier downtown Minneapolis location that a 2020 news report — referenced during the research but not itself fetched — suggested had closed that year. The site's own claim is published as its own claim, and no unbroken history at this address is asserted.",
        history: nil,
        photos: []
      })
    ]
  end
end
