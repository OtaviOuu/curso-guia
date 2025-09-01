defmodule CursoGuia.Platforms.ListPlatform do
  alias CursoGuia.Repo
  alias CursoGuia.Platforms.Platform

  def call do
    Repo.all(Platform)
  end
end
