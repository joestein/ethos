defmodule Ethos.PhotoOptimizer do
  @moduledoc """
  Resizes a source image into a web-optimized JPEG pair: a full-size image
  bounded to `#{1600}`px on its long edge, and a thumbnail bounded to
  `#{480}`px, both re-encoded as JPEG at quality 82.

  Uses `Vix.Vips.Operation.thumbnail/3`, which — when given both `width`
  and the `height` option (and the default `size: :VIPS_SIZE_BOTH`) —
  shrinks the source to fit within that `width x height` box while
  preserving aspect ratio. Passing the same value for both width and the
  `height` option therefore caps the long edge, whichever dimension that
  is. Output is written with `Vix.Vips.Image.write_to_file/3`, which
  accepts saver options (`Q: 82`) directly since Vix 0.32.0.
  """

  @full_edge 1600
  @thumb_edge 480
  @quality 82

  @doc """
  Optimizes `src_path` into `{label}.jpg` (long edge <= #{@full_edge}px) and
  `{label}_thumb.jpg` (long edge <= #{@thumb_edge}px) under `out_dir`, both
  JPEG at quality #{@quality}.
  """
  @spec optimize(String.t(), String.t(), String.t()) ::
          {:ok, %{jpg: String.t(), thumb: String.t()}} | {:error, term()}
  def optimize(src_path, out_dir, label) do
    jpg_path = Path.join(out_dir, "#{label}.jpg")
    thumb_path = Path.join(out_dir, "#{label}_thumb.jpg")

    with {:ok, jpg_path} <- save_bounded(src_path, jpg_path, @full_edge),
         {:ok, thumb_path} <- save_bounded(src_path, thumb_path, @thumb_edge) do
      {:ok, %{jpg: jpg_path, thumb: thumb_path}}
    end
  end

  defp save_bounded(src_path, out_path, max_edge) do
    # Note: vips thumbnail auto-rotates by EXIF orientation. Sources must
    # either carry a correct tag or none — a stale tag on already-upright
    # pixels double-rotates the output (strip such tags from sources).
    with {:ok, image} <- Vix.Vips.Operation.thumbnail(src_path, max_edge, height: max_edge),
         :ok <- Vix.Vips.Image.write_to_file(image, out_path, Q: @quality) do
      {:ok, out_path}
    end
  end
end
