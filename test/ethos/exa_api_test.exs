defmodule Ethos.Exa.APITest do
  use ExUnit.Case, async: true

  alias Ethos.Exa.API

  test "search/2 posts query and normalizes results" do
    Req.Test.stub(Ethos.Exa.API, fn conn ->
      {:ok, body, conn} = Plug.Conn.read_body(conn)
      assert %{"query" => "Cervejaria Ramiro Lisbon", "numResults" => 3} = Jason.decode!(body)

      Req.Test.json(conn, %{
        "results" => [
          %{"title" => "Ramiro", "url" => "https://cervejariaramiro.pt", "text" => "Seafood institution"}
        ]
      })
    end)

    assert {:ok, [%{title: "Ramiro", url: "https://cervejariaramiro.pt", snippet: "Seafood institution"}]} =
             API.search("Cervejaria Ramiro Lisbon")
  end

  test "search/2 surfaces HTTP errors" do
    Req.Test.stub(Ethos.Exa.API, fn conn ->
      conn |> Plug.Conn.put_status(500) |> Req.Test.json(%{"error" => "boom"})
    end)

    assert {:error, {:http, 500, _}} = API.search("anything")
  end
end
