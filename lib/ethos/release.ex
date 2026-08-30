defmodule Ethos.Release do
  @moduledoc """
  Used for executing DB release tasks when run in production without Mix
  installed.
  """
  @app :ethos

  def migrate do
    load_app()

    for repo <- repos() do
      {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
    end
  end

  def rollback(repo, version) do
    load_app()
    {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :down, to: version))
  end

  def seed_rome(email) do
    load_app()
    Application.ensure_all_started(@app)

    guide = Ethos.Seeds.RomeGuide.upsert!(email)
    IO.puts("Seeded Rome guide: /g/#{guide.slug}")
  end

  def seed_connecticut(email), do: seed_region("connecticut", email)

  def seed_ballparks(email), do: seed_region("ballparks", email)

  def seed_manhattan(email), do: seed_directory("manhattan", email)

  def seed_links do
    load_app()
    Application.ensure_all_started(@app)
    count = Ethos.Seeds.BackfillLinks.upsert_all!()
    IO.puts("Upserted #{count} page links")
  end

  # Runs after the guide seeds, not before: Collections.upsert_collection!/1
  # raises on an item whose guide slug has no row yet. That now includes
  # seed_ballparks/1 — MlbBallparksCollection names all thirty ballpark guides,
  # so seed_collections/0 is no longer satisfiable by the Connecticut steps
  # alone.
  def seed_collections do
    load_app()
    Application.ensure_all_started(@app)

    collections = [
      Ethos.Seeds.BurysCollection,
      Ethos.Seeds.AntiqueTrailCollection,
      Ethos.Seeds.MlbBallparksCollection
    ]

    for mod <- collections do
      collection = mod.upsert!()
      IO.puts("Seeded collection: /c/#{collection.slug}")
    end
  end

  def seed_connecticut_expansion(email), do: seed_directory("connecticut", email)

  def seed_brooklyn(email), do: seed_directory("brooklyn", email)

  def seed_bronx(email), do: seed_directory("bronx", email)

  @doc """
  Applies the deletion manifest, removing every place it names.

  Prints two numbers, not one: a manifest of 30 that prunes 0 means either the
  prune has already run or the slugs never existed, and a single count cannot
  tell either of those apart from success.
  """
  def prune_deleted_places do
    load_app()
    Application.ensure_all_started(@app)

    slugs = Ethos.Places.DeletedPlaces.slugs() |> MapSet.to_list()
    {count, _} = Ethos.Places.delete_by_slugs!(slugs)

    IO.puts("Pruned #{count} deleted places (manifest lists #{length(slugs)})")
    count
  end

  def seed_destinations do
    load_app()
    Application.ensure_all_started(@app)

    files =
      [:code.priv_dir(@app) |> to_string(), "seed_data", "destinations", "*.json"]
      |> Path.join()
      |> Path.wildcard()
      |> Enum.sort()

    for file <- files do
      d = Ethos.Seeds.DataDestination.upsert!(file)
      IO.puts("Seeded destination: /destinations/#{d.path}")
    end

    IO.puts("Seeded #{length(files)} destinations")
  end

  # Places before guides, always: a guide's entries resolve through
  # Places.get_place_by_slug!/1 (guide_runner.ex), which raises on a place
  # nothing has seeded. Both lists come from Ethos.Seeds.Catalog rather than
  # being written out here, so a module registered once is wired everywhere —
  # and the corpus gate's reflection test fails if it is registered nowhere.
  # Everything upserts by slug, so a repeat run is a no-op.
  defp seed_region(region, email) do
    load_app()
    Application.ensure_all_started(@app)

    for {mod, _region} <- Ethos.Seeds.Catalog.place_modules(region), do: mod.upsert_all!()

    for {mod, _region} <- Ethos.Seeds.Catalog.guide_modules(region) do
      guide = mod.upsert!(email)
      IO.puts("Seeded: /g/#{guide.slug}")
    end
  end

  # Three passes over the whole directory — all places, then all guides, then
  # all links — so an entry may reference a place, and a link may reference a
  # guide, defined in any file of the run regardless of processing order.
  defp seed_directory(dir, email) do
    load_app()
    Application.ensure_all_started(@app)

    files =
      [:code.priv_dir(@app) |> to_string(), "seed_data", dir, "*.json"]
      |> Path.join()
      |> Path.wildcard()
      |> Enum.sort()

    Enum.each(files, &Ethos.Seeds.DataGuide.upsert_places!/1)

    for file <- files do
      guide = Ethos.Seeds.DataGuide.upsert_guide!(file, email)
      IO.puts("Seeded: /g/#{guide.slug}")
    end

    Enum.each(files, &Ethos.Seeds.DataGuide.upsert_links!/1)
    IO.puts("Seeded #{length(files)} files from priv/seed_data/#{dir}")
  end

  defp repos do
    Application.fetch_env!(@app, :ecto_repos)
  end

  defp load_app do
    Application.load(@app)
  end
end
