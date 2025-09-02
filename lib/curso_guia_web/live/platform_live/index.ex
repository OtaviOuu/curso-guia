defmodule CursoGuiaWeb.PlatformLive.Index do
  use CursoGuiaWeb, :live_view

  alias CursoGuia.Platforms
  alias CursoGuia.Repo

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:platforms, Platforms.list_platforms() |> Repo.preload(:courses))

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app current_scope={@current_scope} flash={@flash}>
      <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        <.platform :for={platform <- @platforms} platform={platform} />
      </div>
    </Layouts.app>
    """
  end

  def platform(assigns) do
    ~H"""
    <.link
      navigate={@platform.href}
      class="relative flex items-center space-x-3 rounded-lg border border-gray-300 bg-white px-6 py-5 shadow-xs focus-within:outline-2 focus-within:outline-offset-2 focus-within:outline-indigo-600 hover:border-gray-400"
    >
      <div class="shrink-0">
        <img
          src={@platform.logo}
          alt={"#{@platform.name} logo"}
          class="size-10 rounded-full bg-gray-300 outline -outline-offset-1 outline-black/5"
        />
      </div>

      <div class="min-w-0 flex-1">
        <div class="relative focus:outline-hidden cursor-pointer">
          <span aria-hidden="true" class="absolute inset-0"></span>
          <p class="text-sm font-medium text-gray-900">{@platform.name}</p>
          <p class="truncate text-sm text-gray-500">
            <span class="inline-flex items-center gap-x-1.5 rounded-md bg-yellow-100 px-1.5 py-0.5 text-xs font-medium text-yellow-800 cursor-pointer ">
              <svg viewBox="0 0 6 6" aria-hidden="true" class="size-1.5 fill-yellow-500">
                <circle r="3" cx="3" cy="3" />
              </svg>
              {length(@platform.courses)} cursos
            </span>
          </p>
        </div>
      </div>
    </.link>
    """
  end
end
