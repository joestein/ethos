defmodule Ethos.Repo.Migrations.FixPageLinksIndexName do
  use Ecto.Migration

  def change do
    # Drop the auto-truncated index and recreate with explicit short name
    drop_if_exists unique_index(:page_links, [
                     :source_type,
                     :source_id,
                     :target_type,
                     :target_id,
                     :kind
                   ])

    create_if_not_exists unique_index(
                           :page_links,
                           [:source_type, :source_id, :target_type, :target_id, :kind],
                           name: :page_links_edge_index
                         )
  end
end
