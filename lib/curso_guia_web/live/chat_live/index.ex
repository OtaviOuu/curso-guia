defmodule CursoGuiaWeb.ChatLive.Index do
  use CursoGuiaWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "Chat")}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash} current_scope={@current_scope}>
      <main class="grid min-h-full place-items-center bg-white px-6 py-24 sm:py-32 lg:px-8">
        <div class="text-center">
          <h1 class="mt-4 text-5xl font-semibold tracking-tight text-balance text-gray-900 sm:text-7xl">
            Uma hora faço...
          </h1>
          <div class="mt-10 flex items-center justify-center gap-x-6">
            <.link
              navigate={~p"/courses"}
              class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-xs hover:bg-indigo-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
            >
              Voltar
            </.link>
          </div>
        </div>
      </main>
    </Layouts.app>
    """
  end
end
