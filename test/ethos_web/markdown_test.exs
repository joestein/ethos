defmodule EthosWeb.MarkdownTest do
  use ExUnit.Case, async: true

  import Phoenix.HTML, only: [safe_to_string: 1]

  test "renders markdown to safe html" do
    html = safe_to_string(EthosWeb.Markdown.render("Three **real** days"))
    assert html =~ "<strong>real</strong>"
  end

  test "escapes raw html" do
    html = safe_to_string(EthosWeb.Markdown.render("hi <script>alert(1)</script>"))
    refute html =~ "<script>"
  end

  test "nil and empty render as empty" do
    assert safe_to_string(EthosWeb.Markdown.render(nil)) == ""
    assert safe_to_string(EthosWeb.Markdown.render("")) == ""
  end

  test "strips javascript: URLs from links" do
    html = safe_to_string(EthosWeb.Markdown.render("[click](javascript:alert(1))"))
    refute html =~ "javascript:"
    assert html =~ "click"
  end

  test "strips javascript: URLs from images" do
    html = safe_to_string(EthosWeb.Markdown.render("![x](javascript:alert(1))"))
    refute html =~ "javascript:"
  end

  test "keeps normal http(s) links" do
    html = safe_to_string(EthosWeb.Markdown.render("[site](https://example.com)"))
    assert html =~ ~s(href="https://example.com")
    assert html =~ "site"
  end
end
