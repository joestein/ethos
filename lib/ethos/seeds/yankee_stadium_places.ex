defmodule Ethos.Seeds.YankeeStadiumPlaces do
  @moduledoc """
  Seeds the places for the Yankee Stadium guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 New York Yankees research artifact, as adjudicated by an
  independent adversarial verifier. A verdict vouches only for what its own
  `item` text restates. `docs/ballparks/yankee-stadium.md` quotes each
  published sentence against the verdict it rests on, and records every
  omission.

  **Every record hangs from the borough node
  `united-states/new-york/new-york-city/bronx`**, the same node the Bronx corpus
  uses — not a node of this ballpark's own. The finder wrote the legal name
  "Bronx County" and the verifier refuted it; a `bronx-county` node would have
  split this guide off from the borough its neighbours share. The 1914 separation
  of Bronx County from New York County is published as history in the guide,
  where it is a fact rather than a tier.

  What the verification changed, and what is therefore absent here:

    * **No inspection-record prose.** Three River Avenue businesses —
      Billy's, Stan's and The Clubhouse Cafe — were reached only through the
      city's food-service records, used as a discovery mechanism once web
      search was exhausted. Their records here name the business, what it is
      and its address, and stop there.

      They did not always. As first shipped, all three named the record's
      source and published the date it carried, while this paragraph claimed
      they stopped at the address — the file documented a compliance it did
      not have, and the contradiction survived review because the author had
      removed the two things a reader greps for, the word "inspection" and
      the grade letter. The rule in
      `test/ethos/seeds/place_content_gate_test.exs` bans the record, not
      those two words: it may support a `status` judgement and may never
      appear in a sentence. That gate's pattern set, tuned by surveying the
      phrasings the corpus already contained, had no alternative that matched
      this one. It now carries four more — for the source's name, for a dated
      row, and for the cuisine field in either of its two forms — each with a
      specimen proving it load-bearing. Both halves were fixed together,
      because either alone leaves the other free to happen again.

    * **The Bronx Museum's permanent-collection figure is `uncertain` and does
      not ship.** Its founding, its move, its expansions, its free admission
      and its current hours are all confirmed and do.

    * **No trading claim for four places.** The New York Yankees Museum
      (`uncertain`: 2026 hours and non-game-day access unestablished), the
      Bronx Terminal Market (`uncertain`: the tenant roster is not freshly
      dated, so its anchor list is published as of the 2009 reopening), and
      the three River Avenue businesses, whose only source is a single
      municipal record. Uncertain is not closed, and no closure is asserted.

    * **Architectural style ships where a verdict states one.** The Bronx
      County Courthouse's "Art Deco style with Classical Revival and
      Neo-Classical elements" is verdict text and is published as such.

  No trip duration and no distance between two places appears anywhere. Where
  a source gives a relationship it is a street corner or a bounding set of
  streets, and that is what is published.
  """

  alias Ethos.Places

  @bronx %{destination_path: "united-states/new-york/new-york-city/bronx"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@bronx, %{
        slug: "yankee-stadium-bronx",
        name: "Yankee Stadium",
        kind: "stadium",
        address: "1 East 161st Street, Bronx, NY 10451",
        official_url: "https://www.mlb.com/yankees/ballpark",
        summary:
          "The home ballpark of the New York Yankees, at 1 East 161st Street in the Bronx. It opened in 2009, cost about $2.3 billion including $1.2 billion in public subsidies, and was designed by Populous with Turner Construction as general contractor. It has 25 fixed concession stands and 112 movable ones, with food operations run by Legends Hospitality.",
        history:
          "Groundbreaking took place on August 16, 2006. The facility opened on April 2, 2009 as a workout day, held its first exhibition game on April 3, and began regular-season play on April 16, 2009. It replaced the original Yankee Stadium, which operated from 1923 to 2008; that building's demolition was completed on May 13, 2010, and its site became Heritage Field. The 1923 stadium was constructed near the Grand Concourse at 161st Street — a 5.2-mile Bronx boulevard built between 1894 and 1909, extended in 1927, and designed by Louis Aloys Risse on the model of the Champs-Élysées, whose southern section from roughly 153rd to 167th Streets is a National Register historic district of 1987 and a New York City Landmarks Preservation Commission historic district of 2011.",
        photos: []
      }),
      Map.merge(@bronx, %{
        slug: "hard-rock-cafe-yankee-stadium",
        name: "Hard Rock Cafe Yankee Stadium",
        kind: "restaurant",
        address: "Gate 6, 161st Street and River Avenue, Bronx, NY",
        official_url: "https://cafe.hardrock.com/yankee-stadium/",
        summary:
          "A Hard Rock Cafe at Gate 6, on the corner of 161st Street and River Avenue. It opened on March 30, 2009, seats 165 guests, has a full bar and 15 large flat-screen televisions, and is open year-round to both ticketholders and non-ticketholders.",
        history: nil,
        photos: []
      }),
      Map.merge(@bronx, %{
        slug: "nyy-steak",
        name: "NYY Steak",
        kind: "restaurant",
        address: "One East 161st Street, Gate 6, Bronx, NY 10451",
        official_url: "https://www.nyysteak.com",
        summary:
          "A restaurant at Gate 6 of Yankee Stadium, billed on its own site as \"The Steak & Seafood Restaurant of the NY Yankees\". It serves dry-aged USDA Prime steaks and seafood with roughly 100 wine options. A sister location operates at Seminole Casino in Coconut Creek, Florida. The site gives no chef and no exact opening date, and neither is published here.",
        history: nil,
        photos: []
      }),
      Map.merge(@bronx, %{
        slug: "new-york-yankees-museum",
        name: "New York Yankees Museum",
        kind: "museum",
        address: "Yankee Stadium, main level at Gate 6, 1 East 161st Street, Bronx, NY 10451",
        official_url: nil,
        summary:
          "A museum on the main level of Yankee Stadium at Gate 6, opened in 2009 and sponsored and presented by Bank of America. Its exhibits include a tribute to Don Larsen's 1956 World Series perfect game with statues of Larsen and Yogi Berra, a \"Ball Wall\" of autographed baseballs, Thurman Munson's locker from the previous stadium, Derek Jeter's 3,000th-hit uniform, three authenticated Babe Ruth game-worn uniforms, a World Series rings display added in 2011, and a George Steinbrenner memorial exhibit. Its current operating hours, and whether it remains accessible on non-game days, were not established by the research.",
        history: nil,
        photos: []
      }),
      Map.merge(@bronx, %{
        slug: "bronx-county-courthouse",
        name: "Bronx County Courthouse",
        kind: "historic-site",
        address: "851 Grand Concourse, Bronx, NY",
        official_url: nil,
        summary:
          "A courthouse at 851 Grand Concourse, also known as the Mario Merola Building. It was designed in 1931 by Joseph H. Freelander and Max Hausle and built between 1931 and 1934 as a nine-story limestone building on a rusticated granite base, in the Art Deco style with Classical Revival and Neo-Classical elements.",
        history:
          "The building was designated a New York City Landmark on July 13, 1976 and listed on the National Register of Historic Places on September 8, 1983. Four murals by James Monroe Hewlett, unveiled in June 1934, depict Bronx history on the first floor.",
        photos: []
      }),
      Map.merge(@bronx, %{
        slug: "joyce-kilmer-park",
        name: "Joyce Kilmer Park",
        kind: "park",
        address:
          "Bounded by Grand Concourse, Walton Avenue, East 164th Street and East 161st Street, Bronx, NY",
        official_url: nil,
        summary:
          "A park in the Concourse section of the Bronx, owned and maintained by the New York City Department of Parks and Recreation. It contains the Lorelei Fountain, the Heinrich Heine Memorial, a white marble sculpture created in 1896 by the German sculptor Ernst Herter and unveiled at the park on July 8, 1899.",
        history:
          "The Lorelei Fountain was vandalized from 1900 onward, its figures' arms cut off. It was restored and reopened at its current location in 1999.",
        photos: []
      }),
      Map.merge(@bronx, %{
        slug: "heritage-field",
        name: "Heritage Field",
        kind: "park",
        address: "East 161st Street and River Avenue, Bronx, NY",
        official_url: nil,
        summary:
          "A 10-acre park complex built on the site of the original 1923 Yankee Stadium, after that building's demolition was completed on May 13, 2010. Groundbreaking on the park was June 29, 2010 and it opened in April 2012. A blue outline in the grass marks the location of the original stadium's diamond, including the position of its home plate. No source reached gives a single street-numbered address for it; the cross streets are what the sources carry.",
        history: nil,
        photos: []
      }),
      Map.merge(@bronx, %{
        slug: "bronx-museum-of-the-arts",
        name: "Bronx Museum of the Arts",
        kind: "museum",
        address: "1040 Grand Concourse, Bronx, NY 10456",
        official_url: "https://bronxmuseum.org",
        summary:
          "A museum at 1040 Grand Concourse, on the northeast corner of 165th Street. Admission has been free every day since March 29, 2012, having previously been free only on Fridays, and the stated hours are Wednesday to Sunday, 11 a.m. to 6 p.m. The museum's 2026 exhibition calendar includes \"The Seventh AIM Biennial: Forms of Connection\", running January 23 to September 6, 2026.",
        history:
          "The museum was established on May 11, 1971 by the Bronx Council on the Arts with the Metropolitan Museum of Art; its founder was Irma Fleck. It moved to its current building, a former synagogue, in May 1983, and expanded in 1988 at a cost of $5.8 million and again in 2006 at a cost of $19 million, doubling to 33,000 square feet.",
        photos: []
      }),
      Map.merge(@bronx, %{
        slug: "bronx-terminal-market",
        name: "Bronx Terminal Market",
        kind: "attraction",
        address: "610 Exterior Street, Bronx, NY",
        official_url: nil,
        summary:
          "A shopping center at 610 Exterior Street, developed by The Related Companies, which bought out prior interests for $42.5 million in 2004. Construction began on August 14, 2006, cost about $500 million, and the centre reopened on September 12, 2009 with anchors including Target, The Home Depot, Burlington, Lidl, BJ's Wholesale Club, Food Bazaar and Best Buy. That anchor list is the one recorded at the reopening; the research could not reach a freshly dated tenant roster, so it is not published as a current one.",
        history:
          "The original Bronx Terminal Market was a wholesale market built between October 1934 and May 1935 under Mayor Fiorello La Guardia. Its site later housed the Bronx House of Detention, which closed in 2000 and was demolished for redevelopment.",
        photos: []
      }),
      Map.merge(@bronx, %{
        slug: "billys-sports-bar-bronx",
        name: "Billy's Sport Bar Restaurant & Lounge",
        kind: "restaurant",
        address: "856 River Avenue, Bronx, NY 10451",
        official_url: nil,
        summary:
          "A sports bar and lounge at 856 River Avenue. One municipal record is the only source the research reached: web search was exhausted before this batch began, no site for the business was found, and its founding year and history are not published here.",
        history: nil,
        photos: []
      }),
      Map.merge(@bronx, %{
        slug: "stans-sports-bar-bronx",
        name: "Stan's Sports Bar",
        kind: "restaurant",
        address: "836 River Avenue, Bronx, NY 10451",
        official_url: nil,
        summary:
          "A sports bar at 836 River Avenue. One municipal record is the only source the research reached: web search was exhausted before this batch began, no site for the business was found, and its founding year and history are not published here.",
        history: nil,
        photos: []
      }),
      Map.merge(@bronx, %{
        slug: "the-clubhouse-cafe-bronx",
        name: "The Clubhouse Cafe",
        kind: "cafe",
        address: "812 River Avenue, Bronx, NY 10451",
        official_url: nil,
        summary:
          "A cafe at 812 River Avenue. One municipal record is the only source the research reached: web search was exhausted before this batch began, no site for the business was found, and its founding year and history are not published here.",
        history: nil,
        photos: []
      })
    ]
  end
end
