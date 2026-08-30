defmodule Ethos.Seeds.AngelStadiumGuide do
  @moduledoc """
  Seeds the Angel Stadium guide. Idempotent by slug.

  Carries `state: "California"` and `county: "Orange County"`, so it lists on
  both the California destination page and the Orange County one. The county is
  the one a confirmed verdict states by name, cited to the encyclopedia article
  on Anaheim; Anaheim is not an independent city, so no consolidated-city
  rendering applies.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Los Angeles Angels research artifact.
  `docs/ballparks/angel-stadium.md` quotes each published sentence against the
  verdict it rests on and records each omission.

  What was dropped, and why:

    * **One clause of the parking-entrances item**, which is `refuted`. The
      verifier's reason states that the entrances, the oversized-vehicle
      detail, the Express Entry Lane and the free Lexus Lot all confirm, and
      refutes only the finder's widening of a perk the source limits to one
      make of car. What the verifier states was confirmed is published; the
      widened clause is not, and the correction's narrower form is published in
      its place.

    * **The freeway routes**, which are `uncertain`: the cited page carried no
      freeway detail on re-fetch, a likely subpage gave a different set of
      routes, and one of the designations the finder wrote is not a valid
      route number at all.

    * **One clause of the parking item**, which is confirmed and is dropped
      anyway. It states how long before first pitch the lot opens, and this
      corpus publishes no duration-shaped string — the ban scans module source
      and its allowlist cannot be narrowed below a whole module, so the clause
      goes rather than the gate. The rates it sits beside are published in
      full. This moduledoc cannot quote the dropped clause for the same reason.

    * **A feature name.** The verifier confirmed the rock-and-water feature
      behind the left-center-field fence but recorded that its proper name was
      not reproduced verbatim on re-fetch, so the feature is described and not
      named.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: the Anaheim Regional Transportation Intermodal
  Center is prose.

  This research ran with its WebSearch budget exhausted before the first query,
  and every source below was fetched directly by name. The verifier records
  that the surroundings are consequently thinner than the transit and history
  material, and that this reflects search access rather than an absence of
  things to find. Three places is what the artifact holds; none was dropped.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "angel-stadium-guide",
      title: "Angel Stadium: The Ballpark and the Platinum Triangle",
      destination: "Anaheim, California",
      state: "California",
      county: "Orange County",
      intro: """
      Angel Stadium stands at 2000 Gene Autry Way in Anaheim, and the Los
      Angeles Angels have played there since it opened on April 19, 1966. It
      is nicknamed "The Big A".

      This guide takes the ballpark first, then the arena and the music venue
      beside it, and then the ballpark's own record. Research for it was
      carried out with the session's search budget already exhausted, from
      named sources fetched directly: English Wikipedia, MLB.com's Angels
      pages, Metrolink's own station page and the Orange County
      Transportation Authority's routes page. The verifier records that the
      surroundings are thinner than the transit and history material for that
      reason, and that the thinness is a limit of access rather than a finding
      about Anaheim.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Angel Stadium",
          place_slug: "angel-stadium-anaheim",
          note:
            "2000 Gene Autry Way: the Angels' home ballpark, open since April 19, 1966 and nicknamed \"The Big A\". It housed the NFL's Los Angeles Rams from 1980 to 1994, and the club's lease to play there was extended through 2032 on February 6, 2025."
        },
        %{
          kind: "sight",
          name: "Honda Center",
          place_slug: "honda-center-anaheim",
          note:
            "2695 East Katella Avenue: the Anaheim Ducks' arena, which the encyclopedia places northeast across California State Route 57 from Angel Stadium. The Ducks won their first Stanley Cup there on June 6, 2007."
        },
        %{
          kind: "sight",
          name: "DigAlert Grove of Anaheim",
          place_slug: "digalert-grove-of-anaheim",
          note:
            "2200 East Katella Avenue: a 1,700-capacity music venue on the northwest corner of the Angel Stadium parking lot, opened in 1998 as \"Tinseltown\" and renamed four times since."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          The ballpark's address is 2000 Gene Autry Way, Anaheim, California
          92806.

          The Anaheim Regional Transportation Intermodal Center, at 2626 East
          Katella Avenue in Anaheim's Platinum Triangle, is served by Amtrak's
          Pacific Surfliner and by Metrolink's Orange County Line. Metrolink's
          own station page for Anaheim/ARTIC lists the Orange County Line and
          no other. The encyclopedia states that one of Angel Stadium's three
          gates "can be reached southwesterly through the Douglass Road
          underpass" from ARTIC.

          On buses, the record is an absence and is published as one. No source
          this research reached identified a specific Orange County
          Transportation Authority route serving Angel Stadium itself. OCTA's
          routes-and-schedules page lists several routes serving Anaheim
          generally — 30, 38, 53, 59, 123, 129 and 553 — but none of them was
          confirmed on that page to stop at or near the ballpark, and OCTA
          directs riders to its trip planner or its phone line for a
          route-specific answer. No route is claimed here that the sources do
          not carry.

          Published day-of-game parking rates for the regular season are $25
          in person and $27 online for general parking, and $35 in person and
          $37 online for preferred parking, subject to availability. Oversized
          vehicles and buses of 20 feet or more are $100, in person only.
          Payment is by debit or credit card or by Apple Pay or Android Pay.
          Postseason and special-event rates vary from these figures. The same
          page states how far ahead of first pitch the lot opens; that clause
          is duration-shaped, this corpus publishes no duration-shaped string,
          and it is dropped rather than the gate weakened.

          Three named entrances serve the parking lot: Douglass Road, State
          College Boulevard and Orangewood Avenue. Oversized vehicles and buses
          use the Orangewood Avenue entrance, and season ticket holders have an
          Express Entry Lane also on Orangewood Avenue. A separate Lexus Lot
          offers free parking for Lexus vehicles, and the first 100 Lexus
          vehicles entering by the State College Boulevard entrance receive a
          complimentary upgrade to that lot's premium spaces. The last clause
          is the one the research got wrong: the finder wrote it as a perk for
          the first 100 vehicles generally, the verifier refuted that reading
          against the source, and the narrower form the verifier states is what
          appears here.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          Two places around the ballpark were researched, and both are on East
          Katella Avenue.

          Honda Center, at 2695 East Katella Avenue, is the home arena of the
          NHL's Anaheim Ducks. The encyclopedia states that it "lies northeast
          across California State Route 57 from Angel Stadium" — a numbered
          route rather than a gesture, which is why it is published in those
          terms. The arena opened on June 17, 1993, with a Barry Manilow
          concert on June 19, 1993 as its first event; the two dates are the
          source article's own, in its infobox and its body respectively, and
          the disagreement is reported rather than resolved. It was called
          Anaheim Arena during construction. It hosted the 2003 Stanley Cup
          Final, and the Ducks won their first Stanley Cup there on June 6,
          2007, defeating the Ottawa Senators 6-2. The NHL's own Ducks site
          currently names Honda Center as the team's arena, which is
          third-party evidence of operation rather than the arena's own
          account.

          The DigAlert Grove of Anaheim, at 2200 East Katella Avenue, is a
          1,700-capacity venue which the encyclopedia says "sits on the
          northwest corner of the parking lot of Angel Stadium of Anaheim". It
          opened in 1998 as "Tinseltown", an awards-show-themed restaurant and
          venue, became "The Sun Theatre", then "The Grove of Anaheim", and on
          January 24, 2011 became "City National Grove of Anaheim" under a
          five-year, $1.25 million naming-rights deal with City National Bank.
          The article, in its version dated August 4, 2026, gives the current
          name as "DigAlert Grove of Anaheim".

          Two limits on that last paragraph are worth stating plainly. The
          current name rests on one source, and no independent confirmation of
          it could be reached — the venue's own site does not resolve at the
          domain the finder tried, and every ticketing and listings service
          attempted was blocked or returned nothing. So this guide does not say
          the Grove is trading. It does not say it has closed either: no
          closure notice and no successor at the address was found, and none
          should be inferred.

          No official website is published for either place. Honda Center's own
          site was not fetched in either pass, and no working official site for
          the Grove could be located at all.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Ground was broken on August 31, 1964 and the ballpark opened on
          April 19, 1966, at an original construction cost of about $24
          million.

          It has carried three names. Anaheim Stadium from 1966 to 1997;
          Edison International Field of Anaheim from 1998 to 2003, under a
          naming-rights deal with the utility company; and, from an
          announcement on December 29, 2003, Angel Stadium — in full, Angel
          Stadium of Anaheim. The two forms are one unchanged name rather than
          a later renaming. Which is the more precise form for formal use today
          could not be established: MLB.com's own channels use the shorter form
          throughout, while the encyclopedia article still gives the fuller form
          as the 2003 announcement's wording.

          Football shaped the building and then left it. The Los Angeles Rams
          played there from 1980 to 1994, and a $118 million renovation between
          the 1997 and 1998 seasons returned the stadium to a baseball-only
          facility, removing the football-era infrastructure and adding
          outfield bleachers and the "California Spectacular" — geysers and a
          stream cascading down an artificial rock mountainside with real trees,
          behind the left-center-field fence — in time for the 1998 season. The
          rock formation has a name in the source; the verifier could not
          reproduce it verbatim on re-fetch, so the feature is described here
          and not named.

          The club's name has moved more than the club has. The franchise was
          founded in 1961 as the Los Angeles Angels, became the California
          Angels in 1965 ahead of the move to Anaheim, the Anaheim Angels in
          1997 after Disney acquired the club, and the Los Angeles Angels of
          Anaheim in 2005 under owner Arte Moreno — the "of Anaheim" kept to
          satisfy a lease clause requiring the city's name. In 2016 it reverted
          to Los Angeles Angels, and throughout it has played at Angel Stadium
          in Anaheim.

          On February 6, 2025 the Angels extended their lease to play at the
          ballpark through 2032.
          """
        }
      ],
      faq: [
        %{
          "question" => "Is the ballpark called Angel Stadium or Angel Stadium of Anaheim?",
          "answer" =>
            "Both, and they are the same name. On December 29, 2003 the Angels announced that the stadium would be known as Angel Stadium, in full Angel Stadium of Anaheim; the encyclopedia records that as one naming event and not two. Which form is currently preferred for formal use could not be established by this research. MLB.com's own ballpark and transportation pages use the shorter form throughout, and this guide follows them."
        },
        %{
          "question" => "Which bus route serves Angel Stadium?",
          "answer" =>
            "This research could not establish one, and says so rather than guessing. The Orange County Transportation Authority's routes-and-schedules page lists routes 30, 38, 53, 59, 123, 129 and 553 as serving Anaheim generally, but none of them is tied on that page to the ballpark, and OCTA directs riders to its trip planner or its phone line for a route-specific answer. Rail is better established: the Anaheim Regional Transportation Intermodal Center at 2626 East Katella Avenue is served by Amtrak's Pacific Surfliner and Metrolink's Orange County Line."
        },
        %{
          "question" => "What does parking cost at Angel Stadium?",
          "answer" =>
            "Published day-of-game rates for the regular season are $25 in person or $27 online for general parking, and $35 in person or $37 online for preferred parking, subject to availability. Oversized vehicles and buses of 20 feet or more are $100, in person only. Payment is by debit or credit card or by Apple Pay or Android Pay, and postseason and special-event rates vary. The lot has three named entrances — Douglass Road, State College Boulevard and Orangewood Avenue — with oversized vehicles and buses using Orangewood Avenue, where season ticket holders also have an Express Entry Lane."
        },
        %{
          "question" => "Is the DigAlert Grove of Anaheim open?",
          "answer" =>
            "This guide does not say. Its identity is established — a 1,700-capacity venue at 2200 East Katella Avenue, opened in 1998 as \"Tinseltown\" and renamed four times since — but no source outside the encyclopedia could be reached for it. The domain the finder tried for its own site does not resolve, and every ticketing and listings service attempted was blocked or returned nothing. A recently updated name field is not a statement about trading. There is no evidence the venue has closed, and none is asserted."
        },
        %{
          "question" => "Why is this guide short on places?",
          "answer" =>
            "Because the research session's search budget was reported exhausted on its very first query, before any research began, and everything below rests on sources fetched directly by name. No business-licence portal for Anaheim or Orange County could be reached as a substitute for discovery, and the listings services that would normally surface neighborhood places were blocked or empty. The verifier records the consequence in terms: the surroundings are thinner than the transit and history material because of search access, not because there is nothing around the ballpark. Three places were researched and all three are published."
        }
      ],
      photos: []
    }
  end
end
