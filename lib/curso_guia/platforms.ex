defmodule CursoGuia.Platforms do
  alias CursoGuia.Platforms

  defdelegate change_platform(attrs), to: Platforms.GetChangeset, as: :call

  defdelegate create_platform(attrs),
    to: Platforms.CreatePlatform,
    as: :call
end
