defmodule Ethos.Seeds.SkiCollections do
  @moduledoc """
  Seeds the ski collections. Idempotent by slug.

  Two collections in this round, not the eight spec §4 describes, and the gap
  is deliberate rather than unfinished. `Collections.upsert_collection!/1`
  raises on an item whose guide slug has no row, so a regional collection can
  exist only once its region's guides do — and only New England is published.
  Projects B through G each add a `defp` here and extend `parent/0`'s curated
  list; nothing in this module has to be restructured for them.

  `Collections.upsert_collection!/1` raises on an unseeded guide, so this must
  run after `seed_ski/1` — which is why `seed_collections/0` runs last in the
  release sequence.

  ## The parent is a selection, not a directory

  Collections hold guides, flat, so the parent cannot list the regional
  collections as members. It links them from its intro and carries a curated
  selection of mountains as its items. That selection is drawn from New England
  alone while New England is all there is, and the intro says so — a page
  headed "Skiing and Snowboarding in the United States" whose fourteen mountains
  are all in Vermont, New Hampshire, Maine, Massachusetts, Connecticut and
  Rhode Island, and which does not admit it, is a page that misleads about its
  own scope.

  ## Blurbs are derived, not researched

  Every blurb in `regional/0` and `parent/0` is compressed from that area's own
  `priv/seed_data/ski/{slug}.json` — its guide intro and its ski-area place
  summary — and nothing else. No blurb carries a digit that is not a
  four-digit year already present in that same file, and none carries a unit
  word (foot, acre, mile, vertical, trail, lift, and their plurals) or a
  superlative; a one-line blurb has no business asserting an unsourced
  vertical drop or claiming the biggest anything, and the corpus gate that
  gave every guide the same rule cannot see this module. See
  `test/ethos/seeds/ski_collections_test.exs` for the mechanical checks.
  """

  alias Ethos.Collections

  def upsert_all! do
    [regional(), parent()]
    |> Enum.map(&Collections.upsert_collection!/1)
  end

  @doc """
  The New England regional collection's attrs.

  Exposed separately from `upsert_all!/0` so the seed gate can read this
  module's own prose — intro and every item blurb — without writing to the repo,
  the practice `Ethos.Seeds.SteakhouseCollection` established.
  """
  def regional do
    %{
      slug: "skiing-new-england",
      title: "Skiing New England",
      published: true,
      intro: """
      Every operating, lift-served ski area open to the public across New England's six states — Vermont, New Hampshire, Maine, Massachusetts, Connecticut, and Rhode Island — eighty-two mountains in all. The range runs from large resorts under national ownership groups down to town-owned hills running a single rope tow for their own residents, with a cooperatively owned mountain and college- and club-run areas in between. This is not a curated selection: it is the complete list, drawn directly from the region's ski area roster, which is the authority on what counts here and what has closed.
      """,
      items: [
        %{
          guide_slug: "abenaki-ski-area-ski-guide",
          blurb:
            "A town-owned community hill in Wolfeboro, operated by the town's Parks & Recreation Department, with lift-served skiing since 1940 after earlier hike-up skiing at the site."
        },
        %{
          guide_slug: "ascutney-outdoors-ski-guide",
          blurb:
            "A nonprofit-run public ski area on the former site of Ascutney Mountain Resort, offering T-bar-served alpine skiing and snowboarding, backcountry skiing, and cross-country access."
        },
        %{
          guide_slug: "attitash-mountain-resort-ski-guide",
          blurb:
            "A Vail Resorts-owned ski area in Bartlett with WPA-funded roots in 1938, commercially opened as Mt. Attitash in 1965."
        },
        %{
          guide_slug: "baker-mountain-ski-guide",
          blurb:
            "A volunteer-run community ski area on Pierce Hill in Moscow, operating a T-Bar and Poma surface lift since the 1960s."
        },
        %{
          guide_slug: "berkshire-east-ski-guide",
          blurb:
            "A Charlemont ski area that traces to a failed 1953 club and a 1961 relaunch, now generating its own wind and solar power and moving toward Bear Den Partners ownership."
        },
        %{
          guide_slug: "big-moose-mountain-ski-guide",
          blurb:
            "A non-profit community ski area above Moosehead Lake, running a triple chair and beginner conveyor on the lower mountain while the upper mountain remains reachable only by snowcat."
        },
        %{
          guide_slug: "big-rock-ski-guide",
          blurb:
            "A non-profit community ski area on Mars Hill Mountain, transferred to local ownership in 2013 after the Maine Winter Sports Center's exit."
        },
        %{
          guide_slug: "black-mountain-ski-guide",
          blurb:
            "A Jackson ski area operating since 1935, owned outright since March 2026 by Erik Mogensen through Entabeni Systems."
        },
        %{
          guide_slug: "black-mountain-of-maine-ski-guide",
          blurb:
            "A non-profit alpine and Nordic ski area in Rumford, run by the Chisholm Ski Club since 1924 and home to national-championship Nordic events."
        },
        %{
          guide_slug: "blue-hills-ski-area-ski-guide",
          blurb:
            "A state-built 1950 ski hill inside the Blue Hills Reservation in Canton, run under a series of private leases since 1962 and by Geoff Homer since 2024."
        },
        %{
          guide_slug: "bolton-valley-resort-ski-guide",
          blurb:
            "A family-owned ski resort with chairlift-served skiing and snowboarding, night skiing, and an on-site wind turbine, founded in 1966 and bought back by its founding family in 2017."
        },
        %{
          guide_slug: "bousquet-mountain-ski-guide",
          blurb:
            "A Pittsfield ski area dating to a 1932 mink farm's failure, an early night-skiing pioneer, purchased and rebuilt by Mill Town Capital beginning in 2020."
        },
        %{
          guide_slug: "bretton-woods-ski-guide",
          blurb:
            "An Omni-owned ski area in the town of Carroll, opened in 1973, named for the village that hosted the 1944 conference founding the IMF and World Bank."
        },
        %{
          guide_slug: "bromley-mountain-resort-ski-guide",
          blurb:
            "A south-facing ski resort founded in 1936, known as \"The Sun Mountain,\" with chairlift-served skiing, snowboarding, and a long history as a telemark and snowboard hub."
        },
        %{
          guide_slug: "burke-mountain-resort-ski-guide",
          blurb:
            "A chairlift-served ski area in East Burke, home to Burke Mountain Academy's alpine ski racers, that emerged from federal receivership when Bear Den Partners bought it in 2025."
        },
        %{
          guide_slug: "camden-snow-bowl-ski-guide",
          blurb:
            "A town-owned ski area on Ragged Mountain with ocean views, built by Depression-era volunteers and home to the U.S. National Toboggan Championships."
        },
        %{
          guide_slug: "cannon-mountain-ski-guide",
          blurb:
            "A state-owned ski area in Franconia Notch, with skiing dating to 1929 and a tramway that New Hampshire State Parks describes as North America's original passenger aerial tramway."
        },
        %{
          guide_slug: "catamount-ski-area-ski-guide",
          blurb:
            "A ski area straddling the Massachusetts-New York line on Mount Fray, likely opened in 1940, whose base-lodge jurisdiction is not established by available sources."
        },
        %{
          guide_slug: "cochrans-ski-area-ski-guide",
          blurb:
            "A volunteer-run, non-profit rope-tow and T-bar ski area founded by the Cochran ski-racing family in their Richmond backyard, still run by Olympic gold medalist Barbara Ann Cochran."
        },
        %{
          guide_slug: "cranmore-mountain-resort-ski-guide",
          blurb:
            "A Conway ski area founded in 1937 by Harvey Dow Gibson, home to Hannes Schneider's American ski school and now owned by the Fairbank family."
        },
        %{
          guide_slug: "crotched-mountain-ski-and-ride-ski-guide",
          blurb:
            "A Vail-owned ski area on the Francestown/Bennington line, reopened in 2003 after Peak Resorts rebuilt it following a long closure."
        },
        %{
          guide_slug: "dartmouth-skiway-ski-guide",
          blurb:
            "A Dartmouth College-owned ski area at Holt's Ledge in Lyme, open to the public since 1956 and twice host to the NCAA Skiing Championships."
        },
        %{
          guide_slug: "granite-gorge-ski-area-ski-guide",
          blurb:
            "A Roxbury ski area on the Pinnacle, dating to around 1959, closed for decades twice over, and reopened under new ownership in 2022."
        },
        %{
          guide_slug: "gunstock-mountain-resort-ski-guide",
          blurb:
            "A Belknap County-owned ski area in Gilford, opened in 1936 as a WPA project and an early home for chairlift service in the East."
        },
        %{
          guide_slug: "hardack-ski-guide",
          blurb:
            "A municipal rope-tow and tubing hill run by the City of St. Albans' Recreation & Parks Department, alongside the city's public pool."
        },
        %{
          guide_slug: "harrington-hill-ski-guide",
          blurb:
            "A single, volunteer-run rope tow above Strafford village, funded by the Strafford Lions Club and open free to town residents and guests."
        },
        %{
          guide_slug: "hermon-mountain-ski-guide",
          blurb:
            "A family-oriented ski area in Hermon operating a double chairlift and tubing, sold to new ownership in April 2026 after three decades under the Whitcomb family."
        },
        %{
          guide_slug: "jay-peak-resort-ski-guide",
          blurb:
            "A tram-served ski resort in Vermont's Northeast Kingdom, incorporated in 1955, that survived a securities fraud case tied to its investor-visa program and receivership to sell to Pacific Group Resorts in 2022."
        },
        %{
          guide_slug: "jiminy-peak-ski-guide",
          blurb:
            "A Hancock ski area founded by three World War II veterans in 1947, now powered in part by a 2007 wind turbine whose own output figures its operator has never reconciled."
        },
        %{
          guide_slug: "killington-ski-resort-ski-guide",
          blurb:
            "A gondola- and chairlift-served ski resort opened in 1958, now owned by a group of local passholders after decades under Sherburne, American Skiing Company, and Powdr."
        },
        %{
          guide_slug: "king-pine-ski-area-ski-guide",
          blurb:
            "A Hoyt family-owned ski area in Madison, tracing to a 1938 rope tow and formally opened with three runs in 1962."
        },
        %{
          guide_slug: "living-memorial-park-ski-guide",
          blurb:
            "A volunteer-run, non-profit T-bar ski hill on Brattleboro's town-owned Living Memorial Park, founded as a community rope tow in 1937."
        },
        %{
          guide_slug: "lonesome-pine-trails-ski-guide",
          blurb:
            "A non-profit T-Bar ski area on Stevens Hill in Fort Kent, operating with snowmaking and night skiing since 1964."
        },
        %{
          guide_slug: "loon-mountain-resort-ski-guide",
          blurb:
            "A Boyne Resorts-owned ski area in Lincoln, established in 1966 by former NH Governor Sherman Adams and expanded most recently by the 2023 South Peak Expansion."
        },
        %{
          guide_slug: "lost-valley-ski-guide",
          blurb:
            "A community ski area in western Auburn, rescued from a 2014 financial crisis and now setting record skier-visit seasons under the Shanaman family."
        },
        %{
          guide_slug: "lyndon-outing-club-ski-guide",
          blurb:
            "A volunteer-run T-bar ski area on Shonya Hill, tracing its roots to a 1926 Winter Carnival and rebuilt more than once after lightning and lift failures."
        },
        %{
          guide_slug: "mad-river-glen-ski-guide",
          blurb:
            "A cooperatively owned ski area on Stark Mountain, home to one of only two single chairlifts still operating in the United States, and the only major mountain in the country owned by its skiers."
        },
        %{
          guide_slug: "magic-mountain-ski-guide",
          blurb:
            "A chairlift-served ski area on Glebe Mountain, founded in 1960, closed for several years in the 1990s, and independently owned since 2016."
        },
        %{
          guide_slug: "mcintyre-ski-area-ski-guide",
          blurb:
            "A community ski hill in Manchester, operating since 1971 and run today as McIntyre Ski Area, LLC."
        },
        %{
          guide_slug: "middlebury-college-snow-bowl-ski-guide",
          blurb:
            "A chairlift-served ski area on Worth Mountain owned and operated by Middlebury College since 1939, open to the public alongside its college ski program."
        },
        %{
          guide_slug: "millinocket-ski-slope-ski-guide",
          blurb:
            "A town-rebuilt rope tow in Millinocket's Recreation complex, near Stearns High School, that reopened in 2026 after a decades-long absence."
        },
        %{
          guide_slug: "mohawk-mountain-ski-guide",
          blurb:
            "A Cornwall ski area Walt Schoenknecht opened under a state lease in 1947, a proving ground for early snowmaking, and later the start of two chains that reached Vermont and Massachusetts through his own protege."
        },
        %{
          guide_slug: "mount-abram-ski-guide",
          blurb:
            "An independently owned ski area in Greenwood with a long history of foreclosures, a T-Bar dating to 1961, and a solar farm added in 2014."
        },
        %{
          guide_slug: "mount-eustis-ski-hill-ski-guide",
          blurb:
            "A volunteer-run, rope-tow ski hill in Littleton, reopened in 2015 after decades of closure."
        },
        %{
          guide_slug: "mount-jefferson-ski-area-ski-guide",
          blurb:
            "A small ski area in Lee founded by six local investors in 1964, run for decades by the Delano family and, since 2016, by Ken Zimmerman's Mt. Jefferson Ski Resort, LLC — placed on the market in August 2026."
        },
        %{
          guide_slug: "mount-snow-ski-guide",
          blurb:
            "A chairlift-served resort founded in 1954, absorbed into S-K-I Ltd. and later American Skiing Company and Peak Resorts, now owned by Vail Resorts."
        },
        %{
          guide_slug: "mount-southington-ski-guide",
          blurb:
            "Central Connecticut's local ski hill, founded by orthodontist Dr. Harold Richman on a former Plantsville dairy farm in the 1960s, whose planned dedication ceremony was postponed twice and never held."
        },
        %{
          guide_slug: "mount-sunapee-resort-ski-guide",
          blurb:
            "A state-owned ski area within Mount Sunapee State Park in Newbury, leased since 1998 and now operated by Vail Resorts."
        },
        %{
          guide_slug: "nashoba-valley-ski-guide",
          blurb:
            "A Westford ski area opened by Alan Fletcher Sr. for the 1964 season, still run by his children."
        },
        %{
          guide_slug: "northeast-slopes-ski-guide",
          blurb:
            "A volunteer-run, non-profit T-bar and rope tow ski area on Eastman Hill, tracing its roots to a 1936 rope tow in Bradford."
        },
        %{
          guide_slug: "okemo-mountain-resort-ski-guide",
          blurb:
            "A chairlift-served resort incorporated by local Ludlow businessmen in 1955, owned for decades by the Mueller family, now owned by Vail Resorts."
        },
        %{
          guide_slug: "otis-ridge-ski-guide",
          blurb:
            "A 1946 rope-tow hill in the town of Otis that has passed through two foreclosures and a 2016 rescue sale on its way to its current owner."
        },
        %{
          guide_slug: "pats-peak-ski-guide",
          blurb: "A Patenaude family-owned ski area in Henniker, operating since 1963."
        },
        %{
          guide_slug: "pico-mountain-ski-guide",
          blurb:
            "A chairlift-served ski area founded by the Mead family in 1937, under common ownership with neighboring Killington since 1996 but still separately branded."
        },
        %{
          guide_slug: "pinnacle-ski-club-ski-guide",
          blurb:
            "A Kiwanis-founded community ski hill in Pittsfield, running two rope tows with night skiing and public day tickets since 1954."
        },
        %{
          guide_slug: "pleasant-mountain-ski-guide",
          blurb:
            "A Bridgton ski area that opened under this name in 1938, was renamed Shawnee Peak in 1988, and had its original name restored by Boyne Resorts in 2022."
        },
        %{
          guide_slug: "powder-ridge-ski-guide",
          blurb:
            "A Middlefield ski area founded by two former appliance retailers, once host to a cancelled 1970 rock festival, later closed, town-owned, and reopened under Brownstone Exploration & Discovery Park."
        },
        %{
          guide_slug: "powderhouse-hill-ski-guide",
          blurb:
            "A town-owned South Berwick rope tow hill, club-operated since a 1964 incorporation, with roots dating to about 1939."
        },
        %{
          guide_slug: "quarry-road-ski-guide",
          blurb:
            "A Waterville recreation area whose Nordic trail network is joined by a rope tow, installed in 2021 on the site of the historic Colby Ski Area."
        },
        %{
          guide_slug: "quoggy-jo-ski-guide",
          blurb:
            "A volunteer-run, non-profit alpine ski area in Presque Isle, operated by the Quoggy Jo Ski Club."
        },
        %{
          guide_slug: "ragged-mountain-resort-ski-guide",
          blurb:
            "A ski area in Danbury, opened in 1965, which passed through state ownership before returning to local ownership in November 2025."
        },
        %{
          guide_slug: "saddleback-ski-guide",
          blurb:
            "A Franklin County ski area, closed for five seasons between 2015 and 2020 after a chairlift-financing dispute, a collapsed sale agreement, and a fraud arrest, before reopening under new ownership."
        },
        %{
          guide_slug: "saskadena-six-ski-guide",
          blurb:
            "A chairlift-served ski area founded in 1936 as Suicide Six by Wallace \"Bunny\" Bertram, renamed Saskadena Six in 2022 by owner Woodstock Inn & Resort."
        },
        %{
          guide_slug: "ski-bradford-ski-guide",
          blurb:
            "A ski area in the Bradford section of Haverhill, tracing to a rope tow on Dead Hill and owned by the Sawyer family for generations."
        },
        %{
          guide_slug: "ski-butternut-ski-guide",
          blurb:
            "A Warner Mountain ski area with roots in a 1936 CCC trail and a 1962 reopening by the Murdock family, who still own it."
        },
        %{
          guide_slug: "ski-sundown-ski-guide",
          blurb:
            "A New Hartford ski area that opened in 1964 as Satan's Ridge, foreclosed and sat idle, and was bought and renamed by Channing Murdock — the same Channing Murdock who had managed Mohawk Mountain and founded Butternut Basin."
        },
        %{
          guide_slug: "ski-ward-ski-guide",
          blurb:
            "A Shrewsbury ski area possibly dating to 1939 on the Ward family's Union Hill farm, run by the LaCroix family since 1990."
        },
        %{
          guide_slug: "smugglers-notch-resort-ski-guide",
          blurb:
            "A three-mountain chairlift-served resort founded in 1956, owned by the Watson family, then the Stritzler family from 1996, and since February 2026 majority-owned by Bear Den Partners with Bill Stritzler as a minority shareholder."
        },
        %{
          guide_slug: "spruce-mountain-ski-guide",
          blurb:
            "A volunteer-run ski area jointly owned by the towns of Jay, Livermore, and Livermore Falls, operating since 1956."
        },
        %{
          guide_slug: "storrs-hill-ski-area-ski-guide",
          blurb:
            "A community ski hill in Lebanon, operated by the Lebanon Outing Club since 1923."
        },
        %{
          guide_slug: "stowe-mountain-resort-ski-guide",
          blurb:
            "A chairlift-served resort on Mount Mansfield, lift-served since 1937, home to the birth of the National Ski Patrol, now owned by Vail Resorts."
        },
        %{
          guide_slug: "stratton-mountain-resort-ski-guide",
          blurb:
            "A chairlift-served resort opened in 1961, the site of snowboarding's early institutional acceptance and the Burton US Open, now part of Alterra Mountain Company."
        },
        %{
          guide_slug: "sugarbush-resort-ski-guide",
          blurb:
            "A chairlift-served resort founded in 1958 on Lincoln Peak, later joined with the neighboring Mount Ellen area, now owned by Alterra Mountain Company."
        },
        %{
          guide_slug: "sugarloaf-ski-guide",
          blurb:
            "A Boyne Resorts ski area in Carrabassett Valley, founded by a ski club in 1950 and owned for nearly four decades by the Sugarloaf Mountain Corporation."
        },
        %{
          guide_slug: "sunday-river-ski-guide",
          blurb:
            "A Boyne Resorts ski area in Newry, founded in 1958 by the Bethel Area Development Corporation and later run by Les Otten before three corporate sales."
        },
        %{
          guide_slug: "tenney-mountain-ski-guide",
          blurb:
            "A ski area in Plymouth with a long history of closures and reopenings, currently operated by Northcountry Development Group."
        },
        %{
          guide_slug: "titcomb-mountain-ski-guide",
          blurb:
            "A Farmington Ski Club-run ski area dating to 1939, named for a soldier killed in action in 1945."
        },
        %{
          guide_slug: "wachusett-mountain-ski-guide",
          blurb:
            "A Princeton ski area operating on Commonwealth land since an 1899 reservation and a 1968 operating lease, run by the Crowley family's Wachusett Mountain Associates."
        },
        %{
          guide_slug: "waterville-valley-resort-ski-guide",
          blurb:
            "An independently owned ski area in the town of Waterville Valley, founded by Olympic skier Tom Corcoran and open since 1966."
        },
        %{
          guide_slug: "whaleback-mountain-ski-guide",
          blurb:
            "A nonprofit-operated ski area in Enfield, run by the Upper Valley Snow Sports Foundation since 2013 after multiple prior closures."
        },
        %{
          guide_slug: "wildcat-mountain-ski-guide",
          blurb:
            "A Vail Resorts-owned ski area in Pinkham's Grant, historically known for its 1958-1999 gondola."
        },
        %{
          guide_slug: "yawgoo-valley-ski-guide",
          blurb:
            "Rhode Island's only operating alpine ski area, cut into Yorker Hill by Richard Downs starting in 1964 and owned by the de Wardener family since a December 1980 purchase."
        }
      ]
    }
  end

  @doc """
  The parent collection's attrs — a curated fourteen mountains spanning the range.

  Same separation and the same reason as `regional/0`.
  """
  def parent do
    %{
      slug: "skiing-and-snowboarding-united-states",
      title: "Skiing and Snowboarding in the United States",
      published: true,
      intro: """
      Skiing and Snowboarding in the United States starts with [New England](/c/skiing-new-england), the only region of the seven this project has published so far. The fourteen mountains below are all drawn from that one region: Vermont's cooperative alongside its state-owned neighbor in New Hampshire, Maine's Boyne Resorts mountains, a Rhode Island hill that is the state's whole alpine ski scene, and the small town- and family-run areas beside them. They are not a national selection, because there is not yet a national corpus to select from. Six more regions are planned — the Rockies, the Midwest, the Pacific, the Mid-Atlantic, the Southeast, and Alaska — and each will extend this page with its own mountains once its guides exist.
      """,
      items: [
        %{
          guide_slug: "mad-river-glen-ski-guide",
          blurb:
            "Vermont's cooperatively owned mountain, run by its own skiers and shareholders and home to one of only two single chairlifts still operating in the country."
        },
        %{
          guide_slug: "killington-ski-resort-ski-guide",
          blurb:
            "A gondola-served Vermont resort opened in 1958, now owned by a group of local passholders after decades under Sherburne, American Skiing Company, and Powdr."
        },
        %{
          guide_slug: "stowe-mountain-resort-ski-guide",
          blurb:
            "Skiing on Mount Mansfield since 1937, home to the birth of the National Ski Patrol, and today part of the Vail Resorts network."
        },
        %{
          guide_slug: "jay-peak-resort-ski-guide",
          blurb:
            "A tram-served resort in Vermont's Northeast Kingdom, incorporated in 1955 and rebuilt out of receivership after a securities-fraud scandal to sell to Pacific Group Resorts in 2022."
        },
        %{
          guide_slug: "cannon-mountain-ski-guide",
          blurb:
            "New Hampshire's state-owned mountain in Franconia Notch, with skiing dating to 1929 and a tramway, opened in 1938, that the state itself describes as North America's original passenger aerial tramway."
        },
        %{
          guide_slug: "waterville-valley-resort-ski-guide",
          blurb:
            "An Olympic skier's mountain: Tom Corcoran began scouting the site in 1964, formed the Waterville Company in 1965, and had the resort open for business by 1966."
        },
        %{
          guide_slug: "sugarloaf-ski-guide",
          blurb:
            "Maine's Carrabassett Valley mountain, begun by a ski club in 1950 and run for nearly four decades by the Sugarloaf Mountain Corporation before a 1994 sale, now part of Boyne Resorts."
        },
        %{
          guide_slug: "sunday-river-ski-guide",
          blurb:
            "A Newry mountain founded in 1958 by a regional development corporation and personally run by Les Otten from 1980, before three later corporate sales brought it under Boyne Resorts."
        },
        %{
          guide_slug: "camden-snow-bowl-ski-guide",
          blurb:
            "A town-owned hill on Ragged Mountain with views of Penobscot Bay, built by Depression-era volunteers and still run by the town of Camden."
        },
        %{
          guide_slug: "wachusett-mountain-ski-guide",
          blurb:
            "A Princeton mountain within Wachusett Mountain State Reservation, on Commonwealth of Massachusetts land since an 1899 reservation, run under a lease since 1968 by the Crowley family's Wachusett Mountain Associates."
        },
        %{
          guide_slug: "cochrans-ski-area-ski-guide",
          blurb:
            "A rope-tow and T-bar hill the Cochran family built in their own Richmond backyard, still run today by Olympic gold medalist Barbara Ann Cochran."
        },
        %{
          guide_slug: "mohawk-mountain-ski-guide",
          blurb:
            "Connecticut's Walt Schoenknecht mountain, opened under a 1947 state lease and a proving ground for early snowmaking before he went on to found Mount Snow."
        },
        %{
          guide_slug: "yawgoo-valley-ski-guide",
          blurb:
            "Rhode Island's only operating alpine ski area, cut into Yorker Hill starting in 1964 and run by the de Wardener family since a 1980 purchase."
        },
        %{
          guide_slug: "abenaki-ski-area-ski-guide",
          blurb:
            "The selection's town-run hill: Wolfeboro's Abenaki, run by the town's own parks department, with lift-served skiing since 1940 after earlier hike-up skiing at the site."
        }
      ]
    }
  end
end
