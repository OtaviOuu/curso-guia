defmodule CursoGuia.Reviews.CreateReview do
  alias CursoGuia.Repo
  alias CursoGuia.Reviews.Review
  alias CursoGuia.Reviews.PubSub
  alias CursoGuia.Reviews.UpdateCourseRating

  def call(attrs) do
    attrs
    |> Review.changeset()
    |> Repo.insert()
    |> case do
      {:ok, review} ->
        UpdateCourseRating.call(review.course_id)
        PubSub.PublishReviewToCourseReviewChannel.call(review)

      {:error, changeset} ->
        {:error, changeset}
    end
  end
end
