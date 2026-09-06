defmodule EthosWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use EthosWeb, :html

  embed_templates "page_html/*"

  # What each hub actually contains. "171 towns" is truer than "171 guides",
  # and an unmapped hub degrades to something true rather than something wrong.
  #
  # Keyed on country slugs now that the homepage lists the tree's roots. Most
  # countries lose their entry rather than gaining a wrong one: the United
  # States hub aggregates Connecticut towns, New York neighbourhoods and thirty
  # ballparks, and no single noun is true of all three, so it takes the "guides"
  # fallback — which is literally what the count counts. Italy keeps a noun
  # because its whole corpus really is Rome's zones.
  @hub_nouns %{
    "italy" => "zones"
  }

  def hub_noun(slug), do: Map.get(@hub_nouns, slug, "guides")
end
