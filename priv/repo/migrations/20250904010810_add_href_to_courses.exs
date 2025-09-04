defmodule CursoGuia.Repo.Migrations.AddHrefToCourses do
  use Ecto.Migration

  def change do
    alter table(:courses) do
      add :href, :string
    end
  end
end
