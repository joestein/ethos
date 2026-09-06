defmodule Ethos.Seeds.GlobeLifeFieldGuide do
  @moduledoc """
  Seeds the Globe Life Field guide. Idempotent by slug.

  Names the destination node `united-states/texas/arlington`, so it lists on the
  Texas destination page and on Arlington's. The ballparks model no county tier,
  so Tarrant County is recorded here as a sourced fact rather than as a field. It
  comes from a confirmed verdict citing the encyclopedia's article on Arlington, which
  states it by name — *"Arlington is located in Tarrant County, Texas"* — and
  the verifier records that Tarrant County is an ordinary county administering
  the address, with no independent-city or borough-style exception in play.

  Every clause here restates text a `confirmed` verdict carries, or that the
  verifier's own reason expressly states was confirmed.
  `docs/ballparks/globe-life-field.md` quotes each published sentence against
  the verdict it rests on and records each omission.

  What was dropped, and why:

    * **Two superlatives from operators' own sites**, both of which the finder
      had already left out and the verifier recorded as excluded: AT&T
      Stadium's world's-largest-domed-structure claim and Texas Live!'s
      best-in-region claim. Neither appears here.

    * **Tour prices, admission prices and a per-game parking price**, none of
      which any source reached publishes. The parking policies that are
      published do ship.

    * **Any spatial relationship between Esports Stadium Arlington and the
      ballpark.** Its `could_not_establish` names exactly that gap: the source
      situates both in the same entertainment district by address only, with no
      stated distance or adjacency.

  One spatial claim does ship, and it is worth naming because it looks like the
  banned kind and is not. Globe Life Field stands on what was Choctaw Stadium's
  surface parking lot, south of that stadium. The verifier ruled on it directly:
  *"This is a sourced site-history statement, not a proximity/walking-distance
  claim about visiting the two venues, so it does not run afoul of the
  vague-proximity ban."*

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "globe-life-field-guide",
      title: "Globe Life Field: The Ballpark and the Arlington Entertainment District",
      destination: "Arlington, Texas",
      destination_path: "united-states/texas/arlington",
      intro: """
      Globe Life Field stands at 734 Stadium Drive in Arlington, and the Texas
      Rangers have played there since 2020. Its first regular-season game was
      on July 24, 2020, and its first event of any kind was a high school
      graduation two months earlier.

      This guide takes the ballpark first, then five places in Arlington's
      entertainment district, and then the ballpark's own record.

      Arlington is unusual enough in one respect to be worth stating at the
      outset: it had, for decades, the distinction of being the largest city in
      the United States not served by a public transportation system, and what
      it has today is not a bus network. "Getting there" sets out what exists
      and what does not.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Globe Life Field",
          place_slug: "globe-life-field",
          note:
            "734 Stadium Drive: the Rangers' home ballpark, open since 2020, with a retractable roof and an artificial turf surface, built at a cost of $1.1 billion."
        },
        %{
          kind: "sight",
          name: "Choctaw Stadium",
          place_slug: "choctaw-stadium",
          note:
            "The Rangers' home from 1994 to 2019, as The Ballpark in Arlington and then Globe Life Park, renamed Choctaw Stadium on August 25, 2021 and now a multi-purpose venue."
        },
        %{
          kind: "sight",
          name: "AT&T Stadium",
          place_slug: "att-stadium",
          note:
            "The Dallas Cowboys' home, opened May 27, 2009, seating 80,000 and expandable beyond 100,000, and configured to 70,649 for the 2026 FIFA World Cup."
        },
        %{
          kind: "food",
          name: "Texas Live!",
          place_slug: "texas-live",
          note:
            "1650 E. Randol Mill Road: a dining-and-entertainment complex whose own site lists venues including Sports & Social Arlington, Live! Arena and Lockhart Smokehouse."
        },
        %{
          kind: "stay",
          name: "Loews Arlington Hotel",
          place_slug: "loews-arlington-hotel",
          note:
            "888 Nolan Ryan Expressway: a hotel connected to the Arlington Convention Center and, by sky bridge, to the 300-room Live! by Loews Arlington Hotel."
        },
        %{
          kind: "sight",
          name: "Esports Stadium Arlington",
          place_slug: "esports-stadium-arlington",
          note:
            "A 100,000-square-foot esports facility, convention center and theater seating 2,500, operated by OpTic Gaming since January 2022."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          There is no commuter rail station in Arlington. The Trinity Railway
          Express, the regional line serving Fort Worth, Irving and Dallas,
          lists five stops in Fort Worth, two in Irving and three in Dallas,
          and the source states explicitly that no station on it is in
          Arlington.

          The city's transit history is unusual and the source states it in
          terms: Arlington had the distinction of being the largest city in the
          United States that was not served by a public transportation system,
          from 1980, when its voters rejected transit proposals, until Via
          Arlington launched in December 2017. Via Arlington is a public,
          on-demand, shared-ride van service that operates within designated
          service zones rather than on fixed routes.

          There was a fixed-route bus, and it is gone. Metro Arlington Xpress,
          a pilot service, ran on weekdays between UT Arlington's College Park
          Center and the Trinity Railway Express CentrePort Station, with one
          stop in the Entertainment District, from August 2013 until it was
          shut down on December 29, 2017, in the same month Via Arlington began
          service. It is not a current option and is named here only so that it
          is not mistaken for one.

          On parking, the ballpark's own site states that parking is available
          in multiple lots off the major highways that surround Globe Life
          Field, that all lots are cashless, and that passes must be bought in
          advance through the MLB Ballpark app or online, or at the lot
          entrance. It states a strict no in-and-out policy, with no refunds
          once parked. No flat per-game parking price is published on that
          page, and none is published here. What the record does carry is a
          financing detail rather than a rate: the financing for the ballpark
          included a parking tax of up to $3.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          Choctaw Stadium was the Rangers' home from 1994 to 2019, first as The
          Ballpark in Arlington and then as Globe Life Park, and was renamed on
          August 25, 2021 after the club left and the venue was reconfigured.
          Two further sponsor names sit between those two — Ameriquest Field in
          Arlington from 2005 to 2006 and Rangers Ballpark in Arlington from
          2007 to 2013 — which the research's own summary compressed past and
          which are restored here. It is now a multi-purpose venue, and has
          hosted football in the XFL and UFL, soccer with North Texas SC
          through 2025, rugby with the Dallas Jackals until 2024, and high
          school sports. Which tenants it holds for the 2026 season
          specifically is not established: the tenant list in the source is
          dated to 2024 and 2025.

          The relationship between the two ballparks is a matter of site
          history rather than a walking claim. Globe Life Field was built on
          what had been Choctaw Stadium's surface parking lot, south of that
          stadium.

          AT&T Stadium is the home of the Dallas Cowboys, designed by HKS, Inc.
          with Bryan Trubey as lead architect and opened to the public on May
          27, 2009, after groundbreaking in September 2005. Standard seating
          capacity is 80,000, expandable beyond 100,000 with standing room, and
          the stadium is configured to 70,649 for the 2026 FIFA World Cup. Its
          own site lists VIP Guided, Owner's Experience, Self-Guided, Gameday,
          Educational and Art tours, and describes a contemporary art
          collection; it publishes no tour prices. Its construction cost is
          given two ways in the same article — approximately $1.3 billion in
          the infobox, and a figure that rose to $1.15 billion against an
          original estimate of $650 million in the prose — and both are
          reported here rather than one chosen.

          Texas Live!, at 1650 E. Randol Mill Road, is a dining-and-
          entertainment complex in the entertainment district. Its own site
          lists venues including Sports & Social Arlington, Live! Arena,
          Lockhart Smokehouse, Rangers Republic, Miller Tavern, PBR Texas,
          Pudge's Pizza and Troy's.

          The Loews Arlington Hotel states on its own site that it is connected
          to the Arlington Convention Center and connected by sky bridge to the
          300-room Live! by Loews Arlington Hotel. Loews Hotels' corporate
          property listing carries both hotels under its current United States
          properties, and separately lists an Americana by Loews, Arlington as
          a future property — a distinction the source draws itself. Globe Life
          Field's own article records that the planning for the development
          around the new ballpark included "a new shopping mall, a Loews Hotel,
          and a ballpark village".

          Esports Stadium Arlington is a 100,000-square-foot esports facility,
          convention center and theater with a 2,500-seat capacity, originally
          billed as the largest dedicated esports facility in North America.
          OpTic Gaming has operated it since acquiring management of the venue
          in January 2022, and it has expanded beyond esports to host
          professional wrestling and other entertainment events. Nothing is
          said here about how it sits relative to the ballpark: the source
          places both in the same entertainment district by address, and states
          no distance and no adjacency.

          One thing to know about the record behind these five. Four are
          published as operating, each on evidence independent of the operator:
          Choctaw Stadium and Esports Stadium Arlington on encyclopedia
          articles describing current tenants and a named current operator,
          AT&T Stadium on its status as the Cowboys' home and a confirmed 2026
          World Cup venue, and the Loews Arlington Hotel on its parent
          company's own corporate listing distinguishing current properties
          from future ones. The exception is Texas Live!, for which the only
          source reachable was its own site — the verifier tried an
          encyclopedia article and found a bare redirect — so no claim is made
          about its current operation. There is no evidence it has closed, and
          none should be inferred.

          Two claims that appear on operators' own sites are deliberately
          absent from this guide: a world's-largest description of AT&T Stadium
          and a best-in-region ranking for Texas Live!. A business's own site
          cannot establish an award or a ranking, and neither claim was carried
          into the research record.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Globe Life Field's first event was a high school graduation on May
          29, 2020, and its first regular-season game was on July 24, 2020. It
          was designed by HKS, Inc. and VLK Architects, cost $1.1 billion, and
          has a retractable roof over an artificial turf playing surface. No
          source this research reached states an architectural style for it,
          and none is given.

          It was built as a replacement for Globe Life Park, used from 1994 to
          2019, on the site of that ballpark's former surface parking lot.
          Construction was announced in 2016 and broke ground in September
          2017, and a section of the roof caught fire while the building was
          under construction in December 2019.

          In its first years the ballpark has hosted the entire 2020 World
          Series, Games 1 and 2 of the 2023 World Series, and the 2024 Major
          League Baseball All-Star Game.

          The franchise's route to Arlington is a matter of record and of
          votes. It began in 1961 as the Washington Senators expansion team,
          playing at Griffith Stadium in 1961 and at Robert F. Kennedy Memorial
          Stadium from 1962 to 1971. American League owners voted 10-2 on
          September 21, 1971 to allow the club to move to Arlington for the
          1972 season, when it was renamed the Texas Rangers. It played at
          Arlington Stadium from 1972 to 1993, and at The Ballpark in
          Arlington, later Globe Life Park, from 1994 to 2019.

          The Rangers won their first World Series championship in 2023,
          defeating the Arizona Diamondbacks. The franchise holds three
          American League pennants — 2010, 2011 and 2023 — and seven division
          titles since relocating to Texas.
          """
        }
      ],
      faq: [
        %{
          "question" => "Can Globe Life Field be reached by train?",
          "answer" =>
            "Not directly. The Trinity Railway Express serves Fort Worth, Irving and Dallas — five stops, two stops and three stops respectively — and the source states explicitly that no station on the line is in Arlington. Arlington's own transit is Via Arlington, a public on-demand shared-ride van service launched in December 2017 that operates within designated service zones rather than on fixed routes. A pilot fixed-route bus, Metro Arlington Xpress, ran from August 2013 until December 29, 2017 and no longer exists."
        },
        %{
          "question" => "Was Arlington really without public transportation?",
          "answer" =>
            "Yes, and the claim is the source's own words rather than a paraphrase — the verifier checked this one at the verbatim level, calling it the highest-risk sentence in the research. The encyclopedia states that for many years Arlington had the distinction of being the largest city in the United States that was not served by a public transportation system. Its voters rejected transit proposals from 1980, and Via Arlington began service in December 2017."
        },
        %{
          "question" => "What does parking cost at the ballpark?",
          "answer" =>
            "No flat per-game price is published on the ballpark's own parking page, and none is published here. That page does state the policies: parking is in multiple lots off the major highways surrounding the ballpark, all lots are cashless, passes are bought in advance through the MLB Ballpark app or online or at the lot entrance, and there is a strict no in-and-out policy with no refunds once parked. The one price-shaped figure in the record is a financing detail rather than a rate: the ballpark's financing included a parking tax of up to $3."
        },
        %{
          "question" => "What happened to the Rangers' old ballpark?",
          "answer" =>
            "It is still there and still in use under a different name. The Ballpark in Arlington, later Globe Life Park, was the Rangers' home from 1994 to 2019; it was renamed Choctaw Stadium on August 25, 2021 after the club left and the venue was reconfigured, and it now hosts football, soccer, rugby and high school sports. Globe Life Field was built on what had been its surface parking lot, south of it. Two further sponsor names — Ameriquest Field in Arlington and Rangers Ballpark in Arlington — sat between the first and the current one."
        },
        %{
          "question" => "Which of these places is confirmed open?",
          "answer" =>
            "Five of six, each on evidence independent of the operator: the ballpark, Choctaw Stadium, AT&T Stadium, Esports Stadium Arlington and the Loews Arlington Hotel, the last on its parent company's corporate listing distinguishing current from future properties. The exception is Texas Live!, whose own site is the only source this research could reach; an encyclopedia entry under its name turned out to be a bare redirect. No claim is made about its current operation, and none about closure either."
        }
      ],
      photos: []
    }
  end
end
