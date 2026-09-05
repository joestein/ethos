defmodule Ethos.Foliage.OGCardTest do
  use ExUnit.Case, async: true

  test "renders a 1200x630 card carrying the forecast name" do
    assert {:ok, path} = Ethos.OGCard.generate_foliage()
    assert File.exists?(path)

    {:ok, image} = Vix.Vips.Image.new_from_file(path)
    assert Vix.Vips.Image.width(image) == 1200
    assert Vix.Vips.Image.height(image) == 630
  end
end
