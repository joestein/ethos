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

  ## The thumbs are not rendered

  Reactions still exist end to end — the schema, `Ethos.Social.react/3`, the
  badge rules that count reacted places, and the `"react"` handler below with
  its guards. Only the buttons are gone.

  The handler and its guards stay deliberately. Hiding a control is not a
  security boundary: a crafted socket frame can still send `"react"`, and it
  must still be refused for a logged-out visitor, one without a username, and
  a permanently closed place. The tests for those forged events are the reason
  this code keeps its teeth while nothing renders it.

  Keeping it also means restoring the buttons is a render change rather than a
  feature rebuild.
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

    {
      :ok,
      socket
      |> assign(
        subject: subject,
        rating: nil,
        rating_error: nil,
        # Stable per subject so two islands on one page cannot collide, and so
        # the JS that opens the modal can name it without a server round trip.
        modal_id: "social-reviews-#{type}-#{id}"
      )
      |> load_reactions()
      |> load_reviews(),
      # `layout: false`, and it is load-bearing.
      #
      # `use EthosWeb, :live_view` sets `layout: {EthosWeb.Layouts, :app}`, which
      # is right for a LiveView that owns a page and wrong for one embedded with
      # `live_render/3`. Without this the island wrapped its own output in the
      # whole site chrome, so every place, guide and collection page served two
      # site headers, two search boxes and two footers nested inside itself.
      #
      # It hid for as long as the island sat at the bottom of the page, where a
      # stray header and footer read as part of the real footer. Moving the
      # island up under the title put that nested chrome between the title and
      # the location line, which is how it was finally noticed.
      layout: false
    }
  end

  def render(assigns) do
    ~H"""
    <div class="mt-2">
      <%!-- This island runs as its own isolated LiveView (see the moduledoc), so
            the page's own flash group never sees flashes set in here — this is
            the only place a newly earned badge can be shown. --%>
      <.flash kind={:info} flash={@flash} id="social-badge-flash" />

      <%!-- Two lines at most, and quiet. This sits directly under the page
            title, above the destination line, so anything louder competes with
            the title itself. `flex-wrap` is what keeps it to two lines on a
            narrow screen instead of overflowing. --%>
      <div class="flex flex-wrap items-center gap-x-3 gap-y-1 text-sm text-ink-muted">
        <span :if={@summary.count > 0}>
          <span class="font-medium text-ink">{@summary.average}</span>/10
        </span>

        <span :if={@summary.count > 0} aria-hidden="true">·</span>

        <%!-- Reading reviews is open to everyone, logged in or not. Only adding
              one requires an account, which is decided inside the modal. --%>
        <button
          type="button"
          phx-click={show_modal(@modal_id)}
          class="underline underline-offset-2 hover:text-ink"
        >
          {reviews_label(@summary.count)}
        </button>
      </div>

      <.modal id={@modal_id}>
        <h2 class="font-display text-display-sm">What travelers think</h2>

        <div :if={@summary.count > 0} class="mt-1 flex items-baseline gap-2">
          <span class="text-2xl font-semibold">{@summary.average}</span>
          <span class="text-sm text-ink-muted">
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

        <.prompt :if={@prompt} kind={@prompt} />

        <p :if={@own_review && @own_review.status == "pending"} class="mt-3 text-sm text-ink-muted">
          Your review is waiting to be approved.
        </p>

        <p :if={@reviews == []} class="mt-6 text-sm text-ink-muted">
          No reviews yet.
        </p>

        <ul class="mt-6 space-y-5">
          <li :for={review <- @reviews} class="border-t border-line pt-4 first:border-t-0 first:pt-0">
            <div class="flex items-baseline gap-2">
              <span class="font-semibold">{Accounts.display_name(review.user)}</span>
              <span class="text-sm text-ink-muted">{review.rating}/10</span>
            </div>
            <p class="mt-1 whitespace-pre-line">{review.body}</p>
          </li>
        </ul>
      </.modal>
    </div>
    """
  end

  # "Be the first to review" rather than "0 reviews": the empty state is the
  # one that most needs to invite, and a zero reads as a dead end.
  defp reviews_label(0), do: "Be the first to review"
  defp reviews_label(1), do: "1 review"
  defp reviews_label(n), do: "#{n} reviews"

  attr :kind, :atom, required: true

  # One clause per prompt kind rather than a plain string assign: the
  # logged-out and needs-username prompts are the site's only call to action
  # to log in or pick a username on this page, so they have to be real links,
  # not inert text a visitor can't act on.
  defp prompt(%{kind: :closed} = assigns) do
    ~H"""
    <p class="mt-4 text-sm text-ink-muted">
      This place is permanently closed. Reactions are kept for reference and can no longer change.
    </p>
    """
  end

  defp prompt(%{kind: :logged_out} = assigns) do
    ~H"""
    <p class="mt-4 text-sm text-ink-muted">
      <.link href={~p"/users/log_in"} class="underline">Log in to react.</.link>
    </p>
    """
  end

  defp prompt(%{kind: :needs_username} = assigns) do
    ~H"""
    <p class="mt-4 text-sm text-ink-muted">
      <.link href={~p"/users/username"} class="underline">Pick a username to join in.</.link>
    </p>
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
          class={
            [
              "h-8 w-8 rounded border border-line text-sm text-ink",
              # `star` DOES move with the season, unlike the thumbs above — see
              # the comment on `thumb/1`. That asymmetry is the design, not a
              # bug: a 1-10 rating is decorative colour, a thumbs-up is a claim.
              @rating && value <= @rating && "bg-star border-star",
              !(@rating && value <= @rating) && "hover:bg-surface-raised"
            ]
          }
        >
          {value}
        </button>
      </div>

      <p :if={@rating_error} class="mt-1 text-sm text-negative">{@rating_error}</p>

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
