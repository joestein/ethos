defmodule Ethos.Seeds.AntiqueTrailGuide do
  @moduledoc """
  Seeds the Antique Trail of Connecticut guide. Idempotent by slug.

  Carries `state: "Connecticut"` and no county, so it lists on the Connecticut
  destination page rather than under one county — the trail starts in Woodbury
  and is meant to take in dealers in other towns as later research waves
  confirm them.

  Every clause here restates the text of a `confirmed` verdict from the
  2026-08-29 place-research wave's independent verification, or of a verdict
  reason that expressly authorises publishing a named clause. What the wave
  ruled `refuted` or `uncertain` is otherwise absent, and the report at
  .superpowers/sdd/2026-08-29-place-research-wave/antique-trail-report.md
  records each omission against its verdict.

  Sixteen dealers, not the seventeen researched. Adorn Vintage and Restoration
  is a Southbury business one directory mislocated here, and George Champion
  Modern rested entirely on a single unverified line in the association's
  courtesy list — the same list still carrying a company Connecticut revoked in
  2013 — with no source stating what it deals in. Both are recorded in the
  report; George Champion is a candidate for re-research.
  """

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "antique-trail-of-connecticut",
      title: "The Antique Trail of Connecticut: Woodbury's Dealers, Shop by Shop",
      destination: "Connecticut",
      state: "Connecticut",
      county: nil,
      intro: """
      Woodbury's antiques dealers share one address book. Fifteen shops and
      galleries stand on Main Street North or Main Street South, and a
      Saturday flea market sits where Route 6 meets Route 64. The Woodbury
      Antiques Dealers Association — a Connecticut nonprofit registered at 40
      Main Street North — lists them, and the Connecticut Office of Tourism
      carries many of the same addresses under a Woodbury Antiques Trail
      entry.

      This guide takes them in street-number order, Main Street North first
      and then Main Street South, and gives each dealer's address and what it
      deals in. Hours are the weak point of the record: several of these
      shops open by appointment or by chance, and several publish hours that
      contradict either themselves or the state listing. Where a source gives
      hours, this guide names the source. Telephone first.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Villa Vintiques",
          place_slug: "villa-vintiques-woodbury",
          note:
            "12 Main Street North: antique and vintage furniture, mirrors, artwork, lighting, collectibles, ceramics, and glassware, with The Silver Spur equestrian consignment upstairs."
        },
        %{
          kind: "sight",
          name: "Abrash Galleries Rugs & Antiquities",
          place_slug: "abrash-galleries-woodbury",
          note:
            "40 Main Street North: antique and semi-antique rugs — Persian, Chinese, Turkish, Indian, American Indian, hooked, and Pakistani — plus appraisals, washing, and restoration."
        },
        %{
          kind: "sight",
          name: "Schwenke Group LLC",
          place_slug: "schwenke-group-woodbury",
          note:
            "50 Main Street North: original American Federal period furniture with a written guarantee of authenticity. The dealers' association lists the business as Schwenke Group LLC; the state tourism site still uses the earlier name Thomas Schwenke, Inc."
        },
        %{
          kind: "sight",
          name: "Wayne Mattox Antiques",
          place_slug: "wayne-mattox-antiques-woodbury",
          note:
            "82 Main Street North: folk art, furniture, art pottery, primitives, collectibles, and ephemera, plus appraisals. The state tourism listing instructs visitors to call ahead."
        },
        %{
          kind: "sight",
          name: "The Coop Antiques and Collectibles",
          place_slug: "the-coop-antiques-woodbury",
          note:
            "245 Main Street North: registered as The Coop-Antiques LLC at that address, with Richard Albano as dealer. No source states a specialism."
        },
        %{
          kind: "sight",
          name: "Mill House Antiques & Gardens",
          place_slug: "mill-house-antiques-woodbury",
          note:
            "1068 Main Street North: antique furniture and decorative arts catalogued by category, plus custom furniture and restoration. Two pages of its own site give conflicting hours."
        },
        %{
          kind: "sight",
          name: "Main Street Antiques Center",
          place_slug: "main-street-antiques-center-woodbury",
          note:
            "113 Main Street South, with Peggy Heminway as proprietor. Not to be confused with Art Pappas Antiques, which trades at the Center but has its own address at 161."
        },
        %{
          kind: "sight",
          name: "Art Pappas Antiques",
          place_slug: "art-pappas-antiques-woodbury",
          note:
            "161 Main Street South: American furniture from the Pilgrim Century through mid-century modern, architectural antiques, fireplace equipment, paintings, pottery, and stoneware. Open by chance or appointment; the salvage stock is by appointment only."
        },
        %{
          kind: "sight",
          name: "G. Sergeant Antiques",
          place_slug: "g-sergeant-antiques-woodbury",
          note:
            "289 Main Street South: English, American, and Continental furniture. A member of the dealers' association, with Gary Sergeant as the named dealer."
        },
        %{
          kind: "sight",
          name: "David A. Schorsch and Eileen M. Smiles American Antiques",
          place_slug: "david-schorsch-eileen-smiles-antiques-woodbury",
          note:
            "358 Main Street South, by appointment: American antiques and folk art — weathervanes, folk paintings and sculpture, formal and country furniture, Shaker design, decoys, and Windsor chairs. The gallery publishes scholarship as well as stock."
        },
        %{
          kind: "sight",
          name: "Madeline West Antiques",
          place_slug: "madeline-west-antiques-woodbury",
          note:
            "373 Main Street South: European, American, and Asian antique art, paintings, porcelain, and furniture of the 18th to early 20th century, across five decorated rooms. Owner Cynthia Pollock is Madeline West's daughter."
        },
        %{
          kind: "sight",
          name: "Kocian DePasqua Antiques",
          place_slug: "kocian-depasqua-antiques-woodbury",
          note:
            "451 Main Street South: antiques and folk art of the 17th to 19th centuries, with an emphasis on early furniture and on form, condition, and surface. Three sources give three different sets of hours."
        },
        %{
          kind: "sight",
          name: "Farmhouse Antiques",
          place_slug: "farmhouse-antiques-woodbury",
          note:
            "495 Main Street South: primitive and country furniture and accessories, with Julie and Martin Overton as dealers."
        },
        %{
          kind: "sight",
          name: "Clapp & Tuttle Custom Framing & Fine Art",
          place_slug: "clapp-and-tuttle-woodbury",
          note:
            "742 Main Street South in the Middle Quarter — a framer, conservator, and fine art gallery rather than an antiques retailer, selling works of art on paper. One of the few on this street with fixed walk-in hours."
        },
        %{
          kind: "sight",
          name: "Pantry & Hearth Antiques",
          place_slug: "pantry-and-hearth-antiques-woodbury",
          note:
            "994 Main Street South: Pilgrim-era American furniture — Jacobean, William & Mary, Queen Anne — with period accessories, treen, painted high country furniture, and folk art. Daily by appointment, April to December, per the state tourism listing."
        },
        %{
          kind: "sight",
          name: "Woodbury Antiques and Flea Market",
          place_slug: "woodbury-antiques-and-flea-market",
          note:
            "Where Route 6 meets Route 64, run by the Kaloidis family. The state tourism site points visitors here on Saturdays; neither source describing it carries a date."
        }
      ],
      sections: [
        %{
          "heading" => "Reading the addresses",
          "body" => """
          Every dealer on this trail carries a Main Street address, and the
          Connecticut Office of Tourism gives several of them with the Route 6
          designation — 1068 Main Street North (Rte. 6), 373 Main Street South
          (Rte. 6), 451 Main Street South (Rte. 6). The numbers run
          independently on the two halves, so 12 Main Street North and 994
          Main Street South are both real addresses on the same street.

          Two of them are easy to conflate, and one directory does conflate
          them. The Main Street Antiques Center is at 113 Main Street South,
          where the Connecticut Secretary of State's principals file records
          the proprietor the dealers' association names. Art Pappas Antiques
          describes itself as trading at the Center, but its own address is
          161 Main Street South, and the state registry holds no entity of any
          kind at 161. They are two entries, not one.
          """
        },
        %{
          "heading" => "Hours, appointments, and telephones",
          "body" => """
          Several of these dealers keep no predictable walk-in hours, and the
          published record is unreliable often enough that a telephone call is
          the only dependable step.

          David A. Schorsch and Eileen M. Smiles show by appointment. Art
          Pappas Antiques is open by chance or appointment, and its
          architectural salvage is by appointment only. The Connecticut Office
          of Tourism lists Pantry & Hearth as daily by appointment with an
          April to December season, and tells visitors to Wayne Mattox
          Antiques to call ahead.

          Where sources disagree, this guide publishes no hours at all: Mill
          House Antiques & Gardens gives conflicting hours on two pages of its
          own site, Kocian DePasqua has three different patterns across three
          sources, and the Farmhouse Antiques tourism listing contradicts
          itself inside a single field. Clapp & Tuttle and Villa Vintiques
          both publish fixed hours on their own sites, and Clapp & Tuttle
          welcomes walk-ins.
          """
        },
        %{
          "heading" => "The association and its courtesy list",
          "body" => """
          The Woodbury Antiques Dealers Association is a registered
          Connecticut nonprofit with an address at 40 Main Street North. Its
          site publishes two lists, not one: a set of members, and below it a
          longer list headed "Other Woodbury Antiques Dealers Include". The
          distinction matters, because a shop on the second list is not a
          member and this guide does not call it one.

          Pantry & Hearth, G. Sergeant, Madeline West, Kocian DePasqua, David
          A. Schorsch and Eileen M. Smiles, Wayne Mattox, and Clapp & Tuttle
          appear among the members. The rest either appear on the courtesy
          list, or are carried by the association without its stating which
          list they belong to.
          """
        }
      ],
      faq: [
        %{
          "question" => "Can I walk into these shops without an appointment?",
          "answer" =>
            "Not all of them. David A. Schorsch and Eileen M. Smiles show by appointment. Art Pappas Antiques is open by chance or appointment, with its architectural salvage by appointment only. The Connecticut Office of Tourism lists Pantry & Hearth as daily by appointment. Clapp & Tuttle publishes fixed hours and welcomes walk-ins, and Villa Vintiques publishes fixed hours on its own site."
        },
        %{
          "question" => "Which shops are members of the Woodbury Antiques Dealers Association?",
          "answer" =>
            "The association's site separates its members from a longer list headed \"Other Woodbury Antiques Dealers Include\". Pantry & Hearth, G. Sergeant, Madeline West, Kocian DePasqua, David A. Schorsch and Eileen M. Smiles, Wayne Mattox, and Clapp & Tuttle appear among the members."
        },
        %{
          "question" => "Why does this guide publish so few opening hours?",
          "answer" =>
            "Because the sources contradict each other. Mill House Antiques & Gardens publishes different hours on two pages of its own site, Kocian DePasqua has three patterns across three sources, and the Farmhouse Antiques tourism listing contradicts itself in one field. Rather than pick a winner, this guide gives the telephone number."
        },
        %{
          "question" =>
            "Is the Main Street Antiques Center the same thing as Art Pappas Antiques?",
          "answer" =>
            "No. The Main Street Antiques Center is at 113 Main Street South. Art Pappas Antiques describes itself as trading at the Center but has its own address at 161 Main Street South. One directory gives the Center's address as 161; the Connecticut business registry holds no entity there at all."
        },
        %{
          "question" => "Is there a flea market?",
          "answer" =>
            "The Connecticut Office of Tourism's Woodbury Antiques Trail entry tells visitors to see the Antiques Flea Market on Saturdays where the trail crosses Route 64, and the dealers' association lists it at Route 6 and 64, run by the Kaloidis family. Neither source carries a date, so telephone 203-263-6217 before setting out."
        },
        %{
          "question" => "Is every shop on this trail an antiques dealer?",
          "answer" =>
            "No. Clapp & Tuttle Custom Framing & Fine Art at 742 Main Street South is a picture framer, conservator, and fine art gallery, selling works of art on paper rather than antiques, and it belongs to the dealers' association all the same."
        }
      ],
      photos: []
    }
  end
end
