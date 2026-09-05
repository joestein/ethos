defmodule EthosWeb.DestinationRedirectTest do
  use EthosWeb.ConnCase, async: true

  setup do
    Ethos.Seeds.DestinationTree.upsert_all!()
    :ok
  end

  @redirects [
    {"/destinations/connecticut", "/destinations/united-states/connecticut"},
    {"/destinations/connecticut/litchfield-county",
     "/destinations/united-states/connecticut/litchfield-county"},
    {"/destinations/new-york/manhattan",
     "/destinations/united-states/new-york/new-york-city/manhattan"},
    {"/destinations/new-york/brooklyn",
     "/destinations/united-states/new-york/new-york-city/brooklyn"},
    {"/destinations/rome", "/destinations/italy/lazio/rome"},
    {"/destinations/italy/rome", "/destinations/italy/lazio/rome"},
    {"/destinations/england/london", "/destinations/united-kingdom/england/london"}
  ]

  # `/destinations/italy` is deliberately NOT in that table: "italy" is a real
  # node now, so it renders the country hub listing Lazio. Exact-node
  # resolution runs before the legacy lookup, which is the correct order.
  test "a legacy path that is now a real node renders instead of redirecting", %{conn: conn} do
    conn = get(conn, ~p"/destinations/italy")
    assert html_response(conn, 200) =~ "Lazio"
  end

  test "every legacy path 301s to its new home", %{conn: conn} do
    for {from, to} <- @redirects do
      conn = get(build_conn(), from)
      assert redirected_to(conn, 301) == to, "#{from} did not 301 to #{to}"
    end

    _ = conn
  end

  test "an unknown path is still a 404", %{conn: conn} do
    conn = get(conn, ~p"/destinations/atlantis")
    assert html_response(conn, 404)
  end

  # The ballparks model no county tier: Task 6 put each stadium's guide on its
  # city node, which left the `/destinations/{state}/{county}` hub each guide
  # used to list on with nothing behind it. Those hubs 301 to the city that now
  # lists the guide. A county is not a city — this is a redirect between two
  # URLs, not a claim that Cook County and Chicago are the same place, and the
  # county name appears nowhere on the node it points at.
  describe "orphaned ballpark county hubs" do
    test "a county hub 301s to the city that now lists its guide", %{conn: conn} do
      conn = get(conn, ~p"/destinations/illinois/cook-county")
      assert redirected_to(conn, 301) == "/destinations/united-states/illinois/chicago"
    end

    test "a second stadium in another state does the same", %{conn: conn} do
      conn = get(conn, ~p"/destinations/washington/king-county")
      assert redirected_to(conn, 301) == "/destinations/united-states/washington/seattle"
    end

    test "the redirect target carries no county name", %{conn: conn} do
      conn = get(conn, ~p"/destinations/united-states/illinois/chicago")
      html = html_response(conn, 200)
      assert html =~ "Chicago"
      refute html =~ "Cook County"
    end
  end
end
