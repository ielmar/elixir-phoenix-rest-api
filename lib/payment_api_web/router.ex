defmodule PaymentApiWeb.Router do
  use PaymentApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    # plug :fetch_session
    # plug :fetch_flash
    # plug :protect_from_forgery
    # plug :put_secure_browser_headers
  end

  scope "/api", PaymentApiWeb do
    pipe_through :api
    post "/create", PaymentController, :create
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:payment_api, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: PaymentApiWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
