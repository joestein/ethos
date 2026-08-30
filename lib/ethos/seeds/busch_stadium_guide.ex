defmodule Ethos.Seeds.BuschStadiumGuide do
  @moduledoc """
  Seeds the Busch Stadium guide. Idempotent by slug.

  Carries `state: "Missouri"` and `county: "St. Louis"`. St. Louis is an
  independent city that separated from St. Louis County in 1877 and is not
  located within any county; the county field carries the city's own name so
  that the guide and its places share a destination hub, the same treatment
  Baltimore City gets in this wave.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 St. Louis Cardinals research artifact, or the text a `refuted`
  verdict's correction supplies. `docs/ballparks/busch-stadium.md` quotes each
  published sentence against the verdict it rests on.

  What was dropped, and why:

    * **"The article is silent on sponsorship" is refuted and does not
      appear.** The correction is precise: Wikipedia states Anheuser-Busch's
      20-year naming-rights deal was signed in 2004, nominally running to
      2024, and gives no information on renewal — the article is not silent on
      sponsorship, it is silent on renewal. The guide says that.

    * **No parking price.** MLB.com's parking and directions sub-pages both
      returned HTTP 406 to direct fetch and a search-results fetch produced
      nothing relevant. A confirmed verdict records that no official price
      could be established.

    * **No bus route.** A confirmed verdict records that none serving the
      ballpark could be confirmed from any source reached, and that this is a
      gap in the research rather than a statement that no route exists. The
      guide publishes it in those terms.

    * **No trading claim for four places**, all resting on an operator's own
      site. The verifier's one systematic finding in this batch was an
      internal inconsistency in how the finder applied its own rule to these
      four; they are treated alike here.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8. St. Louis Union Station is a place record and
  the MetroLink station of the same name is not — the building stopped
  carrying trains in 1978 and is a National Historic Landmark holding a hotel,
  an aquarium and a Ferris wheel. See the note in
  `test/ethos/seeds/ballpark_seed_data_test.exs`.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "busch-stadium-guide",
      title: "Busch Stadium: The Ballpark and Downtown St. Louis",
      destination: "St. Louis, Missouri",
      state: "Missouri",
      county: "St. Louis",
      intro: """
      Busch Stadium stands in downtown St. Louis near the interchange of
      Interstates 64, 55 and 44, straddling 7th and Clark Streets on part of
      the site of the demolished Busch Memorial Stadium. It opened with an
      exhibition game on April 4, 2006, held its first Major League game on
      April 10, and seats 46,861.

      This guide takes the ballpark first, then the entertainment complex
      built on the old stadium's footprint, and then the downtown the
      MetroLink's shared Red and Blue alignment strings together — the Gateway
      Arch and the Old Courthouse, two Gateway Mall parks, a museum in a shoe
      factory, a railroad station turned hotel and aquarium, and a riverfront
      district north of the Arch. The brewery is further out and is here for
      the name over the ballpark's door. Research was carried out with web
      search unavailable, from named sources fetched directly: English
      Wikipedia, NPS.gov, the regional transit agency's own site and the
      operators' own sites. Where a claim rests on an operator's own account of
      itself, this guide says so, and where the research could not establish
      something it names the gap.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Busch Stadium",
          place_slug: "busch-stadium",
          note:
            "700 Clark Street: the Cardinals' home ballpark, opened 2006, capacity 46,861. Built for $365 million to a design by Populous and Kennedy Associates/Architects Inc., with Jim Chibnall as lead designer; the Gate 3 entrance resembles the Eads Bridge."
        },
        %{
          kind: "sight",
          name: "Ballpark Village",
          place_slug: "st-louis-ballpark-village",
          note:
            "601 Clark Avenue: a mixed-use entertainment, dining and retail development on the site of the demolished Busch Memorial Stadium. Phase One opened March 27, 2014, Phase Two from June 2020. The tenant list is the operator's own."
        },
        %{
          kind: "food",
          name: "Salt + Smoke (Ballpark Village)",
          place_slug: "st-louis-salt-and-smoke-ballpark-village",
          note:
            "601 Clark Avenue: St. Louis-style barbecue — ribs with a signature rub smoked with cherry wood, plus chicken, brisket and pulled pork. One of eight Salt + Smoke locations in the St. Louis area."
        },
        %{
          kind: "sight",
          name: "Gateway Arch",
          place_slug: "st-louis-gateway-arch",
          note:
            "Gateway Arch National Park: 630 feet, the world's tallest arch and the tallest memorial in the United States. Designed by Eero Saarinen in 1947, built 1963-1965, opened to the public June 10, 1967. The west entrance faces Fourth Street and the Old Courthouse."
        },
        %{
          kind: "sight",
          name: "Old Courthouse",
          place_slug: "st-louis-old-courthouse",
          note:
            "Fourth Street, inside the national park: begun 1816, Federal-style building completed 1828, Greek Revival addition 1839, Rumbold's Italian Renaissance cast-iron dome 1861-1864. It hosted the Dred Scott proceedings; the Supreme Court ruled against Dred and Harriet Scott in 1857."
        },
        %{
          kind: "sight",
          name: "Kiener Plaza",
          place_slug: "st-louis-kiener-plaza",
          note:
            "Chestnut to Market, Broadway to 7th: 1.9 acres of the Gateway Mall, adjacent to the Old Courthouse and the national park, rebuilt for $23 million and reopened May 19, 2017. \"The Runner\" is by William Zorach."
        },
        %{
          kind: "sight",
          name: "Citygarden",
          place_slug: "st-louis-citygarden",
          note:
            "Eighth to Tenth, Market to Chestnut: 2.9 acres of sculpture garden built for $30 million and opened July 1, 2009, with 29 works including Haring, Maillol, Dine, Mitoraj and Opie. Free, with no admission fee."
        },
        %{
          kind: "sight",
          name: "St. Louis Union Station",
          place_slug: "st-louis-union-station",
          note:
            "1820 Market Street: a railroad station of 1894 by Theodore Link, a National Historic Landmark since 1970, carrying no Amtrak service since 1978. Now a 567-room Curio Collection hotel, the St. Louis Aquarium and a 200-foot Ferris wheel."
        },
        %{
          kind: "sight",
          name: "City Museum",
          place_slug: "st-louis-city-museum",
          note:
            "750 North 16th Street: opened October 25, 1997 in the former International Shoe Company factory, founded by Bob and Gail Cassilly. A walk-through bowhead whale, the Enchanted Caves slides, a Wurlitzer pipe organ, a rooftop Ferris wheel and MonstroCity."
        },
        %{
          kind: "sight",
          name: "Laclede's Landing",
          place_slug: "st-louis-lacledes-landing",
          note:
            "Washington Avenue to Dr. Martin Luther King Drive, North 3rd Street to the river: where Pierre Laclède founded St. Louis around 1780, and the only remaining section of the city's 19th-century commercial riverfront. No current tenant is named by any source reached."
        },
        %{
          kind: "sight",
          name: "Anheuser-Busch Brewery",
          place_slug: "st-louis-anheuser-busch-brewery",
          note:
            "1200 Lynch St: 142 acres and 189 buildings, a National Historic Landmark District since November 13, 1966, much of it red brick Romanesque. The Brew House of 1891-1892 has multi-story hop chandeliers; the grounds hold the Lyon Schoolhouse Museum and the Clydesdales' exercise field."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Busch Stadium is served by the Red and Blue Lines of the St. Louis
          MetroLink light rail system, at the Stadium station. Those two lines
          share the same 16-station downtown alignment, which also includes the
          Union Station, Civic Center, 8th & Pine, Convention Center and
          Laclede's Landing stations — which is why so much of this guide is
          reachable on one alignment. The Old Courthouse is described as
          accessible from the 8th & Pine station.

          The regional transit agency puts it plainly on its own site: "With
          access to Busch Stadium, Enterprise Center, Energizer Park and The
          Dome, Metro makes it easy [to] enjoy the game without worrying about
          parking and traffic."

          Two gaps, both stated rather than filled. No official parking price
          is published here: the club's ballpark page references game-day
          parking and links to a dedicated parking and directions page, but
          both sub-pages returned HTTP 406 to direct fetch and no price could
          be retrieved from any other source reached. And no specific city or
          regional bus route serving the ballpark could be confirmed from any
          source reached in this research. That is a gap in the record, not a
          statement that no bus route exists.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          Ballpark Village sits at 601 Clark Avenue, on the footprint of the
          demolished Busch Memorial Stadium. Phase One opened on March 27, 2014
          and Phase Two began opening in June 2020. In August 2026 the
          operator's own site listed Prairie Farms Ice Cream Barn, Sports &
          Social St. Louis, Pizza Bar, Salt + Smoke, AVA Garden Bar, Live!
          Arena and PBR St. Louis, with retail at Baseballism, Cardinals
          Authentics, New Era Store, Scott Credit Union and CardVault by Tom
          Brady, plus the Live! by Loews hotel, and a further venue, The
          Clydesdale, listed to open on August 27, 2026. That is the operator's
          own tenant list, and this guide presents it as one.

          One name is missing from it. Wikipedia lists a Cardinals Hall of Fame
          and Museum among Ballpark Village's venues; the operator's own August
          2026 list does not carry that name. Whether the venue closed, moved,
          or was renamed or absorbed into another could not be determined, and
          nothing here should be read as a closure.

          Salt + Smoke's Ballpark Village branch serves St. Louis-style
          barbecue: ribs with a signature rub, smoked with cherry wood, plus
          chicken, brisket and pulled pork. It is one of eight Salt + Smoke
          locations in the St. Louis area, alongside Delmar Loop, St. Charles,
          South County, Kirkwood, Edwardsville in Illinois, Hampton and
          Ellisville.

          Gateway Arch National Park holds two of this guide's entries. The
          arch itself is 630 feet, the world's tallest arch and the tallest
          memorial in the United States; visitors enter by the west entrance,
          which faces Fourth Street and the Old Courthouse, and an underground
          visitor centre of 70,000 square feet houses the Museum of Westward
          Expansion. The Old Courthouse is the older building by a century and
          a half: begun in 1816, its Federal-style core finished in 1828, a
          Greek Revival addition in 1839, portions redesigned from 1851, and
          William Rumbold's Italian Renaissance cast-iron dome — modeled on St.
          Peter's Basilica — added between 1861 and 1864. At 192 feet it was
          Missouri's tallest habitable building from 1864 to 1894. It hosted
          the proceedings of Dred Scott v. Sandford, in which the Supreme Court
          ruled against Dred and Harriet Scott in 1857, and it has held four
          National Park Service history galleries and two restored courtrooms
          since the city abandoned it in 1930 and the site joined the Jefferson
          National Expansion Memorial in 1940.

          Two Gateway Mall parks follow. Kiener Plaza runs 1.9 acres between
          Chestnut and Market and between Broadway and 7th Street, adjacent to
          the Old Courthouse and the national park, with William Zorach's
          statue and fountain "The Runner"; its eastern half opened in 1965,
          its western half and the Morton D. May Amphitheater in 1986, and it
          closed in February 2016 for a $23 million rebuild before reopening on
          May 19, 2017. Citygarden runs 2.9 acres between Eighth and Tenth and
          between Market and Chestnut, built for $30 million and opened to the
          public on July 1, 2009, holding 29 sculptures by artists including
          Keith Haring, Aristide Maillol, Jim Dine, Igor Mitoraj and Julian
          Opie. It is free, with no admission fee.

          St. Louis Union Station is at 1820 Market Street. It opened as a
          railroad station on September 1, 1894, to Theodore Link's design with
          the civil engineer George H. Pegram, with 31 tracks under an enclosed
          train shed, and on completion it was the world's largest and busiest
          railroad station. Amtrak stopped using it on October 31, 1978. It has
          been a National Historic Landmark since 1970, and an adaptive-reuse
          renovation begun in 1985 turned it into a 567-room Curio Collection
          by Hilton hotel, the St. Louis Aquarium — opened December 25, 2019,
          described as featuring more than 13,000 animals across over 250
          species — and the St. Louis Wheel, a 200-foot Ferris wheel with
          climate-controlled gondolas. The Grand Hall keeps its gold-leafed
          ceiling, Romanesque arches, 65-foot barrel vault and stained glass;
          the building is Indiana limestone and its clock tower is 230 feet.

          The City Museum is at 750 North 16th Street, in the former
          International Shoe Company factory and warehouse that Bob and Gail
          Cassilly bought in 1993 and opened as a museum on October 25, 1997.
          It holds a life-size walk-through bowhead whale sculpture, the
          multi-slide Enchanted Caves, a Wurlitzer pipe organ from a historic
          New York theater, a rooftop Ferris wheel and the outdoor MonstroCity
          structure of repurposed aircraft fuselages and industrial materials.

          Laclede's Landing lies north of Gateway Arch National Park, separated
          from it by the Eads Bridge, bounded by Washington Avenue, North 3rd
          Street, Dr. Martin Luther King Drive and the Mississippi. It marks
          where Pierre Laclède founded St. Louis around 1780, with his
          14-year-old stepson Auguste Chouteau tasked with preparing the land,
          and its brick-and-cast-iron warehouses of 1850 to 1900 — the only
          remaining section of the city's 19th-century commercial riverfront —
          have been converted into shops, restaurants and bars. No source
          reached names one of them, so none is named here.

          The Anheuser-Busch Brewery is a 142-acre complex of 189 buildings,
          added to the National Register and designated a National Historic
          Landmark District on November 13, 1966, and a City of St. Louis
          Landmark. Much of it is red brick Romanesque; the Brew House of 1891
          to 1892 is noted for multi-story hop chandeliers, ornate ironwork and
          natural light. The Budweiser Clydesdales can be seen in their
          exercise field and carriage house, and the Lyon Schoolhouse Museum is
          on the grounds. The brewery's own tour site states tours every day
          from 10am to 5pm in five formats and states no price.

          One thing to know about the record behind all of this. Four of these
          places — Ballpark Village, Salt + Smoke, the City Museum and the
          brewery — rest on an operator's own site for whether they are
          trading, and an operator's own site cannot establish that. This guide
          therefore says nothing about whether those four are open now. It does
          not say they have closed either: there is no evidence of that, and
          none should be inferred. Telephone first.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          The St. Louis Cardinals franchise was established in 1882 and
          competes in the National League Central Division. It has won 11 World
          Series championships — 1926, 1931, 1934, 1942, 1944, 1946, 1964,
          1967, 1982, 2006 and 2011 — the second-most in Major League Baseball
          history behind the New York Yankees, and holds 19 National League
          pennants, third-most among all teams.

          The current Busch Stadium broke ground on January 17, 2004 and opened
          in 2006 at a cost of $365 million, about $583 million in 2025
          dollars. Populous, formerly HOK Sport, designed it with Kennedy
          Associates/Architects Inc., and Jim Chibnall was lead designer. It
          stands on part of the site of the demolished Busch Memorial Stadium,
          straddling 7th and Clark Streets near the interchange of Interstates
          64, 55 and 44, and seats 46,861. The Gate 3 entrance incorporates a
          bridge structure designed to resemble the historic Eads Bridge — the
          same bridge that separates Laclede's Landing from the Arch grounds.

          On the name: Anheuser-Busch signed a 20-year naming-rights deal in
          2004, nominally running to 2024. No source reached gives any
          information on whether that deal was renewed, and this guide makes no
          claim about it either way.

          The address itself has two forms. The club's own ballpark page gives
          700 Clark Street; Wikipedia's infobox gives 700 Clark Ave. Both name
          the same address, and no source reached settles the suffix.
          """
        }
      ],
      faq: [
        %{
          "question" => "How does public transit reach Busch Stadium?",
          "answer" =>
            "The Red and Blue Lines of the MetroLink light rail system serve the ballpark at the Stadium station. Those lines share a 16-station downtown alignment that also includes Union Station, Civic Center, 8th & Pine, Convention Center and Laclede's Landing, so most of this guide sits on one line. No specific city or regional bus route serving the ballpark could be confirmed from any source this research reached — a gap in the record rather than a statement that none exists."
        },
        %{
          "question" => "What does parking cost?",
          "answer" =>
            "No official price could be established, and none is published here. The club's ballpark page references game-day parking and links to a dedicated parking and directions page, but both of those sub-pages returned HTTP 406 to direct fetch and no price was retrievable from any other source reached."
        },
        %{
          "question" => "Is the ballpark still called Busch Stadium?",
          "answer" =>
            "Nothing this research reached says otherwise. What the record does establish is narrower than it might look: Anheuser-Busch signed a 20-year naming-rights deal in 2004, nominally running to 2024, and the source gives no information on whether it was renewed. The source is not silent on the sponsorship; it is silent on the renewal."
        },
        %{
          "question" => "What happened to the Cardinals Hall of Fame and Museum?",
          "answer" =>
            "This research could not determine it. Wikipedia lists a Cardinals Hall of Fame and Museum among Ballpark Village's venues; the operator's own tenant list, as it stood in August 2026, does not carry that name. Whether the venue closed, relocated, or was renamed or absorbed into another listed venue is unresolved, and this is a conflict between two sources rather than a confirmed closure."
        },
        %{
          "question" => "Why does this guide not say whether some of these places are open?",
          "answer" =>
            "Because the only evidence is the operator's own. Ballpark Village, Salt + Smoke, the City Museum and the Anheuser-Busch Brewery each rest on a site the business itself publishes, and a business's own site establishes that it makes a statement, not that the statement is currently true. A live same-day hours listing, which two of these carry, is a stronger signal than a static claim — but it is still the operator's word. None of that is evidence of closure, and none is stated as such."
        },
        %{
          "question" => "Why does the Gateway Arch entry give no year for the visitor centre?",
          "answer" =>
            "Because the sources disagree between 1976 and 1977 and the research could not settle it. The instruction was to drop the year rather than assert either. What is established is the centre's size, 70,000 square feet, its housing of the Museum of Westward Expansion, and its $176 million renovation finished in July 2018."
        }
      ],
      photos: []
    }
  end
end
