defmodule ElixirServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    port = String.to_integer(System.get_env("PORT") || "4040")

    children = [
      # Starts a worker by calling: ElixirServer.Worker.start_link(arg)
      # {ElixirServer.Worker, arg}
      {Task.Supervisor, name: ElixirServer.TaskSupervisor},
      {Task, fn -> ElixirServer.accept(port) end}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
