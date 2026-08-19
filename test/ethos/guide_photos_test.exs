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
end
