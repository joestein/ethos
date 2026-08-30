defmodule Ethos.Seeds.CitizensBankParkPlaces do
  @moduledoc """
  Seeds the places for the Citizens Bank Park guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Philadelphia Phillies research artifact, or the text a
  `refuted` verdict's correction names as publishable. A verdict vouches only
  for what its own `item` text restates, not for every clause of the sentence
  the finder wrote around it.
  `docs/ballparks/citizens-bank-park.md` quotes each published sentence against
  the verdict it rests on, and records every omission.

  What the verification changed, and what is therefore absent here:

    * **No corner of the sports complex.** The finder's boundary sentence was
      refuted: the cited page describes which streets the ballpark's own
      perimeter buildings face, not where in the South Philadelphia Sports
      Complex the ballpark sits. The correction's text — perimeter buildings
      facing 11th Street to the west, Pattison Avenue to the south and Darien
      Street to the east — is what ships, and the positional claim is gone.

    * **Two capacity figures, both published.** Wikipedia gives 42,901 and
      Ballparks of Baseball gives 43,035. The confirmed verdict is that the
      sources disagree, so the record states the disagreement rather than
      picking one.

    * **Two street numbers for the museum, both published.** The American
      Swedish Historical Museum's own site says 1900 Pattison Avenue; the City
      of Philadelphia's business-license register carries the institution at
      1954 Pattison Avenue. No source fetched reconciles them.

    * **No trading claim for Chickie's & Pete's.** Its `status_verdict` is
      `uncertain`: the sports-complex location at 1526 Packer Avenue has an
      established name and address, so there is something to publish, but no
      source states whether it is the same storefront as the "Chickie's and
      Pete's" tenant listed at 1100 Pattison Avenue. Uncertain is not closed,
      and no closure is asserted.

  The county on every record is `"Philadelphia"`. The artifact's `county` field
  holds an explanatory sentence rather than a value; the confirmed verdict
  establishes that Philadelphia is coextensive with Philadelphia County under a
  consolidated city-county government, and its correction directs the corpus's
  independent-city convention — the one already used for St. Louis and
  Baltimore City.
  """

  alias Ethos.Places

  @philadelphia %{town: "Philadelphia", state: "Pennsylvania", county: "Philadelphia"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@philadelphia, %{
        slug: "citizens-bank-park",
        name: "Citizens Bank Park",
        kind: "stadium",
        address: "One Citizens Bank Way, Philadelphia, PA 19148",
        official_url: "https://www.mlb.com/phillies/ballpark",
        summary:
          "The home ballpark of the Philadelphia Phillies since 2004, at One Citizens Bank Way in the South Philadelphia Sports Complex. The City of Philadelphia's business-license register gives the ZIP code for 1 Citizens Bank Way as 19148-5204. Seating capacity is listed as 42,901 by Wikipedia and 43,035 by Ballparks of Baseball; the two sources do not agree on the exact number. The ballpark's perimeter buildings face 11th Street to the west, Pattison Avenue to the south and Darien Street to the east.",
        history:
          "Citizens Bank Park opened on April 3, 2004, replacing Veterans Stadium, which had been the Phillies' home from 1971 to 2003. Groundbreaking was on June 28, 2001, the ballpark cost $458 million to build — $781 million in 2025 dollars — and it was designed by EwingCole, HOK Sport and Agoos Lovera Architects, with Stanley Cole as chief architect. Citizens Bank agreed to a 25-year, US $95 million deal on June 17, 2003 for the naming rights, together with advertising on billboards, telecasts, radio broadcasts and publications. The Phillies clinched the 2008 World Series here on October 29, 2008, when Brad Lidge recorded the final out against the Tampa Bay Rays. The ballpark hosted the 2012 NHL Winter Classic, drawing an announced attendance of 46,967, a stadium record, and it was announced on April 16, 2019 as the site of the 2026 MLB All-Star Game, timed to the 250th anniversary of American independence. Ashburn Alley, a concourse area named for Hall of Fame center fielder and broadcaster Richie Ashburn, carries a bronze statue of Ashburn along with restaurants, games and memorabilia; a 52-foot mechanical Liberty Bell replica lights up and rings after Phillies home runs and wins; the sculptor Zenos Frudakis created bronze statues of Richie Ashburn, Robin Roberts, Mike Schmidt and Steve Carlton; and a 7.5-foot bronze memorial to the longtime broadcaster Harry Kalas was dedicated in 2011.",
        photos: []
      }),
      Map.merge(@philadelphia, %{
        slug: "stateside-live-philadelphia",
        name: "Stateside Live! Philadelphia",
        kind: "attraction",
        address: "1100 Pattison Avenue, Philadelphia, PA 19148",
        official_url: "https://statesidelive.com/",
        summary:
          "A dining and entertainment complex at the corner of 11th and Pattison Avenue, on the eastern edge of the former Spectrum site within the South Philadelphia Sports Complex. It opened its first tenants in March 2012 under the name Xfinity Live! Philadelphia. Its official site lists current tenants as PBR Philly, Blue Moon Beer Garden, Chickie's and Pete's, Geno's Steaks, Live! Arena, Lorenzo and Sons Pizza, Miller Time Beer Hall and The Pub, with events promoted through January 2027.",
        history:
          "The complex was rebranded from Xfinity Live! to Stateside Live! on August 21, 2025, after Stateside Brands, a Philadelphia-area vodka company, purchased the naming rights; a $15 million expansion including a new outdoor beer garden was underway with expected completion in early 2026. Under its former name the venue was described as also including an outdoor plaza with the Miller Lite Concert Stage and an NBC Sports Arena venue holding Chickie's & Pete's and Geno's Steaks; no source fetched states whether those two are the original South Philadelphia locations of the brands or separate stadium-area outposts. The City of Philadelphia's business-license register lists an active Food Preparing and Serving (30+ seats) licence at 3601 South Broad Street for \"PL PHASE ONE LP (XFINITY LIVE)\" — the operating entity's filed address and trade name have not yet caught up to the August 2025 rebrand.",
        photos: []
      }),
      Map.merge(@philadelphia, %{
        slug: "chickies-and-petes-sports-complex",
        name: "Chickie's & Pete's (South Philadelphia Sports Complex)",
        kind: "restaurant",
        address: "1526 Packer Avenue, Philadelphia, PA",
        official_url: "https://www.chickiesandpetes.com/",
        summary:
          "Chickie's & Pete's was founded in 1977 by Peter and Henrietta Ciarrocchi and trademarked the phrase \"crab fries\" in 2007. In 1998 the chain expanded into a former vacant supermarket building near Veterans Stadium in the Sports Complex Special Services District in Packer Park, South Philadelphia, at 1526 Packer Avenue. The City of Philadelphia's business-license register lists an active Food Preparing and Serving (30+ seats) licence at that address under \"T/A CHICKIES & PETES INC (PACKER CAFE INC)\", plus an active dumpster licence under the same trade name at the same address. No source fetched states whether this is the same storefront as the \"Chickie's and Pete's\" tenant listed on Stateside Live!'s own site at 1100 Pattison Avenue, and it is distinct from the chain's original Robbins Avenue location in the Mayfair neighborhood.",
        history: nil,
        photos: []
      }),
      Map.merge(@philadelphia, %{
        slug: "american-swedish-historical-museum",
        name: "American Swedish Historical Museum",
        kind: "museum",
        address: "1900 Pattison Avenue, Philadelphia, PA 19145",
        official_url: "https://americanswedish.org/",
        summary:
          "A museum founded in 1926, growing out of the Swedish-American committee of the Sesquicentennial Exposition. Crown Prince Gustaf VI Adolf of Sweden laid the cornerstone on June 2, 1926, and the museum was formally dedicated on June 28, 1938, coinciding with the 300th anniversary of the New Sweden colony. Visit Philadelphia's tourism site describes 12 galleries of Swedish-American heritage exhibits and the museum's Midsummer festival in June and Lucia festival in December. The museum's own site gives public hours of Tuesday to Sunday, 10am to 4pm, and admission of $15 for adults, $10 for seniors, students and military, $5 for children aged 5 to 11, and free entry under 5 and for members.",
        history:
          "The building was designed by the Swedish-American architect John Nydén, drawing on Ericsberg Castle, a 17th-century Swedish manor house, with exterior arcades modeled on those of Mount Vernon and a copper cupola replicating Stockholm City Hall's. The museum's own site and Visit Philadelphia both give the address as 1900 Pattison Avenue; the City of Philadelphia's business-license register carries \"AMERICAN SWEDISH HIST FOUNDATION MUSEUM\" at 1954 Pattison Avenue instead, a different house number on the same street, and no source fetched reconciles the two.",
        photos: []
      }),
      Map.merge(@philadelphia, %{
        slug: "fdr-park",
        name: "FDR Park",
        kind: "park",
        address: "1500 Pattison Avenue & S Broad St, Philadelphia, PA 19145",
        official_url: "https://fdrparkphilly.org/",
        summary:
          "Franklin Delano Roosevelt Park, a 348-acre park in South Philadelphia along the Delaware River, designed by the Olmsted Brothers on reclaimed marshland from the former Greenwich Island. It opened as League Island Park and was renamed Franklin Delano Roosevelt Park in 1955. It borders the South Philadelphia Sports Complex on South Broad Street and is bounded by Interstate 95, the former Philadelphia Naval Yard and the Packer Park residential neighborhood.",
        history:
          "The park was designated to the Philadelphia Register of Historic Places in 2000. It includes about 77 acres of natural lands with ponds and lagoons, the American Swedish Historical Museum of 1926, a boathouse and gazebo, and a 2-acre all-ages playground that opened in 2023; its golf course, which had operated for nearly 80 years, closed in 2019. The City of Philadelphia Parks & Recreation department's own listings give the address as 1500 Pattison Avenue & S Broad St and carry a Tai Chi for Beginners program there on September 1, 2026, run by the volunteer group Friends of FDR Park.",
        photos: []
      })
    ]
  end
end
