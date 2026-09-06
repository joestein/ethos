defmodule Ethos.Seeds.RateFieldPlaces do
  @moduledoc """
  Seeds the places for the Rate Field guide. Idempotent: `upsert_all!/0` upserts
  by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  **The venue is Rate Field.** A confirmed verdict establishes that *"The
  venue's current name is 'Rate Field', shortened from Guaranteed Rate Field in
  December 2024"*, following Guaranteed Rate's corporate rebrand. The longer
  name is the one recollection produces, and it is not the current one. The
  ballpark's own `could_not_establish` carries the residual honestly: the club's
  site returned HTTP 406 to every fetch and could not corroborate the current
  name from the operator, so no rename more recent than December 2024 could be
  ruled out.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Chicago White Sox research artifact, or the text a `refuted`
  verdict's correction names as publishable. A verdict vouches only for what its
  own `item` text restates, not for every clause of the sentence the finder
  wrote around it. `docs/ballparks/rate-field.md` quotes each published sentence
  against the verdict it rests on, and records every omission.

  What the verification changed, and what is therefore absent here:

    * **No architectural style for the ballpark.** `could_not_establish` on the
      Rate Field record does not merely note the gap — it instructs: *"Any
      architectural style for the ballpark — do not supply one."* None is
      supplied. The upper-deck geometry that *is* published comes from a
      separate confirmed verdict describing the design, not a style label.

    * **A Chicago business licence is not evidence of trading.** The verifier
      applied this to every tenant record in the artifact: AAI status persists
      until expiry whether or not the doors are open, so a licence establishes a
      licensee, an activity and a dated act, and nothing more. Five of the six
      places here therefore carry **no trading claim at all**. Only Rate Field
      is published as operating, and on a separate basis — a maintained
      encyclopedia article's present-tense statement that the club plays its
      home games there, explicitly not on the licence.

    * **No superlative or building history for Bridgeport Art Center.** Its own
      site calls the building "historic and visually breathtaking"; a business's
      own site cannot establish that, and no independent source for the build
      year, the former tenant or a style was reachable. What ships is what the
      site can establish about itself: what it is and what it contains.

  This is the Baltimore lesson from wave 1 arriving in a different form. There
  the register was empty and eight claims collapsed; here the register is real,
  queryable and reproducible — two independent re-queries matched the finder's
  figures exactly — and the claims still do not reach present-day trading.
  """

  alias Ethos.Places

  @chicago %{destination_path: "united-states/illinois/chicago"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@chicago, %{
        slug: "rate-field",
        name: "Rate Field",
        kind: "stadium",
        address: "333 West 35th Street, Chicago, IL 60616",
        official_url: nil,
        summary:
          "The home ballpark of the Chicago White Sox, one of the city's two Major League Baseball teams, at 333 West 35th Street on Chicago's South Side. It sits in the Armour Square neighborhood, next to Bridgeport. It opened on April 18, 1991 as Comiskey Park II, at a construction cost of US$137 million — approximately $324 million in 2025 dollars — to a design by HOK Sport, now Populous. Current capacity is 40,615, unchanged since the 2004 renovation, and the playing surface is Kentucky Bluegrass. The Illinois Sports Facilities Authority owns and operates it.",
        history:
          "The venue has carried four names. It opened as Comiskey Park II; U.S. Cellular purchased the naming rights in 2003 for US$68 million over 20 years, then paid $13 million to end the agreement seven years early; Guaranteed Rate purchased them in a 13-year deal announced October 31, 2016, paying $20.4 million over the first ten years, and the ballpark was Guaranteed Rate Field from 2017 to 2024; and in December 2024 the name was shortened to Rate Field following Guaranteed Rate's corporate rebrand. HOK Sport set the original upper deck back over the lower deck so that the stands rose fairly gradually, which gave nearly every upper-level seat an unobstructed view but created one of the highest upper decks in baseball, and the upper deck did not connect to the lower-deck concourse. A renovation program from 2001 to 2007 cost a combined $118 million: Phase III in 2003 cost approximately $20 million, and Phase IV in 2004 cost approximately $28 million and removed eight rows and 6,600 seats from the top of the upper deck, reducing capacity from 47,098 to 40,615, while a flat roof elevated 20 feet above the seating area replaced the old sloped canopy-style roof and covered 13 of the 21 rows of seating. In 2016 the park installed three new HD video boards at a cost of $7.3 million, the center-field board measuring 60 feet by 134 feet, or 8,000 square feet. The stadium was built across 35th Street from the original Comiskey Park, which was demolished to make room for a parking lot; the location of Old Comiskey's home plate is indicated by a marble plaque on the sidewalk next to Rate Field, with the foul lines painted in the parking lot, and a second source gives that home plate as 503 feet due north of the current one.",
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "chisox-bar-and-grill",
        name: "ChiSox Bar & Grill",
        kind: "restaurant",
        address: "320 West 35th Street, Chicago, IL 60616",
        official_url: nil,
        summary:
          "A bar and grill at 320 West 35th Street, in the Armour Square community area. The City of Chicago's licence register carries it under ILLINOIS SPORTSERVICE, INC., with Retail Food Establishment, Outdoor Patio and Consumption on Premises - Incidental Activity licences, all in AAI status. That register establishes a licensee, a licensed activity and a dated act, and not present-day operation. No history, opening date or menu information beyond the licence record could be found, and no source fetched establishes whether the White Sox organization itself or Illinois Sportservice as a contracted concessionaire operates the venue.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "cork-and-kerry-on-33rd",
        name: "Cork and Kerry on 33rd",
        kind: "restaurant",
        address: "3258 South Princeton Avenue, Chicago, IL 60616",
        official_url: nil,
        summary:
          "A bar and restaurant at 3258 South Princeton Avenue, in the Armour Square community area — the same community area as the ballpark. The City of Chicago's licence register carries it under the legal name Chicago Pizza Department Corp., with Retail Food Establishment and Consumption on Premises - Incidental Activity licences in AAI status, a fee paid on May 2, 2026 and licensure continuing through June 15, 2028. That establishes a dated act and continuing licensure rather than present-day trading. Its own domain does not resolve, and no founding date or history could be established from any source reached.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "35th-street-red-hots",
        name: "35th Street Red Hots",
        kind: "restaurant",
        address: "500 West 35th Street, Chicago, IL 60616",
        official_url: nil,
        summary:
          "A food business at 500 West 35th Street, in the Bridgeport community area. The City of Chicago's licence register carries it under the legal name 35TH STREET REDHOTS LLC with a Retail Food Establishment licence in AAI status, which establishes a dated act and continuing licensure rather than present-day trading. No founding date, ownership history or menu could be established from any source reached, and no liquor licence was found under this name at this address, so whether it serves alcohol is not established.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "bridgeport-art-center",
        name: "Bridgeport Art Center",
        kind: "attraction",
        address: "1200 West 35th Street, Chicago, IL 60609",
        official_url: "https://bridgeportart.com",
        summary:
          "A multi-disciplinary creative building at 1200 West 35th Street, in the Bridgeport community area, which its own site describes as holding three galleries, studios, a Fashion Design Center, the Chicago Ceramic Center and two event venues. The City of Chicago's licence register carries EAST BANK STORAGE ON 35TH STREET, INC., doing business as BRIDGEPORT ART CENTER, with Outdoor Patio, Consumption on Premises - Incidental Activity and Public Place of Amusement licences in AAI status, a fee paid on September 15, 2025 and licensure continuing through January 15, 2028 — a dated act rather than present-day operation. The building's construction date and former use could not be established from any independent source reached.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "old-comiskey-park-home-plate-site",
        name: "Old Comiskey Park home plate marker",
        kind: "historic-site",
        address: "324 West 35th Street, Chicago, IL",
        official_url: nil,
        summary:
          "A marble plaque marking the home plate of the original Comiskey Park, across from Rate Field, with the old foul lines painted on the asphalt; the marked plate is 503 feet due north of the current home plate. The original Comiskey Park stood at 324 West 35th Street in the Armour Square neighborhood, was designed by Zachary Taylor Davis with Osborn Engineering, opened on July 1, 1910, closed on September 30, 1990 and was demolished in 1991. No historic-landmark designation for the site or the plaque was established, no ZIP code could be corroborated for the now-vacant address, and no source dated to 2026 confirms that the plaque and painted lines are still physically present.",
        history:
          "Bill Veeck installed the pinwheels on the park's \"exploding\" scoreboard during his ownership periods, 1959 to 1961 and 1976 to 1981; the scoreboard and the center field bleachers were among the last structures demolished. On July 12, 1979 a Major League Baseball promotion at Comiskey Park called Disco Demolition Night ended in fans storming the field after a crate of disco records was detonated between games of a doubleheader. Attendance was officially reported at 47,795, though Veeck estimated 50,000 to 55,000 in the park. The second game was forfeited to the Detroit Tigers 9-0 by order of the American League president Lee MacPhail, and that unplayed second game remains the last American League game to be forfeited.",
        photos: []
      })
    ]
  end
end
