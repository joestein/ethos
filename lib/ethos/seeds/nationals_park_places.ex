defmodule Ethos.Seeds.NationalsParkPlaces do
  @moduledoc """
  Seeds the places for the Nationals Park guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Washington Nationals research artifact, or the text a
  `refuted` verdict's correction supplies.
  `docs/ballparks/nationals-park.md` quotes each published sentence against the
  verdict it rests on.

  **These places hang from the node
  `united-states/district-of-columbia/washington`** — the city Washington under
  the region District of Columbia, a two-name repetition that is correct rather
  than a mistake. A confirmed verdict establishes that the District has no
  counties: Congress abolished Washington County in 1871, and no county tier is
  modelled here for it or for any other ballpark.

  What the verification changed, and what is therefore absent here:

    * **"Adjacent to Maxwell Park" is gone from Albi's record.** That clause
      was refuted; the correction gives the publishable form, which places the
      restaurant by its street address and its neighbourhood and says nothing
      about what it stands beside.

    * **The Navy Yard is the Navy's oldest shore establishment, not its
      "longest continuously operated federal facility"**, and its National
      Register listing is dated June 19, 1973 rather than the bare year. Both
      come from the correction on a refuted verdict.

    * **No awards are named for The Yards Park.** Its source mentions design
      and urban-planning awards generically and names none, and
      `could_not_establish` records that. A generic gesture at awards is not
      an award.

    * **No hours and no menu for Albi; no admission hours or day-pass
      procedure for the Navy museum; no parking price for the ballpark.** Each
      is a stated gap in the artifact, and each is stated here.

  Albi's Michelin star and Michael Rafidi's James Beard Culinary Award ship,
  because a confirmed verdict carries both. The rule bans awards a verdict does
  not carry, not awards it does.

  No trip duration appears anywhere, and no distance between two places.
  """

  alias Ethos.Places

  @dc %{destination_path: "united-states/district-of-columbia/washington"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@dc, %{
        slug: "nationals-park",
        name: "Nationals Park",
        kind: "stadium",
        address: "1500 South Capitol Street SE, Washington, D.C.",
        official_url: "https://www.mlb.com/nationals/ballpark",
        summary:
          "The home ballpark of the Washington Nationals, at 1500 South Capitol Street SE in the Navy Yard neighborhood of Southeast Washington, along the Capitol Riverfront. It opened on March 22, 2008 with a current capacity of 41,373. HOK Sport and Devrouax & Purnell Architects and Planners were the architects, and it has carried the Nationals Park name since opening, with no corporate naming rights on the facility itself.",
        history:
          "Groundbreaking was on May 4, 2006 and the stadium was completed in 2008 by an expedited design-build approach. Construction cost $693 million, of which $135 million was upfront taxpayer funds and about $535 million was financed through municipal bonds; a further $84.2 million went on transportation, art and infrastructure, bringing the total to $783.9 million. The ballpark hosted the 2018 Major League Baseball All-Star Game, Games 3, 4 and 5 of the 2019 World Series, and the 2015 NHL Winter Classic. Statues of Walter Johnson, Frank Howard and Josh Gibson stand there, honoring the original Washington Senators, the expansion Senators and the Negro league Homestead Grays, and a Ring of Honor celebrates Hall of Famers from those franchises and from the Montreal Expos.",
        photos: []
      }),
      Map.merge(@dc, %{
        slug: "albi-washington-dc",
        name: "Albi",
        kind: "restaurant",
        address: "1346 4th Street SE, Washington, D.C. 20003",
        official_url: nil,
        summary:
          "A restaurant at 1346 4th Street SE in the Navy Yard and Capitol Riverfront neighborhood, serving Levantine and Palestinian cuisine under the chef-owner Michael Rafidi. It has received a Michelin star, and Rafidi won a James Beard Culinary Award reported on June 13, 2024. It was established in February 2020, and an April 2025 report of a recent renovation is the most recent evidence of its operation the research reached. Its current hours and menu were not established and are not published here.",
        history: nil,
        photos: []
      }),
      Map.merge(@dc, %{
        slug: "the-yards-park-dc",
        name: "The Yards Park",
        kind: "park",
        address: "355 Water Street SE, Washington, D.C.",
        official_url: nil,
        summary:
          "A 42-acre waterfront park along the Anacostia River, designed by the landscape architect M. Paul Friedberg and opened in 2010. Forest City Washington developed it after the General Services Administration awarded the property in 2004, and it is now operated by the Capitol Riverfront Business Improvement District. Its source refers generically to design and urban-planning awards without naming any, so none is named here.",
        history: nil,
        photos: []
      }),
      Map.merge(@dc, %{
        slug: "national-museum-of-the-united-states-navy",
        name: "National Museum of the United States Navy",
        kind: "museum",
        address: "736 Sicard St SE, Washington, D.C. 20374",
        official_url: nil,
        summary:
          "A museum in Building 76 of the Washington Navy Yard, the former Breech Mechanism Shop of the old Naval Gun Factory. Because it sits on an active military installation, visitors must present valid government or military credentials, be accompanied by someone who has them, or apply for a day pass at the on-site visitors' center. Its current admission hours and the details of the day-pass procedure were not established by the research and are not published here.",
        history:
          "The Washington Navy Yard, on which the museum sits, is described as the oldest shore establishment of the United States Navy, established in 1799 and in use since. It was added to the National Register of Historic Places on June 19, 1973 and designated a National Historic Landmark on May 11, 1976.",
        photos: []
      })
    ]
  end
end
