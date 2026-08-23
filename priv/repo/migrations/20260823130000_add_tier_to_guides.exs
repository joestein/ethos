defmodule Ethos.Repo.Migrations.AddTierToGuides do
  use Ecto.Migration

  def change do
    alter table(:guides) do
      add :tier, :string, null: false, default: "guide"
    end

    create constraint(:guides, :guides_tier_check, check: "tier in ('guide', 'town-page')")
  end
end
