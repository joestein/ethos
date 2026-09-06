defmodule Ethos.Seeds.TruistParkPlaces do
  @moduledoc """
  Seeds the places for the Truist Park guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Atlanta Braves research artifact — either a verdict's own
  `item`, or a confirmed `status_verdict`'s `reason`, which is the verifier's
  own finding and is confirmed in its own right. A verdict vouches only for
  what it restates. `docs/ballparks/truist-park.md` quotes each published
  sentence against the verdict it rests on, and records every omission.

  ## Why six records carry no street address

  Six of this artifact's nine refutations are one repeated defect: the finder
  cited The Battery Atlanta's dead per-tenant subpages — several carry literal
  January 2019 bylines and no tenant text at all — instead of the live
  directory indexes, which do list every one of those tenants. The verifier
  refuted the citations and re-established each tenancy against the live index.

  The consequence for this module is narrow and worth stating exactly. Each
  tenant's **current tenancy** is carried by a confirmed `status_verdict`
  reason and ships. Five of those tenants also keep their **street address**,
  because the verifier's own text expressly states the address confirms and
  names it — for Silverspot Cinema, "[t]he address itself is confirmed
  independently", and for the other four the correction names the address on
  the live directory index. Six tenants have no address in any verdict text at
  all, and carry none here.

  ## What else is absent

    * **No trading claim for Achie's**, whose `status_verdict` is `uncertain`.
      Its identity is confirmed and it is published; nothing is said about
      whether it trades, and nothing about closure is asserted or implied.
    * **No James Beard award for Achie's chef.** The verdict that mentions it
      says in terms that its `item` restates only the "eighth restaurant"
      clause and that the award "is not confirmed for publication by this
      verdict".
    * **No description of what Baseballism sells.** The verifier records that
      the "baseball-themed apparel retailer" description "was not independently
      verified on any source fetched".
    * **No claim about the Mizuno Experience Center being unique in the United
      States**, which the verifier could not verify and which would be an
      unsourced superlative besides.

  Every record hangs from the node `united-states/georgia/cumberland`. Cobb
  County is not modelled. See `Ethos.Seeds.TruistParkGuide` for why the city node
  is not `atlanta`, which is the postal city on the ballpark's own official
  address.
  """

  alias Ethos.Places

  @cumberland %{destination_path: "united-states/georgia/cumberland"}

  @battery "A tenant of The Battery Atlanta, the mixed-use development around Truist Park."

  @battery_address "800 Battery Avenue SE, Atlanta, Georgia 30339"

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@cumberland, %{
        slug: "truist-park",
        name: "Truist Park",
        kind: "stadium",
        address: "755 Battery Avenue SE, Atlanta, Georgia 30339",
        official_url: "https://www.mlb.com/braves/ballpark",
        summary:
          "The home ballpark of the Atlanta Braves, whose official address as given by MLB.com is 755 Battery Avenue SE, Atlanta, Georgia 30339. The ballpark itself stands in Cumberland, an unincorporated community in Cobb County, Georgia, described by the encyclopedia as \"an edge city in Cobb County located in an unincorporated area of the northwest Atlanta metropolitan area\", ten miles northwest of downtown Atlanta. It opened on April 14, 2017 as SunTrust Park and was renamed Truist Park in January 2020.",
        history:
          "The first regular-season game at the ballpark was held on April 14, 2017, when it was named SunTrust Park under a 25-year naming-rights agreement; the Braves and Truist Financial formally announced on January 14, 2020 that the name would change to Truist Park, following the merger of SunTrust Banks and BB&T that created Truist Financial. Before Truist Park the Braves played at Turner Field from 1997 to 2016 — a stadium built as the 85,000-seat Centennial Olympic Stadium for the 1996 Summer Olympics and converted afterward into a 49,000-seat baseball-only park. The Battery Atlanta, the mixed-use development surrounding the ballpark, was proposed on November 20, 2013, broke ground on September 16, 2014 and opened in stages beginning in 2017, at a cost of roughly $400 million funded by the Braves and development partners; its architect was Wakefield Beasley & Associates.",
        photos: []
      }),
      Map.merge(@cumberland, %{
        slug: "omni-hotel-battery-atlanta",
        name: "Omni Hotel at The Battery Atlanta",
        kind: "hotel",
        address: nil,
        official_url: nil,
        summary:
          "A 16-floor hotel at The Battery Atlanta, opened on January 3, 2018 and owned 50/50 by the Atlanta Braves and Omni Hotels & Resorts. Two sources disagree on its size and both are reported rather than one chosen: the encyclopedia gives 264 rooms, while the property's own \"Stay\" page gives 236 rooms and 28 suites, along with 16 floors and over 20,000 square feet of meeting space. It has a two-story restaurant, rooftop hospitality suites and a pool deck with views into the ballpark. It is one of two hotels on the property. The hotel's own page could not be fetched — it returned HTTP 403 — so the room count rests on the two sources that disagree, and no street address for the hotel is published.",
        history: nil,
        photos: []
      }),
      Map.merge(@cumberland, %{
        slug: "aloft-battery-atlanta",
        name: "Aloft Atlanta at The Battery Atlanta",
        kind: "hotel",
        address: nil,
        official_url: nil,
        summary:
          "One of the two hotels listed on The Battery Atlanta's own \"Stay\" page, which the verifier re-fetched directly. Nothing beyond that listing was established: the operator's own property page returned HTTP 403, so no room count, no street address and no history for this hotel could be confirmed independently, and none is published here.",
        history: nil,
        photos: []
      }),
      Map.merge(@cumberland, %{
        slug: "coca-cola-roxy",
        name: "Coca-Cola Roxy",
        kind: "attraction",
        address: "800 Battery Avenue SE #500, Atlanta, Georgia 30339",
        official_url: "https://cocacolaroxy.com/",
        summary:
          "A concert venue at 800 Battery Avenue SE #500, operated by Live Nation, with standing-room capacity for 4,000. It hosts about 40 music and comedy shows annually and was developed with Live Nation. The Battery Atlanta's own live directory index lists it among the property's current entertainment venues.",
        history: nil,
        photos: []
      }),
      Map.merge(@cumberland, %{
        slug: "silverspot-cinema-battery-atlanta",
        name: "Silverspot Cinema",
        kind: "theater",
        address: @battery_address,
        official_url: nil,
        summary:
          "A cinema at 800 Battery Avenue SE, listed among the current entertainment venues on The Battery Atlanta's live directory index, which the verifier re-fetched independently. Silverspot's own domain could not be resolved, so the property directory is the only source.",
        history: nil,
        photos: []
      }),
      Map.merge(@cumberland, %{
        slug: "mizuno-experience-center",
        name: "Mizuno Experience Center",
        kind: "shop",
        address: @battery_address,
        official_url: nil,
        summary:
          "#{@battery} It is listed at 800 Battery Avenue SE among the retail tenants on the property's live directory index, which the verifier re-fetched independently. Mizuno's own experience-center page returned HTTP 404 when fetched directly, so no account of the centre beyond the directory listing could be verified, and none is published.",
        history: nil,
        photos: []
      }),
      Map.merge(@cumberland, %{
        slug: "baseballism-battery-atlanta",
        name: "Baseballism",
        kind: "shop",
        address: @battery_address,
        official_url: nil,
        summary:
          "#{@battery} It is listed at 800 Battery Avenue SE among the retail tenants on the property's live directory index, which the verifier re-fetched independently. What the shop sells is deliberately not described here: the verifier records that the description the finder gave \"was not independently verified on any source fetched\", and Baseballism's own retail-locations page listed no physical stores in the content retrieved.",
        history: nil,
        photos: []
      }),
      Map.merge(@cumberland, %{
        slug: "yard-house-battery-atlanta",
        name: "Yard House",
        kind: "restaurant",
        address: @battery_address,
        official_url: nil,
        summary:
          "#{@battery} It is listed at 800 Battery Avenue SE among the current dining tenants on the property's live directory index, which the verifier re-fetched independently.",
        history: nil,
        photos: []
      }),
      Map.merge(@cumberland, %{
        slug: "superica-battery-atlanta",
        name: "Superica",
        kind: "restaurant",
        address: @battery_address,
        official_url: nil,
        summary:
          "Chef Ford Fry's restaurant concept, described as such by the encyclopedia's article on The Battery Atlanta, and listed at 800 Battery Avenue SE among the current dining tenants on the property's live directory index.",
        history: nil,
        photos: []
      }),
      Map.merge(@cumberland, %{
        slug: "garden-and-gun-club-battery-atlanta",
        name: "Garden & Gun Club",
        kind: "restaurant",
        address: nil,
        official_url: nil,
        summary:
          "#{@battery} It is listed among the property's restaurant and bar tenants on The Battery Atlanta's own site, which describes it as offering specialty cocktails for evening entertainment, and it appears again on the property's current dining directory index. No dedicated page for it loaded any detail beyond that listing, and no street address for the unit is published.",
        history: nil,
        photos: []
      }),
      Map.merge(@cumberland, %{
        slug: "c-elletts-steakhouse",
        name: "C. Ellet's Steakhouse",
        kind: "restaurant",
        address: nil,
        official_url: nil,
        summary:
          "#{@battery} It is listed among the property's restaurants on The Battery Atlanta's own site, which records a Saturday jazz brunch and a jazz duo playing from 11 to 3 every Saturday and Sunday, and it appears again on the property's current dining directory index. The restaurant's own domain returned a self-signed certificate error and could not be fetched, and no dedicated page for it could be located, so no street address for the unit is published.",
        history: nil,
        photos: []
      }),
      Map.merge(@cumberland, %{
        slug: "achies-battery-atlanta",
        name: "Achie's",
        kind: "restaurant",
        address: nil,
        official_url: nil,
        summary:
          "A restaurant within the Omni Hotel at The Battery Atlanta, described by the encyclopedia as chef Hugh Acheson's eighth restaurant. That article is the only source reached for it: no dedicated property-directory page for the tenant could be loaded, its own domain could not be located, and no independent, dateable source confirming that it is open today was found. No street address for the unit is published.",
        history: nil,
        photos: []
      }),
      Map.merge(@cumberland, %{
        slug: "antico-pizza-battery-atlanta",
        name: "Antico Pizza",
        kind: "restaurant",
        address: nil,
        official_url: nil,
        summary:
          "A restaurant named by the encyclopedia among the first restaurants announced for The Battery Atlanta, and listed among the current dining tenants on the property's live directory index — evidence the verifier found and the finder had not, having looked only for a dedicated per-tenant page, which does not exist for this tenant. Antico Pizza's own domain returned no retrievable content, and no source that survived verification carries a street address for the unit, so none is published.",
        history: nil,
        photos: []
      })
    ]
  end
end
