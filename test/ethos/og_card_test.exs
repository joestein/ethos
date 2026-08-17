defmodule Ethos.OGCardTest do
  use Ethos.DataCase, async: false

  import Ethos.GuidesFixtures

  test "generate/1 writes a PNG and records the path" do
    guide = guide_fixture(%{title: "Lisbon in 5 days"})

    {:ok, guide} = Ethos.OGCard.generate(guide)

    assert guide.og_image_path == "uploads/og/#{guide.slug}.png"
    path = Path.join([:code.priv_dir(:ethos), "uploads", "og", "#{guide.slug}.png"])
    assert File.exists?(path)
    # PNG magic bytes
    assert <<0x89, "PNG", _::binary>> = File.read!(path)
    File.rm!(path)
  end
end
