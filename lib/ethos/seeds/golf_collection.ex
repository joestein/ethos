defmodule Ethos.Seeds.GolfCollection do
  @moduledoc """
  Seeds the golf set's collection. Idempotent by slug.

  Every state guide that seeds is an item, and that membership is the whole
  mechanism behind the *"Part of …"* line each guide carries under its title:
  `guide_html/show.html.heex` renders one line per published collection a guide
  belongs to. No template change was needed and none was made.

  ## The title has two jobs, and the first one is saying "golf"

  It ships as **"Golf: A Public Course, State by State"**.

  The subject word comes first because of where this title is actually read.
  `/destinations` lists every collection by title in one flat column, beside
  "Korean BBQ", "Major League Ballparks", "Steakhouses" and "Skiing New
  England" — each of which names its subject in its first two words. An earlier
  version of this title was just "A Public Course, State by State", which is
  accurate, reads well on the collection's own page, and is **unidentifiable in
  that list**: nothing in it says golf. A reader scanning for golf would not
  find it, and no test could have caught that, because the string was true.

  The second job is not overclaiming. `docs/superpowers/specs/2026-09-05-golf-courses-design.md`
  names this collection "A Public Course in Every State", slug
  `public-course-every-state`. The corpus is forty-nine states, not fifty:
  Vermont is unresolved, its ranking's five entries are all labelled `Private`,
  and the championship fallback that answered New Hampshire, New Jersey and
  Tennessee needs a venue count that has not been soundly derived yet
  (`docs/golf/vermont.md`). A title claiming every state over a forty-nine-row
  page would be true of the ambition and false of the artefact, so "State by
  State" stands in for it — true at forty-nine, still true at fifty, so Vermont
  landing adds an item and changes no copy.

  The slug stays `public-course-state-by-state`. It is already published and a
  title is display where a slug is an address; renaming it would 404 the page
  to buy nothing.

  ## The blurbs are derived, not written

  Each blurb restates its own state's resolved roster row —
  `priv/seed_data/golf_courses_roster.json` — in that row's own terms: the
  course, where it is, and which rule selected it. Nothing here is a new claim,
  and nothing here is a sentence about a place that its guide does not already
  publish. That matters because a collection module is prose in Elixir, which
  every JSON gate is blind to: `Ethos.GolfProse` exists so this file and the
  corpus share one definition of banned phrasing, after
  `burys_collection.ex` shipped drive-time copy to production precisely because
  nothing read it.
  """
  alias Ethos.Collections

  def upsert!, do: Collections.upsert_collection!(data())

  def data do
    %{
      slug: "public-course-state-by-state",
      title: "Golf: A Public Course, State by State",
      published: true,
      intro: """
      One course per state that you can actually book, chosen by a rule rather
      than by taste: the highest-ranked entry on that state's Golf Digest Best
      in State list, 2025-'26, that carries Golf Digest's own Public label. In
      most states that means walking down past the private clubs above it — and
      in Iowa, Rhode Island and others there is exactly one public entry on the
      whole list. Where no entry on a state's list is public at all, the course
      is taken on competitive record instead, which is how New Hampshire, New
      Jersey and Tennessee are here. None of these pages claims its course is
      the best in its state; the ranking does not say that, so neither do they.
      Forty-nine states are below. Vermont is missing, and its own record says
      why: every course on its ranking is private, and the fallback needs a
      count that has not been soundly derived yet.
      """,
      items: [
        %{
          guide_slug: "alabama-golf-guide",
          blurb:
            "The Judge in Prattville, Alabama — rank 7 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "alaska-golf-guide",
          blurb:
            "Anchorage Golf Course in Anchorage, Alaska — rank 1 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "arizona-golf-guide",
          blurb:
            "Quintero Golf Club in Peoria, Arizona — rank 16 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "arkansas-golf-guide",
          blurb:
            "Mystic Creek Golf Club in El Dorado, Arkansas — rank 3 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "california-golf-guide",
          blurb:
            "Pebble Beach Golf Links in Pebble Beach, California — rank 2 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "colorado-golf-guide",
          blurb:
            "TPC Colorado in Berthoud, Colorado — rank 14 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "connecticut-golf-guide",
          blurb:
            "Yale Golf Course in New Haven, Connecticut — rank 2 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "delaware-golf-guide",
          blurb:
            "Baywood Greens: Woodside/Waterside in Long Neck, Delaware — rank 3 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "florida-golf-guide",
          blurb:
            "THE PLAYERS Stadium Course at TPC Sawgrass in Ponte Vedra Beach, Florida — rank 2 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "georgia-golf-guide",
          blurb:
            "Old Toccoa Farm in Mineral Bluff, Georgia — rank 37 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "hawaii-golf-guide",
          blurb:
            "Manele Golf Course in Lānaʻi, Hawaii — rank 2 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "idaho-golf-guide",
          blurb:
            "Circling Raven Golf Club in Worley, Idaho — rank 6 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "illinois-golf-guide",
          blurb:
            "Cog Hill Golf & Country Club: Course No. 4 – Dubsdread in Lemont, Illinois — rank 14 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "indiana-golf-guide",
          blurb:
            "The Pete Dye Course at French Lick Resort in French Lick, Indiana — rank 3 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "iowa-golf-guide",
          blurb:
            "Spirit Hollow in Burlington, Iowa — rank 7 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "kansas-golf-guide",
          blurb:
            "Colbert Hills in Manhattan, Kansas — rank 8 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "kentucky-golf-guide",
          blurb:
            "Park Mammoth Golf Club: Park Mammoth in Park City, Kentucky — rank 10 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "louisiana-golf-guide",
          blurb:
            "TPC Louisiana in Avondale, Louisiana — rank 4 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "maine-golf-guide",
          blurb:
            "Cape Arundel Golf Club in Kennebunkport, Maine — rank 2 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "maryland-golf-guide",
          blurb:
            "Bulle Rock Golf Course in Havre de Grace, Maryland — rank 9 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "massachusetts-golf-guide",
          blurb:
            "Taconic Golf Club in Williamstown, Massachusetts — rank 13 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "michigan-golf-guide",
          blurb:
            "Arcadia Bluffs Golf Club: The Bluffs Course in Arcadia, Michigan — rank 3 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "minnesota-golf-guide",
          blurb:
            "The Quarry at Giants Ridge in Biwabik, Minnesota — rank 6 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "mississippi-golf-guide",
          blurb:
            "Dancing Rabbit Golf Club: Azaleas in Philadelphia, Mississippi — rank 5 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "missouri-golf-guide",
          blurb:
            "Ozarks National in Hollister, Missouri — rank 3 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "montana-golf-guide",
          blurb:
            "Wilderness Club in Eureka, Montana — rank 5 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "nebraska-golf-guide",
          blurb:
            "Landmand in Homer, Nebraska — rank 3 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "nevada-golf-guide",
          blurb:
            "Shadow Creek in North Las Vegas, Nevada — rank 1 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "new-hampshire-golf-guide",
          blurb:
            "Bretwood Golf Course: North Course in Keene, New Hampshire — taken on competitive record rather than by ranking, because no entry on the state's Best in State list is publicly accessible at any rank."
        },
        %{
          guide_slug: "new-jersey-golf-guide",
          blurb:
            "Seaview — Bay Course in Galloway, New Jersey — taken on competitive record rather than by ranking, because no entry on the state's Best in State list is publicly accessible at any rank."
        },
        %{
          guide_slug: "new-mexico-golf-guide",
          blurb:
            "Paako Ridge Golf Club in Sandia Park, New Mexico — rank 2 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "new-york-golf-guide",
          blurb:
            "Bethpage State Park: Black in Farmingdale, New York — rank 7 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "north-carolina-golf-guide",
          blurb:
            "Tobacco Road Golf Club in Sanford, North Carolina — rank 13 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "north-dakota-golf-guide",
          blurb:
            "The Minot Country Club in Minot, North Dakota — rank 1 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "ohio-golf-guide",
          blurb:
            "The Virtues Golf Club in Nashport, Ohio — rank 16 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "oklahoma-golf-guide",
          blurb:
            "Jimmie Austin Golf Club at the University of Oklahoma in Norman, Oklahoma — rank 5 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "oregon-golf-guide",
          blurb:
            "Pacific Dunes in Bandon, Oregon — rank 1 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "pennsylvania-golf-guide",
          blurb:
            "The Old Course at Bedford Springs in Bedford, Pennsylvania — rank 27 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "rhode-island-golf-guide",
          blurb:
            "Newport National Golf Club: Orchard Course in Middletown, Rhode Island — rank 7 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "south-carolina-golf-guide",
          blurb:
            "Kiawah Island Golf Resort: The Ocean Course in Kiawah Island, South Carolina — rank 1 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "south-dakota-golf-guide",
          blurb:
            "The Golf Club At Red Rock in Rapid City, South Dakota — rank 3 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "tennessee-golf-guide",
          blurb:
            "General's Retreat in Old Hickory, Tennessee — taken on competitive record rather than by ranking, because no entry on the state's Best in State list is publicly accessible at any rank."
        },
        %{
          guide_slug: "texas-golf-guide",
          blurb:
            "Fields Ranch East in Frisco, Texas — rank 8 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "utah-golf-guide",
          blurb:
            "Black Desert Resort in Ivins, Utah — rank 2 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "virginia-golf-guide",
          blurb:
            "The Highland Course at Primland in Meadows of Dan, Virginia — rank 4 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "washington-golf-guide",
          blurb:
            "Chambers Bay in University Place, Washington — rank 1 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "west-virginia-golf-guide",
          blurb:
            "The Old White in White Sulphur Springs, West Virginia — rank 3 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "wisconsin-golf-guide",
          blurb:
            "Whistling Straits: Straits Course in Town of Mosel, Wisconsin — rank 1 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        },
        %{
          guide_slug: "wyoming-golf-guide",
          blurb:
            "Jackson Hole Golf & Tennis Club in Jackson, Wyoming — rank 4 on Golf Digest Best in State, 2025-'26, and the highest-ranked entry on that list carrying its Public label."
        }
      ]
    }
  end
end
