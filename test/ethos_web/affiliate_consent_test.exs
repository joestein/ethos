defmodule EthosWeb.AffiliateConsentTest do
  use EthosWeb.ConnCase, async: false

  import Ethos.GuidesFixtures

  test "the GetYourGuide script is not a plain tag in the head", %{conn: conn} do
    # It sets cookies and loads for EEA/UK visitors — Rome is an Italian
    # locale. A <script src> in the head runs before any consent signal
    # exists, so the tag is replaced by a data element that assets/js/
    # analytics.js acts on only after consent resolves.
    guide = published_guide_fixture(%{state: "Italy", county: "Rome", destination: "Rome, Italy"})

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    refute html =~ "widget.getyourguide.com"
  end

  test "the partner id still reaches the page for the loader to use", %{conn: conn} do
    guide = published_guide_fixture(%{state: "Italy", county: "Rome", destination: "Rome, Italy"})

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ ~s(name="gyg-partner-id")
    assert html =~ "ZA4AIMF"
  end

  test "no partner id where no locale resolves", %{conn: conn} do
    guide = published_guide_fixture(%{state: "Washington", county: "Puget Sound"})

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    refute html =~ "gyg-partner-id"
  end
end
