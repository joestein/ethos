defmodule Mix.Tasks.Ethos.OptimizePhotos do
  use Mix.Task

  @shortdoc "Optimize trip photos into priv/static/photos"

  @moduledoc """
  Resizes and re-encodes the Rome trip source photos from `images/` into
  optimized JPEGs (full-size + thumbnail) under `priv/static/photos/rome/`.

  Source files are looked up as `images/IMG_<n>.png`, per the hardcoded
  label -> filename manifest below. Missing sources are skipped with a
  warning rather than failing the run.

      mix ethos.optimize_photos
  """

  @source_dir "images"
  @out_dir "priv/static/photos/rome"

  @manifest [
    {"food-flatbread-lunch", "IMG_3618.png"},
    {"arch-of-constantine", "IMG_3622.png"},
    {"arch-of-titus-menorah-relief", "IMG_3623.png"},
    {"arch-across-the-forum", "IMG_3624.png"},
    {"vittoriano-and-domes", "IMG_3625.png"},
    {"palatine-forum-view", "IMG_3626.png"},
    {"colosseum-exterior-arches", "IMG_3627.png"},
    {"colosseum-hypogeum", "IMG_3629.png"},
    {"colosseum-interior-wide", "IMG_3631.png"},
    {"trevi-fountain", "IMG_3637.png"},
    {"obelisk-and-church", "IMG_3639.png"},
    {"street-art-michelangelo", "IMG_3642.png"},
    {"santa-maria-in-trastevere", "IMG_3643.png"}
  ]

  @impl Mix.Task
  def run(_args) do
    File.mkdir_p!(@out_dir)

    results = Enum.map(@manifest, &optimize_one/1)

    ok = Enum.count(results, &match?({:ok, _}, &1))
    skipped = Enum.count(results, &match?({:skip, _}, &1))
    failed = Enum.count(results, &match?({:error, _}, &1))

    Mix.shell().info("\nDone: #{ok} optimized, #{skipped} skipped, #{failed} failed.")
  end

  defp optimize_one({label, filename}) do
    src = Path.join(@source_dir, filename)

    if File.exists?(src) do
      case Ethos.PhotoOptimizer.optimize(src, @out_dir, label) do
        {:ok, %{jpg: jpg, thumb: thumb}} ->
          Mix.shell().info("OK   #{label}: #{jpg}, #{thumb}")
          {:ok, label}

        {:error, reason} ->
          Mix.shell().error("FAIL #{label}: #{inspect(reason)}")
          {:error, label}
      end
    else
      Mix.shell().info("SKIP #{label}: missing #{src}")
      {:skip, label}
    end
  end
end
