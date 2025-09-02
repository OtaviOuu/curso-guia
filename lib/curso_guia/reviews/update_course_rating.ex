defmodule CursoGuia.Reviews.UpdateCourseRating do
  alias CursoGuia.Reviews
  alias CursoGuia.Courses.UpdateCourse

  def call(course_id) do
    reviews = Reviews.list_reviews(course_id)
    rating_value = calculate_rating(reviews)

    case UpdateCourse.call(course_id, %{rating: rating_value}) do
      {:ok, course} -> {:ok, course}
      {:error, changeset} -> {:error, changeset}
    end
  end

  defp calculate_rating(reviews) when reviews > 0 do
    (Enum.sum(Enum.map(reviews, & &1.rating)) / length(reviews)) |> round()
  end

  defp calculate_rating(_), do: 0
end
