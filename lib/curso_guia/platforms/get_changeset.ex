defmodule CursoGuia.Platforms.GetChangeset do
  alias CursoGuia.Platforms.Platform

  def call(attrs) do
    attrs
    |> Platform.changeset()
  end
end
