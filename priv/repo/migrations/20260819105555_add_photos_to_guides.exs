defmodule Ethos.Repo.Migrations.AddPhotosToGuides do
  use Ecto.Migration

  def change do
    alter table(:guides) do
      add :photos, {:array, :map}
    end
  end
end
