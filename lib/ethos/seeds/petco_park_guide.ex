defmodule Ethos.Seeds.PetcoParkGuide do
  @moduledoc """
  Seeds the Petco Park guide. Idempotent by slug.

  Names the destination node `united-states/california/san-diego`, so it lists on
  the California destination page and on San Diego's. The ballparks model no
  county tier, so San Diego County is recorded here as a sourced fact rather than
  as a field. Two confirmed verdicts establish it: the encyclopedia's Petco Park
  infobox names the county directly, and its article on San Diego states verbatim
  that the city is the county seat of San Diego County. San Diego is not a
  consolidated city-county, so the two names are genuinely distinct — the city is
  what the tree carries.

  Every clause here restates text a `confirmed` verdict carries, or that the
  verifier's own reason or correction expressly states was confirmed.
  `docs/ballparks/petco-park.md` quotes each published sentence against the
  verdict it rests on and records each omission.

  What was dropped, and why:

    * **The trolley's pre-game service frequency.** It is confirmed, quoted
      exactly by the verifier from the transit operator's own page, and it
      cannot be published here. A service frequency is not a trip duration, but
      the corpus's duration gate matches the shape rather than the meaning, it
      scans module source, and its allowlist is keyed over a whole module and
      cannot be narrowed — so pardoning this clause would pardon every
      duration-shaped string in the file, including one added later. **The
      clause was dropped rather than the gate weakened**, and neither moduledoc
      can quote it for the same reason. What ships instead is that additional
      service runs after games as needed.

    * **The misattributed half of one transit item.** The finder attributed
      four facts about a station to the transit operator's page; the verifier
      found the page carries only two of them, and re-established the other two
      on the station's own encyclopedia article. Both halves ship, each
      attributed to the source that actually carries it.

    * **The source's own "one block away" phrasing** for the ballpark's
      relationship to the Gaslamp Quarter. The verifier flagged it as a
      distance claim this project would not publish, and noted that the
      research correctly stated the checkable bordering relationship instead.
      That is what appears here.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8: every trolley station named is prose.

  This research ran with its WebSearch budget exhausted before the first query.
  Its discovery substitute was the Gaslamp Quarter Association's own curated
  business directory rather than a search engine — and the verifier ruled that
  the same directory is not third-party evidence that any listed business is
  trading, which is why five of the seven places carry no such claim.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "petco-park-guide",
      title: "Petco Park: The Ballpark and the Gaslamp Quarter",
      destination: "San Diego, California",
      destination_path: "united-states/california/san-diego",
      intro: """
      Petco Park stands at 100 Park Boulevard in downtown San Diego, an address
      the encyclopedia also gives as 19 Tony Gwynn Way. The Padres have played
      there since 2004.

      This guide takes the ballpark first, then six places in and around the
      Gaslamp Quarter, and then the ballpark's own record.

      Five of those six carry no statement about whether they are open. The
      research reached each of them through its own site and, for most, through
      the Gaslamp Quarter Association's business directory, and the verifier
      ruled that a neighborhood business directory is no more third-party
      evidence of trading than the business's own page. The identities are
      settled; the trading is not, and the guide says so rather than rounding
      either way.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Petco Park",
          place_slug: "petco-park",
          note:
            "100 Park Boulevard: the Padres' home ballpark, open since 2004, designed by Populous with Antoine Predock and built at a cost of more than $450 million."
        },
        %{
          kind: "sight",
          name: "Gaslamp Museum at the Davis-Horton House",
          place_slug: "gaslamp-museum-davis-horton-house",
          note:
            "410 Island Avenue: an 1850 pre-fabricated saltbox house shipped from the East Coast, the oldest structure in the New Town area William Heath Davis helped establish."
        },
        %{
          kind: "sight",
          name: "Museum of Illusions San Diego",
          place_slug: "museum-of-illusions-san-diego",
          note:
            "665 Fifth Avenue: a museum of perspective-changing rooms, installations and optical illusions, listed in the Gaslamp Quarter Association's directory."
        },
        %{
          kind: "sight",
          name: "Gaslamp Quarter Historic District",
          place_slug: "gaslamp-quarter-historic-district",
          note:
            "A downtown historic district of over 90 mainly Victorian-era buildings, a San Diego Historic Landmark since June 2, 1978 and on the National Register since May 23, 1980."
        },
        %{
          kind: "food",
          name: "Asti Ristorante",
          place_slug: "asti-ristorante",
          note:
            "728 5th Avenue: an Italian fine-dining restaurant with a Victorian-style brick interior, an outdoor patio and private event space for up to 120 guests."
        },
        %{
          kind: "food",
          name: "Cafe Sevilla",
          place_slug: "cafe-sevilla-san-diego",
          note:
            "353 Fifth Avenue: a restaurant and tapas bar with live music and flamenco shows, an associated nightclub and private event hosting."
        },
        %{
          kind: "food",
          name: "The Field Irish Pub",
          place_slug: "the-field-irish-pub",
          note:
            "544 5th Avenue: an Irish pub whose own site tells the story of the building being shipped piece by piece from Ireland."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          San Diego's Metropolitan Transit System publishes a game-day page for
          Petco Park, and most of what follows comes from it.

          The ballpark is served by the Green Line, which riders reach by
          taking that line to the Gaslamp Quarter station, and by the UC San
          Diego Blue Line and the Orange Line, via 12th & Imperial or Park &
          Market.

          Gaslamp Quarter station is a station of the Green and Silver Lines on
          the San Diego Trolley, located between Harbor Drive and L Street and
          Fifth and Sixth Avenues in the Gaslamp Quarter; its own article
          states that Petco Park is accessible from the station.

          Park & Market is described here by two sources, because the research
          first attributed all of it to one that carries only part. MTS's own
          page states that the Blue and Orange Lines serve Park & Market and
          that it is about 0.2 miles from Petco Park. The station's own
          encyclopedia article adds that the Silver Line also serves it, and
          that it sits on Park Boulevard, formerly 12th Avenue, between Market
          Street and Island Avenue in the East Village. Each half is stated
          here on the source that actually carries it.

          MTS's game-day guide recommends taking the Rapid 215, Rapid 225 or
          Rapid 235 to the City College stop and transferring there to an
          Orange or UC San Diego Blue Line trolley for Park & Market or 12th &
          Imperial. The same page states how frequently trolleys run before
          games, and that clause cannot appear here: it is duration-shaped,
          this corpus publishes no duration-shaped string, and the ban's
          allowlist cannot be narrowed below a whole module, so the clause is
          dropped rather than the gate weakened. What the page also says, and
          what does ship, is that additional service runs after games as
          needed.

          MTS lists Park & Ride lots at stations across the Green, Blue,
          Orange, Copper and Rapid lines for Padres games. No cost is published
          for any of them except the lot at the UTC Transit Center, which MTS
          notes is a pay parking lot.

          For parking at the ballpark itself, no published cost could be
          established at all, and the obstacle was mechanical: MLB.com's
          ballpark transportation and parking pages both returned HTTP 406 to
          direct fetch, and the third-party directions page that was reachable
          names no lots and gives no prices.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          The neighborhood is the Gaslamp Quarter, and Petco Park sits in the
          adjacent East Village. The district's intensive development began in
          1867, when Alonzo Horton bought land to create a new city center on
          San Diego Bay and chose Fifth Avenue as its main street. From the
          1880s through 1916 it was known as the Stingaree, housing saloons,
          gambling halls and bordellos, and it was also San Diego's first
          Chinatown; anti-vice campaigners had it demolished and renamed in
          1916. It was designated a San Diego Historic Landmark on June 2, 1978
          and added to the National Register of Historic Places on May 23,
          1980. It holds over 90 historic buildings, primarily Victorian-era
          structures now in use as restaurants, shops and entertainment venues.
          The Gaslamp Quarter Association's own history page corroborates the
          1980 listing and records that the Association was chartered in 1982
          by the City of San Diego, under state law, as a Business Improvement
          District.

          The Gaslamp Museum at the Davis-Horton House is at 410 Island Avenue.
          The house was built in 1850, pre-fabricated in the saltbox style and
          shipped from the United States East Coast, and the encyclopedia calls
          it the oldest structure in the New Town San Diego area that William
          Heath Davis helped establish. One detail is worth keeping straight,
          because the article itself is careful about it: this particular
          building was not Davis's own house, but one of the same style and
          age. The encyclopedia describes it as open to the public as a museum,
          operated as the Gaslamp Museum at the Davis-Horton House, and the
          museum's own site gives hours of 10 a.m. to 4 p.m. from Thursday to
          Saturday, with last entry at 3:30 p.m., and states that it is the
          headquarters of the Gaslamp Quarter Historical Foundation.

          The Museum of Illusions San Diego, at 665 Fifth Avenue, describes on
          its own site perspective-changing rooms, installations and optical
          illusions, visitable by guided tour or at a self-paced visit. The
          Gaslamp Quarter Association's directory lists it as a museum at that
          address.

          Three places to eat and drink complete the set, and all three are
          described from their own accounts. Asti Ristorante, at 728 5th
          Avenue, is an Italian fine-dining restaurant with, by its own
          description, a Victorian-style brick interior, an outdoor patio and
          private event space for up to 120 guests; its site says it has been
          operating over 20 years, which is the restaurant's own claim and not
          a founding date. Cafe Sevilla, at 353 Fifth Avenue, is a restaurant
          and tapas bar with live music and flamenco shows, an associated
          nightclub and private event hosting; the Association's directory
          lists it as "Cafe Sevilla Restaurant and Tapas Bar". The Field Irish
          Pub, at 544 5th Avenue, tells on its own site the story of an Irish
          couple shipping a pub piece by piece from Ireland, and describes
          traditional Irish decor and a private party area upstairs for up to
          200 guests.

          One thing to know about the record behind these six. Only the
          historic district carries a settled status, and the reason is that it
          is a district rather than a business: the Association's site, its
          history page and its directory were all fetched live and current, and
          the question of trading does not apply to a neighborhood.

          For the other five, the evidence stops at the same place. Each was
          reached through its own site and, for four of them, through the
          Gaslamp Quarter Association's business directory — and the verifier
          ruled that the directory is not third-party evidence of trading any
          more than the business's own page is. Two of them were checked
          against that directory and are not in it at all: the Gaslamp Museum
          and The Field. The Field's site also carries a seasonal promotion,
          which reads as current and is still the pub's own account of itself.
          So this guide does not say those five are open. It does not say they
          have closed: no closure notice, dated report or successor was found
          for any of them, and none should be inferred.

          One phrase in the sources is deliberately not carried across. The
          encyclopedia describes the ballpark's relationship to the Gaslamp
          Quarter in blocks; this corpus does not publish that form, and the
          bordering relationship — Petco Park in the adjacent East Village — is
          what appears instead.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Petco Park opened in 2004, replacing San Diego Stadium — by then
          Qualcomm Stadium — where the Padres had played from their inception
          in 1969 to 2003. The first regular-season game there was on April 8,
          2004, a 4-3 win over the San Francisco Giants in ten innings.

          It was designed by Populous, then HOK Sport, with Antoine Predock
          credited for design, and cost more than $450 million, partially
          funded by a public-private partnership that included the Center City
          Development Corporation and the San Diego Redevelopment Agency. One
          of its two addresses, 19 Tony Gwynn Way, is named in honor of the
          eight-time National League batting champion who wore that uniform
          number.

          The ballpark hosted the inaugural 2006 World Baseball Classic
          championship and the 2016 Major League Baseball All-Star Game, and on
          October 9, 2024 it set a baseball attendance record with 47,773
          people present. Gallagher Square, known as the "Park at the Park", is
          a grassy berm sloping above the outfield fence in center field; when
          no game is scheduled it serves as a free local park for area
          residents.

          The franchise was established in 1969 and plays in the National
          League West. It has reached the World Series twice, in 1984 and 1998,
          losing to the Detroit Tigers and then being swept by the New York
          Yankees. The club's article describes Tony Gwynn, a Hall of Famer who
          spent his whole career with the Padres, as widely considered the
          greatest Padres player ever, and names Dave Winfield, Roberto Alomar,
          Rollie Fingers, Goose Gossage, Rickey Henderson, Trevor Hoffman, Greg
          Maddux, Willie McCovey, Fred McGriff, Gaylord Perry, Mike Piazza and
          Ozzie Smith among the other Hall of Famers who played for the
          franchise.

          The club's ownership was in transition when this research was done,
          and the record is dated rather than settled. Peter Seidler, who owned
          the team from 2012, died on November 14, 2023. Major League Baseball
          owners approved John Seidler as the club's control person on February
          6, 2025. On May 2, 2026 the Padres announced a pending sale to
          Feliciano and Kwanza Jones, which the article records as not
          finalized as of August 4, 2026.
          """
        }
      ],
      faq: [
        %{
          "question" => "How do trolleys reach Petco Park?",
          "answer" =>
            "Three lines, by MTS's own game-day page. The Green Line serves the ballpark via Gaslamp Quarter station, which sits between Harbor Drive and L Street and Fifth and Sixth Avenues, and whose own article states that Petco Park is accessible from it. The UC San Diego Blue Line and the Orange Line serve 12th & Imperial and Park & Market, the latter about 0.2 miles from the ballpark. By bus, MTS recommends the Rapid 215, 225 or 235 to the City College stop and a transfer there to an Orange or Blue Line trolley."
        },
        %{
          "question" => "What does parking cost?",
          "answer" =>
            "No source this research could reach publishes a price for parking at the ballpark, and the obstacle was mechanical: MLB.com's ballpark transportation and parking pages both returned HTTP 406 to direct fetch, and the third-party directions page that did load names no lots and no prices. For transit parking, MTS lists Park & Ride lots across the Green, Blue, Orange, Copper and Rapid lines with no cost published for any of them except the UTC Transit Center lot, which it notes is a pay parking lot."
        },
        %{
          "question" => "Which of these places is confirmed open?",
          "answer" =>
            "The ballpark, on independent evidence — an October 2024 attendance record set there and an article about a pending 2026 ownership sale that presumes the club is still playing there. The Gaslamp Quarter Historic District is an active neighborhood and business improvement district rather than a business, so the question does not apply to it. For the other five, the only sources reachable were each business's own site and, for most, the Gaslamp Quarter Association's business directory, and neither establishes that a business is trading. Two of the five are not in that directory at all. No claim is made either way, and nothing suggests closure."
        },
        %{
          "question" => "Was the Davis-Horton House William Heath Davis's home?",
          "answer" =>
            "No, and the source is careful about it, so this guide is too. The encyclopedia describes the building as the oldest structure in the New Town San Diego area that Davis helped establish, and separately states that it was not Davis's house but one of the same style and age. It was built in 1850, pre-fabricated in the saltbox style and shipped from the East Coast."
        },
        %{
          "question" => "How often do trolleys run before games?",
          "answer" =>
            "MTS's game-day page states a pre-game service frequency, and this guide cannot publish it. The corpus bans duration-shaped strings outright, the ban is enforced by scanning module source, and its allowlist is keyed over a whole module rather than a single phrase — so pardoning one frequency would pardon every duration-shaped string in that file, including any added later. The clause was dropped rather than the gate weakened. The same page also says additional service runs after games as needed, which is published above."
        }
      ],
      photos: []
    }
  end
end
