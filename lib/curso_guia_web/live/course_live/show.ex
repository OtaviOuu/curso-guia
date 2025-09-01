defmodule CursoGuiaWeb.CourseLive.Show do
  use CursoGuiaWeb, :live_view

  alias CursoGuia.Courses
  alias CursoGuia.Reviews

  def mount(%{"id" => course_id}, _session, socket) do
    course = Courses.get_course(course_id)
    reviews = Reviews.list_reviews(course_id)

    socket =
      socket
      |> assign(course: course)
      |> assign(reviews: reviews)

    {:ok, socket}
  end

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
                <.stars />
              </div>

              <p class="mt-6 text-gray-500">
                {@course.description}
              </p>

              <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-4 sm:grid-cols-2">
                <button
                  type="button"
                  class="flex w-full items-center justify-center rounded-md border border-transparent bg-indigo-600 px-8 py-3 text-base font-medium text-white hover:bg-indigo-700 focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:ring-offset-gray-50 focus:outline-hidden"
                >
                  Pay $220
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
                    class="list-disc space-y-1 pl-5 text-sm/6 text-gray-500 marker:text-gray-300"
                  >
                    <li class="pl-2">{@course.platform.name}</li>
                    <li class="pl-2">Compatible with Figma, Sketch, and Adobe XD</li>
                    <li class="pl-2">Drawn on 24 x 24 pixel grid</li>
                  </ul>
                </div>
              </div>

              <div class="mt-10 border-t border-gray-200 pt-10">
                <h3 class="text-sm font-medium text-gray-900">License</h3>
                <p class="mt-4 text-sm text-gray-500">
                  For personal and professional use. You cannot resell or redistribute these icons in their original or modified state.
                  <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500">
                    Read full license
                  </a>
                </p>
              </div>

              <div class="mt-10 border-t border-gray-200 pt-10">
                <h3 class="text-sm font-medium text-gray-900">Share</h3>
                <ul role="list" class="mt-4 flex items-center space-x-6">
                  <li>
                    <a
                      href="#"
                      class="flex size-6 items-center justify-center text-gray-400 hover:text-gray-500"
                    >
                      <span class="sr-only">Share on Facebook</span>
                      <svg viewBox="0 0 20 20" fill="currentColor" aria-hidden="true" class="size-5">
                        <path
                          d="M20 10c0-5.523-4.477-10-10-10S0 4.477 0 10c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V10h2.54V7.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V10h2.773l-.443 2.89h-2.33v6.988C16.343 19.128 20 14.991 20 10z"
                          clip-rule="evenodd"
                          fill-rule="evenodd"
                        />
                      </svg>
                    </a>
                  </li>
                  <li>
                    <a
                      href="#"
                      class="flex size-6 items-center justify-center text-gray-400 hover:text-gray-500"
                    >
                      <span class="sr-only">Share on Instagram</span>
                      <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" class="size-6">
                        <path
                          d="M12.315 2c2.43 0 2.784.013 3.808.06 1.064.049 1.791.218 2.427.465a4.902 4.902 0 011.772 1.153 4.902 4.902 0 011.153 1.772c.247.636.416 1.363.465 2.427.048 1.067.06 1.407.06 4.123v.08c0 2.643-.012 2.987-.06 4.043-.049 1.064-.218 1.791-.465 2.427a4.902 4.902 0 01-1.153 1.772 4.902 4.902 0 01-1.772 1.153c-.636.247-1.363.416-2.427.465-1.067.048-1.407.06-4.123.06h-.08c-2.643 0-2.987-.012-4.043-.06-1.064-.049-1.791-.218-2.427-.465a4.902 4.902 0 01-1.772-1.153 4.902 4.902 0 01-1.153-1.772c-.247-.636-.416-1.363-.465-2.427-.047-1.024-.06-1.379-.06-3.808v-.63c0-2.43.013-2.784.06-3.808.049-1.064.218-1.791.465-2.427a4.902 4.902 0 011.153-1.772A4.902 4.902 0 015.45 2.525c.636-.247 1.363-.416 2.427-.465C8.901 2.013 9.256 2 11.685 2h.63zm-.081 1.802h-.468c-2.456 0-2.784.011-3.807.058-.975.045-1.504.207-1.857.344-.467.182-.8.398-1.15.748-.35.35-.566.683-.748 1.15-.137.353-.3.882-.344 1.857-.047 1.023-.058 1.351-.058 3.807v.468c0 2.456.011 2.784.058 3.807.045.975.207 1.504.344 1.857.182.466.399.8.748 1.15.35.35.683.566 1.15.748.353.137.882.3 1.857.344 1.054.048 1.37.058 4.041.058h.08c2.597 0 2.917-.01 3.96-.058.976-.045 1.505-.207 1.858-.344.466-.182.8-.398 1.15-.748.35-.35.566-.683.748-1.15.137-.353.3-.882.344-1.857.048-1.055.058-1.37.058-4.041v-.08c0-2.597-.01-2.917-.058-3.96-.045-.976-.207-1.505-.344-1.858a3.097 3.097 0 00-.748-1.15 3.098 3.098 0 00-1.15-.748c-.353-.137-.882-.3-1.857-.344-1.023-.047-1.351-.058-3.807-.058zM12 6.865a5.135 5.135 0 110 10.27 5.135 5.135 0 010-10.27zm0 1.802a3.333 3.333 0 100 6.666 3.333 3.333 0 000-6.666zm5.338-3.205a1.2 1.2 0 110 2.4 1.2 1.2 0 010-2.4z"
                          clip-rule="evenodd"
                          fill-rule="evenodd"
                        />
                      </svg>
                    </a>
                  </li>
                  <li>
                    <a
                      href="#"
                      class="flex size-6 items-center justify-center text-gray-400 hover:text-gray-500"
                    >
                      <span class="sr-only">Share on X</span>
                      <svg viewBox="0 0 20 20" fill="currentColor" aria-hidden="true" class="size-5">
                        <path d="M11.4678 8.77491L17.2961 2H15.915L10.8543 7.88256L6.81232 2H2.15039L8.26263 10.8955L2.15039 18H3.53159L8.87581 11.7878L13.1444 18H17.8063L11.4675 8.77491H11.4678ZM9.57608 10.9738L8.95678 10.0881L4.02925 3.03974H6.15068L10.1273 8.72795L10.7466 9.61374L15.9156 17.0075H13.7942L9.57608 10.9742V10.9738Z" />
                      </svg>
                    </a>
                  </li>
                </ul>
              </div>
            </div>

            <div class="mx-auto mt-16 w-full max-w-2xl lg:col-span-4 lg:mt-0 lg:max-w-none">
              <el-tab-group>
                <el-tab-panels>
                  <.reviews />

                  <div id="tab-panel-faq" hidden class="text-sm text-gray-500">
                    <h3 class="sr-only">Frequently Asked Questions</h3>

                    <dl>
                      <dt class="mt-10 font-medium text-gray-900">What format are these icons?</dt>
                      <dd class="mt-2 text-sm/6 text-gray-500">
                        <p>
                          The icons are in SVG (Scalable Vector Graphic) format. They can be imported into your design tool of choice and used directly in code.
                        </p>
                      </dd>
                      <dt class="mt-10 font-medium text-gray-900">
                        Can I use the icons at different sizes?
                      </dt>
                      <dd class="mt-2 text-sm/6 text-gray-500">
                        <p>
                          Yes. The icons are drawn on a 24 x 24 pixel grid, but the icons can be scaled to different sizes as needed. We don&#039;t recommend going smaller than 20 x 20 or larger than 64 x 64 to retain legibility and visual balance.
                        </p>
                      </dd>
                      <dt class="mt-10 font-medium text-gray-900">
                        Do I have to add attribution to my projects?
                      </dt>
                      <dd class="mt-2 text-sm/6 text-gray-500">
                        <p>
                          No. You are allowed to use these icons freely in your personal and professional work. If you enjoy the icon pack, feel free to tell others!
                        </p>
                      </dd>
                    </dl>
                  </div>

                  <div id="tab-panel-license" hidden class="pt-10">
                    <h3 class="sr-only">License</h3>

                    <div class="text-sm text-gray-500 [&_h4]:mt-5 [&_h4]:font-medium [&_h4]:text-gray-900 [&_li]:pl-2 [&_li::marker]:text-gray-300 [&_p]:my-2 [&_p]:text-sm/6 [&_ul]:my-4 [&_ul]:list-disc [&_ul]:space-y-1 [&_ul]:pl-5 [&_ul]:text-sm/6 [&>:first-child]:mt-0">
                      <h4>Overview</h4>

                      <p>
                        For personal and professional use. You cannot resell or redistribute these icons in their original or modified state.
                      </p>

                      <ul role="list">
                        <li>You're allowed to use the icons in unlimited projects.</li>
                        <li>Attribution is not required to use the icons.</li>
                      </ul>

                      <h4>What you can do with it</h4>

                      <ul role="list">
                        <li>Use them freely in your personal and professional work.</li>
                        <li>Make them your own. Change the colors to suit your project or brand.</li>
                      </ul>

                      <h4>What you can't do with it</h4>

                      <ul role="list">
                        <li>
                          Don't be greedy. Selling or distributing these icons in their original or modified state is prohibited.
                        </li>
                        <li>
                          Don't be evil. These icons cannot be used on websites or applications that promote illegal or immoral beliefs or activities.
                        </li>
                      </ul>
                    </div>
                  </div>
                </el-tab-panels>
              </el-tab-group>
            </div>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end

  def reviews(assigns) do
    ~H"""
    <div id="tab-panel-reviews" class="-mb-10">
      <h3 class="sr-only">Customer Reviews</h3>
      <.message_input />
      <div class="mt-10 space-y-6">
        <.review_card :for={_ <- 1..3} />
      </div>
    </div>
    """
  end

  def review_card(assigns) do
    ~H"""
    <div class="flex space-x-4 text-sm text-gray-500">
      <div class="flex-none py-10">
        <img
          src="https://fabianlee.org/wp-content/uploads/2017/05/golang-color-icon2.png"
          alt="Profile image"
          class="size-10 rounded-full bg-gray-100"
        />
      </div>
      <div class="py-10">
        <h3 class="font-medium text-gray-900">Emily Selman</h3>
        <p><time datetime="2021-07-16">July 16, 2021</time></p>
        <.stars />
        <p class="sr-only">5 out of 5 stars</p>

        <div class="mt-4 text-sm/6 text-gray-500">
          <p>
            This icon pack is just what I need for my latest project. There's an icon for just about anything I could ever need. Love the playful look!
          </p>
        </div>
      </div>
    </div>
    """
  end

  def stars(assigns) do
    ~H"""
    <div class="mt-4 flex items-center">
      <!-- Active: "text-yellow-400", Default: "text-gray-300" -->
      <svg
        :for={_ <- 1..5}
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
    </div>
    """
  end

  def message_input(assigns) do
    ~H"""
    <!-- Include this script tag or install `@tailwindplus/elements` via npm: -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/@tailwindplus/elements@1" type="module"></script> -->
    <div class="flex items-start space-x-4">
      <div class="shrink-0">
        <img
          src="https://images.unsplash.com/photo-1550525811-e5869dd03032?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
          alt=""
          class="inline-block size-10 rounded-full bg-gray-100 outline -outline-offset-1 outline-black/5"
        />
      </div>
      <div class="min-w-0 flex-1">
        <form action="#" class="relative">
          <div class="rounded-lg bg-white outline-1 -outline-offset-1 outline-gray-300 focus-within:outline-2 focus-within:-outline-offset-2 focus-within:outline-indigo-600">
            <label for="comment" class="sr-only">Add your comment</label>
            <textarea
              id="comment"
              name="comment"
              rows="3"
              placeholder="Add your comment..."
              class="block w-full resize-none bg-transparent px-3 py-1.5 text-base text-gray-900 placeholder:text-gray-400 focus:outline-none sm:text-sm/6"
            ></textarea>
            
    <!-- Spacer element to match the height of the toolbar -->
            <div aria-hidden="true" class="py-2">
              <!-- Matches height of button in toolbar (1px border + 36px content height) -->
              <div class="py-px">
                <div class="h-9"></div>
              </div>
            </div>
          </div>

          <div class="absolute inset-x-0 bottom-0 flex justify-between py-2 pr-2 pl-3">
            <div class="flex items-center space-x-5">
              <div class="flex items-center">
                <button
                  type="button"
                  class="-m-2.5 flex size-10 items-center justify-center rounded-full text-gray-400 hover:text-gray-500"
                >
                  <svg
                    viewBox="0 0 20 20"
                    fill="currentColor"
                    data-slot="icon"
                    aria-hidden="true"
                    class="size-5"
                  >
                    <path
                      d="M15.621 4.379a3 3 0 0 0-4.242 0l-7 7a3 3 0 0 0 4.241 4.243h.001l.497-.5a.75.75 0 0 1 1.064 1.057l-.498.501-.002.002a4.5 4.5 0 0 1-6.364-6.364l7-7a4.5 4.5 0 0 1 6.368 6.36l-3.455 3.553A2.625 2.625 0 1 1 9.52 9.52l3.45-3.451a.75.75 0 1 1 1.061 1.06l-3.45 3.451a1.125 1.125 0 0 0 1.587 1.595l3.454-3.553a3 3 0 0 0 0-4.242Z"
                      clip-rule="evenodd"
                      fill-rule="evenodd"
                    />
                  </svg>
                  <span class="sr-only">Attach a file</span>
                </button>
              </div>
              <div class="flex items-center">
                <el-select name="selected" value="">
                  <button
                    type="button"
                    aria-label="Your mood"
                    class="relative -m-2.5 flex size-10 items-center justify-center rounded-full text-gray-400 hover:text-gray-500"
                  >
                    <el-selectedcontent class="flex items-center justify-center">
                      <svg
                        viewBox="0 0 20 20"
                        fill="currentColor"
                        data-slot="icon"
                        aria-hidden="true"
                        class="size-5 shrink-0"
                      >
                        <path
                          d="M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16Zm3.536-4.464a.75.75 0 1 0-1.061-1.061 3.5 3.5 0 0 1-4.95 0 .75.75 0 0 0-1.06 1.06 5 5 0 0 0 7.07 0ZM9 8.5c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S7.448 7 8 7s1 .672 1 1.5Zm3 1.5c.552 0 1-.672 1-1.5S12.552 7 12 7s-1 .672-1 1.5.448 1.5 1 1.5Z"
                          clip-rule="evenodd"
                          fill-rule="evenodd"
                        />
                      </svg>
                      <span class="sr-only">Add your mood</span>
                    </el-selectedcontent>
                  </button>

                  <el-options
                    anchor="bottom start"
                    popover
                    class="-ml-3.5 w-60 rounded-lg bg-white py-3 text-base shadow-sm outline-1 outline-black/5 [--anchor-gap:-4px] data-leave:transition data-leave:transition-discrete data-leave:duration-100 data-leave:ease-in data-closed:data-leave:opacity-0 sm:ml-2.5 sm:w-64 sm:text-sm"
                  >
                    <el-option
                      value="excited"
                      class="relative block cursor-default bg-white px-3 py-2 select-none focus:bg-gray-100 focus:outline-hidden"
                    >
                      <div class="flex items-center">
                        <div class="flex size-8 items-center justify-center rounded-full bg-red-500">
                          <svg
                            viewBox="0 0 20 20"
                            fill="currentColor"
                            data-slot="icon"
                            aria-hidden="true"
                            class="size-5 shrink-0 text-white"
                          >
                            <path
                              d="M13.5 4.938a7 7 0 1 1-9.006 1.737c.202-.257.59-.218.793.039.278.352.594.672.943.954.332.269.786-.049.773-.476a5.977 5.977 0 0 1 .572-2.759 6.026 6.026 0 0 1 2.486-2.665c.247-.14.55-.016.677.238A6.967 6.967 0 0 0 13.5 4.938ZM14 12a4 4 0 0 1-4 4c-1.913 0-3.52-1.398-3.91-3.182-.093-.429.44-.643.814-.413a4.043 4.043 0 0 0 1.601.564c.303.038.531-.24.51-.544a5.975 5.975 0 0 1 1.315-4.192.447.447 0 0 1 .431-.16A4.001 4.001 0 0 1 14 12Z"
                              clip-rule="evenodd"
                              fill-rule="evenodd"
                            />
                          </svg>
                        </div>
                        <span class="ml-3 block truncate font-medium in-[el-selectedcontent]:hidden">
                          Excited
                        </span>
                      </div>
                    </el-option>
                    <el-option
                      value="loved"
                      class="relative block cursor-default bg-white px-3 py-2 select-none focus:bg-gray-100 focus:outline-hidden"
                    >
                      <div class="flex items-center">
                        <div class="flex size-8 items-center justify-center rounded-full bg-pink-400">
                          <svg
                            viewBox="0 0 20 20"
                            fill="currentColor"
                            data-slot="icon"
                            aria-hidden="true"
                            class="size-5 shrink-0 text-white"
                          >
                            <path d="m9.653 16.915-.005-.003-.019-.01a20.759 20.759 0 0 1-1.162-.682 22.045 22.045 0 0 1-2.582-1.9C4.045 12.733 2 10.352 2 7.5a4.5 4.5 0 0 1 8-2.828A4.5 4.5 0 0 1 18 7.5c0 2.852-2.044 5.233-3.885 6.82a22.049 22.049 0 0 1-3.744 2.582l-.019.01-.005.003h-.002a.739.739 0 0 1-.69.001l-.002-.001Z" />
                          </svg>
                        </div>
                        <span class="ml-3 block truncate font-medium in-[el-selectedcontent]:hidden">
                          Loved
                        </span>
                      </div>
                    </el-option>
                    <el-option
                      value="happy"
                      class="relative block cursor-default bg-white px-3 py-2 select-none focus:bg-gray-100 focus:outline-hidden"
                    >
                      <div class="flex items-center">
                        <div class="flex size-8 items-center justify-center rounded-full bg-green-400">
                          <svg
                            viewBox="0 0 20 20"
                            fill="currentColor"
                            data-slot="icon"
                            aria-hidden="true"
                            class="size-5 shrink-0 text-white"
                          >
                            <path
                              d="M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16Zm3.536-4.464a.75.75 0 1 0-1.061-1.061 3.5 3.5 0 0 1-4.95 0 .75.75 0 0 0-1.06 1.06 5 5 0 0 0 7.07 0ZM9 8.5c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S7.448 7 8 7s1 .672 1 1.5Zm3 1.5c.552 0 1-.672 1-1.5S12.552 7 12 7s-1 .672-1 1.5.448 1.5 1 1.5Z"
                              clip-rule="evenodd"
                              fill-rule="evenodd"
                            />
                          </svg>
                        </div>
                        <span class="ml-3 block truncate font-medium in-[el-selectedcontent]:hidden">
                          Happy
                        </span>
                      </div>
                    </el-option>
                    <el-option
                      value="sad"
                      class="relative block cursor-default bg-white px-3 py-2 select-none focus:bg-gray-100 focus:outline-hidden"
                    >
                      <div class="flex items-center">
                        <div class="flex size-8 items-center justify-center rounded-full bg-yellow-400">
                          <svg
                            viewBox="0 0 20 20"
                            fill="currentColor"
                            data-slot="icon"
                            aria-hidden="true"
                            class="size-5 shrink-0 text-white"
                          >
                            <path
                              d="M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16Zm-3.536-3.475a.75.75 0 0 0 1.061 0 3.5 3.5 0 0 1 4.95 0 .75.75 0 1 0 1.06-1.06 5 5 0 0 0-7.07 0 .75.75 0 0 0 0 1.06ZM9 8.5c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S7.448 7 8 7s1 .672 1 1.5Zm3 1.5c.552 0 1-.672 1-1.5S12.552 7 12 7s-1 .672-1 1.5.448 1.5 1 1.5Z"
                              clip-rule="evenodd"
                              fill-rule="evenodd"
                            />
                          </svg>
                        </div>
                        <span class="ml-3 block truncate font-medium in-[el-selectedcontent]:hidden">
                          Sad
                        </span>
                      </div>
                    </el-option>
                    <el-option
                      value="thumbsy"
                      class="relative block cursor-default bg-white px-3 py-2 select-none focus:bg-gray-100 focus:outline-hidden"
                    >
                      <div class="flex items-center">
                        <div class="flex size-8 items-center justify-center rounded-full bg-blue-500">
                          <svg
                            viewBox="0 0 20 20"
                            fill="currentColor"
                            data-slot="icon"
                            aria-hidden="true"
                            class="size-5 shrink-0 text-white"
                          >
                            <path d="M1 8.25a1.25 1.25 0 1 1 2.5 0v7.5a1.25 1.25 0 1 1-2.5 0v-7.5ZM11 3V1.7c0-.268.14-.526.395-.607A2 2 0 0 1 14 3c0 .995-.182 1.948-.514 2.826-.204.54.166 1.174.744 1.174h2.52c1.243 0 2.261 1.01 2.146 2.247a23.864 23.864 0 0 1-1.341 5.974C17.153 16.323 16.072 17 14.9 17h-3.192a3 3 0 0 1-1.341-.317l-2.734-1.366A3 3 0 0 0 6.292 15H5V8h.963c.685 0 1.258-.483 1.612-1.068a4.011 4.011 0 0 1 2.166-1.73c.432-.143.853-.386 1.011-.814.16-.432.248-.9.248-1.388Z" />
                          </svg>
                        </div>
                        <span class="ml-3 block truncate font-medium in-[el-selectedcontent]:hidden">
                          Thumbsy
                        </span>
                      </div>
                    </el-option>
                    <el-option
                      value=""
                      class="relative block cursor-default bg-white px-3 py-2 select-none focus:bg-gray-100 focus:outline-hidden"
                    >
                      <div class="flex items-center">
                        <div class="flex size-8 items-center justify-center rounded-full bg-transparent in-[el-selectedcontent]:hidden">
                          <svg
                            viewBox="0 0 20 20"
                            fill="currentColor"
                            data-slot="icon"
                            aria-hidden="true"
                            class="size-5 shrink-0 text-gray-400"
                          >
                            <path d="M6.28 5.22a.75.75 0 0 0-1.06 1.06L8.94 10l-3.72 3.72a.75.75 0 1 0 1.06 1.06L10 11.06l3.72 3.72a.75.75 0 1 0 1.06-1.06L11.06 10l3.72-3.72a.75.75 0 0 0-1.06-1.06L10 8.94 6.28 5.22Z" />
                          </svg>
                        </div>
                        <span class="hidden in-[el-selectedcontent]:inline">
                          <svg
                            viewBox="0 0 20 20"
                            fill="currentColor"
                            data-slot="icon"
                            aria-hidden="true"
                            class="size-5 shrink-0"
                          >
                            <path
                              d="M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16Zm3.536-4.464a.75.75 0 1 0-1.061-1.061 3.5 3.5 0 0 1-4.95 0 .75.75 0 0 0-1.06 1.06 5 5 0 0 0 7.07 0ZM9 8.5c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S7.448 7 8 7s1 .672 1 1.5Zm3 1.5c.552 0 1-.672 1-1.5S12.552 7 12 7s-1 .672-1 1.5.448 1.5 1 1.5Z"
                              clip-rule="evenodd"
                              fill-rule="evenodd"
                            />
                          </svg>
                          <span class="sr-only">Add your mood</span>
                        </span>
                        <span class="ml-3 block truncate font-medium in-[el-selectedcontent]:hidden">
                          I feel nothing
                        </span>
                      </div>
                    </el-option>
                  </el-options>
                </el-select>
              </div>
            </div>
            <div class="shrink-0">
              <button
                type="submit"
                class="inline-flex items-center rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-xs hover:bg-indigo-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
              >
                Post
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
    """
  end
end
