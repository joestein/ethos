defmodule Ethos.Seeds.LoandepotParkGuide do
  @moduledoc """
  Seeds the loanDepot park guide. Idempotent by slug.

  ## The county, and the source it does not come from

  Carries `state: "Florida"` and `county: "Miami-Dade County"`, so it lists on
  both the Florida destination page and the Miami-Dade County one.

  **The county was not taken from the source the finder cited for it.** The
  finder's identity item appended "Miami-Dade County" to MLB.com's ballpark
  page, and the verifier refuted it in terms: the page displays the venue name,
  the street address and the zip, and *"contains neither the word 'Miami-Dade'
  nor 'county' anywhere. The county clause is not supported by the cited
  source; it was appended without a source that actually carries it."*

  The value ships from the two confirmed verdicts that do carry it. The
  encyclopedia's article on the ballpark names Miami-Dade County as the
  stadium's owner and the county commission as a party to its funding
  agreement, and the article on the club states verbatim that the franchise
  changed its name *"[a]s part of an agreement with the park owner, Miami-Dade
  County, to use the stadium"*.

  ## Sourcing

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Miami Marlins research artifact.
  `docs/ballparks/loandepot-park.md` quotes each published sentence against the
  verdict it rests on and records each omission.

  What was dropped, and why:

    * **The station name both cited sources still carry.** Two `getting_there`
      items named the Metrorail station nearest the ballpark by a name the
      verifier established has been superseded, and attributed the line service
      to pages that do not state it. The station's current name and its line
      service are published from the station's own article, which the verifier
      fetched and quotes; the superseded name is not.

    * **The figures for how long the roof takes to open and to close.** The
      roof item is `refuted` for giving one figure where the source gives two.
      The figures are duration-shaped besides, and this corpus publishes no
      duration-shaped string — the ban scans module source and its allowlist
      cannot be narrowed below a whole module, so a clause like that goes
      rather than the gate, and this moduledoc cannot quote what it records
      dropping. The roof's tonnage, which the verifier confirms exactly, does
      ship.

    * **Pastels.** The artwork item is `refuted` because the finder rewrote the
      source's own description of the colours the ballpark's zones take from a
      painter's palette. The sculpture, the walkway and the colours as the
      source describes them all ship; the finder's version does not.

    * **"a nearby train station"**, which is a confirmed item's own wording.
      "Nearby" is an unmeasurable gesture, and this corpus drops those even
      when a source uses one — the wave-2 precedent, where an adjacency a
      source stated as "immediately adjacent to" was dropped for want of a
      measured distance.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: Culmer station is prose.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "loandepot-park-guide",
      title: "loanDepot park: The Ballpark and Little Havana",
      destination: "Miami, Florida",
      state: "Florida",
      county: "Miami-Dade County",
      intro: """
      loanDepot park stands at 501 Marlins Way in Miami, on the former site of
      the Miami Orange Bowl in Little Havana. It opened for the regular season
      on April 4, 2012 as Marlins Park and has carried its present name since
      March 31, 2021.

      This guide takes the ballpark first, then five places in and around
      Little Havana, and then the ballpark's own record. The ballpark is the
      one place here the research did not treat as a place: it was established
      through the identity and history work instead, and its record is built
      from those verdicts.

      Four of the five places around it carry no statement about whether they
      are trading. In each case the identity is settled and the trading
      evidence stops short of today, and the guide says which is which rather
      than rounding either way.
      """,
      entries: [
        %{
          kind: "sight",
          name: "loanDepot park",
          place_slug: "loandepot-park",
          note:
            "501 Marlins Way: the Marlins' home ballpark, open since April 4, 2012, on the former Miami Orange Bowl site in Little Havana. Named Marlins Park until 2020 and loanDepot park since March 31, 2021."
        },
        %{
          kind: "sight",
          name: "Maximo Gomez Park",
          place_slug: "maximo-gomez-park-miami",
          note:
            "Calle Ocho: the park nicknamed Domino Park, a gathering place for Cuban immigrants to play dominoes, drink coffee and smoke cigars since the early 1970s, named for a general of Cuba's War of Independence."
        },
        %{
          kind: "sight",
          name: "Tower Theater",
          place_slug: "tower-theater-miami",
          note:
            "1508 SW 8th Street: an Art Deco building in Little Havana which hosts the Viernes Culturales (Cultural Fridays) events."
        },
        %{
          kind: "sight",
          name: "Ball & Chain",
          place_slug: "ball-and-chain-miami",
          note:
            "1513 SW 8th Street: a historic live music venue originally opened in 1935, where Harry Gibson appeared on the same bill as Billie Holiday at Christmas 1956."
        },
        %{
          kind: "food",
          name: "Versailles Restaurant",
          place_slug: "versailles-restaurant-miami",
          note:
            "3555 SW 8th Street: opened in 1971 by Felipe A. Valls Sr., a Cuban exile from Santiago de Cuba, and a James Beard Foundation America's Classics award winner in 2001."
        },
        %{
          kind: "sight",
          name: "South River Drive Historic District",
          place_slug: "south-river-drive-historic-district-miami",
          note:
            "The eastern end of Little Havana along the Miami River: 25 acres and 9 historic buildings, locally designated in 1987 and listed on the National Register on August 10, 1987."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Public transportation directly to the ballpark is limited, and the
          source says so itself. Free trolleys shuttle fans to and from the
          Downtown Miami Civic Center area or a train station, on game days
          only. A "Marlins Shuttle" also operates from Culmer Metrorail station
          on game days; Culmer's own article lists loanDepot Park among its
          places of interest, and the station has carried the same name since
          it opened in 1984.

          The Metrorail station nearest the ballpark is UHealth-Jackson, served
          by the Green Line toward Dadeland South and the Orange Line toward
          Miami International Airport. The station opened on December 17, 1984
          as Civic Center and was renamed on July 12, 2024. Both sources the
          research first cited for it still carry the superseded name, and
          neither states which lines call there; the name and the line service
          published here come from the station's own article, which the
          verifier fetched and quoted.

          On parking, the ballpark has four main parking garages and six
          surface lots on site, with a combined capacity of approximately 5,600
          vehicles. Parking tickets are pre-purchased in the same way as
          seating tickets, and lots can sell out before game day. No parking
          price was established by this research and none is published.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          The neighborhood is Little Havana, and the ballpark stands on the
          site of the Miami Orange Bowl, which was demolished in March 2008.

          Maximo Gomez Park sits on Calle Ocho, the neighborhood's Eighth
          Street. It is nicknamed Domino Park, and it has been a gathering
          place for Cuban immigrants to play dominoes, drink coffee and smoke
          cigars since the early 1970s. It is named for Maximo Gomez, a general
          of Cuba's War of Independence, and today it also hosts food tours and
          art festivals. No exact street number is published for it: only the
          Calle Ocho location is sourced, and the city and county parks pages
          that would settle it returned 403 and 404 to automated requests.

          The Tower Theater, at 1508 SW 8th Street, is an Art Deco building
          that hosts the Viernes Culturales — Cultural Fridays — events. Its
          own website, re-fetched during verification, is a placeholder page
          headed "Tower Theater Miami — Returns Soon", which identifies the
          venue as "Miami Dade College's Tower Theater Miami" and directs
          visitors to the Miami Film Festival for current screenings. That is
          not a statement that the theater is trading, and it is not a closure
          notice either — it implies an intended reopening. This guide says
          neither.

          Ball & Chain, at 1513 SW 8th Street, is a historic live music venue
          originally opened in 1935. The musician Harry Gibson appeared at the
          Ball & Chain nightclub in Miami on the same bill as Billie Holiday
          during the Christmas season of 1956. No dedicated encyclopedia
          article for the venue exists, only passing mentions in others, so the
          detail of its closure in that era and its later reopening is not
          established here, and neither are its current hours, ownership or
          offerings.

          Versailles Restaurant, at 3555 SW 8th Street, opened in 1971, founded
          by Felipe A. Valls Sr., a Cuban exile from Santiago de Cuba — and
          that founding is confirmed independently of the restaurant's own
          account, on the encyclopedia's article rather than its own page. It
          won a James Beard Foundation America's Classics award in 2001, an
          award published here because a confirmed verdict carries it, though
          the foundation's own database could not be fetched and the award
          rests on the encyclopedia's account. For decades the restaurant has
          been a central gathering place for Miami's Cuban exile community,
          hosting political fundraisers and rallies, drawing media coverage of
          events related to Cuba, and receiving visits from U.S. presidents and
          other politicians.

          The South River Drive Historic District lies at the eastern end of
          Little Havana along the Miami River. The Miami City Commission
          designated it locally in 1987 and it was added to the National
          Register of Historic Places later that year, on August 10, 1987. It
          covers 25 acres and contains 9 historic buildings, developed
          principally in the first two decades of the twentieth century, and
          the encyclopedia describes it as the city's oldest extant group of
          vernacular frame buildings near the Miami River. Which of the
          contributing buildings, if any, house publicly visitable businesses
          was not established.

          One thing to know about the record behind these five. Four of them —
          the park, the theater, the music venue and the restaurant — carry no
          statement about whether they are open, and the reasons differ. The
          park has no dated source of any kind. The theater's own site says
          only that it returns soon. The music venue's own site is live, and a
          business's own site cannot establish that it trades. The restaurant
          has the strongest evidence of the four and still not enough: an
          independent account documents a presidential visit on June 13, 2023,
          which shows it open and operating then, three years before this
          research. None of that is evidence of closure, and none should be
          read as any. The historic district is not a business and the question
          does not apply to it.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          The ballpark opened for the regular season on April 4, 2012, on the
          former site of the Miami Orange Bowl, which was demolished in March
          2008. It was named Marlins Park from 2012 to 2020 and was renamed
          loanDepot park on March 31, 2021, after loanDepot bought the naming
          rights. Construction cost was reported at $634 million, about $889
          million in 2025 dollars, and the ballpark achieved LEED Gold
          certification on May 25, 2012.

          The retractable roof consists of roughly 8,300 tons of steel. How
          long it takes to open and to close is not published: the item
          carrying those figures was refuted for giving one number where the
          source gives two, and the numbers are duration-shaped besides, which
          this corpus does not publish at all.

          The design incorporates a home run sculpture by Red Grooms and a
          tiled walkway by Carlos Cruz-Diez titled "Chromatic Induction in a
          Double Frequency". The ballpark's four zone colors — green, red,
          yellow and blue — are drawn from what the source calls the four
          bright primary colors of Joan Miro's palette. The finder's item
          called them pastels, which is a word the same article uses elsewhere
          for something else entirely, and that reading was refuted.

          The franchise began play in 1993 as the Florida Marlins and was
          renamed the Miami Marlins prior to the 2012 season, as part of an
          agreement with the park owner, Miami-Dade County, to use the new
          stadium. Before the move the Marlins shared Sun Life Stadium with the
          Miami Dolphins; loanDepot park was their first home designed
          exclusively for baseball.

          The club won the World Series in 1997, beating the Cleveland Indians
          4-3, and again in 2003, beating the New York Yankees 4-2. The
          encyclopedia records that the 1997 team was the first to win the
          World Series as a wild card.
          """
        }
      ],
      faq: [
        %{
          "question" => "Which county is loanDepot park in?",
          "answer" =>
            "Miami-Dade County — and the source for that is not the one the research first cited. The finder appended the county to MLB.com's ballpark page, which the verifier re-fetched and found to contain neither the word \"Miami-Dade\" nor the word \"county\" anywhere. The county ships instead on two confirmed verdicts: the encyclopedia's ballpark article, which names Miami-Dade County as the stadium's owner and the county commission as a party to its funding agreement, and the club's article, which states that the franchise renamed itself as part of an agreement with the park owner, Miami-Dade County."
        },
        %{
          "question" => "Which Metrorail stations serve the ballpark?",
          "answer" =>
            "Two of them. The nearest is UHealth-Jackson, served by the Green Line toward Dadeland South and the Orange Line toward Miami International Airport; it opened on December 17, 1984 as Civic Center and was renamed on July 12, 2024, and both sources the research first cited still carry the old name, so the name and lines here come from the station's own article instead. Separately, a \"Marlins Shuttle\" operates from Culmer Metrorail station on game days, and Culmer's own article lists loanDepot Park among its places of interest."
        },
        %{
          "question" => "Is there parking at the ballpark?",
          "answer" =>
            "Yes, on site: four main parking garages and six surface lots, with a combined capacity of approximately 5,600 vehicles. Parking tickets are pre-purchased in the same way as seating tickets, and lots can sell out before game day. No price was established by this research and none is published."
        },
        %{
          "question" => "Which of these places is confirmed open?",
          "answer" =>
            "The ballpark. Of the five places around it, one is a historic district, for which the question does not arise, and the other four carry no trading claim: Maximo Gomez Park has no dated source, the Tower Theater's own site shows a \"Returns Soon\" placeholder, Ball & Chain rests on its own live site alone, and Versailles Restaurant has independent dated evidence — a documented presidential visit on June 13, 2023 — that is three years old. Absence of evidence is not evidence of closure, and no closure is asserted for any of them."
        },
        %{
          "question" => "What does the guide say about the roof and the artwork?",
          "answer" =>
            "It describes both, minus the two clauses the verifier refuted. The roof's tonnage is published and the figures for how long it takes to open and to close are not: the finder gave one number where the source gives two, and the numbers are duration-shaped besides, which this corpus does not publish at all. The sculpture, the tiled walkway and the four zone colors are published as the source describes them — bright primary colors from Joan Miro's palette, not the pastels the finder wrote."
        }
      ],
      photos: []
    }
  end
end
