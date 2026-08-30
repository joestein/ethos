defmodule Ethos.Seeds.TruistParkGuide do
  @moduledoc """
  Seeds the Truist Park guide. Idempotent by slug.

  ## The town field, and why it reads `"Cumberland"` rather than `"Atlanta"`

  Carries `state: "Georgia"` and `county: "Cobb County"`, so it lists on both
  the Georgia destination page and the Cobb County one.

  The ballpark's official address, confirmed against MLB.com, gives the postal
  city as Atlanta. Two further confirmed verdicts place the building itself in
  Cumberland: an "unincorporated community" and "edge city in Cobb County",
  ten miles northwest of downtown Atlanta. The City of Atlanta does not lie in
  Cobb County, so a record reading `town: "Atlanta"` beside `county: "Cobb
  County"` would assert a jurisdiction that does not exist. The `town` field
  groups the destination hubs; the value shipped is the community the verdicts
  place the ballpark in, and the postal city is published where it belongs — in
  the address line, exactly as MLB.com states it.

  ## Sourcing

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Atlanta Braves research artifact, or the `reason` of a confirmed
  `status_verdict`, which is the verifier's own finding.
  `docs/ballparks/truist-park.md` quotes each published sentence against the
  verdict it rests on and records each omission.

  What was dropped, and why:

    * **The finder's citation for the 11,000-space parking figure.** That item
      is `refuted`: the verifier searched the cited page's full text twice and
      found no space count on it at all, and calls this "the exact class of
      error the operating manual warns about: a fact cited to a page that does
      not contain it". The figure itself is published, on the source the
      verifier re-fetched and quotes.

    * **The finder's reading of one transit service as another's brand name**,
      which the source does not support. The source's own sentence, which the
      verifier quotes verbatim, is published instead — as the flat list it is.

    * **The finder's sequencing of Atlanta-Fulton County Stadium**, refuted for
      a substantive reason rather than a citation one: the finder had the
      stadium built after the franchise's relocation when it was built before
      it, while the move was still being litigated. The dates the verifier
      re-fetched are published in its place.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: the Cumberland Transfer Center is prose, and so
  is the lot named in the oversized-vehicle rates.

  This research ran with its WebSearch budget exhausted before the first query.
  Every source was fetched directly by name, and several individual businesses'
  own sites returned 403, 404 or DNS errors, which is why a number of places
  below rest on the property directory alone and say so.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "truist-park-guide",
      title: "Truist Park: The Ballpark and The Battery Atlanta",
      destination: "Cumberland, Georgia",
      state: "Georgia",
      county: "Cobb County",
      intro: """
      Truist Park is the home of the Atlanta Braves. Its official address is
      755 Battery Avenue SE, Atlanta, Georgia 30339, and the ballpark itself
      stands in Cumberland, an unincorporated community in Cobb County, ten
      miles northwest of downtown Atlanta. It opened on April 14, 2017.

      This guide takes the ballpark first, then The Battery Atlanta — the
      mixed-use development built around it, and the address of every other
      place here — and then the ballpark's own record. Research for it was
      carried out with the session's search budget already exhausted, from
      named sources fetched directly: English Wikipedia, MLB.com's Braves
      pages, The Battery Atlanta's own site, MARTA's site and Cobb County's
      government site.

      One thing about the sourcing is worth knowing before reading the rest.
      Six of the nine refutations in this research are the same defect: the
      finder cited The Battery Atlanta's per-tenant subpages, several of which
      are stale pages carrying a January 2019 byline and no tenant text, rather
      than the property's live directory indexes, which do list every one of
      those tenants. Every tenancy survived on the corrected evidence, and so
      did five of the street addresses, which the verifier's own text names.
      Six tenants have no address in any verdict text, and carry none here.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Truist Park",
          place_slug: "truist-park",
          note:
            "755 Battery Avenue SE: the Braves' home ballpark, open since April 14, 2017, when it was named SunTrust Park; renamed Truist Park in January 2020."
        },
        %{
          kind: "stay",
          name: "Omni Hotel at The Battery Atlanta",
          place_slug: "omni-hotel-battery-atlanta",
          note:
            "A 16-floor hotel opened January 3, 2018, owned 50/50 by the Braves and Omni Hotels & Resorts, with a two-story restaurant, rooftop hospitality suites and a pool deck with views into the ballpark."
        },
        %{
          kind: "stay",
          name: "Aloft Atlanta at The Battery Atlanta",
          place_slug: "aloft-battery-atlanta",
          note:
            "The second of the two hotels on The Battery Atlanta's own \"Stay\" page. Nothing beyond that listing could be confirmed."
        },
        %{
          kind: "sight",
          name: "Coca-Cola Roxy",
          place_slug: "coca-cola-roxy",
          note:
            "800 Battery Avenue SE #500: a Live Nation concert venue with standing-room capacity for 4,000, hosting about 40 music and comedy shows annually."
        },
        %{
          kind: "sight",
          name: "Silverspot Cinema",
          place_slug: "silverspot-cinema-battery-atlanta",
          note:
            "A cinema listed among The Battery Atlanta's current entertainment venues on the property's live directory index."
        },
        %{
          kind: "sight",
          name: "Mizuno Experience Center",
          place_slug: "mizuno-experience-center",
          note:
            "A retail tenant of The Battery Atlanta, listed on the property's live directory index."
        },
        %{
          kind: "sight",
          name: "Baseballism",
          place_slug: "baseballism-battery-atlanta",
          note:
            "A retail tenant of The Battery Atlanta, listed on the property's live directory index. No verified source describes what it sells."
        },
        %{
          kind: "food",
          name: "Yard House",
          place_slug: "yard-house-battery-atlanta",
          note:
            "A dining tenant of The Battery Atlanta, listed on the property's live directory index."
        },
        %{
          kind: "food",
          name: "Superica",
          place_slug: "superica-battery-atlanta",
          note:
            "Chef Ford Fry's restaurant concept, and a current dining tenant of The Battery Atlanta."
        },
        %{
          kind: "food",
          name: "Garden & Gun Club",
          place_slug: "garden-and-gun-club-battery-atlanta",
          note:
            "A restaurant and bar tenant of The Battery Atlanta, described on the property's own site as offering specialty cocktails."
        },
        %{
          kind: "food",
          name: "C. Ellet's Steakhouse",
          place_slug: "c-elletts-steakhouse",
          note:
            "A Battery Atlanta restaurant with a Saturday jazz brunch and a jazz duo playing from 11 to 3 every Saturday and Sunday."
        },
        %{
          kind: "food",
          name: "Achie's",
          place_slug: "achies-battery-atlanta",
          note:
            "Chef Hugh Acheson's eighth restaurant, within the Omni Hotel at The Battery Atlanta."
        },
        %{
          kind: "food",
          name: "Antico Pizza",
          place_slug: "antico-pizza-battery-atlanta",
          note:
            "Named by the encyclopedia among the first restaurants announced for The Battery Atlanta, and a current dining tenant on the property's directory index."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          There is no rail line to this ballpark, and the record says so
          twice. The encyclopedia states that Truist Park is over ten miles
          from the nearest train station and that no rail line serves it
          directly. MARTA's own website, searched directly, lists no rail
          station at or near Truist Park or the Cumberland and Battery Atlanta
          area; the only relevant reference found on it was a Route 12 bus
          service alert naming the Cumberland Transfer Center.

          Buses are the transit answer. CobbLinc route 10A serves Truist Park
          on weekdays, with additional connections at the Cumberland Transfer
          Center, which itself connects to MARTA bus route 12 and to CobbLinc
          routes 10, 10B, 20, 25 and 50. The Braves also run what the
          encyclopedia calls a "circulator" bus system to shuttle fans to and
          from the stadium.

          The Battery Atlanta's own site states that the development "is
          served by CobbLinc, Marta, the new Cumberland Circulator, Hopper as
          well as a designated Ride Share pickup area". That is a flat list of
          distinct services, and it is published as one: nothing on the page
          says that Hopper is the Cumberland Circulator's brand name, and the
          finder's item saying so was refuted.

          On parking, the ballpark is surrounded by more than 11,000 parking
          spaces owned or leased by the organization, announced by the Braves
          in January 2017 — 2,500 more than Turner Field had — with parking, in
          MLB's own words, "spread 360-degrees around Truist Park". Fans are
          advised to buy in advance. That figure is published on the source the
          verifier re-fetched and quoted, not the one the finder cited: the
          cited page contains no space count at all, on two full-text
          re-fetches.

          The published rates that survived verification are the oversized
          ones. Fifteen-passenger vans are $50 per vehicle and RVs up to 35
          feet are $75 per vehicle, both in Lot 29, and bus parking permits
          range from $50 to $75 per vehicle depending on size. No standard
          single-vehicle rate appears on that page, and none is published
          here.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          Around the ballpark is a single development. The Battery Atlanta was
          proposed on November 20, 2013, broke ground on September 16, 2014 and
          opened in stages beginning in 2017, at a cost of roughly $400 million
          funded by the Braves and development partners. Its architect was
          Wakefield Beasley & Associates. Every place below is one of its
          tenants.

          Two hotels stand on the property. The Omni Hotel at The Battery
          Atlanta opened on January 3, 2018 and is owned 50/50 by the Atlanta
          Braves and Omni Hotels & Resorts. It has 16 floors, a two-story
          restaurant, rooftop hospitality suites and a pool deck with views
          into the ballpark. Its size is reported here as a disagreement rather
          than a number: the encyclopedia says 264 rooms, and the property's
          own "Stay" page says 236 rooms and 28 suites, with over 20,000 square
          feet of meeting space. Both quotes are accurate to their sources, the
          hotel's own page returned HTTP 403 and could not break the tie, and
          neither figure is preferred here. The second hotel is the Aloft
          Atlanta at The Battery Atlanta, and the property's "Stay" page
          listing it is the only thing about it that could be confirmed — the
          operator's own property page returned HTTP 403, so no room count and
          no history for it appears here.

          The Coca-Cola Roxy, at 800 Battery Avenue SE #500, is a Live Nation
          concert venue with standing-room capacity for 4,000, hosting about 40
          music and comedy shows annually, and developed with Live Nation.
          Silverspot Cinema is listed among the property's current
          entertainment venues; its own domain could not be resolved, so the
          directory is all there is.

          Two shops are listed among the property's retail tenants: the Mizuno
          Experience Center and Baseballism. Neither is described further here,
          and both omissions are deliberate. Mizuno's own experience-centre
          page returned HTTP 404, and the claim that would have described it is
          one the verifier could not check. The description of what Baseballism
          sells was, in the verifier's words, "not independently verified on
          any source fetched", and Baseballism's own retail-locations page
          listed no physical stores at all in the content retrieved.

          Six restaurants complete the property. Superica is chef Ford Fry's
          restaurant concept. C. Ellet's Steakhouse runs a Saturday jazz brunch,
          with a jazz duo playing from 11 to 3 every Saturday and Sunday. The
          Garden & Gun Club is described on the property's own site as offering
          specialty cocktails for evening entertainment. Yard House and Antico
          Pizza are both current dining tenants — Antico on evidence the
          verifier found and the finder had not, having looked only for a
          dedicated per-tenant page that does not exist for it. And Achie's,
          inside the Omni Hotel, is chef Hugh Acheson's eighth restaurant.

          Two things about that last paragraph. Achie's is the one place here
          with no confirmed trading status: the encyclopedia article is the
          only source reached for it, its own domain could not be located, and
          no independent, dateable source confirming that it is open today was
          found. So this guide does not say it is trading. It does not say it
          has closed: no closure notice, dated report or successor tenant was
          found, and none should be inferred. And the source that describes
          Acheson also gives him an award, which the verifier's own verdict
          expressly declines to confirm for publication — so it is not
          published.

          Six of the tenants carry no street address, and the reason is the
          sourcing defect described in the introduction. Silverspot Cinema, the
          Mizuno Experience Center, Baseballism, Yard House and Superica are
          published at 800 Battery Avenue SE, because the verifier's own text
          names that address for each of them. For the two hotels, the Garden &
          Gun Club, C. Ellet's Steakhouse, Achie's and Antico Pizza, no verdict
          text carries an address at all, and none is invented.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          The first regular-season game at the ballpark was played on April 14,
          2017. It opened as SunTrust Park, under a 25-year naming-rights
          agreement, and on January 14, 2020 the Braves and Truist Financial
          formally announced that the name would change to Truist Park,
          following the merger of SunTrust Banks and BB&T that created Truist
          Financial. There were two earlier games in the building — a March 31,
          2017 exhibition and an April 8, 2017 college game — neither of which
          contradicts the April 14 opening.

          The ballpark stands in Cumberland, which the encyclopedia describes as
          "an edge city in Cobb County located in an unincorporated area of the
          northwest Atlanta metropolitan area", ten miles northwest of downtown
          Atlanta. The postal city on the club's official address is Atlanta;
          the jurisdiction is Cobb County, whose government identifies itself on
          its own site at 100 Cherokee Street, Marietta.

          Before Truist Park the Braves played at Turner Field from 1997 to
          2016. That stadium was built as the 85,000-seat Centennial Olympic
          Stadium for the 1996 Summer Olympics and converted afterward into a
          49,000-seat baseball-only park. The stadium before it is not
          described here as the finder described it. Ground was broken on that
          stadium on April 15, 1964 and construction was completed on April 9,
          1965, in anticipation of a move announced in October 1964; court
          battles then delayed the franchise's actual relocation from Milwaukee
          until the 1966 season, a year after the stadium was finished. The
          Braves played there from 1966 to 1996. The finder had the building
          put up after the move rather than before it, and the verifier
          re-fetched the stadium's own article to establish the order.

          The ballpark did not arrive alone. The Battery Atlanta was proposed
          on November 20, 2013, broke ground on September 16, 2014, opened in
          stages from 2017, cost roughly $400 million funded by the Braves and
          development partners, and was designed by Wakefield Beasley &
          Associates. The Braves are a Major League Baseball club and a member
          of the National League East Division, and the encyclopedia's article
          on the club states in the present tense that Truist Park is their
          home.
          """
        }
      ],
      faq: [
        %{
          "question" => "Is Truist Park in Atlanta?",
          "answer" =>
            "Its postal address is, and the building is not. MLB.com gives the official address as 755 Battery Avenue SE, Atlanta, Georgia 30339, while two confirmed verdicts place the ballpark itself in Cumberland — an unincorporated community and \"edge city in Cobb County\", ten miles northwest of downtown Atlanta. This guide files it under Cumberland, Cobb County, and publishes the postal city in the address line, because the City of Atlanta does not lie in Cobb County and a record pairing the two would assert a jurisdiction that does not exist."
        },
        %{
          "question" => "Can the ballpark be reached by rail?",
          "answer" =>
            "No. The encyclopedia states that Truist Park is over ten miles from the nearest train station and that no rail line serves it directly, and MARTA's own website lists no rail station at or near the ballpark or the Cumberland and Battery Atlanta area. The transit answer is buses: CobbLinc route 10A serves the ballpark on weekdays, with connections at the Cumberland Transfer Center to MARTA bus route 12 and CobbLinc routes 10, 10B, 20, 25 and 50, and the Braves run a circulator bus system for fans."
        },
        %{
          "question" => "What does parking cost?",
          "answer" =>
            "For ordinary cars, no source that survived verification says. The rates that did survive are the oversized ones: $50 per vehicle for fifteen-passenger vans and $75 per vehicle for RVs up to 35 feet, both in Lot 29, and bus permits from $50 to $75 depending on size. The club's own parking page carries no standard single-vehicle rate. There are more than 11,000 spaces owned or leased by the organization, announced by the Braves in January 2017 and 2,500 more than Turner Field had, and fans are advised to buy in advance."
        },
        %{
          "question" => "Why do six of these places have no street address?",
          "answer" =>
            "Because no verdict carries one for them. Six of the nine refutations in this research are one repeated defect: the finder cited The Battery Atlanta's per-tenant subpages — several carrying a January 2019 byline and no tenant text — instead of the property's live directory indexes. The verifier re-fetched those indexes, re-established every tenancy on them, and named the address for five of the tenants, which is why those five have one. For the two hotels, the Garden & Gun Club, C. Ellet's Steakhouse, Achie's and Antico Pizza, no verdict text states an address, so none is published."
        },
        %{
          "question" => "Which of these places is confirmed to be operating?",
          "answer" =>
            "Twelve of thirteen, each on The Battery Atlanta's live directory indexes or on an independent article rather than on the business's own account. The exception is Achie's, inside the Omni Hotel: the only source reached for it is the encyclopedia, its own domain could not be located, and no independent, dateable source confirming that it is open today was found. There is no evidence it has closed, and none is asserted."
        }
      ],
      photos: []
    }
  end
end
