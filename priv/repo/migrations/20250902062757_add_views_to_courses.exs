defmodule CursoGuia.Repo.Migrations.AddViewsToCourses do
  use Ecto.Migration

  def change do
    alter table(:courses) do
      add :views, :integer, default: 0
    end
  end
end
