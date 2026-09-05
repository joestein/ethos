defmodule Ethos.Affiliates do
  @moduledoc """
  Resolves a page's affiliate locale from its place in the destination tree.

  Pure domain logic: no assigns, no HTML, no Phoenix, no repo. The web layer
  (`EthosWeb.Affiliate`) reads the destination node off whatever the page
  assigned and passes its **path** in here.

  ## The failure mode is deliberate

  Everything that does not resolve returns `nil`, and `nil` renders no widget.
  An unknown geography, a mixed-geography list — both yield a missing widget,
  never a wrong one. That asymmetry is why the resolver is permissive about
  what it accepts and strict about what it confirms.

  ## Keyed on node paths, and that is the point

  `config :ethos, :affiliate_locales` maps a **destination node path** to a
  locale, and a page resolves to the locale whose key is its node's path or a
  prefix of it. Deeper keys win, so `italy/lazio/rome` would override
  `italy/lazio` for Roman pages without touching the rest of the region.

  This replaced a registry keyed on a page's derived `state_slug` and guarded
  by a list of county **names**, and it retires two live bugs by construction
  rather than by fixing them:

    * `:counties` listed `"Bronx"` while the borough node is named
      `"The Bronx"`, so thirteen Bronx seed files and both Yankee Stadium
      modules rendered no unit — HTTP 200, a correct-looking page, no unit.
      No display name is matched any more; `united-states/new-york/new-york-city`
      is a path, and a path is what the URL, the tree and the loaders all agree
      on already.

    * The Italian locale was keyed `"italy"`, a page's state was its nearest
      `region` ancestor, and the thirty Rome neighbourhood guides hang from
      `italy/lazio/*` — so they derived `"Lazio"` and silently stopped
      resolving. There is nothing left to derive: a node's path is stored on
      the node.

  The `:counties` guard is gone with them, and nothing replaced it. It existed
  because GetYourGuide's `new-york` campaign is New York *City* while the key
  named the whole state, so an upstate guide would have inherited a campaign
  for a city 300 miles away. Keyed on `united-states/new-york/new-york-city`,
  an upstate node is simply not under the key — the case the guard defended
  against cannot be expressed.
  """

  @doc """
  The locale for a destination node path, or `nil`.

  Matches the longest configured key that is the path itself or one of its
  ancestors, so a page always takes the most specific campaign covering it.
  """
  def locale_for(nil), do: nil

  def locale_for(path) when is_binary(path) do
    locales = locales()

    path
    |> ancestor_paths()
    |> Enum.reverse()
    |> Enum.find_value(&Map.get(locales, &1))
  end

  def locale_for(_), do: nil

  @doc """
  The locale shared by every path in the list, or `nil`.

  Returns `nil` for an empty list, for any path that does not resolve, and for
  two paths that resolve differently. A hub or a collection votes over the
  nodes of the rows it lists, so a page spanning two geographies carries no
  unit rather than the wrong one.
  """
  def unanimous_locale([]), do: nil

  def unanimous_locale(paths) when is_list(paths) do
    paths
    |> Enum.map(&locale_for/1)
    |> Enum.uniq()
    |> case do
      [locale] -> locale
      _ -> nil
    end
  end

  def unanimous_locale(_not_a_list), do: nil

  @doc """
  A path and every ancestor path above it, root-first.

  `"italy/lazio/rome"` gives `["italy", "italy/lazio", "italy/lazio/rome"]`.
  Public because the corpus gate asks the same question of a roster path that
  the resolver asks of a page's.
  """
  def ancestor_paths(path) when is_binary(path) do
    path
    |> String.split("/")
    |> Enum.scan([], fn seg, acc -> acc ++ [seg] end)
    |> Enum.map(&Enum.join(&1, "/"))
  end

  defp locales, do: Application.get_env(:ethos, :affiliate_locales, %{})
end
