defmodule CursoGuia.Platforms.GetPlatform do
  alias CursoGuia.Repo
  alias CursoGuia.Platforms.Platform

  def call(id) do
    Repo.get_by(Platform, id: id)
  end
end
