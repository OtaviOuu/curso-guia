defmodule CursoGuia.Reviews.Review do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviews" do
    field :rating, :integer, default: 0
    field :comment, :string
    belongs_to :course, CursoGuia.Courses.Course
    belongs_to :user, CursoGuia.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, [:rating, :comment, :course_id, :user_id])
    |> validate_required([:rating, :comment, :course_id, :user_id])
    |> validate_length(:comment, min: 5, max: 500)
    |> validate_number(:rating,
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 10,
      message: "must be between 1 and 10"
    )
  end
end
