defmodule CursoGuia.Reviews.PubSub.PublishReviewToCourseReviewChannel do
  alias CursoGuia.Repo
  @channel "reviews:created"

  def call(review) do
    Phoenix.PubSub.broadcast(
      CursoGuia.PubSub,
      "#{@channel}:#{review.course_id}",
      {:review_created, review |> Repo.preload(:user)}
    )

    {:ok, review}
  end
end
