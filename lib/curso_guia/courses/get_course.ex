defmodule CursoGuia.Courses.GetCourse do
  alias CursoGuia.Repo
  alias CursoGuia.Courses.Course

  def call(id) do
    Repo.get(Course, id)
    |> Repo.preload(:platform)
  end
end
