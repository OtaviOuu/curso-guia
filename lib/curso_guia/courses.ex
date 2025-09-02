defmodule CursoGuia.Courses do
  alias CursoGuia.Courses

  defdelegate change_course(attrs), to: Courses.GetChangeset, as: :call
  defdelegate list_courses, to: Courses.ListCourses, as: :call
  defdelegate create_course(attrs), to: Courses.CreateCourse, as: :call
  defdelegate get_course(id), to: Courses.GetCourse, as: :call
  defdelegate update_course(id, attrs), to: Courses.UpdateCourse, as: :call
end
