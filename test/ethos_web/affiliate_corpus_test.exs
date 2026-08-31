defmodule EthosWeb.AffiliateCorpusTest do
  @moduledoc """
  Guards that read the committed corpus rather than fixtures.

  A fixture describing a mixed-geography page keeps passing long after the real
  page changes shape. These read the real seed files and the real collection,
  so they fail when production changes and cannot drift quietly.
  """
  use ExUnit.Case, async: true

  alias Ethos.Affiliates
  alias Ethos.Guides.Guide
  alias Ethos.Seeds.Catalog
  alias Ethos.Seeds.DataGuide

  defp row_from_seed_file(path) do
    g = DataGuide.load!(path)["guide"]

    %{
      state_slug: Guide.derive_destination_slug(g["state"]),
      county: g["county"]
    }
  end

  defp row_from_module(mod) do
    d = mod.data()

    %{
      state_slug: Guide.derive_destination_slug(d.state),
      county: Map.get(d, :county)
    }
  end

  test "the real /destinations/madison guide set resolves to no locale" do
    rows =
      for path <- [
            "priv/seed_data/brooklyn/madison.json",
            "priv/seed_data/connecticut/madison.json"
          ],
          do: row_from_seed_file(path)

    # Non-vacuity: if either file is ever renamed or its state changed, this
    # stops describing a real collision and the refute below becomes empty
    # ceremony. Assert the premise before asserting the conclusion.
    assert length(rows) == 2

    assert rows |> Enum.map(& &1.state_slug) |> Enum.uniq() |> length() == 2,
           "the two madison seed files no longer describe two different states — " <>
             "this test's premise is gone, not its conclusion"

    refute Affiliates.unanimous_locale(rows),
           "a page serving Madison, New York and Madison, Connecticut resolved to a locale"
  end

  test "the real MLB ballparks collection resolves to no locale" do
    rows =
      Catalog.guide_modules("ballparks")
      |> Enum.map(fn {mod, _region} -> row_from_module(mod) end)

    assert length(rows) >= 30, "expected the full ballpark set, got #{length(rows)}"

    assert rows |> Enum.map(& &1.state_slug) |> Enum.uniq() |> length() > 1,
           "the ballpark guides no longer span multiple states — premise gone"

    refute Affiliates.unanimous_locale(rows),
           "a collection spanning 30 states resolved to a locale"
  end

  test "locale_from_assigns returns nil for assigns carrying no geography" do
    refute EthosWeb.Affiliate.locale_from_assigns(%{})
    refute EthosWeb.Affiliate.locale_from_assigns(%{flash: %{}, current_user: nil})
    refute EthosWeb.Affiliate.locale_from_assigns(%{guides: []})
    refute EthosWeb.Affiliate.locale_from_assigns(%{guides: "not a list"})
  end

  # The future mistake this catches: someone adds <.affiliate_unit> to a page
  # template, not realising it already comes from the app layout, and the page
  # ships with two. Two units render fine and look like an ad farm.
  #
  # Markup lives in two file shapes in this codebase: `.heex` template files
  # and inline `~H"""..."""` sigils inside `.ex` modules (every LiveView under
  # lib/ethos_web/live/**, plus shared components like core_components.ex).
  # A walk that only globbed `.heex` would report zero offenders for a unit
  # added inside an `.ex` file's inline template while the bug shipped on
  # every page that renders that component — so both extensions are scanned
  # here.
  test "no page template contains the widget markup — it comes from the layout only" do
    offenders =
      (Path.wildcard("lib/ethos_web/**/*.heex") ++ Path.wildcard("lib/ethos_web/**/*.ex"))
      # The layout is the one legitimate caller — it's what puts the unit on
      # every page in the first place (see affiliate.ex's moduledoc).
      |> Enum.reject(&(Path.basename(&1) == "app.html.heex"))
      # The module that *defines* affiliate_unit/1 necessarily contains the
      # string "affiliate_unit" in its own source (the def, the doc, the
      # moduledoc) and would otherwise be a permanent false positive. Excluded
      # by exact path, not by directory, so sibling files in components/ —
      # core_components.ex above all — stay covered.
      |> Enum.reject(&(&1 == "lib/ethos_web/components/affiliate.ex"))
      |> Enum.filter(fn f -> File.read!(f) =~ "affiliate_unit" end)

    assert offenders == [],
           "these templates render the affiliate unit, which the app layout already " <>
             "renders on every page — the result is two widgets: #{inspect(offenders)}"
  end
end
