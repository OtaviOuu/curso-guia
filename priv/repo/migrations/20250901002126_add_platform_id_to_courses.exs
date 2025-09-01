defmodule CursoGuia.Repo.Migrations.AddPlatformIdToCourses do
  use Ecto.Migration

  def change do
    alter table(:courses) do
      add :platform_id, references(:platforms, on_delete: :nothing)
    end
  end
end
