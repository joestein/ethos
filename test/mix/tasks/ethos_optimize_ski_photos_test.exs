defmodule Mix.Tasks.Ethos.OptimizeSkiPhotosTest do
  use ExUnit.Case, async: true

  # Running the real optimizer needs source images on disk, which the corpus
  # does not have until a wave lands. What is worth pinning without them is the
  # contract every wave depends on: the task exists, it exits zero rather than
  # raising against an empty corpus, and the manifest it reads is well-formed
  # JSON in the shape PhotoManifest.verify!/3 expects.
  test "the task is registered" do
    assert Mix.Task.get("ethos.optimize_ski_photos")
  end

  test "the manifest is an object of label => {sha256, source_url}" do
    manifest =
      ["priv", "seed_data", "ski_photo_manifest.json"]
      |> Path.join()
      |> File.read!()
      |> Jason.decode!()

    assert is_map(manifest)

    for {label, entry} <- manifest do
      assert label =~ ~r/^[a-z0-9-]+$/, "#{label} is not a kebab-case label"

      assert entry["sha256"] =~ ~r/^[0-9a-f]{64}$/,
             "#{label}: sha256 is #{inspect(entry["sha256"])}"

      assert String.starts_with?(entry["source_url"] || "", "https://commons.wikimedia.org/"),
             "#{label}: source_url is not Commons"
    end
  end

  # Every photo the corpus publishes must have a manifest row, or the task
  # raises mid-run and a wave commits a src pointing at a file nothing wrote.
  test "every published photo has a manifest row" do
    manifest =
      ["priv", "seed_data", "ski_photo_manifest.json"]
      |> Path.join()
      |> File.read!()
      |> Jason.decode!()

    labels =
      for file <- Path.wildcard(Path.join(["priv", "seed_data", "ski", "*.json"])),
          doc = file |> File.read!() |> Jason.decode!(),
          photo <- doc["guide"]["photos"] || [],
          do: {Path.basename(file), photo["src"] |> Path.basename() |> Path.rootname()}

    missing =
      for {file, label} <- labels, not Map.has_key?(manifest, label), do: "#{file}: #{label}"

    assert missing == [],
           "these published photos have no provenance row in the manifest: #{inspect(missing)}"
  end
end
