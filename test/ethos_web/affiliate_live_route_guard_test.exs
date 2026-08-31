defmodule EthosWeb.AffiliateLiveRouteGuardTest do
  @moduledoc """
  Pins the assumption underneath the affiliate components' LiveView guard.

  `EthosWeb.Affiliate.locale_from_assigns/1` returns `nil` the moment the
  assigns carry `:socket` or `:live_module` — that is, for any LiveView render
  of either layout. The stated *reason* is "authoring and account screens are
  not visitor intent", but the *mechanism* keys on "this is a LiveView". Those
  two descriptions pick out the same pages today only because every LiveView in
  this router happens to sit behind authentication.

  Nothing in the components can notice when that stops being true. A public
  page turned into a LiveView — live search, a filterable destination hub —
  would silently lose both affiliate tags on every geography, and no existing
  test would go red, because none of them assert a *public LiveView* renders
  the widget.

  This test is the tripwire. If a `live` route ever becomes publicly
  reachable, decide deliberately: either that page is not a LiveView, or
  `locale_from_assigns/1` needs a tell finer than "is a LiveView".
  """
  use ExUnit.Case, async: true

  # `Router.__routes__/0` does not expose `pipe_through` — the compiled route
  # map carries only path, verb, plug, plug_opts, helper and metadata. The
  # live_session's `on_mount` is the equivalent tell, and the stronger one: the
  # pipeline guards the HTTP request, the on_mount also guards the connected
  # render. These are the two `EthosWeb.UserAuth` stages behind the router's
  # `:require_authenticated_user` and `:redirect_if_user_is_authenticated`
  # scopes.
  @authenticating_on_mounts [
    {EthosWeb.UserAuth, :ensure_authenticated},
    {EthosWeb.UserAuth, :redirect_if_user_is_authenticated}
  ]

  # The confirmation flow runs on the bare `:browser` pipeline by necessity — a
  # user clicking a confirmation link from their email is not logged in — so it
  # has no authenticating on_mount. It is still an account screen, never a page
  # a visitor browses for content, so it is allowed by live_session name.
  # Naming it explicitly means a NEW live_session cannot join by accident.
  @account_live_sessions [:current_user]

  defp live_session(route) do
    case route.metadata[:phoenix_live_view] do
      {_view, _action, _opts, session} when is_map(session) -> session
      _ -> %{}
    end
  end

  defp authoring_or_account?(route) do
    session = live_session(route)
    on_mount_ids = for m <- get_in(session, [:extra, :on_mount]) || [], do: m.id

    Enum.any?(on_mount_ids, &(&1 in @authenticating_on_mounts)) or
      Map.get(session, :name) in @account_live_sessions
  end

  test "every live route is an authoring or account screen, never a public page" do
    live_routes =
      EthosWeb.Router.__routes__() |> Enum.filter(&(&1.plug == Phoenix.LiveView.Plug))

    # Non-vacuity: if the router stops defining live routes altogether, or the
    # route map stops reporting them this way, the reject below is vacuous and
    # this guard is silently gone.
    assert live_routes != [],
           "no live routes found at all — this guard is no longer checking anything"

    offenders = live_routes |> Enum.reject(&authoring_or_account?/1) |> Enum.map(& &1.path)

    assert offenders == [],
           "these live routes are reachable by an anonymous visitor: #{inspect(offenders)}.\n" <>
             "EthosWeb.Affiliate.locale_from_assigns/1 returns nil for every LiveView render " <>
             "(it keys on the :socket / :live_module assigns), so a PUBLIC LiveView would " <>
             "silently lose BOTH affiliate tags — no script in root.html.heex and no widget " <>
             "in app.html.heex — on every page in every configured geography, with the rest " <>
             "of the suite still green. Either keep this page a controller-rendered view, or " <>
             "replace that guard with a tell that distinguishes authoring screens from " <>
             "public pages, and update affiliate.ex's moduledoc to match."
  end
end
