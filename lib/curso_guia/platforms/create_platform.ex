defmodule CursoGuia.Platforms.CreatePlatform do
  alias CursoGuia.Repo
  alias CursoGuia.Platforms.Platform

  def call(attrs) do
    attrs
    |> Platform.changeset()
    |> Repo.insert()
  end
end
