defmodule Ethos.Seeds.SutterHealthParkGuide do
  @moduledoc """
  Seeds the Sutter Health Park guide. Idempotent by slug.

  Carries `state: "California"` and `county: "Yolo County"`, from the confirmed
  verdict that West Sacramento is a city in Yolo County. This is the only site
  in the wave whose ballpark is a temporary home: confirmed verdicts record the
  Athletics' 2025-2027 tenancy here, with an option for a fourth year, and that
  a permanent Las Vegas ballpark is not expected before 2028.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Athletics research artifact, or the text a `refuted` verdict's
  correction supplies. `docs/ballparks/sutter-health-park.md` quotes each
  published sentence against the verdict it rests on.

  What was dropped, and why:

    * **Tower Bridge is not called the walking link to the light rail.** The
      verdict confirming the bridge carries a correction: keep the sourced
      description — style, route, what it connects, modes carried — and drop
      the added clause naming it "the" walking and biking link to the
      stations, because no source ties the bridge to that travel function. The
      bridge's own connection is published and no route is asserted.

    * **No flat parking price.** A confirmed verdict records that official
      game-day parking books through ACE Parking's reservation system, with a
      lot address of 870 Riverfront St, and that no flat published price is
      shown without selecting a specific game date in the booking flow. That
      is published; a price is not.

    * **Mill Street Pier has no page.** Its address could not be established
      and its only source is one tourism-bureau line, so it does not ship as a
      place. It is named in "Around the ballpark" rather than dropped in
      silence.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8. Tower Bridge is a place record because it is a
  National Register listing with a sourced architectural style, not because it
  is a route.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "sutter-health-park-guide",
      title: "Sutter Health Park: The Athletics' Temporary Home",
      destination: "West Sacramento, California",
      state: "California",
      county: "Yolo County",
      intro: """
      Sutter Health Park stands at 400 Ballpark Drive in West Sacramento, in
      Yolo County. It opened on May 15, 2000 as Raley Field, took its present
      name after the 2019 season, and hosts both the Sacramento River Cats and
      the Athletics. At 14,014 it is currently the smallest ballpark in Major
      League Baseball while the Athletics are its tenants.

      That tenancy has an end date. On April 4, 2024 it was announced that the
      Athletics would play here from 2025 through 2027, with an option for a
      fourth year, while a new Las Vegas ballpark is built; the club played its
      first home game here on March 31, 2025. This guide takes the ballpark,
      three Bridge District businesses, a 1935 lift bridge and a riverfront
      park. Where the research could not establish something — a flat parking
      price, a street address, whether a business is trading now — this guide
      leaves it out and names the gap.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Sutter Health Park",
          place_slug: "sutter-health-park",
          note:
            "400 Ballpark Drive: home to the Sacramento River Cats and, from 2025, the Athletics. Capacity 14,014 — 10,624 fixed seats plus outfield grass berms — currently the smallest ballpark in Major League Baseball while it hosts the Athletics."
        },
        %{
          kind: "food",
          name: "Drake's: The Barn",
          place_slug: "drakes-the-barn-west-sacramento",
          note:
            "985 Riverfront St: two acres of riverside beer garden and event space in the Bridge District, with a wood-fired pizza kitchen, rotating food trucks, over 40 taps of Drake's beers plus cocktails and wine, fire pits and lawn games."
        },
        %{
          kind: "food",
          name: "Bike Dog Brewing (West Sacramento taproom)",
          place_slug: "bike-dog-brewing-west-sacramento",
          note:
            "2568 Industrial Blvd, Suite 110: a dog-friendly craft brewery taproom open Tuesday to Sunday, closed Mondays, hosting food trucks, cornhole and running-club events."
        },
        %{
          kind: "food",
          name: "Franquette",
          place_slug: "franquette-west-sacramento",
          note:
            "965 Bridge Street, Suite 100: a French-inspired cafe and wine bar founded by Brad Cecchi and Clay Nutting, previously of the restaurant Canon. Open seven days, with weekend brunch; Yolo County's tourism bureau describes casual French cuisine such as beef tartare and duck confit."
        },
        %{
          kind: "sight",
          name: "Tower Bridge",
          place_slug: "tower-bridge-sacramento",
          note:
            "State Route 275 over the Sacramento River: a vertical lift bridge completed in 1935 in the Streamline Moderne style, unusual for a lift bridge of its era. Dedicated by Governor Frank Merriam on December 15, 1935, recognized by the American Institute of Steel Construction that year, and on the National Register since 1982."
        },
        %{
          kind: "sight",
          name: "River Walk Park",
          place_slug: "river-walk-park-west-sacramento",
          note:
            "West Sacramento riverfront: walking trails and public art, including \"Subtile\", a piece made of 34,000 stainless steel plates, with views of Tower Bridge and Old Sacramento. No street address from an authoritative source could be found."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Official Athletics game-day parking is booked through ACE Parking's
          online reservation system, and the listed lot address for Athletics
          Major League games is 870 Riverfront St, West Sacramento. No flat
          published price is shown without selecting a specific game date in
          the booking flow, so none is given here.

          Sacramento Valley Station is the western terminus of SacRT's Gold
          Line light rail, and also serves Amtrak's Capitol Corridor,
          California Zephyr, Coast Starlight and San Joaquin routes. The 7th &
          Capitol and 8th & Capitol stations, which opened on March 12, 1987,
          are served by the Gold Line and connect to the Blue and Green Lines
          and to bus routes.

          Tower Bridge carries State Route 275 across the Sacramento River,
          connecting West Capitol Avenue in West Sacramento with Capitol Mall
          in Sacramento, and carries cars, bicycles and pedestrians. No source
          reached ties the bridge to a particular journey between the ballpark
          and the light rail, and this guide does not assert one; what is
          published is what the bridge itself connects.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          The Bridge District holds three of this guide's entries. Drake's: The
          Barn is at 985 Riverfront St — two acres of riverside beer garden and
          event space with a wood-fired pizza kitchen, rotating food trucks,
          over 40 taps of Drake's beers alongside cocktails and wine, fire pits
          and lawn games. Bike Dog Brewing's West Sacramento taproom is at 2568
          Industrial Blvd, Suite 110: dog-friendly, open Tuesday to Sunday and
          closed on Mondays, with food trucks, cornhole and running-club
          events, and a menu on its own site dated March 2026. Franquette is at
          965 Bridge Street, Suite 100, a French-inspired cafe and wine bar
          founded by Brad Cecchi and Clay Nutting, who previously worked at the
          restaurant Canon; it is open seven days a week, with weekend brunch,
          and Yolo County's tourism bureau describes its food as casual French
          cuisine such as beef tartare and duck confit.

          Tower Bridge is the landmark on the water. It was completed in 1935,
          replacing an 1911 swing bridge, and was dedicated by Governor Frank
          Merriam on December 15, 1935; the American Institute of Steel
          Construction recognized it that same year, and it went on the
          National Register of Historic Places in 1982. It is built in the
          Streamline Moderne style, which the source notes was unusual for a
          lift bridge of its era.

          River Walk Park runs along the West Sacramento riverfront, with
          walking trails and public art including "Subtile", a piece made of
          34,000 stainless steel plates, and views of Tower Bridge and Old
          Sacramento. No street address from an authoritative source could be
          found for it. OpenStreetMap's geocoder places it at 651 Broderick, at
          38.5834, -121.5086, but that is a crowd-sourced result rather than a
          source with editorial authority, and this guide records it as one
          rather than publishing it as the park's address.

          One place the research reached does not have a page here. Mill Street
          Pier is described by Yolo County's tourism bureau as a historic
          shipping pier with an illuminated "WEST" art installation, and that
          single line is the whole of the record: no street address could be
          established and no source beyond the one itinerary was found. Rather
          than publish a record that is a name and an installation, this guide
          names the pier here and says why it has no page.

          One thing to know about the record behind all of this. Three of these
          six places — Drake's: The Barn, Bike Dog Brewing and Franquette —
          rest on the owner's own site plus a tourism itinerary, and neither
          establishes that a business is trading now. This guide therefore says
          nothing about whether those three are open. It does not say they have
          closed either: there is no evidence of that, and none should be
          inferred. Telephone first.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          The club has no city name. The Athletics were the Oakland Athletics
          through 2024 and became simply Athletics, with no city prefix, on
          relocating to West Sacramento for the 2025 season. Both the club's own
          site and the encyclopedia use the bare name.

          The franchise was established in 1901 as one of the American League's
          eight charter franchises, based in Philadelphia, playing at Columbia
          Park from 1901 to 1908 and at Shibe Park from 1909 to 1954. It
          relocated to Kansas City in 1955 and to Oakland in 1968, where it
          played at the Oakland Coliseum for 57 seasons through 2024. It has
          won nine World Series titles: 1910, 1911, 1913, 1929 and 1930 in
          Philadelphia, and 1972, 1973, 1974 and 1989 in Oakland.

          The ballpark predates the tenancy by a quarter century. It broke
          ground on October 28, 1999 and opened on May 15, 2000 as Raley Field,
          built for $46.5 million — about $86.9 million in 2025 dollars — with
          naming rights originally sold to Raley's supermarkets for $15 million
          over 20 years. It was renamed Sutter Health Park after the 2019
          season under an agreement with the Sacramento-based Sutter Health. It
          has 10,624 fixed seats plus outfield grass berms for a total capacity
          of 14,014, down from an original 14,611 after additions including a
          party deck in 2005 and a Diamond Club in 2010.

          The arrangement here is temporary and dated. On April 4, 2024 it was
          announced that the Athletics would play at Sutter Health Park from
          2025 through 2027, with an option for a fourth year, while a new Las
          Vegas ballpark is built; the team played its first home game here on
          March 31, 2025. That permanent Las Vegas ballpark is not expected to
          be completed until 2028, and in 2026 the team is scheduled to play
          six games at Las Vegas Ballpark ahead of the permanent move.
          """
        }
      ],
      faq: [
        %{
          "question" => "What is the club called?",
          "answer" =>
            "Athletics, with no city name. It was the Oakland Athletics through 2024 and took the bare name on relocating to West Sacramento for the 2025 season. Both the club's own site and the encyclopedia use it that way."
        },
        %{
          "question" => "How long will the Athletics play here?",
          "answer" =>
            "The announced term is 2025 through 2027, with an option for a fourth year, while a new Las Vegas ballpark is built. That announcement came on April 4, 2024, and the club played its first home game at Sutter Health Park on March 31, 2025. The permanent Las Vegas ballpark is not expected to be completed until 2028, and in 2026 the team is scheduled to play six games at Las Vegas Ballpark ahead of the move."
        },
        %{
          "question" => "What does parking cost?",
          "answer" =>
            "No flat rate is published, and none is given here. Official game-day parking books through ACE Parking's online reservation system, with a listed lot address of 870 Riverfront St, West Sacramento, and no flat price is shown without selecting a specific game date in the booking flow."
        },
        %{
          "question" => "How does light rail reach the area?",
          "answer" =>
            "Sacramento Valley Station is the western terminus of SacRT's Gold Line and also serves Amtrak's Capitol Corridor, California Zephyr, Coast Starlight and San Joaquin routes. The 7th & Capitol and 8th & Capitol stations, opened March 12, 1987, are on the Gold Line and connect to the Blue and Green Lines and to bus routes. Tower Bridge carries State Route 275 over the river between West Capitol Avenue and Capitol Mall, taking cars, bicycles and pedestrians — though no source reached ties the bridge to a particular journey between the ballpark and the stations, and this guide asserts none."
        },
        %{
          "question" => "Why does Mill Street Pier not have a page?",
          "answer" =>
            "Because its address could not be established and its only source is a single line in a tourism itinerary describing it as a historic shipping pier with an illuminated \"WEST\" art installation. A place record with no address and one source would be a name and an installation, which is the thinness this corpus is trying to remove. It is named here instead."
        },
        %{
          "question" =>
            "Why does this guide not say whether the Bridge District businesses are open?",
          "answer" =>
            "Because their evidence is the owner's own site plus a tourism itinerary, and neither establishes that a business is trading now. Drake's: The Barn, Bike Dog Brewing and Franquette all carry that shape of evidence. None of it is evidence of closure, and none is stated as such."
        }
      ],
      photos: []
    }
  end
end
