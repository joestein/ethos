defmodule Ethos.Seeds.ComericaParkGuide do
  @moduledoc """
  Seeds the Comerica Park guide. Idempotent by slug.

  Names the destination node `united-states/michigan/detroit`, so it lists on the
  Michigan destination page and on Detroit's. The ballparks model no county tier,
  so Wayne County is recorded here as a sourced fact rather than as a field, and
  two confirmed verdicts carry it: *"Comerica Park's address is
  2100 Woodward Avenue, Detroit, Michigan, Wayne County"* and *"Detroit is the
  county seat of Wayne County"*, the latter cited to the Detroit article that
  states it.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 Detroit Tigers research artifact, or the text a `refuted` verdict's
  correction names as publishable. `docs/ballparks/comerica-park.md` quotes each
  published sentence against the verdict it rests on and records each omission.

  What was dropped, and why:

    * **No standard parking price**, because there is none to publish. A
      confirmed verdict records that the Tigers do not publish pricing for
      standard general or reserved parking online. What *is* published — the
      $60 pass for group buses and oversized vehicles, and the SpotHero
      partnership with no lot names or prices — is stated as the source states
      it.

    * **No eight tiger statues at the gate.** One 15-foot statue stands at the
      main entrance; eight more are spread through the park, two of them on the
      left-field scoreboard. The finder conflated the two groups and the
      verifier caught it by asking the source to quote itself.

    * **No trading claim for four of the eleven places.** The Fox Theatre and
      The Fillmore Detroit, Cliff Bell's and Grand Trunk Pub each rest on an
      operator's or a business's own site, or on undated encyclopedia prose.
      None of that is evidence of closure, and none is stated as such.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: no station, no garage and no bus route becomes a
  page. Grand Circus Park is a place because it is a park with its own historic
  district; the People Mover station of the same name is not.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "comerica-park-guide",
      title: "Comerica Park: The Ballpark and Woodward Avenue Around It",
      destination: "Detroit, Michigan",
      destination_path: "united-states/michigan/detroit",
      intro: """
      Comerica Park stands at 2100 Woodward Avenue in downtown Detroit, in Wayne
      County. The Detroit Tigers, of the American League Central, have been
      based there since 2000, and the first game was played on April 11 of that
      year.

      The ballpark's name has a dated expiry, and this guide publishes it that
      way: Fifth Third Bank completed its acquisition of Comerica Bank on
      February 1, 2026, and the ballpark's own encyclopedia article says it will
      be rebranded before the 2027 season. As of August 2026 the name is
      Comerica Park.

      This guide takes the ballpark first, then the theatres, bars, parks and
      churches along Woodward Avenue, and then the team's own record. Research
      for it was carried out from named sources fetched directly: English
      Wikipedia, Historic Detroit, the venues' own and operators' sites, and
      MLB.com's own parking page. Four of the eleven places rest on a business's
      or an operator's own site alone, and this guide does not say those four
      are trading.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Comerica Park",
          place_slug: "comerica-park",
          note:
            "2100 Woodward Avenue: the Tigers' home since 2000, opened April 11, 2000 against the Seattle Mariners at a cost of $300 million. Capacity 41,083 as of 2018; 342 feet to left, 412 to center, 330 to right; the Chevrolet Fountain behind center field."
        },
        %{
          kind: "sight",
          name: "Fox Theatre",
          place_slug: "fox-theatre-detroit",
          note:
            "2211 Woodward Avenue: a 1928 C. Howard Crane theatre in an Art Deco style blending Burmese, Indian, Persian, Chinese and Hindu motifs. A National Historic Landmark since 1989, operated by 313 Presents and owned by Olympia Entertainment."
        },
        %{
          kind: "sight",
          name: "The Fillmore Detroit",
          place_slug: "the-fillmore-detroit",
          note:
            "2115 Woodward Avenue: built in 1925 as The State Theatre, another C. Howard Crane design, in the Francis Palms Building. Rebranded by Live Nation in 2007 with Fergie's June 13 show; 2,900 capacity, with the State Bar & Grill on a separate entrance."
        },
        %{
          kind: "food",
          name: "Cliff Bell's",
          place_slug: "cliff-bells",
          note:
            "2030 Park Avenue: a jazz club opened in 1935, closed in 1985, reopened in 2005 and renovated in 2006, serving food and a bar menu alongside live jazz in an Art Deco setting."
        },
        %{
          kind: "food",
          name: "Elwood Bar & Grill",
          place_slug: "elwood-bar-and-grill",
          note:
            "300 East Adams Avenue: a 1936 Streamline Moderne building by Charles Noble, moved here at the Forbes family's expense when Comerica Park's construction threatened it in 1997, and rededicated on Opening Day, April 5, 2002."
        },
        %{
          kind: "food",
          name: "Grand Trunk Pub",
          place_slug: "grand-trunk-pub",
          note:
            "612 Woodward Avenue: an American restaurant and bar serving fish and chips, chicken and waffles, reubens, and an extensive Michigan craft beer selection."
        },
        %{
          kind: "sight",
          name: "Grand Circus Park",
          place_slug: "grand-circus-park-detroit",
          note:
            "Woodward Avenue between Clifford, John R and Adams Streets: roughly 5 acres from Judge Augustus Woodward's post-1805 plan, established in 1850 and built out in 1867, with the Russell Alger Memorial Fountain by Henry Bacon."
        },
        %{
          kind: "sight",
          name: "Campus Martius Park",
          place_slug: "campus-martius-park",
          note:
            "Woodward Avenue at Michigan Avenue: 1.2 acres re-established and dedicated on November 19, 2004, with two performance stages, sculptures and a seasonal ice rink, run by the Detroit 300 Conservancy."
        },
        %{
          kind: "sight",
          name: "Central United Methodist Church",
          place_slug: "central-united-methodist-church-detroit",
          note:
            "23 East Adams Street: a congregation tracing to 1804, in a Tudor and Gothic Revival building whose cornerstone was laid July 3, 1866, with a 1936 sanctuary in carved Appalachian white oak and a 30-foot reredos."
        },
        %{
          kind: "sight",
          name: "St. John's Episcopal Church",
          place_slug: "st-johns-episcopal-church-detroit",
          note:
            "2326 Woodward Avenue: a Victorian Gothic Revival church consecrated December 10, 1861, 170 by 65 feet with a 105-foot belfry, still using the traditional 1928 Book of Common Prayer."
        },
        %{
          kind: "sight",
          name: "Little Caesars Arena",
          place_slug: "little-caesars-arena",
          note:
            "2645 Woodward Avenue: opened September 5, 2017 in the District Detroit, home of the Red Wings and the Pistons, with PWHL Detroit due to begin play there in 2026."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          Public transportation to Comerica Park runs on two rail systems and
          three bus routes. The Detroit People Mover serves the ballpark at its
          Broadway and Grand Circus Park stations. The QLine streetcar serves it
          at the Montcalm Street stop. Bus service includes SMART FAST Michigan
          261 and Woodward 461 and 462, and DDOT Route 4.

          On parking, the Tigers publish some of it and not the rest. Official
          general parking lots are open to the public on a first-come,
          first-served basis and open two hours before game time. Pricing for
          standard general and reserved parking is not published by the Tigers
          online, so no such price appears here. Reserved spaces exist for
          season ticket holders and suite guests, on (313) 471-2255. Passes for
          group buses and oversized vehicles are $60 per vehicle, bought through
          the Group Sales Department on (313) 471-BALL or at Lot 4 on arrival,
          and limited to Tigers games only. The club also lists a partnership
          with SpotHero for advance parking reservations, without naming lots or
          stating prices.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          Woodward Avenue is the street this guide follows. The ballpark is at
          2100; the theatres, bars, parks and churches around it are numbered
          along the same avenue and the streets off it.

          Two theatres by the same architect stand on Woodward Avenue, at 2211
          and at 2115. The Fox Theatre, at 2211 Woodward Avenue, opened in 1928 to C. Howard
          Crane's design, an Art Deco interior blending Burmese, Indian,
          Persian, Chinese and Hindu motifs; it was listed on the National
          Register of Historic Places in 1985, designated a National Historic
          Landmark in 1989 and made a Michigan State Historic Site in 1991, and
          313 Presents operates it for its owner, Olympia Entertainment. The
          Fillmore Detroit, at 2115 Woodward Avenue, was built in 1925 as The
          State Theatre, also by Crane, in a Beaux-Arts Italian Renaissance
          style within the Francis Palms Building; it passed through the names
          Palms-State Theatre, Palms Theatre and State Theatre before Live
          Nation rebranded it in 2007, with Fergie playing the inaugural show on
          June 13. The twelve-story building holds 2,900 people and contains the
          State Bar & Grill, which has its own entrance. It has been on the
          National Register since November 24, 1982.

          The bars each carry a piece of the city's building history. Cliff
          Bell's, at 2030 Park Avenue, opened as a jazz club in 1935, closed in
          1985, reopened in 2005 and was renovated in 2006, and it continues to
          host jazz performances in an Art Deco setting alongside a food and bar
          menu. Elwood Bar & Grill, at 300 East Adams Avenue, occupies a
          Streamline Moderne building designed by Charles Noble and built in
          1936 at the corner of Elizabeth and Woodward; Chuck Forbes bought it
          in the 1980s, and when Comerica Park's construction threatened it in
          1997 the Forbes family moved the building at their own expense to its
          present address, rededicating it on Detroit Tigers Opening Day, April
          5, 2002. Grand Trunk Pub, at 612 Woodward Avenue, is an American
          restaurant and bar serving fish and chips, chicken and waffles,
          reubens, and an extensive Michigan craft beer selection.

          Two public squares come from the same plan. Judge Augustus Woodward
          laid out Detroit's rebuilding after the 1805 fire, and both Grand
          Circus Park and Campus Martius Park descend from it. Grand Circus
          Park, on Woodward Avenue between Clifford, John R and Adams Streets,
          was established in 1850 and built out in 1867; roughly 5 acres,
          bisected by Woodward, with the Russell Alger Memorial Fountain by the
          architect Henry Bacon, and a People Mover station of the same name
          serving it. Its historic district went on the National Register in
          1983, with boundary expansions in 2000 and 2012. Campus Martius Park,
          at Woodward and Michigan Avenues, was the plan's focal point and takes
          its name from the square in Marietta, Ohio; the original was lost in
          the 1900s to vehicular traffic, and the re-established 1.2-acre park
          was dedicated on November 19, 2004, with two performance stages,
          sculptures and a seasonal ice rink. The Detroit 300 Conservancy runs
          it, and it hosts the annual Motown Winter Blast and the city's
          Christmas tree-lighting.

          Two churches on the same stretch predate all of it. Central United
          Methodist Church, at 23 East Adams Street, has a congregation tracing
          to 1804; the First Methodist Society of Michigan, formed in 1810, was
          the first organized Protestant congregation in Michigan Territory, and
          the current building's cornerstone was laid on July 3, 1866. Gordon W.
          Lloyd and Smith, Hinchman & Grylls designed it in Tudor Revival and
          Gothic Revival; the sanctuary was redesigned in 1936 with carved
          Appalachian white oak and a 30-foot reredos, and Henry Lee Willett
          Studios stained glass was added in 1956. It became a Michigan State
          Historic Site in 1977 and joined the National Register in 1982, and it
          houses social-service organizations alongside an active congregation.
          St. John's Episcopal Church, at 2326 Woodward Avenue, was established
          as a parish in 1858 by Henry Porter Baldwin, later Michigan's governor
          and a U.S. senator; a 150-seat chapel of 1859 proved too small and
          Jordan & Anderson's larger church was consecrated on December 10,
          1861. It is Victorian Gothic Revival, 170 by 65 feet with a 105-foot
          belfry, in rubble limestone with Kelly Island sandstone trim, with six
          memorial stained-glass windows installed between 1880 and 1954. It
          joined the National Register in 1982 and became a Michigan State
          Historic Site in 1987, and its congregation still uses the traditional
          1928 Book of Common Prayer.

          Little Caesars Arena, at 2645 Woodward Avenue, opened on September 5,
          2017 in Midtown Detroit as part of the District Detroit sports and
          entertainment district, near the Cass Corridor. It is home to the
          Detroit Red Wings of the NHL and the Detroit Pistons of the NBA, and
          PWHL Detroit is set to begin play there in 2026.

          One thing to know about the record behind the venues. The Fox Theatre,
          The Fillmore Detroit, Cliff Bell's and Grand Trunk Pub each rest on a
          business's or an operator's own site, or on undated encyclopedia
          prose, for any evidence that they are trading now. So this guide does
          not say those four are open. It does not say they have closed either:
          there is no evidence of that, and none should be inferred. Elwood Bar
          & Grill is the one bar here whose status comes from somewhere else —
          Historic Detroit, an independent architectural-history site, carries a
          status field for the building reading "Open", updated in April 2026.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Comerica Park cost $300 million to build, and its first game was
          played on April 11, 2000 against the Seattle Mariners. Populous —
          formerly HOK Sport — SHG Inc. and the Rockwell Group were the
          architects. Capacity was 41,083 as of 2018, and the recorded baseball
          attendance record is 45,280, set on July 26, 2008 against the Chicago
          White Sox. The field measures 342 feet to left, 412 to center and 330
          to right.

          The name has changed hands on paper twice, and is about to change
          again. Comerica Bank secured the naming rights in December 1998,
          agreeing to pay $66 million over 30 years, and extended the agreement
          in 2018 through 2034. Fifth Third Bank then acquired Comerica Bank —
          announced October 6, 2025, completed February 1, 2026, a $10.9 billion
          deal that made Fifth Third the ninth-largest U.S. bank with about $294
          billion in assets — and the ballpark's own encyclopedia article states
          that it will be rebranded before the 2027 season. Fifth Third's own
          article corroborates the acquisition but does not discuss the naming
          rights. As of August 2026 the ballpark is Comerica Park.

          Two features have their own history. A large fountain sits behind
          center field: General Motors sponsored it from 2000 to 2008, and it
          became the Chevrolet Fountain when GM's sponsorship returned in 2010.
          And the tigers, which are more scattered than they are often
          described: one 15-foot tiger statue stands at the main entrance, and
          eight additional heroic-sized tiger statues are placed throughout the
          park, two of them prowling atop the left-field scoreboard.

          The players are marked twice over. A statue of Ty Cobb stands without
          a retired number, because he played before Tigers players wore
          numbers. At the left-center field concourse are statues of nearly all
          Tigers players whose numbers have been retired; Jackie Robinson's
          number, retired league-wide in 1997, is instead on the wall in
          right-center field.

          The franchise itself was established in 1894 as a member of the
          minor-league Western League and became a charter member of the
          major-league American League in 1901.
          """
        }
      ],
      faq: [
        %{
          "question" => "Is the ballpark still called Comerica Park?",
          "answer" =>
            "As of August 2026, yes. Comerica Bank secured the naming rights in December 1998 for $66 million over 30 years and extended the agreement in 2018 through 2034. Fifth Third Bank's acquisition of Comerica Bank was announced on October 6, 2025 and completed on February 1, 2026, and the ballpark's own encyclopedia article states that it will be rebranded before the 2027 season. This guide publishes the current name and the pending change together rather than guessing at the new one."
        },
        %{
          "question" => "How do you reach Comerica Park on public transit?",
          "answer" =>
            "The Detroit People Mover serves the ballpark at its Broadway and Grand Circus Park stations, and the QLine streetcar serves it at the Montcalm Street stop. Bus service includes SMART FAST Michigan 261 and Woodward 461 and 462, and DDOT Route 4."
        },
        %{
          "question" => "What does parking cost at the ballpark?",
          "answer" =>
            "For standard general and reserved parking, the Tigers do not publish pricing online, so no price appears here. Official general lots are open to the public first-come, first-served and open two hours before game time. Reserved spaces exist for season ticket holders and suite guests, on (313) 471-2255. Passes for group buses and oversized vehicles are $60 per vehicle, bought through the Group Sales Department on (313) 471-BALL or at Lot 4 on arrival, and limited to Tigers games only. The club also lists a SpotHero partnership for advance reservations, without naming lots or stating prices."
        },
        %{
          "question" => "How many tiger statues are at Comerica Park?",
          "answer" =>
            "One at the main entrance, 15 feet tall, and eight more of heroic size placed throughout the park, two of them prowling atop the left-field scoreboard. The research's first draft put all eight at the entrance; verification asked the source to quote its own tiger-statue sentences and found the single entrance statue and the separate group of eight described apart, with two of that group on the scoreboard rather than at the gate."
        },
        %{
          "question" => "Which of these places is confirmed open?",
          "answer" =>
            "Elwood Bar & Grill has the strongest independent evidence: Historic Detroit, an architectural-history site rather than the business's own, carries a current-status field reading \"Open\", updated April 2026. The parks, the churches, the arena and the ballpark are all independently described as active. The Fox Theatre, The Fillmore Detroit, Cliff Bell's and Grand Trunk Pub are not confirmed either way — the only evidence reached for them was an operator's booking calendar, a business's own site, or undated encyclopedia prose. That is a gap in the record, not evidence of closure."
        },
        %{
          "question" => "Is there a parking garage under Grand Circus Park?",
          "answer" =>
            "This guide does not say. The research recorded one built in 1957, but a targeted re-fetch of the cited source did not return that claim at all and it could not be independently checked, so it is left out. The Russell Alger Memorial Fountain and Henry Bacon as its designer, which appeared in the same research sentence, were confirmed and do appear here."
        }
      ],
      photos: []
    }
  end
end
