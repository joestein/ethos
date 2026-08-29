defmodule EthosWeb.GuideHTML do
  use EthosWeb, :html

  embed_templates "guide_html/*"

  def verdict_badge("loved"), do: "❤️ loved it"
  def verdict_badge("good"), do: "👍 good"
  def verdict_badge("skip"), do: "⏭ skip it"
  def verdict_badge(_), do: nil

  @default_gyg_partner_url "https://www.getyourguide.com/?partner_id=ZA4AIMF&cmp=share_to_earn"

  def gyg_partner_url do
    Application.get_env(:ethos, :gyg_partner_url, @default_gyg_partner_url)
  end

  @doc """
  The destination crumbs between "Destinations" and the guide itself.

  Guides carry `state`/`county` independently, and both can be nil (Rome and
  Lisbon have neither), so the trail is only as deep as the data allows and
  never links a nil slug. Guides with no geography at all fall back to their
  destination hub, which is a real page.

  Shared by the visible breadcrumb and the BreadcrumbList JSON-LD so the two
  can't drift apart.
  """
  def breadcrumb_trail(guide) do
    cond do
      guide.state_slug && guide.county_slug ->
        [
          %{name: guide.state, path: ~p"/destinations/#{guide.state_slug}"},
          %{
            name: guide.county,
            path: ~p"/destinations/#{guide.state_slug}/#{guide.county_slug}"
          }
        ]

      guide.state_slug ->
        [%{name: guide.state, path: ~p"/destinations/#{guide.state_slug}"}]

      guide.destination_slug ->
        [
          %{
            name: guide.destination |> String.split(",") |> List.first(),
            path: ~p"/destinations/#{guide.destination_slug}"
          }
        ]

      true ->
        []
    end
  end

  def entry_share_url(guide, entry) do
    case entry.place do
      %{slug: slug} -> url(~p"/p/#{slug}")
      _ -> url(~p"/g/#{guide.slug}") <> "#entry-#{entry.id}"
    end
  end
end
