defmodule EthosWeb.DestinationRedirectTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures

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

  # The old router's third route was `get "/destinations/:slug"` — one hub per
  # guide `destination_slug`, so `/destinations/waterbury` and
  # `/destinations/bay-ridge` were real, indexed pages. The tree serves those
  # towns several segments deep now, which left every one of them a 404. Each
  # slug is mapped to the node its guide sits on today, derived from the
  # corpus's own `destination` and `destination_path`.
  describe "single-slug town hubs" do
    @town_redirects [
      {"/destinations/waterbury",
       "/destinations/united-states/connecticut/new-haven-county/waterbury"},
      {"/destinations/woodbury",
       "/destinations/united-states/connecticut/litchfield-county/woodbury"},
      {"/destinations/bay-ridge",
       "/destinations/united-states/new-york/new-york-city/brooklyn/bay-ridge"},
      {"/destinations/astoria",
       "/destinations/united-states/new-york/new-york-city/queens/astoria"},
      {"/destinations/trastevere", "/destinations/italy/lazio/rome/trastevere"},
      {"/destinations/lewisham", "/destinations/united-kingdom/england/london/lewisham"},
      {"/destinations/chicago", "/destinations/united-states/illinois/chicago"}
    ]

    test "a town slug 301s to the node that holds it now", %{conn: conn} do
      for {from, to} <- @town_redirects do
        conn = get(build_conn(), from)
        assert redirected_to(conn, 301) == to, "#{from} did not 301 to #{to}"
      end

      _ = conn
    end

    # `vatican-city` is both a guide's town slug and a country node's own path.
    # Exact-node resolution runs first and must keep winning, so the slug is
    # deliberately not registered as anyone's legacy path.
    test "a town slug that is also a country node renders that node", %{conn: conn} do
      conn = get(conn, ~p"/destinations/vatican-city")
      assert html_response(conn, 200) =~ "Vatican City"
    end

    # Madison, Connecticut and Madison, Brooklyn both published
    # `/destinations/madison` and only one can own it. Sending Brooklyn's
    # traffic to Connecticut is worse than a 404, because it looks like it
    # worked — so the slug stays unmapped until a human picks.
    test "the one colliding slug is left as a 404 rather than guessed", %{conn: conn} do
      conn = get(conn, ~p"/destinations/madison")
      assert html_response(conn, 404)
    end
  end

  # A 301 that lands on a hub not listing the guide that justified it is a
  # broken promise wearing a correct status code. Three representative shapes:
  # a ballpark county hub, a Connecticut town hub, a London borough hub.
  describe "a redirect lands where the guide actually is" do
    @lands_on [
      {"/destinations/illinois/cook-county", "united-states/illinois/chicago"},
      {"/destinations/woodbury", "united-states/connecticut/litchfield-county/woodbury"},
      {"/destinations/lewisham", "united-kingdom/england/london/lewisham"}
    ]

    test "the corpus really publishes a guide on the node each one points at", %{conn: conn} do
      published = corpus_destination_paths()

      for {from, target} <- @lands_on do
        assert MapSet.member?(published, target),
               "#{from} 301s to #{target}, which no guide in the corpus sits on"
      end

      _ = conn
    end

    test "the guide on that node renders on the page the redirect lands on", %{conn: conn} do
      for {from, target} <- @lands_on do
        node = Ethos.Destinations.get_by_path(target)

        guide =
          published_guide_fixture(%{
            "title" => "The #{node.name} Guide",
            "destination" => node.name,
            "destination_id" => node.id
          })

        landed = get(build_conn(), from) |> redirected_to(301)
        html = build_conn() |> get(landed) |> html_response(200)

        assert html =~ guide.title, "#{from} landed on #{landed}, which does not list its guide"
      end

      _ = conn
    end
  end

  # Every `destination_path` the corpus publishes, both halves of it: the JSON
  # seed files and the Elixir guide modules. Read off disk rather than from the
  # seeded database, because the point is what the corpus *says*, which is what
  # the roster's legacy paths were derived from.
  defp corpus_destination_paths do
    json =
      for file <- Ethos.SeedDataHelpers.all_seed_files(),
          guide = file |> File.read!() |> Jason.decode!() |> Map.get("guide"),
          is_map(guide),
          do: guide["destination_path"]

    code = for {data, _owner} <- Ethos.SeedDataHelpers.code_guides(), do: data[:destination_path]

    MapSet.new(json ++ code)
  end
end
