defmodule Ethos.Claude.API do
  @behaviour Ethos.Claude

  @endpoint "https://api.anthropic.com/v1/messages"
  @model "claude-opus-5"

  @entry_schema %{
    type: "object",
    additionalProperties: false,
    required: ["entries"],
    properties: %{
      entries: %{
        type: "array",
        items: %{
          type: "object",
          additionalProperties: false,
          required: ["day", "kind", "name", "note", "verdict"],
          properties: %{
            day: %{type: ["integer", "null"]},
            kind: %{type: "string", enum: ["food", "tour", "walk", "sight", "stay", "tip"]},
            name: %{type: "string"},
            note: %{type: ["string", "null"]},
            verdict: %{type: ["string", "null"], enum: ["loved", "good", "skip", nil]}
          }
        }
      }
    }
  }

  @nearby_schema %{
    type: "object",
    additionalProperties: false,
    required: ["ideas"],
    properties: %{
      ideas: %{
        type: "array",
        items: %{
          type: "object",
          additionalProperties: false,
          required: ["name", "kind", "reason", "url"],
          properties: %{
            name: %{type: "string"},
            kind: %{type: "string", enum: ["food", "tour", "walk", "sight", "stay", "tip"]},
            reason: %{type: "string"},
            url: %{type: ["string", "null"]}
          }
        }
      }
    }
  }

  @parse_system """
  You structure raw travel notes into guide entries. Extract every distinct place,
  activity, food spot, walk, stay, or tip mentioned. Infer kind and verdict from
  tone (loved / good / skip); use null verdict when tone is unclear. Preserve the
  author's own words in note where possible. Assign day numbers only when the text
  clearly indicates them, else null. Never invent places not present in the notes.
  """

  @nearby_system """
  You select nearby ideas for a travel guide. From the candidate search results,
  pick up to 5 genuinely notable places NOT already in the guide's entry list.
  Write a one-sentence reason each, grounded in the candidate snippets. Never
  invent places absent from the candidates.
  """

  @impl true
  def parse_dump(raw_text, destination) do
    request(@parse_system, @entry_schema,
      "Destination: #{destination}\n\nRaw trip notes:\n#{raw_text}")
    |> decode_list("entries")
  end

  @impl true
  def pick_nearby(destination, existing_names, candidates) do
    user = """
    Destination: #{destination}
    Already in the guide: #{Enum.join(existing_names, "; ")}

    Candidate search results (JSON):
    #{Jason.encode!(candidates)}
    """

    request(@nearby_system, @nearby_schema, user)
    |> decode_list("ideas")
  end

  defp request(system_text, schema, user_content) do
    body = %{
      model: @model,
      max_tokens: 4000,
      system: [%{type: "text", text: system_text, cache_control: %{type: "ephemeral"}}],
      output_config: %{effort: "low", format: %{type: "json_schema", schema: schema}},
      messages: [%{role: "user", content: user_content}]
    }

    req =
      Req.new(
        url: @endpoint,
        headers: [
          {"x-api-key", api_key()},
          {"anthropic-version", "2023-06-01"}
        ],
        receive_timeout: 120_000,
        retry: false
      )
      |> attach_test_stub()

    case Req.post(req, json: body) do
      {:ok, %Req.Response{status: 200, body: %{"stop_reason" => "refusal"}}} ->
        {:error, :refusal}

      {:ok, %Req.Response{status: 200, body: %{"content" => content}}} ->
        text =
          content
          |> Enum.find(%{}, &(&1["type"] == "text"))
          |> Map.get("text", "")

        {:ok, text}

      {:ok, %Req.Response{status: status, body: body}} ->
        {:error, {:http, status, body}}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp decode_list({:ok, text}, key) do
    case Jason.decode(text) do
      {:ok, %{^key => list}} when is_list(list) -> {:ok, list}
      _ -> {:error, :bad_response}
    end
  end

  defp decode_list(error, _key), do: error

  defp api_key, do: Application.fetch_env!(:ethos, :anthropic_api_key)

  defp attach_test_stub(req) do
    case Application.get_env(:ethos, :claude_req_options) do
      nil -> req
      opts -> Req.merge(req, opts)
    end
  end
end
