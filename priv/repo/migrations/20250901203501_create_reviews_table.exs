defmodule CursoGuia.Repo.Migrations.CreateReviewsTable do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :rating, :integer, null: false
      add :comment, :text
      add :course_id, references(:courses, on_delete: :delete_all), null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end
