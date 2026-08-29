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

  # A leading ordinal is a street *name*, not a house number: "18th Avenue
  # between 55th and 58th Streets" and "86th Street and 7th Avenue" begin with
  # a digit but carry no building number, so they are descriptive locations of
  # exactly the kind the house-number rule exists to reject. A genuine house
  # number on an ordinal street ("1523 18th Avenue") is unaffected, because the
  # suffix must follow the leading digits immediately.
  @ordinal_street ~r/^\d+(?:st|nd|rd|th)\b/i

  @empty %{street: nil, locality: nil, region: nil, postal_code: nil, parsed?: false}

  def parse(nil), do: @empty
  def parse(""), do: @empty

  def parse(address) when is_binary(address) do
    trimmed = String.trim(address)

    case Regex.named_captures(@full, trimmed) do
      nil ->
        %{@empty | postal_code: scan_postal(trimmed)}

      caps ->
        %{
          street: street_or_nil(caps["street"]),
          locality: presence(caps["locality"]),
          region: presence(caps["region"]),
          postal_code: presence(caps["postal"]) || scan_postal(trimmed),
          parsed?: true
        }
    end
  end

  defp street_or_nil(street) do
    street = String.trim(street)

    if Regex.match?(@house_number, street) and not Regex.match?(@ordinal_street, street),
      do: presence(street),
      else: nil
  end

  defp scan_postal(text) do
    case Regex.run(@postal, text, capture: :all_but_first) do
      [postal] -> postal
      _ -> nil
    end
  end

  defp presence(nil), do: nil
  defp presence(""), do: nil
  defp presence(s), do: String.trim(s)
end
