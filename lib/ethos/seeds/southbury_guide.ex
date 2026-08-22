defmodule Ethos.Seeds.SouthburyGuide do
  @moduledoc "Seeds the Southbury, Connecticut travel guide. Idempotent by slug."

  def upsert!(email), do: Ethos.Seeds.CtGuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "southbury-ct-travel-guide",
      title: "Southbury, Connecticut: State Parks, Colonial Roots, and the Pomperaug Valley",
      destination: "Southbury, Connecticut",
      county: "New Haven County",
      intro: """
      Southbury began in 1673, when religious dissidents from Stratford bought
      "Pomperaug Plantation" along a Housatonic tributary; the southern parish
      went its own way in 1787 with a charter as The Town of Southbury. What
      that history left behind is a town built for being outdoors: an Audubon
      sanctuary on a bend of the Pomperaug, a state park on Lake Zoar named for
      a one-kettle land deal, and a waterfall park with a covered bridge. Add a
      genuine resort-style hotel and a small, good restaurant row, and
      Southbury is the comfortable overnight in the region.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Bent of the River Audubon Center",
          place_slug: "bent-of-the-river-audubon",
          note:
            "About 700 sanctuary acres left to Audubon for education by Althea Clark — trails open to the public since the early 2000s."
        },
        %{
          kind: "sight",
          name: "Kettletown State Park",
          place_slug: "kettletown-state-park",
          note:
            "605 acres on Lake Zoar with six-plus miles of trails. Day use is open; the campground is closed for the 2026 season after 2024 flood damage."
        },
        %{
          kind: "sight",
          name: "Southford Falls State Park",
          place_slug: "southford-falls-state-park",
          note:
            "Tiered waterfall, covered bridge, observation tower, and a trout-stocked pond — on the old Diamond Match Company site."
        },
        %{
          kind: "sight",
          name: "Old Town Hall Museum",
          place_slug: "old-town-hall-museum-southbury",
          note: "The Southbury Historical Society's anchor property in South Britain."
        },
        %{
          kind: "sight",
          name: "Bullet Hill School",
          place_slug: "bullet-hill-school",
          note: "A one-room schoolhouse run as a living museum."
        },
        %{
          kind: "food",
          name: "Señor Pancho's",
          place_slug: "senor-panchos-southbury",
          note:
            "The founding 1989 location of the family — and a 'Best Burrito in Connecticut' winner."
        },
        %{
          kind: "food",
          name: "Maggie McFly's",
          place_slug: "maggie-mcflys-southbury",
          note:
            "The big-menu Connecticut original's Southbury outpost — lobster roll and fish fry."
        },
        %{
          kind: "food",
          name: "The Bevy Co",
          place_slug: "the-bevy-co",
          note: "NYC-style cocktail lounge — espresso martinis and bao buns."
        },
        %{
          kind: "food",
          name: "RaaSa Indian Cuisine",
          place_slug: "raasa-indian-cuisine",
          note: "Family-owned Indian with near-perfect ratings. Closed Tuesdays."
        },
        %{
          kind: "stay",
          name: "Heritage Hotel, Golf & Conference Center",
          place_slug: "heritage-hotel-southbury",
          note:
            "The region's resort-style stay: saltwater pools, spa, athletic club, The Tavern, and nine holes of golf out back."
        }
      ],
      sections: [
        %{
          "heading" => "Pomperaug Plantation and the kettle legend",
          "body" => """
          In 1673, religious dissidents from Stratford purchased Pomperaug
          Plantation and settled the valley; Southbury — originally Woodbury's
          southern parish — received its own town charter in 1787. During the
          Revolution the town supplied militia and provisions to Washington's
          forces. The land kept its stories: legend says colonists obtained the
          Kettletown tract from the Pootatuck people for a single brass kettle, and
          the original village site there disappeared under water in 1919 when
          damming the Housatonic created Lake Zoar. Colonial Revival photographer
          Wallace Nutting, a Southbury resident, immortalized the town in his 1923
          "Connecticut Beautiful."
          """
        },
        %{
          "heading" => "Know before you go",
          "body" => """
          Kettletown's campground is closed for the 2026 season (2024 flood
          damage), though day use is open. And a note that saves confusion:
          Heritage Village, despite the name, is an age-restricted residential
          community — not a tourist attraction. The Heritage Hotel on Heritage
          Road is the place travelers actually want.
          """
        }
      ],
      faq: [
        %{
          "question" => "How did Kettletown get its name?",
          "answer" =>
            "Local legend says early colonists traded one brass kettle to the Pootatuck people for the right to hunt and fish the land."
        },
        %{
          "question" => "Is the Kettletown campground open?",
          "answer" =>
            "Not in 2026 — it's closed for the season due to August 2024 flood damage. The park itself is open for day use."
        },
        %{
          "question" => "What is Heritage Village?",
          "answer" =>
            "An age-restricted retirement community, not a tourist attraction. Travelers looking for 'Heritage' want the Heritage Hotel, Golf & Conference Center on Heritage Road."
        },
        %{
          "question" => "When did Southbury become a town?",
          "answer" =>
            "1787, when Woodbury's southern parish received a charter as The Town of Southbury; European settlement of the valley dates to 1673."
        },
        %{
          "question" => "Where should I stay?",
          "answer" =>
            "The Heritage Hotel, Golf & Conference Center — Southbury's full-service resort-style hotel with pools, a spa, and golf."
        }
      ],
      photos: [
        %{
          "src" => "/photos/ct/southbury/kettletown-lake-zoar.jpg",
          "thumb" => "/photos/ct/southbury/kettletown-lake-zoar_thumb.jpg",
          "title" => "Lake Zoar",
          "description" =>
            "Lake Zoar (the impounded Housatonic River) from Kettletown State Park.",
          "author" => "Jllm06",
          "license" => "CC BY-SA 4.0",
          "source_url" =>
            "https://commons.wikimedia.org/wiki/File:Kettletown_State_Park_4_-_Lake_Zoar_(Housatonic_River).jpg"
        },
        %{
          "src" => "/photos/ct/southbury/bent-of-the-river.jpg",
          "thumb" => "/photos/ct/southbury/bent-of-the-river_thumb.jpg",
          "title" => "Bent of the River",
          "description" => "The Audubon Center at Bent of the River, Southbury.",
          "author" => "Karl Thomas Moore",
          "license" => "CC BY-SA 4.0",
          "source_url" =>
            "https://commons.wikimedia.org/wiki/File:Audubon_Center_at_Bent_of_the_River_I.JPG"
        },
        %{
          "src" => "/photos/ct/southbury/southbury-town-hall.jpg",
          "thumb" => "/photos/ct/southbury/southbury-town-hall_thumb.jpg",
          "title" => "Southbury Town Hall",
          "description" => "The Southbury, Connecticut town hall.",
          "author" => "AirportExpert",
          "license" => "CC BY-SA 4.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:Southbury,_CT_Town_Hall.jpg"
        },
        %{
          "src" => "/photos/ct/southbury/south-britain-church.jpg",
          "thumb" => "/photos/ct/southbury/south-britain-church_thumb.jpg",
          "title" => "South Britain Congregational Church",
          "description" => "The South Britain Congregational Church in Southbury.",
          "author" => "Magicpiano",
          "license" => "CC BY-SA 4.0",
          "source_url" =>
            "https://commons.wikimedia.org/wiki/File:SouthburyCT_SouthBritainCongregationalChurch.jpg"
        },
        %{
          "src" => "/photos/ct/southbury/lake-zoar-bridge.jpg",
          "thumb" => "/photos/ct/southbury/lake-zoar-bridge_thumb.jpg",
          "title" => "Lake Zoar old bridge",
          "description" => "An old bridge over Lake Zoar near Southbury.",
          "author" => "Pedro Xing",
          "license" => "CC0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:Lake_Zoar_old_bridge_105.JPG"
        }
      ]
    }
  end
end
