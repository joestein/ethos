defmodule Ethos.Seeds.GlobeLifeFieldPlaces do
  @moduledoc """
  Seeds the places for the Globe Life Field guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates text a `confirmed` verdict in the
  2026-08-30 Texas Rangers research artifact carries, or that the verifier's
  own reason expressly states was confirmed.
  `docs/ballparks/globe-life-field.md` quotes each published sentence against
  the verdict it rests on, and records every omission.

  **No verdict in this artifact is refuted**, and the verifier explains the rate
  rather than leaving it to be taken on trust: every source is either a
  major-venue encyclopedia infobox or an operator's own site used only for the
  categories an operator's own site may establish — existence, services and
  address — rather than for trading status, awards or superlatives. The
  verifier re-fetched every cited URL independently, including the single
  highest-risk sentence in the file, at the verbatim level.

  What the verification changed, and what is therefore absent here:

    * **Two self-published superlatives, both excluded on the verifier's own
      `could_not_establish` entries.** AT&T Stadium's own site calls it the
      world's largest domed structure; Texas Live!'s own site claims a best-in-
      region ranking. A business's own site cannot establish an award or a
      ranking, and the finder correctly left both out. Neither appears here.

    * **No trading claim for Texas Live!** Its `status_verdict` is uncertain:
      the only source for its current operation is its own site, and the
      verifier tried an independent route — an encyclopedia article — which
      turned out to be a bare redirect. Uncertain is not closed, and no closure
      is asserted.

    * **Three addresses.** Where no verdict text carries a street address, none
      is published. Loews Arlington Hotel's does ship, on the operator's own
      site, with the verifier's note that no independent source for it was
      found.

    * **No architectural style for Globe Life Field**, on an explicit
      `could_not_establish`: no source reached states one. The architects do
      ship, because a verdict names them.

  **Two of these places are stadiums and neither carries `kind: "stadium"`.**
  In the ballparks region that kind is the set's roster key —
  `test/ethos/seeds/ballpark_seed_data_test.exs` asserts the region's `stadium`
  places are exactly the thirty rostered MLB venues — so Choctaw Stadium and
  Esports Stadium Arlington carry `attraction`. That is a schema constraint,
  not a claim about either place; the prose describes both as what they are.

  The county on every record is `"Tarrant County"`, from a confirmed verdict
  citing the encyclopedia's Arlington article, which states it by name.
  """

  alias Ethos.Places

  @arlington %{town: "Arlington", state: "Texas", county: "Tarrant County"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@arlington, %{
        slug: "globe-life-field",
        name: "Globe Life Field",
        kind: "stadium",
        address: "734 Stadium Drive, Arlington, Texas",
        official_url: "https://www.globelifefield.com/",
        summary:
          "The home ballpark of the Texas Rangers, at 734 Stadium Drive in Arlington. It opened for the 2020 season, replacing Globe Life Park, and has a retractable roof and an artificial turf playing surface. Construction cost $1.1 billion. It was designed by HKS, Inc. and VLK Architects; no source this research reached states an architectural style for it, and none is given here.",
        history:
          "The first event held in the ballpark was a high school graduation on May 29, 2020, and the first regular-season game was played on July 24, 2020. It was built as a replacement for Globe Life Park, used from 1994 to 2019, on the site of that ballpark's former surface parking lot; construction was announced in 2016 and broke ground in September 2017, and a section of the roof caught fire while the building was under construction in December 2019. The ballpark hosted the entire 2020 World Series, Games 1 and 2 of the 2023 World Series, and the 2024 Major League Baseball All-Star Game. The franchise began in 1961 as the Washington Senators expansion team, playing at Griffith Stadium in 1961 and at Robert F. Kennedy Memorial Stadium from 1962 to 1971; American League owners voted 10-2 on September 21, 1971 to allow the club to move to Arlington for the 1972 season, when it was renamed the Texas Rangers. It played at Arlington Stadium from 1972 to 1993 and at The Ballpark in Arlington, later Globe Life Park, from 1994 to 2019. The Rangers won their first World Series championship in 2023, defeating the Arizona Diamondbacks, and hold three American League pennants — 2010, 2011 and 2023 — and seven division titles since relocating to Texas.",
        photos: []
      }),
      Map.merge(@arlington, %{
        slug: "choctaw-stadium",
        name: "Choctaw Stadium",
        kind: "attraction",
        address: nil,
        official_url: nil,
        summary:
          "The Rangers' home ballpark from 1994 to 2019, known first as The Ballpark in Arlington and later as Globe Life Park, and renamed Choctaw Stadium on August 25, 2021 after the club's departure and a reconfiguration of the venue. It is now a multi-purpose venue that has hosted football in the XFL and UFL, soccer with North Texas SC through 2025, rugby with the Dallas Jackals until 2024, and high school sports. Globe Life Field was built south of it, on the site of what had been its surface parking lot. Which tenants occupy it for the 2026 season specifically was not established: the source's tenant list is dated to 2024 and 2025. No street address for it is published, because no verdict in this research carries one.",
        history:
          "The venue carried two further sponsor names between its first and its current one — Ameriquest Field in Arlington from 2005 to 2006, and Rangers Ballpark in Arlington from 2007 to 2013 — which the research's own summary compressed past.",
        photos: []
      }),
      Map.merge(@arlington, %{
        slug: "att-stadium",
        name: "AT&T Stadium",
        kind: "attraction",
        address: nil,
        official_url: "https://www.attstadium.com/",
        summary:
          "The home of the Dallas Cowboys, designed by HKS, Inc. with Bryan Trubey as lead architect, opened to the public on May 27, 2009 after groundbreaking in September 2005. Standard seating capacity is 80,000, expandable beyond 100,000 with standing room, and it is configured to 70,649 for the 2026 FIFA World Cup. Its own site states that it offers VIP Guided, Owner's Experience, Self-Guided, Gameday, Educational and Art tours, and that it houses a contemporary art collection; tour prices are not published on that page. No street address for it is published, because no verdict in this research carries one.",
        history:
          "The source gives two different construction costs and both are reported here rather than one chosen: the article's infobox says approximately $1.3 billion, while its prose says the cost rose to $1.15 billion against an original estimate of $650 million.",
        photos: []
      }),
      Map.merge(@arlington, %{
        slug: "texas-live",
        name: "Texas Live!",
        kind: "attraction",
        address: "1650 E. Randol Mill Road, Arlington, Texas 76011",
        official_url: "https://texas-live.com/",
        summary:
          "A dining-and-entertainment complex at 1650 E. Randol Mill Road in Arlington's entertainment district. Its own site lists venues including Sports & Social Arlington, Live! Arena, Lockhart Smokehouse, Rangers Republic, Miller Tavern, PBR Texas, Pudge's Pizza and Troy's. That site is the only source this research reached for it: an encyclopedia entry under its name turned out to be a bare redirect with no coverage of the complex, so nothing is said here about whether it is currently operating.",
        history: nil,
        photos: []
      }),
      Map.merge(@arlington, %{
        slug: "loews-arlington-hotel",
        name: "Loews Arlington Hotel",
        kind: "hotel",
        address: "888 Nolan Ryan Expressway, Arlington, Texas 76011",
        official_url: "https://www.loewshotels.com/arlington-hotel",
        summary:
          "A hotel whose own site states that it is connected to the Arlington Convention Center, and connected by sky bridge to the 300-room Live! by Loews Arlington Hotel. Loews Hotels' corporate property listing carries both this hotel and Live! by Loews, Arlington under its current United States properties, distinct from a separate Americana by Loews, Arlington, listed as a future property. The street address above comes from the hotel's own site; no independent source for it was found, and no precise opening date was established.",
        history:
          "Globe Life Field's own article records that planning for the development around the new ballpark included \"a new shopping mall, a Loews Hotel, and a ballpark village\".",
        photos: []
      }),
      Map.merge(@arlington, %{
        slug: "esports-stadium-arlington",
        name: "Esports Stadium Arlington",
        kind: "attraction",
        address: nil,
        official_url: nil,
        summary:
          "A 100,000-square-foot esports facility, convention center and theater with a 2,500-seat capacity, originally billed as the largest dedicated esports facility in North America. It has been operated by OpTic Gaming since the company acquired management of the venue in January 2022, and has expanded beyond esports to host professional wrestling and other entertainment events. Ticket and admission pricing was not established, no street address for it is published, and no distance or bordering relationship to Globe Life Field is stated here: the source places both in the same entertainment district by address only.",
        history: nil,
        photos: []
      })
    ]
  end
end
