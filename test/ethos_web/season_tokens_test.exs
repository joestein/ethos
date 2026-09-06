defmodule EthosWeb.SeasonTokensTest do
  @moduledoc """
  The token layer, asserted against the built stylesheet.

  A broken Tailwind mapping does not raise: the utility simply never gets
  generated, and every element using it renders unstyled. So this reads
  priv/static/assets/app.css directly rather than trusting that the config
  parses.

  `async: false`, deliberately: this shells out to `mix assets.build` in
  `setup_all` and then reads `priv/static/assets/app.css`. Task 5 adds a
  second module that does exactly the same thing, and two async modules
  building/reading the same file concurrently is a race — one truncates the
  stylesheet while the other reads it. See the same convention at
  `test/ethos_web/affiliate_placement_test.exs:908-915`.
  """
  use ExUnit.Case, async: false

  @css "priv/static/assets/app.css"

  setup_all do
    # The built stylesheet is a build artifact, so build it rather than
    # assuming a previous run left one behind.
    {_, 0} = System.cmd("mix", ["assets.build"], stderr_to_stdout: true)
    %{css: File.read!(@css)}
  end

  test "every season defines every token", %{css: css} do
    tokens =
      ~w(surface surface-raised ink ink-muted line accent accent-ink accent-soft
         positive negative star)

    for season <- ~w(summer autumn winter spring) do
      block = season_block(css, season)
      assert block, "season #{season} has no :root block"

      # Scoped to the season's own block, not the whole file: a global
      # `css =~ "--c-#{token}"` search only proves the token exists
      # *somewhere*, so three seasons keeping a token would mask a fourth
      # losing it (three-vs-one substring collision, same class of bug as
      # the utility-selector one below).
      for token <- tokens do
        assert block =~ "--c-#{token}",
               "season #{season} is missing token --c-#{token}"
      end
    end
  end

  # Extracts the declaration body of a season's `:root[data-season="..."]`
  # rule. Summer's selector is a two-selector list —
  # `:root,\n:root[data-season="summer"] {` — but in every season the
  # `[data-season="..."]` selector is what immediately precedes the `{`, so
  # anchoring there handles summer the same as the single-selector seasons.
  # Declarations here are flat (no nested `{`), so stopping at the first `}`
  # after the opening brace is the whole rule body.
  defp season_block(css, season) do
    case Regex.run(~r/:root\[data-season="#{season}"\]\s*\{([^}]*)\}/s, css) do
      [_, body] -> body
      nil -> nil
    end
  end

  test "tokens are bare RGB triples, not rgb() calls", %{css: css} do
    # `<alpha-value>` interpolation only works on a bare triple. An
    # `rgb(...)` value here silently breaks every `bg-accent/10` (and
    # `bg-accent`, `border-accent`, etc.) for whichever season/token pair
    # regresses. This used to check only `--c-surface`, which meant a
    # single season swapping a single *other* token to `rgb(...)` — e.g.
    # winter's `--c-accent` — sailed through green while every primary
    # button in that season silently lost its background. So this checks
    # every token, in every season's own block, individually named on
    # failure — a global `css =~ "--c-#{token}"`-style substring check
    # would let three correct seasons mask the fourth going bad.
    tokens =
      ~w(surface surface-raised ink ink-muted line accent accent-ink accent-soft
         positive negative star)

    for season <- ~w(summer autumn winter spring) do
      block = season_block(css, season)
      assert block, "season #{season} has no :root block"

      for token <- tokens do
        assert block =~ ~r/--c-#{token}:\s*\d+\s+\d+\s+\d+\b/,
               "season #{season}'s --c-#{token} is not a bare RGB triple"
      end
    end

    # Belt-and-braces sweep of the whole file: catches an `rgb(...)` value
    # on any `--c-*` declaration, including ones the token list above
    # doesn't yet know about.
    refute css =~ ~r/--c-[a-z-]+:\s*rgb\(/,
           "found a --c-* token declared with rgb(...) instead of a bare triple"
  end

  test "the utilities are actually generated", %{css: css} do
    # Tailwind only emits a utility it has seen used. These are referenced by
    # the safelist, so their absence means the colour mapping did not load.
    #
    # The selector match requires a boundary right after the class name, not
    # a bare substring check: ".bg-surface" is a substring of
    # ".bg-surface-raised", ".bg-accent" is a substring of
    # ".bg-accent-soft"/".bg-accent\/10", and ".text-ink" is a substring of
    # ".text-ink-muted". A plain `css =~ ".#{utility}"` check would still
    # pass with e.g. "bg-surface" missing from the safelist, as long as
    # "bg-surface-raised" (a sibling entry) is still present.
    #
    # The boundary is "optional whitespace then {", not a literal " {": this
    # module's own `setup_all` always runs the non-minified `mix
    # assets.build`, but `mix assets.deploy` (and any future module reading
    # this same file) minifies, which drops the space before the brace
    # (`.bg-surface{` instead of `.bg-surface {`). A hardcoded " {" would
    # fail open there — every utility assertion silently false-negatives
    # against a minified artifact instead of catching the real defect.
    for utility <- ~w(bg-surface text-ink border-line bg-accent text-ink-muted) do
      assert css =~ ~r/\.#{Regex.escape(utility)}\s*\{/,
             "utility .#{utility} was never generated"
    end
  end

  test "alpha modifiers survive the mapping", %{css: css} do
    assert css =~ ".bg-accent\\/10", "bg-accent/10 was not generated"
  end

  test "the hero gradient utilities are actually generated", %{css: css} do
    # The home hero is a gradient built from accent-soft into surface (see
    # page_controller_test.exs's "seasonal gradient" test, which only checks
    # the rendered HEEx source). That test can pass even if Tailwind never
    # emitted the CSS for the class — the utility would then render as
    # nothing. This is the check that catches that: it reads the built
    # stylesheet, not the template.
    for utility <- ~w(bg-gradient-to-b from-accent-soft to-surface) do
      assert css =~ ~r/\.#{Regex.escape(utility)}\s*[\{,]/,
             "utility .#{utility} was never generated — check the safelist"
    end
  end
end
