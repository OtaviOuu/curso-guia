defmodule CursoGuia.Reviews.ListReviews do
  alias CursoGuia.Repo
  alias CursoGuia.Reviews.Review

  def call(course_id) do
    Repo.all_by(Review, course_id: course_id)
  end
end
