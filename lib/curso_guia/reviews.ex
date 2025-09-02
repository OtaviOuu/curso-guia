defmodule CursoGuia.Reviews do
  alias CursoGuia.Reviews.ListReviews
  alias CursoGuia.Reviews.CreateReview
  alias CursoGuia.Reviews.GetChangeset

  defdelegate change_review(attrs), to: GetChangeset, as: :call
  defdelegate list_reviews(course_id), to: ListReviews, as: :call
  defdelegate create_review(attrs), to: CreateReview, as: :call
end
