defmodule CursoGuia.Reviews.PubSub.PublishReviewToCourseReviewChannel do
  alias CursoGuia.Repo
  @channel "reviews:created"

  def call({event, review}) do
    Phoenix.PubSub.broadcast(
      CursoGuia.PubSub,
      "#{@channel}:#{review.course_id}",
      {event, review |> Repo.preload([:user, :course])}
    )

    {:ok, review}
  end
end
