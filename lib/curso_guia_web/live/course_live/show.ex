defmodule CursoGuiaWeb.CourseLive.Show do
  use CursoGuiaWeb, :live_view

  alias CursoGuia.Courses
  alias CursoGuia.Reviews

  def mount(%{"id" => course_id}, _session, socket) do
    if connected?(socket) do
      Reviews.subscribe_to_reviews_created(course_id)
    end

    course = Courses.get_course(course_id)

    reviews = Reviews.list_reviews(course_id)

    socket =
      socket
      |> assign(page_title: String.slice(course.title, 0, 20))
      |> assign(course: course)
      |> stream(:reviews, reviews)
      |> assign(average_rating: course.rating)
      |> maybe_form()

    {:ok, socket}
  end

  defp maybe_form(socket) when socket.assigns.current_scope do
    change_review =
      Reviews.change_review(%{
        course_id: socket.assigns.course.id,
        user_id: socket.assigns.current_scope.user.id
      })

    socket
    |> assign(:review_form, to_form(change_review))
  end

  defp maybe_form(socket), do: assign(socket, :review_form, to_form(%{}, as: :review))

  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash} current_scope={@current_scope}>
      <div class="bg-white">
        <div class="mx-auto px-4 py-16 sm:px-6 sm:py-24 lg:max-w-7xl lg:px-8">
          <!-- Product -->
          <div class="lg:grid lg:grid-cols-7 lg:grid-rows-1 lg:gap-x-8 lg:gap-y-10 xl:gap-x-16">
            <!-- Product image -->
            <div class="lg:col-span-4 lg:row-end-1">
              <img
                src={@course.cover}
                alt="Sample of 30 icons with friendly and fun details in outline, filled, and brand color styles."
                class="aspect-4/3 w-full rounded-lg bg-gray-100 object-cover"
              />
            </div>
            
    <!-- Product details -->
            <div class="mx-auto mt-14 max-w-2xl sm:mt-16 lg:col-span-3 lg:row-span-2 lg:row-end-2 lg:mt-0 lg:max-w-none">
              <div class="flex flex-col-reverse">
                <div class="mt-4">
                  <h1 class="text-2xl font-bold tracking-tight text-gray-900 sm:text-3xl">
                    {@course.title}
                  </h1>

                  <h2 id="information-heading" class="sr-only">Product information</h2>
                  <p class="mt-2 text-sm text-gray-500">
                    Version 1.0 (Updated <time datetime="2021-06-05">June 5, 2021</time>)
                  </p>
                </div>
                <.stars rating={@average_rating} />
              </div>

              <div class="prose mt-6 text-gray-500">
                {@course.description |> raw()}
              </div>

              <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-4 sm:grid-cols-2">
                <button
                  type="button"
                  class="flex w-full items-center justify-center gap-2 rounded-md border border-transparent bg-indigo-600 px-8 py-3 text-base font-medium text-white hover:bg-indigo-700 focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:ring-offset-gray-50 focus:outline-hidden"
                >
                  <.icon name="hero-currency-dollar" />
                  {@course.price |> format_price()}
                </button>

                <button
                  type="button"
                  class="flex w-full items-center justify-center rounded-md border border-transparent bg-indigo-50 px-8 py-3 text-base font-medium text-indigo-700 hover:bg-indigo-100 focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:ring-offset-gray-50 focus:outline-hidden"
                >
                  Preview
                </button>
              </div>

              <div class="mt-10 border-t border-gray-200 pt-10">
                <h3 class="text-sm font-medium text-gray-900">Highlights</h3>
                <div class="mt-4">
                  <ul
                    role="list"
                    class="list-disc space-y-2 pl-5 text-sm/6 text-gray-500 marker:text-gray-300"
                  >
                    <li class="pl-2">
                      <span class="inline-flex items-center gap-x-1.5 rounded-full bg-red-100 px-2 py-1 text-xs font-medium text-red-700">
                        <svg viewBox="0 0 6 6" aria-hidden="true" class="size-1.5 fill-red-500">
                          <circle r="3" cx="3" cy="3" />
                        </svg>
                        {@course.views} views
                      </span>
                    </li>
                  </ul>
                </div>
              </div>

              <div class="mt-10 border-t border-gray-200 pt-10">
                <.platform_banner course={@course} />
              </div>
            </div>

            <div
              class="mx-auto mt-16 w-full max-w-2xl lg:col-span-4 lg:mt-0 lg:max-w-none"
              id="reviews-section"
            >
              <.reviews form={@review_form} current_scope={@current_scope} streams={@streams} />
            </div>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end

  def reviews(assigns) do
    ~H"""
    <div id="reviews" class="-mb-10">
      <h3 class="sr-only">Customer Reviews</h3>
      <.message_input :if={@current_scope} form={@form} />
      <.message_input_blocked :if={!@current_scope} />

      <div class="mt-10 space-y-6" phx-update="stream" id="reviews-cards">
        <.review_card
          :for={{dom_id, review} <- @streams.reviews}
          review={review}
          current_scope={@current_scope}
          id={dom_id}
        />
      </div>
    </div>
    """
  end

  def review_card(assigns) do
    ~H"""
    <section id={@id}>
      <div class="flex space-x-4 text-sm text-gray-500 relative">
        <div class="flex-none py-10">
          <img
            src="https://fabianlee.org/wp-content/uploads/2017/05/golang-color-icon2.png"
            alt="Profile image"
            class="size-10 rounded-full bg-gray-100"
          />
        </div>

        <div class="py-10 flex-1">
          <h3 class="font-medium text-gray-900">{@review.user.username}</h3>
          <p><time>{@review.inserted_at}</time></p>
          <.stars rating={@review.rating} />
          <p class="sr-only">{@review.rating} out of 5 stars</p>

          <div class="mt-4 text-sm/6 text-gray-500">
            <p>
              {@review.comment}
            </p>
          </div>
        </div>

        <div
          :if={@current_scope && @current_scope.user.is_admin}
          class="absolute top-4 right-4"
          phx-click="delete_review"
          phx-value-id={@review.id}
        >
          <.icon
            name="hero-trash"
            class="w-5 h-5 text-red-500 hover:text-red-700 cursor-pointer"
          />
        </div>
      </div>
    </section>
    """
  end

  def stars(assigns) do
    ~H"""
    <div class="mt-4 flex items-center">
      <%= if @rating > 0 do %>
        <svg
          :for={_ <- 1..@rating}
          viewBox="0 0 20 20"
          fill="currentColor"
          data-slot="icon"
          aria-hidden="true"
          class="size-5 shrink-0 text-yellow-400"
        >
          <path
            d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401Z"
            clip-rule="evenodd"
            fill-rule="evenodd"
          />
        </svg>
      <% else %>
        Sem avaliações ainda
      <% end %>
    </div>
    """
  end

  def message_input(assigns) do
    ~H"""
    <div class="flex items-start space-x-4">
      <div class="shrink-0">
        <img
          src="https://fabianlee.org/wp-content/uploads/2017/05/golang-color-icon2.png"
          alt=""
          class="inline-block size-10 rounded-full bg-gray-100 outline -outline-offset-1 outline-black/5"
        />
      </div>
      <div class="min-w-0 flex-1">
        <.form for={@form} class="relative" phx-submit="post_review" phx-change="validate">
          <.input
            field={@form[:rating]}
            id="rating"
            type="number"
            phx-debounce="500"
            placeholder="Rate the course"
          />

          <div class="rounded-lg bg-white outline-1 -outline-offset-1 outline-gray-300 focus-within:outline-2 focus-within:-outline-offset-2 focus-within:outline-indigo-600">
            <label for="review" class="sr-only">Add your comment</label>
            <.input
              field={@form[:comment]}
              rows="3"
              id="review"
              placeholder="Add your review"
              type="textarea"
              phx-debounce="500"
              class="block w-full resize-none bg-transparent px-3 py-1.5 text-base text-gray-900 placeholder:text-gray-400 focus:outline-none sm:text-sm/6"
            />
            <div aria-hidden="true" class="py-2">
              <div class="py-px">
                <div class="h-9"></div>
              </div>
            </div>
          </div>
          <div class="absolute inset-x-0 bottom-0 flex justify-between py-2 pr-2 pl-3">
            <div class="flex items-center space-x-5"></div>

            <div class="shrink-0">
              <.button class="inline-flex items-center rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-xs hover:bg-indigo-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                Post
              </.button>
            </div>
          </div>
        </.form>
      </div>
    </div>
    """
  end

  def message_input_blocked(assigns) do
    ~H"""
    <div class="flex items-start space-x-4">
      <div class="min-w-0 flex-1">
        <div class="rounded-lg bg-gray-50 border border-gray-200 px-4 py-3 text-center">
          <p class="text-gray-500 text-sm">
            Faça login para avaliar o curso
          </p>
          <.link
            navigate={~p"/users/log-in"}
            class="mt-2 inline-block rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
          >
            Fazer login
          </.link>
        </div>
      </div>
    </div>
    """
  end

  def platform_banner(assigns) do
    ~H"""
    <.link
      navigate={~p"/platforms/#{@course.platform.id}"}
      class="bg-gray-50 rounded-lg flex items-center gap-4 px-6 py-3 border border-gray-200 w-full max-w-xl"
    >
      <img src={@course.platform.logo} alt="Logo" class="w-8 h-8 rounded-full object-contain" />
      <div class="flex flex-col">
        <span class="text-lg font-semibold">{@course.platform.name}</span>
        <span class="text-sm text-red-800">
          {"desc talvez"}
        </span>
      </div>
    </.link>
    """
  end

  def handle_event("delete_review", %{"id" => review_id}, socket) do
    case Reviews.delete_review(socket.assigns.current_scope, review_id) do
      {:ok, _review} ->
        {:noreply, put_flash(socket, :info, "Review deleted successfully")}

      _ ->
        socket =
          socket
          |> put_flash(:error, "Failed to delete review")

        {:noreply, socket}
    end
  end

  def handle_event(
        "post_review",
        %{"review" => %{"comment" => review_content, "rating" => rating}},
        socket
      ) do
    review_attrs = %{
      user_id: socket.assigns.current_scope.user.id,
      rating: rating,
      course_id: socket.assigns.course.id,
      comment: review_content
    }

    case Reviews.create_review(review_attrs) do
      {:ok, _review} ->
        changeset =
          Reviews.change_review(%{
            user_id: socket.assigns.current_scope.user.id,
            course_id: socket.assigns.course.id
          })

        socket =
          socket
          |> put_flash(:info, "Review created successfully")
          |> assign(:review_form, to_form(changeset, as: :review))

        {:noreply, socket}

      {:error, changeset} ->
        socket =
          socket
          |> put_flash(:error, "Failed to create review")
          |> assign(:review_form, to_form(changeset, action: :validate))

        {:noreply, socket}
    end
  end

  def handle_event(
        "validate",
        %{"review" => %{"comment" => review_content, "rating" => rating}},
        socket
      ) do
    change_review =
      Reviews.change_review(%{
        comment: review_content,
        rating: rating,
        user_id: socket.assigns.current_scope.user.id,
        course_id: socket.assigns.course.id
      })

    {:noreply,
     assign(
       socket,
       :review_form,
       to_form(change_review, action: :validate, as: :review)
     )}
  end

  def handle_info({:review_created, review}, socket) do
    new_rating = review.course.rating

    socket =
      socket
      |> put_flash(:info, "New review created")
      |> stream_insert(:reviews, review)
      |> assign(average_rating: new_rating)

    {:noreply, socket}
  end

  def handle_info({:deleted_review, review}, socket) do
    dom_id = "reviews-#{review.id}"

    socket =
      socket
      |> stream_delete_by_dom_id(:reviews, dom_id)

    {:noreply, socket}
  end

  defp format_price(price) when is_integer(price) do
    (price / 100) |> :erlang.float_to_binary(decimals: 2)
  end
end
