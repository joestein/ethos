defmodule Ethos.Seeds.TMobileParkPlaces do
  @moduledoc """
  Seeds the places for the T-Mobile Park guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates text a `confirmed` verdict in the
  2026-08-30 Seattle Mariners research artifact carries, or that the verifier's
  own reason or correction expressly states was confirmed. A finder's refuted
  item never ships as written.
  `docs/ballparks/t-mobile-park.md` quotes each published sentence against the
  verdict it rests on, and records every omission.

  ## Four defects, three of one kind

  The verifier's summary of this artifact is worth restating because it shapes
  what the audit doc has to explain: three of the four defects are the same
  shape — *"a true, checkable fact attributed to a source that, on direct
  re-fetch, does not contain it"* — and the fourth is a vague-proximity clause.
  In each case the verifier re-established the fact on the source that does
  carry it, and that is the source this module publishes it on.

  The fourth is the one worth learning from. The finder wrote that Filson
  opened its flagship *"near the Mariners' ballpark"*, and the verifier refuted
  it: *"the source itself only says 'near' too, so the fix is not a better
  source, it is dropping the gesture and relying on the sourced address that
  the artifact already has."* The address ships; the gesture does not.

  ## What else is absent

    * **No figure for how long the retractable roof takes to operate.** It is
      confirmed and it is duration-shaped, and this corpus publishes no
      duration-shaped string. The roof's area and weight ship; the interval
      does not, and this moduledoc cannot quote it either.

    * **No trading claim for three of the eight places.** Smith Tower's
      visitor offering, Filson's flagship and Merchant's Cafe are all
      `uncertain`, each for a reason the record names. Uncertain is not closed,
      and no closure is asserted.

    * **No block count in the historic district's boundary description.** The
      source describes its northern edge as a short distance north of Yesler
      Way, in blocks; a direction-bearing block count is the banned
      vague-proximity form in this corpus, so the field carries the three
      precise bounds and the summary says what the fourth is.

  **`lumen-field` carries `kind: "attraction"` rather than `stadium`.** In the
  ballparks region that kind is the set's roster key —
  `test/ethos/seeds/ballpark_seed_data_test.exs` asserts the region's `stadium`
  places are exactly the thirty rostered MLB venues. A schema constraint, not a
  claim: the prose calls it a stadium.

  The county on every record is `"King County"`, from three confirmed verdicts
  on three independent sources: the encyclopedia's T-Mobile Park article, an
  independent ballpark directory, and OpenStreetMap's geocoder.
  """

  alias Ethos.Places

  @seattle %{town: "Seattle", state: "Washington", county: "King County"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@seattle, %{
        slug: "t-mobile-park",
        name: "T-Mobile Park",
        kind: "stadium",
        address: "1250 First Avenue South, Seattle, Washington 98134",
        official_url: nil,
        summary:
          "The home ballpark of the Seattle Mariners, at 1250 First Avenue South in Seattle's SoDo neighborhood. It opened on July 15, 1999 as Safeco Field, under a naming-rights deal signed in June 1998 with the Seattle-based Safeco Insurance worth $40 million over 20 years, and was renamed T-Mobile Park effective January 1, 2019, after T-Mobile acquired the rights on December 19, 2018 for $87.5 million over 25 years. Listed capacity is 47,574. No official URL is published: MLB.com returned HTTP 406 to every fetch attempted in either research pass, including the ballpark page, and the club's own subdomain additionally failed TLS certificate validation.",
        history:
          "The ballpark replaced the Kingdome, whose rapid deterioration included the collapse of ceiling tiles onto the seating area before a scheduled Mariners game in 1994 — a detail the Kingdome's own article carries, and which is cited to that article here because the ballpark's article does not contain it. The Washington State Legislature authorized replacement funding in October 1995, ground was broken on March 8, 1997 with Ken Griffey Jr. taking part, and total construction cost was $517 million. An independent ballpark directory names NBBJ as architect and gives the capacity of 47,574 and a retractable roof spanning about nine acres and weighing 22 million pounds; the ballpark's own encyclopedia article adds 360 Architecture as a second architect, Magnusson Klemencic Associates as structural engineer and the Hunt-Kiewit partnership as general contractor. T-Mobile Park hosted the 2023 Major League Baseball All-Star Game and the 2024 NHL Winter Classic. The Mariners were established in 1977 as an expansion team, created after a lawsuit that followed the Seattle Pilots' 1970 relocation to become the Milwaukee Brewers, and the team name was chosen from a public contest with more than 600 names submitted. The club is the only active Major League Baseball franchise never to have appeared in a World Series. In 2001 it compiled a 116-46 regular-season record, tying the all-time single-season wins record set by the 1906 Chicago Cubs and setting the American League record. It reached the playoffs in 1995, 1997, 2000, 2001, 2022 and 2025, and won its first American League West division title in 24 years in 2025.",
        photos: []
      }),
      Map.merge(@seattle, %{
        slug: "lumen-field",
        name: "Lumen Field",
        kind: "attraction",
        address: "800 Occidental Avenue South, Seattle, Washington",
        official_url: nil,
        summary:
          "A stadium at 800 Occidental Avenue South, home to the Seattle Seahawks of the NFL, Seattle Sounders FC of MLS and Seattle Reign FC of the NWSL. It opened on July 28, 2002 at a cost of $430 million, and has been called Seahawks Stadium from 2002 to 2004, Qwest Field from 2004 to 2011, CenturyLink Field from 2011 to 2020 and Lumen Field since 2020. Its design involved a coordinated effort with T-Mobile Park to manage traffic, and from its partially open south end spectators can see T-Mobile Park's retractable roof.",
        history: nil,
        photos: []
      }),
      Map.merge(@seattle, %{
        slug: "pioneer-square-historic-district-seattle",
        name: "Pioneer Square-Skid Road Historic District",
        kind: "historic-site",
        address:
          "Bounded roughly by Alaskan Way South on the west, South King Street on the south and 5th Avenue South on the east, Seattle, Washington",
        official_url: nil,
        summary:
          "A historic district listed on the National Register of Historic Places on June 22, 1970, with boundary increases in 1978 and 1988, and separately designated a Seattle preservation district in 1970. It is centered on the triangular plaza at First Avenue and Yesler Way and features late 19th-century Richardsonian Romanesque architecture. Its notable features include the Pioneer Square pergola, an iron and glass structure; a Tlingit totem pole installed in 1940, replacing an earlier pole lost to fire; and a Fallen Firefighters Memorial. The address above is a boundary description rather than a mailing address, and it is incomplete on purpose: the source places the district's northern edge a short distance north of Yesler Way, expressed as a count of blocks, and this corpus does not publish a direction-bearing block count.",
        history: nil,
        photos: []
      }),
      Map.merge(@seattle, %{
        slug: "klondike-gold-rush-national-historical-park-seattle-unit",
        name: "Klondike Gold Rush National Historical Park, Seattle Unit",
        kind: "museum",
        address: "319 Second Avenue South, Seattle, Washington",
        official_url: nil,
        summary:
          "An interpretive museum operated by the National Park Service, housed in the Cadillac Hotel building at 319 Second Avenue South in the Pioneer Square Historic District. The visitor center was originally established on June 2, 1979.",
        history:
          "The Cadillac Hotel building was constructed in 1890 and served as a major outfitting and departure point during the Klondike gold rush stampede. It sustained severe damage in the 2001 Nisqually earthquake, was rehabilitated in 2004 and 2005, and reopened as the visitor center on June 26, 2006. Current hours and any admission fee are not published here: the National Park Service's own page for the park was not reached by this research.",
        photos: []
      }),
      Map.merge(@seattle, %{
        slug: "smith-tower-seattle",
        name: "Smith Tower",
        kind: "attraction",
        address: "506 Second Avenue, Seattle, Washington 98104",
        official_url: nil,
        summary:
          "A tower built in 1914 to a design by the Syracuse firm Gaggin & Gaggin, in neoclassical style with granite on its lower floors and terracotta above. It was designated a Seattle landmark in 1984. It held the title of tallest building west of the Mississippi River until 1931 and remained the tallest on the United States West Coast until the Space Needle surpassed it in 1962. Its street address is published as 506 Second Avenue on the strength of an independent geocoder; the encyclopedia's own article gives 500 Second Avenue, and the discrepancy is reported rather than resolved.",
        history:
          "A self-guided visitor tour of the observation deck, which includes a speakeasy-themed bar, resumed on August 25, 2016, with tickets priced at $19.14 in reference to the building's 1914 completion. Whether that tour is still offered is not established here. The building was sold in August 2024 to new ownership, and by the end of that year it carried 55% office vacancy with eleven new leases signed; it stands and has active tenancy, and nothing reached by this research says whether the observation deck and bar are still operating.",
        photos: []
      }),
      Map.merge(@seattle, %{
        slug: "waterfall-garden-park-seattle",
        name: "Waterfall Garden Park",
        kind: "park",
        address: "Second Avenue South and South Main Street, Seattle, Washington",
        official_url: nil,
        summary:
          "A pocket park of 60 by 80 feet at Second and Main Streets in Pioneer Square, created in 1978, designed by Masao Kinoshita with Sasaki Associates and funded by the Annie E. Casey Foundation to commemorate the UPS founder James Casey. It features a manmade waterfall 22 feet high, over which about 5,000 US gallons of water a minute are pumped. It is open to the public during the day and locked at night. No conventional street-number address is published: every source reached identifies the park by its cross-streets.",
        history: nil,
        photos: []
      }),
      Map.merge(@seattle, %{
        slug: "filson-flagship-seattle",
        name: "Filson",
        kind: "shop",
        address: "1741 First Avenue South, Seattle, Washington 98134",
        official_url: nil,
        summary:
          "A flagship retail store at 1741 First Avenue South. Filson, formally C.C. Filson Co., was established in Seattle in 1897 as Pioneer Alaska Clothing and Blanket Manufacturers, and opened this flagship store in 1998. The address rests on OpenStreetMap's geocoder together with the encyclopedia's account of the 1998 opening, rather than on a current business directory or the retailer's own store list, and no independent source confirming that the store is trading today could be reached — the listing sites attempted returned HTTP 403 in both research passes.",
        history: nil,
        photos: []
      }),
      Map.merge(@seattle, %{
        slug: "merchants-cafe-seattle",
        name: "Merchant's Cafe",
        kind: "restaurant",
        address: "109 Yesler Way, Seattle, Washington 98104",
        official_url: nil,
        summary:
          "A cafe at 109 Yesler Way dating to 1890, which the encyclopedia's article on Pioneer Square describes as Seattle's oldest restaurant. The address and the founding year come from the cafe's own encyclopedia article; the Pioneer Square article, which carries the epithet, names the cafe once and gives neither. The most recent dated report reached about it is that The Infatuation reported on October 10, 2024 that the cafe was slated to close temporarily from January to March 2025. Nothing reached by this research says whether it reopened; a temporary closure with a planned reopening is not evidence of a permanent one, and no closure is asserted here. The cafe's own site states that it is open, which cannot establish that it is trading.",
        history: nil,
        photos: []
      })
    ]
  end
end
