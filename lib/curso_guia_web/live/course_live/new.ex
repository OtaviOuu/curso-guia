defmodule CursoGuiaWeb.CourseLive.New do
  use CursoGuiaWeb, :live_view

  alias CursoGuia.Courses
  alias CursoGuia.Platforms

  def mount(_params, _session, socket) do
    changeset = Courses.change_course(%{})
    platform_url_to_scrape_form = to_form(%{url: ""})
    options_for_platforms = Platforms.list_platforms() |> Enum.map(&{&1.name, &1.id})

    socket =
      socket
      |> assign(course_form: to_form(changeset))
      |> assign(platforms: options_for_platforms)
      |> assign(platform_url_to_scrape_form: platform_url_to_scrape_form)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app current_scope={@current_scope} flash={@flash}>
      <div class="flex items-center">
        <div class="relative flex justify-start">
          <span class="bg-white pr-3 text-base font-semibold text-gray-900">Projects</span>
        </div>
        <div aria-hidden="true" class="w-full border-t border-gray-300"></div>
      </div>

      <.form for={@course_form} phx-submit="save">
        <.input field={@course_form[:title]} label="Title" />
        <.input field={@course_form[:description]} label="Description" />
        <.input field={@course_form[:cover]} label="Cover" />
        <.input
          field={@course_form[:platform_id]}
          label="Platform"
          type="select"
          options={@platforms}
        />
        <.input field={@course_form[:price]} label="Price" type="number" />

        <.button>Save</.button>
      </.form>

      <div class="flex items-center">
        <div class="relative flex justify-start">
          <span class="bg-white pr-3 text-base font-semibold text-gray-900">Spider</span>
        </div>
        <div aria-hidden="true" class="w-full border-t border-gray-300"></div>
      </div>

      <.form for={@platform_url_to_scrape_form} phx-submit="scrape">
        <.input field={@platform_url_to_scrape_form[:url]} label="url" />

        <.button>Search</.button>
      </.form>
    </Layouts.app>
    """
  end

  def handle_event("save", %{"course" => course_params}, socket) do
    case Courses.create_course(course_params) do
      {:ok, course} ->
        socket =
          socket
          |> put_flash(:info, "Course #{course.title} created successfully")
          |> push_navigate(to: ~p"/courses")

        {:noreply, socket}

      {:error, changeset} ->
        {:noreply, assign(socket, course_form: to_form(changeset, action: :validate))}
    end
  end

  def handle_event("scrape", %{"url" => url}, socket) do
    case Platforms.get_attrs_from_platform(url) do
      {:ok, attrs} ->
        changeset = Courses.change_course(attrs)

        socket =
          socket
          |> put_flash(:info, "Successfully scraped #{url}")
          |> assign(course_form: to_form(changeset, action: :validate))

        {:noreply, socket}

      {:error, reason} ->
        socket =
          socket
          |> put_flash(:error, "Failed: #{reason}")

        {:noreply, socket}
    end
  end
end
