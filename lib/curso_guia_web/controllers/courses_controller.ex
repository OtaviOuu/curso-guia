defmodule CursoGuiaWeb.CoursesController do
  use CursoGuiaWeb, :controller

  action_fallback CursoGuiaWeb.FallbackController

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> render(:index, courses: CursoGuia.Courses.list_courses())
  end

  def create(conn, %{"url" => url} = _params) do
    with {:ok, course_atts} <- CursoGuia.Courses.get_course_attrs(url),
         {:ok, course} <-
           CursoGuia.Courses.create_course(course_atts) do
      conn
      |> put_status(:created)
      |> render(:show, course: course)
    end
  end
end
