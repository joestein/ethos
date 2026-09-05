defmodule Ethos.Seeds.BuschStadiumPlaces do
  @moduledoc """
  Seeds the places for the Busch Stadium guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 St. Louis Cardinals research artifact, or the text a
  `refuted` verdict's correction supplies. `docs/ballparks/busch-stadium.md`
  quotes each published sentence against the verdict it rests on.

  **Every record hangs from the node `united-states/missouri/st-louis`.** A
  confirmed verdict records that St. Louis is an independent city that separated
  from St. Louis County in 1877 and is not located within any county — which is
  what the tree says by putting the city straight under the region, with nothing
  between them.

  What the verification changed, and what is therefore absent here:

    * **Four places carry no trading claim**: Ballpark Village, Salt + Smoke,
      the City Museum and the Anheuser-Busch Brewery. Each rests on an
      operator's own site, which under the research contract is
      self-referential — it establishes that a business makes a statement, not
      that the statement is currently true. The verifier's one systematic
      finding in this batch was that two of these were marked `open` while two
      others with the identical evidence shape were marked `uncertain`; both
      were corrected down, and all four are treated alike here. Uncertain is
      not closed, and no closure is asserted.

    * **The Gateway Arch's visitor centre carries no completion year.** The
      verdict is `uncertain` between 1976 and 1977, with the correction "if
      unresolved, drop the year rather than assert either". Dropped.

    * **Two addresses are published as disagreements.** Busch Stadium is 700
      Clark Street on the club's own page and 700 Clark Ave in Wikipedia's
      infobox; the Anheuser-Busch complex is 721 Pestalozzi Street in
      Wikipedia's infobox and 1200 Lynch St on the brewery's own tour site.
      Neither could be reconciled, and neither is resolved silently.

    * **The Cardinals Hall of Fame and Museum is published as a conflict, not
      as a closure.** Wikipedia lists it among Ballpark Village's venues; the
      operator's own August 2026 tenant list does not. Whether it closed,
      moved, or was renamed into another venue could not be determined.

    * **Four places have no street-number address**, because no source gives
      one: the Old Courthouse, Citygarden, Kiener Plaza and Laclede's Landing.
      Each carries the bounding streets or facing street its sources give, and
      says so.

  Architectural style ships wherever a verdict states one — the Old
  Courthouse's Federal, Greek Revival and Italian Renaissance elements, the
  brewery's red brick Romanesque, Union Station's Romanesque arches. No trip
  duration appears anywhere.
  """

  alias Ethos.Places

  @stl %{destination_path: "united-states/missouri/st-louis"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@stl, %{
        slug: "busch-stadium",
        name: "Busch Stadium",
        kind: "stadium",
        address: "700 Clark Street, St. Louis, MO 63102",
        official_url: "https://www.mlb.com/cardinals/ballpark",
        summary:
          "The home ballpark of the St. Louis Cardinals, in downtown St. Louis near the interchange of Interstates 64, 55 and 44, straddling 7th and Clark Streets on part of the site of the demolished Busch Memorial Stadium. It opened with an exhibition game on April 4, 2006 and held its first Major League game on April 10, 2006. Normal seating capacity is 46,861. The two sources disagree on the street suffix — the club's own page gives 700 Clark Street and Wikipedia's infobox 700 Clark Ave — and both name the same address.",
        history:
          "Ground was broken on January 17, 2004 and the ballpark opened in 2006 at a cost of $365 million, about $583 million in 2025 dollars. It was designed by Populous, formerly HOK Sport, and Kennedy Associates/Architects Inc., with Jim Chibnall as lead designer. The Gate 3 entrance incorporates a bridge structure designed to resemble the historic Eads Bridge. Anheuser-Busch signed a 20-year naming-rights deal in 2004, nominally running to 2024; no source reached gives any information on whether it was renewed.",
        photos: []
      }),
      Map.merge(@stl, %{
        slug: "st-louis-ballpark-village",
        name: "Ballpark Village",
        kind: "attraction",
        address: "601 Clark Avenue, St. Louis, MO 63102",
        official_url: "https://www.stlballparkvillage.com/",
        summary:
          "A mixed-use entertainment, dining and retail development in downtown St. Louis, on the site of the demolished Busch Memorial Stadium. Phase One opened on March 27, 2014 and Phase Two began opening in June 2020. The operator's own site listed these venues in August 2026: Prairie Farms Ice Cream Barn, Sports & Social St. Louis, Pizza Bar, Salt + Smoke, AVA Garden Bar, Live! Arena and PBR St. Louis, with retail at Baseballism, Cardinals Authentics, New Era Store, Scott Credit Union and CardVault by Tom Brady, and the Live! by Loews hotel. A further venue, The Clydesdale, is listed with an opening date of August 27, 2026. That list is the operator's own account of its tenants, which is not independent evidence of current trading, and none is claimed here.",
        history:
          "Wikipedia's article lists a Cardinals Hall of Fame and Museum among the complex's venues; the operator's own August 2026 tenant list does not mention it under that name. Whether it has closed, relocated, or been renamed or absorbed into another listed venue could not be determined, and this is a conflict between two sources rather than a confirmed closure.",
        photos: []
      }),
      Map.merge(@stl, %{
        slug: "st-louis-salt-and-smoke-ballpark-village",
        name: "Salt + Smoke (Ballpark Village)",
        kind: "restaurant",
        address: "601 Clark Avenue, St. Louis, MO 63102",
        official_url: "https://www.saltandsmokebbq.com/",
        summary:
          "A barbecue restaurant at Ballpark Village, one of eight Salt + Smoke locations in the St. Louis area; the others are Delmar Loop, St. Charles, South County, Kirkwood, Edwardsville in Illinois, Hampton and Ellisville. It serves St. Louis-style barbecue, including ribs seasoned with a signature rub and smoked with cherry wood, alongside chicken, brisket and pulled pork. Both that account and the Ballpark Village tenant listing come from the businesses' own sites, so neither establishes current trading, and no suite number distinct from the complex's general address could be found.",
        history: nil,
        photos: []
      }),
      Map.merge(@stl, %{
        slug: "st-louis-gateway-arch",
        name: "Gateway Arch",
        kind: "attraction",
        address: "11 North 4th Street, St. Louis, MO 63102",
        official_url: "https://www.nps.gov/jeff/index.htm",
        summary:
          "A 630-foot arch within Gateway Arch National Park, operated by the National Park Service, described as the world's tallest arch and the tallest memorial in the United States. Visitors enter through the west entrance, which faces Fourth Street and the Old Courthouse. An underground visitor centre of 70,000 square feet beneath the arch houses the Museum of Westward Expansion and underwent a $176 million renovation finished in July 2018; the sources disagree on the year that centre was completed, so no year is given. The address above is the national park's mailing address, and no separate street address for the arch's visitor entrance could be confirmed.",
        history:
          "The arch was designed by the Finnish-American architect Eero Saarinen in 1947. Construction ran from February 12, 1963 to October 28, 1965 at a cost of $13 million, about $98.4 million in 2024 dollars. It opened to the public on June 10, 1967 and was dedicated by Vice President Hubert Humphrey on May 25, 1968.",
        photos: []
      }),
      Map.merge(@stl, %{
        slug: "st-louis-old-courthouse",
        name: "Old Courthouse",
        kind: "historic-site",
        address: "Fourth Street, within Gateway Arch National Park, St. Louis, MO",
        official_url: "https://www.nps.gov/jeff/index.htm",
        summary:
          "A courthouse within Gateway Arch National Park, its west-facing entrance on Fourth Street; no separate street-number address could be confirmed for it. The National Park Service maintains four history galleries at the site and has restored two courtrooms — Circuit Court #13 to its 1910 appearance and Circuit Court #4 to approximate 1850s detail. The building hosted the proceedings of Dred Scott v. Sandford; the United States Supreme Court ruled against Dred and Harriet Scott in 1857.",
        history:
          "Construction began in 1816 and the initial Federal-style building was completed in 1828 by the firm Laveille & Morton. Henry Singleton designed a Greek Revival addition in 1839, Robert S. Mitchell redesigned portions from 1851, and William Rumbold added an Italian Renaissance cast-iron dome modeled on St. Peter's Basilica between 1861 and 1864. At 192 feet, it was Missouri's tallest habitable building from 1864 to 1894. The city abandoned the building in 1930 and the original donors' descendants sued for ownership; it became part of the Jefferson National Expansion Memorial, now Gateway Arch National Park, in 1940.",
        photos: []
      }),
      Map.merge(@stl, %{
        slug: "st-louis-citygarden",
        name: "Citygarden",
        kind: "park",
        address: "Between Eighth, Tenth, Market and Chestnut streets, St. Louis, MO",
        official_url: "https://www.citygardenstl.org/",
        summary:
          "An urban park and sculpture garden in the Gateway Mall area, spanning 2.9 acres across two city blocks and built at a cost of $30 million. It was dedicated on June 30, 2009 and opened to the public on July 1, 2009. It houses 29 sculptures by artists including Keith Haring, Aristide Maillol, Jim Dine, Igor Mitoraj and Julian Opie, with an estimated collection value of around $12 million. It is free and open year-round with no admission fee, owned by the City of St. Louis and maintained by the Gateway Foundation, which owns the sculptures. The site is described only by its bounding streets, and its current hours could not be confirmed.",
        history: nil,
        photos: []
      }),
      Map.merge(@stl, %{
        slug: "st-louis-kiener-plaza",
        name: "Kiener Plaza",
        kind: "park",
        address:
          "Bounded by Chestnut and Market streets and Broadway and 7th Street, St. Louis, MO",
        official_url: nil,
        summary:
          "A 1.9-acre urban park, part of the Gateway Mall, serving as a central downtown gathering space and adjacent to the Old Courthouse and Gateway Arch National Park. It features the statue and fountain \"The Runner\" by the sculptor William Zorach, and is named after Harry Kiener, a philanthropist and 1904 Olympic athlete. It is described only by its bounding streets; no official site, current hours or admission policy could be sourced for it.",
        history:
          "The eastern half opened in 1965, funded by a bond issue of 1962; the western half, including the Morton D. May Amphitheater, was added in 1986. The plaza closed in February 2016 for a $23 million rebuild as part of the CityArchRiver project and reopened on May 19, 2017 with new street-level spaces, a playground, water features and a lawn accommodating up to 3,000 people.",
        photos: []
      }),
      Map.merge(@stl, %{
        slug: "st-louis-city-museum",
        name: "City Museum",
        kind: "museum",
        address: "750 North 16th Street, St. Louis, MO 63103",
        official_url: "https://citymuseum.org/",
        summary:
          "A museum at 750 North 16th Street, occupying the former International Shoe Company factory and warehouse, which Bob and Gail Cassilly purchased in 1993. Its features include a life-size walk-through bowhead whale sculpture, the multi-slide \"Enchanted Caves\", a Wurlitzer pipe organ from a historic New York theater, a rooftop Ferris wheel, and the outdoor \"MonstroCity\" structure built from repurposed aircraft fuselages and industrial materials. The museum's own site is the only evidence of current operation the research reached, and it cannot establish that on its own word, so nothing here says whether the museum is open now. No base admission price could be retrieved.",
        history:
          "The museum opened to the public on October 25, 1997, founded by the artist Bob Cassilly with Gail Cassilly. It attracted 300,000 visitors within its first two years and over 700,000 by 2010.",
        photos: []
      }),
      Map.merge(@stl, %{
        slug: "st-louis-union-station",
        name: "St. Louis Union Station",
        kind: "attraction",
        address: "1820 Market Street, St. Louis, MO 63103",
        official_url: "https://stlouisunionstation.com/",
        summary:
          "A mixed-use complex at 1820 Market Street, in a building that opened as a railroad station on September 1, 1894 and has carried no Amtrak service since October 31, 1978. It now holds the St. Louis Union Station Hotel, a 567-room Curio Collection by Hilton property; the St. Louis Aquarium, which opened on December 25, 2019 and is described as featuring more than 13,000 animals across over 250 species; and the St. Louis Wheel, a 200-foot Ferris wheel with climate-controlled gondolas. Its own site also names The Train Shed, The Pitch Athletic Club & Tavern and the Soda Fountain among the on-site dining. Current hours and admission prices for the aquarium, the wheel and the hotel could not be established.",
        history:
          "The station was designed by Theodore Link with the civil engineer George H. Pegram and originally had 31 tracks under an enclosed train shed; on completion it was the world's largest and busiest railroad station. It received National Historic Landmark designation in 1970, and an adaptive-reuse renovation began in 1985. The headhouse's Grand Hall has a gold-leafed ceiling, Romanesque arches, a 65-foot barrel-vaulted ceiling and stained-glass windows; the building is constructed of Indiana limestone and its clock tower is 230 feet tall.",
        photos: []
      }),
      Map.merge(@stl, %{
        slug: "st-louis-lacledes-landing",
        name: "Laclede's Landing",
        kind: "historic-site",
        address:
          "Bounded by Washington Avenue, North 3rd Street, Dr. Martin Luther King Drive and the Mississippi River, St. Louis, MO",
        official_url: nil,
        summary:
          "A historic riverfront district marking the site where Pierre Laclède founded St. Louis around 1780, with his 14-year-old stepson Auguste Chouteau tasked with preparing the land. It contains brick-and-cast-iron warehouses built between 1850 and 1900 and converted into shops, restaurants and bars, and is described as the only remaining section of St. Louis's 19th-century commercial riverfront. It sits north of Gateway Arch National Park, separated from it by the Eads Bridge. No source reached names any business currently trading in the district, and none is named here.",
        history: nil,
        photos: []
      }),
      Map.merge(@stl, %{
        slug: "st-louis-anheuser-busch-brewery",
        name: "Anheuser-Busch Brewery",
        kind: "brewery",
        address: "1200 Lynch St, St. Louis, MO 63118",
        official_url: "https://www.budweisertours.com/",
        summary:
          "A 142-acre complex of 189 buildings holding both United States National Historic Landmark District and City of St. Louis Landmark status; it was added to the National Register of Historic Places and designated a National Historic Landmark on November 13, 1966. Two addresses appear across the sources and could not be reconciled: Wikipedia's infobox gives 721 Pestalozzi Street, while the brewery's own visitor-tour site gives the 1200 Lynch St address used here for the tour entrance. Its own tour site states that tours run every day from 10am to 5pm, in several formats — the Day Fresh Tour, the Beermaster Tour, the Clydesdale VIP Experience, the Finisher Tour and the King of Beers experience — and states no admission price. That is the brewery's own account of itself, and no independent source confirmed current tour operation.",
        history:
          "Many of the buildings feature red brick Romanesque architecture; the Brew House, built between 1891 and 1892, is noted for multi-story hop chandeliers, ornate ironwork and natural light. The grounds include the Lyon Schoolhouse Museum, and the Budweiser Clydesdales can be seen in their exercise field and carriage house.",
        photos: []
      })
    ]
  end
end
