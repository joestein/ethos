defmodule Ethos.Seeds.ScenicBywaysCollections do
  @moduledoc """
  Seeds the four Connecticut scenic roads that run through three or more towns.

  The state designates scenic roads under a 1989 law and publishes them as a
  Department of Transportation layer of 141 segments in 74 groups. Seventy of
  those groups are a single town, which belongs on that town's guide rather
  than on a page of its own. Four cross three or more towns, and those are
  these.

  ## The names are ours

  The layer has no name field — only route numbers, town names, milepoints and
  a designation date. "The Merritt Parkway" is the common name for Route 15
  running from the New York line through those eight towns; the state's data
  does not say it. Each intro says where the route data comes from and leaves
  the name as what it is.

  ## No distances

  The milepoints are per-direction. The Merritt's segments sum to 74.5 miles
  because `15-N` and `15-S` are both in the data, while the parkway is about
  37. Rather than halve some routes and not others, the pages describe order
  and designation and quote no distances at all.
  """

  alias Ethos.Collections

  @source "the Connecticut Department of Transportation's scenic roads layer"

  def upsert_all! do
    [merritt(), route_169(), route_207(), route_7()]
    |> Enum.map(&Collections.upsert_collection!/1)
  end

  defp merritt do
    %{
      slug: "merritt-parkway",
      title: "The Merritt Parkway",
      published: true,
      intro: """
      Route 15 from the New York state line east to the Housatonic, designated
      a scenic road by Connecticut in 1993 and one of the state's two
      National Scenic Byways. It crosses eight Fairfield County towns, and
      its bridges were designed individually rather than to a standard
      pattern. The route data here is #{@source}; the name is the one
      everyone uses, not a field in that dataset.
      """,
      items: [
        %{
          guide_slug: "greenwich-ct-travel-guide",
          blurb:
            "Where the parkway enters Connecticut from the New York line, and the first of the eight towns it crosses."
        },
        %{
          guide_slug: "stamford-ct-travel-guide",
          blurb: "The second town east, and the largest the parkway passes through."
        },
        %{
          guide_slug: "new-canaan-ct-travel-guide",
          blurb: "The parkway clips New Canaan's southern edge between Stamford and Norwalk."
        },
        %{
          guide_slug: "norwalk-ct-travel-guide",
          blurb:
            "Midway along the Fairfield County stretch, where the parkway crosses the Norwalk River valley."
        },
        %{
          guide_slug: "westport-ct-travel-guide",
          blurb: "East of Norwalk, on the run toward Fairfield."
        },
        %{
          guide_slug: "fairfield-ct-travel-guide",
          blurb: "The county's namesake town, and one of the longer stretches of the designation."
        },
        %{
          guide_slug: "trumbull-ct-travel-guide",
          blurb: "North of Bridgeport, where the parkway turns toward the Housatonic."
        },
        %{
          guide_slug: "stratford-ct-travel-guide",
          blurb:
            "The last Connecticut town on the designated stretch, ending at the Housatonic River."
        }
      ]
    }
  end

  defp route_169 do
    %{
      slug: "route-169",
      title: "Route 169 through the Quiet Corner",
      published: true,
      intro: """
      Designated in 1991 and Connecticut's other National Scenic Byway, Route
      169 runs north to south through the state's north-east corner, overlapping
      Routes 171, 44 and 138 along the way. Five towns, none of them large. The
      route data here is #{@source}; the corner's nickname is not the state's.
      """,
      items: [
        %{
          guide_slug: "woodstock-ct-travel-guide",
          blurb:
            "The northern end, where the designated stretch begins near the Massachusetts line."
        },
        %{
          guide_slug: "pomfret-ct-travel-guide",
          blurb: "South of Woodstock, where Route 169 overlaps US 44."
        },
        %{
          guide_slug: "brooklyn-ct-travel-guide",
          blurb: "The middle of the byway, and not the Brooklyn most people mean."
        },
        %{
          guide_slug: "canterbury-ct-travel-guide",
          blurb: "One of the longer stretches, running south toward the Quinebaug."
        },
        %{
          guide_slug: "lisbon-ct-travel-guide",
          blurb: "The southern end, where Route 169 meets Route 138."
        }
      ]
    }
  end

  defp route_207 do
    %{
      slug: "route-207",
      title: "Route 207",
      published: true,
      intro: """
      A state scenic road designated in 2022, the newest of the four, running
      east from Route 85 in Hebron to Route 97 in Sprague across four towns in
      the eastern uplands. A state designation under Connecticut's 1989 law,
      not a federal one. The route data here is #{@source}.
      """,
      items: [
        %{
          guide_slug: "hebron-ct-travel-guide",
          blurb: "The western end, where the designated stretch begins at Route 85."
        },
        %{
          guide_slug: "lebanon-ct-travel-guide",
          blurb: "The longest stretch of the four towns, across Lebanon's farmland."
        },
        %{
          guide_slug: "franklin-ct-travel-guide",
          blurb: "East of Lebanon, one of the smallest towns in the state by population."
        },
        %{
          guide_slug: "sprague-ct-travel-guide",
          blurb: "The eastern end, finishing at Route 97."
        }
      ]
    }
  end

  defp route_7 do
    %{
      slug: "route-7-in-the-northwest",
      title: "Route 7 in the north-west",
      published: true,
      intro: """
      A state scenic road designated in 2002, running north along Route 7 from
      the Cornwall–Sharon turnpike to the Canaan town line, through three towns
      in the Litchfield hills. A state designation, not a federal one. The
      route data here is #{@source}.
      """,
      items: [
        %{
          guide_slug: "sharon-ct-travel-guide",
          blurb:
            "The southern end of the designated stretch, where it leaves the Cornwall–Sharon turnpike."
        },
        %{
          guide_slug: "salisbury-ct-travel-guide",
          blurb: "The shortest of the three stretches, in the state's north-west corner."
        },
        %{
          guide_slug: "canaan-ct-travel-guide",
          blurb: "The northern end, finishing at the North Canaan town line."
        }
      ]
    }
  end
end
