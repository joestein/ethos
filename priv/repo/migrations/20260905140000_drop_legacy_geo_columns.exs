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

    execute "ALTER TABLE destinations ALTER COLUMN kind SET NOT NULL",
            "ALTER TABLE destinations ALTER COLUMN kind DROP NOT NULL"
  end
end
