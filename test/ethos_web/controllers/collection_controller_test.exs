defmodule EthosWeb.CollectionControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Collections
  alias Ethos.Seeds.ScenicBywaysCollections

  # ScenicBywaysCollections.upsert_all!/0 seeds all four byway collections in
  # one call, and Collections.upsert_collection!/1 raises on an item whose
  # guide slug does not exist yet — so every town across all four routes has
  # to be seeded, not just the Merritt Parkway's eight.
  @byway_towns %{
    "merritt-parkway" =>
      ~w(greenwich stamford new-canaan norwalk westport fairfield trumbull stratford),
    "route-169" => ~w(woodstock pomfret brooklyn canterbury lisbon),
    "route-207" => ~w(hebron lebanon franklin sprague),
    "route-7-in-the-northwest" => ~w(sharon salisbury canaan)
  }

  defp byway_guide(slug) do
    published_guide_fixture(%{title: slug, destination: "#{slug}, Connecticut"})
    |> Ecto.Changeset.change(slug: "#{slug}-ct-travel-guide")
    |> Ethos.Repo.update!()
  end

  test "renders published collection with members, JSON-LD, backlink on guide", %{conn: conn} do
    g = published_guide_fixture(%{title: "Woodbury Wander"})

    Collections.upsert_collection!(%{
      slug: "burys-test",
      title: "Burys Test",
      intro: "Ten towns end in **-bury**.",
      published: true,
      items: [%{guide_slug: g.slug, blurb: "The antiques one."}]
    })

    html = conn |> get(~p"/c/burys-test") |> html_response(200)
    assert html =~ "Burys Test"
    assert html =~ "Woodbury Wander"
    assert html =~ "The antiques one."
    assert html =~ "CollectionPage"

    html = build_conn() |> get(~p"/g/#{g.slug}") |> html_response(200)
    assert html =~ "Part of"
    assert html =~ "Burys Test"

    html = build_conn() |> get(~p"/destinations") |> html_response(200)
    assert html =~ "Collections"
    assert html =~ "Burys Test"

    xml = build_conn() |> get(~p"/sitemap.xml") |> response(200)
    assert xml =~ "/c/burys-test</loc>"
  end

  test "unpublished or unknown collection 404s", %{conn: conn} do
    assert conn |> get(~p"/c/nope") |> html_response(404)
  end

  test "renders a byway collection page with one link per town and its provenance", %{
    conn: conn
  } do
    for town <- @byway_towns |> Map.values() |> List.flatten(), do: byway_guide(town)

    assert [%{slug: "merritt-parkway"} | _] = ScenicBywaysCollections.upsert_all!()

    html = conn |> get(~p"/c/merritt-parkway") |> html_response(200)

    # The page's JSON-LD block also names every /g/ URL, so counting the
    # visible anchor hrefs specifically (rather than every substring
    # occurrence of "/g/") is what actually proves one link per town.
    towns = Map.fetch!(@byway_towns, "merritt-parkway")
    assert length(Regex.scan(~r{href="/g/}, html)) == length(towns)

    assert html =~ "Department of Transportation"
  end
end
