defmodule EthosWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :ethos

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_ethos_key",
    signing_salt: "aJMfSNUK",
    same_site: "Lax"
  ]

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]],
    longpoll: [connect_info: [session: @session_options]]

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/uploads",
    from: {:ethos, "priv/uploads"},
    gzip: false

  # Guide photos live outside priv/static deliberately. There are thousands of
  # them (~300 MB), their paths are stored in the database rather than emitted
  # through ~p static helpers, so a digested copy would never be requested —
  # leaving them in priv/static made `mix phx.digest` duplicate the whole set
  # into the release image for nothing.
  plug Plug.Static,
    at: "/photos",
    from: {:ethos, "priv/photos"},
    gzip: false

  plug Plug.Static,
    at: "/",
    from: :ethos,
    gzip: false,
    only: EthosWeb.static_paths()

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :ethos
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug EthosWeb.Router
end
