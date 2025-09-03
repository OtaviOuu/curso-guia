defmodule CursoGuia.Reviews.DeleteReview do
  alias CursoGuia.Repo
  alias CursoGuia.Reviews.Review
  alias CursoGuia.Reviews.PubSub.PublishReviewToCourseReviewChannel

  def call(scope, review_id) do
    true = scope.user.is_admin == true

    case Repo.get(Review, review_id) do
      nil ->
        {:error, :not_found}

      review ->
        Repo.delete(review)
        PublishReviewToCourseReviewChannel.call({:review_deleted, review})
    end
  end
end
