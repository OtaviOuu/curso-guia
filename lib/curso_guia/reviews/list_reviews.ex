defmodule CursoGuia.Reviews.ListReviews do
  alias CursoGuia.Repo
  alias CursoGuia.Reviews.Review

  import Ecto.Query, only: [order_by: 2]

  def call(course_id) do
    Review
    |> order_by(desc: :inserted_at)
    |> Repo.all_by(course_id: course_id)
    |> Repo.preload(:user)
  end
end
