defmodule CursoGuia.Reviews.DeleteReview do
  alias CursoGuia.Repo
  alias CursoGuia.Reviews.Review
  alias CursoGuia.Reviews.UpdateCourseRating
  alias CursoGuia.Reviews.PubSub.PublishReviewToCourseReviewChannel

  def call(scope, review_id) do
    true = scope.user.is_admin == true

    case Repo.get_by(Review, id: review_id) do
      nil ->
        {:error, :not_found}

      review ->
        case Repo.delete(review) do
          {:ok, _} ->
            UpdateCourseRating.call(review.course_id)
            PublishReviewToCourseReviewChannel.call({:deleted_review, review})
            {:ok, review}

          {:error, _changeset} ->
            {:error, :could_not_delete}
        end
    end
  end
end
