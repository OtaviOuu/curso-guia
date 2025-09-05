defmodule CursoGuiaWeb.CourseLive.New do
  use CursoGuiaWeb, :live_view

  alias CursoGuia.Courses
  alias CursoGuia.Platforms

  def mount(_params, _session, socket) do
    changeset = Courses.change_course(%{})
    platform_url_to_scrape_form = to_form(%{"url" => ""})
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
      <div class="space-y-6">
        <div class="flex items-center">
          <div class="relative flex justify-start">
            <span class="bg-white pr-3 text-base font-semibold text-gray-900">Spider</span>
          </div>
        </div>

        <.form for={@platform_url_to_scrape_form} phx-submit="scrape">
          <.input field={@platform_url_to_scrape_form[:url]} label="url" name="url" />

          <.button>Search</.button>
        </.form>

        <div class="flex items-center">
          <div class="relative flex justify-start">
            <span class="bg-white pr-3 text-base font-semibold text-gray-900">Projects</span>
          </div>
        </div>

        <.form for={@course_form} phx-submit="save">
          <.input field={@course_form[:title]} label="Title" />
          <.input field={@course_form[:description]} label="Description" />
          <.input field={@course_form[:cover]} label="Cover" />
          <.input field={@course_form[:href]} label="Link" />
          <.input
            field={@course_form[:platform_id]}
            label="Platform"
            type="select"
            options={@platforms}
          />
          <.input field={@course_form[:price]} label="Price" type="number" />

          <.button>Save</.button>
        </.form>
      </div>
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

  def handle_event("scrape", %{"url" => course_url}, socket) do
    if String.trim(course_url) != "" do
      fill_course_form(course_url)
    end

    {:noreply, socket}
  end

  def handle_info({:ok, attrs}, socket) do
    changeset = Courses.change_course(attrs)

    socket =
      socket
      |> assign(course_form: to_form(changeset, action: :validate))

    {:noreply, socket}
  end

  defp fill_course_form(course_url) do
    current_live_view_pid = self()

    Task.start_link(fn ->
      send(current_live_view_pid, Courses.get_course_attrs(course_url))
    end)
  end
end
