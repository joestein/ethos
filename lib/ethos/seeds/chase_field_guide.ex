defmodule Ethos.Seeds.ChaseFieldGuide do
  @moduledoc """
  Seeds the Chase Field guide. Idempotent by slug.

  ## The county, and the citation that was corrected

  Carries `state: "Arizona"` and `county: "Maricopa County"`, so it lists on
  both the Arizona destination page and the Maricopa County one.

  **The finder's county citation was refuted.** It attached "Maricopa County"
  to the encyclopedia's Chase Field article, and the verifier found the article
  does not say it: the infobox Location field reads only *"Phoenix, Arizona,
  U.S."*, and the only two appearances of "Maricopa" are the Owner field
  ("Maricopa County Stadium District") and a funding-history sentence about the
  county's Board of Supervisors — *"an entity name and a funding fact, neither
  a statement of the venue's jurisdiction."* The verifier names the pattern:
  *"the same shape of miscitation the Wrigley Field checkpoint's finder was
  caught on for Cook County: a plausible-sounding county claim attributed to a
  page that does not say it."*

  **The value survived on a corrected source.** The verifier established it via
  the encyclopedia's article on Phoenix, whose infobox states the city's county
  as Maricopa, combined with the independently confirmed street address, noting
  that Phoenix does not span county lines. That is the source published here.

  ## Sourcing

  Every clause here restates text a `confirmed` verdict carries, or that the
  verifier's own reason or correction expressly states was confirmed.
  `docs/ballparks/chase-field.md` quotes each published sentence against the
  verdict it rests on and records each omission.

  What was dropped, and why:

    * **Three trading claims resting on quotations that do not exist**, two of
      which took a place's open status with them. See
      `Ethos.Seeds.ChaseFieldPlaces` for the detail.

    * **A street number.** Two sources give different ones for Matt's Big
      Breakfast on the same street, and the verifier's `could_not_establish`
      names the question as open. Both are published; neither is chosen.

    * **Parking rates and garage names**, which no reachable source publishes:
      the club's own transportation subpages returned HTTP 406 to every fetch.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: the two Valley Metro Rail stations are prose.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "chase-field-guide",
      title: "Chase Field: The Ballpark and Downtown Phoenix",
      destination: "Phoenix, Arizona",
      state: "Arizona",
      county: "Maricopa County",
      intro: """
      Chase Field stands at 401 East Jefferson Street in downtown Phoenix, and
      the Arizona Diamondbacks have played there since it opened on March 31,
      1998 — under a different name. It was Bank One Ballpark until 2005.

      This guide takes the ballpark first, then six places in downtown Phoenix,
      and then the ballpark's own record.

      One thing about the research behind it changed what this guide claims.
      Three of the seven places came with evidence of current operation that
      turned out to be quotations the cited articles do not contain. Two of
      those places are published here without any statement about whether they
      are open; the third's status survived, because the article carries a real
      sentence saying the same thing, and it is that sentence the guide rests
      on.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Chase Field",
          place_slug: "chase-field",
          note:
            "401 East Jefferson Street: the Diamondbacks' home ballpark, open since March 31, 1998, with a retractable roof, a swimming pool and a capacity of 48,330."
        },
        %{
          kind: "sight",
          name: "Mortgage Matchup Center",
          place_slug: "mortgage-matchup-center-phoenix",
          note:
            "201 East Jefferson Street: the downtown arena of the Phoenix Suns and Phoenix Mercury, under that name since 2025."
        },
        %{
          kind: "sight",
          name: "Rosson House Museum",
          place_slug: "rosson-house-museum",
          note:
            "113 North 6th Street, at the corner of Monroe Street: an 1894-95 Stick-Eastlake Queen Anne mansion in Heritage Square, on the National Register since June 3, 1971."
        },
        %{
          kind: "sight",
          name: "Arizona Science Center",
          place_slug: "arizona-science-center",
          note:
            "600 Washington Street: a science center opened in 1984, in an Antoine Predock-designed 120,000-square-foot building since 1997."
        },
        %{
          kind: "sight",
          name: "Herberger Theater Center",
          place_slug: "herberger-theater-center",
          note:
            "222 East Monroe Street: a three-stage performing-arts venue opened in 1989, named for the founder of the Herberger's department store chain."
        },
        %{
          kind: "food",
          name: "Pizzeria Bianco",
          place_slug: "pizzeria-bianco-heritage-square",
          note:
            "623 East Adams Street: the original location of a pizzeria established in 1987, in Heritage Square since 1996, whose chef won a James Beard award in 2003."
        },
        %{
          kind: "food",
          name: "Matt's Big Breakfast",
          place_slug: "matts-big-breakfast-phoenix",
          note:
            "A breakfast-and-lunch restaurant that opened downtown in late October 2004, with Best of Phoenix awards from the Phoenix New Times across seven years to 2019."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Chase Field is served by two Valley Metro Rail stations on the A
          Line: 3rd Street/Jefferson eastbound and 3rd Street/Washington
          westbound. The A Line runs from the Downtown Phoenix Hub, where both
          of those stations sit, out to Gilbert Road/Main Street.

          On parking, no published official price could be established, and the
          reason is worth stating: the club's own transportation and
          driving-directions subpages returned HTTP 406 to every automated
          fetch and could not be read at all. A third-party ballpark-directions
          site gives the ballpark's address and says parking is available east
          of 7th Street and in other surrounding areas, but names no garages
          and states no rates. Neither a garage name nor a rate appears here.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          The downtown arena at 201 East Jefferson Street is called the
          Mortgage Matchup Center, and the name is worth pausing on because it
          reads like an error and is not. The encyclopedia gives the venue's full
          naming history ending "Mortgage Matchup Center (2025-present)", and
          the arena's own site names itself the same way at 201 East Jefferson
          Street. It is the home of the Phoenix Suns and the Phoenix Mercury.

          The Rosson House is at 113 North 6th Street, at the corner of Monroe
          Street, within Heritage Square. It was built in 1894 and 1895 in the
          Stick-Eastlake Queen Anne style of Victorian architecture and was
          added to the National Register of Historic Places on June 3, 1971.
          The City of Phoenix bought the property in 1974 and restored it, and
          the Heritage Square Foundation and Guild operates the restored house
          as a historic house museum in the city's Heritage and Science Park,
          offering public tours.

          The Arizona Science Center, at 600 Washington Street in the same
          Heritage and Science Park, was conceived in 1980 as a pilot science
          center by the Junior League of Phoenix and opened to the public in
          1984 as the Arizona Museum of Science & Technology. It relocated in
          1997 to its current 120,000-square-foot facility, designed by the
          architect Antoine Predock. As of April 2026 Tammy Stewart is its
          Hazel A. Hare President and CEO, and in October 2025 it opened the
          renovated Dorrance DOME, an 8K-plus resolution LED dome display.

          The Herberger Theater Center, at 222 East Monroe Street, is an indoor
          performing-arts venue with three stages — Center Stage, Stage West
          and the Performance Outreach, or Kax, Stage. It opened in 1989 and
          was conceived as part of the redevelopment of downtown Phoenix, and
          it is named after G. Robert Herberger, founder of the Herberger's
          department store chain. The source credits it with more than 40
          different performances a year, drawing about 175,000 patrons and
          30,000 school children annually, and attaches no date to those
          figures.

          Pizzeria Bianco's original location is at 623 East Adams Street. The
          restaurant was established in 1987 and moved to Heritage Square in
          1996. Chef Chris Bianco won a James Beard Foundation award for best
          Southwest Chef in 2003, and the source describes him as the only
          pizza chef to have won a regional James Beard award; the restaurant
          took a Zagat score of 29 in 2000. Further locations opened in the
          Biltmore area of Phoenix in 2013 and in Los Angeles in 2022.

          Matt's Big Breakfast opened in downtown Phoenix in late October 2004
          and its own site gives hours of 7am to 2pm daily. Its address is an
          open question rather than a fact here: its own site gives 817 N 1st
          Street and the Phoenix New Times restaurant directory gives 825 N.
          First Street, and nothing reached settles which is right. That
          directory credits the restaurant with the paper's Best Breakfast or a
          related award in its annual Best of Phoenix poll in 2012, 2013, 2014,
          2015, 2016, 2018 and 2019 — an award from an independent source
          rather than the restaurant's own claim, and one that stops in 2019.

          One thing to know about the record behind these six. Three are
          published as operating: the arena, on two independent sources
          agreeing on its current name and its NBA and WNBA tenants; the Rosson
          House, on the encyclopedia's present-tense sentence about the
          foundation operating it and offering public tours; and the Arizona
          Science Center, on dated evidence — an April 2026 leadership
          statement and an October 2025 renovation opening.

          The other three carry no such claim, and two of them lost it during
          verification. The evidence originally offered for the Herberger
          Theater Center was a quotation saying the venue "remains active"; the
          word "active" does not occur in that article at all. The evidence
          offered for Pizzeria Bianco was that its article states the
          restaurant remains operational; the article is written in the past
          tense throughout and states no such thing. For Matt's Big Breakfast,
          the finder's own call was already uncertain and the verifier endorsed
          it: the restaurant's own site cannot establish that it trades, and
          the independent source carries nothing dated past 2019. None of that
          is evidence of closure for any of the three, and none should be
          inferred.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Chase Field opened on March 31, 1998 as Bank One Ballpark, after Bank
          One purchased the naming rights for $100 million over 30 years. It
          was renamed Chase Field in 2005, when JPMorgan Chase acquired those
          rights following the Bank One and JPMorgan Chase merger. Capacity has
          been 48,330 since 2023.

          Two features define the building in the desert: a retractable roof
          and a signature swimming pool, which together let spectators avoid
          Phoenix's summer heat and its monsoon storms.

          The Diamondbacks franchise was established on March 9, 1995 and began
          play in 1998 as a National League expansion team. In 2001 it beat the
          three-time defending champion New York Yankees to win the World
          Series, in what the source describes as the fastest an expansion team
          has reached a championship in Major League Baseball history.
          """
        }
      ],
      faq: [
        %{
          "question" => "Which county is Chase Field in?",
          "answer" =>
            "Maricopa County — on a corrected source. The research first attached the county to the encyclopedia's Chase Field article, and the verifier found that article does not state it: its Location field reads only \"Phoenix, Arizona, U.S.\", and the only appearances of \"Maricopa\" are the owning stadium district's name and a sentence about the county Board of Supervisors approving a sales tax. The county was re-established instead from the encyclopedia's article on Phoenix, whose infobox states the city's county as Maricopa, together with the independently confirmed street address; Phoenix does not span county lines."
        },
        %{
          "question" => "Is the arena really called the Mortgage Matchup Center?",
          "answer" =>
            "Yes. It reads like a transcription error and is not one. The encyclopedia's naming history for the venue ends \"Mortgage Matchup Center (2025-present)\", and the arena's own site names itself the same way at 201 East Jefferson Street, listing the Phoenix Suns and Phoenix Mercury as its tenants. The verifier checked it specifically for that reason."
        },
        %{
          "question" => "What does parking cost at Chase Field?",
          "answer" =>
            "No source this research could reach publishes a price, and the obstacle was mechanical rather than editorial: the club's own transportation and driving-directions subpages returned HTTP 406 to every automated fetch. A third-party directions site says parking is available east of 7th Street and in other surrounding areas, and names no garages and no rates. Nothing more is published here."
        },
        %{
          "question" => "Which of these places is confirmed open?",
          "answer" =>
            "Four of seven. The ballpark, the Mortgage Matchup Center, the Rosson House Museum and the Arizona Science Center — the last on dated evidence, an April 2026 leadership statement and an October 2025 renovation opening. The Herberger Theater Center, Pizzeria Bianco and Matt's Big Breakfast carry no claim. For the first two, that is because the evidence originally offered for them was quotations the cited articles do not contain; for the third, because the only independent source carries nothing dated past 2019. There is no evidence of closure for any of them."
        },
        %{
          "question" => "What is Matt's Big Breakfast's address?",
          "answer" =>
            "This guide does not say, because two sources disagree and nothing reached settles it. The restaurant's own site gives 817 N 1st Street, Phoenix, Arizona 85004; the Phoenix New Times restaurant directory gives 825 N. First Street. Both are published here and neither is placed in the record's address field as though it were settled."
        }
      ],
      photos: []
    }
  end
end
