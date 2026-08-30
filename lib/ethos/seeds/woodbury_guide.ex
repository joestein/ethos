defmodule Ethos.Seeds.WoodburyGuide do
  @moduledoc "Seeds the Woodbury, Connecticut travel guide. Idempotent by slug."

  def upsert!(email), do: Ethos.Seeds.GuideRunner.upsert!(data(), email)

  def data do
    %{
      slug: "woodbury-ct-travel-guide",
      title: "Woodbury, Connecticut: Antiques Capital, the Glebe House, and Main Street",
      destination: "Woodbury, Connecticut",
      state: "Connecticut",
      county: "Litchfield County",
      intro: """
      Woodbury is Connecticut's 23rd town, settled in 1673 by families who
      walked up the rivers from Stratford to claim the Pomperaug plantation and
      built log cabins along what is still the main street. Three and a half
      centuries later that street is the reason to come: a National Register
      streetscape of 18th- and 19th-century buildings that earned Woodbury its
      title as Connecticut's antiques capital, anchored by the c. 1740 Glebe
      House — birthplace of the Episcopal Church in America — and the only
      Gertrude Jekyll garden in the country open to the public. Eat well, sleep
      in an 18th-century inn, and browse.
      """,
      entries: [
        %{
          kind: "sight",
          name: "Glebe House Museum & Gertrude Jekyll Garden",
          place_slug: "glebe-house-museum",
          note:
            "The c. 1740 minister's house where the Episcopal Church in America traces its birth — and the only publicly open Gertrude Jekyll-designed garden in the U.S. Garden is self-guided, dawn to dusk, year-round."
        },
        %{
          kind: "sight",
          name: "Flanders Nature Center & Land Trust",
          place_slug: "flanders-nature-center",
          note: "2,400-plus conserved acres with public trails, about 60 years in the making."
        },
        %{
          kind: "walk",
          name: "Hollow Park",
          place_slug: "hollow-park",
          note:
            "The town park next to the Glebe House — pavilion, fields, and a stretch-your-legs stop."
        },
        %{
          kind: "walk",
          name: "Orenaug Park",
          place_slug: "orenaug-park",
          note: "Wooded town park with a disc golf course."
        },
        %{
          kind: "food",
          name: "John's Cafe",
          place_slug: "johns-cafe-woodbury",
          note: "Bistro New American in the antiques district; Monday BYOB with no corkage."
        },
        %{
          kind: "food",
          name: "Market Place Kitchen & Bar",
          place_slug: "market-place-kitchen-woodbury",
          note: "Farm-fresh, seasonally changing menus; Sunday brunch 11:30-3."
        },
        %{
          kind: "food",
          name: "New Morning Market",
          place_slug: "new-morning-market",
          note: "The 1971-founded natural-foods market — grab prepared foods and picnic."
        },
        %{
          kind: "food",
          name: "Good News Restaurant & Bar",
          place_slug: "good-news-restaurant-woodbury",
          note:
            "The storied Good News name lives on at 694 Main Street South — the address chef Carole Peck put on Connecticut's dining map."
        },
        %{
          kind: "stay",
          name: "1754 House",
          place_slug: "1754-house-woodbury",
          note:
            "Ten rooms with private baths in the 18th-century inn long known as the Curtis House — reputedly Connecticut's oldest inn, now operating as the 1754 House."
        }
      ],
      sections: [
        %{
          "heading" => "Connecticut's 23rd town",
          "body" => """
          In the spring of 1673, families from Rev. Zechariah Walker's dissenting
          Stratford congregation walked into the Pomperaug wilderness and founded
          Woodbury — "dwelling place in the woods" — with each family receiving up
          to twenty-five acres along a single main street. By the late 1700s
          Woodbury was a thriving agricultural trade center of millers,
          blacksmiths, wheelwrights, tinsmiths, and goldsmiths. The town center
          still holds St. Paul's Episcopal Church (1785), the First Congregational
          Church (1818), and the Masonic Temple (1839) — and it was home to Leroy
          Anderson, one of the 20th century's most popular composers of light
          concert music.
          """
        },
        %{
          "heading" => "Antiquing Main Street",
          "body" => """
          In the late twentieth century, antique dealers moved into the historic
          residential buildings along Woodbury's town center, and the town became
          known as Connecticut's antiques capital. The dealers change; the
          streetscape doesn't. Park once and walk Main Street South — the shops,
          John's Cafe, and Good News are all on the same stretch, with the Glebe
          House a turn away on Hollow Road.

          Fifteen of those dealers, plus the Saturday flea market where Route 6
          meets Route 64, are set out shop by shop in the
          [Antique Trail of Connecticut](/g/antique-trail-of-connecticut) —
          each one's address, what it deals in, and which of them open only by
          appointment or by chance.
          """
        }
      ],
      faq: [
        %{
          "question" => "Why is Woodbury called the antiques capital of Connecticut?",
          "answer" =>
            "Since the late 20th century, antique shops have occupied the historic buildings along its town center, making it the state's best-known antiques destination."
        },
        %{
          "question" => "Is the Gertrude Jekyll garden open?",
          "answer" =>
            "Yes — it's self-guided and open dawn to dusk year-round on the Glebe House grounds, the only Jekyll-designed garden in the U.S. open to the public."
        },
        %{
          "question" => "Where can I stay in Woodbury?",
          "answer" =>
            "The 1754 House at 506 Main Street South — ten guest rooms with private baths in the 18th-century building long known as the Curtis House, reputedly Connecticut's oldest inn."
        },
        %{
          "question" => "What is the Glebe House?",
          "answer" =>
            "A c. 1740 gambrel-roofed house, occupied from 1771 by Anglican priest John Rutgers Marshall, known as the birthplace of the Episcopal Church in the United States."
        },
        %{
          "question" => "Is the Good News name still on Main Street?",
          "answer" =>
            "Yes — Good News Restaurant & Bar carries on the name at 694 Main Street South, the address chef Carole Peck's famed Good News Cafe made known. John's Cafe and Market Place round out the Main Street picks."
        }
      ],
      photos: [
        %{
          "src" => "/photos/ct/woodbury/glebe-house.jpg",
          "thumb" => "/photos/ct/woodbury/glebe-house_thumb.jpg",
          "title" => "Glebe House",
          "description" => "The c. 1740 Glebe House in Woodbury.",
          "author" => "LisaHendricks",
          "license" => "CC BY-SA 3.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:GlebeHouse.png"
        },
        %{
          "src" => "/photos/ct/woodbury/woodbury-old-town-hall.jpg",
          "thumb" => "/photos/ct/woodbury/woodbury-old-town-hall_thumb.jpg",
          "title" => "Woodbury Old Town Hall",
          "description" => "The Greek Revival Woodbury Old Town Hall.",
          "author" => "Bmzuckerman",
          "license" => "CC BY 4.0",
          "source_url" =>
            "https://commons.wikimedia.org/wiki/File:Greek_Revival_-_Woodbury,_CT_-_Woodbury_Old_Town_Hall_(1).jpg"
        },
        %{
          "src" => "/photos/ct/woodbury/woodbury-historic-district.jpg",
          "thumb" => "/photos/ct/woodbury/woodbury-historic-district_thumb.jpg",
          "title" => "Woodbury Historic District",
          "description" => "Buildings in Woodbury's Historic District Number Two.",
          "author" => "Magicpiano",
          "license" => "CC BY-SA 4.0",
          "source_url" =>
            "https://commons.wikimedia.org/wiki/File:WoodburyCT_HistoricDistrictNumber2.jpg"
        },
        %{
          "src" => "/photos/ct/woodbury/1754-house.jpg",
          "thumb" => "/photos/ct/woodbury/1754-house_thumb.jpg",
          "title" => "The Curtiss House (1754 House)",
          "description" =>
            "1930s Historic American Buildings Survey photograph of the Curtiss House, today the 1754 House inn.",
          "author" => "William Rainey, Historic American Buildings Survey (Library of Congress)",
          "license" => "Public domain",
          "source_url" =>
            "https://commons.wikimedia.org/wiki/File:Historic_American_Buildings_Survey_William_Rainey,_Photographer_GENERAL_VIEW_SHOWING_FRONT_AND_GABLE_END_-_Curtiss_House,_Woodbury,_Litchfield_County,_CT_HABS_CONN,3-WOO,6-1.tif"
        }
      ]
    }
  end
end
