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
    assert Address.parse("899-925 Flatbush Avenue, Brooklyn, NY (between Church and Snyder Avenues)") ==
             %{
               street: "899-925 Flatbush Avenue",
               locality: "Brooklyn",
               region: "NY",
               postal_code: nil,
               parsed?: true
             }

    # semicolon clause
    assert Address.parse("223 North Burnham Highway, Lisbon, CT 06351; trailhead at 62 Kimball Road").street ==
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
    {italian, american} = Enum.split_with(parsed, &(&1.region in @italian_provinces))

    for p <- american, p.street do
      assert Regex.match?(~r/^\d/, p.street),
             "American street line without a house number: #{inspect(p.street)}"

      refute Regex.match?(~r/^\d+(?:st|nd|rd|th)\b/i, p.street)
    end

    # The Italian counterpart: every street line names a thoroughfare type. This
    # is what stops a descriptive location publishing as a street once the
    # house-number rule no longer applies.
    for p <- italian, p.street do
      assert Regex.match?(
               ~r/^(?:via|viale|vicolo|piazza|piazzale|largo|corso|borgo|lungotevere|salita|clivo|circonvallazione|ponte|passeggiata|galleria|portico|strada|foro|campo|arco|scalinata|molo)\b/i,
               p.street
             ),
             "Italian street line naming no thoroughfare type: #{inspect(p.street)}"
    end

    # The greedy street capture also admits non-locality prose — "25 Fourth
    # Avenue, near Pacific Street", "990 Washington Avenue, also addressed as
    # 455 Flatbush Avenue". That is accepted for now, because legitimate unit
    # designators ("Suite 7", "Unit B") take the same comma-separated shape and
    # schema.org wants them kept. Pinned so the population cannot grow silently.
    comma_streets = Enum.count(parsed, fn p -> p.street && String.contains?(p.street, ",") end)

    assert comma_streets <= 48,
           "#{comma_streets} street lines carry a comma qualifier, up from 48"

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
