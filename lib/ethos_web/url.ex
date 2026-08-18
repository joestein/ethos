defmodule EthosWeb.Url do
  @moduledoc """
  Guards against unsafe URL schemes (e.g. `javascript:`, `data:`) leaking into
  `href` attributes for URLs sourced from user input (enrichment results,
  research links, suggestion URLs).

  Delegates to `Ethos.Url` so `Ethos.*` schemas can validate URLs without
  reaching into `EthosWeb`.
  """

  @doc "True only for absolute http/https URLs."
  defdelegate safe_http?(url), to: Ethos.Url
end
