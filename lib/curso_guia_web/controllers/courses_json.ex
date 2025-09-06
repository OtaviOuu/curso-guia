defmodule CursoGuiaWeb.CoursesJSON do
  def index(%{courses: courses}) do
    %{data: Enum.map(courses, &course_to_json_data/1)}
  end

  def show(%{course: course}) do
    %{data: course_to_json_data(course)}
  end

  defp course_to_json_data(course) do
    %{
      id: course.id,
      title: course.title,
      description: course.description,
      cover: course.cover,
      href: course.href,
      rating: course.rating,
      views: course.views
    }
  end
end
