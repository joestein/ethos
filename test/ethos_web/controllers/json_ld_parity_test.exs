defmodule EthosWeb.JsonLdParityTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.{Collections, Guides, Places}

  @place_attrs %{
    slug: "palace-theater-waterbury",
    name: "Palace Theater",
    kind: "theater",
    destination_path: "united-states/connecticut/new-haven-county/waterbury",
    summary: "A 1922 Thomas Lamb movie palace.",
    history: "Designed by **Thomas Lamb**.",
    address: "100 E. Main St., Waterbury, CT 06702",
    official_url: "https://palacetheaterct.org",
    status: "open",
    photos: [
      %{
        "src" => "/photos/ct/waterbury/palace-theater.jpg",
        "thumb" => "/photos/ct/waterbury/palace-theater_thumb.jpg",
        "title" => "Palace Theater",
        "description" => "The marquee.",
        "author" => "Jane Doe",
        "license" => "CC BY-SA 4.0",
        "source_url" => "https://commons.wikimedia.org/wiki/File:Palace.jpg"
      }
    ]
  }

  @photos [
    %{
      "src" => "/photos/rome/trevi-fountain.jpg",
      "thumb" => "/photos/rome/trevi-fountain_thumb.jpg",
      "title" => "Trevi Fountain",
      "description" => "Oceanus in afternoon sun."
    },
    %{
      "src" => "/photos/rome/arch-of-constantine.jpg",
      "thumb" => "/photos/rome/arch-of-constantine_thumb.jpg",
      "title" => "Arch of Constantine",
      "description" => "Triple arch beside the Colosseum."
    }
  ]

  # Every page type that emits a BreadcrumbList. The refactor in Task 1 is a
  # pure refactor: these blocks must be byte-identical before and after.
  #
  # The expected trails in `parity_cases/0` are written out as literal lists on
  # purpose. Deriving them from the same trail the controller builds would make
  # this test an identity — `Enum.with_index(trail, 1)` cannot produce anything
  # but 1..n, so a positions-only assertion passes just as happily on a trail
  # with a crumb dropped or two crumbs swapped. The literal lists are what give
  # Tasks 3-5 an actual net over the place, collection and destination
  # builders, which have no crumb-content assertions anywhere else.
  test "breadcrumb JSON-LD is stable across every page type", %{conn: conn} do
    for %{path: path, names: names, urls: urls} <- parity_cases() do
      html = conn |> get(path) |> html_response(200)
      crumb = json_ld_of_type(html, "BreadcrumbList")

      assert crumb, "no BreadcrumbList on #{path}"

      items = crumb["itemListElement"]

      assert Enum.map(items, & &1["name"]) == names,
             "breadcrumb names on #{path} changed"

      assert Enum.map(items, & &1["item"]) == urls,
             "breadcrumb URLs on #{path} changed"

      positions = Enum.map(items, & &1["position"])

      assert positions == Enum.to_list(1..length(positions)),
             "positions on #{path} are not 1..n: #{inspect(positions)}"

      for item <- items do
        assert item["@type"] == "ListItem"
        assert is_binary(item["name"]) and item["name"] != ""
        assert is_binary(item["item"]) and String.starts_with?(item["item"], "http")
      end
    end
  end

  # Builds a fixture for every page type that emits a breadcrumb and returns the
  # path each is served at alongside the exact trail it must emit.
  defp parity_cases do
    # Destinations FIRST, before any place or guide row.
    #
    # This is a lock-order rule as well as a data dependency:
    # `palace-theater-waterbury` is also a slug
    # `Ethos.Seeds.ConnecticutPlaces` seeds, and that module's tests now insert
    # destination rows before their places. Inserting the place here first left
    # two async transactions taking the `places` slug lock and the `destinations`
    # path lock in opposite orders, which Postgres resolves by killing one of
    # them — an intermittent `deadlock_detected` in whichever test lost.
    #
    # Every test that writes both tables writes destinations first, for the same
    # reason `Ethos.Release` seeds the roster before every corpus.
    #
    # An orientation page (tier "town-page") plus the Connecticut state and
    # Windham County hubs it populates.
    # Waterbury goes in through the SAME call, not a second one: two passes are
    # two lock sequences, and the second takes its rows after rows the first
    # already holds however they sort globally.
    Ethos.SeedDataHelpers.seed_fixture_destinations!([
      "united-states/connecticut/new-haven-county/waterbury"
    ])

    Places.upsert_place!(@place_attrs)

    guide = published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})

    photo_guide = published_guide_fixture(%{title: "Three Days", destination: "Rome, Italy"})
    {:ok, photo_guide} = Guides.update_guide_photos(photo_guide, @photos)

    town_page =
      Ethos.Seeds.DataGuide.upsert_from_file!(
        Path.expand("../../support/fixtures/seed_data/townville.json", __DIR__),
        user_fixture().email
      )

    Collections.upsert_collection!(%{
      slug: "burys-test",
      title: "Burys Test",
      intro: "Ten towns end in **-bury**.",
      published: true,
      items: [%{guide_slug: guide.slug, blurb: "The antiques one."}]
    })

    # Guide slugs carry a random six-character suffix, so their URLs are pinned
    # by interpolating the fixture's own slug into a literal path — the path
    # shape is still asserted, not merely that the URL starts with "http".
    [
      %{
        path: ~p"/p/palace-theater-waterbury",
        names: [
          "Ethos",
          "Destinations",
          "United States",
          "Connecticut",
          "New Haven County",
          "Waterbury",
          "Palace Theater"
        ],
        urls: [
          url(~p"/"),
          url(~p"/destinations"),
          url(~p"/destinations/united-states"),
          url(~p"/destinations/united-states/connecticut"),
          url(~p"/destinations/united-states/connecticut/new-haven-county"),
          url(~p"/destinations/united-states/connecticut/new-haven-county/waterbury"),
          url(~p"/p/palace-theater-waterbury")
        ]
      },
      %{
        path: ~p"/g/#{guide.slug}",
        names: ["Ethos", "Destinations", "Rome", "Roman Holiday"],
        urls: [
          url(~p"/"),
          url(~p"/destinations"),
          url(~p"/destinations/rome"),
          url(~p"/g/#{guide.slug}")
        ]
      },
      # A seeded guide is filed on a node, so its trail is that node's ancestry
      # — the same walk the place row above and the hub rows below make. Four
      # crumbs deep where the state/county pair could only ever emit two.
      %{
        path: ~p"/g/#{town_page.slug}",
        names: [
          "Ethos",
          "Destinations",
          "United States",
          "Connecticut",
          "Windham County",
          "Townville",
          "Townville, Connecticut: A Fixture Town"
        ],
        urls: [
          url(~p"/"),
          url(~p"/destinations"),
          url(~p"/destinations/united-states"),
          url(~p"/destinations/united-states/connecticut"),
          url(~p"/destinations/united-states/connecticut/windham-county"),
          url(~p"/destinations/united-states/connecticut/windham-county/townville"),
          url(~p"/g/townville-ct-travel-guide")
        ]
      },
      %{
        path: ~p"/g/#{photo_guide.slug}/photos",
        names: ["Ethos", "Destinations", "Rome", "Three Days", "Photos"],
        urls: [
          url(~p"/"),
          url(~p"/destinations"),
          url(~p"/destinations/rome"),
          url(~p"/g/#{photo_guide.slug}"),
          url(~p"/g/#{photo_guide.slug}/photos")
        ]
      },
      %{
        path: ~p"/destinations",
        names: ["Ethos", "Destinations"],
        urls: [url(~p"/"), url(~p"/destinations")]
      },
      # THE THREE HUB ROWS BELOW WERE PINNED TO A STUB. TASK 10 UNPINNED THEM.
      #
      # Task 8 served every hub from the tree but left
      # `DestinationController.node_breadcrumb/2` stubbed to the index's own two
      # crumbs, and downgraded these three rows to record what the stub emitted
      # rather than what a hub should emit. That was the only place in this
      # project where assertion strength was deliberately reduced, and it was
      # reduced on the exact thing Task 10 implements.
      #
      # They now assert the COMPLETE trail for each node: the two root crumbs,
      # then every ancestor root-first, then the node itself — at three
      # different depths, so a trail that drops an ancestor, reverses the order
      # or stops short of the node fails here. Each URL is the node's own path,
      # not the legacy single-slug form that 301s.
      #
      # The `/g/` and `/c/` rows for `Roman Holiday` are the one remaining
      # non-tree shape: a guide authored through the web UI names no node, so
      # its single crumb comes from its `destination_slug`. Every row that names
      # a node — the place above, the town page, the hubs below — walks the
      # tree.
      %{
        path: ~p"/destinations/united-states/connecticut",
        names: ["Ethos", "Destinations", "United States", "Connecticut"],
        urls: [
          url(~p"/"),
          url(~p"/destinations"),
          url(~p"/destinations/united-states"),
          url(~p"/destinations/united-states/connecticut")
        ]
      },
      %{
        path: ~p"/destinations/united-states/connecticut/windham-county",
        names: ["Ethos", "Destinations", "United States", "Connecticut", "Windham County"],
        urls: [
          url(~p"/"),
          url(~p"/destinations"),
          url(~p"/destinations/united-states"),
          url(~p"/destinations/united-states/connecticut"),
          url(~p"/destinations/united-states/connecticut/windham-county")
        ]
      },
      %{
        path: ~p"/destinations/united-states/connecticut/windham-county/townville",
        names: [
          "Ethos",
          "Destinations",
          "United States",
          "Connecticut",
          "Windham County",
          "Townville"
        ],
        urls: [
          url(~p"/"),
          url(~p"/destinations"),
          url(~p"/destinations/united-states"),
          url(~p"/destinations/united-states/connecticut"),
          url(~p"/destinations/united-states/connecticut/windham-county"),
          url(~p"/destinations/united-states/connecticut/windham-county/townville")
        ]
      },
      %{
        path: ~p"/c/burys-test",
        names: ["Ethos", "Destinations", "Burys Test"],
        urls: [
          url(~p"/"),
          url(~p"/destinations"),
          url(~p"/c/burys-test")
        ]
      }
    ]
  end
end
