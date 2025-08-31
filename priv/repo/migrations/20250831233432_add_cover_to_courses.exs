defmodule CursoGuia.Repo.Migrations.AddCoverToCourses do
  use Ecto.Migration

  def change do
    alter table(:courses) do
      add :cover, :string
    end
  end
end
