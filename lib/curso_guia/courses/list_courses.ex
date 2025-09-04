defmodule CursoGuia.Courses.ListCourses do
  import Ecto.Query

  alias CursoGuia.Repo
  alias CursoGuia.Courses.Course

  def call(by \\ :id) do
    Course
    |> order_by(desc: ^by)
    |> Repo.all()
    |> Repo.preload(:platform)
  end
end
