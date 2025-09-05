defmodule CursoGuiaWeb.CoursesController do
  use CursoGuiaWeb, :controller

  action_fallback CursoGuiaWeb.FallbackController

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> render(:index, courses: CursoGuia.Courses.list_courses())
  end
end
