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
      <div class="flex items-center justify-between border-b border-line py-3 text-sm">
        <a href={~p"/"} class="text-lg font-bold tracking-tight text-ink">
          Ethos
        </a>
        <nav class="flex items-center gap-4 font-semibold leading-6 text-ink">
          <form action={~p"/search"} method="get" class="hidden sm:block">
            <input
              type="search"
              name="q"
              placeholder="Search"
              class="w-36 rounded-lg border-line py-1 text-sm"
            />
          </form>
          <.link href={~p"/destinations"} class="hover:text-ink-muted">
            Destinations
          </.link>
          <%= if @current_user do %>
            <.link
              :if={Ethos.Accounts.admin?(@current_user)}
              navigate={~p"/guides"}
              class="hover:text-ink-muted"
            >
              Your guides
            </.link>
            <.link navigate={~p"/badges"} class="hover:text-ink-muted">
              Badges
            </.link>
            <.link
              :if={Ethos.Accounts.admin?(@current_user)}
              navigate={~p"/admin/comments"}
              class="hover:text-ink-muted"
            >
              Admin
            </.link>
          <% end %>
          <.link
            :if={Ethos.Accounts.admin?(@current_user)}
            navigate={~p"/guides/new"}
            class="rounded-lg bg-accent px-3 py-1 text-accent-ink hover:opacity-90"
          >
            Make a guide <span aria-hidden="true">&rarr;</span>
          </.link>
        </nav>
      </div>
    </header>
    """
  end

  @doc """
  The site footer.

  Rendered from `app.html.heex` AND from `page_html/home.html.heex`, because
  the home page renders with `layout: false` and never passes through the app
  layout. Two call sites, for the same reason `site_header/1` has two.
  """
  def site_footer(assigns) do
    ~H"""
    <footer class="mt-16 border-t border-line px-4 py-8 text-sm text-ink-muted sm:px-6 lg:px-8">
      <div class="mx-auto flex max-w-2xl items-center justify-between">
        <span>Ethos</span>
        <nav class="flex gap-4">
          <.link navigate={~p"/destinations"} class="hover:text-ink">Destinations</.link>
          <.link navigate={~p"/privacy"} class="hover:text-ink">Privacy</.link>
        </nav>
      </div>
    </footer>
    """
  end
end
