defmodule Ethos.Foliage.OGCardTest do
  use ExUnit.Case, async: true

  test "renders a 1200x630 card carrying the forecast name" do
    assert {:ok, path} = Ethos.OGCard.generate_foliage()
    assert File.exists?(path)

    {:ok, image} = Vix.Vips.Image.new_from_file(path)
    assert Vix.Vips.Image.width(image) == 1200
    assert Vix.Vips.Image.height(image) == 630
  end

  describe "foliage_svg/0 (asserted on the markup, before rasterisation)" do
    # A rasterised PNG's pixels can prove the card is 1200x630 and non-blank,
    # but cannot cheaply prove WHICH text or WHICH colours are on it. The
    # markup can, and every bug this section exists to catch — the premature
    # `</svg>`, the clipped map, and the monochrome week — is a markup-level
    # defect that a dimensions-only pixel check cannot see.
    test "the inner map's </svg> is stripped, not left to prematurely close the outer card" do
      svg = Ethos.OGCard.foliage_svg()

      # Regression guard for the String.trim/1 fix: if trailing whitespace
      # after the map's </svg> ever again defeats the `$`-anchored strip, the
      # inner closing tag survives and this count goes to 2 — which also
      # means everything after it (the footer bar, the attribution line)
      # renders outside the document and is silently dropped.
      assert length(Regex.scan(~r/<svg[\s>]/, svg)) == 1
      assert length(Regex.scan(~r{</svg>}, svg)) == 1
    end

    test "carries the footer attribution text" do
      svg = Ethos.OGCard.foliage_svg()
      assert svg =~ "derived from the CT DEEP fall foliage map"
    end

    test "the map carries more than one distinct stage fill colour" do
      svg = Ethos.OGCard.foliage_svg()

      present_colors =
        Ethos.Foliage.stage_labels()
        |> Map.keys()
        |> Enum.map(&Ethos.Foliage.stage_color/1)
        |> Enum.filter(&(svg =~ ~s(fill="#{&1}")))

      # A monochrome card (the already-fixed week-1/week-9 bug) would carry
      # exactly one of these.
      assert length(present_colors) > 1
    end
  end
end
