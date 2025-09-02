defmodule CursoGuia.Reviews.PubSub.SubscribeToCourseReviewChannel do
  @channel "reviews:created"
  def call(course_id) do
    Phoenix.PubSub.subscribe(CursoGuia.PubSub, "#{@channel}:#{course_id}")
  end
end
