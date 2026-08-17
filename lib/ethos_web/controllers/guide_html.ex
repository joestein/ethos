defmodule EthosWeb.GuideHTML do
  use EthosWeb, :html

  embed_templates "guide_html/*"

  def verdict_badge("loved"), do: "❤️ loved it"
  def verdict_badge("good"), do: "👍 good"
  def verdict_badge("skip"), do: "⏭ skip it"
  def verdict_badge(_), do: nil
end
