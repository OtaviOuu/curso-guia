defmodule CursoGuiaWeb.CoursesJSON do
  def index(%{courses: courses}) do
    %{data: Enum.map(courses, &course_detailed_data/1)}
  end

  def show(%{course: course}) do
    %{data: course_summary_data(course)}
  end

  defp course_detailed_data(course) do
    %{
      id: course.id,
      title: course.title,
      cover: course.cover,
      description: course.description,
      href: course.href,
      rating: course.rating,
      views: course.views
    }
  end

  defp course_summary_data(course) do
    %{
      id: course.id,
      title: course.title,
      cover: course.cover,
      description: course.description,
      href: course.href
    }
  end
end
