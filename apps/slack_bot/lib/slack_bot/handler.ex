defmodule SlackBot.Handler do
  use Slack

  require Logger

  alias Slack.Web.Conversations

  def handle_connect(slack, state) do
    Logger.info("[SlackBot] Connected as #{slack.me.name}")
    {:ok, init_slack(slack)}
  end

  def handle_event(message = %{type: "message"}, slack, state) do
    Logger.info("[SlackBot] New message from #{message.channel}: #{message.text}")
    send_message("New Message", message.channel, slack)
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

  defp init_slack(slack) do
    channels =
      Conversations.list()
      |> Map.fetch!("channels")
      |> Map.new(&{&1["id"], SlackBot.Util.atomize_keys(&1)})

    Map.put(slack, :channels, channels)
  end
end
