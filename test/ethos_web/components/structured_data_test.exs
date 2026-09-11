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

  test "postal_address/2 returns nil for a place with no address" do
    trail = [%{path: "italy", kind: "country", name: "Italy"}]
    assert StructuredData.postal_address(nil, trail) == nil
  end

  describe "country_code/1" do
    # The whole point of the lookup: it has no default. A default's value would
    # be "US", and a silent "US" for a foreign place is the defect the tree
    # derivation exists to close — the shim set a Roman place's state to
    # "Lazio", the old region-keyed lookup missed, and the Pantheon published as
    # American. A sixth country must fail on its first request instead.
    test "raises rather than defaulting on a country it does not know" do
      trail = [%{path: "portugal", kind: "country", name: "Portugal"}]

      assert_raise ArgumentError, ~r/no ISO 3166-1 alpha-2 code for country "Portugal"/, fn ->
        StructuredData.country_code(trail)
      end
    end

    test "raises on a trail with no country node at all" do
      trail = [%{path: "lazio", kind: "region", name: "Lazio"}]

      assert_raise ArgumentError, ~r/no country node in destination trail/, fn ->
        StructuredData.country_code(trail)
      end
    end

    test "reads the country from the trail's root, not its leaf" do
      trail = [
        %{path: "italy", kind: "country", name: "Italy"},
        %{path: "italy/lazio", kind: "region", name: "Lazio"},
        %{path: "italy/lazio/rome", kind: "city", name: "Rome"}
      ]

      assert StructuredData.country_code(trail) == "IT"
    end

    # Vatican City is a root country with nothing below it, so its places have
    # no country *ancestor* — the node itself is the country. Searching the
    # whole trail rather than the ancestors is what makes St Peter's emit VA
    # instead of raising.
    test "a root country node is its own country" do
      trail = [%{path: "vatican-city", kind: "country", name: "Vatican City"}]
      assert StructuredData.country_code(trail) == "VA"
    end
  end

  # The expected ISO code for each root country, keyed on the node's PATH.
  #
  # Production keys on the node's NAME (see @iso_alpha2 in StructuredData), so
  # this is a second, independent statement of the same fact rather than the
  # emitter's own table read back at it — a renamed country node fails here
  # instead of quietly agreeing with itself.
  #
  # This replaced a `region_for/1` helper that handed a pair-based emitter the
  # literal "Italy" for Roman places while production handed it `place.state`,
  # which the tree derived as "Lazio". The suite was green on a value production
  # never produced, and the "Lazio" one fell through to that emitter's "US"
  # default. The emitter is driven by the same trail production drives it with
  # now, and the pair-based one is gone, so there is no seam left to be wrong
  # in.
  @country_by_root_path %{
    "united-states" => "US",
    "italy" => "IT",
    "vatican-city" => "VA",
    "united-kingdom" => "GB",
    "canada" => "CA"
  }

  # The gate Task 10's review asked for, and the reason it is here rather than
  # in a roster test: `country_code/1` has no default and raises on a country it
  # does not know, so a sixth `kind: "country"` node in the roster is a 500 on
  # the first request for any place beneath it — a live page, in production,
  # with a green suite behind it. Nothing else compares the two sets.
  #
  # Asserted in both directions. A missing entry is the 500 above; a stale
  # entry, for a country the roster has dropped or renamed, is a lookup keyed on
  # a name no node carries any more, which is how the old region-keyed lookup
  # came to publish Roman places as American.
  test "every country node in the roster has an ISO code, and the table names no other" do
    roster =
      for n <- Ethos.Seeds.DestinationTree.load!(),
          n["kind"] == "country",
          into: MapSet.new(),
          do: n["name"]

    known = MapSet.new(StructuredData.known_countries())

    assert MapSet.equal?(roster, known),
           "country nodes with no @iso_alpha2 entry (each a 500 at request time): " <>
             inspect(MapSet.difference(roster, known) |> Enum.sort()) <>
             "; @iso_alpha2 entries with no country node: " <>
             inspect(MapSet.difference(known, roster) |> Enum.sort())

    # This test file's own table is the independent, path-keyed statement of
    # the same fact (see @country_by_root_path). It has to track the roster too,
    # or the per-place assertions below start skipping a country silently.
    roster_paths =
      for n <- Ethos.Seeds.DestinationTree.load!(),
          n["kind"] == "country",
          into: MapSet.new(),
          do: n["path"]

    assert MapSet.equal?(roster_paths, MapSet.new(Map.keys(@country_by_root_path))),
           "@country_by_root_path disagrees with the roster's country nodes: " <>
             inspect(
               MapSet.difference(roster_paths, MapSet.new(Map.keys(@country_by_root_path)))
               |> Enum.sort()
             )
  end

  defp expected_country(trail) do
    %{path: path} = Enum.find(trail, &(&1.kind == "country"))
    Map.fetch!(@country_by_root_path, path)
  end

  defp expected_region(trail) do
    trail |> Enum.reverse() |> Enum.find_value(fn d -> if d.kind == "region", do: d.name end)
  end

  describe "postal_address/2 over the whole seed corpus" do
    # The emitter's counterpart to the parser's corpus test in
    # test/ethos/places/address_test.exs. The parser guard cannot catch a
    # regression here: the bug this replaced lived in the *emitter*, which took
    # a correctly-parsed address and published the raw string anyway. Anyone
    # reintroducing a raw-string fallback in postal_address/2 leaves the parser
    # tests entirely green, so the defect signatures are asserted against the
    # real builder, over every committed seed address — Connecticut, Manhattan,
    # Brooklyn, Rome and London alike.

    setup do
      trails = Ethos.SeedDataHelpers.destination_trails()

      places =
        Ethos.SeedDataHelpers.all_seed_files()
        |> Enum.flat_map(fn f ->
          f |> File.read!() |> Jason.decode!() |> Map.get("places", [])
        end)
        |> Enum.reject(&is_nil(&1["address"]))

      # Carried with its trail rather than without it: every other test in this
      # block patterns on `{raw, ld}`, and the trail is only needed by the
      # country, region and per-country street assertions.
      with_trail =
        Enum.map(places, fn p ->
          trail = Map.fetch!(trails, p["destination_path"])
          {p["address"], trail, StructuredData.postal_address(p["address"], trail)}
        end)

      emitted = Enum.map(with_trail, fn {raw, _trail, ld} -> {raw, ld} end)

      %{emitted: emitted, with_trail: with_trail}
    end

    test "every block is a typed PostalAddress in the right country", %{with_trail: with_trail} do
      # This assertion read `== "US"` until Rome landed, and passed, because
      # postal_address/3 hardcoded the country. The corpus was American for its
      # whole life, so nothing distinguished "every place is in the US" from
      # "the emitter says US regardless" — and the first 122 addressed Roman
      # places inherited the wrong one, publishing the Pantheon as American.
      #
      # Asserted per place against the country its own ancestry names, so a
      # future destination under a sixth country fails here rather than being
      # quietly labelled US. (It would in fact raise: country_code/1 has no
      # default. This is the assertion that says which code is right, not
      # merely that some code was produced.)
      for {raw, trail, ld} <- with_trail do
        assert ld["@type"] == "PostalAddress", "untyped address block for #{inspect(raw)}"

        expected = expected_country(trail)

        assert ld["addressCountry"] == expected,
               "#{inspect(raw)} under #{inspect(List.first(trail).path)} emitted country " <>
                 "#{inspect(ld["addressCountry"])}, expected #{inspect(expected)}"
      end
    end

    test "addressRegion is the place's region node, and nothing else", %{with_trail: with_trail} do
      # The successor to "a country name is not emitted as a region", and
      # stronger than it: that rule checked only that two known country names
      # were suppressed, and could not have caught a region invented from
      # nowhere. A region can now only be a `region` node's name, so a country
      # name is structurally unable to appear in the field — Italy and Vatican
      # City are `country` nodes, and Lazio is what an Italian place's region
      # actually is.
      #
      # Vatican City has no region node at all, so its places emit no
      # addressRegion, which is the nil half of this assertion.
      for {raw, trail, ld} <- with_trail do
        expected = expected_region(trail)

        assert ld["addressRegion"] == expected,
               "#{inspect(raw)} emitted addressRegion #{inspect(ld["addressRegion"])}, " <>
                 "expected #{inspect(expected)}"
      end

      regions = with_trail |> Enum.map(fn {_, _, ld} -> ld["addressRegion"] end) |> Enum.uniq()

      assert "Lazio" in regions and "England" in regions and nil in regions,
             "the corpus no longer covers a foreign region, a British one and a region-less " <>
               "country at once, so this assertion has stopped proving anything: " <>
               inspect(regions)
    end

    test "addressLocality is the node the place is filed under", %{with_trail: with_trail} do
      # Locality is the node's own name, never the parse's: 840 of the corpus's
      # addressed places parse a locality that differs from the node they hang
      # from — a Bushwick place whose address says "Brooklyn".
      for {raw, trail, ld} <- with_trail do
        assert ld["addressLocality"] == List.last(trail).name,
               "#{inspect(raw)} emitted addressLocality #{inspect(ld["addressLocality"])}, " <>
                 "expected #{inspect(List.last(trail).name)}"
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

    test "no American streetAddress is published without a leading house number",
         %{with_trail: with_trail} do
      # Scoped to American addresses rather than relaxed. The leading house
      # number is what separates "126 Brightwater Court" from a descriptive
      # location, and it held for the corpus's whole American life.
      #
      # Italian addresses put the number last and often carry none at all:
      # "Lungotevere Castello 50" ends with its number, and the Pantheon's
      # postal address is "Piazza della Rotonda, 00186 Roma RM" with no number
      # anywhere. The parser holds those to a thoroughfare-type test instead,
      # which is asserted in test/ethos/places/address_test.exs; what matters
      # here is that the American rule did not quietly loosen when Rome landed.
      # Vatican City joins Italy here rather than defaulting into the American
      # rule: "Piazza San Pietro" carries no house number and never will.
      #
      # England is excluded for the same reason and a stronger one. 62% of real
      # London addresses carry no house number at all — "Bankside, London SE1
      # 9DT" and "Great Russell Street, London WC1B 3DG" are both complete
      # postal addresses — so this rule would suppress the street line on
      # nearly two in three British places if it were not scoped. It is checked
      # by its own discipline below rather than relaxed.
      for {raw, trail, ld} <- with_trail,
          expected_country(trail) not in ["IT", "VA", "GB"],
          street = ld["streetAddress"] do
        assert Regex.match?(~r/^\d/, street),
               "streetAddress without a house number: #{inspect(street)} (from #{inspect(raw)})"

        refute Regex.match?(~r/^\d+(?:st|nd|rd|th)\b/i, street),
               "ordinal street name mistaken for a house number: #{inspect(street)} " <>
                 "(from #{inspect(raw)})"
      end
    end

    test "an Italian streetAddress names a thoroughfare type", %{with_trail: with_trail} do
      # The Italian counterpart, so scoping the rule above does not leave Rome
      # unguarded. Without this, a descriptive location would publish as a
      # street the moment the house-number rule stopped applying to it.
      thoroughfare =
        ~r/^(?:via|viale|vicolo|vico|piazza|piazzale|piazzetta|largo|corso|borgo|lungotevere|salita|clivo|circonvallazione|ponte|passeggiata|galleria|portico|strada|foro|campo|arco|scalinata|molo|monte|lungomare|quadrato|parco)\b/i

      italian =
        Enum.filter(with_trail, fn {_, trail, _} ->
          expected_country(trail) in ["IT", "VA"]
        end)

      assert italian != [], "no Italian address reached the emitter — the scope guard is vacuous"

      for {raw, _trail, ld} <- italian, street = ld["streetAddress"] do
        assert Regex.match?(thoroughfare, street),
               "Italian streetAddress naming no thoroughfare type: #{inspect(street)} " <>
                 "(from #{inspect(raw)})"
      end
    end

    test "a British streetAddress is never a descriptive location", %{with_trail: with_trail} do
      # The third discipline, so scoping the house-number rule does not leave
      # London unguarded. It can be neither of the other two: 62% of real London
      # addresses carry no house number, and Bankside, Smithfield, The Cut and
      # Upper Ground are real street names carrying no thoroughfare word either,
      # so an Italian-style positive test would reject them.
      #
      # What survives is the judgement all three corpora share — the one the
      # American house-number rule makes about "Bounded by Lafayette Avenue and
      # Greene Avenue". "Bounded by Park Lane and Oxford Street, London W1K 7TN"
      # is a true statement of where Speakers' Corner is and a false street
      # address, and the parser returns nil for it.
      descriptive = ~r/\b(?:bounded by|between|corner of|junction of|opposite)\b/i

      british = Enum.filter(with_trail, fn {_, trail, _} -> expected_country(trail) == "GB" end)

      assert british != [], "no British address reached the emitter — the scope guard is vacuous"

      for {raw, _trail, ld} <- british, street = ld["streetAddress"] do
        refute Regex.match?(descriptive, street),
               "British streetAddress publishing a descriptive location: #{inspect(street)} " <>
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
      #
      # Corrected in the same wave, before mott-haven.json was reviewed: the
      # La Morada Restaurant place was withdrawn. Every publishable fact about
      # it — name, address, cuisine — came from the DOHMH inspection dataset,
      # which this corpus admits as identity evidence and never as prose, so
      # once its summary was stripped there was no sentence left to write and
      # the place was a stub. That is -1 from each of the counts its address
      # contributed to: total 2114 -> 2113 and streetAddress 1576 -> 1575 (it
      # carried "308 Willis Avenue"), postalCode 1713 -> 1712 (it carried
      # 10454).
      #
      # WHICH ASSERTION PROVES WHICH HALF, corrected 2026-08-31 because the
      # first version of this paragraph got it wrong and the error was the kind
      # that invites a later maintainer to delete a live assertion as
      # redundant. The claim is that the row removed carried BOTH a house
      # number and a ZIP.
      #
      #   * The house number is proven by the pair `streetAddress` 1576 -> 1575
      #     together with `is_nil(streetAddress)` unmoved at 538: the row left
      #     the street-bearing bucket and did not appear in the street-less one.
      #   * The ZIP is proven by `postalCode` 1713 -> 1712, and by nothing else
      #     here.
      #
      # The locality-only count holding at 248 proves NOTHING additional about
      # the ZIP. A row carrying a non-nil streetAddress is definitionally
      # outside that bucket, so 248 could not have moved whatever its postal
      # code was. It is a real assertion about a real property of the corpus —
      # see the note below it — but it is not evidence for this delta, and the
      # `postalCode` assertion above is not redundant with it.
      # Re-measured 2026-08-31 after priv/seed_data/bronx/bronx-park.json landed
      # five places, four of them with an address. Bronx River Forest ships with
      # `"address": null` — the Bronx River Alliance's page gives no acreage,
      # boundary or street, and guessing one is not an option — so it never
      # reaches this setup, which rejects nil addresses. The whole delta is the
      # other four and each digit is accounted for:
      #
      #   * total 2113 -> 2117, the four addressed places.
      #   * `streetAddress` 1575 -> 1576 together with `is_nil(streetAddress)`
      #     538 -> 541 proves which of the four carry a house number: exactly
      #     one, the Bronx Zoo at "2300 Southern Boulevard". The other three
      #     went to the street-less bucket — Bronx Park, whose sourced address
      #     is a boundary list ("Bounded by Southern Boulevard, Webster
      #     Avenue..."); the New York Botanical Garden, whose NRHP-sourced
      #     address is a street intersection ("Southern Boulevard and Bedford
      #     Park Boulevard"); and the Lorillard Snuff Mill, sourced to a road
      #     within the Garden's grounds ("Snuff Mill Road"). +1 and +3 sum to
      #     the +4 above, so no row is unaccounted for and none is double
      #     counted.
      #   * `postalCode` 1712 -> 1713 proves the ZIP, and nothing else here
      #     does: the zoo's address carries 10460 and the other three carry no
      #     five-digit code at all.
      #   * locality-only 248 -> 251, the same three street-less rows. As the
      #     note above says, this proves neither half of the zoo's delta — a
      #     row with a non-nil streetAddress is definitionally outside that
      #     bucket. It is the check that the street-less rows went where they
      #     should, and it moves by exactly the same 3.
      # Re-measured 2026-09-01 after priv/seed_data/bronx/city-island.json landed
      # twelve places, every one of them addressed, so the whole delta is +12
      # and no row is filtered out of this setup by a nil address. Each digit is
      # accounted for:
      #
      #   * total 2117 -> 2129, the twelve addressed places.
      #   * `streetAddress` 1576 -> 1588 together with `is_nil(streetAddress)`
      #     UNMOVED at 541 proves all twelve carry a leading house number:
      #     190 Fordham Street, 116 City Island Avenue, 175 Belden Street,
      #     41 City Island Avenue, 2 City Island Avenue, 361 City Island Avenue,
      #     586 City Island Avenue, 65 Schofield Street, 95 Pell Place,
      #     30 Centre Street, 21 Tier Street and 63 Pilot Street. +12 and +0 sum
      #     to the +12 above. "21 Tier Street" is the one worth naming twice: it
      #     is a house number on a non-ordinal street, so the @ordinal_street
      #     guard in Ethos.Places.Address correctly leaves it in the
      #     street-bearing bucket.
      #   * `postalCode` 1713 -> 1718 proves the ZIPs, and nothing else here
      #     does: five of the twelve carry 10464 — the Nautical Museum (from the
      #     museum's own site), Sammy's Fish Box, Johnny's Reef and the Original
      #     Crab Shanty (each from its own site) and the City Island Yacht Club
      #     (from the DOHMH row that supplies its address). The other seven are
      #     sourced to Wikipedia's landmark and NRHP lists, which give a street
      #     address and no five-digit code, so none was invented for them.
      #   * locality-only UNMOVED at 251. As the note above says, a row with a
      #     non-nil streetAddress is definitionally outside that bucket, so all
      #     twelve are, and this bucket could not have moved. It holding still
      #     is the check that no City Island row went to the street-less side.
      # Re-measured 2026-09-01 after priv/seed_data/bronx/pelham-bay-park.json
      # landed four places, two of them addressed. Pelham Bay Park itself and
      # Orchard Beach both ship with `"address": null` — the research
      # established no street address or boundary list for either, and guessing
      # one is not an option — so neither reaches this setup, which rejects nil
      # addresses. The whole delta is the other two and each digit is accounted
      # for:
      #
      #   * total 2129 -> 2131, the two addressed places.
      #   * `streetAddress` 1588 -> 1590 together with `is_nil(streetAddress)`
      #     UNMOVED at 541 proves both carry a leading house number: the
      #     Bartow-Pell Mansion Museum at "895 Shore Road, Bronx, NY 10464" and
      #     the Pelham Bay & Split Rock Golf Courses at "870 Shore Road, Bronx,
      #     NY 10464". +2 and +0 sum to the +2 above. The mansion's row is worth
      #     naming twice: the research gives its address with a park line,
      #     "895 Shore Road, Pelham Bay Park, Bronx, NY 10464", which the
      #     greedy street capture in Ethos.Places.Address emits as the comma-
      #     qualified street line "895 Shore Road, Pelham Bay Park" — the shape
      #     `comma_streets <= 48` in test/ethos/places/address_test.exs pins so
      #     it cannot grow silently. The park line carries no information the
      #     page does not state in prose, so it was dropped from the seed rather
      #     than the pin raised.
      #   * `postalCode` 1718 -> 1720 proves the ZIPs, and nothing else here
      #     does: both addresses carry 10464, the same ZIP City Island's five
      #     addressed rows carry.
      #   * locality-only UNMOVED at 251. As the note above says, a row with a
      #     non-nil streetAddress is definitionally outside that bucket, so both
      #     are, and this bucket could not have moved. It holding still is the
      #     check that neither Pelham Bay Park row went to the street-less side.
      #
      # Re-measured 2026-09-01 after six files landed in one wave —
      # priv/seed_data/bronx/{van-cortlandt-park,morris-park,riverdale,
      # kingsbridge,throgs-neck,woodlawn}.json — carrying fifty-one places
      # between them, of which eighteen ship with `"address": null` and so
      # never reach this setup. Fifteen of those eighteen are the whole of
      # van-cortlandt-park.json, whose subjects are trails, a lake, a hill, a
      # parade ground, a stadium and a filtration plant; the research gave a
      # street line for none of them and guessing one is not an option. That
      # file therefore contributes nothing to any count below. The other three
      # nil addresses are Loreto Park, the Riverdale Historic District and the
      # King's Bridge itself. 51 - 18 = 33 rows reach this setup, and each
      # digit is accounted for:
      #
      #   * total 2131 -> 2164, the thirty-three addressed places.
      #   * `streetAddress` 1590 -> 1616 together with `is_nil(streetAddress)`
      #     541 -> 548 splits those thirty-three 26 / 7. +26 and +7 sum to the
      #     +33 above, so no row is unaccounted for and none is double counted.
      #     The seven street-less rows are four in Riverdale — Wave Hill and
      #     the University of Mount Saint Vincent at intersections, Riverdale
      #     Park at a street range, the Riverdale Monument at a three-way
      #     junction — and three in Kingsbridge: Fort Independence Park at an
      #     intersection, and the Church of the Visitation and the Broadway
      #     corridor on bare streets. Riverdale Presbyterian Church is worth
      #     naming on the other side of the split: its "4761-4765 Henry Hudson
      #     Parkway" is a hyphenated house-number range, which the parser
      #     correctly keeps in the street-bearing bucket.
      #   * `postalCode` 1720 -> 1737 proves the ZIPs, and nothing else here
      #     does: seventeen of the thirty-three carry a five-digit code — six
      #     in Morris Park, six in Throgs Neck, four in Woodlawn and one in
      #     Kingsbridge, the library at 10463. Riverdale contributes none: its
      #     addresses are sourced to Wikipedia's NRHP and landmark lists, which
      #     give a street line and no code, so none was invented for them. The
      #     Jack D. Weiler Hospital's "NY 10461-2301" is a ZIP+4 and still
      #     counts once.
      #   * locality-only 251 -> 258, moving by exactly the same seven as the
      #     street-less bucket. The two moving together is the check that none
      #     of those seven carries a ZIP — a street-less row that did would sit
      #     outside this bucket and break the equality.
      #
      # Re-measured 2026-09-01 again, after hunts-point.json and concourse.json
      # completed the in-scope Bronx roster at thirteen of fourteen. They carry
      # sixteen places, of which one — Boogie Down Grind Cafe — ships with
      # `"address": null`, because its own site gives 868 Hunts Point Avenue
      # while the DOHMH row gives 1200 Seneca Avenue and nothing resolves the
      # conflict, so no address could be published for it. The remaining
      # fifteen reach this setup:
      #
      #   * total 2164 -> 2179, the fifteen addressed places.
      #   * `streetAddress` 1616 -> 1622 together with `is_nil(streetAddress)`
      #     548 -> 557 splits them 6 / 9, and +6 and +9 sum to the +15 above.
      #     The nine street-less rows are almost all NYC Parks properties,
      #     whose official addresses are cross-street ranges in the Parks
      #     department's own house style — "Oak Pt. Ave. bet. Hunts Pt. Ave.
      #     and Longfellow Ave." — the same shape as ciccarone-park and
      #     Riverdale Park before them. The other two are the Hunts Point
      #     Avenue station and the Concourse Plaza Hotel, both sited at
      #     intersections.
      #   * `postalCode` 1737 -> 1741 proves the ZIPs, and nothing else here
      #     does: four of the fifteen carry a five-digit code, all 10474 and
      #     all in Hunts Point — Corpus Christi Monastery, THE POINT CDC, THE
      #     POINT Riverside Campus and Bronxlandia. Concourse contributes none.
      #     Note the American Bank Note plant at "1201 Lafayette Avenue" is
      #     street-bearing but ZIP-less, which is why streetAddress moves by
      #     six while postalCode moves by four.
      #   * locality-only 258 -> 267, moving by exactly the same nine as the
      #     street-less bucket — the check that none of those nine carries a
      #     ZIP, since a street-less row that did would fall outside it.
      #
      # The `comma_streets <= 48` pin in test/ethos/places/address_test.exs is
      # unmoved by this wave: none of the six street-bearing rows carries a
      # comma qualifier. It was checked rather than assumed, because the
      # previous wave tripped that pin.
      #
      # Re-measured 2026-09-01 after Queens wave 1 — astoria.json,
      # ditmars-steinway.json and long-island-city.json — opened a fourth
      # borough. Thirty-nine places, of which four ship with `"address": null`
      # (Queensbridge Park, Rainey Park, Ravenswood Playground and Dutch Kills
      # Playground: NYC Parks records them by park ID, ZIP and acreage and gives
      # no street line, and inventing one was the Critical this wave's review
      # caught). The remaining thirty-five reach this setup:
      #
      #   * total 2179 -> 2214, the thirty-five addressed places.
      #   * `streetAddress` 1622 -> 1646 with `is_nil(streetAddress)` 557 -> 568
      #     splits them 24 / 11, and +24 and +11 sum to the +35 above.
      #   * `postalCode` 1741 -> 1759: eighteen of the thirty-five carry a code.
      #   * locality-only 267 -> 275, +8 — and note this does NOT equal the +11
      #     street-less rows, which is the first wave in this corpus where the
      #     two diverge. Three street-less Astoria rows carry a ZIP and so sit
      #     outside the locality-only bucket: Astoria Park, Athens Square and
      #     Hallets Cove Playground, all addressed by NYC Parks as
      #     "Astoria, Queens, NY 11102" with no street at all. 11 - 3 = 8.
      #
      # Four addresses were normalized before this measurement, and the reason
      # is worth recording because it will recur in every Queens wave.
      # Ethos.Places.Address.parse/1 requires the two-letter region: given
      # "…, Astoria, New York 11102" it returns nil for street, locality AND
      # region and keeps only the ZIP, so a perfectly good house number emits no
      # streetAddress at all. Three Queens sources spell the state out, and
      # Steinway Mansion's arbitrated string carried no city or state whatever.
      # Those four were rewritten to the "NY" form the rest of the corpus uses —
      # a formatting change, not a fact change — which is the whole of the
      # streetAddress move from 20 to 24 in this wave. The parser's narrowness
      # is a real limitation and is left alone here deliberately: widening it
      # would shift every borough's counts at once.
      #
      # The `comma_streets <= 48` pin in test/ethos/places/address_test.exs is
      # unmoved. It nearly was: the Bank of the Manhattan Company Building
      # shipped as "29-27 Queens Plaza North (aka 29-27 41st Avenue, 29-39
      # Northern Blvd)", whose parenthetical the greedy street capture keeps,
      # taking the count to 49. The parenthetical was dropped from the seed
      # rather than the pin raised — the same call made for Bartow-Pell's park
      # line and Calvary Hospital's neighborhood line before it.
      #
      # Re-measured 2026-09-01, and this is the first entry here caused by a
      # CODE change rather than by new content. The corpus did not grow: total
      # stays at 2214 and no seed file gained or lost a place.
      #
      # Ethos.Places.Address.parse/1 anchored its match at the end of the
      # string, so an otherwise perfect address followed by any trailing remark
      # failed outright — street, locality and region all nil. An audit found
      # 133 rows in that state, 38 of which began with a real house number and
      # so were publishing no streetAddress at all despite plainly having one:
      # "126 Brightwater Court, Brooklyn, NY 11235 (Brighton 2nd Street …)",
      # "2 Wyckoff Avenue, Brooklyn, NY 11237, entrance at 408 Jefferson Street",
      # "899-925 Flatbush Avenue, Brooklyn, NY (between Church and Snyder
      # Avenues)". The parser now retries once against the address head when the
      # anchored match fails, discarding the trailing remark.
      #
      #   * total 2214 -> 2214. No content moved; this is the control.
      #   * `streetAddress` 1646 -> 1684 and `is_nil(streetAddress)` 568 -> 530,
      #     +38 and -38 exactly. They must move as an equal and opposite pair
      #     here — unlike a content wave, where they sum to the new rows — and
      #     that they do is the check that the change only reclassified rows
      #     rather than inventing or dropping any.
      #   * `postalCode` 1759 -> 1759, UNMOVED, and that is the second real
      #     check. `scan_postal/1` already recovered a five-digit code from the
      #     raw text even when the structured parse failed, so if this number
      #     had moved, the retry would be finding codes the old path already
      #     had — meaning it had changed how an address parses, not merely
      #     whether it parses. It is unmoved, so it has not.
      #   * locality-only 275 -> 266, -9. Nine of the 38 recovered rows carried
      #     no ZIP and so were sitting in this bucket; the other 29 had one and
      #     were already outside it. 9 + 29 = 38, so every recovered row is
      #     accounted for on this axis too.
      #
      # Three addresses were corrected in the same pass, being the only ones the
      # retry could not reach: two spelled the state out ("…, Harlem, New York
      # 10026"), which the region pattern requires as two letters, and one named
      # no region at all. Those are data defects, not parser ones.
      #
      # The `comma_streets <= 48` pin in test/ethos/places/address_test.exs sits
      # exactly at 48 after this change and was checked, not assumed: 38 newly
      # parsing street lines is precisely the shape of change that could push it
      # over, and none of them carries a comma.
      #
      # Re-measured 2026-09-01 after Queens wave 2 — jackson-heights.json,
      # sunnyside.json and woodside.json. Sixty-three places, eight of them
      # shipping with `"address": null`, so fifty-five reach this setup:
      #
      #   jackson-heights  16 places,  2 null, 14 addressed,  9 street,  5 not, 10 zip, 4 loc-only
      #   sunnyside        16 places,  5 null, 11 addressed, 11 street,  0 not,  7 zip, 0 loc-only
      #   woodside         31 places,  1 null, 30 addressed, 19 street, 11 not, 24 zip, 3 loc-only
      #
      #   * total 2214 -> 2269, the fifty-five addressed places.
      #   * `streetAddress` 1684 -> 1723 and `is_nil(streetAddress)` 530 -> 546,
      #     splitting them 39 / 16, which sums to the +55 above.
      #   * `postalCode` 1759 -> 1800, +41.
      #   * locality-only 266 -> 273, +7 — four in Jackson Heights and three in
      #     Woodside. Sunnyside contributes none, because every one of its
      #     eleven addressed places carries a house number.
      #
      # Sunnyside's five nulls are worth naming, because four of them were
      # CREATED by this wave's review rather than by the research. The author
      # had written cross-street strings into `address` for Phipps Garden
      # Apartments, Celtic Park Apartments and the Sunnyside Arch — "39th
      # Avenue at 50th Street, Sunnyside, NY" and the like — where the verdicts
      # state plainly that no single street address is confirmed for any of
      # them. Sabba Park had already been nulled on identical grounds, which is
      # what made the other three visible as the exception. A constructed
      # cross-street in an address field is a false `streetAddress` waiting to
      # be emitted; the detail belongs in prose, and that is where it now is.
      #
      # The `comma_streets <= 48` pin holds at 48, checked rather than assumed.
      #
      # Re-measured 2026-09-01 after Queens wave 3 — corona.json, elmhurst.json,
      # forest-hills.json and rego-park.json. Eighty-nine places, fourteen with
      # `"address": null`, so seventy-five reach this setup:
      #
      #   corona        17 places,  1 null, 16 addressed, 12 street,  4 not,  7 zip,  4 loc-only
      #   elmhurst      32 places,  3 null, 29 addressed, 23 street,  6 not,  1 zip,  6 loc-only
      #   forest-hills  28 places,  8 null, 20 addressed, 16 street,  4 not, 15 zip,  4 loc-only
      #   rego-park     12 places,  2 null, 10 addressed,  4 street,  6 not,  8 zip,  1 loc-only
      #
      #   * total 2269 -> 2344, the seventy-five addressed places.
      #   * `streetAddress` 1723 -> 1778 and `is_nil(streetAddress)` 546 -> 566,
      #     splitting them 55 / 20, which sums to the +75 above.
      #   * `postalCode` 1800 -> 1831, +31.
      #   * locality-only 273 -> 288, +15.
      #
      # Two rows in that table look wrong and are not. Elmhurst has twenty-nine
      # addressed places and exactly ONE postal code, because twelve of its
      # places are religious institutions whose verdicts (F105) confirm the
      # street address and nothing else — no ZIP was invented to round them out.
      # Forest Hills has the most nulls of any page in the corpus at eight, and
      # they are the right eight: Forest Hills Gardens, Arbor and Forest Close,
      # three playgrounds, Austin Street and the LIRR station are all sited by
      # cross-street or by agency record, never by house number. Austin Street's
      # was set to null during the review pass, having shipped as a street name
      # with no number in it.
      #
      # The `comma_streets <= 48` pin holds at 48, checked rather than assumed.
      #
      # Re-measured 2026-09-02 after Queens wave 4 — glendale.json, maspeth.json
      # and ridgewood.json, the Community District 5 group. Sixty places, seven
      # with `"address": null`, so fifty-three reach this setup:
      #
      #   glendale   18 places, 1 null, 17 addressed, 14 street, 3 not, 17 zip, 0 loc-only
      #   maspeth    19 places, 2 null, 17 addressed, 10 street, 7 not, 17 zip, 0 loc-only
      #   ridgewood  23 places, 4 null, 19 addressed, 16 street, 3 not, 18 zip, 1 loc-only
      #
      #   * total 2344 -> 2397, the fifty-three addressed places.
      #   * `streetAddress` 1778 -> 1818 and `is_nil(streetAddress)` 566 -> 579,
      #     splitting them 40 / 13, which sums to the +53 above.
      #   * `postalCode` 1831 -> 1883, +52 — fifty-two of the fifty-three.
      #   * locality-only 288 -> 289, +1.
      #
      # That last pair is the wave's signature and it is not an error. Almost
      # every street-less row here still carries a ZIP, so the thirteen
      # street-less places add only one row to the locality-only bucket. The
      # reason is in how CD 5 was researched: with almost nothing landmarked in
      # Maspeth or Glendale, the verifiers leaned on NYC Parks property records
      # and other agency datasets, which carry a ZIP for every property even
      # when they give a cross-street rather than a house number. Compare wave 3,
      # where Elmhurst's twelve religious institutions had street lines and no
      # ZIPs at all — the opposite shape, from the opposite kind of source.
      #
      # The `comma_streets <= 48` pin holds at 48, checked rather than assumed.
      #
      # Re-measured 2026-09-02 after Queens wave 5 — flushing.json, bayside.json
      # and douglaston.json. Fifty-four places, ten with `"address": null`, so
      # forty-four reach this setup:
      #
      #   flushing    20 places, 2 null, 18 addressed, 16 street, 2 not, 17 zip, 1 loc-only
      #   bayside     14 places, 4 null, 10 addressed,  8 street, 2 not,  3 zip, 1 loc-only
      #   douglaston  20 places, 4 null, 16 addressed, 15 street, 1 not, 15 zip, 0 loc-only
      #
      #   * total 2397 -> 2441, the forty-four addressed places.
      #   * `streetAddress` 1818 -> 1857 and `is_nil(streetAddress)` 579 -> 584,
      #     splitting them 39 / 5, which sums to the +44 above.
      #   * `postalCode` 1883 -> 1918, +35. Bayside supplies only three of those
      #     across ten addressed places: its landmark quartet is sourced from LPC
      #     designation reports, which print a street line and no ZIP.
      #   * locality-only 289 -> 291, +2.
      #
      # The `comma_streets <= 48` pin was TRIPPED by this wave and then fixed,
      # for the third time in the programme and by the same remedy. The Bayside
      # Historical Society ships at the address it prints for itself,
      # "208 Totten Avenue, Fort Totten, Bayside, NY 11359", whose campus line
      # the greedy street capture keeps as "208 Totten Avenue, Fort Totten" —
      # taking the count to 49. The campus line was dropped from the `address`
      # field rather than the pin raised, exactly as Bartow-Pell's park line and
      # Calvary Hospital's neighborhood line were before it. Nothing is lost:
      # the Society's own printed form survives verbatim in that place's
      # summary, attributed to the Society, which is where a qualifier that is
      # not part of the postal address belongs.
      #
      # Re-measured 2026-09-02 after Queens wave 6, which COMPLETES the borough:
      # jamaica, kew-gardens, richmond-hill, far-rockaway and rockaway-beach
      # bring priv/seed_data/queens/ to all twenty-one in-scope neighborhoods.
      # Ninety-two places, sixteen with `"address": null`, so seventy-six reach
      # this setup:
      #
      #   jamaica         23 places, 3 null, 20 addressed, 16 street,  4 not,  5 zip, 4 loc-only
      #   kew-gardens     14 places, 3 null, 11 addressed,  9 street,  2 not,  4 zip, 2 loc-only
      #   richmond-hill   23 places, 8 null, 15 addressed, 15 street,  0 not, 15 zip, 0 loc-only
      #   far-rockaway    21 places, 2 null, 19 addressed,  9 street, 10 not,  7 zip, 4 loc-only
      #   rockaway-beach  11 places, 0 null, 11 addressed,  6 street,  5 not, 10 zip, 1 loc-only
      #
      #   * total 2441 -> 2517, the seventy-six addressed places.
      #   * `streetAddress` 1857 -> 1912 and `is_nil(streetAddress)` 584 -> 605,
      #     splitting them 55 / 21, which sums to the +76 above.
      #   * `postalCode` 1918 -> 1959, +41.
      #   * locality-only 291 -> 302, +11.
      #
      # A seventeenth place landed in this wave and moves NONE of these counts:
      # `alley-pond-park` was added to bayside.json, which shipped in wave 5. It
      # carries `"address": null` deliberately — NYC Parks' Q001 record has no
      # address field at all, and borrowing the Alley Pond Environmental
      # Center's would have manufactured a marquee address that does not exist.
      # It is hosted, not claimed: `town: "Queens"`, and history stating the park
      # is administratively part of no neighborhood. That record exists so the
      # marquee gate in queens_seed_data_test.exs can hold at exactly one file
      # per institution; see the note there for why hosting and containment are
      # separable.
      #
      # Far Rockaway is the shape worth naming: nineteen addressed places and
      # ten of them street-less, the highest such ratio in the corpus. Its
      # research leaned on NYC Parks properties and NRHP entries along Mott
      # Avenue, which give a location string rather than a house number.
      #
      # The `comma_streets <= 48` pin holds at 48.
      # Re-measured 2026-09-02 after Rome waves 1-3, which land the first twelve
      # rioni — Campitelli, Monti, Trastevere, Borgo, Pigna, Parione, Colonna,
      # Trevi, Prati, Ludovisi, Sallustiano and Castro Pretorio — 450 places,
      # 313 of them addressed.
      #
      # Rome moves these counts differently from any borough, because it is the
      # first destination whose addresses are not American, and two defects had
      # to be fixed before the figures meant anything.
      #
      #   * `addressCountry` was the literal "US". Every Roman place would have
      #     published the Pantheon as American. It is now derived from the
      #     region, and asserted per place rather than as a constant.
      #   * `Ethos.Places.Address.parse/1` returned NO street line for any Roman
      #     address. The Italian shape inverts both axes it reads — the house
      #     number trails, the CAP leads — and carries one comma where `@full`
      #     and `@head` both need two, so all 313 fell to the nil-with-scanned-
      #     postal path. Forty-four still showed a postal code, because a CAP is
      #     five digits and `scan_postal/1` finds any five-digit run, which is
      #     why the gap read as a missing street rather than as nothing at all.
      #
      #   * total 2517 -> 2830, the 313 addressed Roman places.
      #   * `streetAddress` 1912 -> 2225, +313: every Roman address yields a
      #     street line. `is_nil(streetAddress)` is UNCHANGED at 605, which is
      #     the check that the Italian branch took nothing away from the
      #     American corpus — it only ever turns a nil into a value.
      #   * `postalCode` 1959 -> 2076, +117. Not +313: 196 of the Roman
      #     addresses carry no CAP at all, taking the form "Lungotevere Castello
      #     50, Roma RM".
      #   * locality-only is UNCHANGED at 302. No Roman place lands there, since
      #     every one of them now emits a street.
      #
      # The `comma_streets <= 48` pin holds at 48: no Italian street line
      # carries a comma, because the Italian shape puts nothing after the
      # thoroughfare and its number.

      count = fn f -> Enum.count(emitted, fn {_, ld} -> f.(ld) end) end

      #
      # Re-measured 2026-09-03 after Rome wave 4, which lands the last nine
      # rioni — Celio, Campo Marzio, Ponte, Regola, Sant'Eustachio,
      # Sant'Angelo, Ripa, Testaccio, San Saba — bringing the city to 21 of its
      # 22 and the corpus to 704 addressed Roman places.
      #
      #   * total 2830 -> 3221, the 391 newly addressed Roman places.
      #   * `streetAddress` 2225 -> 2616, +391: every Roman address yields a
      #     street. Reaching that took three thoroughfare types the first pass
      #     did not know — piazzetta, vico and monte, from Piazzetta di San
      #     Simeone, Vico Jugario and Monte de' Cenci. All three are ordinary
      #     Roman street names.
      #   * `is_nil(streetAddress)` UNCHANGED at 605 and locality-only
      #     UNCHANGED at 302. Those two are the check that the Italian branch
      #     still only ever turns a nil into a value.
      #   * `postalCode` 2076 -> 2355, +279. Not +391: 112 of the new Roman
      #     addresses carry no CAP, taking the form "Vico Jugario, Roma RM".
      #
      # The `comma_streets` pin is now per region, in
      # test/ethos/places/address_test.exs. Wave 4 brought 18 Italian street
      # lines carrying a comma and would have pushed the shared pin from 48 to
      # 66 — but the Italian comma is part of the address ("Via di
      # Sant'Apollinare, 46" is standard postal form, comma before the house
      # number), where the American comma is a qualifier the greedy capture
      # swept in. Raising one number would have hidden the difference; the
      # American pin holds at 48 and the Italian lines are held to their own
      # shape.

      #
      # Re-measured 2026-09-03 after Rome wave 5 and Vatican City, which COMPLETE
      # the city at all thirty-one zones: 22 rioni, 8 tier-1 quartieri and the
      # sovereign state. 1,012 addressed Roman places and 6 Vatican ones.
      #
      #   * total 3221 -> 3535.
      #   * `streetAddress` 2616 -> 2927. Every one of the 1,012 Roman addresses
      #     yields a street line. Getting there took three more thoroughfare
      #     types — lungomare, quadrato and parco, from Ostia's seafront, EUR's
      #     grid and Villa Borghese — and one address in Ardeatino that had lost
      #     its ", Roma RM" tail.
      #   * `is_nil(streetAddress)` 605 -> 608. The three are VATICAN, not
      #     Roman: the Necropolis publishes "00120 Citta del Vaticano" with no
      #     street at all, and the Museums publish "Viale Vaticano, 00165 Rome"
      #     in English with no province. Both are faithful to what those
      #     institutions publish, and neither is worth rewriting to satisfy a
      #     parser.
      #   * `postalCode` 2355 -> 2550. locality-only UNCHANGED at 302, which is
      #     the check that nothing regressed into the worst shape.
      #
      # St Peter's parses because `@vatican` was added: Vatican addresses carry
      # no province code, so the Italian pattern — which requires one — matched
      # none of them. It is a separate pattern rather than a loosening of the
      # Italian one, so the Vatican form has to be recognised deliberately
      # rather than fallen into.

      #
      # Re-measured 2026-09-03 after San Francisco wave 1, which lands twelve
      # neighborhoods — Mission, North Beach, Chinatown, Haight-Ashbury, Castro,
      # Marina, SoMa, Fisherman's Wharf, Nob Hill, Russian Hill, Pacific Heights
      # and Hayes Valley — 468 places, 405 of them addressed.
      #
      # California needed NO parser work. It is the corpus's fifth region and
      # the first since Connecticut and New York to be plain American, so the
      # branch built for "9 Main Street North, Bethlehem, CT 06751" handled
      # "3321 16th Street, San Francisco, CA 94114" unchanged. That is the
      # check this line records: Rome cost three rounds of thoroughfare types
      # and a whole Vatican pattern, and San Francisco cost none.
      #
      #   * total 3535 -> 3939, the 404 addressed San Francisco places. The fix pass
      #     took one away: Chinatown's Ping Yuen carried "895 Pacific Avenue" when
      #     its verdict gives four buildings on Pacific Avenue and NO street number,
      #     so the address is now null. A removed invention is the right direction
      #     for this figure to move.
      #   * `streetAddress` 2927 -> 3325, +398.
      #   * `is_nil(streetAddress)` 608 -> 614, +6. All six are correctly
      #     rejected descriptive locations rather than parser gaps: two
      #     intersections at Pier 39 ("Beach Street and The Embarcadero"),
      #     Washington Square's "Filbert and Stockton", SoMa's "South Park
      #     Street" with no number, and two Fort Mason addresses that lead with
      #     the campus name before reaching 2 Marina Boulevard. A false
      #     streetAddress on any of them would be worse than none.
      #   * `postalCode` 2550 -> 2707, +157. Not +404: many San Francisco
      #     records carry a street with no ZIP.
      #   * locality-only 302 -> 303, +1 — South Park Street, which has neither
      #     a house number nor a postal code.

      #
      # Re-measured 2026-09-03 after San Francisco wave 2, which COMPLETES the
      # city at all twenty-three zones: the twenty neighborhoods plus the
      # Presidio, Golden Gate Park and Ocean Beach, which are claimed by no
      # neighborhood because folding them in would assert a containment that is
      # false. 855 places, 669 of them addressed.
      #
      #   * total 3939 -> 4204, the 265 newly addressed places.
      #   * `streetAddress` 3325 -> 3582, +257.
      #   * `is_nil(streetAddress)` 614 -> 622, +8 — descriptive locations the
      #     American house-number rule correctly rejects, as in wave 1.
      #   * `postalCode` 2707 -> 2833, +126.
      #   * locality-only 303 -> 307, +4.
      #
      # California still needed no parser work across either wave. It is the
      # corpus's fifth region and the first since Connecticut to be plain
      # American, so the branch built for "9 Main Street North, Bethlehem, CT
      # 06751" carried all 669 San Francisco addresses unchanged. Rome cost
      # three rounds of thoroughfare types and a Vatican pattern of its own.

      #
      # Re-measured 2026-09-04 after London wave 1, which lands the City and ten
      # inner boroughs — 178 addressed places, every one of them British.
      #
      #   * total 4204 -> 4382, the 178 addressed London places.
      #   * `streetAddress` 3582 -> 3760, +178. ALL of them. That is the figure
      #     worth pausing on: no previous region has emitted a street line for
      #     every single address, and London reached it only after the parser
      #     learned an eleventh form.
      #   * `is_nil(streetAddress)` 622 -> 622, +0, which is the same fact from
      #     the other side. It was +10 before that form landed: ten addresses
      #     carry an outward code and no unit ("81 Fulham Road, Chelsea, London
      #     SW3"), which the full-postcode pattern cannot match and which
      #     `@uk_no_postcode` rejects for having three segments where it allows
      #     two. One of the ten opens with its own house number, so the loss was
      #     a pattern that never reached the judgement rather than a judgement
      #     about descriptiveness, and `@uk_outward` now recovers all ten.
      #   * `postalCode` 2833 -> 3000, +167, NOT +178. The eleven that carry
      #     none are the ten outward-code rows plus "Tower Hill, London", which
      #     names no code at all. AN OUTWARD CODE IS NOT A POSTCODE — it is a
      #     postal district rather than a delivery point — so the parser
      #     discards it rather than publishing it half-right, and these eleven
      #     correctly emit a street with no postal code beside it.
      #   * locality-only 307 -> 307, +0. Every London row carries a street, so
      #     none of them can be in this bucket whatever its postal code.
      #
      # Re-measured 2026-09-04 after London wave 2, which lands Westminster,
      # Wandsworth and nine outer boroughs — 195 more addressed places.
      #
      #   * total 4382 -> 4577, +195.
      #   * `streetAddress` 3760 -> 3954, +194.
      #   * `is_nil(streetAddress)` 622 -> 623, +1, and 194 + 1 accounts for
      #     every row. The one is "Kensington Gore, London": no house number, no
      #     thoroughfare type, and no postal code of any kind, so nothing
      #     distinguishes it from a description and the parser correctly
      #     declines to guess. Its full address is still rendered on the page.
      #   * `postalCode` 3000 -> 3190, +190. The five without are postcode-less
      #     "…, London" forms.
      #   * locality-only 307 -> 308, +1 — Kensington Gore again, which has
      #     neither a street line nor a postal code.
      #
      # The +194 needed a parser change and the change was a NARROWING of a
      # guard rather than a loosening. `@uk_no_postcode` allowed two segments
      # only, on the reasoning that more than that with no postcode could not be
      # told from a description — but the guard that actually does that work is
      # `uk_street_or_nil/2` with `postcode?` false, which demands a house
      # number or a thoroughfare type whatever the comma count. The comma limit
      # was suppressing "Crown Street, Dagenham, London" while the real guard
      # ran anyway. Two thoroughfare additions came with it, both from real
      # addresses the way Rome's Italian list grew: "circle", for Regent's
      # Park's two ring roads, and an optional trailing compass point, for
      # "Whalebone Lane North".
      #
      # Re-measured 2026-09-04 after London wave 3, which COMPLETES the city at
      # all thirty-three units — the 32 boroughs and the City — with 197 more
      # addressed places, every one of them in an outer borough.
      #
      #   * total 4577 -> 4774, +197.
      #   * `streetAddress` 3954 -> 4151, +197. All of them.
      #   * `postalCode` 3190 -> 3387, +197. All of them, which no earlier wave
      #     in any city managed: the outer boroughs' addresses come off the
      #     National Heritage List and off operator sites, and both publish a
      #     full postcode as a matter of course.
      #   * `is_nil(streetAddress)` unmoved at 623 and locality-only unmoved at
      #     308, which is the same fact from the other two sides.
      #
      # WAVE 3 NEEDED NO PARSER WORK. That is the figure this line exists to
      # record: waves 1 and 2 each cost a new British form — @uk_outward for the
      # ten outward-code addresses, and the widening of @uk_no_postcode for the
      # postcode-less ones — and by wave 3 the branch built for those carried
      # all 197 unchanged. Rome took three waves to reach the same point and
      # San Francisco needed none at all, being plain American.
      #
      # Re-measured 2026-09-05 after the first five Korean BBQ guides landed —
      # Los Angeles, Chicago, Chicago's north suburbs, the South Bay and Puget
      # Sound — 72 places between them. These are the collection's five metros
      # with no neighborhood corpus of their own, so each guide owns every
      # place it presents rather than deferring to a neighborhood file. Every
      # one of the 72 is addressed, and each digit is accounted for:
      #
      #   * total 4774 -> 4846, the 72 addressed places.
      #   * `streetAddress` 4151 -> 4223, +72. ALL of them.
      #   * `postalCode` 3387 -> 3459, +72. ALL of them, which is the same
      #     shape as London wave 3 for a different reason: London's outer
      #     boroughs came off the National Heritage List and operator sites;
      #     these are American restaurant addresses taken from the
      #     restaurants' own operator sites, and a house number and a ZIP come
      #     with that territory as a matter of course. Contrast London wave 1,
      #     which needed a new parser branch — @uk_outward — before ten of its
      #     addresses would yield a street line at all; nothing here needed
      #     one.
      #   * `is_nil(streetAddress)` unmoved at 623 and locality-only unmoved at
      #     308, which is the same fact from the other side: not one of the 72
      #     is a descriptive location.
      #
      # Re-measured again the same day: Han Sung BBQ (South Bay) was withdrawn
      # for want of tabletop evidence. Its own site and the diner account it
      # quoted established only a charcoal grill, never a grill at the table,
      # and the gate that is supposed to catch that had a hole — a bare
      # "charcoal grill" substring — that this entry had cleared through. With
      # the hole closed and the place gone, the 72 addressed Korean BBQ places
      # become 71:
      #
      #   * total 4846 -> 4845, -1.
      #   * `streetAddress` 4223 -> 4222, -1. It carried one.
      #   * `postalCode` 3459 -> 3458, -1. It carried one of those too.
      #   * `is_nil(streetAddress)` unmoved at 623 and locality-only unmoved at
      #     308: the withdrawn place was never counted on either of those
      #     sides to begin with.
      #
      # Re-measured after the five Korean BBQ guides for Manhattan, Queens,
      # Brooklyn, San Francisco and London landed — the five metros this
      # corpus already covers, so most of their restaurants' place records
      # were not new rows in priv/seed_data/korean_bbq/ at all: they resolve
      # by slug into 26 existing neighborhood files across those five
      # directories, which is the legal cross-file reference three-pass
      # directory seeding allows. Sixty-five addressed rows landed there:
      #
      #   * total 4845 -> 4910, +65.
      #   * `streetAddress` 4222 -> 4287, +65 — all of them. Every one of the
      #     sixty-five carries a house number.
      #   * `postalCode` 3458 -> 3523, +65 — all of them. Not every one is a
      #     five-digit ZIP: fifty-one are American and carry one, and the
      #     fourteen London restaurants carry an alphanumeric UK postcode
      #     instead (N1C 4AG, SE13 5NS). What this bucket proves is that a
      #     postal code of SOME shape was parsed for all sixty-five, not that
      #     they share a format.
      #   * `is_nil(streetAddress)` unmoved at 623 and locality-only unmoved
      #     at 308, which is the same fact from the other side: not one of
      #     the 65 is a descriptive location. A row with a house number and a
      #     postal code cannot be street-less or locality-only, so both
      #     buckets were always going to hold still; the +65/+65 above and the
      #     two unmoved counts here are the same claim seen from opposite
      #     sides.
      #
      # Re-measured after the evidence standard that withdrew Han Sung BBQ was
      # re-run across the whole collection rather than the four entries it was
      # first applied to. Eight more restaurants were withdrawn for want of a
      # source establishing a grill at the table: three in Puget Sound (The
      # Grill in Lakewood, Palace Korean Bar & Grill in Federal Way, Ka Won in
      # Lynnwood), one in Los Angeles (Moon BBQ #2), and four in Chicago's
      # north suburbs (Mr. Kimchi, Hwang Soh Grill, Gopchang Story in Glenview,
      # Pro Samgyubsal). In every one of the eight the "at the table" was the
      # researcher's conclusion and not the source's sentence — four had a
      # source that never mentions a table at all, and four cited a
      # search-results URL, which is not a citation because it is not
      # re-checkable. Two of the ten re-examined survived on new evidence and
      # stay. All eight withdrawn rows lived in priv/seed_data/korean_bbq/ and
      # every one carried a house number and a five-digit ZIP, so the delta is
      # -8 three times over:
      #
      #   * total 4910 -> 4902, -8.
      #   * `streetAddress` 4287 -> 4279, -8. All eight carried one.
      #   * `postalCode` 3523 -> 3515, -8. All eight carried one of those too.
      #   * `is_nil(streetAddress)` unmoved at 623 and locality-only unmoved at
      #     308: a row with both a house number and a postal code was never
      #     counted on either of those sides, so withdrawing eight of them
      #     cannot move either bucket. That is the same claim as the two -8s
      #     above, seen from the other side.
      #
      # Re-measured after steakhouse content wave 1 landed
      # priv/seed_data/steakhouse/{manhattan,brooklyn,queens}.json with 32, 15
      # and 16 places. All 63 carry a house-numbered street line and a
      # five-digit ZIP, so the delta is +63 three times over and nil on the two
      # street-less buckets:
      #
      #   * total 4902 -> 4965, +63.
      #   * `streetAddress` 4279 -> 4342, +63. Every one carries a street line.
      #   * `postalCode` 3515 -> 3578, +63. Every one carries a ZIP.
      #   * `is_nil(streetAddress)` unmoved at 623 and locality-only unmoved at
      #     302: a row carrying both a house number and a postal code is
      #     counted on neither side, so adding sixty-three of them cannot move
      #     either bucket.
      #
      # Re-measured after that wave's fix round withdrew Boucherie Union Square
      # from priv/seed_data/steakhouse/manhattan.json. Its only evidence was an
      # appearance in a steak listicle, which the content rules' §1 rules out,
      # and the published summary conceded the brasserie shape §1 excludes by
      # name. Manhattan goes 32 -> 31 and the wave's 63 places become 62. The
      # withdrawn row carried a house-numbered street line and a five-digit ZIP,
      # so the delta is -1 three times over and nil on the two street-less
      # buckets, exactly mirroring the +63:
      #
      #   * total 4965 -> 4964, -1.
      #   * `streetAddress` 4342 -> 4341, -1. It carried one.
      #   * `postalCode` 3578 -> 3577, -1. It carried one of those too.
      #   * `is_nil(streetAddress)` unmoved at 623 and locality-only unmoved at
      #     302, which is the same fact from the other side.
      #
      # The same fix round restored PRIME Mēt's floor designator, taking its
      # address to "133-36 37th Ave, 12th Floor, Flushing, NY 11354". That row
      # still yields a street line and a ZIP, so none of the four numbers here
      # moves for it; what it moves is the `comma_streets` pin in
      # test/ethos/places/address_test.exs, from 57 to 58, where the reasoning
      # is recorded.
      # Re-measured after steakhouse content wave 2 landed
      # priv/seed_data/steakhouse/{chicago,los-angeles,san-francisco,seattle}.json
      # with 20, 18, 11 and 16 places. All 65 carry a house-numbered street line
      # and a five-digit ZIP, so the delta is +65 three times over and nil on the
      # two street-less buckets, exactly as wave 1's +63 was:
      #
      #   * total 4964 -> 5029, +65.
      #   * `streetAddress` 4341 -> 4406, +65. Every one carries a street line.
      #   * `postalCode` 3577 -> 3642, +65. Every one carries a ZIP.
      #   * `is_nil(streetAddress)` unmoved at 623 and locality-only unmoved at
      #     302: a row carrying both a house number and a postal code is counted
      #     on neither side, so adding sixty-five of them cannot move either.
      #
      # Five of the sixty-five carry a suite or floor designator inside the
      # street line — the Vault's "Concourse Level", Niku X's "2nd Floor" and
      # three "Suite 100" rooms — which moves the `comma_streets` pin in
      # test/ethos/places/address_test.exs from 58 to 63 and nothing here.
      # Re-measured after steakhouse content wave 3 landed
      # priv/seed_data/steakhouse/{boston,london,miami,washington-dc}.json with
      # 12, 28, 16 and 13 places. All 69 carry a street line and a postal code —
      # the London twenty-eight carry UK postcodes rather than five-digit ZIPs,
      # and the emitter counts a postcode the same way — so the delta is +69
      # three times over and nil on the two street-less buckets, exactly as
      # wave 1's +63 and wave 2's +65 were:
      #
      #   * total 5029 -> 5098, +69.
      #   * `streetAddress` 4406 -> 4475, +69. Every one carries a street line.
      #   * `postalCode` 3642 -> 3711, +69. Every one carries a postal code.
      #   * `is_nil(streetAddress)` unmoved at 623 and locality-only unmoved at
      #     302: a row carrying both a house number and a postal code is counted
      #     on neither side, so adding sixty-nine of them cannot move either.
      #
      # Two of the sixty-nine carry a suite designator inside the street line —
      # Del Frisco's Boston "Suite 200" and Fleming's Brickell "Suite 150" —
      # which moves the `comma_streets` pin in
      # test/ethos/places/address_test.exs from 63 to 65 and nothing here.
      #
      # Re-measured after ski content wave 1 landed
      # priv/seed_data/ski/{ascutney-outdoors,bolton-valley-resort,
      # bromley-mountain-resort,burke-mountain-resort,cochrans-ski-area,hardack,
      # harrington-hill,jay-peak-resort,killington-ski-resort,
      # living-memorial-park,lyndon-outing-club,mad-river-glen}.json with 36
      # places (one ski area plus surroundings per file). Of the 36: 14 carry a
      # house-numbered street line AND a five-digit ZIP; 3 more carry a street
      # line with no ZIP (Hard'Ack's own address, Welden Theatre, and Living
      # Memorial Park's own address — all real, just ZIP-less as sourced); 3
      # carry a ZIP with no street (Hapgood Pond Recreation Area, Kingdom
      # Trails Association's P.O. box, and the Strafford Village Historic
      # District); the remaining 16 are street-less and ZIP-less locality-only
      # rows — mostly a mountain's own town-level address ("Bolton, VT", "Jay,
      # VT") or a descriptive historic-site location with no house number
      # ("Behind Barrett Hall, above Route 132, Strafford, VT"), exactly the
      # shape this bucket exists for:
      #
      #   * total 5098 -> 5134, +36.
      #   * `streetAddress` 4475 -> 4492, +17 (the 14 street+ZIP rows plus the
      #     3 street-only rows).
      #   * `is_nil(streetAddress)` 623 -> 642, +19 (the 3 ZIP-only rows plus
      #     the 16 locality-only rows).
      #   * `postalCode` 3711 -> 3728, +17 (the 14 street+ZIP rows plus the 3
      #     ZIP-only rows).
      #
      # One of the 36 carries a comma inside its street line — the Inn at Long
      # Trail's "709 Route 4, Sherburne Pass" — which moves the `comma_streets`
      # pin in test/ethos/places/address_test.exs from 65 to 66 and nothing
      # here.
      assert length(emitted) == 5134
      assert count.(& &1["streetAddress"]) == 4492
      assert count.(&is_nil(&1["streetAddress"])) == 642
      assert count.(& &1["postalCode"]) == 3728

      # The largest behavioural delta this change ships: 302 places emit a
      # PostalAddress carrying only locality, region and country. Their full
      # address is still rendered on the page.
      #
      # The figure was 245 when this comment was written, went to 248 when
      # priv/seed_data/bronx/mott-haven.json landed three historic districts
      # whose sourced addresses are street ranges, and to 251 when
      # priv/seed_data/bronx/bronx-park.json landed a boundary list, a street
      # intersection and a road-within-a-garden. It did not move when
      # priv/seed_data/bronx/city-island.json landed, because all twelve of that
      # file's addresses carry a house number, and it did not move when
      # priv/seed_data/bronx/pelham-bay-park.json landed either: that file's two
      # addressed places both carry a house number, and its two street-less
      # places carry no address at all. It went to 258 when the six-file wave
      # above landed seven street-less rows, four in Riverdale and three in
      # Kingsbridge, none of them carrying a ZIP. It went to 267 when
      # hunts-point.json and concourse.json landed nine more, seven of them
      # NYC Parks cross-street ranges. It went to 275 with Queens wave 1, which
      # added eleven street-less rows but only eight locality-only ones — three
      # Astoria rows are street-less yet carry a ZIP. It fell to 266 when the
      # address parser learned to retry past a trailing remark, which gave nine
      # of these rows back their street line. It rose to 273 with Queens wave 2,
      # which added four such rows in Jackson Heights and three in Woodside, and to
      # 288 with wave 3, and to 289 with wave 4, whose street-less rows nearly all
      # carry a ZIP and so sit outside this bucket, and to 291 with wave 5 and 302
      # with wave 6, which completed the borough. The comment was not updated
      # with the assertion and spent two commits contradicting a number three
      # lines below it, which is worse than either being wrong alone. Keep the
      # two in step.
      # 303 after San Francisco wave 1. The one addition is SoMa's South Park,
      # whose sourced address is "South Park Street, San Francisco, CA" — no
      # house number and no ZIP, so it correctly emits locality, region and
      # country alone. Its full address is still rendered on the page.
      # 307 held through London wave 1, whose every address yielded a street. It
      # went to 308 with wave 2, and the one addition is "Kensington Gore,
      # London" — no house number, no thoroughfare type and no postal code, so
      # it correctly emits locality, region and country alone.
      # 308 held through Korean BBQ wave 1 (Los Angeles, Chicago, Chicago's
      # north suburbs, the South Bay and Puget Sound). All 72 of that wave's
      # addresses carry a street line, so none of them can be in this bucket
      # whatever its postal code — the same fact the streetAddress and
      # postalCode assertions above prove from the other side.
      # 308 held again through the five Korean BBQ guides for Manhattan,
      # Queens, Brooklyn, San Francisco and London. All 65 of those addressed
      # rows carry both a street line and a postal code, so none of them can
      # be in this bucket either — the same fact the streetAddress and
      # postalCode assertions above prove from the other side.
      # 308 held once more when eight Korean BBQ restaurants were withdrawn for
      # want of a source establishing a grill at the table. All eight carried
      # both a street line and a postal code, so none of them was ever in this
      # bucket to be removed from it.
      # 324 after ski content wave 1 landed, +16 — the sixteen street-less,
      # ZIP-less rows counted above: nine ski areas' own addresses given only
      # at town level (Ascutney Outdoors, Bolton Valley, Bromley, Burke
      # Mountain, Harrington Hill, Jay Peak, Killington, Lyndon Outing Club,
      # Mad River Glen — none of these small Vermont ski areas publishes a
      # street-numbered mailing address) plus seven surrounding historic
      # sites and parks sourced as descriptive locations rather than postal
      # addresses (Best's and Bowers covered bridges, the Round Church,
      # Andrews Community Forest, Taylor Park, Old Schoolhouse Bridge, and
      # Chamberlin Mill Covered Bridge). Every one is a real address as the
      # source gives it; none is missing a house number the source actually
      # had.
      assert count.(fn ld -> is_nil(ld["streetAddress"]) and is_nil(ld["postalCode"]) end) == 324
    end
  end
end
