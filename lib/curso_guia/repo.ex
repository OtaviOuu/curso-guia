defmodule CursoGuia.Repo do
  use Ecto.Repo,
    otp_app: :curso_guia,
    adapter: Ecto.Adapters.SQLite3
end
