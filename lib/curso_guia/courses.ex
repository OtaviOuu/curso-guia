defmodule CursoGuia.Courses do
  alias CursoGuia.Courses

  defdelegate list_courses, to: Courses.ListCourses, as: :call
end
