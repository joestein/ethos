defmodule Ethos.Seeds.ConnecticutPlaces do
  @moduledoc """
  Seeds the 50 verified Connecticut places for the five-town guides
  (Waterbury, Middlebury, Danbury, Southbury, Woodbury). Idempotent:
  `upsert_all!/0` upserts by slug. All facts verified against official
  sources in the 2026-08 research passes; photos are Wikimedia Commons
  free-license images with attribution.
  """

  alias Ethos.Places

  @waterbury %{town: "Waterbury", state: "Connecticut", county: "New Haven County"}
  @middlebury %{town: "Middlebury", state: "Connecticut", county: "New Haven County"}
  @danbury %{town: "Danbury", state: "Connecticut", county: "Fairfield County"}
  @southbury %{town: "Southbury", state: "Connecticut", county: "New Haven County"}
  @woodbury %{town: "Woodbury", state: "Connecticut", county: "Litchfield County"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    waterbury() ++ middlebury() ++ danbury() ++ southbury() ++ woodbury()
  end

  defp photo(town, label, title, description, author, license, source_url) do
    %{
      "src" => "/photos/ct/#{town}/#{label}.jpg",
      "thumb" => "/photos/ct/#{town}/#{label}_thumb.jpg",
      "title" => title,
      "description" => description,
      "author" => author,
      "license" => license,
      "source_url" => source_url
    }
  end

  defp waterbury do
    [
      Map.merge(@waterbury, %{
        slug: "palace-theater-waterbury",
        name: "Palace Theater",
        kind: "theater",
        address: "100 East Main Street, Waterbury, CT 06702",
        official_url: "https://palacetheaterct.org/",
        summary:
          "A grand movie palace on East Main Street, opened in 1922 for theater magnate Sylvester Poli and reopened in 2004 after a $30 million restoration. Today it hosts touring Broadway series, comedy, and concerts.",
        history:
          "Designed by Thomas W. Lamb, the most celebrated theater architect of his era, the Palace is one of only two survivors of Poli's roughly thirty-theater northeastern empire. It went dark in 1987, reopened in 2004, and is listed on the National Register of Historic Places.",
        photos: [
          photo(
            "waterbury",
            "palace-theater",
            "Palace Theater facade",
            "The Palace Theater on East Main Street, Waterbury.",
            "Magicpiano",
            "CC BY-SA 4.0",
            "https://commons.wikimedia.org/wiki/File:WaterburyCT_PalaceTheater.jpg"
          ),
          photo(
            "waterbury",
            "palace-theater-marquee",
            "Palace Theater marquee",
            "The restored marquee of Waterbury's Palace Theater.",
            "Koskenart",
            "CC BY-SA 4.0",
            "https://commons.wikimedia.org/wiki/File:PalaceTheater-WaterburyCT-1.jpg"
          )
        ]
      }),
      Map.merge(@waterbury, %{
        slug: "mattatuck-museum",
        name: "Mattatuck Museum",
        kind: "museum",
        address: "144 West Main Street, Waterbury, CT 06702",
        official_url: "https://www.mattmuseum.org/",
        summary:
          "Waterbury's art and history museum on the Green, founded in 1877 as the Mattatuck Historical Society. It pairs American art with the industrial story of the Naugatuck Valley — including the Waterbury Button Museum's collection of more than 10,000 buttons. Open Tue-Sat 11-5, Sun 11-4.",
        history:
          "The museum keeps the Brass City's story: by 1840 America's entire brass industry was concentrated in the Naugatuck Valley around Waterbury. The Button Museum collection was donated in 1999 by the Waterbury Button Company, which has made buttons since 1812.",
        photos: [
          photo(
            "waterbury",
            "mattatuck-museum",
            "Mattatuck Museum",
            "The Mattatuck Museum's modern exterior on West Main Street.",
            "DavidMacharelli",
            "CC BY-SA 4.0",
            "https://commons.wikimedia.org/wiki/File:Mattatuck_Museum_Exterior.jpg"
          ),
          photo(
            "waterbury",
            "mattatuck-museum-front",
            "Mattatuck Museum entrance",
            "Front exterior of the Mattatuck Museum.",
            "Jllm06",
            "CC BY-SA 4.0",
            "https://commons.wikimedia.org/wiki/File:Mattatuck_Museum_1_-_front_exterior.JPG"
          )
        ]
      }),
      Map.merge(@waterbury, %{
        slug: "seven-angels-theatre",
        name: "Seven Angels Theatre",
        kind: "theater",
        address: "1 Plank Road, Waterbury, CT 06705",
        official_url: "https://sevenangelstheatre.org/",
        summary:
          "Greater Waterbury's professional regional theatre, staging musical theatre, comedy, concerts, and educational programs with local and national talent.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "holy-land-usa",
        name: "Holy Land USA",
        kind: "historic-site",
        address: "Slocum Street, Waterbury, CT",
        summary:
          "An 18-acre hillside park of miniature Bethlehem and Jerusalem replicas crowned by a 65-foot illuminated cross visible from I-84. Built as a Catholic theme park, it closed in 1984, was revived by new owners, and reopened to visitors in 2014 during daylight hours.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "waterbury-union-station",
        name: "Waterbury Union Station",
        kind: "historic-site",
        address: "Meadow Street, Waterbury, CT",
        summary:
          "Waterbury's Union Station opened in 1909; its clock tower is the city's signature landmark and a favorite photo stop on any downtown walk.",
        photos: [
          photo(
            "waterbury",
            "union-station-tower",
            "Union Station clock tower",
            "The clock tower of Waterbury Union Station.",
            "Hallettx",
            "CC BY-SA 4.0",
            "https://commons.wikimedia.org/wiki/File:Waterbury_Union_Station_Clock_Tower,_Waterbury_CT,_US.jpg"
          ),
          photo(
            "waterbury",
            "union-station-clock",
            "Clock tower detail",
            "Waterbury Union Station's clock tower seen from below.",
            "Daniel Case",
            "CC BY-SA 3.0",
            "https://commons.wikimedia.org/wiki/File:Clock_tower,_Waterbury_Union_Station.jpg"
          )
        ]
      }),
      Map.merge(@waterbury, %{
        slug: "waterbury-green",
        name: "Waterbury Green",
        kind: "park",
        address: "West Main Street, Waterbury, CT",
        summary:
          "The historic green at the heart of downtown, centered on the Welton Fountain — the natural starting point for a walking loop past the Palace Theater and the Mattatuck Museum.",
        photos: [
          photo(
            "waterbury",
            "waterbury-green-fountain",
            "Welton Fountain",
            "The Welton Fountain on the Waterbury Green.",
            "GrammarFascist",
            "CC BY-SA 4.0",
            "https://commons.wikimedia.org/wiki/File:Welton_Fountain_on_Waterbury_Green.jpg"
          )
        ]
      }),
      Map.merge(@waterbury, %{
        slug: "diorio-restaurant",
        name: "Diorio Restaurant & Bar",
        kind: "restaurant",
        address: "231 Bank Street, Waterbury, CT",
        official_url: "https://www.diorios.com/",
        summary:
          "A longstanding fine-dining fixture on Bank Street downtown — white-tablecloth Italian-American with a classic bar that opens at 4 PM Monday through Saturday, dinner from 5.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "brass-works-brewing",
        name: "Brass Works Brewing Company",
        kind: "brewery",
        address: "2066 Thomaston Avenue, Waterbury, CT 06704",
        official_url: "https://www.brassworksbrewing.com/",
        summary:
          "Waterbury's brewery, named for the city's brass heritage, pouring nine-plus house beers in a Thomaston Avenue taproom with rotating food trucks.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "sweet-marias-waterbury",
        name: "Sweet Maria's",
        kind: "cafe",
        address: "159 Manor Avenue, Waterbury, CT 06705",
        official_url: "https://sweet-marias.com/",
        summary:
          "A beloved Waterbury bakery on Manor Avenue known for cakes, cookies, cupcakes, and biscotti — the owner has published a shelf of branded cookbooks.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "nardellis-grinder-shoppe",
        name: "Nardelli's Grinder Shoppe",
        kind: "restaurant",
        address: "540 Plank Road, Waterbury, CT 06705",
        official_url: "https://www.nardellis.com/",
        summary:
          "A Waterbury institution founded in 1922 and family-owned for three generations — repeatedly voted among Connecticut's best grinders, with two locations in the city.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "frankies-hot-dogs-waterbury",
        name: "Frankie's Hot Dogs",
        kind: "restaurant",
        address: "700 Watertown Avenue, Waterbury, CT 06708",
        official_url: "https://www.frankieshotdogs.com/",
        summary:
          "A drive-in hot dog institution born in Waterbury in 1937 and still family-owned, with three locations around the city.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "courtyard-waterbury-downtown",
        name: "Courtyard by Marriott Waterbury Downtown",
        kind: "hotel",
        address: "63 Grand Street, Waterbury, CT",
        official_url:
          "https://www.marriott.com/en-us/hotels/hvncw-courtyard-waterbury-downtown/overview/",
        summary:
          "Downtown Waterbury's main full-service hotel, steps from the Palace Theater and the Green — the practical base for a Brass City weekend.",
        photos: []
      })
    ]
  end

  defp middlebury do
    [
      Map.merge(@middlebury, %{
        slug: "quassy-amusement-park",
        name: "Quassy Amusement Park & Splash Away Bay",
        kind: "amusement-park",
        address: "2132 Middlebury Road (Route 64), Middlebury, CT 06762",
        official_url: "https://www.quassy.com/",
        summary:
          "One of America's last family-owned lakeside amusement parks, on Lake Quassapaug since 1908 — 20-plus rides including the award-winning Wooden Warrior wooden coaster, plus the Splash Away Bay waterpark. Open seasonally, roughly April through October.",
        history:
          "Quassy began as a trolley park: the electric line that reached Lake Quassapaug in 1908 turned the lake into a summer resort with swimming, dancing, and a carousel. Three Waterbury businessmen bought the park in 1937. 'Quassapaug' derives from a Native American term for 'Big Pond,' and a 2026 index named Quassy the most affordable theme park in America.",
        photos: [
          photo(
            "middlebury",
            "quassy-sign",
            "Quassy entrance",
            "The entrance sign at Quassy Amusement Park.",
            "AskJoanne",
            "CC BY 3.0",
            "https://commons.wikimedia.org/wiki/File:Quassy.jpg"
          ),
          photo(
            "middlebury",
            "quassy-rides",
            "Quassy rides",
            "Rides at Quassy Amusement Park on Lake Quassapaug.",
            "Roller Coaster Philosophy",
            "CC BY 2.0",
            "https://commons.wikimedia.org/wiki/File:Quassy_Amusement_Park_-_48334465221.jpg"
          )
        ]
      }),
      Map.merge(@middlebury, %{
        slug: "middlebury-greenway",
        name: "Middlebury Greenway",
        kind: "park",
        address: "Along Route 64 between Woodside Avenue and Middlebury Road, Middlebury, CT",
        official_url: "https://www.traillink.com/trail/middlebury-greenway/",
        summary:
          "A paved 4.5-mile trail along Route 64 following the roadbed of the electric trolley line that carried summer crowds toward Lake Quassapaug from 1908 to 1930. Notably hilly, lined with stone benches, and it ends near Quassy's gates.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "middlebury-historical-society",
        name: "Middlebury Historical Society Museum",
        kind: "museum",
        address: "4 Library Road, Middlebury, CT 06762",
        official_url: "https://middleburyhistoricalsociety.org/",
        summary:
          "The town's history museum and research center in an 1897 two-room schoolhouse near the Green — a National Register building that served as Middlebury's public library from 1935 to 1972.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "vyne-restaurant",
        name: "Vyne Restaurant & Bar",
        kind: "restaurant",
        address: "1365 Whittemore Road, Middlebury, CT 06762",
        official_url: "https://www.vynerestaurant.com/",
        summary:
          "Middlebury's fine-dining room: contemporary American with locally sourced ingredients, built on a family restaurant legacy on this site dating to the 1940s.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "brewbury-kitchen-tap",
        name: "Brewbury Kitchen & Tap",
        kind: "brewery",
        address: "1383 Whittemore Road, Middlebury, CT 06762",
        official_url: "https://www.brewbury.com/",
        summary:
          "House brewery and taproom with ten-plus beers on draft, a full menu of pizza, burgers, and wings, an outdoor patio, and enough TVs for any game day.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "pies-and-pub",
        name: "Pies & Pub",
        kind: "restaurant",
        address: "1 Store Road, Middlebury, CT 06762",
        official_url: "https://www.piesandpub.com/",
        summary:
          "Hand-tossed pizza and wings with 26 rotating craft drafts — a casual local anchor just off the Green.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "kitchen-64",
        name: "Kitchen 64",
        kind: "cafe",
        address: "590 Middlebury Road, Middlebury, CT 06762",
        official_url: "https://thekitchen64.com/",
        summary:
          "The town's breakfast-and-brunch spot, open daily from 6:30 AM — eggs Benedict, French toast, and the Caprese panini are the local favorites.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "maggie-mcflys-middlebury",
        name: "Maggie McFly's",
        kind: "restaurant",
        address: "6 Woodside Avenue, Middlebury, CT 06762",
        official_url: "https://maggiemcflys.com/middlebury/",
        summary:
          "A Connecticut-grown American restaurant and bar known for one of the most extensive menus around.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "senor-panchos-middlebury",
        name: "Señor Pancho's of Middlebury",
        kind: "restaurant",
        address: "530 Middlebury Road, Middlebury, CT 06762",
        official_url: "https://senorpanchos.com/",
        summary:
          "Family-run Mexican — one of five locations of one of Connecticut's oldest family Mexican restaurant groups.",
        photos: []
      })
    ]
  end

  defp danbury do
    [
      Map.merge(@danbury, %{
        slug: "danbury-railway-museum",
        name: "Danbury Railway Museum",
        kind: "museum",
        address: "120 White Street, Danbury, CT 06810",
        official_url: "https://www.danburyrail.org/",
        summary:
          "A working railroad museum in the fully restored 1903 Danbury Union Station, with a rail yard of more than 60 pieces of historic equipment. Open weekends 10-4; admission $10 (ages 3+), with train rides spring through October plus Santa trains in December.",
        photos: [
          photo(
            "danbury",
            "railway-museum-entrance",
            "Danbury Railway Museum",
            "Main entrance of the Danbury Railway Museum in the 1903 Union Station.",
            "DanTD",
            "CC BY-SA 4.0",
            "https://commons.wikimedia.org/wiki/File:Danbury_Railway_Museum;_Main_Entrance.jpg"
          ),
          photo(
            "danbury",
            "railway-museum-acmu",
            "Vintage railcar",
            "A vintage ACMU railcar in the museum's rail yard.",
            "TriStateGuy",
            "CC BY 4.0",
            "https://commons.wikimedia.org/wiki/File:ACMU_at_Danbury_Railway_Museum.jpg"
          )
        ]
      }),
      Map.merge(@danbury, %{
        slug: "danbury-museum-historical-society",
        name: "Danbury Museum & Historical Society",
        kind: "museum",
        address: "43 Main Street, Danbury, CT 06810",
        official_url: "https://danburymuseum.org",
        summary:
          "A seven-building Main Street campus preserving Danbury's history — Huntington Hall's exhibits, the birthplace of composer Charles Ives, and the Marian Anderson Studio. Hat City's hatting story lives here. Tours Wednesday-Saturday.",
        history:
          "Danbury made America's hats. Zadoc Benedict pioneered felt hat-making here in the late 1700s; by 1809 the town had 56 hat shops, and by 1880 Danbury turned out roughly 4.5 million hats a year. The trade's dark side — mercury poisoning known as the 'Danbury Shakes' — helped drive workplace-safety reform, and Connecticut banned mercury in hat manufacturing on December 1, 1941.",
        photos: [
          photo(
            "danbury",
            "danbury-museum",
            "Danbury Museum",
            "Streetside view of the Danbury Museum & Historical Society campus.",
            "TulaneTim",
            "CC BY-SA 4.0",
            "https://commons.wikimedia.org/wiki/File:Danbury_Museum_Streetside_New.jpg"
          ),
          photo(
            "danbury",
            "john-rider-house",
            "John Rider House",
            "The John Rider House on the museum campus.",
            "Daniel Case",
            "CC BY-SA 3.0",
            "https://commons.wikimedia.org/wiki/File:John_Rider_House.jpg"
          ),
          photo(
            "danbury",
            "charles-ives-birthplace",
            "Charles Ives Birthplace",
            "Main entrance of the Charles Ives Birthplace.",
            "Danbury Museum",
            "CC BY-SA 4.0",
            "https://commons.wikimedia.org/wiki/File:Main_entrance,_Charles_Ives_Birthplace.jpg"
          )
        ]
      }),
      Map.merge(@danbury, %{
        slug: "tarrywile-park",
        name: "Tarrywile Park & Mansion",
        kind: "park",
        address: "70 Southern Boulevard, Danbury, CT 06810",
        official_url: "https://www.tarrywile.com/",
        summary:
          "A 722-acre public park with 21 miles of hiking trails, two ponds, and a lake, centered on the 1897 Shingle-style Tarrywile Mansion (National Register). Open daily dawn to dusk, free.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "palace-danbury",
        name: "The Palace Danbury",
        kind: "theater",
        address: "165 Main Street, Danbury, CT 06810",
        official_url: "https://thepalacedanbury.com",
        summary:
          "Downtown Danbury's historic Main Street theater, presenting music, comedy, theater, and film — including the Manhattan Short Film Festival and touring acts.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "stanziatos-wood-fired-pizza",
        name: "Stanziato's Wood Fired Pizza",
        kind: "restaurant",
        address: "35 Lake Avenue Ext, Danbury, CT 06811",
        official_url: "https://www.stanziatos.com/",
        summary:
          "Artisanal 12-inch pizzas out of an Italian wood-fired oven running 800-plus degrees, sourced from nine regional farms and producers.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "tks-american-cafe",
        name: "TK's American Cafe",
        kind: "restaurant",
        address: "255 White Street, Danbury, CT 06810",
        official_url: "https://www.tksamericancafe.com/",
        summary:
          "A White Street fixture since 1990 — 76 wing flavors (ranked among Connecticut's best), 50 beers, and the area's favorite sports-bar crown.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "chucks-steak-house-danbury",
        name: "Chuck's Steak House & Margarita Grill",
        kind: "restaurant",
        address: "20 Segar Street, Danbury, CT 06810",
        official_url: "https://www.chucksdanbury.com/",
        summary:
          "Hand-cut Midwestern steaks and an extensive salad bar; the Danbury location has been serving since 1973, with live music Tuesdays and Thursdays.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "charter-oak-brewing",
        name: "Charter Oak Brewing Co.",
        kind: "brewery",
        address: "39B Shelter Rock Road, Danbury, CT 06810",
        official_url: "https://charteroakbrewing.com/",
        summary:
          "Named Best Brewery and Taproom in Connecticut by Connecticut Magazine two years running, with ten rotating draft lines on Shelter Rock Road.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "hotel-zero-degrees-danbury",
        name: "Hotel Zero Degrees Danbury",
        kind: "hotel",
        address: "15 Milestone Road, Danbury, CT 06810",
        official_url: "https://www.hotelzerodegrees.com/",
        summary:
          "Danbury's boutique hotel option, with the Northern Italian Terra Danbury restaurant on site, a fitness center, and an outdoor patio with a fire pit.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "la-quinta-danbury",
        name: "La Quinta by Wyndham Danbury",
        kind: "hotel",
        address: "116 Newtown Road, Danbury, CT 06810",
        official_url:
          "https://www.wyndhamhotels.com/laquinta/danbury-connecticut/la-quinta-danbury/overview",
        summary:
          "Reliable mid-range base on Newtown Road: seasonal outdoor pool, 24/7 fitness center, EV charging, and free breakfast.",
        photos: []
      })
    ]
  end

  defp southbury do
    [
      Map.merge(@southbury, %{
        slug: "bent-of-the-river-audubon",
        name: "Bent of the River Audubon Center",
        kind: "park",
        address: "185 East Flat Hill Road, Southbury, CT 06488",
        official_url: "https://www.audubon.org/bent-river",
        summary:
          "A roughly 700-acre National Audubon Society sanctuary. Althea Clark bequeathed the Bent of the River farm to Audubon with instructions that it be used for education, and its trails opened to the public in the early 2000s.",
        photos: [
          photo(
            "southbury",
            "bent-of-the-river",
            "Bent of the River",
            "The Audubon Center at Bent of the River, Southbury.",
            "Karl Thomas Moore",
            "CC BY-SA 4.0",
            "https://commons.wikimedia.org/wiki/File:Audubon_Center_at_Bent_of_the_River_I.JPG"
          ),
          photo(
            "southbury",
            "bent-of-the-river-center",
            "Audubon center",
            "Buildings at the Bent of the River Audubon Center.",
            "Jllm06",
            "CC BY-SA 4.0",
            "https://commons.wikimedia.org/wiki/File:Audubon_Center_Bent_of_the_River_1.jpg"
          )
        ]
      }),
      Map.merge(@southbury, %{
        slug: "kettletown-state-park",
        name: "Kettletown State Park",
        kind: "park",
        address: "1400 Georges Hill Road, Southbury, CT 06488",
        official_url: "https://ctparks.com/node/73",
        summary:
          "A 605-acre state park on Lake Zoar with more than six miles of hiking trails. The name comes from local legend: early colonists traded one brass kettle to the Pootatuck people for the right to hunt and fish here. Day use is open; the campground is closed for the 2026 season after 2024 flood damage.",
        history:
          "The original village site vanished under water in 1919, when the Housatonic River was dammed to create Lake Zoar.",
        photos: [
          photo(
            "southbury",
            "kettletown-lake-zoar",
            "Lake Zoar",
            "Lake Zoar (the impounded Housatonic River) from Kettletown State Park.",
            "Jllm06",
            "CC BY-SA 4.0",
            "https://commons.wikimedia.org/wiki/File:Kettletown_State_Park_4_-_Lake_Zoar_(Housatonic_River).jpg"
          ),
          photo(
            "southbury",
            "kettletown-overlook",
            "Miller Trail overlook",
            "Lake Zoar from the Miller Trail overlook in Kettletown State Park.",
            "Morrowlong",
            "CC BY-SA 4.0",
            "https://commons.wikimedia.org/wiki/File:Kettletown_State_Park_Miller_Trail_Lake_Zoar_Overloop.jpg"
          )
        ]
      }),
      Map.merge(@southbury, %{
        slug: "southford-falls-state-park",
        name: "Southford Falls State Park",
        kind: "park",
        address: "175 Quaker Farms Road, Southbury, CT 06488",
        official_url: "https://ctparks.com/parks/southford-falls-state-park",
        summary:
          "A 169-acre park with a tiered waterfall, covered bridge, observation tower, and trout-stocked Paper Mill Pond — on the former site of the Diamond Match Company, a state park since 1932.",
        photos: []
      }),
      Map.merge(@southbury, %{
        slug: "old-town-hall-museum-southbury",
        name: "Old Town Hall Museum",
        kind: "museum",
        address: "624 South Britain Road, Southbury, CT 06488",
        official_url: "https://www.southburyhistory.org/",
        summary:
          "One of four historic properties kept by the Southbury Historical Society, anchoring the town's archives and collections in the village of South Britain.",
        photos: []
      }),
      Map.merge(@southbury, %{
        slug: "bullet-hill-school",
        name: "Bullet Hill School",
        kind: "historic-site",
        address: "215 Main Street North, Southbury, CT 06488",
        official_url: "https://www.southburyhistory.org/",
        summary:
          "A historic one-room schoolhouse maintained by the Southbury Historical Society and run as a living-museum program.",
        photos: []
      }),
      Map.merge(@southbury, %{
        slug: "maggie-mcflys-southbury",
        name: "Maggie McFly's",
        kind: "restaurant",
        address: "971 Main Street South, Southbury, CT 06488",
        official_url: "https://www.maggiemcflys.com/southbury/",
        summary:
          "The Southbury outpost of Connecticut's own big-menu craft eatery — the New England lobster roll and the fish fry are the orders.",
        photos: []
      }),
      Map.merge(@southbury, %{
        slug: "senor-panchos-southbury",
        name: "Señor Pancho's of Southbury",
        kind: "restaurant",
        address: "385 Main Street South, Southbury, CT 06488",
        official_url: "https://senorpanchos.com/",
        summary:
          "The founding 1989 location of the Señor Pancho's family — one of Connecticut's oldest family Mexican restaurant groups and a 'Best Burrito in Connecticut' winner.",
        photos: []
      }),
      Map.merge(@southbury, %{
        slug: "the-bevy-co",
        name: "The Bevy Co",
        kind: "restaurant",
        address: "22 Poverty Road, Southbury, CT 06488",
        official_url: "https://thebevy.co/",
        summary:
          "An NYC-inspired cocktail lounge with a full food menu — flavored espresso martinis and chicken bao buns are the signatures.",
        photos: []
      }),
      Map.merge(@southbury, %{
        slug: "raasa-indian-cuisine",
        name: "RaaSa Indian Cuisine",
        kind: "restaurant",
        address: "466 Heritage Road, Southbury, CT 06488",
        official_url: "https://raasact.com/",
        summary:
          "Family-owned Indian kitchen with near-perfect local ratings — lamb rogan josh, tandoori chicken, and tikka masala are the specialties. Closed Tuesdays.",
        photos: []
      }),
      Map.merge(@southbury, %{
        slug: "heritage-hotel-southbury",
        name: "Heritage Hotel, Golf & Conference Center",
        kind: "hotel",
        address: "522 Heritage Road, Southbury, CT 06488",
        official_url: "https://www.heritagesouthbury.com/",
        summary:
          "Southbury's full-service resort-style hotel: two saltwater pools, the Riverwalk Athletic Club, a spa, The Tavern restaurant, and the nine-hole Pomperaug golf course behind the hotel.",
        photos: []
      })
    ]
  end

  defp woodbury do
    [
      Map.merge(@woodbury, %{
        slug: "glebe-house-museum",
        name: "Glebe House Museum & Gertrude Jekyll Garden",
        kind: "museum",
        address: "49 Hollow Road, Woodbury, CT 06798",
        official_url: "https://glebehousemuseum.org",
        summary:
          "A c. 1740 gambrel-roofed minister's house known as the birthplace of the Episcopal Church in the United States — with the only Gertrude Jekyll-designed garden in America open to the public (self-guided, dawn to dusk, year-round).",
        history:
          "The house was first occupied by Woodbury's Anglican priest John Rutgers Marshall in 1771. Its grounds hold the sole publicly accessible U.S. garden designed by the great English garden designer Gertrude Jekyll.",
        photos: [
          photo(
            "woodbury",
            "glebe-house",
            "Glebe House",
            "The c. 1740 Glebe House in Woodbury.",
            "LisaHendricks",
            "CC BY-SA 3.0",
            "https://commons.wikimedia.org/wiki/File:GlebeHouse.png"
          )
        ]
      }),
      Map.merge(@woodbury, %{
        slug: "flanders-nature-center",
        name: "Flanders Nature Center & Land Trust",
        kind: "park",
        address: "596 Flanders Road, Woodbury, CT 06798",
        official_url: "https://flandersnaturecenter.org",
        summary:
          "A roughly 60-year-old nature center and land trust protecting more than 2,400 acres of conserved open space, laced with public hiking trails.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "hollow-park",
        name: "Hollow Park",
        kind: "park",
        address: "43 Hollow Road, Woodbury, CT 06798",
        summary:
          "Woodbury's town park on Hollow Road — covered pavilion, athletic fields, basketball, and sand volleyball — right next door to the Glebe House.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "orenaug-park",
        name: "Orenaug Park",
        kind: "park",
        address: "Park Road, Woodbury, CT 06798",
        summary: "A wooded town park off Park Road with a disc golf course.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "johns-cafe-woodbury",
        name: "John's Cafe",
        kind: "restaurant",
        address: "693 Main Street South, Woodbury, CT 06798",
        official_url: "https://www.johnscafe.com",
        summary:
          "Bistro-style New American with Mediterranean leanings in the heart of the antiques district — steaks, house-made pasta, and pizza; Mondays are BYOB with no corkage fee.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "market-place-kitchen-woodbury",
        name: "Market Place Kitchen & Bar",
        kind: "restaurant",
        address: "641 Main Street South, Woodbury, CT 06798",
        official_url: "https://marketplacekitchenbar.com/woodbury/",
        summary:
          "Farm-fresh American dining with locally sourced, seasonally changing menus; Sunday brunch runs 11:30 to 3.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "new-morning-market",
        name: "New Morning Market",
        kind: "cafe",
        address: "129 Main Street North, Woodbury, CT 06798",
        official_url: "https://newmorningmarket.com/",
        summary:
          "A natural-and-organic market founded in 1971 — wholesome prepared foods, artisanal cheeses, and specialty goods, open daily 8 to 8.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "mix-prime-steakhouse-woodbury",
        name: "MIX Prime Steakhouse",
        kind: "restaurant",
        address: "757 Main Street South, Woodbury, CT 06798",
        official_url: "https://www.mixprimesteakhouse.com/woodbury",
        summary:
          "A Main Street steakhouse advertising the area's only 40-day prime aged beef, plus fresh seafood and a sushi bar.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "1754-house-woodbury",
        name: "1754 House",
        kind: "bnb",
        address: "506 Main Street South, Woodbury, CT 06798",
        summary:
          "Woodbury's historic inn: ten guest rooms, each with private bath, plus a dining room, in the 18th-century building long known as the Curtis House — reputed to be Connecticut's oldest inn.",
        photos: [
          photo(
            "woodbury",
            "1754-house",
            "The Curtiss House (1754 House)",
            "1930s Historic American Buildings Survey photograph of the Curtiss House, today the 1754 House inn.",
            "William Rainey, Historic American Buildings Survey (Library of Congress)",
            "Public domain",
            "https://commons.wikimedia.org/wiki/File:Historic_American_Buildings_Survey_William_Rainey,_Photographer_GENERAL_VIEW_SHOWING_FRONT_AND_GABLE_END_-_Curtiss_House,_Woodbury,_Litchfield_County,_CT_HABS_CONN,3-WOO,6-1.tif"
          )
        ]
      })
    ]
  end
end
