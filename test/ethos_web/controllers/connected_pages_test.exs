defmodule EthosWeb.ConnectedPagesTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.{Links, Places}

  test "guide and place pages render grouped connected pages", %{conn: conn} do
    g = published_guide_fixture(%{title: "Woodbury Guide", destination: "Woodbury, Connecticut"})

    _p =
      Places.upsert_place!(%{
        slug: "glebe-house-x",
        name: "Glebe House X",
        kind: "museum",
        town: "Woodbury",
        state: "Connecticut",
        county: "Litchfield County",
        summary: "x"
      })

    Links.upsert_link!(%{
      source: {:guide, g.slug},
      target: {:place, "glebe-house-x"},
      kind: "shared-history",
      note: "Same parish story"
    })

    html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)
    assert html =~ "Connected pages"
    assert html =~ "Shared history"
    assert html =~ "Glebe House X"
    assert html =~ "Same parish story"

    html = build_conn() |> get(~p"/p/glebe-house-x") |> html_response(200)
    assert html =~ "Connected pages"
    assert html =~ "Woodbury Guide"
  end

  test "section absent when no links", %{conn: conn} do
    g = published_guide_fixture(%{title: "Lonely"})
    html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)
    refute html =~ "Connected pages"
  end

  test "links render in correct order regardless of insertion order", %{conn: conn} do
    g = published_guide_fixture(%{title: "Test Guide"})

    # Create places
    Places.upsert_place!(%{
      slug: "nearby-place",
      name: "Nearby Place",
      kind: "museum",
      town: "TestTown",
      state: "TestState",
      county: "TestCounty",
      summary: "nearby"
    })

    Places.upsert_place!(%{
      slug: "shared-place",
      name: "Shared Place",
      kind: "restaurant",
      town: "TestTown",
      state: "TestState",
      county: "TestCounty",
      summary: "shared"
    })

    Places.upsert_place!(%{
      slug: "region-place",
      name: "Region Place",
      kind: "historic-site",
      town: "TestTown",
      state: "TestState",
      county: "TestCounty",
      summary: "region"
    })

    # Insert links in non-sorted order: same-region, nearby, shared-history
    Links.upsert_link!(%{
      source: {:guide, g.slug},
      target: {:place, "region-place"},
      kind: "same-region",
      note: "Same region"
    })

    Links.upsert_link!(%{
      source: {:guide, g.slug},
      target: {:place, "nearby-place"},
      kind: "nearby",
      note: "Nearby"
    })

    Links.upsert_link!(%{
      source: {:guide, g.slug},
      target: {:place, "shared-place"},
      kind: "shared-history",
      note: "Shared"
    })

    html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

    # Find positions of headings in rendered HTML
    nearby_pos =
      case :binary.match(html, "Nearby") do
        {pos, _len} -> pos
        :nomatch -> 999_999
      end

    shared_pos =
      case :binary.match(html, "Shared history") do
        {pos, _len} -> pos
        :nomatch -> 999_999
      end

    region_pos =
      case :binary.match(html, "Same region") do
        {pos, _len} -> pos
        :nomatch -> 999_999
      end

    # Verify correct order: Nearby < Shared history < Same region
    assert nearby_pos < shared_pos, "Nearby should appear before Shared history"
    assert shared_pos < region_pos, "Shared history should appear before Same region"
  end
end
