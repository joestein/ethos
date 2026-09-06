defmodule EthosWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use EthosWeb, :controller` and
  `use EthosWeb, :live_view`.
  """
  use EthosWeb, :html

  embed_templates "layouts/*"

  @doc """
  The site header: wordmark, search, and navigation.

  A function component rather than markup inside `app.html.heex`, because the
  home page renders with `layout: false` — its hero is full-width and would be
  squeezed by the app layout's `max-w-2xl` container. Before this existed the
  home page simply had no header, so a logged-out visitor landing on the front
  door got no search box and no way into the destinations.

  `@current_user` is assigned on every browser request by `fetch_current_user`
  in the `:browser` pipeline, so it is `nil` rather than missing when nobody is
  signed in. Search and Destinations sit outside that check deliberately: they
  are the two things a first-time visitor needs.
  """
  attr :current_user, :any, default: nil

  def site_header(assigns) do
    ~H"""
    <header class="px-4 sm:px-6 lg:px-8">
      <div class="flex items-center justify-between border-b border-zinc-100 py-3 text-sm">
        <a href={~p"/"} class="text-lg font-bold tracking-tight text-zinc-900">
          Ethos
        </a>
        <nav class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">
          <form action={~p"/search"} method="get" class="hidden sm:block">
            <input
              type="search"
              name="q"
              placeholder="Search"
              class="w-36 rounded-lg border-zinc-300 py-1 text-sm"
            />
          </form>
          <.link href={~p"/destinations"} class="hover:text-zinc-700">
            Destinations
          </.link>
          <%= if @current_user do %>
            <.link
              :if={Ethos.Accounts.admin?(@current_user)}
              navigate={~p"/guides"}
              class="hover:text-zinc-700"
            >
              Your guides
            </.link>
            <.link navigate={~p"/badges"} class="hover:text-zinc-700">
              Badges
            </.link>
            <.link
              :if={Ethos.Accounts.admin?(@current_user)}
              navigate={~p"/admin/comments"}
              class="hover:text-zinc-700"
            >
              Admin
            </.link>
          <% end %>
          <.link
            :if={Ethos.Accounts.admin?(@current_user)}
            navigate={~p"/guides/new"}
            class="rounded-lg bg-zinc-900 px-3 py-1 text-white hover:bg-zinc-700"
          >
            Make a guide <span aria-hidden="true">&rarr;</span>
          </.link>
        </nav>
      </div>
    </header>
    """
  end
end
