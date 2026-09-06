defmodule EthosWeb.AffiliateCorpusTest do
  @moduledoc """
  Guards that read the committed corpus rather than fixtures.

  A fixture describing a mixed-geography page keeps passing long after the real
  page changes shape. These read the real seed files and the real collection,
  so they fail when production changes and cannot drift quietly.
  """
  use ExUnit.Case, async: true

  alias Ethos.Affiliates
  alias Ethos.Seeds.Catalog
  alias Ethos.Seeds.DataGuide

  # A row is the PATH of the destination node its seed file names, because that
  # is now the whole of a page's geography: `Ethos.Affiliates` matches a locale
  # key against a node path or a prefix of it, and the loaders write nothing
  # else. Reading the path off the file is reading exactly what production
  # resolves through, with no second derivation for the two to disagree about.
  defp path_from_seed_file(file), do: DataGuide.load!(file)["guide"]["destination_path"]

  # A code guide names a node too. Reading a `d.state` here instead would be
  # reading a field no guide carries any more — and, before the field went,
  # would have kept this gate green off authored values while the loaders wrote
  # derived ones.
  defp path_from_module(mod), do: mod.data().destination_path

  # The segment that used to be a page's "state": the region-or-country tier
  # under the root. Only the non-vacuity premises below use it — nothing
  # resolves through it — and it is derived here rather than by
  # `Destinations.legacy_geo_from_trail/1`, which went with the columns.
  defp geography_of(path), do: path |> String.split("/") |> Enum.take(2) |> Enum.join("/")

  test "the real /destinations/madison guide set resolves to no locale" do
    paths =
      for file <- [
            "priv/seed_data/brooklyn/madison.json",
            "priv/seed_data/connecticut/madison.json"
          ],
          do: path_from_seed_file(file)

    # Non-vacuity: if either file is ever renamed or refiled, this stops
    # describing a real collision and the refute below becomes empty ceremony.
    # Assert the premise before asserting the conclusion.
    assert length(paths) == 2

    assert paths |> Enum.map(&geography_of/1) |> Enum.uniq() |> length() == 2,
           "the two madison seed files no longer hang from two different geographies — " <>
             "this test's premise is gone, not its conclusion"

    refute Affiliates.unanimous_locale(paths),
           "a page serving Madison, New York and Madison, Connecticut resolved to a locale"
  end

  test "the real MLB ballparks collection resolves to no locale" do
    paths =
      Catalog.guide_modules("ballparks")
      |> Enum.map(fn {mod, _region} -> path_from_module(mod) end)

    assert length(paths) >= 30, "expected the full ballpark set, got #{length(paths)}"

    assert paths |> Enum.map(&geography_of/1) |> Enum.uniq() |> length() > 1,
           "the ballpark guides no longer span multiple geographies — premise gone"

    refute Affiliates.unanimous_locale(paths),
           "a collection spanning 19 distinct geographies resolved to a locale"
  end

  # --- The positive case, which nothing checked ------------------------------
  #
  # Every assertion above this line is a REFUTE: it proves a mixed-geography
  # page resolves to nothing. Not one of them notices the day a page that
  # SHOULD resolve stops resolving, and that is the direction money flows in.
  #
  # It had happened twice, both times as a side effect of moving the corpus onto
  # the destination tree, and neither time did a test go red:
  #
  #   * `:counties` listed "Bronx". The borough node is named "The Bronx", a
  #     page's county was its node's name verbatim, and the membership test was
  #     exact — so thirteen Bronx seed files and the two Yankee Stadium modules
  #     rendered no unit.
  #
  #   * The Italian locale was keyed `"italy"`. A page's state was its node's
  #     nearest `region` ancestor, and the thirty Rome neighbourhood guides hang
  #     from `italy/lazio/rome/*` — so they began deriving "Lazio" and stopped
  #     resolving at all. A locale key can rot exactly like a county name.
  #
  # BOTH bugs were a registry naming a geography the corpus does not sit in, and
  # both are now largely unrepresentable: the registry is keyed on node paths,
  # so "the page's geography" and "the campaign's geography" are the same
  # strings the tree and the URLs already use, and there is no derived display
  # name left to spell a second way. What CAN still rot is the key itself — a
  # renamed or restructured subtree, or a typo — and that is what
  # `EthosWeb.AffiliateRegistryScopeTest` below is for.
  #
  # This one holds the weaker invariant from the corpus side: every committed
  # page inside a campaign's subtree resolves to a locale.
  test "every corpus row inside a locale's geography resolves to that locale" do
    locales = Application.get_env(:ethos, :affiliate_locales, %{})
    rows = corpus_rows()

    # "Inside a campaign's geography" is `Affiliates.ancestor_paths/1`, the same
    # function `locale_for/1` resolves with, rather than a prefix compare
    # re-spelled here. A gate that re-implements the rule it guards can agree
    # with itself while disagreeing with production — and the `<> "/"` this
    # replaced was the exact place a missing separator would have made
    # `italy/lazio` match `italy/lazio-vecchia`.
    in_scope =
      for row <- rows,
          ancestors = Affiliates.ancestor_paths(row.path),
          key <- Map.keys(locales),
          key in ancestors,
          uniq: true,
          do: {key, row}

    # Non-vacuous, and specific about what would make it vacuous. One locale
    # geography is not enough: the Bronx bug lived inside New York, so a gate
    # that only ever saw New York would still have found it — but the Rome bug
    # was a whole geography dropping out of scope, which a one-locale gate
    # cannot see at all.
    covered = in_scope |> Enum.map(&elem(&1, 0)) |> Enum.uniq() |> Enum.sort()

    assert length(covered) >= 2,
           "only #{inspect(covered)} of the configured locales covers any committed page — " <>
             "a locale whose subtree holds no corpus row is either dead config or a key that " <>
             "no longer names the node its pages hang from, which is the second bug this " <>
             "gate exists for"

    unresolved =
      for {key, row} <- in_scope,
          is_nil(Affiliates.locale_for(row.path)),
          uniq: true,
          do: {key, row.path, row.owner}

    assert unresolved == [],
           "these committed pages sit inside a campaign's own geography and resolve to no " <>
             "locale, so they render no affiliate unit — silently, with a 200 and a " <>
             "correct-looking page: #{inspect(unresolved)}"
  end

  # Every guide and place in the committed corpus, JSON and code alike, as the
  # destination node path it names.
  defp corpus_rows do
    json =
      for f <- Ethos.SeedDataHelpers.all_seed_files(),
          data = DataGuide.load!(f),
          node_path <- [data["guide"]["destination_path"] | place_paths(data)],
          do: %{path: node_path, owner: Path.basename(f)}

    code_guides =
      for {d, owner} <- Ethos.SeedDataHelpers.code_guides(),
          path = Map.get(d, :destination_path),
          do: %{path: path, owner: Path.basename(owner.seed_file)}

    code_places =
      for {p, owner} <- Ethos.SeedDataHelpers.code_places(),
          path = p[:destination_path],
          do: %{path: path, owner: Path.basename(owner.seed_file)}

    json ++ code_guides ++ code_places
  end

  defp place_paths(data), do: for(p <- data["places"], do: p["destination_path"])

  # Every locale the components touch by dot access — @locale.partner_id in
  # root.html.heex, @locale.cmp in app.html.heex — so a missing key is not a
  # missing widget but a KeyError out of a layout: 500 on every page in that
  # geography. partner_id raises out of root.html.heex, before the app layout
  # is even reached. New York is pinned by literal assertions elsewhere in the
  # suite; this is what covers Rome, Amsterdam and everything after.
  @known_networks [:getyourguide]

  test "every configured affiliate locale is well-formed" do
    for {slug, locale} <- Application.get_env(:ethos, :affiliate_locales, %{}) do
      assert is_binary(slug) and
               Regex.match?(~r{^[a-z0-9]+(-[a-z0-9]+)*(/[a-z0-9]+(-[a-z0-9]+)*)*$}, slug),
             "affiliate locale key #{inspect(slug)} is not a destination node path — the " <>
               "registry is keyed on paths, and a key in any other shape matches no page"

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

defmodule EthosWeb.AffiliateRegistryScopeTest do
  @moduledoc """
  Does each configured campaign still name a geography the corpus lives in?

  `async: false`, and the reason is the same one recorded in
  `affiliate_placement_test.exs`: `:ethos, :affiliate_locales` is global
  application state, and the placement tests inject a fictional locale into it
  through `Application.put_env/3` while async modules run. ExUnit runs every
  synchronous module after every async one has finished, so this module — the
  one file that asserts something about EVERY key in the registry — is the only
  place that sees the committed registry and nothing else.

  This is the half of the affiliate class that path-keying does NOT make
  unrepresentable. A page inside `united-states/new-york/new-york-city` now
  resolves by construction; what can still go wrong is the key naming a node
  that has been renamed, moved, or never existed — `.../nyc`, `italy/latium` —
  and then the campaign covers nothing at all. That is precisely the shape of
  both bugs this gate was written after, and it fails loudly rather than
  turning a revenue path off with a 200 and a correct-looking page.
  """
  use ExUnit.Case, async: false

  alias Ethos.Seeds.DataGuide

  defp corpus_paths do
    json =
      for f <- Ethos.SeedDataHelpers.all_seed_files(),
          data = DataGuide.load!(f),
          path <- [
            data["guide"]["destination_path"] | Enum.map(data["places"], & &1["destination_path"])
          ],
          do: path

    code =
      for(
        {d, _o} <- Ethos.SeedDataHelpers.code_guides(),
        path = Map.get(d, :destination_path),
        do: path
      ) ++
        for {p, _o} <- Ethos.SeedDataHelpers.code_places(), path = p[:destination_path], do: path

    MapSet.new(json ++ code)
  end

  test "every configured locale names a live roster node with committed pages under it" do
    locales = Application.get_env(:ethos, :affiliate_locales, %{})
    roster = MapSet.new(Ethos.Seeds.DestinationTree.load!(), & &1["path"])
    corpus = corpus_paths()

    # Non-vacuity in both directions: an empty registry, or a corpus that read
    # as empty, would pass every assertion below without checking anything.
    assert map_size(locales) >= 2, "expected at least two configured locales"
    assert MapSet.size(corpus) >= 100, "the committed corpus read as #{MapSet.size(corpus)} paths"

    unknown = for {key, _} <- locales, not MapSet.member?(roster, key), do: key

    assert unknown == [],
           "these affiliate locale keys name no node in " <>
             "priv/seed_data/destination_tree.json, so they cover no page at all and every " <>
             "page in that campaign's geography renders no unit — silently: #{inspect(unknown)}"

    empty =
      for {key, _} <- locales,
          not Enum.any?(corpus, &(&1 == key or String.starts_with?(&1, key <> "/"))),
          do: key

    assert empty == [],
           "these affiliate locale keys name a real node with no committed page anywhere " <>
             "beneath it — either dead config, or a key pointing one tier away from where " <>
             "the corpus actually hangs: #{inspect(empty)}"
  end
end
