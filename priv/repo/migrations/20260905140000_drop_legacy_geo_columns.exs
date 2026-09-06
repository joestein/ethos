defmodule Ethos.Repo.Migrations.DropLegacyGeoColumns do
  use Ecto.Migration

  def change do
    # The FTS index reads places.town, so it is rebuilt without it. Guides' FTS
    # index does not reference any dropped column.
    execute "DROP INDEX places_fts_idx",
            "CREATE INDEX places_fts_idx ON places USING GIN (to_tsvector('english', coalesce(name,'') || ' ' || coalesce(town,'') || ' ' || coalesce(summary,'') || ' ' || coalesce(history,'')))"

    alter table(:guides) do
      remove :state, :string
      remove :state_slug, :string
      remove :county, :string
      remove :county_slug, :string
    end

    alter table(:places) do
      remove :town, :string
      remove :town_slug, :string
      remove :state, :string
      remove :state_slug, :string
      remove :county, :string
      remove :county_slug, :string
    end

    execute "CREATE INDEX places_fts_idx ON places USING GIN (to_tsvector('english', coalesce(name,'') || ' ' || coalesce(summary,'') || ' ' || coalesce(history,'')))",
            "DROP INDEX places_fts_idx"

    # `places.town` was in the vector above, so searching "Waterbury" used to
    # return that town's places. Geography now lives on the node a place points
    # at, and a Postgres index expression may only reference columns of the
    # table it indexes — there is no way to fold `destinations.name` into
    # `places_fts_idx`. So the node's name is indexed on its own table and
    # `Ethos.Search.search_places/2` matches the two vectors with an `OR` across
    # the join, which lets each branch use its own index. Dropping this index
    # does not break search, only its plan.
    execute "CREATE INDEX destinations_fts_idx ON destinations USING GIN (to_tsvector('english', coalesce(name,'')))",
            "DROP INDEX destinations_fts_idx"

    # Every destination row that predates the tree. `kind` was added nullable by
    # 20260905123000 and nothing backfills it, so on any database carrying
    # content — production, a restored backup, a staging box seeded before this
    # branch — the `SET NOT NULL` below aborts the migration with
    # `column "kind" contains null values`. `fly.toml` runs migrations as the
    # release command, before any seeding, so that failure rolls the deploy back.
    #
    # These rows are also wrong even where they do not block the migration.
    # They are the thirteen curated hub records keyed on pre-tree paths
    # (`connecticut`, `rome`, `new-york/manhattan`) that ruling C24 retired:
    # parentless, kindless rows shadowing the URLs a node's 301 now owns, in the
    # sitemap, and listed on `/destinations` as countries beside the real roots.
    # `DestinationTree.upsert_all!/0` keys on `path` and never deletes, so
    # re-seeding cannot remove them — the deletion has to happen here.
    #
    # Safe: `guides.destination_id` and `places.destination_id` are
    # `nilify_all`, and both are still NULL at this point in the deploy (the
    # seeders that set them have not run yet), so nothing is orphaned. The
    # roster recreates every node and the thirteen overlay files put their
    # curated prose and photos back onto it — see docs/runbooks/seeding.md.
    #
    # Irreversible by design: the down direction restores the nullability, not
    # the rows. Re-seeding is what restores content.
    execute "DELETE FROM destinations WHERE kind IS NULL", ""

    execute "ALTER TABLE destinations ALTER COLUMN kind SET NOT NULL",
            "ALTER TABLE destinations ALTER COLUMN kind DROP NOT NULL"
  end
end
