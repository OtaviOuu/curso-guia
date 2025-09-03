defmodule CursoGuia.Platforms.GetPlatform do
  alias CursoGuia.Repo
  alias CursoGuia.Platforms.Platform

  def call(id) do
    Repo.get_by(Platform, id: id)
    # meio ruim
    |> Repo.preload(:courses)
  end
end
