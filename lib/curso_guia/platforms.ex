defmodule CursoGuia.Platforms do
  alias CursoGuia.Platforms

  defdelegate change_platform(attrs), to: Platforms.GetChangeset, as: :call
  defdelegate list_platforms, to: Platforms.ListPlatform, as: :call

  defdelegate create_platform(attrs),
    to: Platforms.CreatePlatform,
    as: :call
end
