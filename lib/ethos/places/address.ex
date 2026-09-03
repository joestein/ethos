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
  @italian_thoroughfare ~r/^(?:via|viale|vicolo|piazza|piazzale|largo|corso|borgo|lungotevere|salita|clivo|circonvallazione|ponte|passeggiata|galleria|portico|strada|foro|campo|arco|scalinata|molo)\b/i

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
    case Regex.named_captures(@italian, trimmed) do
      nil ->
        %{@empty | postal_code: scan_postal(trimmed)}

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
