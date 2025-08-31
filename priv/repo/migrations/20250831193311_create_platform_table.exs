defmodule CursoGuia.Repo.Migrations.CreatePlatformTable do
  use Ecto.Migration

  def change do
    create table(:platforms) do
      add :name, :string, null: false
      add :logo, :string, null: false
      add :href, :string, null: false
      timestamps()
    end
  end
end
