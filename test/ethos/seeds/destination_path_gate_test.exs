defmodule Ethos.Seeds.DestinationPathGateTest do
  @moduledoc """
  Every committed guide seed file names roster nodes, and no longer names the
  legacy `state`/`county`/`town` triple.

  ## Why the corpus is enumerated, not listed

  This gate used to carry `@corpora ~w(connecticut manhattan brooklyn ...)`, a
  hand-maintained list of directory names. That is exactly the shape the
  file-count guards in the London and San Francisco gates exist to defeat: a
  corpus added by another worktree is simply outside the list and never
  checked, and a corpus *renamed* leaves the loop iterating over a directory
  that no longer exists — `Path.wildcard/1` returns `[]`, every `for` body runs
  zero times, and the gate stays green while guarding nothing.

  So the file set comes from `Ethos.SeedDataHelpers.all_seed_files/0`, which
  walks `priv/seed_data/*/*.json` and excludes only the non-guide directories
  it knows by name — the same enumeration `affiliate_corpus_test.exs` and the
  per-destination gates already share. A new corpus is inside this gate the
  moment its first file lands.

  The floor below is the other half: enumeration alone still passes vacuously
  over an empty tree. It is deliberately far under the current count, because
  its job is to catch a wildcard that stopped matching, not to be re-tuned
  every time a research wave lands.
  """
  use ExUnit.Case, async: true

  alias Ethos.SeedDataHelpers

  # The committed corpus is 393 files across eight directories. A floor of 300
  # fails loudly if the enumeration breaks or a corpus is deleted, and does not
  # need editing when a wave adds files.
  @file_floor 300

  setup_all do
    roster = MapSet.new(Ethos.Seeds.DestinationTree.load!(), & &1["path"])
    %{roster: roster, files: SeedDataHelpers.all_seed_files()}
  end

  test "the corpus enumeration reaches every seed directory", %{files: files} do
    assert length(files) >= @file_floor,
           "only #{length(files)} seed files enumerated, floor is #{@file_floor} — the gates " <>
             "below are walking a corpus that has shrunk or a wildcard that has stopped " <>
             "matching, and pass vacuously either way"

    # Non-vacuity in the other direction: one directory holding everything
    # would clear the floor while every other corpus had silently dropped out.
    corpora = files |> Enum.map(&(&1 |> Path.dirname() |> Path.basename())) |> Enum.uniq()

    assert length(corpora) >= 6,
           "only #{inspect(corpora)} contribute seed files — a corpus directory has been " <>
             "renamed or removed and nothing else in this file would notice"
  end

  test "every seed file's guide and places resolve to a roster node", %{
    roster: roster,
    files: files
  } do
    for file <- files do
      data = file |> File.read!() |> Jason.decode!()

      guide_path = data["guide"]["destination_path"]
      assert is_binary(guide_path), "#{file}: guide has no destination_path"
      assert MapSet.member?(roster, guide_path), "#{file}: unknown node #{guide_path}"

      for p <- data["places"] do
        assert is_binary(p["destination_path"]), "#{file}: place #{p["slug"]} has no path"

        assert MapSet.member?(roster, p["destination_path"]),
               "#{file}: place #{p["slug"]} references unknown node #{p["destination_path"]}"
      end
    end
  end

  test "no seed file still carries the legacy triple", %{files: files} do
    for file <- files do
      data = file |> File.read!() |> Jason.decode!()

      refute Map.has_key?(data["guide"], "state"), "#{file}: guide still has state"
      refute Map.has_key?(data["guide"], "county"), "#{file}: guide still has county"

      for p <- data["places"] do
        for key <- ~w(state county town) do
          refute Map.has_key?(p, key), "#{file}: place #{p["slug"]} still has #{key}"
        end
      end
    end
  end
end
