defmodule Ethos.Seeds.TargetFieldGuide do
  @moduledoc """
  Seeds the Target Field guide. Idempotent by slug.

  Carries `state: "Minnesota"` and `county: "Hennepin County"`, so it lists on
  both the Minnesota destination page and the Hennepin County one. The county
  comes from the verdict — *"Minneapolis is the county seat of Hennepin County,
  Minnesota"*, confirmed against `en.wikipedia.org/wiki/Hennepin_County,_Minnesota`,
  which is the source that carries it. The artifact's own top-level
  `status_verdict` settles it in terms: *"Hennepin County is a standard US county
  that is also the address's administering jurisdiction and names itself exactly
  that, so the identity-blocking bar is cleared without needing the
  independent-city or no-county exceptions."*

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Minnesota Twins research artifact, or the text a `refuted` verdict's
  correction names as publishable. `docs/ballparks/target-field.md` quotes each
  published sentence against the verdict it rests on and records each omission.

  What was dropped, and why:

    * **The adjacency between the ballpark and the parking ramps.** The verifier
      refuted it *even though the cited source itself says "immediately adjacent
      to"*, because no source gives a measured distance and the site's rule
      requires an address, a distance, or silence. The correction supplies the
      three ramps' street addresses, and those are what this guide gives.

    * **No parking rate.** The ABC Ramps operator's own site advertises access
      to the ballpark by skyway but publishes no event-parking rate for Twins
      games, and no other source fetched states one.

    * **No seating capacity.** No source fetched gave one dated to the current
      season.

    * **Four self-sourced awards and superlatives**, each resting on the
      business claiming it.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: no station, no ramp and no bus route becomes a
  page. Target Center *is* a place — it is an arena with major-league tenants, a
  dated renovation and a named manager, not transit infrastructure — while
  Target Field Station, named after the ballpark, is prose.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "target-field-guide",
      title: "Target Field: The Ballpark and the Minneapolis Warehouse District",
      destination: "Minneapolis, Minnesota",
      state: "Minnesota",
      county: "Hennepin County",
      intro: """
      Target Field stands at 1 Twins Way in the Warehouse District of downtown
      Minneapolis, in Hennepin County. It opened on April 12, 2010, when the
      Minnesota Twins played and won their inaugural game there against the
      Boston Red Sox.

      This guide takes the ballpark first, then the theater, museum, parks,
      bridge, arena and restaurants around it, and then the team's own record.
      Research for it was carried out with web search unavailable — the budget
      was exhausted on the first query, in both the research pass and the
      verification pass — so every source was fetched directly by URL: English
      Wikipedia, an independent ballpark directory, Metro Transit and
      transit-agency articles, and the businesses' own sites. Minneapolis's open
      data portal did not yield queryable business-licence records, so there is
      no licence evidence here at all. Six of the eleven places rest on their
      own websites or on undated descriptions, and this guide does not say those
      six are trading.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Target Field",
          place_slug: "target-field",
          note:
            "1 Twins Way: the Twins' home ballpark, open since April 12, 2010. Open-air and natural-turf with no retractable roof, built in local limestone, with a canopy over the upper deck, heated viewing areas and a heated field. Host of the 2014 MLB All-Star Game."
        },
        %{
          kind: "sight",
          name: "Guthrie Theater",
          place_slug: "guthrie-theater",
          note:
            "818 South 2nd Street: opened May 7, 1963 with Hamlet, in a Ralph Rapson building; the current Jean Nouvel facility of 2006 has three performance spaces seating 1,100, 700 and 199 and a 178-foot cantilevered \"Endless Bridge\" toward the Mississippi."
        },
        %{
          kind: "sight",
          name: "Mill City Museum",
          place_slug: "mill-city-museum",
          note:
            "704 South 2nd Street: opened in 2003 inside the ruins of the Washburn \"A\" Mill, run by the Minnesota Historical Society, with exhibits on Minneapolis history and flour milling including the \"Flour Tower\"."
        },
        %{
          kind: "sight",
          name: "Stone Arch Bridge",
          place_slug: "stone-arch-bridge-minneapolis",
          note:
            "Across the Mississippi at Saint Anthony Falls: 2,100 feet of 21 stone arches plus one steel truss span, built 1881-1883 for James J. Hill, converted to a pedestrian and bicycle pathway in 1994. The only arched bridge made of stone on the entire Mississippi River."
        },
        %{
          kind: "sight",
          name: "Gold Medal Park",
          place_slug: "gold-medal-park",
          note:
            "Downtown East: 7.5 acres opened in May 2007 to Tom Oslund's design, with a 32-foot mound on a spiral walkway, about 300 trees, luminescent benches, and Walker Art Center sculptures including works by Mark di Suvero and Tony Cragg."
        },
        %{
          kind: "sight",
          name: "Target Center",
          place_slug: "target-center",
          note:
            "600 First Avenue North: an arena open since October 13, 1990, home to the Timberwolves and the Lynx, owned by the City of Minneapolis and managed by Legends Global, renovated for $140 million by October 2017."
        },
        %{
          kind: "food",
          name: "Spoon and Stable",
          place_slug: "spoon-and-stable",
          note:
            "211 North First Street, North Loop: Gavin Kaysen's first restaurant, opened November 2014, named 2015 Restaurant of the Year by Food & Wine and Best New Restaurant by Bon Appetit, and a 2015 James Beard Award finalist."
        },
        %{
          kind: "food",
          name: "Bar La Grassa",
          place_slug: "bar-la-grassa",
          note:
            "800 Washington Avenue North: an Italian restaurant established by the chef Isaac Becker and Nancy St. Pierre, per the restaurant's own site."
        },
        %{
          kind: "food",
          name: "Black Sheep Coal Fired Pizza",
          place_slug: "black-sheep-coal-fired-pizza-north-loop",
          note:
            "600 Washington Avenue, North Loop: coal-fired pizza, salads, appetizers, desserts and craft cocktails, from ovens its own site says reach at least 1,200 degrees on anthracite coal."
        },
        %{
          kind: "food",
          name: "The Freehouse",
          place_slug: "the-freehouse",
          note:
            "701 North Washington Avenue: a restaurant and brewery serving from breakfast through evening, per its own site."
        },
        %{
          kind: "food",
          name: "Kieran's Irish Pub",
          place_slug: "kierans-irish-pub",
          note:
            "85 North 6th Street: an Irish pub in the Cara Irish Pubs group, whose own site describes over 30 years in downtown Minneapolis and game-day watch parties including for Minnesota Lynx games."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Light rail is the connection the ballpark was built around. The Metro
          Blue Line and the Metro Green Line both terminate at Target Field
          Station, which opened on November 14, 2009 in the North Loop area of
          Minneapolis and is named after the ballpark. As of 2025 the station
          averages 1,725 daily light-rail boardings, ranking sixth of Metro
          Transit's 37 rail stations. It also connects to Metro Transit's C Line
          and D Line bus rapid transit routes and to local bus routes 9, 14, 22
          and 94.

          One service that used to terminate there no longer runs. The Northstar
          Line, a commuter-rail service, ceased operating on January 4, 2026;
          its last trains ran that day, serving a Vikings-Packers game, and
          replacement bus service began on January 5, 2026. The closure followed
          declining post-pandemic ridership — down from 767,500 riders in 2019
          to 121,800 in 2025 — a funding dispute with Anoka County, and an
          August 2025 decision by transit agencies to terminate the line in
          favor of bus service.

          On parking, the record gives addresses rather than a rate, and gives
          no relationship between the ramps and the ballpark. Target Field's
          address is 1 Twins Way. The ABC Ramps parking complex comprises Ramp A
          at 101 North 9th Street, Ramp B at 516 2nd Avenue North and Ramp C at
          318 2nd Avenue North; the complex sits at the end of Interstate 394
          and includes two transit bus terminals with a downtown skyway
          connection. The operator's own site advertises the complex as offering
          "easy access to Target Center and Target Field" via skyway
          connections, and publishes no specific event-parking rate for Twins
          games. No other source fetched states one, so no price appears here.

          A note on why the ramps are given by address. The research first wrote
          that the ballpark is "immediately next to" the A and B ramps, which is
          close to the cited source's own phrasing. Verification struck it
          anyway: an unquantified adjacency between two named places is not
          publishable on this site, and no source gives a measured distance.
          Addresses are checkable; "immediately next to" is not.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          The neighborhood is the North Loop, commonly known as the Warehouse
          District, and it was historically Minneapolis's main commercial
          shipping hub. The Minneapolis Warehouse Historic District comprises
          about 62 structures on seven square blocks of six-to-eight-story
          buildings in the Chicago Commercial style, and is listed on the
          National Register of Historic Places. Target Field opened in 2010 on
          the neighborhood's southwest edge. The district's population was 7,540
          in 2020, up from 338 in 1980 — a gentrification that accelerated from
          the mid-1990s onward and converted former warehouses into restaurants,
          shops, lofts and apartments.

          Four of the restaurants here are in that conversion. Spoon and Stable,
          at 211 North First Street, is the chef Gavin Kaysen's first restaurant,
          opened in November 2014; it was named 2015 Restaurant of the Year by
          Food & Wine and Best New Restaurant by Bon Appetit, and was a 2015
          James Beard Award finalist for Best New Restaurant. Those awards are
          published because they come from an independent article about the chef
          rather than from the restaurant's own page — which is exactly why the
          awards claimed by three other businesses here do not appear. Bar La
          Grassa, at 800 Washington Avenue North, is an Italian restaurant
          established by the chef Isaac Becker and Nancy St. Pierre. Black Sheep
          Coal Fired Pizza, at 600 Washington Avenue, serves coal-fired pizza,
          salads, appetizers, desserts and craft cocktails from ovens its own
          site says reach at least 1,200 degrees on anthracite coal. The
          Freehouse, at 701 North Washington Avenue, is a restaurant and brewery
          serving from breakfast through evening.

          Kieran's Irish Pub is at 85 North 6th Street, part of the Cara Irish
          Pubs group, and its own site describes over 30 years as an Irish pub in
          downtown Minneapolis along with game-day watch parties, including for
          Minnesota Lynx games. One question this research could not settle:
          whether this address is the same Kieran's as an earlier downtown
          location that a 2020 news report — referenced during the research but
          never fetched — suggested had closed that year. The site's claim is
          published as the site's claim, and no unbroken history at this address
          is asserted.

          Away from the North Loop, the riverfront carries the rest. The Guthrie
          Theater is at 818 South 2nd Street: it opened on May 7, 1963 with a
          production of Hamlet in a building by Ralph Rapson, and the current
          facility, completed in 2006, is Jean Nouvel's, with three performance
          spaces seating 1,100, 700 and 199 and a 178-foot cantilevered "Endless
          Bridge" reaching toward the Mississippi River, accessible during
          regular building hours. Mill City Museum is at 704 South 2nd Street,
          opened in 2003 inside the ruins of the former Washburn "A" Mill flour
          mill and operated by the Minnesota Historical Society, with exhibits on
          Minneapolis history and flour milling including the interactive "Flour
          Tower". Gold Medal Park, in the Downtown East neighborhood, is 7.5
          acres opened in May 2007 to the landscape architect Tom Oslund's
          design, with a 32-foot-high mound reached by a spiral walkway, about
          300 trees, specially designed luminescent benches and public sculptures
          from the Walker Art Center collection, among them works by Mark di
          Suvero and Tony Cragg; the City of Minneapolis and the Guthrie Theater
          owned it jointly at first, and in 2014 the Gold Medal Park Conservancy
          bought the majority of the Guthrie-owned parkland and took a 50-year
          lease on the rest. It is named after the Gold Medal flour brand.

          The Stone Arch Bridge crosses the Mississippi at Saint Anthony Falls:
          21 stone arch spans plus one steel-deck truss span, 2,100 feet long,
          and the only arched bridge made of stone on the entire Mississippi
          River. James J. Hill commissioned it in 1881 for his Great Northern
          Railway, and the engineer Col. Charles C. Smith designed it to avoid
          damaging the sandstone at the falls; construction took 22 months and
          completed in 1883 at a cost of about $650,000, and it was initially
          nicknamed "Hill's Folly". It was added to the National Register of
          Historic Places in 1971, received National Historic Civil Engineering
          Landmark designation in 1974, and was converted to a pedestrian and
          bicycle pathway in 1994. It hosts the Stone Arch Festival of the Arts
          on Father's Day weekend and Fourth of July fireworks.

          Target Center, at 600 First Avenue North, opened on October 13, 1990
          and is the home arena of the NBA's Minnesota Timberwolves and the
          WNBA's Minnesota Lynx, hosting concerts and other events besides. The
          City of Minneapolis owns it and Legends Global manages it; a $140
          million renovation of the exterior, seating and technology completed in
          October 2017.

          One thing to know about the record behind the food and drink. Web
          search was unavailable to this research and to its verification alike,
          and Minneapolis's open data portal yielded no queryable business
          licences — so there is no licence evidence anywhere in this guide, and
          for five restaurants and the theater and museum there is no
          independent, dated statement of current operation either. This guide
          therefore does not say those six are open. It does not say they have
          closed: there is no evidence of that, and none should be inferred.
          Telephone first.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Target Field opened on April 12, 2010, replacing the Hubert H.
          Humphrey Metrodome as the Twins' home, and the club signed a 30-year
          lease for it. The Twins won their inaugural game there against the
          Boston Red Sox on opening day.

          It is an open-air, natural-turf, baseball-only ballpark with no
          retractable roof, built with local limestone. Three features are often
          run together and the sources keep them apart: there is a canopy over
          the upper deck, there are heated viewing areas, and there is a heated
          field. The canopy itself is not described as heated by any source
          fetched, and it is not described that way here.

          The ballpark hosted the 2014 Major League Baseball All-Star Game on
          Tuesday, July 15, 2014.

          No seating capacity appears anywhere on this site. No source fetched
          for this research gave a capacity figure dated to the current season,
          and an undated one is not worth the space.

          The franchise relocated to Minnesota from Washington, D.C. in 1961 and
          has played under the name Minnesota Twins continuously since.
          """
        }
      ],
      faq: [
        %{
          "question" => "How do you reach Target Field on public transit?",
          "answer" =>
            "The Metro Blue Line and Metro Green Line both terminate at Target Field Station, which opened on November 14, 2009 in the North Loop and is named after the ballpark; as of 2025 it averages 1,725 daily light-rail boardings, sixth of Metro Transit's 37 rail stations. The station also connects to the C Line and D Line bus rapid transit routes and to local bus routes 9, 14, 22 and 94."
        },
        %{
          "question" => "Does the Northstar commuter train still run to the ballpark?",
          "answer" =>
            "No. The Northstar Line ceased operating on January 4, 2026, its last trains running that day for a Vikings-Packers game, with replacement bus service beginning on January 5, 2026. The closure followed post-pandemic ridership decline — 767,500 riders in 2019 against 121,800 in 2025 — a funding dispute with Anoka County, and an August 2025 decision by transit agencies to terminate the line in favor of bus service."
        },
        %{
          "question" => "What does parking cost at Target Field?",
          "answer" =>
            "No source fetched for this guide states a rate. The ABC Ramps complex — Ramp A at 101 North 9th Street, Ramp B at 516 2nd Avenue North and Ramp C at 318 2nd Avenue North — sits at the end of Interstate 394 and includes two transit bus terminals with a downtown skyway connection; its operator's own site advertises \"easy access to Target Center and Target Field\" via skyway but publishes no specific event-parking rate for Twins games."
        },
        %{
          "question" => "What is Target Field's seating capacity?",
          "answer" =>
            "This guide does not say. No source fetched for this research gave a capacity figure dated to the current season, and publishing an undated one would be a guess dressed as a fact."
        },
        %{
          "question" => "Is the canopy over the upper deck heated?",
          "answer" =>
            "No source says so. The research's first draft described a \"heated upper-deck canopy\"; verification found that the source states \"a canopy above the top deck\" and, separately, \"heated viewing areas and a heated field\", as two distinct features, and never calls the canopy itself heated. The heated viewing areas and the heated field are real; the heated canopy was the two facts merged."
        },
        %{
          "question" => "Why do some restaurants here have awards listed and others not?",
          "answer" =>
            "Because of where the award claim comes from. Spoon and Stable's awards — Food & Wine's 2015 Restaurant of the Year, Bon Appetit's Best New Restaurant, and a 2015 James Beard Award finalist nod — appear in an independent encyclopedia article about the chef Gavin Kaysen. Bar La Grassa's James Beard Award, Black Sheep's \"first coal-burning pizza restaurant in Minnesota\" and \"Award Winning Pizza\", and The Freehouse's Great American Beer Festival medals appear only on those businesses' own sites, and a business's own site cannot establish an award or a superlative about itself. None of the four is published here."
        },
        %{
          "question" => "Why does this guide not say whether the restaurants are open?",
          "answer" =>
            "Because nothing independent and dated could be reached for them. Web search was exhausted before the first query in both the research pass and the verification pass, so every source was fetched directly by URL, and Minneapolis's open data portal produced no queryable business-licence records — the substitute other cities in this set supplied. Six places rest on a business's own site or on an undated description. None of that is evidence of closure, and none is stated as such."
        }
      ],
      photos: []
    }
  end
end
