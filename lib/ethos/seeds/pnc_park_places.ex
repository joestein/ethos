defmodule Ethos.Seeds.PncParkPlaces do
  @moduledoc """
  Seeds the places for the PNC Park guide. Idempotent: `upsert_all!/0` upserts
  by slug.

  One module per ballpark, registered in `Ethos.Seeds.Catalog`; see
  `Ethos.Seeds.WrigleyFieldPlaces` for why the set is split this way.

  Every clause published here restates the text of a `confirmed` verdict from
  the 2026-08-30 Pittsburgh Pirates research artifact, or the text a verdict's
  correction names as publishable. The verifier's own count is 30 of 46 items
  confirmed. A verdict vouches only for what its own `item` text restates, not
  for every clause of the sentence the finder wrote around it.
  `docs/ballparks/pnc-park.md` quotes each published sentence against the
  verdict it rests on, and records every omission.

  What the verification changed, and what is therefore absent here:

    * **The county fact is cited to a source that carries it.** Allegheny County
      is not modelled — these records hang from
      `united-states/pennsylvania/pittsburgh` — but the research still had to
      establish it. The finder attached
      "Allegheny County" to the Pittsburgh Pirates article; a targeted re-fetch
      found no county mention anywhere in it, and the verdict is refuted. The
      correction re-cites the fact to the PNC Park article, whose infobox names
      the "Sports & Exhibition Authority of Pittsburgh and Allegheny County",
      and to the North Shore article, which states "Allegheny County,
      Pennsylvania". The county value is unchanged; its citation is not.

    * **No museum superlative sourced to the museum.** Two were struck. The
      Andy Warhol Museum's "largest collection of Warhol art and archives in
      the world" and Kamin Science Center's "Pittsburgh's most-visited museum"
      both rested on the institution's own site, which cannot establish a
      ranking about itself. Each correction names the description that
      survives, and that description is what these records carry.

    * **No accreditation claim for the National Aviary.** The verdict is
      `uncertain`: a targeted fetch found an AZA logo and a Species Survival
      Plan reference but no textual statement of accreditation status. The
      correction directs verification against AZA's own directory before the
      claim is asserted, so it is not asserted. What the same verdict confirms
      — a zoological facility focused on birds — is published.

    * **Six of seven places carry no trading claim.** Only PNC Park's
      `status_verdict` is `open`; the other six rest on own-site evidence alone
      and are `uncertain`. Uncertain is not closed: no closure has positive
      evidence and none is asserted.

  **A note on `uncertain` verdicts that carry a correction.** Wave 1 established
  that a `refuted` verdict whose correction names publishable text ships that
  text and nothing else — the Wrigley precedent. Three verdicts in this artifact
  are `uncertain` rather than refuted while carrying the same shape of
  correction, and each verifier `reason` states in terms which clauses were
  confirmed verbatim and which were not. Those named clauses are treated the
  same way: the confirmed part ships, the unestablished part does not.
  `docs/ballparks/pnc-park.md` records each one.
  """

  alias Ethos.Places

  @pittsburgh %{destination_path: "united-states/pennsylvania/pittsburgh"}

  def upsert_all! do
    Enum.map(places(), &Places.upsert_place!/1)
  end

  def places do
    [
      Map.merge(@pittsburgh, %{
        slug: "pnc-park",
        name: "PNC Park",
        kind: "stadium",
        address: "115 Federal Street, Pittsburgh, PA 15212",
        official_url: "https://www.mlb.com/pirates/ballpark",
        summary:
          "The home ballpark of the Pittsburgh Pirates, at 115 Federal Street in Pittsburgh's North Side / North Shore area. The Pirates, a National League Central club, have played their home games here on the banks of the Allegheny River since 2001. It is a two-deck ballpark, the first built in the United States since 1953, constructed with a Kasota limestone facade and steel over a natural Kentucky bluegrass playing surface. The home dugout is positioned along the third-base line so the Downtown Pittsburgh skyline is visible behind the field. Seating capacity is 38,747.",
        history:
          "Groundbreaking was on April 7, 1999 and the ballpark opened on March 31, 2001, after roughly 24 months of construction. Kansas City-based Populous, then HOK Sport, designed it in collaboration with L.D. Astorino & Associates. PNC Financial Services purchased the naming rights in August 1998 for $30 million over 20 years, and a 2021 extension runs the agreement through 2031. Four statues stand at the ballpark: Honus Wagner, first unveiled at Forbes Field in 1955, at the home plate entrance; Roberto Clemente, originally installed outside Three Rivers Stadium in 1994 and relocated here after that stadium's demolition; Willie Stargell, unveiled on April 7, 2001; and Bill Mazeroski, added at the right-field entrance on Mazeroski Way during the 2010 season. The Roberto Clemente Bridge, formerly the Sixth Street Bridge, stands near the southeast corner of the site. Three published rankings name the ballpark: the ESPN.com writer Jim Caple ranked it the best stadium in Major League Baseball with a score of 95 out of 100, a 2017 Washington Post panel ranked it the second-best, and ABC News named it among America's 7 Best Ballparks in 2010.",
        photos: []
      }),
      Map.merge(@pittsburgh, %{
        slug: "andy-warhol-museum",
        name: "The Andy Warhol Museum",
        kind: "museum",
        address: "117 Sandusky Street, Pittsburgh, PA 15212",
        official_url: "https://www.warhol.org/",
        summary:
          "A museum at 117 Sandusky Street that explores Andy Warhol's life and legacy through its collection of his art and archives. It stands in Pittsburgh's North Shore neighborhood, the same neighborhood as PNC Park and Acrisure Stadium. Its founding and opening dates were not present in any page fetched for this research.",
        history: nil,
        photos: []
      }),
      Map.merge(@pittsburgh, %{
        slug: "kamin-science-center",
        name: "Kamin Science Center",
        kind: "museum",
        address: "One Allegheny Avenue, Pittsburgh, PA 15212",
        official_url: "https://kaminsciencecenter.org/",
        summary:
          "A science museum at One Allegheny Avenue featuring five floors of interactive STEM exhibits. Its own site states that it was formerly named the Carnegie Science Center. The USS Requin (SS 481), a Cold War-era submarine, is on display at the facility. The institution's exact founding year could not be established from any source fetched for this research.",
        history: nil,
        photos: []
      }),
      Map.merge(@pittsburgh, %{
        slug: "national-aviary",
        name: "National Aviary",
        kind: "attraction",
        address: "700 Arch Street, Pittsburgh, PA 15212",
        official_url: "https://www.aviary.org/",
        summary:
          "A zoological facility focused on birds, at 700 Arch Street. Its own site references 46 years of Andean Condor conservation work, which indicates decades of operation, but gives no specific founding date and none could be established elsewhere.",
        history: nil,
        photos: []
      }),
      Map.merge(@pittsburgh, %{
        slug: "mattress-factory",
        name: "Mattress Factory",
        kind: "museum",
        address: "509 Jacksonia Street, Pittsburgh, PA 15212",
        official_url: "https://mattress.org/",
        summary:
          "An artist-centered contemporary art museum and international residency program focused on installation art, at 509 Jacksonia Street. It holds a Greer Lankton Collection. Its founding date and institutional history were not present in any page fetched for this research.",
        history: nil,
        photos: []
      }),
      Map.merge(@pittsburgh, %{
        slug: "federal-galley",
        name: "Federal Galley",
        kind: "restaurant",
        address: "200 Children's Way, Pittsburgh, PA 15212",
        official_url: "https://federalgalley.org/",
        summary:
          "A food hall at 200 Children's Way housing four restaurant concepts under one roof with a full-service bar and shared community seating: Triple S Cafe, Burghdawg, Mijo and PGH Dumplingz. Its opening date could not be established from any source fetched for this research.",
        history: nil,
        photos: []
      }),
      Map.merge(@pittsburgh, %{
        slug: "rivers-casino-pittsburgh",
        name: "Rivers Casino & The Landing Hotel",
        kind: "hotel",
        address: "777 Casino Drive, Pittsburgh, PA 15212",
        official_url: "https://www.riverscasino.com/pittsburgh/",
        summary:
          "A casino and hotel property on Pittsburgh's North Shore, at 777 Casino Drive, with gaming tables, slot machines, a sportsbook, dining and an event center. Its opening date could not be established, and no source fetched for this research states any spatial relationship between it and PNC Park, so none is given.",
        history: nil,
        photos: []
      })
    ]
  end
end
