defmodule Ethos.PhotoManifestTest do
  use ExUnit.Case, async: true

  @moduletag :tmp_dir

  setup %{tmp_dir: tmp} do
    image_path = Path.join(tmp, "some-photo.jpg")
    File.write!(image_path, "fake image bytes")
    sha256 = :crypto.hash(:sha256, "fake image bytes") |> Base.encode16(case: :lower)

    manifest_path = Path.join(tmp, "manifest.json")

    File.write!(
      manifest_path,
      Jason.encode!(%{"some-photo" => %{"sha256" => sha256}})
    )

    %{image_path: image_path, manifest_path: manifest_path, sha256: sha256}
  end

  test "raises when the label is absent from the manifest", %{
    manifest_path: manifest_path,
    image_path: image_path
  } do
    assert_raise RuntimeError, ~r/not in .* — regenerate the manifest/, fn ->
      Ethos.PhotoManifest.verify!(manifest_path, "missing-label", image_path)
    end
  end

  test "raises when the file hash does not match the recorded sha256", %{
    manifest_path: manifest_path,
    image_path: image_path
  } do
    File.write!(image_path, "different bytes entirely")

    assert_raise RuntimeError, ~r/does not match the image recorded for/, fn ->
      Ethos.PhotoManifest.verify!(manifest_path, "some-photo", image_path)
    end
  end

  test "passes when the label is present and the hash matches", %{
    manifest_path: manifest_path,
    image_path: image_path
  } do
    assert :ok = Ethos.PhotoManifest.verify!(manifest_path, "some-photo", image_path)
  end
end
