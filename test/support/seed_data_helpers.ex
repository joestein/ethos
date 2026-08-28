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

  @doc "Every seed file in every destination directory."
  def all_seed_files do
    @seed_data_root
    |> Path.join("*/*.json")
    |> Path.wildcard()
    |> Enum.sort()
  end

  @doc """
  Asserts each place slug is defined exactly once across the whole corpus:
  every `priv/seed_data/*/*.json` file plus the Connecticut code module.
  """
  def assert_place_slugs_globally_unique! do
    json_owned =
      for f <- all_seed_files(),
          p <- DataGuide.load!(f)["places"],
          # Directory-qualified: two destinations may hold the same basename,
          # which would otherwise hide a genuine cross-destination collision.
          do: {p["slug"], Path.join(Path.basename(Path.dirname(f)), Path.basename(f))}

    code_owned =
      for p <- Ethos.Seeds.ConnecticutPlaces.places(), do: {p.slug, "connecticut_places.ex"}

    dups =
      (json_owned ++ code_owned)
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
      # length/1, not uniq — two places sharing a slug inside ONE file collide too.
      |> Enum.filter(fn {_slug, owners} -> length(owners) > 1 end)

    assert dups == [], "place slugs with multiple owners: #{inspect(dups)}"
  end
end
