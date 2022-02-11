defmodule Minicraft.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # {Minicraft.Server, :ironman},
      # {Minicraft.Server, :yoda},
      # {Minicraft.Server, :blackpanther},
      # {Minicraft.Server, :thanos},
      # {Minicraft.Server, :batman},
      {DynamicSupervisor, strategy: :one_for_one, name: :sup}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: Minicraft.Supervisor]
    Supervisor.start_link(children, opts)
  end


end
