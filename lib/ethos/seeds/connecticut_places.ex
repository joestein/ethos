defmodule Ethos.Seeds.ConnecticutPlaces do
  @moduledoc """
  Seeds the verified Connecticut places for the five-town guides
  (Waterbury, Middlebury, Danbury, Southbury, Woodbury) plus the Woodbury
  antiques dealers that the Antique Trail of Connecticut guide walks.
  Idempotent: `upsert_all!/0` upserts by slug. All facts verified against
  official sources in the 2026-08 research passes; photos are Wikimedia
  Commons free-license images with attribution.
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
    waterbury() ++ middlebury() ++ danbury() ++ southbury() ++ woodbury() ++ woodbury_antiques()
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
          "A Waterbury theatre staging musical theatre, comedy, and concert tributes, and running education programs, among them the in-house Halo Awards.",
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
          "A Thomaston Avenue brewery and taproom whose beers include Abel Porter, Blood Orange Farmhouse Ale, Brass Nail Session NEIPA, Filthy Bird, Fowl'd Up NEIPA, Mango Habanero NEIPA, Naugy Light, Sasso's American Boxer Ale, and Sweaty Sisters Blonde Ale, on tap and in 4-packs, alongside food trucks and an in-house menu.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "sweet-marias-waterbury",
        name: "Sweet Maria's",
        kind: "cafe",
        address: "159 Manor Avenue, Waterbury, CT 06705",
        official_url: "https://sweet-marias.com/",
        summary:
          "A Manor Avenue bakery selling cakes, cookies, cupcakes, biscotti, and pignoli, plus cookbooks and branded merchandise. Open Tuesday to Friday 10am-6pm, Saturday 8am-2pm, and Sunday 8am-12pm.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "nardellis-grinder-shoppe",
        name: "Nardelli's Grinder Shoppe",
        kind: "restaurant",
        address: "540 Plank Road, Waterbury, CT 06705",
        official_url: "https://www.nardellis.com/",
        summary:
          "A grinder shop with two Waterbury locations, on Watertown Avenue and Plank Road, and further branches across Connecticut. The menu runs to cold grinders such as an Italian Combo, hot grinders such as a baked stuffed pastrami, green salads, Italian wedding soup, and cannoli.",
        photos: []
      }),
      Map.merge(@waterbury, %{
        slug: "frankies-hot-dogs-waterbury",
        name: "Frankie's Hot Dogs",
        kind: "restaurant",
        address: "700 Watertown Avenue, Waterbury, CT 06708",
        official_url: "https://www.frankieshotdogs.com/",
        summary:
          "A hot dog restaurant with three Waterbury locations — 700 Watertown Avenue, 464 Reidville Drive, and 348 Chase Avenue — and others in Naugatuck, Meriden, Plainville, and West Haven. The menu covers hot dogs, including sauerkraut dogs, burgers, seafood, and sides such as curly fries, and a separate arm, Frankie's Catering, runs alongside it.",
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
          "A Middlebury dining room serving organic half chicken, a dry-aged burger, jumbo lump crab cakes, and seared scallops, with separate dinner, lunch, brunch, and catering menus.",
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
          "Hand-tossed artisan pizza, slow-cooked wings, fresh salads, and burgers, with 26 rotating craft beers on draft, at One Store Road in Middlebury.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "kitchen-64",
        name: "Kitchen 64",
        kind: "cafe",
        address: "590 Middlebury Road, Middlebury, CT 06762",
        official_url: "https://thekitchen64.com/",
        summary:
          "A breakfast, brunch, and lunch room on Middlebury Road: eggs, omelets, pancakes, French toast, paninis, crepes, breakfast tacos, benedicts, sandwiches, salads, coffee, and fresh-squeezed juice. Open daily 6:30 AM to 3:00 PM.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "maggie-mcflys-middlebury",
        name: "Maggie McFly's",
        kind: "restaurant",
        address: "6 Woodside Avenue, Middlebury, CT 06762",
        official_url: "https://maggiemcflys.com/middlebury/",
        summary:
          "A Connecticut-grown American restaurant and bar; the Middlebury location is at 6 Woodside Avenue.",
        photos: []
      }),
      Map.merge(@middlebury, %{
        slug: "senor-panchos-middlebury",
        name: "Señor Pancho's of Middlebury",
        kind: "restaurant",
        address: "530 Middlebury Road, Middlebury, CT 06762",
        official_url: "https://senorpanchos.com/",
        summary:
          "One of five locations of a Mexican restaurant group — Middlebury, Prospect, Southbury, Southington, and Plainville — offering dine-in, online ordering, and catering. The Middlebury restaurant is at 530 Middlebury Road.",
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
          "A performing arts venue at 165 Main Street hosting music, comedy, theater, and film. Its 2026 listings include the Manhattan Short Film Festival on October 2, tribute concerts, and comedy, and it offers theatrical rentals for private events.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "stanziatos-wood-fired-pizza",
        name: "Stanziato's Wood Fired Pizza",
        kind: "restaurant",
        address: "35 Lake Avenue Ext, Danbury, CT 06811",
        official_url: "https://www.stanziatos.com/",
        summary:
          "Twelve-inch wood-fired pizzas from an Italian-made oven running over 800 degrees, with ingredients sourced from local growers and artisans in Connecticut and New York. Open Monday to Thursday 11:30am-9:30pm, Friday and Saturday to 10pm, and Sunday to 9pm.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "tks-american-cafe",
        name: "TK's American Cafe",
        kind: "restaurant",
        address: "255 White Street, Danbury, CT 06810",
        official_url: "https://www.tksamericancafe.com/",
        summary:
          "A White Street sports bar built around 76 wing flavors and roughly 50 beers, eleven of them craft and import taps. It is an official chapter bar for soccer supporter groups. Open 11am to midnight daily, with grill hours to 11pm Monday to Thursday and to midnight Friday to Sunday.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "chucks-steak-house-danbury",
        name: "Chuck's Steak House & Margarita Grill",
        kind: "restaurant",
        address: "20 Segar Street, Danbury, CT 06810",
        official_url: "https://www.chucksdanbury.com/",
        summary:
          "Hand-cut Midwestern steaks, fresh seafood, steak burgers, and a salad bar included with meals, with handmade truffles for dessert. Live music runs Tuesdays and Thursdays. Open Monday to Thursday 11am-10pm, Friday and Saturday 11am-2am, and Sunday 11am-9pm.",
        photos: []
      }),
      Map.merge(@danbury, %{
        slug: "charter-oak-brewing",
        name: "Charter Oak Brewing Co.",
        kind: "brewery",
        address: "39B Shelter Rock Road, Danbury, CT 06810",
        official_url: "https://charteroakbrewing.com/",
        summary:
          "A Shelter Rock Road taproom with ten rotating draft lines, a gift shop, live local music at weekends, rotating food trucks, and a biergarten with shaded seating.",
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
          "A nature center and land trust that manages more than 2,400 acres of preserved land in Woodbury and neighboring towns.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "hollow-park",
        name: "Hollow Park",
        kind: "park",
        address: "43 Hollow Road, Woodbury, CT 06798",
        summary:
          "A Town of Woodbury Parks & Recreation park at 43 Hollow Road, with a basketball court, a covered pavilion, sand volleyball courts, an upper field, and an upper parking lot. The town's recreation site says the park now has Wi-Fi, and dogs must be leashed at all times in town parks.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "orenaug-park",
        name: "Orenaug Park",
        kind: "park",
        address: "Park Road, Woodbury, CT 06798",
        summary: "A Town of Woodbury park with a disc golf course.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "johns-cafe-woodbury",
        name: "John's Cafe",
        kind: "restaurant",
        address: "693 Main Street South, Woodbury, CT 06798",
        official_url: "https://www.johnscafe.com",
        summary:
          "A neighborhood New American bistro with a strong Italian influence, serving daily house-made pasta, fresh seafood, steaks, and pizza, with gluten-free options and desserts made in house. Open Monday to Wednesday 4:30 to 8:30 p.m. and Thursday to Saturday 11:30 a.m. to 9 p.m., closed Sunday; Mondays are BYOB with no corkage fee.",
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
          "An independent, family-owned natural foods store on Main Street North, carrying organic produce, prepared foods, specialty-diet items, antibiotic- and hormone-free meat, artisanal cheeses, and supplements. Open daily 8 a.m. to 8 p.m. The building's second floor houses the Vitality Center, a spa and wellness facility.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "good-news-restaurant-woodbury",
        name: "Good News Restaurant & Bar",
        kind: "restaurant",
        address: "694 Main Street South, Woodbury, CT 06798",
        summary:
          "An American restaurant at 694 Main Street South, with vegetarian, vegan, and gluten-free options; the menu runs to Thai red curry, lobster mac and cheese, chicken tikka masala, pork schnitzel, and a walnut-crusted tofu dish. Open Sunday to Thursday 11:30 a.m. to 9:30 p.m. and Friday and Saturday 11:30 a.m. to 10 p.m. Some menu aggregators still list the address under the older name Good News Cafe.",
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

  # The Woodbury antiques dealers, from the 2026-08-29 place-research wave and
  # its independent adversarial verification. Every clause below restates the
  # text of a `confirmed` verdict; the wave's `refuted` and `uncertain` items —
  # founding dates, building ages, award claims, showroom counts, association
  # memberships the association's own page does not assert — are deliberately
  # absent, and the report at
  # .superpowers/sdd/2026-08-29-place-research-wave/antique-trail-report.md
  # records each omission against its verdict.
  #
  # None of these records carries a `status`, so all take the schema default of
  # "open", which renders nothing: the template shows a banner only for
  # "closed". Eight of the seventeen are open on Connecticut Secretary of State
  # registry evidence and nine are unestablished either way; none is closed, and
  # no record here makes a positive claim about current trading.
  #
  # "Member of the Woodbury Antiques Dealers Association" appears only where a
  # verdict places the shop in the association's "Members Include" group. Eight
  # dealers sit in a separate "Other Woodbury Antiques Dealers Include" courtesy
  # list and are described that way or not at all.
  defp woodbury_antiques do
    main_street_north() ++ main_street_south() ++ [flea_market()]
  end

  # Listed by street number, as the Antique Trail guide walks them.
  defp main_street_north do
    [
      Map.merge(@woodbury, %{
        slug: "villa-vintiques-woodbury",
        name: "Villa Vintiques",
        kind: "shop",
        address: "12 Main Street North, Woodbury, CT 06798",
        official_url: "https://www.villavintiques.com/",
        summary:
          "A shop at 12 Main Street North selling antique and vintage furniture, mirrors, artwork, lighting, collectibles, ceramics, glassware, and decorative pieces, alongside goods from local artisans. Upstairs is The Silver Spur, a separate equestrian consignment operation. The shop publishes its hours as Wednesday to Saturday 11 a.m. to 5 p.m. and Sunday noon to 5 p.m., and accepts card, Apple Pay, Venmo, and cash. Telephone (203) 364-4042.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "abrash-galleries-woodbury",
        name: "Abrash Galleries Rugs & Antiquities",
        kind: "shop",
        address: "40 Main Street North, Woodbury, CT 06798",
        official_url: "https://abrashgalleries.com/",
        summary:
          "A rug gallery at 40 Main Street North dealing in one-of-a-kind antique and semi-antique rugs — Persian, Chinese, Turkish, Indian, American Indian, hooked, and Pakistani — along with art, pottery, lighting, and nomadic jewelry. Services include appraisals, rug cushions, rug washing, and rug restoration. Karen Reddington-Hughes is the named dealer. The Connecticut Office of Tourism gives hours as Tuesday to Saturday 10 a.m. to 5 p.m. and Sunday noon to 5 p.m., year-round; that listing carries no date, so telephone 203-263-7847 first.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "schwenke-group-woodbury",
        name: "Schwenke Group LLC",
        kind: "shop",
        address: "50 Main Street North, Woodbury, CT 06798",
        official_url: "http://schwenke.com/",
        summary:
          "A dealer in original American Federal period furniture at 50 Main Street North — dining tables and chairs, sideboards, desks, easy chairs, sofas, tables, dressing tables, and mirrors — sold with a written guarantee of authenticity. The business also offers design services, appraisals, restorations, custom furniture, and a replica line trademarked American Federal Classics. Tom Schwenke is the named dealer. The Woodbury Antiques Dealers Association lists the business as Schwenke Group LLC; the Connecticut Office of Tourism still lists it under the earlier company name Thomas Schwenke, Inc. Hours are given as Saturday 10 a.m. to 5 p.m. or by appointment; telephone (203) 266-0303.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "wayne-mattox-antiques-woodbury",
        name: "Wayne Mattox Antiques",
        kind: "shop",
        address: "82 Main Street North, Woodbury, CT 06798",
        summary:
          "An antiques dealer at 82 Main Street North and a member of the Woodbury Antiques Dealers Association, which gives its stock as folk art, furniture, art pottery, primitives, collectibles, and ephemera, and adds appraisals. Wayne and Kathleen Mattox are the named dealers. The Connecticut Office of Tourism gives hours as daily 10 a.m. to 5 p.m. year-round and instructs visitors to call ahead: telephone (203) 263-2899.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "the-coop-antiques-woodbury",
        name: "The Coop Antiques and Collectibles",
        kind: "shop",
        address: "245 Main Street North, Woodbury, CT 06798",
        summary:
          "An antiques and collectibles dealer at 245 Main Street North, registered with the Connecticut Secretary of State as The Coop-Antiques LLC at that address. The Woodbury Antiques Dealers Association carries it among other Woodbury antiques dealers, with Richard Albano as dealer and telephone 646-209-8923. No source states a specialism beyond antiques and collectibles.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "mill-house-antiques-woodbury",
        name: "Mill House Antiques & Gardens",
        kind: "shop",
        address: "1068 Main Street North, Woodbury, CT 06798",
        official_url: "https://www.millhouseantiquesandgardens.com/",
        summary:
          "A dealer in antique furniture and decorative arts at 1068 Main Street North, listed by the Connecticut Office of Tourism at that address on Route 6. Its own site catalogues stock by category — armoires and linen presses, buffets, chests, clocks, coffers and trunks, consoles and demilunes, cupboards, desks and writing tables, dining and farm tables, sideboards, lighting, mirrors, paintings, Pembroke and drop-leaf tables, seating, secretaries, and Welsh dressers — and it also offers custom furniture and restoration. Two pages of that site publish conflicting opening hours, so telephone (203) 263-3446 before visiting.",
        photos: []
      })
    ]
  end

  defp main_street_south do
    [
      Map.merge(@woodbury, %{
        slug: "main-street-antiques-center-woodbury",
        name: "Main Street Antiques Center",
        kind: "shop",
        address: "113 Main Street South, Woodbury, CT 06798",
        summary:
          "An antiques center at 113 Main Street South. The Woodbury Antiques Dealers Association gives that address and names Peggy Heminway as proprietor, carrying it among other Woodbury antiques dealers rather than among members; the Connecticut Secretary of State's principals file records Margaret Heminway at the same address as a principal of two companies. Telephone 203-263-0046.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "art-pappas-antiques-woodbury",
        name: "Art Pappas Antiques",
        kind: "shop",
        address: "161 Main Street South, Woodbury, CT 06798",
        official_url: "https://www.artpappas.com/",
        summary:
          "A dealer at 161 Main Street South, which describes itself as trading at the Main Street Antiques Center, in American furniture and accessories from the Pilgrim Century through mid-century modern, plus architectural antiques, fireplace equipment, paintings, pottery, and stoneware. Its own navigation runs to furniture, mantels, architectural elements, folk art and accessories, hardware, flooring, and paneling. Architectural salvage and antique building materials — wide board flooring, mantels, doors, windows, hardware, beams, and barnsiding — are shown by appointment only, and the shop describes itself as open by chance or appointment.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "g-sergeant-antiques-woodbury",
        name: "G. Sergeant Antiques",
        kind: "shop",
        address: "289 Main Street South, Woodbury, CT 06798",
        summary:
          "An antiques dealer at 289 Main Street South and a member of the Woodbury Antiques Dealers Association, with Gary Sergeant as the named dealer. Telephone (203) 266-4177; email gary@gsergeant.com. No access or hours guidance is published here: the only source for it was a website the verification pass could not open.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "david-schorsch-eileen-smiles-antiques-woodbury",
        name: "David A. Schorsch and Eileen M. Smiles American Antiques",
        kind: "shop",
        address: "358 Main Street South, Woodbury, CT 06798",
        official_url: "https://americanantiqueart.com/",
        summary:
          "A gallery of American antiques and folk art at 358 Main Street South, open by appointment: weathervanes, folk paintings, folk sculpture, formal and country furniture, Shaker design, boxes and baskets, decoys, Pennsylvania German work, painted furniture, and Windsor chairs. The business publishes scholarship alongside stock — Americana Insights, articles, books, and catalogues. The Connecticut Secretary of State's principals file records David Schorsch and Eileen Smiles as principals of companies at the address, and the Woodbury Antiques Dealers Association names David Schorsch as dealer among its members. Telephone (203) 263-3131.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "madeline-west-antiques-woodbury",
        name: "Madeline West Antiques",
        kind: "shop",
        address: "373 Main Street South, Woodbury, CT 06798",
        official_url: "https://madelinewestantiques.com/",
        summary:
          "A dealer in European, American, and Asian antique art, paintings, porcelain, and furniture of the 18th to the early 20th century, shown across five decorated rooms at 373 Main Street South and listed by the Connecticut Office of Tourism at that address on Route 6. Cynthia Pollock, daughter of Madeline West, is the current owner, and the shop is a member of the Woodbury Antiques Dealers Association. The tourism listing and the shop's own site disagree over whether it opens on Monday, so telephone 203-263-4604.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "george-champion-modern-woodbury",
        name: "George Champion Modern",
        kind: "shop",
        address: "442 Main Street South, Woodbury, CT 06798",
        summary:
          "The Woodbury Antiques Dealers Association's address list gives George Champion Modern Shop at 442 Main Street South, with George Champion as dealer and telephone 203-263-8442, among other Woodbury antiques dealers rather than among members. No source states what the shop deals in, and none beyond that one listing describes it at all.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "kocian-depasqua-antiques-woodbury",
        name: "Kocian DePasqua Antiques",
        kind: "shop",
        address: "451 Main Street South, Woodbury, CT 06798",
        official_url: "http://www.kocian-depasqua.com/",
        summary:
          "A dealer in antiques and folk art of the 17th to 19th centuries at 451 Main Street South, listed by the Connecticut Office of Tourism at that address on Route 6, with an emphasis on early furniture and on form, condition, and surface. Frank DePasqua is the named dealer and the shop is a member of the Woodbury Antiques Dealers Association. Three sources give three different sets of opening hours, so no hours are published here; telephone 203-394-8196.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "farmhouse-antiques-woodbury",
        name: "Farmhouse Antiques",
        kind: "shop",
        address: "495 Main Street South, Woodbury, CT 06798",
        summary:
          "A dealer in primitive and country furniture and accessories at 495 Main Street South, registered with the Connecticut Secretary of State as Farmhouse Antiques LLC at that address. Julie and Martin Overton are the named dealers on the Woodbury Antiques Dealers Association's list of other Woodbury antiques dealers. The Connecticut Office of Tourism listing contradicts itself on opening hours, so telephone (203) 263-6400 before visiting.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "clapp-and-tuttle-woodbury",
        name: "Clapp & Tuttle Custom Framing & Fine Art",
        kind: "shop",
        address: "742 Main Street South, Middle Quarter, Woodbury, CT 06798",
        official_url: "https://www.clappandtuttle.com/",
        summary:
          "A picture framer, conservator, and fine art gallery at 742 Main Street South in the Middle Quarter on Route 6 — not primarily an antiques retailer, which is worth knowing before walking in. The Woodbury Antiques Dealers Association profile describes works of art on paper for sale — lithograph, engraving, etching, woodblock, and watercolor — along with textile conservation and receptions for local artists. Mieke Schuyler is the named dealer and the business is a member of the association. Hours are Tuesday to Friday 9:30 a.m. to 5:30 p.m. and Saturday 9:30 a.m. to 4 p.m., with walk-ins welcome. Telephone 203-263-2207.",
        photos: []
      }),
      Map.merge(@woodbury, %{
        slug: "pantry-and-hearth-antiques-woodbury",
        name: "Pantry & Hearth Antiques",
        kind: "shop",
        address: "994 Main Street South, Woodbury, CT 06798",
        official_url: "https://pantryandhearth.com/",
        summary:
          "A dealer in Pilgrim-era American furniture — Jacobean, William & Mary, Queen Anne — with period accessories, at 994 Main Street South. The Woodbury Antiques Dealers Association, which carries the shop among its members with Gail Lettick as proprietor, adds treen, original-surface and painted high country furniture, and folk art; the shop's own site is organized as inventory, furniture, needlework, artwork, lighting, metalware, mirrors, and historical items. The Connecticut Office of Tourism gives it as daily by appointment with an April to December season, so telephone (203) 263-8555 first.",
        photos: []
      })
    ]
  end

  defp flea_market do
    Map.merge(@woodbury, %{
      slug: "woodbury-antiques-and-flea-market",
      name: "Woodbury Antiques and Flea Market",
      kind: "shop",
      address: "Junction of Route 6 and Route 64, Woodbury, CT 06798",
      summary:
        "A flea market where Route 6 meets Route 64. The Woodbury Antiques Dealers Association's address list gives it at Route 6 and 64, run by the Kaloidis family, telephone 203-263-6217; the Connecticut Office of Tourism's Woodbury Antiques Trail entry tells visitors to see the Antiques Flea Market on Saturdays where the trail crosses Route 64. Neither source carries a date.",
      photos: []
    })
  end
end
