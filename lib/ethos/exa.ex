defmodule Ethos.Exa do
  @type result :: %{title: String.t() | nil, url: String.t(), snippet: String.t() | nil}

  @callback search(query :: String.t(), opts :: keyword()) :: {:ok, [result()]} | {:error, term()}

  def impl, do: Application.get_env(:ethos, :exa, Ethos.Exa.API)
end
