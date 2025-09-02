defmodule CursoGuia.Reviews.CreateReview do
  alias CursoGuia.Repo
  alias CursoGuia.Reviews.Review
  alias CursoGuia.Reviews.PubSub

  def call(attrs) do
    attrs
    |> Review.changeset()
    |> Repo.insert()
    |> case do
      {:ok, review} -> PubSub.PublishReviewToCourseReviewChannel.call(review)
      {:error, changeset} -> {:error, changeset}
    end
  end
end
