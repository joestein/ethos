defmodule Ethos.AffiliatesTest do
  use ExUnit.Case, async: true

  alias Ethos.Affiliates

  # The borough paths are READ FROM THE ROSTER, not written out here.
  #
  # A page resolves through the path of the destination node it is filed on, so
  # the only New York City paths production ever presents are these four
  # subtrees. Hardcoding them is what let this file assert that "Bronx"
  # resolved for a year after the tree started deriving "The Bronx" — a green
  # test over a config entry that matched no page.
  @nyc_boroughs for node <- Ethos.Seeds.DestinationTree.load!(),
                    String.starts_with?(
                      node["path"],
                      "united-states/new-york/new-york-city/"
                    ),
                    node["kind"] == "borough",
                    do: node["path"]

  describe "locale_for/1" do
    test "each New York borough resolves to the New York locale" do
      # Non-vacuous: an empty list passes the loop below without checking a
      # thing, which is exactly what a moved or renamed borough subtree would
      # produce.
      assert length(@nyc_boroughs) == 4,
             "expected four boroughs in the roster, got #{inspect(@nyc_boroughs)}"

      for path <- @nyc_boroughs do
        locale = Affiliates.locale_for(path)

        assert locale,
               "#{path} did not resolve — the roster files New York City pages under this " <>
                 "path, so :affiliate_locales must be keyed on it or an ancestor of it"

        assert locale.network == :getyourguide
        assert locale.partner_id == "ZA4AIMF"
        assert locale.cmp == "new-york"
      end
    end

    # A borough's neighbourhoods are where the corpus actually lives, and they
    # sit a level below the paths above. Prefix matching is the whole mechanism
    # and this is the only test that exercises it at real corpus depth.
    test "a neighbourhood inside a borough resolves through its ancestor" do
      assert Affiliates.locale_for("united-states/new-york/new-york-city/bronx/belmont")
      assert Affiliates.locale_for("italy/lazio/rome/monti").cmp == "rome"
    end

    # THE GUARD TEST, and what replaced the `:counties` allowlist.
    #
    # GetYourGuide's "new-york" campaign is New York CITY. The registry used to
    # be keyed on the state and guarded by a list of borough NAMES, so an
    # upstate guide would otherwise inherit a campaign for a city 300 miles
    # away. Keyed on the city's node path there is no list to keep in step —
    # an upstate node simply is not under the key. If this test is deleted the
    # key can be widened back to the state and nothing else goes red.
    test "an upstate New York node resolves to nil" do
      refute Affiliates.locale_for("united-states/new-york/albany")
      refute Affiliates.locale_for("united-states/new-york/dutchess-county/rhinebeck")
      refute Affiliates.locale_for("united-states/new-york/niagara-county/niagara-falls")
    end

    # The state hub above the city, and the country hub above that, are real
    # pages with real URLs. Neither is the campaign's geography.
    test "an ancestor of the campaign's node does not inherit it" do
      refute Affiliates.locale_for("united-states/new-york")
      refute Affiliates.locale_for("united-states")
      refute Affiliates.locale_for("italy")
    end

    # The other half of the pair the region key protects: a Tuscan city hangs
    # from `italy/tuscany`, so it cannot pick up cmp=rome.
    test "a second Italian region resolves to nil" do
      refute Affiliates.locale_for("italy/tuscany/florence")
    end

    test "nodes with no registry entry resolve to nil" do
      refute Affiliates.locale_for("united-states/connecticut/litchfield-county/woodbury")
      refute Affiliates.locale_for("atlantis")
      refute Affiliates.locale_for(nil)
    end
  end

  describe "unanimous_locale/1" do
    test "a list of New York paths resolves to the New York locale" do
      assert Affiliates.unanimous_locale([
               "united-states/new-york/new-york-city/brooklyn",
               "united-states/new-york/new-york-city/bronx/belmont"
             ])
    end

    test "an empty list resolves to nil" do
      refute Affiliates.unanimous_locale([])
    end

    # Mixed geography is the whole reason this function exists. A rule that
    # took the first row, or a majority, would put a New York City tours
    # widget on a page that is half about somewhere else.
    test "a mixed list resolves to nil" do
      refute Affiliates.unanimous_locale([
               "united-states/new-york/new-york-city/brooklyn",
               "united-states/connecticut/new-haven-county"
             ])
    end

    test "one unresolvable row makes the whole list unresolvable" do
      refute Affiliates.unanimous_locale([
               "united-states/new-york/new-york-city/brooklyn",
               "united-states/new-york/albany"
             ])
    end

    # A row with no destination node at all — a guide authored through the web
    # UI — is one of the unresolvable rows, not a row that abstains.
    test "a nil path makes the whole list unresolvable" do
      refute Affiliates.unanimous_locale(["united-states/new-york/new-york-city/queens", nil])
    end
  end
end
