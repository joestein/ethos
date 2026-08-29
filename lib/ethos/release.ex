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

  def seed_connecticut(email) do
    load_app()
    Application.ensure_all_started(@app)

    Ethos.Seeds.ConnecticutPlaces.upsert_all!()

    for mod <- [
          Ethos.Seeds.WaterburyGuide,
          Ethos.Seeds.MiddleburyGuide,
          Ethos.Seeds.DanburyGuide,
          Ethos.Seeds.SouthburyGuide,
          Ethos.Seeds.WoodburyGuide
        ] do
      guide = mod.upsert!(email)
      IO.puts("Seeded: /g/#{guide.slug}")
    end
  end

  def seed_manhattan(email), do: seed_directory("manhattan", email)

  def seed_links do
    load_app()
    Application.ensure_all_started(@app)
    count = Ethos.Seeds.BackfillLinks.upsert_all!()
    IO.puts("Upserted #{count} page links")
  end

  def seed_collections do
    load_app()
    Application.ensure_all_started(@app)
    collection = Ethos.Seeds.BurysCollection.upsert!()
    IO.puts("Seeded collection: /c/#{collection.slug}")
  end

  def seed_connecticut_expansion(email), do: seed_directory("connecticut", email)

  def seed_brooklyn(email), do: seed_directory("brooklyn", email)

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
