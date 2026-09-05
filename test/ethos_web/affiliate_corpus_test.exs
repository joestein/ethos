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

  # A seed file names a destination node instead of carrying a state/county
  # pair, so the pair `Affiliates.unanimous_locale/1` reads is derived here the
  # way the loaders derive it — off the roster, through
  # `Destinations.legacy_geo_from_trail/1`, so this gate and the loaders cannot
  # disagree about what a file's state is.
  defp row_from_seed_file(path) do
    row_from_node(DataGuide.load!(path)["guide"]["destination_path"])
  end

  # A code guide names a node too, so it derives its pair exactly as a seed file
  # does. Reading `d.state` here instead would be reading a field no guide
  # carries any more — and, before the field went, would have kept this gate
  # green off authored values while the loaders wrote derived ones.
  defp row_from_module(mod), do: row_from_node(mod.data().destination_path)

  defp row_from_node(node_path) do
    trails = Ethos.SeedDataHelpers.destination_trails()
    geo = Ethos.Destinations.legacy_geo_from_trail(Map.fetch!(trails, node_path))

    %{
      state_slug: Guide.derive_destination_slug(geo["state"]),
      county: geo["county"]
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
           "a collection spanning 19 distinct state values resolved to a locale"
  end

  # --- The positive case, which nothing checked ------------------------------
  #
  # Every assertion above this line is a REFUTE: it proves a mixed-geography
  # page resolves to nothing. Not one of them notices the day a page that
  # SHOULD resolve stops resolving, and that is the direction money flows in.
  #
  # It had already happened. `:counties` listed "Bronx"; the destination node
  # is named "The Bronx", `Destinations.legacy_geo/1` copies the node's name
  # into a page's `county` verbatim, and the membership test in
  # `Ethos.Affiliates` is exact. So every Bronx guide and place — thirteen seed
  # files plus the Yankee Stadium modules — served HTTP 200, rendered
  # correctly, and carried no affiliate unit. No test failed, because no test
  # asked.
  #
  # This asks. It walks the committed corpus, derives each row's pair the way
  # the loaders do, and asserts that any row landing in a state that HAS a
  # guarded locale is allowed by that locale's list. A row in an unmonetized
  # state is not this gate's business; a row inside a campaign's own geography
  # that the campaign's own allowlist rejects is exactly what it is for.
  test "every corpus row in a guarded locale's state resolves to that locale" do
    guarded =
      for {slug, locale} <- Application.get_env(:ethos, :affiliate_locales, %{}),
          Map.has_key?(locale, :counties),
          into: %{},
          do: {slug, locale}

    # Non-vacuous twice over: with no guarded locale, or with no corpus row in
    # one, every assertion below is skipped and this passes having checked
    # nothing at all.
    assert map_size(guarded) > 0,
           "no affiliate locale carries a :counties guard, so this gate checks nothing"

    in_scope = for row <- corpus_rows(), Map.has_key?(guarded, row.state_slug), do: row

    assert length(in_scope) > 0,
           "no committed corpus row lands in #{inspect(Map.keys(guarded))}, so this gate " <>
             "checks nothing"

    unresolved =
      for row <- in_scope,
          is_nil(Affiliates.locale_for(row.state_slug, row.county)),
          uniq: true,
          do: {row.state_slug, row.county, row.owner}

    assert unresolved == [],
           "these committed pages sit inside a campaign's geography but fall outside its " <>
             ":counties allowlist, so they render no affiliate unit — silently, with a 200 " <>
             "and a correct-looking page: #{inspect(unresolved)}"
  end

  # Every guide and place in the committed corpus, JSON and code alike, as the
  # {state_slug, county} pair the loaders derive from its destination node.
  defp corpus_rows do
    trails = Ethos.SeedDataHelpers.destination_trails()

    json =
      for f <- Ethos.SeedDataHelpers.all_seed_files(),
          data = DataGuide.load!(f),
          node_path <- [data["guide"]["destination_path"] | place_paths(data)],
          do: row_from_node(node_path, Path.basename(f), trails)

    code_guides =
      for {d, owner} <- Ethos.SeedDataHelpers.code_guides(),
          path = Map.get(d, :destination_path),
          do: row_from_node(path, Path.basename(owner.seed_file), trails)

    code_places =
      for {p, owner} <- Ethos.SeedDataHelpers.code_places(),
          path = p[:destination_path],
          do: row_from_node(path, Path.basename(owner.seed_file), trails)

    json ++ code_guides ++ code_places
  end

  defp place_paths(data), do: for(p <- data["places"], do: p["destination_path"])

  defp row_from_node(node_path, owner, trails) do
    geo = Ethos.Destinations.legacy_geo_from_trail(Map.fetch!(trails, node_path))

    %{
      state_slug: Guide.derive_destination_slug(geo["state"]),
      county: geo["county"],
      owner: owner
    }
  end

  # Every locale the components touch by dot access — @locale.partner_id in
  # root.html.heex, @locale.cmp in app.html.heex — so a missing key is not a
  # missing widget but a KeyError out of a layout: 500 on every page in that
  # geography. partner_id raises out of root.html.heex, before the app layout
  # is even reached. New York is pinned by literal assertions elsewhere in the
  # suite; this is what covers Rome, Amsterdam and everything after.
  @known_networks [:getyourguide]

  test "every configured affiliate locale is well-formed" do
    for {slug, locale} <- Application.get_env(:ethos, :affiliate_locales, %{}) do
      assert is_map(locale), "affiliate locale #{inspect(slug)} is not a map"

      assert Map.get(locale, :network) in @known_networks,
             "affiliate locale #{inspect(slug)}: :network is #{inspect(Map.get(locale, :network))}, " <>
               "expected one of #{inspect(@known_networks)} — an unknown network renders no unit"

      for key <- [:partner_id, :cmp] do
        value = Map.get(locale, key)

        assert is_binary(value) and value != "",
               "affiliate locale #{inspect(slug)}: #{inspect(key)} is #{inspect(value)}, " <>
                 "expected a non-empty string — the layouts read it with dot access and a " <>
                 "missing key raises KeyError out of the layout, 500ing every page in #{inspect(slug)}"
      end

      case Map.fetch(locale, :counties) do
        :error ->
          :ok

        {:ok, counties} ->
          assert is_list(counties) and counties != [],
                 "affiliate locale #{inspect(slug)}: :counties is #{inspect(counties)}, " <>
                   "expected a non-empty list — an empty list matches no county and " <>
                   "silently disables every guide page in #{inspect(slug)}"

          for county <- counties do
            assert is_binary(county) and county != "",
                   "affiliate locale #{inspect(slug)}: :counties contains #{inspect(county)}, " <>
                     "expected a non-empty string"
          end
      end

      case Map.fetch(locale, :placement) do
        :error ->
          :ok

        {:ok, placement} ->
          assert placement in [:top, :bottom],
                 "affiliate locale #{inspect(slug)}: :placement is #{inspect(placement)}, " <>
                   "expected :top or :bottom — a value matching neither layout slot renders " <>
                   "no unit at all, silently, on every page in #{inspect(slug)}"
      end
    end
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
  # Two needles, because there are two ways to ship a second unit. Grepping the
  # component name alone misses the copy-paste of raw `<div data-gyg-widget=…>`
  # markup into a template — which is the same bug and reports zero offenders.
  # "data-gyg" appears only in affiliate.ex today, so the second needle costs
  # nothing and closes that hole.
  #
  # Markup lives in two file shapes in this codebase: `.heex` template files
  # and inline `~H"""..."""` sigils inside `.ex` modules (every LiveView under
  # lib/ethos_web/live/**, plus shared components like core_components.ex).
  # A walk that only globbed `.heex` would report zero offenders for a unit
  # added inside an `.ex` file's inline template while the bug shipped on
  # every page that renders that component — so both extensions are scanned
  # here.
  # Both exclusions are exact paths, never basenames or directories: a
  # basename match would also excuse a second `app.html.heex` added anywhere
  # under lib/ethos_web, and excluding all of components/ would re-open
  # core_components.ex — the sibling this walk exists to cover.
  @unit_needles ["affiliate_unit", "data-gyg"]
  @legitimate_callers [
    # The layout is the one legitimate caller — it's what puts the unit on
    # every page in the first place (see affiliate.ex's moduledoc).
    "lib/ethos_web/components/layouts/app.html.heex",
    # The module that *defines* affiliate_unit/1 necessarily contains both
    # needles in its own source (the def, the doc, the markup) and would
    # otherwise be a permanent false positive.
    "lib/ethos_web/components/affiliate.ex"
  ]

  test "no page template contains the widget markup — it comes from the layout only" do
    offenders =
      (Path.wildcard("lib/ethos_web/**/*.heex") ++ Path.wildcard("lib/ethos_web/**/*.ex"))
      |> Enum.reject(&(&1 in @legitimate_callers))
      |> Enum.filter(fn f ->
        source = File.read!(f)
        Enum.any?(@unit_needles, &(source =~ &1))
      end)

    assert offenders == [],
           "these templates render the affiliate unit, which the app layout already " <>
             "renders on every page — the result is two widgets: #{inspect(offenders)}"
  end
end
