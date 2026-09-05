defmodule Ethos.Foliage.SvgTest do
  use ExUnit.Case, async: true

  alias Ethos.Foliage
  alias Ethos.Foliage.Svg

  defp render(week, opts \\ []), do: week |> Svg.map(opts) |> Phoenix.HTML.safe_to_string()

  describe "map/2" do
    test "draws one path per town" do
      html = render(5)
      assert length(Regex.scan(~r/data-town="/, html)) == 169
    end

    test "labels every town for screen readers and native tooltips" do
      html = render(5)
      assert html =~ "<title>Salisbury — Peak</title>"
    end

    test "colours differ between weeks" do
      early = render(1)
      late = render(8)
      refute early == late
    end

    test "week one is entirely green" do
      html = render(1)
      green = Foliage.stage_color(:green)
      # Every town is still green in DEEP's first week, statewide.
      assert length(Regex.scan(~r/fill="#{green}"/, html)) == 169
    end

    test "emits no script tag" do
      refute render(5) =~ "<script"
    end
  end

  describe "map/2 with a route" do
    test "draws the route path" do
      route = Foliage.route("hartford-west")
      html = render(5, route: route)
      assert html =~ ~s(data-route="hartford-west")
    end

    test "marks the route's towns" do
      route = Foliage.route("hartford-west")
      html = render(5, route: route)
      assert length(Regex.scan(~r/data-on-route="true"/, html)) == 11
    end
  end
end
