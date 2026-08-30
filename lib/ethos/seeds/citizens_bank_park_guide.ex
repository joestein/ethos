defmodule Ethos.Seeds.CitizensBankParkGuide do
  @moduledoc """
  Seeds the Citizens Bank Park guide. Idempotent by slug.

  Carries `state: "Pennsylvania"` and `county: "Philadelphia"`, so it lists on
  both the Pennsylvania destination page and the Philadelphia county one. The
  county comes from the verdict rather than from the artifact's `county` field,
  which holds an explanatory sentence instead of a value: the confirmed verdict
  establishes that Philadelphia is coextensive with Philadelphia County and is
  the seat of its own county under a consolidated city-county government, and
  its correction directs the independent-city convention this corpus already
  uses for St. Louis and Baltimore City.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Philadelphia Phillies research artifact, or the text a `refuted`
  verdict's correction names as publishable.
  `docs/ballparks/citizens-bank-park.md` quotes each published sentence against
  the verdict it rests on and records each omission.

  What was dropped, and why:

    * **No parking price.** A confirmed `could_not_establish` records that no
      official published price for the ballpark's event lots could be reached:
      MLB.com's ballpark, transportation and parking pages and phillies.com,
      which redirects to MLB.com, returned HTTP 406 to every automated fetch,
      and the Philadelphia Parking Authority's public facility listing names no
      sports-complex event lot and states no rate. None is given here.

    * **No corner of the sports complex.** The finder placed the ballpark on
      the complex's northeast corner; the verifier found that clause in no
      source and checked the complex's own article, which does not state it
      either. The transit and street facts that survived are what this guide
      carries.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: no station, no garage and no bus route becomes a
  page. The two licensed parking operators named on Pattison Avenue are stated
  there for that reason and hold no records of their own.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "citizens-bank-park-guide",
      title: "Citizens Bank Park: The Ballpark and the Sports Complex Around It",
      destination: "Philadelphia, Pennsylvania",
      state: "Pennsylvania",
      county: "Philadelphia",
      intro: """
      Citizens Bank Park stands at One Citizens Bank Way in South Philadelphia,
      in the South Philadelphia Sports Complex. It opened on April 3, 2004, and
      the Philadelphia Phillies have played there since.

      This guide takes the ballpark first, then the complex and parkland around
      it, and then the team's own record. Research for it was carried out from
      named sources fetched directly: English Wikipedia, the businesses' and
      institutions' own sites, SEPTA route and station articles, Visit
      Philadelphia, the City of Philadelphia Parks & Recreation department, and
      the City of Philadelphia's business-license register. Where two sources
      give different numbers — a seating capacity, a street number — this guide
      publishes both and says they disagree. Where the research could not
      establish something, it names the gap rather than filling it.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Citizens Bank Park",
          place_slug: "citizens-bank-park",
          note:
            "One Citizens Bank Way: the Phillies' home ballpark, open since April 3, 2004, in the South Philadelphia Sports Complex. Capacity is listed as 42,901 by Wikipedia and 43,035 by Ballparks of Baseball. Announced in 2019 as the site of the 2026 MLB All-Star Game."
        },
        %{
          kind: "food",
          name: "Stateside Live! Philadelphia",
          place_slug: "stateside-live-philadelphia",
          note:
            "1100 Pattison Avenue: a dining and entertainment complex at 11th and Pattison, opened in March 2012 as Xfinity Live! Philadelphia and rebranded Stateside Live! on August 21, 2025. Tenants listed on its own site include PBR Philly, Blue Moon Beer Garden, Geno's Steaks, Live! Arena, Lorenzo and Sons Pizza, Miller Time Beer Hall and The Pub."
        },
        %{
          kind: "food",
          name: "Chickie's & Pete's (South Philadelphia Sports Complex)",
          place_slug: "chickies-and-petes-sports-complex",
          note:
            "1526 Packer Avenue: the sports-complex location of a chain founded in 1977 by Peter and Henrietta Ciarrocchi, which trademarked \"crab fries\" in 2007 and took over a former vacant supermarket building here in 1998. No source states whether it is the same storefront as the tenant of the same name at 1100 Pattison Avenue."
        },
        %{
          kind: "sight",
          name: "American Swedish Historical Museum",
          place_slug: "american-swedish-historical-museum",
          note:
            "1900 Pattison Avenue: founded in 1926 out of the Sesquicentennial Exposition's Swedish-American committee and dedicated on June 28, 1938, in a John Nydén building drawing on Ericsberg Castle. Twelve galleries, a Midsummer festival in June and a Lucia festival in December."
        },
        %{
          kind: "sight",
          name: "FDR Park",
          place_slug: "fdr-park",
          note:
            "1500 Pattison Avenue & S Broad St: a 348-acre Olmsted Brothers park on reclaimed marshland, opened as League Island Park and renamed for Franklin Delano Roosevelt in 1955. On the Philadelphia Register of Historic Places since 2000, and it borders the sports complex on South Broad Street."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          SEPTA's Metro B, the Broad Street Line, runs from Fern Rock Transit
          Center in North Philadelphia through Center City to its southern
          terminus at NRG Station, on Pattison Avenue in South Philadelphia,
          and that station provides access to Citizens Bank Park and to the
          rest of the South Philadelphia Sports Complex. The line's 1973
          extension to Pattison Avenue was built specifically to serve the
          then-newly completed sports complex.

          NRG Station has carried three names: it was Pattison Station from
          1973 to 2010 and AT&T Station from 2010 to 2018 before taking its
          current one. For sports events SEPTA runs a "B2 Special" express
          service on the Broad Street Line, making no stops between
          Walnut-Locust and NRG.

          SEPTA bus routes 4 and 17 serve Citizens Bank Park.

          On parking, the record stops short of a price. The City of
          Philadelphia's business-license register lists active Public Garage /
          Parking Lot licences on Pattison Avenue held by SP Plus Corporation
          at 1020 Pattison Avenue and by Express Parking Inc at 700 Pattison
          Avenue, serving the sports-complex area, and states no per-event rate
          for either. FDR Park, which borders the complex on South Broad
          Street, serves as an alternative site for offsite parking for events
          at the complex. No official published price for the ballpark's own
          event lots could be reached: MLB.com's ballpark, transportation and
          parking pages and phillies.com, which redirects to MLB.com, returned
          HTTP 406 to every automated fetch, and the Philadelphia Parking
          Authority's public facility listing names no sports-complex event lot
          and states no rate. No price is published here.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          The ballpark's neighbours are the rest of the sports complex and the
          parkland beside it, and Pattison Avenue is the street that ties them
          together.

          Stateside Live! Philadelphia is at 1100 Pattison Avenue, at the
          corner of 11th and Pattison on the eastern edge of the former
          Spectrum site. It opened its first tenants in March 2012 as Xfinity
          Live! Philadelphia and was rebranded on August 21, 2025 after
          Stateside Brands, a Philadelphia-area vodka company, bought the
          naming rights; a $15 million expansion including a new outdoor beer
          garden was underway with completion expected in early 2026. Its own
          site lists PBR Philly, Blue Moon Beer Garden, Chickie's and Pete's,
          Geno's Steaks, Live! Arena, Lorenzo and Sons Pizza, Miller Time Beer
          Hall and The Pub as tenants, with events promoted through January
          2027. The City's business-license register still files the operating
          entity as "PL PHASE ONE LP (XFINITY LIVE)" at 3601 South Broad
          Street, the trade name and address not yet having caught up to the
          rebrand.

          Chickie's & Pete's has a sports-complex location at 1526 Packer
          Avenue, in the Sports Complex Special Services District in Packer
          Park, where the chain took over a former vacant supermarket building
          in 1998. The chain was founded in 1977 by Peter and Henrietta
          Ciarrocchi and trademarked "crab fries" in 2007. Whether the Packer
          Avenue restaurant is the same storefront as the tenant of the same
          name listed at 1100 Pattison Avenue is not stated by any source
          fetched, so this guide does not say it is trading and does not say
          it has closed; there is no evidence of closure and none should be
          inferred.

          FDR Park runs alongside the complex on South Broad Street: 348 acres
          laid out by the Olmsted Brothers on reclaimed marshland from the
          former Greenwich Island, opened as League Island Park and renamed for
          Franklin Delano Roosevelt in 1955. Interstate 95, the former
          Philadelphia Naval Yard and the Packer Park residential neighborhood
          bound it. Inside are about 77 acres of natural lands with ponds and
          lagoons, a boathouse and gazebo, and a 2-acre all-ages playground
          opened in 2023; the golf course that had operated for nearly 80 years
          closed in 2019.

          The American Swedish Historical Museum stands inside FDR Park at 1900
          Pattison Avenue. It grew out of the Swedish-American committee of the
          1926 Sesquicentennial Exposition — Crown Prince Gustaf VI Adolf laid
          the cornerstone on June 2 of that year — and was dedicated on June
          28, 1938, on the 300th anniversary of the New Sweden colony. John
          Nydén's building draws on Ericsberg Castle, a 17th-century Swedish
          manor house, with exterior arcades modeled on those of Mount Vernon
          and a copper cupola replicating Stockholm City Hall's. Its own site
          gives hours of Tuesday to Sunday, 10am to 4pm, and admission of $15
          for adults, $10 for seniors, students and military, $5 for children
          aged 5 to 11, and free entry under 5 and for members. One
          disagreement is worth stating plainly: the museum and Visit
          Philadelphia both give 1900 Pattison Avenue, while the City's
          business-license register carries the institution at 1954 Pattison
          Avenue, and no source fetched reconciles the two.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Citizens Bank Park opened on April 3, 2004, replacing Veterans
          Stadium, which had been the Phillies' home from 1971 to 2003.
          Groundbreaking was on June 28, 2001; the ballpark cost $458 million,
          or $781 million in 2025 dollars; and EwingCole, HOK Sport and Agoos
          Lovera Architects designed it, with Stanley Cole as chief architect.
          Citizens Bank had agreed the naming rights on June 17, 2003, in a
          25-year, US $95 million deal that also covered advertising on
          billboards, telecasts, radio broadcasts and publications. The
          ballpark's perimeter buildings face 11th Street to the west, Pattison
          Avenue to the south and Darien Street to the east.

          Ashburn Alley is the concourse named for the Hall of Fame center
          fielder and broadcaster Richie Ashburn, with a bronze statue of him
          among its restaurants, games and memorabilia. A 52-foot mechanical
          Liberty Bell replica lights up and rings after Phillies home runs and
          wins. Zenos Frudakis sculpted bronzes of Ashburn, Robin Roberts, Mike
          Schmidt and Steve Carlton, and a 7.5-foot bronze memorial to the
          longtime broadcaster Harry Kalas was dedicated in 2011.

          Three dates belong to the building itself. The Phillies clinched the
          2008 World Series here on October 29, 2008, when Brad Lidge recorded
          the final out against the Tampa Bay Rays. The 2012 NHL Winter Classic
          drew an announced attendance of 46,967, a stadium record. And on
          April 16, 2019 the ballpark was announced as the site of the 2026 MLB
          All-Star Game, timed to the 250th anniversary of American
          independence.

          The franchise itself was established in 1883, when the National
          League awarded a new Philadelphia franchise — replacing the folded
          Worcester club — to the sporting-goods manufacturer Al Reach and the
          attorney John Rogers at its annual meeting of December 7, 1882. The
          Phillies are the oldest, continuous, one-name, one-city franchise in
          American professional sports, and the nickname first appeared in
          print in The Philadelphia Inquirer on April 3, 1883. They have won
          two World Series titles, in 1980 over the Kansas City Royals, 4-2,
          and in 2008 over the Tampa Bay Rays, 4-1, and eight National League
          pennants: 1915, 1950, 1980, 1983, 1993, 2008, 2009 and 2022.
          """
        }
      ],
      faq: [
        %{
          "question" => "Which trains and buses serve Citizens Bank Park?",
          "answer" =>
            "SEPTA's Metro B, the Broad Street Line, ends at NRG Station on Pattison Avenue, which provides access to the ballpark and the rest of the South Philadelphia Sports Complex; the line was extended to Pattison Avenue in 1973 specifically to serve the then-newly completed complex. For sports events SEPTA runs a \"B2 Special\" express making no stops between Walnut-Locust and NRG. SEPTA bus routes 4 and 17 also serve the ballpark."
        },
        %{
          "question" => "What does parking cost at the ballpark?",
          "answer" =>
            "No source fetched for this guide states an official published price for Citizens Bank Park's event lots. MLB.com's ballpark, transportation and parking pages and phillies.com, which redirects to MLB.com, returned HTTP 406 to every automated fetch, and the Philadelphia Parking Authority's public facility listing names no sports-complex event lot and states no rate. The City's business-license register does show active Public Garage / Parking Lot licences on Pattison Avenue held by SP Plus Corporation at 1020 Pattison Avenue and Express Parking Inc at 700 Pattison Avenue, without a per-event rate, and FDR Park serves as an alternative site for offsite parking for events at the complex."
        },
        %{
          "question" => "What is the ballpark's seating capacity?",
          "answer" =>
            "The sources disagree, so both figures are published here. Wikipedia gives 42,901 as the current figure and Ballparks of Baseball gives 43,035. The confirmed research finding is the disagreement itself, and nothing fetched resolves it."
        },
        %{
          "question" => "Why did Xfinity Live! change its name?",
          "answer" =>
            "Stateside Brands, a Philadelphia-area vodka company, purchased the naming rights, and the complex was rebranded from Xfinity Live! Philadelphia to Stateside Live! Philadelphia on August 21, 2025. The City of Philadelphia's business-license register has not caught up: it still files the operating entity as \"PL PHASE ONE LP (XFINITY LIVE)\", at 3601 South Broad Street."
        },
        %{
          "question" =>
            "Why does the American Swedish Historical Museum have two street numbers?",
          "answer" =>
            "Because two sources give different ones and neither is corrected by anything fetched. The museum's own site and Visit Philadelphia both give 1900 Pattison Avenue; the City of Philadelphia's business-license register carries \"AMERICAN SWEDISH HIST FOUNDATION MUSEUM\" at 1954 Pattison Avenue. This guide publishes the museum's own number and states the City's alongside it."
        },
        %{
          "question" => "Is the Chickie's & Pete's near the ballpark open?",
          "answer" =>
            "This guide does not say. The sports-complex location at 1526 Packer Avenue has an established name and address — Wikipedia and the City's business-license register agree on both, and the register carries an active Food Preparing and Serving licence there — but no source fetched states whether it is the same storefront as the \"Chickie's and Pete's\" tenant listed on Stateside Live!'s own site at 1100 Pattison Avenue. That is a gap in the record, not evidence of closure, and none should be inferred."
        }
      ],
      photos: []
    }
  end
end
