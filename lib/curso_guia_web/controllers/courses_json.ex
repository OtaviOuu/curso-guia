defmodule CursoGuiaWeb.CoursesJSON do
  def index(%{courses: courses}) do
    %{data: Enum.map(courses, &course_to_json_data/1)}
  end

  defp course_to_json_data(course) do
    %{
      title: course.title
    }
  end
end
