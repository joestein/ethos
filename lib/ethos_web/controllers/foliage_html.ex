defmodule EthosWeb.FoliageHTML do
  use EthosWeb, :html

  embed_templates "foliage_html/*"

  @doc "The week selector: ordinary links, so it works with scripting off."
  attr :weeks, :list, required: true
  attr :current, :integer, required: true
  attr :base, :string, required: true

  def week_selector(assigns) do
    ~H"""
    <nav class="mt-4 flex flex-wrap gap-1" aria-label="Week">
      <.link
        :for={week <- @weeks}
        href={"#{@base}?week=#{week.index}"}
        aria-current={week.index == @current && "page"}
        class={[
          "rounded border px-2 py-1 text-xs",
          week.index == @current && "border-zinc-900 bg-zinc-900 text-white",
          week.index != @current && "border-zinc-300 text-zinc-700 hover:border-zinc-500"
        ]}
      >
        {week.label}
      </.link>
    </nav>
    """
  end

  @doc "The colour key. Stage names are ours, not DEEP's, and the page says so."
  def stage_key(assigns) do
    assigns = assign(assigns, :stages, Ethos.Foliage.stage_labels())

    ~H"""
    <ul class="mt-3 flex flex-wrap gap-3 text-xs text-zinc-600">
      <li :for={{stage, label} <- @stages} class="flex items-center gap-1.5">
        <span
          class="inline-block h-3 w-3 rounded-sm"
          style={"background-color: #{Ethos.Foliage.stage_color(stage)}"}
        />
        {label}
      </li>
    </ul>
    """
  end

  @doc "A dated editorial note, or nothing at all. There is no empty state."
  attr :note, :any, required: true

  def field_note(assigns) do
    ~H"""
    <aside :if={@note} class="mt-6 border-l-2 border-zinc-300 pl-4">
      <p class="text-xs uppercase tracking-wide text-zinc-500">
        Field note · {Calendar.strftime(@note.published_on, "%B %-d")}
      </p>
      <div class="prose prose-sm mt-2">{EthosWeb.Markdown.render(@note.body)}</div>
    </aside>
    """
  end
end
