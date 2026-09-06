defmodule EthosWeb.SeasonStampTest do
  @moduledoc """
  async: false — this module sets a global season override
  (`Ethos.SiteSettings.put_season_override/1`), which is process-wide state,
  not per-test sandboxed data. Running alongside async tests would race:
  another test's page render could observe this module's override, or vice
  versa.
  """
  use EthosWeb.ConnCase, async: false

  import Ethos.AccountsFixtures

  test "the home page stamps the current season", %{conn: conn} do
    # This only proves the attribute is present and well-formed. It cannot
    # detect PutSeason being missing from the :browser pipeline entirely:
    # today's calendar season is summer, which is also the layout's
    # `|| "summer"` fallback value, so a conn that never touched the plug
    # would stamp the same string and this assertion would still pass. Do
    # not "strengthen" this by asserting a specific season — that would only
    # hold for part of the year. "an override changes the stamp", below, is
    # the test that actually distinguishes the plug running from the plug
    # being absent, year-round.
    html = conn |> get(~p"/") |> html_response(200)

    assert html =~ ~s(data-season=")
  end

  test "an override changes the stamp", %{conn: conn} do
    {:ok, _} = Ethos.SiteSettings.put_season_override(:winter)

    html = conn |> get(~p"/") |> html_response(200)

    assert html =~ ~s(data-season="winter")
    refute html =~ ~s(data-season="summer")
  end

  test "a rendered 404 still has a complete page", %{conn: conn} do
    # require_admin_user/2 RENDERS a 404 through the root layout rather than
    # raising, and Plan 4a put eight routes behind it (/guides, /guides/new,
    # /guides/:id/edit, and five more). This asserts that cross-plan
    # interaction directly: a regular user hitting one of those routes still
    # gets a complete, stamped page rather than a bare "Not Found" or a
    # broken layout.
    #
    # It does NOT prove @season would be unsafe here — it wouldn't be. This
    # request completes the whole :browser pipeline, PutSeason included,
    # before require_admin_user ever runs (both are pipe_through in the same
    # scope, :browser first), so :season is already assigned by the time this
    # 404 renders. The `assigns[:season] || "summer"` guard in the layout is
    # for a request that skips PutSeason entirely, not for this one; see
    # root_layout_fallback_test.exs for the test that actually exercises
    # that guard by rendering the layout with no :season assign at all.
    conn = log_in_user(conn, user_fixture())
    html = conn |> get(~p"/guides/new") |> html_response(404)

    assert html =~ ~s(data-season=")
  end
end
