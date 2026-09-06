defmodule Ethos.Seeds.ComericaParkPlaces do
  @moduledoc """
  Seeds the places for the Comerica Park guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Detroit Tigers research artifact, or the text a `refuted`
  verdict's correction names as publishable. A verdict vouches only for what its
  own `item` text restates, not for every clause of the sentence the finder
  wrote around it. `docs/ballparks/comerica-park.md` quotes each published
  sentence against the verdict it rests on, and records every omission.

  **The venue name has a dated expiry, and it is published with one.** A
  confirmed verdict establishes that the ballpark is Comerica Park as of August
  2026, and that Fifth Third Bank's acquisition of Comerica Bank — announced
  October 6, 2025 and completed February 1, 2026 — means the ballpark *"will be
  rebranded before the 2027 season"* according to its own article. The current
  name ships, and the pending rebrand ships beside it rather than being resolved
  early or left out.

  What the verification changed, and what is therefore absent here:

    * **The tiger statues are not eight at the gate.** The finder's sentence was
      refuted. The source describes **one** 15-foot tiger statue at the main
      entrance plus **eight additional** heroic-sized tiger statues throughout
      the park, two of them prowling atop the left-field scoreboard. The
      correction's text is what ships.

    * **No building history for Grand Trunk Pub.** Its 1905 ticket-station
      origin and Metropole Hotel period rest on the pub's own site, and no
      independent corroboration was reachable. The verdict is `uncertain`, so
      only what a business's own site can establish — that it exists, what it
      serves and where it is — is published.

    * **No underground parking garage under Grand Circus Park.** That clause of
      an otherwise confirmed sentence was not returned by the verifier's
      re-fetch at all and is `uncertain`. The Russell Alger Memorial Fountain
      and Henry Bacon as its designer, in the same sentence, were confirmed and
      do ship — the rule that a verdict vouches only for what it restates,
      working in both directions within one sentence.

    * **No trading claim for four places.** The Fox Theatre, The Fillmore
      Detroit, Cliff Bell's and Grand Trunk Pub are each `uncertain`: the only
      evidence of current operation is a business's own site, an operator's own
      booking calendar, or Wikipedia's undated prose. Uncertain is not closed,
      and no closure is asserted.

  Elwood Bar & Grill is the exception worth naming: `historicdetroit.org`, an
  independent architectural-history site rather than the business's own,
  carries a current-status field reading "Open", updated April 2026. The
  verifier called it the strongest-sourced open status in the artifact.
  """

  alias Ethos.Places

  @detroit %{destination_path: "united-states/michigan/detroit"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@detroit, %{
        slug: "comerica-park",
        name: "Comerica Park",
        kind: "stadium",
        address: "2100 Woodward Avenue, Detroit, MI 48201",
        official_url: "https://www.mlb.com/tigers/ballpark",
        summary:
          "The home of the Detroit Tigers of the American League Central since 2000, at 2100 Woodward Avenue in downtown Detroit. The first game was played on April 11, 2000 against the Seattle Mariners, and the ballpark cost $300 million to build. Populous, formerly HOK Sport, SHG Inc. and the Rockwell Group were its architects. Capacity was 41,083 as of 2018, and the recorded baseball attendance record is 45,280, set on July 26, 2008 against the Chicago White Sox. Current field dimensions are 342 feet to left field, 412 feet to center and 330 feet to right.",
        history:
          "Comerica Bank secured the naming rights in December 1998, agreeing to pay $66 million over 30 years, and the agreement was extended in 2018 through 2034. Fifth Third Bank's acquisition of Comerica Bank — announced October 6, 2025 and completed February 1, 2026, in a $10.9 billion deal that made Fifth Third the ninth-largest U.S. bank with about $294 billion in assets — means the ballpark will be rebranded before the 2027 season, according to the ballpark's own encyclopedia article; as of August 2026 the name is still Comerica Park. A large fountain sits behind center field: General Motors sponsored it from 2000 to 2008, and it became the Chevrolet Fountain after GM's sponsorship returned in 2010. The ballpark has one 15-foot tiger statue at its main entrance and eight additional heroic-sized tiger statues located throughout the park, including two prowling atop the left-field scoreboard. A statue of Ty Cobb stands without a retired number, because he played before Tigers players wore numbers. At the left-center field concourse are statues of nearly all Tigers players whose numbers have been retired; Jackie Robinson's number, retired league-wide in 1997, is instead on the wall in right-center field.",
        photos: []
      }),
      Map.merge(@detroit, %{
        slug: "fox-theatre-detroit",
        name: "Fox Theatre",
        kind: "theater",
        address: "2211 Woodward Avenue, Detroit, MI 48201",
        official_url: "https://www.313presents.com/venues/detail/fox-theatre",
        summary:
          "A theatre at 2211 Woodward Avenue that opened in 1928, designed by C. Howard Crane in an Art Deco style blending Burmese, Indian, Persian, Chinese and Hindu motifs. It operates as a live event and performing-arts venue, run by 313 Presents and owned by Olympia Entertainment. The only evidence of current-day trading reached by this research is the operator's own booking platform, and no independent, dated third-party source confirming operation in 2026 was found.",
        history:
          "The Fox Theatre was listed on the National Register of Historic Places in 1985, designated a National Historic Landmark in 1989 and made a Michigan State Historic Site in 1991.",
        photos: []
      }),
      Map.merge(@detroit, %{
        slug: "the-fillmore-detroit",
        name: "The Fillmore Detroit",
        kind: "theater",
        address: "2115 Woodward Avenue, Detroit, MI 48201",
        official_url: nil,
        summary:
          "A concert venue at 2115 Woodward Avenue, built in 1925 as The State Theatre and designed by C. Howard Crane in a Beaux-Arts Italian Renaissance style as part of the Francis Palms Building. Live Nation rebranded it The Fillmore Detroit in 2007, and the inaugural show under that name was Fergie on June 13, 2007. The twelve-story building holds a 2,900-person capacity and includes the State Bar & Grill, which has a separate entrance. No source independent of an undated encyclopedia description was reached for its current operation.",
        history:
          "The building has carried four earlier names: The State Theatre from 1925, Palms-State Theatre from 1937, Palms Theatre from 1946 and State Theatre again from 1982. It was listed on the National Register of Historic Places on November 24, 1982.",
        photos: []
      }),
      Map.merge(@detroit, %{
        slug: "cliff-bells",
        name: "Cliff Bell's",
        kind: "restaurant",
        address: "2030 Park Avenue, Detroit, MI 48226",
        official_url: "https://www.cliffbells.com",
        summary:
          "A jazz club and restaurant at 2030 Park Avenue, in an Art Deco setting, serving appetizers, main dishes, desserts and a bar menu alongside live jazz. It opened as a jazz club in 1935, closed in 1985, reopened in 2005 and was renovated in 2006, and it continues to host jazz performances. The venue's own site is the only source reached for its present-day operation, and it cannot establish that on its own.",
        history: nil,
        photos: []
      }),
      Map.merge(@detroit, %{
        slug: "elwood-bar-and-grill",
        name: "Elwood Bar & Grill",
        kind: "restaurant",
        address: "300 East Adams Avenue, Detroit, MI 48226",
        official_url: "https://www.elwoodgrill.com",
        summary:
          "A bar and grill in an Art Deco Streamline Moderne building designed by Charles Noble and built in 1936, originally at the corner of Elizabeth and Woodward. Historic Detroit's own building entry, updated in April 2026, lists its current status as \"Open\".",
        history:
          "Chuck Forbes acquired the building in the 1980s. When construction of Comerica Park in 1997 threatened it, the Forbes family relocated the building at their own expense to its current East Adams Street address, and it was rededicated on Detroit Tigers Opening Day, April 5, 2002.",
        photos: []
      }),
      Map.merge(@detroit, %{
        slug: "grand-trunk-pub",
        name: "Grand Trunk Pub",
        kind: "restaurant",
        address: "612 Woodward Avenue, Detroit, MI 48226",
        official_url: "https://grandtrunkpub.com",
        summary:
          "An American restaurant and bar at 612 Woodward Avenue serving fish and chips, chicken and waffles, reubens, and an extensive Michigan craft beer selection. Only the business's own site could be reached for this record; no independent source corroborates the building's history or the pub's current operation, so neither is stated here.",
        history: nil,
        photos: []
      }),
      Map.merge(@detroit, %{
        slug: "grand-circus-park-detroit",
        name: "Grand Circus Park",
        kind: "park",
        address: "Woodward Avenue between Clifford, John R, and Adams Streets, Detroit, MI 48226",
        official_url: nil,
        summary:
          "A park of roughly 5 acres, bisected by Woodward Avenue, established in 1850 as part of Judge Augustus Woodward's plan to rebuild Detroit after the 1805 fire and built out in 1867. It features the Russell Alger Memorial Fountain, designed by the architect Henry Bacon, and is served today by a Detroit People Mover station of the same name.",
        history:
          "The Grand Circus Park Historic District was listed on the National Register of Historic Places in 1983, with boundary expansions in 2000 and 2012.",
        photos: []
      }),
      Map.merge(@detroit, %{
        slug: "campus-martius-park",
        name: "Campus Martius Park",
        kind: "park",
        address: "Intersection of Woodward Avenue and Michigan Avenue, Detroit, MI 48226",
        official_url: nil,
        summary:
          "A park at the intersection of Woodward Avenue and Michigan Avenue, designed by Judge Augustus Woodward as the focal point of Detroit's rebuilding after the 1805 fire and named after the square in Marietta, Ohio. The re-established park covers 1.2 acres and was dedicated on November 19, 2004, with two performance stages, sculptures and a seasonal ice rink. The Detroit 300 Conservancy operates it, and it hosts the annual Motown Winter Blast and Detroit's Christmas tree-lighting.",
        history:
          "The original park was lost in the 1900s to accommodate vehicular traffic, and the park that stands today is the re-established one dedicated in 2004.",
        photos: []
      }),
      Map.merge(@detroit, %{
        slug: "central-united-methodist-church-detroit",
        name: "Central United Methodist Church",
        kind: "historic-site",
        address: "23 East Adams Street, Detroit, MI 48226",
        official_url: nil,
        summary:
          "A church at 23 East Adams Street whose congregation traces to 1804. The First Methodist Society of Michigan, formed in 1810, was the first organized Protestant congregation in Michigan Territory, and the current building's cornerstone was laid on July 3, 1866. It has an active congregation and houses social-service organizations.",
        history:
          "The building is Tudor Revival and Gothic Revival, designed by Gordon W. Lloyd and by Smith, Hinchman & Grylls. The sanctuary was redesigned in 1936 with carved Appalachian white oak and a 30-foot reredos, and stained glass from the Henry Lee Willett Studios was added in 1956. It was designated a Michigan State Historic Site in 1977 and listed on the National Register of Historic Places in 1982.",
        photos: []
      }),
      Map.merge(@detroit, %{
        slug: "st-johns-episcopal-church-detroit",
        name: "St. John's Episcopal Church",
        kind: "historic-site",
        address: "2326 Woodward Avenue, Detroit, MI 48201",
        official_url: nil,
        summary:
          "A church at 2326 Woodward Avenue whose parish was established in 1858 by Henry Porter Baldwin, later Michigan's governor and a U.S. senator. A 150-seat chapel dedicated in 1859 proved too small, and a larger church by the same architects, Jordan & Anderson, was consecrated on December 10, 1861. It has an active congregation, notable for using the traditional 1928 Book of Common Prayer.",
        history:
          "The church is Victorian Gothic Revival, 170 by 65 feet with a 105-foot belfry, in rubble limestone with Kelly Island sandstone trim; six memorial stained-glass windows were installed between 1880 and 1954. It was listed on the National Register of Historic Places in 1982 and designated a Michigan State Historic Site in 1987.",
        photos: []
      }),
      Map.merge(@detroit, %{
        slug: "little-caesars-arena",
        name: "Little Caesars Arena",
        kind: "attraction",
        address: "2645 Woodward Avenue, Detroit, MI",
        official_url: nil,
        summary:
          "An arena at 2645 Woodward Avenue that opened on September 5, 2017. It is the home of the Detroit Red Wings of the NHL and the Detroit Pistons of the NBA, with PWHL Detroit set to begin play there in 2026. It stands in Midtown Detroit as part of the District Detroit sports and entertainment district, near the Cass Corridor.",
        history: nil,
        photos: []
      })
    ]
  end
end
