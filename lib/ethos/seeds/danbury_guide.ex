defmodule Ethos.Seeds.DanburyGuide do
  @moduledoc "Seeds the Danbury, Connecticut travel guide. Idempotent by slug."

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "danbury-ct-travel-guide",
      title: "Danbury, Connecticut: Hat City History, Rail Heritage, and Where to Eat",
      destination: "Danbury, Connecticut",
      state: "Connecticut",
      county: "Fairfield County",
      intro: """
      Danbury made America's hats. From Zadoc Benedict's first felt hats in the
      late 1700s to roughly 4.5 million hats a year by 1880, "Hat City" crowned
      the country — and paid for it with the mercury-poisoning tremors known as
      the Danbury Shakes, a story that ends with Connecticut banning mercury
      from hatting in 1941. Today the city wears its history well: a
      seven-building museum campus with the birthplace of composer Charles
      Ives, a railroad museum in the restored 1903 Union Station, a 722-acre
      park around a Gilded Age mansion, and one of the state's best brewery
      taprooms. It's the natural base for exploring western Connecticut.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Danbury Railway Museum",
          place_slug: "danbury-railway-museum",
          note:
            "A working rail yard of 60-plus historic pieces around the restored 1903 Union Station. Weekends 10-4, $10 — time it for a train-ride day, spring through October."
        },
        %{
          kind: "sight",
          name: "Danbury Museum & Historical Society",
          place_slug: "danbury-museum-historical-society",
          note:
            "Seven historic buildings on Main Street, including the Charles Ives Birthplace and the Marian Anderson Studio — and the definitive Hat City story. Tours Wednesday-Saturday."
        },
        %{
          kind: "sight",
          name: "Tarrywile Park & Mansion",
          place_slug: "tarrywile-park",
          note:
            "722 acres, 21 miles of trails, and the 1897 Tarrywile Mansion. Dawn to dusk, free."
        },
        %{
          kind: "sight",
          name: "The Palace Danbury",
          place_slug: "palace-danbury",
          note: "The historic Main Street theater — music, comedy, film, and touring acts."
        },
        %{
          kind: "food",
          name: "Stanziato's Wood Fired Pizza",
          place_slug: "stanziatos-wood-fired-pizza",
          note:
            "Artisanal pies from an 800-degree Italian oven, sourced from nine regional farms."
        },
        %{
          kind: "food",
          name: "TK's American Cafe",
          place_slug: "tks-american-cafe",
          note: "76 wing flavors since 1990 — the area's sports bar of record."
        },
        %{
          kind: "food",
          name: "Chuck's Steak House & Margarita Grill",
          place_slug: "chucks-steak-house-danbury",
          note: "Hand-cut steaks and a famous salad bar, serving Danbury since 1973."
        },
        %{
          kind: "food",
          name: "Charter Oak Brewing",
          place_slug: "charter-oak-brewing",
          note: "Connecticut Magazine's best brewery and taproom in the state, two years running."
        },
        %{
          kind: "stay",
          name: "Hotel Zero Degrees",
          place_slug: "hotel-zero-degrees-danbury",
          note: "The boutique pick, with Terra Danbury (Northern Italian) on site."
        },
        %{
          kind: "stay",
          name: "La Quinta by Wyndham Danbury",
          place_slug: "la-quinta-danbury",
          note:
            "The dependable mid-range pick on Newtown Road — pool, gym, free breakfast, EV charging."
        }
      ],
      sections: [
        %{
          "heading" => "Hat City: how Danbury crowned America",
          "body" => """
          Before hats, Danbury was "Beantown" — named in 1687, incorporated in
          1702, and known for its bean crops. Zadoc Benedict changed that in the
          late 18th century with felt hat-making; by 1809 there were 56 hat shops,
          and by the 1850s Danbury called itself the Hat City of the World, with
          hatting employing more residents than every other occupation combined.
          The price was steep: mercury nitrate used in felt "carroting" caused the
          tremors known as the Danbury Shakes — a 1922 study found 43 of 100
          examined union hatters showed mercury poisoning. On December 1, 1941,
          Connecticut banned mercury in hat manufacturing, a date Danbury hatters
          celebrated annually. The industry faded — six manufacturers by 1923, one
          by the 1950s — but the Danbury Museum keeps the whole story.
          """
        },
        %{
          "heading" => "The Revolution came here",
          "body" => """
          Danbury was a Continental Army supply depot, and in April 1777 British
          forces under Major General William Tryon raided and burned the town — one
          of Connecticut's defining Revolutionary episodes. The Danbury Museum's
          historic buildings, including the John Rider House, put you in that
          streetscape.
          """
        },
        %{
          "heading" => "Getting there",
          "body" => """
          Danbury sits on I-84 at the New York line, with its own Metro-North
          branch line. The Railway Museum is right at the old Union Station on
          White Street; downtown Main Street and the museum campus are minutes
          away.
          """
        }
      ],
      faq: [
        %{
          "question" => "Why is Danbury called Hat City?",
          "answer" =>
            "It was the center of American hat production — 56 hat shops by 1809 and roughly 4.5 million hats a year by 1880; by the 1850s it styled itself the 'Hat City of the World.'"
        },
        %{
          "question" => "What were the Danbury Shakes?",
          "answer" =>
            "Tremors from mercury poisoning among hatters, caused by the mercury nitrate used in felt-making. Connecticut banned mercury in hat manufacturing on December 1, 1941."
        },
        %{
          "question" => "When is the Danbury Railway Museum open?",
          "answer" =>
            "Weekends 10 AM-4 PM, admission $10 for ages 3+, with train rides from early spring through October plus December Santa trains."
        },
        %{
          "question" => "Where should I stay in Danbury?",
          "answer" =>
            "Hotel Zero Degrees is the boutique option; La Quinta by Wyndham on Newtown Road is the reliable mid-range one. The historic Ethan Allen Hotel also operates in town."
        },
        %{
          "question" => "What happened in Danbury in 1777?",
          "answer" =>
            "British forces under Major General William Tryon raided and burned the town, which was serving as a Continental Army supply depot."
        }
      ],
      photos: [
        %{
          "src" => "/photos/ct/danbury/railway-museum-station.jpg",
          "thumb" => "/photos/ct/danbury/railway-museum-station_thumb.jpg",
          "title" => "Danbury Railway Museum",
          "description" => "The Danbury Railway Museum at the restored 1903 Union Station.",
          "author" => "Daniel Case",
          "license" => "CC BY-SA 3.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:Danbury_Railroad_Museum.jpg"
        },
        %{
          "src" => "/photos/ct/danbury/danbury-museum.jpg",
          "thumb" => "/photos/ct/danbury/danbury-museum_thumb.jpg",
          "title" => "Danbury Museum",
          "description" => "Streetside view of the Danbury Museum & Historical Society campus.",
          "author" => "TulaneTim",
          "license" => "CC BY-SA 4.0",
          "source_url" =>
            "https://commons.wikimedia.org/wiki/File:Danbury_Museum_Streetside_New.jpg"
        },
        %{
          "src" => "/photos/ct/danbury/charles-ives-birthplace.jpg",
          "thumb" => "/photos/ct/danbury/charles-ives-birthplace_thumb.jpg",
          "title" => "Charles Ives Birthplace",
          "description" => "Main entrance of the Charles Ives Birthplace.",
          "author" => "Danbury Museum",
          "license" => "CC BY-SA 4.0",
          "source_url" =>
            "https://commons.wikimedia.org/wiki/File:Main_entrance,_Charles_Ives_Birthplace.jpg"
        },
        %{
          "src" => "/photos/ct/danbury/main-street-danbury.jpg",
          "thumb" => "/photos/ct/danbury/main-street-danbury_thumb.jpg",
          "title" => "Main Street, Danbury",
          "description" => "Main Street in downtown Danbury, Connecticut.",
          "author" => "Daniel Case",
          "license" => "CC BY-SA 3.0",
          "source_url" =>
            "https://commons.wikimedia.org/wiki/File:Main_Street,_Danbury,_Connecticut.jpg"
        },
        %{
          "src" => "/photos/ct/danbury/railway-museum-acmu.jpg",
          "thumb" => "/photos/ct/danbury/railway-museum-acmu_thumb.jpg",
          "title" => "Vintage railcar",
          "description" => "A vintage ACMU railcar in the museum's rail yard.",
          "author" => "TriStateGuy",
          "license" => "CC BY 4.0",
          "source_url" =>
            "https://commons.wikimedia.org/wiki/File:ACMU_at_Danbury_Railway_Museum.jpg"
        }
      ]
    }
  end
end
