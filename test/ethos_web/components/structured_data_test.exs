defmodule EthosWeb.StructuredDataTest do
  use ExUnit.Case, async: true
  alias EthosWeb.StructuredData

  test "breadcrumb/1 derives positions from list order" do
    ld =
      StructuredData.breadcrumb([
        %{name: "Ethos", url: "https://example.com/"},
        %{name: "Destinations", url: "https://example.com/destinations"}
      ])

    assert ld["@type"] == "BreadcrumbList"
    assert Enum.map(ld["itemListElement"], & &1["position"]) == [1, 2]
    assert Enum.map(ld["itemListElement"], & &1["name"]) == ["Ethos", "Destinations"]
  end

  test "breadcrumb/1 on an empty trail produces an empty list, not a crash" do
    assert StructuredData.breadcrumb([])["itemListElement"] == []
  end

  test "maybe_put/3 drops nil and keeps false" do
    assert StructuredData.maybe_put(%{}, "k", nil) == %{}
    assert StructuredData.maybe_put(%{}, "k", false) == %{"k" => false}
  end

  test "collection_page/3 omits description when absent" do
    refute Map.has_key?(StructuredData.collection_page("N", "u", []), "description")
    assert StructuredData.collection_page("N", "u", description: "d")["description"] == "d"
  end

  test "postal_address/3 returns nil for a place with no address" do
    assert StructuredData.postal_address(nil, "Waterbury", "Connecticut") == nil
  end

  describe "postal_address/3 over the whole seed corpus" do
    # The emitter's counterpart to the parser's corpus test in
    # test/ethos/places/address_test.exs. The parser guard cannot catch a
    # regression here: the bug this replaced lived in the *emitter*, which took
    # a correctly-parsed address and published the raw string anyway. Anyone
    # reintroducing a raw-string fallback in postal_address/3 leaves the parser
    # tests entirely green, so the defect signatures are asserted against the
    # real builder, over every committed seed address — Connecticut, Manhattan
    # and Brooklyn alike.

    setup do
      places =
        Ethos.SeedDataHelpers.all_seed_files()
        |> Enum.flat_map(fn f ->
          f |> File.read!() |> Jason.decode!() |> Map.get("places", [])
        end)
        |> Enum.reject(&is_nil(&1["address"]))

      emitted =
        Enum.map(places, fn p ->
          {p["address"], StructuredData.postal_address(p["address"], p["town"], p["state"])}
        end)

      %{emitted: emitted}
    end

    test "every block is a typed, countried PostalAddress", %{emitted: emitted} do
      for {raw, ld} <- emitted do
        assert ld["@type"] == "PostalAddress", "untyped address block for #{inspect(raw)}"
        assert ld["addressCountry"] == "US", "no country for #{inspect(raw)}"
      end
    end

    test "no streetAddress is the whole raw address string", %{emitted: emitted} do
      # The exact defect: the entire address, locality and region included,
      # stuffed into streetAddress beside the locality and region.
      for {raw, ld} <- emitted, street = ld["streetAddress"] do
        refute street == String.trim(raw) and String.contains?(raw, ","),
               "streetAddress is the whole raw address: #{inspect(raw)}"
      end
    end

    test "no streetAddress carries the postal code emitted beside it", %{emitted: emitted} do
      for {raw, ld} <- emitted, street = ld["streetAddress"], postal = ld["postalCode"] do
        refute String.contains?(street, postal),
               "streetAddress #{inspect(street)} still carries postalCode #{postal} " <>
                 "(from #{inspect(raw)})"
      end
    end

    test "no streetAddress keeps a trailing region or region-and-zip tail", %{emitted: emitted} do
      tail = ~r/,\s*[A-Z]{2}(\s+\d{5}(-\d{4})?)?\s*$/

      for {raw, ld} <- emitted, street = ld["streetAddress"] do
        refute Regex.match?(tail, street),
               "streetAddress keeps an address tail: #{inspect(street)} (from #{inspect(raw)})"
      end
    end

    test "no streetAddress is published without a leading house number", %{emitted: emitted} do
      for {raw, ld} <- emitted, street = ld["streetAddress"] do
        assert Regex.match?(~r/^\d/, street),
               "streetAddress without a house number: #{inspect(street)} (from #{inspect(raw)})"

        refute Regex.match?(~r/^\d+(?:st|nd|rd|th)\b/i, street),
               "ordinal street name mistaken for a house number: #{inspect(street)} " <>
                 "(from #{inspect(raw)})"
      end
    end

    test "the emitted split matches the corpus it was measured against", %{emitted: emitted} do
      # Recorded so a regression shows up as a number rather than a vibe, and so
      # the release-note figures below stay honest. Measured 2026-08-29 across
      # priv/seed_data/{connecticut,manhattan,brooklyn}. Update deliberately
      # when the corpus grows; never to make a failing test pass.
      #
      # Re-measured 2026-08-30 after priv/seed_data/bronx/belmont.json landed
      # forty places, every one with an address. The whole delta is those forty
      # and each digit of it is accounted for: +40 total, +40 postal (all carry
      # a ZIP), +39 with a street address, and +1 without — ciccarone-park,
      # whose sourced address is a pair of cross streets ("East 188th Street
      # between Arthur Avenue and Hughes Avenue") and so correctly emits
      # locality and postal code with no streetAddress. The locality-only count
      # is unmoved at 245, which is the check that the +1 went where it should:
      # a place with a ZIP but no house number is a different shape from a
      # place with neither.
      #
      # Re-measured 2026-08-31 after priv/seed_data/bronx/mott-haven.json landed
      # nine places, eight of them with an address (St. Mary's Park ships with
      # `"address": null` — the research established no street address for it,
      # and guessing one is not an option). The whole delta is those eight and
      # each digit is accounted for: +8 total, +5 with a street address
      # (St. Ann's Church and Graveyard, Mott Haven Library, the Bronx General
      # Post Office, La Morada and the Bronx Brewery tap room) and +3 without —
      # the three historic districts, whose sourced addresses are street ranges
      # ("Alexander Avenue between East 138th and East 141st Streets"), the same
      # shape as ciccarone-park above. Postal is +4, not +5: the districts carry
      # no ZIP and neither does St. Ann's, whose address was resolved from the
      # church's own Wikipedia article without one. Locality-only is +3, the
      # three districts, which is again the check that the street-less rows went
      # where they should.
      count = fn f -> Enum.count(emitted, fn {_, ld} -> f.(ld) end) end

      assert length(emitted) == 2114
      assert count.(& &1["streetAddress"]) == 1576
      assert count.(&is_nil(&1["streetAddress"])) == 538
      assert count.(& &1["postalCode"]) == 1713

      # The largest behavioural delta this change ships: 245 places emit a
      # PostalAddress carrying only locality, region and country. Their full
      # address is still rendered on the page.
      assert count.(fn ld -> is_nil(ld["streetAddress"]) and is_nil(ld["postalCode"]) end) == 248
    end
  end
end
