defmodule Ethos.Places.Address do
  @moduledoc """
  Decomposes `Place.address` — one free-text string — into PostalAddress parts.

  `street` is returned only when the street segment begins with a house number.
  Roughly 394 places (overwhelmingly parks) store a descriptive location rather
  than a postal address: "Bounded by Lafayette Avenue, Tompkins Avenue, Greene
  Avenue and Marcy Avenue". Each is a true statement of where the place is and
  a false `streetAddress`, so those emit locality, region and postal code and
  omit the street line.
  """

  @full ~r/^(?<street>.+),\s*(?<locality>[^,]+),\s*(?<region>[A-Z]{2})(?:\s+(?<postal>\d{5})(?:-\d{4})?)?\s*$/
  @postal ~r/\b(\d{5})(?:-\d{4})?\b/
  @house_number ~r/^\d/

  # `@full` is anchored, so an otherwise perfect address followed by ANY trailing
  # remark fails outright — every field comes back nil and only the postal code
  # is scanned back out. An audit of the corpus found 133 addresses in that
  # state, 38 of which begin with a genuine house number and were therefore
  # publishing no `streetAddress` at all:
  #
  #     "126 Brightwater Court, Brooklyn, NY 11235 (Brighton 2nd Street ...)"
  #     "2 Wyckoff Avenue, Brooklyn, NY 11237, entrance at 408 Jefferson Street"
  #     "899-925 Flatbush Avenue, Brooklyn, NY (between Church and Snyder Avenues)"
  #     "625 Jamaica Avenue, Brooklyn, NY, with two additional parcels ..."
  #
  # This captures the address HEAD — everything up to and including the region
  # and its optional ZIP — when what follows is a parenthetical, a semicolon
  # clause, or a comma-led clause. The remainder is discarded rather than
  # published: it is real information, but it belongs in the page's prose, and
  # emitting it inside a PostalAddress is the defect this module exists to stop.
  #
  # Three deliberate properties:
  #
  #   * The street part is LAZY here, unlike `@full`'s greedy capture, so the
  #     head ends at the FIRST complete address rather than the last. On the
  #     recovery path that is the conservative choice — a string holding two
  #     addresses truncates to the first one instead of silently publishing the
  #     second.
  #   * The tail must begin with `(`, `;`, or a comma followed by whitespace.
  #     A bare `\s` would let "5 Route 44, Ashford, CT 06278" backtrack into
  #     head "…, CT" with " 06278" as tail, throwing away a postal code it had.
  #   * It is only ever consulted AFTER `@full` fails. Anything that parses
  #     today parses identically tomorrow; this can only turn a nil into a
  #     value, never change one value into another.
  @head ~r/^(?<head>.+?,\s*[^,]+,\s*[A-Z]{2}(?:\s+\d{5}(?:-\d{4})?)?)\s*(?:[(;]|,\s).*$/s

  @house_number ~r/^\d/

  # A leading ordinal is a street *name*, not a house number: "18th Avenue
  # between 55th and 58th Streets" and "86th Street and 7th Avenue" begin with
  # a digit but carry no building number, so they are descriptive locations of
  # exactly the kind the house-number rule exists to reject. A genuine house
  # number on an ordinal street ("1523 18th Avenue") is unaffected, because the
  # suffix must follow the leading digits immediately.
  @ordinal_street ~r/^\d+(?:st|nd|rd|th)\b/i

  # Italian addresses invert the US shape: the house number TRAILS the street
  # name, the postal code PRECEDES the locality, and there is one comma rather
  # than two.
  #
  #     "Borgo Santo Spirito 78, 00193 Roma RM"
  #     "Piazza del Campidoglio, 00186 Roma RM"      (no house number)
  #     "Lungotevere Castello 50, Roma RM"           (no CAP)
  #     "Via della Conciliazione 14/C, 00193 Roma RM"
  #
  # Every one of them failed `@full` and `@head`, which both require two commas,
  # so before this branch existed all 122 addressed Roman places published no
  # `streetAddress` at all. Forty-four still got a postal code, because
  # `scan_postal/1` finds any five-digit run and an Italian CAP is five digits —
  # which is why the gap showed up as a missing street rather than as nothing.
  #
  # The CAP is optional and the province is required: "Roma RM" is what every
  # address in the corpus ends with, and requiring the two-letter province is
  # what keeps this from matching loose text.
  @italian ~r/^(?<street>.+),\s*(?:(?<postal>\d{5})\s+)?(?<locality>[^,\d]+?)\s+(?<region>[A-Z]{2})\s*$/

  # The Italian counterpart to `@house_number`, and it exists for the same
  # reason: to distinguish a postal address from a description of where
  # something is. It cannot be a house-number test, because a Roman address
  # legitimately carries none — the Pantheon's is "Piazza della Rotonda, 00186
  # Roma RM", where the square itself is the thoroughfare.
  #
  # So this is a positive test on the thoroughfare type instead. "Bounded by
  # via A and via B" does not begin with one and is rejected, which is the
  # property the house-number rule buys in the US corpus.
  # `foro` and `campo` are here because Rome uses both as thoroughfare names in
  # postal addresses — "Foro Traiano, 00187 Roma RM" is Trajan's Column's
  # address, and Campo de' Fiori is a street as well as a square. An earlier
  # version of this list omitted both; Foro Traiano was the single Roman address
  # in wave 1 that still published no street.
  # `lungomare`, `quadrato` and `parco` were added after wave 5, from Ostia's
  # seafront roads (Lungomare Duca degli Abruzzi), EUR's grid (Quadrato della
  # Concordia) and Villa Borghese (Parco dei Daini). Each is the ordinary
  # street-name form in the zone that brought it.
  #
  # `piazzetta`, `vico` and `monte` were added after wave 4, which brought the
  # first addresses using them: Piazzetta di San Simeone, Vico Jugario, Monte
  # de' Cenci. All three are ordinary Roman thoroughfare names — `vico` is a
  # variant of `vicolo`, and `monte` names a street here rather than a hill.
  @italian_thoroughfare ~r/^(?:via|viale|vicolo|vico|piazza|piazzale|piazzetta|largo|corso|borgo|lungotevere|salita|clivo|circonvallazione|ponte|passeggiata|galleria|portico|strada|foro|campo|arco|scalinata|molo|monte|lungomare|quadrato|parco)\b/i

  # Vatican City addresses carry no province code — "Piazza San Pietro, 00120
  # Citta del Vaticano" — so `@italian`, which requires a two-letter province,
  # matched none of them and St Peter's published no street line at all.
  #
  # Held as its own pattern rather than by making the province optional in
  # `@italian`: optional there would let "Lungotevere Castello 50, Roma RM"
  # backtrack into a worse parse, and this way the Vatican form has to be
  # recognised deliberately rather than fallen into. It captures no region,
  # because a sovereign state has no Italian province.
  @vatican ~r/^(?<street>.+),\s*(?<postal>\d{5})\s+(?<locality>Citt[a\x{00E0}]\s+del\s+Vaticano)\s*$/iu

  # UK addresses defeat every branch above. They carry ONE comma where `@full`
  # needs two, no two-letter region, no Italian province, and a postcode that is
  # alphanumeric — so `scan_postal/1`, which looks for five digits, finds
  # nothing at all in "SW1A 2AA". Before this branch a London place published
  # with NO street AND NO postcode, which is worse than Rome's starting state,
  # where the digit scan at least recovered 44 CAPs.
  #
  # The pattern was verified by the 2026-09-04 scoping wave against 100 real
  # postcodes from postcodes.io and all 50 London district codes: zero
  # rejections, and zero false positives across the 4,204 addresses already in
  # the corpus. Note the two interior letter classes differ and MUST NOT be
  # merged — merging them rejects EC3N 4AB, WC2R 1LA, WC1X 0DA and EC2Y 8DS,
  # all real. The space is optional because "W1F7LW" is a real printed address;
  # the gov.uk BS 7666 regex requires the space and so rejects it.
  # Held as a STRING so the branch regex below can interpolate it. One
  # definition, so the two cannot drift.
  @uk_postcode "(?:GIR ?0AA|(?:[A-PR-UWYZ][0-9]{1,2}|[A-PR-UWYZ][A-HK-Y][0-9]{1,2}|[A-PR-UWYZ][0-9][A-HJKPSTUW]|[A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]) ?[0-9][ABD-HJLNP-UW-Z]{2})"

  # Everything before the postcode, and the postcode. The head is split on
  # commas afterwards rather than in the regex, because 44% of real London
  # addresses carry a middle locality — "100 London Road, Forest Hill, London
  # SE23 3PQ" has an American comma count and a different meaning in every
  # field — and the count of those middles varies from zero to three.
  @uk ~r/^(?<head>.+?)[,\s]+(?<postal>#{@uk_postcode})\s*$/

  # A postcode-less UK address still yields a locality: "Trafalgar Square,
  # London". Two segments only — more than that with no postcode is not
  # distinguishable from a descriptive location, and is left alone.
  @uk_no_postcode ~r/^(?<street>[^,]+),\s*(?<locality>London|City of London)\s*$/i

  # AN OUTWARD CODE IS NOT A POSTCODE. "London W12" and "London SE23" name a
  # postal district rather than a delivery point, so the outward code must
  # NEVER be emitted as postalCode — this branch deliberately returns nil for
  # it, and the outward code is discarded rather than published half-right.
  #
  # But it is exactly as strong a signal as the full postcode that what
  # precedes it was WRITTEN AS AN ADDRESS, which is the third clause
  # `uk_street_or_nil/2` turns on. Without this branch the first London wave
  # lost the street line on ten rows including "81 Fulham Road, Chelsea, London
  # SW3" — an address that opens with its own house number, so the loss was not
  # a judgement about descriptiveness but a pattern that simply did not reach
  # it. The head is split on commas afterwards for the same reason `@uk` splits
  # its own: "Scrubs Lane, White City, London W12" carries a middle locality.
  @uk_outward ~r/^(?<head>.+?),\s*(?:City of )?London\s+(?:[A-PR-UWYZ][0-9]{1,2}|[A-PR-UWYZ][A-HK-Y][0-9]{1,2}|[A-PR-UWYZ][0-9][A-HJKPSTUW]|[A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY])\s*$/

  # The British counterpart to `@house_number` and `@italian_thoroughfare`, and
  # it needs BOTH of theirs plus a third clause.
  #
  # 62% of fifty real London addresses carry no house number, so the American
  # rule alone would suppress the street line on nearly two in three. A
  # positive thoroughfare test is therefore necessary — but it is NOT
  # sufficient, because Bankside, Smithfield, The Cut and Upper Ground are real
  # street names carrying no thoroughfare word either.
  #
  # So the third clause: a segment IMMEDIATELY FOLLOWED BY A VALID POSTCODE is
  # an address line. A postcode is a strong signal that what precedes it was
  # written as an address rather than as a description of where something is.
  @uk_thoroughfare ~r/^(?:.*\b(?:street|st|road|rd|lane|ln|place|pl|square|sq|gardens|gdns|terrace|crescent|mews|row|hill|walk|way|close|court|avenue|ave|embankment|bridge|wharf|yard|parade|rise|vale|grove|park|quay|passage|steps|strand|circus|broadway|green|common|fields|market|arcade|approach|drive)\b)$/i

  # "No. 1 Warehouse, West India Quay" puts the number INSIDE the building
  # name, so a bare `^\d` misses it though a digit is plainly there.
  @uk_house_number ~r/^(?:No\.?\s*)?\d/i

  # Even with a postcode present, these are descriptions rather than addresses,
  # and the same judgement the American house-number rule makes about "Bounded
  # by Lafayette Avenue and Greene Avenue" applies here.
  @uk_descriptive ~r/\b(?:bounded by|between|corner of|junction of|opposite)\b/i

  @empty %{street: nil, locality: nil, region: nil, postal_code: nil, parsed?: false}

  @typedoc "Every key is always present; any of the four strings may be nil."
  @type t :: %{
          street: String.t() | nil,
          locality: String.t() | nil,
          region: String.t() | nil,
          postal_code: String.t() | nil,
          parsed?: boolean()
        }

  @doc """
  Decomposes a free-text address into its PostalAddress parts.

  Always returns all five keys, so callers may read them unguarded. `parsed?`
  reports whether the address matched the street/locality/region shape; when it
  did not, every field is nil except `postal_code`, which is still scanned out
  of the raw text if a five-digit code appears anywhere in it.

  `street` is non-nil only when the street segment begins with a house number,
  and never carries the locality that is returned beside it.

      iex> Ethos.Places.Address.parse("9 Main Street North, Bethlehem, CT 06751")
      %{
        street: "9 Main Street North",
        locality: "Bethlehem",
        region: "CT",
        postal_code: "06751",
        parsed?: true
      }
  """
  @spec parse(String.t() | nil) :: t()
  def parse(nil), do: @empty
  def parse(""), do: @empty

  def parse(address) when is_binary(address) do
    trimmed = String.trim(address)

    case Regex.named_captures(@full, trimmed) || retry_without_tail(trimmed) do
      nil ->
        parse_italian(trimmed)

      caps ->
        locality = presence(caps["locality"])

        %{
          street: street_or_nil(caps["street"], locality),
          locality: locality,
          region: presence(caps["region"]),
          postal_code: presence(caps["postal"]) || scan_postal(trimmed),
          parsed?: true
        }
    end
  end

  # Third and last attempt, reached only when both US-shaped passes fail. A US
  # address cannot arrive here — `@full` matches it — so this can only turn a
  # nil into a value, never change one. The nil-with-scanned-postal path below
  # is unchanged and is still where a descriptive location lands.
  defp parse_italian(trimmed) do
    case Regex.named_captures(@italian, trimmed) ||
           Regex.named_captures(@vatican, trimmed) do
      nil ->
        parse_uk(trimmed)

      caps ->
        %{
          street: italian_street_or_nil(caps["street"]),
          locality: presence(caps["locality"]),
          region: presence(caps["region"]),
          postal_code: presence(caps["postal"]) || scan_postal(trimmed),
          parsed?: true
        }
    end
  end

  # Fourth and last attempt, reached only when the two American passes, the
  # Italian one and the Vatican one have all failed. Nothing that parses today
  # can arrive here, so this can only turn a nil into a value and never one
  # value into another — asserted in address_test.exs, not merely intended.
  defp parse_uk(trimmed) do
    case Regex.named_captures(@uk, trimmed) do
      %{"head" => head, "postal" => postal} ->
        segments = head |> String.split(",") |> Enum.map(&String.trim/1) |> Enum.reject(&(&1 == ""))

        %{
          street: uk_street_or_nil(List.first(segments), true),
          locality: uk_locality(segments),
          region: nil,
          postal_code: presence(postal),
          parsed?: true
        }

      nil ->
        parse_uk_without_postcode(trimmed)
    end
  end

  # The two weaker British forms, tried in order of how much they establish.
  # Neither yields a postal code: the first has none at all, and the second has
  # only an outward code, which is a postal district rather than a delivery
  # point and is discarded rather than published as if it were a postcode.
  defp parse_uk_without_postcode(trimmed) do
    case Regex.named_captures(@uk_no_postcode, trimmed) do
      %{"street" => street, "locality" => locality} ->
        %{
          street: uk_street_or_nil(street, false),
          locality: presence(locality),
          region: nil,
          postal_code: nil,
          parsed?: true
        }

      nil ->
        case Regex.named_captures(@uk_outward, trimmed) do
          %{"head" => head} ->
            segments =
              head |> String.split(",") |> Enum.map(&String.trim/1) |> Enum.reject(&(&1 == ""))

            %{
              street: uk_street_or_nil(List.first(segments), true),
              locality: uk_locality(segments),
              region: nil,
              postal_code: nil,
              parsed?: true
            }

          nil ->
            %{@empty | postal_code: scan_postal(trimmed)}
        end
    end
  end

  # The locality is the LAST segment before the postcode, not the second: 44%
  # of real London addresses carry one or more middles, and "100 London Road,
  # Forest Hill, London SE23 3PQ" means Forest Hill is not the locality the
  # postcode belongs to. Where there is only one segment, the address named no
  # locality and none is invented.
  defp uk_locality([_only]), do: nil
  defp uk_locality(segments) when is_list(segments), do: segments |> List.last() |> presence()
  defp uk_locality(_), do: nil

  defp uk_street_or_nil(nil, _postcode?), do: nil

  defp uk_street_or_nil(street, postcode?) do
    street = String.trim(street)

    cond do
      Regex.match?(@uk_descriptive, street) -> nil
      Regex.match?(@uk_house_number, street) -> presence(street)
      Regex.match?(@uk_thoroughfare, street) -> presence(street)
      postcode? -> presence(street)
      true -> nil
    end
  end

  defp italian_street_or_nil(street) do
    street = String.trim(street)

    if Regex.match?(@italian_thoroughfare, street), do: presence(street), else: nil
  end

  # Second and last attempt, reached only when the anchored match failed. Cuts
  # the trailing remark off and re-runs the SAME anchored regex against the head,
  # so a recovered address is held to exactly the rules a first-pass one is —
  # house number, ordinal-street rejection and locality de-duplication all still
  # apply. Returning nil leaves the caller on its original nil-with-postal path.
  #
  # `postal_code` is still scanned from the FULL original string by the caller,
  # not from the head, so a code sitting in the discarded tail is not lost.
  defp retry_without_tail(trimmed) do
    case Regex.named_captures(@head, trimmed) do
      %{"head" => head} -> Regex.named_captures(@full, String.trim(head))
      nil -> nil
    end
  end

  defp street_or_nil(street, locality) do
    street = String.trim(street)

    cond do
      not Regex.match?(@house_number, street) -> nil
      Regex.match?(@ordinal_street, street) -> nil
      true -> street |> drop_locality_segments(locality) |> presence()
    end
  end

  # `@full`'s street capture is greedy, so an address that names an intermediate
  # place — "65 Water Street, Brooklyn Bridge Park, Brooklyn, NY 11201" — pulls
  # that name into the street line, where it re-duplicates the locality this
  # module exists to separate out. Truncate at the first following segment that
  # mentions the locality: everything past it is address tail, not street.
  #
  # Only segments *after* the first are considered. A street name may legitimately
  # contain its own town ("145 Brooklyn Avenue, Brooklyn"), and that always lives
  # in the leading segment.
  defp drop_locality_segments(street, nil), do: street

  defp drop_locality_segments(street, locality) do
    [first | rest] = String.split(street, ",")

    kept = Enum.take_while(rest, fn segment -> not String.contains?(segment, locality) end)

    [first | kept] |> Enum.join(",") |> String.trim()
  end

  defp scan_postal(text) do
    case Regex.run(@postal, text, capture: :all_but_first) do
      [postal] -> postal
      _ -> nil
    end
  end

  # Trims before testing for emptiness: an all-whitespace segment is absent, not
  # present-and-blank. "1 Elm Street,   , CT 06103" must yield a nil locality.
  defp presence(nil), do: nil

  defp presence(s) when is_binary(s) do
    case String.trim(s) do
      "" -> nil
      trimmed -> trimmed
    end
  end
end
