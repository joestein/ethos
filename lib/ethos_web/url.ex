defmodule EthosWeb.Url do
  @moduledoc """
  Guards against unsafe URL schemes (e.g. `javascript:`, `data:`) leaking into
  `href` attributes for URLs sourced from user input (enrichment results,
  research links, suggestion URLs).
  """

  @doc "True only for absolute http/https URLs."
  def safe_http?(url) when is_binary(url) do
    case URI.parse(url) do
      %URI{scheme: scheme, host: host} when scheme in ["http", "https"] and is_binary(host) and host != "" -> true
      _ -> false
    end
  end

  def safe_http?(_), do: false
end
