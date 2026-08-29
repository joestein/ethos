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

  def entry_share_url(guide, entry) do
    case entry.place do
      %{slug: slug} -> url(~p"/p/#{slug}")
      _ -> url(~p"/g/#{guide.slug}") <> "#entry-#{entry.id}"
    end
  end
end
