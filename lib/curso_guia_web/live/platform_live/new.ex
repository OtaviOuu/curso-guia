defmodule CursoGuiaWeb.PlatformLive.New do
  use CursoGuiaWeb, :live_view

  alias CursoGuia.Platforms

  def mount(_params, _session, socket) do
    change_platform = Platforms.change_platform(%{})

    {:ok, assign(socket, platform_form: to_form(change_platform))}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app current_scope={@current_scope} flash={@flash}>
      <.form for={@platform_form} phx-submit="save">
        <.input field={@platform_form[:name]} label="Name" />
        <.input field={@platform_form[:logo]} label="Logo" />
        <.input field={@platform_form[:href]} label="Href" />
        <.button>Save</.button>
      </.form>
    </Layouts.app>
    """
  end

  def handle_event("save", %{"platform" => platform_params}, socket) do
    case Platforms.create_platform(platform_params) do
      {:ok, platform} ->
        socket =
          socket
          |> put_flash(:info, "Platform #{platform.name} created successfully")
          |> push_navigate(to: ~p"/courses")

        {:noreply, socket}

      {:error, changeset} ->
        {:noreply, assign(socket, platform_form: to_form(changeset, action: :validate))}
    end
  end
end
