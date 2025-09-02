defmodule CursoGuia.Repo.Migrations.AddRatingToCourses do
  use Ecto.Migration

  def change do
    alter table(:courses) do
      add :rating, :integer
    end
  end
end
