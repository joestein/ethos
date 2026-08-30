defmodule Ethos.Seeds.MlbBallparksCollection do
  @moduledoc """
  Seeds the Major League Ballparks collection. Idempotent by slug.

  Every one of the thirty ballpark guides is an item. That membership is the
  whole mechanism behind the *"Part of Major League Ballparks"* line each
  ballpark page now carries under its title: `guide_html/show.html.heex:7-9`
  renders one line per published collection a guide belongs to, from
  `Ethos.Collections.collections_for_guide/1`. No template change was needed,
  and none was made.

  ## The blurbs are content, and the content rules bind them

  Each blurb restates something the guide it points at already publishes —
  which means it already traces to a `confirmed` verdict in that ballpark's
  research artifact, through `docs/ballparks/<site>.md`. Nothing here is new
  writing. No trip durations and no vague proximity (docs/site-builder.md §8);
  the drive-time scan over `lib/ethos/seeds/*.ex`
  (`connecticut_seed_data_test.exs:272`) reads this file, and that gate exists
  because `burys_collection.ex` — the other collection module authored by hand
  — shipped two vague-duration phrasings to production. The phrases cannot be
  quoted here: the scan reads module source, so naming a banned phrase in a
  moduledoc fails the gate exactly as publishing it would. That is §8's
  recorded cost of a source scan, and it was confirmed here by a first draft of
  this docstring that quoted one of them and failed.

  Some blurbs are plainer than others and that is correct. Kauffman Stadium's
  says the research established no walkable district, because that is what its
  guide publishes; padding it to match Wrigley's would be inventing content at
  the one point in the corpus nobody would think to audit. Superlatives are
  avoided even where a guide carries one — two guides in this set each call
  their ballpark the smallest in Major League Baseball under different
  qualifiers, and a blurb is the wrong place to adjudicate that.

  ## Order

  Items follow `Ethos.Seeds.Catalog.guide_modules("ballparks")`, which is seed
  order and therefore research-wave order. It is a stable order rather than a
  ranked one; the gate in `mlb_ballparks_collection_test.exs` compares sets,
  not positions, so reordering here is safe.
  """

  alias Ethos.Collections

  def upsert!, do: Collections.upsert_collection!(data())

  @doc """
  The collection attrs, without touching the database.

  Split out from `upsert!/0` — which the two Connecticut collections do not do
  — so that the membership gate can compare this list against
  `Ethos.Seeds.Catalog.guide_modules("ballparks")` without seeding thirty
  guides and 236 places first. A gate that needs a full region seeded is a
  gate that gets marked slow and then excluded, and there are thirty chances
  here for a guide to go quietly missing.
  """
  def data do
    %{
      slug: "mlb-ballparks",
      title: "Major League Ballparks",
      published: true,
      intro: """
      Thirty Major League clubs, thirty ballparks, one guide each. Every guide
      covers the ballpark itself — where it stands, when it opened, and the
      names it has carried — and then the places around it that the research
      confirmed: bars, restaurants, markets, museums, parks and historic
      districts. Where no walkable district could be established from a
      source, the guide says so instead of inventing one. Start with the
      ballpark you know.
      """,
      items: [
        %{
          guide_slug: "wrigley-field-guide",
          blurb:
            "1060 West Addison Street, open since April 23, 1914 as Weeghman Park, and the low-rise Wrigleyville blocks with their rooftop bleachers."
        },
        %{
          guide_slug: "fenway-park-guide",
          blurb:
            "4 Jersey Street in Boston, open since April 20, 1912, with the Citgo Sign, the Back Bay Fens and the Isabella Stewart Gardner Museum."
        },
        %{
          guide_slug: "yankee-stadium-guide",
          blurb:
            "1 East 161st Street in the Bronx, opened in 2009, and Heritage Field, the 10-acre park on the site of the 1923 stadium."
        },
        %{
          guide_slug: "citi-field-guide",
          blurb:
            "41 Seaver Way in Flushing, inside Flushing Meadows–Corona Park, with the Unisphere, the New York State Pavilion and the Queens Museum."
        },
        %{
          guide_slug: "dodger-stadium-guide",
          blurb:
            "1000 Vin Scully Avenue in the Elysian Park neighborhood, opened April 10, 1962 and built in under three years for about $23 million."
        },
        %{
          guide_slug: "oracle-park-guide",
          blurb:
            "24 Willie Mays Plaza in San Francisco's South Beach, opened March 31, 2000, with McCovey Cove beyond the right-field wall and Mission Rock across that water."
        },
        %{
          guide_slug: "busch-stadium-guide",
          blurb:
            "Downtown St. Louis at 7th and Clark, opened in April 2006 on part of the demolished Busch Memorial Stadium's site, with Ballpark Village and the Gateway Arch."
        },
        %{
          guide_slug: "oriole-park-at-camden-yards-guide",
          blurb:
            "333 W. Camden Street, opened April 6, 1992 on the B&O Camden Station rail yard, keeping the eight-story warehouse behind right field."
        },
        %{
          guide_slug: "nationals-park-guide",
          blurb:
            "1500 South Capitol Street SE in Navy Yard, opened March 22, 2008, with The Yards Park and the National Museum of the United States Navy."
        },
        %{
          guide_slug: "rogers-centre-guide",
          blurb:
            "1 Blue Jays Way in downtown Toronto, opened in 1989 as SkyDome and renamed in 2005, with the CN Tower, Steam Whistle Brewing and the Toronto Railway Museum."
        },
        %{
          guide_slug: "sutter-health-park-guide",
          blurb:
            "400 Ballpark Drive in West Sacramento, open since 2000 as Raley Field, and home to both the Sacramento River Cats and the Athletics."
        },
        %{
          guide_slug: "citizens-bank-park-guide",
          blurb:
            "One Citizens Bank Way in the South Philadelphia Sports Complex, opened April 3, 2004, with FDR Park and the American Swedish Historical Museum."
        },
        %{
          guide_slug: "pnc-park-guide",
          blurb:
            "115 Federal Street on Pittsburgh's North Shore, on the banks of the Allegheny River, opened March 31, 2001, with the Andy Warhol Museum and the National Aviary."
        },
        %{
          guide_slug: "great-american-ball-park-guide",
          blurb:
            "100 Joe Nuxhall Way on the Cincinnati riverfront, opened March 31, 2003, with the Reds Hall of Fame, the Underground Railroad Freedom Center and Findlay Market."
        },
        %{
          guide_slug: "progressive-field-guide",
          blurb:
            "2401 Ontario Street in the Gateway complex, opened in 1994 as Jacobs Field and renamed in 2008, with the Hope Memorial Bridge whose statues gave the Guardians their name."
        },
        %{
          guide_slug: "comerica-park-guide",
          blurb:
            "2100 Woodward Avenue in downtown Detroit, home to the Tigers since 2000, with the Fox Theatre, Cliff Bell's and Grand Circus Park."
        },
        %{
          guide_slug: "rate-field-guide",
          blurb:
            "333 West 35th Street in Armour Square, open since April 18, 1991 as Comiskey Park II and shortened to Rate Field in December 2024, with the old Comiskey home plate marker."
        },
        %{
          guide_slug: "american-family-field-guide",
          blurb:
            "1 Brewers Way in the Menomonee Valley, opened April 6, 2001 under North America's only fan-shaped convertible roof, with the Hank Aaron State Trail and Helfaer Field."
        },
        %{
          guide_slug: "target-field-guide",
          blurb:
            "1 Twins Way in the Minneapolis Warehouse District, opened April 12, 2010, with the Guthrie Theater, the Mill City Museum and the Stone Arch Bridge."
        },
        %{
          guide_slug: "kauffman-stadium-guide",
          blurb:
            "1 Royal Way in the Truman Sports Complex, open since 1973 and renamed in 1993 for Ewing Kauffman; no source fetched establishes a walkable district, and the guide says so."
        },
        %{
          guide_slug: "coors-field-guide",
          blurb:
            "2001 Blake Street in Denver's Lower Downtown, opened April 26, 1995, with Larimer Square, McGregor Square and the Oxford Hotel."
        },
        %{
          guide_slug: "angel-stadium-guide",
          blurb:
            "2000 Gene Autry Way in Anaheim, home to the Angels since it opened on April 19, 1966, with the Honda Center and the DigAlert Grove of Anaheim."
        },
        %{
          guide_slug: "truist-park-guide",
          blurb:
            "755 Battery Avenue SE in Cumberland, an unincorporated Cobb County community: the Braves' ballpark since April 14, 2017, with The Battery Atlanta's hotels, venues and restaurants."
        },
        %{
          guide_slug: "loandepot-park-guide",
          blurb:
            "501 Marlins Way on the former Miami Orange Bowl site in Little Havana, open since 2012, with Maximo Gomez Park, the Tower Theater and Ball & Chain."
        },
        %{
          guide_slug: "daikin-park-guide",
          blurb:
            "501 Crawford Street in downtown Houston, home to the Astros since 2000 under four names, the current one since January 1, 2025, with Market Square Park and Discovery Green."
        },
        %{
          guide_slug: "tropicana-field-guide",
          blurb:
            "One Tropicana Drive in St. Petersburg, in use again since April 6, 2026 after Hurricane Milton tore through the roof, with the Salvador Dali Museum and the St. Pete Pier."
        },
        %{
          guide_slug: "globe-life-field-guide",
          blurb:
            "734 Stadium Drive in Arlington, first regular-season game July 24, 2020, with Choctaw Stadium, AT&T Stadium and Texas Live! in the entertainment district."
        },
        %{
          guide_slug: "chase-field-guide",
          blurb:
            "401 East Jefferson Street in downtown Phoenix, open since March 31, 1998 as Bank One Ballpark and renamed in 2005, with the Rosson House and the Arizona Science Center."
        },
        %{
          guide_slug: "petco-park-guide",
          blurb:
            "100 Park Boulevard in downtown San Diego, the Padres' ballpark since 2004, with the Gaslamp Quarter Historic District and the 1850 Davis-Horton House."
        },
        %{
          guide_slug: "t-mobile-park-guide",
          blurb:
            "1250 First Avenue South in SoDo, open since July 15, 1999 as Safeco Field and renamed in 2019, with Pioneer Square, Smith Tower and Merchant's Cafe."
        }
      ]
    }
  end
end
