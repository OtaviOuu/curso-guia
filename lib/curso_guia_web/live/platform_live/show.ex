defmodule CursoGuiaWeb.PlatformLive.Show do
  use CursoGuiaWeb, :live_view

  def mount(%{"id" => id}, _session, socket) do
    platform = CursoGuia.Platforms.get_platform(id)

    socket =
      socket
      |> assign(page_title: platform.name)
      |> assign(platform: platform)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app current_scope={@current_scope} flash={@flash}>
      <div class="bg-white">
        <div class="mx-auto max-w-7xl py-24 sm:px-2 sm:py-32 lg:px-4">
          <div class="mx-auto max-w-2xl px-4 lg:max-w-none">
            <div class="grid grid-cols-1 items-center gap-x-16 gap-y-10 lg:grid-cols-2">
              <div>
                <h2 class="text-4xl font-bold tracking-tight text-gray-900">
                  {@platform.name}
                </h2>
                <p class="mt-4 text-gray-500">
                  At the beginning at least, but then we realized we could make a lot more money if we kinda stopped caring about that. Our new strategy is to write a bunch of things that look really good in the headlines, then clarify in the small print but hope people don't actually read it.
                </p>
              </div>
              <img
                src={@platform.logo}
                alt=""
                class="aspect-3/2 w-full rounded-lg bg-gray-100 object-cover"
              />
            </div>
            <h3 class="mt-16 text-lg font-medium text-gray-900">Cursos:</h3>
            <div class="mt-16 grid grid-cols-1 gap-x-8 gap-y-10 lg:grid-cols-3">
              <.simple_course_card :for={course <- @platform.courses} course={course} />
            </div>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end

  def simple_course_card(assigns) do
    ~H"""
    <.link navigate={~p"/courses/#{@course.id}"} class="sm:flex lg:block">
      <div class="sm:shrink-0">
        <img
          src={@course.cover}
          alt=""
          class="size-16"
        />
      </div>
      <div class="mt-4 sm:mt-0 sm:ml-6 lg:mt-6 lg:ml-0">
        <h3 class="text-sm font-medium text-gray-900">{@course.title}</h3>
        <p class="mt-2 text-sm text-gray-500">
          Imagine aqui uma descrição do curso.
        </p>
      </div>
    </.link>
    """
  end
end
