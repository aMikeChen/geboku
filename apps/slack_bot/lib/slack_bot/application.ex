defmodule SlackBot.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      SlackBot.Handler
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: SlackBot.Supervisor)
  end
end
