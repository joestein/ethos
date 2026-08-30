defmodule Ethos.Seeds.RateFieldGuide do
  @moduledoc """
  Seeds the Rate Field guide. Idempotent by slug.

  Carries `state: "Illinois"` and `county: "Cook County"`, so it lists on both
  the Illinois destination page and the Cook County one — the same county hub
  the Wrigley Field guide lists on, which is correct: both ballparks are in
  Chicago.

  **The county citation, checked.** The artifact's own `could_not_establish`
  names the weakness before anyone else could: no source fetched states the
  county in one sentence alongside the ballpark or the neighborhood by name. Two
  confirmed verdicts carry it between them — *"Armour Square is one of Chicago's
  77 community areas and is in Cook County"*, cited to the Armour Square article,
  and *"Chicago is the county seat of Cook County; a small part of the city
  (O'Hare) sits in DuPage County, which does not apply here"*, cited to the
  Chicago article. A third confirmed verdict places the ballpark in Armour
  Square. Each link is independently sourced, and the O'Hare exception is
  disposed of by the verdict itself rather than left to a reader.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Chicago White Sox research artifact, or the text a `refuted`
  verdict's correction names as publishable. `docs/ballparks/rate-field.md`
  quotes each published sentence against the verdict it rests on and records each
  omission.

  What was dropped, and why:

    * **"Four addresses" became "at least seven".** The finder wrote that CHISOX
      CORPORATION holds Commercial Garage licences at four addresses. Re-querying
      the same API with the same filter returned seven. Nothing named was wrong;
      the exhaustive count was. The correction's wording — "at least seven" —
      is what ships, with all seven named.

    * **No trading claim for five of six places.** A Chicago business licence in
      AAI status persists until expiry whether or not the business is trading,
      so it establishes a licensee, an activity and a dated act, and no more.

    * **No architectural style for the ballpark**, on the explicit instruction of
      a `could_not_establish` entry.

    * **No parking price.** No source fetched states one, and the licence
      register carries licensees rather than rates.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: no station, no garage and no bus route becomes a
  page — which matters here, because the artifact names nine licensed garages
  and two rail stations and none of them is a page.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "rate-field-guide",
      title: "Rate Field: The Ballpark and 35th Street Around It",
      destination: "Chicago, Illinois",
      state: "Illinois",
      county: "Cook County",
      intro: """
      Rate Field stands at 333 West 35th Street on Chicago's South Side, in the
      Armour Square community area next to Bridgeport. It opened on April 18,
      1991 as Comiskey Park II and is the home of the Chicago White Sox.

      The name is the first thing to get right. The ballpark was Guaranteed Rate
      Field from 2017 to 2024 and the name was shortened to Rate Field in
      December 2024, following Guaranteed Rate's corporate rebrand. The longer
      name is still the one most references produce.

      This guide takes the ballpark first, then the businesses and the old
      ballpark's marker along 35th Street, and then the team's own record.
      Research for it was carried out from named sources fetched directly:
      English Wikipedia, an independent ballpark directory, the City of
      Chicago's business licence API, and one business's own site. Five of the
      six places here rest on that licence register alone, and a licence is not
      evidence that a business is trading — so this guide does not say those
      five are open.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Rate Field",
          place_slug: "rate-field",
          note:
            "333 West 35th Street: the White Sox' home ballpark, open since April 18, 1991 as Comiskey Park II, renamed four times and shortened to Rate Field in December 2024. Capacity 40,615 since the 2004 renovation, on Kentucky Bluegrass, owned and operated by the Illinois Sports Facilities Authority."
        },
        %{
          kind: "food",
          name: "ChiSox Bar & Grill",
          place_slug: "chisox-bar-and-grill",
          note:
            "320 West 35th Street, Armour Square: carried in the City of Chicago's licence register under ILLINOIS SPORTSERVICE, INC. with Retail Food Establishment, Outdoor Patio and Consumption on Premises licences."
        },
        %{
          kind: "food",
          name: "Cork and Kerry on 33rd",
          place_slug: "cork-and-kerry-on-33rd",
          note:
            "3258 South Princeton Avenue, Armour Square: carried in the City's licence register under Chicago Pizza Department Corp., licensed for food and on-premises liquor consumption through June 15, 2028."
        },
        %{
          kind: "food",
          name: "35th Street Red Hots",
          place_slug: "35th-street-red-hots",
          note:
            "500 West 35th Street, Bridgeport: carried in the City's licence register under 35TH STREET REDHOTS LLC with a Retail Food Establishment licence. No liquor licence was found under this name at this address."
        },
        %{
          kind: "sight",
          name: "Bridgeport Art Center",
          place_slug: "bridgeport-art-center",
          note:
            "1200 West 35th Street, Bridgeport: a multi-disciplinary creative building whose own site describes three galleries, studios, a Fashion Design Center, the Chicago Ceramic Center and two event venues."
        },
        %{
          kind: "sight",
          name: "Old Comiskey Park home plate marker",
          place_slug: "old-comiskey-park-home-plate-site",
          note:
            "324 West 35th Street: a marble plaque marking the home plate of the original Comiskey Park, 503 feet due north of the current one, with the old foul lines painted on the asphalt. The park stood from July 1, 1910 to September 30, 1990 and was demolished in 1991."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Two rail stations serve the ballpark, on two different systems.

          Sox-35th station, at 142 West 35th Street, is on the CTA Red Line,
          situated in the median of the Dan Ryan Expressway in the Armour Square
          neighborhood. Its own article states that it serves Rate Field, the
          stadium of the Chicago White Sox, and that it originally served the
          now-demolished Comiskey Park. It opened on September 28, 1969 along
          with the other eight stations on the Dan Ryan branch, and its station
          sign formerly read "35-Sox Park". The station has one island platform
          and two tracks, with dual entrances via the 35th Street and 33rd
          Street overpasses, and elevators and escalators to platform level. The
          CTA bus routes connecting there are 24 Wentworth and 31 31st, both
          weekdays only, 35 31st/35th, and 39 Pershing.

          The Metra Rock Island Line's 35th Street station, at 106 West 35th
          Street in Bronzeville, is described by its own article as located east
          of Rate Field.

          On parking, what the record holds is a licence register rather than a
          rate. CHISOX CORPORATION holds current City of Chicago Commercial
          Garage licences, all in AAI status and expiring May 15, 2028, at at
          least seven addresses: 333 West 35th Street, 355 West 35th Street, 355
          West 37th Street, 3440 South Wentworth Avenue, 3415 South Shields
          Avenue, 3411 South Normal Avenue and 360-380 West Pershing Road. Two
          further commercial garages are licensed on the same block of West 35th
          Street — DIAMOND GROUP 35, LLC at 510-518 West 35th Street and TRIPLE
          CROWN ENTERTAINMENT, LLC at 500 West 35th Street — both in AAI status
          and current through at least 2028.

          Two things that register does not carry. It states no price for any of
          those garages, and no source fetched for this guide states one, so
          none is published. And a licence in AAI status persists until expiry
          whether or not a garage is operating, so this guide records who is
          licensed where, and does not say that any of them is open on a given
          day.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          West 35th Street is the spine, and the addresses run along it: the
          ballpark at 333, ChiSox Bar & Grill at 320, 35th Street Red Hots at
          500, Bridgeport Art Center at 1200, and the old ballpark's marker at
          324. Cork and Kerry on 33rd is at 3258 South Princeton Avenue. Each of
          these sits in the Armour Square community area or in Bridgeport, the
          neighborhood the ballpark's own article names next to it.

          ChiSox Bar & Grill, at 320 West 35th Street, appears in the City of
          Chicago's licence register under ILLINOIS SPORTSERVICE, INC., with
          Retail Food Establishment, Outdoor Patio and Consumption on Premises -
          Incidental Activity licences. Whether the White Sox organization
          itself operates it or Illinois Sportservice does so as a contracted
          concessionaire is not stated by any source fetched, and no history,
          opening date or menu exists beyond the licence record.

          Cork and Kerry on 33rd, at 3258 South Princeton Avenue, is carried
          under the legal name Chicago Pizza Department Corp., licensed for food
          and for on-premises liquor consumption, with a fee paid on May 2, 2026
          and licensure continuing through June 15, 2028. Its own domain does
          not resolve, so nothing about its founding or history could be
          established.

          35th Street Red Hots, at 500 West 35th Street in Bridgeport, is
          carried under 35TH STREET REDHOTS LLC with a Retail Food Establishment
          licence and nothing else; no liquor licence was found under that name
          at that address, so whether it serves alcohol is not established here.

          Bridgeport Art Center, at 1200 West 35th Street, describes itself on
          its own site as a multi-disciplinary creative home with three
          galleries, studios, a Fashion Design Center, the Chicago Ceramic
          Center and two event venues. The licence register carries EAST BANK
          STORAGE ON 35TH STREET, INC., doing business as Bridgeport Art Center,
          with Outdoor Patio, Consumption on Premises and Public Place of
          Amusement licences, a fee paid on September 15, 2025 and licensure
          through January 15, 2028. The building's construction date and its
          former use could not be established: the operator's own site describes
          timber construction, exposed brick and hardwood floors but gives no
          build year and names no former tenant, and no independent source for
          the building's history was reachable.

          The marker for the old ballpark is at 324 West 35th Street. Original
          Comiskey Park stood there, designed by Zachary Taylor Davis with
          Osborn Engineering, opened on July 1, 1910, closed on September 30,
          1990 and demolished in 1991; the site became a parking lot. A marble
          plaque marks the old home plate, across from Rate Field, with the foul
          lines painted on the asphalt, and the marked plate is 503 feet due
          north of the current home plate. No historic-landmark designation for
          the site or the plaque was found, and no source dated to 2026 confirms
          that the plaque and painted lines are still physically present.

          One thing to know about the record behind all of this. The City of
          Chicago's licence register is real, queryable and reproducible — two
          independent re-queries during verification matched the research's
          figures exactly, down to dates and dollar amounts. What it cannot do
          is say that a business is trading today, because an AAI licence stands
          until it expires whether the doors are open or not. So this guide
          publishes who is licensed at which address, with the dates, and stops
          there. It does not say those five places are open, and it does not say
          they have closed: there is no evidence of that, and none should be
          inferred.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Rate Field opened on April 18, 1991 as Comiskey Park II. The original
          building cost US$137 million, approximately $324 million in 2025
          dollars, and HOK Sport — now Populous — designed it. The Illinois
          Sports Facilities Authority owns and operates it, and the playing
          surface is Kentucky Bluegrass.

          The upper deck is the design decision the ballpark is known for. HOK
          Sport set it back over the lower deck so that the stands rose fairly
          gradually, which gave nearly every upper-level seat an unobstructed
          view but produced one of the highest upper decks in baseball, and the
          upper deck did not connect to the lower-deck concourse. A renovation
          program from 2001 to 2007 addressed it at a combined cost of $118
          million: Phase III in 2003 cost approximately $20 million, and Phase
          IV in 2004 cost approximately $28 million and removed eight rows and
          6,600 seats from the top of the upper deck, cutting capacity from
          47,098 to 40,615. A flat roof, elevated 20 feet above the seating
          area, replaced the old sloped canopy-style roof and covers 13 of the
          21 rows of seating. In 2016 three new HD video boards went in at a
          cost of $7.3 million, the center-field board measuring 60 feet by 134
          feet, or 8,000 square feet.

          The name has changed four times. It opened as Comiskey Park II. U.S.
          Cellular purchased the naming rights in 2003 for US$68 million over 20
          years and then paid $13 million to end the agreement seven years
          early. Guaranteed Rate purchased them in a 13-year deal announced on
          October 31, 2016, paying $20.4 million over the first ten years, and
          the ballpark was Guaranteed Rate Field from 2017 to 2024. In December
          2024 the name was shortened to Rate Field after Guaranteed Rate's
          corporate rebrand.

          The old ballpark is 503 feet away and still marked. The stadium was
          built across 35th Street from the original Comiskey Park, which was
          demolished to make room for a parking lot; a marble plaque on the
          sidewalk indicates where Old Comiskey's home plate stood, with the
          foul lines painted in the lot. Bill Veeck's exploding scoreboard, whose
          pinwheels he installed during his ownership periods of 1959 to 1961
          and 1976 to 1981, was among the last structures demolished, along with
          the center field bleachers. It was in that park, on July 12, 1979,
          that Disco Demolition Night ended with fans storming the field after a
          crate of disco records was detonated between games of a doubleheader;
          attendance was officially reported at 47,795, though Veeck estimated
          50,000 to 55,000 in the park, and the American League president Lee
          MacPhail ordered the second game forfeited to the Detroit Tigers 9-0.
          That unplayed game remains the last American League game to be
          forfeited.

          The club itself was established in 1894 as the Sioux City Cornhuskers,
          moved to Chicago in 1900 as the Chicago White Stockings, and was
          renamed the White Sox in 1904. It has played in the American League
          Central Division since 1994 and has won three World Series titles, in
          1906, 1917 and 2005; the 2005 title ended an 88-year drought described
          at the time as the longest MLB championship drought in the American
          League.

          Between the first two titles came the scandal that defines the
          franchise's early history. In the 1919 World Series against the
          Cincinnati Reds, eight White Sox players — Arnold "Chick" Gandil,
          Eddie Cicotte, Oscar "Happy" Felsch, "Shoeless" Joe Jackson, Fred
          McMullin, Charles "Swede" Risberg, George "Buck" Weaver and Claude
          "Lefty" Williams — conspired with gamblers to fix the series, which
          Cincinnati won; the White Sox lost Game Eight, and the series, on
          October 9, 1919. The newly appointed commissioner Judge Kenesaw
          Mountain Landis banned all eight for life on August 3, 1921, writing
          that regardless of the verdict of juries, no player who throws a ball
          game will ever play professional baseball.

          Two more recent entries in the record. The team recorded its 20th
          no-hitter on April 14, 2021, when Carlos Rodon pitched against
          Cleveland. And in 2024 it lost 21 consecutive games, from July 10 to
          August 5, becoming the first team since the 1988 Baltimore Orioles to
          lose 20 consecutive games.
          """
        }
      ],
      faq: [
        %{
          "question" => "Is it Rate Field or Guaranteed Rate Field?",
          "answer" =>
            "Rate Field. The ballpark was Guaranteed Rate Field from 2017 to 2024, and the name was shortened in December 2024 following Guaranteed Rate's corporate rebrand. One caveat is worth stating: the White Sox' own site returned HTTP 406 to every fetch during this research and could not corroborate the current name from the operator, so no rename more recent than December 2024 could be ruled out."
        },
        %{
          "question" => "Which trains and buses serve the ballpark?",
          "answer" =>
            "Sox-35th station on the CTA Red Line, at 142 West 35th Street in the median of the Dan Ryan Expressway, whose own article states that it serves Rate Field; it opened on September 28, 1969 and has one island platform, two tracks, entrances via the 35th Street and 33rd Street overpasses, and elevators and escalators to platform level. The CTA bus routes connecting there are 24 Wentworth and 31 31st, both weekdays only, 35 31st/35th, and 39 Pershing. The Metra Rock Island Line's 35th Street station, at 106 West 35th Street in Bronzeville, is described as located east of Rate Field."
        },
        %{
          "question" => "What does parking cost at the ballpark?",
          "answer" =>
            "No source fetched for this guide states a price, so none is published. What the record does hold is the City of Chicago's licence register: CHISOX CORPORATION holds current Commercial Garage licences at at least seven addresses around the ballpark, all in AAI status and expiring May 15, 2028, and two further garages on the same block of West 35th Street are licensed to DIAMOND GROUP 35, LLC and TRIPLE CROWN ENTERTAINMENT, LLC. That register names licensees, not rates."
        },
        %{
          "question" => "How many garages does the ballpark's operator hold licences for?",
          "answer" =>
            "At least seven. The research first said four — 333 West 35th Street, 355 West 35th Street, 360-380 West Pershing Road and 3415 South Shields Avenue — and verification re-queried the same register with the same filter and found three more: 355 West 37th Street, 3440 South Wentworth Avenue and 3411 South Normal Avenue. Nothing in the original four was wrong; the exhaustive count was, which is why this guide says \"at least\"."
        },
        %{
          "question" => "Why does this guide not say whether the bars are open?",
          "answer" =>
            "Because a Chicago business licence cannot establish it. An AAI licence stands until it expires whether or not the business is trading, so the register establishes a licensee, a licensed activity and a dated act — a fee paid on a particular day — and nothing about today. No independent present-tense source was reachable for ChiSox Bar & Grill, Cork and Kerry on 33rd, 35th Street Red Hots or Bridgeport Art Center. None of that is evidence of closure, and none is stated as such. Rate Field itself is the one place here published as operating, and on different evidence: a maintained encyclopedia article's present-tense statement that the club plays its home games there."
        },
        %{
          "question" => "What marks the original Comiskey Park?",
          "answer" =>
            "A marble plaque on the sidewalk, across from Rate Field, marking where the old home plate stood — 503 feet due north of the current one — with the old foul lines painted on the asphalt of the parking lot that replaced the ballpark. The original Comiskey Park stood at 324 West 35th Street from July 1, 1910 to September 30, 1990 and was demolished in 1991. No source dated to 2026 confirms that the plaque and the painted lines are still physically present, and no historic-landmark designation for the site was found."
        }
      ],
      photos: []
    }
  end
end
