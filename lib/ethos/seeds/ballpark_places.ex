defmodule Ethos.Seeds.BallparkPlaces do
  @moduledoc """
  Seeds the places for the MLB ballpark guides. Idempotent: `upsert_all!/0`
  upserts by slug.

  One private function per ballpark, each returning its own list, with a
  locality map of its own; `places/0` concatenates them. Adding the next
  ballpark is a new function and one more term in that concatenation, and
  nothing else in this file moves.

  ## Wrigley Field

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Wrigley Field research artifact, as adjudicated by an
  independent adversarial verifier (157 confirmed, 4 refuted, 7 uncertain).
  A verdict vouches only for what its own `item` text restates, not for every
  clause of the sentence the finder wrote around it. The report at
  .superpowers/sdd/2026-08-30-mlb-ballparks/task-4-report.md quotes each
  published sentence against the verdict it rests on, and records every
  omission.

  What the verification changed, and what is therefore absent here:

    * **Two records were dropped.** The Park at Wrigley carries an `uncertain`
      verdict on its own current name, and its street address is an inference
      from a licence row that does not name the plaza — the verifier's ruling
      is "drop this record". Cubs Store's only confirmed content is a Limited
      Business License row; the verifier established that its licensee is
      Levy Premium Foodservice rather than the club, so the record could not
      say what the shop sells and publishing the name alone would imply the
      affiliation the verifier refuted.

    * **Strange Cargo does not ship in any form.** The licence register shows
      the business moved from 3448 N Clark to 5216 N Clark, ZIP 60640, which
      is outside Wrigleyville's sourced boundaries. It is not to be restored
      to this corpus by a later wave.

    * **Names come from a source, not from the finder's proposal.** Where only
      the City of Chicago licence register carries a name, that is the name
      used: "Bernie's" rather than "Bernie's Tap & Grill", "Sluggers" rather
      than "Sluggers World Class Sports Bar & Grill" — the latter also keeps
      an unsourced superlative out of a heading and a URL.

    * **Architectural style is published only in a source's own words**, and
      only where a source states one: the Music Box's interior style
      ("atmospheric", with the Chicago Tribune's 1983 description carried
      under its attribution) and Alta Vista Terrace's style field. Metro's
      building and the Vic's are given no style, because none is sourced.

    * **Five places are `uncertain` on trading status** — Nisei Lounge,
      Merkle's, Clark Street Sports, the Vic Theatre, and the dropped Park at
      Wrigley. Uncertain is not closed: no closure has positive evidence and
      none is asserted. Their records state what they are and where they are,
      and say nothing about whether they are trading now. They carry the
      schema's default status of "open" because the only alternative the
      schema offers is "closed", which would be a claim the research refutes.

    * **Three ZIP codes are the verifier's, not the finder's**: Sluggers,
      Merkle's and Nisei Lounge are 60657. The Music Box is 60613 while
      Southport Grocery, ten blocks south on the same street, is 60657; that
      is not an error and must not be normalised.

    * No trip duration or drive time appears anywhere. Distances are given as
      the source gives them — a mileage, a street, a direction.

  Boundary language is hedged wherever the research hedged it. Wrigleyville's
  sourced borders run Grace Street (3800 N) to Cornelia Avenue (3500 N) north
  to south; Alta Vista Terrace sits at that northern edge and Graceland
  Cemetery beyond it, and neither is placed inside the neighbourhood here.
  """

  alias Ethos.Places

  @chicago %{town: "Chicago", state: "Illinois", county: "Cook County"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    wrigley_field()
  end

  defp wrigley_field do
    [
      Map.merge(@chicago, %{
        slug: "wrigley-field",
        name: "Wrigley Field",
        kind: "stadium",
        address: "1060 West Addison Street, Chicago, IL 60613",
        official_url: nil,
        summary:
          "The home ballpark of the Chicago Cubs, at 1060 West Addison Street in the Wrigleyville neighborhood of the Lake View community area on Chicago's North Side. It opened on April 23, 1914 as Weeghman Park, built for Charles Weeghman's Chicago Whales of the Federal League and designed by Zachary Taylor Davis. Capacity is 41,649.",
        history:
          "The Whales played here in 1914 and 1915, coming second in the Federal League in 1914 and winning the championship in 1915; the Cubs moved in from the West Side Grounds before the 1916 season. The park was named Cubs Park from 1920 to 1926, before changing its name to Wrigley Field in 1927. It follows the jewel-box ballpark design that was popular in the early part of the 20th century. It is the oldest park in the National League, the second-oldest in the majors after Fenway Park (1912), and the only remaining Federal League park. Bill Veeck planted the ivy against the outfield walls in 1937, the year the scoreboard was installed; the scoreboard is still worked by hand, and a number turner watches the score changes on a computer and updates the scoreboard by manually replacing the numbers from within the scoreboard. The art deco-style marquee over the main entrance was installed in 1934, was originally green, and was repainted red on March 23, 1960; it reads \"Wrigley Field, Home of Chicago Cubs\" in white. This was the last Major League Baseball park to have lights installed: they were lit on August 8, 1988, after 5,687 consecutive Cubs day games. The ballpark was designated a Chicago Landmark on February 1, 2004, and a National Historic Landmark and a National Register listing on September 23, 2020. The $575-million privately funded 1060 Project was revealed at the January 2013 Cubs Convention and began its first phase on September 29, 2014; the ivy-covered walls in the left and right field corners were cut from 15 to 11 feet before the 2015 season.",
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "billy-goat-tavern-wrigleyville",
        name: "Billy Goat Tavern & Grill (Wrigleyville)",
        kind: "restaurant",
        address: "3724-3726 North Clark Street, Chicago, IL 60613",
        official_url: "https://www.billygoattavern.com/",
        summary:
          "The Wrigleyville branch of the Billy Goat Tavern & Grill, which the chain's own locations page gives at 3724-3726 N. Clark Street. The chain's Wikipedia article lists eight locations and this is not among them, so the two sources disagree on the chain's footprint; no source reached gives the year this branch opened, or its menu or hours.",
        history:
          "The chain's history belongs to its original Madison Street tavern rather than to this address. William \"Billy Goat\" Sianis bought the Lincoln Tavern at 1855 W. Madison St. in 1934, and in 1964 that tavern moved to 430 N. Michigan Ave., which is actually below Michigan Avenue. Sianis brought his pet goat to Game 4 of the 1945 World Series at Wrigley Field against the Detroit Tigers. The \"cheezborger\" order was originally popularized by John Belushi in the Saturday Night Live \"Olympia Cafe\" sketch, which was inspired by the tavern.",
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "metro-chicago",
        name: "Metro",
        kind: "theater",
        address: "3730 North Clark Street, Chicago, IL 60613",
        official_url: nil,
        summary:
          "A music venue at 3730 N Clark Street, founded by Joe Shanahan and first opened in 1982, with a capacity of 1,100 across the main floor and balcony. The building also houses Smart Bar, which opened in July 1982 as a dance club, was initially on the fourth floor, and later moved to the basement beneath the main venue; Smart Bar holds 400.",
        history:
          "The building was built in 1927 as a Swedish Community Center. It ran as Stages Music Hall from 1979 to 1982 and as Cabaret Metro from 1982 to 1992. Acts who have played there include Nirvana, Soundgarden, Mudhoney, Jane's Addiction, Hole, Oasis, Smashing Pumpkins and Liz Phair.",
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "gman-tavern",
        name: "Gman Tavern",
        kind: "restaurant",
        address: "3740 North Clark Street, Chicago, IL 60613",
        official_url: "https://www.gmantavern.com/",
        summary:
          "A bar at 3740 N Clark St. with a rotating draft list and a vinyl collection. Its stated hours are Monday to Friday from 3pm and Saturday and Sunday from noon, and it states that it opens two hours before every Cubs home game start and during all Metro shows. Its happy hour — stated as weekdays 3pm to 6pm, and excluded on Cubs home games — lists discounted draft and well drinks, Malort shots and a \"Chicago Handshake\". Its own site carries no founding year and states no ownership relationship to Metro next door.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "murphys-bleachers",
        name: "Murphy's Bleachers",
        kind: "restaurant",
        address: "3655 North Sheffield Avenue, Chicago, IL 60613",
        official_url: "https://murphysbleachers.com/",
        summary:
          "A bar at 3655 North Sheffield serving local craft beers and pub food, with stated hours of Sunday to Friday 11am to 2am and Saturday 11am to 3am, and a recurring Pub Trivia Night except on home game days. Murphy Rooftop Company holds a City of Chicago licence of the type \"Wrigley Field\" at 3649 N Sheffield Avenue. The bar's account of its own origins as Ernie's Bleachers, and of a first rooftop opened in 1984, is unverified and is not published here.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "the-cubby-bear",
        name: "The Cubby Bear",
        kind: "restaurant",
        address: "1059-1065 West Addison Street, Chicago, IL 60613",
        official_url: "https://www.cubbybear.com/",
        summary:
          "A bar at 1059-1065 West Addison Street. Wikipedia's Lake View article names it among the establishments near the Clark and Addison intersection that host the Cubs crowds, alongside Sluggers, Murphy's Bleachers, Casey Moran's, Merkle's and Sports Corner. The licensed entity of record is Cubby Bear Lounge Ltd, holding Tavern, Public Place of Amusement, Retail Food Establishment and Food - Shared Kitchen - Supplemental licences. Those are the two facts the research reached: cubbybear.com refused every fetch, so nothing about the bar's founding, menu, music programming or hours is published here.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "sluggers-chicago",
        name: "Sluggers",
        kind: "restaurant",
        address: "3540 North Clark Street, Chicago, IL 60657",
        official_url: "https://www.sluggersbar.com/",
        summary:
          "A sports bar and grill at 3540 North Clark Street, serving wings, burgers, pizza, salads and appetizers with a full bar. Its second level holds batting cages, electronic basketball, skee-ball, air hockey, and arcade and virtual driving games, and the venue has over 40 TVs including six 10-foot screens. Stated hours are Monday to Thursday 3pm to 2am, Friday 11am to 2am, Saturday 11am to 3am and Sunday 11am to 2am, with Cubs home game hours subject to change. The City of Chicago licence register carries the bar as Sluggers and the kitchen as Sluggers Grill.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "yakzies-bar-and-grill",
        name: "Yakzie's Bar & Grill",
        kind: "restaurant",
        address: "3710 North Clark Street, Chicago, IL 60613",
        official_url: "https://www.yakzies.com/",
        summary:
          "A bar and grill at 3710 N Clark St. Its menu includes wings, burgers, sandwiches, cheese curds and an Italian beef sandwich. Stated hours are Monday to Saturday 11:00 AM to 12:00 AM and Sunday 1:00 PM to 12:00 AM, and it states that it opens for every Cubs game.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "smoke-daddy-wrigleyville",
        name: "Smoke Daddy (Wrigleyville)",
        kind: "restaurant",
        address: "3636 North Clark Street, Chicago, IL 60613",
        official_url: "https://www.thesmokedaddy.com/",
        summary:
          "The Wrigleyville location of Smoke Daddy, a barbecue restaurant with two branches — Wicker Park and this one at 3636 North Clark Street. It uses the tagline \"BBQ, Blues, Beers\" and sells its own sauces and rubs. No source reached states whether live blues is programmed at this branch; the tagline is not a schedule.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "mordecai-wrigleyville",
        name: "Mordecai",
        kind: "restaurant",
        address: "3632 North Clark Street, Chicago, IL 60613",
        official_url: "https://www.mordecaichicago.com/",
        summary:
          "An American bistro at 3632 N. Clark Street, across from the ballpark, serving classic dishes and wine. The licensee of record at that address is registered under the name Mordecai Brown, which is also the name of a Cubs pitcher; no source reached states that the bar is named after him, and the connection is not published here.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "hotel-zachary",
        name: "Hotel Zachary",
        kind: "hotel",
        address: "3630 North Clark Street, Chicago, IL 60613",
        official_url: "https://www.hotelzachary.com/",
        summary:
          "A hotel at 3630 North Clark Street, just across Clark Street from Wrigley Field, constructed along the west side of the street as part of the Wrigley Field renovation project. It was open for business in time for the Cubs' first home game on April 9, 2018. No source reached gives its room count, its architect, who it is named after, its brand affiliation, or which restaurants and bars it houses.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "guthries-tavern",
        name: "Guthries Tavern",
        kind: "restaurant",
        address: "1300 West Addison Street, Chicago, IL 60613",
        official_url: "https://www.guthriestavern.com/",
        summary:
          "A tavern at 1300 W Addison keeping a large collection of board games, with craft cocktails, draft and bottled beer, wine, cider and hard seltzer, and food including pizza, soft pretzels, potato chips and cheese flights. Stated hours are Monday to Friday 3 PM to 2 AM, Saturday 11 AM to 3 AM and Sunday 11 AM to 2 AM, and it runs a Thursday Jeopardy! league, Tuesday trivia, and euchre leagues. The tavern's account of the building's earlier life as a corner grocery and a Prohibition-era tap is its own and is not independently sourced, so no founding date is published here.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "bernies-chicago",
        name: "Bernie's",
        kind: "restaurant",
        address: "3664 North Clark Street, Chicago, IL 60613",
        official_url: nil,
        summary:
          "A bar at 3664 North Clark Street. The City of Chicago licence register carries it as Bernie's, holding Tavern, Outdoor Patio, Retail Food Establishment and Public Place of Amusement licences. That register entry is the only source the research reached: berniestap.com does not resolve, so the bar's fuller trading name, founding year, menu and hours are not published here.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "nisei-lounge",
        name: "Nisei Lounge",
        kind: "restaurant",
        address: "3439 North Sheffield Avenue, Chicago, IL 60657",
        official_url: nil,
        summary:
          "A bar at 3439 North Sheffield Avenue, carried on the City of Chicago licence register with Tavern and Outdoor Patio licences. That register entry is the only source the research reached: niseilounge.com does not resolve, and the bar's founding year, its history and the origin of its name are not published here.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "merkles-bar-and-grill",
        name: "Merkle's Bar & Grill",
        kind: "restaurant",
        address: "3516 North Clark Street, Chicago, IL 60657",
        official_url: nil,
        summary:
          "A bar and grill at 3516 North Clark Street, carried on the City of Chicago licence register with Public Place of Amusement, Retail Food Establishment and Consumption on Premises licences. Wikipedia's Lake View article names Merkle's among the establishments near the Clark and Addison intersection that host the Cubs crowds; that sentence carries no date. Its menu, hours, founding year and namesake are not published here — merklesbarandgrill.com refused every fetch.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "clark-street-sports-wrigleyville",
        name: "Clark Street Sports (Wrigleyville)",
        kind: "shop",
        address: "3650 North Clark Street, Chicago, IL 60613",
        official_url: "https://www.clarkstreetsports.com/",
        summary:
          "A storefront at 3650 North Clark Street, carried on the City of Chicago licence register as Clark Street Sports. The company describes itself as a locally owned Chicago sports apparel retailer with more than 10 locations across Chicagoland, selling apparel, shirts, hats, jerseys, accessories, souvenirs, gifts and pet merchandise for the Cubs, White Sox, Blackhawks, Bulls and Bears. Its own site lists no store addresses, so the licence register is the only thing tying the company to this storefront.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "music-box-theatre-chicago",
        name: "Music Box Theatre",
        kind: "theater",
        address: "3733 North Southport Avenue, Chicago, IL 60613",
        official_url: nil,
        summary:
          "A cinema at 3733 N. Southport Ave, opened on August 22, 1929 with a seating capacity of 750. Its seated capacity is now 748, and a second screen holds 75. It shows first-run features, repertory films, weekend matinees, midnight cult films, and foreign and independent film, and has been independently owned and operated by the Southport Music Box Corporation since 2003.",
        history:
          "Edward Steinborn and Louis I. Simon are credited as the original architects. The interior style is atmospheric; writing in the Chicago Tribune in 1983, Paul Gapp called it \"an eclectic melange of Italian, Spanish and Pardon-My-Fantasy put together with passion.\" The first theatre organ, an Allen three manual electronic, was installed in the previously empty organ chambers in 1984. Annual traditions include holiday screenings of White Christmas and It's A Wonderful Life, a 24-hour horror movie film festival in October, a 70mm festival, and yearly screenings of 2001: A Space Odyssey.",
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "southport-grocery-and-cafe",
        name: "Southport Grocery & Cafe",
        kind: "cafe",
        address: "3552 North Southport Avenue, Chicago, IL 60657",
        official_url: "https://www.southportgrocery.com/",
        summary:
          "A cafe and specialty grocery at 3552 N Southport, serving breakfast and lunch alongside house-made preserves, pickles and mustards and artisanal local products. Stated hours are every day 8 AM to 3 PM, with the kitchen closing 30 minutes prior. Its own site gives no founding year. Its ZIP is 60657, ten blocks south of the Music Box on the same street, which is 60613.",
        history: nil,
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "the-vic-theatre",
        name: "The Vic Theatre",
        kind: "theater",
        address: "3145 North Sheffield Avenue, Chicago, IL 60657",
        official_url: nil,
        summary:
          "A theatre at 3145 N. Sheffield Ave, opened in 1912 as the Victoria Theatre and designed by the architect John Eberson, who built it as what Wikipedia calls \"a luxurious five-story Vaudeville house\". The article records it as a music venue owned by Jam Productions that can accommodate 1,400 people, or 1,000 seated. No source reached places the theatre relative to Wrigley Field, and none is claimed here: Wrigleyville's sourced southern boundary is Cornelia Avenue, which is north of 3145 N.",
        history:
          "In the mid-1990s, Brew & View was established at the Vic, offering movies and drinks on non-concert nights. The source for that is past tense and dated to the mid-1990s, and no source reached states whether it still runs.",
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "alta-vista-terrace-district",
        name: "Alta Vista Terrace District",
        kind: "historic-site",
        address:
          "North Alta Vista Terrace, between Grace Street and Byron Street, Chicago, IL 60613",
        official_url: nil,
        summary:
          "A one-block street in Lake View at 1050 West on the Chicago street grid, running north from Grace Street (3800 North) to Byron Street (3900 North). It contains 40 small, single-family rowhouses. Grace Street is Wrigleyville's sourced northern boundary, which puts the district at or just beyond that edge. The houses are private residences and no source states that any of them is open to visitors.",
        history:
          "The rowhouses were built in 1904 by the real estate developer Samuel Gross, who was inspired by the row houses of London after a trip to Europe. There are twenty exterior designs, arranged so that matching houses face diagonally across the street. The district's style is given as \"Late 19th And 20th Century Revivals\", and the record names Doric and Ionic wood pilasters, Gothic arches, Palladian windows, stained and leaded-glass fanlights, and bay and bow windows. It was designated a Chicago Landmark on September 15, 1971 and added to the National Register of Historic Places on March 16, 1972, reference number 72000448.",
        photos: []
      }),
      Map.merge(@chicago, %{
        slug: "graceland-cemetery-chicago",
        name: "Graceland Cemetery",
        kind: "historic-site",
        address: "4001 North Clark Street, Chicago, IL 60613",
        official_url: nil,
        summary:
          "A cemetery at 4001 N. Clark Street covering 121 acres, founded in 1860 by Thomas Barbour Bryan; the first burial came in April 1860, when Bryan's son Daniel was reinterred. It stands north of Grace Street (3800 North), which is Wrigleyville's sourced northern boundary, so it lies beyond that edge. No source reached gives visiting hours or states whether the cemetery is open to the public without appointment.",
        history:
          "Swain Nelson created the original layout, of 80 acres. Horace Cleveland designed curving paths, open vistas and a small lake in 1870, and Ossian Cole Simonds was landscape architect from 1879 and later superintendent until 1897. Monuments include the Getty Tomb and the Martin Ryerson Mausoleum by Louis Sullivan, who is buried here; the Schoenhofen Pyramid Mausoleum; Eternal Silence and The Crusader by Lorado Taft; and the Marshall Field memorial by Henry Bacon with sculpture by Daniel Chester French. Those buried here include Daniel Burnham, George Pullman and Ernie Banks. Graceland Cemetery was added to the National Register of Historic Places on January 18, 2001.",
        photos: []
      })
    ]
  end
end
