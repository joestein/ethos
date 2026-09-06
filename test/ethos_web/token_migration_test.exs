defmodule EthosWeb.TokenMigrationTest do
  @moduledoc """
  The shared component library and the layouts carry no hardcoded palette
  colours, so a season change reaches them.

  Asserted against the source rather than rendered output: a hardcoded
  `text-zinc-900` renders perfectly well, it just never changes colour. There
  is no rendered artifact to catch, which is why this reads the files.
  """
  use ExUnit.Case, async: true

  @files [
    "lib/ethos_web/components/core_components.ex",
    "lib/ethos_web/components/layouts.ex",
    "lib/ethos_web/components/layouts/root.html.heex",
    "lib/ethos_web/components/layouts/app.html.heex",
    "lib/ethos_web/controllers/page_html/home.html.heex",
    "lib/ethos_web/live/social_live.ex",
    "lib/ethos_web/controllers/destination_html/index.html.heex",
    "lib/ethos_web/controllers/destination_html/node.html.heex",
    "lib/ethos_web/components/guide_breadcrumb.ex",
    "lib/ethos_web/components/connected_pages.ex",
    "lib/ethos_web/controllers/search_html/index.html.heex",
    "lib/ethos_web/controllers/collection_html/show.html.heex",
    "lib/ethos_web/controllers/guide_html/photos.html.heex",
    "lib/ethos_web/controllers/guide_html/town_page.html.heex",
    "lib/ethos_web/components/foliage_panel.ex",
    "lib/ethos_web/controllers/foliage_html.ex",
    "lib/ethos_web/controllers/foliage_html/index.html.heex",
    "lib/ethos_web/controllers/foliage_html/route.html.heex",
    "lib/ethos_web/controllers/badge_html/index.html.heex",
    "lib/ethos_web/controllers/place_html/show.html.heex",
    "lib/ethos_web/controllers/guide_html/show.html.heex",
    "lib/ethos_web/components/house_ad.ex"
  ]

  test "no hardcoded palette colours survive in the shared surfaces" do
    for path <- @files do
      offenders =
        path
        |> File.read!()
        |> String.split("\n")
        |> Enum.with_index(1)
        |> Enum.filter(fn {line, _} -> line =~ ~r/\b(zinc|emerald)-[0-9]{2,3}\b/ end)
        |> Enum.map(fn {line, n} -> "  #{path}:#{n}: #{String.trim(line)}" end)

      assert offenders == [],
             "hardcoded palette colours remain:\n" <> Enum.join(offenders, "\n")
    end
  end
end
