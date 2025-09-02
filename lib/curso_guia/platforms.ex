defmodule CursoGuia.Platforms do
  alias CursoGuia.Platforms

  defdelegate change_platform(attrs), to: Platforms.GetChangeset, as: :call
  defdelegate get_platform(id), to: Platforms.GetPlatform, as: :call
  defdelegate list_platforms, to: Platforms.ListPlatform, as: :call
  defdelegate get_attrs_from_platform(url), to: Platforms.GetAttrsFromPlatform, as: :call

  defdelegate create_platform(attrs),
    to: Platforms.CreatePlatform,
    as: :call
end
