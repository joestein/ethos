defmodule Ethos.Seeds.DaikinParkGuide do
  @moduledoc """
  Seeds the Daikin Park guide. Idempotent by slug.

  ## The county, and the source it does not come from

  Carries `state: "Texas"` and `county: "Harris County"`, so it lists on both
  the Texas destination page and the Harris County one.

  **The county was not taken from the source the finder cited for it.** The
  finder's item put the ballpark "in Houston, Texas, in Harris County" on the
  encyclopedia's article, and the verifier refuted the county half of it after
  pulling every infobox field verbatim: the Location line reads only *"Houston,
  Texas, U.S."*, and a full-text search found all seven occurrences of "Harris
  County" to be about the Harris County-Houston Sports Authority — the
  owner/operator entity — and 1990s funding history, *"never a direct statement
  that the venue sits in Harris County"*.

  The value ships from the confirmed verdict that does carry it: Harris
  County's own government website lists the venue among its sports venues and
  entertainment attractions, alongside NRG Park, the Toyota Center and BBVA
  Compass Stadium. The verifier calls this *"the strongest county evidence in
  the artifact: the county names itself as the administering jurisdiction for
  this venue"*. That same verdict carries its own caveat, and the caveat ships
  with it — the county site still lists the venue under its former name.

  ## Sourcing

  Every clause here restates text a `confirmed` verdict carries, or that the
  verifier's own reason or correction expressly states was confirmed.
  `docs/ballparks/daikin-park.md` quotes each published sentence against the
  verdict it rests on and records each omission.

  What was dropped, and why:

    * **Any statement of how far the Preston or Convention District stations
      are from the ballpark.** The verifier left a direct instruction in the
      transit verdict: do not import the encyclopedia's phrasing about how many
      blocks or streets separate them, because it is banned vague-proximity
      language. None is imported. The stations are named and the lines that
      serve them are named; the gap between them is not described at all.

    * **Any claim that a particular bus route stops at the ballpark.** The
      confirmed item stays generic on purpose, and the route numbers the
      encyclopedia lists are published as serving downtown Houston, which is
      what the source supports.

    * **The marketing superlative on the parking page.** The club's own page
      recommends a booking app and describes it in terms no verdict
      establishes as anything but the page's own promotion. The recommendation
      ships; the description does not.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8. The former Union Station is not a place record
  either — it is part of the ballpark, and the ballpark's record says so.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "daikin-park-guide",
      title: "Daikin Park: The Ballpark and Downtown Houston",
      destination: "Houston, Texas",
      state: "Texas",
      county: "Harris County",
      intro: """
      Daikin Park stands at 501 Crawford Street in downtown Houston, and the
      Astros have played there since it opened in 2000. It has carried four
      names in that time; the current one took effect on January 1, 2025.

      This guide takes the ballpark first, then six places in downtown Houston,
      and then the ballpark's own record. Research for it rests on named
      sources fetched directly — MLB.com's Astros pages, English Wikipedia,
      Houston METRO's route guide, Harris County's government site, and the
      official pages of the parks and institutions named below.

      Two of those six places are public parks, where the question of trading
      does not arise. The other four rest on their own operators' pages for
      whether they are open today, which cannot establish it, so this guide
      does not say that they are.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Daikin Park",
          place_slug: "daikin-park",
          note:
            "501 Crawford Street: the Astros' home ballpark, open since 2000, built on the site of Houston's Union Station with part of the station incorporated into it. Capacity 41,168, with a retractable roof."
        },
        %{
          kind: "sight",
          name: "Market Square Park",
          place_slug: "market-square-park-houston",
          note:
            "301 Milam Street: a public park on the site of Houston's original city hall, reopened in its current form in 2010, holding James Surls's 25-foot sculpture \"Points of View\"."
        },
        %{
          kind: "sight",
          name: "Kennedy Bakery (La Carafe)",
          place_slug: "kennedy-bakery-la-carafe",
          note:
            "813 Congress Street: an 1860 building by the Irish-born baker John Kennedy, on the National Register since July 27, 1979 and a Recorded Texas Historic Landmark since 1981, housing La Carafe from 1970."
        },
        %{
          kind: "sight",
          name: "Sam Houston Park / The Heritage Society",
          place_slug: "sam-houston-park-heritage-society",
          note:
            "1100 Bagby Street: Houston's first public park, with ten historic structures from pre-Texas-Revolution times to 1891, managed in part by The Heritage Society since 1959."
        },
        %{
          kind: "sight",
          name: "Discovery Green",
          place_slug: "discovery-green",
          note:
            "1500 McKinney Street: a 12-acre park opened April 13, 2008, designed under Hargreaves Associates and run by a nonprofit conservancy that states it holds more than 600 free events a year."
        },
        %{
          kind: "sight",
          name: "House of Blues Houston",
          place_slug: "house-of-blues-houston",
          note:
            "1204 Caroline Street: a live-music venue opened in 2008 with a capacity of 1,800."
        },
        %{
          kind: "sight",
          name: "Downtown Aquarium",
          place_slug: "downtown-aquarium-houston",
          note:
            "410 Bagby Street: a Landry's-operated aquarium and restaurant complex opened in 2003 on a 6-acre site, with over 200 aquatic species and a 110,000-gallon centerpiece tank."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Houston METRO's own route guide lists Daikin Park directly under the
          METRORail Purple Line, at Congress and Crawford. That listing is
          worth naming for a second reason: it is a government transit
          operator using the ballpark's current name, which is independent
          evidence of both the name and the venue's operation.

          The Purple Line and the Green Line both run through downtown Houston,
          sharing the Convention District stations at Capitol and at Rusk and
          the EaDo/Stadium station. The Red Line also serves downtown, with a
          Preston station on that line, listed by METRO as R17.

          How far those stations stand from the ballpark is not described here.
          The encyclopedia gives that relationship in blocks and streets, and
          the verifier left an explicit instruction not to carry that phrasing
          into published prose, because it is the banned vague-proximity form.
          The stations and their lines are named; the distances are not
          described in any form.

          On buses, the encyclopedia's public-transit field for the ballpark
          lists more than a dozen METRO routes — 3, 6, 11, 20, 30, 37, 48, 50,
          77, 137, 163, 236, 255, 256 and 257 — serving downtown Houston. No
          source reached states that a particular one of them stops at the
          ballpark, and none is claimed to.

          On parking, the club's own parking page states that almost 25,000
          parking spaces are estimated to be available around downtown Houston
          for ballpark events, in street parking, garages and private lots, and
          instructs visitors to look for signs and banners with the baseball
          "P" that marks public parking. It publishes no price, and it names no
          Astros-operated lot. It recommends booking in advance through
          SpotHero.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          Market Square Park, at 301 Milam Street, stands on the site of
          Houston's original city hall and, later, a parking lot. It reopened
          in its current form in 2010 after a major renovation led by Downtown
          Houston+, formerly Central Houston, with the City of Houston Parks
          and Recreation Department. It holds "Points of View", a 25-foot-tall
          sculpture by the Texas artist James Surls dedicated in 1992, and is
          open daily from 6am to 11pm.

          The Kennedy Bakery building at 813 Congress Street, in the Main
          Street/Market Square Historic District, was built in 1860 by John
          Kennedy, an Irish-born baker who had arrived in Texas in 1842, and is
          described as probably the oldest Houston building on its original
          site. It was added to the National Register of Historic Places on
          July 27, 1979 and designated a Recorded Texas Historic Landmark in
          1981. By 1873 it operated as a drug store, and druggists were tenants
          through 1932. In 1970 ownership passed to William V. Berry, who
          opened La Carafe there — described by the source as one of the oldest
          bars operating in Houston as of 2012. That dated hedge is the
          source's own and is kept: it is not carried forward into a
          present-tense claim, and nothing establishes whether the bar is
          trading today.

          Sam Houston Park, at 1100 Bagby Street, is Houston's first public
          park. Mayor Samuel H. Brashear appointed Houston's first park
          committee in 1899 and acquired the park land from three owners around
          1900. The park holds ten historic structures spanning pre-Texas-
          Revolution times to 1891, among them the Kellum-Noble House of 1847,
          Houston's oldest brick dwelling, the Nichols-Rice-Cherry House of
          about 1850, and St. John Church, an 1891 building relocated to the
          park in 1968. The Heritage Society was founded in 1954 by twelve
          Houstonians — Faith Bybee, Harvin C. Moore Sr., Marie Lee Phelps and
          Ima Hogg among them — and took over management of the park's middle
          section in 1959, five years after its founding. Its own site gives
          museum gallery and historic house tour hours of Tuesday to Saturday,
          10 a.m. to 4 p.m.

          Discovery Green, at 1500 McKinney Street, is a 12-acre park that
          opened on April 13, 2008, on land the City of Houston assembled in
          two stages, acquiring part in 2002 and purchasing the remainder in
          2004. Design was led by Hargreaves Associates, and the $125 million
          project drew philanthropic funding including $10 million from the
          Kinder Foundation. It earned LEED Gold certification in October 2009.
          It is run by the Discovery Green Conservancy, a 501(c)(3) nonprofit,
          which states that more than 600 free events are held there every
          year, and it is open daily from 6am to 11pm.

          House of Blues Houston, at 1204 Caroline Street, opened in 2008 with
          a capacity of 1,800. That is the whole of what is published about it,
          and the reason is specific: the item describing its performance
          spaces named three that the verifier searched the cited article for,
          twice, and could not find for Houston or for any other House of Blues
          location.

          The Downtown Aquarium, at 410 Bagby Street, is a for-profit aquarium
          and restaurant complex operated by Landry's, Inc. It opened in 2003
          on a 6-acre site that redeveloped the former Fire Station No. 1 and
          the city's Central Waterworks Building, and it is accredited by the
          Association of Zoos and Aquariums. It houses over 200 species of
          aquatic animals across themed exhibits including a Louisiana Swamp, a
          shipwreck-themed area and a Sunken Temple; its 110,000-gallon
          centerpiece aquarium is described by the encyclopedia as the largest
          cylindrical tank in the United States; and it has a train ride
          through a shark habitat, a Ferris wheel and a carousel.

          One thing to know about the record behind these six. Market Square
          Park and Discovery Green are public parks, and the question of
          whether they trade does not apply to them. For the other four —
          Kennedy Bakery, The Heritage Society, House of Blues Houston and the
          Downtown Aquarium — the only evidence of current operation reachable
          was the operator's own page, and a business's own site cannot
          establish that it is trading. So this guide does not say those four
          are open. It does not say they have closed: no closure notice, dated
          report or successor was found for any of them, and none should be
          inferred.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          The ballpark opened in 2000, with an exhibition game on March 30 and
          the regular season on April 7, and it replaced the Astrodome. It was
          built on the site of Houston's historic Union Station, part of which
          is incorporated into the structure: the station's main concourse now
          holds a clubhouse, a cafe, a team store and office space. It was
          designed by HOK Sport, now Populous, its original construction cost
          was approximately $250 million, it has a retractable roof, and its
          current capacity is 41,168.

          Four names in twenty-five years. It opened as Enron Field. By
          February 27, 2002 the club and the sponsor had agreed to end those
          naming rights and the ballpark became Astros Field, from February to
          July of that year. Minute Maid bought the naming rights later in 2002
          and held them until 2025. On January 1, 2025 the stadium was renamed
          Daikin Park, under an agreement that runs through 2039.

          One consequence of a rename that recent is worth recording rather
          than smoothing over: Harris County's own government website, fetched
          during this research, still lists the venue as Minute Maid Park and
          does not mention Daikin Park anywhere. Houston METRO's route guide,
          fetched in the same session, lists the stop as Daikin Park. Both are
          government sources; one has updated and one has not.

          The franchise was established in 1962 as the Houston Colt .45s, a
          National League expansion team, and on December 1, 1964 announced the
          change of name to the Astros, reflecting Houston's role in the
          American space program. The Astros have played in the American League
          West since the 2013 realignment moved them from the National League
          Central. They won the World Series in 2017, against the Los Angeles
          Dodgers, and again in 2022, against the Philadelphia Phillies.
          """
        }
      ],
      faq: [
        %{
          "question" => "Is the ballpark still called Minute Maid Park?",
          "answer" =>
            "No. It was renamed Daikin Park effective January 1, 2025, under an agreement running through 2039, and before Minute Maid it was Astros Field from February to July 2002 and Enron Field from 2000. Sources have caught up at different speeds, which is worth knowing when checking: Houston METRO's route guide lists the stop as Daikin Park, while Harris County's own government website still lists the venue as Minute Maid Park and does not mention the current name anywhere."
        },
        %{
          "question" => "Which county is Daikin Park in?",
          "answer" =>
            "Harris County — on the county's own website, not on the source the research first cited. The finder attached the county to the encyclopedia's ballpark article, and the verifier pulled every infobox field verbatim: the Location line reads only \"Houston, Texas, U.S.\", and every occurrence of \"Harris County\" in the article is about the Harris County-Houston Sports Authority or 1990s funding history rather than the venue's location. Harris County's own site lists the venue among its sports venues and entertainment attractions, alongside NRG Park, the Toyota Center and BBVA Compass Stadium, which is the county naming itself as the administering jurisdiction."
        },
        %{
          "question" => "How close is the METRORail to the ballpark?",
          "answer" =>
            "This guide does not say, and the omission is deliberate. Houston METRO lists Daikin Park under the Purple Line at Congress and Crawford; the Purple and Green Lines share the Convention District stations at Capitol and at Rusk and the EaDo/Stadium station; and the Red Line has a Preston station, listed as R17. The encyclopedia describes how many blocks or streets separate some of those stations from the ballpark, and the verifier left an explicit instruction not to carry that phrasing into published prose, because it is the vague-proximity form this corpus bans. The stations are named and the distances are not described."
        },
        %{
          "question" => "What does parking cost?",
          "answer" =>
            "The club publishes no price. Its parking page states that almost 25,000 parking spaces are estimated to be available around downtown Houston for ballpark events, in street parking, garages and private lots, and tells visitors to look for signs and banners with the baseball \"P\" marking public parking. It names no Astros-operated lot, and it recommends booking in advance through SpotHero."
        },
        %{
          "question" => "Which of these places is confirmed open?",
          "answer" =>
            "The ballpark, on Houston METRO's own current route guide naming the stop by the venue's current name — a government source independent of the club. Market Square Park and Discovery Green are public parks, confirmed as such on their official pages, and the trading question does not apply to them. For Kennedy Bakery, The Heritage Society, House of Blues Houston and the Downtown Aquarium, the only current-operation evidence reachable was the operator's own page, which cannot establish trading, so no claim is made either way."
        }
      ],
      photos: []
    }
  end
end
