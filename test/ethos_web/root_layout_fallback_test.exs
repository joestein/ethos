defmodule EthosWeb.RootLayoutFallbackTest do
  @moduledoc """
  The one test that actually exercises `assigns[:season] || "summer"` in
  `root.html.heex`.

  Every reachable request in this app assigns `:season` before the root
  layout ever renders — `PutSeason` is the last plug in `:browser`, and even
  the admin-only 404s `EthosWeb.UserAuth.require_admin_user/2` renders happen
  on a conn that already completed that pipeline (see
  `season_stamp_test.exs`'s "a rendered 404 still has a complete page"). So
  no test that goes through the router can ever hit the `|| "summer"`
  fallback — every one of them would pass whether the layout read
  `assigns[:season]` or the unguarded `@season`.

  This test renders the layout directly, deliberately omitting `:season`
  from the assigns, so it is the only thing in the suite that goes red if
  the layout is changed to read `@season`.
  """

  use EthosWeb.ConnCase, async: true

  require Phoenix.LiveViewTest

  test "renders data-season=\"summer\" when :season is not assigned" do
    html =
      Phoenix.LiveViewTest.render_component(&EthosWeb.Layouts.root/1, %{
        current_user: nil,
        inner_content: "fallback probe"
      })

    assert html =~ ~s(data-season="summer")
  end
end
