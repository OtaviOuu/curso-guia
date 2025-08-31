defmodule CursoGuiaWeb.CourseLive.New do
  use CursoGuiaWeb, :live_view

  alias CursoGuia.Courses

  def mount(_params, _session, socket) do
    changeset = Courses.change_course(%{})
    {:ok, assign(socket, course_form: to_form(changeset))}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app_sidebar current_scope={@current_scope} flash={@flash}>
      <.form for={@course_form} phx-submit="save">
        <.input field={@course_form[:title]} label="Title" />
        <.input field={@course_form[:description]} label="Description" />
        <.input field={@course_form[:cover]} label="Cover" />
        <.input field={@course_form[:price]} label="Price" type="number" />
        <.button>Save</.button>
      </.form>
    </Layouts.app_sidebar>
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
end
