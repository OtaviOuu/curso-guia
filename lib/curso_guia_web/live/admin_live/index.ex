defmodule CursoGuiaWeb.AdminLive.Index do
  use CursoGuiaWeb, :live_view

  def render(assigns) do
    ~H"""
    <Layouts.app current_scope={@current_scope} flash={@flash}>
      <div class="p-8 text-center">
        <h1 class="text-3xl font-bold mb-8">Admin Dashboard</h1>

        <div class="flex flex-wrap justify-center gap-6">
          <.link
            navigate={~p"/platforms/new"}
            class="btn btn-primary btn-lg"
          >
            Platforms
          </.link>

          <.link
            navigate={~p"/courses/new"}
            class="btn btn-primary btn-lg"
          >
            Courses
          </.link>
        </div>
      </div>
    </Layouts.app>
    """
  end
end
