defmodule Ethos.Seeds.DaikinParkPlaces do
  @moduledoc """
  Seeds the places for the Daikin Park guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates text a `confirmed` verdict in the
  2026-08-30 Houston Astros research artifact carries, or that the verifier's
  own reason or correction expressly states was confirmed. A finder's refuted
  item never ships as written. `docs/ballparks/daikin-park.md` quotes each
  published sentence against the verdict it rests on, and records every
  omission.

  **The venue is Daikin Park.** It was renamed effective January 1, 2025, from
  Minute Maid Park, and the naming-rights agreement runs through 2039. Two
  confirmed verdicts establish it, and a third piece of evidence is worth
  recording because it is what settles the trading status too: Houston METRO's
  own route guide lists the stop as "Daikin Park", which is a government
  operator independently using the current name. Harris County's own website
  still lists the venue as Minute Maid Park, and the verdict that cites the
  county site says so on its face.

  What the verification changed, and what is therefore absent here:

    * **No named performance spaces at House of Blues Houston.** The verifier
      searched the cited article's full text twice and found none of the three
      names the finder gave, "for Houston or any other House of Blues
      location". The address, the 2008 opening and the 1,800 capacity, which
      the same reason states are confirmed, do ship.

    * **No three-founder account of The Heritage Society.** That item is
      `refuted`, and substantively: the Society was founded by twelve people,
      not the three the finder named, and it took over the park's middle
      section in 1959 rather than at its 1954 founding. The verifier's
      corrected account, which it checked against the Society's own about-us
      page and against the park's encyclopedia article, is what ships.

    * **No trading claim for four of the seven places.** Kennedy Bakery, Sam
      Houston Park's Heritage Society, House of Blues Houston and the Downtown
      Aquarium all rest on their own operators' pages for current operation,
      which cannot establish it. Uncertain is not closed, and no closure is
      asserted. Market Square Park and Discovery Green are public parks, where
      the question does not arise.

    * **Two `official_url` fields are `nil`.** Neither House of Blues Houston's
      nor the Downtown Aquarium's own site was fetched by either pass; both
      records rest on the encyclopedia. A URL neither pass confirmed is an
      unsourced claim in a field readers treat as authoritative.

  The county on every record is `"Harris County"`, and not from the source the
  finder first cited for it. See `Ethos.Seeds.DaikinParkGuide`.
  """

  alias Ethos.Places

  @houston %{town: "Houston", state: "Texas", county: "Harris County"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@houston, %{
        slug: "daikin-park",
        name: "Daikin Park",
        kind: "stadium",
        address: "501 Crawford Street, Houston, Texas 77002",
        official_url: "https://www.mlb.com/astros/ballpark",
        summary:
          "The home ballpark of the Houston Astros, at 501 Crawford Street in Houston. It opened in 2000 — an exhibition game on March 30 and the regular season on April 7 — on the site of the historic Union Station, part of which is incorporated into the stadium: the former station's main concourse now holds a clubhouse, a cafe, a team store and office space. It replaced the Astrodome. It has a retractable roof, a current capacity of 41,168, and was designed by HOK Sport, now Populous. The Astros play in Major League Baseball's American League West division, and have since the 2013 realignment moved them from the National League Central.",
        history:
          "Original construction cost was approximately $250 million. The ballpark has carried four names. It opened as Enron Field in 2000; by February 27, 2002 the two parties agreed to end those naming rights and it became Astros Field, from February to July 2002; Minute Maid bought the naming rights later in 2002 and held them until 2025; and on January 1, 2025 the stadium was renamed Daikin Park, under an agreement running through 2039. The franchise was established in 1962 as the Houston Colt .45s, a National League expansion team, and on December 1, 1964 announced the change of name to the Astros, reflecting Houston's role in the American space program. The Astros won the World Series in 2017, against the Los Angeles Dodgers, and again in 2022, against the Philadelphia Phillies.",
        photos: []
      }),
      Map.merge(@houston, %{
        slug: "market-square-park-houston",
        name: "Market Square Park",
        kind: "park",
        address: "301 Milam Street, Houston, Texas 77002",
        official_url: "https://downtownhouston.org/go/market-square-park",
        summary:
          "A public park at 301 Milam Street, on the site of Houston's original city hall and, later, a parking lot. It reopened in its current form in 2010 after a major renovation led by Downtown Houston+, formerly Central Houston, with the City of Houston Parks and Recreation Department. It holds a 25-foot-tall sculpture, \"Points of View\" by the Texas artist James Surls, dedicated in 1992, and is open daily from 6am to 11pm.",
        history: nil,
        photos: []
      }),
      Map.merge(@houston, %{
        slug: "kennedy-bakery-la-carafe",
        name: "Kennedy Bakery (La Carafe)",
        kind: "historic-site",
        address: "813 Congress Street, Houston, Texas",
        official_url: nil,
        summary:
          "The Kennedy Bakery building at 813 Congress Street, in the Main Street/Market Square Historic District, built in 1860 by the Irish-born baker John Kennedy, who arrived in Texas in 1842, and described as probably the oldest Houston building on its original site. It was added to the National Register of Historic Places on July 27, 1979 and designated a Recorded Texas Historic Landmark in 1981.",
        history:
          "By 1873 Kennedy's building operated as a drug store, and various druggists were tenants through 1932. In 1970 ownership passed to William V. Berry, who opened La Carafe there; the source describes it as one of the oldest bars operating in Houston as of 2012, and that dated hedge is kept rather than carried forward into the present tense. No source outside the building's own recorded history establishes whether it is trading today.",
        photos: []
      }),
      Map.merge(@houston, %{
        slug: "sam-houston-park-heritage-society",
        name: "Sam Houston Park / The Heritage Society",
        kind: "museum",
        address: "1100 Bagby Street, Houston, Texas 77002",
        official_url: "https://www.heritagesociety.org/",
        summary:
          "Houston's first public park, at 1100 Bagby Street, whose land was acquired around 1900 by the then-mayor Samuel H. Brashear, who had appointed the city's first park committee in 1899. It holds ten historic structures spanning pre-Texas-Revolution times to 1891, among them the Kellum-Noble House of 1847, Houston's oldest brick dwelling, the Nichols-Rice-Cherry House of about 1850, and St. John Church, an 1891 building relocated to the park in 1968.",
        history:
          "The Heritage Society was founded in 1954 by twelve Houstonians — among them Faith Bybee, Harvin C. Moore Sr., Marie Lee Phelps and Ima Hogg — and took over management of the middle section of Sam Houston Park in 1959, five years after its founding. The society's own site states museum gallery and historic house tour hours of Tuesday to Saturday, 10 a.m. to 4 p.m. That is the society's own account of itself, which cannot establish that it is operating today, and no independent source could be reached that does.",
        photos: []
      }),
      Map.merge(@houston, %{
        slug: "discovery-green",
        name: "Discovery Green",
        kind: "park",
        address: "1500 McKinney Street, Houston, Texas 77010",
        official_url: "https://www.discoverygreen.com/",
        summary:
          "A 12-acre park at 1500 McKinney Street, open daily from 6am to 11pm and run by the Discovery Green Conservancy, a 501(c)(3) nonprofit, which states that more than 600 free events are held there every year.",
        history:
          "The park opened on April 13, 2008. The City of Houston acquired part of the land in 2002 and purchased the remainder in 2004. Design was led by Hargreaves Associates, and the $125 million project drew philanthropic funding including $10 million from the Kinder Foundation. It earned LEED Gold certification in October 2009.",
        photos: []
      }),
      Map.merge(@houston, %{
        slug: "house-of-blues-houston",
        name: "House of Blues Houston",
        kind: "theater",
        address: "1204 Caroline Street, Houston, Texas 77002",
        official_url: nil,
        summary:
          "A live-music venue at 1204 Caroline Street, opened in 2008, with a capacity of 1,800. Nothing else about it is published: the item that described its performance spaces named three that the verifier could not find anywhere in the cited article, and no source independent of the venue's own operator was reached, so no statement is made about whether it is operating today. No official website is published, because neither research pass fetched one.",
        history: nil,
        photos: []
      }),
      Map.merge(@houston, %{
        slug: "downtown-aquarium-houston",
        name: "Downtown Aquarium",
        kind: "attraction",
        address: "410 Bagby Street, Houston, Texas 77002",
        official_url: nil,
        summary:
          "A for-profit aquarium and restaurant complex at 410 Bagby Street, operated by Landry's, Inc., opened in 2003 on a 6-acre site that redeveloped the former Fire Station No. 1 and the city's Central Waterworks Building. It is accredited by the Association of Zoos and Aquariums. It houses over 200 species of aquatic animals across themed exhibits including a Louisiana Swamp, a shipwreck-themed area and a Sunken Temple, and its 110,000-gallon centerpiece aquarium is described by the encyclopedia as the largest cylindrical tank in the United States. It also has a train ride through a shark habitat, a Ferris wheel and a carousel. No source independent of the operator was reached for its current operating status, and none is claimed. No official website is published, because neither research pass fetched one.",
        history: nil,
        photos: []
      })
    ]
  end
end
