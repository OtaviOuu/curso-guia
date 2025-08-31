defmodule CursoGuiaWeb.PlatformLive.Index do
  use CursoGuiaWeb, :live_view

  def render(assigns) do
    ~H"""
    <Layouts.app current_scope={@current_scope} flash={@flash}>
      <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        <.platform :for={_ <- 1..9} />
      </div>
    </Layouts.app>
    """
  end

  def platform(assigns) do
    ~H"""
    <div class="relative flex items-center space-x-3 rounded-lg border border-gray-300 bg-white px-6 py-5 shadow-xs focus-within:outline-2 focus-within:outline-offset-2 focus-within:outline-indigo-600 hover:border-gray-400">
      <div class="shrink-0">
        <img
          src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
          alt=""
          class="size-10 rounded-full bg-gray-300 outline -outline-offset-1 outline-black/5"
        />
      </div>
      <div class="min-w-0 flex-1">
        <a href="#" class="focus:outline-hidden">
          <span aria-hidden="true" class="absolute inset-0"></span>
          <p class="text-sm font-medium text-gray-900">Leslie Alexander</p>
          <p class="truncate text-sm text-gray-500">Co-Founder / CEO</p>
        </a>
      </div>
    </div>
    """
  end
end
