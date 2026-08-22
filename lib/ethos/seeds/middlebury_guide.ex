defmodule Ethos.Seeds.MiddleburyGuide do
  @moduledoc "Seeds the Middlebury, Connecticut travel guide. Idempotent by slug."

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "middlebury-ct-travel-guide",
      title: "Middlebury, Connecticut: Quassy, the Greenway, and the Quiet Side of the Valley",
      destination: "Middlebury, Connecticut",
      state: "Connecticut",
      county: "New Haven County",
      intro: """
      Middlebury was incorporated in 1807 from pieces of Southbury, Waterbury,
      and Woodbury — named simply for sitting "in the midst" of them — and it
      has stayed the quiet neighbor ever since: farms, a green, a boarding
      school designed by pioneering architect Theodate Pope Riddle, and one
      glorious exception to the calm. That exception is Quassy, the 1908
      lakeside amusement park on Lake Quassapaug that began as a trolley-line
      resort and never stopped running. Come for a family day at the park, bike
      the old trolley route, and eat far better than a town of this size has
      any right to feed you.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Quassy Amusement Park",
          place_slug: "quassy-amusement-park",
          note:
            "On Lake Quassapaug since 1908 and still family-owned — 20-plus rides including the Wooden Warrior coaster, plus the Splash Away Bay waterpark. Seasonal, roughly April through October."
        },
        %{
          kind: "walk",
          name: "Middlebury Greenway",
          place_slug: "middlebury-greenway",
          note:
            "4.5 paved miles along the old trolley roadbed that once carried summer crowds to the lake — hilly, bench-lined, and it ends near Quassy's gates."
        },
        %{
          kind: "sight",
          name: "Middlebury Historical Society Museum",
          place_slug: "middlebury-historical-society",
          note:
            "Local history in an 1897 two-room schoolhouse near the Green, a National Register building that spent decades as the town library."
        },
        %{
          kind: "food",
          name: "Vyne Restaurant & Bar",
          place_slug: "vyne-restaurant",
          note:
            "The fine-dining pick: contemporary American on a site with a family restaurant legacy back to the 1940s."
        },
        %{
          kind: "food",
          name: "Brewbury Kitchen & Tap",
          place_slug: "brewbury-kitchen-tap",
          note: "House-brewed beers, a full kitchen, and a patio — the easy crowd-pleaser."
        },
        %{
          kind: "food",
          name: "Pies & Pub",
          place_slug: "pies-and-pub",
          note: "Hand-tossed pizza and 26 rotating drafts."
        },
        %{
          kind: "food",
          name: "Kitchen 64",
          place_slug: "kitchen-64",
          note: "Breakfast from 6:30 AM daily — eggs Benedict and French toast are the moves."
        },
        %{
          kind: "food",
          name: "Maggie McFly's",
          place_slug: "maggie-mcflys-middlebury",
          note: "The famously enormous menu; there is something for every person in the car."
        },
        %{
          kind: "food",
          name: "Señor Pancho's",
          place_slug: "senor-panchos-middlebury",
          note:
            "Family-run Mexican from one of Connecticut's oldest family Mexican restaurant groups."
        }
      ],
      sections: [
        %{
          "heading" => "From trolley resort to family park",
          "body" => """
          A trolley line reached Middlebury by 1908 and turned Lake Quassapaug into
          a summer resort — swimming, picnicking, dancing, and a carousel. That
          resort became Lake Quassapaug Amusement Park, today's Quassy, purchased
          in 1937 by three Waterbury businessmen. The trolley itself shut down in
          1930 after Route 64 was improved; its roadbed is now the Middlebury
          Greenway, so you can ride the route the summer crowds once did — on two
          wheels. In 2026 an industry index named Quassy the most affordable theme
          park in America.
          """
        },
        %{
          "heading" => "Where to stay",
          "body" => """
          Middlebury itself has no verified operating hotel or B&B as of 2026 (the
          longtime Tucker Hill Inn appears to have closed). The closest verified
          bases are the Courtyard by Marriott in downtown Waterbury, ten minutes
          east, or the resort-style Heritage Hotel in Southbury, ten minutes
          southwest — both covered in their towns' Ethos guides.
          """
        }
      ],
      faq: [
        %{
          "question" => "Is Quassy open all year?",
          "answer" =>
            "No — Quassy is seasonal, operating roughly April through October, with the Splash Away Bay waterpark in summer."
        },
        %{
          "question" => "Is the Middlebury Greenway good for kids?",
          "answer" =>
            "It's paved and car-free for 4.5 miles along Route 64, though notably hilly in stretches — fine for confident young riders, with benches along the way."
        },
        %{
          "question" => "Where do I stay for a Quassy trip?",
          "answer" =>
            "In neighboring towns: downtown Waterbury's Courtyard by Marriott or Southbury's Heritage Hotel are the closest verified options, each about ten minutes away."
        },
        %{
          "question" => "What's Middlebury's history in one line?",
          "answer" =>
            "Incorporated in 1807 from parts of Southbury, Waterbury, and Woodbury, it stayed agricultural — dairy and saddle horses — while its neighbors industrialized."
        },
        %{
          "question" => "What is Westover School?",
          "answer" =>
            "A girls' boarding school established in 1909, designed by Theodate Pope Riddle, one of America's first licensed female architects."
        }
      ],
      photos: [
        %{
          "src" => "/photos/ct/middlebury/quassy-sign.jpg",
          "thumb" => "/photos/ct/middlebury/quassy-sign_thumb.jpg",
          "title" => "Quassy entrance",
          "description" => "The entrance sign at Quassy Amusement Park.",
          "author" => "AskJoanne",
          "license" => "CC BY 3.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:Quassy.jpg"
        },
        %{
          "src" => "/photos/ct/middlebury/quassy-rides.jpg",
          "thumb" => "/photos/ct/middlebury/quassy-rides_thumb.jpg",
          "title" => "Quassy rides",
          "description" => "Rides at Quassy Amusement Park on Lake Quassapaug.",
          "author" => "Roller Coaster Philosophy",
          "license" => "CC BY 2.0",
          "source_url" =>
            "https://commons.wikimedia.org/wiki/File:Quassy_Amusement_Park_-_48334465221.jpg"
        },
        %{
          "src" => "/photos/ct/middlebury/middlebury-town-hall.jpg",
          "thumb" => "/photos/ct/middlebury/middlebury-town-hall_thumb.jpg",
          "title" => "Middlebury Town Hall",
          "description" => "Middlebury's town hall.",
          "author" => "Jerry Dougherty",
          "license" => "CC BY 2.5",
          "source_url" => "https://commons.wikimedia.org/wiki/File:TownHallMiddleburyCT.jpg"
        },
        %{
          "src" => "/photos/ct/middlebury/middlebury-sign.jpg",
          "thumb" => "/photos/ct/middlebury/middlebury-sign_thumb.jpg",
          "title" => "Middlebury town sign",
          "description" => "The town line sign for Middlebury, Connecticut.",
          "author" => "CTsignhunt",
          "license" => "CC0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:Middlebury,_CT.jpg"
        }
      ]
    }
  end
end
