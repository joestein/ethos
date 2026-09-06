defmodule EthosWeb.AffiliateConsentTest do
  use EthosWeb.ConnCase, async: false

  import Ethos.GuidesFixtures

  # Real roster paths, not invented ones. These tests used to file their guides
  # with `%{state: "Italy", county: "Rome"}`, which resolved a locale through a
  # registry keyed on state slugs. The registry is keyed on destination-tree
  # paths now, so that shape resolves to nothing at all — and every assertion
  # here is about what a page in an affiliate geography does, so a fixture
  # outside every geography made the two `refute`s below pass vacuously.
  # `published_guide_fixture/1` seeds the node and its ancestors from the
  # committed roster, so these are the paths production actually holds.
  @rome_node "italy/lazio/rome"

  # Outside every configured campaign: its ancestors are `united-states` and
  # itself, and the registry holds neither. A real roster node with no
  # committed page on it, which is what makes it safe as a negative probe.
  @out_of_scope_node "united-states/washington"

  defp rome_guide do
    published_guide_fixture(%{
      "title" => "Ardeatino",
      "destination" => "Rome, Italy",
      "destination_path" => @rome_node
    })
  end

  test "the GetYourGuide script is not a plain tag in the head", %{conn: conn} do
    # It sets cookies and loads for EEA/UK visitors — Rome is an Italian
    # locale. A <script src> in the head runs before any consent signal
    # exists, so the tag is replaced by a data element that assets/js/
    # analytics.js acts on only after consent resolves.
    guide = rome_guide()

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    # Non-vacuity, and the reason this file's fixtures are worth being careful
    # about: the refute below is only meaningful on a page that really does
    # carry an affiliate unit. A guide filed outside every campaign renders no
    # head tag and no script, and would pass the refute while proving nothing.
    assert html =~ ~s(name="gyg-partner-id"),
           "this guide resolved to no affiliate locale, so the refute below is vacuous"

    refute html =~ "widget.getyourguide.com"
  end

  test "the partner id still reaches the page for the loader to use", %{conn: conn} do
    guide = rome_guide()

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ ~s(name="gyg-partner-id")
    assert html =~ "ZA4AIMF"
  end

  test "no partner id where no locale resolves", %{conn: conn} do
    guide =
      published_guide_fixture(%{
        "title" => "Puget Sound",
        "destination" => "Puget Sound, Washington",
        "destination_path" => @out_of_scope_node
      })

    # Non-vacuity: the page is outside every campaign because the registry
    # holds none of its ancestors, not because the fixture named a node that
    # does not exist. `locale_for/1` is the same resolver the layout uses.
    refute Ethos.Affiliates.locale_for(@out_of_scope_node)

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    refute html =~ "gyg-partner-id"
  end
end
