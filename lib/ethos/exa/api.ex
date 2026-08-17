defmodule Ethos.Exa.API do
  @behaviour Ethos.Exa

  @endpoint "https://api.exa.ai/search"

  @impl true
  def search(query, opts \\ []) do
    body = %{
      query: query,
      numResults: Keyword.get(opts, :num_results, 3),
      type: "auto",
      contents: %{text: %{maxCharacters: 500}}
    }

    req =
      Req.new(
        url: @endpoint,
        headers: [{"x-api-key", api_key()}],
        receive_timeout: 30_000,
        retry: false
      )
      |> attach_test_stub()

    case Req.post(req, json: body) do
      {:ok, %Req.Response{status: 200, body: %{"results" => results}}} ->
        {:ok,
         Enum.map(results, fn r ->
           %{title: r["title"], url: r["url"], snippet: r["text"]}
         end)}

      {:ok, %Req.Response{status: status, body: body}} ->
        {:error, {:http, status, body}}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp api_key, do: Application.fetch_env!(:ethos, :exa_api_key)

  defp attach_test_stub(req) do
    case Application.get_env(:ethos, :exa_req_options) do
      nil -> req
      opts -> Req.merge(req, opts)
    end
  end
end
