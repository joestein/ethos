defmodule Ethos.Seeds.YankeeStadiumGuide do
  @moduledoc """
  Seeds the Yankee Stadium guide. Idempotent by slug.

  Carries `state: "New York"` and `county: "Bronx"`. The county is the
  verifier's, not the finder's: the artifact's `identity.county` reads "Bronx
  County" and was **refuted**, with the correction "Bronx", against this
  corpus's borough-as-county convention — every Brooklyn seed file carries
  `"county": "Brooklyn"` and every Manhattan one `"Manhattan"`. Publishing the
  legal name would derive `/destinations/new-york/bronx-county` and put this
  guide on a hub of its own rather than on the borough's.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 New York Yankees research artifact, or the text a `refuted`
  verdict's correction supplies. `docs/ballparks/yankee-stadium.md` quotes each
  published sentence against the verdict it rests on.

  What was dropped, and why:

    * **The B train's service pattern is the verifier's.** The finder wrote
      "the B train on weekdays"; the correction narrows it to weekdays during
      rush hours and middays only, and that is what the transit prose says.

    * **The $25 parking figure is written as history, not as a price.** The
      verdict's own words are "was expected to cost" and the source is the
      account of the stadium's construction. Written in the present tense it
      would be a claim about 2026 that nothing supports, which is the same
      failure the Wrigley rooftop revenue share was rewritten to avoid.

    * **No trading claim for four places**, and the "Around the ballpark"
      section says which and why rather than leaving a reader to assume.

    * **No inspection-record prose.** Six strings here — the intro, a section
      body, three entry notes and an FAQ answer — named the municipal record
      the three River Avenue businesses were discovered through and published
      the date it carried. An inspection record may support a `status`
      judgement and may never appear in a sentence, and the word "inspection"
      being absent never made it compliant. It survived because
      `test/ethos/seeds/place_content_gate_test.exs` walked JSON seed files
      and code *places* modules only: the identical sentence in
      `Ethos.Seeds.YankeeStadiumPlaces` failed that gate while these six
      passed. `Ethos.Seeds.Catalog.guides_owned/0` now puts every guide module
      inside it, and a scan of all thirty-seven found these six and nothing
      else.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: no station, no garage and no bus route becomes a
  page.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "yankee-stadium-guide",
      title: "Yankee Stadium: The Ballpark and the Streets Around It",
      destination: "Bronx, New York",
      state: "New York",
      county: "Bronx",
      intro: """
      Yankee Stadium stands at 1 East 161st Street in the Bronx. It opened in
      2009, cost about $2.3 billion including $1.2 billion in public
      subsidies, and was designed by Populous with Turner Construction as
      general contractor. It replaced the 1923 stadium of the same name, whose
      site is now a park.

      This guide takes the ballpark first, then the two restaurants and the
      museum inside it, then the Grand Concourse buildings and the River
      Avenue bars around it. Research for it was carried out with web search
      unavailable, from named sources fetched directly: English Wikipedia, the
      club's and the businesses' own sites, and the city's municipal records,
      which stood in for discovery on River Avenue. Where a claim rests on a
      business's own account of itself, this guide says so.
      Where the research could not establish something — a founding year,
      current hours, whether a tenant list still holds — this guide leaves it
      out and names the gap.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Yankee Stadium",
          place_slug: "yankee-stadium-bronx",
          note:
            "1 East 161st Street: the Yankees' home ballpark, opened 2009, designed by Populous with Turner Construction as general contractor, at a cost of about $2.3 billion including $1.2 billion in public subsidies. 25 fixed concession stands and 112 movable ones."
        },
        %{
          kind: "food",
          name: "NYY Steak",
          place_slug: "nyy-steak",
          note:
            "One East 161st Street, Gate 6: dry-aged USDA Prime steaks and seafood with roughly 100 wine options, billed on its own site as the steak and seafood restaurant of the Yankees. A sister location operates at Seminole Casino in Coconut Creek, Florida."
        },
        %{
          kind: "food",
          name: "Hard Rock Cafe Yankee Stadium",
          place_slug: "hard-rock-cafe-yankee-stadium",
          note:
            "Gate 6, at 161st Street and River Avenue: opened March 30, 2009, seating 165 with a full bar and 15 large flat-screen televisions, open year-round to ticketholders and non-ticketholders alike."
        },
        %{
          kind: "sight",
          name: "New York Yankees Museum",
          place_slug: "new-york-yankees-museum",
          note:
            "Main level at Gate 6: opened 2009, sponsored and presented by Bank of America. Larsen and Berra statues for the 1956 perfect game, a \"Ball Wall\" of autographed baseballs, Thurman Munson's locker, Derek Jeter's 3,000th-hit uniform, three authenticated Babe Ruth uniforms. Current hours and non-game-day access were not established."
        },
        %{
          kind: "sight",
          name: "Heritage Field",
          place_slug: "heritage-field",
          note:
            "East 161st Street and River Avenue: a 10-acre park on the site of the 1923 stadium, opened April 2012, with a blue outline in the grass marking the old diamond and the position of its home plate."
        },
        %{
          kind: "food",
          name: "Stan's Sports Bar",
          place_slug: "stans-sports-bar-bronx",
          note:
            "836 River Avenue. No site for the bar was found and nothing further was reachable."
        },
        %{
          kind: "food",
          name: "Billy's Sport Bar Restaurant & Lounge",
          place_slug: "billys-sports-bar-bronx",
          note:
            "856 River Avenue. No site for the bar was found and nothing further was reachable."
        },
        %{
          kind: "food",
          name: "The Clubhouse Cafe",
          place_slug: "the-clubhouse-cafe-bronx",
          note:
            "812 River Avenue. No site for the cafe was found and nothing further was reachable."
        },
        %{
          kind: "sight",
          name: "Bronx County Courthouse",
          place_slug: "bronx-county-courthouse",
          note:
            "851 Grand Concourse: the Mario Merola Building, designed 1931 by Joseph H. Freelander and Max Hausle and built 1931-1934, nine stories of limestone on a rusticated granite base, Art Deco with Classical Revival and Neo-Classical elements. A New York City Landmark since 1976 and on the National Register since 1983."
        },
        %{
          kind: "sight",
          name: "Joyce Kilmer Park",
          place_slug: "joyce-kilmer-park",
          note:
            "Bounded by Grand Concourse, Walton Avenue, East 164th Street and East 161st Street: a city park in the Concourse section holding the Lorelei Fountain, Ernst Herter's 1896 white marble Heinrich Heine Memorial, unveiled here July 8, 1899 and restored in 1999."
        },
        %{
          kind: "sight",
          name: "Bronx Museum of the Arts",
          place_slug: "bronx-museum-of-the-arts",
          note:
            "1040 Grand Concourse, at the northeast corner of 165th Street: established May 11, 1971, in a former synagogue since May 1983, expanded 1988 and 2006. Free admission every day since March 29, 2012; stated hours Wednesday to Sunday, 11 a.m. to 6 p.m."
        },
        %{
          kind: "sight",
          name: "Bronx Terminal Market",
          place_slug: "bronx-terminal-market",
          note:
            "610 Exterior Street: a shopping center by The Related Companies, built from August 14, 2006 at a cost of about $500 million and reopened September 12, 2009. The anchor list is the one recorded at that reopening, not a current roster."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          The 161st Street–Yankee Stadium subway station sits at the
          intersection of 161st Street and River Avenue. It is served by the 4
          train at all times, the B train on weekdays during rush hours and
          middays only, and the D train at all times except rush hours in the
          peak direction.

          The Yankees–East 153rd Street station, on Exterior Street, carries
          daily Hudson Line local service on Metro-North. Selected Harlem Line
          and New Haven Line trains, including dedicated "Yankee Clipper"
          trains, also stop there on game days.

          Two bus routes reach the ballpark. The Bx6 runs between Riverside
          Drive and 158th Street in Washington Heights, Manhattan, and the
          Hunts Point Cooperative Market in the Bronx, passing 161st Street and
          River Avenue at the stadium. The Bx13 runs between the George
          Washington Bridge Bus Station in Washington Heights and the Bronx
          Terminal Market at East 149th Street and River Avenue; some AM
          rush-hour trips are extended to Yankee Stadium and some PM rush-hour
          trips originate there instead of at the Market.

          On parking, the record is a construction-era one. When the stadium
          was being built, parking was expected to cost $25 per game, and the
          New York City Industrial Development Agency approved $225 million in
          tax-exempt bonds for three new parking garages totaling 3,600 spaces
          plus renovation of 5,569 existing spaces. That $25 is an expectation
          recorded against the project, not a rate anyone has published for
          2026, and this guide does not present it as one. No current rate was
          reachable.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          Gate 6 holds three of this guide's entries without leaving the
          building: NYY Steak, the Hard Rock Cafe at the corner of 161st
          Street and River Avenue, and the New York Yankees Museum on the main
          level. The Hard Rock is open year-round to ticketholders and
          non-ticketholders alike; the museum's current hours and its
          non-game-day access were not established by the research, and are
          not stated here.

          River Avenue carries three more, in street-number order: The
          Clubhouse Cafe at 812, Stan's Sports Bar at 836 and Billy's Sport
          Bar Restaurant & Lounge at 856. Each rests on a single municipal
          record, which establishes a name and an address and nothing else.
          Web search was exhausted before this batch began and no site was
          found for any of the three, so no founding year, menu or hours
          appears here.

          Heritage Field is at East 161st Street and River Avenue, on the
          ground the 1923 stadium stood on. Its blue outline in the grass
          traces the old diamond, home plate included.

          The Grand Concourse holds the older architecture. The Bronx County
          Courthouse is at 851, the Bronx Museum of the Arts at 1040 on the
          northeast corner of 165th Street, and Joyce Kilmer Park is bounded by
          the Concourse, Walton Avenue, East 164th Street and East 161st
          Street. The Bronx Terminal Market is at 610 Exterior Street.

          One thing to know about the record behind all of this. Four of these
          twelve places carry no statement here about whether they are trading
          now: the Yankees Museum, the Bronx Terminal Market, whose anchor list
          is the one recorded at its 2009 reopening rather than a current
          roster, and the three River Avenue businesses. None of that is
          evidence of closure, and none should be inferred. Telephone first.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          The franchise was established in 1903 as the New York Highlanders,
          under the owners Frank J. Farrell and William S. Devery, and was
          officially renamed the New York Yankees in 1913. It plays in the
          American League, in the AL East Division since divisional play began
          in 1969, and had won 27 World Series titles through 2009.

          The current ballpark broke ground on August 16, 2006. It opened on
          April 2, 2009 as a workout day, held its first exhibition game on
          April 3, and began regular-season play on April 16, 2009. Populous
          designed it and Turner Construction was general contractor; the cost
          was about $2.3 billion, of which $1.2 billion was public subsidy.

          It replaced the original Yankee Stadium, which operated from 1923 to
          2008. Demolition of that building was completed on May 13, 2010, and
          its site became Heritage Field, a 10-acre park that opened in April
          2012 with the outline of the original diamond worked into the turf.

          The 1923 stadium was constructed near the Grand Concourse at 161st
          Street. The Concourse is a 5.2-mile Bronx boulevard, built between
          1894 and 1909 and extended in 1927, designed by Louis Aloys Risse on
          the model of the Champs-Élysées; its southern section, roughly 153rd
          to 167th Streets, became a National Register historic district in
          1987 and a New York City Landmarks Preservation Commission historic
          district in 2011.

          One point of borough geography, because this guide's county field
          depends on it: the Bronx is coextensive with Bronx County, one of the
          62 counties of New York State, and Bronx County was separated from
          New York County in 1914.
          """
        }
      ],
      faq: [
        %{
          "question" => "Which trains and buses serve Yankee Stadium?",
          "answer" =>
            "The 161st Street–Yankee Stadium subway station, at 161st Street and River Avenue, takes the 4 train at all times, the B on weekdays during rush hours and middays only, and the D at all times except rush hours in the peak direction. The Yankees–East 153rd Street station on Exterior Street has daily Metro-North Hudson Line local service, with selected Harlem and New Haven Line trains — including dedicated \"Yankee Clipper\" trains — stopping on game days. The Bx6 and the Bx13 buses both reach the ballpark."
        },
        %{
          "question" => "What does parking cost?",
          "answer" =>
            "No current published rate was reachable, and this guide gives none. The only figure in the record belongs to the stadium's construction: parking was then expected to cost $25 per game, and the New York City Industrial Development Agency approved $225 million in tax-exempt bonds for three new garages totaling 3,600 spaces plus renovation of 5,569 existing spaces. That expectation is not a 2026 price."
        },
        %{
          "question" => "What happened to the old Yankee Stadium?",
          "answer" =>
            "It operated from 1923 to 2008 and its demolition was completed on May 13, 2010. Heritage Field, a 10-acre park, was built on the site: groundbreaking was June 29, 2010 and it opened in April 2012, with a blue outline in the grass marking where the original diamond and home plate were."
        },
        %{
          "question" => "Why do the River Avenue bars have such short entries?",
          "answer" =>
            "Because one source is all there was. Web search was exhausted before this batch began, and the city's municipal records did the work of discovery on that street. They establish a business name and an address. They do not give a founding year, a menu or a set of hours, and none of the three — Billy's, Stan's or The Clubhouse Cafe — had a site the research could find. Rather than pad those records, this guide publishes the little that is established and says so."
        },
        %{
          "question" => "Is the Bronx Terminal Market's shop list current?",
          "answer" =>
            "No, and it is not published as one. Target, The Home Depot, Burlington, Lidl, BJ's Wholesale Club, Food Bazaar and Best Buy are the anchors recorded when the centre reopened on September 12, 2009. The research could not reach a freshly dated tenant roster, so that list is presented as of the reopening and not as of today."
        },
        %{
          "question" => "Why is this guide filed under Bronx rather than Bronx County?",
          "answer" =>
            "Because that is this corpus's convention for New York City, and the convention is what makes the borough hubs work: every Brooklyn guide is filed under Brooklyn and every Manhattan guide under Manhattan. Filing this one under the legal name, Bronx County, would give it a destination hub of its own and separate it from the borough it belongs to. The Bronx is coextensive with Bronx County, which was separated from New York County in 1914."
        }
      ],
      photos: []
    }
  end
end
