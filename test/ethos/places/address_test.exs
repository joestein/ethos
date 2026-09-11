defmodule Ethos.Places.AddressTest do
  use ExUnit.Case, async: true
  alias Ethos.Places.Address

  # Rome is the only Italian destination today; a later Italian city adds its
  # own province code here. Held as an explicit list rather than inferred, so a
  # US region can never fall into the Italian branch of an assertion by
  # accident — "RM" is not a US state code, and neither is any addition.
  @italian_provinces ["RM"]

  test "decomposes a standard address" do
    assert Address.parse("9 Main Street North, Bethlehem, CT 06751") ==
             %{
               street: "9 Main Street North",
               locality: "Bethlehem",
               region: "CT",
               postal_code: "06751",
               parsed?: true
             }
  end

  test "parses without a postal code" do
    assert %{street: "1 Elm Street", locality: "Hartford", region: "CT", postal_code: nil} =
             Address.parse("1 Elm Street, Hartford, CT")
  end

  test "a descriptive location yields no street but keeps the rest" do
    parsed =
      Address.parse("Cropsey Avenue between 21st Avenue and Bay Parkway, Brooklyn, NY 11214")

    assert parsed.street == nil
    assert parsed.locality == "Brooklyn"
    assert parsed.region == "NY"
    assert parsed.postal_code == "11214"
    assert parsed.parsed?
  end

  test "an unparseable address reports parsed? false and invents nothing" do
    parsed =
      Address.parse(
        "Irving Ave. and Knickerbocker Ave., between Starr St. and Suydam St., Brooklyn"
      )

    refute parsed.parsed?
    assert parsed.street == nil
    assert parsed.locality == nil
  end

  test "finds a postal code even when the whole address does not parse" do
    parsed =
      Address.parse("2 Wyckoff Avenue, Brooklyn, NY 11237, entrance at 408 Jefferson Street")

    assert parsed.postal_code == "11237"
  end

  test "nil in, empty out" do
    assert %{parsed?: false, street: nil, postal_code: nil} = Address.parse(nil)
  end

  test "a ZIP+4 keeps only the five-digit code" do
    assert Address.parse("1 Elm Street, Hartford, CT 06103-1234").postal_code == "06103"
  end

  test "a street named after its own town keeps its street line" do
    # 52 addresses in the corpus sit on a road named for the town it serves.
    # The town name inside the street is part of the street's real name, not a
    # leaked locality, and the street line is correct as it stands.
    assert Address.parse("145 Brooklyn Avenue, Brooklyn, NY 11213").street ==
             "145 Brooklyn Avenue"

    assert Address.parse("279 Avon Mountain Road, Avon, CT 06001").street ==
             "279 Avon Mountain Road"
  end

  test "an intermediate place name that repeats the locality is dropped from the street" do
    # The greedy street capture pulls "Brooklyn Bridge Park" into the street
    # line, where it re-duplicates the locality. Only segments after the first
    # are dropped, so a town-named road in the leading segment survives.
    assert Address.parse("65 Water Street, Brooklyn Bridge Park, Brooklyn, NY 11201").street ==
             "65 Water Street"

    assert Address.parse("36 Main Street South, Bethlehem Town Hall, Bethlehem, CT 06751").street ==
             "36 Main Street South"

    # A qualifier that does not mention the locality is kept.
    assert Address.parse("353 CT-165, Fleming's Center, Preston, CT 06365").street ==
             "353 CT-165, Fleming's Center"
  end

  test "a whitespace-only segment is absent, not blank" do
    parsed = Address.parse("1 Elm Street,   , CT 06103")
    assert parsed.locality == nil
    assert parsed.region == "CT"
  end

  test "a leading ordinal is a street name, not a house number" do
    assert Address.parse("18th Avenue between 55th and 58th Streets, Brooklyn, NY 11204").street ==
             nil

    assert Address.parse("86th Street and 7th Avenue, Brooklyn, NY 11228").street == nil

    # A real building number on an ordinal street is untouched.
    assert Address.parse("1523 18th Avenue, Brooklyn, NY 11204").street == "1523 18th Avenue"
  end

  test "a trailing remark after the region or ZIP does not sink the whole address" do
    # The anchored match fails on every one of these, and before the retry path
    # existed each returned street, locality and region all nil — publishing no
    # streetAddress for an address that plainly has one. 38 corpus rows were in
    # that state. The four shapes, one per delimiter the retry recognises:
    #
    # parenthetical after the ZIP
    assert Address.parse(
             "126 Brightwater Court, Brooklyn, NY 11235 (Brighton 2nd Street between Brightwater Court and the Boardwalk)"
           ) == %{
             street: "126 Brightwater Court",
             locality: "Brooklyn",
             region: "NY",
             postal_code: "11235",
             parsed?: true
           }

    # comma-led clause after the ZIP
    assert Address.parse("2 Wyckoff Avenue, Brooklyn, NY 11237, entrance at 408 Jefferson Street").street ==
             "2 Wyckoff Avenue"

    # parenthetical after a region with no ZIP
    assert Address.parse(
             "899-925 Flatbush Avenue, Brooklyn, NY (between Church and Snyder Avenues)"
           ) ==
             %{
               street: "899-925 Flatbush Avenue",
               locality: "Brooklyn",
               region: "NY",
               postal_code: nil,
               parsed?: true
             }

    # semicolon clause
    assert Address.parse(
             "223 North Burnham Highway, Lisbon, CT 06351; trailhead at 62 Kimball Road"
           ).street ==
             "223 North Burnham Highway"
  end

  test "the trailing-remark retry does not weaken the rules it recovers into" do
    # The retry re-runs the SAME anchored regex against the head, so a recovered
    # address is held to every rule a first-pass one is. Without this, the retry
    # would be a second, laxer parser sitting behind the first.

    # Still no street line without a house number.
    assert Address.parse("Bounded by Court and Smith Streets, Brooklyn, NY 11201 (see map)").street ==
             nil

    # Still rejects a leading ordinal as a street name rather than a number.
    assert Address.parse("18th Avenue between 55th and 58th, Brooklyn, NY 11204 (at the park)").street ==
             nil

    # Still drops an intermediate segment that repeats the locality.
    assert Address.parse("65 Water Street, Brooklyn Bridge Park, Brooklyn, NY 11201, pier 1").street ==
             "65 Water Street"
  end

  test "the retry never costs an address a postal code it already had" do
    # The tail must begin with "(", ";" or a comma-and-space. A looser rule that
    # allowed any whitespace would let "5 Route 44, Ashford, CT 06278" backtrack
    # into head "…, CT" with " 06278" discarded as tail — turning a complete
    # parse into a worse one. This address must be untouched by the retry, which
    # it never reaches, and must keep its ZIP.
    assert Address.parse("5 Route 44, Ashford, CT 06278") == %{
             street: "5 Route 44",
             locality: "Ashford",
             region: "CT",
             postal_code: "06278",
             parsed?: true
           }

    # And where a code sits in the discarded tail, scan_postal still finds it:
    # the caller scans the FULL original string, not the truncated head.
    assert Address.parse("10 Elm Street, Hartford, CT (mailing address 06103)").postal_code ==
             "06103"
  end

  test "a UK address decomposes, postcode last and alphanumeric" do
    # The UK shape defeats every earlier branch: one comma where @full needs
    # two, no two-letter region, no Italian province, and a postcode that is
    # alphanumeric — so scan_postal/1, which looks for five digits, found
    # nothing at all. Before this branch a London place published with NO
    # street AND NO postcode.
    assert Address.parse("10 Downing Street, London SW1A 2AA") == %{
             street: "10 Downing Street",
             locality: "London",
             region: nil,
             postal_code: "SW1A 2AA",
             parsed?: true
           }

    # The space is optional. "W1F7LW" is a real printed address, and the gov.uk
    # BS 7666 regex requires the space and so rejects it.
    assert Address.parse("16-18 Ramillies Street, London W1F7LW").postal_code == "W1F7LW"

    # region stays nil: a UK address carries no two-letter state, and inventing
    # one would put a false addressRegion in the structured data.
    assert Address.parse("Great Russell Street, London WC1B 3DG").region == nil
  end

  test "the UK locality is the last segment before the postcode, not the second" do
    # 44% of real London addresses carry one or more middle localities, and
    # they have the same comma count as an American address with a different
    # meaning in every field. Forest Hill is not the locality the postcode
    # belongs to.
    parsed = Address.parse("100 London Road, Forest Hill, London SE23 3PQ")

    assert parsed.street == "100 London Road"
    assert parsed.locality == "London"
    assert parsed.postal_code == "SE23 3PQ"

    assert Address.parse("Court Yard, Eltham, Greenwich, London, SE9 5NP").locality == "London"
  end

  test "a UK street line survives having no house number and no thoroughfare word" do
    # 62% of fifty real London addresses carry no house number, so the American
    # rule alone would suppress nearly two street lines in three. A positive
    # thoroughfare test is necessary but NOT sufficient: Bankside, Smithfield,
    # The Cut and Upper Ground are real street names with no thoroughfare word
    # either. What rescues them is the postcode — a strong signal that what
    # precedes it was written as an address rather than as a description.
    assert Address.parse("Bankside, London SE1 9DT").street == "Bankside"
    assert Address.parse("The Cut, London SE1 8LZ").street == "The Cut"

    # A building name with no number at all.
    assert Address.parse("Somerset House, Strand, London, WC2R 1LA").street == "Somerset House"

    # A number INSIDE the building name, which a bare ^\\d misses.
    assert Address.parse("No. 1 Warehouse, West India Quay, London E14 4AL").street ==
             "No. 1 Warehouse"

    # And with no postcode at all, the thoroughfare word carries it alone.
    assert Address.parse("Trafalgar Square, London").street == "Trafalgar Square"
  end

  test "a UK descriptive location yields no street even when a postcode follows" do
    # The property the American house-number rule buys, kept here. Without it,
    # the postcode clause above would accept any description that happens to
    # end in a valid postcode.
    parsed = Address.parse("Bounded by Park Lane and Oxford Street, London W1K 7TN")

    assert parsed.street == nil
    assert parsed.locality == "London"
    assert parsed.postal_code == "W1K 7TN"
  end

  test "an outward code recovers the street and is never published as a postcode" do
    # "London W12" names a postal DISTRICT, not a delivery point. Publishing it
    # as postalCode would be a half-right value, so this branch returns nil for
    # it and discards the code — but it still establishes that what precedes it
    # was written as an address, which is the clause that recovers the street.
    #
    # London wave 1 is why this exists. Ten of its 178 addresses carry an
    # outward code and no unit, and all ten lost their street line: the full
    # postcode pattern could not match, and @uk_no_postcode allows exactly two
    # segments where these have three. One of the ten opens with its own house
    # number, which is what showed the loss was a pattern that never reached
    # the judgement rather than a judgement about descriptiveness.
    assert Address.parse("81 Fulham Road, Chelsea, London SW3") == %{
             street: "81 Fulham Road",
             locality: "Chelsea",
             region: nil,
             postal_code: nil,
             parsed?: true
           }

    # The locality is still the LAST segment before the London tail.
    assert Address.parse("Scrubs Lane, White City, London W12").locality == "White City"

    # No house number and no thoroughfare word, recovered on the outward code
    # alone — the same third clause the full postcode buys for Bankside.
    assert Address.parse("Exmouth Market, Clerkenwell, London EC1R").street == "Exmouth Market"

    # The descriptive guard survives the weaker signal, as it must.
    assert Address.parse("Opposite the station, Forest Hill, London SE23").street == nil

    # And a full postcode still beats the outward branch to it, so nothing that
    # parsed before parses differently now.
    assert Address.parse("100 London Road, Forest Hill, London SE23 3PQ").postal_code ==
             "SE23 3PQ"
  end

  test "a postcode-less UK address is not limited to two segments" do
    # This form allowed TWO SEGMENTS ONLY until London wave 2, on the reasoning
    # that more than that with no postcode is indistinguishable from a
    # description. That was wrong about which guard does the work: what keeps a
    # description out is `uk_street_or_nil/2` being called with `postcode?`
    # false, which demands a house number or a thoroughfare type. The comma
    # count was suppressing real streets while the real guard ran regardless.
    assert Address.parse("Crown Street, Dagenham, London") == %{
             street: "Crown Street",
             locality: "Dagenham",
             region: nil,
             postal_code: nil,
             parsed?: true
           }

    # The middle is the locality and London is the city, exactly as in the
    # postcode forms. With no middle there is nothing else London could be.
    assert Address.parse("Trafalgar Square, London").locality == "London"

    # The guard the comma count was mistaken for. No number, no thoroughfare
    # type, no postcode of any kind: no street line.
    assert Address.parse("Kensington Gore, London").street == nil

    # A directional suffix is part of the street's own name, so the thoroughfare
    # type stays anchored at the end and takes one optional word after it.
    assert Address.parse("Whalebone Lane North, Chadwell Heath, London").street ==
             "Whalebone Lane North"

    # "circus" was on the list and "circle" was not, which was an accident of
    # which address landed first. Regent's Park has both ring roads.
    assert Address.parse("Outer Circle, The Regent's Park, London").street == "Outer Circle"

    # The descriptive guard still runs first, and it must: this form has the
    # weakest signal of the three and would otherwise be the easiest to fool.
    assert Address.parse("Opposite the abbey, Barking, London").street == nil
  end

  test "the UK branch cannot alter an address the earlier passes already parse" do
    # Ordering held as a property rather than as a comment. @uk is consulted
    # only after both American passes, the Italian one and the Vatican one have
    # failed, so it can turn a nil into a value and never one value into
    # another.
    assert Address.parse("9 Main Street North, Bethlehem, CT 06751") == %{
             street: "9 Main Street North",
             locality: "Bethlehem",
             region: "CT",
             postal_code: "06751",
             parsed?: true
           }

    assert Address.parse("Piazza del Campidoglio, 00186 Roma RM") == %{
             street: "Piazza del Campidoglio",
             locality: "Roma",
             region: "RM",
             postal_code: "00186",
             parsed?: true
           }

    assert Address.parse("Piazza San Pietro, 00120 Citta del Vaticano").street ==
             "Piazza San Pietro"
  end

  test "every address in the corpus either decomposes or falls back cleanly" do
    addresses =
      Ethos.SeedDataHelpers.all_seed_files()
      |> Enum.flat_map(fn file ->
        file |> File.read!() |> Jason.decode!() |> Map.get("places", [])
      end)
      |> Enum.map(& &1["address"])
      |> Enum.reject(&is_nil/1)

    parsed = Enum.map(addresses, &Address.parse/1)

    # No emitted street line may have re-absorbed the locality that is emitted
    # beside it — this is the bug the whole task exists to fix.
    #
    # Applied to every comma segment *after the first*, rather than to the whole
    # street. A plain whole-string String.contains?/2 convicts 51 correct parses:
    # roads named after their own town ("145 Brooklyn Avenue, Brooklyn, NY",
    # "279 Avon Mountain Road, Avon, CT"), where the town name is part of the
    # street's actual name. That exception only ever applies to the leading
    # segment, which is where a street name lives — so every later segment is
    # held to the strict substring rule, which is what catches a park or
    # building name dragging the locality back in ("65 Water Street, Brooklyn
    # Bridge Park, Brooklyn, NY").
    for {p, original} <- Enum.zip(parsed, addresses), p.street && p.locality do
      [_street_name | qualifiers] = String.split(p.street, ",")

      for segment <- qualifiers do
        refute String.contains?(segment, p.locality),
               "streetAddress still carries its own locality: #{inspect(original)} " <>
                 "-> #{inspect(p.street)}"
      end
    end

    # A street line is never returned without a house number — in the AMERICAN
    # corpus. This assertion was unqualified until Rome landed, and it was
    # correct for as long as every address was American: the leading house
    # number is what separates "126 Brightwater Court" from "Bounded by
    # Lafayette Avenue and Greene Avenue".
    #
    # Italian addresses put the number last and often carry none at all — the
    # Pantheon's postal address is "Piazza della Rotonda, 00186 Roma RM" — so
    # the invariant is scoped by region rather than relaxed. Rome gets its own
    # discipline below, which is the thoroughfare-type test the parser applies.
    #
    # THREE BUCKETS, NOT TWO, AND THE SPLIT IS ON THE RAW ADDRESS RATHER THAN
    # THE PARSE. It was two, split on `region in @italian_provinces or
    # is_nil(region)`, and that comment said "a nil region joins the Italian
    # side" — true while the Vatican's province-less addresses were the only
    # nil-region parses there were. The UK branch sets region to nil too,
    # because England is not a province of anywhere, so the first London wave
    # sent 178 British addresses into the Italian bucket and "Great Russell
    # Street" was convicted of naming no Italian thoroughfare type. It does
    # not, and it should never have been asked.
    #
    # Splitting on the raw string rather than the parse is what keeps the three
    # buckets from depending on the very fields under test.
    # Three British forms, matching the three the parser recognises: a full
    # postcode, a bare "…, London", and a London outward code with no unit.
    uk_postcode =
      ~r/(?:GIR ?0AA|(?:[A-PR-UWYZ][0-9]{1,2}|[A-PR-UWYZ][A-HK-Y][0-9]{1,2}|[A-PR-UWYZ][0-9][A-HJKPSTUW]|[A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]) ?[0-9][ABD-HJLNP-UW-Z]{2})\s*$/

    uk_tail =
      ~r/,\s*(?:City of )?London(?:\s+(?:[A-PR-UWYZ][0-9]{1,2}|[A-PR-UWYZ][A-HK-Y][0-9]{1,2}|[A-PR-UWYZ][0-9][A-HJKPSTUW]|[A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]))?\s*$/i

    {uk, rest} =
      Enum.split_with(Enum.zip(addresses, parsed), fn {raw, _p} ->
        Regex.match?(uk_postcode, raw) or Regex.match?(uk_tail, raw)
      end)

    {italian, american} =
      Enum.split_with(rest, fn {_raw, p} ->
        p.region in @italian_provinces or is_nil(p.region)
      end)

    for {_raw, p} <- american, p.street do
      assert Regex.match?(~r/^\d/, p.street),
             "American street line without a house number: #{inspect(p.street)}"

      refute Regex.match?(~r/^\d+(?:st|nd|rd|th)\b/i, p.street)
    end

    # The Italian counterpart: every street line names a thoroughfare type. This
    # is what stops a descriptive location publishing as a street once the
    # house-number rule no longer applies.
    for {_raw, p} <- italian, p.street do
      assert Regex.match?(
               ~r/^(?:via|viale|vicolo|vico|piazza|piazzale|piazzetta|largo|corso|borgo|lungotevere|salita|clivo|circonvallazione|ponte|passeggiata|galleria|portico|strada|foro|campo|arco|scalinata|molo|monte|lungomare|quadrato|parco)\b/i,
               p.street
             ),
             "Italian street line naming no thoroughfare type: #{inspect(p.street)}"
    end

    # The British counterpart, and it cannot be either of the other two. 62% of
    # real London addresses carry no house number, so the American rule would
    # suppress the street line on nearly two in three; and Bankside, Smithfield,
    # The Cut and Upper Ground are real street names carrying no thoroughfare
    # word, so an Italian-style positive test would reject them.
    #
    # What is asserted instead is the guard that actually matters: a British
    # street line is never a DESCRIPTIVE location. That is the same judgement
    # the American house-number rule makes about "Bounded by Lafayette Avenue
    # and Greene Avenue", stated in the one form all three corpora share.
    assert uk != [], "no British address reached the parser — this scope guard is vacuous"

    for {raw, p} <- uk, p.street do
      refute Regex.match?(
               ~r/\b(?:bounded by|between|corner of|junction of|opposite)\b/i,
               p.street
             ),
             "British street line publishing a descriptive location: #{inspect(p.street)} " <>
               "(from #{inspect(raw)})"
    end

    # The greedy street capture also admits non-locality prose — "25 Fourth
    # Avenue, near Pacific Street", "990 Washington Avenue, also addressed as
    # 455 Flatbush Avenue". That is accepted for now, because legitimate unit
    # designators ("Suite 7", "Unit B") take the same comma-separated shape and
    # schema.org wants them kept. Pinned so the population cannot grow silently.
    # Pinned per region, because the two populations are different things.
    #
    # The American comma is a QUALIFIER the greedy capture swept in — "Suite 7",
    # "Building B", "near Pacific Street" — and the pin exists so that
    # population cannot grow silently. It stays at 48.
    #
    # The Italian comma is part of the address. "Via di Sant'Apollinare, 46"
    # is standard Italian postal form, with the comma before the house number
    # rather than after a qualifier, and the street line is correct as parsed.
    # Wave 4 brought 18 of them and would have pushed the shared pin to 66,
    # which would have meant either raising a guard that was doing its job or
    # rewriting correct addresses. Neither; they are counted separately and
    # held to their own shape.
    # A nil region joins the Italian side. Vatican addresses have no province
    # because a sovereign state has no Italian one, and without this they fell
    # into the American branch and failed its house-number rule on "Piazza San
    # Pietro". Every American parse that yields a street also yields a region,
    # so nothing American is lost here.
    {italian, american} =
      Enum.split_with(parsed, &(&1.region in @italian_provinces or is_nil(&1.region)))

    comma_streets =
      Enum.count(american, fn p -> p.street && String.contains?(p.street, ",") end)

    # 49 after San Francisco wave 1. The one addition is
    # "2 Marina Blvd, Landmark Building C, Suite 260" — a genuine unit
    # designator, which is the case this pin's own note says schema.org wants
    # kept, rather than the non-locality prose it exists to catch.
    # 50 after San Francisco wave 2. Both additions are unit designators, which
    # is the case this pin's own note says schema.org wants kept rather than the
    # non-locality prose it exists to catch: "2 Marina Blvd, Landmark Building
    # C, Suite 260" and "2325 Third Street, Floor 4R".
    # 51 after Korean BBQ wave 1. The addition is Daebak Korean BBQ
    # (daebak-korean-bbq-chicago-chinatown), whose raw address "2017 S Wells
    # St, Fl 2, Chicago, IL 60616" parses to the street line "2017 S Wells St,
    # Fl 2". "Fl 2" is a floor designator — the same class as "Suite 260" and
    # "Floor 4R" above, which this pin's own note already names as the
    # acceptable case schema.org wants kept — rather than the non-locality
    # prose ("near Pacific Street", "also addressed as 455 Flatbush Avenue")
    # the pin exists to catch. The ratchet moves to 51 legitimately.
    #
    # 57 after the Korean BBQ guides that reach Manhattan, Queens, Brooklyn,
    # San Francisco and London. Six additions, not five: five are plain floor
    # designators, the same acceptable class as "Suite 260", "Floor 4R" and
    # "Fl 2" above —
    #
    #   * "22 W 32nd St, 2nd Floor" (jongro-bbq-koreatown)
    #   * "39 W 32nd St, 1st Floor" (jongro-bbq-market-koreatown)
    #   * "315 5th Ave, 3rd Floor" (nubiani-koreatown)
    #   * "312 5th Ave, 2nd Floor" (gopchang-story-koreatown)
    #   * "1640 Post Street, 2nd Floor" (yakiniq-japantown)
    #
    # — upper-floor dining rooms being a real characteristic of West 32nd
    # Street's Koreatown restaurants. The sixth is Gaonnuri
    # (gaonnuri-koreatown, in priv/seed_data/manhattan/koreatown.json), whose
    # raw address used to read "1250 Broadway, 39th Floor (entrance on W 32nd
    # St), New York, NY 10001" — a floor designator followed by genuine
    # non-locality PROSE, exactly what this pin exists to catch, riding along
    # inside the same comma-qualified street line. That address was rewritten
    # to "1250 Broadway, 39th Floor, New York, NY 10001", and the entrance
    # fact was kept — it was already stated as a sentence in the place's
    # summary ("with its entrance on West 32nd Street") — rather than lost.
    # Gaonnuri's street line still carries a comma after the fix, because
    # "39th Floor" is itself a floor designator of the same acceptable class
    # as the other five; what changed is that the comma-qualified portion is
    # now only that designator, with the prose gone. So the count does not
    # drop back to 51 with the prose removed — it was never the prose alone
    # that put Gaonnuri here — and the ratchet moves to 57, five new floor
    # designators plus Gaonnuri's own, all six legitimate.
    #
    # 58 after steakhouse content wave 1's fix round. The one addition is
    # PRIME Mēt Steakhouse (prime-met-steakhouse-flushing, in
    # priv/seed_data/steakhouse/queens.json), whose address is
    # "133-36 37th Ave, 12th Floor, Flushing, NY 11354" and whose street line
    # therefore parses to "133-36 37th Ave, 12th Floor". "12th Floor" is a
    # floor designator, the same acceptable class as "1250 Broadway, 39th
    # Floor" and "2017 S Wells St, Fl 2" above — fourteen of the standing 57
    # are exactly that — rather than the non-locality prose this pin exists to
    # catch. The room is on the twelfth floor of the Renaissance New York
    # Flushing Hotel at Tangram and the operator publishes the floor as part
    # of the address.
    #
    # It moves the pin because the content wave originally DROPPED the floor
    # from the address to hold this number at 57, which is shaping content to
    # fit a test rather than the other way round. The floor is back and the
    # ratchet moves, deliberately.
    # 63 after steakhouse content wave 2. Five additions, all of the same floor
    # or suite class the fourteen standing designators belong to, and all five
    # printed that way by the operator itself:
    #
    #   * the-vault-steakhouse-san-francisco — "555 California St, Concourse
    #     Level". The dining room is the building's original bank vault on the
    #     concourse level, and the operator prints the level as part of the
    #     address.
    #   * niku-x-downtown-los-angeles — "900 Wilshire Blvd, 2nd Floor". The room
    #     is the second floor of the Wilshire Grand Center.
    #   * matu-beverly-hills — "239 S Beverly Dr, Suite 100".
    #   * fogo-de-chao-san-francisco — "201 Third St, Suite 100".
    #   * fogo-de-chao-seattle — "400 University St, Suite 100".
    #
    # None is the non-locality prose this pin exists to catch. The ratchet moves
    # rather than the addresses, for the same reason wave 1's fix round moved it
    # to 58: dropping a floor designator to hold a number is shaping content to
    # fit a test.
    # 65 after steakhouse content wave 3 landed
    # priv/seed_data/steakhouse/{boston,london,miami,washington-dc}.json. Exactly
    # two of the wave's sixty-nine places carry a comma inside the street line,
    # and both are suite designators of the same acceptable class as the
    # fourteen standing ones, printed that way by the operator itself:
    #
    #   * del-friscos-double-eagle-boston — "250 Northern Ave, Suite 200". The
    #     room is the second floor above the harbor and the operator's own
    #     restaurant page prints the suite.
    #   * flemings-prime-steakhouse-brickell — "600 Brickell Ave, Suite 150",
    #     as the Greater Miami visitors bureau's own listing gives it.
    #
    # London's twenty-eight rooms move this pin not at all: the pin counts
    # American street lines only, and none of the twenty-eight is American.
    # Neither addition is the non-locality prose this pin exists to catch, so
    # the ratchet moves rather than the addresses — the same call waves 1 and 2
    # made, and for the same reason.
    # 66 after ski content wave 1 landed
    # priv/seed_data/ski/{ascutney-outdoors,bolton-valley-resort,
    # bromley-mountain-resort,burke-mountain-resort,cochrans-ski-area,hardack,
    # harrington-hill,jay-peak-resort,killington-ski-resort,
    # living-memorial-park,lyndon-outing-club,mad-river-glen}.json, 36 places.
    # The one addition is the Inn at Long Trail
    # (inn-at-long-trail, priv/seed_data/ski/killington-ski-resort.json),
    # whose sourced address, "709 Route 4, Sherburne Pass, Killington, VT
    # 05751", parses to the street line "709 Route 4, Sherburne Pass".
    # Sherburne Pass is not a floor or suite designator but the same
    # acceptable class by the pin's own standard: a real sub-locality the inn
    # itself prints as part of its mailing address on its own website, not a
    # directional aside like "near Pacific Street" invented by a finder. The
    # ratchet moves rather than the address, for the same reason it always
    # has — the fact belongs in the street line because the operator put it
    # there.
    # 67 after ski content wave 3 landed
    # priv/seed_data/ski/{abenaki-ski-area,attitash-mountain-resort,
    # black-mountain,bretton-woods,cannon-mountain,cranmore-mountain-resort,
    # crotched-mountain-ski-and-ride,dartmouth-skiway,granite-gorge-ski-area,
    # gunstock-mountain-resort,king-pine-ski-area}.json, 11 areas. The one
    # addition is King Pine Ski Area (king-pine-ski-area,
    # priv/seed_data/ski/king-pine-ski-area.json), whose sourced address,
    # "1251 Eaton Road, Route 153, Madison, NH 03849" (per King Pine's own
    # website), parses to the street line "1251 Eaton Road, Route 153."
    # "Route 153" is not a floor or suite designator but the same acceptable
    # class by the pin's own standard: a real route number the operator
    # itself prints as part of its mailing address, not a directional aside
    # invented by a finder. The ratchet moves rather than the address, for
    # the same reason it always has.
    # 69 after ski content wave 4 landed
    # priv/seed_data/ski/{loon-mountain-resort,mcintyre-ski-area,
    # mount-eustis-ski-hill,mount-sunapee-resort,pats-peak,
    # ragged-mountain-resort,storrs-hill-ski-area,tenney-mountain,
    # waterville-valley-resort,whaleback-mountain,wildcat-mountain}.json, 47
    # places (New Hampshire complete). Two of the wave's places carry a
    # comma inside the street line, both the same acceptable class as the
    # standing ones — a real sub-locality or unit designator the operator
    # itself prints as part of its mailing address, not a directional aside
    # invented by a finder:
    #
    #   * chutters-lincoln (priv/seed_data/ski/loon-mountain-resort.json) —
    #     "264 Main St, Depot Plaza, Lincoln, NH 03251," per Chutters' own
    #     website, parses to the street line "264 Main St, Depot Plaza."
    #     Depot Plaza is a real shopping plaza in Lincoln, the same class as
    #     Sherburne Pass and Route 153 above.
    #   * great-north-aleworks (priv/seed_data/ski/mcintyre-ski-area.json) —
    #     "1050 Holt Ave, Unit #14, Manchester, NH 03109," per the brewery's
    #     own Story & Mission page, parses to the street line "1050 Holt
    #     Ave, Unit #14" — an ordinary suite designator, the same class as
    #     del-friscos-double-eagle-boston and flemings-prime-steakhouse-
    #     brickell above.
    #
    # Re-measured after ski content wave 5 landed
    # priv/seed_data/ski/{baker-mountain,big-moose-mountain,big-rock,
    # black-mountain-of-maine,camden-snow-bowl,hermon-mountain,
    # lonesome-pine-trails,lost-valley,millinocket-ski-slope,mount-abram,
    # mount-jefferson-ski-area,pinnacle-ski-club}.json (Maine rows 1-12). One
    # of the wave's 45 places carries a comma inside its street line:
    # antique-snowmobile-museum (priv/seed_data/ski/millinocket-ski-slope.json)
    # — "10 Northern Cruise Trail, Lake Road, Millinocket, ME 04462," per the
    # museum's own site, parses to the street line "10 Northern Cruise Trail,
    # Lake Road" — a real secondary road descriptor as sourced, the same
    # class as Sherburne Pass and Route 153 above.
    #
    # The ratchet moves rather than the addresses, for the same reason it
    # always has.
    assert comma_streets <= 70,
           "#{comma_streets} American street lines carry a comma qualifier, up from 70"

    for p <- italian, p.street, String.contains?(p.street, ",") do
      # A civico may be a range ("5-7") or carry a letter or a slashed suffix
      # ("14/C"), all of which are ordinary Italian house numbers.
      assert Regex.match?(~r/,\s*\d+[A-Za-z]?(?:\s*[-–\/]\s*[A-Za-z0-9]+)?$/, p.street),
             "Italian street line carries a comma that is not a house-number " <>
               "separator: #{inspect(p.street)} — that is a qualifier or prose, " <>
               "which is what the American pin exists to catch"
    end

    parsed_count = Enum.count(parsed, & &1.parsed?)
    street_count = Enum.count(parsed, & &1.street)

    # Recorded so a regression is visible as a number, not a vibe. Update these
    # deliberately when the corpus grows; never to make a failing test pass.
    # Measured 2026-08-29: 2066 addresses, 1935 parsed, 1532 with a street line.
    assert parsed_count > 1900,
           "only #{parsed_count} of #{length(addresses)} addresses decomposed"

    assert street_count > 1500, "only #{street_count} addresses yielded a street line"
  end

  test "an Italian address decomposes, house number trailing and CAP leading" do
    # The Italian shape inverts the American one on both axes this module cares
    # about: the house number follows the street name rather than preceding it,
    # and the postal code precedes the locality rather than following the
    # region. There is also one comma, not two, which is why @full and @head —
    # both of which require two — matched none of Rome's addresses at all.
    assert Address.parse("Borgo Santo Spirito 78, 00193 Roma RM") == %{
             street: "Borgo Santo Spirito 78",
             locality: "Roma",
             region: "RM",
             postal_code: "00193",
             parsed?: true
           }

    # The CAP is optional; the two-letter province is not. Requiring it is what
    # keeps this branch from matching loose prose that happens to hold a comma.
    assert Address.parse("Lungotevere Castello 50, Roma RM") == %{
             street: "Lungotevere Castello 50",
             locality: "Roma",
             region: "RM",
             postal_code: nil,
             parsed?: true
           }

    # A compound house number survives intact.
    assert Address.parse("Via della Conciliazione 14/C, 00193 Roma RM").street ==
             "Via della Conciliazione 14/C"
  end

  test "an Italian address with no house number still yields a street" do
    # This is the case the American house-number rule would reject outright, and
    # rejecting it here would be wrong: a great many Roman postal addresses name
    # only the square. The Pantheon's is one, and Trajan's Column's names a foro.
    assert Address.parse("Piazza del Campidoglio, 00186 Roma RM").street ==
             "Piazza del Campidoglio"

    assert Address.parse("Foro Traiano, 00187 Roma RM").street == "Foro Traiano"
  end

  test "an Italian descriptive location yields no street" do
    # The property the house-number rule buys in the US corpus, bought here by a
    # positive test on the thoroughfare type instead. Without it, every
    # descriptive string ending in a province code would publish as a street.
    parsed = Address.parse("Delimitato da via dei Fori Imperiali e via Cavour, 00184 Roma RM")

    assert parsed.street == nil
    assert parsed.locality == "Roma"
    assert parsed.postal_code == "00184"
  end

  test "the Italian branch cannot alter an address the American passes already parse" do
    # Ordering, held as a property rather than as a comment. @italian is
    # consulted only after @full and the trailing-remark retry have both failed,
    # so it can turn a nil into a value and never one value into another.
    for address <- [
          "9 Main Street North, Bethlehem, CT 06751",
          "5 Route 44, Ashford, CT 06278",
          "126 Brightwater Court, Brooklyn, NY 11235 (Brighton 2nd Street entrance)",
          "65 Water Street, Brooklyn Bridge Park, Brooklyn, NY 11201"
        ] do
      parsed = Address.parse(address)

      assert parsed.parsed?, "#{address} stopped parsing"

      assert parsed.region in ~w(CT NY),
             "#{address} came back with region #{inspect(parsed.region)} — the Italian branch " <>
               "captured an American address"
    end
  end
end
