defmodule Ethos.Seeds.PlaceContentGateTest do
  @moduledoc """
  The content gate every research wave must pass.

  ## There is no minimum word count here, and none may be added

  A length floor is the obvious way to enforce "no more thin summaries", and it
  would manufacture the exact defect this gate exists to ban: roughly twenty
  summaries in this corpus read as inspection-record boilerplate *because
  something had to fill the space*. The two content assertions below ban
  **patterns**, not brevity. A seven-word summary that says the one true thing
  is a pass.

  ## Why two of these are excluded by default

  The two content assertions carry `@tag :pending_wave`, excluded in
  `test/test_helper.exs`. They fail on today's corpus — that is the gate
  working, and those failures are the work list the research waves consume. A
  red baseline would make every later task's test run ambiguous: an implementer
  could not tell their own regression from the expected failure. Re-enable them
  (delete the tags and the exclusion) once the waves have rewritten the prose.

  Run them meanwhile with:

      mix test test/ethos/seeds/place_content_gate_test.exs --include pending_wave

  The other two assertions pass today and run by default. They protect the
  deletion machinery while the waves are in flight.
  """
  use ExUnit.Case, async: true

  alias Ethos.Places.DeletedPlaces
  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.ConnecticutPlaces
  alias Ethos.Seeds.DataGuide

  # Inspection records may support a `status` verdict. They may never appear in
  # prose — 20 summaries in this corpus read as boilerplate precisely because
  # that rule did not exist when they were written.
  @inspection ~r/inspection record|restaurant inspection|inspection dated/i

  # "A restaurant on Bath Avenue, at number 1806." — a stub wearing a sentence.
  @stub ~r/^A [a-z][a-z -]* (?:on|at) [^,]+,\s*at number \d+\.?$/

  @code_seed_file "connecticut_places.ex"

  # Places arrive in two key shapes, and conflating them has bitten this project
  # before: the `"places"` array of each guide seed file has **string** keys,
  # while `ConnecticutPlaces.places/0` has **atom** keys. A string-key read of
  # those 50 records silently yields nil for every field, which would make this
  # gate pass over them in silence. Following the precedent set by
  # `Mix.Tasks.Ethos.BarePlaces`, each source is read through its own accessor
  # rather than through one normalising pass, and both are flattened here to the
  # only two fields the gate needs.
  #
  # Note also that this comprehension has no filters. In Elixir a comprehension
  # binding is *also* a truthiness test, so `summary = p["summary"]` would
  # silently drop every place with a nil summary — the elements an assertion
  # about summaries most needs to see. Both branches default explicitly instead,
  # and every filter lives in the tests below where it reads as a filter.
  defp corpus do
    json =
      for f <- SeedDataHelpers.all_seed_files(),
          p <- DataGuide.load!(f)["places"],
          do: {p["slug"], p["summary"] || "", Path.basename(f)}

    code =
      for p <- ConnecticutPlaces.places(),
          do: {p[:slug], p[:summary] || "", @code_seed_file}

    json ++ code
  end

  defp corpus_slugs, do: MapSet.new(for {slug, _summary, _f} <- corpus(), do: slug)

  @tag :pending_wave
  test "no summary repeats inspection-record boilerplate" do
    hits =
      for {slug, summary, file} <- corpus(),
          Regex.match?(@inspection, summary),
          do: {slug, file}

    assert hits == [], "inspection-record prose in: #{inspect(hits)}"
  end

  @tag :pending_wave
  test "no summary is a bare address stub" do
    hits =
      for {slug, summary, file} <- corpus(),
          Regex.match?(@stub, String.trim(summary)),
          do: {slug, file}

    assert hits == [], "bare address stubs in: #{inspect(hits)}"
  end

  test "every guide entry points at a place that exists" do
    slugs = corpus_slugs()

    orphans =
      for f <- SeedDataHelpers.all_seed_files(),
          e <- DataGuide.load!(f)["entries"] || [],
          slug = e["place_slug"] || "",
          slug != "",
          not MapSet.member?(slugs, slug),
          do: {slug, Path.basename(f)}

    assert orphans == [],
           "guide entries point at places that do not exist: #{inspect(orphans)}"
  end

  test "a deleted place is gone from the corpus, and a corpus place is not marked deleted" do
    both = MapSet.intersection(corpus_slugs(), DeletedPlaces.slugs())

    assert MapSet.size(both) == 0,
           """
           slugs both live in the corpus and listed as deleted: \
           #{inspect(MapSet.to_list(both))}

           Removing a place and recording it as deleted are two halves of ONE
           change: delete it from its seed file AND add it to
           priv/seed_data/deleted_places.json. The half above is missing.

           This is not cosmetic. Ethos.Release.prune_deleted_places/0 runs after
           seeding, and seeding is upsert-only — so a manifest entry whose place
           is still in a seed file gets re-created by every seed run and deleted
           again by every prune, indefinitely. Drop these slugs from their seed
           files, or drop them from the manifest.\
           """
  end
end
