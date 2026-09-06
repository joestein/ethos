defmodule Ethos.Seeds.FenwayParkPlaces do
  @moduledoc """
  Seeds the places for the Fenway Park guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Boston Red Sox research artifact, as adjudicated by an
  independent adversarial verifier (34 of 44 items confirmed). A verdict
  vouches only for what its own `item` text restates, not for every clause of
  the sentence the finder wrote around it. Where a verdict is `refuted` but
  carries a correction naming what may still be published, the correction's
  text ships and nothing else from that item does — the precedent set by
  Metro's building year in the Wrigley checkpoint.
  `docs/ballparks/fenway-park.md` quotes each published sentence against the
  verdict it rests on, and records every omission.

  What the verification changed, and what is therefore absent here:

    * **No self-superlative.** Bleacher Bar's "the only bar located inside the
      ballpark itself" was refuted; the correction lists what survives, and
      that list is what this module carries.

    * **No operator attribution for Sweet Cheeks Q.** "Operated by Big Heart
      Hospitality" rested on a URL fragment rather than a statement, and was
      refuted. The address and the five service offerings were kept by name.

    * **No spatial claim between a business and the ballpark.** Cask 'n
      Flagon's "directly by Fenway Park" was struck by the same correction
      that fixed its address citation. The only distance in the artifact is
      the one attached to Kenmore station, and it is published in the guide's
      transit prose where the source put it.

    * **Three addresses disagree with the City of Boston's licence dataset**,
      and each record says so rather than choosing silently. Cask 'n Flagon
      (62 vs 48 Brookline), Bleacher Bar (82A vs 70 Lansdowne) and Sweet
      Cheeks Q (1381 Boylston vs 144 Brookline) publish the business's own
      street address, which is the one the verifier re-fetched, alongside the
      discrepancy that a confirmed verdict establishes.

    * **Six places are `uncertain` on trading status** — the Gardner Museum,
      the Museum of Fine Arts, Cask 'n Flagon, Bleacher Bar, Sweet Cheeks Q
      and Hotel Commonwealth. Uncertain is not closed: no closure has positive
      evidence and none is asserted. Their records state what they are and
      where they are, and say nothing about whether they are trading now.

    * **The Citgo sign's "See It Go" nickname is not published.** The verdict
      confirming the sign's history carries a correction requiring a direct
      quote for that nickname specifically before it ships; none was located.

  No trip duration appears anywhere. The one distance published is the
  source's own — approximately 1,000 feet, from the Kenmore station article —
  and it is stated in the guide rather than attached to a business the source
  does not measure.
  """

  alias Ethos.Places

  @boston %{destination_path: "united-states/massachusetts/boston"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@boston, %{
        slug: "fenway-park",
        name: "Fenway Park",
        kind: "stadium",
        address: "4 Jersey Street, Boston, MA 02215",
        official_url: "https://www.mlb.com/redsox/ballpark",
        summary:
          "The home ballpark of the Boston Red Sox, at 4 Jersey Street in Boston. It opened on April 20, 1912, and the club has played there since. Capacity is listed as 37,305 for day games and 37,755 for night games. The Red Sox Hall of Fame is among the concourse features.",
        history:
          "The ballpark's street, Jersey Street, was renamed Yawkey Way in 1977 to honor longtime owner Tom Yawkey, then reverted to Jersey Street in 2018 as ownership distanced itself from Yawkey's record on racial integration. The Green Monster, the 37.167-foot left-field wall, carries a hand-operated scoreboard that is still updated by hand; terrace-style seating was added atop the wall in 2003. Pesky's Pole, the right-field foul pole, stands 302 feet from home plate — the shortest outfield distance in Major League Baseball — and was officially dedicated to Johnny Pesky on September 27, 2006, his 87th birthday. Fenway Park was added to the National Register of Historic Places on March 7, 2012. It is a pending Boston Landmark rather than a currently designated one; designation would regulate future changes to the park.",
        photos: []
      }),
      Map.merge(@boston, %{
        slug: "isabella-stewart-gardner-museum",
        name: "Isabella Stewart Gardner Museum",
        kind: "museum",
        address: "25 Evans Way, Boston, MA 02115",
        official_url: "https://www.gardnermuseum.org/",
        summary:
          "A museum at 25 Evans Way, in the Fenway neighborhood. It was built between 1898 and 1901 by Isabella Stewart Gardner on land she purchased in the Fenway, modeled on a 15th-century Venetian palace, and opened to the public on January 1, 1903. A modern wing designed by Renzo Piano opened in 2012. The collection comprises over 7,500 items — paintings, sculpture, tapestries and decorative arts — spanning ancient Rome through the 19th century.",
        history: nil,
        photos: []
      }),
      Map.merge(@boston, %{
        slug: "museum-of-fine-arts-boston",
        name: "Museum of Fine Arts, Boston",
        kind: "museum",
        address: "465 Huntington Avenue, Boston, MA 02115",
        official_url: "https://www.mfa.org/",
        summary:
          "A museum at 465 Huntington Avenue. It was established in 1870 and moved to its current Fenway location — a neoclassical building designed by Guy Lowell with a 500-foot granite facade — in 1909. It holds 8,161 paintings and over 450,000 artworks in total, is described as the 20th-largest art museum in the world by public gallery area, and attracts more than 1.2 million annual visitors. The Art of the Americas Wing, designed by Foster and Partners, opened in 2010.",
        history: nil,
        photos: []
      }),
      Map.merge(@boston, %{
        slug: "back-bay-fens",
        name: "Back Bay Fens",
        kind: "park",
        address: "Boylston Street to Avenue Louis Pasteur, Boston, MA",
        official_url: nil,
        summary:
          "An urban park designed by Frederick Law Olmsted and created in 1879 from a former tidal marsh. It runs from Boylston Street to Avenue Louis Pasteur with the Muddy River through its center, sits in the Fenway-Kenmore neighborhood, and gives the neighborhood its name.",
        history:
          "The Back Bay Fens was designated a Boston Landmark in 1983 and is listed on the National Register of Historic Places. It contains the Fenway Victory Gardens, established in 1942 and one of only two remaining WWII-era victory gardens in the United States, and the Kelleher Rose Garden, added in 1930 and expanded in 1933.",
        photos: []
      }),
      Map.merge(@boston, %{
        slug: "cask-n-flagon",
        name: "Cask 'n Flagon",
        kind: "restaurant",
        address: "62 Brookline Avenue, Boston, MA 02215",
        official_url: "https://casknflagon.com/",
        summary:
          "A sports bar and restaurant serving barbecue, steaks and craft beverages. Its own contact page gives the Boston address as 62 Brookline Avenue; the City of Boston's Active Food Establishment Licenses dataset carries a Food Service licence for \"Cask N Flagon\" added December 7, 2006 at 48 Brookline, and this research could not resolve which street number is current. The licence record establishes a dated 2006 act and not present-day operation.",
        history: nil,
        photos: []
      }),
      Map.merge(@boston, %{
        slug: "bleacher-bar",
        name: "Bleacher Bar",
        kind: "restaurant",
        address: "82A Lansdowne Street, Boston, MA 02215",
        official_url: "https://www.bleacherbarboston.com/",
        summary:
          "A sports bar established in 2008, beneath Fenway Park's center-field bleachers, with a retractable garage door opening onto the field. Its own site gives the address as 82A Lansdowne Street; the City of Boston's licence dataset carries a Food Service licence for \"Bleacher Bar\" added April 2, 2008 at 70 Lansdowne, and this research could not resolve which street number is current. The licence record establishes a dated 2008 act and not present-day operation.",
        history: nil,
        photos: []
      }),
      Map.merge(@boston, %{
        slug: "sweet-cheeks-q",
        name: "Sweet Cheeks Q",
        kind: "restaurant",
        address: "1381 Boylston Street, Boston, MA 02215",
        official_url: "https://sweetcheeksq.com/",
        summary:
          "A barbecue restaurant at 1381 Boylston Street offering dine-in, takeout, delivery, reservations and catering. The City of Boston's licence dataset carries a Food Service licence for \"Sweet Cheeks\" at 144 Brookline, sharing the phone number 617-266-1300 with the restaurant's own site; the matching number ties the two records to the same business, and the address discrepancy is unresolved. That licence carries no expiration date, so it establishes nothing about present-day operation.",
        history: nil,
        photos: []
      }),
      Map.merge(@boston, %{
        slug: "citgo-sign",
        name: "Citgo Sign",
        kind: "attraction",
        address: "660 Beacon Street, Boston, MA 02215",
        official_url: nil,
        summary:
          "A 60-foot-square double-faced illuminated sign at 660 Beacon Street in Kenmore Square. It was installed in 1940 as a Cities Service sign, updated to the Citgo trimark in 1965, and became visible above the Green Monster in Red Sox broadcasts.",
        history:
          "The Boston Landmarks Commission voted in November 2018 to designate the sign a Boston Landmark, and the mayor vetoed that designation. A 30-year lease with the developer Related Beal preserves the sign through 2048, and plans approved in October 2025 call for relocating it 30 feet higher and 130 feet east to keep it visible amid new development.",
        photos: []
      }),
      Map.merge(@boston, %{
        slug: "hotel-commonwealth",
        name: "Hotel Commonwealth",
        kind: "hotel",
        address: "500 Commonwealth Avenue, Boston, MA 02215",
        official_url: "https://www.hotelcommonwealth.com/",
        summary:
          "A hotel at 500 Commonwealth Avenue, in Kenmore Square. The only source the research reached for it is the hotel's own site, and no independent confirmation of current operation was found. A different and earlier Kenmore Square building, the Hotel Kenmore of 1915, was historically known as the \"baseball hotel\" and housed visiting Major League teams after the Second World War; that history belongs to that building and not to this one.",
        history: nil,
        photos: []
      })
    ]
  end
end
