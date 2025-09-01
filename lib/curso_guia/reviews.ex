defmodule CursoGuia.Reviews do
  alias CursoGuia.Reviews.ListReviews

  defdelegate list_reviews(course_id), to: ListReviews, as: :call
end
