defmodule CursoGuia.Courses.UpdateCourse do
  alias CursoGuia.Repo

  alias CursoGuia.Courses
  alias CursoGuia.Courses.Course

  def call(course_id, attrs) do
    course = Courses.get_course(course_id)

    case course do
      nil ->
        {:error, :not_found}

      %Course{} = course ->
        course
        |> Course.changeset(attrs)
        |> Repo.update()
    end
  end
end
