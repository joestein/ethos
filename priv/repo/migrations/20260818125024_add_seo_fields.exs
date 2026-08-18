defmodule Ethos.Repo.Migrations.AddSeoFields do
  use Ecto.Migration

  def change do
    alter table(:guides) do
      add :intro, :text
      add :sections, {:array, :map}
      add :faq, {:array, :map}
      add :destination_slug, :string
    end

    alter table(:entries) do
      add :booking_url, :string
      add :booking_label, :string
    end

    create index(:guides, [:destination_slug])

    execute(
      """
      UPDATE guides SET destination_slug =
        trim(both '-' from regexp_replace(lower(split_part(destination, ',', 1)), '[^a-z0-9]+', '-', 'g'))
      """,
      "SELECT 1"
    )
  end
end
