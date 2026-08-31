defmodule Ethos.AffiliatesTest do
  use ExUnit.Case, async: true

  alias Ethos.Affiliates

  # A stand-in for a Guide or a Place. Both real schemas carry these two
  # fields, and the resolver reads nothing else, so a struct with exactly
  # these fields cannot drift from what production passes in.
  defmodule Row do
    defstruct [:state_slug, :county]
  end

  defp row(state_slug, county), do: %Row{state_slug: state_slug, county: county}

  describe "locale_for/2" do
    test "each New York borough resolves to the New York locale" do
      for county <- ~w(Manhattan Brooklyn Bronx Queens) do
        locale = Affiliates.locale_for("new-york", county)

        assert locale, "#{county} did not resolve"
        assert locale.network == :getyourguide
        assert locale.partner_id == "ZA4AIMF"
        assert locale.cmp == "new-york"
      end
    end

    # THE GUARD TEST. GetYourGuide's "new-york" campaign is New York CITY.
    # Without the counties allowlist an upstate guide inherits a campaign for
    # a city 300 miles away, and every other test in this file still passes.
    # If this test is deleted, the allowlist can be deleted with it and
    # nothing goes red. It is the only thing making that list load-bearing.
    test "an upstate New York county resolves to nil" do
      refute Affiliates.locale_for("new-york", "Albany")
      refute Affiliates.locale_for("new-york", "Dutchess")
      refute Affiliates.locale_for("new-york", "Niagara")
    end

    # The state hub /destinations/new-york has no county. It must resolve, and
    # it reads like an oversight in the implementation, so it is pinned here.
    test "a nil county resolves — this is the state-hub case" do
      assert Affiliates.locale_for("new-york", nil)
    end

    test "states with no registry entry resolve to nil" do
      refute Affiliates.locale_for("connecticut", "Litchfield County")
      refute Affiliates.locale_for("italy", nil)
      refute Affiliates.locale_for(nil, nil)
    end
  end

  describe "unanimous_locale/1" do
    test "a list of New York rows resolves to the New York locale" do
      assert Affiliates.unanimous_locale([row("new-york", "Brooklyn"), row("new-york", "Bronx")])
    end

    test "an empty list resolves to nil" do
      refute Affiliates.unanimous_locale([])
    end

    # Mixed geography is the whole reason this function exists. A rule that
    # took the first row, or a majority, would put a New York City tours
    # widget on a page that is half about somewhere else.
    test "a mixed list resolves to nil" do
      refute Affiliates.unanimous_locale([
               row("new-york", "Brooklyn"),
               row("connecticut", "New Haven County")
             ])
    end

    test "one unresolvable row makes the whole list unresolvable" do
      refute Affiliates.unanimous_locale([row("new-york", "Brooklyn"), row("new-york", "Albany")])
    end
  end
end
