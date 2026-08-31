defmodule Ethos.Affiliates do
  @moduledoc """
  Resolves a page's affiliate locale from its geography.

  Pure domain logic: no assigns, no HTML, no Phoenix. The web layer
  (`EthosWeb.Affiliate`) extracts a state slug and county from whatever the
  page assigned and calls in here.

  ## The failure mode is deliberate

  Everything that does not resolve returns `nil`, and `nil` renders no widget.
  An unknown state, an unrecognised county, a mixed-geography list — all yield
  a missing widget, never a wrong one. That asymmetry is why the resolver is
  permissive about what it accepts and strict about what it confirms.

  ## Configuration

  `config :ethos, :affiliate_locales` maps a **state slug** to a locale. Adding
  Rome or Amsterdam is a config entry; adding a second affiliate network is a
  new `:network` value plus one component clause in `EthosWeb.Affiliate`.
  """

  @doc """
  The locale for a state slug and county, or `nil`.

  A `nil` county is the destination-hub case (`/destinations/new-york`) and
  resolves to the locale. A present county must appear in the entry's
  `:counties` list when it has one.
  """
  def locale_for(state_slug, county)

  def locale_for(nil, _county), do: nil

  def locale_for(state_slug, county) when is_binary(state_slug) do
    case Map.get(locales(), state_slug) do
      nil -> nil
      locale -> if county_allowed?(locale, county), do: locale, else: nil
    end
  end

  @doc """
  The locale shared by every row in the list, or `nil`.

  Each row must carry `:state_slug` and `:county` — `Ethos.Guides.Guide` and
  `Ethos.Places.Place` both do. Returns `nil` for an empty list, for any row
  that does not resolve, and for two rows that resolve differently.
  """
  def unanimous_locale([]), do: nil

  def unanimous_locale(rows) when is_list(rows) do
    rows
    |> Enum.map(&locale_for(&1.state_slug, &1.county))
    |> Enum.uniq()
    |> case do
      [locale] -> locale
      _ -> nil
    end
  end

  def unanimous_locale(_not_a_list), do: nil

  # A locale with no :counties key accepts any county. A nil county is the
  # hub case and is always accepted — see the moduledoc.
  defp county_allowed?(locale, county) do
    case {Map.get(locale, :counties), county} do
      {nil, _} -> true
      {_counties, nil} -> true
      {counties, county} -> county in counties
    end
  end

  defp locales, do: Application.get_env(:ethos, :affiliate_locales, %{})
end
