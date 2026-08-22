defmodule Ethos.Seeds.WaterburyGuide do
  @moduledoc "Seeds the Waterbury, Connecticut travel guide. Idempotent by slug."

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "waterbury-ct-travel-guide",
      title: "Waterbury, Connecticut: A Brass City Travel Guide",
      destination: "Waterbury, Connecticut",
      state: "Connecticut",
      county: "New Haven County",
      intro: """
      Waterbury earned its nickname the honest way: by 1840, America's entire
      brass industry was concentrated in the Naugatuck Valley around this city,
      and at its peak the brass mills employed some 50,000 people. The
      factories are quieter now, but the wealth they made built a downtown
      worth a day of anyone's time — a Thomas Lamb movie palace, a
      museum-on-the-Green with 10,000 buttons, and a clock tower you can see
      from the highway. Add a food scene that never stopped being
      old-school — grinders since 1922, hot dogs since 1937 — and the Brass
      City makes a rewarding, unpretentious stop on any western Connecticut
      trip.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Palace Theater",
          place_slug: "palace-theater-waterbury",
          note:
            "A 1922 Thomas Lamb movie palace restored for $30 million and reopened in 2004 — one of only two survivors of Sylvester Poli's theater empire. Check the Broadway series schedule before you book the trip."
        },
        %{
          kind: "sight",
          name: "Mattatuck Museum",
          place_slug: "mattatuck-museum",
          note:
            "Art upstairs, brass and buttons downstairs: the museum founded in 1877 holds the industrial story of the Naugatuck Valley, including the Waterbury Button Museum's 10,000-plus buttons."
        },
        %{
          kind: "sight",
          name: "Union Station clock tower",
          place_slug: "waterbury-union-station",
          note:
            "The 1909 station's clock tower is the city's signature landmark — walk over for the photo."
        },
        %{
          kind: "walk",
          name: "Waterbury Green",
          place_slug: "waterbury-green",
          note:
            "Start a downtown loop at the Welton Fountain on the Green, then walk to the Palace and the Mattatuck — everything is within a few blocks."
        },
        %{
          kind: "sight",
          name: "Holy Land USA",
          place_slug: "holy-land-usa",
          note:
            "The 18-acre hillside park of miniature biblical scenes, closed in 1984 and reopened in 2014, is one of Connecticut's strangest and most memorable sights. Daylight hours."
        },
        %{
          kind: "sight",
          name: "Seven Angels Theatre",
          place_slug: "seven-angels-theatre",
          note:
            "Greater Waterbury's professional regional theatre — check the calendar for musicals, comedy, and concerts."
        },
        %{
          kind: "food",
          name: "Diorio Restaurant & Bar",
          place_slug: "diorio-restaurant",
          note:
            "The white-tablecloth stalwart of Bank Street — classic Italian-American with a proper bar. Dinner from 5, closed Sundays for the bar."
        },
        %{
          kind: "food",
          name: "Nardelli's Grinder Shoppe",
          place_slug: "nardellis-grinder-shoppe",
          note:
            "Founded 1922 and still family-owned — repeatedly voted among Connecticut's best grinders. Order the grinder; that's the point."
        },
        %{
          kind: "food",
          name: "Frankie's Hot Dogs",
          place_slug: "frankies-hot-dogs-waterbury",
          note: "A drive-in institution since 1937 with three locations around the city."
        },
        %{
          kind: "food",
          name: "Sweet Maria's",
          place_slug: "sweet-marias-waterbury",
          note:
            "The bakery Waterbury swears by — cakes, biscotti, and cookies worth the detour to Manor Avenue."
        },
        %{
          kind: "food",
          name: "Brass Works Brewing",
          place_slug: "brass-works-brewing",
          note:
            "The city's brewery, named for its brass heritage — taproom pours plus rotating food trucks."
        },
        %{
          kind: "stay",
          name: "Courtyard by Marriott Waterbury Downtown",
          place_slug: "courtyard-waterbury-downtown",
          note:
            "The downtown base: steps from the Palace Theater and the Green, which is exactly where you want to be."
        }
      ],
      sections: [
        %{
          "heading" => "How Waterbury became the Brass City",
          "body" => """
          Settled in 1674 as Mattatuck Plantation and incorporated as a town in
          1686, Waterbury industrialized around one metal. By 1840 the entire
          American brass industry was localized in the Naugatuck Valley, led by
          giants like Scovill Manufacturing, Anaconda American Brass, and Chase
          Brass & Copper — at the WWII peak, about 10,000 people worked at
          Scovill alone, in mills covering more than two million square feet.
          The Waterbury Clock Company (ancestor of Timex) was making 20,000
          clocks and watches a day by the end of the 19th century, and its 1933
          Mickey Mouse watch sold over 11,000 units on day one. Waterbury
          inventors gave the world the can opener (Ezra J. Warner, 1858) and the
          machine-made paper clip (William D. Middlebrook, 1899). Employment
          peaked around 50,000 before falling to under 5,000 by the 1980s — the
          Mattatuck Museum tells the whole arc.
          """
        },
        %{
          "heading" => "Getting there and around",
          "body" => """
          Waterbury sits on I-84 in west-central Connecticut, roughly halfway
          between Hartford and Danbury, and has its own Metro-North branch line
          into Union Station. Downtown — the Green, the Palace, the
          Mattatuck — is compactly walkable; Holy Land USA and the brewery are
          short drives.
          """
        }
      ],
      faq: [
        %{
          "question" => "Why is Waterbury called the Brass City?",
          "answer" =>
            "By 1840 America's entire brass industry was concentrated in the Naugatuck Valley around Waterbury, and brass employment peaked near 50,000 workers. The nickname parallels Meriden (Silver City) and New Britain (Hardware City)."
        },
        %{
          "question" => "Is the Palace Theater still open?",
          "answer" =>
            "Yes — it operates year-round with a Broadway series, comedy, and concerts, and offers guided tours. It reopened in 2004 after a $30 million restoration."
        },
        %{
          "question" => "What is the one must-see in Waterbury?",
          "answer" =>
            "The Mattatuck Museum on the Green: American art plus the definitive telling of the brass story, with the Waterbury Button Museum inside. Pair it with a walk to the Palace Theater."
        },
        %{
          "question" => "Where should I stay in Waterbury?",
          "answer" =>
            "The Courtyard by Marriott Waterbury Downtown at 63 Grand Street is the main full-service downtown hotel, steps from the Palace Theater."
        },
        %{
          "question" => "Is Holy Land USA open?",
          "answer" =>
            "Yes — after closing in 1984 it was revived and reopened to the public in 2014, and is open during daylight hours."
        }
      ],
      photos: [
        %{
          "src" => "/photos/ct/waterbury/palace-theater.jpg",
          "thumb" => "/photos/ct/waterbury/palace-theater_thumb.jpg",
          "title" => "Palace Theater",
          "description" => "The Palace Theater on East Main Street.",
          "author" => "Magicpiano",
          "license" => "CC BY-SA 4.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:WaterburyCT_PalaceTheater.jpg"
        },
        %{
          "src" => "/photos/ct/waterbury/waterbury-green-fountain.jpg",
          "thumb" => "/photos/ct/waterbury/waterbury-green-fountain_thumb.jpg",
          "title" => "Welton Fountain",
          "description" => "The Welton Fountain on the Waterbury Green.",
          "author" => "GrammarFascist",
          "license" => "CC BY-SA 4.0",
          "source_url" =>
            "https://commons.wikimedia.org/wiki/File:Welton_Fountain_on_Waterbury_Green.jpg"
        },
        %{
          "src" => "/photos/ct/waterbury/union-station-tower.jpg",
          "thumb" => "/photos/ct/waterbury/union-station-tower_thumb.jpg",
          "title" => "Union Station clock tower",
          "description" => "Waterbury Union Station's landmark clock tower.",
          "author" => "Hallettx",
          "license" => "CC BY-SA 4.0",
          "source_url" =>
            "https://commons.wikimedia.org/wiki/File:Waterbury_Union_Station_Clock_Tower,_Waterbury_CT,_US.jpg"
        },
        %{
          "src" => "/photos/ct/waterbury/downtown-waterbury.jpg",
          "thumb" => "/photos/ct/waterbury/downtown-waterbury_thumb.jpg",
          "title" => "Downtown Waterbury",
          "description" => "Downtown Waterbury near the Green.",
          "author" => "Daniel Case",
          "license" => "CC BY-SA 3.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:Downtown_Waterbury,_CT.jpg"
        },
        %{
          "src" => "/photos/ct/waterbury/mattatuck-museum.jpg",
          "thumb" => "/photos/ct/waterbury/mattatuck-museum_thumb.jpg",
          "title" => "Mattatuck Museum",
          "description" => "The Mattatuck Museum on West Main Street.",
          "author" => "DavidMacharelli",
          "license" => "CC BY-SA 4.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:Mattatuck_Museum_Exterior.jpg"
        }
      ]
    }
  end
end
