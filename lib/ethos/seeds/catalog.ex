defmodule Ethos.Seeds.Catalog do
  @moduledoc """
  The one list of every seed module written in Elixir.

  No corpus-wide gate discovers an Elixir seed module — each one used to name
  modules by hand, and the lists drifted. A module named by three of four
  gates is scanned by three of four, which reads exactly like being covered.
  Everything that needs to know what the code corpus contains reads this:
  the four place gates (through `Ethos.SeedDataHelpers.code_places/0`), the
  corpus loader gate, `Ethos.Release`, `Mix.Tasks.Ethos.BarePlaces`, and the
  duration scan over module source.

  It lives in `lib/` rather than `test/support/` because
  `Mix.Tasks.Ethos.BarePlaces` is not a test and cannot reach test support —
  which is how that task kept its own private copy of the list and quietly
  omitted every place outside Connecticut from the roster it generates.

  ## Why registration must be mechanical

  A guide added here and nowhere else is fully wired. A guide added to
  `Ethos.Release` but *not* here loses all loader and changeset validation and
  its destination path never enters the corpus gate's legitimate-path set; a
  guide added to neither fails nothing at all. Across a thirty-site set that
  is thirty chances to skip a registration silently, so
  `destination_seed_data_test.exs` asserts by reflection that every
  `Ethos.Seeds.*Guide` module in the application appears in `guide_modules/0`.
  That assertion found `AntiqueTrailGuide`, which had been missing from the
  corpus loader gate since it shipped.

  ## Regions

  `region` groups modules for the seed functions and for the per-region source
  scans; it is also the `region` field of the bare-places roster. It is a
  grouping key, not a geography: `"ballparks"` spans states by design.
  """

  @place_modules [
    {Ethos.Seeds.ConnecticutPlaces, "connecticut"},
    {Ethos.Seeds.WrigleyFieldPlaces, "ballparks"},
    {Ethos.Seeds.FenwayParkPlaces, "ballparks"},
    {Ethos.Seeds.YankeeStadiumPlaces, "ballparks"},
    {Ethos.Seeds.CitiFieldPlaces, "ballparks"},
    {Ethos.Seeds.DodgerStadiumPlaces, "ballparks"},
    {Ethos.Seeds.OracleParkPlaces, "ballparks"},
    {Ethos.Seeds.BuschStadiumPlaces, "ballparks"},
    {Ethos.Seeds.OrioleParkAtCamdenYardsPlaces, "ballparks"},
    {Ethos.Seeds.NationalsParkPlaces, "ballparks"},
    {Ethos.Seeds.RogersCentrePlaces, "ballparks"},
    {Ethos.Seeds.SutterHealthParkPlaces, "ballparks"}
  ]

  # Order is seed order and is load-bearing for Connecticut: the Antique Trail
  # guide's entries point at places the town guides' module seeds, and
  # `Ethos.Release.seed_connecticut/1` has always run it last.
  @guide_modules [
    {Ethos.Seeds.WaterburyGuide, "connecticut"},
    {Ethos.Seeds.MiddleburyGuide, "connecticut"},
    {Ethos.Seeds.DanburyGuide, "connecticut"},
    {Ethos.Seeds.SouthburyGuide, "connecticut"},
    {Ethos.Seeds.WoodburyGuide, "connecticut"},
    {Ethos.Seeds.AntiqueTrailGuide, "connecticut"},
    {Ethos.Seeds.RomeGuide, "rome"},
    {Ethos.Seeds.WrigleyFieldGuide, "ballparks"},
    {Ethos.Seeds.FenwayParkGuide, "ballparks"},
    {Ethos.Seeds.YankeeStadiumGuide, "ballparks"},
    {Ethos.Seeds.CitiFieldGuide, "ballparks"},
    {Ethos.Seeds.DodgerStadiumGuide, "ballparks"},
    {Ethos.Seeds.OracleParkGuide, "ballparks"},
    {Ethos.Seeds.BuschStadiumGuide, "ballparks"},
    {Ethos.Seeds.OrioleParkAtCamdenYardsGuide, "ballparks"},
    {Ethos.Seeds.NationalsParkGuide, "ballparks"},
    {Ethos.Seeds.RogersCentreGuide, "ballparks"},
    {Ethos.Seeds.SutterHealthParkGuide, "ballparks"}
  ]

  @doc "Every places module, as `{module, region}`."
  def place_modules, do: @place_modules

  @doc "Every places module in one region."
  def place_modules(region), do: for({m, r} <- @place_modules, r == region, do: {m, r})

  @doc "Every guide module, as `{module, region}`, in seed order."
  def guide_modules, do: @guide_modules

  @doc "Every guide module in one region, in seed order."
  def guide_modules(region), do: for({m, r} <- @guide_modules, r == region, do: {m, r})

  @doc """
  Every place defined in an Elixir seed module, paired with its owner.

  Yields `{place, owner}` tuples. `place` carries **atom** keys — the code half
  of the corpus is atom-keyed and the JSON half is string-keyed, and each half
  is read through its own accessor rather than one normalising pass. `owner` is
  `%{region: binary, seed_file: binary}`.

  Owner is carried rather than discarded because callers report *ownership*,
  not just membership: the duplicate-slug report names the file a colliding
  slug came from, and a report naming the wrong file is worse than none — it
  sends the reader to a file that does not contain the slug.
  """
  def places_owned do
    for {mod, region} <- @place_modules,
        place <- mod.places(),
        do: {place, %{region: region, seed_file: source_path(mod)}}
  end

  @doc """
  The repo-relative source path of a seed module, derived from its name.

  Derived rather than written down beside each module, because a literal path
  can drift from the module it labels and nothing would notice. A test asserts
  every derived path exists on disk, which is what makes the derivation safe.
  """
  def source_path(module) do
    "lib/" <> (module |> inspect() |> Macro.underscore()) <> ".ex"
  end

  @doc "Repo-relative source paths of every place and guide module in a region."
  def source_paths(region) do
    (place_modules(region) ++ guide_modules(region))
    |> Enum.map(fn {mod, _r} -> source_path(mod) end)
    |> Enum.sort()
  end
end
