defmodule Ethos.SeedDataHelpers do
  @moduledoc """
  Assertions shared by every destination's seed-data test.

  `places` carries a global `unique_index(:places, [:slug])`, so a slug used by
  two destinations fails at seed time in production — partway through a run
  that is not transactional, leaving earlier files published and later ones
  unseeded. Each destination test used to hardcode the sibling directories it
  compared against, so adding a destination silently narrowed the check. This
  walks every seed directory instead, and stays correct as destinations are
  added.
  """
  import ExUnit.Assertions

  alias Ethos.Seeds.DataGuide

  @seed_data_root Path.expand("../../priv/seed_data", __DIR__)

  @doc "Sorted absolute paths of a destination's committed seed files."
  def seed_files(destination) do
    @seed_data_root
    |> Path.join("#{destination}/*.json")
    |> Path.wildcard()
    |> Enum.sort()
  end

  # priv/seed_data/destinations/ holds destination-page records — a path, a
  # name, an intro and photos, with no guide, places or entries — so
  # DataGuide.load!/1 raises "missing guide/places/entries keys" on them. They
  # define no place slugs and have nothing to contribute to the checks below;
  # they are validated by test/ethos/seeds/destination_seed_data_test.exs.
  # Excluded by directory rather than by shape, so that a future non-guide
  # directory fails loudly here instead of being silently skipped.
  @non_guide_dirs ["destinations"]

  @doc "Every guide seed file in every guide-corpus directory."
  def all_seed_files do
    @seed_data_root
    |> Path.join("*/*.json")
    |> Path.wildcard()
    |> Enum.reject(fn f -> Path.basename(Path.dirname(f)) in @non_guide_dirs end)
    |> Enum.sort()
  end

  # The code half of the place corpus.
  #
  # No corpus-wide gate discovers an Elixir seed module; each one used to name
  # `Ethos.Seeds.ConnecticutPlaces` by hand, in four separate places across
  # three files (docs/site-builder.md §1). Four hardcoded lists drift apart,
  # and a module named by three of them is scanned by three of them — which
  # reads exactly like being covered. They all read this list now, so adding a
  # places module is one edit.
  #
  # Each entry carries its own region and file because the callers report
  # ownership, not just membership: the duplicate report below names the file
  # a colliding slug came from, and the bare-places roster is checked on the
  # whole {slug, name, region, seed_file} tuple. A report that names the wrong
  # file is worse than no report — it sends the reader to a file that does not
  # contain the slug.
  @code_place_modules [
    {Ethos.Seeds.ConnecticutPlaces, "connecticut", "lib/ethos/seeds/connecticut_places.ex"},
    {Ethos.Seeds.BallparkPlaces, "ballparks", "lib/ethos/seeds/ballpark_places.ex"}
  ]

  @doc """
  Every place defined in an Elixir seed module, paired with its owner.

  Yields `{place, owner}` tuples. `place` carries **atom** keys — the code half
  of the corpus is atom-keyed and the JSON half is string-keyed, and each half
  is read through its own accessor rather than one normalising pass. `owner` is
  `%{region: binary, seed_file: binary}`, the seed file being repo-relative.
  """
  def code_places do
    for {mod, region, seed_file} <- @code_place_modules,
        place <- mod.places(),
        do: {place, %{region: region, seed_file: seed_file}}
  end

  @doc """
  Asserts each place slug is defined exactly once across the whole corpus:
  every `priv/seed_data/*/*.json` file plus every code-defined places module.
  """
  def assert_place_slugs_globally_unique! do
    json_owned =
      for f <- all_seed_files(),
          p <- DataGuide.load!(f)["places"],
          # Directory-qualified: two destinations may hold the same basename,
          # which would otherwise hide a genuine cross-destination collision.
          do: {p["slug"], Path.join(Path.basename(Path.dirname(f)), Path.basename(f))}

    code_owned =
      for {p, owner} <- code_places(), do: {p.slug, Path.basename(owner.seed_file)}

    dups =
      (json_owned ++ code_owned)
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
      # length/1, not uniq — two places sharing a slug inside ONE file collide too.
      |> Enum.filter(fn {_slug, owners} -> length(owners) > 1 end)

    assert dups == [], "place slugs with multiple owners: #{inspect(dups)}"
  end
end
