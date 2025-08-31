defmodule CursoGuia.Repo.Migrations.CreateCoursesTable do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add :title, :string
      add :description, :string
      add :price, :integer
      timestamps()
    end
  end
end
