defmodule Ethos.PhotoOptimizerTest do
  use ExUnit.Case, async: true

  @moduletag :tmp_dir

  @full_edge 1600
  @thumb_edge 480

  defp source!(tmp, name, width, height) do
    src = Path.join(tmp, "#{name}.png")
    {:ok, img} = Vix.Vips.Operation.black(width, height)
    :ok = Vix.Vips.Image.write_to_file(img, src)
    src
  end

  defp dimensions(path) do
    {:ok, img} = Vix.Vips.Image.new_from_file(path)
    {Vix.Vips.Image.width(img), Vix.Vips.Image.height(img)}
  end

  test "produces bounded jpg and thumb", %{tmp_dir: tmp} do
    src = source!(tmp, "src", 2000, 1000)

    {:ok, %{jpg: jpg, thumb: thumb}} = Ethos.PhotoOptimizer.optimize(src, tmp, "test-photo")

    assert Path.basename(jpg) == "test-photo.jpg"
    assert Path.basename(thumb) == "test-photo_thumb.jpg"

    {jw, jh} = dimensions(jpg)
    {tw, th} = dimensions(thumb)
    assert max(jw, jh) <= @full_edge
    assert max(tw, th) <= @thumb_edge
  end

  test "shrinks a source larger than the full bound to exactly 1600 on the long edge",
       %{tmp_dir: tmp} do
    # 2400x1200 is 2:1 landscape, comfortably over the 1600px bound.
    src = source!(tmp, "large", 2400, 1200)

    {:ok, %{jpg: jpg}} = Ethos.PhotoOptimizer.optimize(src, tmp, "large-photo")

    assert dimensions(jpg) == {1600, 800}
  end

  test "shrinks an oversized portrait source on its long edge, not its width",
       %{tmp_dir: tmp} do
    src = source!(tmp, "tall", 1200, 2400)

    {:ok, %{jpg: jpg}} = Ethos.PhotoOptimizer.optimize(src, tmp, "tall-photo")

    assert dimensions(jpg) == {800, 1600}
  end

  test "leaves a source smaller than the full bound at its native dimensions",
       %{tmp_dir: tmp} do
    # Regression test: vips `thumbnail` with the default `size: :VIPS_SIZE_BOTH`
    # enlarges a small source to fill the box, publishing a visibly soft image.
    # A 500x375 source must stay 500x375, not be blown up to 1600x1200.
    src = source!(tmp, "small", 500, 375)

    {:ok, %{jpg: jpg}} = Ethos.PhotoOptimizer.optimize(src, tmp, "small-photo")

    assert dimensions(jpg) == {500, 375}
  end

  test "leaves a source only just under the full bound at its native dimensions",
       %{tmp_dir: tmp} do
    src = source!(tmp, "near", 1599, 900)

    {:ok, %{jpg: jpg}} = Ethos.PhotoOptimizer.optimize(src, tmp, "near-photo")

    assert dimensions(jpg) == {1599, 900}
  end

  test "the thumbnail follows the same rule against the 480px bound", %{tmp_dir: tmp} do
    # Over the thumb bound but under the full bound: the thumb shrinks to 480,
    # while the full-size image stays native.
    src = source!(tmp, "mid", 800, 600)

    {:ok, %{jpg: jpg, thumb: thumb}} = Ethos.PhotoOptimizer.optimize(src, tmp, "mid-photo")

    assert dimensions(jpg) == {800, 600}
    assert dimensions(thumb) == {480, 360}
  end

  test "a source under the thumb bound leaves both outputs at native size", %{tmp_dir: tmp} do
    src = source!(tmp, "tiny", 300, 200)

    {:ok, %{jpg: jpg, thumb: thumb}} = Ethos.PhotoOptimizer.optimize(src, tmp, "tiny-photo")

    assert dimensions(jpg) == {300, 200}
    assert dimensions(thumb) == {300, 200}
  end
end
