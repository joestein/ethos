defmodule Ethos.Seeds.SteakhouseCollection do
  @moduledoc """
  Seeds the Steakhouses collection. Idempotent by slug.

  Eleven guides, not fourteen, and the three missing rows are worth naming.
  The Bronx measured 6 verified rooms against the bar of 8 and does have a
  nameable cluster — Jake's, Arnauld's and Riverdale Steak House are all in
  Riverdale — so it fails on count, not on shape; it is folded into a note on
  the Manhattan page rather than dropped outright. Staten Island (4 rooms, no
  cluster, two of the four opened in the last four years with no verifiable
  history) and Baltimore (7 rooms, one pair collapsing to a single room once
  The Ruxton's move into the former Fleming's space at 720 Aliceanna Street
  was caught) both fail the count bar with nothing to fold into, so both drop.
  Baltimore is dropped rather than merged into Washington DC: a merge puts the
  rooms on the target page, and Baltimore City rooms on a page named
  Washington DC would misname them across a state line and forty miles.

  Two findings invert the sibling Korean BBQ corpus rather than repeat its
  shape. Seattle's Korean BBQ page had to become Puget Sound because its
  grills sat in four suburban corridors up to forty miles out; Seattle's 22
  steakhouse rooms are all inside the city limits, concentrated downtown and
  in Belltown, so the page stays Seattle. Chicago's Korean BBQ corpus split in
  two because its mass fled Lawrence Avenue for suburban Niles and Glenview;
  Chicago's 24 steakhouse rooms never left River North, the Gold Coast, the
  Loop and the West Loop, so one page holds all of them. Where Korean BBQ
  followed immigrant settlement patterns outward from the city, steakhouses
  follow downtown business districts and stayed put.

  `Collections.upsert_collection!/1` raises on an item whose guide slug has no
  row yet, so this must run after `seed_steakhouse/1` — which is why
  `seed_collections/0` runs last in the release sequence.
  """

  alias Ethos.Collections

  def upsert!, do: Collections.upsert_collection!(attrs())

  @doc """
  The collection's attrs, exposed separately from `upsert!/0` so the seed
  data gate can read this module's own prose — intro and every item blurb —
  without writing to the repo.
  """
  def attrs do
    %{
      slug: "steakhouses",
      title: "Steakhouses",
      published: true,
      intro: """
      A steakhouse, for this collection, means a room where the beef is the
      point: a dry-aged program, a chophouse menu, a dining room built around
      the cut rather than around a chef's tasting menu or a hotel restaurant
      that happens to serve strip steak. That line decided which of fourteen
      scoped cities made the cut and which did not.

      Eleven guides, counted rather than assumed. Manhattan carries the
      densest corpus and absorbs the Bronx's six rooms rather than giving them
      a page of their own. Queens turns out to run on Argentine and Brazilian
      parrillas more than on prime beef. Seattle and Chicago each stayed a
      single city page, in both cases the opposite of how their Korean BBQ
      guides had to split or expand — steakhouses cluster around downtown
      business districts, not around the neighborhoods immigration built.
      """,
      items: [
        %{
          guide_slug: "manhattan-steakhouse-guide",
          blurb:
            "31 rooms published and five more linked to the neighborhood guides that already carry them, the densest of the fourteen cities scoped. 23 stand between 34th Street and Central Park South, with the rest downtown and in the Village. Also carries the six Bronx rooms."
        },
        %{
          guide_slug: "brooklyn-steakhouse-guide",
          blurb:
            "15 rooms in four clusters: Williamsburg and Greenpoint (4), a kosher steakhouse belt from Borough Park through Midwood to Crown Heights (5), Bay Ridge and the Court Street corridor (4) and Downtown Brooklyn (2). Peter Luger and Gage & Tollner are linked, not repeated."
        },
        %{
          guide_slug: "queens-steakhouse-guide",
          blurb:
            "16 rooms, and the borough's steakhouse is South American rather than prime beef: 8 sit on the Argentine and Brazilian parrilla belt through Jackson Heights, Elmhurst and Corona, two steak rooms hold Astoria, and six are outliers a neighborhood apart."
        },
        %{
          guide_slug: "london-steakhouse-guide",
          blurb:
            "37 verified rooms, nine of them named in a 2026 global steak-restaurant ranking. The core sits in Mayfair, Soho and the City, but Hawksmoor's seven sites, Gaucho's four and Blacklock's four spread the corpus across the boroughs."
        },
        %{
          guide_slug: "chicago-steakhouse-guide",
          blurb:
            "24 verified rooms, every one inside the city limits. Unlike Korean BBQ's flight to suburban Niles and Glenview, steakhouse mass never left River North, the Gold Coast, the Loop and the West Loop, which hold 21 of the 24."
        },
        %{
          guide_slug: "los-angeles-steakhouse-guide",
          blurb:
            "24 verified rooms across three municipalities: 15 in the City of Los Angeles from Koreatown and Downtown out to Echo Park, Hollywood, Venice and the Valley, 7 in Beverly Hills and 2 in West Hollywood — one page, since the city sustains it alone."
        },
        %{
          guide_slug: "san-francisco-steakhouse-guide",
          blurb:
            "15 verified rooms, all inside the city — unlike Korean BBQ, no South Bay page pulls the mass south. Clusters run the Van Ness and Nob Hill spine, Union Square, the Financial District and Embarcadero, Marina and Cow Hollow, and Market and SoMa."
        },
        %{
          guide_slug: "seattle-steakhouse-guide",
          blurb:
            "22 verified rooms, all inside the city limits, so the page stays Seattle rather than becoming Puget Sound — the inverse of Korean BBQ's four-suburban-corridor page. Steak concentrates downtown and in Belltown, with Capitol Hill, Ballard and Queen Anne behind it."
        },
        %{
          guide_slug: "boston-steakhouse-guide",
          blurb:
            "12 verified rooms: Back Bay's five along Boylston, Berkeley and Arlington, the Seaport's four, Beacon Hill's one and Downtown's two. No Boston place corpus existed before this guide."
        },
        %{
          guide_slug: "washington-dc-steakhouse-guide",
          blurb:
            "17 verified rooms, and the page is the District only, not the District plus Northern Virginia — the K Street power-dining corridor sustains it alone, with a second node in Georgetown. Tysons and Arlington's chain corridor stays outside the scope."
        },
        %{
          guide_slug: "miami-steakhouse-guide",
          blurb:
            "20 verified rooms across four municipalities kept as one page: 9 in Miami proper from Brickell to Little Havana, 8 in Miami Beach's South of Fifth, 2 in Coral Gables and 1 in Aventura — matching the city's own single steakhouse list."
        }
      ]
    }
  end
end
