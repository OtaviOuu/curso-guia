defmodule CursoGuiaWeb.LandingLive.Index do
  use CursoGuiaWeb, :live_view

  def mount(_, _, socket) do
    {:ok, assign(socket, page_title: "Home")}
  end

  def render(assigns) do
    ~H"""
    <.hero />
    """
  end

  def hero(assigns) do
    ~H"""
    <div class="bg-white">
      <header class="absolute inset-x-0 top-0 z-50">
        <nav aria-label="Global" class="flex items-center justify-between p-6 lg:px-8">
          <div class="flex lg:flex-1">
            <.link navigate={~p"/"} class="-m-1.5 p-1.5">
              <span class="sr-only">Curso Guia</span>
              <svg
                class="h-8 w-auto"
                width="37"
                height="41"
                viewBox="0 0 37 41"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  fill-rule="evenodd"
                  clip-rule="evenodd"
                  d="M5.79854 8.32545V16.0697C6.40555 15.9227 7.00165 15.7287 7.58131 15.4886C9.04883 14.8807 10.3823 13.9897 11.5054 12.8665C12.6286 11.7434 13.5196 10.4099 14.1275 8.94242C14.5074 8.02525 14.772 7.06693 14.9171 6.08938C11.8123 6.38997 8.74033 7.13533 5.79854 8.32545ZM0.106445 4.58301V16.4093V22.1014V22.2793C0.106445 32.2014 8.14995 40.2449 18.0721 40.2449C27.9943 40.2449 36.0378 32.2014 36.0378 22.2793V22.1014V16.4093V4.58301L33.407 3.43783C23.6269 -0.819365 12.5173 -0.819365 2.73726 3.43783L0.106445 4.58301ZM5.79959 22.4412C5.87284 28.1048 9.78208 32.8432 15.0482 34.1775C15.0456 32.5957 14.7328 31.0298 14.1275 29.5683C13.5196 28.1007 12.6286 26.7673 11.5054 25.6441C10.3823 24.5209 9.04883 23.63 7.58131 23.0221C7.00198 22.7822 6.40623 22.5882 5.79959 22.4412ZM17.8942 24.5457C17.2136 23.4919 16.4217 22.5105 15.5304 21.6192C14.639 20.7279 13.6577 19.936 12.6039 19.2553C13.6577 18.5747 14.639 17.7828 15.5304 16.8915C16.4217 16.0001 17.2136 15.0188 17.8942 13.965C18.5749 15.0188 19.3668 16.0001 20.2581 16.8915C21.1494 17.7828 22.1308 18.5747 23.1846 19.2553C22.1308 19.936 21.1494 20.7279 20.2581 21.6192C19.3668 22.5105 18.5749 23.4919 17.8942 24.5457ZM20.7403 34.262C26.2104 33.0494 30.3076 28.1868 30.3454 22.3606C29.6155 22.5142 28.8996 22.7353 28.2072 23.0221C26.7396 23.63 25.4062 24.5209 24.283 25.6441C23.1598 26.7673 22.2689 28.1007 21.661 29.5683C21.0531 31.0358 20.7403 32.6087 20.7403 34.1971V34.262ZM28.2072 15.4886C28.8997 15.7754 29.6157 15.9966 30.3457 16.1502V8.32546C27.2901 7.08927 24.094 6.33295 20.8665 6.05649C21.0105 7.04543 21.2768 8.01497 21.661 8.94242C22.2689 10.4099 23.1598 11.7434 24.283 12.8665C25.4062 13.9897 26.7396 14.8807 28.2072 15.4886Z"
                  fill="#193070"
                >
                </path>
              </svg>
            </.link>
          </div>
          <div class="flex lg:hidden">
            <button
              type="button"
              command="show-modal"
              commandfor="mobile-menu"
              class="-m-2.5 inline-flex items-center justify-center rounded-md p-2.5 text-gray-700"
            >
              <span class="sr-only">Abrir menu principal</span>
              <svg
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="1.5"
                data-slot="icon"
                aria-hidden="true"
                class="size-6"
              >
                <path
                  d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                />
              </svg>
            </button>
          </div>
          <div class="hidden lg:flex lg:gap-x-12">
            <.link navigate={~p"/courses"} class="text-sm/6 font-semibold text-gray-900">
              Cursos
            </.link>
            <.link navigate={~p"/platforms"} class="text-sm/6 font-semibold text-gray-900">
              Plataformas
            </.link>
            <.link navigate={~p"/chat"} class="text-sm/6 font-semibold text-gray-900">
              Chat
            </.link>
          </div>
          <div class="hidden lg:flex lg:flex-1 lg:justify-end">
            <.link navigate={~p"/courses"} class="text-sm/6 font-semibold text-gray-900">
              Entrar <span aria-hidden="true">&rarr;</span>
            </.link>
          </div>
        </nav>
        <el-dialog>
          <dialog id="mobile-menu" class="backdrop:bg-transparent lg:hidden">
            <div tabindex="0" class="fixed inset-0 focus:outline-none">
              <el-dialog-panel class="fixed inset-y-0 right-0 z-50 w-full overflow-y-auto bg-white p-6 sm:max-w-sm sm:ring-1 sm:ring-gray-900/10">
                <div class="flex items-center justify-between">
                  <.link navigate={~p"/"} class="-m-1.5 p-1.5">
                    <span class="sr-only">Curso Guia</span>
                    <img
                      src="https://tailwindcss.com/plus-assets/img/logos/mark.svg?color=indigo&shade=600"
                      alt="Logo do Curso Guia"
                      class="h-8 w-auto"
                    />
                  </.link>
                  <button
                    type="button"
                    command="close"
                    commandfor="mobile-menu"
                    class="-m-2.5 rounded-md p-2.5 text-gray-700"
                  >
                    <span class="sr-only">Fechar menu</span>
                    <svg
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="currentColor"
                      stroke-width="1.5"
                      data-slot="icon"
                      aria-hidden="true"
                      class="size-6"
                    >
                      <path d="M6 18 18 6M6 6l12 12" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                  </button>
                </div>
                <div class="mt-6 flow-root">
                  <div class="-my-6 divide-y divide-gray-500/10">
                    <div class="space-y-2 py-6">
                      <a
                        href="#"
                        class="-mx-3 block rounded-lg px-3 py-2 text-base/7 font-semibold text-gray-900 hover:bg-gray-50"
                      >
                        Avaliações
                      </a>
                      <a
                        href="#"
                        class="-mx-3 block rounded-lg px-3 py-2 text-base/7 font-semibold text-gray-900 hover:bg-gray-50"
                      >
                        Cursos
                      </a>
                      <a
                        href="#"
                        class="-mx-3 block rounded-lg px-3 py-2 text-base/7 font-semibold text-gray-900 hover:bg-gray-50"
                      >
                        Sobre
                      </a>
                      <a
                        href="#"
                        class="-mx-3 block rounded-lg px-3 py-2 text-base/7 font-semibold text-gray-900 hover:bg-gray-50"
                      >
                        Contato
                      </a>
                    </div>
                    <div class="py-6">
                      <a
                        href="#"
                        class="-mx-3 block rounded-lg px-3 py-2.5 text-base/7 font-semibold text-gray-900 hover:bg-gray-50"
                      >
                        Entrar
                      </a>
                    </div>
                  </div>
                </div>
              </el-dialog-panel>
            </div>
          </dialog>
        </el-dialog>
      </header>

      <div class="relative isolate px-6 pt-14 lg:px-8">
        <div
          aria-hidden="true"
          class="absolute inset-x-0 -top-40 -z-10 transform-gpu overflow-hidden blur-3xl sm:-top-80"
        >
          <div
            style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%)"
            class="relative left-[calc(50%-11rem)] aspect-1155/678 w-144.5 -translate-x-1/2 rotate-30 bg-linear-to-tr from-[#ff80b5] to-[#9089fc] opacity-30 sm:left-[calc(50%-30rem)] sm:w-288.75"
          >
          </div>
        </div>
        <div class="mx-auto max-w-2xl py-32 sm:py-48 lg:py-56">
          <div class="hidden sm:mb-8 sm:flex sm:justify-center">
            <div class="relative rounded-full px-3 py-1 text-sm/6 text-gray-600 ring-1 ring-gray-900/10 hover:ring-gray-900/20">
              Descubra os melhores cursos avaliados pela comunidade.
              <.link navigate={~p"/courses"} class="font-semibold text-indigo-600">
                <span aria-hidden="true" class="absolute inset-0"></span>Saiba mais
                <span aria-hidden="true">&rarr;</span>
              </.link>
            </div>
          </div>
          <div class="text-center">
            <h1 class="text-5xl font-semibold tracking-tight text-balance text-gray-900 sm:text-7xl">
              Avalie e descubra cursos de qualidade
            </h1>
            <p class="mt-8 text-lg font-medium text-pretty text-gray-500 sm:text-xl/8">
              Encontre avaliações reais de cursos que você já fez ou quer fazer. Compartilhe sua experiência e ajude outros alunos a escolherem os melhores cursos disponíveis!
            </p>
            <div class="mt-10 flex items-center justify-center gap-x-6">
              <.link
                navigate={~p"/courses"}
                class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-xs hover:bg-indigo-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
              >
                Avaliar cursos
              </.link>
            </div>
          </div>
        </div>
        <div
          aria-hidden="true"
          class="absolute inset-x-0 top-[calc(100%-13rem)] -z-10 transform-gpu overflow-hidden blur-3xl sm:top-[calc(100%-30rem)]"
        >
          <div
            style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%)"
            class="relative left-[calc(50%+3rem)] aspect-1155/678 w-144.5 -translate-x-1/2 bg-linear-to-tr from-[#ff80b5] to-[#9089fc] opacity-30 sm:left-[calc(50%+36rem)] sm:w-288.75"
          >
          </div>
        </div>
      </div>
    </div>
    """
  end
end
