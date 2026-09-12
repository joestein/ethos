defmodule Ethos.Release do
  @moduledoc """
  Used for executing DB release tasks when run in production without Mix
  installed.
  """
  import Ecto.Query, warn: false

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
    # The flagship guide names `italy/lazio/rome` like every other guide in the
    # corpus and raises on a node the table does not hold, so the roster is
    # written first — the same order, and the same idempotent call,
    # `seed_directory/2` uses.
    Ethos.Seeds.DestinationTree.upsert_all!()

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
  # seed_ballparks/1 — MlbBallparksCollection names all thirty ballpark
  # guides — and, as of the four scenic-byway collections below,
  # seed_connecticut_expansion/1 (step 3): all twenty of their town guides
  # come from that JSON directory, not from the CT-5 code modules. On a
  # partial rebuild that skips or reorders step 3, the four collections above
  # seed fine and the byways raise partway through, leaving some of them
  # seeded and this step aborted.
  #
  # The SkiCollections loop below has the same hazard and the largest
  # exposure of any collection here: SkiCollections.regional/0 alone names
  # all 82 New England ski guides, every one of which exists only after
  # seed_ski/1 (step 13) has run. Its parent's curated items are a subset of
  # that same 82, so it shares the precondition rather than adding a new one.
  def seed_collections do
    load_app()
    Application.ensure_all_started(@app)

    collections = [
      Ethos.Seeds.BurysCollection,
      Ethos.Seeds.AntiqueTrailCollection,
      Ethos.Seeds.MlbBallparksCollection,
      Ethos.Seeds.KoreanBbqCollection,
      Ethos.Seeds.SteakhouseCollection
    ]

    for mod <- collections do
      collection = mod.upsert!()
      IO.puts("Seeded collection: /c/#{collection.slug}")
    end

    for collection <- Ethos.Seeds.ScenicBywaysCollections.upsert_all!() do
      IO.puts("Seeded collection: /c/#{collection.slug}")
    end

    for collection <- Ethos.Seeds.SkiCollections.upsert_all!() do
      IO.puts("Seeded collection: /c/#{collection.slug}")
    end
  end

  def seed_connecticut_expansion(email), do: seed_directory("connecticut", email)

  def seed_brooklyn(email), do: seed_directory("brooklyn", email)

  def seed_bronx(email), do: seed_directory("bronx", email)

  def seed_queens(email), do: seed_directory("queens", email)

  @doc """
  Seeds the rione and quartiere corpus under `priv/seed_data/rome/`.

  Distinct from `seed_rome/1`, which seeds only the "3 Days in Rome" flagship
  guide from `Ethos.Seeds.RomeGuide`. The two are separate because the flagship
  predates the neighbourhood programme by months and creates no place records
  at all, so neither is a precondition of the other.

  Rome zone files link to `three-days-in-rome-real-trip-guide`, though, and
  `Links.resolve!/1` raises on an unknown target — aborting the run partway
  through, since seeding is not transactional. So `seed_rome/1` must have run
  at least once against this database before this does.
  """
  def seed_rome_zones(email) do
    seed_rome(email)
    seed_directory("rome", email)
  end

  @doc """
  Seeds the San Francisco neighborhood corpus under `priv/seed_data/san_francisco/`.

  `seed_ballparks/1` runs first and is a genuine precondition rather than a
  convenience. `Ethos.Seeds.OracleParkPlaces` already owns seven places with
  town "San Francisco" — the ballpark, Red's Java House, Momo's, China Basin
  Park and three Mission Rock cafés — so the Mission Bay guide links to
  `guide:oracle-park-guide` instead of restating them, the way Concourse links
  to Yankee Stadium and Flushing to Citi Field. `Links.resolve!/1` raises on an
  unknown target and seeding is not transactional, so without this the San
  Francisco link pass aborts partway, leaving earlier files published.
  """
  def seed_san_francisco(email) do
    seed_ballparks(email)
    seed_directory("san_francisco", email)
  end

  @doc """
  Seeds the London borough corpus under `priv/seed_data/london/`.

  Plain, with no precondition, and that is worth stating because the two
  seeders above it both have one. Rome's zone files link to a flagship guide
  that a code seed owns; San Francisco's Mission Bay file links to Oracle
  Park's. Nothing in `lib/ethos/seeds/` owns a London place or guide, so every
  target a London file can name is either inside the same directory or inside
  the same file, and `Links.resolve!/1` has nothing to raise on.

  The day that changes — a flagship "3 Days in London" the way Rome has one —
  this gains a call the way `seed_rome_zones/1` did, and the release test's
  published-guide assertion is where the omission would surface.
  """
  def seed_london(email), do: seed_directory("london", email)

  @doc """
  Seeds the Korean BBQ collection's guides under `priv/seed_data/korean_bbq/`.

  MUST RUN AFTER every destination whose neighborhood files own places these
  guides reach by entry — Manhattan, Queens, Brooklyn, San Francisco and
  London. `GuideRunner.replace_entries!/2` resolves each entry through
  `Places.get_place_by_slug!/1`, which raises rather than skipping, and seeding
  is not transactional, so a missing place aborts the run partway and leaves
  earlier guides published.

  That ordering is not enforceable from here — these files reference places in
  five other directories, and calling all five would re-seed a thousand guides
  on every run. It is stated instead, and the release test that follows the
  corpus asserts the entries resolve.
  """
  def seed_korean_bbq(email), do: seed_directory("korean_bbq", email)

  def seed_steakhouse(email), do: seed_directory("steakhouse", email)

  @doc """
  Seeds the US ski corpus under `priv/seed_data/ski/`.

  One file per operating ski area, each carrying the mountain as a `ski-area`
  place plus whatever is verifiably around it. Scope is
  `priv/seed_data/ski_areas_roster.json`, and
  `test/ethos/seeds/ski_seed_data_test.exs` asserts the roster and the corpus
  agree in both directions — a roster row with no file fails, and a file with
  no roster row fails.

  **Preconditions are the nodes, not other corpora.** Unlike
  `seed_steakhouse/1`, which must follow six other steps because its `"links"`
  edges name guides in six other corpora, the New England round's `nearby`
  links are all between ski guides in this same directory, and
  `seed_directory/2`'s third pass runs after every guide in the run has been
  published. What this step genuinely needs is the destination tree, which it
  seeds itself on the line below — every area sits on a New England town or
  county node, and roughly all of them were added by this project.

  The day a ski file links outward — to a Vermont town guide, or to a ballpark
  in a later region — that becomes a documented ordering constraint in
  `docs/runbooks/seeding.md` like step 12's, because `Links.resolve!/1` raises
  on a target nothing has seeded and seeding is not transactional.
  """
  def seed_ski(email), do: seed_directory("ski", email)

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

  def seed_destination_tree do
    load_app()
    Application.ensure_all_started(@app)
    count = Ethos.Seeds.DestinationTree.upsert_all!()
    IO.puts("Seeded #{count} destination nodes")
  end

  @doc """
  Writes the foliage route link edges and reports any route stop whose guide
  has been unpublished or renamed.

  Production runs a release, not Mix, so this is the only way to invoke either
  of these after a deploy.
  """
  def foliage_links do
    load_app()
    Application.ensure_all_started(@app)

    :ok = Ethos.Foliage.LinkBuilder.build!()

    published =
      Ethos.Repo.all(
        from(g in Ethos.Guides.Guide, where: g.status == "published", select: g.slug)
      )
      |> MapSet.new()

    Ethos.Foliage.Dataset.warn_dangling_guides(published)
  end

  @doc """
  Writes the town-adjacency `nearby` edges.

  Production runs a release, not Mix, so this is the only way to invoke the
  link builder after a deploy.
  """
  def adjacency_links do
    load_app()
    Application.ensure_all_started(@app)

    :ok = Ethos.Adjacency.LinkBuilder.build!()
  end

  @doc """
  Overlays the curated hub pages in `priv/seed_data/destinations/` onto the
  nodes they belong to — fifteen files today, and the loop below reports the
  count it actually found rather than trusting this sentence.

  Each file is keyed on a real node path, so this adds an intro and photos to a
  row the roster already owns rather than creating one. That is the whole point
  of the keys being what they are: when they were the pre-tree single-slug forms
  ("connecticut", "rome") this created one *extra* row per file with no `kind`
  and no `parent_id`, which surfaced as fifteen dead redirects, fifteen bogus
  sitemap entries and Connecticut, New York and Rome listed as countries on
  `/destinations`.

  Seeds the roster first, the way every other seeder does, so it stays true that
  this step can run at any point in the order — including against a database
  that has never seen the tree.
  """
  def seed_destinations do
    load_app()
    Application.ensure_all_started(@app)
    Ethos.Seeds.DestinationTree.upsert_all!()

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
    Ethos.Seeds.DestinationTree.upsert_all!()

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
    Ethos.Seeds.DestinationTree.upsert_all!()

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
