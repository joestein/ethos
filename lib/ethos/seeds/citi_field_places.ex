defmodule Ethos.Seeds.CitiFieldPlaces do
  @moduledoc """
  Seeds the places for the Citi Field guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 New York Mets research artifact, or the text a `refuted`
  verdict's correction supplies. `docs/ballparks/citi-field.md` quotes each
  published sentence against the verdict it rests on.

  **Two towns, not one.** The ballpark and the park monuments carry a Flushing
  address; the Hall of Science, the zoo and the theatre carry a Corona one.
  Both are in Queens, and the town field follows the address each source
  gives rather than being flattened to the borough. The county is `"Queens"`,
  the borough-as-county form this corpus uses for New York City — a confirmed
  verdict records that Queens is coextensive with Queens County, and that fact
  is published in the guide rather than in the field.

  What the verification changed, and what is therefore absent here:

    * **The Queens Museum's building is one of five World's Fair survivors,
      not one of two.** The finder's "one of only two buildings surviving from
      that fair" was refuted, and the correction's number is what ships.

    * **The Queens Zoo's last-entry rule is not published.** The source states
      it as an interval before closing time, and every duration-shaped string
      is banned in this corpus — the same clause type that was dropped from
      Southport Grocery at the Wrigley checkpoint rather than widen an
      allowlist that cannot be narrowed. Note that the ban is enforced by a
      scan over module *source*, so this note cannot quote the clause either.
      The seasonal opening hours ship whole; only the interval is gone.

    * **The New York State Pavilion carries no trading claim.** Its
      `status_verdict` was deliberately left null: the source describes active
      tower repairs and nightly illumination but no public entry to the
      interior. That is uncertain, not closed, and uncertain trading does not
      block publication — it only means nothing may be said about whether it
      is open.

    * **No official URL for the Unisphere.** The nycgovparks.org page returned
      403 Forbidden, and an unreachable domain is not a verified one.

    * **No street address for the tennis center.** No source fetched stated
      one, and usopen.org's visit page timed out. The park is what the sources
      give, and the park is what is published.

  No trip duration and no distance between two places appears anywhere. Where
  a source states a spatial relationship — the Unisphere at the centre of the
  park, the museum entrance facing it, the tennis center to its north — that
  sourced wording is what is published.
  """

  alias Ethos.Places

  @flushing %{town: "Flushing", state: "New York", county: "Queens"}
  @corona %{town: "Corona", state: "New York", county: "Queens"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@flushing, %{
        slug: "citi-field",
        name: "Citi Field",
        kind: "stadium",
        address: "41 Seaver Way, Flushing, NY 11368",
        official_url: "https://www.mlb.com/mets/ballpark",
        summary:
          "The home ballpark of the New York Mets, at 41 Seaver Way in Flushing Meadows–Corona Park. It opened in 2009 with a seating capacity of 41,922. The address was changed to 41 Seaver Way in 2019 to honor Tom Seaver.",
        history:
          "Citigroup purchased naming rights in a deal announced in November 2006, paying $20 million annually over 20 years; it was, at the time, the most expensive sports-stadium naming-rights agreement ever. The ballpark's exterior design references Ebbets Field, the former home of the Brooklyn Dodgers, while its interior draws on PNC Park; it has orange foul poles and a pedestrian bridge resembling the Hell Gate Bridge. It was built adjacent to Shea Stadium and replaced it. Shea was the Mets' home from April 17, 1964 through September 28, 2008, also hosting the Jets from 1964 to 1983, the Yankees in 1974 and 1975 and the Giants in 1975, and was dismantled between October 2008 and February 2009; its former footprint is now part of Citi Field's parking lots, with plaques marking the original home plate, pitcher's mound and bases.",
        photos: []
      }),
      Map.merge(@flushing, %{
        slug: "unisphere",
        name: "Unisphere",
        kind: "historic-site",
        address: "Flushing Meadows–Corona Park, Queens, NY 11368",
        official_url: nil,
        summary:
          "A monument standing at the center of Flushing Meadows–Corona Park, with the Queens Museum entrance facing it and the Billie Jean King National Tennis Center to its north. It was built between March 6 and August 13, 1963 and dedicated in early March 1964 as the theme symbol of the 1964-65 New York World's Fair, embodying the theme \"Peace Through Understanding\". The New York City Landmarks Preservation Commission designated it a landmark in May 1995.",
        history: nil,
        photos: []
      }),
      Map.merge(@flushing, %{
        slug: "queens-museum",
        name: "Queens Museum",
        kind: "museum",
        address: "New York City Building, Flushing Meadows Corona Park, Queens, NY 11368",
        official_url: "https://queensmuseum.org/visit/",
        summary:
          "A museum founded in 1972 and housed in the former New York City Building from the 1939 World's Fair, one of five buildings that survive from that fair. Its signature exhibit is the Panorama of the City of New York, a roughly 9,335-square-foot architectural model of all five boroughs, built at 1:1200 scale as they existed in 1992. Stated hours are closed Monday and Tuesday, Wednesday to Friday noon to 5pm and Saturday and Sunday 11am to 5pm, with last ticketed gallery entry at 4:30pm. Suggested pay-what-you-wish admission is $8 for adults and $6 for seniors and students, and children 12 and under are free.",
        history: nil,
        photos: []
      }),
      Map.merge(@corona, %{
        slug: "new-york-hall-of-science",
        name: "New York Hall of Science",
        kind: "museum",
        address: "47-01 111th Street, Corona, NY 11368",
        official_url: "https://nysci.org/visit/",
        summary:
          "A science museum at 47-01 111th Street, founded in 1964 and built for the 1964 New York World's Fair. No source reached gives its current admission prices or opening hours, and neither is published here.",
        history: nil,
        photos: []
      }),
      Map.merge(@corona, %{
        slug: "queens-zoo",
        name: "Queens Zoo",
        kind: "attraction",
        address: "53-51 111th Street, Corona, NY 11368",
        official_url: "https://queenszoo.com/plan-your-visit",
        summary:
          "A zoo at 53-51 111th Street that opened on October 26, 1968, its children's farm portion having opened on February 28, 1968. It has been operated by the Wildlife Conservation Society since its 1992 reopening. Its stated 2026 hours run April 2 to October 31, Monday to Friday 10am to 5pm and weekends and federal holidays 10am to 5:30pm, and from November 1, 2026 to March 2027, daily 10am to 4:30pm.",
        history: nil,
        photos: []
      }),
      Map.merge(@flushing, %{
        slug: "usta-billie-jean-king-national-tennis-center",
        name: "USTA Billie Jean King National Tennis Center",
        kind: "attraction",
        address: "Flushing Meadows–Corona Park, Queens, NY",
        official_url: nil,
        summary:
          "A tennis facility occupying 46.5 acres of Flushing Meadows–Corona Park. It opened in 1978 and has been the home of the US Open, played annually from late August to early September, ever since. It is open to the public for play except during the US Open, junior and wood-racquet competitions. No source fetched stated a street address or ZIP code for it, and none is published here.",
        history: nil,
        photos: []
      }),
      Map.merge(@flushing, %{
        slug: "new-york-state-pavilion",
        name: "New York State Pavilion",
        kind: "historic-site",
        address: "Flushing Meadows–Corona Park, Queens, NY 11368",
        official_url: nil,
        summary:
          "A structure in Flushing Meadows–Corona Park, designed by Philip Johnson and Richard Foster with a cable-suspension roof engineered by Lev Zetlin, and built between 1962 and 1964 for the 1964 New York World's Fair. It was added to the National Register of Historic Places on November 20, 2009 and is on the New York State Register of Historic Places. A first restoration phase of structural stabilization and lighting finished in April 2023, and a second phase of tower repairs began in October 2023 with completion targeted for October 2026; the structure has been illuminated nightly since 2023. Whether the pavilion itself is open to public entry was not established by the research, and no claim either way is made here.",
        history: nil,
        photos: []
      }),
      Map.merge(@corona, %{
        slug: "queens-theatre",
        name: "Queens Theatre",
        kind: "theater",
        address: "14 United Nations Avenue South, Flushing Meadows Corona Park, Corona, NY 11368",
        official_url: "https://www.queenstheatre.org",
        summary:
          "A theatre at 14 United Nations Avenue South. Its stated box office hours are Tuesday to Friday noon to 6pm, and two hours before most ticketed events.",
        history:
          "The building began as the Theaterama at the 1964 New York World's Fair. It was converted to the Queens Playhouse in 1972 and reopened as Queens Theatre in the Park in 1993.",
        photos: []
      })
    ]
  end
end
