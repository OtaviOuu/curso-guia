defmodule CursoGuiaWeb.CourseLive.Index do
  use CursoGuiaWeb, :live_view

  alias CursoGuia.Courses

  def mount(_params, _session, socket) do
    courses = Courses.list_courses()
    {:ok, assign(socket, courses: courses)}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash} current_scope={@current_scope}>
      <div class="bg-white">
        <div class="mx-auto max-w-2xl px-4 py-16 sm:px-6 sm:py-24 lg:max-w-7xl lg:px-8">
          <div class="flex items-center justify-between space-x-4">
            <h2 class="text-lg font-medium text-gray-900">Customers also viewed</h2>
            <a
              href="#"
              class="text-sm font-medium whitespace-nowrap text-indigo-600 hover:text-indigo-500"
            >
              View all <span aria-hidden="true"><.icon name="hero-arrow-right" /></span>
            </a>
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
          src="https://tailwindcss.com/plus-assets/img/ecommerce-images/product-page-05-related-product-01.jpg"
          alt="Payment application dashboard screenshot with transaction table, financial highlights, and main clients on colorful purple background."
          class="aspect-4/3 w-full rounded-lg bg-gray-100 object-cover"
        />
        <div
          aria-hidden="true"
          class="absolute inset-0 flex items-end p-4 opacity-0 group-hover:opacity-100"
        >
          <div class="w-full rounded-md bg-white/75 px-4 py-2 text-center text-sm font-medium text-gray-900 backdrop-blur-sm backdrop-filter">
            View Product
          </div>
        </div>
      </div>
      <div class="mt-4 flex items-center justify-between space-x-8 text-base font-medium text-gray-900">
        <h3>
          <.link navigate="/courses/id" class="hover:underline">
            <span aria-hidden="true" class="absolute inset-0"></span> {@course.title}
          </.link>
        </h3>
        <p>${@course.price |> cents_to_brl()}</p>
      </div>
      <p class="mt-1 text-sm text-gray-500">{@course.platform.name}</p>
    </div>
    """
  end

  defp cents_to_brl(cents) do
    reais = cents / 100
    :erlang.float_to_binary(reais, decimals: 2)
  end
end
