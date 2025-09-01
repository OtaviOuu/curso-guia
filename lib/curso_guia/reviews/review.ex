defmodule CursoGuia.Reviews.Review do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviews" do
    field :rating, :integer
    field :comment, :string
    belongs_to :course, CursoGuia.Courses.Course
    belongs_to :user, CursoGuia.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, [:rating, :comment, :course_id, :user_id])
    |> validate_required([:rating, :course_id, :user_id])
  end
end
