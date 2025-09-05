defmodule CursoGuiaWeb.CourseLive.Index do
  use CursoGuiaWeb, :live_view

  alias CursoGuia.Courses

  def mount(_params, _session, socket) do
    courses = Courses.list_courses(:views)

    socket =
      socket
      |> assign(page_title: "Cursos")
      |> assign(courses: courses)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash} current_scope={@current_scope}>
      <div class="bg-white">
        <div class="mx-auto max-w-2xl px-4 py-16 sm:px-6 sm:py-24 lg:max-w-7xl lg:px-8">
          <div class="flex items-center justify-between space-x-4">
            <h2 class="text-lg font-medium text-gray-900">Cursos</h2>
            <.link
              navigate={~p"/courses"}
              class="text-sm font-medium whitespace-nowrap text-indigo-600 hover:text-indigo-500"
            >
              Todos <span aria-hidden="true"><.icon name="hero-arrow-right" /></span>
            </.link>
          </div>
          <div class="mt-6 grid grid-cols-1 gap-x-8 gap-y-8 sm:grid-cols-2 sm:gap-y-10 lg:grid-cols-4">
            <.course_card :for={course <- @courses} course={course} />
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end

  def course_card(assigns) do
    ~H"""
    <div class="group relative">
      <div class="relative">
        <img
          src={@course.cover}
          alt="Payment application dashboard screenshot with transaction table, financial highlights, and main clients on colorful purple background."
          class="aspect-4/3 w-full rounded-lg bg-gray-100 object-cover"
        />
        <div
          aria-hidden="true"
          class="absolute inset-0 flex items-end p-4 opacity-0 group-hover:opacity-100"
        >
          <div class="w-full rounded-md bg-white/75 px-4 py-2 text-center text-sm font-medium text-gray-900 backdrop-blur-sm backdrop-filter">
            Ver curso
          </div>
        </div>
      </div>
      <div class="mt-4 flex items-start justify-between text-base font-medium text-gray-900">
        <h3>
          <div
            phx-click="click_course"
            phx-value-id={@course.id}
            phx-value-views={@course.views}
            class="hover:underline cursor-pointer"
          >
            <span aria-hidden="true" class="absolute inset-0"></span> {@course.title}
          </div>
        </h3>
        <p class="text-base text-gray-900">${@course.price |> cents_to_brl()}</p>
      </div>
      <div class="mt-1 flex items-center justify-between text-sm text-gray-500">
        <div class="flex items-center gap-2">
          <img
            src={@course.platform.logo}
            alt={@course.platform.name}
            class="h-4 w-4 object-contain"
          />
          <span>{@course.platform.name}</span>
        </div>
        <div class="flex items-center gap-1">
          <.icon name="hero-eye" class="h-4 w-4 text-gray-400" />
          <span>{@course.views} views</span>
        </div>
      </div>
    </div>
    """
  end

  def handle_event("click_course", %{"id" => id, "views" => views}, socket) do
    updated_views = String.to_integer(views) + 1

    case Courses.update_course(id, %{views: updated_views}) do
      {:ok, _course} ->
        socket =
          socket
          |> push_navigate(to: ~p"/courses/#{id}")

        {:noreply, socket}

      {:error, changeset} ->
        socket =
          socket
          |> put_flash(:error, "Error...: #{changeset.errors}")

        {:noreply, socket}
    end
  end

  defp cents_to_brl(cents) do
    reais = cents / 100
    :erlang.float_to_binary(reais, decimals: 2)
  end
end
