defmodule Ethos.Seeds.CitiFieldGuide do
  @moduledoc """
  Seeds the Citi Field guide. Idempotent by slug.

  Carries `state: "New York"` and `county: "Queens"` — the borough-as-county
  form this corpus uses for New York City, the same convention that puts the
  Yankee Stadium guide under "Bronx" rather than "Bronx County". A confirmed
  verdict records that Queens is coextensive with Queens County; that fact is
  published in the prose, where it is a fact, rather than in the field, where
  it would derive a hub of its own.

  `destination: "Flushing, New York"`. The ballpark's own address is a
  Flushing one, and three of this guide's places carry Corona addresses; the
  place records keep each town as its source gives it rather than flattening
  both to the borough.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-30 New York Mets research artifact, or the text a `refuted`
  verdict's correction supplies. `docs/ballparks/citi-field.md` quotes each
  published sentence against the verdict it rests on.

  What was dropped, and why:

    * **The Queens Zoo's last-entry interval is gone**, per the duration ban.
      The seasonal hours ship whole.

    * **No parking price.** A confirmed verdict records that none could be
      established from any source fetched: MLB.com's transportation and
      parking pages returned no lot names or prices and one dedicated parking
      sub-page 404'd. The satellite lots' location in Flushing Meadow Park,
      reached from College Point Boulevard, is confirmed and is published.

    * **The 2026 express-service caveat is published with its condition
      intact.** The verdict says construction at 61 St-Woodside *may* limit
      express 7 service; written as a fact it would be a stronger claim than
      the source makes.

  Transit and parking are prose in "Getting there" and mint no place records,
  per docs/site-builder.md §8.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "citi-field-guide",
      title: "Citi Field: The Ballpark and Flushing Meadows–Corona Park",
      destination: "Flushing, New York",
      state: "New York",
      county: "Queens",
      intro: """
      Citi Field stands at 41 Seaver Way in Flushing, inside Flushing
      Meadows–Corona Park in Queens. It opened in 2009 with a seating capacity
      of 41,922, and the address was changed to 41 Seaver Way in 2019 to honor
      Tom Seaver.

      The park around it is the leftover ground of two World's Fairs, and this
      guide takes the ballpark first and then what the fairs left: the
      Unisphere, the New York State Pavilion, the Queens Museum in the 1939
      New York City Building, the New York Hall of Science, the Queens Theatre
      in the old Theaterama, the Queens Zoo and the tennis center that hosts
      the US Open. Research for it was carried out from named sources fetched
      directly: English Wikipedia, the institutions' own visitor pages, the
      club's transportation pages, and a third-party schedule used to
      corroborate that the ballpark is in current use. Where the research
      could not establish something — a street address, whether a structure is
      open to entry, what parking costs — this guide leaves it out and names
      the gap.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Citi Field",
          place_slug: "citi-field",
          note:
            "41 Seaver Way: the Mets' home ballpark, opened 2009, seating capacity 41,922. Its exterior references Ebbets Field and its interior draws on PNC Park; the foul poles are orange and the pedestrian bridge resembles the Hell Gate Bridge."
        },
        %{
          kind: "sight",
          name: "Unisphere",
          place_slug: "unisphere",
          note:
            "At the center of Flushing Meadows–Corona Park: built March 6 to August 13, 1963 and dedicated in early March 1964 as the theme symbol of the 1964-65 World's Fair, for the theme \"Peace Through Understanding\". A New York City landmark since May 1995."
        },
        %{
          kind: "sight",
          name: "New York State Pavilion",
          place_slug: "new-york-state-pavilion",
          note:
            "Philip Johnson and Richard Foster, with a cable-suspension roof engineered by Lev Zetlin, built 1962-1964 for the 1964 World's Fair. On the National Register since November 20, 2009. Tower repairs began October 2023, targeted for October 2026; whether the structure is open to entry was not established."
        },
        %{
          kind: "sight",
          name: "Queens Museum",
          place_slug: "queens-museum",
          note:
            "The former New York City Building of the 1939 World's Fair, one of five buildings that survive from it. The Panorama of the City of New York — roughly 9,335 square feet at 1:1200 scale, as the city stood in 1992 — is the signature exhibit. Suggested pay-what-you-wish admission, $8 for adults."
        },
        %{
          kind: "sight",
          name: "New York Hall of Science",
          place_slug: "new-york-hall-of-science",
          note:
            "47-01 111th Street, Corona: founded in 1964 and built for that year's World's Fair. No source reached gives its current hours or admission prices."
        },
        %{
          kind: "sight",
          name: "Queens Theatre",
          place_slug: "queens-theatre",
          note:
            "14 United Nations Avenue South: the 1964 fair's Theaterama, converted to the Queens Playhouse in 1972 and reopened as Queens Theatre in the Park in 1993. Box office Tuesday to Friday noon to 6pm, and two hours before most ticketed events."
        },
        %{
          kind: "sight",
          name: "Queens Zoo",
          place_slug: "queens-zoo",
          note:
            "53-51 111th Street, Corona: opened October 26, 1968, its children's farm that February, and run by the Wildlife Conservation Society since the 1992 reopening. Stated 2026 hours are 10am to 5pm on weekdays from April 2, 10am to 5:30pm at weekends, and 10am to 4:30pm daily from November 1."
        },
        %{
          kind: "sight",
          name: "USTA Billie Jean King National Tennis Center",
          place_slug: "usta-billie-jean-king-national-tennis-center",
          note:
            "46.5 acres of Flushing Meadows–Corona Park: open since 1978 and home of the US Open, played annually from late August to early September ever since. Open to the public for play except during the US Open, junior and wood-racquet competitions."
        }
      ],
      sections: [
        %{
          "heading" => "Getting there",
          "body" => """
          The IRT Flushing Line's 7 train serves Mets–Willets Point station at
          all times, with the express <7> running during rush hours in the
          peak direction or after sporting events. The Long Island Rail Road's
          Port Washington Branch stops at a Mets–Willets Point station at the
          same location, so the two lines interchange there.

          A stairway that formerly led to Shea Stadium now leads from the
          station to Citi Field's Jackie Robinson Rotunda, and the fare
          controls between the station and the ballpark are deactivated during
          Mets games.

          Transfers to the 7 are available from the E, F, M or R at 74
          St-Broadway/Jackson Heights-Roosevelt Ave, from the N or W at
          Queensboro Plaza, and from the G by way of Court Square. The club's
          own advisory notes that construction at 61 St-Woodside may limit
          express 7 service between Queensboro Plaza and 74 Street-Broadway
          during the 2026 season, and directs readers to mta.info for updates.
          That is a stated possibility, not a confirmed service change, and it
          is published as one.

          The Q19, Q66 and Q90 buses serve Citi Field.

          Satellite parking lots are in Flushing Meadow Park, reached from
          College Point Boulevard. No published parking rate could be
          established from any source fetched: MLB.com's transportation and
          parking pages carried no lot names or prices, and one dedicated
          parking sub-page returned 404. None is given here.
          """
        },
        %{
          "heading" => "Around the ballpark",
          "body" => """
          Everything in this guide except the ballpark is a survivor of a
          World's Fair or was built for one. The Unisphere stands at the
          center of the park, the theme symbol of the 1964-65 fair, with the
          Queens Museum's entrance facing it and the tennis center to its
          north. That is the only spatial arrangement any source here states,
          and it is stated in the source's own terms.

          The Queens Museum occupies the New York City Building put up for the
          1939 fair, one of five buildings that survive from it. Its Panorama
          of the City of New York models all five boroughs across roughly
          9,335 square feet at 1:1200 scale, as the city stood in 1992.

          The New York State Pavilion is the 1964 fair's other landmark
          survivor: Philip Johnson and Richard Foster designed it, Lev Zetlin
          engineered its cable-suspension roof, and it went up between 1962
          and 1964. It has been on the National Register since November 20,
          2009 and on the New York State Register. A first restoration phase
          of structural stabilization and lighting finished in April 2023; a
          second phase of tower repairs began that October, targeted for
          October 2026. The structure has been illuminated nightly since 2023.
          Whether it is open to public entry was not established, and this
          guide does not say either way. Its Theaterama building, separately,
          is the Queens Theatre.

          Three institutions carry Corona addresses on 111th Street and its
          neighbours: the New York Hall of Science at 47-01, founded in 1964
          and built for that year's fair; the Queens Zoo at 53-51, open since
          October 26, 1968 and run by the Wildlife Conservation Society since
          its 1992 reopening; and the Queens Theatre at 14 United Nations
          Avenue South, which was the fair's Theaterama, became the Queens
          Playhouse in 1972 and reopened under its present name in 1993.

          The USTA Billie Jean King National Tennis Center takes 46.5 acres of
          the park. It opened in 1978 and has hosted the US Open annually from
          late August to early September ever since, and is open to the public
          for play except during the US Open, junior and wood-racquet
          competitions.
          """
        },
        %{
          "heading" => "The ballpark and the team",
          "body" => """
          Citi Field opened in 2009 with a seating capacity of 41,922. Citi
          Field is the ballpark's current official name; Citigroup purchased
          the naming rights in a deal announced in November 2006, paying $20
          million annually over 20 years, and it was at the time the most
          expensive sports-stadium naming-rights agreement ever. The address
          became 41 Seaver Way in 2019, to honor Tom Seaver.

          The design borrows on purpose. The exterior references Ebbets Field,
          the Brooklyn Dodgers' former home; the interior draws on PNC Park.
          The foul poles are orange and the pedestrian bridge resembles the
          Hell Gate Bridge.

          Citi Field was built adjacent to Shea Stadium and replaced it. Shea
          was the Mets' home from April 17, 1964 through September 28, 2008,
          and in that time it also hosted the Jets from 1964 to 1983, the
          Yankees in 1974 and 1975, and the Giants in 1975. It was dismantled
          between October 2008 and February 2009, and its footprint is now
          part of Citi Field's parking lots, with plaques marking the original
          home plate, pitcher's mound and bases.

          The New York Mets were founded in 1962. Steve Cohen became majority
          owner on October 30, 2020, buying the team for $2.4 billion and
          holding 95% of the franchise. In 2024 the Mets reached the National
          League Championship Series and lost to the Los Angeles Dodgers in
          six games, and in December of that year Juan Soto signed a 15-year,
          $765 million contract with the club, described as the largest
          contract in professional sports history.
          """
        }
      ],
      faq: [
        %{
          "question" => "Which trains serve Citi Field?",
          "answer" =>
            "The 7 train serves Mets–Willets Point station at all times, with the express <7> during rush hours in the peak direction or after sporting events, and the Long Island Rail Road's Port Washington Branch stops at a station of the same name in the same location. A stairway that once led to Shea Stadium now leads from the station to the Jackie Robinson Rotunda, and fare controls between station and ballpark are deactivated during Mets games. Transfers to the 7 come from the E, F, M or R at 74 St-Broadway/Jackson Heights-Roosevelt Ave, the N or W at Queensboro Plaza, or the G by way of Court Square."
        },
        %{
          "question" => "Will the express 7 be running in 2026?",
          "answer" =>
            "The club's own advisory says construction at 61 St-Woodside may limit express 7 service between Queensboro Plaza and 74 Street-Broadway during the 2026 season, and points to mta.info for updates. That is what the source states — a possibility, not a confirmed change — and this guide does not firm it up."
        },
        %{
          "question" => "What does parking cost?",
          "answer" =>
            "No published rate could be established from any source fetched. MLB.com's transportation and parking pages carried no lot names or prices and one dedicated parking sub-page returned 404, so no price appears here. What is established is where the satellite lots are: in Flushing Meadow Park, reached from College Point Boulevard."
        },
        %{
          "question" => "Can the New York State Pavilion be visited?",
          "answer" =>
            "The research could not establish it, and this guide makes no claim either way. What the source describes is a structure under active tower repairs, begun in October 2023 and targeted for completion in October 2026, illuminated nightly since 2023. It says nothing about public access to the interior. That is not evidence of closure. The pavilion's Theaterama building is a separate matter — it houses the Queens Theatre."
        },
        %{
          "question" => "What is left of the World's Fairs in the park?",
          "answer" =>
            "The Unisphere, the theme symbol of the 1964-65 fair, at the center of the park. The New York State Pavilion, built 1962-1964 for the same fair. The Queens Museum's building, the New York City Building of the 1939 fair and one of five buildings that survive from it. The New York Hall of Science, founded in 1964 and built for that year's fair. And the Queens Theatre, which was the 1964 fair's Theaterama."
        },
        %{
          "question" => "What happened to Shea Stadium?",
          "answer" =>
            "It was the Mets' home from April 17, 1964 through September 28, 2008, and also hosted the Jets from 1964 to 1983, the Yankees in 1974 and 1975 and the Giants in 1975. Citi Field was built adjacent to it and replaced it, and Shea was dismantled between October 2008 and February 2009. Its footprint is now part of Citi Field's parking lots, and plaques mark where the original home plate, pitcher's mound and bases were."
        }
      ],
      photos: []
    }
  end
end
