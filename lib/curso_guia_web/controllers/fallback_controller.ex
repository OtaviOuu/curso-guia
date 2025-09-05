defmodule CursoGuiaWeb.FallbackController do
  use CursoGuiaWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(json: CursoGuiaWeb.ErrorJSON)
    |> render(:error, status: :not_found)
  end
end
