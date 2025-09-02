defmodule CursoGuia.Reviews do
  alias CursoGuia.Reviews.ListReviews
  alias CursoGuia.Reviews.CreateReview
  alias CursoGuia.Reviews.GetChangeset
  alias CursoGuia.Reviews.PubSub
  defdelegate change_review(attrs), to: GetChangeset, as: :call
  defdelegate list_reviews(course_id), to: ListReviews, as: :call
  defdelegate create_review(attrs), to: CreateReview, as: :call

  defdelegate subscribe_to_reviews_created(course_id),
    to: PubSub.SubscribeToCourseReviewChannel,
    as: :call
end
