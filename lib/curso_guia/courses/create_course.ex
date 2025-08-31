defmodule CursoGuia.Courses.CreateCourse do
  alias CursoGuia.Repo
  alias CursoGuia.Courses.Course

  def call(attrs) do
    attrs
    |> Course.changeset()
    |> Repo.insert()
  end
end
