defmodule Geboku.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Geboku.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Geboku.PubSub}
      # Start a worker by calling: Geboku.Worker.start_link(arg)
      # {Geboku.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Geboku.Supervisor)
  end
end
