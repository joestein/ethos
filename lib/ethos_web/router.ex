defmodule EthosWeb.Router do
  use EthosWeb, :router

  import EthosWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {EthosWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EthosWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/g/:slug", GuideController, :show
    get "/g/:slug/photos", GuideController, :photos
    get "/destinations", DestinationController, :index
    get "/destinations/:slug", DestinationController, :show
    get "/destinations/:state_slug/:county_slug", DestinationController, :county
    get "/p/:slug", PlaceController, :show
    get "/sitemap.xml", SitemapController, :index
    get "/robots.txt", RobotsController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", EthosWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:ethos, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: EthosWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", EthosWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live_session :redirect_if_user_is_authenticated,
      on_mount: [{EthosWeb.UserAuth, :redirect_if_user_is_authenticated}] do
      live "/users/register", UserRegistrationLive, :new
      live "/users/log_in", UserLoginLive, :new
      live "/users/reset_password", UserForgotPasswordLive, :new
      live "/users/reset_password/:token", UserResetPasswordLive, :edit
    end

    post "/users/log_in", UserSessionController, :create
  end

  scope "/", EthosWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [{EthosWeb.UserAuth, :ensure_authenticated}] do
      live "/users/settings", UserSettingsLive, :edit
      live "/users/settings/confirm_email/:token", UserSettingsLive, :confirm_email

      live "/guides", GuideLive.Index, :index
      live "/guides/new", GuideLive.New, :new
      live "/guides/:id/import", GuideLive.Import, :import
      live "/guides/:id/confirm", GuideLive.Confirm, :confirm
      live "/guides/:id/edit", GuideLive.Edit, :edit
      live "/guides/:id/share", GuideLive.Share, :share
      live "/guides/:id/suggestions", GuideLive.Suggestions, :suggestions

      live "/g/:slug/suggest", SuggestLive, :new
    end

    post "/g/:slug/entries/:entry_id/research", GuideController, :research
    post "/p/:slug/visit", PlaceController, :visit
    get "/badges", BadgeController, :index
  end

  scope "/", EthosWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete

    live_session :current_user,
      on_mount: [{EthosWeb.UserAuth, :mount_current_user}] do
      live "/users/confirm/:token", UserConfirmationLive, :edit
      live "/users/confirm", UserConfirmationInstructionsLive, :new
    end
  end
end
