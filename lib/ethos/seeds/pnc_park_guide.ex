defmodule Ethos.Seeds.PncParkGuide do
  @moduledoc """
  Seeds the PNC Park guide. Idempotent by slug.

  Carries `state: "Pennsylvania"` and `county: "Allegheny County"`, so it lists
  on both the Pennsylvania destination page and the Allegheny County one. The
  county comes from the verdict, and specifically from the verdict's
  *correction*: the finder cited the Pittsburgh Pirates article for "Allegheny
  County" and a targeted re-fetch found no county mention anywhere in it, so
  that verdict is refuted. The correction re-cites the fact to the PNC Park
  article — whose infobox names the "Sports & Exhibition Authority of Pittsburgh
  and Allegheny County" — and to the North Shore article, which states
  "Allegheny County, Pennsylvania". The value is right and the finder's citation
  was not.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Pittsburgh Pirates research artifact, or the text a verdict's
  correction names as publishable. `docs/ballparks/pnc-park.md` quotes each
  published sentence against the verdict it rests on and records each omission.

  What was dropped, and why:

    * **No parking rate, and no surface-lot names.** The parking verdict is
      `uncertain`. Confirmed on the cited Sports & Exhibition Authority page:
      the North Shore Garage, its three named entrances, the absence of any
      published rate, and the referral to ALCO Parking Corporation and
      ParkPGH.org. Not confirmed: the named surface lots, none of which appear
      on that page. The correction directs dropping them, and they are dropped.

    * **No trading claim for six of the seven places.** Only PNC Park's status
      is confirmed open. The museums, the aviary, the food hall and the casino
      hotel rest on their own sites alone. None of that is evidence of closure,
      and none is stated as such.

    * **No superlative sourced to the institution claiming it.** The Warhol
      Museum's world-largest-collection claim and Kamin Science Center's
      most-visited-museum claim were both struck for that reason. The three
      rankings that do appear — ESPN, the Washington Post panel, ABC News — are
      third-party rankings of the ballpark carried by confirmed verdicts.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: no station, no garage and no bus route becomes a
  page.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "pnc-park-guide",
      title: "PNC Park: The Ballpark and the North Shore Around It",
      destination: "Pittsburgh, Pennsylvania",
      state: "Pennsylvania",
      county: "Allegheny County",
      intro: """
      PNC Park stands at 115 Federal Street on Pittsburgh's North Shore, on the
      banks of the Allegheny River. It opened on March 31, 2001, and the
      Pittsburgh Pirates have played their home games there since.

      This guide takes the ballpark first, then the museums, food hall and
      casino hotel around it, and then the team's own record. Research for it
      was carried out from named sources fetched directly: English Wikipedia,
      the institutions' and businesses' own sites, Pittsburgh Regional Transit
      and North Shore Connector articles, MLB.com, and the Pittsburgh Sports &
      Exhibition Authority's own facility page. Six of the seven places here
      rest on their own websites alone, and this guide does not say those six
      are trading — it does not say they have closed either, and there is no
      evidence of that.
      """,
      entries: [
        %{
          kind: "sight",
          name: "PNC Park",
          place_slug: "pnc-park",
          note:
            "115 Federal Street: the Pirates' home ballpark, open since March 31, 2001. A two-deck ballpark, the first built in the United States since 1953, in Kasota limestone and steel, seating 38,747, with the home dugout on the third-base line so the Downtown skyline sits behind the field."
        },
        %{
          kind: "sight",
          name: "The Andy Warhol Museum",
          place_slug: "andy-warhol-museum",
          note:
            "117 Sandusky Street: a museum exploring Andy Warhol's life and legacy through its collection of his art and archives, in the same North Shore neighborhood as the ballpark and Acrisure Stadium."
        },
        %{
          kind: "sight",
          name: "Kamin Science Center",
          place_slug: "kamin-science-center",
          note:
            "One Allegheny Avenue: five floors of interactive STEM exhibits, formerly named the Carnegie Science Center, with the Cold War-era submarine USS Requin (SS 481) on display."
        },
        %{
          kind: "sight",
          name: "National Aviary",
          place_slug: "national-aviary",
          note:
            "700 Arch Street: a zoological facility focused on birds. Its own site references 46 years of Andean Condor conservation work; no founding date is given by any source fetched."
        },
        %{
          kind: "sight",
          name: "Mattress Factory",
          place_slug: "mattress-factory",
          note:
            "509 Jacksonia Street: an artist-centered contemporary art museum and international residency program focused on installation art, holding a Greer Lankton Collection."
        },
        %{
          kind: "food",
          name: "Federal Galley",
          place_slug: "federal-galley",
          note:
            "200 Children's Way: a food hall of four restaurant concepts under one roof — Triple S Cafe, Burghdawg, Mijo and PGH Dumplingz — with a full-service bar and shared community seating."
        },
        %{
          kind: "stay",
          name: "Rivers Casino & The Landing Hotel",
          place_slug: "rivers-casino-pittsburgh",
          note:
            "777 Casino Drive: a casino and hotel property on the North Shore with gaming tables, slot machines, a sportsbook, dining and an event center."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          The North Side light-rail station, underground near General Robinson
          Street, serves PNC Park. It is one of two stations that opened on the
          North Shore Connector in spring 2012, the other being the elevated
          Allegheny station near Acrisure Stadium; Allegheny station serves
          visitors to Acrisure Stadium and to the Carnegie Science Center, which
          its own site now gives as the Kamin Science Center.

          The North Shore Connector carries the Pittsburgh Regional Transit
          light rail system's Blue, Red and Silver lines under the Allegheny
          River, from Downtown's Gateway station to the North Side and Allegheny
          stations. The light rail operates a pay-on-entry / pay-on-exit system
          with a Downtown / North Shore free-fare zone, and trips within that
          zone — which covers PNC Park — do not require a fare.

          Pittsburgh Regional Transit also operates roughly 95 bus routes across
          Allegheny County on a flat-fare structure, which replaced zone-based
          fares in 2017. Fares are payable by ConnectCard smart card or cash,
          and time-based transfers are valid across bus and rail.

          On foot from Downtown, the crossing is a bridge. The North Shore
          borders Downtown Pittsburgh via the Roberto Clemente, Andy Warhol and
          Rachel Carson bridges. The Roberto Clemente Bridge, formerly the Sixth
          Street Bridge, stands near the southeast corner of the ballpark site
          and is closed to vehicular traffic on game days to allow spectators to
          park downtown and walk to the stadium.

          By car, PNC Park is close to Interstate 279 exit 1B and within one
          mile of Interstates 376 and 579. On parking the record stops short of
          a price. The Pittsburgh Sports & Exhibition Authority, which manages
          North Shore parking, lists a North Shore Garage entered from Sandusky
          Street, Lacock Street or General Robinson Street; its page publishes
          no rate and directs inquiries to ALCO Parking Corporation or
          ParkPGH.org, and no cost could be confirmed from either. The same page
          does not name the individual surface lots the research first
          attributed to it, so none is named here.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          The North Shore is a Pittsburgh neighborhood of zip code 15212, and it
          holds Acrisure Stadium, PNC Park and the Andy Warhol Museum at 117
          Sandusky Street. Much of the modern neighborhood, including the land
          under Acrisure Stadium and the Kamin Science Center, was built on the
          former Smoky Island — also called Killbuck Island — in the Allegheny
          River, which had gradually disappeared by the late 19th century.

          Four institutions carry the neighborhood's cultural weight. The Andy
          Warhol Museum explores Warhol's life and legacy through its collection
          of his art and archives. The Kamin Science Center, at One Allegheny
          Avenue, offers five floors of interactive STEM exhibits and has the
          Cold War-era submarine USS Requin (SS 481) on display; its own site
          records that it was formerly the Carnegie Science Center. The National
          Aviary, at 700 Arch Street, is a zoological facility focused on birds
          and references 46 years of Andean Condor conservation work. The
          Mattress Factory, at 509 Jacksonia Street, is an artist-centered
          contemporary art museum and international residency program focused on
          installation art, and holds a Greer Lankton Collection.

          Federal Galley, at 200 Children's Way, is a food hall of four
          restaurant concepts under one roof — Triple S Cafe, Burghdawg, Mijo
          and PGH Dumplingz — with a full-service bar and shared community
          seating. Rivers Casino & The Landing Hotel, at 777 Casino Drive, is a
          casino and hotel property with gaming tables, slot machines, a
          sportsbook, dining and an event center.

          Two things about the record behind all of this. First, no source
          fetched for this guide states any distance or spatial relationship
          between the casino hotel and PNC Park, so none is given; the research
          declined to invent one and so does this guide. Second, six of these
          seven places rest on their own websites alone for evidence that they
          are trading, and an institution's own site is not independent
          confirmation. So this guide does not say they are open. It does not
          say they have closed either: there is no evidence of that, and none
          should be inferred. Telephone first.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          PNC Park broke ground on April 7, 1999 and opened on March 31, 2001,
          after roughly 24 months of construction. Kansas City-based Populous,
          then trading as HOK Sport, designed it in collaboration with L.D.
          Astorino & Associates. PNC Financial Services had bought the naming
          rights in August 1998 for $30 million over 20 years; a 2021 extension
          runs the agreement through 2031, which is why the ballpark still
          carries that name.

          The building itself is a two-deck ballpark, the first built in the
          United States since 1953, in a Kasota limestone facade and steel over
          a natural Kentucky bluegrass playing surface. Its home dugout is
          positioned along the third-base line so that the Downtown Pittsburgh
          skyline is visible behind the field. Seating capacity is 38,747.

          Four statues stand around it. Honus Wagner's was first unveiled at
          Forbes Field in 1955 and now stands at the home plate entrance.
          Roberto Clemente's was installed outside Three Rivers Stadium in 1994
          and moved here after that stadium's demolition. Willie Stargell's was
          unveiled on April 7, 2001. Bill Mazeroski's was added at the
          right-field entrance, on Mazeroski Way, during the 2010 season.

          Three published rankings name the ballpark, and all three are other
          people's rankings rather than the club's own. The ESPN.com writer Jim
          Caple ranked PNC Park the best stadium in Major League Baseball with a
          score of 95 out of 100. A 2017 Washington Post panel ranked it the
          second-best. ABC News named it among America's 7 Best Ballparks in
          2010.

          The Pittsburgh Pirates compete in Major League Baseball as a member of
          the National League Central Division and have played their home games
          at PNC Park since 2001.
          """
        }
      ],
      faq: [
        %{
          "question" => "Which trains and buses serve PNC Park?",
          "answer" =>
            "The North Side light-rail station, underground near General Robinson Street, serves the ballpark; it and the elevated Allegheny station near Acrisure Stadium opened on the North Shore Connector in spring 2012. The Connector carries Pittsburgh Regional Transit's Blue, Red and Silver light rail lines under the Allegheny River from Downtown's Gateway station. Pittsburgh Regional Transit also runs roughly 95 bus routes across Allegheny County on a flat fare, payable by ConnectCard or cash, with time-based transfers valid across bus and rail."
        },
        %{
          "question" => "Is the light rail free to the ballpark?",
          "answer" =>
            "Within one zone, yes. Pittsburgh Regional Transit's light rail operates a pay-on-entry / pay-on-exit system with a Downtown / North Shore free-fare zone, and trips within that zone — which covers PNC Park — do not require a fare."
        },
        %{
          "question" => "What does parking cost at PNC Park?",
          "answer" =>
            "No source fetched for this guide states a published rate. The Pittsburgh Sports & Exhibition Authority, which manages North Shore parking, lists a North Shore Garage entered from Sandusky Street, Lacock Street or General Robinson Street; the page publishes no rate and directs inquiries to ALCO Parking Corporation or ParkPGH.org, and no cost could be confirmed from either. An earlier draft of the research named individual surface lots on that page; a re-fetch found none of those names there, so none appears here."
        },
        %{
          "question" => "Can you walk to the ballpark from Downtown?",
          "answer" =>
            "The North Shore borders Downtown Pittsburgh via the Roberto Clemente, Andy Warhol and Rachel Carson bridges. The Roberto Clemente Bridge, formerly the Sixth Street Bridge, stands near the southeast corner of the ballpark site and is closed to vehicular traffic on game days to allow spectators to park downtown and walk to the stadium."
        },
        %{
          "question" =>
            "Why does this guide not call the Warhol Museum's collection the largest in the world?",
          "answer" =>
            "Because the only source for that ranking is the museum's own site, and a business or institution's own site cannot establish a superlative about itself. The verdict was refuted and its correction names what survives: the museum explores Warhol's life and legacy through its collection of his art and archives. The same rule struck Kamin Science Center's description of itself as Pittsburgh's most-visited museum; its five floors of interactive STEM exhibits, which is a description rather than a ranking, still publishes."
        },
        %{
          "question" => "Is the National Aviary accredited?",
          "answer" =>
            "This guide does not say. A fetch targeted at the aviary's own site found an AZA logo and a reference to the AZA Species Survival Plan Program in a conservation context, but no textual statement of accreditation status, so the verdict is uncertain and its correction directs verification against the Association of Zoos and Aquariums' own accredited-facility directory. That check was not made, so no accreditation is asserted here."
        },
        %{
          "question" => "Why does this guide not say whether these places are open?",
          "answer" =>
            "Because the evidence does not reach that far for six of the seven. Only PNC Park's trading status is confirmed. The Andy Warhol Museum, Kamin Science Center, the National Aviary, the Mattress Factory, Federal Galley and Rivers Casino & The Landing Hotel each rest on their own website alone, which is not independent confirmation. None of that is evidence of closure, and none is stated as such."
        }
      ],
      photos: []
    }
  end
end
