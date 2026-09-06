defmodule Ethos.Seeds.NationalsParkGuide do
  @moduledoc """
  Seeds the Nationals Park guide. Idempotent by slug.

  ## The destination string is decided by routing, not by geography

  `destination: "Washington DC, District of Columbia"`, which derives
  `washington-dc`. Plain `"Washington"` would derive `washington` and be
  shadowed by Washington **state**, because `DestinationController.show/2`
  tries the state branch before the destination branch. This is recorded in
  the set's spec, and it is why the destination string reads the way it does.

  The node, by contrast, is geography:
  `united-states/district-of-columbia/washington` — the city Washington under
  the region District of Columbia, a two-name repetition that is correct rather
  than a mistake. A confirmed verdict establishes that the District has no
  counties — Congress abolished Washington County in 1871 — so there is no county
  to name, and none is modelled for this or any other ballpark.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Washington Nationals research artifact, or the text a `refuted`
  verdict's correction supplies. `docs/ballparks/nationals-park.md` quotes each
  published sentence against the verdict it rests on.

  What was dropped, and why:

    * **Alexandria County is not in the 1871 story.** The finder wrote that
      Congress abolished Washington County and Alexandria County in 1871; the
      correction establishes that Alexandria County had already been
      retroceded to Virginia in 1846 and was not part of that act. The guide
      publishes the corrected account.

    * **No parking price.** A confirmed verdict records that none could be
      established: MLB.com's own parking and A-to-Z pages returned HTTP 406.
      What is confirmed — 14 sanctioned lots or garages, and that parking near
      the stadium is described as limited — is published.

    * **"Adjacent to Maxwell Park" is gone from Albi's entry**, refuted.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "nationals-park-guide",
      title: "Nationals Park: The Ballpark and the Capitol Riverfront",
      destination: "Washington DC, District of Columbia",
      destination_path: "united-states/district-of-columbia/washington",
      intro: """
      Nationals Park stands at 1500 South Capitol Street SE, in the Navy Yard
      neighborhood of Southeast Washington along the Capitol Riverfront. It
      opened on March 22, 2008, holds 41,373, and was designed by HOK Sport
      with Devrouax & Purnell Architects and Planners. It has carried the same
      name since it opened, with no corporate naming rights on the facility
      itself.

      This guide takes the ballpark, a restaurant, a waterfront park and a
      museum inside an active naval installation — four places, which is what
      the research established. Research was carried out from named sources
      fetched directly: English Wikipedia, the club's own ballpark page and a
      neighbourhood business-improvement-district site. Where the research
      could not establish something — a parking price, a set of hours, the
      name of an award — this guide leaves it out and names the gap.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Nationals Park",
          place_slug: "nationals-park",
          note:
            "1500 South Capitol Street SE: the Nationals' home ballpark, opened March 22, 2008, capacity 41,373, by HOK Sport with Devrouax & Purnell. Statues of Walter Johnson, Frank Howard and Josh Gibson stand there, and a Ring of Honor covers both Senators franchises, the Homestead Grays and the Montreal Expos."
        },
        %{
          kind: "food",
          name: "Albi",
          place_slug: "albi-washington-dc",
          note:
            "1346 4th Street SE: Levantine and Palestinian cuisine under the chef-owner Michael Rafidi, established February 2020. It holds a Michelin star, and Rafidi won a James Beard Culinary Award reported June 13, 2024."
        },
        %{
          kind: "sight",
          name: "The Yards Park",
          place_slug: "the-yards-park-dc",
          note:
            "355 Water Street SE: 42 acres of waterfront along the Anacostia River, designed by M. Paul Friedberg and opened in 2010, developed by Forest City Washington after the GSA awarded the property in 2004 and now run by the Capitol Riverfront Business Improvement District."
        },
        %{
          kind: "sight",
          name: "National Museum of the United States Navy",
          place_slug: "national-museum-of-the-united-states-navy",
          note:
            "736 Sicard St SE, in Building 76 of the Washington Navy Yard — the old Naval Gun Factory's Breech Mechanism Shop. It sits on an active military installation, so entry needs government or military credentials, an escort who has them, or a day pass from the on-site visitors' center."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Navy Yard–Ballpark station, on the Green Line of the Washington
          Metro, is the rail stop for the ballpark. It has carried that name
          since 2011, having been Navy Yard from 1991, and has entrances on M
          Street at Half Street and at New Jersey Avenue; passengers exit near
          the ballpark's center field entrance.

          Metrobus routes C51 and C55 serve Nationals Park. Water taxi service
          to the ballpark area runs from Alexandria, Virginia, and from
          Georgetown.

          There are 14 sanctioned parking lots or garages near the stadium, and
          parking near the stadium is described as limited. No published price
          could be established from the sources fetched: MLB.com's own parking
          and A-to-Z pages returned HTTP 406 and could not be retrieved, so no
          rate is given here. Cyclists are offered free valet bicycle parking
          at Garage C, and there are 110 bike racks on the sidewalks around the
          ballpark.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          Albi is at 1346 4th Street SE, in the Navy Yard and Capitol
          Riverfront neighborhood: Levantine and Palestinian cuisine under the
          chef-owner Michael Rafidi, established in February 2020. It has a
          Michelin star, and Rafidi won a James Beard Culinary Award reported
          on June 13, 2024. Its current hours and menu were not established by
          the research and are not stated here; an April 2025 report of a
          recent renovation is the latest evidence of its operation the
          research reached.

          The Yards Park runs 42 acres along the Anacostia River at 355 Water
          Street SE. The General Services Administration awarded the property
          in 2004, Forest City Washington developed it, the landscape architect
          M. Paul Friedberg designed it, and it opened in 2010; the Capitol
          Riverfront Business Improvement District operates it now. Its source
          gestures at design and urban-planning awards without naming one, so
          this guide names none either.

          The National Museum of the United States Navy is at 736 Sicard St
          SE, in Building 76 of the Washington Navy Yard — the former Breech
          Mechanism Shop of the old Naval Gun Factory. Visiting is not
          straightforward, because the museum is inside an active military
          installation: visitors must present valid government or military
          credentials, be accompanied by someone who has them, or apply for a
          day pass at the on-site visitors' center. The current admission hours
          and the details of that day-pass procedure could not be established,
          and anyone planning a visit should confirm both first.

          The Navy Yard around it is described as the oldest shore
          establishment of the United States Navy, established in 1799 and in
          use since. It was added to the National Register of Historic Places
          on June 19, 1973 and designated a National Historic Landmark on May
          11, 1976.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          The franchise relocated from Montreal to Washington for the 2005
          season, in a move Major League Baseball announced on September 29,
          2004. The name Nationals was chosen over reviving Senators, for legal
          and political reasons.

          Nationals Park broke ground on May 4, 2006 and was completed in 2008
          by an expedited design-build approach. Construction cost $693
          million, of which $135 million was upfront taxpayer funds and about
          $535 million was financed through municipal bonds; a further $84.2
          million went on transportation, art and infrastructure, bringing the
          total to $783.9 million. It opened on March 22, 2008 and holds
          41,373.

          It has hosted the 2018 Major League Baseball All-Star Game, Games 3,
          4 and 5 of the 2019 World Series, and the 2015 NHL Winter Classic.
          Statues of Walter Johnson, Frank Howard and Josh Gibson stand there,
          honoring the original Washington Senators, the expansion Senators and
          the Negro league Homestead Grays, and a Ring of Honor celebrates Hall
          of Famers from those franchises and from the Montreal Expos.

          The Nationals won their first World Series championship in 2019,
          beating the Houston Astros in seven games; it was the first World
          Series in Major League Baseball history in which the road team won
          every game.

          One point of jurisdiction, because this guide's fields depend on it.
          Washington, D.C. is the federal capital city and is not part of any
          state or territory, and it has no counties today. The Organic Act of
          1871 abolished the individual charters of the cities of Washington
          and Georgetown and abolished Washington County, creating a unified
          territorial government for the whole District. Alexandria County —
          the separate Virginia-ceded portion of the original District — had
          already been retroceded to Virginia in 1846 and was not part of that
          act.
          """
        }
      ],
      faq: [
        %{
          "question" => "How does public transit reach Nationals Park?",
          "answer" =>
            "Navy Yard–Ballpark station on the Green Line of the Washington Metro, with entrances on M Street at Half Street and at New Jersey Avenue; passengers exit near the ballpark's center field entrance. The station has carried that name since 2011, having been Navy Yard from 1991. Metrobus routes C51 and C55 also serve the ballpark, and water taxi service to the area runs from Alexandria, Virginia, and from Georgetown."
        },
        %{
          "question" => "What does parking cost?",
          "answer" =>
            "No published price could be established from the sources fetched — MLB.com's own parking and A-to-Z pages returned HTTP 406 and could not be retrieved — so none is given here. What is established: there are 14 sanctioned parking lots or garages near the stadium, and parking near the stadium is described as limited. Cyclists are offered free valet bicycle parking at Garage C, and there are 110 bike racks on the sidewalks around the ballpark."
        },
        %{
          "question" => "Can anyone visit the Navy museum?",
          "answer" =>
            "Not without arranging access first. The museum sits on an active military installation, so visitors must present valid government or military credentials, be accompanied by someone who has them, or apply for a day pass at the on-site visitors' center. The current admission hours and the details of the day-pass procedure could not be established by this research."
        },
        %{
          "question" => "Does the District of Columbia have counties?",
          "answer" =>
            "Not today. Washington, D.C. is the federal capital city and is not part of any state or territory. The Organic Act of 1871 abolished the individual charters of the cities of Washington and Georgetown and abolished Washington County, creating a unified territorial government for the whole District. Alexandria County, the Virginia-ceded portion of the original District, had already been retroceded to Virginia in 1846 and was not part of that act."
        },
        %{
          "question" => "Has Nationals Park ever had a sponsor's name?",
          "answer" =>
            "No. It has carried the Nationals Park name since it opened on March 22, 2008, with no corporate naming rights on the facility itself."
        }
      ],
      photos: []
    }
  end
end
