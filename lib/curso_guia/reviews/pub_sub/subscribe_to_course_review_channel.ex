defmodule CursoGuia.Reviews.PubSub.SubscribeToCourseReviewChannel do
  @channel "reviews:updated"
  def call(course_id) do
    Phoenix.PubSub.subscribe(CursoGuia.PubSub, "#{@channel}:#{course_id}")
  end
end
