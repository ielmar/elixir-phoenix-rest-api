defmodule PaymentApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PaymentApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PaymentApi.PubSub},
      # Start Finch
      {Finch, name: PaymentApi.Finch},
      # Start the Endpoint (http/https)
      PaymentApiWeb.Endpoint
      # Start a worker by calling: PaymentApi.Worker.start_link(arg)
      # {PaymentApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PaymentApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PaymentApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
