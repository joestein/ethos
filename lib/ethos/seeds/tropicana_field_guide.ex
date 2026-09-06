defmodule Ethos.Seeds.TropicanaFieldGuide do
  @moduledoc """
  Seeds the Tropicana Field guide. Idempotent by slug.

  Names the destination node `united-states/florida/st-petersburg`, so it lists
  on the Florida destination page and on St. Petersburg's. The ballparks model no
  county tier, so Pinellas County is recorded here as a sourced fact rather than
  as a field. Two confirmed verdicts establish it and neither infers it from the
  city name: the
  encyclopedia's ballpark article states Pinellas County in the venue's own
  address line, and the county government's site identifies itself as the
  "Pinellas County, Florida Website" with a footer copyrighted to Pinellas
  County and St. Petersburg within its remit.

  Every clause here restates text a `confirmed` verdict carries, or that the
  verifier's own reason or correction expressly states was confirmed.
  `docs/ballparks/tropicana-field.md` quotes each published sentence against
  the verdict it rests on and records each omission.

  What was dropped, and why:

    * **Two fabricated evidence quotes**, and one trading claim with them. See
      `Ethos.Seeds.TropicanaFieldPlaces` for the detail; the short form is that
      the finder attributed two phrases to encyclopedia articles that do not
      contain them, the Salvador Dali Museum's open status fell with its quote,
      and the Museum of Fine Arts' survived on different, dated evidence.

    * **A spatial relationship the source itself uses.** The verifier's
      correction on the Chihuly Collection is explicit: drop the clause placing
      it relative to the Morean Arts Center's main building, and state only the
      street and the year. Its reasoning is the one this corpus follows —
      *"[a] source using vague proximity does not license republishing it —
      unlike architectural style, this rule has no sourced-exception clause."*

    * **The pier's opening time**, which is sourced and confirmed. It is
      expressed as an interval before sunrise, which is duration-shaped; this
      corpus publishes no duration-shaped string, the ban scans module source,
      and its allowlist cannot be narrowed below a whole module, so the clause
      is dropped rather than the gate weakened. The pier's closing time is
      published. This moduledoc cannot quote the dropped clause for the same
      reason.

    * **The "since 1889" framing of the pier site's history**, refuted as an
      overstatement. The corrected dates ship.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8. Al Lang Stadium is a place record but carries
  `kind: "attraction"` rather than `stadium`, because in this corpus the
  `stadium` kind within the ballparks region is the set's roster key and is
  reserved for the thirty MLB venues; the gate in
  `test/ethos/seeds/ballpark_seed_data_test.exs` asserts exactly that.

  This research and its verification both ran with the WebSearch budget
  exhausted before the first query, and every source was fetched directly by
  name. The verifier records the consequence: still-trading evidence is thinner
  for the smaller businesses, and it is flagged per place rather than smoothed
  over.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "tropicana-field-guide",
      title: "Tropicana Field: The Ballpark and Downtown St. Petersburg",
      destination: "St. Petersburg, Florida",
      destination_path: "united-states/florida/st-petersburg",
      intro: """
      Tropicana Field stands at One Tropicana Drive in St. Petersburg, and the
      Tampa Bay Rays have played there since it opened on March 3, 1990 — with
      one interruption. Hurricane Milton tore through the roof on October 9,
      2024, the club spent the whole of the 2025 season in Tampa, and it
      returned on April 6, 2026.

      This guide takes the ballpark first, then seven places in St. Petersburg,
      and then the ballpark's own record.

      One thing about the research behind it should be said at the top, because
      it changed what this guide claims. The verifier found two evidence quotes
      in it that do not exist: phrases attributed to encyclopedia articles which
      full-text searches could not find in them. Both were offered as proof that
      a museum was operating. One museum's open status fell with its quote and
      is not claimed here; the other survived on different evidence, and this
      guide names that evidence rather than the quote.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Tropicana Field",
          place_slug: "tropicana-field",
          note:
            "One Tropicana Drive: the Rays' home ballpark, open since March 3, 1990, with a fixed roof and a capacity of 25,025. The club returned on April 6, 2026 after a season away for hurricane repairs."
        },
        %{
          kind: "sight",
          name: "Salvador Dali Museum",
          place_slug: "salvador-dali-museum",
          note:
            "Established March 7, 1982 and in its purpose-built building since January 11, 2011, holding 96 oil paintings and over 100 watercolors and drawings among some 1,300 further works."
        },
        %{
          kind: "sight",
          name: "St. Pete Pier",
          place_slug: "st-pete-pier",
          note:
            "A 26-acre pier opened July 6, 2020 at a cost of $92 million, with five restaurants, a playground, an environmental education center and Janet Echelman's \"Bending Arc\"."
        },
        %{
          kind: "sight",
          name: "Chihuly Collection",
          place_slug: "chihuly-collection-st-petersburg",
          note:
            "720 Central Avenue: a collection operated by the Morean Arts Center, founded in 1917 as the Art Club of St. Petersburg, in this building since 2016."
        },
        %{
          kind: "food",
          name: "Ferg's Sports Bar & Grill",
          place_slug: "fergs-sports-bar-grill",
          note:
            "A sports bar whose own site states it has operated since 1992 and lists Rays game-watching events on its calendar."
        },
        %{
          kind: "food",
          name: "Green Bench Brewing Company",
          place_slug: "green-bench-brewing-company",
          note:
            "1133 Baum Avenue N: a beer garden and tasting room producing craft beer, mead and cider, with a second location, Webb's City Cellar."
        },
        %{
          kind: "sight",
          name: "Al Lang Stadium",
          place_slug: "al-lang-stadium",
          note:
            "Opened in 1947 and named for a former mayor who brought baseball to the city from 1914; home of the Tampa Bay Rowdies since 2011, capacity 7,227."
        },
        %{
          kind: "sight",
          name: "Museum of Fine Arts, St. Petersburg",
          place_slug: "museum-of-fine-arts-st-petersburg",
          note:
            "Founded 1961 and open to the public since 1965, in the Downtown Waterfront District along Straub Park, with over 20,000 objects spanning nearly 5,000 years."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          The Pinellas Suncoast Transit Authority runs two services worth
          naming. The Central Avenue Trolley is a free service between Grand
          Central Station and the St. Pete Pier, running roughly 6:30 a.m. to
          10 p.m. daily. The SunRunner, a bus rapid transit line, connects
          Downtown St. Petersburg, the Central Avenue business districts,
          Pasadena and St. Pete Beach.

          The ballpark's own parking is in seven lots surrounding it, numbered
          1 through 7 and including premium and general areas.
          Wheelchair-accessible parking is in Lots 1 and 7, with most of the
          accessible spaces in Lot 7. Prepaid parking in Lots 2, 3, 5 and 6 can
          be bought up to six hours before first pitch, subject to
          availability. Game-day parking is sold by credit or debit card only;
          cash is not accepted. No parking price was established by this
          research and none is published.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          The Salvador Dali Museum was established on March 7, 1982 at an
          earlier location and moved to its current purpose-built building on
          January 11, 2011. Its collection runs to 96 oil paintings, over 100
          watercolors and drawings, 1,300 graphics, photographs, sculptures and
          objets d'art, and an extensive archival library; the encyclopedia
          describes it as holding more Dali masterworks than any museum other
          than the Dali Theatre-Museum in Spain. The building was designed by
          HOK with Yann Weymouth and built by The Beck Group, reportedly
          costing over $30 million — the source hedges that figure as a report,
          and the hedge is kept here. It has a glass "Enigma" entryway 75 feet
          tall with a spiral staircase, and 18-inch-thick concrete walls
          designed for hurricane protection. Its own site gives hours of 10
          a.m. to 6 p.m. daily and to 8 p.m. on Thursdays.

          The St. Pete Pier opened on July 6, 2020, spans 26 acres and cost $92
          million, following voter approval in May 2015 and a groundbreaking on
          June 28, 2017. It holds five restaurants, a playground, an
          environmental education center and artwork including Janet Echelman's
          "Bending Arc" — which the pier's own site listed as temporarily
          closed when this research was verified, a caveat on the sculpture and
          not on the pier. The pier's own site gives a closing time of 11 p.m.
          daily; it gives an opening time too, expressed as an interval before
          sunrise, and that clause is duration-shaped and cannot be published
          here.

          The waterfront's pier history runs back further than the current
          structure and further than the research first said. Pier structures
          stood there from at least 1854. The first large, centralized pier —
          the Railroad Pier, built by the Orange Belt Railway — went up in
          1889. The Million Dollar Pier of 1926, with its Mediterranean
          Revival-style Casino building, followed, and then the Inverted
          Pyramid Pier, which stood from 1973 to 2013.

          The Chihuly Collection is at 720 Central Avenue, where it relocated
          in 2016. It is operated by the Morean Arts Center, founded in 1917 as
          the Art Club of St. Petersburg by Margaret and Edith Tadd, and Dale
          Chihuly collaborated with the center on an exhibition in 2010. Its
          own site gives hours of 10 a.m. to 5 p.m. Monday to Saturday and noon
          to 5 p.m. on Sundays, closing at Christmas and Thanksgiving and at 3
          p.m. on several other holidays.

          Ferg's Sports Bar & Grill states on its own site that it has operated
          since 1992 and spans nearly two city blocks, and its calendar lists
          Rays game-watching events, trivia and concerts through September
          2026. Every part of that is the business's own account, including the
          founding year, which no other source reached states.

          Green Bench Brewing Company has a beer garden and tasting room at
          1133 Baum Avenue N and produces craft beer, mead and cider. Its own
          site describes a second location, Webb's City Cellar, with its own
          limited Thursday-to-Sunday hours. Its founding year and the origin of
          its name are on none of the pages this research reached.

          Al Lang Stadium opened in 1947 on the site of the St. Petersburg
          Athletic Park of 1923, and is named for Al Lang, a former mayor of
          St. Petersburg who was instrumental in bringing baseball to the city
          from 1914. It hosted spring training over the decades for the St.
          Louis Cardinals, the New York Yankees, the New York Mets and the
          Baltimore Orioles, the last from 1991 to 1995, and the Tampa Bay
          Devil Rays used it for spring training and minor-league play from
          1998 to 2008. Since 2011 it has been the home of the Tampa Bay
          Rowdies of the USL Championship; a renovation in 2015 added seating
          and removed portions of the outfield wall for soccer. Capacity is
          7,227, and it is owned by the City of St. Petersburg and operated by
          Big 3 Entertainment. Hurricane damage in 2024 — attributed by the
          source to Helene and Milton — sent the Rowdies to IMG Academy in
          Bradenton for their last two home games of that season.

          The Museum of Fine Arts was founded in 1961 and opened to the public
          in 1965, in the Downtown Waterfront District along Straub Park. It
          houses over 20,000 objects spanning nearly 5,000 years. The
          encyclopedia states that it holds the largest collection of art in
          the Tampa Bay area, and that its photography collection is recognized
          as one of the largest and most significant in the southeastern United
          States, with works by Ansel Adams, Edward Steichen and Julia Margaret
          Cameron. The original 1965 building is by the Palm Beach architect
          John Volk, in the Neoclassical style, with a curving colonnade along
          Beach Drive; a later expansion added the 39,000-square-foot Hazel
          Hough Wing, designed by Yann Weymouth of Hellmuth, Obata + Kassabaum.

          One thing to know about the record behind these seven. Three are
          published as operating: the pier, on the encyclopedia's ongoing
          present tense and a city-run site current for this year; Al Lang
          Stadium, on the encyclopedia describing the Rowdies calling it home;
          and the Museum of Fine Arts, on a dated appointment — Klaudio
          Rodriguez as Executive Director and CEO since 2024 — and exhibitions
          scheduled through 2025 and 2026. The other four carry no such claim.
          The Chihuly Collection, Ferg's and Green Bench Brewing rest on their
          own sites alone, and a business's own site cannot establish that it
          is trading. The Salvador Dali Museum is the fourth, and its case is
          different enough to be worth stating plainly rather than filing with
          the others: see the next paragraph. For all four, there is no
          evidence of closure, and none should be inferred.

          The Dali Museum's status was downgraded during verification, and the
          reason was the evidence rather than the museum. The research
          originally offered, as proof that the museum was operating, a
          sentence it attributed to the encyclopedia's article about it. Two
          independent full-text searches of that article found the sentence
          absent. With the quotation removed, the article's most recent dated
          content is three or more years old, and the museum's own site — which
          does show current ticketing and named exhibitions — cannot establish
          trading on its own. So this guide does not say the museum is open. It
          says nothing about it being closed either: no such evidence exists.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Tropicana Field opened on March 3, 1990, designed by HOK Sport of
          Kansas City, Lescher & Mahoney Sports of Tampa, and Criswell,
          Blizzard & Blouin Architects of St. Petersburg. It opened as the
          Florida Suncoast Dome, became the ThunderDome in 1993, and took its
          present name in 1996, after Tropicana Products signed a 30-year
          naming-rights deal that October. Capacity is 25,025, a figure dating
          from 2019, and the playing surface has been Shaw Sports Turf since
          2017.

          The roof is the building's defining feature and the reason for a
          sourced distinction: it is fixed rather than retractable, set at an
          angle to reduce interior volume and cooling costs, and the
          encyclopedia describes Tropicana Field as the only active Major
          League Baseball stadium with a fixed roof, tying that to Target
          Field's opening in 2010, when the Metrodome closed. Inside, the
          Cownose Clubhouse is a 35-foot, 10,000-US-gallon tank stocked with
          rays that spectators can view up close.

          The ballpark hosted the 2008 World Series, in which the Rays lost to
          the Philadelphia Phillies four games to one.

          On October 9, 2024, Hurricane Milton tore through the fiberglass
          roof. The Rays played the entire 2025 season at George M.
          Steinbrenner Field in Tampa while the repairs were made, and returned
          on April 6, 2026, beating the Chicago Cubs 6-4. The repair cost is
          given two ways inside the same encyclopedia: approximately $55
          million in the article on the ballpark, nearly $60 million in the
          article on the club. That disagreement is the source's, not this
          research's, and both figures are reported rather than one chosen.

          What comes next is unsettled and dated. A proposed Gas Plant Stadium
          replacement, costed at $1.2 billion, was cancelled in March 2025, and
          on cancellation the club also floated redeveloping Tropicana Field
          itself under a long-term lease. As of March 2026 the Rays are
          pursuing a new stadium on the Hillsborough Community College Dale
          Mabry campus, costed at $2.3 billion, targeting a 2029 opening with a
          capacity of roughly 30,000 to 35,000. MLB's own Rays ballpark page
          carries a "New Ballpark" link, pointing to a separate site from the
          current venue's page.
          """
        }
      ],
      faq: [
        %{
          "question" => "Are the Rays playing at Tropicana Field?",
          "answer" =>
            "Yes, since April 6, 2026. Hurricane Milton tore through the ballpark's fiberglass roof on October 9, 2024, and the club played the whole of the 2025 season at George M. Steinbrenner Field in Tampa while repairs were made. The return game was a 6-4 win over the Chicago Cubs. This is the best-evidenced open status in this research: two independently re-fetched sources agree on a specific, checkable event rather than a present-tense description."
        },
        %{
          "question" => "What did the roof repairs cost?",
          "answer" =>
            "Two figures, and the disagreement is inside the encyclopedia rather than in this research. The article on the ballpark gives approximately $55 million; the article on the club gives nearly $60 million. Both are reported here and neither is preferred."
        },
        %{
          "question" => "Is the Salvador Dali Museum open?",
          "answer" =>
            "This guide does not say, and the reason is about the evidence rather than the museum. The research originally offered a sentence attributed to the encyclopedia as proof the museum was operating; two independent full-text searches of that article found the sentence absent from it. Without it, the article's most recent dated content is three or more years old. The museum's own site shows current ticketing and named exhibitions, but a business's own site cannot establish that it is trading. There is no evidence the museum has closed, and none is asserted."
        },
        %{
          "question" => "Are the Rays staying at Tropicana Field?",
          "answer" =>
            "Not on the current plan, and the plan has already changed once. A proposed Gas Plant Stadium replacement, costed at $1.2 billion, was cancelled in March 2025, at which point the club also floated redeveloping Tropicana Field itself under a long-term lease. As of March 2026 the Rays are pursuing a new stadium on the Hillsborough Community College Dale Mabry campus, costed at $2.3 billion and targeting a 2029 opening with a capacity of roughly 30,000 to 35,000. All of that is dated March 2026 and should be re-checked."
        },
        %{
          "question" => "Why do several of these places have no street address?",
          "answer" =>
            "Because no verdict in this research carries one for them. The research artifact proposes an address for each place, but a proposal is not a finding: the addresses that ship here are the ones a confirmed verdict or the verifier's own text states — Tropicana Field's, the Chihuly Collection's, which comes from the verifier's own correction, and Green Bench Brewing's, which the verifier re-fetched and matched exactly. For the Dali Museum, the St. Pete Pier, Ferg's, Al Lang Stadium and the Museum of Fine Arts, nothing was verified, so nothing is published."
        }
      ],
      photos: []
    }
  end
end
