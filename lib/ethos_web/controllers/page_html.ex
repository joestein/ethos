defmodule EthosWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use EthosWeb, :html

  embed_templates "page_html/*"

  # What each hub actually contains. "171 towns" is truer than "171 guides",
  # and an unmapped hub degrades to something true rather than something wrong.
  @hub_nouns %{
    "connecticut" => "towns",
    "new-york" => "neighbourhoods",
    "england" => "boroughs",
    "italy" => "zones",
    "california" => "neighbourhoods"
  }

  def hub_noun(slug), do: Map.get(@hub_nouns, slug, "guides")
end
