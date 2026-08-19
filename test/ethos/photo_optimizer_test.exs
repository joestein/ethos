defmodule Ethos.PhotoOptimizerTest do
  use ExUnit.Case, async: true

  @moduletag :tmp_dir

  test "produces bounded jpg and thumb", %{tmp_dir: tmp} do
    src = Path.join(tmp, "src.png")
    {:ok, img} = Vix.Vips.Operation.black(2000, 1000)
    :ok = Vix.Vips.Image.write_to_file(img, src)

    {:ok, %{jpg: jpg, thumb: thumb}} = Ethos.PhotoOptimizer.optimize(src, tmp, "test-photo")

    assert Path.basename(jpg) == "test-photo.jpg"
    assert Path.basename(thumb) == "test-photo_thumb.jpg"

    {:ok, j} = Vix.Vips.Image.new_from_file(jpg)
    {:ok, t} = Vix.Vips.Image.new_from_file(thumb)
    assert max(Vix.Vips.Image.width(j), Vix.Vips.Image.height(j)) <= 1600
    assert max(Vix.Vips.Image.width(t), Vix.Vips.Image.height(t)) <= 480
  end
end
