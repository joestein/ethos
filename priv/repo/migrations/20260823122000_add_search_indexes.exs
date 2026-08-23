defmodule Ethos.Repo.Migrations.AddSearchIndexes do
  use Ecto.Migration

  def up do
    execute """
    CREATE INDEX guides_fts_idx ON guides USING GIN (
      to_tsvector('english', coalesce(title,'') || ' ' || coalesce(destination,'') || ' ' || coalesce(intro,''))
    )
    """

    execute """
    CREATE INDEX places_fts_idx ON places USING GIN (
      to_tsvector('english', coalesce(name,'') || ' ' || coalesce(town,'') || ' ' || coalesce(summary,'') || ' ' || coalesce(history,''))
    )
    """
  end

  def down do
    execute "DROP INDEX guides_fts_idx"
    execute "DROP INDEX places_fts_idx"
  end
end
