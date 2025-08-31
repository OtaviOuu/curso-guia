defmodule CursoGuia.Courses.GetChangeset do
  alias CursoGuia.Courses.Course

  def call(attrs) do
    attrs
    |> Course.changeset()
  end
end
