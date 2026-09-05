defmodule Ethos.Seeds.AmericanFamilyFieldPlaces do
  @moduledoc """
  Seeds the places for the American Family Field guide. Idempotent:
  `upsert_all!/0` upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  **The venue is American Family Field**, not Miller Park. A confirmed verdict
  establishes the whole chain: Miller Park from 2001 to 2020 under a $40 million
  naming-rights deal with the Miller Brewing Company that expired at the end of
  2020, then American Family Field from 2021 under a 15-year agreement with
  American Family Insurance. The older name survives in a bus route's name —
  MCTS Route 74 is still "S. 43rd St-Miller Park Way" — which is published as
  the route's name and not as the ballpark's.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Milwaukee Brewers research artifact, or the text a `refuted`
  verdict's correction names as publishable. A verdict vouches only for what its
  own `item` text restates, not for every clause of the sentence the finder
  wrote around it. `docs/ballparks/american-family-field.md` quotes each
  published sentence against the verdict it rests on, and records every
  omission.

  What the verification changed, and what is therefore absent here:

    * **A sourced fact about the roof is missing, and its absence is
      deliberate.** The confirmed verdict describing the fan-shaped convertible
      roof also gives an interval for how quickly it opens and closes. That
      shape of clause is barred corpus-wide by docs/site-builder.md §8, the ban
      is enforced by a scan over module *source*, and its allowlist cannot be
      narrowed below a whole module — so the clause is dropped rather than the
      allowlist widened, and this moduledoc cannot restate it even to record the
      drop. Wave 1 dropped Rogers Centre's roof interval for the same reason.

    * **Helfaer Field's citations were split.** The finder attributed six clauses
      to the Helfaer Field article; a raw-wikitext fetch found half of them
      absent from it and present verbatim in the American Family Field article
      instead. The facts are true and both articles are cited for the halves
      they carry. The two articles also phrase Evan Helfaer's relationship to
      the club differently, and both phrasings are published rather than one
      chosen silently.

    * **No trading claim for the Miller Brewery Tour or Helfaer Field.** Both
      are `uncertain`. The brewery tour's own site is live and advertising, and
      a business's own site cannot establish that it is trading; Wikipedia's
      "Molson Coors continues to operate the Miller Brewery" is third-party but
      undated and may describe the brewing operation rather than the public
      tour. Uncertain is not closed, and no closure is asserted.

  The Hank Aaron State Trail is published as open, and the basis is worth
  naming: the Wisconsin Department of Natural Resources states "The trail is
  open year-round" under its own Hours heading, which is a state agency's
  operating-status statement about a facility it operates rather than a
  business's self-report.
  """

  alias Ethos.Places

  @milwaukee %{destination_path: "united-states/wisconsin/milwaukee"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@milwaukee, %{
        slug: "american-family-field",
        name: "American Family Field",
        kind: "stadium",
        address: "1 Brewers Way, Milwaukee, WI 53214",
        official_url: "https://www.mlb.com/brewers/ballpark",
        summary:
          "The home ballpark of the Milwaukee Brewers, at 1 Brewers Way in Milwaukee County. It opened on April 6, 2001, seats 41,900, and has North America's only fan-shaped convertible roof over a natural Kentucky bluegrass playing surface kept with heat lamps for off-season maintenance. HKS, Inc., NBBJ and Eppstein Uhen Architects designed it. It stands southwest of the intersection of Interstate 94 and Brewers Boulevard, at 43°1'42\"N 87°58'16\"W. The club's own ballpark page states neither the capacity nor the opening date; both figures come from an independent encyclopedia article.",
        history:
          "The ballpark was built with $290 million of public funds from a 0.1% sales tax across Milwaukee County and four surrounding counties, which began on January 1, 1996 and ended on March 31, 2020, totaling $609 million in taxpayer contribution over that period; the state senator George Petak cast the deciding vote for the funding and subsequently lost a recall election over that vote. Groundbreaking took place on November 9, 1996, in a parking lot behind Milwaukee County Stadium. On July 14, 1999 the Lampson Transi-lift crane nicknamed \"Big Blue\" collapsed while lifting a 450-ton roof section during windy conditions, killing three construction workers and delaying the opening. Total construction cost was $392 million, and the project became one of the largest construction projects in Wisconsin history. The stadium was originally named Miller Park under a $40 million naming-rights deal with the Miller Brewing Company that expired at the end of 2020; American Family Insurance then purchased naming rights under a 15-year agreement, and the venue became American Family Field in 2021. Milwaukee County Stadium, the Brewers' previous home, was demolished on February 21, 2001, and most of its former site is now covered with parking for the current ballpark. The franchise itself began as the Seattle Pilots in 1969 and relocated to Milwaukee in 1970, adopting the Brewers name for the city's association with the brewing industry.",
        photos: []
      }),
      Map.merge(@milwaukee, %{
        slug: "miller-brewery-tour",
        name: "Miller Brewery Tour",
        kind: "brewery",
        address: "4251 W. State St., Milwaukee, WI 53208",
        official_url: "https://www.millerbrewerytour.com/",
        summary:
          "A brewery tour at 4251 West State Street, at the site of the original Miller Brewing Company complex. Frederick Miller established the Miller Brewing Company in 1855, a year after emigrating from Germany, initially purchasing the Plank Road Brewery for $2,300; Molson Coors acquired full ownership in 2016 and continues to operate the Miller Brewery at that site. The tour's own site describes welcoming \"international visitors and local guests alike\" to experience \"nearly 170 years of brewing history\" and lists a visitor contact line of 414-931-BEER (2337). Current tour hours, prices and whether reservations are required could not be established: the tour-information page returned a 404.",
        history: nil,
        photos: []
      }),
      Map.merge(@milwaukee, %{
        slug: "hank-aaron-state-trail",
        name: "Hank Aaron State Trail",
        kind: "park",
        address:
          "Lakeshore State Park, Milwaukee, WI to Underwood Parkway, Wauwatosa, WI, via the Menomonee Valley",
        official_url: "https://dnr.wisconsin.gov/topic/parks/hankaaron",
        summary:
          "A state trail running east-west between Lakeshore State Park in Milwaukee and Underwood Parkway in Wauwatosa via the Menomonee Valley, with a northwestward spur providing access to American Family Field. The Wisconsin Department of Natural Resources, which manages it with support from the Friends of Hank Aaron State Trail, states that it provides a continuous connection between American Family Field and the Lake Michigan lakefront, and that it also connects to the Ward Theatre, Wisconsin State Fair Park and the Pettit National Ice Center. The trail is open year-round and a state trail pass is not required to use it. It draws approximately 200,000 users annually.",
        history:
          "The trail opened in 2000 with an initial one-third-mile segment near the ballpark, and expanded over the following years. Its features include the \"People of the Road\" sculpture honoring Milwaukee Road railway workers, a \"Bird Bike\" interactive installation, murals addressing civil rights history and local heritage, and historic copper streetcar shelters originally constructed in 1929 that now serve as resting areas and information points.",
        photos: []
      }),
      Map.merge(@milwaukee, %{
        slug: "helfaer-field",
        name: "Helfaer Field",
        kind: "historic-site",
        address: "On the former infield site of Milwaukee County Stadium, Milwaukee, WI",
        official_url: nil,
        summary:
          "A youth baseball facility laid out on the former infield footprint of Milwaukee County Stadium, which was demolished on February 21, 2001. Groundbreaking was in August 2001 and the field opened in 2002 at a construction cost of $3.1 million. It retains the old foul poles from County Stadium, seats up to 722 spectators, and has 200-foot outfield fences six feet high. No source reached gives it a street address or house number, and none states its current operating hours, its public access policy, or whether Milwaukee County, Milwaukee Recreation or the Helfaer Foundation operates it.",
        history:
          "The field is named for Evan Helfaer. The American Family Field article names it for the Evan and Marion Helfaer Foundation, founded in 1974, and calls Evan Helfaer an original investor in the Brewers; the Helfaer Field article puts it more conservatively, as \"a part-owner of the Brewers when they arrived in Milwaukee\", and says a foundation in his name provided the funds. On a picnic concourse next to the playing field there is an outline of where home plate was located at Milwaukee County Stadium, and a bronze marker in the nearby parking lot marks where Hank Aaron's 755th and final career home run landed. Part of the former County Stadium site is also home to the Teamwork sculpture, honoring the three workers killed by the Big Blue crane collapse.",
        photos: []
      })
    ]
  end
end
