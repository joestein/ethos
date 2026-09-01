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
      count = fn f -> Enum.count(emitted, fn {_, ld} -> f.(ld) end) end

      assert length(emitted) == 2214
      assert count.(& &1["streetAddress"]) == 1646
      assert count.(&is_nil(&1["streetAddress"])) == 568
      assert count.(& &1["postalCode"]) == 1759

      # The largest behavioural delta this change ships: 275 places emit a
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
      # Astoria rows are street-less yet carry a ZIP. The comment was not updated
      # with the assertion and spent two commits contradicting a number three
      # lines below it, which is worse than either being wrong alone. Keep the
      # two in step.
      assert count.(fn ld -> is_nil(ld["streetAddress"]) and is_nil(ld["postalCode"]) end) == 275
    end
  end
end
