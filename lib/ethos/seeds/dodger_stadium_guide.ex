defmodule Ethos.Seeds.DodgerStadiumGuide do
  @moduledoc """
  Seeds the Dodger Stadium guide. Idempotent by slug.

  Carries `state: "California"` and `county: "Los Angeles County"`, from the
  confirmed verdict that the City of Los Angeles is the county seat and most
  populous city of Los Angeles County.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Los Angeles Dodgers research artifact, or the text a `refuted`
  verdict's correction supplies. `docs/ballparks/dodger-stadium.md` quotes
  each published sentence against the verdict it rests on.

  What was dropped, and why:

    * **Both Dodger Stadium Express frequencies are gone.** The confirmed
      verdicts give the Union Station route's headway and the South Bay
      route's headway as intervals in minutes. They are frequencies, not trip
      durations, and dropping them costs a reader something real — but the
      duration gate matches the string, its allowlist is keyed
      `{file, phrase}` over a whole module, and a pardon that broad would
      cover any later travel claim in the same file. The Wrigley checkpoint
      faced this exactly once, with Southport Grocery's sourced closing
      interval, and dropped the clause rather than widen the pardon. Same
      ruling here. The routes, their stops, their dedicated lane and the
      inning they run until are all published.

    * **No quotation from Stan Kasten or ownership** about the stadium name —
      refuted, not found in either cited source.

    * **No parking price.** A confirmed verdict records that none could be
      established: MLB.com and third-party ticketing and parking pages
      returned bot-blocked errors on every attempt.

    * **The Chinatown boundary is published as a disagreement**, not as a
      fact. The finder cited the Los Angeles Times' Mapping L.A.; the
      correction establishes that the boundary belongs to the Community
      Redevelopment Agency of the City of Los Angeles, and that Mapping L.A.
      puts the same bordering strip in Elysian Park rather than Chinatown.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "dodger-stadium-guide",
      title: "Dodger Stadium: The Ballpark and Chavez Ravine",
      destination: "Los Angeles, California",
      state: "California",
      county: "Los Angeles County",
      intro: """
      Dodger Stadium stands at 1000 Vin Scully Avenue, in the Elysian Park
      neighborhood of Los Angeles. Ground was broken on September 17, 1959 and
      it opened on April 10, 1962, built in under three years at a cost of
      about $23 million.

      This guide is short, and deliberately so: the research reached the
      ballpark, the 600-acre park it was carved out of, and one restaurant at
      the edge of Chinatown, and nothing has been added to make the set look
      fuller. Research was carried out from named sources fetched directly —
      English Wikipedia, the restaurant's own site, a city visitor page, and
      two news reports on the 2026 field naming-rights deal. Where the
      research could not establish something — a parking rate, a park's hours,
      which agency draws a neighbourhood boundary — this guide leaves it out
      and names the gap.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Dodger Stadium",
          place_slug: "dodger-stadium",
          note:
            "1000 Vin Scully Avenue: the Dodgers' home ballpark, opened April 10, 1962 at a cost of about $23 million, and the first Major League Baseball stadium since the original Yankee Stadium to be built with 100% private financing. A terraced parking area behind the main stands lets ticket holders park at roughly the level of their seats."
        },
        %{
          kind: "sight",
          name: "Elysian Park",
          place_slug: "elysian-park",
          note:
            "835 Academy Rd: 600 acres created by city ordinance on April 5, 1886, sponsored by the city engineer George Hansen. Angels Point, a hill inside it, overlooks the stadium and the downtown skyline; the Chavez Ravine Arboretum, open since 1893, holds more than 100 varieties of trees."
        },
        %{
          kind: "food",
          name: "Philippe The Original",
          place_slug: "philippe-the-original",
          note:
            "1001 N. Alameda Street: French-dipped sandwiches on a roll dipped in gravy, plus breakfast, soups, chili, salads and desserts. Continuously operating since 1908 and on the James Beard Foundation's America's Classics list. Its claim to have created the French Dipped Sandwich is its own."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          The Chinatown station of the Los Angeles Metro Rail system is the
          nearest rail station to the stadium.

          The Dodger Stadium Express is a free bus service operated by the Los
          Angeles County Metropolitan Transportation Authority, carrying
          ticket holders to and from the stadium during home games. Its Union
          Station route runs non-stop between Union Station and the stadium,
          using a dedicated bus lane along Sunset Boulevard and Vin Scully
          Avenue, and operates until the end of the second inning. Its South
          Bay route connects the South Bay to the stadium by way of the Harbor
          Transitway, stopping at Slauson, Manchester, Harbor Freeway,
          Rosecrans and the Harbor Gateway Transit Center.

          Both routes have a published headway, and neither appears here. The
          sources give them as intervals in minutes, and this corpus bans
          every duration-shaped string in seed prose without exception; the
          alternative was an allowlist entry broad enough to pardon a real
          travel claim added to the same file later. The transit agency
          publishes current frequencies.

          A large terraced parking area is built behind the main stands, at
          elevations that let ticket holders park at roughly the level of
          their seats. No published parking rate could be established from any
          source that this research could reach — MLB.com and third-party
          ticketing and parking pages returned bot-blocked errors on every
          attempt — so none is given here.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          The ballpark sits inside what was Elysian Park. The park was created
          by Los Angeles city ordinance on April 5, 1886, sponsored by the
          city engineer George Hansen at a time when the city had few others;
          the site had been considered worthless land, and was originally part
          of the Spanish land grant for the Pueblo of Los Angeles. It runs to
          600 acres. Parts of it were swapped for other lands held by the
          Dodgers when the stadium was built. Angels Point, a hill within the
          park, overlooks the stadium and the downtown Los Angeles skyline,
          and the Chavez Ravine Arboretum, open since 1893, holds more than
          100 varieties of trees from around the world. What the park's
          current visitor amenities and hours are could not be established:
          the official parks page returned HTTP 403 on every attempt.

          Philippe The Original is at 1001 N. Alameda Street, at the edge of
          Chinatown. Philippe Mathieu, a French immigrant, opened it in 1908 at
          300 N. Alameda Street; the Martin and Binder families have owned and
          operated it since 1927, and it moved to its present address in 1951
          after the original site was displaced by Hollywood Freeway
          construction. It has been continuously operating since 1908 and is
          one of the oldest restaurants in Los Angeles, and it appears on the
          James Beard Foundation's list of America's Classics. Its claim to
          have created the French Dipped Sandwich is its own claim, restated
          as a claim by the encyclopedia entry the research used, and it is
          published on those terms rather than as settled.

          Where Chinatown stops is itself disputed. The Community
          Redevelopment Agency of the City of Los Angeles draws Chinatown's
          north side at Stadium Way and Dodger Stadium/Chavez Ravine. The Los
          Angeles Times' Mapping L.A. project puts that same bordering strip
          in Elysian Park instead. Those two sources disagree, and this guide
          reports the disagreement rather than picking one.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          The club came west because a stadium plan failed in the east.
          Brooklyn Dodgers president Walter O'Malley tried to build a domed
          stadium in Brooklyn in the mid-1950s, could not reach an agreement
          with city officials on land acquisition, and negotiated with Los
          Angeles instead.

          The land he was offered had a history of its own. Chavez Ravine was
          acquired by the City of Los Angeles using eminent domain under the
          Housing Act of 1949, for a planned public-housing project. After the
          1953 election of mayor Norris Poulson, political support for that
          project collapsed, and following a municipal referendum on June 3,
          1958 approving a baseball-related land transfer, the Dodgers
          acquired the property. The displacement of the largely
          Spanish-speaking residents who had refused to sell became known as
          the Battle of Chavez Ravine.

          Ground was broken on September 17, 1959. The stadium opened on April
          10, 1962, built in under three years at a cost of about $23 million,
          and was the first Major League Baseball stadium since the
          construction of the original Yankee Stadium to be built with 100%
          private financing. Extensive renovations followed in 2012 and 2013
          under new ownership, including HD video boards and facility
          upgrades.

          The name has not changed. In 2026 the Dodgers signed a naming-rights
          deal with Uniqlo that covers only the playing field, branded "Uniqlo
          Field at Dodger Stadium" — the first naming-rights agreement in the
          stadium's 60-plus-year history. The stadium itself is still Dodger
          Stadium.
          """
        }
      ],
      faq: [
        %{
          "question" => "Has Dodger Stadium been renamed?",
          "answer" =>
            "No. In 2026 the Dodgers signed a naming-rights deal with Uniqlo covering only the playing field, branded \"Uniqlo Field at Dodger Stadium\". It is the first naming-rights agreement in the stadium's 60-plus-year history, and the stadium's own name is unchanged."
        },
        %{
          "question" => "How does the Dodger Stadium Express work?",
          "answer" =>
            "It is a free bus service run by the Los Angeles County Metropolitan Transportation Authority for ticket holders, during home games. The Union Station route runs non-stop, on a dedicated bus lane along Sunset Boulevard and Vin Scully Avenue, until the end of the second inning. The South Bay route runs by way of the Harbor Transitway, stopping at Slauson, Manchester, Harbor Freeway, Rosecrans and the Harbor Gateway Transit Center. Neither route's frequency is published here — see the transit agency for current headways."
        },
        %{
          "question" => "What does parking cost?",
          "answer" =>
            "No published rate could be established from any source this research could reach: MLB.com and third-party ticketing and parking pages returned bot-blocked errors on every attempt. What is established is the shape of the parking — a large terraced area behind the main stands, built at elevations that let ticket holders park at roughly the level of their seats."
        },
        %{
          "question" => "What was the Battle of Chavez Ravine?",
          "answer" =>
            "The name given to the displacement of the largely Spanish-speaking Chavez Ravine residents who had refused to sell. The City of Los Angeles had acquired the land by eminent domain under the Housing Act of 1949 for a planned public-housing project; support for that project collapsed after the 1953 election of mayor Norris Poulson, and a municipal referendum on June 3, 1958 approved a baseball-related land transfer, after which the Dodgers acquired the property."
        },
        %{
          "question" => "Did Philippe's invent the French dip?",
          "answer" =>
            "The restaurant claims it did. The encyclopedia entry this research used restates that as the restaurant's own claim rather than as an established fact, and this guide does the same. What is not in question is that Philippe The Original has been continuously operating since 1908, making it one of the oldest restaurants in Los Angeles, and that it appears on the James Beard Foundation's list of America's Classics."
        },
        %{
          "question" => "Why does this guide cover only three places?",
          "answer" =>
            "Because three is what the research established. This corpus has no minimum length for a guide, on purpose: a length floor is what produces filler, and roughly twenty summaries elsewhere in the corpus read as boilerplate because something had to fill the space. Nothing has been added here that a verdict does not support."
        }
      ],
      photos: []
    }
  end
end
