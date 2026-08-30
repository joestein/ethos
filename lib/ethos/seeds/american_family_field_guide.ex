defmodule Ethos.Seeds.AmericanFamilyFieldGuide do
  @moduledoc """
  Seeds the American Family Field guide. Idempotent by slug.

  Carries `state: "Wisconsin"` and `county: "Milwaukee County"`, so it lists on
  both the Wisconsin destination page and the Milwaukee County one. The county
  comes from the verdict, and two confirmed verdicts carry it: the identity
  verdict placing the ballpark *"at 1 Brewers Way, Milwaukee, Wisconsin, in
  Milwaukee County"*, and *"Milwaukee is the county seat of Milwaukee County,
  Wisconsin, the state's most populous county, which the article states is home
  to the Milwaukee Bucks and Milwaukee Brewers"* — cited to the Milwaukee County
  article, which is the source that carries it.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Milwaukee Brewers research artifact, or the text a `refuted`
  verdict's correction names as publishable.
  `docs/ballparks/american-family-field.md` quotes each published sentence
  against the verdict it rests on and records each omission.

  What was dropped, and why:

    * **A sourced roof detail.** The confirmed verdict on the fan-shaped
      convertible roof also states an interval for how quickly it opens and
      closes. docs/site-builder.md §8 bars that shape of clause corpus-wide; the
      ban is enforced by a scan over module source and its allowlist cannot be
      narrowed below a whole module, so the clause is dropped rather than the
      allowlist widened. This moduledoc therefore cannot restate it even to
      record the drop — a side effect wave 1 met three times.

    * **Three named lots folded into one access route.** The finder wrote that
      the Molitor, Cooper and American Family Lots are "reached via Bluemound
      Road and Yount Drive"; a full-text search of the source found "Bluemound"
      exactly once, in the paragraph describing the Rideshare Lot on the south
      end of the Molitor Lot. The correction splits the claim and this guide
      follows it: only the Molitor Lot's access route is stated, and the Cooper
      and American Family Lots are described as the source describes them.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: no station, no garage, no lot and no bus route
  becomes a page.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "american-family-field-guide",
      title: "American Family Field: The Ballpark and the Menomonee Valley",
      destination: "Milwaukee, Wisconsin",
      state: "Wisconsin",
      county: "Milwaukee County",
      intro: """
      American Family Field stands at 1 Brewers Way in Milwaukee, in Milwaukee
      County, southwest of the intersection of Interstate 94 and Brewers
      Boulevard. It opened on April 6, 2001, and the Milwaukee Brewers have
      played their home games there since.

      The name changed in 2021. The ballpark was Miller Park from 2001 to 2020,
      under a naming-rights deal with the Miller Brewing Company that expired at
      the end of 2020, and American Family Insurance bought the rights under a
      15-year agreement. The older name still appears in one place published
      here — the name of a bus route — and it appears there as the route's name,
      not the ballpark's.

      This guide takes the ballpark first, then the trail, the brewery tour and
      the youth field around it, and then the team's own record. Research for it
      was carried out from named sources fetched directly: English Wikipedia,
      MLB.com's own parking page, the Wisconsin Department of Natural Resources,
      and the brewery tour's own site.
      """,
      entries: [
        %{
          kind: "sight",
          name: "American Family Field",
          place_slug: "american-family-field",
          note:
            "1 Brewers Way: the Brewers' home ballpark, open since April 6, 2001, seating 41,900 under North America's only fan-shaped convertible roof, on natural Kentucky bluegrass. Designed by HKS, Inc., NBBJ and Eppstein Uhen Architects."
        },
        %{
          kind: "sight",
          name: "Hank Aaron State Trail",
          place_slug: "hank-aaron-state-trail",
          note:
            "Lakeshore State Park to Underwood Parkway via the Menomonee Valley: a state trail connecting the ballpark to the Lake Michigan lakefront, open year-round with no trail pass required, drawing about 200,000 users a year."
        },
        %{
          kind: "tour",
          name: "Miller Brewery Tour",
          place_slug: "miller-brewery-tour",
          note:
            "4251 West State Street: a brewery tour at the site of the original Miller Brewing Company complex, founded by Frederick Miller in 1855 and owned outright by Molson Coors since 2016. Visitor line 414-931-BEER (2337)."
        },
        %{
          kind: "sight",
          name: "Helfaer Field",
          place_slug: "helfaer-field",
          note:
            "On the former infield site of Milwaukee County Stadium: a youth baseball field opened in 2002 at a cost of $3.1 million, retaining County Stadium's old foul poles, seating 722, with 200-foot outfield fences six feet high."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Start with what is no longer running. The Milwaukee County Transit
          System's freeway-flyer routes, the Cream Puff Line, the Summerfest
          Shuttle and the Brewers Line — which provided game-day service to
          American Family Field — were formally discontinued toward the end of
          2022, because of a projected budget shortfall in 2025. This guide
          names them because their absence is the fact a visitor needs, not
          because any of them can be caught.

          Two MCTS routes that do run are relevant. Route 74, named "S. 43rd
          St-Miller Park Way" after the ballpark's former name, runs between
          Loomis/29th and 35th/Wisconsin. Route 31, "State-Highland", runs
          between the Milwaukee Intermodal Station and Mayfair Mall.

          The Milwaukee Intermodal Station, at 433 West Saint Paul Avenue,
          serves Amtrak's daily Empire Builder and Borealis and the six daily
          Hiawatha round trips to Chicago, and connects to MCTS routes including
          the BlueLine, 12, 31, 34 and 57, plus the streetcar.

          On foot or by bicycle, the Hank Aaron State Trail provides a
          continuous connection between American Family Field and the Lake
          Michigan lakefront, and also connects to the Ward Theatre, Wisconsin
          State Fair Park and the Pettit National Ice Center. It is open
          year-round and a state trail pass is not required.

          By car, the ballpark is southwest of the intersection of Interstate 94
          and Brewers Boulevard. The Brewers operate a License Plate Recognition
          system for all parking lots: fans can pre-purchase advance parking and
          activate it onsite, or buy parking onsite by QR code. Advance rates
          run $19 on weekdays, $21 on weekends or Cubs games and $21 on Opening
          Day for the Preferred Lots; $14, $16 and $16 for the General Lots; and
          $55, $70 and $100 for the Bus and RV Lot. Day-of-game rates run $27
          and $42 for the Preferred Lots, $17 and $22 for the General Lots, and
          $75 and $100 for the Bus and RV Lot.

          Three lots are named on that page, and each is described differently.
          The Molitor Lot holds the Rideshare Lot at its south end, which Uber
          and Lyft use and which the source says can be accessed via Bluemound
          Road and Yount Drive. The Cooper Lot is described as motorcycle and
          scooter parking. The American Family Lot is described as
          oversized-vehicle and bus overflow parking. The source gives an access
          route only for the Rideshare Lot, and this guide gives one only there.

          Free courtesy shuttles are available for guests needing assistance, at
          select pick-up locations around the American Family Field grounds,
          with post-game return service from the Robin Yount Statue or the UW
          Credit Union Plaza Gate.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          The ballpark stands on and beside the ground its predecessor
          occupied, and most of what is around it is either the trail, the
          brewery, or what County Stadium left behind.

          Milwaukee County Stadium was demolished on February 21, 2001, and most
          of its former site is now parking for the current ballpark. The site
          of its old infield became a Little League park, now called Helfaer
          Field: groundbreaking in August 2001, opened in 2002 at a construction
          cost of $3.1 million, retaining County Stadium's old foul poles,
          seating up to 722 spectators, with 200-foot outfield fences six feet
          high. It is named for Evan Helfaer, and the two sources that describe
          the naming do not describe it the same way. The American Family Field
          article names the field for the Evan and Marion Helfaer Foundation,
          founded in 1974, and calls Evan Helfaer an original investor in the
          Brewers; the Helfaer Field article says only that he was a part-owner
          of the Brewers when they arrived in Milwaukee, and that a foundation
          in his name provided the funds. Both are published here rather than
          one being picked silently.

          Three markers survive on that ground. An outline of where home plate
          stood at Milwaukee County Stadium is on Helfaer Field's picnic
          concourse. A bronze marker in the nearby parking lot marks where Hank
          Aaron's 755th and final career home run landed. And the Teamwork
          sculpture honors the three workers killed by the Big Blue crane
          collapse of July 14, 1999.

          The Hank Aaron State Trail runs east-west between Lakeshore State Park
          in Milwaukee and Underwood Parkway in Wauwatosa, through the Menomonee
          Valley, with a northwestward spur giving access to the ballpark. It
          opened in 2000 with an initial one-third-mile segment near the
          ballpark and expanded over the following years; the Wisconsin
          Department of Natural Resources manages it with support from the
          Friends of Hank Aaron State Trail, and it draws approximately 200,000
          users annually. Its features include the "People of the Road"
          sculpture honoring Milwaukee Road railway workers, a "Bird Bike"
          interactive installation, murals addressing civil rights history and
          local heritage, and historic copper streetcar shelters originally
          constructed in 1929, which now serve as resting areas and information
          points.

          The Miller Brewery Tour is at 4251 West State Street, at the site of
          the original Miller Brewing Company complex. Frederick Miller
          established the company in 1855, a year after emigrating from Germany,
          buying the Plank Road Brewery for $2,300; Molson Coors acquired full
          ownership in 2016 and continues to operate the brewery there. The
          tour's own site advertises "nearly 170 years of brewing history" and
          gives a visitor line of 414-931-BEER (2337).

          Two things to know about the record behind this. The tour's hours,
          prices and reservation policy could not be established at all — the
          tour-information page returned a 404 — and telephoning is the way to
          settle those. And neither the brewery tour nor Helfaer Field has an
          independent, dated source for current operation, so this guide does
          not say either is open. It does not say either has closed: there is no
          evidence of that, and none should be inferred.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          American Family Field was built with $290 million of public funds,
          from a 0.1% sales tax across Milwaukee County and four surrounding
          counties. That tax began on January 1, 1996 and ended on March 31,
          2020, totaling $609 million in taxpayer contribution over the period.
          The state senator George Petak cast the deciding vote for the funding
          and subsequently lost a recall election over that vote.

          Groundbreaking took place on November 9, 1996, in a parking lot behind
          Milwaukee County Stadium. On July 14, 1999 the Lampson Transi-lift
          crane nicknamed "Big Blue" collapsed while lifting a 450-ton roof
          section during windy conditions, killing three construction workers
          and delaying the opening. Total construction cost was $392 million,
          and the project became one of the largest construction projects in
          Wisconsin history. The stadium opened on April 6, 2001.

          It seats 41,900 and has North America's only fan-shaped convertible
          roof, over a natural Kentucky bluegrass playing surface maintained
          with heat lamps in the off-season. HKS, Inc., NBBJ and Eppstein Uhen
          Architects designed it. One sourced detail about the roof is not
          published anywhere on this site: the source states how long the roof
          takes to open and close, and docs/site-builder.md §8 bars that shape
          of clause across this corpus, so it was dropped rather than the ban
          weakened for it.

          The name was Miller Park from 2001 to 2020, under a $40 million
          naming-rights deal with the Miller Brewing Company that expired at the
          end of 2020. American Family Insurance then bought the rights under a
          15-year agreement, and the venue became American Family Field in 2021.

          The franchise began as the Seattle Pilots in 1969 and relocated to
          Milwaukee in 1970, adopting the Brewers name for the city's
          association with the brewing industry. It played at Milwaukee County
          Stadium until that ballpark was demolished on February 21, 2001.
          """
        }
      ],
      faq: [
        %{
          "question" => "Is there a game-day bus to the ballpark?",
          "answer" =>
            "Not one this research could find running. The Milwaukee County Transit System's Brewers Line, which provided game-day service to American Family Field, along with the freeway-flyer routes, the Cream Puff Line and the Summerfest Shuttle, were formally discontinued toward the end of 2022 because of a projected budget shortfall in 2025. MCTS Route 74, \"S. 43rd St-Miller Park Way\", runs between Loomis/29th and 35th/Wisconsin, and Route 31, \"State-Highland\", runs between the Milwaukee Intermodal Station and Mayfair Mall."
        },
        %{
          "question" => "What does parking cost at American Family Field?",
          "answer" =>
            "The Brewers publish rates, and the Brewers operate a License Plate Recognition system for all lots — fans can pre-purchase advance parking and activate it onsite, or buy it onsite by QR code. In advance, the Preferred Lots are $19 on weekdays, $21 on weekends or Cubs games and $21 on Opening Day; the General Lots are $14, $16 and $16; and the Bus and RV Lot is $55, $70 and $100. On the day of a game, the Preferred Lots are $27 and $42, the General Lots $17 and $22, and the Bus and RV Lot $75 and $100."
        },
        %{
          "question" => "How do rideshare drop-offs work?",
          "answer" =>
            "Uber and Lyft have a dedicated Rideshare Lot on the south end of the Molitor Lot, which the club's own page says can be accessed via Bluemound Road and Yount Drive. Free courtesy shuttles are available for guests needing assistance at select pick-up locations around the ballpark grounds, with post-game return service from the Robin Yount Statue or the UW Credit Union Plaza Gate. The club's page names two other lots — the Cooper Lot for motorcycles and scooters, and the American Family Lot for oversized-vehicle and bus overflow — without giving an access route for either, so none is given here."
        },
        %{
          "question" => "Is it Miller Park or American Family Field?",
          "answer" =>
            "American Family Field, since 2021. It was Miller Park from 2001 to 2020 under a $40 million naming-rights deal with the Miller Brewing Company, which expired at the end of 2020, and American Family Insurance bought the rights under a 15-year agreement. The former name survives in the name of MCTS Route 74, \"S. 43rd St-Miller Park Way\", which is published here as the route's name and not the ballpark's."
        },
        %{
          "question" => "What is Helfaer Field?",
          "answer" =>
            "A youth baseball field laid out on the former infield footprint of Milwaukee County Stadium, which was demolished on February 21, 2001. Groundbreaking was in August 2001; it opened in 2002 at a construction cost of $3.1 million, retains County Stadium's old foul poles, seats up to 722 and has 200-foot outfield fences six feet high. No source reached gives it a street address, states its hours or public access policy, or says whether Milwaukee County, Milwaukee Recreation or the Helfaer Foundation operates it."
        },
        %{
          "question" => "Can you tour the Miller Brewery?",
          "answer" =>
            "The tour's own site is live and advertising tours at 4251 West State Street, and Molson Coors continues to operate the brewery at the site of the original Miller Brewing Company complex. But a business's own site cannot establish that it is trading today, and the encyclopedia statement that corroborates the brewing operation is undated and may not describe the public tour specifically, so this guide does not say the tour is running. It does not say it has stopped either. The tour-information page returned a 404, so hours, prices and any reservation requirement could not be established; the visitor line is 414-931-BEER (2337)."
        }
      ],
      photos: []
    }
  end
end
