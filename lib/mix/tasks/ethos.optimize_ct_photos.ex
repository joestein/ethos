defmodule Mix.Tasks.Ethos.OptimizeCtPhotos do
  @shortdoc "Optimizes Connecticut source photos from images/ct/ into priv/photos/ct/"
  @moduledoc "Run after downloading Commons originals: mix ethos.optimize_ct_photos"
  use Mix.Task

  # {town_dir, label, source filename under images/ct/}
  @mapping [
    {"waterbury", "palace-theater", "palace-theater.jpg"},
    {"waterbury", "palace-theater-marquee", "palace-theater-marquee.jpg"},
    {"waterbury", "mattatuck-museum", "mattatuck-museum.jpg"},
    {"waterbury", "mattatuck-museum-front", "mattatuck-museum-front.jpg"},
    {"waterbury", "union-station-tower", "union-station-tower.jpg"},
    {"waterbury", "union-station-clock", "union-station-clock.jpg"},
    {"waterbury", "waterbury-green-fountain", "waterbury-green-fountain.jpg"},
    {"waterbury", "downtown-waterbury", "downtown-waterbury.jpg"},
    {"danbury", "railway-museum-entrance", "railway-museum-entrance.jpg"},
    {"danbury", "railway-museum-station", "railway-museum-station.jpg"},
    {"danbury", "railway-museum-acmu", "railway-museum-acmu.jpg"},
    {"danbury", "danbury-museum", "danbury-museum.jpg"},
    {"danbury", "john-rider-house", "john-rider-house.jpg"},
    {"danbury", "charles-ives-birthplace", "charles-ives-birthplace.jpg"},
    {"danbury", "main-street-danbury", "main-street-danbury.jpg"},
    {"middlebury", "quassy-sign", "quassy-sign.jpg"},
    {"middlebury", "quassy-rides", "quassy-rides.jpg"},
    {"middlebury", "middlebury-town-hall", "middlebury-town-hall.jpg"},
    {"middlebury", "middlebury-sign", "middlebury-sign.jpg"},
    {"woodbury", "glebe-house", "glebe-house.png"},
    {"woodbury", "woodbury-old-town-hall", "woodbury-old-town-hall.jpg"},
    {"woodbury", "woodbury-historic-district", "woodbury-historic-district.jpg"},
    {"woodbury", "1754-house", "1754-house.tif"},
    {"southbury", "kettletown-lake-zoar", "kettletown-lake-zoar.jpg"},
    {"southbury", "kettletown-overlook", "kettletown-overlook.jpg"},
    {"southbury", "bent-of-the-river", "bent-of-the-river.jpg"},
    {"southbury", "bent-of-the-river-center", "bent-of-the-river-center.jpg"},
    {"southbury", "southbury-town-hall", "southbury-town-hall.jpg"},
    {"southbury", "south-britain-church", "south-britain-church.jpg"},
    {"southbury", "lake-zoar-bridge", "lake-zoar-bridge.jpg"}
  ]

  @impl true
  def run(_args) do
    Enum.each(@mapping, fn {town, label, src} ->
      src_path = Path.join(["images", "ct", src])
      out_dir = Path.join(["priv", "photos", "ct", town])
      File.mkdir_p!(out_dir)

      case Ethos.PhotoOptimizer.optimize(src_path, out_dir, label) do
        {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
        {:error, reason} -> Mix.raise("failed #{src}: #{inspect(reason)}")
      end
    end)
  end
end
