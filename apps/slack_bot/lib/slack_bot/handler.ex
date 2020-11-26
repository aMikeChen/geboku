defmodule SlackBot.Handler do
  @moduledoc false

  use Slack

  require Logger

  def start_link do
    token = Application.get_env(:slack, :api_token)
    Slack.Bot.start_link(__MODULE__, [], token)
  end

  def handle_connect(slack, state) do
    Logger.info("[SlackBot] Connected as #{slack.me.name}")

    {:ok, state}
  end

  def handle_event(message = %{type: "message"}, slack, state) do
    Logger.info("[SlackBot] New message from #{message.channel}: #{message.text}")
    send_message(message.text, message.channel, slack)

    {:ok, state}
  end

  def handle_event(_, _, state) do
    {:ok, state}
  end

  def handle_info({:message, text, channel}, slack, state) do
    Logger.info("[SlackBot] Send message to #{channel}: #{text}")
    send_message(text, channel, slack)

    {:ok, state}
  end

  def handle_info(_, _, state) do
    {:ok, state}
  end
end
