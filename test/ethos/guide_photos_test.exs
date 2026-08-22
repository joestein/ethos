defmodule Ethos.GuidePhotosTest do
  use Ethos.DataCase, async: true

  alias Ethos.Guides
  import Ethos.GuidesFixtures

  @photo %{
    "src" => "/photos/rome/trevi-fountain.jpg",
    "thumb" => "/photos/rome/trevi-fountain_thumb.jpg",
    "title" => "Trevi Fountain",
    "description" => "Oceanus and the tritons in afternoon sun."
  }

  test "update_guide_photos/2 stores a valid photo list" do
    guide = guide_fixture()
    {:ok, guide} = Guides.update_guide_photos(guide, [@photo])
    assert [%{"title" => "Trevi Fountain"}] = guide.photos
  end

  test "rejects photos with missing fields or foreign src" do
    guide = guide_fixture()
    {:error, _} = Guides.update_guide_photos(guide, [%{"src" => "/photos/x.jpg"}])

    {:error, _} =
      Guides.update_guide_photos(guide, [Map.put(@photo, "src", "https://evil.example/x.jpg")])

    {:error, _} =
      Guides.update_guide_photos(guide, [Map.put(@photo, "src", "/photos/../secrets.jpg")])
  end

  test "rejects a photo whose source_url is an unsafe scheme" do
    guide = guide_fixture()
    photo = Map.put(@photo, "source_url", "javascript:alert(1)")

    {:error, _} = Guides.update_guide_photos(guide, [photo])
  end

  test "accepts a photo with a safe https source_url" do
    guide = guide_fixture()

    photo =
      @photo
      |> Map.put("author", "Someone")
      |> Map.put("license", "CC BY-SA 4.0")
      |> Map.put("source_url", "https://commons.wikimedia.org/wiki/File:Trevi.jpg")

    {:ok, guide} = Guides.update_guide_photos(guide, [photo])
    assert [%{"source_url" => "https://commons.wikimedia.org/wiki/File:Trevi.jpg"}] = guide.photos
  end

  test "Rome-shaped photos without attribution keys still validate" do
    guide = guide_fixture()
    {:ok, guide} = Guides.update_guide_photos(guide, [@photo])
    assert [%{"title" => "Trevi Fountain"}] = guide.photos
  end
end
