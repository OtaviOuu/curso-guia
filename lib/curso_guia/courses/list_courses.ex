defmodule CursoGuia.Courses.ListCourses do
  alias CursoGuia.Repo
  alias CursoGuia.Courses.Course

  def call do
    Repo.all(Course)
  end
end
