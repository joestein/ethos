defmodule EthosWeb.Markdown do
  @moduledoc """
  Server-side markdown rendering for guide prose. Escapes raw HTML and
  sanitizes `a href` / `img src` URLs so `javascript:`/`data:`-style
  schemes can never end up in rendered attributes.
  """

  def render(nil), do: {:safe, ""}
  def render(""), do: {:safe, ""}

  def render(markdown) when is_binary(markdown) do
    case Earmark.as_ast(markdown, escape: true) do
      {:ok, ast, _} -> {:safe, ast |> sanitize_ast() |> Earmark.Transform.transform()}
      {:error, ast, _} -> {:safe, ast |> sanitize_ast() |> Earmark.Transform.transform()}
    end
  end

  defp sanitize_ast(ast), do: Earmark.Transform.map_ast(ast, &sanitize_node/1, true)

  defp sanitize_node({"a", attrs, _ignored, meta}),
    do: {"a", sanitize_url_attr(attrs, "href"), nil, meta}

  defp sanitize_node({"img", attrs, _ignored, meta}),
    do: {"img", sanitize_url_attr(attrs, "src"), nil, meta}

  defp sanitize_node({tag, attrs, _ignored, meta}), do: {tag, attrs, nil, meta}

  defp sanitize_url_attr(attrs, key) do
    case List.keyfind(attrs, key, 0) do
      {^key, url} ->
        if safe_url?(url), do: attrs, else: List.keydelete(attrs, key, 0)

      nil ->
        attrs
    end
  end

  defp safe_url?(url) do
    String.starts_with?(url, "/") or String.starts_with?(url, "#") or Ethos.Url.safe_http?(url)
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
