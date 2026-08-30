defmodule Ethos.Seeds.GreatAmericanBallParkPlaces do
  @moduledoc """
  Seeds the places for the Great American Ball Park guide. Idempotent:
  `upsert_all!/0` upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Cincinnati Reds research artifact, or the text a verdict's
  correction names as publishable. A verdict vouches only for what its own
  `item` text restates, not for every clause of the sentence the finder wrote
  around it. `docs/ballparks/great-american-ball-park.md` quotes each published
  sentence against the verdict it rests on, and records every omission.

  What the verification changed, and what is therefore absent here:

    * **Two sponsorship renames, both taken from the verdict.** The streetcar
      is the **Connector**, not the Cincinnati Bell Connector — the system was
      renamed in 2022 when Cincinnati Bell rebranded to Altafiber, and the
      verifier refuted every item that carried the stale name. The brewpub at
      115 Joe Nuxhall Way is the **Cincinnati Lager House**, the name The Banks'
      2026 directory gives it, even though the landlord's own page URL still
      reads `moerlein-lager-house`. Both names come from the verdict.

    * **No Banks-directory listing for Heritage Bank Center.** The finder's
      citation was refuted: a targeted re-fetch of the directory found no
      mention of the arena, the Cyclones or any arena at all. The correction
      names what is confirmed instead — the Connector's own article lists
      Heritage Bank Center among the venues served by The Banks station — and
      that is what ships. This is the failure class wave 1 met in Baltimore: a
      plausible claim attached to a URL that does not contain it.

    * **No opening season for Smale Riverfront Park's first phase.** That
      verdict is `uncertain`. Confirmed on re-fetch: "over 40 acres" and the
      Broadway-to-Central-Avenue extent. Not confirmed: "Phase I opened in
      spring 2011" — the only nearby date in the article reads "summer of
      2011" and is tied to The Banks development rather than to the park.

    * **No street number for the Reds Hall of Fame and Museum.** Its
      `could_not_establish` names the exact street address as unresolved. The
      street itself is established by a confirmed verdict — it "sits on Main
      Street next to Great American Ball Park" — so the record publishes the
      street and says plainly that the number is unknown, rather than inferring
      one.

  Every place here has a `confirmed` trading status, several of them upgraded
  by the verifier on evidence the finder had not reached. Where a status rests
  on The Banks' landlord directory, the record says so.
  """

  alias Ethos.Places

  @cincinnati %{town: "Cincinnati", state: "Ohio", county: "Hamilton County"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@cincinnati, %{
        slug: "great-american-ball-park",
        name: "Great American Ball Park",
        kind: "stadium",
        address: "100 Joe Nuxhall Way, Cincinnati, OH",
        official_url: "https://www.mlb.com/reds/ballpark",
        summary:
          "The home of Major League Baseball's Cincinnati Reds, at 100 Joe Nuxhall Way. It opened on March 31, 2003, on the site adjacent to the former Riverfront Stadium. Seating capacity is 43,500 as of 2021, and the ballpark has 850 parking spaces. Crosley Terrace, a plaza at the ballpark, carries bronze statues of the Crosley Field-era players Joe Nuxhall, Ernie Lombardi, Ted Kluszewski and Frank Robinson.",
        history:
          "The ballpark replaced Riverfront Stadium, later Cinergy Field, which the Reds and the Bengals had shared before the two clubs sought separate venues. HOK Sport, now Populous, and GBBN built it at a cost of approximately $290 million.",
        photos: []
      }),
      Map.merge(@cincinnati, %{
        slug: "cincinnati-reds-hall-of-fame-and-museum",
        name: "Cincinnati Reds Hall of Fame and Museum",
        kind: "museum",
        address: "Main Street, Cincinnati, OH",
        official_url: nil,
        summary:
          "A museum that opened on September 25, 2004 and sits on Main Street next to Great American Ball Park. It contains more than 15,000 square feet of exhibit space on two floors, showcasing World Series trophies from 1975, 1976 and 1990, the scorebook from the 1869 Cincinnati Red Stockings, and MVP trophies belonging to Johnny Bench and Joe Morgan. Its exact street number could not be established from any source fetched for this research, and neither could its current hours.",
        history: nil,
        photos: []
      }),
      Map.merge(@cincinnati, %{
        slug: "national-underground-railroad-freedom-center",
        name: "National Underground Railroad Freedom Center",
        kind: "museum",
        address: "50 E. Freedom Way, Cincinnati, OH 45202",
        official_url: nil,
        summary:
          "A museum dedicated to the history of the Underground Railroad and the abolition of slavery. It opened to the public on August 3, 2004, with official ceremonies on August 23, 2004. Exhibits include the \"Suite for Freedom\" theater, the \"ESCAPE! Freedom Seekers\" interactive display, the film \"Brothers of the Borderland\", the John Parker Library and a quilt titled \"Crossing to Freedom\". The museum is sited at The Banks on the Cincinnati riverfront, referencing the Ohio River's role as an Underground Railroad crossing point, and The Banks development directory lists it as a current attraction.",
        history: nil,
        photos: []
      }),
      Map.merge(@cincinnati, %{
        slug: "smale-riverfront-park",
        name: "Smale Riverfront Park",
        kind: "park",
        address: "Along the Ohio River between Broadway and Central Avenue, Cincinnati, OH",
        official_url: nil,
        summary:
          "A park spanning over 40 acres along the Ohio River between Broadway and Central Avenue. Its features include bike trails, boat docks, a carousel, gardens, grand stairs, a great lawn, playgrounds, a river's edge promenade with oversized \"porch\" swings, tree groves, walkways and water features of jets, cascades, pools and waterfalls. It connects Bicentennial Commons and Sawyer Point to form an almost 3-mile corridor of public park along the river, and The Banks development directory lists it as a current attraction.",
        history:
          "The park contains a historical marker indicating the position of home plate of the former Riverfront Stadium.",
        photos: []
      }),
      Map.merge(@cincinnati, %{
        slug: "findlay-market",
        name: "Findlay Market",
        kind: "historic-site",
        address: "1801 Race Street, Cincinnati, OH 45202",
        official_url: "https://www.findlaymarket.org/",
        summary:
          "Ohio's oldest continuously operated public market, built in 1852 using early iron-framework construction technique. It is the last remaining of nine public markets that once served Cincinnati, and it stands in the Over-the-Rhine neighborhood north of downtown. The market's own site gives published hours of Tuesday to Friday 9am to 6pm, Saturday 8am to 6pm and Sunday 10am to 4pm, closed Monday, and a weekend farmers market also operates; those hours are sourced to the market itself and no independent confirmation of them for 2026 was reached.",
        history:
          "Findlay Market was listed on the National Register of Historic Places on June 5, 1972, reference number 72001020. The Connector streetcar loop, known as the Cincinnati Bell Connector until a 2022 rebrand, runs from The Banks and Great American Ball Park north to Findlay Market.",
        photos: []
      }),
      Map.merge(@cincinnati, %{
        slug: "cincinnati-lager-house",
        name: "Cincinnati Lager House",
        kind: "brewery",
        address: "115 Joe Nuxhall Way, Cincinnati, OH 45202",
        official_url: "https://thebankscincy.com/attractions/moerlein-lager-house/",
        summary:
          "A working microbrewery at The Banks producing a full line of Moerlein craft beers, with food described as reminiscent of Cincinnati's 19th-century beer gardens. The Banks' 2026 directory and tenant page name it the Cincinnati Lager House, although the tenant page's URL still carries the older name \"moerlein-lager-house\"; it was previously known as the Christian Moerlein Lager House and as the Moerlein Lager House. The exact date of the rename could not be established.",
        history:
          "The Christian Moerlein Lager House opened at The Banks development in February 2012: a 15,000-square-foot, two-story establishment with a functioning microbrewery, a restaurant serving 19th-century German cuisine, and beer gardens seating about 500 indoors and 600 outdoors. The Christian Moerlein Brewing Company itself was founded in 1853 in Cincinnati's Over-the-Rhine neighborhood by the Bavarian immigrant Christian Moerlein, grew into one of the country's ten largest breweries, and closed in 1919 under Prohibition before being revived as a brand in 1981 and relaunched under new ownership in 2004.",
        photos: []
      }),
      Map.merge(@cincinnati, %{
        slug: "holy-grail-banks-cincinnati",
        name: "Holy Grail",
        kind: "restaurant",
        address: "161 Joe Nuxhall Way, Cincinnati, OH 45202",
        official_url: "https://thebankscincy.com/attractions/holy-grail/",
        summary:
          "A sports bar at The Banks with 31 hi-def TVs, pub fare and outdoor patios. The Banks' directory lists it as a current tenant, and its tenant page gives hours of Monday to Sunday, 11am to 2:30am. Its founding date could not be established, and no confirmation of current trading independent of the landlord's own directory was reached.",
        history: nil,
        photos: []
      }),
      Map.merge(@cincinnati, %{
        slug: "taste-of-belgium-banks",
        name: "Taste of Belgium",
        kind: "restaurant",
        address: "16 W. Freedom Way, Cincinnati, OH 45202",
        official_url: "https://thebankscincy.com/attractions/taste-of-belgium/",
        summary:
          "A scratch kitchen at The Banks known for its Liege waffle and chicken, specializing in Belgian food with American influences and craft beer. The Banks' tenant page states that the restaurant was featured on Food Network's Diners, Drive-Ins and Dives and received a \"Best Brunch 2016\" award from CityBeat Magazine; both claims are sourced to that page rather than to Food Network or CityBeat directly, and neither was confirmed at its primary source.",
        history: nil,
        photos: []
      }),
      Map.merge(@cincinnati, %{
        slug: "heritage-bank-center",
        name: "Heritage Bank Center",
        kind: "attraction",
        address: "100 Broadway Street, Cincinnati, OH",
        official_url: nil,
        summary:
          "An indoor arena in downtown Cincinnati, next to Great American Ball Park, that opened on September 9, 1975. It has carried five names in that time: Riverfront Coliseum, The Crown, Firstar Center, U.S. Bank Arena and Heritage Bank Center. It seats 17,556 and is the largest indoor arena in the Greater Cincinnati region at 346,100 square feet. It is the home arena of the Cincinnati Cyclones of the ECHL and also hosts college basketball, concerts, wrestling, MMA and figure skating events. The Connector streetcar's route lists it among the venues served by The Banks station.",
        history: nil,
        photos: []
      }),
      Map.merge(@cincinnati, %{
        slug: "john-a-roebling-suspension-bridge",
        name: "John A. Roebling Suspension Bridge",
        kind: "historic-site",
        address: "Spans the Ohio River between Cincinnati, OH and Covington, KY",
        official_url: nil,
        summary:
          "A suspension bridge designed and built by John A. Roebling, spanning the Ohio River between Cincinnati, Ohio and Covington, Kentucky. It opened to traffic on January 1, 1867 and was, at the time, the longest suspension bridge in the world, at a 1,057-foot main span. Pedestrians use the bridge to reach hotels, bars and restaurants in Northern Kentucky; the bar and restaurant district at the bridge's Kentucky end is called Roebling Point.",
        history: nil,
        photos: []
      })
    ]
  end
end
