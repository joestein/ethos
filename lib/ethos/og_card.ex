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
      <text x="80" y="280" font-family="DejaVu Serif, Georgia, serif" font-size="64" fill="#fafafa" font-weight="bold">#{title}</text>
      <text x="80" y="360" font-family="DejaVu Serif, Georgia, serif" font-size="36" fill="#a1a1aa">#{destination}</text>
      <text x="80" y="605" font-family="DejaVu Serif, Georgia, serif" font-size="24" fill="#18181b">an Ethos guide — real places, real verdicts</text>
    </svg>
    """
  end

  @doc """
  The share card for the foliage forecast — the same SVG renderer as the page,
  at card size, over the dark ground the guide cards use.
  """
  def generate_foliage do
    dir = Path.join([:code.priv_dir(:ethos) |> to_string(), "uploads", "og"])
    File.mkdir_p!(dir)
    path = Path.join(dir, "foliage.png")

    # Weeks 1 and 9 are structurally flat — week 1 is pre-season green
    # statewide, and week 9 is DEEP's blanket past-peak fill — so a card
    # generated then would be a single colour and say nothing about foliage.
    # Weeks 2..8 all carry real spatial variation, so show the current week
    # whenever it is one of those, and week 5 (Oct 14-20, the most varied)
    # otherwise.
    week =
      case Ethos.Foliage.current_week_index() do
        current when current in 2..8 -> current
        _ -> 5
      end

    map = Ethos.Foliage.Svg.map(week, width: 520, height: 340) |> Phoenix.HTML.safe_to_string()
    inner = map |> String.replace(~r/^<svg[^>]*>/, "") |> String.replace(~r{</svg>$}, "")

    svg = """
    <svg xmlns="http://www.w3.org/2000/svg" width="1200" height="630">
      <rect width="1200" height="630" fill="#18181b"/>
      <text x="80" y="150" font-family="DejaVu Serif, Georgia, serif" font-size="56" fill="#fafafa" font-weight="bold">Connecticut Foliage Forecast</text>
      <text x="80" y="205" font-family="DejaVu Serif, Georgia, serif" font-size="28" fill="#a1a1aa">169 towns · seven state driving routes</text>
      <g transform="translate(620, 195)">#{inner}</g>
      <rect x="0" y="560" width="1200" height="70" fill="#f59e0b"/>
      <text x="80" y="605" font-family="DejaVu Serif, Georgia, serif" font-size="24" fill="#18181b">derived from the CT DEEP fall foliage map</text>
    </svg>
    """

    with {:ok, {image, _flags}} <- Vix.Vips.Operation.svgload_buffer(svg),
         :ok <- Vix.Vips.Image.write_to_file(image, path) do
      {:ok, path}
    end
  end

  defp escape(text) do
    text
    |> String.replace("&", "&amp;")
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
  end
end
