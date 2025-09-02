defmodule CursoGuia.Reviews.CreateReview do
  alias CursoGuia.Repo
  alias CursoGuia.Reviews.Review
  alias CursoGuia.Reviews.PubSub

  def call(attrs) do
    attrs
    |> Review.changeset()
    |> Repo.insert()
    |> PubSub.PublishReviewToCourseReviewChannel.call()
  end
end
