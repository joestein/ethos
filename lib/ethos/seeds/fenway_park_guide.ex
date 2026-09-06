defmodule Ethos.Seeds.FenwayParkGuide do
  @moduledoc """
  Seeds the Fenway Park guide. Idempotent by slug.

  Names the destination node `united-states/massachusetts/boston`, so it lists
  on the Massachusetts destination page and on Boston's. The ballparks model no
  county tier, and Suffolk County is a good illustration of why: county
  government there was abolished in 1999 and the county now functions as an
  administrative and statistical subdivision. The confirmed verdict records that
  the jurisdiction name is still the one Massachusetts and federal sources use
  for Boston addresses, so it is published as prose rather than as geography.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Boston Red Sox research artifact, or the text a `refuted`
  verdict's correction names as publishable.
  `docs/ballparks/fenway-park.md` quotes each published sentence against the
  verdict it rests on and records each omission.

  What was dropped, and why:

    * **"Significantly farther" is not what the source says.** The finder's
      comparison of Fenway station to Kenmore station was refuted; the
      correction supplies the source's own word, "slightly further", and that
      is what the transit prose carries.

    * **No parking price.** A confirmed verdict records that no source fetched
      states a current published price for official game-day parking, and that
      MLB.com's own transportation and parking pages returned HTTP 406 and 404
      to direct fetch. None is given here.

    * **No trading claim for six of the nine places.** The two museums and the
      hotel rest on self-published or undated sources; the three restaurants
      rest on municipal licence rows with no expiration date. None of that is
      evidence of closure, and none is stated as such.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: no station, no garage and no bus route becomes a
  page.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "fenway-park-guide",
      title: "Fenway Park: The Ballpark and the Streets Around It",
      destination: "Boston, Massachusetts",
      destination_path: "united-states/massachusetts/boston",
      intro: """
      Fenway Park stands at 4 Jersey Street in Boston, in Suffolk County. It
      opened on April 20, 1912, and the Boston Red Sox have played there
      since. Capacity is listed as 37,305 for day games and 37,755 for night
      games.

      This guide takes the ballpark first, then the museums, park, bars and
      hotel around it, and then the team's own record. Research for it was
      carried out with web search unavailable, from named sources fetched
      directly: English Wikipedia, the businesses' and institutions' own
      sites, MBTA station and route pages, and the City of Boston's Active
      Food Establishment Licenses dataset on the Analyze Boston portal. Where
      a claim rests on a business's own account of itself, this guide says so.
      Where the research could not establish something — which of two street
      numbers is current, whether a business is trading now — this guide
      leaves it out and names the gap.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Fenway Park",
          place_slug: "fenway-park",
          note:
            "4 Jersey Street: the Red Sox' home ballpark, open since April 20, 1912. Capacity 37,305 for day games and 37,755 for night games, with the Red Sox Hall of Fame among the concourse features. On the National Register of Historic Places since March 7, 2012."
        },
        %{
          kind: "food",
          name: "Cask 'n Flagon",
          place_slug: "cask-n-flagon",
          note:
            "62 Brookline Avenue: a sports bar and restaurant serving barbecue, steaks and craft beverages. The City's licence dataset records the business at 48 Brookline instead, and this research could not resolve which street number is current."
        },
        %{
          kind: "food",
          name: "Bleacher Bar",
          place_slug: "bleacher-bar",
          note:
            "82A Lansdowne Street: established in 2008, beneath the ballpark's center-field bleachers, with a retractable garage door opening onto the field. The City's licence dataset records it at 70 Lansdowne; the discrepancy is unresolved."
        },
        %{
          kind: "food",
          name: "Sweet Cheeks Q",
          place_slug: "sweet-cheeks-q",
          note:
            "1381 Boylston Street: a barbecue restaurant offering dine-in, takeout, delivery, reservations and catering. The City's licence dataset lists the same phone number at 144 Brookline, which ties the records together and leaves the address open."
        },
        %{
          kind: "stay",
          name: "Hotel Commonwealth",
          place_slug: "hotel-commonwealth",
          note:
            "500 Commonwealth Avenue, in Kenmore Square. The hotel's own site is the only source the research reached for it, and no independent confirmation of current operation was found."
        },
        %{
          kind: "sight",
          name: "Citgo Sign",
          place_slug: "citgo-sign",
          note:
            "660 Beacon Street, Kenmore Square: a 60-foot-square double-faced illuminated sign installed in 1940 as a Cities Service sign, updated to the Citgo trimark in 1965, visible above the Green Monster in Red Sox broadcasts."
        },
        %{
          kind: "sight",
          name: "Back Bay Fens",
          place_slug: "back-bay-fens",
          note:
            "Boylston Street to Avenue Louis Pasteur: an Olmsted park created in 1879 from a tidal marsh, with the Muddy River through its center. A Boston Landmark since 1983, and the site of the Fenway Victory Gardens and the Kelleher Rose Garden."
        },
        %{
          kind: "sight",
          name: "Isabella Stewart Gardner Museum",
          place_slug: "isabella-stewart-gardner-museum",
          note:
            "25 Evans Way: built 1898-1901 on land Isabella Stewart Gardner purchased in the Fenway, modeled on a 15th-century Venetian palace, opened to the public January 1, 1903. Over 7,500 items, and a Renzo Piano wing of 2012."
        },
        %{
          kind: "sight",
          name: "Museum of Fine Arts, Boston",
          place_slug: "museum-of-fine-arts-boston",
          note:
            "465 Huntington Avenue: established 1870, in a neoclassical Guy Lowell building with a 500-foot granite facade since 1909. 8,161 paintings and over 450,000 artworks, and a Foster and Partners wing of 2010."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Kenmore station is the primary transit access point for the
          ballpark. It sits under Kenmore Square at Commonwealth Avenue,
          approximately 1,000 feet south of Fenway Park, and is served by the
          B, C and D branches of the MBTA Green Line.

          Fenway station, on the Green Line D branch, is under Park Drive near
          the Riverway. Despite its name it is slightly further from the
          stadium than Kenmore station, and it was renamed from "Fenway Park"
          to "Fenway" in the mid-1970s to reflect that it serves the
          neighborhood rather than sitting at the ballpark.

          Lansdowne station, at 85 Brookline Avenue, serves the MBTA Commuter
          Rail Framingham/Worcester Line. It opened in 1988 specifically for
          limited service to Red Sox games and was renamed from "Yawkey" to
          "Lansdowne" effective April 8, 2019. The Fenway Center development
          sits partially over it.

          MBTA bus route 55 runs between West Fenway and Arlington Station,
          serving the neighborhood around the ballpark.

          On parking, the record stops short. No source fetched for this guide
          states a current published price for official Fenway Park game-day
          parking: MLB.com's own transportation and parking pages returned
          HTTP 406 and 404 to direct fetch and could not be read. No price is
          published here, and no lot is called an official one.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          The bars sit on the two streets that frame the park. Cask 'n Flagon
          is at 62 Brookline Avenue and Bleacher Bar at 82A Lansdowne Street,
          under the center-field bleachers with a retractable garage door
          opening onto the field. Sweet Cheeks Q is at 1381 Boylston Street.
          All three publish a street address that disagrees with the City of
          Boston's Active Food Establishment Licenses dataset — 48 Brookline,
          70 Lansdowne and 144 Brookline respectively — and this guide carries
          the business's own number with the disagreement stated rather than
          picking one silently.

          Kenmore Square holds the Hotel Commonwealth at 500 Commonwealth
          Avenue and the Citgo sign at 660 Beacon Street. The sign has been
          there since 1940, when it went up for Cities Service, and took the
          Citgo trimark in 1965; a lease running to 2048 protects it, and
          plans approved in October 2025 would move it 30 feet higher and 130
          feet east. Kenmore Square's older baseball association belongs to a
          different building: the Hotel Kenmore of 1915 was known as the
          "baseball hotel" and housed visiting Major League teams after the
          Second World War.

          The rest of the neighborhood is parkland and museums. The Back Bay
          Fens, Olmsted's 1879 park on a former tidal
          marsh, runs from Boylston Street to Avenue Louis Pasteur and gives
          the Fenway-Kenmore neighborhood its name; the Fenway Victory
          Gardens, laid out in 1942, and the Kelleher Rose Garden, added in
          1930, are inside it. The Isabella Stewart Gardner Museum is at 25
          Evans Way and the Museum of Fine Arts at 465 Huntington Avenue.

          One thing to know about the record behind all of this. Research was
          done without web search. For the three restaurants the City licence
          dataset was the corroborating source, and a licence row records a
          dated act — an addition in 2006, 2008, or an entry with no
          expiration date at all — rather than present-day operation. For the
          two museums and the hotel, no source dated to 2026 could be reached.
          So this guide does not say those six are trading. It does not say
          they have closed either: there is no evidence of that, and none
          should be inferred. Telephone first.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Fenway Park opened on April 20, 1912. Its street was renamed Yawkey
          Way in 1977 to honor longtime owner Tom Yawkey, and reverted to
          Jersey Street in 2018 as ownership distanced itself from Yawkey's
          record on racial integration.

          Two features of the field carry names of their own. The Green
          Monster is the 37.167-foot left-field wall; its scoreboard is
          hand-operated and still updated by hand, and terrace-style seating
          was added atop the wall in 2003. Pesky's Pole, the right-field foul
          pole, stands 302 feet from home plate — the shortest outfield
          distance in Major League Baseball — and was dedicated to Johnny
          Pesky on September 27, 2006, his 87th birthday.

          The park was added to the National Register of Historic Places on
          March 7, 2012. It is a pending Boston Landmark rather than a
          designated one; designation would regulate future changes to it.

          The Red Sox began play in 1901 as one of the American League's
          original franchises and won the first modern World Series in 1903
          against the Pittsburgh Pirates. Titles followed in 1912, 1915, 1916
          and 1918, and then none until 2004 — an 86-year gap popularly
          attributed to the sale of Babe Ruth to the New York Yankees in 1920
          and referred to as the Curse of the Bambino. Further titles came in
          2007, 2013 and 2018.
          """
        }
      ],
      faq: [
        %{
          "question" => "Which trains serve Fenway Park?",
          "answer" =>
            "Kenmore station, under Kenmore Square at Commonwealth Avenue and approximately 1,000 feet south of Fenway Park, is the primary transit access point; it is served by the B, C and D branches of the MBTA Green Line. Fenway station on the D branch is under Park Drive near the Riverway and is slightly further from the stadium than Kenmore. Lansdowne station at 85 Brookline Avenue serves the Framingham/Worcester Commuter Rail line and opened in 1988 for limited service to games."
        },
        %{
          "question" => "Why is the ballpark's address Jersey Street and not Yawkey Way?",
          "answer" =>
            "The street was Jersey Street, was renamed Yawkey Way in 1977 to honor longtime owner Tom Yawkey, and reverted to Jersey Street in 2018 as ownership distanced itself from Yawkey's record on racial integration. Separately, and with no reason stated by any source reached, the commuter rail station at 85 Brookline Avenue was renamed from Yawkey to Lansdowne effective April 8, 2019."
        },
        %{
          "question" => "What does parking cost at the ballpark?",
          "answer" =>
            "No source fetched for this guide states a current published price for official Fenway Park game-day parking. MLB.com's own transportation and parking pages returned HTTP 406 and 404 to direct fetch and could not be read, so no price is published here and no lot is described as an official one."
        },
        %{
          "question" => "Why do some addresses in this guide come with a second street number?",
          "answer" =>
            "Because the two sources disagree and the research could not resolve it. Cask 'n Flagon, Bleacher Bar and Sweet Cheeks Q each publish one street address on their own site while the City of Boston's Active Food Establishment Licenses dataset records another — 48 Brookline, 70 Lansdowne and 144 Brookline. This guide gives the business's own number and states the City's alongside it."
        },
        %{
          "question" => "Why does this guide not say whether these places are open?",
          "answer" =>
            "Because the evidence does not reach that far. Research was carried out with web search unavailable. The three restaurants' status rested on municipal licence rows recording a dated act rather than present-day operation, and one of those rows carries no expiration date at all. For the Gardner Museum, the Museum of Fine Arts and the Hotel Commonwealth, no source dated to 2026 and independent of the institution itself could be reached. None of that is evidence of closure, and none is stated as such."
        },
        %{
          "question" => "Is the Citgo sign a protected landmark?",
          "answer" =>
            "Not as a designated one. The Boston Landmarks Commission voted in November 2018 to designate it a Boston Landmark and the mayor vetoed that designation. What protects it is commercial: a 30-year lease with the developer Related Beal preserves it through 2048, and plans approved in October 2025 call for relocating it 30 feet higher and 130 feet east to keep it visible amid new development."
        }
      ],
      photos: []
    }
  end
end
