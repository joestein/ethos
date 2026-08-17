defmodule Ethos.OGCard do
  @moduledoc "Renders the 1200x630 Open Graph share card: SVG template -> PNG via Vix/libvips."

  alias Ethos.Guides

  def generate(guide) do
    svg = template(guide)
    dir = Path.join([:code.priv_dir(:ethos) |> to_string(), "uploads", "og"])
    File.mkdir_p!(dir)
    path = Path.join(dir, "#{guide.slug}.png")

    with {:ok, {image, _flags}} <- Vix.Vips.Operation.svgload_buffer(svg),
         :ok <- Vix.Vips.Image.write_to_file(image, path) do
      Guides.update_guide_og_path(guide, "uploads/og/#{guide.slug}.png")
    end
  end

  defp template(guide) do
    title = escape(String.slice(guide.title, 0, 60))
    destination = escape(String.slice(guide.destination, 0, 60))

    """
    <svg xmlns="http://www.w3.org/2000/svg" width="1200" height="630">
      <rect width="1200" height="630" fill="#18181b"/>
      <rect x="0" y="560" width="1200" height="70" fill="#f59e0b"/>
      <text x="80" y="280" font-family="Georgia, serif" font-size="64" fill="#fafafa" font-weight="bold">#{title}</text>
      <text x="80" y="360" font-family="Georgia, serif" font-size="36" fill="#a1a1aa">#{destination}</text>
      <text x="80" y="605" font-family="Georgia, serif" font-size="24" fill="#18181b">an Ethos guide — real places, real verdicts</text>
    </svg>
    """
  end

  defp escape(text) do
    text
    |> String.replace("&", "&amp;")
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
  end
end
