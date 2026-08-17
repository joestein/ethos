defmodule Ethos.Claude.APITest do
  use ExUnit.Case, async: true

  alias Ethos.Claude.API

  defp claude_response(json_text, stop_reason \\ "end_turn") do
    %{
      "stop_reason" => stop_reason,
      "content" => [%{"type" => "text", "text" => json_text}]
    }
  end

  test "parse_dump/2 sends structured-output request and decodes entries" do
    Req.Test.stub(Ethos.Claude.API, fn conn ->
      {:ok, body, conn} = Plug.Conn.read_body(conn)
      decoded = Jason.decode!(body)

      assert decoded["model"] == "claude-opus-5"
      assert decoded["output_config"]["effort"] == "low"
      assert decoded["output_config"]["format"]["type"] == "json_schema"
      assert [%{"cache_control" => %{"type" => "ephemeral"}} | _] = decoded["system"]

      Req.Test.json(
        conn,
        claude_response(
          ~s({"entries":[{"day":1,"kind":"food","name":"Ramiro","note":"go early","verdict":"loved"}]})
        )
      )
    end)

    assert {:ok, [%{"name" => "Ramiro", "kind" => "food"}]} =
             API.parse_dump("we ate at Ramiro day 1", "Lisbon, Portugal")
  end

  test "parse_dump/2 surfaces refusals" do
    Req.Test.stub(Ethos.Claude.API, fn conn ->
      Req.Test.json(conn, claude_response("", "refusal"))
    end)

    assert {:error, :refusal} = API.parse_dump("notes", "Lisbon")
  end

  test "parse_dump/2 surfaces HTTP errors" do
    Req.Test.stub(Ethos.Claude.API, fn conn ->
      conn
      |> Plug.Conn.put_status(429)
      |> Req.Test.json(%{"error" => %{"type" => "rate_limit_error"}})
    end)

    assert {:error, {:http, 429, _}} = API.parse_dump("notes", "Lisbon")
  end
end
