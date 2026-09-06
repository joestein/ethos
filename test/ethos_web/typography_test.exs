defmodule EthosWeb.TypographyTest do
  @moduledoc """
  Self-hosted Fraunces for headings, and the type scale built on it.

  `async: false`, deliberately: this shells out to `mix assets.build` and
  then reads `priv/static/assets/app.css`, exactly like
  `test/ethos_web/season_tokens_test.exs`. Two async modules
  building/reading the same file concurrently is a race — one truncates the
  stylesheet while the other reads it.
  """
  use ExUnit.Case, async: false

  test "the font file is present, and is a font" do
    path = "priv/static/fonts/fraunces-latin-variable.woff2"

    assert File.exists?(path), "the Fraunces woff2 was never committed"

    # wOF2 magic number. Guards against an error page saved under this name,
    # which would pass a mere File.exists?/1 and then fail in the browser.
    assert File.read!(path) |> binary_part(0, 4) == "wOF2"
    assert File.stat!(path).size > 10_000
  end

  test "the licence ships with it" do
    # SIL OFL 1.1 requires the licence to travel with the font.
    assert File.exists?("priv/static/fonts/Fraunces-OFL.txt")
  end

  test "the face is declared and swaps rather than blocking" do
    {_, 0} = System.cmd("mix", ["assets.build"], stderr_to_stdout: true)
    css = File.read!("priv/static/assets/app.css")

    assert css =~ "@font-face"
    assert css =~ "Fraunces"
    assert css =~ "font-display: swap"
    assert css =~ "/fonts/fraunces-latin-variable.woff2"
  end

  test "the display family and the type scale are actually generated" do
    # The @font-face declaration existing is not the same as the utilities
    # existing. Tailwind only emits a utility it has seen used, and nothing
    # uses these yet — they are reachable only via the safelist. Without this
    # test, deleting a safelist entry would silently remove the utility and
    # every heading using it would render at the browser default.
    #
    # Matched with a selector boundary and optional whitespace before the
    # brace: `.text-display-sm` is a substring of nothing here, but
    # `.font-display` is not, and a minified build emits `.font-display{`
    # with no space. Same reasoning as season_tokens_test.exs.
    {_, 0} = System.cmd("mix", ["assets.build"], stderr_to_stdout: true)
    css = File.read!("priv/static/assets/app.css")

    for utility <- ~w(font-display text-display-lg text-display-md text-display-sm) do
      assert css =~ ~r/\.#{Regex.escape(utility)}\s*\{/,
             "utility .#{utility} was never generated — check the safelist"
    end
  end

  test "the fallback stack is a real serif, not bare serif" do
    # font-display: swap means visitors see the fallback FIRST, so it has to
    # resemble Fraunces rather than whatever bare `serif` happens to be on
    # the machine. Georgia and Cambria are the named stand-ins.
    {_, 0} = System.cmd("mix", ["assets.build"], stderr_to_stdout: true)
    css = File.read!("priv/static/assets/app.css")

    assert css =~ "Georgia"
    assert css =~ "Cambria"
  end
end
