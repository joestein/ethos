defmodule Ethos.Seeds.TropicanaFieldPlaces do
  @moduledoc """
  Seeds the places for the Tropicana Field guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates text a `confirmed` verdict in the
  2026-08-30 Tampa Bay Rays research artifact carries, or that the verifier's
  own reason or correction expressly states was confirmed. A finder's refuted
  item never ships as written. `docs/ballparks/tropicana-field.md` quotes each
  published sentence against the verdict it rests on, and records every
  omission.

  ## Two evidence quotes in this artifact were fabricated

  This is the artifact where the verifier found invented evidence, and the
  finding shapes two records here. The finder attributed to the encyclopedia
  the phrases *"remains operational and actively hosts exhibitions, educational
  programs, and community events"* (Salvador Dali Museum) and *"active and
  operating"* (Museum of Fine Arts). **Neither phrase appears in either
  article**, on two independent full-text searches. The verifier calls them
  fabricated citations rather than loose paraphrase.

  The consequences differ, and both are published:

    * **The Salvador Dali Museum was downgraded to `uncertain`.** Once the
      invented quote is removed, the article's most recent dated content is
      three-plus years old and there is no closure indication either. **No
      trading claim is made for it.**

    * **The Museum of Fine Arts stayed `open`, on different evidence.** The
      article does state that Klaudio Rodriguez has served as Executive
      Director and CEO since 2024 and names exhibitions scheduled through
      2025-2026. The status stands on that, "on a narrower basis than the
      finder claimed", and the record says which basis.

  Nothing else in the artifact was affected: the refutations here are about
  invented evidence for trading status, not about wrong facts.

  ## What else is absent

    * **No spatial relationship between the Chihuly Collection and the Morean
      Arts Center's main building.** The verifier's correction is explicit —
      *"Drop the spatial-relationship clause"* — and its reasoning is worth
      keeping: *"A source using vague proximity does not license republishing
      it — unlike architectural style, this rule has no sourced-exception
      clause."*

    * **No claim that the pier site has held a landmark structure since 1889.**
      That item is `refuted` as an overstatement: smaller piers stood on the
      waterfront from at least 1854, and 1889 is the date of the first large,
      centralized pier. The corrected form ships.

    * **Five addresses.** Where no verdict text carries a street address, none
      is published; the record says so rather than taking the finder's
      unverified header value.

    * **No trading claim for four of the eight places.** The Dali Museum, the
      Chihuly Collection, Ferg's and Green Bench Brewing are all `uncertain`,
      three of them because the only evidence reachable was the business's own
      site. Uncertain is not closed, and no closure is asserted.

  The county on every record is `"Pinellas County"`, from two confirmed
  verdicts — one whose cited article states the county in the venue's address
  line rather than leaving it to be inferred from the city, and one in which
  the county government's own site names itself.
  """

  alias Ethos.Places

  @st_pete %{town: "St. Petersburg", state: "Florida", county: "Pinellas County"}

  @no_address "No street address is published: no verdict in this research carries one for it."

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@st_pete, %{
        slug: "tropicana-field",
        name: "Tropicana Field",
        kind: "stadium",
        address: "One Tropicana Drive, St. Petersburg, Florida 33705",
        official_url: "https://www.mlb.com/rays/ballpark",
        summary:
          "The home ballpark of the Tampa Bay Rays, at One Tropicana Drive in St. Petersburg, Pinellas County. It opened on March 3, 1990 and has carried its present name since 1996. Its roof is fixed rather than retractable, and the encyclopedia describes it as the only active Major League Baseball stadium with a fixed roof — a distinction the article ties to Target Field's opening in 2010, when the Metrodome closed. Capacity is 25,025, a figure dating from 2019, and the playing surface has been Shaw Sports Turf since 2017. The Rays were displaced for the whole of the 2025 season by hurricane damage and returned on April 6, 2026.",
        history:
          "The stadium opened on March 3, 1990 to designs by HOK Sport of Kansas City, Lescher & Mahoney Sports of Tampa, and Criswell, Blizzard & Blouin Architects of St. Petersburg. It opened as the Florida Suncoast Dome, was renamed ThunderDome in 1993, and became Tropicana Field in 1996 after Tropicana Products signed a 30-year naming-rights deal that October. The roof is fixed and was set at an angle to reduce interior volume and cooling costs. An interior feature is the Cownose Clubhouse, a 35-foot, 10,000-US-gallon tank stocked with rays that spectators can view up close. The ballpark hosted the 2008 World Series, in which the Rays lost to the Philadelphia Phillies four games to one. On October 9, 2024 Hurricane Milton tore through the fiberglass roof, causing extensive damage; the Rays played the entire 2025 season at George M. Steinbrenner Field in Tampa while repairs were completed, and returned on April 6, 2026, beating the Chicago Cubs 6-4. The article on the ballpark puts the repair cost at approximately $55 million; the article on the club puts it at nearly $60 million, and the disagreement is inside the encyclopedia rather than introduced by this research. A proposed Gas Plant Stadium replacement, costed at $1.2 billion, was cancelled in March 2025, and on that cancellation the club also floated redeveloping Tropicana Field itself under a long-term lease. As of March 2026 the Rays are pursuing a new stadium on the Hillsborough Community College Dale Mabry campus, costed at $2.3 billion and targeting a 2029 opening with a capacity of roughly 30,000 to 35,000.",
        photos: []
      }),
      Map.merge(@st_pete, %{
        slug: "salvador-dali-museum",
        name: "Salvador Dali Museum",
        kind: "museum",
        address: nil,
        official_url: "https://thedali.org/",
        summary:
          "A museum established on March 7, 1982 at an earlier location and relocated to its current purpose-built building on January 11, 2011. Its collection includes 96 oil paintings, over 100 watercolors and drawings, 1,300 graphics, photographs, sculptures and objets d'art, plus an extensive archival library, and the encyclopedia describes it as holding more Dali masterworks than any museum other than the Dali Theatre-Museum in Spain. Its own site gives hours of 10 a.m. to 6 p.m. daily, and to 8 p.m. on Thursdays. Whether it is operating today is not established here, for a reason set out in the guide: the evidence the research first offered for it was a quotation that does not exist in the source it was attributed to. #{@no_address}",
        history:
          "The building was designed by HOK with Yann Weymouth and built by The Beck Group, reportedly costing over $30 million — the source hedges the figure as a report, and the hedge is kept. It has a glass \"Enigma\" entryway 75 feet tall with a spiral staircase, and 18-inch-thick concrete walls designed for hurricane protection.",
        photos: []
      }),
      Map.merge(@st_pete, %{
        slug: "st-pete-pier",
        name: "St. Pete Pier",
        kind: "attraction",
        address: nil,
        official_url: "https://stpetepier.org/",
        summary:
          "A 26-acre pier that opened on July 6, 2020 at a cost of $92 million, following voter approval in May 2015 and a groundbreaking on June 28, 2017. It holds five restaurants, a playground, an environmental education center and artwork including Janet Echelman's sculpture \"Bending Arc\", which the pier's own site listed as temporarily closed when this research was verified — a caveat on the sculpture and not on the pier. The pier's own site gives a daily closing time of 11 p.m. It also states an opening time, which this corpus cannot publish: the corpus bans duration-shaped strings outright, the ban scans module source, and its allowlist cannot be narrowed below a whole module, so the clause is dropped rather than the gate weakened. #{@no_address}",
        history:
          "The waterfront has held pier structures since at least 1854. The first large, centralized pier — the Railroad Pier, built by the Orange Belt Railway — was built in 1889. It was followed by the Million Dollar Pier of 1926, with a Mediterranean Revival-style Casino building, and by the Inverted Pyramid Pier, which stood from 1973 to 2013 and preceded the current structure.",
        photos: []
      }),
      Map.merge(@st_pete, %{
        slug: "chihuly-collection-st-petersburg",
        name: "Chihuly Collection",
        kind: "museum",
        address: "720 Central Avenue, St. Petersburg, Florida",
        official_url: "https://www.moreanartscenter.org/visit/chihuly-collection/",
        summary:
          "A collection operated by the Morean Arts Center, which was founded in 1917 as the Art Club of St. Petersburg by Margaret and Edith Tadd. Dale Chihuly collaborated with the center on an exhibition in 2010, and the collection relocated to 720 Central Avenue in 2016. Its own site gives hours of 10 a.m. to 5 p.m. Monday to Saturday and noon to 5 p.m. on Sundays, with listed exceptions: closed at Christmas and Thanksgiving, and closing at 3 p.m. on several other holidays. Those hours are the venue's own account of itself and cannot establish that it is operating; no independent confirmation of current operation could be reached.",
        history: nil,
        photos: []
      }),
      Map.merge(@st_pete, %{
        slug: "fergs-sports-bar-grill",
        name: "Ferg's Sports Bar & Grill",
        kind: "restaurant",
        official_url: "https://www.fergssportsbar.com/",
        address: nil,
        summary:
          "A sports bar whose own site states that it has operated since 1992 and spans nearly two city blocks, and whose events calendar lists Tampa Bay Rays game-watching events, trivia and concerts through September 2026. Every one of those statements is the business's own: the founding year is sourced only to its own site, and a forward-dated calendar on that site cannot establish that the bar is trading. No independent source was reached, and no claim about current operation is made here. #{@no_address}",
        history: nil,
        photos: []
      }),
      Map.merge(@st_pete, %{
        slug: "green-bench-brewing-company",
        name: "Green Bench Brewing Company",
        kind: "brewery",
        address: "1133 Baum Avenue N, St. Petersburg, Florida",
        official_url: "https://www.greenbenchbrewing.com/",
        summary:
          "A brewery with a beer garden and tasting room at 1133 Baum Avenue N, producing craft beer, mead and cider. Its own site describes a second location, Webb's City Cellar, with its own limited Thursday-to-Sunday hours. Its founding year and the origin of its name are not stated on any page this research reached, and no source independent of the brewery's own site could be reached, so nothing is said here about whether it is trading.",
        history: nil,
        photos: []
      }),
      Map.merge(@st_pete, %{
        slug: "al-lang-stadium",
        name: "Al Lang Stadium",
        kind: "attraction",
        address: nil,
        official_url: nil,
        summary:
          "A stadium in St. Petersburg that opened in 1947 on the site of the earlier St. Petersburg Athletic Park, built in 1923, and is named for Al Lang, a former mayor of St. Petersburg who was instrumental in bringing baseball to the city from 1914. It has been the home of the Tampa Bay Rowdies of the USL Championship since 2011. Capacity is 7,227; it is owned by the City of St. Petersburg and operated by Big 3 Entertainment. No official team or venue URL could be located by this research, and no verdict in it carries a street address for the stadium, so neither is published.",
        history:
          "The stadium hosted spring training over the decades for the St. Louis Cardinals, the New York Yankees, the New York Mets and the Baltimore Orioles, the last of those from 1991 to 1995. No date range is given here for the Cardinals: two passes over the same article returned two different start years, and the verdict that covers the tenancies does not state dates. The Tampa Bay Devil Rays used it for spring training and minor-league play from 1998 to 2008. A renovation in 2015 added seating and removed portions of the outfield wall for soccer use. Hurricane damage in 2024, attributed by the source to Hurricane Helene and Hurricane Milton, sent the Rowdies to IMG Academy in Bradenton for their final two home games that season.",
        photos: []
      }),
      Map.merge(@st_pete, %{
        slug: "museum-of-fine-arts-st-petersburg",
        name: "Museum of Fine Arts, St. Petersburg",
        kind: "museum",
        address: nil,
        official_url: nil,
        summary:
          "A museum founded in 1961 and opened to the public in 1965, in the Downtown Waterfront District along Straub Park. It houses over 20,000 objects spanning nearly 5,000 years, and the encyclopedia states that it holds the largest collection of art in the Tampa Bay area and that its photography collection is recognized as one of the largest and most significant in the southeastern United States, including works by Ansel Adams, Edward Steichen and Julia Margaret Cameron. Klaudio Rodriguez has served as its Executive Director and CEO since 2024. #{@no_address} No official website is published either, because neither research pass fetched one.",
        history:
          "The original 1965 building was designed by the Palm Beach architect John Volk in the Neoclassical style, with a curving colonnade along Beach Drive. A later expansion added the 39,000-square-foot Hazel Hough Wing, designed by Yann Weymouth of Hellmuth, Obata + Kassabaum.",
        photos: []
      })
    ]
  end
end
