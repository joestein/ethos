defmodule Ethos.Seeds.ChaseFieldPlaces do
  @moduledoc """
  Seeds the places for the Chase Field guide. Idempotent: `upsert_all!/0`
  upserts by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates text a `confirmed` verdict in the
  2026-08-30 Arizona Diamondbacks research artifact carries, or that the
  verifier's own reason or correction expressly states was confirmed. A
  finder's refuted item never ships as written.
  `docs/ballparks/chase-field.md` quotes each published sentence against the
  verdict it rests on, and records every omission.

  ## Three trading claims rested on quotations that do not exist

  This artifact repeats the defect the Tampa Bay research made famous in this
  project, three times over, and the verifier caught all three by full-text
  search:

    * **Herberger Theater Center** — the finder quoted the article as saying
      the venue "remains active". The word "active" appears in that article
      zero times. **Downgraded to uncertain; no trading claim is made here.**

    * **Pizzeria Bianco** — the finder said the article "states the restaurant
      remains operational". It does not: the verifier re-fetched specifically
      to check and found past tense throughout, adding that a recent edit
      timestamp on an encyclopedia article *"only shows the page was touched,
      not why"*. **Downgraded to uncertain; no trading claim is made here.**

    * **Rosson House Museum** — the finder put "remains open to the public as a
      museum" in quotation marks; that exact string is not in the article.
      Unlike the other two, the article does carry a genuine present-tense
      sentence about the house being operated as a museum with public tours, so
      **the status stands** — but on the real sentence, and the invented
      quotation is not published as a quote anywhere.

  No closure evidence exists for any of the three, and none is asserted.

  ## What else is absent

    * **No street address for Matt's Big Breakfast.** Two sources give
      different street numbers on the same street and the verifier's
      `could_not_establish` names the question as open. Both numbers are
      published in the record; neither is placed in the address field as
      though settled.

    * **No parking rates or garage names**, on an explicit
      `could_not_establish`: the club's own transportation subpages returned
      HTTP 406 to every fetch.

  **The arena next to this ballpark is called the Mortgage Matchup Center, and
  that is not a mistake.** The verifier flagged it deliberately: *"This is a
  real, dated 2025 renaming, not a hallucinated venue name — verified worth
  flagging as such given how implausible it reads."* It was the Footprint
  Center before 2025.

  The county on every record is `"Maricopa County"`, and the citation for it was
  corrected during verification. See `Ethos.Seeds.ChaseFieldGuide`.
  """

  alias Ethos.Places

  @phoenix %{town: "Phoenix", state: "Arizona", county: "Maricopa County"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@phoenix, %{
        slug: "chase-field",
        name: "Chase Field",
        kind: "stadium",
        address: "401 East Jefferson Street, Phoenix, Arizona 85004",
        official_url: "https://www.mlb.com/dbacks/ballpark",
        summary:
          "The home ballpark of the Arizona Diamondbacks, at 401 East Jefferson Street in Phoenix. It opened on March 31, 1998 as Bank One Ballpark and was renamed Chase Field in 2005, after JPMorgan Chase acquired the naming rights following the Bank One and JPMorgan Chase merger. Capacity has been 48,330 since 2023. It has a retractable roof and a signature swimming pool, which together let spectators avoid Phoenix's summer heat and monsoon storms.",
        history:
          "Bank One purchased the ballpark's naming rights for $100 million over 30 years before it opened on March 31, 1998. The Diamondbacks franchise was established on March 9, 1995 and began play in 1998 as a National League expansion team; in 2001 it beat the three-time defending champion New York Yankees to win the World Series, which the source describes as making it the fastest expansion team in Major League Baseball history to do so.",
        photos: []
      }),
      Map.merge(@phoenix, %{
        slug: "mortgage-matchup-center-phoenix",
        name: "Mortgage Matchup Center",
        kind: "attraction",
        address: "201 East Jefferson Street, Phoenix, Arizona 85004",
        official_url: "https://www.mortgagematchupcenter.com",
        summary:
          "The downtown Phoenix arena at 201 East Jefferson Street, home to the Phoenix Suns of the NBA and the Phoenix Mercury of the WNBA. It has carried its current name since 2025; the encyclopedia gives the full naming history ending \"Mortgage Matchup Center (2025-present)\", and the venue's own site names itself the same way at the same address. The name is a real, dated 2025 renaming rather than a transcription error, which is worth stating because it is the sort of name a reader may assume is wrong.",
        history: nil,
        photos: []
      }),
      Map.merge(@phoenix, %{
        slug: "rosson-house-museum",
        name: "Rosson House Museum",
        kind: "museum",
        address: "113 North 6th Street, Phoenix, Arizona",
        official_url: nil,
        summary:
          "A Victorian-era mansion at 113 North 6th Street, at the corner of Monroe Street in downtown Phoenix, within Heritage Square. It was built in 1894 and 1895 in the Stick-Eastlake Queen Anne style of Victorian architecture, and was added to the National Register of Historic Places on June 3, 1971. The City of Phoenix purchased the property in 1974 and restored it, and the Heritage Square Foundation and Guild operates the restored house as a historic house museum in the city's Heritage and Science Park, offering public tours.",
        history: nil,
        photos: []
      }),
      Map.merge(@phoenix, %{
        slug: "arizona-science-center",
        name: "Arizona Science Center",
        kind: "museum",
        address: "600 Washington Street, Phoenix, Arizona",
        official_url: nil,
        summary:
          "A science center at 600 Washington Street, in downtown Phoenix's Heritage and Science Park. It was conceived in 1980 as a pilot science center by the Junior League of Phoenix and opened to the public in 1984 as the Arizona Museum of Science & Technology. It relocated in 1997 to its current 120,000-square-foot facility, designed by the architect Antoine Predock. As of April 2026, Tammy Stewart is the center's Hazel A. Hare President and CEO, and in October 2025 the center opened the renovated Dorrance DOME, an 8K-plus resolution LED dome display.",
        history: nil,
        photos: []
      }),
      Map.merge(@phoenix, %{
        slug: "herberger-theater-center",
        name: "Herberger Theater Center",
        kind: "theater",
        address: "222 East Monroe Street, Phoenix, Arizona",
        official_url: nil,
        summary:
          "An indoor performing-arts venue at 222 East Monroe Street in downtown Phoenix, with three stages — Center Stage, Stage West and the Performance Outreach, or Kax, Stage — which opened in 1989 and was conceived as part of the redevelopment of downtown Phoenix. It is named after G. Robert Herberger, founder of the Herberger's department store chain. The source credits it with more than 40 different performances a year, drawing about 175,000 patrons and 30,000 school children annually; neither the source nor this record attaches a date to those figures. Whether the theater is operating today is not established: the evidence the research offered for it was a quotation that does not appear in the article it was attributed to, and no dated independent confirmation could be found.",
        history: nil,
        photos: []
      }),
      Map.merge(@phoenix, %{
        slug: "pizzeria-bianco-heritage-square",
        name: "Pizzeria Bianco",
        kind: "restaurant",
        address: "623 East Adams Street, Phoenix, Arizona",
        official_url: nil,
        summary:
          "A pizzeria whose original downtown Phoenix location is at 623 East Adams Street. The restaurant was established in 1987 and moved to this Heritage Square location in 1996. Chef Chris Bianco won a James Beard Foundation award for best Southwest Chef in 2003, and the source describes him as the only pizza chef to have won a regional James Beard award; the restaurant received a Zagat score of 29 in 2000. Further locations opened in the Biltmore area of Phoenix in 2013 and in Los Angeles in 2022. Whether the Adams Street restaurant is trading today is not established: the article that covers it is written in the past tense throughout and states nothing about current operation.",
        history: nil,
        photos: []
      }),
      Map.merge(@phoenix, %{
        slug: "matts-big-breakfast-phoenix",
        name: "Matt's Big Breakfast",
        kind: "cafe",
        address: nil,
        official_url: "https://mattsbigbreakfast.com/",
        summary:
          "A scratch-cooking breakfast-and-lunch restaurant that opened in downtown Phoenix in late October 2004, and whose own site gives hours of 7am to 2pm daily. Its street address is published here as an open question rather than a value: its own site gives 817 N 1st Street, Phoenix, Arizona 85004, while the Phoenix New Times restaurant directory gives 825 N. First Street, and no source reached settles which is correct. That directory credits the restaurant with the paper's Best Breakfast or a related award in its annual Best of Phoenix poll in 2012, 2013, 2014, 2015, 2016, 2018 and 2019. It carries nothing dated later than 2019, and no source independent of the restaurant confirms that it is trading today.",
        history: nil,
        photos: []
      })
    ]
  end
end
