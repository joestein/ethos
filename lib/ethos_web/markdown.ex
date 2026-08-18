defmodule EthosWeb.Markdown do
  @moduledoc "Server-side markdown rendering for guide prose. Escapes raw HTML."

  def render(nil), do: {:safe, ""}
  def render(""), do: {:safe, ""}

  def render(markdown) when is_binary(markdown) do
    case Earmark.as_html(markdown, escape: true) do
      {:ok, html, _} -> {:safe, html}
      {:error, html, _} -> {:safe, html}
    end
  end

  @doc "Plain-text excerpt for meta descriptions."
  def excerpt(nil, _max), do: nil

  def excerpt(markdown, max) do
    markdown
    |> String.replace(~r/[#*_>\[\]()`]/, "")
    |> String.replace(~r/\s+/, " ")
    |> String.trim()
    |> String.slice(0, max)
  end
end
