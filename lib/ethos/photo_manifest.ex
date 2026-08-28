defmodule Ethos.PhotoManifest do
  @moduledoc """
  Loads a photo provenance manifest and verifies that a source image on disk
  matches the Commons file recorded for its label.

  Source images resolve by bare label, so the wrong file under that name would
  publish a real photo carrying another image's author and licence credit. The
  manifest pins each label to the Commons file it was downloaded from — one
  manifest per destination (Connecticut, Brooklyn, ...), each keyed by its own
  path so their caches never collide.
  """

  @doc """
  Raises unless `label` is present in the manifest at `manifest_path` and its
  recorded sha256 matches the file at `image_path`.
  """
  @spec verify!(String.t(), String.t(), String.t()) :: :ok
  def verify!(manifest_path, label, image_path) do
    case manifest(manifest_path)[label] do
      nil ->
        raise "#{label} is not in #{manifest_path} — regenerate the manifest"

      %{"sha256" => expected} ->
        actual = :crypto.hash(:sha256, File.read!(image_path)) |> Base.encode16(case: :lower)

        if actual != expected do
          raise "#{image_path} does not match the image recorded for #{label} " <>
                  "(expected #{String.slice(expected, 0, 12)}…, got #{String.slice(actual, 0, 12)}…). " <>
                  "The published author and licence would credit the wrong photo."
        end

        :ok
    end
  end

  defp manifest(manifest_path) do
    case :persistent_term.get({__MODULE__, manifest_path}, nil) do
      nil ->
        data = manifest_path |> File.read!() |> Jason.decode!()
        :persistent_term.put({__MODULE__, manifest_path}, data)
        data

      data ->
        data
    end
  end
end
