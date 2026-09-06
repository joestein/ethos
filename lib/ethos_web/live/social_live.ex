defmodule EthosWeb.SocialLive do
  @moduledoc """
  The social block, embedded in the place, guide and collection show pages.

  Those pages are plain controllers, and they stay that way: all of the
  SEO work — JSON-LD, canonical URLs, OG cards, meta descriptions — lives
  in those controllers, and converting them to LiveViews would rewrite
  code other branches are actively editing for no user-visible gain. So
  this renders as an island via `live_render/3` instead. It server-renders
  on first paint, which is what keeps the content indexable.

  One LiveView serves all three subject types; `Ethos.Social.Subject` is
  what knows the difference.
  """
  use EthosWeb, :live_view

  on_mount {EthosWeb.UserAuth, :mount_current_user}

  alias Ethos.Accounts
  alias Ethos.Badges
  alias Ethos.Places.Place
  alias Ethos.Social
  alias Ethos.Social.Review
  alias Ethos.Social.Subject

  def mount(_params, %{"subject_type" => type, "subject_id" => id}, socket) do
    subject = Subject.get!(type, id)

    {:ok,
     socket
     |> assign(subject: subject, rating: nil, rating_error: nil)
     |> load_reactions()
     |> load_reviews()}
  end

  def render(assigns) do
    ~H"""
    <section class="mt-10 rounded-xl border p-5">
      <%!-- This island runs as its own isolated LiveView (see the moduledoc), so
            the page's own flash group never sees flashes set in here — this is
            the only place a newly earned badge can be shown. --%>
      <.flash kind={:info} flash={@flash} id="social-badge-flash" />

      <h2 class="text-sm font-semibold uppercase tracking-wide text-zinc-500">
        What travelers think
      </h2>

      <div class="mt-4 flex items-start gap-8">
        <.thumb
          value="up"
          label="👍"
          count={@counts.up}
          mine={@mine == "up"}
          interactive={@interactive}
        />
        <.thumb
          value="down"
          label="👎"
          count={@counts.down}
          mine={@mine == "down"}
          interactive={@interactive}
        />
      </div>

      <.prompt :if={@prompt} kind={@prompt} />

      <div class="mt-8 border-t pt-6">
        <div :if={@summary.count > 0} class="flex items-baseline gap-2">
          <span class="text-2xl font-semibold">{@summary.average}</span>
          <span class="text-sm text-zinc-500">
            out of 10 · {@summary.count} {if @summary.count == 1, do: "review", else: "reviews"}
          </span>
        </div>

        <.review_form
          :if={@review_interactive}
          form={@review_form}
          rating={@rating}
          rating_error={@rating_error}
          existing={@own_review}
        />

        <p :if={@own_review && @own_review.status == "pending"} class="mt-3 text-sm text-zinc-500">
          Your review is waiting to be approved.
        </p>

        <ul class="mt-6 space-y-5">
          <li :for={review <- @reviews} class="border-t pt-4 first:border-t-0 first:pt-0">
            <div class="flex items-baseline gap-2">
              <span class="font-semibold">{Accounts.display_name(review.user)}</span>
              <span class="text-sm text-zinc-500">{review.rating}/10</span>
            </div>
            <p class="mt-1 whitespace-pre-line">{review.body}</p>
          </li>
        </ul>
      </div>
    </section>
    """
  end

  attr :kind, :atom, required: true

  # One clause per prompt kind rather than a plain string assign: the
  # logged-out and needs-username prompts are the site's only call to action
  # to log in or pick a username on this page, so they have to be real links,
  # not inert text a visitor can't act on.
  defp prompt(%{kind: :closed} = assigns) do
    ~H"""
    <p class="mt-4 text-sm text-zinc-500">
      This place is permanently closed. Reactions are kept for reference and can no longer change.
    </p>
    """
  end

  defp prompt(%{kind: :logged_out} = assigns) do
    ~H"""
    <p class="mt-4 text-sm text-zinc-500">
      <.link navigate={~p"/users/log_in"} class="underline">Log in to react.</.link>
    </p>
    """
  end

  defp prompt(%{kind: :needs_username} = assigns) do
    ~H"""
    <p class="mt-4 text-sm text-zinc-500">
      <.link navigate={~p"/users/username"} class="underline">Pick a username to join in.</.link>
    </p>
    """
  end

  attr :value, :string, required: true
  attr :label, :string, required: true
  attr :count, :integer, required: true
  attr :mine, :boolean, required: true
  attr :interactive, :boolean, required: true

  # The count sits directly beneath its own button, so "34 people liked this"
  # reads off the layout without a legend.
  defp thumb(assigns) do
    ~H"""
    <div class="flex flex-col items-center gap-1">
      <button
        :if={@interactive}
        type="button"
        phx-click="react"
        phx-value-value={@value}
        aria-pressed={to_string(@mine)}
        class={[
          "rounded-lg border px-4 py-2 text-xl transition",
          @mine && "border-zinc-900 bg-zinc-100",
          !@mine && "hover:bg-zinc-50"
        ]}
      >
        {@label}
      </button>
      <span :if={!@interactive} class="rounded-lg border px-4 py-2 text-xl opacity-60">
        {@label}
      </span>
      <%!-- data-reaction-count is the hook the tests read. Without it they would have
            to assert on bare text, which passes on any stray digit on the page. --%>
      <span data-reaction-count={@value} class="text-sm font-medium text-zinc-600">
        {@count}
      </span>
    </div>
    """
  end

  attr :form, :any, required: true
  attr :rating, :integer, default: nil
  attr :rating_error, :string, default: nil
  attr :existing, :any, default: nil

  defp review_form(assigns) do
    ~H"""
    <div class="mt-4">
      <p class="text-sm font-medium">
        {if @existing, do: "Your review", else: "Rate it out of ten"}
      </p>

      <div class="mt-2 flex flex-wrap gap-1">
        <button
          :for={value <- 1..10}
          type="button"
          phx-click="rate"
          phx-value-rating={value}
          aria-pressed={to_string(@rating == value)}
          class={[
            "h-8 w-8 rounded border text-sm",
            @rating && value <= @rating && "bg-amber-400 border-amber-500",
            !(@rating && value <= @rating) && "hover:bg-zinc-50"
          ]}
        >
          {value}
        </button>
      </div>

      <p :if={@rating_error} class="mt-1 text-sm text-red-600">{@rating_error}</p>

      <.form for={@form} id="review-form" phx-submit="submit_review" class="mt-3">
        <.input
          field={@form[:body]}
          type="textarea"
          label="Why?"
          placeholder="What made it worth it — or not?"
        />
        <.button phx-disable-with="Sending...">
          {if @existing, do: "Update review", else: "Post review"}
        </.button>
      </.form>
    </div>
    """
  end

  def handle_event("react", %{"value" => value}, socket) do
    # Checked here and not only in the template: the buttons are absent for a
    # visitor who may not react (logged out, no username yet, or the subject
    # is a closed place), but a crafted socket message does not care what the
    # template rendered.
    if socket.assigns.interactive do
      user = socket.assigns.current_user
      subject = socket.assigns.subject
      before_keys = earned_badge_keys(subject, user)

      case Social.react(user, subject, value) do
        {:ok, _outcome} ->
          {:noreply, socket |> flash_new_badges(subject, user, before_keys) |> load_reactions()}

        {:error, _reason} ->
          {:noreply, socket}
      end
    else
      {:noreply, socket}
    end
  end

  # Guarded on `interactive` like `react`, and parsed defensively like the
  # comment on the catch-all below demands: `phx-value-rating` is a plain
  # client-supplied string, so a crafted frame can send anything at all —
  # non-numeric, negative, out of range, or trailing garbage like "5x"
  # (`Integer.parse/1` alone would accept that: it returns `{5, "x"}`, not
  # `:error`). None of that may raise or silently set a bogus rating.
  def handle_event("rate", %{"rating" => rating}, socket) do
    if socket.assigns.interactive do
      case parse_rating(rating) do
        {:ok, value} ->
          {:noreply, assign(socket, rating: value, rating_error: nil)}

        :error ->
          {:noreply, assign(socket, rating_error: "Pick a rating from 1 to 10.")}
      end
    else
      {:noreply, socket}
    end
  end

  # `when is_map(params)` matters: LiveView decodes form events with
  # `Plug.Conn.Query.decode/1`, so a crafted frame carrying `review=hello`
  # (rather than `review[body]=hello`) still matches `%{"review" => params}`
  # above, but binds `params` to the binary `"hello"` instead of a map. The
  # `params["body"]` access below would then raise `FunctionClauseError` —
  # `Access.get/3` has no clause for a binary — and kill the island. The
  # guard sends anything non-map to the catch-all instead.
  def handle_event("submit_review", %{"review" => params}, socket) when is_map(params) do
    cond do
      not socket.assigns.review_interactive ->
        {:noreply, socket}

      is_nil(socket.assigns.rating) ->
        {:noreply, assign(socket, rating_error: "Pick a rating from 1 to 10.")}

      true ->
        save_review(socket, params)
    end
  end

  # A crafted socket frame with a missing or differently-shaped payload must
  # not raise and kill the island process.
  def handle_event(_event, _params, socket), do: {:noreply, socket}

  # Read before the react call, only for places — guides and collections
  # never award badges, so there is no reason to pay for the query there.
  defp earned_badge_keys(%Place{}, user),
    do: MapSet.new(Badges.earned_badges(user), & &1.badge_key)

  defp earned_badge_keys(_subject, _user), do: nil

  defp flash_new_badges(socket, %Place{}, user, %MapSet{} = before_keys) do
    newly_earned =
      Badges.earned_badges(user)
      |> Enum.reject(&MapSet.member?(before_keys, &1.badge_key))

    case newly_earned do
      [] ->
        socket

      earned ->
        definitions = Map.new(Badges.definitions(), &{&1.key, &1})

        earned
        |> Enum.map(&Map.fetch!(definitions, &1.badge_key))
        |> badge_flash_message()
        |> then(&put_flash(socket, :info, &1))
    end
  end

  defp flash_new_badges(socket, _subject, _user, _before_keys), do: socket

  defp badge_flash_message([definition]),
    do: "Badge earned: #{definition.emoji} #{definition.name}"

  defp badge_flash_message(definitions) do
    names = Enum.map_join(definitions, ", ", &"#{&1.emoji} #{&1.name}")
    "Badges earned: #{names}"
  end

  defp save_review(socket, params) do
    user = socket.assigns.current_user
    subject = socket.assigns.subject
    attrs = %{"rating" => socket.assigns.rating, "body" => params["body"]}

    result =
      case socket.assigns.own_review do
        nil -> Social.create_review(user, subject, attrs)
        existing -> Social.update_review(existing, user, attrs)
      end

    case result do
      {:ok, _review} ->
        {:noreply, socket |> assign(rating_error: nil) |> load_reviews()}

      {:error, changeset} ->
        # `review_form` is bound to `:body` only, so a `:rating` error on the
        # changeset (defense in depth — `parse_rating/1` above already keeps
        # `@rating` in 1..10) would otherwise render nothing and make the
        # submit look like a silent no-op, with every button still shown
        # highlighted by the stale `@rating`. Surface it through the same
        # `rating_error` assign the picker already renders.
        socket = assign(socket, review_form: to_form(changeset, as: "review"))

        socket =
          if Keyword.has_key?(changeset.errors, :rating) do
            assign(socket, rating_error: "Pick a rating from 1 to 10.")
          else
            socket
          end

        {:noreply, socket}
    end
  end

  # `Integer.parse/1` alone is not enough: it returns `{5, "x"}` for `"5x"`
  # rather than `:error`, so the remainder must be checked too. Accepts only
  # a whole number in 1..10 — anything else, including non-binary input from
  # a malformed frame, is `:error`.
  defp parse_rating(value) when is_binary(value) do
    case Integer.parse(value) do
      {int, ""} when int in 1..10 -> {:ok, int}
      _ -> :error
    end
  end

  defp parse_rating(_value), do: :error

  defp load_reviews(socket) do
    user = socket.assigns[:current_user]
    subject = socket.assigns.subject
    own = Social.user_review(user, subject)

    assign(socket,
      reviews: Social.approved_reviews(subject),
      summary: Social.rating_summary(subject),
      own_review: own,
      rating: socket.assigns[:rating] || (own && own.rating),
      review_form: to_form(Review.changeset(own || %Review{}, %{}), as: "review")
    )
  end

  defp load_reactions(socket) do
    user = socket.assigns[:current_user]
    subject = socket.assigns.subject

    assign(socket,
      counts: Social.counts(subject),
      mine: Social.user_reaction(user, subject),
      interactive: interactive?(user, subject),
      review_interactive: review_interactive?(user),
      prompt: prompt_for(user, subject)
    )
  end

  defp interactive?(user, subject) do
    not is_nil(user) and not Accounts.needs_username?(user) and Subject.reactable?(subject)
  end

  # Deliberately NOT `Subject.reactable?/1`: that predicate exists to stop a
  # closed place's reactions from moving (and inflating badge progress — see
  # its moduledoc), but a review is a considered write, not a tally. Gating
  # it on reactable? meant closing a place made the review form vanish too —
  # including for the author of an already-pending review, who could then
  # never edit it back into an approvable shape. A closed place is exactly
  # the kind of thing people want to leave a review about, so only the
  # logged-in/has-a-username conditions apply here.
  defp review_interactive?(user) do
    not is_nil(user) and not Accounts.needs_username?(user)
  end

  defp prompt_for(user, subject) do
    cond do
      not Subject.reactable?(subject) -> :closed
      is_nil(user) -> :logged_out
      Accounts.needs_username?(user) -> :needs_username
      true -> nil
    end
  end
end
